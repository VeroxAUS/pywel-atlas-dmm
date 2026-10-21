0x9fe840: mov qword ptr [rsp + 0x10], rbx
0x9fe845: mov qword ptr [rsp + 0x18], rbp
0x9fe84a: push rsi
0x9fe84b: push rdi
0x9fe84c: push r14
0x9fe84e: sub rsp, 0x50
0x9fe852: movzx esi, r9b
0x9fe856: mov r14, r8
0x9fe859: mov rdi, rdx
0x9fe85c: mov rbp, rcx
0x9fe85f: mov rax, qword ptr [rcx + 8]
0x9fe863: lea rdx, [rax + 8]
0x9fe867: xor ecx, ecx
0x9fe869: test rax, rax
0x9fe86c: cmove rdx, rcx
0x9fe870: mov r8b, 1
0x9fe873: mov rdx, qword ptr [rdx]
0x9fe876: lea rcx, [rsp + 0x40]
0x9fe87b: call 0x140393650
0x9fe880: nop 
0x9fe881: mov byte ptr [rsp + 0x30], 0
0x9fe886: movzx ebx, byte ptr [rsp + 0x98]
0x9fe88e: mov byte ptr [rsp + 0x28], bl
0x9fe892: lea rax, [rip + 0x4b475ef]
0x9fe899: mov qword ptr [rsp + 0x20], rax
0x9fe89e: xor r9d, r9d
0x9fe8a1: movzx r8d, sil
0x9fe8a5: mov rdx, rdi
0x9fe8a8: mov rcx, rbp
0x9fe8ab: call 0x1409fca60
0x9fe8b0: movzx r9d, bl
0x9fe8b4: movzx r8d, byte ptr [rsp + 0x90]
0x9fe8bd: mov rdx, r14
0x9fe8c0: mov rcx, rbp
0x9fe8c3: call 0x1409fce60
0x9fe8c8: nop 
0x9fe8c9: mov rbx, qword ptr [rsp + 0x40]
0x9fe8ce: mov rax, qword ptr [rbx]
0x9fe8d1: xor edx, edx
0x9fe8d3: mov rcx, rbx
0x9fe8d6: call qword ptr [rax + 0x20]
0x9fe8d9: cmp byte ptr [rsp + 0x48], 1
0x9fe8de: jne 0x1409fe90e
0x9fe8e0: mov eax, 0xffffffff
0x9fe8e5: lock xadd dword ptr [rbx + 8], eax
0x9fe8ea: cmp eax, 1
0x9fe8ed: jne 0x1409fe901
0x9fe8ef: test dword ptr [rbx + 0xc], 0x40000000
0x9fe8f6: je 0x1409fe90e
0x9fe8f8: mov rax, qword ptr [rbx]
0x9fe8fb: mov rcx, rbx
0x9fe8fe: call qword ptr [rax + 0x40]
0x9fe901: test dword ptr [rbx + 0xc], 0x40000000
0x9fe908: je 0x1409fe90e
0x9fe90a: lock dec dword ptr [rbx + 0xc]
0x9fe90e: mov rbx, qword ptr [rsp + 0x78]
0x9fe913: mov rbp, qword ptr [rsp + 0x80]
0x9fe91b: add rsp, 0x50
0x9fe91f: pop r14
0x9fe921: pop rdi
0x9fe922: pop rsi
0x9fe923: ret 