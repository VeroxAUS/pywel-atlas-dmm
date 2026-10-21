0x2bc4950: mov rax, rsp
0x2bc4953: mov qword ptr [rax + 0x10], rbx
0x2bc4957: mov qword ptr [rax + 0x18], rsi
0x2bc495b: mov qword ptr [rax + 0x20], rdi
0x2bc495f: push rbp
0x2bc4960: push r12
0x2bc4962: push r13
0x2bc4964: push r14
0x2bc4966: push r15
0x2bc4968: lea rbp, [rax - 0x5f]
0x2bc496c: sub rsp, 0xc0
0x2bc4973: vmovaps xmmword ptr [rax - 0x38], xmm6
0x2bc4978: mov r13, rdx
0x2bc497b: mov r14, rcx
0x2bc497e: xor ebx, ebx
0x2bc4980: mov esi, ebx
0x2bc4982: mov dword ptr [rbp - 0x69], ebx
0x2bc4985: mov r15, qword ptr [rcx + 8]
0x2bc4989: mov eax, dword ptr [r8]
0x2bc498c: mov dword ptr [rbp - 0x61], eax
0x2bc498f: movzx eax, word ptr [r8 + 4]
0x2bc4994: mov word ptr [rbp - 0x5d], ax
0x2bc4998: vmovsd xmm0, qword ptr [r8 + 8]
0x2bc499e: vmovsd qword ptr [rbp - 0x59], xmm0
0x2bc49a3: mov eax, dword ptr [r8 + 0x10]
0x2bc49a7: mov dword ptr [rbp - 0x51], eax
0x2bc49aa: vmovss xmm0, dword ptr [r8 + 0x14]
0x2bc49b0: vmovss dword ptr [rbp - 0x4d], xmm0
0x2bc49b5: movzx eax, byte ptr [r8 + 0x18]
0x2bc49ba: mov byte ptr [rbp - 0x49], al
0x2bc49bd: movzx eax, byte ptr [r8 + 0x19]
0x2bc49c2: mov byte ptr [rbp - 0x48], al
0x2bc49c5: movzx eax, byte ptr [r8 + 0x1a]
0x2bc49ca: mov byte ptr [rbp - 0x47], al
0x2bc49cd: movzx eax, byte ptr [r8 + 0x1b]
0x2bc49d2: mov byte ptr [rbp - 0x46], al
0x2bc49d5: movzx eax, byte ptr [r8 + 0x1c]
0x2bc49da: mov byte ptr [rbp - 0x45], al
0x2bc49dd: mov eax, dword ptr [r8 + 0x20]
0x2bc49e1: mov dword ptr [rbp - 0x41], eax
0x2bc49e4: mov qword ptr [rbp - 0x39], rbx
0x2bc49e8: mov qword ptr [rbp - 0x31], rbx
0x2bc49ec: lea rdx, [r8 + 0x28]
0x2bc49f0: lea rcx, [rbp - 0x39]
0x2bc49f4: call 0x142bd2f60
0x2bc49f9: nop 
0x2bc49fa: lea rdx, [r15 + 8]
0x2bc49fe: test r15, r15
0x2bc4a01: cmove rdx, rbx
0x2bc4a05: mov r8b, 1
0x2bc4a08: mov rdx, qword ptr [rdx]
0x2bc4a0b: lea rcx, [rbp + 0xf]
0x2bc4a0f: call 0x140393650
0x2bc4a14: nop 
0x2bc4a15: movzx r12d, byte ptr [rbp - 0x49]
0x2bc4a1a: test r12b, r12b
0x2bc4a1d: je 0x142bc4ba5
0x2bc4a23: cmp r13, r15
0x2bc4a26: je 0x142bc4ba5
0x2bc4a2c: mov rdi, qword ptr [rbp - 0x39]
0x2bc4a30: mov rbx, rdi
0x2bc4a33: mov r8d, dword ptr [rbp - 0x31]
0x2bc4a37: imul rdx, r8, 0x34
0x2bc4a3b: add rdx, rdi
0x2bc4a3e: vxorps xmm6, xmm6, xmm6
0x2bc4a42: movzx eax, word ptr [rbp - 0x5d]
0x2bc4a46: cmp rdi, rdx
0x2bc4a49: je 0x142bc4a64
0x2bc4a4b: nop dword ptr [rax + rax]
0x2bc4a50: movzx ecx, word ptr [rbx]
0x2bc4a53: cmp ecx, eax
0x2bc4a55: je 0x142bc4b1d
0x2bc4a5b: add rbx, 0x34
0x2bc4a5f: cmp rbx, rdx
0x2bc4a62: jne 0x142bc4a50
0x2bc4a64: xor edx, edx
0x2bc4a66: mov qword ptr [rbp - 0x29], 0xffff
0x2bc4a6e: mov word ptr [rbp + 8], dx
0x2bc4a72: mov byte ptr [rbp + 0xa], dl
0x2bc4a75: vmovsd xmm0, qword ptr [rip + 0x298141b]
0x2bc4a7d: vmovsd qword ptr [rbp - 0x21], xmm0
0x2bc4a82: mov ecx, dword ptr [rip + 0x2981418]
0x2bc4a88: mov dword ptr [rbp - 0x19], ecx
0x2bc4a8b: vmovdqu xmm0, xmmword ptr [rip + 0x31b0f4d]
0x2bc4a93: vmovups xmmword ptr [rbp - 0x15], xmm0
0x2bc4a98: vmovss dword ptr [rbp - 5], xmm6
0x2bc4a9d: vmovss dword ptr [rbp - 1], xmm6
0x2bc4aa2: vmovss dword ptr [rbp + 3], xmm6
0x2bc4aa7: mov byte ptr [rbp + 7], dl
0x2bc4aaa: mov ecx, dword ptr [rbp - 0x2d]
0x2bc4aad: cmp ecx, r8d
0x2bc4ab0: ja 0x142bc4ae8
0x2bc4ab2: lea edx, [rcx*2 + 1]
0x2bc4ab9: add edx, ecx
0x2bc4abb: shr edx, 1
0x2bc4abd: mov eax, 1
0x2bc4ac2: cmp edx, eax
0x2bc4ac4: cmovb edx, eax
0x2bc4ac7: cmp r8d, edx
0x2bc4aca: cmova edx, r8d
0x2bc4ace: lea rcx, [rbp - 0x39]
0x2bc4ad2: call 0x14272d460
0x2bc4ad7: mov r8d, dword ptr [rbp - 0x31]
0x2bc4adb: mov rdi, qword ptr [rbp - 0x39]
0x2bc4adf: movzx r12d, byte ptr [rbp - 0x49]
0x2bc4ae4: movzx eax, word ptr [rbp - 0x5d]
0x2bc4ae8: mov ecx, r8d
0x2bc4aeb: imul rdx, rcx, 0x34
0x2bc4aef: vmovups ymm0, ymmword ptr [rbp - 0x29]
0x2bc4af4: vmovups ymmword ptr [rdx + rdi], ymm0
0x2bc4af9: vmovups xmm1, xmmword ptr [rbp - 9]
0x2bc4afe: vmovups xmmword ptr [rdx + rdi + 0x20], xmm1
0x2bc4b04: mov ecx, dword ptr [rbp + 7]
0x2bc4b07: mov dword ptr [rdx + rdi + 0x30], ecx
0x2bc4b0b: inc r8d
0x2bc4b0e: mov dword ptr [rbp - 0x31], r8d
0x2bc4b12: lea edx, [r8 - 1]
0x2bc4b16: imul rbx, rdx, 0x34
0x2bc4b1a: add rbx, rdi
0x2bc4b1d: mov word ptr [rbx], ax
0x2bc4b20: lea rcx, [rbp - 0x5d]
0x2bc4b24: vzeroupper 
0x2bc4b27: call 0x140389570
0x2bc4b2c: mov rcx, qword ptr [r15 + 0x68]
0x2bc4b30: mov edx, dword ptr [rax]
0x2bc4b32: mov rcx, qword ptr [rcx + 0x110]
0x2bc4b39: call 0x14214e7a0
0x2bc4b3e: mov ecx, dword ptr [rax + 0x50]
0x2bc4b41: mov dword ptr [rbx + 4], ecx
0x2bc4b44: vmovsd xmm0, qword ptr [rbp - 0x59]
0x2bc4b49: vmovsd qword ptr [rbx + 0x24], xmm0
0x2bc4b4e: mov eax, dword ptr [rbp - 0x51]
0x2bc4b51: mov dword ptr [rbx + 0x2c], eax
0x2bc4b54: lea rcx, [rbx + 0x14]
0x2bc4b58: vmovaps xmm3, xmm6
0x2bc4b5c: vmovaps xmm2, xmm6
0x2bc4b60: vmovss xmm1, dword ptr [rbp - 0x4d]
0x2bc4b65: call 0x140393a90
0x2bc4b6a: mov r9, qword ptr [r15 + 0x68]
0x2bc4b6e: mov rcx, qword ptr [r9 + 0x1a0]
0x2bc4b75: add rcx, 0x98
0x2bc4b7c: lea rdx, [rbp - 0x29]
0x2bc4b80: call 0x140393470
0x2bc4b85: vmovsd xmm0, qword ptr [rbp - 0xd]
0x2bc4b8a: vmovsd qword ptr [rbp - 0x59], xmm0
0x2bc4b8f: mov eax, dword ptr [rbp - 5]
0x2bc4b92: mov dword ptr [rbp - 0x51], eax
0x2bc4b95: lea rcx, [rbp - 0x1d]
0x2bc4b99: call 0x140393bb0
0x2bc4b9e: vmovss dword ptr [rbp - 0x4d], xmm0
0x2bc4ba3: jmp 0x142bc4ba9
0x2bc4ba5: mov rdi, qword ptr [rbp - 0x39]
0x2bc4ba9: lea rcx, [r14 + 0x550]
0x2bc4bb0: lea rdx, [rbp - 0x61]
0x2bc4bb4: call 0x142bbf510
0x2bc4bb9: mov byte ptr [r14 + 0x591], 1
0x2bc4bc1: mov byte ptr [r15 + 0xc3], 0
0x2bc4bc9: mov rax, qword ptr [r13 + 0x68]
0x2bc4bcd: mov rcx, qword ptr [rax + 0x20]
0x2bc4bd1: movzx eax, byte ptr [rcx + 0x398]
0x2bc4bd8: or al, 4
0x2bc4bda: mov byte ptr [rcx + 0x398], al
0x2bc4be0: mov rbx, qword ptr [rbp + 0xf]
0x2bc4be4: mov rax, qword ptr [rbx]
0x2bc4be7: xor edx, edx
0x2bc4be9: mov rcx, rbx
0x2bc4bec: call qword ptr [rax + 0x20]
0x2bc4bef: cmp byte ptr [rbp + 0x17], 1
0x2bc4bf3: jne 0x142bc4c23
0x2bc4bf5: mov eax, 0xffffffff
0x2bc4bfa: lock xadd dword ptr [rbx + 8], eax
0x2bc4bff: cmp eax, 1
0x2bc4c02: jne 0x142bc4c16
0x2bc4c04: test dword ptr [rbx + 0xc], 0x40000000
0x2bc4c0b: je 0x142bc4c23
0x2bc4c0d: mov rax, qword ptr [rbx]
0x2bc4c10: mov rcx, rbx
0x2bc4c13: call qword ptr [rax + 0x40]
0x2bc4c16: test dword ptr [rbx + 0xc], 0x40000000
0x2bc4c1d: je 0x142bc4c23
0x2bc4c1f: lock dec dword ptr [rbx + 0xc]
0x2bc4c23: cmp byte ptr [rbp - 0x48], 0
0x2bc4c27: jne 0x142bc4c32
0x2bc4c29: test r12b, r12b
0x2bc4c2c: je 0x142bc4cd5
0x2bc4c32: lea rdx, [rbp - 0x29]
0x2bc4c36: lea rcx, [r14 + 0x4f0]
0x2bc4c3d: call 0x142bbf340
0x2bc4c42: nop 
0x2bc4c43: cmp byte ptr [rbp - 0x19], 0
0x2bc4c47: je 0x142bc4c97
0x2bc4c49: mov rcx, qword ptr [rbp - 0x21]
0x2bc4c4d: mov rax, qword ptr [rcx]
0x2bc4c50: call qword ptr [rax + 0x48]
0x2bc4c53: mov rbx, rax
0x2bc4c56: lea rdx, [rax + 8]
0x2bc4c5a: test rax, rax
0x2bc4c5d: mov eax, 0
0x2bc4c62: cmove rdx, rax
0x2bc4c66: mov r8b, 1
0x2bc4c69: mov rdx, qword ptr [rdx]
0x2bc4c6c: lea rcx, [rbp + 0xf]
0x2bc4c70: call 0x140393650
0x2bc4c75: nop 
0x2bc4c76: mov qword ptr [rbp + 0x1f], rbx
0x2bc4c7a: or esi, 1
0x2bc4c7d: mov dword ptr [rbp - 0x69], esi
0x2bc4c80: mov byte ptr [rbx + 0x6a0], 0
0x2bc4c87: and esi, 0xfffffffe
0x2bc4c8a: mov dword ptr [rbp - 0x69], esi
0x2bc4c8d: lea rcx, [rbp + 0xf]
0x2bc4c91: call 0x140393c10
0x2bc4c96: nop 
0x2bc4c97: lea rax, [rip + 0x2d4e1c2]
0x2bc4c9e: mov qword ptr [rbp - 0x29], rax
0x2bc4ca2: cmp byte ptr [rbp - 0x19], 0
0x2bc4ca6: je 0x142bc4cb6
0x2bc4ca8: mov rcx, qword ptr [rbp - 1]
0x2bc4cac: mov rax, qword ptr [rcx]
0x2bc4caf: call qword ptr [rax + 0x148]
0x2bc4cb5: nop 
0x2bc4cb6: lea rax, [rip + 0x29aeb83]
0x2bc4cbd: mov qword ptr [rbp - 0x29], rax
0x2bc4cc1: lea rax, [rip + 0x2b61180]
0x2bc4cc8: mov qword ptr [rbp - 0x29], rax
0x2bc4ccc: lea rcx, [rbp - 0x29]
0x2bc4cd0: call 0x141434880
0x2bc4cd5: mov rax, qword ptr [r13 + 0x68]
0x2bc4cd9: mov rcx, qword ptr [rax + 0x1c0]
0x2bc4ce0: mov rax, qword ptr [rcx]
0x2bc4ce3: call qword ptr [rax + 0x170]
0x2bc4ce9: nop 
0x2bc4cea: test rdi, rdi
0x2bc4ced: je 0x142bc4d15
0x2bc4cef: mov ecx, 0x1fd
0x2bc4cf4: mov rax, qword ptr gs:[0x58]
0x2bc4cfd: mov rdx, qword ptr [rax]
0x2bc4d00: cmp byte ptr [rcx + rdx], 0
0x2bc4d04: mov rcx, rdi
0x2bc4d07: je 0x142bc4d10
0x2bc4d09: call 0x1447f03bc
0x2bc4d0e: jmp 0x142bc4d15
0x2bc4d10: call 0x1447f02bc
0x2bc4d15: xor eax, eax
0x2bc4d17: mov qword ptr [rbp - 0x39], rax
0x2bc4d1b: mov qword ptr [rbp - 0x31], rax
0x2bc4d1f: lea r11, [rsp + 0xc0]
0x2bc4d27: mov rbx, qword ptr [r11 + 0x38]
0x2bc4d2b: mov rsi, qword ptr [r11 + 0x40]
0x2bc4d2f: mov rdi, qword ptr [r11 + 0x48]
0x2bc4d33: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0x2bc4d39: mov rsp, r11
0x2bc4d3c: pop r15
0x2bc4d3e: pop r14
0x2bc4d40: pop r13
0x2bc4d42: pop r12
0x2bc4d44: pop rbp
0x2bc4d45: ret 