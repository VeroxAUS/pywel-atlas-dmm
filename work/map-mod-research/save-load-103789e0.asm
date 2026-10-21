0x103789e0: push rbx
0x103789e2: sub rsp, 0x20
0x103789e6: mov rbx, rcx
0x103789e9: call 0x141439540
0x103789ee: mov rcx, qword ptr [rax]
0x103789f1: test rcx, rcx
0x103789f4: je 0x150378a1d
0x103789f6: cmp qword ptr [rcx + 8], 0
0x103789fb: je 0x150378a1d
0x103789fd: call 0x141439540
0x10378a02: mov rdx, qword ptr [rax + 8]
0x10378a06: lock dec dword ptr [rdx + 0xb0]
0x10378a0d: call 0x141439540
0x10378a12: mov rcx, qword ptr [rax + 8]
0x10378a16: lock inc dword ptr [rcx + 0xb4]
0x10378a1d: cmp word ptr [rbx + 0x5e], 8
0x10378a22: jne 0x150378a2a
0x10378a24: mov word ptr [rbx + 0x5e], 0x10
0x10378a2a: add rsp, 0x20
0x10378a2e: pop rbx
0x10378a2f: ret 