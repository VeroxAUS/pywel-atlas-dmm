0x9fea40: mov qword ptr [rsp + 8], rbx
0x9fea45: mov qword ptr [rsp + 0x10], rsi
0x9fea4a: mov qword ptr [rsp + 0x18], rdi
0x9fea4f: push rbp
0x9fea50: push r14
0x9fea52: push r15
0x9fea54: lea rbp, [rsp - 0x1b0]
0x9fea5c: sub rsp, 0x2b0
0x9fea63: mov rsi, r9
0x9fea66: mov r15, r8
0x9fea69: mov r14, rdx
0x9fea6c: mov rbx, rcx
0x9fea6f: xor edi, edi
0x9fea71: lea rdx, [rsp + 0x48]
0x9fea76: mov rcx, qword ptr [rip + 0x636a713]
0x9fea7d: mov rcx, qword ptr [rcx + 0x30]
0x9fea81: call 0x1408b44e0
0x9fea86: nop 
0x9fea87: cmp byte ptr [rsp + 0x58], dil
0x9fea8c: jne 0x1409feb02
0x9fea8e: mov eax, dword ptr [rip + 0x62e6684]
0x9fea94: mov dword ptr [r14], eax
0x9fea97: lea rax, [rip + 0x4d273aa]
0x9fea9e: mov qword ptr [rsp + 0x48], rax
0x9feaa3: cmp byte ptr [rsp + 0x58], dil
0x9feaa8: je 0x1409fed0c
0x9feaae: cmp byte ptr [rsp + 0x59], dil
0x9feab3: jne 0x1409feac8
0x9feab5: mov rcx, qword ptr [rsp + 0x50]
0x9feaba: mov rax, qword ptr [rcx]
0x9feabd: call qword ptr [rax + 8]
0x9feac0: movzx edi, al
0x9feac3: jmp 0x1409fece9
0x9feac8: mov rsi, qword ptr [rsp + 0x50]
0x9feacd: lea rbx, [rsi + 0x18]
0x9fead1: mov qword ptr [rsp + 0x68], rbx
0x9fead6: mov rax, qword ptr [rbx]
0x9fead9: mov rcx, rbx
0x9feadc: call qword ptr [rax + 8]
0x9feadf: nop 
0x9feae0: dec word ptr [rsi + 0x48]
0x9feae4: cmp byte ptr [rsi + 0x4a], 0
0x9feae8: jne 0x1409feafa
0x9feaea: lock xadd dword ptr [rsi + 0x10], edi
0x9feaef: add di, word ptr [rsi + 0x48]
0x9feaf3: jne 0x1409feafa
0x9feaf5: mov dil, 1
0x9feaf8: jmp 0x1409feafd
0x9feafa: xor dil, dil
0x9feafd: jmp 0x1409fece0
0x9feb02: mov rax, qword ptr [rbx + 8]
0x9feb06: mov ecx, dword ptr [rax + 0x60]
0x9feb09: mov dword ptr [rsp + 0x68], ecx
0x9feb0d: mov r9, rsi
0x9feb10: lea r8, [rsp + 0x68]
0x9feb15: mov rcx, qword ptr [rsp + 0x50]
0x9feb1a: call 0x140b60150
0x9feb1f: mov rdx, r15
0x9feb22: lea rcx, [rbp]
0x9feb26: call 0x141fe25c0
0x9feb2b: nop 
0x9feb2c: mov dword ptr [rbp + 0x6c], 0x19
0x9feb33: mov dword ptr [rbp + 0x70], 0x19
0x9feb3a: vxorps xmm1, xmm1, xmm1
0x9feb3e: vmovss dword ptr [rbp - 0x80], xmm1
0x9feb43: vmovss dword ptr [rbp - 0x7c], xmm1
0x9feb48: vmovss dword ptr [rbp - 0x78], xmm1
0x9feb4d: mov dword ptr [rbp - 0x74], edi
0x9feb50: mov rsi, 0xffffffffffffffff
0x9feb57: mov qword ptr [rbp - 0x70], rsi
0x9feb5b: mov rax, qword ptr [rip + 0x4b47336]
0x9feb62: mov qword ptr [rbp - 0x68], rax
0x9feb66: mov dword ptr [rbp - 0x60], 0x3f800000
0x9feb6d: vmovss dword ptr [rbp - 0x5c], xmm1
0x9feb72: vmovss dword ptr [rbp - 0x58], xmm1
0x9feb77: vmovss dword ptr [rbp - 0x54], xmm1
0x9feb7c: vmovdqu xmm0, xmmword ptr [rip + 0x537671c]
0x9feb84: vmovups xmmword ptr [rbp - 0x50], xmm0
0x9feb89: mov dword ptr [rbp - 0x40], edi
0x9feb8c: vmovss dword ptr [rbp - 0x3c], xmm1
0x9feb91: vmovss dword ptr [rbp - 0x38], xmm1
0x9feb96: vmovss dword ptr [rbp - 0x34], xmm1
0x9feb9b: vmovss xmm0, dword ptr [rip + 0x5374511]
0x9feba3: vmovss dword ptr [rbp - 0x30], xmm0
0x9feba8: lea r8, [rbp - 0x80]
0x9febac: lea rdx, [rbp]
0x9febb0: mov rcx, qword ptr [rbx + 8]
0x9febb4: call 0x141efeb20
0x9febb9: test al, al
0x9febbb: je 0x1409fec74
0x9febc1: mov rax, qword ptr [rbx + 8]
0x9febc5: lea rdx, [rax + 8]
0x9febc9: test rax, rax
0x9febcc: cmove rdx, rdi
0x9febd0: mov r8b, 1
0x9febd3: mov rdx, qword ptr [rdx]
0x9febd6: lea rcx, [rbp - 0x18]
0x9febda: call 0x140393650
0x9febdf: nop 
0x9febe0: lea rcx, [rbp - 0x68]
0x9febe4: call 0x1403933a0
0x9febe9: test al, al
0x9febeb: je 0x1409febfa
0x9febed: vmovups xmm0, xmmword ptr [rbp - 0x80]
0x9febf2: vmovups xmmword ptr [rsp + 0x68], xmm0
0x9febf8: jmp 0x1409fec0c
0x9febfa: lea r8, [rbp - 0x80]
0x9febfe: lea rdx, [rsp + 0x68]
0x9fec03: lea rcx, [rbp - 0x68]
0x9fec07: call 0x14050ea80
0x9fec0c: mov byte ptr [rsp + 0x30], 0
0x9fec11: mov byte ptr [rsp + 0x28], 0
0x9fec16: lea rax, [rip + 0x4b4726b]
0x9fec1d: mov qword ptr [rsp + 0x20], rax
0x9fec22: xor r9d, r9d
0x9fec25: mov r8b, 4
0x9fec28: lea rdx, [rsp + 0x68]
0x9fec2d: mov rcx, rbx
0x9fec30: call 0x1409fca60
0x9fec35: nop 
0x9fec36: mov rbx, qword ptr [rbp - 0x18]
0x9fec3a: mov rax, qword ptr [rbx]
0x9fec3d: xor edx, edx
0x9fec3f: mov rcx, rbx
0x9fec42: call qword ptr [rax + 0x20]
0x9fec45: cmp byte ptr [rbp - 0x10], 1
0x9fec49: jne 0x1409fec74
0x9fec4b: lock xadd dword ptr [rbx + 8], esi
0x9fec50: cmp esi, 1
0x9fec53: jne 0x1409fec67
0x9fec55: test dword ptr [rbx + 0xc], 0x40000000
0x9fec5c: je 0x1409fec74
0x9fec5e: mov rax, qword ptr [rbx]
0x9fec61: mov rcx, rbx
0x9fec64: call qword ptr [rax + 0x40]
0x9fec67: test dword ptr [rbx + 0xc], 0x40000000
0x9fec6e: je 0x1409fec74
0x9fec70: lock dec dword ptr [rbx + 0xc]
0x9fec74: mov dword ptr [r14], edi
0x9fec77: lea rcx, [rbp + 0x78]
0x9fec7b: call 0x140360470
0x9fec80: nop 
0x9fec81: lea rax, [rip + 0x4d271c0]
0x9fec88: mov qword ptr [rsp + 0x48], rax
0x9fec8d: cmp byte ptr [rsp + 0x58], 0
0x9fec92: je 0x1409fed0c
0x9fec94: cmp byte ptr [rsp + 0x59], 0
0x9fec99: jne 0x1409fecab
0x9fec9b: mov rcx, qword ptr [rsp + 0x50]
0x9feca0: mov rax, qword ptr [rcx]
0x9feca3: call qword ptr [rax + 8]
0x9feca6: movzx edi, al
0x9feca9: jmp 0x1409fece9
0x9fecab: mov rsi, qword ptr [rsp + 0x50]
0x9fecb0: lea rbx, [rsi + 0x18]
0x9fecb4: mov qword ptr [rsp + 0x68], rbx
0x9fecb9: mov rax, qword ptr [rbx]
0x9fecbc: mov rcx, rbx
0x9fecbf: call qword ptr [rax + 8]
0x9fecc2: nop 
0x9fecc3: dec word ptr [rsi + 0x48]
0x9fecc7: cmp byte ptr [rsi + 0x4a], 0
0x9feccb: jne 0x1409fecdd
0x9feccd: lock xadd dword ptr [rsi + 0x10], edi
0x9fecd2: add di, word ptr [rsi + 0x48]
0x9fecd6: jne 0x1409fecdd
0x9fecd8: mov dil, 1
0x9fecdb: jmp 0x1409fece0
0x9fecdd: xor dil, dil
0x9fece0: mov rax, qword ptr [rbx]
0x9fece3: mov rcx, rbx
0x9fece6: call qword ptr [rax + 0x10]
0x9fece9: test dil, dil
0x9fecec: je 0x1409fed07
0x9fecee: mov rcx, qword ptr [rsp + 0x50]
0x9fecf3: xor eax, eax
0x9fecf5: mov edx, 1
0x9fecfa: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x9fecff: jne 0x1409fed07
0x9fed01: mov rax, qword ptr [rcx]
0x9fed04: call qword ptr [rax + 0x10]
0x9fed07: mov byte ptr [rsp + 0x58], 0
0x9fed0c: mov rax, r14
0x9fed0f: lea r11, [rsp + 0x2b0]
0x9fed17: mov rbx, qword ptr [r11 + 0x20]
0x9fed1b: mov rsi, qword ptr [r11 + 0x28]
0x9fed1f: mov rdi, qword ptr [r11 + 0x30]
0x9fed23: mov rsp, r11
0x9fed26: pop r15
0x9fed28: pop r14
0x9fed2a: pop rbp
0x9fed2b: ret 