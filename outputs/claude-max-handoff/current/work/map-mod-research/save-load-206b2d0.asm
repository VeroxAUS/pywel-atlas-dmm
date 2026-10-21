0x206b2d0: mov qword ptr [rsp + 0x18], rbx
0x206b2d5: mov byte ptr [rsp + 0x20], r9b
0x206b2da: mov qword ptr [rsp + 0x10], rdx
0x206b2df: push rbp
0x206b2e0: push rsi
0x206b2e1: push rdi
0x206b2e2: push r12
0x206b2e4: push r13
0x206b2e6: push r14
0x206b2e8: push r15
0x206b2ea: mov rbp, rsp
0x206b2ed: sub rsp, 0x80
0x206b2f4: movzx esi, r9b
0x206b2f8: mov r15, r8
0x206b2fb: mov r13, rdx
0x206b2fe: mov r12, rcx
0x206b301: mov rax, qword ptr [rcx + 0x68]
0x206b305: mov rdi, qword ptr [rax + 0x18]
0x206b309: mov qword ptr [rbp - 0x48], rdi
0x206b30d: lea rbx, [rcx + 0x18]
0x206b311: mov qword ptr [rbp + 0x60], rbx
0x206b315: mov rax, qword ptr [rbx]
0x206b318: mov rcx, rbx
0x206b31b: call qword ptr [rax + 8]
0x206b31e: nop 
0x206b31f: lea rax, [r12 + 8]
0x206b324: xor ecx, ecx
0x206b326: test r12, r12
0x206b329: cmove rax, rcx
0x206b32d: mov qword ptr [rbp - 0x50], rax
0x206b331: mov r8b, 1
0x206b334: mov rdx, qword ptr [rax]
0x206b337: lea rcx, [rbp - 0x40]
0x206b33b: call 0x140393650
0x206b340: nop 
0x206b341: mov rax, qword ptr [rdi + 8]
0x206b345: test byte ptr [rax + 0x5e], 4
0x206b349: je 0x14206b394
0x206b34b: cmp byte ptr [rax + 0x4a], 0
0x206b34f: je 0x14206b359
0x206b351: inc word ptr [rax + 0x48]
0x206b355: mov al, 1
0x206b357: jmp 0x14206b35b
0x206b359: xor al, al
0x206b35b: test al, al
0x206b35d: je 0x14206b394
0x206b35f: mov rax, qword ptr [rdi]
0x206b362: movzx r9d, sil
0x206b366: mov r8, r15
0x206b369: lea rdx, [rbp + 0x40]
0x206b36d: mov rcx, rdi
0x206b370: call qword ptr [rax + 0x140]
0x206b376: cmp dword ptr [rbp + 0x40], 0
0x206b37a: je 0x14206b3f3
0x206b37c: mov rax, qword ptr [rdi + 8]
0x206b380: dec word ptr [rax + 0x48]
0x206b384: cmp byte ptr [rax + 0x4a], 0
0x206b388: jne 0x14206b38f
0x206b38a: lock add dword ptr [rax + 0x10], 0
0x206b38f: mov eax, dword ptr [rbp + 0x40]
0x206b392: jmp 0x14206b39a
0x206b394: mov eax, dword ptr [rip + 0x4c70652]
0x206b39a: test eax, eax
0x206b39c: je 0x14206b3f3
0x206b39e: mov dword ptr [r13], eax
0x206b3a2: mov rdi, qword ptr [rbp - 0x40]
0x206b3a6: mov rax, qword ptr [rdi]
0x206b3a9: xor edx, edx
0x206b3ab: mov rcx, rdi
0x206b3ae: call qword ptr [rax + 0x20]
0x206b3b1: cmp byte ptr [rbp - 0x38], 1
0x206b3b5: jne 0x14206b3e5
0x206b3b7: mov esi, 0xffffffff
0x206b3bc: lock xadd dword ptr [rdi + 8], esi
0x206b3c1: cmp esi, 1
0x206b3c4: jne 0x14206b3d8
0x206b3c6: test dword ptr [rdi + 0xc], 0x40000000
0x206b3cd: je 0x14206b3e5
0x206b3cf: mov rax, qword ptr [rdi]
0x206b3d2: mov rcx, rdi
0x206b3d5: call qword ptr [rax + 0x40]
0x206b3d8: test dword ptr [rdi + 0xc], 0x40000000
0x206b3df: je 0x14206b3e5
0x206b3e1: lock dec dword ptr [rdi + 0xc]
0x206b3e5: mov rax, qword ptr [rbx]
0x206b3e8: mov rcx, rbx
0x206b3eb: call qword ptr [rax + 0x10]
0x206b3ee: jmp 0x14206b729
0x206b3f3: mov rax, qword ptr [r15 + 0x88]
0x206b3fa: cmp byte ptr [rax + 1], 1
0x206b3fe: jne 0x14206b413
0x206b400: cmp qword ptr [r12 + 0xd0], 0
0x206b409: jne 0x14206b413
0x206b40b: mov qword ptr [r12 + 0xd0], r15
0x206b413: mov rdi, qword ptr [r12 + 0xd0]
0x206b41b: mov r14, qword ptr [rbp - 0x40]
0x206b41f: mov rax, qword ptr [r14]
0x206b422: xor edx, edx
0x206b424: mov rcx, r14
0x206b427: call qword ptr [rax + 0x20]
0x206b42a: mov esi, 0xffffffff
0x206b42f: cmp byte ptr [rbp - 0x38], 1
0x206b433: jne 0x14206b464
0x206b435: mov eax, esi
0x206b437: lock xadd dword ptr [r14 + 8], eax
0x206b43d: cmp eax, 1
0x206b440: jne 0x14206b455
0x206b442: test dword ptr [r14 + 0xc], 0x40000000
0x206b44a: je 0x14206b464
0x206b44c: mov rax, qword ptr [r14]
0x206b44f: mov rcx, r14
0x206b452: call qword ptr [rax + 0x40]
0x206b455: test dword ptr [r14 + 0xc], 0x40000000
0x206b45d: je 0x14206b464
0x206b45f: lock dec dword ptr [r14 + 0xc]
0x206b464: mov rax, qword ptr [rbx]
0x206b467: mov rcx, rbx
0x206b46a: call qword ptr [rax + 0x10]
0x206b46d: mov rax, qword ptr [r15 + 0x88]
0x206b474: cmp byte ptr [rax + 1], 1
0x206b478: jne 0x14206b490
0x206b47a: cmp qword ptr [r12 + 0xd8], 0
0x206b483: jne 0x14206b490
0x206b485: mov rdx, r15
0x206b488: mov rcx, r12
0x206b48b: call 0x14206aec0
0x206b490: cmp r15, rdi
0x206b493: je 0x14206b6f5
0x206b499: test rdi, rdi
0x206b49c: je 0x14206b4bd
0x206b49e: mov edx, 4
0x206b4a3: mov r8d, 0x10
0x206b4a9: mov rax, qword ptr [rdi]
0x206b4ac: mov rcx, rdi
0x206b4af: call qword ptr [rax + 0xc0]
0x206b4b5: test al, al
0x206b4b7: je 0x14206b4bd
0x206b4b9: mov al, 1
0x206b4bb: jmp 0x14206b4bf
0x206b4bd: xor al, al
0x206b4bf: mov byte ptr [rbp + 0x40], al
0x206b4c2: lea rcx, [rip + 0x36ba97f]
0x206b4c9: mov qword ptr [rbp - 0x20], rcx
0x206b4cd: mov qword ptr [rbp - 0x18], rdi
0x206b4d1: mov byte ptr [rbp - 0x10], al
0x206b4d4: mov byte ptr [rbp - 0xf], 0
0x206b4d8: xor r14d, r14d
0x206b4db: mov qword ptr [rbp - 8], r14
0x206b4df: lea rcx, [rip + 0x35085a2]
0x206b4e6: mov qword ptr [rbp - 0x20], rcx
0x206b4ea: lea rcx, [rip + 0x3508577]
0x206b4f1: mov qword ptr [rbp - 0x20], rcx
0x206b4f5: test al, al
0x206b4f7: je 0x14206b6bc
0x206b4fd: mov rax, qword ptr [rdi + 0x68]
0x206b501: mov r14, qword ptr [rax + 0x18]
0x206b505: lea rcx, [rdi + 0x18]
0x206b509: mov qword ptr [rbp - 0x40], rcx
0x206b50d: mov rax, qword ptr [rcx]
0x206b510: call qword ptr [rax + 8]
0x206b513: nop 
0x206b514: lea rdx, [rdi + 8]
0x206b518: test rdi, rdi
0x206b51b: mov r13d, 0
0x206b521: cmove rdx, r13
0x206b525: mov r8b, 1
0x206b528: mov rdx, qword ptr [rdx]
0x206b52b: lea rcx, [rbp - 0x30]
0x206b52f: call 0x140393650
0x206b534: nop 
0x206b535: mov rax, qword ptr [r14 + 8]
0x206b539: test byte ptr [rax + 0x5e], 0x10
0x206b53d: je 0x14206b585
0x206b53f: cmp byte ptr [rax + 0x4a], r13b
0x206b543: je 0x14206b54d
0x206b545: inc word ptr [rax + 0x48]
0x206b549: mov al, 1
0x206b54b: jmp 0x14206b54f
0x206b54d: xor al, al
0x206b54f: test al, al
0x206b551: je 0x14206b585
0x206b553: mov rax, qword ptr [r14]
0x206b556: mov r8, r15
0x206b559: lea rdx, [rbp + 0x60]
0x206b55d: mov rcx, r14
0x206b560: call qword ptr [rax + 0x148]
0x206b566: cmp dword ptr [rbp + 0x60], 0
0x206b56a: je 0x14206b58c
0x206b56c: mov rax, qword ptr [r14 + 8]
0x206b570: dec word ptr [rax + 0x48]
0x206b574: cmp byte ptr [rax + 0x4a], 0
0x206b578: jne 0x14206b57f
0x206b57a: lock add dword ptr [rax + 0x10], 0
0x206b57f: mov r13d, dword ptr [rbp + 0x60]
0x206b583: jmp 0x14206b58c
0x206b585: mov r13d, dword ptr [rip + 0x4c70460]
0x206b58c: mov r14, qword ptr [rbp - 0x30]
0x206b590: mov rax, qword ptr [r14]
0x206b593: xor edx, edx
0x206b595: mov rcx, r14
0x206b598: call qword ptr [rax + 0x20]
0x206b59b: cmp byte ptr [rbp - 0x28], 1
0x206b59f: jne 0x14206b5d0
0x206b5a1: mov eax, esi
0x206b5a3: lock xadd dword ptr [r14 + 8], eax
0x206b5a9: cmp eax, 1
0x206b5ac: jne 0x14206b5c1
0x206b5ae: test dword ptr [r14 + 0xc], 0x40000000
0x206b5b6: je 0x14206b5d0
0x206b5b8: mov rax, qword ptr [r14]
0x206b5bb: mov rcx, r14
0x206b5be: call qword ptr [rax + 0x40]
0x206b5c1: test dword ptr [r14 + 0xc], 0x40000000
0x206b5c9: je 0x14206b5d0
0x206b5cb: lock dec dword ptr [r14 + 0xc]
0x206b5d0: lea rcx, [rdi + 0x18]
0x206b5d4: mov rax, qword ptr [rcx]
0x206b5d7: call qword ptr [rax + 0x10]
0x206b5da: test r13d, r13d
0x206b5dd: je 0x14206b6b1
0x206b5e3: mov qword ptr [rbp + 0x60], rbx
0x206b5e7: mov rax, qword ptr [rbx]
0x206b5ea: mov rcx, rbx
0x206b5ed: call qword ptr [rax + 8]
0x206b5f0: nop 
0x206b5f1: mov r8b, 1
0x206b5f4: mov rdx, qword ptr [rbp - 0x50]
0x206b5f8: mov rdx, qword ptr [rdx]
0x206b5fb: lea rcx, [rbp - 0x30]
0x206b5ff: call 0x140393650
0x206b604: nop 
0x206b605: mov rdx, r15
0x206b608: mov r14, qword ptr [rbp - 0x48]
0x206b60c: mov rcx, r14
0x206b60f: call 0x14211a300
0x206b614: mov rax, qword ptr [r14 + 8]
0x206b618: dec word ptr [rax + 0x48]
0x206b61c: cmp byte ptr [rax + 0x4a], 0
0x206b620: jne 0x14206b627
0x206b622: lock add dword ptr [rax + 0x10], 0
0x206b627: mov r14, qword ptr [rbp - 0x30]
0x206b62b: mov rax, qword ptr [r14]
0x206b62e: xor edx, edx
0x206b630: mov rcx, r14
0x206b633: call qword ptr [rax + 0x20]
0x206b636: cmp byte ptr [rbp - 0x28], 1
0x206b63a: jne 0x14206b669
0x206b63c: lock xadd dword ptr [r14 + 8], esi
0x206b642: cmp esi, 1
0x206b645: jne 0x14206b65a
0x206b647: test dword ptr [r14 + 0xc], 0x40000000
0x206b64f: je 0x14206b669
0x206b651: mov rax, qword ptr [r14]
0x206b654: mov rcx, r14
0x206b657: call qword ptr [rax + 0x40]
0x206b65a: test dword ptr [r14 + 0xc], 0x40000000
0x206b662: je 0x14206b669
0x206b664: lock dec dword ptr [r14 + 0xc]
0x206b669: mov rax, qword ptr [rbx]
0x206b66c: mov rcx, rbx
0x206b66f: call qword ptr [rax + 0x10]
0x206b672: mov rbx, qword ptr [rbp + 0x48]
0x206b676: mov dword ptr [rbx], r13d
0x206b679: lea rcx, [rip + 0x36ba7c8]
0x206b680: mov qword ptr [rbp - 0x20], rcx
0x206b684: mov rax, qword ptr [rdi]
0x206b687: mov rcx, rdi
0x206b68a: call qword ptr [rax + 8]
0x206b68d: test al, al
0x206b68f: je 0x14206b6a8
0x206b691: mov ecx, 1
0x206b696: xor eax, eax
0x206b698: lock cmpxchg byte ptr [rdi + 0x4b], cl
0x206b69d: jne 0x14206b6a8
0x206b69f: mov rax, qword ptr [rdi]
0x206b6a2: mov rcx, rdi
0x206b6a5: call qword ptr [rax + 0x10]
0x206b6a8: mov byte ptr [rbp - 0x10], 0
0x206b6ac: mov rax, rbx
0x206b6af: jmp 0x14206b72c
0x206b6b1: movzx eax, byte ptr [rbp + 0x40]
0x206b6b5: mov r13, qword ptr [rbp + 0x48]
0x206b6b9: xor r14d, r14d
0x206b6bc: lea rcx, [rip + 0x36ba785]
0x206b6c3: mov qword ptr [rbp - 0x20], rcx
0x206b6c7: test al, al
0x206b6c9: je 0x14206b6f8
0x206b6cb: mov rax, qword ptr [rdi]
0x206b6ce: mov rcx, rdi
0x206b6d1: call qword ptr [rax + 8]
0x206b6d4: test al, al
0x206b6d6: je 0x14206b6ef
0x206b6d8: mov ecx, 1
0x206b6dd: xor eax, eax
0x206b6df: lock cmpxchg byte ptr [rdi + 0x4b], cl
0x206b6e4: jne 0x14206b6ef
0x206b6e6: mov rax, qword ptr [rdi]
0x206b6e9: mov rcx, rdi
0x206b6ec: call qword ptr [rax + 0x10]
0x206b6ef: mov byte ptr [rbp - 0x10], 0
0x206b6f3: jmp 0x14206b6f8
0x206b6f5: xor r14d, r14d
0x206b6f8: mov rax, qword ptr [r15]
0x206b6fb: mov rbx, qword ptr [rax + 0x158]
0x206b702: mov rax, qword ptr [r12]
0x206b706: mov rcx, r12
0x206b709: call qword ptr [rax + 0xe8]
0x206b70f: mov qword ptr [rsp + 0x20], rax
0x206b714: movzx r9d, byte ptr [rbp + 0x58]
0x206b719: mov r8, r12
0x206b71c: lea rdx, [rbp + 0x40]
0x206b720: mov rcx, r15
0x206b723: call rbx
0x206b725: mov dword ptr [r13], r14d
0x206b729: mov rax, r13
0x206b72c: mov rbx, qword ptr [rsp + 0xd0]
0x206b734: add rsp, 0x80
0x206b73b: pop r15
0x206b73d: pop r14
0x206b73f: pop r13
0x206b741: pop r12
0x206b743: pop rdi
0x206b744: pop rsi
0x206b745: pop rbp
0x206b746: ret 