0x4a9d00: mov r11, rsp
0x4a9d03: mov qword ptr [r11 + 0x10], rdx
0x4a9d07: mov qword ptr [r11 + 8], rcx
0x4a9d0b: push rbx
0x4a9d0c: push r13
0x4a9d0e: sub rsp, 0x98
0x4a9d15: mov eax, dword ptr [rdx + 8]
0x4a9d18: mov rbx, r9
0x4a9d1b: mov r13, r8
0x4a9d1e: test eax, eax
0x4a9d20: je 0x1404a9fd2
0x4a9d26: mov qword ptr [r11 - 0x28], r12
0x4a9d2a: sub eax, 1
0x4a9d2d: mov qword ptr [r11 + 0x18], rbp
0x4a9d31: mov qword ptr [r11 - 0x18], rsi
0x4a9d35: mov r12d, eax
0x4a9d38: mov qword ptr [r11 - 0x20], rdi
0x4a9d3c: mov qword ptr [r11 - 0x30], r14
0x4a9d40: mov qword ptr [rsp + 0x30], r12
0x4a9d45: mov r8d, 0x238
0x4a9d4b: je 0x1404a9ea0
0x4a9d51: mov esi, r12d
0x4a9d54: mov qword ptr [r11 - 0x38], r15
0x4a9d58: mov r12, qword ptr [rsp + 0xe0]
0x4a9d60: xor edi, edi
0x4a9d62: mov r10, qword ptr [rdx]
0x4a9d65: add r10, rdi
0x4a9d68: mov r11, qword ptr [r10 + 8]
0x4a9d6c: test r11, r11
0x4a9d6f: je 0x1404a9e88
0x4a9d75: movzx eax, byte ptr [r10 + 0x18]
0x4a9d7a: vmovsd xmm0, qword ptr [rbx]
0x4a9d7e: test al, al
0x4a9d80: je 0x1404a9e3a
0x4a9d86: mov rcx, qword ptr [rsp + 0xd8]
0x4a9d8e: movzx r9d, byte ptr [r12]
0x4a9d93: mov r15, qword ptr [r13]
0x4a9d97: movzx ebp, byte ptr [rcx]
0x4a9d9a: mov rcx, qword ptr [rsp + 0xd0]
0x4a9da2: movzx r14d, byte ptr [rcx]
0x4a9da6: mov ecx, dword ptr [rbx + 8]
0x4a9da9: mov dword ptr [rsp + 0xb0], ecx
0x4a9db0: mov ecx, eax
0x4a9db2: mov rax, qword ptr [rip + 0x68bf66f]
0x4a9db9: mov rcx, qword ptr [rax + rcx*8 + 0x18]
0x4a9dbe: test byte ptr [rcx + 0x128], 2
0x4a9dc5: je 0x1404a9e15
0x4a9dc7: mov rax, qword ptr gs:[0x58]
0x4a9dd0: mov edx, r8d
0x4a9dd3: mov rcx, qword ptr [rax]
0x4a9dd6: mov rax, qword ptr [r10]
0x4a9dd9: mov r8, qword ptr [rdx + rcx]
0x4a9ddd: mov rcx, r11
0x4a9de0: mov qword ptr [r8 + 0x30], rax
0x4a9de4: mov eax, dword ptr [rsp + 0xb0]
0x4a9deb: mov qword ptr [r8 + 0x38], r15
0x4a9def: mov dword ptr [rsp + 0x40], eax
0x4a9df3: lea rax, [rsp + 0x38]
0x4a9df8: vmovsd qword ptr [rsp + 0x38], xmm0
0x4a9dfe: mov qword ptr [r8 + 0x40], rax
0x4a9e02: mov dword ptr [r8 + 0x48], r14d
0x4a9e06: mov dword ptr [r8 + 0x50], ebp
0x4a9e0a: mov dword ptr [r8 + 0x58], r9d
0x4a9e0e: call 0x1413ea3e0
0x4a9e13: jmp 0x1404a9e7a
0x4a9e15: mov eax, dword ptr [rbx + 8]
0x4a9e18: lea r8, [rsp + 0x50]
0x4a9e1d: mov byte ptr [rsp + 0x28], r9b
0x4a9e22: mov rdx, r15
0x4a9e25: mov dword ptr [rsp + 0x58], eax
0x4a9e29: movzx r9d, r14b
0x4a9e2d: mov byte ptr [rsp + 0x20], bpl
0x4a9e32: vmovsd qword ptr [rsp + 0x50], xmm0
0x4a9e38: jmp 0x1404a9e74
0x4a9e3a: mov eax, dword ptr [rbx + 8]
0x4a9e3d: lea r8, [rsp + 0x60]
0x4a9e42: mov rdx, qword ptr [r13]
0x4a9e46: mov dword ptr [rsp + 0x68], eax
0x4a9e4a: movzx eax, byte ptr [r12]
0x4a9e4f: mov byte ptr [rsp + 0x28], al
0x4a9e53: mov rax, qword ptr [rsp + 0xd8]
0x4a9e5b: vmovsd qword ptr [rsp + 0x60], xmm0
0x4a9e61: movzx eax, byte ptr [rax]
0x4a9e64: mov byte ptr [rsp + 0x20], al
0x4a9e68: mov rax, qword ptr [rsp + 0xd0]
0x4a9e70: movzx r9d, byte ptr [rax]
0x4a9e74: mov rcx, qword ptr [r10]
0x4a9e77: call r11
0x4a9e7a: mov rdx, qword ptr [rsp + 0xb8]
0x4a9e82: mov r8d, 0x238
0x4a9e88: add rdi, 0x20
0x4a9e8c: sub rsi, 1
0x4a9e90: jne 0x1404a9d62
0x4a9e96: mov r15, qword ptr [rsp + 0x70]
0x4a9e9b: mov r12, qword ptr [rsp + 0x30]
0x4a9ea0: mov r10, qword ptr [rdx]
0x4a9ea3: shl r12, 5
0x4a9ea7: add r10, r12
0x4a9eaa: mov r12, qword ptr [rsp + 0x80]
0x4a9eb2: mov r11, qword ptr [r10 + 8]
0x4a9eb6: test r11, r11
0x4a9eb9: je 0x1404a9fb5
0x4a9ebf: movzx ecx, byte ptr [r10 + 0x18]
0x4a9ec4: vmovsd xmm0, qword ptr [rbx]
0x4a9ec8: test cl, cl
0x4a9eca: je 0x1404a9f6f
0x4a9ed0: mov rax, qword ptr [rsp + 0xe0]
0x4a9ed8: mov r14d, dword ptr [rbx + 8]
0x4a9edc: mov rbp, qword ptr [r13]
0x4a9ee0: movzx r9d, byte ptr [rax]
0x4a9ee4: mov rax, qword ptr [rsp + 0xd8]
0x4a9eec: movzx edi, byte ptr [rax]
0x4a9eef: mov rax, qword ptr [rsp + 0xd0]
0x4a9ef7: movzx esi, byte ptr [rax]
0x4a9efa: mov rax, qword ptr [rip + 0x68bf527]
0x4a9f01: mov rcx, qword ptr [rax + rcx*8 + 0x18]
0x4a9f06: test byte ptr [rcx + 0x128], 2
0x4a9f0d: je 0x1404a9f57
0x4a9f0f: mov rax, qword ptr gs:[0x58]
0x4a9f18: mov edx, r8d
0x4a9f1b: mov rcx, qword ptr [rax]
0x4a9f1e: mov rax, qword ptr [r10]
0x4a9f21: mov r8, qword ptr [rdx + rcx]
0x4a9f25: mov rcx, r11
0x4a9f28: mov qword ptr [r8 + 0x30], rax
0x4a9f2c: lea rax, [rsp + 0x60]
0x4a9f31: mov qword ptr [r8 + 0x38], rbp
0x4a9f35: vmovsd qword ptr [rsp + 0x60], xmm0
0x4a9f3b: mov dword ptr [rsp + 0x68], r14d
0x4a9f40: mov qword ptr [r8 + 0x40], rax
0x4a9f44: mov dword ptr [r8 + 0x48], esi
0x4a9f48: mov dword ptr [r8 + 0x50], edi
0x4a9f4c: mov dword ptr [r8 + 0x58], r9d
0x4a9f50: call 0x1413ea3e0
0x4a9f55: jmp 0x1404a9fb5
0x4a9f57: mov byte ptr [rsp + 0x28], r9b
0x4a9f5c: mov rdx, rbp
0x4a9f5f: mov byte ptr [rsp + 0x20], dil
0x4a9f64: movzx r9d, sil
0x4a9f68: mov dword ptr [rsp + 0x68], r14d
0x4a9f6d: jmp 0x1404a9fa4
0x4a9f6f: mov eax, dword ptr [rbx + 8]
0x4a9f72: mov rdx, qword ptr [r13]
0x4a9f76: mov dword ptr [rsp + 0x68], eax
0x4a9f7a: mov rax, qword ptr [rsp + 0xe0]
0x4a9f82: movzx eax, byte ptr [rax]
0x4a9f85: mov byte ptr [rsp + 0x28], al
0x4a9f89: mov rax, qword ptr [rsp + 0xd8]
0x4a9f91: movzx eax, byte ptr [rax]
0x4a9f94: mov byte ptr [rsp + 0x20], al
0x4a9f98: mov rax, qword ptr [rsp + 0xd0]
0x4a9fa0: movzx r9d, byte ptr [rax]
0x4a9fa4: mov rcx, qword ptr [r10]
0x4a9fa7: lea r8, [rsp + 0x60]
0x4a9fac: vmovsd qword ptr [rsp + 0x60], xmm0
0x4a9fb2: call r11
0x4a9fb5: mov rdi, qword ptr [rsp + 0x88]
0x4a9fbd: mov rsi, qword ptr [rsp + 0x90]
0x4a9fc5: mov rbp, qword ptr [rsp + 0xc0]
0x4a9fcd: mov r14, qword ptr [rsp + 0x78]
0x4a9fd2: add rsp, 0x98
0x4a9fd9: pop r13
0x4a9fdb: pop rbx
0x4a9fdc: ret 
0x4a9fdd: int3 
0x4a9fde: int3 
0x4a9fdf: int3 
0x4a9fe0: push rbp
0x4a9fe2: push rsi
0x4a9fe3: push r12
0x4a9fe5: sub rsp, 0x30
0x4a9fe9: mov eax, dword ptr [rdx + 8]
0x4a9fec: mov rsi, r9
0x4a9fef: mov rbp, r8
0x4a9ff2: mov r12, rdx
0x4a9ff5: test eax, eax
0x4a9ff7: je 0x1404aa140
0x4a9ffd: mov qword ptr [rsp + 0x58], rdi
0x4aa002: sub eax, 1
0x4aa005: mov rdi, qword ptr [rsp + 0x70]
0x4aa00a: mov qword ptr [rsp + 0x60], r13
0x4aa00f: mov qword ptr [rsp + 0x20], r15
0x4aa014: mov r15d, eax
0x4aa017: mov r13d, 0x238
0x4aa01d: je 0x1404aa0c1
0x4aa023: mov qword ptr [rsp + 0x50], rbx
0x4aa028: xor ebx, ebx
0x4aa02a: mov qword ptr [rsp + 0x28], r14
0x4aa02f: mov r14d, r15d
0x4aa032: nop dword ptr [rax]
0x4aa036: nop word ptr [rax + rax]
0x4aa040: mov r10, qword ptr [r12]
0x4aa044: add r10, rbx
0x4aa047: mov r11, qword ptr [r10 + 8]
0x4aa04b: test r11, r11
0x4aa04e: je 0x1404aa0ad
0x4aa050: movzx eax, byte ptr [r10 + 0x18]
0x4aa055: test al, al
0x4aa057: je 0x1404aa09e
0x4aa059: mov ecx, eax
0x4aa05b: mov rax, qword ptr [rip + 0x68bf3c6]
0x4aa062: mov rcx, qword ptr [rax + rcx*8 + 0x18]
0x4aa067: test byte ptr [rcx + 0x128], 2
0x4aa06e: je 0x1404aa09e
0x4aa070: mov rax, qword ptr gs:[0x58]
0x4aa079: mov rcx, qword ptr [rax]
0x4aa07c: mov rax, qword ptr [r10]
0x4aa07f: mov r8, qword ptr [r13 + rcx]
0x4aa084: mov rcx, r11
0x4aa087: mov qword ptr [r8 + 0x30], rax
0x4aa08b: mov qword ptr [r8 + 0x38], rbp
0x4aa08f: mov qword ptr [r8 + 0x40], rsi
0x4aa093: mov qword ptr [r8 + 0x48], rdi
0x4aa097: call 0x1413ea3e0
0x4aa09c: jmp 0x1404aa0ad
0x4aa09e: mov rcx, qword ptr [r10]
0x4aa0a1: mov r9, rdi
0x4aa0a4: mov r8, rsi
0x4aa0a7: mov rdx, rbp
0x4aa0aa: call r11
0x4aa0ad: add rbx, 0x20
0x4aa0b1: sub r14, 1
0x4aa0b5: jne 0x1404aa040
0x4aa0b7: mov r14, qword ptr [rsp + 0x28]
0x4aa0bc: mov rbx, qword ptr [rsp + 0x50]
0x4aa0c1: mov rcx, qword ptr [r12]
0x4aa0c5: shl r15, 5
0x4aa0c9: add rcx, r15
0x4aa0cc: mov r15, qword ptr [rsp + 0x20]
0x4aa0d1: mov r10, qword ptr [rcx + 8]
0x4aa0d5: test r10, r10
0x4aa0d8: je 0x1404aa136
0x4aa0da: movzx eax, byte ptr [rcx + 0x18]
0x4aa0de: test al, al
0x4aa0e0: je 0x1404aa127
0x4aa0e2: mov edx, eax
0x4aa0e4: mov rax, qword ptr [rip + 0x68bf33d]
0x4aa0eb: mov rdx, qword ptr [rax + rdx*8 + 0x18]
0x4aa0f0: test byte ptr [rdx + 0x128], 2
0x4aa0f7: je 0x1404aa127
0x4aa0f9: mov rax, qword ptr gs:[0x58]
0x4aa102: mov rdx, qword ptr [rax]
0x4aa105: mov rax, qword ptr [rcx]
0x4aa108: mov rcx, r10
0x4aa10b: mov r9, qword ptr [r13 + rdx]
0x4aa110: mov qword ptr [r9 + 0x30], rax
0x4aa114: mov qword ptr [r9 + 0x38], rbp
0x4aa118: mov qword ptr [r9 + 0x40], rsi
0x4aa11c: mov qword ptr [r9 + 0x48], rdi
0x4aa120: call 0x1413ea3e0
0x4aa125: jmp 0x1404aa136
0x4aa127: mov rcx, qword ptr [rcx]
0x4aa12a: mov r9, rdi
0x4aa12d: mov r8, rsi
0x4aa130: mov rdx, rbp
0x4aa133: call r10
0x4aa136: mov rdi, qword ptr [rsp + 0x58]
0x4aa13b: mov r13, qword ptr [rsp + 0x60]
0x4aa140: add rsp, 0x30
0x4aa144: pop r12
0x4aa146: pop rsi
0x4aa147: pop rbp
0x4aa148: ret 
0x4aa149: int3 
0x4aa14a: int3 
0x4aa14b: int3 
0x4aa14c: int3 
0x4aa14d: int3 
0x4aa14e: int3 
0x4aa14f: int3 
0x4aa150: lea rdx, [rcx + 0x1014]
0x4aa157: mov eax, dword ptr [rdx]
0x4aa159: cmp eax, -1
0x4aa15c: jne 0x1404aa17f
0x4aa15e: mov rax, qword ptr [rcx + 0x1008]
0x4aa165: test rax, rax
0x4aa168: cmovne rcx, rax
0x4aa16c: mov rax, 0xffffffffffffffff
0x4aa173: inc rax
0x4aa176: cmp word ptr [rcx + rax*2], 0
0x4aa17b: jne 0x1404aa173
0x4aa17d: mov dword ptr [rdx], eax
0x4aa17f: ret 
0x4aa180: mov qword ptr [rsp + 0x18], rbx
0x4aa185: push rsi
0x4aa186: sub rsp, 0x20
0x4aa18a: mov esi, edx
0x4aa18c: mov rbx, rcx
0x4aa18f: cmp edx, dword ptr [rcx + 0xc]
0x4aa192: ja 0x1404aa1a1
0x4aa194: xor al, al
0x4aa196: mov rbx, qword ptr [rsp + 0x40]
0x4aa19b: add rsp, 0x20
0x4aa19f: pop rsi
0x4aa1a0: ret 
0x4aa1a1: mov rax, qword ptr gs:[0x58]
0x4aa1aa: lea ecx, [rdx + rdx*2]
0x4aa1ad: mov qword ptr [rsp + 0x30], rbp
0x4aa1b2: mov edx, 4
0x4aa1b7: mov ebp, 0x1fd
0x4aa1bc: shl ecx, 2
0x4aa1bf: add rbp, qword ptr [rax]
0x4aa1c2: mov qword ptr [rsp + 0x38], rdi
0x4aa1c7: cmp byte ptr [rbp], 0
0x4aa1cb: je 0x1404aa1d4
0x4aa1cd: call 0x1447efa78
0x4aa1d2: jmp 0x1404aa1d9
0x4aa1d4: call 0x1447ef9b0
0x4aa1d9: mov rdi, rax
0x4aa1dc: test rax, rax
0x4aa1df: jne 0x1404aa1fc
0x4aa1e1: call 0x141318e70
0x4aa1e6: xor r9d, r9d
0x4aa1e9: xor r8d, r8d
0x4aa1ec: mov edx, 1
0x4aa1f1: mov ecx, 0xa0000002
0x4aa1f6: call qword ptr [rip + 0x4d40f4c]
0x4aa1fc: xor edx, edx
0x4aa1fe: cmp dword ptr [rbx + 8], edx
0x4aa201: jbe 0x1404aa230
0x4aa203: nop dword ptr [rax]
0x4aa207: nop word ptr [rax + rax]
0x4aa210: mov rax, qword ptr [rbx]
0x4aa213: lea rcx, [rdx + rdx*2]
0x4aa217: inc edx
0x4aa219: vmovsd xmm0, qword ptr [rax + rcx*4]
0x4aa21e: vmovsd qword ptr [rdi + rcx*4], xmm0
0x4aa223: mov eax, dword ptr [rax + rcx*4 + 8]
0x4aa227: mov dword ptr [rdi + rcx*4 + 8], eax
0x4aa22b: cmp edx, dword ptr [rbx + 8]
0x4aa22e: jb 0x1404aa210
0x4aa230: mov rcx, qword ptr [rbx]
0x4aa233: test rcx, rcx
0x4aa236: je 0x1404aa24a
0x4aa238: cmp byte ptr [rbp], 0
0x4aa23c: je 0x1404aa245
0x4aa23e: call 0x1447f03bc
0x4aa243: jmp 0x1404aa24a
0x4aa245: call 0x1447f02bc
0x4aa24a: mov rbp, qword ptr [rsp + 0x30]
0x4aa24f: mov al, 1
0x4aa251: mov qword ptr [rbx], rdi
0x4aa254: mov rdi, qword ptr [rsp + 0x38]
0x4aa259: mov dword ptr [rbx + 0xc], esi
0x4aa25c: mov rbx, qword ptr [rsp + 0x40]
0x4aa261: add rsp, 0x20
0x4aa265: pop rsi
0x4aa266: ret 
0x4aa267: int3 
0x4aa268: int3 
0x4aa269: int3 
0x4aa26a: int3 
0x4aa26b: int3 
0x4aa26c: int3 
0x4aa26d: int3 
0x4aa26e: int3 
0x4aa26f: int3 
0x4aa270: mov qword ptr [rsp + 0x18], rbx
0x4aa275: push rsi
0x4aa276: sub rsp, 0x20
0x4aa27a: mov esi, edx
0x4aa27c: mov rbx, rcx
0x4aa27f: cmp edx, dword ptr [rcx + 0xc]
0x4aa282: ja 0x1404aa291
0x4aa284: xor al, al
0x4aa286: mov rbx, qword ptr [rsp + 0x40]
0x4aa28b: add rsp, 0x20
0x4aa28f: pop rsi
0x4aa290: ret 
0x4aa291: mov rax, qword ptr gs:[0x58]
0x4aa29a: lea ecx, [rdx + rdx*2]
0x4aa29d: mov qword ptr [rsp + 0x30], rbp
0x4aa2a2: mov edx, 8
0x4aa2a7: mov ebp, 0x1fd
0x4aa2ac: shl ecx, 3
0x4aa2af: add rbp, qword ptr [rax]
0x4aa2b2: mov qword ptr [rsp + 0x38], rdi
0x4aa2b7: cmp byte ptr [rbp], 0
0x4aa2bb: je 0x1404aa2c4
0x4aa2bd: call 0x1447efa78
0x4aa2c2: jmp 0x1404aa2c9
0x4aa2c4: call 0x1447ef9b0
0x4aa2c9: mov rdi, rax
0x4aa2cc: test rax, rax
0x4aa2cf: jne 0x1404aa2ec
0x4aa2d1: call 0x141318e70
0x4aa2d6: xor r9d, r9d
0x4aa2d9: xor r8d, r8d