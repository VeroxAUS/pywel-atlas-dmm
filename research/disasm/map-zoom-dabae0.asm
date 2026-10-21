0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
0xdabb13: vmovaps xmmword ptr [rsp + 0x40], xmm6
0xdabb19: vxorps xmm6, xmm6, xmm6
0xdabb1d: vmovss dword ptr [rsp + 0x34], xmm6
0xdabb23: jne 0x140dabb2a
0xdabb25: mov dil, 1
0xdabb28: jmp 0x140dabb98
0xdabb2a: vcomiss xmm3, xmm0
0xdabb2e: vshufps xmm4, xmm0, xmm0, 0x55
0xdabb33: jbe 0x140dabb49
0xdabb35: vcomiss xmm4, xmm3
0xdabb39: jbe 0x140dabb49
0xdabb3b: vsubss xmm1, xmm3, xmm0
0xdabb3f: vsubss xmm0, xmm4, xmm0
0xdabb43: vdivss xmm2, xmm1, xmm0
0xdabb47: jmp 0x140dabb7f
0xdabb49: vshufps xmm2, xmm0, xmm0, 0xaa
0xdabb4e: vcomiss xmm3, xmm2
0xdabb52: jbe 0x140dabc96
0xdabb58: vshufps xmm0, xmm0, xmm0, 0xff
0xdabb5d: vcomiss xmm0, xmm3
0xdabb61: jbe 0x140dabc96
0xdabb67: vsubss xmm1, xmm3, xmm2
0xdabb6b: vsubss xmm0, xmm0, xmm2
0xdabb6f: vmovss xmm2, dword ptr [rip + 0x4fc753d]  ; [0x5d730b4] = 1 (0x3f800000)
0xdabb77: vdivss xmm3, xmm1, xmm0
0xdabb7b: vsubss xmm2, xmm2, xmm3
0xdabb7f: vucomiss xmm6, xmm2
0xdabb83: vmovss dword ptr [rsp + 0x34], xmm2
0xdabb89: jp 0x140dabcb8
0xdabb8f: jne 0x140dabcb8
0xdabb95: xor dil, dil
0xdabb98: cmp byte ptr [r8 + 0x11], 0
0xdabb9d: je 0x140dabc7c
0xdabba3: mov rcx, qword ptr [rbx + 0x20]
0xdabba7: lea r9, [rsp + 0x70]
0xdabbac: lea r8, [rsp + 0x34]
0xdabbb1: mov byte ptr [rsp + 0x70], 0
0xdabbb6: lea rdx, [rsp + 0x30]
0xdabbbb: mov byte ptr [rsp + 0x30], 0x52
0xdabbc0: call 0x14064b570
0xdabbc5: cmp byte ptr [rsp + 0x80], 1
0xdabbcd: jne 0x140dabc7c
0xdabbd3: mov rax, qword ptr [rbx + 0x38]
0xdabbd7: xor edx, edx
0xdabbd9: test rax, rax
0xdabbdc: je 0x140dabc2d
0xdabbde: mov r10, qword ptr [rax + 0x20]
0xdabbe2: mov rax, qword ptr [r10]
0xdabbe5: mov rcx, qword ptr [rax + 0xa0]
0xdabbec: test rcx, rcx
0xdabbef: je 0x140dabbf7
0xdabbf1: cmp qword ptr [rcx + 8], rdx
0xdabbf5: jne 0x140dabc2d
0xdabbf7: mov r10, qword ptr [r10 + 8]
0xdabbfb: mov r8d, edx
0xdabbfe: mov r9d, dword ptr [r10 + 8]
0xdabc02: test r9d, r9d
0xdabc05: je 0x140dabc21
0xdabc07: mov r10, qword ptr [r10]
0xdabc0a: mov eax, dword ptr [rip + 0x5f24850]  ; [0x6cd0460] = runtime global (no file value)
0xdabc10: mov ecx, r8d
0xdabc13: cmp eax, dword ptr [r10 + rcx*4]
0xdabc17: je 0x140dabc27
0xdabc19: inc r8d
0xdabc1c: cmp r8d, r9d
0xdabc1f: jb 0x140dabc10
0xdabc21: mov r8d, 0xffffffff
0xdabc27: cmp r8d, -1
0xdabc2b: jne 0x140dabc7c
0xdabc2d: mov r9, qword ptr [rbx + 0x20]
0xdabc31: vmovss xmm0, dword ptr [rsp + 0x34]
0xdabc37: vcomiss xmm0, xmm6
0xdabc3b: mov rax, qword ptr [r9]
0xdabc3e: mov rax, qword ptr [rax + 0xa0]
0xdabc45: jbe 0x140dabcc0
0xdabc47: test rax, rax
0xdabc4a: je 0x140dabc52
0xdabc4c: cmp qword ptr [rax + 8], rdx
0xdabc50: jne 0x140dabc75
0xdabc52: mov r9, qword ptr [r9 + 8]
0xdabc56: mov r8d, dword ptr [r9 + 8]
0xdabc5a: test r8d, r8d
0xdabc5d: je 0x140dabc75
0xdabc5f: mov r9, qword ptr [r9]
0xdabc62: mov eax, dword ptr [rip + 0x5f247fc]  ; [0x6cd0464] = runtime global (no file value)
0xdabc68: cmp eax, dword ptr [r9 + rdx*4]
0xdabc6c: je 0x140dabc75
0xdabc6e: inc edx
0xdabc70: cmp edx, r8d
0xdabc73: jb 0x140dabc68
0xdabc75: and byte ptr [rbx + 0xb4], 0xf7
0xdabc7c: vmovaps xmm6, xmmword ptr [rsp + 0x40]
0xdabc82: mov rbx, qword ptr [rsp + 0x68]
0xdabc87: movzx eax, dil
0xdabc8b: mov rdi, qword ptr [rsp + 0x60]
0xdabc90: add rsp, 0x50
0xdabc94: pop rsi
0xdabc95: ret 
0xdabc96: vcomiss xmm3, xmm4
0xdabc9a: jb 0x140dabb95
0xdabca0: vcomiss xmm2, xmm3
0xdabca4: jb 0x140dabb95
0xdabcaa: vmovss xmm0, dword ptr [rip + 0x4fc7402]  ; [0x5d730b4] = 1 (0x3f800000)
0xdabcb2: vmovss dword ptr [rsp + 0x34], xmm0
0xdabcb8: mov dil, 1
0xdabcbb: jmp 0x140dabb98
0xdabcc0: test rax, rax
0xdabcc3: je 0x140dabccb
0xdabcc5: cmp qword ptr [rax + 8], rdx
0xdabcc9: jne 0x140dabcf5
0xdabccb: mov r9, qword ptr [r9 + 8]
0xdabccf: mov r8d, dword ptr [r9 + 8]
0xdabcd3: test r8d, r8d
0xdabcd6: je 0x140dabcf5
0xdabcd8: mov r9, qword ptr [r9]
0xdabcdb: mov eax, dword ptr [rip + 0x5f24783]  ; [0x6cd0464] = runtime global (no file value)
0xdabce1: cmp eax, dword ptr [r9 + rdx*4]
0xdabce5: je 0x140dabcf0
0xdabce7: inc edx
0xdabce9: cmp edx, r8d
0xdabcec: jb 0x140dabce1
0xdabcee: jmp 0x140dabcf5
0xdabcf0: cmp edx, -1
0xdabcf3: jne 0x140dabc75
0xdabcf5: cmp byte ptr [rsi + 0xace], 1
0xdabcfc: je 0x140dabc75
0xdabd02: or byte ptr [rbx + 0xb4], 8
0xdabd09: jmp 0x140dabc7c