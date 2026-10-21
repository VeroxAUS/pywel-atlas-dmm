0x39eaa0: mov qword ptr [rsp + 0x18], rbx
0x39eaa5: push rdi
0x39eaa6: sub rsp, 0xf0
0x39eaad: mov rdi, rcx
0x39eab0: mov rax, qword ptr [rcx + 8]
0x39eab4: lea rdx, [rax + 8]
0x39eab8: xor ebx, ebx
0x39eaba: test rax, rax
0x39eabd: cmove rdx, rbx
0x39eac1: mov rdx, qword ptr [rdx]
0x39eac4: lea rcx, [rsp + 0x100]
0x39eacc: call 0x140393df0
0x39ead1: nop 
0x39ead2: mov rax, qword ptr [rdi + 8]
0x39ead6: mov rcx, qword ptr [rax + 0x68]
0x39eada: mov rax, qword ptr [rcx + 0x20]
0x39eade: mov ecx, dword ptr [rax + 0x394]
0x39eae4: or ecx, dword ptr [rax + 0x390]
0x39eaea: bt ecx, 0x19
0x39eaee: jae 0x14039eb16
0x39eaf0: xor eax, eax
0x39eaf2: mov byte ptr [rdi + 0x4c], al
0x39eaf5: mov rcx, qword ptr [rsp + 0x100]
0x39eafd: mov rax, qword ptr [rcx]
0x39eb00: mov dl, 1
0x39eb02: mov rbx, qword ptr [rsp + 0x110]
0x39eb0a: add rsp, 0xf0
0x39eb11: pop rdi
0x39eb12: jmp qword ptr [rax + 0x20]
0x39eb16: mov rcx, qword ptr [rsp + 0x100]
0x39eb1e: mov rax, qword ptr [rcx]
0x39eb21: mov dl, 1
0x39eb23: call qword ptr [rax + 0x20]
0x39eb26: movzx eax, byte ptr [rdi + 0x4c]
0x39eb2a: test al, 1
0x39eb2c: jne 0x14039eb44
0x39eb2e: test al, 2
0x39eb30: je 0x14039eb44
0x39eb32: xor edx, edx
0x39eb34: mov rcx, rdi
0x39eb37: call 0x14039dd20
0x39eb3c: test al, al
0x39eb3e: je 0x14039ec58
0x39eb44: mov rax, qword ptr [rdi + 8]
0x39eb48: lea rdx, [rax + 8]
0x39eb4c: test rax, rax
0x39eb4f: cmove rdx, rbx
0x39eb53: mov r8b, 1
0x39eb56: mov rdx, qword ptr [rdx]
0x39eb59: lea rcx, [rsp + 0x30]
0x39eb5e: call 0x140393650
0x39eb63: nop 
0x39eb64: xor eax, eax
0x39eb66: mov byte ptr [rdi + 0x4c], al
0x39eb69: mov rbx, qword ptr [rsp + 0x30]
0x39eb6e: mov rax, qword ptr [rbx]
0x39eb71: xor edx, edx
0x39eb73: mov rcx, rbx
0x39eb76: call qword ptr [rax + 0x20]
0x39eb79: cmp byte ptr [rsp + 0x38], 1
0x39eb7e: jne 0x14039ebae
0x39eb80: mov eax, 0xffffffff
0x39eb85: lock xadd dword ptr [rbx + 8], eax
0x39eb8a: cmp eax, 1
0x39eb8d: jne 0x14039eba1
0x39eb8f: test dword ptr [rbx + 0xc], 0x40000000
0x39eb96: je 0x14039ebae
0x39eb98: mov rax, qword ptr [rbx]
0x39eb9b: mov rcx, rbx
0x39eb9e: call qword ptr [rax + 0x40]
0x39eba1: test dword ptr [rbx + 0xc], 0x40000000
0x39eba8: je 0x14039ebae
0x39ebaa: lock dec dword ptr [rbx + 0xc]
0x39ebae: mov rax, qword ptr [rdi + 8]
0x39ebb2: mov rcx, qword ptr [rax + 0x68]
0x39ebb6: mov byte ptr [rsp + 0x20], 0
0x39ebbb: vxorps xmm3, xmm3, xmm3
0x39ebbf: mov r8b, 1
0x39ebc2: mov edx, 0x2000000
0x39ebc7: mov rcx, qword ptr [rcx + 0x20]
0x39ebcb: call 0x141795490
0x39ebd0: mov rax, qword ptr [rdi + 8]
0x39ebd4: mov rcx, qword ptr [rax + 0x88]
0x39ebdb: movzx edx, byte ptr [rcx + 1]
0x39ebdf: lea eax, [rdx - 3]
0x39ebe2: cmp eax, 6
0x39ebe5: ja 0x14039ebfd
0x39ebe7: cdqe 
0x39ebe9: lea r8, [rip - 0x39ebf0]
0x39ebf0: mov ecx, dword ptr [r8 + rax*4 + 0x39ec6c]
0x39ebf8: add rcx, r8
0x39ebfb: jmp rcx
0x39ebfd: cmp dl, 1
0x39ec00: jne 0x14039ec58
0x39ec02: mov dword ptr [rsp + 0x30], 0xffff
0x39ec0a: mov eax, dword ptr [rip + 0x66ce4c0]
0x39ec10: mov dword ptr [rsp + 0x38], eax
0x39ec14: mov eax, dword ptr [rip + 0x66ce4b2]
0x39ec1a: mov dword ptr [rsp + 0x34], eax
0x39ec1e: lea rdx, [rsp + 0x30]
0x39ec23: lea rcx, [rsp + 0x40]
0x39ec28: call 0x1417b54d0
0x39ec2d: mov eax, dword ptr [rdi + 0x48]
0x39ec30: mov dword ptr [rsp + 0x98], eax
0x39ec37: mov rax, qword ptr [rdi + 8]
0x39ec3b: mov rcx, qword ptr [rax + 0x68]
0x39ec3f: xor r9d, r9d
0x39ec42: lea r8, [rsp + 0x40]
0x39ec47: lea rdx, [rsp + 0x100]
0x39ec4f: mov rcx, qword ptr [rcx + 0x58]
0x39ec53: call 0x14207aa10
0x39ec58: mov rbx, qword ptr [rsp + 0x110]
0x39ec60: add rsp, 0xf0
0x39ec67: pop rdi
0x39ec68: ret 
0x39ec69: nop dword ptr [rax]
0x39ec6c: add ch, ah
0x39ec6e: cmp dword ptr [rax], eax
0x39ec70: add ch, ah
0x39ec72: cmp dword ptr [rax], eax
0x39ec74: add ch, ah
0x39ec76: cmp dword ptr [rax], eax
0x39ec78: add ch, ah
0x39ec7a: cmp dword ptr [rax], eax
0x39ec7c: std 
0x39ec7d: jmp 0x14039ecb8
0x39ec7f: add byte ptr [rdx], al
0x39ec81: in al, dx
0x39ec82: cmp dword ptr [rax], eax
0x39ec84: add ch, ah
0x39ec86: cmp dword ptr [rax], eax