0xdb85a0: push rbp
0xdb85a2: push rdi
0xdb85a3: push r14
0xdb85a5: sub rsp, 0x40
0xdb85a9: mov rbp, rcx
0xdb85ac: mov qword ptr [rsp + 0x60], rbx
0xdb85b1: mov ebx, dword ptr [rdx + 0x1c0]
0xdb85b7: lea rcx, [rdx + 0xde]
0xdb85be: movzx eax, word ptr [rcx]
0xdb85c1: movzx r14d, r8b
0xdb85c5: mov word ptr [rsp + 0x68], ax
0xdb85ca: mov rdi, rdx
0xdb85cd: call 0x140537250
0xdb85d2: vmovss xmm1, dword ptr [rdi + 0x100]
0xdb85da: cmp byte ptr [rax + 0xb5], 0
0xdb85e1: je 0x140db869d
0xdb85e7: vxorps xmm0, xmm0, xmm0
0xdb85eb: vucomiss xmm1, xmm0
0xdb85ef: jp 0x140db85f3
0xdb85f1: je 0x140db8653
0xdb85f3: lea rcx, [rsp + 0x68]
0xdb85f8: call 0x140537250
0xdb85fd: vmovss xmm0, dword ptr [rax + 0xa4]
0xdb8605: vcomiss xmm0, dword ptr [rip + 0x4fbaaa7]  ; [0x5d730b4] = 1 (0x3f800000)
0xdb860d: jbe 0x140db8653
0xdb860f: vmovss xmm0, dword ptr [rdi + 0x100]
0xdb8617: vmovaps xmmword ptr [rsp + 0x30], xmm6
0xdb861d: vmovaps xmmword ptr [rsp + 0x20], xmm7
0xdb8623: vmovss xmm7, dword ptr [rip + 0x5ef354d]  ; [0x6cabb78] = runtime global (no file value)
0xdb862b: lea rcx, [rsp + 0x68]
0xdb8630: vaddss xmm6, xmm0, xmm0
0xdb8634: call 0x140537250
0xdb8639: vmulss xmm0, xmm7, dword ptr [rax + 0xa4]
0xdb8641: vmovaps xmm7, xmmword ptr [rsp + 0x20]
0xdb8647: vcomiss xmm6, xmm0
0xdb864b: vmovaps xmm6, xmmword ptr [rsp + 0x30]
0xdb8651: ja 0x140db869d
0xdb8653: mov qword ptr [rsp + 0x70], rsi
0xdb8658: lea rsi, [rbp + 0x4f8]
0xdb865f: mov ecx, dword ptr [rsi + 8]
0xdb8662: mov eax, dword ptr [rsi + 0xc]
0xdb8665: cmp eax, ecx
0xdb8667: ja 0x140db868b
0xdb8669: lea edx, [rax*2 + 1]
0xdb8670: add edx, eax
0xdb8672: mov eax, 1
0xdb8677: shr edx, 1
0xdb8679: cmp edx, eax
0xdb867b: cmovb edx, eax
0xdb867e: cmp ecx, edx
0xdb8680: cmova edx, ecx
0xdb8683: mov rcx, rsi
0xdb8686: call 0x14035e3f0
0xdb868b: mov ecx, dword ptr [rsi + 8]
0xdb868e: mov rax, qword ptr [rsi]
0xdb8691: mov qword ptr [rax + rcx*8], rdi
0xdb8695: inc dword ptr [rsi + 8]
0xdb8698: mov rsi, qword ptr [rsp + 0x70]
0xdb869d: lea rcx, [rsp + 0x68]
0xdb86a2: call 0x140537250
0xdb86a7: mov rcx, qword ptr [rdi + 8]
0xdb86ab: movzx edx, byte ptr [rax + 0x62]
0xdb86af: call 0x140dec340
0xdb86b4: lea rcx, [rsp + 0x68]
0xdb86b9: call 0x140537250
0xdb86be: cmp dword ptr [rax + 0x2c], 0x43
0xdb86c2: je 0x140db86d4
0xdb86c4: lea rcx, [rsp + 0x68]
0xdb86c9: call 0x140537250
0xdb86ce: cmp dword ptr [rax + 0x2c], 0x42
0xdb86d2: jne 0x140db86e2
0xdb86d4: mov qword ptr [rbp + 0x5b8], rdi
0xdb86db: mov byte ptr [rbp + 0xad0], 1
0xdb86e2: test ebx, ebx
0xdb86e4: mov rbx, qword ptr [rsp + 0x60]
0xdb86e9: je 0x140db86f6
0xdb86eb: mov rdx, rdi
0xdb86ee: mov rcx, rbp
0xdb86f1: call 0x140df0780
0xdb86f6: movzx r8d, r14b
0xdb86fa: mov rdx, rdi
0xdb86fd: mov rcx, rbp
0xdb8700: call 0x140df0320
0xdb8705: mov rdx, rdi
0xdb8708: mov rcx, rbp
0xdb870b: add rsp, 0x40
0xdb870f: pop r14
0xdb8711: pop rdi
0xdb8712: pop rbp
0xdb8713: jmp 0x140dcfe70