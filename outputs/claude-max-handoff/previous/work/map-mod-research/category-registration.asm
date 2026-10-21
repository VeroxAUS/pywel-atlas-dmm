FUNCTION 0xdf0320
0xdf0320: mov qword ptr [rsp + 0x18], rbx
0xdf0325: mov qword ptr [rsp + 0x20], rsi
0xdf032a: push r14
0xdf032c: sub rsp, 0x20
0xdf0330: mov rax, qword ptr gs:[0x58]
0xdf0339: mov rbx, rcx
0xdf033c: mov ecx, 0x1ec
0xdf0341: movzx r14d, r8b
0xdf0345: mov rsi, rdx
0xdf0348: mov r9, qword ptr [rax]
0xdf034b: mov rax, qword ptr [rip + 0x5f791d6]
0xdf0352: cmp byte ptr [rcx + r9], 0
0xdf0357: mov r9d, dword ptr [rdx + 0x1c0]
0xdf035e: cmovne rax, qword ptr [rip + 0x5f791ca]
0xdf0366: test r9d, r9d
0xdf0369: je 0x140df04d1
0xdf036f: mov rax, qword ptr [rax]
0xdf0372: movzx r8d, word ptr [rdx + 0xde]
0xdf037a: mov qword ptr [rsp + 0x30], rbp
0xdf037f: mov rcx, qword ptr [rax + 8]
0xdf0383: xor eax, eax
0xdf0385: mov rbp, qword ptr [rcx + 0x270]
0xdf038c: mov edx, dword ptr [rbp + 0x1c0]
0xdf0392: mov rcx, qword ptr [rbp + 0x1b8]
0xdf0399: test edx, edx
0xdf039b: je 0x140df04cc
0xdf03a1: cmp word ptr [rcx], r8w
0xdf03a5: je 0x140df03b6
0xdf03a7: inc eax
0xdf03a9: add rcx, 2
0xdf03ad: cmp eax, edx
0xdf03af: jb 0x140df03a1
0xdf03b1: jmp 0x140df04cc
0xdf03b6: cmp eax, -1
0xdf03b9: je 0x140df04cc
0xdf03bf: cmp dword ptr [rbx + 0x1bc], 0
0xdf03c6: je 0x140df04cc
0xdf03cc: mov ecx, dword ptr [rbx + 0x1b8]
0xdf03d2: test ecx, ecx
0xdf03d4: je 0x140df04cc
0xdf03da: xor edx, edx
0xdf03dc: mov eax, r9d
0xdf03df: div ecx
0xdf03e1: mov r10d, edx
0xdf03e4: xor edx, edx
0xdf03e6: shl r10, 8
0xdf03ea: add r10, qword ptr [rbx + 0x1c8]
0xdf03f1: mov r11d, dword ptr [r10]
0xdf03f4: test r11d, r11d
0xdf03f7: je 0x140df04cc
0xdf03fd: nop dword ptr [rax]
0xdf0400: cmp dword ptr [r10 + rdx*8 + 8], r9d
0xdf0405: jne 0x140df041d
0xdf0407: mov ecx, dword ptr [r10 + rdx*8 + 0xc]
0xdf040c: mov rax, qword ptr [rbx + 0x1d0]
0xdf0413: mov r8, qword ptr [rax + rcx*8]
0xdf0417: cmp dword ptr [r8 + 4], r9d
0xdf041b: je 0x140df0429
0xdf041d: inc edx
0xdf041f: cmp edx, r11d
0xdf0422: jb 0x140df0400
0xdf0424: jmp 0x140df04cc
0xdf0429: lea rbx, [r8 + 8]
0xdf042d: test rbx, rbx
0xdf0430: je 0x140df04cc
0xdf0436: mov eax, dword ptr [rbx + 8]
0xdf0439: test eax, eax
0xdf043b: je 0x140df04cc
0xdf0441: mov rbx, qword ptr [rbx]
0xdf0444: mov qword ptr [rsp + 0x38], rdi
0xdf0449: lea rdi, [rbx + rax*8]
0xdf044d: cmp rbx, rdi
0xdf0450: je 0x140df04c7
0xdf0452: mov rcx, qword ptr [rbx]
0xdf0455: test r14b, r14b
0xdf0458: je 0x140df04a9
0xdf045a: cmp rcx, rsi
0xdf045d: jne 0x140df0468
0xdf045f: mov byte ptr [rcx + 0x1d7], 1
0xdf0466: jmp 0x140df04b2
0xdf0468: mov edx, dword ptr [rbp + 0x1c0]
0xdf046e: xor eax, eax
0xdf0470: movzx r8d, word ptr [rcx + 0xde]
0xdf0478: mov rcx, qword ptr [rbp + 0x1b8]
0xdf047f: test edx, edx
0xdf0481: je 0x140df04b2
0xdf0483: cmp word ptr [rcx], r8w
0xdf0487: je 0x140df0495
0xdf0489: inc eax
0xdf048b: add rcx, 2
0xdf048f: cmp eax, edx
0xdf0491: jb 0x140df0483
0xdf0493: jmp 0x140df04b2
0xdf0495: cmp eax, -1
0xdf0498: je 0x140df04b2
0xdf049a: mov r8b, 1
0xdf049d: mov dl, 4
0xdf049f: mov rcx, rsi
0xdf04a2: call 0x140deca40
0xdf04a7: jmp 0x140df04b2
0xdf04a9: cmp byte ptr [rcx + 0x1d7], 0
0xdf04b0: jne 0x140df04bd
0xdf04b2: add rbx, 8
0xdf04b6: cmp rbx, rdi
0xdf04b9: jne 0x140df0452
0xdf04bb: jmp 0x140df04c7
0xdf04bd: mov r8b, 1
0xdf04c0: mov dl, 4
0xdf04c2: call 0x140deca40
0xdf04c7: mov rdi, qword ptr [rsp + 0x38]
0xdf04cc: mov rbp, qword ptr [rsp + 0x30]
0xdf04d1: mov rbx, qword ptr [rsp + 0x40]
0xdf04d6: mov rsi, qword ptr [rsp + 0x48]
0xdf04db: add rsp, 0x20
0xdf04df: pop r14
0xdf04e1: ret 
0xdf04e2: int3 
0xdf04e3: int3 
0xdf04e4: int3 
0xdf04e5: int3 
0xdf04e6: int3 
0xdf04e7: int3 
0xdf04e8: int3 
0xdf04e9: int3 
0xdf04ea: int3 
0xdf04eb: int3 
0xdf04ec: int3 
0xdf04ed: int3 
0xdf04ee: int3 
0xdf04ef: int3 
0xdf04f0: mov qword ptr [rsp + 0x18], rbx
0xdf04f5: push r14
0xdf04f7: sub rsp, 0x20
0xdf04fb: mov rax, qword ptr gs:[0x58]
0xdf0504: mov rbx, rcx
0xdf0507: mov ecx, 0x1ec
0xdf050c: mov r14, rdx
0xdf050f: mov r8, qword ptr [rax]
0xdf0512: mov rax, qword ptr [rip + 0x5f7900f]
0xdf0519: cmp byte ptr [rcx + r8], 0
0xdf051e: mov r8d, dword ptr [rdx + 0x1c0]
0xdf0525: cmovne rax, qword ptr [rip + 0x5f79003]
0xdf052d: test r8d, r8d
0xdf0530: je 0x140df06ee
0xdf0536: mov rax, qword ptr [rax]
0xdf0539: movzx r9d, word ptr [rdx + 0xde]
0xdf0541: mov qword ptr [rsp + 0x38], rdi
0xdf0546: xor edi, edi
0xdf0548: mov rcx, qword ptr [rax + 8]
0xdf054c: mov rax, qword ptr [rcx + 0x270]
0xdf0553: mov edx, dword ptr [rax + 0x1c0]
0xdf0559: mov rcx, qword ptr [rax + 0x1b8]
0xdf0560: mov eax, edi
0xdf0562: test edx, edx
0xdf0564: je 0x140df06e9
0xdf056a: nop word ptr [rax + rax]
0xdf0570: cmp word ptr [rcx], r9w
0xdf0574: je 0x140df0591
0xdf0576: inc eax
0xdf0578: add rcx, 2
0xdf057c: cmp eax, edx
0xdf057e: jb 0x140df0570
0xdf0580: mov rdi, qword ptr [rsp + 0x38]
0xdf0585: mov rbx, qword ptr [rsp + 0x40]
0xdf058a: add rsp, 0x20
0xdf058e: pop r14
0xdf0590: ret 
0xdf0591: cmp eax, -1
0xdf0594: je 0x140df06e9
0xdf059a: cmp dword ptr [rbx + 0x1bc], edi
0xdf05a0: je 0x140df06e9
0xdf05a6: mov ecx, dword ptr [rbx + 0x1b8]
0xdf05ac: test ecx, ecx
0xdf05ae: je 0x140df06e9
0xdf05b4: xor edx, edx
0xdf05b6: mov eax, r8d
0xdf05b9: div ecx
0xdf05bb: mov r10d, edx
0xdf05be: mov edx, edi
0xdf05c0: shl r10, 8
0xdf05c4: add r10, qword ptr [rbx + 0x1c8]
0xdf05cb: mov r11d, dword ptr [r10]
0xdf05ce: test r11d, r11d
0xdf05d1: je 0x140df06e9
0xdf05d7: mov eax, edx
0xdf05d9: cmp dword ptr [r10 + rax*8 + 8], r8d
0xdf05de: jne 0x140df05f6
0xdf05e0: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0xdf05e5: mov rax, qword ptr [rbx + 0x1d0]
0xdf05ec: mov r9, qword ptr [rax + rcx*8]
0xdf05f0: cmp dword ptr [r9 + 4], r8d
0xdf05f4: je 0x140df060e
0xdf05f6: inc edx
0xdf05f8: cmp edx, r11d
0xdf05fb: jb 0x140df05d7
0xdf05fd: mov rdi, qword ptr [rsp + 0x38]
0xdf0602: mov rbx, qword ptr [rsp + 0x40]
0xdf0607: add rsp, 0x20
0xdf060b: pop r14
0xdf060d: ret 
0xdf060e: lea rbx, [r9 + 8]
0xdf0612: test rbx, rbx
0xdf0615: je 0x140df06e9
0xdf061b: mov eax, dword ptr [rbx + 8]
0xdf061e: test eax, eax
0xdf0620: je 0x140df06e9
0xdf0626: cmp byte ptr [r14 + 0x1d7], dil
0xdf062d: je 0x140df06fa
0xdf0633: mov rbx, qword ptr [rbx]
0xdf0636: mov qword ptr [rsp + 0x30], rsi
0xdf063b: mov rcx, rbx
0xdf063e: lea rsi, [rbx + rax*8]
0xdf0642: cmp rbx, rsi
0xdf0645: je 0x140df06e4
0xdf064b: nop dword ptr [rax + rax]
0xdf0650: mov rax, qword ptr [rcx]
0xdf0653: cmp byte ptr [rax + 0x1d7], dil
0xdf065a: je 0x140df0665
0xdf065c: cmp rax, r14
0xdf065f: jne 0x140df06e4
0xdf0665: add rcx, 8
0xdf0669: cmp rcx, rsi
0xdf066c: jne 0x140df0650
0xdf066e: cmp rbx, rsi
0xdf0671: je 0x140df06e4
0xdf0673: test byte ptr [r14 + 0x1e8], 0x10
0xdf067b: mov r8, qword ptr [rbx]
0xdf067e: je 0x140df06db
0xdf0680: lea rcx, [r8 + 0x1e8]
0xdf0687: mov edx, edi
0xdf0689: mov rax, rcx
0xdf068c: nop dword ptr [rax]
0xdf0690: cmp byte ptr [rax], dil
0xdf0693: jne 0x140df06a3
0xdf0695: inc edx
0xdf0697: inc rax
0xdf069a: cmp edx, 3
0xdf069d: jb 0x140df0690
0xdf069f: xor dl, dl
0xdf06a1: jmp 0x140df06a5
0xdf06a3: mov dl, 1
0xdf06a5: movzx eax, byte ptr [rcx]
0xdf06a8: btr eax, 4
0xdf06ac: mov byte ptr [rcx], al
0xdf06ae: mov eax, edi
0xdf06b0: cmp byte ptr [rcx], dil
0xdf06b3: jne 0x140df06c3
0xdf06b5: inc eax
0xdf06b7: inc rcx
0xdf06ba: cmp eax, 3
0xdf06bd: jb 0x140df06b0
0xdf06bf: xor al, al
0xdf06c1: jmp 0x140df06c5
0xdf06c3: mov al, 1
0xdf06c5: cmp dl, al
0xdf06c7: je 0x140df06db
0xdf06c9: mov rdx, qword ptr [r8]
0xdf06cc: mov rcx, r8
0xdf06cf: test al, al
0xdf06d1: je 0x140df06d8
0xdf06d3: call qword ptr [rdx + 0x28]
0xdf06d6: jmp 0x140df06db
0xdf06d8: call qword ptr [rdx + 0x20]
0xdf06db: add rbx, 8
0xdf06df: cmp rbx, rsi
0xdf06e2: jne 0x140df0673
0xdf06e4: mov rsi, qword ptr [rsp + 0x30]
0xdf06e9: mov rdi, qword ptr [rsp + 0x38]
0xdf06ee: mov rbx, qword ptr [rsp + 0x40]
0xdf06f3: add rsp, 0x20
0xdf06f7: pop r14
0xdf06f9: ret 
0xdf06fa: lea rax, [r14 + 0x1e8]
0xdf0701: movzx r8d, byte ptr [rax]
0xdf0705: test r8b, 0x10
0xdf0709: je 0x140df06e9
0xdf070b: mov edx, edi
0xdf070d: mov rcx, rax
0xdf0710: cmp byte ptr [rcx], dil
0xdf0713: jne 0x140df0723
0xdf0715: inc edx
0xdf0717: inc rcx
0xdf071a: cmp edx, 3
0xdf071d: jb 0x140df0710
0xdf071f: xor cl, cl
0xdf0721: jmp 0x140df0725
0xdf0723: mov cl, 1
0xdf0725: btr r8d, 4
0xdf072a: mov byte ptr [rax], r8b
0xdf072d: nop dword ptr [rax]
0xdf0730: cmp byte ptr [rax], 0
0xdf0733: jne 0x140df0743
0xdf0735: inc edi
0xdf0737: inc rax
0xdf073a: cmp edi, 3
0xdf073d: jb 0x140df0730
0xdf073f: xor al, al
0xdf0741: jmp 0x140df0745
0xdf0743: mov al, 1
0xdf0745: cmp cl, al
0xdf0747: je 0x140df06e9
0xdf0749: mov rdx, qword ptr [r14]
0xdf074c: mov rcx, r14
0xdf074f: test al, al
0xdf0751: je 0x140df0767
0xdf0753: mov rdi, qword ptr [rsp + 0x38]
0xdf0758: mov rbx, qword ptr [rsp + 0x40]
0xdf075d: add rsp, 0x20
0xdf0761: pop r14
0xdf0763: jmp qword ptr [rdx + 0x28]
0xdf0767: mov rdi, qword ptr [rsp + 0x38]
0xdf076c: mov rbx, qword ptr [rsp + 0x40]
0xdf0771: add rsp, 0x20
0xdf0775: pop r14
0xdf0777: jmp qword ptr [rdx + 0x20]
0xdf077b: int3 
0xdf077c: int3 
0xdf077d: int3 
0xdf077e: int3 
0xdf077f: int3 
FUNCTION 0xdcfe70
0xdcfe70: mov qword ptr [rsp + 8], rbx
0xdcfe75: push rbp
0xdcfe76: push rsi
0xdcfe77: push rdi
0xdcfe78: push r12
0xdcfe7a: push r13
0xdcfe7c: push r14
0xdcfe7e: push r15
0xdcfe80: mov rbp, rsp
0xdcfe83: sub rsp, 0x70
0xdcfe87: mov r13, rdx
0xdcfe8a: mov rsi, rcx
0xdcfe8d: mov rax, qword ptr gs:[0x58]
0xdcfe96: mov r12, qword ptr [rax]
0xdcfe99: mov ecx, 0x1ec
0xdcfe9e: mov rax, qword ptr [rip + 0x5f99683]
0xdcfea5: cmp byte ptr [rcx + r12], 0
0xdcfeaa: cmovne rax, qword ptr [rip + 0x5f9967e]
0xdcfeb2: mov rax, qword ptr [rax]
0xdcfeb5: mov r8, qword ptr [rax + 8]
0xdcfeb9: mov rax, qword ptr [r8 + 0x270]
0xdcfec0: mov rcx, qword ptr [rax + 0x178]
0xdcfec7: mov eax, dword ptr [rax + 0x180]
0xdcfecd: lea rdx, [rcx + rax*2]
0xdcfed1: cmp rcx, rdx
0xdcfed4: je 0x140dd019c
0xdcfeda: lea r14, [r13 + 0xde]
0xdcfee1: movzx eax, word ptr [r14]
0xdcfee5: cmp ax, word ptr [rcx]
0xdcfee8: je 0x140dcfef8
0xdcfeea: add rcx, 2
0xdcfeee: cmp rcx, rdx
0xdcfef1: jne 0x140dcfee5
0xdcfef3: jmp 0x140dd019c
0xdcfef8: mov rcx, r14
0xdcfefb: call 0x140537250
0xdcff00: mov r9d, dword ptr [rax]
0xdcff03: mov dword ptr [rbp - 0x20], r9d
0xdcff07: mov r15d, 0x1fd
0xdcff0d: xor edi, edi
0xdcff0f: cmp dword ptr [rsi + 0x41c], edi
0xdcff15: je 0x140dcff6e
0xdcff17: mov ecx, dword ptr [rsi + 0x418]
0xdcff1d: test ecx, ecx
0xdcff1f: je 0x140dcff6e
0xdcff21: xor edx, edx
0xdcff23: mov eax, r9d
0xdcff26: div ecx
0xdcff28: mov r8d, edx
0xdcff2b: shl r8, 8
0xdcff2f: add r8, qword ptr [rsi + 0x428]
0xdcff36: mov edx, edi
0xdcff38: mov r10d, dword ptr [r8]
0xdcff3b: test r10d, r10d
0xdcff3e: je 0x140dcff6e
0xdcff40: mov eax, edx
0xdcff42: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdcff47: jne 0x140dcff5f
0xdcff49: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdcff4e: mov rax, qword ptr [rsi + 0x430]
0xdcff55: mov rbx, qword ptr [rax + rcx*8]
0xdcff59: cmp dword ptr [rbx + 4], r9d
0xdcff5d: je 0x140dcff68
0xdcff5f: inc edx
0xdcff61: cmp edx, r10d
0xdcff64: jb 0x140dcff40
0xdcff66: jmp 0x140dcff6e
0xdcff68: add rbx, 8
0xdcff6c: jne 0x140dcffdf
0xdcff6e: mov qword ptr [rbp - 0x10], rdi
0xdcff72: mov qword ptr [rbp - 8], rdi
0xdcff76: lea rax, [rbp - 0x20]
0xdcff7a: mov qword ptr [rbp + 0x50], rax
0xdcff7e: inc dword ptr [rsi + 0x424]
0xdcff84: lea rax, [rbp + 0x58]
0xdcff88: mov qword ptr [rsp + 0x38], rax
0xdcff8d: lea rax, [rbp - 0x18]
0xdcff91: mov qword ptr [rsp + 0x30], rax
0xdcff96: lea rax, [rbp + 0x48]
0xdcff9a: mov qword ptr [rsp + 0x28], rax
0xdcff9f: lea r9, [rbp - 0x10]
0xdcffa3: mov r8d, dword ptr [rbp - 0x20]
0xdcffa7: lea rdx, [rbp + 0x50]
0xdcffab: lea rcx, [rsi + 0x418]
0xdcffb2: call 0x140436380
0xdcffb7: mov rbx, qword ptr [rbp + 0x58]
0xdcffbb: mov rcx, qword ptr [rbp - 0x10]
0xdcffbf: test rcx, rcx
0xdcffc2: je 0x140dcffd7
0xdcffc4: cmp byte ptr [r15 + r12], 0
0xdcffc9: je 0x140dcffd2
0xdcffcb: call 0x1447f03bc
0xdcffd0: jmp 0x140dcffd7
0xdcffd2: call 0x1447f02bc
0xdcffd7: mov qword ptr [rbp - 0x10], rdi
0xdcffdb: mov qword ptr [rbp - 8], rdi
0xdcffdf: mov ecx, dword ptr [rbx + 8]
0xdcffe2: mov eax, dword ptr [rbx + 0xc]
0xdcffe5: mov r15d, 1
0xdcffeb: cmp eax, ecx
0xdcffed: ja 0x140dd00b3
0xdcfff3: lea r14d, [rax*2 + 1]
0xdcfffb: add r14d, eax
0xdcfffe: shr r14d, 1
0xdd0001: cmp r14d, r15d
0xdd0004: cmovb r14d, r15d
0xdd0008: cmp ecx, r14d
0xdd000b: cmova r14d, ecx
0xdd000f: cmp r14d, eax
0xdd0012: jbe 0x140dd00ac
0xdd0018: lea ecx, [r14*8]
0xdd0020: mov eax, 0x1fd
0xdd0025: mov r15d, eax
0xdd0028: mov edx, 8
0xdd002d: cmp byte ptr [rax + r12], 0
0xdd0032: je 0x140dd003b
0xdd0034: call 0x1447efa78
0xdd0039: jmp 0x140dd0040
0xdd003b: call 0x1447ef9b0
0xdd0040: mov rsi, rax
0xdd0043: test rax, rax
0xdd0046: jne 0x140dd0063
0xdd0048: call 0x141318e70
0xdd004d: xor r9d, r9d
0xdd0050: xor r8d, r8d
0xdd0053: mov edx, 1
0xdd0058: mov ecx, 0xa0000002
0xdd005d: call qword ptr [rip + 0x441b0e5]
0xdd0063: cmp dword ptr [rbx + 8], 0
0xdd0067: jbe 0x140dd0084
0xdd0069: nop dword ptr [rax]
0xdd0070: mov edx, edi
0xdd0072: mov rax, qword ptr [rbx]
0xdd0075: mov rcx, qword ptr [rax + rdx*8]
0xdd0079: mov qword ptr [rsi + rdx*8], rcx
0xdd007d: inc edi
