0x495460: mov byte ptr [rsp + 0x18], r8b
0x495465: mov qword ptr [rsp + 0x10], rdx
0x49546a: push rbx
0x49546b: push rbp
0x49546c: push rsi
0x49546d: push rdi
0x49546e: push r12
0x495470: push r13
0x495472: push r14
0x495474: push r15
0x495476: sub rsp, 0xb8
0x49547d: movzx edi, r8b
0x495481: mov r13d, 0xffffffff
0x495487: mov rbx, qword ptr [rcx + 8]
0x49548b: mov qword ptr [rsp + 0x38], rbx
0x495490: shl rdi, 4
0x495494: add rcx, 0xc8
0x49549b: add rdi, rcx
0x49549e: mov r15, qword ptr [r9]
0x4954a1: mov eax, dword ptr [r9 + 8]
0x4954a5: lea rcx, [rax + rax*2]
0x4954a9: lea rax, [r15 + rcx*8]
0x4954ad: mov qword ptr [rsp + 0x30], rax
0x4954b2: xor r12d, r12d
0x4954b5: cmp r15, rax
0x4954b8: je 0x1404956d8
0x4954be: lea rax, [rbx + 8]
0x4954c2: test rbx, rbx
0x4954c5: cmove rax, r12
0x4954c9: mov qword ptr [rsp + 0x40], rax
0x4954ce: nop 
0x4954d0: vmovups xmm0, xmmword ptr [r15]
0x4954d5: vmovups xmmword ptr [rsp + 0x78], xmm0
0x4954db: vmovups xmmword ptr [rsp + 0x60], xmm0
0x4954e1: vmovsd xmm0, qword ptr [r15 + 0x10]
0x4954e7: vmovsd qword ptr [rsp + 0x100], xmm0
0x4954f0: vmovsd qword ptr [rsp + 0x70], xmm0
0x4954f6: mov rdx, qword ptr [rax]
0x4954f9: lea rcx, [rsp + 0x118]
0x495501: call 0x140393df0
0x495506: nop 
0x495507: mov r8d, dword ptr [rdi + 8]
0x49550b: mov eax, r12d
0x49550e: mov rsi, qword ptr [rsp + 0x78]
0x495513: test r8d, r8d
0x495516: je 0x140495538
0x495518: mov r9, qword ptr [rdi]
0x49551b: nop dword ptr [rax + rax]
0x495520: mov ecx, eax
0x495522: lea rdx, [rcx + rcx*2]
0x495526: cmp qword ptr [r9 + rdx*8], rsi
0x49552a: je 0x140495535
0x49552c: inc eax
0x49552e: cmp eax, r8d
0x495531: jb 0x140495520
0x495533: jmp 0x140495538
0x495535: mov r13d, eax
0x495538: mov rcx, qword ptr [rsp + 0x118]
0x495540: mov rax, qword ptr [rcx]
0x495543: mov dl, 1
0x495545: call qword ptr [rax + 0x20]
0x495548: movzx ebp, byte ptr [rsp + 0x75]
0x49554d: movzx r14d, byte ptr [rsp + 0x74]
0x495553: lea rdx, [rbx + 8]
0x495557: mov r8b, 1
0x49555a: cmp r13d, -1
0x49555e: jne 0x1404955ed
0x495564: test rbx, rbx
0x495567: cmove rdx, r12
0x49556b: mov rdx, qword ptr [rdx]
0x49556e: lea rcx, [rsp + 0x88]
0x495576: call 0x140393650
0x49557b: nop 
0x49557c: mov ecx, dword ptr [rdi + 8]
0x49557f: mov eax, dword ptr [rdi + 0xc]
0x495582: cmp eax, ecx
0x495584: ja 0x1404955a9
0x495586: lea edx, [rax*2 + 1]
0x49558d: add edx, eax
0x49558f: shr edx, 1
0x495591: cmp edx, 1
0x495594: mov eax, 1
0x495599: cmovb edx, eax
0x49559c: cmp ecx, edx
0x49559e: cmova edx, ecx
0x4955a1: mov rcx, rdi
0x4955a4: call 0x1404aa270
0x4955a9: mov eax, dword ptr [rdi + 8]
0x4955ac: lea rcx, [rax + rax*2]
0x4955b0: mov rax, qword ptr [rdi]
0x4955b3: vmovups xmm0, xmmword ptr [rsp + 0x78]
0x4955b9: vmovups xmmword ptr [rax + rcx*8], xmm0
0x4955be: vmovsd xmm0, qword ptr [rsp + 0x100]
0x4955c7: vmovsd qword ptr [rax + rcx*8 + 0x10], xmm0
0x4955cd: inc dword ptr [rdi + 8]
0x4955d0: mov rbx, qword ptr [rsp + 0x88]
0x4955d8: mov rax, qword ptr [rbx]
0x4955db: xor edx, edx
0x4955dd: mov rcx, rbx
0x4955e0: call qword ptr [rax + 0x20]
0x4955e3: cmp byte ptr [rsp + 0x90], 1
0x4955eb: jmp 0x140495637
0x4955ed: test rbx, rbx
0x4955f0: cmove rdx, r12
0x4955f4: mov rdx, qword ptr [rdx]
0x4955f7: lea rcx, [rsp + 0x98]
0x4955ff: call 0x140393650
0x495604: nop 
0x495605: mov eax, r13d
0x495608: lea rcx, [rax + rax*2]
0x49560c: mov rax, qword ptr [rdi]
0x49560f: mov byte ptr [rax + rcx*8 + 0x14], r14b
0x495614: mov rax, qword ptr [rdi]
0x495617: mov byte ptr [rax + rcx*8 + 0x15], bpl
0x49561c: mov rbx, qword ptr [rsp + 0x98]
0x495624: mov rax, qword ptr [rbx]
0x495627: xor edx, edx
0x495629: mov rcx, rbx
0x49562c: call qword ptr [rax + 0x20]
0x49562f: cmp byte ptr [rsp + 0xa0], 1
0x495637: jne 0x140495667
0x495639: mov eax, 0xffffffff
0x49563e: lock xadd dword ptr [rbx + 8], eax
0x495643: cmp eax, 1
0x495646: jne 0x14049565a
0x495648: test dword ptr [rbx + 0xc], 0x40000000
0x49564f: je 0x140495667
0x495651: mov rax, qword ptr [rbx]
0x495654: mov rcx, rbx
0x495657: call qword ptr [rax + 0x40]
0x49565a: test dword ptr [rbx + 0xc], 0x40000000
0x495661: je 0x140495667
0x495663: lock dec dword ptr [rbx + 0xc]
0x495667: vmovsd xmm0, qword ptr [rsp + 0x68]
0x49566d: vmovsd qword ptr [rsp + 0x50], xmm0
0x495673: mov eax, dword ptr [rsp + 0x70]
0x495677: mov dword ptr [rsp + 0x58], eax
0x49567b: mov rax, qword ptr [rip + 0x68d3b0e]
0x495682: mov rcx, qword ptr [rax + 0x80]
0x495689: movzx eax, byte ptr [rsp + 0x110]
0x495691: mov byte ptr [rsp + 0x28], al
0x495695: mov byte ptr [rsp + 0x20], bpl
0x49569a: movzx r9d, r14b
0x49569e: lea r8, [rsp + 0x50]
0x4956a3: mov rdx, rsi
0x4956a6: mov rcx, qword ptr [rcx + 0x618]
0x4956ad: call 0x1404a47e0
0x4956b2: add r15, 0x18
0x4956b6: cmp r15, qword ptr [rsp + 0x30]
0x4956bb: mov rbx, qword ptr [rsp + 0x38]
0x4956c0: mov rax, qword ptr [rsp + 0x40]
0x4956c5: jne 0x1404954d0
0x4956cb: mov rax, qword ptr [rsp + 0x108]
0x4956d3: mov dword ptr [rax], r12d
0x4956d6: jmp 0x1404956de
0x4956d8: mov dword ptr [rdx], r12d
0x4956db: mov rax, rdx
0x4956de: add rsp, 0xb8
0x4956e5: pop r15
0x4956e7: pop r14
0x4956e9: pop r13
0x4956eb: pop r12
0x4956ed: pop rdi
0x4956ee: pop rsi
0x4956ef: pop rbp
0x4956f0: pop rbx
0x4956f1: ret 
0x4956f2: int3 
0x4956f3: int3 
0x4956f4: int3 
0x4956f5: int3 
0x4956f6: int3 
0x4956f7: int3 
0x4956f8: int3 
0x4956f9: int3 
0x4956fa: int3 
0x4956fb: int3 
0x4956fc: int3 
0x4956fd: int3 
0x4956fe: int3 
0x4956ff: int3 
0x495700: mov qword ptr [rsp + 8], rbx
0x495705: mov qword ptr [rsp + 0x10], rbp
0x49570a: mov qword ptr [rsp + 0x18], rsi
0x49570f: push rdi
0x495710: push r14
0x495712: push r15
0x495714: sub rsp, 0x40
0x495718: movzx ebp, r9b
0x49571c: mov r14, r8
0x49571f: mov rdi, rdx
0x495722: mov rbx, rcx
0x495725: mov esi, 0xffffffff
0x49572a: mov rax, qword ptr [rcx + 8]
0x49572e: lea rdx, [rax + 8]
0x495732: xor r15d, r15d
0x495735: test rax, rax
0x495738: cmove rdx, r15
0x49573c: mov r8b, 1
0x49573f: mov rdx, qword ptr [rdx]
0x495742: lea rcx, [rsp + 0x30]
0x495747: call 0x140393650
0x49574c: nop 
0x49574d: mov eax, ebp
0x49574f: shl rax, 4
0x495753: add rbx, rax
0x495756: mov r9d, dword ptr [rbx + 0xd0]
0x49575d: mov eax, r15d
0x495760: test r9d, r9d
0x495763: je 0x1404957b4
0x495765: mov r11, qword ptr [r14]
0x495768: mov r10, qword ptr [rbx + 0xc8]
0x49576f: nop 
0x495770: mov ecx, eax
0x495772: lea rdx, [rcx + rcx*2]
0x495776: lea r8, [r10 + rdx*8]
0x49577a: cmp qword ptr [r8], r11
0x49577d: je 0x140495788
0x49577f: inc eax
0x495781: cmp eax, r9d
0x495784: jb 0x140495770
0x495786: jmp 0x1404957b4
0x495788: dec r9d
0x49578b: cmp eax, r9d
0x49578e: jae 0x1404957ac
0x495790: lea rdx, [r9 + r9*2]
0x495794: vmovups xmm0, xmmword ptr [r10 + rdx*8]
0x49579a: vmovups xmmword ptr [r8], xmm0
0x49579f: vmovsd xmm1, qword ptr [r10 + rdx*8 + 0x10]
0x4957a6: vmovsd qword ptr [r8 + 0x10], xmm1
0x4957ac: dec dword ptr [rbx + 0xd0]
0x4957b2: mov esi, eax
0x4957b4: mov rbx, qword ptr [rsp + 0x30]
0x4957b9: mov rax, qword ptr [rbx]
0x4957bc: xor edx, edx
0x4957be: mov rcx, rbx
0x4957c1: call qword ptr [rax + 0x20]
0x4957c4: cmp byte ptr [rsp + 0x38], 1
0x4957c9: jne 0x1404957f9
0x4957cb: mov eax, 0xffffffff
0x4957d0: lock xadd dword ptr [rbx + 8], eax
0x4957d5: cmp eax, 1
0x4957d8: jne 0x1404957ec
0x4957da: test dword ptr [rbx + 0xc], 0x40000000
0x4957e1: je 0x1404957f9
0x4957e3: mov rax, qword ptr [rbx]
0x4957e6: mov rcx, rbx
0x4957e9: call qword ptr [rax + 0x40]
0x4957ec: test dword ptr [rbx + 0xc], 0x40000000
0x4957f3: je 0x1404957f9
0x4957f5: lock dec dword ptr [rbx + 0xc]
0x4957f9: cmp esi, -1
0x4957fc: jne 0x14049580b
0x4957fe: mov eax, dword ptr [rip + 0x6862264]
0x495804: mov dword ptr [rdi], eax
0x495806: jmp 0x1404958b2
0x49580b: mov rax, qword ptr [rip + 0x68d397e]
0x495812: mov rcx, qword ptr [rax + 0x80]
0x495819: mov r9, qword ptr [rcx + 0x650]
0x495820: mov rax, qword ptr [r14]
0x495823: xor ecx, ecx
0x495825: mov dword ptr [rsp + 0x39], ecx
0x495829: mov word ptr [rsp + 0x3d], cx
0x49582e: mov byte ptr [rsp + 0x3f], cl
0x495832: mov qword ptr [rsp + 0x20], rax
0x495837: mov word ptr [rsp + 0x28], 0x15
0x49583e: mov eax, dword ptr [rsp + 0x3a]
0x495842: mov dword ptr [rsp + 0x2a], eax
0x495846: movzx eax, word ptr [rsp + 0x3e]
0x49584b: mov word ptr [rsp + 0x2e], ax
0x495850: mov rax, qword ptr gs:[0x58]
0x495859: mov rcx, qword ptr [rax]
0x49585c: mov edx, 0x1ec
0x495861: mov rax, qword ptr [rip + 0x68d3cc0]
0x495868: cmp byte ptr [rdx + rcx], 0
0x49586c: cmovne rax, qword ptr [rip + 0x68d3cbc]
0x495874: mov rax, qword ptr [rax]
0x495877: mov rdx, qword ptr [rax + 8]
0x49587b: mov eax, 0xea
0x495880: mov ecx, 0x16c
0x495885: test bpl, bpl
0x495888: cmovne eax, ecx
0x49588b: mov rdx, qword ptr [rdx + 0x270]
0x495892: vmovups xmm0, xmmword ptr [rsp + 0x20]
0x495898: vmovups xmmword ptr [rsp + 0x30], xmm0
0x49589e: lea r8, [rsp + 0x30]
0x4958a3: movzx edx, word ptr [rax + rdx]
0x4958a7: mov rcx, r9
0x4958aa: call 0x1404a4630
0x4958af: mov dword ptr [rdi], r15d
0x4958b2: mov rax, rdi
0x4958b5: mov rbx, qword ptr [rsp + 0x60]
0x4958ba: mov rbp, qword ptr [rsp + 0x68]
0x4958bf: mov rsi, qword ptr [rsp + 0x70]
0x4958c4: add rsp, 0x40
0x4958c8: pop r15
0x4958ca: pop r14
0x4958cc: pop rdi
0x4958cd: ret 
0x4958ce: int3 
0x4958cf: int3 
0x4958d0: mov qword ptr [rsp + 0x10], rbx
0x4958d5: mov qword ptr [rsp + 0x18], rbp
0x4958da: mov qword ptr [rsp + 0x20], rsi
0x4958df: push rdi
0x4958e0: push r12
0x4958e2: push r13
0x4958e4: push r14
0x4958e6: push r15
0x4958e8: sub rsp, 0x50
0x4958ec: mov rbx, r8
0x4958ef: movzx r15d, dl
0x4958f3: mov rbp, rcx
0x4958f6: mov rax, qword ptr [rcx + 8]
0x4958fa: lea rdx, [rax + 8]
0x4958fe: xor r13d, r13d
0x495901: test rax, rax
0x495904: cmove rdx, r13
0x495908: mov r8b, 1
0x49590b: mov rdx, qword ptr [rdx]
0x49590e: lea rcx, [rsp + 0x20]
0x495913: call 0x140393650
0x495918: nop 
0x495919: mov rdi, qword ptr [rbx]
0x49591c: mov eax, dword ptr [rbx + 8]
0x49591f: lea rcx, [rax + rax*2]
0x495923: lea r14, [rdi + rcx*8]
0x495927: cmp rdi, r14
0x49592a: je 0x140495a4f
0x495930: mov r12d, 0xffff
0x495936: cmp byte ptr [rdi + 0xc], 0
0x49593a: je 0x140495950
0x49593c: movzx r8d, r15b
0x495940: mov rdx, rdi
0x495943: mov rcx, rbp
0x495946: call 0x1417e7270
0x49594b: jmp 0x140495a42
0x495950: mov word ptr [rsp + 0x36], r12w
0x495956: mov dword ptr [rsp + 0x3c], r13d
0x49595b: mov dword ptr [rsp + 0x40], 0xffffffff
0x495963: mov esi, dword ptr [rdi]
0x495965: mov dword ptr [rsp + 0x30], esi
0x495969: mov edx, dword ptr [rdi + 4]
0x49596c: lea rcx, [rsp + 0x80]
0x495974: call 0x140780350
0x495979: movzx eax, word ptr [rsp + 0x80]
0x495981: mov word ptr [rsp + 0x34], ax
0x495986: mov r9d, dword ptr [rdi + 8]
0x49598a: mov rbx, qword ptr [rip + 0x68d40b7]
0x495991: cmp dword ptr [rbx + 0x6c], 0
0x495995: je 0x1404959ea
0x495997: mov ecx, dword ptr [rbx + 0x68]
0x49599a: test ecx, ecx
0x49599c: je 0x1404959ea
0x49599e: xor edx, edx
0x4959a0: mov eax, r9d
0x4959a3: div ecx
0x4959a5: mov r10d, edx
0x4959a8: shl r10, 8
0x4959ac: add r10, qword ptr [rbx + 0x78]
0x4959b0: mov edx, r13d
0x4959b3: mov r11d, dword ptr [r10]
0x4959b6: test r11d, r11d
0x4959b9: je 0x1404959ea
0x4959bb: nop dword ptr [rax + rax]
0x4959c0: mov eax, edx
0x4959c2: cmp dword ptr [r10 + rax*8 + 8], r9d
0x4959c7: jne 0x1404959e3
0x4959c9: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x4959ce: mov rax, qword ptr [rbx + 0x80]
0x4959d5: mov r8, qword ptr [rax + rcx*8]
0x4959d9: cmp dword ptr [r8 + 4], r9d
0x4959dd: je 0x140495ab2
0x4959e3: inc edx
0x4959e5: cmp edx, r11d
0x4959e8: jb 0x1404959c0
0x4959ea: mov eax, r12d
0x4959ed: mov word ptr [rsp + 0x36], ax
0x4959f2: mov byte ptr [rsp + 0x38], 0
0x4959f7: mov rax, qword ptr [rdi + 0x10]
0x4959fb: mov qword ptr [rsp + 0x3c], rax
0x495a00: mov rax, qword ptr [rbp + 0x240]
0x495a07: mov ecx, dword ptr [rbp + 0x248]
0x495a0d: lea rdx, [rcx + rcx*4]
0x495a11: lea rcx, [rax + rdx*4]
0x495a15: cmp rax, rcx
0x495a18: je 0x140495a31
0x495a1a: nop word ptr [rax + rax]
0x495a20: cmp esi, dword ptr [rax]
0x495a22: je 0x140495ac5
0x495a28: add rax, 0x14
0x495a2c: cmp rax, rcx
0x495a2f: jne 0x140495a20
0x495a31: lea rdx, [rsp + 0x30]
0x495a36: lea rcx, [rbp + 0x240]
0x495a3d: call 0x140d0cff0
0x495a42: add rdi, 0x18
0x495a46: cmp rdi, r14
0x495a49: jne 0x140495936
0x495a4f: mov rbx, qword ptr [rsp + 0x20]
0x495a54: mov rax, qword ptr [rbx]
0x495a57: xor edx, edx
0x495a59: mov rcx, rbx
0x495a5c: call qword ptr [rax + 0x20]
0x495a5f: cmp byte ptr [rsp + 0x28], 1
0x495a64: jne 0x140495a94
0x495a66: mov eax, 0xffffffff
0x495a6b: lock xadd dword ptr [rbx + 8], eax
0x495a70: cmp eax, 1
0x495a73: jne 0x140495a87
0x495a75: test dword ptr [rbx + 0xc], 0x40000000
0x495a7c: je 0x140495a94
0x495a7e: mov rax, qword ptr [rbx]
0x495a81: mov rcx, rbx
0x495a84: call qword ptr [rax + 0x40]
0x495a87: test dword ptr [rbx + 0xc], 0x40000000
0x495a8e: je 0x140495a94
0x495a90: lock dec dword ptr [rbx + 0xc]
0x495a94: lea r11, [rsp + 0x50]
0x495a99: mov rbx, qword ptr [r11 + 0x38]
0x495a9d: mov rbp, qword ptr [r11 + 0x40]
0x495aa1: mov rsi, qword ptr [r11 + 0x48]
0x495aa5: mov rsp, r11
0x495aa8: pop r15
0x495aaa: pop r14
0x495aac: pop r13
0x495aae: pop r12
0x495ab0: pop rdi
0x495ab1: ret 
0x495ab2: add r8, 8
0x495ab6: je 0x1404959ea
0x495abc: movzx eax, word ptr [r8]
0x495ac0: jmp 0x1404959ed
0x495ac5: vmovups xmm0, xmmword ptr [rsp + 0x30]
0x495acb: vmovups xmmword ptr [rax], xmm0
0x495acf: mov ecx, dword ptr [rsp + 0x40]
0x495ad3: mov dword ptr [rax + 0x10], ecx
0x495ad6: jmp 0x140495a42
0x495adb: int3 
0x495adc: int3 
0x495add: int3 
0x495ade: int3 
0x495adf: int3 
0x495ae0: mov qword ptr [rsp + 0x10], rbx
0x495ae5: mov qword ptr [rsp + 0x20], rbp
0x495aea: push rsi
0x495aeb: push rdi
0x495aec: push r12
0x495aee: push r14
0x495af0: push r15
0x495af2: sub rsp, 0x30
0x495af6: movzx esi, r8b
0x495afa: movzx ebx, dx
0x495afd: mov rdi, rcx
0x495b00: mov rax, qword ptr [rcx + 8]
0x495b04: lea rdx, [rax + 8]
0x495b08: xor r14d, r14d
0x495b0b: test rax, rax
0x495b0e: cmove rdx, r14
0x495b12: mov r8b, 1
0x495b15: mov rdx, qword ptr [rdx]
0x495b18: lea rcx, [rsp + 0x20]
0x495b1d: call 0x140393650
0x495b22: nop 
0x495b23: mov word ptr [rdi + 0x270], bx
0x495b2a: mov rbx, qword ptr [rsp + 0x20]
0x495b2f: mov rax, qword ptr [rbx]
0x495b32: xor edx, edx
0x495b34: mov rcx, rbx
0x495b37: call qword ptr [rax + 0x20]
0x495b3a: mov rdi, 0xffffffffffffffff
0x495b41: cmp byte ptr [rsp + 0x28], 1
0x495b46: jne 0x140495b73
0x495b48: mov eax, edi
0x495b4a: lock xadd dword ptr [rbx + 8], eax
0x495b4f: cmp eax, 1
0x495b52: jne 0x140495b66
0x495b54: test dword ptr [rbx + 0xc], 0x40000000
0x495b5b: je 0x140495b73
0x495b5d: mov rax, qword ptr [rbx]
0x495b60: mov rcx, rbx
0x495b63: call qword ptr [rax + 0x40]
0x495b66: test dword ptr [rbx + 0xc], 0x40000000
0x495b6d: je 0x140495b73
0x495b6f: lock dec dword ptr [rbx + 0xc]
0x495b73: test sil, sil
0x495b76: je 0x140495c85
0x495b7c: mov rax, qword ptr [rip + 0x68d360d]
0x495b83: mov rcx, qword ptr [rax + 0x80]
0x495b8a: mov r15, qword ptr [rcx + 0x8b8]
0x495b91: mov rax, qword ptr gs:[0x58]
0x495b9a: mov rbp, qword ptr [rax]
0x495b9d: mov ecx, 0x1ec
0x495ba2: mov rax, qword ptr [rip + 0x68d397f]
0x495ba9: cmp byte ptr [rcx + rbp], 0
0x495bad: cmovne rax, qword ptr [rip + 0x68d397b]
0x495bb5: mov rax, qword ptr [rax]
0x495bb8: mov rcx, qword ptr [rax + 8]
0x495bbc: mov rax, qword ptr [rcx + 0x1c0]
0x495bc3: movzx ecx, word ptr [rax + 0xfc]
0x495bca: mov word ptr [rsp + 0x70], cx
0x495bcf: lea rcx, [rsp + 0x70]
0x495bd4: call 0x140389080
0x495bd9: mov rcx, qword ptr [rax + 0x18]
0x495bdd: mov rax, qword ptr [rcx]
0x495be0: xor edx, edx
0x495be2: call qword ptr [rax + 8]
0x495be5: mov rsi, rax
0x495be8: mov qword ptr [rsp + 0x60], r14
0x495bed: lea r12, [rip + 0x65cfd4c]
0x495bf4: test rax, rax
0x495bf7: je 0x140495c28
0x495bf9: cmp byte ptr [rax], 0
0x495bfc: je 0x140495c28
0x495bfe: mov rbx, rdi
0x495c01: inc rbx
0x495c04: cmp byte ptr [rax + rbx], 0
0x495c08: jne 0x140495c01
0x495c0a: mov ecx, ebx
0x495c0c: call 0x1414203f0
0x495c11: mov r14, rax
0x495c14: lea edx, [rbx + 1]
0x495c17: mov r9, rdi
0x495c1a: mov r8, rsi
0x495c1d: mov rcx, qword ptr [rax]
0x495c20: call qword ptr [rip + 0x4d5688a]
0x495c26: jmp 0x140495c2b
0x495c28: mov r14, r12
0x495c2b: mov qword ptr [rsp + 0x60], r14
0x495c30: lea rdx, [rsp + 0x60]
0x495c35: mov rcx, r15
0x495c38: call 0x1404a41a0
0x495c3d: nop 
0x495c3e: mov rbx, qword ptr [rsp + 0x60]
0x495c43: cmp rbx, r12
0x495c46: je 0x140495c80
0x495c48: mov eax, dword ptr [rbx + 0x10]
0x495c4b: test eax, eax
0x495c4d: js 0x140495c80
0x495c4f: lock xadd dword ptr [rbx + 0x10], edi
0x495c54: cmp edi, 1
0x495c57: jne 0x140495c80
0x495c59: test rbx, rbx
0x495c5c: je 0x140495c80
0x495c5e: mov rcx, rbx
0x495c61: call 0x141420360
0x495c66: mov eax, 0x1fd
0x495c6b: mov rcx, rbx
0x495c6e: cmp byte ptr [rax + rbp], 0
0x495c72: je 0x140495c7b
0x495c74: call 0x1447f03bc
0x495c79: jmp 0x140495c80
0x495c7b: call 0x1447f02bc
0x495c80: mov qword ptr [rsp + 0x60], r12
0x495c85: mov rbx, qword ptr [rsp + 0x68]
0x495c8a: mov rbp, qword ptr [rsp + 0x78]
0x495c8f: add rsp, 0x30
0x495c93: pop r15
0x495c95: pop r14
0x495c97: pop r12
0x495c99: pop rdi
0x495c9a: pop rsi
0x495c9b: ret 
0x495c9c: int3 
0x495c9d: int3 
0x495c9e: int3 
0x495c9f: int3 
0x495ca0: mov qword ptr [rsp + 8], rbx
0x495ca5: mov qword ptr [rsp + 0x18], r8
0x495caa: push rbp
0x495cab: push rsi
0x495cac: push rdi
0x495cad: push r12
0x495caf: push r13
0x495cb1: push r14
0x495cb3: push r15
0x495cb5: mov eax, 0x80060
0x495cba: call 0x1448962c0
0x495cbf: sub rsp, rax
0x495cc2: mov r14, r8
0x495cc5: mov r13, rcx
0x495cc8: xor r12d, r12d
0x495ccb: cmp dl, 1
0x495cce: je 0x140495cec
0x495cd0: cmp dl, 4
0x495cd3: je 0x140495cec
0x495cd5: mov edi, dword ptr [rip + 0x68d8775]
0x495cdb: mov eax, dword ptr [r8 + 8]
0x495cdf: lea r8d, [rdi + rax*8]
0x495ce3: mov dword ptr [rip + 0x68d8766], r8d
0x495cea: jmp 0x140495d03
0x495cec: mov edi, r12d
0x495cef: mov eax, dword ptr [r8 + 8]
0x495cf3: lea r8d, [r12 + rax*8]
0x495cf7: mov dword ptr [rip + 0x68d8752], r8d
0x495cfe: cmp dl, 4
0x495d01: je 0x140495d08
0x495d03: cmp dl, 3
0x495d06: jne 0x140495d15
0x495d08: cmp r8d, 0x400000
0x495d0f: jne 0x1404962e5
0x495d15: cmp qword ptr [rcx + 0x268], r12
0x495d1c: jne 0x140495db4
0x495d22: lea rax, [rip + 0x50dd783]
0x495d29: mov qword ptr [rsp + 0x800b8], rax
0x495d31: mov byte ptr [rsp + 0x28], r12b
0x495d36: lea rax, [rsp + 0x800b8]
0x495d3e: mov qword ptr [rsp + 0x20], rax
0x495d43: mov r9b, 4
0x495d46: mov edx, 0x400000
0x495d4b: mov r8d, 0x10
0x495d51: lea rcx, [rip + 0x67fe577]
0x495d58: call 0x141373730
0x495d5d: mov rbx, rax
0x495d60: mov r9, qword ptr [r13 + 0x268]
0x495d67: cmp rax, r9
0x495d6a: je 0x140495da1
0x495d6c: test r9, r9
0x495d6f: je 0x140495d97
0x495d71: mov eax, 0x1fd
0x495d76: mov rcx, qword ptr gs:[0x58]
0x495d7f: mov rdx, qword ptr [rcx]
0x495d82: mov rcx, r9
0x495d85: cmp byte ptr [rax + rdx], r12b
0x495d89: je 0x140495d92
0x495d8b: call 0x1447f03bc
0x495d90: jmp 0x140495d97
0x495d92: call 0x1447f02bc
0x495d97: mov qword ptr [r13 + 0x268], rbx
0x495d9e: mov r9, rbx
0x495da1: mov edx, 0xff
0x495da6: mov r8d, 0x400000
0x495dac: mov rcx, r9
0x495daf: call 0x144898e24
0x495db4: mov rax, qword ptr gs:[0x58]
0x495dbd: mov rcx, qword ptr [rax]
0x495dc0: mov edx, 0x1ec
0x495dc5: mov rax, qword ptr [rip + 0x68d375c]
0x495dcc: cmp byte ptr [rdx + rcx], r12b
0x495dd0: cmovne rax, qword ptr [rip + 0x68d3758]
0x495dd8: mov rax, qword ptr [rax]
0x495ddb: mov rcx, qword ptr [rax + 8]
0x495ddf: mov rax, qword ptr [rcx + 0x98]
0x495de6: movzx ecx, word ptr [rax + 0xa0]
0x495ded: mov word ptr [rsp + 0x800a8], cx
0x495df5: lea rcx, [rsp + 0x800a8]
0x495dfd: call 0x1404a3590
0x495e02: movzx edx, byte ptr [rax + 0x11]
0x495e06: test edx, edx
0x495e08: je 0x140495e1c
0x495e0a: cmp edx, 1
0x495e0d: je 0x140495e15
0x495e0f: vxorps xmm2, xmm2, xmm2
0x495e13: jmp 0x140495e36
0x495e15: vmovss xmm2, dword ptr [rax + 0x50]
0x495e1a: jmp 0x140495e36
0x495e1c: vmovss xmm0, dword ptr [rax + 0x40]
0x495e21: vsubss xmm2, xmm0, dword ptr [rax + 0x38]
0x495e26: mov eax, dword ptr [rax + 0x18]
0x495e29: vxorps xmm1, xmm1, xmm1
0x495e2d: vcvtsi2ss xmm1, xmm1, rax
0x495e32: vdivss xmm2, xmm2, xmm1
0x495e36: vmovss xmm0, dword ptr [rip + 0x684a93a]
0x495e3e: vdivss xmm1, xmm0, xmm2
0x495e42: vcvttss2si r15d, xmm1
0x495e46: mov dword ptr [rsp + 0x34], r15d
0x495e4b: mov esi, r15d
0x495e4e: imul esi, r15d
0x495e52: vmovss xmm0, dword ptr [rip + 0x684a96e]
0x495e5a: vdivss xmm1, xmm0, xmm2
0x495e5e: vcvttss2si ebx, xmm1
0x495e62: imul ebx, ebx
0x495e65: vcvttss2si rbp, dword ptr [rip + 0x684a9aa]
0x495e6e: xor edx, edx
0x495e70: mov r8d, 0x80000
0x495e76: lea rcx, [rsp + 0x60]
0x495e7b: call 0x144898e24
0x495e80: mov r8d, dword ptr [r14 + 8]
0x495e84: mov rdx, qword ptr [r14]