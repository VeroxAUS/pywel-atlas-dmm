0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 