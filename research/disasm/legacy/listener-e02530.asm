0xe02530: mov qword ptr [rsp + 0x10], rbx
0xe02535: mov qword ptr [rsp + 0x20], r9
0xe0253a: push rbp
0xe0253b: push rsi
0xe0253c: push rdi
0xe0253d: push r12
0xe0253f: push r13
0xe02541: push r14
0xe02543: push r15
0xe02545: sub rsp, 0x40
0xe02549: mov ebp, r8d
0xe0254c: mov r13, rdx
0xe0254f: mov rdi, rcx
0xe02552: cmp dword ptr [rcx], 0
0xe02555: jne 0x140e0255f
0xe02557: mov edx, r8d
0xe0255a: call 0x140391680
0xe0255f: mov r10d, dword ptr [rdi]
0xe02562: xor r14d, r14d
0xe02565: test r10d, r10d
0xe02568: je 0x140e025bb
0xe0256a: xor edx, edx
0xe0256c: mov eax, ebp
0xe0256e: div r10d
0xe02571: mov r8d, edx
0xe02574: shl r8, 8
0xe02578: add r8, qword ptr [rdi + 0x10]
0xe0257c: mov edx, r14d
0xe0257f: mov r9d, dword ptr [r8]
0xe02582: test r9d, r9d
0xe02585: je 0x140e025bb
0xe02587: mov eax, edx
0xe02589: cmp dword ptr [r8 + rax*8 + 8], ebp
0xe0258e: jne 0x140e025b4
0xe02590: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xe02595: mov rax, qword ptr [rdi + 0x18]
0xe02599: mov rbx, qword ptr [rax + rcx*8]
0xe0259d: mov rcx, qword ptr [r13]
0xe025a1: mov eax, dword ptr [rcx]
0xe025a3: cmp dword ptr [rbx + 4], eax
0xe025a6: jne 0x140e025b4
0xe025a8: mov eax, dword ptr [rcx + 4]
0xe025ab: cmp dword ptr [rbx + 8], eax
0xe025ae: je 0x140e0267e
0xe025b4: inc edx
0xe025b6: cmp edx, r9d
0xe025b9: jb 0x140e02587
0xe025bb: mov rax, qword ptr [rsp + 0xa8]
0xe025c3: mov byte ptr [rax], r14b
0xe025c6: xor edx, edx
0xe025c8: mov eax, ebp
0xe025ca: div r10d
0xe025cd: mov ecx, edx
0xe025cf: shl rcx, 8
0xe025d3: mov rax, qword ptr [rdi + 0x10]
0xe025d7: cmp dword ptr [rcx + rax], 0x1f
0xe025db: jne 0x140e025ed
0xe025dd: mov edx, ebp
0xe025df: mov rcx, rdi
0xe025e2: call 0x140391680
0xe025e7: xor edx, edx
0xe025e9: mov eax, ebp
0xe025eb: div dword ptr [rdi]
0xe025ed: mov r8d, edx
0xe025f0: shl r8, 8
0xe025f4: add r8, qword ptr [rdi + 0x10]
0xe025f8: mov qword ptr [rsp + 0x30], r8
0xe025fd: mov ecx, dword ptr [r8]
0xe02600: mov dword ptr [rsp + 0x80], ecx
0xe02607: imul eax, edx, 0x1f
0xe0260a: add eax, ecx
0xe0260c: mov dword ptr [rsp + 0x20], eax
0xe02610: mov r15d, dword ptr [rdi + 4]
0xe02614: mov dword ptr [rsp + 0xc0], r15d
0xe0261c: lea r12, [rdi + 8]
0xe02620: mov ecx, dword ptr [r12]
0xe02624: lea rsi, [rdi + 4]
0xe02628: mov edx, 0x1fd
0xe0262d: cmp r15d, ecx
0xe02630: jb 0x140e02750
0xe02636: lea eax, [r15 + 1]
0xe0263a: lea rsi, [rdi + 4]
0xe0263e: cmp eax, ecx
0xe02640: jbe 0x140e02750
0xe02646: lea eax, [rax + rax*2]
0xe02649: inc eax
0xe0264b: shr eax, 1
0xe0264d: mov dword ptr [rsp + 0xa0], eax
0xe02654: lea ecx, [rax*8]
0xe0265b: mov rax, qword ptr gs:[0x58]
0xe02664: mov rax, qword ptr [rax]
0xe02667: mov qword ptr [rsp + 0x28], rax
0xe0266c: cmp byte ptr [rax + rdx], r14b
0xe02670: mov edx, 0x40
0xe02675: je 0x140e02697
0xe02677: call 0x1447efa78
0xe0267c: jmp 0x140e0269c
0xe0267e: test rbx, rbx
0xe02681: je 0x140e025bb
0xe02687: mov rax, qword ptr [rsp + 0xa8]
0xe0268f: mov byte ptr [rax], 1
0xe02692: jmp 0x140e027eb
0xe02697: call 0x1447ef9b0
0xe0269c: mov r15, rax
0xe0269f: lea rsi, [rdi + 4]
0xe026a3: test rax, rax
0xe026a6: jne 0x140e026cb
0xe026a8: call 0x141318e70
0xe026ad: xor r9d, r9d
0xe026b0: xor r8d, r8d
0xe026b3: mov edx, 1
0xe026b8: mov ecx, 0xa0000002
0xe026bd: call qword ptr [rip + 0x43e8a85]
0xe026c3: lea rsi, [rdi + 4]
0xe026c7: lea r12, [rdi + 8]
0xe026cb: lea rbx, [rdi + 0x18]
0xe026cf: cmp qword ptr [rbx], r14
0xe026d2: je 0x140e02730
0xe026d4: mov rcx, rbx
0xe026d7: cmp dword ptr [rsi], r14d
0xe026da: jbe 0x140e02703
0xe026dc: nop dword ptr [rax]
0xe026e0: lea rdx, [r14*8]
0xe026e8: mov rax, qword ptr [rbx]
0xe026eb: mov rcx, qword ptr [rdx + rax]
0xe026ef: mov qword ptr [rdx + r15], rcx
0xe026f3: inc r14d
0xe026f6: cmp r14d, dword ptr [rsi]
0xe026f9: jb 0x140e026e0
0xe026fb: lea rcx, [rdi + 0x18]
0xe026ff: lea r12, [rdi + 8]
0xe02703: mov rbx, rcx
0xe02706: mov rcx, qword ptr [rcx]
0xe02709: test rcx, rcx
0xe0270c: je 0x140e0272c
0xe0270e: mov rax, qword ptr [rsp + 0x28]
0xe02713: mov r8d, 0x1fd
0xe02719: cmp byte ptr [r8 + rax], 0
0xe0271e: je 0x140e02727
0xe02720: call 0x1447f03bc
0xe02725: jmp 0x140e0272c
0xe02727: call 0x1447f02bc
0xe0272c: lea rsi, [rdi + 4]
0xe02730: mov qword ptr [rbx], r15
0xe02733: mov eax, dword ptr [rsp + 0xa0]
0xe0273a: mov dword ptr [r12], eax
0xe0273e: mov r15d, dword ptr [rsp + 0xc0]
0xe02746: mov r8, qword ptr [rsp + 0x30]
0xe0274b: mov edx, 0x1fd
0xe02750: mov eax, dword ptr [rsp + 0x80]
0xe02757: mov dword ptr [r8 + rax*8 + 8], ebp
0xe0275c: mov dword ptr [r8 + rax*8 + 0xc], r15d
0xe02761: inc dword ptr [r8]
0xe02764: mov rax, qword ptr gs:[0x58]
0xe0276d: mov rcx, qword ptr [rax]
0xe02770: cmp byte ptr [rdx + rcx], 0
0xe02774: mov edx, 8
0xe02779: mov ecx, 0x30
0xe0277e: je 0x140e02787
0xe02780: call 0x1447efa78
0xe02785: jmp 0x140e0278c
0xe02787: call 0x1447ef9b0
0xe0278c: mov rbx, rax
0xe0278f: test rax, rax
0xe02792: jne 0x140e027b3
0xe02794: call 0x141318e70
0xe02799: xor r9d, r9d
0xe0279c: xor r8d, r8d
0xe0279f: mov edx, 1
0xe027a4: mov ecx, 0xa0000002
0xe027a9: call qword ptr [rip + 0x43e8999]
0xe027af: lea rsi, [rdi + 4]
0xe027b3: mov qword ptr [rsp + 0x80], rbx
0xe027bb: mov rax, qword ptr [r13]
0xe027bf: mov rcx, qword ptr [rax]
0xe027c2: mov eax, dword ptr [rsp + 0x20]
0xe027c6: mov dword ptr [rbx], eax
0xe027c8: mov qword ptr [rbx + 4], rcx
0xe027cc: lea rcx, [rbx + 0x10]
0xe027d0: mov rdx, qword ptr [rsp + 0x98]
0xe027d8: call 0x140e03370
0xe027dd: nop 
0xe027de: mov ecx, r15d
0xe027e1: mov rax, qword ptr [rdi + 0x18]
0xe027e5: mov qword ptr [rax + rcx*8], rbx
0xe027e9: inc dword ptr [rsi]
0xe027eb: lea rcx, [rbx + 4]
0xe027ef: mov rax, qword ptr [rsp + 0xb0]
0xe027f7: mov qword ptr [rax], rcx
0xe027fa: lea rcx, [rbx + 0x10]
0xe027fe: mov rax, qword ptr [rsp + 0xb8]
0xe02806: mov qword ptr [rax], rcx
0xe02809: mov rbx, qword ptr [rsp + 0x88]
0xe02811: add rsp, 0x40
0xe02815: pop r15
0xe02817: pop r14
0xe02819: pop r13
0xe0281b: pop r12
0xe0281d: pop rdi
0xe0281e: pop rsi
0xe0281f: pop rbp
0xe02820: ret 