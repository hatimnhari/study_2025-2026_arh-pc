;--------------------------------
; Программа вычисления выражения
; f(x) = 5(x + 18) - 28
;--------------------------------

%include 'in_out.asm'

SECTION .data
msg_expr: DB 'Выражение: f(x) = 5(x + 18) - 28',0
msg_input: DB 'Введите значение x: ',0
msg_result: DB 'Результат: ',0

SECTION .bss
x: RESB 80
result: RESB 80

SECTION .text
    GLOBAL _start
_start:

; ---- Вывод выражения
mov eax, msg_expr
call sprintLF

; ---- Ввод значения x
mov eax, msg_input
call sprint

mov ecx, x
mov edx, 80
call sread

; ---- Преобразование x из ASCII в число
mov eax, x
call atoi
mov ebx, eax        ; сохраняем x в ebx

; ---- Вычисление f(x) = 5(x + 18) - 28
; Шаг 1: x + 18
add eax, 18         ; eax = x + 18

; Шаг 2: 5 * (x + 18)
mov ecx, 5
mul ecx             ; eax = 5 * (x + 18)

; Шаг 3: результат - 28
sub eax, 28         ; eax = 5(x + 18) - 28

; ---- Вывод результата
mov edi, eax        ; сохраняем результат в edi

mov eax, msg_result
call sprint

mov eax, edi
call iprintLF

call quit
