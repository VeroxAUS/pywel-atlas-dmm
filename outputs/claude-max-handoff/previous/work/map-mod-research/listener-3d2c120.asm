0x3d2c120: mov qword ptr [rsp + 0x20], rbx
0x3d2c125: mov qword ptr [rsp + 0x18], r8
0x3d2c12a: push rbp
0x3d2c12b: push rsi
0x3d2c12c: push rdi
0x3d2c12d: push r12
0x3d2c12f: push r13
0x3d2c131: push r14
0x3d2c133: push r15
0x3d2c135: mov rbp, rsp
0x3d2c138: sub rsp, 0x80
0x3d2c13f: movzx r13d, r9b
0x3d2c143: mov r12, rdx
0x3d2c146: mov r11, rcx
0x3d2c149: xor edi, edi
0x3d2c14b: mov r15, qword ptr [rip + 0x2f60b96]
0x3d2c152: cmp dword ptr [rcx + 0xc], edi
0x3d2c155: je 0x143d2c1ba
0x3d2c157: mov edi, dword ptr [rdx]
0x3d2c159: mov edx, edi
0x3d2c15b: add rdx, rdx
0x3d2c15e: mov rax, qword ptr [r15 + 0x58]
0x3d2c162: mov ebx, dword ptr [rax + rdx*8 + 8]
0x3d2c166: mov ecx, dword ptr [rcx + 8]
0x3d2c169: test ecx, ecx
0x3d2c16b: je 0x143d2c1b8
0x3d2c16d: xor edx, edx
0x3d2c16f: mov eax, ebx
0x3d2c171: div ecx
0x3d2c173: mov r9d, edx
0x3d2c176: shl r9, 8
0x3d2c17a: add r9, qword ptr [r11 + 0x18]
0x3d2c17e: xor edx, edx
0x3d2c180: mov r10d, dword ptr [r9]
0x3d2c183: test r10d, r10d
0x3d2c186: je 0x143d2c1b8
0x3d2c188: cmp dword ptr [r9 + rdx*8 + 8], ebx
0x3d2c18d: jne 0x143d2c1a2
0x3d2c18f: mov ecx, dword ptr [r9 + rdx*8 + 0xc]
0x3d2c194: mov rax, qword ptr [r11 + 0x20]
0x3d2c198: mov r8, qword ptr [rax + rcx*8]
0x3d2c19c: cmp dword ptr [r8 + 4], edi
0x3d2c1a0: je 0x143d2c1ab
0x3d2c1a2: inc edx
0x3d2c1a4: cmp edx, r10d
0x3d2c1a7: jb 0x143d2c188
0x3d2c1a9: jmp 0x143d2c1b8
0x3d2c1ab: lea rsi, [r8 + 8]
0x3d2c1af: test rsi, rsi
0x3d2c1b2: jne 0x143d2c314
0x3d2c1b8: xor edi, edi
0x3d2c1ba: test r13b, r13b
0x3d2c1bd: je 0x143d2c45b
0x3d2c1c3: mov qword ptr [rbp - 0x20], 0
0x3d2c1cb: mov dword ptr [rbp - 0x18], edi
0x3d2c1ce: mov dword ptr [rbp - 0x14], 0xffffffff
0x3d2c1d5: vpxor xmm0, xmm0, xmm0
0x3d2c1d9: vmovdqu xmmword ptr [rbp - 0x10], xmm0
0x3d2c1de: mov qword ptr [rbp + 0x48], r12
0x3d2c1e2: inc dword ptr [r11 + 0x14]
0x3d2c1e6: mov eax, dword ptr [r12]
0x3d2c1ea: add rax, rax
0x3d2c1ed: mov r8, qword ptr [r15 + 0x58]
0x3d2c1f1: lea rcx, [rbp - 0x30]
0x3d2c1f5: mov qword ptr [rsp + 0x38], rcx
0x3d2c1fa: lea rcx, [rbp - 0x28]
0x3d2c1fe: mov qword ptr [rsp + 0x30], rcx
0x3d2c203: lea rcx, [rbp + 0x40]
0x3d2c207: mov qword ptr [rsp + 0x28], rcx
0x3d2c20c: lea r9, [rbp - 0x20]
0x3d2c210: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c215: lea rdx, [rbp + 0x48]
0x3d2c219: lea rcx, [r11 + 8]
0x3d2c21d: call 0x143d31d30
0x3d2c222: mov rsi, qword ptr [rbp - 0x30]
0x3d2c226: inc dword ptr [rbp - 0x14]
0x3d2c229: mov r12d, 0x1fd
0x3d2c22f: mov ebx, r12d
0x3d2c232: mov rcx, qword ptr [rbp - 0x10]
0x3d2c236: test rcx, rcx
0x3d2c239: je 0x143d2c265
0x3d2c23b: mov dword ptr [rbp - 0x20], edi
0x3d2c23e: mov rax, qword ptr gs:[0x58]
0x3d2c247: mov rdx, qword ptr [rax]
0x3d2c24a: cmp byte ptr [r12 + rdx], 0
0x3d2c24f: je 0x143d2c258
0x3d2c251: call 0x1447f03bc
0x3d2c256: jmp 0x143d2c25d
0x3d2c258: call 0x1447f02bc
0x3d2c25d: mov qword ptr [rbp - 0x10], rdi
0x3d2c261: mov qword ptr [rbp - 0x10], rdi
0x3d2c265: mov r14, qword ptr [rbp - 8]
0x3d2c269: test r14, r14
0x3d2c26c: je 0x143d2c30b
0x3d2c272: mov eax, dword ptr [rbp - 0x1c]
0x3d2c275: test eax, eax
0x3d2c277: je 0x143d2c2cb
0x3d2c279: mov rbx, r14
0x3d2c27c: mov edi, eax
0x3d2c27e: nop 
0x3d2c280: mov rcx, qword ptr [rbx]
0x3d2c283: mov qword ptr [rbp + 0x40], rcx
0x3d2c287: add rcx, 8
0x3d2c28b: call 0x1403d3000
0x3d2c290: mov rcx, qword ptr [rbx]
0x3d2c293: test rcx, rcx
0x3d2c296: je 0x143d2c2b7
0x3d2c298: mov rax, qword ptr gs:[0x58]
0x3d2c2a1: mov rdx, qword ptr [rax]
0x3d2c2a4: cmp byte ptr [r12 + rdx], 0
0x3d2c2a9: je 0x143d2c2b2
0x3d2c2ab: call 0x1447f03bc
0x3d2c2b0: jmp 0x143d2c2b7
0x3d2c2b2: call 0x1447f02bc
0x3d2c2b7: mov qword ptr [rbx], 0
0x3d2c2be: add rbx, 8
0x3d2c2c2: sub rdi, 1
0x3d2c2c6: jne 0x143d2c280
0x3d2c2c8: mov ebx, r12d
0x3d2c2cb: mov qword ptr [rbp - 0x1c], 0
0x3d2c2d3: mov rax, qword ptr gs:[0x58]
0x3d2c2dc: mov rdx, qword ptr [rax]
0x3d2c2df: mov rcx, r14
0x3d2c2e2: cmp byte ptr [rbx + rdx], 0
0x3d2c2e6: je 0x143d2c2fe
0x3d2c2e8: call 0x1447f03bc
0x3d2c2ed: mov qword ptr [rbp - 8], rdi
0x3d2c2f1: mov qword ptr [rbp - 8], rdi
0x3d2c2f5: mov r15, qword ptr [rip + 0x2f609ec]
0x3d2c2fc: jmp 0x143d2c31c
0x3d2c2fe: call 0x1447f02bc
0x3d2c303: mov qword ptr [rbp - 8], rdi
0x3d2c307: mov qword ptr [rbp - 8], rdi
0x3d2c30b: mov r15, qword ptr [rip + 0x2f609d6]
0x3d2c312: jmp 0x143d2c31c
0x3d2c314: xor edi, edi
0x3d2c316: mov r12d, 0x1fd
0x3d2c31c: mov rdx, qword ptr [rbp + 0x50]
0x3d2c320: cmp dword ptr [rsi + 4], 0
0x3d2c324: je 0x143d2c396
0x3d2c326: mov ebx, dword ptr [rdx]
0x3d2c328: mov ecx, ebx
0x3d2c32a: add rcx, rcx
0x3d2c32d: mov rax, qword ptr [r15 + 0x58]
0x3d2c331: mov r11d, dword ptr [rax + rcx*8 + 8]
0x3d2c336: mov ecx, dword ptr [rsi]
0x3d2c338: test ecx, ecx
0x3d2c33a: je 0x143d2c396
0x3d2c33c: xor edx, edx
0x3d2c33e: mov eax, r11d
0x3d2c341: div ecx
0x3d2c343: mov r9d, edx
0x3d2c346: shl r9, 8
0x3d2c34a: add r9, qword ptr [rsi + 0x10]
0x3d2c34e: mov edx, edi
0x3d2c350: mov r10d, dword ptr [r9]
0x3d2c353: test r10d, r10d
0x3d2c356: je 0x143d2c392
0x3d2c358: nop dword ptr [rax + rax]
0x3d2c360: mov eax, edx
0x3d2c362: cmp dword ptr [r9 + rax*8 + 8], r11d
0x3d2c367: jne 0x143d2c37c
0x3d2c369: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0x3d2c36e: mov rax, qword ptr [rsi + 0x18]
0x3d2c372: mov r8, qword ptr [rax + rcx*8]
0x3d2c376: cmp dword ptr [r8 + 4], ebx
0x3d2c37a: je 0x143d2c385
0x3d2c37c: inc edx
0x3d2c37e: cmp edx, r10d
0x3d2c381: jb 0x143d2c360
0x3d2c383: jmp 0x143d2c392
0x3d2c385: lea r14, [r8 + 8]
0x3d2c389: test r14, r14
0x3d2c38c: jne 0x143d2c456
0x3d2c392: mov rdx, qword ptr [rbp + 0x50]
0x3d2c396: test r13b, r13b
0x3d2c399: je 0x143d2c45b
0x3d2c39f: mov qword ptr [rbp - 0x20], rdi
0x3d2c3a3: mov qword ptr [rbp - 0x18], 0
0x3d2c3ab: mov qword ptr [rbp + 0x48], rdx
0x3d2c3af: inc dword ptr [rsi + 0xc]
0x3d2c3b2: mov eax, dword ptr [rdx]
0x3d2c3b4: add rax, rax
0x3d2c3b7: mov r8, qword ptr [r15 + 0x58]
0x3d2c3bb: lea rcx, [rbp - 0x30]
0x3d2c3bf: mov qword ptr [rsp + 0x38], rcx
0x3d2c3c4: lea rcx, [rbp - 0x28]
0x3d2c3c8: mov qword ptr [rsp + 0x30], rcx
0x3d2c3cd: lea rcx, [rbp + 0x40]
0x3d2c3d1: mov qword ptr [rsp + 0x28], rcx
0x3d2c3d6: lea r9, [rbp - 0x20]
0x3d2c3da: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c3df: lea rdx, [rbp + 0x48]
0x3d2c3e3: mov rcx, rsi
0x3d2c3e6: call 0x140e18930
0x3d2c3eb: mov r14, qword ptr [rbp - 0x30]
0x3d2c3ef: mov rsi, qword ptr [rbp - 0x20]
0x3d2c3f3: test rsi, rsi
0x3d2c3f6: je 0x143d2c44a
0x3d2c3f8: mov eax, dword ptr [rbp - 0x18]
0x3d2c3fb: test eax, eax
0x3d2c3fd: je 0x143d2c416
0x3d2c3ff: mov rbx, rsi
0x3d2c402: mov edi, eax
0x3d2c404: mov rcx, rbx
0x3d2c407: call 0x14038ad90
0x3d2c40c: add rbx, 8
0x3d2c410: sub rdi, 1
0x3d2c414: jne 0x143d2c404
0x3d2c416: mov r8d, r12d
0x3d2c419: mov rax, qword ptr gs:[0x58]
0x3d2c422: mov rdx, qword ptr [rax]
0x3d2c425: mov rcx, rsi
0x3d2c428: cmp byte ptr [r8 + rdx], 0
0x3d2c42d: je 0x143d2c445
0x3d2c42f: call 0x1447f03bc
0x3d2c434: mov qword ptr [rbp - 0x20], rdi
0x3d2c438: mov qword ptr [rbp - 0x18], 0
0x3d2c440: mov rax, r14
0x3d2c443: jmp 0x143d2c45d
0x3d2c445: call 0x1447f02bc
0x3d2c44a: mov qword ptr [rbp - 0x20], rdi
0x3d2c44e: mov qword ptr [rbp - 0x18], 0
0x3d2c456: mov rax, r14
0x3d2c459: jmp 0x143d2c45d
0x3d2c45b: xor eax, eax
0x3d2c45d: mov rbx, qword ptr [rsp + 0xd8]
0x3d2c465: add rsp, 0x80
0x3d2c46c: pop r15
0x3d2c46e: pop r14
0x3d2c470: pop r13
0x3d2c472: pop r12
0x3d2c474: pop rdi
0x3d2c475: pop rsi
0x3d2c476: pop rbp
0x3d2c477: ret 