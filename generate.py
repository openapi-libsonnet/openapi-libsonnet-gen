"""Generate one or all versioned libraries from the pinned local schemas."""
import argparse
import json
from pathlib import Path
import subprocess

root = Path(__file__).resolve().parent
versions = json.loads((root / 'versions.json').read_text())

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('versions', nargs='*', choices=versions)
    parser.add_argument('--output-dir', type=Path, default=root,
                        help='Directory where versioned libraries are written (default: script directory)')
    args = parser.parse_args()
    output_dir = args.output_dir
    for version in args.versions or list(versions):
        config = versions[version]
        raw = subprocess.check_output([
            'jsonnet', '-S', '-J', 'vendor', config['generator'],
            '--tla-code-file', 'schema=' + config['schema'],
        ], cwd=root)
        formatted = subprocess.check_output(['jsonnetfmt', '-'], input=raw, cwd=root)
        target = output_dir / version / 'main.libsonnet'
        target.parent.mkdir(parents=True, exist_ok=True)
        temporary = target.with_suffix('.tmp')
        temporary.write_bytes(formatted)
        temporary.replace(target)
        print(f'Generated {target} ({config["revision"]})', flush=True)


if __name__ == '__main__':
    main()
