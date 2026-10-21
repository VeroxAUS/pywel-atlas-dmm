0x6030d0: mov rax, rsp
0x6030d3: mov qword ptr [rax + 0x18], rbx
0x6030d7: mov qword ptr [rax + 0x10], rdx
0x6030db: push rbp
0x6030dc: push rsi
0x6030dd: push rdi
0x6030de: push r12
0x6030e0: push r13
0x6030e2: push r14
0x6030e4: push r15
0x6030e6: lea rbp, [rax - 0x1a8]
0x6030ed: sub rsp, 0x270
0x6030f4: vmovaps xmmword ptr [rax - 0x48], xmm6
0x6030f9: vmovaps xmmword ptr [rax - 0x58], xmm7
0x6030fe: vmovaps xmmword ptr [rax - 0x68], xmm8
0x603103: vmovaps xmmword ptr [rax - 0x78], xmm9
0x603108: vmovaps xmmword ptr [rax - 0x88], xmm10
0x603110: vmovaps xmmword ptr [rax - 0x98], xmm11
0x603118: vmovaps xmmword ptr [rax - 0xa8], xmm12
0x603120: mov r15, rcx
0x603123: xor r14d, r14d
0x603126: mov rax, qword ptr [rcx + 0x48]
0x60312a: mov r8d, dword ptr [rcx + 0x108]
0x603131: lea rdx, [rax + 0x20]
0x603135: mov ecx, 0x48
0x60313a: test rax, rax
0x60313d: cmove rdx, rcx
0x603141: mov rax, qword ptr [rdx]
0x603144: mov ecx, dword ptr [rdx + 8]
0x603147: lea rcx, [rax + rcx*8]
0x60314b: cmp rax, rcx
0x60314e: je 0x140603168
0x603150: mov rsi, qword ptr [rax]
0x603153: cmp r8d, dword ptr [rsi + 0x78]
0x603157: jl 0x14060315f
0x603159: cmp r8d, dword ptr [rsi + 0x7c]
0x60315d: jl 0x14060316b
0x60315f: add rax, 8
0x603163: cmp rax, rcx
0x603166: jne 0x140603150
0x603168: mov rsi, r14
0x60316b: lea rax, [rbp - 0x30]
0x60316f: mov qword ptr [rbp - 0x40], rax
0x603173: mov dword ptr [rbp - 0x38], r14d
0x603177: mov dword ptr [rbp - 0x34], 0x20
0x60317e: mov rax, qword ptr [r15 + 0x48]
0x603182: lea rcx, [rax + 0x170]
0x603189: mov edx, 0x198
0x60318e: test rax, rax
0x603191: cmove rcx, rdx
0x603195: mov rbx, qword ptr [rcx]
0x603198: mov eax, dword ptr [rcx + 8]
0x60319b: lea rdi, [rbx + rax*8]
0x60319f: cmp rbx, rdi
0x6031a2: je 0x14060320b
0x6031a4: nop dword ptr [rax]
0x6031a8: nop dword ptr [rax + rax]
0x6031b0: mov r14, qword ptr [rbx]
0x6031b3: mov rax, qword ptr [r14]
0x6031b6: mov rcx, r14
0x6031b9: call qword ptr [rax + 0x298]
0x6031bf: cmp al, 0xf
0x6031c1: jne 0x1406031ff
0x6031c3: mov eax, dword ptr [r14 + 0x50]
0x6031c7: cmp eax, dword ptr [rsi + 0x78]
0x6031ca: jl 0x1406031ff
0x6031cc: cmp eax, dword ptr [rsi + 0x7c]
0x6031cf: jg 0x1406031ff
0x6031d1: mov eax, dword ptr [rbp - 0x38]
0x6031d4: cmp eax, dword ptr [rbp - 0x34]
0x6031d7: jb 0x1406031f2
0x6031d9: mov r9d, 8
0x6031df: xor r8d, r8d
0x6031e2: lea rdx, [rbp - 0x30]
0x6031e6: lea rcx, [rbp - 0x40]
0x6031ea: call 0x140392380
0x6031ef: mov eax, dword ptr [rbp - 0x38]
0x6031f2: mov ecx, eax
0x6031f4: mov rax, qword ptr [rbp - 0x40]
0x6031f8: mov qword ptr [rax + rcx*8], r14
0x6031fc: inc dword ptr [rbp - 0x38]
0x6031ff: add rbx, 8
0x603203: cmp rbx, rdi
0x603206: jne 0x1406031b0
0x603208: xor r14d, r14d
0x60320b: vmovss xmm0, dword ptr [rip + 0x66982f5]
0x603213: vmulss xmm11, xmm0, xmm0
0x603217: mov r12, qword ptr [rbp - 0x40]
0x60321b: mov eax, dword ptr [rbp - 0x38]
0x60321e: lea rax, [r12 + rax*8]
0x603222: mov qword ptr [rbp + 0x1b0], rax
0x603229: mov edx, 0x1fd
0x60322e: cmp r12, rax
0x603231: je 0x1406035cd
0x603237: vmovdqu xmm12, xmmword ptr [rip + 0x57727a1]
0x60323f: vxorps xmm10, xmm10, xmm10
0x603244: vmovss xmm9, dword ptr [rip + 0x57704a8]
0x60324c: mov edi, dword ptr [rip + 0x4f42c4e]
0x603252: vmovsd xmm6, qword ptr [rip + 0x4f42c3e]
0x60325a: nop word ptr [rax + rax]
0x603260: mov rbx, qword ptr [r12]
0x603264: mov eax, dword ptr [r15 + 0x108]
0x60326b: cmp dword ptr [rbx + 0x50], eax
0x60326e: jne 0x1406035b7
0x603274: mov rax, qword ptr [r15 + 0x48]
0x603278: mov rdx, qword ptr [rbx + 0x30]
0x60327c: lea rcx, [rax - 0x28]
0x603280: test rax, rax
0x603283: cmove rcx, r14
0x603287: mov edx, dword ptr [rdx]
0x603289: call 0x14255a850
0x60328e: test rax, rax
0x603291: je 0x1406035b7
0x603297: movzx ecx, byte ptr [rax + 0xac]
0x60329e: cmp cl, 1
0x6032a1: je 0x1406035b7
0x6032a7: cmp cl, 3
0x6032aa: je 0x1406035b7
0x6032b0: vmovsd qword ptr [rsp + 0x70], xmm6
0x6032b6: mov dword ptr [rsp + 0x78], edi
0x6032ba: vmovups xmmword ptr [rsp + 0x7c], xmm12
0x6032c0: vmovss dword ptr [rbp - 0x74], xmm10
0x6032c5: vmovss dword ptr [rbp - 0x70], xmm10
0x6032ca: vmovss dword ptr [rbp - 0x6c], xmm10
0x6032cf: movzx ecx, byte ptr [rbx + 0x17c]
0x6032d6: cmp cl, 1
0x6032d9: jne 0x1406032e4
0x6032db: lea rcx, [rbx + 0xd8]
0x6032e2: jmp 0x1406032f4
0x6032e4: cmp cl, 0xd
0x6032e7: jne 0x1406035b7
0x6032ed: lea rcx, [rax + 0x84]
0x6032f4: lea r8, [r15 + 0xb0]
0x6032fb: lea rdx, [rbp + 0xd0]
0x603302: call 0x1403d53a0
0x603307: vmovups ymm0, ymmword ptr [rax]
0x60330b: vmovups ymmword ptr [rsp + 0x70], ymm0
0x603311: vmovsd xmm1, qword ptr [rax + 0x20]
0x603316: vmovsd qword ptr [rbp - 0x70], xmm1
0x60331b: mov qword ptr [rsp + 0x30], r14
0x603320: mov qword ptr [rsp + 0x38], 0
0x603329: mov rax, qword ptr [rbx + 0x30]
0x60332d: mov qword ptr [rbp - 0x60], rax
0x603331: mov eax, dword ptr [rbx + 0x38]
0x603334: mov dword ptr [rbp - 0x58], eax
0x603337: lea r8, [rsp + 0x30]
0x60333c: lea rdx, [rbp - 0x60]
0x603340: mov rcx, r15
0x603343: vzeroupper 
0x603346: call 0x14205dc30
0x60334b: mov r13d, dword ptr [rsp + 0x38]
0x603350: mov esi, r13d
0x603353: shl rsi, 5
0x603357: mov r14, qword ptr [rsp + 0x30]
0x60335c: add rsi, r14
0x60335f: cmp r14, rsi
0x603362: je 0x14060354e
0x603368: lea rbx, [r14 + 8]
0x60336c: lea r13, [rip + 0x5122ad5]
0x603373: mov rcx, qword ptr [rbx]
0x603376: mov rax, qword ptr [rcx]
0x603379: call qword ptr [rax + 0x178]
0x60337f: test al, al
0x603381: jne 0x140603538
0x603387: xor r8d, r8d
0x60338a: lea rdx, [rsp + 0x50]
0x60338f: mov rcx, qword ptr [rbx]
0x603392: call 0x1417fe4c0
0x603397: nop 
0x603398: cmp byte ptr [rsp + 0x60], 0
0x60339d: je 0x1406033b6
0x60339f: mov rcx, qword ptr [rsp + 0x58]
0x6033a4: mov rax, qword ptr [rcx]
0x6033a7: call qword ptr [rax + 0x178]
0x6033ad: test al, al
0x6033af: je 0x1406033b6
0x6033b1: jmp 0x140603529
0x6033b6: mov rdi, qword ptr [rbx]
0x6033b9: mov rax, qword ptr [rdi + 0x68]
0x6033bd: mov rcx, qword ptr [rax + 0xb0]
0x6033c4: mov rax, qword ptr [r15 + 0x30]
0x6033c8: cmp qword ptr [rcx + 0x2e0], rax
0x6033cf: jne 0x1406033d6
0x6033d1: jmp 0x140603529
0x6033d6: mov rcx, rdi
0x6033d9: call 0x140505d60
0x6033de: test al, al
0x6033e0: jne 0x1406033e7
0x6033e2: jmp 0x140603529
0x6033e7: test rdi, rdi
0x6033ea: je 0x1406033f2
0x6033ec: lea rdx, [rdi + 8]
0x6033f0: jmp 0x1406033f4
0x6033f2: xor edx, edx
0x6033f4: mov rdx, qword ptr [rdx]
0x6033f7: lea rcx, [rbp + 0x1b8]
0x6033fe: call 0x140393df0
0x603403: nop 
0x603404: mov rcx, qword ptr [rdi + 0x68]
0x603408: lea rdx, [rbp - 0x50]
0x60340c: mov rcx, qword ptr [rcx + 0x1a0]
0x603413: call 0x1404f8220
0x603418: movsx ecx, word ptr [rax + 0xe]
0x60341c: vxorps xmm0, xmm0, xmm0
0x603420: vcvtsi2ss xmm0, xmm0, ecx
0x603424: vmulss xmm1, xmm0, xmm9
0x603429: vaddss xmm8, xmm1, dword ptr [rax + 8]
0x60342e: vmovss xmm7, dword ptr [rax + 4]
0x603433: movsx ecx, word ptr [rax + 0xc]
0x603437: vxorps xmm0, xmm0, xmm0
0x60343b: vcvtsi2ss xmm0, xmm0, ecx
0x60343f: vmulss xmm1, xmm0, xmm9
0x603444: vaddss xmm6, xmm1, dword ptr [rax]
0x603448: mov rcx, qword ptr [rbp + 0x1b8]
0x60344f: mov rax, qword ptr [rcx]
0x603452: mov dl, 1
0x603454: call qword ptr [rax + 0x20]
0x603457: vmovss xmm4, dword ptr [rbp - 0x74]
0x60345c: vsubss xmm2, xmm6, xmm4
0x603460: vsubss xmm0, xmm7, dword ptr [rbp - 0x70]
0x603465: vmovss xmm5, dword ptr [rbp - 0x6c]
0x60346a: vsubss xmm3, xmm8, xmm5
0x60346e: vmulss xmm1, xmm0, xmm0
0x603472: vmulss xmm0, xmm2, xmm2
0x603476: vaddss xmm2, xmm1, xmm0
0x60347a: vmulss xmm1, xmm3, xmm3
0x60347e: vaddss xmm2, xmm2, xmm1
0x603482: vcomiss xmm11, xmm2
0x603486: jbe 0x14060348d
0x603488: jmp 0x140603529
0x60348d: vmovsd xmm0, qword ptr [rbp - 0x74]
0x603492: vmovsd qword ptr [rsp + 0x40], xmm0
0x603498: vmovd edx, xmm5
0x60349c: vdivss xmm0, xmm4, xmm9
0x6034a1: vcvttss2si eax, xmm0
0x6034a5: vdivss xmm1, xmm5, xmm9
0x6034aa: vcvttss2si ecx, xmm1
0x6034ae: mov word ptr [rsp + 0x4c], ax
0x6034b3: mov word ptr [rsp + 0x4e], cx
0x6034b8: cwde 
0x6034b9: vxorps xmm0, xmm0, xmm0
0x6034bd: vcvtsi2ss xmm0, xmm0, eax
0x6034c1: vmulss xmm1, xmm0, xmm9
0x6034c6: vsubss xmm2, xmm4, xmm1
0x6034ca: vmovss dword ptr [rsp + 0x40], xmm2
0x6034d0: vaddss xmm1, xmm10, dword ptr [rsp + 0x44]
0x6034d6: vmovss dword ptr [rsp + 0x44], xmm1
0x6034dc: movsx eax, cx
0x6034df: vxorps xmm0, xmm0, xmm0
0x6034e3: vcvtsi2ss xmm0, xmm0, eax
0x6034e7: vmulss xmm2, xmm0, xmm9
0x6034ec: vmovd xmm1, edx
0x6034f0: vsubss xmm2, xmm1, xmm2
0x6034f4: vmovss dword ptr [rsp + 0x48], xmm2
0x6034fa: mov rax, qword ptr [rbx]
0x6034fd: mov rcx, qword ptr [rax + 0x68]
0x603501: mov rcx, qword ptr [rcx + 0x1a0]
0x603508: mov rax, qword ptr [rcx]
0x60350b: mov byte ptr [rsp + 0x28], 0
0x603510: mov byte ptr [rsp + 0x20], 5
0x603515: mov r9b, 4
0x603518: lea r8, [rsp + 0x7c]
0x60351d: lea rdx, [rsp + 0x40]
0x603522: call qword ptr [rax + 0x1a0]
0x603528: nop 
0x603529: mov qword ptr [rsp + 0x50], r13
0x60352e: lea rcx, [rsp + 0x50]
0x603533: call 0x141434880
0x603538: add rbx, 0x20
0x60353c: lea rax, [rbx - 8]
0x603540: cmp rax, rsi
0x603543: jne 0x140603373
0x603549: mov r13d, dword ptr [rsp + 0x38]
0x60354e: test r14, r14
0x603551: je 0x14060359c
0x603553: test r13d, r13d
0x603556: je 0x140603574
0x603558: mov rbx, r14
0x60355b: mov edi, r13d
0x60355e: nop 
0x603560: mov rax, qword ptr [rbx]
0x603563: xor edx, edx
0x603565: mov rcx, rbx
0x603568: call qword ptr [rax]
0x60356a: add rbx, 0x20
0x60356e: sub rdi, 1
0x603572: jne 0x140603560
0x603574: mov r8d, 0x1fd
0x60357a: mov rax, qword ptr gs:[0x58]
0x603583: mov rdx, qword ptr [rax]
0x603586: mov rcx, r14
0x603589: cmp byte ptr [r8 + rdx], 0
0x60358e: je 0x140603597
0x603590: call 0x1447f03bc
0x603595: jmp 0x14060359c
0x603597: call 0x1447f02bc
0x60359c: xor r14d, r14d
0x60359f: mov qword ptr [rsp + 0x30], r14
0x6035a4: mov qword ptr [rsp + 0x38], r14
0x6035a9: mov edi, dword ptr [rip + 0x4f428f1]
0x6035af: vmovsd xmm6, qword ptr [rip + 0x4f428e1]
0x6035b7: add r12, 8
0x6035bb: cmp r12, qword ptr [rbp + 0x1b0]
0x6035c2: jne 0x140603260
0x6035c8: mov edx, 0x1fd
0x6035cd: lea rax, [rbp - 0x30]
0x6035d1: mov rcx, qword ptr [rbp - 0x40]
0x6035d5: cmp rcx, rax
0x6035d8: je 0x140603601
0x6035da: test rcx, rcx
0x6035dd: je 0x140603601
0x6035df: mov r8d, edx
0x6035e2: mov rax, qword ptr gs:[0x58]
0x6035eb: mov rdx, qword ptr [rax]
0x6035ee: cmp byte ptr [r8 + rdx], 0
0x6035f3: je 0x1406035fc
0x6035f5: call 0x1447f03bc
0x6035fa: jmp 0x140603601
0x6035fc: call 0x1447f02bc
0x603601: lea r11, [rsp + 0x270]
0x603609: mov rbx, qword ptr [r11 + 0x50]
0x60360d: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0x603613: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0x603619: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0x60361f: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0x603625: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0x60362b: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0x603631: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0x603637: mov rsp, r11
0x60363a: pop r15
0x60363c: pop r14
0x60363e: pop r13
0x603640: pop r12
0x603642: pop rdi
0x603643: pop rsi
0x603644: pop rbp
0x603645: ret 