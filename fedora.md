https://askubuntu.com/a/1023182

Open `/usr/share/X11/xkb/keycodes/evdev`, search for `PGUP`. Find a group of keys with their corresponding codes:
```
	<INS> = 118;
	<HOME> = 110;
	<PGUP> = 112;
	<DELE> = 119;
	<END> = 115;
	<PGDN> = 117;
  ```
  
  Swap codes for `Home` with `PgUp`, and for `End` with `PgDown`
