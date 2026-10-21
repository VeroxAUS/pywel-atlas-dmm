0xe02b10: mov qword ptr [rsp + 0x10], rbx
0xe02b15: mov qword ptr [rsp + 0x20], r9
0xe02b1a: push rbp
0xe02b1b: push rsi
0xe02b1c: push rdi
0xe02b1d: push r12
0xe02b1f: push r13
0xe02b21: push r14
0xe02b23: push r15
0xe02b25: sub rsp, 0x30
0xe02b29: mov esi, r8d
0xe02b2c: mov r13, rdx
0xe02b2f: mov rdi, rcx
0xe02b32: cmp dword ptr [rcx], 0
0xe02b35: jne 0x140e02b3f
0xe02b37: mov edx, r8d
0xe02b3a: call 0x140391680
0xe02b3f: mov r10d, dword ptr [rdi]
0xe02b42: lea r14, [rdi + 0x10]
0xe02b46: test r10d, r10d
0xe02b49: je 0x140e02b90
0xe02b4b: xor edx, edx
0xe02b4d: mov eax, esi
0xe02b4f: div r10d
0xe02b52: mov r8d, edx
0xe02b55: shl r8, 8
0xe02b59: add r8, qword ptr [r14]
0xe02b5c: xor edx, edx
0xe02b5e: mov r9d, dword ptr [r8]
0xe02b61: test r9d, r9d
0xe02b64: je 0x140e02b90
0xe02b66: cmp dword ptr [r8 + rdx*8 + 8], esi
0xe02b6b: jne 0x140e02b89
0xe02b6d: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe02b72: mov rax, qword ptr [rdi + 0x18]
0xe02b76: mov rbx, qword ptr [rax + rcx*8]
0xe02b7a: mov rax, qword ptr [r13]
0xe02b7e: mov ecx, dword ptr [rax]
0xe02b80: cmp dword ptr [rbx + 4], ecx
0xe02b83: je 0x140e02c4b
0xe02b89: inc edx
0xe02b8b: cmp edx, r9d
0xe02b8e: jb 0x140e02b66
0xe02b90: mov rax, qword ptr [rsp + 0x98]
0xe02b98: mov byte ptr [rax], 0
0xe02b9b: xor edx, edx
0xe02b9d: mov eax, esi
0xe02b9f: div r10d
0xe02ba2: mov ecx, edx
0xe02ba4: shl rcx, 8
0xe02ba8: mov rax, qword ptr [r14]
0xe02bab: cmp dword ptr [rcx + rax], 0x1f
0xe02baf: jne 0x140e02bc1
0xe02bb1: mov edx, esi
0xe02bb3: mov rcx, rdi
0xe02bb6: call 0x140391680
0xe02bbb: xor edx, edx
0xe02bbd: mov eax, esi
0xe02bbf: div dword ptr [rdi]
0xe02bc1: mov r8d, edx
0xe02bc4: shl r8, 8
0xe02bc8: add r8, qword ptr [r14]
0xe02bcb: mov qword ptr [rsp + 0x28], r8
0xe02bd0: mov ecx, dword ptr [r8]
0xe02bd3: mov dword ptr [rsp + 0x70], ecx
0xe02bd7: imul eax, edx, 0x1f
0xe02bda: add eax, ecx
0xe02bdc: mov dword ptr [rsp + 0x20], eax
0xe02be0: lea r14, [rdi + 4]
0xe02be4: mov r15d, dword ptr [r14]
0xe02be7: mov dword ptr [rsp + 0xb0], r15d
0xe02bef: lea r12, [rdi + 8]
0xe02bf3: mov ecx, dword ptr [r12]
0xe02bf7: mov rbp, r14
0xe02bfa: mov edx, 0x1fd
0xe02bff: cmp r15d, ecx
0xe02c02: jb 0x140e02d27
0xe02c08: lea eax, [r15 + 1]
0xe02c0c: cmp eax, ecx
0xe02c0e: jbe 0x140e02d27
0xe02c14: lea eax, [rax + rax*2]
0xe02c17: inc eax
0xe02c19: shr eax, 1
0xe02c1b: mov dword ptr [rsp + 0x90], eax
0xe02c22: lea ecx, [rax*8]
0xe02c29: mov r15d, edx
0xe02c2c: mov rax, qword ptr gs:[0x58]
0xe02c35: mov rdx, qword ptr [rax]
0xe02c38: cmp byte ptr [r15 + rdx], 0
0xe02c3d: mov edx, 0x40
0xe02c42: je 0x140e02c64
0xe02c44: call 0x1447efa78
0xe02c49: jmp 0x140e02c69
0xe02c4b: test rbx, rbx
0xe02c4e: je 0x140e02b90
0xe02c54: mov rax, qword ptr [rsp + 0x98]
0xe02c5c: mov byte ptr [rax], 1
0xe02c5f: jmp 0x140e02dc5
0xe02c64: call 0x1447ef9b0
0xe02c69: mov rbp, rax
0xe02c6c: test rax, rax
0xe02c6f: jne 0x140e02c94
0xe02c71: call 0x141318e70
0xe02c76: xor r9d, r9d
0xe02c79: xor r8d, r8d
0xe02c7c: mov edx, 1
0xe02c81: mov ecx, 0xa0000002
0xe02c86: call qword ptr [rip + 0x43e84bc]
0xe02c8c: lea r14, [rdi + 4]
0xe02c90: lea r12, [rdi + 8]
0xe02c94: lea rbx, [rdi + 0x18]
0xe02c98: cmp qword ptr [rbx], 0
0xe02c9c: je 0x140e02d03
0xe02c9e: xor r8d, r8d
0xe02ca1: mov rcx, rbx
0xe02ca4: cmp dword ptr [r14], r8d
0xe02ca7: jbe 0x140e02cd9
0xe02ca9: nop dword ptr [rax]
0xe02cb0: lea rdx, [r8*8]
0xe02cb8: mov rax, qword ptr [rbx]
0xe02cbb: mov rcx, qword ptr [rdx + rax]
0xe02cbf: mov qword ptr [rdx + rbp], rcx
0xe02cc3: inc r8d
0xe02cc6: cmp r8d, dword ptr [r14]
0xe02cc9: jb 0x140e02cb0
0xe02ccb: mov r15d, 0x1fd
0xe02cd1: lea rcx, [rdi + 0x18]
0xe02cd5: lea r12, [rdi + 8]
0xe02cd9: mov rbx, rcx
0xe02cdc: mov rcx, qword ptr [rcx]
0xe02cdf: test rcx, rcx
0xe02ce2: je 0x140e02d03
0xe02ce4: mov rax, qword ptr gs:[0x58]
0xe02ced: mov rdx, qword ptr [rax]
0xe02cf0: cmp byte ptr [r15 + rdx], 0
0xe02cf5: je 0x140e02cfe
0xe02cf7: call 0x1447f03bc
0xe02cfc: jmp 0x140e02d03
0xe02cfe: call 0x1447f02bc
0xe02d03: mov qword ptr [rbx], rbp
0xe02d06: mov eax, dword ptr [rsp + 0x90]
0xe02d0d: mov dword ptr [r12], eax
0xe02d11: lea rbp, [rdi + 4]
0xe02d15: mov r15d, dword ptr [rsp + 0xb0]
0xe02d1d: mov r8, qword ptr [rsp + 0x28]
0xe02d22: mov edx, 0x1fd
0xe02d27: mov eax, dword ptr [rsp + 0x70]
0xe02d2b: mov dword ptr [r8 + rax*8 + 8], esi
0xe02d30: mov dword ptr [r8 + rax*8 + 0xc], r15d
0xe02d35: inc dword ptr [r8]
0xe02d38: mov rax, qword ptr gs:[0x58]
0xe02d41: mov rcx, qword ptr [rax]
0xe02d44: cmp byte ptr [rdx + rcx], 0
0xe02d48: mov edx, 8
0xe02d4d: mov ecx, 0x10
0xe02d52: je 0x140e02d5b
0xe02d54: call 0x1447efa78
0xe02d59: jmp 0x140e02d60
0xe02d5b: call 0x1447ef9b0
0xe02d60: mov rbx, rax
0xe02d63: test rax, rax
0xe02d66: jne 0x140e02d87
0xe02d68: call 0x141318e70
0xe02d6d: xor r9d, r9d
0xe02d70: xor r8d, r8d
0xe02d73: mov edx, 1
0xe02d78: mov ecx, 0xa0000002
0xe02d7d: call qword ptr [rip + 0x43e83c5]
0xe02d83: lea rbp, [rdi + 4]
0xe02d87: mov qword ptr [rsp + 0x70], rbx
0xe02d8c: mov rax, qword ptr [r13]
0xe02d90: mov ecx, dword ptr [rax]
0xe02d92: mov eax, dword ptr [rsp + 0x20]
0xe02d96: mov dword ptr [rbx], eax
0xe02d98: mov dword ptr [rbx + 4], ecx
0xe02d9b: mov rax, qword ptr [rsp + 0x88]
0xe02da3: mov rax, qword ptr [rax]
0xe02da6: mov qword ptr [rbx + 8], 0
0xe02dae: test rax, rax
0xe02db1: je 0x140e02db7
0xe02db3: mov qword ptr [rbx + 8], rax
0xe02db7: mov ecx, r15d
0xe02dba: mov rax, qword ptr [rdi + 0x18]
0xe02dbe: mov qword ptr [rax + rcx*8], rbx
0xe02dc2: inc dword ptr [rbp]
0xe02dc5: lea rcx, [rbx + 4]
0xe02dc9: mov rax, qword ptr [rsp + 0xa0]
0xe02dd1: mov qword ptr [rax], rcx
0xe02dd4: lea rcx, [rbx + 8]
0xe02dd8: mov rax, qword ptr [rsp + 0xa8]
0xe02de0: mov qword ptr [rax], rcx
0xe02de3: mov rbx, qword ptr [rsp + 0x78]
0xe02de8: add rsp, 0x30
0xe02dec: pop r15
0xe02dee: pop r14
0xe02df0: pop r13
0xe02df2: pop r12
0xe02df4: pop rdi
0xe02df5: pop rsi
0xe02df6: pop rbp
0xe02df7: ret 