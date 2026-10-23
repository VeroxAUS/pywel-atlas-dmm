0x3d20850: mov qword ptr [rsp + 0x10], rbx
0x3d20855: mov qword ptr [rsp + 0x18], rbp
0x3d2085a: mov qword ptr [rsp + 0x20], rsi
0x3d2085f: mov qword ptr [rsp + 8], rcx
0x3d20864: push rdi
0x3d20865: push r12
0x3d20867: push r13
0x3d20869: push r14
0x3d2086b: push r15
0x3d2086d: sub rsp, 0x40
0x3d20871: mov r14, r9
0x3d20874: mov rbp, r8
0x3d20877: add rcx, 0x58
0x3d2087b: call 0x1404743a0
0x3d20880: mov rdi, rax
0x3d20883: test rax, rax
0x3d20886: je 0x143d20945
0x3d2088c: mov r12d, dword ptr [rax + 8]
0x3d20890: xor esi, esi
0x3d20892: test r12d, r12d
0x3d20895: je 0x143d20945
0x3d2089b: mov r8d, 0x238
0x3d208a1: lea r15, [rsi*8]
0x3d208a9: mov rax, qword ptr [rdi]
0x3d208ac: mov r13, qword ptr [r15 + rax]
0x3d208b0: mov rcx, qword ptr [r13 + 0x18]
0x3d208b4: movzx eax, byte ptr [r14 + 0x18]
0x3d208b9: test al, al
0x3d208bb: je 0x143d20921
0x3d208bd: mov r9, qword ptr [r14 + 8]
0x3d208c1: mov edx, eax
0x3d208c3: mov rax, qword ptr [rip + 0x3048b5e]  ; [0x6d69428] = runtime global (no file value)
0x3d208ca: mov rdx, qword ptr [rax + rdx*8 + 0x18]
0x3d208cf: test byte ptr [rdx + 0x128], 2
0x3d208d6: je 0x143d2090a
0x3d208d8: mov ebx, r8d
0x3d208db: mov rax, qword ptr gs:[0x58]
0x3d208e4: add rbx, qword ptr [rax]
0x3d208e7: mov rdx, qword ptr [rbx]
0x3d208ea: mov rax, qword ptr [r14]
0x3d208ed: mov qword ptr [rdx + 0x30], rax
0x3d208f1: mov qword ptr [rdx + 0x38], rbp
0x3d208f5: mov qword ptr [rdx + 0x40], rcx
0x3d208f9: mov rcx, r9
0x3d208fc: call 0x1413ea3e0
0x3d20901: mov rax, qword ptr [rbx]
0x3d20904: movzx eax, byte ptr [rax + 0x20]
0x3d20908: jmp 0x143d20930
0x3d2090a: test r9, r9
0x3d2090d: je 0x143d2091d
0x3d2090f: mov r8, rcx
0x3d20912: mov rdx, rbp
0x3d20915: mov rcx, qword ptr [r14]
0x3d20918: call r9
0x3d2091b: jmp 0x143d20930
0x3d2091d: xor al, al
0x3d2091f: jmp 0x143d20930
0x3d20921: mov rax, qword ptr [r14 + 8]
0x3d20925: mov r8, rcx
0x3d20928: mov rdx, rbp
0x3d2092b: mov rcx, qword ptr [r14]
0x3d2092e: call rax
0x3d20930: cmp al, 1
0x3d20932: je 0x143d20965
0x3d20934: inc esi
0x3d20936: cmp esi, r12d
0x3d20939: mov r8d, 0x238
0x3d2093f: jb 0x143d208a1
0x3d20945: xor al, al
0x3d20947: lea r11, [rsp + 0x40]
0x3d2094c: mov rbx, qword ptr [r11 + 0x38]
0x3d20950: mov rbp, qword ptr [r11 + 0x40]
0x3d20954: mov rsi, qword ptr [r11 + 0x48]
0x3d20958: mov rsp, r11
0x3d2095b: pop r15
0x3d2095d: pop r14
0x3d2095f: pop r13
0x3d20961: pop r12
0x3d20963: pop rdi
0x3d20964: ret 
0x3d20965: lea rbx, [r13 + 0x20]
0x3d20969: mov rcx, rbx
0x3d2096c: call 0x14140a210
0x3d20971: test al, al
0x3d20973: jne 0x143d209de
0x3d20975: cmp byte ptr [rsp + 0x90], al
0x3d2097c: jne 0x143d209de
0x3d2097e: mov rbp, qword ptr [rsp + 0x70]
0x3d20983: mov rbp, qword ptr [rbp + 0x18]
0x3d20987: lea rax, [rsp + 0x30]
0x3d2098c: mov qword ptr [rsp + 0x70], rax
0x3d20991: lea rax, [rip + 0x2d304d0]  ; [0x6a50e68] = 0 (0x00000000)
0x3d20998: mov qword ptr [rsp + 0x30], rax
0x3d2099d: mov dword ptr [rsp + 0x38], 0xffffffff
0x3d209a5: lea rax, [rsp + 0x30]
0x3d209aa: cmp rax, rbx
0x3d209ad: je 0x143d209c4
0x3d209af: mov rcx, rbx
0x3d209b2: call 0x14047b800
0x3d209b7: mov rdx, rax
0x3d209ba: lea rcx, [rsp + 0x30]
0x3d209bf: call 0x140398630
0x3d209c4: mov eax, dword ptr [rbx + 8]
0x3d209c7: mov dword ptr [rsp + 0x38], eax
0x3d209cb: xor r9d, r9d
0x3d209ce: xor r8d, r8d
0x3d209d1: lea rdx, [rsp + 0x30]
0x3d209d6: mov rcx, rbp
0x3d209d9: call 0x141403050
0x3d209de: mov rcx, qword ptr [rdi]
0x3d209e1: add rcx, r15
0x3d209e4: call 0x14038ad90
0x3d209e9: mov eax, dword ptr [rdi + 8]
0x3d209ec: dec eax
0x3d209ee: cmp esi, eax
0x3d209f0: jae 0x143d20a28
0x3d209f2: mov rcx, qword ptr [rdi]
0x3d209f5: xor r8d, r8d
0x3d209f8: lea rdx, [rcx + rax*8]
0x3d209fc: mov qword ptr [rcx + r15], r8
0x3d20a00: mov rax, qword ptr [rdx]
0x3d20a03: mov qword ptr [rcx + r15], rax
0x3d20a07: mov qword ptr [rdx], r8
0x3d20a0a: mov rax, qword ptr [rcx + r15]
0x3d20a0e: test rax, rax
0x3d20a11: je 0x143d20a17
0x3d20a13: mov byte ptr [rax + 0x16], 1
0x3d20a17: mov ecx, dword ptr [rdi + 8]
0x3d20a1a: dec ecx
0x3d20a1c: mov rax, qword ptr [rdi]
0x3d20a1f: lea rcx, [rax + rcx*8]
0x3d20a23: call 0x14038ad90
0x3d20a28: dec dword ptr [rdi + 8]
0x3d20a2b: mov al, 1
0x3d20a2d: jmp 0x143d20947
0x3d20a32: int3 