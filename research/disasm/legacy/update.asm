0xda8f60: mov rax, rsp
0xda8f63: mov qword ptr [rax + 8], rbx
0xda8f67: mov qword ptr [rax + 0x10], rbp
0xda8f6b: push rsi
0xda8f6c: push rdi
0xda8f6d: push r14
0xda8f6f: sub rsp, 0xd0
0xda8f76: vmovaps xmmword ptr [rax - 0x28], xmm6
0xda8f7b: vmovaps xmmword ptr [rax - 0x38], xmm7
0xda8f80: vmovaps xmmword ptr [rax - 0x48], xmm8
0xda8f85: vmovaps xmmword ptr [rax - 0x58], xmm9
0xda8f8a: vmovaps xmmword ptr [rax - 0x68], xmm10
0xda8f8f: vmovaps xmmword ptr [rax - 0x78], xmm11
0xda8f94: vmovaps xmmword ptr [rsp + 0x60], xmm12
0xda8f9a: vmovaps xmmword ptr [rsp + 0x50], xmm13
0xda8fa0: vmovaps xmm8, xmm1
0xda8fa4: mov rdi, rcx
0xda8fa7: xor r14d, r14d
0xda8faa: call 0x140dee390
0xda8faf: lea rdx, [rsp + 0x28]
0xda8fb4: call 0x14064f4f0
0xda8fb9: nop 
0xda8fba: cmp byte ptr [rsp + 0x38], r14b
0xda8fbf: je 0x140da9711
0xda8fc5: cmp byte ptr [rdi + 0xad9], r14b
0xda8fcc: je 0x140da9711
0xda8fd2: vmovaps xmm1, xmm8
0xda8fd7: mov rcx, rdi
0xda8fda: call 0x140dafaf0
0xda8fdf: vmovss xmm1, dword ptr [rdi + 0xa78]
0xda8fe7: vxorps xmm7, xmm7, xmm7
0xda8feb: vmovss xmm9, dword ptr [rip + 0x4fca0c1]
0xda8ff3: vucomiss xmm1, xmm7
0xda8ff7: jp 0x140da9062
0xda8ff9: jne 0x140da9062
0xda8ffb: vmovss xmm0, dword ptr [rdi + 0xa7c]
0xda9003: vucomiss xmm0, xmm7
0xda9007: jp 0x140da9062
0xda9009: jne 0x140da9062
0xda900b: vmovss xmm0, dword ptr [rdi + 0xa80]
0xda9013: vucomiss xmm0, xmm7
0xda9017: jp 0x140da902f
0xda9019: jne 0x140da902f
0xda901b: vmovss xmm0, dword ptr [rdi + 0xa84]
0xda9023: vucomiss xmm0, xmm7
0xda9027: jp 0x140da902f
0xda9029: je 0x140da91c1
0xda902f: inc byte ptr [rdi + 0xacc]
0xda9035: movzx eax, byte ptr [rdi + 0xacc]
0xda903c: cmp eax, dword ptr [rip + 0x5f034e6]
0xda9042: jle 0x140da91c1
0xda9048: mov byte ptr [rdi + 0xacc], 0
0xda904f: mov rax, qword ptr [rip + 0x479ce0a]
0xda9056: mov qword ptr [rdi + 0xa80], rax
0xda905d: jmp 0x140da91c1
0xda9062: vmovss xmm0, dword ptr [rip + 0x5f0350e]
0xda906a: vmulss xmm6, xmm0, dword ptr [rdi + 0xa7c]
0xda9072: vmulss xmm10, xmm0, xmm1
0xda9076: vmovss xmm13, dword ptr [rdi + 0xa84]
0xda907e: vsubss xmm12, xmm6, xmm13
0xda9083: vsubss xmm11, xmm10, dword ptr [rdi + 0xa80]
0xda908b: vmulss xmm1, xmm11, xmm11
0xda9090: vmulss xmm0, xmm12, xmm12
0xda9095: vaddss xmm2, xmm1, xmm0
0xda9099: vcomiss xmm2, xmm7
0xda909d: jbe 0x140da90c6
0xda909f: vxorps xmm0, xmm0, xmm0
0xda90a3: vucomiss xmm0, xmm2
0xda90a7: ja 0x140da90af
0xda90a9: vsqrtss xmm0, xmm2, xmm2
0xda90ad: jmp 0x140da90b8
0xda90af: vmovaps xmm0, xmm2
0xda90b3: call 0x144898f6e
0xda90b8: vdivss xmm0, xmm9, xmm0
0xda90bc: vmulss xmm11, xmm0, xmm11
0xda90c1: vmulss xmm12, xmm0, xmm12
0xda90c6: vxorps xmm2, xmm2, xmm2
0xda90ca: vcvtsi2ss xmm2, xmm2, dword ptr [rip + 0x5f773d6]
0xda90d2: vmulss xmm0, xmm11, xmm8
0xda90d7: vmulss xmm1, xmm0, xmm2
0xda90db: vaddss xmm4, xmm1, dword ptr [rdi + 0xa80]
0xda90e3: vmovss dword ptr [rdi + 0xa80], xmm4
0xda90eb: vmulss xmm0, xmm12, xmm8
0xda90f0: vmulss xmm1, xmm0, xmm2
0xda90f4: vaddss xmm3, xmm1, xmm13
0xda90f9: vmovss dword ptr [rdi + 0xa84], xmm3
0xda9101: vxorps xmm2, xmm2, xmm2
0xda9105: vcvtsi2ss xmm2, xmm2, dword ptr [rip + 0x5f7734b]
0xda910d: vmulss xmm0, xmm2, dword ptr [rdi + 0xa7c]
0xda9115: vaddss xmm11, xmm0, xmm3
0xda9119: vmulss xmm1, xmm2, dword ptr [rdi + 0xa78]
0xda9121: vaddss xmm5, xmm1, xmm4
0xda9125: vcomiss xmm10, xmm7
0xda9129: jbe 0x140da913f
0xda912b: vminss xmm0, xmm5, xmm10
0xda9130: vmaxss xmm3, xmm7, xmm0
0xda9134: vminss xmm1, xmm4, xmm10
0xda9139: vmaxss xmm0, xmm7, xmm1
0xda913d: jmp 0x140da914f
0xda913f: vminss xmm0, xmm5, xmm7
0xda9143: vmaxss xmm3, xmm10, xmm0
0xda9147: vminss xmm1, xmm4, xmm7
0xda914b: vmaxss xmm0, xmm10, xmm1
0xda914f: vmovss dword ptr [rdi + 0xa80], xmm0
0xda9157: vmovss xmm1, dword ptr [rdi + 0xa84]
0xda915f: vcomiss xmm6, xmm7
0xda9163: jbe 0x140da9177
0xda9165: vminss xmm0, xmm11, xmm6
0xda9169: vmaxss xmm2, xmm7, xmm0
0xda916d: vminss xmm1, xmm1, xmm6
0xda9171: vmaxss xmm0, xmm7, xmm1
0xda9175: jmp 0x140da9187
0xda9177: vminss xmm0, xmm11, xmm7
0xda917b: vmaxss xmm2, xmm6, xmm0
0xda917f: vminss xmm1, xmm1, xmm7
0xda9183: vmaxss xmm0, xmm6, xmm1
0xda9187: vmovss dword ptr [rdi + 0xa84], xmm0
0xda918f: vmovss xmm1, dword ptr [rdi + 0xa98]
0xda9197: vmulss xmm0, xmm3, xmm1
0xda919b: vmovss dword ptr [rsp + 0x100], xmm0
0xda91a4: vmulss xmm1, xmm2, xmm1
0xda91a8: vmovss dword ptr [rsp + 0x104], xmm1
0xda91b1: mov rdx, qword ptr [rsp + 0x100]
0xda91b9: mov rcx, rdi
0xda91bc: call 0x140dab7b0
0xda91c1: vmovss xmm4, dword ptr [rdi + 0xaa8]
0xda91c9: vucomiss xmm4, xmm7
0xda91cd: jp 0x140da9211
0xda91cf: jne 0x140da9211
0xda91d1: vmovss xmm0, dword ptr [rdi + 0xaac]
0xda91d9: vucomiss xmm0, xmm7
0xda91dd: jp 0x140da91e5
0xda91df: je 0x140da92ae
0xda91e5: inc byte ptr [rdi + 0xacd]
0xda91eb: movzx eax, byte ptr [rdi + 0xacd]
0xda91f2: cmp eax, dword ptr [rip + 0x5f02e30]
0xda91f8: jle 0x140da92ae
0xda91fe: mov byte ptr [rdi + 0xacd], 0
0xda9205: mov dword ptr [rdi + 0xaac], r14d
0xda920c: jmp 0x140da92ae
0xda9211: vmulss xmm2, xmm4, dword ptr [rip + 0x5f02eaf]
0xda9219: vxorps xmm0, xmm0, xmm0
0xda921d: vucomiss xmm2, xmm7
0xda9221: jp 0x140da9225
0xda9223: je 0x140da9238
0xda9225: vcmpltss xmm1, xmm7, xmm2
0xda922a: vmovss xmm0, dword ptr [rip + 0x4fca756]
0xda9232: vblendvps xmm0, xmm0, xmm9, xmm1
0xda9238: vmulss xmm0, xmm0, xmm8
0xda923d: vmulss xmm1, xmm0, dword ptr [rip + 0x5f02e33]
0xda9245: vaddss xmm3, xmm1, dword ptr [rdi + 0xaac]
0xda924d: vmovss dword ptr [rdi + 0xaac], xmm3
0xda9255: vxorps xmm0, xmm0, xmm0
0xda9259: vcvtsi2ss xmm0, xmm0, dword ptr [rip + 0x5f77297]
0xda9261: vmulss xmm1, xmm0, xmm4
0xda9265: vaddss xmm5, xmm1, xmm3
0xda9269: vcomiss xmm2, xmm7
0xda926d: jbe 0x140da9281
0xda926f: vminss xmm0, xmm5, xmm2
0xda9273: vmaxss xmm4, xmm7, xmm0
0xda9277: vminss xmm1, xmm3, xmm2
0xda927b: vmaxss xmm0, xmm7, xmm1
0xda927f: jmp 0x140da9291
0xda9281: vminss xmm0, xmm5, xmm7
0xda9285: vmaxss xmm4, xmm2, xmm0
0xda9289: vminss xmm1, xmm3, xmm7
0xda928d: vmaxss xmm0, xmm2, xmm1
0xda9291: vmovss dword ptr [rdi + 0xaac], xmm0
0xda9299: vmulss xmm0, xmm4, xmm8
0xda929e: vaddss xmm1, xmm0, dword ptr [rdi + 0xaa0]
0xda92a6: mov rcx, rdi
0xda92a9: call 0x140dab850
0xda92ae: cmp byte ptr [rdi + 0xace], 0
0xda92b5: jne 0x140da92cd
0xda92b7: cmp byte ptr [rdi + 0xad7], 0
0xda92be: jne 0x140da92cd
0xda92c0: cmp byte ptr [rdi + 0xad6], 0
0xda92c7: jne 0x140da92cd
0xda92c9: xor bl, bl
0xda92cb: jmp 0x140da92cf
0xda92cd: mov bl, 1
0xda92cf: vmovaps xmm1, xmm8
0xda92d4: mov rcx, rdi
0xda92d7: call 0x140da8dc0
0xda92dc: and al, bl
0xda92de: movzx ebx, byte ptr [rdi + 0xace]
0xda92e5: je 0x140da9315
0xda92e7: vmovaps xmm1, xmm8
0xda92ec: mov rcx, rdi
0xda92ef: call 0x140dabd10
0xda92f4: cmp dword ptr [rdi + 0xbf8], 5
0xda92fb: je 0x140da9305
0xda92fd: mov rcx, rdi
0xda9300: call 0x140d9fde0
0xda9305: xor r8d, r8d
0xda9308: mov rdx, qword ptr [rsp + 0x30]
0xda930d: mov rcx, rdi
0xda9310: call 0x140da0a70
0xda9315: mov r8, qword ptr [rdi + 0x5c0]
0xda931c: movzx edx, bl
0xda931f: mov rcx, rdi
0xda9322: call 0x140dc1e30
0xda9327: cmp byte ptr [rip + 0x5f04fca], 0
0xda932e: je 0x140da9358
0xda9330: cmp byte ptr [rdi + 0xacf], 0
0xda9337: jne 0x140da9342
0xda9339: cmp byte ptr [rdi + 0xadd], 0
0xda9340: je 0x140da9358
0xda9342: mov rcx, rdi
0xda9345: call 0x140db0080
0xda934a: mov byte ptr [rdi + 0xacf], 0
0xda9351: mov byte ptr [rdi + 0xadd], 0
0xda9358: cmp byte ptr [rdi + 0xaea], 0
0xda935f: je 0x140da936e
0xda9361: vmovaps xmm1, xmm8
0xda9366: mov rcx, rdi
0xda9369: call 0x140dae3a0
0xda936e: vmovss xmm0, dword ptr [rip + 0x5f02762]
0xda9376: vcomiss xmm0, dword ptr [rdi + 0xabc]
0xda937e: seta al
0xda9381: mov byte ptr [rdi + 0xae5], al
0xda9387: cmp byte ptr [rdi + 0xae6], 0
0xda938e: jne 0x140da93bf
0xda9390: cmp al, byte ptr [rdi + 0xae4]
0xda9396: je 0x140da94f7
0xda939c: mov byte ptr [rdi + 0xae6], 1
0xda93a3: lea rsi, [rdi + 0xae0]
0xda93aa: vmovss xmm0, dword ptr [rip + 0x5f02776]
0xda93b2: vmovss dword ptr [rsi], xmm0
0xda93b6: mov byte ptr [rdi + 0xae7], 0
0xda93bd: jmp 0x140da93c6
0xda93bf: lea rsi, [rdi + 0xae0]
0xda93c6: vmovss xmm0, dword ptr [rsi]
0xda93ca: vsubss xmm1, xmm0, xmm8
0xda93cf: vmovss dword ptr [rsi], xmm1
0xda93d3: vcomiss xmm7, xmm1
0xda93d7: jbe 0x140da93e0
0xda93d9: mov dword ptr [rsi], r14d
0xda93dc: vxorps xmm1, xmm1, xmm1
0xda93e0: vdivss xmm3, xmm1, dword ptr [rip + 0x5f02740]
0xda93e8: movzx eax, byte ptr [rdi + 0xae7]
0xda93ef: vsubss xmm4, xmm9, xmm3
0xda93f3: vmovd xmm1, r14d
0xda93f8: vmovd xmm0, eax
0xda93fc: vpcmpeqd xmm2, xmm0, xmm1
0xda9400: vblendvps xmm10, xmm4, xmm3, xmm2
0xda9406: movzx ecx, byte ptr [rdi + 0xae4]
0xda940d: test al, al
0xda940f: je 0x140da943f
0xda9411: test cl, cl
0xda9413: je 0x140da942e
0xda9415: vmulss xmm0, xmm4, dword ptr [rip + 0x4fc9b17]
0xda941d: vaddss xmm6, xmm0, dword ptr [rip + 0x4fc9b0f]
0xda9425: lea rsi, [rdi + 0xae0]
0xda942c: jmp 0x140da945d
0xda942e: vmulss xmm6, xmm3, dword ptr [rip + 0x4fc9afe]
0xda9436: lea rsi, [rdi + 0xae0]
0xda943d: jmp 0x140da945d
0xda943f: test cl, cl
0xda9441: je 0x140da9455
0xda9443: vmulss xmm0, xmm3, dword ptr [rip + 0x4fc9ae9]
0xda944b: vaddss xmm6, xmm0, dword ptr [rip + 0x4fc9ae1]
0xda9453: jmp 0x140da945d
0xda9455: vmulss xmm6, xmm4, dword ptr [rip + 0x4fc9ad7]
0xda945d: mov rbx, qword ptr [rdi + 0x4f8]
0xda9464: mov eax, dword ptr [rdi + 0x500]
0xda946a: lea rbp, [rbx + rax*8]
0xda946e: cmp rbx, rbp
0xda9471: je 0x140da9494
0xda9473: vmovaps xmm2, xmm10
0xda9478: vmovaps xmm1, xmm6
0xda947c: mov rcx, qword ptr [rbx]
0xda947f: call 0x140d8bd40
0xda9484: add rbx, 8
0xda9488: cmp rbx, rbp
0xda948b: jne 0x140da9473
0xda948d: lea rsi, [rdi + 0xae0]
0xda9494: vmovss xmm0, dword ptr [rsi]
0xda9498: vucomiss xmm0, xmm7
0xda949c: jp 0x140da94f7
0xda949e: jne 0x140da94f7
0xda94a0: cmp byte ptr [rdi + 0xae7], 0
0xda94a7: jne 0x140da94f0
0xda94a9: movzx eax, byte ptr [rdi + 0xae5]
0xda94b0: cmp byte ptr [rdi + 0xae4], al
0xda94b6: je 0x140da94c7
0xda94b8: mov byte ptr [rdi + 0xacf], 1
0xda94bf: mov rcx, rdi
0xda94c2: call 0x140da13a0
0xda94c7: movzx eax, byte ptr [rdi + 0xae5]
0xda94ce: mov byte ptr [rdi + 0xae4], al
0xda94d4: vmovss xmm0, dword ptr [rip + 0x5f0264c]
0xda94dc: vmovss dword ptr [rsi], xmm0
0xda94e0: mov byte ptr [rdi + 0xae7], 1
0xda94e7: mov byte ptr [rdi + 0xace], 1
0xda94ee: jmp 0x140da94f7
0xda94f0: mov byte ptr [rdi + 0xae6], 0
0xda94f7: cmp byte ptr [rdi + 0xaf4], 0
0xda94fe: jne 0x140da9509
0xda9500: cmp byte ptr [rdi + 0xaf5], 0
0xda9507: je 0x140da9521
0xda9509: mov rax, qword ptr [rdi]
0xda950c: mov rcx, rdi
0xda950f: call qword ptr [rax + 0x110]
0xda9515: mov rdx, qword ptr [rdi + 8]
0xda9519: mov rcx, rax
0xda951c: call 0x1435dcf00
0xda9521: cmp byte ptr [rdi + 0xaf6], 0
0xda9528: je 0x140da9532
0xda952a: mov rcx, rdi
0xda952d: call 0x140dcb2d0
0xda9532: mov rax, qword ptr [rdi + 0x3a8]
0xda9539: test rax, rax
0xda953c: je 0x140da965b
0xda9542: mov esi, 0x1fd
0xda9547: vmovss xmm10, dword ptr [rip + 0x4fc9949]
0xda954f: vmovss xmm11, dword ptr [rip + 0x4fc9d69]
0xda9557: vmovss xmm6, dword ptr [rip + 0x4fc9be5]
0xda955f: nop 
0xda9560: mov rcx, qword ptr [rax]
0xda9563: vmovss xmm3, dword ptr [rcx + 0x44]
0xda9568: vsubss xmm0, xmm3, xmm9
0xda956d: vdivss xmm1, xmm0, xmm10
0xda9572: cmp byte ptr [rcx + 0x4e], 0
0xda9576: je 0x140da958b
0xda9578: vsubss xmm0, xmm11, xmm1
0xda957c: vmulss xmm1, xmm0, xmm8
0xda9581: vaddss xmm2, xmm1, xmm1
0xda9585: vaddss xmm4, xmm2, xmm3
0xda9589: jmp 0x140da959d
0xda958b: vaddss xmm0, xmm1, xmm9
0xda9590: vmulss xmm1, xmm0, xmm8
0xda9595: vaddss xmm2, xmm1, xmm1
0xda9599: vsubss xmm4, xmm3, xmm2
0xda959d: vmovss dword ptr [rcx + 0x44], xmm4
0xda95a2: mov rcx, qword ptr [rax]
0xda95a5: vmovss xmm0, dword ptr [rcx + 0x44]
0xda95aa: vcomiss xmm0, xmm6
0xda95ae: jbe 0x140da95b6
0xda95b0: vmovaps xmm1, xmm6
0xda95b4: jmp 0x140da95c5
0xda95b6: vcomiss xmm9, xmm0
0xda95ba: jbe 0x140da964e
0xda95c0: vmovaps xmm1, xmm9
0xda95c5: mov edx, 0x44
0xda95ca: vmovss dword ptr [rdx + rcx], xmm1
0xda95cf: mov rdx, qword ptr [rax + 8]
0xda95d3: test rdx, rdx
0xda95d6: je 0x140da95e0
0xda95d8: mov rcx, qword ptr [rax + 0x10]
0xda95dc: mov qword ptr [rdx + 0x10], rcx
0xda95e0: mov rdx, qword ptr [rax + 0x10]
0xda95e4: test rdx, rdx
0xda95e7: je 0x140da95f1
0xda95e9: mov rcx, qword ptr [rax + 8]
0xda95ed: mov qword ptr [rdx + 8], rcx
0xda95f1: mov rbx, qword ptr [rax + 0x10]
0xda95f5: cmp rax, qword ptr [rdi + 0x3a8]
0xda95fc: jne 0x140da9605
0xda95fe: mov qword ptr [rdi + 0x3a8], rbx
0xda9605: cmp rax, qword ptr [rdi + 0x3b0]
0xda960c: jne 0x140da9619
0xda960e: mov rcx, qword ptr [rax + 8]
0xda9612: mov qword ptr [rdi + 0x3b0], rcx
0xda9619: mov rcx, qword ptr gs:[0x58]
0xda9622: mov rdx, qword ptr [rcx]
0xda9625: mov rcx, rax
0xda9628: cmp byte ptr [rsi + rdx], 0
0xda962c: je 0x140da963e
0xda962e: call 0x1447f03bc
0xda9633: dec dword ptr [rdi + 0x3b8]
0xda9639: mov rax, rbx
0xda963c: jmp 0x140da9652
0xda963e: call 0x1447f02bc
0xda9643: dec dword ptr [rdi + 0x3b8]
0xda9649: mov rax, rbx
0xda964c: jmp 0x140da9652
0xda964e: mov rax, qword ptr [rax + 0x10]
0xda9652: test rax, rax
0xda9655: jne 0x140da9560
0xda965b: cmp byte ptr [rip + 0x5f05016], 0
0xda9662: je 0x140da96b4
0xda9664: mov rbx, qword ptr [rdi + 0x5a0]
0xda966b: vmovss xmm6, dword ptr [rdi + 0xabc]
0xda9673: mov rcx, qword ptr [rdi + 8]
0xda9677: lea rdx, [rsp + 0x100]
0xda967f: mov rcx, qword ptr [rcx + 0x18]
0xda9683: call 0x1435b4b90
0xda9688: mov rcx, qword ptr [rdi + 0xa58]
0xda968f: mov qword ptr [rbx + 0x148], rcx
0xda9696: mov ecx, dword ptr [rdi + 0xa98]
0xda969c: mov dword ptr [rbx + 0x150], ecx
0xda96a2: mov rax, qword ptr [rax]
0xda96a5: mov qword ptr [rbx + 0x154], rax
0xda96ac: vmovss dword ptr [rbx + 0x15c], xmm6
0xda96b4: vmovss xmm0, dword ptr [rdi + 0xc48]
0xda96bc: vucomiss xmm0, xmm7
0xda96c0: jp 0x140da96c4
0xda96c2: je 0x140da9711
0xda96c4: mov rax, qword ptr [rdi + 0x5d0]
0xda96cb: test rax, rax
0xda96ce: je 0x140da970a
0xda96d0: vmulss xmm1, xmm0, xmm8
0xda96d5: mov rcx, qword ptr [rax + 0x1e8]
0xda96dc: test rcx, rcx
0xda96df: je 0x140da970a
0xda96e1: mov rcx, qword ptr [rcx + 0xf0]
0xda96e8: test rcx, rcx
0xda96eb: je 0x140da970a
0xda96ed: mov rax, qword ptr [rcx]
0xda96f0: mov r8, qword ptr [rax + 0x528]
0xda96f7: vcomiss xmm1, xmm7
0xda96fb: mov edx, 1
0xda9700: ja 0x140da9707
0xda9702: mov edx, 0xffffffff
0xda9707: call r8
0xda970a: mov dword ptr [rdi + 0xc48], r14d
0xda9711: lea rax, [rip + 0x497c730]
0xda9718: mov qword ptr [rsp + 0x28], rax
0xda971d: lea rcx, [rsp + 0x28]
0xda9722: call 0x141434880
0xda9727: lea r11, [rsp + 0xd0]
0xda972f: mov rbx, qword ptr [r11 + 0x20]
0xda9733: mov rbp, qword ptr [r11 + 0x28]
0xda9737: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xda973d: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xda9743: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xda9749: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xda974f: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xda9755: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xda975b: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xda9761: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xda9767: mov rsp, r11
0xda976a: pop r14
0xda976c: pop rdi
0xda976d: pop rsi
0xda976e: ret 