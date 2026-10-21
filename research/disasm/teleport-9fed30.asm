0x9fed30: mov qword ptr [rsp + 0x10], rbx
0x9fed35: push rbp
0x9fed36: push rsi
0x9fed37: push rdi
0x9fed38: push r12
0x9fed3a: push r13
0x9fed3c: push r14
0x9fed3e: push r15
0x9fed40: lea rbp, [rsp - 0x180]
0x9fed48: sub rsp, 0x280
0x9fed4f: mov r14, r8
0x9fed52: mov r12, rdx
0x9fed55: mov rsi, rcx
0x9fed58: xor edi, edi
0x9fed5a: mov dword ptr [rsp + 0x70], edi
0x9fed5e: mov rax, qword ptr [rcx + 8]
0x9fed62: mov rcx, qword ptr [rax + 0x68]
0x9fed66: mov byte ptr [rsp + 0x20], 2
0x9fed6b: vxorps xmm3, xmm3, xmm3
0x9fed6f: mov r8b, 1
0x9fed72: lea rdx, [rbp + 0x1c0]
0x9fed79: mov rcx, qword ptr [rcx + 0x70]
0x9fed7d: call 0x1420ad400
0x9fed82: mov ebx, dword ptr [rbp + 0x1c0]
0x9fed88: test ebx, ebx
0x9fed8a: je 0x1409fedd3
0x9fed8c: lea rax, [rip + 0x4bc127d]
0x9fed93: mov qword ptr [rsp + 0x58], rax
0x9fed98: mov dword ptr [rsp + 0x50], 6
0x9feda0: mov dword ptr [rsp + 0x48], ebx
0x9feda4: lea r9, [rip + 0x4b74701]
0x9fedab: mov qword ptr [rsp + 0x40], r9
0x9fedb0: mov dword ptr [rsp + 0x38], edi
0x9fedb4: mov qword ptr [rsp + 0x30], r9
0x9fedb9: mov qword ptr [rsp + 0x28], r9
0x9fedbe: mov qword ptr [rsp + 0x20], r9
0x9fedc3: mov cl, 1
0x9fedc5: call 0x14035d8d0
0x9fedca: mov dword ptr [r12], ebx
0x9fedce: jmp 0x1409ff36d
0x9fedd3: mov rax, qword ptr [rsi + 8]
0x9fedd7: mov rcx, qword ptr [rax + 0x68]
0x9feddb: mov r9b, 1
0x9fedde: xor r8d, r8d
0x9fede1: lea rdx, [rbp + 0x1c0]
0x9fede8: mov rcx, qword ptr [rcx + 0x78]
0x9fedec: call 0x141807090
0x9fedf1: mov ebx, dword ptr [rbp + 0x1c0]
0x9fedf7: test ebx, ebx
0x9fedf9: je 0x1409fee04
0x9fedfb: lea rax, [rip + 0x4bc127e]
0x9fee02: jmp 0x1409fed93
0x9fee04: mov rax, qword ptr [rsi + 8]
0x9fee08: mov rcx, qword ptr [rax + 0x68]
0x9fee0c: mov r13, qword ptr [rcx + 0x40]
0x9fee10: mov r15d, 0xffffffff
0x9fee16: test r13, r13
0x9fee19: je 0x1409ff107
0x9fee1f: lea rdx, [rsp + 0x78]
0x9fee24: mov rcx, qword ptr [r13 + 8]
0x9fee28: call 0x1417ee710
0x9fee2d: nop 
0x9fee2e: mov rax, qword ptr [rbp - 0x80]
0x9fee32: mov rcx, qword ptr [rax + 0x68]
0x9fee36: mov rcx, qword ptr [rcx + 0x58]
0x9fee3a: mov rcx, qword ptr [rcx + 0x48]
0x9fee3e: call 0x141eb1e20
0x9fee43: test al, al
0x9fee45: jne 0x1409ff0f1
0x9fee4b: cmp byte ptr [r14 + 0xe8], al
0x9fee52: je 0x1409ff0f1
0x9fee58: mov rbx, qword ptr [rsi + 8]
0x9fee5c: lea rdx, [rbx + 8]
0x9fee60: test rbx, rbx
0x9fee63: cmove rdx, rdi
0x9fee67: mov rdx, qword ptr [rdx]
0x9fee6a: lea rcx, [rbp + 0x1c0]
0x9fee71: call 0x140393df0
0x9fee76: nop 
0x9fee77: mov rax, qword ptr [rbx]
0x9fee7a: mov dl, 1
0x9fee7c: mov rcx, rbx
0x9fee7f: call qword ptr [rax + 0x188]
0x9fee85: movzx ebx, al
0x9fee88: mov rcx, qword ptr [rbp + 0x1c0]
0x9fee8f: mov rdx, qword ptr [rcx]
0x9fee92: mov r8, qword ptr [rdx + 0x20]
0x9fee96: mov dl, 1
0x9fee98: call r8
0x9fee9b: test bl, bl
0x9fee9d: je 0x1409feeb7
0x9fee9f: mov rax, qword ptr [rsi + 8]
0x9feea3: mov rcx, qword ptr [rax + 0x68]
0x9feea7: lea rdx, [rbp + 0x1c0]
0x9feeae: mov rcx, qword ptr [rcx + 0x58]
0x9feeb2: call 0x14206eed0
0x9feeb7: mov rbx, qword ptr [rbp - 0x80]
0x9feebb: lea rdx, [rbx + 8]
0x9feebf: test rbx, rbx
0x9feec2: cmove rdx, rdi
0x9feec6: mov rdx, qword ptr [rdx]
0x9feec9: lea rcx, [rbp + 0x1c0]
0x9feed0: call 0x140393df0
0x9feed5: nop 
0x9feed6: mov rax, qword ptr [rbx]
0x9feed9: mov dl, 1
0x9feedb: mov rcx, rbx
0x9feede: call qword ptr [rax + 0x188]
0x9feee4: movzx ebx, al
0x9feee7: mov rcx, qword ptr [rbp + 0x1c0]
0x9feeee: mov rdx, qword ptr [rcx]
0x9feef1: mov r8, qword ptr [rdx + 0x20]
0x9feef5: mov dl, 1
0x9feef7: call r8
0x9feefa: test bl, bl
0x9feefc: je 0x1409fef1c
0x9feefe: mov rcx, qword ptr [rbp - 0x80]
0x9fef02: cmp rcx, qword ptr [rsi + 8]
0x9fef06: je 0x1409fef1c
0x9fef08: mov rcx, qword ptr [rcx + 0x68]
0x9fef0c: lea rdx, [rbp + 0x1c0]
0x9fef13: mov rcx, qword ptr [rcx + 0x58]
0x9fef17: call 0x14206eed0
0x9fef1c: mov edx, dword ptr [r14 + 0xec]
0x9fef23: test edx, edx
0x9fef25: jne 0x1409fef34
0x9fef27: cmp dword ptr [r14 + 0xf0], edx
0x9fef2e: je 0x1409ff0f1
0x9fef34: lea rcx, [rbp + 0x90]
0x9fef3b: call 0x141ec99b0
0x9fef40: mov edx, dword ptr [r14 + 0xf0]
0x9fef47: lea rcx, [rbp + 0x108]
0x9fef4e: call 0x141ec99b0
0x9fef53: nop 
0x9fef54: mov r11d, edi
0x9fef57: lea rdx, [rbp + 0x90]
0x9fef5e: nop 
0x9fef60: cmp r11d, 2
0x9fef64: je 0x1409fefae
0x9fef66: mov eax, r11d
0x9fef69: inc r11d
0x9fef6c: imul rcx, rax, 0x78
0x9fef70: lea rax, [rbp - 0x60]
0x9fef74: add rcx, rax
0x9fef77: call 0x141ec9a80
0x9fef7c: add rdx, 0x78
0x9fef80: lea rax, [rbp + 0x180]
0x9fef87: cmp rdx, rax
0x9fef8a: jne 0x1409fef60
0x9fef8c: cmp r11d, 2
0x9fef90: jae 0x1409fefae
0x9fef92: mov eax, r11d
0x9fef95: inc r11d
0x9fef98: imul rcx, rax, 0x78
0x9fef9c: lea rax, [rbp - 0x60]
0x9fefa0: add rcx, rax
0x9fefa3: call 0x141ec98f0
0x9fefa8: cmp r11d, 2
0x9fefac: jb 0x1409fef92
0x9fefae: lea r9, [rip - 0x6a5465]
0x9fefb5: mov edx, 0x78
0x9fefba: mov r8d, 2
0x9fefc0: lea rcx, [rbp + 0x90]
0x9fefc7: call 0x144895764
0x9fefcc: or byte ptr [rbp - 0x10], 1
0x9fefd0: or byte ptr [rbp + 0x68], 1
0x9fefd4: vmovss xmm0, dword ptr [rip + 0x5373d18]
0x9fefdc: vmovss dword ptr [rbp + 8], xmm0
0x9fefe1: vmovss dword ptr [rbp + 0x80], xmm0
0x9fefe9: lea r8, [rbp - 0x60]
0x9fefed: lea rdx, [rbp + 0x1c0]
0x9feff4: mov rcx, r13
0x9feff7: call 0x140863880
0x9feffc: mov ebx, dword ptr [rax]
0x9feffe: test ebx, ebx
0x9ff000: je 0x1409ff0f1
0x9ff006: mov rdi, qword ptr [r13 + 0x50]
0x9ff00a: mov rax, qword ptr [rdi]
0x9ff00d: lea rdx, [rax + 8]
0x9ff011: test rax, rax
0x9ff014: mov eax, 0
0x9ff019: cmove rdx, rax
0x9ff01d: mov rdx, qword ptr [rdx]
0x9ff020: lea rcx, [rbp + 0x1c0]
0x9ff027: call 0x140393df0
0x9ff02c: nop 
0x9ff02d: lea r8, [rbp - 0x60]
0x9ff031: lea rdx, [rbp + 0x1d8]
0x9ff038: mov rcx, rdi
0x9ff03b: call 0x1418309a0
0x9ff040: mov edi, 1
0x9ff045: mov dword ptr [rsp + 0x70], edi
0x9ff049: mov rcx, qword ptr [rbp + 0x1c0]
0x9ff050: mov rax, qword ptr [rcx]
0x9ff053: movzx edx, dil
0x9ff057: call qword ptr [rax + 0x20]
0x9ff05a: lea rax, [rbp + 0x1d8]
0x9ff061: mov qword ptr [rsp + 0x60], rax
0x9ff066: lea rax, [rip + 0x4bc0f33]
0x9ff06d: mov qword ptr [rsp + 0x58], rax
0x9ff072: mov dword ptr [rsp + 0x50], 6
0x9ff07a: mov dword ptr [rsp + 0x48], ebx
0x9ff07e: movzx ecx, dil
0x9ff082: call 0x140609990
0x9ff087: and edi, 0xfffffffe
0x9ff08a: mov dword ptr [rsp + 0x70], edi
0x9ff08e: mov rbx, qword ptr [rbp + 0x1d8]
0x9ff095: lea rdi, [rip + 0x60668a4]
0x9ff09c: cmp rbx, rdi
0x9ff09f: je 0x1409ff0e8
0x9ff0a1: mov eax, dword ptr [rbx + 0x10]
0x9ff0a4: test eax, eax
0x9ff0a6: js 0x1409ff0e8
0x9ff0a8: mov eax, r15d
0x9ff0ab: lock xadd dword ptr [rbx + 0x10], eax
0x9ff0b0: cmp eax, 1
0x9ff0b3: jne 0x1409ff0e8
0x9ff0b5: test rbx, rbx
0x9ff0b8: je 0x1409ff0e8
0x9ff0ba: mov rcx, rbx
0x9ff0bd: call 0x141420360
0x9ff0c2: mov ecx, 0x1fd
0x9ff0c7: mov rax, qword ptr gs:[0x58]
0x9ff0d0: mov rdx, qword ptr [rax]
0x9ff0d3: cmp byte ptr [rcx + rdx], 0
0x9ff0d7: mov rcx, rbx
0x9ff0da: je 0x1409ff0e3
0x9ff0dc: call 0x1447f03bc
0x9ff0e1: jmp 0x1409ff0e8
0x9ff0e3: call 0x1447f02bc
0x9ff0e8: mov qword ptr [rbp + 0x1d8], rdi
0x9ff0ef: xor edi, edi
0x9ff0f1: lea rax, [rip + 0x4d26d50]
0x9ff0f8: mov qword ptr [rsp + 0x78], rax
0x9ff0fd: lea rcx, [rsp + 0x78]
0x9ff102: call 0x141434880
0x9ff107: mov rax, qword ptr [rsi + 8]
0x9ff10b: lea rdx, [rax + 8]
0x9ff10f: test rax, rax
0x9ff112: cmove rdx, rdi
0x9ff116: mov r8b, 1
0x9ff119: mov rdx, qword ptr [rdx]
0x9ff11c: lea rcx, [rsp + 0x78]
0x9ff121: call 0x140393650
0x9ff126: nop 
0x9ff127: mov rdx, r14
0x9ff12a: mov rcx, rsi
0x9ff12d: call 0x1409fe930
0x9ff132: nop 
0x9ff133: mov rbx, qword ptr [rsp + 0x78]
0x9ff138: mov rax, qword ptr [rbx]
0x9ff13b: xor edx, edx
0x9ff13d: mov rcx, rbx
0x9ff140: call qword ptr [rax + 0x20]
0x9ff143: cmp byte ptr [rbp - 0x80], 1
0x9ff147: jne 0x1409ff174
0x9ff149: lock xadd dword ptr [rbx + 8], r15d
0x9ff14f: cmp r15d, 1
0x9ff153: jne 0x1409ff167
0x9ff155: test dword ptr [rbx + 0xc], 0x40000000
0x9ff15c: je 0x1409ff174
0x9ff15e: mov rax, qword ptr [rbx]
0x9ff161: mov rcx, rbx
0x9ff164: call qword ptr [rax + 0x40]
0x9ff167: test dword ptr [rbx + 0xc], 0x40000000
0x9ff16e: je 0x1409ff174
0x9ff170: lock dec dword ptr [rbx + 0xc]
0x9ff174: test r13, r13
0x9ff177: je 0x1409ff369
0x9ff17d: lea rdx, [rsp + 0x78]
0x9ff182: mov rcx, qword ptr [r13 + 8]
0x9ff186: call 0x1417ee710
0x9ff18b: nop 
0x9ff18c: mov rax, qword ptr [rbp - 0x80]
0x9ff190: mov rcx, qword ptr [rax + 0x68]
0x9ff194: mov rcx, qword ptr [rcx + 0x58]
0x9ff198: mov rcx, qword ptr [rcx + 0x48]
0x9ff19c: call 0x141eb1e20
0x9ff1a1: test al, al
0x9ff1a3: jne 0x1409ff28e
0x9ff1a9: cmp byte ptr [r14 + 0xe8], al
0x9ff1b0: je 0x1409ff28e
0x9ff1b6: mov rbx, qword ptr [rsi + 8]
0x9ff1ba: lea rdx, [rbx + 8]
0x9ff1be: test rbx, rbx
0x9ff1c1: cmove rdx, rdi
0x9ff1c5: mov rdx, qword ptr [rdx]
0x9ff1c8: lea rcx, [rbp + 0x1c0]
0x9ff1cf: call 0x140393df0
0x9ff1d4: nop 
0x9ff1d5: mov rax, qword ptr [rbx]
0x9ff1d8: mov dl, 1
0x9ff1da: mov rcx, rbx
0x9ff1dd: call qword ptr [rax + 0x188]
0x9ff1e3: movzx ebx, al
0x9ff1e6: mov rcx, qword ptr [rbp + 0x1c0]
0x9ff1ed: mov rdx, qword ptr [rcx]
0x9ff1f0: mov r8, qword ptr [rdx + 0x20]
0x9ff1f4: mov dl, 1
0x9ff1f6: call r8
0x9ff1f9: test bl, bl
0x9ff1fb: je 0x1409ff21f
0x9ff1fd: mov rcx, qword ptr [rsi + 8]
0x9ff201: mov rax, qword ptr [rcx]
0x9ff204: call qword ptr [rax + 0x178]
0x9ff20a: test al, al
0x9ff20c: jne 0x1409ff21f
0x9ff20e: mov rax, qword ptr [rsi + 8]
0x9ff212: mov rcx, qword ptr [rax + 0x68]
0x9ff216: mov rcx, qword ptr [rcx + 0x58]
0x9ff21a: call 0x14206ec90
0x9ff21f: mov rbx, qword ptr [rbp - 0x80]
0x9ff223: lea rdx, [rbx + 8]
0x9ff227: test rbx, rbx
0x9ff22a: cmove rdx, rdi
0x9ff22e: mov rdx, qword ptr [rdx]
0x9ff231: lea rcx, [rbp + 0x1c0]
0x9ff238: call 0x140393df0
0x9ff23d: nop 
0x9ff23e: mov rax, qword ptr [rbx]
0x9ff241: mov dl, 1
0x9ff243: mov rcx, rbx
0x9ff246: call qword ptr [rax + 0x188]
0x9ff24c: movzx ebx, al
0x9ff24f: mov rcx, qword ptr [rbp + 0x1c0]
0x9ff256: mov rdx, qword ptr [rcx]
0x9ff259: mov r8, qword ptr [rdx + 0x20]
0x9ff25d: mov dl, 1
0x9ff25f: call r8
0x9ff262: test bl, bl
0x9ff264: je 0x1409ff28e
0x9ff266: mov rcx, qword ptr [rbp - 0x80]
0x9ff26a: cmp rcx, qword ptr [rsi + 8]
0x9ff26e: je 0x1409ff292
0x9ff270: mov rax, qword ptr [rcx]
0x9ff273: call qword ptr [rax + 0x178]
0x9ff279: test al, al
0x9ff27b: jne 0x1409ff28e
0x9ff27d: mov rax, qword ptr [rbp - 0x80]
0x9ff281: mov rcx, qword ptr [rax + 0x68]
0x9ff285: mov rcx, qword ptr [rcx + 0x58]
0x9ff289: call 0x14206ec90
0x9ff28e: mov rcx, qword ptr [rbp - 0x80]
0x9ff292: cmp byte ptr [r14 + 0xf4], 0
0x9ff29a: je 0x1409ff353
0x9ff2a0: mov rax, qword ptr [rcx + 0x68]
0x9ff2a4: mov rdi, qword ptr [rax + 0x58]
0x9ff2a8: xor sil, sil
0x9ff2ab: xor bl, bl
0x9ff2ad: mov rax, qword ptr [rdi + 8]
0x9ff2b1: lea rdx, [rax + 8]
0x9ff2b5: test rax, rax
0x9ff2b8: mov eax, 0
0x9ff2bd: cmove rdx, rax
0x9ff2c1: mov rdx, qword ptr [rdx]
0x9ff2c4: lea rcx, [rbp + 0x1c0]
0x9ff2cb: call 0x140393df0
0x9ff2d0: nop 
0x9ff2d1: mov rax, qword ptr [rdi + 0x48]
0x9ff2d5: mov rax, qword ptr [rax + 0x18]
0x9ff2d9: test rax, rax
0x9ff2dc: je 0x1409ff2f0
0x9ff2de: cmp dword ptr [rax + 0x68], 0
0x9ff2e2: setne sil
0x9ff2e6: movzx ebx, byte ptr [rax + 0x20]
0x9ff2ea: shr bl, 2
0x9ff2ed: and bl, 1
0x9ff2f0: mov rcx, qword ptr [rbp + 0x1c0]
0x9ff2f7: mov rax, qword ptr [rcx]
0x9ff2fa: mov dl, 1
0x9ff2fc: call qword ptr [rax + 0x20]
0x9ff2ff: test sil, sil
0x9ff302: je 0x1409ff346
0x9ff304: test bl, bl
0x9ff306: je 0x1409ff346
0x9ff308: vxorpd xmm0, xmm0, xmm0
0x9ff30c: vmovsd qword ptr [rbp + 0x1c0], xmm0
0x9ff314: mov rax, qword ptr [rdi + 8]
0x9ff318: mov rdx, qword ptr [rax + 0x68]
0x9ff31c: mov rcx, qword ptr [rdx + 0x1a8]
0x9ff323: lea rax, [rbp + 0x1c0]
0x9ff32a: mov qword ptr [rsp + 0x20], rax
0x9ff32f: xor r9d, r9d
0x9ff332: vmovss xmm2, dword ptr [rip + 0x5374512]
0x9ff33a: mov rdx, r14
0x9ff33d: mov rcx, qword ptr [rcx + 0x28]
0x9ff341: call 0x141f965f0
0x9ff346: mov dl, 1
0x9ff348: mov rcx, qword ptr [rdi + 0x60]
0x9ff34c: call 0x14181aba0
0x9ff351: xor edi, edi
0x9ff353: lea rax, [rip + 0x4d26aee]
0x9ff35a: mov qword ptr [rsp + 0x78], rax
0x9ff35f: lea rcx, [rsp + 0x78]
0x9ff364: call 0x141434880
0x9ff369: mov dword ptr [r12], edi
0x9ff36d: mov rax, r12
0x9ff370: mov rbx, qword ptr [rsp + 0x2c8]
0x9ff378: add rsp, 0x280
0x9ff37f: pop r15
0x9ff381: pop r14
0x9ff383: pop r13
0x9ff385: pop r12
0x9ff387: pop rdi
0x9ff388: pop rsi
0x9ff389: pop rbp
0x9ff38a: ret 