0x670050: mov qword ptr [rsp + 0x10], rbx
0x670055: mov qword ptr [rsp + 0x18], rbp
0x67005a: push rsi
0x67005b: push rdi
0x67005c: push r14
0x67005e: sub rsp, 0x50
0x670062: movzx edi, word ptr [rcx]
0x670065: mov rbx, qword ptr [rip + 0x6701ddc]
0x67006c: cmp edi, dword ptr [rbx + 8]
0x67006f: jae 0x140670158
0x670075: lea rsi, [rdi*8]
0x67007d: mov rax, qword ptr [rbx + 0x58]
0x670081: mov rax, qword ptr [rsi + rax]
0x670085: test rax, rax
0x670088: jne 0x140670162
0x67008e: lea r14, [rbx + 0x90]
0x670095: cmp qword ptr [r14], rax
0x670098: jne 0x1406700bf
0x67009a: mov qword ptr [rsp + 0x20], r14
0x67009f: xor r9d, r9d
0x6700a2: lea r8, [rip + 0x53506bf]
0x6700a9: mov rdx, qword ptr [rbx + 0x10]
0x6700ad: lea rcx, [rsp + 0x70]
0x6700b2: call 0x1425c5230
0x6700b7: mov eax, dword ptr [rsp + 0x70]
0x6700bb: test eax, eax
0x6700bd: jne 0x140670139
0x6700bf: call 0x141416af0
0x6700c4: add rax, 0x7d0
0x6700ca: mov qword ptr [rbx + 0x98], rax
0x6700d1: mov rcx, qword ptr [r14]
0x6700d4: mov rdx, qword ptr [rbx + 0x28]
0x6700d8: lea r14, [rip + 0x50b1be1]
0x6700df: mov qword ptr [rsp + 0x30], r14
0x6700e4: mov byte ptr [rsp + 0x38], 0
0x6700e9: lea rbp, [rip + 0x50b1b70]
0x6700f0: mov qword ptr [rsp + 0x30], rbp
0x6700f5: mov rax, qword ptr [rcx]
0x6700f8: mov qword ptr [rsp + 0x40], rax
0x6700fd: mov eax, dword ptr [rcx + 0xc]
0x670100: mov dword ptr [rsp + 0x48], eax
0x670104: mov dword ptr [rsp + 0x4c], 0
0x67010c: mov eax, dword ptr [rdx + rsi + 4]
0x670110: mov dword ptr [rsp + 0x4c], eax
0x670114: lea r9, [rsp + 0x30]
0x670119: movzx r8d, di
0x67011d: lea rdx, [rsp + 0x70]
0x670122: mov rcx, rbx
0x670125: call 0x1406710b0
0x67012a: nop 
0x67012b: mov qword ptr [rsp + 0x30], rbp
0x670130: mov qword ptr [rsp + 0x30], r14
0x670135: mov eax, dword ptr [rsp + 0x70]
0x670139: mov rcx, qword ptr [rip + 0x668e460]
0x670140: test eax, eax
0x670142: je 0x140670149
0x670144: mov rax, rcx
0x670147: jmp 0x140670151
0x670149: mov rax, qword ptr [rbx + 0x58]
0x67014d: mov rax, qword ptr [rsi + rax]
0x670151: test rax, rax
0x670154: je 0x14067015f
0x670156: jmp 0x140670162
0x670158: mov rcx, qword ptr [rip + 0x668e441]
0x67015f: mov rax, rcx
0x670162: mov rbx, qword ptr [rsp + 0x78]
0x670167: mov rbp, qword ptr [rsp + 0x80]
0x67016f: add rsp, 0x50
0x670173: pop r14
0x670175: pop rdi
0x670176: pop rsi
0x670177: ret 