0x2ac5bf0: mov qword ptr [rsp + 0x10], rbx
0x2ac5bf5: push rbp
0x2ac5bf6: push rsi
0x2ac5bf7: push rdi
0x2ac5bf8: push r12
0x2ac5bfa: push r13
0x2ac5bfc: push r14
0x2ac5bfe: push r15
0x2ac5c00: lea rbp, [rsp - 0x470]
0x2ac5c08: sub rsp, 0x570
0x2ac5c0f: vmovaps xmmword ptr [rsp + 0x560], xmm6
0x2ac5c18: mov r12, r9
0x2ac5c1b: mov r14, r8
0x2ac5c1e: mov rsi, rdx
0x2ac5c21: mov r15, rcx
0x2ac5c24: mov rax, qword ptr [rcx + 8]
0x2ac5c28: lea rdx, [rax + 8]
0x2ac5c2c: xor edi, edi
0x2ac5c2e: test rax, rax
0x2ac5c31: cmove rdx, rdi
0x2ac5c35: mov rdx, qword ptr [rdx]
0x2ac5c38: lea rcx, [rbp + 0x4b0]
0x2ac5c3f: call 0x140393df0
0x2ac5c44: nop 
0x2ac5c45: mov rax, qword ptr [r15 + 0x18]
0x2ac5c49: cmp qword ptr [r12], rax
0x2ac5c4d: je 0x142ac5c6b
0x2ac5c4f: mov eax, dword ptr [rip + 0x4231207]
0x2ac5c55: mov dword ptr [rsi], eax
0x2ac5c57: mov rcx, qword ptr [rbp + 0x4b0]
0x2ac5c5e: mov rax, qword ptr [rcx]
0x2ac5c61: mov dl, 1
0x2ac5c63: call qword ptr [rax + 0x20]
0x2ac5c66: jmp 0x142ac5f93
0x2ac5c6b: mov rax, qword ptr [r15 + 0x48]
0x2ac5c6f: cmp qword ptr [rax + 0x18], 0
0x2ac5c74: je 0x142ac5c7d
0x2ac5c76: vmovups xmm6, xmmword ptr [rax + 0x10]
0x2ac5c7b: jmp 0x142ac5c95
0x2ac5c7d: cmp qword ptr [rax + 0xb8], 0
0x2ac5c85: je 0x142ac5c91
0x2ac5c87: vmovups xmm6, xmmword ptr [rax + 0xb0]
0x2ac5c8f: jmp 0x142ac5c95
0x2ac5c91: vpxor xmm6, xmm6, xmm6
0x2ac5c95: vpextrq rbx, xmm6, 1
0x2ac5c9b: test rbx, rbx
0x2ac5c9e: jne 0x142ac5cbc
0x2ac5ca0: mov eax, dword ptr [rip + 0x423111a]
0x2ac5ca6: mov dword ptr [rsi], eax
0x2ac5ca8: mov rcx, qword ptr [rbp + 0x4b0]
0x2ac5caf: mov rax, qword ptr [rcx]
0x2ac5cb2: mov dl, 1
0x2ac5cb4: call qword ptr [rax + 0x20]
0x2ac5cb7: jmp 0x142ac5f93
0x2ac5cbc: mov rcx, qword ptr [rbp + 0x4b0]
0x2ac5cc3: mov rax, qword ptr [rcx]
0x2ac5cc6: mov dl, 1
0x2ac5cc8: call qword ptr [rax + 0x20]
0x2ac5ccb: vmovss xmm0, dword ptr [r14]
0x2ac5cd0: vxorps xmm2, xmm2, xmm2
0x2ac5cd4: vsubss xmm4, xmm0, xmm2
0x2ac5cd8: vmovss xmm3, dword ptr [rip + 0x32acf0c]
0x2ac5ce0: vcomiss xmm3, xmm4
0x2ac5ce4: jb 0x142ac5d2d
0x2ac5ce6: vmovss xmm1, dword ptr [rip + 0x32adb92]
0x2ac5cee: vcomiss xmm4, xmm1
0x2ac5cf2: jb 0x142ac5d2d
0x2ac5cf4: vmovss xmm0, dword ptr [r14 + 4]
0x2ac5cfa: vsubss xmm4, xmm0, xmm2
0x2ac5cfe: vcomiss xmm3, xmm4
0x2ac5d02: jb 0x142ac5d2d
0x2ac5d04: vcomiss xmm4, xmm1
0x2ac5d08: jb 0x142ac5d2d
0x2ac5d0a: vmovss xmm0, dword ptr [r14 + 8]
0x2ac5d10: vsubss xmm4, xmm0, xmm2
0x2ac5d14: vcomiss xmm3, xmm4
0x2ac5d18: jb 0x142ac5d2d
0x2ac5d1a: vcomiss xmm4, xmm1
0x2ac5d1e: jb 0x142ac5d2d
0x2ac5d20: mov eax, dword ptr [rip + 0x4215c52]
0x2ac5d26: mov dword ptr [rsi], eax
0x2ac5d28: jmp 0x142ac5f93
0x2ac5d2d: cmp dword ptr [rbx + 0x68], 0
0x2ac5d31: jne 0x142ac5d40
0x2ac5d33: mov eax, dword ptr [rip + 0x4231087]
0x2ac5d39: mov dword ptr [rsi], eax
0x2ac5d3b: jmp 0x142ac5f93
0x2ac5d40: lea rcx, [rbp + 0x90]
0x2ac5d47: call 0x141eb4960
0x2ac5d4c: nop 
0x2ac5d4d: mov dword ptr [rbp + 0x4b0], edi
0x2ac5d53: mov r13d, 0x329
0x2ac5d59: mov word ptr [rsp + 0x50], r13w
0x2ac5d5f: mov dword ptr [rsp + 0x54], 0xffffffff
0x2ac5d67: mov word ptr [rbp + 0x4c8], r13w
0x2ac5d6f: mov dword ptr [rbp + 0x4cc], 0xffffffff
0x2ac5d79: mov rax, qword ptr [r15 + 0x48]
0x2ac5d7d: mov rbx, qword ptr [rax + 8]
0x2ac5d81: mov rdi, qword ptr [r15 + 8]
0x2ac5d85: lea rdx, [rdi + 8]
0x2ac5d89: test rdi, rdi
0x2ac5d8c: mov eax, 0
0x2ac5d91: cmove rdx, rax
0x2ac5d95: mov r8b, 1
0x2ac5d98: mov rdx, qword ptr [rdx]
0x2ac5d9b: lea rcx, [rsp + 0x58]
0x2ac5da0: call 0x140393650
0x2ac5da5: nop 
0x2ac5da6: vpxor xmm0, xmm0, xmm0
0x2ac5daa: vmovdqu xmmword ptr [rsp + 0x70], xmm0
0x2ac5db0: vmovdqa xmmword ptr [rbp - 0x80], xmm6
0x2ac5db5: lea rax, [rbp + 0x4b0]
0x2ac5dbc: mov qword ptr [rsp + 0x40], rax
0x2ac5dc1: xor eax, eax
0x2ac5dc3: mov qword ptr [rsp + 0x38], rax
0x2ac5dc8: lea rax, [rsp + 0x70]
0x2ac5dcd: mov qword ptr [rsp + 0x30], rax
0x2ac5dd2: lea rax, [rsp + 0x50]
0x2ac5dd7: mov qword ptr [rsp + 0x28], rax
0x2ac5ddc: lea rax, [rbp + 0x4c8]
0x2ac5de3: mov qword ptr [rsp + 0x20], rax
0x2ac5de8: lea r9, [rbp - 0x80]
0x2ac5dec: mov r8, rbx
0x2ac5def: mov rdx, rdi
0x2ac5df2: lea rcx, [rbp + 0x90]
0x2ac5df9: call 0x141eb5360
0x2ac5dfe: nop 
0x2ac5dff: mov rbx, qword ptr [rsp + 0x58]
0x2ac5e04: mov rax, qword ptr [rbx]
0x2ac5e07: xor edx, edx
0x2ac5e09: mov rcx, rbx
0x2ac5e0c: call qword ptr [rax + 0x20]
0x2ac5e0f: cmp byte ptr [rsp + 0x60], 1
0x2ac5e14: jne 0x142ac5e44
0x2ac5e16: mov eax, 0xffffffff
0x2ac5e1b: lock xadd dword ptr [rbx + 8], eax
0x2ac5e20: cmp eax, 1
0x2ac5e23: jne 0x142ac5e37
0x2ac5e25: test dword ptr [rbx + 0xc], 0x40000000
0x2ac5e2c: je 0x142ac5e44
0x2ac5e2e: mov rax, qword ptr [rbx]
0x2ac5e31: mov rcx, rbx
0x2ac5e34: call qword ptr [rax + 0x40]
0x2ac5e37: test dword ptr [rbx + 0xc], 0x40000000
0x2ac5e3e: je 0x142ac5e44
0x2ac5e40: lock dec dword ptr [rbx + 0xc]
0x2ac5e44: cmp dword ptr [rbp + 0x4cc], -1
0x2ac5e4b: je 0x142ac5e5f
0x2ac5e4d: mov word ptr [rbp + 0x4c8], r13w
0x2ac5e55: mov dword ptr [rbp + 0x4cc], 0xffffffff
0x2ac5e5f: cmp dword ptr [rsp + 0x54], -1
0x2ac5e64: je 0x142ac5e74
0x2ac5e66: mov word ptr [rsp + 0x50], r13w
0x2ac5e6c: mov dword ptr [rsp + 0x54], 0xffffffff
0x2ac5e74: lea rcx, [rbp - 0x70]
0x2ac5e78: call 0x1417b53d0
0x2ac5e7d: mov rcx, qword ptr [r12]
0x2ac5e81: mov qword ptr [rbp + 0x448], rcx
0x2ac5e88: xor ebx, ebx
0x2ac5e8a: mov dword ptr [rbp + 0x450], ebx
0x2ac5e90: mov rdx, rax
0x2ac5e93: lea rcx, [rbp + 0x1e8]
0x2ac5e9a: call 0x140914ee0
0x2ac5e9f: mov rdx, qword ptr [r15 + 8]
0x2ac5ea3: lea rcx, [rbp + 0x90]
0x2ac5eaa: call 0x141eb5680
0x2ac5eaf: mov word ptr [rbp + 0x37a], 0xffff
0x2ac5eb8: mov rax, qword ptr [r15 + 8]
0x2ac5ebc: mov rcx, qword ptr [rax + 0x68]
0x2ac5ec0: mov rcx, qword ptr [rcx + 0x1a0]
0x2ac5ec7: mov rax, qword ptr [rcx]
0x2ac5eca: xor edx, edx
0x2ac5ecc: call qword ptr [rax + 0x150]
0x2ac5ed2: lea rcx, [rbp - 0x70]
0x2ac5ed6: call 0x142443e60
0x2ac5edb: mov qword ptr [rbp + 0x7c], rbx
0x2ac5edf: lea rcx, [rbp - 0x70]
0x2ac5ee3: vmovups ymm0, ymmword ptr [r14]
0x2ac5ee8: vmovups ymmword ptr [rcx], ymm0
0x2ac5eec: vmovups ymm0, ymmword ptr [r14 + 0x20]
0x2ac5ef2: vmovups ymmword ptr [rcx + 0x20], ymm0
0x2ac5ef7: vmovups ymm0, ymmword ptr [r14 + 0x40]
0x2ac5efd: vmovups ymmword ptr [rcx + 0x40], ymm0
0x2ac5f02: vmovups xmm0, xmmword ptr [r14 + 0x60]
0x2ac5f08: vmovups xmmword ptr [rcx + 0x60], xmm0
0x2ac5f0d: lea rcx, [rcx + 0x80]
0x2ac5f14: vmovups xmm0, xmmword ptr [r14 + 0x70]
0x2ac5f1a: vmovups xmmword ptr [rcx - 0x10], xmm0
0x2ac5f1f: vmovups ymm1, ymmword ptr [r14 + 0x80]
0x2ac5f28: vmovups ymmword ptr [rcx], ymm1
0x2ac5f2c: vmovups ymm1, ymmword ptr [r14 + 0xa0]
0x2ac5f35: vmovups ymmword ptr [rcx + 0x20], ymm1
0x2ac5f3a: vmovups ymm1, ymmword ptr [r14 + 0xc0]
0x2ac5f43: vmovups ymmword ptr [rcx + 0x40], ymm1
0x2ac5f48: mov rax, qword ptr [r14 + 0xe0]
0x2ac5f4f: mov qword ptr [rcx + 0x60], rax
0x2ac5f53: mov byte ptr [rbp + 0x78], bl
0x2ac5f56: mov byte ptr [rbp + 0x84], 1
0x2ac5f5d: mov rax, qword ptr [r15 + 8]
0x2ac5f61: mov rcx, qword ptr [rax + 0x68]
0x2ac5f65: lea r8, [rbp - 0x70]
0x2ac5f69: lea rdx, [rbp + 0x4b0]
0x2ac5f70: mov rcx, qword ptr [rcx + 0x1a0]
0x2ac5f77: vzeroupper 
0x2ac5f7a: call 0x142bcd120
0x2ac5f7f: mov eax, dword ptr [rbp + 0x4b0]
0x2ac5f85: mov dword ptr [rsi], eax
0x2ac5f87: lea rcx, [rbp + 0x90]
0x2ac5f8e: call 0x141eb4cc0
0x2ac5f93: mov rax, rsi
0x2ac5f96: mov rbx, qword ptr [rsp + 0x5b8]
0x2ac5f9e: vmovaps xmm6, xmmword ptr [rsp + 0x560]
0x2ac5fa7: add rsp, 0x570
0x2ac5fae: pop r15
0x2ac5fb0: pop r14
0x2ac5fb2: pop r13
0x2ac5fb4: pop r12
0x2ac5fb6: pop rdi
0x2ac5fb7: pop rsi
0x2ac5fb8: pop rbp
0x2ac5fb9: ret 