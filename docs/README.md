Micro CORE Structure:

This is no emulated environment. 
It uses CD/DVD Sector system (2048bytes) per LBA.

NOTE: Theyre still 512bytes aligned. but uses LBA read instead of CHS load type

Category Acronyms:
	====-... > This is stored at the top of the sector
	----=... > Following code after 512/1024 bytes.
	-----... > New Sector
	~~~~~... > New Sector (Continued)

DATA MAP:

	====- BOOTLOADER -====
   ----= LOOKUP TABLE =----
    ----------------------
	====-   KERNEL   -====
	~~~~~~~~~~~~~~~~~~~~~~
	====-  OS (CLI)  -====

RESERVED MAP:

| Segment | Usage                          |
| ------- | ------------------------------ |
| `0000h` | IVT                            |
| `0040h` | BDA                            |
| `0500h` | (free - you can load LUT here) |
| `07C0h` | BIOS loads boot sector         |
| `0A00h` | VGA graphics                   |
| `B800h` | VGA text mode                  |
| `C000h` | Video BIOS                     |
| `F000h` | Main BIOS                      |


BOOTLOADER:
	LOAD ALL DATA REQUIRED. 