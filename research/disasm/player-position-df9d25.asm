0xdf9d25: add r10, 8
0xdf9d29: je 0x140df9d15
0xdf9d2b: mov rbx, qword ptr [r10]
0xdf9d2e: mov eax, dword ptr [r10 + 8]
0xdf9d32: lea rdi, [rbx + rax*8]
0xdf9d36: cmp rbx, rdi
0xdf9d39: je 0x140df9d15
0xdf9d3b: nop dword ptr [rax + rax]
0xdf9d40: mov rcx, qword ptr [rbx]
0xdf9d43: mov rdx, rsi
0xdf9d46: call 0x140decaf0
0xdf9d4b: add rbx, 8
0xdf9d4f: cmp rbx, rdi
0xdf9d52: jne 0x140df9d40
0xdf9d54: mov rdi, qword ptr [rsp + 0x40]
0xdf9d59: mov rbx, qword ptr [rsp + 0x58]
0xdf9d5e: add rsp, 0x30
0xdf9d62: pop rsi
0xdf9d63: ret 