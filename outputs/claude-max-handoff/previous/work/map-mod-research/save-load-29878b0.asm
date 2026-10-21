0x29878b0: mov qword ptr [rsp + 8], rbx
0x29878b5: mov qword ptr [rsp + 0x18], r8
0x29878ba: push rbp
0x29878bb: push rsi
0x29878bc: push rdi
0x29878bd: push r12
0x29878bf: push r13
0x29878c1: push r14
0x29878c3: push r15
0x29878c5: lea rbp, [rsp - 0x27]
0x29878ca: sub rsp, 0xc0
0x29878d1: mov r12, r9
0x29878d4: mov rbx, rdx
0x29878d7: mov rsi, rcx
0x29878da: mov rax, qword ptr gs:[0x58]
0x29878e3: mov rax, qword ptr [rax]
0x29878e6: mov qword ptr [rbp + 0x17], rax
0x29878ea: mov ecx, 0x250
0x29878ef: mov rax, qword ptr [rcx + rax]
0x29878f3: xor edi, edi
0x29878f5: mov dword ptr [rax + 0x2b8], edi
0x29878fb: lea r15, [rax + 0x2b0]
0x2987902: mov rax, qword ptr [rdx]
0x2987905: mov rdx, r15
0x2987908: mov rcx, rbx
0x298790b: call qword ptr [rax + 8]
0x298790e: mov r13d, dword ptr [r15 + 8]
0x2987912: test r13d, r13d
0x2987915: je 0x142987d09
0x298791b: mov rcx, rbx
0x298791e: call 0x142961ca0
0x2987923: mov rbx, rax
0x2987926: test rax, rax
0x2987929: je 0x1429879ef
0x298792f: mov qword ptr [rbp - 0x31], rdi
0x2987933: lea rdx, [rbp - 0x31]
0x2987937: mov rcx, rax
0x298793a: call 0x142961de0
0x298793f: mov r15, rax
0x2987942: mov r14, qword ptr [rbp - 0x31]
0x2987946: test r14, r14
0x2987949: jne 0x142987994
0x298794b: lea rax, [rip + 0x3199cde]
0x2987952: mov qword ptr [rsp + 0x58], rax
0x2987957: mov dword ptr [rsp + 0x50], 6
0x298795f: mov eax, dword ptr [rip + 0x4351ae3]
0x2987965: mov dword ptr [rsp + 0x48], eax
0x2987969: lea r9, [rip + 0x2bebb3c]
0x2987970: mov qword ptr [rsp + 0x40], r9
0x2987975: mov dword ptr [rsp + 0x38], edi
0x2987979: mov qword ptr [rsp + 0x30], r9
0x298797e: mov qword ptr [rsp + 0x28], r9
0x2987983: mov qword ptr [rsp + 0x20], r9
0x2987988: mov cl, 1
0x298798a: call 0x14035d8d0
0x298798f: jmp 0x142987d09
0x2987994: test rsi, rsi
0x2987997: je 0x14298799c
0x2987999: mov edi, dword ptr [rsi + 0x60]
0x298799c: mov dword ptr [rbp + 0x6f], edi
0x298799f: mov rax, qword ptr [rax]
0x29879a2: mov r8d, 4
0x29879a8: lea rdx, [rbp + 0x6f]
0x29879ac: mov rcx, r15
0x29879af: call qword ptr [rax + 8]
0x29879b2: mov rax, qword ptr [r15]
0x29879b5: mov r8d, 1
0x29879bb: mov rdx, qword ptr [rbp + 0x77]
0x29879bf: mov rcx, r15
0x29879c2: call qword ptr [rax + 8]
0x29879c5: mov rax, qword ptr [r15]
0x29879c8: mov r8d, 4
0x29879ce: mov rdx, r12
0x29879d1: mov rcx, r15
0x29879d4: call qword ptr [rax + 8]
0x29879d7: mov word ptr [r14], 0xa77
0x29879dd: mov byte ptr [r14 + 2], 0xff
0x29879e2: mov rcx, rbx
0x29879e5: call 0x142961e90
0x29879ea: jmp 0x142987d09
0x29879ef: call 0x142962220
0x29879f4: mov qword ptr [rbp - 0x29], rdi
0x29879f8: mov dword ptr [rbp - 0x21], edi
0x29879fb: mov word ptr [rbp - 0x1d], di
0x29879ff: mov qword ptr [rbp - 0x19], rdi
0x2987a03: mov edx, 0xe
0x2987a08: mov r9, qword ptr [rip + 0x43e1c71]
0x2987a0f: mov r9, qword ptr [r9 + 0x30]
0x2987a13: lea rcx, [rbp - 0x29]
0x2987a17: call 0x142771b30
0x2987a1c: mov r14, rax
0x2987a1f: mov rbx, qword ptr [rbp - 0x29]
0x2987a23: test rax, rax
0x2987a26: jne 0x142987a74
0x2987a28: lea rax, [rip + 0x3199c01]
0x2987a2f: mov qword ptr [rsp + 0x58], rax
0x2987a34: mov dword ptr [rsp + 0x50], 6
0x2987a3c: mov eax, dword ptr [rip + 0x4351a06]
0x2987a42: mov dword ptr [rsp + 0x48], eax
0x2987a46: lea r9, [rip + 0x2beba5f]
0x2987a4d: mov qword ptr [rsp + 0x40], r9
0x2987a52: mov dword ptr [rsp + 0x38], edi
0x2987a56: mov qword ptr [rsp + 0x30], r9
0x2987a5b: mov qword ptr [rsp + 0x28], r9
0x2987a60: mov qword ptr [rsp + 0x20], r9
0x2987a65: mov cl, 1
0x2987a67: call 0x14035d8d0
0x2987a6c: mov ecx, dword ptr [rbp - 0x21]
0x2987a6f: jmp 0x142987c74
0x2987a74: lea rax, [rip + 0x2d9a1bd]
0x2987a7b: mov qword ptr [rbp - 0x11], rax
0x2987a7f: mov byte ptr [rbp - 9], 1
0x2987a83: lea rax, [rip + 0x2d9a20e]
0x2987a8a: mov qword ptr [rbp - 0x11], rax
0x2987a8e: lea rax, [r14 + 5]
0x2987a92: mov qword ptr [rbp - 1], rax
0x2987a96: mov qword ptr [rbp + 7], 0x7fc1
0x2987a9e: mov byte ptr [rbp + 0xf], 0
0x2987aa2: test rsi, rsi
0x2987aa5: je 0x142987aac
0x2987aa7: mov eax, dword ptr [rsi + 0x60]
0x2987aaa: jmp 0x142987aae
0x2987aac: mov eax, edi
0x2987aae: mov dword ptr [rbp - 0x39], eax
0x2987ab1: mov rax, qword ptr [rbp - 0x11]
0x2987ab5: mov r9, qword ptr [rax + 8]
0x2987ab9: lea rsi, [rip - 0x1568710]
0x2987ac0: mov r8d, 4
0x2987ac6: lea rdx, [rbp - 0x39]
0x2987aca: lea rcx, [rbp - 0x11]
0x2987ace: cmp r9, rsi
0x2987ad1: jne 0x142987ada
0x2987ad3: call 0x14141f3b0
0x2987ad8: jmp 0x142987add
0x2987ada: call r9
0x2987add: mov rax, qword ptr [rbp - 0x11]
0x2987ae1: mov r9, qword ptr [rax + 8]
0x2987ae5: lea rcx, [rip - 0x262df9c]
0x2987aec: cmp r9, rcx
0x2987aef: je 0x142987b06
0x2987af1: mov r8d, 1
0x2987af7: mov rdx, qword ptr [rbp + 0x77]
0x2987afb: lea rcx, [rbp - 0x11]
0x2987aff: call r9
0x2987b02: mov rax, qword ptr [rbp - 0x11]
0x2987b06: mov r9, qword ptr [rax + 8]
0x2987b0a: mov r8d, 4
0x2987b10: mov rdx, r12
0x2987b13: lea rcx, [rbp - 0x11]
0x2987b17: cmp r9, rsi
0x2987b1a: jne 0x142987b23
0x2987b1c: call 0x14141f3b0
0x2987b21: jmp 0x142987b26
0x2987b23: call r9
0x2987b26: movzx eax, word ptr [rbp + 0xb]
0x2987b2a: mov word ptr [r14 + 3], ax
0x2987b2f: movzx esi, word ptr [rbp + 0xb]
0x2987b33: mov r12d, 0xa77
0x2987b39: mov word ptr [r14], r12w
0x2987b3d: mov byte ptr [r14 + 2], 0xff
0x2987b42: add si, 5
0x2987b46: cmp r13d, 1
0x2987b4a: jne 0x142987c30
0x2987b50: mov rax, qword ptr [r15]
0x2987b53: mov r14, qword ptr [rax]
0x2987b56: test r14, r14
0x2987b59: je 0x142987c57
0x2987b5f: mov rax, qword ptr [r14]
0x2987b62: mov rcx, r14
0x2987b65: call qword ptr [rax + 0x70]
0x2987b68: movzx r13d, al
0x2987b6c: mov r15, qword ptr [r14 + 0x98]
0x2987b73: test r15, r15
0x2987b76: je 0x142987b9d
0x2987b78: mov rdx, qword ptr [r15]
0x2987b7b: mov rcx, r15
0x2987b7e: call qword ptr [rdx + 0x10]
0x2987b81: cmp al, 1
0x2987b83: jne 0x142987b98
0x2987b85: movzx r8d, si
0x2987b89: lea rdx, [rbx + 0x33]
0x2987b8d: mov rax, qword ptr [r15]
0x2987b90: mov rcx, r15
0x2987b93: call qword ptr [rax + 0x28]
0x2987b96: jmp 0x142987b9d
0x2987b98: test r13b, r13b
0x2987b9b: je 0x142987c08
0x2987b9d: cmp si, 1
0x2987ba1: jb 0x142987c08
0x2987ba3: movzx ecx, word ptr [rbx + 0x803c]
0x2987baa: sub rcx, 3
0x2987bae: movzx eax, si
0x2987bb1: cmp rcx, rax
0x2987bb4: jb 0x142987c08
0x2987bb6: add si, 0x1f
0x2987bba: mov word ptr [rbx + 0x8038], si
0x2987bc1: mov word ptr [rbx + 0x803a], si
0x2987bc8: mov rax, qword ptr [rbx + 0x8030]
0x2987bcf: mov word ptr [rax], si
0x2987bd2: mov rax, qword ptr [rbx + 0x8030]
0x2987bd9: mov byte ptr [rax + 2], 0
0x2987bdd: movzx eax, word ptr [rbx + 0x8038]
0x2987be4: mov dword ptr [rbx + 0x8040], eax
0x2987bea: lea rdx, [rbx + 0x30]
0x2987bee: movzx r8d, word ptr [rdx + 0x800a]
0x2987bf6: sub r8, rax
0x2987bf9: add r8, rdx
0x2987bfc: mov qword ptr [rbx + 0x8048], r8
0x2987c03: mov word ptr [rbp - 0x1d], r12w
0x2987c08: mov byte ptr [rbp + 0x6f], 0
0x2987c0c: mov rax, qword ptr [r14]
0x2987c0f: lea r9, [rbp + 0x6f]
0x2987c13: mov r8, rbx
0x2987c16: lea rdx, [rbp - 0x31]
0x2987c1a: mov rcx, r14
0x2987c1d: call qword ptr [rax + 0x48]
0x2987c20: cmp dword ptr [rbp - 0x31], 0
0x2987c24: jne 0x142987c57
0x2987c26: mov ecx, dword ptr [rbp - 0x21]
0x2987c29: dec ecx
0x2987c2b: mov dword ptr [rbp - 0x21], ecx
0x2987c2e: jmp 0x142987c5a
0x2987c30: cmp dword ptr [r15 + 8], 0
0x2987c35: je 0x142987c57
0x2987c37: mov edx, r12d
0x2987c3a: mov qword ptr [rsp + 0x30], r15
0x2987c3f: mov byte ptr [rsp + 0x20], 0
0x2987c44: movzx r9d, si
0x2987c48: mov r8, r14
0x2987c4b: mov rcx, qword ptr [rip + 0x43e1a2e]
0x2987c52: call 0x142773870
0x2987c57: mov ecx, dword ptr [rbp - 0x21]
0x2987c5a: lea rax, [rip + 0x2d9a037]
0x2987c61: mov qword ptr [rbp - 0x11], rax
0x2987c65: mov qword ptr [rbp - 1], rdi
0x2987c69: lea rax, [rip + 0x2d99fc8]
0x2987c70: mov qword ptr [rbp - 0x11], rax
0x2987c74: test rbx, rbx
0x2987c77: je 0x142987d09
0x2987c7d: test ecx, ecx
0x2987c7f: jle 0x142987cfa
0x2987c81: mov eax, ecx
0x2987c83: neg eax
0x2987c85: lock xadd dword ptr [rbx + 0x8050], eax
0x2987c8d: cmp eax, ecx
0x2987c8f: jne 0x142987cfa
0x2987c91: mov dword ptr [rbx + 0x8038], edi
0x2987c97: mov dword ptr [rbx + 0x8040], edi
0x2987c9d: lea rax, [rbx + 0x30]
0x2987ca1: mov qword ptr [rbx + 0x8048], rax
0x2987ca8: mov dword ptr [rbx + 0x8050], edi
0x2987cae: mov qword ptr [rbp + 0x6f], rbx
0x2987cb2: mov qword ptr [rbp - 0x31], rbx
0x2987cb6: lea rcx, [rip + 0x2d9e5fb]
0x2987cbd: mov qword ptr [rbx], rcx
0x2987cc0: mov qword ptr [rbx + 0x8030], rdi
0x2987cc7: mov qword ptr [rbp + 0x1f], rax
0x2987ccb: mov qword ptr [rax + 0x8000], rdi
0x2987cd2: lea rax, [rip + 0x2d9e5ef]
0x2987cd9: mov qword ptr [rbx], rax
0x2987cdc: mov ecx, 0x1fd
0x2987ce1: mov rax, qword ptr [rbp + 0x17]
0x2987ce5: cmp byte ptr [rcx + rax], 0
0x2987ce9: mov rcx, rbx
0x2987cec: je 0x142987cf5
0x2987cee: call 0x1447f03bc
0x2987cf3: jmp 0x142987cfa
0x2987cf5: call 0x1447f02bc
0x2987cfa: mov qword ptr [rbp - 0x29], rdi
0x2987cfe: mov dword ptr [rbp - 0x21], edi
0x2987d01: mov word ptr [rbp - 0x1d], di
0x2987d05: mov qword ptr [rbp - 0x19], rdi
0x2987d09: mov rbx, qword ptr [rsp + 0x100]
0x2987d11: add rsp, 0xc0
0x2987d18: pop r15
0x2987d1a: pop r14
0x2987d1c: pop r13
0x2987d1e: pop r12
0x2987d20: pop rdi
0x2987d21: pop rsi
0x2987d22: pop rbp
0x2987d23: ret 