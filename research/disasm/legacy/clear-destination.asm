0xdc35c0: mov r11, rsp
0xdc35c3: mov qword ptr [r11 + 8], rbx
0xdc35c7: push rdi
0xdc35c8: sub rsp, 0x140
0xdc35cf: mov rdi, rcx
0xdc35d2: xor eax, eax
0xdc35d4: mov qword ptr [r11 - 0x20], rax
0xdc35d8: mov qword ptr [r11 - 0x18], 0x105
0xdc35e0: mov dword ptr [r11 - 0x14], eax
0xdc35e4: mov byte ptr [rsp + 0x20], al
0xdc35e8: mov dword ptr [r11 - 0x14], eax
0xdc35ec: mov byte ptr [rsp + 0x20], al
0xdc35f0: mov rax, qword ptr [r11 - 0x20]
0xdc35f4: test rax, rax
0xdc35f7: je 0x140dc35fc
0xdc35f9: mov byte ptr [rax], 0
0xdc35fc: test dl, dl
0xdc35fe: lea rcx, [rip + 0x5f0eef5]
0xdc3605: jne 0x140dc360e
0xdc3607: lea rcx, [rip + 0x5f0eeee]
0xdc360e: call 0x140389080
0xdc3613: mov rcx, qword ptr [rax + 0x18]
0xdc3617: mov rax, qword ptr [rcx]
0xdc361a: xor edx, edx
0xdc361c: call qword ptr [rax + 8]
0xdc361f: mov r8, rax
0xdc3622: mov rax, qword ptr [rsp + 0x128]
0xdc362a: lea rcx, [rsp + 0x20]
0xdc362f: test rax, rax
0xdc3632: cmovne rcx, rax
0xdc3636: mov dword ptr [rsp + 0x134], 0xffffffff
0xdc3641: mov edx, dword ptr [rsp + 0x130]
0xdc3648: call 0x141424a80
0xdc364d: mov rbx, qword ptr [rdi + 0x698]
0xdc3654: mov eax, dword ptr [rdi + 0x6a0]
0xdc365a: lea rdi, [rbx + rax*8]
0xdc365e: cmp rbx, rdi
0xdc3661: je 0x140dc3698
0xdc3663: nop dword ptr [rax]
0xdc3667: nop word ptr [rax + rax]
0xdc3670: lea rdx, [rsp + 0x20]
0xdc3675: mov rax, qword ptr [rsp + 0x128]
0xdc367d: test rax, rax
0xdc3680: cmovne rdx, rax
0xdc3684: mov r8b, 1
0xdc3687: mov rcx, qword ptr [rbx]
0xdc368a: call 0x143ed4e00
0xdc368f: add rbx, 8
0xdc3693: cmp rbx, rdi
0xdc3696: jne 0x140dc3670
0xdc3698: lea rcx, [rsp + 0x20]
0xdc369d: call 0x140394170
0xdc36a2: mov rbx, qword ptr [rsp + 0x150]
0xdc36aa: add rsp, 0x140
0xdc36b1: pop rdi
0xdc36b2: ret 
0xdc36b3: int3 
0xdc36b4: int3 
0xdc36b5: int3 
0xdc36b6: int3 
0xdc36b7: int3 
0xdc36b8: int3 
0xdc36b9: int3 
0xdc36ba: int3 
0xdc36bb: int3 
0xdc36bc: int3 
0xdc36bd: int3 
0xdc36be: int3 
0xdc36bf: int3 
0xdc36c0: mov qword ptr [rsp + 8], rbx
0xdc36c5: mov qword ptr [rsp + 0x18], rbp
0xdc36ca: push rsi
0xdc36cb: push rdi
0xdc36cc: push r14
0xdc36ce: sub rsp, 0x80
0xdc36d5: vmovaps xmmword ptr [rsp + 0x70], xmm6
0xdc36db: vmovaps xmmword ptr [rsp + 0x60], xmm7
0xdc36e1: mov rbx, rcx
0xdc36e4: xor r14d, r14d
0xdc36e7: lea rdx, [rsp + 0x38]
0xdc36ec: call 0x14064f530
0xdc36f1: nop 
0xdc36f2: cmp byte ptr [rsp + 0x48], r14b
0xdc36f7: je 0x140dc3797
0xdc36fd: mov rax, qword ptr gs:[0x58]
0xdc3706: mov rdx, qword ptr [rax]
0xdc3709: mov ecx, 0x1ec
0xdc370e: mov rax, qword ptr [rip + 0x5fa5e13]
0xdc3715: cmp byte ptr [rcx + rdx], r14b
0xdc3719: cmovne rax, qword ptr [rip + 0x5fa5e0f]
0xdc3721: mov rax, qword ptr [rax]
0xdc3724: mov rcx, qword ptr [rax + 8]
0xdc3728: mov rcx, qword ptr [rcx + 0x270]
0xdc372f: add rcx, 0x112
0xdc3736: call 0x140537250
0xdc373b: mov r9d, dword ptr [rax]
0xdc373e: cmp dword ptr [rbx + 0x15c], r14d
0xdc3745: je 0x140dc3797
0xdc3747: mov ecx, dword ptr [rbx + 0x158]
0xdc374d: test ecx, ecx
0xdc374f: je 0x140dc3797
0xdc3751: xor edx, edx
0xdc3753: mov eax, r9d
0xdc3756: div ecx
0xdc3758: mov r8d, edx
0xdc375b: shl r8, 8
0xdc375f: add r8, qword ptr [rbx + 0x168]
0xdc3766: mov edx, r14d
0xdc3769: mov r11d, dword ptr [r8]
0xdc376c: test r11d, r11d
0xdc376f: je 0x140dc3797
0xdc3771: mov eax, edx
0xdc3773: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdc3778: jne 0x140dc3790
0xdc377a: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdc377f: mov rax, qword ptr [rbx + 0x170]
0xdc3786: mov r10, qword ptr [rax + rcx*8]
0xdc378a: cmp dword ptr [r10 + 4], r9d
0xdc378e: je 0x140dc37d1
0xdc3790: inc edx
0xdc3792: cmp edx, r11d
0xdc3795: jb 0x140dc3771
0xdc3797: lea rax, [rip + 0x49626aa]
0xdc379e: mov qword ptr [rsp + 0x38], rax
0xdc37a3: lea rcx, [rsp + 0x38]
0xdc37a8: call 0x141434880
0xdc37ad: lea r11, [rsp + 0x80]
0xdc37b5: mov rbx, qword ptr [r11 + 0x20]
0xdc37b9: mov rbp, qword ptr [r11 + 0x30]
0xdc37bd: vmovaps xmm6, xmmword ptr [rsp + 0x70]
0xdc37c3: vmovaps xmm7, xmmword ptr [rsp + 0x60]
0xdc37c9: mov rsp, r11
0xdc37cc: pop r14
0xdc37ce: pop rdi
0xdc37cf: pop rsi
0xdc37d0: ret 
0xdc37d1: lea rdi, [r10 + 8]
0xdc37d5: test rdi, rdi
0xdc37d8: je 0x140dc3797
0xdc37da: mov rbx, qword ptr [rsp + 0x40]
0xdc37df: lea rdx, [rbx + 8]
0xdc37e3: test rbx, rbx
0xdc37e6: cmove rdx, r14
0xdc37ea: mov rdx, qword ptr [rdx]
0xdc37ed: lea rcx, [rsp + 0xa8]
0xdc37f5: call 0x140393df0
0xdc37fa: nop 
0xdc37fb: mov rcx, qword ptr [rbx + 0x68]
0xdc37ff: lea rdx, [rsp + 0x28]
0xdc3804: mov rcx, qword ptr [rcx + 0x1a0]
0xdc380b: call 0x1404f8220
0xdc3810: movsx ecx, word ptr [rax + 0xe]
0xdc3814: vxorps xmm0, xmm0, xmm0
0xdc3818: vcvtsi2ss xmm0, xmm0, ecx
0xdc381c: vmulss xmm0, xmm0, dword ptr [rip + 0x4fafed0]
0xdc3824: vaddss xmm6, xmm0, dword ptr [rax + 8]
0xdc3829: movsx ecx, word ptr [rax + 0xc]
0xdc382d: vxorps xmm1, xmm1, xmm1
0xdc3831: vcvtsi2ss xmm1, xmm1, ecx
0xdc3835: vmulss xmm0, xmm1, dword ptr [rip + 0x4fafeb7]
0xdc383d: vaddss xmm7, xmm0, dword ptr [rax]
0xdc3841: mov rcx, qword ptr [rsp + 0xa8]
0xdc3849: mov rax, qword ptr [rcx]
0xdc384c: mov dl, 1
0xdc384e: call qword ptr [rax + 0x20]
0xdc3851: mov esi, dword ptr [rdi + 4]
0xdc3854: test esi, esi
0xdc3856: jne 0x140dc3869
0xdc3858: mov rdi, r14
0xdc385b: mov r8, r14
0xdc385e: mov esi, 0xffffffff
0xdc3863: mov ebx, esi
0xdc3865: mov ebp, esi
0xdc3867: jmp 0x140dc3876
0xdc3869: mov rax, qword ptr [rdi + 0x18]
0xdc386d: mov r8, qword ptr [rax]
0xdc3870: mov ebx, r14d
0xdc3873: mov ebp, dword ptr [rdi + 0xc]
0xdc3876: test r8, r8