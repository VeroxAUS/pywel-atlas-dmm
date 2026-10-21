0x17ee020: mov qword ptr [rsp + 8], rbx
0x17ee025: mov qword ptr [rsp + 0x18], rsi
0x17ee02a: mov qword ptr [rsp + 0x10], rdx
0x17ee02f: push rdi
0x17ee030: sub rsp, 0x30
0x17ee034: mov rbx, rdx
0x17ee037: xor esi, esi
0x17ee039: mov dword ptr [rsp + 0x20], esi
0x17ee03d: mov rdi, qword ptr [rcx + 0xa0]
0x17ee044: test rdi, rdi
0x17ee047: jne 0x1417ee08e
0x17ee049: lea rcx, [rip + 0x3f37df8]
0x17ee050: mov qword ptr [rdx], rcx
0x17ee053: mov qword ptr [rdx + 8], rsi
0x17ee057: mov word ptr [rdx + 0x10], si
0x17ee05b: mov qword ptr [rdx + 0x18], rsi
0x17ee05f: lea rax, [rip + 0x3d85a22]
0x17ee066: mov qword ptr [rdx], rax
0x17ee069: lea rax, [rip + 0x3d859f8]
0x17ee070: mov qword ptr [rdx], rax
0x17ee073: mov dword ptr [rsp + 0x20], 1
0x17ee07b: mov rax, rdx
0x17ee07e: mov rbx, qword ptr [rsp + 0x40]
0x17ee083: mov rsi, qword ptr [rsp + 0x50]
0x17ee088: add rsp, 0x30
0x17ee08c: pop rdi
0x17ee08d: ret 
0x17ee08e: mov rdi, qword ptr [rdi + 0xd0]
0x17ee095: test rdi, rdi
0x17ee098: je 0x1417ee0b9
0x17ee09a: mov edx, 4
0x17ee09f: mov r8d, 0x10
0x17ee0a5: mov rax, qword ptr [rdi]
0x17ee0a8: mov rcx, rdi
0x17ee0ab: call qword ptr [rax + 0xc0]
0x17ee0b1: test al, al
0x17ee0b3: je 0x1417ee0b9
0x17ee0b5: mov al, 1
0x17ee0b7: jmp 0x1417ee0bb
0x17ee0b9: xor al, al
0x17ee0bb: lea rcx, [rip + 0x3f37d86]
0x17ee0c2: mov qword ptr [rbx], rcx
0x17ee0c5: mov qword ptr [rbx + 8], rdi
0x17ee0c9: mov byte ptr [rbx + 0x10], al
0x17ee0cc: mov byte ptr [rbx + 0x11], 0
0x17ee0d0: mov qword ptr [rbx + 0x18], rsi
0x17ee0d4: lea rax, [rip + 0x3d859ad]
0x17ee0db: mov qword ptr [rbx], rax
0x17ee0de: lea rax, [rip + 0x3d85983]
0x17ee0e5: mov qword ptr [rbx], rax
0x17ee0e8: mov eax, 2
0x17ee0ed: mov dword ptr [rsp + 0x20], eax
0x17ee0f1: and eax, 0xfffffffd
0x17ee0f4: mov dword ptr [rsp + 0x20], eax
0x17ee0f8: or eax, 1
0x17ee0fb: mov dword ptr [rsp + 0x20], eax
0x17ee0ff: mov rax, rbx
0x17ee102: mov rbx, qword ptr [rsp + 0x40]
0x17ee107: mov rsi, qword ptr [rsp + 0x50]
0x17ee10c: add rsp, 0x30
0x17ee110: pop rdi
0x17ee111: ret 
0x17ee112: int3 