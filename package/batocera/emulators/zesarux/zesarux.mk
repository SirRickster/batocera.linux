#
# This file is part of the batocera distribution (https://batocera.org).
# Copyright (c) 2025+.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# YOU MUST KEEP THIS HEADER AS IT IS
#
################################################################################
#
# zesarux
# ZEsarUX - ZX Second-Emulator And Released for UniX by Cesar Hernandez Baño
# https://github.com/chernandezba/zesarux
#
# Emulated hardware:
# ZX80, ZX81, ZX Spectrum, QL, Amstrad CPC 464, CPC 4128, CPC 664, CPC 6128
# Amstrad PCW 8256, PCW 8512, Sam Coupe and others
#
################################################################################
# Version: 12

ZESARUX_VERSION = 96174b38ae7ccd9fea2f3a3c224c4341bfefd6e0
ZESARUX_SITE = $(call github,chernandezba,zesarux,$(ZESARUX_VERSION))
ZESARUX_LICENSE = GPLv3
ZESARUX_SUBDIR = src

define ZESARUX_PRE_CONFIGURE_BOOTSTRAP
    cd $(@D)/src && ./configure && make
endef

ZESARUX_PRE_CONFIGURE_HOOKS += ZESARUX_PRE_CONFIGURE_BOOTSTRAP

define ZESARUX_INSTALL_TARGET_CMDS
         mkdir -p $(TARGET_DIR)/usr/bin
         $(INSTALL) -m 0755 $(@D)/src/zesarux $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))