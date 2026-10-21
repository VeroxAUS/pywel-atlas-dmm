0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 