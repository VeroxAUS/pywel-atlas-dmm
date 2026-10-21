0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2