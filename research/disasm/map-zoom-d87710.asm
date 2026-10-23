0xd87710: push rbx
0xd87712: sub rsp, 0x20
0xd87716: mov eax, dword ptr [rdx]
0xd87718: mov rbx, rdx
0xd8771b: cmp eax, dword ptr [rip + 0x5f4899b]  ; [0x6cd00bc] = runtime global (no file value)
0xd87721: je 0x140d8773b
0xd87723: cmp eax, dword ptr [rip + 0x5f49a53]  ; [0x6cd117c] = runtime global (no file value)
0xd87729: je 0x140d8773b
0xd8772b: cmp eax, dword ptr [rip + 0x5f4a14b]  ; [0x6cd187c] = runtime global (no file value)
0xd87731: je 0x140d8773b
0xd87733: cmp eax, dword ptr [rip + 0x5f3beaf]  ; [0x6cc35e8] = runtime global (no file value)
0xd87739: jne 0x140d87743
0xd8773b: mov al, 1
0xd8773d: add rsp, 0x20
0xd87741: pop rbx
0xd87742: ret 
0xd87743: call 0x14063daa0
0xd87748: mov ecx, dword ptr [rax]
0xd8774a: cmp dword ptr [rbx], ecx
0xd8774c: sete al
0xd8774f: add rsp, 0x20
0xd87753: pop rbx
0xd87754: ret 
0xd87755: int3 