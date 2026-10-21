0x10430980: mov qword ptr [rsp + 0x20], rbx
0x10430985: mov qword ptr [rsp + 8], rcx
0x1043098a: push rbp
0x1043098b: push rsi
0x1043098c: push rdi
0x1043098d: push r14
0x1043098f: push r15
0x10430991: sub rsp, 0x50
0x10430995: mov rdi, rdx
0x10430998: mov rax, qword ptr [rdx]
0x1043099b: lea rdx, [rsp + 0x90]
0x104309a3: mov rcx, rdi
0x104309a6: call qword ptr [rax + 0xd0]
0x104309ac: mov rsi, rax
0x104309af: mov rcx, qword ptr [rdi + 0x68]
0x104309b3: mov rdx, qword ptr [rcx + 0x20]
0x104309b7: test rdx, rdx
0x104309ba: lea rbx, [rip - 0x99cae01]
0x104309c1: je 0x1504309c7
0x104309c3: mov rbx, qword ptr [rdx + 0x70]
0x104309c7: movzx eax, byte ptr [rdi + 0xa8]
0x104309ce: mov byte ptr [rsp + 0x80], al
0x104309d5: mov eax, dword ptr [rdi + 0x60]
0x104309d8: mov dword ptr [rsp + 0x88], eax
0x104309df: lea rbp, [rip - 0xa90b5ee]
0x104309e6: mov qword ptr [rsp + 0x30], rbp
0x104309eb: mov byte ptr [rsp + 0x38], 0
0x104309f0: lea r15, [rip - 0xa90b5bf]
0x104309f7: mov qword ptr [rsp + 0x30], r15
0x104309fc: xor r14d, r14d
0x104309ff: mov qword ptr [rsp + 0x40], r14
0x10430a04: mov rax, qword ptr [rdi]
0x10430a07: mov rcx, rdi
0x10430a0a: call qword ptr [rax + 0xe8]
0x10430a10: mov qword ptr [rsp + 0x40], rax
0x10430a15: mov qword ptr [rsp + 0x28], rsi
0x10430a1a: mov qword ptr [rsp + 0x20], rbx
0x10430a1f: lea r9, [rsp + 0x80]
0x10430a27: lea r8, [rsp + 0x88]
0x10430a2f: lea rdx, [rsp + 0x30]
0x10430a34: mov rcx, rdi
0x10430a37: call 0x142986fa0
0x10430a3c: nop 
0x10430a3d: mov qword ptr [rsp + 0x30], rbp
0x10430a42: mov rcx, rdi
0x10430a45: call 0x1428f31f0
0x10430a4a: lea rdx, [rdi + 8]
0x10430a4e: test rdi, rdi
0x10430a51: cmove rdx, r14
0x10430a55: mov r8b, 1
0x10430a58: mov rdx, qword ptr [rdx]
0x10430a5b: lea rcx, [rsp + 0x30]
0x10430a60: call 0x140393650
0x10430a65: nop 
0x10430a66: mov rax, qword ptr [rdi + 0x68]
0x10430a6a: mov rcx, qword ptr [rax + 0x1a0]
0x10430a71: mov byte ptr [rcx + 0x3dc], 1
0x10430a78: mov rax, qword ptr [rdi]
0x10430a7b: mov rcx, rdi
0x10430a7e: call qword ptr [rax + 0x180]
0x10430a84: mov rax, qword ptr [rdi + 0x68]
0x10430a88: mov rcx, qword ptr [rax + 0x1a0]
0x10430a8f: mov byte ptr [rcx + 0x590], r14b
0x10430a96: mov rbx, qword ptr [rsp + 0x30]
0x10430a9b: mov rax, qword ptr [rbx]
0x10430a9e: xor edx, edx
0x10430aa0: mov rcx, rbx
0x10430aa3: call qword ptr [rax + 0x20]
0x10430aa6: sub word ptr [rip - 0x89e8571], cx
0x10430aad: cmp byte ptr [rsp + 0x38], 1
0x10430ab2: jne 0x150430ae2
0x10430ab4: mov eax, 0xffffffff
0x10430ab9: lock xadd dword ptr [rbx + 8], eax
0x10430abe: cmp eax, 1
0x10430ac1: jne 0x150430ad5
0x10430ac3: test dword ptr [rbx + 0xc], 0x40000000
0x10430aca: je 0x150430ae2
0x10430acc: mov rax, qword ptr [rbx]
0x10430acf: mov rcx, rbx
0x10430ad2: call qword ptr [rax + 0x40]
0x10430ad5: test dword ptr [rbx + 0xc], 0x40000000
0x10430adc: je 0x150430ae2
0x10430ade: lock dec dword ptr [rbx + 0xc]
0x10430ae2: mov rcx, rdi
0x10430ae5: call 0x1428fb810
0x10430aea: mov qword ptr [rsp + 0x30], rbp
0x10430aef: mov byte ptr [rsp + 0x38], 0
0x10430af4: mov qword ptr [rsp + 0x30], r15
0x10430af9: mov qword ptr [rsp + 0x40], r14
0x10430afe: mov rax, qword ptr [rdi]
0x10430b01: mov rcx, rdi
0x10430b04: call qword ptr [rax + 0xe8]
0x10430b0a: mov qword ptr [rsp + 0x40], rax
0x10430b0f: lea rdx, [rsp + 0x30]
0x10430b14: mov rcx, rdi
0x10430b17: call 0x1429874b0
0x10430b1c: nop 
0x10430b1d: mov qword ptr [rsp + 0x30], rbp
0x10430b22: mov rbx, qword ptr [rsp + 0x98]
0x10430b2a: add rsp, 0x50
0x10430b2e: pop r15
0x10430b30: pop r14
0x10430b32: pop rdi
0x10430b33: pop rsi
0x10430b34: pop rbp
0x10430b35: ret 