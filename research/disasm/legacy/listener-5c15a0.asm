0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 