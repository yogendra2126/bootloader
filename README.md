# Bootloader Project

## Project Description
The Bootloader Project is a simple implementation of a bootloader for loading a kernel or operating system from a disk or disk image. It includes basic functionality such as displaying a boot menu, loading a kernel from disk, and allowing the user to select different boot options.

## How to Run the Project
### Dependencies
- NASM (Netwide Assembler)
- genisoimage (or mkisofs)

### Steps
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yogendra2126/bootloader
   cd bootloader-project
2. **Build the Project**
    ```bash
    make
    ```
    This will assemble the bootloader, compile the kernel (if applicable), and create a bootable image (**'bootable_image.bin'** and **'bootable_image.iso'**).
3. **Run on Virtual Machine:**
   - Use VirtualBox, QEMU, or another virtualization software.
   - Create a new virtual machine and boot from `bootable_image.iso` or `bootable_image.bin`.
4. **Run on Real Hardware (Optional):**
   - Write `bootable_image.bin` to a USB drive using `dd` (Linux) or Win32 Disk Imager (Windows).
   - Boot your computer from this USB drive.
## Internal Working of the Project
The bootloader is implemented in assembly language (`bootloader.asm`) and loads a kernel (`kernel.bin`) from disk or memory. Upon boot, it displays a simple text-based menu allowing the user to choose between different boot options, such as normal boot or recovery mode.
## Learning Takeaways
- Understanding the boot process of a computer.
- Working with low-level programming and assembly language.
- Implementing basic file system support and menu navigation.
## Resources/References
- NASM documentation: [NASM Manual](https://www.nasm.us/doc/)
- ISO 9660 (CD-ROM filesystem) specification for creating bootable ISO images.
- Stack Overflow and online forums for troubleshooting and learning from community discussions.
