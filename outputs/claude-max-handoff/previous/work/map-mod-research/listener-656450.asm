0x656450: mov qword ptr [rsp + 0x20], rbx
0x656455: mov qword ptr [rsp + 0x18], r8
0x65645a: mov qword ptr [rsp + 0x10], rdx
0x65645f: mov qword ptr [rsp + 8], rcx
0x656464: push rbp
0x656465: push rsi
0x656466: push rdi
0x656467: push r12
0x656469: push r13
0x65646b: push r14
0x65646d: push r15
0x65646f: lea rbp, [rsp - 0x670]
0x656477: sub rsp, 0x770
0x65647e: mov rbx, r9
0x656481: mov r14, r8
0x656484: xor r15d, r15d
0x656487: mov dword ptr [rsp + 0x20], r15d
0x65648c: lea rax, [rip + 0x50cf9b5]
0x656493: mov qword ptr [rbp - 0x58], rax
0x656497: mov qword ptr [rbp - 0x50], r15
0x65649b: mov word ptr [rbp - 0x48], r15w
0x6564a0: mov qword ptr [rbp - 0x40], r15
0x6564a4: lea r12, [rip + 0x4f1d5dd]
0x6564ab: mov qword ptr [rbp - 0x58], r12
0x6564af: lea r13, [rip + 0x4f1d592]
0x6564b6: mov qword ptr [rbp - 0x58], r13
0x6564ba: mov rax, qword ptr [rip + 0x6712ccf]
0x6564c1: mov rcx, qword ptr [rax + 0x30]
0x6564c5: mov rdi, qword ptr [rcx + 0x50]
0x6564c9: test rdi, rdi
0x6564cc: je 0x1406564ee
0x6564ce: mov edx, 4
0x6564d3: mov r8d, 0x10
0x6564d9: mov rax, qword ptr [rdi]
0x6564dc: mov rcx, rdi
0x6564df: call qword ptr [rax + 0xc0]
0x6564e5: test al, al
0x6564e7: je 0x1406564ee
0x6564e9: mov sil, 1
0x6564ec: jmp 0x1406564f1
0x6564ee: xor sil, sil
0x6564f1: lea rax, [rip + 0x50cf950]
0x6564f8: mov qword ptr [rsp + 0x30], rax
0x6564fd: mov qword ptr [rsp + 0x38], rdi
0x656502: mov byte ptr [rsp + 0x40], sil
0x656507: mov byte ptr [rsp + 0x41], 0
0x65650c: mov qword ptr [rsp + 0x48], r15
0x656511: mov qword ptr [rsp + 0x30], r12
0x656516: mov qword ptr [rsp + 0x30], r13
0x65651b: mov dword ptr [rsp + 0x20], 2
0x656523: mov rax, qword ptr [rbp - 0x58]
0x656527: mov rdx, qword ptr [rax + 0x10]
0x65652b: lea rax, [rip + 0xdde33e]
0x656532: lea rcx, [rbp - 0x58]
0x656536: cmp rdx, rax
0x656539: jne 0x140656542
0x65653b: call 0x141434880
0x656540: jmp 0x140656544
0x656542: call rdx
0x656544: mov qword ptr [rbp - 0x40], r15
0x656548: mov qword ptr [rbp - 0x50], rdi
0x65654c: mov byte ptr [rbp - 0x48], sil
0x656550: mov qword ptr [rsp + 0x38], r15
0x656555: mov byte ptr [rsp + 0x40], 0
0x65655a: mov eax, 2
0x65655f: and eax, 0xfffffffd
0x656562: mov dword ptr [rsp + 0x50], eax
0x656566: mov dword ptr [rsp + 0x20], eax
0x65656a: lea rax, [rip + 0x50cf8d7]
0x656571: mov qword ptr [rsp + 0x30], rax
0x656576: cmp byte ptr [rbp - 0x48], 0
0x65657a: jne 0x140656584
0x65657c: xor dil, dil
0x65657f: jmp 0x1406570db
0x656584: mov rsi, qword ptr [rbp - 0x50]
0x656588: mov qword ptr [rbp - 0x18], rsi
0x65658c: mov qword ptr [rbp - 0x78], rax
0x656590: mov qword ptr [rbp - 0x70], r15
0x656594: mov word ptr [rbp - 0x68], 0
0x65659a: mov qword ptr [rbp - 0x60], r15
0x65659e: mov qword ptr [rbp - 0x78], r12
0x6565a2: mov qword ptr [rbp - 0x78], r13
0x6565a6: test r14, r14
0x6565a9: jne 0x140656636
0x6565af: lea rdx, [rsp + 0x30]
0x6565b4: mov rcx, qword ptr [rip + 0x6712bd5]
0x6565bb: mov rcx, qword ptr [rcx + 0x30]
0x6565bf: call 0x1408b4570
0x6565c4: mov rdi, rax
0x6565c7: mov rcx, qword ptr [rbp - 0x78]
0x6565cb: mov rax, qword ptr [rcx + 0x10]
0x6565cf: lea rcx, [rip + 0xdde29a]
0x6565d6: cmp rax, rcx
0x6565d9: lea rcx, [rbp - 0x78]
0x6565dd: jne 0x1406565e6
0x6565df: call 0x141434880
0x6565e4: jmp 0x1406565e8
0x6565e6: call rax
0x6565e8: mov rax, qword ptr [rdi + 0x18]
0x6565ec: mov qword ptr [rbp - 0x60], rax
0x6565f0: mov rax, qword ptr [rdi + 8]
0x6565f4: mov qword ptr [rbp - 0x70], rax
0x6565f8: movzx eax, byte ptr [rdi + 0x10]
0x6565fc: mov byte ptr [rbp - 0x68], al
0x6565ff: mov qword ptr [rdi + 8], r15
0x656603: mov byte ptr [rdi + 0x10], 0
0x656607: lea rax, [rip + 0x50cf83a]
0x65660e: mov qword ptr [rsp + 0x30], rax
0x656613: lea rcx, [rsp + 0x30]
0x656618: call 0x141434880
0x65661d: cmp byte ptr [rbp - 0x68], 0
0x656621: jne 0x14065662b
0x656623: xor dil, dil
0x656626: jmp 0x1406570c0
0x65662b: mov r14, qword ptr [rbp - 0x70]
0x65662f: mov qword ptr [rbp + 0x6c0], r14
0x656636: lea rdx, [rbp]
0x65663a: mov rcx, r14
0x65663d: call 0x1417fa6c0
0x656642: nop 
0x656643: cmp byte ptr [rbp + 0x10], 0
0x656647: jne 0x140656651
0x656649: xor dil, dil
0x65664c: jmp 0x140657081
0x656651: mov qword ptr [rsp + 0x30], r15
0x656656: mov qword ptr [rsp + 0x38], r15
0x65665b: mov dword ptr [rsp + 0x40], r15d
0x656660: mov byte ptr [rsp + 0x44], 0
0x656665: mov eax, 0xc
0x65666a: mov word ptr [rsp + 0x46], ax
0x65666f: mov qword ptr [rsp + 0x48], r15
0x656674: mov rcx, qword ptr [rsi + 0x68]
0x656678: lea rdx, [rsp + 0x30]
0x65667d: mov rcx, qword ptr [rcx + 0x1a0]
0x656684: call 0x1421a1da0
0x656689: mov eax, dword ptr [rsp + 0x30]
0x65668d: lea rcx, [rax + rax*2]
0x656691: mov eax, dword ptr [rsp + 0x34]
0x656695: lea rcx, [rax + rcx*8]
0x656699: imul rdx, rcx, 0x3c
0x65669d: mov eax, dword ptr [rsp + 0x38]
0x6566a1: add rdx, rax
0x6566a4: imul rcx, rdx, 0x3c
0x6566a8: mov eax, dword ptr [rsp + 0x3c]
0x6566ac: add rcx, rax
0x6566af: mov qword ptr [rbp - 0x28], rcx
0x6566b3: mov qword ptr [rbp - 0x20], rcx
0x6566b7: mov rcx, rbx
0x6566ba: call 0x140430280
0x6566bf: mov esi, 0xffff
0x6566c4: cmp word ptr [rax + 0x1d0], si
0x6566cb: je 0x1406566dc
0x6566cd: mov rcx, rbx
0x6566d0: call 0x140430280
0x6566d5: lea rbx, [rax + 0x1d0]
0x6566dc: movzx eax, word ptr [rbx]
0x6566df: mov word ptr [rbp + 0x6b8], ax
0x6566e6: lea rcx, [rsp + 0x78]
0x6566eb: mov qword ptr [rsp + 0x68], rcx
0x6566f0: mov dword ptr [rsp + 0x70], r15d
0x6566f5: mov dword ptr [rsp + 0x74], 8
0x6566fd: mov edx, dword ptr [rsp + 0x70]
0x656701: mov rcx, qword ptr [rsp + 0x68]
0x656706: mov word ptr [rcx + rdx*2], ax
0x65670a: inc dword ptr [rsp + 0x70]
0x65670e: lea rcx, [rbp + 0x6b8]
0x656715: call 0x140430280
0x65671a: cmp dword ptr [rax + 0x1e0], 0
0x656721: je 0x140656782
0x656723: lea rcx, [rbp + 0x6b8]
0x65672a: call 0x140430280
0x65672f: mov rdi, qword ptr [rax + 0x1d8]
0x656736: mov ebx, dword ptr [rax + 0x1e0]
0x65673c: mov eax, dword ptr [rsp + 0x74]
0x656740: mov ecx, dword ptr [rsp + 0x70]
0x656744: sub eax, ecx
0x656746: cmp ebx, eax
0x656748: jbe 0x140656767
0x65674a: lea r8d, [rcx + rbx]
0x65674e: mov r9d, 2
0x656754: lea rdx, [rsp + 0x78]
0x656759: lea rcx, [rsp + 0x68]
0x65675e: call 0x140392380
0x656763: mov ecx, dword ptr [rsp + 0x70]
0x656767: mov r8, rbx
0x65676a: add r8, r8
0x65676d: mov rax, qword ptr [rsp + 0x68]
0x656772: lea rcx, [rax + rcx*2]
0x656776: mov rdx, rdi
0x656779: call 0x144898e1e
0x65677e: add dword ptr [rsp + 0x70], ebx
0x656782: mov rcx, qword ptr [rbp + 8]
0x656786: mov rax, qword ptr [rcx]
0x656789: call qword ptr [rax + 0x40]
0x65678c: mov rcx, rax
0x65678f: mov qword ptr [rbp - 0x38], rax
0x656793: xor dil, dil
0x656796: mov byte ptr [rbp + 0x6b8], dil
0x65679d: mov qword ptr [rbp + 0x4d8], r15
0x6567a4: mov qword ptr [rbp + 0x4e0], 0x105
0x6567af: mov dword ptr [rbp + 0x4e4], r15d
0x6567b6: mov byte ptr [rbp + 0x3d0], dil
0x6567bd: mov dword ptr [rbp + 0x4e4], r15d
0x6567c4: mov byte ptr [rbp + 0x3d0], dil
0x6567cb: mov rax, qword ptr [rbp + 0x4d8]
0x6567d2: test rax, rax
0x6567d5: je 0x1406567da
0x6567d7: mov byte ptr [rax], dil
0x6567da: lea r12, [rbp + 0x3d0]
0x6567e1: cmp qword ptr [rbp + 0x6d0], 0
0x6567e9: cmove r12, r15
0x6567ed: mov r13, qword ptr [rsp + 0x68]
0x6567f2: mov qword ptr [rsp + 0x60], r13
0x6567f7: mov eax, dword ptr [rsp + 0x70]
0x6567fb: lea rax, [rax*2]
0x656803: add rax, r13
0x656806: mov qword ptr [rbp - 0x10], rax
0x65680a: cmp r13, rax
0x65680d: je 0x140656eae
0x656813: lea r15, [rcx + 8]
0x656817: test rcx, rcx
0x65681a: mov eax, 0
0x65681f: cmove r15, rax
0x656823: mov qword ptr [rbp - 8], r15
0x656827: test r12, r12
0x65682a: je 0x140656849
0x65682c: mov dword ptr [r12 + 0x114], eax
0x656834: mov byte ptr [r12], 0
0x656839: mov rax, qword ptr [r12 + 0x108]
0x656841: test rax, rax
0x656844: je 0x140656849
0x656846: mov byte ptr [rax], 0
0x656849: mov dil, 4
0x65684c: mov dword ptr [rsp + 0x24], 0xffffffff
0x656854: mov ebx, 0xffffffff
0x656859: mov dword ptr [rsp + 0x54], ebx
0x65685d: mov word ptr [rbp + 0x6b0], si
0x656864: mov rcx, r13
0x656867: call 0x140430280
0x65686c: mov r14, rax
0x65686f: lea rsi, [rax + 0x48]
0x656873: cmp dword ptr [rsi + 8], 0
0x656877: jne 0x1406568a5
0x656879: lea rcx, [rax + 0x188]
0x656880: mov eax, 0xffff
0x656885: cmp word ptr [rcx], ax
0x656888: je 0x140656895
0x65688a: call 0x140430280
0x65688f: cmp dword ptr [rax + 0x50], 0
0x656893: jne 0x1406568a5
0x656895: lea rcx, [r14 + 0x14]
0x656899: call 0x1405c15a0
0x65689e: lea rsi, [rax + 0x90]
0x6568a5: mov rdx, qword ptr [r15]
0x6568a8: lea rcx, [rbp - 0x30]
0x6568ac: call 0x140393df0
0x6568b1: nop 
0x6568b2: movzx edx, word ptr [r13]
0x6568b7: mov r14, qword ptr [rbp - 0x38]
0x6568bb: mov rcx, r14
0x6568be: call 0x141abf910
0x6568c3: mov r15, rax
0x6568c6: mov qword ptr [rsp + 0x28], rax
0x6568cb: lea r9, [rbp + 0x6b0]
0x6568d2: lea r8, [rsp + 0x24]
0x6568d7: movzx edx, word ptr [r13]
0x6568dc: mov rcx, r14
0x6568df: call 0x141ac0110
0x6568e4: cmp dword ptr [rsp + 0x24], -1
0x6568e9: setne r13b
0x6568ed: je 0x140656914
0x6568ef: mov r8, qword ptr [rsp + 0x60]
0x6568f4: lea rdx, [rbp + 0x30]
0x6568f8: mov rcx, r14
0x6568fb: call 0x141ac02a0
0x656900: vmovups ymm0, ymmword ptr [rax]
0x656904: vmovups ymmword ptr [rbp + 0x30], ymm0
0x656909: vpextrd dword ptr [rsp + 0x54], xmm0, 1
0x656911: mov ebx, dword ptr [rbp + 0x30]
0x656914: mov rcx, qword ptr [rsp + 0x60]
0x656919: vzeroupper 
0x65691c: call 0x140430280
0x656921: cmp dword ptr [r14 + 0x6c], 0
0x656926: je 0x140656974
0x656928: mov r10d, dword ptr [rax]
0x65692b: mov ecx, dword ptr [r14 + 0x68]
0x65692f: test ecx, ecx
0x656931: je 0x140656974
0x656933: xor edx, edx
0x656935: mov eax, r10d
0x656938: div ecx
0x65693a: mov r8d, edx
0x65693d: shl r8, 8
0x656941: add r8, qword ptr [r14 + 0x78]
0x656945: xor edx, edx
0x656947: mov r11d, dword ptr [r8]
0x65694a: test r11d, r11d
0x65694d: je 0x140656974
0x65694f: nop 
0x656950: cmp dword ptr [r8 + rdx*8 + 8], r10d
0x656955: jne 0x14065696d
0x656957: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0x65695c: mov rax, qword ptr [r14 + 0x80]
0x656963: mov r9, qword ptr [rax + rcx*8]
0x656967: cmp dword ptr [r9 + 4], r10d
0x65696b: je 0x1406569bb
0x65696d: inc edx
0x65696f: cmp edx, r11d
0x656972: jb 0x140656950
0x656974: mov r14d, 0xffffffff
0x65697a: mov dword ptr [rsp + 0x58], r14d
0x65697f: mov rcx, qword ptr [rbp - 0x30]
0x656983: mov rax, qword ptr [rcx]
0x656986: mov dl, 1
0x656988: call qword ptr [rax + 0x20]
0x65698b: test r15, r15
0x65698e: je 0x1406569ca
0x656990: cmp r15, qword ptr [rbp - 0x28]
0x656994: jbe 0x1406569ca
0x656996: mov rbx, qword ptr [rbp + 0x6d0]
0x65699d: test rbx, rbx
0x6569a0: je 0x1406569b3
0x6569a2: mov r9, r12
0x6569a5: lea r8, [rbp - 0x20]
0x6569a9: lea rdx, [rsp + 0x28]
0x6569ae: call 0x140657cf0
0x6569b3: mov dil, 3
0x6569b6: jmp 0x140657017
0x6569bb: add r9, 8
0x6569bf: je 0x140656974
0x6569c1: mov r14d, dword ptr [r9 + 0xa4]
0x6569c8: jmp 0x14065697a
0x6569ca: mov edx, dword ptr [rsi + 8]
0x6569cd: xor r15d, r15d
0x6569d0: test edx, edx
0x6569d2: je 0x140656bd5
0x6569d8: mov rax, qword ptr [rbp + 0x6c0]
0x6569df: mov rax, qword ptr [rax + 0x68]
0x6569e3: mov r8, qword ptr [rax + 0x20]
0x6569e7: mov ecx, r15d
0x6569ea: movzx r8d, word ptr [r8 + 0x30]
0x6569ef: mov r9, qword ptr [rsi]
0x6569f2: mov eax, ecx
0x6569f4: cmp r8w, word ptr [r9 + rax*2]
0x6569f9: je 0x140656bd5
0x6569ff: inc ecx
0x656a01: cmp ecx, edx
0x656a03: jb 0x1406569f2
0x656a05: mov rbx, qword ptr [rbp + 0x6d0]
0x656a0c: test rbx, rbx
0x656a0f: je 0x140656bcd
0x656a15: mov qword ptr [rbp + 0x158], r15
0x656a1c: mov qword ptr [rbp + 0x160], 0x105
0x656a27: mov dword ptr [rbp + 0x164], r15d
0x656a2e: mov byte ptr [rbp + 0x50], 0
0x656a32: mov dword ptr [rbp + 0x164], r15d
0x656a39: mov byte ptr [rbp + 0x50], 0
0x656a3d: mov rax, qword ptr [rbp + 0x158]
0x656a44: test rax, rax
0x656a47: je 0x140656a4c
0x656a49: mov byte ptr [rax], 0
0x656a4c: mov rbx, qword ptr [rsi]
0x656a4f: mov eax, dword ptr [rsi + 8]
0x656a52: lea rdi, [rbx + rax*2]
0x656a56: cmp rbx, rdi
0x656a59: je 0x140656b1a
0x656a5f: nop 
0x656a60: movzx eax, word ptr [rbx]
0x656a63: mov word ptr [rbp + 0x6b0], ax
0x656a6a: mov eax, dword ptr [rbp + 0x164]
0x656a70: cmp eax, -1
0x656a73: jne 0x140656a9f
0x656a75: lea rcx, [rbp + 0x50]
0x656a79: mov rax, qword ptr [rbp + 0x158]
0x656a80: test rax, rax
0x656a83: cmovne rcx, rax
0x656a87: mov rax, 0xffffffffffffffff
0x656a8e: nop 
0x656a90: inc rax
0x656a93: cmp byte ptr [rcx + rax], 0
0x656a97: jne 0x140656a90
0x656a99: mov dword ptr [rbp + 0x164], eax
0x656a9f: test eax, eax
0x656aa1: je 0x140656ab9
0x656aa3: mov r8d, 2
0x656aa9: lea rdx, [rip + 0x4f2bb90]
0x656ab0: lea rcx, [rbp + 0x50]
0x656ab4: call 0x140393f50
0x656ab9: lea rcx, [rbp + 0x6b0]
0x656ac0: call 0x140389570
0x656ac5: mov rcx, qword ptr [rax + 0x18]
0x656ac9: mov rax, qword ptr [rcx]
0x656acc: xor edx, edx
0x656ace: call qword ptr [rax + 8]
0x656ad1: mov qword ptr [rbp + 0x6b0], rax
0x656ad8: mov dword ptr [rbp + 0x164], 0xffffffff
0x656ae2: lea rcx, [rbp + 0x50]
0x656ae6: mov rax, qword ptr [rbp + 0x158]
0x656aed: test rax, rax
0x656af0: cmovne rcx, rax
0x656af4: lea r9, [rbp + 0x6b0]
0x656afb: lea r8, [rip + 0x4f2048e]
0x656b02: mov edx, dword ptr [rbp + 0x160]
0x656b08: call 0x14035ee40
0x656b0d: add rbx, 2
0x656b11: cmp rbx, rdi
0x656b14: jne 0x140656a60
0x656b1a: lea rcx, [rbp + 0x50]
0x656b1e: mov rax, qword ptr [rbp + 0x158]
0x656b25: test rax, rax
0x656b28: cmovne rcx, rax
0x656b2c: mov qword ptr [rsp + 0x28], rcx
0x656b31: mov rax, qword ptr gs:[0x58]
0x656b3a: mov rcx, qword ptr [rax]
0x656b3d: mov eax, 0x1ec
0x656b42: mov rdx, qword ptr [rip + 0x67129df]
0x656b49: cmp byte ptr [rax + rcx], 0
0x656b4d: cmovne rdx, qword ptr [rip + 0x67129db]
0x656b55: mov rax, qword ptr [rdx]
0x656b58: mov rcx, qword ptr [rax + 8]
0x656b5c: mov rax, qword ptr [rcx + 0x1c0]
0x656b63: movzx ecx, word ptr [rax + 0xa8]
0x656b6a: mov word ptr [rbp + 0x6b0], cx
0x656b71: lea rcx, [rbp + 0x6b0]
0x656b78: call 0x140389080
0x656b7d: mov rcx, qword ptr [rax + 0x18]
0x656b81: mov rax, qword ptr [rcx]
0x656b84: xor edx, edx
0x656b86: call qword ptr [rax + 8]
0x656b89: mov dword ptr [r12 + 0x114], 0xffffffff
0x656b95: mov r8, qword ptr [r12 + 0x108]
0x656b9d: mov rcx, r12
0x656ba0: test r8, r8
0x656ba3: cmovne rcx, r8
0x656ba7: lea r9, [rsp + 0x28]
0x656bac: mov r8, rax
0x656baf: mov edx, dword ptr [r12 + 0x110]
0x656bb7: call 0x14035ee40
0x656bbc: nop 
0x656bbd: lea rcx, [rbp + 0x50]
0x656bc1: call 0x140394170
0x656bc6: mov rbx, qword ptr [rbp + 0x6d0]
0x656bcd: mov dil, 2
0x656bd0: jmp 0x140657017
0x656bd5: cmp r14d, -1
0x656bd9: je 0x140656bf0
0x656bdb: mov r8, r12
0x656bde: lea rdx, [rsp + 0x58]
0x656be3: call 0x1406572d0
0x656be8: movzx edi, al
0x656beb: jmp 0x140656e7c
0x656bf0: test r13b, r13b
0x656bf3: je 0x140656e86
0x656bf9: mov r13d, 0xffff
0x656bff: cmp r13w, word ptr [rbp + 0x6b0]
0x656c07: je 0x140656e4f
0x656c0d: mov r14, qword ptr [rbp - 0x18]
0x656c11: lea rdx, [r14 + 8]
0x656c15: test r14, r14
0x656c18: cmove rdx, r15
0x656c1c: mov rdx, qword ptr [rdx]
0x656c1f: lea rcx, [rsp + 0x30]
0x656c24: call 0x140393df0
0x656c29: nop 
0x656c2a: mov qword ptr [rsp + 0x38], r14
0x656c2f: mov esi, dword ptr [rsp + 0x50]
0x656c33: or esi, 4
0x656c36: mov dword ptr [rsp + 0x20], esi
0x656c3a: lea rcx, [rbp + 0x6b0]
0x656c41: call 0x140389570
0x656c46: mov rcx, qword ptr [r14 + 0x68]
0x656c4a: mov edx, dword ptr [rax]
0x656c4c: mov rcx, qword ptr [rcx + 0x110]
0x656c53: call 0x14214e7a0
0x656c58: mov rdx, rax
0x656c5b: lea rcx, [rbp + 0x4f0]
0x656c62: call 0x142155d70
0x656c67: nop 
0x656c68: and esi, 0xfffffffb
0x656c6b: mov dword ptr [rsp + 0x50], esi
0x656c6f: mov dword ptr [rsp + 0x20], esi
0x656c73: mov rcx, qword ptr [rsp + 0x30]
0x656c78: mov rax, qword ptr [rcx]
0x656c7b: mov dl, 1
0x656c7d: call qword ptr [rax + 0x20]
0x656c80: mov rcx, qword ptr [r14 + 0x68]
0x656c84: mov rdx, qword ptr [rbp + 0x518]
0x656c8b: mov rcx, qword ptr [rcx + 0x110]
0x656c92: call 0x14214d130
0x656c97: cmp al, 3
0x656c99: jne 0x140656e3d
0x656c9f: cmp qword ptr [rbp + 0x6d0], 0
0x656ca7: je 0x140656e3a
0x656cad: mov qword ptr [rbp + 0x298], r15
0x656cb4: mov qword ptr [rbp + 0x2a0], 0x105
0x656cbf: mov dword ptr [rbp + 0x2a4], r15d
0x656cc6: mov byte ptr [rbp + 0x190], 0
0x656ccd: mov dword ptr [rbp + 0x2a4], r15d
0x656cd4: mov byte ptr [rbp + 0x190], 0
0x656cdb: mov rax, qword ptr [rbp + 0x298]
0x656ce2: test rax, rax
0x656ce5: je 0x140656cea
0x656ce7: mov byte ptr [rax], 0
0x656cea: movzx eax, word ptr [rbp + 0x568]
0x656cf1: mov word ptr [rbp + 0x6b0], ax
0x656cf8: lea rcx, [rip + 0x4f3a001]
0x656cff: mov qword ptr [rsp + 0x58], rcx
0x656d04: cmp ax, r13w
0x656d08: je 0x140656d52
0x656d0a: lea rcx, [rbp + 0x6b0]
0x656d11: call 0x140430020
0x656d16: lea rcx, [rax + 0x12]
0x656d1a: call 0x140433650
0x656d1f: lea rdx, [rbp + 0x170]
0x656d26: mov rcx, qword ptr [rax + 0x88]
0x656d2d: call 0x142424250
0x656d32: nop 
0x656d33: mov rcx, qword ptr [rax]
0x656d36: mov rax, qword ptr [rcx]
0x656d39: xor edx, edx
0x656d3b: call qword ptr [rax + 8]
0x656d3e: mov rdi, rax
0x656d41: lea rcx, [rbp + 0x188]
0x656d48: call 0x140394db0
0x656d4d: mov qword ptr [rsp + 0x58], rdi
0x656d52: mov dword ptr [rbp + 0x2a4], 0xffffffff
0x656d5c: lea rcx, [rbp + 0x190]
0x656d63: mov rax, qword ptr [rbp + 0x298]
0x656d6a: test rax, rax
0x656d6d: cmovne rcx, rax
0x656d71: lea r9, [rsp + 0x58]
0x656d76: lea r8, [rip + 0x4f20213]
0x656d7d: mov edx, dword ptr [rbp + 0x2a0]
0x656d83: call 0x14035ee40
0x656d88: lea rcx, [rbp + 0x190]
0x656d8f: mov rax, qword ptr [rbp + 0x298]
0x656d96: test rax, rax
0x656d99: cmovne rcx, rax
0x656d9d: mov qword ptr [rsp + 0x28], rcx
0x656da2: mov rax, qword ptr gs:[0x58]
0x656dab: mov rcx, qword ptr [rax]
0x656dae: mov eax, 0x1ec
0x656db3: mov rdx, qword ptr [rip + 0x671276e]
0x656dba: cmp byte ptr [rax + rcx], 0
0x656dbe: cmovne rdx, qword ptr [rip + 0x671276a]
0x656dc6: mov rax, qword ptr [rdx]
0x656dc9: mov rcx, qword ptr [rax + 8]
0x656dcd: mov rax, qword ptr [rcx + 0x1c0]
0x656dd4: movzx ecx, word ptr [rax + 0xac]
0x656ddb: mov word ptr [rbp + 0x6b0], cx
0x656de2: lea rcx, [rbp + 0x6b0]
0x656de9: call 0x140389080
0x656dee: mov rcx, qword ptr [rax + 0x18]
0x656df2: mov rax, qword ptr [rcx]
0x656df5: xor edx, edx
0x656df7: call qword ptr [rax + 8]
0x656dfa: mov dword ptr [r12 + 0x114], 0xffffffff
0x656e06: mov r8, qword ptr [r12 + 0x108]
0x656e0e: mov rcx, r12
0x656e11: test r8, r8
0x656e14: cmovne rcx, r8
0x656e18: lea r9, [rsp + 0x28]
0x656e1d: mov r8, rax
0x656e20: mov edx, dword ptr [r12 + 0x110]
0x656e28: call 0x14035ee40
0x656e2d: nop 
0x656e2e: lea rcx, [rbp + 0x190]
0x656e35: call 0x140394170
0x656e3a: mov dil, 2
0x656e3d: lea rcx, [rbp + 0x4f0]
0x656e44: call 0x1421562b0
0x656e49: cmp dil, 2
0x656e4d: je 0x140656e7c
0x656e4f: mov r8, r12
0x656e52: lea rdx, [rsp + 0x24]
0x656e57: call 0x1406572d0
0x656e5c: cmp al, 4
0x656e5e: je 0x140656e65
0x656e60: movzx edi, al
0x656e63: jmp 0x140656e7c
0x656e65: cmp ebx, -1
0x656e68: setne cl
0x656e6b: jne 0x140656efe
0x656e71: cmp dword ptr [rsp + 0x54], -1
0x656e76: jne 0x140656efe
0x656e7c: cmp dil, 4
0x656e80: jne 0x140657010
0x656e86: mov rax, qword ptr [rbp + 0x6d0]
0x656e8d: test rax, rax
0x656e90: je 0x140656eab
0x656e92: mov dword ptr [rax + 0x114], r15d
0x656e99: mov byte ptr [rax], 0
0x656e9c: mov rax, qword ptr [rax + 0x108]
0x656ea3: test rax, rax
0x656ea6: je 0x140656eab
0x656ea8: mov byte ptr [rax], 0
0x656eab: mov dil, 4
0x656eae: lea rcx, [rbp + 0x3d0]
0x656eb5: call 0x140394170
0x656eba: nop 
0x656ebb: lea rax, [rsp + 0x78]
0x656ec0: mov rcx, qword ptr [rsp + 0x68]
0x656ec5: cmp rcx, rax
0x656ec8: je 0x140657081
0x656ece: test rcx, rcx
0x656ed1: je 0x140657081
0x656ed7: mov r8d, 0x1fd
0x656edd: mov rax, qword ptr gs:[0x58]
0x656ee6: mov rdx, qword ptr [rax]
0x656ee9: cmp byte ptr [r8 + rdx], 0
0x656eee: je 0x14065707b
0x656ef4: call 0x1447f03bc
0x656ef9: jmp 0x140657081
0x656efe: cmp qword ptr [rbp + 0x6d0], 0
0x656f06: je 0x14065700d
0x656f0c: mov qword ptr [rbp + 0x3b8], r15
0x656f13: mov qword ptr [rbp + 0x3c0], 0x105
0x656f1e: mov dword ptr [rbp + 0x3c4], r15d
0x656f25: mov byte ptr [rbp + 0x2b0], 0
0x656f2c: mov dword ptr [rbp + 0x3c4], r15d
0x656f33: mov byte ptr [rbp + 0x2b0], 0
0x656f3a: mov rax, qword ptr [rbp + 0x3b8]
0x656f41: test rax, rax
0x656f44: je 0x140656f49
0x656f46: mov byte ptr [rax], 0
0x656f49: test cl, cl
0x656f4b: je 0x140656f5b
0x656f4d: lea r8, [rbp + 0x2b0]
0x656f54: mov edx, ebx
0x656f56: call 0x140657110
0x656f5b: lea rcx, [rbp + 0x2b0]
0x656f62: mov rax, qword ptr [rbp + 0x3b8]
0x656f69: test rax, rax
0x656f6c: cmovne rcx, rax
0x656f70: mov qword ptr [rsp + 0x28], rcx
0x656f75: mov rax, qword ptr gs:[0x58]
0x656f7e: mov rcx, qword ptr [rax]
0x656f81: mov eax, 0x1ec
0x656f86: mov rdx, qword ptr [rip + 0x671259b]
0x656f8d: cmp byte ptr [rax + rcx], 0
0x656f91: cmovne rdx, qword ptr [rip + 0x6712597]
0x656f99: mov rax, qword ptr [rdx]
0x656f9c: mov rcx, qword ptr [rax + 8]
0x656fa0: mov rax, qword ptr [rcx + 0x1c0]
0x656fa7: movzx ecx, word ptr [rax + 0xae]
0x656fae: mov word ptr [rbp + 0x6b0], cx
0x656fb5: lea rcx, [rbp + 0x6b0]
0x656fbc: call 0x140389080
0x656fc1: mov rcx, qword ptr [rax + 0x18]
0x656fc5: mov rax, qword ptr [rcx]
0x656fc8: xor edx, edx
0x656fca: call qword ptr [rax + 8]
0x656fcd: mov dword ptr [r12 + 0x114], 0xffffffff
0x656fd9: mov r8, qword ptr [r12 + 0x108]
0x656fe1: mov rcx, r12
0x656fe4: test r8, r8
0x656fe7: cmovne rcx, r8
0x656feb: lea r9, [rsp + 0x28]
0x656ff0: mov r8, rax
0x656ff3: mov edx, dword ptr [r12 + 0x110]
0x656ffb: call 0x14035ee40
0x657000: nop 
0x657001: lea rcx, [rbp + 0x2b0]
0x657008: call 0x140394170
0x65700d: mov dil, 1
0x657010: mov rbx, qword ptr [rbp + 0x6d0]
0x657017: cmp byte ptr [rbp + 0x6b8], dil
0x65701e: jae 0x140657049
0x657020: mov byte ptr [rbp + 0x6b8], dil
0x657027: test rbx, rbx
0x65702a: je 0x140657050
0x65702c: lea rax, [rbp + 0x3d0]
0x657033: cmp rbx, rax
0x657036: je 0x140657050
0x657038: lea rdx, [rbp + 0x3d0]
0x65703f: mov rcx, rbx
0x657042: call 0x14044d550
0x657047: jmp 0x140657050
0x657049: movzx edi, byte ptr [rbp + 0x6b8]
0x657050: mov r13, qword ptr [rsp + 0x60]
0x657055: add r13, 2
0x657059: mov qword ptr [rsp + 0x60], r13
0x65705e: cmp r13, qword ptr [rbp - 0x10]
0x657062: mov r15, qword ptr [rbp - 8]
0x657066: mov eax, 0
0x65706b: mov esi, 0xffff
0x657070: jne 0x140656827
0x657076: jmp 0x140656eae
0x65707b: call 0x1447f02bc
0x657080: nop 
0x657081: lea rax, [rip + 0x52bbdd8]
0x657088: mov qword ptr [rbp], rax
0x65708c: cmp byte ptr [rbp + 0x10], 0
0x657090: je 0x1406570a0
0x657092: mov rcx, qword ptr [rbp + 0x28]
0x657096: mov rax, qword ptr [rcx]
0x657099: call qword ptr [rax + 0x148]
0x65709f: nop 
0x6570a0: lea rax, [rip + 0x4f1c799]
0x6570a7: mov qword ptr [rbp], rax
0x6570ab: lea rax, [rip + 0x50ced96]
0x6570b2: mov qword ptr [rbp], rax
0x6570b6: lea rcx, [rbp]
0x6570ba: call 0x141434880
0x6570bf: nop 
0x6570c0: lea rax, [rip + 0x50ced81]
0x6570c7: mov qword ptr [rbp - 0x78], rax
0x6570cb: lea rcx, [rbp - 0x78]
0x6570cf: call 0x141434880
0x6570d4: lea rax, [rip + 0x50ced6d]
0x6570db: mov qword ptr [rbp - 0x58], rax
0x6570df: lea rcx, [rbp - 0x58]
0x6570e3: call 0x141434880
0x6570e8: movzx eax, dil
0x6570ec: mov rbx, qword ptr [rsp + 0x7c8]
0x6570f4: add rsp, 0x770
0x6570fb: pop r15
0x6570fd: pop r14
0x6570ff: pop r13
0x657101: pop r12
0x657103: pop rdi
0x657104: pop rsi
0x657105: pop rbp
0x657106: ret 