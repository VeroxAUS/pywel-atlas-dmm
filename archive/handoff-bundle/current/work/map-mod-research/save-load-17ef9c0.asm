0x17ef9c0: mov qword ptr [rsp + 8], rbx
0x17ef9c5: mov qword ptr [rsp + 0x18], rsi
0x17ef9ca: mov qword ptr [rsp + 0x20], rdi
0x17ef9cf: mov qword ptr [rsp + 0x10], rdx
0x17ef9d4: push rbp
0x17ef9d5: mov rbp, rsp
0x17ef9d8: sub rsp, 0x80
0x17ef9df: mov rbx, rdx
0x17ef9e2: xor esi, esi
0x17ef9e4: mov dword ptr [rbp - 0x60], esi
0x17ef9e7: mov rax, qword ptr [rcx + 0x68]
0x17ef9eb: mov rcx, qword ptr [rax + 0x1a0]
0x17ef9f2: mov rax, qword ptr [rcx]
0x17ef9f5: lea rdx, [rbp - 0x38]
0x17ef9f9: call qword ptr [rax + 0x140]
0x17ef9ff: nop 
0x17efa00: cmp byte ptr [rbp - 0x28], sil
0x17efa04: jne 0x1417efa66
0x17efa06: lea rdi, [rip + 0x3f3643b]
0x17efa0d: mov qword ptr [rbx], rdi
0x17efa10: mov qword ptr [rbx + 8], rsi
0x17efa14: mov word ptr [rbx + 0x10], si
0x17efa18: mov qword ptr [rbx + 0x18], rsi
0x17efa1c: lea rax, [rip + 0x3d84065]
0x17efa23: mov qword ptr [rbx], rax
0x17efa26: lea rax, [rip + 0x3d8403b]
0x17efa2d: mov qword ptr [rbx], rax
0x17efa30: mov dword ptr [rbp - 0x60], 1
0x17efa37: lea rax, [rip + 0x4123422]
0x17efa3e: mov qword ptr [rbp - 0x38], rax
0x17efa42: cmp byte ptr [rbp - 0x28], sil
0x17efa46: je 0x1417efa56
0x17efa48: mov rcx, qword ptr [rbp - 0x10]
0x17efa4c: mov rax, qword ptr [rcx]
0x17efa4f: call qword ptr [rax + 0x148]
0x17efa55: nop 
0x17efa56: lea rax, [rip + 0x3d83de3]
0x17efa5d: mov qword ptr [rbp - 0x38], rax
0x17efa61: jmp 0x1417efb69
0x17efa66: mov rax, qword ptr gs:[0x58]
0x17efa6f: mov rcx, qword ptr [rax]
0x17efa72: mov edx, 0x1ec
0x17efa77: mov rax, qword ptr [rip + 0x5579a5a]
0x17efa7e: cmp byte ptr [rdx + rcx], 0
0x17efa82: cmovne rax, qword ptr [rip + 0x5579a56]
0x17efa8a: mov rcx, qword ptr [rax + 0x10]
0x17efa8e: mov r8, qword ptr [rbp - 0x30]
0x17efa92: mov rax, qword ptr [rcx]
0x17efa95: mov r8d, dword ptr [r8 + 0x180]
0x17efa9c: lea rdx, [rbp - 0x58]
0x17efaa0: call qword ptr [rax + 0x30]
0x17efaa3: nop 
0x17efaa4: cmp byte ptr [rbp - 0x48], 0
0x17efaa8: jne 0x1417efb17
0x17efaaa: lea rdi, [rip + 0x3f36397]
0x17efab1: mov qword ptr [rbx], rdi
0x17efab4: mov qword ptr [rbx + 8], rsi
0x17efab8: mov word ptr [rbx + 0x10], 0
0x17efabe: mov qword ptr [rbx + 0x18], rsi
0x17efac2: lea rax, [rip + 0x3d83fbf]
0x17efac9: mov qword ptr [rbx], rax
0x17efacc: lea rax, [rip + 0x3d83f95]
0x17efad3: mov qword ptr [rbx], rax
0x17efad6: mov dword ptr [rbp - 0x60], 1
0x17efadd: mov qword ptr [rbp - 0x58], rdi
0x17efae1: lea rcx, [rbp - 0x58]
0x17efae5: call 0x141434880
0x17efaea: nop 
0x17efaeb: lea rax, [rip + 0x412336e]
0x17efaf2: mov qword ptr [rbp - 0x38], rax
0x17efaf6: cmp byte ptr [rbp - 0x28], 0
0x17efafa: je 0x1417efb0a
0x17efafc: mov rcx, qword ptr [rbp - 0x10]
0x17efb00: mov rax, qword ptr [rcx]
0x17efb03: call qword ptr [rax + 0x148]
0x17efb09: nop 
0x17efb0a: lea rax, [rip + 0x3d83d2f]
0x17efb11: mov qword ptr [rbp - 0x38], rax
0x17efb15: jmp 0x1417efb69
0x17efb17: mov rdx, rbx
0x17efb1a: mov rcx, qword ptr [rbp - 0x50]
0x17efb1e: call 0x14206ae30
0x17efb23: mov dword ptr [rbp - 0x60], 1
0x17efb2a: lea rdi, [rip + 0x3f36317]
0x17efb31: mov qword ptr [rbp - 0x58], rdi
0x17efb35: lea rcx, [rbp - 0x58]
0x17efb39: call 0x141434880
0x17efb3e: nop 
0x17efb3f: lea rax, [rip + 0x412331a]
0x17efb46: mov qword ptr [rbp - 0x38], rax
0x17efb4a: cmp byte ptr [rbp - 0x28], 0
0x17efb4e: je 0x1417efb5e
0x17efb50: mov rcx, qword ptr [rbp - 0x10]
0x17efb54: mov rax, qword ptr [rcx]
0x17efb57: call qword ptr [rax + 0x148]
0x17efb5d: nop 
0x17efb5e: lea rax, [rip + 0x3d83cdb]
0x17efb65: mov qword ptr [rbp - 0x38], rax
0x17efb69: mov qword ptr [rbp - 0x38], rdi
0x17efb6d: lea rcx, [rbp - 0x38]
0x17efb71: call 0x141434880
0x17efb76: mov rax, rbx
0x17efb79: lea r11, [rsp + 0x80]
0x17efb81: mov rbx, qword ptr [r11 + 0x10]
0x17efb85: mov rsi, qword ptr [r11 + 0x20]
0x17efb89: mov rdi, qword ptr [r11 + 0x28]
0x17efb8d: mov rsp, r11
0x17efb90: pop rbp
0x17efb91: ret 
0x17efb92: int3 