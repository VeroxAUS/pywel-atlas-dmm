0x186f570: mov qword ptr [rsp + 8], rbx
0x186f575: mov qword ptr [rsp + 0x10], rsi
0x186f57a: mov qword ptr [rsp + 0x20], rdi
0x186f57f: mov dword ptr [rsp + 0x18], r8d
0x186f584: push rbp
0x186f585: push r12
0x186f587: push r13
0x186f589: push r14
0x186f58b: push r15
0x186f58d: lea rbp, [rsp - 0xb0]
0x186f595: sub rsp, 0x1b0
0x186f59c: mov r15, r9
0x186f59f: mov r14d, r8d
0x186f5a2: mov rdi, rdx
0x186f5a5: mov rsi, rcx
0x186f5a8: xor r13d, r13d
0x186f5ab: lea rax, [rbp + 0xf0]
0x186f5b2: mov qword ptr [rsp + 0x60], rax
0x186f5b7: lea rax, [rip + 0x3f6c1b2]
0x186f5be: mov qword ptr [rsp + 0x58], rax
0x186f5c3: mov dword ptr [rsp + 0x50], 1
0x186f5cb: mov dword ptr [rsp + 0x48], r13d
0x186f5d0: xor ecx, ecx
0x186f5d2: call 0x14035dae0
0x186f5d7: cmp r14d, 2
0x186f5db: jbe 0x14186f64a
0x186f5dd: lea eax, [r14 - 0x64]
0x186f5e1: cmp eax, 8
0x186f5e4: jbe 0x14186f64a
0x186f5e6: lea eax, [r14 - 0xc8]
0x186f5ed: cmp eax, 7
0x186f5f0: jbe 0x14186f64a
0x186f5f2: lea eax, [r14 - 3]
0x186f5f6: test eax, eax
0x186f5f8: je 0x14186f64a
0x186f5fa: mov dword ptr [rsp + 0x70], 0xe
0x186f602: lea rax, [rsp + 0x70]
0x186f607: mov qword ptr [rsp + 0x68], rax
0x186f60c: lea rax, [rbp + 0xf0]
0x186f613: mov qword ptr [rsp + 0x60], rax
0x186f618: lea rax, [rip + 0x3f6c021]
0x186f61f: mov qword ptr [rsp + 0x58], rax
0x186f624: mov dword ptr [rsp + 0x50], 6
0x186f62c: mov eax, dword ptr [rip + 0x54882ce]
0x186f632: mov dword ptr [rsp + 0x48], eax
0x186f636: mov cl, 1
0x186f638: call 0x141292ef0
0x186f63d: mov eax, dword ptr [rip + 0x54882bd]
0x186f643: mov dword ptr [rdi], eax
0x186f645: jmp 0x14186f8f2
0x186f64a: test r15, r15
0x186f64d: jne 0x14186f6a1
0x186f64f: lea rax, [rip + 0x3f6c07a]
0x186f656: mov qword ptr [rsp + 0x58], rax
0x186f65b: mov dword ptr [rsp + 0x50], 6
0x186f663: mov eax, dword ptr [rip + 0x54874ff]
0x186f669: mov dword ptr [rsp + 0x48], eax
0x186f66d: lea r9, [rip + 0x3d03e38]
0x186f674: mov qword ptr [rsp + 0x40], r9
0x186f679: mov dword ptr [rsp + 0x38], r13d
0x186f67e: mov qword ptr [rsp + 0x30], r9
0x186f683: mov qword ptr [rsp + 0x28], r9
0x186f688: mov qword ptr [rsp + 0x20], r9
0x186f68d: mov cl, 1
0x186f68f: call 0x14035d8d0
0x186f694: mov eax, dword ptr [rip + 0x54874ce]
0x186f69a: mov dword ptr [rdi], eax
0x186f69c: jmp 0x14186f8f2
0x186f6a1: mov qword ptr [rsp + 0x78], rsi
0x186f6a6: xor r12b, r12b
0x186f6a9: mov byte ptr [rbp - 0x80], r12b
0x186f6ad: mov rbx, qword ptr [rsi]
0x186f6b0: mov qword ptr [rsp + 0x70], rbx
0x186f6b5: mov rax, qword ptr [rbx]
0x186f6b8: mov rcx, rbx
0x186f6bb: call qword ptr [rax + 8]
0x186f6be: nop 
0x186f6bf: cmp byte ptr [rsi + 0x60], r12b
0x186f6c3: jne 0x14186f6d0
0x186f6c5: mov byte ptr [rsi + 0x60], 1
0x186f6c9: mov r12b, 1
0x186f6cc: mov byte ptr [rbp - 0x80], r12b
0x186f6d0: mov rax, qword ptr [rbx]
0x186f6d3: mov rcx, rbx
0x186f6d6: call qword ptr [rax + 0x10]
0x186f6d9: nop 
0x186f6da: test r12b, r12b
0x186f6dd: jne 0x14186f6ec
0x186f6df: mov eax, dword ptr [rip + 0x54885bf]
0x186f6e5: mov dword ptr [rdi], eax
0x186f6e7: jmp 0x14186f8f2
0x186f6ec: mov qword ptr [rbp + 0x98], r13
0x186f6f3: mov qword ptr [rbp + 0xa0], 0x105
0x186f6fe: mov dword ptr [rbp + 0xa4], r13d
0x186f705: mov byte ptr [rbp - 0x70], 0
0x186f709: mov dword ptr [rbp + 0xa4], r13d
0x186f710: mov byte ptr [rbp - 0x70], 0
0x186f714: mov rax, qword ptr [rbp + 0x98]
0x186f71b: test rax, rax
0x186f71e: je 0x14186f723
0x186f720: mov byte ptr [rax], 0
0x186f723: mov dword ptr [rsp + 0x70], r14d
0x186f728: mov dword ptr [rbp + 0xa4], 0xffffffff
0x186f732: lea rcx, [rbp - 0x70]
0x186f736: mov rax, qword ptr [rbp + 0x98]
0x186f73d: test rax, rax
0x186f740: cmovne rcx, rax
0x186f744: lea rax, [rsp + 0x70]
0x186f749: mov qword ptr [rsp + 0x20], rax
0x186f74e: lea r9, [rip + 0x3f39db3]
0x186f755: lea r8, [rip + 0x3d1f6dc]
0x186f75c: mov edx, dword ptr [rbp + 0xa0]
0x186f762: call 0x14066efb0
0x186f767: lea r9, [rbp - 0x70]
0x186f76b: mov rax, qword ptr [rbp + 0x98]
0x186f772: test rax, rax
0x186f775: cmovne r9, rax
0x186f779: mov dword ptr [rsp + 0x20], r14d
0x186f77e: mov r8, qword ptr [rsi + 0x50]
0x186f782: lea rdx, [rsp + 0x70]
0x186f787: mov rcx, r15
0x186f78a: call 0x1420688a0
0x186f78f: mov ebx, dword ptr [rax]
0x186f791: test ebx, ebx
0x186f793: je 0x14186f811
0x186f795: mov eax, dword ptr [r15 + 0x60]
0x186f799: mov dword ptr [rsp + 0x70], eax
0x186f79d: lea rax, [rbp + 0xf0]
0x186f7a4: mov qword ptr [rsp + 0x68], rax
0x186f7a9: lea rax, [rsp + 0x70]
0x186f7ae: mov qword ptr [rsp + 0x60], rax
0x186f7b3: mov dword ptr [rsp + 0x48], ebx
0x186f7b7: call 0x141872900
0x186f7bc: mov dword ptr [rdi], ebx
0x186f7be: mov rcx, qword ptr [rbp + 0x98]
0x186f7c5: test rcx, rcx
0x186f7c8: je 0x14186f7f6
0x186f7ca: mov r8d, 0x1fd
0x186f7d0: mov rax, qword ptr gs:[0x58]
0x186f7d9: mov rdx, qword ptr [rax]
0x186f7dc: cmp byte ptr [r8 + rdx], 0
0x186f7e1: je 0x14186f7ea
0x186f7e3: call 0x1447f03bc
0x186f7e8: jmp 0x14186f7ef
0x186f7ea: call 0x1447f02bc
0x186f7ef: mov qword ptr [rbp + 0x98], r13
0x186f7f6: mov rbx, qword ptr [rsi]
0x186f7f9: mov qword ptr [rsp + 0x70], rbx
0x186f7fe: mov rax, qword ptr [rbx]
0x186f801: mov rcx, rbx
0x186f804: call qword ptr [rax + 8]
0x186f807: nop 
0x186f808: mov byte ptr [rsi + 0x60], 0
0x186f80c: jmp 0x14186f8e9
0x186f811: mov rax, qword ptr [r15 + 0x88]
0x186f818: cmp byte ptr [rax + 1], 1
0x186f81c: jne 0x14186f86c
0x186f81e: cmp byte ptr [r15 + 0x96], 0
0x186f826: je 0x14186f86c
0x186f828: cmp byte ptr [rip + 0x5475249], 0
0x186f82f: je 0x14186f850
0x186f831: lea rdx, [rsi + 0x90]
0x186f838: cmp dword ptr [rdx + 8], 0
0x186f83c: jne 0x14186f844
0x186f83e: cmp dword ptr [rdx + 0x14], 0
0x186f842: je 0x14186f850
0x186f844: mov rax, qword ptr [r15]
0x186f847: mov rcx, r15
0x186f84a: call qword ptr [rax + 0x1d0]
0x186f850: cmp r14d, 0xce
0x186f857: jne 0x14186f86c
0x186f859: mov r9b, 1
0x186f85c: mov r8d, r14d
0x186f85f: lea rdx, [rsp + 0x70]
0x186f864: mov rcx, rsi
0x186f867: call 0x141871040
0x186f86c: lea rax, [rbp + 0xf0]
0x186f873: mov qword ptr [rsp + 0x60], rax
0x186f878: lea rax, [rip + 0x3f6bda1]
0x186f87f: mov qword ptr [rsp + 0x58], rax
0x186f884: mov dword ptr [rsp + 0x50], 1
0x186f88c: mov dword ptr [rsp + 0x48], r13d
0x186f891: xor ecx, ecx
0x186f893: call 0x14035dae0
0x186f898: mov dword ptr [rdi], r13d
0x186f89b: mov rcx, qword ptr [rbp + 0x98]
0x186f8a2: test rcx, rcx
0x186f8a5: je 0x14186f8d3
0x186f8a7: mov r8d, 0x1fd
0x186f8ad: mov rax, qword ptr gs:[0x58]
0x186f8b6: mov rdx, qword ptr [rax]
0x186f8b9: cmp byte ptr [r8 + rdx], 0
0x186f8be: je 0x14186f8c7
0x186f8c0: call 0x1447f03bc
0x186f8c5: jmp 0x14186f8cc
0x186f8c7: call 0x1447f02bc
0x186f8cc: mov qword ptr [rbp + 0x98], r13
0x186f8d3: mov rbx, qword ptr [rsi]
0x186f8d6: mov qword ptr [rsp + 0x70], rbx
0x186f8db: mov rax, qword ptr [rbx]
0x186f8de: mov rcx, rbx
0x186f8e1: call qword ptr [rax + 8]
0x186f8e4: nop 
0x186f8e5: mov byte ptr [rsi + 0x60], 0
0x186f8e9: mov rax, qword ptr [rbx]
0x186f8ec: mov rcx, rbx
0x186f8ef: call qword ptr [rax + 0x10]
0x186f8f2: mov rax, rdi
0x186f8f5: lea r11, [rsp + 0x1b0]
0x186f8fd: mov rbx, qword ptr [r11 + 0x30]
0x186f901: mov rsi, qword ptr [r11 + 0x38]
0x186f905: mov rdi, qword ptr [r11 + 0x48]
0x186f909: mov rsp, r11
0x186f90c: pop r15
0x186f90e: pop r14
0x186f910: pop r13
0x186f912: pop r12
0x186f914: pop rbp
0x186f915: ret 