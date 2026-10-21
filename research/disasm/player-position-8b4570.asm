0x8b4570: mov qword ptr [rsp + 0x18], rbx
0x8b4575: mov qword ptr [rsp + 0x10], rdx
0x8b457a: push rbp
0x8b457b: push rsi
0x8b457c: push rdi
0x8b457d: push r14
0x8b457f: push r15
0x8b4581: sub rsp, 0x50
0x8b4585: mov rbx, rdx
0x8b4588: mov r14, rcx
0x8b458b: xor r15d, r15d
0x8b458e: mov dword ptr [rsp + 0x20], r15d
0x8b4593: mov rdi, qword ptr [rcx + 0x58]
0x8b4597: test rdi, rdi
0x8b459a: jne 0x1408b45d5
0x8b459c: lea rbp, [rip + 0x4e718a5]
0x8b45a3: mov qword ptr [rdx], rbp
0x8b45a6: mov qword ptr [rdx + 8], r15
0x8b45aa: mov word ptr [rdx + 0x10], r15w
0x8b45af: mov qword ptr [rdx + 0x18], r15
0x8b45b3: lea rsi, [rip + 0x4cbf4ce]
0x8b45ba: mov qword ptr [rdx], rsi
0x8b45bd: lea rax, [rip + 0x4cbf484]
0x8b45c4: mov qword ptr [rdx], rax
0x8b45c7: mov esi, 1
0x8b45cc: mov dword ptr [rsp + 0x20], esi
0x8b45d0: jmp 0x1408b46de
0x8b45d5: mov edx, 4
0x8b45da: mov r8d, 0x10
0x8b45e0: mov rax, qword ptr [rdi]
0x8b45e3: mov rcx, rdi
0x8b45e6: call qword ptr [rax + 0xc0]
0x8b45ec: lea rbp, [rip + 0x4e71855]
0x8b45f3: mov qword ptr [rsp + 0x28], rbp
0x8b45f8: mov qword ptr [rsp + 0x30], rdi
0x8b45fd: test al, al
0x8b45ff: setne byte ptr [rsp + 0x38]
0x8b4604: mov byte ptr [rsp + 0x39], r15b
0x8b4609: mov qword ptr [rsp + 0x40], r15
0x8b460e: lea rsi, [rip + 0x4cbf473]
0x8b4615: mov qword ptr [rsp + 0x28], rsi
0x8b461a: lea rcx, [rip + 0x4d0182f]
0x8b4621: mov qword ptr [rsp + 0x28], rcx
0x8b4626: test al, al
0x8b4628: jne 0x1408b465b
0x8b462a: mov qword ptr [rbx], rbp
0x8b462d: mov qword ptr [rbx + 8], r15
0x8b4631: mov word ptr [rbx + 0x10], 0
0x8b4637: mov qword ptr [rbx + 0x18], r15
0x8b463b: mov qword ptr [rbx], rsi
0x8b463e: lea rax, [rip + 0x4cbf403]
0x8b4645: mov qword ptr [rbx], rax
0x8b4648: mov esi, 1
0x8b464d: mov dword ptr [rsp + 0x20], esi
0x8b4651: mov qword ptr [rsp + 0x28], rbp
0x8b4656: jmp 0x1408b46de
0x8b465b: mov rax, qword ptr [r14 + 0x58]
0x8b465f: mov r14, qword ptr [rax + 0xd8]
0x8b4666: test r14, r14
0x8b4669: je 0x1408b468a
0x8b466b: mov edx, 4
0x8b4670: mov r8d, 0x10
0x8b4676: mov rax, qword ptr [r14]
0x8b4679: mov rcx, r14
0x8b467c: call qword ptr [rax + 0xc0]
0x8b4682: test al, al
0x8b4684: je 0x1408b468a
0x8b4686: mov al, 1
0x8b4688: jmp 0x1408b468c
0x8b468a: xor al, al
0x8b468c: mov qword ptr [rbx], rbp
0x8b468f: mov qword ptr [rbx + 8], r14
0x8b4693: mov byte ptr [rbx + 0x10], al
0x8b4696: mov byte ptr [rbx + 0x11], 0
0x8b469a: mov qword ptr [rbx + 0x18], r15
0x8b469e: mov qword ptr [rbx], rsi
0x8b46a1: lea rax, [rip + 0x4cbf3a0]
0x8b46a8: mov qword ptr [rbx], rax
0x8b46ab: mov esi, 1
0x8b46b0: mov dword ptr [rsp + 0x20], esi
0x8b46b4: mov qword ptr [rsp + 0x28], rbp
0x8b46b9: mov rax, qword ptr [rdi]
0x8b46bc: mov rcx, rdi
0x8b46bf: call qword ptr [rax + 8]
0x8b46c2: test al, al
0x8b46c4: je 0x1408b46d9
0x8b46c6: xor eax, eax
0x8b46c8: lock cmpxchg byte ptr [rdi + 0x4b], sil
0x8b46ce: jne 0x1408b46d9
0x8b46d0: mov rax, qword ptr [rdi]
0x8b46d3: mov rcx, rdi
0x8b46d6: call qword ptr [rax + 0x10]
0x8b46d9: mov byte ptr [rsp + 0x38], 0
0x8b46de: mov rax, rbx
0x8b46e1: mov rbx, qword ptr [rsp + 0x90]
0x8b46e9: add rsp, 0x50
0x8b46ed: pop r15
0x8b46ef: pop r14
0x8b46f1: pop rdi
0x8b46f2: pop rsi
0x8b46f3: pop rbp
0x8b46f4: ret 
0x8b46f5: int3 