0xdb2a30: mov qword ptr [rsp + 8], rbx
0xdb2a35: mov qword ptr [rsp + 0x10], rbp
0xdb2a3a: mov qword ptr [rsp + 0x18], rsi
0xdb2a3f: push rdi
0xdb2a40: sub rsp, 0x50
0xdb2a44: xor sil, sil
0xdb2a47: mov rdi, rcx
0xdb2a4a: cmp dword ptr [rcx + 0xbf8], 3
0xdb2a51: jne 0x140db2ad7
0xdb2a57: mov rax, qword ptr [rcx + 0x468]
0xdb2a5e: cmp byte ptr [rax + 3], sil
0xdb2a62: jne 0x140db2ad7
0xdb2a64: vmovups xmm0, xmmword ptr [rcx + 0x994]
0xdb2a6c: vmovss xmm1, dword ptr [rip + 0x5ef9014]
0xdb2a74: mov rdx, qword ptr [rcx + 0x9e0]
0xdb2a7b: lea r8, [rsp + 0x30]
0xdb2a80: vsubss xmm2, xmm1, dword ptr [rip + 0x5ef8f60]
0xdb2a88: mov eax, dword ptr [rcx + 0x9a4]
0xdb2a8e: vmovups xmmword ptr [rsp + 0x30], xmm0
0xdb2a94: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xdb2a9c: vsubss xmm3, xmm0, dword ptr [rip + 0x5ef8f44]
0xdb2aa4: vmovss xmm0, dword ptr [rip + 0x4fc0608]
0xdb2aac: mov rdx, qword ptr [rdx + 8]
0xdb2ab0: vdivss xmm4, xmm3, xmm2
0xdb2ab4: vsubss xmm3, xmm0, xmm4
0xdb2ab8: mov dword ptr [rsp + 0x40], eax
0xdb2abc: mov byte ptr [rsp + 0x20], 1
0xdb2ac1: call 0x140dabae0
0xdb2ac6: movzx esi, al
0xdb2ac9: mov rax, qword ptr [rdi + 0x9e0]
0xdb2ad0: mov byte ptr [rax + 0x2b9], sil
0xdb2ad7: mov rcx, qword ptr [rdi + 0x9e8]
0xdb2ade: test sil, sil
0xdb2ae1: je 0x140db2afb
0xdb2ae3: call 0x140cb6bd0
0xdb2ae8: mov rcx, qword ptr [rdi + 0x9b0]
0xdb2aef: mov r8b, 1
0xdb2af2: xor edx, edx
0xdb2af4: call 0x140deca40
0xdb2af9: jmp 0x140db2b63
0xdb2afb: call 0x140cb6d80
0xdb2b00: mov r9, qword ptr [rdi + 0x9b0]
0xdb2b07: xor edx, edx
0xdb2b09: mov r8d, edx
0xdb2b0c: lea rcx, [r9 + 0x1e8]
0xdb2b13: mov rax, rcx
0xdb2b16: cmp byte ptr [rax], dl
0xdb2b18: jne 0x140db2b2b
0xdb2b1a: inc r8d
0xdb2b1d: inc rax
0xdb2b20: cmp r8d, 3
0xdb2b24: jb 0x140db2b16
0xdb2b26: xor r8b, r8b
0xdb2b29: jmp 0x140db2b2e
0xdb2b2b: mov r8b, 1
0xdb2b2e: movzx eax, byte ptr [rcx]
0xdb2b31: btr eax, 0
0xdb2b35: mov byte ptr [rcx], al
0xdb2b37: cmp byte ptr [rcx], 0
0xdb2b3a: jne 0x140db2b4a
0xdb2b3c: inc edx
0xdb2b3e: inc rcx
0xdb2b41: cmp edx, 3
0xdb2b44: jb 0x140db2b37
0xdb2b46: xor al, al
0xdb2b48: jmp 0x140db2b4c
0xdb2b4a: mov al, 1
0xdb2b4c: cmp r8b, al
0xdb2b4f: je 0x140db2b63
0xdb2b51: mov rdx, qword ptr [r9]
0xdb2b54: mov rcx, r9
0xdb2b57: test al, al
0xdb2b59: je 0x140db2b60
0xdb2b5b: call qword ptr [rdx + 0x28]
0xdb2b5e: jmp 0x140db2b63
0xdb2b60: call qword ptr [rdx + 0x20]
0xdb2b63: mov rbx, qword ptr [rdi + 0x9b8]
0xdb2b6a: mov eax, dword ptr [rdi + 0x9c0]
0xdb2b70: lea rbp, [rbx + rax*8]
0xdb2b74: cmp rbx, rbp
0xdb2b77: je 0x140db2b97
0xdb2b79: nop dword ptr [rax]
0xdb2b80: mov rcx, qword ptr [rbx]
0xdb2b83: movzx r8d, sil
0xdb2b87: xor edx, edx
0xdb2b89: call 0x140deca40
0xdb2b8e: add rbx, 8
0xdb2b92: cmp rbx, rbp
0xdb2b95: jne 0x140db2b80
0xdb2b97: movzx r8d, sil
0xdb2b9b: mov edx, 1
0xdb2ba0: mov rcx, rdi
0xdb2ba3: mov rbx, qword ptr [rsp + 0x60]
0xdb2ba8: mov rbp, qword ptr [rsp + 0x68]
0xdb2bad: mov rsi, qword ptr [rsp + 0x70]
0xdb2bb2: add rsp, 0x50
0xdb2bb6: pop rdi
0xdb2bb7: jmp 0x140dd1460