0xe08d70: mov qword ptr [rsp + 0x18], rbx
0xe08d75: mov qword ptr [rsp + 0x10], rdx
0xe08d7a: push rbp
0xe08d7b: push rsi
0xe08d7c: push rdi
0xe08d7d: push r12
0xe08d7f: push r13
0xe08d81: push r14
0xe08d83: push r15
0xe08d85: lea rbp, [rsp - 7]
0xe08d8a: sub rsp, 0xc0
0xe08d91: mov r13, r9
0xe08d94: mov r15, r8
0xe08d97: mov r12, rdx
0xe08d9a: mov r14, rcx
0xe08d9d: mov rsi, qword ptr [rbp + 0x8f]
0xe08da4: xor edi, edi
0xe08da6: mov dword ptr [rbp - 0x49], edi
0xe08da9: mov rax, qword ptr [rcx]
0xe08dac: call qword ptr [rax + 0x548]
0xe08db2: test rax, rax
0xe08db5: jne 0x140e09079
0xe08dbb: mov rdx, qword ptr [rip + 0x5ea3676]  ; [0x6cac438] = runtime global (no file value)
0xe08dc2: cmp dl, 1
0xe08dc5: jne 0x140e08efc
0xe08dcb: lea rax, [rip + 0x486714e]  ; [0x566ff20] = 6.96105 (0x40dec0f0)
0xe08dd2: mov qword ptr [rbp - 0x21], rax
0xe08dd6: lea rax, [rip + 0x4867163]  ; [0x566ff40] = 6.86002 (0x40db8540)
0xe08ddd: mov qword ptr [rbp - 0x21], rax
0xe08de1: mov eax, 0xffff
0xe08de6: mov word ptr [rbp - 0x19], ax
0xe08dea: mov qword ptr [rbp - 0x11], 0xffffffffffffffff
0xe08df2: mov byte ptr [rbp - 9], 0x15
0xe08df6: xor eax, eax
0xe08df8: mov dword ptr [rbp - 8], eax
0xe08dfb: mov word ptr [rbp - 4], ax
0xe08dff: mov byte ptr [rbp - 2], al
0xe08e02: mov dword ptr [rbp - 1], edi
0xe08e05: movzx eax, word ptr [r12]
0xe08e0a: mov word ptr [rbp - 0x19], ax
0xe08e0e: movzx eax, byte ptr [r15 + 8]
0xe08e13: mov byte ptr [rbp - 9], al
0xe08e16: mov rax, qword ptr [r15]
0xe08e19: mov qword ptr [rbp - 0x11], rax
0xe08e1d: mov eax, dword ptr [r13]
0xe08e21: mov dword ptr [rbp - 1], eax
0xe08e24: mov rax, qword ptr [r14]
0xe08e27: mov rcx, r14
0xe08e2a: call qword ptr [rax + 0x110]
0xe08e30: mov rcx, qword ptr [rax + 0xb0]
0xe08e37: mov qword ptr [rbp - 0x41], rdi
0xe08e3b: mov qword ptr [rbp - 0x39], rdi
0xe08e3f: mov qword ptr [rbp - 0x31], rdi
0xe08e43: mov word ptr [rbp - 0x29], di
0xe08e47: mov qword ptr [rbp - 0x41], r14
0xe08e4b: lea rax, [rip - 0x204a2]  ; [0xde89b0] = 5.72061 (0x40b70f41)
0xe08e52: mov qword ptr [rbp - 0x39], rax
0xe08e56: mov byte ptr [rbp - 0x29], dil
0xe08e5a: mov ebx, 1
0xe08e5f: mov dword ptr [rbp - 0x49], ebx
0xe08e62: lea r9, [rbp - 0x41]
0xe08e66: lea r8, [rbp - 0x21]
0xe08e6a: lea rdx, [rip + 0x5ec8347]  ; [0x6cd11b8] = runtime global (no file value)
0xe08e71: call 0x143d20740
0xe08e76: mov byte ptr [rbp + 0x47], al
0xe08e79: and ebx, 0xfffffffe
0xe08e7c: mov dword ptr [rbp - 0x49], ebx
0xe08e7f: cmp byte ptr [rbp - 0x28], dil
0xe08e83: je 0x140e08eb6
0xe08e85: mov rcx, qword ptr [rbp - 0x41]
0xe08e89: test rcx, rcx
0xe08e8c: je 0x140e08eb6
0xe08e8e: mov r8d, 0x1fd
0xe08e94: mov rax, qword ptr gs:[0x58]
0xe08e9d: mov rdx, qword ptr [rax]
0xe08ea0: cmp byte ptr [r8 + rdx], dil
0xe08ea4: je 0x140e08ead
0xe08ea6: call 0x1447f03bc
0xe08eab: jmp 0x140e08eb2
0xe08ead: call 0x1447f02bc
0xe08eb2: mov qword ptr [rbp - 0x41], rdi
0xe08eb6: mov byte ptr [rbp - 0x28], 0
0xe08eba: mov qword ptr [rbp - 0x41], rdi
0xe08ebe: mov qword ptr [rbp - 0x39], rdi
0xe08ec2: mov qword ptr [rbp - 0x31], rdi
0xe08ec6: mov byte ptr [rbp - 0x28], 0
0xe08eca: lea rcx, [rbp - 0x41]
0xe08ece: call 0x14035f1f0
0xe08ed3: nop 
0xe08ed4: cmp byte ptr [rbp + 0x47], 1
0xe08ed8: jne 0x140e08eea
0xe08eda: lea rax, [rip + 0x486703f]  ; [0x566ff20] = 6.96105 (0x40dec0f0)
0xe08ee1: mov qword ptr [rbp - 0x21], rax
0xe08ee5: jmp 0x140e09079
0xe08eea: lea rax, [rip + 0x486702f]  ; [0x566ff20] = 6.96105 (0x40dec0f0)
0xe08ef1: mov qword ptr [rbp - 0x21], rax
0xe08ef5: mov rdx, qword ptr [rip + 0x5ea353c]  ; [0x6cac438] = runtime global (no file value)
0xe08efc: mov rbx, qword ptr [rbp + 0x7f]
0xe08f00: test rbx, rbx
0xe08f03: je 0x140e09079
0xe08f09: cmp byte ptr [rbx], 0
0xe08f0c: je 0x140e09079
0xe08f12: mov cl, 0xe
0xe08f14: mov r8d, dword ptr [rsi + 4]
0xe08f18: test r8d, r8d
0xe08f1b: je 0x140e08f4e
0xe08f1d: mov rax, qword ptr [rsi + 0x10]
0xe08f21: mov rcx, qword ptr [rax]
0xe08f24: mov eax, dword ptr [rcx + 0x14]
0xe08f27: mov r9, rsi
0xe08f2a: cmp dword ptr [rip + 0x5ec8290], eax  ; [0x6cd11c0] = runtime global (no file value)
0xe08f30: mov eax, 0x10
0xe08f35: je 0x140e08f42
0xe08f37: mov rcx, rdi
0xe08f3a: movzx ecx, byte ptr [rcx]
0xe08f3d: add rax, rsi
0xe08f40: jmp 0x140e08f52
0xe08f42: add rcx, 0x10
0xe08f46: movzx ecx, byte ptr [rcx]
0xe08f49: add rax, r9
0xe08f4c: jmp 0x140e08f52
0xe08f4e: lea rax, [rsi + 0x10]
0xe08f52: cmp dl, 1
0xe08f55: jne 0x140e08fb2
0xe08f57: cmp cl, 0xd
0xe08f5a: je 0x140e08fb2
0xe08f5c: movzx eax, byte ptr [rbp + 0x97]
0xe08f63: mov byte ptr [rsp + 0x68], al
0xe08f67: mov qword ptr [rsp + 0x60], rsi
0xe08f6c: mov rax, qword ptr [rbp + 0x67]
0xe08f70: vmovss xmm0, dword ptr [rax]
0xe08f74: vmovss dword ptr [rsp + 0x58], xmm0
0xe08f7a: movzx eax, byte ptr [rbp + 0x87]
0xe08f81: mov byte ptr [rsp + 0x50], al
0xe08f85: mov qword ptr [rsp + 0x48], rbx
0xe08f8a: mov rax, qword ptr [rbp + 0x77]
0xe08f8e: mov qword ptr [rsp + 0x40], rax
0xe08f93: mov rax, qword ptr [rbp + 0x6f]
0xe08f97: mov qword ptr [rsp + 0x20], rax
0xe08f9c: mov r9, r13
0xe08f9f: mov r8, r15
0xe08fa2: mov rdx, r12
0xe08fa5: mov rcx, r14
0xe08fa8: call 0x140e0b470
0xe08fad: jmp 0x140e09079
0xe08fb2: mov dword ptr [rbp + 0x47], edi
0xe08fb5: test cl, cl
0xe08fb7: jne 0x140e08fda
0xe08fb9: cmp r8d, 1
0xe08fbd: jbe 0x140e08fd5
0xe08fbf: mov rax, qword ptr [rax]
0xe08fc2: mov rcx, qword ptr [rax + 8]
0xe08fc6: mov eax, dword ptr [rcx + 0x14]
0xe08fc9: cmp dword ptr [rip + 0x5ec81f9], eax  ; [0x6cd11c8] = runtime global (no file value)
0xe08fcf: jne 0x140e08fd5
0xe08fd1: lea rdi, [rcx + 0x10]
0xe08fd5: mov eax, dword ptr [rdi]
0xe08fd7: mov dword ptr [rbp + 0x47], eax
0xe08fda: movzx eax, byte ptr [rbp + 0x97]
0xe08fe1: mov byte ptr [rsp + 0x58], al
0xe08fe5: lea rax, [rbp + 0x47]
0xe08fe9: mov qword ptr [rsp + 0x50], rax
0xe08fee: mov qword ptr [rsp + 0x48], rbx
0xe08ff3: mov rsi, qword ptr [rbp + 0x77]
0xe08ff7: mov qword ptr [rsp + 0x40], rsi
0xe08ffc: mov rax, qword ptr [r14 + 0x398]
0xe09003: mov qword ptr [rsp + 0x30], rax
0xe09008: mov rax, qword ptr [r14 + 0x390]
0xe0900f: mov qword ptr [rsp + 0x28], rax
0xe09014: mov r12, qword ptr [rbp + 0x6f]
0xe09018: mov qword ptr [rsp + 0x20], r12
0xe0901d: mov r9, r13
0xe09020: mov r8, r15
0xe09023: mov rdx, qword ptr [rbp + 0x4f]
0xe09027: mov rcx, r14
0xe0902a: call 0x140e0c2c0
0xe0902f: mov rdi, rax
0xe09032: test rax, rax
0xe09035: je 0x140e09079
0xe09037: movzx ecx, byte ptr [rbp + 0x87]
0xe0903e: mov byte ptr [rsp + 0x48], cl
0xe09042: mov qword ptr [rsp + 0x40], rbx
0xe09047: mov qword ptr [rsp + 0x38], rsi
0xe0904c: mov qword ptr [rsp + 0x30], r12
0xe09051: mov rcx, qword ptr [rbp + 0x67]
0xe09055: mov qword ptr [rsp + 0x28], rcx
0xe0905a: mov qword ptr [rsp + 0x20], r13
0xe0905f: mov r9, r15
0xe09062: mov r8, qword ptr [rbp + 0x4f]
0xe09066: mov rdx, rax
0xe09069: mov rcx, r14
0xe0906c: call 0x140e090a0
0xe09071: mov rdx, rdi
0xe09074: call 0x140df4f60
0xe09079: mov rbx, qword ptr [rsp + 0x110]
0xe09081: add rsp, 0xc0
0xe09088: pop r15
0xe0908a: pop r14
0xe0908c: pop r13
0xe0908e: pop r12
0xe09090: pop rdi
0xe09091: pop rsi
0xe09092: pop rbp
0xe09093: ret 
0xe09094: int3 