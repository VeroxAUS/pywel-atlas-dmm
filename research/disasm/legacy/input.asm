0xdbaba0: mov qword ptr [rsp + 0x20], rbx
0xdbaba5: push rbp
0xdbaba6: push rsi
0xdbaba7: push rdi
0xdbaba8: push r12
0xdbabaa: push r13
0xdbabac: push r14
0xdbabae: push r15
0xdbabb0: lea rbp, [rsp - 0x12e0]
0xdbabb8: mov eax, 0x13e0
0xdbabbd: call 0x1448962c0
0xdbabc2: sub rsp, rax
0xdbabc5: vmovaps xmmword ptr [rsp + 0x13d0], xmm6
0xdbabce: vmovaps xmmword ptr [rsp + 0x13c0], xmm7
0xdbabd7: vmovaps xmmword ptr [rsp + 0x13b0], xmm8
0xdbabe0: vmovaps xmmword ptr [rsp + 0x13a0], xmm9
0xdbabe9: movzx r14d, r9b
0xdbabed: mov rbx, r8
0xdbabf0: mov r8, rdx
0xdbabf3: mov rsi, rcx
0xdbabf6: xor edi, edi
0xdbabf8: mov dword ptr [rsp + 0x30], edi
0xdbabfc: test rdx, rdx
0xdbabff: je 0x140dbac14
0xdbac01: mov rax, qword ptr [rdx]
0xdbac04: lea rdx, [rip + 0x5f14275]
0xdbac0b: mov rcx, r8
0xdbac0e: call qword ptr [rax + 0x190]
0xdbac14: test rbx, rbx
0xdbac17: je 0x140dbac34
0xdbac19: mov rax, qword ptr [rbx]
0xdbac1c: lea rdx, [rip + 0x5f14265]
0xdbac23: mov rcx, rbx
0xdbac26: call qword ptr [rax + 0x190]
0xdbac2c: test al, al
0xdbac2e: cmove rbx, rdi
0xdbac32: jmp 0x140dbac37
0xdbac34: mov rbx, rdi
0xdbac37: mov ecx, edi
0xdbac39: mov edx, dword ptr [rsi + 0x688]
0xdbac3f: test edx, edx
0xdbac41: je 0x140dbac62
0xdbac43: mov r8, qword ptr [rsi + 0x680]
0xdbac4a: nop word ptr [rax + rax]
0xdbac50: mov eax, ecx
0xdbac52: cmp rbx, qword ptr [r8 + rax*8]
0xdbac56: je 0x140dbacea
0xdbac5c: inc ecx
0xdbac5e: cmp ecx, edx
0xdbac60: jb 0x140dbac50
0xdbac62: cmp qword ptr [rsi + 0x690], rbx
0xdbac69: jne 0x140dbafcf
0xdbac6f: test r14b, r14b
0xdbac72: jne 0x140dbafcf
0xdbac78: mov rax, qword ptr [rsi + 0xb38]
0xdbac7f: cmp byte ptr [rax + 0xf2], dil
0xdbac86: jne 0x140dbc5ff
0xdbac8c: mov rcx, qword ptr [rsi + 0xb10]
0xdbac93: call 0x140cb6bd0
0xdbac98: mov rcx, qword ptr [rsi + 0xb38]
0xdbac9f: mov rax, qword ptr [rcx]
0xdbaca2: call qword ptr [rax + 0x20]
0xdbaca5: mov rax, qword ptr [rsi + 0xb38]
0xdbacac: mov byte ptr [rax + 0xf2], 1
0xdbacb3: mov rcx, rsi
0xdbacb6: call 0x140dd3ee0
0xdbacbb: mov rcx, rsi
0xdbacbe: call 0x140dd3950
0xdbacc3: mov rcx, qword ptr [rsi + 0x670]
0xdbacca: mov rax, qword ptr [rcx]
0xdbaccd: call qword ptr [rax + 0x28]
0xdbacd0: mov rax, qword ptr [rsi + 0x670]
0xdbacd7: mov byte ptr [rax + 0xf2], dil
0xdbacde: mov byte ptr [rsi + 0xbf0], 1
0xdbace5: jmp 0x140dbc5ff
0xdbacea: test r14b, r14b
0xdbaced: jne 0x140dbac62
0xdbacf3: mov rax, qword ptr gs:[0x58]
0xdbacfc: mov rcx, qword ptr [rax]
0xdbacff: mov edx, 0x1ec
0xdbad04: mov rax, qword ptr [rip + 0x5fae81d]
0xdbad0b: cmp byte ptr [rdx + rcx], dil
0xdbad0f: cmovne rax, qword ptr [rip + 0x5fae819]
0xdbad17: mov rax, qword ptr [rax]
0xdbad1a: mov rcx, qword ptr [rax + 8]
0xdbad1e: mov rcx, qword ptr [rcx + 0x270]
0xdbad25: add rcx, 0xd6
0xdbad2c: call 0x140537250
0xdbad31: mov r9d, dword ptr [rax]
0xdbad34: mov qword ptr [rsp + 0x68], rdi
0xdbad39: mov byte ptr [rsp + 0x70], 0x15
0xdbad3e: xor eax, eax
0xdbad40: mov dword ptr [rsp + 0x71], eax
0xdbad44: mov word ptr [rsp + 0x75], ax
0xdbad49: mov byte ptr [rsp + 0x77], al
0xdbad4d: cmp dword ptr [rsi + 0x15c], eax
0xdbad53: je 0x140dbadc3
0xdbad55: mov ecx, dword ptr [rsi + 0x158]
0xdbad5b: test ecx, ecx
0xdbad5d: je 0x140dbadc3
0xdbad5f: xor edx, edx
0xdbad61: mov eax, r9d
0xdbad64: div ecx
0xdbad66: mov r8d, edx
0xdbad69: shl r8, 8
0xdbad6d: add r8, qword ptr [rsi + 0x168]
0xdbad74: mov edx, edi
0xdbad76: mov r11d, dword ptr [r8]
0xdbad79: test r11d, r11d
0xdbad7c: je 0x140dbadc3
0xdbad7e: nop 
0xdbad80: mov eax, edx
0xdbad82: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdbad87: jne 0x140dbad9f
0xdbad89: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdbad8e: mov rax, qword ptr [rsi + 0x170]
0xdbad95: mov r10, qword ptr [rax + rcx*8]
0xdbad99: cmp dword ptr [r10 + 4], r9d
0xdbad9d: je 0x140dbada8
0xdbad9f: inc edx
0xdbada1: cmp edx, r11d
0xdbada4: jb 0x140dbad80
0xdbada6: jmp 0x140dbadc3
0xdbada8: lea rcx, [r10 + 8]
0xdbadac: test rcx, rcx
0xdbadaf: je 0x140dbadc3
0xdbadb1: lea rdx, [rsp + 0x68]
0xdbadb6: call 0x140de4500
0xdbadbb: test rax, rax
0xdbadbe: je 0x140dbadc3
0xdbadc0: mov rdi, qword ptr [rax]
0xdbadc3: mov rcx, qword ptr [rsi + 0x5c0]
0xdbadca: test rcx, rcx
0xdbadcd: je 0x140dbafc2
0xdbadd3: test rdi, rdi
0xdbadd6: je 0x140dbafc2
0xdbaddc: vmovups xmm0, xmmword ptr [rcx + 0xc8]
0xdbade4: vmovups xmmword ptr [rsp + 0x38], xmm0
0xdbadea: vxorps xmm6, xmm6, xmm6
0xdbadee: mov r13d, 0xffff
0xdbadf4: vpextrb eax, xmm0, 8
0xdbadfa: cmp al, 4
0xdbadfc: jne 0x140dbae43
0xdbadfe: movzx eax, word ptr [rsp + 0x38]
0xdbae03: mov word ptr [rbp + 0x1320], ax
0xdbae0a: cmp ax, r13w
0xdbae0e: je 0x140dbae33
0xdbae10: lea rcx, [rbp + 0x1320]
0xdbae17: call 0x140430020
0xdbae1c: vmovsd xmm7, qword ptr [rax + 0x48]
0xdbae21: vmovss xmm8, dword ptr [rax + 0x50]
0xdbae26: vshufps xmm9, xmm7, xmm7, 0x55
0xdbae2b: vmovsd qword ptr [rsp + 0x38], xmm7
0xdbae31: jmp 0x140dbae62
0xdbae33: vxorps xmm9, xmm9, xmm9
0xdbae38: vxorps xmm8, xmm8, xmm8
0xdbae3d: vxorps xmm7, xmm7, xmm7
0xdbae41: jmp 0x140dbae62
0xdbae43: vmovsd xmm0, qword ptr [rcx + 0xe0]
0xdbae4b: vmovaps xmm7, xmm0
0xdbae4f: vmovss xmm8, dword ptr [rcx + 0xe8]
0xdbae57: vshufps xmm9, xmm0, xmm0, 0x55
0xdbae5c: vmovsd qword ptr [rsp + 0x38], xmm0
0xdbae62: vmovups xmm0, xmmword ptr [rdi + 0xc8]
0xdbae6a: vmovups xmmword ptr [rsp + 0x38], xmm0
0xdbae70: vpextrb eax, xmm0, 8
0xdbae76: cmp al, 4
0xdbae78: jne 0x140dbaeb3
0xdbae7a: movzx eax, word ptr [rsp + 0x38]
0xdbae7f: mov word ptr [rbp + 0x1320], ax
0xdbae86: cmp ax, r13w
0xdbae8a: je 0x140dbaea9
0xdbae8c: lea rcx, [rbp + 0x1320]
0xdbae93: call 0x140430020
0xdbae98: vmovsd xmm1, qword ptr [rax + 0x48]
0xdbae9d: vmovss xmm6, dword ptr [rax + 0x50]
0xdbaea2: vshufps xmm2, xmm1, xmm1, 0x55
0xdbaea7: jmp 0x140dbaecc
0xdbaea9: vxorps xmm2, xmm2, xmm2
0xdbaead: vxorps xmm1, xmm1, xmm1
0xdbaeb1: jmp 0x140dbaecc
0xdbaeb3: vmovsd xmm0, qword ptr [rdi + 0xe0]
0xdbaebb: vmovaps xmm1, xmm0
0xdbaebf: vmovss xmm6, dword ptr [rdi + 0xe8]
0xdbaec7: vshufps xmm2, xmm0, xmm0, 0x55
0xdbaecc: vucomiss xmm7, xmm1
0xdbaed0: jp 0x140dbafc2
0xdbaed6: jne 0x140dbafc2
0xdbaedc: vucomiss xmm9, xmm2
0xdbaee0: jp 0x140dbafc2
0xdbaee6: jne 0x140dbafc2
0xdbaeec: vucomiss xmm8, xmm6
0xdbaef0: jp 0x140dbafc2
0xdbaef6: jne 0x140dbafc2
0xdbaefc: mov dl, 1
0xdbaefe: mov rcx, rsi
0xdbaf01: call 0x140dc35c0
0xdbaf06: mov rax, qword ptr [rip + 0x5fae2db]
0xdbaf0d: mov rcx, qword ptr [rax + 0xa8]
0xdbaf14: cmp byte ptr [rcx + 8], 2
0xdbaf18: jne 0x140dbaf3c
0xdbaf1a: mov byte ptr [rbp + 0x1320], 0
0xdbaf21: mov word ptr [rbp + 0x1328], r13w
0xdbaf29: lea r8, [rbp + 0x1320]
0xdbaf30: lea rdx, [rbp + 0x1328]
0xdbaf37: call 0x1406599f0
0xdbaf3c: mov rax, qword ptr [rsi]
0xdbaf3f: mov rcx, rsi
0xdbaf42: call qword ptr [rax + 0x110]
0xdbaf48: call 0x140defcf0
0xdbaf4d: nop 
0xdbaf4e: lea rdx, [rsp + 0x48]
0xdbaf53: mov rcx, qword ptr [rip + 0x5fae236]
0xdbaf5a: mov rcx, qword ptr [rcx + 0x30]
0xdbaf5e: call 0x1408b44e0
0xdbaf63: mov ebx, 1
0xdbaf68: mov dword ptr [rsp + 0x30], ebx
0xdbaf6c: cmp byte ptr [rsp + 0x58], bl
0xdbaf70: jne 0x140dbafa0
0xdbaf72: mov byte ptr [rbp + 0x1320], 0
0xdbaf79: mov rax, qword ptr [rsp + 0x50]
0xdbaf7e: mov rcx, qword ptr [rax + 0x68]
0xdbaf82: mov rcx, qword ptr [rcx + 0x168]
0xdbaf89: lea r9, [rbp + 0x1320]
0xdbaf90: lea r8, [rip + 0x478aef1]
0xdbaf97: mov rcx, qword ptr [rcx + 8]
0xdbaf9b: call 0x140b85340
0xdbafa0: and ebx, 0xfffffffe
0xdbafa3: mov dword ptr [rsp + 0x30], ebx
0xdbafa7: lea rax, [rip + 0x496ae9a]
0xdbafae: mov qword ptr [rsp + 0x48], rax
0xdbafb3: lea rcx, [rsp + 0x48]
0xdbafb8: call 0x141434880
0xdbafbd: jmp 0x140dbc5ff
0xdbafc2: mov rcx, rsi
0xdbafc5: call 0x140dc32e0
0xdbafca: jmp 0x140dbc5ff
0xdbafcf: cmp qword ptr [rsi + 0xb40], rbx
0xdbafd6: jne 0x140dbb1c4
0xdbafdc: test r14b, r14b
0xdbafdf: jne 0x140dbb1c4
0xdbafe5: cmp dword ptr [rsi + 0xbf8], 5
0xdbafec: jne 0x140dbb0b4
0xdbaff2: mov rax, qword ptr [rbp + 0x1348]
0xdbaff9: vmovss xmm0, dword ptr [rax + 4]
0xdbaffe: vxorps xmm1, xmm1, xmm1
0xdbb002: vcomiss xmm0, xmm1
0xdbb006: jbe 0x140dbb087
0xdbb008: mov rdi, qword ptr [rsi + 0xb28]
0xdbb00f: mov eax, 0x134
0xdbb014: mov ecx, 0x138
0xdbb019: cmp byte ptr [rdi + 0x150], r14b
0xdbb020: cmove eax, ecx
0xdbb023: mov r8d, dword ptr [rax + rdi]
0xdbb027: mov r9d, dword ptr [rdi + 0x120]
0xdbb02e: cmp r9d, r8d
0xdbb031: jae 0x140dbb05a
0xdbb033: mov eax, dword ptr [rdi + 0x104]
0xdbb039: dec eax
0xdbb03b: xor edx, edx
0xdbb03d: div r8d
0xdbb040: mov ecx, edx
0xdbb042: mov ebx, eax
0xdbb044: xor edx, edx
0xdbb046: mov eax, r9d
0xdbb049: div r8d
0xdbb04c: cmp ecx, edx
0xdbb04e: jae 0x140dbb052
0xdbb050: dec ebx
0xdbb052: imul ebx, r8d
0xdbb056: add ebx, edx
0xdbb058: jmp 0x140dbb060
0xdbb05a: mov ebx, r9d
0xdbb05d: sub ebx, r8d
0xdbb060: mov rax, qword ptr [rdi]
0xdbb063: xor r8d, r8d
0xdbb066: mov edx, ebx
0xdbb068: mov rcx, rdi
0xdbb06b: call qword ptr [rax + 0x538]
0xdbb071: xor r9d, r9d
0xdbb074: movzx r8d, al
0xdbb078: mov edx, ebx
0xdbb07a: mov rcx, rdi
0xdbb07d: call 0x140ce72e0
0xdbb082: jmp 0x140dbc5ff
0xdbb087: vcomiss xmm1, xmm0
0xdbb08b: jbe 0x140dbc5ff
0xdbb091: mov rbx, qword ptr [rsi + 0xb28]
0xdbb098: mov eax, 0x134
0xdbb09d: mov ecx, 0x138
0xdbb0a2: cmp byte ptr [rbx + 0x150], dil
0xdbb0a9: cmove eax, ecx
0xdbb0ac: mov ecx, dword ptr [rax + rbx]
0xdbb0af: jmp 0x140dbb186
0xdbb0b4: mov eax, 0xb20
0xdbb0b9: mov ecx, 0xb18
0xdbb0be: cmp byte ptr [rsi + 0xbf2], dil
0xdbb0c5: cmove eax, ecx
0xdbb0c8: mov rbx, qword ptr [rax + rsi]
0xdbb0cc: test rbx, rbx
0xdbb0cf: je 0x140dbc5ff
0xdbb0d5: mov r14, qword ptr [rbp + 0x1348]
0xdbb0dc: vmovss xmm0, dword ptr [r14 + 4]
0xdbb0e2: vxorps xmm6, xmm6, xmm6
0xdbb0e6: vcomiss xmm0, xmm6
0xdbb0ea: jbe 0x140dbb161
0xdbb0ec: cmp byte ptr [rbx + 0x150], dil
0xdbb0f3: lea r8, [rbx + 0x134]
0xdbb0fa: jne 0x140dbb103
0xdbb0fc: lea r8, [rbx + 0x138]
0xdbb103: mov r8d, dword ptr [r8]
0xdbb106: mov r9d, dword ptr [rbx + 0x120]
0xdbb10d: cmp r9d, r8d
0xdbb110: jae 0x140dbb139
0xdbb112: mov eax, dword ptr [rbx + 0x104]
0xdbb118: dec eax
0xdbb11a: xor edx, edx
0xdbb11c: div r8d
0xdbb11f: mov ecx, edx
0xdbb121: mov edi, eax
0xdbb123: xor edx, edx
0xdbb125: mov eax, r9d
0xdbb128: div r8d
0xdbb12b: cmp ecx, edx
0xdbb12d: jae 0x140dbb131
0xdbb12f: dec edi
0xdbb131: imul edi, r8d
0xdbb135: add edi, edx
0xdbb137: jmp 0x140dbb13f
0xdbb139: mov edi, r9d
0xdbb13c: sub edi, r8d
0xdbb13f: mov rax, qword ptr [rbx]
0xdbb142: xor r8d, r8d
0xdbb145: mov edx, edi
0xdbb147: mov rcx, rbx
0xdbb14a: call qword ptr [rax + 0x538]
0xdbb150: xor r9d, r9d
0xdbb153: movzx r8d, al
0xdbb157: mov edx, edi
0xdbb159: mov rcx, rbx
0xdbb15c: call 0x140ce72e0
0xdbb161: vcomiss xmm6, dword ptr [r14 + 4]
0xdbb167: jbe 0x140dbc5ff
0xdbb16d: cmp byte ptr [rbx + 0x150], 0
0xdbb174: lea rax, [rbx + 0x134]
0xdbb17b: jne 0x140dbb184
0xdbb17d: lea rax, [rbx + 0x138]
0xdbb184: mov ecx, dword ptr [rax]
0xdbb186: mov eax, dword ptr [rbx + 0x120]
0xdbb18c: lea edi, [rcx + rax]
0xdbb18f: cmp edi, dword ptr [rbx + 0x104]
0xdbb195: jb 0x140dbb19d
0xdbb197: xor edx, edx
0xdbb199: div ecx
0xdbb19b: mov edi, edx
0xdbb19d: mov rax, qword ptr [rbx]
0xdbb1a0: xor r8d, r8d
0xdbb1a3: mov edx, edi
0xdbb1a5: mov rcx, rbx
0xdbb1a8: call qword ptr [rax + 0x538]
0xdbb1ae: xor r9d, r9d
0xdbb1b1: movzx r8d, al
0xdbb1b5: mov edx, edi
0xdbb1b7: mov rcx, rbx
0xdbb1ba: call 0x140ce72e0
0xdbb1bf: jmp 0x140dbc5ff
0xdbb1c4: cmp qword ptr [rsi + 0xb70], rbx
0xdbb1cb: jne 0x140dbb30e
0xdbb1d1: test r14b, r14b
0xdbb1d4: jne 0x140dbb1f5
0xdbb1d6: vxorps xmm0, xmm0, xmm0
0xdbb1da: mov rax, qword ptr [rbp + 0x1348]
0xdbb1e1: vcomiss xmm0, dword ptr [rax]
0xdbb1e5: seta dl
0xdbb1e8: mov rcx, rsi
0xdbb1eb: call 0x140dd3720
0xdbb1f0: jmp 0x140dbc5ff
0xdbb1f5: cmp r14b, 2
0xdbb1f9: jne 0x140dbc5ff
0xdbb1ff: mov eax, 0xb20
0xdbb204: mov ecx, 0xb18
0xdbb209: cmp byte ptr [rsi + 0xbf2], dil
0xdbb210: cmove eax, ecx
0xdbb213: mov rbx, qword ptr [rax + rsi]
0xdbb217: test rbx, rbx
0xdbb21a: je 0x140dbc5ff
0xdbb220: mov rdx, qword ptr [rbp + 0x1348]
0xdbb227: vmovss xmm1, dword ptr [rdx]
0xdbb22b: vxorps xmm0, xmm0, xmm0
0xdbb22f: vucomiss xmm1, xmm0
0xdbb233: jp 0x140dbb23b
0xdbb235: je 0x140dbc5ff
0xdbb23b: mov byte ptr [rbp + 0x1320], dil
0xdbb242: lea r9, [rbp + 0x1320]
0xdbb249: mov rcx, rbx
0xdbb24c: call 0x140ce6ff0
0xdbb251: cmp byte ptr [rbp + 0x1320], dil
0xdbb258: je 0x140dbc5ff
0xdbb25e: mov r9d, dword ptr [rbx + 0x120]
0xdbb265: cmp r9d, dword ptr [rbx + 0x170]
0xdbb26c: jae 0x140dbc5ff
0xdbb272: mov rax, qword ptr [rbx + 0x168]
0xdbb279: mov rdx, qword ptr [rax + r9*8]
0xdbb27d: test rdx, rdx
0xdbb280: je 0x140dbc5ff
0xdbb286: mov eax, dword ptr [rdx + 0x38]
0xdbb289: test eax, eax
0xdbb28b: sete cl
0xdbb28e: test eax, eax
0xdbb290: jne 0x140dbb299
0xdbb292: mov eax, dword ptr [rdx + 0x18]
0xdbb295: test eax, eax
0xdbb297: je 0x140dbb2fe
0xdbb299: mov rax, qword ptr [rdx + 0x48]
0xdbb29d: test rax, rax
0xdbb2a0: jne 0x140dbb2ab
0xdbb2a2: mov rax, qword ptr [rdx + 0x58]
0xdbb2a6: test rax, rax
0xdbb2a9: je 0x140dbb2c1
0xdbb2ab: mov byte ptr [rax + 0x12], cl
0xdbb2ae: mov r8b, 1
0xdbb2b1: mov edx, r9d
0xdbb2b4: mov rcx, rbx
0xdbb2b7: call 0x140ce8650
0xdbb2bc: jmp 0x140dbc5ff
0xdbb2c1: cmp dword ptr [rdx + 0x40], edi
0xdbb2c4: jne 0x140dbb2eb
0xdbb2c6: cmp rbx, qword ptr [rsi + 0xb18]
0xdbb2cd: setne dil
0xdbb2d1: cmp edi, dword ptr [rsi + 0xb98]
0xdbb2d7: jae 0x140dbb2eb
0xdbb2d9: mov eax, edi
0xdbb2db: lea r8, [rax + rax*4]
0xdbb2df: mov rax, qword ptr [rsi + 0xb90]
0xdbb2e6: mov byte ptr [rax + r8*8 + 0x21], cl
0xdbb2eb: mov r8b, 1
0xdbb2ee: mov edx, r9d
0xdbb2f1: mov rcx, rbx
0xdbb2f4: call 0x140ce8650
0xdbb2f9: jmp 0x140dbc5ff
0xdbb2fe: mov rdx, rbx
0xdbb301: mov rcx, rsi
0xdbb304: call 0x140dd1820
0xdbb309: jmp 0x140dbc5ff
0xdbb30e: cmp qword ptr [rsi + 0xb48], rbx
0xdbb315: je 0x140dbb320
0xdbb317: cmp qword ptr [rsi + 0xb58], rbx
0xdbb31e: jne 0x140dbb393
0xdbb320: test r14b, r14b
0xdbb323: jne 0x140dbb393
0xdbb325: cmp dword ptr [rsi + 0xbf8], 5
0xdbb32c: jne 0x140dbb33b
0xdbb32e: mov rcx, rsi
0xdbb331: call 0x140dd2370
0xdbb336: jmp 0x140dbc5ff
0xdbb33b: movzx r8d, byte ptr [rsi + 0xbf2]
0xdbb343: mov eax, 0xb20
0xdbb348: mov ecx, 0xb18
0xdbb34d: test r8b, r8b
0xdbb350: cmove eax, ecx
0xdbb353: mov rdx, qword ptr [rax + rsi]
0xdbb357: test rdx, rdx
0xdbb35a: je 0x140dbc5ff
0xdbb360: mov eax, dword ptr [rdx + 0x120]
0xdbb366: cmp eax, dword ptr [rdx + 0x170]
0xdbb36c: jae 0x140dbc5ff
0xdbb372: mov ecx, eax
0xdbb374: mov rax, qword ptr [rdx + 0x168]
0xdbb37b: mov rax, qword ptr [rax + rcx*8]
0xdbb37f: test rax, rax
0xdbb382: je 0x140dbc5ff
0xdbb388: test r8b, r8b
0xdbb38b: je 0x140dbb301
0xdbb391: jmp 0x140dbb3f3
0xdbb393: cmp qword ptr [rsi + 0xb50], rbx
0xdbb39a: jne 0x140dbb41a
0xdbb39c: test r14b, r14b
0xdbb39f: jne 0x140dbb41a
0xdbb3a1: movzx r8d, byte ptr [rsi + 0xbf2]
0xdbb3a9: mov eax, 0xb20
0xdbb3ae: mov ecx, 0xb18
0xdbb3b3: test r8b, r8b
0xdbb3b6: cmove eax, ecx
0xdbb3b9: mov rdx, qword ptr [rax + rsi]
0xdbb3bd: test rdx, rdx
0xdbb3c0: je 0x140dbc5ff
0xdbb3c6: mov eax, dword ptr [rdx + 0x120]
0xdbb3cc: cmp eax, dword ptr [rdx + 0x170]
0xdbb3d2: jae 0x140dbc5ff
0xdbb3d8: mov ecx, eax
0xdbb3da: mov rax, qword ptr [rdx + 0x168]
0xdbb3e1: mov rax, qword ptr [rax + rcx*8]
0xdbb3e5: test rax, rax
0xdbb3e8: je 0x140dbc5ff
0xdbb3ee: test r8b, r8b
0xdbb3f1: je 0x140dbb40d
0xdbb3f3: mov rax, qword ptr [rax + 0x50]
0xdbb3f7: test rax, rax
0xdbb3fa: je 0x140dbb40d
0xdbb3fc: mov r13d, 0xffff
0xdbb402: cmp word ptr [rax + 0x20], r13w
0xdbb407: jne 0x140dbb301
0xdbb40d: mov rcx, rsi
0xdbb410: call 0x140dd1f20
0xdbb415: jmp 0x140dbc5ff
0xdbb41a: cmp qword ptr [rsi + 0xb68], rbx
0xdbb421: jne 0x140dbb678
0xdbb427: cmp byte ptr [rsi + 0xbf2], dil
0xdbb42e: jne 0x140dbc5ff
0xdbb434: lea rdx, [rsp + 0x48]
0xdbb439: call 0x14064f4f0
0xdbb43e: nop 
0xdbb43f: cmp byte ptr [rsp + 0x58], 0
0xdbb444: je 0x140dbb65d
0xdbb44a: cmp qword ptr [rsi + 0xb30], 0
0xdbb452: je 0x140dbb65d
0xdbb458: mov rdx, qword ptr [rsi + 0xb90]
0xdbb45f: mov qword ptr [rsp + 0x78], rdx
0xdbb464: mov eax, dword ptr [rsi + 0xb98]
0xdbb46a: lea rcx, [rax + rax*4]
0xdbb46e: lea rax, [rdx + rcx*8]
0xdbb472: mov qword ptr [rsp + 0x68], rax
0xdbb477: cmp rdx, rax
0xdbb47a: je 0x140dbb631
0xdbb480: mov r13d, 0xffff
0xdbb486: nop word ptr [rax + rax]
0xdbb490: mov r12, qword ptr [rdx]
0xdbb493: mov eax, dword ptr [rdx + 8]
0xdbb496: lea rcx, [rax + rax*2]
0xdbb49a: lea rax, [r12 + rcx*8]
0xdbb49e: mov qword ptr [rbp - 0x80], rax
0xdbb4a2: cmp r12, rax
0xdbb4a5: je 0x140dbb61d
0xdbb4ab: nop dword ptr [rax + rax]
0xdbb4b0: mov rax, qword ptr [rsi + 0xb30]
0xdbb4b7: movzx ebx, byte ptr [rax + 0x11c]
0xdbb4be: lea rcx, [r12 + 0x10]
0xdbb4c3: call 0x1404a2cc0
0xdbb4c8: cmp byte ptr [rax + 0x4a], bl
0xdbb4cb: jne 0x140dbb60a
0xdbb4d1: mov rax, qword ptr [rsi + 0xb30]
0xdbb4d8: cmp byte ptr [rax + 0x130], 0
0xdbb4df: sete r14b
0xdbb4e3: mov rdi, qword ptr [r12]
0xdbb4e7: mov eax, dword ptr [r12 + 8]
0xdbb4ec: lea rcx, [rax + rax*4]
0xdbb4f0: lea rcx, [rdi + rcx*8]
0xdbb4f4: mov qword ptr [rbp + 0x1330], rcx
0xdbb4fb: cmp rdi, rcx
0xdbb4fe: je 0x140dbb60a
0xdbb504: cmp byte ptr [rdi + 0x24], r14b
0xdbb508: je 0x140dbb5fd
0xdbb50e: cmp byte ptr [rdi + 0x25], 0
0xdbb512: je 0x140dbb5fd
0xdbb518: mov eax, dword ptr [rdi + 8]
0xdbb51b: test eax, eax
0xdbb51d: jne 0x140dbb528
0xdbb51f: cmp dword ptr [rdi + 0x18], eax
0xdbb522: je 0x140dbb5fd
0xdbb528: mov rbx, qword ptr [rdi]
0xdbb52b: lea r15, [rbx + rax*2]
0xdbb52f: cmp rbx, r15
0xdbb532: je 0x140dbb558
0xdbb534: nop dword ptr [rax]
0xdbb538: nop dword ptr [rax + rax]
0xdbb540: movzx r8d, r14b
0xdbb544: movzx edx, word ptr [rbx]
0xdbb547: mov rcx, rsi
0xdbb54a: call 0x140dd2130
0xdbb54f: add rbx, 2
0xdbb553: cmp rbx, r15
0xdbb556: jne 0x140dbb540
0xdbb558: mov rbx, qword ptr [rdi + 0x10]
0xdbb55c: mov eax, dword ptr [rdi + 0x18]
0xdbb55f: lea r15, [rbx + rax*4]
0xdbb563: cmp rbx, r15
0xdbb566: je 0x140dbb587
0xdbb568: nop dword ptr [rax + rax]
0xdbb570: movzx r8d, r14b
0xdbb574: mov edx, dword ptr [rbx]
0xdbb576: mov rcx, rsi
0xdbb579: call 0x140dd2240
0xdbb57e: add rbx, 4
0xdbb582: cmp rbx, r15
0xdbb585: jne 0x140dbb570
0xdbb587: mov byte ptr [rdi + 0x24], r14b
0xdbb58b: mov rax, qword ptr [rsp + 0x50]
0xdbb590: mov rcx, qword ptr [rax + 0x68]
0xdbb594: mov rbx, qword ptr [rcx + 0x168]
0xdbb59b: movzx ecx, word ptr [rdi + 0x22]
0xdbb59f: mov word ptr [rbp + 0x1328], cx
0xdbb5a6: movzx eax, word ptr [r12 + 0x10]
0xdbb5ac: mov word ptr [rbp + 0x1320], ax
0xdbb5b3: cmp ax, r13w
0xdbb5b7: je 0x140dbb5f6
0xdbb5b9: cmp cx, r13w
0xdbb5bd: je 0x140dbb5f6
0xdbb5bf: lea rcx, [rbp + 0x1320]
0xdbb5c6: call 0x1404a2cc0
0xdbb5cb: mov edx, dword ptr [rax]
0xdbb5cd: mov dword ptr [rsp + 0x38], edx
0xdbb5d1: lea rcx, [rbp + 0x1328]
0xdbb5d8: call 0x140388e00
0xdbb5dd: mov edx, dword ptr [rax]
0xdbb5df: mov dword ptr [rsp + 0x3c], edx
0xdbb5e3: mov byte ptr [rsp + 0x40], r14b
0xdbb5e8: lea r8, [rsp + 0x38]
0xdbb5ed: mov rcx, qword ptr [rbx + 8]
0xdbb5f1: call 0x140b854f0
0xdbb5f6: mov rcx, qword ptr [rbp + 0x1330]
0xdbb5fd: add rdi, 0x28
0xdbb601: cmp rdi, rcx
0xdbb604: jne 0x140dbb504
0xdbb60a: add r12, 0x18
0xdbb60e: cmp r12, qword ptr [rbp - 0x80]
0xdbb612: jne 0x140dbb4b0
0xdbb618: mov rdx, qword ptr [rsp + 0x78]
0xdbb61d: add rdx, 0x28
0xdbb621: mov qword ptr [rsp + 0x78], rdx
0xdbb626: cmp rdx, qword ptr [rsp + 0x68]
0xdbb62b: jne 0x140dbb490
0xdbb631: mov rcx, rsi
0xdbb634: call 0x140dd3ee0
0xdbb639: mov rcx, rsi
0xdbb63c: call 0x140dd3950
0xdbb641: nop 
0xdbb642: lea rax, [rip + 0x496a7ff]
0xdbb649: mov qword ptr [rsp + 0x48], rax
0xdbb64e: lea rcx, [rsp + 0x48]
0xdbb653: call 0x141434880
0xdbb658: jmp 0x140dbc5ff
0xdbb65d: lea rax, [rip + 0x496a7e4]
0xdbb664: mov qword ptr [rsp + 0x48], rax
0xdbb669: lea rcx, [rsp + 0x48]
0xdbb66e: call 0x141434880
0xdbb673: jmp 0x140dbc5ff
0xdbb678: cmp qword ptr [rsi + 0xb78], rbx
0xdbb67f: jne 0x140dbb7c2
0xdbb685: test r14b, r14b
0xdbb688: jne 0x140dbb7c2
0xdbb68e: movzx ecx, byte ptr [rsi + 0xbf2]
0xdbb695: test cl, cl
0xdbb697: sete al
0xdbb69a: mov byte ptr [rsi + 0xbf2], al
0xdbb6a0: mov rax, qword ptr [rsi + 0xb18]
0xdbb6a7: mov rdx, qword ptr [rax + 8]
0xdbb6ab: mov rbx, qword ptr [rdx + 0x20]
0xdbb6af: mov rax, qword ptr [rbx]
0xdbb6b2: test cl, cl
0xdbb6b4: mov rcx, qword ptr [rax + 0xa0]
0xdbb6bb: jne 0x140dbb734
0xdbb6bd: test rcx, rcx
0xdbb6c0: je 0x140dbb6c8
0xdbb6c2: cmp qword ptr [rcx + 8], rdi
0xdbb6c6: jne 0x140dbb6f5
0xdbb6c8: cmp dword ptr [rip + 0x5f1394a], edi
0xdbb6ce: je 0x140dbb6f5
0xdbb6d0: lea rdx, [rip + 0x5f13941]
0xdbb6d7: mov rcx, qword ptr [rbx + 8]
0xdbb6db: call 0x1435ca0a0
0xdbb6e0: test al, al
0xdbb6e2: je 0x140dbb6f5
0xdbb6e4: mov rcx, qword ptr [rbx + 8]
0xdbb6e8: call 0x1435caec0
0xdbb6ed: mov rcx, rbx
0xdbb6f0: call 0x1435c66a0
0xdbb6f5: mov rax, qword ptr [rsi + 0xb20]
0xdbb6fc: mov rcx, qword ptr [rax + 8]
0xdbb700: mov rbx, qword ptr [rcx + 0x20]
0xdbb704: mov rax, qword ptr [rbx]
0xdbb707: mov rcx, qword ptr [rax + 0xa0]
0xdbb70e: test rcx, rcx
0xdbb711: je 0x140dbb71d
0xdbb713: cmp qword ptr [rcx + 8], rdi
0xdbb717: jne 0x140dbb7ad
0xdbb71d: lea rdx, [rip + 0x5f138f4]
0xdbb724: mov rcx, qword ptr [rbx + 8]
0xdbb728: call 0x1435ca140
0xdbb72d: cmp eax, -1
0xdbb730: je 0x140dbb7ad
0xdbb732: jmp 0x140dbb7a5
0xdbb734: test rcx, rcx
0xdbb737: je 0x140dbb73f
0xdbb739: cmp qword ptr [rcx + 8], rdi
0xdbb73d: jne 0x140dbb75c
0xdbb73f: lea rdx, [rip + 0x5f138d2]
0xdbb746: mov rcx, qword ptr [rbx + 8]
0xdbb74a: call 0x1435ca140
0xdbb74f: cmp eax, -1
0xdbb752: je 0x140dbb75c
0xdbb754: mov rcx, rbx
0xdbb757: call 0x1435c66a0
0xdbb75c: mov rax, qword ptr [rsi + 0xb20]
0xdbb763: mov rcx, qword ptr [rax + 8]
0xdbb767: mov rbx, qword ptr [rcx + 0x20]
0xdbb76b: mov rax, qword ptr [rbx]
0xdbb76e: mov rcx, qword ptr [rax + 0xa0]
0xdbb775: test rcx, rcx
0xdbb778: je 0x140dbb780
0xdbb77a: cmp qword ptr [rcx + 8], rdi
0xdbb77e: jne 0x140dbb7ad
0xdbb780: cmp dword ptr [rip + 0x5f13892], edi
0xdbb786: je 0x140dbb7ad
0xdbb788: lea rdx, [rip + 0x5f13889]
0xdbb78f: mov rcx, qword ptr [rbx + 8]
0xdbb793: call 0x1435ca0a0
0xdbb798: test al, al
0xdbb79a: je 0x140dbb7ad
0xdbb79c: mov rcx, qword ptr [rbx + 8]
0xdbb7a0: call 0x1435caec0
0xdbb7a5: mov rcx, rbx
0xdbb7a8: call 0x1435c66a0
0xdbb7ad: mov rcx, rsi
0xdbb7b0: call 0x140dd3ee0
0xdbb7b5: mov rcx, rsi
0xdbb7b8: call 0x140dd3950
0xdbb7bd: jmp 0x140dbc5ff
0xdbb7c2: cmp qword ptr [rsi + 0xb80], rbx
0xdbb7c9: jne 0x140dbb839
0xdbb7cb: test r14b, r14b
0xdbb7ce: jne 0x140dbb839
0xdbb7d0: mov rax, qword ptr [rsi + 0xb38]
0xdbb7d7: cmp byte ptr [rax + 0xf2], dil
0xdbb7de: je 0x140dbc5ff
0xdbb7e4: mov qword ptr [rsi + 0xb30], rdi
0xdbb7eb: mov rcx, qword ptr [rsi + 0xb10]
0xdbb7f2: call 0x140cb6d80
0xdbb7f7: mov rcx, qword ptr [rsi + 0xb38]
0xdbb7fe: mov rax, qword ptr [rcx]
0xdbb801: call qword ptr [rax + 0x28]
0xdbb804: mov rax, qword ptr [rsi + 0xb38]
0xdbb80b: mov byte ptr [rax + 0xf2], dil
0xdbb812: mov rcx, qword ptr [rsi + 0x670]
0xdbb819: mov rax, qword ptr [rcx]
0xdbb81c: call qword ptr [rax + 0x20]
0xdbb81f: mov rax, qword ptr [rsi + 0x670]
0xdbb826: mov byte ptr [rax + 0xf2], 1
0xdbb82d: mov byte ptr [rsi + 0xbf0], dil
0xdbb834: jmp 0x140dbc5ff
0xdbb839: cmp qword ptr [rsi + 0x6a8], rbx
0xdbb840: je 0x140dbb854
0xdbb842: cmp qword ptr [rsi + 0x6b8], rbx
0xdbb849: je 0x140dbb854
0xdbb84b: cmp qword ptr [rsi + 0x6b0], rbx
0xdbb852: jne 0x140dbb872
0xdbb854: test r14b, r14b
0xdbb857: jne 0x140dbb872
0xdbb859: mov rax, qword ptr [rsi]
0xdbb85c: mov rcx, rsi
0xdbb85f: call qword ptr [rax + 0x110]
0xdbb865: mov rcx, rax
0xdbb868: call 0x140d7d1e0
0xdbb86d: jmp 0x140dbc5ff
0xdbb872: cmp qword ptr [rsi + 0x700], rbx
0xdbb879: je 0x140dbc5d3
0xdbb87f: cmp qword ptr [rsi + 0x708], rbx
0xdbb886: je 0x140dbc5d3
0xdbb88c: mov ecx, edi
0xdbb88e: mov edx, dword ptr [rsi + 0x6f8]
0xdbb894: test edx, edx
0xdbb896: je 0x140dbb8ae
0xdbb898: mov r8, qword ptr [rsi + 0x6f0]
0xdbb89f: nop 
0xdbb8a0: mov eax, ecx
0xdbb8a2: cmp rbx, qword ptr [r8 + rax*8]
0xdbb8a6: je 0x140dbb8e5
0xdbb8a8: inc ecx
0xdbb8aa: cmp ecx, edx
0xdbb8ac: jb 0x140dbb8a0
0xdbb8ae: cmp qword ptr [rsi + 0x748], rbx
0xdbb8b5: jne 0x140dbbaa0
0xdbb8bb: mov rax, qword ptr [rbp + 0x1348]
0xdbb8c2: vmovss xmm0, dword ptr [rax]
0xdbb8c6: vxorps xmm1, xmm1, xmm1
0xdbb8ca: vcomiss xmm1, xmm0
0xdbb8ce: jbe 0x140dbba85
0xdbb8d4: mov rcx, qword ptr [rsi + 0x610]
0xdbb8db: call 0x140ceafb0
0xdbb8e0: jmp 0x140dbc5ff
0xdbb8e5: cmp byte ptr [rip + 0x5f24f7c], dil
0xdbb8ec: jne 0x140dbb927
0xdbb8ee: mov rbx, qword ptr [rsi + 0x6f0]
0xdbb8f5: mov eax, dword ptr [rsi + 0x6f8]
0xdbb8fb: lea rdi, [rbx + rax*8]
0xdbb8ff: cmp rbx, rdi
0xdbb902: je 0x140dbc5ff
0xdbb908: nop dword ptr [rax + rax]
0xdbb910: mov rcx, qword ptr [rbx]
0xdbb913: mov rax, qword ptr [rcx]
0xdbb916: call qword ptr [rax + 0x28]
0xdbb919: add rbx, 8
0xdbb91d: cmp rbx, rdi
0xdbb920: jne 0x140dbb910
0xdbb922: jmp 0x140dbc5ff
0xdbb927: test r14b, r14b
0xdbb92a: jne 0x140dbba76
0xdbb930: lea rdx, [rsp + 0x48]
0xdbb935: mov rcx, qword ptr [rip + 0x5fad854]
0xdbb93c: mov rcx, qword ptr [rcx + 0x30]
0xdbb940: call 0x1408b44e0
0xdbb945: mov ebx, 4
0xdbb94a: mov dword ptr [rsp + 0x30], ebx
0xdbb94e: xor r15b, r15b
0xdbb951: xor r12b, r12b
0xdbb954: cmp byte ptr [rsp + 0x58], r12b
0xdbb959: je 0x140dbb9b2
0xdbb95b: mov rax, qword ptr [rsp + 0x50]
0xdbb960: lea rdx, [rax + 8]
0xdbb964: test rax, rax
0xdbb967: cmove rdx, rdi
0xdbb96b: mov rdx, qword ptr [rdx]
0xdbb96e: lea rcx, [rbp + 0x1320]
0xdbb975: call 0x140393df0
0xdbb97a: nop 
0xdbb97b: mov rax, qword ptr [rsp + 0x50]
0xdbb980: mov rcx, qword ptr [rax + 0x68]
0xdbb984: mov rax, qword ptr [rcx + 0x168]
0xdbb98b: movzx r15d, byte ptr [rax + 0x260]
0xdbb993: movzx r12d, byte ptr [rax + 0x261]
0xdbb99b: movzx r14d, byte ptr [rax + 0x262]
0xdbb9a3: mov rcx, qword ptr [rbp + 0x1320]
0xdbb9aa: mov rax, qword ptr [rcx]
0xdbb9ad: mov dl, 1
0xdbb9af: call qword ptr [rax + 0x20]
0xdbb9b2: neg r14b
0xdbb9b5: sbb edx, edx
0xdbb9b7: and edx, 0xe
0xdbb9ba: movzx eax, r15b
0xdbb9be: add edx, eax
0xdbb9c0: mov rcx, qword ptr [rsi + 0x610]
0xdbb9c7: call 0x140ceaea0
0xdbb9cc: mov rcx, qword ptr [rsi + 0x610]
0xdbb9d3: mov rcx, qword ptr [rcx + 0xc8]
0xdbb9da: call 0x140ce92d0
0xdbb9df: movzx edx, r12b
0xdbb9e3: mov rcx, qword ptr [rsi + 0x618]
0xdbb9ea: call 0x140ceaea0
0xdbb9ef: mov rcx, qword ptr [rsi + 0x618]
0xdbb9f6: mov rcx, qword ptr [rcx + 0xc8]
0xdbb9fd: call 0x140ce92d0
0xdbba02: mov rcx, rsi
0xdbba05: call 0x140d92330
0xdbba0a: mov rcx, rsi
0xdbba0d: call 0x140d925b0
0xdbba12: mov rcx, qword ptr [rsi + 0x608]
0xdbba19: call 0x140cb6bd0
0xdbba1e: mov rcx, qword ptr [rsi + 0x740]
0xdbba25: mov rax, qword ptr [rcx]
0xdbba28: call qword ptr [rax + 0x20]
0xdbba2b: mov rax, qword ptr [rsi + 0x740]
0xdbba32: mov byte ptr [rax + 0xf2], 1
0xdbba39: mov rcx, qword ptr [rsi + 0x670]
0xdbba40: mov rax, qword ptr [rcx]
0xdbba43: call qword ptr [rax + 0x28]
0xdbba46: mov rax, qword ptr [rsi + 0x670]
0xdbba4d: mov byte ptr [rax + 0xf2], 0
0xdbba54: and ebx, 0xfffffffb
0xdbba57: mov dword ptr [rsp + 0x30], ebx
0xdbba5b: lea rax, [rip + 0x496a3e6]
0xdbba62: mov qword ptr [rsp + 0x48], rax
0xdbba67: lea rcx, [rsp + 0x48]
0xdbba6c: call 0x141434880
0xdbba71: jmp 0x140dbc5ff
0xdbba76: cmp r14b, 2
0xdbba7a: je 0x140dbbe7b
0xdbba80: jmp 0x140dbc5ff
0xdbba85: vcomiss xmm0, xmm1
0xdbba89: jbe 0x140dbc5ff
0xdbba8f: mov rcx, qword ptr [rsi + 0x610]
0xdbba96: call 0x140ceb090
0xdbba9b: jmp 0x140dbc5ff
0xdbbaa0: cmp qword ptr [rsi + 0x750], rbx
0xdbbaa7: jne 0x140dbbaeb
0xdbbaa9: mov rax, qword ptr [rbp + 0x1348]
0xdbbab0: vmovss xmm0, dword ptr [rax + 4]
0xdbbab5: vxorps xmm1, xmm1, xmm1
0xdbbab9: vcomiss xmm0, xmm1
0xdbbabd: jbe 0x140dbbad0
0xdbbabf: mov rcx, qword ptr [rsi + 0x618]
0xdbbac6: call 0x140ceafb0
0xdbbacb: jmp 0x140dbc5ff
0xdbbad0: vcomiss xmm1, xmm0
0xdbbad4: jbe 0x140dbc5ff
0xdbbada: mov rcx, qword ptr [rsi + 0x618]
0xdbbae1: call 0x140ceb090
0xdbbae6: jmp 0x140dbc5ff
0xdbbaeb: cmp qword ptr [rsi + 0x758], rbx
0xdbbaf2: je 0x140dbbb01
0xdbbaf4: cmp qword ptr [rsi + 0x768], rbx
0xdbbafb: jne 0x140dbbca2
0xdbbb01: test r14b, r14b
0xdbbb04: jne 0x140dbbca2
0xdbbb0a: mov rcx, qword ptr [rsi + 0x608]
0xdbbb11: call 0x140cb6d80
0xdbbb16: mov rcx, qword ptr [rsi + 0x740]
0xdbbb1d: mov rax, qword ptr [rcx]
0xdbbb20: call qword ptr [rax + 0x28]
0xdbbb23: mov rax, qword ptr [rsi + 0x740]
0xdbbb2a: mov byte ptr [rax + 0xf2], dil
0xdbbb31: mov rcx, qword ptr [rsi + 0x670]
0xdbbb38: mov rax, qword ptr [rcx]
0xdbbb3b: call qword ptr [rax + 0x20]
0xdbbb3e: mov rax, qword ptr [rsi + 0x670]
0xdbbb45: mov byte ptr [rax + 0xf2], 1
0xdbbb4c: mov rax, qword ptr [rsi + 0x610]
0xdbbb53: mov r14d, dword ptr [rax + 0xe0]
0xdbbb5a: cmp r14d, 0xf
0xdbbb5e: jae 0x140dbc5ff
0xdbbb64: mov rax, qword ptr [rsi + 0x618]
0xdbbb6b: mov eax, dword ptr [rax + 0xe0]
0xdbbb71: mov dword ptr [rbp + 0x1328], eax
0xdbbb77: cmp eax, 0xf
0xdbbb7a: jae 0x140dbc5ff
0xdbbb80: cmp r14d, 0xe
0xdbbb84: setae byte ptr [rbp + 0x1320]
0xdbbb8b: mov eax, edi
0xdbbb8d: mov r13d, 0xe
0xdbbb93: cmovae eax, r13d
0xdbbb97: movzx r12d, r14b
0xdbbb9b: sub r12b, al
0xdbbb9e: lea rdx, [rsp + 0x48]
0xdbbba3: mov rcx, qword ptr [rip + 0x5fad5e6]
0xdbbbaa: mov rcx, qword ptr [rcx + 0x30]
0xdbbbae: call 0x1408b44e0
0xdbbbb3: mov r15d, 8
0xdbbbb9: mov dword ptr [rsp + 0x30], r15d
0xdbbbbe: cmp byte ptr [rsp + 0x58], 0
0xdbbbc3: je 0x140dbbc74
0xdbbbc9: mov rax, qword ptr [rsp + 0x50]
0xdbbbce: lea rdx, [rax + 8]
0xdbbbd2: test rax, rax
0xdbbbd5: cmove rdx, rdi
0xdbbbd9: mov r8b, 1
0xdbbbdc: mov rdx, qword ptr [rdx]
0xdbbbdf: lea rcx, [rsp + 0x38]
0xdbbbe4: call 0x140393650
0xdbbbe9: nop 
0xdbbbea: mov rax, qword ptr [rsp + 0x50]
0xdbbbef: mov rcx, qword ptr [rax + 0x68]
0xdbbbf3: mov rdx, qword ptr [rcx + 0x168]
0xdbbbfa: mov ebx, 1
0xdbbbff: cmp r14d, r13d
0xdbbc02: cmovae r13d, ebx
0xdbbc06: cmp r12b, r13b
0xdbbc09: jae 0x140dbbc2f
0xdbbc0b: mov eax, dword ptr [rbp + 0x1328]
0xdbbc11: cmp al, 0xf
0xdbbc13: jae 0x140dbbc2f
0xdbbc15: mov byte ptr [rdx + 0x260], r12b
0xdbbc1c: mov byte ptr [rdx + 0x261], al
0xdbbc22: movzx eax, byte ptr [rbp + 0x1320]
0xdbbc29: mov byte ptr [rdx + 0x262], al
0xdbbc2f: mov rbx, qword ptr [rsp + 0x38]
0xdbbc34: mov rax, qword ptr [rbx]
0xdbbc37: xor edx, edx
0xdbbc39: mov rcx, rbx
0xdbbc3c: call qword ptr [rax + 0x20]
0xdbbc3f: cmp byte ptr [rsp + 0x40], 1
0xdbbc44: jne 0x140dbbc74
0xdbbc46: mov eax, 0xffffffff
0xdbbc4b: lock xadd dword ptr [rbx + 8], eax
0xdbbc50: cmp eax, 1
0xdbbc53: jne 0x140dbbc67
0xdbbc55: test dword ptr [rbx + 0xc], 0x40000000
0xdbbc5c: je 0x140dbbc74
0xdbbc5e: mov rax, qword ptr [rbx]
0xdbbc61: mov rcx, rbx
0xdbbc64: call qword ptr [rax + 0x40]
0xdbbc67: test dword ptr [rbx + 0xc], 0x40000000
0xdbbc6e: je 0x140dbbc74
0xdbbc70: lock dec dword ptr [rbx + 0xc]
0xdbbc74: mov dl, 1
0xdbbc76: mov rcx, rsi
0xdbbc79: call 0x140d91ef0
0xdbbc7e: and r15d, 0xfffffff7
0xdbbc82: mov dword ptr [rsp + 0x30], r15d
0xdbbc87: lea rax, [rip + 0x496a1ba]
0xdbbc8e: mov qword ptr [rsp + 0x48], rax
0xdbbc93: lea rcx, [rsp + 0x48]
0xdbbc98: call 0x141434880
0xdbbc9d: jmp 0x140dbc5ff
0xdbbca2: cmp qword ptr [rsi + 0x760], rbx
0xdbbca9: jne 0x140dbbcf7
0xdbbcab: test r14b, r14b
0xdbbcae: jne 0x140dbbcf7
0xdbbcb0: mov rcx, qword ptr [rsi + 0x608]
0xdbbcb7: call 0x140cb6d80
0xdbbcbc: mov rcx, qword ptr [rsi + 0x740]
0xdbbcc3: mov rax, qword ptr [rcx]
0xdbbcc6: call qword ptr [rax + 0x28]
0xdbbcc9: mov rax, qword ptr [rsi + 0x740]
0xdbbcd0: mov byte ptr [rax + 0xf2], dil
0xdbbcd7: mov rcx, qword ptr [rsi + 0x670]
0xdbbcde: mov rax, qword ptr [rcx]
0xdbbce1: call qword ptr [rax + 0x20]
0xdbbce4: mov rax, qword ptr [rsi + 0x670]
0xdbbceb: mov byte ptr [rax + 0xf2], 1
0xdbbcf2: jmp 0x140dbc5ff
0xdbbcf7: cmp qword ptr [rsi + 0x738], rbx
0xdbbcfe: jne 0x140dbbd86
0xdbbd04: movzx eax, byte ptr [rsi + 0xafb]
0xdbbd0b: cmp al, 1
0xdbbd0d: je 0x140dbbd19
0xdbbd0f: sub al, 2
0xdbbd11: cmp al, 1
0xdbbd13: ja 0x140dbc5ff
0xdbbd19: mov rax, qword ptr [rsi + 0x5d0]
0xdbbd20: mov rcx, qword ptr [rax + 0x1c0]
0xdbbd27: test rcx, rcx
0xdbbd2a: je 0x140dbc5ff
0xdbbd30: cmp byte ptr [rcx + 0xa4], dil
0xdbbd37: je 0x140dbc5ff
0xdbbd3d: vxorps xmm0, xmm0, xmm0
0xdbbd41: vmovss dword ptr [rbp + 0x1320], xmm0
0xdbbd49: mov rax, qword ptr [rbp + 0x1348]
0xdbbd50: vmovss xmm1, dword ptr [rax + 4]
0xdbbd55: vmulss xmm0, xmm1, dword ptr [rip + 0x4fb7c2b]
0xdbbd5d: vmulss xmm2, xmm0, dword ptr [rip + 0x5ef20e3]
0xdbbd65: vdivss xmm1, xmm2, dword ptr [rip + 0x4fb77e7]
0xdbbd6d: vmovss dword ptr [rbp + 0x1324], xmm1
0xdbbd75: lea rdx, [rbp + 0x1320]
0xdbbd7c: call 0x143e7e190
0xdbbd81: jmp 0x140dbc5ff
0xdbbd86: mov ecx, edi
0xdbbd88: mov edx, dword ptr [rsi + 0x6d8]
0xdbbd8e: test edx, edx
0xdbbd90: je 0x140dbbdb2
0xdbbd92: mov r8, qword ptr [rsi + 0x6d0]
0xdbbd99: nop dword ptr [rax]
0xdbbda0: mov eax, ecx
0xdbbda2: cmp rbx, qword ptr [r8 + rax*8]
0xdbbda6: je 0x140dbbe4f
0xdbbdac: inc ecx
0xdbbdae: cmp ecx, edx
0xdbbdb0: jb 0x140dbbda0
0xdbbdb2: mov ecx, edi
0xdbbdb4: mov edx, dword ptr [rsi + 0x6e8]
0xdbbdba: test edx, edx
0xdbbdbc: je 0x140dbbde2
0xdbbdbe: mov r8, qword ptr [rsi + 0x6e0]
0xdbbdc5: nop word ptr [rax + rax]
0xdbbdd0: mov eax, ecx
0xdbbdd2: cmp rbx, qword ptr [r8 + rax*8]
0xdbbdd6: je 0x140dbbe65
0xdbbddc: inc ecx
0xdbbdde: cmp ecx, edx
0xdbbde0: jb 0x140dbbdd0
0xdbbde2: cmp qword ptr [rsi + 0x6c0], rbx
0xdbbde9: je 0x140dbc599
0xdbbdef: cmp qword ptr [rsi + 0x6c8], rbx
0xdbbdf6: je 0x140dbc599
0xdbbdfc: cmp qword ptr [rsi + 0x710], rbx
0xdbbe03: jne 0x140dbbe8a
0xdbbe09: test r14b, r14b
0xdbbe0c: jne 0x140dbbe8a
0xdbbe0e: mov rcx, qword ptr [rsi + 0x600]
0xdbbe15: mov rax, qword ptr [rcx]
0xdbbe18: call qword ptr [rax + 0x28]
0xdbbe1b: movzx edx, byte ptr [rsi + 0xb08]
0xdbbe22: cmp dl, 0xa
0xdbbe25: je 0x140dbbe36
0xdbbe27: lea r9, [rsi + 0xafe]
0xdbbe2e: mov rcx, rsi
0xdbbe31: call 0x140dce8d0
0xdbbe36: mov rcx, qword ptr [rsi + 0x710]
0xdbbe3d: mov rax, qword ptr [rcx]
0xdbbe40: call qword ptr [rax + 0x28]
0xdbbe43: mov rcx, qword ptr [rsi + 0x720]
0xdbbe4a: jmp 0x140dbbee2
0xdbbe4f: test r14b, r14b
0xdbbe52: jne 0x140dbbdb2
0xdbbe58: mov rcx, rsi
0xdbbe5b: call 0x140d92a90
0xdbbe60: jmp 0x140dbc5ff
0xdbbe65: test r14b, r14b
0xdbbe68: jne 0x140dbbde2
0xdbbe6e: cmp byte ptr [rip + 0x5f249f3], dil
0xdbbe75: jne 0x140dbc5ff
0xdbbe7b: xor edx, edx
0xdbbe7d: mov rcx, rsi
0xdbbe80: call 0x140d91ef0
0xdbbe85: jmp 0x140dbc5ff
0xdbbe8a: cmp qword ptr [rsi + 0x718], rbx
0xdbbe91: jne 0x140dbbefa
0xdbbe93: test r14b, r14b
0xdbbe96: jne 0x140dbbefa
0xdbbe98: mov rcx, qword ptr [rsi + 0x600]
0xdbbe9f: mov rax, qword ptr [rcx]
0xdbbea2: call qword ptr [rax + 0x20]
0xdbbea5: mov rcx, rsi
0xdbbea8: call 0x140dceda0
0xdbbead: mov rbx, qword ptr [rsi + 0x710]
0xdbbeb4: mov rcx, rbx
0xdbbeb7: call 0x140cb6bd0
0xdbbebc: mov rcx, rbx
0xdbbebf: call 0x140cc13e0
0xdbbec4: mov rbx, qword ptr [rsi + 0x720]
0xdbbecb: mov rcx, rbx
0xdbbece: call 0x140cb6bd0
0xdbbed3: mov rcx, rbx
0xdbbed6: call 0x140cc13e0
0xdbbedb: mov rcx, qword ptr [rsi + 0x718]
0xdbbee2: mov rax, qword ptr [rcx]
0xdbbee5: call qword ptr [rax + 0x28]
0xdbbee8: mov rcx, qword ptr [rsi + 0x728]
0xdbbeef: mov rax, qword ptr [rcx]
0xdbbef2: call qword ptr [rax + 0x28]
0xdbbef5: jmp 0x140dbc5ff
0xdbbefa: cmp qword ptr [rsi + 0x720], rbx
0xdbbf01: jne 0x140dbc11f
0xdbbf07: test r14b, r14b
0xdbbf0a: jne 0x140dbc11f
0xdbbf10: mov r14, qword ptr [rbp + 0x1348]
0xdbbf17: vmovss xmm0, dword ptr [r14 + 4]
0xdbbf1d: vxorps xmm6, xmm6, xmm6
0xdbbf21: vcomiss xmm0, xmm6
0xdbbf25: jbe 0x140dbbfb5
0xdbbf2b: mov rax, qword ptr [rsi + 0x600]
0xdbbf32: mov ecx, dword ptr [rax + 0xe8]
0xdbbf38: mov rax, qword ptr [rax + 0x100]
0xdbbf3f: mov rdi, qword ptr [rax + rcx*8]
0xdbbf43: mov eax, 0x134
0xdbbf48: mov ecx, 0x138
0xdbbf4d: cmp byte ptr [rdi + 0x150], 0
0xdbbf54: cmove eax, ecx
0xdbbf57: mov r8d, dword ptr [rax + rdi]
0xdbbf5b: mov ebx, dword ptr [rdi + 0x120]
0xdbbf61: cmp ebx, r8d
0xdbbf64: jae 0x140dbbf9a
0xdbbf66: mov eax, dword ptr [rdi + 0x104]
0xdbbf6c: dec eax
0xdbbf6e: xor edx, edx
0xdbbf70: div r8d
0xdbbf73: mov ecx, edx
0xdbbf75: mov r9d, eax
0xdbbf78: xor edx, edx
0xdbbf7a: mov eax, ebx
0xdbbf7c: div r8d
0xdbbf7f: cmp ecx, edx
0xdbbf81: jae 0x140dbbf8f
0xdbbf83: lea ebx, [r9 - 1]
0xdbbf87: imul ebx, r8d
0xdbbf8b: add ebx, edx
0xdbbf8d: jmp 0x140dbbf9d
0xdbbf8f: mov ebx, r8d
0xdbbf92: imul ebx, r9d
0xdbbf96: add ebx, edx
0xdbbf98: jmp 0x140dbbf9d
0xdbbf9a: sub ebx, r8d
0xdbbf9d: mov rax, qword ptr [rdi]
0xdbbfa0: xor r8d, r8d
0xdbbfa3: mov edx, ebx
0xdbbfa5: mov rcx, rdi
0xdbbfa8: call qword ptr [rax + 0x538]
0xdbbfae: mov edx, ebx
0xdbbfb0: mov rcx, rdi
0xdbbfb3: jmp 0x140dbc017
0xdbbfb5: vcomiss xmm6, xmm0
0xdbbfb9: jbe 0x140dbc023
0xdbbfbb: mov rax, qword ptr [rsi + 0x600]
0xdbbfc2: mov ecx, dword ptr [rax + 0xe8]
0xdbbfc8: mov rax, qword ptr [rax + 0x100]
0xdbbfcf: mov rbx, qword ptr [rax + rcx*8]
0xdbbfd3: mov eax, 0x134
0xdbbfd8: mov ecx, 0x138
0xdbbfdd: cmp byte ptr [rbx + 0x150], dil
0xdbbfe4: cmove eax, ecx
0xdbbfe7: mov ecx, dword ptr [rax + rbx]
0xdbbfea: mov eax, dword ptr [rbx + 0x120]
0xdbbff0: lea edi, [rcx + rax]
0xdbbff3: cmp edi, dword ptr [rbx + 0x104]
0xdbbff9: jb 0x140dbc001
0xdbbffb: xor edx, edx
0xdbbffd: div ecx
0xdbbfff: mov edi, edx
0xdbc001: mov rax, qword ptr [rbx]
0xdbc004: xor r8d, r8d
0xdbc007: mov edx, edi
0xdbc009: mov rcx, rbx
0xdbc00c: call qword ptr [rax + 0x538]
0xdbc012: mov edx, edi
0xdbc014: mov rcx, rbx
0xdbc017: xor r9d, r9d
0xdbc01a: movzx r8d, al
0xdbc01e: call 0x140ce72e0
0xdbc023: vmovss xmm0, dword ptr [r14]
0xdbc028: vcomiss xmm6, xmm0
0xdbc02c: jbe 0x140dbc092
0xdbc02e: mov rax, qword ptr [rsi + 0x600]
0xdbc035: mov ecx, dword ptr [rax + 0xe8]
0xdbc03b: mov rax, qword ptr [rax + 0x100]
0xdbc042: mov rbx, qword ptr [rax + rcx*8]
0xdbc046: mov edi, dword ptr [rbx + 0x120]
0xdbc04c: cmp dword ptr [rbx + 0xe8], edi
0xdbc052: jbe 0x140dbc5ff
0xdbc058: mov r8, qword ptr [rbx + 0x160]
0xdbc05f: cmp dword ptr [r8 + 0x70], 0
0xdbc064: je 0x140dbc5ff
0xdbc06a: mov ecx, edi
0xdbc06c: shl rcx, 5
0xdbc070: mov r8, qword ptr [r8 + 0x68]
0xdbc074: mov r9d, dword ptr [rcx + r8 + 0x18]
0xdbc079: mov edx, dword ptr [rcx + r8 + 8]
0xdbc07e: sub edx, 1
0xdbc081: je 0x140dbc089
0xdbc083: mov eax, edx
0xdbc085: cdq 
0xdbc086: idiv r9d
0xdbc089: test edx, edx
0xdbc08b: jns 0x140dbc0f4
0xdbc08d: add edx, r9d
0xdbc090: jmp 0x140dbc0f4
0xdbc092: vcomiss xmm0, xmm6
0xdbc096: jbe 0x140dbc5ff
0xdbc09c: mov rax, qword ptr [rsi + 0x600]
0xdbc0a3: mov ecx, dword ptr [rax + 0xe8]
0xdbc0a9: mov rax, qword ptr [rax + 0x100]
0xdbc0b0: mov rbx, qword ptr [rax + rcx*8]
0xdbc0b4: mov edi, dword ptr [rbx + 0x120]
0xdbc0ba: cmp dword ptr [rbx + 0xe8], edi
0xdbc0c0: jbe 0x140dbc5ff
0xdbc0c6: mov r8, qword ptr [rbx + 0x160]
0xdbc0cd: cmp dword ptr [r8 + 0x70], 0
0xdbc0d2: je 0x140dbc5ff
0xdbc0d8: mov ecx, edi
0xdbc0da: shl rcx, 5
0xdbc0de: mov r8, qword ptr [r8 + 0x68]
0xdbc0e2: mov edx, dword ptr [rcx + r8 + 8]
0xdbc0e7: add edx, 1
0xdbc0ea: je 0x140dbc0f4
0xdbc0ec: mov eax, edx
0xdbc0ee: cdq 
0xdbc0ef: idiv dword ptr [rcx + r8 + 0x18]
0xdbc0f4: mov dword ptr [rcx + r8 + 8], edx
0xdbc0f9: mov edx, edi
0xdbc0fb: mov rcx, rbx
0xdbc0fe: call 0x140ce7170
0xdbc103: test rax, rax
0xdbc106: je 0x140dbc5ff
0xdbc10c: mov r8d, edi
0xdbc10f: mov rdx, rax
0xdbc112: mov rcx, rbx
0xdbc115: call 0x140d891e0
0xdbc11a: jmp 0x140dbc5ff
0xdbc11f: mov ecx, dword ptr [rsi + 0x7a8]
0xdbc125: test ecx, ecx
0xdbc127: je 0x140dbc13e
0xdbc129: mov rdx, qword ptr [rsi + 0x7a0]
0xdbc130: mov eax, edi
0xdbc132: cmp rbx, qword ptr [rdx + rax*8]
0xdbc136: je 0x140dbc192
0xdbc138: inc edi
0xdbc13a: cmp edi, ecx
0xdbc13c: jb 0x140dbc130
0xdbc13e: cmp qword ptr [rsi + 0x728], rbx
0xdbc145: jne 0x140dbc1a4
0xdbc147: test r14b, 0xfd
0xdbc14b: jne 0x140dbc5ff
0xdbc151: mov rcx, qword ptr [rsi + 0x600]
0xdbc158: mov rax, qword ptr [rcx]
0xdbc15b: call qword ptr [rax + 0x28]
0xdbc15e: mov rcx, qword ptr [rsi + 0x710]
0xdbc165: mov rax, qword ptr [rcx]
0xdbc168: call qword ptr [rax + 0x28]
0xdbc16b: mov rcx, qword ptr [rsi + 0x720]
0xdbc172: mov rax, qword ptr [rcx]
0xdbc175: call qword ptr [rax + 0x28]
0xdbc178: mov rcx, qword ptr [rsi + 0x728]
0xdbc17f: mov rax, qword ptr [rcx]
0xdbc182: call qword ptr [rax + 0x28]
0xdbc185: mov rcx, rsi
0xdbc188: call 0x140dce700
0xdbc18d: jmp 0x140dbc5ff
0xdbc192: test r14b, r14b
0xdbc195: jne 0x140dbc13e
0xdbc197: mov rcx, rsi
0xdbc19a: call 0x140dcb0d0
0xdbc19f: jmp 0x140dbc5ff
0xdbc1a4: cmp qword ptr [rsi + 0x730], rbx
0xdbc1ab: jne 0x140dbc363
0xdbc1b1: test r14b, r14b
0xdbc1b4: jne 0x140dbc363
0xdbc1ba: mov rax, qword ptr [rsi]
0xdbc1bd: mov rcx, rsi
0xdbc1c0: call qword ptr [rax + 0x110]
0xdbc1c6: lea rdx, [rip + 0x489864b]
0xdbc1cd: mov rcx, rax
0xdbc1d0: call 0x1435da2a0
0xdbc1d5: mov r14, rax
0xdbc1d8: test rax, rax
0xdbc1db: je 0x140dbc5ff
0xdbc1e1: cmp qword ptr [rsi + 0x5c0], 0
0xdbc1e9: je 0x140dbc5ff
0xdbc1ef: lea rcx, [rbp - 0x70]
0xdbc1f3: call 0x140d0c6d0
0xdbc1f8: nop 
0xdbc1f9: lea rcx, [rip + 0x5f16608]
0xdbc200: call 0x140389080
0xdbc205: mov rcx, qword ptr [rax + 0x18]
0xdbc209: mov rax, qword ptr [rcx]
0xdbc20c: xor edx, edx
0xdbc20e: call qword ptr [rax + 8]
0xdbc211: mov dword ptr [rbp + 0x8bc], 0xffffffff
0xdbc21b: lea rcx, [rbp + 0xa8]
0xdbc222: mov rdx, qword ptr [rbp + 0x8b0]
0xdbc229: test rdx, rdx
0xdbc22c: cmovne rcx, rdx
0xdbc230: mov r8, rax
0xdbc233: mov edx, dword ptr [rbp + 0x8b8]
0xdbc239: call 0x141424a80
0xdbc23e: lea rcx, [rip + 0x5f16099]
0xdbc245: call 0x140389080
0xdbc24a: mov rcx, qword ptr [rax + 0x18]
0xdbc24e: mov rax, qword ptr [rcx]
0xdbc251: xor edx, edx
0xdbc253: call qword ptr [rax + 8]
0xdbc256: mov dword ptr [rbp + 0x1064], 0xffffffff
0xdbc260: lea rcx, [rbp + 0xf50]
0xdbc267: mov rdx, qword ptr [rbp + 0x1058]
0xdbc26e: test rdx, rdx
0xdbc271: cmovne rcx, rdx
0xdbc275: mov r8, rax
0xdbc278: mov edx, dword ptr [rbp + 0x1060]
0xdbc27e: call 0x141424a80
0xdbc283: lea rcx, [rip + 0x5f16058]
0xdbc28a: call 0x140389080
0xdbc28f: mov rcx, qword ptr [rax + 0x18]
0xdbc293: mov rax, qword ptr [rcx]
0xdbc296: xor edx, edx
0xdbc298: call qword ptr [rax + 8]
0xdbc29b: mov dword ptr [rbp + 0x117c], 0xffffffff
0xdbc2a5: lea rcx, [rbp + 0x1068]
0xdbc2ac: mov rdx, qword ptr [rbp + 0x1170]
0xdbc2b3: test rdx, rdx
0xdbc2b6: cmovne rcx, rdx
0xdbc2ba: mov r8, rax
0xdbc2bd: mov edx, dword ptr [rbp + 0x1178]
0xdbc2c3: call 0x141424a80
0xdbc2c8: mov rax, qword ptr [rsi + 0x5c0]
0xdbc2cf: vmovups xmm0, xmmword ptr [rax + 0xc8]
0xdbc2d7: mov rax, qword ptr [rax + 0xd0]
0xdbc2de: cmp al, 0xe
0xdbc2e0: jne 0x140dbc321
0xdbc2e2: vmovq rdi, xmm0
0xdbc2e7: mov dword ptr [rbp + 0x1320], edi
0xdbc2ed: mov rbx, rdi
0xdbc2f0: shr rbx, 0x20
0xdbc2f4: lea rcx, [rbp + 0x1320]
0xdbc2fb: call 0x1404a2630
0xdbc300: cmp ebx, dword ptr [rax + 0x28]
0xdbc303: jae 0x140dbc355
0xdbc305: mov r8d, ebx
0xdbc308: mov edx, edi
0xdbc30a: call 0x140654f30
0xdbc30f: test al, al
0xdbc311: je 0x140dbc355
0xdbc313: mov dword ptr [rsi + 0x960], edi
0xdbc319: mov dword ptr [rsi + 0x964], ebx
0xdbc31f: jmp 0x140dbc330
0xdbc321: vmovq rax, xmm0
0xdbc326: test eax, eax
0xdbc328: je 0x140dbc355
0xdbc32a: mov dword ptr [rsi + 0x968], eax
0xdbc330: lea r9, [rip + 0x489dc31]
0xdbc337: lea r8, [rbp - 0x70]
0xdbc33b: mov rdx, r14
0xdbc33e: mov rcx, qword ptr [rsi + 0x670]
0xdbc345: call 0x140e1a7f0
0xdbc34a: mov qword ptr [rsi + 0x958], rax
0xdbc351: mov qword ptr [rax + 0x28], rsi
0xdbc355: lea rcx, [rbp - 0x70]
0xdbc359: call 0x140d0ca00
0xdbc35e: jmp 0x140dbc5ff
0xdbc363: cmp qword ptr [rsi + 0x788], rbx
0xdbc36a: jne 0x140dbc3c8
0xdbc36c: test r14b, r14b
0xdbc36f: jne 0x140dbc3c8
0xdbc371: mov rax, qword ptr [rsi + 0x5c0]
0xdbc378: test rax, rax
0xdbc37b: je 0x140dbc5ff
0xdbc381: vmovups xmm6, xmmword ptr [rax + 0xc8]
0xdbc389: mov rax, qword ptr [rsi]
0xdbc38c: mov rcx, rsi
0xdbc38f: call qword ptr [rax + 0x110]
0xdbc395: vmovd edx, xmm6
0xdbc399: mov rcx, rax
0xdbc39c: call 0x14100bc70
0xdbc3a1: mov rax, qword ptr [rsi]
0xdbc3a4: mov rcx, rsi
0xdbc3a7: call qword ptr [rax + 0x110]
0xdbc3ad: mov rcx, rax
0xdbc3b0: lea r8, [rip + 0x47b70f5]
0xdbc3b7: lea rdx, [rip + 0x4801ff2]
0xdbc3be: call 0x140d7d870
0xdbc3c3: jmp 0x140dbc5ff
0xdbc3c8: cmp qword ptr [rsi + 0x790], rbx
0xdbc3cf: jne 0x140dbc42a
0xdbc3d1: test r14b, r14b
0xdbc3d4: jne 0x140dbc42a
0xdbc3d6: mov rcx, qword ptr [rsi + 0x5d0]
0xdbc3dd: mov rax, qword ptr [rcx + 8]
0xdbc3e1: movzx edx, byte ptr [rax + 0xb0]
0xdbc3e8: and dl, 0x60
0xdbc3eb: cmp dl, 0x40
0xdbc3ee: jne 0x140dbc5ff
0xdbc3f4: call 0x140f604b0
0xdbc3f9: test al, al
0xdbc3fb: je 0x140dbc5ff
0xdbc401: mov rbx, qword ptr [rsi + 0x798]
0xdbc408: mov rcx, rbx
0xdbc40b: call 0x140cb6bd0
0xdbc410: mov rcx, rbx
0xdbc413: call 0x140cc13e0
0xdbc418: mov rcx, qword ptr [rsi + 0x790]
0xdbc41f: mov rax, qword ptr [rcx]
0xdbc422: call qword ptr [rax + 0x28]
0xdbc425: jmp 0x140dbc5ff
0xdbc42a: cmp qword ptr [rsi + 0x798], rbx
0xdbc431: jne 0x140dbc5ff
0xdbc437: test r14b, r14b
0xdbc43a: jne 0x140dbc5ff
0xdbc440: mov rcx, qword ptr [rsi + 0x5c0]
0xdbc447: test rcx, rcx
0xdbc44a: je 0x140dbc5ff
0xdbc450: mov r13d, 0xffff
0xdbc456: cmp byte ptr [rcx + 0xd0], r14b
0xdbc45d: jne 0x140dbc4cb
0xdbc45f: mov ebx, dword ptr [rcx + 0xc8]
0xdbc465: mov dword ptr [rbp + 0x1320], ebx
0xdbc46b: lea rcx, [rbp + 0x1320]
0xdbc472: call 0x1405c15a0
0xdbc477: lea rcx, [rax + 0x58]
0xdbc47b: cmp word ptr [rcx], r13w
0xdbc47f: je 0x140dbc486
0xdbc481: call 0x1405d2070
0xdbc486: cmp byte ptr [rax + 0x11], 3
0xdbc48a: jne 0x140dbc4b5
0xdbc48c: lea rcx, [rbp + 0x1320]
0xdbc493: call 0x1405c15a0
0xdbc498: movzx ebx, word ptr [rax + 0x58]
0xdbc49c: mov rax, qword ptr [rsi]
0xdbc49f: mov rcx, rsi
0xdbc4a2: call qword ptr [rax + 0x110]
0xdbc4a8: movzx edx, bx
0xdbc4ab: mov rcx, rax
0xdbc4ae: call 0x140d226e0
0xdbc4b3: jmp 0x140dbc4cb
0xdbc4b5: mov rax, qword ptr [rsi]
0xdbc4b8: mov rcx, rsi
0xdbc4bb: call qword ptr [rax + 0x110]
0xdbc4c1: mov edx, ebx
0xdbc4c3: mov rcx, rax
0xdbc4c6: call 0x140d7f760
0xdbc4cb: mov rcx, qword ptr [rsi + 0x5c0]
0xdbc4d2: mov rax, qword ptr [rcx + 0xd0]
0xdbc4d9: cmp al, 2
0xdbc4db: jne 0x140dbc57c
0xdbc4e1: mov ebx, dword ptr [rcx + 0xc8]
0xdbc4e7: mov word ptr [rbp + 0x1320], bx
0xdbc4ee: lea rcx, [rbp + 0x1320]
0xdbc4f5: call 0x140430280
0xdbc4fa: cmp word ptr [rax + 0x188], r13w
0xdbc502: je 0x140dbc521
0xdbc504: lea rcx, [rbp + 0x1320]
0xdbc50b: call 0x140430280
0xdbc510: movzx ecx, word ptr [rax + 0x188]
0xdbc517: mov word ptr [rbp + 0x1320], cx
0xdbc51e: movzx ebx, cx
0xdbc521: lea rcx, [rbp + 0x1320]
0xdbc528: call 0x140430280
0xdbc52d: lea rcx, [rax + 0x14]
0xdbc531: call 0x1405c15a0
0xdbc536: mov rdx, rax
0xdbc539: lea rcx, [rax + 0x58]
0xdbc53d: cmp word ptr [rcx], r13w
0xdbc541: je 0x140dbc54b
0xdbc543: call 0x1405d2070
0xdbc548: mov rdx, rax
0xdbc54b: mov rax, qword ptr [rsi]
0xdbc54e: mov r8, qword ptr [rax + 0x110]
0xdbc555: mov rcx, rsi
0xdbc558: cmp byte ptr [rdx + 0x11], 3
0xdbc55c: jne 0x140dbc56e
0xdbc55e: call r8
0xdbc561: movzx edx, bx
0xdbc564: mov rcx, rax
0xdbc567: call 0x140d225f0
0xdbc56c: jmp 0x140dbc57c
0xdbc56e: call r8
0xdbc571: movzx edx, bx
0xdbc574: mov rcx, rax
0xdbc577: call 0x140d7f260
0xdbc57c: mov rax, qword ptr [rsi]
0xdbc57f: mov rcx, rsi
0xdbc582: call qword ptr [rax + 0x110]
0xdbc588: mov rcx, rax
0xdbc58b: call 0x140d7f0b0
0xdbc590: mov byte ptr [rsi + 0xc30], 1
0xdbc597: jmp 0x140dbc5ff
0xdbc599: cmp byte ptr [rsi + 0xada], dil
0xdbc5a0: jne 0x140dbc5ff
0xdbc5a2: test r14b, r14b
0xdbc5a5: jne 0x140dbc5c5
0xdbc5a7: mov rax, qword ptr [rbp + 0x1348]
0xdbc5ae: vmovss xmm0, dword ptr [rax + 4]
0xdbc5b3: vxorps xmm0, xmm0, xmmword ptr [rip + 0x4fb9795]
0xdbc5bb: vmovss dword ptr [rsi + 0xaa8], xmm0
0xdbc5c3: jmp 0x140dbc5ff
0xdbc5c5: cmp r14b, 1
0xdbc5c9: jne 0x140dbc5ff
0xdbc5cb: mov dword ptr [rsi + 0xaa8], edi
0xdbc5d1: jmp 0x140dbc5ff
0xdbc5d3: test r14b, r14b
0xdbc5d6: jne 0x140dbc5eb
0xdbc5d8: mov rax, qword ptr [rbp + 0x1348]
0xdbc5df: mov rcx, qword ptr [rax]
0xdbc5e2: mov qword ptr [rsi + 0xa78], rcx
0xdbc5e9: jmp 0x140dbc5ff
0xdbc5eb: cmp r14b, 1
0xdbc5ef: jne 0x140dbc5ff
0xdbc5f1: mov rax, qword ptr [rip + 0x4789868]
0xdbc5f8: mov qword ptr [rsi + 0xa78], rax
0xdbc5ff: lea r11, [rsp + 0x13e0]
0xdbc607: mov rbx, qword ptr [r11 + 0x58]
0xdbc60b: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdbc611: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdbc617: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdbc61d: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdbc623: mov rsp, r11
0xdbc626: pop r15
0xdbc628: pop r14
0xdbc62a: pop r13
0xdbc62c: pop r12
0xdbc62e: pop rdi
0xdbc62f: pop rsi
0xdbc630: pop rbp
0xdbc631: ret 