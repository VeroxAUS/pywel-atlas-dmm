0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 