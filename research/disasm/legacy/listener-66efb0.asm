0x66efb0: mov qword ptr [rsp + 8], rbx
0x66efb5: mov qword ptr [rsp + 0x10], rbp
0x66efba: push rsi
0x66efbb: push rdi
0x66efbc: push r12
0x66efbe: push r14
0x66efc0: push r15
0x66efc2: sub rsp, 0x20
0x66efc6: mov rbx, r9
0x66efc9: mov rsi, r8
0x66efcc: mov r14d, edx
0x66efcf: mov r15, rcx
0x66efd2: mov rax, qword ptr gs:[0x58]
0x66efdb: mov rbp, qword ptr [rax]
0x66efde: mov eax, 0x240
0x66efe3: xor r12d, r12d
0x66efe6: mov dword ptr [rax + rbp], r12d
0x66efea: mov edx, 2
0x66efef: lea rcx, [rsp + 0x68]
0x66eff4: call 0x141424650
0x66eff9: nop 
0x66effa: mov rdi, qword ptr [rbx]
0x66effd: lea rbx, [rip + 0x666b0ac]
0x66f004: test rdi, rdi
0x66f007: je 0x14066f026
0x66f009: call 0x1414245b0
0x66f00e: cmp dword ptr [rax + 8], r12d
0x66f012: ja 0x14066f019
0x66f014: mov rax, rbx
0x66f017: jmp 0x14066f01f
0x66f019: mov rax, qword ptr [rax]
0x66f01c: mov rax, qword ptr [rax]
0x66f01f: mov qword ptr [rax + 0x808], rdi
0x66f026: call 0x1414245b0
0x66f02b: cmp dword ptr [rax + 8], 1
0x66f02f: jbe 0x14066f038
0x66f031: mov rax, qword ptr [rax]
0x66f034: mov rbx, qword ptr [rax + 8]
0x66f038: mov rax, qword ptr [rsp + 0x70]
0x66f03d: mov ecx, dword ptr [rax]
0x66f03f: mov r9d, 0xa
0x66f045: mov r8d, 0x801
0x66f04b: mov rdx, rbx
0x66f04e: call qword ptr [rip + 0x4b7d00c]
0x66f054: mov r8, rsi
0x66f057: mov edx, r14d
0x66f05a: mov rcx, r15
0x66f05d: call 0x141424bd0
0x66f062: nop 
0x66f063: call 0x1414245b0
0x66f068: mov rdi, rax
0x66f06b: mov ebx, r12d
0x66f06e: cmp dword ptr [rax + 8], ebx
0x66f071: jbe 0x14066f0b4
0x66f073: mov r14d, 0x1fd
0x66f079: nop dword ptr [rax]
0x66f080: mov edx, ebx
0x66f082: mov rcx, qword ptr [rdi]
0x66f085: lea rsi, [rcx + rdx*8]
0x66f089: mov rcx, qword ptr [rsi]
0x66f08c: test rcx, rcx
0x66f08f: je 0x14066f0a7
0x66f091: cmp byte ptr [r14 + rbp], 0
0x66f096: je 0x14066f09f
0x66f098: call 0x1447f03bc
0x66f09d: jmp 0x14066f0a4
0x66f09f: call 0x1447f02bc
0x66f0a4: mov qword ptr [rsi], r12
0x66f0a7: inc ebx
0x66f0a9: cmp ebx, dword ptr [rdi + 8]
0x66f0ac: jb 0x14066f080
0x66f0ae: mov dword ptr [rdi + 8], r12d
0x66f0b2: jmp 0x14066f0b8
0x66f0b4: mov dword ptr [rax + 8], r12d
0x66f0b8: mov rbx, qword ptr [rsp + 0x50]
0x66f0bd: mov rbp, qword ptr [rsp + 0x58]
0x66f0c2: add rsp, 0x20
0x66f0c6: pop r15
0x66f0c8: pop r14
0x66f0ca: pop r12
0x66f0cc: pop rdi
0x66f0cd: pop rsi
0x66f0ce: ret 