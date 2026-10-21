0x9ceac50: mov rax, rsp
0x9ceac53: mov qword ptr [rax + 0x10], rbx
0x9ceac57: mov qword ptr [rax + 0x18], rbp
0x9ceac5b: mov qword ptr [rax + 0x20], rsi
0x9ceac5f: push rdi
0x9ceac60: push r14
0x9ceac62: push r15
0x9ceac64: sub rsp, 0xc0
0x9ceac6b: mov rbp, r8
0x9ceac6e: mov r14, rdx
0x9ceac71: mov rbx, rcx
0x9ceac74: xor esi, esi
0x9ceac76: mov rdi, qword ptr [rcx + 8]
0x9ceac7a: lea rdx, [rax - 0x50]
0x9ceac7e: call 0x1409f8560
0x9ceac83: nop 
0x9ceac84: lea r15, [rip - 0x45c4e43]
0x9ceac8b: cmp byte ptr [rsp + 0x98], sil
0x9ceac93: jne 0x149ceacde
0x9ceac95: lea rax, [rip - 0x472ab0c]
0x9ceac9c: mov qword ptr [rsp + 0x58], rax
0x9ceaca1: mov dword ptr [rsp + 0x50], 6
0x9ceaca9: mov eax, dword ptr [rip - 0x2ff415b]
0x9ceacaf: mov dword ptr [rsp + 0x48], eax
0x9ceacb3: lea r9, [rip - 0x477780e]
0x9ceacba: mov qword ptr [rsp + 0x40], r9
0x9ceacbf: mov dword ptr [rsp + 0x38], esi
0x9ceacc3: mov qword ptr [rsp + 0x30], r9
0x9ceacc8: mov qword ptr [rsp + 0x28], r9
0x9ceaccd: mov qword ptr [rsp + 0x20], r9
0x9ceacd2: mov cl, 1
0x9ceacd4: call 0x14035d8d0
0x9ceacd9: jmp 0x149ceae11
0x9ceacde: lea rdx, [rsp + 0x68]
0x9ceace3: mov rcx, qword ptr [rdi + 0xa0]
0x9ceacea: call 0x14206ae30
0x9ceacef: nop 
0x9ceacf0: cmp byte ptr [rsp + 0x78], 0
0x9ceacf5: je 0x149cead7f
0x9ceacfb: mov qword ptr [rsp + 0x28], rbp
0x9cead00: movzx eax, byte ptr [r14]
0x9cead04: mov byte ptr [rsp + 0x20], al
0x9cead08: mov r9, qword ptr [rsp + 0x70]
0x9cead0d: mov r8, qword ptr [rsp + 0x90]
0x9cead15: lea rdx, [rsp + 0xe0]
0x9cead1d: mov rcx, rbx
0x9cead20: call 0x14219d7f0
0x9cead25: mov eax, dword ptr [rsp + 0xe0]
0x9cead2c: test eax, eax
0x9cead2e: je 0x149cead70
0x9cead30: lea rcx, [rip - 0x472ac3f]
0x9cead37: mov qword ptr [rsp + 0x58], rcx
0x9cead3c: mov dword ptr [rsp + 0x50], 6
0x9cead44: mov dword ptr [rsp + 0x48], eax
0x9cead48: lea r9, [rip - 0x47778a3]
0x9cead4f: mov qword ptr [rsp + 0x40], r9
0x9cead54: mov dword ptr [rsp + 0x38], esi
0x9cead58: mov qword ptr [rsp + 0x30], r9
0x9cead5d: mov qword ptr [rsp + 0x28], r9
0x9cead62: mov qword ptr [rsp + 0x20], r9
0x9cead67: mov cl, 1
0x9cead69: call 0x14035d8d0
0x9cead6e: jmp 0x149cead7f
0x9cead70: mov rax, qword ptr [rip - 0x2f81be7]
0x9cead77: mov rcx, qword ptr [rax + 0x28]
0x9cead7b: mov byte ptr [rcx + 0x28], 1
0x9cead7f: mov qword ptr [rsp + 0x68], r15
0x9cead84: cmp byte ptr [rsp + 0x78], 0
0x9cead89: je 0x149ceae11
0x9cead8f: cmp byte ptr [rsp + 0x79], 0
0x9cead94: jne 0x149ceada6
0x9cead96: mov rcx, qword ptr [rsp + 0x70]
0x9cead9b: mov rax, qword ptr [rcx]
0x9cead9e: call qword ptr [rax + 8]
0x9ceada1: movzx edi, al
0x9ceada4: jmp 0x149ceadee
0x9ceada6: mov rdi, qword ptr [rsp + 0x70]
0x9ceadab: lea rbx, [rdi + 0x18]
0x9ceadaf: mov qword ptr [rsp + 0xe0], rbx
0x9ceadb7: mov rax, qword ptr [rbx]
0x9ceadba: mov rcx, rbx
0x9ceadbd: call qword ptr [rax + 8]
0x9ceadc0: add word ptr [rip - 0x22a26b4], cx
0x9ceadc7: nop 
0x9ceadc8: dec word ptr [rdi + 0x48]
0x9ceadcc: cmp byte ptr [rdi + 0x4a], 0
0x9ceadd0: jne 0x149ceade2
0x9ceadd2: lock xadd dword ptr [rdi + 0x10], esi
0x9ceadd7: add si, word ptr [rdi + 0x48]
0x9ceaddb: jne 0x149ceade2
0x9ceaddd: mov dil, 1
0x9ceade0: jmp 0x149ceade5
0x9ceade2: xor dil, dil
0x9ceade5: mov rax, qword ptr [rbx]
0x9ceade8: mov rcx, rbx
0x9ceadeb: call qword ptr [rax + 0x10]
0x9ceadee: test dil, dil
0x9ceadf1: je 0x149ceae0c
0x9ceadf3: mov rcx, qword ptr [rsp + 0x70]
0x9ceadf8: mov edx, 1
0x9ceadfd: xor eax, eax
0x9ceadff: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x9ceae04: jne 0x149ceae0c
0x9ceae06: mov rax, qword ptr [rcx]
0x9ceae09: call qword ptr [rax + 0x10]
0x9ceae0c: mov byte ptr [rsp + 0x78], 0
0x9ceae11: lea rax, [rip - 0x43d7fb8]
0x9ceae18: mov qword ptr [rsp + 0x88], rax
0x9ceae20: cmp byte ptr [rsp + 0x98], 0
0x9ceae28: je 0x149ceae3c
0x9ceae2a: mov rcx, qword ptr [rsp + 0xb0]
0x9ceae32: mov rax, qword ptr [rcx]
0x9ceae35: call qword ptr [rax + 0x148]
0x9ceae3b: nop 
0x9ceae3c: lea rax, [rip - 0x4777603]
0x9ceae43: mov qword ptr [rsp + 0x88], rax
0x9ceae4b: mov qword ptr [rsp + 0x88], r15
0x9ceae53: lea rcx, [rsp + 0x88]
0x9ceae5b: call 0x141434880
0x9ceae60: mov ebx, dword ptr [rip + 0x4968b5e]
0x9ceae66: xor ebx, 0xc9af0f89
0x9ceae6c: lea r11, [rsp + rbx]
0x9ceae70: mov rbx, qword ptr [r11 + 0x28]
0x9ceae74: mov rbp, qword ptr [r11 + 0x30]
0x9ceae78: mov rsi, qword ptr [r11 + 0x38]
0x9ceae7c: mov rsp, r11
0x9ceae7f: pop r15
0x9ceae81: pop r14
0x9ceae83: pop rdi
0x9ceae84: ret 