0x430020: mov qword ptr [rsp + 0x10], rbx
0x430025: mov qword ptr [rsp + 0x18], rbp
0x43002a: push rsi
0x43002b: push rdi
0x43002c: push r14
0x43002e: sub rsp, 0x50
0x430032: movzx edi, word ptr [rcx]
0x430035: mov rbx, qword ptr [rip + 0x693be34]
0x43003c: cmp edi, dword ptr [rbx + 8]
0x43003f: jae 0x140430128
0x430045: lea rsi, [rdi*8]
0x43004d: mov rax, qword ptr [rbx + 0x58]
0x430051: mov rax, qword ptr [rsi + rax]
0x430055: test rax, rax
0x430058: jne 0x140430132
0x43005e: lea r14, [rbx + 0x90]
0x430065: cmp qword ptr [r14], rax
0x430068: jne 0x14043008f
0x43006a: mov qword ptr [rsp + 0x20], r14
0x43006f: xor r9d, r9d
0x430072: mov r8, qword ptr [rip + 0x566ab07]
0x430079: mov rdx, qword ptr [rbx + 0x10]
0x43007d: lea rcx, [rsp + 0x70]
0x430082: call 0x1425c5230
0x430087: mov eax, dword ptr [rsp + 0x70]
0x43008b: test eax, eax
0x43008d: jne 0x140430109
0x43008f: call 0x141416af0
0x430094: add rax, 0x7d0
0x43009a: mov qword ptr [rbx + 0x98], rax
0x4300a1: mov rcx, qword ptr [r14]
0x4300a4: mov rdx, qword ptr [rbx + 0x28]
0x4300a8: lea r14, [rip + 0x52f1c11]
0x4300af: mov qword ptr [rsp + 0x30], r14
0x4300b4: mov byte ptr [rsp + 0x38], 0
0x4300b9: lea rbp, [rip + 0x52f1ba0]
0x4300c0: mov qword ptr [rsp + 0x30], rbp
0x4300c5: mov rax, qword ptr [rcx]
0x4300c8: mov qword ptr [rsp + 0x40], rax
0x4300cd: mov eax, dword ptr [rcx + 0xc]
0x4300d0: mov dword ptr [rsp + 0x48], eax
0x4300d4: mov dword ptr [rsp + 0x4c], 0
0x4300dc: mov eax, dword ptr [rdx + rsi + 4]
0x4300e0: mov dword ptr [rsp + 0x4c], eax
0x4300e4: lea r9, [rsp + 0x30]
0x4300e9: movzx r8d, di
0x4300ed: lea rdx, [rsp + 0x70]
0x4300f2: mov rcx, rbx
0x4300f5: call 0x140433880
0x4300fa: nop 
0x4300fb: mov qword ptr [rsp + 0x30], rbp
0x430100: mov qword ptr [rsp + 0x30], r14
0x430105: mov eax, dword ptr [rsp + 0x70]
0x430109: mov rcx, qword ptr [rip + 0x68af5d0]
0x430110: test eax, eax
0x430112: je 0x140430119
0x430114: mov rax, rcx
0x430117: jmp 0x140430121
0x430119: mov rax, qword ptr [rbx + 0x58]
0x43011d: mov rax, qword ptr [rsi + rax]
0x430121: test rax, rax
0x430124: je 0x14043012f
0x430126: jmp 0x140430132
0x430128: mov rcx, qword ptr [rip + 0x68af5b1]
0x43012f: mov rax, rcx
0x430132: mov rbx, qword ptr [rsp + 0x78]
0x430137: mov rbp, qword ptr [rsp + 0x80]
0x43013f: add rsp, 0x50
0x430143: pop r14
0x430145: pop rdi
0x430146: pop rsi
0x430147: ret 