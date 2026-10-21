0x20688a0: mov qword ptr [rsp + 0x10], rdx
0x20688a5: mov qword ptr [rsp + 8], rcx
0x20688aa: push rbp
0x20688ab: push rbx
0x20688ac: push rsi
0x20688ad: push rdi
0x20688ae: push r12
0x20688b0: push r13
0x20688b2: push r14
0x20688b4: push r15
0x20688b6: lea rbp, [rsp - 0x298]
0x20688be: sub rsp, 0x398
0x20688c5: mov rbx, r9
0x20688c8: mov r13, r8
0x20688cb: mov rsi, rdx
0x20688ce: mov r14, rcx
0x20688d1: mov rcx, qword ptr [r8]
0x20688d4: mov rax, qword ptr [rcx]
0x20688d7: mov edx, 0xffffffff
0x20688dc: call qword ptr [rax + 0x18]
0x20688df: mov qword ptr [rbp - 0x60], rbx
0x20688e3: xor r15d, r15d
0x20688e6: test rbx, rbx
0x20688e9: jne 0x1420688f0
0x20688eb: mov eax, r15d
0x20688ee: jmp 0x142068900
0x20688f0: mov rax, 0xffffffffffffffff
0x20688f7: inc rax
0x20688fa: cmp byte ptr [rbx + rax], r15b
0x20688fe: jne 0x1420688f7
0x2068900: mov dword ptr [rbp - 0x58], eax
0x2068903: vmovups xmm0, xmmword ptr [rbp - 0x60]
0x2068908: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x206890d: cmp dword ptr [r13 + 0x1c], r15d
0x2068911: je 0x142069615
0x2068917: lea rcx, [rbp - 0x40]
0x206891b: mov qword ptr [rbp + 0x2f8], rcx
0x2068922: mov edx, eax
0x2068924: mov rcx, rbx
0x2068927: call 0x141364780
0x206892c: lea r9, [rbp + 0x2f0]
0x2068933: lea r8, [rbp + 0x2f8]
0x206893a: mov edx, eax
0x206893c: lea rcx, [r13 + 0x18]
0x2068940: call 0x140612620
0x2068945: test rax, rax
0x2068948: je 0x142069615
0x206894e: lea rdi, [rax + 0x10]
0x2068952: test rdi, rdi
0x2068955: je 0x142069615
0x206895b: mov rdi, qword ptr [rdi]
0x206895e: test rdi, rdi
0x2068961: je 0x142069615
0x2068967: mov rax, qword ptr [r14 + 0x88]
0x206896e: lea rcx, [rip + 0x38a5c77]
0x2068975: lea rbx, [rip + 0x38a5c78]
0x206897c: cmp byte ptr [rax + 1], r15b
0x2068980: cmove rbx, rcx
0x2068984: mov qword ptr [rsp + 0x70], r15
0x2068989: mov qword ptr [rsp + 0x78], r15
0x206898e: mov qword ptr [rbp - 0x50], r15
0x2068992: mov qword ptr [rbp - 0x48], r15
0x2068996: mov dword ptr [rbp + 0x2f8], r15d
0x206899d: mov qword ptr [rbp - 0x60], rbx
0x20689a1: mov rax, 0xffffffffffffffff
0x20689a8: nop dword ptr [rax + rax]
0x20689b0: inc rax
0x20689b3: cmp byte ptr [rbx + rax], 0
0x20689b7: jne 0x1420689b0
0x20689b9: mov dword ptr [rbp - 0x58], eax
0x20689bc: vmovups xmm0, xmmword ptr [rbp - 0x60]
0x20689c1: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x20689c6: cmp dword ptr [rdi + 0xc], 0
0x20689ca: je 0x142068a02
0x20689cc: lea rcx, [rbp - 0x40]
0x20689d0: mov qword ptr [rbp - 0x80], rcx
0x20689d4: mov edx, eax
0x20689d6: mov rcx, rbx
0x20689d9: call 0x141364780
0x20689de: lea r9, [rbp + 0x2f0]
0x20689e5: lea r8, [rbp - 0x80]
0x20689e9: mov edx, eax
0x20689eb: lea rcx, [rdi + 8]
0x20689ef: call 0x140612620
0x20689f4: test rax, rax
0x20689f7: je 0x142068a02
0x20689f9: add rax, 0x10
0x20689fd: je 0x142068a02
0x20689ff: mov r15, qword ptr [rax]
0x2068a02: mov qword ptr [rbp], r15
0x2068a06: mov r12d, 1
0x2068a0c: cmp byte ptr [rip + 0x4c864c5], 0
0x2068a13: je 0x142068d28
0x2068a19: test r15, r15
0x2068a1c: je 0x142068d28
0x2068a22: cmp byte ptr [rdi + 0x69c], 0
0x2068a29: jne 0x142068a9d
0x2068a2b: mov qword ptr [rbp - 0x60], rbx
0x2068a2f: mov rax, 0xffffffffffffffff
0x2068a36: inc rax
0x2068a39: cmp byte ptr [rbx + rax], 0
0x2068a3d: jne 0x142068a36
0x2068a3f: mov dword ptr [rbp - 0x58], eax
0x2068a42: vmovups xmm0, xmmword ptr [rbp - 0x60]
0x2068a47: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x2068a4c: cmp dword ptr [rdi + 0xc], 0
0x2068a50: je 0x142068a90
0x2068a52: lea rcx, [rbp - 0x40]
0x2068a56: mov qword ptr [rbp + 0x2f8], rcx
0x2068a5d: mov edx, eax
0x2068a5f: mov rcx, rbx
0x2068a62: call 0x141364780
0x2068a67: lea r9, [rbp + 0x2f0]
0x2068a6e: lea r8, [rbp + 0x2f8]
0x2068a75: mov edx, eax
0x2068a77: lea rcx, [rdi + 8]
0x2068a7b: call 0x140612620
0x2068a80: test rax, rax
0x2068a83: je 0x142068a90
0x2068a85: add rax, 0x10
0x2068a89: je 0x142068a90
0x2068a8b: mov rdx, qword ptr [rax]
0x2068a8e: jmp 0x142068a92
0x2068a90: xor edx, edx
0x2068a92: xor r8d, r8d
0x2068a95: mov rcx, rdi
0x2068a98: call 0x14235b620
0x2068a9d: mov rdx, rdi
0x2068aa0: mov rcx, r13
0x2068aa3: call 0x142355700
0x2068aa8: test al, al
0x2068aaa: jne 0x142068b63
0x2068ab0: mov ebx, dword ptr [rip + 0x4c8f2ea]
0x2068ab6: lea rax, [rip + 0x3772a53]
0x2068abd: mov qword ptr [rsp + 0x58], rax
0x2068ac2: mov dword ptr [rsp + 0x50], 6
0x2068aca: mov dword ptr [rsp + 0x48], ebx
0x2068ace: lea r9, [rip + 0x350a9d7]
0x2068ad5: mov qword ptr [rsp + 0x40], r9
0x2068ada: xor r15d, r15d
0x2068add: mov dword ptr [rsp + 0x38], r15d
0x2068ae2: mov qword ptr [rsp + 0x30], r9
0x2068ae7: mov qword ptr [rsp + 0x28], r9
0x2068aec: mov qword ptr [rsp + 0x20], r9
0x2068af1: movzx ecx, r12b
0x2068af5: call 0x14035d8d0
0x2068afa: mov rsi, qword ptr [rbp + 0x2e8]
0x2068b01: mov dword ptr [rsi], ebx
0x2068b03: mov qword ptr [rbp - 0x50], r15
0x2068b07: mov qword ptr [rbp - 0x48], r15
0x2068b0b: mov r9, qword ptr [rsp + 0x70]
0x2068b10: test r9, r9
0x2068b13: je 0x142069605
0x2068b19: mov ebx, r15d
0x2068b1c: mov edx, dword ptr [rsp + 0x78]
0x2068b20: test edx, edx
0x2068b22: je 0x1420695ca
0x2068b28: mov r8d, 1
0x2068b2e: nop 
0x2068b30: mov eax, ebx
0x2068b32: lea rdi, [r9 + rax*8]
0x2068b36: mov rcx, qword ptr [rdi]
0x2068b39: test rcx, rcx
0x2068b3c: je 0x142068b58
0x2068b3e: mov rax, qword ptr [rcx]
0x2068b41: mov edx, r8d
0x2068b44: call qword ptr [rax]
0x2068b46: mov qword ptr [rdi], r15
0x2068b49: mov edx, dword ptr [rsp + 0x78]
0x2068b4d: mov r9, qword ptr [rsp + 0x70]
0x2068b52: mov r8d, 1
0x2068b58: inc ebx
0x2068b5a: cmp ebx, edx
0x2068b5c: jb 0x142068b30
0x2068b5e: jmp 0x1420695ca
0x2068b63: xor r13d, r13d
0x2068b66: mov qword ptr [rbp - 0x78], r13
0x2068b6a: mov qword ptr [rbp - 0x70], r13
0x2068b6e: mov byte ptr [rbp - 0x68], 0xff
0x2068b72: lea rdx, [rbp - 0x78]
0x2068b76: mov rcx, r15
0x2068b79: call 0x14235bf10
0x2068b7e: lea rax, [rip + 0x36a1a93]
0x2068b85: mov qword ptr [rbp - 0x20], rax
0x2068b89: lea rax, [rip + 0x36a1af0]
0x2068b90: mov qword ptr [rbp - 0x20], rax
0x2068b94: mov rsi, qword ptr [rbp - 0x78]
0x2068b98: mov qword ptr [rbp - 0x18], rsi
0x2068b9c: mov eax, dword ptr [rbp - 0x6c]
0x2068b9f: mov dword ptr [rbp - 0x10], eax
0x2068ba2: mov dword ptr [rbp - 0xc], r13d
0x2068ba6: lea rcx, [rbp + 0x50]
0x2068baa: call 0x141874850
0x2068baf: nop 
0x2068bb0: xor r8d, r8d
0x2068bb3: lea rdx, [rbp - 0x20]
0x2068bb7: lea rcx, [rbp + 0x50]
0x2068bbb: call 0x141294a70
0x2068bc0: mov r15, rdi
0x2068bc3: mov edx, dword ptr [rbp - 0x10]
0x2068bc6: test edx, edx
0x2068bc8: je 0x142068ca2
0x2068bce: mov ecx, dword ptr [rbp - 0xc]
0x2068bd1: cmp dword ptr [rbp + 0x64], edx
0x2068bd4: cmovbe ecx, dword ptr [rbp + 0x64]
0x2068bd8: mov dword ptr [rbp - 0xc], ecx
0x2068bdb: mov edx, dword ptr [rbp + 0x60]
0x2068bde: lea rcx, [rsp + 0x70]
0x2068be3: call 0x14043e7e0
0x2068be8: mov ebx, r13d
0x2068beb: cmp dword ptr [rbp + 0x60], r13d
0x2068bef: jbe 0x142068ca2
0x2068bf5: nop word ptr [rax + rax]
0x2068c00: mov qword ptr [rbp + 0x2f0], r13
0x2068c07: mov qword ptr [rsp + 0x30], r13
0x2068c0c: lea rax, [rbp + 0x88]
0x2068c13: mov qword ptr [rsp + 0x28], rax
0x2068c18: lea rax, [rbp + 0x2f0]
0x2068c1f: mov qword ptr [rsp + 0x20], rax
0x2068c24: xor r9d, r9d
0x2068c27: lea r8, [rbp - 0x20]
0x2068c2b: mov edx, ebx
0x2068c2d: lea rcx, [rbp + 0x50]
0x2068c31: call 0x141296c80
0x2068c36: mov rdi, qword ptr [rbp + 0x2f0]
0x2068c3d: test rdi, rdi
0x2068c40: je 0x142068c97
0x2068c42: mov qword ptr [rbp + 0x2f8], r13
0x2068c49: mov qword ptr [rbp + 0x2f8], rdi
0x2068c50: mov ecx, dword ptr [rsp + 0x7c]
0x2068c54: mov eax, dword ptr [rsp + 0x78]
0x2068c58: cmp ecx, eax
0x2068c5a: ja 0x142068c81
0x2068c5c: lea edx, [rcx*2 + 1]
0x2068c63: add edx, ecx
0x2068c65: shr edx, 1
0x2068c67: cmp edx, 1
0x2068c6a: cmovb edx, r12d
0x2068c6e: cmp eax, edx
0x2068c70: cmova edx, eax
0x2068c73: lea rcx, [rsp + 0x70]
0x2068c78: call 0x14043e7e0
0x2068c7d: mov eax, dword ptr [rsp + 0x78]
0x2068c81: mov ecx, eax
0x2068c83: mov rax, qword ptr [rsp + 0x70]
0x2068c88: mov qword ptr [rax + rcx*8], rdi
0x2068c8c: mov qword ptr [rbp + 0x2f8], r13
0x2068c93: inc dword ptr [rsp + 0x78]
0x2068c97: inc ebx
0x2068c99: cmp ebx, dword ptr [rbp + 0x60]
0x2068c9c: jb 0x142068c00
0x2068ca2: mov rax, qword ptr [rbp]
0x2068ca6: movzx eax, word ptr [rax + 0xa8]
0x2068cad: mov dword ptr [rbp + 0x2f8], eax
0x2068cb3: lea rcx, [rbp + 0x50]
0x2068cb7: call 0x1412a3a70
0x2068cbc: nop 
0x2068cbd: lea rax, [rip + 0x36a1954]
0x2068cc4: mov qword ptr [rbp - 0x20], rax
0x2068cc8: movsx eax, byte ptr [rbp - 0x68]
0x2068ccc: cmp al, 0xff
0x2068cce: je 0x142068ce5
0x2068cd0: mov r8d, dword ptr [rbp - 0x70]
0x2068cd4: neg r8d
0x2068cd7: mov edx, eax
0x2068cd9: lea rax, [rip + 0x4c70540]
0x2068ce0: lock add dword ptr [rax + rdx*4], r8d
0x2068ce5: mov edi, 0x1fd
0x2068cea: test rsi, rsi
0x2068ced: je 0x142068d1f
0x2068cef: mov rax, qword ptr gs:[0x58]
0x2068cf8: mov rdx, qword ptr [rax]
0x2068cfb: mov rcx, rsi
0x2068cfe: cmp byte ptr [rdi + rdx], 0
0x2068d02: je 0x142068d16
0x2068d04: call 0x1447f03bc
0x2068d09: mov qword ptr [rbp - 0x78], r13
0x2068d0d: mov qword ptr [rbp - 0x70], r13
0x2068d11: jmp 0x142069018
0x2068d16: call 0x1447f02bc
0x2068d1b: mov qword ptr [rbp - 0x78], r13
0x2068d1f: mov qword ptr [rbp - 0x70], r13
0x2068d23: jmp 0x142069018
0x2068d28: mov rsi, qword ptr [r14 + 0x78]
0x2068d2c: mov r12d, dword ptr [r14 + 0x80]
0x2068d33: shl r12, 4
0x2068d37: add r12, rsi
0x2068d3a: mov r15, rdi
0x2068d3d: cmp rsi, r12
0x2068d40: je 0x142068f4c
0x2068d46: lea r14, [rdi + 8]
0x2068d4a: mov edi, 0x1fd
0x2068d4f: nop 
0x2068d50: mov rbx, qword ptr [rsi]
0x2068d53: mov rax, qword ptr [rbx]
0x2068d56: mov rcx, rbx
0x2068d59: call qword ptr [rax + 0xd8]
0x2068d5f: test rax, rax
0x2068d62: je 0x142068f38
0x2068d68: cmp byte ptr [rax], 0
0x2068d6b: je 0x142068f38
0x2068d71: mov rax, qword ptr [rbx]
0x2068d74: mov rcx, rbx
0x2068d77: call qword ptr [rax + 0xd8]
0x2068d7d: xor ecx, ecx
0x2068d7f: mov qword ptr [rbp + 0x158], rcx
0x2068d86: mov qword ptr [rbp + 0x160], 0x105
0x2068d91: mov dword ptr [rbp + 0x164], ecx
0x2068d97: mov byte ptr [rbp + 0x50], cl
0x2068d9a: mov r8, 0xffffffffffffffff
0x2068da1: inc r8
0x2068da4: cmp byte ptr [rax + r8], 0
0x2068da9: jne 0x142068da1
0x2068dab: mov dword ptr [rbp + 0x164], ecx
0x2068db1: mov byte ptr [rbp + 0x50], 0
0x2068db5: mov rcx, qword ptr [rbp + 0x158]
0x2068dbc: test rcx, rcx
0x2068dbf: je 0x142068dc4
0x2068dc1: mov byte ptr [rcx], 0
0x2068dc4: mov rdx, rax
0x2068dc7: lea rcx, [rbp + 0x50]
0x2068dcb: call 0x140393f50
0x2068dd0: nop 
0x2068dd1: mov dword ptr [rbp + 0x164], 0xffffffff
0x2068ddb: lea rcx, [rbp + 0x50]
0x2068ddf: mov rax, qword ptr [rbp + 0x158]
0x2068de6: test rax, rax
0x2068de9: cmovne rcx, rax
0x2068ded: call qword ptr [rip + 0x31836cd]
0x2068df3: mov rcx, qword ptr [rbp + 0x158]
0x2068dfa: mov rbx, r14
0x2068dfd: test rcx, rcx
0x2068e00: jne 0x142068e06
0x2068e02: lea rcx, [rbp + 0x50]
0x2068e06: mov qword ptr [rbp + 0x20], rcx
0x2068e0a: mov rax, 0xffffffffffffffff
0x2068e11: inc rax
0x2068e14: cmp byte ptr [rcx + rax], 0
0x2068e18: jne 0x142068e11
0x2068e1a: mov dword ptr [rbp + 0x28], eax
0x2068e1d: vmovups xmm0, xmmword ptr [rbp + 0x20]
0x2068e22: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x2068e27: cmp dword ptr [rbx + 4], 0
0x2068e2b: je 0x142068f03
0x2068e31: lea rdx, [rbp - 0x40]
0x2068e35: mov qword ptr [rbp - 0x80], rdx
0x2068e39: mov edx, eax
0x2068e3b: call 0x141364780
0x2068e40: lea r9, [rbp + 0x2f0]
0x2068e47: lea r8, [rbp - 0x80]
0x2068e4b: mov edx, eax
0x2068e4d: mov rcx, rbx
0x2068e50: call 0x140612620
0x2068e55: test rax, rax
0x2068e58: je 0x142068f03
0x2068e5e: add rax, 0x10
0x2068e62: je 0x142068f03
0x2068e68: cmp qword ptr [rax], 0
0x2068e6c: je 0x142068f03
0x2068e72: lea rcx, [rbp + 0x50]
0x2068e76: mov rax, qword ptr [rbp + 0x158]
0x2068e7d: test rax, rax
0x2068e80: cmovne rcx, rax
0x2068e84: cmp byte ptr [r15 + 0x69c], 0
0x2068e8c: jne 0x142068f01
0x2068e8e: mov qword ptr [rbp - 0x60], rcx
0x2068e92: test rcx, rcx
0x2068e95: jne 0x142068e9b
0x2068e97: xor eax, eax
0x2068e99: jmp 0x142068eab
0x2068e9b: mov rax, 0xffffffffffffffff
0x2068ea2: inc rax
0x2068ea5: cmp byte ptr [rcx + rax], 0
0x2068ea9: jne 0x142068ea2
0x2068eab: mov dword ptr [rbp - 0x58], eax
0x2068eae: vmovups xmm0, xmmword ptr [rbp - 0x60]
0x2068eb3: vmovdqa xmmword ptr [rbp + 0x40], xmm0
0x2068eb8: cmp dword ptr [r14 + 4], 0
0x2068ebd: je 0x142068ef3
0x2068ebf: lea rdx, [rbp + 0x40]
0x2068ec3: mov qword ptr [rbp - 0x80], rdx
0x2068ec7: mov edx, eax
0x2068ec9: call 0x141364780
0x2068ece: lea r9, [rbp + 0x2f0]
0x2068ed5: lea r8, [rbp - 0x80]
0x2068ed9: mov edx, eax
0x2068edb: mov rcx, r14
0x2068ede: call 0x140612620
0x2068ee3: test rax, rax
0x2068ee6: je 0x142068ef3
0x2068ee8: add rax, 0x10
0x2068eec: je 0x142068ef3
0x2068eee: mov rdx, qword ptr [rax]
0x2068ef1: jmp 0x142068ef5
0x2068ef3: xor edx, edx
0x2068ef5: xor r8d, r8d
0x2068ef8: mov rcx, r15
0x2068efb: call 0x14235b620
0x2068f00: nop 
0x2068f01: jmp 0x142068f03
0x2068f03: mov rcx, qword ptr [rbp + 0x158]
0x2068f0a: test rcx, rcx
0x2068f0d: je 0x142068f38
0x2068f0f: mov rax, qword ptr gs:[0x58]
0x2068f18: mov rdx, qword ptr [rax]
0x2068f1b: cmp byte ptr [rdi + rdx], 0
0x2068f1f: je 0x142068f28
0x2068f21: call 0x1447f03bc
0x2068f26: jmp 0x142068f2d
0x2068f28: call 0x1447f02bc
0x2068f2d: mov qword ptr [rbp + 0x158], 0
0x2068f38: add rsi, 0x10
0x2068f3c: cmp rsi, r12
0x2068f3f: jne 0x142068d50
0x2068f45: mov r14, qword ptr [rbp + 0x2e0]
0x2068f4c: mov rdx, r15
0x2068f4f: mov rcx, r13
0x2068f52: call 0x142355700
0x2068f57: test al, al
0x2068f59: jne 0x142069013
0x2068f5f: mov ebx, dword ptr [rip + 0x4c8ee3b]
0x2068f65: lea rax, [rip + 0x37725a4]
0x2068f6c: mov qword ptr [rsp + 0x58], rax
0x2068f71: mov dword ptr [rsp + 0x50], 6
0x2068f79: mov dword ptr [rsp + 0x48], ebx
0x2068f7d: lea r9, [rip + 0x350a528]
0x2068f84: mov qword ptr [rsp + 0x40], r9
0x2068f89: xor r15d, r15d
0x2068f8c: mov dword ptr [rsp + 0x38], r15d
0x2068f91: mov qword ptr [rsp + 0x30], r9
0x2068f96: mov qword ptr [rsp + 0x28], r9
0x2068f9b: mov qword ptr [rsp + 0x20], r9
0x2068fa0: mov cl, 1
0x2068fa2: call 0x14035d8d0
0x2068fa7: mov rsi, qword ptr [rbp + 0x2e8]
0x2068fae: mov dword ptr [rsi], ebx
0x2068fb0: mov qword ptr [rbp - 0x50], r15
0x2068fb4: mov qword ptr [rbp - 0x48], r15
0x2068fb8: mov r9, qword ptr [rsp + 0x70]
0x2068fbd: test r9, r9
0x2068fc0: je 0x142069605
0x2068fc6: mov ebx, r15d
0x2068fc9: mov edx, dword ptr [rsp + 0x78]
0x2068fcd: test edx, edx
0x2068fcf: je 0x1420695ca
0x2068fd5: mov r8d, 1
0x2068fdb: nop dword ptr [rax + rax]
0x2068fe0: mov eax, ebx
0x2068fe2: lea rdi, [r9 + rax*8]
0x2068fe6: mov rcx, qword ptr [rdi]
0x2068fe9: test rcx, rcx
0x2068fec: je 0x142069008
0x2068fee: mov rax, qword ptr [rcx]
0x2068ff1: mov edx, r8d
0x2068ff4: call qword ptr [rax]
0x2068ff6: mov qword ptr [rdi], r15
0x2068ff9: mov edx, dword ptr [rsp + 0x78]
0x2068ffd: mov r9, qword ptr [rsp + 0x70]
0x2069002: mov r8d, 1
0x2069008: inc ebx
0x206900a: cmp ebx, edx
0x206900c: jb 0x142068fe0
0x206900e: jmp 0x1420695ca
0x2069013: mov edi, 0x1fd
0x2069018: mov r12, qword ptr [r14 + 0x78]
0x206901c: mov r13d, dword ptr [r14 + 0x80]
0x2069023: shl r13, 4
0x2069027: add r13, r12
0x206902a: mov qword ptr [rbp + 0x20], r13
0x206902e: cmp r12, r13
0x2069031: je 0x14206956b
0x2069037: lea rbx, [r15 + 8]
0x206903b: mov qword ptr [rbp - 0x30], rbx
0x206903f: mov esi, dword ptr [rbp + 0x2f8]
0x2069045: mov r15, qword ptr [r12]
0x2069049: movzx eax, word ptr [r12 + 8]
0x206904f: mov word ptr [rbp + 0x2f0], ax
0x2069056: mov rax, qword ptr [r15]
0x2069059: mov rcx, r15
0x206905c: call qword ptr [rax + 0xd8]
0x2069062: test rax, rax
0x2069065: je 0x14206946b
0x206906b: cmp byte ptr [rax], 0
0x206906e: je 0x14206946b
0x2069074: mov rax, qword ptr [r15]
0x2069077: mov rcx, r15
0x206907a: call qword ptr [rax + 0xd8]
0x2069080: xor r14d, r14d
0x2069083: mov qword ptr [rbp + 0x278], r14
0x206908a: mov qword ptr [rbp + 0x280], 0x105
0x2069095: mov dword ptr [rbp + 0x284], r14d
0x206909c: mov byte ptr [rbp + 0x170], r14b
0x20690a3: mov r8, 0xffffffffffffffff
0x20690aa: nop word ptr [rax + rax]
0x20690b0: inc r8
0x20690b3: cmp byte ptr [rax + r8], 0
0x20690b8: jne 0x1420690b0
0x20690ba: mov dword ptr [rbp + 0x284], r14d
0x20690c1: mov byte ptr [rbp + 0x170], 0
0x20690c8: mov rcx, qword ptr [rbp + 0x278]
0x20690cf: test rcx, rcx
0x20690d2: je 0x1420690d7
0x20690d4: mov byte ptr [rcx], 0
0x20690d7: mov rdx, rax
0x20690da: lea rcx, [rbp + 0x170]
0x20690e1: call 0x140393f50
0x20690e6: nop 
0x20690e7: mov dword ptr [rbp + 0x284], 0xffffffff
0x20690f1: lea rcx, [rbp + 0x170]
0x20690f8: mov rax, qword ptr [rbp + 0x278]
0x20690ff: test rax, rax
0x2069102: cmovne rcx, rax
0x2069106: call qword ptr [rip + 0x31833b4]
0x206910c: cmp byte ptr [rip + 0x4c85dc5], 0
0x2069113: je 0x142069129
0x2069115: cmp qword ptr [rbp], 0
0x206911a: je 0x142069129
0x206911c: mov r14d, 0x1fd
0x2069122: xor eax, eax
0x2069124: jmp 0x1420693c0
0x2069129: mov rcx, qword ptr [rbp + 0x278]
0x2069130: test rcx, rcx
0x2069133: jne 0x14206913c
0x2069135: lea rcx, [rbp + 0x170]
0x206913c: mov qword ptr [rbp - 0x60], rcx
0x2069140: mov rax, 0xffffffffffffffff
0x2069147: inc rax
0x206914a: cmp byte ptr [rcx + rax], 0
0x206914e: jne 0x142069147
0x2069150: mov dword ptr [rbp - 0x58], eax
0x2069153: vmovups xmm0, xmmword ptr [rbp - 0x60]
0x2069158: vmovdqa xmmword ptr [rbp - 0x20], xmm0
0x206915d: cmp dword ptr [rbx + 4], 0
0x2069161: je 0x142069436
0x2069167: lea rdx, [rbp - 0x20]
0x206916b: mov qword ptr [rbp + 0x40], rdx
0x206916f: mov edx, eax
0x2069171: call 0x141364780
0x2069176: lea r9, [rbp + 0x2f8]
0x206917d: lea r8, [rbp + 0x40]
0x2069181: mov edx, eax
0x2069183: mov rcx, rbx
0x2069186: call 0x140612620
0x206918b: test rax, rax
0x206918e: je 0x142069436
0x2069194: add rax, 0x10
0x2069198: je 0x142069436
0x206919e: mov r14, qword ptr [rax]
0x20691a1: test r14, r14
0x20691a4: je 0x142069436
0x20691aa: xor edi, edi
0x20691ac: mov ebx, edi
0x20691ae: mov edx, dword ptr [rsp + 0x78]
0x20691b2: test edx, edx
0x20691b4: je 0x1420691f2
0x20691b6: mov r13d, 1
0x20691bc: nop dword ptr [rax]
0x20691c0: mov ecx, ebx
0x20691c2: mov rax, qword ptr [rsp + 0x70]
0x20691c7: lea rdi, [rax + rcx*8]
0x20691cb: mov rcx, qword ptr [rdi]
0x20691ce: test rcx, rcx
0x20691d1: je 0x1420691e6
0x20691d3: mov rax, qword ptr [rcx]
0x20691d6: mov edx, r13d
0x20691d9: call qword ptr [rax]
0x20691db: mov qword ptr [rdi], 0
0x20691e2: mov edx, dword ptr [rsp + 0x78]
0x20691e6: inc ebx
0x20691e8: cmp ebx, edx
0x20691ea: jb 0x1420691c0
0x20691ec: mov r13, qword ptr [rbp + 0x20]
0x20691f0: xor edi, edi
0x20691f2: mov dword ptr [rsp + 0x78], edi
0x20691f6: mov qword ptr [rbp - 0x78], rdi
0x20691fa: mov qword ptr [rbp - 0x70], 0
0x2069202: mov byte ptr [rbp - 0x68], 0xff
0x2069206: lea rdx, [rbp - 0x78]
0x206920a: mov rcx, r14
0x206920d: call 0x14235bf10
0x2069212: lea rax, [rip + 0x36a13ff]
0x2069219: mov qword ptr [rbp + 8], rax
0x206921d: lea rax, [rip + 0x36a145c]
0x2069224: mov qword ptr [rbp + 8], rax
0x2069228: mov rsi, qword ptr [rbp - 0x78]
0x206922c: mov qword ptr [rbp + 0x10], rsi
0x2069230: mov eax, dword ptr [rbp - 0x6c]
0x2069233: mov dword ptr [rbp + 0x18], eax
0x2069236: mov dword ptr [rbp + 0x1c], edi
0x2069239: lea rcx, [rbp + 0x50]
0x206923d: call 0x141874850
0x2069242: nop 
0x2069243: xor r8d, r8d
0x2069246: lea rdx, [rbp + 8]
0x206924a: lea rcx, [rbp + 0x50]
0x206924e: call 0x141294a70
0x2069253: mov edx, dword ptr [rbp + 0x18]
0x2069256: test edx, edx
0x2069258: je 0x142069332
0x206925e: mov ecx, dword ptr [rbp + 0x1c]
0x2069261: cmp dword ptr [rbp + 0x64], edx
0x2069264: cmovbe ecx, dword ptr [rbp + 0x64]
0x2069268: mov dword ptr [rbp + 0x1c], ecx
0x206926b: mov edx, dword ptr [rbp + 0x60]
0x206926e: lea rcx, [rsp + 0x70]
0x2069273: call 0x14043e7e0
0x2069278: mov ebx, edi
0x206927a: cmp dword ptr [rbp + 0x60], 0
0x206927e: jbe 0x142069332
0x2069284: mov esi, 1
0x2069289: nop dword ptr [rax]
0x2069290: mov qword ptr [rbp + 0x2f8], rdi
0x2069297: mov qword ptr [rsp + 0x30], rdi
0x206929c: lea rax, [rbp + 0x88]
0x20692a3: mov qword ptr [rsp + 0x28], rax
0x20692a8: lea rax, [rbp + 0x2f8]
0x20692af: mov qword ptr [rsp + 0x20], rax
0x20692b4: xor r9d, r9d
0x20692b7: lea r8, [rbp + 8]
0x20692bb: mov edx, ebx
0x20692bd: lea rcx, [rbp + 0x50]
0x20692c1: call 0x141296c80
0x20692c6: mov rdi, qword ptr [rbp + 0x2f8]
0x20692cd: test rdi, rdi
0x20692d0: je 0x142069323
0x20692d2: mov qword ptr [rbp - 0x80], 0
0x20692da: mov qword ptr [rbp - 0x80], rdi
0x20692de: mov ecx, dword ptr [rsp + 0x7c]
0x20692e2: mov eax, dword ptr [rsp + 0x78]
0x20692e6: cmp ecx, eax
0x20692e8: ja 0x14206930e
0x20692ea: lea edx, [rcx*2 + 1]
0x20692f1: add edx, ecx
0x20692f3: shr edx, 1
0x20692f5: cmp edx, 1
0x20692f8: cmovb edx, esi
0x20692fb: cmp eax, edx
0x20692fd: cmova edx, eax
0x2069300: lea rcx, [rsp + 0x70]
0x2069305: call 0x14043e7e0
0x206930a: mov eax, dword ptr [rsp + 0x78]
0x206930e: mov ecx, eax
0x2069310: mov rax, qword ptr [rsp + 0x70]
0x2069315: mov qword ptr [rax + rcx*8], rdi
0x2069319: xor edi, edi
0x206931b: mov qword ptr [rbp - 0x80], rdi
0x206931f: inc dword ptr [rsp + 0x78]
0x2069323: inc ebx
0x2069325: cmp ebx, dword ptr [rbp + 0x60]
0x2069328: jb 0x142069290
0x206932e: mov rsi, qword ptr [rbp - 0x78]
0x2069332: movzx eax, word ptr [r14 + 0xa8]
0x206933a: mov dword ptr [rbp + 0x2f8], eax
0x2069340: lea rcx, [rbp + 0x50]
0x2069344: call 0x1412a3a70
0x2069349: nop 
0x206934a: lea rax, [rip + 0x36a12c7]
0x2069351: mov qword ptr [rbp + 8], rax
0x2069355: movsx eax, byte ptr [rbp - 0x68]
0x2069359: cmp al, 0xff
0x206935b: je 0x142069372
0x206935d: mov r8d, dword ptr [rbp - 0x70]
0x2069361: neg r8d
0x2069364: mov edx, eax
0x2069366: lea rax, [rip + 0x4c6feb3]
0x206936d: lock add dword ptr [rax + rdx*4], r8d
0x2069372: mov r14d, 0x1fd
0x2069378: mov edi, r14d
0x206937b: test rsi, rsi
0x206937e: je 0x1420693b0
0x2069380: mov rax, qword ptr gs:[0x58]
0x2069389: mov rdx, qword ptr [rax]
0x206938c: mov rcx, rsi
0x206938f: cmp byte ptr [r14 + rdx], 0
0x2069394: je 0x1420693a3
0x2069396: call 0x1447f03bc
0x206939b: xor eax, eax
0x206939d: mov qword ptr [rbp - 0x78], rax
0x20693a1: jmp 0x1420693b2
0x20693a3: call 0x1447f02bc
0x20693a8: xor eax, eax
0x20693aa: mov qword ptr [rbp - 0x78], rax
0x20693ae: jmp 0x1420693b2
0x20693b0: xor eax, eax
0x20693b2: mov qword ptr [rbp - 0x70], 0
0x20693ba: mov esi, dword ptr [rbp + 0x2f8]
0x20693c0: mov qword ptr [rbp - 0x40], rax
0x20693c4: lea rax, [rsp + 0x70]
0x20693c9: mov qword ptr [rbp - 0x38], rax
0x20693cd: mov rax, qword ptr [r15]
0x20693d0: mov ecx, dword ptr [rbp + 0x300]
0x20693d6: mov dword ptr [rsp + 0x20], ecx
0x20693da: lea r9, [rbp - 0x40]
0x20693de: mov r8d, esi
0x20693e1: lea rdx, [rbp + 0x30]
0x20693e5: mov rcx, r15
0x20693e8: call qword ptr [rax + 0x50]
0x20693eb: mov ebx, dword ptr [rax]
0x20693ed: test ebx, ebx
0x20693ef: jne 0x142069482
0x20693f5: mov rcx, qword ptr [rbp + 0x278]
0x20693fc: test rcx, rcx
0x20693ff: je 0x142069467
0x2069401: mov rax, qword ptr gs:[0x58]
0x206940a: mov rdx, qword ptr [rax]
0x206940d: cmp byte ptr [rdi + rdx], bl
0x2069410: je 0x142069424
0x2069412: call 0x1447f03bc
0x2069417: mov qword ptr [rbp + 0x278], 0
0x2069422: jmp 0x142069467
0x2069424: call 0x1447f02bc
0x2069429: mov qword ptr [rbp + 0x278], 0
0x2069434: jmp 0x142069467
0x2069436: mov rcx, qword ptr [rbp + 0x278]
0x206943d: test rcx, rcx
0x2069440: je 0x142069467
0x2069442: mov rax, qword ptr gs:[0x58]
0x206944b: mov rdx, qword ptr [rax]
0x206944e: cmp byte ptr [rdi + rdx], 0
0x2069452: je 0x14206945b
0x2069454: call 0x1447f03bc
0x2069459: jmp 0x142069460
0x206945b: call 0x1447f02bc
0x2069460: mov qword ptr [rbp + 0x278], r14
0x2069467: mov rbx, qword ptr [rbp - 0x30]
0x206946b: add r12, 0x10
0x206946f: cmp r12, r13
0x2069472: je 0x14206956b
0x2069478: mov edi, 0x1fd
0x206947d: jmp 0x142069045
0x2069482: lea rax, [rbp + 0x2f0]
0x2069489: mov qword ptr [rsp + 0x60], rax
0x206948e: lea rax, [rip + 0x38a516b]
0x2069495: mov qword ptr [rsp + 0x58], rax
0x206949a: mov dword ptr [rsp + 0x48], ebx
0x206949e: call 0x14050d2d0
0x20694a3: mov rsi, qword ptr [rbp + 0x2e8]
0x20694aa: mov dword ptr [rsi], ebx
0x20694ac: mov rcx, qword ptr [rbp + 0x278]
0x20694b3: test rcx, rcx
0x20694b6: je 0x1420694ec
0x20694b8: mov rax, qword ptr gs:[0x58]
0x20694c1: mov rdx, qword ptr [rax]
0x20694c4: cmp byte ptr [rdi + rdx], 0
0x20694c8: je 0x1420694db
0x20694ca: call 0x1447f03bc
0x20694cf: xor r15d, r15d
0x20694d2: mov qword ptr [rbp + 0x278], r15
0x20694d9: jmp 0x1420694ef
0x20694db: call 0x1447f02bc
0x20694e0: xor r15d, r15d
0x20694e3: mov qword ptr [rbp + 0x278], r15
0x20694ea: jmp 0x1420694ef
0x20694ec: xor r15d, r15d
0x20694ef: mov qword ptr [rbp - 0x50], r15
0x20694f3: mov qword ptr [rbp - 0x48], 0
0x20694fb: mov r8, qword ptr [rsp + 0x70]
0x2069500: test r8, r8
0x2069503: je 0x142069605
0x2069509: mov ebx, r15d
0x206950c: mov edx, dword ptr [rsp + 0x78]
0x2069510: test edx, edx
0x2069512: je 0x14206954d
0x2069514: nop dword ptr [rax]
0x2069518: nop dword ptr [rax + rax]
0x2069520: mov eax, ebx
0x2069522: lea rdi, [r8 + rax*8]
0x2069526: mov rcx, qword ptr [rdi]
0x2069529: test rcx, rcx
0x206952c: je 0x142069544
0x206952e: mov rax, qword ptr [rcx]
0x2069531: mov edx, 1
0x2069536: call qword ptr [rax]
0x2069538: mov qword ptr [rdi], r15
0x206953b: mov edx, dword ptr [rsp + 0x78]
0x206953f: mov r8, qword ptr [rsp + 0x70]
0x2069544: inc ebx
0x2069546: cmp ebx, edx
0x2069548: jb 0x142069520
0x206954a: mov edi, r14d
0x206954d: test r8, r8
0x2069550: je 0x142069605
0x2069556: mov rax, qword ptr gs:[0x58]
0x206955f: mov rdx, qword ptr [rax]
0x2069562: mov rcx, r8
0x2069565: cmp byte ptr [rdi + rdx], 0
0x2069569: jmp 0x1420695e9
0x206956b: mov rsi, qword ptr [rbp + 0x2e8]
0x2069572: xor r15d, r15d
0x2069575: mov dword ptr [rsi], r15d
0x2069578: mov qword ptr [rbp - 0x50], r15
0x206957c: mov qword ptr [rbp - 0x48], r15
0x2069580: mov r9, qword ptr [rsp + 0x70]
0x2069585: test r9, r9
0x2069588: je 0x142069605
0x206958a: mov ebx, r15d
0x206958d: mov edx, dword ptr [rsp + 0x78]
0x2069591: test edx, edx
0x2069593: je 0x1420695ca
0x2069595: nop word ptr [rax + rax]
0x20695a0: mov eax, ebx
0x20695a2: lea rdi, [r9 + rax*8]
0x20695a6: mov rcx, qword ptr [rdi]
0x20695a9: test rcx, rcx
0x20695ac: je 0x1420695c4
0x20695ae: mov rax, qword ptr [rcx]
0x20695b1: mov edx, 1
0x20695b6: call qword ptr [rax]
0x20695b8: mov qword ptr [rdi], r15
0x20695bb: mov edx, dword ptr [rsp + 0x78]
0x20695bf: mov r9, qword ptr [rsp + 0x70]
0x20695c4: inc ebx
0x20695c6: cmp ebx, edx
0x20695c8: jb 0x1420695a0
0x20695ca: test r9, r9
0x20695cd: je 0x142069605
0x20695cf: mov r8d, 0x1fd
0x20695d5: mov rax, qword ptr gs:[0x58]
0x20695de: mov rdx, qword ptr [rax]
0x20695e1: mov rcx, r9
0x20695e4: cmp byte ptr [r8 + rdx], 0
0x20695e9: je 0x142069600
0x20695eb: call 0x1447f03bc
0x20695f0: mov qword ptr [rsp + 0x70], r15
0x20695f5: mov qword ptr [rsp + 0x78], 0
0x20695fe: jmp 0x14206961d
0x2069600: call 0x1447f02bc
0x2069605: mov qword ptr [rsp + 0x70], r15
0x206960a: mov qword ptr [rsp + 0x78], 0
0x2069613: jmp 0x14206961d
0x2069615: mov eax, dword ptr [rip + 0x4c8e201]
0x206961b: mov dword ptr [rsi], eax
0x206961d: mov rax, rsi
0x2069620: add rsp, 0x398
0x2069627: pop r15
0x2069629: pop r14
0x206962b: pop r13
0x206962d: pop r12
0x206962f: pop rdi
0x2069630: pop rsi
0x2069631: pop rbx
0x2069632: pop rbp
0x2069633: ret 