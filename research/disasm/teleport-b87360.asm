0xb87360: mov qword ptr [rsp + 8], rbx
0xb87365: push rbp
0xb87366: push rsi
0xb87367: push rdi
0xb87368: push r12
0xb8736a: push r13
0xb8736c: push r14
0xb8736e: push r15
0xb87370: lea rbp, [rsp - 0x1030]
0xb87378: mov eax, 0x1140
0xb8737d: call 0x1448962c0
0xb87382: sub rsp, rax
0xb87385: mov r15, r8
0xb87388: mov rdi, rdx
0xb8738b: mov rbx, rcx
0xb8738e: xor edx, edx
0xb87390: mov r14, qword ptr [r8 + 0x18]
0xb87394: movzx ecx, word ptr [r14 + 3]
0xb87399: movzx eax, word ptr [r8 + 0x10]
0xb8739e: sub rax, 5
0xb873a2: cmp rax, rcx
0xb873a5: jne 0x140b877c1
0xb873ab: cmp byte ptr [r8 + 0x38], dl
0xb873af: jne 0x140b873bf
0xb873b1: mov eax, 0x7fc1
0xb873b6: cmp ax, cx
0xb873b9: jb 0x140b877c1
0xb873bf: cmp byte ptr [rbx + 0x21], dl
0xb873c2: je 0x140b873cb
0xb873c4: mov dword ptr [rdi], edx
0xb873c6: jmp 0x140b87871
0xb873cb: mov dword ptr [rbp + 0x1088], edx
0xb873d1: mov byte ptr [rbp + 0x1080], dl
0xb873d7: mov dword ptr [rbp - 0x58], edx
0xb873da: lea rax, [rbp + 0x10]
0xb873de: mov qword ptr [rbp], rax
0xb873e2: mov dword ptr [rbp + 8], edx
0xb873e5: mov dword ptr [rbp + 0xc], 0x56
0xb873ec: movzx ecx, word ptr [r14 + 3]
0xb873f1: lea rbx, [rip + 0x4b9a8c8]
0xb873f8: mov qword ptr [rbp - 0x80], rbx
0xb873fc: mov byte ptr [rbp - 0x78], 0
0xb87400: lea rsi, [rip + 0x4b9a859]
0xb87407: mov qword ptr [rbp - 0x80], rsi
0xb8740b: lea rax, [r14 + 5]
0xb8740f: mov qword ptr [rbp - 0x70], rax
0xb87413: mov dword ptr [rbp - 0x68], ecx
0xb87416: mov dword ptr [rbp - 0x64], edx
0xb87419: mov rax, qword ptr [rip + 0x61e1d68]
0xb87420: mov r12, qword ptr [rax + 0x38]
0xb87424: mov rax, qword ptr [rbp - 0x80]
0xb87428: mov r9, qword ptr [rax + 8]
0xb8742c: lea rax, [rip + 0x897e3d]
0xb87433: mov r8d, 1
0xb87439: lea rdx, [rbp + 0x1080]
0xb87440: lea rcx, [rbp - 0x80]
0xb87444: cmp r9, rax
0xb87447: jne 0x140b87450
0xb87449: call 0x14141f270
0xb8744e: jmp 0x140b87453
0xb87450: call r9
0xb87453: test al, al
0xb87455: jne 0x140b8746c
0xb87457: mov eax, dword ptr [rip + 0x6154513]
0xb8745d: mov dword ptr [rdi], eax
0xb8745f: mov qword ptr [rbp - 0x80], rsi
0xb87463: mov qword ptr [rbp - 0x80], rbx
0xb87467: jmp 0x140b8777a
0xb8746c: mov rax, qword ptr [rbp - 0x80]
0xb87470: mov r9, qword ptr [rax + 8]
0xb87474: lea r13, [rip - 0x82d8db]
0xb8747b: cmp r9, r13
0xb8747e: je 0x140b8776a
0xb87484: mov r8d, 4
0xb8748a: lea rdx, [rbp + 0x1088]
0xb87491: lea rcx, [rbp - 0x80]
0xb87495: call r9
0xb87498: test al, al
0xb8749a: je 0x140b8776a
0xb874a0: mov rax, qword ptr [rbp - 0x80]
0xb874a4: mov r9, qword ptr [rax + 8]
0xb874a8: cmp r9, r13
0xb874ab: je 0x140b87758
0xb874b1: mov r8d, 4
0xb874b7: lea rdx, [rbp - 0x60]
0xb874bb: lea rcx, [rbp - 0x80]
0xb874bf: call r9
0xb874c2: test al, al
0xb874c4: je 0x140b87758
0xb874ca: mov eax, dword ptr [rbp - 0x60]
0xb874cd: mov dword ptr [rbp - 0x48], eax
0xb874d0: mov rax, qword ptr [rbp - 0x80]
0xb874d4: mov r9, qword ptr [rax + 8]
0xb874d8: cmp r9, r13
0xb874db: je 0x140b87746
0xb874e1: mov r8d, 4
0xb874e7: lea rdx, [rbp - 0x58]
0xb874eb: lea rcx, [rbp - 0x80]
0xb874ef: call r9
0xb874f2: test al, al
0xb874f4: je 0x140b87746
0xb874fa: mov rax, qword ptr [rbp - 0x80]
0xb874fe: mov r9, qword ptr [rax + 8]
0xb87502: cmp r9, r13
0xb87505: je 0x140b87734
0xb8750b: mov r8d, 4
0xb87511: lea rdx, [rbp - 0x60]
0xb87515: lea rcx, [rbp - 0x80]
0xb87519: call r9
0xb8751c: test al, al
0xb8751e: je 0x140b87734
0xb87524: mov eax, dword ptr [rbp - 0x60]
0xb87527: mov dword ptr [rbp - 0x50], eax
0xb8752a: xor esi, esi
0xb8752c: movzx ecx, word ptr [r14 + 3]
0xb87531: sub ecx, dword ptr [rbp - 0x64]
0xb87534: mov eax, 0xaaaaaaab
0xb87539: mul ecx
0xb8753b: shr edx, 5
0xb8753e: lea rcx, [rbp]
0xb87542: call 0x140c20f30
0xb87547: movzx eax, word ptr [r14 + 3]
0xb8754c: mov ecx, dword ptr [rbp - 0x64]
0xb8754f: cmp ecx, eax
0xb87551: jae 0x140b875e0
0xb87557: nop word ptr [rax + rax]
0xb87560: lea rbx, [rsi + rsi*2]
0xb87564: shl rbx, 4
0xb87568: add rbx, qword ptr [rbp]
0xb8756c: lea esi, [rsi + 1]
0xb8756f: mov rax, qword ptr [rbp - 0x80]
0xb87573: mov r9, qword ptr [rax + 8]
0xb87577: cmp r9, r13
0xb8757a: je 0x140b87603
0xb87580: mov r8d, 4
0xb87586: lea rdx, [rbp - 0x60]
0xb8758a: lea rcx, [rbp - 0x80]
0xb8758e: call r9
0xb87591: test al, al
0xb87593: je 0x140b87603
0xb87595: mov eax, dword ptr [rbp - 0x60]
0xb87598: mov dword ptr [rbx], eax
0xb8759a: mov rax, qword ptr [rbp - 0x80]
0xb8759e: mov r9, qword ptr [rax + 8]
0xb875a2: cmp r9, r13
0xb875a5: je 0x140b87603
0xb875a7: lea rdx, [rbx + 4]
0xb875ab: mov r8d, 4
0xb875b1: lea rcx, [rbp - 0x80]
0xb875b5: call r9
0xb875b8: test al, al
0xb875ba: je 0x140b87603
0xb875bc: lea rdx, [rbx + 8]
0xb875c0: lea rcx, [rbp - 0x80]
0xb875c4: call 0x14141fb70
0xb875c9: test al, al
0xb875cb: je 0x140b87603
0xb875cd: movzx eax, word ptr [r14 + 3]
0xb875d2: mov ecx, dword ptr [rbp - 0x64]
0xb875d5: cmp ecx, eax
0xb875d7: jb 0x140b87560
0xb875d9: lea rbx, [rip + 0x4b9a6e0]
0xb875e0: movzx eax, ax
0xb875e3: cmp ecx, eax
0xb875e5: je 0x140b87626
0xb875e7: mov eax, dword ptr [rip + 0x6154383]
0xb875ed: mov dword ptr [rdi], eax
0xb875ef: lea rax, [rip + 0x4b9a66a]
0xb875f6: mov qword ptr [rbp - 0x80], rax
0xb875fa: mov qword ptr [rbp - 0x80], rbx
0xb875fe: jmp 0x140b8777a
0xb87603: mov eax, dword ptr [rip + 0x6154367]
0xb87609: mov dword ptr [rdi], eax
0xb8760b: lea rax, [rip + 0x4b9a64e]
0xb87612: mov qword ptr [rbp - 0x80], rax
0xb87616: lea rax, [rip + 0x4b9a6a3]
0xb8761d: mov qword ptr [rbp - 0x80], rax
0xb87621: jmp 0x140b8777a
0xb87626: mov r8d, dword ptr [rbp + 0x1088]
0xb8762d: lea rdx, [rbp - 0x28]
0xb87631: mov rcx, r12
0xb87634: call 0x1408a67e0
0xb87639: nop 
0xb8763a: cmp byte ptr [rbp - 0x18], 0
0xb8763e: je 0x140b87669
0xb87640: mov rbx, qword ptr [rbp - 0x20]
0xb87644: mov rcx, rbx
0xb87647: call 0x140466060
0xb8764c: test al, al
0xb8764e: je 0x140b87666
0xb87650: mov rax, qword ptr [rbx + 0x68]
0xb87654: mov rcx, qword ptr [rax + 0x1a0]
0xb8765b: mov rax, qword ptr [rcx]
0xb8765e: xor edx, edx
0xb87660: call qword ptr [rax + 0x150]
0xb87666: mov qword ptr [r15], rbx
0xb87669: mov rax, qword ptr [rbp]
0xb8766d: mov qword ptr [rbp - 0x38], rax
0xb87671: mov eax, dword ptr [rbp + 8]
0xb87674: mov dword ptr [rbp - 0x30], eax
0xb87677: mov rcx, qword ptr [r15]
0xb8767a: test rcx, rcx
0xb8767d: je 0x140b876f6
0xb8767f: mov rcx, qword ptr [rcx + 0x68]
0xb87683: lea rax, [rbp - 0x38]
0xb87687: mov qword ptr [rsp + 0x28], rax
0xb8768c: lea rax, [rbp - 0x50]
0xb87690: mov qword ptr [rsp + 0x20], rax
0xb87695: lea r9, [rbp - 0x58]
0xb87699: lea r8, [rbp - 0x48]
0xb8769d: lea rdx, [rbp - 0x60]
0xb876a1: mov rcx, qword ptr [rcx + 0x1a0]
0xb876a8: call 0x1409fa660
0xb876ad: mov eax, dword ptr [rbp - 0x60]
0xb876b0: test eax, eax
0xb876b2: je 0x140b876f6
0xb876b4: lea rcx, [rip + 0x4abf825]
0xb876bb: mov qword ptr [rsp + 0x58], rcx
0xb876c0: mov dword ptr [rsp + 0x50], 6
0xb876c8: mov dword ptr [rsp + 0x48], eax
0xb876cc: lea r9, [rip + 0x49ebdd9]
0xb876d3: mov qword ptr [rsp + 0x40], r9
0xb876d8: mov dword ptr [rsp + 0x38], 0
0xb876e0: mov qword ptr [rsp + 0x30], r9
0xb876e5: mov qword ptr [rsp + 0x28], r9
0xb876ea: mov qword ptr [rsp + 0x20], r9
0xb876ef: mov cl, 1
0xb876f1: call 0x14035d8d0
0xb876f6: mov dword ptr [rdi], 0
0xb876fc: lea rax, [rip + 0x49ec13d]
0xb87703: mov qword ptr [rbp - 0x28], rax
0xb87707: lea rax, [rip + 0x4b9e73a]
0xb8770e: mov qword ptr [rbp - 0x28], rax
0xb87712: lea rcx, [rbp - 0x28]
0xb87716: call 0x141434880
0xb8771b: nop 
0xb8771c: lea rax, [rip + 0x4b9a53d]
0xb87723: mov qword ptr [rbp - 0x80], rax
0xb87727: lea rax, [rip + 0x4b9a592]
0xb8772e: mov qword ptr [rbp - 0x80], rax
0xb87732: jmp 0x140b8777a
0xb87734: mov eax, dword ptr [rip + 0x6154236]
0xb8773a: mov dword ptr [rdi], eax
0xb8773c: mov qword ptr [rbp - 0x80], rsi
0xb87740: mov qword ptr [rbp - 0x80], rbx
0xb87744: jmp 0x140b8777a
0xb87746: mov eax, dword ptr [rip + 0x6154224]
0xb8774c: mov dword ptr [rdi], eax
0xb8774e: mov qword ptr [rbp - 0x80], rsi
0xb87752: mov qword ptr [rbp - 0x80], rbx
0xb87756: jmp 0x140b8777a
0xb87758: mov eax, dword ptr [rip + 0x6154212]
0xb8775e: mov dword ptr [rdi], eax
0xb87760: mov qword ptr [rbp - 0x80], rsi
0xb87764: mov qword ptr [rbp - 0x80], rbx
0xb87768: jmp 0x140b8777a
0xb8776a: mov eax, dword ptr [rip + 0x6154200]
0xb87770: mov dword ptr [rdi], eax
0xb87772: mov qword ptr [rbp - 0x80], rsi
0xb87776: mov qword ptr [rbp - 0x80], rbx
0xb8777a: lea rax, [rbp + 0x10]
0xb8777e: mov rcx, qword ptr [rbp]
0xb87782: cmp rcx, rax
0xb87785: je 0x140b87871
0xb8778b: test rcx, rcx
0xb8778e: je 0x140b87871
0xb87794: mov rax, qword ptr gs:[0x58]
0xb8779d: mov rdx, qword ptr [rax]
0xb877a0: mov r8d, 0x1fd
0xb877a6: cmp byte ptr [r8 + rdx], 0
0xb877ab: je 0x140b877b7
0xb877ad: call 0x1447f03bc
0xb877b2: jmp 0x140b87871
0xb877b7: call 0x1447f02bc
0xb877bc: jmp 0x140b87871
0xb877c1: mov rsi, qword ptr [r8]
0xb877c4: test rsi, rsi
0xb877c7: je 0x140b87848
0xb877c9: mov rax, qword ptr [rsi]
0xb877cc: lea rdx, [rbp - 8]
0xb877d0: mov rcx, rsi
0xb877d3: call qword ptr [rax + 0xd0]
0xb877d9: mov rdx, qword ptr [rax]
0xb877dc: mov qword ptr [rbp - 0x48], rdx
0xb877e0: mov rax, qword ptr [rsi]
0xb877e3: lea rdx, [rbp - 0x38]
0xb877e7: mov rcx, rsi
0xb877ea: call qword ptr [rax + 0xd8]
0xb877f0: mov rdx, qword ptr [rax]
0xb877f3: mov qword ptr [rbp - 0x50], rdx
0xb877f7: mov rax, qword ptr [rsi]
0xb877fa: mov rcx, rsi
0xb877fd: call qword ptr [rax + 0xc8]
0xb87803: mov qword ptr [rbp - 0x60], rax
0xb87807: lea rax, [rbx + 0xc]
0xb8780b: lea rcx, [rbx + 0x22]
0xb8780f: lea rdx, [rbp - 0x48]
0xb87813: mov qword ptr [rsp + 0x80], rdx
0xb8781b: lea rdx, [rbp - 0x50]
0xb8781f: mov qword ptr [rsp + 0x78], rdx
0xb87824: lea rdx, [rbp - 0x60]
0xb87828: mov qword ptr [rsp + 0x70], rdx
0xb8782d: mov qword ptr [rsp + 0x68], rax
0xb87832: mov qword ptr [rsp + 0x60], rcx
0xb87837: mov eax, dword ptr [rip + 0x6154137]
0xb8783d: mov dword ptr [rsp + 0x48], eax
0xb87841: call 0x14143b450
0xb87846: jmp 0x140b87869
0xb87848: lea rax, [rbx + 0xc]
0xb8784c: lea rcx, [rbx + 0x22]
0xb87850: mov qword ptr [rsp + 0x68], rax
0xb87855: mov qword ptr [rsp + 0x60], rcx
0xb8785a: mov eax, dword ptr [rip + 0x6154114]
0xb87860: mov dword ptr [rsp + 0x48], eax
0xb87864: call 0x14143b670
0xb87869: mov eax, dword ptr [rip + 0x6154105]
0xb8786f: mov dword ptr [rdi], eax
0xb87871: mov rax, rdi
0xb87874: mov rbx, qword ptr [rsp + 0x1180]
0xb8787c: add rsp, 0x1140
0xb87883: pop r15
0xb87885: pop r14
0xb87887: pop r13
0xb87889: pop r12
0xb8788b: pop rdi
0xb8788c: pop rsi
0xb8788d: pop rbp
0xb8788e: ret 