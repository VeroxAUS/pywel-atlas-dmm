0x2c3e030: mov qword ptr [rsp + 0x20], r9
0x2c3e035: mov byte ptr [rsp + 0x18], r8b
0x2c3e03a: mov qword ptr [rsp + 8], rcx
0x2c3e03f: push rbp
0x2c3e040: push rbx
0x2c3e041: push rsi
0x2c3e042: push rdi
0x2c3e043: push r12
0x2c3e045: push r13
0x2c3e047: push r14
0x2c3e049: push r15
0x2c3e04b: lea rbp, [rsp - 7]
0x2c3e050: sub rsp, 0xe8
0x2c3e057: mov r13, rdx
0x2c3e05a: xor r14d, r14d
0x2c3e05d: mov dword ptr [rbp + 0x57], r14d
0x2c3e061: mov r15, qword ptr [rdx]
0x2c3e064: cmp byte ptr [rip + 0x40b0d7d], 1
0x2c3e06b: sete byte ptr [rbp + 0x5f]
0x2c3e06f: mov rsi, qword ptr [r9]
0x2c3e072: mov rax, qword ptr [r15 + 0x68]
0x2c3e076: mov rdi, qword ptr [rax + 0x18]
0x2c3e07a: mov r12d, 0xffffffff
0x2c3e080: test rdi, rdi
0x2c3e083: je 0x142c3e0f5
0x2c3e085: lea rdx, [r15 + 8]
0x2c3e089: test r15, r15
0x2c3e08c: cmove rdx, r14
0x2c3e090: mov rdx, qword ptr [rdx]
0x2c3e093: lea rcx, [rbp - 0x49]
0x2c3e097: call 0x140393df0
0x2c3e09c: nop 
0x2c3e09d: mov edx, dword ptr [rdi + 0x20]
0x2c3e0a0: mov ebx, r14d
0x2c3e0a3: test edx, edx
0x2c3e0a5: je 0x142c3e0e9
0x2c3e0a7: lea r8, [rip + 0x3e27b12]
0x2c3e0ae: cmp ebx, edx
0x2c3e0b0: jae 0x142c3e0e3
0x2c3e0b2: mov ecx, ebx
0x2c3e0b4: add rcx, rcx
0x2c3e0b7: mov rax, qword ptr [rdi + 0x18]
0x2c3e0bb: mov rax, qword ptr [rax + rcx*8]
0x2c3e0bf: test rax, rax
0x2c3e0c2: je 0x142c3e0e3
0x2c3e0c4: mov rax, qword ptr [rax + 0x68]
0x2c3e0c8: mov rax, qword ptr [rax + 0x20]
0x2c3e0cc: test rax, rax
0x2c3e0cf: jne 0x142c3e0d6
0x2c3e0d1: mov rax, r8
0x2c3e0d4: jmp 0x142c3e0da
0x2c3e0d6: mov rax, qword ptr [rax + 0x70]
0x2c3e0da: cmp rsi, qword ptr [rax]
0x2c3e0dd: je 0x142c3e236
0x2c3e0e3: inc ebx
0x2c3e0e5: cmp ebx, edx
0x2c3e0e7: jb 0x142c3e0b2
0x2c3e0e9: mov rcx, qword ptr [rbp - 0x49]
0x2c3e0ed: mov rax, qword ptr [rcx]
0x2c3e0f0: mov dl, 1
0x2c3e0f2: call qword ptr [rax + 0x20]
0x2c3e0f5: cmp byte ptr [rbp + 0x5f], 0
0x2c3e0f9: je 0x142c3e372
0x2c3e0ff: mov rax, qword ptr [r15 + 0x68]
0x2c3e103: mov rbx, qword ptr [rax + 0x10]
0x2c3e107: mov rdi, qword ptr [rbx + 8]
0x2c3e10b: lea rdx, [rdi + 8]
0x2c3e10f: test rdi, rdi
0x2c3e112: cmove rdx, r14
0x2c3e116: mov r8b, 1
0x2c3e119: mov rdx, qword ptr [rdx]
0x2c3e11c: lea rcx, [rbp - 0x61]
0x2c3e120: call 0x140393650
0x2c3e125: nop 
0x2c3e126: mov rcx, qword ptr [rbx + 0x18]
0x2c3e12a: call 0x1409d9b30
0x2c3e12f: nop 
0x2c3e130: mov rbx, qword ptr [rbp - 0x61]
0x2c3e134: mov rax, qword ptr [rbx]
0x2c3e137: xor edx, edx
0x2c3e139: mov rcx, rbx
0x2c3e13c: call qword ptr [rax + 0x20]
0x2c3e13f: cmp byte ptr [rbp - 0x59], 1
0x2c3e143: jne 0x142c3e171
0x2c3e145: mov eax, r12d
0x2c3e148: lock xadd dword ptr [rbx + 8], eax
0x2c3e14d: cmp eax, 1
0x2c3e150: jne 0x142c3e164
0x2c3e152: test dword ptr [rbx + 0xc], 0x40000000
0x2c3e159: je 0x142c3e171
0x2c3e15b: mov rax, qword ptr [rbx]
0x2c3e15e: mov rcx, rbx
0x2c3e161: call qword ptr [rax + 0x40]
0x2c3e164: test dword ptr [rbx + 0xc], 0x40000000
0x2c3e16b: je 0x142c3e171
0x2c3e16d: lock dec dword ptr [rbx + 0xc]
0x2c3e171: lea rbx, [rip + 0x2ee7280]
0x2c3e178: mov qword ptr [rbp - 0x61], rbx
0x2c3e17c: mov byte ptr [rbp - 0x59], 0
0x2c3e180: lea rax, [rip + 0x2ee72b1]
0x2c3e187: mov qword ptr [rbp - 0x61], rax
0x2c3e18b: mov qword ptr [rbp - 0x51], r14
0x2c3e18f: test rdi, rdi
0x2c3e192: je 0x142c3e1a4
0x2c3e194: mov rax, qword ptr [rdi]
0x2c3e197: mov rcx, rdi
0x2c3e19a: call qword ptr [rax + 0xe8]
0x2c3e1a0: mov qword ptr [rbp - 0x51], rax
0x2c3e1a4: lea rdx, [rbp - 0x61]
0x2c3e1a8: mov rcx, rdi
0x2c3e1ab: call 0x142a1cf80
0x2c3e1b0: nop 
0x2c3e1b1: mov qword ptr [rbp - 0x61], rbx
0x2c3e1b5: mov r9, r15
0x2c3e1b8: mov r8, qword ptr [rbp + 0x6f]
0x2c3e1bc: mov r8d, dword ptr [r8]
0x2c3e1bf: lea rdx, [rbp + 0x5f]
0x2c3e1c3: mov rcx, qword ptr [rip + 0x412b4ce]
0x2c3e1ca: mov rcx, qword ptr [rcx + 0x48]
0x2c3e1ce: call 0x14186f570
0x2c3e1d3: mov ecx, dword ptr [rax]
0x2c3e1d5: mov dword ptr [rbp + 0x57], ecx
0x2c3e1d8: test ecx, ecx
0x2c3e1da: je 0x142c3e372
0x2c3e1e0: mov rax, qword ptr [r15]
0x2c3e1e3: mov rcx, r15
0x2c3e1e6: call qword ptr [rax + 0xc8]
0x2c3e1ec: mov qword ptr [rbp + 0x67], rax
0x2c3e1f0: mov rax, qword ptr [r15]
0x2c3e1f3: lea rdx, [rbp - 0x61]
0x2c3e1f7: mov rcx, r15
0x2c3e1fa: call qword ptr [rax + 0xd0]
0x2c3e200: mov rcx, qword ptr [rax]
0x2c3e203: mov qword ptr [rbp - 0x41], rcx
0x2c3e207: mov rax, qword ptr [r15]
0x2c3e20a: lea rdx, [rbp - 0x39]
0x2c3e20e: mov rcx, r15
0x2c3e211: call qword ptr [rax + 0xd8]
0x2c3e217: mov rcx, qword ptr [rax]
0x2c3e21a: mov qword ptr [rbp - 0x49], rcx
0x2c3e21e: lea rax, [rbp + 0x67]
0x2c3e222: mov qword ptr [rsp + 0x70], rax
0x2c3e227: lea rax, [rbp - 0x41]
0x2c3e22b: mov qword ptr [rsp + 0x68], rax
0x2c3e230: lea rax, [rbp - 0x49]
0x2c3e234: jmp 0x142c3e2b1
0x2c3e236: mov rcx, qword ptr [rbp - 0x49]
0x2c3e23a: mov rax, qword ptr [rcx]
0x2c3e23d: mov dl, 1
0x2c3e23f: call qword ptr [rax + 0x20]
0x2c3e242: test ebx, ebx
0x2c3e244: js 0x142c3e0f5
0x2c3e24a: cmp byte ptr [rbp + 0x5f], 0
0x2c3e24e: jne 0x142c3e0ff
0x2c3e254: mov eax, dword ptr [rip + 0x40b8926]
0x2c3e25a: mov dword ptr [rbp + 0x57], eax
0x2c3e25d: mov rax, qword ptr [r15]
0x2c3e260: mov rcx, r15
0x2c3e263: call qword ptr [rax + 0xc8]
0x2c3e269: mov qword ptr [rbp + 0x67], rax
0x2c3e26d: mov rax, qword ptr [r15]
0x2c3e270: lea rdx, [rbp - 0x39]
0x2c3e274: mov rcx, r15
0x2c3e277: call qword ptr [rax + 0xd0]
0x2c3e27d: mov rdx, qword ptr [rax]
0x2c3e280: mov qword ptr [rbp - 0x49], rdx
0x2c3e284: mov rax, qword ptr [r15]
0x2c3e287: lea rdx, [rbp - 0x61]
0x2c3e28b: mov rcx, r15
0x2c3e28e: call qword ptr [rax + 0xd8]
0x2c3e294: mov rcx, qword ptr [rax]
0x2c3e297: mov qword ptr [rbp - 0x41], rcx
0x2c3e29b: lea rax, [rbp + 0x67]
0x2c3e29f: mov qword ptr [rsp + 0x70], rax
0x2c3e2a4: lea rax, [rbp - 0x49]
0x2c3e2a8: mov qword ptr [rsp + 0x68], rax
0x2c3e2ad: lea rax, [rbp - 0x41]
0x2c3e2b1: mov qword ptr [rsp + 0x60], rax
0x2c3e2b6: lea rax, [rip + 0x2ef6f6b]
0x2c3e2bd: mov qword ptr [rsp + 0x58], rax
0x2c3e2c2: mov eax, dword ptr [rbp + 0x57]
0x2c3e2c5: mov dword ptr [rsp + 0x48], eax
0x2c3e2c9: call 0x1409116e0
0x2c3e2ce: mov rax, qword ptr [rbp + 0x4f]
0x2c3e2d2: mov ebx, dword ptr [rbp + 0x57]
0x2c3e2d5: mov edi, 0x3f5
0x2c3e2da: movzx eax, word ptr [rax + 0xc]
0x2c3e2de: mov qword ptr [rbp - 0x58], r14
0x2c3e2e2: mov dword ptr [rbp - 0x5e], ebx
0x2c3e2e5: mov byte ptr [rbp - 0x5f], 0xff
0x2c3e2e9: mov word ptr [rbp - 0x61], di
0x2c3e2ed: mov word ptr [rbp - 0x5a], ax
0x2c3e2f1: call 0x1414276d0
0x2c3e2f6: mov dword ptr [rbp + 0x5f], ebx
0x2c3e2f9: lea rdx, [rbp + 0x5f]
0x2c3e2fd: mov rcx, rax
0x2c3e300: call 0x141427c10
0x2c3e305: test rax, rax
0x2c3e308: je 0x142c3e314
0x2c3e30a: cmp dword ptr [rax + 8], 2
0x2c3e30e: je 0x142c3e6b2
0x2c3e314: mov ebx, dword ptr [rbp + 0x57]
0x2c3e317: call 0x1414276d0
0x2c3e31c: mov dword ptr [rbp + 0x5f], ebx
0x2c3e31f: lea rdx, [rbp + 0x5f]
0x2c3e323: mov rcx, rax
0x2c3e326: call 0x141427c10
0x2c3e32b: test rax, rax
0x2c3e32e: je 0x142c3e6b2
0x2c3e334: cmp dword ptr [rax + 8], 1
0x2c3e338: jne 0x142c3e6b2
0x2c3e33e: mov rax, qword ptr [r13 + 8]
0x2c3e342: test rax, rax
0x2c3e345: je 0x142c3e6b2
0x2c3e34b: mov r9d, 0x11
0x2c3e351: mov edx, edi
0x2c3e353: mov qword ptr [rsp + 0x30], rax
0x2c3e358: mov byte ptr [rsp + 0x20], 0
0x2c3e35d: lea r8, [rbp - 0x61]
0x2c3e361: mov rcx, qword ptr [rip + 0x412b318]
0x2c3e368: call 0x142773630
0x2c3e36d: jmp 0x142c3e6b2
0x2c3e372: mov rdi, qword ptr [rbp + 0x67]
0x2c3e376: mov r9, qword ptr [rdi]
0x2c3e379: mov r8, r15
0x2c3e37c: lea rdx, [rbp - 0x31]
0x2c3e380: mov rcx, qword ptr [rip + 0x412b311]
0x2c3e387: mov rcx, qword ptr [rcx]
0x2c3e38a: call 0x142a82f90
0x2c3e38f: nop 
0x2c3e390: cmp byte ptr [rbp - 0x21], 0
0x2c3e394: jne 0x142c3e415
0x2c3e396: mov eax, dword ptr [rip + 0x40b87ac]
0x2c3e39c: mov dword ptr [rbp + 0x57], eax
0x2c3e39f: mov rax, qword ptr [r15]
0x2c3e3a2: mov rcx, r15
0x2c3e3a5: call qword ptr [rax + 0xc8]
0x2c3e3ab: mov qword ptr [rbp + 0x67], rax
0x2c3e3af: mov rax, qword ptr [r15]
0x2c3e3b2: lea rdx, [rbp - 0x61]
0x2c3e3b6: mov rcx, r15
0x2c3e3b9: call qword ptr [rax + 0xd0]
0x2c3e3bf: mov rcx, qword ptr [rax]
0x2c3e3c2: mov qword ptr [rbp - 0x41], rcx
0x2c3e3c6: mov rax, qword ptr [r15]
0x2c3e3c9: lea rdx, [rbp - 0x39]
0x2c3e3cd: mov rcx, r15
0x2c3e3d0: call qword ptr [rax + 0xd8]
0x2c3e3d6: mov rcx, qword ptr [rax]
0x2c3e3d9: mov qword ptr [rbp - 0x49], rcx
0x2c3e3dd: lea rax, [rbp + 0x67]
0x2c3e3e1: mov qword ptr [rsp + 0x70], rax
0x2c3e3e6: lea rax, [rbp - 0x41]
0x2c3e3ea: mov qword ptr [rsp + 0x68], rax
0x2c3e3ef: lea rax, [rbp - 0x49]
0x2c3e3f3: mov qword ptr [rsp + 0x60], rax
0x2c3e3f8: lea rax, [rip + 0x2ef6e51]
0x2c3e3ff: mov qword ptr [rsp + 0x58], rax
0x2c3e404: mov eax, dword ptr [rbp + 0x57]
0x2c3e407: mov dword ptr [rsp + 0x48], eax
0x2c3e40b: call 0x1409116e0
0x2c3e410: jmp 0x142c3e592
0x2c3e415: mov rsi, qword ptr [rbp - 0x29]
0x2c3e419: mov rax, qword ptr [rsi + 0x68]
0x2c3e41d: mov rbx, qword ptr [rax + 0xb8]
0x2c3e424: lea rdx, [rsi + 8]
0x2c3e428: test rsi, rsi
0x2c3e42b: cmove rdx, r14
0x2c3e42f: mov r8b, 1
0x2c3e432: mov rdx, qword ptr [rdx]
0x2c3e435: lea rcx, [rbp - 0x61]
0x2c3e439: call 0x140393650
0x2c3e43e: nop 
0x2c3e43f: mov rdx, qword ptr [rbp + 0x7f]
0x2c3e443: mov rcx, rbx
0x2c3e446: call 0x142135420
0x2c3e44b: mov rax, qword ptr [rbp + 0x77]
0x2c3e44f: mov ecx, dword ptr [rax]
0x2c3e451: mov dword ptr [rbx + 0x124], ecx
0x2c3e457: mov rbx, qword ptr [rbp - 0x61]
0x2c3e45b: mov rax, qword ptr [rbx]
0x2c3e45e: xor edx, edx
0x2c3e460: mov rcx, rbx
0x2c3e463: call qword ptr [rax + 0x20]
0x2c3e466: cmp byte ptr [rbp - 0x59], 1
0x2c3e46a: jne 0x142c3e497
0x2c3e46c: lock xadd dword ptr [rbx + 8], r12d
0x2c3e472: cmp r12d, 1
0x2c3e476: jne 0x142c3e48a
0x2c3e478: test dword ptr [rbx + 0xc], 0x40000000
0x2c3e47f: je 0x142c3e497
0x2c3e481: mov rax, qword ptr [rbx]
0x2c3e484: mov rcx, rbx
0x2c3e487: call qword ptr [rax + 0x40]
0x2c3e48a: test dword ptr [rbx + 0xc], 0x40000000
0x2c3e491: je 0x142c3e497
0x2c3e493: lock dec dword ptr [rbx + 0xc]
0x2c3e497: mov rcx, qword ptr [rsi + 0x68]
0x2c3e49b: mov rax, qword ptr [rbp + 0x6f]
0x2c3e49f: mov r9d, dword ptr [rax]
0x2c3e4a2: mov r8, rdi
0x2c3e4a5: lea rdx, [rbp + 0x5f]
0x2c3e4a9: mov rcx, qword ptr [rcx + 0x20]
0x2c3e4ad: call 0x142940ee0
0x2c3e4b2: mov edi, dword ptr [rax]
0x2c3e4b4: mov dword ptr [rbp + 0x57], edi
0x2c3e4b7: test edi, edi
0x2c3e4b9: je 0x142c3e622
0x2c3e4bf: lea rbx, [rsi + 0x18]
0x2c3e4c3: mov qword ptr [rbp + 0x67], rbx
0x2c3e4c7: mov rax, qword ptr [rbx]
0x2c3e4ca: mov rcx, rbx
0x2c3e4cd: call qword ptr [rax + 8]
0x2c3e4d0: nop 
0x2c3e4d1: movzx ecx, word ptr [rsi + 0x5e]
0x2c3e4d5: cmp cx, 8
0x2c3e4d9: je 0x142c3e500
0x2c3e4db: lea eax, [rcx - 0x20]
0x2c3e4de: mov edx, 0xffdf
0x2c3e4e3: test dx, ax
0x2c3e4e6: jne 0x142c3e500
0x2c3e4e8: mov eax, dword ptr [rip + 0x409d446]
0x2c3e4ee: test eax, eax
0x2c3e4f0: je 0x142c3e500
0x2c3e4f2: mov dword ptr [rbp + 0x5f], eax
0x2c3e4f5: mov rax, qword ptr [rbx]
0x2c3e4f8: mov rcx, rbx
0x2c3e4fb: call qword ptr [rax + 0x10]
0x2c3e4fe: jmp 0x142c3e537
0x2c3e500: mov dword ptr [rsi + 0x98], edi
0x2c3e506: mov byte ptr [rsi + 0x9c], 0xb
0x2c3e50d: mov word ptr [rsi + 0x5c], cx
0x2c3e511: mov rax, qword ptr [rsi]
0x2c3e514: mov rcx, rsi
0x2c3e517: call qword ptr [rax + 0x80]
0x2c3e51d: nop 
0x2c3e51e: mov rax, qword ptr [rbx]
0x2c3e521: mov rcx, rbx
0x2c3e524: call qword ptr [rax + 0x10]
0x2c3e527: mov rax, qword ptr [rsi]
0x2c3e52a: lea rdx, [rbp + 0x5f]
0x2c3e52e: mov rcx, rsi
0x2c3e531: call qword ptr [rax + 0x110]
0x2c3e537: mov byte ptr [rbp + 0x5f], 0xb
0x2c3e53b: lea rbx, [rip + 0x2ee6eb6]
0x2c3e542: mov qword ptr [rbp - 0x61], rbx
0x2c3e546: mov byte ptr [rbp - 0x59], 0
0x2c3e54a: lea rax, [rip + 0x2ee6ee7]
0x2c3e551: mov qword ptr [rbp - 0x61], rax
0x2c3e555: mov qword ptr [rbp - 0x51], r14
0x2c3e559: test rsi, rsi
0x2c3e55c: je 0x142c3e56e
0x2c3e55e: mov rax, qword ptr [rsi]
0x2c3e561: mov rcx, rsi
0x2c3e564: call qword ptr [rax + 0xe8]
0x2c3e56a: mov qword ptr [rbp - 0x51], rax
0x2c3e56e: lea r9, [rbp + 0x57]
0x2c3e572: lea r8, [rbp + 0x5f]
0x2c3e576: lea rdx, [rbp - 0x61]
0x2c3e57a: mov rcx, rsi
0x2c3e57d: call 0x1429878b0
0x2c3e582: nop 
0x2c3e583: mov qword ptr [rbp - 0x61], rbx
0x2c3e587: mov rdx, rsi
0x2c3e58a: mov rcx, r15
0x2c3e58d: call 0x14206b750
0x2c3e592: mov rax, qword ptr [rbp + 0x4f]
0x2c3e596: mov ebx, dword ptr [rbp + 0x57]
0x2c3e599: mov edi, 0x3f5
0x2c3e59e: movzx eax, word ptr [rax + 0xc]
0x2c3e5a2: mov qword ptr [rbp - 0x58], r14
0x2c3e5a6: mov dword ptr [rbp - 0x5e], ebx
0x2c3e5a9: mov byte ptr [rbp - 0x5f], 0xff
0x2c3e5ad: mov word ptr [rbp - 0x61], di
0x2c3e5b1: mov word ptr [rbp - 0x5a], ax
0x2c3e5b5: call 0x1414276d0
0x2c3e5ba: mov dword ptr [rbp + 0x5f], ebx
0x2c3e5bd: lea rdx, [rbp + 0x5f]
0x2c3e5c1: mov rcx, rax
0x2c3e5c4: call 0x141427c10
0x2c3e5c9: test rax, rax
0x2c3e5cc: je 0x142c3e5d4
0x2c3e5ce: cmp dword ptr [rax + 8], 2
0x2c3e5d2: je 0x142c3e622
0x2c3e5d4: mov ebx, dword ptr [rbp + 0x57]
0x2c3e5d7: call 0x1414276d0
0x2c3e5dc: mov dword ptr [rbp + 0x5f], ebx
0x2c3e5df: lea rdx, [rbp + 0x5f]
0x2c3e5e3: mov rcx, rax
0x2c3e5e6: call 0x141427c10
0x2c3e5eb: test rax, rax
0x2c3e5ee: je 0x142c3e622
0x2c3e5f0: cmp dword ptr [rax + 8], 1
0x2c3e5f4: jne 0x142c3e622
0x2c3e5f6: mov rax, qword ptr [r13 + 8]
0x2c3e5fa: test rax, rax
0x2c3e5fd: je 0x142c3e622
0x2c3e5ff: mov qword ptr [rsp + 0x30], rax
0x2c3e604: mov byte ptr [rsp + 0x20], 0
0x2c3e609: mov r9d, 0x11
0x2c3e60f: lea r8, [rbp - 0x61]
0x2c3e613: mov edx, edi
0x2c3e615: mov rcx, qword ptr [rip + 0x412b064]
0x2c3e61c: call 0x142773630
0x2c3e621: nop 
0x2c3e622: lea rax, [rip + 0x2935217]
0x2c3e629: mov qword ptr [rbp - 0x31], rax
0x2c3e62d: lea rax, [rip + 0x2ae7814]
0x2c3e634: mov qword ptr [rbp - 0x31], rax
0x2c3e638: cmp byte ptr [rbp - 0x21], 0
0x2c3e63c: je 0x142c3e6b2
0x2c3e63e: cmp byte ptr [rbp - 0x20], 0
0x2c3e642: jne 0x142c3e653
0x2c3e644: mov rcx, qword ptr [rbp - 0x29]
0x2c3e648: mov rax, qword ptr [rcx]
0x2c3e64b: call qword ptr [rax + 8]
0x2c3e64e: movzx edi, al
0x2c3e651: jmp 0x142c3e691
0x2c3e653: mov rdi, qword ptr [rbp - 0x29]
0x2c3e657: lea rbx, [rdi + 0x18]
0x2c3e65b: mov qword ptr [rbp + 0x67], rbx
0x2c3e65f: mov rax, qword ptr [rbx]
0x2c3e662: mov rcx, rbx
0x2c3e665: call qword ptr [rax + 8]
0x2c3e668: nop 
0x2c3e669: dec word ptr [rdi + 0x48]
0x2c3e66d: cmp byte ptr [rdi + 0x4a], 0
0x2c3e671: jne 0x142c3e685
0x2c3e673: lock xadd dword ptr [rdi + 0x10], r14d
0x2c3e679: add r14w, word ptr [rdi + 0x48]
0x2c3e67e: jne 0x142c3e685
0x2c3e680: mov dil, 1
0x2c3e683: jmp 0x142c3e688
0x2c3e685: xor dil, dil
0x2c3e688: mov rax, qword ptr [rbx]
0x2c3e68b: mov rcx, rbx
0x2c3e68e: call qword ptr [rax + 0x10]
0x2c3e691: test dil, dil
0x2c3e694: je 0x142c3e6ae
0x2c3e696: mov rcx, qword ptr [rbp - 0x29]
0x2c3e69a: mov edx, 1
0x2c3e69f: xor eax, eax
0x2c3e6a1: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x2c3e6a6: jne 0x142c3e6ae
0x2c3e6a8: mov rax, qword ptr [rcx]
0x2c3e6ab: call qword ptr [rax + 0x10]
0x2c3e6ae: mov byte ptr [rbp - 0x21], 0
0x2c3e6b2: add rsp, 0xe8
0x2c3e6b9: pop r15
0x2c3e6bb: pop r14
0x2c3e6bd: pop r13
0x2c3e6bf: pop r12
0x2c3e6c1: pop rdi
0x2c3e6c2: pop rsi
0x2c3e6c3: pop rbx
0x2c3e6c4: pop rbp
0x2c3e6c5: ret 