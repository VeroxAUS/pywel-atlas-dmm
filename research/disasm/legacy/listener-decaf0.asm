0xdecaf0: mov qword ptr [rsp + 0x10], rbx
0xdecaf5: push rdi
0xdecaf6: sub rsp, 0x20
0xdecafa: vmovss xmm0, dword ptr [rcx + 0xe0]
0xdecb02: vsubss xmm3, xmm0, dword ptr [rdx]
0xdecb06: vmovss xmm2, dword ptr [rip + 0x4f86292]
0xdecb0e: vcomiss xmm2, xmm3
0xdecb12: mov rdi, rdx
0xdecb15: mov rbx, rcx
0xdecb18: jb 0x140decb67
0xdecb1a: vmovss xmm1, dword ptr [rip + 0x4f86dde]
0xdecb22: vcomiss xmm3, xmm1
0xdecb26: jb 0x140decb67
0xdecb28: vmovss xmm0, dword ptr [rcx + 0xe4]
0xdecb30: vsubss xmm3, xmm0, dword ptr [rdx + 4]
0xdecb35: vcomiss xmm2, xmm3
0xdecb39: jb 0x140decb67
0xdecb3b: vcomiss xmm3, xmm1
0xdecb3f: jb 0x140decb67
0xdecb41: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdecb49: vsubss xmm3, xmm0, dword ptr [rdx + 8]
0xdecb4e: vcomiss xmm2, xmm3
0xdecb52: jb 0x140decb67
0xdecb54: vcomiss xmm3, xmm1
0xdecb58: jb 0x140decb67
0xdecb5a: xor al, al
0xdecb5c: mov rbx, qword ptr [rsp + 0x38]
0xdecb61: add rsp, 0x20
0xdecb65: pop rdi
0xdecb66: ret 
0xdecb67: cmp qword ptr [rcx + 0x28], 0
0xdecb6c: vmovsd xmm0, qword ptr [rdx]
0xdecb70: vmovsd qword ptr [rcx + 0xe0], xmm0
0xdecb78: mov eax, dword ptr [rdx + 8]
0xdecb7b: mov dword ptr [rcx + 0xe8], eax
0xdecb81: mov byte ptr [rcx + 0x1ef], 1
0xdecb88: je 0x140decc2a
0xdecb8e: mov rax, qword ptr [rcx]
0xdecb91: call qword ptr [rax + 0x520]
0xdecb97: test al, al
0xdecb99: jne 0x140decc2a
0xdecb9f: vmovss xmm0, dword ptr [rdi]
0xdecba3: mov ecx, dword ptr [rbx + 0xec]
0xdecba9: vxorps xmm2, xmm2, xmm2
0xdecbad: vxorps xmm3, xmm3, xmm3
0xdecbb1: vcvtsi2ss xmm3, xmm3, dword ptr [rip + 0x5ec054f]
0xdecbb9: vdivss xmm1, xmm0, xmm3
0xdecbbd: vmovss xmm0, dword ptr [rdi + 8]
0xdecbc2: vroundss xmm2, xmm2, xmm1, 1
0xdecbc8: vcvttss2si eax, xmm2
0xdecbcc: mov dword ptr [rsp + 0x30], eax
0xdecbd0: vxorps xmm2, xmm2, xmm2
0xdecbd4: vdivss xmm1, xmm0, xmm3
0xdecbd8: vroundss xmm2, xmm2, xmm1, 1
0xdecbde: vcvttss2si edx, xmm2
0xdecbe2: mov dword ptr [rsp + 0x34], edx
0xdecbe6: cmp eax, ecx
0xdecbe8: jne 0x140decbf2
0xdecbea: cmp edx, dword ptr [rbx + 0xf0]
0xdecbf0: je 0x140decc2a
0xdecbf2: cmp ecx, 0x7fffffff
0xdecbf8: jne 0x140decc02
0xdecbfa: cmp dword ptr [rbx + 0xf0], ecx
0xdecc00: je 0x140decc1e
0xdecc02: mov rcx, qword ptr [rbx + 0x28]
0xdecc06: lea r9, [rsp + 0x30]
0xdecc0b: lea r8, [rbx + 0xec]
0xdecc12: mov rdx, rbx
0xdecc15: mov rax, qword ptr [rcx]
0xdecc18: call qword ptr [rax + 0x4d8]
0xdecc1e: mov rax, qword ptr [rsp + 0x30]
0xdecc23: mov qword ptr [rbx + 0xec], rax
0xdecc2a: mov rbx, qword ptr [rsp + 0x38]
0xdecc2f: mov al, 1
0xdecc31: add rsp, 0x20
0xdecc35: pop rdi
0xdecc36: ret 