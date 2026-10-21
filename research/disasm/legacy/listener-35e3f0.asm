0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 