FUNCTION 0xd83290 END 0xd836df
0xd832cb: je 0x140d83305
0xd832cd: nop dword ptr [rax]
0xd832d0: mov rdi, qword ptr [rbx]
0xd832d3: mov byte ptr [rdi + 0x123], 1
0xd832da: mov rcx, qword ptr [rdi + 0xe0]
0xd832e1: test rcx, rcx
0xd832e4: je 0x140d832eb
0xd832e6: call 0x140cc0110
0xd832eb: mov rcx, qword ptr [rdi + 0xe8]
0xd832f2: test rcx, rcx
FUNCTION 0xd89100 END 0xd891d2
0xd89147: cmp qword ptr [rbx + 8], 0
0xd8914c: je 0x140d89157
0xd8914e: lea rcx, [rip + 0x47ea357]
0xd89155: jmp 0x140d891ad
0xd89157: mov rcx, qword ptr [rax + 0xe0]
0xd8915e: test rcx, rcx
0xd89161: je 0x140d8917c
0xd89163: lea rdx, [rip + 0x5f46fda]
0xd8916a: call 0x1404743a0
0xd8916f: test rax, rax
FUNCTION 0xd891e0 END 0xd89332
0xd892bf: mov rcx, rbx
0xd892c2: call 0x140def770
0xd892c7: test rax, rax
0xd892ca: je 0x140d89322
0xd892cc: vmovsd xmm0, qword ptr [rax + 0xe0]
0xd892d4: mov eax, dword ptr [rax + 0xe8]
0xd892da: mov rcx, rsi
0xd892dd: mov dword ptr [rsp + 0x28], eax
0xd892e1: mov rax, qword ptr [rsi]
0xd892e4: vmovsd qword ptr [rsp + 0x20], xmm0
FUNCTION 0xd89e00 END 0xd89ea8
0xd89e74: mov rsi, qword ptr [rsp + 0x38]
0xd89e79: add rsp, 0x20
0xd89e7d: pop rdi
0xd89e7e: jmp 0x141024360
0xd89e83: cmp qword ptr [rdi + 0xe0], rbx
0xd89e8a: jne 0x140d89e98
0xd89e8c: mov rcx, qword ptr [rdi + 0xc8]
0xd89e93: call 0x1410245a0
0xd89e98: mov rbx, qword ptr [rsp + 0x30]
0xd89e9d: mov rsi, qword ptr [rsp + 0x38]
FUNCTION 0xd8a510 END 0xd8a7c0
0xd8a6a7: test rdi, rdi
0xd8a6aa: je 0x140d8a6b3
0xd8a6ac: cmp qword ptr [rdi + 8], 0
0xd8a6b1: jne 0x140d8a727
0xd8a6b3: mov rcx, qword ptr [rax + 0xe0]
0xd8a6ba: test rcx, rcx
0xd8a6bd: je 0x140d8a6dd
0xd8a6bf: lea rdx, [rip + 0x5f45a82]
0xd8a6c6: call 0x1404743a0
0xd8a6cb: test rax, rax
FUNCTION 0xd8a510 END 0xd8a7c0
0xd8a732: test rdi, rdi
0xd8a735: je 0x140d8a73e
0xd8a737: cmp qword ptr [rdi + 8], 0
0xd8a73c: jne 0x140d8a7b2
0xd8a73e: mov rcx, qword ptr [rax + 0xe0]
0xd8a745: test rcx, rcx
0xd8a748: je 0x140d8a768
0xd8a74a: lea rdx, [rip + 0x5f459fb]
0xd8a751: call 0x1404743a0
0xd8a756: test rax, rax
FUNCTION 0xd8a970 END 0xd8b9d8
0xd8a9e7: mov byte ptr [rdi + 0xd0], al
0xd8a9ed: mov rax, qword ptr [rbx + 8]
0xd8a9f1: mov qword ptr [rdi + 0xc8], rax
0xd8a9f8: vmovsd xmm0, qword ptr [rbx + 0x1c]
0xd8a9fd: vmovsd qword ptr [rdi + 0xe0], xmm0
0xd8aa05: mov eax, dword ptr [rbx + 0x24]
0xd8aa08: mov dword ptr [rdi + 0xe8], eax
0xd8aa0e: mov rax, qword ptr [rbx + 0x28]
0xd8aa12: mov qword ptr [rdi + 0x110], rax
0xd8aa19: movzx eax, byte ptr [rbx + 0x48]
FUNCTION 0xd8a970 END 0xd8b9d8
0xd8aac7: test rbx, rbx
0xd8aaca: je 0x140d8aad3
0xd8aacc: cmp qword ptr [rbx + 8], 0
0xd8aad1: jne 0x140d8ab33
0xd8aad3: mov rcx, qword ptr [r14 + 0xe0]
0xd8aada: test rcx, rcx
0xd8aadd: je 0x140d8aaf0
0xd8aadf: lea rdx, [rip + 0x5f455c6]
0xd8aae6: call 0x1404743a0
0xd8aaeb: test rax, rax
FUNCTION 0xd8c4c0 END 0xd8c6e1
0xd8c60a: test rdi, rdi
0xd8c60d: je 0x140d8c616
0xd8c60f: cmp qword ptr [rdi + 8], 0
0xd8c614: jne 0x140d8c66c
0xd8c616: mov rcx, qword ptr [rcx + 0xe0]
0xd8c61d: test rcx, rcx
0xd8c620: je 0x140d8c63b
0xd8c622: lea rdx, [rip + 0x5f43b37]
0xd8c629: call 0x1404743a0
0xd8c62e: test rax, rax
FUNCTION 0xd8cb62 END 0xd8cf01
0xd8cc86: vmovss xmm0, dword ptr [rbp + 0x57]
0xd8cc8b: vmulss xmm1, xmm8, xmm0
0xd8cc8f: vmulss xmm0, xmm0, dword ptr [rip + 0x5f21201]
0xd8cc97: vsubss xmm1, xmm1, xmm0
0xd8cc9b: vmovss xmm0, dword ptr [rdi + 0xe0]
0xd8cca3: vmulss xmm2, xmm1, xmm9
0xd8cca8: vmulss xmm3, xmm2, xmm7
0xd8ccac: vmulss xmm4, xmm3, xmm11
0xd8ccb1: vsubss xmm1, xmm0, xmm4
0xd8ccb5: vaddss xmm0, xmm10, dword ptr [rdi + 0xe4]
FUNCTION 0xd8cb62 END 0xd8cf01
0xd8cd1b: lea rdx, [rsp + 0x20]
0xd8cd20: mov rcx, r14
0xd8cd23: call 0x140decaf0
0xd8cd28: mov rcx, qword ptr [rdi + 0x338]
0xd8cd2f: lea r14, [rdi + 0xe0]
0xd8cd36: test rcx, rcx
0xd8cd39: je 0x140d8cdb1
0xd8cd3b: mov qword ptr [rbp + 0x57], rbx
0xd8cd3f: lea rdx, [rsp + 0x20]
0xd8cd44: vmovss xmm0, dword ptr [rbp + 0x57]
FUNCTION 0xd8cb62 END 0xd8cf01
0xd8cdfd: vmovss xmm0, dword ptr [rbp + 0x5b]
0xd8ce02: vmulss xmm1, xmm8, xmm0
0xd8ce06: vmulss xmm0, xmm0, dword ptr [rip + 0x5f2117a]
0xd8ce0e: vsubss xmm1, xmm1, xmm0
0xd8ce12: vmovss xmm0, dword ptr [rcx + 0xe0]
0xd8ce1a: vucomiss xmm0, xmm5
0xd8ce1e: vmulss xmm2, xmm1, xmm9
0xd8ce23: vmulss xmm3, xmm2, xmm7
0xd8ce27: vaddss xmm4, xmm3, dword ptr [r14 + 8]
0xd8ce2d: vmovss dword ptr [rsp + 0x28], xmm4
FUNCTION 0xd8cb62 END 0xd8cf01
0xd8ce4d: mov rax, qword ptr [rdi + 0x110]
0xd8ce54: mov byte ptr [rax + 0xad8], 1
0xd8ce5b: lea rdx, [rsp + 0x20]
0xd8ce60: call 0x140decaf0
0xd8ce65: lea rsi, [rdi + 0xe0]
0xd8ce6c: jmp 0x140d8ce71
0xd8ce6e: mov rsi, r14
0xd8ce71: mov rcx, qword ptr [rdi + 0x300]
0xd8ce78: test rcx, rcx
0xd8ce7b: je 0x140d8cef3
FUNCTION 0xd8cf8b END 0xd8d058
0xd8d03e: add r14, 8
0xd8d042: cmp r14, r12
0xd8d045: jne 0x140d8cfa0
0xd8d04b: vmovaps xmm12, xmmword ptr [rsp + 0x70]
0xd8d051: lea rsi, [rdi + 0xe0]
FUNCTION 0xd8f620 END 0xd8fbc5
0xd8f7fc: mov rcx, rsi
0xd8f7ff: call 0x140cb7100
0xd8f804: mov rax, qword ptr [rsi + 0x258]
0xd8f80b: mov rbx, qword ptr [rax + 0xd8]
0xd8f812: mov eax, dword ptr [rax + 0xe0]
0xd8f818: lea rdi, [rbx + rax*8]
0xd8f81c: cmp rbx, rdi
0xd8f81f: je 0x140d8f832
0xd8f821: mov rcx, qword ptr [rbx]
0xd8f824: call 0x140cb7100
FUNCTION 0xd8f620 END 0xd8fbc5
0xd8fb35: mov rcx, rdi
0xd8fb38: call 0x140cb7200
0xd8fb3d: mov rax, qword ptr [rdi + 0x258]
0xd8fb44: mov rbx, qword ptr [rax + 0xd8]
0xd8fb4b: mov eax, dword ptr [rax + 0xe0]
0xd8fb51: lea rsi, [rbx + rax*8]
0xd8fb55: cmp rbx, rsi
0xd8fb58: je 0x140d8fb71
0xd8fb5a: nop word ptr [rax + rax]
0xd8fb60: mov rcx, qword ptr [rbx]
FUNCTION 0xd910a2 END 0xd9137e
0xd911e1: xor edi, edi
0xd911e3: mov rcx, qword ptr [rbx + 0x18]
0xd911e7: lea rdx, [rsp + 0xa8]
0xd911ef: call 0x1435b4b90
0xd911f4: vmovss xmm0, dword ptr [rdi + 0xe0]
0xd911fc: vsubss xmm1, xmm0, dword ptr [r15 + 0xa58]
0xd91205: vmovss xmm4, dword ptr [r15 + 0xa98]
0xd9120e: vmulss xmm0, xmm6, dword ptr [rsp + 0xa8]
0xd91217: vmovss xmm2, dword ptr [r15 + 0xa5c]
0xd91220: mov r8, qword ptr [rsp + 0xa8]
FUNCTION 0xd91ef0 END 0xd92324
0xd921eb: lea rcx, [rbp - 0x49]
0xd921ef: call 0x141434880
0xd921f4: test r13b, r13b
0xd921f7: je 0x140d922ea
0xd921fd: vmovsd xmm6, qword ptr [rsi + 0xe0]
0xd92205: vmovsd qword ptr [rbp - 0x79], xmm6
0xd9220a: mov r12d, dword ptr [rsi + 0xe8]
0xd92211: xor esi, esi
0xd92213: jmp 0x140d91fc1
0xd92218: mov rax, qword ptr [r14]
FUNCTION 0xd92360 END 0xd923bc
0xd92360: mov qword ptr [rsp + 0x88], rbx
0xd92368: mov ecx, dword ptr [rax + 0xe0]
0xd9236e: cmp ecx, 0xf
0xd92371: jae 0x140d9237c
0xd92373: call 0x140dec470
0xd92378: mov ebx, dword ptr [rax]
0xd9237a: jmp 0x140d9237e
FUNCTION 0xd925e0 END 0xd92716
0xd925e0: mov qword ptr [rsp + 0x88], rbx
0xd925e8: mov qword ptr [rsp + 0x40], rdi
0xd925ed: mov edi, dword ptr [rax + 0xe0]
0xd925f3: cmp edi, 0xe
0xd925f6: setae dl
0xd925f9: xor ebx, ebx
0xd925fb: mov dword ptr [rsp + 0x70], ebx
0xd925ff: cmp edi, 0xf
FUNCTION 0xd94040 END 0xd95ea9
0xd94647: lea rcx, [rbp - 0x28]
0xd9464b: call 0x141434880
0xd94650: mov rbx, qword ptr [rbp + 0x970]
0xd94657: mov r15d, 0xffff
0xd9465d: vmovss xmm0, dword ptr [rdi + 0xe0]
0xd94665: vmovss dword ptr [rbp - 0x68], xmm0
0xd9466a: vmovss xmm1, dword ptr [rdi + 0xe8]
0xd94672: vmovss dword ptr [rbp - 0x64], xmm1
0xd94677: vmovss xmm3, dword ptr [rbx + 0xa9c]
0xd9467f: movzx r8d, byte ptr [rbx + 0xae4]
FUNCTION 0xd94040 END 0xd95ea9
0xd95450: sub al, 0xe
0xd95452: cmp al, 1
0xd95454: ja 0x140d95468
0xd95456: xor r9d, r9d
0xd95459: lea r8, [rdi + 0xe0]
0xd95460: call 0x140658ae0
0xd95465: movzx ebx, al
0xd95468: cmp byte ptr [rdi + 0x1d8], bl
0xd9546e: je 0x140d9547d
0xd95470: mov byte ptr [rdi + 0x1d8], bl
FUNCTION 0xd95fc6 END 0xd9674b
0xd961d6: jbe 0x140d966e4
0xd961dc: cmp byte ptr [rdx + 0x1d5], 0
0xd961e3: jne 0x140d966e4
0xd961e9: vmovss xmm0, dword ptr [r9 + 0xa90]
0xd961f2: vsubss xmm2, xmm0, dword ptr [rdx + 0xe0]
0xd961fa: vmovss xmm0, dword ptr [r9 + 0xa94]
0xd96203: vsubss xmm1, xmm0, dword ptr [rdx + 0xe8]
0xd9620b: vmulss xmm3, xmm1, xmm1
0xd9620f: vmulss xmm2, xmm2, xmm2
0xd96213: vaddss xmm4, xmm3, xmm2
FUNCTION 0xda9ea0 END 0xdaa118
0xda9f63: mov dword ptr [rbp + 0xf], edi
0xda9f66: lea rax, [rbp + 7]
0xda9f6a: mov qword ptr [rbp - 9], rax
0xda9f6e: mov qword ptr [rbp - 1], rdi
0xda9f72: lea rdx, [r14 + 0xe0]
0xda9f79: mov rax, qword ptr [r12]
0xda9f7d: lea r8, [rbp - 9]
0xda9f81: mov rcx, r12
0xda9f84: call qword ptr [rax + 0xb8]
0xda9f8a: mov eax, dword ptr [rbp + 0xf]
FUNCTION 0xdabd10 END 0xdadcce
0xdabf78: mov byte ptr [r14 + 0xad6], sil
0xdabf7f: jmp 0x140dac08d
0xdabf84: vmovss xmm0, dword ptr [rdi + 0xe8]
0xdabf8c: vsubss xmm7, xmm0, xmm11
0xdabf91: vmovss xmm1, dword ptr [rdi + 0xe0]
0xdabf99: vsubss xmm6, xmm1, xmm8
0xdabf9e: vmulss xmm1, xmm7, xmm7
0xdabfa2: vmulss xmm0, xmm6, xmm6
0xdabfa6: vaddss xmm9, xmm1, xmm0
0xdabfaa: vmovss xmm10, dword ptr [rip + 0x5f017a6]
FUNCTION 0xdabd10 END 0xdadcce
0xdabfce: vmulss xmm1, xmm10, xmm12
0xdabfd3: vcomiss xmm1, xmm0
0xdabfd7: jbe 0x140dac004
0xdabfd9: mov byte ptr [r14 + 0xad6], sil
0xdabfe0: vmovss xmm0, dword ptr [rdi + 0xe0]
0xdabfe8: vmovss dword ptr [rsp + 0x290], xmm0
0xdabff1: vmovss xmm1, dword ptr [rdi + 0xe8]
0xdabff9: vmovss dword ptr [rsp + 0x294], xmm1
0xdac002: jmp 0x140dac04f
0xdac004: vcomiss xmm9, xmm15
FUNCTION 0xdabd10 END 0xdadcce
0xdace53: lea r12, [r15 + rax*8]
0xdace57: cmp r15, r12
0xdace5a: je 0x140dacfee
0xdace60: mov rsi, qword ptr [r15]
0xdace63: vmovss xmm0, dword ptr [rsi + 0xe0]
0xdace6b: vmovss dword ptr [rsp + 0x290], xmm0
0xdace74: vmovss xmm1, dword ptr [rsi + 0xe8]
0xdace7c: vmovss dword ptr [rsp + 0x294], xmm1
0xdace85: lea rcx, [rsi + 0xde]
0xdace8c: vzeroupper 
FUNCTION 0xdabd10 END 0xdadcce
0xdad000: cmp rdi, rsi
0xdad003: je 0x140dad25e
0xdad009: lea r15, [rip + 0x5ee0170]
0xdad010: mov rbx, qword ptr [rdi]
0xdad013: vmovss xmm0, dword ptr [rbx + 0xe0]
0xdad01b: vmovss dword ptr [rsp + 0x58], xmm0
0xdad021: vmovss xmm1, dword ptr [rbx + 0xe8]
0xdad029: vmovss dword ptr [rsp + 0x5c], xmm1
0xdad02f: mov rax, qword ptr [rbx + 8]
0xdad033: mov rcx, qword ptr [rax + 0x20]
FUNCTION 0xdabd10 END 0xdadcce
0xdad452: call 0x143ed84d0
0xdad457: mov rsi, rax
0xdad45a: jmp 0x140dad45f
0xdad45c: mov rsi, rbx
0xdad45f: vmovss xmm0, dword ptr [rsi + 0xe0]
0xdad467: vmovss dword ptr [rsp + 0x58], xmm0
0xdad46d: vmovss xmm1, dword ptr [rsi + 0xe8]
0xdad475: vmovss dword ptr [rsp + 0x5c], xmm1
0xdad47b: lea rcx, [rsi + 0xde]
0xdad482: call 0x140537250
FUNCTION 0xdae3a0 END 0xdafaea
0xdae8d6: vmovaps xmm2, xmm6
0xdae8da: vmovaps xmm3, xmm6
0xdae8de: vmovaps xmm1, xmm6
0xdae8e2: jmp 0x140dae903
0xdae8e4: vmovsd xmm0, qword ptr [rcx + 0xe0]
0xdae8ec: vmovaps xmm1, xmm0
0xdae8f0: vmovss xmm3, dword ptr [rcx + 0xe8]
0xdae8f8: vshufps xmm2, xmm0, xmm0, 0x55
0xdae8fd: vmovsd qword ptr [rsp + 0x48], xmm0
0xdae903: vmovss xmm0, dword ptr [rdi + 0x20]
FUNCTION 0xdae3a0 END 0xdafaea
0xdaef6e: vmovaps xmm2, xmm6
0xdaef72: vmovaps xmm3, xmm6
0xdaef76: vmovaps xmm1, xmm6
0xdaef7a: jmp 0x140daef9d
0xdaef7c: vmovsd xmm0, qword ptr [r14 + 0xe0]
0xdaef85: vmovaps xmm1, xmm0
0xdaef89: vmovss xmm3, dword ptr [r14 + 0xe8]
0xdaef92: vshufps xmm2, xmm0, xmm0, 0x55
0xdaef97: vmovsd qword ptr [rsp + 0x48], xmm0
0xdaef9d: mov rax, qword ptr [rbp - 0x80]
FUNCTION 0xdae3a0 END 0xdafaea
0xdaf3d2: je 0x140daf76e
0xdaf3d8: lea r8, [r13 + 0x30]
0xdaf3dc: cmp byte ptr [rbp + 0x140], 0
0xdaf3e3: jne 0x140daf3ec
0xdaf3e5: lea r8, [r14 + 0xe0]
0xdaf3ec: mov rdx, r14
0xdaf3ef: mov rcx, rsi
0xdaf3f2: call 0x140dba0e0
0xdaf3f7: jmp 0x140daf76e
0xdaf3fc: cmp byte ptr [rip + 0x5efcef5], 0
FUNCTION 0xdb0080 END 0xdb1678
0xdb0374: vminss xmm7, xmm0, xmm6
0xdb0378: vxorps xmm6, xmm6, xmm6
0xdb037c: mov rax, qword ptr [rbx]
0xdb037f: mov qword ptr [rbp], rax
0xdb0383: vmovss xmm0, dword ptr [rax + 0xe0]
0xdb038b: vmovss dword ptr [rbp + 8], xmm0
0xdb0390: vmovss xmm1, dword ptr [rax + 0xe8]
0xdb0398: vmovss dword ptr [rbp + 0xc], xmm1
0xdb039d: vmovss dword ptr [rbp + 0x10], xmm7
0xdb03a2: mov byte ptr [rbp + 0x14], 1
FUNCTION 0xdb0080 END 0xdb1678
0xdb0e54: je 0x140db0f7f
0xdb0e5a: nop word ptr [rax + rax]
0xdb0e60: mov rax, qword ptr [rbx]
0xdb0e63: vmovss xmm8, dword ptr [rax + 0xe8]
0xdb0e6b: vmovss xmm9, dword ptr [rax + 0xe0]
0xdb0e73: vmovss xmm7, dword ptr [rax + 0x100]
0xdb0e7b: cmp byte ptr [rsi + 0xae4], 0
0xdb0e82: je 0x140db0ee5
0xdb0e84: movzx eax, word ptr [rax + 0xde]
0xdb0e8b: mov word ptr [rbp + 0x6c0], ax
FUNCTION 0xdba0e0 END 0xdba3e8
0xdba2d3: lea rcx, [rbp + 0x98]
0xdba2da: call 0x1404a2630
0xdba2df: cmp byte ptr [rax + 0x4e], 0
0xdba2e3: je 0x140dba2f6
0xdba2e5: lea r8, [r13 + 0xe0]
0xdba2ec: lea r9, [rsp + 0x30]
0xdba2f1: call 0x140658ae0
0xdba2f6: mov rcx, qword ptr [r14 + 0x5e8]
0xdba2fd: lea rdx, [rsp + 0x30]
0xdba302: mov rax, qword ptr [rbp + 0x38]
FUNCTION 0xdbaba0 END 0xdbc632
0xdbae33: vxorps xmm9, xmm9, xmm9
0xdbae38: vxorps xmm8, xmm8, xmm8
0xdbae3d: vxorps xmm7, xmm7, xmm7
0xdbae41: jmp 0x140dbae62
0xdbae43: vmovsd xmm0, qword ptr [rcx + 0xe0]
0xdbae4b: vmovaps xmm7, xmm0
0xdbae4f: vmovss xmm8, dword ptr [rcx + 0xe8]
0xdbae57: vshufps xmm9, xmm0, xmm0, 0x55
0xdbae5c: vmovsd qword ptr [rsp + 0x38], xmm0
0xdbae62: vmovups xmm0, xmmword ptr [rdi + 0xc8]
FUNCTION 0xdbaba0 END 0xdbc632
0xdbaea7: jmp 0x140dbaecc
0xdbaea9: vxorps xmm2, xmm2, xmm2
0xdbaead: vxorps xmm1, xmm1, xmm1
0xdbaeb1: jmp 0x140dbaecc
0xdbaeb3: vmovsd xmm0, qword ptr [rdi + 0xe0]
0xdbaebb: vmovaps xmm1, xmm0
0xdbaebf: vmovss xmm6, dword ptr [rdi + 0xe8]
0xdbaec7: vshufps xmm2, xmm0, xmm0, 0x55
0xdbaecc: vucomiss xmm7, xmm1
0xdbaed0: jp 0x140dbafc2
FUNCTION 0xdbaba0 END 0xdbc632
0xdbbb3b: call qword ptr [rax + 0x20]
0xdbbb3e: mov rax, qword ptr [rsi + 0x670]
0xdbbb45: mov byte ptr [rax + 0xf2], 1
0xdbbb4c: mov rax, qword ptr [rsi + 0x610]
0xdbbb53: mov r14d, dword ptr [rax + 0xe0]
0xdbbb5a: cmp r14d, 0xf
0xdbbb5e: jae 0x140dbc5ff
0xdbbb64: mov rax, qword ptr [rsi + 0x618]
0xdbbb6b: mov eax, dword ptr [rax + 0xe0]
0xdbbb71: mov dword ptr [rbp + 0x1328], eax
FUNCTION 0xdbaba0 END 0xdbc632
0xdbbb53: mov r14d, dword ptr [rax + 0xe0]
0xdbbb5a: cmp r14d, 0xf
0xdbbb5e: jae 0x140dbc5ff
0xdbbb64: mov rax, qword ptr [rsi + 0x618]
0xdbbb6b: mov eax, dword ptr [rax + 0xe0]
0xdbbb71: mov dword ptr [rbp + 0x1328], eax
0xdbbb77: cmp eax, 0xf
0xdbbb7a: jae 0x140dbc5ff
0xdbbb80: cmp r14d, 0xe
0xdbbb84: setae byte ptr [rbp + 0x1320]
FUNCTION 0xdbdcb0 END 0xdbeed7
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
FUNCTION 0xdbeee0 END 0xdc17b8
0xdc12ec: mov rbx, qword ptr [rsp + 0xa0]
0xdc12f4: lea rcx, [rbx + 0x98]
0xdc12fb: lea rdx, [rsp + 0x110]
0xdc1303: call 0x143d16300
0xdc1308: mov byte ptr [rbx + 0xe0], 1
0xdc130f: mov rcx, qword ptr [rsp + 0x148]
0xdc1317: test rcx, rcx
0xdc131a: mov r13, qword ptr [rsp + 0x350]
0xdc1322: mov ebx, 0x1fd
0xdc1327: je 0x140dc1347
FUNCTION 0xdbeee0 END 0xdc17b8
0xdc1530: mov rcx, qword ptr [rbx]
0xdc1533: mov rax, qword ptr [rdi]
0xdc1536: vmovss xmm0, dword ptr [rax + 0xe8]
0xdc153e: vxorps xmm6, xmm0, xmm12
0xdc1543: vmovss xmm5, dword ptr [rax + 0xe0]
0xdc154b: vmovss dword ptr [rsp + 0x78], xmm5
0xdc1551: vmovss dword ptr [rsp + 0x7c], xmm6
0xdc1557: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdc155f: vxorps xmm4, xmm0, xmm12
0xdc1564: vmovss xmm1, dword ptr [rcx + 0xe0]
FUNCTION 0xdbeee0 END 0xdc17b8
0xdc154b: vmovss dword ptr [rsp + 0x78], xmm5
0xdc1551: vmovss dword ptr [rsp + 0x7c], xmm6
0xdc1557: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdc155f: vxorps xmm4, xmm0, xmm12
0xdc1564: vmovss xmm1, dword ptr [rcx + 0xe0]
0xdc156c: vmovss dword ptr [rsp + 0x368], xmm1
0xdc1575: vmovss dword ptr [rsp + 0x36c], xmm4
0xdc157e: mov rax, qword ptr [r13 + 0x860]
0xdc1585: mov qword ptr [rsp + 0x350], rax
0xdc158d: vmovss xmm3, dword ptr [rsp + 0x350]
FUNCTION 0xdc2600 END 0xdc291f
0xdc265c: mov rdx, qword ptr [r14 + 8]
0xdc2660: lea rcx, [rbp - 0x41]
0xdc2664: call 0x140393df0
0xdc2669: nop 
0xdc266a: mov rdi, qword ptr [r14 + 0xe0]
0xdc2671: mov ebx, dword ptr [r14 + 0xe8]
0xdc2678: mov eax, dword ptr [rbp - 0x2d]
0xdc267b: mov ecx, dword ptr [rbp - 0x31]
0xdc267e: sub eax, ecx
0xdc2680: cmp ebx, eax
FUNCTION 0xdc32e0 END 0xdc35b1
0xdc342f: vunpcklps xmm0, xmm0, xmm0
0xdc3433: vmovsd qword ptr [rbp - 0x41], xmm0
0xdc3438: mov dword ptr [rbp - 0x39], ecx
0xdc343b: jmp 0x140dc34e9
0xdc3440: vmovsd xmm0, qword ptr [rdi + 0xe0]
0xdc3448: mov ecx, dword ptr [rdi + 0xe8]
0xdc344e: vmovsd qword ptr [rbp - 0x41], xmm0
0xdc3453: mov dword ptr [rbp - 0x39], ecx
0xdc3456: jmp 0x140dc34e9
0xdc345b: vmovss xmm7, dword ptr [r14 + 0xa6c]
FUNCTION 0xdc36c0 END 0xdc3987
0xdc3879: je 0x140dc3797
0xdc387f: cmp dword ptr [rdi + 0xc], ebp
0xdc3882: jne 0x140dc3797
0xdc3888: mov r8, qword ptr [r8 + 0x18]
0xdc388c: vmovsd xmm0, qword ptr [r8 + 0xe0]
0xdc3895: vsubss xmm1, xmm0, xmm7
0xdc3899: vmovss xmm0, dword ptr [r8 + 0xe8]
0xdc38a2: vsubss xmm2, xmm0, xmm6
0xdc38a6: vmovss xmm3, dword ptr [rip + 0x5eeaf5a]
0xdc38ae: lea rcx, [r8 + 0x1e8]
FUNCTION 0xdc6bb0 END 0xdc6f2a
0xdc6dc4: lea rdx, [rip + 0x47ac6e1]
0xdc6dcb: mov qword ptr [rsp + 0x28], rdx
0xdc6dd0: mov rax, qword ptr [rax + rcx*8]
0xdc6dd4: mov qword ptr [rsp + 0x20], rax
0xdc6dd9: lea r9, [r15 + 0xe0]
0xdc6de0: lea r8, [rbp - 0x21]
0xdc6de4: lea rdx, [rbp - 0x29]
0xdc6de8: mov rcx, r12
0xdc6deb: call 0x140dcf9a0
0xdc6df0: mov rdi, rax
FUNCTION 0xdc6f30 END 0xdc7608
0xdc72fe: add rcx, 0x14
0xdc7302: cmp eax, edx
0xdc7304: jb 0x140dc72f3
0xdc7306: mov word ptr [rsp + 0x20], bx
0xdc730b: vmovsd xmm0, qword ptr [rsi + 0xe0]
0xdc7313: vmovsd qword ptr [rsp + 0x24], xmm0
0xdc7319: mov eax, dword ptr [rsi + 0xe8]
0xdc731f: mov dword ptr [rsp + 0x2c], eax
0xdc7323: cmp edx, dword ptr [rbp - 0x64]
0xdc7326: jb 0x140dc7345
FUNCTION 0xdc6f30 END 0xdc7608
0xdc7383: cmp eax, -1
0xdc7386: je 0x140dc7306
0xdc738c: lea rcx, [rax + rax*4]
0xdc7390: vmovss xmm0, dword ptr [r8 + rcx*4 + 4]
0xdc7397: vaddss xmm1, xmm0, dword ptr [rsi + 0xe0]
0xdc739f: vmovss dword ptr [r8 + rcx*4 + 4], xmm1
0xdc73a6: vmovss xmm0, dword ptr [rsi + 0xe4]
0xdc73ae: vaddss xmm1, xmm0, dword ptr [r8 + rcx*4 + 8]
0xdc73b5: vmovss dword ptr [r8 + rcx*4 + 8], xmm1
0xdc73bc: vmovss xmm0, dword ptr [rsi + 0xe8]
FUNCTION 0xdcd690 END 0xdce06d
0xdcda13: mov rcx, qword ptr [rbp - 0x71]
0xdcda17: mov rax, qword ptr [rcx]
0xdcda1a: mov dl, 1
0xdcda1c: call qword ptr [rax + 0x20]
0xdcda1f: lea rax, [r15 + 0xe0]
0xdcda26: mov qword ptr [rbp - 0x79], rax
0xdcda2a: xor ecx, ecx
0xdcda2c: mov esi, ecx
0xdcda2e: mov r15d, ecx
0xdcda31: mov byte ptr [rsp + 0x30], cl
FUNCTION 0xdd1820 END 0xdd1e6e
0xdd1ab2: call 0x1435da350
0xdd1ab7: test rax, rax
0xdd1aba: je 0x140dd1e42
0xdd1ac0: mov byte ptr [rax + 0xad1], 1
0xdd1ac7: lea rdx, [rbx + 0xe0]
0xdd1ace: lea r9, [rip + 0x488553f]
0xdd1ad5: xor r8d, r8d
0xdd1ad8: mov rcx, rax
0xdd1adb: call 0x140d91390
0xdd1ae0: jmp 0x140dd1e42
FUNCTION 0xdd2460 END 0xdd2fe5
0xdd27f0: mov eax, dword ptr [rbx + 0x1c0]
0xdd27f6: mov dword ptr [rbp - 0x34], eax
0xdd27f9: vmovss xmm0, dword ptr [rbx + 0x100]
0xdd2801: vmovss dword ptr [rbp - 0x38], xmm0
0xdd2806: vmovsd xmm1, qword ptr [rbx + 0xe0]
0xdd280e: vmovsd qword ptr [rbp - 8], xmm1
0xdd2813: mov eax, dword ptr [rbx + 0xe8]
0xdd2819: mov dword ptr [rbp], eax
0xdd281c: lea rcx, [rbp + 0x98]
0xdd2823: call 0x140473f20
FUNCTION 0xdd77b0 END 0xdd797e
0xdd78c4: cmp byte ptr [rax + 0xe], 0
0xdd78c8: je 0x140dd78cd
0xdd78ca: mov rax, qword ptr [rax]
0xdd78cd: vmovss xmm4, dword ptr [rip + 0x4f9bc67]
0xdd78d5: vmovsd xmm2, qword ptr [rbx + 0xe0]
0xdd78dd: vaddss xmm0, xmm6, xmm4
0xdd78e1: vmulss xmm1, xmm0, xmm9
0xdd78e6: vmulss xmm1, xmm1, dword ptr [rip + 0x4f9b3da]
0xdd78ee: vmulss xmm0, xmm1, xmm8
0xdd78f3: vsubss xmm0, xmm2, xmm0
FUNCTION 0xdd86f0 END 0xdd8fee
0xdd8c8a: mov rdx, qword ptr [r15 + 8]
0xdd8c8e: lea rcx, [rbp + 0x170]
0xdd8c95: call 0x140393df0
0xdd8c9a: nop 
0xdd8c9b: mov rdi, qword ptr [r15 + 0xe0]
0xdd8ca2: mov ebx, dword ptr [r15 + 0xe8]
0xdd8ca9: mov eax, dword ptr [rbp - 0x44]
0xdd8cac: mov ecx, dword ptr [rbp - 0x48]
0xdd8caf: sub eax, ecx
0xdd8cb1: cmp ebx, eax
FUNCTION 0xdd8ff0 END 0xdd90bb
0xdd9060: movzx ecx, word ptr [rax + 0xa0]
0xdd9067: mov word ptr [rsp + 0x38], cx
0xdd906c: lea rcx, [rsp + 0x38]
0xdd9071: call 0x1404a3590
0xdd9076: lea r8, [rbx + 0xe0]
0xdd907d: mov rcx, rax
0xdd9080: lea rdx, [rsp + 0x38]
0xdd9085: call 0x14155bf40
0xdd908a: mov ecx, dword ptr [rsp + 0x3c]
0xdd908e: mov rax, qword ptr [rdi + 0x320]
FUNCTION 0xdddc20 END 0xddef3a
0xdddc5a: test rbx, rbx
0xdddc5d: je 0x140dddc66
0xdddc5f: cmp qword ptr [rbx + 8], 0
0xdddc64: jne 0x140dddcb5
0xdddc66: mov rcx, qword ptr [rsi + 0xe0]
0xdddc6d: test rcx, rcx
0xdddc70: je 0x140dddc8b
0xdddc72: lea rdx, [rip + 0x5ef27d3]
0xdddc79: call 0x1404743a0
0xdddc7e: test rax, rax
FUNCTION 0xdddc20 END 0xddef3a
0xdddd28: test rdi, rdi
0xdddd2b: je 0x140dddd37
0xdddd2d: cmp qword ptr [rdi + 8], rbx
0xdddd31: jne 0x140dde32a
0xdddd37: mov rcx, qword ptr [rsi + 0xe0]
0xdddd3e: test rcx, rcx
0xdddd41: je 0x140dddd54
0xdddd43: lea rdx, [rip + 0x5ef2706]
0xdddd4a: call 0x1404743a0
0xdddd4f: test rax, rax
FUNCTION 0xdec710 END 0xdec875
0xdec741: mov dword ptr [rbx + 0xd1], eax
0xdec747: mov word ptr [rbx + 0xd5], ax
0xdec74e: mov byte ptr [rbx + 0xd7], al
0xdec754: mov qword ptr [rbx + 0xd8], 0xffffffffffffffff
0xdec75f: mov qword ptr [rbx + 0xe0], rax
0xdec766: mov dword ptr [rbx + 0xe8], eax
0xdec76c: mov dword ptr [rbx + 0xec], 0x7fffffff
0xdec776: mov dword ptr [rbx + 0xf0], 0x7fffffff
0xdec780: mov qword ptr [rbx + 0xf8], rax
0xdec787: mov qword ptr [rbx + 0x100], rax
FUNCTION 0xdec990 END 0xdeca3a
0xdec9a7: mov byte ptr [rcx + 0xd0], 0x15
0xdec9ae: mov rbx, rcx
0xdec9b1: mov qword ptr [rcx + 0xd8], 0xffffffffffffffff
0xdec9bc: vmovsd xmm0, qword ptr [rip + 0x47594c4]
0xdec9c4: vmovsd qword ptr [rcx + 0xe0], xmm0
0xdec9cc: mov eax, dword ptr [rip + 0x47594be]
0xdec9d2: mov dword ptr [rcx + 0xe8], eax
0xdec9d8: mov dword ptr [rcx + 0x100], edi
0xdec9de: mov qword ptr [rcx + 0x110], rdi
0xdec9e5: mov dword ptr [rcx + 0x1c0], edi
FUNCTION 0xdecaf0 END 0xdecc37
0xdecaf0: mov qword ptr [rsp + 0x10], rbx
0xdecaf5: push rdi
0xdecaf6: sub rsp, 0x20
0xdecafa: vmovss xmm0, dword ptr [rcx + 0xe0]
0xdecb02: vsubss xmm3, xmm0, dword ptr [rdx]
0xdecb06: vmovss xmm2, dword ptr [rip + 0x4f86292]
0xdecb0e: vcomiss xmm2, xmm3
0xdecb12: mov rdi, rdx
0xdecb15: mov rbx, rcx
FUNCTION 0xdecaf0 END 0xdecc37
0xdecb65: pop rdi
0xdecb66: ret 
0xdecb67: cmp qword ptr [rcx + 0x28], 0
0xdecb6c: vmovsd xmm0, qword ptr [rdx]
0xdecb70: vmovsd qword ptr [rcx + 0xe0], xmm0
0xdecb78: mov eax, dword ptr [rdx + 8]
0xdecb7b: mov dword ptr [rcx + 0xe8], eax
0xdecb81: mov byte ptr [rcx + 0x1ef], 1
0xdecb88: je 0x140decc2a
0xdecb8e: mov rax, qword ptr [rcx]
FUNCTION 0xdee390 END 0xdeeb59
0xdee5b7: je 0x140dee67c
0xdee5bd: cmp dword ptr [rsi + 0xc], r15d
0xdee5c1: jne 0x140dee67c
0xdee5c7: mov rcx, qword ptr [rbx + 0x18]
0xdee5cb: vsubss xmm6, xmm9, dword ptr [rcx + 0xe0]
0xdee5d3: vsubss xmm7, xmm10, dword ptr [rcx + 0xe8]
0xdee5db: add rcx, 0xde
0xdee5e2: call 0x140537250
0xdee5e7: vmovss xmm3, dword ptr [rax + 0x88]
0xdee5ef: vmulss xmm0, xmm6, xmm6
FUNCTION 0xdf2cf0 END 0xdf38de
0xdf2fee: vcvttss2si ecx, xmm2
0xdf2ff2: vxorps xmm2, xmm2, xmm2
0xdf2ff6: test al, al
0xdf2ff8: je 0x140df351b
0xdf2ffe: vmovss xmm6, dword ptr [rdi + 0xe0]
0xdf3006: vdivss xmm0, xmm6, xmm3
0xdf300a: vxorps xmm1, xmm1, xmm1
0xdf300e: vroundss xmm1, xmm1, xmm0, 1
0xdf3014: vcvttss2si eax, xmm1
0xdf3018: mov dword ptr [rbp - 0x68], eax
FUNCTION 0xdf2cf0 END 0xdf38de
0xdf316f: vcvtsi2ss xmm2, xmm2, eax
0xdf3173: vmovss xmm4, dword ptr [rdi + 0xe8]
0xdf317b: vxorps xmm6, xmm6, xmm6
0xdf317f: vcvtsi2ss xmm6, xmm6, ecx
0xdf3183: vmovss xmm7, dword ptr [rdi + 0xe0]
0xdf318b: imul ecx, r12d
0xdf318f: vxorps xmm3, xmm3, xmm3
0xdf3193: vcvtsi2ss xmm3, xmm3, ecx
0xdf3197: vmovss xmm8, dword ptr [rdi + 0x100]
0xdf319f: vaddss xmm0, xmm6, xmm2
FUNCTION 0xdf2cf0 END 0xdf38de
0xdf3506: cmp byte ptr [r8 + rdx], 0
0xdf350b: je 0x140df38a0
0xdf3511: call 0x1447f03bc
0xdf3516: jmp 0x140df38a5
0xdf351b: vmovss xmm0, dword ptr [rdi + 0xe0]
0xdf3523: vdivss xmm1, xmm0, xmm3
0xdf3527: vroundss xmm2, xmm2, xmm1, 1
0xdf352d: vcvttss2si eax, xmm2
0xdf3531: mov dword ptr [rbp - 0x48], eax
0xdf3534: mov dword ptr [rbp - 0x44], ecx
FUNCTION 0xdf5490 END 0xdf8143
0xdf6265: lea rdx, [rsp + 0x60]
0xdf626a: call 0x140476290
0xdf626f: nop 
0xdf6270: mov byte ptr [rsp + 0x79], 0
0xdf6275: mov r14, qword ptr [rsi + 0xe0]
0xdf627c: mov qword ptr [rbp - 0x80], rbx
0xdf6280: lea rdx, [rip + 0xb579]
0xdf6287: mov qword ptr [rbp - 0x78], rdx
0xdf628b: mov qword ptr [rbp - 0x70], rdi
0xdf628f: mov word ptr [rbp - 0x68], 0
FUNCTION 0xdf5490 END 0xdf8143
0xdf7970: add rcx, qword ptr [r12 + 0x40]
0xdf7975: vzeroupper 
0xdf7978: call 0x14035f1f0
0xdf797d: dec dword ptr [r12 + 0x48]
0xdf7982: mov r12, qword ptr [rsi + 0xe0]
0xdf7989: add r12, 0x40
0xdf798d: mov eax, dword ptr [r12 + 8]
0xdf7992: mov r14d, edi
0xdf7995: test eax, eax
0xdf7997: je 0x140df7a10
FUNCTION 0xe04f00 END 0xe058d8
0xe0537f: test rdi, rdi
0xe05382: je 0x140e0538b
0xe05384: cmp qword ptr [rdi + 8], 0
0xe05389: jne 0x140e053e9
0xe0538b: mov rcx, qword ptr [rax + 0xe0]
0xe05392: test rcx, rcx
0xe05395: je 0x140e053a8
0xe05397: lea rdx, [rip + 0x5ecbe86]
0xe0539e: call 0x1404743a0
0xe053a3: test rax, rax
FUNCTION 0xe0ce20 END 0xe0eb0d
0xe0cf9d: vmovss xmm0, dword ptr [rax + 0xd8]
0xe0cfa5: vmulss xmm7, xmm0, dword ptr [rax + 0xd4]
0xe0cfad: jmp 0x140e0cfd2
0xe0cfaf: cmp byte ptr [rax + 0x13c], dil
0xe0cfb6: lea rcx, [rax + 0xe0]
0xe0cfbd: jne 0x140e0cfc6
0xe0cfbf: lea rcx, [rax + 0xdc]
0xe0cfc6: vmovss xmm0, dword ptr [rax + 0xd4]
0xe0cfce: vmulss xmm7, xmm0, dword ptr [rcx]
0xe0cfd2: mov rax, qword ptr [r12 + 0x3a0]
FUNCTION 0xe0ce20 END 0xe0eb0d
0xe0deb0: mov rbx, qword ptr [rbp + 0x20]
0xe0deb4: lea rcx, [rbx + 0x98]
0xe0debb: lea rdx, [rbp - 0x30]
0xe0debf: call 0x143d16300
0xe0dec4: mov byte ptr [rbx + 0xe0], 1
0xe0decb: mov rcx, qword ptr [rbp + 8]
0xe0decf: test rcx, rcx
0xe0ded2: mov r13, qword ptr [rbp + 0x168]
0xe0ded9: mov ebx, 0x1fd
0xe0dede: je 0x140e0defe
FUNCTION 0xe0ce20 END 0xe0eb0d
0xe0e953: mov rbx, qword ptr [rbp + 0x20]
0xe0e957: lea rcx, [rbx + 0x98]
0xe0e95e: lea rdx, [rbp - 0x30]
0xe0e962: call 0x143d16300
0xe0e967: mov byte ptr [rbx + 0xe0], 1
0xe0e96e: mov rcx, qword ptr [rbp + 8]
0xe0e972: mov ebx, 0x1fd
0xe0e977: test rcx, rcx
0xe0e97a: je 0x140e0e99a
0xe0e97c: mov rax, qword ptr gs:[0x58]
FUNCTION 0xe0eb10 END 0xe0efce
0xe0ec38: vmovss xmm0, dword ptr [rax + 0xd8]
0xe0ec40: vmulss xmm6, xmm0, dword ptr [rax + 0xd4]
0xe0ec48: jmp 0x140e0ec6d
0xe0ec4a: cmp byte ptr [rax + 0x13c], dil
0xe0ec51: lea rcx, [rax + 0xe0]
0xe0ec58: jne 0x140e0ec61
0xe0ec5a: lea rcx, [rax + 0xdc]
0xe0ec61: vmovss xmm0, dword ptr [rax + 0xd4]
0xe0ec69: vmulss xmm6, xmm0, dword ptr [rcx]
0xe0ec6d: mov rax, qword ptr [r15 + 0x3a0]
FUNCTION 0xe0f260 END 0xe0f328
0xe0f2ca: jne 0x140e0f2d9
0xe0f2cc: cmp byte ptr [rdx + 0x1ed], r8b
0xe0f2d3: je 0x140e0fe03
0xe0f2d9: movzx ebx, word ptr [rdx + 0xde]
0xe0f2e0: vmovss xmm0, dword ptr [rdx + 0xe0]
0xe0f2e8: vmovss xmm1, dword ptr [rdx + 0xe8]
0xe0f2f0: mov rdx, qword ptr [rdx + 0x1f8]
0xe0f2f7: mov word ptr [rbp + 0x47], bx
0xe0f2fb: vmovss dword ptr [rbp + 0x57], xmm0
0xe0f300: vmovss dword ptr [rbp + 0x5b], xmm1
FUNCTION 0xe0ffc0 END 0xe113d1
0xe107f1: lea rcx, [rbp + 0x818]
0xe107f8: call 0x1404a2630
0xe107fd: cmp byte ptr [rax + 0x4e], 0
0xe10801: je 0x140e10827
0xe10803: lea r8, [rsi + 0xe0]
0xe1080a: xor r9d, r9d
0xe1080d: call 0x140658ae0
0xe10812: cmp byte ptr [rsi + 0x1d8], al
0xe10818: je 0x140e10827
0xe1081a: mov byte ptr [rsi + 0x1d8], al
FUNCTION 0xe0ffc0 END 0xe113d1
0xe11091: jp 0x140e1109d
0xe11093: jne 0x140e1109d
0xe11095: vmovss xmm0, dword ptr [r13 + 8]
0xe1109b: jmp 0x140e110e8
0xe1109d: vmovss xmm0, dword ptr [rsi + 0xe0]
0xe110a5: vsubss xmm2, xmm0, dword ptr [rbx]
0xe110a9: vsubss xmm3, xmm1, dword ptr [rbx + 4]
0xe110ae: vmovss xmm1, dword ptr [rsi + 0xe8]
0xe110b6: vsubss xmm4, xmm1, dword ptr [rbx + 8]
0xe110bb: vmulss xmm2, xmm2, xmm2
FUNCTION 0xe125a4 END 0xe1263b
0xe125c5: jbe 0x140e1260b
0xe125c7: mov rax, qword ptr [rsi + 0x578]
0xe125ce: mov dword ptr [rsi + 0x584], 0
0xe125d8: mov rbx, qword ptr [rax + 0xd8]
0xe125df: mov eax, dword ptr [rax + 0xe0]
0xe125e5: lea rdi, [rbx + rax*8]
0xe125e9: cmp rbx, rdi
0xe125ec: je 0x140e1260b
0xe125ee: nop 
0xe125f0: mov rcx, qword ptr [rbx]
FUNCTION 0xe125a4 END 0xe1263b
0xe125e9: cmp rbx, rdi
0xe125ec: je 0x140e1260b
0xe125ee: nop 
0xe125f0: mov rcx, qword ptr [rbx]
0xe125f3: cmp word ptr [rcx + 0xe0], r12w
0xe125fb: je 0x140e12602
0xe125fd: call 0x140e17820
0xe12602: add rbx, 8
0xe12606: cmp rbx, rdi
0xe12609: jne 0x140e125f0
FUNCTION 0xe13cf0 END 0xe14ba3
0xe143f4: mov byte ptr [rbp - 0x42], r15b
0xe143f8: movzx r13d, byte ptr [rsi + 0x270]
0xe14400: movzx r12d, word ptr [rsi + 0xde]
0xe14408: mov word ptr [rbp - 0x78], r12w
0xe1440d: vmovss xmm0, dword ptr [rsi + 0xe0]
0xe14415: vsubss xmm1, xmm0, dword ptr [rbp - 0x70]
0xe1441a: vmovss dword ptr [rbp - 0x30], xmm1
0xe1441f: vmovss xmm2, dword ptr [rsi + 0xe8]
0xe14427: vsubss xmm0, xmm2, dword ptr [rbp - 0x68]
0xe1442c: vmovss dword ptr [rbp - 0x2c], xmm0
FUNCTION 0xe14c20 END 0xe14fbd
0xe14c56: cmp qword ptr [rsi + 8], 0
0xe14c5b: je 0x140e14c62
0xe14c5d: mov rcx, rdi
0xe14c60: jmp 0x140e14cb8
0xe14c62: mov rcx, qword ptr [rcx + 0xe0]
0xe14c69: test rcx, rcx
0xe14c6c: je 0x140e14c87
0xe14c6e: lea rdx, [rip + 0x5ebc637]
0xe14c75: call 0x1404743a0
0xe14c7a: test rax, rax
FUNCTION 0xe14c20 END 0xe14fbd
0xe14cda: cmp qword ptr [rsi + 8], 0
0xe14cdf: je 0x140e14ce6
0xe14ce1: mov rcx, rdi
0xe14ce4: jmp 0x140e14d3c
0xe14ce6: mov rcx, qword ptr [rcx + 0xe0]
0xe14ced: test rcx, rcx
0xe14cf0: je 0x140e14d0b
0xe14cf2: lea rdx, [rip + 0x5ebc5b7]
0xe14cf9: call 0x1404743a0
0xe14cfe: test rax, rax
FUNCTION 0xe14c20 END 0xe14fbd
0xe14d53: test rsi, rsi
0xe14d56: je 0x140e14d5f
0xe14d58: cmp qword ptr [rsi + 8], 0
0xe14d5d: jne 0x140e14db5
0xe14d5f: mov rcx, qword ptr [rcx + 0xe0]
0xe14d66: test rcx, rcx
0xe14d69: je 0x140e14d84
0xe14d6b: lea rdx, [rip + 0x5ebc542]
0xe14d72: call 0x1404743a0
0xe14d77: test rax, rax
FUNCTION 0xe15070 END 0xe16488
0xe150ae: mov qword ptr [rcx + 0xc8], rax
0xe150b5: mov edx, dword ptr [rdx + 0x18]
0xe150b8: call 0x140decc40
0xe150bd: vmovsd xmm0, qword ptr [r15 + 0x1c]
0xe150c3: vmovsd qword ptr [rdi + 0xe0], xmm0
0xe150cb: mov eax, dword ptr [r15 + 0x24]
0xe150cf: mov dword ptr [rdi + 0xe8], eax
0xe150d5: mov rax, qword ptr [r15 + 0x28]
0xe150d9: mov qword ptr [rdi + 0x110], rax
0xe150e0: mov rdx, qword ptr [r15 + 0x40]
FUNCTION 0xe15070 END 0xe16488
0xe15144: test rbx, rbx
0xe15147: je 0x140e15150
0xe15149: cmp qword ptr [rbx + 8], 0
0xe1514e: jne 0x140e151be
0xe15150: mov rcx, qword ptr [r12 + 0xe0]
0xe15158: test rcx, rcx
0xe1515b: je 0x140e1517b
0xe1515d: lea rdx, [rip + 0x5ebc124]
0xe15164: call 0x1404743a0
0xe15169: test rax, rax
FUNCTION 0xe16af0 END 0xe16c1c
0xe16bb2: jmp 0x140e16bb9
0xe16bb4: call 0x1447f02bc
0xe16bb9: xor eax, eax
0xe16bbb: mov qword ptr [rdi + 0xd8], rax
0xe16bc2: mov qword ptr [rdi + 0xe0], rax
0xe16bc9: mov rcx, rdi
0xe16bcc: call 0x140cb6730
0xe16bd1: test sil, 1
0xe16bd5: je 0x140e16c09
0xe16bd7: mov rax, qword ptr gs:[0x58]
FUNCTION 0xe17430 END 0xe17469
0xe1744a: call 0x140430280
0xe1744f: mov r15d, 0xffff
0xe17455: cmp word ptr [rax + 0x188], r15w
0xe1745d: je 0x140e17544
0xe17463: mov eax, dword ptr [rsi + 0xe0]
FUNCTION 0xe17563 END 0xe17599
0xe1757a: call 0x140430280
0xe1757f: mov r15d, 0xffff
0xe17585: cmp word ptr [rax + 0x188], r15w
0xe1758d: je 0x140e17674
0xe17593: mov eax, dword ptr [rsi + 0xe0]
FUNCTION 0xe17bd0 END 0xe17bfc
0xe17bde: mov rbx, rcx
0xe17be1: je 0x140e17de1
0xe17be7: cmp qword ptr [rcx + 0xd0], 0
0xe17bef: je 0x140e17de1
0xe17bf5: lea r9, [rcx + 0xe0]
FUNCTION 0xe18fe0 END 0xe19047
0xe18fe5: sub rsp, 0x18
0xe18fe9: mov r8, rdx
0xe18fec: xor edx, edx
0xe18fee: mov dword ptr [rsp], edx
0xe18ff1: mov rax, qword ptr [rcx + 0xe0]
0xe18ff8: mov qword ptr [r8], rax
0xe18ffb: mov rax, qword ptr [rcx + 0xe8]
0xe19002: mov qword ptr [r8 + 8], rax
0xe19006: movzx eax, byte ptr [rcx + 0xf0]
0xe1900d: mov byte ptr [r8 + 0x10], al
FUNCTION 0xe1aab5 END 0xe1ab46
0xe1ab00: mov rcx, qword ptr [rbx + 0x108]
0xe1ab07: xor r8d, r8d
0xe1ab0a: call 0x143ed4e00
0xe1ab0f: jmp 0x140e1ab1e
0xe1ab11: mov rcx, qword ptr [rbx + 0xe0]
0xe1ab18: mov rax, qword ptr [rcx]
0xe1ab1b: call qword ptr [rax + 0x28]
0xe1ab1e: test rbp, rbp
0xe1ab21: je 0x140e1ab31
0xe1ab23: mov qword ptr [rbx + 0xc8], rbp
FUNCTION 0xe1bda0 END 0xe1be6b
0xe1be0f: je 0x140e1be45
0xe1be11: mov r9, qword ptr [rbx + 0x150]
0xe1be18: xor r8d, r8d
0xe1be1b: jmp 0x140e1be39
0xe1be1d: cmp rdi, qword ptr [rbx + 0xe0]
0xe1be24: jne 0x140e1be5b
0xe1be26: mov rcx, qword ptr [rbx + 0x28]
0xe1be2a: test rcx, rcx
0xe1be2d: je 0x140e1be45
0xe1be2f: mov r9, 0xffffffffffffffff
FUNCTION 0xe1dbaa END 0xe1dd40
0xe1dbba: je 0x140e1dbf0
0xe1dbbc: mov r9, qword ptr [rbx + 0x1a0]
0xe1dbc3: xor r8d, r8d
0xe1dbc6: jmp 0x140e1dbe4
0xe1dbc8: cmp rdi, qword ptr [rbx + 0xe0]
0xe1dbcf: jne 0x140e1dc12
0xe1dbd1: mov rcx, qword ptr [rbx + 0x28]
0xe1dbd5: test rcx, rcx
0xe1dbd8: je 0x140e1dbf0
0xe1dbda: mov r9, 0xffffffffffffffff
FUNCTION 0xe1eb10 END 0xe1ec61
0xe1eb83: je 0x140e1ebb9
0xe1eb85: mov r9, qword ptr [rbx + 0x188]
0xe1eb8c: xor r8d, r8d
0xe1eb8f: jmp 0x140e1ebad
0xe1eb91: cmp rdi, qword ptr [rbx + 0xe0]
0xe1eb98: jne 0x140e1ebdf
0xe1eb9a: mov rcx, qword ptr [rbx + 0x28]
0xe1eb9e: test rcx, rcx
0xe1eba1: je 0x140e1ebb9
0xe1eba3: mov r9, 0xffffffffffffffff
FUNCTION 0xe1fd55 END 0xe1ff07
0xe1fe32: cmp qword ptr [rsi + 8], rbp
0xe1fe36: je 0x140e1fe3d
0xe1fe38: mov rcx, r14
0xe1fe3b: jmp 0x140e1fe93
0xe1fe3d: mov rcx, qword ptr [rax + 0xe0]
0xe1fe44: test rcx, rcx
0xe1fe47: je 0x140e1fe62
0xe1fe49: lea rdx, [rip + 0x5eb16cc]
0xe1fe50: call 0x1404743a0
0xe1fe55: test rax, rax
FUNCTION 0xe201d0 END 0xe20496
0xe20417: jmp 0x140e2047d
0xe20419: call 0x1447f02bc
0xe2041e: mov qword ptr [rsp + 0x128], rsi
0xe20426: jmp 0x140e2047d
0xe20428: cmp rbx, qword ptr [rdi + 0xe0]
0xe2042f: jne 0x140e20468
0xe20431: mov rcx, qword ptr [rdi + 0x28]
0xe20435: test rcx, rcx
0xe20438: je 0x140e20450
0xe2043a: mov rax, qword ptr [rcx]
FUNCTION 0xe20d9d END 0xe20f61
0xe20daa: test rcx, rcx
0xe20dad: je 0x140e20ddc
0xe20daf: xor r8d, r8d
0xe20db2: jmp 0x140e20dc9
0xe20db4: cmp rdi, qword ptr [rbx + 0xe0]
0xe20dbb: jne 0x140e20e02
0xe20dbd: mov rcx, qword ptr [rbx + 0x28]
0xe20dc1: test rcx, rcx
0xe20dc4: je 0x140e20ddc
0xe20dc6: mov r8b, 1
FUNCTION 0xe21cc0 END 0xe21ee8
0xe21d35: mov rax, qword ptr [rbx + 0x140]
0xe21d3c: xor r8d, r8d
0xe21d3f: mov r9d, dword ptr [rax + 0x120]
0xe21d46: jmp 0x140e21d64
0xe21d48: cmp rdi, qword ptr [rbx + 0xe0]
0xe21d4f: jne 0x140e21d96
0xe21d51: mov rcx, qword ptr [rbx + 0x28]
0xe21d55: test rcx, rcx
0xe21d58: je 0x140e21d70
0xe21d5a: mov r9, 0xffffffffffffffff
FUNCTION 0xe22bb0 END 0xe231d1
0xe22c77: vmovdqu xmmword ptr [rsp + 0x28], xmm0
0xe22c7d: mov word ptr [rsp + 0x38], r12w
0xe22c83: mov rcx, rdi
0xe22c86: call 0x1404a21f0
0xe22c8b: mov rcx, qword ptr [rax + 0xe0]
0xe22c92: call 0x1404a1ee0
0xe22c97: mov rdi, qword ptr [rax + 0x28]
0xe22c9b: mov r8, qword ptr [rdi]
0xe22c9e: movzx eax, byte ptr [r8 + 0x60]
0xe22ca3: mov edx, 0x1ec
FUNCTION 0xe22bb0 END 0xe231d1
0xe23066: mov qword ptr [rsp + 0x48], rax
0xe2306b: lea rcx, [rsp + 0x48]
0xe23070: call 0x141434880
0xe23075: jmp 0x140e231b6
0xe2307a: cmp rbx, qword ptr [rsi + 0xe0]
0xe23081: jne 0x140e230bd
0xe23083: mov rcx, qword ptr [rsi + 0x28]
0xe23087: test rcx, rcx
0xe2308a: je 0x140e230a2
0xe2308c: mov rax, qword ptr [rcx]
FUNCTION 0xe25130 END 0xe2558d
0xe253ff: mov qword ptr [rbp - 0x79], rax
0xe25403: lea rcx, [rbp - 0x79]
0xe25407: call 0x141434880
0xe2540c: jmp 0x140e25571
0xe25411: cmp qword ptr [rsi + 0xe0], rbx
0xe25418: jne 0x140e25454
0xe2541a: mov rcx, qword ptr [rsi + 0x28]
0xe2541e: test rcx, rcx
0xe25421: je 0x140e25439
0xe25423: mov rax, qword ptr [rcx]
FUNCTION 0xe26140 END 0xe2703f
0xe26692: mov byte ptr [rsp + 0x20], 1
0xe26697: mov r9d, 1
0xe2669d: movzx r8d, bx
0xe266a1: lea rdx, [rbp - 0x50]
0xe266a5: mov rcx, qword ptr [rcx + 0xe0]
0xe266ac: call 0x14213b640
0xe266b1: mov eax, dword ptr [rbp - 0x50]
0xe266b4: mov dword ptr [rsp + 0x6c], eax
0xe266b8: movzx edi, dil
0xe266bc: movzx ecx, r14b
FUNCTION 0xe27040 END 0xe27f05
0xe272e0: movzx ebx, word ptr [rsi]
0xe272e3: mov word ptr [rsp + 0x60], bx
0xe272e8: lea rcx, [rsp + 0x60]
0xe272ed: call 0x1404a21f0
0xe272f2: mov rcx, qword ptr [rax + 0xe0]
0xe272f9: call 0x1404a1ee0
0xe272fe: mov rcx, qword ptr [rax + 0x28]
0xe27302: mov rcx, qword ptr [rcx]
0xe27305: add rcx, 0x38
0xe27309: call 0x14038ab60
FUNCTION 0xe27040 END 0xe27f05
0xe274e3: mov byte ptr [rsp + 0x20], 1
0xe274e8: mov r9d, 1
0xe274ee: movzx r8d, bx
0xe274f2: lea rdx, [rbp - 0x30]
0xe274f6: mov rcx, qword ptr [rcx + 0xe0]
0xe274fd: call 0x14213b640
0xe27502: mov eax, dword ptr [rbp - 0x30]
0xe27505: mov dword ptr [rsp + 0x68], eax
0xe27509: test eax, eax
0xe2750b: jne 0x140e27581
FUNCTION 0xe290e0 END 0xe291ff
0xe29153: je 0x140e29189
0xe29155: mov r9d, dword ptr [rbx + 0x158]
0xe2915c: xor r8d, r8d
0xe2915f: jmp 0x140e2917d
0xe29161: cmp rdi, qword ptr [rbx + 0xe0]
0xe29168: jne 0x140e291af
0xe2916a: mov rcx, qword ptr [rbx + 0x28]
0xe2916e: test rcx, rcx
0xe29171: je 0x140e29189
0xe29173: mov r9, 0xffffffffffffffff
FUNCTION 0xe2b9b0 END 0xe2bd81
0xe2bc97: mov rsi, qword ptr [rsp + 0x38]
0xe2bc9c: add rsp, 0x20
0xe2bca0: pop rdi
0xe2bca1: jmp 0x140e2ce20
0xe2bca6: cmp rdi, qword ptr [rbx + 0xe0]
0xe2bcad: jne 0x140e2bd2c
0xe2bcaf: mov rdi, qword ptr [rbx + 0x158]
0xe2bcb6: cmp byte ptr [rdi + 0xc0], 0
0xe2bcbd: mov word ptr [rdi + 0xc8], 0x101
0xe2bcc6: jne 0x140e2bcf0
FUNCTION 0xe2ea30 END 0xe2eb5f
0xe2ead9: mov rsi, qword ptr [rsp + 0x38]
0xe2eade: add rsp, 0x20
0xe2eae2: pop rdi
0xe2eae3: ret 
0xe2eae4: cmp rdi, qword ptr [rbx + 0xe0]
0xe2eaeb: jne 0x140e2eafb
0xe2eaed: mov rcx, qword ptr [rbx + 0x28]
0xe2eaf1: test rcx, rcx
0xe2eaf4: je 0x140e2eabe
0xe2eaf6: mov r8b, 1
FUNCTION 0xe2fce0 END 0xe2fd6e
0xe2fd36: xor ecx, ecx
0xe2fd38: mov ebx, ecx
0xe2fd3a: test sil, sil
0xe2fd3d: jne 0x140e2fd5e
0xe2fd3f: cmp rbx, qword ptr [rdi + 0xe0]
0xe2fd46: jne 0x140e2fd5e
0xe2fd48: mov rcx, rdi
0xe2fd4b: call 0x140cb6d80
0xe2fd50: mov rax, qword ptr [rdi + 0xd0]
0xe2fd57: mov byte ptr [rax + 0xf2], sil
