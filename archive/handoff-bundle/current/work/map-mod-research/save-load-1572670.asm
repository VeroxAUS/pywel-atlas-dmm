0x1572670: mov qword ptr [rsp + 0x10], rbx
0x1572675: push rdi
0x1572676: sub rsp, 0x30
0x157267a: movzx ebx, dl
0x157267d: mov rdi, rcx
0x1572680: mov rax, qword ptr [rcx + 8]
0x1572684: lea rdx, [rax + 8]
0x1572688: xor ecx, ecx
0x157268a: test rax, rax
0x157268d: cmove rdx, rcx
0x1572691: mov r8b, 1
0x1572694: mov rdx, qword ptr [rdx]
0x1572697: lea rcx, [rsp + 0x20]
0x157269c: call 0x140393650
0x15726a1: nop 
0x15726a2: mov byte ptr [rdi + 0x18], 1
0x15726a6: mov rax, qword ptr [rdi]
0x15726a9: movzx edx, bl
0x15726ac: mov rcx, rdi
0x15726af: call qword ptr [rax + 0x1a8]
0x15726b5: nop 
0x15726b6: mov rbx, qword ptr [rsp + 0x20]
0x15726bb: mov rax, qword ptr [rbx]
0x15726be: xor edx, edx
0x15726c0: mov rcx, rbx
0x15726c3: call qword ptr [rax + 0x20]
0x15726c6: cmp byte ptr [rsp + 0x28], 1
0x15726cb: jne 0x1415726fb
0x15726cd: mov eax, 0xffffffff
0x15726d2: lock xadd dword ptr [rbx + 8], eax
0x15726d7: cmp eax, 1
0x15726da: jne 0x1415726ee
0x15726dc: test dword ptr [rbx + 0xc], 0x40000000
0x15726e3: je 0x1415726fb
0x15726e5: mov rax, qword ptr [rbx]
0x15726e8: mov rcx, rbx
0x15726eb: call qword ptr [rax + 0x40]
0x15726ee: test dword ptr [rbx + 0xc], 0x40000000
0x15726f5: je 0x1415726fb
0x15726f7: lock dec dword ptr [rbx + 0xc]
0x15726fb: mov rbx, qword ptr [rsp + 0x48]
0x1572700: add rsp, 0x30
0x1572704: pop rdi
0x1572705: ret 