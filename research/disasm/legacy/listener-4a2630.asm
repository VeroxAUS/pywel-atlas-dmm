0x4a2630: mov qword ptr [rsp + 0x10], rbx
0x4a2635: mov qword ptr [rsp + 0x18], rbp
0x4a263a: push rsi
0x4a263b: push rdi
0x4a263c: push r14
0x4a263e: sub rsp, 0x50
0x4a2642: mov edi, dword ptr [rcx]
0x4a2644: mov rbx, qword ptr [rip + 0x68cbded]
0x4a264b: cmp edi, dword ptr [rbx + 8]
0x4a264e: jae 0x1404a2736
0x4a2654: lea rsi, [rdi*8]
0x4a265c: mov rax, qword ptr [rbx + 0x58]
0x4a2660: mov rax, qword ptr [rsi + rax]
0x4a2664: test rax, rax
0x4a2667: jne 0x1404a2740
0x4a266d: lea r14, [rbx + 0x90]
0x4a2674: cmp qword ptr [r14], rax
0x4a2677: jne 0x1404a269e
0x4a2679: mov qword ptr [rsp + 0x20], r14
0x4a267e: xor r9d, r9d
0x4a2681: lea r8, [rip + 0x5313f18]
0x4a2688: mov rdx, qword ptr [rbx + 0x10]
0x4a268c: lea rcx, [rsp + 0x70]
0x4a2691: call 0x1425c5230
0x4a2696: mov eax, dword ptr [rsp + 0x70]
0x4a269a: test eax, eax
0x4a269c: jne 0x1404a2717
0x4a269e: call 0x141416af0
0x4a26a3: add rax, 0x7d0
0x4a26a9: mov qword ptr [rbx + 0x98], rax
0x4a26b0: mov rcx, qword ptr [r14]
0x4a26b3: mov rdx, qword ptr [rbx + 0x28]
0x4a26b7: lea r14, [rip + 0x527f602]
0x4a26be: mov qword ptr [rsp + 0x30], r14
0x4a26c3: mov byte ptr [rsp + 0x38], 0
0x4a26c8: lea rbp, [rip + 0x527f591]
0x4a26cf: mov qword ptr [rsp + 0x30], rbp
0x4a26d4: mov rax, qword ptr [rcx]
0x4a26d7: mov qword ptr [rsp + 0x40], rax
0x4a26dc: mov eax, dword ptr [rcx + 0xc]
0x4a26df: mov dword ptr [rsp + 0x48], eax
0x4a26e3: mov dword ptr [rsp + 0x4c], 0
0x4a26eb: mov eax, dword ptr [rdx + rsi + 4]
0x4a26ef: mov dword ptr [rsp + 0x4c], eax
0x4a26f3: lea r9, [rsp + 0x30]
0x4a26f8: mov r8d, edi
0x4a26fb: lea rdx, [rsp + 0x70]
0x4a2700: mov rcx, rbx
0x4a2703: call 0x1404a6440
0x4a2708: nop 
0x4a2709: mov qword ptr [rsp + 0x30], rbp
0x4a270e: mov qword ptr [rsp + 0x30], r14
0x4a2713: mov eax, dword ptr [rsp + 0x70]
0x4a2717: mov rcx, qword ptr [rip + 0x683b9ea]
0x4a271e: test eax, eax
0x4a2720: je 0x1404a2727
0x4a2722: mov rax, rcx
0x4a2725: jmp 0x1404a272f
0x4a2727: mov rax, qword ptr [rbx + 0x58]
0x4a272b: mov rax, qword ptr [rsi + rax]
0x4a272f: test rax, rax
0x4a2732: je 0x1404a273d
0x4a2734: jmp 0x1404a2740
0x4a2736: mov rcx, qword ptr [rip + 0x683b9cb]
0x4a273d: mov rax, rcx
0x4a2740: mov rbx, qword ptr [rsp + 0x78]
0x4a2745: mov rbp, qword ptr [rsp + 0x80]
0x4a274d: add rsp, 0x50
0x4a2751: pop r14
0x4a2753: pop rdi
0x4a2754: pop rsi
0x4a2755: ret 