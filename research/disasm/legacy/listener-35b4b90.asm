0x35b4b90: push rbx
0x35b4b92: sub rsp, 0x20
0x35b4b96: mov r10, qword ptr [rcx]
0x35b4b99: xor r9d, r9d
0x35b4b9c: mov r11, rdx
0x35b4b9f: mov rbx, qword ptr [r10 + 0xa0]
0x35b4ba6: test rbx, rbx
0x35b4ba9: je 0x1435b4bbc
0x35b4bab: cmp qword ptr [rbx + 8], r9
0x35b4baf: je 0x1435b4bbc
0x35b4bb1: mov rcx, qword ptr [r10 + 0x38]
0x35b4bb5: call 0x143ed8480
0x35b4bba: jmp 0x1435b4bf1
0x35b4bbc: movzx edx, byte ptr [r10 + 0x94]
0x35b4bc4: cmp dl, 0xff
0x35b4bc7: je 0x1435b4ca0
0x35b4bcd: mov rax, qword ptr [r10 + 0x58]
0x35b4bd1: mov rcx, qword ptr [rax + 0xb0]
0x35b4bd8: mov r8, qword ptr [rcx + 0xb0]
0x35b4bdf: cmp edx, dword ptr [r8 + 8]
0x35b4be3: jb 0x1435b4bea
0x35b4be5: mov rax, r9
0x35b4be8: jmp 0x1435b4bf1
0x35b4bea: mov rax, qword ptr [r8]
0x35b4bed: mov rax, qword ptr [rax + rdx*8]
0x35b4bf1: test rax, rax
0x35b4bf4: je 0x1435b4ca0
0x35b4bfa: test rbx, rbx
0x35b4bfd: je 0x1435b4c13
0x35b4bff: cmp qword ptr [rbx + 8], r9
0x35b4c03: je 0x1435b4c13
0x35b4c05: mov rcx, qword ptr [r10 + 0x38]
0x35b4c09: call 0x143ed8480
0x35b4c0e: mov r9, rax
0x35b4c11: jmp 0x1435b4c3f
0x35b4c13: movzx edx, byte ptr [r10 + 0x94]
0x35b4c1b: cmp dl, 0xff
0x35b4c1e: je 0x1435b4c3f
0x35b4c20: mov rax, qword ptr [r10 + 0x58]
0x35b4c24: mov rcx, qword ptr [rax + 0xb0]
0x35b4c2b: mov r8, qword ptr [rcx + 0xb0]
0x35b4c32: cmp edx, dword ptr [r8 + 8]
0x35b4c36: jae 0x1435b4c3f
0x35b4c38: mov rax, qword ptr [r8]
0x35b4c3b: mov r9, qword ptr [rax + rdx*8]
0x35b4c3f: cmp byte ptr [r9 + 0x13b], 0
0x35b4c47: jne 0x1435b4c54
0x35b4c49: vmovss xmm0, dword ptr [r9 + 0xd8]
0x35b4c52: jmp 0x1435b4c6f
0x35b4c54: cmp byte ptr [r9 + 0x13c], 0
0x35b4c5c: mov eax, 0xe0
0x35b4c61: mov ecx, 0xdc
0x35b4c66: cmove eax, ecx
0x35b4c69: vmovss xmm0, dword ptr [rax + r9]
0x35b4c6f: vmulss xmm3, xmm0, dword ptr [r9 + 0xd4]
0x35b4c78: vmovss xmm0, dword ptr [r10 + 0x78]
0x35b4c7e: vmovss xmm2, dword ptr [r10 + 0x7c]
0x35b4c84: vdivss xmm1, xmm0, xmm3
0x35b4c88: vdivss xmm0, xmm2, xmm3
0x35b4c8c: vmovss dword ptr [r11 + 4], xmm0
0x35b4c92: vmovss dword ptr [r11], xmm1
0x35b4c97: mov rax, r11
0x35b4c9a: add rsp, 0x20
0x35b4c9e: pop rbx
0x35b4c9f: ret 
0x35b4ca0: mov rax, qword ptr [r10 + 0x78]
0x35b4ca4: mov qword ptr [r11], rax
0x35b4ca7: mov rax, r11
0x35b4caa: add rsp, 0x20
0x35b4cae: pop rbx
0x35b4caf: ret 