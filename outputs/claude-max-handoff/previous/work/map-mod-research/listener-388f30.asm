0x388f30: mov qword ptr [rsp + 0x10], rbx
0x388f35: mov qword ptr [rsp + 0x18], rbp
0x388f3a: push rsi
0x388f3b: push rdi
0x388f3c: push r14
0x388f3e: sub rsp, 0x50
0x388f42: mov edi, dword ptr [rcx]
0x388f44: mov rbx, qword ptr [rip + 0x69e0b2d]
0x388f4b: cmp edi, dword ptr [rbx + 8]
0x388f4e: jae 0x140389036
0x388f54: lea rsi, [rdi*8]
0x388f5c: mov rax, qword ptr [rbx + 0x58]
0x388f60: mov rax, qword ptr [rsi + rax]
0x388f64: test rax, rax
0x388f67: jne 0x140389040
0x388f6d: lea r14, [rbx + 0x90]
0x388f74: cmp qword ptr [r14], rax
0x388f77: jne 0x140388f9e
0x388f79: mov qword ptr [rsp + 0x20], r14
0x388f7e: xor r9d, r9d
0x388f81: mov r8, qword ptr [rip + 0x5711ca0]
0x388f88: mov rdx, qword ptr [rbx + 0x10]
0x388f8c: lea rcx, [rsp + 0x70]
0x388f91: call 0x1425c5230
0x388f96: mov eax, dword ptr [rsp + 0x70]
0x388f9a: test eax, eax
0x388f9c: jne 0x140389017
0x388f9e: call 0x141416af0
0x388fa3: add rax, 0x7d0
0x388fa9: mov qword ptr [rbx + 0x98], rax
0x388fb0: mov rcx, qword ptr [r14]
0x388fb3: mov rdx, qword ptr [rbx + 0x28]
0x388fb7: lea r14, [rip + 0x5398d02]
0x388fbe: mov qword ptr [rsp + 0x30], r14
0x388fc3: mov byte ptr [rsp + 0x38], 0
0x388fc8: lea rbp, [rip + 0x5398c91]
0x388fcf: mov qword ptr [rsp + 0x30], rbp
0x388fd4: mov rax, qword ptr [rcx]
0x388fd7: mov qword ptr [rsp + 0x40], rax
0x388fdc: mov eax, dword ptr [rcx + 0xc]
0x388fdf: mov dword ptr [rsp + 0x48], eax
0x388fe3: mov dword ptr [rsp + 0x4c], 0
0x388feb: mov eax, dword ptr [rdx + rsi + 4]
0x388fef: mov dword ptr [rsp + 0x4c], eax
0x388ff3: lea r9, [rsp + 0x30]
0x388ff8: mov r8d, edi
0x388ffb: lea rdx, [rsp + 0x70]
0x389000: mov rcx, rbx
0x389003: call 0x14038c950
0x389008: nop 
0x389009: mov qword ptr [rsp + 0x30], rbp
0x38900e: mov qword ptr [rsp + 0x30], r14
0x389013: mov eax, dword ptr [rsp + 0x70]
0x389017: mov rcx, qword ptr [rip + 0x6953bc2]
0x38901e: test eax, eax
0x389020: je 0x140389027
0x389022: mov rax, rcx
0x389025: jmp 0x14038902f
0x389027: mov rax, qword ptr [rbx + 0x58]
0x38902b: mov rax, qword ptr [rsi + rax]
0x38902f: test rax, rax
0x389032: je 0x14038903d
0x389034: jmp 0x140389040
0x389036: mov rcx, qword ptr [rip + 0x6953ba3]
0x38903d: mov rax, rcx
0x389040: mov rbx, qword ptr [rsp + 0x78]
0x389045: mov rbp, qword ptr [rsp + 0x80]
0x38904d: add rsp, 0x50
0x389051: pop r14
0x389053: pop rdi
0x389054: pop rsi
0x389055: ret 