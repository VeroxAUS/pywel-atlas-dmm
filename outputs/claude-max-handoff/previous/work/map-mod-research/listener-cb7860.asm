0xcb7860: mov qword ptr [rsp + 8], rbx
0xcb7865: mov qword ptr [rsp + 0x10], rbp
0xcb786a: mov qword ptr [rsp + 0x18], rsi
0xcb786f: push rdi
0xcb7870: push r14
0xcb7872: push r15
0xcb7874: sub rsp, 0xa0
0xcb787b: mov rdi, r8
0xcb787e: mov rsi, rdx
0xcb7881: mov rbx, rcx
0xcb7884: xor r15d, r15d
0xcb7887: mov dword ptr [r8 + 8], r15d
0xcb788b: mov r8, qword ptr [rsp + 0xe0]
0xcb7893: mov rdx, r9
0xcb7896: mov rcx, qword ptr [rcx + 8]
0xcb789a: call 0x143eda3d0
0xcb789f: mov rbp, rax
0xcb78a2: lea rax, [rsp + 0x50]
0xcb78a7: mov qword ptr [rsp + 0x40], rax
0xcb78ac: mov dword ptr [rsp + 0x48], r15d
0xcb78b1: mov dword ptr [rsp + 0x4c], 0xa
0xcb78b9: mov rax, qword ptr [rbx + 8]
0xcb78bd: mov qword ptr [rsp + 0x20], rax
0xcb78c2: mov qword ptr [rsp + 0x28], r15
0xcb78c7: test rbp, rbp
0xcb78ca: je 0x140cb790b
0xcb78cc: cmp byte ptr [rbp], r15b
0xcb78d0: je 0x140cb790b
0xcb78d2: mov rbx, 0xffffffffffffffff
0xcb78d9: nop dword ptr [rax]
0xcb78e0: inc rbx
0xcb78e3: cmp byte ptr [rbx + rbp], 0
0xcb78e7: jne 0x140cb78e0
0xcb78e9: mov ecx, ebx
0xcb78eb: call 0x1414203f0
0xcb78f0: mov r14, rax
0xcb78f3: lea edx, [rbx + 1]
0xcb78f6: mov r9, 0xffffffffffffffff
0xcb78fd: mov r8, rbp
0xcb7900: mov rcx, qword ptr [rax]
0xcb7903: call qword ptr [rip + 0x4534ba7]
0xcb7909: jmp 0x140cb7912
0xcb790b: lea r14, [rip + 0x5dae02e]
0xcb7912: mov qword ptr [rsp + 0x28], r14
0xcb7917: mov qword ptr [rsp + 0x30], r15
0xcb791c: mov word ptr [rsp + 0x38], 0x100
0xcb7923: mov byte ptr [rsp + 0x38], 1
0xcb7928: lea rdx, [rsp + 0x40]
0xcb792d: lea rcx, [rsp + 0x20]
0xcb7932: call 0x143d1dab0
0xcb7937: nop 
0xcb7938: lea rcx, [rsp + 0x28]
0xcb793d: call 0x140394db0
0xcb7942: mov edx, dword ptr [rsp + 0x48]
0xcb7946: test edx, edx
0xcb7948: jne 0x140cb7995
0xcb794a: mov eax, dword ptr [rip + 0x60241e0]
0xcb7950: mov dword ptr [rsi], eax
0xcb7952: lea rax, [rsp + 0x50]
0xcb7957: mov rcx, qword ptr [rsp + 0x40]
0xcb795c: cmp rcx, rax
0xcb795f: je 0x140cb7a4c
0xcb7965: test rcx, rcx
0xcb7968: je 0x140cb7a4c
0xcb796e: mov r8d, 0x1fd
0xcb7974: mov rax, qword ptr gs:[0x58]
0xcb797d: mov rdx, qword ptr [rax]
0xcb7980: cmp byte ptr [r8 + rdx], 0
0xcb7985: je 0x140cb7a47
0xcb798b: call 0x1447f03bc
0xcb7990: jmp 0x140cb7a4c
0xcb7995: mov rcx, rdi
0xcb7998: call 0x14035e3f0
0xcb799d: mov r14d, dword ptr [rsp + 0x48]
0xcb79a2: mov rbx, qword ptr [rsp + 0x40]
0xcb79a7: test r14d, r14d
0xcb79aa: je 0x140cb7a13
0xcb79ac: mov edx, dword ptr [rdi + 8]
0xcb79af: add edx, r14d
0xcb79b2: mov rcx, rdi
0xcb79b5: call 0x14035e3f0
0xcb79ba: test r14d, r14d
0xcb79bd: je 0x140cb7a13
0xcb79bf: mov ebp, r14d
0xcb79c2: mov r14d, 1
0xcb79c8: nop dword ptr [rax + rax]
0xcb79d0: mov ecx, dword ptr [rdi + 8]
0xcb79d3: mov eax, dword ptr [rdi + 0xc]
0xcb79d6: cmp eax, ecx
0xcb79d8: ja 0x140cb79f9
0xcb79da: lea edx, [rax*2 + 1]
0xcb79e1: add edx, eax
0xcb79e3: shr edx, 1
0xcb79e5: cmp edx, r14d
0xcb79e8: cmovb edx, r14d
0xcb79ec: cmp ecx, edx
0xcb79ee: cmova edx, ecx
0xcb79f1: mov rcx, rdi
0xcb79f4: call 0x14035e3f0
0xcb79f9: mov edx, dword ptr [rdi + 8]
0xcb79fc: mov rcx, qword ptr [rdi]
0xcb79ff: mov rax, qword ptr [rbx]
0xcb7a02: mov qword ptr [rcx + rdx*8], rax
0xcb7a06: inc dword ptr [rdi + 8]
0xcb7a09: add rbx, 8
0xcb7a0d: sub rbp, 1
0xcb7a11: jne 0x140cb79d0
0xcb7a13: mov dword ptr [rsi], r15d
0xcb7a16: lea rax, [rsp + 0x50]
0xcb7a1b: mov rcx, qword ptr [rsp + 0x40]
0xcb7a20: cmp rcx, rax
0xcb7a23: je 0x140cb7a4c
0xcb7a25: test rcx, rcx
0xcb7a28: je 0x140cb7a4c
0xcb7a2a: mov r8d, 0x1fd
0xcb7a30: mov rax, qword ptr gs:[0x58]
0xcb7a39: mov rdx, qword ptr [rax]
0xcb7a3c: cmp byte ptr [r8 + rdx], 0
0xcb7a41: jne 0x140cb798b
0xcb7a47: call 0x1447f02bc
0xcb7a4c: mov rax, rsi
0xcb7a4f: lea r11, [rsp + 0xa0]
0xcb7a57: mov rbx, qword ptr [r11 + 0x20]
0xcb7a5b: mov rbp, qword ptr [r11 + 0x28]
0xcb7a5f: mov rsi, qword ptr [r11 + 0x30]
0xcb7a63: mov rsp, r11
0xcb7a66: pop r15
0xcb7a68: pop r14
0xcb7a6a: pop rdi
0xcb7a6b: ret 