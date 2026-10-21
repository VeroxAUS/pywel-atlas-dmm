0x186e450: mov qword ptr [rsp + 0x20], r9
0x186e455: mov dword ptr [rsp + 0x18], r8d
0x186e45a: mov qword ptr [rsp + 0x10], rdx
0x186e45f: mov qword ptr [rsp + 8], rcx
0x186e464: push rbp
0x186e465: push rbx
0x186e466: push rsi
0x186e467: push rdi
0x186e468: push r12
0x186e46a: push r13
0x186e46c: push r14
0x186e46e: push r15
0x186e470: lea rbp, [rsp - 0x188]
0x186e478: sub rsp, 0x288
0x186e47f: mov r15, r9
0x186e482: mov r14d, r8d
0x186e485: mov r13, rdx
0x186e488: mov r12, rcx
0x186e48b: xor eax, eax
0x186e48d: mov dword ptr [rbp - 0x80], eax
0x186e490: mov qword ptr [rbp + 0x168], rax
0x186e497: mov qword ptr [rbp + 0x170], 0x105
0x186e4a2: mov dword ptr [rbp + 0x174], eax
0x186e4a8: mov byte ptr [rbp + 0x60], al
0x186e4ab: mov dword ptr [rbp + 0x174], eax
0x186e4b1: mov byte ptr [rbp + 0x60], al
0x186e4b4: mov rax, qword ptr [rbp + 0x168]
0x186e4bb: test rax, rax
0x186e4be: je 0x14186e4c3
0x186e4c0: mov byte ptr [rax], 0
0x186e4c3: mov dword ptr [rbp - 0x58], r14d
0x186e4c7: mov dword ptr [rbp + 0x174], 0xffffffff
0x186e4d1: lea rcx, [rbp + 0x60]
0x186e4d5: mov rax, qword ptr [rbp + 0x168]
0x186e4dc: test rax, rax
0x186e4df: cmovne rcx, rax
0x186e4e3: lea rax, [rbp - 0x58]
0x186e4e7: mov qword ptr [rsp + 0x20], rax
0x186e4ec: lea r9, [rip + 0x3f3b015]
0x186e4f3: lea r8, [rip + 0x3d2093e]
0x186e4fa: mov edx, dword ptr [rbp + 0x170]
0x186e500: call 0x14066efb0
0x186e505: mov rbx, qword ptr [r12 + 0x50]
0x186e50a: lea rsi, [rbp + 0x60]
0x186e50e: mov rax, qword ptr [rbp + 0x168]
0x186e515: test rax, rax
0x186e518: cmovne rsi, rax
0x186e51c: mov rcx, qword ptr [rbx]
0x186e51f: mov rax, qword ptr [rcx]
0x186e522: mov edx, 0xffffffff
0x186e527: call qword ptr [rax + 0x18]
0x186e52a: mov qword ptr [rsp + 0x70], rsi
0x186e52f: mov rdi, 0xffffffffffffffff
0x186e536: test rsi, rsi
0x186e539: jne 0x14186e53f
0x186e53b: xor eax, eax
0x186e53d: jmp 0x14186e54b
0x186e53f: mov rax, rdi
0x186e542: inc rax
0x186e545: cmp byte ptr [rsi + rax], 0
0x186e549: jne 0x14186e542
0x186e54b: mov dword ptr [rsp + 0x78], eax
0x186e54f: vmovups xmm0, xmmword ptr [rsp + 0x70]
0x186e555: vmovdqa xmmword ptr [rsp + 0x70], xmm0
0x186e55b: cmp dword ptr [rbx + 0x1c], 0
0x186e55f: je 0x14186e5b6
0x186e561: lea rcx, [rsp + 0x70]
0x186e566: mov qword ptr [rbp - 0x50], rcx
0x186e56a: mov edx, eax
0x186e56c: mov rcx, rsi
0x186e56f: call 0x141364780
0x186e574: lea r9, [rbp - 0x58]
0x186e578: lea r8, [rbp - 0x50]
0x186e57c: mov edx, eax
0x186e57e: lea rcx, [rbx + 0x18]
0x186e582: call 0x140612620
0x186e587: test rax, rax
0x186e58a: je 0x14186e5b6
0x186e58c: add rax, 0x10
0x186e590: je 0x14186e5b6
0x186e592: mov rax, qword ptr [rax]
0x186e595: test rax, rax
0x186e598: je 0x14186e5b6
0x186e59a: xor ecx, ecx
0x186e59c: mov dword ptr [rax + 0x6a8], ecx
0x186e5a2: mov dword ptr [rax + 0x6b8], ecx
0x186e5a8: mov dword ptr [rax + 0x6c8], ecx
0x186e5ae: mov byte ptr [rax + 0x698], cl
0x186e5b4: jmp 0x14186e5dd
0x186e5b6: lea eax, [r14 - 3]
0x186e5ba: test eax, eax
0x186e5bc: jne 0x14186e5dd
0x186e5be: lea rdx, [rbp + 0x60]
0x186e5c2: mov rax, qword ptr [rbp + 0x168]
0x186e5c9: test rax, rax
0x186e5cc: cmovne rdx, rax
0x186e5d0: mov r8b, 1
0x186e5d3: mov rcx, qword ptr [r12 + 0x50]
0x186e5d8: call 0x142355ec0
0x186e5dd: mov rsi, qword ptr [r15 + 0xa0]
0x186e5e4: mov qword ptr [rbp + 0x50], rsi
0x186e5e8: lea r9, [rbp + 0x60]
0x186e5ec: mov rax, qword ptr [rbp + 0x168]
0x186e5f3: test rax, rax
0x186e5f6: cmovne r9, rax
0x186e5fa: mov r8, qword ptr [r12 + 0x50]
0x186e5ff: lea rdx, [rbp - 0x58]
0x186e603: mov rcx, rsi
0x186e606: call 0x142069640
0x186e60b: mov ebx, dword ptr [rax]
0x186e60d: test ebx, ebx
0x186e60f: je 0x14186e65a
0x186e611: mov eax, dword ptr [rsi + 0x60]
0x186e614: mov dword ptr [rbp + 0x1d0], eax
0x186e61a: lea rax, [rbp + 0x1e0]
0x186e621: mov qword ptr [rsp + 0x68], rax
0x186e626: lea rax, [rbp + 0x1d0]
0x186e62d: mov qword ptr [rsp + 0x60], rax
0x186e632: lea rax, [rip + 0x3f6d157]
0x186e639: mov qword ptr [rsp + 0x58], rax
0x186e63e: mov dword ptr [rsp + 0x50], 6
0x186e646: mov dword ptr [rsp + 0x48], ebx
0x186e64a: mov cl, 1
0x186e64c: call 0x141292ef0
0x186e651: mov dword ptr [r13], ebx
0x186e655: jmp 0x14186ef7d
0x186e65a: lea r9, [rbp + 0x60]
0x186e65e: mov rax, qword ptr [rbp + 0x168]
0x186e665: test rax, rax
0x186e668: cmovne r9, rax
0x186e66c: mov r8, qword ptr [r12 + 0x50]
0x186e671: lea rdx, [rbp - 0x58]
0x186e675: mov rcx, r15
0x186e678: call 0x142069640
0x186e67d: mov ebx, dword ptr [rax]
0x186e67f: test ebx, ebx
0x186e681: je 0x14186e6cd
0x186e683: mov eax, dword ptr [r15 + 0x60]
0x186e687: mov dword ptr [rbp + 0x1d0], eax
0x186e68d: lea rax, [rbp + 0x1e0]
0x186e694: mov qword ptr [rsp + 0x68], rax
0x186e699: lea rax, [rbp + 0x1d0]
0x186e6a0: mov qword ptr [rsp + 0x60], rax
0x186e6a5: lea rax, [rip + 0x3f6d0e4]
0x186e6ac: mov qword ptr [rsp + 0x58], rax
0x186e6b1: mov dword ptr [rsp + 0x50], 6
0x186e6b9: mov dword ptr [rsp + 0x48], ebx
0x186e6bd: mov cl, 1
0x186e6bf: call 0x141292ef0
0x186e6c4: mov dword ptr [r13], ebx
0x186e6c8: jmp 0x14186ef7d
0x186e6cd: lea eax, [r14 - 3]
0x186e6d1: test eax, eax
0x186e6d3: jne 0x14186ef5f
0x186e6d9: mov rbx, qword ptr [r12 + 0x50]
0x186e6de: lea rsi, [rbp + 0x60]
0x186e6e2: mov rax, qword ptr [rbp + 0x168]
0x186e6e9: test rax, rax
0x186e6ec: cmovne rsi, rax
0x186e6f0: mov rcx, qword ptr [rbx]
0x186e6f3: mov rax, qword ptr [rcx]
0x186e6f6: mov edx, 0xffffffff
0x186e6fb: call qword ptr [rax + 0x18]
0x186e6fe: mov qword ptr [rbp - 0x20], rsi
0x186e702: test rsi, rsi
0x186e705: jne 0x14186e710
0x186e707: xor r14d, r14d
0x186e70a: mov edi, r14d
0x186e70d: jmp 0x14186e71c
0x186e70f: nop 
0x186e710: inc rdi
0x186e713: cmp byte ptr [rsi + rdi], 0
0x186e717: jne 0x14186e710
0x186e719: xor r14d, r14d
0x186e71c: mov dword ptr [rbp - 0x18], edi
0x186e71f: vmovups xmm0, xmmword ptr [rbp - 0x20]
0x186e724: vmovdqa xmmword ptr [rbp - 0x20], xmm0
0x186e729: cmp dword ptr [rbx + 0x1c], 0
0x186e72d: je 0x14186e76d
0x186e72f: lea rax, [rbp - 0x20]
0x186e733: mov qword ptr [rbp + 0x1f0], rax
0x186e73a: mov edx, edi
0x186e73c: mov rcx, rsi
0x186e73f: call 0x141364780
0x186e744: lea r9, [rbp + 0x1e0]
0x186e74b: lea r8, [rbp + 0x1f0]
0x186e752: mov edx, eax
0x186e754: lea rcx, [rbx + 0x18]
0x186e758: call 0x140612620
0x186e75d: test rax, rax
0x186e760: je 0x14186e76d
0x186e762: add rax, 0x10
0x186e766: je 0x14186e76d
0x186e768: mov rdi, qword ptr [rax]
0x186e76b: jmp 0x14186e770
0x186e76d: mov rdi, r14
0x186e770: mov qword ptr [rbp + 0x1f0], rdi
0x186e777: cmp dword ptr [rdi + 0x6b8], 0
0x186e77e: jne 0x14186e7a4
0x186e780: mov eax, dword ptr [rip + 0x548951a]
0x186e786: mov dword ptr [r13], eax
0x186e78a: mov rcx, qword ptr [rbp + 0x168]
0x186e791: test rcx, rcx
0x186e794: je 0x14186efb7
0x186e79a: mov esi, 0x1fd
0x186e79f: jmp 0x14186ef31
0x186e7a4: mov qword ptr [rsp + 0x70], r14
0x186e7a9: mov qword ptr [rsp + 0x78], 0
0x186e7b2: mov rbx, qword ptr [rdi + 0x6b0]
0x186e7b9: mov eax, dword ptr [rdi + 0x6b8]
0x186e7bf: lea rax, [rbx + rax*8]
0x186e7c3: mov qword ptr [rbp - 0x50], rax
0x186e7c7: mov esi, 0x1fd
0x186e7cc: lea r8, [rip + 0x51f716d]
0x186e7d3: mov r15d, 1
0x186e7d9: cmp rbx, rax
0x186e7dc: je 0x14186ea16
0x186e7e2: nop dword ptr [rax]
0x186e7e6: nop word ptr [rax + rax]
0x186e7f0: vpxor xmm0, xmm0, xmm0
0x186e7f4: xor eax, eax
0x186e7f6: vmovups ymmword ptr [rbp - 0x48], ymm0
0x186e7fb: mov qword ptr [rbp - 0x28], rax
0x186e7ff: mov qword ptr [rbp - 0x48], r14
0x186e803: mov qword ptr [rbp - 0x48], r8
0x186e807: mov qword ptr [rbp - 0x40], r14
0x186e80b: mov qword ptr [rbp - 0x40], r8
0x186e80f: mov qword ptr [rbp - 0x38], r14
0x186e813: mov qword ptr [rbp - 0x30], rax
0x186e817: mov byte ptr [rbp - 0x28], 0xff
0x186e81b: mov ecx, dword ptr [rsp + 0x7c]
0x186e81f: mov eax, dword ptr [rsp + 0x78]
0x186e823: cmp ecx, eax
0x186e825: ja 0x14186e856
0x186e827: lea edx, [rcx*2 + 1]
0x186e82e: add edx, ecx
0x186e830: shr edx, 1
0x186e832: cmp edx, 1
0x186e835: cmovb edx, r15d
0x186e839: cmp eax, edx
0x186e83b: cmova edx, eax
0x186e83e: lea rcx, [rsp + 0x70]
0x186e843: vzeroupper 
0x186e846: call 0x141874090
0x186e84b: mov eax, dword ptr [rsp + 0x78]
0x186e84f: lea r8, [rip + 0x51f70ea]
0x186e856: lea rcx, [rax + rax*4]
0x186e85a: mov rax, qword ptr [rsp + 0x70]
0x186e85f: lea rdx, [rax + rcx*8]
0x186e863: mov qword ptr [rbp - 0x58], rdx
0x186e867: mov qword ptr [rdx], r8
0x186e86a: mov qword ptr [rbp - 0x48], r8
0x186e86e: mov qword ptr [rdx + 8], r8
0x186e872: mov qword ptr [rbp - 0x40], r8
0x186e876: mov qword ptr [rdx + 0x10], r14
0x186e87a: mov qword ptr [rbp - 0x38], r14
0x186e87e: mov qword ptr [rdx + 0x18], 0
0x186e886: mov qword ptr [rbp - 0x30], 0
0x186e88e: mov byte ptr [rdx + 0x20], 0xff
0x186e892: mov byte ptr [rbp - 0x28], 0xff
0x186e896: inc dword ptr [rsp + 0x78]
0x186e89a: lea rcx, [rbp - 0x38]
0x186e89e: vzeroupper 
0x186e8a1: call 0x1413739b0
0x186e8a6: nop 
0x186e8a7: lea rcx, [rbp - 0x40]
0x186e8ab: call 0x140394db0
0x186e8b0: nop 
0x186e8b1: lea rcx, [rbp - 0x48]
0x186e8b5: call 0x140394db0
0x186e8ba: mov eax, dword ptr [rsp + 0x78]
0x186e8be: dec eax
0x186e8c0: lea rdx, [rax + rax*4]
0x186e8c4: mov rax, qword ptr [rsp + 0x70]
0x186e8c9: lea r13, [rax + rdx*8]
0x186e8cd: mov qword ptr [rbp - 0x78], r14
0x186e8d1: mov qword ptr [rbp - 0x70], 0
0x186e8d9: mov byte ptr [rbp - 0x68], 0xff
0x186e8dd: lea rdx, [rbp - 0x78]
0x186e8e1: mov rcx, qword ptr [rbx]
0x186e8e4: call 0x14235bf10
0x186e8e9: test al, al
0x186e8eb: je 0x14186eba3
0x186e8f1: mov rdx, qword ptr [r12 + 0x50]
0x186e8f6: add rdx, 0x78
0x186e8fa: mov rax, qword ptr [rdx + 0x108]
0x186e901: test rax, rax
0x186e904: cmovne rdx, rax
0x186e908: lea r8, [r13 + 0x10]
0x186e90c: mov rcx, qword ptr [rbx]
0x186e90f: call 0x14235c7a0
0x186e914: test al, al
0x186e916: je 0x14186ea79
0x186e91c: mov rdx, qword ptr [rbx]
0x186e91f: mov rdi, qword ptr [rdx + 0x120]
0x186e926: mov rax, qword ptr [rbp - 0x78]
0x186e92a: mov qword ptr [rdx + 0x120], rax
0x186e931: mov qword ptr [rbp - 0x78], rdi
0x186e935: mov r14d, dword ptr [rdx + 0x128]
0x186e93c: mov eax, dword ptr [rbp - 0x70]
0x186e93f: mov dword ptr [rdx + 0x128], eax
0x186e945: mov dword ptr [rbp - 0x70], r14d
0x186e949: mov ecx, dword ptr [rdx + 0x12c]
0x186e94f: mov eax, dword ptr [rbp - 0x6c]
0x186e952: mov dword ptr [rdx + 0x12c], eax
0x186e958: mov dword ptr [rbp - 0x6c], ecx
0x186e95b: movsx r12d, byte ptr [rdx + 0x130]
0x186e963: movzx eax, byte ptr [rbp - 0x68]
0x186e967: mov byte ptr [rdx + 0x130], al
0x186e96d: mov byte ptr [rbp - 0x68], r12b
0x186e971: mov rdx, qword ptr [rbx]
0x186e974: mov rax, qword ptr [rdx + 0x88]
0x186e97b: test rax, rax
0x186e97e: cmovne rdx, rax
0x186e982: mov rcx, r13
0x186e985: call 0x1403d5f80
0x186e98a: nop 
0x186e98b: cmp r12b, 0xff
0x186e98f: je 0x14186e9a4
0x186e991: neg r14d
0x186e994: mov eax, r12d
0x186e997: lea r13, [rip + 0x546a882]
0x186e99e: lock add dword ptr [r13 + rax*4], r14d
0x186e9a4: test rdi, rdi
0x186e9a7: je 0x14186e9da
0x186e9a9: mov rax, qword ptr gs:[0x58]
0x186e9b2: mov rdx, qword ptr [rax]
0x186e9b5: mov rcx, rdi
0x186e9b8: cmp byte ptr [rsi + rdx], 0
0x186e9bc: je 0x14186e9cc
0x186e9be: call 0x1447f03bc
0x186e9c3: xor r14d, r14d
0x186e9c6: mov qword ptr [rbp - 0x78], r14
0x186e9ca: jmp 0x14186e9dd
0x186e9cc: call 0x1447f02bc
0x186e9d1: xor r14d, r14d
0x186e9d4: mov qword ptr [rbp - 0x78], r14
0x186e9d8: jmp 0x14186e9dd
0x186e9da: xor r14d, r14d
0x186e9dd: mov qword ptr [rbp - 0x70], 0
0x186e9e5: add rbx, 8
0x186e9e9: cmp rbx, qword ptr [rbp - 0x50]
0x186e9ed: mov r12, qword ptr [rbp + 0x1d0]
0x186e9f4: lea r8, [rip + 0x51f6f45]
0x186e9fb: jne 0x14186e7f0
0x186ea01: mov rdi, qword ptr [rbp + 0x1f0]
0x186ea08: mov r13, qword ptr [rbp + 0x1d8]
0x186ea0f: lea r8, [rip + 0x51f6f2a]
0x186ea16: mov dword ptr [rbp], 0xffffffff
0x186ea1d: mov qword ptr [rbp + 8], r14
0x186ea21: mov qword ptr [rbp + 8], r8
0x186ea25: mov qword ptr [rbp + 0x20], r14
0x186ea29: mov qword ptr [rbp + 0x20], r8
0x186ea2d: mov qword ptr [rbp + 0x28], r14
0x186ea31: mov qword ptr [rbp + 0x28], r8
0x186ea35: mov qword ptr [rbp + 0x30], r14
0x186ea39: mov qword ptr [rbp + 0x30], r8
0x186ea3d: mov qword ptr [rbp + 0x38], r14
0x186ea41: mov qword ptr [rbp + 0x38], r8
0x186ea45: mov qword ptr [rbp + 0x40], r14
0x186ea49: mov qword ptr [rbp + 0x40], r8
0x186ea4d: mov qword ptr [rbp + 0x48], r14
0x186ea51: mov qword ptr [rbp + 0x48], r8
0x186ea55: mov rax, qword ptr [rbp + 0x1e8]
0x186ea5c: mov rax, qword ptr [rax + 0x68]
0x186ea60: mov rdx, qword ptr [rax + 0x20]
0x186ea64: test rdx, rdx
0x186ea67: jne 0x14186ed07
0x186ea6d: lea rdx, [rip + 0x51f714c]
0x186ea74: jmp 0x14186ed0b
0x186ea79: lea rax, [rip + 0x3f6ccd8]
0x186ea80: mov qword ptr [rsp + 0x58], rax
0x186ea85: mov dword ptr [rsp + 0x50], 6
0x186ea8d: mov dword ptr [rsp + 0x48], r14d
0x186ea92: lea r9, [rip + 0x3d04a13]
0x186ea99: mov qword ptr [rsp + 0x40], r9
0x186ea9e: mov dword ptr [rsp + 0x38], r14d
0x186eaa3: mov qword ptr [rsp + 0x30], r9
0x186eaa8: mov qword ptr [rsp + 0x28], r9
0x186eaad: mov qword ptr [rsp + 0x20], r9
0x186eab2: mov cl, 1
0x186eab4: call 0x14035d8d0
0x186eab9: mov eax, dword ptr [rip + 0x54891e1]
0x186eabf: mov r13, qword ptr [rbp + 0x1d8]
0x186eac6: mov dword ptr [r13], eax
0x186eaca: movsx eax, byte ptr [rbp - 0x68]
0x186eace: cmp al, 0xff
0x186ead0: je 0x14186eae2
0x186ead2: mov edx, dword ptr [rbp - 0x70]
0x186ead5: neg edx
0x186ead7: lea rdi, [rip + 0x546a742]
0x186eade: lock add dword ptr [rdi + rax*4], edx
0x186eae2: mov rcx, qword ptr [rbp - 0x78]
0x186eae6: test rcx, rcx
0x186eae9: je 0x14186eb0d
0x186eaeb: mov rax, qword ptr gs:[0x58]
0x186eaf4: mov rdx, qword ptr [rax]
0x186eaf7: cmp byte ptr [rsi + rdx], 0
0x186eafb: je 0x14186eb04
0x186eafd: call 0x1447f03bc
0x186eb02: jmp 0x14186eb09
0x186eb04: call 0x1447f02bc
0x186eb09: mov qword ptr [rbp - 0x78], r14
0x186eb0d: mov qword ptr [rbp - 0x70], 0
0x186eb15: mov r8, qword ptr [rsp + 0x70]
0x186eb1a: test r8, r8
0x186eb1d: je 0x14186eb90
0x186eb1f: mov edi, r14d
0x186eb22: cmp dword ptr [rsp + 0x78], 0
0x186eb27: jbe 0x14186eb6a
0x186eb29: nop dword ptr [rax]
0x186eb30: mov eax, edi
0x186eb32: lea rcx, [rax + rax*4]
0x186eb36: lea rbx, [r8 + rcx*8]
0x186eb3a: mov qword ptr [rbp + 0x1d0], rbx
0x186eb41: lea rcx, [rbx + 0x10]
0x186eb45: call 0x1413739b0
0x186eb4a: nop 
0x186eb4b: lea rcx, [rbx + 8]
0x186eb4f: call 0x140394db0
0x186eb54: nop 
0x186eb55: mov rcx, rbx
0x186eb58: call 0x140394db0
0x186eb5d: inc edi
0x186eb5f: mov r8, qword ptr [rsp + 0x70]
0x186eb64: cmp edi, dword ptr [rsp + 0x78]
0x186eb68: jb 0x14186eb30
0x186eb6a: test r8, r8
0x186eb6d: je 0x14186eb90
0x186eb6f: mov rax, qword ptr gs:[0x58]
0x186eb78: mov rdx, qword ptr [rax]
0x186eb7b: mov rcx, r8
0x186eb7e: cmp byte ptr [rsi + rdx], 0
0x186eb82: je 0x14186eb8b
0x186eb84: call 0x1447f03bc
0x186eb89: jmp 0x14186eb90
0x186eb8b: call 0x1447f02bc
0x186eb90: mov qword ptr [rsp + 0x70], r14
0x186eb95: mov qword ptr [rsp + 0x78], 0
0x186eb9e: jmp 0x14186ef21
0x186eba3: lea rax, [rip + 0x3f6cc3e]
0x186ebaa: mov qword ptr [rsp + 0x58], rax
0x186ebaf: mov dword ptr [rsp + 0x50], 6
0x186ebb7: mov dword ptr [rsp + 0x48], r14d
0x186ebbc: lea r9, [rip + 0x3d048e9]
0x186ebc3: mov qword ptr [rsp + 0x40], r9
0x186ebc8: mov dword ptr [rsp + 0x38], r14d
0x186ebcd: mov qword ptr [rsp + 0x30], r9
0x186ebd2: mov qword ptr [rsp + 0x28], r9
0x186ebd7: mov qword ptr [rsp + 0x20], r9
0x186ebdc: mov cl, 1
0x186ebde: call 0x14035d8d0
0x186ebe3: mov eax, dword ptr [rip + 0x54890b7]
0x186ebe9: mov r13, qword ptr [rbp + 0x1d8]
0x186ebf0: mov dword ptr [r13], eax
0x186ebf4: movsx eax, byte ptr [rbp - 0x68]
0x186ebf8: cmp al, 0xff
0x186ebfa: je 0x14186ec0e
0x186ebfc: mov edx, dword ptr [rbp - 0x70]
0x186ebff: neg edx
0x186ec01: mov ecx, eax
0x186ec03: lea rax, [rip + 0x546a616]
0x186ec0a: lock add dword ptr [rax + rcx*4], edx
0x186ec0e: mov ebx, esi
0x186ec10: mov rcx, qword ptr [rbp - 0x78]
0x186ec14: test rcx, rcx
0x186ec17: je 0x14186ec3b
0x186ec19: mov rax, qword ptr gs:[0x58]
0x186ec22: mov rdx, qword ptr [rax]
0x186ec25: cmp byte ptr [rsi + rdx], 0
0x186ec29: je 0x14186ec32
0x186ec2b: call 0x1447f03bc
0x186ec30: jmp 0x14186ec37
0x186ec32: call 0x1447f02bc
0x186ec37: mov qword ptr [rbp - 0x78], r14
0x186ec3b: mov qword ptr [rbp - 0x70], 0
0x186ec43: mov r8, qword ptr [rsp + 0x70]
0x186ec48: test r8, r8
0x186ec4b: je 0x14186ecc2
0x186ec4d: mov edi, r14d
0x186ec50: cmp dword ptr [rsp + 0x78], 0
0x186ec55: jbe 0x14186ec9c
0x186ec57: nop word ptr [rax + rax]
0x186ec60: mov eax, edi
0x186ec62: lea rcx, [rax + rax*4]
0x186ec66: lea rbx, [r8 + rcx*8]
0x186ec6a: mov qword ptr [rbp + 0x1d0], rbx
0x186ec71: lea rcx, [rbx + 0x10]
0x186ec75: call 0x1413739b0
0x186ec7a: nop 
0x186ec7b: lea rcx, [rbx + 8]
0x186ec7f: call 0x140394db0
0x186ec84: nop 
0x186ec85: mov rcx, rbx
0x186ec88: call 0x140394db0
0x186ec8d: inc edi
0x186ec8f: mov r8, qword ptr [rsp + 0x70]
0x186ec94: cmp edi, dword ptr [rsp + 0x78]
0x186ec98: jb 0x14186ec60
0x186ec9a: mov ebx, esi
0x186ec9c: test r8, r8
0x186ec9f: je 0x14186ecc2
0x186eca1: mov rax, qword ptr gs:[0x58]
0x186ecaa: mov rdx, qword ptr [rax]
0x186ecad: mov rcx, r8
0x186ecb0: cmp byte ptr [rbx + rdx], 0
0x186ecb4: je 0x14186ecbd
0x186ecb6: call 0x1447f03bc
0x186ecbb: jmp 0x14186ecc2
0x186ecbd: call 0x1447f02bc
0x186ecc2: mov qword ptr [rsp + 0x70], r14
0x186ecc7: mov qword ptr [rsp + 0x78], 0
0x186ecd0: mov rcx, qword ptr [rbp + 0x168]
0x186ecd7: test rcx, rcx
0x186ecda: je 0x14186efb7
0x186ece0: mov rax, qword ptr gs:[0x58]
0x186ece9: mov rdx, qword ptr [rax]
0x186ecec: cmp byte ptr [rbx + rdx], 0
0x186ecf0: je 0x14186ef51
0x186ecf6: call 0x1447f03bc
0x186ecfb: mov qword ptr [rbp + 0x168], r14
0x186ed02: jmp 0x14186efb7
0x186ed07: mov rdx, qword ptr [rdx + 0x70]
0x186ed0b: mov rax, qword ptr [rip + 0x51f6eae]
0x186ed12: cmp qword ptr [rdx], rax
0x186ed15: je 0x14186ee22
0x186ed1b: mov rcx, qword ptr [rbp + 0x50]
0x186ed1f: mov rcx, qword ptr [rcx + 0x68]
0x186ed23: mov rcx, qword ptr [rcx + 0x10]
0x186ed27: call 0x142144690
0x186ed2c: mov rbx, rax
0x186ed2f: test rax, rax
0x186ed32: je 0x14186ee22
0x186ed38: mov r8, qword ptr [rax + 0x78]
0x186ed3c: mov qword ptr [rbp - 0x78], r8
0x186ed40: mov rcx, qword ptr [rax + 0x80]
0x186ed47: mov qword ptr [rbp - 0x70], rcx
0x186ed4b: movzx ecx, byte ptr [rax + 0x88]
0x186ed52: mov byte ptr [rbp - 0x68], cl
0x186ed55: mov qword ptr [rbp - 0x60], r14
0x186ed59: mov rdx, qword ptr [rax + 0x90]
0x186ed60: mov qword ptr [rbp - 0x60], rdx
0x186ed64: lea rax, [rip + 0x51f6bd5]
0x186ed6b: cmp rdx, rax
0x186ed6e: je 0x14186ed7b
0x186ed70: mov eax, dword ptr [rdx + 0x10]
0x186ed73: test eax, eax
0x186ed75: js 0x14186ed7b
0x186ed77: lock inc dword ptr [rdx + 0x10]
0x186ed7b: mov dword ptr [rbp - 0x80], r15d
0x186ed7f: mov rax, qword ptr [r8]
0x186ed82: xor edx, edx
0x186ed84: mov rcx, r8
0x186ed87: call qword ptr [rax + 8]
0x186ed8a: mov rdx, rax
0x186ed8d: lea rcx, [rbp + 0x38]
0x186ed91: call 0x1403d5f80
0x186ed96: and r15d, 0xfffffffe
0x186ed9a: mov dword ptr [rbp - 0x80], r15d
0x186ed9e: lea rcx, [rbp - 0x60]
0x186eda2: call 0x140394db0
0x186eda7: nop 
0x186eda8: mov rcx, qword ptr [rbx + 0x58]
0x186edac: mov qword ptr [rbp - 0x20], rcx
0x186edb0: mov rax, qword ptr [rbx + 0x60]
0x186edb4: mov qword ptr [rbp - 0x18], rax
0x186edb8: movzx eax, byte ptr [rbx + 0x68]
0x186edbc: mov byte ptr [rbp - 0x10], al
0x186edbf: mov qword ptr [rbp - 8], r14
0x186edc3: mov rdx, qword ptr [rbx + 0x70]
0x186edc7: mov qword ptr [rbp - 8], rdx
0x186edcb: lea rax, [rip + 0x51f6b6e]
0x186edd2: cmp rdx, rax
0x186edd5: je 0x14186ede2
0x186edd7: mov eax, dword ptr [rdx + 0x10]
0x186edda: test eax, eax
0x186eddc: js 0x14186ede2
0x186edde: lock inc dword ptr [rdx + 0x10]
0x186ede2: or r15d, 2
0x186ede6: mov dword ptr [rbp - 0x80], r15d
0x186edea: mov rax, qword ptr [rcx]
0x186eded: xor edx, edx
0x186edef: call qword ptr [rax + 8]
0x186edf2: mov rdx, rax
0x186edf5: lea rcx, [rbp + 0x40]
0x186edf9: call 0x1403d5f80
0x186edfe: and r15d, 0xfffffffd
0x186ee02: mov dword ptr [rbp - 0x80], r15d
0x186ee06: lea rcx, [rbp - 8]
0x186ee0a: call 0x140394db0
0x186ee0f: mov rdx, qword ptr [rbx + 0x98]
0x186ee16: mov rdx, qword ptr [rdx]
0x186ee19: lea rcx, [rbp + 0x48]
0x186ee1d: call 0x1403d5f80
0x186ee22: mov rax, qword ptr [r12 + 0x50]
0x186ee27: mov rcx, qword ptr [rax + 0x190]
0x186ee2e: lea rdx, [rbp + 0x60]
0x186ee32: mov rax, qword ptr [rbp + 0x168]
0x186ee39: test rax, rax
0x186ee3c: cmovne rdx, rax
0x186ee40: lea r9, [rsp + 0x70]
0x186ee45: lea r8, [rbp]
0x186ee49: call 0x1415ac100
0x186ee4e: mov dword ptr [rdi + 0x6b8], r14d
0x186ee55: mov dword ptr [r13], r14d
0x186ee59: lea rcx, [rbp + 0x48]
0x186ee5d: call 0x140394db0
0x186ee62: nop 
0x186ee63: lea rcx, [rbp + 0x40]
0x186ee67: call 0x140394db0
0x186ee6c: nop 
0x186ee6d: lea rcx, [rbp + 0x38]
0x186ee71: call 0x140394db0
0x186ee76: nop 
0x186ee77: lea rcx, [rbp + 0x30]
0x186ee7b: call 0x140394db0
0x186ee80: nop 
0x186ee81: lea rcx, [rbp + 0x28]
0x186ee85: call 0x140394db0
0x186ee8a: nop 
0x186ee8b: lea rcx, [rbp + 0x20]
0x186ee8f: call 0x140394db0
0x186ee94: nop 
0x186ee95: lea rcx, [rbp + 8]
0x186ee99: call 0x140394db0
0x186ee9e: nop 
0x186ee9f: mov r9, qword ptr [rsp + 0x70]
0x186eea4: test r9, r9
0x186eea7: je 0x14186ef13
0x186eea9: mov edi, r14d
0x186eeac: cmp dword ptr [rsp + 0x78], 0
0x186eeb1: jbe 0x14186eeed
0x186eeb3: mov eax, edi
0x186eeb5: lea rcx, [rax + rax*4]
0x186eeb9: lea rbx, [r9 + rcx*8]
0x186eebd: mov qword ptr [rbp + 0x1d0], rbx
0x186eec4: lea rcx, [rbx + 0x10]
0x186eec8: call 0x1413739b0
0x186eecd: nop 
0x186eece: lea rcx, [rbx + 8]
0x186eed2: call 0x140394db0
0x186eed7: nop 
0x186eed8: mov rcx, rbx
0x186eedb: call 0x140394db0
0x186eee0: inc edi
0x186eee2: mov r9, qword ptr [rsp + 0x70]
0x186eee7: cmp edi, dword ptr [rsp + 0x78]
0x186eeeb: jb 0x14186eeb3
0x186eeed: test r9, r9
0x186eef0: je 0x14186ef13
0x186eef2: mov rax, qword ptr gs:[0x58]
0x186eefb: mov rdx, qword ptr [rax]
0x186eefe: mov rcx, r9
0x186ef01: cmp byte ptr [rsi + rdx], 0
0x186ef05: je 0x14186ef0e
0x186ef07: call 0x1447f03bc
0x186ef0c: jmp 0x14186ef13
0x186ef0e: call 0x1447f02bc
0x186ef13: mov qword ptr [rsp + 0x70], r14
0x186ef18: mov qword ptr [rsp + 0x78], 0
0x186ef21: mov rcx, qword ptr [rbp + 0x168]
0x186ef28: test rcx, rcx
0x186ef2b: je 0x14186efb7
0x186ef31: mov rax, qword ptr gs:[0x58]
0x186ef3a: mov rdx, qword ptr [rax]
0x186ef3d: cmp byte ptr [rsi + rdx], 0
0x186ef41: je 0x14186ef51
0x186ef43: call 0x1447f03bc
0x186ef48: mov qword ptr [rbp + 0x168], r14
0x186ef4f: jmp 0x14186efb7
0x186ef51: call 0x1447f02bc
0x186ef56: mov qword ptr [rbp + 0x168], r14
0x186ef5d: jmp 0x14186efb7
0x186ef5f: mov rax, qword ptr [rbp + 0x1f0]
0x186ef66: test byte ptr [rax], 4
0x186ef69: jne 0x14186ef79
0x186ef6b: mov r8d, r14d
0x186ef6e: mov rdx, rsi
0x186ef71: mov rcx, r12
0x186ef74: call 0x141870df0
0x186ef79: mov dword ptr [r13], ebx
0x186ef7d: mov rcx, qword ptr [rbp + 0x168]
0x186ef84: test rcx, rcx
0x186ef87: je 0x14186efb7
0x186ef89: mov esi, 0x1fd
0x186ef8e: mov rax, qword ptr gs:[0x58]
0x186ef97: mov rdx, qword ptr [rax]
0x186ef9a: cmp byte ptr [rsi + rdx], 0
0x186ef9e: je 0x14186efa7
0x186efa0: call 0x1447f03bc
0x186efa5: jmp 0x14186efac
0x186efa7: call 0x1447f02bc
0x186efac: mov qword ptr [rbp + 0x168], 0
0x186efb7: mov rax, r13
0x186efba: add rsp, 0x288
0x186efc1: pop r15
0x186efc3: pop r14
0x186efc5: pop r13
0x186efc7: pop r12
0x186efc9: pop rdi
0x186efca: pop rsi
0x186efcb: pop rbx
0x186efcc: pop rbp
0x186efcd: ret 