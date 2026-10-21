0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 