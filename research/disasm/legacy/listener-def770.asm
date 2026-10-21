0xdef770: mov qword ptr [rsp + 8], rbx
0xdef775: push rdi
0xdef776: sub rsp, 0x20
0xdef77a: cmp dword ptr [rcx + 0x15c], 0
0xdef781: mov rdi, r8
0xdef784: mov r10, rcx
0xdef787: je 0x140def7d7
0xdef789: mov ecx, dword ptr [rcx + 0x158]
0xdef78f: test ecx, ecx
0xdef791: je 0x140def7d7
0xdef793: mov r9d, dword ptr [rdx]
0xdef796: xor edx, edx
0xdef798: mov eax, r9d
0xdef79b: div ecx
0xdef79d: xor eax, eax
0xdef79f: mov r11d, edx
0xdef7a2: shl r11, 8
0xdef7a6: add r11, qword ptr [r10 + 0x168]
0xdef7ad: mov ebx, dword ptr [r11]
0xdef7b0: test ebx, ebx
0xdef7b2: je 0x140def7d7
0xdef7b4: cmp dword ptr [r11 + rax*8 + 8], r9d
0xdef7b9: jne 0x140def7d1
0xdef7bb: mov edx, dword ptr [r11 + rax*8 + 0xc]
0xdef7c0: mov rcx, qword ptr [r10 + 0x170]
0xdef7c7: mov r8, qword ptr [rcx + rdx*8]
0xdef7cb: cmp dword ptr [r8 + 4], r9d
0xdef7cf: je 0x140def7e4
0xdef7d1: inc eax
0xdef7d3: cmp eax, ebx
0xdef7d5: jb 0x140def7b4
0xdef7d7: xor eax, eax
0xdef7d9: mov rbx, qword ptr [rsp + 0x30]
0xdef7de: add rsp, 0x20
0xdef7e2: pop rdi
0xdef7e3: ret 
0xdef7e4: lea rcx, [r8 + 8]
0xdef7e8: test rcx, rcx
0xdef7eb: je 0x140def7d7
0xdef7ed: mov rdx, rdi
0xdef7f0: call 0x140de4500
0xdef7f5: test rax, rax
0xdef7f8: je 0x140def7d7
0xdef7fa: mov rax, qword ptr [rax]
0xdef7fd: mov rbx, qword ptr [rsp + 0x30]
0xdef802: add rsp, 0x20
0xdef806: pop rdi
0xdef807: ret 