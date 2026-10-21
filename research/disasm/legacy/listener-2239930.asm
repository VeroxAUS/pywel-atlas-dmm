0x2239930: mov qword ptr [rsp + 8], rcx
0x2239935: lea rax, [rip + 0x333ab4c]
0x223993c: mov qword ptr [rcx], rax
0x223993f: mov byte ptr [rcx + 8], dl
0x2239942: lea rax, [rcx + 0x10]
0x2239946: mov qword ptr [rsp + 0x18], rax
0x223994b: xor r9d, r9d
0x223994e: mov qword ptr [rax + 0x808], r9
0x2239955: mov qword ptr [rax + 0x810], 0x801
0x2239960: mov byte ptr [rax], r9b
0x2239963: mov rdx, qword ptr [rax + 0x808]
0x223996a: test rdx, rdx
0x223996d: je 0x142239972
0x223996f: mov byte ptr [rdx], r9b
0x2239972: mov dword ptr [rax + 0x814], r9d
0x2239979: mov byte ptr [rax], 0
0x223997c: mov rdx, qword ptr [rax + 0x808]
0x2239983: test rdx, rdx
0x2239986: je 0x14223998b
0x2239988: mov byte ptr [rdx], 0
0x223998b: mov qword ptr [rcx + 0x828], r8
0x2239992: mov rax, rcx
0x2239995: ret 