0x3ed5b40: mov dword ptr [rsp + 0x18], r8d
0x3ed5b45: mov qword ptr [rsp + 0x10], rdx
0x3ed5b4a: push rbp
0x3ed5b4b: push rbx
0x3ed5b4c: push rsi
0x3ed5b4d: push rdi
0x3ed5b4e: push r12
0x3ed5b50: push r13
0x3ed5b52: push r14
0x3ed5b54: push r15
0x3ed5b56: mov rbp, rsp
0x3ed5b59: sub rsp, 0x68
0x3ed5b5d: mov r13d, r8d
0x3ed5b60: mov rsi, rdx
0x3ed5b63: mov r15, rcx
0x3ed5b66: mov rax, qword ptr [rcx + 0xa0]
0x3ed5b6d: test rax, rax
0x3ed5b70: je 0x143ed5b7d
0x3ed5b72: cmp qword ptr [rax + 8], 0
0x3ed5b77: jne 0x143ed6166
0x3ed5b7d: xor r14d, r14d
0x3ed5b80: mov ebx, r14d
0x3ed5b83: mov qword ptr [rbp - 0x48], rbx
0x3ed5b87: test rdx, rdx
0x3ed5b8a: je 0x143ed5bab
0x3ed5b8c: mov rbx, rdx
0x3ed5b8f: mov qword ptr [rbp - 0x48], rdx
0x3ed5b93: cmp byte ptr [rdx + 0x14], r14b
0x3ed5b97: je 0x143ed5b9f
0x3ed5b99: lock inc dword ptr [rdx + 0x10]
0x3ed5b9d: jmp 0x143ed5ba7
0x3ed5b9f: mov eax, dword ptr [rdx + 0x10]
0x3ed5ba2: inc eax
0x3ed5ba4: mov dword ptr [rdx + 0x10], eax
0x3ed5ba7: mov byte ptr [rdx + 0x16], 1
0x3ed5bab: mov rcx, rdx
0x3ed5bae: call 0x143ed59a0
0x3ed5bb3: mov rax, qword ptr [r15 + 0xa0]
0x3ed5bba: test rax, rax
0x3ed5bbd: je 0x143ed5bdc
0x3ed5bbf: cmp qword ptr [rax + 0x58], 0
0x3ed5bc4: je 0x143ed5bdc
0x3ed5bc6: cmp r13d, -1
0x3ed5bca: je 0x143ed5bdc
0x3ed5bcc: cmp r13d, dword ptr [rax + 0x90]
0x3ed5bd3: jb 0x143ed5bdc
0x3ed5bd5: inc r13d
0x3ed5bd8: mov dword ptr [rbp + 0x58], r13d
0x3ed5bdc: mov r9d, dword ptr [r15 + 0x48]
0x3ed5be0: mov dword ptr [rbp + 0x60], r9d
0x3ed5be4: mov ecx, dword ptr [r15 + 0x4c]
0x3ed5be8: cmp r9d, r13d
0x3ed5beb: ja 0x143ed5c73
0x3ed5bf1: mov eax, 1
0x3ed5bf6: cmp ecx, r9d
0x3ed5bf9: ja 0x143ed5c1b
0x3ed5bfb: lea edx, [rcx*2 + 1]
0x3ed5c02: add edx, ecx
0x3ed5c04: shr edx, 1
0x3ed5c06: cmp edx, eax
0x3ed5c08: cmovb edx, eax
0x3ed5c0b: cmp r9d, edx
0x3ed5c0e: cmova edx, r9d
0x3ed5c12: lea rcx, [r15 + 0x40]
0x3ed5c16: call 0x1403d3080
0x3ed5c1b: mov ecx, dword ptr [r15 + 0x48]
0x3ed5c1f: mov rax, qword ptr [r15 + 0x40]
0x3ed5c23: lea rdx, [rax + rcx*8]
0x3ed5c27: mov qword ptr [rdx], rbx
0x3ed5c2a: test rbx, rbx
0x3ed5c2d: je 0x143ed5c6a
0x3ed5c2f: cmp byte ptr [rbx + 0x15], 0
0x3ed5c33: je 0x143ed5c41
0x3ed5c35: mov qword ptr [rdx], r14
0x3ed5c38: inc dword ptr [r15 + 0x48]
0x3ed5c3c: jmp 0x143ed5d57
0x3ed5c41: cmp byte ptr [rbx + 0x14], 0
0x3ed5c45: je 0x143ed5c5b
0x3ed5c47: lock inc dword ptr [rbx + 0x10]
0x3ed5c4b: mov rax, qword ptr [rdx]
0x3ed5c4e: mov byte ptr [rax + 0x16], 1
0x3ed5c52: inc dword ptr [r15 + 0x48]
0x3ed5c56: jmp 0x143ed5d57
0x3ed5c5b: mov eax, dword ptr [rbx + 0x10]
0x3ed5c5e: inc eax
0x3ed5c60: mov dword ptr [rbx + 0x10], eax
0x3ed5c63: mov rax, qword ptr [rdx]
0x3ed5c66: mov byte ptr [rax + 0x16], 1
0x3ed5c6a: inc dword ptr [r15 + 0x48]
0x3ed5c6e: jmp 0x143ed5d57
0x3ed5c73: lea eax, [r9 + 1]
0x3ed5c77: mov r8d, 1
0x3ed5c7d: cmp ecx, eax
0x3ed5c7f: ja 0x143ed5ca3
0x3ed5c81: lea edx, [rcx*2 + 1]
0x3ed5c88: add edx, ecx
0x3ed5c8a: shr edx, 1
0x3ed5c8c: cmp edx, r8d
0x3ed5c8f: cmovb edx, r8d
0x3ed5c93: cmp r9d, edx
0x3ed5c96: cmova edx, r9d
0x3ed5c9a: lea rcx, [r15 + 0x40]
0x3ed5c9e: call 0x1403d3080
0x3ed5ca3: mov ecx, dword ptr [r15 + 0x48]
0x3ed5ca7: mov rax, qword ptr [r15 + 0x40]
0x3ed5cab: mov qword ptr [rax + rcx*8], r14
0x3ed5caf: lea eax, [r13 + 1]
0x3ed5cb3: mov edx, dword ptr [r15 + 0x48]
0x3ed5cb7: cmp edx, eax
0x3ed5cb9: jb 0x143ed5d07
0x3ed5cbb: mov esi, eax
0x3ed5cbd: nop dword ptr [rax]
0x3ed5cc0: mov rcx, qword ptr [r15 + 0x40]
0x3ed5cc4: lea eax, [rdx - 1]
0x3ed5cc7: mov dword ptr [rbp + 0x48], eax
0x3ed5cca: lea r13, [rcx + rax*8]
0x3ed5cce: mov eax, edx
0x3ed5cd0: lea rdi, [rcx + rax*8]
0x3ed5cd4: cmp r13, rdi
0x3ed5cd7: je 0x143ed5cf8
0x3ed5cd9: mov rcx, rdi
0x3ed5cdc: call 0x14038ad90
0x3ed5ce1: mov rax, qword ptr [r13]
0x3ed5ce5: mov qword ptr [rdi], rax
0x3ed5ce8: mov qword ptr [r13], r14
0x3ed5cec: mov rax, qword ptr [rdi]
0x3ed5cef: test rax, rax
0x3ed5cf2: je 0x143ed5cf8
0x3ed5cf4: mov byte ptr [rax + 0x16], 1
0x3ed5cf8: mov edx, dword ptr [rbp + 0x48]
0x3ed5cfb: cmp edx, esi
0x3ed5cfd: jae 0x143ed5cc0
0x3ed5cff: mov rsi, qword ptr [rbp + 0x50]
0x3ed5d03: mov r13d, dword ptr [rbp + 0x58]
0x3ed5d07: inc dword ptr [r15 + 0x48]
0x3ed5d0b: mov eax, r13d
0x3ed5d0e: lea rdi, [rax*8]
0x3ed5d16: mov rcx, qword ptr [r15 + 0x40]
0x3ed5d1a: add rcx, rdi
0x3ed5d1d: call 0x14038ad90
0x3ed5d22: mov rcx, qword ptr [r15 + 0x40]
0x3ed5d26: mov qword ptr [rcx + rdi], rbx
0x3ed5d2a: test rbx, rbx
0x3ed5d2d: je 0x143ed5d57
0x3ed5d2f: cmp byte ptr [rbx + 0x15], 0
0x3ed5d33: je 0x143ed5d3b
0x3ed5d35: mov qword ptr [rcx + rdi], r14
0x3ed5d39: jmp 0x143ed5d57
0x3ed5d3b: cmp byte ptr [rbx + 0x14], 0
0x3ed5d3f: je 0x143ed5d47
0x3ed5d41: lock inc dword ptr [rbx + 0x10]
0x3ed5d45: jmp 0x143ed5d4f
0x3ed5d47: mov eax, dword ptr [rbx + 0x10]
0x3ed5d4a: inc eax
0x3ed5d4c: mov dword ptr [rbx + 0x10], eax
0x3ed5d4f: mov rax, qword ptr [rcx + rdi]
0x3ed5d53: mov byte ptr [rax + 0x16], 1
0x3ed5d57: mov r10, qword ptr [r15 + 0xa0]
0x3ed5d5e: test r10, r10
0x3ed5d61: je 0x143ed5d97
0x3ed5d63: mov r8, qword ptr [r10 + 0x58]
0x3ed5d67: test r8, r8
0x3ed5d6a: je 0x143ed5d97
0x3ed5d6c: mov ecx, r14d
0x3ed5d6f: mov edx, dword ptr [r15 + 0x48]
0x3ed5d73: test edx, edx
0x3ed5d75: je 0x143ed5d97
0x3ed5d77: mov r9, qword ptr [r15 + 0x40]
0x3ed5d7b: nop dword ptr [rax + rax]
0x3ed5d80: mov eax, ecx
0x3ed5d82: cmp r8, qword ptr [r9 + rax*8]
0x3ed5d86: je 0x143ed5d90
0x3ed5d88: inc ecx
0x3ed5d8a: cmp ecx, edx
0x3ed5d8c: jb 0x143ed5d80
0x3ed5d8e: jmp 0x143ed5d97
0x3ed5d90: mov dword ptr [r10 + 0x90], ecx
0x3ed5d97: mov qword ptr [rsi + 0x38], r15
0x3ed5d9b: xor edx, edx
0x3ed5d9d: mov rcx, qword ptr [r15 + 0x18]
0x3ed5da1: call 0x1435b6460
0x3ed5da6: xor r12b, r12b
0x3ed5da9: mov rax, qword ptr [r15 + 0x20]
0x3ed5dad: mov r8, qword ptr [rax + 0x28]
0x3ed5db1: test r8, r8
0x3ed5db4: je 0x143ed5e0c
0x3ed5db6: lea rcx, [rsi + 0xa0]
0x3ed5dbd: test byte ptr [rsi + 0xb6], 8
0x3ed5dc4: je 0x143ed5df8
0x3ed5dc6: mov rax, qword ptr [rcx]
0x3ed5dc9: test rax, rax
0x3ed5dcc: je 0x143ed5dde
0x3ed5dce: cmp qword ptr [rax + 8], 0
0x3ed5dd3: je 0x143ed5dde
0x3ed5dd5: lea rax, [rsi + 0x20]
0x3ed5dd9: mov r12b, 1
0x3ed5ddc: jmp 0x143ed5dff
0x3ed5dde: lea rax, [rsi + 0x20]
0x3ed5de2: mov r9, qword ptr [rax]
0x3ed5de5: test r9, r9
0x3ed5de8: je 0x143ed5df3
0x3ed5dea: mov rdx, rax
0x3ed5ded: cmp qword ptr [r9 + 0x28], r8
0x3ed5df1: je 0x143ed5dfc
0x3ed5df3: mov r12b, 1
0x3ed5df6: jmp 0x143ed5dff
0x3ed5df8: lea rdx, [rsi + 0x20]
0x3ed5dfc: mov rax, rdx
0x3ed5dff: cmp qword ptr [rcx], 0
0x3ed5e03: jne 0x143ed5e0c
0x3ed5e05: mov rax, qword ptr [rax]
0x3ed5e08: mov qword ptr [rax + 0x28], r8
0x3ed5e0c: lea rcx, [rbp - 0x30]
0x3ed5e10: call 0x1435b97b0
0x3ed5e15: nop 
0x3ed5e16: movzx eax, byte ptr [r15 + 0x94]
0x3ed5e1e: mov byte ptr [rbp - 0x18], al
0x3ed5e21: movzx eax, word ptr [r15 + 0x8a]
0x3ed5e29: mov word ptr [rbp - 0x16], ax
0x3ed5e2d: mov word ptr [rbp - 0x13], 0x101
0x3ed5e33: mov rbx, qword ptr [rip + 0x2e538ce]
0x3ed5e3a: mov edi, dword ptr [rip + 0x2e538d0]
0x3ed5e40: add rdi, rbx
0x3ed5e43: cmp rbx, rdi
0x3ed5e46: je 0x143ed5ee4
0x3ed5e4c: mov r13d, 1
0x3ed5e52: lea rsi, [rip + 0x2db7327]
0x3ed5e59: nop dword ptr [rax]
0x3ed5e60: movzx eax, byte ptr [rbx]
0x3ed5e63: mov byte ptr [rbp + 0x48], al
0x3ed5e66: lea r8, [rbp + 0x48]
0x3ed5e6a: lea rdx, [rbp - 0x40]
0x3ed5e6e: mov rcx, qword ptr [r15 + 0x20]
0x3ed5e72: call 0x1435c8ef0
0x3ed5e77: mov rcx, rax
0x3ed5e7a: call 0x140615320
0x3ed5e7f: movzx ecx, byte ptr [rax + 0xc]
0x3ed5e83: mov rcx, qword ptr [rsi + rcx*8]
0x3ed5e87: mov rdx, rax
0x3ed5e8a: mov rcx, qword ptr [rcx + 0x18]
0x3ed5e8e: call 0x143598390
0x3ed5e93: test al, al
0x3ed5e95: jne 0x143ed5ed4
0x3ed5e97: mov ecx, dword ptr [rbp - 0x24]
0x3ed5e9a: mov eax, dword ptr [rbp - 0x28]
0x3ed5e9d: cmp ecx, eax
0x3ed5e9f: ja 0x143ed5ec4
0x3ed5ea1: lea edx, [rcx*2 + 1]
0x3ed5ea8: add edx, ecx
0x3ed5eaa: shr edx, 1
0x3ed5eac: cmp edx, r13d
0x3ed5eaf: cmovb edx, r13d
0x3ed5eb3: cmp eax, edx
0x3ed5eb5: cmova edx, eax
0x3ed5eb8: lea rcx, [rbp - 0x30]
0x3ed5ebc: call 0x1403d2be0
0x3ed5ec1: mov eax, dword ptr [rbp - 0x28]
0x3ed5ec4: mov edx, eax
0x3ed5ec6: movzx ecx, byte ptr [rbp + 0x48]
0x3ed5eca: mov rax, qword ptr [rbp - 0x30]
0x3ed5ece: mov byte ptr [rdx + rax], cl
0x3ed5ed1: inc dword ptr [rbp - 0x28]
0x3ed5ed4: inc rbx
0x3ed5ed7: cmp rbx, rdi
0x3ed5eda: jne 0x143ed5e60
0x3ed5edc: mov rsi, qword ptr [rbp + 0x50]
0x3ed5ee0: mov r13d, dword ptr [rbp + 0x58]
0x3ed5ee4: lea rdx, [rbp - 0x30]
0x3ed5ee8: mov rcx, rsi
0x3ed5eeb: call 0x143ed8720
0x3ed5ef0: nop 
0x3ed5ef1: mov rcx, qword ptr [rbp - 0x30]
0x3ed5ef5: test rcx, rcx
0x3ed5ef8: je 0x143ed5f1f
0x3ed5efa: mov r8d, 0x1fd
0x3ed5f00: mov rax, qword ptr gs:[0x58]
0x3ed5f09: mov rdx, qword ptr [rax]
0x3ed5f0c: cmp byte ptr [r8 + rdx], 0
0x3ed5f11: je 0x143ed5f1a
0x3ed5f13: call 0x1447f03bc
0x3ed5f18: jmp 0x143ed5f1f
0x3ed5f1a: call 0x1447f02bc
0x3ed5f1f: mov qword ptr [rbp - 0x30], r14
0x3ed5f23: mov qword ptr [rbp - 0x28], r14
0x3ed5f27: mov rax, qword ptr [r15 + 0xa0]
0x3ed5f2e: test rax, rax
0x3ed5f31: je 0x143ed5f45
0x3ed5f33: cmp qword ptr [rax + 8], 0
0x3ed5f38: je 0x143ed5f45
0x3ed5f3a: mov rcx, qword ptr [r15 + 0x38]
0x3ed5f3e: call 0x143ed8430
0x3ed5f43: jmp 0x143ed5f7b
0x3ed5f45: movzx edx, word ptr [r15 + 0x8a]
0x3ed5f4d: mov eax, 0xffff
0x3ed5f52: cmp dx, ax
0x3ed5f55: je 0x143ed5fb8
0x3ed5f57: mov rax, qword ptr [r15 + 0x58]
0x3ed5f5b: mov rcx, qword ptr [rax + 0xb0]
0x3ed5f62: mov r8, qword ptr [rcx + 0xb8]
0x3ed5f69: cmp edx, dword ptr [r8 + 8]
0x3ed5f6d: jb 0x143ed5f74
0x3ed5f6f: mov rax, r14
0x3ed5f72: jmp 0x143ed5f7b
0x3ed5f74: mov rax, qword ptr [r8]
0x3ed5f77: mov rax, qword ptr [rax + rdx*8]
0x3ed5f7b: test rax, rax
0x3ed5f7e: je 0x143ed5fb8
0x3ed5f80: mov rcx, qword ptr [rax + 0xa0]
0x3ed5f87: test rcx, rcx
0x3ed5f8a: je 0x143ed5f92
0x3ed5f8c: mov rcx, qword ptr [rcx + 0x10]
0x3ed5f90: jmp 0x143ed5f95
0x3ed5f92: mov rcx, r14
0x3ed5f95: mov byte ptr [rcx + 0x247], 1
0x3ed5f9c: mov rcx, qword ptr [rax + 0xa0]
0x3ed5fa3: test rcx, rcx
0x3ed5fa6: je 0x143ed5fae
0x3ed5fa8: mov rcx, qword ptr [rcx + 0x10]
0x3ed5fac: jmp 0x143ed5fb1
0x3ed5fae: mov rcx, r14
0x3ed5fb1: mov dl, 1
0x3ed5fb3: call 0x143d3d650
0x3ed5fb8: mov rcx, qword ptr [r15 + 0x58]
0x3ed5fbc: call 0x1410270d0
0x3ed5fc1: test al, al
0x3ed5fc3: jne 0x143ed6020
0x3ed5fc5: mov rax, qword ptr [r15 + 0xa0]
0x3ed5fcc: test rax, rax
0x3ed5fcf: je 0x143ed5fe3
0x3ed5fd1: cmp qword ptr [rax + 8], 0
0x3ed5fd6: je 0x143ed5fe3
0x3ed5fd8: mov rcx, qword ptr [r15 + 0x38]
0x3ed5fdc: call 0x143ed8480
0x3ed5fe1: jmp 0x143ed6014
0x3ed5fe3: movzx edx, byte ptr [r15 + 0x94]
0x3ed5feb: cmp dl, 0xff
0x3ed5fee: je 0x143ed6020
0x3ed5ff0: mov rax, qword ptr [r15 + 0x58]
0x3ed5ff4: mov rcx, qword ptr [rax + 0xb0]
0x3ed5ffb: mov r8, qword ptr [rcx + 0xb0]
0x3ed6002: cmp edx, dword ptr [r8 + 8]
0x3ed6006: jb 0x143ed600d
0x3ed6008: mov rax, r14
0x3ed600b: jmp 0x143ed6014
0x3ed600d: mov rax, qword ptr [r8]
0x3ed6010: mov rax, qword ptr [rax + rdx*8]
0x3ed6014: test rax, rax
0x3ed6017: je 0x143ed6020
0x3ed6019: mov byte ptr [rax + 0x136], 1
0x3ed6020: cmp dword ptr [r15 + 0xf0], 0
0x3ed6028: jne 0x143ed604e
0x3ed602a: lea rbx, [rsi + 0xa0]
0x3ed6031: mov rax, qword ptr [rbx]
0x3ed6034: test rax, rax
0x3ed6037: je 0x143ed6040
0x3ed6039: cmp qword ptr [rax + 8], 0
0x3ed603e: jne 0x143ed6060
0x3ed6040: mov rax, rbx
0x3ed6043: cmp dword ptr [rsi + 0x84], 0
0x3ed604a: je 0x143ed6060
0x3ed604c: jmp 0x143ed6055
0x3ed604e: lea rax, [rsi + 0xa0]
0x3ed6055: or byte ptr [r15 + 0xb3], 8
0x3ed605d: mov rbx, rax
0x3ed6060: mov rcx, rsi
0x3ed6063: call 0x143edcf10
0x3ed6068: test r12b, r12b
0x3ed606b: je 0x143ed6099
0x3ed606d: mov rcx, rsi
0x3ed6070: call 0x14063e140
0x3ed6075: mov rax, qword ptr [rbx]
0x3ed6078: test rax, rax
0x3ed607b: je 0x143ed6084
0x3ed607d: cmp qword ptr [rax + 8], 0
0x3ed6082: jne 0x143ed6099
0x3ed6084: mov rcx, qword ptr [rsi + 0x20]
0x3ed6088: test rcx, rcx
0x3ed608b: je 0x143ed6099
0x3ed608d: cmp qword ptr [rcx + 0x28], 0
0x3ed6092: je 0x143ed6099
0x3ed6094: call 0x1435c66a0
0x3ed6099: mov rax, qword ptr [rsi + 0xd8]
0x3ed60a0: test rax, rax
0x3ed60a3: je 0x143ed614e
0x3ed60a9: mov rdx, qword ptr [rsi + 0xa0]
0x3ed60b0: test rdx, rdx
0x3ed60b3: je 0x143ed60bf
0x3ed60b5: cmp qword ptr [rdx + 8], 0
0x3ed60ba: mov r8, r14
0x3ed60bd: jne 0x143ed60c2
0x3ed60bf: mov r8, rax
0x3ed60c2: cmp qword ptr [r8 + 0x10], 0
0x3ed60c7: je 0x143ed614e
0x3ed60cd: test rdx, rdx
0x3ed60d0: je 0x143ed60dc
0x3ed60d2: cmp qword ptr [rdx + 8], 0
0x3ed60d7: je 0x143ed60dc
0x3ed60d9: mov rax, r14
0x3ed60dc: test rax, rax
0x3ed60df: je 0x143ed614e
0x3ed60e1: mov rax, qword ptr [rsi + 0xd8]
0x3ed60e8: test rdx, rdx
0x3ed60eb: je 0x143ed60f7
0x3ed60ed: cmp qword ptr [rdx + 8], 0
0x3ed60f2: mov r8, r14
0x3ed60f5: jne 0x143ed60fa
0x3ed60f7: mov r8, rax
0x3ed60fa: cmp qword ptr [r8 + 0x10], 0
0x3ed60ff: je 0x143ed610d
0x3ed6101: test rdx, rdx
0x3ed6104: je 0x143ed6110
0x3ed6106: cmp qword ptr [rdx + 8], 0
0x3ed610b: je 0x143ed6110
0x3ed610d: mov rax, r14
0x3ed6110: cmp qword ptr [rax + 0x10], 0
0x3ed6115: je 0x143ed614e
0x3ed6117: mov rcx, qword ptr [rsi + 0xd8]
0x3ed611e: test rdx, rdx
0x3ed6121: je 0x143ed612d
0x3ed6123: cmp qword ptr [rdx + 8], 0
0x3ed6128: mov r8, r14
0x3ed612b: jne 0x143ed6130
0x3ed612d: mov r8, rcx
0x3ed6130: cmp qword ptr [r8 + 0x10], 0
0x3ed6135: je 0x143ed6146
0x3ed6137: test rdx, rdx
0x3ed613a: je 0x143ed6143
0x3ed613c: cmp qword ptr [rdx + 8], 0
0x3ed6141: jne 0x143ed6146
0x3ed6143: mov r14, rcx
0x3ed6146: mov rcx, r14
0x3ed6149: call 0x143e75970
0x3ed614e: cmp dword ptr [rbp + 0x60], r13d
0x3ed6152: jbe 0x143ed615d
0x3ed6154: mov rcx, r15
0x3ed6157: call 0x143ede590
0x3ed615c: nop 
0x3ed615d: lea rcx, [rbp - 0x48]
0x3ed6161: call 0x14038ad90
0x3ed6166: add rsp, 0x68
0x3ed616a: pop r15
0x3ed616c: pop r14
0x3ed616e: pop r13
0x3ed6170: pop r12
0x3ed6172: pop rdi
0x3ed6173: pop rsi
0x3ed6174: pop rbx
0x3ed6175: pop rbp
0x3ed6176: ret 