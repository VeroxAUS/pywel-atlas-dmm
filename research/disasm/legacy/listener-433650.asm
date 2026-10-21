0x433650: mov qword ptr [rsp + 0x10], rbx
0x433655: mov qword ptr [rsp + 0x18], rbp
0x43365a: push rsi
0x43365b: push rdi
0x43365c: push r14
0x43365e: sub rsp, 0x50
0x433662: movzx edi, word ptr [rcx]
0x433665: mov rbx, qword ptr [rip + 0x693642c]
0x43366c: cmp edi, dword ptr [rbx + 8]
0x43366f: jae 0x140433758
0x433675: lea rsi, [rdi*8]
0x43367d: mov rax, qword ptr [rbx + 0x58]
0x433681: mov rax, qword ptr [rsi + rax]
0x433685: test rax, rax
0x433688: jne 0x140433762
0x43368e: lea r14, [rbx + 0x90]
0x433695: cmp qword ptr [r14], rax
0x433698: jne 0x1404336bf
0x43369a: mov qword ptr [rsp + 0x20], r14
0x43369f: xor r9d, r9d
0x4336a2: lea r8, [rip + 0x558c397]
0x4336a9: mov rdx, qword ptr [rbx + 0x10]
0x4336ad: lea rcx, [rsp + 0x70]
0x4336b2: call 0x1425c5230
0x4336b7: mov eax, dword ptr [rsp + 0x70]
0x4336bb: test eax, eax
0x4336bd: jne 0x140433739
0x4336bf: call 0x141416af0
0x4336c4: add rax, 0x7d0
0x4336ca: mov qword ptr [rbx + 0x98], rax
0x4336d1: mov rcx, qword ptr [r14]
0x4336d4: mov rdx, qword ptr [rbx + 0x28]
0x4336d8: lea r14, [rip + 0x52ee5e1]
0x4336df: mov qword ptr [rsp + 0x30], r14
0x4336e4: mov byte ptr [rsp + 0x38], 0
0x4336e9: lea rbp, [rip + 0x52ee570]
0x4336f0: mov qword ptr [rsp + 0x30], rbp
0x4336f5: mov rax, qword ptr [rcx]
0x4336f8: mov qword ptr [rsp + 0x40], rax
0x4336fd: mov eax, dword ptr [rcx + 0xc]
0x433700: mov dword ptr [rsp + 0x48], eax
0x433704: mov dword ptr [rsp + 0x4c], 0
0x43370c: mov eax, dword ptr [rdx + rsi + 4]
0x433710: mov dword ptr [rsp + 0x4c], eax
0x433714: lea r9, [rsp + 0x30]
0x433719: movzx r8d, di
0x43371d: lea rdx, [rsp + 0x70]
0x433722: mov rcx, rbx
0x433725: call 0x140433b40
0x43372a: nop 
0x43372b: mov qword ptr [rsp + 0x30], rbp
0x433730: mov qword ptr [rsp + 0x30], r14
0x433735: mov eax, dword ptr [rsp + 0x70]
0x433739: mov rcx, qword ptr [rip + 0x68ca790]
0x433740: test eax, eax
0x433742: je 0x140433749
0x433744: mov rax, rcx
0x433747: jmp 0x140433751
0x433749: mov rax, qword ptr [rbx + 0x58]
0x43374d: mov rax, qword ptr [rsi + rax]
0x433751: test rax, rax
0x433754: je 0x14043375f
0x433756: jmp 0x140433762
0x433758: mov rcx, qword ptr [rip + 0x68ca771]
0x43375f: mov rax, rcx
0x433762: mov rbx, qword ptr [rsp + 0x78]
0x433767: mov rbp, qword ptr [rsp + 0x80]
0x43376f: add rsp, 0x50
0x433773: pop r14
0x433775: pop rdi
0x433776: pop rsi
0x433777: ret 