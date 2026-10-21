0x3d2f5b0: mov qword ptr [rsp + 8], rbx
0x3d2f5b5: mov qword ptr [rsp + 0x10], rdx
0x3d2f5ba: push rdi
0x3d2f5bb: sub rsp, 0x30
0x3d2f5bf: mov rdi, r9
0x3d2f5c2: mov rax, r8
0x3d2f5c5: mov rbx, rdx
0x3d2f5c8: mov dword ptr [rsp + 0x20], 0
0x3d2f5d0: mov r8b, 1
0x3d2f5d3: mov rdx, rax
0x3d2f5d6: call 0x143d2cb50
0x3d2f5db: test rax, rax
0x3d2f5de: jne 0x143d2f5e5
0x3d2f5e0: mov qword ptr [rbx], rax
0x3d2f5e3: jmp 0x143d2f5f9
0x3d2f5e5: mov r9, qword ptr [rsp + 0x60]
0x3d2f5ea: mov r8, rdi
0x3d2f5ed: mov rdx, rbx
0x3d2f5f0: mov rcx, rax
0x3d2f5f3: call 0x143d2b780
0x3d2f5f8: nop 
0x3d2f5f9: mov dword ptr [rsp + 0x20], 1
0x3d2f601: mov rax, rbx
0x3d2f604: mov rbx, qword ptr [rsp + 0x40]
0x3d2f609: add rsp, 0x30
0x3d2f60d: pop rdi
0x3d2f60e: ret 
0x3d2f60f: int3 