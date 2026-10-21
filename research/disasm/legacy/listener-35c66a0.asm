0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 