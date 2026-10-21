0x39b93f0: mov qword ptr [rsp + 0x10], rbx
0x39b93f5: mov qword ptr [rsp + 0x18], rbp
0x39b93fa: push rsi
0x39b93fb: push rdi
0x39b93fc: push r14
0x39b93fe: sub rsp, 0x20
0x39b9402: mov r14, rdx
0x39b9405: mov rdi, rcx
0x39b9408: call 0x1439b7b80
0x39b940d: mov rbx, rax
0x39b9410: mov r9d, dword ptr [rdi + 0x80]
0x39b9417: xor esi, esi
0x39b9419: mov r8d, esi
0x39b941c: test r9d, r9d
0x39b941f: je 0x1439b9445
0x39b9421: mov r10, qword ptr [rdi + 0x78]
0x39b9425: mov r11d, dword ptr [r14]
0x39b9428: nop dword ptr [rax + rax]
0x39b9430: mov ecx, r8d
0x39b9433: mov rax, qword ptr [r10 + rcx*8]
0x39b9437: cmp dword ptr [rax + 0x28], r11d
0x39b943b: je 0x1439b94ac
0x39b943d: inc r8d
0x39b9440: cmp r8d, r9d
0x39b9443: jb 0x1439b9430
0x39b9445: mov qword ptr [rsp + 0x40], rsi
0x39b944a: test rbx, rbx
0x39b944d: je 0x1439b94bf
0x39b944f: mov rax, qword ptr [rdi + 0x140]
0x39b9456: test rax, rax
0x39b9459: je 0x1439b94bf
0x39b945b: mov rax, qword ptr [rax + 0x38]
0x39b945f: lea rcx, [rax - 0x28]
0x39b9463: test rax, rax
0x39b9466: cmove rcx, rsi
0x39b946a: cmp rbx, rcx
0x39b946d: je 0x1439b94bf
0x39b946f: mov rdx, r14
0x39b9472: mov rcx, rbx
0x39b9475: call 0x1439b9300
0x39b947a: test rax, rax
0x39b947d: je 0x1439b95e1
0x39b9483: lea rdx, [rsp + 0x58]
0x39b9488: mov rcx, rax
0x39b948b: call 0x1439bd670
0x39b9490: nop 
0x39b9491: mov rbp, qword ptr [rax]
0x39b9494: mov qword ptr [rsp + 0x40], rbp
0x39b9499: mov qword ptr [rax], rsi
0x39b949c: mov rcx, qword ptr [rsp + 0x58]
0x39b94a1: test rcx, rcx
0x39b94a4: je 0x1439b9538
0x39b94aa: jmp 0x1439b9529
0x39b94ac: or byte ptr [rdi + 0x138], 1
0x39b94b3: or byte ptr [rdi + 0x139], 1
0x39b94ba: jmp 0x1439b95e4
0x39b94bf: mov rbx, qword ptr [rdi + 0x140]
0x39b94c6: test rbx, rbx
0x39b94c9: je 0x1439b95e1
0x39b94cf: mov rcx, qword ptr [rbx + 0x40]
0x39b94d3: add rcx, 0x30
0x39b94d7: mov rdx, r14
0x39b94da: call 0x1404743a0
0x39b94df: test rax, rax
0x39b94e2: je 0x1439b95e1
0x39b94e8: mov rcx, qword ptr [rbx + 0x38]
0x39b94ec: lea rdx, [rcx + 0x50]
0x39b94f0: mov r8d, 0x78
0x39b94f6: test rcx, rcx
0x39b94f9: cmove rdx, r8
0x39b94fd: mov eax, dword ptr [rax]
0x39b94ff: mov rcx, qword ptr [rdx]
0x39b9502: lea rdx, [rsp + 0x58]
0x39b9507: mov rcx, qword ptr [rcx + rax*8]
0x39b950b: call 0x1439bd670
0x39b9510: nop 
0x39b9511: mov rbp, qword ptr [rax]
0x39b9514: mov qword ptr [rsp + 0x40], rbp
0x39b9519: mov qword ptr [rax], rsi
0x39b951c: mov rax, rbp
0x39b951f: mov rcx, qword ptr [rsp + 0x58]
0x39b9524: test rcx, rcx
0x39b9527: je 0x1439b953b
0x39b9529: mov rax, qword ptr [rcx]
0x39b952c: mov edx, 1
0x39b9531: call qword ptr [rax]
0x39b9533: mov qword ptr [rsp + 0x58], rsi
0x39b9538: mov rax, rbp
0x39b953b: mov edx, dword ptr [rax + 0x28]
0x39b953e: add rdx, rdx
0x39b9541: mov rax, qword ptr [rip + 0x32d37a0]
0x39b9548: mov rcx, qword ptr [rax + 0x58]
0x39b954c: mov ebx, dword ptr [rcx + rdx*8 + 8]
0x39b9550: shl rbx, 0x14
0x39b9554: or rbx, 0xffffe
0x39b955b: mov qword ptr [rsp + 0x40], rsi
0x39b9560: cmp qword ptr [rbp + 8], -1
0x39b9565: jne 0x1439b95c3
0x39b9567: mov edx, dword ptr [rdi + 0x80]
0x39b956d: cmp dword ptr [rdi + 0x84], edx
0x39b9573: ja 0x1439b9580
0x39b9575: inc edx
0x39b9577: lea rcx, [rdi + 0x78]
0x39b957b: call 0x140489ec0
0x39b9580: mov qword ptr [rbp + 8], rbx
0x39b9584: mov ecx, dword ptr [rdi + 0x80]
0x39b958a: mov rax, qword ptr [rdi + 0x78]
0x39b958e: mov qword ptr [rax + rcx*8], rbp
0x39b9592: mov ecx, dword ptr [rdi + 0x80]
0x39b9598: mov rax, qword ptr [rdi + 0x78]
0x39b959c: mov rcx, qword ptr [rax + rcx*8]
0x39b95a0: test rcx, rcx
0x39b95a3: je 0x1439b95bd
0x39b95a5: mov rdx, qword ptr [rdi + 0x88]
0x39b95ac: test rdx, rdx
0x39b95af: je 0x1439b95bd
0x39b95b1: mov rax, qword ptr [rcx]
0x39b95b4: xor r8d, r8d
0x39b95b7: call qword ptr [rax + 0x198]
0x39b95bd: inc dword ptr [rdi + 0x80]
0x39b95c3: or byte ptr [rdi + 0x138], 1
0x39b95ca: or byte ptr [rdi + 0x139], 1
0x39b95d1: mov ecx, dword ptr [rdi + 0x80]
0x39b95d7: dec ecx
0x39b95d9: mov rax, qword ptr [rdi + 0x78]
0x39b95dd: mov rsi, qword ptr [rax + rcx*8]
0x39b95e1: mov rax, rsi
0x39b95e4: mov rbx, qword ptr [rsp + 0x48]
0x39b95e9: mov rbp, qword ptr [rsp + 0x50]
0x39b95ee: add rsp, 0x20
0x39b95f2: pop r14
0x39b95f4: pop rdi
0x39b95f5: pop rsi
0x39b95f6: ret 