0x28f82a0: mov rax, rsp
0x28f82a3: mov qword ptr [rax + 8], rbx
0x28f82a7: mov qword ptr [rax + 0x20], r9
0x28f82ab: mov qword ptr [rax + 0x18], r8
0x28f82af: push rbp
0x28f82b0: push rsi
0x28f82b1: push rdi
0x28f82b2: push r12
0x28f82b4: push r13
0x28f82b6: push r14
0x28f82b8: push r15
0x28f82ba: lea rbp, [rax - 0x2e8]
0x28f82c1: sub rsp, 0x3b0
0x28f82c8: vmovaps xmmword ptr [rax - 0x48], xmm6
0x28f82cd: vmovaps xmmword ptr [rax - 0x58], xmm7
0x28f82d2: vmovaps xmmword ptr [rax - 0x68], xmm8
0x28f82d7: vmovaps xmmword ptr [rax - 0x78], xmm9
0x28f82dc: vmovaps xmmword ptr [rax - 0x88], xmm10
0x28f82e4: vmovaps xmmword ptr [rax - 0x98], xmm11
0x28f82ec: mov rdi, r9
0x28f82ef: mov rsi, r8
0x28f82f2: mov r13, rdx
0x28f82f5: mov r12, rcx
0x28f82f8: xor r14d, r14d
0x28f82fb: lea rdx, [rbp - 0x50]
0x28f82ff: call 0x1428fb8b0
0x28f8304: nop 
0x28f8305: cmp byte ptr [rbp - 0x40], r14b
0x28f8309: jne 0x1428f834b
0x28f830b: mov eax, dword ptr [rip + 0x43fe843]
0x28f8311: mov dword ptr [r13], eax
0x28f8315: lea rax, [rip + 0x301ab44]
0x28f831c: mov qword ptr [rbp - 0x50], rax
0x28f8320: cmp byte ptr [rbp - 0x40], r14b
0x28f8324: je 0x1428f8334
0x28f8326: mov rcx, qword ptr [rbp - 0x28]
0x28f832a: mov rax, qword ptr [rcx]
0x28f832d: call qword ptr [rax + 0x148]
0x28f8333: nop 
0x28f8334: lea rax, [rip + 0x2c7b505]
0x28f833b: mov qword ptr [rbp - 0x50], rax
0x28f833f: lea r15, [rip + 0x2e2db02]
0x28f8346: jmp 0x1428f9857
0x28f834b: mov rax, qword ptr [rbp - 0x48]
0x28f834f: mov qword ptr [rsp + 0x78], rax
0x28f8354: lea rdx, [rbp - 0x80]
0x28f8358: mov rcx, qword ptr [r12 + 0xa0]
0x28f8360: call 0x14206ae30
0x28f8365: nop 
0x28f8366: cmp byte ptr [rbp - 0x70], 0
0x28f836a: jne 0x1428f8430
0x28f8370: mov eax, dword ptr [rip + 0x43feb46]
0x28f8376: mov dword ptr [r13], eax
0x28f837a: lea r15, [rip + 0x2e2dac7]
0x28f8381: mov qword ptr [rbp - 0x80], r15
0x28f8385: cmp byte ptr [rbp - 0x70], 0
0x28f8389: je 0x1428f8401
0x28f838b: cmp byte ptr [rbp - 0x6f], 0
0x28f838f: jne 0x1428f83a0
0x28f8391: mov rcx, qword ptr [rbp - 0x78]
0x28f8395: mov rax, qword ptr [rcx]
0x28f8398: call qword ptr [rax + 8]
0x28f839b: movzx edi, al
0x28f839e: jmp 0x1428f83df
0x28f83a0: mov rdi, qword ptr [rbp - 0x78]
0x28f83a4: lea rbx, [rdi + 0x18]
0x28f83a8: mov qword ptr [rsp + 0x78], rbx
0x28f83ad: mov rax, qword ptr [rbx]
0x28f83b0: mov rcx, rbx
0x28f83b3: call qword ptr [rax + 8]
0x28f83b6: nop 
0x28f83b7: dec word ptr [rdi + 0x48]
0x28f83bb: cmp byte ptr [rdi + 0x4a], 0
0x28f83bf: jne 0x1428f83d3
0x28f83c1: lock xadd dword ptr [rdi + 0x10], r14d
0x28f83c7: add r14w, word ptr [rdi + 0x48]
0x28f83cc: jne 0x1428f83d3
0x28f83ce: mov dil, 1
0x28f83d1: jmp 0x1428f83d6
0x28f83d3: xor dil, dil
0x28f83d6: mov rax, qword ptr [rbx]
0x28f83d9: mov rcx, rbx
0x28f83dc: call qword ptr [rax + 0x10]
0x28f83df: test dil, dil
0x28f83e2: je 0x1428f83fd
0x28f83e4: mov rcx, qword ptr [rbp - 0x78]
0x28f83e8: mov edi, 1
0x28f83ed: xor eax, eax
0x28f83ef: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f83f5: jne 0x1428f83fd
0x28f83f7: mov rax, qword ptr [rcx]
0x28f83fa: call qword ptr [rax + 0x10]
0x28f83fd: mov byte ptr [rbp - 0x70], 0
0x28f8401: lea rax, [rip + 0x301aa58]
0x28f8408: mov qword ptr [rbp - 0x50], rax
0x28f840c: cmp byte ptr [rbp - 0x40], 0
0x28f8410: je 0x1428f8420
0x28f8412: mov rcx, qword ptr [rbp - 0x28]
0x28f8416: mov rax, qword ptr [rcx]
0x28f8419: call qword ptr [rax + 0x148]
0x28f841f: nop 
0x28f8420: lea rax, [rip + 0x2c7b419]
0x28f8427: mov qword ptr [rbp - 0x50], rax
0x28f842b: jmp 0x1428f9857
0x28f8430: mov rax, qword ptr [rbp - 0x78]
0x28f8434: mov rcx, qword ptr [rax + 0x68]
0x28f8438: mov rcx, qword ptr [rcx + 0x20]
0x28f843c: add rcx, 0x30
0x28f8440: call 0x140389570
0x28f8445: mov ecx, dword ptr [rsi]
0x28f8447: cmp dword ptr [rax], ecx
0x28f8449: jne 0x1428f850f
0x28f844f: mov eax, dword ptr [rip + 0x43fea6b]
0x28f8455: mov dword ptr [r13], eax
0x28f8459: lea r15, [rip + 0x2e2d9e8]
0x28f8460: mov qword ptr [rbp - 0x80], r15
0x28f8464: cmp byte ptr [rbp - 0x70], 0
0x28f8468: je 0x1428f84e0
0x28f846a: cmp byte ptr [rbp - 0x6f], 0
0x28f846e: jne 0x1428f847f
0x28f8470: mov rcx, qword ptr [rbp - 0x78]
0x28f8474: mov rax, qword ptr [rcx]
0x28f8477: call qword ptr [rax + 8]
0x28f847a: movzx edi, al
0x28f847d: jmp 0x1428f84be
0x28f847f: mov rdi, qword ptr [rbp - 0x78]
0x28f8483: lea rbx, [rdi + 0x18]
0x28f8487: mov qword ptr [rsp + 0x78], rbx
0x28f848c: mov rax, qword ptr [rbx]
0x28f848f: mov rcx, rbx
0x28f8492: call qword ptr [rax + 8]
0x28f8495: nop 
0x28f8496: dec word ptr [rdi + 0x48]
0x28f849a: cmp byte ptr [rdi + 0x4a], 0
0x28f849e: jne 0x1428f84b2
0x28f84a0: lock xadd dword ptr [rdi + 0x10], r14d
0x28f84a6: add r14w, word ptr [rdi + 0x48]
0x28f84ab: jne 0x1428f84b2
0x28f84ad: mov dil, 1
0x28f84b0: jmp 0x1428f84b5
0x28f84b2: xor dil, dil
0x28f84b5: mov rax, qword ptr [rbx]
0x28f84b8: mov rcx, rbx
0x28f84bb: call qword ptr [rax + 0x10]
0x28f84be: test dil, dil
0x28f84c1: je 0x1428f84dc
0x28f84c3: mov rcx, qword ptr [rbp - 0x78]
0x28f84c7: mov edi, 1
0x28f84cc: xor eax, eax
0x28f84ce: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f84d4: jne 0x1428f84dc
0x28f84d6: mov rax, qword ptr [rcx]
0x28f84d9: call qword ptr [rax + 0x10]
0x28f84dc: mov byte ptr [rbp - 0x70], 0
0x28f84e0: lea rax, [rip + 0x301a979]
0x28f84e7: mov qword ptr [rbp - 0x50], rax
0x28f84eb: cmp byte ptr [rbp - 0x40], 0
0x28f84ef: je 0x1428f84ff
0x28f84f1: mov rcx, qword ptr [rbp - 0x28]
0x28f84f5: mov rax, qword ptr [rcx]
0x28f84f8: call qword ptr [rax + 0x148]
0x28f84fe: nop 
0x28f84ff: lea rax, [rip + 0x2c7b33a]
0x28f8506: mov qword ptr [rbp - 0x50], rax
0x28f850a: jmp 0x1428f9857
0x28f850f: mov r11, qword ptr [rip + 0x4471532]
0x28f8516: mov r15d, 0xffff
0x28f851c: cmp dword ptr [r11 + 0x6c], 0
0x28f8521: je 0x1428f857c
0x28f8523: mov r8d, dword ptr [r11 + 0x68]
0x28f8527: test r8d, r8d
0x28f852a: je 0x1428f857c
0x28f852c: xor edx, edx
0x28f852e: mov eax, ecx
0x28f8530: div r8d
0x28f8533: mov r9d, edx
0x28f8536: shl r9, 8
0x28f853a: add r9, qword ptr [r11 + 0x78]
0x28f853e: mov r8d, r14d
0x28f8541: mov ebx, dword ptr [r9]
0x28f8544: test ebx, ebx
0x28f8546: je 0x1428f857c
0x28f8548: nop dword ptr [rax + rax]
0x28f8550: mov eax, r8d
0x28f8553: cmp dword ptr [r9 + rax*8 + 8], ecx
0x28f8558: jne 0x1428f8574
0x28f855a: mov edx, dword ptr [r9 + rax*8 + 0xc]
0x28f855f: mov rax, qword ptr [r11 + 0x80]
0x28f8566: mov r10, qword ptr [rax + rdx*8]
0x28f856a: cmp dword ptr [r10 + 4], ecx
0x28f856e: je 0x1428f8654
0x28f8574: inc r8d
0x28f8577: cmp r8d, ebx
0x28f857a: jb 0x1428f8550
0x28f857c: mov edx, r15d
0x28f857f: mov dword ptr [rsp + 0x48], edx
0x28f8583: lea r15, [rip + 0x2e2d8be]
0x28f858a: mov qword ptr [rsp + 0x58], r15
0x28f858f: mov qword ptr [rsp + 0x60], r14
0x28f8594: mov word ptr [rsp + 0x68], 0
0x28f859b: mov qword ptr [rsp + 0x70], r14
0x28f85a0: lea rax, [rip + 0x2c7b4e1]
0x28f85a7: mov qword ptr [rsp + 0x58], rax
0x28f85ac: lea rax, [rip + 0x2c7b4b5]
0x28f85b3: mov qword ptr [rsp + 0x58], rax
0x28f85b8: vmovups ymm0, ymmword ptr [rdi]
0x28f85bc: vmovups ymmword ptr [rbp + 0x48], ymm0
0x28f85c1: vmovsd xmm1, qword ptr [rdi + 0x20]
0x28f85c6: vmovsd qword ptr [rbp + 0x68], xmm1
0x28f85cb: mov rax, qword ptr [r12 + 0x68]
0x28f85d0: mov rcx, qword ptr [rax + 0x20]
0x28f85d4: vxorps xmm6, xmm6, xmm6
0x28f85d8: vmovss xmm7, dword ptr [rip + 0x347b114]
0x28f85e0: cmp word ptr [rcx + 0x30], dx
0x28f85e4: jne 0x1428f8691
0x28f85ea: mov edx, 4
0x28f85ef: mov r8d, 0x10
0x28f85f5: mov rax, qword ptr [r12]
0x28f85f9: mov rcx, r12
0x28f85fc: vzeroupper 
0x28f85ff: call qword ptr [rax + 0xc0]
0x28f8605: test al, al
0x28f8607: setne bl
0x28f860a: mov qword ptr [rbp + 0x18], r15
0x28f860e: mov qword ptr [rbp + 0x20], r12
0x28f8612: mov byte ptr [rbp + 0x28], bl
0x28f8615: mov byte ptr [rbp + 0x29], 0
0x28f8619: mov qword ptr [rbp + 0x30], r14
0x28f861d: lea rax, [rip + 0x2c7b464]
0x28f8624: mov qword ptr [rbp + 0x18], rax
0x28f8628: lea rax, [rip + 0x2c7b439]
0x28f862f: mov qword ptr [rbp + 0x18], rax
0x28f8633: mov rax, qword ptr [rsp + 0x58]
0x28f8638: mov rdx, qword ptr [rax + 0x10]
0x28f863c: lea rax, [rip - 0x14c3dd3]
0x28f8643: lea rcx, [rsp + 0x58]
0x28f8648: cmp rdx, rax
0x28f864b: jne 0x1428f8667
0x28f864d: call 0x141434880
0x28f8652: jmp 0x1428f8669
0x28f8654: add r10, 8
0x28f8658: je 0x1428f857c
0x28f865e: movzx edx, word ptr [r10]
0x28f8662: jmp 0x1428f857f
0x28f8667: call rdx
0x28f8669: mov qword ptr [rsp + 0x70], r14
0x28f866e: mov qword ptr [rsp + 0x60], r12
0x28f8673: mov byte ptr [rsp + 0x68], bl
0x28f8677: mov qword ptr [rbp + 0x20], r14
0x28f867b: mov byte ptr [rbp + 0x28], 0
0x28f867f: mov qword ptr [rbp + 0x18], r15
0x28f8683: lea rcx, [rbp + 0x18]
0x28f8687: call 0x141434880
0x28f868c: jmp 0x1428f8dd0
0x28f8691: lea rdx, [r12 + 8]
0x28f8696: test r12, r12
0x28f8699: cmove rdx, r14
0x28f869d: mov rdx, qword ptr [rdx]
0x28f86a0: lea rcx, [rsp + 0x50]
0x28f86a5: vzeroupper 
0x28f86a8: call 0x140393df0
0x28f86ad: nop 
0x28f86ae: mov rcx, qword ptr [r12 + 0x68]
0x28f86b3: mov edx, dword ptr [rsi]
0x28f86b5: mov rcx, qword ptr [rcx + 0x110]
0x28f86bc: call 0x14214e7a0
0x28f86c1: mov rsi, rax
0x28f86c4: cmp qword ptr [rax + 0x28], -1
0x28f86c9: je 0x1428f9712
0x28f86cf: lea rcx, [rax + 0x20]
0x28f86d3: mov eax, 0xffff
0x28f86d8: cmp word ptr [rcx], ax
0x28f86db: je 0x1428f9712
0x28f86e1: mov ebx, dword ptr [rsi + 0x50]
0x28f86e4: call 0x140389570
0x28f86e9: movzx ecx, word ptr [rax + 0xbe]
0x28f86f0: mov word ptr [rsp + 0x40], cx
0x28f86f5: mov rdi, qword ptr [rsi + 0x28]
0x28f86f9: vmovsd xmm0, qword ptr [rsi + 0xc8]
0x28f8701: vmovsd qword ptr [rbp + 0x38], xmm0
0x28f8706: mov esi, dword ptr [rsi + 0xd0]
0x28f870c: mov rcx, qword ptr [rsp + 0x50]
0x28f8711: mov rax, qword ptr [rcx]
0x28f8714: mov dl, 1
0x28f8716: call qword ptr [rax + 0x20]
0x28f8719: test ebx, ebx
0x28f871b: je 0x1428f878d
0x28f871d: mov r8d, ebx
0x28f8720: lea rdx, [rbp - 0x20]
0x28f8724: mov rcx, qword ptr [rip + 0x4470f7d]
0x28f872b: mov rcx, qword ptr [rcx]
0x28f872e: call 0x142a82370
0x28f8733: mov rbx, rax
0x28f8736: mov rcx, qword ptr [rsp + 0x58]
0x28f873b: mov rdx, qword ptr [rcx + 0x10]
0x28f873f: lea rax, [rip - 0x14c3ed6]
0x28f8746: lea rcx, [rsp + 0x58]
0x28f874b: cmp rdx, rax
0x28f874e: jne 0x1428f8757
0x28f8750: call 0x141434870
0x28f8755: jmp 0x1428f8759
0x28f8757: call rdx
0x28f8759: mov rax, qword ptr [rbx + 0x18]
0x28f875d: mov qword ptr [rsp + 0x70], rax
0x28f8762: mov rax, qword ptr [rbx + 8]
0x28f8766: mov qword ptr [rsp + 0x60], rax
0x28f876b: movzx eax, byte ptr [rbx + 0x10]
0x28f876f: mov byte ptr [rsp + 0x68], al
0x28f8773: mov qword ptr [rbx + 8], r14
0x28f8777: mov byte ptr [rbx + 0x10], 0
0x28f877b: mov qword ptr [rbp - 0x20], r15
0x28f877f: lea rcx, [rbp - 0x20]
0x28f8783: call 0x141434880
0x28f8788: jmp 0x1428f8dd0
0x28f878d: lea rcx, [rsp + 0x40]
0x28f8792: call 0x1403891b0
0x28f8797: cmp byte ptr [rax + 0x4c], 0
0x28f879b: je 0x1428f8b27
0x28f87a1: vxorps xmm8, xmm8, xmm8
0x28f87a6: vxorps xmm9, xmm9, xmm9
0x28f87ab: vxorps xmm10, xmm10, xmm10
0x28f87b0: vmovups xmm11, xmmword ptr [rip + 0x416d150]
0x28f87b8: mov r8, qword ptr [rbp + 0x300]
0x28f87bf: mov r8d, dword ptr [r8]
0x28f87c2: lea rdx, [rsp + 0x40]
0x28f87c7: mov rcx, qword ptr [rsp + 0x78]
0x28f87cc: call 0x1420d5620
0x28f87d1: mov r8d, dword ptr [rsp + 0x40]
0x28f87d6: test r8d, r8d
0x28f87d9: je 0x1428f895f
0x28f87df: lea rdx, [rbp - 0x20]
0x28f87e3: mov rcx, qword ptr [rip + 0x4470ebe]
0x28f87ea: mov rcx, qword ptr [rcx]
0x28f87ed: call 0x142a82370
0x28f87f2: nop 
0x28f87f3: cmp byte ptr [rbp - 0x10], 0
0x28f87f7: je 0x1428f8952
0x28f87fd: mov rbx, qword ptr [rbp - 0x18]
0x28f8801: lea rdx, [rbx + 8]
0x28f8805: test rbx, rbx
0x28f8808: cmove rdx, r14
0x28f880c: mov rdx, qword ptr [rdx]
0x28f880f: lea rcx, [rsp + 0x50]
0x28f8814: call 0x140393df0
0x28f8819: nop 
0x28f881a: mov rax, qword ptr [rbx + 0x68]
0x28f881e: mov rcx, qword ptr [rax + 0x118]
0x28f8825: mov ebx, dword ptr [rcx + 0x18]
0x28f8828: mov rcx, qword ptr [rsp + 0x50]
0x28f882d: mov rax, qword ptr [rcx]
0x28f8830: mov dl, 1
0x28f8832: call qword ptr [rax + 0x20]
0x28f8835: test ebx, ebx
0x28f8837: jne 0x1428f8952
0x28f883d: mov rbx, qword ptr [rbp - 0x18]
0x28f8841: lea rdx, [rbx + 8]
0x28f8845: test rbx, rbx
0x28f8848: cmove rdx, r14
0x28f884c: mov rdx, qword ptr [rdx]
0x28f884f: lea rcx, [rsp + 0x50]
0x28f8854: call 0x140393df0
0x28f8859: nop 
0x28f885a: mov rcx, qword ptr [rbx + 0x68]
0x28f885e: lea rdx, [rbp + 0x18]
0x28f8862: mov rcx, qword ptr [rcx + 0x1a0]
0x28f8869: call 0x1404f8220
0x28f886e: movsx ecx, word ptr [rax + 0xe]
0x28f8872: vxorps xmm0, xmm0, xmm0
0x28f8876: vcvtsi2ss xmm0, xmm0, ecx
0x28f887a: vmulss xmm1, xmm0, xmm7
0x28f887e: vaddss xmm10, xmm1, dword ptr [rax + 8]
0x28f8883: vmovss xmm9, dword ptr [rax + 4]
0x28f8888: movsx ecx, word ptr [rax + 0xc]
0x28f888c: vxorps xmm0, xmm0, xmm0
0x28f8890: vcvtsi2ss xmm0, xmm0, ecx
0x28f8894: vmulss xmm1, xmm0, xmm7
0x28f8898: vaddss xmm8, xmm1, dword ptr [rax]
0x28f889c: mov rcx, qword ptr [rsp + 0x50]
0x28f88a1: mov rax, qword ptr [rcx]
0x28f88a4: mov dl, 1
0x28f88a6: call qword ptr [rax + 0x20]
0x28f88a9: mov rbx, qword ptr [rbp - 0x18]
0x28f88ad: lea rdx, [rbx + 8]
0x28f88b1: test rbx, rbx
0x28f88b4: cmove rdx, r14
0x28f88b8: mov rdx, qword ptr [rdx]
0x28f88bb: lea rcx, [rsp + 0x50]
0x28f88c0: call 0x140393df0
0x28f88c5: nop 
0x28f88c6: mov rax, qword ptr [rbx + 0x68]
0x28f88ca: mov rcx, qword ptr [rax + 0x1a0]
0x28f88d1: vmovups xmm0, xmmword ptr [rcx + 0xa4]
0x28f88d9: vmovups xmmword ptr [rbp + 0x110], xmm0
0x28f88e1: mov rax, qword ptr [rcx + 0xc8]
0x28f88e8: mov qword ptr [rbp + 0x120], rax
0x28f88ef: vmovups xmm0, xmmword ptr [rcx + 0xdc]
0x28f88f7: vmovups xmmword ptr [rbp + 0x128], xmm0
0x28f88ff: vmovups xmm1, xmmword ptr [rcx + 0xfc]
0x28f8907: vmovups xmmword ptr [rbp + 0x138], xmm1
0x28f890f: lea r8, [rbp + 0x128]
0x28f8916: lea rdx, [rbp + 0x18]
0x28f891a: lea rcx, [rbp + 0x110]
0x28f8921: call 0x1403936e0
0x28f8926: nop 
0x28f8927: mov rcx, qword ptr [rsp + 0x50]
0x28f892c: mov rax, qword ptr [rcx]
0x28f892f: mov dl, 1
0x28f8931: call qword ptr [rax + 0x20]
0x28f8934: vmovups xmm11, xmmword ptr [rbp + 0x18]
0x28f8939: mov r9d, dword ptr [rip + 0x43fe700]
0x28f8940: mov r8b, 0x1f
0x28f8943: lea rdx, [rsp + 0x50]
0x28f8948: mov rcx, qword ptr [rbp - 0x18]
0x28f894c: call 0x142068340
0x28f8951: nop 
0x28f8952: mov qword ptr [rbp - 0x20], r15
0x28f8956: lea rcx, [rbp - 0x20]
0x28f895a: call 0x141434880
0x28f895f: lea rdx, [rip + 0x416cf7a]
0x28f8966: mov rcx, qword ptr [rbp + 0x308]
0x28f896d: call 0x1404122a0
0x28f8972: test al, al
0x28f8974: jne 0x1428f898e
0x28f8976: vmovups ymm0, ymmword ptr [rcx]
0x28f897a: vmovups ymmword ptr [rbp + 0x48], ymm0
0x28f897f: vmovsd xmm1, qword ptr [rcx + 0x20]
0x28f8984: vmovsd qword ptr [rbp + 0x68], xmm1
0x28f8989: jmp 0x1428f8b27
0x28f898e: vucomiss xmm8, xmm6
0x28f8992: jp 0x1428f8b13
0x28f8998: jne 0x1428f8b13
0x28f899e: vucomiss xmm9, xmm6
0x28f89a2: jp 0x1428f8b13
0x28f89a8: jne 0x1428f8b13
0x28f89ae: vucomiss xmm10, xmm6
0x28f89b2: jp 0x1428f8b13
0x28f89b8: jne 0x1428f8b13
0x28f89be: vmovss xmm0, dword ptr [rbp + 0x38]
0x28f89c3: vucomiss xmm0, xmm6
0x28f89c7: jp 0x1428f8a23
0x28f89c9: jne 0x1428f8a23
0x28f89cb: vmovss xmm0, dword ptr [rbp + 0x3c]
0x28f89d0: vucomiss xmm0, xmm6
0x28f89d4: jp 0x1428f8a23
0x28f89d6: jne 0x1428f8a23
0x28f89d8: vmovd xmm0, esi
0x28f89dc: vucomiss xmm0, xmm6
0x28f89e0: jp 0x1428f8a23
0x28f89e2: jne 0x1428f8a23
0x28f89e4: mov rbx, qword ptr [rbp - 0x78]
0x28f89e8: lea rdx, [rbx + 8]
0x28f89ec: test rbx, rbx
0x28f89ef: cmove rdx, r14
0x28f89f3: mov rdx, qword ptr [rdx]
0x28f89f6: lea rcx, [rsp + 0x50]
0x28f89fb: call 0x140393df0
0x28f8a00: nop 
0x28f8a01: mov rcx, qword ptr [rbx + 0x68]
0x28f8a05: lea rdx, [rbp + 0x18]
0x28f8a09: mov rcx, qword ptr [rcx + 0x1a0]
0x28f8a10: call 0x1404f8220
0x28f8a15: nop 
0x28f8a16: mov rcx, qword ptr [rsp + 0x50]
0x28f8a1b: mov rax, qword ptr [rcx]
0x28f8a1e: mov dl, 1
0x28f8a20: call qword ptr [rax + 0x20]
0x28f8a23: lea rcx, [rbp + 0x150]
0x28f8a2a: call 0x142443e60
0x28f8a2f: mov byte ptr [rbp + 0x244], 0
0x28f8a36: mov byte ptr [rbp + 0x238], 0
0x28f8a3d: mov qword ptr [rbp + 0x23c], r14
0x28f8a44: mov rax, qword ptr [r12 + 0x68]
0x28f8a49: mov rsi, qword ptr [rax + 0x110]
0x28f8a50: mov rbx, qword ptr [rbp - 0x78]
0x28f8a54: lea rdx, [rbx + 8]
0x28f8a58: test rbx, rbx
0x28f8a5b: cmove rdx, r14
0x28f8a5f: mov rdx, qword ptr [rdx]
0x28f8a62: lea rcx, [rsp + 0x50]
0x28f8a67: call 0x140393df0
0x28f8a6c: nop 
0x28f8a6d: mov rcx, qword ptr [rbx + 0x68]
0x28f8a71: lea rdx, [rbp + 0x18]
0x28f8a75: mov rcx, qword ptr [rcx + 0x1a0]
0x28f8a7c: call 0x1404f8220
0x28f8a81: movsx ecx, word ptr [rax + 0xc]
0x28f8a85: vxorps xmm0, xmm0, xmm0
0x28f8a89: vcvtsi2ss xmm0, xmm0, ecx
0x28f8a8d: vmulss xmm1, xmm0, xmm7
0x28f8a91: vaddss xmm2, xmm1, dword ptr [rax]
0x28f8a95: vmovss dword ptr [rbp + 0x38], xmm2
0x28f8a9a: vmovss xmm0, dword ptr [rax + 4]
0x28f8a9f: vmovss dword ptr [rbp + 0x3c], xmm0
0x28f8aa4: movsx ecx, word ptr [rax + 0xe]
0x28f8aa8: vxorps xmm1, xmm1, xmm1
0x28f8aac: vcvtsi2ss xmm1, xmm1, ecx
0x28f8ab0: vmulss xmm0, xmm1, xmm7
0x28f8ab4: vaddss xmm2, xmm0, dword ptr [rax + 8]
0x28f8ab9: vmovss dword ptr [rbp + 0x40], xmm2
0x28f8abe: mov rcx, qword ptr [rsp + 0x50]
0x28f8ac3: mov rax, qword ptr [rcx]
0x28f8ac6: mov dl, 1
0x28f8ac8: call qword ptr [rax + 0x20]
0x28f8acb: lea rax, [rbp + 0x150]
0x28f8ad2: mov qword ptr [rsp + 0x20], rax
0x28f8ad7: lea r9, [rbp + 0x38]
0x28f8adb: movzx r8d, word ptr [rsp + 0x48]
0x28f8ae1: mov rdx, qword ptr [rsp + 0x78]
0x28f8ae6: mov rcx, rsi
0x28f8ae9: call 0x142b97df0
0x28f8aee: vmovsd xmm0, qword ptr [rbp + 0x150]
0x28f8af6: vmovsd qword ptr [rbp + 0x64], xmm0
0x28f8afb: mov eax, dword ptr [rbp + 0x158]
0x28f8b01: mov dword ptr [rbp + 0x6c], eax
0x28f8b04: vmovups xmm0, xmmword ptr [rbp + 0x15c]
0x28f8b0c: vmovups xmmword ptr [rbp + 0x54], xmm0
0x28f8b11: jmp 0x1428f8b27
0x28f8b13: vunpcklps xmm0, xmm8, xmm9
0x28f8b18: vmovsd qword ptr [rbp + 0x64], xmm0
0x28f8b1d: vmovss dword ptr [rbp + 0x6c], xmm10
0x28f8b22: vmovups xmmword ptr [rbp + 0x54], xmm11
0x28f8b27: lea rcx, [rbp + 0xc0]
0x28f8b2e: vzeroupper 
0x28f8b31: call 0x142b86680
0x28f8b36: nop 
0x28f8b37: mov qword ptr [rbp + 0xc0], rdi
0x28f8b3e: vmovsd xmm0, qword ptr [rbp + 0x64]
0x28f8b43: vmovsd qword ptr [rbp + 0xcc], xmm0
0x28f8b4b: mov eax, dword ptr [rbp + 0x6c]
0x28f8b4e: mov dword ptr [rbp + 0xd4], eax
0x28f8b54: mov word ptr [rbp + 0xf4], 0x307
0x28f8b5d: lea rcx, [rbp + 0x54]
0x28f8b61: call 0x140393bb0
0x28f8b66: vmovss dword ptr [rbp + 0xd8], xmm0
0x28f8b6e: mov qword ptr [rbp - 0x60], r14
0x28f8b72: mov qword ptr [rbp - 0x58], r14
0x28f8b76: mov rcx, qword ptr [r12 + 0x68]
0x28f8b7b: lea rax, [rsp + 0x58]
0x28f8b80: mov qword ptr [rsp + 0x28], rax
0x28f8b85: lea rax, [rbp - 0x60]
0x28f8b89: mov qword ptr [rsp + 0x20], rax
0x28f8b8e: lea r9, [rbp + 0xc0]
0x28f8b95: mov r8, qword ptr [rbp - 0x78]
0x28f8b99: lea rdx, [rsp + 0x48]
0x28f8b9e: mov rcx, qword ptr [rcx + 0x110]
0x28f8ba5: call 0x142ba9340
0x28f8baa: mov eax, dword ptr [rsp + 0x48]
0x28f8bae: test eax, eax
0x28f8bb0: je 0x1428f8d5e
0x28f8bb6: mov dword ptr [r13], eax
0x28f8bba: mov ebx, 0x1fd
0x28f8bbf: mov rcx, qword ptr [rbp - 0x60]
0x28f8bc3: test rcx, rcx
0x28f8bc6: je 0x1428f8be6
0x28f8bc8: mov rax, qword ptr gs:[0x58]
0x28f8bd1: mov rdx, qword ptr [rax]
0x28f8bd4: cmp byte ptr [rbx + rdx], 0
0x28f8bd8: je 0x1428f8be1
0x28f8bda: call 0x1447f03bc
0x28f8bdf: jmp 0x1428f8be6
0x28f8be1: call 0x1447f02bc
0x28f8be6: mov qword ptr [rbp - 0x60], r14
0x28f8bea: mov qword ptr [rbp - 0x58], r14
0x28f8bee: lea rcx, [rbp + 0xf8]
0x28f8bf5: call 0x14038ad90
0x28f8bfa: nop 
0x28f8bfb: mov rcx, qword ptr [rbp + 0xe0]
0x28f8c02: test rcx, rcx
0x28f8c05: je 0x1428f8c2c
0x28f8c07: mov rax, qword ptr gs:[0x58]
0x28f8c10: mov rdx, qword ptr [rax]
0x28f8c13: cmp byte ptr [rbx + rdx], 0
0x28f8c17: je 0x1428f8c20
0x28f8c19: call 0x1447f03bc
0x28f8c1e: jmp 0x1428f8c25
0x28f8c20: call 0x1447f02bc
0x28f8c25: mov qword ptr [rbp + 0xe0], r14
0x28f8c2c: mov qword ptr [rsp + 0x58], r15
0x28f8c31: mov edi, 1
0x28f8c36: cmp byte ptr [rsp + 0x68], 0
0x28f8c3b: je 0x1428f8cb4
0x28f8c3d: cmp byte ptr [rsp + 0x69], 0
0x28f8c42: jne 0x1428f8c54
0x28f8c44: mov rcx, qword ptr [rsp + 0x60]
0x28f8c49: mov rax, qword ptr [rcx]
0x28f8c4c: call qword ptr [rax + 8]
0x28f8c4f: movzx esi, al
0x28f8c52: jmp 0x1428f8c95
0x28f8c54: mov rsi, qword ptr [rsp + 0x60]
0x28f8c59: lea rbx, [rsi + 0x18]
0x28f8c5d: mov qword ptr [rsp + 0x78], rbx
0x28f8c62: mov rax, qword ptr [rbx]
0x28f8c65: mov rcx, rbx
0x28f8c68: call qword ptr [rax + 8]
0x28f8c6b: nop 
0x28f8c6c: dec word ptr [rsi + 0x48]
0x28f8c70: cmp byte ptr [rsi + 0x4a], 0
0x28f8c74: jne 0x1428f8c89
0x28f8c76: mov eax, r14d
0x28f8c79: lock xadd dword ptr [rsi + 0x10], eax
0x28f8c7e: add ax, word ptr [rsi + 0x48]
0x28f8c82: jne 0x1428f8c89
0x28f8c84: mov sil, 1
0x28f8c87: jmp 0x1428f8c8c
0x28f8c89: xor sil, sil
0x28f8c8c: mov rax, qword ptr [rbx]
0x28f8c8f: mov rcx, rbx
0x28f8c92: call qword ptr [rax + 0x10]
0x28f8c95: test sil, sil
0x28f8c98: je 0x1428f8caf
0x28f8c9a: mov rcx, qword ptr [rsp + 0x60]
0x28f8c9f: xor eax, eax
0x28f8ca1: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f8ca7: jne 0x1428f8caf
0x28f8ca9: mov rax, qword ptr [rcx]
0x28f8cac: call qword ptr [rax + 0x10]
0x28f8caf: mov byte ptr [rsp + 0x68], 0
0x28f8cb4: mov qword ptr [rbp - 0x80], r15
0x28f8cb8: cmp byte ptr [rbp - 0x70], 0
0x28f8cbc: je 0x1428f8d2f
0x28f8cbe: cmp byte ptr [rbp - 0x6f], 0
0x28f8cc2: jne 0x1428f8cd3
0x28f8cc4: mov rcx, qword ptr [rbp - 0x78]
0x28f8cc8: mov rax, qword ptr [rcx]
0x28f8ccb: call qword ptr [rax + 8]
0x28f8cce: movzx esi, al
0x28f8cd1: jmp 0x1428f8d12
0x28f8cd3: mov rsi, qword ptr [rbp - 0x78]
0x28f8cd7: lea rbx, [rsi + 0x18]
0x28f8cdb: mov qword ptr [rsp + 0x78], rbx
0x28f8ce0: mov rax, qword ptr [rbx]
0x28f8ce3: mov rcx, rbx
0x28f8ce6: call qword ptr [rax + 8]
0x28f8ce9: nop 
0x28f8cea: dec word ptr [rsi + 0x48]
0x28f8cee: cmp byte ptr [rsi + 0x4a], 0
0x28f8cf2: jne 0x1428f8d06
0x28f8cf4: lock xadd dword ptr [rsi + 0x10], r14d
0x28f8cfa: add r14w, word ptr [rsi + 0x48]
0x28f8cff: jne 0x1428f8d06
0x28f8d01: mov sil, 1
0x28f8d04: jmp 0x1428f8d09
0x28f8d06: xor sil, sil
0x28f8d09: mov rax, qword ptr [rbx]
0x28f8d0c: mov rcx, rbx
0x28f8d0f: call qword ptr [rax + 0x10]
0x28f8d12: test sil, sil
0x28f8d15: je 0x1428f8d2b
0x28f8d17: mov rcx, qword ptr [rbp - 0x78]
0x28f8d1b: xor eax, eax
0x28f8d1d: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f8d23: jne 0x1428f8d2b
0x28f8d25: mov rax, qword ptr [rcx]
0x28f8d28: call qword ptr [rax + 0x10]
0x28f8d2b: mov byte ptr [rbp - 0x70], 0
0x28f8d2f: lea rax, [rip + 0x301a12a]
0x28f8d36: mov qword ptr [rbp - 0x50], rax
0x28f8d3a: cmp byte ptr [rbp - 0x40], 0
0x28f8d3e: je 0x1428f8d4e
0x28f8d40: mov rcx, qword ptr [rbp - 0x28]
0x28f8d44: mov rax, qword ptr [rcx]
0x28f8d47: call qword ptr [rax + 0x148]
0x28f8d4d: nop 
0x28f8d4e: lea rax, [rip + 0x2c7aaeb]
0x28f8d55: mov qword ptr [rbp - 0x50], rax
0x28f8d59: jmp 0x1428f9857
0x28f8d5e: mov ebx, 0x1fd
0x28f8d63: mov rcx, qword ptr [rbp - 0x60]
0x28f8d67: test rcx, rcx
0x28f8d6a: je 0x1428f8d8a
0x28f8d6c: mov rax, qword ptr gs:[0x58]
0x28f8d75: mov rdx, qword ptr [rax]
0x28f8d78: cmp byte ptr [rbx + rdx], 0
0x28f8d7c: je 0x1428f8d85
0x28f8d7e: call 0x1447f03bc
0x28f8d83: jmp 0x1428f8d8a
0x28f8d85: call 0x1447f02bc
0x28f8d8a: mov qword ptr [rbp - 0x60], r14
0x28f8d8e: mov qword ptr [rbp - 0x58], r14
0x28f8d92: lea rcx, [rbp + 0xf8]
0x28f8d99: call 0x14038ad90
0x28f8d9e: nop 
0x28f8d9f: mov rcx, qword ptr [rbp + 0xe0]
0x28f8da6: test rcx, rcx
0x28f8da9: je 0x1428f8dd0
0x28f8dab: mov rax, qword ptr gs:[0x58]
0x28f8db4: mov rdx, qword ptr [rax]
0x28f8db7: cmp byte ptr [rbx + rdx], 0
0x28f8dbb: je 0x1428f8dc4
0x28f8dbd: call 0x1447f03bc
0x28f8dc2: jmp 0x1428f8dc9
0x28f8dc4: call 0x1447f02bc
0x28f8dc9: mov qword ptr [rbp + 0xe0], r14
0x28f8dd0: cmp byte ptr [rsp + 0x68], 0
0x28f8dd5: jne 0x1428f8f17
0x28f8ddb: mov eax, dword ptr [rip + 0x43fe187]
0x28f8de1: mov dword ptr [r13], eax
0x28f8de5: mov qword ptr [rsp + 0x58], r15
0x28f8dea: mov edi, 1
0x28f8def: cmp byte ptr [rsp + 0x68], 0
0x28f8df4: je 0x1428f8e6d
0x28f8df6: cmp byte ptr [rsp + 0x69], 0
0x28f8dfb: jne 0x1428f8e0d
0x28f8dfd: mov rcx, qword ptr [rsp + 0x60]
0x28f8e02: mov rax, qword ptr [rcx]
0x28f8e05: call qword ptr [rax + 8]
0x28f8e08: movzx esi, al
0x28f8e0b: jmp 0x1428f8e4e
0x28f8e0d: mov rsi, qword ptr [rsp + 0x60]
0x28f8e12: lea rbx, [rsi + 0x18]
0x28f8e16: mov qword ptr [rsp + 0x78], rbx
0x28f8e1b: mov rax, qword ptr [rbx]
0x28f8e1e: mov rcx, rbx
0x28f8e21: call qword ptr [rax + 8]
0x28f8e24: nop 
0x28f8e25: dec word ptr [rsi + 0x48]
0x28f8e29: cmp byte ptr [rsi + 0x4a], 0
0x28f8e2d: jne 0x1428f8e42
0x28f8e2f: mov eax, r14d
0x28f8e32: lock xadd dword ptr [rsi + 0x10], eax
0x28f8e37: add ax, word ptr [rsi + 0x48]
0x28f8e3b: jne 0x1428f8e42
0x28f8e3d: mov sil, 1
0x28f8e40: jmp 0x1428f8e45
0x28f8e42: xor sil, sil
0x28f8e45: mov rax, qword ptr [rbx]
0x28f8e48: mov rcx, rbx
0x28f8e4b: call qword ptr [rax + 0x10]
0x28f8e4e: test sil, sil
0x28f8e51: je 0x1428f8e68
0x28f8e53: mov rcx, qword ptr [rsp + 0x60]
0x28f8e58: xor eax, eax
0x28f8e5a: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f8e60: jne 0x1428f8e68
0x28f8e62: mov rax, qword ptr [rcx]
0x28f8e65: call qword ptr [rax + 0x10]
0x28f8e68: mov byte ptr [rsp + 0x68], 0
0x28f8e6d: mov qword ptr [rbp - 0x80], r15
0x28f8e71: cmp byte ptr [rbp - 0x70], 0
0x28f8e75: je 0x1428f8ee8
0x28f8e77: cmp byte ptr [rbp - 0x6f], 0
0x28f8e7b: jne 0x1428f8e8c
0x28f8e7d: mov rcx, qword ptr [rbp - 0x78]
0x28f8e81: mov rax, qword ptr [rcx]
0x28f8e84: call qword ptr [rax + 8]
0x28f8e87: movzx esi, al
0x28f8e8a: jmp 0x1428f8ecb
0x28f8e8c: mov rsi, qword ptr [rbp - 0x78]
0x28f8e90: lea rbx, [rsi + 0x18]
0x28f8e94: mov qword ptr [rsp + 0x78], rbx
0x28f8e99: mov rax, qword ptr [rbx]
0x28f8e9c: mov rcx, rbx
0x28f8e9f: call qword ptr [rax + 8]
0x28f8ea2: nop 
0x28f8ea3: dec word ptr [rsi + 0x48]
0x28f8ea7: cmp byte ptr [rsi + 0x4a], 0
0x28f8eab: jne 0x1428f8ebf
0x28f8ead: lock xadd dword ptr [rsi + 0x10], r14d
0x28f8eb3: add r14w, word ptr [rsi + 0x48]
0x28f8eb8: jne 0x1428f8ebf
0x28f8eba: mov sil, 1
0x28f8ebd: jmp 0x1428f8ec2
0x28f8ebf: xor sil, sil
0x28f8ec2: mov rax, qword ptr [rbx]
0x28f8ec5: mov rcx, rbx
0x28f8ec8: call qword ptr [rax + 0x10]
0x28f8ecb: test sil, sil
0x28f8ece: je 0x1428f8ee4
0x28f8ed0: mov rcx, qword ptr [rbp - 0x78]
0x28f8ed4: xor eax, eax
0x28f8ed6: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f8edc: jne 0x1428f8ee4
0x28f8ede: mov rax, qword ptr [rcx]
0x28f8ee1: call qword ptr [rax + 0x10]
0x28f8ee4: mov byte ptr [rbp - 0x70], 0
0x28f8ee8: lea rax, [rip + 0x3019f71]
0x28f8eef: mov qword ptr [rbp - 0x50], rax
0x28f8ef3: cmp byte ptr [rbp - 0x40], 0
0x28f8ef7: je 0x1428f8f07
0x28f8ef9: mov rcx, qword ptr [rbp - 0x28]
0x28f8efd: mov rax, qword ptr [rcx]
0x28f8f00: call qword ptr [rax + 0x148]
0x28f8f06: nop 
0x28f8f07: lea rax, [rip + 0x2c7a932]
0x28f8f0e: mov qword ptr [rbp - 0x50], rax
0x28f8f12: jmp 0x1428f9857
0x28f8f17: lea rdx, [rip + 0x416c9c2]
0x28f8f1e: lea rcx, [rbp + 0x48]
0x28f8f22: call 0x1404122a0
0x28f8f27: test al, al
0x28f8f29: jne 0x1428f8fc7
0x28f8f2f: vmovsd xmm0, qword ptr [rbp + 0x64]
0x28f8f34: vmovsd qword ptr [rbp - 0x60], xmm0
0x28f8f39: mov edx, dword ptr [rbp + 0x6c]
0x28f8f3c: vmovss xmm3, dword ptr [rbp + 0x64]
0x28f8f41: vdivss xmm0, xmm3, xmm7
0x28f8f45: vcvttss2si eax, xmm0
0x28f8f49: vmovd xmm1, edx
0x28f8f4d: vdivss xmm2, xmm1, xmm7
0x28f8f51: vcvttss2si ecx, xmm2
0x28f8f55: mov word ptr [rbp - 0x54], ax
0x28f8f59: mov word ptr [rbp - 0x52], cx
0x28f8f5d: cwde 
0x28f8f5e: vxorps xmm0, xmm0, xmm0
0x28f8f62: vcvtsi2ss xmm0, xmm0, eax
0x28f8f66: vmulss xmm1, xmm0, xmm7
0x28f8f6a: vsubss xmm2, xmm3, xmm1
0x28f8f6e: vmovss dword ptr [rbp - 0x60], xmm2
0x28f8f73: vaddss xmm1, xmm6, dword ptr [rbp - 0x5c]
0x28f8f78: vmovss dword ptr [rbp - 0x5c], xmm1
0x28f8f7d: movsx eax, cx
0x28f8f80: vxorps xmm0, xmm0, xmm0
0x28f8f84: vcvtsi2ss xmm0, xmm0, eax
0x28f8f88: vmulss xmm2, xmm0, xmm7
0x28f8f8c: vmovd xmm1, edx
0x28f8f90: vsubss xmm2, xmm1, xmm2
0x28f8f94: vmovss dword ptr [rbp - 0x58], xmm2
0x28f8f99: mov rax, qword ptr [rsp + 0x60]
0x28f8f9e: mov rcx, qword ptr [rax + 0x68]
0x28f8fa2: mov rcx, qword ptr [rcx + 0x1a0]
0x28f8fa9: mov rax, qword ptr [rcx]
0x28f8fac: mov byte ptr [rsp + 0x28], 0
0x28f8fb1: mov byte ptr [rsp + 0x20], 5
0x28f8fb6: mov r9b, 4
0x28f8fb9: lea r8, [rbp + 0x54]
0x28f8fbd: lea rdx, [rbp - 0x60]
0x28f8fc1: call qword ptr [rax + 0x1a0]
0x28f8fc7: mov rax, qword ptr [rsp + 0x60]
0x28f8fcc: mov rcx, qword ptr [rax + 0x68]
0x28f8fd0: mov rax, qword ptr [rcx + 0x1a0]
0x28f8fd7: movzx ecx, word ptr [rax + 0x28]
0x28f8fdb: mov word ptr [rsp + 0x40], cx
0x28f8fe0: lea rcx, [rsp + 0x40]
0x28f8fe5: call 0x1404a2010
0x28f8fea: mov ebx, dword ptr [rax]
0x28f8fec: mov dword ptr [rsp + 0x50], ebx
0x28f8ff0: vmovsd xmm0, qword ptr [rip + 0x2c4cea0]
0x28f8ff8: vmovsd qword ptr [rbp + 0x70], xmm0
0x28f8ffd: mov eax, dword ptr [rip + 0x2c4ce9d]
0x28f9003: mov dword ptr [rbp + 0x78], eax
0x28f9006: vmovdqu xmm0, xmmword ptr [rip + 0x347c9d2]
0x28f900e: vmovups xmmword ptr [rbp + 0x7c], xmm0
0x28f9013: vmovss dword ptr [rbp + 0x8c], xmm6
0x28f901b: vmovss dword ptr [rbp + 0x90], xmm6
0x28f9023: vmovss dword ptr [rbp + 0x94], xmm6
0x28f902b: lea rdx, [rbp + 0xa0]
0x28f9032: mov rcx, qword ptr [rsp + 0x60]
0x28f9037: call 0x1417fe3b0
0x28f903c: nop 
0x28f903d: lea rcx, [rsp + 0x48]
0x28f9042: cmp byte ptr [rbp + 0xb0], 0
0x28f9049: je 0x1428f90a0
0x28f904b: mov rax, qword ptr [rbp + 0xa8]
0x28f9052: lea rdx, [rax + 8]
0x28f9056: test rax, rax
0x28f9059: cmove rdx, r14
0x28f905d: mov rdx, qword ptr [rdx]
0x28f9060: call 0x140393df0
0x28f9065: nop 
0x28f9066: mov rax, qword ptr [rbp + 0xa8]
0x28f906d: mov rcx, qword ptr [rax + 0x68]
0x28f9071: mov rcx, qword ptr [rcx + 0x1a0]
0x28f9078: add rcx, 0x98
0x28f907f: lea rdx, [rbp - 0x20]
0x28f9083: call 0x140393470
0x28f9088: vmovups ymm0, ymmword ptr [rax]
0x28f908c: vmovups ymmword ptr [rbp + 0x70], ymm0
0x28f9091: vmovsd xmm1, qword ptr [rax + 0x20]
0x28f9096: vmovsd qword ptr [rbp + 0x90], xmm1
0x28f909e: jmp 0x1428f90ef
0x28f90a0: mov rax, qword ptr [rsp + 0x60]
0x28f90a5: lea rdx, [rax + 8]
0x28f90a9: test rax, rax
0x28f90ac: cmove rdx, r14
0x28f90b0: mov rdx, qword ptr [rdx]
0x28f90b3: call 0x140393df0
0x28f90b8: nop 
0x28f90b9: mov rax, qword ptr [rsp + 0x60]
0x28f90be: mov rcx, qword ptr [rax + 0x68]
0x28f90c2: mov rcx, qword ptr [rcx + 0x1a0]
0x28f90c9: add rcx, 0x98
0x28f90d0: lea rdx, [rbp - 0x20]
0x28f90d4: call 0x140393470
0x28f90d9: vmovups ymm0, ymmword ptr [rax]
0x28f90dd: vmovups ymmword ptr [rbp + 0x70], ymm0
0x28f90e2: vmovsd xmm1, qword ptr [rax + 0x20]
0x28f90e7: vmovsd qword ptr [rbp + 0x90], xmm1
0x28f90ef: mov rcx, qword ptr [rsp + 0x48]
0x28f90f4: mov dl, 1
0x28f90f6: mov rax, qword ptr [rcx]
0x28f90f9: vzeroupper 
0x28f90fc: call qword ptr [rax + 0x20]
0x28f90ff: lea rdx, [r12 + 8]
0x28f9104: movzx esi, byte ptr [rbp + 0x310]
0x28f910b: mov r8b, 1
0x28f910e: lea rcx, [rbp - 0x60]
0x28f9112: test sil, sil
0x28f9115: je 0x1428f9232
0x28f911b: test r12, r12
0x28f911e: cmove rdx, r14
0x28f9122: mov rdx, qword ptr [rdx]
0x28f9125: call 0x140393650
0x28f912a: nop 
0x28f912b: mov rax, qword ptr [rbp - 0x78]
0x28f912f: mov rcx, qword ptr [rax + 0x68]
0x28f9133: mov rdx, qword ptr [rcx + 0x20]
0x28f9137: movzx eax, byte ptr [rdx + 0x398]
0x28f913e: and al, 0xfb
0x28f9140: mov byte ptr [rdx + 0x398], al
0x28f9146: mov rdi, qword ptr [rbp - 0x60]
0x28f914a: mov rax, qword ptr [rdi]
0x28f914d: xor edx, edx
0x28f914f: mov rcx, rdi
0x28f9152: call qword ptr [rax + 0x20]
0x28f9155: cmp byte ptr [rbp - 0x58], 1
0x28f9159: jne 0x1428f9189
0x28f915b: mov eax, 0xffffffff
0x28f9160: lock xadd dword ptr [rdi + 8], eax
0x28f9165: cmp eax, 1
0x28f9168: jne 0x1428f917c
0x28f916a: test dword ptr [rdi + 0xc], 0x40000000
0x28f9171: je 0x1428f9189
0x28f9173: mov rax, qword ptr [rdi]
0x28f9176: mov rcx, rdi
0x28f9179: call qword ptr [rax + 0x40]
0x28f917c: test dword ptr [rdi + 0xc], 0x40000000
0x28f9183: je 0x1428f9189
0x28f9185: lock dec dword ptr [rdi + 0xc]
0x28f9189: mov rax, qword ptr [rbp - 0x78]
0x28f918d: mov rcx, qword ptr [rax + 0x68]
0x28f9191: mov rcx, qword ptr [rcx + 0x1c0]
0x28f9198: call 0x14156ff30
0x28f919d: mov dword ptr [rbp - 0x20], r14d
0x28f91a1: mov eax, 0xffff
0x28f91a6: mov word ptr [rbp - 0x1c], ax
0x28f91aa: vxorps xmm0, xmm0, xmm0
0x28f91ae: vmovups xmmword ptr [rbp - 0x18], xmm0
0x28f91b3: mov dword ptr [rbp - 8], 0
0x28f91ba: mov byte ptr [rbp - 4], 0
0x28f91be: mov dword ptr [rbp], r14d
0x28f91c2: mov qword ptr [rbp + 8], r14
0x28f91c6: mov qword ptr [rbp + 0x10], r14
0x28f91ca: mov dword ptr [rbp - 0x20], ebx
0x28f91cd: mov rbx, qword ptr [rsp + 0x60]
0x28f91d2: mov rax, qword ptr [rbx + 0x68]
0x28f91d6: mov rcx, qword ptr [rax + 0x20]
0x28f91da: movzx eax, word ptr [rcx + 0x30]
0x28f91de: mov word ptr [rbp - 0x1c], ax
0x28f91e2: vmovsd xmm0, qword ptr [rbp + 0x8c]
0x28f91ea: vmovsd qword ptr [rbp - 0x18], xmm0
0x28f91ef: mov eax, dword ptr [rbp + 0x94]
0x28f91f5: mov dword ptr [rbp - 0x10], eax
0x28f91f8: lea rcx, [rbp + 0x7c]
0x28f91fc: call 0x140393bb0
0x28f9201: vmovss dword ptr [rbp - 0xc], xmm0
0x28f9206: mov word ptr [rbp - 7], 0x101
0x28f920c: mov rcx, qword ptr [r12 + 0x68]
0x28f9211: lea r8, [rbp - 0x20]
0x28f9215: mov rdx, rbx
0x28f9218: mov rcx, qword ptr [rcx + 0x1a0]
0x28f921f: call 0x142bc4950
0x28f9224: nop 
0x28f9225: mov qword ptr [rbp + 8], r14
0x28f9229: mov qword ptr [rbp + 0x10], r14
0x28f922d: jmp 0x1428f92ea
0x28f9232: test r12, r12
0x28f9235: cmove rdx, r14
0x28f9239: mov rdx, qword ptr [rdx]
0x28f923c: call 0x140393650
0x28f9241: nop 
0x28f9242: mov byte ptr [r12 + 0xc3], 0
0x28f924b: mov rax, qword ptr [rbp - 0x78]
0x28f924f: mov rcx, qword ptr [rax + 0x68]
0x28f9253: mov rax, qword ptr [rcx + 0x20]
0x28f9257: and byte ptr [rax + 0x398], 0xfb
0x28f925e: mov rax, qword ptr [rsp + 0x60]
0x28f9263: mov rcx, qword ptr [rax + 0x68]
0x28f9267: mov rdx, qword ptr [rcx + 0x20]
0x28f926b: movzx eax, byte ptr [rdx + 0x398]
0x28f9272: or al, 4
0x28f9274: mov byte ptr [rdx + 0x398], al
0x28f927a: mov rbx, qword ptr [rbp - 0x60]
0x28f927e: mov rax, qword ptr [rbx]
0x28f9281: xor edx, edx
0x28f9283: mov rcx, rbx
0x28f9286: call qword ptr [rax + 0x20]
0x28f9289: cmp byte ptr [rbp - 0x58], 1
0x28f928d: jne 0x1428f92bd
0x28f928f: mov eax, 0xffffffff
0x28f9294: lock xadd dword ptr [rbx + 8], eax
0x28f9299: cmp eax, 1
0x28f929c: jne 0x1428f92b0
0x28f929e: test dword ptr [rbx + 0xc], 0x40000000
0x28f92a5: je 0x1428f92bd
0x28f92a7: mov rax, qword ptr [rbx]
0x28f92aa: mov rcx, rbx
0x28f92ad: call qword ptr [rax + 0x40]
0x28f92b0: test dword ptr [rbx + 0xc], 0x40000000
0x28f92b7: je 0x1428f92bd
0x28f92b9: lock dec dword ptr [rbx + 0xc]
0x28f92bd: mov rax, qword ptr [rbp - 0x78]
0x28f92c1: mov rcx, qword ptr [rax + 0x68]
0x28f92c5: mov rcx, qword ptr [rcx + 0x1c0]
0x28f92cc: call 0x14156ff30
0x28f92d1: mov rax, qword ptr [rsp + 0x60]
0x28f92d6: mov rcx, qword ptr [rax + 0x68]
0x28f92da: mov rcx, qword ptr [rcx + 0x1c0]
0x28f92e1: mov rax, qword ptr [rcx]
0x28f92e4: call qword ptr [rax + 0x170]
0x28f92ea: mov rdx, qword ptr [rsp + 0x60]
0x28f92ef: mov rcx, qword ptr [r12 + 0xa0]
0x28f92f7: call 0x14206aec0
0x28f92fc: mov r8, qword ptr [rbp - 0x78]
0x28f9300: mov rdx, qword ptr [r8 + 0x68]
0x28f9304: mov rax, qword ptr [rdx + 0x20]
0x28f9308: cmp byte ptr [rax + 0x340], 0
0x28f930f: jne 0x1428f93b8
0x28f9315: mov rax, qword ptr [rsp + 0x60]
0x28f931a: mov rcx, qword ptr [rax + 0x68]
0x28f931e: mov rax, qword ptr [rcx + 0x20]
0x28f9322: cmp byte ptr [rax + 0x340], 0
0x28f9329: jne 0x1428f93b8
0x28f932f: mov rax, qword ptr [rdx + 0x48]
0x28f9333: mov rbx, qword ptr [rax + 8]
0x28f9337: cmp byte ptr [rbp + 0x318], 0
0x28f933e: je 0x1428f93b8
0x28f9340: lea rdx, [rbp - 0x20]
0x28f9344: mov rcx, rbx
0x28f9347: call 0x1417ee200
0x28f934c: nop 
0x28f934d: cmp byte ptr [rbp - 0x10], 0
0x28f9351: je 0x1428f93a7
0x28f9353: mov rax, qword ptr [rbp - 0x18]
0x28f9357: mov rcx, qword ptr [rax + 0x68]
0x28f935b: mov rcx, qword ptr [rcx + 0x20]
0x28f935f: add rcx, 0x30
0x28f9363: call 0x140389570
0x28f9368: movzx ecx, word ptr [rax + 0xbe]
0x28f936f: mov word ptr [rsp + 0x40], cx
0x28f9374: lea rcx, [rsp + 0x40]
0x28f9379: call 0x1403891b0
0x28f937e: cmp byte ptr [rax + 0x5e], 2
0x28f9382: jne 0x1428f93a7
0x28f9384: mov eax, dword ptr [rbx + 0x60]
0x28f9387: mov dword ptr [rsp + 0x48], eax
0x28f938b: mov byte ptr [rsp + 0x20], 0xd
0x28f9390: xor r9d, r9d
0x28f9393: lea r8, [rsp + 0x48]
0x28f9398: mov rdx, qword ptr [rbp - 0x18]
0x28f939c: lea rcx, [rsp + 0x40]
0x28f93a1: call 0x142228e40
0x28f93a6: nop 
0x28f93a7: mov qword ptr [rbp - 0x20], r15
0x28f93ab: lea rcx, [rbp - 0x20]
0x28f93af: call 0x141434880
0x28f93b4: mov r8, qword ptr [rbp - 0x78]
0x28f93b8: mov r9, qword ptr [rsp + 0x60]
0x28f93bd: lea rdx, [rsp + 0x48]
0x28f93c2: mov rcx, qword ptr [rsp + 0x78]
0x28f93c7: call 0x142af86e0
0x28f93cc: mov eax, dword ptr [rsp + 0x48]
0x28f93d0: test eax, eax
0x28f93d2: je 0x1428f9522
0x28f93d8: mov dword ptr [r13], eax
0x28f93dc: mov qword ptr [rbp + 0xa0], r15
0x28f93e3: lea rcx, [rbp + 0xa0]
0x28f93ea: call 0x141434880
0x28f93ef: nop 
0x28f93f0: mov qword ptr [rsp + 0x58], r15
0x28f93f5: mov edi, 1
0x28f93fa: cmp byte ptr [rsp + 0x68], 0
0x28f93ff: je 0x1428f9478
0x28f9401: cmp byte ptr [rsp + 0x69], 0
0x28f9406: jne 0x1428f9418
0x28f9408: mov rcx, qword ptr [rsp + 0x60]
0x28f940d: mov rax, qword ptr [rcx]
0x28f9410: call qword ptr [rax + 8]
0x28f9413: movzx esi, al
0x28f9416: jmp 0x1428f9459
0x28f9418: mov rsi, qword ptr [rsp + 0x60]
0x28f941d: lea rbx, [rsi + 0x18]
0x28f9421: mov qword ptr [rsp + 0x78], rbx
0x28f9426: mov rax, qword ptr [rbx]
0x28f9429: mov rcx, rbx
0x28f942c: call qword ptr [rax + 8]
0x28f942f: nop 
0x28f9430: dec word ptr [rsi + 0x48]
0x28f9434: cmp byte ptr [rsi + 0x4a], 0
0x28f9438: jne 0x1428f944d
0x28f943a: mov eax, r14d
0x28f943d: lock xadd dword ptr [rsi + 0x10], eax
0x28f9442: add ax, word ptr [rsi + 0x48]
0x28f9446: jne 0x1428f944d
0x28f9448: mov sil, 1
0x28f944b: jmp 0x1428f9450
0x28f944d: xor sil, sil
0x28f9450: mov rax, qword ptr [rbx]
0x28f9453: mov rcx, rbx
0x28f9456: call qword ptr [rax + 0x10]
0x28f9459: test sil, sil
0x28f945c: je 0x1428f9473
0x28f945e: mov rcx, qword ptr [rsp + 0x60]
0x28f9463: xor eax, eax
0x28f9465: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f946b: jne 0x1428f9473
0x28f946d: mov rax, qword ptr [rcx]
0x28f9470: call qword ptr [rax + 0x10]
0x28f9473: mov byte ptr [rsp + 0x68], 0
0x28f9478: mov qword ptr [rbp - 0x80], r15
0x28f947c: cmp byte ptr [rbp - 0x70], 0
0x28f9480: je 0x1428f94f3
0x28f9482: cmp byte ptr [rbp - 0x6f], 0
0x28f9486: jne 0x1428f9497
0x28f9488: mov rcx, qword ptr [rbp - 0x78]
0x28f948c: mov rax, qword ptr [rcx]
0x28f948f: call qword ptr [rax + 8]
0x28f9492: movzx esi, al
0x28f9495: jmp 0x1428f94d6
0x28f9497: mov rsi, qword ptr [rbp - 0x78]
0x28f949b: lea rbx, [rsi + 0x18]
0x28f949f: mov qword ptr [rsp + 0x78], rbx
0x28f94a4: mov rax, qword ptr [rbx]
0x28f94a7: mov rcx, rbx
0x28f94aa: call qword ptr [rax + 8]
0x28f94ad: nop 
0x28f94ae: dec word ptr [rsi + 0x48]
0x28f94b2: cmp byte ptr [rsi + 0x4a], 0
0x28f94b6: jne 0x1428f94ca
0x28f94b8: lock xadd dword ptr [rsi + 0x10], r14d
0x28f94be: add r14w, word ptr [rsi + 0x48]
0x28f94c3: jne 0x1428f94ca
0x28f94c5: mov sil, 1
0x28f94c8: jmp 0x1428f94cd
0x28f94ca: xor sil, sil
0x28f94cd: mov rax, qword ptr [rbx]
0x28f94d0: mov rcx, rbx
0x28f94d3: call qword ptr [rax + 0x10]
0x28f94d6: test sil, sil
0x28f94d9: je 0x1428f94ef
0x28f94db: mov rcx, qword ptr [rbp - 0x78]
0x28f94df: xor eax, eax
0x28f94e1: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f94e7: jne 0x1428f94ef
0x28f94e9: mov rax, qword ptr [rcx]
0x28f94ec: call qword ptr [rax + 0x10]
0x28f94ef: mov byte ptr [rbp - 0x70], 0
0x28f94f3: lea rax, [rip + 0x3019966]
0x28f94fa: mov qword ptr [rbp - 0x50], rax
0x28f94fe: cmp byte ptr [rbp - 0x40], 0
0x28f9502: je 0x1428f9512
0x28f9504: mov rcx, qword ptr [rbp - 0x28]
0x28f9508: mov rax, qword ptr [rcx]
0x28f950b: call qword ptr [rax + 0x148]
0x28f9511: nop 
0x28f9512: lea rax, [rip + 0x2c7a327]
0x28f9519: mov qword ptr [rbp - 0x50], rax
0x28f951d: jmp 0x1428f9857
0x28f9522: test sil, sil
0x28f9525: je 0x1428f9545
0x28f9527: mov rcx, qword ptr [r12 + 0x68]
0x28f952c: xor r8d, r8d
0x28f952f: lea rdx, [rsp + 0x50]
0x28f9534: mov rcx, qword ptr [rcx + 0x1a0]
0x28f953b: call 0x142bca3d0
0x28f9540: jmp 0x1428f95c8
0x28f9545: mov rax, qword ptr [rsp + 0x60]
0x28f954a: mov ecx, dword ptr [rax + 0x60]
0x28f954d: mov dword ptr [rsp + 0x48], ecx
0x28f9551: mov rax, qword ptr [rbp - 0x48]
0x28f9555: mov ecx, dword ptr [rax + 0x180]
0x28f955b: mov dword ptr [rsp + 0x40], ecx
0x28f955f: lea rbx, [rip + 0x322be92]
0x28f9566: mov qword ptr [rbp + 0x18], rbx
0x28f956a: mov byte ptr [rbp + 0x20], 0
0x28f956e: lea rax, [rip + 0x322bec3]
0x28f9575: mov qword ptr [rbp + 0x18], rax
0x28f9579: mov qword ptr [rbp + 0x28], r14
0x28f957d: mov rax, qword ptr [r12]
0x28f9581: mov rcx, r12
0x28f9584: call qword ptr [rax + 0xe8]
0x28f958a: mov qword ptr [rbp + 0x28], rax
0x28f958e: lea rax, [rbp + 0x70]
0x28f9592: mov qword ptr [rsp + 0x30], rax
0x28f9597: lea rax, [rsp + 0x48]
0x28f959c: mov qword ptr [rsp + 0x28], rax
0x28f95a1: mov rax, qword ptr [rbp + 0x300]
0x28f95a8: mov qword ptr [rsp + 0x20], rax
0x28f95ad: lea r9, [rsp + 0x40]
0x28f95b2: lea r8, [rsp + 0x50]
0x28f95b7: lea rdx, [rbp + 0x18]
0x28f95bb: mov rcx, r12
0x28f95be: call 0x142988ef0
0x28f95c3: nop 
0x28f95c4: mov qword ptr [rbp + 0x18], rbx
0x28f95c8: mov dword ptr [r13], r14d
0x28f95cc: mov qword ptr [rbp + 0xa0], r15
0x28f95d3: lea rcx, [rbp + 0xa0]
0x28f95da: call 0x141434880
0x28f95df: nop 
0x28f95e0: mov qword ptr [rsp + 0x58], r15
0x28f95e5: mov edi, 1
0x28f95ea: cmp byte ptr [rsp + 0x68], 0
0x28f95ef: je 0x1428f9668
0x28f95f1: cmp byte ptr [rsp + 0x69], 0
0x28f95f6: jne 0x1428f9608
0x28f95f8: mov rcx, qword ptr [rsp + 0x60]
0x28f95fd: mov rax, qword ptr [rcx]
0x28f9600: call qword ptr [rax + 8]
0x28f9603: movzx esi, al
0x28f9606: jmp 0x1428f9649
0x28f9608: mov rsi, qword ptr [rsp + 0x60]
0x28f960d: lea rbx, [rsi + 0x18]
0x28f9611: mov qword ptr [rsp + 0x78], rbx
0x28f9616: mov rax, qword ptr [rbx]
0x28f9619: mov rcx, rbx
0x28f961c: call qword ptr [rax + 8]
0x28f961f: nop 
0x28f9620: dec word ptr [rsi + 0x48]
0x28f9624: cmp byte ptr [rsi + 0x4a], 0
0x28f9628: jne 0x1428f963d
0x28f962a: mov eax, r14d
0x28f962d: lock xadd dword ptr [rsi + 0x10], eax
0x28f9632: add ax, word ptr [rsi + 0x48]
0x28f9636: jne 0x1428f963d
0x28f9638: mov sil, 1
0x28f963b: jmp 0x1428f9640
0x28f963d: xor sil, sil
0x28f9640: mov rax, qword ptr [rbx]
0x28f9643: mov rcx, rbx
0x28f9646: call qword ptr [rax + 0x10]
0x28f9649: test sil, sil
0x28f964c: je 0x1428f9663
0x28f964e: mov rcx, qword ptr [rsp + 0x60]
0x28f9653: xor eax, eax
0x28f9655: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f965b: jne 0x1428f9663
0x28f965d: mov rax, qword ptr [rcx]
0x28f9660: call qword ptr [rax + 0x10]
0x28f9663: mov byte ptr [rsp + 0x68], 0
0x28f9668: mov qword ptr [rbp - 0x80], r15
0x28f966c: cmp byte ptr [rbp - 0x70], 0
0x28f9670: je 0x1428f96e3
0x28f9672: cmp byte ptr [rbp - 0x6f], 0
0x28f9676: jne 0x1428f9687
0x28f9678: mov rcx, qword ptr [rbp - 0x78]
0x28f967c: mov rax, qword ptr [rcx]
0x28f967f: call qword ptr [rax + 8]
0x28f9682: movzx esi, al
0x28f9685: jmp 0x1428f96c6
0x28f9687: mov rsi, qword ptr [rbp - 0x78]
0x28f968b: lea rbx, [rsi + 0x18]
0x28f968f: mov qword ptr [rsp + 0x78], rbx
0x28f9694: mov rax, qword ptr [rbx]
0x28f9697: mov rcx, rbx
0x28f969a: call qword ptr [rax + 8]
0x28f969d: nop 
0x28f969e: dec word ptr [rsi + 0x48]
0x28f96a2: cmp byte ptr [rsi + 0x4a], 0
0x28f96a6: jne 0x1428f96ba
0x28f96a8: lock xadd dword ptr [rsi + 0x10], r14d
0x28f96ae: add r14w, word ptr [rsi + 0x48]
0x28f96b3: jne 0x1428f96ba
0x28f96b5: mov sil, 1
0x28f96b8: jmp 0x1428f96bd
0x28f96ba: xor sil, sil
0x28f96bd: mov rax, qword ptr [rbx]
0x28f96c0: mov rcx, rbx
0x28f96c3: call qword ptr [rax + 0x10]
0x28f96c6: test sil, sil
0x28f96c9: je 0x1428f96df
0x28f96cb: mov rcx, qword ptr [rbp - 0x78]
0x28f96cf: xor eax, eax
0x28f96d1: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f96d7: jne 0x1428f96df
0x28f96d9: mov rax, qword ptr [rcx]
0x28f96dc: call qword ptr [rax + 0x10]
0x28f96df: mov byte ptr [rbp - 0x70], 0
0x28f96e3: lea rax, [rip + 0x3019776]
0x28f96ea: mov qword ptr [rbp - 0x50], rax
0x28f96ee: cmp byte ptr [rbp - 0x40], 0
0x28f96f2: je 0x1428f9702
0x28f96f4: mov rcx, qword ptr [rbp - 0x28]
0x28f96f8: mov rax, qword ptr [rcx]
0x28f96fb: call qword ptr [rax + 0x148]
0x28f9701: nop 
0x28f9702: lea rax, [rip + 0x2c7a137]
0x28f9709: mov qword ptr [rbp - 0x50], rax
0x28f970d: jmp 0x1428f9857
0x28f9712: mov eax, dword ptr [rip + 0x43e22c8]
0x28f9718: mov dword ptr [r13], eax
0x28f971c: mov rcx, qword ptr [rsp + 0x50]
0x28f9721: mov rax, qword ptr [rcx]
0x28f9724: mov dl, 1
0x28f9726: call qword ptr [rax + 0x20]
0x28f9729: nop 
0x28f972a: mov qword ptr [rsp + 0x58], r15
0x28f972f: mov edi, 1
0x28f9734: cmp byte ptr [rsp + 0x68], 0
0x28f9739: je 0x1428f97b2
0x28f973b: cmp byte ptr [rsp + 0x69], 0
0x28f9740: jne 0x1428f9752
0x28f9742: mov rcx, qword ptr [rsp + 0x60]
0x28f9747: mov rax, qword ptr [rcx]
0x28f974a: call qword ptr [rax + 8]
0x28f974d: movzx esi, al
0x28f9750: jmp 0x1428f9793
0x28f9752: mov rsi, qword ptr [rsp + 0x60]
0x28f9757: lea rbx, [rsi + 0x18]
0x28f975b: mov qword ptr [rsp + 0x78], rbx
0x28f9760: mov rax, qword ptr [rbx]
0x28f9763: mov rcx, rbx
0x28f9766: call qword ptr [rax + 8]
0x28f9769: nop 
0x28f976a: dec word ptr [rsi + 0x48]
0x28f976e: cmp byte ptr [rsi + 0x4a], 0
0x28f9772: jne 0x1428f9787
0x28f9774: mov eax, r14d
0x28f9777: lock xadd dword ptr [rsi + 0x10], eax
0x28f977c: add ax, word ptr [rsi + 0x48]
0x28f9780: jne 0x1428f9787
0x28f9782: mov sil, 1
0x28f9785: jmp 0x1428f978a
0x28f9787: xor sil, sil
0x28f978a: mov rax, qword ptr [rbx]
0x28f978d: mov rcx, rbx
0x28f9790: call qword ptr [rax + 0x10]
0x28f9793: test sil, sil
0x28f9796: je 0x1428f97ad
0x28f9798: mov rcx, qword ptr [rsp + 0x60]
0x28f979d: xor eax, eax
0x28f979f: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f97a5: jne 0x1428f97ad
0x28f97a7: mov rax, qword ptr [rcx]
0x28f97aa: call qword ptr [rax + 0x10]
0x28f97ad: mov byte ptr [rsp + 0x68], 0
0x28f97b2: mov qword ptr [rbp - 0x80], r15
0x28f97b6: cmp byte ptr [rbp - 0x70], 0
0x28f97ba: je 0x1428f982d
0x28f97bc: cmp byte ptr [rbp - 0x6f], 0
0x28f97c0: jne 0x1428f97d1
0x28f97c2: mov rcx, qword ptr [rbp - 0x78]
0x28f97c6: mov rax, qword ptr [rcx]
0x28f97c9: call qword ptr [rax + 8]
0x28f97cc: movzx esi, al
0x28f97cf: jmp 0x1428f9810
0x28f97d1: mov rsi, qword ptr [rbp - 0x78]
0x28f97d5: lea rbx, [rsi + 0x18]
0x28f97d9: mov qword ptr [rsp + 0x78], rbx
0x28f97de: mov rax, qword ptr [rbx]
0x28f97e1: mov rcx, rbx
0x28f97e4: call qword ptr [rax + 8]
0x28f97e7: nop 
0x28f97e8: dec word ptr [rsi + 0x48]
0x28f97ec: cmp byte ptr [rsi + 0x4a], 0
0x28f97f0: jne 0x1428f9804
0x28f97f2: lock xadd dword ptr [rsi + 0x10], r14d
0x28f97f8: add r14w, word ptr [rsi + 0x48]
0x28f97fd: jne 0x1428f9804
0x28f97ff: mov sil, 1
0x28f9802: jmp 0x1428f9807
0x28f9804: xor sil, sil
0x28f9807: mov rax, qword ptr [rbx]
0x28f980a: mov rcx, rbx
0x28f980d: call qword ptr [rax + 0x10]
0x28f9810: test sil, sil
0x28f9813: je 0x1428f9829
0x28f9815: mov rcx, qword ptr [rbp - 0x78]
0x28f9819: xor eax, eax
0x28f981b: lock cmpxchg byte ptr [rcx + 0x4b], dil
0x28f9821: jne 0x1428f9829
0x28f9823: mov rax, qword ptr [rcx]
0x28f9826: call qword ptr [rax + 0x10]
0x28f9829: mov byte ptr [rbp - 0x70], 0
0x28f982d: lea rax, [rip + 0x301962c]
0x28f9834: mov qword ptr [rbp - 0x50], rax
0x28f9838: cmp byte ptr [rbp - 0x40], 0
0x28f983c: je 0x1428f984c
0x28f983e: mov rcx, qword ptr [rbp - 0x28]
0x28f9842: mov rax, qword ptr [rcx]
0x28f9845: call qword ptr [rax + 0x148]
0x28f984b: nop 
0x28f984c: lea rax, [rip + 0x2c79fed]
0x28f9853: mov qword ptr [rbp - 0x50], rax
0x28f9857: mov qword ptr [rbp - 0x50], r15
0x28f985b: lea rcx, [rbp - 0x50]
0x28f985f: call 0x141434880
0x28f9864: mov rax, r13
0x28f9867: lea r11, [rsp + 0x3b0]
0x28f986f: mov rbx, qword ptr [r11 + 0x40]
0x28f9873: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0x28f9879: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0x28f987f: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0x28f9885: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0x28f988b: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0x28f9891: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0x28f9897: mov rsp, r11
0x28f989a: pop r15
0x28f989c: pop r14
0x28f989e: pop r13
0x28f98a0: pop r12
0x28f98a2: pop rdi
0x28f98a3: pop rsi
0x28f98a4: pop rbp
0x28f98a5: ret 