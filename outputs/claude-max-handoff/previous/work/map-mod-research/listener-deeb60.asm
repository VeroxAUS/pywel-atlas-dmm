0xdeeb60: mov qword ptr [rsp + 8], rbx
0xdeeb65: mov qword ptr [rsp + 0x10], rbp
0xdeeb6a: mov qword ptr [rsp + 0x18], rsi
0xdeeb6f: push rdi
0xdeeb70: push r12
0xdeeb72: push r13
0xdeeb74: push r14
0xdeeb76: push r15
0xdeeb78: sub rsp, 0xc0
0xdeeb7f: mov r12, r9
0xdeeb82: mov rbx, r8
0xdeeb85: mov r15, rdx
0xdeeb88: mov rsi, rcx
0xdeeb8b: mov rcx, rdx
0xdeeb8e: call 0x140537250
0xdeeb93: mov rbp, rax
0xdeeb96: cmp byte ptr [rip + 0x5ebe42b], 0
0xdeeb9d: je 0x140deeece
0xdeeba3: mov r10, qword ptr [rsi]
0xdeeba6: lea rdx, [rip + 0x5ee26df]
0xdeebad: mov rcx, rsi
0xdeebb0: call qword ptr [r10 + 0x190]
0xdeebb7: test al, al
0xdeebb9: je 0x140deeece
0xdeebbf: mov rdx, r15
0xdeebc2: call 0x140e002e0
0xdeebc7: test al, al
0xdeebc9: je 0x140deeece
0xdeebcf: xor edi, edi
0xdeebd1: cmp dword ptr [rsi + 0x1dc], edi
0xdeebd7: je 0x140deec38
0xdeebd9: mov r9d, dword ptr [r12]
0xdeebdd: mov ecx, dword ptr [rsi + 0x1d8]
0xdeebe3: test ecx, ecx
0xdeebe5: je 0x140deec38
0xdeebe7: xor edx, edx
0xdeebe9: mov eax, r9d
0xdeebec: div ecx
0xdeebee: mov r8d, edx
0xdeebf1: shl r8, 8
0xdeebf5: add r8, qword ptr [rsi + 0x1e8]
0xdeebfc: mov edx, edi
0xdeebfe: mov r10d, dword ptr [r8]
0xdeec01: test r10d, r10d
0xdeec04: je 0x140deec38
0xdeec06: mov eax, edx
0xdeec08: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdeec0d: jne 0x140deec25
0xdeec0f: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdeec14: mov rax, qword ptr [rsi + 0x1f0]
0xdeec1b: mov rax, qword ptr [rax + rcx*8]
0xdeec1f: cmp dword ptr [rax + 4], r9d
0xdeec23: je 0x140deec2e
0xdeec25: inc edx
0xdeec27: cmp edx, r10d
0xdeec2a: jb 0x140deec06
0xdeec2c: jmp 0x140deec38
0xdeec2e: add rax, 8
0xdeec32: jne 0x140def096
0xdeec38: mov rax, qword ptr gs:[0x58]
0xdeec41: mov rbp, qword ptr [rax]
0xdeec44: mov eax, 0x1fd
0xdeec49: mov edx, 0x10
0xdeec4e: mov ecx, 0x30
0xdeec53: cmp byte ptr [rax + rbp], dil
0xdeec57: je 0x140deec60
0xdeec59: call 0x1447efa78
0xdeec5e: jmp 0x140deec65
0xdeec60: call 0x1447ef9b0
0xdeec65: mov rbx, rax
0xdeec68: test rax, rax
0xdeec6b: jne 0x140deec88
0xdeec6d: call 0x141318e70
0xdeec72: xor r9d, r9d
0xdeec75: xor r8d, r8d
0xdeec78: mov edx, 1
0xdeec7d: mov ecx, 0xa0000002
0xdeec82: call qword ptr [rip + 0x43fc4c0]
0xdeec88: mov qword ptr [rsp + 0x70], rbx
0xdeec8d: test rbx, rbx
0xdeec90: je 0x140deecc4
0xdeec92: mov dword ptr [rbx], edi
0xdeec94: mov word ptr [rbx + 0x21], di
0xdeec98: mov byte ptr [rbx + 0x23], 0
0xdeec9c: mov qword ptr [rbx + 0x28], 0
0xdeeca4: mov qword ptr [rbx + 4], 6
0xdeecac: mov qword ptr [rbx + 0xc], rdi
0xdeecb0: mov qword ptr [rbx + 0x14], rdi
0xdeecb4: mov dword ptr [rbx + 0x1c], 0x3f800000
0xdeecbb: mov byte ptr [rbx + 0x20], 1
0xdeecbf: mov dword ptr [rbx + 0x24], edi
0xdeecc2: jmp 0x140deecc7
0xdeecc4: mov rbx, rdi
0xdeecc7: mov qword ptr [rsp + 0x68], rbx
0xdeeccc: test rbx, rbx
0xdeeccf: je 0x140def096
0xdeecd5: mov rax, qword ptr [rsp + 0x118]
0xdeecdd: vmovsd xmm0, qword ptr [rax]
0xdeece1: vmovsd qword ptr [rbx + 8], xmm0
0xdeece6: mov eax, dword ptr [rax + 8]
0xdeece9: mov dword ptr [rbx + 0x10], eax
0xdeecec: mov r8d, 0x1ec
0xdeecf2: movzx r8d, byte ptr [r8 + rbp]
0xdeecf7: mov rdx, qword ptr [rip + 0x5f7a82a]
0xdeecfe: mov rax, rdx
0xdeed01: mov r9, qword ptr [rip + 0x5f7a828]
0xdeed08: test r8b, r8b
0xdeed0b: cmovne rax, r9
0xdeed0f: movzx r10d, word ptr [r15]
0xdeed13: mov rax, qword ptr [rax]
0xdeed16: mov rcx, qword ptr [rax + 8]
0xdeed1a: mov rax, qword ptr [rcx + 0x270]
0xdeed21: cmp r10w, word ptr [rax + 0x10a]
0xdeed29: jne 0x140deed36
0xdeed2b: mov dword ptr [rbx], 0x35
0xdeed31: jmp 0x140deee33
0xdeed36: mov rax, rdx
0xdeed39: test r8b, r8b
0xdeed3c: cmovne rax, r9
0xdeed40: mov rax, qword ptr [rax]
0xdeed43: mov rcx, qword ptr [rax + 8]
0xdeed47: mov rax, qword ptr [rcx + 0x270]
0xdeed4e: cmp r10w, word ptr [rax + 0x10e]
0xdeed56: jne 0x140deed63
0xdeed58: mov dword ptr [rbx], 0x37
0xdeed5e: jmp 0x140deee33
0xdeed63: mov rax, rdx
0xdeed66: test r8b, r8b
0xdeed69: cmovne rax, r9
0xdeed6d: mov rax, qword ptr [rax]
0xdeed70: mov rcx, qword ptr [rax + 8]
0xdeed74: mov rax, qword ptr [rcx + 0x270]
0xdeed7b: cmp r10w, word ptr [rax + 0xfc]
0xdeed83: jne 0x140deed90
0xdeed85: mov dword ptr [rbx], 0x2e
0xdeed8b: jmp 0x140deee33
0xdeed90: mov rax, rdx
0xdeed93: test r8b, r8b
0xdeed96: cmovne rax, r9
0xdeed9a: mov rax, qword ptr [rax]
0xdeed9d: mov rcx, qword ptr [rax + 8]
0xdeeda1: mov rax, qword ptr [rcx + 0x270]
0xdeeda8: cmp r10w, word ptr [rax + 0xfe]
0xdeedb0: jne 0x140deedba
0xdeedb2: mov dword ptr [rbx], 0x2f
0xdeedb8: jmp 0x140deee33
0xdeedba: mov rax, rdx
0xdeedbd: test r8b, r8b
0xdeedc0: cmovne rax, r9
0xdeedc4: mov rax, qword ptr [rax]
0xdeedc7: mov rcx, qword ptr [rax + 8]
0xdeedcb: mov rax, qword ptr [rcx + 0x270]
0xdeedd2: cmp r10w, word ptr [rax + 0x114]
0xdeedda: jne 0x140deede4
0xdeeddc: mov dword ptr [rbx], 0x3a
0xdeede2: jmp 0x140deee33
0xdeede4: mov rax, rdx
0xdeede7: test r8b, r8b
0xdeedea: cmovne rax, r9
0xdeedee: mov rax, qword ptr [rax]
0xdeedf1: mov rcx, qword ptr [rax + 8]
0xdeedf5: mov rax, qword ptr [rcx + 0x270]
0xdeedfc: cmp r10w, word ptr [rax + 0x110]
0xdeee04: jne 0x140deee0e
0xdeee06: mov dword ptr [rbx], 0x38
0xdeee0c: jmp 0x140deee33
0xdeee0e: test r8b, r8b
0xdeee11: cmovne rdx, r9
0xdeee15: mov rax, qword ptr [rdx]
0xdeee18: mov rcx, qword ptr [rax + 8]
0xdeee1c: mov rax, qword ptr [rcx + 0x270]
0xdeee23: cmp r10w, word ptr [rax + 0x162]
0xdeee2b: jne 0x140deee33
0xdeee2d: mov dword ptr [rbx], 0x61
0xdeee33: mov qword ptr [rsp + 0x70], r12
0xdeee38: inc dword ptr [rsi + 0x1e4]
0xdeee3e: lea rax, [rsp + 0xb0]
0xdeee46: mov qword ptr [rsp + 0x38], rax
0xdeee4b: lea rax, [rsp + 0x80]
0xdeee53: mov qword ptr [rsp + 0x30], rax
0xdeee58: lea rax, [rsp + 0x60]
0xdeee5d: mov qword ptr [rsp + 0x28], rax
0xdeee62: lea r9, [rsp + 0x68]
0xdeee67: mov r8d, dword ptr [r12]
0xdeee6b: lea rdx, [rsp + 0x70]
0xdeee70: lea rcx, [rsi + 0x1d8]
0xdeee77: call 0x140e02b10
0xdeee7c: mov r8d, dword ptr [r12]
0xdeee80: lea rdx, [rsp + 0x90]
0xdeee88: call 0x14064f570
0xdeee8d: nop 
0xdeee8e: cmp byte ptr [rsp + 0xa0], 0
0xdeee96: je 0x140deeead
0xdeee98: mov rax, qword ptr [rsi]
0xdeee9b: mov rdx, qword ptr [rsp + 0x98]
0xdeeea3: mov rcx, rsi
0xdeeea6: call qword ptr [rax + 0x590]
0xdeeeac: nop 
0xdeeead: lea rax, [rip + 0x4936f94]
0xdeeeb4: mov qword ptr [rsp + 0x90], rax
0xdeeebc: lea rcx, [rsp + 0x90]
0xdeeec4: call 0x141434880
0xdeeec9: jmp 0x140def096
0xdeeece: mov r14, qword ptr [rsp + 0x130]
0xdeeed6: mov eax, dword ptr [r14 + 4]
0xdeeeda: xor edi, edi
0xdeeedc: test eax, eax
0xdeeede: je 0x140deef13
0xdeeee0: mov rax, qword ptr [r14 + 0x10]
0xdeeee4: mov rcx, qword ptr [rax]
0xdeeee7: mov eax, dword ptr [rcx + 0x14]
0xdeeeea: cmp dword ptr [rip + 0x5ee21c0], eax
0xdeeef0: mov eax, edi
0xdeeef2: jne 0x140deeef8
0xdeeef4: lea rax, [rcx + 0x10]
0xdeeef8: cmp byte ptr [rax], 0xc
0xdeeefb: jne 0x140deef13
0xdeeefd: mov eax, dword ptr [rbx]
0xdeeeff: mov dword ptr [rsp + 0x68], eax
0xdeef03: lea rcx, [rsp + 0x68]
0xdeef08: call 0x140388f30
0xdeef0d: add rax, 0x42
0xdeef11: jmp 0x140deef16
0xdeef13: mov rax, r15
0xdeef16: mov rcx, rax
0xdeef19: call 0x140537250
0xdeef1e: lea rcx, [rax + 0x20]
0xdeef22: call 0x140388e00
0xdeef27: mov rcx, qword ptr [rax + 0x18]
0xdeef2b: mov r13, qword ptr [rcx]
0xdeef2e: mov r9d, dword ptr [r12]
0xdeef32: test r9d, r9d
0xdeef35: je 0x140deeff8
0xdeef3b: cmp dword ptr [rsi + 0x1bc], edi
0xdeef41: je 0x140def034
0xdeef47: mov ecx, dword ptr [rsi + 0x1b8]
0xdeef4d: test ecx, ecx
0xdeef4f: je 0x140def034
0xdeef55: xor edx, edx
0xdeef57: mov eax, r9d
0xdeef5a: div ecx
0xdeef5c: mov r8d, edx
0xdeef5f: shl r8, 8
0xdeef63: add r8, qword ptr [rsi + 0x1c8]
0xdeef6a: mov r10d, dword ptr [r8]
0xdeef6d: test r10d, r10d
0xdeef70: je 0x140def034
0xdeef76: mov eax, edi
0xdeef78: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdeef7d: jne 0x140deef95
0xdeef7f: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdeef84: mov rax, qword ptr [rsi + 0x1d0]
0xdeef8b: mov rdx, qword ptr [rax + rcx*8]
0xdeef8f: cmp dword ptr [rdx + 4], r9d
0xdeef93: je 0x140deefa1
0xdeef95: inc edi
0xdeef97: cmp edi, r10d
0xdeef9a: jb 0x140deef76
0xdeef9c: jmp 0x140def034
0xdeefa1: add rdx, 8
0xdeefa5: je 0x140def034
0xdeefab: mov rcx, qword ptr [rdx]
0xdeefae: mov eax, dword ptr [rdx + 8]
0xdeefb1: lea rdx, [rcx + rax*8]
0xdeefb5: cmp rcx, rdx
0xdeefb8: je 0x140def034
0xdeefbe: movzx r8d, word ptr [r15]
0xdeefc2: mov rax, qword ptr [rcx]
0xdeefc5: cmp word ptr [rax + 0xde], r8w
0xdeefcd: jne 0x140deefed
0xdeefcf: vmovups xmm0, xmmword ptr [rax + 0xc8]
0xdeefd7: mov rax, qword ptr [rax + 0xd0]
0xdeefde: cmp al, byte ptr [rbx + 8]
0xdeefe1: jne 0x140deefed
0xdeefe3: vmovq rax, xmm0
0xdeefe8: cmp rax, qword ptr [rbx]
0xdeefeb: je 0x140def00f
0xdeefed: add rcx, 8
0xdeeff1: cmp rcx, rdx
0xdeeff4: jne 0x140deefc2
0xdeeff6: jmp 0x140def034
0xdeeff8: mov r8, rbx
0xdeeffb: mov rdx, rbp
0xdeeffe: mov rcx, rsi
0xdef001: call 0x140def770
0xdef006: test rax, rax
0xdef009: je 0x140def034
0xdef00b: mov r9d, dword ptr [r12]
0xdef00f: vmovups xmm0, xmmword ptr [rbx]
0xdef013: mov rax, qword ptr [rsi]
0xdef016: vmovups xmmword ptr [rsp + 0x80], xmm0
0xdef01f: lea r8, [rsp + 0x80]
0xdef027: movzx edx, word ptr [r15]
0xdef02b: mov rcx, rsi
0xdef02e: call qword ptr [rax + 0x558]
0xdef034: mov rax, qword ptr [rsi]
0xdef037: mov r10, qword ptr [rax + 0x550]
0xdef03e: movzx eax, byte ptr [rsp + 0x138]
0xdef046: mov byte ptr [rsp + 0x50], al
0xdef04a: mov qword ptr [rsp + 0x48], r14
0xdef04f: movzx eax, byte ptr [rsp + 0x128]
0xdef057: mov byte ptr [rsp + 0x40], al
0xdef05b: mov qword ptr [rsp + 0x38], r13
0xdef060: mov rax, qword ptr [rsp + 0x120]
0xdef068: mov qword ptr [rsp + 0x30], rax
0xdef06d: mov rax, qword ptr [rsp + 0x118]
0xdef075: mov qword ptr [rsp + 0x28], rax
0xdef07a: mov rax, qword ptr [rsp + 0x110]
0xdef082: mov qword ptr [rsp + 0x20], rax
0xdef087: mov r9, r12
0xdef08a: mov r8, rbx
0xdef08d: mov rdx, r15
0xdef090: mov rcx, rsi
0xdef093: call r10
0xdef096: lea r11, [rsp + 0xc0]
0xdef09e: mov rbx, qword ptr [r11 + 0x30]
0xdef0a2: mov rbp, qword ptr [r11 + 0x38]
0xdef0a6: mov rsi, qword ptr [r11 + 0x40]
0xdef0aa: mov rsp, r11
0xdef0ad: pop r15
0xdef0af: pop r14
0xdef0b1: pop r13
0xdef0b3: pop r12
0xdef0b5: pop rdi
0xdef0b6: ret 