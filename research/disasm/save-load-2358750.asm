0x2358750: mov qword ptr [rsp + 0x18], rbx
0x2358755: mov qword ptr [rsp + 0x20], rsi
0x235875a: mov qword ptr [rsp + 0x10], rdx
0x235875f: push rbp
0x2358760: push rdi
0x2358761: push r14
0x2358763: lea rbp, [rsp - 0xc0]
0x235876b: sub rsp, 0x1c0
0x2358772: mov rdi, r8
0x2358775: mov rbx, rcx
0x2358778: xor r14d, r14d
0x235877b: mov qword ptr [rbp + 0xa8], r14
0x2358782: mov qword ptr [rbp + 0xb0], 0x105
0x235878d: mov dword ptr [rbp + 0xb4], r14d
0x2358794: mov byte ptr [rbp - 0x60], r14b
0x2358798: mov dword ptr [rbp + 0xb4], r14d
0x235879f: mov byte ptr [rbp - 0x60], r14b
0x23587a3: mov rax, qword ptr [rbp + 0xa8]
0x23587aa: test rax, rax
0x23587ad: je 0x1423587b2
0x23587af: mov byte ptr [rax], r14b
0x23587b2: mov rax, qword ptr [r8 + 0x88]
0x23587b9: mov rcx, rdi
0x23587bc: test rax, rax
0x23587bf: cmovne rcx, rax
0x23587c3: mov qword ptr [rbp + 0xe0], rcx
0x23587ca: mov dword ptr [rbp + 0xb4], 0xffffffff
0x23587d4: lea rcx, [rbp - 0x60]
0x23587d8: mov rax, qword ptr [rbp + 0xa8]
0x23587df: test rax, rax
0x23587e2: cmovne rcx, rax
0x23587e6: lea rax, [rbp + 0xe0]
0x23587ed: mov qword ptr [rsp + 0x20], rax
0x23587f2: lea r9, [rbp + 0xe8]
0x23587f9: mov edx, dword ptr [rbp + 0xb0]
0x23587ff: call 0x14235cac0
0x2358804: mov qword ptr [rsp + 0x60], r14
0x2358809: mov qword ptr [rsp + 0x68], r14
0x235880e: mov byte ptr [rsp + 0x70], 0xff
0x2358813: mov rdx, qword ptr [rbx + 0x10]
0x2358817: add rdx, 0x78
0x235881b: mov rax, qword ptr [rdx + 0x108]
0x2358822: test rax, rax
0x2358825: cmovne rdx, rax
0x2358829: lea r8, [rsp + 0x60]
0x235882e: mov rcx, rdi
0x2358831: call 0x14235c7a0
0x2358836: mov rsi, qword ptr [rsp + 0x60]
0x235883b: test al, al
0x235883d: jne 0x142358887
0x235883f: lea rax, [rip + 0x3482f12]
0x2358846: mov qword ptr [rsp + 0x58], rax
0x235884b: mov dword ptr [rsp + 0x50], 6
0x2358853: mov dword ptr [rsp + 0x48], r14d
0x2358858: lea r9, [rip + 0x321ac4d]
0x235885f: mov qword ptr [rsp + 0x40], r9
0x2358864: mov dword ptr [rsp + 0x38], r14d
0x2358869: mov qword ptr [rsp + 0x30], r9
0x235886e: mov qword ptr [rsp + 0x28], r9
0x2358873: mov qword ptr [rsp + 0x20], r9
0x2358878: mov cl, 1
0x235887a: call 0x14035d8d0
0x235887f: xor dil, dil
0x2358882: jmp 0x142358978
0x2358887: mov qword ptr [rsp + 0x78], 0xffffffffffffffff
0x2358890: mov dword ptr [rbp - 0x80], r14d
0x2358894: mov qword ptr [rbp - 0x78], r14
0x2358898: lea rax, [rip + 0x470d0a1]
0x235889f: mov qword ptr [rbp - 0x78], rax
0x23588a3: mov byte ptr [rbp - 0x70], 0
0x23588a7: lea rdx, [rbp - 0x60]
0x23588ab: mov rax, qword ptr [rbp + 0xa8]
0x23588b2: test rax, rax
0x23588b5: cmovne rdx, rax
0x23588b9: lea rcx, [rsp + 0x78]
0x23588be: call 0x1412b7a00
0x23588c3: test al, al
0x23588c5: jne 0x1423588d0
0x23588c7: lea rax, [rip + 0x362b382]
0x23588ce: jmp 0x1423588f2
0x23588d0: mov r8d, dword ptr [rsp + 0x6c]
0x23588d5: test r8d, r8d
0x23588d8: je 0x142358935
0x23588da: mov rdx, rsi
0x23588dd: lea rcx, [rsp + 0x78]
0x23588e2: call 0x1412b7d40
0x23588e7: test al, al
0x23588e9: jne 0x142358935
0x23588eb: lea rax, [rip + 0x362b376]
0x23588f2: mov qword ptr [rsp + 0x58], rax
0x23588f7: mov dword ptr [rsp + 0x50], 6
0x23588ff: mov dword ptr [rsp + 0x48], r14d
0x2358904: lea r9, [rip + 0x321aba1]
0x235890b: mov qword ptr [rsp + 0x40], r9
0x2358910: mov dword ptr [rsp + 0x38], r14d
0x2358915: mov qword ptr [rsp + 0x30], r9
0x235891a: mov qword ptr [rsp + 0x28], r9
0x235891f: mov qword ptr [rsp + 0x20], r9
0x2358924: mov cl, 1
0x2358926: call 0x14035d8d0
0x235892b: xor dil, dil
0x235892e: mov rbx, qword ptr [rsp + 0x78]
0x2358933: jmp 0x142358952
0x2358935: mov rbx, qword ptr [rsp + 0x78]
0x235893a: mov rcx, rbx
0x235893d: call qword ptr [rip + 0x2e92add]
0x2358943: lea rcx, [rdi + 0x120]
0x235894a: call 0x1413739b0
0x235894f: mov dil, 1
0x2358952: cmp rbx, -1
0x2358956: je 0x14235896e
0x2358958: mov rcx, rbx
0x235895b: call qword ptr [rip + 0x2e92b1f]
0x2358961: mov qword ptr [rsp + 0x78], 0xffffffffffffffff
0x235896a: mov dword ptr [rbp - 0x80], r14d
0x235896e: lea rcx, [rbp - 0x78]
0x2358972: call 0x140394db0
0x2358977: nop 
0x2358978: movsx eax, byte ptr [rsp + 0x70]
0x235897d: cmp al, 0xff
0x235897f: je 0x142358997
0x2358981: mov r8d, dword ptr [rsp + 0x68]
0x2358986: neg r8d
0x2358989: mov edx, eax
0x235898b: lea rax, [rip + 0x498088e]
0x2358992: lock add dword ptr [rax + rdx*4], r8d
0x2358997: mov ebx, 0x1fd
0x235899c: test rsi, rsi
0x235899f: je 0x1423589c7
0x23589a1: mov rax, qword ptr gs:[0x58]
0x23589aa: mov rdx, qword ptr [rax]
0x23589ad: mov rcx, rsi
0x23589b0: cmp byte ptr [rbx + rdx], 0
0x23589b4: je 0x1423589bd
0x23589b6: call 0x1447f03bc
0x23589bb: jmp 0x1423589c2
0x23589bd: call 0x1447f02bc
0x23589c2: mov qword ptr [rsp + 0x60], r14
0x23589c7: mov qword ptr [rsp + 0x68], r14
0x23589cc: mov rcx, qword ptr [rbp + 0xa8]
0x23589d3: test rcx, rcx
0x23589d6: je 0x1423589fd
0x23589d8: mov rax, qword ptr gs:[0x58]
0x23589e1: mov rdx, qword ptr [rax]
0x23589e4: cmp byte ptr [rbx + rdx], 0
0x23589e8: je 0x1423589f1
0x23589ea: call 0x1447f03bc
0x23589ef: jmp 0x1423589f6
0x23589f1: call 0x1447f02bc
0x23589f6: mov qword ptr [rbp + 0xa8], r14
0x23589fd: movzx eax, dil
0x2358a01: lea r11, [rsp + 0x1c0]
0x2358a09: mov rbx, qword ptr [r11 + 0x30]
0x2358a0d: mov rsi, qword ptr [r11 + 0x38]
0x2358a11: mov rsp, r11
0x2358a14: pop r14
0x2358a16: pop rdi
0x2358a17: pop rbp
0x2358a18: ret 