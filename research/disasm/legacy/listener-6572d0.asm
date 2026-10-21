0x6572d0: mov qword ptr [rsp + 0x18], r8
0x6572d5: mov qword ptr [rsp + 0x10], rdx
0x6572da: mov qword ptr [rsp + 8], rcx
0x6572df: push rbp
0x6572e0: push rbx
0x6572e1: push rsi
0x6572e2: push rdi
0x6572e3: push r12
0x6572e5: push r13
0x6572e7: push r14
0x6572e9: push r15
0x6572eb: lea rbp, [rsp - 0x118]
0x6572f3: sub rsp, 0x218
0x6572fa: mov r13, r8
0x6572fd: mov r12, rdx
0x657300: xor r15d, r15d
0x657303: mov dword ptr [rsp + 0x30], r15d
0x657308: lea rdx, [rbp - 0x38]
0x65730c: mov rcx, qword ptr [rip + 0x6711e7d]
0x657313: mov rcx, qword ptr [rcx + 0x30]
0x657317: call 0x1408b44e0
0x65731c: nop 
0x65731d: lea rdi, [rip + 0x50ceb24]
0x657324: cmp byte ptr [rbp - 0x28], r15b
0x657328: jne 0x140657331
0x65732a: xor bl, bl
0x65732c: jmp 0x140657cc0
0x657331: lea rdx, [rbp - 0x58]
0x657335: mov rcx, qword ptr [rip + 0x6711e54]
0x65733c: mov rcx, qword ptr [rcx + 0x30]
0x657340: call 0x1408b4570
0x657345: nop 
0x657346: cmp byte ptr [rbp - 0x48], 0
0x65734a: jne 0x140657353
0x65734c: xor bl, bl
0x65734e: jmp 0x140657cb2
0x657353: lea rdx, [rsp + 0x78]
0x657358: mov rcx, qword ptr [rbp - 0x50]
0x65735c: call 0x1417fa6c0
0x657361: nop 
0x657362: cmp byte ptr [rbp - 0x78], 0
0x657366: je 0x140657c6d
0x65736c: mov qword ptr [rsp + 0x38], r15
0x657371: mov qword ptr [rsp + 0x40], r15
0x657376: mov dword ptr [rsp + 0x48], r15d
0x65737b: mov byte ptr [rsp + 0x4c], 0
0x657380: mov eax, 0xc
0x657385: mov word ptr [rsp + 0x4e], ax
0x65738a: mov qword ptr [rsp + 0x50], r15
0x65738f: mov rax, qword ptr [rbp - 0x30]
0x657393: mov rcx, qword ptr [rax + 0x68]
0x657397: lea rdx, [rsp + 0x38]
0x65739c: mov rcx, qword ptr [rcx + 0x1a0]
0x6573a3: call 0x1421a1da0
0x6573a8: mov eax, dword ptr [rsp + 0x38]
0x6573ac: lea rcx, [rax + rax*2]
0x6573b0: mov eax, dword ptr [rsp + 0x3c]
0x6573b4: lea rcx, [rax + rcx*8]
0x6573b8: imul rdx, rcx, 0x3c
0x6573bc: mov eax, dword ptr [rsp + 0x40]
0x6573c0: add rdx, rax
0x6573c3: imul rcx, rdx, 0x3c
0x6573c7: mov eax, dword ptr [rsp + 0x44]
0x6573cb: add rcx, rax
0x6573ce: mov qword ptr [rsp + 0x60], rcx
0x6573d3: mov qword ptr [rsp + 0x58], rcx
0x6573d8: mov ebx, 0xffffffff
0x6573dd: mov edi, 0xffff
0x6573e2: mov byte ptr [rbp + 0x160], 0
0x6573e9: mov byte ptr [rbp + 0x178], 0
0x6573f0: mov rcx, qword ptr [rbp - 0x80]
0x6573f4: mov rax, qword ptr [rcx]
0x6573f7: call qword ptr [rax + 0x40]
0x6573fa: mov rsi, rax
0x6573fd: lea rdx, [rax + 8]
0x657401: test rax, rax
0x657404: cmove rdx, r15
0x657408: mov rdx, qword ptr [rdx]
0x65740b: lea rcx, [rsp + 0x38]
0x657410: call 0x140393df0
0x657415: nop 
0x657416: mov edx, dword ptr [r12]
0x65741a: mov rcx, rsi
0x65741d: call 0x141ac10f0
0x657422: mov byte ptr [rsp + 0x20], al
0x657426: mov edx, dword ptr [r12]
0x65742a: mov rcx, rsi
0x65742d: call 0x141ac11f0
0x657432: mov qword ptr [rsp + 0x68], rax
0x657437: mov eax, dword ptr [r12]
0x65743b: mov dword ptr [rsp + 0x28], eax
0x65743f: lea rcx, [rsp + 0x28]
0x657444: call 0x140473f20
0x657449: cmp dword ptr [rax + 0x280], ebx
0x65744f: je 0x1406574d3
0x657455: lea rcx, [rsp + 0x28]
0x65745a: call 0x140473f20
0x65745f: cmp dword ptr [rsi + 0x4c], 0
0x657463: je 0x1406574d3
0x657465: mov r8d, dword ptr [rax]
0x657468: mov ecx, dword ptr [rsi + 0x48]
0x65746b: test ecx, ecx
0x65746d: je 0x1406574d3
0x65746f: xor edx, edx
0x657471: mov eax, r8d
0x657474: div ecx
0x657476: mov r10d, edx
0x657479: shl r10, 8
0x65747d: add r10, qword ptr [rsi + 0x58]
0x657481: mov edx, r15d
0x657484: mov r11d, dword ptr [r10]
0x657487: test r11d, r11d
0x65748a: je 0x1406574d3
0x65748c: nop dword ptr [rax]
0x657490: mov eax, edx
0x657492: cmp dword ptr [r10 + rax*8 + 8], r8d
0x657497: jne 0x1406574ac
0x657499: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x65749e: mov rax, qword ptr [rsi + 0x60]
0x6574a2: mov r9, qword ptr [rax + rcx*8]
0x6574a6: cmp dword ptr [r9 + 4], r8d
0x6574aa: je 0x1406574b5
0x6574ac: inc edx
0x6574ae: cmp edx, r11d
0x6574b1: jb 0x140657490
0x6574b3: jmp 0x1406574d3
0x6574b5: lea r14, [r9 + 8]
0x6574b9: test r14, r14
0x6574bc: je 0x1406574d3
0x6574be: lea rcx, [rsp + 0x28]
0x6574c3: call 0x140473f20
0x6574c8: mov r15d, dword ptr [rax + 0x280]
0x6574cf: add r15, qword ptr [r14 + 0x38]
0x6574d3: mov rcx, rsi
0x6574d6: mov eax, 0x48
0x6574db: lea r14, [rax + rcx]
0x6574df: mov qword ptr [rsp + 0x70], r15
0x6574e4: mov eax, dword ptr [r12]
0x6574e8: mov dword ptr [rsp + 0x28], eax
0x6574ec: lea rcx, [rsp + 0x28]
0x6574f1: call 0x140473f20
0x6574f6: cmp dword ptr [r14 + 4], 0
0x6574fb: je 0x14065754c
0x6574fd: mov r8d, dword ptr [rax]
0x657500: mov ecx, dword ptr [r14]
0x657503: test ecx, ecx
0x657505: je 0x14065754c
0x657507: xor edx, edx
0x657509: mov eax, r8d
0x65750c: div ecx
0x65750e: mov r10d, edx
0x657511: shl r10, 8
0x657515: add r10, qword ptr [rsi + 0x58]
0x657519: xor ecx, ecx
0x65751b: mov edx, ecx
0x65751d: mov r11d, dword ptr [r10]
0x657520: test r11d, r11d
0x657523: je 0x14065754c
0x657525: mov eax, edx
0x657527: cmp dword ptr [r10 + rax*8 + 8], r8d
0x65752c: jne 0x140657545
0x65752e: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x657533: mov rax, qword ptr [rsi + 0x60]
0x657537: mov r9, qword ptr [rax + rcx*8]
0x65753b: cmp dword ptr [r9 + 4], r8d
0x65753f: je 0x140657608
0x657545: inc edx
0x657547: cmp edx, r11d
0x65754a: jb 0x140657525
0x65754c: xor r12b, r12b
0x65754f: mov rcx, qword ptr [rsp + 0x38]
0x657554: mov rax, qword ptr [rcx]
0x657557: mov dl, 1
0x657559: call qword ptr [rax + 0x20]
0x65755c: mov rcx, qword ptr [rbp - 0x80]
0x657560: mov rax, qword ptr [rcx]
0x657563: call qword ptr [rax + 0x48]
0x657566: mov r14, rax
0x657569: lea rdx, [rax + 8]
0x65756d: test rax, rax
0x657570: mov eax, 0
0x657575: cmove rdx, rax
0x657579: mov rdx, qword ptr [rdx]
0x65757c: lea rcx, [rsp + 0x38]
0x657581: call 0x140393df0
0x657586: nop 
0x657587: mov qword ptr [rsp + 0x40], r14
0x65758c: mov dword ptr [rsp + 0x30], 4
0x657594: mov rcx, qword ptr [rbp + 0x168]
0x65759b: call 0x140473f20
0x6575a0: cmp dword ptr [r14 + 0x74], 0
0x6575a5: je 0x14065764f
0x6575ab: mov r9d, dword ptr [rax]
0x6575ae: mov ecx, dword ptr [r14 + 0x70]
0x6575b2: test ecx, ecx
0x6575b4: je 0x14065764f
0x6575ba: xor edx, edx
0x6575bc: mov eax, r9d
0x6575bf: div ecx
0x6575c1: mov r10d, edx
0x6575c4: shl r10, 8
0x6575c8: add r10, qword ptr [r14 + 0x80]
0x6575cf: xor eax, eax
0x6575d1: mov edx, eax
0x6575d3: mov r11d, dword ptr [r10]
0x6575d6: test r11d, r11d
0x6575d9: je 0x14065764f
0x6575db: nop dword ptr [rax + rax]
0x6575e0: mov eax, edx
0x6575e2: cmp dword ptr [r10 + rax*8 + 8], r9d
0x6575e7: jne 0x1406575ff
0x6575e9: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x6575ee: mov rax, qword ptr [r14 + 0x88]
0x6575f5: mov r8, qword ptr [rax + rcx*8]
0x6575f9: cmp dword ptr [r8 + 4], r9d
0x6575fd: je 0x14065761c
0x6575ff: inc edx
0x657601: cmp edx, r11d
0x657604: jb 0x1406575e0
0x657606: jmp 0x14065764f
0x657608: add r9, 8
0x65760c: je 0x14065754c
0x657612: movzx r12d, byte ptr [r9 + 0x2c]
0x657617: jmp 0x14065754f
0x65761c: add r8, 8
0x657620: je 0x14065764f
0x657622: mov ebx, dword ptr [r8 + 0x1c]
0x657626: movzx edi, word ptr [r8 + 0x20]
0x65762b: movzx eax, byte ptr [r8 + 0x18]
0x657630: cmp al, 3
0x657632: je 0x14065763f
0x657634: cmp al, 7
0x657636: mov byte ptr [rbp + 0x160], 0
0x65763d: jne 0x140657646
0x65763f: mov byte ptr [rbp + 0x160], 1
0x657646: cmp al, 6
0x657648: sete byte ptr [rbp + 0x178]
0x65764f: mov eax, 4
0x657654: and eax, 0xfffffffb
0x657657: mov dword ptr [rsp + 0x30], eax
0x65765b: mov rcx, qword ptr [rsp + 0x38]
0x657660: mov rax, qword ptr [rcx]
0x657663: mov dl, 1
0x657665: call qword ptr [rax + 0x20]
0x657668: mov rax, qword ptr gs:[0x58]
0x657671: mov rdx, qword ptr [rax]
0x657674: mov eax, 0x1ec
0x657679: mov rcx, qword ptr [rip + 0x6711ea8]
0x657680: cmp byte ptr [rax + rdx], 0
0x657684: cmovne rcx, qword ptr [rip + 0x6711ea4]
0x65768c: mov rax, qword ptr [rcx]
0x65768f: mov rcx, qword ptr [rax + 8]
0x657693: mov r14, qword ptr [rcx + 0x1c0]
0x65769a: movzx ecx, r12b
0x65769e: test r12b, r12b
0x6576a1: je 0x140657c2e
0x6576a7: sub ecx, 1
0x6576aa: je 0x140657c2e
0x6576b0: sub ecx, 2
0x6576b3: je 0x140657c6d
0x6576b9: cmp ecx, 1
0x6576bc: je 0x140657c6d
0x6576c2: cmp byte ptr [rsp + 0x20], 0
0x6576c7: jne 0x140657c6d
0x6576cd: cmp ebx, -1
0x6576d0: je 0x1406577bd
0x6576d6: test r13, r13
0x6576d9: je 0x1406577b6
0x6576df: xor eax, eax
0x6576e1: mov qword ptr [rbp + 0xf8], rax
0x6576e8: mov qword ptr [rbp + 0x100], 0x105
0x6576f3: mov dword ptr [rbp + 0x104], eax
0x6576f9: mov byte ptr [rbp - 0x10], al
0x6576fc: mov dword ptr [rbp + 0x104], eax
0x657702: mov byte ptr [rbp - 0x10], al
0x657705: mov rax, qword ptr [rbp + 0xf8]
0x65770c: test rax, rax
0x65770f: je 0x140657714
0x657711: mov byte ptr [rax], 0
0x657714: lea r8, [rbp - 0x10]
0x657718: mov edx, ebx
0x65771a: call 0x140657110
0x65771f: mov eax, 0xffff
0x657724: lea rcx, [rbp - 0x10]
0x657728: cmp di, ax
0x65772b: mov rax, qword ptr [rbp + 0xf8]
0x657732: je 0x140657745
0x657734: test rax, rax
0x657737: cmovne rcx, rax
0x65773b: movzx eax, word ptr [r14 + 0xaa]
0x657743: jmp 0x140657754
0x657745: test rax, rax
0x657748: cmovne rcx, rax
0x65774c: movzx eax, word ptr [r14 + 0xae]
0x657754: mov qword ptr [rbp + 0x178], rcx
0x65775b: mov word ptr [rbp + 0x160], ax
0x657762: lea rcx, [rbp + 0x160]
0x657769: call 0x140389080
0x65776e: mov rcx, qword ptr [rax + 0x18]
0x657772: mov rax, qword ptr [rcx]
0x657775: xor edx, edx
0x657777: call qword ptr [rax + 8]
0x65777a: mov r8, rax
0x65777d: mov rax, qword ptr [r13 + 0x108]
0x657784: mov edx, dword ptr [r13 + 0x110]
0x65778b: mov dword ptr [r13 + 0x114], 0xffffffff
0x657796: test rax, rax
0x657799: cmovne r13, rax
0x65779d: lea r9, [rbp + 0x178]
0x6577a4: mov rcx, r13
0x6577a7: call 0x14035ee40
0x6577ac: nop 
0x6577ad: lea rcx, [rbp - 0x10]
0x6577b1: call 0x140394170
0x6577b6: mov bl, 1
0x6577b8: jmp 0x140657c6f
0x6577bd: mov rbx, qword ptr [rbp + 0x168]
0x6577c4: cmp r12b, 5
0x6577c8: jne 0x140657805
0x6577ca: mov rcx, rbx
0x6577cd: call 0x140473f20
0x6577d2: cmp dword ptr [rax + 0x280], -1
0x6577d9: je 0x140657805
0x6577db: test r13, r13
0x6577de: je 0x140657836
0x6577e0: test r15, r15
0x6577e3: je 0x140657836
0x6577e5: cmp r15, qword ptr [rsp + 0x60]
0x6577ea: jbe 0x140657836
0x6577ec: mov r9, r13
0x6577ef: lea r8, [rsp + 0x58]
0x6577f4: lea rdx, [rsp + 0x70]
0x6577f9: call 0x140657cf0
0x6577fe: mov bl, 3
0x657800: jmp 0x140657c6f
0x657805: cmp byte ptr [rbp + 0x178], 0
0x65780c: je 0x14065783d
0x65780e: test r13, r13
0x657811: je 0x140657836
0x657813: mov rax, qword ptr [rsp + 0x68]
0x657818: test rax, rax
0x65781b: je 0x140657836
0x65781d: cmp rax, qword ptr [rsp + 0x60]
0x657822: jbe 0x140657836
0x657824: mov r9, r13
0x657827: lea r8, [rsp + 0x58]
0x65782c: lea rdx, [rsp + 0x68]
0x657831: call 0x140657cf0
0x657836: mov bl, 3
0x657838: jmp 0x140657c6f
0x65783d: cmp byte ptr [rbp + 0x160], 0
0x657844: je 0x140657888
0x657846: test r13, r13
0x657849: je 0x140657c26
0x65784f: movzx eax, word ptr [r14 + 0xc4]
0x657857: mov word ptr [rbp + 0x160], ax
0x65785e: lea rcx, [rbp + 0x160]
0x657865: call 0x140389080
0x65786a: mov rcx, qword ptr [rax + 0x18]
0x65786e: mov rax, qword ptr [rcx]
0x657871: xor edx, edx
0x657873: call qword ptr [rax + 8]
0x657876: mov rdx, rax
0x657879: mov rcx, r13
0x65787c: call 0x140423790
0x657881: mov bl, 2
0x657883: jmp 0x140657c6f
0x657888: lea r8, [rsp + 0x58]
0x65788d: mov edx, dword ptr [rbx]
0x65788f: mov rcx, rsi
0x657892: call 0x141ac0bf0
0x657897: test al, al
0x657899: jne 0x1406578dd
0x65789b: test r13, r13
0x65789e: je 0x140657c26
0x6578a4: movzx eax, word ptr [r14 + 0xa6]
0x6578ac: mov word ptr [rbp + 0x160], ax
0x6578b3: lea rcx, [rbp + 0x160]
0x6578ba: call 0x140389080
0x6578bf: mov rcx, qword ptr [rax + 0x18]
0x6578c3: mov rax, qword ptr [rcx]
0x6578c6: xor edx, edx
0x6578c8: call qword ptr [rax + 8]
0x6578cb: mov rdx, rax
0x6578ce: mov rcx, r13
0x6578d1: call 0x140423790
0x6578d6: mov bl, 2
0x6578d8: jmp 0x140657c6f
0x6578dd: mov rcx, rbx
0x6578e0: call 0x140473f20
0x6578e5: lea rcx, [rax + 0x1b0]
0x6578ec: cmp dword ptr [rcx], -1
0x6578ef: je 0x140657903
0x6578f1: call 0x140473f20
0x6578f6: mov rcx, rax
0x6578f9: call 0x142350790
0x6578fe: mov r8, rax
0x657901: jmp 0x140657924
0x657903: lea r8, [rax + 0x220]
0x65790a: cmp dword ptr [r8 + 8], 0
0x65790f: jne 0x140657924
0x657911: lea rcx, [rax + 0x1ac]
0x657918: call 0x1405c15a0
0x65791d: lea r8, [rax + 0x90]
0x657924: mov r9d, dword ptr [r8 + 8]
0x657928: test r9d, r9d
0x65792b: je 0x140657c2a
0x657931: xor r10d, r10d
0x657934: mov edx, r10d
0x657937: test r9d, r9d
0x65793a: je 0x140657967
0x65793c: mov rax, qword ptr [rbp - 0x50]
0x657940: mov rcx, qword ptr [rax + 0x68]
0x657944: mov rax, qword ptr [rcx + 0x20]
0x657948: movzx ecx, word ptr [rax + 0x30]
0x65794c: mov r10, qword ptr [r8]
0x65794f: nop 
0x657950: mov eax, edx
0x657952: cmp cx, word ptr [r10 + rax*2]
0x657957: je 0x140657c2a
0x65795d: inc edx
0x65795f: cmp edx, r9d
0x657962: jb 0x140657950
0x657964: xor r10d, r10d
0x657967: test r13, r13
0x65796a: je 0x140657c26
0x657970: mov qword ptr [rbp + 0xf8], r10
0x657977: mov qword ptr [rbp + 0x100], 0x105
0x657982: mov dword ptr [rbp + 0x104], r10d
0x657989: mov byte ptr [rbp - 0x10], 0
0x65798d: mov dword ptr [rbp + 0x104], r10d
0x657994: mov byte ptr [rbp - 0x10], 0
0x657998: mov rax, qword ptr [rbp + 0xf8]
0x65799f: test rax, rax
0x6579a2: je 0x1406579a7
0x6579a4: mov byte ptr [rax], 0
0x6579a7: mov r15, qword ptr [r8]
0x6579aa: mov eax, dword ptr [r8 + 8]
0x6579ae: lea rax, [r15 + rax*2]
0x6579b2: mov qword ptr [rbp + 0x160], rax
0x6579b9: cmp r15, rax
0x6579bc: je 0x140657b79
0x6579c2: mov rax, qword ptr gs:[0x58]
0x6579cb: mov r12, qword ptr [rax]
0x6579ce: mov eax, 0x240
0x6579d3: add rax, r12
0x6579d6: mov qword ptr [rbp + 0x178], rax
0x6579dd: mov r13, qword ptr [rbp + 0x160]
0x6579e4: movzx eax, word ptr [r15]
0x6579e8: mov word ptr [rbp + 0x160], ax
0x6579ef: mov eax, dword ptr [rbp + 0x104]
0x6579f5: cmp eax, -1
0x6579f8: jne 0x140657a22
0x6579fa: lea rcx, [rbp - 0x10]
0x6579fe: mov rax, qword ptr [rbp + 0xf8]
0x657a05: test rax, rax
0x657a08: cmovne rcx, rax
0x657a0c: mov rax, 0xffffffffffffffff
0x657a13: inc rax
0x657a16: cmp byte ptr [rcx + rax], 0
0x657a1a: jne 0x140657a13
0x657a1c: mov dword ptr [rbp + 0x104], eax
0x657a22: test eax, eax
0x657a24: je 0x140657a3c
0x657a26: mov r8d, 2
0x657a2c: lea rdx, [rip + 0x4f2ac0d]
0x657a33: lea rcx, [rbp - 0x10]
0x657a37: call 0x140393f50
0x657a3c: lea rcx, [rbp + 0x160]
0x657a43: call 0x140389570
0x657a48: mov rcx, qword ptr [rax + 0x18]
0x657a4c: mov rax, qword ptr [rcx]
0x657a4f: xor edx, edx
0x657a51: call qword ptr [rax + 8]
0x657a54: mov rdi, rax
0x657a57: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a61: mov rcx, qword ptr [rbp + 0xf8]
0x657a68: test rcx, rcx
0x657a6b: setne al
0x657a6e: lea rbx, [rbp - 0x10]
0x657a72: test rcx, rcx
0x657a75: cmovne rbx, rcx
0x657a79: mov r14d, dword ptr [rbp + 0x100]
0x657a80: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a8a: lea rsi, [rbp - 0x10]
0x657a8e: test al, al
0x657a90: cmovne rsi, rcx
0x657a94: mov rax, qword ptr [rbp + 0x178]
0x657a9b: xor ecx, ecx
0x657a9d: mov dword ptr [rax], ecx
0x657a9f: mov edx, 2
0x657aa4: lea rcx, [rbp + 0x160]
0x657aab: call 0x141424650
0x657ab0: nop 
0x657ab1: test rbx, rbx
0x657ab4: je 0x140657ad7
0x657ab6: call 0x1414245b0
0x657abb: cmp dword ptr [rax + 8], 0
0x657abf: ja 0x140657aca
0x657ac1: lea rax, [rip + 0x66825e8]
0x657ac8: jmp 0x140657ad0
0x657aca: mov rax, qword ptr [rax]
0x657acd: mov rax, qword ptr [rax]
0x657ad0: mov qword ptr [rax + 0x808], rbx
0x657ad7: test rdi, rdi
0x657ada: je 0x140657afe
0x657adc: call 0x1414245b0
0x657ae1: cmp dword ptr [rax + 8], 1
0x657ae5: ja 0x140657af0
0x657ae7: lea rax, [rip + 0x66825c2]
0x657aee: jmp 0x140657af7
0x657af0: mov rax, qword ptr [rax]
0x657af3: mov rax, qword ptr [rax + 8]
0x657af7: mov qword ptr [rax + 0x808], rdi
0x657afe: lea r8, [rip + 0x4f391a7]
0x657b05: mov edx, r14d
0x657b08: mov rcx, rsi
0x657b0b: call 0x141424bd0
0x657b10: nop 
0x657b11: call 0x1414245b0
0x657b16: mov rsi, rax
0x657b19: xor r10d, r10d
0x657b1c: mov ebx, r10d
0x657b1f: cmp dword ptr [rax + 8], r10d
0x657b23: jbe 0x140657b61
0x657b25: mov r14d, 0x1fd
0x657b2b: nop dword ptr [rax + rax]
0x657b30: mov ecx, ebx
0x657b32: mov rax, qword ptr [rsi]
0x657b35: lea rdi, [rax + rcx*8]
0x657b39: mov rcx, qword ptr [rdi]
0x657b3c: test rcx, rcx
0x657b3f: je 0x140657b5a
0x657b41: cmp byte ptr [r14 + r12], 0
0x657b46: je 0x140657b4f
0x657b48: call 0x1447f03bc
0x657b4d: jmp 0x140657b54
0x657b4f: call 0x1447f02bc
0x657b54: xor r10d, r10d
0x657b57: mov qword ptr [rdi], r10
0x657b5a: inc ebx
0x657b5c: cmp ebx, dword ptr [rsi + 8]
0x657b5f: jb 0x140657b30
0x657b61: mov dword ptr [rsi + 8], r10d
0x657b65: add r15, 2
0x657b69: cmp r15, r13
0x657b6c: jne 0x1406579e4
0x657b72: mov r13, qword ptr [rbp + 0x170]
0x657b79: lea rcx, [rbp - 0x10]
0x657b7d: mov rax, qword ptr [rbp + 0xf8]
0x657b84: test rax, rax
0x657b87: cmovne rcx, rax
0x657b8b: mov qword ptr [rbp + 0x178], rcx
0x657b92: mov rax, qword ptr gs:[0x58]
0x657b9b: mov rcx, qword ptr [rax]
0x657b9e: mov eax, 0x1ec
0x657ba3: mov rdx, qword ptr [rip + 0x671197e]
0x657baa: cmp byte ptr [rax + rcx], 0
0x657bae: cmovne rdx, qword ptr [rip + 0x671197a]
0x657bb6: mov rax, qword ptr [rdx]
0x657bb9: mov rcx, qword ptr [rax + 8]
0x657bbd: mov rax, qword ptr [rcx + 0x1c0]
0x657bc4: movzx ecx, word ptr [rax + 0xa8]
0x657bcb: mov word ptr [rbp + 0x160], cx
0x657bd2: lea rcx, [rbp + 0x160]
0x657bd9: call 0x140389080
0x657bde: mov rcx, qword ptr [rax + 0x18]
0x657be2: mov rax, qword ptr [rcx]
0x657be5: xor edx, edx
0x657be7: call qword ptr [rax + 8]
0x657bea: mov r8, rax
0x657bed: mov edx, dword ptr [r13 + 0x110]
0x657bf4: mov dword ptr [r13 + 0x114], 0xffffffff
0x657bff: mov rax, qword ptr [r13 + 0x108]
0x657c06: test rax, rax
0x657c09: cmovne r13, rax
0x657c0d: lea r9, [rbp + 0x178]
0x657c14: mov rcx, r13
0x657c17: call 0x14035ee40
0x657c1c: nop 
0x657c1d: lea rcx, [rbp - 0x10]
0x657c21: call 0x140394170
0x657c26: mov bl, 2
0x657c28: jmp 0x140657c6f
0x657c2a: mov bl, 4
0x657c2c: jmp 0x140657c6f
0x657c2e: test r13, r13
0x657c31: je 0x1406577b6
0x657c37: movzx eax, word ptr [r14 + 0xa6]
0x657c3f: mov word ptr [rbp + 0x160], ax
0x657c46: lea rcx, [rbp + 0x160]
0x657c4d: call 0x140389080
0x657c52: mov rcx, qword ptr [rax + 0x18]
0x657c56: mov rax, qword ptr [rcx]
0x657c59: xor edx, edx
0x657c5b: call qword ptr [rax + 8]
0x657c5e: mov rdx, rax
0x657c61: mov rcx, r13
0x657c64: call 0x140423790
0x657c69: mov bl, 1
0x657c6b: jmp 0x140657c6f
0x657c6d: xor bl, bl
0x657c6f: lea rax, [rip + 0x52bb1ea]
0x657c76: mov qword ptr [rsp + 0x78], rax
0x657c7b: cmp byte ptr [rbp - 0x78], 0
0x657c7f: je 0x140657c8f
0x657c81: mov rcx, qword ptr [rbp - 0x60]
0x657c85: mov rax, qword ptr [rcx]
0x657c88: call qword ptr [rax + 0x148]
0x657c8e: nop 
0x657c8f: lea rax, [rip + 0x4f1bbaa]
0x657c96: mov qword ptr [rsp + 0x78], rax
0x657c9b: lea rdi, [rip + 0x50ce1a6]
0x657ca2: mov qword ptr [rsp + 0x78], rdi
0x657ca7: lea rcx, [rsp + 0x78]
0x657cac: call 0x141434880
0x657cb1: nop 
0x657cb2: mov qword ptr [rbp - 0x58], rdi
0x657cb6: lea rcx, [rbp - 0x58]
0x657cba: call 0x141434880
0x657cbf: nop 
0x657cc0: mov qword ptr [rbp - 0x38], rdi
0x657cc4: lea rcx, [rbp - 0x38]
0x657cc8: call 0x141434880
0x657ccd: movzx eax, bl
0x657cd0: add rsp, 0x218
0x657cd7: pop r15
0x657cd9: pop r14
0x657cdb: pop r13
0x657cdd: pop r12
0x657cdf: pop rdi
0x657ce0: pop rsi
0x657ce1: pop rbx
0x657ce2: pop rbp
0x657ce3: ret 