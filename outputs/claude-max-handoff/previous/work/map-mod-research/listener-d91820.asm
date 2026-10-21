0xd91820: mov r11, rsp
0xd91823: mov qword ptr [r11 + 0x10], rbx
0xd91827: mov qword ptr [r11 + 0x18], rsi
0xd9182b: push rdi
0xd9182c: sub rsp, 0x80
0xd91833: cmp byte ptr [rcx + 0x2b8], 0
0xd9183a: mov rbx, rcx
0xd9183d: vmovaps xmmword ptr [rsp + 0x70], xmm6
0xd91843: vmovaps xmmword ptr [rsp + 0x60], xmm7
0xd91849: vmovaps xmmword ptr [r11 - 0x38], xmm8
0xd9184f: vmovss xmm8, dword ptr [rip + 0x4fe185d]
0xd91857: vmovaps xmmword ptr [r11 - 0x48], xmm9
0xd9185d: vmovaps xmmword ptr [r11 - 0x58], xmm10
0xd91863: vmovaps xmm9, xmm1
0xd91867: vmovaps xmm7, xmm3
0xd9186b: movzx esi, r8b
0xd9186f: je 0x140d91b0b
0xd91875: movzx eax, word ptr [rcx + 0xde]
0xd9187c: lea rcx, [r11 + 8]
0xd91880: mov word ptr [r11 + 8], ax
0xd91885: call 0x140537250
0xd9188a: cmp byte ptr [rax + 0xb5], 0
0xd91891: je 0x140d91990
0xd91897: cmp qword ptr [rbx + 0x260], 0
0xd9189f: jne 0x140d91986
0xd918a5: lea rcx, [rsp + 0x90]
0xd918ad: call 0x140537250
0xd918b2: mov ecx, esi
0xd918b4: movzx edx, byte ptr [rax + 0xb6]
0xd918bb: movzx eax, sil
0xd918bf: xor al, 1
0xd918c1: test dl, dl
0xd918c3: movzx eax, al
0xd918c6: cmove ecx, eax
0xd918c9: test cl, cl
0xd918cb: je 0x140d91986
0xd918d1: vmovss xmm1, dword ptr [rbx + 0x100]
0xd918d9: vxorps xmm0, xmm0, xmm0
0xd918dd: vucomiss xmm1, xmm0
0xd918e1: jp 0x140d918e9
0xd918e3: je 0x140d9196c
0xd918e9: lea rcx, [rsp + 0x90]
0xd918f1: call 0x140537250
0xd918f6: vmovss xmm0, dword ptr [rax + 0xa4]
0xd918fe: vcomiss xmm0, xmm8
0xd91903: jbe 0x140d9196c
0xd91905: vmovss xmm6, dword ptr [rip + 0x5f1a26b]
0xd9190d: lea rcx, [rsp + 0x90]
0xd91915: call 0x140537250
0xd9191a: vdivss xmm0, xmm6, xmm7
0xd9191e: vmulss xmm1, xmm0, xmm9
0xd91923: lea r8, [rsp + 0x90]
0xd9192b: vmulss xmm6, xmm1, dword ptr [rax + 0xa4]
0xd91933: mov rax, qword ptr [rbx + 0x118]
0xd9193a: lea rdx, [rsp + 0x20]
0xd9193f: mov rcx, qword ptr [rax + 0x20]
0xd91943: mov byte ptr [rsp + 0x90], 6
0xd9194b: call 0x1435c8ef0
0xd91950: lea rcx, [rsp + 0x20]
0xd91955: call 0x140615320
0xd9195a: cmp byte ptr [rax + 0xe], 0
0xd9195e: je 0x140d91963
0xd91960: mov rax, qword ptr [rax]
0xd91963: vdivss xmm8, xmm6, dword ptr [rax]
0xd91967: jmp 0x140d91b0b
0xd9196c: lea rcx, [rsp + 0x90]
0xd91974: call 0x140537250
0xd91979: vmulss xmm8, xmm9, dword ptr [rax + 0xa4]
0xd91981: jmp 0x140d91b0b
0xd91986: vmovaps xmm8, xmm9
0xd9198b: jmp 0x140d91b0b
0xd91990: lea rcx, [rsp + 0x90]
0xd91998: call 0x140537250
0xd9199d: vxorps xmm10, xmm10, xmm10
0xd919a2: vmovss xmm0, dword ptr [rax + 0x8c]
0xd919aa: vucomiss xmm0, xmm10
0xd919af: jp 0x140d919b3
0xd919b1: je 0x140d919e3
0xd919b3: lea rcx, [rsp + 0x90]
0xd919bb: call 0x140537250
0xd919c0: vcomiss xmm9, dword ptr [rax + 0x8c]
0xd919c8: jbe 0x140d919e3
0xd919ca: lea rcx, [rbx + 0xde]
0xd919d1: call 0x140537250
0xd919d6: vmovss xmm8, dword ptr [rax + 0x8c]
0xd919de: jmp 0x140d91b0b
0xd919e3: lea rcx, [rsp + 0x90]
0xd919eb: call 0x140537250
0xd919f0: vmovss xmm0, dword ptr [rax + 0x90]
0xd919f8: vucomiss xmm0, xmm10
0xd919fd: jp 0x140d91a01
0xd919ff: je 0x140d91a36
0xd91a01: lea rcx, [rsp + 0x90]
0xd91a09: call 0x140537250
0xd91a0e: vmovss xmm0, dword ptr [rax + 0x90]
0xd91a16: vcomiss xmm0, xmm9
0xd91a1b: jbe 0x140d91a36
0xd91a1d: lea rcx, [rbx + 0xde]
0xd91a24: call 0x140537250
0xd91a29: vmovss xmm8, dword ptr [rax + 0x90]
0xd91a31: jmp 0x140d91b0b
0xd91a36: lea rcx, [rsp + 0x90]
0xd91a3e: call 0x140537250
0xd91a43: vmovss xmm0, dword ptr [rax + 0xa0]
0xd91a4b: vucomiss xmm0, xmm10
0xd91a50: jp 0x140d91a58
0xd91a52: je 0x140d91986
0xd91a58: lea rcx, [rsp + 0x90]
0xd91a60: call 0x140537250
0xd91a65: lea rcx, [rsp + 0x90]
0xd91a6d: vsubss xmm7, xmm9, dword ptr [rax + 0x98]
0xd91a75: call 0x140537250
0xd91a7a: lea rcx, [rsp + 0x90]
0xd91a82: vmovss xmm6, dword ptr [rax + 0x9c]
0xd91a8a: call 0x140537250
0xd91a8f: vsubss xmm0, xmm6, dword ptr [rax + 0x98]
0xd91a97: vdivss xmm1, xmm7, xmm0
0xd91a9b: vminss xmm2, xmm1, xmm8
0xd91aa0: vmaxss xmm8, xmm10, xmm2
0xd91aa4: vucomiss xmm8, xmm10
0xd91aa9: jp 0x140d91ab4
0xd91aab: jne 0x140d91ab4
0xd91aad: vmovaps xmm0, xmm9
0xd91ab2: jmp 0x140d91b10
0xd91ab4: lea rcx, [rsp + 0x90]
0xd91abc: call 0x140537250
0xd91ac1: mov rcx, qword ptr [rbx + 0x118]
0xd91ac8: lea rdx, [rsp + 0x20]
0xd91acd: vmovss xmm7, dword ptr [rax + 0x94]
0xd91ad5: mov rcx, qword ptr [rcx + 0x18]
0xd91ad9: call 0x1435b4b90
0xd91ade: lea rcx, [rsp + 0x90]
0xd91ae6: vmovss xmm6, dword ptr [rax]
0xd91aea: call 0x140537250
0xd91aef: vmaxss xmm0, xmm6, xmm7
0xd91af3: vmulss xmm1, xmm8, dword ptr [rax + 0xa0]
0xd91afb: vdivss xmm1, xmm1, xmm0
0xd91aff: vmulss xmm2, xmm1, dword ptr [rip + 0x5f19f31]
0xd91b07: vsubss xmm8, xmm9, xmm2
0xd91b0b: vmovaps xmm0, xmm8
0xd91b10: vmovaps xmm6, xmmword ptr [rsp + 0x70]
0xd91b16: vmovaps xmm7, xmmword ptr [rsp + 0x60]
0xd91b1c: lea r11, [rsp + 0x80]
0xd91b24: mov rbx, qword ptr [r11 + 0x18]
0xd91b28: mov rsi, qword ptr [r11 + 0x20]
0xd91b2c: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xd91b32: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xd91b38: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xd91b3e: mov rsp, r11
0xd91b41: pop rdi
0xd91b42: ret 