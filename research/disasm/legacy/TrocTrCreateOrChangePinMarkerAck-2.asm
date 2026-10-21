0xb9d9d0: mov qword ptr [rsp + 8], rbx
0xb9d9d5: push rbp
0xb9d9d6: push rsi
0xb9d9d7: push rdi
0xb9d9d8: push r12
0xb9d9da: push r13
0xb9d9dc: push r14
0xb9d9de: push r15
0xb9d9e0: lea rbp, [rsp - 0x1020]
0xb9d9e8: mov eax, 0x1130
0xb9d9ed: call 0x1448962c0
0xb9d9f2: sub rsp, rax
0xb9d9f5: mov r15, r8
0xb9d9f8: mov rdi, rdx
0xb9d9fb: mov rbx, rcx
0xb9d9fe: xor r13d, r13d
0xb9da01: mov r14, qword ptr [r8 + 0x18]
0xb9da05: movzx ecx, word ptr [r14 + 3]
0xb9da0a: movzx eax, word ptr [r8 + 0x10]
0xb9da0f: sub rax, 5
0xb9da13: cmp rax, rcx
0xb9da16: jne 0x140b9de85
0xb9da1c: cmp byte ptr [r8 + 0x38], r13b
0xb9da20: jne 0x140b9da30
0xb9da22: mov eax, 0x7fc1
0xb9da27: cmp ax, cx
0xb9da2a: jb 0x140b9de85
0xb9da30: cmp byte ptr [rbx + 0x21], r13b
0xb9da34: je 0x140b9da3e
0xb9da36: mov dword ptr [rdx], r13d
0xb9da39: jmp 0x140b9df35
0xb9da3e: mov dword ptr [rbp - 0x60], r13d
0xb9da42: mov byte ptr [rbp + 0x1070], r13b
0xb9da49: lea rax, [rbp + 0x10]
0xb9da4d: mov qword ptr [rbp], rax
0xb9da51: mov dword ptr [rbp + 8], r13d
0xb9da55: mov dword ptr [rbp + 0xc], 0xab
0xb9da5c: movzx ecx, word ptr [r14 + 3]
0xb9da61: lea rsi, [rip + 0x4b84258]
0xb9da68: mov qword ptr [rbp - 0x80], rsi
0xb9da6c: mov byte ptr [rbp - 0x78], 0
0xb9da70: lea rbx, [rip + 0x4b841e9]
0xb9da77: mov qword ptr [rbp - 0x80], rbx
0xb9da7b: lea rax, [r14 + 5]
0xb9da7f: mov qword ptr [rbp - 0x70], rax
0xb9da83: mov dword ptr [rbp - 0x68], ecx
0xb9da86: mov dword ptr [rbp - 0x64], r13d
0xb9da8a: mov rax, qword ptr [rip + 0x61cb6f7]
0xb9da91: mov r12, qword ptr [rax + 0x38]
0xb9da95: mov rax, qword ptr [rbp - 0x80]
0xb9da99: mov r9, qword ptr [rax + 8]
0xb9da9d: lea rax, [rip + 0x8817cc]
0xb9daa4: mov r8d, 1
0xb9daaa: lea rdx, [rbp + 0x1070]
0xb9dab1: lea rcx, [rbp - 0x80]
0xb9dab5: cmp r9, rax
0xb9dab8: jne 0x140b9dac1
0xb9daba: call 0x14141f270
0xb9dabf: jmp 0x140b9dac4
0xb9dac1: call r9
0xb9dac4: test al, al
0xb9dac6: jne 0x140b9dadd
0xb9dac8: mov eax, dword ptr [rip + 0x613dea2]
0xb9dace: mov dword ptr [rdi], eax
0xb9dad0: mov qword ptr [rbp - 0x80], rbx
0xb9dad4: mov qword ptr [rbp - 0x80], rsi
0xb9dad8: jmp 0x140b9de3e
0xb9dadd: mov rax, qword ptr [rbp - 0x80]
0xb9dae1: mov r9, qword ptr [rax + 8]
0xb9dae5: lea rbx, [rip - 0x843f4c]
0xb9daec: cmp r9, rbx
0xb9daef: je 0x140b9de27
0xb9daf5: mov r8d, 4
0xb9dafb: lea rdx, [rbp - 0x60]
0xb9daff: lea rcx, [rbp - 0x80]
0xb9db03: call r9
0xb9db06: test al, al
0xb9db08: je 0x140b9de27
0xb9db0e: mov edx, dword ptr [rbp - 0x60]
0xb9db11: test edx, edx
0xb9db13: je 0x140b9db4b
0xb9db15: mov eax, edx
0xb9db17: and eax, 0x30000000
0xb9db1c: cmp eax, 0x10000000
0xb9db21: je 0x140b9db4b
0xb9db23: mov rcx, r12
0xb9db26: call 0x1408b53c0
0xb9db2b: test al, al
0xb9db2d: je 0x140b9db4b
0xb9db2f: mov eax, dword ptr [rip + 0x613de9b]
0xb9db35: mov dword ptr [rdi], eax
0xb9db37: lea rax, [rip + 0x4b84122]
0xb9db3e: mov qword ptr [rbp - 0x80], rax
0xb9db42: mov qword ptr [rbp - 0x80], rsi
0xb9db46: jmp 0x140b9de3e
0xb9db4b: mov rax, qword ptr [rbp - 0x80]
0xb9db4f: mov r9, qword ptr [rax + 8]
0xb9db53: cmp r9, rbx
0xb9db56: je 0x140b9de0e
0xb9db5c: mov r8d, 1
0xb9db62: lea rdx, [rbp + 0x1078]
0xb9db69: lea rcx, [rbp - 0x80]
0xb9db6d: call r9
0xb9db70: test al, al
0xb9db72: je 0x140b9de0e
0xb9db78: mov esi, r13d
0xb9db7b: movzx ecx, word ptr [r14 + 3]
0xb9db80: mov r8d, dword ptr [rbp - 0x64]
0xb9db84: sub ecx, r8d
0xb9db87: mov eax, 0xba2e8ba3
0xb9db8c: mul ecx
0xb9db8e: mov ebx, edx
0xb9db90: shr ebx, 4
0xb9db93: mov r10d, dword ptr [rbp + 8]
0xb9db97: cmp ebx, r10d
0xb9db9a: jb 0x140b9dbf8
0xb9db9c: jbe 0x140b9dbfb
0xb9db9e: cmp dword ptr [rbp + 0xc], ebx
0xb9dba1: jae 0x140b9dbc1
0xb9dba3: mov r9d, 0x18
0xb9dba9: mov r8d, ebx
0xb9dbac: lea rdx, [rbp + 0x10]
0xb9dbb0: lea rcx, [rbp]
0xb9dbb4: call 0x140392380
0xb9dbb9: mov r10d, dword ptr [rbp + 8]
0xb9dbbd: mov r8d, dword ptr [rbp - 0x64]
0xb9dbc1: lea rcx, [rbx + rbx*2]
0xb9dbc5: mov rdx, qword ptr [rbp]
0xb9dbc9: lea r9, [rdx + rcx*8]
0xb9dbcd: mov eax, r10d
0xb9dbd0: lea rcx, [rax + rax*2]
0xb9dbd4: lea rax, [rdx + rcx*8]
0xb9dbd8: cmp rax, r9
0xb9dbdb: je 0x140b9dbf8
0xb9dbdd: nop dword ptr [rax]
0xb9dbe0: mov qword ptr [rax], r13
0xb9dbe3: mov qword ptr [rax + 0x10], r13
0xb9dbe7: mov qword ptr [rax + 8], r13
0xb9dbeb: add rax, 0x18
0xb9dbef: cmp rax, r9
0xb9dbf2: jne 0x140b9dbe0
0xb9dbf4: mov r8d, dword ptr [rbp - 0x64]
0xb9dbf8: mov dword ptr [rbp + 8], ebx
0xb9dbfb: movzx eax, word ptr [r14 + 3]
0xb9dc00: cmp r8d, eax
0xb9dc03: jae 0x140b9dcf9
0xb9dc09: nop dword ptr [rax]
0xb9dc10: mov eax, esi
0xb9dc12: lea rcx, [rax + rax*2]
0xb9dc16: mov rax, qword ptr [rbp]
0xb9dc1a: lea rbx, [rax + rcx*8]
0xb9dc1e: inc esi
0xb9dc20: mov rax, qword ptr [rbp - 0x80]
0xb9dc24: mov r9, qword ptr [rax + 8]
0xb9dc28: lea rax, [rip + 0x881641]
0xb9dc2f: mov r8d, 8
0xb9dc35: mov rdx, rbx
0xb9dc38: lea rcx, [rbp - 0x80]
0xb9dc3c: cmp r9, rax
0xb9dc3f: jne 0x140b9dc48
0xb9dc41: call 0x14141f270
0xb9dc46: jmp 0x140b9dc4b
0xb9dc48: call r9
0xb9dc4b: test al, al
0xb9dc4d: je 0x140b9dd24
0xb9dc53: mov rax, qword ptr [rbp - 0x80]
0xb9dc57: mov r9, qword ptr [rax + 8]
0xb9dc5b: lea rdx, [rbx + 8]
0xb9dc5f: lea rax, [rip + 0x88160a]
0xb9dc66: mov r8d, 0xc
0xb9dc6c: lea rcx, [rbp - 0x80]
0xb9dc70: cmp r9, rax
0xb9dc73: jne 0x140b9dc7c
0xb9dc75: call 0x14141f270
0xb9dc7a: jmp 0x140b9dc7f
0xb9dc7c: call r9
0xb9dc7f: test al, al
0xb9dc81: je 0x140b9dd24
0xb9dc87: mov rax, qword ptr [rbp - 0x80]
0xb9dc8b: mov r9, qword ptr [rax + 8]
0xb9dc8f: lea rdx, [rbx + 0x14]
0xb9dc93: lea rax, [rip + 0x8815d6]
0xb9dc9a: mov r8d, 1
0xb9dca0: lea rcx, [rbp - 0x80]
0xb9dca4: cmp r9, rax
0xb9dca7: jne 0x140b9dcb0
0xb9dca9: call 0x14141f270
0xb9dcae: jmp 0x140b9dcb3
0xb9dcb0: call r9
0xb9dcb3: test al, al
0xb9dcb5: je 0x140b9dd24
0xb9dcb7: mov rax, qword ptr [rbp - 0x80]
0xb9dcbb: mov r9, qword ptr [rax + 8]
0xb9dcbf: lea rdx, [rbx + 0x15]
0xb9dcc3: lea rax, [rip + 0x8815a6]
0xb9dcca: mov r8d, 1
0xb9dcd0: lea rcx, [rbp - 0x80]
0xb9dcd4: cmp r9, rax
0xb9dcd7: jne 0x140b9dce0
0xb9dcd9: call 0x14141f270
0xb9dcde: jmp 0x140b9dce3
0xb9dce0: call r9
0xb9dce3: test al, al
0xb9dce5: je 0x140b9dd24
0xb9dce7: movzx eax, word ptr [r14 + 3]
0xb9dcec: mov r8d, dword ptr [rbp - 0x64]
0xb9dcf0: cmp r8d, eax
0xb9dcf3: jb 0x140b9dc10
0xb9dcf9: movzx eax, ax
0xb9dcfc: cmp r8d, eax
0xb9dcff: je 0x140b9dd47
0xb9dd01: mov eax, dword ptr [rip + 0x613dc69]
0xb9dd07: mov dword ptr [rdi], eax
0xb9dd09: lea rax, [rip + 0x4b83f50]
0xb9dd10: mov qword ptr [rbp - 0x80], rax
0xb9dd14: lea rax, [rip + 0x4b83fa5]
0xb9dd1b: mov qword ptr [rbp - 0x80], rax
0xb9dd1f: jmp 0x140b9de3e
0xb9dd24: mov eax, dword ptr [rip + 0x613dc46]
0xb9dd2a: mov dword ptr [rdi], eax
0xb9dd2c: lea rax, [rip + 0x4b83f2d]
0xb9dd33: mov qword ptr [rbp - 0x80], rax
0xb9dd37: lea rax, [rip + 0x4b83f82]
0xb9dd3e: mov qword ptr [rbp - 0x80], rax
0xb9dd42: jmp 0x140b9de3e
0xb9dd47: mov r8d, dword ptr [rbp - 0x60]
0xb9dd4b: lea rdx, [rbp - 0x28]
0xb9dd4f: mov rcx, r12
0xb9dd52: call 0x1408a67e0
0xb9dd57: nop 
0xb9dd58: cmp byte ptr [rbp - 0x18], 0
0xb9dd5c: je 0x140b9dd87
0xb9dd5e: mov rbx, qword ptr [rbp - 0x20]
0xb9dd62: mov rcx, rbx
0xb9dd65: call 0x140466060
0xb9dd6a: test al, al
0xb9dd6c: je 0x140b9dd84
0xb9dd6e: mov rax, qword ptr [rbx + 0x68]
0xb9dd72: mov rcx, qword ptr [rax + 0x1a0]
0xb9dd79: mov rax, qword ptr [rcx]
0xb9dd7c: xor edx, edx
0xb9dd7e: call qword ptr [rax + 0x150]
0xb9dd84: mov qword ptr [r15], rbx
0xb9dd87: mov rax, qword ptr [rbp]
0xb9dd8b: mov qword ptr [rbp - 0x38], rax
0xb9dd8f: mov eax, dword ptr [rbp + 8]
0xb9dd92: mov dword ptr [rbp - 0x30], eax
0xb9dd95: mov rcx, qword ptr [r15]
0xb9dd98: test rcx, rcx
0xb9dd9b: je 0x140b9ddd3
0xb9dd9d: mov rax, qword ptr [rcx + 0x88]
0xb9dda4: cmp byte ptr [rax + 1], 1
0xb9dda8: jne 0x140b9ddd3
0xb9ddaa: cmp byte ptr [rcx + 0x96], 0
0xb9ddb1: je 0x140b9ddd3
0xb9ddb3: mov rcx, qword ptr [rcx + 0x68]
0xb9ddb7: lea r9, [rbp - 0x38]
0xb9ddbb: movzx r8d, byte ptr [rbp + 0x1078]
0xb9ddc3: lea rdx, [rbp - 0x58]
0xb9ddc7: mov rcx, qword ptr [rcx + 0x168]
0xb9ddce: call 0x140495460
0xb9ddd3: mov dword ptr [rdi], r13d
0xb9ddd6: lea rax, [rip + 0x49d5a63]
0xb9dddd: mov qword ptr [rbp - 0x28], rax
0xb9dde1: lea rax, [rip + 0x4b88060]
0xb9dde8: mov qword ptr [rbp - 0x28], rax
0xb9ddec: lea rcx, [rbp - 0x28]
0xb9ddf0: call 0x141434880
0xb9ddf5: nop 
0xb9ddf6: lea rax, [rip + 0x4b83e63]
0xb9ddfd: mov qword ptr [rbp - 0x80], rax
0xb9de01: lea rax, [rip + 0x4b83eb8]
0xb9de08: mov qword ptr [rbp - 0x80], rax
0xb9de0c: jmp 0x140b9de3e
0xb9de0e: mov eax, dword ptr [rip + 0x613db5c]
0xb9de14: mov dword ptr [rdi], eax
0xb9de16: lea rax, [rip + 0x4b83e43]
0xb9de1d: mov qword ptr [rbp - 0x80], rax
0xb9de21: mov qword ptr [rbp - 0x80], rsi
0xb9de25: jmp 0x140b9de3e
0xb9de27: mov eax, dword ptr [rip + 0x613db43]
0xb9de2d: mov dword ptr [rdi], eax
0xb9de2f: lea rax, [rip + 0x4b83e2a]
0xb9de36: mov qword ptr [rbp - 0x80], rax
0xb9de3a: mov qword ptr [rbp - 0x80], rsi
0xb9de3e: lea rax, [rbp + 0x10]
0xb9de42: mov rcx, qword ptr [rbp]
0xb9de46: cmp rcx, rax
0xb9de49: je 0x140b9df35
0xb9de4f: test rcx, rcx
0xb9de52: je 0x140b9df35
0xb9de58: mov rax, qword ptr gs:[0x58]
0xb9de61: mov rdx, qword ptr [rax]
0xb9de64: mov r8d, 0x1fd
0xb9de6a: cmp byte ptr [r8 + rdx], 0
0xb9de6f: je 0x140b9de7b
0xb9de71: call 0x1447f03bc
0xb9de76: jmp 0x140b9df35
0xb9de7b: call 0x1447f02bc
0xb9de80: jmp 0x140b9df35
0xb9de85: mov rsi, qword ptr [r8]
0xb9de88: test rsi, rsi
0xb9de8b: je 0x140b9df0c
0xb9de8d: mov rax, qword ptr [rsi]
0xb9de90: lea rdx, [rbp - 8]
0xb9de94: mov rcx, rsi
0xb9de97: call qword ptr [rax + 0xd0]
0xb9de9d: mov rdx, qword ptr [rax]
0xb9dea0: mov qword ptr [rbp - 0x58], rdx
0xb9dea4: mov rax, qword ptr [rsi]
0xb9dea7: lea rdx, [rbp - 0x38]
0xb9deab: mov rcx, rsi
0xb9deae: call qword ptr [rax + 0xd8]
0xb9deb4: mov rdx, qword ptr [rax]
0xb9deb7: mov qword ptr [rbp - 0x48], rdx
0xb9debb: mov rax, qword ptr [rsi]
0xb9debe: mov rcx, rsi
0xb9dec1: call qword ptr [rax + 0xc8]
0xb9dec7: mov qword ptr [rbp - 0x40], rax
0xb9decb: lea rax, [rbx + 0xc]
0xb9decf: lea rcx, [rbx + 0x22]
0xb9ded3: lea rdx, [rbp - 0x58]
0xb9ded7: mov qword ptr [rsp + 0x80], rdx
0xb9dedf: lea rdx, [rbp - 0x48]
0xb9dee3: mov qword ptr [rsp + 0x78], rdx
0xb9dee8: lea rdx, [rbp - 0x40]
0xb9deec: mov qword ptr [rsp + 0x70], rdx
0xb9def1: mov qword ptr [rsp + 0x68], rax
0xb9def6: mov qword ptr [rsp + 0x60], rcx
0xb9defb: mov eax, dword ptr [rip + 0x613da73]
0xb9df01: mov dword ptr [rsp + 0x48], eax
0xb9df05: call 0x14143b450
0xb9df0a: jmp 0x140b9df2d
0xb9df0c: lea rax, [rbx + 0xc]
0xb9df10: lea rcx, [rbx + 0x22]
0xb9df14: mov qword ptr [rsp + 0x68], rax
0xb9df19: mov qword ptr [rsp + 0x60], rcx
0xb9df1e: mov eax, dword ptr [rip + 0x613da50]
0xb9df24: mov dword ptr [rsp + 0x48], eax
0xb9df28: call 0x14143b670
0xb9df2d: mov eax, dword ptr [rip + 0x613da41]
0xb9df33: mov dword ptr [rdi], eax
0xb9df35: mov rax, rdi
0xb9df38: mov rbx, qword ptr [rsp + 0x1170]
0xb9df40: add rsp, 0x1130
0xb9df47: pop r15
0xb9df49: pop r14
0xb9df4b: pop r13
0xb9df4d: pop r12
0xb9df4f: pop rdi
0xb9df50: pop rsi
0xb9df51: pop rbp
0xb9df52: ret 