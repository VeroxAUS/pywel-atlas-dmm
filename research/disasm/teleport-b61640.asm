0xb61640: mov qword ptr [rsp + 8], rbx
0xb61645: push rbp
0xb61646: push rsi
0xb61647: push rdi
0xb61648: push r12
0xb6164a: push r13
0xb6164c: push r14
0xb6164e: push r15
0xb61650: mov rbp, rsp
0xb61653: sub rsp, 0x110
0xb6165a: mov rdi, r8
0xb6165d: mov rbx, rdx
0xb61660: mov rsi, rcx
0xb61663: xor r13d, r13d
0xb61666: mov r14, qword ptr [r8 + 0x18]
0xb6166a: movzx ecx, word ptr [r14 + 3]
0xb6166f: movzx eax, word ptr [r8 + 0x10]
0xb61674: sub rax, 5
0xb61678: cmp rax, rcx
0xb6167b: jne 0x140b618f2
0xb61681: cmp byte ptr [r8 + 0x38], r13b
0xb61685: jne 0x140b61695
0xb61687: mov eax, 0x7fc1
0xb6168c: cmp ax, cx
0xb6168f: jb 0x140b618f2
0xb61695: cmp byte ptr [rsi + 0x21], r13b
0xb61699: je 0x140b616a3
0xb6169b: mov dword ptr [rdx], r13d
0xb6169e: jmp 0x140b619a2
0xb616a3: mov dword ptr [rbp + 0x50], r13d
0xb616a7: vxorps xmm0, xmm0, xmm0
0xb616ab: vmovss dword ptr [rbp - 0x60], xmm0
0xb616b0: vmovss dword ptr [rbp - 0x5c], xmm0
0xb616b5: vmovss dword ptr [rbp - 0x58], xmm0
0xb616ba: movzx ecx, word ptr [r14 + 3]
0xb616bf: lea r15, [rip + 0x4bc05fa]
0xb616c6: mov qword ptr [rbp - 0x80], r15
0xb616ca: mov byte ptr [rbp - 0x78], r13b
0xb616ce: lea r12, [rip + 0x4bc058b]
0xb616d5: mov qword ptr [rbp - 0x80], r12
0xb616d9: lea rax, [r14 + 5]
0xb616dd: mov qword ptr [rbp - 0x70], rax
0xb616e1: mov dword ptr [rbp - 0x68], ecx
0xb616e4: mov dword ptr [rbp - 0x64], r13d
0xb616e8: mov rax, qword ptr [rip + 0x6207a99]
0xb616ef: mov rsi, qword ptr [rax + 0x38]
0xb616f3: mov rax, qword ptr [rbp - 0x80]
0xb616f7: mov r9, qword ptr [rax + 8]
0xb616fb: lea rax, [rip + 0x8bdb6e]
0xb61702: mov r8d, 4
0xb61708: lea rdx, [rbp + 0x50]
0xb6170c: lea rcx, [rbp - 0x80]
0xb61710: cmp r9, rax
0xb61713: jne 0x140b6171c
0xb61715: call 0x14141f270
0xb6171a: jmp 0x140b6171f
0xb6171c: call r9
0xb6171f: test al, al
0xb61721: jne 0x140b61738
0xb61723: mov eax, dword ptr [rip + 0x617a247]
0xb61729: mov dword ptr [rbx], eax
0xb6172b: mov qword ptr [rbp - 0x80], r12
0xb6172f: mov qword ptr [rbp - 0x80], r15
0xb61733: jmp 0x140b619a2
0xb61738: mov edx, dword ptr [rbp + 0x50]
0xb6173b: test edx, edx
0xb6173d: je 0x140b6176e
0xb6173f: mov eax, edx
0xb61741: and eax, 0x30000000
0xb61746: cmp eax, 0x10000000
0xb6174b: je 0x140b6176e
0xb6174d: mov rcx, rsi
0xb61750: call 0x1408b53c0
0xb61755: test al, al
0xb61757: je 0x140b6176e
0xb61759: mov eax, dword ptr [rip + 0x617a271]
0xb6175f: mov dword ptr [rbx], eax
0xb61761: mov qword ptr [rbp - 0x80], r12
0xb61765: mov qword ptr [rbp - 0x80], r15
0xb61769: jmp 0x140b619a2
0xb6176e: mov rax, qword ptr [rbp - 0x80]
0xb61772: mov r9, qword ptr [rax + 8]
0xb61776: lea rax, [rip - 0x807bdd]
0xb6177d: cmp r9, rax
0xb61780: je 0x140b618dd
0xb61786: mov r8d, 0xc
0xb6178c: lea rdx, [rbp - 0x60]
0xb61790: lea rcx, [rbp - 0x80]
0xb61794: call r9
0xb61797: test al, al
0xb61799: je 0x140b618dd
0xb6179f: mov rax, qword ptr [rbp - 0x80]
0xb617a3: mov r9, qword ptr [rax + 8]
0xb617a7: lea rax, [rip - 0x807c0e]
0xb617ae: cmp r9, rax
0xb617b1: je 0x140b618c8
0xb617b7: mov r8d, 8
0xb617bd: lea rdx, [rbp - 0x48]
0xb617c1: lea rcx, [rbp - 0x80]
0xb617c5: call r9
0xb617c8: test al, al
0xb617ca: je 0x140b618c8
0xb617d0: movzx eax, word ptr [r14 + 3]
0xb617d5: cmp dword ptr [rbp - 0x64], eax
0xb617d8: je 0x140b617ef
0xb617da: mov eax, dword ptr [rip + 0x617a190]
0xb617e0: mov dword ptr [rbx], eax
0xb617e2: mov qword ptr [rbp - 0x80], r12
0xb617e6: mov qword ptr [rbp - 0x80], r15
0xb617ea: jmp 0x140b619a2
0xb617ef: mov r8d, dword ptr [rbp + 0x50]
0xb617f3: lea rdx, [rbp - 0x30]
0xb617f7: mov rcx, rsi
0xb617fa: call 0x1408a67e0
0xb617ff: nop 
0xb61800: cmp byte ptr [rbp - 0x20], 0
0xb61804: je 0x140b6182f
0xb61806: mov rsi, qword ptr [rbp - 0x28]
0xb6180a: mov rcx, rsi
0xb6180d: call 0x140466060
0xb61812: test al, al
0xb61814: je 0x140b6182c
0xb61816: mov rax, qword ptr [rsi + 0x68]
0xb6181a: mov rcx, qword ptr [rax + 0x1a0]
0xb61821: mov rax, qword ptr [rcx]
0xb61824: xor edx, edx
0xb61826: call qword ptr [rax + 0x150]
0xb6182c: mov qword ptr [rdi], rsi
0xb6182f: mov rcx, qword ptr [rdi]
0xb61832: test rcx, rcx
0xb61835: je 0x140b61898
0xb61837: mov rcx, qword ptr [rcx + 0x68]
0xb6183b: lea r9, [rbp - 0x48]
0xb6183f: lea r8, [rbp - 0x60]
0xb61843: lea rdx, [rbp + 0x58]
0xb61847: mov rcx, qword ptr [rcx + 0x1a0]
0xb6184e: call 0x1409fea40
0xb61853: mov eax, dword ptr [rax]
0xb61855: test eax, eax
0xb61857: je 0x140b61898
0xb61859: lea rcx, [rip + 0x4ae6858]
0xb61860: mov qword ptr [rsp + 0x58], rcx
0xb61865: mov dword ptr [rsp + 0x50], 6
0xb6186d: mov dword ptr [rsp + 0x48], eax
0xb61871: lea r9, [rip + 0x4a11c34]
0xb61878: mov qword ptr [rsp + 0x40], r9
0xb6187d: mov dword ptr [rsp + 0x38], r13d
0xb61882: mov qword ptr [rsp + 0x30], r9
0xb61887: mov qword ptr [rsp + 0x28], r9
0xb6188c: mov qword ptr [rsp + 0x20], r9
0xb61891: mov cl, 1
0xb61893: call 0x14035d8d0
0xb61898: mov dword ptr [rbx], r13d
0xb6189b: lea rax, [rip + 0x4a11f9e]
0xb618a2: mov qword ptr [rbp - 0x30], rax
0xb618a6: lea rax, [rip + 0x4bc459b]
0xb618ad: mov qword ptr [rbp - 0x30], rax
0xb618b1: lea rcx, [rbp - 0x30]
0xb618b5: call 0x141434880
0xb618ba: nop 
0xb618bb: mov qword ptr [rbp - 0x80], r12
0xb618bf: mov qword ptr [rbp - 0x80], r15
0xb618c3: jmp 0x140b619a2
0xb618c8: mov eax, dword ptr [rip + 0x617a0a2]
0xb618ce: mov dword ptr [rbx], eax
0xb618d0: mov qword ptr [rbp - 0x80], r12
0xb618d4: mov qword ptr [rbp - 0x80], r15
0xb618d8: jmp 0x140b619a2
0xb618dd: mov eax, dword ptr [rip + 0x617a08d]
0xb618e3: mov dword ptr [rbx], eax
0xb618e5: mov qword ptr [rbp - 0x80], r12
0xb618e9: mov qword ptr [rbp - 0x80], r15
0xb618ed: jmp 0x140b619a2
0xb618f2: mov rdi, qword ptr [r8]
0xb618f5: test rdi, rdi
0xb618f8: je 0x140b61979
0xb618fa: mov rax, qword ptr [rdi]
0xb618fd: lea rdx, [rbp - 0x10]
0xb61901: mov rcx, rdi
0xb61904: call qword ptr [rax + 0xd0]
0xb6190a: mov rdx, qword ptr [rax]
0xb6190d: mov qword ptr [rbp + 0x58], rdx
0xb61911: mov rax, qword ptr [rdi]
0xb61914: lea rdx, [rbp - 8]
0xb61918: mov rcx, rdi
0xb6191b: call qword ptr [rax + 0xd8]
0xb61921: mov rdx, qword ptr [rax]
0xb61924: mov qword ptr [rbp - 0x40], rdx
0xb61928: mov rax, qword ptr [rdi]
0xb6192b: mov rcx, rdi
0xb6192e: call qword ptr [rax + 0xc8]
0xb61934: mov qword ptr [rbp - 0x38], rax
0xb61938: lea rax, [rsi + 0xc]
0xb6193c: lea rcx, [rsi + 0x22]
0xb61940: lea rdx, [rbp + 0x58]
0xb61944: mov qword ptr [rsp + 0x80], rdx
0xb6194c: lea rdx, [rbp - 0x40]
0xb61950: mov qword ptr [rsp + 0x78], rdx
0xb61955: lea rdx, [rbp - 0x38]
0xb61959: mov qword ptr [rsp + 0x70], rdx
0xb6195e: mov qword ptr [rsp + 0x68], rax
0xb61963: mov qword ptr [rsp + 0x60], rcx
0xb61968: mov eax, dword ptr [rip + 0x617a006]
0xb6196e: mov dword ptr [rsp + 0x48], eax
0xb61972: call 0x14143b450
0xb61977: jmp 0x140b6199a
0xb61979: lea rax, [rsi + 0xc]
0xb6197d: lea rcx, [rsi + 0x22]
0xb61981: mov qword ptr [rsp + 0x68], rax
0xb61986: mov qword ptr [rsp + 0x60], rcx
0xb6198b: mov eax, dword ptr [rip + 0x6179fe3]
0xb61991: mov dword ptr [rsp + 0x48], eax
0xb61995: call 0x14143b670
0xb6199a: mov eax, dword ptr [rip + 0x6179fd4]
0xb619a0: mov dword ptr [rbx], eax
0xb619a2: mov rax, rbx
0xb619a5: mov rbx, qword ptr [rsp + 0x150]
0xb619ad: add rsp, 0x110
0xb619b4: pop r15
0xb619b6: pop r14
0xb619b8: pop r13
0xb619ba: pop r12
0xb619bc: pop rdi
0xb619bd: pop rsi
0xb619be: pop rbp
0xb619bf: ret 