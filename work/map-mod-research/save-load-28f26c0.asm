0x28f26c0: mov qword ptr [rsp + 0x10], rdx
0x28f26c5: mov qword ptr [rsp + 8], rcx
0x28f26ca: push rbp
0x28f26cb: push rbx
0x28f26cc: push rsi
0x28f26cd: push rdi
0x28f26ce: push r12
0x28f26d0: push r13
0x28f26d2: push r14
0x28f26d4: push r15
0x28f26d6: lea rbp, [rsp - 8]
0x28f26db: sub rsp, 0x108
0x28f26e2: mov rbx, rdx
0x28f26e5: mov r14, rcx
0x28f26e8: xor r15d, r15d
0x28f26eb: lea rdx, [rsp + 0x70]
0x28f26f0: call 0x1428fb8b0
0x28f26f5: nop 
0x28f26f6: mov rax, qword ptr [r14 + 0x88]
0x28f26fd: cmp byte ptr [rax + 1], 1
0x28f2701: jne 0x1428f273f
0x28f2703: cmp byte ptr [r14 + 0x96], r15b
0x28f270a: je 0x1428f273f
0x28f270c: mov dword ptr [rbp + 0x60], 0xc
0x28f2713: xor r9d, r9d
0x28f2716: lea rax, [rbp + 0x68]
0x28f271a: mov qword ptr [rsp + 0x28], rax
0x28f271f: lea rax, [rbp + 0x60]
0x28f2723: mov qword ptr [rsp + 0x20], rax
0x28f2728: mov r8, r14
0x28f272b: lea rdx, [rbp - 0x58]
0x28f272f: mov rcx, qword ptr [rip + 0x4476f72]
0x28f2736: mov rcx, qword ptr [rcx + 0x10]
0x28f273a: call 0x141871930
0x28f273f: lea rdx, [rbp + 0x60]
0x28f2743: mov rcx, r14
0x28f2746: call 0x1417e9600
0x28f274b: mov eax, dword ptr [rax]
0x28f274d: test eax, eax
0x28f274f: je 0x1428f278b
0x28f2751: mov dword ptr [rbx], eax
0x28f2753: lea rax, [rip + 0x3020706]
0x28f275a: mov qword ptr [rsp + 0x70], rax
0x28f275f: cmp byte ptr [rbp - 0x80], 0
0x28f2763: je 0x1428f2773
0x28f2765: mov rcx, qword ptr [rbp - 0x68]
0x28f2769: mov rax, qword ptr [rcx]
0x28f276c: call qword ptr [rax + 0x148]
0x28f2772: nop 
0x28f2773: lea rax, [rip + 0x2c810c6]
0x28f277a: mov qword ptr [rsp + 0x70], rax
0x28f277f: lea rsi, [rip + 0x2e336c2]
0x28f2786: jmp 0x1428f2bb1
0x28f278b: mov rax, qword ptr [r14]
0x28f278e: mov rcx, r14
0x28f2791: call qword ptr [rax + 0x120]
0x28f2797: mov rax, qword ptr [r14]
0x28f279a: mov rcx, r14
0x28f279d: call qword ptr [rax + 0x118]
0x28f27a3: mov r12, qword ptr [r14 + 0xa0]
0x28f27aa: test r12, r12
0x28f27ad: je 0x1428f27cf
0x28f27af: mov edx, 4
0x28f27b4: mov r8d, 0x10
0x28f27ba: mov rax, qword ptr [r12]
0x28f27be: mov rcx, r12
0x28f27c1: call qword ptr [rax + 0xc0]
0x28f27c7: test al, al
0x28f27c9: je 0x1428f27cf
0x28f27cb: mov al, 1
0x28f27cd: jmp 0x1428f27d1
0x28f27cf: xor al, al
0x28f27d1: lea rsi, [rip + 0x2e33670]
0x28f27d8: mov qword ptr [rsp + 0x50], rsi
0x28f27dd: mov qword ptr [rsp + 0x58], r12
0x28f27e2: mov byte ptr [rsp + 0x60], al
0x28f27e6: mov byte ptr [rsp + 0x61], 0
0x28f27eb: mov qword ptr [rsp + 0x68], r15
0x28f27f0: lea rcx, [rip + 0x2c81291]
0x28f27f7: mov qword ptr [rsp + 0x50], rcx
0x28f27fc: lea rcx, [rip + 0x2c96525]
0x28f2803: mov qword ptr [rsp + 0x50], rcx
0x28f2808: lea r13, [rip + 0x2c81031]
0x28f280f: test al, al
0x28f2811: je 0x1428f291f
0x28f2817: test r12, r12
0x28f281a: je 0x1428f291f
0x28f2820: cmp qword ptr [r12 + 0xd0], r14
0x28f2828: jne 0x1428f291f
0x28f282e: mov rax, qword ptr [r12 + 0x68]
0x28f2833: mov rcx, qword ptr [rax + 0x18]
0x28f2837: test rcx, rcx
0x28f283a: je 0x1428f291f
0x28f2840: mov r13d, dword ptr [rcx + 0x20]
0x28f2844: mov edi, r15d
0x28f2847: test r13d, r13d
0x28f284a: je 0x1428f2918
0x28f2850: mov rax, qword ptr [r12]
0x28f2854: mov edx, edi
0x28f2856: mov rcx, r12
0x28f2859: call qword ptr [rax + 0xf8]
0x28f285f: mov rbx, rax
0x28f2862: test rax, rax
0x28f2865: je 0x1428f290a
0x28f286b: cmp rax, r14
0x28f286e: je 0x1428f290a
0x28f2874: mov rcx, rax
0x28f2877: call 0x1414343a0
0x28f287c: movzx r15d, al
0x28f2880: mov qword ptr [rsp + 0x30], rsi
0x28f2885: mov qword ptr [rsp + 0x38], rbx
0x28f288a: mov byte ptr [rsp + 0x40], al
0x28f288e: mov byte ptr [rsp + 0x41], 0
0x28f2893: xor eax, eax
0x28f2895: mov qword ptr [rsp + 0x48], rax
0x28f289a: lea rax, [rip + 0x2c80f9f]
0x28f28a1: mov qword ptr [rsp + 0x30], rax
0x28f28a6: mov byte ptr [rsp + 0x41], 0
0x28f28ab: test r15b, r15b
0x28f28ae: je 0x1428f28d2
0x28f28b0: mov r9d, dword ptr [r14 + 0x98]
0x28f28b7: movzx r8d, byte ptr [r14 + 0x9c]
0x28f28bf: lea rdx, [rbp + 0x68]
0x28f28c3: mov rcx, rbx
0x28f28c6: call 0x142068340
0x28f28cb: lea rax, [rip + 0x2c80f6e]
0x28f28d2: mov qword ptr [rsp + 0x30], rax
0x28f28d7: mov qword ptr [rsp + 0x30], rsi
0x28f28dc: test r15b, r15b
0x28f28df: je 0x1428f290a
0x28f28e1: mov rax, qword ptr [rbx]
0x28f28e4: mov rcx, rbx
0x28f28e7: call qword ptr [rax + 8]
0x28f28ea: test al, al
0x28f28ec: je 0x1428f2905
0x28f28ee: xor eax, eax
0x28f28f0: mov ecx, 1
0x28f28f5: lock cmpxchg byte ptr [rbx + 0x4b], cl
0x28f28fa: jne 0x1428f2905
0x28f28fc: mov rax, qword ptr [rbx]
0x28f28ff: mov rcx, rbx
0x28f2902: call qword ptr [rax + 0x10]
0x28f2905: mov byte ptr [rsp + 0x40], 0
0x28f290a: inc edi
0x28f290c: cmp edi, r13d
0x28f290f: jb 0x1428f2850
0x28f2915: xor r15d, r15d
0x28f2918: lea r13, [rip + 0x2c80f21]
0x28f291f: lea rax, [rbp - 0x40]
0x28f2923: mov qword ptr [rbp - 0x50], rax
0x28f2927: mov dword ptr [rbp - 0x48], r15d
0x28f292b: mov dword ptr [rbp - 0x44], 8
0x28f2932: lea rdx, [r14 + 8]
0x28f2936: test r14, r14
0x28f2939: cmove rdx, r15
0x28f293d: mov rdx, qword ptr [rdx]
0x28f2940: lea rcx, [rbp + 0x60]
0x28f2944: call 0x140393df0
0x28f2949: nop 
0x28f294a: mov r8d, dword ptr [r14 + 0xb8]
0x28f2951: mov rdx, qword ptr [r14 + 0xb0]
0x28f2958: lea rcx, [rbp - 0x50]
0x28f295c: call 0x14043a660
0x28f2961: nop 
0x28f2962: mov rcx, qword ptr [rbp + 0x60]
0x28f2966: mov rax, qword ptr [rcx]
0x28f2969: mov dl, 1
0x28f296b: call qword ptr [rax + 0x20]
0x28f296e: mov r12, qword ptr [rbp - 0x50]
0x28f2972: mov eax, dword ptr [rbp - 0x48]
0x28f2975: lea rdi, [r12 + rax*4]
0x28f2979: mov qword ptr [rbp + 0x68], rdi
0x28f297d: cmp r12, rdi
0x28f2980: je 0x1428f2af0
0x28f2986: mov r13d, 0xffdf
0x28f298c: lea r14, [rip + 0x2c810d5]
0x28f2993: nop dword ptr [rax]
0x28f2997: nop word ptr [rax + rax]
0x28f29a0: mov r8d, dword ptr [r12]
0x28f29a4: lea rdx, [rbp - 0x20]
0x28f29a8: mov rcx, qword ptr [rip + 0x4476cf9]
0x28f29af: mov rcx, qword ptr [rcx]
0x28f29b2: call 0x142a82150
0x28f29b7: nop 
0x28f29b8: mov qword ptr [rsp + 0x30], rsi
0x28f29bd: mov r15, qword ptr [rax + 8]
0x28f29c1: mov qword ptr [rsp + 0x38], r15
0x28f29c6: movzx ebx, byte ptr [rax + 0x10]
0x28f29ca: mov byte ptr [rsp + 0x40], bl
0x28f29ce: movzx ecx, byte ptr [rax + 0x11]
0x28f29d2: mov byte ptr [rsp + 0x41], cl
0x28f29d6: mov rcx, qword ptr [rax + 0x18]
0x28f29da: mov qword ptr [rsp + 0x48], rcx
0x28f29df: mov qword ptr [rax + 8], 0
0x28f29e7: mov byte ptr [rax + 0x10], 0
0x28f29eb: lea rax, [rip + 0x2c81096]
0x28f29f2: mov qword ptr [rsp + 0x30], rax
0x28f29f7: mov qword ptr [rsp + 0x30], r14
0x28f29fc: mov qword ptr [rbp - 0x20], rsi
0x28f2a00: lea rcx, [rbp - 0x20]
0x28f2a04: call 0x141434880
0x28f2a09: test bl, bl
0x28f2a0b: jne 0x1428f2a12
0x28f2a0d: jmp 0x1428f2ac6
0x28f2a12: mov rdx, qword ptr [r15 + 0x68]
0x28f2a16: mov rax, qword ptr [rdx + 0x20]
0x28f2a1a: movzx ecx, byte ptr [rax + 0x2d0]
0x28f2a21: cmp cl, 0xd
0x28f2a24: je 0x1428f2a2f
0x28f2a26: cmp cl, 0xf
0x28f2a29: jne 0x1428f2ac6
0x28f2a2f: mov rax, qword ptr [rdx + 0xf0]
0x28f2a36: mov rcx, qword ptr [rax + 0x18]
0x28f2a3a: cmp byte ptr [rcx + 0x1c], 0
0x28f2a3e: jne 0x1428f2ac6
0x28f2a44: mov edi, dword ptr [rip + 0x4404f6e]
0x28f2a4a: lea rbx, [r15 + 0x18]
0x28f2a4e: mov qword ptr [rbp - 0x58], rbx
0x28f2a52: mov rax, qword ptr [rbx]
0x28f2a55: mov rcx, rbx
0x28f2a58: call qword ptr [rax + 8]
0x28f2a5b: nop 
0x28f2a5c: movzx ecx, word ptr [r15 + 0x5e]
0x28f2a61: cmp cx, 8
0x28f2a65: je 0x1428f2a88
0x28f2a67: lea eax, [rcx - 0x20]
0x28f2a6a: test r13w, ax
0x28f2a6e: jne 0x1428f2a88
0x28f2a70: mov eax, dword ptr [rip + 0x43e8ebe]
0x28f2a76: test eax, eax
0x28f2a78: je 0x1428f2a88
0x28f2a7a: mov dword ptr [rbp + 0x60], eax
0x28f2a7d: mov rax, qword ptr [rbx]
0x28f2a80: mov rcx, rbx
0x28f2a83: call qword ptr [rax + 0x10]
0x28f2a86: jmp 0x1428f2ac2
0x28f2a88: mov dword ptr [r15 + 0x98], edi
0x28f2a8f: mov byte ptr [r15 + 0x9c], 7
0x28f2a97: mov word ptr [r15 + 0x5c], cx
0x28f2a9c: mov rax, qword ptr [r15]
0x28f2a9f: mov rcx, r15
0x28f2aa2: call qword ptr [rax + 0x80]
0x28f2aa8: nop 
0x28f2aa9: mov rax, qword ptr [rbx]
0x28f2aac: mov rcx, rbx
0x28f2aaf: call qword ptr [rax + 0x10]
0x28f2ab2: mov rax, qword ptr [r15]
0x28f2ab5: lea rdx, [rbp + 0x60]
0x28f2ab9: mov rcx, r15
0x28f2abc: call qword ptr [rax + 0x110]
0x28f2ac2: mov rdi, qword ptr [rbp + 0x68]
0x28f2ac6: mov qword ptr [rsp + 0x30], rsi
0x28f2acb: lea rcx, [rsp + 0x30]
0x28f2ad0: call 0x141434880
0x28f2ad5: add r12, 4
0x28f2ad9: cmp r12, rdi
0x28f2adc: jne 0x1428f29a0
0x28f2ae2: mov r14, qword ptr [rbp + 0x50]
0x28f2ae6: lea r13, [rip + 0x2c80d53]
0x28f2aed: xor r15d, r15d
0x28f2af0: mov r8d, dword ptr [r14 + 0xac]
0x28f2af7: test r8d, r8d
0x28f2afa: je 0x1428f2b3d
0x28f2afc: lea rdx, [rsp + 0x30]
0x28f2b01: mov rcx, qword ptr [rip + 0x4476ba0]
0x28f2b08: mov rcx, qword ptr [rcx]
0x28f2b0b: call 0x142a81cd0
0x28f2b10: nop 
0x28f2b11: cmp byte ptr [rsp + 0x40], 0
0x28f2b16: je 0x1428f2b2e
0x28f2b18: mov eax, dword ptr [r14 + 0x60]
0x28f2b1c: mov dword ptr [rbp + 0x50], eax
0x28f2b1f: lea rdx, [rbp + 0x50]
0x28f2b23: mov rcx, qword ptr [rsp + 0x38]
0x28f2b28: call 0x1417eb070
0x28f2b2d: nop 
0x28f2b2e: mov qword ptr [rsp + 0x30], rsi
0x28f2b33: lea rcx, [rsp + 0x30]
0x28f2b38: call 0x141434880
0x28f2b3d: mov rbx, qword ptr [rbp + 0x58]
0x28f2b41: mov dword ptr [rbx], r15d
0x28f2b44: lea rax, [rbp - 0x40]
0x28f2b48: mov rcx, qword ptr [rbp - 0x50]
0x28f2b4c: cmp rcx, rax
0x28f2b4f: je 0x1428f2b7c
0x28f2b51: test rcx, rcx
0x28f2b54: je 0x1428f2b7c
0x28f2b56: mov r8d, 0x1fd
0x28f2b5c: mov rax, qword ptr gs:[0x58]
0x28f2b65: mov rdx, qword ptr [rax]
0x28f2b68: cmp byte ptr [r8 + rdx], 0
0x28f2b6d: je 0x1428f2b76
0x28f2b6f: call 0x1447f03bc
0x28f2b74: jmp 0x1428f2b7c
0x28f2b76: call 0x1447f02bc
0x28f2b7b: nop 
0x28f2b7c: mov qword ptr [rsp + 0x50], rsi
0x28f2b81: lea rcx, [rsp + 0x50]
0x28f2b86: call 0x141434880
0x28f2b8b: nop 
0x28f2b8c: lea rax, [rip + 0x30202cd]
0x28f2b93: mov qword ptr [rsp + 0x70], rax
0x28f2b98: cmp byte ptr [rbp - 0x80], 0
0x28f2b9c: je 0x1428f2bac
0x28f2b9e: mov rcx, qword ptr [rbp - 0x68]
0x28f2ba2: mov rax, qword ptr [rcx]
0x28f2ba5: call qword ptr [rax + 0x148]
0x28f2bab: nop 
0x28f2bac: mov qword ptr [rsp + 0x70], r13
0x28f2bb1: mov qword ptr [rsp + 0x70], rsi
0x28f2bb6: lea rcx, [rsp + 0x70]
0x28f2bbb: call 0x141434880
0x28f2bc0: mov rax, rbx
0x28f2bc3: add rsp, 0x108
0x28f2bca: pop r15
0x28f2bcc: pop r14
0x28f2bce: pop r13
0x28f2bd0: pop r12
0x28f2bd2: pop rdi
0x28f2bd3: pop rsi
0x28f2bd4: pop rbx
0x28f2bd5: pop rbp
0x28f2bd6: ret 