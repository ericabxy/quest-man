RETROARCH = retroarch
ZIP = zip

normal: libretro-lutro/lutro_libretro.so

libretro-lutro/lutro_libretro.so:
	make -C libretro-lutro

run: libretro-lutro/lutro_libretro.so
	$(RETROARCH) -L libretro-lutro/lutro_libretro.so .

clean:
	make -C libretro-lutro clean
