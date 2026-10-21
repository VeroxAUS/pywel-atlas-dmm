0x9fca60: mov qword ptr [rsp + 8], rbx
0x9fca65: mov qword ptr [rsp + 0x10], rbp
0x9fca6a: mov qword ptr [rsp + 0x18], rsi
0x9fca6f: push rdi
0x9fca70: sub rsp, 0x30
0x9fca74: movsx eax, word ptr [rdx + 0xe]
0x9fca78: movzx ebp, r9b
0x9fca7c: vxorps xmm1, xmm1, xmm1
0x9fca80: vcvtsi2ss xmm1, xmm1, eax
0x9fca84: vmulss xmm1, xmm1, dword ptr [rip + 0x5376c68]
0x9fca8c: movsx eax, word ptr [rdx + 0xc]
0x9fca90: movzx esi, r8b
0x9fca94: vxorps xmm2, xmm2, xmm2
0x9fca98: vcvtsi2ss xmm2, xmm2, eax
0x9fca9c: vmovaps xmmword ptr [rsp + 0x20], xmm6
0x9fcaa2: vaddss xmm6, xmm1, dword ptr [rdx + 8]
0x9fcaa7: vmulss xmm1, xmm2, dword ptr [rip + 0x5376c45]
0x9fcaaf: vaddss xmm0, xmm1, dword ptr [rdx]
0x9fcab3: mov rdi, rdx
0x9fcab6: mov rbx, rcx
0x9fcab9: call 0x144898f3e
0x9fcabe: test ax, ax
0x9fcac1: jg 0x1409fcb9a
0x9fcac7: vmovss xmm0, dword ptr [rdi + 4]
0x9fcacc: call 0x144898f3e
0x9fcad1: test ax, ax
0x9fcad4: jg 0x1409fcb9a
0x9fcada: vmovaps xmm0, xmm6
0x9fcade: call 0x144898f3e
0x9fcae3: test ax, ax
0x9fcae6: jg 0x1409fcb9a
0x9fcaec: mov rax, qword ptr [rbx + 8]
0x9fcaf0: test byte ptr [rax + 0x5e], 0x10
0x9fcaf4: ja 0x1409fcb10
0x9fcaf6: lea rcx, [rbx + 0x98]
0x9fcafd: mov rdx, rdi
0x9fcb00: call 0x1406b3680
0x9fcb05: xor cl, cl
0x9fcb07: lea rax, [rbx + 0x5a0]
0x9fcb0e: jmp 0x1409fcb21
0x9fcb10: lea rax, [rbx + 0x5a0]
0x9fcb17: cmp byte ptr [rax], sil
0x9fcb1a: jb 0x1409fcb9a
0x9fcb1c: movzx ecx, byte ptr [rsp + 0x68]
0x9fcb21: mov byte ptr [rax], sil
0x9fcb24: movzx eax, byte ptr [rsp + 0x70]
0x9fcb29: vmovups xmm0, xmmword ptr [rdi]
0x9fcb2d: mov byte ptr [rbx + 0x5a2], al
0x9fcb33: mov byte ptr [rbx + 0x5a1], cl
0x9fcb39: vmovups xmmword ptr [rbx + 0x590], xmm0
0x9fcb41: test bpl, bpl
0x9fcb44: je 0x1409fcb64
0x9fcb46: mov rax, qword ptr [rsp + 0x60]
0x9fcb4b: vmovsd xmm0, qword ptr [rax]
0x9fcb4f: vmovsd qword ptr [rbx + 0x580], xmm0
0x9fcb57: mov eax, dword ptr [rax + 8]
0x9fcb5a: mov dword ptr [rbx + 0x588], eax
0x9fcb60: mov al, 1
0x9fcb62: jmp 0x1409fcb82
0x9fcb64: vmovsd xmm0, qword ptr [rip + 0x4b4931c]
0x9fcb6c: vmovsd qword ptr [rbx + 0x580], xmm0
0x9fcb74: mov eax, dword ptr [rip + 0x4b49316]
0x9fcb7a: mov dword ptr [rbx + 0x588], eax
0x9fcb80: xor al, al
0x9fcb82: mov byte ptr [rbx + 0x58c], al
0x9fcb88: mov r8b, 1
0x9fcb8b: mov rcx, qword ptr [rbx + 8]
0x9fcb8f: xor edx, edx
0x9fcb91: mov rax, qword ptr [rcx]
0x9fcb94: call qword ptr [rax + 0x1b0]
0x9fcb9a: mov rbx, qword ptr [rsp + 0x40]
0x9fcb9f: mov rbp, qword ptr [rsp + 0x48]
0x9fcba4: mov rsi, qword ptr [rsp + 0x50]
0x9fcba9: vmovaps xmm6, xmmword ptr [rsp + 0x20]
0x9fcbaf: add rsp, 0x30
0x9fcbb3: pop rdi
0x9fcbb4: ret 