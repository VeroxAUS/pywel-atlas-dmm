0x15e7e90: push rbx
0x15e7e92: sub rsp, 0x20
0x15e7e96: mov eax, 0xffff
0x15e7e9b: mov rbx, rcx
0x15e7e9e: cmp word ptr [rcx + 0x188], ax
0x15e7ea5: je 0x1415e7f1e
0x15e7ea7: test dl, dl
0x15e7ea9: je 0x1415e7ef3
0x15e7eab: mov rcx, qword ptr [rcx + 0x128]
0x15e7eb2: test rcx, rcx
0x15e7eb5: je 0x1415e7ede
0x15e7eb7: mov rax, qword ptr [rcx]
0x15e7eba: xor edx, edx
0x15e7ebc: call qword ptr [rax + 8]
0x15e7ebf: test rax, rax
0x15e7ec2: je 0x1415e7ede
0x15e7ec4: cmp byte ptr [rax], 0
0x15e7ec7: je 0x1415e7ede
0x15e7ec9: mov rcx, qword ptr [rbx + 0x128]
0x15e7ed0: xor edx, edx
0x15e7ed2: mov rax, qword ptr [rcx]
0x15e7ed5: add rsp, 0x20
0x15e7ed9: pop rbx
0x15e7eda: jmp qword ptr [rax + 8]
0x15e7ede: mov rcx, qword ptr [rbx + 0x108]
0x15e7ee5: xor edx, edx
0x15e7ee7: mov rax, qword ptr [rcx]
0x15e7eea: add rsp, 0x20
0x15e7eee: pop rbx
0x15e7eef: jmp qword ptr [rax + 8]
0x15e7ef3: mov rcx, qword ptr [rcx + 0x108]
0x15e7efa: test rcx, rcx
0x15e7efd: je 0x1415e7f11
0x15e7eff: mov rax, qword ptr [rcx]
0x15e7f02: xor edx, edx
0x15e7f04: call qword ptr [rax + 8]
0x15e7f07: test rax, rax
0x15e7f0a: je 0x1415e7f11
0x15e7f0c: cmp byte ptr [rax], 0
0x15e7f0f: jne 0x1415e7ede
0x15e7f11: lea rax, [rip + 0x3fa8b48]
0x15e7f18: add rsp, 0x20
0x15e7f1c: pop rbx
0x15e7f1d: ret 
0x15e7f1e: mov rcx, qword ptr [rcx + 0x108]
0x15e7f25: xor edx, edx
0x15e7f27: mov rax, qword ptr [rcx]
0x15e7f2a: add rsp, 0x20
0x15e7f2e: pop rbx
0x15e7f2f: jmp qword ptr [rax + 8]