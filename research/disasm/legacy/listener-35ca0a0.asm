0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a