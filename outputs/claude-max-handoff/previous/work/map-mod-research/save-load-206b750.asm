0x206b750: mov qword ptr [rsp + 0x20], rbx
0x206b755: mov byte ptr [rsp + 0x18], r8b
0x206b75a: push rbp
0x206b75b: push rsi
0x206b75c: push rdi
0x206b75d: push r12
0x206b75f: push r13
0x206b761: push r14
0x206b763: push r15
0x206b765: mov rbp, rsp
0x206b768: sub rsp, 0x80
0x206b76f: mov r13, rdx
0x206b772: mov rsi, rcx
0x206b775: mov rax, qword ptr [rdx]
0x206b778: xor r14d, r14d
0x206b77b: mov qword ptr [rsp + 0x20], r14
0x206b780: mov r9b, 0xff
0x206b783: xor r8d, r8d
0x206b786: lea rdx, [rbp + 0x50]
0x206b78a: mov rcx, r13
0x206b78d: call qword ptr [rax + 0x158]
0x206b793: test rsi, rsi
0x206b796: je 0x14206b7a9
0x206b798: mov rcx, rsi
0x206b79b: call 0x1414343a0
0x206b7a0: test al, al
0x206b7a2: je 0x14206b7a9
0x206b7a4: mov r12b, 1
0x206b7a7: jmp 0x14206b7ac
0x206b7a9: xor r12b, r12b
0x206b7ac: lea rcx, [rip + 0x36ba695]
0x206b7b3: mov qword ptr [rbp - 0x20], rcx
0x206b7b7: mov qword ptr [rbp - 0x18], rsi
0x206b7bb: mov byte ptr [rbp - 0x10], r12b
0x206b7bf: mov byte ptr [rbp - 0xf], r14b
0x206b7c3: mov qword ptr [rbp - 8], r14
0x206b7c7: lea rdx, [rip + 0x3508072]
0x206b7ce: mov qword ptr [rbp - 0x20], rdx
0x206b7d2: mov byte ptr [rbp - 0xf], 0
0x206b7d6: mov ebx, 1
0x206b7db: test r12b, r12b
0x206b7de: je 0x14206b9e6
0x206b7e4: mov rax, qword ptr [rsi + 0x68]
0x206b7e8: mov rdi, qword ptr [rax + 0x18]
0x206b7ec: lea rbx, [rsi + 0x18]
0x206b7f0: mov qword ptr [rbp + 0x40], rbx
0x206b7f4: mov rax, qword ptr [rbx]
0x206b7f7: mov rcx, rbx
0x206b7fa: call qword ptr [rax + 8]
0x206b7fd: nop 
0x206b7fe: lea rdx, [rsi + 8]
0x206b802: test rsi, rsi
0x206b805: cmove rdx, r14
0x206b809: mov r8b, 1
0x206b80c: mov rdx, qword ptr [rdx]
0x206b80f: lea rcx, [rbp - 0x50]
0x206b813: call 0x140393650
0x206b818: nop 
0x206b819: mov rdx, r13
0x206b81c: mov rcx, rdi
0x206b81f: call 0x14211a300
0x206b824: mov rax, qword ptr [rdi + 8]
0x206b828: dec word ptr [rax + 0x48]
0x206b82c: cmp byte ptr [rax + 0x4a], 0
0x206b830: jne 0x14206b837
0x206b832: lock add dword ptr [rax + 0x10], 0
0x206b837: mov rdi, qword ptr [rsi + 0xd0]
0x206b83e: cmp rdi, r13
0x206b841: jne 0x14206b84d
0x206b843: mov qword ptr [rsi + 0xd0], r14
0x206b84a: mov rdi, r14
0x206b84d: mov r14, qword ptr [rbp - 0x50]
0x206b851: mov rax, qword ptr [r14]
0x206b854: xor edx, edx
0x206b856: mov rcx, r14
0x206b859: call qword ptr [rax + 0x20]
0x206b85c: mov r15d, 0xffffffff
0x206b862: cmp byte ptr [rbp - 0x48], 1
0x206b866: jne 0x14206b898
0x206b868: mov eax, r15d
0x206b86b: lock xadd dword ptr [r14 + 8], eax
0x206b871: cmp eax, 1
0x206b874: jne 0x14206b889
0x206b876: test dword ptr [r14 + 0xc], 0x40000000
0x206b87e: je 0x14206b898
0x206b880: mov rax, qword ptr [r14]
0x206b883: mov rcx, r14
0x206b886: call qword ptr [rax + 0x40]
0x206b889: test dword ptr [r14 + 0xc], 0x40000000
0x206b891: je 0x14206b898
0x206b893: lock dec dword ptr [r14 + 0xc]
0x206b898: mov rax, qword ptr [rbx]
0x206b89b: mov rcx, rbx
0x206b89e: call qword ptr [rax + 0x10]
0x206b8a1: test rdi, rdi
0x206b8a4: je 0x14206b9d3
0x206b8aa: mov rcx, rdi
0x206b8ad: call 0x1414343a0
0x206b8b2: movzx ecx, al
0x206b8b5: mov byte ptr [rbp + 0x50], al
0x206b8b8: lea rdx, [rip + 0x36ba589]
0x206b8bf: mov qword ptr [rbp - 0x40], rdx
0x206b8c3: mov qword ptr [rbp - 0x38], rdi
0x206b8c7: mov byte ptr [rbp - 0x30], al
0x206b8ca: mov byte ptr [rbp - 0x2f], 0
0x206b8ce: mov qword ptr [rbp - 0x28], 0
0x206b8d6: lea r8, [rip + 0x3507f63]
0x206b8dd: mov qword ptr [rbp - 0x40], r8
0x206b8e1: mov byte ptr [rbp - 0x2f], 0
0x206b8e5: test al, al
0x206b8e7: je 0x14206b99d
0x206b8ed: mov rax, qword ptr [rdi + 0x68]
0x206b8f1: mov r14, qword ptr [rax + 0x18]
0x206b8f5: test r14, r14
0x206b8f8: je 0x14206b99d
0x206b8fe: lea rbx, [rdi + 0x18]
0x206b902: mov qword ptr [rbp + 0x48], rbx
0x206b906: mov rax, qword ptr [rbx]
0x206b909: mov rcx, rbx
0x206b90c: call qword ptr [rax + 8]
0x206b90f: nop 
0x206b910: mov r8b, 1
0x206b913: mov rdx, qword ptr [rdi + 8]
0x206b917: lea rcx, [rbp - 0x50]
0x206b91b: call 0x140393650
0x206b920: nop 
0x206b921: mov rdx, r13
0x206b924: mov rcx, r14
0x206b927: call 0x14211a300
0x206b92c: mov rax, qword ptr [r14 + 8]
0x206b930: dec word ptr [rax + 0x48]
0x206b934: cmp byte ptr [rax + 0x4a], 0
0x206b938: jne 0x14206b93f
0x206b93a: lock add dword ptr [rax + 0x10], 0
0x206b93f: mov r14, qword ptr [rbp - 0x50]
0x206b943: mov rax, qword ptr [r14]
0x206b946: xor edx, edx
0x206b948: mov rcx, r14
0x206b94b: call qword ptr [rax + 0x20]
0x206b94e: cmp byte ptr [rbp - 0x48], 1
0x206b952: jne 0x14206b982
0x206b954: lock xadd dword ptr [r14 + 8], r15d
0x206b95a: cmp r15d, 1
0x206b95e: jne 0x14206b973
0x206b960: test dword ptr [r14 + 0xc], 0x40000000
0x206b968: je 0x14206b982
0x206b96a: mov rax, qword ptr [r14]
0x206b96d: mov rcx, r14
0x206b970: call qword ptr [rax + 0x40]
0x206b973: test dword ptr [r14 + 0xc], 0x40000000
0x206b97b: je 0x14206b982
0x206b97d: lock dec dword ptr [r14 + 0xc]
0x206b982: mov rax, qword ptr [rbx]
0x206b985: mov rcx, rbx
0x206b988: call qword ptr [rax + 0x10]
0x206b98b: movzx ecx, byte ptr [rbp + 0x50]
0x206b98f: lea rdx, [rip + 0x36ba4b2]
0x206b996: lea r8, [rip + 0x3507ea3]
0x206b99d: mov qword ptr [rbp - 0x40], r8
0x206b9a1: mov qword ptr [rbp - 0x40], rdx
0x206b9a5: test cl, cl
0x206b9a7: je 0x14206b9d3
0x206b9a9: mov rax, qword ptr [rdi]
0x206b9ac: mov rcx, rdi
0x206b9af: call qword ptr [rax + 8]
0x206b9b2: mov ebx, 1
0x206b9b7: test al, al
0x206b9b9: je 0x14206b9cd
0x206b9bb: xor eax, eax
0x206b9bd: lock cmpxchg byte ptr [rdi + 0x4b], bl
0x206b9c2: jne 0x14206b9cd
0x206b9c4: mov rax, qword ptr [rdi]
0x206b9c7: mov rcx, rdi
0x206b9ca: call qword ptr [rax + 0x10]
0x206b9cd: mov byte ptr [rbp - 0x30], 0
0x206b9d1: jmp 0x14206b9d8
0x206b9d3: mov ebx, 1
0x206b9d8: lea rcx, [rip + 0x36ba469]
0x206b9df: lea rdx, [rip + 0x3507e5a]
0x206b9e6: mov qword ptr [rbp - 0x20], rdx
0x206b9ea: mov qword ptr [rbp - 0x20], rcx
0x206b9ee: test r12b, r12b
0x206b9f1: je 0x14206ba16
0x206b9f3: mov rax, qword ptr [rsi]
0x206b9f6: mov rcx, rsi
0x206b9f9: call qword ptr [rax + 8]
0x206b9fc: test al, al
0x206b9fe: je 0x14206ba12
0x206ba00: xor eax, eax
0x206ba02: lock cmpxchg byte ptr [rsi + 0x4b], bl
0x206ba07: jne 0x14206ba12
0x206ba09: mov rax, qword ptr [rsi]
0x206ba0c: mov rcx, rsi
0x206ba0f: call qword ptr [rax + 0x10]
0x206ba12: mov byte ptr [rbp - 0x10], 0
0x206ba16: mov rbx, qword ptr [rsp + 0xd8]
0x206ba1e: add rsp, 0x80
0x206ba25: pop r15
0x206ba27: pop r14
0x206ba29: pop r13
0x206ba2b: pop r12
0x206ba2d: pop rdi
0x206ba2e: pop rsi
0x206ba2f: pop rbp
0x206ba30: ret 