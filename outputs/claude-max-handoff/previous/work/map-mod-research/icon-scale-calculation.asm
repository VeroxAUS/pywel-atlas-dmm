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
