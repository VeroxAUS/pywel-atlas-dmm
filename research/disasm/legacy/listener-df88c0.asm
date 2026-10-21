0xdf88c0: mov qword ptr [rsp + 0x18], rbx
0xdf88c5: push rbp
0xdf88c6: push rsi
0xdf88c7: push rdi
0xdf88c8: push r12
0xdf88ca: push r13
0xdf88cc: push r14
0xdf88ce: push r15
0xdf88d0: lea rbp, [rsp - 0x17]
0xdf88d5: sub rsp, 0x90
0xdf88dc: movzx esi, r9b
0xdf88e0: mov r14, r8
0xdf88e3: mov r15, rdx
0xdf88e6: mov rdi, rcx
0xdf88e9: mov rax, qword ptr gs:[0x58]
0xdf88f2: mov r12, qword ptr [rax]
0xdf88f5: mov ecx, 0x1ec
0xdf88fa: mov rax, qword ptr [rip + 0x5f70c27]
0xdf8901: cmp byte ptr [rcx + r12], 0
0xdf8906: cmovne rax, qword ptr [rip + 0x5f70c22]
0xdf890e: mov rax, qword ptr [rax]
0xdf8911: mov rax, qword ptr [rax + 8]
0xdf8915: mov ecx, 0xea
0xdf891a: mov edx, 0x16c
0xdf891f: movzx ebx, byte ptr [rbp + 0x7f]
0xdf8923: test bl, bl
0xdf8925: cmovne ecx, edx
0xdf8928: mov rax, qword ptr [rax + 0x270]
0xdf892f: movzx ecx, word ptr [rcx + rax]
0xdf8933: mov word ptr [rbp + 0x7f], cx
0xdf8937: xor r13d, r13d
0xdf893a: mov qword ptr [rbp - 0x19], r13
0xdf893e: mov qword ptr [rbp - 0x11], r13
0xdf8942: vpxor xmm0, xmm0, xmm0
0xdf8946: vmovdqu xmmword ptr [rbp - 9], xmm0
0xdf894b: mov qword ptr [rbp + 7], r13
0xdf894f: mov edx, 1
0xdf8954: mov r8d, 0x20
0xdf895a: lea rcx, [rbp - 0x19]
0xdf895e: call 0x14047b1e0
0xdf8963: mov ecx, dword ptr [rbp - 0x19]
0xdf8966: lea eax, [rcx + 0x20]
0xdf8969: cmp dword ptr [rbp - 0xd], eax
0xdf896c: jb 0x140df89c0
0xdf896e: mov r8d, dword ptr [rbp - 0x15]
0xdf8972: lea eax, [r8 + 1]
0xdf8976: cmp eax, dword ptr [rbp - 0x11]
0xdf8979: ja 0x140df89c0
0xdf897b: mov edx, ecx
0xdf897d: add rdx, qword ptr [rbp + 7]
0xdf8981: mov qword ptr [rbp + 0x57], rdx
0xdf8985: lea rax, [rip + 0x4785444]
0xdf898c: mov qword ptr [rdx], rax
0xdf898f: lea rax, [rip + 0x487419a]
0xdf8996: mov qword ptr [rdx], rax
0xdf8999: mov qword ptr [rdx + 8], r13
0xdf899d: mov byte ptr [rdx + 0x10], 0xd
0xdf89a1: mov eax, dword ptr [rip + 0x5ed8709]
0xdf89a7: mov dword ptr [rdx + 0x14], eax
0xdf89aa: mov byte ptr [rdx + 0x18], r8b
0xdf89ae: mov ecx, dword ptr [rbp - 0x15]
0xdf89b1: mov rax, qword ptr [rbp - 9]
0xdf89b5: mov qword ptr [rax + rcx*8], rdx
0xdf89b9: inc dword ptr [rbp - 0x15]
0xdf89bc: add dword ptr [rbp - 0x19], 0x20
0xdf89c0: mov qword ptr [rbp - 0x29], r15
0xdf89c4: mov byte ptr [rbp - 0x21], 0x15
0xdf89c8: xor eax, eax
0xdf89ca: mov dword ptr [rbp - 0x20], eax
0xdf89cd: mov word ptr [rbp - 0x1c], ax
0xdf89d1: mov byte ptr [rbp - 0x1a], al
0xdf89d4: lea rcx, [rbp + 0x7f]
0xdf89d8: call 0x140537250
0xdf89dd: mov rcx, qword ptr [rax + 0x68]
0xdf89e1: mov rax, qword ptr [rcx]
0xdf89e4: xor edx, edx
0xdf89e6: call qword ptr [rax + 8]
0xdf89e9: vxorps xmm0, xmm0, xmm0
0xdf89ed: vmovss dword ptr [rbp + 0x57], xmm0
0xdf89f2: mov dword ptr [rbp + 0x5f], r13d
0xdf89f6: mov byte ptr [rsp + 0x48], 1
0xdf89fb: lea rcx, [rbp - 0x19]
0xdf89ff: mov qword ptr [rsp + 0x40], rcx
0xdf8a04: mov byte ptr [rsp + 0x38], 0
0xdf8a09: mov qword ptr [rsp + 0x30], rax
0xdf8a0e: mov qword ptr [rsp + 0x28], r14
0xdf8a13: lea rax, [rbp + 0x57]
0xdf8a17: mov qword ptr [rsp + 0x20], rax
0xdf8a1c: lea r9, [rbp + 0x5f]
0xdf8a20: lea r8, [rbp - 0x29]
0xdf8a24: lea rdx, [rbp + 0x7f]
0xdf8a28: mov rcx, rdi
0xdf8a2b: call 0x140deeb60
0xdf8a30: mov dword ptr [rbp + 0x57], r13d
0xdf8a34: mov rax, qword ptr [rdi]
0xdf8a37: lea r9, [rbp + 0x57]
0xdf8a3b: lea r8, [rbp - 0x29]
0xdf8a3f: lea rdx, [rbp + 0x7f]
0xdf8a43: mov rcx, rdi
0xdf8a46: call qword ptr [rax + 0x548]
0xdf8a4c: mov r14, rax
0xdf8a4f: test rax, rax
0xdf8a52: je 0x140df8bd6
0xdf8a58: movzx ecx, byte ptr [rbp + 0x77]
0xdf8a5c: call 0x140dec470
0xdf8a61: mov rdi, rax
0xdf8a64: movzx edx, bl
0xdf8a67: movzx ecx, sil
0xdf8a6b: call 0x140dec5b0
0xdf8a70: mov rsi, rax
0xdf8a73: lea rdx, [rip + 0x48796a6]
0xdf8a7a: mov rcx, qword ptr [r14 + 0x118]
0xdf8a81: call 0x143ed6790
0xdf8a86: mov r15, rax
0xdf8a89: test rax, rax
0xdf8a8c: je 0x140df8b12
0xdf8a92: mov rbx, qword ptr [rax + 0x20]
0xdf8a96: mov rcx, qword ptr [rbx]
0xdf8a99: mov rax, qword ptr [rcx + 0xa0]
0xdf8aa0: test rax, rax
0xdf8aa3: je 0x140df8aac
0xdf8aa5: cmp qword ptr [rax + 8], 0
0xdf8aaa: jne 0x140df8ad2
0xdf8aac: cmp dword ptr [rdi], 0
0xdf8aaf: je 0x140df8ad2
0xdf8ab1: mov rdx, rdi
0xdf8ab4: mov rcx, qword ptr [rbx + 8]
0xdf8ab8: call 0x1435ca0a0
0xdf8abd: test al, al
0xdf8abf: je 0x140df8ad2
0xdf8ac1: mov rcx, qword ptr [rbx + 8]
0xdf8ac5: call 0x1435caec0
0xdf8aca: mov rcx, rbx
0xdf8acd: call 0x1435c66a0
0xdf8ad2: mov rbx, qword ptr [r15 + 0x20]
0xdf8ad6: mov rax, qword ptr [rbx]
0xdf8ad9: mov rcx, qword ptr [rax + 0xa0]
0xdf8ae0: test rcx, rcx
0xdf8ae3: je 0x140df8aec
0xdf8ae5: cmp qword ptr [rcx + 8], 0
0xdf8aea: jne 0x140df8b12
0xdf8aec: cmp dword ptr [rsi], 0
0xdf8aef: je 0x140df8b12
0xdf8af1: mov rdx, rsi
0xdf8af4: mov rcx, qword ptr [rbx + 8]
0xdf8af8: call 0x1435ca0a0
0xdf8afd: test al, al
0xdf8aff: je 0x140df8b12
0xdf8b01: mov rcx, qword ptr [rbx + 8]
0xdf8b05: call 0x1435caec0
0xdf8b0a: mov rcx, rbx
0xdf8b0d: call 0x1435c66a0
0xdf8b12: mov rax, qword ptr [r14]
0xdf8b15: lea rdx, [rip + 0x5ed8774]
0xdf8b1c: mov rcx, r14
0xdf8b1f: call qword ptr [rax + 0x190]
0xdf8b25: test al, al
0xdf8b27: je 0x140df8bd6
0xdf8b2d: mov rcx, qword ptr [r14 + 0x1f8]
0xdf8b34: test rcx, rcx
0xdf8b37: je 0x140df8bd6
0xdf8b3d: lea rdx, [rip + 0x48795dc]
0xdf8b44: call 0x143ed6790
0xdf8b49: mov r14, rax
0xdf8b4c: test rax, rax
0xdf8b4f: je 0x140df8bd6
0xdf8b55: mov rbx, qword ptr [rax + 0x20]
0xdf8b59: mov rcx, qword ptr [rbx]
0xdf8b5c: mov rax, qword ptr [rcx + 0xa0]
0xdf8b63: test rax, rax
0xdf8b66: je 0x140df8b6f
0xdf8b68: cmp qword ptr [rax + 8], 0
0xdf8b6d: jne 0x140df8b95
0xdf8b6f: cmp dword ptr [rdi], 0
0xdf8b72: je 0x140df8b95
0xdf8b74: mov rdx, rdi
0xdf8b77: mov rcx, qword ptr [rbx + 8]
0xdf8b7b: call 0x1435ca0a0
0xdf8b80: test al, al
0xdf8b82: je 0x140df8b95
0xdf8b84: mov rcx, qword ptr [rbx + 8]
0xdf8b88: call 0x1435caec0
0xdf8b8d: mov rcx, rbx
0xdf8b90: call 0x1435c66a0
0xdf8b95: mov rbx, qword ptr [r14 + 0x20]
0xdf8b99: mov rax, qword ptr [rbx]
0xdf8b9c: mov rcx, qword ptr [rax + 0xa0]
0xdf8ba3: test rcx, rcx
0xdf8ba6: je 0x140df8baf
0xdf8ba8: cmp qword ptr [rcx + 8], 0
0xdf8bad: jne 0x140df8bd6
0xdf8baf: cmp dword ptr [rsi], 0
0xdf8bb2: je 0x140df8bd6
0xdf8bb4: mov rdx, rsi
0xdf8bb7: mov rcx, qword ptr [rbx + 8]
0xdf8bbb: call 0x1435ca0a0
0xdf8bc0: test al, al
0xdf8bc2: je 0x140df8bd6
0xdf8bc4: mov rcx, qword ptr [rbx + 8]
0xdf8bc8: call 0x1435caec0
0xdf8bcd: mov rcx, rbx
0xdf8bd0: call 0x1435c66a0
0xdf8bd5: nop 
0xdf8bd6: mov rcx, qword ptr [rbp + 7]
0xdf8bda: test rcx, rcx
0xdf8bdd: je 0x140df8cbe
0xdf8be3: mov edi, r13d
0xdf8be6: cmp dword ptr [rbp - 0x15], r13d
0xdf8bea: jbe 0x140df8c14
0xdf8bec: nop dword ptr [rax]
0xdf8bf0: mov ebx, edi
0xdf8bf2: mov rax, qword ptr [rbp - 9]
0xdf8bf6: mov rcx, qword ptr [rax + rbx*8]
0xdf8bfa: mov rax, qword ptr [rcx]
0xdf8bfd: xor edx, edx
0xdf8bff: call qword ptr [rax]
0xdf8c01: mov rax, qword ptr [rbp - 9]
0xdf8c05: mov qword ptr [rax + rbx*8], r13
0xdf8c09: inc edi
0xdf8c0b: cmp edi, dword ptr [rbp - 0x15]
0xdf8c0e: jb 0x140df8bf0
0xdf8c10: mov rcx, qword ptr [rbp + 7]
0xdf8c14: mov qword ptr [rbp - 0x19], r13
0xdf8c18: mov rdx, qword ptr [rbp - 9]
0xdf8c1c: test rdx, rdx
0xdf8c1f: je 0x140df8c7e
0xdf8c21: mov rcx, qword ptr [rbp - 1]
0xdf8c25: test rcx, rcx
0xdf8c28: je 0x140df8c4d
0xdf8c2a: mov r8d, dword ptr [rbp - 0x11]
0xdf8c2e: lea r8d, [r8*8]
0xdf8c36: mov rax, qword ptr [rcx]
0xdf8c39: call qword ptr [rax + 0x10]
0xdf8c3c: mov ebx, 0x1fd
0xdf8c41: mov qword ptr [rbp - 9], r13
0xdf8c45: mov eax, ebx
0xdf8c47: mov rcx, qword ptr [rbp + 7]
0xdf8c4b: jmp 0x140df8c83
0xdf8c4d: mov ebx, 0x1fd
0xdf8c52: mov rcx, rdx
0xdf8c55: cmp byte ptr [rbx + r12], 0
0xdf8c5a: je 0x140df8c6d
0xdf8c5c: call 0x1447f03bc
0xdf8c61: mov qword ptr [rbp - 9], r13
0xdf8c65: mov eax, ebx
0xdf8c67: mov rcx, qword ptr [rbp + 7]
0xdf8c6b: jmp 0x140df8c83
0xdf8c6d: call 0x1447f02bc
0xdf8c72: mov qword ptr [rbp - 9], r13
0xdf8c76: mov eax, ebx
0xdf8c78: mov rcx, qword ptr [rbp + 7]
0xdf8c7c: jmp 0x140df8c83
0xdf8c7e: mov eax, 0x1fd
0xdf8c83: test rcx, rcx
0xdf8c86: je 0x140df8cba
0xdf8c88: mov r9, qword ptr [rbp - 1]
0xdf8c8c: test r9, r9
0xdf8c8f: je 0x140df8ca3
0xdf8c91: mov rax, qword ptr [r9]
0xdf8c94: mov r8d, dword ptr [rbp - 0xd]
0xdf8c98: mov rdx, rcx
0xdf8c9b: mov rcx, r9
0xdf8c9e: call qword ptr [rax + 0x10]
0xdf8ca1: jmp 0x140df8cb6
0xdf8ca3: cmp byte ptr [r12 + rax], 0
0xdf8ca8: je 0x140df8cb1
0xdf8caa: call 0x1447f03bc
0xdf8caf: jmp 0x140df8cb6
0xdf8cb1: call 0x1447f02bc
0xdf8cb6: mov qword ptr [rbp + 7], r13
0xdf8cba: mov qword ptr [rbp - 0x11], r13
0xdf8cbe: mov rbx, qword ptr [rsp + 0xe0]
0xdf8cc6: add rsp, 0x90
0xdf8ccd: pop r15
0xdf8ccf: pop r14
0xdf8cd1: pop r13
0xdf8cd3: pop r12
0xdf8cd5: pop rdi
0xdf8cd6: pop rsi
0xdf8cd7: pop rbp
0xdf8cd8: ret 