0x219d7f0: mov qword ptr [rsp + 0x10], rbx
0x219d7f5: mov qword ptr [rsp + 0x18], rsi
0x219d7fa: mov qword ptr [rsp + 0x20], rdi
0x219d7ff: push rbp
0x219d800: push r12
0x219d802: push r13
0x219d804: push r14
0x219d806: push r15
0x219d808: mov rbp, rsp
0x219d80b: sub rsp, 0x60
0x219d80f: mov r13, r9
0x219d812: mov rsi, r8
0x219d815: mov r14, rdx
0x219d818: mov rbx, rcx
0x219d81b: xor r12d, r12d
0x219d81e: mov dword ptr [rbp - 0x40], r12d
0x219d822: mov r15, qword ptr [rcx + 8]
0x219d826: mov edi, 0xffffffff
0x219d82b: cmp byte ptr [rbp + 0x50], r12b
0x219d82f: je 0x14219d941
0x219d835: lea rdx, [r15 + 8]
0x219d839: test r15, r15
0x219d83c: cmove rdx, r12
0x219d840: mov r8b, 1
0x219d843: mov rdx, qword ptr [rdx]
0x219d846: lea rcx, [rbp - 0x38]
0x219d84a: call 0x140393650
0x219d84f: nop 
0x219d850: mov rax, qword ptr [rbp + 0x58]
0x219d854: mov rcx, qword ptr [rax]
0x219d857: mov qword ptr [rbx + 0x468], rcx
0x219d85e: vmovups ymm0, ymmword ptr [rbx + 0x450]
0x219d866: vmovups ymmword ptr [rbp - 0x20], ymm0
0x219d86b: mov rbx, qword ptr [rbp - 0x38]
0x219d86f: mov rax, qword ptr [rbx]
0x219d872: xor edx, edx
0x219d874: mov rcx, rbx
0x219d877: vzeroupper 
0x219d87a: call qword ptr [rax + 0x20]
0x219d87d: cmp byte ptr [rbp - 0x30], 1
0x219d881: jne 0x14219d8ae
0x219d883: mov eax, edi
0x219d885: lock xadd dword ptr [rbx + 8], eax
0x219d88a: cmp eax, 1
0x219d88d: jne 0x14219d8a1
0x219d88f: test dword ptr [rbx + 0xc], 0x40000000
0x219d896: je 0x14219d8ae
0x219d898: mov rax, qword ptr [rbx]
0x219d89b: mov rcx, rbx
0x219d89e: call qword ptr [rax + 0x40]
0x219d8a1: test dword ptr [rbx + 0xc], 0x40000000
0x219d8a8: je 0x14219d8ae
0x219d8aa: lock dec dword ptr [rbx + 0xc]
0x219d8ae: lea rdx, [rsi + 8]
0x219d8b2: test rsi, rsi
0x219d8b5: cmove rdx, r12
0x219d8b9: mov r8b, 1
0x219d8bc: mov rdx, qword ptr [rdx]
0x219d8bf: lea rcx, [rbp - 0x38]
0x219d8c3: call 0x140393650
0x219d8c8: nop 
0x219d8c9: mov byte ptr [rsi + 0x17c], 0
0x219d8d0: mov edx, 0x1ec
0x219d8d5: mov rax, qword ptr gs:[0x58]
0x219d8de: mov rcx, qword ptr [rax]
0x219d8e1: vmovups ymm0, ymmword ptr [rbp - 0x20]
0x219d8e6: cmp byte ptr [rdx + rcx], 0
0x219d8ea: je 0x14219d8f6
0x219d8ec: vmovups ymmword ptr [rip + 0x48cf944], ymm0
0x219d8f4: jmp 0x14219d8fe
0x219d8f6: vmovups ymmword ptr [rip + 0x48cf91a], ymm0
0x219d8fe: mov rbx, qword ptr [rbp - 0x38]
0x219d902: mov rax, qword ptr [rbx]
0x219d905: xor edx, edx
0x219d907: mov rcx, rbx
0x219d90a: vzeroupper 
0x219d90d: call qword ptr [rax + 0x20]
0x219d910: cmp byte ptr [rbp - 0x30], 1
0x219d914: jne 0x14219d941
0x219d916: mov eax, edi
0x219d918: lock xadd dword ptr [rbx + 8], eax
0x219d91d: cmp eax, 1
0x219d920: jne 0x14219d934
0x219d922: test dword ptr [rbx + 0xc], 0x40000000
0x219d929: je 0x14219d941
0x219d92b: mov rax, qword ptr [rbx]
0x219d92e: mov rcx, rbx
0x219d931: call qword ptr [rax + 0x40]
0x219d934: test dword ptr [rbx + 0xc], 0x40000000
0x219d93b: je 0x14219d941
0x219d93d: lock dec dword ptr [rbx + 0xc]
0x219d941: lea rdx, [r15 + 8]
0x219d945: test r15, r15
0x219d948: cmove rdx, r12
0x219d94c: mov r8b, 1
0x219d94f: mov rdx, qword ptr [rdx]
0x219d952: lea rcx, [rbp - 0x38]
0x219d956: call 0x140393650
0x219d95b: nop 
0x219d95c: mov byte ptr [r15 + 0xc3], 1
0x219d964: mov rax, qword ptr [r13 + 0x68]
0x219d968: mov rcx, qword ptr [rax + 0x20]
0x219d96c: movzx eax, byte ptr [rcx + 0x398]
0x219d973: and al, 0xfb
0x219d975: mov byte ptr [rcx + 0x398], al
0x219d97b: mov rbx, qword ptr [rbp - 0x38]
0x219d97f: mov rax, qword ptr [rbx]
0x219d982: xor edx, edx
0x219d984: mov rcx, rbx
0x219d987: call qword ptr [rax + 0x20]
0x219d98a: cmp byte ptr [rbp - 0x30], 1
0x219d98e: jne 0x14219d9bb
0x219d990: mov eax, edi
0x219d992: lock xadd dword ptr [rbx + 8], eax
0x219d997: cmp eax, 1
0x219d99a: jne 0x14219d9ae
0x219d99c: test dword ptr [rbx + 0xc], 0x40000000
0x219d9a3: je 0x14219d9bb
0x219d9a5: mov rax, qword ptr [rbx]
0x219d9a8: mov rcx, rbx
0x219d9ab: call qword ptr [rax + 0x40]
0x219d9ae: test dword ptr [rbx + 0xc], 0x40000000
0x219d9b5: je 0x14219d9bb
0x219d9b7: lock dec dword ptr [rbx + 0xc]
0x219d9bb: mov rcx, qword ptr [r13 + 0x68]
0x219d9bf: mov rcx, qword ptr [rcx + 0x1c0]
0x219d9c6: call 0x14156ff30
0x219d9cb: mov byte ptr [rbp + 0x50], 0xc
0x219d9cf: mov rcx, qword ptr [r13 + 0x68]
0x219d9d3: lea rdx, [rbp + 0x50]
0x219d9d7: mov rcx, qword ptr [rcx + 0x1c0]
0x219d9de: call 0x141572430
0x219d9e3: mov rax, qword ptr [rsi]
0x219d9e6: mov rcx, rsi
0x219d9e9: call qword ptr [rax + 0x40]
0x219d9ec: mov rbx, rax
0x219d9ef: lea rdx, [rax + 8]
0x219d9f3: test rax, rax
0x219d9f6: cmove rdx, r12
0x219d9fa: mov r8b, 1
0x219d9fd: mov rdx, qword ptr [rdx]
0x219da00: lea rcx, [rbp - 0x38]
0x219da04: call 0x140393650
0x219da09: nop 
0x219da0a: mov dword ptr [rbx + 0x170], r12d
0x219da11: mov rbx, qword ptr [rbp - 0x38]
0x219da15: mov rax, qword ptr [rbx]
0x219da18: xor edx, edx
0x219da1a: mov rcx, rbx
0x219da1d: call qword ptr [rax + 0x20]
0x219da20: cmp byte ptr [rbp - 0x30], 1
0x219da24: jne 0x14219da4f
0x219da26: lock xadd dword ptr [rbx + 8], edi
0x219da2b: cmp edi, 1
0x219da2e: jne 0x14219da42
0x219da30: test dword ptr [rbx + 0xc], 0x40000000
0x219da37: je 0x14219da4f
0x219da39: mov rax, qword ptr [rbx]
0x219da3c: mov rcx, rbx
0x219da3f: call qword ptr [rax + 0x40]
0x219da42: test dword ptr [rbx + 0xc], 0x40000000
0x219da49: je 0x14219da4f
0x219da4b: lock dec dword ptr [rbx + 0xc]
0x219da4f: mov r15d, 0x1ec
0x219da55: mov rax, qword ptr gs:[0x58]
0x219da5e: add r15, qword ptr [rax]
0x219da61: mov rax, qword ptr [rip + 0x4bcba70]
0x219da68: cmp byte ptr [r15], 0
0x219da6c: cmovne rax, qword ptr [rip + 0x4bcba6c]
0x219da74: mov rax, qword ptr [rax + 0x20]
0x219da78: mov word ptr [rax + 0x7c], 0xffff
0x219da7e: mov rax, qword ptr [rsi]
0x219da81: mov rcx, rsi
0x219da84: call qword ptr [rax + 0x40]
0x219da87: mov rbx, rax
0x219da8a: lea rdx, [rax + 8]
0x219da8e: test rax, rax
0x219da91: cmove rdx, r12
0x219da95: mov rdx, qword ptr [rdx]
0x219da98: lea rcx, [rbp - 0x38]
0x219da9c: call 0x140393df0
0x219daa1: nop 
0x219daa2: mov qword ptr [rbp - 0x30], rbx
0x219daa6: mov edi, 1
0x219daab: mov dword ptr [rbp - 0x40], edi
0x219daae: movzx eax, byte ptr [rbx + 0x20]
0x219dab2: mov byte ptr [rbp + 0x50], al
0x219dab5: and edi, 0xfffffffe
0x219dab8: mov dword ptr [rbp - 0x40], edi
0x219dabb: mov rcx, qword ptr [rbp - 0x38]
0x219dabf: mov rax, qword ptr [rcx]
0x219dac2: mov dl, 1
0x219dac4: call qword ptr [rax + 0x20]
0x219dac7: lea rcx, [rbp + 0x50]
0x219dacb: call 0x1409d9760
0x219dad0: mov rbx, rax
0x219dad3: mov rcx, qword ptr [rsi]
0x219dad6: mov r8, qword ptr [rcx + 0x60]
0x219dada: lea rdx, [rbp + 0x30]
0x219dade: mov rcx, rsi
0x219dae1: call r8
0x219dae4: movzx ecx, word ptr [rax]
0x219dae7: cmp word ptr [rbx + 0x20], cx
0x219daeb: je 0x14219db58
0x219daed: mov rax, qword ptr [rsi]
0x219daf0: mov rcx, rsi
0x219daf3: call qword ptr [rax + 0x40]
0x219daf6: mov rbx, rax
0x219daf9: lea rdx, [rax + 8]
0x219dafd: test rax, rax
0x219db00: cmove rdx, r12
0x219db04: mov r8b, 1
0x219db07: mov rdx, qword ptr [rdx]
0x219db0a: lea rcx, [rbp - 0x38]
0x219db0e: call 0x140393650
0x219db13: nop 
0x219db14: mov qword ptr [rbp - 0x28], rbx
0x219db18: or edi, 2
0x219db1b: mov dword ptr [rbp - 0x40], edi
0x219db1e: mov rax, qword ptr [rip + 0x4bcba03]
0x219db25: cmp byte ptr [r15], 0
0x219db29: cmovne rax, qword ptr [rip + 0x4bcb9ff]
0x219db31: mov rax, qword ptr [rax]
0x219db34: mov rcx, qword ptr [rax + 8]
0x219db38: mov rax, qword ptr [rcx + 0x458]
0x219db3f: movzx ecx, byte ptr [rax + 0xa0]
0x219db46: mov byte ptr [rbx + 0x20], cl
0x219db49: and edi, 0xfffffffd
0x219db4c: mov dword ptr [rbp - 0x40], edi
0x219db4f: lea rcx, [rbp - 0x38]
0x219db53: call 0x140393c10
0x219db58: mov rax, r14
0x219db5b: mov dword ptr [r14], r12d
0x219db5e: lea r11, [rsp + 0x60]
0x219db63: mov rbx, qword ptr [r11 + 0x38]
0x219db67: mov rsi, qword ptr [r11 + 0x40]
0x219db6b: mov rdi, qword ptr [r11 + 0x48]
0x219db6f: mov rsp, r11
0x219db72: pop r15
0x219db74: pop r14
0x219db76: pop r13
0x219db78: pop r12
0x219db7a: pop rbp
0x219db7b: ret 