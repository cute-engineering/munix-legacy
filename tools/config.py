#!/usr/bin/env python3

import sys
import kconfiglib
import menuconfig
import argparse

kconfig = kconfiglib.Kconfig("Kconfig")


def generate_header(dest):
    kconfig.load_config('.config')
    kconfig.write_autoconf(
        dest, '#ifndef _MUNIX_COMMON_CONFIG_H\n'
              '#define _MUNIX_COMMON_CONFIG_H\n\n')
    # a bit hacky but there is no other way and I really hate '#pragma once'
    with open(dest, 'a') as f:
        f.write('\n#endif /* !_MUNIX_COMMON_CONFIG_H */\n')


def defconfig():
    kconfig.write_config()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--genheader', action='store', default=None)
    parser.add_argument('--menuconfig', action='store_true')
    parser.add_argument('--defconfig', action='store_true')
    args = parser.parse_args()

    if args.genheader is not None:
        generate_header(args.genheader)

    if args.menuconfig:
        menuconfig.menuconfig(kconfig)

    if args.defconfig:
        defconfig()
