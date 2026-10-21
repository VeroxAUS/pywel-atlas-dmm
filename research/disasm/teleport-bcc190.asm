0xbcc190: mov qword ptr [rsp + 8], rbx
0xbcc195: push rbp
0xbcc196: push rsi
0xbcc197: push rdi
0xbcc198: push r12
0xbcc19a: push r13
0xbcc19c: push r14
0xbcc19e: push r15
0xbcc1a0: lea rbp, [rsp - 0x27]
0xbcc1a5: sub rsp, 0x100
0xbcc1ac: mov rdi, r8
0xbcc1af: mov rbx, rdx
0xbcc1b2: mov rsi, rcx
0xbcc1b5: xor r13d, r13d
0xbcc1b8: mov r14, qword ptr [r8 + 0x18]
0xbcc1bc: movzx ecx, word ptr [r14 + 3]
0xbcc1c1: movzx eax, word ptr [r8 + 0x10]
0xbcc1c6: sub rax, 5
0xbcc1ca: cmp rax, rcx
0xbcc1cd: jne 0x140bcc3ed
0xbcc1d3: cmp byte ptr [r8 + 0x38], r13b
0xbcc1d7: jne 0x140bcc1e7
0xbcc1d9: mov eax, 0x7fc1
0xbcc1de: cmp ax, cx
0xbcc1e1: jb 0x140bcc3ed
0xbcc1e7: cmp byte ptr [rsi + 0x21], r13b
0xbcc1eb: je 0x140bcc1f5
0xbcc1ed: mov dword ptr [rdx], r13d
0xbcc1f0: jmp 0x140bcc49d
0xbcc1f5: mov dword ptr [rbp + 0x77], r13d
0xbcc1f9: movzx ecx, word ptr [r14 + 3]
0xbcc1fe: lea r15, [rip + 0x4b55abb]
0xbcc205: mov qword ptr [rbp - 0x49], r15
0xbcc209: mov byte ptr [rbp - 0x41], r13b
0xbcc20d: lea r12, [rip + 0x4b55a4c]
0xbcc214: mov qword ptr [rbp - 0x49], r12
0xbcc218: lea rax, [r14 + 5]
0xbcc21c: mov qword ptr [rbp - 0x39], rax
0xbcc220: mov dword ptr [rbp - 0x31], ecx
0xbcc223: mov dword ptr [rbp - 0x2d], r13d
0xbcc227: mov rax, qword ptr [rip + 0x619cf5a]
0xbcc22e: mov rsi, qword ptr [rax + 0x38]
0xbcc232: mov rax, qword ptr [rbp - 0x49]
0xbcc236: mov r9, qword ptr [rax + 8]
0xbcc23a: lea rax, [rip + 0x85302f]
0xbcc241: mov r8d, 4
0xbcc247: lea rdx, [rbp + 0x77]
0xbcc24b: lea rcx, [rbp - 0x49]
0xbcc24f: cmp r9, rax
0xbcc252: jne 0x140bcc25b
0xbcc254: call 0x14141f270
0xbcc259: jmp 0x140bcc25e
0xbcc25b: call r9
0xbcc25e: test al, al
0xbcc260: jne 0x140bcc277
0xbcc262: mov eax, dword ptr [rip + 0x610f708]
0xbcc268: mov dword ptr [rbx], eax
0xbcc26a: mov qword ptr [rbp - 0x49], r12
0xbcc26e: mov qword ptr [rbp - 0x49], r15
0xbcc272: jmp 0x140bcc49d
0xbcc277: mov edx, dword ptr [rbp + 0x77]
0xbcc27a: test edx, edx
0xbcc27c: je 0x140bcc2ad
0xbcc27e: mov eax, edx
0xbcc280: and eax, 0x30000000
0xbcc285: cmp eax, 0x10000000
0xbcc28a: je 0x140bcc2ad
0xbcc28c: mov rcx, rsi
0xbcc28f: call 0x1408b53c0
0xbcc294: test al, al
0xbcc296: je 0x140bcc2ad
0xbcc298: mov eax, dword ptr [rip + 0x610f732]
0xbcc29e: mov dword ptr [rbx], eax
0xbcc2a0: mov qword ptr [rbp - 0x49], r12
0xbcc2a4: mov qword ptr [rbp - 0x49], r15
0xbcc2a8: jmp 0x140bcc49d
0xbcc2ad: mov rax, qword ptr [rbp - 0x49]
0xbcc2b1: mov r9, qword ptr [rax + 8]
0xbcc2b5: lea rax, [rip - 0x87271c]
0xbcc2bc: cmp r9, rax
0xbcc2bf: je 0x140bcc3d8
0xbcc2c5: mov r8d, 4
0xbcc2cb: lea rdx, [rbp + 0x7f]
0xbcc2cf: lea rcx, [rbp - 0x49]
0xbcc2d3: call r9
0xbcc2d6: test al, al
0xbcc2d8: je 0x140bcc3d8
0xbcc2de: mov eax, dword ptr [rbp + 0x7f]
0xbcc2e1: mov dword ptr [rbp + 0x7f], eax
0xbcc2e4: movzx eax, word ptr [r14 + 3]
0xbcc2e9: cmp dword ptr [rbp - 0x2d], eax
0xbcc2ec: je 0x140bcc303
0xbcc2ee: mov eax, dword ptr [rip + 0x610f67c]
0xbcc2f4: mov dword ptr [rbx], eax
0xbcc2f6: mov qword ptr [rbp - 0x49], r12
0xbcc2fa: mov qword ptr [rbp - 0x49], r15
0xbcc2fe: jmp 0x140bcc49d
0xbcc303: mov r8d, dword ptr [rbp + 0x77]
0xbcc307: lea rdx, [rbp - 0x11]
0xbcc30b: mov rcx, rsi
0xbcc30e: call 0x1408a67e0
0xbcc313: nop 
0xbcc314: cmp byte ptr [rbp - 1], 0
0xbcc318: je 0x140bcc343
0xbcc31a: mov rsi, qword ptr [rbp - 9]
0xbcc31e: mov rcx, rsi
0xbcc321: call 0x140466060
0xbcc326: test al, al
0xbcc328: je 0x140bcc340
0xbcc32a: mov rax, qword ptr [rsi + 0x68]
0xbcc32e: mov rcx, qword ptr [rax + 0x1a0]
0xbcc335: mov rax, qword ptr [rcx]
0xbcc338: xor edx, edx
0xbcc33a: call qword ptr [rax + 0x150]
0xbcc340: mov qword ptr [rdi], rsi
0xbcc343: mov rcx, qword ptr [rdi]
0xbcc346: test rcx, rcx
0xbcc349: je 0x140bcc3a8
0xbcc34b: call 0x14212a150
0xbcc350: test rax, rax
0xbcc353: je 0x140bcc3a8
0xbcc355: lea r8, [rbp + 0x7f]
0xbcc359: lea rdx, [rbp - 0x29]
0xbcc35d: call 0x1409c8290
0xbcc362: mov eax, dword ptr [rbp - 0x29]
0xbcc365: test eax, eax
0xbcc367: je 0x140bcc3a8
0xbcc369: lea rcx, [rip + 0x4a7af90]
0xbcc370: mov qword ptr [rsp + 0x58], rcx
0xbcc375: mov dword ptr [rsp + 0x50], 6
0xbcc37d: mov dword ptr [rsp + 0x48], eax
0xbcc381: lea r9, [rip + 0x49a7124]
0xbcc388: mov qword ptr [rsp + 0x40], r9
0xbcc38d: mov dword ptr [rsp + 0x38], r13d
0xbcc392: mov qword ptr [rsp + 0x30], r9
0xbcc397: mov qword ptr [rsp + 0x28], r9
0xbcc39c: mov qword ptr [rsp + 0x20], r9
0xbcc3a1: mov cl, 1
0xbcc3a3: call 0x14035d8d0
0xbcc3a8: mov dword ptr [rbx], r13d
0xbcc3ab: lea rax, [rip + 0x49a748e]
0xbcc3b2: mov qword ptr [rbp - 0x11], rax
0xbcc3b6: lea rax, [rip + 0x4b59a8b]
0xbcc3bd: mov qword ptr [rbp - 0x11], rax
0xbcc3c1: lea rcx, [rbp - 0x11]
0xbcc3c5: call 0x141434880
0xbcc3ca: nop 
0xbcc3cb: mov qword ptr [rbp - 0x49], r12
0xbcc3cf: mov qword ptr [rbp - 0x49], r15
0xbcc3d3: jmp 0x140bcc49d
0xbcc3d8: mov eax, dword ptr [rip + 0x610f592]
0xbcc3de: mov dword ptr [rbx], eax
0xbcc3e0: mov qword ptr [rbp - 0x49], r12
0xbcc3e4: mov qword ptr [rbp - 0x49], r15
0xbcc3e8: jmp 0x140bcc49d
0xbcc3ed: mov rdi, qword ptr [r8]
0xbcc3f0: test rdi, rdi
0xbcc3f3: je 0x140bcc474
0xbcc3f5: mov rax, qword ptr [rdi]
0xbcc3f8: lea rdx, [rbp + 0xf]
0xbcc3fc: mov rcx, rdi
0xbcc3ff: call qword ptr [rax + 0xd0]
0xbcc405: mov rdx, qword ptr [rax]
0xbcc408: mov qword ptr [rbp + 0x7f], rdx
0xbcc40c: mov rax, qword ptr [rdi]
0xbcc40f: lea rdx, [rbp + 0x17]
0xbcc413: mov rcx, rdi
0xbcc416: call qword ptr [rax + 0xd8]
0xbcc41c: mov rdx, qword ptr [rax]
0xbcc41f: mov qword ptr [rbp - 0x29], rdx
0xbcc423: mov rax, qword ptr [rdi]
0xbcc426: mov rcx, rdi
0xbcc429: call qword ptr [rax + 0xc8]
0xbcc42f: mov qword ptr [rbp - 0x19], rax
0xbcc433: lea rax, [rsi + 0xc]
0xbcc437: lea rcx, [rsi + 0x22]
0xbcc43b: lea rdx, [rbp + 0x7f]
0xbcc43f: mov qword ptr [rsp + 0x80], rdx
0xbcc447: lea rdx, [rbp - 0x29]
0xbcc44b: mov qword ptr [rsp + 0x78], rdx
0xbcc450: lea rdx, [rbp - 0x19]
0xbcc454: mov qword ptr [rsp + 0x70], rdx
0xbcc459: mov qword ptr [rsp + 0x68], rax
0xbcc45e: mov qword ptr [rsp + 0x60], rcx
0xbcc463: mov eax, dword ptr [rip + 0x610f50b]
0xbcc469: mov dword ptr [rsp + 0x48], eax
0xbcc46d: call 0x14143b450
0xbcc472: jmp 0x140bcc495
0xbcc474: lea rax, [rsi + 0xc]
0xbcc478: lea rcx, [rsi + 0x22]
0xbcc47c: mov qword ptr [rsp + 0x68], rax
0xbcc481: mov qword ptr [rsp + 0x60], rcx
0xbcc486: mov eax, dword ptr [rip + 0x610f4e8]
0xbcc48c: mov dword ptr [rsp + 0x48], eax
0xbcc490: call 0x14143b670
0xbcc495: mov eax, dword ptr [rip + 0x610f4d9]
0xbcc49b: mov dword ptr [rbx], eax
0xbcc49d: mov rax, rbx
0xbcc4a0: mov rbx, qword ptr [rsp + 0x140]
0xbcc4a8: add rsp, 0x100
0xbcc4af: pop r15
0xbcc4b1: pop r14
0xbcc4b3: pop r13
0xbcc4b5: pop r12
0xbcc4b7: pop rdi
0xbcc4b8: pop rsi
0xbcc4b9: pop rbp
0xbcc4ba: ret 