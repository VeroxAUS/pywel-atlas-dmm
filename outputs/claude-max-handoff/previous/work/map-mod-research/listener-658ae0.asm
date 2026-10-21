0x658ae0: mov qword ptr [rsp + 0x18], rbx
0x658ae5: mov qword ptr [rsp + 0x10], rdx
0x658aea: mov qword ptr [rsp + 8], rcx
0x658aef: push rbp
0x658af0: push rsi
0x658af1: push rdi
0x658af2: push r12
0x658af4: push r13
0x658af6: push r14
0x658af8: push r15
0x658afa: mov rbp, rsp
0x658afd: sub rsp, 0x70
0x658b01: mov rdi, r9
0x658b04: mov rbx, r8
0x658b07: xor r14d, r14d
0x658b0a: lea rdx, [rbp - 0x48]
0x658b0e: mov rcx, qword ptr [rip + 0x671067b]
0x658b15: mov rcx, qword ptr [rcx + 0x30]
0x658b19: call 0x1408b44e0
0x658b1e: nop 
0x658b1f: cmp byte ptr [rbp - 0x38], r14b
0x658b23: jne 0x140658b2d
0x658b25: xor sil, sil
0x658b28: jmp 0x140658e06
0x658b2d: mov edx, 0x1ec
0x658b32: mov rax, qword ptr gs:[0x58]
0x658b3b: mov rcx, qword ptr [rax]
0x658b3e: cmp byte ptr [rdx + rcx], 0
0x658b42: mov rdx, qword ptr [rip + 0x67109e7]
0x658b49: jne 0x140658b52
0x658b4b: mov rdx, qword ptr [rip + 0x67109d6]
0x658b52: mov rax, qword ptr [rdx]
0x658b55: mov rcx, qword ptr [rax + 8]
0x658b59: mov r13, qword ptr [rcx + 0x1c0]
0x658b60: mov rcx, qword ptr [rax + 8]
0x658b64: mov r8, rbx
0x658b67: lea rdx, [rbp + 0x48]
0x658b6b: mov rcx, qword ptr [rcx + 0x310]
0x658b72: call 0x141789770
0x658b77: movzx ebx, word ptr [rbp + 0x48]
0x658b7b: mov r15d, ebx
0x658b7e: mov eax, 0xffff
0x658b83: cmp ebx, eax
0x658b85: je 0x140658d65
0x658b8b: mov rax, qword ptr [rbp - 0x40]
0x658b8f: mov rcx, qword ptr [rax + 0x68]
0x658b93: mov rax, qword ptr [rcx + 0x188]
0x658b9a: mov rsi, qword ptr [rax + 0x18]
0x658b9e: lea rdx, [rsi + 8]
0x658ba2: test rsi, rsi
0x658ba5: cmove rdx, r14
0x658ba9: mov rdx, qword ptr [rdx]
0x658bac: lea rcx, [rbp + 0x48]
0x658bb0: call 0x140393df0
0x658bb5: nop 
0x658bb6: cmp dword ptr [rsi + 0x28], ebx
0x658bb9: jbe 0x140658d59
0x658bbf: imul r12, rbx, 0x1c8
0x658bc6: mov rbx, qword ptr [rsi + 0x20]
0x658bca: add rbx, r12
0x658bcd: je 0x140658d59
0x658bd3: movzx ebx, byte ptr [rbx + 0x1c]
0x658bd7: mov rcx, qword ptr [rbp + 0x48]
0x658bdb: mov rax, qword ptr [rcx]
0x658bde: mov dl, 1
0x658be0: call qword ptr [rax + 0x20]
0x658be3: test bl, bl
0x658be5: jne 0x140658d65
0x658beb: mov rax, qword ptr [rbp - 0x40]
0x658bef: mov rcx, qword ptr [rax + 0x68]
0x658bf3: mov rax, qword ptr [rcx + 0x188]
0x658bfa: mov rbx, qword ptr [rax + 0x18]
0x658bfe: lea rdx, [rbx + 8]
0x658c02: test rbx, rbx
0x658c05: cmove rdx, r14
0x658c09: mov rdx, qword ptr [rdx]
0x658c0c: lea rcx, [rbp + 0x48]
0x658c10: call 0x140393df0
0x658c15: nop 
0x658c16: cmp dword ptr [rbx + 0x28], r15d
0x658c1a: jbe 0x140658c2b
0x658c1c: mov rbx, qword ptr [rbx + 0x20]
0x658c20: add rbx, r12
0x658c23: je 0x140658c2b
0x658c25: mov rbx, qword ptr [rbx + 0x10]
0x658c29: jmp 0x140658c32
0x658c2b: mov rbx, qword ptr [rip + 0x66852de]
0x658c32: mov rcx, qword ptr [rbp + 0x48]
0x658c36: mov rax, qword ptr [rcx]
0x658c39: mov dl, 1
0x658c3b: call qword ptr [rax + 0x20]
0x658c3e: cmp byte ptr [rbx + 5], 0
0x658c42: jne 0x140658d65
0x658c48: movzx eax, byte ptr [rbx + 6]
0x658c4c: cmp al, 4
0x658c4e: je 0x140658d65
0x658c54: test rdi, rdi
0x658c57: je 0x140658d51
0x658c5d: cmp al, 3
0x658c5f: jne 0x140658cb3
0x658c61: movzx eax, word ptr [r13 + 0xf6]
0x658c69: mov word ptr [rbp + 0x48], ax
0x658c6d: lea rcx, [rbp + 0x48]
0x658c71: call 0x140389080
0x658c76: mov rcx, qword ptr [rax + 0x18]
0x658c7a: mov rax, qword ptr [rcx]
0x658c7d: xor edx, edx
0x658c7f: call qword ptr [rax + 8]
0x658c82: mov edx, dword ptr [rdi + 0x110]
0x658c88: mov dword ptr [rdi + 0x114], 0xffffffff
0x658c92: mov rcx, qword ptr [rdi + 0x108]
0x658c99: test rcx, rcx
0x658c9c: cmovne rdi, rcx
0x658ca0: mov r8, rax
0x658ca3: mov rcx, rdi
0x658ca6: call 0x141424a80
0x658cab: mov sil, 2
0x658cae: jmp 0x140658e06
0x658cb3: mov rcx, rbx
0x658cb6: call 0x140430150
0x658cbb: lea rcx, [rax + 0x24]
0x658cbf: mov eax, 0xffff
0x658cc4: cmp word ptr [rcx], ax
0x658cc7: jne 0x140658cd2
0x658cc9: lea rbx, [rip + 0x4f1a7dc]
0x658cd0: jmp 0x140658cff
0x658cd2: call 0x140433650
0x658cd7: lea rdx, [rbp - 0x28]
0x658cdb: mov rcx, qword ptr [rax + 0x88]
0x658ce2: call 0x142424250
0x658ce7: nop 
0x658ce8: mov rcx, qword ptr [rax]
0x658ceb: mov rax, qword ptr [rcx]
0x658cee: xor edx, edx
0x658cf0: call qword ptr [rax + 8]
0x658cf3: mov rbx, rax
0x658cf6: lea rcx, [rbp - 0x10]
0x658cfa: call 0x140394db0
0x658cff: mov qword ptr [rbp + 0x40], rbx
0x658d03: movzx eax, word ptr [r13 + 0xf2]
0x658d0b: mov word ptr [rbp + 0x48], ax
0x658d0f: lea rcx, [rbp + 0x48]
0x658d13: call 0x140389080
0x658d18: mov rcx, qword ptr [rax + 0x18]
0x658d1c: mov rax, qword ptr [rcx]
0x658d1f: xor edx, edx
0x658d21: call qword ptr [rax + 8]
0x658d24: mov edx, dword ptr [rdi + 0x110]
0x658d2a: mov dword ptr [rdi + 0x114], 0xffffffff
0x658d34: mov rcx, qword ptr [rdi + 0x108]
0x658d3b: test rcx, rcx
0x658d3e: cmovne rdi, rcx
0x658d42: lea r9, [rbp + 0x40]
0x658d46: mov r8, rax
0x658d49: mov rcx, rdi
0x658d4c: call 0x14035ee40
0x658d51: mov sil, 2
0x658d54: jmp 0x140658e06
0x658d59: mov rcx, qword ptr [rbp + 0x48]
0x658d5d: mov rax, qword ptr [rcx]
0x658d60: mov dl, 1
0x658d62: call qword ptr [rax + 0x20]
0x658d65: mov rax, qword ptr [rbp - 0x40]
0x658d69: lea rdx, [rax + 8]
0x658d6d: test rax, rax
0x658d70: cmove rdx, r14
0x658d74: mov rdx, qword ptr [rdx]
0x658d77: lea rcx, [rbp + 0x40]
0x658d7b: call 0x140393df0
0x658d80: nop 
0x658d81: mov rax, qword ptr [rbp - 0x40]
0x658d85: mov rcx, qword ptr [rax + 0x68]
0x658d89: mov rax, qword ptr [rcx + 0x120]
0x658d90: cmp byte ptr [rax + 0x18], 0
0x658d94: je 0x140658df7
0x658d96: test rdi, rdi
0x658d99: je 0x140658de6
0x658d9b: movzx eax, word ptr [r13 + 0xcc]
0x658da3: mov word ptr [rbp + 0x48], ax
0x658da7: lea rcx, [rbp + 0x48]
0x658dab: call 0x140389080
0x658db0: mov rcx, qword ptr [rax + 0x18]
0x658db4: mov rax, qword ptr [rcx]
0x658db7: xor edx, edx
0x658db9: call qword ptr [rax + 8]
0x658dbc: mov edx, dword ptr [rdi + 0x110]
0x658dc2: mov dword ptr [rdi + 0x114], 0xffffffff
0x658dcc: mov r8, qword ptr [rdi + 0x108]
0x658dd3: test r8, r8
0x658dd6: cmovne rdi, r8
0x658dda: mov r8, rax
0x658ddd: mov rcx, rdi
0x658de0: call 0x141424a80
0x658de5: nop 
0x658de6: mov rcx, qword ptr [rbp + 0x40]
0x658dea: mov rax, qword ptr [rcx]
0x658ded: mov dl, 1
0x658def: call qword ptr [rax + 0x20]
0x658df2: mov sil, 2
0x658df5: jmp 0x140658e06
0x658df7: mov rcx, qword ptr [rbp + 0x40]
0x658dfb: mov rax, qword ptr [rcx]
0x658dfe: mov dl, 1
0x658e00: call qword ptr [rax + 0x20]
0x658e03: mov sil, 4
0x658e06: lea rax, [rip + 0x50cd03b]
0x658e0d: mov qword ptr [rbp - 0x48], rax
0x658e11: cmp byte ptr [rbp - 0x38], 0
0x658e15: je 0x140658e8b
0x658e17: cmp byte ptr [rbp - 0x37], 0
0x658e1b: jne 0x140658e2c
0x658e1d: mov rcx, qword ptr [rbp - 0x40]
0x658e21: mov rax, qword ptr [rcx]
0x658e24: call qword ptr [rax + 8]
0x658e27: movzx edi, al
0x658e2a: jmp 0x140658e6a
0x658e2c: mov rdi, qword ptr [rbp - 0x40]
0x658e30: lea rbx, [rdi + 0x18]
0x658e34: mov qword ptr [rbp + 0x48], rbx
0x658e38: mov rax, qword ptr [rbx]
0x658e3b: mov rcx, rbx
0x658e3e: call qword ptr [rax + 8]
0x658e41: nop 
0x658e42: dec word ptr [rdi + 0x48]
0x658e46: cmp byte ptr [rdi + 0x4a], 0
0x658e4a: jne 0x140658e5e
0x658e4c: lock xadd dword ptr [rdi + 0x10], r14d
0x658e52: add r14w, word ptr [rdi + 0x48]
0x658e57: jne 0x140658e5e
0x658e59: mov dil, 1
0x658e5c: jmp 0x140658e61
0x658e5e: xor dil, dil
0x658e61: mov rax, qword ptr [rbx]
0x658e64: mov rcx, rbx
0x658e67: call qword ptr [rax + 0x10]
0x658e6a: test dil, dil
0x658e6d: je 0x140658e87
0x658e6f: mov rcx, qword ptr [rbp - 0x40]
0x658e73: mov edx, 1
0x658e78: xor eax, eax
0x658e7a: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x658e7f: jne 0x140658e87
0x658e81: mov rdx, qword ptr [rcx]
0x658e84: call qword ptr [rdx + 0x10]
0x658e87: mov byte ptr [rbp - 0x38], 0
0x658e8b: movzx eax, sil
0x658e8f: mov rbx, qword ptr [rsp + 0xc0]
0x658e97: add rsp, 0x70
0x658e9b: pop r15
0x658e9d: pop r14
0x658e9f: pop r13
0x658ea1: pop r12
0x658ea3: pop rdi
0x658ea4: pop rsi
0x658ea5: pop rbp
0x658ea6: ret 