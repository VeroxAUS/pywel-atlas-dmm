0x3d2cb50: mov qword ptr [rsp + 0x10], rdx
0x3d2cb55: push rbx
0x3d2cb56: push rbp
0x3d2cb57: push rsi
0x3d2cb58: push rdi
0x3d2cb59: push r12
0x3d2cb5b: push r14
0x3d2cb5d: push r15
0x3d2cb5f: sub rsp, 0x80
0x3d2cb66: movzx r15d, r8b
0x3d2cb6a: mov rbp, rcx
0x3d2cb6d: lea rdi, [rcx + 8]
0x3d2cb71: mov qword ptr [rsp + 0x68], rdi
0x3d2cb76: mov byte ptr [rsp + 0x70], 1
0x3d2cb7b: mov edx, 1
0x3d2cb80: lock xadd dword ptr [rdi + 8], edx
0x3d2cb85: inc edx
0x3d2cb87: mov eax, dword ptr [rdi + 0xc]
0x3d2cb8a: shr eax, 0x1f
0x3d2cb8d: test al, al
0x3d2cb8f: jne 0x143d2cba0
0x3d2cb91: cmp edx, 1
0x3d2cb94: sete dl
0x3d2cb97: mov rax, qword ptr [rdi]
0x3d2cb9a: mov rcx, rdi
0x3d2cb9d: call qword ptr [rax + 0x30]
0x3d2cba0: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cba7: je 0x143d2cbad
0x3d2cba9: lock inc dword ptr [rdi + 0xc]
0x3d2cbad: mov rax, qword ptr [rdi]
0x3d2cbb0: xor edx, edx
0x3d2cbb2: mov rcx, rdi
0x3d2cbb5: call qword ptr [rax + 0x18]
0x3d2cbb8: nop 
0x3d2cbb9: xor r12d, r12d
0x3d2cbbc: cmp dword ptr [rbp + 0x3c], r12d
0x3d2cbc0: je 0x143d2cc3f
0x3d2cbc2: mov rsi, qword ptr [rsp + 0xc8]
0x3d2cbca: mov qword ptr [rsp + 0xc0], rsi
0x3d2cbd2: mov edx, 8
0x3d2cbd7: lea rcx, [rsp + 0xc0]
0x3d2cbdf: call 0x1403d6210
0x3d2cbe4: mov r10d, eax
0x3d2cbe7: mov ecx, dword ptr [rbp + 0x38]
0x3d2cbea: test ecx, ecx
0x3d2cbec: je 0x143d2cc3f
0x3d2cbee: xor edx, edx
0x3d2cbf0: div ecx
0x3d2cbf2: mov r8d, edx
0x3d2cbf5: shl r8, 8
0x3d2cbf9: add r8, qword ptr [rbp + 0x48]
0x3d2cbfd: mov edx, r12d
0x3d2cc00: mov r9d, dword ptr [r8]
0x3d2cc03: test r9d, r9d
0x3d2cc06: je 0x143d2cc3f
0x3d2cc08: nop dword ptr [rax + rax]
0x3d2cc10: mov eax, edx
0x3d2cc12: cmp dword ptr [r8 + rax*8 + 8], r10d
0x3d2cc17: jne 0x143d2cc2c
0x3d2cc19: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0x3d2cc1e: mov rax, qword ptr [rbp + 0x50]
0x3d2cc22: mov rbx, qword ptr [rax + rcx*8]
0x3d2cc26: cmp qword ptr [rbx + 8], rsi
0x3d2cc2a: je 0x143d2cc35
0x3d2cc2c: inc edx
0x3d2cc2e: cmp edx, r9d
0x3d2cc31: jb 0x143d2cc10
0x3d2cc33: jmp 0x143d2cc3f
0x3d2cc35: add rbx, 0x10
0x3d2cc39: jne 0x143d2cd6c
0x3d2cc3f: test r15b, r15b
0x3d2cc42: je 0x143d2cdaa
0x3d2cc48: mov edx, 0x1fd
0x3d2cc4d: mov rax, qword ptr gs:[0x58]
0x3d2cc56: mov rcx, qword ptr [rax]
0x3d2cc59: cmp byte ptr [rdx + rcx], r12b
0x3d2cc5d: mov edx, 0x10
0x3d2cc62: mov ecx, 0x68
0x3d2cc67: je 0x143d2cc70
0x3d2cc69: call 0x1447efa78
0x3d2cc6e: jmp 0x143d2cc75
0x3d2cc70: call 0x1447ef9b0
0x3d2cc75: mov rsi, rax
0x3d2cc78: test rax, rax
0x3d2cc7b: jne 0x143d2cc98
0x3d2cc7d: call 0x141318e70
0x3d2cc82: xor r9d, r9d
0x3d2cc85: xor r8d, r8d
0x3d2cc88: mov edx, 1
0x3d2cc8d: mov ecx, 0xa0000002
0x3d2cc92: call qword ptr [rip + 0x14be4b0]
0x3d2cc98: mov qword ptr [rsp + 0xc0], rsi
0x3d2cca0: test rsi, rsi
0x3d2cca3: je 0x143d2ccf0
0x3d2cca5: mov rax, qword ptr [rsp + 0xc8]
0x3d2ccad: lea rbx, [rsi + 0x38]
0x3d2ccb1: mov qword ptr [rsi], rbx
0x3d2ccb4: mov qword ptr [rsi + 8], r12
0x3d2ccb8: mov dword ptr [rsi + 0x10], r12d
0x3d2ccbc: mov dword ptr [rsi + 0x14], 0xffffffff
0x3d2ccc3: mov qword ptr [rsi + 0x18], r12
0x3d2ccc7: mov qword ptr [rsi + 0x20], r12
0x3d2cccb: mov qword ptr [rsi + 0x28], rax
0x3d2cccf: mov qword ptr [rsi + 0x30], rbp
0x3d2ccd3: mov qword ptr [rsp + 0xd8], rbx
0x3d2ccdb: mov rcx, rbx
0x3d2ccde: call 0x141371960
0x3d2cce3: nop 
0x3d2cce4: lea rax, [rip + 0x18501e5]
0x3d2cceb: mov qword ptr [rbx], rax
0x3d2ccee: jmp 0x143d2ccf3
0x3d2ccf0: mov rsi, r12
0x3d2ccf3: mov qword ptr [rsp + 0xd8], rsi
0x3d2ccfb: lea rax, [rsp + 0xc8]
0x3d2cd03: mov qword ptr [rsp + 0x50], rax
0x3d2cd08: inc dword ptr [rbp + 0x44]
0x3d2cd0b: mov rax, qword ptr [rsp + 0xc8]
0x3d2cd13: mov qword ptr [rsp + 0xc0], rax
0x3d2cd1b: mov edx, 8
0x3d2cd20: lea rcx, [rsp + 0xc0]
0x3d2cd28: call 0x1403d6210
0x3d2cd2d: mov r8d, eax
0x3d2cd30: lea rax, [rsp + 0x58]
0x3d2cd35: mov qword ptr [rsp + 0x38], rax
0x3d2cd3a: lea rax, [rsp + 0x60]
0x3d2cd3f: mov qword ptr [rsp + 0x30], rax
0x3d2cd44: lea rax, [rsp + 0xc0]
0x3d2cd4c: mov qword ptr [rsp + 0x28], rax
0x3d2cd51: lea r9, [rsp + 0xd8]
0x3d2cd59: lea rdx, [rsp + 0x50]
0x3d2cd5e: lea rcx, [rbp + 0x38]
0x3d2cd62: call 0x143d32570
0x3d2cd67: mov rbx, qword ptr [rsp + 0x58]
0x3d2cd6c: mov rax, qword ptr [rdi]
0x3d2cd6f: xor edx, edx
0x3d2cd71: mov rcx, rdi
0x3d2cd74: call qword ptr [rax + 0x20]
0x3d2cd77: mov eax, 0xffffffff
0x3d2cd7c: lock xadd dword ptr [rdi + 8], eax
0x3d2cd81: cmp eax, 1
0x3d2cd84: jne 0x143d2cd98
0x3d2cd86: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd8d: je 0x143d2cda5
0x3d2cd8f: mov rax, qword ptr [rdi]
0x3d2cd92: mov rcx, rdi
0x3d2cd95: call qword ptr [rax + 0x40]
0x3d2cd98: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd9f: je 0x143d2cda5
0x3d2cda1: lock dec dword ptr [rdi + 0xc]
0x3d2cda5: mov rax, qword ptr [rbx]
0x3d2cda8: jmp 0x143d2cde5
0x3d2cdaa: mov rax, qword ptr [rdi]
0x3d2cdad: xor edx, edx
0x3d2cdaf: mov rcx, rdi
0x3d2cdb2: call qword ptr [rax + 0x20]
0x3d2cdb5: mov eax, 0xffffffff
0x3d2cdba: lock xadd dword ptr [rdi + 8], eax
0x3d2cdbf: cmp eax, 1
0x3d2cdc2: jne 0x143d2cdd6
0x3d2cdc4: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cdcb: je 0x143d2cde3
0x3d2cdcd: mov rax, qword ptr [rdi]
0x3d2cdd0: mov rcx, rdi
0x3d2cdd3: call qword ptr [rax + 0x40]
0x3d2cdd6: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cddd: je 0x143d2cde3
0x3d2cddf: lock dec dword ptr [rdi + 0xc]
0x3d2cde3: xor eax, eax
0x3d2cde5: add rsp, 0x80
0x3d2cdec: pop r15
0x3d2cdee: pop r14
0x3d2cdf0: pop r12
0x3d2cdf2: pop rdi
0x3d2cdf3: pop rsi
0x3d2cdf4: pop rbp
0x3d2cdf5: pop rbx
0x3d2cdf6: ret 