0xdef810: mov rax, rsp
0xdef813: mov qword ptr [rax + 0x10], rbx
0xdef817: mov qword ptr [rax + 8], rcx
0xdef81b: push rbp
0xdef81c: push rsi
0xdef81d: push rdi
0xdef81e: push r12
0xdef820: push r13
0xdef822: push r14
0xdef824: push r15
0xdef826: lea rbp, [rax - 0x5f]
0xdef82a: sub rsp, 0xc0
0xdef831: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdef836: mov r15, r8
0xdef839: mov r12, rdx
0xdef83c: xor r13d, r13d
0xdef83f: mov rax, qword ptr gs:[0x58]
0xdef848: mov r14, qword ptr [rax]
0xdef84b: mov ecx, 0x1ec
0xdef850: mov rax, qword ptr [rip + 0x5f79cd1]
0xdef857: cmp byte ptr [rcx + r14], r13b
0xdef85b: cmovne rax, qword ptr [rip + 0x5f79ccd]
0xdef863: mov rax, qword ptr [rax]
0xdef866: mov rcx, qword ptr [rax + 8]
0xdef86a: mov rax, qword ptr [rcx + 0x270]
0xdef871: movzx ecx, word ptr [rax + 0xd6]
0xdef878: mov word ptr [rbp + 0x67], cx
0xdef87c: lea rcx, [rbp + 0x67]
0xdef880: call 0x140537250
0xdef885: mov ebx, dword ptr [rax]
0xdef887: mov qword ptr [rbp - 9], r13
0xdef88b: mov byte ptr [rbp - 1], 0x15
0xdef88f: xor eax, eax
0xdef891: mov dword ptr [rbp], eax
0xdef894: mov word ptr [rbp + 4], ax
0xdef898: mov byte ptr [rbp + 6], al
0xdef89b: mov eax, dword ptr [rip + 0x5c7546b]
0xdef8a1: mov ecx, 0xffffffff
0xdef8a6: mov r8d, ecx
0xdef8a9: cmp eax, ecx
0xdef8ab: jne 0x140def8b2
0xdef8ad: mov eax, r13d
0xdef8b0: jmp 0x140def8f2
0xdef8b2: shl rax, 5
0xdef8b6: mov r9, qword ptr [rip + 0x5c7545b]
0xdef8bd: mov edx, dword ptr [rax + r9 + 0xc]
0xdef8c2: cmp dword ptr [rip + 0x5c75437], r13d
0xdef8c9: jbe 0x140def8eb
0xdef8cb: cmp dword ptr [rip + 0x5c75433], edx
0xdef8d1: jbe 0x140def8eb
0xdef8d3: mov eax, edx
0xdef8d5: shl rax, 5
0xdef8d9: mov ecx, edx
0xdef8db: cmp byte ptr [rax + r9], 2
0xdef8e0: jb 0x140def8eb
0xdef8e2: mov rax, qword ptr [rax + r9 + 0x18]
0xdef8e7: mov r8d, dword ptr [rax + 8]
0xdef8eb: lea rax, [rip + 0x5c7540e]
0xdef8f2: mov qword ptr [rbp + 7], rax
0xdef8f6: mov dword ptr [rbp + 0xf], ecx
0xdef8f9: mov dword ptr [rbp + 0x13], r8d
0xdef8fd: lea rsi, [rip + 0x478e4cc]
0xdef904: vxorps xmm6, xmm6, xmm6
0xdef908: nop dword ptr [rax + rax]
0xdef910: test rax, rax
0xdef913: je 0x140defbe9
0xdef919: cmp dword ptr [rax], 0
0xdef91c: je 0x140defbe9
0xdef922: cmp ecx, -1
0xdef925: je 0x140defbe9
0xdef92b: mov edx, ecx
0xdef92d: shl rdx, 5
0xdef931: mov rdi, qword ptr [rax + 0x18]
0xdef935: cmp byte ptr [rdx + rdi], 2
0xdef939: jb 0x140defbe9
0xdef93f: mov rdi, qword ptr [rdx + rdi + 0x18]
0xdef944: cmp r8d, dword ptr [rdi + 8]
0xdef948: jne 0x140defbe9
0xdef94e: mov rdi, qword ptr [rdi]
0xdef951: test rdi, rdi
0xdef954: je 0x140defbc9
0xdef95a: cmp dword ptr [rdi + 0x15c], 0
0xdef961: je 0x140def9f9
0xdef967: mov ecx, dword ptr [rdi + 0x158]
0xdef96d: test ecx, ecx
0xdef96f: je 0x140def9f9
0xdef975: xor edx, edx
0xdef977: mov eax, ebx
0xdef979: div ecx
0xdef97b: mov r8d, edx
0xdef97e: shl r8, 8
0xdef982: add r8, qword ptr [rdi + 0x168]
0xdef989: mov edx, r13d
0xdef98c: mov r10d, dword ptr [r8]
0xdef98f: test r10d, r10d
0xdef992: je 0x140def9f9
0xdef994: mov eax, edx
0xdef996: cmp dword ptr [r8 + rax*8 + 8], ebx
0xdef99b: jne 0x140def9b3
0xdef99d: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdef9a2: mov rax, qword ptr [rdi + 0x170]
0xdef9a9: mov r9, qword ptr [rax + rcx*8]
0xdef9ad: cmp dword ptr [r9 + 4], ebx
0xdef9b1: je 0x140def9bc
0xdef9b3: inc edx
0xdef9b5: cmp edx, r10d
0xdef9b8: jb 0x140def994
0xdef9ba: jmp 0x140def9f9
0xdef9bc: lea rcx, [r9 + 8]
0xdef9c0: test rcx, rcx
0xdef9c3: je 0x140def9f9
0xdef9c5: lea rdx, [rbp - 9]
0xdef9c9: call 0x140de4500
0xdef9ce: test rax, rax
0xdef9d1: je 0x140def9f9
0xdef9d3: cmp qword ptr [rax], 0
0xdef9d7: je 0x140def9f9
0xdef9d9: mov dword ptr [rbp + 0x7f], r13d
0xdef9dd: lea r9, [rbp + 0x7f]
0xdef9e1: lea r8, [rbp - 9]
0xdef9e5: lea rdx, [rbp + 0x67]
0xdef9e9: mov rcx, rdi
0xdef9ec: call 0x140dffb40
0xdef9f1: test al, al
0xdef9f3: je 0x140defbe2
0xdef9f9: mov qword ptr [rbp - 0x49], r13
0xdef9fd: mov qword ptr [rbp - 0x41], r13
0xdefa01: vpxor xmm0, xmm0, xmm0
0xdefa05: vmovdqu xmmword ptr [rbp - 0x39], xmm0
0xdefa0a: mov qword ptr [rbp - 0x29], r13
0xdefa0e: mov edx, 1
0xdefa13: mov r8d, 0x20
0xdefa19: lea rcx, [rbp - 0x49]
0xdefa1d: call 0x14047b1e0
0xdefa22: mov ecx, dword ptr [rbp - 0x49]
0xdefa25: lea eax, [rcx + 0x20]
0xdefa28: cmp dword ptr [rbp - 0x3d], eax
0xdefa2b: jb 0x140defa78
0xdefa2d: mov r8d, dword ptr [rbp - 0x45]
0xdefa31: lea eax, [r8 + 1]
0xdefa35: cmp eax, dword ptr [rbp - 0x41]
0xdefa38: ja 0x140defa78
0xdefa3a: mov edx, ecx
0xdefa3c: add rdx, qword ptr [rbp - 0x29]
0xdefa40: mov qword ptr [rbp - 0x21], rdx
0xdefa44: mov qword ptr [rdx], rsi
0xdefa47: lea rax, [rip + 0x487d0e2]
0xdefa4e: mov qword ptr [rdx], rax
0xdefa51: mov qword ptr [rdx + 8], r13
0xdefa55: mov byte ptr [rdx + 0x10], 0xd
0xdefa59: mov eax, dword ptr [rip + 0x5ee1651]
0xdefa5f: mov dword ptr [rdx + 0x14], eax
0xdefa62: mov byte ptr [rdx + 0x18], r8b
0xdefa66: mov ecx, dword ptr [rbp - 0x45]
0xdefa69: mov rax, qword ptr [rbp - 0x39]
0xdefa6d: mov qword ptr [rax + rcx*8], rdx
0xdefa71: inc dword ptr [rbp - 0x45]
0xdefa74: add dword ptr [rbp - 0x49], 0x20
0xdefa78: lea rcx, [rbp + 0x67]
0xdefa7c: call 0x140537250
0xdefa81: mov rcx, qword ptr [rax + 0x68]
0xdefa85: mov rax, qword ptr [rcx]
0xdefa88: xor edx, edx
0xdefa8a: call qword ptr [rax + 8]
0xdefa8d: vmovss dword ptr [rbp - 0x11], xmm6
0xdefa92: mov dword ptr [rbp - 0xd], r13d
0xdefa96: mov byte ptr [rsp + 0x48], 1
0xdefa9b: lea rcx, [rbp - 0x49]
0xdefa9f: mov qword ptr [rsp + 0x40], rcx
0xdefaa4: mov byte ptr [rsp + 0x38], 0
0xdefaa9: mov qword ptr [rsp + 0x30], rax
0xdefaae: mov qword ptr [rsp + 0x28], r15
0xdefab3: lea rax, [rbp - 0x11]
0xdefab7: mov qword ptr [rsp + 0x20], rax
0xdefabc: lea r9, [rbp - 0xd]
0xdefac0: lea r8, [rbp - 9]
0xdefac4: lea rdx, [rbp + 0x67]
0xdefac8: mov rcx, rdi
0xdefacb: call 0x140deeb60
0xdefad0: nop 
0xdefad1: mov rcx, qword ptr [rbp - 0x29]
0xdefad5: test rcx, rcx
0xdefad8: je 0x140defbc9
0xdefade: mov esi, r13d
0xdefae1: cmp dword ptr [rbp - 0x45], r13d
0xdefae5: jbe 0x140defb14
0xdefae7: nop word ptr [rax + rax]
0xdefaf0: mov edi, esi
0xdefaf2: mov rax, qword ptr [rbp - 0x39]
0xdefaf6: mov rcx, qword ptr [rax + rdi*8]
0xdefafa: mov rax, qword ptr [rcx]
0xdefafd: xor edx, edx
0xdefaff: call qword ptr [rax]
0xdefb01: mov rax, qword ptr [rbp - 0x39]
0xdefb05: mov qword ptr [rax + rdi*8], r13
0xdefb09: inc esi
0xdefb0b: cmp esi, dword ptr [rbp - 0x45]
0xdefb0e: jb 0x140defaf0
0xdefb10: mov rcx, qword ptr [rbp - 0x29]
0xdefb14: mov qword ptr [rbp - 0x49], r13
0xdefb18: mov rdx, qword ptr [rbp - 0x39]
0xdefb1c: test rdx, rdx
0xdefb1f: je 0x140defb82
0xdefb21: mov rcx, qword ptr [rbp - 0x31]
0xdefb25: test rcx, rcx
0xdefb28: je 0x140defb4d
0xdefb2a: mov r8d, dword ptr [rbp - 0x41]
0xdefb2e: lea r8d, [r8*8]
0xdefb36: mov rax, qword ptr [rcx]
0xdefb39: call qword ptr [rax + 0x10]
0xdefb3c: mov eax, 0x1fd
0xdefb41: mov qword ptr [rbp - 0x39], r13
0xdefb45: mov edx, eax
0xdefb47: mov rcx, qword ptr [rbp - 0x29]
0xdefb4b: jmp 0x140defb87
0xdefb4d: mov edi, 0x1fd
0xdefb52: mov rcx, rdx
0xdefb55: cmp byte ptr [rdi + r14], 0
0xdefb5a: je 0x140defb6f
0xdefb5c: call 0x1447f03bc
0xdefb61: mov eax, edi
0xdefb63: mov qword ptr [rbp - 0x39], r13
0xdefb67: mov edx, eax
0xdefb69: mov rcx, qword ptr [rbp - 0x29]
0xdefb6d: jmp 0x140defb87
0xdefb6f: call 0x1447f02bc
0xdefb74: mov eax, edi
0xdefb76: mov qword ptr [rbp - 0x39], r13
0xdefb7a: mov edx, eax
0xdefb7c: mov rcx, qword ptr [rbp - 0x29]
0xdefb80: jmp 0x140defb87
0xdefb82: mov edx, 0x1fd
0xdefb87: test rcx, rcx
0xdefb8a: je 0x140defbbe
0xdefb8c: mov r9, qword ptr [rbp - 0x31]
0xdefb90: test r9, r9
0xdefb93: je 0x140defba7
0xdefb95: mov rax, qword ptr [r9]
0xdefb98: mov r8d, dword ptr [rbp - 0x3d]
0xdefb9c: mov rdx, rcx
0xdefb9f: mov rcx, r9
0xdefba2: call qword ptr [rax + 0x10]
0xdefba5: jmp 0x140defbba
0xdefba7: cmp byte ptr [r14 + rdx], 0
0xdefbac: je 0x140defbb5
0xdefbae: call 0x1447f03bc
0xdefbb3: jmp 0x140defbba
0xdefbb5: call 0x1447f02bc
0xdefbba: mov qword ptr [rbp - 0x29], r13
0xdefbbe: mov qword ptr [rbp - 0x41], r13
0xdefbc2: lea rsi, [rip + 0x478e207]
0xdefbc9: lea rcx, [rbp + 7]
0xdefbcd: call 0x14050d640
0xdefbd2: mov r8d, dword ptr [rbp + 0x13]
0xdefbd6: mov ecx, dword ptr [rbp + 0xf]
0xdefbd9: mov rax, qword ptr [rbp + 7]
0xdefbdd: jmp 0x140def910
0xdefbe2: xor al, al
0xdefbe4: jmp 0x140defcc7
0xdefbe9: mov rax, qword ptr [rip + 0x5f795f8]
0xdefbf0: mov rbx, qword ptr [rax + 0x90]
0xdefbf7: mov qword ptr [rbp - 0x21], r13
0xdefbfb: mov dword ptr [rbp - 0x19], 0xffffffff
0xdefc02: mov dword ptr [rbp - 0x15], r13d
0xdefc06: mov rdx, r15
0xdefc09: lea rcx, [rbp - 0x21]
0xdefc0d: call 0x1404df140
0xdefc12: nop 
0xdefc13: lea r9, [rbp - 0x21]
0xdefc17: lea rdx, [rip + 0x5ee1572]
0xdefc1e: mov rcx, rbx
0xdefc21: call 0x140946a40
0xdefc26: nop 
0xdefc27: cmp qword ptr [rbp - 0x21], 0
0xdefc2c: je 0x140defc77
0xdefc2e: mov ebx, dword ptr [rbp - 0x19]
0xdefc31: cmp ebx, -1
0xdefc34: je 0x140defc73
0xdefc36: call 0x140411e10
0xdefc3b: cmp ebx, dword ptr [rax + 0x10]
0xdefc3e: jae 0x140defc73
0xdefc40: mov rax, qword ptr [rax + 8]
0xdefc44: mov r8, qword ptr [rax + rbx*8]
0xdefc48: test r8, r8
0xdefc4b: je 0x140defc73
0xdefc4d: test byte ptr [r8 + 6], 1
0xdefc52: je 0x140defc5c
0xdefc54: cmp word ptr [r8 + 4], 8
0xdefc5a: jbe 0x140defc73
0xdefc5c: mov rcx, qword ptr [rbp - 0x21]
0xdefc60: test rcx, rcx
0xdefc63: je 0x140defc73
0xdefc65: mov rax, qword ptr [rcx]
0xdefc68: mov edx, 1
0xdefc6d: call qword ptr [rax]
0xdefc6f: mov qword ptr [rbp - 0x21], r13
0xdefc73: mov qword ptr [rbp - 0x21], r13
0xdefc77: mov dword ptr [rbp - 0x19], 0xffffffff
0xdefc7e: mov rax, qword ptr [rip + 0x5f79563]
0xdefc85: mov rbx, qword ptr [rax + 0xa8]
0xdefc8c: vmovups xmm0, xmmword ptr [r12]
0xdefc92: vpextrb byte ptr [rbx + 8], xmm0, 8
0xdefc99: vmovq qword ptr [rbx], xmm0
0xdefc9e: lea rdx, [rbx + 0x20]
0xdefca2: vmovsd xmm0, qword ptr [r15]
0xdefca7: vmovsd qword ptr [rdx], xmm0
0xdefcab: mov eax, dword ptr [r15 + 8]
0xdefcaf: mov dword ptr [rdx + 8], eax
0xdefcb2: cmp byte ptr [rbx + 0x3c], 0
0xdefcb6: jne 0x140defcc5
0xdefcb8: lea r8, [rbx + 0x10]
0xdefcbc: call 0x14064fb80
0xdefcc1: mov byte ptr [rbx + 0x3c], 1
0xdefcc5: mov al, 1
0xdefcc7: mov rbx, qword ptr [rsp + 0x108]
0xdefccf: vmovaps xmm6, xmmword ptr [rsp + 0xb0]
0xdefcd8: add rsp, 0xc0
0xdefcdf: pop r15
0xdefce1: pop r14
0xdefce3: pop r13
0xdefce5: pop r12
0xdefce7: pop rdi
0xdefce8: pop rsi
0xdefce9: pop rbp
0xdefcea: ret 
0xdefceb: int3 
0xdefcec: int3 
0xdefced: int3 
0xdefcee: int3 
0xdefcef: int3 
0xdefcf0: mov qword ptr [rsp + 0x18], rbx
0xdefcf5: mov qword ptr [rsp + 8], rcx
0xdefcfa: push rbp
0xdefcfb: push rsi
0xdefcfc: push rdi
0xdefcfd: mov rbp, rsp
0xdefd00: sub rsp, 0x40
0xdefd04: xor esi, esi
0xdefd06: mov rax, qword ptr gs:[0x58]
0xdefd0f: mov rcx, qword ptr [rax]
0xdefd12: mov edx, 0x1ec
0xdefd17: mov rax, qword ptr [rip + 0x5f7980a]
0xdefd1e: cmp byte ptr [rdx + rcx], sil
0xdefd22: cmovne rax, qword ptr [rip + 0x5f79806]
0xdefd2a: mov rax, qword ptr [rax]
0xdefd2d: mov rcx, qword ptr [rax + 8]
0xdefd31: mov rax, qword ptr [rcx + 0x270]
0xdefd38: movzx ecx, word ptr [rax + 0xd6]
0xdefd3f: mov word ptr [rbp + 0x20], cx
0xdefd43: lea rcx, [rbp + 0x20]
0xdefd47: call 0x140537250
0xdefd4c: mov ebx, dword ptr [rax]
0xdefd4e: mov qword ptr [rbp - 0x10], rsi
0xdefd52: mov byte ptr [rbp - 8], 0x15
0xdefd56: xor eax, eax
0xdefd58: mov dword ptr [rbp - 7], eax
0xdefd5b: mov word ptr [rbp - 3], ax
0xdefd5f: mov byte ptr [rbp - 1], al
0xdefd62: mov eax, dword ptr [rip + 0x5c74fa4]
0xdefd68: mov edx, 0xffffffff
0xdefd6d: mov ecx, edx
0xdefd6f: cmp eax, edx
0xdefd71: jne 0x140defd77
0xdefd73: mov eax, esi
0xdefd75: jmp 0x140defdba
0xdefd77: shl rax, 5
0xdefd7b: mov r9, qword ptr [rip + 0x5c74f96]
0xdefd82: mov r8d, dword ptr [rax + r9 + 0xc]