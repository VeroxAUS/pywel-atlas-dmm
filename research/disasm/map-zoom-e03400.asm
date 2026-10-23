0xe03400: push rbx
0xe03402: sub rsp, 0x20
0xe03406: mov eax, dword ptr [rdx]
0xe03408: mov rbx, rdx
0xe0340b: cmp eax, dword ptr [rip + 0x5ecde7b]  ; [0x6cd128c] = runtime global (no file value)
0xe03411: je 0x140e0342b
0xe03413: cmp eax, dword ptr [rip + 0x5ecdd63]  ; [0x6cd117c] = runtime global (no file value)
0xe03419: je 0x140e0342b
0xe0341b: cmp eax, dword ptr [rip + 0x5ece45b]  ; [0x6cd187c] = runtime global (no file value)
0xe03421: je 0x140e0342b
0xe03423: cmp eax, dword ptr [rip + 0x5ec01bf]  ; [0x6cc35e8] = runtime global (no file value)
0xe03429: jne 0x140e03433
0xe0342b: mov al, 1
0xe0342d: add rsp, 0x20
0xe03431: pop rbx
0xe03432: ret 
0xe03433: call 0x14063daa0
0xe03438: mov ecx, dword ptr [rax]
0xe0343a: cmp dword ptr [rbx], ecx
0xe0343c: sete al
0xe0343f: add rsp, 0x20
0xe03443: pop rbx
0xe03444: ret 
0xe03445: int3 