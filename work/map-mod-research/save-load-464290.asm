0x464290: mov qword ptr [rsp + 8], rbx
0x464295: cmp dword ptr [rcx + 0x8c], 0
0x46429c: mov r8d, edx
0x46429f: mov r10, rcx
0x4642a2: je 0x1404642f3
0x4642a4: mov ecx, dword ptr [rcx + 0x88]
0x4642aa: test ecx, ecx
0x4642ac: je 0x1404642f3
0x4642ae: xor edx, edx
0x4642b0: mov eax, r8d
0x4642b3: div ecx
0x4642b5: mov r11d, edx
0x4642b8: xor edx, edx
0x4642ba: shl r11, 8
0x4642be: add r11, qword ptr [r10 + 0x98]
0x4642c5: mov ebx, dword ptr [r11]
0x4642c8: test ebx, ebx
0x4642ca: je 0x1404642f3
0x4642cc: nop dword ptr [rax]
0x4642d0: cmp dword ptr [r11 + rdx*8 + 8], r8d
0x4642d5: jne 0x1404642ed
0x4642d7: mov ecx, dword ptr [r11 + rdx*8 + 0xc]
0x4642dc: mov rax, qword ptr [r10 + 0xa0]
0x4642e3: mov r9, qword ptr [rax + rcx*8]
0x4642e7: cmp dword ptr [r9 + 4], r8d
0x4642eb: je 0x1404642fb
0x4642ed: inc edx
0x4642ef: cmp edx, ebx
0x4642f1: jb 0x1404642d0
0x4642f3: xor eax, eax
0x4642f5: mov rbx, qword ptr [rsp + 8]
0x4642fa: ret 
0x4642fb: lea rax, [r9 + 8]
0x4642ff: test rax, rax
0x464302: je 0x1404642f3
0x464304: mov rax, qword ptr [rax]
0x464307: mov rbx, qword ptr [rsp + 8]
0x46430c: ret 