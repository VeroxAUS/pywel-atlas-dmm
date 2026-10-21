0xd8c4c0: mov qword ptr [rsp + 0x10], rbx
0xd8c4c5: mov qword ptr [rsp + 0x18], rsi
0xd8c4ca: push rbp
0xd8c4cb: push rdi
0xd8c4cc: push r14
0xd8c4ce: lea rbp, [rsp - 0x70]
0xd8c4d3: sub rsp, 0x170
0xd8c4da: mov rax, r8
0xd8c4dd: mov rsi, rdx
0xd8c4e0: mov rdi, rcx
0xd8c4e3: lea rbx, [rip + 0x47e6fc2]
0xd8c4ea: mov r8, rbx
0xd8c4ed: mov rdx, rax
0xd8c4f0: mov rcx, qword ptr [rcx + 8]
0xd8c4f4: call 0x143eda3d0
0xd8c4f9: test rax, rax
0xd8c4fc: je 0x140d8c6c9
0xd8c502: cmp byte ptr [rax], 0
0xd8c505: je 0x140d8c6c9
0xd8c50b: mov qword ptr [rsp + 0x20], rax
0xd8c510: mov rcx, 0xffffffffffffffff
0xd8c517: inc rcx
0xd8c51a: cmp byte ptr [rax + rcx], 0
0xd8c51e: jne 0x140d8c517
0xd8c520: mov dword ptr [rsp + 0x28], ecx
0xd8c524: xor r14d, r14d
0xd8c527: mov qword ptr [rsp + 0x30], r14
0xd8c52c: mov qword ptr [rsp + 0x38], r14
0xd8c531: and byte ptr [rsp + 0x40], 0xfe
0xd8c536: lea rax, [rsp + 0x48]
0xd8c53b: mov qword ptr [rbp + 0x90], rax
0xd8c542: mov qword ptr [rbp + 0x50], r14
0xd8c546: mov qword ptr [rbp + 0x58], 0x105
0xd8c54e: mov dword ptr [rbp + 0x5c], r14d
0xd8c552: mov byte ptr [rsp + 0x48], r14b
0xd8c557: mov dword ptr [rbp + 0x5c], r14d
0xd8c55b: mov byte ptr [rsp + 0x48], r14b
0xd8c560: mov rax, qword ptr [rbp + 0x50]
0xd8c564: test rax, rax
0xd8c567: je 0x140d8c56c
0xd8c569: mov byte ptr [rax], r14b
0xd8c56c: mov qword ptr [rbp + 0x60], r14
0xd8c570: mov dword ptr [rbp + 0x68], r14d
0xd8c574: test ecx, ecx
0xd8c576: je 0x140d8c598
0xd8c578: lea rdx, [rsp + 0x20]
0xd8c57d: lea rcx, [rsp + 0x30]
0xd8c582: call 0x1413eeec0
0xd8c587: lea rdx, [rip + 0x47fff26]
0xd8c58e: lea rcx, [rsp + 0x30]
0xd8c593: call 0x1413eede0
0xd8c598: or byte ptr [rsp + 0x40], 1
0xd8c59d: mov byte ptr [rsi + 0x10], 1
0xd8c5a1: mov rcx, qword ptr [rsp + 0x30]
0xd8c5a6: mov rcx, qword ptr [rcx]
0xd8c5a9: call qword ptr [rip + 0x445faf9]
0xd8c5af: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5b3: vmovss dword ptr [rsi], xmm1
0xd8c5b7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5bc: mov rcx, qword ptr [rcx + 8]
0xd8c5c0: call qword ptr [rip + 0x445fae2]
0xd8c5c6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5ca: vmovss dword ptr [rsi + 4], xmm1
0xd8c5cf: mov rcx, qword ptr [rsp + 0x30]
0xd8c5d4: mov rcx, qword ptr [rcx + 0x10]
0xd8c5d8: call qword ptr [rip + 0x445faca]
0xd8c5de: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5e2: vmovss dword ptr [rsi + 8], xmm1
0xd8c5e7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5ec: mov rcx, qword ptr [rcx + 0x18]
0xd8c5f0: call qword ptr [rip + 0x445fab2]
0xd8c5f6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5fa: vmovss dword ptr [rsi + 0xc], xmm1
0xd8c5ff: mov rcx, qword ptr [rdi + 8]
0xd8c603: mov rdi, qword ptr [rcx + 0xa0]
0xd8c60a: test rdi, rdi
0xd8c60d: je 0x140d8c616
0xd8c60f: cmp qword ptr [rdi + 8], 0
0xd8c614: jne 0x140d8c66c
0xd8c616: mov rcx, qword ptr [rcx + 0xe0]
0xd8c61d: test rcx, rcx
0xd8c620: je 0x140d8c63b
0xd8c622: lea rdx, [rip + 0x5f43b37]
0xd8c629: call 0x1404743a0
0xd8c62e: test rax, rax
0xd8c631: je 0x140d8c63b
0xd8c633: mov rax, qword ptr [rax]
0xd8c636: mov rbx, qword ptr [rax]
0xd8c639: jmp 0x140d8c66c
0xd8c63b: test rdi, rdi
0xd8c63e: je 0x140d8c665
0xd8c640: mov rcx, qword ptr [rdi + 0x68]
0xd8c644: test rcx, rcx
0xd8c647: je 0x140d8c665
0xd8c649: lea rdx, [rip + 0x5f43b10]
0xd8c650: call 0x1404743a0
0xd8c655: test rax, rax
0xd8c658: je 0x140d8c665
0xd8c65a: mov rax, qword ptr [rax]
0xd8c65d: mov rbx, qword ptr [rax]
0xd8c660: test rbx, rbx
0xd8c663: jne 0x140d8c66c
0xd8c665: lea rbx, [rip + 0x47faa74]
0xd8c66c: lea rdx, [rsi + 0x11]
0xd8c670: mov rcx, rbx
0xd8c673: call 0x141423cd0
0xd8c678: nop 
0xd8c679: lea rax, [rsp + 0x48]
0xd8c67e: mov qword ptr [rbp + 0x90], rax
0xd8c685: lea rcx, [rsp + 0x48]
0xd8c68a: call 0x140394170
0xd8c68f: nop 
0xd8c690: mov rcx, qword ptr [rsp + 0x30]
0xd8c695: test rcx, rcx
0xd8c698: je 0x140d8c6bf
0xd8c69a: mov r8d, 0x1fd
0xd8c6a0: mov rax, qword ptr gs:[0x58]
0xd8c6a9: mov rdx, qword ptr [rax]
0xd8c6ac: cmp byte ptr [r8 + rdx], 0
0xd8c6b1: je 0x140d8c6ba
0xd8c6b3: call 0x1447f03bc
0xd8c6b8: jmp 0x140d8c6bf
0xd8c6ba: call 0x1447f02bc
0xd8c6bf: mov qword ptr [rsp + 0x30], r14
0xd8c6c4: mov qword ptr [rsp + 0x38], r14
0xd8c6c9: lea r11, [rsp + 0x170]
0xd8c6d1: mov rbx, qword ptr [r11 + 0x28]
0xd8c6d5: mov rsi, qword ptr [r11 + 0x30]
0xd8c6d9: mov rsp, r11
0xd8c6dc: pop r14
0xd8c6de: pop rdi
0xd8c6df: pop rbp
0xd8c6e0: ret 