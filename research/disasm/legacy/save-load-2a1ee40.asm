0x2a1ee40: mov qword ptr [rsp + 8], rbx
0x2a1ee45: push rbp
0x2a1ee46: push rsi
0x2a1ee47: push rdi
0x2a1ee48: push r12
0x2a1ee4a: push r13
0x2a1ee4c: push r14
0x2a1ee4e: push r15
0x2a1ee50: lea rbp, [rsp - 0x27]
0x2a1ee55: sub rsp, 0xc0
0x2a1ee5c: mov r12, r8
0x2a1ee5f: mov rbx, rdx
0x2a1ee62: mov rsi, rcx
0x2a1ee65: mov rax, qword ptr gs:[0x58]
0x2a1ee6e: mov rax, qword ptr [rax]
0x2a1ee71: mov qword ptr [rbp + 0xf], rax
0x2a1ee75: mov ecx, 0x250
0x2a1ee7a: mov rax, qword ptr [rcx + rax]
0x2a1ee7e: xor edi, edi
0x2a1ee80: mov dword ptr [rax + 0x2b8], edi
0x2a1ee86: lea r15, [rax + 0x2b0]
0x2a1ee8d: mov rax, qword ptr [rdx]
0x2a1ee90: mov rdx, r15
0x2a1ee93: mov rcx, rbx
0x2a1ee96: call qword ptr [rax + 8]
0x2a1ee99: mov r13d, dword ptr [r15 + 8]
0x2a1ee9d: test r13d, r13d
0x2a1eea0: je 0x142a1f25c
0x2a1eea6: mov rcx, rbx
0x2a1eea9: call 0x142961ca0
0x2a1eeae: mov rbx, rax
0x2a1eeb1: test rax, rax
0x2a1eeb4: je 0x142a1ef67
0x2a1eeba: mov qword ptr [rbp - 0x39], rdi
0x2a1eebe: lea rdx, [rbp - 0x39]
0x2a1eec2: mov rcx, rax
0x2a1eec5: call 0x142961de0
0x2a1eeca: mov r15, rax
0x2a1eecd: mov r14, qword ptr [rbp - 0x39]
0x2a1eed1: test r14, r14
0x2a1eed4: jne 0x142a1ef1f
0x2a1eed6: lea rax, [rip + 0x3102753]
0x2a1eedd: mov qword ptr [rsp + 0x58], rax
0x2a1eee2: mov dword ptr [rsp + 0x50], 6
0x2a1eeea: mov eax, dword ptr [rip + 0x42ba558]
0x2a1eef0: mov dword ptr [rsp + 0x48], eax
0x2a1eef4: lea r9, [rip + 0x2b545b1]
0x2a1eefb: mov qword ptr [rsp + 0x40], r9
0x2a1ef00: mov dword ptr [rsp + 0x38], edi
0x2a1ef04: mov qword ptr [rsp + 0x30], r9
0x2a1ef09: mov qword ptr [rsp + 0x28], r9
0x2a1ef0e: mov qword ptr [rsp + 0x20], r9
0x2a1ef13: mov cl, 1
0x2a1ef15: call 0x14035d8d0
0x2a1ef1a: jmp 0x142a1f25c
0x2a1ef1f: test rsi, rsi
0x2a1ef22: je 0x142a1ef27
0x2a1ef24: mov edi, dword ptr [rsi + 0x60]
0x2a1ef27: mov dword ptr [rbp + 0x6f], edi
0x2a1ef2a: mov rax, qword ptr [rax]
0x2a1ef2d: mov r8d, 4
0x2a1ef33: lea rdx, [rbp + 0x6f]
0x2a1ef37: mov rcx, r15
0x2a1ef3a: call qword ptr [rax + 8]
0x2a1ef3d: mov rax, qword ptr [r15]
0x2a1ef40: mov r8d, 4
0x2a1ef46: mov rdx, r12
0x2a1ef49: mov rcx, r15
0x2a1ef4c: call qword ptr [rax + 8]
0x2a1ef4f: mov word ptr [r14], 0xa56
0x2a1ef55: mov byte ptr [r14 + 2], 0xff
0x2a1ef5a: mov rcx, rbx
0x2a1ef5d: call 0x142961e90
0x2a1ef62: jmp 0x142a1f25c
0x2a1ef67: call 0x142962220
0x2a1ef6c: mov qword ptr [rbp - 0x31], rdi
0x2a1ef70: mov dword ptr [rbp - 0x29], edi
0x2a1ef73: mov word ptr [rbp - 0x25], di
0x2a1ef77: mov qword ptr [rbp - 0x21], rdi
0x2a1ef7b: mov edx, 0xd
0x2a1ef80: mov r9, qword ptr [rip + 0x434a6f9]
0x2a1ef87: mov r9, qword ptr [r9 + 0x30]
0x2a1ef8b: lea rcx, [rbp - 0x31]
0x2a1ef8f: call 0x142771b30
0x2a1ef94: mov r14, rax
0x2a1ef97: mov rbx, qword ptr [rbp - 0x31]
0x2a1ef9b: test rax, rax
0x2a1ef9e: jne 0x142a1efec
0x2a1efa0: lea rax, [rip + 0x3102689]
0x2a1efa7: mov qword ptr [rsp + 0x58], rax
0x2a1efac: mov dword ptr [rsp + 0x50], 6
0x2a1efb4: mov eax, dword ptr [rip + 0x42ba48e]
0x2a1efba: mov dword ptr [rsp + 0x48], eax
0x2a1efbe: lea r9, [rip + 0x2b544e7]
0x2a1efc5: mov qword ptr [rsp + 0x40], r9
0x2a1efca: mov dword ptr [rsp + 0x38], edi
0x2a1efce: mov qword ptr [rsp + 0x30], r9
0x2a1efd3: mov qword ptr [rsp + 0x28], r9
0x2a1efd8: mov qword ptr [rsp + 0x20], r9
0x2a1efdd: mov cl, 1
0x2a1efdf: call 0x14035d8d0
0x2a1efe4: mov ecx, dword ptr [rbp - 0x29]
0x2a1efe7: jmp 0x142a1f1c7
0x2a1efec: lea rax, [rip + 0x2d02c45]
0x2a1eff3: mov qword ptr [rbp - 0x19], rax
0x2a1eff7: mov byte ptr [rbp - 0x11], 1
0x2a1effb: lea rax, [rip + 0x2d02c96]
0x2a1f002: mov qword ptr [rbp - 0x19], rax
0x2a1f006: lea rax, [r14 + 5]
0x2a1f00a: mov qword ptr [rbp - 9], rax
0x2a1f00e: mov qword ptr [rbp - 1], 0x7fc1
0x2a1f016: mov byte ptr [rbp + 7], 0
0x2a1f01a: test rsi, rsi
0x2a1f01d: je 0x142a1f024
0x2a1f01f: mov eax, dword ptr [rsi + 0x60]
0x2a1f022: jmp 0x142a1f026
0x2a1f024: mov eax, edi
0x2a1f026: mov dword ptr [rbp + 0x7f], eax
0x2a1f029: mov rax, qword ptr [rbp - 0x19]
0x2a1f02d: mov r9, qword ptr [rax + 8]
0x2a1f031: lea rax, [rip - 0x15ffc88]
0x2a1f038: mov r8d, 4
0x2a1f03e: lea rdx, [rbp + 0x7f]
0x2a1f042: lea rcx, [rbp - 0x19]
0x2a1f046: cmp r9, rax
0x2a1f049: jne 0x142a1f052
0x2a1f04b: call 0x14141f3b0
0x2a1f050: jmp 0x142a1f055
0x2a1f052: call r9
0x2a1f055: mov rax, qword ptr [rbp - 0x19]
0x2a1f059: mov r9, qword ptr [rax + 8]
0x2a1f05d: lea rax, [rip - 0x26c5514]
0x2a1f064: cmp r9, rax
0x2a1f067: je 0x142a1f079
0x2a1f069: mov r8d, 4
0x2a1f06f: mov rdx, r12
0x2a1f072: lea rcx, [rbp - 0x19]
0x2a1f076: call r9
0x2a1f079: movzx eax, word ptr [rbp + 3]
0x2a1f07d: mov word ptr [r14 + 3], ax
0x2a1f082: movzx esi, word ptr [rbp + 3]
0x2a1f086: mov r12d, 0xa56
0x2a1f08c: mov word ptr [r14], r12w
0x2a1f090: mov byte ptr [r14 + 2], 0xff
0x2a1f095: add si, 5
0x2a1f099: cmp r13d, 1
0x2a1f09d: jne 0x142a1f183
0x2a1f0a3: mov rax, qword ptr [r15]
0x2a1f0a6: mov r14, qword ptr [rax]
0x2a1f0a9: test r14, r14
0x2a1f0ac: je 0x142a1f1aa
0x2a1f0b2: mov rax, qword ptr [r14]
0x2a1f0b5: mov rcx, r14
0x2a1f0b8: call qword ptr [rax + 0x70]
0x2a1f0bb: movzx r13d, al
0x2a1f0bf: mov r15, qword ptr [r14 + 0x98]
0x2a1f0c6: test r15, r15
0x2a1f0c9: je 0x142a1f0f0
0x2a1f0cb: mov rdx, qword ptr [r15]
0x2a1f0ce: mov rcx, r15
0x2a1f0d1: call qword ptr [rdx + 0x10]
0x2a1f0d4: cmp al, 1
0x2a1f0d6: jne 0x142a1f0eb
0x2a1f0d8: movzx r8d, si
0x2a1f0dc: lea rdx, [rbx + 0x33]
0x2a1f0e0: mov rax, qword ptr [r15]
0x2a1f0e3: mov rcx, r15
0x2a1f0e6: call qword ptr [rax + 0x28]
0x2a1f0e9: jmp 0x142a1f0f0
0x2a1f0eb: test r13b, r13b
0x2a1f0ee: je 0x142a1f15b
0x2a1f0f0: cmp si, 1
0x2a1f0f4: jb 0x142a1f15b
0x2a1f0f6: movzx ecx, word ptr [rbx + 0x803c]
0x2a1f0fd: sub rcx, 3
0x2a1f101: movzx eax, si
0x2a1f104: cmp rcx, rax
0x2a1f107: jb 0x142a1f15b
0x2a1f109: add si, 0x1f
0x2a1f10d: mov word ptr [rbx + 0x8038], si
0x2a1f114: mov word ptr [rbx + 0x803a], si
0x2a1f11b: mov rax, qword ptr [rbx + 0x8030]
0x2a1f122: mov word ptr [rax], si
0x2a1f125: mov rax, qword ptr [rbx + 0x8030]
0x2a1f12c: mov byte ptr [rax + 2], 2
0x2a1f130: movzx eax, word ptr [rbx + 0x8038]
0x2a1f137: mov dword ptr [rbx + 0x8040], eax
0x2a1f13d: lea rdx, [rbx + 0x30]
0x2a1f141: movzx r8d, word ptr [rdx + 0x800a]
0x2a1f149: sub r8, rax
0x2a1f14c: add r8, rdx
0x2a1f14f: mov qword ptr [rbx + 0x8048], r8
0x2a1f156: mov word ptr [rbp - 0x25], r12w
0x2a1f15b: mov byte ptr [rbp + 0x6f], 0
0x2a1f15f: mov rax, qword ptr [r14]
0x2a1f162: lea r9, [rbp + 0x6f]
0x2a1f166: mov r8, rbx
0x2a1f169: lea rdx, [rbp - 0x39]
0x2a1f16d: mov rcx, r14
0x2a1f170: call qword ptr [rax + 0x48]
0x2a1f173: cmp dword ptr [rbp - 0x39], 0
0x2a1f177: jne 0x142a1f1aa
0x2a1f179: mov ecx, dword ptr [rbp - 0x29]
0x2a1f17c: dec ecx
0x2a1f17e: mov dword ptr [rbp - 0x29], ecx
0x2a1f181: jmp 0x142a1f1ad
0x2a1f183: cmp dword ptr [r15 + 8], 0
0x2a1f188: je 0x142a1f1aa
0x2a1f18a: mov edx, r12d
0x2a1f18d: mov qword ptr [rsp + 0x30], r15
0x2a1f192: mov byte ptr [rsp + 0x20], 2
0x2a1f197: movzx r9d, si
0x2a1f19b: mov r8, r14
0x2a1f19e: mov rcx, qword ptr [rip + 0x434a4db]
0x2a1f1a5: call 0x142773870
0x2a1f1aa: mov ecx, dword ptr [rbp - 0x29]
0x2a1f1ad: lea rax, [rip + 0x2d02ae4]
0x2a1f1b4: mov qword ptr [rbp - 0x19], rax
0x2a1f1b8: mov qword ptr [rbp - 9], rdi
0x2a1f1bc: lea rax, [rip + 0x2d02a75]
0x2a1f1c3: mov qword ptr [rbp - 0x19], rax
0x2a1f1c7: test rbx, rbx
0x2a1f1ca: je 0x142a1f25c
0x2a1f1d0: test ecx, ecx
0x2a1f1d2: jle 0x142a1f24d
0x2a1f1d4: mov eax, ecx
0x2a1f1d6: neg eax
0x2a1f1d8: lock xadd dword ptr [rbx + 0x8050], eax
0x2a1f1e0: cmp eax, ecx
0x2a1f1e2: jne 0x142a1f24d
0x2a1f1e4: mov dword ptr [rbx + 0x8038], edi
0x2a1f1ea: mov dword ptr [rbx + 0x8040], edi
0x2a1f1f0: lea rax, [rbx + 0x30]
0x2a1f1f4: mov qword ptr [rbx + 0x8048], rax
0x2a1f1fb: mov dword ptr [rbx + 0x8050], edi
0x2a1f201: mov qword ptr [rbp + 0x6f], rbx
0x2a1f205: mov qword ptr [rbp - 0x39], rbx
0x2a1f209: lea rcx, [rip + 0x2d070a8]
0x2a1f210: mov qword ptr [rbx], rcx
0x2a1f213: mov qword ptr [rbx + 0x8030], rdi
0x2a1f21a: mov qword ptr [rbp + 0x17], rax
0x2a1f21e: mov qword ptr [rax + 0x8000], rdi
0x2a1f225: lea rax, [rip + 0x2d0709c]
0x2a1f22c: mov qword ptr [rbx], rax
0x2a1f22f: mov ecx, 0x1fd
0x2a1f234: mov rax, qword ptr [rbp + 0xf]
0x2a1f238: cmp byte ptr [rcx + rax], 0
0x2a1f23c: mov rcx, rbx
0x2a1f23f: je 0x142a1f248
0x2a1f241: call 0x1447f03bc
0x2a1f246: jmp 0x142a1f24d
0x2a1f248: call 0x1447f02bc
0x2a1f24d: mov qword ptr [rbp - 0x31], rdi
0x2a1f251: mov dword ptr [rbp - 0x29], edi
0x2a1f254: mov word ptr [rbp - 0x25], di
0x2a1f258: mov qword ptr [rbp - 0x21], rdi
0x2a1f25c: mov rbx, qword ptr [rsp + 0x100]
0x2a1f264: add rsp, 0xc0
0x2a1f26b: pop r15
0x2a1f26d: pop r14
0x2a1f26f: pop r13
0x2a1f271: pop r12
0x2a1f273: pop rdi
0x2a1f274: pop rsi
0x2a1f275: pop rbp
0x2a1f276: ret 