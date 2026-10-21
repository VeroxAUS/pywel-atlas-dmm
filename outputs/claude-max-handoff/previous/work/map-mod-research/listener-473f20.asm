0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 