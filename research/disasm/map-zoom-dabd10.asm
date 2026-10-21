0xdabd10: mov rax, rsp
0xdabd13: push rbx
0xdabd14: push rsi
0xdabd15: push rdi
0xdabd16: push r12
0xdabd18: push r13
0xdabd1a: push r14
0xdabd1c: push r15
0xdabd1e: sub rsp, 0x250
0xdabd25: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdabd2a: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdabd2f: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdabd34: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdabd39: vmovaps xmmword ptr [rax - 0x88], xmm10
0xdabd41: vmovaps xmmword ptr [rax - 0x98], xmm11
0xdabd49: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xdabd51: vmovaps xmmword ptr [rax - 0xb8], xmm13
0xdabd59: vmovaps xmmword ptr [rax - 0xc8], xmm14
0xdabd61: vmovaps xmmword ptr [rax - 0xd8], xmm15
0xdabd69: vmovaps xmm12, xmm1
0xdabd6d: mov r14, rcx
0xdabd70: xor r15d, r15d
0xdabd73: mov rax, qword ptr [rcx]
0xdabd76: call qword ptr [rax + 0x110]
0xdabd7c: mov rax, qword ptr [rax + 0x78]
0xdabd80: cmp dword ptr [rax + 0x28], r15d
0xdabd84: ja 0x140dabd8b
0xdabd86: mov ecx, r15d
0xdabd89: jmp 0x140dabd93
0xdabd8b: mov rax, qword ptr [rax + 0x20]
0xdabd8f: mov rcx, qword ptr [rax + 0x10]
0xdabd93: movzx ecx, byte ptr [rcx + 0x138]
0xdabd9a: test cl, cl
0xdabd9c: sete al
0xdabd9f: mov byte ptr [r14 + 0xad4], al
0xdabda6: test cl, cl
0xdabda8: je 0x140dabe66
0xdabdae: cmp byte ptr [r14 + 0xad5], r15b
0xdabdb5: je 0x140dabe66
0xdabdbb: mov rax, qword ptr [r14]
0xdabdbe: mov rcx, r14
0xdabdc1: call qword ptr [rax + 0x110]
0xdabdc7: mov rbx, qword ptr [rax + 0x78]
0xdabdcb: mov rax, qword ptr [rbx]
0xdabdce: mov rcx, rbx
0xdabdd1: call qword ptr [rax + 0x28]
0xdabdd4: test al, al
0xdabdd6: je 0x140dabe66
0xdabddc: cmp byte ptr [rbx + 0x50], 1
0xdabde0: je 0x140dabe66
0xdabde6: mov rax, qword ptr [rbx]
0xdabde9: mov rdx, 0xffffffffffffffff
0xdabdf0: mov rcx, rbx
0xdabdf3: call qword ptr [rax + 0x48]
0xdabdf6: mov byte ptr [rbx + 0x50], 1
0xdabdfa: vxorps xmm0, xmm0, xmm0
0xdabdfe: vcvtsi2ss xmm0, xmm0, dword ptr [rbx + 0x48]
0xdabe03: vxorps xmm1, xmm1, xmm1
0xdabe07: vcvtsi2ss xmm1, xmm1, dword ptr [rbx + 0x4c]
0xdabe0c: lea rdi, [rip + 0x495f545]  ; [0x570b358] = 10.7307 (0x412bb110)
0xdabe13: mov qword ptr [rsp + 0x70], rdi
0xdabe18: lea rax, [rip + 0x5f6a049]  ; [0x6d15e68] = runtime global (no file value)
0xdabe1f: mov qword ptr [rsp + 0x78], rax
0xdabe24: mov byte ptr [rsp + 0x80], r15b
0xdabe2c: lea rax, [rip + 0x4da554d]  ; [0x5b51380] = 2.95943 (0x403d6740)
0xdabe33: mov qword ptr [rsp + 0x70], rax
0xdabe38: mov byte ptr [rsp + 0x88], 1
0xdabe40: vmovss dword ptr [rsp + 0x8c], xmm0
0xdabe49: vmovss dword ptr [rsp + 0x90], xmm1
0xdabe52: lea rdx, [rsp + 0x70]
0xdabe57: mov rcx, qword ptr [rbx + 0x30]
0xdabe5b: call 0x1412b6e50
0xdabe60: nop 
0xdabe61: mov qword ptr [rsp + 0x70], rdi
0xdabe66: vmovss xmm0, dword ptr [rip + 0x5effbca]  ; [0x6caba38] = runtime global (no file value)
0xdabe6e: vdivss xmm1, xmm0, dword ptr [r14 + 0xaa0]
0xdabe77: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdabe80: vucomiss xmm0, xmm1
0xdabe84: jp 0x140dabe88
0xdabe86: je 0x140dabe99
0xdabe88: mov byte ptr [r14 + 0xaf4], 1
0xdabe90: vmovss dword ptr [r14 + 0xabc], xmm1
0xdabe99: mov rcx, qword ptr [r14 + 8]
0xdabe9d: lea rdx, [rsp + 0x290]
0xdabea5: mov rcx, qword ptr [rcx + 0x18]
0xdabea9: call 0x1435b4b90
0xdabeae: vmovss xmm3, dword ptr [r14 + 0xa98]
0xdabeb7: vmovss xmm4, dword ptr [rip + 0x4fc7075]  ; [0x5d72f34] = 0.5 (0x3f000000)
0xdabebf: vmulss xmm0, xmm4, dword ptr [rax + 4]
0xdabec4: vmulss xmm1, xmm0, dword ptr [rip + 0x5f00bac]  ; [0x6caca78] = runtime global (no file value)
0xdabecc: vmulss xmm14, xmm1, xmm3
0xdabed0: vmulss xmm0, xmm4, dword ptr [rax]
0xdabed4: vmulss xmm1, xmm0, dword ptr [rip + 0x5f00b4c]  ; [0x6caca28] = runtime global (no file value)
0xdabedc: vmulss xmm13, xmm1, xmm3
0xdabee0: lea rbx, [r14 + 0xa58]
0xdabee7: vmovss xmm8, dword ptr [rbx]
0xdabeeb: vsubss xmm6, xmm8, xmm13
0xdabef0: vmovss xmm11, dword ptr [rbx + 4]
0xdabef5: vsubss xmm7, xmm11, xmm14
0xdabefa: vaddss xmm1, xmm8, xmm13
0xdabeff: vmovss dword ptr [rsp + 0x290], xmm1
0xdabf08: vaddss xmm3, xmm11, xmm14
0xdabf0d: vmovss dword ptr [rsp + 0x294], xmm3
0xdabf16: xor sil, sil
0xdabf19: cmp byte ptr [r14 + 0xad4], sil
0xdabf20: je 0x140dac0b5
0xdabf26: cmp byte ptr [r14 + 0xad6], sil
0xdabf2d: je 0x140dac137
0xdabf33: vmovss xmm0, dword ptr [r14 + 0xa78]
0xdabf3c: vxorps xmm15, xmm15, xmm15
0xdabf41: vucomiss xmm0, xmm15
0xdabf46: jp 0x140dac130
0xdabf4c: jne 0x140dac130
0xdabf52: vmovss xmm0, dword ptr [r14 + 0xa7c]
0xdabf5b: vucomiss xmm0, xmm15
0xdabf60: jp 0x140dac130
0xdabf66: jne 0x140dac130
0xdabf6c: mov rdi, qword ptr [r14 + 0x5c0]
0xdabf73: test rdi, rdi
0xdabf76: jne 0x140dabf84
0xdabf78: mov byte ptr [r14 + 0xad6], sil
0xdabf7f: jmp 0x140dac08d
0xdabf84: vmovss xmm0, dword ptr [rdi + 0xe8]
0xdabf8c: vsubss xmm7, xmm0, xmm11
0xdabf91: vmovss xmm1, dword ptr [rdi + 0xe0]
0xdabf99: vsubss xmm6, xmm1, xmm8
0xdabf9e: vmulss xmm1, xmm7, xmm7
0xdabfa2: vmulss xmm0, xmm6, xmm6
0xdabfa6: vaddss xmm9, xmm1, xmm0
0xdabfaa: vmovss xmm10, dword ptr [rip + 0x5f017a6]  ; [0x6cad758] = runtime global (no file value)
0xdabfb2: vxorps xmm0, xmm0, xmm0
0xdabfb6: vucomiss xmm0, xmm9
0xdabfbb: ja 0x140dabfc4
0xdabfbd: vsqrtss xmm0, xmm9, xmm9
0xdabfc2: jmp 0x140dabfce
0xdabfc4: vmovaps xmm0, xmm9
0xdabfc9: call 0x144898f6e
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
0xdac009: jbe 0x140dac01f
0xdac00b: vmovss xmm1, dword ptr [rip + 0x4fc70a1]  ; [0x5d730b4] = 1 (0x3f800000)
0xdac013: vdivss xmm0, xmm1, xmm0
0xdac017: vmulss xmm6, xmm6, xmm0
0xdac01b: vmulss xmm7, xmm0, xmm7
0xdac01f: vmulss xmm0, xmm6, xmm12
0xdac024: vmulss xmm1, xmm0, xmm10
0xdac029: vaddss xmm2, xmm1, xmm8
0xdac02e: vmovss dword ptr [rsp + 0x290], xmm2
0xdac037: vmulss xmm0, xmm7, xmm12
0xdac03c: vmulss xmm1, xmm0, xmm10
0xdac041: vaddss xmm2, xmm1, xmm11
0xdac046: vmovss dword ptr [rsp + 0x294], xmm2
0xdac04f: mov rax, qword ptr [rsp + 0x290]
0xdac057: mov qword ptr [rsp + 0x290], rax
0xdac05f: vucomiss xmm8, dword ptr [rsp + 0x290]
0xdac068: jp 0x140dac082
0xdac06a: jne 0x140dac082
0xdac06c: vmovss xmm0, dword ptr [r14 + 0xa5c]
0xdac075: vucomiss xmm0, dword ptr [rsp + 0x294]
0xdac07e: jp 0x140dac082
0xdac080: je 0x140dac08d
0xdac082: mov qword ptr [rbx], rax
0xdac085: mov byte ptr [r14 + 0xaf5], 1
0xdac08d: vmovss xmm0, dword ptr [rbx + 4]
0xdac092: vsubss xmm7, xmm0, xmm14
0xdac097: vmovss xmm1, dword ptr [rbx]
0xdac09b: vsubss xmm6, xmm1, xmm13
0xdac0a0: vmovss dword ptr [rsp + 0x290], xmm6
0xdac0a9: vmovss dword ptr [rsp + 0x294], xmm7
0xdac0b2: mov sil, 1
0xdac0b5: mov rax, qword ptr [rsp + 0x290]
0xdac0bd: vmovss xmm14, dword ptr [rip + 0x4fc6fef]  ; [0x5d730b4] = 1 (0x3f800000)
0xdac0c5: vxorps xmm13, xmm13, xmm13
0xdac0ca: mov qword ptr [rsp + 0x290], rax
0xdac0d2: lea rbx, [r14 + 0xa00]
0xdac0d9: mov rcx, rbx
0xdac0dc: call 0x1404a2010
0xdac0e1: vmovss xmm9, dword ptr [rax + 0x18]
0xdac0e6: vmovss xmm11, dword ptr [rax + 0x14]
0xdac0eb: vmovss xmm10, dword ptr [rax + 0x20]
0xdac0f0: vmovss xmm8, dword ptr [rax + 0x1c]
0xdac0f5: vmovss xmm1, dword ptr [r14 + 0xaa0]
0xdac0fe: mov rcx, qword ptr [r14 + 0x598]
0xdac105: call 0x140dd4c90
0xdac10a: vxorps xmm12, xmm12, xmm12
0xdac10f: vmovss dword ptr [rsp + 0x2a0], xmm12
0xdac118: vxorps xmm15, xmm15, xmm15
0xdac11d: vcomiss xmm11, xmm6
0xdac121: jbe 0x140dac263
0xdac127: vsubss xmm12, xmm11, xmm6
0xdac12b: jmp 0x140dac27e
0xdac130: lea rbx, [r14 + 0xa58]
0xdac137: vxorps xmm13, xmm13, xmm13
0xdac13c: vxorps xmm8, xmm8, xmm8
0xdac141: vxorps xmm5, xmm5, xmm5
0xdac145: vmovss xmm2, dword ptr [r14 + 0xa90]
0xdac14e: lea rcx, [r14 + 0xa90]
0xdac155: vcomiss xmm6, xmm2
0xdac159: jbe 0x140dac161
0xdac15b: vsubss xmm8, xmm2, xmm6
0xdac15f: jmp 0x140dac179
0xdac161: vcomiss xmm2, xmm1
0xdac165: jbe 0x140dac179
0xdac167: vsubss xmm8, xmm2, xmm1
0xdac16b: lea rbx, [r14 + 0xa58]
0xdac172: lea rcx, [r14 + 0xa90]
0xdac179: vmovss xmm4, dword ptr [r14 + 0xa94]
0xdac182: vcomiss xmm7, xmm4
0xdac186: jbe 0x140dac18e
0xdac188: vsubss xmm5, xmm4, xmm7
0xdac18c: jmp 0x140dac198
0xdac18e: vcomiss xmm4, xmm3
0xdac192: jbe 0x140dac198
0xdac194: vsubss xmm5, xmm4, xmm3
0xdac198: vmovss xmm0, dword ptr [rip + 0x5f00428]  ; [0x6cac5c8] = runtime global (no file value)
0xdac1a0: vmovss xmm14, dword ptr [rip + 0x4fc6f0c]  ; [0x5d730b4] = 1 (0x3f800000)
0xdac1a8: vsubss xmm3, xmm0, xmm14
0xdac1ad: vmulss xmm1, xmm3, xmm8
0xdac1b2: vaddss xmm2, xmm1, xmm2
0xdac1b6: vmovss dword ptr [r14 + 0xa90], xmm2
0xdac1bf: vmulss xmm0, xmm5, xmm3
0xdac1c3: vaddss xmm1, xmm0, xmm4
0xdac1c7: vmovss dword ptr [r14 + 0xa94], xmm1
0xdac1d0: vmovss xmm3, dword ptr [r14 + 0xa58]
0xdac1d9: vmulss xmm0, xmm8, dword ptr [rip + 0x5f003e7]  ; [0x6cac5c8] = runtime global (no file value)
0xdac1e1: vaddss xmm1, xmm0, xmm3
0xdac1e5: vmovss dword ptr [rsp + 0x290], xmm1
0xdac1ee: vmovss xmm4, dword ptr [r14 + 0xa5c]
0xdac1f7: vmulss xmm0, xmm5, dword ptr [rip + 0x5f003c9]  ; [0x6cac5c8] = runtime global (no file value)
0xdac1ff: vaddss xmm1, xmm0, xmm4
0xdac203: vmovss dword ptr [rsp + 0x294], xmm1
0xdac20c: mov rax, qword ptr [rsp + 0x290]
0xdac214: mov qword ptr [rsp + 0x290], rax
0xdac21c: vucomiss xmm3, dword ptr [rsp + 0x290]
0xdac225: jp 0x140dac236
0xdac227: jne 0x140dac236
0xdac229: vucomiss xmm4, dword ptr [rsp + 0x294]
0xdac232: jp 0x140dac236
0xdac234: je 0x140dac241
0xdac236: mov byte ptr [r14 + 0xaf5], 1
0xdac23e: mov qword ptr [rbx], rax
0xdac241: mov rax, qword ptr [rcx]
0xdac244: mov qword ptr [rsp + 0x2a0], rax
0xdac24c: vmovss xmm7, dword ptr [rsp + 0x2a4]
0xdac255: vmovss xmm6, dword ptr [rsp + 0x2a0]
0xdac25e: jmp 0x140dac0ca
0xdac263: vmovss xmm0, dword ptr [rsp + 0x290]
0xdac26c: vcomiss xmm0, xmm8
0xdac271: jbe 0x140dac287
0xdac273: vsubss xmm12, xmm8, xmm0
0xdac277: lea rbx, [r14 + 0xa00]
0xdac27e: vmovss dword ptr [rsp + 0x2a0], xmm12
0xdac287: vcomiss xmm9, xmm7
0xdac28b: jbe 0x140dac293
0xdac28d: vsubss xmm15, xmm9, xmm7
0xdac291: jmp 0x140dac2a7
0xdac293: vmovss xmm0, dword ptr [rsp + 0x294]
0xdac29c: vcomiss xmm0, xmm10
0xdac2a1: jbe 0x140dac2a7
0xdac2a3: vsubss xmm15, xmm10, xmm0
0xdac2a7: vmovss xmm1, dword ptr [r14 + 0xa58]
0xdac2b0: vaddss xmm0, xmm1, xmm12
0xdac2b5: vmovss dword ptr [rsp + 0x290], xmm0
0xdac2be: vmovss xmm2, dword ptr [r14 + 0xa5c]
0xdac2c7: vaddss xmm0, xmm15, xmm2
0xdac2cb: vmovss dword ptr [rsp + 0x294], xmm0
0xdac2d4: mov rax, qword ptr [rsp + 0x290]
0xdac2dc: mov qword ptr [rsp + 0x290], rax
0xdac2e4: vucomiss xmm1, dword ptr [rsp + 0x290]
0xdac2ed: jp 0x140dac2fe
0xdac2ef: jne 0x140dac2fe
0xdac2f1: vucomiss xmm2, dword ptr [rsp + 0x294]
0xdac2fa: jp 0x140dac2fe
0xdac2fc: je 0x140dac30d
0xdac2fe: mov byte ptr [r14 + 0xaf5], 1
0xdac306: mov qword ptr [r14 + 0xa58], rax
0xdac30d: mov rcx, rbx
0xdac310: call 0x1404a2010
0xdac315: vmovss xmm7, dword ptr [rax + 0x24]
0xdac31a: mov rcx, rbx
0xdac31d: call 0x1404a2010
0xdac322: vmovss xmm8, dword ptr [rax + 0x28]
0xdac327: mov rcx, rbx
0xdac32a: call 0x1404a2010
0xdac32f: vmovss xmm6, dword ptr [rax + 0x2c]
0xdac334: mov rax, qword ptr [r14 + 0x590]
0xdac33b: mov rcx, qword ptr [rax + 8]
0xdac33f: lea rdx, [rsp + 0x290]
0xdac347: mov rcx, qword ptr [rcx + 0x18]
0xdac34b: call 0x1435b4b90
0xdac350: vmovss xmm3, dword ptr [r14 + 0xa98]
0xdac359: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdac362: vmulss xmm1, xmm0, dword ptr [rax]
0xdac366: vdivss xmm2, xmm6, xmm1
0xdac36a: vmovss dword ptr [r14 + 0xa98], xmm2
0xdac373: vsubss xmm4, xmm3, xmm2
0xdac377: vmovss xmm0, dword ptr [rip + 0x4fc686d]  ; [0x5d72bec] = 1.19209e-07 (0x34000000)
0xdac37f: vcomiss xmm0, xmm4
0xdac383: jb 0x140dac393
0xdac385: vcomiss xmm4, dword ptr [rip + 0x4fc74f3]  ; [0x5d73880] = -1.19209e-07 (0xb4000000)
0xdac38d: jb 0x140dac393
0xdac38f: mov al, 1
0xdac391: jmp 0x140dac395
0xdac393: xor al, al
0xdac395: mov byte ptr [r14 + 0xaf5], al
0xdac39c: vmovss xmm9, dword ptr [rip + 0x4fc6b90]  ; [0x5d72f34] = 0.5 (0x3f000000)
0xdac3a4: vmulss xmm1, xmm6, xmm9
0xdac3a9: vaddss xmm0, xmm1, xmm7
0xdac3ad: vmovss dword ptr [rsp + 0x58], xmm0
0xdac3b3: vsubss xmm1, xmm8, xmm1
0xdac3b7: vmovss dword ptr [rsp + 0x5c], xmm1
0xdac3bd: vmovss xmm0, dword ptr [r14 + 0xaa0]
0xdac3c6: vsubss xmm3, xmm0, dword ptr [rip + 0x5eff61a]  ; [0x6cab9e8] = runtime global (no file value)
0xdac3ce: vmovss xmm0, dword ptr [rip + 0x5eff6b2]  ; [0x6caba88] = runtime global (no file value)
0xdac3d6: vsubss xmm1, xmm0, dword ptr [rip + 0x5eff60a]  ; [0x6cab9e8] = runtime global (no file value)
0xdac3de: vdivss xmm2, xmm3, xmm1
0xdac3e2: vsubss xmm8, xmm14, xmm2
0xdac3e6: vmovss dword ptr [rsp + 0xa8], xmm8
0xdac3ef: mov rcx, r14
0xdac3f2: call 0x140d96760
0xdac3f7: vmovaps xmm10, xmm0
0xdac3fb: vmovss dword ptr [rsp + 0xb0], xmm0
0xdac404: lea r12, [rip + 0x5ee0d75]  ; [0x6c8d180] = runtime global (no file value)
0xdac40b: cmp byte ptr [rip + 0x5fba8c6], 0  ; [0x6d66cd8] = runtime global (no file value)
0xdac412: je 0x140dacb64
0xdac418: mov rcx, r14
0xdac41b: call 0x140d96fd0
0xdac420: vmovss dword ptr [rsp + 0x50], xmm0
0xdac426: lea rbx, [r14 + 0x7b0]
0xdac42d: mov rax, qword ptr [rbx]
0xdac430: mov rcx, qword ptr [rax + 0x18]
0xdac434: mov rax, qword ptr [rcx]
0xdac437: mov rdx, qword ptr [rax + 0x20]
0xdac43b: mov rax, qword ptr [rdx + 0x20]
0xdac43f: vmovss dword ptr [rax + 0x68], xmm0
0xdac444: call 0x140d438d0
0xdac449: mov rax, qword ptr [rbx]
0xdac44c: mov rcx, qword ptr [rax + 0x18]
0xdac450: mov rdx, qword ptr [rcx]
0xdac453: mov rax, qword ptr [rdx + 0xa0]
0xdac45a: test rax, rax
0xdac45d: je 0x140dac466
0xdac45f: cmp qword ptr [rax + 8], 0
0xdac464: jne 0x140dac478
0xdac466: mov rax, qword ptr [rdx + 0x20]
0xdac46a: mov rdx, qword ptr [rax + 0x20]
0xdac46e: vmovss dword ptr [rdx + 0x38], xmm10
0xdac473: call 0x140d438d0
0xdac478: lea rdi, [r14 + 0xa18]
0xdac47f: vmovups ymm0, ymmword ptr [rip + 0x5cb8e99]  ; [0x6a65320] = 1 (0x3f800000)
0xdac487: vmovups ymmword ptr [rdi], ymm0
0xdac48b: vmovups ymm1, ymmword ptr [rip + 0x5cb8ead]  ; [0x6a65340] = 0 (0x00000000)
0xdac493: vmovups ymmword ptr [rdi + 0x20], ymm1
0xdac498: vmovups ymm0, ymmword ptr [rip + 0x5cb8e80]  ; [0x6a65320] = 1 (0x3f800000)
0xdac4a0: vmovups ymmword ptr [rsp + 0x70], ymm0
0xdac4a6: vmovups ymmword ptr [rsp + 0x130], ymm0
0xdac4af: vmovups ymm1, ymmword ptr [rip + 0x5cb8e89]  ; [0x6a65340] = 0 (0x00000000)
0xdac4b7: vmovups ymmword ptr [rsp + 0xd0], ymm1
0xdac4c0: vmovups ymmword ptr [rsp + 0x150], ymm1
0xdac4c9: mov rax, qword ptr [rbx]
0xdac4cc: mov rcx, qword ptr [rax + 0x20]
0xdac4d0: mov byte ptr [rsp + 0x290], 0x49
0xdac4d8: lea r8, [rsp + 0x290]
0xdac4e0: lea rdx, [rsp + 0x40]
0xdac4e5: vzeroupper 
0xdac4e8: call 0x1435c8ef0
0xdac4ed: lea rcx, [rsp + 0x40]
0xdac4f2: call 0x140615320
0xdac4f7: test rax, rax
0xdac4fa: je 0x140dac63e
0xdac500: lea rcx, [rsp + 0x40]
0xdac505: call 0x140615320
0xdac50a: movzx ecx, byte ptr [rax + 0xc]
0xdac50e: mov rcx, qword ptr [r12 + rcx*8]
0xdac512: mov rdx, rax
0xdac515: mov rcx, qword ptr [rcx + 0x18]
0xdac519: call 0x143598390
0xdac51e: test al, al
0xdac520: jne 0x140dac63e
0xdac526: lea rcx, [rsp + 0x40]
0xdac52b: call 0x140615320
0xdac530: movzx ebx, byte ptr [rax + 0xd]
0xdac534: lea rcx, [rsp + 0x40]
0xdac539: call 0x140615320
0xdac53e: cmp byte ptr [rax + 0xe], 0
0xdac542: je 0x140dac547
0xdac544: mov rax, qword ptr [rax]
0xdac547: vmovss xmm0, dword ptr [rax]
0xdac54b: vmovss dword ptr [rsp + 0x290], xmm0
0xdac554: mov byte ptr [rsp + 0x294], bl
0xdac55b: mov rax, qword ptr [rsp + 0x290]
0xdac563: mov qword ptr [rsp + 0x70], rax
0xdac568: vmovss xmm0, dword ptr [rsp + 0x70]
0xdac56e: vmulss xmm2, xmm0, dword ptr [rip + 0x4fc7362]  ; [0x5d738d8] = -0.0174533 (0xbc8efa35)
0xdac576: lea rdx, [rsp + 0x290]
0xdac57e: lea rcx, [rsp + 0x2a8]
0xdac586: call 0x141372520
0xdac58b: vmovdqu xmm0, xmmword ptr [rip + 0x4fc8d0d]  ; [0x5d752a0] = 1 (0x3f800000)
0xdac593: vmovups xmmword ptr [rsp + 0x130], xmm0
0xdac59c: vmovss dword ptr [rsp + 0x140], xmm13
0xdac5a5: vmovss xmm1, dword ptr [rsp + 0x290]
0xdac5ae: vmovss dword ptr [rsp + 0x144], xmm1
0xdac5b7: vmovss xmm0, dword ptr [rsp + 0x2a8]
0xdac5c0: vmovss dword ptr [rsp + 0x148], xmm0
0xdac5c9: vmovss dword ptr [rsp + 0x14c], xmm13
0xdac5d2: vmovss dword ptr [rsp + 0x150], xmm13
0xdac5db: vxorps xmm0, xmm0, xmmword ptr [rip + 0x4fc976d]  ; [0x5d75d50] = -0 (0x80000000)
0xdac5e3: vmovss dword ptr [rsp + 0x154], xmm0
0xdac5ec: vmovss dword ptr [rsp + 0x158], xmm1
0xdac5f5: vmovss dword ptr [rsp + 0x15c], xmm13
0xdac5fe: vmovdqu xmm0, xmmword ptr [rip + 0x4fc93da]  ; [0x5d759e0] = 0 (0x00000000)
0xdac606: vmovups xmmword ptr [rsp + 0x160], xmm0
0xdac60f: lea rbx, [r14 + 0x7b0]
0xdac616: lea rdi, [r14 + 0xa18]
0xdac61d: vmovups ymm1, ymmword ptr [rsp + 0x150]
0xdac626: vmovups ymmword ptr [rsp + 0xd0], ymm1
0xdac62f: vmovups ymm0, ymmword ptr [rsp + 0x130]
0xdac638: vmovups ymmword ptr [rsp + 0x70], ymm0
0xdac63e: mov rax, qword ptr [rbx]
0xdac641: mov rcx, qword ptr [rax + 0x20]
0xdac645: mov byte ptr [rsp + 0x290], 0x51
0xdac64d: lea r8, [rsp + 0x290]
0xdac655: lea rdx, [rsp + 0xb8]
0xdac65d: vzeroupper 
0xdac660: call 0x1435c8ef0
0xdac665: lea rcx, [rsp + 0xb8]
0xdac66d: call 0x140615320
0xdac672: cmp byte ptr [rax + 0xe], 0
0xdac676: je 0x140dac67b
0xdac678: mov rax, qword ptr [rax]
0xdac67b: mov rax, qword ptr [rax]
0xdac67e: mov qword ptr [rsp + 0x2a8], rax
0xdac686: mov rax, qword ptr [rbx]
0xdac689: mov rcx, qword ptr [rax + 0x18]
0xdac68d: mov rdx, qword ptr [rcx]
0xdac690: mov rax, qword ptr [rdx + 0x70]
0xdac694: mov qword ptr [rsp + 0xa0], rax
0xdac69c: mov rax, qword ptr [rdx + 0x78]
0xdac6a0: mov qword ptr [rsp + 0x290], rax
0xdac6a8: mov qword ptr [rdi], 0x3f800000
0xdac6af: mov qword ptr [rdi + 8], r15
0xdac6b3: mov dword ptr [rdi + 0x10], r15d
0xdac6b7: mov qword ptr [rdi + 0x14], 0x3f800000
0xdac6bf: mov qword ptr [rdi + 0x1c], r15
0xdac6c3: mov dword ptr [rdi + 0x24], r15d
0xdac6c7: mov qword ptr [rdi + 0x28], 0x3f800000
0xdac6cf: vmovss xmm14, dword ptr [rsp + 0x290]
0xdac6d8: vmulss xmm0, xmm14, dword ptr [rip + 0x4fc72a8]  ; [0x5d73988] = -1 (0xbf800000)
0xdac6e0: vmulss xmm1, xmm0, dword ptr [rsp + 0x2a8]
0xdac6e9: vsubss xmm0, xmm1, dword ptr [rsp + 0xa0]
0xdac6f2: vmovss dword ptr [rdi + 0x30], xmm0
0xdac6f7: vmovss xmm13, dword ptr [rsp + 0x294]
0xdac700: vmulss xmm1, xmm13, dword ptr [rip + 0x4fc7280]  ; [0x5d73988] = -1 (0xbf800000)
0xdac708: vmulss xmm0, xmm1, dword ptr [rsp + 0x2ac]
0xdac711: vsubss xmm0, xmm0, dword ptr [rsp + 0xa4]
0xdac71a: vmovss dword ptr [rdi + 0x34], xmm0
0xdac71f: mov dword ptr [rdi + 0x38], r15d
0xdac723: mov dword ptr [rdi + 0x3c], 0x3f800000
0xdac72a: vmovups ymm3, ymmword ptr [rdi]
0xdac72e: vmovups ymm8, ymmword ptr [rdi + 0x20]
0xdac733: vmovups ymm0, ymmword ptr [rsp + 0x70]
0xdac739: vperm2f128 ymm4, ymm0, ymm0, 0
0xdac73f: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdac745: vmovups ymm0, ymmword ptr [rsp + 0xd0]
0xdac74e: vperm2f128 ymm6, ymm0, ymm0, 0
0xdac754: vperm2f128 ymm7, ymm0, ymm0, 0x11
0xdac75a: vshufps ymm0, ymm3, ymm3, 0
0xdac75f: vmulps ymm2, ymm0, ymm4
0xdac763: vshufps ymm1, ymm3, ymm3, 0x55
0xdac768: vfmadd231ps ymm2, ymm1, ymm5
0xdac76d: vshufps ymm0, ymm3, ymm3, 0xaa
0xdac772: vfmadd231ps ymm2, ymm0, ymm6
0xdac777: vshufps ymm1, ymm3, ymm3, 0xff
0xdac77c: vfmadd231ps ymm2, ymm1, ymm7
0xdac781: vmovups ymmword ptr [rdi], ymm2
0xdac785: vshufps ymm0, ymm8, ymm8, 0
0xdac78b: vmulps ymm3, ymm0, ymm4
0xdac78f: vshufps ymm1, ymm8, ymm8, 0x55
0xdac795: vfmadd231ps ymm3, ymm1, ymm5
0xdac79a: vshufps ymm0, ymm8, ymm8, 0xaa
0xdac7a0: vfmadd231ps ymm3, ymm0, ymm6
0xdac7a5: vshufps ymm1, ymm8, ymm8, 0xff
0xdac7ab: vfmadd231ps ymm3, ymm1, ymm7
0xdac7b0: vmovups ymmword ptr [rdi + 0x20], ymm3
0xdac7b5: vmulss xmm0, xmm14, dword ptr [rsp + 0x2a8]
0xdac7be: vaddss xmm1, xmm0, dword ptr [rsp + 0xa0]
0xdac7c7: vaddss xmm2, xmm1, dword ptr [r14 + 0xa48]
0xdac7d0: vmovss dword ptr [r14 + 0xa48], xmm2
0xdac7d9: vmulss xmm0, xmm13, dword ptr [rsp + 0x2ac]
0xdac7e2: vaddss xmm1, xmm0, dword ptr [rsp + 0xa4]
0xdac7eb: vaddss xmm2, xmm1, dword ptr [r14 + 0xa4c]
0xdac7f4: vmovss dword ptr [r14 + 0xa4c], xmm2
0xdac7fd: vxorps xmm13, xmm13, xmm13
0xdac802: vaddss xmm0, xmm13, dword ptr [r14 + 0xa50]
0xdac80b: vmovss dword ptr [r14 + 0xa50], xmm0
0xdac814: mov rbx, qword ptr [rbx]
0xdac817: mov rax, qword ptr [rbx + 0xa0]
0xdac81e: test rax, rax
0xdac821: je 0x140dac83b
0xdac823: cmp qword ptr [rax + 8], 0
0xdac828: je 0x140dac83b
0xdac82a: mov rcx, qword ptr [rbx + 0x38]
0xdac82e: vzeroupper 
0xdac831: call 0x143ed8480
0xdac836: mov rdx, rax
0xdac839: jmp 0x140dac870
0xdac83b: movzx edx, byte ptr [rbx + 0x94]
0xdac842: cmp dl, 0xff
0xdac845: jne 0x140dac84c
0xdac847: mov rdx, r15
0xdac84a: jmp 0x140dac870
0xdac84c: mov rax, qword ptr [rbx + 0x58]
0xdac850: mov rcx, qword ptr [rax + 0xb0]
0xdac857: mov r8, qword ptr [rcx + 0xb0]
0xdac85e: cmp edx, dword ptr [r8 + 8]
0xdac862: jb 0x140dac869
0xdac864: mov rdx, r15
0xdac867: jmp 0x140dac870
0xdac869: mov rax, qword ptr [r8]
0xdac86c: mov rdx, qword ptr [rax + rdx*8]
0xdac870: mov rax, rbx
0xdac873: cmp byte ptr [rdx + 0x13b], 0
0xdac87a: jne 0x140dac886
0xdac87c: vmovss xmm0, dword ptr [rdx + 0xd8]
0xdac884: jmp 0x140dac8a7
0xdac886: movzx ecx, byte ptr [rdx + 0x13c]
0xdac88d: test cl, cl
0xdac88f: cmovne rbx, rax
0xdac893: mov eax, 0xe0
0xdac898: mov r8d, 0xdc
0xdac89e: cmove eax, r8d
0xdac8a2: vmovss xmm0, dword ptr [rax + rdx]
0xdac8a7: vmulss xmm1, xmm0, dword ptr [rdx + 0xd4]
0xdac8af: vmulss xmm6, xmm1, dword ptr [rsp + 0x50]
0xdac8b5: mov rdi, qword ptr [r14 + 0x7b8]
0xdac8bc: mov rax, qword ptr [rbx + 0xa0]
0xdac8c3: test rax, rax
0xdac8c6: je 0x140dac8e2
0xdac8c8: cmp qword ptr [rax + 8], 0
0xdac8cd: je 0x140dac8e2
0xdac8cf: lea rdx, [rsp + 0x40]
0xdac8d4: mov rcx, qword ptr [rbx + 0x38]
0xdac8d8: vzeroupper 
0xdac8db: call 0x140d87d60
0xdac8e0: jmp 0x140dac8eb
0xdac8e2: mov rax, qword ptr [rbx + 0x68]
0xdac8e6: mov qword ptr [rsp + 0x40], rax
0xdac8eb: xor eax, eax
0xdac8ed: mov dword ptr [rsp + 0x4c], eax
0xdac8f1: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdac8f7: vinsertps xmm0, xmm0, xmm6, 0x20
0xdac8fd: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdac903: vmovups xmmword ptr [rdi + 0x120], xmm0
0xdac90b: mov rbx, qword ptr [r14 + 0x7c0]
0xdac912: mov rax, qword ptr [r14 + 0x7b0]
0xdac919: mov rcx, qword ptr [rax + 0xa0]
0xdac920: test rcx, rcx
0xdac923: je 0x140dac93f
0xdac925: cmp qword ptr [rcx + 8], 0
0xdac92a: je 0x140dac93f
0xdac92c: lea rdx, [rsp + 0x40]
0xdac931: mov rcx, qword ptr [rax + 0x38]
0xdac935: vzeroupper 
0xdac938: call 0x140d87d60
0xdac93d: jmp 0x140dac948
0xdac93f: mov rax, qword ptr [rax + 0x68]
0xdac943: mov qword ptr [rsp + 0x40], rax
0xdac948: xor eax, eax
0xdac94a: mov dword ptr [rsp + 0x4c], eax
0xdac94e: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdac954: vinsertps xmm0, xmm0, xmm6, 0x20
0xdac95a: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdac960: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdac968: mov rbx, qword ptr [r14 + 0x7d8]
0xdac96f: mov rax, qword ptr [r14 + 0x7b0]
0xdac976: mov rcx, qword ptr [rax + 0xa0]
0xdac97d: test rcx, rcx
0xdac980: je 0x140dac99c
0xdac982: cmp qword ptr [rcx + 8], 0
0xdac987: je 0x140dac99c
0xdac989: lea rdx, [rsp + 0x40]
0xdac98e: mov rcx, qword ptr [rax + 0x38]
0xdac992: vzeroupper 
0xdac995: call 0x140d87d60
0xdac99a: jmp 0x140dac9a5
0xdac99c: mov rax, qword ptr [rax + 0x68]
0xdac9a0: mov qword ptr [rsp + 0x40], rax
0xdac9a5: xor eax, eax
0xdac9a7: mov dword ptr [rsp + 0x4c], eax
0xdac9ab: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdac9b1: vinsertps xmm0, xmm0, xmm6, 0x20
0xdac9b7: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdac9bd: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdac9c5: mov rbx, qword ptr [r14 + 0x820]
0xdac9cc: mov rax, qword ptr [r14 + 0x7b0]
0xdac9d3: mov rcx, qword ptr [rax + 0xa0]
0xdac9da: test rcx, rcx
0xdac9dd: je 0x140dac9f9
0xdac9df: cmp qword ptr [rcx + 8], 0
0xdac9e4: je 0x140dac9f9
0xdac9e6: lea rdx, [rsp + 0x40]
0xdac9eb: mov rcx, qword ptr [rax + 0x38]
0xdac9ef: vzeroupper 
0xdac9f2: call 0x140d87d60
0xdac9f7: jmp 0x140daca02
0xdac9f9: mov rax, qword ptr [rax + 0x68]
0xdac9fd: mov qword ptr [rsp + 0x40], rax
0xdaca02: xor eax, eax
0xdaca04: mov dword ptr [rsp + 0x4c], eax
0xdaca08: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdaca0e: vinsertps xmm0, xmm0, xmm6, 0x20
0xdaca14: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdaca1a: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdaca22: mov rbx, qword ptr [r14 + 0x870]
0xdaca29: mov rax, qword ptr [r14 + 0x7b0]
0xdaca30: mov rcx, qword ptr [rax + 0xa0]
0xdaca37: test rcx, rcx
0xdaca3a: je 0x140daca56
0xdaca3c: cmp qword ptr [rcx + 8], 0
0xdaca41: je 0x140daca56
0xdaca43: lea rdx, [rsp + 0x40]
0xdaca48: mov rcx, qword ptr [rax + 0x38]
0xdaca4c: vzeroupper 
0xdaca4f: call 0x140d87d60
0xdaca54: jmp 0x140daca5f
0xdaca56: mov rax, qword ptr [rax + 0x68]
0xdaca5a: mov qword ptr [rsp + 0x40], rax
0xdaca5f: xor eax, eax
0xdaca61: mov dword ptr [rsp + 0x4c], eax
0xdaca65: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdaca6b: vinsertps xmm0, xmm0, xmm6, 0x20
0xdaca71: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdaca77: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdaca7f: mov rbx, qword ptr [r14 + 0x8c0]
0xdaca86: mov rax, qword ptr [r14 + 0x7b0]
0xdaca8d: mov rcx, qword ptr [rax + 0xa0]
0xdaca94: test rcx, rcx
0xdaca97: je 0x140dacab3
0xdaca99: cmp qword ptr [rcx + 8], 0
0xdaca9e: je 0x140dacab3
0xdacaa0: lea rdx, [rsp + 0x40]
0xdacaa5: mov rcx, qword ptr [rax + 0x38]
0xdacaa9: vzeroupper 
0xdacaac: call 0x140d87d60
0xdacab1: jmp 0x140dacabc
0xdacab3: mov rax, qword ptr [rax + 0x68]
0xdacab7: mov qword ptr [rsp + 0x40], rax
0xdacabc: xor eax, eax
0xdacabe: mov dword ptr [rsp + 0x4c], eax
0xdacac2: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdacac8: vinsertps xmm0, xmm0, xmm6, 0x20
0xdacace: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdacad4: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdacadc: mov rbx, qword ptr [r14 + 0x910]
0xdacae3: mov rax, qword ptr [r14 + 0x7b0]
0xdacaea: mov rcx, qword ptr [rax + 0xa0]
0xdacaf1: test rcx, rcx
0xdacaf4: je 0x140dacb10
0xdacaf6: cmp qword ptr [rcx + 8], 0
0xdacafb: je 0x140dacb10
0xdacafd: lea rdx, [rsp + 0x40]
0xdacb02: mov rcx, qword ptr [rax + 0x38]
0xdacb06: vzeroupper 
0xdacb09: call 0x140d87d60
0xdacb0e: jmp 0x140dacb19
0xdacb10: mov rax, qword ptr [rax + 0x68]
0xdacb14: mov qword ptr [rsp + 0x40], rax
0xdacb19: xor eax, eax
0xdacb1b: mov dword ptr [rsp + 0x4c], eax
0xdacb1f: vmovups xmm0, xmmword ptr [rsp + 0x40]
0xdacb25: vinsertps xmm0, xmm0, xmm6, 0x20
0xdacb2b: vmovups xmmword ptr [rsp + 0x40], xmm0
0xdacb31: vmovups xmmword ptr [rbx + 0x120], xmm0
0xdacb39: vmovss xmm12, dword ptr [rsp + 0x2a0]
0xdacb42: vmovss xmm9, dword ptr [rip + 0x4fc63ea]  ; [0x5d72f34] = 0.5 (0x3f000000)
0xdacb4a: vmovss xmm8, dword ptr [rsp + 0xa8]
0xdacb53: vmovss xmm10, dword ptr [rsp + 0xb0]
0xdacb5c: vmovss xmm14, dword ptr [rip + 0x4fc6550]  ; [0x5d730b4] = 1 (0x3f800000)
0xdacb64: cmp byte ptr [r14 + 0xad4], 0
0xdacb6c: je 0x140dacc65
0xdacb72: test sil, sil
0xdacb75: jne 0x140dacb9b
0xdacb77: vaddss xmm0, xmm12, dword ptr [r14 + 0xa90]
0xdacb80: vmovss dword ptr [r14 + 0xa90], xmm0
0xdacb89: vaddss xmm1, xmm15, dword ptr [r14 + 0xa94]
0xdacb92: vmovss dword ptr [r14 + 0xa94], xmm1
0xdacb9b: mov rbx, qword ptr [r14 + 0x678]
0xdacba2: lea rdx, [rsp + 0x290]
0xdacbaa: mov rcx, qword ptr [rbx + 0x18]
0xdacbae: vzeroupper 
0xdacbb1: call 0x1435b4b90
0xdacbb6: vmovss dword ptr [rsp + 0x38], xmm10
0xdacbbc: mov byte ptr [rsp + 0x30], 0
0xdacbc1: mov byte ptr [rsp + 0x28], 0
0xdacbc6: vmovss dword ptr [rsp + 0x20], xmm14
0xdacbcc: mov r9, qword ptr [rax]
0xdacbcf: mov r8, qword ptr [r14 + 0xa90]
0xdacbd6: mov rdx, rbx
0xdacbd9: mov rcx, r14
0xdacbdc: call 0x140d91660
0xdacbe1: vmovss xmm0, dword ptr [r14 + 0xa90]
0xdacbea: vsubss xmm1, xmm0, dword ptr [r14 + 0xa58]
0xdacbf3: vmovss dword ptr [r14 + 0xa88], xmm1
0xdacbfc: vmovss xmm0, dword ptr [r14 + 0xa5c]
0xdacc05: vsubss xmm4, xmm0, dword ptr [r14 + 0xa94]
0xdacc0e: vmovss dword ptr [r14 + 0xa8c], xmm4
0xdacc17: vdivss xmm3, xmm14, dword ptr [r14 + 0xa98]
0xdacc20: vmulss xmm2, xmm3, xmm1
0xdacc24: vmulss xmm1, xmm9, dword ptr [r14 + 0xa68]
0xdacc2d: vaddss xmm2, xmm2, xmm1
0xdacc31: vmovss dword ptr [rsp + 0x290], xmm2
0xdacc3a: vmulss xmm3, xmm3, xmm4
0xdacc3e: vmulss xmm1, xmm9, dword ptr [r14 + 0xa6c]
0xdacc47: vaddss xmm2, xmm3, xmm1
0xdacc4b: vmovss dword ptr [rsp + 0x294], xmm2
0xdacc54: mov rax, qword ptr [rsp + 0x290]
0xdacc5c: mov qword ptr [r14 + 0xa88], rax
0xdacc63: jmp 0x140daccb4
0xdacc65: cmp byte ptr [rip + 0x5eff6dc], 0  ; [0x6cac348] = runtime global (no file value)
0xdacc6c: je 0x140daccb4
0xdacc6e: mov rbx, qword ptr [r14 + 0x678]
0xdacc75: lea rdx, [rsp + 0x290]
0xdacc7d: mov rcx, qword ptr [rbx + 0x18]
0xdacc81: vzeroupper 
0xdacc84: call 0x1435b4b90
0xdacc89: vmovss dword ptr [rsp + 0x38], xmm10
0xdacc8f: mov byte ptr [rsp + 0x30], 0
0xdacc94: mov byte ptr [rsp + 0x28], 0
0xdacc99: vmovss dword ptr [rsp + 0x20], xmm14
0xdacc9f: mov r9, qword ptr [rax]
0xdacca2: mov r8, qword ptr [r14 + 0xa90]
0xdacca9: mov rdx, rbx
0xdaccac: mov rcx, r14
0xdaccaf: call 0x140d91660
0xdaccb4: mov r12, qword ptr [r14 + 0x378]
0xdaccbb: mov eax, dword ptr [r14 + 0x380]
0xdaccc2: lea r13, [r12 + rax*8]
0xdaccc6: cmp r12, r13
0xdaccc9: je 0x140dace45
0xdacccf: mov rbx, qword ptr [rsp + 0x58]
0xdaccd4: nop dword ptr [rax]
0xdaccd8: nop dword ptr [rax + rax]
0xdacce0: mov r15, qword ptr [r12]
0xdacce4: lea rcx, [r15 + 0xde]
0xdacceb: vzeroupper 
0xdaccee: call 0x140537250
0xdaccf3: movzx edi, byte ptr [rax + 0xb1]
0xdaccfa: mov rsi, qword ptr [r15 + 8]
0xdaccfe: lea rdx, [rsp + 0x290]
0xdacd06: mov rcx, qword ptr [rsi + 0x18]
0xdacd0a: call 0x1435b4b90
0xdacd0f: vmovss dword ptr [rsp + 0x38], xmm10
0xdacd15: mov byte ptr [rsp + 0x30], dil
0xdacd1a: mov byte ptr [rsp + 0x28], 0
0xdacd1f: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdacd28: vmovss dword ptr [rsp + 0x20], xmm0
0xdacd2e: mov r9, qword ptr [rax]
0xdacd31: mov r8, rbx
0xdacd34: mov rdx, rsi
0xdacd37: mov rcx, r14
0xdacd3a: call 0x140d91660
0xdacd3f: movzx r11d, al
0xdacd43: mov r8, qword ptr [r15 + 8]
0xdacd47: test al, al
0xdacd49: jne 0x140dacdae
0xdacd4b: test r8, r8
0xdacd4e: je 0x140dacdfa
0xdacd54: mov r10, qword ptr [r8 + 0x20]
0xdacd58: mov rcx, qword ptr [r10]
0xdacd5b: mov rdx, qword ptr [rcx + 0xa0]
0xdacd62: test rdx, rdx
0xdacd65: je 0x140dacd6e
0xdacd67: cmp qword ptr [rdx + 8], 0
0xdacd6c: jne 0x140dacd9a
0xdacd6e: mov r10, qword ptr [r10 + 8]
0xdacd72: xor edx, edx
0xdacd74: mov r9d, dword ptr [r10 + 8]
0xdacd78: test r9d, r9d
0xdacd7b: je 0x140dacd9a
0xdacd7d: mov r10, qword ptr [r10]
0xdacd80: mov eax, dword ptr [rip + 0x5f236de]  ; [0x6cd0464] = runtime global (no file value)
0xdacd86: cmp eax, dword ptr [r10 + rdx*4]
0xdacd8a: je 0x140dacd95
0xdacd8c: inc edx
0xdacd8e: cmp edx, r9d
0xdacd91: jb 0x140dacd86
0xdacd93: jmp 0x140dacd9a
0xdacd95: cmp edx, -1
0xdacd98: jne 0x140dacdf2
0xdacd9a: cmp byte ptr [r14 + 0xace], 1
0xdacda2: je 0x140dacdf2
0xdacda4: or byte ptr [r8 + 0xb4], 8
0xdacdac: jmp 0x140dacdfa
0xdacdae: test r8, r8
0xdacdb1: je 0x140dacdfa
0xdacdb3: mov r10, qword ptr [r8 + 0x20]
0xdacdb7: mov rax, qword ptr [r10]
0xdacdba: mov rcx, qword ptr [rax + 0xa0]
0xdacdc1: test rcx, rcx
0xdacdc4: je 0x140dacdcd
0xdacdc6: cmp qword ptr [rcx + 8], 0
0xdacdcb: jne 0x140dacdf2
0xdacdcd: mov r10, qword ptr [r10 + 8]
0xdacdd1: xor edx, edx
0xdacdd3: mov r9d, dword ptr [r10 + 8]
0xdacdd7: test r9d, r9d
0xdacdda: je 0x140dacdf2
0xdacddc: mov r10, qword ptr [r10]
0xdacddf: mov eax, dword ptr [rip + 0x5f2367f]  ; [0x6cd0464] = runtime global (no file value)
0xdacde5: cmp eax, dword ptr [r10 + rdx*4]
0xdacde9: je 0x140dacdf2
0xdacdeb: inc edx
0xdacded: cmp edx, r9d
0xdacdf0: jb 0x140dacde5
0xdacdf2: and byte ptr [r8 + 0xb4], 0xf7
0xdacdfa: vmovups xmm0, xmmword ptr [r15 + 0x1f8]
0xdace03: vmovups xmmword ptr [rsp + 0xd0], xmm0
0xdace0c: mov eax, dword ptr [r15 + 0x208]
0xdace13: mov dword ptr [rsp + 0xe0], eax
0xdace1a: mov byte ptr [rsp + 0x20], r11b
0xdace1f: vmovaps xmm3, xmm8
0xdace24: lea r8, [rsp + 0xd0]
0xdace2c: mov rdx, qword ptr [r15 + 8]
0xdace30: mov rcx, r14
0xdace33: call 0x140dabae0
0xdace38: add r12, 8
0xdace3c: cmp r12, r13
0xdace3f: jne 0x140dacce0
0xdace45: mov r15, qword ptr [r14 + 0x388]
0xdace4c: mov eax, dword ptr [r14 + 0x390]
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
0xdace8f: call 0x140537250
0xdace94: movzx ebx, byte ptr [rax + 0xb1]
0xdace9b: mov rdi, qword ptr [rsi + 8]
0xdace9f: lea rdx, [rsp + 0x2a0]
0xdacea7: mov rcx, qword ptr [rdi + 0x18]
0xdaceab: call 0x1435b4b90
0xdaceb0: vmovss dword ptr [rsp + 0x38], xmm10
0xdaceb6: mov byte ptr [rsp + 0x30], bl
0xdaceba: mov byte ptr [rsp + 0x28], 0
0xdacebf: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdacec8: vmovss dword ptr [rsp + 0x20], xmm0
0xdacece: mov r9, qword ptr [rax]
0xdaced1: mov r8, qword ptr [rsp + 0x290]
0xdaced9: mov rdx, rdi
0xdacedc: mov rcx, r14
0xdacedf: call 0x140d91660
0xdacee4: movzx r11d, al
0xdacee8: mov r8, qword ptr [rsi + 8]
0xdaceec: test al, al
0xdaceee: jne 0x140dacf58
0xdacef0: test r8, r8
0xdacef3: je 0x140dacfa5
0xdacef9: mov r10, qword ptr [r8 + 0x20]
0xdacefd: mov rcx, qword ptr [r10]
0xdacf00: mov rdx, qword ptr [rcx + 0xa0]
0xdacf07: test rdx, rdx
0xdacf0a: je 0x140dacf13
0xdacf0c: cmp qword ptr [rdx + 8], 0
0xdacf11: jne 0x140dacf44
0xdacf13: mov r10, qword ptr [r10 + 8]
0xdacf17: xor edx, edx
0xdacf19: mov r9d, dword ptr [r10 + 8]
0xdacf1d: test r9d, r9d
0xdacf20: je 0x140dacf44
0xdacf22: mov r10, qword ptr [r10]
0xdacf25: mov eax, dword ptr [rip + 0x5f23539]  ; [0x6cd0464] = runtime global (no file value)
0xdacf2b: nop dword ptr [rax + rax]
0xdacf30: cmp eax, dword ptr [r10 + rdx*4]
0xdacf34: je 0x140dacf3f
0xdacf36: inc edx
0xdacf38: cmp edx, r9d
0xdacf3b: jb 0x140dacf30
0xdacf3d: jmp 0x140dacf44
0xdacf3f: cmp edx, -1
0xdacf42: jne 0x140dacf9d
0xdacf44: cmp byte ptr [r14 + 0xace], 1
0xdacf4c: je 0x140dacf9d
0xdacf4e: or byte ptr [r8 + 0xb4], 8
0xdacf56: jmp 0x140dacfa5
0xdacf58: test r8, r8
0xdacf5b: je 0x140dacfa5
0xdacf5d: mov r10, qword ptr [r8 + 0x20]
0xdacf61: mov rax, qword ptr [r10]
0xdacf64: mov rcx, qword ptr [rax + 0xa0]
0xdacf6b: test rcx, rcx
0xdacf6e: je 0x140dacf77
0xdacf70: cmp qword ptr [rcx + 8], 0
0xdacf75: jne 0x140dacf9d
0xdacf77: mov r10, qword ptr [r10 + 8]
0xdacf7b: xor edx, edx
0xdacf7d: mov r9d, dword ptr [r10 + 8]
0xdacf81: test r9d, r9d
0xdacf84: je 0x140dacf9d
0xdacf86: mov r10, qword ptr [r10]
0xdacf89: mov eax, dword ptr [rip + 0x5f234d5]  ; [0x6cd0464] = runtime global (no file value)
0xdacf8f: nop 
0xdacf90: cmp eax, dword ptr [r10 + rdx*4]
0xdacf94: je 0x140dacf9d
0xdacf96: inc edx
0xdacf98: cmp edx, r9d
0xdacf9b: jb 0x140dacf90
0xdacf9d: and byte ptr [r8 + 0xb4], 0xf7
0xdacfa5: vmovups xmm0, xmmword ptr [rsi + 0x1f8]
0xdacfad: vmovups xmmword ptr [rsp + 0xd0], xmm0
0xdacfb6: mov eax, dword ptr [rsi + 0x208]
0xdacfbc: mov dword ptr [rsp + 0xe0], eax
0xdacfc3: mov byte ptr [rsp + 0x20], r11b
0xdacfc8: vmovaps xmm3, xmm8
0xdacfcd: lea r8, [rsp + 0xd0]
0xdacfd5: mov rdx, qword ptr [rsi + 8]
0xdacfd9: mov rcx, r14
0xdacfdc: call 0x140dabae0
0xdacfe1: add r15, 8
0xdacfe5: cmp r15, r12
0xdacfe8: jne 0x140dace60
0xdacfee: mov rdi, qword ptr [r14 + 0x4e8]
0xdacff5: mov eax, dword ptr [r14 + 0x4f0]
0xdacffc: lea rsi, [rdi + rax*8]
0xdad000: cmp rdi, rsi
0xdad003: je 0x140dad25e
0xdad009: lea r15, [rip + 0x5ee0170]  ; [0x6c8d180] = runtime global (no file value)
0xdad010: mov rbx, qword ptr [rdi]
0xdad013: vmovss xmm0, dword ptr [rbx + 0xe0]
0xdad01b: vmovss dword ptr [rsp + 0x58], xmm0
0xdad021: vmovss xmm1, dword ptr [rbx + 0xe8]
0xdad029: vmovss dword ptr [rsp + 0x5c], xmm1
0xdad02f: mov rax, qword ptr [rbx + 8]
0xdad033: mov rcx, qword ptr [rax + 0x20]
0xdad037: mov byte ptr [rsp + 0x290], 6
0xdad03f: lea r8, [rsp + 0x290]
0xdad047: lea rdx, [rsp + 0x40]
0xdad04c: vzeroupper 
0xdad04f: call 0x1435c8ef0
0xdad054: mov rax, qword ptr [rbx + 8]
0xdad058: mov rcx, qword ptr [rax + 0x20]
0xdad05c: mov byte ptr [rsp + 0x2a0], 9
0xdad064: lea r8, [rsp + 0x2a0]
0xdad06c: lea rdx, [rsp + 0xb8]
0xdad074: call 0x1435c8ef0
0xdad079: vmovaps xmm6, xmm13
0xdad07e: vmovaps xmm7, xmm13
0xdad083: lea rcx, [rsp + 0x40]
0xdad088: call 0x140615320
0xdad08d: movzx ecx, byte ptr [rax + 0xc]
0xdad091: mov rcx, qword ptr [r15 + rcx*8]
0xdad095: mov rdx, rax
0xdad098: mov rcx, qword ptr [rcx + 0x18]
0xdad09c: call 0x143598390
0xdad0a1: test al, al
0xdad0a3: jne 0x140dad0bc
0xdad0a5: lea rcx, [rsp + 0x40]
0xdad0aa: call 0x140615320
0xdad0af: cmp byte ptr [rax + 0xe], 0
0xdad0b3: je 0x140dad0b8
0xdad0b5: mov rax, qword ptr [rax]
0xdad0b8: vmovss xmm6, dword ptr [rax]
0xdad0bc: lea rcx, [rsp + 0xb8]
0xdad0c4: call 0x140615320
0xdad0c9: movzx ecx, byte ptr [rax + 0xc]
0xdad0cd: mov rcx, qword ptr [r15 + rcx*8]
0xdad0d1: mov rdx, rax
0xdad0d4: mov rcx, qword ptr [rcx + 0x18]
0xdad0d8: call 0x143598390
0xdad0dd: test al, al
0xdad0df: jne 0x140dad0fb
0xdad0e1: lea rcx, [rsp + 0xb8]
0xdad0e9: call 0x140615320
0xdad0ee: cmp byte ptr [rax + 0xe], 0
0xdad0f2: je 0x140dad0f7
0xdad0f4: mov rax, qword ptr [rax]
0xdad0f7: vmovss xmm7, dword ptr [rax]
0xdad0fb: vmovss dword ptr [rsp + 0x2a8], xmm6
0xdad104: vmovss dword ptr [rsp + 0x2ac], xmm7
0xdad10d: lea rcx, [rbx + 0xde]
0xdad114: call 0x140537250
0xdad119: movzx ecx, byte ptr [rax + 0xb1]
0xdad120: vmovss dword ptr [rsp + 0x38], xmm10
0xdad126: mov byte ptr [rsp + 0x30], cl
0xdad12a: mov byte ptr [rsp + 0x28], 0
0xdad12f: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdad138: vmovss dword ptr [rsp + 0x20], xmm0
0xdad13e: mov r9, qword ptr [rsp + 0x2a8]
0xdad146: mov r8, qword ptr [rsp + 0x58]
0xdad14b: mov rdx, qword ptr [rbx + 8]
0xdad14f: mov rcx, r14
0xdad152: call 0x140d91660
0xdad157: movzx r11d, al
0xdad15b: mov r8, qword ptr [rbx + 8]
0xdad15f: test al, al
0xdad161: jne 0x140dad1c8
0xdad163: test r8, r8
0xdad166: je 0x140dad215
0xdad16c: mov r10, qword ptr [r8 + 0x20]
0xdad170: mov rcx, qword ptr [r10]
0xdad173: mov rdx, qword ptr [rcx + 0xa0]
0xdad17a: test rdx, rdx
0xdad17d: je 0x140dad186
0xdad17f: cmp qword ptr [rdx + 8], 0
0xdad184: jne 0x140dad1b4
0xdad186: mov r10, qword ptr [r10 + 8]
0xdad18a: xor edx, edx
0xdad18c: mov r9d, dword ptr [r10 + 8]
0xdad190: test r9d, r9d
0xdad193: je 0x140dad1b4
0xdad195: mov r10, qword ptr [r10]
0xdad198: mov eax, dword ptr [rip + 0x5f232c6]  ; [0x6cd0464] = runtime global (no file value)
0xdad19e: nop 
0xdad1a0: cmp eax, dword ptr [r10 + rdx*4]
0xdad1a4: je 0x140dad1af
0xdad1a6: inc edx
0xdad1a8: cmp edx, r9d
0xdad1ab: jb 0x140dad1a0
0xdad1ad: jmp 0x140dad1b4
0xdad1af: cmp edx, -1
0xdad1b2: jne 0x140dad20d
0xdad1b4: cmp byte ptr [r14 + 0xace], 1
0xdad1bc: je 0x140dad20d
0xdad1be: or byte ptr [r8 + 0xb4], 8
0xdad1c6: jmp 0x140dad215
0xdad1c8: test r8, r8
0xdad1cb: je 0x140dad215
0xdad1cd: mov r10, qword ptr [r8 + 0x20]
0xdad1d1: mov rax, qword ptr [r10]
0xdad1d4: mov rcx, qword ptr [rax + 0xa0]
0xdad1db: test rcx, rcx
0xdad1de: je 0x140dad1e7
0xdad1e0: cmp qword ptr [rcx + 8], 0
0xdad1e5: jne 0x140dad20d
0xdad1e7: mov r10, qword ptr [r10 + 8]
0xdad1eb: xor edx, edx
0xdad1ed: mov r9d, dword ptr [r10 + 8]
0xdad1f1: test r9d, r9d
0xdad1f4: je 0x140dad20d
0xdad1f6: mov r10, qword ptr [r10]
0xdad1f9: mov eax, dword ptr [rip + 0x5f23265]  ; [0x6cd0464] = runtime global (no file value)
0xdad1ff: nop 
0xdad200: cmp eax, dword ptr [r10 + rdx*4]
0xdad204: je 0x140dad20d
0xdad206: inc edx
0xdad208: cmp edx, r9d
0xdad20b: jb 0x140dad200
0xdad20d: and byte ptr [r8 + 0xb4], 0xf7
0xdad215: vmovups xmm0, xmmword ptr [rbx + 0x1f8]
0xdad21d: vmovups xmmword ptr [rsp + 0xd0], xmm0
0xdad226: mov eax, dword ptr [rbx + 0x208]
0xdad22c: mov dword ptr [rsp + 0xe0], eax
0xdad233: mov byte ptr [rsp + 0x20], r11b
0xdad238: vmovaps xmm3, xmm8
0xdad23d: lea r8, [rsp + 0xd0]
0xdad245: mov rdx, qword ptr [rbx + 8]
0xdad249: mov rcx, r14
0xdad24c: call 0x140dabae0
0xdad251: add rdi, 8
0xdad255: cmp rdi, rsi
0xdad258: jne 0x140dad010
0xdad25e: mov qword ptr [rsp + 0x60], 0
0xdad267: mov rbx, qword ptr [r14 + 0x518]
0xdad26e: test rbx, rbx
0xdad271: je 0x140dad2c5
0xdad273: add rbx, 0x300
0xdad27a: lea rax, [rsp + 0x60]
0xdad27f: cmp rbx, rax
0xdad282: je 0x140dad2c5
0xdad284: mov rax, qword ptr [rbx]
0xdad287: cmp qword ptr [rsp + 0x60], rax
0xdad28c: je 0x140dad2c5
0xdad28e: lea rcx, [rsp + 0x60]
0xdad293: vzeroupper 
0xdad296: call 0x14038ad90
0xdad29b: mov rcx, qword ptr [rbx]
0xdad29e: mov qword ptr [rsp + 0x60], rcx
0xdad2a3: test rcx, rcx
0xdad2a6: je 0x140dad2c5
0xdad2a8: cmp byte ptr [rcx + 0x14], 0
0xdad2ac: je 0x140dad2b4
0xdad2ae: lock inc dword ptr [rcx + 0x10]
0xdad2b2: jmp 0x140dad2bc
0xdad2b4: mov eax, dword ptr [rcx + 0x10]
0xdad2b7: inc eax
0xdad2b9: mov dword ptr [rcx + 0x10], eax
0xdad2bc: mov rax, qword ptr [rsp + 0x60]
0xdad2c1: mov byte ptr [rax + 0x16], 1
0xdad2c5: xor ebx, ebx
0xdad2c7: mov qword ptr [rsp + 0x70], rbx
0xdad2cc: mov qword ptr [rsp + 0x88], rbx
0xdad2d4: mov eax, dword ptr [rip + 0x5f231ae]  ; [0x6cd0488] = runtime global (no file value)
0xdad2da: mov dword ptr [rsp + 0x78], eax
0xdad2de: lea rax, [rsp + 0x60]
0xdad2e3: mov qword ptr [rsp + 0x80], rax
0xdad2eb: mov dword ptr [rsp + 0x90], 0xffffffff
0xdad2f6: mov rax, qword ptr [r14 + 0x468]
0xdad2fd: movzx r15d, byte ptr [rax + 3]
0xdad302: mov byte ptr [rsp + 0x290], r15b
0xdad30a: lea rdx, [rsp + 0x70]
0xdad30f: lea rcx, [rsp + 0x170]
0xdad317: vzeroupper 
0xdad31a: call 0x1439cf5e0
0xdad31f: nop 
0xdad320: mov rcx, qword ptr [r14 + 0x358]
0xdad327: mov qword ptr [rsp + 0xa8], rcx
0xdad32f: mov eax, dword ptr [r14 + 0x360]
0xdad336: lea rax, [rcx + rax*8]
0xdad33a: mov qword ptr [rsp + 0x118], rax
0xdad342: cmp rcx, rax
0xdad345: je 0x140dad8d5
0xdad34b: nop dword ptr [rax + rax]
0xdad350: mov r12, qword ptr [rcx]
0xdad353: mov rcx, qword ptr [r12 + 8]
0xdad358: mov rax, qword ptr [rcx + 0xa0]
0xdad35f: test rax, rax
0xdad362: je 0x140dad38a
0xdad364: cmp qword ptr [rax + 8], 0
0xdad369: jne 0x140dad8b3
0xdad36f: mov ecx, dword ptr [rcx + 0x48]
0xdad372: mov dword ptr [rsp + 0x50], ecx
0xdad376: cmp qword ptr [rax + 0x58], 0
0xdad37b: je 0x140dad391
0xdad37d: cmp ecx, 1
0xdad380: jbe 0x140dad8b3
0xdad386: dec ecx
0xdad388: jmp 0x140dad38d
0xdad38a: mov ecx, dword ptr [rcx + 0x48]
0xdad38d: mov dword ptr [rsp + 0x50], ecx
0xdad391: mov r13d, ebx
0xdad394: test ecx, ecx
0xdad396: je 0x140dad8b3
0xdad39c: mov r9, rbx
0xdad39f: mov qword ptr [rsp + 0xa0], rbx
0xdad3a7: mov r8, rbx
0xdad3aa: mov qword ptr [rsp + 0xb0], rbx
0xdad3b2: nop dword ptr [rax]
0xdad3b6: nop word ptr [rax + rax]
0xdad3c0: mov rcx, qword ptr [r12 + 8]
0xdad3c5: mov rax, qword ptr [rcx + 0xa0]
0xdad3cc: test rax, rax
0xdad3cf: je 0x140dad3dd
0xdad3d1: cmp qword ptr [rax + 8], 0
0xdad3d6: je 0x140dad3dd
0xdad3d8: mov rdi, rbx
0xdad3db: jmp 0x140dad425
0xdad3dd: mov edx, dword ptr [rcx + 0x48]
0xdad3e0: cmp edx, r13d
0xdad3e3: ja 0x140dad3ea
0xdad3e5: mov rdi, rbx
0xdad3e8: jmp 0x140dad425
0xdad3ea: test rax, rax
0xdad3ed: je 0x140dad41d
0xdad3ef: cmp qword ptr [rax + 0x58], 0
0xdad3f4: je 0x140dad41d
0xdad3f6: cmp edx, 1
0xdad3f9: jne 0x140dad400
0xdad3fb: mov rdi, rbx
0xdad3fe: jmp 0x140dad425
0xdad400: mov rdi, qword ptr [rcx + 0x40]
0xdad404: cmp r13d, dword ptr [rax + 0x90]
0xdad40b: jae 0x140dad413
0xdad40d: mov rdi, qword ptr [r8 + rdi]
0xdad411: jmp 0x140dad425
0xdad413: lea eax, [r13 + 1]
0xdad417: mov rdi, qword ptr [rdi + rax*8]
0xdad41b: jmp 0x140dad425
0xdad41d: mov rax, qword ptr [rcx + 0x40]
0xdad421: mov rdi, qword ptr [rax + r9*8]
0xdad425: mov rax, qword ptr [rdi + 0xa0]
0xdad42c: test rax, rax
0xdad42f: je 0x140dad438
0xdad431: cmp qword ptr [rax + 8], 0
0xdad436: jne 0x140dad45c
0xdad438: mov rsi, qword ptr [rdi + 0xd8]
0xdad43f: test rsi, rsi
0xdad442: jne 0x140dad45f
0xdad444: test rax, rax
0xdad447: je 0x140dad45c
0xdad449: mov rcx, qword ptr [rax + 0x58]
0xdad44d: test rcx, rcx
0xdad450: je 0x140dad45c
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
0xdad487: movzx ebx, byte ptr [rax + 0xb1]
0xdad48e: lea rdx, [rsp + 0xb8]
0xdad496: mov rcx, qword ptr [rdi + 0x18]
0xdad49a: call 0x1435b4b90
0xdad49f: vmovss dword ptr [rsp + 0x38], xmm10
0xdad4a5: mov byte ptr [rsp + 0x30], bl
0xdad4a9: movzx ecx, byte ptr [rsi + 0x1eb]
0xdad4b0: mov byte ptr [rsp + 0x28], cl
0xdad4b4: vmovss xmm0, dword ptr [r14 + 0xabc]
0xdad4bd: vmovss dword ptr [rsp + 0x20], xmm0
0xdad4c3: mov r9, qword ptr [rax]
0xdad4c6: mov r8, qword ptr [rsp + 0x58]
0xdad4cb: mov rdx, rdi
0xdad4ce: mov rcx, r14
0xdad4d1: call 0x140d91660
0xdad4d6: movzx ebx, al
0xdad4d9: mov byte ptr [rsi + 0x1eb], al
0xdad4df: mov byte ptr [rsi + 0x1ec], 1
0xdad4e6: mov rcx, qword ptr [rdi + 0x20]
0xdad4ea: mov rax, qword ptr [rcx]
0xdad4ed: mov rax, qword ptr [rax + 0xa0]
0xdad4f4: test bl, bl
0xdad4f6: jne 0x140dad556
0xdad4f8: test rax, rax
0xdad4fb: je 0x140dad504
0xdad4fd: cmp qword ptr [rax + 8], 0
0xdad502: jne 0x140dad534
0xdad504: mov r9, qword ptr [rcx + 8]
0xdad508: xor edx, edx
0xdad50a: mov r8d, dword ptr [r9 + 8]
0xdad50e: test r8d, r8d
0xdad511: je 0x140dad534
0xdad513: mov r9, qword ptr [r9]
0xdad516: mov eax, dword ptr [rip + 0x5f22f48]  ; [0x6cd0464] = runtime global (no file value)
0xdad51c: nop dword ptr [rax]
0xdad520: cmp eax, dword ptr [r9 + rdx*4]
0xdad524: je 0x140dad52f
0xdad526: inc edx
0xdad528: cmp edx, r8d
0xdad52b: jb 0x140dad520
0xdad52d: jmp 0x140dad534
0xdad52f: cmp edx, -1
0xdad532: jne 0x140dad54a
0xdad534: cmp byte ptr [r14 + 0xace], 1
0xdad53c: je 0x140dad54a
0xdad53e: or byte ptr [rdi + 0xb4], 8
0xdad545: jmp 0x140dad7bb
0xdad54a: and byte ptr [rdi + 0xb4], 0xf7
0xdad551: jmp 0x140dad7bb
0xdad556: test rax, rax
0xdad559: je 0x140dad562
0xdad55b: cmp qword ptr [rax + 8], 0
0xdad560: jne 0x140dad58d
0xdad562: mov r9, qword ptr [rcx + 8]
0xdad566: xor edx, edx
0xdad568: mov r8d, dword ptr [r9 + 8]
0xdad56c: test r8d, r8d
0xdad56f: je 0x140dad58d
0xdad571: mov r9, qword ptr [r9]
0xdad574: mov eax, dword ptr [rip + 0x5f22eea]  ; [0x6cd0464] = runtime global (no file value)
0xdad57a: nop word ptr [rax + rax]
0xdad580: cmp eax, dword ptr [r9 + rdx*4]
0xdad584: je 0x140dad58d
0xdad586: inc edx
0xdad588: cmp edx, r8d
0xdad58b: jb 0x140dad580
0xdad58d: and byte ptr [rdi + 0xb4], 0xf7
0xdad594: mov byte ptr [rsp + 0x2a0], 0x26
0xdad59c: lea r8, [rsp + 0x2a0]
0xdad5a4: lea rdx, [rsp + 0xd0]
0xdad5ac: call 0x1435c8ef0
0xdad5b1: mov rcx, rax
0xdad5b4: call 0x140615320
0xdad5b9: movzx ecx, byte ptr [rax + 0xc]
0xdad5bd: lea rdx, [rip + 0x5edfbbc]  ; [0x6c8d180] = runtime global (no file value)
0xdad5c4: mov rcx, qword ptr [rdx + rcx*8]
0xdad5c8: mov rdx, rax
0xdad5cb: mov rcx, qword ptr [rcx + 0x18]
0xdad5cf: call 0x143598390
0xdad5d4: test al, al
0xdad5d6: je 0x140dad65d
0xdad5dc: mov rax, qword ptr [rsi + 0x240]
0xdad5e3: mov rdx, qword ptr [rax]
0xdad5e6: mov qword ptr [rsp + 0x40], 0
0xdad5ef: lea rax, [rip + 0x5cb834a]  ; [0x6a65940] = 25702.6 (0x46c8cd36)
0xdad5f6: mov qword ptr [rsp + 0x40], rax
0xdad5fb: mov byte ptr [rsp + 0x48], 6
0xdad600: mov byte ptr [rsp + 0x48], 1
0xdad605: lea rcx, [rsp + 0x40]
0xdad60a: call 0x1403d5f80
0xdad60f: lea rcx, [rsp + 0x40]
0xdad614: call 0x14141fe80
0xdad619: lea rcx, [rsp + 0x40]
0xdad61e: call 0x141420260
0xdad623: nop 
0xdad624: mov byte ptr [rsp + 0x2a0], 0
0xdad62c: mov byte ptr [rsp + 0x2a8], 0x26
0xdad634: lea r9, [rsp + 0x2a0]
0xdad63c: lea r8, [rsp + 0x40]
0xdad641: lea rdx, [rsp + 0x2a8]
0xdad649: mov rcx, qword ptr [rdi + 0x20]
0xdad64d: call 0x14064b880
0xdad652: nop 
0xdad653: lea rcx, [rsp + 0x40]
0xdad658: call 0x140394db0
0xdad65d: mov rax, qword ptr [r12 + 8]
0xdad662: mov r9, qword ptr [rax + 0x20]
0xdad666: mov rax, qword ptr [r9]
0xdad669: mov rcx, qword ptr [rax + 0xa0]
0xdad670: test rcx, rcx
0xdad673: je 0x140dad67c
0xdad675: cmp qword ptr [rcx + 8], 0
0xdad67a: jne 0x140dad6a5
0xdad67c: mov r9, qword ptr [r9 + 8]
0xdad680: xor edx, edx
0xdad682: mov r8d, dword ptr [r9 + 8]
0xdad686: test r8d, r8d
0xdad689: je 0x140dad6a5
0xdad68b: mov r9, qword ptr [r9]
0xdad68e: mov eax, dword ptr [rip + 0x5f22a88]  ; [0x6cd011c] = runtime global (no file value)
0xdad694: cmp eax, dword ptr [r9 + rdx*4]
0xdad698: je 0x140dad72a
0xdad69e: inc edx
0xdad6a0: cmp edx, r8d
0xdad6a3: jb 0x140dad694
0xdad6a5: vmovaps xmm3, xmm8
0xdad6aa: vmovups xmm0, xmmword ptr [rsi + 0x1f8]
0xdad6b2: mov eax, dword ptr [rsi + 0x208]
0xdad6b8: mov byte ptr [rsp + 0x20], bl
0xdad6bc: vmovups xmmword ptr [rsp + 0x70], xmm0
0xdad6c2: mov dword ptr [rsp + 0x80], eax
0xdad6c9: lea r8, [rsp + 0x70]
0xdad6ce: mov rdx, rdi
0xdad6d1: mov rcx, r14
0xdad6d4: call 0x140dabae0
0xdad6d9: mov rax, qword ptr [r12 + 8]
0xdad6de: mov r9, qword ptr [rax + 0x20]
0xdad6e2: mov rax, qword ptr [r9]
0xdad6e5: mov rcx, qword ptr [rax + 0xa0]
0xdad6ec: test rcx, rcx
0xdad6ef: je 0x140dad6fc
0xdad6f1: cmp qword ptr [rcx + 8], 0
0xdad6f6: jne 0x140dad7bb
0xdad6fc: mov r9, qword ptr [r9 + 8]
0xdad700: xor edx, edx
0xdad702: mov r8d, dword ptr [r9 + 8]
0xdad706: test r8d, r8d
0xdad709: je 0x140dad7bb
0xdad70f: mov r9, qword ptr [r9]
0xdad712: mov eax, dword ptr [rip + 0x5f22a18]  ; [0x6cd0130] = runtime global (no file value)
0xdad718: cmp eax, dword ptr [r9 + rdx*4]
0xdad71c: je 0x140dad746
0xdad71e: inc edx
0xdad720: cmp edx, r8d
0xdad723: jb 0x140dad718
0xdad725: jmp 0x140dad7bb
0xdad72a: cmp edx, -1
0xdad72d: je 0x140dad6a5
0xdad733: test r15b, r15b
0xdad736: je 0x140dad6a5
0xdad73c: vmovaps xmm3, xmm14
0xdad741: jmp 0x140dad6aa
0xdad746: cmp edx, -1
0xdad749: je 0x140dad7bb
0xdad74b: mov rbx, qword ptr [rdi + 0x20]
0xdad74f: mov rax, qword ptr [rbx]
0xdad752: mov rcx, qword ptr [rax + 0xa0]
0xdad759: test r15b, r15b
0xdad75c: je 0x140dad781
0xdad75e: test rcx, rcx
0xdad761: je 0x140dad76a
0xdad763: cmp qword ptr [rcx + 8], 0
0xdad768: jne 0x140dad7bb
0xdad76a: lea rdx, [rip + 0x5f218a7]  ; [0x6ccf018] = runtime global (no file value)
0xdad771: mov rcx, qword ptr [rbx + 8]
0xdad775: call 0x1435ca140
0xdad77a: cmp eax, -1
0xdad77d: je 0x140dad7bb
0xdad77f: jmp 0x140dad7b3
0xdad781: test rcx, rcx
0xdad784: je 0x140dad78d
0xdad786: cmp qword ptr [rcx + 8], 0
0xdad78b: jne 0x140dad7bb
0xdad78d: cmp dword ptr [rip + 0x5f21884], 0  ; [0x6ccf018] = runtime global (no file value)
0xdad794: je 0x140dad7bb
0xdad796: lea rdx, [rip + 0x5f2187b]  ; [0x6ccf018] = runtime global (no file value)
0xdad79d: mov rcx, qword ptr [rbx + 8]
0xdad7a1: call 0x1435ca0a0
0xdad7a6: test al, al
0xdad7a8: je 0x140dad7bb
0xdad7aa: mov rcx, qword ptr [rbx + 8]
0xdad7ae: call 0x1435caec0
0xdad7b3: mov rcx, rbx
0xdad7b6: call 0x1435c66a0
0xdad7bb: xor edx, edx
0xdad7bd: mov rcx, qword ptr [rdi + 0x30]
0xdad7c1: call 0x1435be010
0xdad7c6: mov rsi, rax
0xdad7c9: test rax, rax
0xdad7cc: je 0x140dad879
0xdad7d2: lea rdx, [rsp + 0x198]
0xdad7da: mov rcx, rax
0xdad7dd: call 0x1439b93f0
0xdad7e2: mov rdi, rax
0xdad7e5: test rax, rax
0xdad7e8: je 0x140dad879
0xdad7ee: mov rcx, qword ptr [rax]
0xdad7f1: mov rdx, qword ptr [rcx + 0x2a0]
0xdad7f8: mov rcx, rax
0xdad7fb: call rdx
0xdad7fd: mov rbx, rax
0xdad800: mov rcx, qword ptr [rdi]
0xdad803: mov rdx, qword ptr [rcx + 0x2c0]
0xdad80a: mov rcx, rdi
0xdad80d: call rdx
0xdad80f: mov r15d, eax
0xdad812: mov rcx, qword ptr [rsp + 0x170]
0xdad81a: mov rdx, qword ptr [rcx + 0x2a0]
0xdad821: lea rcx, [rsp + 0x170]
0xdad829: call rdx
0xdad82b: cmp rbx, rax
0xdad82e: jne 0x140dad84e
0xdad830: mov rcx, qword ptr [rsp + 0x170]
0xdad838: mov rdx, qword ptr [rcx + 0x2c0]
0xdad83f: lea rcx, [rsp + 0x170]
0xdad847: call rdx
0xdad849: cmp r15d, eax
0xdad84c: je 0x140dad870
0xdad84e: or byte ptr [rsi + 0x138], 1
0xdad855: or byte ptr [rsi + 0x139], 1
0xdad85c: mov rax, qword ptr [rdi]
0xdad85f: lea rdx, [rsp + 0x170]
0xdad867: mov rcx, rdi
0xdad86a: call qword ptr [rax + 0x2c8]
0xdad870: movzx r15d, byte ptr [rsp + 0x290]
0xdad879: inc r13d
0xdad87c: mov r9, qword ptr [rsp + 0xa0]
0xdad884: inc r9
0xdad887: mov qword ptr [rsp + 0xa0], r9
0xdad88f: mov r8, qword ptr [rsp + 0xb0]
0xdad897: add r8, 8
0xdad89b: mov qword ptr [rsp + 0xb0], r8
0xdad8a3: cmp r13d, dword ptr [rsp + 0x50]
0xdad8a8: mov ebx, 0
0xdad8ad: jb 0x140dad3c0
0xdad8b3: mov rcx, qword ptr [rsp + 0xa8]
0xdad8bb: add rcx, 8
0xdad8bf: mov qword ptr [rsp + 0xa8], rcx
0xdad8c7: cmp rcx, qword ptr [rsp + 0x118]
0xdad8cf: jne 0x140dad350
0xdad8d5: lea rdx, [rsp + 0xf0]
0xdad8dd: call 0x14064f530
0xdad8e2: nop 
0xdad8e3: mov rax, qword ptr [rsp + 0x100]
0xdad8eb: test al, al
0xdad8ed: je 0x140dad94e
0xdad8ef: mov rbx, qword ptr [rsp + 0xf8]
0xdad8f7: lea rdx, [rbx + 8]
0xdad8fb: test rbx, rbx
0xdad8fe: mov edi, 0
0xdad903: cmove rdx, rdi
0xdad907: mov rdx, qword ptr [rdx]
0xdad90a: lea rcx, [rsp + 0x290]
0xdad912: call 0x140393df0
0xdad917: nop 
0xdad918: mov rcx, qword ptr [rbx + 0x68]
0xdad91c: mov rcx, qword ptr [rcx + 0x1a0]
0xdad923: call 0x1417e9170
0xdad928: vmovaps xmm6, xmm0
0xdad92c: mov rcx, qword ptr [rsp + 0x290]
0xdad934: mov rax, qword ptr [rcx]
0xdad937: mov dl, 1
0xdad939: call qword ptr [rax + 0x20]
0xdad93c: vaddss xmm0, xmm6, dword ptr [rip + 0x4fc5a4c]  ; [0x5d73390] = 3.14159 (0x40490fdb)
0xdad944: mov rax, qword ptr [rsp + 0x100]
0xdad94c: jmp 0x140dad958
0xdad94e: vmovss xmm0, dword ptr [rip + 0x4fc5a3a]  ; [0x5d73390] = 3.14159 (0x40490fdb)
0xdad956: xor edi, edi
0xdad958: vmulss xmm9, xmm0, dword ptr [rip + 0x4fc5bec]  ; [0x5d7354c] = 57.2958 (0x42652ee1)
0xdad960: vmovss xmm10, dword ptr [rip + 0x4fc5d8c]  ; [0x5d736f4] = 1000 (0x447a0000)
0xdad968: test al, al
0xdad96a: je 0x140dad9fe
0xdad970: mov rbx, qword ptr [rsp + 0xf8]
0xdad978: lea rdx, [rbx + 8]
0xdad97c: test rbx, rbx
0xdad97f: cmove rdx, rdi
0xdad983: mov rdx, qword ptr [rdx]
0xdad986: lea rcx, [rsp + 0x290]
0xdad98e: call 0x140393df0
0xdad993: nop 
0xdad994: mov rcx, qword ptr [rbx + 0x68]
0xdad998: lea rdx, [rsp + 0xd0]
0xdad9a0: mov rcx, qword ptr [rcx + 0x1a0]
0xdad9a7: call 0x1404f8220
0xdad9ac: movsx ecx, word ptr [rax + 0xe]
0xdad9b0: vxorps xmm0, xmm0, xmm0
0xdad9b4: vcvtsi2ss xmm0, xmm0, ecx
0xdad9b8: vmulss xmm1, xmm0, xmm10
0xdad9bd: vaddss xmm8, xmm1, dword ptr [rax + 8]
0xdad9c2: vmovss xmm7, dword ptr [rax + 4]
0xdad9c7: movsx ecx, word ptr [rax + 0xc]
0xdad9cb: vxorps xmm0, xmm0, xmm0
0xdad9cf: vcvtsi2ss xmm0, xmm0, ecx
0xdad9d3: vmulss xmm1, xmm0, xmm10
0xdad9d8: vaddss xmm6, xmm1, dword ptr [rax]
0xdad9dc: mov rcx, qword ptr [rsp + 0x290]
0xdad9e4: mov rax, qword ptr [rcx]
0xdad9e7: mov dl, 1
0xdad9e9: call qword ptr [rax + 0x20]
0xdad9ec: mov rax, qword ptr [rsp + 0x100]
0xdad9f4: vmovd ecx, xmm8
0xdad9f8: vunpcklps xmm1, xmm6, xmm7
0xdad9fc: jmp 0x140dada0c
0xdad9fe: vmovsd xmm1, qword ptr [rip + 0x4798482]  ; [0x5545e88] = 0 (0x00000000)
0xdada06: mov ecx, dword ptr [rip + 0x4798484]  ; [0x5545e90] = 0 (0x00000000)
0xdada0c: vmovsd qword ptr [rsp + 0x120], xmm1
0xdada15: mov dword ptr [rsp + 0x128], ecx
0xdada1c: mov rsi, rdi
0xdada1f: test al, al
0xdada21: cmovne rsi, qword ptr [rsp + 0xf8]
0xdada2a: lea r12, [rip + 0x4978417]  ; [0x5725e48] = 12.205 (0x414347d0)
0xdada31: cmp byte ptr [rip + 0x5f00c40], 0  ; [0x6cae678] = runtime global (no file value)
0xdada38: je 0x140dadb46
0xdada3e: mov rcx, qword ptr [r14 + 0x5b8]
0xdada45: test rcx, rcx
0xdada48: je 0x140dadb46
0xdada4e: add rcx, 0xde
0xdada55: call 0x140537250
0xdada5a: cmp byte ptr [rax + 0xb0], 0
0xdada61: je 0x140dadb46
0xdada67: mov r8, qword ptr [r14 + 0x5b8]
0xdada6e: mov r8d, dword ptr [r8 + 0x1c0]
0xdada75: lea rdx, [rsp + 0x70]
0xdada7a: call 0x14064f570
0xdada7f: nop 
0xdada80: cmp byte ptr [rsp + 0x80], 0
0xdada88: je 0x140dadb37
0xdada8e: mov rbx, qword ptr [rsp + 0x78]
0xdada93: lea rdx, [rbx + 8]
0xdada97: test rbx, rbx
0xdada9a: cmove rdx, rdi
0xdada9e: mov rdx, qword ptr [rdx]
0xdadaa1: lea rcx, [rsp + 0x290]
0xdadaa9: call 0x140393df0
0xdadaae: nop 
0xdadaaf: mov rcx, qword ptr [rbx + 0x68]
0xdadab3: lea rdx, [rsp + 0xd0]
0xdadabb: mov rcx, qword ptr [rcx + 0x1a0]
0xdadac2: call 0x1404f8220
0xdadac7: movsx ecx, word ptr [rax + 0xe]
0xdadacb: vxorps xmm0, xmm0, xmm0
0xdadacf: vcvtsi2ss xmm0, xmm0, ecx
0xdadad3: vmulss xmm1, xmm0, xmm10
0xdadad8: vaddss xmm8, xmm1, dword ptr [rax + 8]
0xdadadd: vmovss xmm7, dword ptr [rax + 4]
0xdadae2: movsx ecx, word ptr [rax + 0xc]
0xdadae6: vxorps xmm0, xmm0, xmm0
0xdadaea: vcvtsi2ss xmm0, xmm0, ecx
0xdadaee: vmulss xmm1, xmm0, xmm10
0xdadaf3: vaddss xmm6, xmm1, dword ptr [rax]
0xdadaf7: mov rcx, qword ptr [rsp + 0x290]
0xdadaff: mov rax, qword ptr [rcx]
0xdadb02: mov dl, 1
0xdadb04: call qword ptr [rax + 0x20]
0xdadb07: vmovss dword ptr [rsp + 0xb8], xmm6
0xdadb10: vmovss dword ptr [rsp + 0xbc], xmm7
0xdadb19: vmovss dword ptr [rsp + 0xc0], xmm8
0xdadb22: lea rdx, [rsp + 0xb8]
0xdadb2a: mov rcx, qword ptr [r14 + 0x5b8]
0xdadb31: call 0x140decaf0
0xdadb36: nop 
0xdadb37: mov qword ptr [rsp + 0x70], r12
0xdadb3c: lea rcx, [rsp + 0x70]
0xdadb41: call 0x141434880
0xdadb46: mov r15d, dword ptr [r14 + 0x3a0]
0xdadb4d: mov ebx, edi
0xdadb4f: test r15d, r15d
0xdadb52: je 0x140dadb99
0xdadb54: nop dword ptr [rax]
0xdadb58: nop dword ptr [rax + rax]
0xdadb60: mov r8, qword ptr [r14 + 0x398]
0xdadb67: vmovss dword ptr [rsp + 0x28], xmm9
0xdadb6d: lea rax, [rsp + 0x120]
0xdadb75: mov qword ptr [rsp + 0x20], rax
0xdadb7a: mov r9, rsi
0xdadb7d: mov r8, qword ptr [rdi + r8]
0xdadb81: movzx edx, bl
0xdadb84: mov rcx, r14
0xdadb87: call 0x140d94040
0xdadb8c: inc ebx
0xdadb8e: lea rdi, [rdi + 8]
0xdadb92: cmp ebx, r15d
0xdadb95: jb 0x140dadb60
0xdadb97: xor edi, edi
0xdadb99: cmp byte ptr [rip + 0x5eff518], 0  ; [0x6cad0b8] = runtime global (no file value)
0xdadba0: je 0x140dadbdb
0xdadba2: mov ebx, edi
0xdadba4: cmp dword ptr [r14 + 0x260], 0
0xdadbac: jbe 0x140dadbcd
0xdadbae: nop 
0xdadbb0: mov ecx, ebx
0xdadbb2: shl rcx, 5
0xdadbb6: add rcx, qword ptr [r14 + 0x258]
0xdadbbd: call 0x1404266e0
0xdadbc2: inc ebx
0xdadbc4: cmp ebx, dword ptr [r14 + 0x260]
0xdadbcb: jb 0x140dadbb0
0xdadbcd: mov dword ptr [r14 + 0x260], edi
0xdadbd4: mov dword ptr [r14 + 0x2a0], edi
0xdadbdb: mov rcx, r14
0xdadbde: call 0x140dbdcb0
0xdadbe3: mov rcx, r14
0xdadbe6: call 0x140dbeee0
0xdadbeb: mov rcx, r14
0xdadbee: call 0x140dc18b0
0xdadbf3: cmp dword ptr [r14 + 0xbf8], 3
0xdadbfb: jne 0x140dadc12
0xdadbfd: mov rax, qword ptr [r14 + 0x468]
0xdadc04: cmp byte ptr [rax + 3], 0
0xdadc08: jne 0x140dadc12
0xdadc0a: mov rcx, r14
0xdadc0d: call 0x140db2a30
0xdadc12: mov byte ptr [r14 + 0xace], 0
0xdadc1a: mov qword ptr [rsp + 0xf0], r12
0xdadc22: lea rcx, [rsp + 0xf0]
0xdadc2a: call 0x141434880
0xdadc2f: nop 
0xdadc30: lea rcx, [rsp + 0x1a8]
0xdadc38: call 0x14038ad90
0xdadc3d: nop 
0xdadc3e: lea rax, [rip + 0x4f5775b]  ; [0x5d053a0] = 311.667 (0x439bd550)
0xdadc45: mov qword ptr [rsp + 0x170], rax
0xdadc4d: lea rax, [rip + 0x496d35c]  ; [0x571afb0] = 11.5154 (0x41383f40)
0xdadc54: mov qword ptr [rsp + 0x170], rax
0xdadc5c: lea rax, [rip + 0x47c61c5]  ; [0x5573e28] = 2.89546 (0x40394f40)
0xdadc63: mov qword ptr [rsp + 0x170], rax
0xdadc6b: lea rcx, [rsp + 0x60]
0xdadc70: call 0x14038ad90
0xdadc75: lea r11, [rsp + 0x250]
0xdadc7d: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdadc83: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdadc89: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdadc8f: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdadc95: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdadc9b: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdadca1: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdadca7: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xdadcad: vmovaps xmm14, xmmword ptr [r11 - 0x90]
0xdadcb6: vmovaps xmm15, xmmword ptr [r11 - 0xa0]
0xdadcbf: mov rsp, r11
0xdadcc2: pop r15
0xdadcc4: pop r14
0xdadcc6: pop r13
0xdadcc8: pop r12
0xdadcca: pop rdi
0xdadccb: pop rsi
0xdadccc: pop rbx
0xdadccd: ret 
0xdadcce: int3 