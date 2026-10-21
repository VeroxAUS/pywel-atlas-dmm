0x3880a0: mov qword ptr [rsp + 0x10], rbx
0x3880a5: mov qword ptr [rsp + 0x18], rbp
0x3880aa: push rsi
0x3880ab: push rdi
0x3880ac: push r14
0x3880ae: sub rsp, 0x50
0x3880b2: movzx edi, word ptr [rcx]
0x3880b5: mov rbx, qword ptr [rip + 0x69e1a34]
0x3880bc: cmp edi, dword ptr [rbx + 8]
0x3880bf: jae 0x1403881a8
0x3880c5: lea rsi, [rdi*8]
0x3880cd: mov rax, qword ptr [rbx + 0x58]
0x3880d1: mov rax, qword ptr [rsi + rax]
0x3880d5: test rax, rax
0x3880d8: jne 0x1403881b2
0x3880de: lea r14, [rbx + 0x90]
0x3880e5: cmp qword ptr [r14], rax
0x3880e8: jne 0x14038810f
0x3880ea: mov qword ptr [rsp + 0x20], r14
0x3880ef: xor r9d, r9d
0x3880f2: mov r8, qword ptr [rip + 0x57127b7]
0x3880f9: mov rdx, qword ptr [rbx + 0x10]
0x3880fd: lea rcx, [rsp + 0x70]
0x388102: call 0x1425c5230
0x388107: mov eax, dword ptr [rsp + 0x70]
0x38810b: test eax, eax
0x38810d: jne 0x140388189
0x38810f: call 0x141416af0
0x388114: add rax, 0x7d0
0x38811a: mov qword ptr [rbx + 0x98], rax
0x388121: mov rcx, qword ptr [r14]
0x388124: mov rdx, qword ptr [rbx + 0x28]
0x388128: lea r14, [rip + 0x5399b91]
0x38812f: mov qword ptr [rsp + 0x30], r14
0x388134: mov byte ptr [rsp + 0x38], 0
0x388139: lea rbp, [rip + 0x5399b20]
0x388140: mov qword ptr [rsp + 0x30], rbp
0x388145: mov rax, qword ptr [rcx]
0x388148: mov qword ptr [rsp + 0x40], rax
0x38814d: mov eax, dword ptr [rcx + 0xc]
0x388150: mov dword ptr [rsp + 0x48], eax
0x388154: mov dword ptr [rsp + 0x4c], 0
0x38815c: mov eax, dword ptr [rdx + rsi + 4]
0x388160: mov dword ptr [rsp + 0x4c], eax
0x388164: lea r9, [rsp + 0x30]
0x388169: movzx r8d, di
0x38816d: lea rdx, [rsp + 0x70]
0x388172: mov rcx, rbx
0x388175: call 0x14038cf30
0x38817a: nop 
0x38817b: mov qword ptr [rsp + 0x30], rbp
0x388180: mov qword ptr [rsp + 0x30], r14
0x388185: mov eax, dword ptr [rsp + 0x70]
0x388189: mov rcx, qword ptr [rip + 0x6978328]
0x388190: test eax, eax
0x388192: je 0x140388199
0x388194: mov rax, rcx
0x388197: jmp 0x1403881a1
0x388199: mov rax, qword ptr [rbx + 0x58]
0x38819d: mov rax, qword ptr [rsi + rax]
0x3881a1: test rax, rax
0x3881a4: je 0x1403881af
0x3881a6: jmp 0x1403881b2
0x3881a8: mov rcx, qword ptr [rip + 0x6978309]
0x3881af: mov rax, rcx
0x3881b2: mov rbx, qword ptr [rsp + 0x78]
0x3881b7: mov rbp, qword ptr [rsp + 0x80]
0x3881bf: add rsp, 0x50
0x3881c3: pop r14
0x3881c5: pop rdi
0x3881c6: pop rsi
0x3881c7: ret 