0x3edee50: mov qword ptr [rsp + 8], rbx
0x3edee55: mov qword ptr [rsp + 0x10], rbp
0x3edee5a: mov qword ptr [rsp + 0x18], rsi
0x3edee5f: mov qword ptr [rsp + 0x20], rdi
0x3edee64: push r14
0x3edee66: sub rsp, 0x50
0x3edee6a: mov rsi, rcx
0x3edee6d: mov rax, qword ptr [rcx + 0xa0]
0x3edee74: xor r14d, r14d
0x3edee77: test rax, rax
0x3edee7a: je 0x143edef79
0x3edee80: mov rcx, qword ptr [rax]
0x3edee83: test rcx, rcx
0x3edee86: je 0x143edef79
0x3edee8c: mov byte ptr [rcx + 0x19], 1
0x3edee90: mov ebx, r14d
0x3edee93: mov qword ptr [rsp + 0x20], rbx
0x3edee98: mov r8d, r14d
0x3edee9b: mov qword ptr [rsp + 0x28], r14
0x3edeea0: mov rdx, qword ptr [rsi + 0x20]
0x3edeea4: mov rax, qword ptr [rdx]
0x3edeea7: mov rcx, qword ptr [rax + 0xa0]
0x3edeeae: test rcx, rcx
0x3edeeb1: je 0x143edeeb9
0x3edeeb3: cmp qword ptr [rcx + 8], r14
0x3edeeb7: jne 0x143edeed1
0x3edeeb9: mov rdx, qword ptr [rdx + 8]
0x3edeebd: lea rcx, [rsp + 0x20]
0x3edeec2: call 0x1408447d0
0x3edeec7: mov r8d, dword ptr [rsp + 0x28]
0x3edeecc: mov rbx, qword ptr [rsp + 0x20]
0x3edeed1: mov rax, qword ptr [rsi + 0xa0]
0x3edeed8: mov rcx, qword ptr [rax]
0x3edeedb: mov r9, qword ptr [rcx + 0x10]
0x3edeedf: mov r10d, dword ptr [r9 + 8]
0x3edeee3: test r10d, r10d
0x3edeee6: jne 0x143edeeed
0x3edeee8: test r8d, r8d
0x3edeeeb: je 0x143edef44
0x3edeeed: mov r9, qword ptr [r9]
0x3edeef0: cmp r8d, r10d
0x3edeef3: jne 0x143edef1c
0x3edeef5: mov edx, r14d
0x3edeef8: test r8d, r8d
0x3edeefb: je 0x143edef44
0x3edeefd: nop dword ptr [rax]
0x3edef00: mov eax, edx
0x3edef02: lea rcx, [rax*4]
0x3edef0a: mov eax, dword ptr [rcx + r9]
0x3edef0e: cmp dword ptr [rcx + rbx], eax
0x3edef11: jne 0x143edef1c
0x3edef13: inc edx
0x3edef15: cmp edx, r8d
0x3edef18: jb 0x143edef00
0x3edef1a: jmp 0x143edef44
0x3edef1c: mov qword ptr [rsp + 0x30], r9
0x3edef21: mov dword ptr [rsp + 0x38], r10d
0x3edef26: mov qword ptr [rsp + 0x40], rbx
0x3edef2b: mov dword ptr [rsp + 0x48], r8d
0x3edef30: lea r8, [rsp + 0x30]
0x3edef35: lea rdx, [rsp + 0x40]
0x3edef3a: mov rcx, qword ptr [rsi + 0x20]
0x3edef3e: call 0x1435ca4f0
0x3edef43: nop 
0x3edef44: test rbx, rbx
0x3edef47: je 0x143edef6f
0x3edef49: mov ecx, 0x1fd
0x3edef4e: mov rax, qword ptr gs:[0x58]
0x3edef57: mov rdx, qword ptr [rax]
0x3edef5a: cmp byte ptr [rcx + rdx], 0
0x3edef5e: mov rcx, rbx
0x3edef61: je 0x143edef6a
0x3edef63: call 0x1447f03bc
0x3edef68: jmp 0x143edef6f
0x3edef6a: call 0x1447f02bc
0x3edef6f: mov qword ptr [rsp + 0x20], r14
0x3edef74: mov qword ptr [rsp + 0x28], r14
0x3edef79: mov rax, qword ptr [rsi + 0xa0]
0x3edef80: test rax, rax
0x3edef83: je 0x143edef8c
0x3edef85: cmp qword ptr [rax + 8], 0
0x3edef8a: jne 0x143edefaf
0x3edef8c: mov rax, qword ptr [rsi + 0x20]
0x3edef90: mov rbx, qword ptr [rax + 0x30]
0x3edef94: test rbx, rbx
0x3edef97: je 0x143edefaf
0x3edef99: lea rcx, [rbx + 0x70]
0x3edef9d: call 0x143582ac0
0x3edefa2: mov dword ptr [rbx + 0x88], r14d
0x3edefa9: inc dword ptr [rbx + 0x90]
0x3edefaf: mov rbx, qword ptr [rsi + 0xa0]
0x3edefb6: test rbx, rbx
0x3edefb9: je 0x143edf000
0x3edefbb: mov eax, dword ptr [rbx + 0x40]
0x3edefbe: test eax, eax
0x3edefc0: je 0x143edf000
0x3edefc2: mov rbx, qword ptr [rbx + 0x38]
0x3edefc6: lea rbp, [rbx + rax*8]
0x3edefca: cmp rbx, rbp
0x3edefcd: je 0x143edf000
0x3edefcf: nop 
0x3edefd0: mov rdi, qword ptr [rbx]
0x3edefd3: test rdi, rdi
0x3edefd6: je 0x143edeff7
0x3edefd8: mov rdi, qword ptr [rdi + 0x18]
0x3edefdc: test rdi, rdi
0x3edefdf: je 0x143edeff7
0x3edefe1: lea rcx, [rdi + 0x70]
0x3edefe5: call 0x143582ac0
0x3edefea: mov dword ptr [rdi + 0x88], r14d
0x3edeff1: inc dword ptr [rdi + 0x90]
0x3edeff7: add rbx, 8
0x3edeffb: cmp rbx, rbp
0x3edeffe: jne 0x143edefd0
0x3edf000: mov rax, qword ptr [rsi + 0xa0]
0x3edf007: test rax, rax
0x3edf00a: je 0x143edf013
0x3edf00c: cmp qword ptr [rax + 8], 0
0x3edf011: jne 0x143edf052
0x3edf013: mov rbx, qword ptr [rsi + 0xd8]
0x3edf01a: test rbx, rbx
0x3edf01d: jne 0x143edf03a
0x3edf01f: test rax, rax
0x3edf022: je 0x143edf052
0x3edf024: mov rcx, qword ptr [rax + 0x58]
0x3edf028: test rcx, rcx
0x3edf02b: je 0x143edf052
0x3edf02d: call 0x143ed84d0
0x3edf032: mov rbx, rax
0x3edf035: test rax, rax
0x3edf038: je 0x143edf052
0x3edf03a: mov rax, qword ptr [rbx]
0x3edf03d: mov rcx, rbx
0x3edf040: call qword ptr [rax + 0x170]
0x3edf046: mov rax, qword ptr [rbx]
0x3edf049: mov rcx, rbx
0x3edf04c: call qword ptr [rax + 0x180]
0x3edf052: mov rbx, qword ptr [rsi + 0x40]
0x3edf056: mov eax, dword ptr [rsi + 0x48]
0x3edf059: lea rdi, [rbx + rax*8]
0x3edf05d: cmp rbx, rdi
0x3edf060: je 0x143edf073
0x3edf062: mov rcx, qword ptr [rbx]
0x3edf065: call 0x143edee50
0x3edf06a: add rbx, 8
0x3edf06e: cmp rbx, rdi
0x3edf071: jne 0x143edf062
0x3edf073: mov rbx, qword ptr [rsp + 0x60]
0x3edf078: mov rbp, qword ptr [rsp + 0x68]
0x3edf07d: mov rsi, qword ptr [rsp + 0x70]
0x3edf082: mov rdi, qword ptr [rsp + 0x78]
0x3edf087: add rsp, 0x50
0x3edf08b: pop r14
0x3edf08d: ret 