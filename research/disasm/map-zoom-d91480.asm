0xd91480: mov qword ptr [rsp + 0x18], r8
0xd91485: mov qword ptr [rsp + 0x10], rdx
0xd9148a: push rdi
0xd9148b: sub rsp, 0x50
0xd9148f: vmovaps xmmword ptr [rsp + 0x40], xmm6
0xd91495: mov qword ptr [rsp + 0x78], rbx
0xd9149a: lea rdx, [rsp + 0x60]
0xd9149f: mov rbx, rcx
0xd914a2: mov rdi, r9
0xd914a5: mov rcx, qword ptr [rcx + 8]
0xd914a9: mov rcx, qword ptr [rcx + 0x18]
0xd914ad: call 0x1435b4b90
0xd914b2: cmp byte ptr [rip + 0x5fd581f], 0  ; [0x6d66cd8] = runtime global (no file value)
0xd914b9: vmovss xmm3, dword ptr [rsp + 0x68]
0xd914bf: vmovss xmm1, dword ptr [rsp + 0x6c]
0xd914c5: vmovss xmm0, dword ptr [rip + 0x4fe1be7]  ; [0x5d730b4] = 1 (0x3f800000)
0xd914cd: vxorps xmm6, xmm6, xmm6
0xd914d1: vmovss dword ptr [rsp + 0x20], xmm3
0xd914d7: vmovss dword ptr [rsp + 0x24], xmm1
0xd914dd: vmovss dword ptr [rsp + 0x2c], xmm0
0xd914e3: vmovss dword ptr [rsp + 0x28], xmm6
0xd914e9: je 0x140d915f8
0xd914ef: mov r8, qword ptr [rbx + 0x7b0]
0xd914f6: test r8, r8
0xd914f9: je 0x140d915f8
0xd914ff: vmovups xmm2, xmmword ptr [rsp + 0x20]
0xd91505: mov r9, qword ptr [r8 + 0xa0]
0xd9150c: vpermilps xmm0, xmm2, 0
0xd91512: vmulps xmm3, xmm0, xmmword ptr [rbx + 0xa18]
0xd9151a: vpermilps xmm1, xmm2, 0x55
0xd91520: vfmadd231ps xmm3, xmm1, xmmword ptr [rbx + 0xa28]
0xd91529: vpermilps xmm0, xmm2, 0xaa
0xd9152f: vfmadd231ps xmm3, xmm0, xmmword ptr [rbx + 0xa38]
0xd91538: vpermilps xmm1, xmm2, 0xff
0xd9153e: vfmadd231ps xmm3, xmm1, xmmword ptr [rbx + 0xa48]
0xd91547: vmovups xmmword ptr [rsp + 0x20], xmm3
0xd9154d: vmovaps xmmword ptr [rsp + 0x30], xmm7
0xd91553: test r9, r9
0xd91556: je 0x140d9156e
0xd91558: cmp qword ptr [r9 + 8], 0
0xd9155d: je 0x140d9156e
0xd9155f: mov rcx, qword ptr [r8 + 0x38]
0xd91563: call 0x140d87da0
0xd91568: vmovaps xmm7, xmm0
0xd9156c: jmp 0x140d91577
0xd9156e: vmovss xmm7, dword ptr [r8 + 0x80]
0xd91577: vcomiss xmm7, xmm6
0xd9157b: jbe 0x140d915e6
0xd9157d: test r9, r9
0xd91580: je 0x140d91599
0xd91582: cmp qword ptr [r9 + 8], 0
0xd91587: je 0x140d91599
0xd91589: mov rcx, qword ptr [r8 + 0x38]
0xd9158d: lea rdx, [rsp + 0x68]
0xd91592: call 0x140d87d60
0xd91597: jmp 0x140d915a2
0xd91599: mov rax, qword ptr [r8 + 0x68]
0xd9159d: mov qword ptr [rsp + 0x68], rax
0xd915a2: vmovss xmm0, dword ptr [rsp + 0x28]
0xd915a8: vsubss xmm1, xmm0, xmm6
0xd915ac: vmovss xmm0, dword ptr [rsp + 0x20]
0xd915b2: vdivss xmm2, xmm1, xmm7
0xd915b6: vsubss xmm1, xmm0, dword ptr [rsp + 0x68]
0xd915bc: vaddss xmm5, xmm2, dword ptr [rip + 0x4fe1dc0]  ; [0x5d73384] = 3 (0x40400000)
0xd915c4: vmovss xmm0, dword ptr [rsp + 0x24]
0xd915ca: vdivss xmm2, xmm1, xmm5
0xd915ce: vsubss xmm1, xmm0, dword ptr [rsp + 0x6c]
0xd915d4: vaddss xmm3, xmm2, dword ptr [rsp + 0x68]
0xd915da: vdivss xmm2, xmm1, xmm5
0xd915de: vaddss xmm1, xmm2, dword ptr [rsp + 0x6c]
0xd915e4: jmp 0x140d915f2
0xd915e6: vmovss xmm1, dword ptr [rsp + 0x24]
0xd915ec: vmovss xmm3, dword ptr [rsp + 0x20]
0xd915f2: vmovaps xmm7, xmmword ptr [rsp + 0x30]
0xd915f8: vmovss xmm0, dword ptr [rdi]
0xd915fc: vmulss xmm4, xmm0, dword ptr [rsp + 0x70]
0xd91602: vmulss xmm2, xmm0, dword ptr [rsp + 0x74]
0xd91608: mov rbx, qword ptr [rsp + 0x78]
0xd9160d: mov al, 1
0xd9160f: vaddss xmm0, xmm4, xmm3
0xd91613: vcomiss xmm6, xmm0
0xd91617: ja 0x140d9163b
0xd91619: vsubss xmm0, xmm3, xmm4
0xd9161d: vcomiss xmm0, dword ptr [rsp + 0x60]
0xd91623: ja 0x140d9163b
0xd91625: vaddss xmm0, xmm2, xmm1
0xd91629: vcomiss xmm6, xmm0
0xd9162d: ja 0x140d9163b
0xd9162f: vsubss xmm0, xmm1, xmm2
0xd91633: vcomiss xmm0, dword ptr [rsp + 0x64]
0xd91639: jbe 0x140d9164c
0xd9163b: xor al, al
0xd9163d: cmp byte ptr [rsp + 0x80], al
0xd91644: je 0x140d9164c
0xd91646: mov dword ptr [rdi], 0
0xd9164c: vmovaps xmm6, xmmword ptr [rsp + 0x40]
0xd91652: add rsp, 0x50
0xd91656: pop rdi
0xd91657: ret 