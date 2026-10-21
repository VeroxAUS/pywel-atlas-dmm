0x2357c60: mov qword ptr [rsp + 8], rbx
0x2357c65: mov qword ptr [rsp + 0x18], rsi
0x2357c6a: push rdi
0x2357c6b: sub rsp, 0x150
0x2357c72: mov rbx, rdx
0x2357c75: mov r9, rcx
0x2357c78: lea rdi, [rdx + 0x6c0]
0x2357c7f: cmp dword ptr [rdi + 8], 0
0x2357c83: jne 0x142357c8c
0x2357c85: mov al, 1
0x2357c87: jmp 0x142357d89
0x2357c8c: xor esi, esi
0x2357c8e: mov qword ptr [rsp + 0x138], rsi
0x2357c96: mov qword ptr [rsp + 0x140], 0x105
0x2357ca2: mov dword ptr [rsp + 0x144], esi
0x2357ca9: mov byte ptr [rsp + 0x30], sil
0x2357cae: mov dword ptr [rsp + 0x144], esi
0x2357cb5: mov byte ptr [rsp + 0x30], sil
0x2357cba: mov rax, qword ptr [rsp + 0x138]
0x2357cc2: test rax, rax
0x2357cc5: je 0x142357cca
0x2357cc7: mov byte ptr [rax], sil
0x2357cca: lea rcx, [rdx + 0x28]
0x2357cce: mov rax, qword ptr [rcx + 0x88]
0x2357cd5: test rax, rax
0x2357cd8: cmovne rcx, rax
0x2357cdc: mov qword ptr [rsp + 0x168], rcx
0x2357ce4: mov dword ptr [rsp + 0x144], 0xffffffff
0x2357cef: lea rcx, [rsp + 0x30]
0x2357cf4: mov rax, qword ptr [rsp + 0x138]
0x2357cfc: test rax, rax
0x2357cff: cmovne rcx, rax
0x2357d03: add r9, 0x20
0x2357d07: lea rax, [rsp + 0x168]
0x2357d0f: mov qword ptr [rsp + 0x20], rax
0x2357d14: lea r8, [rip + 0x3221121]
0x2357d1b: mov edx, dword ptr [rsp + 0x140]
0x2357d22: call 0x14064c240
0x2357d27: lea r9, [rsp + 0x30]
0x2357d2c: mov rax, qword ptr [rsp + 0x138]
0x2357d34: test rax, rax
0x2357d37: cmovne r9, rax
0x2357d3b: mov r8, rdi
0x2357d3e: mov rdx, rbx
0x2357d41: call 0x142358560
0x2357d46: movzx ebx, al
0x2357d49: mov dword ptr [rdi + 8], esi
0x2357d4c: mov rcx, qword ptr [rsp + 0x138]
0x2357d54: test rcx, rcx
0x2357d57: je 0x142357d86
0x2357d59: mov r8d, 0x1fd
0x2357d5f: mov rdx, qword ptr gs:[0x58]
0x2357d68: mov rax, qword ptr [rdx]
0x2357d6b: cmp byte ptr [r8 + rax], 0
0x2357d70: je 0x142357d79
0x2357d72: call 0x1447f03bc
0x2357d77: jmp 0x142357d7e
0x2357d79: call 0x1447f02bc
0x2357d7e: mov qword ptr [rsp + 0x138], rsi
0x2357d86: movzx eax, bl
0x2357d89: lea r11, [rsp + 0x150]
0x2357d91: mov rbx, qword ptr [r11 + 0x10]
0x2357d95: mov rsi, qword ptr [r11 + 0x20]
0x2357d99: mov rsp, r11
0x2357d9c: pop rdi
0x2357d9d: ret 