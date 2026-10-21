0x1042aaf0: mov qword ptr [rsp + 0x10], rbx
0x1042aaf5: mov qword ptr [rsp + 0x18], rbp
0x1042aafa: push rsi
0x1042aafb: push rdi
0x1042aafc: push r12
0x1042aafe: push r14
0x1042ab00: push r15
0x1042ab02: sub rsp, 0x20
0x1042ab06: mov r15d, r9d
0x1042ab09: mov r14, r8
0x1042ab0c: mov rdi, rdx
0x1042ab0f: mov rbp, rcx
0x1042ab12: mov rsi, qword ptr [rcx + 8]
0x1042ab16: mov rax, qword ptr [rsi + 0xa0]
0x1042ab1d: mov r10, qword ptr [rax + 0x68]
0x1042ab21: mov rbx, qword ptr [r10 + 0x10]
0x1042ab25: mov rax, qword ptr [rbx + 8]
0x1042ab29: lea rdx, [rax + 8]
0x1042ab2d: xor r12d, r12d
0x1042ab30: test rax, rax
0x1042ab33: cmove rdx, r12
0x1042ab37: mov rdx, qword ptr [rdx]
0x1042ab3a: lea rcx, [rsp + 0x50]
0x1042ab3f: call 0x140393df0
0x1042ab44: nop 
0x1042ab45: mov r8, qword ptr [rbx + 0x18]
0x1042ab49: mov r10d, dword ptr [r8 + 8]
0x1042ab4d: mov eax, r12d
0x1042ab50: test r10d, r10d
0x1042ab53: je 0x15042ab7f
0x1042ab55: mov r8, qword ptr [r8]
0x1042ab58: mov r9, qword ptr [r14]
0x1042ab5b: nop dword ptr [rax + rax]
0x1042ab60: mov ecx, eax
0x1042ab62: imul rcx, rcx, 0xd0
0x1042ab69: add rcx, r8
0x1042ab6c: cmp qword ptr [rcx], r9
0x1042ab6f: je 0x15042ab7a
0x1042ab71: inc eax
0x1042ab73: cmp eax, r10d
0x1042ab76: jb 0x15042ab60
0x1042ab78: jmp 0x15042ab7f
0x1042ab7a: test rcx, rcx
0x1042ab7d: jne 0x15042ab9e
0x1042ab7f: mov ebx, dword ptr [rip - 0x9733f81]
0x1042ab85: test ebx, ebx
0x1042ab87: je 0x15042ab9e
0x1042ab89: mov rcx, qword ptr [rsp + 0x50]
0x1042ab8e: mov rax, qword ptr [rcx]
0x1042ab91: mov dl, 1
0x1042ab93: call qword ptr [rax + 0x20]
0x1042ab96: test ebx, ebx
0x1042ab98: je 0x15042abdc
0x1042ab9a: mov dword ptr [rdi], ebx
0x1042ab9c: jmp 0x15042ac1a
0x1042ab9e: mov rcx, qword ptr [rsp + 0x50]
0x1042aba3: mov rax, qword ptr [rcx]
0x1042aba6: mov dl, 1
0x1042aba8: call qword ptr [rax + 0x20]
0x1042abab: and dword ptr [rip - 0x89e2766], ecx
0x1042abb1: mov rax, qword ptr [rsi + 0x88]
0x1042abb8: cmp byte ptr [rax + 1], 1
0x1042abbc: jne 0x15042abdc
0x1042abbe: mov rax, qword ptr [rsi + 0xa0]
0x1042abc5: test rax, rax
0x1042abc8: jne 0x15042abd3
0x1042abca: mov dword ptr [rsi + 0x90], r12d
0x1042abd1: jmp 0x15042abdc
0x1042abd3: mov eax, dword ptr [rax + 0x60]
0x1042abd6: mov dword ptr [rsi + 0x90], eax
0x1042abdc: mov r9, qword ptr [rbp + 8]
0x1042abe0: mov r8d, r15d
0x1042abe3: lea rdx, [rsp + 0x50]
0x1042abe8: mov rcx, qword ptr [rip - 0x96c154f]
0x1042abef: mov rcx, qword ptr [rcx + 0x30]
0x1042abf3: call 0x14186f570
0x1042abf8: mov eax, dword ptr [rsp + 0x50]
0x1042abfc: test eax, eax
0x1042abfe: je 0x15042ac04
0x1042ac00: mov dword ptr [rdi], eax
0x1042ac02: jmp 0x15042ac1a
0x1042ac04: lea rdx, [rsp + 0x50]
0x1042ac09: mov rcx, rbp
0x1042ac0c: call 0x142941020
0x1042ac11: mov eax, dword ptr [rax]
0x1042ac13: test eax, eax
0x1042ac15: jne 0x15042ac00
0x1042ac17: mov dword ptr [rdi], r12d
0x1042ac1a: mov rax, rdi
0x1042ac1d: mov rbx, qword ptr [rsp + 0x58]
0x1042ac22: mov rbp, qword ptr [rsp + 0x60]
0x1042ac27: add rsp, 0x20
0x1042ac2b: pop r15
0x1042ac2d: pop r14
0x1042ac2f: pop r12
0x1042ac31: pop rdi
0x1042ac32: pop rsi
0x1042ac33: ret 