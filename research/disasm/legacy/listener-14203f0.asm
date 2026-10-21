0x14203f0: mov qword ptr [rsp + 8], rbx
0x14203f5: push rdi
0x14203f6: sub rsp, 0x20
0x14203fa: mov rax, qword ptr gs:[0x58]
0x1420403: mov edi, ecx
0x1420405: mov r8d, 0x1fd
0x142040b: add ecx, 0x19
0x142040e: mov rdx, qword ptr [rax]
0x1420411: cmp byte ptr [r8 + rdx], 0
0x1420416: mov edx, 0x10
0x142041b: je 0x141420424
0x142041d: call 0x1447efa78
0x1420422: jmp 0x141420429
0x1420424: call 0x1447ef9b0
0x1420429: mov rbx, rax
0x142042c: test rax, rax
0x142042f: jne 0x14142044c
0x1420431: call 0x141318e70
0x1420436: xor r9d, r9d
0x1420439: xor r8d, r8d
0x142043c: mov edx, 1
0x1420441: mov ecx, 0xa0000002
0x1420446: call qword ptr [rip + 0x3dcacfc]
0x142044c: mov rax, qword ptr [rip + 0x56454ed]
0x1420453: mov qword ptr [rbx], rax
0x1420456: lea rax, [rbx + 0x18]
0x142045a: mov qword ptr [rbx + 8], 0xffffffffffffffff
0x1420462: mov qword ptr [rbx], rax
0x1420465: mov rax, rbx
0x1420468: mov dword ptr [rbx + 0x10], 1
0x142046f: mov byte ptr [rbx + 0x14], 0
0x1420473: mov dword ptr [rbx + 8], edi
0x1420476: mov rbx, qword ptr [rsp + 0x30]
0x142047b: add rsp, 0x20
0x142047f: pop rdi
0x1420480: ret 