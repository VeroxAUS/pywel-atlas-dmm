0x206aec0: mov qword ptr [rsp + 0x10], rbx
0x206aec5: mov qword ptr [rsp + 0x18], rsi
0x206aeca: mov qword ptr [rsp + 0x20], rdi
0x206aecf: push rbp
0x206aed0: push r12
0x206aed2: push r13
0x206aed4: push r14
0x206aed6: push r15
0x206aed8: lea rbp, [rsp - 0xc10]
0x206aee0: sub rsp, 0xd10
0x206aee7: mov rsi, rdx
0x206aeea: mov r13, rcx
0x206aeed: xor r14d, r14d
0x206aef0: lea rdx, [rcx + 8]
0x206aef4: test rcx, rcx
0x206aef7: cmove rdx, r14
0x206aefb: mov r8b, 1
0x206aefe: mov rdx, qword ptr [rdx]
0x206af01: lea rcx, [rsp + 0x20]
0x206af06: call 0x140393650
0x206af0b: nop 
0x206af0c: mov rdi, qword ptr [r13 + 0xd8]
0x206af13: mov qword ptr [r13 + 0xd8], rsi
0x206af1a: mov rbx, qword ptr [rsp + 0x20]
0x206af1f: mov rax, qword ptr [rbx]
0x206af22: xor edx, edx
0x206af24: mov rcx, rbx
0x206af27: call qword ptr [rax + 0x20]
0x206af2a: mov r15d, 0xffffffff
0x206af30: cmp byte ptr [rsp + 0x28], 1
0x206af35: jne 0x14206af63
0x206af37: mov eax, r15d
0x206af3a: lock xadd dword ptr [rbx + 8], eax
0x206af3f: cmp eax, 1
0x206af42: jne 0x14206af56
0x206af44: test dword ptr [rbx + 0xc], 0x40000000
0x206af4b: je 0x14206af63
0x206af4d: mov rax, qword ptr [rbx]
0x206af50: mov rcx, rbx
0x206af53: call qword ptr [rax + 0x40]
0x206af56: test dword ptr [rbx + 0xc], 0x40000000
0x206af5d: je 0x14206af63
0x206af5f: lock dec dword ptr [rbx + 0xc]
0x206af63: test rdi, rdi
0x206af66: je 0x14206af88
0x206af68: mov edx, 4
0x206af6d: mov r8d, 0x10
0x206af73: mov rax, qword ptr [rdi]
0x206af76: mov rcx, rdi
0x206af79: call qword ptr [rax + 0xc0]
0x206af7f: test al, al
0x206af81: je 0x14206af88
0x206af83: mov r12b, 1
0x206af86: jmp 0x14206af8b
0x206af88: xor r12b, r12b
0x206af8b: lea rax, [rip + 0x36baeb6]
0x206af92: mov qword ptr [rsp + 0x50], rax
0x206af97: mov qword ptr [rsp + 0x58], rdi
0x206af9c: mov byte ptr [rsp + 0x60], r12b
0x206afa1: mov byte ptr [rsp + 0x61], 0
0x206afa6: mov qword ptr [rsp + 0x68], r14
0x206afab: lea rax, [rip + 0x3508ad6]
0x206afb2: mov qword ptr [rsp + 0x50], rax
0x206afb7: lea rax, [rip + 0x3508aaa]
0x206afbe: mov qword ptr [rsp + 0x50], rax
0x206afc3: test r12b, r12b
0x206afc6: je 0x14206b1e3
0x206afcc: lea rdx, [rdi + 8]
0x206afd0: test rdi, rdi
0x206afd3: cmove rdx, r14
0x206afd7: mov r8b, 1
0x206afda: mov rdx, qword ptr [rdx]
0x206afdd: lea rcx, [rsp + 0x20]
0x206afe2: call 0x140393650
0x206afe7: nop 
0x206afe8: mov byte ptr [rdi + 0x94], 0
0x206afef: mov rax, qword ptr [rdi]
0x206aff2: mov rcx, rdi
0x206aff5: call qword ptr [rax + 0x180]
0x206affb: nop 
0x206affc: mov rbx, qword ptr [rsp + 0x20]
0x206b001: mov rax, qword ptr [rbx]
0x206b004: xor edx, edx
0x206b006: mov rcx, rbx
0x206b009: call qword ptr [rax + 0x20]
0x206b00c: cmp byte ptr [rsp + 0x28], 1
0x206b011: jne 0x14206b03f
0x206b013: mov eax, r15d
0x206b016: lock xadd dword ptr [rbx + 8], eax
0x206b01b: cmp eax, 1
0x206b01e: jne 0x14206b032
0x206b020: test dword ptr [rbx + 0xc], 0x40000000
0x206b027: je 0x14206b03f
0x206b029: mov rax, qword ptr [rbx]
0x206b02c: mov rcx, rbx
0x206b02f: call qword ptr [rax + 0x40]
0x206b032: test dword ptr [rbx + 0xc], 0x40000000
0x206b039: je 0x14206b03f
0x206b03b: lock dec dword ptr [rbx + 0xc]
0x206b03f: test rsi, rsi
0x206b042: je 0x14206b1d7
0x206b048: lea rdx, [rsp + 0x30]
0x206b04d: mov rcx, rdi
0x206b050: call 0x141801590
0x206b055: nop 
0x206b056: cmp byte ptr [rsp + 0x40], 0
0x206b05b: je 0x14206b1a9
0x206b061: xor r14b, r14b
0x206b064: mov rax, qword ptr [rsp + 0x38]
0x206b069: lea rdx, [rax + 8]
0x206b06d: test rax, rax
0x206b070: mov ebx, 0
0x206b075: cmove rdx, rbx
0x206b079: mov r8b, 1
0x206b07c: mov rdx, qword ptr [rdx]
0x206b07f: lea rcx, [rsp + 0x20]
0x206b084: call 0x140393650
0x206b089: nop 
0x206b08a: mov edx, dword ptr [rsi + 0x60]
0x206b08d: mov r8, qword ptr [rsp + 0x38]
0x206b092: mov r10d, dword ptr [r8 + 0x60]
0x206b096: mov ecx, ebx
0x206b098: test r10d, r10d
0x206b09b: je 0x14206b0d8
0x206b09d: mov r9, qword ptr [r8 + 0x58]
0x206b0a1: mov eax, ecx
0x206b0a3: add rax, rax
0x206b0a6: cmp edx, dword ptr [r9 + rax*8]
0x206b0aa: je 0x14206b0b5
0x206b0ac: inc ecx
0x206b0ae: cmp ecx, r10d
0x206b0b1: jb 0x14206b0a1
0x206b0b3: jmp 0x14206b0d8
0x206b0b5: cmp rsi, qword ptr [r8 + 0xa8]
0x206b0bc: jne 0x14206b0c7
0x206b0be: cmp edx, dword ptr [r8 + 0xa0]
0x206b0c5: je 0x14206b0d5
0x206b0c7: mov qword ptr [r8 + 0xa8], rsi
0x206b0ce: mov dword ptr [r8 + 0xa0], edx
0x206b0d5: mov r14b, 1
0x206b0d8: mov rbx, qword ptr [rsp + 0x20]
0x206b0dd: mov rax, qword ptr [rbx]
0x206b0e0: xor edx, edx
0x206b0e2: mov rcx, rbx
0x206b0e5: call qword ptr [rax + 0x20]
0x206b0e8: cmp byte ptr [rsp + 0x28], 1
0x206b0ed: jne 0x14206b11b
0x206b0ef: mov eax, r15d
0x206b0f2: lock xadd dword ptr [rbx + 8], eax
0x206b0f7: cmp eax, 1
0x206b0fa: jne 0x14206b10e
0x206b0fc: test dword ptr [rbx + 0xc], 0x40000000
0x206b103: je 0x14206b11b
0x206b105: mov rax, qword ptr [rbx]
0x206b108: mov rcx, rbx
0x206b10b: call qword ptr [rax + 0x40]
0x206b10e: test dword ptr [rbx + 0xc], 0x40000000
0x206b115: je 0x14206b11b
0x206b117: lock dec dword ptr [rbx + 0xc]
0x206b11b: test r14b, r14b
0x206b11e: je 0x14206b1a6
0x206b124: mov rax, qword ptr [rdi]
0x206b127: mov rcx, rdi
0x206b12a: call qword ptr [rax + 0x420]
0x206b130: lea rax, [rbp - 0x70]
0x206b134: mov qword ptr [rbp - 0x80], rax
0x206b138: xor ecx, ecx
0x206b13a: mov dword ptr [rbp - 0x78], ecx
0x206b13d: mov dword ptr [rbp - 0x74], 0x64
0x206b144: lea rax, [rbp - 0x80]
0x206b148: mov qword ptr [rsp + 0x20], rax
0x206b14d: mov qword ptr [rsp + 0x28], rcx
0x206b152: lea rdx, [rsp + 0x20]
0x206b157: mov rcx, qword ptr [rsp + 0x38]
0x206b15c: call 0x14155ffc0
0x206b161: mov rbx, qword ptr [rbp - 0x80]
0x206b165: mov r14d, dword ptr [rbp - 0x78]
0x206b169: shl r14, 5
0x206b16d: add r14, rbx
0x206b170: cmp rbx, r14
0x206b173: je 0x14206b19d
0x206b175: nop word ptr [rax + rax]
0x206b180: mov rax, qword ptr [rbx + 8]
0x206b184: mov rcx, qword ptr [rax + 0x68]
0x206b188: mov rcx, qword ptr [rcx + 0x90]
0x206b18f: call 0x14221c200
0x206b194: add rbx, 0x20
0x206b198: cmp rbx, r14
0x206b19b: jne 0x14206b180
0x206b19d: lea rcx, [rbp - 0x80]
0x206b1a1: call 0x14038a1a0
0x206b1a6: xor r14d, r14d
0x206b1a9: lea rax, [rip + 0x38ab3e8]
0x206b1b0: mov qword ptr [rsp + 0x30], rax
0x206b1b5: lea rax, [rip + 0x3508684]
0x206b1bc: mov qword ptr [rsp + 0x30], rax
0x206b1c1: lea rax, [rip + 0x36bac80]
0x206b1c8: mov qword ptr [rsp + 0x30], rax
0x206b1cd: lea rcx, [rsp + 0x30]
0x206b1d2: call 0x141434880
0x206b1d7: mov rax, qword ptr [rdi]
0x206b1da: mov rcx, rdi
0x206b1dd: call qword ptr [rax + 0x1f0]
0x206b1e3: test rsi, rsi
0x206b1e6: je 0x14206b25c
0x206b1e8: mov r8b, 1
0x206b1eb: mov rdx, qword ptr [rsi + 8]
0x206b1ef: lea rcx, [rsp + 0x20]
0x206b1f4: call 0x140393650
0x206b1f9: nop 
0x206b1fa: mov byte ptr [rsi + 0x94], 1
0x206b201: mov rax, qword ptr [rsi]
0x206b204: mov rcx, rsi
0x206b207: call qword ptr [rax + 0x180]
0x206b20d: nop 
0x206b20e: mov rbx, qword ptr [rsp + 0x20]
0x206b213: mov rax, qword ptr [rbx]
0x206b216: xor edx, edx
0x206b218: mov rcx, rbx
0x206b21b: call qword ptr [rax + 0x20]
0x206b21e: cmp byte ptr [rsp + 0x28], 1
0x206b223: jne 0x14206b250
0x206b225: lock xadd dword ptr [rbx + 8], r15d
0x206b22b: cmp r15d, 1
0x206b22f: jne 0x14206b243
0x206b231: test dword ptr [rbx + 0xc], 0x40000000
0x206b238: je 0x14206b250
0x206b23a: mov rax, qword ptr [rbx]
0x206b23d: mov rcx, rbx
0x206b240: call qword ptr [rax + 0x40]
0x206b243: test dword ptr [rbx + 0xc], 0x40000000
0x206b24a: je 0x14206b250
0x206b24c: lock dec dword ptr [rbx + 0xc]
0x206b250: mov rax, qword ptr [rsi]
0x206b253: mov rcx, rsi
0x206b256: call qword ptr [rax + 0x428]
0x206b25c: mov rcx, qword ptr [r13 + 0xd0]
0x206b263: test rcx, rcx
0x206b266: je 0x14206b290
0x206b268: mov r8, rsi
0x206b26b: test r12b, r12b
0x206b26e: je 0x14206b27a
0x206b270: mov rdx, rdi
0x206b273: call 0x1417ea6b0
0x206b278: jmp 0x14206b284
0x206b27a: xor edx, edx
0x206b27c: call 0x1417ea6b0
0x206b281: mov rdi, r14
0x206b284: mov r8, rsi
0x206b287: mov rdx, rdi
0x206b28a: call 0x14156ec60
0x206b28f: nop 
0x206b290: lea rax, [rip + 0x36babb1]
0x206b297: mov qword ptr [rsp + 0x50], rax
0x206b29c: lea rcx, [rsp + 0x50]
0x206b2a1: call 0x141434880
0x206b2a6: lea r11, [rsp + 0xd10]
0x206b2ae: mov rbx, qword ptr [r11 + 0x38]
0x206b2b2: mov rsi, qword ptr [r11 + 0x40]
0x206b2b6: mov rdi, qword ptr [r11 + 0x48]
0x206b2ba: mov rsp, r11
0x206b2bd: pop r15
0x206b2bf: pop r14
0x206b2c1: pop r13
0x206b2c3: pop r12
0x206b2c5: pop rbp
0x206b2c6: ret 