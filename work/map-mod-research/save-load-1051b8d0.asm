0x1051b8d0: mov qword ptr [rsp + 0x10], rbx
0x1051b8d5: push rdi
0x1051b8d6: sub rsp, 0x20
0x1051b8da: mov rdi, rdx
0x1051b8dd: mov dword ptr [rdx], 0
0x1051b8e3: lea rdx, [rsp + 0x30]
0x1051b8e8: mov rbx, rcx
0x1051b8eb: call 0x1420683f0
0x1051b8f0: mov ecx, dword ptr [rax]
0x1051b8f2: test ecx, ecx
0x1051b8f4: jne 0x15051b902
0x1051b8f6: xor edx, edx
0x1051b8f8: mov rcx, rbx
0x1051b8fb: call 0x14206aec0
0x1051b900: xor ecx, ecx
0x1051b902: mov rax, qword ptr [rbx]
0x1051b905: mov dword ptr [rdi], ecx
0x1051b907: mov rcx, rbx
0x1051b90a: call qword ptr [rax + 0x120]
0x1051b910: mov rax, qword ptr [rbx]
0x1051b913: mov rcx, rbx
0x1051b916: call qword ptr [rax + 0x118]
0x1051b91c: mov rbx, qword ptr [rsp + 0x38]
0x1051b921: mov rax, rdi
0x1051b924: add rsp, 0x20
0x1051b928: pop rdi
0x1051b929: ret 