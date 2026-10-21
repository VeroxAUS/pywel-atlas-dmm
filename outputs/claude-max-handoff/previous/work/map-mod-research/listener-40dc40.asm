0x40dc40: mov qword ptr [rsp + 0x10], rbx
0x40dc45: mov qword ptr [rsp + 0x18], rbp
0x40dc4a: mov qword ptr [rsp + 0x20], rsi
0x40dc4f: push rdi
0x40dc50: sub rsp, 0x20
0x40dc54: mov rdi, rcx
0x40dc57: mov rbx, qword ptr [rcx]
0x40dc5a: test rbx, rbx
0x40dc5d: je 0x14040dcbe
0x40dc5f: mov qword ptr [rsp + 0x30], rbx
0x40dc64: mov rcx, qword ptr [rbx]
0x40dc67: mov ebp, 0x1fd
0x40dc6c: test rcx, rcx
0x40dc6f: je 0x14040dc90
0x40dc71: mov rax, qword ptr gs:[0x58]
0x40dc7a: mov rdx, qword ptr [rax]
0x40dc7d: cmp byte ptr [rbp + rdx], 0
0x40dc82: je 0x14040dc8b
0x40dc84: call 0x1447f03bc
0x40dc89: jmp 0x14040dc90
0x40dc8b: call 0x1447f02bc
0x40dc90: xor esi, esi
0x40dc92: mov qword ptr [rbx], rsi
0x40dc95: mov qword ptr [rbx + 8], rsi
0x40dc99: mov rax, qword ptr gs:[0x58]
0x40dca2: mov rdx, qword ptr [rax]
0x40dca5: mov rcx, rbx
0x40dca8: cmp byte ptr [rbp + rdx], sil
0x40dcad: je 0x14040dcb6
0x40dcaf: call 0x1447f03bc
0x40dcb4: jmp 0x14040dcbb
0x40dcb6: call 0x1447f02bc
0x40dcbb: mov qword ptr [rdi], rsi
0x40dcbe: mov rbx, qword ptr [rsp + 0x38]
0x40dcc3: mov rbp, qword ptr [rsp + 0x40]
0x40dcc8: mov rsi, qword ptr [rsp + 0x48]
0x40dccd: add rsp, 0x20
0x40dcd1: pop rdi
0x40dcd2: ret 