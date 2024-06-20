; kernel.asm

org 0x8000  ; Kernel entry point

start:
    ; Your kernel code here

    ; Example: Print message to screen
    mov si, hello_msg
    call print_string

    ; Endless loop
    jmp $

print_string:
    ; Function to print a string from SI using BIOS interrupt
    mov ah, 0x0E        ; BIOS teletype output function
next_char:
    lodsb               ; Load byte from SI into AL, increment SI
    cmp al, 0           ; Check for null terminator
    je done             ; If null terminator, exit
    int 0x10            ; BIOS interrupt to display character
    jmp next_char       ; Continue until null terminator
done:
    ret

hello_msg db 'Hello from Kernel!', 0

times 512 - ($ - $$) db 0  ; Ensure kernel binary is 512 bytes