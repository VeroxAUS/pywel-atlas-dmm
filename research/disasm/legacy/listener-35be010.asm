0x35be010: mov qword ptr [rsp + 8], rbx
0x35be015: push rbp
0x35be016: push rsi
0x35be017: push rdi
0x35be018: push r12
0x35be01a: push r13
0x35be01c: push r14
0x35be01e: push r15
0x35be020: lea rbp, [rsp - 0x27]
0x35be025: sub rsp, 0xb0
0x35be02c: mov rdi, rdx
0x35be02f: mov r13, rcx
0x35be032: test rdx, rdx
0x35be035: je 0x1435be042
0x35be037: cmp qword ptr [rdx + 0x10], 0
0x35be03c: lea r14, [rdx + 0x28]
0x35be040: jne 0x1435be046
0x35be042: lea r14, [rcx + 0x18]
0x35be046: mov rax, qword ptr [r14]
0x35be049: xor r12d, r12d
0x35be04c: test rax, rax
0x35be04f: je 0x1435be2d8
0x35be055: mov rcx, qword ptr [rax]
0x35be058: test rcx, rcx
0x35be05b: je 0x1435be2d8
0x35be061: cmp dword ptr [rcx], r12d
0x35be064: je 0x1435be2d8
0x35be06a: cmp dword ptr [rcx + 4], -1
0x35be06e: je 0x1435be2d8
0x35be074: cmp qword ptr [rax + 8], r12
0x35be078: je 0x1435be2d8
0x35be07e: mov rcx, qword ptr [rax + 0x10]
0x35be082: test rcx, rcx
0x35be085: je 0x1435be2d8
0x35be08b: cmp byte ptr [rcx + 0xc0], r12b
0x35be092: jne 0x1435be2d8
0x35be098: mov qword ptr [rbp + 0x6f], r12
0x35be09c: lea rax, [rbp - 0x69]
0x35be0a0: mov qword ptr [rbp + 0x7f], rax
0x35be0a4: mov qword ptr [rbp - 0x69], r12
0x35be0a8: mov qword ptr [rbp - 0x61], r12
0x35be0ac: mov qword ptr [rbp - 0x59], r12
0x35be0b0: mov qword ptr [rbp - 0x51], r12
0x35be0b4: vpxor xmm0, xmm0, xmm0
0x35be0b8: vmovdqu xmmword ptr [rbp - 0x49], xmm0
0x35be0bd: mov qword ptr [rbp - 0x39], r12
0x35be0c1: mov byte ptr [rbp - 0x31], r12b
0x35be0c5: mov eax, dword ptr [rip + 0x37912f9]
0x35be0cb: mov dword ptr [rbp - 0x2d], eax
0x35be0ce: vmovdqu xmmword ptr [rbp - 0x29], xmm0
0x35be0d3: mov qword ptr [rbp - 0x19], r12
0x35be0d7: mov word ptr [rbp - 0x11], 0x11
0x35be0dd: mov eax, dword ptr [rip + 0x1f87b89]
0x35be0e3: mov dword ptr [rbp - 0xd], eax
0x35be0e6: mov byte ptr [rbp - 9], r12b
0x35be0ea: vmovdqu xmmword ptr [rbp - 1], xmm0
0x35be0ef: mov qword ptr [rbp + 0xf], r12
0x35be0f3: mov qword ptr [rbp + 0x17], r12
0x35be0f7: mov qword ptr [rbp + 0x1f], r12
0x35be0fb: mov qword ptr [rbp + 0x1f], r12
0x35be0ff: mov qword ptr [rbp + 0x6f], r12
0x35be103: mov rax, qword ptr [r14]
0x35be106: mov rcx, qword ptr [rax + 0x10]
0x35be10a: lea rbx, [rcx - 0x28]
0x35be10e: test rcx, rcx
0x35be111: cmove rbx, r12
0x35be115: mov dl, 8
0x35be117: lea rcx, [rbp - 0x69]
0x35be11b: call 0x14313b9d0
0x35be120: mov esi, 0xffffffff
0x35be125: mov edx, 0x1fd
0x35be12a: mov rcx, qword ptr [rbp - 0x21]
0x35be12e: test rcx, rcx
0x35be131: je 0x1435be187
0x35be133: lea rax, [rbx + 0x28]
0x35be137: test rbx, rbx
0x35be13a: cmove rax, r12
0x35be13e: cmp rax, qword ptr [rcx + 8]
0x35be142: je 0x1435be1b1
0x35be144: test rcx, rcx
0x35be147: je 0x1435be187
0x35be149: mov qword ptr [rbp - 0x21], r12
0x35be14d: cmp byte ptr [rcx + 4], r12b
0x35be151: je 0x1435be15d
0x35be153: mov eax, esi
0x35be155: lock xadd dword ptr [rcx], eax
0x35be159: dec eax
0x35be15b: jmp 0x1435be161
0x35be15d: dec dword ptr [rcx]
0x35be15f: mov eax, dword ptr [rcx]
0x35be161: test eax, eax
0x35be163: jne 0x1435be187
0x35be165: mov r8d, edx
0x35be168: mov rax, qword ptr gs:[0x58]
0x35be171: mov rdx, qword ptr [rax]
0x35be174: cmp byte ptr [r8 + rdx], 0
0x35be179: je 0x1435be182
0x35be17b: call 0x1447f03bc
0x35be180: jmp 0x1435be187
0x35be182: call 0x1447f02bc
0x35be187: test rbx, rbx
0x35be18a: je 0x1435be1b1
0x35be18c: cmp byte ptr [rbx + 0x3d], 0
0x35be190: jne 0x1435be1b1
0x35be192: lea rcx, [rbx + 0x28]
0x35be196: call 0x1403d5170
0x35be19b: mov qword ptr [rbp - 0x21], rax
0x35be19f: test rax, rax
0x35be1a2: je 0x1435be1b1
0x35be1a4: cmp byte ptr [rax + 4], 0
0x35be1a8: je 0x1435be1af
0x35be1aa: lock inc dword ptr [rax]
0x35be1ad: jmp 0x1435be1b1
0x35be1af: inc dword ptr [rax]
0x35be1b1: mov rax, qword ptr [r14]
0x35be1b4: mov rbx, qword ptr [rax + 0x10]
0x35be1b8: mov dl, 2
0x35be1ba: lea rcx, [rbp - 0x69]
0x35be1be: call 0x14313b9d0
0x35be1c3: lea rax, [rbx - 0x28]
0x35be1c7: test rbx, rbx
0x35be1ca: cmove rax, r12
0x35be1ce: mov qword ptr [rbp - 0x49], rax
0x35be1d2: mov dl, 0xd
0x35be1d4: lea rcx, [rbp - 0x69]
0x35be1d8: call 0x14313b9d0
0x35be1dd: mov qword ptr [rbp + 7], r12
0x35be1e1: mov dl, 0xe
0x35be1e3: lea rcx, [rbp - 0x69]
0x35be1e7: call 0x14313b9d0
0x35be1ec: mov byte ptr [rbp - 9], 0
0x35be1f0: mov qword ptr [rbp - 1], r12
0x35be1f4: mov r8b, 1
0x35be1f7: lea rdx, [rbp + 0x77]
0x35be1fb: lea rcx, [rbp - 0x69]
0x35be1ff: call 0x14313b0b0
0x35be204: mov r15, rax
0x35be207: mov rbx, qword ptr [r14]
0x35be20a: add rbx, 0x10
0x35be20e: cmp rax, rbx
0x35be211: je 0x1435be230
0x35be213: mov rcx, rbx
0x35be216: call 0x14038ad90
0x35be21b: mov rcx, qword ptr [r15]
0x35be21e: mov qword ptr [rbx], rcx
0x35be221: mov qword ptr [r15], r12
0x35be224: mov rax, qword ptr [rbx]
0x35be227: test rax, rax
0x35be22a: je 0x1435be230
0x35be22c: mov byte ptr [rax + 0x16], 1
0x35be230: lea rcx, [rbp + 0x77]
0x35be234: call 0x14038ad90
0x35be239: nop 
0x35be23a: lea rcx, [rbp + 0x1f]
0x35be23e: call 0x14038ad90
0x35be243: nop 
0x35be244: mov rcx, qword ptr [rbp + 0xf]
0x35be248: mov ebx, 0x1fd
0x35be24d: test rcx, rcx
0x35be250: je 0x1435be270
0x35be252: mov rax, qword ptr gs:[0x58]
0x35be25b: mov rdx, qword ptr [rax]
0x35be25e: cmp byte ptr [rbx + rdx], 0
0x35be262: je 0x1435be26b
0x35be264: call 0x1447f03bc
0x35be269: jmp 0x1435be270
0x35be26b: call 0x1447f02bc
0x35be270: mov qword ptr [rbp + 0xf], r12
0x35be274: mov qword ptr [rbp + 0x17], r12
0x35be278: lea rax, [rbp - 0x69]
0x35be27c: mov qword ptr [rbp + 0x6f], rax
0x35be280: mov rcx, qword ptr [rbp - 0x21]
0x35be284: test rcx, rcx
0x35be287: je 0x1435be2c5
0x35be289: mov qword ptr [rbp - 0x21], r12
0x35be28d: cmp byte ptr [rcx + 4], 0
0x35be291: je 0x1435be29b
0x35be293: lock xadd dword ptr [rcx], esi
0x35be297: dec esi
0x35be299: jmp 0x1435be29f
0x35be29b: dec dword ptr [rcx]
0x35be29d: mov esi, dword ptr [rcx]
0x35be29f: test esi, esi
0x35be2a1: jne 0x1435be2c5
0x35be2a3: mov r8d, ebx
0x35be2a6: mov rax, qword ptr gs:[0x58]
0x35be2af: mov rdx, qword ptr [rax]
0x35be2b2: cmp byte ptr [r8 + rdx], sil
0x35be2b6: je 0x1435be2bf
0x35be2b8: call 0x1447f03bc
0x35be2bd: jmp 0x1435be2c5
0x35be2bf: call 0x1447f02bc
0x35be2c4: nop 
0x35be2c5: lea rcx, [rbp - 0x59]
0x35be2c9: call 0x14044fa40
0x35be2ce: nop 
0x35be2cf: lea rcx, [rbp - 0x69]
0x35be2d3: call 0x14044fa40
0x35be2d8: test rdi, rdi
0x35be2db: je 0x1435be2ea
0x35be2dd: cmp qword ptr [rdi + 0x10], 0
0x35be2e2: je 0x1435be2ea
0x35be2e4: mov rcx, qword ptr [rdi + 0x28]
0x35be2e8: jmp 0x1435be2ee
0x35be2ea: mov rcx, qword ptr [r13 + 0x18]
0x35be2ee: test rcx, rcx
0x35be2f1: je 0x1435be304
0x35be2f3: mov rcx, qword ptr [rcx + 0x10]
0x35be2f7: lea rax, [rcx - 0x28]
0x35be2fb: test rcx, rcx
0x35be2fe: cmove rax, r12
0x35be302: jmp 0x1435be307
0x35be304: mov rax, r12
0x35be307: mov rbx, qword ptr [rsp + 0xf0]
0x35be30f: add rsp, 0xb0
0x35be316: pop r15
0x35be318: pop r14
0x35be31a: pop r13
0x35be31c: pop r12
0x35be31e: pop rdi
0x35be31f: pop rsi
0x35be320: pop rbp
0x35be321: ret 