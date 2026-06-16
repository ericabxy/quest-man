# Quest-Man: Quest of the Man

Quest-Man is an experiment with tile-based collision detection and resolution using "unit space" and tile-aligned coordinates. Floating-point math represents sub-unit positioning and "math.floor" is called to determine unit-space positions.

## Getting Started

1. Locate your RetroArch Downloads directory and make sure the file "Quest-Man.lutro" is saved there.
2. If you have not already, start RetroArch using your desktop launcher or command-line interface.
3. Using your RetroPad, navigate to the RetroArch Main Menu and select "Load Content".
4. Navigate to "Downloads" and select "Quest-Man.lutro" from the list.
5. If you're asked which core to select, choose "Lua Engine (Lutro)".

## Developers

### Running the Latest Release from the Git Repository

Quest Man can be run directly from the source code repository. First, clone the remote Git repository. The following command retrieves Quest Man from the GitHub address.

    git clone https://github.com/ericabxy/quest-man

If you don't already have Lutro installed as a LibRetro core, you can initialize the Lutro submodule that's included with Quest Man.

    git submodule init
    git submodule update

Then build Lutro with the following command.

    make -C libretro-lutro

Finally, assuming you already have RetroArch installed on your computer, run RetroArch with the command-line option to load the included Lutro build as a LibRetro core.

    retroarch -L libretro-lutro/lutro_libretro.so .

If you plan to make any changes and commit them to the Git repository, make sure to clean the local Lutro build first.

    make -C libretro-lutro clean
