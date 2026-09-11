"""Download the pinned OpenAPI schemas listed in versions.json."""
import argparse
import json
from pathlib import Path
from tempfile import NamedTemporaryFile
from urllib.error import HTTPError
from urllib.request import Request, urlopen

root = Path(__file__).resolve().parent
versions = json.loads((root / 'versions.json').read_text())

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('versions', nargs='*', choices=versions)
    parser.add_argument('--output-dir', type=Path, default=root,
                        help='Directory where schemas are written (default: script directory)')
    args = parser.parse_args()
    output_dir = args.output_dir

    for version in args.versions or list(versions):
        config = versions[version]
        target = output_dir / config['schema']
        target.parent.mkdir(parents=True, exist_ok=True)
        etag_path = target.with_suffix(target.suffix + '.etag')
        headers = {'If-None-Match': etag_path.read_text().strip()} if target.exists() and etag_path.exists() else {}
        try:
            with urlopen(Request(config['url'], headers=headers), timeout=30) as response, NamedTemporaryFile(
                dir=target.parent, prefix=f'.{target.name}.', delete=False
            ) as temporary:
                data = response.read()
                json.loads(data)
                temporary.write(data)
                temporary_path = Path(temporary.name)
                etag = response.headers.get('ETag')
        except HTTPError as error:
            if error.code != 304:
                raise
            print(f'{version} schema is unchanged at {target}', flush=True)
            continue
        temporary_path.replace(target)
        if etag:
            etag_path.write_text(etag + '\n')
        else:
            etag_path.unlink(missing_ok=True)
        print(f'Downloaded {version} schema to {target}', flush=True)


if __name__ == '__main__':
    main()
