0x2358560: mov qword ptr [rsp + 0x10], rbx
0x2358565: mov qword ptr [rsp + 0x18], rbp
0x235856a: mov qword ptr [rsp + 0x20], r9
0x235856f: mov qword ptr [rsp + 8], rcx
0x2358574: push rsi
0x2358575: push rdi
0x2358576: push r14
0x2358578: sub rsp, 0x180
0x235857f: mov rsi, rdx
0x2358582: mov rbx, qword ptr [r8]
0x2358585: mov eax, dword ptr [r8 + 8]
0x2358589: lea rdi, [rbx + rax*8]
0x235858d: cmp rbx, rdi
0x2358590: je 0x1423586af
0x2358596: xor ebp, ebp
0x2358598: mov r14d, 0x1fd
0x235859e: nop 
0x23585a0: mov qword ptr [rsp + 0x168], rbp
0x23585a8: mov qword ptr [rsp + 0x170], 0x105
0x23585b4: mov dword ptr [rsp + 0x174], ebp
0x23585bb: mov byte ptr [rsp + 0x60], 0
0x23585c0: mov dword ptr [rsp + 0x174], ebp
0x23585c7: mov byte ptr [rsp + 0x60], 0
0x23585cc: mov rax, qword ptr [rsp + 0x168]
0x23585d4: test rax, rax
0x23585d7: je 0x1423585dc
0x23585d9: mov byte ptr [rax], 0
0x23585dc: mov rcx, qword ptr [rbx]
0x23585df: mov rax, qword ptr [rcx + 0x88]
0x23585e6: test rax, rax
0x23585e9: cmovne rcx, rax
0x23585ed: mov qword ptr [rsp + 0x1a0], rcx
0x23585f5: mov dword ptr [rsp + 0x174], 0xffffffff
0x2358600: lea rcx, [rsp + 0x60]
0x2358605: mov rax, qword ptr [rsp + 0x168]
0x235860d: test rax, rax
0x2358610: cmovne rcx, rax
0x2358614: lea rax, [rsp + 0x1a0]
0x235861c: mov qword ptr [rsp + 0x20], rax
0x2358621: lea r9, [rsp + 0x1b8]
0x2358629: mov edx, dword ptr [rsp + 0x170]
0x2358630: call 0x14235cac0
0x2358635: lea rcx, [rsp + 0x60]
0x235863a: mov rax, qword ptr [rsp + 0x168]
0x2358642: test rax, rax
0x2358645: cmovne rcx, rax
0x2358649: xor edx, edx
0x235864b: call 0x141328d10
0x2358650: test al, al
0x2358652: je 0x1423586c9
0x2358654: mov rdx, qword ptr [rbx]
0x2358657: mov rax, qword ptr [rdx + 0x88]
0x235865e: test rax, rax
0x2358661: cmovne rdx, rax
0x2358665: mov rcx, rsi
0x2358668: call 0x14235b450
0x235866d: nop 
0x235866e: mov rcx, qword ptr [rsp + 0x168]
0x2358676: test rcx, rcx
0x2358679: je 0x1423586a2
0x235867b: mov rax, qword ptr gs:[0x58]
0x2358684: mov rdx, qword ptr [rax]
0x2358687: cmp byte ptr [r14 + rdx], 0
0x235868c: je 0x142358695
0x235868e: call 0x1447f03bc
0x2358693: jmp 0x14235869a
0x2358695: call 0x1447f02bc
0x235869a: mov qword ptr [rsp + 0x168], rbp
0x23586a2: add rbx, 8
0x23586a6: cmp rbx, rdi
0x23586a9: jne 0x1423585a0
0x23586af: mov al, 1
0x23586b1: lea r11, [rsp + 0x180]
0x23586b9: mov rbx, qword ptr [r11 + 0x28]
0x23586bd: mov rbp, qword ptr [r11 + 0x30]
0x23586c1: mov rsp, r11
0x23586c4: pop r14
0x23586c6: pop rdi
0x23586c7: pop rsi
0x23586c8: ret 
0x23586c9: lea rax, [rip + 0x362b540]
0x23586d0: mov qword ptr [rsp + 0x58], rax
0x23586d5: mov dword ptr [rsp + 0x50], 6
0x23586dd: mov dword ptr [rsp + 0x48], ebp
0x23586e1: lea r9, [rip + 0x321adc4]
0x23586e8: mov qword ptr [rsp + 0x40], r9
0x23586ed: mov dword ptr [rsp + 0x38], ebp
0x23586f1: mov qword ptr [rsp + 0x30], r9
0x23586f6: mov qword ptr [rsp + 0x28], r9
0x23586fb: mov qword ptr [rsp + 0x20], r9
0x2358700: mov cl, 1
0x2358702: call 0x14035d8d0
0x2358707: nop 
0x2358708: mov rcx, qword ptr [rsp + 0x168]
0x2358710: test rcx, rcx
0x2358713: je 0x142358749
0x2358715: mov rax, qword ptr gs:[0x58]
0x235871e: mov rdx, qword ptr [rax]
0x2358721: cmp byte ptr [r14 + rdx], 0
0x2358726: je 0x14235873c
0x2358728: call 0x1447f03bc
0x235872d: mov qword ptr [rsp + 0x168], rbp
0x2358735: xor al, al
0x2358737: jmp 0x1423586b1
0x235873c: call 0x1447f02bc
0x2358741: mov qword ptr [rsp + 0x168], rbp
0x2358749: xor al, al
0x235874b: jmp 0x1423586b1