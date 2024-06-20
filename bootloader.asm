; bootloader.asm

org 0x7C00  ; BIOS loads boot sector at address 0x7C00

start:
    ; Display bootloader message
    mov si, boot_msg
    call print_string

    ; Load kernel from disk
    mov ah, 0x02        ; BIOS read sector function
    mov al, 1           ; Number of sectors to read
    mov ch, 0           ; Cylinder
    mov cl, 2           ; Sector number (start from sector 2)
    mov dh, 0           ; Head
    mov dl, 0x80        ; Drive number (first hard drive)
    mov bx, 0x8000      ; Segment:Offset address to load to (0x8000:0x0000)
    int 0x13            ; BIOS interrupt

    ; Check if read was successful
    jc read_error       ; If carry flag is set, jump to read_error

    ; Jump to the loaded kernel
    jmp 0x8000:0x0000   ; CS:IP = 0x8000:0x0000 (where kernel is loaded)

read_error:
    ; Display error message
    mov si, error_msg
    call print_string
    jmp $               ; Infinite loop if error occurs

print_string:
    ; Function to print a string from SI using BIOS interrupt
    mov ah, 0x0E        ; BIOS teletype output function
    next_char:
        lodsb           ; Load byte from SI into AL, increment SI
        cmp al, 0       ; Check for null terminator
        je done         ; If null terminator, exit
        int 0x10        ; BIOS interrupt to display character
        jmp next_char   ; Continue until null terminator
    done:
    ret

boot_msg db 'Welcome to My Bootloader!', 0x0D, 0x0A, 'Press 1 for Normal Boot, 2 for Recovery Mode', 0x0D, 0x0A, 0
error_msg db 'Error loading kernel', 0

times 510 - ($ - $$) db 0  ; Pad the rest of boot sector with zeros
dw 0xAA55                  ; Boot sector signature
