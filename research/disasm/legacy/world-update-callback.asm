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
0xdabe0c: lea rdi, [rip + 0x495f545]
0xdabe13: mov qword ptr [rsp + 0x70], rdi
0xdabe18: lea rax, [rip + 0x5f6a049]
0xdabe1f: mov qword ptr [rsp + 0x78], rax
0xdabe24: mov byte ptr [rsp + 0x80], r15b
0xdabe2c: lea rax, [rip + 0x4da554d]
0xdabe33: mov qword ptr [rsp + 0x70], rax
0xdabe38: mov byte ptr [rsp + 0x88], 1
0xdabe40: vmovss dword ptr [rsp + 0x8c], xmm0
0xdabe49: vmovss dword ptr [rsp + 0x90], xmm1
0xdabe52: lea rdx, [rsp + 0x70]
0xdabe57: mov rcx, qword ptr [rbx + 0x30]
0xdabe5b: call 0x1412b6e50
0xdabe60: nop 
0xdabe61: mov qword ptr [rsp + 0x70], rdi
0xdabe66: vmovss xmm0, dword ptr [rip + 0x5effbca]
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
0xdabeb7: vmovss xmm4, dword ptr [rip + 0x4fc7075]
0xdabebf: vmulss xmm0, xmm4, dword ptr [rax + 4]
0xdabec4: vmulss xmm1, xmm0, dword ptr [rip + 0x5f00bac]
0xdabecc: vmulss xmm14, xmm1, xmm3
0xdabed0: vmulss xmm0, xmm4, dword ptr [rax]
0xdabed4: vmulss xmm1, xmm0, dword ptr [rip + 0x5f00b4c]
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
0xdabfaa: vmovss xmm10, dword ptr [rip + 0x5f017a6]
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
0xdac00b: vmovss xmm1, dword ptr [rip + 0x4fc70a1]
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
0xdac0bd: vmovss xmm14, dword ptr [rip + 0x4fc6fef]
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
0xdac198: vmovss xmm0, dword ptr [rip + 0x5f00428]
0xdac1a0: vmovss xmm14, dword ptr [rip + 0x4fc6f0c]
0xdac1a8: vsubss xmm3, xmm0, xmm14
0xdac1ad: vmulss xmm1, xmm3, xmm8
0xdac1b2: vaddss xmm2, xmm1, xmm2
0xdac1b6: vmovss dword ptr [r14 + 0xa90], xmm2
0xdac1bf: vmulss xmm0, xmm5, xmm3
0xdac1c3: vaddss xmm1, xmm0, xmm4
0xdac1c7: vmovss dword ptr [r14 + 0xa94], xmm1
0xdac1d0: vmovss xmm3, dword ptr [r14 + 0xa58]
0xdac1d9: vmulss xmm0, xmm8, dword ptr [rip + 0x5f003e7]
0xdac1e1: vaddss xmm1, xmm0, xmm3
0xdac1e5: vmovss dword ptr [rsp + 0x290], xmm1
0xdac1ee: vmovss xmm4, dword ptr [r14 + 0xa5c]
0xdac1f7: vmulss xmm0, xmm5, dword ptr [rip + 0x5f003c9]
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
0xdac377: vmovss xmm0, dword ptr [rip + 0x4fc686d]
0xdac37f: vcomiss xmm0, xmm4
0xdac383: jb 0x140dac393
0xdac385: vcomiss xmm4, dword ptr [rip + 0x4fc74f3]
0xdac38d: jb 0x140dac393
0xdac38f: mov al, 1
0xdac391: jmp 0x140dac395
0xdac393: xor al, al
0xdac395: mov byte ptr [r14 + 0xaf5], al
0xdac39c: vmovss xmm9, dword ptr [rip + 0x4fc6b90]
0xdac3a4: vmulss xmm1, xmm6, xmm9
0xdac3a9: vaddss xmm0, xmm1, xmm7
0xdac3ad: vmovss dword ptr [rsp + 0x58], xmm0
0xdac3b3: vsubss xmm1, xmm8, xmm1
0xdac3b7: vmovss dword ptr [rsp + 0x5c], xmm1
0xdac3bd: vmovss xmm0, dword ptr [r14 + 0xaa0]
0xdac3c6: vsubss xmm3, xmm0, dword ptr [rip + 0x5eff61a]
0xdac3ce: vmovss xmm0, dword ptr [rip + 0x5eff6b2]
0xdac3d6: vsubss xmm1, xmm0, dword ptr [rip + 0x5eff60a]
0xdac3de: vdivss xmm2, xmm3, xmm1
0xdac3e2: vsubss xmm8, xmm14, xmm2
0xdac3e6: vmovss dword ptr [rsp + 0xa8], xmm8
0xdac3ef: mov rcx, r14
0xdac3f2: call 0x140d96760
0xdac3f7: vmovaps xmm10, xmm0
0xdac3fb: vmovss dword ptr [rsp + 0xb0], xmm0
0xdac404: lea r12, [rip + 0x5ee0d75]
0xdac40b: cmp byte ptr [rip + 0x5fba8c6], 0
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
0xdac47f: vmovups ymm0, ymmword ptr [rip + 0x5cb8e99]
0xdac487: vmovups ymmword ptr [rdi], ymm0
0xdac48b: vmovups ymm1, ymmword ptr [rip + 0x5cb8ead]
0xdac493: vmovups ymmword ptr [rdi + 0x20], ymm1
0xdac498: vmovups ymm0, ymmword ptr [rip + 0x5cb8e80]
0xdac4a0: vmovups ymmword ptr [rsp + 0x70], ymm0
0xdac4a6: vmovups ymmword ptr [rsp + 0x130], ymm0
0xdac4af: vmovups ymm1, ymmword ptr [rip + 0x5cb8e89]
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
0xdac56e: vmulss xmm2, xmm0, dword ptr [rip + 0x4fc7362]
0xdac576: lea rdx, [rsp + 0x290]
0xdac57e: lea rcx, [rsp + 0x2a8]
0xdac586: call 0x141372520
0xdac58b: vmovdqu xmm0, xmmword ptr [rip + 0x4fc8d0d]
0xdac593: vmovups xmmword ptr [rsp + 0x130], xmm0
0xdac59c: vmovss dword ptr [rsp + 0x140], xmm13
0xdac5a5: vmovss xmm1, dword ptr [rsp + 0x290]
0xdac5ae: vmovss dword ptr [rsp + 0x144], xmm1
0xdac5b7: vmovss xmm0, dword ptr [rsp + 0x2a8]
0xdac5c0: vmovss dword ptr [rsp + 0x148], xmm0
0xdac5c9: vmovss dword ptr [rsp + 0x14c], xmm13
0xdac5d2: vmovss dword ptr [rsp + 0x150], xmm13
0xdac5db: vxorps xmm0, xmm0, xmmword ptr [rip + 0x4fc976d]
0xdac5e3: vmovss dword ptr [rsp + 0x154], xmm0
0xdac5ec: vmovss dword ptr [rsp + 0x158], xmm1
0xdac5f5: vmovss dword ptr [rsp + 0x15c], xmm13
0xdac5fe: vmovdqu xmm0, xmmword ptr [rip + 0x4fc93da]
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
0xdac6d8: vmulss xmm0, xmm14, dword ptr [rip + 0x4fc72a8]
0xdac6e0: vmulss xmm1, xmm0, dword ptr [rsp + 0x2a8]
0xdac6e9: vsubss xmm0, xmm1, dword ptr [rsp + 0xa0]
0xdac6f2: vmovss dword ptr [rdi + 0x30], xmm0
0xdac6f7: vmovss xmm13, dword ptr [rsp + 0x294]
0xdac700: vmulss xmm1, xmm13, dword ptr [rip + 0x4fc7280]
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
0xdacb42: vmovss xmm9, dword ptr [rip + 0x4fc63ea]
0xdacb4a: vmovss xmm8, dword ptr [rsp + 0xa8]
0xdacb53: vmovss xmm10, dword ptr [rsp + 0xb0]
0xdacb5c: vmovss xmm14, dword ptr [rip + 0x4fc6550]
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
0xdacc65: cmp byte ptr [rip + 0x5eff6dc], 0
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
0xdacd80: mov eax, dword ptr [rip + 0x5f236de]
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
0xdacddf: mov eax, dword ptr [rip + 0x5f2367f]
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
0xdacf25: mov eax, dword ptr [rip + 0x5f23539]
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
0xdacf89: mov eax, dword ptr [rip + 0x5f234d5]
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
0xdad009: lea r15, [rip + 0x5ee0170]
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
0xdad198: mov eax, dword ptr [rip + 0x5f232c6]
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
0xdad1f9: mov eax, dword ptr [rip + 0x5f23265]
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
0xdad2d4: mov eax, dword ptr [rip + 0x5f231ae]
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
0xdad516: mov eax, dword ptr [rip + 0x5f22f48]
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
0xdad574: mov eax, dword ptr [rip + 0x5f22eea]
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
0xdad5bd: lea rdx, [rip + 0x5edfbbc]
0xdad5c4: mov rcx, qword ptr [rdx + rcx*8]
0xdad5c8: mov rdx, rax
0xdad5cb: mov rcx, qword ptr [rcx + 0x18]
0xdad5cf: call 0x143598390
0xdad5d4: test al, al
0xdad5d6: je 0x140dad65d
0xdad5dc: mov rax, qword ptr [rsi + 0x240]
0xdad5e3: mov rdx, qword ptr [rax]
0xdad5e6: mov qword ptr [rsp + 0x40], 0
0xdad5ef: lea rax, [rip + 0x5cb834a]
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
0xdad68e: mov eax, dword ptr [rip + 0x5f22a88]
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
0xdad712: mov eax, dword ptr [rip + 0x5f22a18]
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
0xdad76a: lea rdx, [rip + 0x5f218a7]
0xdad771: mov rcx, qword ptr [rbx + 8]
0xdad775: call 0x1435ca140
0xdad77a: cmp eax, -1
0xdad77d: je 0x140dad7bb
0xdad77f: jmp 0x140dad7b3
0xdad781: test rcx, rcx
0xdad784: je 0x140dad78d
0xdad786: cmp qword ptr [rcx + 8], 0
0xdad78b: jne 0x140dad7bb
0xdad78d: cmp dword ptr [rip + 0x5f21884], 0
0xdad794: je 0x140dad7bb
0xdad796: lea rdx, [rip + 0x5f2187b]
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
0xdad93c: vaddss xmm0, xmm6, dword ptr [rip + 0x4fc5a4c]
0xdad944: mov rax, qword ptr [rsp + 0x100]
0xdad94c: jmp 0x140dad958
0xdad94e: vmovss xmm0, dword ptr [rip + 0x4fc5a3a]
0xdad956: xor edi, edi
0xdad958: vmulss xmm9, xmm0, dword ptr [rip + 0x4fc5bec]
0xdad960: vmovss xmm10, dword ptr [rip + 0x4fc5d8c]
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
0xdad9fe: vmovsd xmm1, qword ptr [rip + 0x4798482]
0xdada06: mov ecx, dword ptr [rip + 0x4798484]
0xdada0c: vmovsd qword ptr [rsp + 0x120], xmm1
0xdada15: mov dword ptr [rsp + 0x128], ecx
0xdada1c: mov rsi, rdi
0xdada1f: test al, al
0xdada21: cmovne rsi, qword ptr [rsp + 0xf8]
0xdada2a: lea r12, [rip + 0x4978417]
0xdada31: cmp byte ptr [rip + 0x5f00c40], 0
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
0xdadb99: cmp byte ptr [rip + 0x5eff518], 0
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
0xdadc3e: lea rax, [rip + 0x4f5775b]
0xdadc45: mov qword ptr [rsp + 0x170], rax
0xdadc4d: lea rax, [rip + 0x496d35c]
0xdadc54: mov qword ptr [rsp + 0x170], rax
0xdadc5c: lea rax, [rip + 0x47c61c5]
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
CALLEE 0x12b6e50
0x12b6e50: mov qword ptr [rsp + 8], rbx
0x12b6e55: mov qword ptr [rsp + 0x10], rsi
0x12b6e5a: mov qword ptr [rsp + 0x18], rdi
0x12b6e5f: mov qword ptr [rsp + 0x20], r14
0x12b6e64: push rbp
0x12b6e65: lea rbp, [rsp - 0x580]
0x12b6e6d: sub rsp, 0x680
0x12b6e74: mov r14, rdx
0x12b6e77: mov r10, rcx
0x12b6e7a: mov rax, qword ptr [rdx + 8]
0x12b6e7e: mov r8d, dword ptr [rax + 0x14]
0x12b6e82: cmp dword ptr [rcx + 4], 0
0x12b6e86: je 0x1412b70a2
0x12b6e8c: mov ecx, dword ptr [rcx]
0x12b6e8e: test ecx, ecx
0x12b6e90: je 0x1412b70a2
0x12b6e96: xor edx, edx
0x12b6e98: mov eax, r8d
0x12b6e9b: div ecx
0x12b6e9d: mov r11d, edx
0x12b6ea0: shl r11, 8
0x12b6ea4: add r11, qword ptr [r10 + 0x10]
0x12b6ea8: xor edx, edx
0x12b6eaa: mov ebx, dword ptr [r11]
0x12b6ead: test ebx, ebx
0x12b6eaf: je 0x1412b70a2
0x12b6eb5: cmp dword ptr [r11 + rdx*8 + 8], r8d
0x12b6eba: jne 0x1412b6ecf
0x12b6ebc: mov ecx, dword ptr [r11 + rdx*8 + 0xc]
0x12b6ec1: mov rax, qword ptr [r10 + 0x18]
0x12b6ec5: mov r9, qword ptr [rax + rcx*8]
0x12b6ec9: cmp dword ptr [r9 + 4], r8d
0x12b6ecd: je 0x1412b6eda
0x12b6ecf: inc edx
0x12b6ed1: cmp edx, ebx
0x12b6ed3: jb 0x1412b6eb5
0x12b6ed5: jmp 0x1412b70a2
0x12b6eda: lea rdi, [r9 + 8]
0x12b6ede: test rdi, rdi
0x12b6ee1: je 0x1412b70a2
0x12b6ee7: mov rsi, qword ptr [rdi]
0x12b6eea: mov ebx, dword ptr [rdi + 8]
0x12b6eed: lea rax, [rsp + 0x30]
0x12b6ef2: mov qword ptr [rsp + 0x20], rax
0x12b6ef7: mov dword ptr [rsp + 0x28], 0
0x12b6eff: mov dword ptr [rsp + 0x2c], 0x64
0x12b6f07: mov eax, dword ptr [rsp + 0x2c]
0x12b6f0b: mov ecx, dword ptr [rsp + 0x28]
0x12b6f0f: sub eax, ecx
0x12b6f11: cmp ebx, eax
0x12b6f13: jbe 0x1412b6f32
0x12b6f15: lea r8d, [rbx + rcx]
0x12b6f19: mov r9d, 8
0x12b6f1f: lea rdx, [rsp + 0x30]
0x12b6f24: lea rcx, [rsp + 0x20]
0x12b6f29: call 0x140392380
0x12b6f2e: mov ecx, dword ptr [rsp + 0x28]
0x12b6f32: mov r8, rbx
0x12b6f35: shl r8, 3
0x12b6f39: mov rax, qword ptr [rsp + 0x20]
0x12b6f3e: lea rcx, [rax + rcx*8]
0x12b6f42: mov rdx, rsi
0x12b6f45: call 0x144898e1e
0x12b6f4a: add dword ptr [rsp + 0x28], ebx
0x12b6f4e: mov rbx, qword ptr [rsp + 0x20]
0x12b6f53: mov eax, dword ptr [rsp + 0x28]
0x12b6f57: lea rsi, [rbx + rax*8]
0x12b6f5b: cmp rbx, rsi
0x12b6f5e: je 0x1412b6f7e
0x12b6f60: mov rax, qword ptr [rbx]
0x12b6f63: mov rcx, qword ptr [rax]
0x12b6f66: cmp byte ptr [rcx + 8], 0
0x12b6f6a: je 0x1412b6f75
0x12b6f6c: mov rax, qword ptr [rcx]
0x12b6f6f: mov rdx, r14
0x12b6f72: call qword ptr [rax + 8]
0x12b6f75: add rbx, 8
0x12b6f79: cmp rbx, rsi
0x12b6f7c: jne 0x1412b6f60
0x12b6f7e: lea rax, [rsp + 0x30]
0x12b6f83: mov r14d, 0x1fd
0x12b6f89: mov rcx, qword ptr [rsp + 0x20]
0x12b6f8e: cmp rcx, rax
0x12b6f91: je 0x1412b6fb7
0x12b6f93: test rcx, rcx
0x12b6f96: je 0x1412b6fb7
0x12b6f98: mov rax, qword ptr gs:[0x58]
0x12b6fa1: mov rdx, qword ptr [rax]
0x12b6fa4: cmp byte ptr [r14 + rdx], 0
0x12b6fa9: je 0x1412b6fb2
0x12b6fab: call 0x1447f03bc
0x12b6fb0: jmp 0x1412b6fb7
0x12b6fb2: call 0x1447f02bc
0x12b6fb7: mov rsi, qword ptr [rdi + 0x10]
0x12b6fbb: mov ebx, dword ptr [rdi + 0x18]
0x12b6fbe: lea rax, [rbp + 0x260]
0x12b6fc5: mov qword ptr [rbp + 0x250], rax
0x12b6fcc: mov dword ptr [rbp + 0x258], 0
0x12b6fd6: mov dword ptr [rbp + 0x25c], 0x64
0x12b6fe0: mov eax, dword ptr [rbp + 0x25c]
0x12b6fe6: mov ecx, dword ptr [rbp + 0x258]
0x12b6fec: sub eax, ecx
0x12b6fee: cmp ebx, eax
0x12b6ff0: jbe 0x1412b7015
0x12b6ff2: lea r8d, [rbx + rcx]
0x12b6ff6: mov r9d, 8
0x12b6ffc: lea rdx, [rbp + 0x260]
0x12b7003: lea rcx, [rbp + 0x250]
0x12b700a: call 0x140392380
0x12b700f: mov ecx, dword ptr [rbp + 0x258]
0x12b7015: mov r8, rbx
0x12b7018: shl r8, 3
0x12b701c: mov rax, qword ptr [rbp + 0x250]
0x12b7023: lea rcx, [rax + rcx*8]
0x12b7027: mov rdx, rsi
0x12b702a: call 0x144898e1e
0x12b702f: add dword ptr [rbp + 0x258], ebx
0x12b7035: mov rbx, qword ptr [rbp + 0x250]
0x12b703c: mov eax, dword ptr [rbp + 0x258]
0x12b7042: lea rdi, [rbx + rax*8]
0x12b7046: cmp rbx, rdi
0x12b7049: je 0x1412b706b
0x12b704b: nop dword ptr [rax + rax]
0x12b7050: mov rax, qword ptr [rbx]
0x12b7053: mov rcx, qword ptr [rax]
0x12b7056: cmp byte ptr [rcx + 8], 0
0x12b705a: je 0x1412b7062
0x12b705c: mov rax, qword ptr [rcx]
0x12b705f: call qword ptr [rax + 0x10]
0x12b7062: add rbx, 8
0x12b7066: cmp rbx, rdi
0x12b7069: jne 0x1412b7050
0x12b706b: lea rax, [rbp + 0x260]
0x12b7072: mov rcx, qword ptr [rbp + 0x250]
0x12b7079: cmp rcx, rax
0x12b707c: je 0x1412b70a2
0x12b707e: test rcx, rcx
0x12b7081: je 0x1412b70a2
0x12b7083: mov rax, qword ptr gs:[0x58]
0x12b708c: mov rdx, qword ptr [rax]
0x12b708f: cmp byte ptr [r14 + rdx], 0
0x12b7094: je 0x1412b709d
0x12b7096: call 0x1447f03bc
0x12b709b: jmp 0x1412b70a2
0x12b709d: call 0x1447f02bc
0x12b70a2: lea r11, [rsp + 0x680]
0x12b70aa: mov rbx, qword ptr [r11 + 0x10]
0x12b70ae: mov rsi, qword ptr [r11 + 0x18]
0x12b70b2: mov rdi, qword ptr [r11 + 0x20]
0x12b70b6: mov r14, qword ptr [r11 + 0x28]
0x12b70ba: mov rsp, r11
0x12b70bd: pop rbp
0x12b70be: ret 
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0x4a2010
0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 
CALLEE 0xdd4c90
0xdd4c90: push rdi
0xdd4c92: sub rsp, 0x20
0xdd4c96: xor al, al
0xdd4c98: mov rdi, rcx
0xdd4c9b: vcomiss xmm1, dword ptr [rip + 0x5ed8875]
0xdd4ca3: jbe 0x140dd4ca9
0xdd4ca5: xor dl, dl
0xdd4ca7: jmp 0x140dd4cc0
0xdd4ca9: vmovss xmm0, dword ptr [rip + 0x5ed8817]
0xdd4cb1: movzx edx, al
0xdd4cb4: mov eax, 1
0xdd4cb9: vcomiss xmm0, xmm1
0xdd4cbd: cmova edx, eax
0xdd4cc0: cmp byte ptr [rcx + 0xc8], dl
0xdd4cc6: je 0x140dd4dc4
0xdd4ccc: mov rax, qword ptr [rcx + 8]
0xdd4cd0: mov byte ptr [rcx + 0xc8], dl
CALLEE 0x4a2010
0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 
CALLEE 0x4a2010
0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 
CALLEE 0x4a2010
0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd96760
0xd96760: sub rsp, 0x48
0xd96764: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd9676c: vmovss xmm1, dword ptr [rip + 0x5f15724]
0xd96774: vsubss xmm3, xmm0, dword ptr [rip + 0x5f156cc]
0xd9677c: vsubss xmm2, xmm1, dword ptr [rip + 0x5f156c4]
0xd96784: movsxd rax, dword ptr [rip + 0x5f155cd]
0xd9678b: vdivss xmm0, xmm3, xmm2
0xd9678f: vmovaps xmmword ptr [rsp + 0x20], xmm8
0xd96795: vmovss xmm8, dword ptr [rip + 0x4fdc917]
0xd9679d: vminss xmm1, xmm0, xmm8
0xd967a2: vxorps xmm0, xmm0, xmm0
0xd967a6: vmaxss xmm5, xmm0, xmm1
0xd967aa: cmp eax, 0x1e
0xd967ad: ja 0x140d96f43
0xd967b3: lea rdx, [rip - 0xd967ba]
CALLEE 0xd96fd0
0xd96fd0: sub rsp, 0x58
0xd96fd4: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd96fdc: vmovss xmm1, dword ptr [rip + 0x5f14e14]
0xd96fe4: vsubss xmm3, xmm0, dword ptr [rip + 0x5f14dbc]
0xd96fec: vsubss xmm2, xmm1, dword ptr [rip + 0x5f14db4]
0xd96ff4: movsxd rax, dword ptr [rip + 0x5f14d0d]
0xd96ffb: vdivss xmm0, xmm3, xmm2
0xd96fff: vmovaps xmmword ptr [rsp + 0x30], xmm7
0xd97005: vmovaps xmmword ptr [rsp + 0x20], xmm8
0xd9700b: vmovss xmm8, dword ptr [rip + 0x4fdc0a1]
0xd97013: vminss xmm1, xmm0, xmm8
0xd97018: vxorps xmm0, xmm0, xmm0
0xd9701c: vmaxss xmm5, xmm0, xmm1
0xd97020: cmp eax, 0x1e
0xd97023: ja 0x140d9763b
0xd97029: lea rdx, [rip - 0xd97030]
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
CALLEE 0x1372520
0x1372520: sub rsp, 0x18
0x1372524: vmulss xmm1, xmm2, dword ptr [rip + 0x4a008bc]
0x137252c: vmovss xmm5, dword ptr [rip + 0x4a00a00]
0x1372534: vxorps xmm0, xmm0, xmm0
0x1372538: vcomiss xmm2, xmm0
0x137253c: vmovaps xmmword ptr [rsp], xmm6
0x1372541: jb 0x141372549
0x1372543: vaddss xmm0, xmm1, xmm5
0x1372547: jmp 0x14137254d
0x1372549: vsubss xmm0, xmm1, xmm5
0x137254d: vcvttss2si eax, xmm0
0x1372551: vxorps xmm0, xmm0, xmm0
0x1372555: vcvtsi2ss xmm0, xmm0, eax
0x1372559: vmulss xmm0, xmm0, dword ptr [rip + 0x4a00ec7]
0x1372561: vsubss xmm3, xmm2, xmm0
0x1372565: vcomiss xmm3, dword ptr [rip + 0x4a00c5b]
0x137256d: jbe 0x141372585
0x137256f: vmovss xmm0, dword ptr [rip + 0x4a00e19]
0x1372577: vmovss xmm6, dword ptr [rip + 0x4a01409]
0x137257f: vsubss xmm3, xmm0, xmm3
0x1372583: jmp 0x1413725b1
0x1372585: vmovss xmm0, dword ptr [rip + 0x4a01437]
0x137258d: vcomiss xmm0, xmm3
0x1372591: jbe 0x1413725a9
0x1372593: vmovss xmm0, dword ptr [rip + 0x4a01469]
0x137259b: vmovss xmm6, dword ptr [rip + 0x4a013e5]
0x13725a3: vsubss xmm3, xmm0, xmm3
0x13725a7: jmp 0x1413725b1
0x13725a9: vmovss xmm6, dword ptr [rip + 0x4a00b03]
0x13725b1: vmovss xmm0, dword ptr [rip + 0x4a0064f]
0x13725b9: vmulss xmm4, xmm3, xmm3
0x13725bd: vmulss xmm1, xmm4, dword ptr [rip + 0x4a0061f]
0x13725c5: vsubss xmm0, xmm0, xmm1
0x13725c9: vmulss xmm1, xmm0, xmm4
0x13725cd: vsubss xmm1, xmm1, dword ptr [rip + 0x4a00667]
0x13725d5: vmulss xmm0, xmm1, xmm4
0x13725d9: vaddss xmm0, xmm0, dword ptr [rip + 0x4a006d7]
0x13725e1: vmulss xmm1, xmm0, xmm4
0x13725e5: vsubss xmm1, xmm1, dword ptr [rip + 0x4a00807]
0x13725ed: vmulss xmm0, xmm1, xmm4
0x13725f1: vaddss xmm2, xmm0, dword ptr [rip + 0x4a00abb]
0x13725f9: vmovss xmm0, dword ptr [rip + 0x4a00627]
0x1372601: vmulss xmm1, xmm4, dword ptr [rip + 0x4a005e7]
0x1372609: vsubss xmm0, xmm0, xmm1
0x137260d: vmulss xmm1, xmm0, xmm4
0x1372611: vsubss xmm1, xmm1, dword ptr [rip + 0x4a0064b]
0x1372619: vmulss xmm0, xmm1, xmm4
0x137261d: vaddss xmm0, xmm0, dword ptr [rip + 0x4a0071b]
0x1372625: vmulss xmm1, xmm0, xmm4
0x1372629: vmulss xmm3, xmm2, xmm3
0x137262d: vsubss xmm2, xmm1, xmm5
0x1372631: vmovss dword ptr [rcx], xmm3
0x1372635: vmulss xmm3, xmm2, xmm4
0x1372639: vaddss xmm0, xmm3, dword ptr [rip + 0x4a00a73]
0x1372641: vmulss xmm1, xmm0, xmm6
0x1372645: vmovaps xmm6, xmmword ptr [rsp]
0x137264a: vmovss dword ptr [rdx], xmm1
0x137264e: add rsp, 0x18
0x1372652: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0xd87d60
0xd87d60: push rbx
0xd87d62: sub rsp, 0x20
0xd87d66: mov rax, qword ptr [rcx + 0xa0]
0xd87d6d: mov rbx, rdx
0xd87d70: test rax, rax
0xd87d73: je 0x140d87d8e
0xd87d75: cmp qword ptr [rax + 8], 0
0xd87d7a: je 0x140d87d8e
0xd87d7c: mov rcx, qword ptr [rcx + 0x38]
0xd87d80: call 0x140d87d60
0xd87d85: mov rax, rbx
0xd87d88: add rsp, 0x20
0xd87d8c: pop rbx
0xd87d8d: ret 
0xd87d8e: mov rax, qword ptr [rcx + 0x68]
0xd87d92: mov qword ptr [rdx], rax
0xd87d95: mov rax, rbx
0xd87d98: add rsp, 0x20
0xd87d9c: pop rbx
0xd87d9d: ret 
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
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
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
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
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
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
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0x38ad90
0x38ad90: sub rsp, 0x28
0x38ad94: mov rax, rcx
0x38ad97: mov rcx, qword ptr [rcx]
0x38ad9a: test rcx, rcx
0x38ad9d: je 0x14038ade5
0x38ad9f: mov qword ptr [rax], 0
0x38ada6: cmp byte ptr [rcx + 0x14], 0
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
CALLEE 0x35b4b90
0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
CALLEE 0x3d5f80
0x3d5f80: push rbx
0x3d5f82: push rbp
0x3d5f83: push rsi
0x3d5f84: sub rsp, 0x30
0x3d5f88: mov rsi, qword ptr [rcx]
0x3d5f8b: mov rbp, rdx
0x3d5f8e: mov rbx, rcx
0x3d5f91: cmp rdx, qword ptr [rsi]
0x3d5f94: je 0x1403d606a
CALLEE 0x141fe80
0x141fe80: push rsi
0x141fe82: push rdi
0x141fe83: sub rsp, 0x38
0x141fe87: mov rdi, qword ptr [rcx]
0x141fe8a: mov rsi, 0xffffffffffffffff
CALLEE 0x1420260
0x1420260: push rbp
0x1420262: push rdi
0x1420263: push r15
0x1420265: sub rsp, 0x20
0x1420269: mov rdi, qword ptr [rcx]
0x142026c: mov r15, rcx
0x142026f: mov rbp, qword ptr [rdi]
0x1420272: test rbp, rbp
0x1420275: je 0x14142034d
0x142027b: cmp byte ptr [rbp], 0
0x142027f: je 0x14142034d
CALLEE 0x64b880
0x64b880: mov qword ptr [rsp + 0x10], rbx
0x64b885: mov qword ptr [rsp + 0x18], rbp
0x64b88a: push rsi
0x64b88b: push rdi
0x64b88c: push r12
0x64b88e: push r14
0x64b890: push r15
0x64b892: sub rsp, 0x30
0x64b896: mov r15, r9
0x64b899: mov r12, r8
0x64b89c: mov rbp, rdx
0x64b89f: mov r14, rcx
0x64b8a2: mov rcx, qword ptr [rcx]
0x64b8a5: mov rax, qword ptr [rcx + 0xa0]
0x64b8ac: test rax, rax
0x64b8af: je 0x14064b8bc
0x64b8b1: cmp qword ptr [rax + 8], 0
0x64b8b6: jne 0x14064ba67
0x64b8bc: mov rsi, qword ptr [rcx + 0x20]
0x64b8c0: cmp qword ptr [rsi + 0x30], 0
0x64b8c5: jne 0x14064ba24
0x64b8cb: mov edx, 0x1fd
0x64b8d0: mov rax, qword ptr gs:[0x58]
0x64b8d9: mov rcx, qword ptr [rax]
0x64b8dc: cmp byte ptr [rdx + rcx], 0
0x64b8e0: mov edx, 0x10
0x64b8e5: mov ecx, 0xb0
0x64b8ea: je 0x14064b8f3
0x64b8ec: call 0x1447efa78
0x64b8f1: jmp 0x14064b8f8
0x64b8f3: call 0x1447ef9b0
0x64b8f8: mov rbx, rax
0x64b8fb: test rax, rax
0x64b8fe: jne 0x14064b91b
0x64b900: call 0x141318e70
0x64b905: xor r9d, r9d
0x64b908: xor r8d, r8d
0x64b90b: mov edx, 1
0x64b910: mov ecx, 0xa0000002
0x64b915: call qword ptr [rip + 0x4b9f82d]
0x64b91b: mov qword ptr [rsp + 0x60], rbx
0x64b920: xor edi, edi
0x64b922: test rbx, rbx
0x64b925: je 0x14064ba0e
0x64b92b: mov dword ptr [rsp + 0x80], edi
0x64b932: mov r9d, 0x2ffff
0x64b938: mov r8d, 1
0x64b93e: lea rdx, [rip + 0x4f4114b]
0x64b945: lea rcx, [rsp + 0x80]
0x64b94d: call 0x1412becb0
0x64b952: mov dword ptr [rbx], edi
0x64b954: mov byte ptr [rbx + 4], dil
0x64b958: mov dword ptr [rbx + 8], edi
0x64b95b: mov byte ptr [rbx + 0xc], dil
0x64b95f: mov dword ptr [rbx + 0x10], edi
0x64b962: mov byte ptr [rbx + 0x14], dil
0x64b966: mov dword ptr [rbx + 0x18], edi
0x64b969: mov byte ptr [rbx + 0x1c], dil
0x64b96d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b974: mov byte ptr [rbx + 0x24], dil
0x64b978: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b97f: mov byte ptr [rbx + 0x2c], dil
0x64b983: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b98a: mov byte ptr [rbx + 0x34], dil
0x64b98e: mov dword ptr [rbx + 0x38], edi
0x64b991: mov byte ptr [rbx + 0x3c], dil
0x64b995: mov dword ptr [rbx + 0x40], edi
0x64b998: mov byte ptr [rbx + 0x44], dil
0x64b99c: mov dword ptr [rbx + 0x48], edi
0x64b99f: mov byte ptr [rbx + 0x4c], dil
0x64b9a3: mov dword ptr [rbx + 0x50], edi
0x64b9a6: mov byte ptr [rbx + 0x54], dil
0x64b9aa: mov dword ptr [rbx + 0x58], edi
0x64b9ad: mov byte ptr [rbx + 0x5c], dil
0x64b9b1: mov dword ptr [rbx + 0x60], edi
0x64b9b4: mov byte ptr [rbx + 0x64], dil
0x64b9b8: mov dword ptr [rbx + 0x68], edi
0x64b9bb: mov qword ptr [rbx + 0x70], rdi
0x64b9bf: mov qword ptr [rbx + 0x78], rdi
0x64b9c3: mov qword ptr [rbx + 0x80], rdi
0x64b9ca: mov qword ptr [rbx + 0x88], rdi
0x64b9d1: mov dword ptr [rbx + 0x90], edi
0x64b9d7: xor eax, eax
0x64b9d9: mov word ptr [rbx + 0x94], ax
0x64b9e0: mov byte ptr [rbx + 0x96], 1
0x64b9e7: mov qword ptr [rbx + 0x98], rdi
0x64b9ee: mov qword ptr [rbx + 0xa0], rdi
0x64b9f5: mov eax, dword ptr [rsp + 0x80]
0x64b9fc: mov dword ptr [rbx + 0xa8], eax
0x64ba02: mov dword ptr [rbx + 0xac], 0xff000000
0x64ba0c: jmp 0x14064ba11
0x64ba0e: mov rbx, rdi
0x64ba11: cmp rbx, qword ptr [rsi + 0x30]
0x64ba15: je 0x14064ba24
0x64ba17: lea rcx, [rsi + 0x30]
0x64ba1b: call 0x14061a7b0
0x64ba20: mov qword ptr [rsi + 0x30], rbx
0x64ba24: mov byte ptr [rsp + 0x80], 0
0x64ba2c: mov rax, qword ptr [r14]
0x64ba2f: mov rcx, qword ptr [rax + 0x20]
0x64ba33: lea rax, [rsp + 0x80]
0x64ba3b: mov qword ptr [rsp + 0x20], rax
0x64ba40: mov r9, r15
0x64ba43: mov r8, r12
0x64ba46: mov rdx, rbp
0x64ba49: mov rcx, qword ptr [rcx + 0x30]
0x64ba4d: call 0x14064d220
0x64ba52: cmp byte ptr [rsp + 0x80], 0
0x64ba5a: jne 0x14064ba67
0x64ba5c: mov rdx, rbp
0x64ba5f: mov rcx, r14
0x64ba62: call 0x1435c72e0
0x64ba67: mov rbx, qword ptr [rsp + 0x68]
0x64ba6c: mov rbp, qword ptr [rsp + 0x70]
0x64ba71: add rsp, 0x30
0x64ba75: pop r15
0x64ba77: pop r14
0x64ba79: pop r12
0x64ba7b: pop rdi
0x64ba7c: pop rsi
0x64ba7d: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35be010
0x35be010: mov qword ptr [rsp + 8], rbx
0x35be015: push rbp
0x35be016: push rsi
0x35be017: push rdi
0x35be018: push r12
0x35be01a: push r13
0x35be01c: push r14
0x35be01e: push r15
0x35be020: lea rbp, [rsp - 0x27]
0x35be025: sub rsp, 0xb0
0x35be02c: mov rdi, rdx
0x35be02f: mov r13, rcx
0x35be032: test rdx, rdx
0x35be035: je 0x1435be042
0x35be037: cmp qword ptr [rdx + 0x10], 0
0x35be03c: lea r14, [rdx + 0x28]
0x35be040: jne 0x1435be046
0x35be042: lea r14, [rcx + 0x18]
0x35be046: mov rax, qword ptr [r14]
0x35be049: xor r12d, r12d
0x35be04c: test rax, rax
0x35be04f: je 0x1435be2d8
0x35be055: mov rcx, qword ptr [rax]
0x35be058: test rcx, rcx
0x35be05b: je 0x1435be2d8
0x35be061: cmp dword ptr [rcx], r12d
0x35be064: je 0x1435be2d8
0x35be06a: cmp dword ptr [rcx + 4], -1
0x35be06e: je 0x1435be2d8
0x35be074: cmp qword ptr [rax + 8], r12
0x35be078: je 0x1435be2d8
0x35be07e: mov rcx, qword ptr [rax + 0x10]
0x35be082: test rcx, rcx
0x35be085: je 0x1435be2d8
0x35be08b: cmp byte ptr [rcx + 0xc0], r12b
0x35be092: jne 0x1435be2d8
0x35be098: mov qword ptr [rbp + 0x6f], r12
0x35be09c: lea rax, [rbp - 0x69]
0x35be0a0: mov qword ptr [rbp + 0x7f], rax
0x35be0a4: mov qword ptr [rbp - 0x69], r12
0x35be0a8: mov qword ptr [rbp - 0x61], r12
0x35be0ac: mov qword ptr [rbp - 0x59], r12
0x35be0b0: mov qword ptr [rbp - 0x51], r12
0x35be0b4: vpxor xmm0, xmm0, xmm0
0x35be0b8: vmovdqu xmmword ptr [rbp - 0x49], xmm0
0x35be0bd: mov qword ptr [rbp - 0x39], r12
0x35be0c1: mov byte ptr [rbp - 0x31], r12b
0x35be0c5: mov eax, dword ptr [rip + 0x37912f9]
0x35be0cb: mov dword ptr [rbp - 0x2d], eax
0x35be0ce: vmovdqu xmmword ptr [rbp - 0x29], xmm0
0x35be0d3: mov qword ptr [rbp - 0x19], r12
0x35be0d7: mov word ptr [rbp - 0x11], 0x11
0x35be0dd: mov eax, dword ptr [rip + 0x1f87b89]
0x35be0e3: mov dword ptr [rbp - 0xd], eax
0x35be0e6: mov byte ptr [rbp - 9], r12b
0x35be0ea: vmovdqu xmmword ptr [rbp - 1], xmm0
0x35be0ef: mov qword ptr [rbp + 0xf], r12
0x35be0f3: mov qword ptr [rbp + 0x17], r12
0x35be0f7: mov qword ptr [rbp + 0x1f], r12
0x35be0fb: mov qword ptr [rbp + 0x1f], r12
0x35be0ff: mov qword ptr [rbp + 0x6f], r12
0x35be103: mov rax, qword ptr [r14]
0x35be106: mov rcx, qword ptr [rax + 0x10]
0x35be10a: lea rbx, [rcx - 0x28]
0x35be10e: test rcx, rcx
0x35be111: cmove rbx, r12
0x35be115: mov dl, 8
0x35be117: lea rcx, [rbp - 0x69]
0x35be11b: call 0x14313b9d0
0x35be120: mov esi, 0xffffffff
0x35be125: mov edx, 0x1fd
0x35be12a: mov rcx, qword ptr [rbp - 0x21]
0x35be12e: test rcx, rcx
0x35be131: je 0x1435be187
0x35be133: lea rax, [rbx + 0x28]
0x35be137: test rbx, rbx
0x35be13a: cmove rax, r12
0x35be13e: cmp rax, qword ptr [rcx + 8]
0x35be142: je 0x1435be1b1
0x35be144: test rcx, rcx
0x35be147: je 0x1435be187
0x35be149: mov qword ptr [rbp - 0x21], r12
0x35be14d: cmp byte ptr [rcx + 4], r12b
0x35be151: je 0x1435be15d
0x35be153: mov eax, esi
0x35be155: lock xadd dword ptr [rcx], eax
0x35be159: dec eax
0x35be15b: jmp 0x1435be161
0x35be15d: dec dword ptr [rcx]
0x35be15f: mov eax, dword ptr [rcx]
0x35be161: test eax, eax
0x35be163: jne 0x1435be187
0x35be165: mov r8d, edx
0x35be168: mov rax, qword ptr gs:[0x58]
0x35be171: mov rdx, qword ptr [rax]
0x35be174: cmp byte ptr [r8 + rdx], 0
0x35be179: je 0x1435be182
0x35be17b: call 0x1447f03bc
0x35be180: jmp 0x1435be187
0x35be182: call 0x1447f02bc
0x35be187: test rbx, rbx
0x35be18a: je 0x1435be1b1
0x35be18c: cmp byte ptr [rbx + 0x3d], 0
0x35be190: jne 0x1435be1b1
0x35be192: lea rcx, [rbx + 0x28]
0x35be196: call 0x1403d5170
0x35be19b: mov qword ptr [rbp - 0x21], rax
0x35be19f: test rax, rax
0x35be1a2: je 0x1435be1b1
0x35be1a4: cmp byte ptr [rax + 4], 0
0x35be1a8: je 0x1435be1af
0x35be1aa: lock inc dword ptr [rax]
0x35be1ad: jmp 0x1435be1b1
0x35be1af: inc dword ptr [rax]
0x35be1b1: mov rax, qword ptr [r14]
0x35be1b4: mov rbx, qword ptr [rax + 0x10]
0x35be1b8: mov dl, 2
0x35be1ba: lea rcx, [rbp - 0x69]
0x35be1be: call 0x14313b9d0
0x35be1c3: lea rax, [rbx - 0x28]
0x35be1c7: test rbx, rbx
0x35be1ca: cmove rax, r12
0x35be1ce: mov qword ptr [rbp - 0x49], rax
0x35be1d2: mov dl, 0xd
0x35be1d4: lea rcx, [rbp - 0x69]
0x35be1d8: call 0x14313b9d0
0x35be1dd: mov qword ptr [rbp + 7], r12
0x35be1e1: mov dl, 0xe
0x35be1e3: lea rcx, [rbp - 0x69]
0x35be1e7: call 0x14313b9d0
0x35be1ec: mov byte ptr [rbp - 9], 0
0x35be1f0: mov qword ptr [rbp - 1], r12
0x35be1f4: mov r8b, 1
0x35be1f7: lea rdx, [rbp + 0x77]
0x35be1fb: lea rcx, [rbp - 0x69]
0x35be1ff: call 0x14313b0b0
0x35be204: mov r15, rax
0x35be207: mov rbx, qword ptr [r14]
0x35be20a: add rbx, 0x10
0x35be20e: cmp rax, rbx
0x35be211: je 0x1435be230
0x35be213: mov rcx, rbx
0x35be216: call 0x14038ad90
0x35be21b: mov rcx, qword ptr [r15]
0x35be21e: mov qword ptr [rbx], rcx
0x35be221: mov qword ptr [r15], r12
0x35be224: mov rax, qword ptr [rbx]
0x35be227: test rax, rax
0x35be22a: je 0x1435be230
0x35be22c: mov byte ptr [rax + 0x16], 1
0x35be230: lea rcx, [rbp + 0x77]
0x35be234: call 0x14038ad90
0x35be239: nop 
0x35be23a: lea rcx, [rbp + 0x1f]
0x35be23e: call 0x14038ad90
0x35be243: nop 
0x35be244: mov rcx, qword ptr [rbp + 0xf]
0x35be248: mov ebx, 0x1fd
0x35be24d: test rcx, rcx
0x35be250: je 0x1435be270
0x35be252: mov rax, qword ptr gs:[0x58]
0x35be25b: mov rdx, qword ptr [rax]
0x35be25e: cmp byte ptr [rbx + rdx], 0
0x35be262: je 0x1435be26b
0x35be264: call 0x1447f03bc
0x35be269: jmp 0x1435be270
0x35be26b: call 0x1447f02bc
0x35be270: mov qword ptr [rbp + 0xf], r12
0x35be274: mov qword ptr [rbp + 0x17], r12
0x35be278: lea rax, [rbp - 0x69]
0x35be27c: mov qword ptr [rbp + 0x6f], rax
0x35be280: mov rcx, qword ptr [rbp - 0x21]
0x35be284: test rcx, rcx
0x35be287: je 0x1435be2c5
0x35be289: mov qword ptr [rbp - 0x21], r12
0x35be28d: cmp byte ptr [rcx + 4], 0
0x35be291: je 0x1435be29b
0x35be293: lock xadd dword ptr [rcx], esi
0x35be297: dec esi
0x35be299: jmp 0x1435be29f
0x35be29b: dec dword ptr [rcx]
0x35be29d: mov esi, dword ptr [rcx]
0x35be29f: test esi, esi
0x35be2a1: jne 0x1435be2c5
0x35be2a3: mov r8d, ebx
0x35be2a6: mov rax, qword ptr gs:[0x58]
0x35be2af: mov rdx, qword ptr [rax]
0x35be2b2: cmp byte ptr [r8 + rdx], sil
0x35be2b6: je 0x1435be2bf
0x35be2b8: call 0x1447f03bc
0x35be2bd: jmp 0x1435be2c5
0x35be2bf: call 0x1447f02bc
0x35be2c4: nop 
0x35be2c5: lea rcx, [rbp - 0x59]
0x35be2c9: call 0x14044fa40
0x35be2ce: nop 
0x35be2cf: lea rcx, [rbp - 0x69]
0x35be2d3: call 0x14044fa40
0x35be2d8: test rdi, rdi
0x35be2db: je 0x1435be2ea
0x35be2dd: cmp qword ptr [rdi + 0x10], 0
0x35be2e2: je 0x1435be2ea
0x35be2e4: mov rcx, qword ptr [rdi + 0x28]
0x35be2e8: jmp 0x1435be2ee
0x35be2ea: mov rcx, qword ptr [r13 + 0x18]
0x35be2ee: test rcx, rcx
0x35be2f1: je 0x1435be304
0x35be2f3: mov rcx, qword ptr [rcx + 0x10]
0x35be2f7: lea rax, [rcx - 0x28]
0x35be2fb: test rcx, rcx
0x35be2fe: cmove rax, r12
0x35be302: jmp 0x1435be307
0x35be304: mov rax, r12
0x35be307: mov rbx, qword ptr [rsp + 0xf0]
0x35be30f: add rsp, 0xb0
0x35be316: pop r15
0x35be318: pop r14
0x35be31a: pop r13
0x35be31c: pop r12
0x35be31e: pop rdi
0x35be31f: pop rsi
0x35be320: pop rbp
0x35be321: ret 
CALLEE 0x39b93f0
0x39b93f0: mov qword ptr [rsp + 0x10], rbx
0x39b93f5: mov qword ptr [rsp + 0x18], rbp
0x39b93fa: push rsi
0x39b93fb: push rdi
0x39b93fc: push r14
0x39b93fe: sub rsp, 0x20
0x39b9402: mov r14, rdx
0x39b9405: mov rdi, rcx
0x39b9408: call 0x1439b7b80
0x39b940d: mov rbx, rax
0x39b9410: mov r9d, dword ptr [rdi + 0x80]
0x39b9417: xor esi, esi
0x39b9419: mov r8d, esi
0x39b941c: test r9d, r9d
0x39b941f: je 0x1439b9445
0x39b9421: mov r10, qword ptr [rdi + 0x78]
0x39b9425: mov r11d, dword ptr [r14]
0x39b9428: nop dword ptr [rax + rax]
0x39b9430: mov ecx, r8d
0x39b9433: mov rax, qword ptr [r10 + rcx*8]
0x39b9437: cmp dword ptr [rax + 0x28], r11d
0x39b943b: je 0x1439b94ac
0x39b943d: inc r8d
0x39b9440: cmp r8d, r9d
0x39b9443: jb 0x1439b9430
0x39b9445: mov qword ptr [rsp + 0x40], rsi
0x39b944a: test rbx, rbx
0x39b944d: je 0x1439b94bf
0x39b944f: mov rax, qword ptr [rdi + 0x140]
0x39b9456: test rax, rax
0x39b9459: je 0x1439b94bf
0x39b945b: mov rax, qword ptr [rax + 0x38]
0x39b945f: lea rcx, [rax - 0x28]
0x39b9463: test rax, rax
0x39b9466: cmove rcx, rsi
0x39b946a: cmp rbx, rcx
0x39b946d: je 0x1439b94bf
0x39b946f: mov rdx, r14
0x39b9472: mov rcx, rbx
0x39b9475: call 0x1439b9300
0x39b947a: test rax, rax
0x39b947d: je 0x1439b95e1
0x39b9483: lea rdx, [rsp + 0x58]
0x39b9488: mov rcx, rax
0x39b948b: call 0x1439bd670
0x39b9490: nop 
0x39b9491: mov rbp, qword ptr [rax]
0x39b9494: mov qword ptr [rsp + 0x40], rbp
0x39b9499: mov qword ptr [rax], rsi
0x39b949c: mov rcx, qword ptr [rsp + 0x58]
0x39b94a1: test rcx, rcx
0x39b94a4: je 0x1439b9538
0x39b94aa: jmp 0x1439b9529
0x39b94ac: or byte ptr [rdi + 0x138], 1
0x39b94b3: or byte ptr [rdi + 0x139], 1
0x39b94ba: jmp 0x1439b95e4
0x39b94bf: mov rbx, qword ptr [rdi + 0x140]
0x39b94c6: test rbx, rbx
0x39b94c9: je 0x1439b95e1
0x39b94cf: mov rcx, qword ptr [rbx + 0x40]
0x39b94d3: add rcx, 0x30
0x39b94d7: mov rdx, r14
0x39b94da: call 0x1404743a0
0x39b94df: test rax, rax
0x39b94e2: je 0x1439b95e1
0x39b94e8: mov rcx, qword ptr [rbx + 0x38]
0x39b94ec: lea rdx, [rcx + 0x50]
0x39b94f0: mov r8d, 0x78
0x39b94f6: test rcx, rcx
0x39b94f9: cmove rdx, r8
0x39b94fd: mov eax, dword ptr [rax]
0x39b94ff: mov rcx, qword ptr [rdx]
0x39b9502: lea rdx, [rsp + 0x58]
0x39b9507: mov rcx, qword ptr [rcx + rax*8]
0x39b950b: call 0x1439bd670
0x39b9510: nop 
0x39b9511: mov rbp, qword ptr [rax]
0x39b9514: mov qword ptr [rsp + 0x40], rbp
0x39b9519: mov qword ptr [rax], rsi
0x39b951c: mov rax, rbp
0x39b951f: mov rcx, qword ptr [rsp + 0x58]
0x39b9524: test rcx, rcx
0x39b9527: je 0x1439b953b
0x39b9529: mov rax, qword ptr [rcx]
0x39b952c: mov edx, 1
0x39b9531: call qword ptr [rax]
0x39b9533: mov qword ptr [rsp + 0x58], rsi
0x39b9538: mov rax, rbp
0x39b953b: mov edx, dword ptr [rax + 0x28]
0x39b953e: add rdx, rdx
0x39b9541: mov rax, qword ptr [rip + 0x32d37a0]
0x39b9548: mov rcx, qword ptr [rax + 0x58]
0x39b954c: mov ebx, dword ptr [rcx + rdx*8 + 8]
0x39b9550: shl rbx, 0x14
0x39b9554: or rbx, 0xffffe
0x39b955b: mov qword ptr [rsp + 0x40], rsi
0x39b9560: cmp qword ptr [rbp + 8], -1
0x39b9565: jne 0x1439b95c3
0x39b9567: mov edx, dword ptr [rdi + 0x80]
0x39b956d: cmp dword ptr [rdi + 0x84], edx
0x39b9573: ja 0x1439b9580
0x39b9575: inc edx
0x39b9577: lea rcx, [rdi + 0x78]
0x39b957b: call 0x140489ec0
0x39b9580: mov qword ptr [rbp + 8], rbx
0x39b9584: mov ecx, dword ptr [rdi + 0x80]
0x39b958a: mov rax, qword ptr [rdi + 0x78]
0x39b958e: mov qword ptr [rax + rcx*8], rbp
0x39b9592: mov ecx, dword ptr [rdi + 0x80]
0x39b9598: mov rax, qword ptr [rdi + 0x78]
0x39b959c: mov rcx, qword ptr [rax + rcx*8]
0x39b95a0: test rcx, rcx
0x39b95a3: je 0x1439b95bd
0x39b95a5: mov rdx, qword ptr [rdi + 0x88]
0x39b95ac: test rdx, rdx
0x39b95af: je 0x1439b95bd
0x39b95b1: mov rax, qword ptr [rcx]
0x39b95b4: xor r8d, r8d
0x39b95b7: call qword ptr [rax + 0x198]
0x39b95bd: inc dword ptr [rdi + 0x80]
0x39b95c3: or byte ptr [rdi + 0x138], 1
0x39b95ca: or byte ptr [rdi + 0x139], 1
0x39b95d1: mov ecx, dword ptr [rdi + 0x80]
0x39b95d7: dec ecx
0x39b95d9: mov rax, qword ptr [rdi + 0x78]
0x39b95dd: mov rsi, qword ptr [rax + rcx*8]
0x39b95e1: mov rax, rsi
0x39b95e4: mov rbx, qword ptr [rsp + 0x48]
0x39b95e9: mov rbp, qword ptr [rsp + 0x50]
0x39b95ee: add rsp, 0x20
0x39b95f2: pop r14
0x39b95f4: pop rdi
0x39b95f5: pop rsi
0x39b95f6: ret 
CALLEE 0x64f530
0x64f530: mov qword ptr [rsp + 0x10], rdx
0x64f535: push rbx
0x64f536: sub rsp, 0x30
0x64f53a: mov rbx, rdx
0x64f53d: mov dword ptr [rsp + 0x20], 0
0x64f545: mov rcx, qword ptr [rip + 0x6719c44]
0x64f54c: mov rcx, qword ptr [rcx + 0x30]
0x64f550: call 0x1408b4570
0x64f555: nop 
0x64f556: mov dword ptr [rsp + 0x20], 1
0x64f55e: mov rax, rbx
0x64f561: add rsp, 0x30
0x64f565: pop rbx
0x64f566: ret 
0x64f567: int3 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x17e9170
0x17e9170: sub rsp, 0x78
0x17e9174: vmovups xmm0, xmmword ptr [rcx + 0xa4]
0x17e917c: mov rax, qword ptr [rcx + 0xc8]
0x17e9183: lea r8, [rsp + 0x48]
0x17e9188: vmovups xmm1, xmmword ptr [rcx + 0xfc]
0x17e9190: vmovups xmmword ptr [rsp + 0x30], xmm0
0x17e9196: vmovups xmm0, xmmword ptr [rcx + 0xdc]
0x17e919e: lea rcx, [rsp + 0x30]
0x17e91a3: mov qword ptr [rsp + 0x40], rax
0x17e91a8: lea rdx, [rsp + 0x20]
0x17e91ad: vmovups xmmword ptr [rsp + 0x48], xmm0
0x17e91b3: vmovups xmmword ptr [rsp + 0x58], xmm1
0x17e91b9: call 0x1403936e0
0x17e91be: lea rcx, [rsp + 0x20]
0x17e91c3: call 0x140393bb0
0x17e91c8: add rsp, 0x78
0x17e91cc: ret 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x4f8220
0x4f8220: push rbx
0x4f8222: sub rsp, 0x80
0x4f8229: mov eax, dword ptr [rcx + 0xbc]
0x4f822f: mov rbx, rdx
0x4f8232: vmovsd xmm0, qword ptr [rcx + 0xb4]
0x4f823a: vmovsd xmm1, qword ptr [rcx + 0xf0]
0x4f8242: mov dword ptr [rsp + 0x28], eax
0x4f8246: movzx eax, word ptr [rcx + 0xc0]
0x4f824d: mov word ptr [rsp + 0x2c], ax
0x4f8252: movzx eax, word ptr [rcx + 0xc2]
0x4f8259: vmovsd qword ptr [rsp + 0x20], xmm0
0x4f825f: vmovups ymm0, ymmword ptr [rcx + 0xd0]
0x4f8267: mov word ptr [rsp + 0x2e], ax
0x4f826c: mov rax, qword ptr [rcx + 0xc8]
0x4f8273: vmovups ymmword ptr [rsp + 0x38], ymm0
0x4f8279: vmovups xmm0, xmmword ptr [rcx + 0xfc]
0x4f8281: mov qword ptr [rsp + 0x30], rax
0x4f8286: mov eax, dword ptr [rcx + 0xf8]
0x4f828c: lea rcx, [rsp + 0x38]
0x4f8291: mov dword ptr [rsp + 0x60], eax
0x4f8295: vmovsd qword ptr [rsp + 0x58], xmm1
0x4f829b: vmovups xmmword ptr [rsp + 0x64], xmm0
0x4f82a1: vzeroupper 
0x4f82a4: call 0x1403933a0
0x4f82a9: test al, al
0x4f82ab: je 0x1404f82c3
0x4f82ad: vmovups xmm0, xmmword ptr [rsp + 0x20]
0x4f82b3: vmovups xmmword ptr [rdx], xmm0
0x4f82b7: mov rax, rdx
0x4f82ba: add rsp, 0x80
0x4f82c1: pop rbx
0x4f82c2: ret 
0x4f82c3: lea r8, [rsp + 0x20]
0x4f82c8: lea rcx, [rsp + 0x38]
0x4f82cd: call 0x14050ea80
0x4f82d2: mov rax, rbx
0x4f82d5: add rsp, 0x80
0x4f82dc: pop rbx
0x4f82dd: ret 
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
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x4f8220
0x4f8220: push rbx
0x4f8222: sub rsp, 0x80
0x4f8229: mov eax, dword ptr [rcx + 0xbc]
0x4f822f: mov rbx, rdx
0x4f8232: vmovsd xmm0, qword ptr [rcx + 0xb4]
0x4f823a: vmovsd xmm1, qword ptr [rcx + 0xf0]
0x4f8242: mov dword ptr [rsp + 0x28], eax
0x4f8246: movzx eax, word ptr [rcx + 0xc0]
0x4f824d: mov word ptr [rsp + 0x2c], ax
0x4f8252: movzx eax, word ptr [rcx + 0xc2]
0x4f8259: vmovsd qword ptr [rsp + 0x20], xmm0
0x4f825f: vmovups ymm0, ymmword ptr [rcx + 0xd0]
0x4f8267: mov word ptr [rsp + 0x2e], ax
0x4f826c: mov rax, qword ptr [rcx + 0xc8]
0x4f8273: vmovups ymmword ptr [rsp + 0x38], ymm0
0x4f8279: vmovups xmm0, xmmword ptr [rcx + 0xfc]
0x4f8281: mov qword ptr [rsp + 0x30], rax
0x4f8286: mov eax, dword ptr [rcx + 0xf8]
0x4f828c: lea rcx, [rsp + 0x38]
0x4f8291: mov dword ptr [rsp + 0x60], eax
0x4f8295: vmovsd qword ptr [rsp + 0x58], xmm1
0x4f829b: vmovups xmmword ptr [rsp + 0x64], xmm0
0x4f82a1: vzeroupper 
0x4f82a4: call 0x1403933a0
0x4f82a9: test al, al
0x4f82ab: je 0x1404f82c3
0x4f82ad: vmovups xmm0, xmmword ptr [rsp + 0x20]
0x4f82b3: vmovups xmmword ptr [rdx], xmm0
0x4f82b7: mov rax, rdx
0x4f82ba: add rsp, 0x80
0x4f82c1: pop rbx
0x4f82c2: ret 
0x4f82c3: lea r8, [rsp + 0x20]
0x4f82c8: lea rcx, [rsp + 0x38]
0x4f82cd: call 0x14050ea80
0x4f82d2: mov rax, rbx
0x4f82d5: add rsp, 0x80
0x4f82dc: pop rbx
0x4f82dd: ret 
CALLEE 0xdecaf0
0xdecaf0: mov qword ptr [rsp + 0x10], rbx
0xdecaf5: push rdi
0xdecaf6: sub rsp, 0x20
0xdecafa: vmovss xmm0, dword ptr [rcx + 0xe0]
0xdecb02: vsubss xmm3, xmm0, dword ptr [rdx]
0xdecb06: vmovss xmm2, dword ptr [rip + 0x4f86292]
0xdecb0e: vcomiss xmm2, xmm3
0xdecb12: mov rdi, rdx
0xdecb15: mov rbx, rcx
0xdecb18: jb 0x140decb67
0xdecb1a: vmovss xmm1, dword ptr [rip + 0x4f86dde]
0xdecb22: vcomiss xmm3, xmm1
0xdecb26: jb 0x140decb67
0xdecb28: vmovss xmm0, dword ptr [rcx + 0xe4]
0xdecb30: vsubss xmm3, xmm0, dword ptr [rdx + 4]
0xdecb35: vcomiss xmm2, xmm3
0xdecb39: jb 0x140decb67
0xdecb3b: vcomiss xmm3, xmm1
0xdecb3f: jb 0x140decb67
0xdecb41: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdecb49: vsubss xmm3, xmm0, dword ptr [rdx + 8]
0xdecb4e: vcomiss xmm2, xmm3
0xdecb52: jb 0x140decb67
0xdecb54: vcomiss xmm3, xmm1
0xdecb58: jb 0x140decb67
0xdecb5a: xor al, al
0xdecb5c: mov rbx, qword ptr [rsp + 0x38]
0xdecb61: add rsp, 0x20
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
0xdecb91: call qword ptr [rax + 0x520]
0xdecb97: test al, al
0xdecb99: jne 0x140decc2a
0xdecb9f: vmovss xmm0, dword ptr [rdi]
0xdecba3: mov ecx, dword ptr [rbx + 0xec]
0xdecba9: vxorps xmm2, xmm2, xmm2
0xdecbad: vxorps xmm3, xmm3, xmm3
0xdecbb1: vcvtsi2ss xmm3, xmm3, dword ptr [rip + 0x5ec054f]
0xdecbb9: vdivss xmm1, xmm0, xmm3
0xdecbbd: vmovss xmm0, dword ptr [rdi + 8]
0xdecbc2: vroundss xmm2, xmm2, xmm1, 1
0xdecbc8: vcvttss2si eax, xmm2
0xdecbcc: mov dword ptr [rsp + 0x30], eax
0xdecbd0: vxorps xmm2, xmm2, xmm2
0xdecbd4: vdivss xmm1, xmm0, xmm3
0xdecbd8: vroundss xmm2, xmm2, xmm1, 1
0xdecbde: vcvttss2si edx, xmm2
0xdecbe2: mov dword ptr [rsp + 0x34], edx
0xdecbe6: cmp eax, ecx
0xdecbe8: jne 0x140decbf2
0xdecbea: cmp edx, dword ptr [rbx + 0xf0]
0xdecbf0: je 0x140decc2a
0xdecbf2: cmp ecx, 0x7fffffff
0xdecbf8: jne 0x140decc02
0xdecbfa: cmp dword ptr [rbx + 0xf0], ecx
0xdecc00: je 0x140decc1e
0xdecc02: mov rcx, qword ptr [rbx + 0x28]
0xdecc06: lea r9, [rsp + 0x30]
0xdecc0b: lea r8, [rbx + 0xec]
0xdecc12: mov rdx, rbx
0xdecc15: mov rax, qword ptr [rcx]
0xdecc18: call qword ptr [rax + 0x4d8]
0xdecc1e: mov rax, qword ptr [rsp + 0x30]
0xdecc23: mov qword ptr [rbx + 0xec], rax
0xdecc2a: mov rbx, qword ptr [rsp + 0x38]
0xdecc2f: mov al, 1
0xdecc31: add rsp, 0x20
0xdecc35: pop rdi
0xdecc36: ret 
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
CALLEE 0xd94040
0xd94040: mov rax, rsp
0xd94043: mov qword ptr [rax + 0x20], r9
0xd94047: mov qword ptr [rax + 0x18], r8
0xd9404b: mov byte ptr [rax + 0x10], dl
0xd9404e: mov qword ptr [rax + 8], rcx
0xd94052: push rbp
0xd94053: push rbx
0xd94054: push rsi
0xd94055: push rdi
0xd94056: push r12
0xd94058: push r13
0xd9405a: push r14
0xd9405c: push r15
0xd9405e: lea rbp, [rax - 0x968]
0xd94065: sub rsp, 0xa28
0xd9406c: vmovaps xmmword ptr [rax - 0x58], xmm6
0xd94071: vmovaps xmmword ptr [rax - 0x68], xmm7
0xd94076: vmovaps xmmword ptr [rax - 0x78], xmm8
0xd9407b: vmovaps xmmword ptr [rax - 0x88], xmm9
0xd94083: vmovaps xmmword ptr [rax - 0x98], xmm10
0xd9408b: vmovaps xmmword ptr [rax - 0xa8], xmm11
0xd94093: vmovaps xmmword ptr [rax - 0xb8], xmm12
0xd9409b: vmovaps xmmword ptr [rax - 0xc8], xmm13
0xd940a3: vmovaps xmmword ptr [rax - 0xd8], xmm14
0xd940ab: vmovaps xmmword ptr [rax - 0xe8], xmm15
0xd940b3: mov rsi, r9
0xd940b6: mov rdi, r8
0xd940b9: mov rbx, rcx
0xd940bc: xor r14d, r14d
0xd940bf: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd940c7: vsubss xmm2, xmm0, dword ptr [rip + 0x5f17919]
0xd940cf: vmovss xmm0, dword ptr [rip + 0x5f179b1]
0xd940d7: vsubss xmm1, xmm0, dword ptr [rip + 0x5f17909]
0xd940df: vdivss xmm3, xmm2, xmm1
0xd940e3: vmovss xmm2, dword ptr [rip + 0x4fdefc9]
0xd940eb: vsubss xmm10, xmm2, xmm3
0xd940ef: call 0x140d96760
0xd940f4: vmovaps xmm14, xmm0
0xd940f8: mov rax, qword ptr [rdi + 0xa0]
0xd940ff: test rax, rax
0xd94102: je 0x140d94127
0xd94104: cmp qword ptr [rax + 8], r14
0xd94108: jne 0x140d95e4c
0xd9410e: mov ecx, dword ptr [rdi + 0x48]
0xd94111: mov dword ptr [rbp - 0x80], ecx
0xd94114: cmp qword ptr [rax + 0x58], r14
0xd94118: je 0x140d9412d
0xd9411a: cmp ecx, 1
0xd9411d: jbe 0x140d95e4c
0xd94123: dec ecx
0xd94125: jmp 0x140d9412a
0xd94127: mov ecx, dword ptr [rdi + 0x48]
0xd9412a: mov dword ptr [rbp - 0x80], ecx
0xd9412d: mov edx, r14d
0xd94130: mov dword ptr [rbp - 0x7c], edx
0xd94133: test ecx, ecx
0xd94135: je 0x140d95e4c
0xd9413b: mov r8, r14
0xd9413e: mov qword ptr [rbp - 0x60], r14
0xd94142: mov r9, r14
0xd94145: mov qword ptr [rbp - 0x58], r14
0xd94149: lea r13, [rip + 0x47f9500]
0xd94150: mov r15d, 0xffff
0xd94156: vxorps xmm11, xmm11, xmm11
0xd9415b: vmovss xmm12, dword ptr [rip + 0x4fdf22d]
0xd94163: vmovss xmm13, dword ptr [rip + 0x4fdedc9]
0xd9416b: vmovss xmm15, dword ptr [rip + 0x4fdf70d]
0xd94173: mov rax, qword ptr [rdi + 0xa0]
0xd9417a: test rax, rax
0xd9417d: je 0x140d9418a
0xd9417f: cmp qword ptr [rax + 8], 0
0xd94184: jne 0x140d9422e
0xd9418a: mov ecx, dword ptr [rdi + 0x48]
0xd9418d: cmp ecx, edx
0xd9418f: jbe 0x140d9422e
0xd94195: test rax, rax
0xd94198: je 0x140d941c5
0xd9419a: cmp qword ptr [rax + 0x58], 0
0xd9419f: je 0x140d941c5
0xd941a1: cmp ecx, 1
0xd941a4: je 0x140d9422e
0xd941aa: mov rdi, qword ptr [rdi + 0x40]
0xd941ae: cmp edx, dword ptr [rax + 0x90]
0xd941b4: jae 0x140d941bc
0xd941b6: mov rdi, qword ptr [r9 + rdi]
0xd941ba: jmp 0x140d941cd
0xd941bc: lea eax, [rdx + 1]
0xd941bf: mov rdi, qword ptr [rdi + rax*8]
0xd941c3: jmp 0x140d941cd
0xd941c5: mov rax, qword ptr [rdi + 0x40]
0xd941c9: mov rdi, qword ptr [rax + r8*8]
0xd941cd: test rdi, rdi
0xd941d0: je 0x140d9422e
0xd941d2: mov rax, qword ptr [rdi + 0xa0]
0xd941d9: test rax, rax
0xd941dc: je 0x140d941e5
0xd941de: cmp qword ptr [rax + 8], 0
0xd941e3: jne 0x140d9422e
0xd941e5: mov rdi, qword ptr [rdi + 0xd8]
0xd941ec: test rdi, rdi
0xd941ef: jne 0x140d9420c
0xd941f1: test rax, rax
0xd941f4: je 0x140d9422e
0xd941f6: mov rcx, qword ptr [rax + 0x58]
0xd941fa: test rcx, rcx
0xd941fd: je 0x140d9422e
0xd941ff: call 0x143ed84d0
0xd94204: mov rdi, rax
0xd94207: test rax, rax
0xd9420a: je 0x140d9422e
0xd9420c: mov rax, qword ptr [rdi]
0xd9420f: lea rdx, [rip + 0x5f3beba]
0xd94216: mov rcx, rdi
0xd94219: call qword ptr [rax + 0x190]
0xd9421f: test al, al
0xd94221: cmove rdi, r14
0xd94225: test rdi, rdi
0xd94228: cmove rdi, r14
0xd9422c: jmp 0x140d94231
0xd9422e: mov rdi, r14
0xd94231: vmovd xmm1, r14d
0xd94236: movzx eax, byte ptr [rdi + 0x292]
0xd9423d: vmovd xmm0, eax
0xd94241: vpcmpeqd xmm2, xmm0, xmm1
0xd94245: vmovss xmm0, dword ptr [rbp + 0x998]
0xd9424d: vblendvps xmm9, xmm0, xmm11, xmm2
0xd94253: lea r12, [rdi + 0xde]
0xd9425a: mov rcx, r12
0xd9425d: call 0x140537250
0xd94262: cmp byte ptr [rax + 0xb0], 0
0xd94269: je 0x140d9465d
0xd9426f: movzx r15d, word ptr [r12]
0xd94274: vmovaps xmm7, xmm11
0xd94279: vmovaps xmm8, xmm11
0xd9427e: mov r8d, dword ptr [rdi + 0x1c0]
0xd94285: lea rdx, [rbp - 0x28]
0xd94289: call 0x14064f570
0xd9428e: nop 
0xd9428f: mov r9, qword ptr [rbp - 0x18]
0xd94293: test r9b, r9b
0xd94296: je 0x140d9444b
0xd9429c: mov rbx, qword ptr [rbp - 0x20]
0xd942a0: lea rdx, [rbx + 8]
0xd942a4: test rbx, rbx
0xd942a7: cmove rdx, r14
0xd942ab: mov rdx, qword ptr [rdx]
0xd942ae: lea rcx, [rbp - 0x38]
0xd942b2: call 0x140393df0
0xd942b7: nop 
0xd942b8: mov rcx, qword ptr [rbx + 0x68]
0xd942bc: lea rdx, [rbp + 0x30]
0xd942c0: mov rcx, qword ptr [rcx + 0x1a0]
0xd942c7: call 0x1404f8220
0xd942cc: movsx ecx, word ptr [rax + 0xe]
0xd942d0: vxorps xmm0, xmm0, xmm0
0xd942d4: vcvtsi2ss xmm0, xmm0, ecx
0xd942d8: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf414]
0xd942e0: vaddss xmm8, xmm1, dword ptr [rax + 8]
0xd942e5: vmovss xmm6, dword ptr [rax + 4]
0xd942ea: movsx ecx, word ptr [rax + 0xc]
0xd942ee: vxorps xmm0, xmm0, xmm0
0xd942f2: vcvtsi2ss xmm0, xmm0, ecx
0xd942f6: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf3f6]
0xd942fe: vaddss xmm7, xmm1, dword ptr [rax]
0xd94302: mov rcx, qword ptr [rbp - 0x38]
0xd94306: mov rax, qword ptr [rcx]
0xd94309: mov dl, 1
0xd9430b: call qword ptr [rax + 0x20]
0xd9430e: vmovss dword ptr [rbp - 0x50], xmm7
0xd94313: vmovss dword ptr [rbp - 0x4c], xmm6
0xd94318: vmovss dword ptr [rbp - 0x48], xmm8
0xd9431d: mov r10, qword ptr [rdi + 0x1e0]
0xd94324: test r10, r10
0xd94327: je 0x140d9443b
0xd9432d: mov r8, qword ptr [rbp - 0x20]
0xd94331: mov dl, 5
0xd94333: lea rcx, [rbp + 0x40]
0xd94337: call 0x142239930
0xd9433c: nop 
0xd9433d: mov qword ptr [rbp + 0x40], r13
0xd94341: mov qword ptr [rbp + 0x870], rsi
0xd94348: mov rcx, qword ptr [r10]
0xd9434b: mov rax, qword ptr [rcx]
0xd9434e: xor r8d, r8d
0xd94351: lea rdx, [rbp + 0x40]
0xd94355: cmp qword ptr [rbp + 0x868], r8
0xd9435c: jne 0x140d94363
0xd9435e: call qword ptr [rax + 8]
0xd94361: jmp 0x140d94366
0xd94363: call qword ptr [rax + 0x10]
0xd94366: movzx ebx, al
0xd94369: mov qword ptr [rbp + 0x40], r13
0xd9436d: lea rax, [rip + 0x47e0114]
0xd94374: mov qword ptr [rbp + 0x40], rax
0xd94378: lea rax, [rbp + 0x50]
0xd9437c: mov qword ptr [rbp + 0x18], rax
0xd94380: lea rcx, [rbp + 0x50]
0xd94384: call 0x1403a2ac0
0xd94389: mov ecx, r14d
0xd9438c: lea rdx, [rdi + 0x1e8]
0xd94393: mov rax, rdx
0xd94396: test bl, bl
0xd94398: jne 0x140d943e3
0xd9439a: nop word ptr [rax + rax]
0xd943a0: cmp byte ptr [rax], 0
0xd943a3: jne 0x140d943b3
0xd943a5: inc ecx
0xd943a7: inc rax
0xd943aa: cmp ecx, 3
0xd943ad: jb 0x140d943a0
0xd943af: xor cl, cl
0xd943b1: jmp 0x140d943b5
0xd943b3: mov cl, 1
0xd943b5: movzx eax, byte ptr [rdi + 0x1e9]
0xd943bc: bts eax, 3
0xd943c0: mov byte ptr [rdi + 0x1e9], al
0xd943c6: mov eax, r14d
0xd943c9: nop dword ptr [rax]
0xd943d0: cmp byte ptr [rdx], 0
0xd943d3: jne 0x140d94423
0xd943d5: inc eax
0xd943d7: inc rdx
0xd943da: cmp eax, 3
0xd943dd: jb 0x140d943d0
0xd943df: xor al, al
0xd943e1: jmp 0x140d94425
0xd943e3: cmp byte ptr [rax], 0
0xd943e6: jne 0x140d943f6
0xd943e8: inc ecx
0xd943ea: inc rax
0xd943ed: cmp ecx, 3
0xd943f0: jb 0x140d943e3
0xd943f2: xor cl, cl
0xd943f4: jmp 0x140d943f8
0xd943f6: mov cl, 1
0xd943f8: movzx eax, byte ptr [rdi + 0x1e9]
0xd943ff: btr eax, 3
0xd94403: mov byte ptr [rdi + 0x1e9], al
0xd94409: mov eax, r14d
0xd9440c: nop dword ptr [rax]
0xd94410: cmp byte ptr [rdx], 0
0xd94413: jne 0x140d94423
0xd94415: inc eax
0xd94417: inc rdx
0xd9441a: cmp eax, 3
0xd9441d: jb 0x140d94410
0xd9441f: xor al, al
0xd94421: jmp 0x140d94425
0xd94423: mov al, 1
0xd94425: cmp cl, al
0xd94427: je 0x140d9443b
0xd94429: mov rdx, qword ptr [rdi]
0xd9442c: mov rcx, rdi
0xd9442f: test al, al
0xd94431: je 0x140d94438
0xd94433: call qword ptr [rdx + 0x28]
0xd94436: jmp 0x140d9443b
0xd94438: call qword ptr [rdx + 0x20]
0xd9443b: lea rdx, [rbp - 0x50]
0xd9443f: mov rcx, rdi
0xd94442: call 0x140decaf0
0xd94447: mov r9, qword ptr [rbp - 0x18]
0xd9444b: mov esi, 0x1ec
0xd94450: mov rax, qword ptr gs:[0x58]
0xd94459: mov r14, qword ptr [rax]
0xd9445c: movzx edx, byte ptr [rsi + r14]
0xd94461: mov r8, qword ptr [rip + 0x5fd50c0]
0xd94468: mov rax, r8
0xd9446b: mov r10, qword ptr [rip + 0x5fd50be]
0xd94472: test dl, dl
0xd94474: cmovne rax, r10
0xd94478: mov rax, qword ptr [rax]
0xd9447b: mov rcx, qword ptr [rax + 8]
0xd9447f: mov rax, qword ptr [rcx + 0x270]
0xd94486: cmp r15w, word ptr [rax + 0xf8]
0xd9448e: jne 0x140d94518
0xd94494: vmovaps xmm2, xmm11
0xd94499: test r9b, r9b
0xd9449c: je 0x140d9450c
0xd9449e: mov rbx, qword ptr [rbp - 0x20]
0xd944a2: lea rdx, [rbx + 8]
0xd944a6: test rbx, rbx
0xd944a9: mov ecx, 0
0xd944ae: cmove rdx, rcx
0xd944b2: mov rdx, qword ptr [rdx]
0xd944b5: lea rcx, [rbp - 0x30]
0xd944b9: call 0x140393df0
0xd944be: nop 
0xd944bf: mov rcx, qword ptr [rbx + 0x68]
0xd944c3: mov rcx, qword ptr [rcx + 0x1a0]
0xd944ca: call 0x1417e9170
0xd944cf: vmovaps xmm6, xmm0
0xd944d3: mov rcx, qword ptr [rbp - 0x30]
0xd944d7: mov rax, qword ptr [rcx]
0xd944da: mov dl, 1
0xd944dc: call qword ptr [rax + 0x20]
0xd944df: vcomiss xmm11, xmm6
0xd944e3: jbe 0x140d944ec
0xd944e5: vaddss xmm0, xmm6, xmm12
0xd944ea: jmp 0x140d944f1
0xd944ec: vsubss xmm0, xmm6, xmm12
0xd944f1: vmulss xmm2, xmm0, dword ptr [rip + 0x4fdf053]
0xd944f9: movzx edx, byte ptr [rsi + r14]
0xd944fe: mov r10, qword ptr [rip + 0x5fd502b]
0xd94505: mov r8, qword ptr [rip + 0x5fd501c]
0xd9450c: vmulss xmm1, xmm13, dword ptr [rdi + 0x1d0]
0xd94514: vsubss xmm9, xmm2, xmm1
0xd94518: mov rax, r8
0xd9451b: test dl, dl
0xd9451d: cmovne rax, r10
0xd94521: mov rax, qword ptr [rax]
0xd94524: mov rcx, qword ptr [rax + 8]
0xd94528: mov rax, qword ptr [rcx + 0x270]
0xd9452f: cmp r15w, word ptr [rax + 0x10a]
0xd94537: je 0x140d9455b
0xd94539: test dl, dl
0xd9453b: cmovne r8, r10
0xd9453f: mov rax, qword ptr [r8]
0xd94542: mov rcx, qword ptr [rax + 8]
0xd94546: mov rax, qword ptr [rcx + 0x270]
0xd9454d: cmp r15w, word ptr [rax + 0xf8]
0xd94555: jne 0x140d94639
0xd9455b: mov rax, qword ptr [rbp + 0x990]
0xd94562: vsubss xmm2, xmm8, dword ptr [rax + 8]
0xd94567: vsubss xmm0, xmm7, dword ptr [rax]
0xd9456b: vmovss xmm3, dword ptr [rip + 0x5f1a295]
0xd94573: vmulss xmm1, xmm0, xmm0
0xd94577: vmulss xmm0, xmm2, xmm2
0xd9457b: vaddss xmm2, xmm1, xmm0
0xd9457f: vmulss xmm1, xmm3, xmm3
0xd94583: xor r14d, r14d
0xd94586: lea rdx, [rdi + 0x1e8]
0xd9458d: mov ecx, r14d
0xd94590: mov rax, rdx
0xd94593: vcomiss xmm1, xmm2
0xd94597: jb 0x140d945e8
0xd94599: nop dword ptr [rax]
0xd945a0: cmp byte ptr [rax], r14b
0xd945a3: jne 0x140d945b3
0xd945a5: inc ecx
0xd945a7: inc rax
0xd945aa: cmp ecx, 3
0xd945ad: jb 0x140d945a0
0xd945af: xor cl, cl
0xd945b1: jmp 0x140d945b5
0xd945b3: mov cl, 1
0xd945b5: movzx eax, byte ptr [rdi + 0x1e9]
0xd945bc: btr eax, 2
0xd945c0: mov byte ptr [rdi + 0x1e9], al
0xd945c6: mov eax, r14d
0xd945c9: nop dword ptr [rax]
0xd945d0: cmp byte ptr [rdx], r14b
0xd945d3: jne 0x140d94624
0xd945d5: inc eax
0xd945d7: inc rdx
0xd945da: cmp eax, 3
0xd945dd: jb 0x140d945d0
0xd945df: xor al, al
0xd945e1: jmp 0x140d94626
0xd945e3: call qword ptr [rdx + 0x20]
0xd945e6: jmp 0x140d9463c
0xd945e8: cmp byte ptr [rax], r14b
0xd945eb: jne 0x140d945fb
0xd945ed: inc ecx
0xd945ef: inc rax
0xd945f2: cmp ecx, 3
0xd945f5: jb 0x140d945e8
0xd945f7: xor cl, cl
0xd945f9: jmp 0x140d945fd
0xd945fb: mov cl, 1
0xd945fd: movzx eax, byte ptr [rdi + 0x1e9]
0xd94604: bts eax, 2
0xd94608: mov byte ptr [rdi + 0x1e9], al
0xd9460e: mov eax, r14d
0xd94611: cmp byte ptr [rdx], r14b
0xd94614: jne 0x140d94624
0xd94616: inc eax
0xd94618: inc rdx
0xd9461b: cmp eax, 3
0xd9461e: jb 0x140d94611
0xd94620: xor al, al
0xd94622: jmp 0x140d94626
0xd94624: mov al, 1
0xd94626: cmp cl, al
0xd94628: je 0x140d9463c
0xd9462a: mov rdx, qword ptr [rdi]
0xd9462d: mov rcx, rdi
0xd94630: test al, al
0xd94632: je 0x140d945e3
0xd94634: call qword ptr [rdx + 0x28]
0xd94637: jmp 0x140d9463c
0xd94639: xor r14d, r14d
0xd9463c: lea rax, [rip + 0x4991805]
0xd94643: mov qword ptr [rbp - 0x28], rax
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
0xd94687: vmovss xmm1, dword ptr [rbx + 0xabc]
0xd9468f: mov rcx, rdi
0xd94692: call 0x140d91820
0xd94697: vmovaps xmm8, xmm0
0xd9469b: mov r13b, 1
0xd9469e: mov byte ptr [rbp + 0x978], r13b
0xd946a5: mov ecx, dword ptr [rbx + 0xbf8]
0xd946ab: cmp ecx, 2
0xd946ae: je 0x140d947e9
0xd946b4: lea eax, [rcx - 4]
0xd946b7: cmp eax, 1
0xd946ba: jbe 0x140d947e9
0xd946c0: cmp ecx, 1
0xd946c3: jne 0x140d94a6c
0xd946c9: movzx eax, word ptr [r12]
0xd946ce: mov word ptr [rbp + 0x978], ax
0xd946d5: cmp dword ptr [rdi + 0xd8], -1
0xd946dc: jne 0x140d946e8
0xd946de: cmp ax, r15w
0xd946e2: je 0x140d94a6c
0xd946e8: lea rcx, [rbp + 0x978]
0xd946ef: call 0x140537250
0xd946f4: mov ecx, dword ptr [rax + 0x2c]
0xd946f7: cmp ecx, 0x16
0xd946fa: je 0x140d9470d
0xd946fc: lea eax, [rcx - 0x5a]
0xd946ff: cmp eax, 3
0xd94702: jbe 0x140d9470d
0xd94704: cmp ecx, 0x17
0xd94707: jne 0x140d94a6c
0xd9470d: xor r13b, r13b
0xd94710: mov rax, qword ptr [rdi + 0x118]
0xd94717: mov rcx, qword ptr [rax + 0x20]
0xd9471b: mov byte ptr [rsp + 0x4c], 0x52
0xd94720: lea rdx, [rsp + 0x4c]
0xd94725: call 0x1435c9320
0xd9472a: mov r9, qword ptr [rdi + 0x118]
0xd94731: test r9, r9
0xd94734: je 0x140d94787
0xd94736: mov r10, qword ptr [r9 + 0x20]
0xd9473a: mov rax, qword ptr [r10]
0xd9473d: mov rcx, qword ptr [rax + 0xa0]
0xd94744: test rcx, rcx
0xd94747: je 0x140d94750
0xd94749: cmp qword ptr [rcx + 8], 0
0xd9474e: jne 0x140d9477f
0xd94750: mov r10, qword ptr [r10 + 8]
0xd94754: mov edx, r14d
0xd94757: mov r8d, dword ptr [r10 + 8]
0xd9475b: test r8d, r8d
0xd9475e: je 0x140d9477f
0xd94760: mov r10, qword ptr [r10]
0xd94763: mov eax, dword ptr [rip + 0x5f3bcfb]
0xd94769: nop dword ptr [rax]
0xd94770: mov ecx, edx
0xd94772: cmp eax, dword ptr [r10 + rcx*4]
0xd94776: je 0x140d9477f
0xd94778: inc edx
0xd9477a: cmp edx, r8d
0xd9477d: jb 0x140d94770
0xd9477f: and byte ptr [r9 + 0xb4], 0xf7
0xd94787: mov r9, qword ptr [rdi + 0x260]
0xd9478e: test r9, r9
0xd94791: je 0x140d947dd
0xd94793: mov r10, qword ptr [r9 + 0x20]
0xd94797: mov rax, qword ptr [r10]
0xd9479a: mov rcx, qword ptr [rax + 0xa0]
0xd947a1: test rcx, rcx
0xd947a4: je 0x140d947ad
0xd947a6: cmp qword ptr [rcx + 8], 0
0xd947ab: jne 0x140d947d5
0xd947ad: mov r10, qword ptr [r10 + 8]
0xd947b1: mov edx, r14d
0xd947b4: mov r8d, dword ptr [r10 + 8]
0xd947b8: test r8d, r8d
0xd947bb: je 0x140d947d5
0xd947bd: mov r10, qword ptr [r10]
0xd947c0: mov eax, dword ptr [rip + 0x5f3bc9e]
0xd947c6: mov ecx, edx
0xd947c8: cmp eax, dword ptr [r10 + rcx*4]
0xd947cc: je 0x140d947d5
0xd947ce: inc edx
0xd947d0: cmp edx, r8d
0xd947d3: jb 0x140d947c6
0xd947d5: and byte ptr [r9 + 0xb4], 0xf7
0xd947dd: mov byte ptr [rdi + 0x2b9], 1
0xd947e4: jmp 0x140d94a6c
0xd947e9: mov ecx, dword ptr [rdi + 0xd8]
0xd947ef: mov dword ptr [rsp + 0x48], ecx
0xd947f3: movzx eax, word ptr [r12]
0xd947f8: mov word ptr [rsp + 0x44], ax
0xd947fd: cmp ecx, -1
0xd94800: jne 0x140d9480e
0xd94802: cmp ax, r15w
0xd94806: je 0x140d94a6c
0xd9480c: jmp 0x140d94814
0xd9480e: cmp ax, r15w
0xd94812: je 0x140d9483c
0xd94814: mov eax, dword ptr [rdi + 0x2b0]
0xd9481a: test eax, eax
0xd9481c: je 0x140d94826
0xd9481e: shr eax, 2
0xd94821: and al, r13b
0xd94824: jmp 0x140d94838
0xd94826: mov rcx, r12
0xd94829: call 0x140537250
0xd9482e: cmp byte ptr [rax + 0xa8], 2
0xd94835: sete al
0xd94838: test al, al
0xd9483a: jne 0x140d94872
0xd9483c: cmp word ptr [r12], r15w
0xd94841: je 0x140d9486f
0xd94843: mov eax, dword ptr [rdi + 0x2b0]
0xd94849: test eax, eax
0xd9484b: je 0x140d94855
0xd9484d: shr eax, 3
0xd94850: and al, r13b
0xd94853: jmp 0x140d9486b
0xd94855: lea rcx, [rdi + 0xde]
0xd9485c: call 0x140537250
0xd94861: cmp byte ptr [rax + 0xa8], 3
0xd94868: sete al
0xd9486b: test al, al
0xd9486d: jne 0x140d94872
0xd9486f: xor r13b, r13b
0xd94872: lea rcx, [rsp + 0x48]
0xd94877: call 0x140473f20
0xd9487c: movzx r15d, byte ptr [rax + 0x3d1]
0xd94884: lea rcx, [rsp + 0x44]
0xd94889: call 0x140537250
0xd9488e: cmp dword ptr [rax + 0x2c], 0x1e
0xd94892: je 0x140d948b8
0xd94894: lea rcx, [rsp + 0x44]
0xd94899: call 0x140537250
0xd9489e: cmp dword ptr [rax + 0x2c], 0x20
0xd948a2: je 0x140d948b8
0xd948a4: lea rcx, [rsp + 0x44]
0xd948a9: call 0x140537250
0xd948ae: cmp dword ptr [rax + 0x2c], 0x21
0xd948b2: je 0x140d948b8
0xd948b4: xor bl, bl
0xd948b6: jmp 0x140d948ba
0xd948b8: mov bl, 1
0xd948ba: lea rcx, [rsp + 0x44]
0xd948bf: call 0x140537250
0xd948c4: mov r12d, dword ptr [rax + 0x2c]
0xd948c8: lea rcx, [rsp + 0x44]
0xd948cd: call 0x140537250
0xd948d2: mov r14d, dword ptr [rax + 0x2c]
0xd948d6: mov rax, qword ptr [rdi + 0xd0]
0xd948dd: cmp al, 9
0xd948df: jne 0x140d948fc
0xd948e1: mov eax, dword ptr [rdi + 0xc8]
0xd948e7: mov word ptr [rsp + 0x48], ax
0xd948ec: lea rcx, [rsp + 0x48]
0xd948f1: call 0x140433650
0xd948f6: movzx esi, byte ptr [rax + 0x62]
0xd948fa: jmp 0x140d948ff
0xd948fc: xor sil, sil
0xd948ff: lea rcx, [rsp + 0x44]
0xd94904: call 0x140537250
0xd94909: test r15b, r15b
0xd9490c: jne 0x140d9493d
0xd9490e: test bl, bl
0xd94910: jne 0x140d9493d
0xd94912: cmp r14d, 0x5e
0xd94916: je 0x140d9493d
0xd94918: cmp byte ptr [rax + 0xbc], bl
0xd9491e: jne 0x140d9493d
0xd94920: test sil, sil
0xd94923: jne 0x140d9493d
0xd94925: cmp r12d, 0x24
0xd94929: je 0x140d9493d
0xd9492b: cmp byte ptr [rdi + 0x2b6], sil
0xd94932: jne 0x140d9493d
0xd94934: test r13b, r13b
0xd94937: je 0x140d94a64
0xd9493d: xor r13b, r13b
0xd94940: mov rax, qword ptr [rdi + 0x118]
0xd94947: mov rcx, qword ptr [rax + 0x20]
0xd9494b: mov byte ptr [rsp + 0x4d], 0x52
0xd94950: lea rdx, [rsp + 0x4d]
0xd94955: call 0x1435c9320
0xd9495a: mov r9, qword ptr [rdi + 0x118]
0xd94961: test r9, r9
0xd94964: je 0x140d949e2
0xd94966: mov r10, qword ptr [r9 + 0x20]
0xd9496a: mov rax, qword ptr [r10]
0xd9496d: mov rcx, qword ptr [rax + 0xa0]
0xd94974: test rcx, rcx
0xd94977: je 0x140d94980
0xd94979: cmp qword ptr [rcx + 8], 0
0xd9497e: jne 0x140d949b6
0xd94980: mov r10, qword ptr [r10 + 8]
0xd94984: xor eax, eax
0xd94986: mov edx, eax
0xd94988: mov r8d, dword ptr [r10 + 8]
0xd9498c: test r8d, r8d
0xd9498f: je 0x140d949b6
0xd94991: mov r10, qword ptr [r10]
0xd94994: mov eax, dword ptr [rip + 0x5f3baca]
0xd9499a: nop word ptr [rax + rax]
0xd949a0: mov ecx, edx
0xd949a2: cmp eax, dword ptr [r10 + rcx*4]
0xd949a6: je 0x140d949b1
0xd949a8: inc edx
0xd949aa: cmp edx, r8d
0xd949ad: jb 0x140d949a0
0xd949af: jmp 0x140d949b6
0xd949b1: cmp edx, -1
0xd949b4: jne 0x140d949d1
0xd949b6: mov r11, qword ptr [rbp + 0x970]
0xd949bd: cmp byte ptr [r11 + 0xace], 1
0xd949c5: je 0x140d949d8
0xd949c7: and byte ptr [r9 + 0xb4], 0xf7
0xd949cf: jmp 0x140d949e9
0xd949d1: mov r11, qword ptr [rbp + 0x970]
0xd949d8: and byte ptr [r9 + 0xb4], 0xf7
0xd949e0: jmp 0x140d949e9
0xd949e2: mov r11, qword ptr [rbp + 0x970]
0xd949e9: mov r9, qword ptr [rdi + 0x260]
0xd949f0: test r9, r9
0xd949f3: je 0x140d947dd
0xd949f9: mov r10, qword ptr [r9 + 0x20]
0xd949fd: mov rax, qword ptr [r10]
0xd94a00: mov rcx, qword ptr [rax + 0xa0]
0xd94a07: test rcx, rcx
0xd94a0a: je 0x140d94a17
0xd94a0c: cmp qword ptr [rcx + 8], 0
0xd94a11: jne 0x140d947d5
0xd94a17: mov r10, qword ptr [r10 + 8]
0xd94a1b: xor eax, eax
0xd94a1d: mov edx, eax
0xd94a1f: mov r8d, dword ptr [r10 + 8]
0xd94a23: test r8d, r8d
0xd94a26: je 0x140d947d5
0xd94a2c: mov r10, qword ptr [r10]
0xd94a2f: mov eax, dword ptr [rip + 0x5f3ba2f]
0xd94a35: nop word ptr [rax + rax]
0xd94a40: mov ecx, edx
0xd94a42: cmp eax, dword ptr [r10 + rcx*4]
0xd94a46: je 0x140d947d5
0xd94a4c: inc edx
0xd94a4e: cmp edx, r8d
0xd94a51: jb 0x140d94a40
0xd94a53: and byte ptr [r9 + 0xb4], 0xf7
0xd94a5b: mov byte ptr [rdi + 0x2b9], 1
0xd94a62: jmp 0x140d94a6c
0xd94a64: movzx r13d, byte ptr [rbp + 0x978]
0xd94a6c: mov rax, qword ptr [rdi + 0x118]
0xd94a73: mov rcx, qword ptr [rax + 0x20]
0xd94a77: mov byte ptr [rsp + 0x4e], 6
0xd94a7c: lea r8, [rsp + 0x4e]
0xd94a81: lea rdx, [rbp - 8]
0xd94a85: call 0x1435c8ef0
0xd94a8a: mov rax, qword ptr [rdi + 0x118]
0xd94a91: mov rcx, qword ptr [rax + 0x20]
0xd94a95: mov byte ptr [rsp + 0x4f], 9
0xd94a9a: lea r8, [rsp + 0x4f]
0xd94a9f: lea rdx, [rbp + 8]
0xd94aa3: call 0x1435c8ef0
0xd94aa8: vmovaps xmm6, xmm11
0xd94aad: vmovaps xmm7, xmm11
0xd94ab2: lea rcx, [rbp - 8]
0xd94ab6: call 0x140615320
0xd94abb: movzx ecx, byte ptr [rax + 0xc]
0xd94abf: lea rbx, [rip + 0x5ef86ba]
0xd94ac6: mov rcx, qword ptr [rbx + rcx*8]
0xd94aca: mov rdx, rax
0xd94acd: mov rcx, qword ptr [rcx + 0x18]
0xd94ad1: call 0x143598390
0xd94ad6: test al, al
0xd94ad8: jne 0x140d94af0
0xd94ada: lea rcx, [rbp - 8]
0xd94ade: call 0x140615320
0xd94ae3: cmp byte ptr [rax + 0xe], 0
0xd94ae7: je 0x140d94aec
0xd94ae9: mov rax, qword ptr [rax]
0xd94aec: vmovss xmm6, dword ptr [rax]
0xd94af0: lea rcx, [rbp + 8]
0xd94af4: call 0x140615320
0xd94af9: movzx ecx, byte ptr [rax + 0xc]
0xd94afd: mov rcx, qword ptr [rbx + rcx*8]
0xd94b01: mov rdx, rax
0xd94b04: mov rcx, qword ptr [rcx + 0x18]
0xd94b08: call 0x143598390
0xd94b0d: test al, al
0xd94b0f: jne 0x140d94b27
0xd94b11: lea rcx, [rbp + 8]
0xd94b15: call 0x140615320
0xd94b1a: cmp byte ptr [rax + 0xe], 0
0xd94b1e: je 0x140d94b23
0xd94b20: mov rax, qword ptr [rax]
0xd94b23: vmovss xmm7, dword ptr [rax]
0xd94b27: vmovss dword ptr [rbp - 0x70], xmm6
0xd94b2c: vmovss dword ptr [rbp - 0x6c], xmm7
0xd94b31: lea rcx, [rdi + 0xde]
0xd94b38: call 0x140537250
0xd94b3d: movzx ecx, byte ptr [rax + 0xb1]
0xd94b44: vmovss dword ptr [rsp + 0x38], xmm14
0xd94b4a: mov byte ptr [rsp + 0x30], cl
0xd94b4e: movzx eax, byte ptr [rdi + 0x1eb]
0xd94b55: mov byte ptr [rsp + 0x28], al
0xd94b59: vmovss dword ptr [rsp + 0x20], xmm8
0xd94b5f: mov rbx, qword ptr [rbp - 0x70]
0xd94b63: mov r9, rbx
0xd94b66: mov r8, qword ptr [rbp - 0x68]
0xd94b6a: mov rdx, qword ptr [rdi + 8]
0xd94b6e: mov r12, qword ptr [rbp + 0x970]
0xd94b75: mov rcx, r12
0xd94b78: call 0x140d91660
0xd94b7d: movzx r15d, al
0xd94b81: mov byte ptr [rdi + 0x1eb], al
0xd94b87: mov byte ptr [rdi + 0x1ec], 1
0xd94b8e: mov rdx, rdi
0xd94b91: mov rcx, r12
0xd94b94: call 0x140db2510
0xd94b99: mov r8, qword ptr [rdi + 8]
0xd94b9d: test r15b, r15b
0xd94ba0: jne 0x140d94c1b
0xd94ba2: test r8, r8
0xd94ba5: je 0x140d95dff
0xd94bab: mov r10, qword ptr [r8 + 0x20]
0xd94baf: mov rax, qword ptr [r10]
0xd94bb2: mov rcx, qword ptr [rax + 0xa0]
0xd94bb9: test rcx, rcx
0xd94bbc: je 0x140d94bc5
0xd94bbe: cmp qword ptr [rcx + 8], 0
0xd94bc3: jne 0x140d94bf6
0xd94bc5: mov r10, qword ptr [r10 + 8]
0xd94bc9: xor eax, eax
0xd94bcb: mov edx, eax
0xd94bcd: mov r9d, dword ptr [r10 + 8]
0xd94bd1: test r9d, r9d
0xd94bd4: je 0x140d94bf6
0xd94bd6: mov r10, qword ptr [r10]
0xd94bd9: mov eax, dword ptr [rip + 0x5f3b885]
0xd94bdf: nop 
0xd94be0: mov ecx, edx
0xd94be2: cmp eax, dword ptr [r10 + rcx*4]
0xd94be6: je 0x140d94bf1
0xd94be8: inc edx
0xd94bea: cmp edx, r9d
0xd94bed: jb 0x140d94be0
0xd94bef: jmp 0x140d94bf6
0xd94bf1: cmp edx, -1
0xd94bf4: jne 0x140d94c0e
0xd94bf6: cmp byte ptr [r12 + 0xace], 1
0xd94bff: je 0x140d94c0e
0xd94c01: or byte ptr [r8 + 0xb4], 8
0xd94c09: jmp 0x140d95dff
0xd94c0e: and byte ptr [r8 + 0xb4], 0xf7
0xd94c16: jmp 0x140d95dff
0xd94c1b: test r8, r8
0xd94c1e: je 0x140d94c6b
0xd94c20: mov r10, qword ptr [r8 + 0x20]
0xd94c24: mov rax, qword ptr [r10]
0xd94c27: mov rcx, qword ptr [rax + 0xa0]
0xd94c2e: test rcx, rcx
0xd94c31: je 0x140d94c3a
0xd94c33: cmp qword ptr [rcx + 8], 0
0xd94c38: jne 0x140d94c63
0xd94c3a: mov r10, qword ptr [r10 + 8]
0xd94c3e: xor eax, eax
0xd94c40: mov edx, eax
0xd94c42: mov r9d, dword ptr [r10 + 8]
0xd94c46: test r9d, r9d
0xd94c49: je 0x140d94c63
0xd94c4b: mov r10, qword ptr [r10]
0xd94c4e: mov eax, dword ptr [rip + 0x5f3b810]
0xd94c54: mov ecx, edx
0xd94c56: cmp eax, dword ptr [r10 + rcx*4]
0xd94c5a: je 0x140d94c63
0xd94c5c: inc edx
0xd94c5e: cmp edx, r9d
0xd94c61: jb 0x140d94c54
0xd94c63: and byte ptr [r8 + 0xb4], 0xf7
0xd94c6b: mov rax, qword ptr gs:[0x58]
0xd94c74: mov rsi, qword ptr [rax]
0xd94c77: mov r14d, 0x1ec
0xd94c7d: mov rax, qword ptr [rip + 0x5fd48a4]
0xd94c84: cmp byte ptr [r14 + rsi], 0
0xd94c89: cmovne rax, qword ptr [rip + 0x5fd489f]
0xd94c91: mov rax, qword ptr [rax]
0xd94c94: mov rcx, qword ptr [rax + 8]
0xd94c98: mov rax, qword ptr [rcx + 0x270]
0xd94c9f: movzx ecx, word ptr [rax + 0x134]
0xd94ca6: cmp word ptr [rdi + 0xde], cx
0xd94cad: jne 0x140d94ce6
0xd94caf: movzx eax, byte ptr [r12 + 0xae4]
0xd94cb8: mov byte ptr [rsp + 0x28], al
0xd94cbc: vmovss xmm0, dword ptr [r12 + 0xabc]
0xd94cc6: vmovss dword ptr [rsp + 0x20], xmm0
0xd94ccc: vmovaps xmm3, xmm8
0xd94cd1: vmovss xmm2, dword ptr [r12 + 0xa98]
0xd94cdb: mov rdx, rbx
0xd94cde: mov rcx, rdi
0xd94ce1: call 0x140d8cb20
0xd94ce6: mov ebx, 0xffff
0xd94ceb: cmp word ptr [rdi + 0x288], bx
0xd94cf2: je 0x140d94d04
0xd94cf4: mov rcx, rdi
0xd94cf7: call 0x140d8bf00
0xd94cfc: cmp al, 3
0xd94cfe: je 0x140d94e62
0xd94d04: cmp dword ptr [r12 + 0xbf8], 3
0xd94d0d: jne 0x140d94e62
0xd94d13: cmp word ptr [rdi + 0xde], bx
0xd94d1a: je 0x140d94e62
0xd94d20: mov eax, dword ptr [rdi + 0x2b0]
0xd94d26: test eax, eax
0xd94d28: je 0x140d94d31
0xd94d2a: shr eax, 4
0xd94d2d: and al, 1
0xd94d2f: jmp 0x140d94d47
0xd94d31: lea rcx, [rdi + 0xde]
0xd94d38: call 0x140537250
0xd94d3d: cmp byte ptr [rax + 0xa8], 4
0xd94d44: sete al
0xd94d47: test al, al
0xd94d49: je 0x140d94e62
0xd94d4f: mov rax, qword ptr [rip + 0x5fd47d2]
0xd94d56: cmp byte ptr [r14 + rsi], 0
0xd94d5b: cmovne rax, qword ptr [rip + 0x5fd47cd]
0xd94d63: mov rdx, qword ptr [rdi + 0x118]
0xd94d6a: mov rax, qword ptr [rax]
0xd94d6d: mov rcx, qword ptr [rax + 8]
0xd94d71: mov rax, qword ptr [rcx + 0x270]
0xd94d78: movzx ecx, word ptr [rax + 0x148]
0xd94d7f: mov byte ptr [rsp + 0x20], r15b
0xd94d84: vmovaps xmm3, xmm10
0xd94d89: lea r8, [rsp + 0x60]
0xd94d8e: cmp word ptr [rdi + 0xde], cx
0xd94d95: mov rcx, r12
0xd94d98: jne 0x140d94de2
0xd94d9a: vmovups xmm0, xmmword ptr [r12 + 0x994]
0xd94da4: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94daa: mov eax, dword ptr [r12 + 0x9a4]
0xd94db2: mov dword ptr [rsp + 0x70], eax
0xd94db6: call 0x140dabae0
0xd94dbb: movzx ebx, al
0xd94dbe: mov rdx, qword ptr [rdi + 0x260]
0xd94dc5: test rdx, rdx
0xd94dc8: je 0x140d94e45
0xd94dca: vmovups xmm0, xmmword ptr [r12 + 0x994]
0xd94dd4: mov ecx, dword ptr [r12 + 0x9a4]
0xd94ddc: mov dword ptr [rsp + 0x70], ecx
0xd94de0: jmp 0x140d94e28
0xd94de2: vmovups xmm0, xmmword ptr [r12 + 0x980]
0xd94dec: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94df2: mov eax, dword ptr [r12 + 0x990]
0xd94dfa: mov dword ptr [rsp + 0x70], eax
0xd94dfe: call 0x140dabae0
0xd94e03: movzx ebx, al
0xd94e06: mov rdx, qword ptr [rdi + 0x260]
0xd94e0d: test rdx, rdx
0xd94e10: je 0x140d94e45
0xd94e12: vmovups xmm0, xmmword ptr [r12 + 0x980]
0xd94e1c: mov eax, dword ptr [r12 + 0x990]
0xd94e24: mov dword ptr [rsp + 0x70], eax
0xd94e28: mov byte ptr [rsp + 0x20], r15b
0xd94e2d: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94e33: vmovaps xmm3, xmm10
0xd94e38: lea r8, [rsp + 0x60]
0xd94e3d: mov rcx, r12
0xd94e40: call 0x140dabae0
0xd94e45: mov byte ptr [rdi + 0x2b9], bl
0xd94e4b: movzx r8d, bl
0xd94e4f: xor r8b, 1
0xd94e53: xor edx, edx
0xd94e55: mov rcx, rdi
0xd94e58: call 0x140deca40
0xd94e5d: jmp 0x140d951af
0xd94e62: cmp dword ptr [rdi + 0x2bc], 0
0xd94e69: ja 0x140d951b7
0xd94e6f: cmp r13b, 1
0xd94e73: jne 0x140d951b7
0xd94e79: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94e81: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94e87: mov eax, dword ptr [rdi + 0x208]
0xd94e8d: mov dword ptr [rsp + 0x70], eax
0xd94e91: mov byte ptr [rsp + 0x20], r15b
0xd94e96: vmovaps xmm3, xmm10
0xd94e9b: lea r8, [rsp + 0x60]
0xd94ea0: mov rdx, qword ptr [rdi + 0x118]
0xd94ea7: mov rcx, r12
0xd94eaa: call 0x140dabae0
0xd94eaf: movzx ebx, al
0xd94eb2: mov rdx, qword ptr [rdi + 0x260]
0xd94eb9: test rdx, rdx
0xd94ebc: je 0x140d94eed
0xd94ebe: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94ec6: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94ecc: mov ecx, dword ptr [rdi + 0x208]
0xd94ed2: mov dword ptr [rsp + 0x70], ecx
0xd94ed6: mov byte ptr [rsp + 0x20], r15b
0xd94edb: vmovaps xmm3, xmm10
0xd94ee0: lea r8, [rsp + 0x60]
0xd94ee5: mov rcx, r12
0xd94ee8: call 0x140dabae0
0xd94eed: mov rdx, qword ptr [rip + 0x5fd4634]
0xd94ef4: mov r8, qword ptr [rip + 0x5fd4635]
0xd94efb: cmp qword ptr [rdi + 0x160], 0
0xd94f03: je 0x140d94f9e
0xd94f09: movzx r9d, byte ptr [r14 + rsi]
0xd94f0e: mov rax, rdx
0xd94f11: test r9b, r9b
0xd94f14: cmovne rax, r8
0xd94f18: movzx r10d, word ptr [rdi + 0xde]
0xd94f20: mov rax, qword ptr [rax]
0xd94f23: mov rcx, qword ptr [rax + 8]
0xd94f27: mov rax, qword ptr [rcx + 0x270]
0xd94f2e: cmp r10w, word ptr [rax + 0xce]
0xd94f36: je 0x140d94f5a
0xd94f38: mov rax, rdx
0xd94f3b: test r9b, r9b
0xd94f3e: cmovne rax, r8
0xd94f42: mov rax, qword ptr [rax]
0xd94f45: mov rcx, qword ptr [rax + 8]
0xd94f49: mov rax, qword ptr [rcx + 0x270]
0xd94f50: cmp r10w, word ptr [rax + 0x15c]
0xd94f58: jne 0x140d94f9e
0xd94f5a: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94f62: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94f68: mov eax, dword ptr [rdi + 0x208]
0xd94f6e: mov dword ptr [rsp + 0x70], eax
0xd94f72: mov byte ptr [rsp + 0x20], r15b
0xd94f77: vmovaps xmm3, xmm10
0xd94f7c: lea r8, [rsp + 0x60]
0xd94f81: mov rdx, qword ptr [rdi + 0x168]
0xd94f88: mov rcx, r12
0xd94f8b: call 0x140dabae0
0xd94f90: mov r8, qword ptr [rip + 0x5fd4599]
0xd94f97: mov rdx, qword ptr [rip + 0x5fd458a]
0xd94f9e: cmp qword ptr [rdi + 0x170], 0
0xd94fa6: je 0x140d95030
0xd94fac: movzx r9d, byte ptr [r14 + rsi]
0xd94fb1: mov rax, rdx
0xd94fb4: test r9b, r9b
0xd94fb7: cmovne rax, r8
0xd94fbb: movzx r10d, word ptr [rdi + 0xde]
0xd94fc3: mov rax, qword ptr [rax]
0xd94fc6: mov rcx, qword ptr [rax + 8]
0xd94fca: mov rax, qword ptr [rcx + 0x270]
0xd94fd1: cmp r10w, word ptr [rax + 0xce]
0xd94fd9: je 0x140d94ffa
0xd94fdb: test r9b, r9b
0xd94fde: cmovne rdx, r8
0xd94fe2: mov rax, qword ptr [rdx]
0xd94fe5: mov rcx, qword ptr [rax + 8]
0xd94fe9: mov rax, qword ptr [rcx + 0x270]
0xd94ff0: cmp r10w, word ptr [rax + 0x15c]
0xd94ff8: jne 0x140d95030
0xd94ffa: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd95002: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95008: mov eax, dword ptr [rdi + 0x208]
0xd9500e: mov dword ptr [rsp + 0x70], eax
0xd95012: mov byte ptr [rsp + 0x20], r15b
0xd95017: vmovaps xmm3, xmm10
0xd9501c: lea r8, [rsp + 0x60]
0xd95021: mov rdx, qword ptr [rdi + 0x178]
0xd95028: mov rcx, r12
0xd9502b: call 0x140dabae0
0xd95030: lea rcx, [rdi + 0xde]
0xd95037: call 0x140537250
0xd9503c: cmp byte ptr [rax + 0x61], 0
0xd95040: jne 0x140d951a9
0xd95046: cmp qword ptr [rdi + 0x148], 0
0xd9504e: je 0x140d951a9
0xd95054: vmovaps xmm6, xmm8
0xd95059: lea rcx, [rdi + 0xde]
0xd95060: call 0x140537250
0xd95065: cmp byte ptr [rax + 0xb4], 0
0xd9506c: je 0x140d95081
0xd9506e: vmovss xmm1, dword ptr [rip + 0x5f16c42]
0xd95076: vcmpltss xmm0, xmm8, xmm1
0xd9507b: vblendvps xmm6, xmm6, xmm1, xmm0
0xd95081: vmovss xmm0, dword ptr [rip + 0x5f169af]
0xd95089: vdivss xmm1, xmm0, xmm6
0xd9508d: mov rax, qword ptr [rdi + 0x148]
0xd95094: mov rcx, qword ptr [rax + 8]
0xd95098: mov rdx, qword ptr [rcx + 0x18]
0xd9509c: mov rcx, qword ptr [rdx]
0xd9509f: mov rax, qword ptr [rcx + 0xa0]
0xd950a6: test rax, rax
0xd950a9: je 0x140d950b2
0xd950ab: cmp qword ptr [rax + 8], 0
0xd950b0: jne 0x140d950ed
0xd950b2: mov rax, qword ptr [rcx + 0x20]
0xd950b6: mov rcx, qword ptr [rax + 0x20]
0xd950ba: vmovss dword ptr [rcx + 0x20], xmm1
0xd950bf: mov rax, qword ptr [rdx]
0xd950c2: mov rcx, qword ptr [rax + 0x20]
0xd950c6: mov rax, qword ptr [rcx + 0x20]
0xd950ca: vmovss dword ptr [rax + 0x28], xmm1
0xd950cf: mov rax, qword ptr [rdx]
0xd950d2: mov rcx, qword ptr [rax + 0x20]
0xd950d6: mov rax, qword ptr [rcx + 0x20]
0xd950da: mov dword ptr [rax + 0x30], 0x3f800000
0xd950e1: mov rcx, qword ptr [rdx]
0xd950e4: mov rcx, qword ptr [rcx + 0x18]
0xd950e8: call 0x140d438d0
0xd950ed: mov rdx, qword ptr [rdi + 0x150]
0xd950f4: test rdx, rdx
0xd950f7: je 0x140d95168
0xd950f9: vmovups xmm0, xmmword ptr [rdi + 0x20c]
0xd95101: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95107: mov eax, dword ptr [rdi + 0x21c]
0xd9510d: mov dword ptr [rsp + 0x70], eax
0xd95111: mov byte ptr [rsp + 0x20], r15b
0xd95116: vmovaps xmm3, xmm10
0xd9511b: lea r8, [rsp + 0x60]
0xd95120: mov rdx, qword ptr [rdx + 8]
0xd95124: mov rcx, r12
0xd95127: call 0x140dabae0
0xd9512c: or bl, al
0xd9512e: mov rcx, qword ptr [rdi + 0x250]
0xd95135: cmp byte ptr [rip + 0x5fd1b9c], 0
0xd9513c: je 0x140d95168
0xd9513e: vsubss xmm0, xmm14, xmm11
0xd95143: vmovss xmm1, dword ptr [rip + 0x4fddaa1]
0xd9514b: vcomiss xmm1, xmm0
0xd9514f: jb 0x140d95158
0xd95151: vcomiss xmm0, xmm15
0xd95156: jae 0x140d95163
0xd95158: test bl, bl
0xd9515a: je 0x140d95163
0xd9515c: call 0x140cb6bd0
0xd95161: jmp 0x140d95168
0xd95163: call 0x140cb6d80
0xd95168: mov rdx, qword ptr [rdi + 0x158]
0xd9516f: test rdx, rdx
0xd95172: je 0x140d951a9
0xd95174: vmovups xmm0, xmmword ptr [rdi + 0x220]
0xd9517c: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95182: mov eax, dword ptr [rdi + 0x230]
0xd95188: mov dword ptr [rsp + 0x70], eax
0xd9518c: mov byte ptr [rsp + 0x20], r15b
0xd95191: vmovaps xmm3, xmm10
0xd95196: lea r8, [rsp + 0x60]
0xd9519b: mov rdx, qword ptr [rdx + 8]
0xd9519f: mov rcx, r12
0xd951a2: call 0x140dabae0
0xd951a7: or bl, al
0xd951a9: mov byte ptr [rdi + 0x2b9], bl
0xd951af: test bl, bl
0xd951b1: je 0x140d95dff
0xd951b7: vmovups xmm6, xmmword ptr [rdi + 0xc8]
0xd951bf: vmovups xmmword ptr [rsp + 0x60], xmm6
0xd951c5: lea rcx, [rdi + 0xde]
0xd951cc: call 0x140537250
0xd951d1: mov r13d, dword ptr [rax + 0x2c]
0xd951d5: cmp r13d, 0x19
0xd951d9: je 0x140d951e6
0xd951db: cmp r13d, 0x1a
0xd951df: je 0x140d951e6
0xd951e1: xor r15b, r15b
0xd951e4: jmp 0x140d951e9
0xd951e6: mov r15b, 1
0xd951e9: mov byte ptr [rsp + 0x44], r15b
0xd951ee: vmovss xmm0, dword ptr [rdi + 0xe4]
0xd951f6: vcomiss xmm0, dword ptr [rip + 0x5f48e4a]
0xd951fe: seta r14b
0xd95202: mov byte ptr [rbp + 0x978], r14b
0xd95209: mov rax, qword ptr [rbp + 0x990]
0xd95210: vmovss xmm0, dword ptr [rax + 4]
0xd95215: vcomiss xmm0, dword ptr [rip + 0x5f48e2b]
0xd9521d: seta byte ptr [rsp + 0x40]
0xd95222: lea rcx, [rdi + 0xde]
0xd95229: call 0x140537250
0xd9522e: cmp byte ptr [rax + 0xab], 0
0xd95235: jne 0x140d9524c
0xd95237: lea rcx, [rdi + 0xde]
0xd9523e: call 0x140537250
0xd95243: cmp byte ptr [rax + 0xaf], 0
0xd9524a: je 0x140d95265
0xd9524c: mov rcx, rdi
0xd9524f: call 0x140d8bf00
0xd95254: movzx ecx, al
0xd95257: mov rax, qword ptr [r12 + 0x468]
0xd9525f: cmp byte ptr [rcx + rax], 0
0xd95263: jne 0x140d952a8
0xd95265: lea rcx, [rdi + 0xde]
0xd9526c: call 0x140537250
0xd95271: cmp dword ptr [rax + 0x2c], 0x5e
0xd95275: je 0x140d952a8
0xd95277: movzx eax, byte ptr [rdi + 0xd0]
0xd9527e: cmp al, 0xe
0xd95280: je 0x140d9528a
0xd95282: cmp al, 0xf
0xd95284: jne 0x140d954ab
0xd9528a: mov eax, dword ptr [rdi + 0xc8]
0xd95290: mov dword ptr [rsp + 0x48], eax
0xd95294: lea rcx, [rsp + 0x48]
0xd95299: call 0x1404a2630
0xd9529e: cmp byte ptr [rax + 0x4e], 0
0xd952a2: je 0x140d954ab
0xd952a8: mov sil, 1
0xd952ab: xor bl, bl
0xd952ad: call 0x14066a0a0
0xd952b2: test al, al
0xd952b4: jne 0x140d95468
0xd952ba: vpextrb eax, xmm6, 8
0xd952c0: cmp al, 2
0xd952c2: jne 0x140d95326
0xd952c4: movzx eax, word ptr [rsp + 0x60]
0xd952c9: mov word ptr [rsp + 0x48], ax
0xd952ce: xor eax, eax
0xd952d0: mov qword ptr [rsp + 0x20], rax
0xd952d5: lea r9, [rsp + 0x48]
0xd952da: mov r8, qword ptr [rbp + 0x988]
0xd952e1: xor edx, edx
0xd952e3: mov rcx, qword ptr [rip + 0x5fd3efe]
0xd952ea: mov rcx, qword ptr [rcx + 0xa0]
0xd952f1: call 0x140656450
0xd952f6: movzx ebx, al
0xd952f9: lea rcx, [rsp + 0x48]
0xd952fe: call 0x140430280
0xd95303: cmp byte ptr [rax + 0xff], 0
0xd9530a: je 0x140d95468
0xd95310: cmp byte ptr [r12 + 0xadc], 0
0xd95319: jne 0x140d95468
0xd9531f: xor bl, bl
0xd95321: jmp 0x140d95468
0xd95326: cmp al, 1
0xd95328: jne 0x140d95344
0xd9532a: mov eax, dword ptr [rsp + 0x60]
0xd9532e: mov dword ptr [rsp + 0x48], eax
0xd95332: xor r8d, r8d
0xd95335: lea rdx, [rsp + 0x48]
0xd9533a: call 0x1406572d0
0xd9533f: jmp 0x140d95465
0xd95344: cmp al, 0x12
0xd95346: jne 0x140d953da
0xd9534c: movzx eax, word ptr [rsp + 0x60]
0xd95351: mov word ptr [rsp + 0x48], ax
0xd95356: lea rcx, [rsp + 0x48]
0xd9535b: call 0x1403880a0
0xd95360: movzx ecx, word ptr [rax + 0xa0]
0xd95367: mov word ptr [rsp + 0x48], cx
0xd9536c: lea rcx, [rsp + 0x48]
0xd95371: call 0x140433650
0xd95376: cmp dword ptr [rax + 0x100], -1
0xd9537d: je 0x140d953d3
0xd9537f: lea rcx, [rsp + 0x48]
0xd95384: call 0x140433650
0xd95389: lea rdx, [rax + 0x100]
0xd95390: call 0x140655f00
0xd95395: test al, al
0xd95397: jne 0x140d95468
0xd9539d: lea rcx, [rsp + 0x48]
0xd953a2: call 0x140433650
0xd953a7: lea rdx, [rax + 0x100]
0xd953ae: xor r8d, r8d
0xd953b1: call 0x1406572d0
0xd953b6: movzx ebx, al
0xd953b9: test al, 0xfa
0xd953bb: jne 0x140d953c8
0xd953bd: cmp al, 4
0xd953bf: je 0x140d953c8
0xd953c1: mov bl, 2
0xd953c3: jmp 0x140d95468
0xd953c8: lea eax, [rbx - 2]
0xd953cb: cmp al, 1
0xd953cd: jbe 0x140d95468
0xd953d3: mov bl, 4
0xd953d5: jmp 0x140d95468
0xd953da: cmp r13d, 0x16
0xd953de: jne 0x140d95450
0xd953e0: mov bl, 4
0xd953e2: mov rax, qword ptr [rdi + 0x120]
0xd953e9: test rax, rax
0xd953ec: je 0x140d95468
0xd953ee: vmovss xmm0, dword ptr [r12 + 0xabc]
0xd953f8: vcomiss xmm0, dword ptr [rip + 0x5f166d8]
0xd95400: jb 0x140d95468
0xd95402: mov rdx, qword ptr [rax + 0x20]
0xd95406: mov rax, qword ptr [rdx]
0xd95409: mov rcx, qword ptr [rax + 0xa0]
0xd95410: test rcx, rcx
0xd95413: je 0x140d9541c
0xd95415: cmp qword ptr [rcx + 8], 0
0xd9541a: jne 0x140d95468
0xd9541c: mov rax, qword ptr [rdx + 8]
0xd95420: xor ecx, ecx
0xd95422: mov edx, ecx
0xd95424: mov r8d, dword ptr [rax + 8]
0xd95428: test r8d, r8d
0xd9542b: je 0x140d95468
0xd9542d: mov r9, qword ptr [rax]
0xd95430: mov eax, dword ptr [rip + 0x5f3abf2]
0xd95436: mov ecx, edx
0xd95438: cmp eax, dword ptr [r9 + rcx*4]
0xd9543c: je 0x140d95447
0xd9543e: inc edx
0xd95440: cmp edx, r8d
0xd95443: jb 0x140d95436
0xd95445: jmp 0x140d95468
0xd95447: cmp edx, -1
0xd9544a: je 0x140d95468
0xd9544c: xor bl, bl
0xd9544e: jmp 0x140d95468
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
0xd95476: mov byte ptr [rdi + 0x1ed], 1
0xd9547d: cmp bl, 2
0xd95480: setb r8b
0xd95484: mov dl, 1
0xd95486: mov rcx, rdi
0xd95489: call 0x140deca40
0xd9548e: test r15b, r15b
0xd95491: je 0x140d954ae
0xd95493: cmp r14b, byte ptr [r12 + 0xadc]
0xd9549b: setne r8b
0xd9549f: mov dl, 0xd
0xd954a1: mov rcx, rdi
0xd954a4: call 0x140deca40
0xd954a9: jmp 0x140d954ae
0xd954ab: xor sil, sil
0xd954ae: xor r14d, r14d
0xd954b1: mov ecx, r14d
0xd954b4: lea rax, [rdi + 0x1e8]
0xd954bb: nop dword ptr [rax + rax]
0xd954c0: cmp byte ptr [rax], r14b
0xd954c3: jne 0x140d95e02
0xd954c9: inc ecx
0xd954cb: inc rax
0xd954ce: cmp ecx, 3
0xd954d1: jb 0x140d954c0
0xd954d3: mov rax, qword ptr [rdi + 8]
0xd954d7: mov rcx, qword ptr [rax + 0x18]
0xd954db: mov rdx, qword ptr [rcx]
0xd954de: mov rax, qword ptr [rdx + 0xa0]
0xd954e5: test rax, rax
0xd954e8: je 0x140d954f0
0xd954ea: cmp qword ptr [rax + 8], r14
0xd954ee: jne 0x140d95502
0xd954f0: mov rax, qword ptr [rdx + 0x20]
0xd954f4: mov rdx, qword ptr [rax + 0x20]
0xd954f8: vmovss dword ptr [rdx + 0x48], xmm9
0xd954fd: call 0x140d438d0
0xd95502: mov rax, qword ptr [rdi + 8]
0xd95506: mov rcx, qword ptr [rax + 0x18]
0xd9550a: mov rax, qword ptr [rcx]
0xd9550d: mov rdx, qword ptr [rax + 0x20]
0xd95511: mov rax, qword ptr [rdx + 0x20]
0xd95515: mov byte ptr [rax + 0x4c], 3
0xd95519: call 0x140d438d0
0xd9551e: cmp r13d, 0x16
0xd95522: je 0x140d95e02
0xd95528: test sil, sil
0xd9552b: je 0x140d95e02
0xd95531: cmp qword ptr [rdi + 0x148], r14
0xd95538: je 0x140d95547
0xd9553a: mov rax, qword ptr [rdi + 0x150]
0xd95541: mov rbx, qword ptr [rax + 8]
0xd95545: jmp 0x140d9554a
0xd95547: mov rbx, r14
0xd9554a: lea eax, [r13 - 0x5a]
0xd9554e: cmp eax, 3
0xd95551: jbe 0x140d9555e
0xd95553: cmp r13d, 0x17
0xd95557: je 0x140d9555e
0xd95559: xor sil, sil
0xd9555c: jmp 0x140d95561
0xd9555e: mov sil, 1
0xd95561: movzx r12d, byte ptr [rdi + 0x1d8]
0xd95569: cmp r12b, 4
0xd9556d: jne 0x140d95667
0xd95573: test sil, sil
0xd95576: je 0x140d955cb
0xd95578: mov rbx, qword ptr [rdi + 0x128]
0xd9557f: test rbx, rbx
0xd95582: je 0x140d95992
0xd95588: mov rbx, qword ptr [rbx + 0x20]
0xd9558c: mov rax, qword ptr [rbx]
0xd9558f: mov rcx, qword ptr [rax + 0xa0]
0xd95596: test rcx, rcx
0xd95599: je 0x140d955a5
0xd9559b: cmp qword ptr [rcx + 8], r14
0xd9559f: jne 0x140d95992
0xd955a5: lea rdx, [rip + 0x5f3aa5c]
0xd955ac: mov rcx, qword ptr [rbx + 8]
0xd955b0: call 0x1435ca140
0xd955b5: cmp eax, -1
0xd955b8: je 0x140d95992
0xd955be: mov rcx, rbx
0xd955c1: call 0x1435c66a0
0xd955c6: jmp 0x140d95992
0xd955cb: test rbx, rbx
0xd955ce: je 0x140d95606
0xd955d0: mov rbx, qword ptr [rbx + 0x20]
0xd955d4: mov rax, qword ptr [rbx]
0xd955d7: mov rcx, qword ptr [rax + 0xa0]
0xd955de: test rcx, rcx
0xd955e1: je 0x140d955e9
0xd955e3: cmp qword ptr [rcx + 8], r14
0xd955e7: jne 0x140d95606
0xd955e9: lea rdx, [rip + 0x5f3aa18]
0xd955f0: mov rcx, qword ptr [rbx + 8]
0xd955f4: call 0x1435ca140
0xd955f9: cmp eax, -1
0xd955fc: je 0x140d95606
0xd955fe: mov rcx, rbx
0xd95601: call 0x1435c66a0
0xd95606: mov rbx, qword ptr [rdi + 0x130]
0xd9560d: movzx edx, byte ptr [rbp + 0x978]
0xd95614: movzx esi, byte ptr [rsp + 0x40]
0xd95619: test rbx, rbx
0xd9561c: je 0x140d95a50
0xd95622: mov rbx, qword ptr [rbx + 0x20]
0xd95626: mov rax, qword ptr [rbx]
0xd95629: mov rcx, qword ptr [rax + 0xa0]
0xd95630: cmp dl, sil
0xd95633: jne 0x140d95a0f
0xd95639: test rcx, rcx
0xd9563c: je 0x140d95649
0xd9563e: cmp qword ptr [rcx + 8], 0
0xd95643: jne 0x140d95a50
0xd95649: lea rdx, [rip + 0x5f3a9a8]
0xd95650: mov rcx, qword ptr [rbx + 8]
0xd95654: call 0x1435ca140
0xd95659: cmp eax, -1
0xd9565c: je 0x140d95a49
0xd95662: jmp 0x140d95a41
0xd95667: lea eax, [r12 - 2]
0xd9566c: cmp al, 1
0xd9566e: ja 0x140d95989
0xd95674: xor eax, eax
0xd95676: mov r15d, eax
0xd95679: cmp r12b, 2
0xd9567d: jne 0x140d9568f
0xd9567f: mov r14, qword ptr [rdi + 0x160]
0xd95686: mov r15, qword ptr [rdi + 0x168]
0xd9568d: jmp 0x140d956a3
0xd9568f: cmp r12b, 3
0xd95693: jne 0x140d956a3
0xd95695: mov r14, qword ptr [rdi + 0x170]
0xd9569c: mov r15, qword ptr [rdi + 0x178]
0xd956a3: cmp byte ptr [rsp + 0x44], al
0xd956a7: je 0x140d9573b
0xd956ad: cmp r12b, 2
0xd956b1: jne 0x140d956e6
0xd956b3: mov rax, qword ptr [rdi + 0x118]
0xd956ba: mov rbx, qword ptr [rax + 0x20]
0xd956be: mov rax, qword ptr [rbx]
0xd956c1: mov rcx, qword ptr [rax + 0xa0]
0xd956c8: test rcx, rcx
0xd956cb: je 0x140d956d4
0xd956cd: cmp qword ptr [rcx + 8], 0
0xd956d2: jne 0x140d9573b
0xd956d4: cmp dword ptr [rip + 0x5f3acb5], 0
0xd956db: je 0x140d9573b
0xd956dd: lea rdx, [rip + 0x5f3acac]
0xd956e4: jmp 0x140d9571d
0xd956e6: cmp r12b, 3
0xd956ea: jne 0x140d9573b
0xd956ec: mov rax, qword ptr [rdi + 0x118]
0xd956f3: mov rbx, qword ptr [rax + 0x20]
0xd956f7: mov rax, qword ptr [rbx]
0xd956fa: mov rcx, qword ptr [rax + 0xa0]
0xd95701: test rcx, rcx
0xd95704: je 0x140d9570d
0xd95706: cmp qword ptr [rcx + 8], 0
0xd9570b: jne 0x140d9573b
0xd9570d: cmp dword ptr [rip + 0x5f3ac80], 0
0xd95714: je 0x140d9573b
0xd95716: lea rdx, [rip + 0x5f3ac77]
0xd9571d: mov rcx, qword ptr [rbx + 8]
0xd95721: call 0x1435ca0a0
0xd95726: test al, al
0xd95728: je 0x140d9573b
0xd9572a: mov rcx, qword ptr [rbx + 8]
0xd9572e: call 0x1435caec0
0xd95733: mov rcx, rbx
0xd95736: call 0x1435c66a0
0xd9573b: test r14, r14
0xd9573e: je 0x140d95989
0xd95744: test r15, r15
0xd95747: je 0x140d95989
0xd9574d: mov rcx, r14
0xd95750: call 0x140cb6bd0
0xd95755: test sil, sil
0xd95758: je 0x140d95606
0xd9575e: vmovss dword ptr [rsp + 0x48], xmm11
0xd95764: vmovss xmm0, dword ptr [rip + 0x5f162cc]
0xd9576c: vdivss xmm6, xmm0, xmm8
0xd95771: movzx esi, byte ptr [rsp + 0x40]
0xd95776: mov rbx, qword ptr [r15 + 0x20]
0xd9577a: mov rax, qword ptr [rbx]
0xd9577d: mov rcx, qword ptr [rax + 0xa0]
0xd95784: cmp byte ptr [rbp + 0x978], sil
0xd9578b: jne 0x140d95846
0xd95791: mov r11, qword ptr [rbp + 0x970]
0xd95798: vmulss xmm6, xmm6, dword ptr [r11 + 0xabc]
0xd957a1: test rcx, rcx
0xd957a4: je 0x140d957ad
0xd957a6: cmp qword ptr [rcx + 8], 0
0xd957ab: jne 0x140d957ca
0xd957ad: lea rdx, [rip + 0x5f3a844]
0xd957b4: mov rcx, qword ptr [rbx + 8]
0xd957b8: call 0x1435ca140
0xd957bd: cmp eax, -1
0xd957c0: je 0x140d957ca
0xd957c2: mov rcx, rbx
0xd957c5: call 0x1435c66a0
0xd957ca: mov rax, qword ptr [r14 + 8]
0xd957ce: mov rbx, qword ptr [rax + 0x20]
0xd957d2: mov rax, qword ptr [rbx]
0xd957d5: mov rcx, qword ptr [rax + 0xa0]
0xd957dc: test rcx, rcx
0xd957df: je 0x140d957e8
0xd957e1: cmp qword ptr [rcx + 8], 0
0xd957e6: jne 0x140d95805
0xd957e8: lea rdx, [rip + 0x5f3a809]
0xd957ef: mov rcx, qword ptr [rbx + 8]
0xd957f3: call 0x1435ca140
0xd957f8: cmp eax, -1
0xd957fb: je 0x140d95805
0xd957fd: mov rcx, rbx
0xd95800: call 0x1435c66a0
0xd95805: mov rax, qword ptr [rdi + 0x118]
0xd9580c: mov rcx, qword ptr [rax + 0x20]
0xd95810: mov byte ptr [rsp + 0x50], 6
0xd95815: lea r8, [rsp + 0x50]
0xd9581a: lea rdx, [rbp + 0x20]
0xd9581e: call 0x1435c8ef0
0xd95823: lea rcx, [rbp + 0x20]
0xd95827: call 0x140615320
0xd9582c: cmp byte ptr [rax + 0xe], 0
0xd95830: je 0x140d95835
0xd95832: mov rax, qword ptr [rax]
0xd95835: vmulss xmm1, xmm13, dword ptr [rax]
0xd95839: vmulss xmm2, xmm1, dword ptr [rip + 0x5f16387]
0xd95841: jmp 0x140d958d4
0xd95846: test rcx, rcx
0xd95849: je 0x140d95852
0xd9584b: cmp qword ptr [rcx + 8], 0
0xd95850: jne 0x140d95880
0xd95852: cmp dword ptr [rip + 0x5f3a79f], 0
0xd95859: je 0x140d95880
0xd9585b: lea rdx, [rip + 0x5f3a796]
0xd95862: mov rcx, qword ptr [rbx + 8]
0xd95866: call 0x1435ca0a0
0xd9586b: test al, al
0xd9586d: je 0x140d95880
0xd9586f: mov rcx, qword ptr [rbx + 8]
0xd95873: call 0x1435caec0
0xd95878: mov rcx, rbx
0xd9587b: call 0x1435c66a0
0xd95880: mov rax, qword ptr [r14 + 8]
0xd95884: mov rbx, qword ptr [rax + 0x20]
0xd95888: mov rax, qword ptr [rbx]
0xd9588b: mov rcx, qword ptr [rax + 0xa0]
0xd95892: test rcx, rcx
0xd95895: je 0x140d9589e
0xd95897: cmp qword ptr [rcx + 8], 0
0xd9589c: jne 0x140d958cc
0xd9589e: cmp dword ptr [rip + 0x5f3a753], 0
0xd958a5: je 0x140d958cc
0xd958a7: lea rdx, [rip + 0x5f3a74a]
0xd958ae: mov rcx, qword ptr [rbx + 8]
0xd958b2: call 0x1435ca0a0
0xd958b7: test al, al
0xd958b9: je 0x140d958cc
0xd958bb: mov rcx, qword ptr [rbx + 8]
0xd958bf: call 0x1435caec0
0xd958c4: mov rcx, rbx
0xd958c7: call 0x1435c66a0
0xd958cc: vmulss xmm2, xmm6, dword ptr [rip + 0x4fdda74]
0xd958d4: vmovss dword ptr [rsp + 0x48], xmm2
0xd958da: mov rax, qword ptr [r14 + 8]
0xd958de: mov rcx, qword ptr [rax + 0x20]
0xd958e2: mov byte ptr [rsp + 0x51], 0
0xd958e7: vxorps xmm0, xmm2, xmmword ptr [rip + 0x4fe0461]
0xd958ef: vmovss dword ptr [rbp - 0x78], xmm0
0xd958f4: mov byte ptr [rsp + 0x52], 4
0xd958f9: lea r9, [rsp + 0x51]
0xd958fe: lea r8, [rbp - 0x78]
0xd95902: lea rdx, [rsp + 0x52]
0xd95907: call 0x14064b570
0xd9590c: mov rax, qword ptr [r14 + 8]
0xd95910: mov rcx, qword ptr [rax + 0x20]
0xd95914: mov byte ptr [rsp + 0x53], 0
0xd95919: mov byte ptr [rsp + 0x54], 2
0xd9591e: lea r9, [rsp + 0x53]
0xd95923: lea r8, [rsp + 0x48]
0xd95928: lea rdx, [rsp + 0x54]
0xd9592d: call 0x14064b570
0xd95932: mov rdx, qword ptr [r15 + 0x18]
0xd95936: mov rcx, qword ptr [rdx]
0xd95939: mov rax, qword ptr [rcx + 0xa0]
0xd95940: test rax, rax
0xd95943: je 0x140d9594c
0xd95945: cmp qword ptr [rax + 8], 0
0xd9594a: jne 0x140d95997
0xd9594c: mov rax, qword ptr [rcx + 0x20]
0xd95950: mov rcx, qword ptr [rax + 0x20]
0xd95954: vmovss dword ptr [rcx + 0x20], xmm6
0xd95959: mov rax, qword ptr [rdx]
0xd9595c: mov rcx, qword ptr [rax + 0x20]
0xd95960: mov rax, qword ptr [rcx + 0x20]
0xd95964: vmovss dword ptr [rax + 0x28], xmm6
0xd95969: mov rax, qword ptr [rdx]
0xd9596c: mov rcx, qword ptr [rax + 0x20]
0xd95970: mov rax, qword ptr [rcx + 0x20]
0xd95974: mov dword ptr [rax + 0x30], 0x3f800000
0xd9597b: mov rcx, qword ptr [rdx]
0xd9597e: mov rcx, qword ptr [rcx + 0x18]
0xd95982: call 0x140d438d0
0xd95987: jmp 0x140d95997
0xd95989: test sil, sil
0xd9598c: je 0x140d95606
0xd95992: movzx esi, byte ptr [rsp + 0x40]
0xd95997: mov rax, qword ptr [rdi + 0x188]
0xd9599e: test rax, rax
0xd959a1: je 0x140d95a49
0xd959a7: vmovss xmm0, dword ptr [rip + 0x5f16089]
0xd959af: vdivss xmm1, xmm0, xmm8
0xd959b4: mov rax, qword ptr [rax + 8]
0xd959b8: mov rdx, qword ptr [rax + 0x18]
0xd959bc: mov rcx, qword ptr [rdx]
0xd959bf: mov rax, qword ptr [rcx + 0xa0]
0xd959c6: test rax, rax
0xd959c9: je 0x140d959d2
0xd959cb: cmp qword ptr [rax + 8], 0
0xd959d0: jne 0x140d95a49
0xd959d2: mov rax, qword ptr [rcx + 0x20]
0xd959d6: mov rcx, qword ptr [rax + 0x20]
0xd959da: vmovss dword ptr [rcx + 0x20], xmm1
0xd959df: mov rax, qword ptr [rdx]
0xd959e2: mov rcx, qword ptr [rax + 0x20]
0xd959e6: mov rax, qword ptr [rcx + 0x20]
0xd959ea: vmovss dword ptr [rax + 0x28], xmm1
0xd959ef: mov rax, qword ptr [rdx]
0xd959f2: mov rcx, qword ptr [rax + 0x20]
0xd959f6: mov rax, qword ptr [rcx + 0x20]
0xd959fa: mov dword ptr [rax + 0x30], 0x3f800000
0xd95a01: mov rcx, qword ptr [rdx]
0xd95a04: mov rcx, qword ptr [rcx + 0x18]
0xd95a08: call 0x140d438d0
0xd95a0d: jmp 0x140d95a49
0xd95a0f: test rcx, rcx
0xd95a12: je 0x140d95a1b
0xd95a14: cmp qword ptr [rcx + 8], 0
0xd95a19: jne 0x140d95a50
0xd95a1b: cmp dword ptr [rip + 0x5f3a5d6], 0
0xd95a22: je 0x140d95a50
0xd95a24: lea rdx, [rip + 0x5f3a5cd]
0xd95a2b: mov rcx, qword ptr [rbx + 8]
0xd95a2f: call 0x1435ca0a0
0xd95a34: test al, al
0xd95a36: je 0x140d95a49
0xd95a38: mov rcx, qword ptr [rbx + 8]
0xd95a3c: call 0x1435caec0
0xd95a41: mov rcx, rbx
0xd95a44: call 0x1435c66a0
0xd95a49: movzx edx, byte ptr [rbp + 0x978]
0xd95a50: movzx r14d, byte ptr [rsp + 0x44]
0xd95a56: test r14b, r14b
0xd95a59: jne 0x140d95aad
0xd95a5b: cmp r13d, 0x5e
0xd95a5f: je 0x140d95aad
0xd95a61: mov rcx, qword ptr [rdi + 0x1a0]
0xd95a68: mov rbx, qword ptr [rdi + 0x1a8]
0xd95a6f: test rcx, rcx
0xd95a72: je 0x140d95aad
0xd95a74: test rbx, rbx
0xd95a77: je 0x140d95aad
0xd95a79: cmp dl, sil
0xd95a7c: jne 0x140d95a8d
0xd95a7e: call 0x140cb6d80
0xd95a83: mov rcx, rbx
0xd95a86: call 0x140cb6d80
0xd95a8b: jmp 0x140d95aad
0xd95a8d: test dl, dl
0xd95a8f: je 0x140d95aa0
0xd95a91: call 0x140cb6bd0
0xd95a96: mov rcx, rbx
0xd95a99: call 0x140cb6d80
0xd95a9e: jmp 0x140d95aad
0xd95aa0: call 0x140cb6d80
0xd95aa5: mov rcx, rbx
0xd95aa8: call 0x140cb6bd0
0xd95aad: cmp byte ptr [rdi + 0x1ed], 0
0xd95ab4: je 0x140d95dff
0xd95aba: mov byte ptr [rdi + 0x1ed], 0
0xd95ac1: mov rbx, qword ptr [rdi + 0x120]
0xd95ac8: cmp r12b, 4
0xd95acc: jne 0x140d95bfd
0xd95ad2: test rbx, rbx
0xd95ad5: je 0x140d95b0e
0xd95ad7: mov rbx, qword ptr [rbx + 0x20]
0xd95adb: mov rax, qword ptr [rbx]
0xd95ade: mov rcx, qword ptr [rax + 0xa0]
0xd95ae5: test rcx, rcx
0xd95ae8: je 0x140d95af1
0xd95aea: cmp qword ptr [rcx + 8], 0
0xd95aef: jne 0x140d95b0e
0xd95af1: lea rdx, [rip + 0x5f395c8]
0xd95af8: mov rcx, qword ptr [rbx + 8]
0xd95afc: call 0x1435ca140
0xd95b01: cmp eax, -1
0xd95b04: je 0x140d95b0e
0xd95b06: mov rcx, rbx
0xd95b09: call 0x1435c66a0
0xd95b0e: mov rbx, qword ptr [rdi + 0x130]
0xd95b15: test rbx, rbx
0xd95b18: je 0x140d95b51
0xd95b1a: mov rbx, qword ptr [rbx + 0x20]
0xd95b1e: mov rax, qword ptr [rbx]
0xd95b21: mov rcx, qword ptr [rax + 0xa0]
0xd95b28: test rcx, rcx
0xd95b2b: je 0x140d95b34
0xd95b2d: cmp qword ptr [rcx + 8], 0
0xd95b32: jne 0x140d95b51
0xd95b34: lea rdx, [rip + 0x5f39585]
0xd95b3b: mov rcx, qword ptr [rbx + 8]
0xd95b3f: call 0x1435ca140
0xd95b44: cmp eax, -1
0xd95b47: je 0x140d95b51
0xd95b49: mov rcx, rbx
0xd95b4c: call 0x1435c66a0
0xd95b51: mov rcx, qword ptr [rdi + 0x160]
0xd95b58: test rcx, rcx
0xd95b5b: je 0x140d95b62
0xd95b5d: call 0x140cb6d80
0xd95b62: test r14b, r14b
0xd95b65: je 0x140d95be3
0xd95b67: mov rax, qword ptr [rdi + 0x118]
0xd95b6e: mov rbx, qword ptr [rax + 0x20]
0xd95b72: mov rax, qword ptr [rbx]
0xd95b75: mov rcx, qword ptr [rax + 0xa0]
0xd95b7c: test rcx, rcx
0xd95b7f: je 0x140d95b88
0xd95b81: cmp qword ptr [rcx + 8], 0
0xd95b86: jne 0x140d95ba5
0xd95b88: lea rdx, [rip + 0x5f3a801]
0xd95b8f: mov rcx, qword ptr [rbx + 8]
0xd95b93: call 0x1435ca140
0xd95b98: cmp eax, -1
0xd95b9b: je 0x140d95ba5
0xd95b9d: mov rcx, rbx
0xd95ba0: call 0x1435c66a0
0xd95ba5: mov rax, qword ptr [rdi + 0x118]
0xd95bac: mov rbx, qword ptr [rax + 0x20]
0xd95bb0: mov rax, qword ptr [rbx]
0xd95bb3: mov rcx, qword ptr [rax + 0xa0]
0xd95bba: test rcx, rcx
0xd95bbd: je 0x140d95bc6
0xd95bbf: cmp qword ptr [rcx + 8], 0
0xd95bc4: jne 0x140d95be3
0xd95bc6: lea rdx, [rip + 0x5f3a7c7]
0xd95bcd: mov rcx, qword ptr [rbx + 8]
0xd95bd1: call 0x1435ca140
0xd95bd6: cmp eax, -1
0xd95bd9: je 0x140d95be3
0xd95bdb: mov rcx, rbx
0xd95bde: call 0x1435c66a0
0xd95be3: mov rcx, qword ptr [rdi + 0x170]
0xd95bea: test rcx, rcx
0xd95bed: je 0x140d95dff
0xd95bf3: call 0x140cb6d80
0xd95bf8: jmp 0x140d95dff
0xd95bfd: lea eax, [r12 - 2]
0xd95c02: cmp al, 1
0xd95c04: jbe 0x140d95cb8
0xd95c0a: test rbx, rbx
0xd95c0d: je 0x140d95c57
0xd95c0f: mov rbx, qword ptr [rbx + 0x20]
0xd95c13: mov rax, qword ptr [rbx]
0xd95c16: mov rcx, qword ptr [rax + 0xa0]
0xd95c1d: test rcx, rcx
0xd95c20: je 0x140d95c29
0xd95c22: cmp qword ptr [rcx + 8], 0
0xd95c27: jne 0x140d95c57
0xd95c29: cmp dword ptr [rip + 0x5f39490], 0
0xd95c30: je 0x140d95c57
0xd95c32: lea rdx, [rip + 0x5f39487]
0xd95c39: mov rcx, qword ptr [rbx + 8]
0xd95c3d: call 0x1435ca0a0
0xd95c42: test al, al
0xd95c44: je 0x140d95c57
0xd95c46: mov rcx, qword ptr [rbx + 8]
0xd95c4a: call 0x1435caec0
0xd95c4f: mov rcx, rbx
0xd95c52: call 0x1435c66a0
0xd95c57: mov rbx, qword ptr [rdi + 0x130]
0xd95c5e: test rbx, rbx
0xd95c61: je 0x140d95b51
0xd95c67: mov rbx, qword ptr [rbx + 0x20]
0xd95c6b: mov rax, qword ptr [rbx]
0xd95c6e: mov rcx, qword ptr [rax + 0xa0]
0xd95c75: test rcx, rcx
0xd95c78: je 0x140d95c85
0xd95c7a: cmp qword ptr [rcx + 8], 0
0xd95c7f: jne 0x140d95b51
0xd95c85: cmp dword ptr [rip + 0x5f39434], 0
0xd95c8c: je 0x140d95b51
0xd95c92: lea rdx, [rip + 0x5f39427]
0xd95c99: mov rcx, qword ptr [rbx + 8]
0xd95c9d: call 0x1435ca0a0
0xd95ca2: test al, al
0xd95ca4: je 0x140d95b51
0xd95caa: mov rcx, qword ptr [rbx + 8]
0xd95cae: call 0x1435caec0
0xd95cb3: jmp 0x140d95b49
0xd95cb8: test rbx, rbx
0xd95cbb: je 0x140d95d05
0xd95cbd: mov rbx, qword ptr [rbx + 0x20]
0xd95cc1: mov rax, qword ptr [rbx]
0xd95cc4: mov rcx, qword ptr [rax + 0xa0]
0xd95ccb: test rcx, rcx
0xd95cce: je 0x140d95cd7
0xd95cd0: cmp qword ptr [rcx + 8], 0
0xd95cd5: jne 0x140d95d05
0xd95cd7: cmp dword ptr [rip + 0x5f393e2], 0
0xd95cde: je 0x140d95d05
0xd95ce0: lea rdx, [rip + 0x5f393d9]
0xd95ce7: mov rcx, qword ptr [rbx + 8]
0xd95ceb: call 0x1435ca0a0
0xd95cf0: test al, al
0xd95cf2: je 0x140d95d05
0xd95cf4: mov rcx, qword ptr [rbx + 8]
0xd95cf8: call 0x1435caec0
0xd95cfd: mov rcx, rbx
0xd95d00: call 0x1435c66a0
0xd95d05: mov rbx, qword ptr [rdi + 0x130]
0xd95d0c: test rbx, rbx
0xd95d0f: je 0x140d95d59
0xd95d11: mov rbx, qword ptr [rbx + 0x20]
0xd95d15: mov rax, qword ptr [rbx]
0xd95d18: mov rcx, qword ptr [rax + 0xa0]
0xd95d1f: test rcx, rcx
0xd95d22: je 0x140d95d2b
0xd95d24: cmp qword ptr [rcx + 8], 0
0xd95d29: jne 0x140d95d59
0xd95d2b: cmp dword ptr [rip + 0x5f3938e], 0
0xd95d32: je 0x140d95d59
0xd95d34: lea rdx, [rip + 0x5f39385]
0xd95d3b: mov rcx, qword ptr [rbx + 8]
0xd95d3f: call 0x1435ca0a0
0xd95d44: test al, al
0xd95d46: je 0x140d95d59
0xd95d48: mov rcx, qword ptr [rbx + 8]
0xd95d4c: call 0x1435caec0
0xd95d51: mov rcx, rbx
0xd95d54: call 0x1435c66a0
0xd95d59: cmp r12b, 2
0xd95d5d: je 0x140d95be3
0xd95d63: cmp r12b, 3
0xd95d67: jne 0x140d95dff
0xd95d6d: mov rcx, qword ptr [rdi + 0x160]
0xd95d74: test rcx, rcx
0xd95d77: je 0x140d95d7e
0xd95d79: call 0x140cb6d80
0xd95d7e: test r14b, r14b
0xd95d81: je 0x140d95dff
0xd95d83: mov rax, qword ptr [rdi + 0x118]
0xd95d8a: mov rbx, qword ptr [rax + 0x20]
0xd95d8e: mov rax, qword ptr [rbx]
0xd95d91: mov rcx, qword ptr [rax + 0xa0]
0xd95d98: test rcx, rcx
0xd95d9b: je 0x140d95da4
0xd95d9d: cmp qword ptr [rcx + 8], 0
0xd95da2: jne 0x140d95dc1
0xd95da4: lea rdx, [rip + 0x5f3a5e5]
0xd95dab: mov rcx, qword ptr [rbx + 8]
0xd95daf: call 0x1435ca140
0xd95db4: cmp eax, -1
0xd95db7: je 0x140d95dc1
0xd95db9: mov rcx, rbx
0xd95dbc: call 0x1435c66a0
0xd95dc1: mov rax, qword ptr [rdi + 0x118]
0xd95dc8: mov rbx, qword ptr [rax + 0x20]
0xd95dcc: mov rax, qword ptr [rbx]
0xd95dcf: mov rcx, qword ptr [rax + 0xa0]
0xd95dd6: test rcx, rcx
0xd95dd9: je 0x140d95de2
0xd95ddb: cmp qword ptr [rcx + 8], 0
0xd95de0: jne 0x140d95dff
0xd95de2: lea rdx, [rip + 0x5f3a5ab]
0xd95de9: mov rcx, qword ptr [rbx + 8]
0xd95ded: call 0x1435ca140
0xd95df2: cmp eax, -1
0xd95df5: je 0x140d95dff
0xd95df7: mov rcx, rbx
0xd95dfa: call 0x1435c66a0
0xd95dff: xor r14d, r14d
0xd95e02: mov edx, dword ptr [rbp - 0x7c]
0xd95e05: inc edx
0xd95e07: mov dword ptr [rbp - 0x7c], edx
0xd95e0a: mov r8, qword ptr [rbp - 0x60]
0xd95e0e: inc r8
0xd95e11: mov qword ptr [rbp - 0x60], r8
0xd95e15: mov r9, qword ptr [rbp - 0x58]
0xd95e19: add r9, 8
0xd95e1d: mov qword ptr [rbp - 0x58], r9
0xd95e21: cmp edx, dword ptr [rbp - 0x80]
0xd95e24: mov rbx, qword ptr [rbp + 0x970]
0xd95e2b: mov rdi, qword ptr [rbp + 0x980]
0xd95e32: mov rsi, qword ptr [rbp + 0x988]
0xd95e39: mov r15d, 0xffff
0xd95e3f: lea r13, [rip + 0x47f780a]
0xd95e46: jb 0x140d94173
0xd95e4c: lea r11, [rsp + 0xa28]
0xd95e54: vmovaps xmm6, xmmword ptr [r11 - 0x18]
0xd95e5a: vmovaps xmm7, xmmword ptr [r11 - 0x28]
0xd95e60: vmovaps xmm8, xmmword ptr [r11 - 0x38]
0xd95e66: vmovaps xmm9, xmmword ptr [r11 - 0x48]
0xd95e6c: vmovaps xmm10, xmmword ptr [r11 - 0x58]
0xd95e72: vmovaps xmm11, xmmword ptr [r11 - 0x68]
0xd95e78: vmovaps xmm12, xmmword ptr [r11 - 0x78]
0xd95e7e: vmovaps xmm13, xmmword ptr [r11 - 0x88]
0xd95e87: vmovaps xmm14, xmmword ptr [r11 - 0x98]
0xd95e90: vmovaps xmm15, xmmword ptr [r11 - 0xa8]
0xd95e99: mov rsp, r11
0xd95e9c: pop r15
0xd95e9e: pop r14
0xd95ea0: pop r13
0xd95ea2: pop r12
0xd95ea4: pop rdi
0xd95ea5: pop rsi
0xd95ea6: pop rbx
0xd95ea7: pop rbp
0xd95ea8: ret 
CALLEE 0xdbdcb0
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
CALLEE 0xdbeee0
0xdbeee0: mov rax, rsp
0xdbeee3: mov qword ptr [rax + 8], rcx
0xdbeee7: push rbx
0xdbeee8: push rsi
0xdbeee9: push rdi
0xdbeeea: push r12
0xdbeeec: push r13
0xdbeeee: push r14
0xdbeef0: push r15
0xdbeef2: sub rsp, 0x310
0xdbeef9: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdbeefe: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdbef03: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdbef08: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdbef0d: vmovaps xmmword ptr [rax - 0x88], xmm10
0xdbef15: vmovaps xmmword ptr [rax - 0x98], xmm11
0xdbef1d: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xdbef25: vmovaps xmmword ptr [rax - 0xb8], xmm13
0xdbef2d: vmovaps xmmword ptr [rax - 0xc8], xmm14
0xdbef35: vmovaps xmmword ptr [rax - 0xd8], xmm15
0xdbef3d: mov r13, rcx
0xdbef40: xor r14d, r14d
0xdbef43: mov eax, r14d
0xdbef46: mov dword ptr [rsp + 0x68], eax
0xdbef4a: mov dword ptr [rsp + 0x70], eax
0xdbef4e: cmp qword ptr [rcx + 0x820], rax
0xdbef55: je 0x140dc175f
0xdbef5b: lea rdx, [rsp + 0x1d8]
0xdbef63: call 0x14064f4f0
0xdbef68: nop 
0xdbef69: cmp byte ptr [rsp + 0x1e8], r14b
0xdbef71: je 0x140dc1743
0xdbef77: mov rax, qword ptr [rsp + 0x1e0]
0xdbef7f: mov rcx, qword ptr [rax + 0x68]
0xdbef83: mov rax, qword ptr [rcx + 0x188]
0xdbef8a: mov r15, qword ptr [rax + 0x18]
0xdbef8e: mov qword ptr [rsp + 0x208], r15
0xdbef96: vmovss xmm0, dword ptr [r13 + 0xaa0]
0xdbef9f: vsubss xmm2, xmm0, dword ptr [rip + 0x5eeca41]
0xdbefa7: vmovss xmm0, dword ptr [rip + 0x5eecad9]
0xdbefaf: vsubss xmm1, xmm0, dword ptr [rip + 0x5eeca31]
0xdbefb7: vdivss xmm3, xmm2, xmm1
0xdbefbb: vmovss xmm14, dword ptr [rip + 0x4fb40f1]
0xdbefc3: vsubss xmm1, xmm14, xmm3
0xdbefc7: vmovups xmm0, xmmword ptr [r13 + 0x96c]
0xdbefd0: vxorps xmm10, xmm10, xmm10
0xdbefd5: cmp byte ptr [r13 + 0x97c], r14b
0xdbefdc: je 0x140dbf077
0xdbefe2: vmovss xmm5, dword ptr [r13 + 0xac0]
0xdbefeb: mov dword ptr [r13 + 0xac0], r14d
0xdbeff2: vshufps xmm4, xmm0, xmm0, 0x55
0xdbeff7: vcomiss xmm1, xmm0
0xdbeffb: jbe 0x140dbf01a
0xdbeffd: vcomiss xmm4, xmm1
0xdbf001: jbe 0x140dbf01a
0xdbf003: vsubss xmm1, xmm1, xmm0
0xdbf007: vsubss xmm0, xmm4, xmm0
0xdbf00b: vdivss xmm2, xmm1, xmm0
0xdbf00f: vmovss dword ptr [r13 + 0xac0], xmm2
0xdbf018: jmp 0x140dbf06b
0xdbf01a: vshufps xmm3, xmm0, xmm0, 0xaa
0xdbf01f: vcomiss xmm1, xmm3
0xdbf023: jbe 0x140dbf04b
0xdbf025: vshufps xmm0, xmm0, xmm0, 0xff
0xdbf02a: vcomiss xmm0, xmm1
0xdbf02e: jbe 0x140dbf04b
0xdbf030: vsubss xmm1, xmm1, xmm3
0xdbf034: vsubss xmm0, xmm0, xmm3
0xdbf038: vdivss xmm2, xmm1, xmm0
0xdbf03c: vsubss xmm2, xmm14, xmm2
0xdbf040: vmovss dword ptr [r13 + 0xac0], xmm2
0xdbf049: jmp 0x140dbf06b
0xdbf04b: vxorps xmm2, xmm2, xmm2
0xdbf04f: vcomiss xmm1, xmm4
0xdbf053: jb 0x140dbf06b
0xdbf055: vcomiss xmm3, xmm1
0xdbf059: jb 0x140dbf06b
0xdbf05b: mov dword ptr [r13 + 0xac0], 0x3f800000
0xdbf066: vmovaps xmm2, xmm14
0xdbf06b: vucomiss xmm5, xmm2
0xdbf06f: jp 0x140dbf077
0xdbf071: jne 0x140dbf077
0xdbf073: xor al, al
0xdbf075: jmp 0x140dbf079
0xdbf077: mov al, 1
0xdbf079: or byte ptr [r13 + 0xad7], al
0xdbf080: vmovss xmm9, dword ptr [rip + 0x4fb3eac]
0xdbf088: cmp dword ptr [r13 + 0x480], 0
0xdbf090: jne 0x140dbf0a0
0xdbf092: cmp dword ptr [r13 + 0x490], 0
0xdbf09a: je 0x140dbf706
0xdbf0a0: mov rbx, qword ptr [r13 + 8]
0xdbf0a4: lea rdx, [rsp + 0x358]
0xdbf0ac: mov rcx, qword ptr [rbx + 0x18]
0xdbf0b0: call 0x1435b4b90
0xdbf0b5: vmovss xmm6, dword ptr [r13 + 0xa98]
0xdbf0be: vmulss xmm1, xmm9, dword ptr [rax + 4]
0xdbf0c3: vmulss xmm2, xmm1, xmm6
0xdbf0c7: vaddss xmm7, xmm2, dword ptr [r13 + 0xa5c]
0xdbf0d0: vmulss xmm1, xmm9, dword ptr [rax]
0xdbf0d4: vmulss xmm2, xmm1, xmm6
0xdbf0d8: vsubss xmm8, xmm2, dword ptr [r13 + 0xa58]
0xdbf0e1: mov rax, qword ptr [rbx + 0xa0]
0xdbf0e8: test rax, rax
0xdbf0eb: je 0x140dbf102
0xdbf0ed: cmp qword ptr [rax + 8], 0
0xdbf0f2: je 0x140dbf102
0xdbf0f4: mov rcx, qword ptr [rbx + 0x38]
0xdbf0f8: call 0x143ed8480
0xdbf0fd: mov rcx, rax
0xdbf100: jmp 0x140dbf137
0xdbf102: movzx edx, byte ptr [rbx + 0x94]
0xdbf109: cmp dl, 0xff
0xdbf10c: jne 0x140dbf113
0xdbf10e: mov rcx, r14
0xdbf111: jmp 0x140dbf137
0xdbf113: mov rax, qword ptr [rbx + 0x58]
0xdbf117: mov rcx, qword ptr [rax + 0xb0]
0xdbf11e: mov r8, qword ptr [rcx + 0xb0]
0xdbf125: cmp edx, dword ptr [r8 + 8]
0xdbf129: jb 0x140dbf130
0xdbf12b: mov rcx, r14
0xdbf12e: jmp 0x140dbf137
0xdbf130: mov rax, qword ptr [r8]
0xdbf133: mov rcx, qword ptr [rax + rdx*8]
0xdbf137: cmp byte ptr [rcx + 0x13b], 0
0xdbf13e: jne 0x140dbf14a
0xdbf140: vmovss xmm0, dword ptr [rcx + 0xd8]
0xdbf148: jmp 0x140dbf163
0xdbf14a: mov eax, 0xe0
0xdbf14f: mov edx, 0xdc
0xdbf154: cmp byte ptr [rcx + 0x13c], 0
0xdbf15b: cmove eax, edx
0xdbf15e: vmovss xmm0, dword ptr [rax + rcx]
0xdbf163: vmulss xmm1, xmm0, dword ptr [rcx + 0xd4]
0xdbf16b: vdivss xmm0, xmm14, xmm6
0xdbf16f: vmulss xmm1, xmm0, xmm1
0xdbf173: mov rax, qword ptr [r13 + 0x820]
0xdbf17a: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf182: mov qword ptr [rax + 0x40], r14
0xdbf186: mov dword ptr [rax + 0x48], r14d
0xdbf18a: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf192: mov qword ptr [rax + 0x54], r14
0xdbf196: mov dword ptr [rax + 0x5c], r14d
0xdbf19a: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf1a2: vmovss dword ptr [rax + 0x68], xmm8
0xdbf1a7: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf1ac: mov dword ptr [rax + 0x70], r14d
0xdbf1b0: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf1b7: mov rax, qword ptr [r13 + 0x870]
0xdbf1be: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf1c6: mov qword ptr [rax + 0x40], r14
0xdbf1ca: mov dword ptr [rax + 0x48], r14d
0xdbf1ce: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf1d6: mov qword ptr [rax + 0x54], r14
0xdbf1da: mov dword ptr [rax + 0x5c], r14d
0xdbf1de: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf1e6: vmovss dword ptr [rax + 0x68], xmm8
0xdbf1eb: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf1f0: mov dword ptr [rax + 0x70], r14d
0xdbf1f4: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf1fb: mov rax, qword ptr [r13 + 0x8c0]
0xdbf202: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf20a: mov qword ptr [rax + 0x40], r14
0xdbf20e: mov dword ptr [rax + 0x48], r14d
0xdbf212: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf21a: mov qword ptr [rax + 0x54], r14
0xdbf21e: mov dword ptr [rax + 0x5c], r14d
0xdbf222: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf22a: vmovss dword ptr [rax + 0x68], xmm8
0xdbf22f: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf234: mov dword ptr [rax + 0x70], r14d
0xdbf238: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf23f: mov rax, qword ptr [r13 + 0x910]
0xdbf246: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf24e: mov qword ptr [rax + 0x40], r14
0xdbf252: mov dword ptr [rax + 0x48], r14d
0xdbf256: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf25e: mov qword ptr [rax + 0x54], r14
0xdbf262: mov dword ptr [rax + 0x5c], r14d
0xdbf266: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf26e: vmovss dword ptr [rax + 0x68], xmm8
0xdbf273: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf278: mov dword ptr [rax + 0x70], r14d
0xdbf27c: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf283: vmovss dword ptr [rsp + 0x110], xmm1
0xdbf28c: vmovups xmmword ptr [rsp + 0x114], xmm10
0xdbf295: vmovss dword ptr [rsp + 0x124], xmm1
0xdbf29e: vmovss dword ptr [rsp + 0x128], xmm10
0xdbf2a7: vmovss dword ptr [rsp + 0x12c], xmm10
0xdbf2b0: vmovaps ymm0, ymmword ptr [rip + 0x4fb7688]
0xdbf2b8: vmovups ymmword ptr [rsp + 0x130], ymm0
0xdbf2c1: mov rax, qword ptr [r13 + 0x820]
0xdbf2c8: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf2cd: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf2d2: vmovups ymm0, ymmword ptr [rsp + 0x110]
0xdbf2db: vperm2f128 ymm5, ymm0, ymm0, 0
0xdbf2e1: vperm2f128 ymm6, ymm0, ymm0, 0x11
0xdbf2e7: vmovups ymm1, ymmword ptr [rsp + 0x130]
0xdbf2f0: vperm2f128 ymm7, ymm1, ymm1, 0
0xdbf2f6: vperm2f128 ymm8, ymm1, ymm1, 0x11
0xdbf2fc: vshufps ymm0, ymm3, ymm3, 0
0xdbf301: vmulps ymm2, ymm0, ymm5
0xdbf305: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf30a: vfmadd231ps ymm2, ymm1, ymm6
0xdbf30f: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf314: vfmadd231ps ymm2, ymm0, ymm7
0xdbf319: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf31e: vfmadd231ps ymm2, ymm1, ymm8
0xdbf323: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf328: vshufps ymm0, ymm4, ymm4, 0
0xdbf32d: vmulps ymm3, ymm0, ymm5
0xdbf331: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf336: vfmadd231ps ymm3, ymm1, ymm6
0xdbf33b: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf340: vfmadd231ps ymm3, ymm0, ymm7
0xdbf345: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf34a: vfmadd231ps ymm3, ymm1, ymm8
0xdbf34f: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf354: mov rax, qword ptr [r13 + 0x870]
0xdbf35b: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf360: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf365: vshufps ymm0, ymm2, ymm2, 0
0xdbf36a: vmulps ymm3, ymm0, ymm5
0xdbf36e: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf373: vfmadd231ps ymm3, ymm1, ymm6
0xdbf378: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf37d: vfmadd231ps ymm3, ymm0, ymm7
0xdbf382: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf387: vfmadd231ps ymm3, ymm1, ymm8
0xdbf38c: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf391: vshufps ymm0, ymm4, ymm4, 0
0xdbf396: vmulps ymm2, ymm0, ymm5
0xdbf39a: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf39f: vfmadd231ps ymm2, ymm1, ymm6
0xdbf3a4: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf3a9: vfmadd231ps ymm2, ymm0, ymm7
0xdbf3ae: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf3b3: vfmadd231ps ymm2, ymm1, ymm8
0xdbf3b8: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf3bd: mov rax, qword ptr [r13 + 0x8c0]
0xdbf3c4: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf3c9: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf3ce: vshufps ymm0, ymm2, ymm2, 0
0xdbf3d3: vmulps ymm3, ymm0, ymm5
0xdbf3d7: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf3dc: vfmadd231ps ymm3, ymm1, ymm6
0xdbf3e1: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf3e6: vfmadd231ps ymm3, ymm0, ymm7
0xdbf3eb: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf3f0: vfmadd231ps ymm3, ymm1, ymm8
0xdbf3f5: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf3fa: vshufps ymm0, ymm4, ymm4, 0
0xdbf3ff: vmulps ymm2, ymm0, ymm5
0xdbf403: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf408: vfmadd231ps ymm2, ymm1, ymm6
0xdbf40d: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf412: vfmadd231ps ymm2, ymm0, ymm7
0xdbf417: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf41c: vfmadd231ps ymm2, ymm1, ymm8
0xdbf421: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf426: mov rax, qword ptr [r13 + 0x910]
0xdbf42d: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf432: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf437: vshufps ymm0, ymm2, ymm2, 0
0xdbf43c: vmulps ymm3, ymm0, ymm5
0xdbf440: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf445: vfmadd231ps ymm3, ymm1, ymm6
0xdbf44a: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf44f: vfmadd231ps ymm3, ymm0, ymm7
0xdbf454: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf459: vfmadd231ps ymm3, ymm1, ymm8
0xdbf45e: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf463: vshufps ymm0, ymm4, ymm4, 0
0xdbf468: vmulps ymm2, ymm0, ymm5
0xdbf46c: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf471: vfmadd231ps ymm2, ymm1, ymm6
0xdbf476: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf47b: vfmadd231ps ymm2, ymm0, ymm7
0xdbf480: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf485: vfmadd231ps ymm2, ymm1, ymm8
0xdbf48a: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf48f: cmp byte ptr [rip + 0x5fa7842], 0
0xdbf496: je 0x140dbf706
0xdbf49c: cmp qword ptr [r13 + 0x7b0], 0
0xdbf4a4: je 0x140dbf706
0xdbf4aa: mov rax, qword ptr [r13 + 0x820]
0xdbf4b1: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf4b6: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf4bb: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf4c4: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf4cd: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf4d3: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf4d9: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf4df: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf4e5: vshufps ymm0, ymm3, ymm3, 0
0xdbf4ea: vmulps ymm2, ymm0, ymm4
0xdbf4ee: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf4f3: vfmadd231ps ymm2, ymm1, ymm5
0xdbf4f8: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf4fd: vfmadd231ps ymm2, ymm0, ymm6
0xdbf502: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf507: vfmadd231ps ymm2, ymm1, ymm7
0xdbf50c: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf511: vshufps ymm0, ymm8, ymm8, 0
0xdbf517: vmulps ymm3, ymm0, ymm4
0xdbf51b: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf521: vfmadd231ps ymm3, ymm1, ymm5
0xdbf526: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf52c: vfmadd231ps ymm3, ymm0, ymm6
0xdbf531: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf537: vfmadd231ps ymm3, ymm1, ymm7
0xdbf53c: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf541: mov rax, qword ptr [r13 + 0x8c0]
0xdbf548: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf54d: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf552: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf55b: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf564: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf56a: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf570: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf576: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf57c: vshufps ymm0, ymm3, ymm3, 0
0xdbf581: vmulps ymm2, ymm0, ymm4
0xdbf585: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf58a: vfmadd231ps ymm2, ymm1, ymm5
0xdbf58f: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf594: vfmadd231ps ymm2, ymm0, ymm6
0xdbf599: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf59e: vfmadd231ps ymm2, ymm1, ymm7
0xdbf5a3: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf5a8: vshufps ymm0, ymm8, ymm8, 0
0xdbf5ae: vmulps ymm3, ymm0, ymm4
0xdbf5b2: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf5b8: vfmadd231ps ymm3, ymm1, ymm5
0xdbf5bd: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf5c3: vfmadd231ps ymm3, ymm0, ymm6
0xdbf5c8: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf5ce: vfmadd231ps ymm3, ymm1, ymm7
0xdbf5d3: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf5d8: mov rax, qword ptr [r13 + 0x910]
0xdbf5df: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf5e4: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf5e9: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf5f2: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf5fb: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf601: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf607: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf60d: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf613: vshufps ymm0, ymm3, ymm3, 0
0xdbf618: vmulps ymm2, ymm0, ymm4
0xdbf61c: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf621: vfmadd231ps ymm2, ymm1, ymm5
0xdbf626: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf62b: vfmadd231ps ymm2, ymm0, ymm6
0xdbf630: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf635: vfmadd231ps ymm2, ymm1, ymm7
0xdbf63a: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf63f: vshufps ymm0, ymm8, ymm8, 0
0xdbf645: vmulps ymm3, ymm0, ymm4
0xdbf649: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf64f: vfmadd231ps ymm3, ymm1, ymm5
0xdbf654: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf65a: vfmadd231ps ymm3, ymm0, ymm6
0xdbf65f: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf665: vfmadd231ps ymm3, ymm1, ymm7
0xdbf66a: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf66f: mov rax, qword ptr [r13 + 0x870]
0xdbf676: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf67b: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf680: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf689: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf692: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf698: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf69e: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf6a4: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf6aa: vshufps ymm0, ymm3, ymm3, 0
0xdbf6af: vmulps ymm2, ymm0, ymm4
0xdbf6b3: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf6b8: vfmadd231ps ymm2, ymm1, ymm5
0xdbf6bd: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf6c2: vfmadd231ps ymm2, ymm0, ymm6
0xdbf6c7: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf6cc: vfmadd231ps ymm2, ymm1, ymm7
0xdbf6d1: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf6d6: vshufps ymm0, ymm8, ymm8, 0
0xdbf6dc: vmulps ymm3, ymm0, ymm4
0xdbf6e0: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf6e6: vfmadd231ps ymm3, ymm1, ymm5
0xdbf6eb: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf6f1: vfmadd231ps ymm3, ymm0, ymm6
0xdbf6f6: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf6fc: vfmadd231ps ymm3, ymm1, ymm7
0xdbf701: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf706: lea rdx, [r13 + 0x828]
0xdbf70d: mov rcx, r13
0xdbf710: vzeroupper 
0xdbf713: call 0x140dc17c0
0xdbf718: lea rdx, [r13 + 0x878]
0xdbf71f: mov rcx, r13
0xdbf722: call 0x140dc17c0
0xdbf727: lea rdx, [r13 + 0x8c8]
0xdbf72e: mov rcx, r13
0xdbf731: call 0x140dc17c0
0xdbf736: lea rdx, [r13 + 0x918]
0xdbf73d: mov rcx, r13
0xdbf740: call 0x140dc17c0
0xdbf745: cmp byte ptr [r13 + 0xad8], 0
0xdbf74d: je 0x140dbf761
0xdbf74f: cmp dword ptr [r13 + 0x490], 0
0xdbf757: je 0x140dbf761
0xdbf759: mov byte ptr [r13 + 0xad7], 1
0xdbf761: mov byte ptr [r13 + 0xad8], 0
0xdbf769: cmp byte ptr [rip + 0x5eebff8], 0
0xdbf770: jne 0x140dbf780
0xdbf772: cmp byte ptr [r13 + 0xad7], 0
0xdbf77a: je 0x140dc1743
0xdbf780: mov byte ptr [r13 + 0xad7], 0
0xdbf788: mov rcx, qword ptr [r13 + 0x820]
0xdbf78f: call 0x143d11360
0xdbf794: mov rcx, qword ptr [r13 + 0x870]
0xdbf79b: call 0x143d11360
0xdbf7a0: mov rcx, qword ptr [r13 + 0x8c0]
0xdbf7a7: call 0x143d11360
0xdbf7ac: mov rcx, qword ptr [r13 + 0x910]
0xdbf7b3: call 0x143d11360
0xdbf7b8: mov rcx, qword ptr [r13 + 0x820]
0xdbf7bf: lea r9, [r13 + 0x84c]
0xdbf7c6: vmovss xmm0, dword ptr [r9]
0xdbf7cb: lea r10, [r13 + 0x848]
0xdbf7d2: mov eax, dword ptr [r10]
0xdbf7d5: mov dword ptr [rcx + 0xc8], eax
0xdbf7db: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf7e3: mov rcx, qword ptr [r13 + 0x870]
0xdbf7ea: lea rdi, [r13 + 0x89c]
0xdbf7f1: vmovss xmm0, dword ptr [rdi]
0xdbf7f5: lea rsi, [r13 + 0x898]
0xdbf7fc: mov eax, dword ptr [rsi]
0xdbf7fe: mov dword ptr [rcx + 0xc8], eax
0xdbf804: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf80c: mov rcx, qword ptr [r13 + 0x8c0]
0xdbf813: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdbf81c: mov eax, dword ptr [r13 + 0x8e8]
0xdbf823: mov dword ptr [rcx + 0xc8], eax
0xdbf829: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf831: mov rcx, qword ptr [r13 + 0x910]
0xdbf838: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdbf841: mov eax, dword ptr [r13 + 0x8e8]
0xdbf848: mov dword ptr [rcx + 0xc8], eax
0xdbf84e: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf856: mov r12, r14
0xdbf859: mov qword ptr [rsp + 0x78], r14
0xdbf85e: mov qword ptr [rsp + 0x180], r14
0xdbf866: mov qword ptr [rsp + 0x188], r14
0xdbf86e: mov rdx, r14
0xdbf871: mov qword ptr [rsp + 0x368], rdx
0xdbf879: mov qword ptr [rsp + 0x170], rdx
0xdbf881: mov qword ptr [rsp + 0x178], r14
0xdbf889: mov rax, r14
0xdbf88c: mov qword ptr [rsp + 0xc8], rax
0xdbf894: mov qword ptr [rsp + 0x190], rax
0xdbf89c: mov qword ptr [rsp + 0x198], r14
0xdbf8a4: mov rbx, qword ptr [r13 + 0x478]
0xdbf8ab: mov qword ptr [rsp + 0x60], rbx
0xdbf8b0: mov eax, dword ptr [r13 + 0x480]
0xdbf8b7: lea rcx, [rax + rax*2]
0xdbf8bb: lea rax, [rbx + rcx*8]
0xdbf8bf: mov qword ptr [rsp + 0xa0], rax
0xdbf8c7: mov ecx, 1
0xdbf8cc: mov r8d, 0x1fd
0xdbf8d2: vmovss xmm12, dword ptr [rip + 0x4fb6476]
0xdbf8da: cmp rbx, rax
0xdbf8dd: je 0x140dc007a
0xdbf8e3: mov edi, 0xffff
0xdbf8e8: vmovss xmm15, dword ptr [rip + 0x4fb4098]
0xdbf8f0: jmp 0x140dbf905
0xdbf8f2: nop dword ptr [rax]
0xdbf8f6: nop word ptr [rax + rax]
0xdbf900: mov ecx, 1
0xdbf905: mov r8d, ecx
0xdbf908: movzx edx, word ptr [rbx]
0xdbf90b: call 0x140652f40
0xdbf910: mov byte ptr [rsp + 0x368], al
0xdbf917: mov rcx, rbx
0xdbf91a: call 0x140433650
0xdbf91f: movzx ebx, word ptr [rax + 0x18]
0xdbf923: test r15, r15
0xdbf926: lea rdx, [r15 + 8]
0xdbf92a: jne 0x140dbf92f
0xdbf92c: mov rdx, r14
0xdbf92f: mov rdx, qword ptr [rdx]
0xdbf932: lea rcx, [rsp + 0x210]
0xdbf93a: call 0x140393df0
0xdbf93f: nop 
0xdbf940: cmp dword ptr [r15 + 0x28], ebx
0xdbf944: jbe 0x140dbf959
0xdbf946: imul rdx, rbx, 0x1c8
0xdbf94d: add rdx, qword ptr [r15 + 0x20]
0xdbf951: je 0x140dbf959
0xdbf953: movzx eax, word ptr [rdx + 0x18]
0xdbf957: jmp 0x140dbf95b
0xdbf959: mov eax, edi
0xdbf95b: mov word ptr [rsp + 0x358], ax
0xdbf963: mov rcx, qword ptr [rsp + 0x210]
0xdbf96b: mov rax, qword ptr [rcx]
0xdbf96e: mov dl, 1
0xdbf970: call qword ptr [rax + 0x20]
0xdbf973: mov byte ptr [rsp + 0x360], 1
0xdbf97b: lea rcx, [rsp + 0x358]
0xdbf983: call 0x140430150
0xdbf988: cmp word ptr [rax + 0x24], di
0xdbf98c: je 0x140dbf9b1
0xdbf98e: lea rcx, [rsp + 0x358]
0xdbf996: call 0x140430150
0xdbf99b: mov r8d, 1
0xdbf9a1: movzx edx, word ptr [rax + 0x24]
0xdbf9a5: call 0x140652f40
0xdbf9aa: mov byte ptr [rsp + 0x360], al
0xdbf9b1: mov rbx, qword ptr [rsp + 0x60]
0xdbf9b6: mov rcx, rbx
0xdbf9b9: call 0x140433650
0xdbf9be: cmp word ptr [rax + 0x18], di
0xdbf9c2: je 0x140dbf9ea
0xdbf9c4: mov rcx, rbx
0xdbf9c7: call 0x140433650
0xdbf9cc: movzx r8d, word ptr [rax + 0x18]
0xdbf9d1: lea rdx, [rsp + 0x258]
0xdbf9d9: mov rcx, r15
0xdbf9dc: call 0x14176bcc0
0xdbf9e1: vmovsd xmm0, qword ptr [rax]
0xdbf9e5: mov ecx, dword ptr [rax + 8]
0xdbf9e8: jmp 0x140dbfa29
0xdbf9ea: movzx edx, word ptr [rbx]
0xdbf9ed: mov rcx, qword ptr [rsp + 0x1e0]
0xdbf9f5: call 0x140d91e30
0xdbf9fa: cmp dword ptr [rax + 0x58], 0
0xdbf9fe: jne 0x140dbfa05
0xdbfa00: movzx eax, di
0xdbfa03: jmp 0x140dbfa0c
0xdbfa05: mov rax, qword ptr [rax + 0x50]
0xdbfa09: movzx eax, word ptr [rax]
0xdbfa0c: mov word ptr [rsp + 0x358], ax
0xdbfa14: lea rcx, [rsp + 0x358]
0xdbfa1c: call 0x140537250
0xdbfa21: vmovsd xmm0, qword ptr [rax + 0x14]
0xdbfa26: mov ecx, dword ptr [rax + 0x1c]
0xdbfa29: vmovsd qword ptr [rsp + 0x218], xmm0
0xdbfa32: mov r12, qword ptr [rbx + 8]
0xdbfa36: mov qword ptr [rsp + 0x78], r12
0xdbfa3b: mov eax, dword ptr [rbx + 0x10]
0xdbfa3e: lea rax, [r12 + rax*2]
0xdbfa42: mov qword ptr [rsp + 0x168], rax
0xdbfa4a: cmp r12, rax
0xdbfa4d: je 0x140dc000c
0xdbfa53: vmovd xmm0, ecx
0xdbfa57: vxorps xmm13, xmm0, xmm12
0xdbfa5c: vmovss xmm11, dword ptr [rsp + 0x218]
0xdbfa65: vmovss dword ptr [rsp + 0x160], xmm11
0xdbfa6e: vmovss dword ptr [rsp + 0x164], xmm13
0xdbfa77: mov r14, qword ptr [rsp + 0x160]
0xdbfa7f: nop 
0xdbfa80: mov rcx, r12
0xdbfa83: call 0x140433650
0xdbfa88: cmp word ptr [rax + 0x18], di
0xdbfa8c: je 0x140dbfab4
0xdbfa8e: mov rcx, r12
0xdbfa91: call 0x140433650
0xdbfa96: movzx r8d, word ptr [rax + 0x18]
0xdbfa9b: lea rdx, [rsp + 0x264]
0xdbfaa3: mov rcx, r15
0xdbfaa6: call 0x14176bcc0
0xdbfaab: vmovsd xmm0, qword ptr [rax]
0xdbfaaf: mov ecx, dword ptr [rax + 8]
0xdbfab2: jmp 0x140dbfaf5
0xdbfab4: movzx edx, word ptr [r12]
0xdbfab9: mov rcx, qword ptr [rsp + 0x1e0]
0xdbfac1: call 0x140d91e30
0xdbfac6: cmp dword ptr [rax + 0x58], 0
0xdbfaca: jne 0x140dbfad1
0xdbfacc: movzx eax, di
0xdbfacf: jmp 0x140dbfad8
0xdbfad1: mov rax, qword ptr [rax + 0x50]
0xdbfad5: movzx eax, word ptr [rax]
0xdbfad8: mov word ptr [rsp + 0x358], ax
0xdbfae0: lea rcx, [rsp + 0x358]
0xdbfae8: call 0x140537250
0xdbfaed: vmovsd xmm0, qword ptr [rax + 0x14]
0xdbfaf2: mov ecx, dword ptr [rax + 0x1c]
0xdbfaf5: vmovsd qword ptr [rsp + 0x228], xmm0
0xdbfafe: vmovd xmm0, ecx
0xdbfb02: vxorps xmm8, xmm0, xmm12
0xdbfb07: vmovss xmm9, dword ptr [rsp + 0x228]
0xdbfb10: vmovss dword ptr [rsp + 0xe0], xmm9
0xdbfb19: vmovss dword ptr [rsp + 0xe4], xmm8
0xdbfb22: cmp byte ptr [rip + 0x5eebc8f], 0
0xdbfb29: je 0x140dbfbf0
0xdbfb2f: vaddss xmm7, xmm11, xmm14
0xdbfb34: vsubss xmm1, xmm8, xmm13
0xdbfb39: vsubss xmm0, xmm9, xmm11
0xdbfb3e: vdivss xmm2, xmm1, xmm0
0xdbfb42: vdivss xmm3, xmm15, xmm2
0xdbfb46: vaddss xmm0, xmm11, xmm14
0xdbfb4b: vmulss xmm6, xmm3, xmm0
0xdbfb4f: vmulss xmm1, xmm7, xmm7
0xdbfb53: vmulss xmm0, xmm6, xmm6
0xdbfb57: vaddss xmm2, xmm1, xmm0
0xdbfb5b: vcomiss xmm2, xmm10
0xdbfb60: jbe 0x140dbfb87
0xdbfb62: vxorps xmm0, xmm0, xmm0
0xdbfb66: vucomiss xmm0, xmm2
0xdbfb6a: ja 0x140dbfb72
0xdbfb6c: vsqrtss xmm0, xmm2, xmm2
0xdbfb70: jmp 0x140dbfb7b
0xdbfb72: vmovaps xmm0, xmm2
0xdbfb76: call 0x144898f6e
0xdbfb7b: vdivss xmm0, xmm14, xmm0
0xdbfb7f: vmulss xmm7, xmm0, xmm7
0xdbfb83: vmulss xmm6, xmm6, xmm0
0xdbfb87: vcomiss xmm6, xmm10
0xdbfb8c: jbe 0x140dbfb98
0xdbfb8e: vmulss xmm7, xmm7, xmm15
0xdbfb93: vmulss xmm6, xmm6, xmm15
0xdbfb98: vmulss xmm3, xmm6, dword ptr [rip + 0x5eebb78]
0xdbfba0: vmulss xmm2, xmm7, dword ptr [rip + 0x5eebb70]
0xdbfba8: vaddss xmm0, xmm2, xmm11
0xdbfbad: vmovss dword ptr [rsp + 0x1a0], xmm0
0xdbfbb6: vaddss xmm1, xmm13, xmm3
0xdbfbba: vmovss dword ptr [rsp + 0x1a4], xmm1
0xdbfbc3: mov rdi, qword ptr [rsp + 0x1a0]
0xdbfbcb: vaddss xmm0, xmm2, xmm9
0xdbfbd0: vmovss dword ptr [rsp + 0x1d0], xmm0
0xdbfbd9: vaddss xmm1, xmm8, xmm3
0xdbfbdd: vmovss dword ptr [rsp + 0x1d4], xmm1
0xdbfbe6: mov rsi, qword ptr [rsp + 0x1d0]
0xdbfbee: jmp 0x140dbfc3e
0xdbfbf0: vsubss xmm0, xmm11, xmm10
0xdbfbf5: vmovss dword ptr [rsp + 0x1c0], xmm0
0xdbfbfe: vsubss xmm1, xmm13, dword ptr [rip + 0x5eebb12]
0xdbfc06: vmovss dword ptr [rsp + 0x1c4], xmm1
0xdbfc0f: mov rdi, qword ptr [rsp + 0x1c0]
0xdbfc17: vsubss xmm0, xmm9, xmm10
0xdbfc1c: vmovss dword ptr [rsp + 0x1b8], xmm0
0xdbfc25: vsubss xmm1, xmm8, dword ptr [rip + 0x5eebaeb]
0xdbfc2d: vmovss dword ptr [rsp + 0x1bc], xmm1
0xdbfc36: mov rsi, qword ptr [rsp + 0x1b8]
0xdbfc3e: mov qword ptr [rsp + 0xf0], rdi
0xdbfc46: mov byte ptr [rsp + 0x358], 0
0xdbfc4e: mov rcx, rbx
0xdbfc51: call 0x140433650
0xdbfc56: mov ecx, 0xffff
0xdbfc5b: cmp word ptr [rax + 0x18], cx
0xdbfc5f: je 0x140dc07f1
0xdbfc65: mov rcx, r12
0xdbfc68: call 0x140433650
0xdbfc6d: mov ecx, 0xffff
0xdbfc72: cmp word ptr [rax + 0x18], cx
0xdbfc76: je 0x140dc07f1
0xdbfc7c: mov rcx, rbx
0xdbfc7f: call 0x140433650
0xdbfc84: movzx ebx, word ptr [rax + 0x18]
0xdbfc88: test r15, r15
0xdbfc8b: je 0x140dbfc93
0xdbfc8d: lea rdx, [r15 + 8]
0xdbfc91: jmp 0x140dbfc97
0xdbfc93: xor eax, eax
0xdbfc95: mov edx, eax
0xdbfc97: mov rdx, qword ptr [rdx]
0xdbfc9a: lea rcx, [rsp + 0x1b0]
0xdbfca2: call 0x140393df0
0xdbfca7: nop 
0xdbfca8: cmp dword ptr [r15 + 0x28], ebx
0xdbfcac: jbe 0x140dbfdb7
0xdbfcb2: imul rbx, rbx, 0x1c8
0xdbfcb9: add rbx, qword ptr [r15 + 0x20]
0xdbfcbd: je 0x140dbfdb7
0xdbfcc3: movzx ebx, byte ptr [rbx + 0x1c]
0xdbfcc7: mov rcx, qword ptr [rsp + 0x1b0]
0xdbfccf: mov rax, qword ptr [rcx]
0xdbfcd2: mov dl, 1
0xdbfcd4: call qword ptr [rax + 0x20]
0xdbfcd7: test bl, bl
0xdbfcd9: jne 0x140dbfdc7
0xdbfcdf: mov rcx, qword ptr [rsp + 0x60]
0xdbfce4: call 0x140433650
0xdbfce9: movzx ebx, word ptr [rax + 0x18]
0xdbfced: mov rdx, qword ptr [r15 + 8]
0xdbfcf1: lea rcx, [rsp + 0xd0]
0xdbfcf9: call 0x140393df0
0xdbfcfe: nop 
0xdbfcff: mov r9d, dword ptr [r15 + 0x28]
0xdbfd03: cmp r9d, ebx
0xdbfd06: jbe 0x140dbfd8e
0xdbfd0c: mov r8, qword ptr [r15 + 0x20]
0xdbfd10: imul rax, rbx, 0x1c8
0xdbfd17: add rax, r8
0xdbfd1a: je 0x140dbfd8e
0xdbfd1c: cmp byte ptr [rax + 0x1c], 0
0xdbfd20: jne 0x140dbfd8e
0xdbfd22: mov rbx, qword ptr [rax + 0x10]
0xdbfd26: movzx edx, word ptr [rbx]
0xdbfd29: mov eax, 0xffff
0xdbfd2e: cmp dx, ax
0xdbfd31: je 0x140dbfd8e
0xdbfd33: movzx ebx, word ptr [rbx + 2]
0xdbfd37: cmp ax, bx
0xdbfd3a: je 0x140dbfd65
0xdbfd3c: cmp r9d, ebx
0xdbfd3f: jbe 0x140dbfd65
0xdbfd41: imul rax, rbx, 0x1c8
0xdbfd48: add rax, r8
0xdbfd4b: je 0x140dbfd65
0xdbfd4d: cmp word ptr [rax + 0x18], dx
0xdbfd51: jne 0x140dbfd65
0xdbfd53: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd5b: mov rax, qword ptr [rcx]
0xdbfd5e: mov dl, 1
0xdbfd60: call qword ptr [rax + 0x20]
0xdbfd63: jmp 0x140dbfda3
0xdbfd65: cmp dword ptr [r15 + 0x38], edx
0xdbfd69: jbe 0x140dbfd8e
0xdbfd6b: imul rbx, rdx, 0xd0
0xdbfd72: add rbx, qword ptr [r15 + 0x30]
0xdbfd76: je 0x140dbfd8e
0xdbfd78: movzx ebx, word ptr [rbx + 0x38]
0xdbfd7c: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd84: mov rax, qword ptr [rcx]
0xdbfd87: mov dl, 1
0xdbfd89: call qword ptr [rax + 0x20]
0xdbfd8c: jmp 0x140dbfda3
0xdbfd8e: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd96: mov rax, qword ptr [rcx]
0xdbfd99: mov dl, 1
0xdbfd9b: call qword ptr [rax + 0x20]
0xdbfd9e: mov ebx, 0xffff
0xdbfda3: mov rcx, r12
0xdbfda6: call 0x140433650
0xdbfdab: cmp bx, word ptr [rax + 0x18]
0xdbfdaf: je 0x140dbff00
0xdbfdb5: jmp 0x140dbfdc7
0xdbfdb7: mov rcx, qword ptr [rsp + 0x1b0]
0xdbfdbf: mov rax, qword ptr [rcx]
0xdbfdc2: mov dl, 1
0xdbfdc4: call qword ptr [rax + 0x20]
0xdbfdc7: mov rcx, r12
0xdbfdca: call 0x140433650
0xdbfdcf: movzx ebx, word ptr [rax + 0x18]
0xdbfdd3: test r15, r15
0xdbfdd6: je 0x140dbfdde
0xdbfdd8: lea rdx, [r15 + 8]
0xdbfddc: jmp 0x140dbfde2
0xdbfdde: xor eax, eax
0xdbfde0: mov edx, eax
0xdbfde2: mov rdx, qword ptr [rdx]
0xdbfde5: lea rcx, [rsp + 0x1c8]
0xdbfded: call 0x140393df0
0xdbfdf2: nop 
0xdbfdf3: cmp dword ptr [r15 + 0x28], ebx
0xdbfdf7: jbe 0x140dc00fc
0xdbfdfd: imul rbx, rbx, 0x1c8
0xdbfe04: add rbx, qword ptr [r15 + 0x20]
0xdbfe08: je 0x140dc00fc
0xdbfe0e: movzx ebx, byte ptr [rbx + 0x1c]
0xdbfe12: mov rcx, qword ptr [rsp + 0x1c8]
0xdbfe1a: mov rax, qword ptr [rcx]
0xdbfe1d: mov dl, 1
0xdbfe1f: call qword ptr [rax + 0x20]
0xdbfe22: test bl, bl
0xdbfe24: jne 0x140dc010c
0xdbfe2a: mov rcx, r12
0xdbfe2d: call 0x140433650
0xdbfe32: movzx ebx, word ptr [rax + 0x18]
0xdbfe36: mov rdx, qword ptr [r15 + 8]
0xdbfe3a: lea rcx, [rsp + 0xd8]
0xdbfe42: call 0x140393df0
0xdbfe47: nop 
0xdbfe48: mov r9d, dword ptr [r15 + 0x28]
0xdbfe4c: cmp r9d, ebx
0xdbfe4f: jbe 0x140dbfed7
0xdbfe55: mov r8, qword ptr [r15 + 0x20]
0xdbfe59: imul rax, rbx, 0x1c8
0xdbfe60: add rax, r8
0xdbfe63: je 0x140dbfed7
0xdbfe65: cmp byte ptr [rax + 0x1c], 0
0xdbfe69: jne 0x140dbfed7
0xdbfe6b: mov rbx, qword ptr [rax + 0x10]
0xdbfe6f: movzx edx, word ptr [rbx]
0xdbfe72: mov eax, 0xffff
0xdbfe77: cmp dx, ax
0xdbfe7a: je 0x140dbfed7
0xdbfe7c: movzx ebx, word ptr [rbx + 2]
0xdbfe80: cmp ax, bx
0xdbfe83: je 0x140dbfeae
0xdbfe85: cmp r9d, ebx
0xdbfe88: jbe 0x140dbfeae
0xdbfe8a: imul rax, rbx, 0x1c8
0xdbfe91: add rax, r8
0xdbfe94: je 0x140dbfeae
0xdbfe96: cmp word ptr [rax + 0x18], dx
0xdbfe9a: jne 0x140dbfeae
0xdbfe9c: mov rcx, qword ptr [rsp + 0xd8]
0xdbfea4: mov rax, qword ptr [rcx]
0xdbfea7: mov dl, 1
0xdbfea9: call qword ptr [rax + 0x20]
0xdbfeac: jmp 0x140dbfeec
0xdbfeae: cmp dword ptr [r15 + 0x38], edx
0xdbfeb2: jbe 0x140dbfed7
0xdbfeb4: imul rbx, rdx, 0xd0
0xdbfebb: add rbx, qword ptr [r15 + 0x30]
0xdbfebf: je 0x140dbfed7
0xdbfec1: movzx ebx, word ptr [rbx + 0x38]
0xdbfec5: mov rcx, qword ptr [rsp + 0xd8]
0xdbfecd: mov rax, qword ptr [rcx]
0xdbfed0: mov dl, 1
0xdbfed2: call qword ptr [rax + 0x20]
0xdbfed5: jmp 0x140dbfeec
0xdbfed7: mov rcx, qword ptr [rsp + 0xd8]
0xdbfedf: mov rax, qword ptr [rcx]
0xdbfee2: mov dl, 1
0xdbfee4: call qword ptr [rax + 0x20]
0xdbfee7: mov ebx, 0xffff
0xdbfeec: mov rcx, qword ptr [rsp + 0x60]
0xdbfef1: call 0x140433650
0xdbfef6: cmp bx, word ptr [rax + 0x18]
0xdbfefa: jne 0x140dc010c
0xdbff00: cmp byte ptr [rip + 0x5eeb901], 0
0xdbff07: je 0x140dbffe8
0xdbff0d: mov byte ptr [rsp + 0x358], 1
0xdbff15: cmp byte ptr [rsp + 0x368], 0
0xdbff1d: je 0x140dbffe8
0xdbff23: cmp byte ptr [rsp + 0x360], 0
0xdbff2b: je 0x140dbffe8
0xdbff31: mov r8d, 1
0xdbff37: movzx edx, word ptr [r12]
0xdbff3c: call 0x140652f40
0xdbff41: mov byte ptr [rsp + 0x6c], al
0xdbff45: mov byte ptr [rsp + 0x6d], 1
0xdbff4a: mov rcx, r12
0xdbff4d: call 0x140433650
0xdbff52: movzx ebx, word ptr [rax + 0x18]
0xdbff56: mov rdx, qword ptr [r15 + 8]
0xdbff5a: lea rcx, [rsp + 0x1f8]
0xdbff62: call 0x140393df0
0xdbff67: nop 
0xdbff68: cmp dword ptr [r15 + 0x28], ebx
0xdbff6c: jbe 0x140dbff81
0xdbff6e: imul rdx, rbx, 0x1c8
0xdbff75: add rdx, qword ptr [r15 + 0x20]
0xdbff79: je 0x140dbff81
0xdbff7b: movzx eax, word ptr [rdx + 0x18]
0xdbff7f: jmp 0x140dbff86
0xdbff81: mov eax, 0xffff
0xdbff86: mov word ptr [rsp + 0xc0], ax
0xdbff8e: mov rcx, qword ptr [rsp + 0x1f8]
0xdbff96: mov rax, qword ptr [rcx]
0xdbff99: mov dl, 1
0xdbff9b: call qword ptr [rax + 0x20]
0xdbff9e: lea rcx, [rsp + 0xc0]
0xdbffa6: call 0x140430150
0xdbffab: mov ecx, 0xffff
0xdbffb0: cmp word ptr [rax + 0x24], cx
0xdbffb4: je 0x140dbffd4
0xdbffb6: lea rcx, [rsp + 0xc0]
0xdbffbe: call 0x140430150
0xdbffc3: mov r8d, 1
0xdbffc9: movzx edx, word ptr [rax + 0x24]
0xdbffcd: call 0x140652f40
0xdbffd2: jmp 0x140dbffd9
0xdbffd4: movzx eax, byte ptr [rsp + 0x6d]
0xdbffd9: cmp byte ptr [rsp + 0x6c], 0
0xdbffde: je 0x140dbffe8
0xdbffe0: test al, al
0xdbffe2: jne 0x140dc010c
0xdbffe8: mov rbx, qword ptr [rsp + 0x60]
0xdbffed: add r12, 2
0xdbfff1: mov qword ptr [rsp + 0x78], r12
0xdbfff6: cmp r12, qword ptr [rsp + 0x168]
0xdbfffe: mov edi, 0xffff
0xdc0003: jne 0x140dbfa80
0xdc0009: xor r14d, r14d
0xdc000c: add rbx, 0x18
0xdc0010: mov qword ptr [rsp + 0x60], rbx
0xdc0015: cmp rbx, qword ptr [rsp + 0xa0]
0xdc001d: jne 0x140dbf900
0xdc0023: lea r9, [r13 + 0x84c]
0xdc002a: lea r10, [r13 + 0x848]
0xdc0031: lea rdi, [r13 + 0x89c]
0xdc0038: lea rsi, [r13 + 0x898]
0xdc003f: mov r12, qword ptr [rsp + 0x180]
0xdc0047: mov qword ptr [rsp + 0x78], r12
0xdc004c: mov rax, qword ptr [rsp + 0x170]
0xdc0054: mov qword ptr [rsp + 0x368], rax
0xdc005c: mov rax, qword ptr [rsp + 0x190]
0xdc0064: mov qword ptr [rsp + 0xc8], rax
0xdc006c: vmovss xmm9, dword ptr [rip + 0x4fb2ec0]
0xdc0074: mov r8d, 0x1fd
0xdc007a: mov qword ptr [rsp + 0x50], r14
0xdc007f: mov qword ptr [rsp + 0x58], 0
0xdc0088: vmovss xmm6, dword ptr [rip + 0x4fb2c88]
0xdc0090: vmovss dword ptr [rsp + 0x80], xmm6
0xdc0099: vmovss dword ptr [rsp + 0x84], xmm6
0xdc00a2: vmovss dword ptr [rsp + 0x88], xmm6
0xdc00ab: vmovss xmm0, dword ptr [r13 + 0x834]
0xdc00b4: vmovss dword ptr [rsp + 0x8c], xmm0
0xdc00bd: mov r14, r12
0xdc00c0: mov qword ptr [rsp + 0x360], r12
0xdc00c8: mov eax, dword ptr [rsp + 0x188]
0xdc00cf: shl rax, 4
0xdc00d3: add rax, r12
0xdc00d6: mov qword ptr [rsp + 0xa0], rax
0xdc00de: cmp r12, rax
0xdc00e1: je 0x140dc0cbb
0xdc00e7: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc00f0: lea r12, [r13 + 0x84c]
0xdc00f7: jmp 0x140dc09c6
0xdc00fc: mov rcx, qword ptr [rsp + 0x1c8]
0xdc0104: mov rax, qword ptr [rcx]
0xdc0107: mov dl, 1
0xdc0109: call qword ptr [rax + 0x20]
0xdc010c: xor eax, eax
0xdc010e: mov qword ptr [rsp + 0x90], rax
0xdc0116: mov qword ptr [rsp + 0x98], rax
0xdc011e: mov rax, qword ptr gs:[0x58]
0xdc0127: mov rcx, qword ptr [rax]
0xdc012a: mov eax, 0x1ec
0xdc012f: mov rdx, qword ptr [rip + 0x5fa93f2]
0xdc0136: cmp byte ptr [rax + rcx], 0
0xdc013a: cmovne rdx, qword ptr [rip + 0x5fa93ee]
0xdc0142: mov rax, qword ptr [rdx]
0xdc0145: mov rcx, qword ptr [rax + 8]
0xdc0149: mov r15, qword ptr [rcx + 0x348]
0xdc0150: mov rcx, r12
0xdc0153: call 0x140433650
0xdc0158: lea rbx, [rax + 0x18]
0xdc015c: mov rcx, qword ptr [rsp + 0x60]
0xdc0161: call 0x140433650
0xdc0166: lea rdx, [rax + 0x18]
0xdc016a: lea r9, [rsp + 0x90]
0xdc0172: mov r8, rbx
0xdc0175: mov rcx, r15
0xdc0178: call 0x1415dad20
0xdc017d: mov r15d, dword ptr [rsp + 0x98]
0xdc0185: test r15d, r15d
0xdc0188: jne 0x140dc05f0
0xdc018e: mov rcx, qword ptr [rsp + 0x60]
0xdc0193: call 0x140433650
0xdc0198: lea rcx, [rax + 0x18]
0xdc019c: call 0x140430020
0xdc01a1: mov rbx, qword ptr [rax + 0x90]
0xdc01a8: mov eax, dword ptr [rax + 0x98]
0xdc01ae: lea rcx, [rax + rax*2]
0xdc01b2: lea rax, [rbx + rcx*8]
0xdc01b6: mov qword ptr [rsp + 0xc8], rax
0xdc01be: cmp rbx, rax
0xdc01c1: je 0x140dc01e7
0xdc01c3: mov rcx, r12
0xdc01c6: call 0x140433650
0xdc01cb: movzx ecx, word ptr [rax + 0x18]
0xdc01cf: cmp word ptr [rbx + 2], cx
0xdc01d3: je 0x140dc02c1
0xdc01d9: add rbx, 0x18
0xdc01dd: cmp rbx, qword ptr [rsp + 0xc8]
0xdc01e5: jne 0x140dc01c3
0xdc01e7: mov r12, qword ptr [rsp + 0x90]
0xdc01ef: mov rbx, qword ptr [rsp + 0x1e0]
0xdc01f7: lea rdx, [rbx + 8]
0xdc01fb: test rbx, rbx
0xdc01fe: mov eax, 0
0xdc0203: cmove rdx, rax
0xdc0207: mov rdx, qword ptr [rdx]
0xdc020a: lea rcx, [rsp + 0x238]
0xdc0212: call 0x140393df0
0xdc0217: nop 
0xdc0218: mov qword ptr [rsp + 0x240], rbx
0xdc0220: mov r15d, dword ptr [rsp + 0x68]
0xdc0225: or r15d, 4
0xdc0229: mov dword ptr [rsp + 0x70], r15d
0xdc022e: mov rcx, qword ptr [rsp + 0x60]
0xdc0233: call 0x140433650
0xdc0238: lea rcx, [rax + 0x18]
0xdc023c: call 0x140430020
0xdc0241: movzx ecx, word ptr [rax + 0x12]
0xdc0245: mov rax, qword ptr [rbx + 0x68]
0xdc0249: mov rax, qword ptr [rax + 0x150]
0xdc0250: lea rcx, [rcx + rcx*2]
0xdc0254: mov rax, qword ptr [rax + 0x18]
0xdc0258: mov eax, dword ptr [rax + rcx*8]
0xdc025b: mov dword ptr [rsp + 0xc0], eax
0xdc0262: and r15d, 0xfffffffb
0xdc0266: mov dword ptr [rsp + 0x68], r15d
0xdc026b: mov dword ptr [rsp + 0x70], r15d
0xdc0270: mov rcx, qword ptr [rsp + 0x238]
0xdc0278: mov rax, qword ptr [rcx]
0xdc027b: mov dl, 1
0xdc027d: call qword ptr [rax + 0x20]
0xdc0280: mov rbx, qword ptr [rsp + 0x60]
0xdc0285: mov rcx, rbx
0xdc0288: call 0x140433650
0xdc028d: lea rcx, [rax + 0x18]
0xdc0291: call 0x140430020
0xdc0296: lea rcx, [rax + 0x12]
0xdc029a: mov eax, 0xffff
0xdc029f: cmp word ptr [rcx], ax
0xdc02a2: je 0x140dc049f
0xdc02a8: call 0x140433650
0xdc02ad: cmp dword ptr [rax + 0x90], 1
0xdc02b4: jge 0x140dc048e
0xdc02ba: xor eax, eax
0xdc02bc: jmp 0x140dc0495
0xdc02c1: mov rdx, qword ptr [rbx + 8]
0xdc02c5: mov qword ptr [rsp + 0xc8], rdx
0xdc02cd: mov eax, dword ptr [rbx + 0x10]
0xdc02d0: lea rcx, [rax + rax*2]
0xdc02d4: lea rax, [rdx + rcx*4]
0xdc02d8: mov qword ptr [rsp + 0x100], rax
0xdc02e0: cmp rdx, rax
0xdc02e3: je 0x140dc01e7
0xdc02e9: mov rax, qword ptr gs:[0x58]
0xdc02f2: mov r8, qword ptr [rax]
0xdc02f5: mov qword ptr [rsp + 0xc0], r8
0xdc02fd: mov r13d, dword ptr [rsp + 0x9c]
0xdc0305: mov r12, qword ptr [rsp + 0x90]
0xdc030d: mov r14d, 0x1fd
0xdc0313: mov edi, 1
0xdc0318: nop dword ptr [rax + rax]
0xdc0320: vmovss xmm0, dword ptr [rdx]
0xdc0324: vmovss dword ptr [rsp + 0x1a8], xmm0
0xdc032d: vmovss xmm1, dword ptr [rdx + 8]
0xdc0332: vxorps xmm2, xmm1, xmm12
0xdc0337: vmovss dword ptr [rsp + 0x1ac], xmm2
0xdc0340: cmp r13d, r15d
0xdc0343: ja 0x140dc0434
0xdc0349: lea ebx, [r13*2 + 1]
0xdc0351: add ebx, r13d
0xdc0354: shr ebx, 1
0xdc0356: cmp ebx, edi
0xdc0358: cmovb ebx, edi
0xdc035b: cmp r15d, ebx
0xdc035e: cmova ebx, r15d
0xdc0362: cmp ebx, r13d
0xdc0365: jbe 0x140dc0434
0xdc036b: lea ecx, [rbx*8]
0xdc0372: mov eax, r14d
0xdc0375: mov qword ptr [rsp + 0x200], rax
0xdc037d: mov edx, 4
0xdc0382: cmp byte ptr [r14 + r8], 0
0xdc0387: je 0x140dc0390
0xdc0389: call 0x1447efa78
0xdc038e: jmp 0x140dc0395
0xdc0390: call 0x1447ef9b0
0xdc0395: mov r13, rax
0xdc0398: test rax, rax
0xdc039b: jne 0x140dc03b5
0xdc039d: call 0x141318e70
0xdc03a2: xor r9d, r9d
0xdc03a5: xor r8d, r8d
0xdc03a8: mov edx, edi
0xdc03aa: mov ecx, 0xa0000002
0xdc03af: call qword ptr [rip + 0x442ad93]
0xdc03b5: test r15d, r15d
0xdc03b8: je 0x140dc03e5
0xdc03ba: mov rdx, r13
0xdc03bd: mov rcx, r12
0xdc03c0: sub rcx, r13
0xdc03c3: mov r8d, r15d
0xdc03c6: nop word ptr [rax + rax]
0xdc03d0: mov rax, qword ptr [rcx + rdx]
0xdc03d4: mov qword ptr [rdx], rax
0xdc03d7: lea rdx, [rdx + 8]
0xdc03db: sub r8, rdi
0xdc03de: jne 0x140dc03d0
0xdc03e0: mov eax, r14d
0xdc03e3: jmp 0x140dc03ed
0xdc03e5: mov rax, qword ptr [rsp + 0x200]
0xdc03ed: test r12, r12
0xdc03f0: je 0x140dc040f
0xdc03f2: mov rcx, qword ptr [rsp + 0xc0]
0xdc03fa: cmp byte ptr [rcx + rax], 0
0xdc03fe: mov rcx, r12
0xdc0401: je 0x140dc040a
0xdc0403: call 0x1447f03bc
0xdc0408: jmp 0x140dc040f
0xdc040a: call 0x1447f02bc
0xdc040f: mov r12, r13
0xdc0412: mov qword ptr [rsp + 0x90], r13
0xdc041a: mov r13d, ebx
0xdc041d: mov dword ptr [rsp + 0x9c], ebx
0xdc0424: mov rdx, qword ptr [rsp + 0xc8]
0xdc042c: mov r8, qword ptr [rsp + 0xc0]
0xdc0434: mov ecx, r15d
0xdc0437: mov rax, qword ptr [rsp + 0x1a8]
0xdc043f: mov qword ptr [r12 + rcx*8], rax
0xdc0443: inc r15d
0xdc0446: mov dword ptr [rsp + 0x98], r15d
0xdc044e: add rdx, 0xc
0xdc0452: mov qword ptr [rsp + 0xc8], rdx
0xdc045a: cmp rdx, qword ptr [rsp + 0x100]
0xdc0462: jne 0x140dc0320
0xdc0468: test r15d, r15d
0xdc046b: mov rdi, qword ptr [rsp + 0xf0]
0xdc0473: mov r14, qword ptr [rsp + 0x160]
0xdc047b: jne 0x140dc0600
0xdc0481: mov r13, qword ptr [rsp + 0x350]
0xdc0489: jmp 0x140dc01ef
0xdc048e: mov rax, qword ptr [rax + 0x88]
0xdc0495: cmp dword ptr [rax + 0x58], 1
0xdc0499: ja 0x140dc0587
0xdc049f: mov rcx, rbx
0xdc04a2: call 0x140433650
0xdc04a7: lea rcx, [rax + 0x18]
0xdc04ab: call 0x140430020
0xdc04b0: mov edx, dword ptr [rsp + 0xc0]
0xdc04b7: mov rcx, rax
0xdc04ba: call 0x141786f10
0xdc04bf: test al, al
0xdc04c1: jne 0x140dc0587
0xdc04c7: vmovss dword ptr [rsp + 0x40], xmm10
0xdc04cd: lea rax, [rsp + 0x100]
0xdc04d5: mov r9, rdi
0xdc04d8: mov r8, qword ptr [rsp + 0xe0]
0xdc04e0: mov rdx, r14
0xdc04e3: cmp byte ptr [rsp + 0x358], 0
0xdc04eb: je 0x140dc053a
0xdc04ed: vmovups xmm0, xmmword ptr [r13 + 0x878]
0xdc04f6: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc04ff: vmovss xmm0, dword ptr [r13 + 0x89c]
0xdc0508: vmovss dword ptr [rsp + 0x38], xmm0
0xdc050e: vmovss xmm1, dword ptr [r13 + 0x898]
0xdc0517: vmovss dword ptr [rsp + 0x30], xmm1
0xdc051d: mov qword ptr [rsp + 0x28], rax
0xdc0522: mov qword ptr [rsp + 0x20], rsi
0xdc0527: mov rcx, qword ptr [r13 + 0x870]
0xdc052e: call 0x143d11690
0xdc0533: xor edi, edi
0xdc0535: jmp 0x140dc07a0
0xdc053a: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc0543: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc054c: vmovss xmm0, dword ptr [r13 + 0x84c]
0xdc0555: vmovss dword ptr [rsp + 0x38], xmm0
0xdc055b: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc0564: vmovss dword ptr [rsp + 0x30], xmm1
0xdc056a: mov qword ptr [rsp + 0x28], rax
0xdc056f: mov qword ptr [rsp + 0x20], rsi
0xdc0574: mov rcx, qword ptr [r13 + 0x820]
0xdc057b: call 0x143d11690
0xdc0580: xor edi, edi
0xdc0582: jmp 0x140dc07a0
0xdc0587: vmovups xmm0, xmmword ptr [r13 + 0x8c8]
0xdc0590: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0599: vmovss dword ptr [rsp + 0x40], xmm10
0xdc059f: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdc05a8: vmovss dword ptr [rsp + 0x38], xmm0
0xdc05ae: vmovss xmm1, dword ptr [r13 + 0x8e8]
0xdc05b7: vmovss dword ptr [rsp + 0x30], xmm1
0xdc05bd: lea rax, [rsp + 0x100]
0xdc05c5: mov qword ptr [rsp + 0x28], rax
0xdc05ca: mov qword ptr [rsp + 0x20], rsi
0xdc05cf: mov r9, rdi
0xdc05d2: mov r8, qword ptr [rsp + 0xe0]
0xdc05da: mov rdx, r14
0xdc05dd: mov rcx, qword ptr [r13 + 0x8c0]
0xdc05e4: call 0x143d11690
0xdc05e9: xor edi, edi
0xdc05eb: jmp 0x140dc07a0
0xdc05f0: mov r13d, dword ptr [rsp + 0x9c]
0xdc05f8: mov r12, qword ptr [rsp + 0x90]
0xdc0600: mov rbx, qword ptr [rsp + 0x1e0]
0xdc0608: lea rdx, [rbx + 8]
0xdc060c: test rbx, rbx
0xdc060f: mov eax, 0
0xdc0614: cmove rdx, rax
0xdc0618: mov rdx, qword ptr [rdx]
0xdc061b: lea rcx, [rsp + 0x248]
0xdc0623: call 0x140393df0
0xdc0628: nop 
0xdc0629: mov qword ptr [rsp + 0x250], rbx
0xdc0631: mov edi, dword ptr [rsp + 0x68]
0xdc0635: or edi, 2
0xdc0638: mov dword ptr [rsp + 0x70], edi
0xdc063c: mov rsi, qword ptr [rsp + 0x60]
0xdc0641: mov rcx, rsi
0xdc0644: call 0x140433650
0xdc0649: lea rcx, [rax + 0x18]
0xdc064d: call 0x140430020
0xdc0652: movzx ecx, word ptr [rax + 0x12]
0xdc0656: mov rax, qword ptr [rbx + 0x68]
0xdc065a: mov rax, qword ptr [rax + 0x150]
0xdc0661: lea rcx, [rcx + rcx*2]
0xdc0665: mov rax, qword ptr [rax + 0x18]
0xdc0669: mov ebx, dword ptr [rax + rcx*8]
0xdc066c: and edi, 0xfffffffd
0xdc066f: mov dword ptr [rsp + 0x68], edi
0xdc0673: mov dword ptr [rsp + 0x70], edi
0xdc0677: mov rcx, qword ptr [rsp + 0x248]
0xdc067f: mov rax, qword ptr [rcx]
0xdc0682: mov dl, 1
0xdc0684: call qword ptr [rax + 0x20]
0xdc0687: mov rcx, rsi
0xdc068a: call 0x140433650
0xdc068f: lea rcx, [rax + 0x18]
0xdc0693: call 0x140430020
0xdc0698: lea rcx, [rax + 0x12]
0xdc069c: mov eax, 0xffff
0xdc06a1: cmp word ptr [rcx], ax
0xdc06a4: je 0x140dc06c5
0xdc06a6: call 0x140433650
0xdc06ab: cmp dword ptr [rax + 0x90], 1
0xdc06b2: jge 0x140dc06b8
0xdc06b4: xor eax, eax
0xdc06b6: jmp 0x140dc06bf
0xdc06b8: mov rax, qword ptr [rax + 0x88]
0xdc06bf: cmp dword ptr [rax + 0x58], 1
0xdc06c3: ja 0x140dc0702
0xdc06c5: mov rcx, rsi
0xdc06c8: call 0x140433650
0xdc06cd: lea rcx, [rax + 0x18]
0xdc06d1: call 0x140430020
0xdc06d6: mov edx, ebx
0xdc06d8: mov rcx, rax
0xdc06db: call 0x141786f10
0xdc06e0: test al, al
0xdc06e2: jne 0x140dc0702
0xdc06e4: lea rbx, [rsp + 0x170]
0xdc06ec: lea rax, [rsp + 0x180]
0xdc06f4: cmp byte ptr [rsp + 0x358], 0
0xdc06fc: cmove rbx, rax
0xdc0700: jmp 0x140dc070a
0xdc0702: lea rbx, [rsp + 0x190]
0xdc070a: xor edi, edi
0xdc070c: mov qword ptr [rsp + 0x80], rdi
0xdc0714: mov qword ptr [rsp + 0x88], rdi
0xdc071c: mov edx, dword ptr [rbx + 8]
0xdc071f: cmp dword ptr [rbx + 0xc], edx
0xdc0722: ja 0x140dc072c
0xdc0724: mov rcx, rbx
0xdc0727: call 0x14040eaf0
0xdc072c: mov eax, dword ptr [rbx + 8]
0xdc072f: mov edx, eax
0xdc0731: add rdx, rdx
0xdc0734: mov rcx, qword ptr [rbx]
0xdc0737: mov qword ptr [rcx + rdx*8], rdi
0xdc073b: mov qword ptr [rsp + 0x80], rdi
0xdc0743: mov qword ptr [rcx + rdx*8 + 8], rdi
0xdc0748: mov qword ptr [rsp + 0x88], rdi
0xdc0750: inc eax
0xdc0752: mov dword ptr [rbx + 8], eax
0xdc0755: mov qword ptr [rsp + 0x80], rdi
0xdc075d: mov qword ptr [rsp + 0x88], rdi
0xdc0765: mov rax, qword ptr [rcx + rdx*8]
0xdc0769: mov qword ptr [rcx + rdx*8], r12
0xdc076d: mov r12, rax
0xdc0770: mov qword ptr [rsp + 0x90], rax
0xdc0778: mov eax, dword ptr [rcx + rdx*8 + 8]
0xdc077c: mov dword ptr [rcx + rdx*8 + 8], r15d
0xdc0781: mov dword ptr [rsp + 0x98], eax
0xdc0788: mov eax, dword ptr [rcx + rdx*8 + 0xc]
0xdc078c: mov dword ptr [rcx + rdx*8 + 0xc], r13d
0xdc0791: mov dword ptr [rsp + 0x9c], eax
0xdc0798: mov r13, qword ptr [rsp + 0x350]
0xdc07a0: test r12, r12
0xdc07a3: je 0x140dc07cb
0xdc07a5: mov edx, 0x1fd
0xdc07aa: mov rax, qword ptr gs:[0x58]
0xdc07b3: mov rcx, qword ptr [rax]
0xdc07b6: cmp byte ptr [rdx + rcx], 0
0xdc07ba: mov rcx, r12
0xdc07bd: je 0x140dc07c6
0xdc07bf: call 0x1447f03bc
0xdc07c4: jmp 0x140dc07cb
0xdc07c6: call 0x1447f02bc
0xdc07cb: mov qword ptr [rsp + 0x90], rdi
0xdc07d3: mov qword ptr [rsp + 0x98], 0
0xdc07df: mov r15, qword ptr [rsp + 0x208]
0xdc07e7: mov r12, qword ptr [rsp + 0x78]
0xdc07ec: jmp 0x140dbffe8
0xdc07f1: mov rbx, qword ptr [rsp + 0x1e0]
0xdc07f9: lea rdx, [rbx + 8]
0xdc07fd: test rbx, rbx
0xdc0800: mov eax, 0
0xdc0805: cmove rdx, rax
0xdc0809: mov rdx, qword ptr [rdx]
0xdc080c: lea rcx, [rsp + 0xb0]
0xdc0814: call 0x140393df0
0xdc0819: nop 
0xdc081a: mov qword ptr [rsp + 0xb8], rbx
0xdc0822: mov eax, dword ptr [rsp + 0x68]
0xdc0826: or eax, 1
0xdc0829: mov dword ptr [rsp + 0x70], eax
0xdc082d: mov dword ptr [rsp + 0x68], eax
0xdc0831: mov rcx, qword ptr [rsp + 0x60]
0xdc0836: call 0x140433650
0xdc083b: lea rcx, [rax + 0x18]
0xdc083f: call 0x140430020
0xdc0844: movzx ecx, word ptr [rax + 0x12]
0xdc0848: mov rax, qword ptr [rbx + 0x68]
0xdc084c: mov rax, qword ptr [rax + 0x150]
0xdc0853: lea rcx, [rcx + rcx*2]
0xdc0857: mov rax, qword ptr [rax + 0x18]
0xdc085b: mov eax, dword ptr [rax + rcx*8]
0xdc085e: mov dword ptr [rsp + 0x358], eax
0xdc0865: mov eax, dword ptr [rsp + 0x68]
0xdc0869: and eax, 0xfffffffe
0xdc086c: mov dword ptr [rsp + 0x68], eax
0xdc0870: mov dword ptr [rsp + 0x70], eax
0xdc0874: mov rcx, qword ptr [rsp + 0xb0]
0xdc087c: mov rax, qword ptr [rcx]
0xdc087f: mov dl, 1
0xdc0881: call qword ptr [rax + 0x20]
0xdc0884: mov rbx, qword ptr [rsp + 0x60]
0xdc0889: mov rcx, rbx
0xdc088c: call 0x140433650
0xdc0891: lea rcx, [rax + 0x18]
0xdc0895: call 0x140430020
0xdc089a: lea rcx, [rax + 0x12]
0xdc089e: mov eax, 0xffff
0xdc08a3: cmp word ptr [rcx], ax
0xdc08a6: je 0x140dc08cb
0xdc08a8: call 0x140433650
0xdc08ad: cmp dword ptr [rax + 0x90], 1
0xdc08b4: jge 0x140dc08ba
0xdc08b6: xor eax, eax
0xdc08b8: jmp 0x140dc08c1
0xdc08ba: mov rax, qword ptr [rax + 0x88]
0xdc08c1: cmp dword ptr [rax + 0x58], 1
0xdc08c5: ja 0x140dc0956
0xdc08cb: mov rcx, rbx
0xdc08ce: call 0x140433650
0xdc08d3: lea rcx, [rax + 0x18]
0xdc08d7: call 0x140430020
0xdc08dc: mov edx, dword ptr [rsp + 0x358]
0xdc08e3: mov rcx, rax
0xdc08e6: call 0x141786f10
0xdc08eb: test al, al
0xdc08ed: jne 0x140dc0956
0xdc08ef: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc08f8: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0901: vmovss dword ptr [rsp + 0x40], xmm10
0xdc0907: vmovss xmm0, dword ptr [r13 + 0x84c]
0xdc0910: vmovss dword ptr [rsp + 0x38], xmm0
0xdc0916: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc091f: vmovss dword ptr [rsp + 0x30], xmm1
0xdc0925: lea rax, [rsp + 0x100]
0xdc092d: mov qword ptr [rsp + 0x28], rax
0xdc0932: mov qword ptr [rsp + 0x20], rsi
0xdc0937: mov r9, rdi
0xdc093a: mov r8, qword ptr [rsp + 0xe0]
0xdc0942: mov rdx, r14
0xdc0945: mov rcx, qword ptr [r13 + 0x820]
0xdc094c: call 0x143d11690
0xdc0951: jmp 0x140dbffed
0xdc0956: vmovups xmm0, xmmword ptr [r13 + 0x8c8]
0xdc095f: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0968: vmovss dword ptr [rsp + 0x40], xmm10
0xdc096e: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdc0977: vmovss dword ptr [rsp + 0x38], xmm0
0xdc097d: vmovss xmm1, dword ptr [r13 + 0x8e8]
0xdc0986: vmovss dword ptr [rsp + 0x30], xmm1
0xdc098c: lea rax, [rsp + 0x100]
0xdc0994: mov qword ptr [rsp + 0x28], rax
0xdc0999: mov qword ptr [rsp + 0x20], rsi
0xdc099e: mov r9, rdi
0xdc09a1: mov r8, qword ptr [rsp + 0xe0]
0xdc09a9: mov rdx, r14
0xdc09ac: mov rcx, qword ptr [r13 + 0x8c0]
0xdc09b3: call 0x143d11690
0xdc09b8: jmp 0x140dbffed
0xdc09bd: nop dword ptr [rax]
0xdc09c0: mov r8d, 0x1fd
0xdc09c6: xor r15d, r15d
0xdc09c9: mov edx, r15d
0xdc09cc: mov dword ptr [rsp + 0x58], edx
0xdc09d0: mov esi, dword ptr [r14 + 8]
0xdc09d4: mov ecx, dword ptr [rsp + 0x5c]
0xdc09d8: cmp esi, ecx
0xdc09da: jbe 0x140dc0aa9
0xdc09e0: lea ecx, [rsi*8]
0xdc09e7: mov edi, r8d
0xdc09ea: mov rax, qword ptr gs:[0x58]
0xdc09f3: mov rdx, qword ptr [rax]
0xdc09f6: cmp byte ptr [rdi + rdx], r15b
0xdc09fa: mov edx, 4
0xdc09ff: je 0x140dc0a08
0xdc0a01: call 0x1447efa78
0xdc0a06: jmp 0x140dc0a0d
0xdc0a08: call 0x1447ef9b0
0xdc0a0d: mov rbx, rax
0xdc0a10: test rax, rax
0xdc0a13: jne 0x140dc0a30
0xdc0a15: call 0x141318e70
0xdc0a1a: xor r9d, r9d
0xdc0a1d: xor r8d, r8d
0xdc0a20: mov edx, 1
0xdc0a25: mov ecx, 0xa0000002
0xdc0a2a: call qword ptr [rip + 0x442a718]
0xdc0a30: mov r8d, r15d
0xdc0a33: mov edx, dword ptr [rsp + 0x58]
0xdc0a37: test edx, edx
0xdc0a39: je 0x140dc0a61
0xdc0a3b: nop dword ptr [rax + rax]
0xdc0a40: mov edx, r8d
0xdc0a43: mov rax, qword ptr [rsp + 0x50]
0xdc0a48: mov rcx, qword ptr [rax + rdx*8]
0xdc0a4c: mov qword ptr [rbx + rdx*8], rcx
0xdc0a50: inc r8d
0xdc0a53: mov edx, dword ptr [rsp + 0x58]
0xdc0a57: cmp r8d, edx
0xdc0a5a: jb 0x140dc0a40
0xdc0a5c: mov edi, 0x1fd
0xdc0a61: mov rcx, qword ptr [rsp + 0x50]
0xdc0a66: test rcx, rcx
0xdc0a69: je 0x140dc0a9c
0xdc0a6b: mov rax, qword ptr gs:[0x58]
0xdc0a74: mov rdx, qword ptr [rax]
0xdc0a77: cmp byte ptr [rdi + rdx], r15b
0xdc0a7b: je 0x140dc0a93
0xdc0a7d: call 0x1447f03bc
0xdc0a82: mov edx, dword ptr [rsp + 0x58]
0xdc0a86: mov qword ptr [rsp + 0x50], rbx
0xdc0a8b: mov ecx, esi
0xdc0a8d: mov dword ptr [rsp + 0x5c], ecx
0xdc0a91: jmp 0x140dc0aae
0xdc0a93: call 0x1447f02bc
0xdc0a98: mov edx, dword ptr [rsp + 0x58]
0xdc0a9c: mov qword ptr [rsp + 0x50], rbx
0xdc0aa1: mov ecx, esi
0xdc0aa3: mov dword ptr [rsp + 0x5c], ecx
0xdc0aa7: jmp 0x140dc0aae
0xdc0aa9: mov rbx, qword ptr [rsp + 0x50]
0xdc0aae: mov rsi, qword ptr [r14]
0xdc0ab1: mov eax, dword ptr [r14 + 8]
0xdc0ab5: lea r15, [rsi + rax*8]
0xdc0ab9: cmp rsi, r15
0xdc0abc: je 0x140dc0c25
0xdc0ac2: xor r12d, r12d
0xdc0ac5: nop word ptr [rax + rax]
0xdc0ad0: vmovss xmm0, dword ptr [rsi]
0xdc0ad4: vaddss xmm1, xmm0, dword ptr [r13 + 0x860]
0xdc0add: vmovss dword ptr [rsp + 0x358], xmm1
0xdc0ae6: vmovss xmm2, dword ptr [rsi + 4]
0xdc0aeb: vaddss xmm0, xmm2, dword ptr [r13 + 0x864]
0xdc0af4: vmovss dword ptr [rsp + 0x35c], xmm0
0xdc0afd: cmp ecx, edx
0xdc0aff: ja 0x140dc0be7
0xdc0b05: lea edi, [rcx*2 + 1]
0xdc0b0c: add edi, ecx
0xdc0b0e: shr edi, 1
0xdc0b10: cmp edi, 1
0xdc0b13: mov eax, 1
0xdc0b18: cmovb edi, eax
0xdc0b1b: cmp edx, edi
0xdc0b1d: cmova edi, edx
0xdc0b20: cmp edi, ecx
0xdc0b22: jbe 0x140dc0be7
0xdc0b28: lea ecx, [rdi*8]
0xdc0b2f: mov r14d, 0x1fd
0xdc0b35: mov rax, qword ptr gs:[0x58]
0xdc0b3e: mov rdx, qword ptr [rax]
0xdc0b41: cmp byte ptr [r14 + rdx], r12b
0xdc0b45: mov edx, 4
0xdc0b4a: je 0x140dc0b53
0xdc0b4c: call 0x1447efa78
0xdc0b51: jmp 0x140dc0b58
0xdc0b53: call 0x1447ef9b0
0xdc0b58: mov rbx, rax
0xdc0b5b: test rax, rax
0xdc0b5e: jne 0x140dc0b7b
0xdc0b60: call 0x141318e70
0xdc0b65: xor r9d, r9d
0xdc0b68: xor r8d, r8d
0xdc0b6b: mov edx, 1
0xdc0b70: mov ecx, 0xa0000002
0xdc0b75: call qword ptr [rip + 0x442a5cd]
0xdc0b7b: mov r8d, r12d
0xdc0b7e: mov edx, dword ptr [rsp + 0x58]
0xdc0b82: test edx, edx
0xdc0b84: je 0x140dc0bb2
0xdc0b86: nop word ptr [rax + rax]
0xdc0b90: mov edx, r8d
0xdc0b93: mov rax, qword ptr [rsp + 0x50]
0xdc0b98: mov rcx, qword ptr [rax + rdx*8]
0xdc0b9c: mov qword ptr [rbx + rdx*8], rcx
0xdc0ba0: inc r8d
0xdc0ba3: mov edx, dword ptr [rsp + 0x58]
0xdc0ba7: cmp r8d, edx
0xdc0baa: jb 0x140dc0b90
0xdc0bac: mov r14d, 0x1fd
0xdc0bb2: mov rcx, qword ptr [rsp + 0x50]
0xdc0bb7: test rcx, rcx
0xdc0bba: je 0x140dc0bde
0xdc0bbc: mov rax, qword ptr gs:[0x58]
0xdc0bc5: mov rdx, qword ptr [rax]
0xdc0bc8: cmp byte ptr [r14 + rdx], r12b
0xdc0bcc: je 0x140dc0bd5
0xdc0bce: call 0x1447f03bc
0xdc0bd3: jmp 0x140dc0bda
0xdc0bd5: call 0x1447f02bc
0xdc0bda: mov edx, dword ptr [rsp + 0x58]
0xdc0bde: mov qword ptr [rsp + 0x50], rbx
0xdc0be3: mov dword ptr [rsp + 0x5c], edi
0xdc0be7: mov ecx, edx
0xdc0be9: mov rax, qword ptr [rsp + 0x358]
0xdc0bf1: mov qword ptr [rbx + rcx*8], rax
0xdc0bf5: mov edx, dword ptr [rsp + 0x58]
0xdc0bf9: inc edx
0xdc0bfb: mov dword ptr [rsp + 0x58], edx
0xdc0bff: add rsi, 8
0xdc0c03: mov rbx, qword ptr [rsp + 0x50]
0xdc0c08: cmp rsi, r15
0xdc0c0b: je 0x140dc0c16
0xdc0c0d: mov ecx, dword ptr [rsp + 0x5c]
0xdc0c11: jmp 0x140dc0ad0
0xdc0c16: mov r14, qword ptr [rsp + 0x360]
0xdc0c1e: lea r12, [r13 + 0x84c]
0xdc0c25: mov rcx, qword ptr [r13 + 0x820]
0xdc0c2c: vmovdqa xmmword ptr [rsp + 0xb0], xmm7
0xdc0c35: lea eax, [rdx - 1]
0xdc0c38: lea r8, [rbx + rax*8]
0xdc0c3c: mov rax, qword ptr [rcx]
0xdc0c3f: mov byte ptr [rsp + 0x40], 0
0xdc0c44: vmovss dword ptr [rsp + 0x38], xmm10
0xdc0c4a: vmovss xmm0, dword ptr [r12]
0xdc0c50: vmovss dword ptr [rsp + 0x30], xmm0
0xdc0c56: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc0c5f: vmovss dword ptr [rsp + 0x28], xmm1
0xdc0c65: lea rdx, [rsp + 0xb0]
0xdc0c6d: mov qword ptr [rsp + 0x20], rdx
0xdc0c72: lea r9, [rsp + 0x50]
0xdc0c77: mov rdx, rbx
0xdc0c7a: call qword ptr [rax + 0x398]
0xdc0c80: add r14, 0x10
0xdc0c84: mov qword ptr [rsp + 0x360], r14
0xdc0c8c: cmp r14, qword ptr [rsp + 0xa0]
0xdc0c94: jne 0x140dc09c0
0xdc0c9a: lea r9, [r13 + 0x84c]
0xdc0ca1: lea r10, [r13 + 0x848]
0xdc0ca8: lea rdi, [r13 + 0x89c]
0xdc0caf: lea rsi, [r13 + 0x898]
0xdc0cb6: mov r12, qword ptr [rsp + 0x78]
0xdc0cbb: mov ebx, dword ptr [rsp + 0x188]
0xdc0cc2: shl rbx, 4
0xdc0cc6: add rbx, r12
0xdc0cc9: cmp r12, rbx
0xdc0ccc: je 0x140dc0d59
0xdc0cd2: mov rcx, qword ptr [r13 + 0x820]
0xdc0cd9: mov rdx, qword ptr [r12]
0xdc0cdd: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc0ce6: vmovups xmmword ptr [rsp + 0xb0], xmm0
0xdc0cef: mov eax, dword ptr [r12 + 8]
0xdc0cf4: dec eax
0xdc0cf6: lea r8, [rdx + rax*8]
0xdc0cfa: mov rax, qword ptr [rcx]
0xdc0cfd: mov byte ptr [rsp + 0x40], 0
0xdc0d02: vmovss dword ptr [rsp + 0x38], xmm10
0xdc0d08: vmovss xmm0, dword ptr [r9]
0xdc0d0d: vmovss dword ptr [rsp + 0x30], xmm0
0xdc0d13: vmovss xmm1, dword ptr [r10]
0xdc0d18: vmovss dword ptr [rsp + 0x28], xmm1
0xdc0d1e: lea r9, [rsp + 0xb0]
0xdc0d26: mov qword ptr [rsp + 0x20], r9
0xdc0d2b: mov r9, r12
0xdc0d2e: call qword ptr [rax + 0x398]
0xdc0d34: add r12, 0x10
0xdc0d38: cmp r12, rbx
0xdc0d3b: lea r9, [r13 + 0x84c]
0xdc0d42: lea r10, [r13 + 0x848]
0xdc0d49: jne 0x140dc0cd2
0xdc0d4b: lea rdi, [r13 + 0x89c]
0xdc0d52: lea rsi, [r13 + 0x898]
0xdc0d59: vmovss xmm0, dword ptr [r13 + 0x884]
0xdc0d62: mov r14, qword ptr [rsp + 0x368]
0xdc0d6a: mov qword ptr [rsp + 0x360], r14
0xdc0d72: mov eax, dword ptr [rsp + 0x178]
0xdc0d79: shl rax, 4
0xdc0d7d: add rax, r14
0xdc0d80: mov qword ptr [rsp + 0x168], rax
0xdc0d88: cmp r14, rax
0xdc0d8b: je 0x140dc13cc
0xdc0d91: vmovss dword ptr [rsp + 0x80], xmm6
0xdc0d9a: vmovss dword ptr [rsp + 0x84], xmm6
0xdc0da3: vmovss dword ptr [rsp + 0x88], xmm6
0xdc0dac: vmovss dword ptr [rsp + 0x8c], xmm0
0xdc0db5: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc0dbe: vmovdqu xmm8, xmmword ptr [rip + 0x4fb4b9a]
0xdc0dc6: mov edx, dword ptr [rsp + 0x5c]
0xdc0dca: xor r12d, r12d
0xdc0dcd: nop dword ptr [rax]
0xdc0dd0: mov ecx, r12d
0xdc0dd3: mov dword ptr [rsp + 0x58], ecx
0xdc0dd7: mov esi, dword ptr [r14 + 8]
0xdc0ddb: cmp esi, edx
0xdc0ddd: jbe 0x140dc0ea9
0xdc0de3: lea ecx, [rsi*8]
0xdc0dea: mov r15d, 0x1fd
0xdc0df0: mov edi, r15d
0xdc0df3: mov rax, qword ptr gs:[0x58]
0xdc0dfc: mov rdx, qword ptr [rax]
0xdc0dff: cmp byte ptr [r15 + rdx], 0
0xdc0e04: mov edx, 4
0xdc0e09: je 0x140dc0e12
0xdc0e0b: call 0x1447efa78
0xdc0e10: jmp 0x140dc0e17
0xdc0e12: call 0x1447ef9b0
0xdc0e17: mov rbx, rax
0xdc0e1a: test rax, rax
0xdc0e1d: jne 0x140dc0e3a
0xdc0e1f: call 0x141318e70
0xdc0e24: xor r9d, r9d
0xdc0e27: xor r8d, r8d
0xdc0e2a: mov edx, 1
0xdc0e2f: mov ecx, 0xa0000002
0xdc0e34: call qword ptr [rip + 0x442a30e]
0xdc0e3a: mov r8d, r12d
0xdc0e3d: mov ecx, dword ptr [rsp + 0x58]
0xdc0e41: test ecx, ecx
0xdc0e43: je 0x140dc0e6f
0xdc0e45: nop word ptr [rax + rax]
0xdc0e50: mov edx, r8d
0xdc0e53: mov rax, qword ptr [rsp + 0x50]
0xdc0e58: mov rcx, qword ptr [rax + rdx*8]
0xdc0e5c: mov qword ptr [rbx + rdx*8], rcx
0xdc0e60: inc r8d
0xdc0e63: mov ecx, dword ptr [rsp + 0x58]
0xdc0e67: cmp r8d, ecx
0xdc0e6a: jb 0x140dc0e50
0xdc0e6c: mov edi, r15d
0xdc0e6f: mov r8, qword ptr [rsp + 0x50]
0xdc0e74: test r8, r8
0xdc0e77: je 0x140dc0e9e
0xdc0e79: mov rax, qword ptr gs:[0x58]
0xdc0e82: mov rdx, qword ptr [rax]
0xdc0e85: mov rcx, r8
0xdc0e88: cmp byte ptr [rdi + rdx], 0
0xdc0e8c: je 0x140dc0e95
0xdc0e8e: call 0x1447f03bc
0xdc0e93: jmp 0x140dc0e9a
0xdc0e95: call 0x1447f02bc
0xdc0e9a: mov ecx, dword ptr [rsp + 0x58]
0xdc0e9e: mov qword ptr [rsp + 0x50], rbx
0xdc0ea3: mov edx, esi
0xdc0ea5: mov dword ptr [rsp + 0x5c], edx
0xdc0ea9: mov rsi, qword ptr [r14]
0xdc0eac: mov eax, dword ptr [r14 + 8]
0xdc0eb0: lea r15, [rsi + rax*8]
0xdc0eb4: cmp rsi, r15
0xdc0eb7: je 0x140dc100e
0xdc0ebd: nop dword ptr [rax]
0xdc0ec0: vmovss xmm0, dword ptr [rsi]
0xdc0ec4: vaddss xmm1, xmm0, dword ptr [r13 + 0x8b0]
0xdc0ecd: vmovss dword ptr [rsp + 0x78], xmm1
0xdc0ed3: vmovss xmm2, dword ptr [rsi + 4]
0xdc0ed8: vaddss xmm0, xmm2, dword ptr [r13 + 0x8b4]
0xdc0ee1: vmovss dword ptr [rsp + 0x7c], xmm0
0xdc0ee7: cmp edx, ecx
0xdc0ee9: ja 0x140dc0fdb
0xdc0eef: lea ebx, [rdx*2 + 1]
0xdc0ef6: add ebx, edx
0xdc0ef8: shr ebx, 1
0xdc0efa: cmp ebx, 1
0xdc0efd: mov eax, 1
0xdc0f02: cmovb ebx, eax
0xdc0f05: cmp ecx, ebx
0xdc0f07: cmova ebx, ecx
0xdc0f0a: cmp ebx, edx
0xdc0f0c: jbe 0x140dc0fdb
0xdc0f12: lea ecx, [rbx*8]
0xdc0f19: mov r14d, 0x1fd
0xdc0f1f: mov rax, qword ptr gs:[0x58]
0xdc0f28: mov rdx, qword ptr [rax]
0xdc0f2b: cmp byte ptr [r14 + rdx], 0
0xdc0f30: mov edx, 4
0xdc0f35: je 0x140dc0f3e
0xdc0f37: call 0x1447efa78
0xdc0f3c: jmp 0x140dc0f43
0xdc0f3e: call 0x1447ef9b0
0xdc0f43: mov rdi, rax
0xdc0f46: test rax, rax
0xdc0f49: jne 0x140dc0f66
0xdc0f4b: call 0x141318e70
0xdc0f50: xor r9d, r9d
0xdc0f53: xor r8d, r8d
0xdc0f56: mov edx, 1
0xdc0f5b: mov ecx, 0xa0000002
0xdc0f60: call qword ptr [rip + 0x442a1e2]
0xdc0f66: mov r8d, r12d
0xdc0f69: mov ecx, dword ptr [rsp + 0x58]
0xdc0f6d: test ecx, ecx
0xdc0f6f: je 0x140dc0fa2
0xdc0f71: nop dword ptr [rax]
0xdc0f75: nop word ptr [rax + rax]
0xdc0f80: mov edx, r8d
0xdc0f83: mov rax, qword ptr [rsp + 0x50]
0xdc0f88: mov rcx, qword ptr [rax + rdx*8]
0xdc0f8c: mov qword ptr [rdi + rdx*8], rcx
0xdc0f90: inc r8d
0xdc0f93: mov ecx, dword ptr [rsp + 0x58]
0xdc0f97: cmp r8d, ecx
0xdc0f9a: jb 0x140dc0f80
0xdc0f9c: mov r14d, 0x1fd
0xdc0fa2: mov r8, qword ptr [rsp + 0x50]
0xdc0fa7: test r8, r8
0xdc0faa: je 0x140dc0fd2
0xdc0fac: mov rax, qword ptr gs:[0x58]
0xdc0fb5: mov rdx, qword ptr [rax]
0xdc0fb8: mov rcx, r8
0xdc0fbb: cmp byte ptr [r14 + rdx], 0
0xdc0fc0: je 0x140dc0fc9
0xdc0fc2: call 0x1447f03bc
0xdc0fc7: jmp 0x140dc0fce
0xdc0fc9: call 0x1447f02bc
0xdc0fce: mov ecx, dword ptr [rsp + 0x58]
0xdc0fd2: mov qword ptr [rsp + 0x50], rdi
0xdc0fd7: mov dword ptr [rsp + 0x5c], ebx
0xdc0fdb: mov edx, ecx
0xdc0fdd: mov rcx, qword ptr [rsp + 0x78]
0xdc0fe2: mov rax, qword ptr [rsp + 0x50]
0xdc0fe7: mov qword ptr [rax + rdx*8], rcx
0xdc0feb: mov ecx, dword ptr [rsp + 0x58]
0xdc0fef: inc ecx
0xdc0ff1: mov dword ptr [rsp + 0x58], ecx
0xdc0ff5: add rsi, 8
0xdc0ff9: mov edx, dword ptr [rsp + 0x5c]
0xdc0ffd: cmp rsi, r15
0xdc1000: jne 0x140dc0ec0
0xdc1006: mov r14, qword ptr [rsp + 0x360]
0xdc100e: mov rax, qword ptr [r13 + 0x870]
0xdc1015: mov qword ptr [rsp + 0xa0], rax
0xdc101d: vmovss xmm1, dword ptr [r13 + 0x89c]
0xdc1026: vmovss xmm2, dword ptr [r13 + 0x898]
0xdc102f: cmp ecx, 2
0xdc1032: jb 0x140dc13a4
0xdc1038: vmovups xmmword ptr [rsp + 0x110], xmm8
0xdc1041: vmovaps xmm6, xmm10
0xdc1046: vmovss dword ptr [rsp + 0x120], xmm6
0xdc104f: vmovups xmm0, xmmword ptr [rip + 0x5ca4209]
0xdc1057: vmovups xmmword ptr [rsp + 0x124], xmm0
0xdc1060: mov byte ptr [rsp + 0x134], 0x1e
0xdc1068: mov rsi, r12
0xdc106b: mov qword ptr [rsp + 0x138], r12
0xdc1073: mov r14d, r12d
0xdc1076: mov dword ptr [rsp + 0x140], r12d
0xdc107e: mov edx, r12d
0xdc1081: mov dword ptr [rsp + 0x144], edx
0xdc1088: mov qword ptr [rsp + 0x148], r12
0xdc1090: mov qword ptr [rsp + 0x150], 0
0xdc109c: mov byte ptr [rsp + 0x158], 0
0xdc10a4: vmovups xmmword ptr [rsp + 0x124], xmm7
0xdc10ad: vmovss dword ptr [rsp + 0x118], xmm2
0xdc10b6: vmovss dword ptr [rsp + 0x11c], xmm1
0xdc10bf: vmovss dword ptr [rsp + 0x110], xmm10
0xdc10c8: mov byte ptr [rsp + 0x134], 0x1e
0xdc10d0: mov byte ptr [rsp + 0x158], 0
0xdc10d8: mov r11, qword ptr [rsp + 0x50]
0xdc10dd: mov rax, qword ptr [r11]
0xdc10e0: mov qword ptr [rsp + 0x358], rax
0xdc10e8: mov rbx, qword ptr [rip + 0x4784d71]
0xdc10ef: mov qword ptr [rsp + 0xe8], rbx
0xdc10f7: mov r9d, r12d
0xdc10fa: mov r10d, r12d
0xdc10fd: mov edi, r12d
0xdc1100: mov r8d, r12d
0xdc1103: lea r15d, [rcx - 1]
0xdc1107: mov qword ptr [rsp + 0xf0], r15
0xdc110f: mov r13d, 8
0xdc1115: nop word ptr [rax + rax]
0xdc1120: lea rcx, [r11 + r13]
0xdc1124: lea r11, [rsp + 0xe8]
0xdc112c: cmp r11, rcx
0xdc112f: je 0x140dc113c
0xdc1131: mov rbx, qword ptr [rcx]
0xdc1134: mov qword ptr [rsp + 0xe8], rbx
0xdc113c: lea r11, [rsp + 0xe8]
0xdc1144: cmp r11, rcx
0xdc1147: cmove r8d, edi
0xdc114b: mov qword ptr [rsp + 0xb0], rax
0xdc1153: mov qword ptr [rsp + 0xb8], rbx
0xdc115b: lea rax, [rsp + 0xe8]
0xdc1163: cmp rax, rcx
0xdc1166: cmove r10d, r9d
0xdc116a: cmp edx, r10d
0xdc116d: ja 0x140dc125d
0xdc1173: lea edi, [rdx*2 + 1]
0xdc117a: add edi, edx
0xdc117c: shr edi, 1
0xdc117e: cmp edi, 1
0xdc1181: mov eax, 1
0xdc1186: cmovb edi, eax
0xdc1189: cmp r8d, edi
0xdc118c: cmova edi, r8d
0xdc1190: cmp edi, edx
0xdc1192: jbe 0x140dc125d
0xdc1198: mov ecx, edi
0xdc119a: shl ecx, 4
0xdc119d: mov r12d, 0x1fd
0xdc11a3: mov rax, qword ptr gs:[0x58]
0xdc11ac: mov rdx, qword ptr [rax]
0xdc11af: cmp byte ptr [r12 + rdx], 0
0xdc11b4: mov edx, 4
0xdc11b9: je 0x140dc11c2
0xdc11bb: call 0x1447efa78
0xdc11c0: jmp 0x140dc11c7
0xdc11c2: call 0x1447ef9b0
0xdc11c7: mov r15, rax
0xdc11ca: test rax, rax
0xdc11cd: jne 0x140dc11ea
0xdc11cf: call 0x141318e70
0xdc11d4: xor r9d, r9d
0xdc11d7: xor r8d, r8d
0xdc11da: mov edx, 1
0xdc11df: mov ecx, 0xa0000002
0xdc11e4: call qword ptr [rip + 0x4429f5e]
0xdc11ea: test r14d, r14d
0xdc11ed: je 0x140dc121a
0xdc11ef: mov rax, rsi
0xdc11f2: mov r8, r15
0xdc11f5: sub r8, rsi
0xdc11f8: mov edx, r14d
0xdc11fb: nop dword ptr [rax + rax]
0xdc1200: vmovups xmm0, xmmword ptr [rax]
0xdc1204: vmovups xmmword ptr [rax + r8], xmm0
0xdc120a: lea rax, [rax + 0x10]
0xdc120e: sub rdx, 1
0xdc1212: jne 0x140dc1200
0xdc1214: mov r12d, 0x1fd
0xdc121a: test rsi, rsi
0xdc121d: je 0x140dc1241
0xdc121f: mov rax, qword ptr gs:[0x58]
0xdc1228: mov rdx, qword ptr [rax]
0xdc122b: mov rcx, rsi
0xdc122e: cmp byte ptr [r12 + rdx], 0
0xdc1233: je 0x140dc123c
0xdc1235: call 0x1447f03bc
0xdc123a: jmp 0x140dc1241
0xdc123c: call 0x1447f02bc
0xdc1241: mov rsi, r15
0xdc1244: mov qword ptr [rsp + 0x138], r15
0xdc124c: mov edx, edi
0xdc124e: mov dword ptr [rsp + 0x144], edx
0xdc1255: mov r15, qword ptr [rsp + 0xf0]
0xdc125d: mov eax, r14d
0xdc1260: add rax, rax
0xdc1263: vmovups xmm0, xmmword ptr [rsp + 0xb0]
0xdc126c: vmovups xmmword ptr [rsi + rax*8], xmm0
0xdc1271: inc r14d
0xdc1274: mov dword ptr [rsp + 0x140], r14d
0xdc127c: mov r9d, r14d
0xdc127f: vmovss xmm0, dword ptr [rsp + 0xec]
0xdc1288: vsubss xmm4, xmm0, dword ptr [rsp + 0x35c]
0xdc1291: vmovss xmm1, dword ptr [rsp + 0xe8]
0xdc129a: vsubss xmm2, xmm1, dword ptr [rsp + 0x358]
0xdc12a3: vmulss xmm3, xmm2, xmm2
0xdc12a7: vmulss xmm0, xmm4, xmm4
0xdc12ab: vaddss xmm1, xmm3, xmm0
0xdc12af: vaddss xmm6, xmm6, xmm1
0xdc12b3: vmovss dword ptr [rsp + 0x120], xmm6
0xdc12bc: mov rax, rbx
0xdc12bf: mov qword ptr [rsp + 0x358], rbx
0xdc12c7: mov r10d, r14d
0xdc12ca: mov edi, r14d
0xdc12cd: mov r8d, r14d
0xdc12d0: sub r15, 1
0xdc12d4: mov qword ptr [rsp + 0xf0], r15
0xdc12dc: lea r13, [r13 + 8]
0xdc12e0: je 0x140dc12ec
0xdc12e2: mov r11, qword ptr [rsp + 0x50]
0xdc12e7: jmp 0x140dc1120
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
0xdc1329: mov rax, qword ptr gs:[0x58]
0xdc1332: mov rdx, qword ptr [rax]
0xdc1335: cmp byte ptr [rbx + rdx], 0
0xdc1339: je 0x140dc1342
0xdc133b: call 0x1447f03bc
0xdc1340: jmp 0x140dc1347
0xdc1342: call 0x1447f02bc
0xdc1347: xor r12d, r12d
0xdc134a: mov qword ptr [rsp + 0x148], r12
0xdc1352: mov qword ptr [rsp + 0x150], r12
0xdc135a: mov rcx, qword ptr [rsp + 0x138]
0xdc1362: test rcx, rcx
0xdc1365: je 0x140dc1388
0xdc1367: mov r8d, ebx
0xdc136a: mov rax, qword ptr gs:[0x58]
0xdc1373: mov rdx, qword ptr [rax]
0xdc1376: cmp byte ptr [r8 + rdx], r12b
0xdc137a: je 0x140dc1383
0xdc137c: call 0x1447f03bc
0xdc1381: jmp 0x140dc1388
0xdc1383: call 0x1447f02bc
0xdc1388: mov qword ptr [rsp + 0x138], r12
0xdc1390: mov qword ptr [rsp + 0x140], r12
0xdc1398: mov edx, dword ptr [rsp + 0x5c]
0xdc139c: mov r14, qword ptr [rsp + 0x360]
0xdc13a4: add r14, 0x10
0xdc13a8: mov qword ptr [rsp + 0x360], r14
0xdc13b0: cmp r14, qword ptr [rsp + 0x168]
0xdc13b8: jne 0x140dc0dd0
0xdc13be: lea rdi, [r13 + 0x89c]
0xdc13c5: lea rsi, [r13 + 0x898]
0xdc13cc: mov ebx, dword ptr [rsp + 0x178]
0xdc13d3: shl rbx, 4
0xdc13d7: mov r14, qword ptr [rsp + 0x368]
0xdc13df: add rbx, r14
0xdc13e2: cmp r14, rbx
0xdc13e5: je 0x140dc1432
0xdc13e7: vmovups xmm0, xmmword ptr [r13 + 0x878]
0xdc13f0: vmovups xmmword ptr [rsp + 0xb0], xmm0
0xdc13f9: mov byte ptr [rsp + 0x38], 0
0xdc13fe: vmovss dword ptr [rsp + 0x28], xmm10
0xdc1404: vmovss xmm0, dword ptr [rdi]
0xdc1408: vmovss dword ptr [rsp + 0x20], xmm0
0xdc140e: vmovss xmm3, dword ptr [rsi]
0xdc1412: lea r8, [rsp + 0xb0]
0xdc141a: mov rdx, r14
0xdc141d: mov rcx, qword ptr [r13 + 0x870]
0xdc1424: call 0x143d14990
0xdc1429: add r14, 0x10
0xdc142d: cmp r14, rbx
0xdc1430: jne 0x140dc13e7
0xdc1432: vmovss xmm0, dword ptr [rip + 0x4fb1bb2]
0xdc143a: vmovss dword ptr [rsp + 0x80], xmm0
0xdc1443: vmovss xmm1, dword ptr [rip + 0x4fb1b6d]
0xdc144b: vmovss dword ptr [rsp + 0x84], xmm1
0xdc1454: vmovss xmm0, dword ptr [rip + 0x4fb1b00]
0xdc145c: vmovss dword ptr [rsp + 0x88], xmm0
0xdc1465: vmovss xmm1, dword ptr [r13 + 0x8d4]
0xdc146e: vmovss dword ptr [rsp + 0x8c], xmm1
0xdc1477: mov ebx, dword ptr [rsp + 0x198]
0xdc147e: shl rbx, 4
0xdc1482: mov rdi, qword ptr [rsp + 0xc8]
0xdc148a: add rbx, rdi
0xdc148d: cmp rdi, rbx
0xdc1490: je 0x140dc14ef
0xdc1492: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc149b: vmovss xmm6, dword ptr [rip + 0x4fb1ea5]
0xdc14a3: vmovdqa xmmword ptr [rsp + 0xb0], xmm7
0xdc14ac: vmulss xmm2, xmm6, dword ptr [r13 + 0x8ec]
0xdc14b5: vmulss xmm3, xmm6, dword ptr [r13 + 0x8e8]
0xdc14be: mov byte ptr [rsp + 0x38], 0
0xdc14c3: vmovss dword ptr [rsp + 0x28], xmm10
0xdc14c9: vmovss dword ptr [rsp + 0x20], xmm2
0xdc14cf: lea r8, [rsp + 0xb0]
0xdc14d7: mov rdx, rdi
0xdc14da: mov rcx, qword ptr [r13 + 0x8c0]
0xdc14e1: call 0x143d14990
0xdc14e6: add rdi, 0x10
0xdc14ea: cmp rdi, rbx
0xdc14ed: jne 0x140dc14a3
0xdc14ef: mov rdi, qword ptr [r13 + 0x488]
0xdc14f6: mov eax, dword ptr [r13 + 0x490]
0xdc14fd: lea rcx, [rax + rax*2]
0xdc1501: lea r14, [rdi + rcx*8]
0xdc1505: cmp rdi, r14
0xdc1508: je 0x140dc16de
0xdc150e: nop 
0xdc1510: mov rbx, qword ptr [rdi + 8]
0xdc1514: mov eax, dword ptr [rdi + 0x10]
0xdc1517: lea rsi, [rbx + rax*8]
0xdc151b: cmp rbx, rsi
0xdc151e: je 0x140dc16d1
0xdc1524: nop dword ptr [rax]
0xdc1528: nop dword ptr [rax + rax]
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
0xdc156c: vmovss dword ptr [rsp + 0x368], xmm1
0xdc1575: vmovss dword ptr [rsp + 0x36c], xmm4
0xdc157e: mov rax, qword ptr [r13 + 0x860]
0xdc1585: mov qword ptr [rsp + 0x350], rax
0xdc158d: vmovss xmm3, dword ptr [rsp + 0x350]
0xdc1596: vaddss xmm0, xmm1, xmm3
0xdc159a: vmovss dword ptr [rsp + 0x358], xmm0
0xdc15a3: vmovss xmm2, dword ptr [rsp + 0x354]
0xdc15ac: vaddss xmm1, xmm4, xmm2
0xdc15b0: vmovss dword ptr [rsp + 0x35c], xmm1
0xdc15b9: mov rax, qword ptr [rsp + 0x358]
0xdc15c1: mov qword ptr [rsp + 0x350], rax
0xdc15c9: vaddss xmm0, xmm5, xmm3
0xdc15cd: vmovss dword ptr [rsp + 0x360], xmm0
0xdc15d6: vaddss xmm1, xmm6, xmm2
0xdc15da: vmovss dword ptr [rsp + 0x364], xmm1
0xdc15e3: mov rax, qword ptr [rsp + 0x360]
0xdc15eb: mov qword ptr [rsp + 0xa0], rax
0xdc15f3: vmulss xmm2, xmm9, dword ptr [r13 + 0x938]
0xdc15fc: vmovups xmm1, xmmword ptr [r13 + 0x918]
0xdc1605: vmovups xmmword ptr [rsp + 0xb0], xmm1
0xdc160e: vmovss xmm0, dword ptr [r13 + 0x93c]
0xdc1617: vmovss dword ptr [rsp + 0x30], xmm0
0xdc161d: vmovss dword ptr [rsp + 0x28], xmm2
0xdc1623: vmovss dword ptr [rsp + 0x20], xmm2
0xdc1629: lea r9, [rsp + 0xb0]
0xdc1631: lea r8, [rsp + 0x350]
0xdc1639: lea rdx, [rsp + 0xa0]
0xdc1641: mov rcx, qword ptr [r13 + 0x910]
0xdc1648: call 0x143d11410
0xdc164d: mov rax, qword ptr [rsp + 0x368]
0xdc1655: mov qword ptr [rsp + 0x350], rax
0xdc165d: mov rax, qword ptr [rsp + 0x78]
0xdc1662: mov qword ptr [rsp + 0xa0], rax
0xdc166a: vmulss xmm2, xmm9, dword ptr [r13 + 0x938]
0xdc1673: vmovups xmm1, xmmword ptr [r13 + 0x918]
0xdc167c: vmovups xmmword ptr [rsp + 0xb0], xmm1
0xdc1685: vmovss xmm0, dword ptr [r13 + 0x93c]
0xdc168e: vmovss dword ptr [rsp + 0x30], xmm0
0xdc1694: vmovss dword ptr [rsp + 0x28], xmm2
0xdc169a: vmovss dword ptr [rsp + 0x20], xmm2
0xdc16a0: lea r9, [rsp + 0xb0]
0xdc16a8: lea r8, [rsp + 0x350]
0xdc16b0: lea rdx, [rsp + 0xa0]
0xdc16b8: mov rcx, qword ptr [r13 + 0x910]
0xdc16bf: call 0x143d11410
0xdc16c4: add rbx, 8
0xdc16c8: cmp rbx, rsi
0xdc16cb: jne 0x140dc1530
0xdc16d1: add rdi, 0x18
0xdc16d5: cmp rdi, r14
0xdc16d8: jne 0x140dc1510
0xdc16de: mov rcx, qword ptr [rsp + 0x50]
0xdc16e3: test rcx, rcx
0xdc16e6: je 0x140dc170d
0xdc16e8: mov r8d, 0x1fd
0xdc16ee: mov rax, qword ptr gs:[0x58]
0xdc16f7: mov rdx, qword ptr [rax]
0xdc16fa: cmp byte ptr [r8 + rdx], 0
0xdc16ff: je 0x140dc1708
0xdc1701: call 0x1447f03bc
0xdc1706: jmp 0x140dc170d
0xdc1708: call 0x1447f02bc
0xdc170d: xor eax, eax
0xdc170f: mov qword ptr [rsp + 0x50], rax
0xdc1714: mov qword ptr [rsp + 0x58], rax
0xdc1719: lea rcx, [rsp + 0x190]
0xdc1721: call 0x14040c5c0
0xdc1726: nop 
0xdc1727: lea rcx, [rsp + 0x170]
0xdc172f: call 0x14040c5c0
0xdc1734: nop 
0xdc1735: lea rcx, [rsp + 0x180]
0xdc173d: call 0x14040c5c0
0xdc1742: nop 
0xdc1743: lea rax, [rip + 0x49646fe]
0xdc174a: mov qword ptr [rsp + 0x1d8], rax
0xdc1752: lea rcx, [rsp + 0x1d8]
0xdc175a: call 0x141434880
0xdc175f: lea r11, [rsp + 0x310]
0xdc1767: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdc176d: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdc1773: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdc1779: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdc177f: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdc1785: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdc178b: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdc1791: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xdc1797: vmovaps xmm14, xmmword ptr [r11 - 0x90]
0xdc17a0: vmovaps xmm15, xmmword ptr [r11 - 0xa0]
0xdc17a9: mov rsp, r11
0xdc17ac: pop r15
0xdc17ae: pop r14
0xdc17b0: pop r13
0xdc17b2: pop r12
0xdc17b4: pop rdi
0xdc17b5: pop rsi
0xdc17b6: pop rbx
0xdc17b7: ret 
CALLEE 0xdc18b0
0xdc18b0: mov rax, rsp
0xdc18b3: mov qword ptr [rax + 0x10], rbx
0xdc18b7: mov qword ptr [rax + 0x18], rsi
0xdc18bb: push rdi
0xdc18bc: push r12
0xdc18be: push r13
0xdc18c0: push r14
0xdc18c2: push r15
0xdc18c4: sub rsp, 0x120
0xdc18cb: vmovaps xmmword ptr [rax - 0x38], xmm6
0xdc18d0: vmovaps xmmword ptr [rax - 0x48], xmm7
0xdc18d5: vmovaps xmmword ptr [rax - 0x58], xmm8
0xdc18da: vmovaps xmmword ptr [rax - 0x68], xmm9
0xdc18df: vmovaps xmmword ptr [rax - 0x78], xmm10
0xdc18e4: vmovaps xmmword ptr [rax - 0x88], xmm11
0xdc18ec: vmovaps xmmword ptr [rax - 0x98], xmm12
0xdc18f4: mov r14, rcx
0xdc18f7: mov rdi, qword ptr [rcx + 0x7c0]
0xdc18fe: test rdi, rdi
0xdc1901: je 0x140dc1de3
0xdc1907: cmp dword ptr [rcx + 0x2e0], 0
0xdc190e: jne 0x140dc191d
0xdc1910: cmp byte ptr [rcx + 0x2f8], 0
0xdc1917: je 0x140dc1de3
0xdc191d: mov rbx, qword ptr [rcx + 8]
0xdc1921: lea rdx, [rsp + 0x150]
0xdc1929: mov rcx, qword ptr [rbx + 0x18]
0xdc192d: call 0x1435b4b90
0xdc1932: vmovss xmm6, dword ptr [r14 + 0xa98]
0xdc193b: vmovss xmm3, dword ptr [rip + 0x4fb15f1]
0xdc1943: vmulss xmm0, xmm3, dword ptr [rax + 4]
0xdc1948: vmulss xmm1, xmm0, xmm6
0xdc194c: vaddss xmm7, xmm1, dword ptr [r14 + 0xa5c]
0xdc1955: vmulss xmm0, xmm3, dword ptr [rax]
0xdc1959: vmulss xmm1, xmm0, xmm6
0xdc195d: vsubss xmm8, xmm1, dword ptr [r14 + 0xa58]
0xdc1966: mov rax, qword ptr [rbx + 0xa0]
0xdc196d: xor r13d, r13d
0xdc1970: test rax, rax
0xdc1973: je 0x140dc1989
0xdc1975: cmp qword ptr [rax + 8], r13
0xdc1979: je 0x140dc1989
0xdc197b: mov rcx, qword ptr [rbx + 0x38]
0xdc197f: call 0x143ed8480
0xdc1984: mov rcx, rax
0xdc1987: jmp 0x140dc19be
0xdc1989: movzx edx, byte ptr [rbx + 0x94]
0xdc1990: cmp dl, 0xff
0xdc1993: jne 0x140dc199a
0xdc1995: mov rcx, r13
0xdc1998: jmp 0x140dc19be
0xdc199a: mov rax, qword ptr [rbx + 0x58]
0xdc199e: mov rcx, qword ptr [rax + 0xb0]
0xdc19a5: mov r8, qword ptr [rcx + 0xb0]
0xdc19ac: cmp edx, dword ptr [r8 + 8]
0xdc19b0: jb 0x140dc19b7
0xdc19b2: mov rcx, r13
0xdc19b5: jmp 0x140dc19be
0xdc19b7: mov rax, qword ptr [r8]
0xdc19ba: mov rcx, qword ptr [rax + rdx*8]
0xdc19be: cmp byte ptr [rcx + 0x13b], r13b
0xdc19c5: jne 0x140dc19d1
0xdc19c7: vmovss xmm0, dword ptr [rcx + 0xd8]
0xdc19cf: jmp 0x140dc19ea
0xdc19d1: mov eax, 0xe0
0xdc19d6: mov edx, 0xdc
0xdc19db: cmp byte ptr [rcx + 0x13c], r13b
0xdc19e2: cmove eax, edx
0xdc19e5: vmovss xmm0, dword ptr [rax + rcx]
0xdc19ea: vmulss xmm1, xmm0, dword ptr [rcx + 0xd4]
0xdc19f2: vmovss xmm0, dword ptr [rip + 0x4fb16ba]
0xdc19fa: vdivss xmm0, xmm0, xmm6
0xdc19fe: vmulss xmm1, xmm0, xmm1
0xdc1a02: mov qword ptr [rdi + 0x38], 0x3f800000
0xdc1a0a: mov qword ptr [rdi + 0x40], r13
0xdc1a0e: mov dword ptr [rdi + 0x48], r13d
0xdc1a12: mov qword ptr [rdi + 0x4c], 0x3f800000
0xdc1a1a: mov qword ptr [rdi + 0x54], r13
0xdc1a1e: mov dword ptr [rdi + 0x5c], r13d
0xdc1a22: mov qword ptr [rdi + 0x60], 0x3f800000
0xdc1a2a: vmovss dword ptr [rdi + 0x68], xmm8
0xdc1a2f: vmovss dword ptr [rdi + 0x6c], xmm7
0xdc1a34: mov dword ptr [rdi + 0x70], r13d
0xdc1a38: mov dword ptr [rdi + 0x74], 0x3f800000
0xdc1a3f: vmovss dword ptr [rsp + 0x70], xmm1
0xdc1a45: vxorps xmm12, xmm12, xmm12
0xdc1a4a: vmovups xmmword ptr [rsp + 0x74], xmm12
0xdc1a50: vmovss dword ptr [rsp + 0x84], xmm1
0xdc1a59: vmovss dword ptr [rsp + 0x88], xmm12
0xdc1a62: vmovss dword ptr [rsp + 0x8c], xmm12
0xdc1a6b: vmovaps ymm0, ymmword ptr [rip + 0x4fb4ecd]
0xdc1a73: vmovups ymmword ptr [rsp + 0x90], ymm0
0xdc1a7c: mov rax, qword ptr [r14 + 0x7c0]
0xdc1a83: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdc1a88: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdc1a8d: vmovups ymm0, ymmword ptr [rsp + 0x70]
0xdc1a93: vperm2f128 ymm8, ymm0, ymm0, 0
0xdc1a99: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdc1a9f: vmovups ymm1, ymmword ptr [rsp + 0x90]
0xdc1aa8: vperm2f128 ymm10, ymm1, ymm1, 0
0xdc1aae: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdc1ab4: vshufps ymm0, ymm3, ymm3, 0
0xdc1ab9: vshufps ymm1, ymm3, ymm3, 0x55
0xdc1abe: vshufps ymm2, ymm3, ymm3, 0xaa
0xdc1ac3: vshufps ymm3, ymm3, ymm3, 0xff
0xdc1ac8: vshufps ymm4, ymm7, ymm7, 0
0xdc1acd: vshufps ymm5, ymm7, ymm7, 0x55
0xdc1ad2: vshufps ymm6, ymm7, ymm7, 0xaa
0xdc1ad7: vshufps ymm7, ymm7, ymm7, 0xff
0xdc1adc: vmulps ymm0, ymm8, ymm0
0xdc1ae0: vfmadd231ps ymm0, ymm1, ymm9
0xdc1ae5: vfmadd231ps ymm0, ymm2, ymm10
0xdc1aea: vfmadd231ps ymm0, ymm3, ymm11
0xdc1aef: vmovups ymmword ptr [rax + 0x38], ymm0
0xdc1af4: vmulps ymm1, ymm8, ymm4
0xdc1af8: vfmadd231ps ymm1, ymm5, ymm9
0xdc1afd: vfmadd231ps ymm1, ymm6, ymm10
0xdc1b02: vfmadd231ps ymm1, ymm7, ymm11
0xdc1b07: vmovups ymmword ptr [rax + 0x58], ymm1
0xdc1b0c: cmp byte ptr [rip + 0x5fa51c5], r13b
0xdc1b13: je 0x140dc1bbb
0xdc1b19: cmp qword ptr [r14 + 0x7b0], r13
0xdc1b20: je 0x140dc1bbb
0xdc1b26: mov rax, qword ptr [r14 + 0x7c0]
0xdc1b2d: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdc1b32: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdc1b37: vmovups ymm0, ymmword ptr [r14 + 0xa18]
0xdc1b40: vmovups ymm1, ymmword ptr [r14 + 0xa38]
0xdc1b49: vperm2f128 ymm8, ymm0, ymm0, 0
0xdc1b4f: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdc1b55: vperm2f128 ymm10, ymm1, ymm1, 0
0xdc1b5b: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdc1b61: vshufps ymm0, ymm3, ymm3, 0
0xdc1b66: vshufps ymm1, ymm3, ymm3, 0x55
0xdc1b6b: vshufps ymm2, ymm3, ymm3, 0xaa
0xdc1b70: vshufps ymm3, ymm3, ymm3, 0xff
0xdc1b75: vshufps ymm4, ymm7, ymm7, 0
0xdc1b7a: vshufps ymm5, ymm7, ymm7, 0x55
0xdc1b7f: vshufps ymm6, ymm7, ymm7, 0xaa
0xdc1b84: vshufps ymm7, ymm7, ymm7, 0xff
0xdc1b89: vmulps ymm0, ymm0, ymm8
0xdc1b8e: vfmadd231ps ymm0, ymm1, ymm9
0xdc1b93: vfmadd231ps ymm0, ymm2, ymm10
0xdc1b98: vfmadd231ps ymm0, ymm3, ymm11
0xdc1b9d: vmovups ymmword ptr [rax + 0x38], ymm0
0xdc1ba2: vmulps ymm1, ymm4, ymm8
0xdc1ba7: vfmadd231ps ymm1, ymm5, ymm9
0xdc1bac: vfmadd231ps ymm1, ymm6, ymm10
0xdc1bb1: vfmadd231ps ymm1, ymm7, ymm11
0xdc1bb6: vmovups ymmword ptr [rax + 0x58], ymm1
0xdc1bbb: cmp byte ptr [rip + 0x5eeac36], r13b
0xdc1bc2: jne 0x140dc1bd1
0xdc1bc4: cmp byte ptr [r14 + 0x2f8], r13b
0xdc1bcb: je 0x140dc1de3
0xdc1bd1: mov byte ptr [r14 + 0x2f8], r13b
0xdc1bd8: mov rcx, qword ptr [r14 + 0x7c0]
0xdc1bdf: vzeroupper 
0xdc1be2: call 0x143d11360
0xdc1be7: vmovss xmm0, dword ptr [r14 + 0xaa0]
0xdc1bf0: vsubss xmm2, xmm0, dword ptr [rip + 0x5ee9df0]
0xdc1bf8: vmovss xmm0, dword ptr [rip + 0x5ee9e88]
0xdc1c00: vsubss xmm1, xmm0, dword ptr [rip + 0x5ee9de0]
0xdc1c08: vdivss xmm5, xmm2, xmm1
0xdc1c0c: vmovss xmm0, dword ptr [rip + 0x5eeac34]
0xdc1c14: vsubss xmm1, xmm0, dword ptr [rip + 0x5eeac7c]
0xdc1c1c: vmulss xmm2, xmm1, xmm5
0xdc1c20: vaddss xmm7, xmm2, dword ptr [rip + 0x5eeac70]
0xdc1c28: vmovss xmm0, dword ptr [rip + 0x5eeacb8]
0xdc1c30: vsubss xmm1, xmm0, dword ptr [rip + 0x5eead00]
0xdc1c38: vmulss xmm2, xmm1, xmm5
0xdc1c3c: vaddss xmm8, xmm2, dword ptr [rip + 0x5eeacf4]
0xdc1c44: mov rax, qword ptr [r14 + 0x7c0]
0xdc1c4b: vmovss dword ptr [rax + 0xc8], xmm8
0xdc1c53: vmovss dword ptr [rax + 0xcc], xmm7
0xdc1c5b: mov qword ptr [rsp + 0x50], r13
0xdc1c60: mov qword ptr [rsp + 0x58], r13
0xdc1c65: mov r15, qword ptr [r14 + 0x2d8]
0xdc1c6c: mov r12d, dword ptr [r14 + 0x2e0]
0xdc1c73: shl r12, 5
0xdc1c77: add r12, r15
0xdc1c7a: cmp r15, r12
0xdc1c7d: je 0x140dc1da6
0xdc1c83: lea rsi, [r15 + 0x18]
0xdc1c87: vmovss xmm6, dword ptr [rip + 0x4fb40c1]
0xdc1c8f: nop 
0xdc1c90: mov dword ptr [rsp + 0x58], r13d
0xdc1c95: mov edx, dword ptr [rsi]
0xdc1c97: lea rcx, [rsp + 0x50]
0xdc1c9c: call 0x1403d4130
0xdc1ca1: mov eax, dword ptr [rsi]
0xdc1ca3: mov r8d, dword ptr [rsp + 0x58]
0xdc1ca8: test eax, eax
0xdc1caa: je 0x140dc1d43
0xdc1cb0: mov rbx, r13
0xdc1cb3: mov edi, eax
0xdc1cb5: mov r13d, 1
0xdc1cbb: nop dword ptr [rax + rax]
0xdc1cc0: mov rax, qword ptr [rsi - 8]
0xdc1cc4: vmovss xmm0, dword ptr [rax + rbx]
0xdc1cc9: vmovss dword ptr [rsp + 0x150], xmm0
0xdc1cd2: vmovss xmm1, dword ptr [rax + rbx + 8]
0xdc1cd8: vxorps xmm2, xmm1, xmm6
0xdc1cdc: vmovss dword ptr [rsp + 0x154], xmm2
0xdc1ce5: mov eax, dword ptr [rsp + 0x5c]
0xdc1ce9: cmp eax, r8d
0xdc1cec: ja 0x140dc1d16
0xdc1cee: lea edx, [rax*2 + 1]
0xdc1cf5: add edx, eax
0xdc1cf7: shr edx, 1
0xdc1cf9: cmp edx, r13d
0xdc1cfc: cmovb edx, r13d
0xdc1d00: cmp r8d, edx
0xdc1d03: cmova edx, r8d
0xdc1d07: lea rcx, [rsp + 0x50]
0xdc1d0c: call 0x1403d4130
0xdc1d11: mov r8d, dword ptr [rsp + 0x58]
0xdc1d16: mov edx, r8d
0xdc1d19: mov rcx, qword ptr [rsp + 0x150]
0xdc1d21: mov rax, qword ptr [rsp + 0x50]
0xdc1d26: mov qword ptr [rax + rdx*8], rcx
0xdc1d2a: mov r8d, dword ptr [rsp + 0x58]
0xdc1d2f: inc r8d
0xdc1d32: mov dword ptr [rsp + 0x58], r8d
0xdc1d37: add rbx, 0xc
0xdc1d3b: sub rdi, r13
0xdc1d3e: jne 0x140dc1cc0
0xdc1d40: xor r13d, r13d
0xdc1d43: mov rcx, qword ptr [r14 + 0x7c0]
0xdc1d4a: vmovups xmm0, xmmword ptr [r14 + 0x7c8]
0xdc1d53: vmovups xmmword ptr [rsp + 0x60], xmm0
0xdc1d59: lea eax, [r8 - 1]
0xdc1d5d: mov rdx, qword ptr [rsp + 0x50]
0xdc1d62: lea r8, [rdx + rax*8]
0xdc1d66: mov rax, qword ptr [rcx]
0xdc1d69: mov byte ptr [rsp + 0x40], 1
0xdc1d6e: vmovss dword ptr [rsp + 0x38], xmm12
0xdc1d74: vmovss dword ptr [rsp + 0x30], xmm7
0xdc1d7a: vmovss dword ptr [rsp + 0x28], xmm8
0xdc1d80: lea r9, [rsp + 0x60]
0xdc1d85: mov qword ptr [rsp + 0x20], r9
0xdc1d8a: lea r9, [rsp + 0x50]
0xdc1d8f: call qword ptr [rax + 0x398]
0xdc1d95: add r15, 0x20
0xdc1d99: add rsi, 0x20
0xdc1d9d: cmp r15, r12
0xdc1da0: jne 0x140dc1c90
0xdc1da6: mov rcx, qword ptr [rsp + 0x50]
0xdc1dab: test rcx, rcx
0xdc1dae: je 0x140dc1dd5
0xdc1db0: mov r8d, 0x1fd
0xdc1db6: mov rax, qword ptr gs:[0x58]
0xdc1dbf: mov rdx, qword ptr [rax]
0xdc1dc2: cmp byte ptr [r8 + rdx], 0
0xdc1dc7: je 0x140dc1dd0
0xdc1dc9: call 0x1447f03bc
0xdc1dce: jmp 0x140dc1dd5
0xdc1dd0: call 0x1447f02bc
0xdc1dd5: mov qword ptr [rsp + 0x50], r13
0xdc1dda: mov qword ptr [rsp + 0x58], 0
0xdc1de3: vzeroupper 
0xdc1de6: lea r11, [rsp + 0x120]
0xdc1dee: mov rbx, qword ptr [r11 + 0x38]
0xdc1df2: mov rsi, qword ptr [r11 + 0x40]
0xdc1df6: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdc1dfc: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdc1e02: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdc1e08: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdc1e0e: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdc1e14: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdc1e1a: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdc1e20: mov rsp, r11
0xdc1e23: pop r15
0xdc1e25: pop r14
0xdc1e27: pop r13
0xdc1e29: pop r12
0xdc1e2b: pop rdi
0xdc1e2c: ret 
CALLEE 0xdb2a30
0xdb2a30: mov qword ptr [rsp + 8], rbx
0xdb2a35: mov qword ptr [rsp + 0x10], rbp
0xdb2a3a: mov qword ptr [rsp + 0x18], rsi
0xdb2a3f: push rdi
0xdb2a40: sub rsp, 0x50
0xdb2a44: xor sil, sil
0xdb2a47: mov rdi, rcx
0xdb2a4a: cmp dword ptr [rcx + 0xbf8], 3
0xdb2a51: jne 0x140db2ad7
0xdb2a57: mov rax, qword ptr [rcx + 0x468]
0xdb2a5e: cmp byte ptr [rax + 3], sil
0xdb2a62: jne 0x140db2ad7
0xdb2a64: vmovups xmm0, xmmword ptr [rcx + 0x994]
0xdb2a6c: vmovss xmm1, dword ptr [rip + 0x5ef9014]
0xdb2a74: mov rdx, qword ptr [rcx + 0x9e0]
0xdb2a7b: lea r8, [rsp + 0x30]
0xdb2a80: vsubss xmm2, xmm1, dword ptr [rip + 0x5ef8f60]
0xdb2a88: mov eax, dword ptr [rcx + 0x9a4]
0xdb2a8e: vmovups xmmword ptr [rsp + 0x30], xmm0
0xdb2a94: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xdb2a9c: vsubss xmm3, xmm0, dword ptr [rip + 0x5ef8f44]
0xdb2aa4: vmovss xmm0, dword ptr [rip + 0x4fc0608]
0xdb2aac: mov rdx, qword ptr [rdx + 8]
0xdb2ab0: vdivss xmm4, xmm3, xmm2
0xdb2ab4: vsubss xmm3, xmm0, xmm4
0xdb2ab8: mov dword ptr [rsp + 0x40], eax
0xdb2abc: mov byte ptr [rsp + 0x20], 1
0xdb2ac1: call 0x140dabae0
0xdb2ac6: movzx esi, al
0xdb2ac9: mov rax, qword ptr [rdi + 0x9e0]
0xdb2ad0: mov byte ptr [rax + 0x2b9], sil
0xdb2ad7: mov rcx, qword ptr [rdi + 0x9e8]
0xdb2ade: test sil, sil
0xdb2ae1: je 0x140db2afb
0xdb2ae3: call 0x140cb6bd0
0xdb2ae8: mov rcx, qword ptr [rdi + 0x9b0]
0xdb2aef: mov r8b, 1
0xdb2af2: xor edx, edx
0xdb2af4: call 0x140deca40
0xdb2af9: jmp 0x140db2b63
0xdb2afb: call 0x140cb6d80
0xdb2b00: mov r9, qword ptr [rdi + 0x9b0]
0xdb2b07: xor edx, edx
0xdb2b09: mov r8d, edx
0xdb2b0c: lea rcx, [r9 + 0x1e8]
0xdb2b13: mov rax, rcx
0xdb2b16: cmp byte ptr [rax], dl
0xdb2b18: jne 0x140db2b2b
0xdb2b1a: inc r8d
0xdb2b1d: inc rax
0xdb2b20: cmp r8d, 3
0xdb2b24: jb 0x140db2b16
0xdb2b26: xor r8b, r8b
0xdb2b29: jmp 0x140db2b2e
0xdb2b2b: mov r8b, 1
0xdb2b2e: movzx eax, byte ptr [rcx]
0xdb2b31: btr eax, 0
0xdb2b35: mov byte ptr [rcx], al
0xdb2b37: cmp byte ptr [rcx], 0
0xdb2b3a: jne 0x140db2b4a
0xdb2b3c: inc edx
0xdb2b3e: inc rcx
0xdb2b41: cmp edx, 3
0xdb2b44: jb 0x140db2b37
0xdb2b46: xor al, al
0xdb2b48: jmp 0x140db2b4c
0xdb2b4a: mov al, 1
0xdb2b4c: cmp r8b, al
0xdb2b4f: je 0x140db2b63
0xdb2b51: mov rdx, qword ptr [r9]
0xdb2b54: mov rcx, r9
0xdb2b57: test al, al
0xdb2b59: je 0x140db2b60
0xdb2b5b: call qword ptr [rdx + 0x28]
0xdb2b5e: jmp 0x140db2b63
0xdb2b60: call qword ptr [rdx + 0x20]
0xdb2b63: mov rbx, qword ptr [rdi + 0x9b8]
0xdb2b6a: mov eax, dword ptr [rdi + 0x9c0]
0xdb2b70: lea rbp, [rbx + rax*8]
0xdb2b74: cmp rbx, rbp
0xdb2b77: je 0x140db2b97
0xdb2b79: nop dword ptr [rax]
0xdb2b80: mov rcx, qword ptr [rbx]
0xdb2b83: movzx r8d, sil
0xdb2b87: xor edx, edx
0xdb2b89: call 0x140deca40
0xdb2b8e: add rbx, 8
0xdb2b92: cmp rbx, rbp
0xdb2b95: jne 0x140db2b80
0xdb2b97: movzx r8d, sil
0xdb2b9b: mov edx, 1
0xdb2ba0: mov rcx, rdi
0xdb2ba3: mov rbx, qword ptr [rsp + 0x60]
0xdb2ba8: mov rbp, qword ptr [rsp + 0x68]
0xdb2bad: mov rsi, qword ptr [rsp + 0x70]
0xdb2bb2: add rsp, 0x50
0xdb2bb6: pop rdi
0xdb2bb7: jmp 0x140dd1460
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
CALLEE 0x38ad90
0x38ad90: sub rsp, 0x28
0x38ad94: mov rax, rcx
0x38ad97: mov rcx, qword ptr [rcx]
0x38ad9a: test rcx, rcx
0x38ad9d: je 0x14038ade5
0x38ad9f: mov qword ptr [rax], 0
0x38ada6: cmp byte ptr [rcx + 0x14], 0
CALLEE 0x38ad90
0x38ad90: sub rsp, 0x28
0x38ad94: mov rax, rcx
0x38ad97: mov rcx, qword ptr [rcx]
0x38ad9a: test rcx, rcx
0x38ad9d: je 0x14038ade5
0x38ad9f: mov qword ptr [rax], 0
0x38ada6: cmp byte ptr [rcx + 0x14], 0
