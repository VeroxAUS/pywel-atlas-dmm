0xdeb1d0: mov qword ptr [rsp + 0x10], rbx
0xdeb1d5: push rbp
0xdeb1d6: push rsi
0xdeb1d7: push rdi
0xdeb1d8: push r12
0xdeb1da: push r13
0xdeb1dc: push r14
0xdeb1de: push r15
0xdeb1e0: sub rsp, 0x20
0xdeb1e4: mov r14d, edx
0xdeb1e7: mov rdi, rcx
0xdeb1ea: cmp edx, dword ptr [rcx + 0xc]
0xdeb1ed: ja 0x140deb1f6
0xdeb1ef: xor al, al
0xdeb1f1: jmp 0x140deb30a
0xdeb1f6: lea ecx, [rdx + rdx*2]
0xdeb1f9: shl ecx, 3
0xdeb1fc: mov r15d, 0x1fd
0xdeb202: mov rax, qword ptr gs:[0x58]
0xdeb20b: add r15, qword ptr [rax]
0xdeb20e: mov edx, 8
0xdeb213: cmp byte ptr [r15], 0
0xdeb217: je 0x140deb220
0xdeb219: call 0x1447efa78
0xdeb21e: jmp 0x140deb225
0xdeb220: call 0x1447ef9b0
0xdeb225: mov rsi, rax
0xdeb228: test rax, rax
0xdeb22b: jne 0x140deb248
0xdeb22d: call 0x141318e70
0xdeb232: xor r9d, r9d
0xdeb235: xor r8d, r8d
0xdeb238: mov edx, 1
0xdeb23d: mov ecx, 0xa0000002
0xdeb242: call qword ptr [rip + 0x43fff00]
0xdeb248: xor r12d, r12d
0xdeb24b: mov ebp, r12d
0xdeb24e: cmp dword ptr [rdi + 8], r12d
0xdeb252: jbe 0x140deb2e7
0xdeb258: lea r13, [rip + 0x5c7a6e1]
0xdeb25f: nop 
0xdeb260: mov eax, ebp
0xdeb262: lea rcx, [rax + rax*2]
0xdeb266: lea r8, [rcx*8]
0xdeb26e: lea rcx, [r8 + rsi]
0xdeb272: mov qword ptr [rsp + 0x60], rcx
0xdeb277: mov rdx, qword ptr [rdi]
0xdeb27a: add rdx, r8
0xdeb27d: mov qword ptr [rcx], r12
0xdeb280: mov rax, qword ptr [rdx]
0xdeb283: mov qword ptr [rcx], rax
0xdeb286: mov qword ptr [rdx], r12
0xdeb289: mov rax, qword ptr [rcx]
0xdeb28c: test rax, rax
0xdeb28f: je 0x140deb295
0xdeb291: mov byte ptr [rax + 0x16], 1
0xdeb295: mov qword ptr [rcx + 8], r12
0xdeb299: mov rax, qword ptr [rdx + 8]
0xdeb29d: mov qword ptr [rcx + 8], rax
0xdeb2a1: mov qword ptr [rdx + 8], r13
0xdeb2a5: mov qword ptr [rcx + 0x10], r12
0xdeb2a9: mov rax, qword ptr [rdx + 0x10]
0xdeb2ad: mov qword ptr [rcx + 0x10], rax
0xdeb2b1: mov qword ptr [rdx + 0x10], r13
0xdeb2b5: mov rbx, qword ptr [rdi]
0xdeb2b8: add rbx, r8
0xdeb2bb: mov qword ptr [rsp + 0x70], rbx
0xdeb2c0: lea rcx, [rbx + 0x10]
0xdeb2c4: call 0x140394db0
0xdeb2c9: nop 
0xdeb2ca: lea rcx, [rbx + 8]
0xdeb2ce: call 0x140394db0
0xdeb2d3: nop 
0xdeb2d4: mov rcx, rbx
0xdeb2d7: call 0x14038ad90
0xdeb2dc: inc ebp
0xdeb2de: cmp ebp, dword ptr [rdi + 8]
0xdeb2e1: jb 0x140deb260
0xdeb2e7: mov rcx, qword ptr [rdi]
0xdeb2ea: test rcx, rcx
0xdeb2ed: je 0x140deb301
0xdeb2ef: cmp byte ptr [r15], 0
0xdeb2f3: je 0x140deb2fc
0xdeb2f5: call 0x1447f03bc
0xdeb2fa: jmp 0x140deb301
0xdeb2fc: call 0x1447f02bc
0xdeb301: mov qword ptr [rdi], rsi
0xdeb304: mov dword ptr [rdi + 0xc], r14d
0xdeb308: mov al, 1
0xdeb30a: mov rbx, qword ptr [rsp + 0x68]
0xdeb30f: add rsp, 0x20
0xdeb313: pop r15
0xdeb315: pop r14
0xdeb317: pop r13
0xdeb319: pop r12
0xdeb31b: pop rdi
0xdeb31c: pop rsi
0xdeb31d: pop rbp
0xdeb31e: ret 