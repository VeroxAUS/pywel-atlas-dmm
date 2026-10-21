0x2358ef0: mov qword ptr [rsp + 8], rcx
0x2358ef5: push rbp
0x2358ef6: push rbx
0x2358ef7: push rsi
0x2358ef8: push rdi
0x2358ef9: push r12
0x2358efb: push r13
0x2358efd: push r14
0x2358eff: push r15
0x2358f01: lea rbp, [rsp - 0x158]
0x2358f09: sub rsp, 0x258
0x2358f10: xor edi, edi
0x2358f12: lea rbx, [rcx + 0x20]
0x2358f16: mov rax, qword ptr [rbx + 0x108]
0x2358f1d: mov rcx, rbx
0x2358f20: test rax, rax
0x2358f23: cmovne rcx, rax
0x2358f27: call 0x141329600
0x2358f2c: test al, al
0x2358f2e: je 0x142359fd7
0x2358f34: mov qword ptr [rbp - 0x20], rdi
0x2358f38: mov qword ptr [rbp - 0x18], rdi
0x2358f3c: mov rax, qword ptr [rbx + 0x108]
0x2358f43: test rax, rax
0x2358f46: cmovne rbx, rax
0x2358f4a: xor r8d, r8d
0x2358f4d: lea rdx, [rbp - 0x20]
0x2358f51: mov rcx, rbx
0x2358f54: call 0x14132b420
0x2358f59: xor ecx, ecx
0x2358f5b: mov esi, ecx
0x2358f5d: mov qword ptr [rbp - 0x38], rcx
0x2358f61: mov edi, ecx
0x2358f63: mov qword ptr [rbp - 0x30], rcx
0x2358f67: mov r15d, ecx
0x2358f6a: mov r8d, ecx
0x2358f6d: mov qword ptr [rbp + 0x1b0], rcx
0x2358f74: mov qword ptr [rbp - 0x48], rcx
0x2358f78: mov r14d, ecx
0x2358f7b: mov qword ptr [rbp - 0x40], rcx
0x2358f7f: mov r13d, ecx
0x2358f82: mov qword ptr [rbp + 0x1b8], rcx
0x2358f89: mov qword ptr [rsp + 0x78], rcx
0x2358f8e: mov r12d, ecx
0x2358f91: mov qword ptr [rbp - 0x80], rcx
0x2358f95: mov r10d, ecx
0x2358f98: mov rbx, qword ptr [rbp - 0x20]
0x2358f9c: mov eax, dword ptr [rbp - 0x18]
0x2358f9f: lea r9, [rbx + rax*8]
0x2358fa3: mov qword ptr [rbp + 0x1a8], r9
0x2358faa: mov r11, 0xffffffffffffffff
0x2358fb1: cmp rbx, r9
0x2358fb4: je 0x142359297
0x2358fba: nop word ptr [rax + rax]
0x2358fc0: mov rdx, qword ptr [rbx]
0x2358fc3: mov rcx, qword ptr [rdx]
0x2358fc6: test rcx, rcx
0x2358fc9: je 0x1423590a8
0x2358fcf: cmp byte ptr [rcx], 0
0x2358fd2: je 0x1423590a8
0x2358fd8: mov eax, dword ptr [rdx + 8]
0x2358fdb: cmp eax, -1
0x2358fde: jne 0x142358fef
0x2358fe0: mov rax, r11
0x2358fe3: inc rax
0x2358fe6: cmp byte ptr [rcx + rax], 0
0x2358fea: jne 0x142358fe3
0x2358fec: mov dword ptr [rdx + 8], eax
0x2358fef: cmp eax, 4
0x2358ff2: jb 0x1423590a8
0x2358ff8: mov edx, eax
0x2358ffa: add rdx, rcx
0x2358ffd: xor ecx, ecx
0x2358fff: nop 
0x2359000: movzx eax, byte ptr [rdx + rcx - 4]
0x2359005: inc rcx
0x2359008: lea r8, [rip + 0x362abf5]
0x235900f: cmp al, byte ptr [r8 + rcx - 1]
0x2359014: mov r8, qword ptr [rbp + 0x1b0]
0x235901b: jne 0x1423590a8
0x2359021: cmp rcx, 5
0x2359025: jne 0x142359000
0x2359027: cmp r15d, edi
0x235902a: ja 0x142359076
0x235902c: lea edx, [r15*2 + 1]
0x2359034: add edx, r15d
0x2359037: shr edx, 1
0x2359039: cmp edx, 1
0x235903c: mov eax, 1
0x2359041: cmovb edx, eax
0x2359044: cmp edi, edx
0x2359046: cmova edx, edi
0x2359049: lea rcx, [rbp - 0x38]
0x235904d: call 0x14044b9e0
0x2359052: mov r15d, dword ptr [rbp - 0x2c]
0x2359056: mov edi, dword ptr [rbp - 0x30]
0x2359059: mov rsi, qword ptr [rbp - 0x38]
0x235905d: mov r8, qword ptr [rbp + 0x1b0]
0x2359064: mov r9, qword ptr [rbp + 0x1a8]
0x235906b: mov r10d, dword ptr [rbp - 0x7c]
0x235906f: mov r11, 0xffffffffffffffff
0x2359076: mov eax, edi
0x2359078: mov qword ptr [rsi + rax*8], 0
0x2359080: mov rcx, qword ptr [rbx]
0x2359083: mov qword ptr [rsi + rax*8], rcx
0x2359087: lea rax, [rip + 0x470c8b2]
0x235908e: cmp rcx, rax
0x2359091: je 0x14235909e
0x2359093: mov eax, dword ptr [rcx + 0x10]
0x2359096: test eax, eax
0x2359098: js 0x14235909e
0x235909a: lock inc dword ptr [rcx + 0x10]
0x235909e: inc edi
0x23590a0: mov dword ptr [rbp - 0x30], edi
0x23590a3: jmp 0x142359288
0x23590a8: mov rdx, qword ptr [rbx]
0x23590ab: mov rcx, qword ptr [rdx]
0x23590ae: test rcx, rcx
0x23590b1: je 0x14235919b
0x23590b7: cmp byte ptr [rcx], 0
0x23590ba: je 0x14235919b
0x23590c0: mov eax, dword ptr [rdx + 8]
0x23590c3: cmp eax, -1
0x23590c6: jne 0x1423590dc
0x23590c8: mov rax, r11
0x23590cb: nop dword ptr [rax + rax]
0x23590d0: inc rax
0x23590d3: cmp byte ptr [rcx + rax], 0
0x23590d7: jne 0x1423590d0
0x23590d9: mov dword ptr [rdx + 8], eax
0x23590dc: cmp eax, 7
0x23590df: jb 0x14235919b
0x23590e5: mov edx, eax
0x23590e7: add rdx, rcx
0x23590ea: xor ecx, ecx
0x23590ec: nop dword ptr [rax]
0x23590f0: movzx eax, byte ptr [rdx + rcx - 7]
0x23590f5: inc rcx
0x23590f8: lea r10, [rip + 0x362ad51]
0x23590ff: cmp al, byte ptr [r10 + rcx - 1]
0x2359104: mov r10d, dword ptr [rbp - 0x7c]
0x2359108: jne 0x14235919b
0x235910e: cmp rcx, 8
0x2359112: jne 0x1423590f0
0x2359114: cmp r13d, r14d
0x2359117: ja 0x142359166
0x2359119: lea edx, [r13*2 + 1]
0x2359121: add edx, r13d
0x2359124: shr edx, 1
0x2359126: cmp edx, 1
0x2359129: mov eax, 1
0x235912e: cmovb edx, eax
0x2359131: cmp r14d, edx
0x2359134: cmova edx, r14d
0x2359138: lea rcx, [rbp - 0x48]
0x235913c: call 0x14044b9e0
0x2359141: mov r13d, dword ptr [rbp - 0x3c]
0x2359145: mov r14d, dword ptr [rbp - 0x40]
0x2359149: mov r8, qword ptr [rbp - 0x48]
0x235914d: mov qword ptr [rbp + 0x1b0], r8
0x2359154: mov r9, qword ptr [rbp + 0x1a8]
0x235915b: mov r10d, dword ptr [rbp - 0x7c]
0x235915f: mov r11, 0xffffffffffffffff
0x2359166: mov eax, r14d
0x2359169: mov qword ptr [r8 + rax*8], 0
0x2359171: mov rcx, qword ptr [rbx]
0x2359174: mov qword ptr [r8 + rax*8], rcx
0x2359178: lea rax, [rip + 0x470c7c1]
0x235917f: cmp rcx, rax
0x2359182: je 0x14235918f
0x2359184: mov eax, dword ptr [rcx + 0x10]
0x2359187: test eax, eax
0x2359189: js 0x14235918f
0x235918b: lock inc dword ptr [rcx + 0x10]
0x235918f: inc r14d
0x2359192: mov dword ptr [rbp - 0x40], r14d
0x2359196: jmp 0x142359288
0x235919b: mov rdx, qword ptr [rbx]
0x235919e: mov rcx, qword ptr [rdx]
0x23591a1: test rcx, rcx
0x23591a4: je 0x1423591f8
0x23591a6: cmp byte ptr [rcx], 0
0x23591a9: je 0x1423591f8
0x23591ab: mov eax, dword ptr [rdx + 8]
0x23591ae: cmp eax, -1
0x23591b1: jne 0x1423591c2
0x23591b3: mov rax, r11
0x23591b6: inc rax
0x23591b9: cmp byte ptr [rcx + rax], 0
0x23591bd: jne 0x1423591b6
0x23591bf: mov dword ptr [rdx + 8], eax
0x23591c2: cmp eax, 7
0x23591c5: jb 0x1423591f8
0x23591c7: mov edx, eax
0x23591c9: add rdx, rcx
0x23591cc: xor ecx, ecx
0x23591ce: nop 
0x23591d0: movzx eax, byte ptr [rdx + rcx - 7]
0x23591d5: inc rcx
0x23591d8: lea r9, [rip + 0x362a9e1]
0x23591df: cmp al, byte ptr [r9 + rcx - 1]
0x23591e4: mov r9, qword ptr [rbp + 0x1a8]
0x23591eb: jne 0x1423591f8
0x23591ed: cmp rcx, 8
0x23591f1: jne 0x1423591d0
0x23591f3: jmp 0x142359288
0x23591f8: cmp r10d, r12d
0x23591fb: ja 0x142359251
0x23591fd: lea edx, [r10*2 + 1]
0x2359205: add edx, r10d
0x2359208: shr edx, 1
0x235920a: cmp edx, 1
0x235920d: mov eax, 1
0x2359212: cmovb edx, eax
0x2359215: cmp r12d, edx
0x2359218: cmova edx, r12d
0x235921c: lea rcx, [rsp + 0x78]
0x2359221: call 0x14044b9e0
0x2359226: mov r12d, dword ptr [rbp - 0x80]
0x235922a: mov rdx, qword ptr [rsp + 0x78]
0x235922f: mov qword ptr [rbp + 0x1b8], rdx
0x2359236: mov r8, qword ptr [rbp + 0x1b0]
0x235923d: mov r9, qword ptr [rbp + 0x1a8]
0x2359244: mov r10d, dword ptr [rbp - 0x7c]
0x2359248: mov r11, 0xffffffffffffffff
0x235924f: jmp 0x142359258
0x2359251: mov rdx, qword ptr [rbp + 0x1b8]
0x2359258: mov eax, r12d
0x235925b: mov qword ptr [rdx + rax*8], 0
0x2359263: mov rcx, qword ptr [rbx]
0x2359266: mov qword ptr [rdx + rax*8], rcx
0x235926a: lea rax, [rip + 0x470c6cf]
0x2359271: cmp rcx, rax
0x2359274: je 0x142359281
0x2359276: mov eax, dword ptr [rcx + 0x10]
0x2359279: test eax, eax
0x235927b: js 0x142359281
0x235927d: lock inc dword ptr [rcx + 0x10]
0x2359281: inc r12d
0x2359284: mov dword ptr [rbp - 0x80], r12d
0x2359288: add rbx, 8
0x235928c: cmp rbx, r9
0x235928f: jne 0x142358fc0
0x2359295: xor ecx, ecx
0x2359297: mov eax, edi
0x2359299: lea rdi, [rsi + rax*8]
0x235929d: cmp rsi, rdi
0x23592a0: je 0x142359338
0x23592a6: nop word ptr [rax + rax]
0x23592b0: mov rax, qword ptr [rsi]
0x23592b3: mov rdx, qword ptr [rax]
0x23592b6: mov qword ptr [rbp + 0x128], rcx
0x23592bd: mov qword ptr [rbp + 0x130], 0x105
0x23592c8: mov dword ptr [rbp + 0x134], ecx
0x23592ce: mov byte ptr [rbp + 0x20], 0
0x23592d2: mov r8, r11
0x23592d5: inc r8
0x23592d8: cmp byte ptr [rdx + r8], 0
0x23592dd: jne 0x1423592d5
0x23592df: mov dword ptr [rbp + 0x134], ecx
0x23592e5: mov byte ptr [rbp + 0x20], 0
0x23592e9: mov rax, qword ptr [rbp + 0x128]
0x23592f0: test rax, rax
0x23592f3: je 0x1423592f8
0x23592f5: mov byte ptr [rax], 0
0x23592f8: lea rcx, [rbp + 0x20]
0x23592fc: call 0x140393f50
0x2359301: nop 
0x2359302: lea rdx, [rbp + 0x20]
0x2359306: call 0x142358a20
0x235930b: movzx ebx, al
0x235930e: lea rcx, [rbp + 0x20]
0x2359312: call 0x140394170
0x2359317: test bl, bl
0x2359319: je 0x1423593a0
0x235931f: add rsi, 8
0x2359323: cmp rsi, rdi
0x2359326: mov ecx, 0
0x235932b: mov r11, 0xffffffffffffffff
0x2359332: jne 0x1423592b0
0x2359338: mov eax, r14d
0x235933b: mov r14, qword ptr [rbp + 0x1b0]
0x2359342: lea r13, [r14 + rax*8]
0x2359346: cmp r14, r13
0x2359349: je 0x1423596a3
0x235934f: nop 
0x2359350: xor esi, esi
0x2359352: mov qword ptr [rsp + 0x70], rsi
0x2359357: mov rcx, qword ptr [r14]
0x235935a: mov qword ptr [rsp + 0x70], rcx
0x235935f: lea rax, [rip + 0x470c5da]
0x2359366: cmp rcx, rax
0x2359369: je 0x142359376
0x235936b: mov eax, dword ptr [rcx + 0x10]
0x235936e: test eax, eax
0x2359370: js 0x142359376
0x2359372: lock inc dword ptr [rcx + 0x10]
0x2359376: mov rax, qword ptr [rcx]
0x2359379: test rax, rax
0x235937c: je 0x1423593ea
0x235937e: cmp byte ptr [rax], 0
0x2359381: je 0x1423593ea
0x2359383: mov edx, dword ptr [rcx + 8]
0x2359386: cmp edx, -1
0x2359389: jne 0x1423593ec
0x235938b: mov rdx, 0xffffffffffffffff
0x2359392: inc rdx
0x2359395: cmp byte ptr [rax + rdx], 0
0x2359399: jne 0x142359392
0x235939b: mov dword ptr [rcx + 8], edx
0x235939e: jmp 0x1423593ec
0x23593a0: lea rax, [rip + 0x362aab1]
0x23593a7: mov qword ptr [rsp + 0x58], rax
0x23593ac: mov dword ptr [rsp + 0x50], 6
0x23593b4: xor eax, eax
0x23593b6: mov dword ptr [rsp + 0x48], eax
0x23593ba: lea rsi, [rip + 0x321a0eb]
0x23593c1: mov qword ptr [rsp + 0x40], rsi
0x23593c6: mov dword ptr [rsp + 0x38], eax
0x23593ca: mov qword ptr [rsp + 0x30], rsi
0x23593cf: mov qword ptr [rsp + 0x28], rsi
0x23593d4: mov qword ptr [rsp + 0x20], rsi
0x23593d9: mov r9, rsi
0x23593dc: mov cl, 1
0x23593de: call 0x14035d8d0
0x23593e3: xor bl, bl
0x23593e5: jmp 0x142359fac
0x23593ea: mov edx, esi
0x23593ec: add edx, -7
0x23593ef: mov r8d, 7
0x23593f5: lea rcx, [rsp + 0x70]
0x23593fa: call 0x14141ff90
0x23593ff: xor r15b, r15b
0x2359402: mov rbx, qword ptr [rsp + 0x70]
0x2359407: mov rcx, qword ptr [rbx]
0x235940a: call 0x141329600
0x235940f: test al, al
0x2359411: je 0x1423594e3
0x2359417: mov rdx, qword ptr [rbx]
0x235941a: mov qword ptr [rbp + 0x128], rsi
0x2359421: mov qword ptr [rbp + 0x130], 0x105
0x235942c: mov dword ptr [rbp + 0x134], esi
0x2359432: mov byte ptr [rbp + 0x20], r15b
0x2359436: mov r8, 0xffffffffffffffff
0x235943d: nop dword ptr [rax]
0x2359440: inc r8
0x2359443: cmp byte ptr [rdx + r8], 0
0x2359448: jne 0x142359440
0x235944a: mov dword ptr [rbp + 0x134], esi
0x2359450: mov byte ptr [rbp + 0x20], 0
0x2359454: mov rax, qword ptr [rbp + 0x128]
0x235945b: test rax, rax
0x235945e: je 0x142359463
0x2359460: mov byte ptr [rax], 0
0x2359463: lea rcx, [rbp + 0x20]
0x2359467: call 0x140393f50
0x235946c: nop 
0x235946d: lea rdx, [rbp + 0x20]
0x2359471: call 0x142358a20
0x2359476: movzx edi, al
0x2359479: mov rcx, qword ptr [rbp + 0x128]
0x2359480: test rcx, rcx
0x2359483: je 0x1423594b0
0x2359485: mov eax, 0x1fd
0x235948a: mov rdx, qword ptr gs:[0x58]
0x2359493: mov r8, qword ptr [rdx]
0x2359496: cmp byte ptr [rax + r8], 0
0x235949b: je 0x1423594a4
0x235949d: call 0x1447f03bc
0x23594a2: jmp 0x1423594a9
0x23594a4: call 0x1447f02bc
0x23594a9: mov qword ptr [rbp + 0x128], rsi
0x23594b0: test dil, dil
0x23594b3: jne 0x1423594e6
0x23594b5: lea rax, [rip + 0x362a9c4]
0x23594bc: mov qword ptr [rsp + 0x58], rax
0x23594c1: mov dword ptr [rsp + 0x50], 6
0x23594c9: mov dword ptr [rsp + 0x48], esi
0x23594cd: lea rsi, [rip + 0x3219fd8]
0x23594d4: mov qword ptr [rsp + 0x40], rsi
0x23594d9: mov dword ptr [rsp + 0x38], 0
0x23594e1: jmp 0x142359540
0x23594e3: mov r15b, 1
0x23594e6: mov rsi, qword ptr [rbx]
0x23594e9: mov rax, qword ptr [r14]
0x23594ec: mov r14, qword ptr [rax]
0x23594ef: xor edi, edi
0x23594f1: mov rdx, rsi
0x23594f4: mov rcx, r14
0x23594f7: call 0x141329eb0
0x23594fc: test al, al
0x23594fe: jne 0x1423595c1
0x2359504: mov ecx, 7
0x2359509: call qword ptr [rip + 0x2e91f81]
0x235950f: inc edi
0x2359511: cmp edi, 4
0x2359514: jb 0x1423594f1
0x2359516: lea rax, [rip + 0x362a993]
0x235951d: mov qword ptr [rsp + 0x58], rax
0x2359522: mov dword ptr [rsp + 0x50], 6
0x235952a: xor eax, eax
0x235952c: mov dword ptr [rsp + 0x48], eax
0x2359530: lea rsi, [rip + 0x3219f75]
0x2359537: mov qword ptr [rsp + 0x40], rsi
0x235953c: mov dword ptr [rsp + 0x38], eax
0x2359540: mov qword ptr [rsp + 0x30], rsi
0x2359545: mov qword ptr [rsp + 0x28], rsi
0x235954a: mov qword ptr [rsp + 0x20], rsi
0x235954f: mov r9, rsi
0x2359552: mov cl, 1
0x2359554: call 0x14035d8d0
0x2359559: nop 
0x235955a: lea rdi, [rip + 0x470c3df]
0x2359561: cmp rbx, rdi
0x2359564: je 0x1423597a4
0x235956a: mov eax, dword ptr [rbx + 0x10]
0x235956d: test eax, eax
0x235956f: js 0x1423597a4
0x2359575: mov rax, 0xffffffffffffffff
0x235957c: lock xadd dword ptr [rbx + 0x10], eax
0x2359581: cmp eax, 1
0x2359584: jne 0x1423597a4
0x235958a: mov rcx, rbx
0x235958d: call 0x141420360
0x2359592: mov edx, 0x1fd
0x2359597: mov rax, qword ptr gs:[0x58]
0x23595a0: mov rcx, qword ptr [rax]
0x23595a3: cmp byte ptr [rdx + rcx], 0
0x23595a7: mov rcx, rbx
0x23595aa: je 0x14235979f
0x23595b0: call 0x1447f03bc
0x23595b5: mov qword ptr [rsp + 0x70], rdi
0x23595ba: xor bl, bl
0x23595bc: jmp 0x142359fac
0x23595c1: test r15b, r15b
0x23595c4: je 0x142359633
0x23595c6: mov eax, dword ptr [rbp - 0x7c]
0x23595c9: cmp eax, r12d
0x23595cc: ja 0x142359605
0x23595ce: lea edx, [rax*2 + 1]
0x23595d5: add edx, eax
0x23595d7: shr edx, 1
0x23595d9: cmp edx, 1
0x23595dc: mov eax, 1
0x23595e1: cmovb edx, eax
0x23595e4: cmp r12d, edx
0x23595e7: cmova edx, r12d
0x23595eb: lea rcx, [rsp + 0x78]
0x23595f0: call 0x14044b9e0
0x23595f5: mov r12d, dword ptr [rbp - 0x80]
0x23595f9: mov rax, qword ptr [rsp + 0x78]
0x23595fe: mov qword ptr [rbp + 0x1b8], rax
0x2359605: mov eax, r12d
0x2359608: mov rcx, qword ptr [rbp + 0x1b8]
0x235960f: mov qword ptr [rcx + rax*8], rbx
0x2359613: lea rsi, [rip + 0x470c326]
0x235961a: cmp rbx, rsi
0x235961d: je 0x14235962a
0x235961f: mov eax, dword ptr [rbx + 0x10]
0x2359622: test eax, eax
0x2359624: js 0x14235962a
0x2359626: lock inc dword ptr [rbx + 0x10]
0x235962a: inc r12d
0x235962d: mov dword ptr [rbp - 0x80], r12d
0x2359631: jmp 0x14235963a
0x2359633: lea rsi, [rip + 0x470c306]
0x235963a: cmp rbx, rsi
0x235963d: je 0x142359683
0x235963f: mov eax, dword ptr [rbx + 0x10]
0x2359642: test eax, eax
0x2359644: js 0x142359683
0x2359646: mov eax, 0xffffffff
0x235964b: lock xadd dword ptr [rbx + 0x10], eax
0x2359650: cmp eax, 1
0x2359653: jne 0x142359683
0x2359655: mov rcx, rbx
0x2359658: call 0x141420360
0x235965d: mov edx, 0x1fd
0x2359662: mov rax, qword ptr gs:[0x58]
0x235966b: mov rcx, qword ptr [rax]
0x235966e: cmp byte ptr [rdx + rcx], 0
0x2359672: mov rcx, rbx
0x2359675: je 0x14235967e
0x2359677: call 0x1447f03bc
0x235967c: jmp 0x142359683
0x235967e: call 0x1447f02bc
0x2359683: mov qword ptr [rsp + 0x70], rsi
0x2359688: mov r14, qword ptr [rbp + 0x1b0]
0x235968f: add r14, 8
0x2359693: mov qword ptr [rbp + 0x1b0], r14
0x235969a: cmp r14, r13
0x235969d: jne 0x142359350
0x23596a3: mov r13, qword ptr [rbp + 0x1a0]
0x23596aa: mov rcx, r13
0x23596ad: call 0x142358d40
0x23596b2: mov eax, r12d
0x23596b5: mov rbx, qword ptr [rbp + 0x1b8]
0x23596bc: lea rax, [rbx + rax*8]
0x23596c0: mov qword ptr [rbp], rax
0x23596c4: cmp rbx, rax
0x23596c7: je 0x142359f9d
0x23596cd: lea rsi, [rip + 0x3219dd8]
0x23596d4: nop dword ptr [rax]
0x23596d8: nop dword ptr [rax + rax]
0x23596e0: mov rdx, qword ptr [rbx]
0x23596e3: mov rdx, qword ptr [rdx]
0x23596e6: lea rcx, [rbp + 0x1b0]
0x23596ed: call 0x1414227b0
0x23596f2: nop 
0x23596f3: mov rax, qword ptr [rbp + 0x1b0]
0x23596fa: mov rdx, qword ptr [rax]
0x23596fd: test rdx, rdx
0x2359700: je 0x142359751
0x2359702: cmp byte ptr [rdx], 0
0x2359705: je 0x142359751
0x2359707: mov ecx, dword ptr [rax + 8]
0x235970a: cmp ecx, -1
0x235970d: jne 0x142359722
0x235970f: mov rcx, 0xffffffffffffffff
0x2359716: inc rcx
0x2359719: cmp byte ptr [rdx + rcx], 0
0x235971d: jne 0x142359716
0x235971f: mov dword ptr [rax + 8], ecx
0x2359722: cmp ecx, 1
0x2359725: jb 0x142359751
0x2359727: mov edi, 1
0x235972c: mov r8d, edi
0x235972f: lea rcx, [rip + 0x3223636]
0x2359736: call qword ptr [rip + 0x2e92df4]
0x235973c: test eax, eax
0x235973e: jne 0x142359751
0x2359740: mov r8d, edi
0x2359743: xor edx, edx
0x2359745: lea rcx, [rbp + 0x1b0]
0x235974c: call 0x14141ff90
0x2359751: xor edi, edi
0x2359753: mov qword ptr [rbp - 0x60], rdi
0x2359757: mov qword ptr [rbp - 0x58], rdi
0x235975b: mov rcx, qword ptr [rbx]
0x235975e: lea r8, [rbp - 0x60]
0x2359762: mov rcx, qword ptr [rcx]
0x2359765: call 0x14132b030
0x235976a: mov r15d, dword ptr [rbp - 0x58]
0x235976e: test r15d, r15d
0x2359771: jne 0x14235982a
0x2359777: mov rcx, qword ptr [rbp - 0x60]
0x235977b: mov r14d, 0x1fd
0x2359781: test rcx, rcx
0x2359784: je 0x1423597b5
0x2359786: mov rax, qword ptr gs:[0x58]
0x235978f: mov rdx, qword ptr [rax]
0x2359792: cmp byte ptr [r14 + rdx], r15b
0x2359796: je 0x1423597b0
0x2359798: call 0x1447f03bc
0x235979d: jmp 0x1423597b5
0x235979f: call 0x1447f02bc
0x23597a4: mov qword ptr [rsp + 0x70], rdi
0x23597a9: xor bl, bl
0x23597ab: jmp 0x142359fac
0x23597b0: call 0x1447f02bc
0x23597b5: mov qword ptr [rbp - 0x60], rdi
0x23597b9: mov qword ptr [rbp - 0x58], rdi
0x23597bd: mov rbx, qword ptr [rbp + 0x1b0]
0x23597c4: lea rax, [rip + 0x470c175]
0x23597cb: cmp rbx, rax
0x23597ce: je 0x142359f73
0x23597d4: mov eax, dword ptr [rbx + 0x10]
0x23597d7: test eax, eax
0x23597d9: js 0x142359f73
0x23597df: mov eax, 0xffffffff
0x23597e4: lock xadd dword ptr [rbx + 0x10], eax
0x23597e9: cmp eax, 1
0x23597ec: jne 0x142359f73
0x23597f2: test rbx, rbx
0x23597f5: je 0x142359f73
0x23597fb: mov rcx, rbx
0x23597fe: call 0x141420360
0x2359803: mov r8d, r14d
0x2359806: mov rax, qword ptr gs:[0x58]
0x235980f: mov rdx, qword ptr [rax]
0x2359812: mov rcx, rbx
0x2359815: cmp byte ptr [r8 + rdx], 0
0x235981a: je 0x142359987
0x2359820: call 0x1447f03bc
0x2359825: jmp 0x142359f73
0x235982a: mov rax, qword ptr [rbp + 0x1b0]
0x2359831: mov r8, qword ptr [rax]
0x2359834: mov rbx, qword ptr [r13 + 0x10]
0x2359838: mov qword ptr [rbp + 0x10], r8
0x235983c: test r8, r8
0x235983f: jne 0x142359845
0x2359841: mov ecx, edi
0x2359843: jmp 0x14235985a
0x2359845: mov rcx, 0xffffffffffffffff
0x235984c: nop dword ptr [rax]
0x2359850: inc rcx
0x2359853: cmp byte ptr [r8 + rcx], 0
0x2359858: jne 0x142359850
0x235985a: mov dword ptr [rbp + 0x18], ecx
0x235985d: vmovups xmm0, xmmword ptr [rbp + 0x10]
0x2359862: vmovdqa xmmword ptr [rbp + 0x140], xmm0
0x235986a: cmp dword ptr [rbx + 0x1c], 0
0x235986e: je 0x142359998
0x2359874: lea rax, [rbp + 0x140]
0x235987b: mov qword ptr [rbp - 0x50], rax
0x235987f: mov edx, ecx
0x2359881: mov rcx, r8
0x2359884: call 0x141364780
0x2359889: lea r9, [rbp + 0x1a8]
0x2359890: lea r8, [rbp - 0x50]
0x2359894: mov edx, eax
0x2359896: lea rcx, [rbx + 0x18]
0x235989a: call 0x140612620
0x235989f: test rax, rax
0x23598a2: je 0x142359991
0x23598a8: add rax, 0x10
0x23598ac: je 0x142359991
0x23598b2: cmp qword ptr [rax], 0
0x23598b6: je 0x142359991
0x23598bc: mov r14, qword ptr [rbp - 0x60]
0x23598c0: test r14, r14
0x23598c3: je 0x14235990c
0x23598c5: test r15d, r15d
0x23598c8: je 0x1423598e2
0x23598ca: mov rbx, r14
0x23598cd: mov rdi, r15
0x23598d0: mov rcx, rbx
0x23598d3: call 0x140394db0
0x23598d8: add rbx, 8
0x23598dc: sub rdi, 1
0x23598e0: jne 0x1423598d0
0x23598e2: mov r15d, 0x1fd
0x23598e8: mov rax, qword ptr gs:[0x58]
0x23598f1: mov rdx, qword ptr [rax]
0x23598f4: mov rcx, r14
0x23598f7: cmp byte ptr [r15 + rdx], 0
0x23598fc: je 0x142359905
0x23598fe: call 0x1447f03bc
0x2359903: jmp 0x142359912
0x2359905: call 0x1447f02bc
0x235990a: jmp 0x142359912
0x235990c: mov r15d, 0x1fd
0x2359912: mov qword ptr [rbp - 0x60], rdi
0x2359916: mov qword ptr [rbp - 0x58], 0
0x235991e: mov rbx, qword ptr [rbp + 0x1b0]
0x2359925: lea rax, [rip + 0x470c014]
0x235992c: cmp rbx, rax
0x235992f: je 0x142359f73
0x2359935: mov eax, dword ptr [rbx + 0x10]
0x2359938: test eax, eax
0x235993a: js 0x142359f73
0x2359940: mov eax, 0xffffffff
0x2359945: lock xadd dword ptr [rbx + 0x10], eax
0x235994a: cmp eax, 1
0x235994d: jne 0x142359f73
0x2359953: test rbx, rbx
0x2359956: je 0x142359f73
0x235995c: mov rcx, rbx
0x235995f: call 0x141420360
0x2359964: mov r8d, r15d
0x2359967: mov rax, qword ptr gs:[0x58]
0x2359970: mov rdx, qword ptr [rax]
0x2359973: mov rcx, rbx
0x2359976: cmp byte ptr [r8 + rdx], 0
0x235997b: je 0x142359987
0x235997d: call 0x1447f03bc
0x2359982: jmp 0x142359f73
0x2359987: call 0x1447f02bc
0x235998c: jmp 0x142359f73
0x2359991: mov rax, qword ptr [rbp + 0x1b0]
0x2359998: mov rbx, qword ptr [r13 + 0x10]
0x235999c: mov rdi, qword ptr [rax]
0x235999f: xor eax, eax
0x23599a1: mov qword ptr [rbp + 0x128], rax
0x23599a8: mov qword ptr [rbp + 0x130], 0x105
0x23599b3: mov dword ptr [rbp + 0x134], eax
0x23599b9: mov byte ptr [rbp + 0x20], al
0x23599bc: mov dword ptr [rbp + 0x134], eax
0x23599c2: mov byte ptr [rbp + 0x20], al
0x23599c5: mov rax, qword ptr [rbp + 0x128]
0x23599cc: test rax, rax
0x23599cf: je 0x1423599d4
0x23599d1: mov byte ptr [rax], 0
0x23599d4: call 0x141328b70
0x23599d9: mov qword ptr [rbp + 0x1a8], rax
0x23599e0: mov dword ptr [rbp + 0x134], 0xffffffff
0x23599ea: lea rcx, [rbp + 0x20]
0x23599ee: mov rax, qword ptr [rbp + 0x128]
0x23599f5: test rax, rax
0x23599f8: cmovne rcx, rax
0x23599fc: lea r9, [rbp + 0x1a8]
0x2359a03: lea r8, [rip + 0x362a16e]
0x2359a0a: mov edx, dword ptr [rbp + 0x130]
0x2359a10: call 0x14035ee40
0x2359a15: lea r8, [rbp + 0x20]
0x2359a19: mov rax, qword ptr [rbp + 0x128]
0x2359a20: test rax, rax
0x2359a23: cmovne r8, rax
0x2359a27: mov byte ptr [rsp + 0x28], 0
0x2359a2c: mov qword ptr [rsp + 0x20], r8
0x2359a31: mov rdx, rdi
0x2359a34: mov rcx, rbx
0x2359a37: call 0x142355bb0
0x2359a3c: mov rbx, rax
0x2359a3f: mov qword ptr [rbp - 0x50], rax
0x2359a43: mov rcx, qword ptr [rbp + 0x128]
0x2359a4a: test rcx, rcx
0x2359a4d: je 0x142359a87
0x2359a4f: mov eax, 0x1fd
0x2359a54: mov rdx, qword ptr gs:[0x58]
0x2359a5d: mov r8, qword ptr [rdx]
0x2359a60: cmp byte ptr [rax + r8], 0
0x2359a65: je 0x142359a77
0x2359a67: call 0x1447f03bc
0x2359a6c: xor edi, edi
0x2359a6e: mov qword ptr [rbp + 0x128], rdi
0x2359a75: jmp 0x142359a89
0x2359a77: call 0x1447f02bc
0x2359a7c: xor edi, edi
0x2359a7e: mov qword ptr [rbp + 0x128], rdi
0x2359a85: jmp 0x142359a89
0x2359a87: xor edi, edi
0x2359a89: mov r13b, 1
0x2359a8c: mov r12, qword ptr [rbp - 0x60]
0x2359a90: lea rax, [r12 + r15*8]
0x2359a94: mov qword ptr [rbp - 8], rax
0x2359a98: cmp r12, rax
0x2359a9b: je 0x142359efd
0x2359aa1: call 0x141326340
0x2359aa6: mov r14, rax
0x2359aa9: mov r8, qword ptr [r12]
0x2359aad: mov r8, qword ptr [r8]
0x2359ab0: lea rdx, [rbp - 0x28]
0x2359ab4: mov rcx, rax
0x2359ab7: call 0x141326620
0x2359abc: nop 
0x2359abd: mov rcx, qword ptr [rbp - 0x28]
0x2359ac1: test rcx, rcx
0x2359ac4: jne 0x142359b08
0x2359ac6: lea rax, [rip + 0x362a1c3]
0x2359acd: mov qword ptr [rsp + 0x58], rax
0x2359ad2: mov dword ptr [rsp + 0x50], 6
0x2359ada: mov dword ptr [rsp + 0x48], edi
0x2359ade: mov qword ptr [rsp + 0x40], rsi
0x2359ae3: mov dword ptr [rsp + 0x38], edi
0x2359ae7: mov qword ptr [rsp + 0x30], rsi
0x2359aec: mov qword ptr [rsp + 0x28], rsi
0x2359af1: mov qword ptr [rsp + 0x20], rsi
0x2359af6: mov r9, rsi
0x2359af9: mov cl, 1
0x2359afb: call 0x14035d8d0
0x2359b00: xor r13b, r13b
0x2359b03: jmp 0x142359ee2
0x2359b08: mov r15d, 0x80
0x2359b0e: cmp qword ptr [rcx + 0x10], r15
0x2359b12: jae 0x142359b1d
0x2359b14: lea rax, [rip + 0x3629fe5]
0x2359b1b: jmp 0x142359acd
0x2359b1d: mov qword ptr [rbp - 0x78], rdi
0x2359b21: mov qword ptr [rbp - 0x70], 0
0x2359b29: mov byte ptr [rbp - 0x68], 0xff
0x2359b2d: mov rbx, qword ptr [rbp - 0x28]
0x2359b31: mov r8, rsi
0x2359b34: mov edx, r15d
0x2359b37: lea rcx, [rbp - 0x78]
0x2359b3b: call 0x141326400
0x2359b40: mov rax, qword ptr [r14]
0x2359b43: mov byte ptr [rsp + 0x30], 0
0x2359b48: mov dword ptr [rsp + 0x28], edi
0x2359b4c: mov dword ptr [rsp + 0x20], r15d
0x2359b51: mov r15d, dword ptr [rbp - 0x70]
0x2359b55: mov r9d, r15d
0x2359b58: mov rdi, qword ptr [rbp - 0x78]
0x2359b5c: mov r8, rdi
0x2359b5f: mov rdx, rbx
0x2359b62: mov rcx, r14
0x2359b65: call qword ptr [rax + 0x10]
0x2359b68: test al, al
0x2359b6a: jne 0x142359c18
0x2359b70: lea rcx, [rbp - 0x78]
0x2359b74: call 0x1413739b0
0x2359b79: lea rax, [rip + 0x362a128]
0x2359b80: mov qword ptr [rsp + 0x58], rax
0x2359b85: mov dword ptr [rsp + 0x50], 6
0x2359b8d: xor edi, edi
0x2359b8f: mov dword ptr [rsp + 0x48], edi
0x2359b93: mov qword ptr [rsp + 0x40], rsi
0x2359b98: mov dword ptr [rsp + 0x38], edi
0x2359b9c: mov qword ptr [rsp + 0x30], rsi
0x2359ba1: mov qword ptr [rsp + 0x28], rsi
0x2359ba6: mov qword ptr [rsp + 0x20], rsi
0x2359bab: mov r9, rsi
0x2359bae: mov cl, 1
0x2359bb0: call 0x14035d8d0
0x2359bb5: xor r13b, r13b
0x2359bb8: movsx eax, byte ptr [rbp - 0x68]
0x2359bbc: cmp al, 0xff
0x2359bbe: je 0x142359bd2
0x2359bc0: mov edx, dword ptr [rbp - 0x70]
0x2359bc3: neg edx
0x2359bc5: mov ecx, eax
0x2359bc7: lea rax, [rip + 0x497f652]
0x2359bce: lock add dword ptr [rax + rcx*4], edx
0x2359bd2: mov rcx, qword ptr [rbp - 0x78]
0x2359bd6: test rcx, rcx
0x2359bd9: je 0x142359c0f
0x2359bdb: mov r8d, 0x1fd
0x2359be1: mov rax, qword ptr gs:[0x58]
0x2359bea: mov rdx, qword ptr [rax]
0x2359bed: cmp byte ptr [r8 + rdx], 0
0x2359bf2: je 0x142359c06
0x2359bf4: call 0x1447f03bc
0x2359bf9: mov qword ptr [rbp - 0x78], rdi
0x2359bfd: mov qword ptr [rbp - 0x70], rdi
0x2359c01: jmp 0x142359ee2
0x2359c06: call 0x1447f02bc
0x2359c0b: mov qword ptr [rbp - 0x78], rdi
0x2359c0f: mov qword ptr [rbp - 0x70], rdi
0x2359c13: jmp 0x142359ee2
0x2359c18: test rdi, rdi
0x2359c1b: jne 0x142359c68
0x2359c1d: lea rax, [rip + 0x362a37c]
0x2359c24: mov qword ptr [rsp + 0x58], rax
0x2359c29: mov dword ptr [rsp + 0x50], 6
0x2359c31: xor eax, eax
0x2359c33: mov dword ptr [rsp + 0x48], eax
0x2359c37: mov qword ptr [rsp + 0x40], rsi
0x2359c3c: mov dword ptr [rsp + 0x38], eax
0x2359c40: mov qword ptr [rsp + 0x30], rsi
0x2359c45: mov qword ptr [rsp + 0x28], rsi
0x2359c4a: mov qword ptr [rsp + 0x20], rsi
0x2359c4f: mov r9, rsi
0x2359c52: mov cl, 1
0x2359c54: call 0x14035d8d0
0x2359c59: mov dword ptr [rbp + 0x1a8], 0xffffffff
0x2359c63: jmp 0x142359e58
0x2359c68: mov ecx, 0x80
0x2359c6d: cmp dword ptr [rbp - 0x6c], ecx
0x2359c70: je 0x142359cbd
0x2359c72: lea rax, [rip + 0x362a347]
0x2359c79: mov qword ptr [rsp + 0x58], rax
0x2359c7e: mov dword ptr [rsp + 0x50], 6
0x2359c86: xor eax, eax
0x2359c88: mov dword ptr [rsp + 0x48], eax
0x2359c8c: mov qword ptr [rsp + 0x40], rsi
0x2359c91: mov dword ptr [rsp + 0x38], eax
0x2359c95: mov qword ptr [rsp + 0x30], rsi
0x2359c9a: mov qword ptr [rsp + 0x28], rsi
0x2359c9f: mov qword ptr [rsp + 0x20], rsi
0x2359ca4: mov r9, rsi
0x2359ca7: mov cl, 1
0x2359ca9: call 0x14035d8d0
0x2359cae: mov dword ptr [rbp + 0x1a8], 0xfffffffe
0x2359cb8: jmp 0x142359e58
0x2359cbd: mov eax, dword ptr [rdi]
0x2359cbf: cmp eax, dword ptr [rip + 0x31edea7]
0x2359cc5: jne 0x142359e4e
0x2359ccb: movzx eax, word ptr [rdi + 4]
0x2359ccf: cmp ax, 2
0x2359cd3: ja 0x142359e4e
0x2359cd9: test ax, ax
0x2359cdc: je 0x142359e4e
0x2359ce2: cmp word ptr [rdi + 6], cx
0x2359ce6: jne 0x142359e4e
0x2359cec: test dword ptr [rdi + 0xc], 0xfffffffd
0x2359cf3: jne 0x142359e4e
0x2359cf9: mov ecx, dword ptr [rdi + 0x12]
0x2359cfc: test ecx, ecx
0x2359cfe: je 0x142359e4e
0x2359d04: mov eax, dword ptr [rdi + 0x16]
0x2359d07: test eax, eax
0x2359d09: je 0x142359e4e
0x2359d0f: cmp eax, ecx
0x2359d11: ja 0x142359e4e
0x2359d17: mov rdx, qword ptr [r12]
0x2359d1b: mov rdx, qword ptr [rdx]
0x2359d1e: lea rcx, [rsp + 0x70]
0x2359d23: call 0x1414223f0
0x2359d28: nop 
0x2359d29: mov rdx, qword ptr [rsp + 0x70]
0x2359d2e: mov rdx, qword ptr [rdx]
0x2359d31: mov rcx, qword ptr [rbp - 0x50]
0x2359d35: call 0x14235b100
0x2359d3a: vmovups ymm0, ymmword ptr [rdi]
0x2359d3e: vmovups ymmword ptr [rax + 0x98], ymm0
0x2359d46: vmovups ymm1, ymmword ptr [rdi + 0x20]
0x2359d4b: vmovups ymmword ptr [rax + 0xb8], ymm1
0x2359d53: vmovups ymm0, ymmword ptr [rdi + 0x40]
0x2359d58: vmovups ymmword ptr [rax + 0xd8], ymm0
0x2359d60: vmovups ymm1, ymmword ptr [rdi + 0x60]
0x2359d65: vmovups ymmword ptr [rax + 0xf8], ymm1
0x2359d6d: cmp word ptr [rax + 0x9c], 1
0x2359d75: jne 0x142359d7e
0x2359d77: mov byte ptr [rax + 0x118], 1
0x2359d7e: mov rbx, qword ptr [rsp + 0x70]
0x2359d83: lea rax, [rip + 0x470bbb6]
0x2359d8a: cmp rbx, rax
0x2359d8d: je 0x142359ddf
0x2359d8f: mov eax, dword ptr [rbx + 0x10]
0x2359d92: test eax, eax
0x2359d94: js 0x142359ddf
0x2359d96: mov eax, 0xffffffff
0x2359d9b: lock xadd dword ptr [rbx + 0x10], eax
0x2359da0: cmp eax, 1
0x2359da3: jne 0x142359ddf
0x2359da5: test rbx, rbx
0x2359da8: je 0x142359ddf
0x2359daa: mov rcx, rbx
0x2359dad: vzeroupper 
0x2359db0: call 0x141420360
0x2359db5: mov r14d, 0x1fd
0x2359dbb: mov rax, qword ptr gs:[0x58]
0x2359dc4: mov rdx, qword ptr [rax]
0x2359dc7: mov rcx, rbx
0x2359dca: cmp byte ptr [r14 + rdx], 0
0x2359dcf: je 0x142359dd8
0x2359dd1: call 0x1447f03bc
0x2359dd6: jmp 0x142359de5
0x2359dd8: call 0x1447f02bc
0x2359ddd: jmp 0x142359de5
0x2359ddf: mov r14d, 0x1fd
0x2359de5: lea rbx, [rip + 0x470bb54]
0x2359dec: mov qword ptr [rsp + 0x70], rbx
0x2359df1: movsx eax, byte ptr [rbp - 0x68]
0x2359df5: cmp al, 0xff
0x2359df7: je 0x142359e0a
0x2359df9: neg r15d
0x2359dfc: mov edx, eax
0x2359dfe: lea rax, [rip + 0x497f41b]
0x2359e05: lock add dword ptr [rax + rdx*4], r15d
0x2359e0a: mov r8d, r14d
0x2359e0d: mov rax, qword ptr gs:[0x58]
0x2359e16: mov rdx, qword ptr [rax]
0x2359e19: mov rcx, rdi
0x2359e1c: vzeroupper 
0x2359e1f: cmp byte ptr [r8 + rdx], 0
0x2359e24: je 0x142359e3a
0x2359e26: call 0x1447f03bc
0x2359e2b: xor edi, edi
0x2359e2d: mov qword ptr [rbp - 0x78], rdi
0x2359e31: mov qword ptr [rbp - 0x70], rdi
0x2359e35: jmp 0x142359ee2
0x2359e3a: call 0x1447f02bc
0x2359e3f: xor edi, edi
0x2359e41: mov qword ptr [rbp - 0x78], rdi
0x2359e45: mov qword ptr [rbp - 0x70], rdi
0x2359e49: jmp 0x142359ee2
0x2359e4e: mov dword ptr [rbp + 0x1a8], 0xfffffffd
0x2359e58: lea rax, [rbp + 0x1a8]
0x2359e5f: mov qword ptr [rsp + 0x60], rax
0x2359e64: lea rax, [rip + 0x3629cad]
0x2359e6b: mov qword ptr [rsp + 0x58], rax
0x2359e70: mov dword ptr [rsp + 0x50], 6
0x2359e78: mov dword ptr [rsp + 0x48], 0
0x2359e80: mov cl, 1
0x2359e82: call 0x14035dd30
0x2359e87: xor r13b, r13b
0x2359e8a: movsx eax, byte ptr [rbp - 0x68]
0x2359e8e: cmp al, 0xff
0x2359e90: je 0x142359ea3
0x2359e92: neg r15d
0x2359e95: mov ecx, eax
0x2359e97: lea rax, [rip + 0x497f382]
0x2359e9e: lock add dword ptr [rax + rcx*4], r15d
0x2359ea3: test rdi, rdi
0x2359ea6: je 0x142359eda
0x2359ea8: mov edx, 0x1fd
0x2359ead: mov rax, qword ptr gs:[0x58]
0x2359eb6: mov rcx, qword ptr [rax]
0x2359eb9: cmp byte ptr [rdx + rcx], 0
0x2359ebd: mov rcx, rdi
0x2359ec0: je 0x142359ecf
0x2359ec2: call 0x1447f03bc
0x2359ec7: xor edi, edi
0x2359ec9: mov qword ptr [rbp - 0x78], rdi
0x2359ecd: jmp 0x142359eda
0x2359ecf: call 0x1447f02bc
0x2359ed4: xor edi, edi
0x2359ed6: mov qword ptr [rbp - 0x78], rdi
0x2359eda: mov qword ptr [rbp - 0x70], 0
0x2359ee2: lea rcx, [rbp - 0x28]
0x2359ee6: call 0x140aa9ae0
0x2359eeb: add r12, 8
0x2359eef: cmp r12, qword ptr [rbp - 8]
0x2359ef3: jne 0x142359aa1
0x2359ef9: mov rbx, qword ptr [rbp - 0x50]
0x2359efd: mov byte ptr [rbx + 0x69b], r13b
0x2359f04: lea rcx, [rbp - 0x60]
0x2359f08: call 0x140439370
0x2359f0d: nop 
0x2359f0e: mov rbx, qword ptr [rbp + 0x1b0]
0x2359f15: lea rax, [rip + 0x470ba24]
0x2359f1c: cmp rbx, rax
0x2359f1f: je 0x142359f6c
0x2359f21: mov eax, dword ptr [rbx + 0x10]
0x2359f24: test eax, eax
0x2359f26: js 0x142359f6c
0x2359f28: mov eax, 0xffffffff
0x2359f2d: lock xadd dword ptr [rbx + 0x10], eax
0x2359f32: cmp eax, 1
0x2359f35: jne 0x142359f6c
0x2359f37: test rbx, rbx
0x2359f3a: je 0x142359f6c
0x2359f3c: mov rcx, rbx
0x2359f3f: call 0x141420360
0x2359f44: mov r8d, 0x1fd
0x2359f4a: mov rax, qword ptr gs:[0x58]
0x2359f53: mov rdx, qword ptr [rax]
0x2359f56: mov rcx, rbx
0x2359f59: cmp byte ptr [r8 + rdx], 0
0x2359f5e: je 0x142359f67
0x2359f60: call 0x1447f03bc
0x2359f65: jmp 0x142359f6c
0x2359f67: call 0x1447f02bc
0x2359f6c: mov r13, qword ptr [rbp + 0x1a0]
0x2359f73: lea rbx, [rip + 0x470b9c6]
0x2359f7a: mov qword ptr [rbp + 0x1b0], rbx
0x2359f81: mov rbx, qword ptr [rbp + 0x1b8]
0x2359f88: add rbx, 8
0x2359f8c: mov qword ptr [rbp + 0x1b8], rbx
0x2359f93: cmp rbx, qword ptr [rbp]
0x2359f97: jne 0x1423596e0
0x2359f9d: mov rax, qword ptr [r13 + 0x10]
0x2359fa1: mov rcx, qword ptr [rax]
0x2359fa4: mov rax, qword ptr [rcx]
0x2359fa7: call qword ptr [rax + 0x10]
0x2359faa: mov bl, 1
0x2359fac: lea rcx, [rsp + 0x78]
0x2359fb1: call 0x140439370
0x2359fb6: nop 
0x2359fb7: lea rcx, [rbp - 0x48]
0x2359fbb: call 0x140439370
0x2359fc0: nop 
0x2359fc1: lea rcx, [rbp - 0x38]
0x2359fc5: call 0x140439370
0x2359fca: nop 
0x2359fcb: lea rcx, [rbp - 0x20]
0x2359fcf: call 0x140439370
0x2359fd4: movzx eax, bl
0x2359fd7: add rsp, 0x258
0x2359fde: pop r15
0x2359fe0: pop r14
0x2359fe2: pop r13
0x2359fe4: pop r12
0x2359fe6: pop rdi
0x2359fe7: pop rsi
0x2359fe8: pop rbx
0x2359fe9: pop rbp
0x2359fea: ret 