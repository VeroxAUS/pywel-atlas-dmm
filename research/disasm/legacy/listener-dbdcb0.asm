0xdbdcb0: mov rax, rsp
0xdbdcb3: mov qword ptr [rax + 8], rcx
0xdbdcb7: push rbx
0xdbdcb8: push rsi
0xdbdcb9: push rdi
0xdbdcba: push r12
0xdbdcbc: push r13
0xdbdcbe: push r14
0xdbdcc0: push r15
0xdbdcc2: sub rsp, 0x150
0xdbdcc9: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdbdcce: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdbdcd3: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdbdcd8: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdbdcdd: vmovaps xmmword ptr [rax - 0x88], xmm10
0xdbdce5: vmovaps xmmword ptr [rax - 0x98], xmm11
0xdbdced: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xdbdcf5: vmovaps xmmword ptr [rax - 0xb8], xmm13
0xdbdcfd: vmovaps xmmword ptr [rax - 0xc8], xmm14
0xdbdd05: vmovaps xmmword ptr [rax - 0xd8], xmm15
0xdbdd0d: mov r14, rcx
0xdbdd10: xor esi, esi
0xdbdd12: mov dword ptr [rsp + 0x50], esi
0xdbdd16: mov rcx, qword ptr [rcx + 0x7b8]
0xdbdd1d: test rcx, rcx
0xdbdd20: je 0x140dbee7b
0xdbdd26: call 0x143d11360
0xdbdd2b: mov rax, qword ptr [rip + 0x5fab4b6]
0xdbdd32: mov r15, qword ptr [rax + 0xa8]
0xdbdd39: cmp dword ptr [r15 + 0x18], esi
0xdbdd3d: je 0x140dbee7b
0xdbdd43: cmp byte ptr [rip + 0x5ed99ae], sil
0xdbdd4a: je 0x140dbee7b
0xdbdd50: vxorps xmm10, xmm10, xmm10
0xdbdd55: vxorps xmm12, xmm12, xmm12
0xdbdd5a: vxorps xmm13, xmm13, xmm13
0xdbdd5f: mov rax, qword ptr [r14 + 0x5b8]
0xdbdd66: mov edi, 1
0xdbdd6b: test rax, rax
0xdbdd6e: je 0x140dbdd8f
0xdbdd70: vmovsd xmm0, qword ptr [rax + 0xe0]
0xdbdd78: vmovss xmm13, dword ptr [rax + 0xe8]
0xdbdd80: vmovaps xmm12, xmm0
0xdbdd84: vmovsd qword ptr [rsp + 0x60], xmm0
0xdbdd8a: jmp 0x140dbde48
0xdbdd8f: lea rdx, [rsp + 0x60]
0xdbdd94: mov rcx, qword ptr [rip + 0x5fab3f5]
0xdbdd9b: mov rcx, qword ptr [rcx + 0x30]
0xdbdd9f: call 0x1408b4570
0xdbdda4: mov dword ptr [rsp + 0x50], edi
0xdbdda8: cmp byte ptr [rsp + 0x70], 0
0xdbddad: je 0x140dbde29
0xdbddaf: mov rbx, qword ptr [rsp + 0x68]
0xdbddb4: lea rdx, [rbx + 8]
0xdbddb8: test rbx, rbx
0xdbddbb: cmove rdx, rsi
0xdbddbf: mov rdx, qword ptr [rdx]
0xdbddc2: lea rcx, [rsp + 0x198]
0xdbddca: call 0x140393df0
0xdbddcf: nop 
0xdbddd0: mov rcx, qword ptr [rbx + 0x68]
0xdbddd4: lea rdx, [rsp + 0xa0]
0xdbdddc: mov rcx, qword ptr [rcx + 0x1a0]
0xdbdde3: call 0x1404f8220
0xdbdde8: movsx ecx, word ptr [rax + 0xe]
0xdbddec: vxorps xmm0, xmm0, xmm0
0xdbddf0: vcvtsi2ss xmm0, xmm0, ecx
0xdbddf4: vmulss xmm0, xmm0, dword ptr [rip + 0x4fb58f8]
0xdbddfc: vaddss xmm13, xmm0, dword ptr [rax + 8]
0xdbde01: movsx ecx, word ptr [rax + 0xc]
0xdbde05: vxorps xmm1, xmm1, xmm1
0xdbde09: vcvtsi2ss xmm1, xmm1, ecx
0xdbde0d: vmulss xmm0, xmm1, dword ptr [rip + 0x4fb58df]
0xdbde15: vaddss xmm12, xmm0, dword ptr [rax]
0xdbde19: mov rcx, qword ptr [rsp + 0x198]
0xdbde21: mov rax, qword ptr [rcx]
0xdbde24: mov dl, 1
0xdbde26: call qword ptr [rax + 0x20]
0xdbde29: mov eax, edi
0xdbde2b: and eax, 0xfffffffe
0xdbde2e: mov dword ptr [rsp + 0x50], eax
0xdbde32: lea rax, [rip + 0x496800f]
0xdbde39: mov qword ptr [rsp + 0x60], rax
0xdbde3e: lea rcx, [rsp + 0x60]
0xdbde43: call 0x141434880
0xdbde48: vmovss xmm9, dword ptr [r14 + 0xab0]
0xdbde51: vmovss dword ptr [rsp + 0x198], xmm9
0xdbde5a: vmovss xmm14, dword ptr [r14 + 0xab4]
0xdbde63: cmp byte ptr [rip + 0x5eee7fe], 0
0xdbde6a: je 0x140dbded2
0xdbde6c: vmovss xmm0, dword ptr [r14 + 0xaa0]
0xdbde75: vsubss xmm2, xmm0, dword ptr [rip + 0x5eedb6b]
0xdbde7d: vmovss xmm0, dword ptr [rip + 0x5eedc03]
0xdbde85: vsubss xmm1, xmm0, dword ptr [rip + 0x5eedb5b]
0xdbde8d: vdivss xmm5, xmm2, xmm1
0xdbde91: vmovss xmm0, dword ptr [rip + 0x5eee81f]
0xdbde99: vsubss xmm1, xmm0, dword ptr [rip + 0x5eee867]
0xdbdea1: vmulss xmm2, xmm1, xmm5
0xdbdea5: vaddss xmm0, xmm2, dword ptr [rip + 0x5eee85b]
0xdbdead: vmovss dword ptr [rsp + 0x198], xmm0
0xdbdeb6: vmovss xmm0, dword ptr [rip + 0x5eee89a]
0xdbdebe: vsubss xmm1, xmm0, dword ptr [rip + 0x5eee8e2]
0xdbdec6: vmulss xmm2, xmm1, xmm5
0xdbdeca: vaddss xmm14, xmm2, dword ptr [rip + 0x5eee8d6]
0xdbded2: mov rbx, qword ptr [r14 + 8]
0xdbded6: lea rdx, [rsp + 0x1a0]
0xdbdede: mov rcx, qword ptr [rbx + 0x18]
0xdbdee2: call 0x1435b4b90
0xdbdee7: vmovss xmm6, dword ptr [r14 + 0xa98]
0xdbdef0: vmovss xmm15, dword ptr [rip + 0x4fb503c]
0xdbdef8: vmulss xmm0, xmm15, dword ptr [rax + 4]
0xdbdefd: vmulss xmm1, xmm0, xmm6
0xdbdf01: vaddss xmm7, xmm1, dword ptr [r14 + 0xa5c]
0xdbdf0a: vmulss xmm0, xmm15, dword ptr [rax]
0xdbdf0e: vmulss xmm1, xmm0, xmm6
0xdbdf12: vsubss xmm8, xmm1, dword ptr [r14 + 0xa58]
0xdbdf1b: mov rax, qword ptr [rbx + 0xa0]
0xdbdf22: test rax, rax
0xdbdf25: je 0x140dbdf3c
0xdbdf27: cmp qword ptr [rax + 8], 0
0xdbdf2c: je 0x140dbdf3c
0xdbdf2e: mov rcx, qword ptr [rbx + 0x38]
0xdbdf32: call 0x143ed8480
0xdbdf37: mov rcx, rax
0xdbdf3a: jmp 0x140dbdf71
0xdbdf3c: movzx edx, byte ptr [rbx + 0x94]
0xdbdf43: cmp dl, 0xff
0xdbdf46: jne 0x140dbdf4d
0xdbdf48: mov rcx, rsi
0xdbdf4b: jmp 0x140dbdf71
0xdbdf4d: mov rax, qword ptr [rbx + 0x58]
0xdbdf51: mov rcx, qword ptr [rax + 0xb0]
0xdbdf58: mov r8, qword ptr [rcx + 0xb0]
0xdbdf5f: cmp edx, dword ptr [r8 + 8]
0xdbdf63: jb 0x140dbdf6a
0xdbdf65: mov rcx, rsi
0xdbdf68: jmp 0x140dbdf71
0xdbdf6a: mov rax, qword ptr [r8]
0xdbdf6d: mov rcx, qword ptr [rax + rdx*8]
0xdbdf71: cmp byte ptr [rcx + 0x13b], 0
0xdbdf78: jne 0x140dbdf84
0xdbdf7a: vmovss xmm0, dword ptr [rcx + 0xd8]
0xdbdf82: jmp 0x140dbdf9d
0xdbdf84: mov eax, 0xe0
0xdbdf89: mov edx, 0xdc
0xdbdf8e: cmp byte ptr [rcx + 0x13c], 0
0xdbdf95: cmove eax, edx
0xdbdf98: vmovss xmm0, dword ptr [rax + rcx]
0xdbdf9d: vmulss xmm1, xmm0, dword ptr [rcx + 0xd4]
0xdbdfa5: vmovss xmm0, dword ptr [rip + 0x4fb5107]
0xdbdfad: vdivss xmm0, xmm0, xmm6
0xdbdfb1: vmulss xmm1, xmm0, xmm1
0xdbdfb5: mov rax, qword ptr [r14 + 0x7b8]
0xdbdfbc: mov qword ptr [rax + 0x38], 0x3f800000
0xdbdfc4: mov qword ptr [rax + 0x40], rsi
0xdbdfc8: mov dword ptr [rax + 0x48], esi
0xdbdfcb: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbdfd3: mov qword ptr [rax + 0x54], rsi
0xdbdfd7: mov dword ptr [rax + 0x5c], esi
0xdbdfda: mov qword ptr [rax + 0x60], 0x3f800000
0xdbdfe2: vmovss dword ptr [rax + 0x68], xmm8
0xdbdfe7: vmovss dword ptr [rax + 0x6c], xmm7
0xdbdfec: mov dword ptr [rax + 0x70], esi
0xdbdfef: mov dword ptr [rax + 0x74], 0x3f800000
0xdbdff6: vmovss dword ptr [rsp + 0x60], xmm1
0xdbdffc: vmovups xmmword ptr [rsp + 0x64], xmm10
0xdbe002: vmovss dword ptr [rsp + 0x74], xmm1
0xdbe008: vmovss dword ptr [rsp + 0x78], xmm10
0xdbe00e: vmovss dword ptr [rsp + 0x7c], xmm10
0xdbe014: vmovaps ymm0, ymmword ptr [rip + 0x4fb8924]
0xdbe01c: vmovups ymmword ptr [rsp + 0x80], ymm0
0xdbe025: mov rax, qword ptr [r14 + 0x7b8]
0xdbe02c: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbe031: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdbe036: vmovups ymm0, ymmword ptr [rsp + 0x60]
0xdbe03c: vperm2f128 ymm8, ymm0, ymm0, 0
0xdbe042: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdbe048: vmovups ymm1, ymmword ptr [rsp + 0x80]
0xdbe051: vperm2f128 ymm10, ymm1, ymm1, 0
0xdbe057: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdbe05d: vshufps ymm0, ymm3, ymm3, 0
0xdbe062: vshufps ymm1, ymm3, ymm3, 0x55
0xdbe067: vshufps ymm2, ymm3, ymm3, 0xaa
0xdbe06c: vshufps ymm3, ymm3, ymm3, 0xff
0xdbe071: vshufps ymm4, ymm7, ymm7, 0
0xdbe076: vshufps ymm5, ymm7, ymm7, 0x55
0xdbe07b: vshufps ymm6, ymm7, ymm7, 0xaa
0xdbe080: vshufps ymm7, ymm7, ymm7, 0xff
0xdbe085: vmulps ymm0, ymm0, ymm8
0xdbe08a: vfmadd231ps ymm0, ymm1, ymm9
0xdbe08f: vfmadd231ps ymm0, ymm2, ymm10
0xdbe094: vfmadd231ps ymm0, ymm3, ymm11
0xdbe099: vmovups ymmword ptr [rax + 0x38], ymm0
0xdbe09e: vmulps ymm1, ymm4, ymm8
0xdbe0a3: vfmadd231ps ymm1, ymm5, ymm9
0xdbe0a8: vfmadd231ps ymm1, ymm6, ymm10
0xdbe0ad: vfmadd231ps ymm1, ymm7, ymm11
0xdbe0b2: vmovups ymmword ptr [rax + 0x58], ymm1
0xdbe0b7: cmp byte ptr [rip + 0x5fa8c1a], 0
0xdbe0be: je 0x140dbe167
0xdbe0c4: cmp qword ptr [r14 + 0x7b0], 0
0xdbe0cc: je 0x140dbe167
0xdbe0d2: mov rax, qword ptr [r14 + 0x7b8]
0xdbe0d9: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbe0de: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdbe0e3: vmovups ymm0, ymmword ptr [r14 + 0xa18]
0xdbe0ec: vmovups ymm1, ymmword ptr [r14 + 0xa38]
0xdbe0f5: vperm2f128 ymm8, ymm0, ymm0, 0
0xdbe0fb: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdbe101: vperm2f128 ymm10, ymm1, ymm1, 0
0xdbe107: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdbe10d: vshufps ymm0, ymm3, ymm3, 0
0xdbe112: vshufps ymm1, ymm3, ymm3, 0x55
0xdbe117: vshufps ymm2, ymm3, ymm3, 0xaa
0xdbe11c: vshufps ymm3, ymm3, ymm3, 0xff
0xdbe121: vshufps ymm4, ymm7, ymm7, 0
0xdbe126: vshufps ymm5, ymm7, ymm7, 0x55
0xdbe12b: vshufps ymm6, ymm7, ymm7, 0xaa
0xdbe130: vshufps ymm7, ymm7, ymm7, 0xff
0xdbe135: vmulps ymm0, ymm0, ymm8
0xdbe13a: vfmadd231ps ymm0, ymm1, ymm9
0xdbe13f: vfmadd231ps ymm0, ymm2, ymm10
0xdbe144: vfmadd231ps ymm0, ymm3, ymm11
0xdbe149: vmovups ymmword ptr [rax + 0x38], ymm0
0xdbe14e: vmulps ymm1, ymm4, ymm8
0xdbe153: vfmadd231ps ymm1, ymm5, ymm9
0xdbe158: vfmadd231ps ymm1, ymm6, ymm10
0xdbe15d: vfmadd231ps ymm1, ymm7, ymm11
0xdbe162: vmovups ymmword ptr [rax + 0x58], ymm1
0xdbe167: mov r13d, dword ptr [r15 + 0x18]
0xdbe16b: mov dword ptr [rsp + 0x1a0], r13d
0xdbe173: cmp r13d, 1
0xdbe177: jbe 0x140dbee7b
0xdbe17d: mov qword ptr [rsp + 0x60], rsi
0xdbe182: mov qword ptr [rsp + 0x68], rsi
0xdbe187: mov r12d, 0x1fd
0xdbe18d: mov eax, dword ptr [rsp + 0x6c]
0xdbe191: cmp r13d, eax
0xdbe194: jbe 0x140dbe251
0xdbe19a: lea ecx, [r13*8]
0xdbe1a2: mov rax, qword ptr gs:[0x58]
0xdbe1ab: mov rdi, qword ptr [rax]
0xdbe1ae: mov edx, 4
0xdbe1b3: vzeroupper 
0xdbe1b6: cmp byte ptr [r12 + rdi], 0
0xdbe1bb: je 0x140dbe1c4
0xdbe1bd: call 0x1447efa78
0xdbe1c2: jmp 0x140dbe1c9
0xdbe1c4: call 0x1447ef9b0
0xdbe1c9: mov rbx, rax
0xdbe1cc: test rax, rax
0xdbe1cf: jne 0x140dbe1ec
0xdbe1d1: call 0x141318e70
0xdbe1d6: xor r9d, r9d
0xdbe1d9: xor r8d, r8d
0xdbe1dc: mov edx, 1
0xdbe1e1: mov ecx, 0xa0000002
0xdbe1e6: call qword ptr [rip + 0x442cf5c]
0xdbe1ec: mov r8d, esi
0xdbe1ef: cmp dword ptr [rsp + 0x68], esi
0xdbe1f3: jbe 0x140dbe21a
0xdbe1f5: nop word ptr [rax + rax]
0xdbe200: mov edx, r8d
0xdbe203: mov rax, qword ptr [rsp + 0x60]
0xdbe208: mov rcx, qword ptr [rax + rdx*8]
0xdbe20c: mov qword ptr [rbx + rdx*8], rcx
0xdbe210: inc r8d
0xdbe213: cmp r8d, dword ptr [rsp + 0x68]
0xdbe218: jb 0x140dbe200
0xdbe21a: mov rcx, qword ptr [rsp + 0x60]
0xdbe21f: test rcx, rcx
0xdbe222: je 0x140dbe243
0xdbe224: cmp byte ptr [r12 + rdi], 0
0xdbe229: je 0x140dbe23e
0xdbe22b: call 0x1447f03bc
0xdbe230: mov qword ptr [rsp + 0x60], rbx
0xdbe235: mov eax, r13d
0xdbe238: mov dword ptr [rsp + 0x6c], eax
0xdbe23c: jmp 0x140dbe256
0xdbe23e: call 0x1447f02bc
0xdbe243: mov qword ptr [rsp + 0x60], rbx
0xdbe248: mov eax, r13d
0xdbe24b: mov dword ptr [rsp + 0x6c], eax
0xdbe24f: jmp 0x140dbe256
0xdbe251: mov rbx, qword ptr [rsp + 0x60]
0xdbe256: mov dword ptr [rsp + 0x68], esi
0xdbe25a: vmovss xmm6, dword ptr [rip + 0x4fb7aee]
0xdbe262: vxorps xmm0, xmm13, xmm6
0xdbe266: cmp r13d, 2
0xdbe26a: jne 0x140dbe4b7
0xdbe270: vmovss dword ptr [rsp + 0x190], xmm12
0xdbe279: vmovss dword ptr [rsp + 0x194], xmm0
0xdbe282: mov r13d, 1
0xdbe288: test eax, eax
0xdbe28a: jne 0x140dbe34d
0xdbe290: lea edi, [rax*2 + 1]
0xdbe297: add edi, eax
0xdbe299: shr edi, 1
0xdbe29b: cmp edi, r13d
0xdbe29e: cmovb edi, r13d
0xdbe2a2: cmp edi, eax
0xdbe2a4: jbe 0x140dbe34d
0xdbe2aa: lea ecx, [rdi*8]
0xdbe2b1: mov rax, qword ptr gs:[0x58]
0xdbe2ba: mov rsi, qword ptr [rax]
0xdbe2bd: mov edx, 4
0xdbe2c2: vzeroupper 
0xdbe2c5: cmp byte ptr [r12 + rsi], 0
0xdbe2ca: je 0x140dbe2d3
0xdbe2cc: call 0x1447efa78
0xdbe2d1: jmp 0x140dbe2d8
0xdbe2d3: call 0x1447ef9b0
0xdbe2d8: mov rbx, rax
0xdbe2db: test rax, rax
0xdbe2de: jne 0x140dbe2f9
0xdbe2e0: call 0x141318e70
0xdbe2e5: xor r9d, r9d
0xdbe2e8: xor r8d, r8d
0xdbe2eb: mov edx, r13d
0xdbe2ee: mov ecx, 0xa0000002
0xdbe2f3: call qword ptr [rip + 0x442ce4f]
0xdbe2f9: xor r8d, r8d
0xdbe2fc: cmp dword ptr [rsp + 0x68], r8d
0xdbe301: jbe 0x140dbe327
0xdbe303: nop dword ptr [rax]
0xdbe307: nop word ptr [rax + rax]
0xdbe310: mov rax, qword ptr [rsp + 0x60]
0xdbe315: mov rcx, qword ptr [rax + r8*8]
0xdbe319: mov qword ptr [rbx + r8*8], rcx
0xdbe31d: inc r8d
0xdbe320: cmp r8d, dword ptr [rsp + 0x68]
0xdbe325: jb 0x140dbe310
0xdbe327: mov rcx, qword ptr [rsp + 0x60]
0xdbe32c: test rcx, rcx
0xdbe32f: je 0x140dbe344
0xdbe331: cmp byte ptr [r12 + rsi], 0
0xdbe336: je 0x140dbe33f
0xdbe338: call 0x1447f03bc
0xdbe33d: jmp 0x140dbe344
0xdbe33f: call 0x1447f02bc
0xdbe344: mov qword ptr [rsp + 0x60], rbx
0xdbe349: mov dword ptr [rsp + 0x6c], edi
0xdbe34d: mov ecx, dword ptr [rsp + 0x68]
0xdbe351: mov rax, qword ptr [rsp + 0x190]
0xdbe359: mov qword ptr [rbx + rcx*8], rax
0xdbe35d: mov eax, dword ptr [rsp + 0x68]
0xdbe361: inc eax
0xdbe363: mov dword ptr [rsp + 0x68], eax
0xdbe367: vmovss xmm0, dword ptr [r15 + 0x20]
0xdbe36d: vmovss dword ptr [rsp + 0x190], xmm0
0xdbe376: vmovss xmm1, dword ptr [r15 + 0x28]
0xdbe37c: vxorps xmm2, xmm1, xmm6
0xdbe380: vmovss dword ptr [rsp + 0x194], xmm2
0xdbe389: mov ecx, dword ptr [rsp + 0x6c]
0xdbe38d: cmp ecx, eax
0xdbe38f: ja 0x140dbe458
0xdbe395: lea ebx, [rcx*2 + 1]
0xdbe39c: add ebx, ecx
0xdbe39e: shr ebx, 1
0xdbe3a0: cmp ebx, 1
0xdbe3a3: cmovb ebx, r13d
0xdbe3a7: cmp eax, ebx
0xdbe3a9: cmova ebx, eax
0xdbe3ac: cmp ebx, ecx
0xdbe3ae: jbe 0x140dbe458
0xdbe3b4: lea ecx, [rbx*8]
0xdbe3bb: mov rax, qword ptr gs:[0x58]
0xdbe3c4: mov rsi, qword ptr [rax]
0xdbe3c7: mov edx, 4
0xdbe3cc: vzeroupper 
0xdbe3cf: cmp byte ptr [r12 + rsi], 0
0xdbe3d4: je 0x140dbe3dd
0xdbe3d6: call 0x1447efa78
0xdbe3db: jmp 0x140dbe3e2
0xdbe3dd: call 0x1447ef9b0
0xdbe3e2: mov rdi, rax
0xdbe3e5: test rax, rax
0xdbe3e8: jne 0x140dbe403
0xdbe3ea: call 0x141318e70
0xdbe3ef: xor r9d, r9d
0xdbe3f2: xor r8d, r8d
0xdbe3f5: mov edx, r13d
0xdbe3f8: mov ecx, 0xa0000002
0xdbe3fd: call qword ptr [rip + 0x442cd45]
0xdbe403: xor r8d, r8d
0xdbe406: cmp dword ptr [rsp + 0x68], r8d
0xdbe40b: jbe 0x140dbe427
0xdbe40d: nop dword ptr [rax]
0xdbe410: mov rax, qword ptr [rsp + 0x60]
0xdbe415: mov rcx, qword ptr [rax + r8*8]
0xdbe419: mov qword ptr [rdi + r8*8], rcx
0xdbe41d: inc r8d
0xdbe420: cmp r8d, dword ptr [rsp + 0x68]
0xdbe425: jb 0x140dbe410
0xdbe427: mov rcx, qword ptr [rsp + 0x60]
0xdbe42c: test rcx, rcx
0xdbe42f: je 0x140dbe44d
0xdbe431: cmp byte ptr [r12 + rsi], 0
0xdbe436: je 0x140dbe448
0xdbe438: call 0x1447f03bc
0xdbe43d: mov qword ptr [rsp + 0x60], rdi
0xdbe442: mov dword ptr [rsp + 0x6c], ebx
0xdbe446: jmp 0x140dbe45d
0xdbe448: call 0x1447f02bc
0xdbe44d: mov qword ptr [rsp + 0x60], rdi
0xdbe452: mov dword ptr [rsp + 0x6c], ebx
0xdbe456: jmp 0x140dbe45d
0xdbe458: mov rdi, qword ptr [rsp + 0x60]
0xdbe45d: mov ecx, dword ptr [rsp + 0x68]
0xdbe461: mov rax, qword ptr [rsp + 0x190]
0xdbe469: mov qword ptr [rdi + rcx*8], rax
0xdbe46d: inc dword ptr [rsp + 0x68]
0xdbe471: vmulss xmm3, xmm14, xmm15
0xdbe476: vmovups xmm0, xmmword ptr [r15 + 0x2c]
0xdbe47c: vmovups xmmword ptr [rsp + 0xa0], xmm0
0xdbe485: mov byte ptr [rsp + 0x38], 0
0xdbe48a: vxorps xmm8, xmm8, xmm8
0xdbe48f: vmovss dword ptr [rsp + 0x28], xmm8
0xdbe495: vmovss dword ptr [rsp + 0x20], xmm3
0xdbe49b: lea r8, [rsp + 0xa0]
0xdbe4a3: lea rdx, [rsp + 0x60]
0xdbe4a8: mov rcx, qword ptr [r14 + 0x7b8]
0xdbe4af: vzeroupper 
0xdbe4b2: jmp 0x140dbee3a
0xdbe4b7: vmovss dword ptr [rsp + 0x1a8], xmm12
0xdbe4c0: vmovss dword ptr [rsp + 0x1ac], xmm0
0xdbe4c9: mov edx, 1
0xdbe4ce: test eax, eax
0xdbe4d0: jne 0x140dbe592
0xdbe4d6: lea edi, [rax*2 + 1]
0xdbe4dd: add edi, eax
0xdbe4df: shr edi, 1
0xdbe4e1: cmp edi, edx
0xdbe4e3: cmovb edi, edx
0xdbe4e6: cmp edi, eax
0xdbe4e8: jbe 0x140dbe592
0xdbe4ee: lea ecx, [rdi*8]
0xdbe4f5: mov rax, qword ptr gs:[0x58]
0xdbe4fe: mov rsi, qword ptr [rax]
0xdbe501: mov edx, 4
0xdbe506: vzeroupper 
0xdbe509: cmp byte ptr [r12 + rsi], 0
0xdbe50e: je 0x140dbe517
0xdbe510: call 0x1447efa78
0xdbe515: jmp 0x140dbe51c
0xdbe517: call 0x1447ef9b0
0xdbe51c: mov rbx, rax
0xdbe51f: test rax, rax
0xdbe522: jne 0x140dbe53f
0xdbe524: call 0x141318e70
0xdbe529: xor r9d, r9d
0xdbe52c: xor r8d, r8d
0xdbe52f: mov edx, 1
0xdbe534: mov ecx, 0xa0000002
0xdbe539: call qword ptr [rip + 0x442cc09]
0xdbe53f: xor r8d, r8d
0xdbe542: cmp dword ptr [rsp + 0x68], r8d
0xdbe547: jbe 0x140dbe567
0xdbe549: nop dword ptr [rax]
0xdbe550: mov rax, qword ptr [rsp + 0x60]
0xdbe555: mov rcx, qword ptr [rax + r8*8]
0xdbe559: mov qword ptr [rbx + r8*8], rcx
0xdbe55d: inc r8d
0xdbe560: cmp r8d, dword ptr [rsp + 0x68]
0xdbe565: jb 0x140dbe550
0xdbe567: mov rcx, qword ptr [rsp + 0x60]
0xdbe56c: test rcx, rcx
0xdbe56f: je 0x140dbe584
0xdbe571: cmp byte ptr [r12 + rsi], 0
0xdbe576: je 0x140dbe57f
0xdbe578: call 0x1447f03bc
0xdbe57d: jmp 0x140dbe584
0xdbe57f: call 0x1447f02bc
0xdbe584: mov qword ptr [rsp + 0x60], rbx
0xdbe589: mov dword ptr [rsp + 0x6c], edi
0xdbe58d: mov edx, 1
0xdbe592: mov ecx, dword ptr [rsp + 0x68]
0xdbe596: mov rax, qword ptr [rsp + 0x1a8]
0xdbe59e: mov qword ptr [rbx + rcx*8], rax
0xdbe5a2: mov ecx, dword ptr [rsp + 0x68]
0xdbe5a6: inc ecx
0xdbe5a8: mov dword ptr [rsp + 0x68], ecx
0xdbe5ac: mov rax, qword ptr [r15 + 0x10]
0xdbe5b0: vmovss xmm0, dword ptr [rax + 0xc]
0xdbe5b5: vmovss dword ptr [rsp + 0x1a8], xmm0
0xdbe5be: vmovss xmm1, dword ptr [rax + 0x14]
0xdbe5c3: vxorps xmm2, xmm1, xmm6
0xdbe5c7: vmovss dword ptr [rsp + 0x1ac], xmm2
0xdbe5d0: mov eax, dword ptr [rsp + 0x6c]
0xdbe5d4: cmp eax, ecx
0xdbe5d6: ja 0x140dbe6a8
0xdbe5dc: lea ebx, [rax*2 + 1]
0xdbe5e3: add ebx, eax
0xdbe5e5: shr ebx, 1
0xdbe5e7: cmp ebx, 1
0xdbe5ea: cmovb ebx, edx
0xdbe5ed: cmp ecx, ebx
0xdbe5ef: cmova ebx, ecx
0xdbe5f2: cmp ebx, eax
0xdbe5f4: jbe 0x140dbe6a8
0xdbe5fa: lea ecx, [rbx*8]
0xdbe601: mov rax, qword ptr gs:[0x58]
0xdbe60a: mov rsi, qword ptr [rax]
0xdbe60d: mov edx, 4
0xdbe612: vzeroupper 
0xdbe615: cmp byte ptr [r12 + rsi], 0
0xdbe61a: je 0x140dbe623
0xdbe61c: call 0x1447efa78
0xdbe621: jmp 0x140dbe628
0xdbe623: call 0x1447ef9b0
0xdbe628: mov rdi, rax
0xdbe62b: test rax, rax
0xdbe62e: jne 0x140dbe64b
0xdbe630: call 0x141318e70
0xdbe635: xor r9d, r9d
0xdbe638: xor r8d, r8d
0xdbe63b: mov edx, 1
0xdbe640: mov ecx, 0xa0000002
0xdbe645: call qword ptr [rip + 0x442cafd]
0xdbe64b: xor r8d, r8d
0xdbe64e: cmp dword ptr [rsp + 0x68], r8d
0xdbe653: jbe 0x140dbe677
0xdbe655: nop word ptr [rax + rax]
0xdbe660: mov rax, qword ptr [rsp + 0x60]
0xdbe665: mov rcx, qword ptr [rax + r8*8]
0xdbe669: mov qword ptr [rdi + r8*8], rcx
0xdbe66d: inc r8d
0xdbe670: cmp r8d, dword ptr [rsp + 0x68]
0xdbe675: jb 0x140dbe660
0xdbe677: mov rcx, qword ptr [rsp + 0x60]
0xdbe67c: test rcx, rcx
0xdbe67f: je 0x140dbe69d
0xdbe681: cmp byte ptr [r12 + rsi], 0
0xdbe686: je 0x140dbe698
0xdbe688: call 0x1447f03bc
0xdbe68d: mov qword ptr [rsp + 0x60], rdi
0xdbe692: mov dword ptr [rsp + 0x6c], ebx
0xdbe696: jmp 0x140dbe6ad
0xdbe698: call 0x1447f02bc
0xdbe69d: mov qword ptr [rsp + 0x60], rdi
0xdbe6a2: mov dword ptr [rsp + 0x6c], ebx
0xdbe6a6: jmp 0x140dbe6ad
0xdbe6a8: mov rdi, qword ptr [rsp + 0x60]
0xdbe6ad: mov ecx, dword ptr [rsp + 0x68]
0xdbe6b1: mov rax, qword ptr [rsp + 0x1a8]
0xdbe6b9: mov qword ptr [rdi + rcx*8], rax
0xdbe6bd: inc dword ptr [rsp + 0x68]
0xdbe6c1: vmulss xmm9, xmm14, xmm15
0xdbe6c6: vmovups xmm0, xmmword ptr [r15 + 0x2c]
0xdbe6cc: vmovups xmmword ptr [rsp + 0xa0], xmm0
0xdbe6d5: mov byte ptr [rsp + 0x38], 0
0xdbe6da: vxorps xmm8, xmm8, xmm8
0xdbe6df: vmovss dword ptr [rsp + 0x28], xmm8
0xdbe6e5: vmovss dword ptr [rsp + 0x20], xmm9
0xdbe6eb: vmovaps xmm3, xmm9
0xdbe6f0: lea r8, [rsp + 0xa0]
0xdbe6f8: lea rdx, [rsp + 0x60]
0xdbe6fd: mov rcx, qword ptr [r14 + 0x7b8]
0xdbe704: vzeroupper 
0xdbe707: call 0x143d14990
0xdbe70c: cmp r13d, 6
0xdbe710: jae 0x140dbea07
0xdbe716: lea eax, [r13 - 2]
0xdbe71a: mov dword ptr [rsp + 0x1a0], eax
0xdbe721: cmp eax, 1
0xdbe724: jbe 0x140dbebd4
0xdbe72a: vmulss xmm7, xmm15, dword ptr [rsp + 0x198]
0xdbe733: mov esi, 0xc
0xdbe738: mov r12d, 0x18
0xdbe73e: lea r13d, [rax - 1]
0xdbe742: mov dword ptr [rsp + 0x68], 0
0xdbe74a: mov rax, qword ptr [r15 + 0x10]
0xdbe74e: vmovss xmm0, dword ptr [rax + rsi]
0xdbe753: vmovss dword ptr [rsp + 0x198], xmm0
0xdbe75c: vmovss xmm1, dword ptr [rax + rsi + 8]
0xdbe762: vxorps xmm2, xmm1, xmm6
0xdbe766: vmovss dword ptr [rsp + 0x19c], xmm2
0xdbe76f: mov eax, dword ptr [rsp + 0x6c]
0xdbe773: test eax, eax
0xdbe775: jne 0x140dbe85d
0xdbe77b: lea edi, [rax*2 + 1]
0xdbe782: add edi, eax
0xdbe784: shr edi, 1
0xdbe786: cmp edi, 1
0xdbe789: mov ecx, 1
0xdbe78e: cmovb edi, ecx
0xdbe791: cmp edi, eax
0xdbe793: jbe 0x140dbe85d
0xdbe799: lea ecx, [rdi*8]
0xdbe7a0: mov rax, qword ptr gs:[0x58]
0xdbe7a9: mov r14, qword ptr [rax]
0xdbe7ac: mov eax, 0x1fd
0xdbe7b1: mov edx, 4
0xdbe7b6: cmp byte ptr [rax + r14], 0
0xdbe7bb: je 0x140dbe7c4
0xdbe7bd: call 0x1447efa78
0xdbe7c2: jmp 0x140dbe7c9
0xdbe7c4: call 0x1447ef9b0
0xdbe7c9: mov rbx, rax
0xdbe7cc: test rax, rax
0xdbe7cf: jne 0x140dbe7ec
0xdbe7d1: call 0x141318e70
0xdbe7d6: xor r9d, r9d
0xdbe7d9: xor r8d, r8d
0xdbe7dc: mov edx, 1
0xdbe7e1: mov ecx, 0xa0000002
0xdbe7e6: call qword ptr [rip + 0x442c95c]
0xdbe7ec: xor r8d, r8d
0xdbe7ef: cmp dword ptr [rsp + 0x68], r8d
0xdbe7f4: jbe 0x140dbe817
0xdbe7f6: nop word ptr [rax + rax]
0xdbe800: mov rax, qword ptr [rsp + 0x60]
0xdbe805: mov rcx, qword ptr [rax + r8*8]
0xdbe809: mov qword ptr [rbx + r8*8], rcx
0xdbe80d: inc r8d
0xdbe810: cmp r8d, dword ptr [rsp + 0x68]
0xdbe815: jb 0x140dbe800
0xdbe817: mov rcx, qword ptr [rsp + 0x60]
0xdbe81c: test rcx, rcx
0xdbe81f: je 0x140dbe84a
0xdbe821: mov eax, 0x1fd
0xdbe826: cmp byte ptr [rax + r14], 0
0xdbe82b: je 0x140dbe845
0xdbe82d: call 0x1447f03bc
0xdbe832: mov qword ptr [rsp + 0x60], rbx
0xdbe837: mov dword ptr [rsp + 0x6c], edi
0xdbe83b: mov r14, qword ptr [rsp + 0x190]
0xdbe843: jmp 0x140dbe862
0xdbe845: call 0x1447f02bc
0xdbe84a: mov qword ptr [rsp + 0x60], rbx
0xdbe84f: mov dword ptr [rsp + 0x6c], edi
0xdbe853: mov r14, qword ptr [rsp + 0x190]
0xdbe85b: jmp 0x140dbe862
0xdbe85d: mov rbx, qword ptr [rsp + 0x60]
0xdbe862: mov ecx, dword ptr [rsp + 0x68]
0xdbe866: mov rax, qword ptr [rsp + 0x198]
0xdbe86e: mov qword ptr [rbx + rcx*8], rax
0xdbe872: mov ecx, dword ptr [rsp + 0x68]
0xdbe876: inc ecx
0xdbe878: mov dword ptr [rsp + 0x68], ecx
0xdbe87c: mov rax, qword ptr [r15 + 0x10]
0xdbe880: vmovss xmm0, dword ptr [rax + r12]
0xdbe886: vmovss dword ptr [rsp + 0x1a8], xmm0
0xdbe88f: vmovss xmm1, dword ptr [rax + r12 + 8]
0xdbe896: vxorps xmm2, xmm1, xmm6
0xdbe89a: vmovss dword ptr [rsp + 0x1ac], xmm2
0xdbe8a3: mov eax, dword ptr [rsp + 0x6c]
0xdbe8a7: cmp eax, ecx
0xdbe8a9: ja 0x140dbe98d
0xdbe8af: lea ebx, [rax*2 + 1]
0xdbe8b6: add ebx, eax
0xdbe8b8: shr ebx, 1
0xdbe8ba: cmp ebx, 1
0xdbe8bd: mov edx, 1
0xdbe8c2: cmovb ebx, edx
0xdbe8c5: cmp ecx, ebx
0xdbe8c7: cmova ebx, ecx
0xdbe8ca: cmp ebx, eax
0xdbe8cc: jbe 0x140dbe98d
0xdbe8d2: lea ecx, [rbx*8]
0xdbe8d9: mov rax, qword ptr gs:[0x58]
0xdbe8e2: mov r14, qword ptr [rax]
0xdbe8e5: mov eax, 0x1fd
0xdbe8ea: mov edx, 4
0xdbe8ef: cmp byte ptr [rax + r14], 0
0xdbe8f4: je 0x140dbe8fd
0xdbe8f6: call 0x1447efa78
0xdbe8fb: jmp 0x140dbe902
0xdbe8fd: call 0x1447ef9b0
0xdbe902: mov rdi, rax
0xdbe905: test rax, rax
0xdbe908: jne 0x140dbe925
0xdbe90a: call 0x141318e70
0xdbe90f: xor r9d, r9d
0xdbe912: xor r8d, r8d
0xdbe915: mov edx, 1
0xdbe91a: mov ecx, 0xa0000002
0xdbe91f: call qword ptr [rip + 0x442c823]
0xdbe925: xor r8d, r8d
0xdbe928: cmp dword ptr [rsp + 0x68], r8d
0xdbe92d: jbe 0x140dbe947
0xdbe92f: nop 
0xdbe930: mov rax, qword ptr [rsp + 0x60]
0xdbe935: mov rcx, qword ptr [rax + r8*8]
0xdbe939: mov qword ptr [rdi + r8*8], rcx
0xdbe93d: inc r8d
0xdbe940: cmp r8d, dword ptr [rsp + 0x68]
0xdbe945: jb 0x140dbe930
0xdbe947: mov rcx, qword ptr [rsp + 0x60]
0xdbe94c: test rcx, rcx
0xdbe94f: je 0x140dbe97a
0xdbe951: mov eax, 0x1fd
0xdbe956: cmp byte ptr [rax + r14], 0
0xdbe95b: je 0x140dbe975
0xdbe95d: call 0x1447f03bc
0xdbe962: mov qword ptr [rsp + 0x60], rdi
0xdbe967: mov dword ptr [rsp + 0x6c], ebx
0xdbe96b: mov r14, qword ptr [rsp + 0x190]
0xdbe973: jmp 0x140dbe992
0xdbe975: call 0x1447f02bc
0xdbe97a: mov qword ptr [rsp + 0x60], rdi
0xdbe97f: mov dword ptr [rsp + 0x6c], ebx
0xdbe983: mov r14, qword ptr [rsp + 0x190]
0xdbe98b: jmp 0x140dbe992
0xdbe98d: mov rdi, qword ptr [rsp + 0x60]
0xdbe992: mov ecx, dword ptr [rsp + 0x68]
0xdbe996: mov rax, qword ptr [rsp + 0x1a8]
0xdbe99e: mov qword ptr [rdi + rcx*8], rax
0xdbe9a2: inc dword ptr [rsp + 0x68]
0xdbe9a6: vmovups xmm0, xmmword ptr [r15 + 0x2c]
0xdbe9ac: vmovups xmmword ptr [rsp + 0xa0], xmm0
0xdbe9b5: mov byte ptr [rsp + 0x38], 0
0xdbe9ba: vmovss dword ptr [rsp + 0x28], xmm8
0xdbe9c0: vmovss dword ptr [rsp + 0x20], xmm7
0xdbe9c6: vmovaps xmm3, xmm7
0xdbe9ca: lea r8, [rsp + 0xa0]
0xdbe9d2: lea rdx, [rsp + 0x60]
0xdbe9d7: mov rcx, qword ptr [r14 + 0x7b8]
0xdbe9de: call 0x143d14990
0xdbe9e3: add r12, 0xc
0xdbe9e7: add rsi, 0xc
0xdbe9eb: sub r13, 1
0xdbe9ef: jne 0x140dbe742
0xdbe9f5: mov eax, dword ptr [rsp + 0x1a0]
0xdbe9fc: mov r12d, 0x1fd
0xdbea02: jmp 0x140dbebd4
0xdbea07: xor edx, edx
0xdbea09: mov dword ptr [rsp + 0x68], edx
0xdbea0d: lea eax, [r13 - 1]
0xdbea11: cmp eax, 1
0xdbea14: jbe 0x140dbeb73
0xdbea1a: mov esi, 0xc
0xdbea1f: lea r12d, [rax - 1]
0xdbea23: mov r13d, 0x1fd
0xdbea29: nop dword ptr [rax]
0xdbea30: mov rax, qword ptr [r15 + 0x10]
0xdbea34: vmovss xmm0, dword ptr [rax + rsi]
0xdbea39: vmovss dword ptr [rsp + 0x1a8], xmm0
0xdbea42: vmovss xmm1, dword ptr [rax + rsi + 8]
0xdbea48: vxorps xmm2, xmm1, xmm6
0xdbea4c: vmovss dword ptr [rsp + 0x1ac], xmm2
0xdbea55: mov eax, dword ptr [rsp + 0x6c]
0xdbea59: cmp eax, edx
0xdbea5b: ja 0x140dbeb32
0xdbea61: lea ebx, [rax*2 + 1]
0xdbea68: add ebx, eax
0xdbea6a: shr ebx, 1
0xdbea6c: cmp ebx, 1
0xdbea6f: mov ecx, 1
0xdbea74: cmovb ebx, ecx
0xdbea77: cmp edx, ebx
0xdbea79: cmova ebx, edx
0xdbea7c: cmp ebx, eax
0xdbea7e: jbe 0x140dbeb32
0xdbea84: lea ecx, [rbx*8]
0xdbea8b: mov rax, qword ptr gs:[0x58]
0xdbea94: mov r14, qword ptr [rax]
0xdbea97: mov edx, 4
0xdbea9c: cmp byte ptr [r14 + r13], 0
0xdbeaa1: je 0x140dbeaaa
0xdbeaa3: call 0x1447efa78
0xdbeaa8: jmp 0x140dbeaaf
0xdbeaaa: call 0x1447ef9b0
0xdbeaaf: mov rdi, rax
0xdbeab2: test rax, rax
0xdbeab5: jne 0x140dbead2
0xdbeab7: call 0x141318e70
0xdbeabc: xor r9d, r9d
0xdbeabf: xor r8d, r8d
0xdbeac2: mov edx, 1
0xdbeac7: mov ecx, 0xa0000002
0xdbeacc: call qword ptr [rip + 0x442c676]
0xdbead2: xor r8d, r8d
0xdbead5: mov edx, dword ptr [rsp + 0x68]
0xdbead9: test edx, edx
0xdbeadb: je 0x140dbeaf9
0xdbeadd: nop dword ptr [rax]
0xdbeae0: mov rax, qword ptr [rsp + 0x60]
0xdbeae5: mov rcx, qword ptr [rax + r8*8]
0xdbeae9: mov qword ptr [rdi + r8*8], rcx
0xdbeaed: inc r8d
0xdbeaf0: mov edx, dword ptr [rsp + 0x68]
0xdbeaf4: cmp r8d, edx
0xdbeaf7: jb 0x140dbeae0
0xdbeaf9: mov rcx, qword ptr [rsp + 0x60]
0xdbeafe: test rcx, rcx
0xdbeb01: je 0x140dbeb27
0xdbeb03: cmp byte ptr [r14 + r13], 0
0xdbeb08: je 0x140dbeb1e
0xdbeb0a: call 0x1447f03bc
0xdbeb0f: mov edx, dword ptr [rsp + 0x68]
0xdbeb13: mov qword ptr [rsp + 0x60], rdi
0xdbeb18: mov dword ptr [rsp + 0x6c], ebx
0xdbeb1c: jmp 0x140dbeb37
0xdbeb1e: call 0x1447f02bc
0xdbeb23: mov edx, dword ptr [rsp + 0x68]
0xdbeb27: mov qword ptr [rsp + 0x60], rdi
0xdbeb2c: mov dword ptr [rsp + 0x6c], ebx
0xdbeb30: jmp 0x140dbeb37
0xdbeb32: mov rdi, qword ptr [rsp + 0x60]
0xdbeb37: mov ecx, edx
0xdbeb39: mov rax, qword ptr [rsp + 0x1a8]
0xdbeb41: mov qword ptr [rdi + rcx*8], rax
0xdbeb45: mov edx, dword ptr [rsp + 0x68]
0xdbeb49: inc edx
0xdbeb4b: mov dword ptr [rsp + 0x68], edx
0xdbeb4f: add rsi, 0xc
0xdbeb53: sub r12, 1
0xdbeb57: jne 0x140dbea30
0xdbeb5d: mov r13d, dword ptr [rsp + 0x1a0]
0xdbeb65: mov r14, qword ptr [rsp + 0x190]
0xdbeb6d: mov r12d, 0x1fd
0xdbeb73: mov rcx, qword ptr [r14 + 0x7b8]
0xdbeb7a: vmulss xmm1, xmm15, dword ptr [rsp + 0x198]
0xdbeb83: vmovups xmm0, xmmword ptr [r15 + 0x2c]
0xdbeb89: vmovups xmmword ptr [rsp + 0xa0], xmm0
0xdbeb92: lea eax, [rdx - 1]
0xdbeb95: mov rdx, qword ptr [rsp + 0x60]
0xdbeb9a: lea r8, [rdx + rax*8]
0xdbeb9e: mov rax, qword ptr [rcx]
0xdbeba1: mov byte ptr [rsp + 0x40], 0
0xdbeba6: vmovss dword ptr [rsp + 0x38], xmm8
0xdbebac: vmovss dword ptr [rsp + 0x30], xmm1
0xdbebb2: vmovss dword ptr [rsp + 0x28], xmm1
0xdbebb8: lea r9, [rsp + 0xa0]
0xdbebc0: mov qword ptr [rsp + 0x20], r9
0xdbebc5: lea r9, [rsp + 0x60]
0xdbebca: call qword ptr [rax + 0x398]
0xdbebd0: lea eax, [r13 - 2]
0xdbebd4: mov dword ptr [rsp + 0x68], 0
0xdbebdc: lea rcx, [rax + rax*2]
0xdbebe0: mov rax, qword ptr [r15 + 0x10]
0xdbebe4: vmovss xmm0, dword ptr [rax + rcx*4]
0xdbebe9: vmovss dword ptr [rsp + 0x190], xmm0
0xdbebf2: vmovss xmm1, dword ptr [rax + rcx*4 + 8]
0xdbebf8: vxorps xmm2, xmm1, xmm6
0xdbebfc: vmovss dword ptr [rsp + 0x194], xmm2
0xdbec05: mov eax, dword ptr [rsp + 0x6c]
0xdbec09: mov r13d, 1
0xdbec0f: test eax, eax
0xdbec11: jne 0x140dbecd8
0xdbec17: lea edi, [rax*2 + 1]
0xdbec1e: add edi, eax
0xdbec20: shr edi, 1
0xdbec22: cmp edi, r13d
0xdbec25: cmovb edi, r13d
0xdbec29: cmp edi, eax
0xdbec2b: jbe 0x140dbecd8
0xdbec31: lea ecx, [rdi*8]
0xdbec38: mov rax, qword ptr gs:[0x58]
0xdbec41: mov rsi, qword ptr [rax]
0xdbec44: mov edx, 4
0xdbec49: cmp byte ptr [r12 + rsi], 0
0xdbec4e: je 0x140dbec57
0xdbec50: call 0x1447efa78
0xdbec55: jmp 0x140dbec5c
0xdbec57: call 0x1447ef9b0
0xdbec5c: mov rbx, rax
0xdbec5f: test rax, rax
0xdbec62: jne 0x140dbec7d
0xdbec64: call 0x141318e70
0xdbec69: xor r9d, r9d
0xdbec6c: xor r8d, r8d
0xdbec6f: mov edx, r13d
0xdbec72: mov ecx, 0xa0000002
0xdbec77: call qword ptr [rip + 0x442c4cb]
0xdbec7d: xor r8d, r8d
0xdbec80: cmp dword ptr [rsp + 0x68], r8d
0xdbec85: jbe 0x140dbeca7
0xdbec87: nop word ptr [rax + rax]
0xdbec90: mov rax, qword ptr [rsp + 0x60]
0xdbec95: mov rcx, qword ptr [rax + r8*8]
0xdbec99: mov qword ptr [rbx + r8*8], rcx
0xdbec9d: inc r8d
0xdbeca0: cmp r8d, dword ptr [rsp + 0x68]
0xdbeca5: jb 0x140dbec90
0xdbeca7: mov rcx, qword ptr [rsp + 0x60]
0xdbecac: test rcx, rcx
0xdbecaf: je 0x140dbeccd
0xdbecb1: cmp byte ptr [r12 + rsi], 0
0xdbecb6: je 0x140dbecc8
0xdbecb8: call 0x1447f03bc
0xdbecbd: mov qword ptr [rsp + 0x60], rbx
0xdbecc2: mov dword ptr [rsp + 0x6c], edi
0xdbecc6: jmp 0x140dbecdd
0xdbecc8: call 0x1447f02bc
0xdbeccd: mov qword ptr [rsp + 0x60], rbx
0xdbecd2: mov dword ptr [rsp + 0x6c], edi
0xdbecd6: jmp 0x140dbecdd
0xdbecd8: mov rbx, qword ptr [rsp + 0x60]
0xdbecdd: mov ecx, dword ptr [rsp + 0x68]
0xdbece1: mov rax, qword ptr [rsp + 0x190]
0xdbece9: mov qword ptr [rbx + rcx*8], rax
0xdbeced: mov ecx, dword ptr [rsp + 0x68]
0xdbecf1: inc ecx
0xdbecf3: mov dword ptr [rsp + 0x68], ecx
0xdbecf7: vmovss xmm0, dword ptr [r15 + 0x20]
0xdbecfd: vmovss dword ptr [rsp + 0x190], xmm0
0xdbed06: vmovss xmm1, dword ptr [r15 + 0x28]
0xdbed0c: vxorps xmm2, xmm1, xmm6
0xdbed10: vmovss dword ptr [rsp + 0x194], xmm2
0xdbed19: mov eax, dword ptr [rsp + 0x6c]
0xdbed1d: cmp eax, ecx
0xdbed1f: ja 0x140dbede8
0xdbed25: lea ebx, [rax*2 + 1]
0xdbed2c: add ebx, eax
0xdbed2e: shr ebx, 1
0xdbed30: cmp ebx, 1
0xdbed33: cmovb ebx, r13d
0xdbed37: cmp ecx, ebx
0xdbed39: cmova ebx, ecx
0xdbed3c: cmp ebx, eax
0xdbed3e: jbe 0x140dbede8
0xdbed44: lea ecx, [rbx*8]
0xdbed4b: mov rax, qword ptr gs:[0x58]
0xdbed54: mov rsi, qword ptr [rax]
0xdbed57: mov edx, 4
0xdbed5c: cmp byte ptr [r12 + rsi], 0
0xdbed61: je 0x140dbed6a
0xdbed63: call 0x1447efa78
0xdbed68: jmp 0x140dbed6f
0xdbed6a: call 0x1447ef9b0
0xdbed6f: mov rdi, rax
0xdbed72: test rax, rax
0xdbed75: jne 0x140dbed90
0xdbed77: call 0x141318e70
0xdbed7c: xor r9d, r9d
0xdbed7f: xor r8d, r8d
0xdbed82: mov edx, r13d
0xdbed85: mov ecx, 0xa0000002
0xdbed8a: call qword ptr [rip + 0x442c3b8]
0xdbed90: xor r8d, r8d
0xdbed93: cmp dword ptr [rsp + 0x68], r8d
0xdbed98: jbe 0x140dbedb7
0xdbed9a: nop word ptr [rax + rax]
0xdbeda0: mov rax, qword ptr [rsp + 0x60]
0xdbeda5: mov rcx, qword ptr [rax + r8*8]
0xdbeda9: mov qword ptr [rdi + r8*8], rcx
0xdbedad: inc r8d
0xdbedb0: cmp r8d, dword ptr [rsp + 0x68]
0xdbedb5: jb 0x140dbeda0
0xdbedb7: mov rcx, qword ptr [rsp + 0x60]
0xdbedbc: test rcx, rcx
0xdbedbf: je 0x140dbeddd
0xdbedc1: cmp byte ptr [r12 + rsi], 0
0xdbedc6: je 0x140dbedd8
0xdbedc8: call 0x1447f03bc
0xdbedcd: mov qword ptr [rsp + 0x60], rdi
0xdbedd2: mov dword ptr [rsp + 0x6c], ebx
0xdbedd6: jmp 0x140dbeded
0xdbedd8: call 0x1447f02bc
0xdbeddd: mov qword ptr [rsp + 0x60], rdi
0xdbede2: mov dword ptr [rsp + 0x6c], ebx
0xdbede6: jmp 0x140dbeded
0xdbede8: mov rdi, qword ptr [rsp + 0x60]
0xdbeded: mov ecx, dword ptr [rsp + 0x68]
0xdbedf1: mov rax, qword ptr [rsp + 0x190]
0xdbedf9: mov qword ptr [rdi + rcx*8], rax
0xdbedfd: inc dword ptr [rsp + 0x68]
0xdbee01: vmovups xmm0, xmmword ptr [r15 + 0x2c]
0xdbee07: vmovups xmmword ptr [rsp + 0xa0], xmm0
0xdbee10: mov byte ptr [rsp + 0x38], 0
0xdbee15: vmovss dword ptr [rsp + 0x28], xmm8
0xdbee1b: vmovss dword ptr [rsp + 0x20], xmm9
0xdbee21: vmovaps xmm3, xmm9
0xdbee26: lea r8, [rsp + 0xa0]
0xdbee2e: lea rdx, [rsp + 0x60]
0xdbee33: mov rcx, qword ptr [r14 + 0x7b8]
0xdbee3a: call 0x143d14990
0xdbee3f: nop 
0xdbee40: mov rcx, qword ptr [rsp + 0x60]
0xdbee45: test rcx, rcx
0xdbee48: je 0x140dbee69
0xdbee4a: mov rax, qword ptr gs:[0x58]
0xdbee53: mov rdx, qword ptr [rax]
0xdbee56: cmp byte ptr [r12 + rdx], 0
0xdbee5b: je 0x140dbee64
0xdbee5d: call 0x1447f03bc
0xdbee62: jmp 0x140dbee69
0xdbee64: call 0x1447f02bc
0xdbee69: mov qword ptr [rsp + 0x60], 0
0xdbee72: mov qword ptr [rsp + 0x68], 0
0xdbee7b: vzeroupper 
0xdbee7e: lea r11, [rsp + 0x150]
0xdbee86: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdbee8c: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdbee92: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdbee98: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdbee9e: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdbeea4: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdbeeaa: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdbeeb0: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xdbeeb6: vmovaps xmm14, xmmword ptr [r11 - 0x90]
0xdbeebf: vmovaps xmm15, xmmword ptr [r11 - 0xa0]
0xdbeec8: mov rsp, r11
0xdbeecb: pop r15
0xdbeecd: pop r14
0xdbeecf: pop r13
0xdbeed1: pop r12
0xdbeed3: pop rdi
0xdbeed4: pop rsi
0xdbeed5: pop rbx
0xdbeed6: ret 