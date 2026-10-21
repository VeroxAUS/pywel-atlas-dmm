0x29bee80: mov qword ptr [rsp + 8], rbx
0x29bee85: mov qword ptr [rsp + 0x10], rsi
0x29bee8a: push rbp
0x29bee8b: push rdi
0x29bee8c: push r12
0x29bee8e: push r14
0x29bee90: push r15
0x29bee92: lea rbp, [rsp - 0x37]
0x29bee97: sub rsp, 0xf0
0x29bee9e: mov rbx, rdx
0x29beea1: mov rdi, rcx
0x29beea4: mov rsi, qword ptr [r8 + 0x18]
0x29beea8: movzx ecx, word ptr [rsi + 3]
0x29beeac: movzx eax, word ptr [r8 + 0x10]
0x29beeb1: sub rax, 5
0x29beeb5: cmp rax, rcx
0x29beeb8: jne 0x1429bf049
0x29beebe: cmp byte ptr [r8 + 0x38], 0
0x29beec3: jne 0x1429beed3
0x29beec5: mov eax, 0x7fc1
0x29beeca: cmp ax, cx
0x29beecd: jb 0x1429bf049
0x29beed3: cmp byte ptr [rdi + 0x21], 0
0x29beed7: je 0x1429beee2
0x29beed9: xor edi, edi
0x29beedb: mov dword ptr [rdx], edi
0x29beedd: jmp 0x1429bf0f9
0x29beee2: vxorps xmm0, xmm0, xmm0
0x29beee6: vmovss dword ptr [rbp - 1], xmm0
0x29beeeb: vmovss dword ptr [rbp + 3], xmm0
0x29beef0: vmovss dword ptr [rbp + 7], xmm0
0x29beef5: movzx ecx, word ptr [rsi + 3]
0x29beef9: lea r14, [rip + 0x2d62dc0]
0x29bef00: mov qword ptr [rbp + 0xf], r14
0x29bef04: mov byte ptr [rbp + 0x17], 0
0x29bef08: lea r15, [rip + 0x2d62d51]
0x29bef0f: mov qword ptr [rbp + 0xf], r15
0x29bef13: lea rax, [rsi + 5]
0x29bef17: mov qword ptr [rbp + 0x1f], rax
0x29bef1b: mov dword ptr [rbp + 0x27], ecx
0x29bef1e: xor edi, edi
0x29bef20: mov dword ptr [rbp + 0x2b], edi
0x29bef23: mov rax, qword ptr [rbp + 0xf]
0x29bef27: mov r9, qword ptr [rax + 8]
0x29bef2b: lea rax, [rip - 0x159fcc2]
0x29bef32: mov r8d, 4
0x29bef38: lea rdx, [rbp + 0x7f]
0x29bef3c: lea rcx, [rbp + 0xf]
0x29bef40: cmp r9, rax
0x29bef43: jne 0x1429bef4c
0x29bef45: call 0x14141f270
0x29bef4a: jmp 0x1429bef4f
0x29bef4c: call r9
0x29bef4f: test al, al
0x29bef51: jne 0x1429bef68
0x29bef53: mov eax, dword ptr [rip + 0x431ca17]
0x29bef59: mov dword ptr [rbx], eax
0x29bef5b: mov qword ptr [rbp + 0xf], r15
0x29bef5f: mov qword ptr [rbp + 0xf], r14
0x29bef63: jmp 0x1429bf0f9
0x29bef68: mov rax, qword ptr [rbp + 0xf]
0x29bef6c: mov r9, qword ptr [rax + 8]
0x29bef70: lea r12, [rip - 0x26653d7]
0x29bef77: cmp r9, r12
0x29bef7a: je 0x1429bf034
0x29bef80: mov r8d, 0xc
0x29bef86: lea rdx, [rbp - 1]
0x29bef8a: lea rcx, [rbp + 0xf]
0x29bef8e: call r9
0x29bef91: test al, al
0x29bef93: je 0x1429bf034
0x29bef99: mov rax, qword ptr [rbp + 0xf]
0x29bef9d: mov r9, qword ptr [rax + 8]
0x29befa1: cmp r9, r12
0x29befa4: je 0x1429bf01f
0x29befa6: mov r8d, 1
0x29befac: lea rdx, [rbp + 0x77]
0x29befb0: lea rcx, [rbp + 0xf]
0x29befb4: call r9
0x29befb7: test al, al
0x29befb9: je 0x1429bf01f
0x29befbb: mov rax, qword ptr [rbp + 0xf]
0x29befbf: mov r9, qword ptr [rax + 8]
0x29befc3: cmp r9, r12
0x29befc6: je 0x1429bf00a
0x29befc8: mov r8d, 4
0x29befce: lea rdx, [rbp - 0x29]
0x29befd2: lea rcx, [rbp + 0xf]
0x29befd6: call r9
0x29befd9: test al, al
0x29befdb: je 0x1429bf00a
0x29befdd: movzx eax, word ptr [rsi + 3]
0x29befe1: cmp dword ptr [rbp + 0x2b], eax
0x29befe4: je 0x1429beffb
0x29befe6: mov eax, dword ptr [rip + 0x431c984]
0x29befec: mov dword ptr [rbx], eax
0x29befee: mov qword ptr [rbp + 0xf], r15
0x29beff2: mov qword ptr [rbp + 0xf], r14
0x29beff6: jmp 0x1429bf0f9
0x29beffb: mov dword ptr [rbx], edi
0x29beffd: mov qword ptr [rbp + 0xf], r15
0x29bf001: mov qword ptr [rbp + 0xf], r14
0x29bf005: jmp 0x1429bf0f9
0x29bf00a: mov eax, dword ptr [rip + 0x431c960]
0x29bf010: mov dword ptr [rbx], eax
0x29bf012: mov qword ptr [rbp + 0xf], r15
0x29bf016: mov qword ptr [rbp + 0xf], r14
0x29bf01a: jmp 0x1429bf0f9
0x29bf01f: mov eax, dword ptr [rip + 0x431c94b]
0x29bf025: mov dword ptr [rbx], eax
0x29bf027: mov qword ptr [rbp + 0xf], r15
0x29bf02b: mov qword ptr [rbp + 0xf], r14
0x29bf02f: jmp 0x1429bf0f9
0x29bf034: mov eax, dword ptr [rip + 0x431c936]
0x29bf03a: mov dword ptr [rbx], eax
0x29bf03c: mov qword ptr [rbp + 0xf], r15
0x29bf040: mov qword ptr [rbp + 0xf], r14
0x29bf044: jmp 0x1429bf0f9
0x29bf049: mov rsi, qword ptr [r8]
0x29bf04c: test rsi, rsi
0x29bf04f: je 0x1429bf0d0
0x29bf051: mov rax, qword ptr [rsi]
0x29bf054: lea rdx, [rbp - 0x11]
0x29bf058: mov rcx, rsi
0x29bf05b: call qword ptr [rax + 0xd0]
0x29bf061: mov rdx, qword ptr [rax]
0x29bf064: mov qword ptr [rbp + 0x7f], rdx
0x29bf068: mov rax, qword ptr [rsi]
0x29bf06b: lea rdx, [rbp - 9]
0x29bf06f: mov rcx, rsi
0x29bf072: call qword ptr [rax + 0xd8]
0x29bf078: mov rdx, qword ptr [rax]
0x29bf07b: mov qword ptr [rbp - 0x21], rdx
0x29bf07f: mov rax, qword ptr [rsi]
0x29bf082: mov rcx, rsi
0x29bf085: call qword ptr [rax + 0xc8]
0x29bf08b: mov qword ptr [rbp - 0x19], rax
0x29bf08f: lea rax, [rdi + 0xc]
0x29bf093: lea rcx, [rdi + 0x22]
0x29bf097: lea rdx, [rbp + 0x7f]
0x29bf09b: mov qword ptr [rsp + 0x80], rdx
0x29bf0a3: lea rdx, [rbp - 0x21]
0x29bf0a7: mov qword ptr [rsp + 0x78], rdx
0x29bf0ac: lea rdx, [rbp - 0x19]
0x29bf0b0: mov qword ptr [rsp + 0x70], rdx
0x29bf0b5: mov qword ptr [rsp + 0x68], rax
0x29bf0ba: mov qword ptr [rsp + 0x60], rcx
0x29bf0bf: mov eax, dword ptr [rip + 0x431c8af]
0x29bf0c5: mov dword ptr [rsp + 0x48], eax
0x29bf0c9: call 0x14143b450
0x29bf0ce: jmp 0x1429bf0f1
0x29bf0d0: lea rax, [rdi + 0xc]
0x29bf0d4: lea rcx, [rdi + 0x22]
0x29bf0d8: mov qword ptr [rsp + 0x68], rax
0x29bf0dd: mov qword ptr [rsp + 0x60], rcx
0x29bf0e2: mov eax, dword ptr [rip + 0x431c88c]
0x29bf0e8: mov dword ptr [rsp + 0x48], eax
0x29bf0ec: call 0x14143b670
0x29bf0f1: mov eax, dword ptr [rip + 0x431c87d]
0x29bf0f7: mov dword ptr [rbx], eax
0x29bf0f9: mov rax, rbx
0x29bf0fc: lea r11, [rsp + 0xf0]
0x29bf104: mov rbx, qword ptr [r11 + 0x30]
0x29bf108: mov rsi, qword ptr [r11 + 0x38]
0x29bf10c: mov rsp, r11
0x29bf10f: pop r15
0x29bf111: pop r14
0x29bf113: pop r12
0x29bf115: pop rdi
0x29bf116: pop rbp
0x29bf117: ret 