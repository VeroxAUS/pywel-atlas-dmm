0x28fb810: mov qword ptr [rsp + 0x18], rbx
0x28fb815: push rdi
0x28fb816: sub rsp, 0x40
0x28fb81a: mov rax, qword ptr [rcx + 0x68]
0x28fb81e: mov rbx, qword ptr [rax + 0x1a0]
0x28fb825: mov rdi, qword ptr [rbx + 8]
0x28fb829: lea rdx, [rdi + 8]
0x28fb82d: xor eax, eax
0x28fb82f: test rdi, rdi
0x28fb832: cmove rdx, rax
0x28fb836: mov rdx, qword ptr [rdx]
0x28fb839: lea rcx, [rsp + 0x58]
0x28fb83e: call 0x140393df0
0x28fb843: nop 
0x28fb844: movzx eax, byte ptr [rbx + 0x3dc]
0x28fb84b: mov byte ptr [rsp + 0x50], al
0x28fb84f: mov rcx, qword ptr [rsp + 0x58]
0x28fb854: mov rax, qword ptr [rcx]
0x28fb857: mov dl, 1
0x28fb859: call qword ptr [rax + 0x20]
0x28fb85c: lea rbx, [rip + 0x3229b95]
0x28fb863: mov qword ptr [rsp + 0x20], rbx
0x28fb868: mov byte ptr [rsp + 0x28], 1
0x28fb86d: lea rax, [rip + 0x3229ba4]
0x28fb874: mov qword ptr [rsp + 0x20], rax
0x28fb879: mov qword ptr [rsp + 0x30], rdi
0x28fb87e: lea r8, [rsp + 0x50]
0x28fb883: lea rdx, [rsp + 0x20]
0x28fb888: mov rcx, rdi
0x28fb88b: call 0x14299aa90
0x28fb890: nop 
0x28fb891: mov qword ptr [rsp + 0x20], rbx
0x28fb896: mov rbx, qword ptr [rsp + 0x60]
0x28fb89b: add rsp, 0x40
0x28fb89f: pop rdi
0x28fb8a0: ret 