0xd91ef0: mov rax, rsp
0xd91ef3: mov qword ptr [rax + 8], rbx
0xd91ef7: push rbp
0xd91ef8: push rsi
0xd91ef9: push rdi
0xd91efa: push r12
0xd91efc: push r13
0xd91efe: push r14
0xd91f00: push r15
0xd91f02: lea rbp, [rax - 0x5f]
0xd91f06: sub rsp, 0xe0
0xd91f0d: vmovaps xmmword ptr [rax - 0x48], xmm6
0xd91f12: vmovaps xmmword ptr [rax - 0x58], xmm7
0xd91f17: vmovaps xmmword ptr [rax - 0x68], xmm8
0xd91f1c: movzx r13d, dl
0xd91f20: mov r14, rcx
0xd91f23: xor esi, esi
0xd91f25: mov dword ptr [rbp - 0x69], esi
0xd91f28: lea rdx, [rbp - 0x29]
0xd91f2c: call 0x14064f4f0
0xd91f31: nop 
0xd91f32: lea r15, [rip + 0x4993f0f]
0xd91f39: cmp byte ptr [rbp - 0x19], sil
0xd91f3d: je 0x140d922ea
0xd91f43: vmovsd xmm6, qword ptr [rip + 0x47b3f3d]
0xd91f4b: vmovsd qword ptr [rbp - 0x79], xmm6
0xd91f50: mov r12d, dword ptr [rip + 0x47b3f39]
0xd91f57: mov eax, dword ptr [r14 + 0x330]
0xd91f5e: test eax, eax
0xd91f60: je 0x140d91fc1
0xd91f62: mov rbx, qword ptr [r14 + 0x328]
0xd91f69: lea r15, [rbx + rax*8]
0xd91f6d: cmp rbx, r15
0xd91f70: je 0x140d91fba
0xd91f72: nop dword ptr [rax]
0xd91f76: nop word ptr [rax + rax]
0xd91f80: mov rsi, qword ptr [rbx]
0xd91f83: lea rcx, [rsi + 0xde]
0xd91f8a: call 0x140537250
0xd91f8f: cmp dword ptr [rax + 0x2c], 0x25
0xd91f93: je 0x140d9215c
0xd91f99: lea rcx, [rsi + 0xde]
0xd91fa0: call 0x140537250
0xd91fa5: cmp dword ptr [rax + 0x2c], 0x66
0xd91fa9: je 0x140d9215c
0xd91faf: add rbx, 8
0xd91fb3: cmp rbx, r15
0xd91fb6: jne 0x140d91f80
0xd91fb8: xor esi, esi
0xd91fba: lea r15, [rip + 0x4993e87]
0xd91fc1: vxorps xmm8, xmm8, xmm8
0xd91fc6: vmovss xmm0, dword ptr [rbp - 0x79]
0xd91fcb: vucomiss xmm0, xmm8
0xd91fd0: jp 0x140d920bf
0xd91fd6: jne 0x140d920bf
0xd91fdc: vmovss xmm0, dword ptr [rbp - 0x75]
0xd91fe1: vucomiss xmm0, xmm8
0xd91fe6: jp 0x140d920bf
0xd91fec: jne 0x140d920bf
0xd91ff2: vmovd xmm0, r12d
0xd91ff7: vucomiss xmm0, xmm8
0xd91ffc: jp 0x140d920bf
0xd92002: jne 0x140d920bf
0xd92008: vmovss xmm7, dword ptr [r14 + 0xa6c]
0xd92011: vmovss xmm3, dword ptr [r14 + 0xa68]
0xd9201a: vmovss xmm6, dword ptr [r14 + 0xa98]
0xd92023: vmovss xmm0, dword ptr [r14 + 0xa88]
0xd9202c: vdivss xmm1, xmm0, xmm3
0xd92030: vmulss xmm2, xmm1, xmm3
0xd92034: vmulss xmm0, xmm3, dword ptr [rip + 0x4fe0ef8]
0xd9203c: vsubss xmm1, xmm2, xmm0
0xd92040: vmulss xmm2, xmm1, xmm6
0xd92044: vaddss xmm5, xmm2, dword ptr [r14 + 0xa58]
0xd9204d: vmovss xmm0, dword ptr [r14 + 0xa8c]
0xd92056: vdivss xmm1, xmm0, xmm7
0xd9205a: vmulss xmm3, xmm1, xmm7
0xd9205e: vmulss xmm2, xmm7, dword ptr [rip + 0x4fe0ece]
0xd92066: vsubss xmm0, xmm3, xmm2
0xd9206a: vmulss xmm1, xmm0, xmm6
0xd9206e: vsubss xmm4, xmm1, dword ptr [r14 + 0xa5c]
0xd92077: vmulss xmm3, xmm4, dword ptr [rip + 0x4fe1909]
0xd9207f: vunpcklps xmm0, xmm5, xmm8
0xd92084: vmovaps xmm6, xmm0
0xd92088: vmovsd qword ptr [rbp - 0x79], xmm0
0xd9208d: vmovd r12d, xmm3
0xd92092: cmp byte ptr [r14 + 0xadc], 0
0xd9209a: je 0x140d920bf
0xd9209c: vmovss xmm0, dword ptr [rip + 0x5f4bfa4]
0xd920a4: vaddss xmm1, xmm0, dword ptr [rip + 0x4fe1008]
0xd920ac: vmovaps xmm2, xmm6
0xd920b0: vinsertps xmm2, xmm2, xmm1, 0x10
0xd920b6: vmovsd qword ptr [rbp - 0x79], xmm2
0xd920bb: vmovaps xmm6, xmm2
0xd920bf: cmp byte ptr [rip + 0x5f4e7a2], 0
0xd920c6: je 0x140d92218
0xd920cc: mov rax, qword ptr [rbp - 0x21]
0xd920d0: mov rcx, qword ptr [rax + 0x68]
0xd920d4: mov rbx, qword ptr [rcx + 0x168]
0xd920db: vmovsd qword ptr [rbp - 0x59], xmm6
0xd920e0: mov dword ptr [rbp - 0x51], r12d
0xd920e4: mov qword ptr [rbp - 0x79], 0xffffffffffffffff
0xd920ec: mov rax, qword ptr [rbx + 8]
0xd920f0: lea rdx, [rax + 8]
0xd920f4: test rax, rax
0xd920f7: cmove rdx, rsi
0xd920fb: mov rdx, qword ptr [rdx]
0xd920fe: lea rcx, [rbp - 0x61]
0xd92102: call 0x140393df0
0xd92107: nop 
0xd92108: movzx eax, byte ptr [rbx + 0x260]
0xd9210f: mov byte ptr [rbp + 0x7f], al
0xd92112: movzx eax, byte ptr [rbx + 0x261]
0xd92119: mov byte ptr [rbp + 0x77], al
0xd9211c: mov rcx, qword ptr [rbp - 0x61]
0xd92120: mov rax, qword ptr [rcx]
0xd92123: mov dl, 1
0xd92125: call qword ptr [rax + 0x20]
0xd92128: lea rax, [rbx + 0x262]
0xd9212f: mov qword ptr [rsp + 0x30], rax
0xd92134: lea rax, [rbp + 0x77]
0xd92138: mov qword ptr [rsp + 0x28], rax
0xd9213d: lea rax, [rbp + 0x7f]
0xd92141: mov qword ptr [rsp + 0x20], rax
0xd92146: lea r9, [rbp - 0x59]
0xd9214a: lea r8, [rbp - 0x79]
0xd9214e: mov rcx, qword ptr [rbx + 8]
0xd92152: call 0x140b84320
0xd92157: jmp 0x140d922ea
0xd9215c: lea rcx, [rsi + 0xde]
0xd92163: cmp byte ptr [rip + 0x5f4e6fe], 0
0xd9216a: je 0x140d92199
0xd9216c: mov rbx, qword ptr [rbp - 0x21]
0xd92170: call 0x140537250
0xd92175: cmp dword ptr [rax + 0x2c], 0x66
0xd92179: sete r9b
0xd9217d: mov r8, qword ptr [rsi + 0xc8]
0xd92184: lea rdx, [rbp + 0x77]
0xd92188: mov rcx, rbx
0xd9218b: call 0x14050ac10
0xd92190: lea r15, [rip + 0x4993cb1]
0xd92197: jmp 0x140d921f4
0xd92199: call 0x140537250
0xd9219e: cmp dword ptr [rax + 0x2c], 0x66
0xd921a2: sete bl
0xd921a5: vmovups xmm6, xmmword ptr [rsi + 0xc8]
0xd921ad: mov rax, qword ptr [r14]
0xd921b0: mov rcx, r14
0xd921b3: call qword ptr [rax + 0x110]
0xd921b9: lea rdx, [rbp - 0x49]
0xd921bd: call 0x14064f4f0
0xd921c2: nop 
0xd921c3: cmp byte ptr [rbp - 0x39], 0
0xd921c7: je 0x140d921e0
0xd921c9: movzx r9d, bl
0xd921cd: vmovq r8, xmm6
0xd921d2: lea rdx, [rbp + 0x77]
0xd921d6: mov rcx, qword ptr [rbp - 0x41]
0xd921da: call 0x14050ac10
0xd921df: nop 
0xd921e0: lea r15, [rip + 0x4993c61]
0xd921e7: mov qword ptr [rbp - 0x49], r15
0xd921eb: lea rcx, [rbp - 0x49]
0xd921ef: call 0x141434880
0xd921f4: test r13b, r13b
0xd921f7: je 0x140d922ea
0xd921fd: vmovsd xmm6, qword ptr [rsi + 0xe0]
0xd92205: vmovsd qword ptr [rbp - 0x79], xmm6
0xd9220a: mov r12d, dword ptr [rsi + 0xe8]
0xd92211: xor esi, esi
0xd92213: jmp 0x140d91fc1
0xd92218: mov rax, qword ptr [r14]
0xd9221b: mov rcx, r14
0xd9221e: call qword ptr [rax + 0x110]
0xd92224: nop 
0xd92225: lea rdx, [rbp - 0x49]
0xd92229: mov rcx, qword ptr [rip + 0x5fd6f60]
0xd92230: mov rcx, qword ptr [rcx + 0x30]
0xd92234: call 0x1408b44e0
0xd92239: mov edi, 2
0xd9223e: mov dword ptr [rbp - 0x69], edi
0xd92241: cmp byte ptr [rbp - 0x39], 0
0xd92245: je 0x140d922d6
0xd9224b: mov rax, qword ptr [rbp - 0x41]
0xd9224f: mov rcx, qword ptr [rax + 0x68]
0xd92253: mov rbx, qword ptr [rcx + 0x168]
0xd9225a: vmovsd qword ptr [rbp - 0x59], xmm6
0xd9225f: mov dword ptr [rbp - 0x51], r12d
0xd92263: mov qword ptr [rbp - 0x61], 0xffffffffffffffff
0xd9226b: mov rax, qword ptr [rbx + 8]
0xd9226f: lea rdx, [rax + 8]
0xd92273: test rax, rax
0xd92276: cmove rdx, rsi
0xd9227a: mov rdx, qword ptr [rdx]
0xd9227d: lea rcx, [rbp - 0x79]
0xd92281: call 0x140393df0
0xd92286: nop 
0xd92287: movzx eax, byte ptr [rbx + 0x260]
0xd9228e: mov byte ptr [rbp + 0x7f], al
0xd92291: movzx eax, byte ptr [rbx + 0x261]
0xd92298: mov byte ptr [rbp + 0x77], al
0xd9229b: mov rcx, qword ptr [rbp - 0x79]
0xd9229f: mov rax, qword ptr [rcx]
0xd922a2: mov dl, 1
0xd922a4: call qword ptr [rax + 0x20]
0xd922a7: lea rax, [rbx + 0x262]
0xd922ae: mov qword ptr [rsp + 0x30], rax
0xd922b3: lea rax, [rbp + 0x77]
0xd922b7: mov qword ptr [rsp + 0x28], rax
0xd922bc: lea rax, [rbp + 0x7f]
0xd922c0: mov qword ptr [rsp + 0x20], rax
0xd922c5: lea r9, [rbp - 0x59]
0xd922c9: lea r8, [rbp - 0x61]
0xd922cd: mov rcx, qword ptr [rbx + 8]
0xd922d1: call 0x140b84320
0xd922d6: and edi, 0xfffffffd
0xd922d9: mov dword ptr [rbp - 0x69], edi
0xd922dc: mov qword ptr [rbp - 0x49], r15
0xd922e0: lea rcx, [rbp - 0x49]
0xd922e4: call 0x141434880
0xd922e9: nop 
0xd922ea: mov qword ptr [rbp - 0x29], r15
0xd922ee: lea rcx, [rbp - 0x29]
0xd922f2: call 0x141434880
0xd922f7: lea r11, [rsp + 0xe0]
0xd922ff: mov rbx, qword ptr [r11 + 0x40]
0xd92303: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xd92309: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xd9230f: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xd92315: mov rsp, r11
0xd92318: pop r15
0xd9231a: pop r14
0xd9231c: pop r13
0xd9231e: pop r12
0xd92320: pop rdi
0xd92321: pop rsi
0xd92322: pop rbp
0xd92323: ret 
0xd92324: int3 
0xd92325: int3 
0xd92326: int3 
0xd92327: int3 
0xd92328: int3 
0xd92329: int3 
0xd9232a: int3 
0xd9232b: int3 
0xd9232c: int3 
0xd9232d: int3 
0xd9232e: int3 
0xd9232f: int3 
0xd92330: push r12
0xd92332: push r14
0xd92334: sub rsp, 0x58
0xd92338: mov rax, qword ptr [rcx + 0x610]
0xd9233f: mov r12, rcx
0xd92342: mov rdx, qword ptr [rax + 0xc8]
0xd92349: mov r14, qword ptr [rdx + 0x108]
0xd92350: test r14, r14
0xd92353: je 0x140d9259a
0xd92359: mov rax, qword ptr [rcx + 0x618]
0xd92360: mov qword ptr [rsp + 0x88], rbx
0xd92368: mov ecx, dword ptr [rax + 0xe0]
0xd9236e: cmp ecx, 0xf
0xd92371: jae 0x140d9237c
0xd92373: call 0x140dec470
0xd92378: mov ebx, dword ptr [rax]
0xd9237a: jmp 0x140d9237e
0xd9237c: xor ebx, ebx
0xd9237e: mov rax, qword ptr [r14 + 0xa0]
0xd92385: mov qword ptr [rsp + 0x38], r13
0xd9238a: mov dword ptr [rsp + 0x70], ebx
0xd9238e: test rax, rax
0xd92391: je 0x140d923b8
0xd92393: cmp qword ptr [rax + 8], 0
0xd92398: jne 0x140d92585
0xd9239e: cmp qword ptr [rax + 0x58], 0
0xd923a3: mov r13d, dword ptr [r14 + 0x48]
0xd923a7: je 0x140d923bc
0xd923a9: cmp r13d, 1
0xd923ad: jbe 0x140d92585
0xd923b3: dec r13d
0xd923b6: jmp 0x140d923bc
0xd923b8: mov r13d, dword ptr [r14 + 0x48]
0xd923bc: mov qword ptr [rsp + 0x50], rbp
0xd923c1: xor ebp, ebp
0xd923c3: test r13d, r13d
0xd923c6: je 0x140d92580
0xd923cc: mov qword ptr [rsp + 0x30], r15
0xd923d1: lea r8, [rip + 0x47e10d4]
0xd923d8: mov qword ptr [rsp + 0x48], rsi
0xd923dd: xor r15d, r15d
0xd923e0: mov qword ptr [rsp + 0x40], rdi
0xd923e5: nop word ptr [rax + rax]
0xd923f0: mov rax, qword ptr [r14 + 0xa0]
0xd923f7: test rax, rax
0xd923fa: je 0x140d92407
0xd923fc: cmp qword ptr [rax + 8], 0
0xd92401: je 0x140d92407
0xd92403: xor eax, eax
0xd92405: jmp 0x140d9244b
0xd92407: mov ecx, dword ptr [r14 + 0x48]
0xd9240b: cmp ecx, ebp
0xd9240d: ja 0x140d92413
0xd9240f: xor eax, eax
0xd92411: jmp 0x140d9244b
0xd92413: test rax, rax
0xd92416: je 0x140d92443
0xd92418: cmp qword ptr [rax + 0x58], 0
0xd9241d: je 0x140d92443
0xd9241f: cmp ecx, 1
0xd92422: jne 0x140d92428
0xd92424: xor eax, eax
0xd92426: jmp 0x140d9244b
0xd92428: mov rdx, qword ptr [r14 + 0x40]
0xd9242c: cmp ebp, dword ptr [rax + 0x90]
0xd92432: jae 0x140d9243a
0xd92434: mov rax, qword ptr [r15 + rdx]
0xd92438: jmp 0x140d9244b
0xd9243a: lea eax, [rbp + 1]
0xd9243d: mov rax, qword ptr [rdx + rax*8]
0xd92441: jmp 0x140d9244b
0xd92443: mov rax, qword ptr [r14 + 0x40]
0xd92447: mov rax, qword ptr [r15 + rax]
0xd9244b: mov rcx, qword ptr [rax + 0xa0]
0xd92452: test rcx, rcx
0xd92455: je 0x140d92462
0xd92457: cmp qword ptr [rcx + 8], 0
0xd9245c: jne 0x140d92562
0xd92462: mov rax, qword ptr [rax + 0xd8]
0xd92469: test rax, rax
0xd9246c: jne 0x140d92492
0xd9246e: test rcx, rcx
0xd92471: je 0x140d92562
0xd92477: mov rcx, qword ptr [rcx + 0x58]
0xd9247b: test rcx, rcx
0xd9247e: je 0x140d92562
0xd92484: call 0x143ed84d0
0xd92489: test rax, rax
0xd9248c: je 0x140d92562
0xd92492: mov qword ptr [rsp + 0x20], r8
0xd92497: lea r9, [rip + 0x5f3df06]
0xd9249e: lea r8, [rsp + 0x80]
0xd924a6: mov qword ptr [rsp + 0x80], 0
0xd924b2: lea rdx, [rsp + 0x78]
0xd924b7: mov rcx, rax
0xd924ba: call 0x140cb7a70
0xd924bf: mov rsi, qword ptr [rsp + 0x80]
0xd924c7: test rsi, rsi
0xd924ca: je 0x140d9255b
0xd924d0: lea rdx, [r12 + 0x654]
0xd924d8: cmp dword ptr [rdx], 0
0xd924db: je 0x140d9250d
0xd924dd: mov rdi, qword ptr [rsi + 0x20]
0xd924e1: mov rax, qword ptr [rdi]
0xd924e4: mov rcx, qword ptr [rax + 0xa0]
0xd924eb: test rcx, rcx
0xd924ee: je 0x140d924f7
0xd924f0: cmp qword ptr [rcx + 8], 0
0xd924f5: jne 0x140d9250d
0xd924f7: mov rcx, qword ptr [rdi + 8]
0xd924fb: call 0x1435ca140
0xd92500: cmp eax, -1
0xd92503: je 0x140d9250d
0xd92505: mov rcx, rdi
0xd92508: call 0x1435c66a0
0xd9250d: test ebx, ebx
0xd9250f: sete dl
0xd92512: test ebx, ebx
0xd92514: je 0x140d9255b
0xd92516: mov rdi, qword ptr [rsi + 0x20]
0xd9251a: mov rax, qword ptr [rdi]
0xd9251d: mov rcx, qword ptr [rax + 0xa0]
0xd92524: test rcx, rcx
0xd92527: je 0x140d92530
0xd92529: cmp qword ptr [rcx + 8], 0
0xd9252e: jne 0x140d9255b
0xd92530: test dl, dl
0xd92532: jne 0x140d9255b
0xd92534: mov rcx, qword ptr [rdi + 8]
0xd92538: lea rdx, [rsp + 0x70]
0xd9253d: call 0x1435ca0a0
0xd92542: test al, al
0xd92544: je 0x140d92557
0xd92546: mov rcx, qword ptr [rdi + 8]
0xd9254a: call 0x1435caec0
0xd9254f: mov rcx, rdi
0xd92552: call 0x1435c66a0
0xd92557: mov ebx, dword ptr [rsp + 0x70]
0xd9255b: lea r8, [rip + 0x47e0f4a]
0xd92562: inc ebp
0xd92564: add r15, 8
0xd92568: cmp ebp, r13d
0xd9256b: jb 0x140d923f0
0xd92571: mov r15, qword ptr [rsp + 0x30]
0xd92576: mov rdi, qword ptr [rsp + 0x40]
0xd9257b: mov rsi, qword ptr [rsp + 0x48]
0xd92580: mov rbp, qword ptr [rsp + 0x50]
0xd92585: mov r13, qword ptr [rsp + 0x38]
0xd9258a: mov dword ptr [r12 + 0x654], ebx
0xd92592: mov rbx, qword ptr [rsp + 0x88]
0xd9259a: add rsp, 0x58
0xd9259e: pop r14
0xd925a0: pop r12
0xd925a2: ret 
0xd925a3: int3 
0xd925a4: int3 
0xd925a5: int3 
0xd925a6: int3 
0xd925a7: int3 
0xd925a8: int3 
0xd925a9: int3 
0xd925aa: int3 
0xd925ab: int3 
0xd925ac: int3 
0xd925ad: int3 
0xd925ae: int3 
0xd925af: int3 
0xd925b0: push r12
0xd925b2: push r14
0xd925b4: sub rsp, 0x58
0xd925b8: mov rax, qword ptr [rcx + 0x618]
0xd925bf: mov r12, rcx
0xd925c2: mov rdx, qword ptr [rax + 0xc8]
0xd925c9: mov r14, qword ptr [rdx + 0x108]
0xd925d0: test r14, r14
0xd925d3: je 0x140d9291a
0xd925d9: mov rax, qword ptr [rcx + 0x610]
0xd925e0: mov qword ptr [rsp + 0x88], rbx
0xd925e8: mov qword ptr [rsp + 0x40], rdi
0xd925ed: mov edi, dword ptr [rax + 0xe0]
0xd925f3: cmp edi, 0xe