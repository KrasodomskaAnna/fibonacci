.686
.model flat
public _fib
.code

_fib PROC
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]		; wpisanie parametru z C

	cmp eax, 1
	je jeden

	cmp eax, 2
	je jeden

	cmp eax, 47
	ja error

	; a > 1
	mov ebx, eax			; kopia
	sub eax, 1				; a-1
	
	push ebx

	push eax
	call _fib				; w eax (a-1)
	add esp, 4

	pop ebx

	; eax := f(a-1)			ebx := a
	xchg ebx, eax
	; eax := a				ebx := f(a-1)

	sub eax, 2
	push ebx
	
	push eax
	call _fib				; w eax (a-2)
	add esp, 4

	pop ebx

	; eax := f(a-2)			ebx := f(a-1)
	add eax, ebx

	return:
		pop ebp
		ret

	jeden:
		mov eax, 1
		jmp return

	error:
		mov eax, -1
		jmp return

_fib ENDP

END