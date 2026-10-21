0x2a1f280: mov qword ptr [rsp + 8], rbx
0x2a1f285: push rbp
0x2a1f286: push rsi
0x2a1f287: push rdi
0x2a1f288: push r12
0x2a1f28a: push r13
0x2a1f28c: push r14
0x2a1f28e: push r15
0x2a1f290: lea rbp, [rsp - 0x27]
0x2a1f295: sub rsp, 0xb0
0x2a1f29c: mov rdi, rdx
0x2a1f29f: mov rsi, rcx
0x2a1f2a2: mov rax, qword ptr gs:[0x58]
0x2a1f2ab: mov r12, qword ptr [rax]
0x2a1f2ae: mov qword ptr [rbp - 0x29], r12
0x2a1f2b2: mov eax, 0x250
0x2a1f2b7: mov rax, qword ptr [rax + r12]
0x2a1f2bb: xor ebx, ebx
0x2a1f2bd: mov dword ptr [rax + 0x2b8], ebx
0x2a1f2c3: lea r15, [rax + 0x2b0]
0x2a1f2ca: mov rax, qword ptr [rdx]
0x2a1f2cd: mov rdx, r15
0x2a1f2d0: mov rcx, rdi
0x2a1f2d3: call qword ptr [rax + 8]
0x2a1f2d6: mov r13d, dword ptr [r15 + 8]
0x2a1f2da: test r13d, r13d
0x2a1f2dd: je 0x142a1f65a
0x2a1f2e3: mov rcx, rdi
0x2a1f2e6: call 0x142961ca0
0x2a1f2eb: mov rdi, rax
0x2a1f2ee: test rax, rax
0x2a1f2f1: je 0x142a1f38f
0x2a1f2f7: mov qword ptr [rbp + 0x7f], rbx
0x2a1f2fb: lea rdx, [rbp + 0x7f]
0x2a1f2ff: mov rcx, rax
0x2a1f302: call 0x142961de0
0x2a1f307: mov rcx, rax
0x2a1f30a: mov r14, qword ptr [rbp + 0x7f]
0x2a1f30e: test r14, r14
0x2a1f311: jne 0x142a1f35c
0x2a1f313: lea rax, [rip + 0x3102316]
0x2a1f31a: mov qword ptr [rsp + 0x58], rax
0x2a1f31f: mov dword ptr [rsp + 0x50], 6
0x2a1f327: mov eax, dword ptr [rip + 0x42ba11b]
0x2a1f32d: mov dword ptr [rsp + 0x48], eax
0x2a1f331: lea r9, [rip + 0x2b54174]
0x2a1f338: mov qword ptr [rsp + 0x40], r9
0x2a1f33d: mov dword ptr [rsp + 0x38], ebx
0x2a1f341: mov qword ptr [rsp + 0x30], r9
0x2a1f346: mov qword ptr [rsp + 0x28], r9
0x2a1f34b: mov qword ptr [rsp + 0x20], r9
0x2a1f350: mov cl, 1
0x2a1f352: call 0x14035d8d0
0x2a1f357: jmp 0x142a1f65a
0x2a1f35c: test rsi, rsi
0x2a1f35f: je 0x142a1f364
0x2a1f361: mov ebx, dword ptr [rsi + 0x60]
0x2a1f364: mov dword ptr [rbp + 0x6f], ebx
0x2a1f367: mov rax, qword ptr [rax]
0x2a1f36a: mov r8d, 4
0x2a1f370: lea rdx, [rbp + 0x6f]
0x2a1f374: call qword ptr [rax + 8]
0x2a1f377: mov word ptr [r14], 0xa9c
0x2a1f37d: mov byte ptr [r14 + 2], 0xff
0x2a1f382: mov rcx, rdi
0x2a1f385: call 0x142961e90
0x2a1f38a: jmp 0x142a1f65a
0x2a1f38f: call 0x142962220
0x2a1f394: mov qword ptr [rbp - 0x21], rbx
0x2a1f398: mov dword ptr [rbp - 0x19], ebx
0x2a1f39b: mov word ptr [rbp - 0x15], bx
0x2a1f39f: mov qword ptr [rbp - 0x11], rbx
0x2a1f3a3: mov edx, 9
0x2a1f3a8: mov r9, qword ptr [rip + 0x434a2d1]
0x2a1f3af: mov r9, qword ptr [r9 + 0x30]
0x2a1f3b3: lea rcx, [rbp - 0x21]
0x2a1f3b7: call 0x142771b30
0x2a1f3bc: mov r14, rax
0x2a1f3bf: mov rdi, qword ptr [rbp - 0x21]
0x2a1f3c3: test rax, rax
0x2a1f3c6: jne 0x142a1f414
0x2a1f3c8: lea rax, [rip + 0x3102261]
0x2a1f3cf: mov qword ptr [rsp + 0x58], rax
0x2a1f3d4: mov dword ptr [rsp + 0x50], 6
0x2a1f3dc: mov eax, dword ptr [rip + 0x42ba066]
0x2a1f3e2: mov dword ptr [rsp + 0x48], eax
0x2a1f3e6: lea r9, [rip + 0x2b540bf]
0x2a1f3ed: mov qword ptr [rsp + 0x40], r9
0x2a1f3f2: mov dword ptr [rsp + 0x38], ebx
0x2a1f3f6: mov qword ptr [rsp + 0x30], r9
0x2a1f3fb: mov qword ptr [rsp + 0x28], r9
0x2a1f400: mov qword ptr [rsp + 0x20], r9
0x2a1f405: mov cl, 1
0x2a1f407: call 0x14035d8d0
0x2a1f40c: mov ecx, dword ptr [rbp - 0x19]
0x2a1f40f: jmp 0x142a1f5c8
0x2a1f414: lea rax, [rip + 0x2d0281d]
0x2a1f41b: mov qword ptr [rbp - 9], rax
0x2a1f41f: mov byte ptr [rbp - 1], 1
0x2a1f423: lea rax, [rip + 0x2d0286e]
0x2a1f42a: mov qword ptr [rbp - 9], rax
0x2a1f42e: lea rax, [r14 + 5]
0x2a1f432: mov qword ptr [rbp + 7], rax
0x2a1f436: mov qword ptr [rbp + 0xf], 0x7fc1
0x2a1f43e: mov byte ptr [rbp + 0x17], 0
0x2a1f442: test rsi, rsi
0x2a1f445: je 0x142a1f44c
0x2a1f447: mov eax, dword ptr [rsi + 0x60]
0x2a1f44a: jmp 0x142a1f44e
0x2a1f44c: mov eax, ebx
0x2a1f44e: mov dword ptr [rbp + 0x77], eax
0x2a1f451: mov rax, qword ptr [rbp - 9]
0x2a1f455: mov r9, qword ptr [rax + 8]
0x2a1f459: lea rax, [rip - 0x26c5910]
0x2a1f460: cmp r9, rax
0x2a1f463: je 0x142a1f476
0x2a1f465: mov r8d, 4
0x2a1f46b: lea rdx, [rbp + 0x77]
0x2a1f46f: lea rcx, [rbp - 9]
0x2a1f473: call r9
0x2a1f476: movzx eax, word ptr [rbp + 0x13]
0x2a1f47a: mov word ptr [r14 + 3], ax
0x2a1f47f: movzx esi, word ptr [rbp + 0x13]
0x2a1f483: mov r12d, 0xa9c
0x2a1f489: mov word ptr [r14], r12w
0x2a1f48d: mov byte ptr [r14 + 2], 0xff
0x2a1f492: add si, 5
0x2a1f496: cmp r13d, 1
0x2a1f49a: jne 0x142a1f580
0x2a1f4a0: mov rax, qword ptr [r15]
0x2a1f4a3: mov r14, qword ptr [rax]
0x2a1f4a6: test r14, r14
0x2a1f4a9: je 0x142a1f5a7
0x2a1f4af: mov rax, qword ptr [r14]
0x2a1f4b2: mov rcx, r14
0x2a1f4b5: call qword ptr [rax + 0x70]
0x2a1f4b8: movzx r13d, al
0x2a1f4bc: mov r15, qword ptr [r14 + 0x98]
0x2a1f4c3: test r15, r15
0x2a1f4c6: je 0x142a1f4ed
0x2a1f4c8: mov rdx, qword ptr [r15]
0x2a1f4cb: mov rcx, r15
0x2a1f4ce: call qword ptr [rdx + 0x10]
0x2a1f4d1: cmp al, 1
0x2a1f4d3: jne 0x142a1f4e8
0x2a1f4d5: movzx r8d, si
0x2a1f4d9: lea rdx, [rdi + 0x33]
0x2a1f4dd: mov rax, qword ptr [r15]
0x2a1f4e0: mov rcx, r15
0x2a1f4e3: call qword ptr [rax + 0x28]
0x2a1f4e6: jmp 0x142a1f4ed
0x2a1f4e8: test r13b, r13b
0x2a1f4eb: je 0x142a1f558
0x2a1f4ed: cmp si, 1
0x2a1f4f1: jb 0x142a1f558
0x2a1f4f3: movzx ecx, word ptr [rdi + 0x803c]
0x2a1f4fa: sub rcx, 3
0x2a1f4fe: movzx eax, si
0x2a1f501: cmp rcx, rax
0x2a1f504: jb 0x142a1f558
0x2a1f506: add si, 0x1f
0x2a1f50a: mov word ptr [rdi + 0x8038], si
0x2a1f511: mov word ptr [rdi + 0x803a], si
0x2a1f518: mov rax, qword ptr [rdi + 0x8030]
0x2a1f51f: mov word ptr [rax], si
0x2a1f522: mov rax, qword ptr [rdi + 0x8030]
0x2a1f529: mov byte ptr [rax + 2], 2
0x2a1f52d: movzx eax, word ptr [rdi + 0x8038]
0x2a1f534: mov dword ptr [rdi + 0x8040], eax
0x2a1f53a: lea rdx, [rdi + 0x30]
0x2a1f53e: movzx r8d, word ptr [rdx + 0x800a]
0x2a1f546: sub r8, rax
0x2a1f549: add r8, rdx
0x2a1f54c: mov qword ptr [rdi + 0x8048], r8
0x2a1f553: mov word ptr [rbp - 0x15], r12w
0x2a1f558: mov byte ptr [rbp + 0x6f], 0
0x2a1f55c: mov rax, qword ptr [r14]
0x2a1f55f: lea r9, [rbp + 0x6f]
0x2a1f563: mov r8, rdi
0x2a1f566: lea rdx, [rbp + 0x7f]
0x2a1f56a: mov rcx, r14
0x2a1f56d: call qword ptr [rax + 0x48]
0x2a1f570: cmp dword ptr [rbp + 0x7f], 0
0x2a1f574: jne 0x142a1f5a7
0x2a1f576: mov ecx, dword ptr [rbp - 0x19]
0x2a1f579: dec ecx
0x2a1f57b: mov dword ptr [rbp - 0x19], ecx
0x2a1f57e: jmp 0x142a1f5aa
0x2a1f580: cmp dword ptr [r15 + 8], 0
0x2a1f585: je 0x142a1f5a7
0x2a1f587: mov edx, r12d
0x2a1f58a: mov qword ptr [rsp + 0x30], r15
0x2a1f58f: mov byte ptr [rsp + 0x20], 2
0x2a1f594: movzx r9d, si
0x2a1f598: mov r8, r14
0x2a1f59b: mov rcx, qword ptr [rip + 0x434a0de]
0x2a1f5a2: call 0x142773870
0x2a1f5a7: mov ecx, dword ptr [rbp - 0x19]
0x2a1f5aa: lea rax, [rip + 0x2d026e7]
0x2a1f5b1: mov qword ptr [rbp - 9], rax
0x2a1f5b5: mov qword ptr [rbp + 7], rbx
0x2a1f5b9: lea rax, [rip + 0x2d02678]
0x2a1f5c0: mov qword ptr [rbp - 9], rax
0x2a1f5c4: mov r12, qword ptr [rbp - 0x29]
0x2a1f5c8: test rdi, rdi
0x2a1f5cb: je 0x142a1f65a
0x2a1f5d1: test ecx, ecx
0x2a1f5d3: jle 0x142a1f64b
0x2a1f5d5: mov eax, ecx
0x2a1f5d7: neg eax
0x2a1f5d9: lock xadd dword ptr [rdi + 0x8050], eax
0x2a1f5e1: cmp eax, ecx
0x2a1f5e3: jne 0x142a1f64b
0x2a1f5e5: mov dword ptr [rdi + 0x8038], ebx
0x2a1f5eb: mov dword ptr [rdi + 0x8040], ebx
0x2a1f5f1: lea rax, [rdi + 0x30]
0x2a1f5f5: mov qword ptr [rdi + 0x8048], rax
0x2a1f5fc: mov dword ptr [rdi + 0x8050], ebx
0x2a1f602: mov qword ptr [rbp + 0x6f], rdi
0x2a1f606: mov qword ptr [rbp + 0x7f], rdi
0x2a1f60a: lea rcx, [rip + 0x2d06ca7]
0x2a1f611: mov qword ptr [rdi], rcx
0x2a1f614: mov qword ptr [rdi + 0x8030], rbx
0x2a1f61b: mov qword ptr [rbp - 0x29], rax
0x2a1f61f: mov qword ptr [rax + 0x8000], rbx
0x2a1f626: lea rax, [rip + 0x2d06c9b]
0x2a1f62d: mov qword ptr [rdi], rax
0x2a1f630: mov eax, 0x1fd
0x2a1f635: mov rcx, rdi
0x2a1f638: cmp byte ptr [rax + r12], 0
0x2a1f63d: je 0x142a1f646
0x2a1f63f: call 0x1447f03bc
0x2a1f644: jmp 0x142a1f64b
0x2a1f646: call 0x1447f02bc
0x2a1f64b: mov qword ptr [rbp - 0x21], rbx
0x2a1f64f: mov dword ptr [rbp - 0x19], ebx
0x2a1f652: mov word ptr [rbp - 0x15], bx
0x2a1f656: mov qword ptr [rbp - 0x11], rbx
0x2a1f65a: mov rbx, qword ptr [rsp + 0xf0]
0x2a1f662: add rsp, 0xb0
0x2a1f669: pop r15
0x2a1f66b: pop r14
0x2a1f66d: pop r13
0x2a1f66f: pop r12
0x2a1f671: pop rdi
0x2a1f672: pop rsi
0x2a1f673: pop rbp
0x2a1f674: ret 