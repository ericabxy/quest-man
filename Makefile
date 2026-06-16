RETROARCH = retroarch
ZIP = zip

normal:
	make -C libretro-lutro

run:
	$(RETROARCH) -L libretro-lutro/lutro_libretro.so .

clean:
	make -C libretro-lutro clean
