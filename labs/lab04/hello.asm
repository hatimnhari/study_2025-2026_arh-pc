; hello.asm
SECTION .data              ; Начало секции данных
    hello: DB 'Hello world!',10 ; строка + перевод строки
    helloLen: EQU $-hello       ; длина строки

SECTION .text              ; Начало секции кода
    GLOBAL _start

_start:                    ; Точка входа в программу
    mov eax,4              ; sys_write
    mov ebx,1              ; stdout
    mov ecx,hello          ; адрес строки
    mov edx,helloLen       ; длина строки
    int 80h                ; вызов ядра

    mov eax,1              ; sys_exit
    mov ebx,0              ; код возврата 0
    int 80h                ; вызов ядра
