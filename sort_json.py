#!/usr/bin/env python
import sys
import json

def main():
    infile = sys.stdin
    outfile = sys.stdout
    with infile:
        try:
            obj = json.load(infile)
        except ValueError, e:
            raise SystemExit(e)
    obj["apps"].sort(key=lambda app: app["id"])
    with outfile:
        json.dump(obj, outfile, sort_keys=True,
                  indent=4, separators=(',', ': '))
        outfile.write('\n')


if __name__ == '__main__':
    main()
