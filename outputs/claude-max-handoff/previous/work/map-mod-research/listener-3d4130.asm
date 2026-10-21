0x3d4130: mov qword ptr [rsp + 0x18], rbx
0x3d4135: push rsi
0x3d4136: sub rsp, 0x20
0x3d413a: mov esi, edx
0x3d413c: mov rbx, rcx
0x3d413f: cmp edx, dword ptr [rcx + 0xc]
0x3d4142: ja 0x1403d4151
0x3d4144: xor al, al
0x3d4146: mov rbx, qword ptr [rsp + 0x40]
0x3d414b: add rsp, 0x20
0x3d414f: pop rsi
0x3d4150: ret 
0x3d4151: mov rax, qword ptr gs:[0x58]
0x3d415a: lea ecx, [rdx*8]
0x3d4161: mov qword ptr [rsp + 0x30], rbp
0x3d4166: mov edx, 4
0x3d416b: mov ebp, 0x1fd
0x3d4170: mov qword ptr [rsp + 0x38], rdi
0x3d4175: add rbp, qword ptr [rax]
0x3d4178: cmp byte ptr [rbp], 0
0x3d417c: je 0x1403d4185
0x3d417e: call 0x1447efa78
0x3d4183: jmp 0x1403d418a
0x3d4185: call 0x1447ef9b0
0x3d418a: mov rdi, rax
0x3d418d: test rax, rax
0x3d4190: jne 0x1403d41ad
0x3d4192: call 0x141318e70
0x3d4197: xor r9d, r9d
0x3d419a: xor r8d, r8d
0x3d419d: mov edx, 1
0x3d41a2: mov ecx, 0xa0000002
0x3d41a7: call qword ptr [rip + 0x4e16f9b]
0x3d41ad: xor r8d, r8d
0x3d41b0: cmp dword ptr [rbx + 8], r8d
0x3d41b4: jbe 0x1403d41dc
0x3d41b6: nop word ptr [rax + rax]
0x3d41c0: mov rax, qword ptr [rbx]
0x3d41c3: lea rdx, [r8*8]
0x3d41cb: inc r8d
0x3d41ce: mov rcx, qword ptr [rdx + rax]
0x3d41d2: mov qword ptr [rdx + rdi], rcx
0x3d41d6: cmp r8d, dword ptr [rbx + 8]
0x3d41da: jb 0x1403d41c0
0x3d41dc: mov rcx, qword ptr [rbx]
0x3d41df: test rcx, rcx
0x3d41e2: je 0x1403d41f6
0x3d41e4: cmp byte ptr [rbp], 0
0x3d41e8: je 0x1403d41f1
0x3d41ea: call 0x1447f03bc
0x3d41ef: jmp 0x1403d41f6
0x3d41f1: call 0x1447f02bc
0x3d41f6: mov rbp, qword ptr [rsp + 0x30]
0x3d41fb: mov al, 1
0x3d41fd: mov qword ptr [rbx], rdi
0x3d4200: mov rdi, qword ptr [rsp + 0x38]
0x3d4205: mov dword ptr [rbx + 0xc], esi
0x3d4208: mov rbx, qword ptr [rsp + 0x40]
0x3d420d: add rsp, 0x20
0x3d4211: pop rsi
0x3d4212: ret 