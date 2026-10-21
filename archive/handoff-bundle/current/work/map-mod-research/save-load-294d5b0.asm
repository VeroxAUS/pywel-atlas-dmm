0x294d5b0: mov qword ptr [rsp + 0x10], rbx
0x294d5b5: mov qword ptr [rsp + 0x18], rsi
0x294d5ba: mov qword ptr [rsp + 0x20], rdi
0x294d5bf: push rbp
0x294d5c0: push r12
0x294d5c2: push r13
0x294d5c4: push r14
0x294d5c6: push r15
0x294d5c8: lea rbp, [rsp - 0x140]
0x294d5d0: sub rsp, 0x240
0x294d5d7: movzx edi, r9b
0x294d5db: mov ebx, r8d
0x294d5de: mov r15, rdx
0x294d5e1: mov r13, rcx
0x294d5e4: xor esi, esi
0x294d5e6: mov dword ptr [rbp - 0x48], esi
0x294d5e9: mov r14, qword ptr [rcx + 8]
0x294d5ed: lea rdx, [rbp - 0x78]
0x294d5f1: mov rcx, r14
0x294d5f4: call 0x1428fb8b0
0x294d5f9: nop 
0x294d5fa: cmp byte ptr [rbp - 0x68], sil
0x294d5fe: jne 0x14294d63f
0x294d600: mov eax, dword ptr [rip + 0x43a954e]
0x294d606: mov dword ptr [r15], eax
0x294d609: lea rax, [rip + 0x2fc5850]
0x294d610: mov qword ptr [rbp - 0x78], rax
0x294d614: cmp byte ptr [rbp - 0x68], sil
0x294d618: je 0x14294d628
0x294d61a: mov rcx, qword ptr [rbp - 0x50]
0x294d61e: mov rax, qword ptr [rcx]
0x294d621: call qword ptr [rax + 0x148]
0x294d627: nop 
0x294d628: lea rax, [rip + 0x2c26211]
0x294d62f: mov qword ptr [rbp - 0x78], rax
0x294d633: lea rdi, [rip + 0x2dd880e]
0x294d63a: jmp 0x14294df20
0x294d63f: lea rdx, [rsp + 0x20]
0x294d644: mov rcx, qword ptr [r14 + 0xa0]
0x294d64b: call 0x14206ae30
0x294d650: nop 
0x294d651: cmp byte ptr [rsp + 0x30], 0
0x294d656: jne 0x14294d72b
0x294d65c: mov eax, dword ptr [rip + 0x43a985a]
0x294d662: mov dword ptr [r15], eax
0x294d665: lea rdi, [rip + 0x2dd87dc]
0x294d66c: mov qword ptr [rsp + 0x20], rdi
0x294d671: cmp byte ptr [rsp + 0x30], 0
0x294d676: je 0x14294d6fc
0x294d67c: cmp byte ptr [rsp + 0x31], 0
0x294d681: jne 0x14294d693
0x294d683: mov rcx, qword ptr [rsp + 0x28]
0x294d688: mov rax, qword ptr [rcx]
0x294d68b: call qword ptr [rax + 8]
0x294d68e: movzx esi, al
0x294d691: jmp 0x14294d6d7
0x294d693: mov r14, qword ptr [rsp + 0x28]
0x294d698: lea rbx, [r14 + 0x18]
0x294d69c: mov qword ptr [rbp + 0x170], rbx
0x294d6a3: mov rax, qword ptr [rbx]
0x294d6a6: mov rcx, rbx
0x294d6a9: call qword ptr [rax + 8]
0x294d6ac: nop 
0x294d6ad: dec word ptr [r14 + 0x48]
0x294d6b2: cmp byte ptr [r14 + 0x4a], 0
0x294d6b7: jne 0x14294d6cb
0x294d6b9: lock xadd dword ptr [r14 + 0x10], esi
0x294d6bf: add si, word ptr [r14 + 0x48]
0x294d6c4: jne 0x14294d6cb
0x294d6c6: mov sil, 1
0x294d6c9: jmp 0x14294d6ce
0x294d6cb: xor sil, sil
0x294d6ce: mov rax, qword ptr [rbx]
0x294d6d1: mov rcx, rbx
0x294d6d4: call qword ptr [rax + 0x10]
0x294d6d7: test sil, sil
0x294d6da: je 0x14294d6f7
0x294d6dc: mov rcx, qword ptr [rsp + 0x28]
0x294d6e1: xor eax, eax
0x294d6e3: mov r14d, 1
0x294d6e9: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294d6ef: jne 0x14294d6f7
0x294d6f1: mov rax, qword ptr [rcx]
0x294d6f4: call qword ptr [rax + 0x10]
0x294d6f7: mov byte ptr [rsp + 0x30], 0
0x294d6fc: lea rax, [rip + 0x2fc575d]
0x294d703: mov qword ptr [rbp - 0x78], rax
0x294d707: cmp byte ptr [rbp - 0x68], 0
0x294d70b: je 0x14294d71b
0x294d70d: mov rcx, qword ptr [rbp - 0x50]
0x294d711: mov rax, qword ptr [rcx]
0x294d714: call qword ptr [rax + 0x148]
0x294d71a: nop 
0x294d71b: lea rax, [rip + 0x2c2611e]
0x294d722: mov qword ptr [rbp - 0x78], rax
0x294d726: jmp 0x14294df20
0x294d72b: mov r12d, 0xffff
0x294d731: test dil, dil
0x294d734: jne 0x14294d932
0x294d73a: lea rdx, [r14 + 8]
0x294d73e: test r14, r14
0x294d741: cmove rdx, rsi
0x294d745: mov rdx, qword ptr [rdx]
0x294d748: lea rcx, [rbp + 0x170]
0x294d74f: call 0x140393df0
0x294d754: nop 
0x294d755: movzx edi, byte ptr [r14 + 0xc3]
0x294d75d: mov rcx, qword ptr [rbp + 0x170]
0x294d764: mov rax, qword ptr [rcx]
0x294d767: mov dl, 1
0x294d769: call qword ptr [rax + 0x20]
0x294d76c: test dil, dil
0x294d76f: jne 0x14294d844
0x294d775: mov eax, dword ptr [rip + 0x43a9745]
0x294d77b: mov dword ptr [r15], eax
0x294d77e: lea rdi, [rip + 0x2dd86c3]
0x294d785: mov qword ptr [rsp + 0x20], rdi
0x294d78a: cmp byte ptr [rsp + 0x30], 0
0x294d78f: je 0x14294d815
0x294d795: cmp byte ptr [rsp + 0x31], 0
0x294d79a: jne 0x14294d7ac
0x294d79c: mov rcx, qword ptr [rsp + 0x28]
0x294d7a1: mov rax, qword ptr [rcx]
0x294d7a4: call qword ptr [rax + 8]
0x294d7a7: movzx esi, al
0x294d7aa: jmp 0x14294d7f0
0x294d7ac: mov r14, qword ptr [rsp + 0x28]
0x294d7b1: lea rbx, [r14 + 0x18]
0x294d7b5: mov qword ptr [rbp + 0x170], rbx
0x294d7bc: mov rax, qword ptr [rbx]
0x294d7bf: mov rcx, rbx
0x294d7c2: call qword ptr [rax + 8]
0x294d7c5: nop 
0x294d7c6: dec word ptr [r14 + 0x48]
0x294d7cb: cmp byte ptr [r14 + 0x4a], 0
0x294d7d0: jne 0x14294d7e4
0x294d7d2: lock xadd dword ptr [r14 + 0x10], esi
0x294d7d8: add si, word ptr [r14 + 0x48]
0x294d7dd: jne 0x14294d7e4
0x294d7df: mov sil, 1
0x294d7e2: jmp 0x14294d7e7
0x294d7e4: xor sil, sil
0x294d7e7: mov rax, qword ptr [rbx]
0x294d7ea: mov rcx, rbx
0x294d7ed: call qword ptr [rax + 0x10]
0x294d7f0: test sil, sil
0x294d7f3: je 0x14294d810
0x294d7f5: mov rcx, qword ptr [rsp + 0x28]
0x294d7fa: xor eax, eax
0x294d7fc: mov r14d, 1
0x294d802: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294d808: jne 0x14294d810
0x294d80a: mov rax, qword ptr [rcx]
0x294d80d: call qword ptr [rax + 0x10]
0x294d810: mov byte ptr [rsp + 0x30], 0
0x294d815: lea rax, [rip + 0x2fc5644]
0x294d81c: mov qword ptr [rbp - 0x78], rax
0x294d820: cmp byte ptr [rbp - 0x68], 0
0x294d824: je 0x14294d834
0x294d826: mov rcx, qword ptr [rbp - 0x50]
0x294d82a: mov rax, qword ptr [rcx]
0x294d82d: call qword ptr [rax + 0x148]
0x294d833: nop 
0x294d834: lea rax, [rip + 0x2c26005]
0x294d83b: mov qword ptr [rbp - 0x78], rax
0x294d83f: jmp 0x14294df20
0x294d844: mov word ptr [rsp + 0x60], r12w
0x294d84a: lea r8, [rsp + 0x60]
0x294d84f: mov edx, ebx
0x294d851: mov rcx, qword ptr [rsp + 0x28]
0x294d856: call 0x1417ec980
0x294d85b: test al, al
0x294d85d: jne 0x14294d932
0x294d863: mov eax, dword ptr [rip + 0x43a9657]
0x294d869: mov dword ptr [r15], eax
0x294d86c: lea rdi, [rip + 0x2dd85d5]
0x294d873: mov qword ptr [rsp + 0x20], rdi
0x294d878: cmp byte ptr [rsp + 0x30], 0
0x294d87d: je 0x14294d903
0x294d883: cmp byte ptr [rsp + 0x31], 0
0x294d888: jne 0x14294d89a
0x294d88a: mov rcx, qword ptr [rsp + 0x28]
0x294d88f: mov rax, qword ptr [rcx]
0x294d892: call qword ptr [rax + 8]
0x294d895: movzx esi, al
0x294d898: jmp 0x14294d8de
0x294d89a: mov r14, qword ptr [rsp + 0x28]
0x294d89f: lea rbx, [r14 + 0x18]
0x294d8a3: mov qword ptr [rbp + 0x170], rbx
0x294d8aa: mov rax, qword ptr [rbx]
0x294d8ad: mov rcx, rbx
0x294d8b0: call qword ptr [rax + 8]
0x294d8b3: nop 
0x294d8b4: dec word ptr [r14 + 0x48]
0x294d8b9: cmp byte ptr [r14 + 0x4a], 0
0x294d8be: jne 0x14294d8d2
0x294d8c0: lock xadd dword ptr [r14 + 0x10], esi
0x294d8c6: add si, word ptr [r14 + 0x48]
0x294d8cb: jne 0x14294d8d2
0x294d8cd: mov sil, 1
0x294d8d0: jmp 0x14294d8d5
0x294d8d2: xor sil, sil
0x294d8d5: mov rax, qword ptr [rbx]
0x294d8d8: mov rcx, rbx
0x294d8db: call qword ptr [rax + 0x10]
0x294d8de: test sil, sil
0x294d8e1: je 0x14294d8fe
0x294d8e3: mov rcx, qword ptr [rsp + 0x28]
0x294d8e8: xor eax, eax
0x294d8ea: mov r14d, 1
0x294d8f0: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294d8f6: jne 0x14294d8fe
0x294d8f8: mov rax, qword ptr [rcx]
0x294d8fb: call qword ptr [rax + 0x10]
0x294d8fe: mov byte ptr [rsp + 0x30], 0
0x294d903: lea rax, [rip + 0x2fc5556]
0x294d90a: mov qword ptr [rbp - 0x78], rax
0x294d90e: cmp byte ptr [rbp - 0x68], 0
0x294d912: je 0x14294d922
0x294d914: mov rcx, qword ptr [rbp - 0x50]
0x294d918: mov rax, qword ptr [rcx]
0x294d91b: call qword ptr [rax + 0x148]
0x294d921: nop 
0x294d922: lea rax, [rip + 0x2c25f17]
0x294d929: mov qword ptr [rbp - 0x78], rax
0x294d92d: jmp 0x14294df20
0x294d932: mov r10, qword ptr [rip + 0x441c10f]
0x294d939: cmp dword ptr [r10 + 0x6c], 0
0x294d93e: je 0x14294d98d
0x294d940: mov ecx, dword ptr [r10 + 0x68]
0x294d944: test ecx, ecx
0x294d946: je 0x14294d98d
0x294d948: xor edx, edx
0x294d94a: mov eax, ebx
0x294d94c: div ecx
0x294d94e: mov r9d, edx
0x294d951: shl r9, 8
0x294d955: add r9, qword ptr [r10 + 0x78]
0x294d959: mov edx, esi
0x294d95b: mov r11d, dword ptr [r9]
0x294d95e: test r11d, r11d
0x294d961: je 0x14294d98d
0x294d963: mov eax, edx
0x294d965: cmp dword ptr [r9 + rax*8 + 8], ebx
0x294d96a: jne 0x14294d986
0x294d96c: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0x294d971: mov rax, qword ptr [r10 + 0x80]
0x294d978: mov r8, qword ptr [rax + rcx*8]
0x294d97c: cmp dword ptr [r8 + 4], ebx
0x294d980: je 0x14294da3c
0x294d986: inc edx
0x294d988: cmp edx, r11d
0x294d98b: jb 0x14294d963
0x294d98d: mov eax, r12d
0x294d990: lea rdi, [rip + 0x2dd84b1]
0x294d997: mov qword ptr [rsp + 0x40], rdi
0x294d99c: mov qword ptr [rsp + 0x48], rsi
0x294d9a1: mov word ptr [rsp + 0x50], 0
0x294d9a8: mov qword ptr [rsp + 0x58], rsi
0x294d9ad: lea rcx, [rip + 0x2c260d4]
0x294d9b4: mov qword ptr [rsp + 0x40], rcx
0x294d9b9: lea rcx, [rip + 0x2c260a8]
0x294d9c0: mov qword ptr [rsp + 0x40], rcx
0x294d9c5: cmp word ptr [r13 + 0x30], ax
0x294d9ca: jne 0x14294da73
0x294d9d0: mov edx, 4
0x294d9d5: mov r8d, 0x10
0x294d9db: mov rax, qword ptr [r14]
0x294d9de: mov rcx, r14
0x294d9e1: call qword ptr [rax + 0xc0]
0x294d9e7: test al, al
0x294d9e9: setne bl
0x294d9ec: mov qword ptr [rsp + 0x68], rdi
0x294d9f1: mov qword ptr [rsp + 0x70], r14
0x294d9f6: mov byte ptr [rsp + 0x78], bl
0x294d9fa: mov byte ptr [rsp + 0x79], 0
0x294d9ff: mov qword ptr [rbp - 0x80], rsi
0x294da03: lea rax, [rip + 0x2c2607e]
0x294da0a: mov qword ptr [rsp + 0x68], rax
0x294da0f: lea rax, [rip + 0x2c26052]
0x294da16: mov qword ptr [rsp + 0x68], rax
0x294da1b: mov rax, qword ptr [rsp + 0x40]
0x294da20: mov rdx, qword ptr [rax + 0x10]
0x294da24: lea rcx, [rip - 0x15191bb]
0x294da2b: cmp rdx, rcx
0x294da2e: lea rcx, [rsp + 0x40]
0x294da33: jne 0x14294da4f
0x294da35: call 0x141434880
0x294da3a: jmp 0x14294da51
0x294da3c: add r8, 8
0x294da40: je 0x14294d98d
0x294da46: movzx eax, word ptr [r8]
0x294da4a: jmp 0x14294d990
0x294da4f: call rdx
0x294da51: mov qword ptr [rsp + 0x58], rsi
0x294da56: mov qword ptr [rsp + 0x48], r14
0x294da5b: mov byte ptr [rsp + 0x50], bl
0x294da5f: mov qword ptr [rsp + 0x70], rsi
0x294da64: mov byte ptr [rsp + 0x78], 0
0x294da69: mov qword ptr [rsp + 0x68], rdi
0x294da6e: jmp 0x14294db68
0x294da73: lea rdx, [r14 + 8]
0x294da77: test r14, r14
0x294da7a: cmove rdx, rsi
0x294da7e: mov rdx, qword ptr [rdx]
0x294da81: lea rcx, [rsp + 0x68]
0x294da86: call 0x140393df0
0x294da8b: nop 
0x294da8c: mov qword ptr [rsp + 0x70], r14
0x294da91: mov r12d, 4
0x294da97: mov dword ptr [rbp - 0x48], r12d
0x294da9b: mov rcx, qword ptr [r14 + 0x68]
0x294da9f: mov edx, ebx
0x294daa1: mov rcx, qword ptr [rcx + 0x110]
0x294daa8: call 0x14214e7a0
0x294daad: mov rdx, rax
0x294dab0: lea rcx, [rbp - 0x40]
0x294dab4: call 0x142155d70
0x294dab9: nop 
0x294daba: and r12d, 0xfffffffb
0x294dabe: mov dword ptr [rbp - 0x48], r12d
0x294dac2: mov rcx, qword ptr [rsp + 0x68]
0x294dac7: mov rax, qword ptr [rcx]
0x294daca: mov dl, 1
0x294dacc: call qword ptr [rax + 0x20]
0x294dacf: cmp qword ptr [rbp - 0x18], -1
0x294dad4: je 0x14294ddca
0x294dada: mov eax, 0xffff
0x294dadf: cmp word ptr [rbp - 0x20], ax
0x294dae3: je 0x14294ddca
0x294dae9: mov r8d, dword ptr [rbp + 0x10]
0x294daed: test r8d, r8d
0x294daf0: je 0x14294db5f
0x294daf2: lea rdx, [rsp + 0x68]
0x294daf7: mov rcx, qword ptr [rip + 0x441bba2]
0x294dafe: mov rcx, qword ptr [rcx + 0x48]
0x294db02: call 0x142a82370
0x294db07: mov rbx, rax
0x294db0a: mov rcx, qword ptr [rsp + 0x40]
0x294db0f: mov rax, qword ptr [rcx + 0x10]
0x294db13: lea rcx, [rip - 0x15192aa]
0x294db1a: cmp rax, rcx
0x294db1d: lea rcx, [rsp + 0x40]
0x294db22: jne 0x14294db2b
0x294db24: call 0x141434870
0x294db29: jmp 0x14294db2d
0x294db2b: call rax
0x294db2d: mov rax, qword ptr [rbx + 0x18]
0x294db31: mov qword ptr [rsp + 0x58], rax
0x294db36: mov rax, qword ptr [rbx + 8]
0x294db3a: mov qword ptr [rsp + 0x48], rax
0x294db3f: movzx eax, byte ptr [rbx + 0x10]
0x294db43: mov byte ptr [rsp + 0x50], al
0x294db47: mov qword ptr [rbx + 8], rsi
0x294db4b: mov byte ptr [rbx + 0x10], 0
0x294db4f: mov qword ptr [rsp + 0x68], rdi
0x294db54: lea rcx, [rsp + 0x68]
0x294db59: call 0x141434880
0x294db5e: nop 
0x294db5f: lea rcx, [rbp - 0x40]
0x294db63: call 0x1421562b0
0x294db68: lea rdx, [r14 + 8]
0x294db6c: test r14, r14
0x294db6f: cmove rdx, rsi
0x294db73: mov r8b, 1
0x294db76: mov rdx, qword ptr [rdx]
0x294db79: lea rcx, [rsp + 0x68]
0x294db7e: call 0x140393650
0x294db83: nop 
0x294db84: mov byte ptr [r14 + 0xc3], 0
0x294db8c: mov rax, qword ptr [rsp + 0x28]
0x294db91: mov rcx, qword ptr [rax + 0x68]
0x294db95: mov rax, qword ptr [rcx + 0x20]
0x294db99: or byte ptr [rax + 0x398], 4
0x294dba0: cmp byte ptr [rsp + 0x50], 0
0x294dba5: je 0x14294dbbb
0x294dba7: mov rax, qword ptr [rsp + 0x48]
0x294dbac: mov rcx, qword ptr [rax + 0x68]
0x294dbb0: mov rax, qword ptr [rcx + 0x20]
0x294dbb4: or byte ptr [rax + 0x398], 4
0x294dbbb: mov rbx, qword ptr [rsp + 0x68]
0x294dbc0: mov rax, qword ptr [rbx]
0x294dbc3: xor edx, edx
0x294dbc5: mov rcx, rbx
0x294dbc8: call qword ptr [rax + 0x20]
0x294dbcb: cmp byte ptr [rsp + 0x70], 1
0x294dbd0: jne 0x14294dc00
0x294dbd2: mov eax, 0xffffffff
0x294dbd7: lock xadd dword ptr [rbx + 8], eax
0x294dbdc: cmp eax, 1
0x294dbdf: jne 0x14294dbf3
0x294dbe1: test dword ptr [rbx + 0xc], 0x40000000
0x294dbe8: je 0x14294dc00
0x294dbea: mov rax, qword ptr [rbx]
0x294dbed: mov rcx, rbx
0x294dbf0: call qword ptr [rax + 0x40]
0x294dbf3: test dword ptr [rbx + 0xc], 0x40000000
0x294dbfa: je 0x14294dc00
0x294dbfc: lock dec dword ptr [rbx + 0xc]
0x294dc00: mov rax, qword ptr [rsp + 0x28]
0x294dc05: mov rcx, qword ptr [rax + 0x68]
0x294dc09: mov rcx, qword ptr [rcx + 0x1c0]
0x294dc10: mov rax, qword ptr [rcx]
0x294dc13: call qword ptr [rax + 0x170]
0x294dc19: cmp byte ptr [rsp + 0x50], 0
0x294dc1e: je 0x14294dc39
0x294dc20: mov rax, qword ptr [rsp + 0x48]
0x294dc25: mov rcx, qword ptr [rax + 0x68]
0x294dc29: mov rcx, qword ptr [rcx + 0x1c0]
0x294dc30: mov rax, qword ptr [rcx]
0x294dc33: call qword ptr [rax + 0x170]
0x294dc39: lea rbx, [rip + 0x31d77b8]
0x294dc40: mov qword ptr [rsp + 0x68], rbx
0x294dc45: mov byte ptr [rsp + 0x70], 0
0x294dc4a: lea rax, [rip + 0x31d77e7]
0x294dc51: mov qword ptr [rsp + 0x68], rax
0x294dc56: mov qword ptr [rsp + 0x78], rsi
0x294dc5b: mov rax, qword ptr [r14]
0x294dc5e: mov rcx, r14
0x294dc61: call qword ptr [rax + 0xe8]
0x294dc67: mov qword ptr [rsp + 0x78], rax
0x294dc6c: lea rdx, [rsp + 0x68]
0x294dc71: mov rcx, r14
0x294dc74: call 0x14298ac90
0x294dc79: nop 
0x294dc7a: mov qword ptr [rsp + 0x68], rbx
0x294dc7f: mov dword ptr [r15], esi
0x294dc82: mov qword ptr [rsp + 0x40], rdi
0x294dc87: mov r14d, 1
0x294dc8d: cmp byte ptr [rsp + 0x50], 0
0x294dc92: je 0x14294dd15
0x294dc98: cmp byte ptr [rsp + 0x51], 0
0x294dc9d: jne 0x14294dcb0
0x294dc9f: mov rcx, qword ptr [rsp + 0x48]
0x294dca4: mov rax, qword ptr [rcx]
0x294dca7: call qword ptr [rax + 8]
0x294dcaa: movzx r12d, al
0x294dcae: jmp 0x14294dcf6
0x294dcb0: mov r13, qword ptr [rsp + 0x48]
0x294dcb5: lea rbx, [r13 + 0x18]
0x294dcb9: mov qword ptr [rbp + 0x170], rbx
0x294dcc0: mov rax, qword ptr [rbx]
0x294dcc3: mov rcx, rbx
0x294dcc6: call qword ptr [rax + 8]
0x294dcc9: nop 
0x294dcca: dec word ptr [r13 + 0x48]
0x294dccf: cmp byte ptr [r13 + 0x4a], 0
0x294dcd4: jne 0x14294dcea
0x294dcd6: mov eax, esi
0x294dcd8: lock xadd dword ptr [r13 + 0x10], eax
0x294dcde: add ax, word ptr [r13 + 0x48]
0x294dce3: jne 0x14294dcea
0x294dce5: mov r12b, 1
0x294dce8: jmp 0x14294dced
0x294dcea: xor r12b, r12b
0x294dced: mov rax, qword ptr [rbx]
0x294dcf0: mov rcx, rbx
0x294dcf3: call qword ptr [rax + 0x10]
0x294dcf6: test r12b, r12b
0x294dcf9: je 0x14294dd10
0x294dcfb: mov rcx, qword ptr [rsp + 0x48]
0x294dd00: xor eax, eax
0x294dd02: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294dd08: jne 0x14294dd10
0x294dd0a: mov rax, qword ptr [rcx]
0x294dd0d: call qword ptr [rax + 0x10]
0x294dd10: mov byte ptr [rsp + 0x50], 0
0x294dd15: mov qword ptr [rsp + 0x20], rdi
0x294dd1a: cmp byte ptr [rsp + 0x30], 0
0x294dd1f: je 0x14294dd9b
0x294dd21: cmp byte ptr [rsp + 0x31], 0
0x294dd26: jne 0x14294dd38
0x294dd28: mov rcx, qword ptr [rsp + 0x28]
0x294dd2d: mov rax, qword ptr [rcx]
0x294dd30: call qword ptr [rax + 8]
0x294dd33: movzx esi, al
0x294dd36: jmp 0x14294dd7c
0x294dd38: mov r13, qword ptr [rsp + 0x28]
0x294dd3d: lea rbx, [r13 + 0x18]
0x294dd41: mov qword ptr [rbp + 0x170], rbx
0x294dd48: mov rax, qword ptr [rbx]
0x294dd4b: mov rcx, rbx
0x294dd4e: call qword ptr [rax + 8]
0x294dd51: nop 
0x294dd52: dec word ptr [r13 + 0x48]
0x294dd57: cmp byte ptr [r13 + 0x4a], 0
0x294dd5c: jne 0x14294dd70
0x294dd5e: lock xadd dword ptr [r13 + 0x10], esi
0x294dd64: add si, word ptr [r13 + 0x48]
0x294dd69: jne 0x14294dd70
0x294dd6b: mov sil, 1
0x294dd6e: jmp 0x14294dd73
0x294dd70: xor sil, sil
0x294dd73: mov rax, qword ptr [rbx]
0x294dd76: mov rcx, rbx
0x294dd79: call qword ptr [rax + 0x10]
0x294dd7c: test sil, sil
0x294dd7f: je 0x14294dd96
0x294dd81: mov rcx, qword ptr [rsp + 0x28]
0x294dd86: xor eax, eax
0x294dd88: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294dd8e: jne 0x14294dd96
0x294dd90: mov rax, qword ptr [rcx]
0x294dd93: call qword ptr [rax + 0x10]
0x294dd96: mov byte ptr [rsp + 0x30], 0
0x294dd9b: lea rax, [rip + 0x2fc50be]
0x294dda2: mov qword ptr [rbp - 0x78], rax
0x294dda6: cmp byte ptr [rbp - 0x68], 0
0x294ddaa: je 0x14294ddba
0x294ddac: mov rcx, qword ptr [rbp - 0x50]
0x294ddb0: mov rax, qword ptr [rcx]
0x294ddb3: call qword ptr [rax + 0x148]
0x294ddb9: nop 
0x294ddba: lea rax, [rip + 0x2c25a7f]
0x294ddc1: mov qword ptr [rbp - 0x78], rax
0x294ddc5: jmp 0x14294df20
0x294ddca: mov eax, dword ptr [rip + 0x438dc10]
0x294ddd0: mov dword ptr [r15], eax
0x294ddd3: lea rcx, [rbp - 0x40]
0x294ddd7: call 0x1421562b0
0x294dddc: nop 
0x294dddd: mov qword ptr [rsp + 0x40], rdi
0x294dde2: mov r14d, 1
0x294dde8: cmp byte ptr [rsp + 0x50], 0
0x294dded: je 0x14294de70
0x294ddf3: cmp byte ptr [rsp + 0x51], 0
0x294ddf8: jne 0x14294de0b
0x294ddfa: mov rcx, qword ptr [rsp + 0x48]
0x294ddff: mov rax, qword ptr [rcx]
0x294de02: call qword ptr [rax + 8]
0x294de05: movzx r12d, al
0x294de09: jmp 0x14294de51
0x294de0b: mov r13, qword ptr [rsp + 0x48]
0x294de10: lea rbx, [r13 + 0x18]
0x294de14: mov qword ptr [rbp + 0x170], rbx
0x294de1b: mov rax, qword ptr [rbx]
0x294de1e: mov rcx, rbx
0x294de21: call qword ptr [rax + 8]
0x294de24: nop 
0x294de25: dec word ptr [r13 + 0x48]
0x294de2a: cmp byte ptr [r13 + 0x4a], 0
0x294de2f: jne 0x14294de45
0x294de31: mov eax, esi
0x294de33: lock xadd dword ptr [r13 + 0x10], eax
0x294de39: add ax, word ptr [r13 + 0x48]
0x294de3e: jne 0x14294de45
0x294de40: mov r12b, 1
0x294de43: jmp 0x14294de48
0x294de45: xor r12b, r12b
0x294de48: mov rax, qword ptr [rbx]
0x294de4b: mov rcx, rbx
0x294de4e: call qword ptr [rax + 0x10]
0x294de51: test r12b, r12b
0x294de54: je 0x14294de6b
0x294de56: mov rcx, qword ptr [rsp + 0x48]
0x294de5b: xor eax, eax
0x294de5d: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294de63: jne 0x14294de6b
0x294de65: mov rax, qword ptr [rcx]
0x294de68: call qword ptr [rax + 0x10]
0x294de6b: mov byte ptr [rsp + 0x50], 0
0x294de70: mov qword ptr [rsp + 0x20], rdi
0x294de75: cmp byte ptr [rsp + 0x30], 0
0x294de7a: je 0x14294def6
0x294de7c: cmp byte ptr [rsp + 0x31], 0
0x294de81: jne 0x14294de93
0x294de83: mov rcx, qword ptr [rsp + 0x28]
0x294de88: mov rax, qword ptr [rcx]
0x294de8b: call qword ptr [rax + 8]
0x294de8e: movzx esi, al
0x294de91: jmp 0x14294ded7
0x294de93: mov r13, qword ptr [rsp + 0x28]
0x294de98: lea rbx, [r13 + 0x18]
0x294de9c: mov qword ptr [rbp + 0x170], rbx
0x294dea3: mov rax, qword ptr [rbx]
0x294dea6: mov rcx, rbx
0x294dea9: call qword ptr [rax + 8]
0x294deac: nop 
0x294dead: dec word ptr [r13 + 0x48]
0x294deb2: cmp byte ptr [r13 + 0x4a], 0
0x294deb7: jne 0x14294decb
0x294deb9: lock xadd dword ptr [r13 + 0x10], esi
0x294debf: add si, word ptr [r13 + 0x48]
0x294dec4: jne 0x14294decb
0x294dec6: mov sil, 1
0x294dec9: jmp 0x14294dece
0x294decb: xor sil, sil
0x294dece: mov rax, qword ptr [rbx]
0x294ded1: mov rcx, rbx
0x294ded4: call qword ptr [rax + 0x10]
0x294ded7: test sil, sil
0x294deda: je 0x14294def1
0x294dedc: mov rcx, qword ptr [rsp + 0x28]
0x294dee1: xor eax, eax
0x294dee3: lock cmpxchg byte ptr [rcx + 0x4b], r14b
0x294dee9: jne 0x14294def1
0x294deeb: mov rax, qword ptr [rcx]
0x294deee: call qword ptr [rax + 0x10]
0x294def1: mov byte ptr [rsp + 0x30], 0
0x294def6: lea rax, [rip + 0x2fc4f63]
0x294defd: mov qword ptr [rbp - 0x78], rax
0x294df01: cmp byte ptr [rbp - 0x68], 0
0x294df05: je 0x14294df15
0x294df07: mov rcx, qword ptr [rbp - 0x50]
0x294df0b: mov rax, qword ptr [rcx]
0x294df0e: call qword ptr [rax + 0x148]
0x294df14: nop 
0x294df15: lea rax, [rip + 0x2c25924]
0x294df1c: mov qword ptr [rbp - 0x78], rax
0x294df20: mov qword ptr [rbp - 0x78], rdi
0x294df24: lea rcx, [rbp - 0x78]
0x294df28: call 0x141434880
0x294df2d: mov rax, r15
0x294df30: lea r11, [rsp + 0x240]
0x294df38: mov rbx, qword ptr [r11 + 0x38]
0x294df3c: mov rsi, qword ptr [r11 + 0x40]
0x294df40: mov rdi, qword ptr [r11 + 0x48]
0x294df44: mov rsp, r11
0x294df47: pop r15
0x294df49: pop r14
0x294df4b: pop r13
0x294df4d: pop r12
0x294df4f: pop rbp
0x294df50: ret 