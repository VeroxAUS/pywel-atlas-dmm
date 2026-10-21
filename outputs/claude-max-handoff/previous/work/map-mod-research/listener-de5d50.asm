0xde5d50: mov qword ptr [rsp + 8], rbx
0xde5d55: mov qword ptr [rsp + 0x10], rsi
0xde5d5a: mov qword ptr [rsp + 0x18], rdi
0xde5d5f: push rbp
0xde5d60: push r12
0xde5d62: push r13
0xde5d64: push r14
0xde5d66: push r15
0xde5d68: lea rbp, [rsp - 0x1f]
0xde5d6d: sub rsp, 0xa0
0xde5d74: mov r12, r8
0xde5d77: mov rsi, rdx
0xde5d7a: mov r15, rcx
0xde5d7d: xor r13d, r13d
0xde5d80: mov qword ptr [r8], r13
0xde5d83: lea r8, [rip + 0x478d722]
0xde5d8a: mov rdx, r9
0xde5d8d: mov rcx, qword ptr [rcx + 8]
0xde5d91: call 0x143eda3d0
0xde5d96: mov rdi, rax
0xde5d99: lea rax, [rbp - 0x31]
0xde5d9d: mov qword ptr [rbp - 0x41], rax
0xde5da1: mov dword ptr [rbp - 0x39], r13d
0xde5da5: mov dword ptr [rbp - 0x35], 0xa
0xde5dac: mov rax, qword ptr [r15 + 8]
0xde5db0: mov qword ptr [rbp - 0x61], rax
0xde5db4: mov qword ptr [rbp - 0x59], r13
0xde5db8: test rdi, rdi
0xde5dbb: je 0x140de5dfb
0xde5dbd: cmp byte ptr [rdi], r13b
0xde5dc0: je 0x140de5dfb
0xde5dc2: mov rbx, 0xffffffffffffffff
0xde5dc9: nop dword ptr [rax]
0xde5dd0: inc rbx
0xde5dd3: cmp byte ptr [rdi + rbx], 0
0xde5dd7: jne 0x140de5dd0
0xde5dd9: mov ecx, ebx
0xde5ddb: call 0x1414203f0
0xde5de0: mov r14, rax
0xde5de3: lea edx, [rbx + 1]
0xde5de6: mov r9, 0xffffffffffffffff
0xde5ded: mov r8, rdi
0xde5df0: mov rcx, qword ptr [rax]
0xde5df3: call qword ptr [rip + 0x44066b7]
0xde5df9: jmp 0x140de5e02
0xde5dfb: lea r14, [rip + 0x5c7fb3e]
0xde5e02: mov qword ptr [rbp - 0x59], r14
0xde5e06: mov qword ptr [rbp - 0x51], 1
0xde5e0e: mov word ptr [rbp - 0x49], 0x100
0xde5e14: mov byte ptr [rbp - 0x49], 0
0xde5e18: lea rdx, [rbp - 0x41]
0xde5e1c: lea rcx, [rbp - 0x61]
0xde5e20: call 0x143d1dab0
0xde5e25: nop 
0xde5e26: lea rcx, [rbp - 0x59]
0xde5e2a: call 0x140394db0
0xde5e2f: cmp dword ptr [rbp - 0x39], 0
0xde5e33: jne 0x140de5e42
0xde5e35: mov eax, dword ptr [rip + 0x5ef5cf5]
0xde5e3b: mov dword ptr [rsi], eax
0xde5e3d: jmp 0x140de5ec4
0xde5e42: mov rax, qword ptr [rbp - 0x41]
0xde5e46: mov rbx, qword ptr [rax]
0xde5e49: mov rax, qword ptr [rbx + 0xa0]
0xde5e50: test rax, rax
0xde5e53: je 0x140de5e5c
0xde5e55: cmp qword ptr [rax + 8], 0
0xde5e5a: jne 0x140de5ebc
0xde5e5c: mov rbx, qword ptr [rbx + 0xd8]
0xde5e63: test rbx, rbx
0xde5e66: jne 0x140de5e83
0xde5e68: test rax, rax
0xde5e6b: je 0x140de5ebc
0xde5e6d: mov rcx, qword ptr [rax + 0x58]
0xde5e71: test rcx, rcx
0xde5e74: je 0x140de5ebc
0xde5e76: call 0x143ed84d0
0xde5e7b: mov rbx, rax
0xde5e7e: test rax, rax
0xde5e81: je 0x140de5ebc
0xde5e83: mov rcx, qword ptr [rbx]
0xde5e86: mov r8, qword ptr [rcx + 0x190]
0xde5e8d: lea rdx, [rip + 0x5edd754]
0xde5e94: mov rcx, rbx
0xde5e97: call r8
0xde5e9a: test al, al
0xde5e9c: cmove rbx, r13
0xde5ea0: mov qword ptr [r12], rbx
0xde5ea4: test rbx, rbx
0xde5ea7: jne 0x140de5eb3
0xde5ea9: mov eax, dword ptr [rip + 0x5ef5c85]
0xde5eaf: mov dword ptr [rsi], eax
0xde5eb1: jmp 0x140de5ec4
0xde5eb3: mov qword ptr [rbx + 0x28], r15
0xde5eb7: mov dword ptr [rsi], r13d
0xde5eba: jmp 0x140de5ec4
0xde5ebc: mov eax, dword ptr [rip + 0x5ef5c72]
0xde5ec2: mov dword ptr [rsi], eax
0xde5ec4: lea rax, [rbp - 0x31]
0xde5ec8: mov rcx, qword ptr [rbp - 0x41]
0xde5ecc: cmp rcx, rax
0xde5ecf: je 0x140de5efb
0xde5ed1: test rcx, rcx
0xde5ed4: je 0x140de5efb
0xde5ed6: mov rax, qword ptr gs:[0x58]
0xde5edf: mov rdx, qword ptr [rax]
0xde5ee2: mov r8d, 0x1fd
0xde5ee8: cmp byte ptr [r8 + rdx], 0
0xde5eed: je 0x140de5ef6
0xde5eef: call 0x1447f03bc
0xde5ef4: jmp 0x140de5efb
0xde5ef6: call 0x1447f02bc
0xde5efb: mov rax, rsi
0xde5efe: lea r11, [rsp + 0xa0]
0xde5f06: mov rbx, qword ptr [r11 + 0x30]
0xde5f0a: mov rsi, qword ptr [r11 + 0x38]
0xde5f0e: mov rdi, qword ptr [r11 + 0x40]
0xde5f12: mov rsp, r11
0xde5f15: pop r15
0xde5f17: pop r14
0xde5f19: pop r13
0xde5f1b: pop r12
0xde5f1d: pop rbp
0xde5f1e: ret 