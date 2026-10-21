0x28ff9b0: mov qword ptr [rsp + 0x10], rbx
0x28ff9b5: mov qword ptr [rsp + 0x18], rbp
0x28ff9ba: push rdi
0x28ff9bb: push r14
0x28ff9bd: push r15
0x28ff9bf: sub rsp, 0x60
0x28ff9c3: mov rdi, rdx
0x28ff9c6: mov rbp, rcx
0x28ff9c9: mov rcx, qword ptr [rcx + 8]
0x28ff9cd: mov rax, qword ptr [rcx]
0x28ff9d0: call qword ptr [rax + 0x178]
0x28ff9d6: test al, al
0x28ff9d8: je 0x1428ffad1
0x28ff9de: lea rdx, [rsp + 0x40]
0x28ff9e3: mov rcx, qword ptr [rbp + 8]
0x28ff9e7: call 0x1417ee020
0x28ff9ec: nop 
0x28ff9ed: lea r15, [rip + 0x2e26454]
0x28ff9f4: mov qword ptr [rsp + 0x20], r15
0x28ff9f9: mov r14, qword ptr [rax + 8]
0x28ff9fd: mov qword ptr [rsp + 0x28], r14
0x28ffa02: movzx ebx, byte ptr [rax + 0x10]
0x28ffa06: mov byte ptr [rsp + 0x30], bl
0x28ffa0a: movzx ecx, byte ptr [rax + 0x11]
0x28ffa0e: mov byte ptr [rsp + 0x31], cl
0x28ffa12: mov rcx, qword ptr [rax + 0x18]
0x28ffa16: mov qword ptr [rsp + 0x38], rcx
0x28ffa1b: mov qword ptr [rax + 8], 0
0x28ffa23: mov byte ptr [rax + 0x10], 0
0x28ffa27: lea rax, [rip + 0x2c7405a]
0x28ffa2e: mov qword ptr [rsp + 0x20], rax
0x28ffa33: lea rax, [rip + 0x2d46ff6]
0x28ffa3a: mov qword ptr [rsp + 0x20], rax
0x28ffa3f: mov qword ptr [rsp + 0x40], r15
0x28ffa44: lea rcx, [rsp + 0x40]
0x28ffa49: call 0x141434880
0x28ffa4e: test bl, bl
0x28ffa50: je 0x1428ffac2
0x28ffa52: mov rbp, qword ptr [rbp + 8]
0x28ffa56: mov rax, qword ptr [r14 + 0x68]
0x28ffa5a: mov rbx, qword ptr [rax + 0x178]
0x28ffa61: lea rcx, [rbx + 0x30]
0x28ffa65: mov r14d, 0xffff
0x28ffa6b: cmp word ptr [rcx], r14w
0x28ffa6f: je 0x1428ffa94
0x28ffa71: mov eax, dword ptr [rbp + 0x60]
0x28ffa74: cmp dword ptr [rbx + 0x40], eax
0x28ffa77: jne 0x1428ffa94
0x28ffa79: call 0x1404a2890
0x28ffa7e: mov r9d, dword ptr [rax]
0x28ffa81: mov r8, rbp
0x28ffa84: lea rdx, [rsp + 0x80]
0x28ffa8c: mov rcx, rbx
0x28ffa8f: call 0x142956680
0x28ffa94: lea rcx, [rbx + 0x48]
0x28ffa98: cmp word ptr [rcx], r14w
0x28ffa9c: je 0x1428ffac2
0x28ffa9e: mov eax, dword ptr [rbp + 0x60]
0x28ffaa1: cmp dword ptr [rbx + 0x58], eax
0x28ffaa4: jne 0x1428ffac2
0x28ffaa6: call 0x1404a2890
0x28ffaab: mov r9d, dword ptr [rax]
0x28ffaae: mov r8, rbp
0x28ffab1: lea rdx, [rsp + 0x80]
0x28ffab9: mov rcx, rbx
0x28ffabc: call 0x142956680
0x28ffac1: nop 
0x28ffac2: mov qword ptr [rsp + 0x20], r15
0x28ffac7: lea rcx, [rsp + 0x20]
0x28ffacc: call 0x141434880
0x28ffad1: mov rax, rdi
0x28ffad4: mov dword ptr [rdi], 0
0x28ffada: lea r11, [rsp + 0x60]
0x28ffadf: mov rbx, qword ptr [r11 + 0x28]
0x28ffae3: mov rbp, qword ptr [r11 + 0x30]
0x28ffae7: mov rsp, r11
0x28ffaea: pop r15
0x28ffaec: pop r14
0x28ffaee: pop rdi
0x28ffaef: ret 