0x2359ff0: mov qword ptr [rsp + 8], rcx
0x2359ff5: push rbp
0x2359ff6: push rbx
0x2359ff7: push rsi
0x2359ff8: push rdi
0x2359ff9: push r12
0x2359ffb: push r13
0x2359ffd: push r14
0x2359fff: push r15
0x235a001: lea rbp, [rsp - 0x1f]
0x235a006: sub rsp, 0xd8
0x235a00d: mov rdx, rcx
0x235a010: mov rax, qword ptr [rcx + 0x10]
0x235a014: mov rcx, qword ptr [rax + 0x38]
0x235a018: mov qword ptr [rbp + 0x77], rcx
0x235a01c: mov eax, dword ptr [rax + 0x40]
0x235a01f: lea rax, [rcx + rax*8]
0x235a023: mov qword ptr [rbp - 0x71], rax
0x235a027: cmp rcx, rax
0x235a02a: je 0x14235a4de
0x235a030: mov esi, 0x1fd
0x235a035: mov rbx, qword ptr [rdx + 0x10]
0x235a039: mov rax, qword ptr [rcx]
0x235a03c: mov rdi, qword ptr [rax]
0x235a03f: mov rcx, qword ptr [rbx]
0x235a042: mov rax, qword ptr [rcx]
0x235a045: mov edx, 0xffffffff
0x235a04a: call qword ptr [rax + 0x18]
0x235a04d: mov qword ptr [rbp - 0x69], rdi
0x235a051: test rdi, rdi
0x235a054: jne 0x14235a05a
0x235a056: xor eax, eax
0x235a058: jmp 0x14235a06a
0x235a05a: mov rax, 0xffffffffffffffff
0x235a061: inc rax
0x235a064: cmp byte ptr [rdi + rax], 0
0x235a068: jne 0x14235a061
0x235a06a: mov dword ptr [rbp - 0x61], eax
0x235a06d: vmovups xmm0, xmmword ptr [rbp - 0x69]
0x235a072: vmovdqa xmmword ptr [rbp - 0x29], xmm0
0x235a077: cmp dword ptr [rbx + 0x1c], 0
0x235a07b: je 0x14235a0b2
0x235a07d: lea rcx, [rbp - 0x29]
0x235a081: mov qword ptr [rbp + 0x7f], rcx
0x235a085: mov edx, eax
0x235a087: mov rcx, rdi
0x235a08a: call 0x141364780
0x235a08f: lea r9, [rbp + 0x6f]
0x235a093: lea r8, [rbp + 0x7f]
0x235a097: mov edx, eax
0x235a099: lea rcx, [rbx + 0x18]
0x235a09d: call 0x140612620
0x235a0a2: test rax, rax
0x235a0a5: je 0x14235a0b2
0x235a0a7: add rax, 0x10
0x235a0ab: je 0x14235a0b2
0x235a0ad: mov r13, qword ptr [rax]
0x235a0b0: jmp 0x14235a0b5
0x235a0b2: xor r13d, r13d
0x235a0b5: xor r12d, r12d
0x235a0b8: mov qword ptr [rsp + 0x20], r12
0x235a0bd: xor r15d, r15d
0x235a0c0: mov qword ptr [rsp + 0x28], r15
0x235a0c5: xor r14d, r14d
0x235a0c8: xor edi, edi
0x235a0ca: cmp dword ptr [r13 + 0x690], edi
0x235a0d1: jbe 0x14235a3e8
0x235a0d7: nop word ptr [rax + rax]
0x235a0e0: mov rax, qword ptr [r13 + 0x688]
0x235a0e7: mov rbx, qword ptr [rax + rdi*8]
0x235a0eb: mov qword ptr [rbp - 0x59], rbx
0x235a0ef: test rbx, rbx
0x235a0f2: jne 0x14235a0f8
0x235a0f4: xor eax, eax
0x235a0f6: jmp 0x14235a109
0x235a0f8: mov rax, 0xffffffffffffffff
0x235a0ff: nop 
0x235a100: inc rax
0x235a103: cmp byte ptr [rbx + rax], 0
0x235a107: jne 0x14235a100
0x235a109: mov dword ptr [rbp - 0x51], eax
0x235a10c: vmovups xmm0, xmmword ptr [rbp - 0x59]
0x235a111: vmovdqa xmmword ptr [rbp - 0x19], xmm0
0x235a116: cmp dword ptr [r13 + 0xc], 0
0x235a11b: je 0x14235a152
0x235a11d: lea rcx, [rbp - 0x19]
0x235a121: mov qword ptr [rbp + 0x7f], rcx
0x235a125: mov edx, eax
0x235a127: mov rcx, rbx
0x235a12a: call 0x141364780
0x235a12f: lea r9, [rbp + 0x6f]
0x235a133: lea r8, [rbp + 0x7f]
0x235a137: mov edx, eax
0x235a139: lea rcx, [r13 + 8]
0x235a13d: call 0x140612620
0x235a142: test rax, rax
0x235a145: je 0x14235a152
0x235a147: add rax, 0x10
0x235a14b: je 0x14235a152
0x235a14d: mov rax, qword ptr [rax]
0x235a150: jmp 0x14235a154
0x235a152: xor eax, eax
0x235a154: cmp byte ptr [rax + 0x118], 0
0x235a15b: je 0x14235a22b
0x235a161: cmp byte ptr [r13 + 0x69c], 0
0x235a169: jne 0x14235a1df
0x235a16b: mov qword ptr [rbp - 0x49], rbx
0x235a16f: test rbx, rbx
0x235a172: jne 0x14235a178
0x235a174: xor eax, eax
0x235a176: jmp 0x14235a189
0x235a178: mov rax, 0xffffffffffffffff
0x235a17f: nop 
0x235a180: inc rax
0x235a183: cmp byte ptr [rbx + rax], 0
0x235a187: jne 0x14235a180
0x235a189: mov dword ptr [rbp - 0x41], eax
0x235a18c: vmovups xmm0, xmmword ptr [rbp - 0x49]
0x235a191: vmovdqa xmmword ptr [rbp - 9], xmm0
0x235a196: cmp dword ptr [r13 + 0xc], 0
0x235a19b: je 0x14235a1d2
0x235a19d: lea rcx, [rbp - 9]
0x235a1a1: mov qword ptr [rbp + 0x7f], rcx
0x235a1a5: mov edx, eax
0x235a1a7: mov rcx, rbx
0x235a1aa: call 0x141364780
0x235a1af: lea r9, [rbp + 0x6f]
0x235a1b3: lea r8, [rbp + 0x7f]
0x235a1b7: mov edx, eax
0x235a1b9: lea rcx, [r13 + 8]
0x235a1bd: call 0x140612620
0x235a1c2: test rax, rax
0x235a1c5: je 0x14235a1d2
0x235a1c7: add rax, 0x10
0x235a1cb: je 0x14235a1d2
0x235a1cd: mov rdx, qword ptr [rax]
0x235a1d0: jmp 0x14235a1d4
0x235a1d2: xor edx, edx
0x235a1d4: xor r8d, r8d
0x235a1d7: mov rcx, r13
0x235a1da: call 0x14235b620
0x235a1df: cmp r14d, r15d
0x235a1e2: ja 0x14235a21c
0x235a1e4: lea edx, [r14*2 + 1]
0x235a1ec: add edx, r14d
0x235a1ef: shr edx, 1
0x235a1f1: cmp edx, 1
0x235a1f4: mov eax, 1
0x235a1f9: cmovb edx, eax
0x235a1fc: cmp r15d, edx
0x235a1ff: cmova edx, r15d
0x235a203: lea rcx, [rsp + 0x20]
0x235a208: call 0x14035e3f0
0x235a20d: mov r14d, dword ptr [rsp + 0x2c]
0x235a212: mov r15d, dword ptr [rsp + 0x28]
0x235a217: mov r12, qword ptr [rsp + 0x20]
0x235a21c: mov eax, r15d
0x235a21f: mov qword ptr [r12 + rax*8], rbx
0x235a223: inc r15d
0x235a226: mov dword ptr [rsp + 0x28], r15d
0x235a22b: inc edi
0x235a22d: cmp edi, dword ptr [r13 + 0x690]
0x235a234: jb 0x14235a0e0
0x235a23a: test r15d, r15d
0x235a23d: je 0x14235a3e3
0x235a243: mov rdx, r13
0x235a246: mov rcx, qword ptr [rbp + 0x67]
0x235a24a: mov rcx, qword ptr [rcx + 0x10]
0x235a24e: call 0x142355700
0x235a253: test al, al
0x235a255: je 0x14235a49d
0x235a25b: xor ecx, ecx
0x235a25d: mov esi, ecx
0x235a25f: test r15d, r15d
0x235a262: je 0x14235a3a5
0x235a268: nop dword ptr [rax + rax]
0x235a270: mov eax, esi
0x235a272: mov rbx, qword ptr [r12 + rax*8]
0x235a276: mov qword ptr [rbp - 0x39], rbx
0x235a27a: test rbx, rbx
0x235a27d: jne 0x14235a283
0x235a27f: mov eax, ecx
0x235a281: jmp 0x14235a299
0x235a283: mov rax, 0xffffffffffffffff
0x235a28a: nop word ptr [rax + rax]
0x235a290: inc rax
0x235a293: cmp byte ptr [rbx + rax], 0
0x235a297: jne 0x14235a290
0x235a299: mov dword ptr [rbp - 0x31], eax
0x235a29c: vmovups xmm0, xmmword ptr [rbp - 0x39]
0x235a2a1: vmovdqa xmmword ptr [rbp + 7], xmm0
0x235a2a6: cmp dword ptr [r13 + 0xc], 0
0x235a2ab: je 0x14235a2e7
0x235a2ad: lea rcx, [rbp + 7]
0x235a2b1: mov qword ptr [rbp + 0x7f], rcx
0x235a2b5: mov edx, eax
0x235a2b7: mov rcx, rbx
0x235a2ba: call 0x141364780
0x235a2bf: lea r9, [rbp + 0x6f]
0x235a2c3: lea r8, [rbp + 0x7f]
0x235a2c7: mov edx, eax
0x235a2c9: lea rcx, [r13 + 8]
0x235a2cd: call 0x140612620
0x235a2d2: xor ecx, ecx
0x235a2d4: test rax, rax
0x235a2d7: je 0x14235a2e7
0x235a2d9: lea rdi, [rax + 0x10]
0x235a2dd: test rdi, rdi
0x235a2e0: je 0x14235a2e7
0x235a2e2: mov rdi, qword ptr [rdi]
0x235a2e5: jmp 0x14235a2ea
0x235a2e7: mov rdi, rcx
0x235a2ea: mov word ptr [rdi + 0x9c], 2
0x235a2f3: mov byte ptr [rdi + 0x118], 0
0x235a2fa: mov qword ptr [rsp + 0x30], rcx
0x235a2ff: mov qword ptr [rsp + 0x38], 0
0x235a308: mov byte ptr [rbp - 0x79], 0xff
0x235a30c: lea rdx, [rsp + 0x30]
0x235a311: mov rcx, rdi
0x235a314: call 0x14235bf10
0x235a319: test al, al
0x235a31b: je 0x14235a441
0x235a321: lea r9, [rsp + 0x30]
0x235a326: mov r8, rbx
0x235a329: movzx edx, word ptr [rdi + 0xa8]
0x235a330: mov rcx, r13
0x235a333: call 0x14235afe0
0x235a338: nop 
0x235a339: movsx eax, byte ptr [rbp - 0x79]
0x235a33d: cmp al, 0xff
0x235a33f: je 0x14235a354
0x235a341: mov edx, dword ptr [rsp + 0x38]
0x235a345: neg edx
0x235a347: mov ecx, eax
0x235a349: lea rax, [rip + 0x497eed0]
0x235a350: lock add dword ptr [rax + rcx*4], edx
0x235a354: mov ebx, 0x1fd
0x235a359: mov rcx, qword ptr [rsp + 0x30]
0x235a35e: test rcx, rcx
0x235a361: je 0x14235a38f
0x235a363: mov rax, qword ptr gs:[0x58]
0x235a36c: mov rdx, qword ptr [rax]
0x235a36f: cmp byte ptr [rbx + rdx], 0
0x235a373: je 0x14235a383
0x235a375: call 0x1447f03bc
0x235a37a: xor ecx, ecx
0x235a37c: mov qword ptr [rsp + 0x30], rcx
0x235a381: jmp 0x14235a38f
0x235a383: call 0x1447f02bc
0x235a388: xor ecx, ecx
0x235a38a: mov qword ptr [rsp + 0x30], rcx
0x235a38f: mov qword ptr [rsp + 0x38], 0
0x235a398: inc esi
0x235a39a: cmp esi, r15d
0x235a39d: jb 0x14235a270
0x235a3a3: jmp 0x14235a3aa
0x235a3a5: mov ebx, 0x1fd
0x235a3aa: mov rdx, r13
0x235a3ad: mov rax, qword ptr [rbp + 0x67]
0x235a3b1: mov rcx, qword ptr [rax + 0x10]
0x235a3b5: call 0x142355700
0x235a3ba: test al, al
0x235a3bc: je 0x14235a49d
0x235a3c2: test r12, r12
0x235a3c5: je 0x14235a410
0x235a3c7: mov rax, qword ptr gs:[0x58]
0x235a3d0: mov rdx, qword ptr [rax]
0x235a3d3: mov rcx, r12
0x235a3d6: cmp byte ptr [rbx + rdx], 0
0x235a3da: je 0x14235a40b
0x235a3dc: call 0x1447f03bc
0x235a3e1: jmp 0x14235a410
0x235a3e3: mov esi, 0x1fd
0x235a3e8: test r12, r12
0x235a3eb: je 0x14235a410
0x235a3ed: mov edx, esi
0x235a3ef: mov rax, qword ptr gs:[0x58]
0x235a3f8: mov rcx, qword ptr [rax]
0x235a3fb: cmp byte ptr [rdx + rcx], 0
0x235a3ff: mov rcx, r12
0x235a402: je 0x14235a40b
0x235a404: call 0x1447f03bc
0x235a409: jmp 0x14235a410
0x235a40b: call 0x1447f02bc
0x235a410: mov qword ptr [rsp + 0x20], 0
0x235a419: mov qword ptr [rsp + 0x28], 0
0x235a422: mov rcx, qword ptr [rbp + 0x77]
0x235a426: add rcx, 8
0x235a42a: mov qword ptr [rbp + 0x77], rcx
0x235a42e: cmp rcx, qword ptr [rbp - 0x71]
0x235a432: je 0x14235a4de
0x235a438: mov rdx, qword ptr [rbp + 0x67]
0x235a43c: jmp 0x14235a030
0x235a441: movsx eax, byte ptr [rbp - 0x79]
0x235a445: cmp al, 0xff
0x235a447: je 0x14235a45c
0x235a449: mov edx, dword ptr [rsp + 0x38]
0x235a44d: neg edx
0x235a44f: mov ecx, eax
0x235a451: lea rax, [rip + 0x497edc8]
0x235a458: lock add dword ptr [rax + rcx*4], edx
0x235a45c: mov rcx, qword ptr [rsp + 0x30]
0x235a461: test rcx, rcx
0x235a464: je 0x14235a494
0x235a466: mov r8d, 0x1fd
0x235a46c: mov rax, qword ptr gs:[0x58]
0x235a475: mov rdx, qword ptr [rax]
0x235a478: cmp byte ptr [r8 + rdx], 0
0x235a47d: je 0x14235a486
0x235a47f: call 0x1447f03bc
0x235a484: jmp 0x14235a48b
0x235a486: call 0x1447f02bc
0x235a48b: mov qword ptr [rsp + 0x30], 0
0x235a494: mov qword ptr [rsp + 0x38], 0
0x235a49d: test r12, r12
0x235a4a0: je 0x14235a4c8
0x235a4a2: mov edx, 0x1fd
0x235a4a7: mov rax, qword ptr gs:[0x58]
0x235a4b0: mov rcx, qword ptr [rax]
0x235a4b3: cmp byte ptr [rdx + rcx], 0
0x235a4b7: mov rcx, r12
0x235a4ba: je 0x14235a4c3
0x235a4bc: call 0x1447f03bc
0x235a4c1: jmp 0x14235a4c8
0x235a4c3: call 0x1447f02bc
0x235a4c8: mov qword ptr [rsp + 0x20], 0
0x235a4d1: mov qword ptr [rsp + 0x28], 0
0x235a4da: xor al, al
0x235a4dc: jmp 0x14235a4e0
0x235a4de: mov al, 1
0x235a4e0: add rsp, 0xd8
0x235a4e7: pop r15
0x235a4e9: pop r14
0x235a4eb: pop r13
0x235a4ed: pop r12
0x235a4ef: pop rdi
0x235a4f0: pop rsi
0x235a4f1: pop rbx
0x235a4f2: pop rbp
0x235a4f3: ret 