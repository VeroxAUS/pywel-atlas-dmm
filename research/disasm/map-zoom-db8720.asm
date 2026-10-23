0xdb8720: mov qword ptr [rsp + 8], rbx
0xdb8725: mov qword ptr [rsp + 0x18], rsi
0xdb872a: mov word ptr [rsp + 0x10], dx
0xdb872f: push rbp
0xdb8730: push rdi
0xdb8731: push r12
0xdb8733: push r14
0xdb8735: push r15
0xdb8737: mov rbp, rsp
0xdb873a: sub rsp, 0x80
0xdb8741: mov r14, r8
0xdb8744: mov rsi, rcx
0xdb8747: xor r15d, r15d
0xdb874a: mov dword ptr [rbp - 0x50], r15d
0xdb874e: cmp byte ptr [rip + 0x5ef3c93], r15b  ; [0x6cac3e8] = runtime global (no file value)
0xdb8755: jne 0x140db875e
0xdb8757: xor al, al
0xdb8759: jmp 0x140db888b
0xdb875e: lea r12, [rip + 0x48b77bb]  ; [0x566ff20] = 6.96105 (0x40dec0f0)
0xdb8765: mov qword ptr [rbp - 0x28], r12
0xdb8769: lea rax, [rip + 0x48b77d0]  ; [0x566ff40] = 6.86002 (0x40db8540)
0xdb8770: mov qword ptr [rbp - 0x28], rax
0xdb8774: mov eax, 0xffff
0xdb8779: mov word ptr [rbp - 0x20], ax
0xdb877d: mov qword ptr [rbp - 0x18], 0xffffffffffffffff
0xdb8785: mov byte ptr [rbp - 0x10], 0x15
0xdb8789: xor eax, eax
0xdb878b: mov dword ptr [rbp - 0xf], eax
0xdb878e: mov word ptr [rbp - 0xb], ax
0xdb8792: mov byte ptr [rbp - 9], al
0xdb8795: mov dword ptr [rbp - 8], r15d
0xdb8799: mov word ptr [rbp - 0x20], dx
0xdb879d: movzx eax, byte ptr [r8 + 8]
0xdb87a2: mov byte ptr [rbp - 0x10], al
0xdb87a5: mov rax, qword ptr [r8]
0xdb87a8: mov qword ptr [rbp - 0x18], rax
0xdb87ac: mov dword ptr [rbp - 8], r9d
0xdb87b0: mov rax, qword ptr [rcx]
0xdb87b3: call qword ptr [rax + 0x110]
0xdb87b9: mov rcx, qword ptr [rax + 0xb0]
0xdb87c0: mov qword ptr [rbp - 0x48], r15
0xdb87c4: mov qword ptr [rbp - 0x40], r15
0xdb87c8: mov qword ptr [rbp - 0x38], r15
0xdb87cc: mov word ptr [rbp - 0x30], 0
0xdb87d2: mov qword ptr [rbp - 0x48], rsi
0xdb87d6: lea rax, [rip + 0x301d3]  ; [0xde89b0] = 5.72061 (0x40b70f41)
0xdb87dd: mov qword ptr [rbp - 0x40], rax
0xdb87e1: mov byte ptr [rbp - 0x30], 0
0xdb87e5: mov ebx, 1
0xdb87ea: mov dword ptr [rbp - 0x50], ebx
0xdb87ed: movzx eax, byte ptr [rbp + 0x50]
0xdb87f1: mov byte ptr [rsp + 0x20], al
0xdb87f5: lea r9, [rbp - 0x48]
0xdb87f9: lea r8, [rbp - 0x28]
0xdb87fd: lea rdx, [rip + 0x5f177dc]  ; [0x6ccffe0] = runtime global (no file value)
0xdb8804: call 0x143d20850
0xdb8809: movzx edi, al
0xdb880c: and ebx, 0xfffffffe
0xdb880f: mov dword ptr [rbp - 0x50], ebx
0xdb8812: cmp byte ptr [rbp - 0x2f], 0
0xdb8816: je 0x140db884a
0xdb8818: mov rcx, qword ptr [rbp - 0x48]
0xdb881c: test rcx, rcx
0xdb881f: je 0x140db884a
0xdb8821: mov r8d, 0x1fd
0xdb8827: mov rax, qword ptr gs:[0x58]
0xdb8830: mov rdx, qword ptr [rax]
0xdb8833: cmp byte ptr [r8 + rdx], 0
0xdb8838: je 0x140db8841
0xdb883a: call 0x1447f03bc
0xdb883f: jmp 0x140db8846
0xdb8841: call 0x1447f02bc
0xdb8846: mov qword ptr [rbp - 0x48], r15
0xdb884a: mov byte ptr [rbp - 0x2f], 0
0xdb884e: mov qword ptr [rbp - 0x48], r15
0xdb8852: mov qword ptr [rbp - 0x40], r15
0xdb8856: mov qword ptr [rbp - 0x38], r15
0xdb885a: mov byte ptr [rbp - 0x2f], 0
0xdb885e: lea rcx, [rbp - 0x48]
0xdb8862: call 0x14035f1f0
0xdb8867: test dil, dil
0xdb886a: je 0x140db8883
0xdb886c: lea rcx, [rbp + 0x38]
0xdb8870: call 0x140537250
0xdb8875: mov r8, r14
0xdb8878: mov edx, dword ptr [rax]
0xdb887a: mov rcx, rsi
0xdb887d: call 0x140df5250
0xdb8882: nop 
0xdb8883: mov qword ptr [rbp - 0x28], r12
0xdb8887: movzx eax, dil
0xdb888b: lea r11, [rsp + 0x80]
0xdb8893: mov rbx, qword ptr [r11 + 0x30]
0xdb8897: mov rsi, qword ptr [r11 + 0x40]
0xdb889b: mov rsp, r11
0xdb889e: pop r15
0xdb88a0: pop r14
0xdb88a2: pop r12
0xdb88a4: pop rdi
0xdb88a5: pop rbp
0xdb88a6: ret 
0xdb88a7: int3 