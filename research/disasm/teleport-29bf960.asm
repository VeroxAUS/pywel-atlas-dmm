0x29bf960: mov qword ptr [rsp + 8], rbx
0x29bf965: push rbp
0x29bf966: push rsi
0x29bf967: push rdi
0x29bf968: push r14
0x29bf96a: push r15
0x29bf96c: lea rbp, [rsp - 0x37]
0x29bf971: sub rsp, 0xe0
0x29bf978: mov rbx, rdx
0x29bf97b: mov rdi, rcx
0x29bf97e: mov rsi, qword ptr [r8 + 0x18]
0x29bf982: movzx ecx, word ptr [rsi + 3]
0x29bf986: movzx eax, word ptr [r8 + 0x10]
0x29bf98b: sub rax, 5
0x29bf98f: cmp rax, rcx
0x29bf992: jne 0x1429bfaad
0x29bf998: cmp byte ptr [r8 + 0x38], 0
0x29bf99d: jne 0x1429bf9ad
0x29bf99f: mov eax, 0x7fc1
0x29bf9a4: cmp ax, cx
0x29bf9a7: jb 0x1429bfaad
0x29bf9ad: cmp byte ptr [rdi + 0x21], 0
0x29bf9b1: je 0x1429bf9bc
0x29bf9b3: xor edi, edi
0x29bf9b5: mov dword ptr [rdx], edi
0x29bf9b7: jmp 0x1429bfb5d
0x29bf9bc: vxorps xmm0, xmm0, xmm0
0x29bf9c0: vmovss dword ptr [rbp + 7], xmm0
0x29bf9c5: vmovss dword ptr [rbp + 0xb], xmm0
0x29bf9ca: vmovss dword ptr [rbp + 0xf], xmm0
0x29bf9cf: movzx ecx, word ptr [rsi + 3]
0x29bf9d3: lea r14, [rip + 0x2d622e6]
0x29bf9da: mov qword ptr [rbp + 0x17], r14
0x29bf9de: mov byte ptr [rbp + 0x1f], 0
0x29bf9e2: lea r15, [rip + 0x2d62277]
0x29bf9e9: mov qword ptr [rbp + 0x17], r15
0x29bf9ed: lea rax, [rsi + 5]
0x29bf9f1: mov qword ptr [rbp + 0x27], rax
0x29bf9f5: mov dword ptr [rbp + 0x2f], ecx
0x29bf9f8: xor edi, edi
0x29bf9fa: mov dword ptr [rbp + 0x33], edi
0x29bf9fd: mov rax, qword ptr [rbp + 0x17]
0x29bfa01: mov r9, qword ptr [rax + 8]
0x29bfa05: lea rax, [rip - 0x15a079c]
0x29bfa0c: mov r8d, 0xc
0x29bfa12: lea rdx, [rbp + 7]
0x29bfa16: lea rcx, [rbp + 0x17]
0x29bfa1a: cmp r9, rax
0x29bfa1d: jne 0x1429bfa26
0x29bfa1f: call 0x14141f270
0x29bfa24: jmp 0x1429bfa29
0x29bfa26: call r9
0x29bfa29: test al, al
0x29bfa2b: jne 0x1429bfa42
0x29bfa2d: mov eax, dword ptr [rip + 0x431bf3d]
0x29bfa33: mov dword ptr [rbx], eax
0x29bfa35: mov qword ptr [rbp + 0x17], r15
0x29bfa39: mov qword ptr [rbp + 0x17], r14
0x29bfa3d: jmp 0x1429bfb5d
0x29bfa42: mov rax, qword ptr [rbp + 0x17]
0x29bfa46: mov r9, qword ptr [rax + 8]
0x29bfa4a: lea rax, [rip - 0x2665eb1]
0x29bfa51: cmp r9, rax
0x29bfa54: je 0x1429bfa98
0x29bfa56: mov r8d, 4
0x29bfa5c: lea rdx, [rbp + 0x77]
0x29bfa60: lea rcx, [rbp + 0x17]
0x29bfa64: call r9
0x29bfa67: test al, al
0x29bfa69: je 0x1429bfa98
0x29bfa6b: movzx eax, word ptr [rsi + 3]
0x29bfa6f: cmp dword ptr [rbp + 0x33], eax
0x29bfa72: je 0x1429bfa89
0x29bfa74: mov eax, dword ptr [rip + 0x431bef6]
0x29bfa7a: mov dword ptr [rbx], eax
0x29bfa7c: mov qword ptr [rbp + 0x17], r15
0x29bfa80: mov qword ptr [rbp + 0x17], r14
0x29bfa84: jmp 0x1429bfb5d
0x29bfa89: mov dword ptr [rbx], edi
0x29bfa8b: mov qword ptr [rbp + 0x17], r15
0x29bfa8f: mov qword ptr [rbp + 0x17], r14
0x29bfa93: jmp 0x1429bfb5d
0x29bfa98: mov eax, dword ptr [rip + 0x431bed2]
0x29bfa9e: mov dword ptr [rbx], eax
0x29bfaa0: mov qword ptr [rbp + 0x17], r15
0x29bfaa4: mov qword ptr [rbp + 0x17], r14
0x29bfaa8: jmp 0x1429bfb5d
0x29bfaad: mov rsi, qword ptr [r8]
0x29bfab0: test rsi, rsi
0x29bfab3: je 0x1429bfb34
0x29bfab5: mov rax, qword ptr [rsi]
0x29bfab8: lea rdx, [rbp - 9]
0x29bfabc: mov rcx, rsi
0x29bfabf: call qword ptr [rax + 0xd0]
0x29bfac5: mov rdx, qword ptr [rax]
0x29bfac8: mov qword ptr [rbp + 0x7f], rdx
0x29bfacc: mov rax, qword ptr [rsi]
0x29bfacf: lea rdx, [rbp - 1]
0x29bfad3: mov rcx, rsi
0x29bfad6: call qword ptr [rax + 0xd8]
0x29bfadc: mov rdx, qword ptr [rax]
0x29bfadf: mov qword ptr [rbp - 0x19], rdx
0x29bfae3: mov rax, qword ptr [rsi]
0x29bfae6: mov rcx, rsi
0x29bfae9: call qword ptr [rax + 0xc8]
0x29bfaef: mov qword ptr [rbp - 0x11], rax
0x29bfaf3: lea rax, [rdi + 0xc]
0x29bfaf7: lea rcx, [rdi + 0x22]
0x29bfafb: lea rdx, [rbp + 0x7f]
0x29bfaff: mov qword ptr [rsp + 0x80], rdx
0x29bfb07: lea rdx, [rbp - 0x19]
0x29bfb0b: mov qword ptr [rsp + 0x78], rdx
0x29bfb10: lea rdx, [rbp - 0x11]
0x29bfb14: mov qword ptr [rsp + 0x70], rdx
0x29bfb19: mov qword ptr [rsp + 0x68], rax
0x29bfb1e: mov qword ptr [rsp + 0x60], rcx
0x29bfb23: mov eax, dword ptr [rip + 0x431be4b]
0x29bfb29: mov dword ptr [rsp + 0x48], eax
0x29bfb2d: call 0x14143b450
0x29bfb32: jmp 0x1429bfb55
0x29bfb34: lea rax, [rdi + 0xc]
0x29bfb38: lea rcx, [rdi + 0x22]
0x29bfb3c: mov qword ptr [rsp + 0x68], rax
0x29bfb41: mov qword ptr [rsp + 0x60], rcx
0x29bfb46: mov eax, dword ptr [rip + 0x431be28]
0x29bfb4c: mov dword ptr [rsp + 0x48], eax
0x29bfb50: call 0x14143b670
0x29bfb55: mov eax, dword ptr [rip + 0x431be19]
0x29bfb5b: mov dword ptr [rbx], eax
0x29bfb5d: mov rax, rbx
0x29bfb60: mov rbx, qword ptr [rsp + 0x110]
0x29bfb68: add rsp, 0xe0
0x29bfb6f: pop r15
0x29bfb71: pop r14
0x29bfb73: pop rdi
0x29bfb74: pop rsi
0x29bfb75: pop rbp
0x29bfb76: ret 