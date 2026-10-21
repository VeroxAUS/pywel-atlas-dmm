0x388e00: mov qword ptr [rsp + 0x10], rbx
0x388e05: mov qword ptr [rsp + 0x18], rbp
0x388e0a: push rsi
0x388e0b: push rdi
0x388e0c: push r14
0x388e0e: sub rsp, 0x50
0x388e12: movzx edi, word ptr [rcx]
0x388e15: mov rbx, qword ptr [rip + 0x69e0c64]
0x388e1c: cmp edi, dword ptr [rbx + 8]
0x388e1f: jae 0x140388f08
0x388e25: lea rsi, [rdi*8]
0x388e2d: mov rax, qword ptr [rbx + 0x58]
0x388e31: mov rax, qword ptr [rsi + rax]
0x388e35: test rax, rax
0x388e38: jne 0x140388f12
0x388e3e: lea r14, [rbx + 0x90]
0x388e45: cmp qword ptr [r14], rax
0x388e48: jne 0x140388e6f
0x388e4a: mov qword ptr [rsp + 0x20], r14
0x388e4f: xor r9d, r9d
0x388e52: lea r8, [rip + 0x5712a9f]
0x388e59: mov rdx, qword ptr [rbx + 0x10]
0x388e5d: lea rcx, [rsp + 0x70]
0x388e62: call 0x1425c5230
0x388e67: mov eax, dword ptr [rsp + 0x70]
0x388e6b: test eax, eax
0x388e6d: jne 0x140388ee9
0x388e6f: call 0x141416af0
0x388e74: add rax, 0x7d0
0x388e7a: mov qword ptr [rbx + 0x98], rax
0x388e81: mov rcx, qword ptr [r14]
0x388e84: mov rdx, qword ptr [rbx + 0x28]
0x388e88: lea r14, [rip + 0x5398e31]
0x388e8f: mov qword ptr [rsp + 0x30], r14
0x388e94: mov byte ptr [rsp + 0x38], 0
0x388e99: lea rbp, [rip + 0x5398dc0]
0x388ea0: mov qword ptr [rsp + 0x30], rbp
0x388ea5: mov rax, qword ptr [rcx]
0x388ea8: mov qword ptr [rsp + 0x40], rax
0x388ead: mov eax, dword ptr [rcx + 0xc]
0x388eb0: mov dword ptr [rsp + 0x48], eax
0x388eb4: mov dword ptr [rsp + 0x4c], 0
0x388ebc: mov eax, dword ptr [rdx + rsi + 4]
0x388ec0: mov dword ptr [rsp + 0x4c], eax
0x388ec4: lea r9, [rsp + 0x30]
0x388ec9: movzx r8d, di
0x388ecd: lea rdx, [rsp + 0x70]
0x388ed2: mov rcx, rbx
0x388ed5: call 0x14038b6b0
0x388eda: nop 
0x388edb: mov qword ptr [rsp + 0x30], rbp
0x388ee0: mov qword ptr [rsp + 0x30], r14
0x388ee5: mov eax, dword ptr [rsp + 0x70]
0x388ee9: mov rcx, qword ptr [rip + 0x69788a8]
0x388ef0: test eax, eax
0x388ef2: je 0x140388ef9
0x388ef4: mov rax, rcx
0x388ef7: jmp 0x140388f01
0x388ef9: mov rax, qword ptr [rbx + 0x58]
0x388efd: mov rax, qword ptr [rsi + rax]
0x388f01: test rax, rax
0x388f04: je 0x140388f0f
0x388f06: jmp 0x140388f12
0x388f08: mov rcx, qword ptr [rip + 0x6978889]
0x388f0f: mov rax, rcx
0x388f12: mov rbx, qword ptr [rsp + 0x78]
0x388f17: mov rbp, qword ptr [rsp + 0x80]
0x388f1f: add rsp, 0x50
0x388f23: pop r14
0x388f25: pop rdi
0x388f26: pop rsi
0x388f27: ret 