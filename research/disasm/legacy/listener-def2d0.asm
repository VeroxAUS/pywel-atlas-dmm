0xdef2d0: mov qword ptr [rsp + 8], rbx
0xdef2d5: push rdi
0xdef2d6: sub rsp, 0x20
0xdef2da: cmp dword ptr [rcx + 0x15c], 0
0xdef2e1: mov rdi, r8
0xdef2e4: mov r10, rcx
0xdef2e7: je 0x140def337
0xdef2e9: mov ecx, dword ptr [rcx + 0x158]
0xdef2ef: test ecx, ecx
0xdef2f1: je 0x140def337
0xdef2f3: mov r9d, dword ptr [rdx]
0xdef2f6: xor edx, edx
0xdef2f8: mov eax, r9d
0xdef2fb: div ecx
0xdef2fd: xor eax, eax
0xdef2ff: mov r11d, edx
0xdef302: shl r11, 8
0xdef306: add r11, qword ptr [r10 + 0x168]
0xdef30d: mov ebx, dword ptr [r11]
0xdef310: test ebx, ebx
0xdef312: je 0x140def337
0xdef314: cmp dword ptr [r11 + rax*8 + 8], r9d
0xdef319: jne 0x140def331
0xdef31b: mov edx, dword ptr [r11 + rax*8 + 0xc]
0xdef320: mov rcx, qword ptr [r10 + 0x170]
0xdef327: mov r8, qword ptr [rcx + rdx*8]
0xdef32b: cmp dword ptr [r8 + 4], r9d
0xdef32f: je 0x140def344
0xdef331: inc eax
0xdef333: cmp eax, ebx
0xdef335: jb 0x140def314
0xdef337: xor al, al
0xdef339: mov rbx, qword ptr [rsp + 0x30]
0xdef33e: add rsp, 0x20
0xdef342: pop rdi
0xdef343: ret 
0xdef344: lea rcx, [r8 + 8]
0xdef348: test rcx, rcx
0xdef34b: je 0x140def337
0xdef34d: mov rdx, rdi
0xdef350: call 0x140de4500
0xdef355: mov rbx, qword ptr [rsp + 0x30]
0xdef35a: test rax, rax
0xdef35d: setne al
0xdef360: add rsp, 0x20
0xdef364: pop rdi
0xdef365: ret 