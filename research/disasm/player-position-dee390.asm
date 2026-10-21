0xdee390: mov rax, rsp
0xdee393: mov qword ptr [rax + 0x10], rbx
0xdee397: mov qword ptr [rax + 8], rcx
0xdee39b: push rbp
0xdee39c: push rsi
0xdee39d: push rdi
0xdee39e: push r12
0xdee3a0: push r13
0xdee3a2: push r14
0xdee3a4: push r15
0xdee3a6: lea rbp, [rax - 0xcb8]
0xdee3ad: sub rsp, 0xd80
0xdee3b4: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdee3b9: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdee3be: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdee3c3: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdee3c8: vmovaps xmmword ptr [rax - 0x88], xmm10
0xdee3d0: vmovaps xmmword ptr [rax - 0x98], xmm11
0xdee3d8: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xdee3e0: mov r14, rcx
0xdee3e3: xor r15d, r15d
0xdee3e6: lea rdx, [rbp - 0x60]
0xdee3ea: call 0x14064f4f0
0xdee3ef: nop 
0xdee3f0: cmp byte ptr [rbp - 0x50], r15b
0xdee3f4: jne 0x140dee402
0xdee3f6: lea rsi, [rip + 0x4937a4b]
0xdee3fd: jmp 0x140deeb07
0xdee402: lea rdx, [rsp + 0x30]
0xdee407: mov rcx, qword ptr [rbp - 0x58]
0xdee40b: call 0x1417fa6c0
0xdee410: nop 
0xdee411: cmp byte ptr [rsp + 0x40], 0
0xdee416: jne 0x140dee462
0xdee418: lea rax, [rip + 0x4b24a41]
0xdee41f: mov qword ptr [rsp + 0x30], rax
0xdee424: cmp byte ptr [rsp + 0x40], 0
0xdee429: je 0x140dee43a
0xdee42b: mov rcx, qword ptr [rsp + 0x58]
0xdee430: mov rax, qword ptr [rcx]
0xdee433: call qword ptr [rax + 0x148]
0xdee439: nop 
0xdee43a: lea rax, [rip + 0x47853ff]
0xdee441: mov qword ptr [rsp + 0x30], rax
0xdee446: lea rsi, [rip + 0x49379fb]
0xdee44d: mov qword ptr [rsp + 0x30], rsi
0xdee452: lea rcx, [rsp + 0x30]
0xdee457: call 0x141434880
0xdee45c: nop 
0xdee45d: jmp 0x140deeb07
0xdee462: lea rdx, [rbp - 0x40]
0xdee466: call 0x14064f530
0xdee46b: nop 
0xdee46c: cmp byte ptr [rbp - 0x30], 0
0xdee470: je 0x140dee4ed
0xdee472: mov rbx, qword ptr [rbp - 0x38]
0xdee476: lea rdx, [rbx + 8]
0xdee47a: test rbx, rbx
0xdee47d: cmove rdx, r15
0xdee481: mov rdx, qword ptr [rdx]
0xdee484: lea rcx, [rbp + 0xcd0]
0xdee48b: call 0x140393df0
0xdee490: nop 
0xdee491: mov rcx, qword ptr [rbx + 0x68]
0xdee495: lea rdx, [rsp + 0x20]
0xdee49a: mov rcx, qword ptr [rcx + 0x1a0]
0xdee4a1: call 0x1404f8220
0xdee4a6: movsx ecx, word ptr [rax + 0xe]
0xdee4aa: vxorps xmm0, xmm0, xmm0
0xdee4ae: vcvtsi2ss xmm0, xmm0, ecx
0xdee4b2: vmulss xmm0, xmm0, dword ptr [rip + 0x4f8523a]
0xdee4ba: vaddss xmm10, xmm0, dword ptr [rax + 8]
0xdee4bf: vmovss xmm8, dword ptr [rax + 4]
0xdee4c4: movsx ecx, word ptr [rax + 0xc]
0xdee4c8: vxorps xmm0, xmm0, xmm0
0xdee4cc: vcvtsi2ss xmm0, xmm0, ecx
0xdee4d0: vmulss xmm1, xmm0, dword ptr [rip + 0x4f8521c]
0xdee4d8: vaddss xmm9, xmm1, dword ptr [rax]
0xdee4dc: mov rcx, qword ptr [rbp + 0xcd0]
0xdee4e3: mov rax, qword ptr [rcx]
0xdee4e6: mov dl, 1
0xdee4e8: call qword ptr [rax + 0x20]
0xdee4eb: jmp 0x140dee50e
0xdee4ed: vmovsd xmm0, qword ptr [rip + 0x4757993]
0xdee4f5: vmovss xmm10, dword ptr [rip + 0x4757993]
0xdee4fd: vshufps xmm8, xmm0, xmm0, 0x55
0xdee502: vmovsd qword ptr [rsp + 0x20], xmm0
0xdee508: vmovss xmm9, dword ptr [rsp + 0x20]
0xdee50e: lea rax, [rbp + 0x10]
0xdee512: mov qword ptr [rbp], rax
0xdee516: mov dword ptr [rbp + 8], r15d
0xdee51a: mov dword ptr [rbp + 0xc], 0x80
0xdee521: lea r12, [r14 + 0x178]
0xdee528: mov ecx, dword ptr [r12 + 4]
0xdee52d: mov dword ptr [rbp + 0xcd8], ecx
0xdee533: test ecx, ecx
0xdee535: jne 0x140dee54f
0xdee537: mov rsi, r15
0xdee53a: mov ecx, 0xffffffff
0xdee53f: mov r13d, ecx
0xdee542: mov eax, ecx
0xdee544: mov dword ptr [rbp + 0xcd8], ecx
0xdee54a: mov r12, r15
0xdee54d: jmp 0x140dee55f
0xdee54f: mov rax, qword ptr [r12 + 0x18]
0xdee554: mov rsi, qword ptr [rax]
0xdee557: mov r13d, r15d
0xdee55a: mov ecx, dword ptr [r12 + 0xc]
0xdee55f: mov dword ptr [rbp + 0xcd0], ecx
0xdee565: vmovdqu xmm12, xmmword ptr [rip + 0x4f87793]
0xdee56d: vxorps xmm11, xmm11, xmm11
0xdee572: test rsi, rsi
0xdee575: je 0x140dee6a7
0xdee57b: cmp dword ptr [r12 + 0xc], ecx
0xdee580: jne 0x140dee6a7
0xdee586: add rsi, 8
0xdee58a: mov r14d, dword ptr [rsi + 4]
0xdee58e: test r14d, r14d
0xdee591: jne 0x140dee5a6
0xdee593: mov rsi, r15
0xdee596: mov rbx, r15
0xdee599: mov edi, 0xffffffff
0xdee59e: mov r15d, edi
0xdee5a1: mov r14d, edi
0xdee5a4: jmp 0x140dee5b4
0xdee5a6: mov rax, qword ptr [rsi + 0x18]
0xdee5aa: mov rbx, qword ptr [rax]
0xdee5ad: mov edi, r15d
0xdee5b0: mov r15d, dword ptr [rsi + 0xc]
0xdee5b4: test rbx, rbx
0xdee5b7: je 0x140dee67c
0xdee5bd: cmp dword ptr [rsi + 0xc], r15d
0xdee5c1: jne 0x140dee67c
0xdee5c7: mov rcx, qword ptr [rbx + 0x18]
0xdee5cb: vsubss xmm6, xmm9, dword ptr [rcx + 0xe0]
0xdee5d3: vsubss xmm7, xmm10, dword ptr [rcx + 0xe8]
0xdee5db: add rcx, 0xde
0xdee5e2: call 0x140537250
0xdee5e7: vmovss xmm3, dword ptr [rax + 0x88]
0xdee5ef: vmulss xmm0, xmm6, xmm6
0xdee5f3: vaddss xmm1, xmm0, xmm11
0xdee5f8: vmulss xmm0, xmm7, xmm7
0xdee5fc: vaddss xmm2, xmm1, xmm0
0xdee600: vmulss xmm1, xmm3, xmm3
0xdee604: vcomiss xmm1, xmm2
0xdee608: jbe 0x140dee661
0xdee60a: mov rax, qword ptr [rbx + 0x18]
0xdee60e: vmovss xmm0, dword ptr [rax + 0xe4]
0xdee616: vucomiss xmm0, xmm11
0xdee61b: jp 0x140dee61f
0xdee61d: je 0x140dee63c
0xdee61f: cmp byte ptr [rbp - 0x30], 0
0xdee623: je 0x140dee63c
0xdee625: vsubss xmm1, xmm8, xmm0
0xdee629: vandps xmm1, xmm1, xmm12
0xdee62e: vmovss xmm0, dword ptr [rip + 0x5ebe352]
0xdee636: vcomiss xmm0, xmm1
0xdee63a: jbe 0x140dee661
0xdee63c: movzx eax, word ptr [rax + 0xde]
0xdee643: mov word ptr [rsp + 0x60], ax
0xdee648: vmovups xmm0, xmmword ptr [rbx + 8]
0xdee64d: vmovups xmmword ptr [rsp + 0x68], xmm0
0xdee653: lea rdx, [rsp + 0x60]
0xdee658: lea rcx, [rbp]
0xdee65c: call 0x140e011f0
0xdee661: inc edi
0xdee663: cmp edi, r14d
0xdee666: jae 0x140dee675
0xdee668: mov rax, qword ptr [rsi + 0x18]
0xdee66c: mov rbx, qword ptr [rax + rdi*8]
0xdee670: jmp 0x140dee5b4
0xdee675: xor ebx, ebx
0xdee677: jmp 0x140dee5b4
0xdee67c: inc r13d
0xdee67f: mov ecx, dword ptr [rbp + 0xcd0]
0xdee685: xor r15d, r15d
0xdee688: cmp r13d, dword ptr [rbp + 0xcd8]
0xdee68f: jae 0x140dee69f
0xdee691: mov rax, qword ptr [r12 + 0x18]
0xdee696: mov rsi, qword ptr [rax + r13*8]
0xdee69a: jmp 0x140dee572
0xdee69f: mov rsi, r15
0xdee6a2: jmp 0x140dee572
0xdee6a7: mov rsi, qword ptr [rbp + 0xcc0]
0xdee6ae: add rsi, 0x198
0xdee6b5: mov ecx, dword ptr [rsi + 4]
0xdee6b8: mov dword ptr [rbp + 0xcd8], ecx
0xdee6be: test ecx, ecx
0xdee6c0: jne 0x140dee6da
0xdee6c2: mov rdi, r15
0xdee6c5: mov ecx, 0xffffffff
0xdee6ca: mov r13d, ecx
0xdee6cd: mov eax, ecx
0xdee6cf: mov dword ptr [rbp + 0xcd8], ecx
0xdee6d5: mov r12, r15
0xdee6d8: jmp 0x140dee6ea
0xdee6da: mov rax, qword ptr [rsi + 0x18]
0xdee6de: mov rdi, qword ptr [rax]
0xdee6e1: mov r13d, r15d
0xdee6e4: mov ecx, dword ptr [rsi + 0xc]
0xdee6e7: mov r12, rsi
0xdee6ea: mov dword ptr [rbp + 0xcd0], ecx
0xdee6f0: test rdi, rdi
0xdee6f3: je 0x140dee7a6
0xdee6f9: cmp dword ptr [r12 + 0xc], ecx
0xdee6fe: jne 0x140dee7a6
0xdee704: add rdi, 8
0xdee708: mov r14d, dword ptr [rdi + 4]
0xdee70c: test r14d, r14d
0xdee70f: jne 0x140dee724
0xdee711: mov rdi, r15
0xdee714: mov rdx, r15
0xdee717: mov ebx, 0xffffffff
0xdee71c: mov r15d, ebx
0xdee71f: mov r14d, ebx
0xdee722: jmp 0x140dee732
0xdee724: mov rax, qword ptr [rdi + 0x18]
0xdee728: mov rdx, qword ptr [rax]
0xdee72b: mov ebx, r15d
0xdee72e: mov r15d, dword ptr [rdi + 0xc]
0xdee732: test rdx, rdx
0xdee735: je 0x140dee77b
0xdee737: cmp dword ptr [rdi + 0xc], r15d
0xdee73b: jne 0x140dee77b
0xdee73d: mov rax, qword ptr [rdx + 0x18]
0xdee741: movzx ecx, word ptr [rax + 0xde]
0xdee748: mov word ptr [rsp + 0x60], cx
0xdee74d: vmovups xmm0, xmmword ptr [rdx + 8]
0xdee752: vmovups xmmword ptr [rsp + 0x68], xmm0
0xdee758: lea rdx, [rsp + 0x60]
0xdee75d: lea rcx, [rbp]
0xdee761: call 0x140e011f0
0xdee766: inc ebx
0xdee768: cmp ebx, r14d
0xdee76b: jae 0x140dee777
0xdee76d: mov rax, qword ptr [rdi + 0x18]
0xdee771: mov rdx, qword ptr [rax + rbx*8]
0xdee775: jmp 0x140dee732
0xdee777: xor edx, edx
0xdee779: jmp 0x140dee732
0xdee77b: inc r13d
0xdee77e: mov ecx, dword ptr [rbp + 0xcd0]
0xdee784: xor r15d, r15d
0xdee787: cmp r13d, dword ptr [rbp + 0xcd8]
0xdee78e: jae 0x140dee79e
0xdee790: mov rax, qword ptr [r12 + 0x18]
0xdee795: mov rdi, qword ptr [rax + r13*8]
0xdee799: jmp 0x140dee6f0
0xdee79e: mov rdi, r15
0xdee7a1: jmp 0x140dee6f0
0xdee7a6: inc dword ptr [rsi + 0xc]
0xdee7a9: cmp qword ptr [rsi + 0x10], 0
0xdee7ae: je 0x140dee7d4
0xdee7b0: mov edx, r15d
0xdee7b3: cmp dword ptr [rsi], 0
0xdee7b6: jbe 0x140dee7d4
0xdee7b8: nop dword ptr [rax + rax]
0xdee7c0: mov ecx, edx
0xdee7c2: shl rcx, 8
0xdee7c6: mov rax, qword ptr [rsi + 0x10]
0xdee7ca: mov dword ptr [rcx + rax], r15d
0xdee7ce: inc edx
0xdee7d0: cmp edx, dword ptr [rsi]
0xdee7d2: jb 0x140dee7c0
0xdee7d4: mov r13d, 0x1fd
0xdee7da: cmp qword ptr [rsi + 0x18], 0
0xdee7df: je 0x140dee855
0xdee7e1: mov edi, r15d
0xdee7e4: cmp dword ptr [rsi + 4], 0
0xdee7e8: jbe 0x140dee851
0xdee7ea: nop word ptr [rax + rax]
0xdee7f0: mov ebx, edi
0xdee7f2: mov rax, qword ptr [rsi + 0x18]
0xdee7f6: mov rcx, qword ptr [rax + rbx*8]
0xdee7fa: mov qword ptr [rbp + 0xcd0], rcx
0xdee801: add rcx, 8
0xdee805: inc dword ptr [rcx + 0xc]
0xdee808: call 0x1403955e0
0xdee80d: mov rax, qword ptr [rsi + 0x18]
0xdee811: mov rcx, qword ptr [rax + rbx*8]
0xdee815: test rcx, rcx
0xdee818: je 0x140dee83a
0xdee81a: mov rax, qword ptr gs:[0x58]
0xdee823: mov rdx, qword ptr [rax]
0xdee826: cmp byte ptr [r13 + rdx], 0
0xdee82c: je 0x140dee835
0xdee82e: call 0x1447f03bc
0xdee833: jmp 0x140dee83a
0xdee835: call 0x1447f02bc
0xdee83a: mov rax, qword ptr [rsi + 0x18]
0xdee83e: mov qword ptr [rax + rbx*8], r15
0xdee842: mov rax, qword ptr [rsi + 0x18]
0xdee846: mov qword ptr [rax + rbx*8], r15
0xdee84a: inc edi
0xdee84c: cmp edi, dword ptr [rsi + 4]
0xdee84f: jb 0x140dee7f0
0xdee851: mov dword ptr [rsi + 4], r15d
0xdee855: mov rcx, qword ptr [rsp + 0x38]
0xdee85a: mov rax, qword ptr [rcx]
0xdee85d: call qword ptr [rax + 0x40]
0xdee860: mov rbx, rax
0xdee863: lea rdx, [rax + 8]
0xdee867: test rax, rax
0xdee86a: cmove rdx, r15
0xdee86e: mov rdx, qword ptr [rdx]
0xdee871: lea rcx, [rbp + 0xcd0]
0xdee878: call 0x140393df0
0xdee87d: nop 
0xdee87e: movzx eax, word ptr [rbx + 0x190]
0xdee885: mov ecx, 0xffff
0xdee88a: mov r15, 0xffffffffffffffff
0xdee891: cmp ax, cx
0xdee894: je 0x140dee8a7
0xdee896: mov qword ptr [rsp + 0x20], r15
0xdee89b: mov word ptr [rsp + 0x20], ax
0xdee8a0: mov r15, qword ptr [rsp + 0x20]
0xdee8a5: jmp 0x140dee8b6
0xdee8a7: xor eax, eax
0xdee8a9: mov dword ptr [rsp + 0x29], eax
0xdee8ad: mov word ptr [rsp + 0x2d], ax
0xdee8b2: mov byte ptr [rsp + 0x2f], al
0xdee8b6: mov rcx, qword ptr [rbp + 0xcd0]
0xdee8bd: mov rax, qword ptr [rcx]
0xdee8c0: mov dl, 1
0xdee8c2: call qword ptr [rax + 0x20]
0xdee8c5: mov rdi, qword ptr [rbp]
0xdee8c9: mov eax, dword ptr [rbp + 8]
0xdee8cc: lea rcx, [rax + rax*2]
0xdee8d0: lea r12, [rdi + rcx*8]
0xdee8d4: lea rsi, [rip + 0x493756d]
0xdee8db: cmp rdi, r12
0xdee8de: je 0x140deea88
0xdee8e4: mov r14, qword ptr [rbp + 0xcc0]
0xdee8eb: nop dword ptr [rax + rax]
0xdee8f0: mov rcx, rdi
0xdee8f3: call 0x140537250
0xdee8f8: cmp dword ptr [rax + 0x2c], 0x1b
0xdee8fc: jne 0x140dee9ea
0xdee902: cmp r15, -1
0xdee906: jne 0x140deea7b
0xdee90c: mov rax, qword ptr [r14]
0xdee90f: mov rcx, r14
0xdee912: call qword ptr [rax + 0x110]
0xdee918: mov rax, qword ptr [rip + 0x5f7a8c9]
0xdee91f: mov r14, qword ptr [rax + 0xa8]
0xdee926: vmovss xmm0, dword ptr [r14 + 0x24]
0xdee92c: vucomiss xmm0, xmm11
0xdee931: jp 0x140dee939
0xdee933: je 0x140dee9cd
0xdee939: lea rdx, [rbp - 0x80]
0xdee93d: call 0x14064f530
0xdee942: nop 
0xdee943: cmp byte ptr [rbp - 0x70], 0
0xdee947: je 0x140dee9c0
0xdee949: mov rbx, qword ptr [rbp - 0x78]
0xdee94d: lea rdx, [rbx + 8]
0xdee951: test rbx, rbx
0xdee954: mov eax, 0
0xdee959: cmove rdx, rax
0xdee95d: mov rdx, qword ptr [rdx]
0xdee960: lea rcx, [rsp + 0x20]
0xdee965: call 0x140393df0
0xdee96a: nop 
0xdee96b: mov rcx, qword ptr [rbx + 0x68]
0xdee96f: lea rdx, [rsp + 0x60]
0xdee974: mov rcx, qword ptr [rcx + 0x1a0]
0xdee97b: call 0x1404f8220
0xdee980: vmovss xmm6, dword ptr [rax + 4]
0xdee985: mov rcx, qword ptr [rsp + 0x20]
0xdee98a: mov rax, qword ptr [rcx]
0xdee98d: mov dl, 1
0xdee98f: call qword ptr [rax + 0x20]
0xdee992: vsubss xmm0, xmm6, dword ptr [r14 + 0x24]
0xdee998: vandps xmm0, xmm0, xmm12
0xdee99d: vcomiss xmm0, dword ptr [rip + 0x5efc123]
0xdee9a5: jbe 0x140dee9c0
0xdee9a7: mov qword ptr [rbp - 0x80], rsi
0xdee9ab: lea rcx, [rbp - 0x80]
0xdee9af: call 0x141434880
0xdee9b4: mov r14, qword ptr [rbp + 0xcc0]
0xdee9bb: jmp 0x140deea7b
0xdee9c0: mov qword ptr [rbp - 0x80], rsi
0xdee9c4: lea rcx, [rbp - 0x80]
0xdee9c8: call 0x141434880
0xdee9cd: mov r14, qword ptr [rbp + 0xcc0]
0xdee9d4: mov rax, qword ptr [r14]
0xdee9d7: mov rcx, r14
0xdee9da: call qword ptr [rax + 0x110]
0xdee9e0: call 0x140defcf0
0xdee9e5: jmp 0x140deea7b
0xdee9ea: mov rcx, rdi
0xdee9ed: call 0x140537250
0xdee9f2: cmp dword ptr [rax + 0x2c], 0x25
0xdee9f6: je 0x140deea06
0xdee9f8: mov rcx, rdi
0xdee9fb: call 0x140537250
0xdeea00: cmp dword ptr [rax + 0x2c], 0x66
0xdeea04: jne 0x140deea5d
0xdeea06: mov rcx, rdi
0xdeea09: call 0x140537250
0xdeea0e: cmp dword ptr [rax + 0x2c], 0x66
0xdeea12: sete bl
0xdeea15: vmovups xmm6, xmmword ptr [rdi + 8]
0xdeea1a: mov rax, qword ptr [r14]
0xdeea1d: mov rcx, r14
0xdeea20: call qword ptr [rax + 0x110]
0xdeea26: lea rdx, [rbp - 0x20]
0xdeea2a: call 0x14064f4f0
0xdeea2f: nop 
0xdeea30: cmp byte ptr [rbp - 0x10], 0
0xdeea34: je 0x140deea50
0xdeea36: movzx r9d, bl
0xdeea3a: vmovq r8, xmm6
0xdeea3f: lea rdx, [rbp + 0xcd8]
0xdeea46: mov rcx, qword ptr [rbp - 0x18]
0xdeea4a: call 0x14050ac10
0xdeea4f: nop 
0xdeea50: mov qword ptr [rbp - 0x20], rsi
0xdeea54: lea rcx, [rbp - 0x20]
0xdeea58: call 0x141434880
0xdeea5d: xor eax, eax
0xdeea5f: mov dword ptr [rbp + 0xcd0], eax
0xdeea65: lea r8, [rdi + 8]
0xdeea69: lea r9, [rbp + 0xcd0]
0xdeea70: mov rdx, rdi
0xdeea73: mov rcx, r14
0xdeea76: call 0x140dffb40
0xdeea7b: add rdi, 0x18
0xdeea7f: cmp rdi, r12
0xdeea82: jne 0x140dee8f0
0xdeea88: lea rax, [rbp + 0x10]
0xdeea8c: mov rcx, qword ptr [rbp]
0xdeea90: cmp rcx, rax
0xdeea93: je 0x140deeabb
0xdeea95: test rcx, rcx
0xdeea98: je 0x140deeabb
0xdeea9a: mov rax, qword ptr gs:[0x58]
0xdeeaa3: mov rdx, qword ptr [rax]
0xdeeaa6: cmp byte ptr [r13 + rdx], 0
0xdeeaac: je 0x140deeab5
0xdeeaae: call 0x1447f03bc
0xdeeab3: jmp 0x140deeabb
0xdeeab5: call 0x1447f02bc
0xdeeaba: nop 
0xdeeabb: mov qword ptr [rbp - 0x40], rsi
0xdeeabf: lea rcx, [rbp - 0x40]
0xdeeac3: call 0x141434880
0xdeeac8: nop 
0xdeeac9: lea rax, [rip + 0x4b24390]
0xdeead0: mov qword ptr [rsp + 0x30], rax
0xdeead5: cmp byte ptr [rsp + 0x40], 0
0xdeeada: je 0x140deeaeb
0xdeeadc: mov rcx, qword ptr [rsp + 0x58]
0xdeeae1: mov rax, qword ptr [rcx]
0xdeeae4: call qword ptr [rax + 0x148]
0xdeeaea: nop 
0xdeeaeb: lea rax, [rip + 0x4784d4e]
0xdeeaf2: mov qword ptr [rsp + 0x30], rax
0xdeeaf7: mov qword ptr [rsp + 0x30], rsi
0xdeeafc: lea rcx, [rsp + 0x30]
0xdeeb01: call 0x141434880
0xdeeb06: nop 
0xdeeb07: mov qword ptr [rbp - 0x60], rsi
0xdeeb0b: lea rcx, [rbp - 0x60]
0xdeeb0f: call 0x141434880
0xdeeb14: lea r11, [rsp + 0xd80]
0xdeeb1c: mov rbx, qword ptr [r11 + 0x48]
0xdeeb20: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdeeb26: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdeeb2c: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdeeb32: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdeeb38: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdeeb3e: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdeeb44: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdeeb4a: mov rsp, r11
0xdeeb4d: pop r15
0xdeeb4f: pop r14
0xdeeb51: pop r13
0xdeeb53: pop r12
0xdeeb55: pop rdi
0xdeeb56: pop rsi
0xdeeb57: pop rbp
0xdeeb58: ret 