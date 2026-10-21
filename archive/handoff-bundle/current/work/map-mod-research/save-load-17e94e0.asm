0x17e94e0: mov qword ptr [rsp + 0x10], rbx
0x17e94e5: mov qword ptr [rsp + 0x20], rbp
0x17e94ea: push rsi
0x17e94eb: push rdi
0x17e94ec: push r14
0x17e94ee: sub rsp, 0x70
0x17e94f2: mov r14, rdx
0x17e94f5: mov rbp, rcx
0x17e94f8: cmp byte ptr [rcx + 0x95], 0
0x17e94ff: jne 0x1417e955a
0x17e9501: mov rdi, qword ptr [rcx + 0x78]
0x17e9505: mov esi, dword ptr [rcx + 0x80]
0x17e950b: shl rsi, 4
0x17e950f: add rsi, rdi
0x17e9512: cmp rdi, rsi
0x17e9515: je 0x1417e9553
0x17e9517: nop word ptr [rax + rax]
0x17e9520: mov rcx, qword ptr [rdi]
0x17e9523: movzx eax, word ptr [rdi + 8]
0x17e9527: mov word ptr [rsp + 0x90], ax
0x17e952f: mov rax, qword ptr [rcx]
0x17e9532: lea rdx, [rsp + 0xa0]
0x17e953a: call qword ptr [rax + 0x98]
0x17e9540: mov ebx, dword ptr [rax]
0x17e9542: test ebx, ebx
0x17e9544: jne 0x1417e95cd
0x17e954a: add rdi, 0x10
0x17e954e: cmp rdi, rsi
0x17e9551: jne 0x1417e9520
0x17e9553: mov byte ptr [rbp + 0x95], 1
0x17e955a: mov rax, qword ptr gs:[0x58]
0x17e9563: mov rcx, qword ptr [rax]
0x17e9566: mov edx, 0x1ec
0x17e956b: mov rax, qword ptr [rip + 0x557ff66]
0x17e9572: cmp byte ptr [rdx + rcx], 0
0x17e9576: cmovne rax, qword ptr [rip + 0x557ff62]
0x17e957e: mov rbx, qword ptr [rax + 0x10]
0x17e9582: lea rdi, [rbx + 0x10]
0x17e9586: mov qword ptr [rsp + 0x90], rdi
0x17e958e: mov rax, qword ptr [rdi]
0x17e9591: mov rcx, rdi
0x17e9594: call qword ptr [rax + 8]
0x17e9597: nop 
0x17e9598: mov rdx, rbp
0x17e959b: mov rcx, qword ptr [rbx + 8]
0x17e959f: call 0x141f45250
0x17e95a4: nop 
0x17e95a5: mov rax, qword ptr [rdi]
0x17e95a8: mov rcx, rdi
0x17e95ab: call qword ptr [rax + 0x10]
0x17e95ae: mov dword ptr [r14], 0
0x17e95b5: mov rax, r14
0x17e95b8: lea r11, [rsp + 0x70]
0x17e95bd: mov rbx, qword ptr [r11 + 0x28]
0x17e95c1: mov rbp, qword ptr [r11 + 0x38]
0x17e95c5: mov rsp, r11
0x17e95c8: pop r14
0x17e95ca: pop rdi
0x17e95cb: pop rsi
0x17e95cc: ret 
0x17e95cd: lea rax, [rsp + 0x90]
0x17e95d5: mov qword ptr [rsp + 0x60], rax
0x17e95da: lea rax, [rip + 0x4125107]
0x17e95e1: mov qword ptr [rsp + 0x58], rax
0x17e95e6: mov dword ptr [rsp + 0x48], ebx
0x17e95ea: call 0x14050d2d0
0x17e95ef: mov dword ptr [r14], ebx
0x17e95f2: jmp 0x1417e95b5