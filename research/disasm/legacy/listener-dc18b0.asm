0xdc18b0: mov rax, rsp
0xdc18b3: mov qword ptr [rax + 0x10], rbx
0xdc18b7: mov qword ptr [rax + 0x18], rsi
0xdc18bb: push rdi
0xdc18bc: push r12
0xdc18be: push r13
0xdc18c0: push r14
0xdc18c2: push r15
0xdc18c4: sub rsp, 0x120
0xdc18cb: vmovaps xmmword ptr [rax - 0x38], xmm6
0xdc18d0: vmovaps xmmword ptr [rax - 0x48], xmm7
0xdc18d5: vmovaps xmmword ptr [rax - 0x58], xmm8
0xdc18da: vmovaps xmmword ptr [rax - 0x68], xmm9
0xdc18df: vmovaps xmmword ptr [rax - 0x78], xmm10
0xdc18e4: vmovaps xmmword ptr [rax - 0x88], xmm11
0xdc18ec: vmovaps xmmword ptr [rax - 0x98], xmm12
0xdc18f4: mov r14, rcx
0xdc18f7: mov rdi, qword ptr [rcx + 0x7c0]
0xdc18fe: test rdi, rdi
0xdc1901: je 0x140dc1de3
0xdc1907: cmp dword ptr [rcx + 0x2e0], 0
0xdc190e: jne 0x140dc191d
0xdc1910: cmp byte ptr [rcx + 0x2f8], 0
0xdc1917: je 0x140dc1de3
0xdc191d: mov rbx, qword ptr [rcx + 8]
0xdc1921: lea rdx, [rsp + 0x150]
0xdc1929: mov rcx, qword ptr [rbx + 0x18]
0xdc192d: call 0x1435b4b90
0xdc1932: vmovss xmm6, dword ptr [r14 + 0xa98]
0xdc193b: vmovss xmm3, dword ptr [rip + 0x4fb15f1]
0xdc1943: vmulss xmm0, xmm3, dword ptr [rax + 4]
0xdc1948: vmulss xmm1, xmm0, xmm6
0xdc194c: vaddss xmm7, xmm1, dword ptr [r14 + 0xa5c]
0xdc1955: vmulss xmm0, xmm3, dword ptr [rax]
0xdc1959: vmulss xmm1, xmm0, xmm6
0xdc195d: vsubss xmm8, xmm1, dword ptr [r14 + 0xa58]
0xdc1966: mov rax, qword ptr [rbx + 0xa0]
0xdc196d: xor r13d, r13d
0xdc1970: test rax, rax
0xdc1973: je 0x140dc1989
0xdc1975: cmp qword ptr [rax + 8], r13
0xdc1979: je 0x140dc1989
0xdc197b: mov rcx, qword ptr [rbx + 0x38]
0xdc197f: call 0x143ed8480
0xdc1984: mov rcx, rax
0xdc1987: jmp 0x140dc19be
0xdc1989: movzx edx, byte ptr [rbx + 0x94]
0xdc1990: cmp dl, 0xff
0xdc1993: jne 0x140dc199a
0xdc1995: mov rcx, r13
0xdc1998: jmp 0x140dc19be
0xdc199a: mov rax, qword ptr [rbx + 0x58]
0xdc199e: mov rcx, qword ptr [rax + 0xb0]
0xdc19a5: mov r8, qword ptr [rcx + 0xb0]
0xdc19ac: cmp edx, dword ptr [r8 + 8]
0xdc19b0: jb 0x140dc19b7
0xdc19b2: mov rcx, r13
0xdc19b5: jmp 0x140dc19be
0xdc19b7: mov rax, qword ptr [r8]
0xdc19ba: mov rcx, qword ptr [rax + rdx*8]
0xdc19be: cmp byte ptr [rcx + 0x13b], r13b
0xdc19c5: jne 0x140dc19d1
0xdc19c7: vmovss xmm0, dword ptr [rcx + 0xd8]
0xdc19cf: jmp 0x140dc19ea
0xdc19d1: mov eax, 0xe0
0xdc19d6: mov edx, 0xdc
0xdc19db: cmp byte ptr [rcx + 0x13c], r13b
0xdc19e2: cmove eax, edx
0xdc19e5: vmovss xmm0, dword ptr [rax + rcx]
0xdc19ea: vmulss xmm1, xmm0, dword ptr [rcx + 0xd4]
0xdc19f2: vmovss xmm0, dword ptr [rip + 0x4fb16ba]
0xdc19fa: vdivss xmm0, xmm0, xmm6
0xdc19fe: vmulss xmm1, xmm0, xmm1
0xdc1a02: mov qword ptr [rdi + 0x38], 0x3f800000
0xdc1a0a: mov qword ptr [rdi + 0x40], r13
0xdc1a0e: mov dword ptr [rdi + 0x48], r13d
0xdc1a12: mov qword ptr [rdi + 0x4c], 0x3f800000
0xdc1a1a: mov qword ptr [rdi + 0x54], r13
0xdc1a1e: mov dword ptr [rdi + 0x5c], r13d
0xdc1a22: mov qword ptr [rdi + 0x60], 0x3f800000
0xdc1a2a: vmovss dword ptr [rdi + 0x68], xmm8
0xdc1a2f: vmovss dword ptr [rdi + 0x6c], xmm7
0xdc1a34: mov dword ptr [rdi + 0x70], r13d
0xdc1a38: mov dword ptr [rdi + 0x74], 0x3f800000
0xdc1a3f: vmovss dword ptr [rsp + 0x70], xmm1
0xdc1a45: vxorps xmm12, xmm12, xmm12
0xdc1a4a: vmovups xmmword ptr [rsp + 0x74], xmm12
0xdc1a50: vmovss dword ptr [rsp + 0x84], xmm1
0xdc1a59: vmovss dword ptr [rsp + 0x88], xmm12
0xdc1a62: vmovss dword ptr [rsp + 0x8c], xmm12
0xdc1a6b: vmovaps ymm0, ymmword ptr [rip + 0x4fb4ecd]
0xdc1a73: vmovups ymmword ptr [rsp + 0x90], ymm0
0xdc1a7c: mov rax, qword ptr [r14 + 0x7c0]
0xdc1a83: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdc1a88: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdc1a8d: vmovups ymm0, ymmword ptr [rsp + 0x70]
0xdc1a93: vperm2f128 ymm8, ymm0, ymm0, 0
0xdc1a99: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdc1a9f: vmovups ymm1, ymmword ptr [rsp + 0x90]
0xdc1aa8: vperm2f128 ymm10, ymm1, ymm1, 0
0xdc1aae: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdc1ab4: vshufps ymm0, ymm3, ymm3, 0
0xdc1ab9: vshufps ymm1, ymm3, ymm3, 0x55
0xdc1abe: vshufps ymm2, ymm3, ymm3, 0xaa
0xdc1ac3: vshufps ymm3, ymm3, ymm3, 0xff
0xdc1ac8: vshufps ymm4, ymm7, ymm7, 0
0xdc1acd: vshufps ymm5, ymm7, ymm7, 0x55
0xdc1ad2: vshufps ymm6, ymm7, ymm7, 0xaa
0xdc1ad7: vshufps ymm7, ymm7, ymm7, 0xff
0xdc1adc: vmulps ymm0, ymm8, ymm0
0xdc1ae0: vfmadd231ps ymm0, ymm1, ymm9
0xdc1ae5: vfmadd231ps ymm0, ymm2, ymm10
0xdc1aea: vfmadd231ps ymm0, ymm3, ymm11
0xdc1aef: vmovups ymmword ptr [rax + 0x38], ymm0
0xdc1af4: vmulps ymm1, ymm8, ymm4
0xdc1af8: vfmadd231ps ymm1, ymm5, ymm9
0xdc1afd: vfmadd231ps ymm1, ymm6, ymm10
0xdc1b02: vfmadd231ps ymm1, ymm7, ymm11
0xdc1b07: vmovups ymmword ptr [rax + 0x58], ymm1
0xdc1b0c: cmp byte ptr [rip + 0x5fa51c5], r13b
0xdc1b13: je 0x140dc1bbb
0xdc1b19: cmp qword ptr [r14 + 0x7b0], r13
0xdc1b20: je 0x140dc1bbb
0xdc1b26: mov rax, qword ptr [r14 + 0x7c0]
0xdc1b2d: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdc1b32: vmovups ymm7, ymmword ptr [rax + 0x58]
0xdc1b37: vmovups ymm0, ymmword ptr [r14 + 0xa18]
0xdc1b40: vmovups ymm1, ymmword ptr [r14 + 0xa38]
0xdc1b49: vperm2f128 ymm8, ymm0, ymm0, 0
0xdc1b4f: vperm2f128 ymm9, ymm0, ymm0, 0x11
0xdc1b55: vperm2f128 ymm10, ymm1, ymm1, 0
0xdc1b5b: vperm2f128 ymm11, ymm1, ymm1, 0x11
0xdc1b61: vshufps ymm0, ymm3, ymm3, 0
0xdc1b66: vshufps ymm1, ymm3, ymm3, 0x55
0xdc1b6b: vshufps ymm2, ymm3, ymm3, 0xaa
0xdc1b70: vshufps ymm3, ymm3, ymm3, 0xff
0xdc1b75: vshufps ymm4, ymm7, ymm7, 0
0xdc1b7a: vshufps ymm5, ymm7, ymm7, 0x55
0xdc1b7f: vshufps ymm6, ymm7, ymm7, 0xaa
0xdc1b84: vshufps ymm7, ymm7, ymm7, 0xff
0xdc1b89: vmulps ymm0, ymm0, ymm8
0xdc1b8e: vfmadd231ps ymm0, ymm1, ymm9
0xdc1b93: vfmadd231ps ymm0, ymm2, ymm10
0xdc1b98: vfmadd231ps ymm0, ymm3, ymm11
0xdc1b9d: vmovups ymmword ptr [rax + 0x38], ymm0
0xdc1ba2: vmulps ymm1, ymm4, ymm8
0xdc1ba7: vfmadd231ps ymm1, ymm5, ymm9
0xdc1bac: vfmadd231ps ymm1, ymm6, ymm10
0xdc1bb1: vfmadd231ps ymm1, ymm7, ymm11
0xdc1bb6: vmovups ymmword ptr [rax + 0x58], ymm1
0xdc1bbb: cmp byte ptr [rip + 0x5eeac36], r13b
0xdc1bc2: jne 0x140dc1bd1
0xdc1bc4: cmp byte ptr [r14 + 0x2f8], r13b
0xdc1bcb: je 0x140dc1de3
0xdc1bd1: mov byte ptr [r14 + 0x2f8], r13b
0xdc1bd8: mov rcx, qword ptr [r14 + 0x7c0]
0xdc1bdf: vzeroupper 
0xdc1be2: call 0x143d11360
0xdc1be7: vmovss xmm0, dword ptr [r14 + 0xaa0]
0xdc1bf0: vsubss xmm2, xmm0, dword ptr [rip + 0x5ee9df0]
0xdc1bf8: vmovss xmm0, dword ptr [rip + 0x5ee9e88]
0xdc1c00: vsubss xmm1, xmm0, dword ptr [rip + 0x5ee9de0]
0xdc1c08: vdivss xmm5, xmm2, xmm1
0xdc1c0c: vmovss xmm0, dword ptr [rip + 0x5eeac34]
0xdc1c14: vsubss xmm1, xmm0, dword ptr [rip + 0x5eeac7c]
0xdc1c1c: vmulss xmm2, xmm1, xmm5
0xdc1c20: vaddss xmm7, xmm2, dword ptr [rip + 0x5eeac70]
0xdc1c28: vmovss xmm0, dword ptr [rip + 0x5eeacb8]
0xdc1c30: vsubss xmm1, xmm0, dword ptr [rip + 0x5eead00]
0xdc1c38: vmulss xmm2, xmm1, xmm5
0xdc1c3c: vaddss xmm8, xmm2, dword ptr [rip + 0x5eeacf4]
0xdc1c44: mov rax, qword ptr [r14 + 0x7c0]
0xdc1c4b: vmovss dword ptr [rax + 0xc8], xmm8
0xdc1c53: vmovss dword ptr [rax + 0xcc], xmm7
0xdc1c5b: mov qword ptr [rsp + 0x50], r13
0xdc1c60: mov qword ptr [rsp + 0x58], r13
0xdc1c65: mov r15, qword ptr [r14 + 0x2d8]
0xdc1c6c: mov r12d, dword ptr [r14 + 0x2e0]
0xdc1c73: shl r12, 5
0xdc1c77: add r12, r15
0xdc1c7a: cmp r15, r12
0xdc1c7d: je 0x140dc1da6
0xdc1c83: lea rsi, [r15 + 0x18]
0xdc1c87: vmovss xmm6, dword ptr [rip + 0x4fb40c1]
0xdc1c8f: nop 
0xdc1c90: mov dword ptr [rsp + 0x58], r13d
0xdc1c95: mov edx, dword ptr [rsi]
0xdc1c97: lea rcx, [rsp + 0x50]
0xdc1c9c: call 0x1403d4130
0xdc1ca1: mov eax, dword ptr [rsi]
0xdc1ca3: mov r8d, dword ptr [rsp + 0x58]
0xdc1ca8: test eax, eax
0xdc1caa: je 0x140dc1d43
0xdc1cb0: mov rbx, r13
0xdc1cb3: mov edi, eax
0xdc1cb5: mov r13d, 1
0xdc1cbb: nop dword ptr [rax + rax]
0xdc1cc0: mov rax, qword ptr [rsi - 8]
0xdc1cc4: vmovss xmm0, dword ptr [rax + rbx]
0xdc1cc9: vmovss dword ptr [rsp + 0x150], xmm0
0xdc1cd2: vmovss xmm1, dword ptr [rax + rbx + 8]
0xdc1cd8: vxorps xmm2, xmm1, xmm6
0xdc1cdc: vmovss dword ptr [rsp + 0x154], xmm2
0xdc1ce5: mov eax, dword ptr [rsp + 0x5c]
0xdc1ce9: cmp eax, r8d
0xdc1cec: ja 0x140dc1d16
0xdc1cee: lea edx, [rax*2 + 1]
0xdc1cf5: add edx, eax
0xdc1cf7: shr edx, 1
0xdc1cf9: cmp edx, r13d
0xdc1cfc: cmovb edx, r13d
0xdc1d00: cmp r8d, edx
0xdc1d03: cmova edx, r8d
0xdc1d07: lea rcx, [rsp + 0x50]
0xdc1d0c: call 0x1403d4130
0xdc1d11: mov r8d, dword ptr [rsp + 0x58]
0xdc1d16: mov edx, r8d
0xdc1d19: mov rcx, qword ptr [rsp + 0x150]
0xdc1d21: mov rax, qword ptr [rsp + 0x50]
0xdc1d26: mov qword ptr [rax + rdx*8], rcx
0xdc1d2a: mov r8d, dword ptr [rsp + 0x58]
0xdc1d2f: inc r8d
0xdc1d32: mov dword ptr [rsp + 0x58], r8d
0xdc1d37: add rbx, 0xc
0xdc1d3b: sub rdi, r13
0xdc1d3e: jne 0x140dc1cc0
0xdc1d40: xor r13d, r13d
0xdc1d43: mov rcx, qword ptr [r14 + 0x7c0]
0xdc1d4a: vmovups xmm0, xmmword ptr [r14 + 0x7c8]
0xdc1d53: vmovups xmmword ptr [rsp + 0x60], xmm0
0xdc1d59: lea eax, [r8 - 1]
0xdc1d5d: mov rdx, qword ptr [rsp + 0x50]
0xdc1d62: lea r8, [rdx + rax*8]
0xdc1d66: mov rax, qword ptr [rcx]
0xdc1d69: mov byte ptr [rsp + 0x40], 1
0xdc1d6e: vmovss dword ptr [rsp + 0x38], xmm12
0xdc1d74: vmovss dword ptr [rsp + 0x30], xmm7
0xdc1d7a: vmovss dword ptr [rsp + 0x28], xmm8
0xdc1d80: lea r9, [rsp + 0x60]
0xdc1d85: mov qword ptr [rsp + 0x20], r9
0xdc1d8a: lea r9, [rsp + 0x50]
0xdc1d8f: call qword ptr [rax + 0x398]
0xdc1d95: add r15, 0x20
0xdc1d99: add rsi, 0x20
0xdc1d9d: cmp r15, r12
0xdc1da0: jne 0x140dc1c90
0xdc1da6: mov rcx, qword ptr [rsp + 0x50]
0xdc1dab: test rcx, rcx
0xdc1dae: je 0x140dc1dd5
0xdc1db0: mov r8d, 0x1fd
0xdc1db6: mov rax, qword ptr gs:[0x58]
0xdc1dbf: mov rdx, qword ptr [rax]
0xdc1dc2: cmp byte ptr [r8 + rdx], 0
0xdc1dc7: je 0x140dc1dd0
0xdc1dc9: call 0x1447f03bc
0xdc1dce: jmp 0x140dc1dd5
0xdc1dd0: call 0x1447f02bc
0xdc1dd5: mov qword ptr [rsp + 0x50], r13
0xdc1dda: mov qword ptr [rsp + 0x58], 0
0xdc1de3: vzeroupper 
0xdc1de6: lea r11, [rsp + 0x120]
0xdc1dee: mov rbx, qword ptr [r11 + 0x38]
0xdc1df2: mov rsi, qword ptr [r11 + 0x40]
0xdc1df6: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdc1dfc: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdc1e02: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdc1e08: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdc1e0e: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdc1e14: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdc1e1a: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdc1e20: mov rsp, r11
0xdc1e23: pop r15
0xdc1e25: pop r14
0xdc1e27: pop r13
0xdc1e29: pop r12
0xdc1e2b: pop rdi
0xdc1e2c: ret 