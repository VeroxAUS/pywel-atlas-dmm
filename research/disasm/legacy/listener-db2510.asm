0xdb2510: mov rax, rsp
0xdb2513: mov qword ptr [rax + 8], rbx
0xdb2517: push rbp
0xdb2518: push rsi
0xdb2519: push rdi
0xdb251a: push r12
0xdb251c: push r13
0xdb251e: push r14
0xdb2520: push r15
0xdb2522: lea rbp, [rax - 0x5f]
0xdb2526: sub rsp, 0xa0
0xdb252d: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdb2532: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdb2537: mov r13, rdx
0xdb253a: mov rdi, rcx
0xdb253d: cmp byte ptr [rdx + 0x2ba], 0
0xdb2544: jne 0x140db29fd
0xdb254a: lea rcx, [rdx + 0xde]
0xdb2551: call 0x140537250
0xdb2556: mov esi, 0xffff
0xdb255b: cmp word ptr [rax + 0x30], si
0xdb255f: je 0x140db2580
0xdb2561: lea rcx, [r13 + 0xde]
0xdb2568: call 0x140537250
0xdb256d: lea rcx, [rax + 0x30]
0xdb2571: call 0x140433650
0xdb2576: cmp word ptr [rax + 0x18], si
0xdb257a: je 0x140db29fd
0xdb2580: mov edx, 0x1ec
0xdb2585: mov rax, qword ptr gs:[0x58]
0xdb258e: mov rcx, qword ptr [rax]
0xdb2591: mov qword ptr [rbp - 0x39], rcx
0xdb2595: mov rax, qword ptr [rip + 0x5fb6f8c]
0xdb259c: cmp byte ptr [rdx + rcx], 0
0xdb25a0: cmovne rax, qword ptr [rip + 0x5fb6f88]
0xdb25a8: mov rax, qword ptr [rax]
0xdb25ab: mov rcx, qword ptr [rax + 8]
0xdb25af: mov rax, qword ptr [rcx + 0x270]
0xdb25b6: movzx ecx, word ptr [rax + 0x134]
0xdb25bd: cmp word ptr [r13 + 0xde], cx
0xdb25c5: jne 0x140db29fd
0xdb25cb: vmovups xmm0, xmmword ptr [r13 + 0xc8]
0xdb25d4: vmovups xmmword ptr [rbp - 0x31], xmm0
0xdb25d9: vpextrb eax, xmm0, 8
0xdb25df: cmp al, 6
0xdb25e1: jne 0x140db29fd
0xdb25e7: movzx ebx, word ptr [rbp - 0x31]
0xdb25eb: mov word ptr [rbp + 0x6f], bx
0xdb25ef: lea rcx, [rbp + 0x6f]
0xdb25f3: call 0x140537250
0xdb25f8: lea rcx, [rax + 0x30]
0xdb25fc: cmp word ptr [rcx], si
0xdb25ff: je 0x140db29fd
0xdb2605: call 0x140433650
0xdb260a: cmp word ptr [rax + 0x18], si
0xdb260e: je 0x140db29fd
0xdb2614: cmp bx, si
0xdb2617: je 0x140db29fd
0xdb261d: mov rcx, r13
0xdb2620: call 0x140d8ef00
0xdb2625: test al, al
0xdb2627: je 0x140db29fd
0xdb262d: movzx eax, word ptr [r13 + 0x340]
0xdb2635: mov word ptr [rbp + 0x6f], ax
0xdb2639: lea rcx, [rbp + 0x6f]
0xdb263d: call 0x140430020
0xdb2642: cmp dword ptr [rdi + 0x524], 0
0xdb2649: je 0x140db29fd
0xdb264f: mov r9d, dword ptr [rax]
0xdb2652: mov ecx, dword ptr [rdi + 0x520]
0xdb2658: test ecx, ecx
0xdb265a: je 0x140db29fd
0xdb2660: xor edx, edx
0xdb2662: mov eax, r9d
0xdb2665: div ecx
0xdb2667: mov r8d, edx
0xdb266a: shl r8, 8
0xdb266e: add r8, qword ptr [rdi + 0x530]
0xdb2675: xor edx, edx
0xdb2677: mov r11d, dword ptr [r8]
0xdb267a: test r11d, r11d
0xdb267d: je 0x140db29fd
0xdb2683: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xdb2688: jne 0x140db26a0
0xdb268a: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb268f: mov rax, qword ptr [rdi + 0x538]
0xdb2696: mov r10, qword ptr [rax + rcx*8]
0xdb269a: cmp dword ptr [r10 + 4], r9d
0xdb269e: je 0x140db26ac
0xdb26a0: inc edx
0xdb26a2: cmp edx, r11d
0xdb26a5: jb 0x140db2683
0xdb26a7: jmp 0x140db29fd
0xdb26ac: lea rbx, [r10 + 8]
0xdb26b0: test rbx, rbx
0xdb26b3: je 0x140db29fd
0xdb26b9: lea rdx, [rbp - 0x21]
0xdb26bd: call 0x14064f4f0
0xdb26c2: nop 
0xdb26c3: cmp byte ptr [rbp - 0x11], 0
0xdb26c7: jne 0x140db26ce
0xdb26c9: jmp 0x140db29e9
0xdb26ce: mov rsi, qword ptr [rbx]
0xdb26d1: mov eax, dword ptr [rbx + 8]
0xdb26d4: lea rcx, [rax + rax*2]
0xdb26d8: lea r12, [rsi + rcx*8]
0xdb26dc: cmp rsi, r12
0xdb26df: je 0x140db29e9
0xdb26e5: lea r15, [rsi + 0xa]
0xdb26e9: vmovss xmm7, dword ptr [rip + 0x4fc0843]
0xdb26f1: mov rcx, r15
0xdb26f4: call 0x140430020
0xdb26f9: mov r8d, 1
0xdb26ff: movzx edx, word ptr [rax + 0x12]
0xdb2703: call 0x140652f40
0xdb2708: mov r14, qword ptr [rsi]
0xdb270b: test r14, r14
0xdb270e: je 0x140db29d8
0xdb2714: xor edx, edx
0xdb2716: lea rcx, [r13 + 0x1e8]
0xdb271d: nop dword ptr [rax]
0xdb2720: cmp byte ptr [rcx], 0
0xdb2723: jne 0x140db2990
0xdb2729: inc edx
0xdb272b: inc rcx
0xdb272e: cmp edx, 3
0xdb2731: jb 0x140db2720
0xdb2733: test al, al
0xdb2735: je 0x140db2990
0xdb273b: mov rbx, qword ptr [r14 + 0x20]
0xdb273f: mov rax, qword ptr [rbx]
0xdb2742: mov rcx, qword ptr [rax + 0xa0]
0xdb2749: test rcx, rcx
0xdb274c: je 0x140db2755
0xdb274e: cmp qword ptr [rcx + 8], 0
0xdb2753: jne 0x140db2772
0xdb2755: lea rdx, [rip + 0x5f1c8bc]
0xdb275c: mov rcx, qword ptr [rbx + 8]
0xdb2760: call 0x1435ca140
0xdb2765: cmp eax, -1
0xdb2768: je 0x140db2772
0xdb276a: mov rcx, rbx
0xdb276d: call 0x1435c66a0
0xdb2772: mov rax, qword ptr [rip + 0x5fb6daf]
0xdb2779: mov rcx, qword ptr [rbp - 0x39]
0xdb277d: mov edx, 0x1ec
0xdb2782: cmp byte ptr [rdx + rcx], 0
0xdb2786: cmovne rax, qword ptr [rip + 0x5fb6da2]
0xdb278e: mov rax, qword ptr [rax]
0xdb2791: mov rcx, qword ptr [rax + 8]
0xdb2795: mov rcx, qword ptr [rcx + 0x270]
0xdb279c: add rcx, 0x134
0xdb27a3: call 0x140537250
0xdb27a8: mov ebx, dword ptr [rax]
0xdb27aa: mov rcx, r15
0xdb27ad: call 0x140430020
0xdb27b2: movzx edx, word ptr [rax + 0x12]
0xdb27b6: mov rcx, qword ptr [rbp - 0x19]
0xdb27ba: call 0x140d91e30
0xdb27bf: cmp dword ptr [rax + 0x58], 0
0xdb27c3: jne 0x140db27cc
0xdb27c5: mov eax, 0xffff
0xdb27ca: jmp 0x140db27d3
0xdb27cc: mov rax, qword ptr [rax + 0x50]
0xdb27d0: movzx eax, word ptr [rax]
0xdb27d3: xor ecx, ecx
0xdb27d5: mov dword ptr [rbp - 0x28], ecx
0xdb27d8: mov word ptr [rbp - 0x24], cx
0xdb27dc: mov byte ptr [rbp - 0x22], cl
0xdb27df: mov qword ptr [rbp - 0x31], 0xffffffffffffffff
0xdb27e7: mov word ptr [rbp - 0x31], ax
0xdb27eb: mov byte ptr [rbp - 0x29], 6
0xdb27ef: cmp dword ptr [rdi + 0x15c], ecx
0xdb27f5: je 0x140db29d8
0xdb27fb: mov ecx, dword ptr [rdi + 0x158]
0xdb2801: test ecx, ecx
0xdb2803: je 0x140db29d8
0xdb2809: xor edx, edx
0xdb280b: mov eax, ebx
0xdb280d: div ecx
0xdb280f: mov r8d, edx
0xdb2812: shl r8, 8
0xdb2816: add r8, qword ptr [rdi + 0x168]
0xdb281d: xor edx, edx
0xdb281f: mov r10d, dword ptr [r8]
0xdb2822: test r10d, r10d
0xdb2825: je 0x140db29d8
0xdb282b: nop dword ptr [rax + rax]
0xdb2830: cmp dword ptr [r8 + rdx*8 + 8], ebx
0xdb2835: jne 0x140db284d
0xdb2837: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb283c: mov rax, qword ptr [rdi + 0x170]
0xdb2843: mov r9, qword ptr [rax + rcx*8]
0xdb2847: cmp dword ptr [r9 + 4], ebx
0xdb284b: je 0x140db2859
0xdb284d: inc edx
0xdb284f: cmp edx, r10d
0xdb2852: jb 0x140db2830
0xdb2854: jmp 0x140db29d8
0xdb2859: lea rcx, [r9 + 8]
0xdb285d: test rcx, rcx
0xdb2860: je 0x140db29d8
0xdb2866: lea rdx, [rbp - 0x31]
0xdb286a: call 0x140de4500
0xdb286f: test rax, rax
0xdb2872: je 0x140db29d8
0xdb2878: mov rcx, qword ptr [rdi + 8]
0xdb287c: lea rdx, [rbp - 0x41]
0xdb2880: mov rcx, qword ptr [rcx + 0x18]
0xdb2884: call 0x1435b4b90
0xdb2889: vmovss xmm4, dword ptr [rdi + 0xa98]
0xdb2891: vmovss xmm0, dword ptr [r15 + 2]
0xdb2897: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xdb289f: vdivss xmm3, xmm1, xmm4
0xdb28a3: vmulss xmm0, xmm7, dword ptr [rbp - 0x41]
0xdb28a8: vaddss xmm1, xmm3, xmm0
0xdb28ac: vmovss dword ptr [rbp + 0x7f], xmm1
0xdb28b1: vmovss xmm2, dword ptr [r15 + 6]
0xdb28b7: vaddss xmm0, xmm2, dword ptr [rdi + 0xa5c]
0xdb28bf: vdivss xmm3, xmm0, xmm4
0xdb28c3: vmulss xmm2, xmm7, dword ptr [rbp - 0x3d]
0xdb28c8: vaddss xmm0, xmm3, xmm2
0xdb28cc: vmovss dword ptr [rbp + 0x83], xmm0
0xdb28d4: vmovss xmm3, dword ptr [rdi + 0xa9c]
0xdb28dc: movzx r8d, byte ptr [rdi + 0xae4]
0xdb28e4: vmovss xmm1, dword ptr [rdi + 0xabc]
0xdb28ec: mov rcx, r13
0xdb28ef: call 0x140d91820
0xdb28f4: vmovaps xmm6, xmm0
0xdb28f8: mov byte ptr [rbp + 0x6f], 0
0xdb28fc: mov byte ptr [rbp + 0x77], 2
0xdb2900: lea r9, [rbp + 0x6f]
0xdb2904: lea r8, [rbp + 0x7f]
0xdb2908: lea rdx, [rbp + 0x77]
0xdb290c: mov rcx, qword ptr [r14 + 0x20]
0xdb2910: call 0x14064b570
0xdb2915: mov byte ptr [rbp + 0x6f], 0
0xdb2919: mov byte ptr [rbp + 0x77], 4
0xdb291d: lea r9, [rbp + 0x6f]
0xdb2921: lea r8, [rbp + 0x83]
0xdb2928: lea rdx, [rbp + 0x77]
0xdb292c: mov rcx, qword ptr [r14 + 0x20]
0xdb2930: call 0x14064b570
0xdb2935: mov rdx, qword ptr [r14 + 0x18]
0xdb2939: mov rcx, qword ptr [rdx]
0xdb293c: mov rax, qword ptr [rcx + 0xa0]
0xdb2943: test rax, rax
0xdb2946: je 0x140db2953
0xdb2948: cmp qword ptr [rax + 8], 0
0xdb294d: jne 0x140db29d8
0xdb2953: mov rax, qword ptr [rcx + 0x20]
0xdb2957: mov rcx, qword ptr [rax + 0x20]
0xdb295b: vmovss dword ptr [rcx + 0x20], xmm6
0xdb2960: mov rax, qword ptr [rdx]
0xdb2963: mov rcx, qword ptr [rax + 0x20]
0xdb2967: mov rax, qword ptr [rcx + 0x20]
0xdb296b: vmovss dword ptr [rax + 0x28], xmm6
0xdb2970: mov rax, qword ptr [rdx]
0xdb2973: mov rcx, qword ptr [rax + 0x20]
0xdb2977: mov rax, qword ptr [rcx + 0x20]
0xdb297b: mov dword ptr [rax + 0x30], 0x3f800000
0xdb2982: mov rcx, qword ptr [rdx]
0xdb2985: mov rcx, qword ptr [rcx + 0x18]
0xdb2989: call 0x140d438d0
0xdb298e: jmp 0x140db29d8
0xdb2990: mov rbx, qword ptr [r14 + 0x20]
0xdb2994: mov rax, qword ptr [rbx]
0xdb2997: mov rcx, qword ptr [rax + 0xa0]
0xdb299e: test rcx, rcx
0xdb29a1: je 0x140db29aa
0xdb29a3: cmp qword ptr [rcx + 8], 0
0xdb29a8: jne 0x140db29d8
0xdb29aa: cmp dword ptr [rip + 0x5f1c667], 0
0xdb29b1: je 0x140db29d8
0xdb29b3: lea rdx, [rip + 0x5f1c65e]
0xdb29ba: mov rcx, qword ptr [rbx + 8]
0xdb29be: call 0x1435ca0a0
0xdb29c3: test al, al
0xdb29c5: je 0x140db29d8
0xdb29c7: mov rcx, qword ptr [rbx + 8]
0xdb29cb: call 0x1435caec0
0xdb29d0: mov rcx, rbx
0xdb29d3: call 0x1435c66a0
0xdb29d8: add rsi, 0x18
0xdb29dc: add r15, 0x18
0xdb29e0: cmp rsi, r12
0xdb29e3: jne 0x140db26f1
0xdb29e9: lea rax, [rip + 0x4973458]
0xdb29f0: mov qword ptr [rbp - 0x21], rax
0xdb29f4: lea rcx, [rbp - 0x21]
0xdb29f8: call 0x141434880
0xdb29fd: lea r11, [rsp + 0xa0]
0xdb2a05: mov rbx, qword ptr [r11 + 0x40]
0xdb2a09: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdb2a0f: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdb2a15: mov rsp, r11
0xdb2a18: pop r15
0xdb2a1a: pop r14
0xdb2a1c: pop r13
0xdb2a1e: pop r12
0xdb2a20: pop rdi
0xdb2a21: pop rsi
0xdb2a22: pop rbp
0xdb2a23: ret 