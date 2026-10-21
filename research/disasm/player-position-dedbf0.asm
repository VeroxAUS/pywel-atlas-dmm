0xdedbf0: mov qword ptr [rsp + 0x18], rbx
0xdedbf5: mov qword ptr [rsp + 0x20], r9
0xdedbfa: mov qword ptr [rsp + 8], rcx
0xdedbff: push rbp
0xdedc00: push rsi
0xdedc01: push rdi
0xdedc02: push r12
0xdedc04: push r13
0xdedc06: push r14
0xdedc08: push r15
0xdedc0a: lea rbp, [rsp - 0x27]
0xdedc0f: sub rsp, 0xb0
0xdedc16: mov r13, r8
0xdedc19: mov r15, rdx
0xdedc1c: mov rsi, rcx
0xdedc1f: xor edi, edi
0xdedc21: mov dword ptr [rbp - 0x39], edi
0xdedc24: mov rax, qword ptr [rdx]
0xdedc27: mov rcx, rdx
0xdedc2a: call qword ptr [rax + 0x530]
0xdedc30: movzx ebx, al
0xdedc33: mov r10, qword ptr [r15]
0xdedc36: mov rcx, r15
0xdedc39: call qword ptr [r10 + 0x520]
0xdedc40: test al, al
0xdedc42: jne 0x140dee375
0xdedc48: test bl, bl
0xdedc4a: jne 0x140dee375
0xdedc50: vmovups xmm0, xmmword ptr [r15 + 0xc8]
0xdedc59: vmovups xmmword ptr [rbp - 0x11], xmm0
0xdedc5e: lea r12, [rsi + 0x218]
0xdedc65: mov rdx, r13
0xdedc68: mov rcx, r12
0xdedc6b: call 0x1409b3230
0xdedc70: mov rbx, rax
0xdedc73: test rax, rax
0xdedc76: je 0x140dee375
0xdedc7c: cmp dword ptr [rax + 4], edi
0xdedc7f: je 0x140dee375
0xdedc85: mov edx, 0x10
0xdedc8a: lea rcx, [rbp - 0x11]
0xdedc8e: call 0x141364780
0xdedc93: mov r11d, eax
0xdedc96: mov ecx, dword ptr [rbx]
0xdedc98: test ecx, ecx
0xdedc9a: je 0x140dee375
0xdedca0: xor edx, edx
0xdedca2: div ecx
0xdedca4: mov r9d, edx
0xdedca7: shl r9, 8
0xdedcab: add r9, qword ptr [rbx + 0x10]
0xdedcaf: mov edx, edi
0xdedcb1: mov r10d, dword ptr [r9]
0xdedcb4: test r10d, r10d
0xdedcb7: je 0x140dee375
0xdedcbd: mov r14, qword ptr [rbp - 9]
0xdedcc1: mov rsi, qword ptr [rbp - 0x11]
0xdedcc5: mov eax, edx
0xdedcc7: cmp dword ptr [r9 + rax*8 + 8], r11d
0xdedccc: jne 0x140dedce7
0xdedcce: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0xdedcd3: mov rax, qword ptr [rbx + 0x18]
0xdedcd7: mov r8, qword ptr [rax + rcx*8]
0xdedcdb: cmp byte ptr [r8 + 0x10], r14b
0xdedcdf: jne 0x140dedce7
0xdedce1: cmp qword ptr [r8 + 8], rsi
0xdedce5: je 0x140dedcf3
0xdedce7: inc edx
0xdedce9: cmp edx, r10d
0xdedcec: jb 0x140dedcc5
0xdedcee: jmp 0x140dee375
0xdedcf3: test r8, r8
0xdedcf6: je 0x140dee375
0xdedcfc: add r8, 0x18
0xdedd00: je 0x140dee375
0xdedd06: mov ecx, edi
0xdedd08: mov r9d, dword ptr [r8 + 8]
0xdedd0c: test r9d, r9d
0xdedd0f: je 0x140dee375
0xdedd15: mov r10, qword ptr [r8]
0xdedd18: nop dword ptr [rax + rax]
0xdedd20: mov eax, ecx
0xdedd22: lea rdx, [r10 + rax*8]
0xdedd26: cmp r15, qword ptr [rdx]
0xdedd29: je 0x140dedd37
0xdedd2b: inc ecx
0xdedd2d: cmp ecx, r9d
0xdedd30: jb 0x140dedd20
0xdedd32: jmp 0x140dee375
0xdedd37: cmp ecx, -1
0xdedd3a: je 0x140dee375
0xdedd40: dec r9d
0xdedd43: cmp ecx, r9d
0xdedd46: jae 0x140dedd4f
0xdedd48: mov rcx, qword ptr [r10 + r9*8]
0xdedd4c: mov qword ptr [rdx], rcx
0xdedd4f: add dword ptr [r8 + 8], -1
0xdedd54: jne 0x140dedd70
0xdedd56: vmovups xmm0, xmmword ptr [r15 + 0xc8]
0xdedd5f: vmovups xmmword ptr [rbp - 0x21], xmm0
0xdedd64: lea rdx, [rbp - 0x21]
0xdedd68: mov rcx, rbx
0xdedd6b: call 0x140e00af0
0xdedd70: cmp dword ptr [rbx + 4], edi
0xdedd73: jne 0x140dedd80
0xdedd75: mov rdx, r13
0xdedd78: mov rcx, r12
0xdedd7b: call 0x140e00ca0
0xdedd80: mov qword ptr [rbp - 1], rdi
0xdedd84: mov dword ptr [rbp + 7], edi
0xdedd87: mov dword ptr [rbp + 0xb], 0xffffffff
0xdedd8e: vpxor xmm0, xmm0, xmm0
0xdedd92: vmovdqu xmmword ptr [rbp + 0xf], xmm0
0xdedd97: mov rax, qword ptr [rbp + 0x7f]
0xdedd9b: mov qword ptr [rbp - 0x31], rax
0xdedd9f: inc dword ptr [r12 + 0xc]
0xdedda4: mov edx, 8
0xdedda9: mov rcx, rax
0xdeddac: call 0x1403d6210
0xdeddb1: lea rcx, [rbp - 0x29]
0xdeddb5: mov qword ptr [rsp + 0x38], rcx
0xdeddba: lea rcx, [rbp - 0x21]
0xdeddbe: mov qword ptr [rsp + 0x30], rcx
0xdeddc3: lea rcx, [rbp + 0x6f]
0xdeddc7: mov qword ptr [rsp + 0x28], rcx
0xdeddcc: lea r9, [rbp - 1]
0xdeddd0: mov r8d, eax
0xdeddd3: lea rdx, [rbp - 0x31]
0xdeddd7: mov rcx, r12
0xdeddda: call 0x140e02530
0xdedddf: nop 
0xdedde0: inc dword ptr [rbp + 0xb]
0xdedde3: mov r13d, 0x1fd
0xdedde9: mov ebx, r13d
0xdeddec: mov rcx, qword ptr [rbp + 0xf]
0xdeddf0: test rcx, rcx
0xdeddf3: je 0x140dede20
0xdeddf5: mov dword ptr [rbp - 1], edi
0xdeddf8: mov rax, qword ptr gs:[0x58]
0xdede01: mov rdx, qword ptr [rax]
0xdede04: cmp byte ptr [r13 + rdx], 0
0xdede0a: je 0x140dede13
0xdede0c: call 0x1447f03bc
0xdede11: jmp 0x140dede18
0xdede13: call 0x1447f02bc
0xdede18: mov qword ptr [rbp + 0xf], rdi
0xdede1c: mov qword ptr [rbp + 0xf], rdi
0xdede20: mov r12, qword ptr [rbp + 0x17]
0xdede24: test r12, r12
0xdede27: je 0x140dededd
0xdede2d: mov eax, dword ptr [rbp + 3]
0xdede30: test eax, eax
0xdede32: je 0x140dedeb0
0xdede34: mov rsi, r12
0xdede37: mov r14d, eax
0xdede3a: nop word ptr [rax + rax]
0xdede40: mov rbx, qword ptr [rsi]
0xdede43: mov qword ptr [rbp + 0x6f], rbx
0xdede47: mov rcx, qword ptr [rbx + 0x18]
0xdede4b: test rcx, rcx
0xdede4e: je 0x140dede70
0xdede50: mov rax, qword ptr gs:[0x58]
0xdede59: mov rdx, qword ptr [rax]
0xdede5c: cmp byte ptr [r13 + rdx], 0
0xdede62: je 0x140dede6b
0xdede64: call 0x1447f03bc
0xdede69: jmp 0x140dede70
0xdede6b: call 0x1447f02bc
0xdede70: mov qword ptr [rbx + 0x18], rdi
0xdede74: mov qword ptr [rbx + 0x20], rdi
0xdede78: mov rcx, qword ptr [rsi]
0xdede7b: test rcx, rcx
0xdede7e: je 0x140dedea0
0xdede80: mov rax, qword ptr gs:[0x58]
0xdede89: mov rdx, qword ptr [rax]
0xdede8c: cmp byte ptr [r13 + rdx], 0
0xdede92: je 0x140dede9b
0xdede94: call 0x1447f03bc
0xdede99: jmp 0x140dedea0
0xdede9b: call 0x1447f02bc
0xdedea0: mov qword ptr [rsi], rdi
0xdedea3: add rsi, 8
0xdedea7: sub r14, 1
0xdedeab: jne 0x140dede40
0xdedead: mov ebx, r13d
0xdedeb0: mov qword ptr [rbp + 3], rdi
0xdedeb4: mov rax, qword ptr gs:[0x58]
0xdedebd: mov rdx, qword ptr [rax]
0xdedec0: mov rcx, r12
0xdedec3: cmp byte ptr [rbx + rdx], 0
0xdedec7: je 0x140deded0
0xdedec9: call 0x1447f03bc
0xdedece: jmp 0x140deded5
0xdeded0: call 0x1447f02bc
0xdeded5: mov qword ptr [rbp + 0x17], rdi
0xdeded9: mov qword ptr [rbp + 0x17], rdi
0xdededd: lea rax, [rbp - 0x11]
0xdedee1: mov qword ptr [rbp - 0x31], rax
0xdedee5: mov rbx, qword ptr [rbp - 0x29]
0xdedee9: inc dword ptr [rbx + 0xc]
0xdedeec: mov edx, 0x10
0xdedef1: lea rcx, [rbp - 0x11]
0xdedef5: call 0x141364780
0xdedefa: lea rcx, [rbp - 0x29]
0xdedefe: mov qword ptr [rsp + 0x38], rcx
0xdedf03: lea rcx, [rbp - 0x21]
0xdedf07: mov qword ptr [rsp + 0x30], rcx
0xdedf0c: lea rcx, [rbp + 0x6f]
0xdedf10: mov qword ptr [rsp + 0x28], rcx
0xdedf15: mov r8d, eax
0xdedf18: lea rdx, [rbp - 0x31]
0xdedf1c: mov rcx, rbx
0xdedf1f: call 0x140e02830
0xdedf24: mov rbx, qword ptr [rbp - 0x29]
0xdedf28: mov ecx, dword ptr [rbx + 8]
0xdedf2b: mov eax, dword ptr [rbx + 0xc]
0xdedf2e: mov r8d, 1
0xdedf34: cmp eax, ecx
0xdedf36: ja 0x140dedf57
0xdedf38: lea edx, [rax*2 + 1]
0xdedf3f: add edx, eax
0xdedf41: shr edx, 1
0xdedf43: cmp edx, r8d
0xdedf46: cmovb edx, r8d
0xdedf4a: cmp ecx, edx
0xdedf4c: cmova edx, ecx
0xdedf4f: mov rcx, rbx
0xdedf52: call 0x14035e3f0
0xdedf57: mov ecx, dword ptr [rbx + 8]
0xdedf5a: mov rax, qword ptr [rbx]
0xdedf5d: mov qword ptr [rax + rcx*8], r15
0xdedf61: inc dword ptr [rbx + 8]
0xdedf64: mov r9, qword ptr [rbp + 0x67]
0xdedf68: mov ecx, dword ptr [r9 + 0x250]
0xdedf6f: mov edx, edi
0xdedf71: mov r13, qword ptr [rbp - 9]
0xdedf75: mov r12, qword ptr [rbp - 0x11]
0xdedf79: test ecx, ecx
0xdedf7b: je 0x140dedfad
0xdedf7d: mov r8, qword ptr [r9 + 0x248]
0xdedf84: nop dword ptr [rax]
0xdedf88: nop dword ptr [rax + rax]
0xdedf90: mov eax, edx
0xdedf92: shl rax, 5
0xdedf96: cmp byte ptr [rax + r8 + 8], r13b
0xdedf9b: jne 0x140dedfa7
0xdedf9d: cmp qword ptr [rax + r8], r12
0xdedfa1: je 0x140dee0fd
0xdedfa7: inc edx
0xdedfa9: cmp edx, ecx
0xdedfab: jb 0x140dedf90
0xdedfad: xor sil, sil
0xdedfb0: mov ebx, 0xffffffff
0xdedfb5: mov r14d, ebx
0xdedfb8: mov rdx, qword ptr [rbp + 0x7f]
0xdedfbc: mov rcx, r9
0xdedfbf: call 0x140df4760
0xdedfc4: movzx r8d, al
0xdedfc8: cmp sil, al
0xdedfcb: je 0x140dee375
0xdedfd1: mov r9, qword ptr [rbp + 0x67]
0xdedfd5: mov ecx, dword ptr [r9 + 0x260]
0xdedfdc: mov esi, edi
0xdedfde: test ecx, ecx
0xdedfe0: je 0x140dee009
0xdedfe2: mov rdx, qword ptr [r9 + 0x258]
0xdedfe9: nop dword ptr [rax]
0xdedff0: mov eax, esi
0xdedff2: shl rax, 5
0xdedff6: cmp byte ptr [rax + rdx + 8], r13b
0xdedffb: jne 0x140dee003
0xdedffd: cmp qword ptr [rax + rdx], r12
0xdee001: je 0x140dee00e
0xdee003: inc esi
0xdee005: cmp esi, ecx
0xdee007: jb 0x140dedff0
0xdee009: mov esi, 0xffffffff
0xdee00e: test r8b, r8b
0xdee011: je 0x140dee209
0xdee017: lea rbx, [r9 + 0x248]
0xdee01e: cmp r14d, -1
0xdee022: jne 0x140dee15e
0xdee028: mov qword ptr [rbp - 0x21], rdi
0xdee02c: mov qword ptr [rbp - 0x19], rdi
0xdee030: mov r12d, 1
0xdee036: mov edx, r12d
0xdee039: lea rcx, [rbp - 0x21]
0xdee03d: call 0x14035e3f0
0xdee042: mov ecx, dword ptr [rbp - 0x19]
0xdee045: mov r14, qword ptr [rbp - 0x21]
0xdee049: mov qword ptr [r14 + rcx*8], r15
0xdee04d: inc ecx
0xdee04f: mov dword ptr [rbp - 0x19], ecx
0xdee052: vmovups xmm0, xmmword ptr [rbp - 0x11]
0xdee057: vmovups xmmword ptr [rbp - 1], xmm0
0xdee05c: lea rdx, [rbp - 0x21]
0xdee060: lea rcx, [rbp + 0xf]
0xdee064: call 0x1406b1ed0
0xdee069: nop 
0xdee06a: mov dword ptr [rbp - 0x39], r12d
0xdee06e: mov edx, dword ptr [rbx + 8]
0xdee071: cmp dword ptr [rbx + 0xc], edx
0xdee074: ja 0x140dee07e
0xdee076: mov rcx, rbx
0xdee079: call 0x140e01c50
0xdee07e: mov edx, dword ptr [rbx + 8]
0xdee081: shl rdx, 5
0xdee085: add rdx, qword ptr [rbx]
0xdee088: mov qword ptr [rbp + 0x6f], rdx
0xdee08c: vmovups xmm0, xmmword ptr [rbp - 1]
0xdee091: vmovups xmmword ptr [rdx], xmm0
0xdee095: mov rax, qword ptr [rbp + 0xf]
0xdee099: mov qword ptr [rdx + 0x10], rax
0xdee09d: mov qword ptr [rbp + 0xf], rdi
0xdee0a1: mov eax, dword ptr [rbp + 0x17]
0xdee0a4: mov dword ptr [rdx + 0x18], eax
0xdee0a7: mov dword ptr [rbp + 0x17], edi
0xdee0aa: mov eax, dword ptr [rbp + 0x1b]
0xdee0ad: mov dword ptr [rdx + 0x1c], eax
0xdee0b0: mov dword ptr [rbp + 0x1b], edi
0xdee0b3: inc dword ptr [rbx + 8]
0xdee0b6: and r12d, 0xfffffffe
0xdee0ba: mov dword ptr [rbp - 0x39], r12d
0xdee0be: mov qword ptr [rbp + 0xf], rdi
0xdee0c2: mov qword ptr [rbp + 0x17], rdi
0xdee0c6: test r14, r14
0xdee0c9: je 0x140dee154
0xdee0cf: mov r8d, 0x1fd
0xdee0d5: mov rax, qword ptr gs:[0x58]
0xdee0de: mov rdx, qword ptr [rax]
0xdee0e1: mov rcx, r14
0xdee0e4: cmp byte ptr [r8 + rdx], 0
0xdee0e9: je 0x140dee14f
0xdee0eb: call 0x1447f03bc
0xdee0f0: mov qword ptr [rbp - 0x21], rdi
0xdee0f4: mov qword ptr [rbp - 0x19], rdi
0xdee0f8: jmp 0x140dee1a7
0xdee0fd: xor sil, sil
0xdee100: mov ebx, 0xffffffff
0xdee105: mov r14d, edx
0xdee108: cmp edx, ebx
0xdee10a: je 0x140dedfb8
0xdee110: mov r8d, edx
0xdee113: shl r8, 5
0xdee117: mov rax, qword ptr [r9 + 0x248]
0xdee11e: mov ebx, edi
0xdee120: mov ecx, dword ptr [r8 + rax + 0x18]
0xdee125: test ecx, ecx
0xdee127: je 0x140dee13e
0xdee129: mov r8, qword ptr [r8 + rax + 0x10]
0xdee12e: nop 
0xdee130: mov eax, ebx
0xdee132: cmp r15, qword ptr [r8 + rax*8]
0xdee136: je 0x140dee143
0xdee138: inc ebx
0xdee13a: cmp ebx, ecx
0xdee13c: jb 0x140dee130
0xdee13e: mov ebx, 0xffffffff
0xdee143: cmp ebx, -1
0xdee146: setne sil
0xdee14a: jmp 0x140dedfb8
0xdee14f: call 0x1447f02bc
0xdee154: mov qword ptr [rbp - 0x21], rdi
0xdee158: mov qword ptr [rbp - 0x19], rdi
0xdee15c: jmp 0x140dee1a7
0xdee15e: mov ecx, r14d
0xdee161: shl rcx, 5
0xdee165: mov rbx, qword ptr [rbx]
0xdee168: add rbx, rcx
0xdee16b: mov ecx, dword ptr [rbx + 0x18]
0xdee16e: mov eax, dword ptr [rbx + 0x1c]
0xdee171: cmp eax, ecx
0xdee173: ja 0x140dee199
0xdee175: lea edx, [rax*2 + 1]
0xdee17c: add edx, eax
0xdee17e: shr edx, 1
0xdee180: cmp edx, 1
0xdee183: mov eax, 1
0xdee188: cmovb edx, eax
0xdee18b: cmp ecx, edx
0xdee18d: cmova edx, ecx
0xdee190: lea rcx, [rbx + 0x10]
0xdee194: call 0x14035e3f0
0xdee199: mov ecx, dword ptr [rbx + 0x18]
0xdee19c: mov rax, qword ptr [rbx + 0x10]
0xdee1a0: mov qword ptr [rax + rcx*8], r15
0xdee1a4: inc dword ptr [rbx + 0x18]
0xdee1a7: cmp esi, -1
0xdee1aa: je 0x140dee375
0xdee1b0: mov r8d, esi
0xdee1b3: shl r8, 5
0xdee1b7: mov rsi, qword ptr [rbp + 0x67]
0xdee1bb: add r8, qword ptr [rsi + 0x258]
0xdee1c2: mov ecx, dword ptr [r8 + 0x18]
0xdee1c6: test ecx, ecx
0xdee1c8: je 0x140dee375
0xdee1ce: mov rdx, qword ptr [r8 + 0x10]
0xdee1d2: mov eax, edi
0xdee1d4: cmp r15, qword ptr [rdx + rax*8]
0xdee1d8: je 0x140dee1e5
0xdee1da: inc edi
0xdee1dc: cmp edi, ecx
0xdee1de: jb 0x140dee1d2
0xdee1e0: jmp 0x140dee375
0xdee1e5: cmp edi, -1
0xdee1e8: je 0x140dee375
0xdee1ee: dec ecx
0xdee1f0: cmp edi, ecx
0xdee1f2: jae 0x140dee200
0xdee1f4: mov eax, ecx
0xdee1f6: mov ecx, edi
0xdee1f8: mov rax, qword ptr [rdx + rax*8]
0xdee1fc: mov qword ptr [rdx + rcx*8], rax
0xdee200: dec dword ptr [r8 + 0x18]
0xdee204: jmp 0x140dee375
0xdee209: cmp r14d, -1
0xdee20d: je 0x140dee23e
0xdee20f: mov r8d, r14d
0xdee212: shl r8, 5
0xdee216: add r8, qword ptr [r9 + 0x248]
0xdee21d: cmp ebx, -1
0xdee220: je 0x140dee23e
0xdee222: mov eax, dword ptr [r8 + 0x18]
0xdee226: dec eax
0xdee228: cmp ebx, eax
0xdee22a: jae 0x140dee23a
0xdee22c: mov rdx, qword ptr [r8 + 0x10]
0xdee230: mov ecx, ebx
0xdee232: mov rax, qword ptr [rdx + rax*8]
0xdee236: mov qword ptr [rdx + rcx*8], rax
0xdee23a: dec dword ptr [r8 + 0x18]
0xdee23e: lea rbx, [r9 + 0x258]
0xdee245: cmp esi, -1
0xdee248: jne 0x140dee32d
0xdee24e: mov qword ptr [rbp - 0x21], rdi
0xdee252: mov qword ptr [rbp - 0x19], rdi
0xdee256: mov edx, 1
0xdee25b: lea rcx, [rbp - 0x21]
0xdee25f: call 0x14035e3f0
0xdee264: mov ecx, dword ptr [rbp - 0x19]
0xdee267: mov rsi, qword ptr [rbp - 0x21]
0xdee26b: mov qword ptr [rsi + rcx*8], r15
0xdee26f: inc ecx
0xdee271: mov dword ptr [rbp - 0x19], ecx
0xdee274: vmovups xmm0, xmmword ptr [rbp - 0x11]
0xdee279: vmovups xmmword ptr [rbp - 1], xmm0
0xdee27e: lea rdx, [rbp - 0x21]
0xdee282: lea rcx, [rbp + 0xf]
0xdee286: call 0x1406b1ed0
0xdee28b: nop 
0xdee28c: mov r14d, 2
0xdee292: mov dword ptr [rbp - 0x39], r14d
0xdee296: mov edx, dword ptr [rbx + 8]
0xdee299: cmp dword ptr [rbx + 0xc], edx
0xdee29c: ja 0x140dee2a6
0xdee29e: mov rcx, rbx
0xdee2a1: call 0x140e01c50
0xdee2a6: mov edx, dword ptr [rbx + 8]
0xdee2a9: shl rdx, 5
0xdee2ad: add rdx, qword ptr [rbx]
0xdee2b0: mov qword ptr [rbp + 0x6f], rdx
0xdee2b4: vmovups xmm0, xmmword ptr [rbp - 1]
0xdee2b9: vmovups xmmword ptr [rdx], xmm0
0xdee2bd: mov rax, qword ptr [rbp + 0xf]
0xdee2c1: mov qword ptr [rdx + 0x10], rax
0xdee2c5: mov qword ptr [rbp + 0xf], rdi
0xdee2c9: mov eax, dword ptr [rbp + 0x17]
0xdee2cc: mov dword ptr [rdx + 0x18], eax
0xdee2cf: mov dword ptr [rbp + 0x17], edi
0xdee2d2: mov eax, dword ptr [rbp + 0x1b]
0xdee2d5: mov dword ptr [rdx + 0x1c], eax
0xdee2d8: mov dword ptr [rbp + 0x1b], edi
0xdee2db: inc dword ptr [rbx + 8]
0xdee2de: and r14d, 0xfffffffd
0xdee2e2: mov dword ptr [rbp - 0x39], r14d
0xdee2e6: mov qword ptr [rbp + 0xf], rdi
0xdee2ea: mov qword ptr [rbp + 0x17], rdi
0xdee2ee: test rsi, rsi
0xdee2f1: je 0x140dee323
0xdee2f3: mov r8d, 0x1fd
0xdee2f9: mov rax, qword ptr gs:[0x58]
0xdee302: mov rdx, qword ptr [rax]
0xdee305: mov rcx, rsi
0xdee308: cmp byte ptr [r8 + rdx], 0
0xdee30d: je 0x140dee31e
0xdee30f: call 0x1447f03bc
0xdee314: mov qword ptr [rbp - 0x21], rdi
0xdee318: mov qword ptr [rbp - 0x19], rdi
0xdee31c: jmp 0x140dee375
0xdee31e: call 0x1447f02bc
0xdee323: mov qword ptr [rbp - 0x21], rdi
0xdee327: mov qword ptr [rbp - 0x19], rdi
0xdee32b: jmp 0x140dee375
0xdee32d: mov ecx, esi
0xdee32f: shl rcx, 5
0xdee333: mov rbx, qword ptr [rbx]
0xdee336: add rbx, rcx
0xdee339: mov ecx, dword ptr [rbx + 0x18]
0xdee33c: mov eax, dword ptr [rbx + 0x1c]
0xdee33f: cmp eax, ecx
0xdee341: ja 0x140dee367
0xdee343: lea edx, [rax*2 + 1]
0xdee34a: add edx, eax
0xdee34c: shr edx, 1
0xdee34e: cmp edx, 1
0xdee351: mov eax, 1
0xdee356: cmovb edx, eax
0xdee359: cmp ecx, edx
0xdee35b: cmova edx, ecx
0xdee35e: lea rcx, [rbx + 0x10]
0xdee362: call 0x14035e3f0
0xdee367: mov ecx, dword ptr [rbx + 0x18]
0xdee36a: mov rax, qword ptr [rbx + 0x10]
0xdee36e: mov qword ptr [rax + rcx*8], r15
0xdee372: inc dword ptr [rbx + 0x18]
0xdee375: mov rbx, qword ptr [rsp + 0x100]
0xdee37d: add rsp, 0xb0
0xdee384: pop r15
0xdee386: pop r14
0xdee388: pop r13
0xdee38a: pop r12
0xdee38c: pop rdi
0xdee38d: pop rsi
0xdee38e: pop rbp
0xdee38f: ret 