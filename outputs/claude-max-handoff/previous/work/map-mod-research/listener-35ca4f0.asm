0x35ca4f0: mov qword ptr [rsp + 0x18], r8
0x35ca4f5: push r12
0x35ca4f7: push r14
0x35ca4f9: sub rsp, 0x38
0x35ca4fd: mov rax, qword ptr [rcx]
0x35ca500: mov r14, rcx
0x35ca503: mov r12, rdx
0x35ca506: mov rcx, qword ptr [rax + 0xa0]
0x35ca50d: test rcx, rcx
0x35ca510: je 0x1435ca51d
0x35ca512: cmp qword ptr [rcx + 8], 0
0x35ca517: jne 0x1435ca5ff
0x35ca51d: mov eax, dword ptr [rdx + 8]