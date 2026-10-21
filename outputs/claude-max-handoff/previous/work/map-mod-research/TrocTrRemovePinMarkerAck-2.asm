0xb9df60: mov qword ptr [rsp + 8], rbx
0xb9df65: push rbp
0xb9df66: push rsi
0xb9df67: push rdi
0xb9df68: push r12
0xb9df6a: push r13
0xb9df6c: push r14
0xb9df6e: push r15
0xb9df70: mov rbp, rsp
0xb9df73: sub rsp, 0x110
0xb9df7a: mov rdi, r8
0xb9df7d: mov rbx, rdx
0xb9df80: mov rsi, rcx
0xb9df83: xor r13d, r13d
0xb9df86: mov r14, qword ptr [r8 + 0x18]
0xb9df8a: movzx ecx, word ptr [r14 + 3]
0xb9df8f: movzx eax, word ptr [r8 + 0x10]
0xb9df94: sub rax, 5
0xb9df98: cmp rax, rcx
0xb9df9b: jne 0x140b9e1d1
0xb9dfa1: cmp byte ptr [r8 + 0x38], r13b
0xb9dfa5: jne 0x140b9dfb5
0xb9dfa7: mov eax, 0x7fc1
0xb9dfac: cmp ax, cx
0xb9dfaf: jb 0x140b9e1d1
0xb9dfb5: cmp byte ptr [rsi + 0x21], r13b
0xb9dfb9: je 0x140b9dfc3
0xb9dfbb: mov dword ptr [rdx], r13d
0xb9dfbe: jmp 0x140b9e281
0xb9dfc3: mov dword ptr [rbp + 0x58], r13d
0xb9dfc7: movzx ecx, word ptr [r14 + 3]
0xb9dfcc: lea r15, [rip + 0x4b83ced]
0xb9dfd3: mov qword ptr [rbp - 0x80], r15
0xb9dfd7: mov byte ptr [rbp - 0x78], r13b
0xb9dfdb: lea r12, [rip + 0x4b83c7e]
0xb9dfe2: mov qword ptr [rbp - 0x80], r12
0xb9dfe6: lea rax, [r14 + 5]
0xb9dfea: mov qword ptr [rbp - 0x70], rax
0xb9dfee: mov dword ptr [rbp - 0x68], ecx
0xb9dff1: mov dword ptr [rbp - 0x64], r13d
0xb9dff5: mov rax, qword ptr [rip + 0x61cb18c]
0xb9dffc: mov rsi, qword ptr [rax + 0x38]
0xb9e000: mov rax, qword ptr [rbp - 0x80]
0xb9e004: mov r9, qword ptr [rax + 8]
0xb9e008: lea rax, [rip + 0x881261]
0xb9e00f: mov r8d, 4
0xb9e015: lea rdx, [rbp + 0x58]
0xb9e019: lea rcx, [rbp - 0x80]
0xb9e01d: cmp r9, rax
0xb9e020: jne 0x140b9e029
0xb9e022: call 0x14141f270
0xb9e027: jmp 0x140b9e02c
0xb9e029: call r9
0xb9e02c: test al, al
0xb9e02e: jne 0x140b9e045
0xb9e030: mov eax, dword ptr [rip + 0x613d93a]
0xb9e036: mov dword ptr [rbx], eax
0xb9e038: mov qword ptr [rbp - 0x80], r12
0xb9e03c: mov qword ptr [rbp - 0x80], r15
0xb9e040: jmp 0x140b9e281
0xb9e045: mov edx, dword ptr [rbp + 0x58]
0xb9e048: test edx, edx
0xb9e04a: je 0x140b9e07b
0xb9e04c: mov eax, edx
0xb9e04e: and eax, 0x30000000
0xb9e053: cmp eax, 0x10000000
0xb9e058: je 0x140b9e07b
0xb9e05a: mov rcx, rsi
0xb9e05d: call 0x1408b53c0
0xb9e062: test al, al
0xb9e064: je 0x140b9e07b
0xb9e066: mov eax, dword ptr [rip + 0x613d964]
0xb9e06c: mov dword ptr [rbx], eax
0xb9e06e: mov qword ptr [rbp - 0x80], r12
0xb9e072: mov qword ptr [rbp - 0x80], r15
0xb9e076: jmp 0x140b9e281
0xb9e07b: mov rax, qword ptr [rbp - 0x80]
0xb9e07f: mov r9, qword ptr [rax + 8]
0xb9e083: lea rax, [rip - 0x8444ea]
0xb9e08a: cmp r9, rax
0xb9e08d: je 0x140b9e1bc
0xb9e093: mov r8d, 8
0xb9e099: lea rdx, [rbp - 0x50]
0xb9e09d: lea rcx, [rbp - 0x80]
0xb9e0a1: call r9
0xb9e0a4: test al, al
0xb9e0a6: je 0x140b9e1bc
0xb9e0ac: mov rax, qword ptr [rbp - 0x80]
0xb9e0b0: mov r9, qword ptr [rax + 8]
0xb9e0b4: lea rax, [rip - 0x84451b]
0xb9e0bb: cmp r9, rax
0xb9e0be: je 0x140b9e1a7
0xb9e0c4: mov r8d, 1
0xb9e0ca: lea rdx, [rbp + 0x50]
0xb9e0ce: lea rcx, [rbp - 0x80]
0xb9e0d2: call r9
0xb9e0d5: test al, al
0xb9e0d7: je 0x140b9e1a7
0xb9e0dd: movzx eax, word ptr [r14 + 3]
0xb9e0e2: cmp dword ptr [rbp - 0x64], eax
0xb9e0e5: je 0x140b9e0fc
0xb9e0e7: mov eax, dword ptr [rip + 0x613d883]
0xb9e0ed: mov dword ptr [rbx], eax
0xb9e0ef: mov qword ptr [rbp - 0x80], r12
0xb9e0f3: mov qword ptr [rbp - 0x80], r15
0xb9e0f7: jmp 0x140b9e281
0xb9e0fc: mov r8d, dword ptr [rbp + 0x58]
0xb9e100: lea rdx, [rbp - 0x38]
0xb9e104: mov rcx, rsi
0xb9e107: call 0x1408a67e0
0xb9e10c: nop 
0xb9e10d: cmp byte ptr [rbp - 0x28], 0
0xb9e111: je 0x140b9e13c
0xb9e113: mov rsi, qword ptr [rbp - 0x30]
0xb9e117: mov rcx, rsi
0xb9e11a: call 0x140466060
0xb9e11f: test al, al
0xb9e121: je 0x140b9e139
0xb9e123: mov rax, qword ptr [rsi + 0x68]
0xb9e127: mov rcx, qword ptr [rax + 0x1a0]
0xb9e12e: mov rax, qword ptr [rcx]
0xb9e131: xor edx, edx
0xb9e133: call qword ptr [rax + 0x150]
0xb9e139: mov qword ptr [rdi], rsi
0xb9e13c: mov rcx, qword ptr [rdi]
0xb9e13f: test rcx, rcx
0xb9e142: je 0x140b9e177
0xb9e144: mov rax, qword ptr [rcx + 0x88]
0xb9e14b: cmp byte ptr [rax + 1], 1
0xb9e14f: jne 0x140b9e177
0xb9e151: cmp byte ptr [rcx + 0x96], 0
0xb9e158: je 0x140b9e177
0xb9e15a: mov rcx, qword ptr [rcx + 0x68]
0xb9e15e: movzx r9d, byte ptr [rbp + 0x50]
0xb9e163: lea r8, [rbp - 0x50]
0xb9e167: lea rdx, [rbp - 0x60]
0xb9e16b: mov rcx, qword ptr [rcx + 0x168]
0xb9e172: call 0x140495700
0xb9e177: mov dword ptr [rbx], r13d
0xb9e17a: lea rax, [rip + 0x49d56bf]
0xb9e181: mov qword ptr [rbp - 0x38], rax
0xb9e185: lea rax, [rip + 0x4b87cbc]
0xb9e18c: mov qword ptr [rbp - 0x38], rax
0xb9e190: lea rcx, [rbp - 0x38]
0xb9e194: call 0x141434880
0xb9e199: nop 
0xb9e19a: mov qword ptr [rbp - 0x80], r12
0xb9e19e: mov qword ptr [rbp - 0x80], r15
0xb9e1a2: jmp 0x140b9e281
0xb9e1a7: mov eax, dword ptr [rip + 0x613d7c3]
0xb9e1ad: mov dword ptr [rbx], eax
0xb9e1af: mov qword ptr [rbp - 0x80], r12
0xb9e1b3: mov qword ptr [rbp - 0x80], r15
0xb9e1b7: jmp 0x140b9e281
0xb9e1bc: mov eax, dword ptr [rip + 0x613d7ae]
0xb9e1c2: mov dword ptr [rbx], eax
0xb9e1c4: mov qword ptr [rbp - 0x80], r12
0xb9e1c8: mov qword ptr [rbp - 0x80], r15
0xb9e1cc: jmp 0x140b9e281
0xb9e1d1: mov rdi, qword ptr [r8]
0xb9e1d4: test rdi, rdi
0xb9e1d7: je 0x140b9e258
0xb9e1d9: mov rax, qword ptr [rdi]
0xb9e1dc: lea rdx, [rbp - 0x18]
0xb9e1e0: mov rcx, rdi
0xb9e1e3: call qword ptr [rax + 0xd0]
0xb9e1e9: mov rdx, qword ptr [rax]
0xb9e1ec: mov qword ptr [rbp - 0x60], rdx
0xb9e1f0: mov rax, qword ptr [rdi]
0xb9e1f3: lea rdx, [rbp - 0x10]
0xb9e1f7: mov rcx, rdi
0xb9e1fa: call qword ptr [rax + 0xd8]
0xb9e200: mov rdx, qword ptr [rax]
0xb9e203: mov qword ptr [rbp - 0x48], rdx
0xb9e207: mov rax, qword ptr [rdi]
0xb9e20a: mov rcx, rdi
0xb9e20d: call qword ptr [rax + 0xc8]
0xb9e213: mov qword ptr [rbp - 0x40], rax
0xb9e217: lea rax, [rsi + 0xc]
0xb9e21b: lea rcx, [rsi + 0x22]
0xb9e21f: lea rdx, [rbp - 0x60]
0xb9e223: mov qword ptr [rsp + 0x80], rdx
0xb9e22b: lea rdx, [rbp - 0x48]
0xb9e22f: mov qword ptr [rsp + 0x78], rdx
0xb9e234: lea rdx, [rbp - 0x40]
0xb9e238: mov qword ptr [rsp + 0x70], rdx
0xb9e23d: mov qword ptr [rsp + 0x68], rax
0xb9e242: mov qword ptr [rsp + 0x60], rcx
0xb9e247: mov eax, dword ptr [rip + 0x613d727]
0xb9e24d: mov dword ptr [rsp + 0x48], eax
0xb9e251: call 0x14143b450
0xb9e256: jmp 0x140b9e279
0xb9e258: lea rax, [rsi + 0xc]
0xb9e25c: lea rcx, [rsi + 0x22]
0xb9e260: mov qword ptr [rsp + 0x68], rax
0xb9e265: mov qword ptr [rsp + 0x60], rcx
0xb9e26a: mov eax, dword ptr [rip + 0x613d704]
0xb9e270: mov dword ptr [rsp + 0x48], eax
0xb9e274: call 0x14143b670
0xb9e279: mov eax, dword ptr [rip + 0x613d6f5]
0xb9e27f: mov dword ptr [rbx], eax
0xb9e281: mov rax, rbx
0xb9e284: mov rbx, qword ptr [rsp + 0x150]
0xb9e28c: add rsp, 0x110
0xb9e293: pop r15
0xb9e295: pop r14
0xb9e297: pop r13
0xb9e299: pop r12
0xb9e29b: pop rdi
0xb9e29c: pop rsi
0xb9e29d: pop rbp
0xb9e29e: ret 