0x29874b0: mov qword ptr [rsp + 8], rbx
0x29874b5: push rbp
0x29874b6: push rsi
0x29874b7: push rdi
0x29874b8: push r12
0x29874ba: push r13
0x29874bc: push r14
0x29874be: push r15
0x29874c0: lea rbp, [rsp - 0x27]
0x29874c5: sub rsp, 0xb0
0x29874cc: mov rdi, rdx
0x29874cf: mov rsi, rcx
0x29874d2: mov rax, qword ptr gs:[0x58]
0x29874db: mov r12, qword ptr [rax]
0x29874de: mov qword ptr [rbp - 0x29], r12
0x29874e2: mov eax, 0x250
0x29874e7: mov rax, qword ptr [rax + r12]
0x29874eb: xor ebx, ebx
0x29874ed: mov dword ptr [rax + 0x2b8], ebx
0x29874f3: lea r15, [rax + 0x2b0]
0x29874fa: mov rax, qword ptr [rdx]
0x29874fd: mov rdx, r15
0x2987500: mov rcx, rdi
0x2987503: call qword ptr [rax + 8]
0x2987506: mov r13d, dword ptr [r15 + 8]
0x298750a: test r13d, r13d
0x298750d: je 0x14298788a
0x2987513: mov rcx, rdi
0x2987516: call 0x142961ca0
0x298751b: mov rdi, rax
0x298751e: test rax, rax
0x2987521: je 0x1429875bf
0x2987527: mov qword ptr [rbp + 0x7f], rbx
0x298752b: lea rdx, [rbp + 0x7f]
0x298752f: mov rcx, rax
0x2987532: call 0x142961de0
0x2987537: mov rcx, rax
0x298753a: mov r14, qword ptr [rbp + 0x7f]
0x298753e: test r14, r14
0x2987541: jne 0x14298758c
0x2987543: lea rax, [rip + 0x319a0e6]
0x298754a: mov qword ptr [rsp + 0x58], rax
0x298754f: mov dword ptr [rsp + 0x50], 6
0x2987557: mov eax, dword ptr [rip + 0x4351eeb]
0x298755d: mov dword ptr [rsp + 0x48], eax
0x2987561: lea r9, [rip + 0x2bebf44]
0x2987568: mov qword ptr [rsp + 0x40], r9
0x298756d: mov dword ptr [rsp + 0x38], ebx
0x2987571: mov qword ptr [rsp + 0x30], r9
0x2987576: mov qword ptr [rsp + 0x28], r9
0x298757b: mov qword ptr [rsp + 0x20], r9
0x2987580: mov cl, 1
0x2987582: call 0x14035d8d0
0x2987587: jmp 0x14298788a
0x298758c: test rsi, rsi
0x298758f: je 0x142987594
0x2987591: mov ebx, dword ptr [rsi + 0x60]
0x2987594: mov dword ptr [rbp + 0x6f], ebx
0x2987597: mov rax, qword ptr [rax]
0x298759a: mov r8d, 4
0x29875a0: lea rdx, [rbp + 0x6f]
0x29875a4: call qword ptr [rax + 8]
0x29875a7: mov word ptr [r14], 0x844
0x29875ad: mov byte ptr [r14 + 2], 0xff
0x29875b2: mov rcx, rdi
0x29875b5: call 0x142961e90
0x29875ba: jmp 0x14298788a
0x29875bf: call 0x142962220
0x29875c4: mov qword ptr [rbp - 0x21], rbx
0x29875c8: mov dword ptr [rbp - 0x19], ebx
0x29875cb: mov word ptr [rbp - 0x15], bx
0x29875cf: mov qword ptr [rbp - 0x11], rbx
0x29875d3: mov edx, 9
0x29875d8: mov r9, qword ptr [rip + 0x43e20a1]
0x29875df: mov r9, qword ptr [r9 + 0x30]
0x29875e3: lea rcx, [rbp - 0x21]
0x29875e7: call 0x142771b30
0x29875ec: mov r14, rax
0x29875ef: mov rdi, qword ptr [rbp - 0x21]
0x29875f3: test rax, rax
0x29875f6: jne 0x142987644
0x29875f8: lea rax, [rip + 0x319a031]
0x29875ff: mov qword ptr [rsp + 0x58], rax
0x2987604: mov dword ptr [rsp + 0x50], 6
0x298760c: mov eax, dword ptr [rip + 0x4351e36]
0x2987612: mov dword ptr [rsp + 0x48], eax
0x2987616: lea r9, [rip + 0x2bebe8f]
0x298761d: mov qword ptr [rsp + 0x40], r9
0x2987622: mov dword ptr [rsp + 0x38], ebx
0x2987626: mov qword ptr [rsp + 0x30], r9
0x298762b: mov qword ptr [rsp + 0x28], r9
0x2987630: mov qword ptr [rsp + 0x20], r9
0x2987635: mov cl, 1
0x2987637: call 0x14035d8d0
0x298763c: mov ecx, dword ptr [rbp - 0x19]
0x298763f: jmp 0x1429877f8
0x2987644: lea rax, [rip + 0x2d9a5ed]
0x298764b: mov qword ptr [rbp - 9], rax
0x298764f: mov byte ptr [rbp - 1], 1
0x2987653: lea rax, [rip + 0x2d9a63e]
0x298765a: mov qword ptr [rbp - 9], rax
0x298765e: lea rax, [r14 + 5]
0x2987662: mov qword ptr [rbp + 7], rax
0x2987666: mov qword ptr [rbp + 0xf], 0x7fc1
0x298766e: mov byte ptr [rbp + 0x17], 0
0x2987672: test rsi, rsi
0x2987675: je 0x14298767c
0x2987677: mov eax, dword ptr [rsi + 0x60]
0x298767a: jmp 0x14298767e
0x298767c: mov eax, ebx
0x298767e: mov dword ptr [rbp + 0x77], eax
0x2987681: mov rax, qword ptr [rbp - 9]
0x2987685: mov r9, qword ptr [rax + 8]
0x2987689: lea rax, [rip - 0x262db40]
0x2987690: cmp r9, rax
0x2987693: je 0x1429876a6
0x2987695: mov r8d, 4
0x298769b: lea rdx, [rbp + 0x77]
0x298769f: lea rcx, [rbp - 9]
0x29876a3: call r9
0x29876a6: movzx eax, word ptr [rbp + 0x13]
0x29876aa: mov word ptr [r14 + 3], ax
0x29876af: movzx esi, word ptr [rbp + 0x13]
0x29876b3: mov r12d, 0x844
0x29876b9: mov word ptr [r14], r12w
0x29876bd: mov byte ptr [r14 + 2], 0xff
0x29876c2: add si, 5
0x29876c6: cmp r13d, 1
0x29876ca: jne 0x1429877b0
0x29876d0: mov rax, qword ptr [r15]
0x29876d3: mov r14, qword ptr [rax]
0x29876d6: test r14, r14
0x29876d9: je 0x1429877d7
0x29876df: mov rax, qword ptr [r14]
0x29876e2: mov rcx, r14
0x29876e5: call qword ptr [rax + 0x70]
0x29876e8: movzx r13d, al
0x29876ec: mov r15, qword ptr [r14 + 0x98]
0x29876f3: test r15, r15
0x29876f6: je 0x14298771d
0x29876f8: mov rdx, qword ptr [r15]
0x29876fb: mov rcx, r15
0x29876fe: call qword ptr [rdx + 0x10]
0x2987701: cmp al, 1
0x2987703: jne 0x142987718
0x2987705: movzx r8d, si
0x2987709: lea rdx, [rdi + 0x33]
0x298770d: mov rax, qword ptr [r15]
0x2987710: mov rcx, r15
0x2987713: call qword ptr [rax + 0x28]
0x2987716: jmp 0x14298771d
0x2987718: test r13b, r13b
0x298771b: je 0x142987788
0x298771d: cmp si, 1
0x2987721: jb 0x142987788
0x2987723: movzx ecx, word ptr [rdi + 0x803c]
0x298772a: sub rcx, 3
0x298772e: movzx eax, si
0x2987731: cmp rcx, rax
0x2987734: jb 0x142987788
0x2987736: add si, 0x1f
0x298773a: mov word ptr [rdi + 0x8038], si
0x2987741: mov word ptr [rdi + 0x803a], si
0x2987748: mov rax, qword ptr [rdi + 0x8030]
0x298774f: mov word ptr [rax], si
0x2987752: mov rax, qword ptr [rdi + 0x8030]
0x2987759: mov byte ptr [rax + 2], 0
0x298775d: movzx eax, word ptr [rdi + 0x8038]
0x2987764: mov dword ptr [rdi + 0x8040], eax
0x298776a: lea rdx, [rdi + 0x30]
0x298776e: movzx r8d, word ptr [rdx + 0x800a]
0x2987776: sub r8, rax
0x2987779: add r8, rdx
0x298777c: mov qword ptr [rdi + 0x8048], r8
0x2987783: mov word ptr [rbp - 0x15], r12w
0x2987788: mov byte ptr [rbp + 0x6f], 0
0x298778c: mov rax, qword ptr [r14]
0x298778f: lea r9, [rbp + 0x6f]
0x2987793: mov r8, rdi
0x2987796: lea rdx, [rbp + 0x7f]
0x298779a: mov rcx, r14
0x298779d: call qword ptr [rax + 0x48]
0x29877a0: cmp dword ptr [rbp + 0x7f], 0
0x29877a4: jne 0x1429877d7
0x29877a6: mov ecx, dword ptr [rbp - 0x19]
0x29877a9: dec ecx
0x29877ab: mov dword ptr [rbp - 0x19], ecx
0x29877ae: jmp 0x1429877da
0x29877b0: cmp dword ptr [r15 + 8], 0
0x29877b5: je 0x1429877d7
0x29877b7: mov edx, r12d
0x29877ba: mov qword ptr [rsp + 0x30], r15
0x29877bf: mov byte ptr [rsp + 0x20], 0
0x29877c4: movzx r9d, si
0x29877c8: mov r8, r14
0x29877cb: mov rcx, qword ptr [rip + 0x43e1eae]
0x29877d2: call 0x142773870
0x29877d7: mov ecx, dword ptr [rbp - 0x19]
0x29877da: lea rax, [rip + 0x2d9a4b7]
0x29877e1: mov qword ptr [rbp - 9], rax
0x29877e5: mov qword ptr [rbp + 7], rbx
0x29877e9: lea rax, [rip + 0x2d9a448]
0x29877f0: mov qword ptr [rbp - 9], rax
0x29877f4: mov r12, qword ptr [rbp - 0x29]
0x29877f8: test rdi, rdi
0x29877fb: je 0x14298788a
0x2987801: test ecx, ecx
0x2987803: jle 0x14298787b
0x2987805: mov eax, ecx
0x2987807: neg eax
0x2987809: lock xadd dword ptr [rdi + 0x8050], eax
0x2987811: cmp eax, ecx
0x2987813: jne 0x14298787b
0x2987815: mov dword ptr [rdi + 0x8038], ebx
0x298781b: mov dword ptr [rdi + 0x8040], ebx
0x2987821: lea rax, [rdi + 0x30]
0x2987825: mov qword ptr [rdi + 0x8048], rax
0x298782c: mov dword ptr [rdi + 0x8050], ebx
0x2987832: mov qword ptr [rbp + 0x6f], rdi
0x2987836: mov qword ptr [rbp + 0x7f], rdi
0x298783a: lea rcx, [rip + 0x2d9ea77]
0x2987841: mov qword ptr [rdi], rcx
0x2987844: mov qword ptr [rdi + 0x8030], rbx
0x298784b: mov qword ptr [rbp - 0x29], rax
0x298784f: mov qword ptr [rax + 0x8000], rbx
0x2987856: lea rax, [rip + 0x2d9ea6b]
0x298785d: mov qword ptr [rdi], rax
0x2987860: mov eax, 0x1fd
0x2987865: mov rcx, rdi
0x2987868: cmp byte ptr [rax + r12], 0
0x298786d: je 0x142987876
0x298786f: call 0x1447f03bc
0x2987874: jmp 0x14298787b
0x2987876: call 0x1447f02bc
0x298787b: mov qword ptr [rbp - 0x21], rbx
0x298787f: mov dword ptr [rbp - 0x19], ebx
0x2987882: mov word ptr [rbp - 0x15], bx
0x2987886: mov qword ptr [rbp - 0x11], rbx
0x298788a: mov rbx, qword ptr [rsp + 0xf0]
0x2987892: add rsp, 0xb0
0x2987899: pop r15
0x298789b: pop r14
0x298789d: pop r13
0x298789f: pop r12
0x29878a1: pop rdi
0x29878a2: pop rsi
0x29878a3: pop rbp
0x29878a4: ret 