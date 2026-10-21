0x2977e10: mov qword ptr [rsp + 8], rbx
0x2977e15: push rbp
0x2977e16: push rsi
0x2977e17: push rdi
0x2977e18: push r12
0x2977e1a: push r13
0x2977e1c: push r14
0x2977e1e: push r15
0x2977e20: lea rbp, [rsp - 0x240]
0x2977e28: sub rsp, 0x350
0x2977e2f: vmovaps xmmword ptr [rsp + 0x340], xmm6
0x2977e38: mov r15, r8
0x2977e3b: mov rsi, rdx
0x2977e3e: mov rbx, rcx
0x2977e41: mov r13, qword ptr [r8 + 0x18]
0x2977e45: movzx ecx, word ptr [r13 + 3]
0x2977e4a: movzx eax, word ptr [r8 + 0x10]
0x2977e4f: sub rax, 5
0x2977e53: cmp rax, rcx
0x2977e56: jne 0x1429783d6
0x2977e5c: cmp byte ptr [r8 + 0x38], 0
0x2977e61: jne 0x142977e71
0x2977e63: mov eax, 0x7fc1
0x2977e68: cmp ax, cx
0x2977e6b: jb 0x1429783d6
0x2977e71: cmp byte ptr [rbx + 0x21], 0
0x2977e75: je 0x142977e80
0x2977e77: xor ebx, ebx
0x2977e79: mov dword ptr [rdx], ebx
0x2977e7b: jmp 0x142978490
0x2977e80: xor ebx, ebx
0x2977e82: mov dword ptr [rbp + 0x290], ebx
0x2977e88: vxorps xmm0, xmm0, xmm0
0x2977e8c: vmovups xmmword ptr [rbp], xmm0
0x2977e91: vxorps xmm6, xmm6, xmm6
0x2977e95: vmovss dword ptr [rbp + 0x10], xmm6
0x2977e9a: vmovss dword ptr [rbp + 0x14], xmm6
0x2977e9f: vmovss xmm0, dword ptr [rip + 0x33fb20d]
0x2977ea7: vmovss dword ptr [rbp + 0x18], xmm0
0x2977eac: mov dword ptr [rbp + 0x1c], ebx
0x2977eaf: vmovsd xmm0, qword ptr [rip + 0x2bcdfe1]
0x2977eb7: vmovsd qword ptr [rbp + 0x20], xmm0
0x2977ebc: mov eax, dword ptr [rip + 0x2bcdfde]
0x2977ec2: mov dword ptr [rbp + 0x28], eax
0x2977ec5: vmovss dword ptr [rbp + 0x2c], xmm6
0x2977eca: vmovdqu xmm0, xmmword ptr [rip + 0x33fd6ce]
0x2977ed2: vmovups xmmword ptr [rbp + 0x30], xmm0
0x2977ed7: vmovss dword ptr [rbp + 0x40], xmm6
0x2977edc: vmovss dword ptr [rbp + 0x44], xmm6
0x2977ee1: lea rcx, [rbp + 0x48]
0x2977ee5: call 0x1408a6590
0x2977eea: mov byte ptr [rbp + 0xd0], bl
0x2977ef0: mov qword ptr [rbp + 0xd8], rbx
0x2977ef7: mov byte ptr [rbp + 0xe0], bl
0x2977efd: vmovss dword ptr [rbp - 0x60], xmm6
0x2977f02: vmovss dword ptr [rbp - 0x5c], xmm6
0x2977f07: lea rcx, [rbp + 0x100]
0x2977f0e: nop 
0x2977f10: mov qword ptr [rcx - 8], rbx
0x2977f14: mov qword ptr [rcx], rbx
0x2977f17: mov qword ptr [rcx + 8], rbx
0x2977f1b: mov dword ptr [rcx - 0x10], ebx
0x2977f1e: lea rcx, [rcx + 0x20]
0x2977f22: lea rax, [rcx - 0x10]
0x2977f26: lea rdx, [rbp + 0x230]
0x2977f2d: cmp rax, rdx
0x2977f30: jne 0x142977f10
0x2977f32: movzx ecx, word ptr [r13 + 3]
0x2977f37: lea rdi, [rip + 0x2da9d82]
0x2977f3e: mov qword ptr [rbp - 0x80], rdi
0x2977f42: mov byte ptr [rbp - 0x78], bl
0x2977f45: lea r14, [rip + 0x2da9d14]
0x2977f4c: mov qword ptr [rbp - 0x80], r14
0x2977f50: lea rax, [r13 + 5]
0x2977f54: mov qword ptr [rbp - 0x70], rax
0x2977f58: mov dword ptr [rbp - 0x68], ecx
0x2977f5b: mov dword ptr [rbp - 0x64], ebx
0x2977f5e: mov rax, qword ptr [rbp - 0x80]
0x2977f62: mov r9, qword ptr [rax + 8]
0x2977f66: lea rax, [rip - 0x1558cfd]
0x2977f6d: mov r8d, 4
0x2977f73: lea rdx, [rbp + 0x290]
0x2977f7a: lea rcx, [rbp - 0x80]
0x2977f7e: cmp r9, rax
0x2977f81: jne 0x142977f8a
0x2977f83: call 0x14141f270
0x2977f88: jmp 0x142977f8d
0x2977f8a: call r9
0x2977f8d: test al, al
0x2977f8f: jne 0x142977fa6
0x2977f91: mov eax, dword ptr [rip + 0x43639d9]
0x2977f97: mov dword ptr [rsi], eax
0x2977f99: mov qword ptr [rbp - 0x80], r14
0x2977f9d: mov qword ptr [rbp - 0x80], rdi
0x2977fa1: jmp 0x142978490
0x2977fa6: mov rax, qword ptr [rbp - 0x80]
0x2977faa: mov r9, qword ptr [rax + 8]
0x2977fae: lea r12, [rip - 0x261e415]
0x2977fb5: cmp r9, r12
0x2977fb8: je 0x1429783c1
0x2977fbe: mov r8d, 0xc
0x2977fc4: lea rdx, [rbp]
0x2977fc8: lea rcx, [rbp - 0x80]
0x2977fcc: call r9
0x2977fcf: test al, al
0x2977fd1: je 0x1429783c1
0x2977fd7: lea rdx, [rbp + 0xc]
0x2977fdb: lea rcx, [rbp - 0x80]
0x2977fdf: call 0x14141fa90
0x2977fe4: test al, al
0x2977fe6: je 0x1429783c1
0x2977fec: mov rax, qword ptr [rbp - 0x80]
0x2977ff0: mov r9, qword ptr [rax + 8]
0x2977ff4: cmp r9, r12
0x2977ff7: je 0x1429783c1
0x2977ffd: mov r8d, 4
0x2978003: lea rdx, [rbp + 0x1c]
0x2978007: lea rcx, [rbp - 0x80]
0x297800b: call r9
0x297800e: test al, al
0x2978010: je 0x1429783c1
0x2978016: lea rdx, [rbp + 0x20]
0x297801a: lea rcx, [rbp - 0x80]
0x297801e: call 0x14141fb70
0x2978023: test al, al
0x2978025: je 0x1429783c1
0x297802b: lea rdx, [rbp + 0x48]
0x297802f: lea rcx, [rbp - 0x80]
0x2978033: call 0x1412ad8d0
0x2978038: test al, al
0x297803a: je 0x1429783c1
0x2978040: mov rax, qword ptr [rbp - 0x80]
0x2978044: mov r9, qword ptr [rax + 8]
0x2978048: cmp r9, r12
0x297804b: je 0x1429783c1
0x2978051: mov r8d, 1
0x2978057: lea rdx, [rbp + 0xd0]
0x297805e: lea rcx, [rbp - 0x80]
0x2978062: call r9
0x2978065: test al, al
0x2978067: je 0x1429783c1
0x297806d: mov rax, qword ptr [rbp - 0x80]
0x2978071: mov r9, qword ptr [rax + 8]
0x2978075: cmp r9, r12
0x2978078: je 0x1429783c1
0x297807e: mov r8d, 8
0x2978084: lea rdx, [rbp + 0xd8]
0x297808b: lea rcx, [rbp - 0x80]
0x297808f: call r9
0x2978092: test al, al
0x2978094: je 0x1429783c1
0x297809a: mov rax, qword ptr [rbp - 0x80]
0x297809e: mov r9, qword ptr [rax + 8]
0x29780a2: cmp r9, r12
0x29780a5: je 0x1429783c1
0x29780ab: mov r8d, 1
0x29780b1: lea rdx, [rbp + 0xe0]
0x29780b8: lea rcx, [rbp - 0x80]
0x29780bc: call r9
0x29780bf: test al, al
0x29780c1: je 0x1429783c1
0x29780c7: mov rax, qword ptr [rbp - 0x80]
0x29780cb: mov r9, qword ptr [rax + 8]
0x29780cf: cmp r9, r12
0x29780d2: je 0x1429783ac
0x29780d8: mov r8d, 8
0x29780de: lea rdx, [rbp - 0x60]
0x29780e2: lea rcx, [rbp - 0x80]
0x29780e6: call r9
0x29780e9: test al, al
0x29780eb: je 0x1429783ac
0x29780f1: mov rax, qword ptr [rbp - 0x80]
0x29780f5: mov r9, qword ptr [rax + 8]
0x29780f9: cmp r9, r12
0x29780fc: je 0x1429783ac
0x2978102: mov r8d, 4
0x2978108: lea rdx, [rbp - 0x58]
0x297810c: lea rcx, [rbp - 0x80]
0x2978110: call r9
0x2978113: test al, al
0x2978115: je 0x1429783ac
0x297811b: mov r14d, ebx
0x297811e: lea rdi, [rbp + 0x100]
0x2978125: mov rax, qword ptr [rbp - 0x80]
0x2978129: mov r9, qword ptr [rax + 8]
0x297812d: cmp r9, r12
0x2978130: je 0x142978389
0x2978136: mov r8d, 4
0x297813c: lea rdx, [rbp + 0x298]
0x2978143: lea rcx, [rbp - 0x80]
0x2978147: call r9
0x297814a: test al, al
0x297814c: je 0x142978389
0x2978152: mov eax, dword ptr [rbp + 0x298]
0x2978158: mov dword ptr [rdi - 0x10], eax
0x297815b: mov rax, qword ptr [rbp - 0x80]
0x297815f: mov r9, qword ptr [rax + 8]
0x2978163: cmp r9, r12
0x2978166: je 0x142978389
0x297816c: lea rdx, [rdi - 8]
0x2978170: mov r8d, 8
0x2978176: lea rcx, [rbp - 0x80]
0x297817a: call r9
0x297817d: test al, al
0x297817f: je 0x142978389
0x2978185: mov rax, qword ptr [rbp - 0x80]
0x2978189: mov r9, qword ptr [rax + 8]
0x297818d: cmp r9, r12
0x2978190: je 0x142978389
0x2978196: mov r8d, 8
0x297819c: mov rdx, rdi
0x297819f: lea rcx, [rbp - 0x80]
0x29781a3: call r9
0x29781a6: test al, al
0x29781a8: je 0x142978389
0x29781ae: mov rax, qword ptr [rbp - 0x80]
0x29781b2: mov r9, qword ptr [rax + 8]
0x29781b6: cmp r9, r12
0x29781b9: je 0x142978389
0x29781bf: lea rdx, [rdi + 8]
0x29781c3: mov r8d, 8
0x29781c9: lea rcx, [rbp - 0x80]
0x29781cd: call r9
0x29781d0: test al, al
0x29781d2: je 0x142978389
0x29781d8: inc r14d
0x29781db: add rdi, 0x20
0x29781df: cmp r14d, 0xa
0x29781e3: jb 0x142978125
0x29781e9: movzx eax, word ptr [r13 + 3]
0x29781ee: cmp dword ptr [rbp - 0x64], eax
0x29781f1: je 0x142978216
0x29781f3: mov eax, dword ptr [rip + 0x4363777]
0x29781f9: mov dword ptr [rsi], eax
0x29781fb: lea rax, [rip + 0x2da9a5e]
0x2978202: mov qword ptr [rbp - 0x80], rax
0x2978206: lea rax, [rip + 0x2da9ab3]
0x297820d: mov qword ptr [rbp - 0x80], rax
0x2978211: jmp 0x142978490
0x2978216: mov rdi, qword ptr [r15]
0x2978219: mov r8d, dword ptr [rbp + 0x290]
0x2978220: lea rdx, [rbp - 0x30]
0x2978224: mov rcx, qword ptr [rip + 0x43f146d]
0x297822b: mov rcx, qword ptr [rcx]
0x297822e: call 0x142a827b0
0x2978233: nop 
0x2978234: cmp byte ptr [rbp - 0x20], 0
0x2978238: jne 0x14297823f
0x297823a: jmp 0x142978358
0x297823f: mov r14, qword ptr [rbp - 0x28]
0x2978243: mov rax, qword ptr [rdi]
0x2978246: mov rcx, rdi
0x2978249: call qword ptr [rax + 0x160]
0x297824f: test rax, rax
0x2978252: je 0x142978358
0x2978258: mov rax, qword ptr [rdi]
0x297825b: lea rdx, [rbp + 0x298]
0x2978262: mov rcx, rdi
0x2978265: call qword ptr [rax + 0x170]
0x297826b: mov ecx, dword ptr [r14 + 0x90]
0x2978272: cmp dword ptr [rax], ecx
0x2978274: jne 0x142978358
0x297827a: mov rax, qword ptr [rbp - 0x28]
0x297827e: mov rcx, qword ptr [rax + 0x68]
0x2978282: mov r14, qword ptr [rcx + 0x1a0]
0x2978289: mov rax, qword ptr [r14 + 8]
0x297828d: lea rdx, [rax + 8]
0x2978291: test rax, rax
0x2978294: cmove rdx, rbx
0x2978298: mov r8b, 1
0x297829b: mov rdx, qword ptr [rdx]
0x297829e: lea rcx, [rbp - 0x40]
0x29782a2: call 0x140393650
0x29782a7: nop 
0x29782a8: vmovsd xmm0, qword ptr [rbp - 0x60]
0x29782ad: vmovsd qword ptr [r14 + 0x5a0], xmm0
0x29782b6: mov eax, dword ptr [rbp - 0x58]
0x29782b9: mov dword ptr [r14 + 0x5a8], eax
0x29782c0: mov rdi, qword ptr [rbp - 0x40]
0x29782c4: mov rax, qword ptr [rdi]
0x29782c7: xor edx, edx
0x29782c9: mov rcx, rdi
0x29782cc: call qword ptr [rax + 0x20]
0x29782cf: cmp byte ptr [rbp - 0x38], 1
0x29782d3: jne 0x142978303
0x29782d5: mov eax, 0xffffffff
0x29782da: lock xadd dword ptr [rdi + 8], eax
0x29782df: cmp eax, 1
0x29782e2: jne 0x1429782f6
0x29782e4: test dword ptr [rdi + 0xc], 0x40000000
0x29782eb: je 0x142978303
0x29782ed: mov rax, qword ptr [rdi]
0x29782f0: mov rcx, rdi
0x29782f3: call qword ptr [rax + 0x40]
0x29782f6: test dword ptr [rdi + 0xc], 0x40000000
0x29782fd: je 0x142978303
0x29782ff: lock dec dword ptr [rdi + 0xc]
0x2978303: lea rdx, [rbp + 0x298]
0x297830a: mov rcx, r14
0x297830d: call 0x1421a1580
0x2978312: cmp dword ptr [rbp + 0x298], 0
0x2978319: jne 0x142978345
0x297831b: mov r9b, 1
0x297831e: lea r8, [rbp]
0x2978322: lea rdx, [rbp + 0x298]
0x2978329: mov rcx, r14
0x297832c: call 0x142bc5420
0x2978331: mov edx, dword ptr [rbp + 0x298]
0x2978337: test edx, edx
0x2978339: je 0x142978345
0x297833b: mov rcx, r14
0x297833e: call 0x142bccc00
0x2978343: jmp 0x142978356
0x2978345: lea rdx, [rbp + 0xf0]
0x297834c: mov rcx, qword ptr [r14 + 8]
0x2978350: call 0x1428fa740
0x2978355: nop 
0x2978356: jmp 0x142978358
0x2978358: lea rax, [rip + 0x2dadae9]
0x297835f: mov qword ptr [rbp - 0x30], rax
0x2978363: lea rcx, [rbp - 0x30]
0x2978367: call 0x141434880
0x297836c: mov dword ptr [rsi], ebx
0x297836e: lea rax, [rip + 0x2da98eb]
0x2978375: mov qword ptr [rbp - 0x80], rax
0x2978379: lea rax, [rip + 0x2da9940]
0x2978380: mov qword ptr [rbp - 0x80], rax
0x2978384: jmp 0x142978490
0x2978389: mov eax, dword ptr [rip + 0x43635e1]
0x297838f: mov dword ptr [rsi], eax
0x2978391: lea rax, [rip + 0x2da98c8]
0x2978398: mov qword ptr [rbp - 0x80], rax
0x297839c: lea rax, [rip + 0x2da991d]
0x29783a3: mov qword ptr [rbp - 0x80], rax
0x29783a7: jmp 0x142978490
0x29783ac: mov eax, dword ptr [rip + 0x43635be]
0x29783b2: mov dword ptr [rsi], eax
0x29783b4: mov qword ptr [rbp - 0x80], r14
0x29783b8: mov qword ptr [rbp - 0x80], rdi
0x29783bc: jmp 0x142978490
0x29783c1: mov eax, dword ptr [rip + 0x43635a9]
0x29783c7: mov dword ptr [rsi], eax
0x29783c9: mov qword ptr [rbp - 0x80], r14
0x29783cd: mov qword ptr [rbp - 0x80], rdi
0x29783d1: jmp 0x142978490
0x29783d6: mov rdi, qword ptr [r8]
0x29783d9: test rdi, rdi
0x29783dc: je 0x142978467
0x29783e2: mov rax, qword ptr [rdi]
0x29783e5: lea rdx, [rbp - 0x10]
0x29783e9: mov rcx, rdi
0x29783ec: call qword ptr [rax + 0xd0]
0x29783f2: mov rdx, qword ptr [rax]
0x29783f5: mov qword ptr [rbp + 0x298], rdx
0x29783fc: mov rax, qword ptr [rdi]
0x29783ff: lea rdx, [rbp - 0x40]
0x2978403: mov rcx, rdi
0x2978406: call qword ptr [rax + 0xd8]
0x297840c: mov rdx, qword ptr [rax]
0x297840f: mov qword ptr [rbp - 0x50], rdx
0x2978413: mov rax, qword ptr [rdi]
0x2978416: mov rcx, rdi
0x2978419: call qword ptr [rax + 0xc8]
0x297841f: mov qword ptr [rbp - 0x48], rax
0x2978423: lea rax, [rbx + 0xc]
0x2978427: lea rcx, [rbx + 0x22]
0x297842b: lea rdx, [rbp + 0x298]
0x2978432: mov qword ptr [rsp + 0x80], rdx
0x297843a: lea rdx, [rbp - 0x50]
0x297843e: mov qword ptr [rsp + 0x78], rdx
0x2978443: lea rdx, [rbp - 0x48]
0x2978447: mov qword ptr [rsp + 0x70], rdx
0x297844c: mov qword ptr [rsp + 0x68], rax
0x2978451: mov qword ptr [rsp + 0x60], rcx
0x2978456: mov eax, dword ptr [rip + 0x4363518]
0x297845c: mov dword ptr [rsp + 0x48], eax
0x2978460: call 0x14143b450
0x2978465: jmp 0x142978488
0x2978467: lea rax, [rbx + 0xc]
0x297846b: lea rcx, [rbx + 0x22]
0x297846f: mov qword ptr [rsp + 0x68], rax
0x2978474: mov qword ptr [rsp + 0x60], rcx
0x2978479: mov eax, dword ptr [rip + 0x43634f5]
0x297847f: mov dword ptr [rsp + 0x48], eax
0x2978483: call 0x14143b670
0x2978488: mov eax, dword ptr [rip + 0x43634e6]
0x297848e: mov dword ptr [rsi], eax
0x2978490: mov rax, rsi
0x2978493: mov rbx, qword ptr [rsp + 0x390]
0x297849b: vmovaps xmm6, xmmword ptr [rsp + 0x340]
0x29784a4: add rsp, 0x350
0x29784ab: pop r15
0x29784ad: pop r14
0x29784af: pop r13
0x29784b1: pop r12
0x29784b3: pop rdi
0x29784b4: pop rsi
0x29784b5: pop rbp
0x29784b6: ret 