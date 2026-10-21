0x64f570: mov qword ptr [rsp + 8], rbx
0x64f575: mov qword ptr [rsp + 0x10], rdx
0x64f57a: push rdi
0x64f57b: sub rsp, 0x50
0x64f57f: mov rbx, rdx
0x64f582: xor edi, edi
0x64f584: mov dword ptr [rsp + 0x20], edi
0x64f588: test r8d, r8d
0x64f58b: jne 0x14064f5cd
0x64f58d: lea rdx, [rip + 0x50d68b4]
0x64f594: mov qword ptr [rbx], rdx
0x64f597: mov qword ptr [rbx + 8], rdi
0x64f59b: mov word ptr [rbx + 0x10], di
0x64f59f: mov qword ptr [rbx + 0x18], rdi
0x64f5a3: lea rax, [rip + 0x4f244de]
0x64f5aa: mov qword ptr [rbx], rax
0x64f5ad: lea rax, [rip + 0x4f24494]
0x64f5b4: mov qword ptr [rbx], rax
0x64f5b7: mov dword ptr [rsp + 0x20], 1
0x64f5bf: mov rax, rbx
0x64f5c2: mov rbx, qword ptr [rsp + 0x60]
0x64f5c7: add rsp, 0x50
0x64f5cb: pop rdi
0x64f5cc: ret 
0x64f5cd: lea rdx, [rsp + 0x28]
0x64f5d2: mov rcx, qword ptr [rip + 0x6719bb7]
0x64f5d9: mov rcx, qword ptr [rcx + 0x30]
0x64f5dd: call 0x1408adfe0
0x64f5e2: nop 
0x64f5e3: lea rdx, [rip + 0x50d685e]
0x64f5ea: mov qword ptr [rbx], rdx
0x64f5ed: mov rcx, qword ptr [rax + 8]
0x64f5f1: mov qword ptr [rbx + 8], rcx
0x64f5f5: movzx ecx, byte ptr [rax + 0x10]
0x64f5f9: mov byte ptr [rbx + 0x10], cl
0x64f5fc: movzx ecx, byte ptr [rax + 0x11]
0x64f600: mov byte ptr [rbx + 0x11], cl
0x64f603: mov rcx, qword ptr [rax + 0x18]
0x64f607: mov qword ptr [rbx + 0x18], rcx
0x64f60b: mov qword ptr [rax + 8], rdi
0x64f60f: mov byte ptr [rax + 0x10], 0
0x64f613: lea rax, [rip + 0x4f2446e]
0x64f61a: mov qword ptr [rbx], rax
0x64f61d: lea rax, [rip + 0x4f24424]
0x64f624: mov qword ptr [rbx], rax
0x64f627: mov dword ptr [rsp + 0x20], 1
0x64f62f: mov qword ptr [rsp + 0x28], rdx
0x64f634: lea rcx, [rsp + 0x28]
0x64f639: call 0x141434880
0x64f63e: mov rax, rbx
0x64f641: mov rbx, qword ptr [rsp + 0x60]
0x64f646: add rsp, 0x50
0x64f64a: pop rdi
0x64f64b: ret 
0x64f64c: int3 