0xe02830: mov qword ptr [rsp + 0x18], rbx
0xe02835: mov qword ptr [rsp + 0x20], r9
0xe0283a: mov qword ptr [rsp + 0x10], rdx
0xe0283f: push rbp
0xe02840: push rsi
0xe02841: push rdi
0xe02842: push r12
0xe02844: push r13
0xe02846: push r14
0xe02848: push r15
0xe0284a: sub rsp, 0x20
0xe0284e: mov ebp, r8d
0xe02851: mov r14, rdx
0xe02854: mov rdi, rcx
0xe02857: cmp dword ptr [rcx], 0
0xe0285a: jne 0x140e02864
0xe0285c: mov edx, r8d
0xe0285f: call 0x140391680
0xe02864: mov r10d, dword ptr [rdi]
0xe02867: test r10d, r10d
0xe0286a: je 0x140e028bc
0xe0286c: xor edx, edx
0xe0286e: mov eax, ebp
0xe02870: div r10d
0xe02873: mov r8d, edx
0xe02876: shl r8, 8
0xe0287a: add r8, qword ptr [rdi + 0x10]
0xe0287e: xor edx, edx
0xe02880: mov r9d, dword ptr [r8]
0xe02883: test r9d, r9d
0xe02886: je 0x140e028bc
0xe02888: cmp dword ptr [r8 + rdx*8 + 8], ebp
0xe0288d: jne 0x140e028b5
0xe0288f: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe02894: mov rax, qword ptr [rdi + 0x18]
0xe02898: mov rbx, qword ptr [rax + rcx*8]
0xe0289c: mov rcx, qword ptr [r14]
0xe0289f: movzx eax, byte ptr [rcx + 8]
0xe028a3: cmp byte ptr [rbx + 0x10], al
0xe028a6: jne 0x140e028b5
0xe028a8: mov rax, qword ptr [rcx]
0xe028ab: cmp qword ptr [rbx + 8], rax
0xe028af: je 0x140e02972
0xe028b5: inc edx
0xe028b7: cmp edx, r9d
0xe028ba: jb 0x140e02888
0xe028bc: mov rax, qword ptr [rsp + 0x88]
0xe028c4: mov byte ptr [rax], 0
0xe028c7: xor edx, edx
0xe028c9: mov eax, ebp
0xe028cb: div r10d
0xe028ce: mov ecx, edx
0xe028d0: shl rcx, 8
0xe028d4: mov rax, qword ptr [rdi + 0x10]
0xe028d8: cmp dword ptr [rcx + rax], 0x1f
0xe028dc: jne 0x140e028ee
0xe028de: mov edx, ebp
0xe028e0: mov rcx, rdi
0xe028e3: call 0x140391680
0xe028e8: xor edx, edx
0xe028ea: mov eax, ebp
0xe028ec: div dword ptr [rdi]
0xe028ee: mov r12d, edx
0xe028f1: shl r12, 8
0xe028f5: add r12, qword ptr [rdi + 0x10]
0xe028f9: mov ecx, dword ptr [r12]
0xe028fd: mov dword ptr [rsp + 0xa0], ecx
0xe02904: imul eax, edx, 0x1f
0xe02907: add eax, ecx
0xe02909: mov dword ptr [rsp + 0x78], eax
0xe0290d: mov r13d, dword ptr [rdi + 4]
0xe02911: lea r15, [rdi + 8]
0xe02915: mov ecx, dword ptr [r15]
0xe02918: lea rsi, [rdi + 4]
0xe0291c: mov edx, 0x1fd
0xe02921: cmp r13d, ecx
0xe02924: jb 0x140e02a47
0xe0292a: lea eax, [r13 + 1]
0xe0292e: lea rsi, [rdi + 4]
0xe02932: cmp eax, ecx
0xe02934: jbe 0x140e02a47
0xe0293a: lea eax, [rax + rax*2]
0xe0293d: inc eax
0xe0293f: shr eax, 1
0xe02941: mov dword ptr [rsp + 0x80], eax
0xe02948: lea ecx, [rax*8]
0xe0294f: mov rax, qword ptr gs:[0x58]
0xe02958: mov rax, qword ptr [rax]
0xe0295b: mov qword ptr [rsp + 0x60], rax
0xe02960: cmp byte ptr [rdx + rax], 0
0xe02964: mov edx, 0x40
0xe02969: je 0x140e0298b
0xe0296b: call 0x1447efa78
0xe02970: jmp 0x140e02990
0xe02972: test rbx, rbx
0xe02975: je 0x140e028bc
0xe0297b: mov rax, qword ptr [rsp + 0x88]
0xe02983: mov byte ptr [rax], 1
0xe02986: jmp 0x140e02ad6
0xe0298b: call 0x1447ef9b0
0xe02990: mov r14, rax
0xe02993: lea rsi, [rdi + 4]
0xe02997: test rax, rax
0xe0299a: jne 0x140e029bf
0xe0299c: call 0x141318e70
0xe029a1: xor r9d, r9d
0xe029a4: xor r8d, r8d
0xe029a7: mov edx, 1
0xe029ac: mov ecx, 0xa0000002
0xe029b1: call qword ptr [rip + 0x43e8791]
0xe029b7: lea rsi, [rdi + 4]
0xe029bb: lea r15, [rdi + 8]
0xe029bf: lea rbx, [rdi + 0x18]
0xe029c3: cmp qword ptr [rbx], 0
0xe029c7: je 0x140e02a30
0xe029c9: xor r8d, r8d
0xe029cc: mov rcx, rbx
0xe029cf: cmp dword ptr [rsi], r8d
0xe029d2: jbe 0x140e02a03
0xe029d4: nop dword ptr [rax]
0xe029d8: nop dword ptr [rax + rax]
0xe029e0: lea rdx, [r8*8]
0xe029e8: mov rax, qword ptr [rbx]
0xe029eb: mov rcx, qword ptr [rdx + rax]
0xe029ef: mov qword ptr [rdx + r14], rcx
0xe029f3: inc r8d
0xe029f6: cmp r8d, dword ptr [rsi]
0xe029f9: jb 0x140e029e0
0xe029fb: lea rcx, [rdi + 0x18]
0xe029ff: lea r15, [rdi + 8]
0xe02a03: mov rbx, rcx
0xe02a06: mov rcx, qword ptr [rcx]
0xe02a09: test rcx, rcx
0xe02a0c: je 0x140e02a2c
0xe02a0e: mov rax, qword ptr [rsp + 0x60]
0xe02a13: mov r8d, 0x1fd
0xe02a19: cmp byte ptr [r8 + rax], 0
0xe02a1e: je 0x140e02a27
0xe02a20: call 0x1447f03bc
0xe02a25: jmp 0x140e02a2c
0xe02a27: call 0x1447f02bc
0xe02a2c: lea rsi, [rdi + 4]
0xe02a30: mov qword ptr [rbx], r14
0xe02a33: mov eax, dword ptr [rsp + 0x80]
0xe02a3a: mov dword ptr [r15], eax
0xe02a3d: mov r14, qword ptr [rsp + 0x68]
0xe02a42: mov edx, 0x1fd
0xe02a47: mov eax, dword ptr [rsp + 0xa0]
0xe02a4e: mov dword ptr [r12 + rax*8 + 8], ebp
0xe02a53: mov dword ptr [r12 + rax*8 + 0xc], r13d
0xe02a58: inc dword ptr [r12]
0xe02a5c: mov rax, qword ptr gs:[0x58]
0xe02a65: mov rcx, qword ptr [rax]
0xe02a68: cmp byte ptr [rdx + rcx], 0
0xe02a6c: mov edx, 8
0xe02a71: mov ecx, 0x28
0xe02a76: je 0x140e02a7f
0xe02a78: call 0x1447efa78
0xe02a7d: jmp 0x140e02a84
0xe02a7f: call 0x1447ef9b0
0xe02a84: mov rbx, rax
0xe02a87: test rax, rax
0xe02a8a: jne 0x140e02aab
0xe02a8c: call 0x141318e70
0xe02a91: xor r9d, r9d
0xe02a94: xor r8d, r8d
0xe02a97: mov edx, 1
0xe02a9c: mov ecx, 0xa0000002
0xe02aa1: call qword ptr [rip + 0x43e86a1]
0xe02aa7: lea rsi, [rdi + 4]
0xe02aab: mov qword ptr [rsp + 0x60], rbx
0xe02ab0: mov rax, qword ptr [r14]
0xe02ab3: vmovups xmm0, xmmword ptr [rax]
0xe02ab7: mov eax, dword ptr [rsp + 0x78]
0xe02abb: mov dword ptr [rbx], eax
0xe02abd: vmovups xmmword ptr [rbx + 8], xmm0
0xe02ac2: xor eax, eax
0xe02ac4: mov qword ptr [rbx + 0x18], rax
0xe02ac8: mov qword ptr [rbx + 0x20], rax
0xe02acc: mov rax, qword ptr [rdi + 0x18]
0xe02ad0: mov qword ptr [rax + r13*8], rbx
0xe02ad4: inc dword ptr [rsi]
0xe02ad6: lea rcx, [rbx + 8]
0xe02ada: mov rax, qword ptr [rsp + 0x90]
0xe02ae2: mov qword ptr [rax], rcx
0xe02ae5: lea rcx, [rbx + 0x18]
0xe02ae9: mov rax, qword ptr [rsp + 0x98]
0xe02af1: mov qword ptr [rax], rcx
0xe02af4: mov rbx, qword ptr [rsp + 0x70]
0xe02af9: add rsp, 0x20
0xe02afd: pop r15
0xe02aff: pop r14
0xe02b01: pop r13
0xe02b03: pop r12
0xe02b05: pop rdi
0xe02b06: pop rsi
0xe02b07: pop rbp
0xe02b08: ret 