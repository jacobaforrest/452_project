ENSC 452
Group 3
Jacob Forrest - 301360304
Chris Rosenauer - 301400868

Project: Snake

For information on running this project see section 3.2 User Manual in the group report.

Design Tree
/audio/
	The /audio/ directory includes the source audio in the form of MP3 files and unsigned 32 bit integer arrays.
	
/core0/
	The /core0/ directory includes the source code files for graphics rendering, gameplay, and menu navigation. It also includes the linker script for the Vitis application project.
	
/core1/
	The /core1/ directory includes the source code files for outputting background music and sound effects. It also includes the linker script for the Vitis application project.
	
/graphics/
	The /graphics/ directory includes the source graphics used in the project. The image file formats vary between .bmp and .png images.
	
/helper/
	The /helper/ directory includes MATLAB helper scripts used to convert graphical and audio data into constant arrays stored in C++ header files.
	
/IP/
	The /IP/ directory contains the source for the hardware blocks used in this project, which were not provided through Vivado.
	
	RNG_1.0
		The /RNG_1.0/ subdirectory includes the source code for the LFSR pseudo-random number generator created for this project.
	vga_controller_ip
		The /vga_controller_pi/ subdirectory includes the source code for the VGA controller used in this project, which was provided by the VGA tutorial.
	zed_audio_ctrl
		The /zed_audio_ctrl/ subdirectory includes the source for the audio controller used in this project, which was provided by the Audio tutorial.
		
/VivadoProject/
	The directory /VivadoProject/ includes Vivado hardware project, developed for and used in this project, and project’s exported bitstream, audio_backup.xsa.
