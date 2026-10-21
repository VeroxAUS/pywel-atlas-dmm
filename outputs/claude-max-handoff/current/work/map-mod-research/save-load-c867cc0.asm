0xc867cc0: mov qword ptr [rsp + 0x18], rbx
0xc867cc5: mov qword ptr [rsp + 0x20], rbp
0xc867cca: push rsi
0xc867ccb: push rdi
0xc867ccc: push r14
0xc867cce: sub rsp, 0x70
0xc867cd2: mov rsi, rdx
0xc867cd5: mov r14, rcx
0xc867cd8: lea rdx, [rcx + 0x90]
0xc867cdf: mov r8d, 4
0xc867ce5: mov rcx, rsi
0xc867ce8: xor ebx, ebx
0xc867cea: mov rax, qword ptr [rsi]
0xc867ced: call qword ptr [rax + 8]
0xc867cf0: test al, al
0xc867cf2: je 0x14c867e51
0xc867cf8: mov rdi, qword ptr [r14 + 0x78]
0xc867cfc: mov ebp, dword ptr [r14 + 0x80]
0xc867d03: shl rbp, 4
0xc867d07: add rbp, rdi
0xc867d0a: cmp rdi, rbp
0xc867d0d: je 0x14c867d39
0xc867d0f: nop 
0xc867d10: movzx eax, word ptr [rdi + 8]
0xc867d14: mov rdx, rsi
0xc867d17: mov rcx, qword ptr [rdi]
0xc867d1a: mov word ptr [rsp + 0x98], ax
0xc867d22: mov rax, qword ptr [rcx]
0xc867d25: call qword ptr [rax + 0x58]
0xc867d28: test al, al
0xc867d2a: je 0x14c867e2f
0xc867d30: add rdi, 0x10
0xc867d34: cmp rdi, rbp
0xc867d37: jne 0x14c867d10
0xc867d39: mov rax, qword ptr [rsi]
0xc867d3c: lea rdx, [r14 + 0xac]
0xc867d43: mov r8d, 4
0xc867d49: mov rcx, rsi
0xc867d4c: call qword ptr [rax + 8]
0xc867d4f: test al, al
0xc867d51: je 0x14c867e51
0xc867d57: mov rax, qword ptr [rsi]
0xc867d5a: lea rdx, [rsp + 0x90]
0xc867d62: mov r8d, 2
0xc867d68: mov word ptr [rsp + 0x90], bx
0xc867d70: mov rcx, rsi
0xc867d73: call qword ptr [rax + 8]
0xc867d76: test al, al
0xc867d78: je 0x14c867e51
0xc867d7e: movzx edx, word ptr [rsp + 0x90]
0xc867d86: lea rdi, [r14 + 0xb0]
0xc867d8d: mov rcx, rdi
0xc867d90: call 0x1403d2af0
0xc867d95: movzx ebp, bx
0xc867d98: cmp bx, word ptr [rsp + 0x90]
0xc867da0: jae 0x14c867e2b
0xc867da6: mov r14d, 1
0xc867dac: lea rcx, [rip - 0x4e1fb96]
0xc867db3: xor dword ptr [rcx], 0xa20f9090
0xc867db9: nop dword ptr [rax]
0xc867dc0: mov rax, qword ptr [rsi]
0xc867dc3: lea rdx, [rsp + 0x98]
0xc867dcb: mov r8d, 4
0xc867dd1: mov dword ptr [rsp + 0x98], ebx
0xc867dd8: mov rcx, rsi
0xc867ddb: call qword ptr [rax + 8]
0xc867dde: test al, al
0xc867de0: je 0x14c867e51
0xc867de2: mov ecx, dword ptr [rdi + 8]
0xc867de5: mov eax, dword ptr [rdi + 0xc]
0xc867de8: cmp eax, ecx
0xc867dea: ja 0x14c867e0b
0xc867dec: lea edx, [rax + rax + 1]
0xc867df3: add edx, eax
0xc867df5: shr edx, 1
0xc867df7: cmp edx, r14d
0xc867dfa: cmovb edx, r14d
0xc867dfe: cmp ecx, edx
0xc867e00: cmova edx, ecx
0xc867e03: mov rcx, rdi
0xc867e06: call 0x1403d2af0
0xc867e0b: mov edx, dword ptr [rdi + 8]
0xc867e0e: inc bp
0xc867e11: mov rcx, qword ptr [rdi]
0xc867e14: mov eax, dword ptr [rsp + 0x98]
0xc867e1b: mov dword ptr [rcx + rdx*4], eax
0xc867e1e: inc dword ptr [rdi + 8]
0xc867e21: cmp bp, word ptr [rsp + 0x90]
0xc867e29: jb 0x14c867dc0
0xc867e2b: mov al, 1
0xc867e2d: jmp 0x14c867e53
0xc867e2f: lea rax, [rsp + 0x98]
0xc867e37: mov qword ptr [rsp + 0x60], rax
0xc867e3c: lea rax, [rip - 0x6f595e3]
0xc867e43: mov qword ptr [rsp + 0x58], rax
0xc867e48: mov dword ptr [rsp + 0x48], ebx
0xc867e4c: call 0x14050d2d0
0xc867e51: xor al, al
0xc867e53: lea r11, [rsp + 0x70]
0xc867e58: mov rbx, qword ptr [r11 + 0x30]
0xc867e5c: mov rbp, qword ptr [r11 + 0x38]
0xc867e60: mov rsp, r11
0xc867e63: pop r14
0xc867e65: pop rdi
0xc867e66: pop rsi
0xc867e67: ret 