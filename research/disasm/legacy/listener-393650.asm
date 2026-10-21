0x393650: mov qword ptr [rsp + 8], rbx
0x393655: push rdi
0x393656: sub rsp, 0x20
0x39365a: mov qword ptr [rcx], rdx
0x39365d: mov rbx, rdx
0x393660: mov byte ptr [rcx + 8], r8b
0x393664: mov rdi, rcx
0x393667: cmp r8b, 1
0x39366b: jne 0x14039369f
0x39366d: mov ecx, 1
0x393672: lock xadd dword ptr [rdx + 8], ecx
0x393677: mov eax, dword ptr [rdx + 0xc]
0x39367a: inc ecx
0x39367c: shr eax, 0x1f
0x39367f: test al, al
0x393681: jne 0x140393692
0x393683: mov rax, qword ptr [rbx]
0x393686: cmp ecx, 1
0x393689: mov rcx, rbx
0x39368c: sete dl
0x39368f: call qword ptr [rax + 0x30]
0x393692: test dword ptr [rbx + 0xc], 0x40000000
0x393699: je 0x14039369f
0x39369b: lock inc dword ptr [rbx + 0xc]
0x39369f: mov rax, qword ptr [rbx]
0x3936a2: xor edx, edx
0x3936a4: mov rcx, rbx
0x3936a7: call qword ptr [rax + 0x18]
0x3936aa: mov rbx, qword ptr [rsp + 0x30]
0x3936af: mov rax, rdi
0x3936b2: add rsp, 0x20
0x3936b6: pop rdi
0x3936b7: ret 