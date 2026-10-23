0xe002e0: mov rax, qword ptr gs:[0x58]
0xe002e9: mov r8, qword ptr [rip + 0x5f69238]  ; [0x6d69528] = runtime global (no file value)
0xe002f0: mov r10, qword ptr [rip + 0x5f69239]  ; [0x6d69530] = runtime global (no file value)
0xe002f7: movzx r11d, word ptr [rdx]
0xe002fb: mov rcx, qword ptr [rax]
0xe002fe: mov rax, r8
0xe00301: mov r9d, 0x1ec
0xe00307: movzx r9d, byte ptr [r9 + rcx]
0xe0030c: test r9b, r9b
0xe0030f: cmovne rax, r10
0xe00313: mov rax, qword ptr [rax]
0xe00316: mov rcx, qword ptr [rax + 8]
0xe0031a: mov rax, qword ptr [rcx + 0x270]
0xe00321: cmp r11w, word ptr [rax + 0x10a]
0xe00329: je 0x140e00403
0xe0032f: test r9b, r9b
0xe00332: mov rax, r8
0xe00335: cmovne rax, r10
0xe00339: mov rax, qword ptr [rax]
0xe0033c: mov rcx, qword ptr [rax + 8]
0xe00340: mov rax, qword ptr [rcx + 0x270]
0xe00347: cmp r11w, word ptr [rax + 0x10e]
0xe0034f: je 0x140e00403
0xe00355: test r9b, r9b
0xe00358: mov rax, r8
0xe0035b: cmovne rax, r10
0xe0035f: mov rax, qword ptr [rax]
0xe00362: mov rcx, qword ptr [rax + 8]
0xe00366: mov rax, qword ptr [rcx + 0x270]
0xe0036d: cmp r11w, word ptr [rax + 0xfc]
0xe00375: je 0x140e00403
0xe0037b: test r9b, r9b
0xe0037e: mov rax, r8
0xe00381: cmovne rax, r10
0xe00385: mov rax, qword ptr [rax]
0xe00388: mov rcx, qword ptr [rax + 8]
0xe0038c: mov rax, qword ptr [rcx + 0x270]
0xe00393: cmp r11w, word ptr [rax + 0xfe]
0xe0039b: je 0x140e00403
0xe0039d: test r9b, r9b
0xe003a0: mov rax, r8
0xe003a3: cmovne rax, r10
0xe003a7: mov rax, qword ptr [rax]
0xe003aa: mov rcx, qword ptr [rax + 8]
0xe003ae: mov rax, qword ptr [rcx + 0x270]
0xe003b5: cmp r11w, word ptr [rax + 0x114]
0xe003bd: je 0x140e00403
0xe003bf: test r9b, r9b
0xe003c2: mov rax, r8
0xe003c5: cmovne rax, r10
0xe003c9: mov rax, qword ptr [rax]
0xe003cc: mov rcx, qword ptr [rax + 8]
0xe003d0: mov rax, qword ptr [rcx + 0x270]
0xe003d7: cmp r11w, word ptr [rax + 0x110]
0xe003df: je 0x140e00403
0xe003e1: test r9b, r9b
0xe003e4: cmovne r8, r10
0xe003e8: mov rax, qword ptr [r8]
0xe003eb: mov rcx, qword ptr [rax + 8]
0xe003ef: mov rax, qword ptr [rcx + 0x270]
0xe003f6: cmp r11w, word ptr [rax + 0x162]
0xe003fe: je 0x140e00403
0xe00400: xor al, al
0xe00402: ret 
0xe00403: mov al, 1
0xe00405: ret 