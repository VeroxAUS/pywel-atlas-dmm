0x1052d2b0: mov qword ptr [rsp + 0x10], rdx
0x1052d2b5: push rbx
0x1052d2b6: sub rsp, 0x30
0x1052d2ba: mov rax, r8
0x1052d2bd: mov rbx, rdx
0x1052d2c0: xor edx, edx
0x1052d2c2: mov dword ptr [rsp + 0x20], edx
0x1052d2c6: test r8, r8
0x1052d2c9: jne 0x15052d2f0
0x1052d2cb: lea rax, [rip - 0xae0748a]
0x1052d2d2: mov qword ptr [rbx], rax
0x1052d2d5: mov qword ptr [rbx + 8], rdx
0x1052d2d9: mov word ptr [rbx + 0x10], dx
0x1052d2dd: mov qword ptr [rbx + 0x18], rdx
0x1052d2e1: lea rax, [rip - 0xafb9aa8]
0x1052d2e8: mov qword ptr [rbx], rax
0x1052d2eb: mov byte ptr [rbx + 0x11], dl
0x1052d2ee: jmp 0x15052d304
0x1052d2f0: mov r8, qword ptr [rcx + 0x50]
0x1052d2f4: add r8, 0x18
0x1052d2f8: mov rdx, rbx
0x1052d2fb: mov rcx, rax
0x1052d2fe: call 0x142a7d9f0
0x1052d303: nop 
0x1052d304: mov dword ptr [rsp + 0x20], 1
0x1052d30c: mov rax, rbx
0x1052d30f: add rsp, 0x30
0x1052d313: pop rbx
0x1052d314: ret 