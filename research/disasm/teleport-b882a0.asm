0xb882a0: mov qword ptr [rsp + 8], rbx
0xb882a5: push rbp
0xb882a6: push rsi
0xb882a7: push rdi
0xb882a8: push r12
0xb882aa: push r13
0xb882ac: push r14
0xb882ae: push r15
0xb882b0: mov rbp, rsp
0xb882b3: sub rsp, 0x110
0xb882ba: mov rdi, r8
0xb882bd: mov rbx, rdx
0xb882c0: mov rsi, rcx
0xb882c3: xor edx, edx
0xb882c5: mov r14, qword ptr [r8 + 0x18]
0xb882c9: movzx ecx, word ptr [r14 + 3]
0xb882ce: movzx eax, word ptr [r8 + 0x10]
0xb882d3: sub rax, 5
0xb882d7: cmp rax, rcx
0xb882da: jne 0x140b8857d
0xb882e0: cmp byte ptr [r8 + 0x38], dl
0xb882e4: jne 0x140b882f4
0xb882e6: mov eax, 0x7fc1
0xb882eb: cmp ax, cx
0xb882ee: jb 0x140b8857d
0xb882f4: cmp byte ptr [rsi + 0x21], dl
0xb882f7: je 0x140b88300
0xb882f9: mov dword ptr [rbx], edx
0xb882fb: jmp 0x140b8862d
0xb88300: mov dword ptr [rbp + 0x58], edx
0xb88303: movzx ecx, word ptr [r14 + 3]
0xb88308: lea r12, [rip + 0x4b999b1]
0xb8830f: mov qword ptr [rbp - 0x80], r12
0xb88313: mov byte ptr [rbp - 0x78], dl
0xb88316: lea r13, [rip + 0x4b99943]
0xb8831d: mov qword ptr [rbp - 0x80], r13
0xb88321: lea rax, [r14 + 5]
0xb88325: mov qword ptr [rbp - 0x70], rax
0xb88329: mov dword ptr [rbp - 0x68], ecx
0xb8832c: mov dword ptr [rbp - 0x64], edx
0xb8832f: mov rax, qword ptr [rip + 0x61e0e52]
0xb88336: mov rsi, qword ptr [rax + 0x38]
0xb8833a: mov rax, qword ptr [rbp - 0x80]
0xb8833e: mov r9, qword ptr [rax + 8]
0xb88342: lea rax, [rip + 0x896f27]
0xb88349: mov r8d, 4
0xb8834f: lea rdx, [rbp + 0x58]
0xb88353: lea rcx, [rbp - 0x80]
0xb88357: cmp r9, rax
0xb8835a: jne 0x140b88363
0xb8835c: call 0x14141f270
0xb88361: jmp 0x140b88366
0xb88363: call r9
0xb88366: test al, al
0xb88368: jne 0x140b8837f
0xb8836a: mov eax, dword ptr [rip + 0x6153600]
0xb88370: mov dword ptr [rbx], eax
0xb88372: mov qword ptr [rbp - 0x80], r13
0xb88376: mov qword ptr [rbp - 0x80], r12
0xb8837a: jmp 0x140b8862d
0xb8837f: mov edx, dword ptr [rbp + 0x58]
0xb88382: test edx, edx
0xb88384: je 0x140b883b5
0xb88386: mov eax, edx
0xb88388: and eax, 0x30000000
0xb8838d: cmp eax, 0x10000000
0xb88392: je 0x140b883b5
0xb88394: mov rcx, rsi
0xb88397: call 0x1408b53c0
0xb8839c: test al, al
0xb8839e: je 0x140b883b5
0xb883a0: mov eax, dword ptr [rip + 0x615362a]
0xb883a6: mov dword ptr [rbx], eax
0xb883a8: mov qword ptr [rbp - 0x80], r13
0xb883ac: mov qword ptr [rbp - 0x80], r12
0xb883b0: jmp 0x140b8862d
0xb883b5: mov rax, qword ptr [rbp - 0x80]
0xb883b9: mov r9, qword ptr [rax + 8]
0xb883bd: lea rax, [rip - 0x82e824]
0xb883c4: cmp r9, rax
0xb883c7: je 0x140b88568
0xb883cd: mov r8d, 1
0xb883d3: lea rdx, [rbp + 0x50]
0xb883d7: lea rcx, [rbp - 0x80]
0xb883db: call r9
0xb883de: test al, al
0xb883e0: je 0x140b88568
0xb883e6: movzx eax, word ptr [r14 + 3]
0xb883eb: cmp dword ptr [rbp - 0x64], eax
0xb883ee: je 0x140b88405
0xb883f0: mov eax, dword ptr [rip + 0x615357a]
0xb883f6: mov dword ptr [rbx], eax
0xb883f8: mov qword ptr [rbp - 0x80], r13
0xb883fc: mov qword ptr [rbp - 0x80], r12
0xb88400: jmp 0x140b8862d
0xb88405: mov r8d, dword ptr [rbp + 0x58]
0xb88409: lea rdx, [rbp - 0x30]
0xb8840d: mov rcx, rsi
0xb88410: call 0x1408a67e0
0xb88415: nop 
0xb88416: cmp byte ptr [rbp - 0x20], 0
0xb8841a: je 0x140b88445
0xb8841c: mov rsi, qword ptr [rbp - 0x28]
0xb88420: mov rcx, rsi
0xb88423: call 0x140466060
0xb88428: test al, al
0xb8842a: je 0x140b88442
0xb8842c: mov rax, qword ptr [rsi + 0x68]
0xb88430: mov rcx, qword ptr [rax + 0x1a0]
0xb88437: mov rax, qword ptr [rcx]
0xb8843a: xor edx, edx
0xb8843c: call qword ptr [rax + 0x150]
0xb88442: mov qword ptr [rdi], rsi
0xb88445: mov rax, qword ptr [rdi]
0xb88448: test rax, rax
0xb8844b: je 0x140b88537
0xb88451: mov rax, qword ptr [rax + 0x68]
0xb88455: mov r14, qword ptr [rax + 0x1a0]
0xb8845c: movzx esi, byte ptr [rbp + 0x50]
0xb88460: mov rax, qword ptr [r14 + 8]
0xb88464: lea rdx, [rax + 8]
0xb88468: test rax, rax
0xb8846b: mov eax, 0
0xb88470: cmove rdx, rax
0xb88474: mov r8b, 1
0xb88477: mov rdx, qword ptr [rdx]
0xb8847a: lea rcx, [rbp - 0x40]
0xb8847e: call 0x140393650
0xb88483: nop 
0xb88484: mov rax, qword ptr [r14 + 8]
0xb88488: mov rcx, qword ptr [rax + 0x68]
0xb8848c: mov rax, qword ptr [rcx + 0x1a0]
0xb88493: movzx r15d, byte ptr [rax + 0x3dc]
0xb8849b: mov byte ptr [rax + 0x3dc], sil
0xb884a2: mov rdi, qword ptr [rbp - 0x40]
0xb884a6: mov rax, qword ptr [rdi]
0xb884a9: xor edx, edx
0xb884ab: mov rcx, rdi
0xb884ae: call qword ptr [rax + 0x20]
0xb884b1: cmp byte ptr [rbp - 0x38], 1
0xb884b5: jne 0x140b884e5
0xb884b7: mov eax, 0xffffffff
0xb884bc: lock xadd dword ptr [rdi + 8], eax
0xb884c1: cmp eax, 1
0xb884c4: jne 0x140b884d8
0xb884c6: test dword ptr [rdi + 0xc], 0x40000000
0xb884cd: je 0x140b884e5
0xb884cf: mov rax, qword ptr [rdi]
0xb884d2: mov rcx, rdi
0xb884d5: call qword ptr [rax + 0x40]
0xb884d8: test dword ptr [rdi + 0xc], 0x40000000
0xb884df: je 0x140b884e5
0xb884e1: lock dec dword ptr [rdi + 0xc]
0xb884e5: test r15b, r15b
0xb884e8: je 0x140b884f4
0xb884ea: xor dil, dil
0xb884ed: test sil, sil
0xb884f0: jne 0x140b88537
0xb884f2: jmp 0x140b884fc
0xb884f4: test sil, sil
0xb884f7: je 0x140b88537
0xb884f9: mov dil, 1
0xb884fc: mov rdx, qword ptr [r14 + 8]
0xb88500: mov rcx, qword ptr [rip + 0x61e0c89]
0xb88507: mov rcx, qword ptr [rcx + 0x30]
0xb8850b: call 0x1408b4160
0xb88510: test al, al
0xb88512: jne 0x140b88537
0xb88514: mov rax, qword ptr [r14 + 8]
0xb88518: mov rcx, qword ptr [rax + 0x68]
0xb8851c: mov byte ptr [rsp + 0x20], 0
0xb88521: vxorps xmm3, xmm3, xmm3
0xb88525: movzx r8d, dil
0xb88529: mov edx, 0x80
0xb8852e: mov rcx, qword ptr [rcx + 0x20]
0xb88532: call 0x141795490
0xb88537: xor eax, eax
0xb88539: mov dword ptr [rbx], eax
0xb8853b: lea rax, [rip + 0x49eb2fe]
0xb88542: mov qword ptr [rbp - 0x30], rax
0xb88546: lea rax, [rip + 0x4b9d8fb]
0xb8854d: mov qword ptr [rbp - 0x30], rax
0xb88551: lea rcx, [rbp - 0x30]
0xb88555: call 0x141434880
0xb8855a: nop 
0xb8855b: mov qword ptr [rbp - 0x80], r13
0xb8855f: mov qword ptr [rbp - 0x80], r12
0xb88563: jmp 0x140b8862d
0xb88568: mov eax, dword ptr [rip + 0x6153402]
0xb8856e: mov dword ptr [rbx], eax
0xb88570: mov qword ptr [rbp - 0x80], r13
0xb88574: mov qword ptr [rbp - 0x80], r12
0xb88578: jmp 0x140b8862d
0xb8857d: mov rdi, qword ptr [r8]
0xb88580: test rdi, rdi
0xb88583: je 0x140b88604
0xb88585: mov rax, qword ptr [rdi]
0xb88588: lea rdx, [rbp - 0x10]
0xb8858c: mov rcx, rdi
0xb8858f: call qword ptr [rax + 0xd0]
0xb88595: mov rdx, qword ptr [rax]
0xb88598: mov qword ptr [rbp - 0x60], rdx
0xb8859c: mov rax, qword ptr [rdi]
0xb8859f: lea rdx, [rbp - 0x40]
0xb885a3: mov rcx, rdi
0xb885a6: call qword ptr [rax + 0xd8]
0xb885ac: mov rdx, qword ptr [rax]
0xb885af: mov qword ptr [rbp - 0x50], rdx
0xb885b3: mov rax, qword ptr [rdi]
0xb885b6: mov rcx, rdi
0xb885b9: call qword ptr [rax + 0xc8]
0xb885bf: mov qword ptr [rbp - 0x48], rax
0xb885c3: lea rax, [rsi + 0xc]
0xb885c7: lea rcx, [rsi + 0x22]
0xb885cb: lea rdx, [rbp - 0x60]
0xb885cf: mov qword ptr [rsp + 0x80], rdx
0xb885d7: lea rdx, [rbp - 0x50]
0xb885db: mov qword ptr [rsp + 0x78], rdx
0xb885e0: lea rdx, [rbp - 0x48]
0xb885e4: mov qword ptr [rsp + 0x70], rdx
0xb885e9: mov qword ptr [rsp + 0x68], rax
0xb885ee: mov qword ptr [rsp + 0x60], rcx
0xb885f3: mov eax, dword ptr [rip + 0x615337b]
0xb885f9: mov dword ptr [rsp + 0x48], eax
0xb885fd: call 0x14143b450
0xb88602: jmp 0x140b88625
0xb88604: lea rax, [rsi + 0xc]
0xb88608: lea rcx, [rsi + 0x22]
0xb8860c: mov qword ptr [rsp + 0x68], rax
0xb88611: mov qword ptr [rsp + 0x60], rcx
0xb88616: mov eax, dword ptr [rip + 0x6153358]
0xb8861c: mov dword ptr [rsp + 0x48], eax
0xb88620: call 0x14143b670
0xb88625: mov eax, dword ptr [rip + 0x6153349]
0xb8862b: mov dword ptr [rbx], eax
0xb8862d: mov rax, rbx
0xb88630: mov rbx, qword ptr [rsp + 0x150]
0xb88638: add rsp, 0x110
0xb8863f: pop r15
0xb88641: pop r14
0xb88643: pop r13
0xb88645: pop r12
0xb88647: pop rdi
0xb88648: pop rsi
0xb88649: pop rbp
0xb8864a: ret 