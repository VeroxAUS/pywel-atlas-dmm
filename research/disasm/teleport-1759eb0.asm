0x1759eb0: mov rax, rsp
0x1759eb3: mov qword ptr [rax + 0x10], rbx
0x1759eb7: mov qword ptr [rax + 0x18], rsi
0x1759ebb: mov qword ptr [rax + 0x20], rdi
0x1759ebf: push rbp
0x1759ec0: push r12
0x1759ec2: push r13
0x1759ec4: push r14
0x1759ec6: push r15
0x1759ec8: lea rbp, [rax - 0x128]
0x1759ecf: sub rsp, 0x200
0x1759ed6: vmovaps xmmword ptr [rax - 0x38], xmm6
0x1759edb: vmovaps xmmword ptr [rax - 0x48], xmm7
0x1759ee0: vmovaps xmmword ptr [rax - 0x58], xmm8
0x1759ee5: vmovaps xmmword ptr [rax - 0x68], xmm9
0x1759eea: mov rsi, r9
0x1759eed: mov r13, r8
0x1759ef0: mov r15, rdx
0x1759ef3: mov r12, rcx
0x1759ef6: xor edi, edi
0x1759ef8: mov dword ptr [rsp + 0x40], edi
0x1759efc: mov rax, qword ptr [rcx]
0x1759eff: mov rbx, qword ptr [rax + 8]
0x1759f03: mov qword ptr [rsp + 0x30], rbx
0x1759f08: lea rdx, [rsp + 0x60]
0x1759f0d: mov rcx, rbx
0x1759f10: call 0x1417eea30
0x1759f15: nop 
0x1759f16: mov rax, qword ptr [rsp + 0x68]
0x1759f1b: mov rcx, qword ptr [rax + 0x68]
0x1759f1f: mov r14, qword ptr [rcx + 0x1a8]
0x1759f26: mov qword ptr [rsp + 0x58], r14
0x1759f2b: mov rcx, qword ptr [r14 + 0x28]
0x1759f2f: mov rax, qword ptr [rcx + 0x18]
0x1759f33: cmp qword ptr [rax + 0x10], rdi
0x1759f37: je 0x14175a5d9
0x1759f3d: mov rax, qword ptr [rcx + 8]
0x1759f41: cmp qword ptr [rax + 0x70], rdi
0x1759f45: je 0x14175a5d9
0x1759f4b: mov eax, 0xffffffff
0x1759f50: mov dword ptr [rbp + 0x130], eax
0x1759f56: xor ecx, ecx
0x1759f58: mov edi, ecx
0x1759f5a: cmp dword ptr [rsi + 0x10], ecx
0x1759f5d: jbe 0x141759ff5
0x1759f63: nop dword ptr [rax]
0x1759f67: nop word ptr [rax + rax]
0x1759f70: mov eax, edi
0x1759f72: lea rbx, [rax + rax*2]
0x1759f76: mov r14, qword ptr [rsi + 8]
0x1759f7a: cmp dword ptr [r14 + rbx*8 + 4], -1
0x1759f80: jne 0x141759f87
0x1759f82: mov rax, rcx
0x1759f85: jmp 0x141759fae
0x1759f87: movzx edx, word ptr [r14 + rbx*8]
0x1759f8c: lea rcx, [rip + 0x532cd0d]
0x1759f93: call 0x140585a70
0x1759f98: mov rcx, rax
0x1759f9b: test rax, rax
0x1759f9e: je 0x141759fae
0x1759fa0: mov rax, qword ptr [rax]
0x1759fa3: mov edx, dword ptr [r14 + rbx*8 + 4]
0x1759fa8: call qword ptr [rax + 0x98]
0x1759fae: mov r9, qword ptr [rsi + 8]
0x1759fb2: mov ecx, dword ptr [r9 + rbx*8 + 4]
0x1759fb7: mov dword ptr [rsp + 0x20], ecx
0x1759fbb: movzx r9d, word ptr [r9 + rbx*8]
0x1759fc0: mov r8, r13
0x1759fc3: mov rdx, qword ptr [r12]
0x1759fc7: mov rcx, rax
0x1759fca: call 0x1422d5ec0
0x1759fcf: test al, al
0x1759fd1: je 0x141759fe7
0x1759fd3: inc edi
0x1759fd5: cmp edi, dword ptr [rsi + 0x10]
0x1759fd8: mov ecx, 0
0x1759fdd: jb 0x141759f70
0x1759fdf: mov eax, dword ptr [rbp + 0x130]
0x1759fe5: jmp 0x141759feb
0x1759fe7: mov eax, edi
0x1759fe9: xor ecx, ecx
0x1759feb: mov rbx, qword ptr [rsp + 0x30]
0x1759ff0: mov r14, qword ptr [rsp + 0x58]
0x1759ff5: cmp dword ptr [rsi + 0x10], eax
0x1759ff8: ja 0x14175a002
0x1759ffa: mov dword ptr [r15], ecx
0x1759ffd: jmp 0x14175a5dc
0x175a002: lea r8, [rax + rax*2]
0x175a006: mov rax, qword ptr [rsi + 8]
0x175a00a: mov edx, dword ptr [rax + r8*8 + 0x14]
0x175a00f: movzx r9d, word ptr [rax + r8*8 + 0x10]
0x175a015: mov word ptr [rsp + 0x44], r9w
0x175a01b: mov dword ptr [rsp + 0x48], edx
0x175a01f: mov ecx, 1
0x175a024: mov dword ptr [rsp + 0x40], ecx
0x175a028: lea rax, [r13 + 0x138]
0x175a02f: lea r10, [rsp + 0x44]
0x175a034: mov r11d, 0x329
0x175a03a: cmp rax, r10
0x175a03d: je 0x14175a059
0x175a03f: mov word ptr [rax], r9w
0x175a043: mov dword ptr [rax + 4], edx
0x175a046: mov word ptr [rsp + 0x44], r11w
0x175a04c: mov dword ptr [rsp + 0x48], 0xffffffff
0x175a054: mov edx, 0xffffffff
0x175a059: and ecx, 0xfffffffe
0x175a05c: mov dword ptr [rsp + 0x40], ecx
0x175a060: cmp edx, -1
0x175a063: je 0x14175a073
0x175a065: mov word ptr [rsp + 0x44], r11w
0x175a06b: mov dword ptr [rsp + 0x48], 0xffffffff
0x175a073: mov rax, qword ptr [rsi + 8]
0x175a077: mov edx, dword ptr [rax + r8*8 + 0xc]
0x175a07c: movzx r9d, word ptr [rax + r8*8 + 8]
0x175a082: mov word ptr [rsp + 0x4c], r9w
0x175a088: mov dword ptr [rsp + 0x50], edx
0x175a08c: or ecx, 2
0x175a08f: mov dword ptr [rsp + 0x40], ecx
0x175a093: lea rax, [r13 + 0x140]
0x175a09a: lea r8, [rsp + 0x4c]
0x175a09f: cmp rax, r8
0x175a0a2: je 0x14175a0be
0x175a0a4: mov word ptr [rax], r9w
0x175a0a8: mov dword ptr [rax + 4], edx
0x175a0ab: mov word ptr [rsp + 0x4c], r11w
0x175a0b1: mov dword ptr [rsp + 0x50], 0xffffffff
0x175a0b9: mov edx, 0xffffffff
0x175a0be: and ecx, 0xfffffffd
0x175a0c1: mov dword ptr [rsp + 0x40], ecx
0x175a0c5: cmp edx, -1
0x175a0c8: je 0x14175a0d8
0x175a0ca: mov word ptr [rsp + 0x4c], r11w
0x175a0d0: mov dword ptr [rsp + 0x50], 0xffffffff
0x175a0d8: mov rdx, r13
0x175a0db: mov rcx, qword ptr [r12]
0x175a0df: call 0x142087c00
0x175a0e4: lea rdx, [rbx + 8]
0x175a0e8: test rbx, rbx
0x175a0eb: mov esi, 0
0x175a0f0: cmove rdx, rsi
0x175a0f4: mov r8b, 1
0x175a0f7: mov rdx, qword ptr [rdx]
0x175a0fa: lea rcx, [rsp + 0x30]
0x175a0ff: call 0x140393650
0x175a104: nop 
0x175a105: mov rcx, qword ptr [r12]
0x175a109: mov rax, qword ptr [rcx + 0x18]
0x175a10d: mov qword ptr [rcx + 0x20], rax
0x175a111: mov byte ptr [rcx + 0x30], sil
0x175a115: mov rax, qword ptr [rcx + 0x38]
0x175a119: mov dword ptr [rax + 4], esi
0x175a11c: mov dword ptr [rax + 8], 0xffffffff
0x175a123: mov rbx, qword ptr [rsp + 0x30]
0x175a128: mov rax, qword ptr [rbx]
0x175a12b: xor edx, edx
0x175a12d: mov rcx, rbx
0x175a130: call qword ptr [rax + 0x20]
0x175a133: cmp byte ptr [rsp + 0x38], 1
0x175a138: jne 0x14175a168
0x175a13a: mov eax, 0xffffffff
0x175a13f: lock xadd dword ptr [rbx + 8], eax
0x175a144: cmp eax, 1
0x175a147: jne 0x14175a15b
0x175a149: test dword ptr [rbx + 0xc], 0x40000000
0x175a150: je 0x14175a168
0x175a152: mov rax, qword ptr [rbx]
0x175a155: mov rcx, rbx
0x175a158: call qword ptr [rax + 0x40]
0x175a15b: test dword ptr [rbx + 0xc], 0x40000000
0x175a162: je 0x14175a168
0x175a164: lock dec dword ptr [rbx + 0xc]
0x175a168: mov rax, qword ptr [rsp + 0x68]
0x175a16d: lea rdx, [rax + 8]
0x175a171: test rax, rax
0x175a174: cmove rdx, rsi
0x175a178: mov r8b, 1
0x175a17b: mov rdx, qword ptr [rdx]
0x175a17e: lea rcx, [rsp + 0x30]
0x175a183: call 0x140393650
0x175a188: nop 
0x175a189: mov rax, qword ptr [r14]
0x175a18c: mov dl, 1
0x175a18e: mov rcx, r14
0x175a191: call qword ptr [rax + 0x1c8]
0x175a197: mov rdi, rax
0x175a19a: mov rbx, qword ptr [rsp + 0x30]
0x175a19f: mov rcx, qword ptr [rbx]
0x175a1a2: mov r8, qword ptr [rcx + 0x20]
0x175a1a6: xor edx, edx
0x175a1a8: mov rcx, rbx
0x175a1ab: call r8
0x175a1ae: cmp byte ptr [rsp + 0x38], 1
0x175a1b3: jne 0x14175a1e3
0x175a1b5: mov ecx, 0xffffffff
0x175a1ba: lock xadd dword ptr [rbx + 8], ecx
0x175a1bf: cmp ecx, 1
0x175a1c2: jne 0x14175a1d6
0x175a1c4: test dword ptr [rbx + 0xc], 0x40000000
0x175a1cb: je 0x14175a1e3
0x175a1cd: mov rax, qword ptr [rbx]
0x175a1d0: mov rcx, rbx
0x175a1d3: call qword ptr [rax + 0x40]
0x175a1d6: test dword ptr [rbx + 0xc], 0x40000000
0x175a1dd: je 0x14175a1e3
0x175a1df: lock dec dword ptr [rbx + 0xc]
0x175a1e3: mov dword ptr [rbp - 0x80], esi
0x175a1e6: vxorps xmm6, xmm6, xmm6
0x175a1ea: vmovss dword ptr [rbp - 0x7c], xmm6
0x175a1ef: vmovss dword ptr [rbp - 0x78], xmm6
0x175a1f4: vmovss dword ptr [rbp - 0x74], xmm6
0x175a1f9: mov word ptr [rbp - 0x70], 0x27
0x175a1ff: lea rax, [rbp - 0x80]
0x175a203: mov qword ptr [rsp + 0x28], rax
0x175a208: mov qword ptr [rsp + 0x20], rdi
0x175a20d: mov r9, qword ptr [rsp + 0x68]
0x175a212: mov r8, r13
0x175a215: lea rdx, [rbp + 0x130]
0x175a21c: mov rcx, r12
0x175a21f: call 0x14175a630
0x175a224: mov rax, qword ptr [rsp + 0x68]
0x175a229: lea rdx, [rax + 8]
0x175a22d: test rax, rax
0x175a230: cmove rdx, rsi
0x175a234: mov r8b, 1
0x175a237: mov rdx, qword ptr [rdx]
0x175a23a: lea rcx, [rsp + 0x30]
0x175a23f: call 0x140393650
0x175a244: nop 
0x175a245: mov rax, qword ptr [r14]
0x175a248: mov dl, 1
0x175a24a: mov rcx, r14
0x175a24d: call qword ptr [rax + 0x1b0]
0x175a253: nop 
0x175a254: mov rbx, qword ptr [rsp + 0x30]
0x175a259: mov rax, qword ptr [rbx]
0x175a25c: xor edx, edx
0x175a25e: mov rcx, rbx
0x175a261: call qword ptr [rax + 0x20]
0x175a264: cmp byte ptr [rsp + 0x38], 1
0x175a269: jne 0x14175a299
0x175a26b: mov eax, 0xffffffff
0x175a270: lock xadd dword ptr [rbx + 8], eax
0x175a275: cmp eax, 1
0x175a278: jne 0x14175a28c
0x175a27a: test dword ptr [rbx + 0xc], 0x40000000
0x175a281: je 0x14175a299
0x175a283: mov rax, qword ptr [rbx]
0x175a286: mov rcx, rbx
0x175a289: call qword ptr [rax + 0x40]
0x175a28c: test dword ptr [rbx + 0xc], 0x40000000
0x175a293: je 0x14175a299
0x175a295: lock dec dword ptr [rbx + 0xc]
0x175a299: cmp dword ptr [rbp + 0x130], 0
0x175a2a0: jne 0x14175a5d4
0x175a2a6: cmp dword ptr [rbp - 0x80], 0
0x175a2aa: jne 0x14175a5d4
0x175a2b0: movzx eax, byte ptr [rbp - 0x70]
0x175a2b4: mov byte ptr [rbp + 0x130], al
0x175a2ba: mov byte ptr [rsp + 0x20], 0
0x175a2bf: mov r9, qword ptr [rsp + 0x68]
0x175a2c4: mov r8, r13
0x175a2c7: lea rdx, [rbp + 0x130]
0x175a2ce: mov rcx, qword ptr [r12]
0x175a2d2: call 0x142087000
0x175a2d7: mov qword ptr [rbp - 0x60], rsi
0x175a2db: vmovss dword ptr [rbp - 0x58], xmm6
0x175a2e0: vmovss dword ptr [rbp - 0x54], xmm6
0x175a2e5: vmovss dword ptr [rbp - 0x50], xmm6
0x175a2ea: vmovss dword ptr [rbp - 0x48], xmm6
0x175a2ef: vmovss dword ptr [rbp - 0x44], xmm6
0x175a2f4: vmovss dword ptr [rbp - 0x40], xmm6
0x175a2f9: mov dword ptr [rbp - 0x3c], 0
0x175a300: mov qword ptr [rbp - 0x38], 0xffffffffffffffff
0x175a308: mov rax, qword ptr [rip + 0x3debb89]
0x175a30f: mov qword ptr [rbp - 0x30], rax
0x175a313: mov dword ptr [rbp - 0x28], 0x3f800000
0x175a31a: vmovss dword ptr [rbp - 0x24], xmm6
0x175a31f: vmovdqu xmm0, xmmword ptr [rip + 0x461b279]
0x175a327: vmovups xmmword ptr [rbp - 0x20], xmm0
0x175a32c: vmovss dword ptr [rbp - 0x10], xmm6
0x175a331: vmovss dword ptr [rbp - 0xc], xmm6
0x175a336: mov dword ptr [rbp - 8], 0
0x175a33d: vmovss dword ptr [rbp - 4], xmm6
0x175a342: vmovss dword ptr [rbp], xmm6
0x175a347: vmovss dword ptr [rbp + 4], xmm6
0x175a34c: vmovss xmm0, dword ptr [rip + 0x4618d60]
0x175a354: vmovss dword ptr [rbp + 8], xmm0
0x175a359: vmovss dword ptr [rbp + 0x10], xmm6
0x175a35e: mov dword ptr [rbp + 0x14], esi
0x175a361: vmovss xmm0, dword ptr [rip + 0x461961f]
0x175a369: vmovss dword ptr [rbp + 0x18], xmm0
0x175a36e: vmovss dword ptr [rbp + 0x1c], xmm6
0x175a373: vmovsd xmm0, qword ptr [rip + 0x3debb0d]
0x175a37b: vmovsd qword ptr [rbp + 0x20], xmm0
0x175a380: mov eax, dword ptr [rip + 0x3debb0a]
0x175a386: mov dword ptr [rbp + 0x28], eax
0x175a389: mov qword ptr [rbp + 0x30], 0xffffffffffffffff
0x175a391: vxorpd xmm0, xmm0, xmm0
0x175a395: vmovupd xmmword ptr [rbp + 0x40], xmm0
0x175a39a: mov qword ptr [rbp + 0x50], 0
0x175a3a2: mov dword ptr [rbp + 0x58], esi
0x175a3a5: mov byte ptr [rbp + 0x5c], 0
0x175a3a9: mov rax, qword ptr [rsp + 0x68]
0x175a3ae: mov rcx, qword ptr [rax + 0x68]
0x175a3b2: mov rcx, qword ptr [rcx + 0x1a8]
0x175a3b9: lea r9, [rbp - 0x60]
0x175a3bd: mov r8b, 1
0x175a3c0: vxorpd xmm1, xmm1, xmm1
0x175a3c4: mov rcx, qword ptr [rcx + 0x28]
0x175a3c8: call 0x141f84900
0x175a3cd: vmovdqu xmm0, xmmword ptr [rip + 0x461b60b]
0x175a3d5: vmovups xmmword ptr [rsp + 0x30], xmm0
0x175a3db: lea rcx, [rbp + 0x10]
0x175a3df: call 0x140392dc0
0x175a3e4: vmovaps xmm9, xmm0
0x175a3e8: vmovss xmm1, dword ptr [rbp + 0x18]
0x175a3ed: vxorps xmm7, xmm1, xmmword ptr [rip + 0x461b95b]
0x175a3f5: vmovss xmm2, dword ptr [rbp + 0x10]
0x175a3fa: vxorps xmm8, xmm2, xmmword ptr [rip + 0x461b94e]
0x175a402: vucomiss xmm6, xmm8
0x175a407: jp 0x14175a419
0x175a409: jne 0x14175a419
0x175a40b: vucomiss xmm6, xmm7
0x175a40f: jp 0x14175a419
0x175a411: jne 0x14175a419
0x175a413: vxorps xmm0, xmm0, xmm0
0x175a417: jmp 0x14175a427
0x175a419: vmovaps xmm1, xmm7
0x175a41d: vmovaps xmm0, xmm8
0x175a422: call 0x144898ff2
0x175a427: vxorps xmm3, xmm3, xmm3
0x175a42b: vmovaps xmm2, xmm9
0x175a430: vmovaps xmm1, xmm0
0x175a434: lea rcx, [rsp + 0x30]
0x175a439: call 0x140393a90
0x175a43e: mov eax, esi
0x175a440: cmp qword ptr [rbp + 0x30], -1
0x175a445: cmovne eax, dword ptr [rbp + 0x30]
0x175a449: mov dword ptr [rbp + 0x130], eax
0x175a44f: mov dword ptr [rbp + 0x60], esi
0x175a452: mov rax, qword ptr [rip + 0x3deba3f]
0x175a459: mov qword ptr [rbp + 0x64], rax
0x175a45d: mov dword ptr [rbp + 0x6c], 0x3f800000
0x175a464: vmovups xmm0, xmmword ptr [rip + 0x530b49c]
0x175a46c: vmovups xmmword ptr [rbp + 0x70], xmm0
0x175a471: vmovsd xmm0, qword ptr [rip + 0x3deba0f]
0x175a479: vmovsd qword ptr [rbp + 0x80], xmm0
0x175a481: mov eax, dword ptr [rip + 0x3deba09]
0x175a487: mov dword ptr [rbp + 0x88], eax
0x175a48d: mov byte ptr [rbp + 0x8c], 0
0x175a494: lea rax, [rbp + 0x60]
0x175a498: mov qword ptr [rsp + 0x20], rax
0x175a49d: lea r9, [rsp + 0x30]
0x175a4a2: lea r8, [rbp - 0x58]
0x175a4a6: lea rdx, [rbp + 0x130]
0x175a4ad: lea rcx, [rsp + 0x58]
0x175a4b2: call 0x14219e770
0x175a4b7: cmp dword ptr [rsp + 0x58], 0
0x175a4bc: jne 0x14175a4fe
0x175a4be: mov rax, qword ptr [rsp + 0x68]
0x175a4c3: mov rcx, qword ptr [rax + 0x68]
0x175a4c7: mov rcx, qword ptr [rcx + 0x1a0]
0x175a4ce: vmovups ymm0, ymmword ptr [rbp + 0x60]
0x175a4d3: vmovups ymmword ptr [rbp + 0x90], ymm0
0x175a4db: vmovups xmm1, xmmword ptr [rbp + 0x80]
0x175a4e3: vmovups xmmword ptr [rbp + 0xb0], xmm1
0x175a4eb: mov rax, qword ptr [rcx]
0x175a4ee: lea rdx, [rbp + 0x90]
0x175a4f5: vzeroupper 
0x175a4f8: call qword ptr [rax + 0x1d0]
0x175a4fe: vucomiss xmm6, xmm8
0x175a503: jp 0x14175a515
0x175a505: jne 0x14175a515
0x175a507: vucomiss xmm6, xmm7
0x175a50b: jp 0x14175a515
0x175a50d: jne 0x14175a515
0x175a50f: vxorps xmm7, xmm7, xmm7
0x175a513: jmp 0x14175a527
0x175a515: vmovaps xmm1, xmm7
0x175a519: vmovaps xmm0, xmm8
0x175a51e: call 0x144898ff2
0x175a523: vmovaps xmm7, xmm0
0x175a527: vmovsd xmm1, qword ptr [rbp - 0x58]
0x175a52c: vmovsd qword ptr [rsp + 0x30], xmm1
0x175a532: mov edx, dword ptr [rbp - 0x50]
0x175a535: vmovss xmm4, dword ptr [rbp - 0x58]
0x175a53a: vmovss xmm5, dword ptr [rip + 0x46191b2]
0x175a542: vdivss xmm1, xmm4, xmm5
0x175a546: vcvttss2si eax, xmm1
0x175a54a: vmovd xmm2, edx
0x175a54e: vdivss xmm3, xmm2, xmm5
0x175a552: vcvttss2si ecx, xmm3
0x175a556: mov word ptr [rsp + 0x3c], ax
0x175a55b: mov word ptr [rsp + 0x3e], cx
0x175a560: cwde 
0x175a561: vxorps xmm0, xmm0, xmm0
0x175a565: vcvtsi2ss xmm0, xmm0, eax
0x175a569: vmulss xmm1, xmm0, xmm5
0x175a56d: vsubss xmm2, xmm4, xmm1
0x175a571: vmovss dword ptr [rsp + 0x30], xmm2
0x175a577: vaddss xmm1, xmm6, dword ptr [rsp + 0x34]
0x175a57d: vmovss dword ptr [rsp + 0x34], xmm1
0x175a583: movsx eax, cx
0x175a586: vxorps xmm0, xmm0, xmm0
0x175a58a: vcvtsi2ss xmm0, xmm0, eax
0x175a58e: vmulss xmm2, xmm0, xmm5
0x175a592: vmovd xmm1, edx
0x175a596: vsubss xmm2, xmm1, xmm2
0x175a59a: vmovss dword ptr [rsp + 0x38], xmm2
0x175a5a0: mov rax, qword ptr [rsp + 0x68]
0x175a5a5: mov rcx, qword ptr [rax + 0x68]
0x175a5a9: mov rcx, qword ptr [rcx + 0x1a0]
0x175a5b0: mov rax, qword ptr [rcx]
0x175a5b3: mov byte ptr [rsp + 0x28], 0
0x175a5b8: mov byte ptr [rsp + 0x20], 5
0x175a5bd: mov r9b, 4
0x175a5c0: vmovaps xmm2, xmm7
0x175a5c4: lea rdx, [rsp + 0x30]
0x175a5c9: call qword ptr [rax + 0x198]
0x175a5cf: mov dword ptr [r15], esi
0x175a5d2: jmp 0x14175a5dc
0x175a5d4: mov dword ptr [r15], esi
0x175a5d7: jmp 0x14175a5dc
0x175a5d9: mov dword ptr [r15], edi
0x175a5dc: lea rax, [rip + 0x3fcb865]
0x175a5e3: mov qword ptr [rsp + 0x60], rax
0x175a5e8: lea rcx, [rsp + 0x60]
0x175a5ed: call 0x141434880
0x175a5f2: mov rax, r15
0x175a5f5: lea r11, [rsp + 0x200]
0x175a5fd: mov rbx, qword ptr [r11 + 0x38]
0x175a601: mov rsi, qword ptr [r11 + 0x40]
0x175a605: mov rdi, qword ptr [r11 + 0x48]
0x175a609: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0x175a60f: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0x175a615: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0x175a61b: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0x175a621: mov rsp, r11
0x175a624: pop r15
0x175a626: pop r14
0x175a628: pop r13
0x175a62a: pop r12
0x175a62c: pop rbp
0x175a62d: ret 