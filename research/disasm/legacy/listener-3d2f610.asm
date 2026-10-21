0x3d2f610: push rbx
0x3d2f612: push rsi
0x3d2f613: push rdi
0x3d2f614: sub rsp, 0x30
0x3d2f618: mov rdi, rdx
0x3d2f61b: mov rax, qword ptr [rdx]
0x3d2f61e: mov rdx, qword ptr [rax + 0xa0]
0x3d2f625: xor ebx, ebx
0x3d2f627: test rdx, rdx
0x3d2f62a: jne 0x143d2f630
0x3d2f62c: mov edx, ebx
0x3d2f62e: jmp 0x143d2f633
0x3d2f630: mov rdx, qword ptr [rdx]
0x3d2f633: xor r8d, r8d
0x3d2f636: mov rdx, qword ptr [rdx]
0x3d2f639: call 0x143d2cb50
0x3d2f63e: mov rsi, rax
0x3d2f641: mov rdx, qword ptr [rdi]
0x3d2f644: mov rcx, qword ptr [rdx + 0xa0]
0x3d2f64b: test rcx, rcx
0x3d2f64e: je 0x143d2f653
0x3d2f650: mov rbx, qword ptr [rcx]
0x3d2f653: mov eax, dword ptr [rbx + 8]
0x3d2f656: mov dword ptr [rsp + 0x60], eax
0x3d2f65a: mov eax, dword ptr [rbx + 0xc]
0x3d2f65d: mov dword ptr [rsp + 0x58], eax
0x3d2f661: mov rcx, rdx
0x3d2f664: call 0x143edee50
0x3d2f669: mov rcx, qword ptr [rdi]
0x3d2f66c: call 0x143ed59a0
0x3d2f671: mov rax, qword ptr [rdi]
0x3d2f674: and byte ptr [rax + 0x98], 0xfd
0x3d2f67b: mov r8b, 1
0x3d2f67e: mov rdx, qword ptr [rsi]
0x3d2f681: lea rcx, [rsp + 0x20]
0x3d2f686: call 0x140393650
0x3d2f68b: nop 
0x3d2f68c: xor r9d, r9d
0x3d2f68f: lea r8, [rsp + 0x58]
0x3d2f694: lea rdx, [rsp + 0x60]
0x3d2f699: mov rcx, rsi
0x3d2f69c: call 0x143d2c120
0x3d2f6a1: mov rdx, rdi
0x3d2f6a4: mov rcx, rax
0x3d2f6a7: call 0x1403d1120
0x3d2f6ac: nop 
0x3d2f6ad: mov rbx, qword ptr [rsp + 0x20]
0x3d2f6b2: mov rax, qword ptr [rbx]
0x3d2f6b5: xor edx, edx
0x3d2f6b7: mov rcx, rbx
0x3d2f6ba: call qword ptr [rax + 0x20]
0x3d2f6bd: cmp byte ptr [rsp + 0x28], 1
0x3d2f6c2: jne 0x143d2f6f2
0x3d2f6c4: mov eax, 0xffffffff
0x3d2f6c9: lock xadd dword ptr [rbx + 8], eax
0x3d2f6ce: cmp eax, 1
0x3d2f6d1: jne 0x143d2f6e5
0x3d2f6d3: test dword ptr [rbx + 0xc], 0x40000000
0x3d2f6da: je 0x143d2f6f2
0x3d2f6dc: mov rax, qword ptr [rbx]
0x3d2f6df: mov rcx, rbx
0x3d2f6e2: call qword ptr [rax + 0x40]
0x3d2f6e5: test dword ptr [rbx + 0xc], 0x40000000
0x3d2f6ec: je 0x143d2f6f2
0x3d2f6ee: lock dec dword ptr [rbx + 0xc]
0x3d2f6f2: add rsp, 0x30
0x3d2f6f6: pop rdi
0x3d2f6f7: pop rsi
0x3d2f6f8: pop rbx
0x3d2f6f9: ret 