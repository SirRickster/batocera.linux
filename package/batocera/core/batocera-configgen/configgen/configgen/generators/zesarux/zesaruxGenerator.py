from __future__ import annotations

import shutil
import zipfile
from pathlib import Path
from typing import TYPE_CHECKING, Final

from ... import Command
from ...controller import generate_sdl_game_controller_config
from ...exceptions import BatoceraException
from ..Generator import Generator

if TYPE_CHECKING:
    from ...types import HotkeysContext

_ZESARUX_CONFIG: Final = CONFIGS / "zesarux"
_ZESARUX_CONFIG_FILE: Final = _ZESARUX_CONFIG / "zesarux_config.txt"

class ZesaruxGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        mkdir_if_not_exists(_ZESARUX_CONFIG)

        commandArray = ["zesarux", romzip,  "--configfile " _ZESARUX_CONFIG_FILE]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': generate_sdl_game_controller_config(playersControllers)
            })

    def getHotkeysContext(self) -> HotkeysContext:
        return {
            "name": "clk",
            "keys": { "exit": ["KEY_LEFTALT", "KEY_F4"] }
        }
