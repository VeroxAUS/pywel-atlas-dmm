0xdb8a00: mov qword ptr [rsp + 8], rbx
0xdb8a05: mov qword ptr [rsp + 0x10], rbp
0xdb8a0a: mov qword ptr [rsp + 0x18], rsi
0xdb8a0f: push rdi
0xdb8a10: sub rsp, 0x20
0xdb8a14: mov rbp, rdx
0xdb8a17: mov rdi, rcx
0xdb8a1a: add rcx, 0x3c0
0xdb8a21: mov rdx, r8
0xdb8a24: mov rsi, r9
0xdb8a27: mov rbx, r8
0xdb8a2a: call 0x140de4500
0xdb8a2f: test rax, rax
0xdb8a32: je 0x140db8a3a
0xdb8a34: mov rax, qword ptr [rax + 0x28]
0xdb8a38: jmp 0x140db8a4b
0xdb8a3a: mov r9, rsi
0xdb8a3d: mov r8, rbx
0xdb8a40: mov rdx, rbp
0xdb8a43: mov rcx, rdi
0xdb8a46: call 0x140deffa0
0xdb8a4b: mov rbx, qword ptr [rsp + 0x30]
0xdb8a50: mov rbp, qword ptr [rsp + 0x38]
0xdb8a55: mov rsi, qword ptr [rsp + 0x40]
0xdb8a5a: add rsp, 0x20
0xdb8a5e: pop rdi
0xdb8a5f: ret 
0xdb8a60: mov dword ptr [rsp + 0x20], r9d
0xdb8a65: mov qword ptr [rsp + 0x18], r8
0xdb8a6a: mov word ptr [rsp + 0x10], dx
0xdb8a6f: push rbp
0xdb8a70: push rbx
0xdb8a71: push rsi
0xdb8a72: push rdi
0xdb8a73: push r12
0xdb8a75: push r13
0xdb8a77: push r14
0xdb8a79: push r15
0xdb8a7b: lea rbp, [rsp - 0x1f]
0xdb8a80: sub rsp, 0x88
0xdb8a87: mov rdi, r8
0xdb8a8a: mov r14, rcx
0xdb8a8d: mov rax, qword ptr [rcx + 8]
0xdb8a91: mov r10, qword ptr [rax + 0x58]
0xdb8a95: cmp byte ptr [r10 + 0x3133d], 0
0xdb8a9d: jne 0x140db8ac3
0xdb8a9f: vmovups xmm0, xmmword ptr [r8]
0xdb8aa4: vmovups xmmword ptr [rbp - 0x19], xmm0
0xdb8aa9: mov rax, qword ptr [rcx]
0xdb8aac: mov byte ptr [rsp + 0x20], 0
0xdb8ab1: lea r8, [rbp - 0x19]
0xdb8ab5: call qword ptr [rax + 0x560]
0xdb8abb: cmp al, 1
0xdb8abd: je 0x140db9775
0xdb8ac3: mov rax, qword ptr [r14]
0xdb8ac6: lea r9, [rbp + 0x7f]
0xdb8aca: mov r8, rdi
0xdb8acd: lea rdx, [rbp + 0x6f]
0xdb8ad1: mov rcx, r14
0xdb8ad4: call qword ptr [rax + 0x548]
0xdb8ada: mov r12, rax
0xdb8add: mov qword ptr [rbp - 0x31], rax
0xdb8ae1: test rax, rax
0xdb8ae4: je 0x140db9775
0xdb8aea: mov ebx, dword ptr [rax + 0x1c0]
0xdb8af0: lea rcx, [rbp + 0x6f]
0xdb8af4: call 0x140537250
0xdb8af9: mov r11d, dword ptr [rax]
0xdb8afc: mov dword ptr [rbp - 0x39], r11d
0xdb8b00: xor esi, esi
0xdb8b02: cmp dword ptr [r14 + 0x19c], esi
0xdb8b09: je 0x140db8b77
0xdb8b0b: mov ecx, dword ptr [r14 + 0x198]
0xdb8b12: test ecx, ecx
0xdb8b14: je 0x140db8b77
0xdb8b16: xor edx, edx
0xdb8b18: mov eax, r11d
0xdb8b1b: div ecx
0xdb8b1d: mov r8d, edx
0xdb8b20: shl r8, 8
0xdb8b24: add r8, qword ptr [r14 + 0x1a8]
0xdb8b2b: mov edx, esi
0xdb8b2d: mov r10d, dword ptr [r8]
0xdb8b30: test r10d, r10d
0xdb8b33: je 0x140db8b77
0xdb8b35: mov eax, edx
0xdb8b37: cmp dword ptr [r8 + rax*8 + 8], r11d
0xdb8b3c: jne 0x140db8b54
0xdb8b3e: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb8b43: mov rax, qword ptr [r14 + 0x1b0]
0xdb8b4a: mov r9, qword ptr [rax + rcx*8]
0xdb8b4e: cmp dword ptr [r9 + 4], r11d
0xdb8b52: je 0x140db8b5d
0xdb8b54: inc edx
0xdb8b56: cmp edx, r10d
0xdb8b59: jb 0x140db8b35
0xdb8b5b: jmp 0x140db8b77
0xdb8b5d: lea rcx, [r9 + 8]
0xdb8b61: test rcx, rcx
0xdb8b64: je 0x140db8b77
0xdb8b66: mov rdx, rdi
0xdb8b69: call 0x140de4500
0xdb8b6e: test rax, rax
0xdb8b71: jne 0x140db9775
0xdb8b77: lea rcx, [rbp + 0x6f]
0xdb8b7b: call 0x140537250
0xdb8b80: mov ecx, dword ptr [rax + 0x2c]
0xdb8b83: add ecx, -0x19
0xdb8b86: cmp ecx, 0x4f
0xdb8b89: ja 0x140db8e9f
0xdb8b8f: lea rdx, [rip - 0xdb8b96]  ; [0x0] = runtime global (no file value)
0xdb8b96: movzx eax, byte ptr [rdx + rcx + 0xdb97a4]
0xdb8b9e: mov ecx, dword ptr [rdx + rax*4 + 0xdb978c]
0xdb8ba5: add rcx, rdx
0xdb8ba8: jmp rcx
0xdb8baa: mov rcx, qword ptr [r14 + 0x5b8]
0xdb8bb1: test rcx, rcx
0xdb8bb4: je 0x140db8e9f
0xdb8bba: mov rax, qword ptr [r12 + 8]
0xdb8bbf: cmp qword ptr [rcx + 8], rax
0xdb8bc3: jne 0x140db8e9f
0xdb8bc9: mov qword ptr [r14 + 0x5b8], rsi
0xdb8bd0: mov byte ptr [r14 + 0xad0], sil
0xdb8bd7: jmp 0x140db8e9f
0xdb8bdc: movzx eax, word ptr [r12 + 0xdc]
0xdb8be5: mov word ptr [rbp + 0x67], ax
0xdb8be9: lea rcx, [rbp + 0x67]
0xdb8bed: call 0x140430280
0xdb8bf2: mov edx, dword ptr [r14 + 0x4e0]
0xdb8bf9: mov edi, esi
0xdb8bfb: test edx, edx
0xdb8bfd: je 0x140db8c22
0xdb8bff: mov r8, qword ptr [r14 + 0x4d8]
0xdb8c06: mov r9d, dword ptr [rax + 0x14]
0xdb8c0a: nop word ptr [rax + rax]
0xdb8c10: mov eax, edi
0xdb8c12: lea rcx, [rax + rax*4]
0xdb8c16: cmp dword ptr [r8 + rcx*8], r9d
0xdb8c1a: je 0x140db8c30
0xdb8c1c: inc edi
0xdb8c1e: cmp edi, edx
0xdb8c20: jb 0x140db8c10
0xdb8c22: xor dl, dl
0xdb8c24: mov byte ptr [r14 + 0xadd], dl
0xdb8c2b: jmp 0x140db8e9f
0xdb8c30: xor dl, dl
0xdb8c32: cmp edi, -1
0xdb8c35: je 0x140db8c24
0xdb8c37: mov r11d, edi
0xdb8c3a: lea r15, [r11 + r11*4]
0xdb8c3e: mov rax, qword ptr [r14 + 0x4d8]
0xdb8c45: lea r8, [rax + r15*8]
0xdb8c49: mov eax, dword ptr [r8 + 0x10]
0xdb8c4d: test eax, eax
0xdb8c4f: jne 0x140db8cb6
0xdb8c51: cmp dword ptr [r8 + 0x20], esi
0xdb8c55: jne 0x140db8cb6
0xdb8c57: mov rcx, r8
0xdb8c5a: call 0x140db7280
0xdb8c5f: mov eax, dword ptr [r14 + 0x4e0]
0xdb8c66: dec eax
0xdb8c68: cmp edi, eax
0xdb8c6a: jae 0x140db8ca1
0xdb8c6c: mov r8, qword ptr [r14 + 0x4d8]
0xdb8c73: lea rcx, [rax + rax*4]
0xdb8c77: lea rdx, [r8 + rcx*8]
0xdb8c7b: lea rcx, [r8 + r15*8]
0xdb8c7f: call 0x140de59e0
0xdb8c84: mov eax, dword ptr [r14 + 0x4e0]
0xdb8c8b: dec eax
0xdb8c8d: lea rcx, [rax + rax*4]
0xdb8c91: mov rax, qword ptr [r14 + 0x4d8]
0xdb8c98: lea rcx, [rax + rcx*8]
0xdb8c9c: call 0x140db7280
0xdb8ca1: dec dword ptr [r14 + 0x4e0]
0xdb8ca8: xor dl, dl
0xdb8caa: mov byte ptr [r14 + 0xadd], dl
0xdb8cb1: jmp 0x140db8e9f
0xdb8cb6: mov r8, qword ptr [r8 + 8]
0xdb8cba: lea rcx, [rax + rax*2]
0xdb8cbe: lea r10, [r8 + rcx*8]
0xdb8cc2: cmp r8, r10
0xdb8cc5: je 0x140db8d15
0xdb8cc7: nop word ptr [rax + rax]
0xdb8cd0: mov eax, dword ptr [r8 + 0x10]
0xdb8cd4: mov ecx, esi
0xdb8cd6: xor dl, dl
0xdb8cd8: test eax, eax
0xdb8cda: je 0x140db8cf0
0xdb8cdc: mov r9, qword ptr [r8 + 8]
0xdb8ce0: mov edx, ecx
0xdb8ce2: cmp qword ptr [r9 + rdx*8], r12
0xdb8ce6: je 0x140db8cfb
0xdb8ce8: inc ecx
0xdb8cea: cmp ecx, eax
0xdb8cec: jb 0x140db8ce0
0xdb8cee: xor dl, dl
0xdb8cf0: add r8, 0x18
0xdb8cf4: cmp r8, r10
0xdb8cf7: jne 0x140db8cd0
0xdb8cf9: jmp 0x140db8d15
0xdb8cfb: dec eax
0xdb8cfd: cmp ecx, eax
0xdb8cff: jae 0x140db8d0f
0xdb8d01: mov eax, dword ptr [r8 + 0x10]
0xdb8d05: dec eax
0xdb8d07: mov rcx, qword ptr [r9 + rax*8]
0xdb8d0b: mov qword ptr [r9 + rdx*8], rcx
0xdb8d0f: dec dword ptr [r8 + 0x10]
0xdb8d13: mov dl, 1
0xdb8d15: mov r9, qword ptr [r14 + 0x4d8]
0xdb8d1c: lea r10, [r11 + r11*4]
0xdb8d20: mov eax, esi
0xdb8d22: mov ecx, dword ptr [r9 + r10*8 + 0x20]
0xdb8d27: test ecx, ecx
0xdb8d29: je 0x140db8c24
0xdb8d2f: mov r10, qword ptr [r9 + r10*8 + 0x18]
0xdb8d34: mov r8d, eax
0xdb8d37: cmp r12, qword ptr [r10 + r8*8]
0xdb8d3b: je 0x140db8d4f
0xdb8d3d: inc eax
0xdb8d3f: cmp eax, ecx
0xdb8d41: jb 0x140db8d34
0xdb8d43: mov byte ptr [r14 + 0xadd], dl
0xdb8d4a: jmp 0x140db8e9f
0xdb8d4f: cmp eax, -1
0xdb8d52: je 0x140db8c24
0xdb8d58: lea rdx, [r11 + r11*4]
0xdb8d5c: dec ecx
0xdb8d5e: cmp eax, ecx
0xdb8d60: jae 0x140db8d6f
0xdb8d62: mov rax, qword ptr [r9 + rdx*8 + 0x18]
0xdb8d67: mov rcx, qword ptr [rax + rcx*8]
0xdb8d6b: mov qword ptr [r10 + r8*8], rcx
0xdb8d6f: dec dword ptr [r9 + rdx*8 + 0x20]
0xdb8d74: mov dl, 1
0xdb8d76: mov byte ptr [r14 + 0xadd], dl
0xdb8d7d: jmp 0x140db8e9f
0xdb8d82: mov byte ptr [r14 + 0x801], 1
0xdb8d8a: jmp 0x140db8e9f
0xdb8d8f: mov ecx, esi
0xdb8d91: lea rdi, [r14 + 0x1f8]
0xdb8d98: mov r15d, dword ptr [rdi + 4]
0xdb8d9c: test r15d, r15d
0xdb8d9f: jne 0x140db8db5
0xdb8da1: mov rdi, rsi
0xdb8da4: mov r8, rsi
0xdb8da7: mov r10d, 0xffffffff
0xdb8dad: mov r13d, r10d
0xdb8db0: mov r15d, r10d
0xdb8db3: jmp 0x140db8dc3
0xdb8db5: mov rax, qword ptr [rdi + 0x18]
0xdb8db9: mov r8, qword ptr [rax]
0xdb8dbc: mov r10d, esi
0xdb8dbf: mov r13d, dword ptr [rdi + 0xc]
0xdb8dc3: test r8, r8
0xdb8dc6: je 0x140db8e29
0xdb8dc8: cmp dword ptr [rdi + 0xc], r13d
0xdb8dcc: jne 0x140db8e29
0xdb8dce: mov r11, qword ptr [r8 + 8]
0xdb8dd2: mov r9d, dword ptr [r8 + 0x10]
0xdb8dd6: mov edx, esi
0xdb8dd8: test r9d, r9d
0xdb8ddb: je 0x140db8e12
0xdb8ddd: mov rax, r11
0xdb8de0: cmp qword ptr [rax], r12
0xdb8de3: je 0x140db8df2
0xdb8de5: inc edx
0xdb8de7: add rax, 8
0xdb8deb: cmp edx, r9d
0xdb8dee: jb 0x140db8de0
0xdb8df0: jmp 0x140db8e12
0xdb8df2: cmp edx, -1
0xdb8df5: je 0x140db8e12
0xdb8df7: dec r9d
0xdb8dfa: cmp edx, r9d
0xdb8dfd: jae 0x140db8e07
0xdb8dff: mov rax, qword ptr [r11 + r9*8]
0xdb8e03: mov qword ptr [r11 + rdx*8], rax
0xdb8e07: sub dword ptr [r8 + 0x10], 1
0xdb8e0c: jne 0x140db8e12
0xdb8e0e: mov ecx, dword ptr [r8 + 4]
0xdb8e12: inc r10d
0xdb8e15: cmp r10d, r15d
0xdb8e18: jae 0x140db8e24
0xdb8e1a: mov rax, qword ptr [rdi + 0x18]
0xdb8e1e: mov r8, qword ptr [rax + r10*8]
0xdb8e22: jmp 0x140db8dc3
0xdb8e24: mov r8, rsi
0xdb8e27: jmp 0x140db8dc3
0xdb8e29: test ecx, ecx
0xdb8e2b: je 0x140db8e9f
0xdb8e2d: lea r10, [r14 + 0x1f8]
0xdb8e34: cmp dword ptr [r10 + 4], esi
0xdb8e38: je 0x140db8e9f
0xdb8e3a: inc dword ptr [r10 + 0xc]
0xdb8e3e: mov r8d, dword ptr [r10]
0xdb8e41: test r8d, r8d
0xdb8e44: je 0x140db8e9f
0xdb8e46: xor edx, edx
0xdb8e48: mov eax, ecx
0xdb8e4a: div r8d
0xdb8e4d: mov r9d, edx
0xdb8e50: shl r9, 8
0xdb8e54: add r9, qword ptr [r10 + 0x10]
0xdb8e58: mov r8d, esi
0xdb8e5b: mov edi, dword ptr [r9]
0xdb8e5e: test edi, edi
0xdb8e60: je 0x140db8e9f
0xdb8e62: mov eax, r8d
0xdb8e65: cmp dword ptr [r9 + rax*8 + 8], ecx
0xdb8e6a: jne 0x140db8e7e
0xdb8e6c: mov r11d, dword ptr [r9 + rax*8 + 0xc]
0xdb8e71: mov rax, qword ptr [r10 + 0x18]
0xdb8e75: mov rdx, qword ptr [rax + r11*8]
0xdb8e79: cmp dword ptr [rdx + 4], ecx
0xdb8e7c: je 0x140db8e88
0xdb8e7e: inc r8d
0xdb8e81: cmp r8d, edi
0xdb8e84: jb 0x140db8e62
0xdb8e86: jmp 0x140db8e9f
0xdb8e88: mov edx, r11d
0xdb8e8b: mov rcx, r10
0xdb8e8e: call 0x140465c80
0xdb8e93: jmp 0x140db8e9f
0xdb8e95: mov dl, 1
0xdb8e97: mov rcx, r14
0xdb8e9a: call 0x140dc35c0
0xdb8e9f: mov r13, qword ptr [r12 + 8]
0xdb8ea4: test r13, r13
0xdb8ea7: je 0x140db9775
0xdb8ead: lea rcx, [r12 + 0xde]
0xdb8eb5: call 0x140537250
0xdb8eba: cmp byte ptr [rax + 0xb5], sil
0xdb8ec1: je 0x140db8f11
0xdb8ec3: mov ecx, esi
0xdb8ec5: mov eax, dword ptr [r14 + 0x500]
0xdb8ecc: test eax, eax
0xdb8ece: je 0x140db8f11
0xdb8ed0: mov r8, qword ptr [r14 + 0x4f8]
0xdb8ed7: mov edx, ecx
0xdb8ed9: cmp r12, qword ptr [r8 + rdx*8]
0xdb8edd: je 0x140db8ee7
0xdb8edf: inc ecx
0xdb8ee1: cmp ecx, eax
0xdb8ee3: jb 0x140db8ed7
0xdb8ee5: jmp 0x140db8f11
0xdb8ee7: cmp ecx, -1
0xdb8eea: je 0x140db8f11
0xdb8eec: mov eax, dword ptr [r14 + 0x500]
0xdb8ef3: dec eax
0xdb8ef5: cmp ecx, eax
0xdb8ef7: jae 0x140db8f0a
0xdb8ef9: mov ecx, eax
0xdb8efb: mov rax, qword ptr [r14 + 0x4f8]
0xdb8f02: mov rcx, qword ptr [rax + rcx*8]
0xdb8f06: mov qword ptr [r8 + rdx*8], rcx
0xdb8f0a: dec dword ptr [r14 + 0x500]
0xdb8f11: lea rcx, [r12 + 0xde]
0xdb8f19: call 0x140537250
0xdb8f1e: cmp dword ptr [rax + 0x2c], 0x4e
0xdb8f22: jne 0x140db8ffc
0xdb8f28: lea rax, [rbp + 7]
0xdb8f2c: mov qword ptr [rbp - 9], rax
0xdb8f30: mov dword ptr [rbp - 1], esi
0xdb8f33: mov dword ptr [rbp + 3], 2
0xdb8f3a: mov edx, dword ptr [rbp - 1]
0xdb8f3d: mov ecx, dword ptr [rip + 0x5f11395]  ; [0x6cca2d8] = runtime global (no file value)
0xdb8f43: mov rax, qword ptr [rbp - 9]
0xdb8f47: mov dword ptr [rax + rdx*4], ecx
0xdb8f4a: mov eax, dword ptr [rbp - 1]
0xdb8f4d: inc eax
0xdb8f4f: mov dword ptr [rbp - 1], eax
0xdb8f52: cmp eax, dword ptr [rbp + 3]
0xdb8f55: jb 0x140db8f65
0xdb8f57: xor edx, edx
0xdb8f59: lea rcx, [rbp - 9]
0xdb8f5d: call 0x14038f1e0
0xdb8f62: mov eax, dword ptr [rbp - 1]
0xdb8f65: mov edx, eax
0xdb8f67: mov ecx, dword ptr [rip + 0x5f0fb4b]  ; [0x6cc8ab8] = runtime global (no file value)
0xdb8f6d: mov rax, qword ptr [rbp - 9]
0xdb8f71: mov dword ptr [rax + rdx*4], ecx
0xdb8f74: mov ecx, dword ptr [rbp - 1]
0xdb8f77: inc ecx
0xdb8f79: mov dword ptr [rbp - 1], ecx
0xdb8f7c: mov rdi, qword ptr [r12 + 0x60]
0xdb8f81: mov eax, dword ptr [r12 + 0x68]
0xdb8f86: lea r15, [rdi + rax*8]
0xdb8f8a: cmp rdi, r15
0xdb8f8d: je 0x140db8fc5
0xdb8f8f: nop 
0xdb8f90: mov rax, qword ptr [rbp - 9]
0xdb8f94: mov qword ptr [rbp - 0x19], rax
0xdb8f98: mov dword ptr [rbp - 0x11], ecx
0xdb8f9b: mov qword ptr [rbp - 0x21], rsi
0xdb8f9f: mov qword ptr [rbp - 0x29], rsi
0xdb8fa3: mov rcx, qword ptr [rdi]
0xdb8fa6: lea r8, [rbp - 0x19]
0xdb8faa: lea rdx, [rbp - 0x29]
0xdb8fae: mov rcx, qword ptr [rcx + 0x20]
0xdb8fb2: call 0x1435ca4f0
0xdb8fb7: add rdi, 8
0xdb8fbb: cmp rdi, r15
0xdb8fbe: je 0x140db8fc5
0xdb8fc0: mov ecx, dword ptr [rbp - 1]
0xdb8fc3: jmp 0x140db8f90
0xdb8fc5: lea rax, [rbp + 7]
0xdb8fc9: mov rcx, qword ptr [rbp - 9]
0xdb8fcd: cmp rcx, rax
0xdb8fd0: je 0x140db8ffc
0xdb8fd2: test rcx, rcx
0xdb8fd5: je 0x140db8ffc
0xdb8fd7: mov r8d, 0x1fd
0xdb8fdd: mov rax, qword ptr gs:[0x58]
0xdb8fe6: mov rdx, qword ptr [rax]
0xdb8fe9: cmp byte ptr [r8 + rdx], 0
0xdb8fee: je 0x140db8ff7
0xdb8ff0: call 0x1447f03bc
0xdb8ff5: jmp 0x140db8ffc
0xdb8ff7: call 0x1447f02bc
0xdb8ffc: mov rax, qword ptr [r12 + 8]
0xdb9001: mov rcx, qword ptr [rax + 0x20]
0xdb9005: mov byte ptr [rbp + 0x67], 0x53
0xdb9009: lea rdx, [rbp + 0x67]
0xdb900d: call 0x1435c9320
0xdb9012: mov rcx, qword ptr [r12 + 0x260]
0xdb901a: test rcx, rcx
0xdb901d: je 0x140db9030
0xdb901f: mov byte ptr [rbp + 0x67], 0x26
0xdb9023: lea rdx, [rbp + 0x67]
0xdb9027: mov rcx, qword ptr [rcx + 0x20]
0xdb902b: call 0x1435c9320
0xdb9030: mov rdx, r12
0xdb9033: mov rcx, r14
0xdb9036: call 0x140df04f0
0xdb903b: mov rax, qword ptr [r14 + 0x5c0]
0xdb9042: test rax, rax
0xdb9045: je 0x140db9110
0xdb904b: cmp qword ptr [rax + 8], r13
0xdb904f: jne 0x140db9110
0xdb9055: mov rdi, qword ptr [r14 + 0x348]
0xdb905c: mov eax, dword ptr [r14 + 0x350]
0xdb9063: lea r12, [rdi + rax*8]
0xdb9067: cmp rdi, r12
0xdb906a: je 0x140db90b3
0xdb906c: nop dword ptr [rax]
0xdb9070: mov rax, qword ptr [rdi]
0xdb9073: mov r15, qword ptr [rax + 0x20]
0xdb9077: mov rax, qword ptr [r15]
0xdb907a: mov rcx, qword ptr [rax + 0xa0]
0xdb9081: test rcx, rcx
0xdb9084: je 0x140db908d
0xdb9086: cmp qword ptr [rcx + 8], 0
0xdb908b: jne 0x140db90aa
0xdb908d: lea rdx, [rip + 0x5f0f8c4]  ; [0x6cc8958] = runtime global (no file value)
0xdb9094: mov rcx, qword ptr [r15 + 8]
0xdb9098: call 0x1435ca140
0xdb909d: cmp eax, -1
0xdb90a0: je 0x140db90aa
0xdb90a2: mov rcx, r15
0xdb90a5: call 0x1435c66a0
0xdb90aa: add rdi, 8
0xdb90ae: cmp rdi, r12
0xdb90b1: jne 0x140db9070
0xdb90b3: mov r9, qword ptr [r14 + 0x5c8]
0xdb90ba: mov r8, qword ptr [r14 + 0x5c0]
0xdb90c1: xor edx, edx
0xdb90c3: mov rcx, r14
0xdb90c6: call 0x140d93e20
0xdb90cb: mov dword ptr [r14 + 0xab8], esi
0xdb90d2: mov rdi, qword ptr [r14 + 0x5c0]
0xdb90d9: mov rcx, rdi
0xdb90dc: call 0x140d8c400
0xdb90e1: test al, al
0xdb90e3: jne 0x140db90f8
0xdb90e5: mov rcx, qword ptr [rdi + 8]
0xdb90e9: call 0x143edd6b0
0xdb90ee: test rax, rax
0xdb90f1: je 0x140db9102
0xdb90f3: cmp byte ptr [rax], 0
0xdb90f6: je 0x140db9102
0xdb90f8: xor edx, edx
0xdb90fa: mov rcx, r14
0xdb90fd: call 0x140dba3f0
0xdb9102: mov qword ptr [r14 + 0x5c0], rsi
0xdb9109: mov qword ptr [r14 + 0x5c8], rsi
0xdb9110: mov rax, qword ptr gs:[0x58]
0xdb9119: mov rdx, qword ptr [rax]
0xdb911c: mov eax, 0x1ec
0xdb9121: mov rcx, qword ptr [rip + 0x5fb0400]  ; [0x6d69528] = runtime global (no file value)
0xdb9128: cmp byte ptr [rax + rdx], 0
0xdb912c: cmovne rcx, qword ptr [rip + 0x5fb03fc]  ; [0x6d69530] = runtime global (no file value)
0xdb9134: mov rax, qword ptr [rcx]
0xdb9137: mov rcx, qword ptr [rax + 8]
0xdb913b: mov r15, qword ptr [rcx + 0x270]
0xdb9142: lea rcx, [rbp + 0x6f]
0xdb9146: call 0x140537250
0xdb914b: cmp byte ptr [rax + 0xae], 0
0xdb9152: je 0x140db9158
0xdb9154: mov eax, esi
0xdb9156: jmp 0x140db91bf
0xdb9158: lea rcx, [rbp + 0x6f]
0xdb915c: call 0x140537250
0xdb9161: mov rdi, rax
0xdb9164: lea rcx, [r15 + 0xea]
0xdb916b: call 0x140537250
0xdb9170: mov ecx, dword ptr [rax]
0xdb9172: cmp dword ptr [rdi], ecx
0xdb9174: je 0x140db91ba
0xdb9176: lea rcx, [rbp + 0x6f]
0xdb917a: call 0x140537250
0xdb917f: mov rdi, rax
0xdb9182: lea rcx, [r15 + 0x16c]
0xdb9189: call 0x140537250
0xdb918e: mov ecx, dword ptr [rax]
0xdb9190: cmp dword ptr [rdi], ecx
0xdb9192: je 0x140db91ba
0xdb9194: lea rcx, [rbp + 0x6f]
0xdb9198: call 0x140537250
0xdb919d: mov rdi, rax
0xdb91a0: lea rcx, [r15 + 0xd6]
0xdb91a7: call 0x140537250
0xdb91ac: mov ecx, dword ptr [rax]
0xdb91ae: cmp dword ptr [rdi], ecx
0xdb91b0: je 0x140db91ba
0xdb91b2: test ebx, ebx
0xdb91b4: je 0x140db925d
0xdb91ba: mov eax, 1
0xdb91bf: mov rdx, qword ptr [r14 + 0x600]
0xdb91c6: movzx r15d, byte ptr [r14 + 0xae8]
0xdb91ce: cmp dword ptr [rdx + 0x108], eax
0xdb91d4: jbe 0x140db925d
0xdb91da: cmp dword ptr [rdx + 0x118], eax
0xdb91e0: jbe 0x140db925d
0xdb91e2: mov ecx, eax
0xdb91e4: mov rax, qword ptr [rdx + 0x100]
0xdb91eb: mov rdi, qword ptr [rax + rcx*8]
0xdb91ef: mov rax, qword ptr [rdx + 0x110]
0xdb91f6: mov r12, qword ptr [rax + rcx*8]
0xdb91fa: mov r8, qword ptr [rbp + 0x77]
0xdb91fe: lea rdx, [rbp + 0x6f]
0xdb9202: mov rcx, r12
0xdb9205: call 0x140d88a30
0xdb920a: test al, al
0xdb920c: je 0x140db925d
0xdb920e: test r15b, r15b
0xdb9211: je 0x140db921c
0xdb9213: mov byte ptr [rdi + 0x179], 1
0xdb921a: jmp 0x140db925d
0xdb921c: mov qword ptr [rdi + 0x160], r12
0xdb9223: mov rcx, rdi
0xdb9226: call 0x140ce7ea0
0xdb922b: mov rax, qword ptr [rdi]
0xdb922e: mov edx, dword ptr [rdi + 0x170]
0xdb9234: mov rcx, rdi
0xdb9237: call qword ptr [rax + 0x580]
0xdb923d: mov rax, qword ptr [rdi]
0xdb9240: mov rcx, rdi
0xdb9243: call qword ptr [rax + 0x550]
0xdb9249: mov rax, qword ptr [rdi]
0xdb924c: mov rcx, rdi
0xdb924f: call qword ptr [rax + 0x548]
0xdb9255: mov rcx, rdi
0xdb9258: call 0x140ce92d0
0xdb925d: mov rdi, qword ptr [rbp - 0x31]
0xdb9261: mov rdx, rdi
0xdb9264: mov rcx, r14
0xdb9267: call 0x140dd01c0
0xdb926c: mov r15d, 0xffffffff
0xdb9272: cmp dword ptr [r14 + 0x1bc], 0
0xdb927a: je 0x140db939a
0xdb9280: mov ecx, dword ptr [r14 + 0x1b8]
0xdb9287: test ecx, ecx
0xdb9289: je 0x140db939a
0xdb928f: xor edx, edx
0xdb9291: mov eax, ebx
0xdb9293: div ecx
0xdb9295: mov r8d, edx
0xdb9298: shl r8, 8
0xdb929c: add r8, qword ptr [r14 + 0x1c8]
0xdb92a3: mov edx, esi
0xdb92a5: mov r10d, dword ptr [r8]
0xdb92a8: test r10d, r10d
0xdb92ab: je 0x140db939a
0xdb92b1: mov eax, edx
0xdb92b3: cmp dword ptr [r8 + rax*8 + 8], ebx
0xdb92b8: jne 0x140db92d0
0xdb92ba: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb92bf: mov rax, qword ptr [r14 + 0x1d0]
0xdb92c6: mov r9, qword ptr [rax + rcx*8]
0xdb92ca: cmp dword ptr [r9 + 4], ebx
0xdb92ce: je 0x140db92dc
0xdb92d0: inc edx
0xdb92d2: cmp edx, r10d
0xdb92d5: jb 0x140db92b1
0xdb92d7: jmp 0x140db939a
0xdb92dc: lea r8, [r9 + 8]
0xdb92e0: test r8, r8
0xdb92e3: je 0x140db939a
0xdb92e9: test ebx, ebx
0xdb92eb: je 0x140db939a
0xdb92f1: mov rax, qword ptr [r8]
0xdb92f4: mov edx, dword ptr [r8 + 8]
0xdb92f8: mov ecx, esi
0xdb92fa: test edx, edx
0xdb92fc: je 0x140db930f
0xdb92fe: nop 
0xdb9300: cmp qword ptr [rax], rdi
0xdb9303: je 0x140db9312
0xdb9305: inc ecx
0xdb9307: add rax, 8
0xdb930b: cmp ecx, edx
0xdb930d: jb 0x140db9300
0xdb930f: mov ecx, r15d
0xdb9312: lea eax, [rdx - 1]
0xdb9315: cmp ecx, eax
0xdb9317: jae 0x140db9324
0xdb9319: mov rdx, qword ptr [r8]
0xdb931c: mov rax, qword ptr [rdx + rax*8]
0xdb9320: mov qword ptr [rdx + rcx*8], rax
0xdb9324: sub dword ptr [r8 + 8], 1
0xdb9329: jne 0x140db938f
0xdb932b: lea r9, [r14 + 0x1b8]
0xdb9332: cmp dword ptr [r9 + 4], 0
0xdb9337: je 0x140db938f
0xdb9339: inc dword ptr [r9 + 0xc]
0xdb933d: mov ecx, dword ptr [r9]
0xdb9340: test ecx, ecx
0xdb9342: je 0x140db938f
0xdb9344: xor edx, edx
0xdb9346: mov eax, ebx
0xdb9348: div ecx
0xdb934a: mov r8d, edx
0xdb934d: shl r8, 8
0xdb9351: add r8, qword ptr [r9 + 0x10]
0xdb9355: mov edx, esi
0xdb9357: mov r11d, dword ptr [r8]
0xdb935a: test r11d, r11d
0xdb935d: je 0x140db938f
0xdb935f: nop 
0xdb9360: mov eax, edx
0xdb9362: cmp dword ptr [r8 + rax*8 + 8], ebx
0xdb9367: jne 0x140db937b
0xdb9369: mov r10d, dword ptr [r8 + rax*8 + 0xc]
0xdb936e: mov rax, qword ptr [r9 + 0x18]
0xdb9372: mov rcx, qword ptr [rax + r10*8]
0xdb9376: cmp dword ptr [rcx + 4], ebx
0xdb9379: je 0x140db9384
0xdb937b: inc edx
0xdb937d: cmp edx, r11d
0xdb9380: jb 0x140db9360
0xdb9382: jmp 0x140db938f
0xdb9384: mov edx, r10d
0xdb9387: mov rcx, r9
0xdb938a: call 0x140465c80
0xdb938f: mov rdx, rdi
0xdb9392: mov rcx, r14
0xdb9395: call 0x140df0b30
0xdb939a: cmp dword ptr [r14 + 0x15c], 0
0xdb93a2: je 0x140db93f8
0xdb93a4: mov ecx, dword ptr [r14 + 0x158]
0xdb93ab: test ecx, ecx
0xdb93ad: je 0x140db93f8
0xdb93af: xor edx, edx
0xdb93b1: mov r11d, dword ptr [rbp - 0x39]
0xdb93b5: mov eax, r11d
0xdb93b8: div ecx
0xdb93ba: mov r8d, edx
0xdb93bd: shl r8, 8
0xdb93c1: add r8, qword ptr [r14 + 0x168]
0xdb93c8: mov edx, esi
0xdb93ca: mov r10d, dword ptr [r8]
0xdb93cd: test r10d, r10d
0xdb93d0: je 0x140db93f8
0xdb93d2: mov eax, edx
0xdb93d4: cmp dword ptr [r8 + rax*8 + 8], r11d
0xdb93d9: jne 0x140db93f1
0xdb93db: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb93e0: mov rax, qword ptr [r14 + 0x170]
0xdb93e7: mov r9, qword ptr [rax + rcx*8]
0xdb93eb: cmp dword ptr [r9 + 4], r11d
0xdb93ef: je 0x140db943a
0xdb93f1: inc edx
0xdb93f3: cmp edx, r10d
0xdb93f6: jb 0x140db93d2
0xdb93f8: mov r12d, 4
0xdb93fe: mov rbx, rsi
0xdb9401: mov rax, qword ptr [rdi]
0xdb9404: mov rcx, rdi
0xdb9407: call qword ptr [rax + 0x518]
0xdb940d: cmp byte ptr [rip + 0x5ef2fd4], 0  ; [0x6cac3e8] = runtime global (no file value)
0xdb9414: jne 0x140db947e
0xdb9416: mov rax, qword ptr [r14]
0xdb9419: mov rcx, r14
0xdb941c: call qword ptr [rax + 0x110]
0xdb9422: mov rcx, qword ptr [rax + 0x31200]
0xdb9429: mov qword ptr [rbp + 0x67], r13
0xdb942d: cmp byte ptr [r13 + 0x15], 0
0xdb9432: je 0x140db9449
0xdb9434: mov qword ptr [rbp + 0x67], rsi
0xdb9438: jmp 0x140db9466
0xdb943a: test r9, r9
0xdb943d: je 0x140db93f8
0xdb943f: lea rbx, [r9 + 8]
0xdb9443: lea r12, [r9 + 0xc]
0xdb9447: jmp 0x140db9401
0xdb9449: cmp byte ptr [r13 + 0x14], 0
0xdb944e: je 0x140db9457
0xdb9450: lock inc dword ptr [r13 + 0x10]
0xdb9455: jmp 0x140db9461
0xdb9457: mov eax, dword ptr [r13 + 0x10]
0xdb945b: inc eax
0xdb945d: mov dword ptr [r13 + 0x10], eax
0xdb9461: mov byte ptr [r13 + 0x16], 1
0xdb9466: lea rdx, [rbp + 0x67]
0xdb946a: call 0x143d2f610
0xdb946f: nop 
0xdb9470: lea rcx, [rbp + 0x67]
0xdb9474: call 0x14038ad90
0xdb9479: jmp 0x140db9519
0xdb947e: test byte ptr [r13 + 0x98], 2
0xdb9486: je 0x140db9511
0xdb948c: mov rax, qword ptr [r14]
0xdb948f: mov rcx, r14
0xdb9492: call qword ptr [rax + 0x110]
0xdb9498: mov rcx, qword ptr [rax + 0x31200]
0xdb949f: mov qword ptr [rbp + 0x67], r13
0xdb94a3: cmp byte ptr [r13 + 0x15], 0
0xdb94a8: je 0x140db94b0
0xdb94aa: mov qword ptr [rbp + 0x67], rsi
0xdb94ae: jmp 0x140db94cd
0xdb94b0: cmp byte ptr [r13 + 0x14], 0
0xdb94b5: je 0x140db94be
0xdb94b7: lock inc dword ptr [r13 + 0x10]
0xdb94bc: jmp 0x140db94c8
0xdb94be: mov eax, dword ptr [r13 + 0x10]
0xdb94c2: inc eax
0xdb94c4: mov dword ptr [r13 + 0x10], eax
0xdb94c8: mov byte ptr [r13 + 0x16], 1
0xdb94cd: lea rdx, [rbp + 0x67]
0xdb94d1: call 0x143d2f610
0xdb94d6: nop 
0xdb94d7: mov rcx, qword ptr [rbp + 0x67]
0xdb94db: test rcx, rcx
0xdb94de: je 0x140db9519
0xdb94e0: mov qword ptr [rbp + 0x67], rsi
0xdb94e4: cmp byte ptr [rcx + 0x14], 0
0xdb94e8: je 0x140db94f5
0xdb94ea: lock xadd dword ptr [rcx + 0x10], r15d
0xdb94f0: dec r15d
0xdb94f3: jmp 0x140db9500
0xdb94f5: mov r15d, dword ptr [rcx + 0x10]
0xdb94f9: dec r15d
0xdb94fc: mov dword ptr [rcx + 0x10], r15d
0xdb9500: test r15d, r15d
0xdb9503: jne 0x140db9519
0xdb9505: mov rax, qword ptr [rcx]
0xdb9508: mov edx, 1
0xdb950d: call qword ptr [rax]
0xdb950f: jmp 0x140db9519
0xdb9511: mov rcx, r13
0xdb9514: call 0x143ed59a0
0xdb9519: mov r13, qword ptr [rbp + 0x77]
0xdb951d: test rbx, rbx
0xdb9520: je 0x140db9761
0xdb9526: mov rdx, r13
0xdb9529: mov rcx, rbx
0xdb952c: call 0x140de45a0
0xdb9531: mov rax, qword ptr gs:[0x58]
0xdb953a: mov rcx, qword ptr [rax]
0xdb953d: mov eax, 0x1ec
0xdb9542: mov rdx, qword ptr [rip + 0x5faffdf]  ; [0x6d69528] = runtime global (no file value)
0xdb9549: cmp byte ptr [rax + rcx], 0
0xdb954d: cmovne rdx, qword ptr [rip + 0x5faffdb]  ; [0x6d69530] = runtime global (no file value)
0xdb9555: mov rax, qword ptr [rdx]
0xdb9558: mov rcx, qword ptr [rax + 8]
0xdb955c: mov rdi, qword ptr [rcx + 0x410]
0xdb9563: movzx r15d, byte ptr [r13 + 8]
0xdb9568: cmp r15b, 1
0xdb956c: jne 0x140db958f
0xdb956e: mov eax, dword ptr [r13]
0xdb9572: mov dword ptr [rbp + 0x67], eax
0xdb9575: lea rcx, [rbp + 0x67]
0xdb9579: call 0x140473f20
0xdb957e: mov r8d, dword ptr [rax]
0xdb9581: lea rdx, [rbp - 0x31]
0xdb9585: mov rcx, rdi
0xdb9588: call 0x14185b650
0xdb958d: jmp 0x140db95b1
0xdb958f: cmp dword ptr [rbx + 4], 0
0xdb9593: jne 0x140db972f
0xdb9599: lea rcx, [rbp + 0x6f]
0xdb959d: call 0x140537250
0xdb95a2: mov r8d, dword ptr [rax]
0xdb95a5: lea rdx, [rbp + 0x67]
0xdb95a9: mov rcx, rdi
0xdb95ac: call 0x14185b590
0xdb95b1: mov rbx, qword ptr [rax]
0xdb95b4: mov rax, rbx
0xdb95b7: mov qword ptr [rbp + 0x67], rbx
0xdb95bb: cmp ax, 0xffff
0xdb95bf: je 0x140db972f
0xdb95c5: lea rcx, [rbp + 0x6f]
0xdb95c9: call 0x140537250
0xdb95ce: movzx r10d, byte ptr [rax + 0xa8]
0xdb95d6: cmp r10b, 1
0xdb95da: je 0x140db95e2
0xdb95dc: cmp r10b, 3
0xdb95e0: jne 0x140db95e5
0xdb95e2: mov r10b, 2
0xdb95e5: mov r11, rsi
0xdb95e8: mov r8, qword ptr [r14 + 0xb90]
0xdb95ef: mov eax, dword ptr [r14 + 0xb98]
0xdb95f6: lea rcx, [rax + rax*4]
0xdb95fa: lea rdi, [r8 + rcx*8]
0xdb95fe: cmp r8, rdi
0xdb9601: je 0x140db972f
0xdb9607: cmp byte ptr [r8 + 0x20], r10b
0xdb960b: jne 0x140db963a
0xdb960d: mov rdx, qword ptr [r8]
0xdb9610: mov eax, dword ptr [r8 + 8]
0xdb9614: lea rcx, [rax + rax*2]
0xdb9618: lea r9, [rdx + rcx*8]
0xdb961c: cmp rdx, r9
0xdb961f: je 0x140db963a
0xdb9621: movzx ecx, bx
0xdb9624: movzx eax, word ptr [rdx + 0x10]
0xdb9628: cmp eax, ecx
0xdb962a: je 0x140db9637
0xdb962c: add rdx, 0x18
0xdb9630: cmp rdx, r9
0xdb9633: jne 0x140db9624
0xdb9635: jmp 0x140db963a
0xdb9637: mov r11, rdx
0xdb963a: add r8, 0x28
0xdb963e: cmp r8, rdi
0xdb9641: jne 0x140db9607
0xdb9643: test r11, r11
0xdb9646: je 0x140db972f
0xdb964c: mov eax, dword ptr [rbp + 0x6b]
0xdb964f: cmp dword ptr [r11 + 8], eax
0xdb9653: jbe 0x140db972f
0xdb9659: lea r8, [rax + rax*4]
0xdb965d: mov r9, qword ptr [r11]
0xdb9660: cmp r15b, 1
0xdb9664: jne 0x140db96b3
0xdb9666: mov eax, dword ptr [r13]
0xdb966a: mov ecx, dword ptr [r9 + r8*8 + 0x18]
0xdb966f: test ecx, ecx
0xdb9671: je 0x140db972f
0xdb9677: mov rdx, qword ptr [r9 + r8*8 + 0x10]
0xdb967c: nop dword ptr [rax]
0xdb9680: mov r10d, esi
0xdb9683: cmp eax, dword ptr [rdx + r10*4]
0xdb9687: je 0x140db9694
0xdb9689: inc esi
0xdb968b: cmp esi, ecx
0xdb968d: jb 0x140db9680
0xdb968f: jmp 0x140db972f
0xdb9694: cmp esi, -1
0xdb9697: je 0x140db972f
0xdb969d: lea eax, [rcx - 1]
0xdb96a0: cmp esi, eax
0xdb96a2: jae 0x140db96ab
0xdb96a4: mov ecx, dword ptr [rdx + rax*4]
0xdb96a7: mov dword ptr [rdx + r10*4], ecx
0xdb96ab: sub dword ptr [r9 + r8*8 + 0x18], 1
0xdb96b1: jmp 0x140db9700
0xdb96b3: mov ecx, dword ptr [r9 + r8*8 + 8]
0xdb96b8: test ecx, ecx
0xdb96ba: je 0x140db972f
0xdb96bc: mov r10, qword ptr [r9 + r8*8]
0xdb96c0: movzx r11d, word ptr [rbp + 0x6f]
0xdb96c5: nop word ptr [rax + rax]
0xdb96d0: mov edx, esi
0xdb96d2: movzx eax, word ptr [r10 + rdx*2]
0xdb96d7: cmp r11d, eax
0xdb96da: je 0x140db96e4
0xdb96dc: inc esi
0xdb96de: cmp esi, ecx
0xdb96e0: jb 0x140db96d0
0xdb96e2: jmp 0x140db972f
0xdb96e4: cmp esi, -1
0xdb96e7: je 0x140db972f
0xdb96e9: lea eax, [rcx - 1]
0xdb96ec: cmp esi, eax
0xdb96ee: jae 0x140db96fa
0xdb96f0: movzx ecx, word ptr [r10 + rax*2]
0xdb96f5: mov word ptr [r10 + rdx*2], cx
0xdb96fa: sub dword ptr [r9 + r8*8 + 8], 1
0xdb9700: sete al
0xdb9703: test al, al
0xdb9705: je 0x140db972f
0xdb9707: mov rax, qword ptr [r14 + 0xb10]
0xdb970e: mov rcx, qword ptr [rax + 8]
0xdb9712: movzx eax, byte ptr [rcx + 0xb0]
0xdb9719: and al, 0x60
0xdb971b: cmp al, 0x40
0xdb971d: jne 0x140db972f
0xdb971f: mov rcx, r14
0xdb9722: call 0x140dd3ee0
0xdb9727: mov rcx, r14
0xdb972a: call 0x140dd3950
0xdb972f: lea rcx, [rbp + 0x6f]
0xdb9733: call 0x140537250
0xdb9738: cmp dword ptr [rax + 0x2c], 0x25
0xdb973c: jne 0x140db9743
0xdb973e: xor r8d, r8d
0xdb9741: jmp 0x140db9755
0xdb9743: lea rcx, [rbp + 0x6f]
0xdb9747: call 0x140537250
0xdb974c: cmp dword ptr [rax + 0x2c], 0x66
0xdb9750: jne 0x140db9761
0xdb9752: mov r8b, 1
0xdb9755: mov edx, dword ptr [r12]
0xdb9759: mov rcx, r14
0xdb975c: call 0x140d92930
0xdb9761: cmp byte ptr [rip + 0x5ef4f10], 0  ; [0x6cae678] = runtime global (no file value)
0xdb9768: je 0x140db9775
0xdb976a: mov rdx, r13
0xdb976d: mov rcx, r14
0xdb9770: call 0x140db8040
0xdb9775: add rsp, 0x88
0xdb977c: pop r15
0xdb977e: pop r14
0xdb9780: pop r13
0xdb9782: pop r12
0xdb9784: pop rdi
0xdb9785: pop rsi
0xdb9786: pop rbx
0xdb9787: pop rbp
0xdb9788: ret 