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
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x47efa78
0x47efa78: mov qword ptr [rsp + 8], rbx
0x47efa7d: push rdi
0x47efa7e: sub rsp, 0x20
0x47efa82: mov rdi, rcx
0x47efa85: mov rbx, rdx
0x47efa88: lea rcx, [rip + 0x2426f39]
0x47efa8f: call qword ptr [rip + 0x9fb753]
0x47efa95: mov rax, qword ptr [rip + 0x241ebcc]
0x47efa9c: test rax, rax
0x47efa9f: jne 0x1447efaad
0x47efaa1: call 0x1447f19a8
0x47efaa6: mov qword ptr [rip + 0x241ebbb], rax
0x47efaad: mov r8, rbx
0x47efab0: mov rdx, rdi
0x47efab3: mov rcx, rax
0x47efab6: call 0x1447ef648
0x47efabb: lea rcx, [rip + 0x2426f06]
0x47efac2: mov rbx, rax
0x47efac5: call qword ptr [rip + 0x9fb725]
0x47efacb: mov rax, rbx
0x47eface: mov rbx, qword ptr [rsp + 0x30]
0x47efad3: add rsp, 0x20
0x47efad7: pop rdi
0x47efad8: ret 
CALLEE 0x47ef9b0
0x47ef9b0: mov qword ptr [rsp + 8], rbx
0x47ef9b5: mov qword ptr [rsp + 0x10], rsi
0x47ef9ba: push rdi
0x47ef9bb: sub rsp, 0x20
0x47ef9bf: mov rax, qword ptr gs:[0x58]
0x47ef9c8: mov rdi, rdx
0x47ef9cb: mov r8d, dword ptr [rip + 0x249927e]
0x47ef9d2: mov rsi, rcx
0x47ef9d5: mov rbx, qword ptr [rax + r8*8]
0x47ef9d9: mov eax, 0x98
0x47ef9de: cmp byte ptr [rax + rbx], 0
0x47ef9e2: jne 0x1447ef9e9
0x47ef9e4: call 0x1448953c4
0x47ef9e9: mov ecx, 0x90
0x47ef9ee: mov r8, rdi
0x47ef9f1: mov rdx, rsi
0x47ef9f4: mov rcx, qword ptr [rcx + rbx]
0x47ef9f8: mov rbx, qword ptr [rsp + 0x30]
0x47ef9fd: mov rsi, qword ptr [rsp + 0x38]
0x47efa02: add rsp, 0x20
0x47efa06: pop rdi
0x47efa07: jmp 0x1447ef648
CALLEE 0xe02b10
0xe02b10: mov qword ptr [rsp + 0x10], rbx
0xe02b15: mov qword ptr [rsp + 0x20], r9
0xe02b1a: push rbp
0xe02b1b: push rsi
0xe02b1c: push rdi
0xe02b1d: push r12
0xe02b1f: push r13
0xe02b21: push r14
0xe02b23: push r15
0xe02b25: sub rsp, 0x30
0xe02b29: mov esi, r8d
0xe02b2c: mov r13, rdx
0xe02b2f: mov rdi, rcx
0xe02b32: cmp dword ptr [rcx], 0
0xe02b35: jne 0x140e02b3f
0xe02b37: mov edx, r8d
0xe02b3a: call 0x140391680
0xe02b3f: mov r10d, dword ptr [rdi]
0xe02b42: lea r14, [rdi + 0x10]
0xe02b46: test r10d, r10d
0xe02b49: je 0x140e02b90
0xe02b4b: xor edx, edx
0xe02b4d: mov eax, esi
0xe02b4f: div r10d
0xe02b52: mov r8d, edx
0xe02b55: shl r8, 8
0xe02b59: add r8, qword ptr [r14]
0xe02b5c: xor edx, edx
0xe02b5e: mov r9d, dword ptr [r8]
0xe02b61: test r9d, r9d
0xe02b64: je 0x140e02b90
0xe02b66: cmp dword ptr [r8 + rdx*8 + 8], esi
0xe02b6b: jne 0x140e02b89
0xe02b6d: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe02b72: mov rax, qword ptr [rdi + 0x18]
0xe02b76: mov rbx, qword ptr [rax + rcx*8]
0xe02b7a: mov rax, qword ptr [r13]
0xe02b7e: mov ecx, dword ptr [rax]
0xe02b80: cmp dword ptr [rbx + 4], ecx
0xe02b83: je 0x140e02c4b
0xe02b89: inc edx
0xe02b8b: cmp edx, r9d
0xe02b8e: jb 0x140e02b66
0xe02b90: mov rax, qword ptr [rsp + 0x98]
0xe02b98: mov byte ptr [rax], 0
0xe02b9b: xor edx, edx
0xe02b9d: mov eax, esi
0xe02b9f: div r10d
0xe02ba2: mov ecx, edx
0xe02ba4: shl rcx, 8
0xe02ba8: mov rax, qword ptr [r14]
0xe02bab: cmp dword ptr [rcx + rax], 0x1f
0xe02baf: jne 0x140e02bc1
0xe02bb1: mov edx, esi
0xe02bb3: mov rcx, rdi
0xe02bb6: call 0x140391680
0xe02bbb: xor edx, edx
0xe02bbd: mov eax, esi
0xe02bbf: div dword ptr [rdi]
0xe02bc1: mov r8d, edx
0xe02bc4: shl r8, 8
0xe02bc8: add r8, qword ptr [r14]
0xe02bcb: mov qword ptr [rsp + 0x28], r8
0xe02bd0: mov ecx, dword ptr [r8]
0xe02bd3: mov dword ptr [rsp + 0x70], ecx
0xe02bd7: imul eax, edx, 0x1f
0xe02bda: add eax, ecx
0xe02bdc: mov dword ptr [rsp + 0x20], eax
0xe02be0: lea r14, [rdi + 4]
0xe02be4: mov r15d, dword ptr [r14]
0xe02be7: mov dword ptr [rsp + 0xb0], r15d
0xe02bef: lea r12, [rdi + 8]
0xe02bf3: mov ecx, dword ptr [r12]
0xe02bf7: mov rbp, r14
0xe02bfa: mov edx, 0x1fd
0xe02bff: cmp r15d, ecx
0xe02c02: jb 0x140e02d27
0xe02c08: lea eax, [r15 + 1]
0xe02c0c: cmp eax, ecx
0xe02c0e: jbe 0x140e02d27
0xe02c14: lea eax, [rax + rax*2]
0xe02c17: inc eax
0xe02c19: shr eax, 1
0xe02c1b: mov dword ptr [rsp + 0x90], eax
0xe02c22: lea ecx, [rax*8]
0xe02c29: mov r15d, edx
0xe02c2c: mov rax, qword ptr gs:[0x58]
0xe02c35: mov rdx, qword ptr [rax]
0xe02c38: cmp byte ptr [r15 + rdx], 0
0xe02c3d: mov edx, 0x40
0xe02c42: je 0x140e02c64
0xe02c44: call 0x1447efa78
0xe02c49: jmp 0x140e02c69
0xe02c4b: test rbx, rbx
0xe02c4e: je 0x140e02b90
0xe02c54: mov rax, qword ptr [rsp + 0x98]
0xe02c5c: mov byte ptr [rax], 1
0xe02c5f: jmp 0x140e02dc5
0xe02c64: call 0x1447ef9b0
0xe02c69: mov rbp, rax
0xe02c6c: test rax, rax
0xe02c6f: jne 0x140e02c94
0xe02c71: call 0x141318e70
0xe02c76: xor r9d, r9d
0xe02c79: xor r8d, r8d
0xe02c7c: mov edx, 1
0xe02c81: mov ecx, 0xa0000002
0xe02c86: call qword ptr [rip + 0x43e84bc]
0xe02c8c: lea r14, [rdi + 4]
0xe02c90: lea r12, [rdi + 8]
0xe02c94: lea rbx, [rdi + 0x18]
0xe02c98: cmp qword ptr [rbx], 0
0xe02c9c: je 0x140e02d03
0xe02c9e: xor r8d, r8d
0xe02ca1: mov rcx, rbx
0xe02ca4: cmp dword ptr [r14], r8d
0xe02ca7: jbe 0x140e02cd9
0xe02ca9: nop dword ptr [rax]
0xe02cb0: lea rdx, [r8*8]
0xe02cb8: mov rax, qword ptr [rbx]
0xe02cbb: mov rcx, qword ptr [rdx + rax]
0xe02cbf: mov qword ptr [rdx + rbp], rcx
0xe02cc3: inc r8d
0xe02cc6: cmp r8d, dword ptr [r14]
0xe02cc9: jb 0x140e02cb0
0xe02ccb: mov r15d, 0x1fd
0xe02cd1: lea rcx, [rdi + 0x18]
0xe02cd5: lea r12, [rdi + 8]
0xe02cd9: mov rbx, rcx
0xe02cdc: mov rcx, qword ptr [rcx]
0xe02cdf: test rcx, rcx
0xe02ce2: je 0x140e02d03
0xe02ce4: mov rax, qword ptr gs:[0x58]
0xe02ced: mov rdx, qword ptr [rax]
0xe02cf0: cmp byte ptr [r15 + rdx], 0
0xe02cf5: je 0x140e02cfe
0xe02cf7: call 0x1447f03bc
0xe02cfc: jmp 0x140e02d03
0xe02cfe: call 0x1447f02bc
0xe02d03: mov qword ptr [rbx], rbp
0xe02d06: mov eax, dword ptr [rsp + 0x90]
0xe02d0d: mov dword ptr [r12], eax
0xe02d11: lea rbp, [rdi + 4]
0xe02d15: mov r15d, dword ptr [rsp + 0xb0]
0xe02d1d: mov r8, qword ptr [rsp + 0x28]
0xe02d22: mov edx, 0x1fd
0xe02d27: mov eax, dword ptr [rsp + 0x70]
0xe02d2b: mov dword ptr [r8 + rax*8 + 8], esi
0xe02d30: mov dword ptr [r8 + rax*8 + 0xc], r15d
0xe02d35: inc dword ptr [r8]
0xe02d38: mov rax, qword ptr gs:[0x58]
0xe02d41: mov rcx, qword ptr [rax]
0xe02d44: cmp byte ptr [rdx + rcx], 0
0xe02d48: mov edx, 8
0xe02d4d: mov ecx, 0x10
0xe02d52: je 0x140e02d5b
0xe02d54: call 0x1447efa78
0xe02d59: jmp 0x140e02d60
0xe02d5b: call 0x1447ef9b0
0xe02d60: mov rbx, rax
0xe02d63: test rax, rax
0xe02d66: jne 0x140e02d87
0xe02d68: call 0x141318e70
0xe02d6d: xor r9d, r9d
0xe02d70: xor r8d, r8d
0xe02d73: mov edx, 1
0xe02d78: mov ecx, 0xa0000002
0xe02d7d: call qword ptr [rip + 0x43e83c5]
0xe02d83: lea rbp, [rdi + 4]
0xe02d87: mov qword ptr [rsp + 0x70], rbx
0xe02d8c: mov rax, qword ptr [r13]
0xe02d90: mov ecx, dword ptr [rax]
0xe02d92: mov eax, dword ptr [rsp + 0x20]
0xe02d96: mov dword ptr [rbx], eax
0xe02d98: mov dword ptr [rbx + 4], ecx
0xe02d9b: mov rax, qword ptr [rsp + 0x88]
0xe02da3: mov rax, qword ptr [rax]
0xe02da6: mov qword ptr [rbx + 8], 0
0xe02dae: test rax, rax
0xe02db1: je 0x140e02db7
0xe02db3: mov qword ptr [rbx + 8], rax
0xe02db7: mov ecx, r15d
0xe02dba: mov rax, qword ptr [rdi + 0x18]
0xe02dbe: mov qword ptr [rax + rcx*8], rbx
0xe02dc2: inc dword ptr [rbp]
0xe02dc5: lea rcx, [rbx + 4]
0xe02dc9: mov rax, qword ptr [rsp + 0xa0]
0xe02dd1: mov qword ptr [rax], rcx
0xe02dd4: lea rcx, [rbx + 8]
0xe02dd8: mov rax, qword ptr [rsp + 0xa8]
0xe02de0: mov qword ptr [rax], rcx
0xe02de3: mov rbx, qword ptr [rsp + 0x78]
0xe02de8: add rsp, 0x30
0xe02dec: pop r15
0xe02dee: pop r14
0xe02df0: pop r13
0xe02df2: pop r12
0xe02df4: pop rdi
0xe02df5: pop rsi
0xe02df6: pop rbp
0xe02df7: ret 
CALLEE 0x64f570
0x64f570: mov qword ptr [rsp + 8], rbx
0x64f575: mov qword ptr [rsp + 0x10], rdx
0x64f57a: push rdi
0x64f57b: sub rsp, 0x50
0x64f57f: mov rbx, rdx
0x64f582: xor edi, edi
0x64f584: mov dword ptr [rsp + 0x20], edi
0x64f588: test r8d, r8d
0x64f58b: jne 0x14064f5cd
0x64f58d: lea rdx, [rip + 0x50d68b4]
0x64f594: mov qword ptr [rbx], rdx
0x64f597: mov qword ptr [rbx + 8], rdi
0x64f59b: mov word ptr [rbx + 0x10], di
0x64f59f: mov qword ptr [rbx + 0x18], rdi
0x64f5a3: lea rax, [rip + 0x4f244de]
0x64f5aa: mov qword ptr [rbx], rax
0x64f5ad: lea rax, [rip + 0x4f24494]
0x64f5b4: mov qword ptr [rbx], rax
0x64f5b7: mov dword ptr [rsp + 0x20], 1
0x64f5bf: mov rax, rbx
0x64f5c2: mov rbx, qword ptr [rsp + 0x60]
0x64f5c7: add rsp, 0x50
0x64f5cb: pop rdi
0x64f5cc: ret 
0x64f5cd: lea rdx, [rsp + 0x28]
0x64f5d2: mov rcx, qword ptr [rip + 0x6719bb7]
0x64f5d9: mov rcx, qword ptr [rcx + 0x30]
0x64f5dd: call 0x1408adfe0
0x64f5e2: nop 
0x64f5e3: lea rdx, [rip + 0x50d685e]
0x64f5ea: mov qword ptr [rbx], rdx
0x64f5ed: mov rcx, qword ptr [rax + 8]
0x64f5f1: mov qword ptr [rbx + 8], rcx
0x64f5f5: movzx ecx, byte ptr [rax + 0x10]
0x64f5f9: mov byte ptr [rbx + 0x10], cl
0x64f5fc: movzx ecx, byte ptr [rax + 0x11]
0x64f600: mov byte ptr [rbx + 0x11], cl
0x64f603: mov rcx, qword ptr [rax + 0x18]
0x64f607: mov qword ptr [rbx + 0x18], rcx
0x64f60b: mov qword ptr [rax + 8], rdi
0x64f60f: mov byte ptr [rax + 0x10], 0
0x64f613: lea rax, [rip + 0x4f2446e]
0x64f61a: mov qword ptr [rbx], rax
0x64f61d: lea rax, [rip + 0x4f24424]
0x64f624: mov qword ptr [rbx], rax
0x64f627: mov dword ptr [rsp + 0x20], 1
0x64f62f: mov qword ptr [rsp + 0x28], rdx
0x64f634: lea rcx, [rsp + 0x28]
0x64f639: call 0x141434880
0x64f63e: mov rax, rbx
0x64f641: mov rbx, qword ptr [rsp + 0x60]
0x64f646: add rsp, 0x50
0x64f64a: pop rdi
0x64f64b: ret 
0x64f64c: int3 
CALLEE 0x1434880
0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 
CALLEE 0x388f30
0x388f30: mov qword ptr [rsp + 0x10], rbx
0x388f35: mov qword ptr [rsp + 0x18], rbp
0x388f3a: push rsi
0x388f3b: push rdi
0x388f3c: push r14
0x388f3e: sub rsp, 0x50
0x388f42: mov edi, dword ptr [rcx]
0x388f44: mov rbx, qword ptr [rip + 0x69e0b2d]
0x388f4b: cmp edi, dword ptr [rbx + 8]
0x388f4e: jae 0x140389036
0x388f54: lea rsi, [rdi*8]
0x388f5c: mov rax, qword ptr [rbx + 0x58]
0x388f60: mov rax, qword ptr [rsi + rax]
0x388f64: test rax, rax
0x388f67: jne 0x140389040
0x388f6d: lea r14, [rbx + 0x90]
0x388f74: cmp qword ptr [r14], rax
0x388f77: jne 0x140388f9e
0x388f79: mov qword ptr [rsp + 0x20], r14
0x388f7e: xor r9d, r9d
0x388f81: mov r8, qword ptr [rip + 0x5711ca0]
0x388f88: mov rdx, qword ptr [rbx + 0x10]
0x388f8c: lea rcx, [rsp + 0x70]
0x388f91: call 0x1425c5230
0x388f96: mov eax, dword ptr [rsp + 0x70]
0x388f9a: test eax, eax
0x388f9c: jne 0x140389017
0x388f9e: call 0x141416af0
0x388fa3: add rax, 0x7d0
0x388fa9: mov qword ptr [rbx + 0x98], rax
0x388fb0: mov rcx, qword ptr [r14]
0x388fb3: mov rdx, qword ptr [rbx + 0x28]
0x388fb7: lea r14, [rip + 0x5398d02]
0x388fbe: mov qword ptr [rsp + 0x30], r14
0x388fc3: mov byte ptr [rsp + 0x38], 0
0x388fc8: lea rbp, [rip + 0x5398c91]
0x388fcf: mov qword ptr [rsp + 0x30], rbp
0x388fd4: mov rax, qword ptr [rcx]
0x388fd7: mov qword ptr [rsp + 0x40], rax
0x388fdc: mov eax, dword ptr [rcx + 0xc]
0x388fdf: mov dword ptr [rsp + 0x48], eax
0x388fe3: mov dword ptr [rsp + 0x4c], 0
0x388feb: mov eax, dword ptr [rdx + rsi + 4]
0x388fef: mov dword ptr [rsp + 0x4c], eax
0x388ff3: lea r9, [rsp + 0x30]
0x388ff8: mov r8d, edi
0x388ffb: lea rdx, [rsp + 0x70]
0x389000: mov rcx, rbx
0x389003: call 0x14038c950
0x389008: nop 
0x389009: mov qword ptr [rsp + 0x30], rbp
0x38900e: mov qword ptr [rsp + 0x30], r14
0x389013: mov eax, dword ptr [rsp + 0x70]
0x389017: mov rcx, qword ptr [rip + 0x6953bc2]
0x38901e: test eax, eax
0x389020: je 0x140389027
0x389022: mov rax, rcx
0x389025: jmp 0x14038902f
0x389027: mov rax, qword ptr [rbx + 0x58]
0x38902b: mov rax, qword ptr [rsi + rax]
0x38902f: test rax, rax
0x389032: je 0x14038903d
0x389034: jmp 0x140389040
0x389036: mov rcx, qword ptr [rip + 0x6953ba3]
0x38903d: mov rax, rcx
0x389040: mov rbx, qword ptr [rsp + 0x78]
0x389045: mov rbp, qword ptr [rsp + 0x80]
0x38904d: add rsp, 0x50
0x389051: pop r14
0x389053: pop rdi
0x389054: pop rsi
0x389055: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x388e00
0x388e00: mov qword ptr [rsp + 0x10], rbx
0x388e05: mov qword ptr [rsp + 0x18], rbp
0x388e0a: push rsi
0x388e0b: push rdi
0x388e0c: push r14
0x388e0e: sub rsp, 0x50
0x388e12: movzx edi, word ptr [rcx]
0x388e15: mov rbx, qword ptr [rip + 0x69e0c64]
0x388e1c: cmp edi, dword ptr [rbx + 8]
0x388e1f: jae 0x140388f08
0x388e25: lea rsi, [rdi*8]
0x388e2d: mov rax, qword ptr [rbx + 0x58]
0x388e31: mov rax, qword ptr [rsi + rax]
0x388e35: test rax, rax
0x388e38: jne 0x140388f12
0x388e3e: lea r14, [rbx + 0x90]
0x388e45: cmp qword ptr [r14], rax
0x388e48: jne 0x140388e6f
0x388e4a: mov qword ptr [rsp + 0x20], r14
0x388e4f: xor r9d, r9d
0x388e52: lea r8, [rip + 0x5712a9f]
0x388e59: mov rdx, qword ptr [rbx + 0x10]
0x388e5d: lea rcx, [rsp + 0x70]
0x388e62: call 0x1425c5230
0x388e67: mov eax, dword ptr [rsp + 0x70]
0x388e6b: test eax, eax
0x388e6d: jne 0x140388ee9
0x388e6f: call 0x141416af0
0x388e74: add rax, 0x7d0
0x388e7a: mov qword ptr [rbx + 0x98], rax
0x388e81: mov rcx, qword ptr [r14]
0x388e84: mov rdx, qword ptr [rbx + 0x28]
0x388e88: lea r14, [rip + 0x5398e31]
0x388e8f: mov qword ptr [rsp + 0x30], r14
0x388e94: mov byte ptr [rsp + 0x38], 0
0x388e99: lea rbp, [rip + 0x5398dc0]
0x388ea0: mov qword ptr [rsp + 0x30], rbp
0x388ea5: mov rax, qword ptr [rcx]
0x388ea8: mov qword ptr [rsp + 0x40], rax
0x388ead: mov eax, dword ptr [rcx + 0xc]
0x388eb0: mov dword ptr [rsp + 0x48], eax
0x388eb4: mov dword ptr [rsp + 0x4c], 0
0x388ebc: mov eax, dword ptr [rdx + rsi + 4]
0x388ec0: mov dword ptr [rsp + 0x4c], eax
0x388ec4: lea r9, [rsp + 0x30]
0x388ec9: movzx r8d, di
0x388ecd: lea rdx, [rsp + 0x70]
0x388ed2: mov rcx, rbx
0x388ed5: call 0x14038b6b0
0x388eda: nop 
0x388edb: mov qword ptr [rsp + 0x30], rbp
0x388ee0: mov qword ptr [rsp + 0x30], r14
0x388ee5: mov eax, dword ptr [rsp + 0x70]
0x388ee9: mov rcx, qword ptr [rip + 0x69788a8]
0x388ef0: test eax, eax
0x388ef2: je 0x140388ef9
0x388ef4: mov rax, rcx
0x388ef7: jmp 0x140388f01
0x388ef9: mov rax, qword ptr [rbx + 0x58]
0x388efd: mov rax, qword ptr [rsi + rax]
0x388f01: test rax, rax
0x388f04: je 0x140388f0f
0x388f06: jmp 0x140388f12
0x388f08: mov rcx, qword ptr [rip + 0x6978889]
0x388f0f: mov rax, rcx
0x388f12: mov rbx, qword ptr [rsp + 0x78]
0x388f17: mov rbp, qword ptr [rsp + 0x80]
0x388f1f: add rsp, 0x50
0x388f23: pop r14
0x388f25: pop rdi
0x388f26: pop rsi
0x388f27: ret 
CALLEE 0xdef770
0xdef770: mov qword ptr [rsp + 8], rbx
0xdef775: push rdi
0xdef776: sub rsp, 0x20
0xdef77a: cmp dword ptr [rcx + 0x15c], 0
0xdef781: mov rdi, r8
0xdef784: mov r10, rcx
0xdef787: je 0x140def7d7
0xdef789: mov ecx, dword ptr [rcx + 0x158]
0xdef78f: test ecx, ecx
0xdef791: je 0x140def7d7
0xdef793: mov r9d, dword ptr [rdx]
0xdef796: xor edx, edx
0xdef798: mov eax, r9d
0xdef79b: div ecx
0xdef79d: xor eax, eax
0xdef79f: mov r11d, edx
0xdef7a2: shl r11, 8
0xdef7a6: add r11, qword ptr [r10 + 0x168]
0xdef7ad: mov ebx, dword ptr [r11]
0xdef7b0: test ebx, ebx
0xdef7b2: je 0x140def7d7
0xdef7b4: cmp dword ptr [r11 + rax*8 + 8], r9d
0xdef7b9: jne 0x140def7d1
0xdef7bb: mov edx, dword ptr [r11 + rax*8 + 0xc]
0xdef7c0: mov rcx, qword ptr [r10 + 0x170]
0xdef7c7: mov r8, qword ptr [rcx + rdx*8]
0xdef7cb: cmp dword ptr [r8 + 4], r9d
0xdef7cf: je 0x140def7e4
0xdef7d1: inc eax
0xdef7d3: cmp eax, ebx
0xdef7d5: jb 0x140def7b4
0xdef7d7: xor eax, eax
0xdef7d9: mov rbx, qword ptr [rsp + 0x30]
0xdef7de: add rsp, 0x20
0xdef7e2: pop rdi
0xdef7e3: ret 
0xdef7e4: lea rcx, [r8 + 8]
0xdef7e8: test rcx, rcx
0xdef7eb: je 0x140def7d7
0xdef7ed: mov rdx, rdi
0xdef7f0: call 0x140de4500
0xdef7f5: test rax, rax
0xdef7f8: je 0x140def7d7
0xdef7fa: mov rax, qword ptr [rax]
0xdef7fd: mov rbx, qword ptr [rsp + 0x30]
0xdef802: add rsp, 0x20
0xdef806: pop rdi
0xdef807: ret 
