CALLER 0xdabd10 END 0xdadcce
0xdadb46: mov r15d, dword ptr [r14 + 0x3a0]
0xdadb4d: mov ebx, edi
0xdadb4f: test r15d, r15d
0xdadb52: je 0x140dadb99
0xdadb54: nop dword ptr [rax]
0xdadb58: nop dword ptr [rax + rax]
0xdadb60: mov r8, qword ptr [r14 + 0x398]
0xdadb67: vmovss dword ptr [rsp + 0x28], xmm9
0xdadb6d: lea rax, [rsp + 0x120]
0xdadb75: mov qword ptr [rsp + 0x20], rax
0xdadb7a: mov r9, rsi
0xdadb7d: mov r8, qword ptr [rdi + r8]
0xdadb81: movzx edx, bl
0xdadb84: mov rcx, r14
0xdadb87: call 0x140d94040
0xdadb8c: inc ebx
0xdadb8e: lea rdi, [rdi + 8]
0xdadb92: cmp ebx, r15d
0xdadb95: jb 0x140dadb60
0xdadb97: xor edi, edi
0xdadb99: cmp byte ptr [rip + 0x5eff518], 0
