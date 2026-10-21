0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 