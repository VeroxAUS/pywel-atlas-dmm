0x27c0450: mov qword ptr [rsp + 0x18], rbx
0x27c0455: mov qword ptr [rsp + 0x10], rdx
0x27c045a: push rbp
0x27c045b: push rsi
0x27c045c: push rdi
0x27c045d: push r12
0x27c045f: push r13
0x27c0461: push r14
0x27c0463: push r15
0x27c0465: sub rsp, 0x80
0x27c046c: mov rbx, rcx
0x27c046f: mov r14, qword ptr [rcx + 0x120]
0x27c0476: mov r15, qword ptr [rcx + 0x138]
0x27c047d: mov r12, qword ptr [rcx + 0xe8]
0x27c0484: mov r13, qword ptr [rcx + 0x148]
0x27c048b: mov rax, qword ptr [rcx + 0x140]
0x27c0492: mov qword ptr [rsp + 0x58], rax
0x27c0497: mov rax, qword ptr [rcx + 0x20]
0x27c049b: mov qword ptr [rsp + 0x28], rax
0x27c04a0: mov rax, qword ptr [rcx + 0x168]
0x27c04a7: mov qword ptr [rsp + 0x60], rax
0x27c04ac: mov rax, qword ptr [rcx + 0x108]
0x27c04b3: mov qword ptr [rsp + 0x68], rax
0x27c04b8: mov rax, qword ptr [rcx + 0x180]
0x27c04bf: mov qword ptr [rsp + 0x70], rax
0x27c04c4: mov rax, qword ptr [rcx + 0x198]
0x27c04cb: mov qword ptr [rsp + 0x78], rax
0x27c04d0: mov rax, qword ptr [rcx + 0x1a0]
0x27c04d7: mov qword ptr [rsp + 0xd8], rax
0x27c04df: mov rax, qword ptr [rcx + 0x190]
0x27c04e6: mov qword ptr [rsp + 0x50], rax
0x27c04eb: mov rax, qword ptr [rcx + 0x178]
0x27c04f2: mov qword ptr [rsp + 0x38], rax
0x27c04f7: mov rax, qword ptr [rcx + 0x170]
0x27c04fe: mov qword ptr [rsp + 0x40], rax
0x27c0503: mov rax, qword ptr [rcx + 0x160]
0x27c050a: mov qword ptr [rsp + 0x20], rax
0x27c050f: mov rax, qword ptr [rcx + 0x188]
0x27c0516: mov qword ptr [rsp + 0x30], rax
0x27c051b: mov ebp, 0x1fd
0x27c0520: mov rax, qword ptr gs:[0x58]
0x27c0529: add rbp, qword ptr [rax]
0x27c052c: mov qword ptr [rsp + 0xc0], rbp
0x27c0534: mov edx, 0x10
0x27c0539: mov ecx, 0x98
0x27c053e: cmp byte ptr [rbp], 0
0x27c0542: je 0x1427c054b
0x27c0544: call 0x1447efa78
0x27c0549: jmp 0x1427c0550
0x27c054b: call 0x1447ef9b0
0x27c0550: mov rdi, rax
0x27c0553: test rax, rax
0x27c0556: jne 0x1427c0573
0x27c0558: call 0x141318e70
0x27c055d: xor r9d, r9d
0x27c0560: xor r8d, r8d
0x27c0563: mov edx, 1
0x27c0568: mov ecx, 0xa0000002
0x27c056d: call qword ptr [rip + 0x2a2abd5]
0x27c0573: mov qword ptr [rsp + 0x48], rdi
0x27c0578: test rdi, rdi
0x27c057b: je 0x1427c0623
0x27c0581: mov qword ptr [rdi], r14
0x27c0584: mov qword ptr [rdi + 8], r15
0x27c0588: mov qword ptr [rdi + 0x10], r12
0x27c058c: mov rax, qword ptr [rsp + 0xd8]
0x27c0594: mov qword ptr [rdi + 0x18], rax
0x27c0598: mov rax, qword ptr [rsp + 0x50]
0x27c059d: mov qword ptr [rdi + 0x20], rax
0x27c05a1: mov qword ptr [rdi + 0x28], r13
0x27c05a5: mov qword ptr [rdi + 0x30], 0
0x27c05ad: mov rax, qword ptr [rsp + 0x58]
0x27c05b2: mov qword ptr [rdi + 0x38], rax
0x27c05b6: mov rax, qword ptr [rsp + 0x60]
0x27c05bb: mov qword ptr [rdi + 0x40], rax
0x27c05bf: mov rax, qword ptr [rsp + 0x68]
0x27c05c4: mov qword ptr [rdi + 0x48], rax
0x27c05c8: mov rax, qword ptr [rsp + 0x70]
0x27c05cd: mov qword ptr [rdi + 0x50], rax
0x27c05d1: mov rax, qword ptr [rsp + 0x78]
0x27c05d6: mov qword ptr [rdi + 0x58], rax
0x27c05da: mov rax, qword ptr [rsp + 0x38]
0x27c05df: mov qword ptr [rdi + 0x60], rax
0x27c05e3: mov rax, qword ptr [rsp + 0x40]
0x27c05e8: mov qword ptr [rdi + 0x68], rax
0x27c05ec: mov rax, qword ptr [rsp + 0x20]
0x27c05f1: mov qword ptr [rdi + 0x70], rax
0x27c05f5: mov rax, qword ptr [rsp + 0x28]
0x27c05fa: mov qword ptr [rdi + 0x78], rax
0x27c05fe: mov qword ptr [rdi + 0x80], 0
0x27c0609: mov rax, qword ptr [rsp + 0x30]
0x27c060e: mov qword ptr [rdi + 0x88], rax
0x27c0615: mov byte ptr [rdi + 0x90], 1
0x27c061c: mov qword ptr [rip + 0x45a8ebd], rdi
0x27c0623: cmp rdi, qword ptr [rbx + 0x1b8]
0x27c062a: je 0x1427c063f
0x27c062c: lea rcx, [rbx + 0x1b8]
0x27c0633: call 0x140ad4370
0x27c0638: mov qword ptr [rbx + 0x1b8], rdi
0x27c063f: mov r14, qword ptr [rbx + 0xf8]
0x27c0646: mov r15, qword ptr [rbx + 0x100]
0x27c064d: mov r12, qword ptr [rbx + 0x148]
0x27c0654: mov r13, qword ptr [rbx + 0x10]
0x27c0658: mov rax, qword ptr [rbx + 0x28]
0x27c065c: mov qword ptr [rsp + 0xd8], rax
0x27c0664: mov rax, qword ptr [rbx + 0x190]
0x27c066b: mov qword ptr [rsp + 0x30], rax
0x27c0670: mov rax, qword ptr [rbx + 0x18]
0x27c0674: mov qword ptr [rsp + 0x28], rax
0x27c0679: mov rax, qword ptr [rbx + 0xd8]
0x27c0680: mov qword ptr [rsp + 0x20], rax
0x27c0685: mov rax, qword ptr [rbx + 0xe8]
0x27c068c: mov qword ptr [rsp + 0x40], rax
0x27c0691: mov rax, qword ptr [rbx + 0x230]
0x27c0698: mov qword ptr [rsp + 0x38], rax
0x27c069d: mov edx, 0x10
0x27c06a2: mov ecx, 0x58
0x27c06a7: cmp byte ptr [rbp], 0
0x27c06ab: je 0x1427c06b4
0x27c06ad: call 0x1447efa78
0x27c06b2: jmp 0x1427c06b9
0x27c06b4: call 0x1447ef9b0
0x27c06b9: mov rdi, rax
0x27c06bc: test rax, rax
0x27c06bf: jne 0x1427c06dc
0x27c06c1: call 0x141318e70
0x27c06c6: xor r9d, r9d
0x27c06c9: xor r8d, r8d
0x27c06cc: mov edx, 1
0x27c06d1: mov ecx, 0xa0000002
0x27c06d6: call qword ptr [rip + 0x2a2aa6c]
0x27c06dc: mov qword ptr [rsp + 0x48], rdi
0x27c06e1: test rdi, rdi
0x27c06e4: je 0x1427c0741
0x27c06e6: mov qword ptr [rdi], r14
0x27c06e9: mov qword ptr [rdi + 8], r15
0x27c06ed: mov qword ptr [rdi + 0x10], r12
0x27c06f1: mov qword ptr [rdi + 0x18], r13
0x27c06f5: mov rax, qword ptr [rsp + 0xd8]
0x27c06fd: mov qword ptr [rdi + 0x20], rax
0x27c0701: mov rax, qword ptr [rsp + 0xc8]
0x27c0709: mov qword ptr [rdi + 0x28], rax
0x27c070d: mov rax, qword ptr [rsp + 0x30]
0x27c0712: mov qword ptr [rdi + 0x30], rax
0x27c0716: mov rax, qword ptr [rsp + 0x28]
0x27c071b: mov qword ptr [rdi + 0x38], rax
0x27c071f: mov rax, qword ptr [rsp + 0x20]
0x27c0724: mov qword ptr [rdi + 0x40], rax
0x27c0728: mov rax, qword ptr [rsp + 0x40]
0x27c072d: mov qword ptr [rdi + 0x48], rax
0x27c0731: mov rax, qword ptr [rsp + 0x38]
0x27c0736: mov qword ptr [rdi + 0x50], rax
0x27c073a: mov qword ptr [rip + 0x45a8f5f], rdi
0x27c0741: cmp rdi, qword ptr [rbx + 0x1c0]
0x27c0748: je 0x1427c075d
0x27c074a: lea rcx, [rbx + 0x1c0]
0x27c0751: call 0x1427c2a30
0x27c0756: mov qword ptr [rbx + 0x1c0], rdi
0x27c075d: mov rsi, qword ptr [rbx + 0xe8]
0x27c0764: mov rbp, qword ptr [rbx + 0x168]
0x27c076b: mov r14, qword ptr [rbx + 0x120]
0x27c0772: mov r15, qword ptr [rbx + 0x138]
0x27c0779: mov r12, qword ptr [rbx + 0x158]
0x27c0780: mov r13, qword ptr [rbx + 0x180]
0x27c0787: mov rax, qword ptr [rsp + 0xc0]
0x27c078f: mov edx, 0x10
0x27c0794: mov ecx, 0x38
0x27c0799: cmp byte ptr [rax], 0
0x27c079c: je 0x1427c07a5
0x27c079e: call 0x1447efa78
0x27c07a3: jmp 0x1427c07aa
0x27c07a5: call 0x1447ef9b0
0x27c07aa: mov rdi, rax
0x27c07ad: test rax, rax
0x27c07b0: jne 0x1427c07cd
0x27c07b2: call 0x141318e70
0x27c07b7: xor r9d, r9d
0x27c07ba: xor r8d, r8d
0x27c07bd: mov edx, 1
0x27c07c2: mov ecx, 0xa0000002
0x27c07c7: call qword ptr [rip + 0x2a2a97b]
0x27c07cd: mov qword ptr [rsp + 0xd8], rdi
0x27c07d5: test rdi, rdi
0x27c07d8: je 0x1427c07f5
0x27c07da: mov byte ptr [rdi], 1
0x27c07dd: mov qword ptr [rdi + 8], rsi
0x27c07e1: mov qword ptr [rdi + 0x10], rbp
0x27c07e5: mov qword ptr [rdi + 0x18], r14
0x27c07e9: mov qword ptr [rdi + 0x20], r15
0x27c07ed: mov qword ptr [rdi + 0x28], r12
0x27c07f1: mov qword ptr [rdi + 0x30], r13
0x27c07f5: mov rcx, qword ptr [rbx + 0x200]
0x27c07fc: cmp rdi, rcx
0x27c07ff: je 0x1427c0826
0x27c0801: test rcx, rcx
0x27c0804: je 0x1427c081f
0x27c0806: mov rax, qword ptr [rsp + 0xc0]
0x27c080e: cmp byte ptr [rax], 0
0x27c0811: je 0x1427c081a
0x27c0813: call 0x1447f03bc
0x27c0818: jmp 0x1427c081f
0x27c081a: call 0x1447f02bc
0x27c081f: mov qword ptr [rbx + 0x200], rdi
0x27c0826: mov rbp, qword ptr [rbx + 0xe8]
0x27c082d: mov r14, qword ptr [rbx + 0x148]
0x27c0834: mov r15, qword ptr [rbx + 8]
0x27c0838: mov r12, qword ptr [rbx + 0x28]
0x27c083c: mov r13, qword ptr [rbx + 0x110]
0x27c0843: mov rax, qword ptr [rbx + 0x230]
0x27c084a: mov qword ptr [rsp + 0xd8], rax
0x27c0852: mov rax, qword ptr [rbx + 0xd8]
0x27c0859: mov qword ptr [rsp + 0x30], rax
0x27c085e: mov rax, qword ptr [rbx + 0x188]
0x27c0865: mov qword ptr [rsp + 0x28], rax
0x27c086a: mov rax, qword ptr [rbx + 0x190]
0x27c0871: mov qword ptr [rsp + 0x20], rax
0x27c0876: mov rax, qword ptr [rsp + 0xc0]
0x27c087e: mov edx, 0x10
0x27c0883: mov ecx, 0x50
0x27c0888: cmp byte ptr [rax], 0
0x27c088b: je 0x1427c0894
0x27c088d: call 0x1447efa78
0x27c0892: jmp 0x1427c0899
0x27c0894: call 0x1447ef9b0
0x27c0899: mov rdi, rax
0x27c089c: test rax, rax
0x27c089f: jne 0x1427c08bc
0x27c08a1: call 0x141318e70
0x27c08a6: xor r9d, r9d
0x27c08a9: xor r8d, r8d
0x27c08ac: mov edx, 1
0x27c08b1: mov ecx, 0xa0000002
0x27c08b6: call qword ptr [rip + 0x2a2a88c]
0x27c08bc: mov qword ptr [rsp + 0x48], rdi
0x27c08c1: test rdi, rdi
0x27c08c4: je 0x1427c0913
0x27c08c6: mov qword ptr [rdi], rbp
0x27c08c9: mov qword ptr [rdi + 8], r14
0x27c08cd: mov qword ptr [rdi + 0x10], r15
0x27c08d1: mov qword ptr [rdi + 0x18], r12
0x27c08d5: mov qword ptr [rdi + 0x20], r13
0x27c08d9: mov rax, qword ptr [rsp + 0xc8]
0x27c08e1: mov qword ptr [rdi + 0x28], rax
0x27c08e5: mov rax, qword ptr [rsp + 0xd8]
0x27c08ed: mov qword ptr [rdi + 0x30], rax
0x27c08f1: mov rax, qword ptr [rsp + 0x30]
0x27c08f6: mov qword ptr [rdi + 0x38], rax
0x27c08fa: mov rax, qword ptr [rsp + 0x28]
0x27c08ff: mov qword ptr [rdi + 0x40], rax
0x27c0903: mov rax, qword ptr [rsp + 0x20]
0x27c0908: mov qword ptr [rdi + 0x48], rax
0x27c090c: mov qword ptr [rip + 0x45a8d85], rdi
0x27c0913: cmp rdi, qword ptr [rbx + 0x208]
0x27c091a: je 0x1427c092f
0x27c091c: lea rcx, [rbx + 0x208]
0x27c0923: call 0x1427c2b50
0x27c0928: mov qword ptr [rbx + 0x208], rdi
0x27c092f: mov rbp, qword ptr [rbx + 0xe8]
0x27c0936: mov r14, qword ptr [rbx + 0xf0]
0x27c093d: mov r15, qword ptr [rbx + 0x190]
0x27c0944: mov r12, qword ptr [rbx + 0x160]
0x27c094b: mov rax, qword ptr [rsp + 0xc0]
0x27c0953: mov edx, 0x10
0x27c0958: mov ecx, 0x20
0x27c095d: cmp byte ptr [rax], 0
0x27c0960: je 0x1427c0969
0x27c0962: call 0x1447efa78
0x27c0967: jmp 0x1427c096e
0x27c0969: call 0x1447ef9b0
0x27c096e: mov rdi, rax
0x27c0971: test rax, rax
0x27c0974: jne 0x1427c0991
0x27c0976: call 0x141318e70
0x27c097b: xor r9d, r9d
0x27c097e: xor r8d, r8d
0x27c0981: mov edx, 1
0x27c0986: mov ecx, 0xa0000002
0x27c098b: call qword ptr [rip + 0x2a2a7b7]
0x27c0991: mov qword ptr [rsp + 0xc8], rdi
0x27c0999: test rdi, rdi
0x27c099c: je 0x1427c09b4
0x27c099e: mov qword ptr [rdi], rbp
0x27c09a1: mov qword ptr [rdi + 8], r14
0x27c09a5: mov qword ptr [rdi + 0x10], r15
0x27c09a9: mov qword ptr [rdi + 0x18], r12
0x27c09ad: mov qword ptr [rip + 0x45a8cf4], rdi
0x27c09b4: cmp rdi, qword ptr [rbx + 0x210]
0x27c09bb: je 0x1427c09d0
0x27c09bd: lea rcx, [rbx + 0x210]
0x27c09c4: call 0x1427c2bb0
0x27c09c9: mov qword ptr [rbx + 0x210], rdi
0x27c09d0: mov rcx, rbx
0x27c09d3: mov rbx, qword ptr [rsp + 0xd0]
0x27c09db: add rsp, 0x80
0x27c09e2: pop r15
0x27c09e4: pop r14
0x27c09e6: pop r13
0x27c09e8: pop r12
0x27c09ea: pop rdi
0x27c09eb: pop rsi
0x27c09ec: pop rbp
0x27c09ed: jmp 0x1427c0a00