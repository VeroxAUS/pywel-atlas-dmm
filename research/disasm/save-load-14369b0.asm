0x14369b0: mov qword ptr [rsp + 0x10], rbx
0x14369b5: push rdi
0x14369b6: sub rsp, 0x20
0x14369ba: mov rdi, rcx
0x14369bd: mov rax, qword ptr [rcx]
0x14369c0: call qword ptr [rax + 0xa0]
0x14369c6: lea rbx, [rdi + 0x18]
0x14369ca: mov qword ptr [rsp + 0x30], rbx
0x14369cf: mov rax, qword ptr [rbx]
0x14369d2: mov rcx, rbx
0x14369d5: call qword ptr [rax + 8]
0x14369d8: nop 
0x14369d9: mov rax, qword ptr [rdi]
0x14369dc: mov rcx, rdi
0x14369df: call qword ptr [rax + 0x88]
0x14369e5: nop 
0x14369e6: mov rax, qword ptr [rbx]
0x14369e9: mov rcx, rbx
0x14369ec: mov rbx, qword ptr [rsp + 0x38]
0x14369f1: add rsp, 0x20
0x14369f5: pop rdi
0x14369f6: jmp qword ptr [rax + 0x10]