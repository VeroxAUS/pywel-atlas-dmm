0xe0f6fc0: mov qword ptr [rsp + 0x18], rsi
0xe0f6fc5: push rdi
0xe0f6fc6: sub rsp, 0x70
0xe0f6fca: mov rsi, rdx
0xe0f6fcd: mov rdi, rcx
0xe0f6fd0: lea rdx, [rcx + 0x90]
0xe0f6fd7: mov r8d, 4
0xe0f6fdd: mov rcx, rsi
0xe0f6fe0: mov rax, qword ptr [rsi]
0xe0f6fe3: call qword ptr [rax + 8]
0xe0f6fe6: test al, al
0xe0f6fe8: jne 0x14e0f6ff8
0xe0f6fea: mov rsi, qword ptr [rsp + 0x90]
0xe0f6ff2: add rsp, 0x70
0xe0f6ff6: pop rdi
0xe0f6ff7: ret 