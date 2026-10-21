0x4a47e0: mov r11, rsp
0x4a47e3: mov qword ptr [r11 + 0x18], rbx
0x4a47e7: mov byte ptr [r11 + 0x20], r9b
0x4a47eb: mov qword ptr [r11 + 0x10], rdx
0x4a47ef: push rbp
0x4a47f0: push rsi
0x4a47f1: push rdi
0x4a47f2: push r14
0x4a47f4: push r15
0x4a47f6: sub rsp, 0x60
0x4a47fa: movzx ebp, r9b
0x4a47fe: mov rsi, r8
0x4a4801: mov r14, rdx
0x4a4804: mov rdi, rcx
0x4a4807: cmp byte ptr [rcx + 0x1a], 0
0x4a480b: je 0x1404a483a
0x4a480d: lea rdx, [rcx + 0x40]
0x4a4811: lea rax, [r11 + 0x30]
0x4a4815: mov qword ptr [r11 - 0x58], rax
0x4a4819: lea rax, [r11 + 0x28]
0x4a481d: mov qword ptr [r11 - 0x60], rax
0x4a4821: lea rax, [r11 + 0x20]
0x4a4825: mov qword ptr [r11 - 0x68], rax
0x4a4829: mov r9, r8
0x4a482c: lea r8, [r11 + 0x10]
0x4a4830: call 0x1404a9d00
0x4a4835: jmp 0x1404a49aa
0x4a483a: mov rbx, qword ptr [rip + 0x68d1af7]
0x4a4841: mov qword ptr [rsp + 0x90], rbx
0x4a4849: mov rax, qword ptr [rbx]
0x4a484c: mov rcx, rbx
0x4a484f: call qword ptr [rax + 8]
0x4a4852: nop 
0x4a4853: mov qword ptr [rsp + 0x40], r14
0x4a4858: vmovsd xmm0, qword ptr [rsi]
0x4a485c: vmovsd qword ptr [rsp + 0x48], xmm0
0x4a4862: mov eax, dword ptr [rsi + 8]
0x4a4865: mov dword ptr [rsp + 0x50], eax
0x4a4869: mov byte ptr [rsp + 0x54], bpl
0x4a486e: movzx eax, byte ptr [rsp + 0xb0]
0x4a4876: mov byte ptr [rsp + 0x55], al
0x4a487a: movzx eax, byte ptr [rsp + 0xb8]
0x4a4882: mov byte ptr [rsp + 0x56], al
0x4a4886: mov ecx, dword ptr [rdi + 0x28]
0x4a4889: mov eax, dword ptr [rdi + 0x2c]
0x4a488c: cmp eax, ecx
0x4a488e: ja 0x1404a4958
0x4a4894: lea esi, [rax*2 + 1]
0x4a489b: add esi, eax
0x4a489d: shr esi, 1
0x4a489f: mov r15d, 1
0x4a48a5: cmp esi, r15d
0x4a48a8: cmovb esi, r15d
0x4a48ac: cmp ecx, esi
0x4a48ae: cmova esi, ecx
0x4a48b1: cmp esi, eax
0x4a48b3: jbe 0x1404a4958
0x4a48b9: lea ecx, [rsi + rsi*2]
0x4a48bc: shl ecx, 3
0x4a48bf: mov r14d, 0x1fd
0x4a48c5: mov rax, qword ptr gs:[0x58]
0x4a48ce: add r14, qword ptr [rax]
0x4a48d1: mov edx, 8
0x4a48d6: cmp byte ptr [r14], 0
0x4a48da: je 0x1404a48e3
0x4a48dc: call 0x1447efa78
0x4a48e1: jmp 0x1404a48e8
0x4a48e3: call 0x1447ef9b0
0x4a48e8: mov rbp, rax
0x4a48eb: test rax, rax
0x4a48ee: jne 0x1404a4909
0x4a48f0: call 0x141318e70
0x4a48f5: xor r9d, r9d
0x4a48f8: xor r8d, r8d
0x4a48fb: mov edx, r15d
0x4a48fe: mov ecx, 0xa0000002
0x4a4903: call qword ptr [rip + 0x4d4683f]
0x4a4909: xor edx, edx
0x4a490b: cmp dword ptr [rdi + 0x28], edx
0x4a490e: jbe 0x1404a4936
0x4a4910: lea rcx, [rdx + rdx*2]
0x4a4914: mov rax, qword ptr [rdi + 0x20]
0x4a4918: vmovups xmm0, xmmword ptr [rax + rcx*8]
0x4a491d: vmovups xmmword ptr [rbp + rcx*8], xmm0
0x4a4923: vmovsd xmm1, qword ptr [rax + rcx*8 + 0x10]
0x4a4929: vmovsd qword ptr [rbp + rcx*8 + 0x10], xmm1
0x4a492f: inc edx
0x4a4931: cmp edx, dword ptr [rdi + 0x28]
0x4a4934: jb 0x1404a4910
0x4a4936: mov rcx, qword ptr [rdi + 0x20]
0x4a493a: test rcx, rcx
0x4a493d: je 0x1404a4951
0x4a493f: cmp byte ptr [r14], 0
0x4a4943: je 0x1404a494c
0x4a4945: call 0x1447f03bc
0x4a494a: jmp 0x1404a4951
0x4a494c: call 0x1447f02bc
0x4a4951: mov qword ptr [rdi + 0x20], rbp
0x4a4955: mov dword ptr [rdi + 0x2c], esi
0x4a4958: mov eax, dword ptr [rdi + 0x28]
0x4a495b: lea rcx, [rax + rax*2]
0x4a495f: mov rax, qword ptr [rdi + 0x20]
0x4a4963: vmovups xmm0, xmmword ptr [rsp + 0x40]
0x4a4969: vmovups xmmword ptr [rax + rcx*8], xmm0
0x4a496e: vmovsd xmm1, qword ptr [rsp + 0x50]
0x4a4974: vmovsd qword ptr [rax + rcx*8 + 0x10], xmm1
0x4a497a: mov ecx, dword ptr [rdi + 0x28]
0x4a497d: lea eax, [rcx + 1]
0x4a4980: mov dword ptr [rdi + 0x28], eax
0x4a4983: cmp byte ptr [rdi + 0x18], 0
0x4a4987: jne 0x1404a49a1
0x4a4989: mov qword ptr [rsp + 0x40], rdi
0x4a498e: mov dword ptr [rsp + 0x48], ecx
0x4a4992: lea rdx, [rsp + 0x40]
0x4a4997: mov rcx, qword ptr [rdi + 0x10]
0x4a499b: call 0x14038a0a0
0x4a49a0: nop 
0x4a49a1: mov rax, qword ptr [rbx]
0x4a49a4: mov rcx, rbx
0x4a49a7: call qword ptr [rax + 0x10]
0x4a49aa: mov rbx, qword ptr [rsp + 0xa0]
0x4a49b2: add rsp, 0x60
0x4a49b6: pop r15
0x4a49b8: pop r14
0x4a49ba: pop rdi
0x4a49bb: pop rsi
0x4a49bc: pop rbp
0x4a49bd: ret 
0x4a49be: int3 
0x4a49bf: int3 
0x4a49c0: mov qword ptr [rsp + 0x10], rbx
0x4a49c5: mov qword ptr [rsp + 0x18], rsi
0x4a49ca: push rdi
0x4a49cb: push r14
0x4a49cd: push r15
0x4a49cf: sub rsp, 0x50
0x4a49d3: mov rsi, r9
0x4a49d6: mov r14, r8
0x4a49d9: mov r15, rdx
0x4a49dc: mov rdi, rcx
0x4a49df: cmp byte ptr [rcx + 0x1a], 0
0x4a49e3: je 0x1404a49fe
0x4a49e5: lea rdx, [rcx + 0x40]
0x4a49e9: mov qword ptr [rsp + 0x20], r9
0x4a49ee: mov r9, r8
0x4a49f1: mov r8, r15
0x4a49f4: call 0x1404a9fe0
0x4a49f9: jmp 0x1404a4aa8
0x4a49fe: mov rbx, qword ptr [rip + 0x68d1933]
0x4a4a05: mov qword ptr [rsp + 0x70], rbx
0x4a4a0a: mov rax, qword ptr [rbx]
0x4a4a0d: mov rcx, rbx
0x4a4a10: call qword ptr [rax + 8]
0x4a4a13: nop 
0x4a4a14: movzx eax, word ptr [r15]
0x4a4a18: mov word ptr [rsp + 0x30], ax
0x4a4a1d: movzx eax, byte ptr [r14]
0x4a4a21: mov byte ptr [rsp + 0x32], al
0x4a4a25: mov rdx, rsi
0x4a4a28: lea rcx, [rsp + 0x38]
0x4a4a2d: call 0x1404a5360
0x4a4a32: nop 
0x4a4a33: lea rcx, [rdi + 0x20]
0x4a4a37: lea rdx, [rsp + 0x30]
0x4a4a3c: call 0x1404a8a60
0x4a4a41: nop 
0x4a4a42: mov rcx, qword ptr [rsp + 0x38]
0x4a4a47: test rcx, rcx
0x4a4a4a: je 0x1404a4a71
0x4a4a4c: mov r8d, 0x1fd
0x4a4a52: mov rax, qword ptr gs:[0x58]
0x4a4a5b: mov rdx, qword ptr [rax]
0x4a4a5e: cmp byte ptr [r8 + rdx], 0
0x4a4a63: je 0x1404a4a6c
0x4a4a65: call 0x1447f03bc
0x4a4a6a: jmp 0x1404a4a71
0x4a4a6c: call 0x1447f02bc
0x4a4a71: xor eax, eax
0x4a4a73: mov qword ptr [rsp + 0x38], rax
0x4a4a78: mov qword ptr [rsp + 0x40], rax
0x4a4a7d: cmp byte ptr [rdi + 0x18], al
0x4a4a80: jne 0x1404a4a9f
0x4a4a82: mov qword ptr [rsp + 0x30], rdi
0x4a4a87: mov eax, dword ptr [rdi + 0x28]
0x4a4a8a: dec eax
0x4a4a8c: mov dword ptr [rsp + 0x38], eax
0x4a4a90: lea rdx, [rsp + 0x30]
0x4a4a95: mov rcx, qword ptr [rdi + 0x10]
0x4a4a99: call 0x14038a0a0
0x4a4a9e: nop 
0x4a4a9f: mov rax, qword ptr [rbx]
0x4a4aa2: mov rcx, rbx
0x4a4aa5: call qword ptr [rax + 0x10]
0x4a4aa8: mov rbx, qword ptr [rsp + 0x78]
0x4a4aad: mov rsi, qword ptr [rsp + 0x80]
0x4a4ab5: add rsp, 0x50
0x4a4ab9: pop r15
0x4a4abb: pop r14
0x4a4abd: pop rdi
0x4a4abe: ret 
0x4a4abf: int3 
0x4a4ac0: mov qword ptr [rsp + 0x10], rbx
0x4a4ac5: mov qword ptr [rsp + 0x20], rbp
0x4a4aca: push rsi
0x4a4acb: push rdi
0x4a4acc: push r12
0x4a4ace: push r14
0x4a4ad0: push r15
0x4a4ad2: sub rsp, 0x30
0x4a4ad6: mov rsi, rdx
0x4a4ad9: mov rdi, rcx
0x4a4adc: cmp byte ptr [rcx + 0x1a], 0
0x4a4ae0: je 0x1404a4af0
0x4a4ae2: add rcx, 0x40
0x4a4ae6: call 0x14040d5a0
0x4a4aeb: jmp 0x1404a4c2f
0x4a4af0: mov rbx, qword ptr [rip + 0x68d1841]
0x4a4af7: mov qword ptr [rsp + 0x70], rbx
0x4a4afc: mov rax, qword ptr [rbx]
0x4a4aff: mov rcx, rbx
0x4a4b02: call qword ptr [rax + 8]
0x4a4b05: nop 
0x4a4b06: vmovsd xmm0, qword ptr [rsi]
0x4a4b0a: vmovsd qword ptr [rsp + 0x60], xmm0
0x4a4b10: mov r15d, dword ptr [rsi + 8]
0x4a4b14: mov ecx, dword ptr [rdi + 0x28]
0x4a4b17: mov eax, dword ptr [rdi + 0x2c]
0x4a4b1a: cmp eax, ecx
0x4a4b1c: ja 0x1404a4bea
0x4a4b22: lea esi, [rax*2 + 1]
0x4a4b29: add esi, eax
0x4a4b2b: shr esi, 1
0x4a4b2d: mov r12d, 1
0x4a4b33: cmp esi, r12d
0x4a4b36: cmovb esi, r12d
0x4a4b3a: cmp ecx, esi
0x4a4b3c: cmova esi, ecx
0x4a4b3f: cmp esi, eax
0x4a4b41: jbe 0x1404a4bea
0x4a4b47: lea ecx, [rsi + rsi*2]
0x4a4b4a: shl ecx, 2
0x4a4b4d: mov r14d, 0x1fd
0x4a4b53: mov rax, qword ptr gs:[0x58]
0x4a4b5c: add r14, qword ptr [rax]
0x4a4b5f: mov edx, 4
0x4a4b64: cmp byte ptr [r14], 0
0x4a4b68: je 0x1404a4b71
0x4a4b6a: call 0x1447efa78
0x4a4b6f: jmp 0x1404a4b76
0x4a4b71: call 0x1447ef9b0
0x4a4b76: mov rbp, rax
0x4a4b79: test rax, rax
0x4a4b7c: jne 0x1404a4b97
0x4a4b7e: call 0x141318e70
0x4a4b83: xor r9d, r9d
0x4a4b86: xor r8d, r8d
0x4a4b89: mov edx, r12d
0x4a4b8c: mov ecx, 0xa0000002
0x4a4b91: call qword ptr [rip + 0x4d465b1]
0x4a4b97: xor edx, edx
0x4a4b99: cmp dword ptr [rdi + 0x28], edx
0x4a4b9c: jbe 0x1404a4bc2
0x4a4b9e: nop 
0x4a4ba0: lea rcx, [rdx + rdx*2]
0x4a4ba4: mov rax, qword ptr [rdi + 0x20]
0x4a4ba8: vmovsd xmm0, qword ptr [rax + rcx*4]
0x4a4bad: vmovsd qword ptr [rbp + rcx*4], xmm0
0x4a4bb3: mov eax, dword ptr [rax + rcx*4 + 8]
0x4a4bb7: mov dword ptr [rbp + rcx*4 + 8], eax
0x4a4bbb: inc edx
0x4a4bbd: cmp edx, dword ptr [rdi + 0x28]
0x4a4bc0: jb 0x1404a4ba0
0x4a4bc2: mov rcx, qword ptr [rdi + 0x20]
0x4a4bc6: test rcx, rcx
0x4a4bc9: je 0x1404a4bdd
0x4a4bcb: cmp byte ptr [r14], 0
0x4a4bcf: je 0x1404a4bd8
0x4a4bd1: call 0x1447f03bc
0x4a4bd6: jmp 0x1404a4bdd
0x4a4bd8: call 0x1447f02bc
0x4a4bdd: mov qword ptr [rdi + 0x20], rbp
0x4a4be1: mov dword ptr [rdi + 0x2c], esi
0x4a4be4: vmovsd xmm0, qword ptr [rsp + 0x60]
0x4a4bea: mov eax, dword ptr [rdi + 0x28]
0x4a4bed: lea rcx, [rax + rax*2]
0x4a4bf1: mov rax, qword ptr [rdi + 0x20]
0x4a4bf5: vmovsd qword ptr [rax + rcx*4], xmm0
0x4a4bfa: mov dword ptr [rax + rcx*4 + 8], r15d
0x4a4bff: mov ecx, dword ptr [rdi + 0x28]
0x4a4c02: lea eax, [rcx + 1]
0x4a4c05: mov dword ptr [rdi + 0x28], eax
0x4a4c08: cmp byte ptr [rdi + 0x18], 0
0x4a4c0c: jne 0x1404a4c26
0x4a4c0e: mov qword ptr [rsp + 0x20], rdi
0x4a4c13: mov dword ptr [rsp + 0x28], ecx
0x4a4c17: lea rdx, [rsp + 0x20]
0x4a4c1c: mov rcx, qword ptr [rdi + 0x10]
0x4a4c20: call 0x14038a0a0
0x4a4c25: nop 
0x4a4c26: mov rax, qword ptr [rbx]
0x4a4c29: mov rcx, rbx
0x4a4c2c: call qword ptr [rax + 0x10]
0x4a4c2f: mov rbx, qword ptr [rsp + 0x68]
0x4a4c34: mov rbp, qword ptr [rsp + 0x78]
0x4a4c39: add rsp, 0x30
0x4a4c3d: pop r15
0x4a4c3f: pop r14
0x4a4c41: pop r12
0x4a4c43: pop rdi
0x4a4c44: pop rsi
0x4a4c45: ret 
0x4a4c46: int3 
0x4a4c47: int3 
0x4a4c48: int3 
0x4a4c49: int3 
0x4a4c4a: int3 
0x4a4c4b: int3 
0x4a4c4c: int3 
0x4a4c4d: int3 
0x4a4c4e: int3 
0x4a4c4f: int3 
0x4a4c50: mov qword ptr [rsp + 8], rcx
0x4a4c55: push rbx
0x4a4c56: sub rsp, 0x20
0x4a4c5a: mov rbx, rcx
0x4a4c5d: mov rcx, qword ptr [rcx + 0xb8]
0x4a4c64: mov r8d, 0x1fd
0x4a4c6a: test rcx, rcx
0x4a4c6d: je 0x1404a4c99
0x4a4c6f: mov rax, qword ptr gs:[0x58]
0x4a4c78: mov rdx, qword ptr [rax]
0x4a4c7b: cmp byte ptr [r8 + rdx], 0
0x4a4c80: je 0x1404a4c89
0x4a4c82: call 0x1447f03bc
0x4a4c87: jmp 0x1404a4c8e
0x4a4c89: call 0x1447f02bc
0x4a4c8e: mov qword ptr [rbx + 0xb8], 0
0x4a4c99: lea rcx, [rbx + 0x10]
0x4a4c9d: call 0x140394db0
0x4a4ca2: mov rax, rbx
0x4a4ca5: add rsp, 0x20
0x4a4ca9: pop rbx
0x4a4caa: ret 
0x4a4cab: int3 
0x4a4cac: int3 
0x4a4cad: int3 
0x4a4cae: int3 
0x4a4caf: int3 
0x4a4cb0: jmp 0x140496ca0
0x4a4cb5: int3 
0x4a4cb6: int3 
0x4a4cb7: int3 
0x4a4cb8: int3 
0x4a4cb9: int3 
0x4a4cba: int3 
0x4a4cbb: int3 
0x4a4cbc: int3 
0x4a4cbd: int3 
0x4a4cbe: int3 
0x4a4cbf: int3 
0x4a4cc0: mov qword ptr [rsp + 0x20], r9
0x4a4cc5: push rbx
0x4a4cc6: push rsi
0x4a4cc7: push rdi
0x4a4cc8: push r13
0x4a4cca: push r15
0x4a4ccc: sub rsp, 0x20
0x4a4cd0: inc dword ptr [rcx + 0xc]
0x4a4cd3: mov r13, r8
0x4a4cd6: cmp dword ptr [rcx], 0
0x4a4cd9: mov r15, rdx
0x4a4cdc: mov rax, qword ptr [r8]
0x4a4cdf: mov rbx, rcx
0x4a4ce2: movzx esi, word ptr [rax]
0x4a4ce5: jne 0x1404a4cee
0x4a4ce7: mov edx, esi
0x4a4ce9: call 0x140391680
0x4a4cee: mov r10d, dword ptr [rbx]
0x4a4cf1: mov qword ptr [rsp + 0x60], r14
0x4a4cf6: lea r14, [rbx + 0x10]
0x4a4cfa: test r10d, r10d
0x4a4cfd: je 0x1404a4d4c
0x4a4cff: xor edx, edx
0x4a4d01: mov eax, esi
0x4a4d03: div r10d
0x4a4d06: mov r8d, edx
0x4a4d09: xor edx, edx
0x4a4d0b: shl r8, 8
0x4a4d0f: add r8, qword ptr [r14]
0x4a4d12: mov r9d, dword ptr [r8]
0x4a4d15: test r9d, r9d
0x4a4d18: je 0x1404a4d4c
0x4a4d1a: nop word ptr [rax + rax]
0x4a4d20: cmp dword ptr [r8 + rdx*8 + 8], esi
0x4a4d25: jne 0x1404a4d45
0x4a4d27: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0x4a4d2c: mov rax, qword ptr [rbx + 0x18]
0x4a4d30: mov rdi, qword ptr [rax + rcx*8]
0x4a4d34: mov rax, qword ptr [r13]
0x4a4d38: movzx ecx, word ptr [rax]
0x4a4d3b: cmp word ptr [rdi + 4], cx
0x4a4d3f: je 0x1404a4dd6
0x4a4d45: inc edx
0x4a4d47: cmp edx, r9d
0x4a4d4a: jb 0x1404a4d20
0x4a4d4c: xor edx, edx
0x4a4d4e: mov qword ptr [rsp + 0x50], rbp
0x4a4d53: mov eax, esi
0x4a4d55: mov qword ptr [rsp + 0x58], r12
0x4a4d5a: div r10d
0x4a4d5d: mov rax, qword ptr [r14]
0x4a4d60: mov ecx, edx
0x4a4d62: shl rcx, 8
0x4a4d66: mov r12d, edx
0x4a4d69: cmp dword ptr [rcx + rax], 0x1f
0x4a4d6d: jne 0x1404a4d82
0x4a4d6f: mov edx, esi
0x4a4d71: mov rcx, rbx
0x4a4d74: call 0x140391680
0x4a4d79: xor edx, edx
0x4a4d7b: mov eax, esi
0x4a4d7d: div dword ptr [rbx]
0x4a4d7f: mov r12d, edx
0x4a4d82: mov ebp, dword ptr [rbx + 4]
0x4a4d85: mov edi, r12d
0x4a4d88: shl rdi, 8
0x4a4d8c: add rdi, qword ptr [r14]
0x4a4d8f: mov r14d, dword ptr [rdi]
0x4a4d92: cmp ebp, dword ptr [rbx + 8]
0x4a4d95: jb 0x1404a4da2
0x4a4d97: lea edx, [rbp + 1]
0x4a4d9a: mov rcx, rbx
0x4a4d9d: call 0x1403a41c0
0x4a4da2: mov rax, qword ptr gs:[0x58]
0x4a4dab: mov edx, 0x1fd
0x4a4db0: mov dword ptr [rdi + r14*8 + 8], esi
0x4a4db5: mov dword ptr [rdi + r14*8 + 0xc], ebp
0x4a4dba: mov rcx, qword ptr [rax]
0x4a4dbd: inc dword ptr [rdi]
0x4a4dbf: cmp byte ptr [rdx + rcx], 0
0x4a4dc3: mov edx, 8
0x4a4dc8: mov ecx, 0x20
0x4a4dcd: je 0x1404a4de3
0x4a4dcf: call 0x1447efa78
0x4a4dd4: jmp 0x1404a4de8
0x4a4dd6: test rdi, rdi
0x4a4dd9: je 0x1404a4d4c
0x4a4ddf: xor al, al
0x4a4de1: jmp 0x1404a4e4e
0x4a4de3: call 0x1447ef9b0
0x4a4de8: mov rdi, rax
0x4a4deb: test rax, rax
0x4a4dee: jne 0x1404a4e0b
0x4a4df0: call 0x141318e70
0x4a4df5: xor r9d, r9d
0x4a4df8: xor r8d, r8d
0x4a4dfb: mov edx, 1
0x4a4e00: mov ecx, 0xa0000002
0x4a4e05: call qword ptr [rip + 0x4d4633d]
0x4a4e0b: mov rax, qword ptr [r13]
0x4a4e0f: movzx ecx, word ptr [rax]
0x4a4e12: mov word ptr [rdi + 4], cx
0x4a4e16: imul eax, r12d, 0x1f
0x4a4e1a: mov r12, qword ptr [rsp + 0x58]
0x4a4e1f: add eax, r14d
0x4a4e22: mov dword ptr [rdi], eax
0x4a4e24: mov rax, qword ptr [rsp + 0x68]
0x4a4e29: vmovups xmm0, xmmword ptr [rax]
0x4a4e2d: vmovups xmmword ptr [rdi + 8], xmm0
0x4a4e32: vmovsd xmm1, qword ptr [rax + 0x10]
0x4a4e37: vmovsd qword ptr [rdi + 0x18], xmm1
0x4a4e3c: mov rax, qword ptr [rbx + 0x18]
0x4a4e40: mov qword ptr [rax + rbp*8], rdi
0x4a4e44: mov al, 1
0x4a4e46: inc dword ptr [rbx + 4]
0x4a4e49: mov rbp, qword ptr [rsp + 0x50]
0x4a4e4e: mov r14, qword ptr [rsp + 0x60]
0x4a4e53: mov byte ptr [r15], al
0x4a4e56: lea rax, [rdi + 4]
0x4a4e5a: mov qword ptr [r15 + 8], rax
0x4a4e5e: lea rax, [rdi + 8]
0x4a4e62: mov qword ptr [r15 + 0x10], rax
0x4a4e66: mov rax, r15
0x4a4e69: mov dword ptr [r15 + 4], esi
0x4a4e6d: add rsp, 0x20
0x4a4e71: pop r15
0x4a4e73: pop r13
0x4a4e75: pop rdi
0x4a4e76: pop rsi
0x4a4e77: pop rbx
0x4a4e78: ret 
0x4a4e79: int3 
0x4a4e7a: int3 
0x4a4e7b: int3 
0x4a4e7c: int3 
0x4a4e7d: int3 
0x4a4e7e: int3 
0x4a4e7f: int3 
0x4a4e80: jmp 0x140498d60
0x4a4e85: int3 
0x4a4e86: int3 
0x4a4e87: int3 
0x4a4e88: int3 
0x4a4e89: int3 
0x4a4e8a: int3 
0x4a4e8b: int3 
0x4a4e8c: int3 
0x4a4e8d: int3 
0x4a4e8e: int3 
0x4a4e8f: int3 
0x4a4e90: test dl, dl
0x4a4e92: je 0x1404a4eae
0x4a4e94: mov rax, qword ptr [rip + 0x68c42f5]
0x4a4e9b: mov rcx, qword ptr [rax + 0x80]
0x4a4ea2: mov rcx, qword ptr [rcx + 0xb20]
0x4a4ea9: jmp 0x140423990
0x4a4eae: ret 
0x4a4eaf: int3 
0x4a4eb0: movzx ecx, dl
0x4a4eb3: jmp 0x14049a870
0x4a4eb8: int3 
0x4a4eb9: int3 
0x4a4eba: int3 
0x4a4ebb: int3 
0x4a4ebc: int3 
0x4a4ebd: int3 
0x4a4ebe: int3 
0x4a4ebf: int3 
0x4a4ec0: mov rcx, rdx
0x4a4ec3: jmp 0x14049ac80
0x4a4ec8: int3 
0x4a4ec9: int3 
0x4a4eca: int3 
0x4a4ecb: int3 
0x4a4ecc: int3 
0x4a4ecd: int3 
0x4a4ece: int3 
0x4a4ecf: int3 
0x4a4ed0: push r14
0x4a4ed2: push r15
0x4a4ed4: sub rsp, 0x28
0x4a4ed8: mov eax, dword ptr [rcx + 8]
0x4a4edb: mov r15, rdx
0x4a4ede: mov r14, rcx
0x4a4ee1: test eax, eax