0x298c070: mov qword ptr [rsp + 8], rbx
0x298c075: push rbp
0x298c076: push rsi
0x298c077: push rdi
0x298c078: push r12
0x298c07a: push r13
0x298c07c: push r14
0x298c07e: push r15
0x298c080: lea rbp, [rsp - 0x10]
0x298c085: sub rsp, 0x120
0x298c08c: mov rbx, r8
0x298c08f: mov rdi, rdx
0x298c092: mov r15, rcx
0x298c095: mov r14, qword ptr [r8 + 0x18]
0x298c099: movzx ecx, word ptr [r14 + 3]
0x298c09e: movzx eax, word ptr [r8 + 0x10]
0x298c0a3: sub rax, 5
0x298c0a7: cmp rax, rcx
0x298c0aa: jne 0x14298c3c1
0x298c0b0: cmp byte ptr [r8 + 0x38], 0
0x298c0b5: jne 0x14298c0c5
0x298c0b7: mov eax, 0x7fc1
0x298c0bc: cmp ax, cx
0x298c0bf: jb 0x14298c3c1
0x298c0c5: xor esi, esi
0x298c0c7: cmp byte ptr [r15 + 0x21], sil
0x298c0cb: je 0x14298c0d4
0x298c0cd: mov dword ptr [rdx], esi
0x298c0cf: jmp 0x14298c471
0x298c0d4: mov dword ptr [rbp - 0x70], esi
0x298c0d7: movzx ecx, word ptr [r14 + 3]
0x298c0dc: lea r12, [rip + 0x2d95bdd]
0x298c0e3: mov qword ptr [rbp - 0x68], r12
0x298c0e7: mov byte ptr [rbp - 0x60], sil
0x298c0eb: lea r13, [rip + 0x2d95b6e]
0x298c0f2: mov qword ptr [rbp - 0x68], r13
0x298c0f6: lea rax, [r14 + 5]
0x298c0fa: mov qword ptr [rbp - 0x58], rax
0x298c0fe: mov dword ptr [rbp - 0x50], ecx
0x298c101: mov dword ptr [rbp - 0x4c], esi
0x298c104: mov rax, qword ptr [rbp - 0x68]
0x298c108: mov r9, qword ptr [rax + 8]
0x298c10c: lea rax, [rip - 0x156cea3]
0x298c113: mov r8d, 4
0x298c119: lea rdx, [rbp - 0x70]
0x298c11d: lea rcx, [rbp - 0x68]
0x298c121: cmp r9, rax
0x298c124: jne 0x14298c12d
0x298c126: call 0x14141f270
0x298c12b: jmp 0x14298c130
0x298c12d: call r9
0x298c130: test al, al
0x298c132: jne 0x14298c149
0x298c134: mov eax, dword ptr [rip + 0x434f836]
0x298c13a: mov dword ptr [rdi], eax
0x298c13c: mov qword ptr [rbp - 0x68], r13
0x298c140: mov qword ptr [rbp - 0x68], r12
0x298c144: jmp 0x14298c471
0x298c149: mov rax, qword ptr [rbp - 0x68]
0x298c14d: mov r9, qword ptr [rax + 8]
0x298c151: lea rax, [rip - 0x26325b8]
0x298c158: cmp r9, rax
0x298c15b: je 0x14298c3ac
0x298c161: mov r8d, 1
0x298c167: lea rdx, [rbp + 0x60]
0x298c16b: lea rcx, [rbp - 0x68]
0x298c16f: call r9
0x298c172: test al, al
0x298c174: je 0x14298c3ac
0x298c17a: mov rax, qword ptr [rbp - 0x68]
0x298c17e: mov r9, qword ptr [rax + 8]
0x298c182: lea rax, [rip - 0x26325e9]
0x298c189: cmp r9, rax
0x298c18c: je 0x14298c397
0x298c192: mov r8d, 1
0x298c198: lea rdx, [rbp - 0x7f]
0x298c19c: lea rcx, [rbp - 0x68]
0x298c1a0: call r9
0x298c1a3: test al, al
0x298c1a5: je 0x14298c397
0x298c1ab: mov rax, qword ptr [rbp - 0x68]
0x298c1af: mov r9, qword ptr [rax + 8]
0x298c1b3: lea rax, [rip - 0x263261a]
0x298c1ba: cmp r9, rax
0x298c1bd: je 0x14298c382
0x298c1c3: mov r8d, 1
0x298c1c9: lea rdx, [rbp - 0x80]
0x298c1cd: lea rcx, [rbp - 0x68]
0x298c1d1: call r9
0x298c1d4: test al, al
0x298c1d6: je 0x14298c382
0x298c1dc: mov rax, qword ptr [rbp - 0x68]
0x298c1e0: mov r9, qword ptr [rax + 8]
0x298c1e4: lea rax, [rip - 0x263264b]
0x298c1eb: cmp r9, rax
0x298c1ee: je 0x14298c36d
0x298c1f4: mov r8d, 1
0x298c1fa: lea rdx, [rbp + 0x68]
0x298c1fe: lea rcx, [rbp - 0x68]
0x298c202: call r9
0x298c205: test al, al
0x298c207: je 0x14298c36d
0x298c20d: movzx eax, word ptr [r14 + 3]
0x298c212: cmp dword ptr [rbp - 0x4c], eax
0x298c215: je 0x14298c22c
0x298c217: mov eax, dword ptr [rip + 0x434f753]
0x298c21d: mov dword ptr [rdi], eax
0x298c21f: mov qword ptr [rbp - 0x68], r13
0x298c223: mov qword ptr [rbp - 0x68], r12
0x298c227: jmp 0x14298c471
0x298c22c: mov r14, qword ptr [rbx]
0x298c22f: test r14, r14
0x298c232: je 0x14298c35e
0x298c238: mov r8d, dword ptr [rbp - 0x70]
0x298c23c: lea rdx, [rbp - 0x30]
0x298c240: mov rcx, qword ptr [rip + 0x43dd451]
0x298c247: mov rcx, qword ptr [rcx]
0x298c24a: call 0x142a827b0
0x298c24f: nop 
0x298c250: cmp byte ptr [rbp - 0x20], 0
0x298c254: jne 0x14298c25b
0x298c256: jmp 0x14298c34a
0x298c25b: mov rax, qword ptr [rbp - 0x28]
0x298c25f: mov rcx, qword ptr [rax + 0x68]
0x298c263: movzx r8d, byte ptr [rbp + 0x60]
0x298c268: cmp r8b, 9
0x298c26c: jb 0x14298c276
0x298c26e: mov ebx, dword ptr [rip + 0x434f704]
0x298c274: jmp 0x14298c29c
0x298c276: lea rax, [rbp + 0x68]
0x298c27a: mov qword ptr [rsp + 0x28], rax
0x298c27f: lea rax, [rbp - 0x80]
0x298c283: mov qword ptr [rsp + 0x20], rax
0x298c288: lea r9, [rbp - 0x7f]
0x298c28c: lea rdx, [rbp - 0x78]
0x298c290: mov rcx, qword ptr [rcx + 0x20]
0x298c294: call 0x141794000
0x298c299: mov ebx, dword ptr [rbp - 0x78]
0x298c29c: test ebx, ebx
0x298c29e: je 0x14298c34a
0x298c2a4: mov eax, 0x3f5
0x298c2a9: mov word ptr [rbp - 0x48], ax
0x298c2ad: mov byte ptr [rbp - 0x46], 0xff
0x298c2b1: mov dword ptr [rbp - 0x45], ebx
0x298c2b4: movzx eax, word ptr [r15 + 0xc]
0x298c2b9: mov word ptr [rbp - 0x41], ax
0x298c2bd: mov qword ptr [rbp - 0x3f], rsi
0x298c2c1: call 0x1414276d0
0x298c2c6: mov dword ptr [rbp - 0x78], ebx
0x298c2c9: lea rdx, [rbp - 0x78]
0x298c2cd: mov rcx, rax
0x298c2d0: call 0x141427c10
0x298c2d5: test rax, rax
0x298c2d8: je 0x14298c2e0
0x298c2da: cmp dword ptr [rax + 8], 2
0x298c2de: je 0x14298c335
0x298c2e0: call 0x1414276d0
0x298c2e5: mov dword ptr [rbp - 0x78], ebx
0x298c2e8: lea rdx, [rbp - 0x78]
0x298c2ec: mov rcx, rax
0x298c2ef: call 0x141427c10
0x298c2f4: test rax, rax
0x298c2f7: je 0x14298c335
0x298c2f9: cmp dword ptr [rax + 8], 1
0x298c2fd: jne 0x14298c335
0x298c2ff: mov rax, qword ptr [r14]
0x298c302: mov rcx, r14
0x298c305: call qword ptr [rax + 0xe8]
0x298c30b: test rax, rax
0x298c30e: je 0x14298c335
0x298c310: mov edx, 0x3f5
0x298c315: mov r9d, 0x11
0x298c31b: mov qword ptr [rsp + 0x30], rax
0x298c320: mov byte ptr [rsp + 0x20], 0
0x298c325: lea r8, [rbp - 0x48]
0x298c329: mov rcx, qword ptr [rip + 0x43dd350]
0x298c330: call 0x142773630
0x298c335: mov r9d, ebx
0x298c338: mov r8b, 0x10
0x298c33b: lea rdx, [rbp - 0x78]
0x298c33f: mov rcx, r14
0x298c342: call 0x142068340
0x298c347: nop 
0x298c348: jmp 0x14298c34a
0x298c34a: lea rax, [rip + 0x2d99af7]
0x298c351: mov qword ptr [rbp - 0x30], rax
0x298c355: lea rcx, [rbp - 0x30]
0x298c359: call 0x141434880
0x298c35e: mov dword ptr [rdi], esi
0x298c360: mov qword ptr [rbp - 0x68], r13
0x298c364: mov qword ptr [rbp - 0x68], r12
0x298c368: jmp 0x14298c471
0x298c36d: mov eax, dword ptr [rip + 0x434f5fd]
0x298c373: mov dword ptr [rdi], eax
0x298c375: mov qword ptr [rbp - 0x68], r13
0x298c379: mov qword ptr [rbp - 0x68], r12
0x298c37d: jmp 0x14298c471
0x298c382: mov eax, dword ptr [rip + 0x434f5e8]
0x298c388: mov dword ptr [rdi], eax
0x298c38a: mov qword ptr [rbp - 0x68], r13
0x298c38e: mov qword ptr [rbp - 0x68], r12
0x298c392: jmp 0x14298c471
0x298c397: mov eax, dword ptr [rip + 0x434f5d3]
0x298c39d: mov dword ptr [rdi], eax
0x298c39f: mov qword ptr [rbp - 0x68], r13
0x298c3a3: mov qword ptr [rbp - 0x68], r12
0x298c3a7: jmp 0x14298c471
0x298c3ac: mov eax, dword ptr [rip + 0x434f5be]
0x298c3b2: mov dword ptr [rdi], eax
0x298c3b4: mov qword ptr [rbp - 0x68], r13
0x298c3b8: mov qword ptr [rbp - 0x68], r12
0x298c3bc: jmp 0x14298c471
0x298c3c1: mov rbx, qword ptr [r8]
0x298c3c4: test rbx, rbx
0x298c3c7: je 0x14298c448
0x298c3c9: mov rax, qword ptr [rbx]
0x298c3cc: lea rdx, [rbp]
0x298c3d0: mov rcx, rbx
0x298c3d3: call qword ptr [rax + 0xd0]
0x298c3d9: mov rdx, qword ptr [rax]
0x298c3dc: mov qword ptr [rbp - 0x78], rdx
0x298c3e0: mov rax, qword ptr [rbx]
0x298c3e3: lea rdx, [rbp + 8]
0x298c3e7: mov rcx, rbx
0x298c3ea: call qword ptr [rax + 0xd8]
0x298c3f0: mov rdx, qword ptr [rax]
0x298c3f3: mov qword ptr [rbp - 0x10], rdx
0x298c3f7: mov rax, qword ptr [rbx]
0x298c3fa: mov rcx, rbx
0x298c3fd: call qword ptr [rax + 0xc8]
0x298c403: mov qword ptr [rbp - 8], rax
0x298c407: lea rax, [r15 + 0xc]
0x298c40b: lea rcx, [r15 + 0x22]
0x298c40f: lea rdx, [rbp - 0x78]
0x298c413: mov qword ptr [rsp + 0x80], rdx
0x298c41b: lea rdx, [rbp - 0x10]
0x298c41f: mov qword ptr [rsp + 0x78], rdx
0x298c424: lea rdx, [rbp - 8]
0x298c428: mov qword ptr [rsp + 0x70], rdx
0x298c42d: mov qword ptr [rsp + 0x68], rax
0x298c432: mov qword ptr [rsp + 0x60], rcx
0x298c437: mov eax, dword ptr [rip + 0x434f537]
0x298c43d: mov dword ptr [rsp + 0x48], eax
0x298c441: call 0x14143b450
0x298c446: jmp 0x14298c469
0x298c448: lea rax, [r15 + 0xc]
0x298c44c: lea rcx, [r15 + 0x22]
0x298c450: mov qword ptr [rsp + 0x68], rax
0x298c455: mov qword ptr [rsp + 0x60], rcx
0x298c45a: mov eax, dword ptr [rip + 0x434f514]
0x298c460: mov dword ptr [rsp + 0x48], eax
0x298c464: call 0x14143b670
0x298c469: mov eax, dword ptr [rip + 0x434f505]
0x298c46f: mov dword ptr [rdi], eax
0x298c471: mov rax, rdi
0x298c474: mov rbx, qword ptr [rsp + 0x160]
0x298c47c: add rsp, 0x120
0x298c483: pop r15
0x298c485: pop r14
0x298c487: pop r13
0x298c489: pop r12
0x298c48b: pop rdi
0x298c48c: pop rsi
0x298c48d: pop rbp
0x298c48e: ret 