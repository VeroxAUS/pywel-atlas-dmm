0xdd4c90: push rdi
0xdd4c92: sub rsp, 0x20
0xdd4c96: xor al, al
0xdd4c98: mov rdi, rcx
0xdd4c9b: vcomiss xmm1, dword ptr [rip + 0x5ed8875]
0xdd4ca3: jbe 0x140dd4ca9
0xdd4ca5: xor dl, dl
0xdd4ca7: jmp 0x140dd4cc0
0xdd4ca9: vmovss xmm0, dword ptr [rip + 0x5ed8817]
0xdd4cb1: movzx edx, al
0xdd4cb4: mov eax, 1
0xdd4cb9: vcomiss xmm0, xmm1
0xdd4cbd: cmova edx, eax
0xdd4cc0: cmp byte ptr [rcx + 0xc8], dl
0xdd4cc6: je 0x140dd4dc4
0xdd4ccc: mov rax, qword ptr [rcx + 8]
0xdd4cd0: mov byte ptr [rcx + 0xc8], dl