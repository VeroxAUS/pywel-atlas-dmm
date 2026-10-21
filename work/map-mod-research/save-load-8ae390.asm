0x8ae390: mov qword ptr [rsp + 8], rbx
0x8ae395: mov qword ptr [rsp + 0x10], rdx
0x8ae39a: push rbp
0x8ae39b: push rsi
0x8ae39c: push rdi
0x8ae39d: push r14
0x8ae39f: push r15
0x8ae3a1: sub rsp, 0x30
0x8ae3a5: mov edi, r8d
0x8ae3a8: mov rsi, rdx
0x8ae3ab: mov rbp, rcx
0x8ae3ae: xor r15d, r15d
0x8ae3b1: mov dword ptr [rsp + 0x20], r15d
0x8ae3b6: test r8d, r8d
0x8ae3b9: jne 0x1408ae3eb
0x8ae3bb: lea rcx, [rip + 0x4e77a86]
0x8ae3c2: mov qword ptr [rdx], rcx
0x8ae3c5: mov qword ptr [rdx + 8], r15
0x8ae3c9: mov word ptr [rdx + 0x10], r15w
0x8ae3ce: mov qword ptr [rdx + 0x18], r15
0x8ae3d2: lea rax, [rip + 0x4cc56af]
0x8ae3d9: mov qword ptr [rdx], rax
0x8ae3dc: lea rax, [rip + 0x4d07a6d]
0x8ae3e3: mov qword ptr [rdx], rax
0x8ae3e6: jmp 0x1408ae558
0x8ae3eb: mov eax, edi
0x8ae3ed: and eax, 0x30000000
0x8ae3f2: cmp eax, 0x10000000
0x8ae3f7: je 0x1408ae429
0x8ae3f9: lea rcx, [rip + 0x4e77a48]
0x8ae400: mov qword ptr [rdx], rcx
0x8ae403: mov qword ptr [rdx + 8], r15
0x8ae407: mov word ptr [rdx + 0x10], r15w
0x8ae40c: mov qword ptr [rdx + 0x18], r15
0x8ae410: lea rax, [rip + 0x4cc5671]
0x8ae417: mov qword ptr [rdx], rax
0x8ae41a: lea rax, [rip + 0x4d07a2f]
0x8ae421: mov qword ptr [rdx], rax
0x8ae424: jmp 0x1408ae558
0x8ae429: lea rbx, [rcx + 0x10]
0x8ae42d: mov qword ptr [rsp + 0x78], rbx
0x8ae432: mov r14d, 0xffffffff
0x8ae438: test dword ptr [rbx + 0xc], 0x40000000
0x8ae43f: je 0x1408ae468
0x8ae441: mov ecx, r15d
0x8ae444: mov eax, r14d
0x8ae447: lock cmpxchg dword ptr [rbx + 8], r14d
0x8ae44d: test eax, eax
0x8ae44f: je 0x1408ae468
0x8ae451: cmp ecx, 0x3e8
0x8ae457: jae 0x1408ae468
0x8ae459: inc ecx
0x8ae45b: mov eax, r14d
0x8ae45e: lock cmpxchg dword ptr [rbx + 8], r14d
0x8ae464: test eax, eax
0x8ae466: jne 0x1408ae451
0x8ae468: mov rax, qword ptr [rbx]
0x8ae46b: mov dl, 1
0x8ae46d: mov rcx, rbx
0x8ae470: call qword ptr [rax + 0x18]
0x8ae473: test dword ptr [rbx + 0xc], 0x40000000
0x8ae47a: je 0x1408ae4a6
0x8ae47c: mov eax, r14d
0x8ae47f: lock cmpxchg dword ptr [rbx + 8], r14d
0x8ae485: test eax, eax
0x8ae487: je 0x1408ae4a6
0x8ae489: nop dword ptr [rax]
0x8ae490: mov rax, qword ptr [rbx]
0x8ae493: mov rcx, rbx
0x8ae496: call qword ptr [rax + 0x38]
0x8ae499: mov eax, r14d
0x8ae49c: lock cmpxchg dword ptr [rbx + 8], r14d
0x8ae4a2: test eax, eax
0x8ae4a4: jne 0x1408ae490
0x8ae4a6: mov edx, edi
0x8ae4a8: mov rcx, qword ptr [rbp + 8]
0x8ae4ac: call 0x140464290
0x8ae4b1: mov rdi, rax
0x8ae4b4: test rax, rax
0x8ae4b7: je 0x1408ae521
0x8ae4b9: test byte ptr [rax + 0x5e], 4
0x8ae4bd: je 0x1408ae521
0x8ae4bf: mov edx, 4
0x8ae4c4: mov r8d, 0x10
0x8ae4ca: mov rcx, qword ptr [rax]
0x8ae4cd: mov r9, qword ptr [rcx + 0xc0]
0x8ae4d4: mov rcx, rax
0x8ae4d7: call r9
0x8ae4da: test al, al
0x8ae4dc: setne al
0x8ae4df: lea rcx, [rip + 0x4e77962]
0x8ae4e6: mov qword ptr [rsi], rcx
0x8ae4e9: mov qword ptr [rsi + 8], rdi
0x8ae4ed: mov byte ptr [rsi + 0x10], al
0x8ae4f0: mov byte ptr [rsi + 0x11], 0
0x8ae4f4: mov qword ptr [rsi + 0x18], r15
0x8ae4f8: lea rax, [rip + 0x4cc5589]
0x8ae4ff: mov qword ptr [rsi], rax
0x8ae502: lea rax, [rip + 0x4d07947]
0x8ae509: mov qword ptr [rsi], rax
0x8ae50c: mov dword ptr [rsp + 0x20], 1
0x8ae514: mov rax, qword ptr [rbx]
0x8ae517: mov dl, 1
0x8ae519: mov rcx, rbx
0x8ae51c: call qword ptr [rax + 0x20]
0x8ae51f: jmp 0x1408ae560
0x8ae521: mov rax, qword ptr [rbx]
0x8ae524: mov dl, 1
0x8ae526: mov rcx, rbx
0x8ae529: call qword ptr [rax + 0x20]
0x8ae52c: lea rcx, [rip + 0x4e77915]
0x8ae533: mov qword ptr [rsi], rcx
0x8ae536: mov qword ptr [rsi + 8], r15
0x8ae53a: mov word ptr [rsi + 0x10], 0
0x8ae540: mov qword ptr [rsi + 0x18], r15
0x8ae544: lea rax, [rip + 0x4cc553d]
0x8ae54b: mov qword ptr [rsi], rax
0x8ae54e: lea rax, [rip + 0x4d078fb]
0x8ae555: mov qword ptr [rsi], rax
0x8ae558: mov dword ptr [rsp + 0x20], 1
0x8ae560: mov rax, rsi
0x8ae563: mov rbx, qword ptr [rsp + 0x60]
0x8ae568: add rsp, 0x30
0x8ae56c: pop r15
0x8ae56e: pop r14
0x8ae570: pop rdi
0x8ae571: pop rsi
0x8ae572: pop rbp
0x8ae573: ret 
0x8ae574: int3 