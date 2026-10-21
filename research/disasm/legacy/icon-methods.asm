vtable=0x566ff50 slot=0x548 target=0xdb8a00
0xdb8a00: mov qword ptr [rsp + 8], rbx
0xdb8a05: mov qword ptr [rsp + 0x10], rbp
0xdb8a0a: mov qword ptr [rsp + 0x18], rsi
0xdb8a0f: push rdi
0xdb8a10: sub rsp, 0x20
0xdb8a14: mov rbp, rdx
0xdb8a17: mov rdi, rcx
0xdb8a1a: add rcx, 0x3c0
0xdb8a21: mov rdx, r8
0xdb8a24: mov rsi, r9
0xdb8a27: mov rbx, r8
0xdb8a2a: call 0x140de4500
0xdb8a2f: test rax, rax
0xdb8a32: je 0x140db8a3a
0xdb8a34: mov rax, qword ptr [rax + 0x28]
0xdb8a38: jmp 0x140db8a4b
0xdb8a3a: mov r9, rsi
0xdb8a3d: mov r8, rbx
0xdb8a40: mov rdx, rbp
0xdb8a43: mov rcx, rdi
0xdb8a46: call 0x140deffa0
0xdb8a4b: mov rbx, qword ptr [rsp + 0x30]
0xdb8a50: mov rbp, qword ptr [rsp + 0x38]
0xdb8a55: mov rsi, qword ptr [rsp + 0x40]
0xdb8a5a: add rsp, 0x20
0xdb8a5e: pop rdi
0xdb8a5f: ret 
vtable=0x566ff50 slot=0x550 target=0xdb81e0
0xdb81e0: mov qword ptr [rsp + 0x10], rbx
0xdb81e5: mov qword ptr [rsp + 0x20], r9
0xdb81ea: mov qword ptr [rsp + 0x18], r8
0xdb81ef: push rbp
0xdb81f0: push rsi
0xdb81f1: push rdi
0xdb81f2: push r12
0xdb81f4: push r13
0xdb81f6: push r14
0xdb81f8: push r15
0xdb81fa: lea rbp, [rsp - 7]
0xdb81ff: sub rsp, 0xc0
0xdb8206: mov r14, r9
0xdb8209: mov rbx, r8
0xdb820c: mov rsi, rdx
0xdb820f: mov rdi, rcx
0xdb8212: xor r15d, r15d
0xdb8215: mov dword ptr [rbp - 0x49], r15d
0xdb8219: mov rax, qword ptr [rcx]
0xdb821c: call qword ptr [rax + 0x548]
0xdb8222: test rax, rax
0xdb8225: jne 0x140db8515
0xdb822b: cmp byte ptr [rip + 0x5ef41b6], 1
0xdb8232: jne 0x140db8353
0xdb8238: lea r12, [rip + 0x48b7ce1]
0xdb823f: mov qword ptr [rbp - 0x21], r12
0xdb8243: lea rax, [rip + 0x48b7cf6]
0xdb824a: mov qword ptr [rbp - 0x21], rax
0xdb824e: mov eax, 0xffff
0xdb8253: mov word ptr [rbp - 0x19], ax
0xdb8257: mov qword ptr [rbp - 0x11], 0xffffffffffffffff
0xdb825f: mov byte ptr [rbp - 9], 0x15
0xdb8263: xor eax, eax
0xdb8265: mov dword ptr [rbp - 8], eax
0xdb8268: mov word ptr [rbp - 4], ax
0xdb826c: mov byte ptr [rbp - 2], al
0xdb826f: mov dword ptr [rbp - 1], r15d
0xdb8273: movzx eax, word ptr [rsi]
0xdb8276: mov word ptr [rbp - 0x19], ax
0xdb827a: movzx eax, byte ptr [rbx + 8]
0xdb827e: mov byte ptr [rbp - 9], al
0xdb8281: mov rax, qword ptr [rbx]
0xdb8284: mov qword ptr [rbp - 0x11], rax
0xdb8288: mov eax, dword ptr [r14]
0xdb828b: mov dword ptr [rbp - 1], eax
0xdb828e: mov rax, qword ptr [rdi]
0xdb8291: mov rcx, rdi
0xdb8294: call qword ptr [rax + 0x110]
0xdb829a: mov rcx, qword ptr [rax + 0xb0]
0xdb82a1: mov qword ptr [rbp - 0x41], r15
0xdb82a5: mov qword ptr [rbp - 0x39], r15
0xdb82a9: mov qword ptr [rbp - 0x31], r15
0xdb82ad: mov word ptr [rbp - 0x29], r15w
0xdb82b2: mov qword ptr [rbp - 0x41], rdi
0xdb82b6: lea rax, [rip + 0x306f3]
0xdb82bd: mov qword ptr [rbp - 0x39], rax
0xdb82c1: mov byte ptr [rbp - 0x29], r15b
0xdb82c5: mov ebx, 1
0xdb82ca: mov dword ptr [rbp - 0x49], ebx
0xdb82cd: lea r9, [rbp - 0x41]
0xdb82d1: lea r8, [rbp - 0x21]
0xdb82d5: lea rdx, [rip + 0x5f17d04]
0xdb82dc: call 0x143d20740
0xdb82e1: movzx r14d, al
0xdb82e5: and ebx, 0xfffffffe
0xdb82e8: mov dword ptr [rbp - 0x49], ebx
0xdb82eb: cmp byte ptr [rbp - 0x28], r15b
0xdb82ef: je 0x140db8322
0xdb82f1: mov rcx, qword ptr [rbp - 0x41]
0xdb82f5: test rcx, rcx
0xdb82f8: je 0x140db8322
0xdb82fa: mov r8d, 0x1fd
0xdb8300: mov rax, qword ptr gs:[0x58]
0xdb8309: mov rdx, qword ptr [rax]
0xdb830c: cmp byte ptr [r8 + rdx], r15b
0xdb8310: je 0x140db8319
0xdb8312: call 0x1447f03bc
0xdb8317: jmp 0x140db831e
0xdb8319: call 0x1447f02bc
0xdb831e: mov qword ptr [rbp - 0x41], r15
0xdb8322: mov byte ptr [rbp - 0x28], 0
0xdb8326: mov qword ptr [rbp - 0x41], r15
0xdb832a: mov qword ptr [rbp - 0x39], r15
0xdb832e: mov qword ptr [rbp - 0x31], r15
0xdb8332: mov byte ptr [rbp - 0x28], 0
0xdb8336: lea rcx, [rbp - 0x41]
0xdb833a: call 0x14035f1f0
0xdb833f: nop 
0xdb8340: cmp r14b, 1
0xdb8344: jne 0x140db834f
0xdb8346: mov qword ptr [rbp - 0x21], r12
0xdb834a: jmp 0x140db8515
0xdb834f: mov qword ptr [rbp - 0x21], r12
0xdb8353: mov rbx, qword ptr [rbp + 0x7f]
0xdb8357: test rbx, rbx
0xdb835a: je 0x140db8515
0xdb8360: cmp byte ptr [rbx], 0
0xdb8363: je 0x140db8515
0xdb8369: mov rcx, rsi
0xdb836c: call 0x140537250
0xdb8371: movzx ecx, byte ptr [rax + 0x2a]
0xdb8375: mov rax, qword ptr [rdi + 0x398]
0xdb837c: mov r13, qword ptr [rax + rcx*8]
0xdb8380: mov qword ptr [rbp + 0x47], r13
0xdb8384: mov rcx, rsi
0xdb8387: call 0x140537250
0xdb838c: mov r12, qword ptr [rbp + 0x6f]
0xdb8390: cmp byte ptr [rax + 0x2a], 3
0xdb8394: jae 0x140db83c7
0xdb8396: mov rcx, rsi
0xdb8399: call 0x140537250
0xdb839e: cmp byte ptr [rax + 0xb7], 0
0xdb83a5: je 0x140db83c7
0xdb83a7: vmovss xmm0, dword ptr [r12 + 4]
0xdb83ae: vcomiss xmm0, dword ptr [rip + 0x5f25c92]
0xdb83b6: jb 0x140db83c7
0xdb83b8: mov rax, qword ptr [rdi + 0x398]
0xdb83bf: mov rax, qword ptr [rax + 0x18]
0xdb83c3: mov qword ptr [rbp + 0x47], rax
0xdb83c7: mov r14b, 0xe
0xdb83ca: mov r15, qword ptr [rbp + 0x8f]
0xdb83d1: mov eax, dword ptr [r15 + 4]
0xdb83d5: test eax, eax
0xdb83d7: je 0x140db83f9
0xdb83d9: mov rax, qword ptr [r15 + 0x10]
0xdb83dd: mov r14, qword ptr [rax]
0xdb83e0: mov eax, dword ptr [r14 + 0x14]
0xdb83e4: cmp dword ptr [rip + 0x5f17bfa], eax
0xdb83ea: je 0x140db83f1
0xdb83ec: xor r14d, r14d
0xdb83ef: jmp 0x140db83f5
0xdb83f1: add r14, 0x10
0xdb83f5: movzx r14d, byte ptr [r14]
0xdb83f9: movzx r13d, byte ptr [rbp + 0x97]
0xdb8401: cmp byte ptr [rip + 0x5ef6270], 0
0xdb8408: je 0x140db8446
0xdb840a: mov byte ptr [rsp + 0x40], r13b
0xdb840f: mov qword ptr [rsp + 0x38], rbx
0xdb8414: mov rax, qword ptr [rbp + 0x77]
0xdb8418: mov qword ptr [rsp + 0x30], rax
0xdb841d: mov qword ptr [rsp + 0x28], r12
0xdb8422: mov rax, qword ptr [rbp + 0x67]
0xdb8426: mov qword ptr [rsp + 0x20], rax
0xdb842b: mov r9, qword ptr [rbp + 0x5f]
0xdb842f: mov r8, qword ptr [rbp + 0x57]
0xdb8433: mov rdx, rsi
0xdb8436: mov rcx, rdi
0xdb8439: call 0x140db79e0
0xdb843e: test al, al
0xdb8440: jne 0x140db8515
0xdb8446: cmp byte ptr [rip + 0x5ef3f9b], 1
0xdb844d: jne 0x140db84a4
0xdb844f: sub r14b, 0xd
0xdb8453: cmp r14b, 1
0xdb8457: jbe 0x140db84a4
0xdb8459: mov byte ptr [rsp + 0x68], r13b
0xdb845e: mov qword ptr [rsp + 0x60], r15
0xdb8463: mov rax, qword ptr [rbp + 0x67]
0xdb8467: vmovss xmm0, dword ptr [rax]
0xdb846b: vmovss dword ptr [rsp + 0x58], xmm0
0xdb8471: movzx eax, byte ptr [rbp + 0x87]
0xdb8478: mov byte ptr [rsp + 0x50], al
0xdb847c: mov qword ptr [rsp + 0x48], rbx
0xdb8481: mov rax, qword ptr [rbp + 0x77]
0xdb8485: mov qword ptr [rsp + 0x40], rax
0xdb848a: mov qword ptr [rsp + 0x20], r12
0xdb848f: mov r9, qword ptr [rbp + 0x5f]
0xdb8493: mov r8, qword ptr [rbp + 0x57]
0xdb8497: mov rdx, rsi
0xdb849a: mov rcx, rdi
0xdb849d: call 0x140db2d70
0xdb84a2: jmp 0x140db8515
0xdb84a4: mov byte ptr [rsp + 0x68], r13b
0xdb84a9: xor eax, eax
0xdb84ab: mov qword ptr [rsp + 0x60], rax
0xdb84b0: mov qword ptr [rsp + 0x58], rax
0xdb84b5: mov qword ptr [rsp + 0x50], rbx
0xdb84ba: mov rax, qword ptr [rbp + 0x77]
0xdb84be: mov qword ptr [rsp + 0x48], rax
0xdb84c3: mov rax, qword ptr [rbp + 0x67]
0xdb84c7: vmovss xmm0, dword ptr [rax]
0xdb84cb: vmovss dword ptr [rsp + 0x38], xmm0
0xdb84d1: mov rax, qword ptr [rbp + 0x47]
0xdb84d5: mov qword ptr [rsp + 0x28], rax
0xdb84da: mov qword ptr [rsp + 0x20], r12
0xdb84df: mov r9, qword ptr [rbp + 0x5f]
0xdb84e3: mov r8, qword ptr [rbp + 0x57]
0xdb84e7: mov rdx, rsi
0xdb84ea: mov rcx, rdi
0xdb84ed: call 0x140db3bd0
0xdb84f2: mov rbx, rax
0xdb84f5: test rax, rax
0xdb84f8: je 0x140db8515
0xdb84fa: movzx r8d, byte ptr [rbp + 0x87]
0xdb8502: mov rdx, rax
0xdb8505: mov rcx, rdi
0xdb8508: call 0x140db85a0
0xdb850d: mov rdx, rbx
0xdb8510: call 0x140df4f60
0xdb8515: mov rbx, qword ptr [rsp + 0x108]
0xdb851d: add rsp, 0xc0
0xdb8524: pop r15
0xdb8526: pop r14
0xdb8528: pop r13
0xdb852a: pop r12
0xdb852c: pop rdi
0xdb852d: pop rsi
0xdb852e: pop rbp
0xdb852f: ret 
vtable=0x566ff50 slot=0x558 target=0xdb8a60
0xdb8a60: mov dword ptr [rsp + 0x20], r9d
0xdb8a65: mov qword ptr [rsp + 0x18], r8
0xdb8a6a: mov word ptr [rsp + 0x10], dx
0xdb8a6f: push rbp
0xdb8a70: push rbx
0xdb8a71: push rsi
0xdb8a72: push rdi
0xdb8a73: push r12
0xdb8a75: push r13
0xdb8a77: push r14
0xdb8a79: push r15
0xdb8a7b: lea rbp, [rsp - 0x1f]
0xdb8a80: sub rsp, 0x88
0xdb8a87: mov rdi, r8
0xdb8a8a: mov r14, rcx
0xdb8a8d: mov rax, qword ptr [rcx + 8]
0xdb8a91: mov r10, qword ptr [rax + 0x58]
0xdb8a95: cmp byte ptr [r10 + 0x3133d], 0
0xdb8a9d: jne 0x140db8ac3
0xdb8a9f: vmovups xmm0, xmmword ptr [r8]
0xdb8aa4: vmovups xmmword ptr [rbp - 0x19], xmm0
0xdb8aa9: mov rax, qword ptr [rcx]
0xdb8aac: mov byte ptr [rsp + 0x20], 0
0xdb8ab1: lea r8, [rbp - 0x19]
0xdb8ab5: call qword ptr [rax + 0x560]
0xdb8abb: cmp al, 1
0xdb8abd: je 0x140db9775
0xdb8ac3: mov rax, qword ptr [r14]
0xdb8ac6: lea r9, [rbp + 0x7f]
0xdb8aca: mov r8, rdi
0xdb8acd: lea rdx, [rbp + 0x6f]
0xdb8ad1: mov rcx, r14
0xdb8ad4: call qword ptr [rax + 0x548]
0xdb8ada: mov r12, rax
0xdb8add: mov qword ptr [rbp - 0x31], rax
0xdb8ae1: test rax, rax
0xdb8ae4: je 0x140db9775
0xdb8aea: mov ebx, dword ptr [rax + 0x1c0]
0xdb8af0: lea rcx, [rbp + 0x6f]
0xdb8af4: call 0x140537250
0xdb8af9: mov r11d, dword ptr [rax]
0xdb8afc: mov dword ptr [rbp - 0x39], r11d
0xdb8b00: xor esi, esi
0xdb8b02: cmp dword ptr [r14 + 0x19c], esi
0xdb8b09: je 0x140db8b77
0xdb8b0b: mov ecx, dword ptr [r14 + 0x198]
0xdb8b12: test ecx, ecx
0xdb8b14: je 0x140db8b77
0xdb8b16: xor edx, edx
0xdb8b18: mov eax, r11d
0xdb8b1b: div ecx
0xdb8b1d: mov r8d, edx
0xdb8b20: shl r8, 8
0xdb8b24: add r8, qword ptr [r14 + 0x1a8]
0xdb8b2b: mov edx, esi
0xdb8b2d: mov r10d, dword ptr [r8]
0xdb8b30: test r10d, r10d
0xdb8b33: je 0x140db8b77
0xdb8b35: mov eax, edx
0xdb8b37: cmp dword ptr [r8 + rax*8 + 8], r11d
0xdb8b3c: jne 0x140db8b54
0xdb8b3e: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb8b43: mov rax, qword ptr [r14 + 0x1b0]
0xdb8b4a: mov r9, qword ptr [rax + rcx*8]
0xdb8b4e: cmp dword ptr [r9 + 4], r11d
0xdb8b52: je 0x140db8b5d
0xdb8b54: inc edx
0xdb8b56: cmp edx, r10d
0xdb8b59: jb 0x140db8b35
0xdb8b5b: jmp 0x140db8b77
0xdb8b5d: lea rcx, [r9 + 8]
0xdb8b61: test rcx, rcx
0xdb8b64: je 0x140db8b77
0xdb8b66: mov rdx, rdi
0xdb8b69: call 0x140de4500
0xdb8b6e: test rax, rax
0xdb8b71: jne 0x140db9775
0xdb8b77: lea rcx, [rbp + 0x6f]
0xdb8b7b: call 0x140537250
0xdb8b80: mov ecx, dword ptr [rax + 0x2c]
0xdb8b83: add ecx, -0x19
0xdb8b86: cmp ecx, 0x4f
0xdb8b89: ja 0x140db8e9f
0xdb8b8f: lea rdx, [rip - 0xdb8b96]
0xdb8b96: movzx eax, byte ptr [rdx + rcx + 0xdb97a4]
0xdb8b9e: mov ecx, dword ptr [rdx + rax*4 + 0xdb978c]
0xdb8ba5: add rcx, rdx
0xdb8ba8: jmp rcx
0xdb8baa: mov rcx, qword ptr [r14 + 0x5b8]
0xdb8bb1: test rcx, rcx
0xdb8bb4: je 0x140db8e9f
0xdb8bba: mov rax, qword ptr [r12 + 8]
0xdb8bbf: cmp qword ptr [rcx + 8], rax
0xdb8bc3: jne 0x140db8e9f
0xdb8bc9: mov qword ptr [r14 + 0x5b8], rsi
0xdb8bd0: mov byte ptr [r14 + 0xad0], sil
0xdb8bd7: jmp 0x140db8e9f
0xdb8bdc: movzx eax, word ptr [r12 + 0xdc]
0xdb8be5: mov word ptr [rbp + 0x67], ax
0xdb8be9: lea rcx, [rbp + 0x67]
0xdb8bed: call 0x140430280
0xdb8bf2: mov edx, dword ptr [r14 + 0x4e0]
0xdb8bf9: mov edi, esi
0xdb8bfb: test edx, edx
0xdb8bfd: je 0x140db8c22
0xdb8bff: mov r8, qword ptr [r14 + 0x4d8]
0xdb8c06: mov r9d, dword ptr [rax + 0x14]
0xdb8c0a: nop word ptr [rax + rax]
0xdb8c10: mov eax, edi
0xdb8c12: lea rcx, [rax + rax*4]
0xdb8c16: cmp dword ptr [r8 + rcx*8], r9d
0xdb8c1a: je 0x140db8c30
0xdb8c1c: inc edi
0xdb8c1e: cmp edi, edx
0xdb8c20: jb 0x140db8c10
0xdb8c22: xor dl, dl
0xdb8c24: mov byte ptr [r14 + 0xadd], dl
0xdb8c2b: jmp 0x140db8e9f
0xdb8c30: xor dl, dl
0xdb8c32: cmp edi, -1
0xdb8c35: je 0x140db8c24
0xdb8c37: mov r11d, edi
0xdb8c3a: lea r15, [r11 + r11*4]
0xdb8c3e: mov rax, qword ptr [r14 + 0x4d8]
0xdb8c45: lea r8, [rax + r15*8]
0xdb8c49: mov eax, dword ptr [r8 + 0x10]
0xdb8c4d: test eax, eax
0xdb8c4f: jne 0x140db8cb6
0xdb8c51: cmp dword ptr [r8 + 0x20], esi
0xdb8c55: jne 0x140db8cb6
0xdb8c57: mov rcx, r8
0xdb8c5a: call 0x140db7280
0xdb8c5f: mov eax, dword ptr [r14 + 0x4e0]
0xdb8c66: dec eax
0xdb8c68: cmp edi, eax
0xdb8c6a: jae 0x140db8ca1
0xdb8c6c: mov r8, qword ptr [r14 + 0x4d8]
0xdb8c73: lea rcx, [rax + rax*4]
0xdb8c77: lea rdx, [r8 + rcx*8]
0xdb8c7b: lea rcx, [r8 + r15*8]
0xdb8c7f: call 0x140de59e0
0xdb8c84: mov eax, dword ptr [r14 + 0x4e0]
0xdb8c8b: dec eax
0xdb8c8d: lea rcx, [rax + rax*4]
0xdb8c91: mov rax, qword ptr [r14 + 0x4d8]
0xdb8c98: lea rcx, [rax + rcx*8]
0xdb8c9c: call 0x140db7280
0xdb8ca1: dec dword ptr [r14 + 0x4e0]
0xdb8ca8: xor dl, dl
0xdb8caa: mov byte ptr [r14 + 0xadd], dl
0xdb8cb1: jmp 0x140db8e9f
0xdb8cb6: mov r8, qword ptr [r8 + 8]
0xdb8cba: lea rcx, [rax + rax*2]
0xdb8cbe: lea r10, [r8 + rcx*8]
0xdb8cc2: cmp r8, r10
0xdb8cc5: je 0x140db8d15
0xdb8cc7: nop word ptr [rax + rax]
0xdb8cd0: mov eax, dword ptr [r8 + 0x10]
0xdb8cd4: mov ecx, esi
0xdb8cd6: xor dl, dl
0xdb8cd8: test eax, eax
0xdb8cda: je 0x140db8cf0
0xdb8cdc: mov r9, qword ptr [r8 + 8]
0xdb8ce0: mov edx, ecx
0xdb8ce2: cmp qword ptr [r9 + rdx*8], r12
0xdb8ce6: je 0x140db8cfb
0xdb8ce8: inc ecx
0xdb8cea: cmp ecx, eax
0xdb8cec: jb 0x140db8ce0
0xdb8cee: xor dl, dl
0xdb8cf0: add r8, 0x18
0xdb8cf4: cmp r8, r10
0xdb8cf7: jne 0x140db8cd0
0xdb8cf9: jmp 0x140db8d15
0xdb8cfb: dec eax
0xdb8cfd: cmp ecx, eax
0xdb8cff: jae 0x140db8d0f
0xdb8d01: mov eax, dword ptr [r8 + 0x10]
0xdb8d05: dec eax
0xdb8d07: mov rcx, qword ptr [r9 + rax*8]
0xdb8d0b: mov qword ptr [r9 + rdx*8], rcx
0xdb8d0f: dec dword ptr [r8 + 0x10]
0xdb8d13: mov dl, 1
0xdb8d15: mov r9, qword ptr [r14 + 0x4d8]
0xdb8d1c: lea r10, [r11 + r11*4]
0xdb8d20: mov eax, esi
0xdb8d22: mov ecx, dword ptr [r9 + r10*8 + 0x20]
0xdb8d27: test ecx, ecx
0xdb8d29: je 0x140db8c24
0xdb8d2f: mov r10, qword ptr [r9 + r10*8 + 0x18]
0xdb8d34: mov r8d, eax
0xdb8d37: cmp r12, qword ptr [r10 + r8*8]
0xdb8d3b: je 0x140db8d4f
0xdb8d3d: inc eax
0xdb8d3f: cmp eax, ecx
0xdb8d41: jb 0x140db8d34
0xdb8d43: mov byte ptr [r14 + 0xadd], dl
0xdb8d4a: jmp 0x140db8e9f
0xdb8d4f: cmp eax, -1
0xdb8d52: je 0x140db8c24
0xdb8d58: lea rdx, [r11 + r11*4]
0xdb8d5c: dec ecx
0xdb8d5e: cmp eax, ecx
0xdb8d60: jae 0x140db8d6f
0xdb8d62: mov rax, qword ptr [r9 + rdx*8 + 0x18]
0xdb8d67: mov rcx, qword ptr [rax + rcx*8]
0xdb8d6b: mov qword ptr [r10 + r8*8], rcx
0xdb8d6f: dec dword ptr [r9 + rdx*8 + 0x20]
0xdb8d74: mov dl, 1
0xdb8d76: mov byte ptr [r14 + 0xadd], dl
0xdb8d7d: jmp 0x140db8e9f
0xdb8d82: mov byte ptr [r14 + 0x801], 1
0xdb8d8a: jmp 0x140db8e9f
0xdb8d8f: mov ecx, esi
0xdb8d91: lea rdi, [r14 + 0x1f8]
0xdb8d98: mov r15d, dword ptr [rdi + 4]
0xdb8d9c: test r15d, r15d
0xdb8d9f: jne 0x140db8db5
0xdb8da1: mov rdi, rsi
0xdb8da4: mov r8, rsi
0xdb8da7: mov r10d, 0xffffffff
0xdb8dad: mov r13d, r10d
0xdb8db0: mov r15d, r10d
0xdb8db3: jmp 0x140db8dc3
0xdb8db5: mov rax, qword ptr [rdi + 0x18]
0xdb8db9: mov r8, qword ptr [rax]
0xdb8dbc: mov r10d, esi
0xdb8dbf: mov r13d, dword ptr [rdi + 0xc]
0xdb8dc3: test r8, r8
0xdb8dc6: je 0x140db8e29
0xdb8dc8: cmp dword ptr [rdi + 0xc], r13d
0xdb8dcc: jne 0x140db8e29
0xdb8dce: mov r11, qword ptr [r8 + 8]
0xdb8dd2: mov r9d, dword ptr [r8 + 0x10]
0xdb8dd6: mov edx, esi
0xdb8dd8: test r9d, r9d
0xdb8ddb: je 0x140db8e12
0xdb8ddd: mov rax, r11
0xdb8de0: cmp qword ptr [rax], r12
0xdb8de3: je 0x140db8df2
0xdb8de5: inc edx
0xdb8de7: add rax, 8
0xdb8deb: cmp edx, r9d
0xdb8dee: jb 0x140db8de0
0xdb8df0: jmp 0x140db8e12
0xdb8df2: cmp edx, -1
0xdb8df5: je 0x140db8e12
0xdb8df7: dec r9d
0xdb8dfa: cmp edx, r9d
0xdb8dfd: jae 0x140db8e07
0xdb8dff: mov rax, qword ptr [r11 + r9*8]
0xdb8e03: mov qword ptr [r11 + rdx*8], rax
0xdb8e07: sub dword ptr [r8 + 0x10], 1
0xdb8e0c: jne 0x140db8e12
0xdb8e0e: mov ecx, dword ptr [r8 + 4]
0xdb8e12: inc r10d
0xdb8e15: cmp r10d, r15d
0xdb8e18: jae 0x140db8e24
0xdb8e1a: mov rax, qword ptr [rdi + 0x18]
0xdb8e1e: mov r8, qword ptr [rax + r10*8]
0xdb8e22: jmp 0x140db8dc3
0xdb8e24: mov r8, rsi
0xdb8e27: jmp 0x140db8dc3
0xdb8e29: test ecx, ecx
0xdb8e2b: je 0x140db8e9f
0xdb8e2d: lea r10, [r14 + 0x1f8]
0xdb8e34: cmp dword ptr [r10 + 4], esi
0xdb8e38: je 0x140db8e9f
0xdb8e3a: inc dword ptr [r10 + 0xc]
0xdb8e3e: mov r8d, dword ptr [r10]
0xdb8e41: test r8d, r8d
0xdb8e44: je 0x140db8e9f
0xdb8e46: xor edx, edx
0xdb8e48: mov eax, ecx
0xdb8e4a: div r8d
0xdb8e4d: mov r9d, edx
0xdb8e50: shl r9, 8
0xdb8e54: add r9, qword ptr [r10 + 0x10]
0xdb8e58: mov r8d, esi
0xdb8e5b: mov edi, dword ptr [r9]
0xdb8e5e: test edi, edi
0xdb8e60: je 0x140db8e9f
0xdb8e62: mov eax, r8d
0xdb8e65: cmp dword ptr [r9 + rax*8 + 8], ecx
0xdb8e6a: jne 0x140db8e7e
0xdb8e6c: mov r11d, dword ptr [r9 + rax*8 + 0xc]
0xdb8e71: mov rax, qword ptr [r10 + 0x18]
0xdb8e75: mov rdx, qword ptr [rax + r11*8]
0xdb8e79: cmp dword ptr [rdx + 4], ecx
0xdb8e7c: je 0x140db8e88
0xdb8e7e: inc r8d
0xdb8e81: cmp r8d, edi
0xdb8e84: jb 0x140db8e62
0xdb8e86: jmp 0x140db8e9f
0xdb8e88: mov edx, r11d
0xdb8e8b: mov rcx, r10
0xdb8e8e: call 0x140465c80
0xdb8e93: jmp 0x140db8e9f
0xdb8e95: mov dl, 1
0xdb8e97: mov rcx, r14
0xdb8e9a: call 0x140dc35c0
0xdb8e9f: mov r13, qword ptr [r12 + 8]
0xdb8ea4: test r13, r13
0xdb8ea7: je 0x140db9775
0xdb8ead: lea rcx, [r12 + 0xde]
0xdb8eb5: call 0x140537250
0xdb8eba: cmp byte ptr [rax + 0xb5], sil
0xdb8ec1: je 0x140db8f11
0xdb8ec3: mov ecx, esi
0xdb8ec5: mov eax, dword ptr [r14 + 0x500]
0xdb8ecc: test eax, eax
0xdb8ece: je 0x140db8f11
0xdb8ed0: mov r8, qword ptr [r14 + 0x4f8]
0xdb8ed7: mov edx, ecx
0xdb8ed9: cmp r12, qword ptr [r8 + rdx*8]
0xdb8edd: je 0x140db8ee7
0xdb8edf: inc ecx
0xdb8ee1: cmp ecx, eax
0xdb8ee3: jb 0x140db8ed7
0xdb8ee5: jmp 0x140db8f11
0xdb8ee7: cmp ecx, -1
0xdb8eea: je 0x140db8f11
0xdb8eec: mov eax, dword ptr [r14 + 0x500]
0xdb8ef3: dec eax
0xdb8ef5: cmp ecx, eax
0xdb8ef7: jae 0x140db8f0a
0xdb8ef9: mov ecx, eax
0xdb8efb: mov rax, qword ptr [r14 + 0x4f8]
0xdb8f02: mov rcx, qword ptr [rax + rcx*8]
0xdb8f06: mov qword ptr [r8 + rdx*8], rcx
0xdb8f0a: dec dword ptr [r14 + 0x500]
0xdb8f11: lea rcx, [r12 + 0xde]
0xdb8f19: call 0x140537250
0xdb8f1e: cmp dword ptr [rax + 0x2c], 0x4e
0xdb8f22: jne 0x140db8ffc
0xdb8f28: lea rax, [rbp + 7]
0xdb8f2c: mov qword ptr [rbp - 9], rax
0xdb8f30: mov dword ptr [rbp - 1], esi
0xdb8f33: mov dword ptr [rbp + 3], 2
0xdb8f3a: mov edx, dword ptr [rbp - 1]
0xdb8f3d: mov ecx, dword ptr [rip + 0x5f11395]
0xdb8f43: mov rax, qword ptr [rbp - 9]
0xdb8f47: mov dword ptr [rax + rdx*4], ecx
0xdb8f4a: mov eax, dword ptr [rbp - 1]
0xdb8f4d: inc eax
0xdb8f4f: mov dword ptr [rbp - 1], eax
0xdb8f52: cmp eax, dword ptr [rbp + 3]
0xdb8f55: jb 0x140db8f65
0xdb8f57: xor edx, edx
0xdb8f59: lea rcx, [rbp - 9]
0xdb8f5d: call 0x14038f1e0
0xdb8f62: mov eax, dword ptr [rbp - 1]
0xdb8f65: mov edx, eax
0xdb8f67: mov ecx, dword ptr [rip + 0x5f0fb4b]
0xdb8f6d: mov rax, qword ptr [rbp - 9]
0xdb8f71: mov dword ptr [rax + rdx*4], ecx
0xdb8f74: mov ecx, dword ptr [rbp - 1]
0xdb8f77: inc ecx
0xdb8f79: mov dword ptr [rbp - 1], ecx
0xdb8f7c: mov rdi, qword ptr [r12 + 0x60]
0xdb8f81: mov eax, dword ptr [r12 + 0x68]
0xdb8f86: lea r15, [rdi + rax*8]
0xdb8f8a: cmp rdi, r15
0xdb8f8d: je 0x140db8fc5
0xdb8f8f: nop 
0xdb8f90: mov rax, qword ptr [rbp - 9]
0xdb8f94: mov qword ptr [rbp - 0x19], rax
0xdb8f98: mov dword ptr [rbp - 0x11], ecx
0xdb8f9b: mov qword ptr [rbp - 0x21], rsi
0xdb8f9f: mov qword ptr [rbp - 0x29], rsi
0xdb8fa3: mov rcx, qword ptr [rdi]
0xdb8fa6: lea r8, [rbp - 0x19]
0xdb8faa: lea rdx, [rbp - 0x29]
0xdb8fae: mov rcx, qword ptr [rcx + 0x20]
0xdb8fb2: call 0x1435ca4f0
0xdb8fb7: add rdi, 8
0xdb8fbb: cmp rdi, r15
0xdb8fbe: je 0x140db8fc5
0xdb8fc0: mov ecx, dword ptr [rbp - 1]
0xdb8fc3: jmp 0x140db8f90
0xdb8fc5: lea rax, [rbp + 7]
0xdb8fc9: mov rcx, qword ptr [rbp - 9]
0xdb8fcd: cmp rcx, rax
0xdb8fd0: je 0x140db8ffc
0xdb8fd2: test rcx, rcx
0xdb8fd5: je 0x140db8ffc
0xdb8fd7: mov r8d, 0x1fd
0xdb8fdd: mov rax, qword ptr gs:[0x58]
0xdb8fe6: mov rdx, qword ptr [rax]
0xdb8fe9: cmp byte ptr [r8 + rdx], 0
0xdb8fee: je 0x140db8ff7
0xdb8ff0: call 0x1447f03bc
0xdb8ff5: jmp 0x140db8ffc
0xdb8ff7: call 0x1447f02bc
0xdb8ffc: mov rax, qword ptr [r12 + 8]
0xdb9001: mov rcx, qword ptr [rax + 0x20]
0xdb9005: mov byte ptr [rbp + 0x67], 0x53
0xdb9009: lea rdx, [rbp + 0x67]
0xdb900d: call 0x1435c9320
0xdb9012: mov rcx, qword ptr [r12 + 0x260]
0xdb901a: test rcx, rcx
0xdb901d: je 0x140db9030
0xdb901f: mov byte ptr [rbp + 0x67], 0x26
0xdb9023: lea rdx, [rbp + 0x67]
0xdb9027: mov rcx, qword ptr [rcx + 0x20]
0xdb902b: call 0x1435c9320
0xdb9030: mov rdx, r12
0xdb9033: mov rcx, r14
0xdb9036: call 0x140df04f0
0xdb903b: mov rax, qword ptr [r14 + 0x5c0]
0xdb9042: test rax, rax
0xdb9045: je 0x140db9110
0xdb904b: cmp qword ptr [rax + 8], r13
0xdb904f: jne 0x140db9110
0xdb9055: mov rdi, qword ptr [r14 + 0x348]
0xdb905c: mov eax, dword ptr [r14 + 0x350]
0xdb9063: lea r12, [rdi + rax*8]
0xdb9067: cmp rdi, r12
0xdb906a: je 0x140db90b3
0xdb906c: nop dword ptr [rax]
0xdb9070: mov rax, qword ptr [rdi]
0xdb9073: mov r15, qword ptr [rax + 0x20]
0xdb9077: mov rax, qword ptr [r15]
0xdb907a: mov rcx, qword ptr [rax + 0xa0]
0xdb9081: test rcx, rcx
0xdb9084: je 0x140db908d
0xdb9086: cmp qword ptr [rcx + 8], 0
0xdb908b: jne 0x140db90aa
0xdb908d: lea rdx, [rip + 0x5f0f8c4]
0xdb9094: mov rcx, qword ptr [r15 + 8]
0xdb9098: call 0x1435ca140
0xdb909d: cmp eax, -1
0xdb90a0: je 0x140db90aa
0xdb90a2: mov rcx, r15
0xdb90a5: call 0x1435c66a0
0xdb90aa: add rdi, 8
0xdb90ae: cmp rdi, r12
0xdb90b1: jne 0x140db9070
0xdb90b3: mov r9, qword ptr [r14 + 0x5c8]
0xdb90ba: mov r8, qword ptr [r14 + 0x5c0]
0xdb90c1: xor edx, edx
0xdb90c3: mov rcx, r14
0xdb90c6: call 0x140d93e20
0xdb90cb: mov dword ptr [r14 + 0xab8], esi
0xdb90d2: mov rdi, qword ptr [r14 + 0x5c0]
0xdb90d9: mov rcx, rdi
0xdb90dc: call 0x140d8c400
0xdb90e1: test al, al
0xdb90e3: jne 0x140db90f8
0xdb90e5: mov rcx, qword ptr [rdi + 8]
0xdb90e9: call 0x143edd6b0
0xdb90ee: test rax, rax
0xdb90f1: je 0x140db9102
0xdb90f3: cmp byte ptr [rax], 0
0xdb90f6: je 0x140db9102
0xdb90f8: xor edx, edx
0xdb90fa: mov rcx, r14
0xdb90fd: call 0x140dba3f0
0xdb9102: mov qword ptr [r14 + 0x5c0], rsi
0xdb9109: mov qword ptr [r14 + 0x5c8], rsi
0xdb9110: mov rax, qword ptr gs:[0x58]
0xdb9119: mov rdx, qword ptr [rax]
0xdb911c: mov eax, 0x1ec
0xdb9121: mov rcx, qword ptr [rip + 0x5fb0400]
0xdb9128: cmp byte ptr [rax + rdx], 0
0xdb912c: cmovne rcx, qword ptr [rip + 0x5fb03fc]
0xdb9134: mov rax, qword ptr [rcx]
0xdb9137: mov rcx, qword ptr [rax + 8]
0xdb913b: mov r15, qword ptr [rcx + 0x270]
0xdb9142: lea rcx, [rbp + 0x6f]
0xdb9146: call 0x140537250
0xdb914b: cmp byte ptr [rax + 0xae], 0
0xdb9152: je 0x140db9158
0xdb9154: mov eax, esi
0xdb9156: jmp 0x140db91bf
0xdb9158: lea rcx, [rbp + 0x6f]
0xdb915c: call 0x140537250
0xdb9161: mov rdi, rax
0xdb9164: lea rcx, [r15 + 0xea]
0xdb916b: call 0x140537250
0xdb9170: mov ecx, dword ptr [rax]
0xdb9172: cmp dword ptr [rdi], ecx
0xdb9174: je 0x140db91ba
0xdb9176: lea rcx, [rbp + 0x6f]
0xdb917a: call 0x140537250
0xdb917f: mov rdi, rax
0xdb9182: lea rcx, [r15 + 0x16c]
0xdb9189: call 0x140537250
0xdb918e: mov ecx, dword ptr [rax]
0xdb9190: cmp dword ptr [rdi], ecx
0xdb9192: je 0x140db91ba
0xdb9194: lea rcx, [rbp + 0x6f]
0xdb9198: call 0x140537250
0xdb919d: mov rdi, rax
0xdb91a0: lea rcx, [r15 + 0xd6]
0xdb91a7: call 0x140537250
0xdb91ac: mov ecx, dword ptr [rax]
0xdb91ae: cmp dword ptr [rdi], ecx
0xdb91b0: je 0x140db91ba
0xdb91b2: test ebx, ebx
0xdb91b4: je 0x140db925d
0xdb91ba: mov eax, 1
0xdb91bf: mov rdx, qword ptr [r14 + 0x600]
0xdb91c6: movzx r15d, byte ptr [r14 + 0xae8]
0xdb91ce: cmp dword ptr [rdx + 0x108], eax
0xdb91d4: jbe 0x140db925d
0xdb91da: cmp dword ptr [rdx + 0x118], eax
0xdb91e0: jbe 0x140db925d
0xdb91e2: mov ecx, eax
0xdb91e4: mov rax, qword ptr [rdx + 0x100]
0xdb91eb: mov rdi, qword ptr [rax + rcx*8]
0xdb91ef: mov rax, qword ptr [rdx + 0x110]
0xdb91f6: mov r12, qword ptr [rax + rcx*8]
0xdb91fa: mov r8, qword ptr [rbp + 0x77]
0xdb91fe: lea rdx, [rbp + 0x6f]
0xdb9202: mov rcx, r12
0xdb9205: call 0x140d88a30
0xdb920a: test al, al
0xdb920c: je 0x140db925d
0xdb920e: test r15b, r15b
0xdb9211: je 0x140db921c
0xdb9213: mov byte ptr [rdi + 0x179], 1
0xdb921a: jmp 0x140db925d
0xdb921c: mov qword ptr [rdi + 0x160], r12
0xdb9223: mov rcx, rdi
0xdb9226: call 0x140ce7ea0
0xdb922b: mov rax, qword ptr [rdi]
0xdb922e: mov edx, dword ptr [rdi + 0x170]
0xdb9234: mov rcx, rdi
0xdb9237: call qword ptr [rax + 0x580]
0xdb923d: mov rax, qword ptr [rdi]
0xdb9240: mov rcx, rdi
0xdb9243: call qword ptr [rax + 0x550]
0xdb9249: mov rax, qword ptr [rdi]
0xdb924c: mov rcx, rdi
0xdb924f: call qword ptr [rax + 0x548]
0xdb9255: mov rcx, rdi
0xdb9258: call 0x140ce92d0
0xdb925d: mov rdi, qword ptr [rbp - 0x31]
0xdb9261: mov rdx, rdi
0xdb9264: mov rcx, r14
0xdb9267: call 0x140dd01c0
0xdb926c: mov r15d, 0xffffffff
0xdb9272: cmp dword ptr [r14 + 0x1bc], 0
0xdb927a: je 0x140db939a
0xdb9280: mov ecx, dword ptr [r14 + 0x1b8]
0xdb9287: test ecx, ecx
0xdb9289: je 0x140db939a
0xdb928f: xor edx, edx
0xdb9291: mov eax, ebx
0xdb9293: div ecx
0xdb9295: mov r8d, edx
0xdb9298: shl r8, 8
0xdb929c: add r8, qword ptr [r14 + 0x1c8]
0xdb92a3: mov edx, esi
0xdb92a5: mov r10d, dword ptr [r8]
0xdb92a8: test r10d, r10d
0xdb92ab: je 0x140db939a
0xdb92b1: mov eax, edx
0xdb92b3: cmp dword ptr [r8 + rax*8 + 8], ebx
0xdb92b8: jne 0x140db92d0
0xdb92ba: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb92bf: mov rax, qword ptr [r14 + 0x1d0]
0xdb92c6: mov r9, qword ptr [rax + rcx*8]
0xdb92ca: cmp dword ptr [r9 + 4], ebx
0xdb92ce: je 0x140db92dc
0xdb92d0: inc edx
0xdb92d2: cmp edx, r10d
0xdb92d5: jb 0x140db92b1
0xdb92d7: jmp 0x140db939a
0xdb92dc: lea r8, [r9 + 8]
0xdb92e0: test r8, r8
0xdb92e3: je 0x140db939a
0xdb92e9: test ebx, ebx
0xdb92eb: je 0x140db939a
0xdb92f1: mov rax, qword ptr [r8]
0xdb92f4: mov edx, dword ptr [r8 + 8]
0xdb92f8: mov ecx, esi
0xdb92fa: test edx, edx
0xdb92fc: je 0x140db930f
0xdb92fe: nop 
0xdb9300: cmp qword ptr [rax], rdi
0xdb9303: je 0x140db9312
0xdb9305: inc ecx
0xdb9307: add rax, 8
0xdb930b: cmp ecx, edx
0xdb930d: jb 0x140db9300
0xdb930f: mov ecx, r15d
0xdb9312: lea eax, [rdx - 1]
0xdb9315: cmp ecx, eax
0xdb9317: jae 0x140db9324
0xdb9319: mov rdx, qword ptr [r8]
0xdb931c: mov rax, qword ptr [rdx + rax*8]
0xdb9320: mov qword ptr [rdx + rcx*8], rax
0xdb9324: sub dword ptr [r8 + 8], 1
0xdb9329: jne 0x140db938f
0xdb932b: lea r9, [r14 + 0x1b8]
0xdb9332: cmp dword ptr [r9 + 4], 0
0xdb9337: je 0x140db938f
0xdb9339: inc dword ptr [r9 + 0xc]
0xdb933d: mov ecx, dword ptr [r9]
0xdb9340: test ecx, ecx
0xdb9342: je 0x140db938f
0xdb9344: xor edx, edx
0xdb9346: mov eax, ebx
0xdb9348: div ecx
0xdb934a: mov r8d, edx
0xdb934d: shl r8, 8
0xdb9351: add r8, qword ptr [r9 + 0x10]
0xdb9355: mov edx, esi
0xdb9357: mov r11d, dword ptr [r8]
0xdb935a: test r11d, r11d
0xdb935d: je 0x140db938f
0xdb935f: nop 
0xdb9360: mov eax, edx
0xdb9362: cmp dword ptr [r8 + rax*8 + 8], ebx
0xdb9367: jne 0x140db937b
0xdb9369: mov r10d, dword ptr [r8 + rax*8 + 0xc]
0xdb936e: mov rax, qword ptr [r9 + 0x18]
0xdb9372: mov rcx, qword ptr [rax + r10*8]
0xdb9376: cmp dword ptr [rcx + 4], ebx
0xdb9379: je 0x140db9384
0xdb937b: inc edx
0xdb937d: cmp edx, r11d
0xdb9380: jb 0x140db9360
0xdb9382: jmp 0x140db938f
0xdb9384: mov edx, r10d
0xdb9387: mov rcx, r9
0xdb938a: call 0x140465c80
0xdb938f: mov rdx, rdi
0xdb9392: mov rcx, r14
0xdb9395: call 0x140df0b30
0xdb939a: cmp dword ptr [r14 + 0x15c], 0
0xdb93a2: je 0x140db93f8
0xdb93a4: mov ecx, dword ptr [r14 + 0x158]
0xdb93ab: test ecx, ecx
0xdb93ad: je 0x140db93f8
0xdb93af: xor edx, edx
0xdb93b1: mov r11d, dword ptr [rbp - 0x39]
0xdb93b5: mov eax, r11d
0xdb93b8: div ecx
0xdb93ba: mov r8d, edx
0xdb93bd: shl r8, 8
0xdb93c1: add r8, qword ptr [r14 + 0x168]
0xdb93c8: mov edx, esi
0xdb93ca: mov r10d, dword ptr [r8]
0xdb93cd: test r10d, r10d
0xdb93d0: je 0x140db93f8
0xdb93d2: mov eax, edx
0xdb93d4: cmp dword ptr [r8 + rax*8 + 8], r11d
0xdb93d9: jne 0x140db93f1
0xdb93db: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb93e0: mov rax, qword ptr [r14 + 0x170]
0xdb93e7: mov r9, qword ptr [rax + rcx*8]
0xdb93eb: cmp dword ptr [r9 + 4], r11d
0xdb93ef: je 0x140db943a
0xdb93f1: inc edx
0xdb93f3: cmp edx, r10d
0xdb93f6: jb 0x140db93d2
0xdb93f8: mov r12d, 4
0xdb93fe: mov rbx, rsi
0xdb9401: mov rax, qword ptr [rdi]
0xdb9404: mov rcx, rdi
0xdb9407: call qword ptr [rax + 0x518]
0xdb940d: cmp byte ptr [rip + 0x5ef2fd4], 0
0xdb9414: jne 0x140db947e
0xdb9416: mov rax, qword ptr [r14]
0xdb9419: mov rcx, r14
0xdb941c: call qword ptr [rax + 0x110]
0xdb9422: mov rcx, qword ptr [rax + 0x31200]
0xdb9429: mov qword ptr [rbp + 0x67], r13
0xdb942d: cmp byte ptr [r13 + 0x15], 0
0xdb9432: je 0x140db9449
0xdb9434: mov qword ptr [rbp + 0x67], rsi
0xdb9438: jmp 0x140db9466
0xdb943a: test r9, r9
0xdb943d: je 0x140db93f8
0xdb943f: lea rbx, [r9 + 8]
0xdb9443: lea r12, [r9 + 0xc]
0xdb9447: jmp 0x140db9401
0xdb9449: cmp byte ptr [r13 + 0x14], 0
0xdb944e: je 0x140db9457
0xdb9450: lock inc dword ptr [r13 + 0x10]
0xdb9455: jmp 0x140db9461
0xdb9457: mov eax, dword ptr [r13 + 0x10]
0xdb945b: inc eax
0xdb945d: mov dword ptr [r13 + 0x10], eax
0xdb9461: mov byte ptr [r13 + 0x16], 1
0xdb9466: lea rdx, [rbp + 0x67]
0xdb946a: call 0x143d2f610
0xdb946f: nop 
0xdb9470: lea rcx, [rbp + 0x67]
0xdb9474: call 0x14038ad90
0xdb9479: jmp 0x140db9519
0xdb947e: test byte ptr [r13 + 0x98], 2
0xdb9486: je 0x140db9511
0xdb948c: mov rax, qword ptr [r14]
0xdb948f: mov rcx, r14
0xdb9492: call qword ptr [rax + 0x110]
0xdb9498: mov rcx, qword ptr [rax + 0x31200]
0xdb949f: mov qword ptr [rbp + 0x67], r13
0xdb94a3: cmp byte ptr [r13 + 0x15], 0
0xdb94a8: je 0x140db94b0
0xdb94aa: mov qword ptr [rbp + 0x67], rsi
0xdb94ae: jmp 0x140db94cd
0xdb94b0: cmp byte ptr [r13 + 0x14], 0
0xdb94b5: je 0x140db94be
0xdb94b7: lock inc dword ptr [r13 + 0x10]
0xdb94bc: jmp 0x140db94c8
0xdb94be: mov eax, dword ptr [r13 + 0x10]
0xdb94c2: inc eax
0xdb94c4: mov dword ptr [r13 + 0x10], eax
0xdb94c8: mov byte ptr [r13 + 0x16], 1
0xdb94cd: lea rdx, [rbp + 0x67]
0xdb94d1: call 0x143d2f610
0xdb94d6: nop 
0xdb94d7: mov rcx, qword ptr [rbp + 0x67]
0xdb94db: test rcx, rcx
0xdb94de: je 0x140db9519
0xdb94e0: mov qword ptr [rbp + 0x67], rsi
0xdb94e4: cmp byte ptr [rcx + 0x14], 0
0xdb94e8: je 0x140db94f5
0xdb94ea: lock xadd dword ptr [rcx + 0x10], r15d
0xdb94f0: dec r15d
0xdb94f3: jmp 0x140db9500
0xdb94f5: mov r15d, dword ptr [rcx + 0x10]
0xdb94f9: dec r15d
0xdb94fc: mov dword ptr [rcx + 0x10], r15d
0xdb9500: test r15d, r15d
0xdb9503: jne 0x140db9519
0xdb9505: mov rax, qword ptr [rcx]
0xdb9508: mov edx, 1
0xdb950d: call qword ptr [rax]
0xdb950f: jmp 0x140db9519
0xdb9511: mov rcx, r13
0xdb9514: call 0x143ed59a0
0xdb9519: mov r13, qword ptr [rbp + 0x77]
0xdb951d: test rbx, rbx
0xdb9520: je 0x140db9761
0xdb9526: mov rdx, r13
0xdb9529: mov rcx, rbx
0xdb952c: call 0x140de45a0
0xdb9531: mov rax, qword ptr gs:[0x58]
0xdb953a: mov rcx, qword ptr [rax]
0xdb953d: mov eax, 0x1ec
0xdb9542: mov rdx, qword ptr [rip + 0x5faffdf]
0xdb9549: cmp byte ptr [rax + rcx], 0
0xdb954d: cmovne rdx, qword ptr [rip + 0x5faffdb]
0xdb9555: mov rax, qword ptr [rdx]
0xdb9558: mov rcx, qword ptr [rax + 8]
0xdb955c: mov rdi, qword ptr [rcx + 0x410]
0xdb9563: movzx r15d, byte ptr [r13 + 8]
0xdb9568: cmp r15b, 1
0xdb956c: jne 0x140db958f
0xdb956e: mov eax, dword ptr [r13]
0xdb9572: mov dword ptr [rbp + 0x67], eax
0xdb9575: lea rcx, [rbp + 0x67]
0xdb9579: call 0x140473f20
0xdb957e: mov r8d, dword ptr [rax]
0xdb9581: lea rdx, [rbp - 0x31]
0xdb9585: mov rcx, rdi
0xdb9588: call 0x14185b650
0xdb958d: jmp 0x140db95b1
0xdb958f: cmp dword ptr [rbx + 4], 0
0xdb9593: jne 0x140db972f
0xdb9599: lea rcx, [rbp + 0x6f]
0xdb959d: call 0x140537250
0xdb95a2: mov r8d, dword ptr [rax]
0xdb95a5: lea rdx, [rbp + 0x67]
0xdb95a9: mov rcx, rdi
0xdb95ac: call 0x14185b590
0xdb95b1: mov rbx, qword ptr [rax]
0xdb95b4: mov rax, rbx
0xdb95b7: mov qword ptr [rbp + 0x67], rbx
0xdb95bb: cmp ax, 0xffff
0xdb95bf: je 0x140db972f
0xdb95c5: lea rcx, [rbp + 0x6f]
0xdb95c9: call 0x140537250
0xdb95ce: movzx r10d, byte ptr [rax + 0xa8]
0xdb95d6: cmp r10b, 1
0xdb95da: je 0x140db95e2
0xdb95dc: cmp r10b, 3
0xdb95e0: jne 0x140db95e5
0xdb95e2: mov r10b, 2
0xdb95e5: mov r11, rsi
0xdb95e8: mov r8, qword ptr [r14 + 0xb90]
0xdb95ef: mov eax, dword ptr [r14 + 0xb98]
0xdb95f6: lea rcx, [rax + rax*4]
0xdb95fa: lea rdi, [r8 + rcx*8]
0xdb95fe: cmp r8, rdi
0xdb9601: je 0x140db972f
0xdb9607: cmp byte ptr [r8 + 0x20], r10b
0xdb960b: jne 0x140db963a
0xdb960d: mov rdx, qword ptr [r8]
0xdb9610: mov eax, dword ptr [r8 + 8]
0xdb9614: lea rcx, [rax + rax*2]
0xdb9618: lea r9, [rdx + rcx*8]
0xdb961c: cmp rdx, r9
0xdb961f: je 0x140db963a
0xdb9621: movzx ecx, bx
0xdb9624: movzx eax, word ptr [rdx + 0x10]
0xdb9628: cmp eax, ecx
0xdb962a: je 0x140db9637
0xdb962c: add rdx, 0x18
0xdb9630: cmp rdx, r9
0xdb9633: jne 0x140db9624
0xdb9635: jmp 0x140db963a
0xdb9637: mov r11, rdx
0xdb963a: add r8, 0x28
0xdb963e: cmp r8, rdi
0xdb9641: jne 0x140db9607
0xdb9643: test r11, r11
0xdb9646: je 0x140db972f
0xdb964c: mov eax, dword ptr [rbp + 0x6b]
0xdb964f: cmp dword ptr [r11 + 8], eax
0xdb9653: jbe 0x140db972f
0xdb9659: lea r8, [rax + rax*4]
0xdb965d: mov r9, qword ptr [r11]
0xdb9660: cmp r15b, 1
0xdb9664: jne 0x140db96b3
0xdb9666: mov eax, dword ptr [r13]
0xdb966a: mov ecx, dword ptr [r9 + r8*8 + 0x18]
0xdb966f: test ecx, ecx
0xdb9671: je 0x140db972f
0xdb9677: mov rdx, qword ptr [r9 + r8*8 + 0x10]
0xdb967c: nop dword ptr [rax]
0xdb9680: mov r10d, esi
0xdb9683: cmp eax, dword ptr [rdx + r10*4]
0xdb9687: je 0x140db9694
0xdb9689: inc esi
0xdb968b: cmp esi, ecx
0xdb968d: jb 0x140db9680
0xdb968f: jmp 0x140db972f
0xdb9694: cmp esi, -1
0xdb9697: je 0x140db972f
0xdb969d: lea eax, [rcx - 1]
0xdb96a0: cmp esi, eax
0xdb96a2: jae 0x140db96ab
0xdb96a4: mov ecx, dword ptr [rdx + rax*4]
0xdb96a7: mov dword ptr [rdx + r10*4], ecx
0xdb96ab: sub dword ptr [r9 + r8*8 + 0x18], 1
0xdb96b1: jmp 0x140db9700
0xdb96b3: mov ecx, dword ptr [r9 + r8*8 + 8]
0xdb96b8: test ecx, ecx
0xdb96ba: je 0x140db972f
0xdb96bc: mov r10, qword ptr [r9 + r8*8]
0xdb96c0: movzx r11d, word ptr [rbp + 0x6f]
0xdb96c5: nop word ptr [rax + rax]
0xdb96d0: mov edx, esi
0xdb96d2: movzx eax, word ptr [r10 + rdx*2]
0xdb96d7: cmp r11d, eax
0xdb96da: je 0x140db96e4
0xdb96dc: inc esi
0xdb96de: cmp esi, ecx
0xdb96e0: jb 0x140db96d0
0xdb96e2: jmp 0x140db972f
0xdb96e4: cmp esi, -1
0xdb96e7: je 0x140db972f
0xdb96e9: lea eax, [rcx - 1]
0xdb96ec: cmp esi, eax
0xdb96ee: jae 0x140db96fa
0xdb96f0: movzx ecx, word ptr [r10 + rax*2]
0xdb96f5: mov word ptr [r10 + rdx*2], cx
0xdb96fa: sub dword ptr [r9 + r8*8 + 8], 1
0xdb9700: sete al
0xdb9703: test al, al
0xdb9705: je 0x140db972f
0xdb9707: mov rax, qword ptr [r14 + 0xb10]
0xdb970e: mov rcx, qword ptr [rax + 8]
0xdb9712: movzx eax, byte ptr [rcx + 0xb0]
0xdb9719: and al, 0x60
0xdb971b: cmp al, 0x40
0xdb971d: jne 0x140db972f
0xdb971f: mov rcx, r14
0xdb9722: call 0x140dd3ee0
0xdb9727: mov rcx, r14
0xdb972a: call 0x140dd3950
0xdb972f: lea rcx, [rbp + 0x6f]
0xdb9733: call 0x140537250
0xdb9738: cmp dword ptr [rax + 0x2c], 0x25
0xdb973c: jne 0x140db9743
0xdb973e: xor r8d, r8d
0xdb9741: jmp 0x140db9755
0xdb9743: lea rcx, [rbp + 0x6f]
0xdb9747: call 0x140537250
0xdb974c: cmp dword ptr [rax + 0x2c], 0x66
0xdb9750: jne 0x140db9761
0xdb9752: mov r8b, 1
0xdb9755: mov edx, dword ptr [r12]
0xdb9759: mov rcx, r14
0xdb975c: call 0x140d92930
0xdb9761: cmp byte ptr [rip + 0x5ef4f10], 0
0xdb9768: je 0x140db9775
0xdb976a: mov rdx, r13
0xdb976d: mov rcx, r14
0xdb9770: call 0x140db8040
0xdb9775: add rsp, 0x88
0xdb977c: pop r15
0xdb977e: pop r14
0xdb9780: pop r13
0xdb9782: pop r12
0xdb9784: pop rdi
0xdb9785: pop rsi
0xdb9786: pop rbx
0xdb9787: pop rbp
0xdb9788: ret 
0xdb9789: nop dword ptr [rax]
vtable=0x5674e00 slot=0x548 target=0xdeffa0
0xdeffa0: mov qword ptr [rsp + 8], rbx
0xdeffa5: mov qword ptr [rsp + 0x10], rsi
0xdeffaa: push rdi
0xdeffab: sub rsp, 0x20
0xdeffaf: mov r10d, dword ptr [r9]
0xdeffb2: mov rdi, r8
0xdeffb5: mov rsi, rdx
0xdeffb8: mov rbx, rcx
0xdeffbb: test r10d, r10d
0xdeffbe: je 0x140df00a9
0xdeffc4: cmp dword ptr [rcx + 0x1bc], 0
0xdeffcb: je 0x140df001a
0xdeffcd: mov ecx, dword ptr [rcx + 0x1b8]
0xdeffd3: test ecx, ecx
0xdeffd5: je 0x140df001a
0xdeffd7: xor edx, edx
0xdeffd9: mov eax, r10d
0xdeffdc: div ecx
0xdeffde: mov r9d, edx
0xdeffe1: xor edx, edx
0xdeffe3: shl r9, 8
0xdeffe7: add r9, qword ptr [rbx + 0x1c8]
0xdeffee: mov r11d, dword ptr [r9]
0xdefff1: test r11d, r11d
0xdefff4: je 0x140df001a
0xdefff6: cmp dword ptr [r9 + rdx*8 + 8], r10d
0xdefffb: jne 0x140df0013
0xdefffd: mov ecx, dword ptr [r9 + rdx*8 + 0xc]
0xdf0002: mov rax, qword ptr [rbx + 0x1d0]
0xdf0009: mov r8, qword ptr [rax + rcx*8]
0xdf000d: cmp dword ptr [r8 + 4], r10d
0xdf0011: je 0x140df002c
0xdf0013: inc edx
0xdf0015: cmp edx, r11d
0xdf0018: jb 0x140defff6
0xdf001a: xor eax, eax
0xdf001c: mov rbx, qword ptr [rsp + 0x30]
0xdf0021: mov rsi, qword ptr [rsp + 0x38]
0xdf0026: add rsp, 0x20
0xdf002a: pop rdi
0xdf002b: ret 
0xdf002c: lea rcx, [r8 + 8]
0xdf0030: test rcx, rcx
0xdf0033: je 0x140df001a
0xdf0035: mov eax, dword ptr [rcx + 8]
0xdf0038: test eax, eax
0xdf003a: je 0x140df001a
0xdf003c: mov rcx, qword ptr [rcx]
0xdf003f: lea r8, [rcx + rax*8]
0xdf0043: cmp rcx, r8
0xdf0046: je 0x140df001a
0xdf0048: movzx r9d, word ptr [rsi]
0xdf004c: nop dword ptr [rax]
0xdf0050: mov rdx, qword ptr [rcx]
0xdf0053: cmp word ptr [rdx + 0xde], r9w
0xdf005b: jne 0x140df007b
0xdf005d: mov rax, qword ptr [rdx + 0xd0]
0xdf0064: vmovups xmm0, xmmword ptr [rdx + 0xc8]
0xdf006c: cmp al, byte ptr [rdi + 8]
0xdf006f: jne 0x140df007b
0xdf0071: vmovq rax, xmm0
0xdf0076: cmp rax, qword ptr [rdi]
0xdf0079: je 0x140df0096
0xdf007b: add rcx, 8
0xdf007f: cmp rcx, r8
0xdf0082: jne 0x140df0050
0xdf0084: xor eax, eax
0xdf0086: mov rbx, qword ptr [rsp + 0x30]
0xdf008b: mov rsi, qword ptr [rsp + 0x38]
0xdf0090: add rsp, 0x20
0xdf0094: pop rdi
0xdf0095: ret 
0xdf0096: mov rax, rdx
0xdf0099: mov rbx, qword ptr [rsp + 0x30]
0xdf009e: mov rsi, qword ptr [rsp + 0x38]
0xdf00a3: add rsp, 0x20
0xdf00a7: pop rdi
0xdf00a8: ret 
0xdf00a9: mov rcx, rsi
0xdf00ac: call 0x140537250
0xdf00b1: cmp dword ptr [rbx + 0x15c], 0
0xdf00b8: je 0x140df001a
0xdf00be: mov ecx, dword ptr [rbx + 0x158]
0xdf00c4: test ecx, ecx
0xdf00c6: je 0x140df001a
0xdf00cc: mov r9d, dword ptr [rax]
0xdf00cf: xor edx, edx
0xdf00d1: mov eax, r9d
0xdf00d4: div ecx
0xdf00d6: mov r10d, edx
0xdf00d9: xor edx, edx
0xdf00db: shl r10, 8
0xdf00df: add r10, qword ptr [rbx + 0x168]
0xdf00e6: mov r11d, dword ptr [r10]
0xdf00e9: test r11d, r11d
0xdf00ec: je 0x140df001a
0xdf00f2: cmp dword ptr [r10 + rdx*8 + 8], r9d
0xdf00f7: jne 0x140df010f
0xdf00f9: mov ecx, dword ptr [r10 + rdx*8 + 0xc]
0xdf00fe: mov rax, qword ptr [rbx + 0x170]
0xdf0105: mov r8, qword ptr [rax + rcx*8]
0xdf0109: cmp dword ptr [r8 + 4], r9d
0xdf010d: je 0x140df0128
0xdf010f: inc edx
0xdf0111: cmp edx, r11d
0xdf0114: jb 0x140df00f2
0xdf0116: xor eax, eax
0xdf0118: mov rbx, qword ptr [rsp + 0x30]
0xdf011d: mov rsi, qword ptr [rsp + 0x38]
0xdf0122: add rsp, 0x20
0xdf0126: pop rdi
0xdf0127: ret 
0xdf0128: lea rcx, [r8 + 8]
0xdf012c: test rcx, rcx
0xdf012f: je 0x140df001a
0xdf0135: cmp dword ptr [rcx + 4], 0
0xdf0139: je 0x140df001a
0xdf013f: mov rdx, rdi
0xdf0142: call 0x140de4500
0xdf0147: test rax, rax
0xdf014a: je 0x140df001a
0xdf0150: mov rax, qword ptr [rax]
0xdf0153: mov rbx, qword ptr [rsp + 0x30]
0xdf0158: mov rsi, qword ptr [rsp + 0x38]
0xdf015d: add rsp, 0x20
0xdf0161: pop rdi
0xdf0162: ret 
vtable=0x5674e00 slot=0x550 target=0xe08d70
0xe08d70: mov qword ptr [rsp + 0x18], rbx
0xe08d75: mov qword ptr [rsp + 0x10], rdx
0xe08d7a: push rbp
0xe08d7b: push rsi
0xe08d7c: push rdi
0xe08d7d: push r12
0xe08d7f: push r13
0xe08d81: push r14
0xe08d83: push r15
0xe08d85: lea rbp, [rsp - 7]
0xe08d8a: sub rsp, 0xc0
0xe08d91: mov r13, r9
0xe08d94: mov r15, r8
0xe08d97: mov r12, rdx
0xe08d9a: mov r14, rcx
0xe08d9d: mov rsi, qword ptr [rbp + 0x8f]
0xe08da4: xor edi, edi
0xe08da6: mov dword ptr [rbp - 0x49], edi
0xe08da9: mov rax, qword ptr [rcx]
0xe08dac: call qword ptr [rax + 0x548]
0xe08db2: test rax, rax
0xe08db5: jne 0x140e09079
0xe08dbb: mov rdx, qword ptr [rip + 0x5ea3676]
0xe08dc2: cmp dl, 1
0xe08dc5: jne 0x140e08efc
0xe08dcb: lea rax, [rip + 0x486714e]
0xe08dd2: mov qword ptr [rbp - 0x21], rax
0xe08dd6: lea rax, [rip + 0x4867163]
0xe08ddd: mov qword ptr [rbp - 0x21], rax
0xe08de1: mov eax, 0xffff
0xe08de6: mov word ptr [rbp - 0x19], ax
0xe08dea: mov qword ptr [rbp - 0x11], 0xffffffffffffffff
0xe08df2: mov byte ptr [rbp - 9], 0x15
0xe08df6: xor eax, eax
0xe08df8: mov dword ptr [rbp - 8], eax
0xe08dfb: mov word ptr [rbp - 4], ax
0xe08dff: mov byte ptr [rbp - 2], al
0xe08e02: mov dword ptr [rbp - 1], edi
0xe08e05: movzx eax, word ptr [r12]
0xe08e0a: mov word ptr [rbp - 0x19], ax
0xe08e0e: movzx eax, byte ptr [r15 + 8]
0xe08e13: mov byte ptr [rbp - 9], al
0xe08e16: mov rax, qword ptr [r15]
0xe08e19: mov qword ptr [rbp - 0x11], rax
0xe08e1d: mov eax, dword ptr [r13]
0xe08e21: mov dword ptr [rbp - 1], eax
0xe08e24: mov rax, qword ptr [r14]
0xe08e27: mov rcx, r14
0xe08e2a: call qword ptr [rax + 0x110]
0xe08e30: mov rcx, qword ptr [rax + 0xb0]
0xe08e37: mov qword ptr [rbp - 0x41], rdi
0xe08e3b: mov qword ptr [rbp - 0x39], rdi
0xe08e3f: mov qword ptr [rbp - 0x31], rdi
0xe08e43: mov word ptr [rbp - 0x29], di
0xe08e47: mov qword ptr [rbp - 0x41], r14
0xe08e4b: lea rax, [rip - 0x204a2]
0xe08e52: mov qword ptr [rbp - 0x39], rax
0xe08e56: mov byte ptr [rbp - 0x29], dil
0xe08e5a: mov ebx, 1
0xe08e5f: mov dword ptr [rbp - 0x49], ebx
0xe08e62: lea r9, [rbp - 0x41]
0xe08e66: lea r8, [rbp - 0x21]
0xe08e6a: lea rdx, [rip + 0x5ec8347]
0xe08e71: call 0x143d20740
0xe08e76: mov byte ptr [rbp + 0x47], al
0xe08e79: and ebx, 0xfffffffe
0xe08e7c: mov dword ptr [rbp - 0x49], ebx
0xe08e7f: cmp byte ptr [rbp - 0x28], dil
0xe08e83: je 0x140e08eb6
0xe08e85: mov rcx, qword ptr [rbp - 0x41]
0xe08e89: test rcx, rcx
0xe08e8c: je 0x140e08eb6
0xe08e8e: mov r8d, 0x1fd
0xe08e94: mov rax, qword ptr gs:[0x58]
0xe08e9d: mov rdx, qword ptr [rax]
0xe08ea0: cmp byte ptr [r8 + rdx], dil
0xe08ea4: je 0x140e08ead
0xe08ea6: call 0x1447f03bc
0xe08eab: jmp 0x140e08eb2
0xe08ead: call 0x1447f02bc
0xe08eb2: mov qword ptr [rbp - 0x41], rdi
0xe08eb6: mov byte ptr [rbp - 0x28], 0
0xe08eba: mov qword ptr [rbp - 0x41], rdi
0xe08ebe: mov qword ptr [rbp - 0x39], rdi
0xe08ec2: mov qword ptr [rbp - 0x31], rdi
0xe08ec6: mov byte ptr [rbp - 0x28], 0
0xe08eca: lea rcx, [rbp - 0x41]
0xe08ece: call 0x14035f1f0
0xe08ed3: nop 
0xe08ed4: cmp byte ptr [rbp + 0x47], 1
0xe08ed8: jne 0x140e08eea
0xe08eda: lea rax, [rip + 0x486703f]
0xe08ee1: mov qword ptr [rbp - 0x21], rax
0xe08ee5: jmp 0x140e09079
0xe08eea: lea rax, [rip + 0x486702f]
0xe08ef1: mov qword ptr [rbp - 0x21], rax
0xe08ef5: mov rdx, qword ptr [rip + 0x5ea353c]
0xe08efc: mov rbx, qword ptr [rbp + 0x7f]
0xe08f00: test rbx, rbx
0xe08f03: je 0x140e09079
0xe08f09: cmp byte ptr [rbx], 0
0xe08f0c: je 0x140e09079
0xe08f12: mov cl, 0xe
0xe08f14: mov r8d, dword ptr [rsi + 4]
0xe08f18: test r8d, r8d
0xe08f1b: je 0x140e08f4e
0xe08f1d: mov rax, qword ptr [rsi + 0x10]
0xe08f21: mov rcx, qword ptr [rax]
0xe08f24: mov eax, dword ptr [rcx + 0x14]
0xe08f27: mov r9, rsi
0xe08f2a: cmp dword ptr [rip + 0x5ec8290], eax
0xe08f30: mov eax, 0x10
0xe08f35: je 0x140e08f42
0xe08f37: mov rcx, rdi
0xe08f3a: movzx ecx, byte ptr [rcx]
0xe08f3d: add rax, rsi
0xe08f40: jmp 0x140e08f52
0xe08f42: add rcx, 0x10
0xe08f46: movzx ecx, byte ptr [rcx]
0xe08f49: add rax, r9
0xe08f4c: jmp 0x140e08f52
0xe08f4e: lea rax, [rsi + 0x10]
0xe08f52: cmp dl, 1
0xe08f55: jne 0x140e08fb2
0xe08f57: cmp cl, 0xd
0xe08f5a: je 0x140e08fb2
0xe08f5c: movzx eax, byte ptr [rbp + 0x97]
0xe08f63: mov byte ptr [rsp + 0x68], al
0xe08f67: mov qword ptr [rsp + 0x60], rsi
0xe08f6c: mov rax, qword ptr [rbp + 0x67]
0xe08f70: vmovss xmm0, dword ptr [rax]
0xe08f74: vmovss dword ptr [rsp + 0x58], xmm0
0xe08f7a: movzx eax, byte ptr [rbp + 0x87]
0xe08f81: mov byte ptr [rsp + 0x50], al
0xe08f85: mov qword ptr [rsp + 0x48], rbx
0xe08f8a: mov rax, qword ptr [rbp + 0x77]
0xe08f8e: mov qword ptr [rsp + 0x40], rax
0xe08f93: mov rax, qword ptr [rbp + 0x6f]
0xe08f97: mov qword ptr [rsp + 0x20], rax
0xe08f9c: mov r9, r13
0xe08f9f: mov r8, r15
0xe08fa2: mov rdx, r12
0xe08fa5: mov rcx, r14
0xe08fa8: call 0x140e0b470
0xe08fad: jmp 0x140e09079
0xe08fb2: mov dword ptr [rbp + 0x47], edi
0xe08fb5: test cl, cl
0xe08fb7: jne 0x140e08fda
0xe08fb9: cmp r8d, 1
0xe08fbd: jbe 0x140e08fd5
0xe08fbf: mov rax, qword ptr [rax]
0xe08fc2: mov rcx, qword ptr [rax + 8]
0xe08fc6: mov eax, dword ptr [rcx + 0x14]
0xe08fc9: cmp dword ptr [rip + 0x5ec81f9], eax
0xe08fcf: jne 0x140e08fd5
0xe08fd1: lea rdi, [rcx + 0x10]
0xe08fd5: mov eax, dword ptr [rdi]
0xe08fd7: mov dword ptr [rbp + 0x47], eax
0xe08fda: movzx eax, byte ptr [rbp + 0x97]
0xe08fe1: mov byte ptr [rsp + 0x58], al
0xe08fe5: lea rax, [rbp + 0x47]
0xe08fe9: mov qword ptr [rsp + 0x50], rax
0xe08fee: mov qword ptr [rsp + 0x48], rbx
0xe08ff3: mov rsi, qword ptr [rbp + 0x77]
0xe08ff7: mov qword ptr [rsp + 0x40], rsi
0xe08ffc: mov rax, qword ptr [r14 + 0x398]
0xe09003: mov qword ptr [rsp + 0x30], rax
0xe09008: mov rax, qword ptr [r14 + 0x390]
0xe0900f: mov qword ptr [rsp + 0x28], rax
0xe09014: mov r12, qword ptr [rbp + 0x6f]
0xe09018: mov qword ptr [rsp + 0x20], r12
0xe0901d: mov r9, r13
0xe09020: mov r8, r15
0xe09023: mov rdx, qword ptr [rbp + 0x4f]
0xe09027: mov rcx, r14
0xe0902a: call 0x140e0c2c0
0xe0902f: mov rdi, rax
0xe09032: test rax, rax
0xe09035: je 0x140e09079
0xe09037: movzx ecx, byte ptr [rbp + 0x87]
0xe0903e: mov byte ptr [rsp + 0x48], cl
0xe09042: mov qword ptr [rsp + 0x40], rbx
0xe09047: mov qword ptr [rsp + 0x38], rsi
0xe0904c: mov qword ptr [rsp + 0x30], r12
0xe09051: mov rcx, qword ptr [rbp + 0x67]
0xe09055: mov qword ptr [rsp + 0x28], rcx
0xe0905a: mov qword ptr [rsp + 0x20], r13
0xe0905f: mov r9, r15
0xe09062: mov r8, qword ptr [rbp + 0x4f]
0xe09066: mov rdx, rax
0xe09069: mov rcx, r14
0xe0906c: call 0x140e090a0
0xe09071: mov rdx, rdi
0xe09074: call 0x140df4f60
0xe09079: mov rbx, qword ptr [rsp + 0x110]
0xe09081: add rsp, 0xc0
0xe09088: pop r15
0xe0908a: pop r14
0xe0908c: pop r13
0xe0908e: pop r12
0xe09090: pop rdi
0xe09091: pop rsi
0xe09092: pop rbp
0xe09093: ret 
vtable=0x5674e00 slot=0x558 target=0xe09fc0
0xe09fc0: mov qword ptr [rsp + 8], rbx
0xe09fc5: mov qword ptr [rsp + 0x18], rsi
0xe09fca: mov dword ptr [rsp + 0x20], r9d
0xe09fcf: mov word ptr [rsp + 0x10], dx
0xe09fd4: push rdi
0xe09fd5: push r12
0xe09fd7: push r13
0xe09fd9: push r14
0xe09fdb: push r15
0xe09fdd: sub rsp, 0x80
0xe09fe4: mov r13, r8
0xe09fe7: mov r14, rcx
0xe09fea: mov eax, 0xffff
0xe09fef: cmp ax, dx
0xe09ff2: je 0x140e0ae03
0xe09ff8: vmovups xmm0, xmmword ptr [r8]
0xe09ffd: vmovups xmmword ptr [rsp + 0x40], xmm0
0xe0a003: mov rax, qword ptr [rcx]
0xe0a006: mov byte ptr [rsp + 0x20], 0
0xe0a00b: lea r8, [rsp + 0x40]
0xe0a010: call qword ptr [rax + 0x560]
0xe0a016: cmp al, 1
0xe0a018: je 0x140e0ae03
0xe0a01e: mov rax, qword ptr [r14]
0xe0a021: lea r9, [rsp + 0xc8]
0xe0a029: mov r8, r13
0xe0a02c: lea rdx, [rsp + 0xb8]
0xe0a034: mov rcx, r14
0xe0a037: call qword ptr [rax + 0x548]
0xe0a03d: mov rsi, rax
0xe0a040: test rax, rax
0xe0a043: je 0x140e0ae03
0xe0a049: mov ebx, dword ptr [rax + 0x1c0]
0xe0a04f: lea rcx, [rsp + 0xb8]
0xe0a057: call 0x140537250
0xe0a05c: cmp dword ptr [r14 + 0x19c], 0
0xe0a064: je 0x140e0a0d3
0xe0a066: mov r9d, dword ptr [rax]
0xe0a069: mov ecx, dword ptr [r14 + 0x198]
0xe0a070: test ecx, ecx
0xe0a072: je 0x140e0a0d3
0xe0a074: xor edx, edx
0xe0a076: mov eax, r9d
0xe0a079: div ecx
0xe0a07b: mov r8d, edx
0xe0a07e: shl r8, 8
0xe0a082: add r8, qword ptr [r14 + 0x1a8]
0xe0a089: xor edx, edx
0xe0a08b: mov r11d, dword ptr [r8]
0xe0a08e: test r11d, r11d
0xe0a091: je 0x140e0a0d3
0xe0a093: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xe0a098: jne 0x140e0a0b0
0xe0a09a: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe0a09f: mov rax, qword ptr [r14 + 0x1b0]
0xe0a0a6: mov r10, qword ptr [rax + rcx*8]
0xe0a0aa: cmp dword ptr [r10 + 4], r9d
0xe0a0ae: je 0x140e0a0b9
0xe0a0b0: inc edx
0xe0a0b2: cmp edx, r11d
0xe0a0b5: jb 0x140e0a093
0xe0a0b7: jmp 0x140e0a0d3
0xe0a0b9: lea rcx, [r10 + 8]
0xe0a0bd: test rcx, rcx
0xe0a0c0: je 0x140e0a0d3
0xe0a0c2: mov rdx, r13
0xe0a0c5: call 0x140de4500
0xe0a0ca: test rax, rax
0xe0a0cd: jne 0x140e0ae03
0xe0a0d3: lea rcx, [rsp + 0xb8]
0xe0a0db: call 0x140537250
0xe0a0e0: mov ecx, dword ptr [rax + 0x2c]
0xe0a0e3: add ecx, -0x17
0xe0a0e6: cmp ecx, 0x2c
0xe0a0e9: ja 0x140e0a5c0
0xe0a0ef: lea rdx, [rip - 0xe0a0f6]
0xe0a0f6: movzx eax, byte ptr [rdx + rcx + 0xe0ae38]
0xe0a0fe: mov ecx, dword ptr [rdx + rax*4 + 0xe0ae20]
0xe0a105: add rcx, rdx
0xe0a108: jmp rcx
0xe0a10a: mov rcx, qword ptr [r14 + 0x3e8]
0xe0a111: test rcx, rcx
0xe0a114: je 0x140e0a5c0
0xe0a11a: mov rax, qword ptr [rsi + 8]
0xe0a11e: cmp qword ptr [rcx + 8], rax
0xe0a122: jne 0x140e0a5c0
0xe0a128: mov qword ptr [r14 + 0x3e8], 0
0xe0a133: jmp 0x140e0a5c0
0xe0a138: test ebx, ebx
0xe0a13a: jne 0x140e0a5c0
0xe0a140: mov rax, qword ptr [r14 + 0x418]
0xe0a147: mov rdi, qword ptr [rax + 0x20]
0xe0a14b: mov rax, qword ptr [rdi]
0xe0a14e: mov rcx, qword ptr [rax + 0xa0]
0xe0a155: test rcx, rcx
0xe0a158: je 0x140e0a161
0xe0a15a: cmp qword ptr [rcx + 8], 0
0xe0a15f: jne 0x140e0a18f
0xe0a161: cmp dword ptr [rip + 0x5ec4eb4], 0
0xe0a168: je 0x140e0a18f
0xe0a16a: lea rdx, [rip + 0x5ec4eab]
0xe0a171: mov rcx, qword ptr [rdi + 8]
0xe0a175: call 0x1435ca0a0
0xe0a17a: test al, al
0xe0a17c: je 0x140e0a18f
0xe0a17e: mov rcx, qword ptr [rdi + 8]
0xe0a182: call 0x1435caec0
0xe0a187: mov rcx, rdi
0xe0a18a: call 0x1435c66a0
0xe0a18f: mov rcx, qword ptr [r14 + 0x430]
0xe0a196: call 0x140cb6910
0xe0a19b: mov rcx, qword ptr [r14 + 0x438]
0xe0a1a2: call 0x140cb6910
0xe0a1a7: mov rcx, qword ptr [r14 + 0x440]
0xe0a1ae: call 0x140cb6910
0xe0a1b3: mov dword ptr [r14 + 0x558], 0
0xe0a1be: mov rcx, qword ptr [r14 + 0x400]
0xe0a1c5: call 0x143d11360
0xe0a1ca: jmp 0x140e0a5c0
0xe0a1cf: test ebx, ebx
0xe0a1d1: jne 0x140e0a5c0
0xe0a1d7: mov eax, dword ptr [r13]
0xe0a1db: mov dword ptr [rsp + 0x40], eax
0xe0a1df: lea rcx, [rsp + 0xb8]
0xe0a1e7: call 0x140537250
0xe0a1ec: cmp dword ptr [rax + 0x2c], 0x17
0xe0a1f0: jne 0x140e0a408
0xe0a1f6: mov rcx, qword ptr [rsi + 0x148]
0xe0a1fd: test rcx, rcx
0xe0a200: je 0x140e0a243
0xe0a202: call 0x140cb6d80
0xe0a207: mov rax, qword ptr [rsi + 0x150]
0xe0a20e: mov rcx, qword ptr [rax + 8]
0xe0a212: mov rcx, qword ptr [rcx + 0x20]
0xe0a216: mov byte ptr [rsp + 0x30], 0x26
0xe0a21b: lea rdx, [rsp + 0x30]
0xe0a220: call 0x1435c9320
0xe0a225: mov rax, qword ptr [rsi + 0x158]
0xe0a22c: mov rcx, qword ptr [rax + 8]
0xe0a230: mov rcx, qword ptr [rcx + 0x20]
0xe0a234: mov byte ptr [rsp + 0x30], 0x26
0xe0a239: lea rdx, [rsp + 0x30]
0xe0a23e: call 0x1435c9320
0xe0a243: cmp qword ptr [rsi + 0x120], 0
0xe0a24b: je 0x140e0a408
0xe0a251: mov edi, dword ptr [rip + 0x5ea2ff1]
0xe0a257: lea rcx, [rsp + 0x40]
0xe0a25c: call 0x140473f20
0xe0a261: lea rcx, [rax + 8]
0xe0a265: call 0x1403d5f10
0xe0a26a: xor edx, edx
0xe0a26c: div edi
0xe0a26e: mov edi, edx
0xe0a270: mov r8d, edx
0xe0a273: call 0x140dec160
0xe0a278: mov rax, qword ptr [rip + 0x5ec6f19]
0xe0a27f: lea r15, [rax + rdi*4]
0xe0a283: mov rax, qword ptr [rsi + 0x120]
0xe0a28a: mov rdi, qword ptr [rax + 0x20]
0xe0a28e: mov byte ptr [rsp + 0x30], 0x25
0xe0a293: mov rax, qword ptr [rdi]
0xe0a296: mov rcx, qword ptr [rax + 0xa0]
0xe0a29d: test rcx, rcx
0xe0a2a0: je 0x140e0a2ad
0xe0a2a2: cmp qword ptr [rcx + 8], 0
0xe0a2a7: jne 0x140e0a3ce
0xe0a2ad: mov rcx, qword ptr [rdi + 0x30]
0xe0a2b1: test rcx, rcx
0xe0a2b4: je 0x140e0a3ce
0xe0a2ba: lea rdx, [rsp + 0x30]
0xe0a2bf: call 0x1435366d0
0xe0a2c4: test al, al
0xe0a2c6: je 0x140e0a3ce
0xe0a2cc: lea rdx, [rsp + 0x30]
0xe0a2d1: mov rcx, rdi
0xe0a2d4: call 0x1435c72e0
0xe0a2d9: movzx ecx, byte ptr [rsp + 0x30]
0xe0a2de: cmp cl, 0x2f
0xe0a2e1: jne 0x140e0a320
0xe0a2e3: mov byte ptr [rsp + 0x31], 0x30
0xe0a2e8: lea rdx, [rsp + 0x31]
0xe0a2ed: mov rcx, rdi
0xe0a2f0: call 0x1435c9320
0xe0a2f5: mov byte ptr [rsp + 0x31], 0x31
0xe0a2fa: lea rdx, [rsp + 0x31]
0xe0a2ff: mov rcx, rdi
0xe0a302: call 0x1435c9320
0xe0a307: mov byte ptr [rsp + 0x31], 0x32
0xe0a30c: lea rdx, [rsp + 0x31]
0xe0a311: mov rcx, rdi
0xe0a314: call 0x1435c9320
0xe0a319: mov byte ptr [rsp + 0x31], 0x33
0xe0a31e: jmp 0x140e0a360
0xe0a320: cmp cl, 0x35
0xe0a323: jne 0x140e0a372
0xe0a325: mov byte ptr [rsp + 0x31], 0x36
0xe0a32a: lea rdx, [rsp + 0x31]
0xe0a32f: mov rcx, rdi
0xe0a332: call 0x1435c9320
0xe0a337: mov byte ptr [rsp + 0x31], 0x37
0xe0a33c: lea rdx, [rsp + 0x31]
0xe0a341: mov rcx, rdi
0xe0a344: call 0x1435c9320
0xe0a349: mov byte ptr [rsp + 0x31], 0x38
0xe0a34e: lea rdx, [rsp + 0x31]
0xe0a353: mov rcx, rdi
0xe0a356: call 0x1435c9320
0xe0a35b: mov byte ptr [rsp + 0x31], 0x39
0xe0a360: lea rdx, [rsp + 0x31]
0xe0a365: mov rcx, rdi
0xe0a368: call 0x1435c9320
0xe0a36d: movzx ecx, byte ptr [rsp + 0x30]
0xe0a372: mov rax, qword ptr [rdi]
0xe0a375: mov rdx, qword ptr [rax + 0x50]
0xe0a379: test rdx, rdx
0xe0a37c: je 0x140e0a3ce
0xe0a37e: sub cl, 0x47
0xe0a381: cmp cl, 8
0xe0a384: ja 0x140e0a3ce
0xe0a386: vmovdqu xmm3, xmmword ptr [rip + 0x4f6af12]
0xe0a38e: vpermilps xmm2, xmm3, 0x51
0xe0a394: vpermilps xmm1, xmm3, 0x45
0xe0a39a: vpermilps xmm0, xmm3, 0x15
0xe0a3a0: vmovups xmmword ptr [rdx + 0x40], xmm3
0xe0a3a5: vmovups xmmword ptr [rdx + 0x50], xmm2
0xe0a3aa: vmovups xmmword ptr [rdx + 0x60], xmm1
0xe0a3af: vmovups xmmword ptr [rdx + 0x70], xmm0
0xe0a3b4: mov rax, qword ptr [rdi]
0xe0a3b7: mov rcx, qword ptr [rax + 0x50]
0xe0a3bb: vmovups xmmword ptr [rcx], xmm3
0xe0a3bf: vmovups xmmword ptr [rcx + 0x10], xmm2
0xe0a3c4: vmovups xmmword ptr [rcx + 0x20], xmm1
0xe0a3c9: vmovups xmmword ptr [rcx + 0x30], xmm0
0xe0a3ce: mov rax, qword ptr [rsi + 0x120]
0xe0a3d5: mov rdi, qword ptr [rax + 0x20]
0xe0a3d9: mov rax, qword ptr [rdi]
0xe0a3dc: mov rcx, qword ptr [rax + 0xa0]
0xe0a3e3: test rcx, rcx
0xe0a3e6: je 0x140e0a3ef
0xe0a3e8: cmp qword ptr [rcx + 8], 0
0xe0a3ed: jne 0x140e0a408
0xe0a3ef: mov rdx, r15
0xe0a3f2: mov rcx, qword ptr [rdi + 8]
0xe0a3f6: call 0x1435ca140
0xe0a3fb: cmp eax, -1
0xe0a3fe: je 0x140e0a408
0xe0a400: mov rcx, rdi
0xe0a403: call 0x1435c66a0
0xe0a408: mov rdx, qword ptr [rsi + 0x1f8]
0xe0a40f: test rdx, rdx
0xe0a412: je 0x140e0a5c0
0xe0a418: mov rdx, qword ptr [rdx + 0x18]
0xe0a41c: mov rcx, qword ptr [rdx]
0xe0a41f: mov rax, qword ptr [rcx + 0xa0]
0xe0a426: test rax, rax
0xe0a429: je 0x140e0a436
0xe0a42b: cmp qword ptr [rax + 8], 0
0xe0a430: jne 0x140e0a5c0
0xe0a436: mov rax, qword ptr [rcx + 0x20]
0xe0a43a: mov rcx, qword ptr [rax + 0x20]
0xe0a43e: mov dword ptr [rcx + 0x20], 0x3f800000
0xe0a445: mov rax, qword ptr [rdx]
0xe0a448: mov rcx, qword ptr [rax + 0x20]
0xe0a44c: mov rax, qword ptr [rcx + 0x20]
0xe0a450: mov dword ptr [rax + 0x28], 0x3f800000
0xe0a457: mov rax, qword ptr [rdx]
0xe0a45a: mov rcx, qword ptr [rax + 0x20]
0xe0a45e: mov rax, qword ptr [rcx + 0x20]
0xe0a462: mov dword ptr [rax + 0x30], 0x3f800000
0xe0a469: mov rcx, qword ptr [rdx]
0xe0a46c: mov rcx, qword ptr [rcx + 0x18]
0xe0a470: call 0x140d438d0
0xe0a475: jmp 0x140e0a5c0
0xe0a47a: cmp byte ptr [rsi + 0xc0], 0
0xe0a481: je 0x140e0a5c0
0xe0a487: mov eax, dword ptr [rip + 0x5ec1237]
0xe0a48d: cmp dword ptr [rsi + 0xa8], eax
0xe0a493: je 0x140e0ae03
0xe0a499: jmp 0x140e0a5c0
0xe0a49e: test ebx, ebx
0xe0a4a0: je 0x140e0a5c0
0xe0a4a6: mov r8d, ebx
0xe0a4a9: lea rdx, [rsp + 0x60]
0xe0a4ae: call 0x14064f570
0xe0a4b3: nop 
0xe0a4b4: cmp byte ptr [rsp + 0x70], 0
0xe0a4b9: je 0x140e0a5aa
0xe0a4bf: mov rax, qword ptr [rsp + 0x68]
0xe0a4c4: mov rcx, qword ptr [rax + 0x68]
0xe0a4c8: mov rcx, qword ptr [rcx + 0x20]
0xe0a4cc: add rcx, 0x30
0xe0a4d0: call 0x140389570
0xe0a4d5: mov r9d, dword ptr [rax]
0xe0a4d8: test r9d, r9d
0xe0a4db: je 0x140e0a5aa
0xe0a4e1: cmp dword ptr [r14 + 0x1fc], 0
0xe0a4e9: je 0x140e0a5aa
0xe0a4ef: mov ecx, dword ptr [r14 + 0x1f8]
0xe0a4f6: test ecx, ecx
0xe0a4f8: je 0x140e0a5aa
0xe0a4fe: xor edx, edx
0xe0a500: mov eax, r9d
0xe0a503: div ecx
0xe0a505: mov r8d, edx
0xe0a508: shl r8, 8
0xe0a50c: add r8, qword ptr [r14 + 0x208]
0xe0a513: xor edx, edx
0xe0a515: mov r11d, dword ptr [r8]
0xe0a518: test r11d, r11d
0xe0a51b: je 0x140e0a5aa
0xe0a521: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xe0a526: jne 0x140e0a53e
0xe0a528: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe0a52d: mov rax, qword ptr [r14 + 0x210]
0xe0a534: mov r10, qword ptr [rax + rcx*8]
0xe0a538: cmp dword ptr [r10 + 4], r9d
0xe0a53c: je 0x140e0a547
0xe0a53e: inc edx
0xe0a540: cmp edx, r11d
0xe0a543: jb 0x140e0a521
0xe0a545: jmp 0x140e0a5aa
0xe0a547: add r10, 8
0xe0a54b: je 0x140e0a5aa
0xe0a54d: mov rdi, qword ptr [r10]
0xe0a550: mov eax, dword ptr [r10 + 8]
0xe0a554: lea r12, [rdi + rax*8]
0xe0a558: cmp rdi, r12
0xe0a55b: je 0x140e0a5aa
0xe0a55d: nop dword ptr [rax]
0xe0a560: mov rax, qword ptr [rdi]
0xe0a563: mov rcx, qword ptr [rax + 0x118]
0xe0a56a: mov r15, qword ptr [rcx + 0x20]
0xe0a56e: mov rax, qword ptr [r15]
0xe0a571: mov rcx, qword ptr [rax + 0xa0]
0xe0a578: test rcx, rcx
0xe0a57b: je 0x140e0a584
0xe0a57d: cmp qword ptr [rcx + 8], 0
0xe0a582: jne 0x140e0a5a1
0xe0a584: lea rdx, [rip + 0x5ec6cb1]
0xe0a58b: mov rcx, qword ptr [r15 + 8]
0xe0a58f: call 0x1435ca140
0xe0a594: cmp eax, -1
0xe0a597: je 0x140e0a5a1
0xe0a599: mov rcx, r15
0xe0a59c: call 0x1435c66a0
0xe0a5a1: add rdi, 8
0xe0a5a5: cmp rdi, r12
0xe0a5a8: jne 0x140e0a560
0xe0a5aa: lea rax, [rip + 0x491b897]
0xe0a5b1: mov qword ptr [rsp + 0x60], rax
0xe0a5b6: lea rcx, [rsp + 0x60]
0xe0a5bb: call 0x141434880
0xe0a5c0: lea r15, [r14 + 0x1f8]
0xe0a5c7: mov r12d, dword ptr [r14 + 0x1fc]
0xe0a5ce: test r12d, r12d
0xe0a5d1: jne 0x140e0a5f8
0xe0a5d3: vpxor xmm0, xmm0, xmm0
0xe0a5d7: mov edi, 0xffffffff
0xe0a5dc: mov qword ptr [rsp + 0x70], 0xffffffffffffffff
0xe0a5e5: mov r10d, edi
0xe0a5e8: mov r12d, edi
0xe0a5eb: vpextrq rdx, xmm0, 1
0xe0a5f1: vmovq r9, xmm0
0xe0a5f6: jmp 0x140e0a617
0xe0a5f8: mov r9, r15
0xe0a5fb: mov rax, qword ptr [r14 + 0x210]
0xe0a602: mov rdx, qword ptr [rax]
0xe0a605: xor edi, edi
0xe0a607: mov dword ptr [rsp + 0x70], edi
0xe0a60b: mov r10d, dword ptr [r14 + 0x204]
0xe0a612: mov dword ptr [rsp + 0x74], r10d
0xe0a617: test rdx, rdx
0xe0a61a: je 0x140e0a744
0xe0a620: cmp dword ptr [r9 + 0xc], r10d
0xe0a624: jne 0x140e0a744
0xe0a62a: mov r11, qword ptr [rdx + 8]
0xe0a62e: mov r8d, dword ptr [rdx + 0x10]
0xe0a632: xor ecx, ecx
0xe0a634: test r8d, r8d
0xe0a637: je 0x140e0a725
0xe0a63d: mov rax, r11
0xe0a640: cmp qword ptr [rax], rsi
0xe0a643: je 0x140e0a655
0xe0a645: inc ecx
0xe0a647: add rax, 8
0xe0a64b: cmp ecx, r8d
0xe0a64e: jb 0x140e0a640
0xe0a650: jmp 0x140e0a725
0xe0a655: cmp ecx, -1
0xe0a658: je 0x140e0a725
0xe0a65e: dec r8d
0xe0a661: cmp ecx, r8d
0xe0a664: jae 0x140e0a66e
0xe0a666: mov rax, qword ptr [r11 + r8*8]
0xe0a66a: mov qword ptr [r11 + rcx*8], rax
0xe0a66e: add dword ptr [rdx + 0x10], -1
0xe0a672: jne 0x140e0a711
0xe0a678: cmp dword ptr [r9 + 0xc], r10d
0xe0a67c: jne 0x140e0a6bd
0xe0a67e: inc dword ptr [r15 + 0xc]
0xe0a682: mov edx, edi
0xe0a684: mov rcx, r15
0xe0a687: vzeroupper 
0xe0a68a: call 0x140465c80
0xe0a68f: mov edx, dword ptr [r15 + 4]
0xe0a693: cmp edi, edx
0xe0a695: jae 0x140e0a6bd
0xe0a697: mov qword ptr [rsp + 0x40], r15
0xe0a69c: mov ecx, edi
0xe0a69e: mov rax, qword ptr [r15 + 0x18]
0xe0a6a2: mov rcx, qword ptr [rax + rcx*8]
0xe0a6a6: mov qword ptr [rsp + 0x48], rcx
0xe0a6ab: mov dword ptr [rsp + 0x50], edi
0xe0a6af: mov eax, dword ptr [r15 + 0xc]
0xe0a6b3: mov dword ptr [rsp + 0x54], eax
0xe0a6b7: mov dword ptr [rsp + 0x58], edx
0xe0a6bb: jmp 0x140e0a6d8
0xe0a6bd: vpxor xmm0, xmm0, xmm0
0xe0a6c1: vmovdqu xmmword ptr [rsp + 0x40], xmm0
0xe0a6c7: mov qword ptr [rsp + 0x50], 0xffffffffffffffff
0xe0a6d0: mov dword ptr [rsp + 0x58], 0xffffffff
0xe0a6d8: vmovups ymm2, ymmword ptr [rsp + 0x40]
0xe0a6de: vmovups ymmword ptr [rsp + 0x60], ymm2
0xe0a6e4: vextractf128 xmm0, ymm2, 1
0xe0a6ea: vpextrd r12d, xmm0, 2
0xe0a6f0: vextractf128 xmm1, ymm2, 1
0xe0a6f6: vpextrd r10d, xmm1, 1
0xe0a6fc: vextractf128 xmm0, ymm2, 1
0xe0a702: vmovd edi, xmm0
0xe0a706: vpextrq rdx, xmm2, 1
0xe0a70c: vmovq r9, xmm2
0xe0a711: test rdx, rdx
0xe0a714: je 0x140e0a744
0xe0a716: mov rax, qword ptr [rsp + 0x70]
0xe0a71b: shr rax, 0x20
0xe0a71f: cmp dword ptr [r9 + 0xc], eax
0xe0a723: jne 0x140e0a744
0xe0a725: inc edi
0xe0a727: mov dword ptr [rsp + 0x70], edi
0xe0a72b: cmp edi, r12d
0xe0a72e: jae 0x140e0a73d
0xe0a730: mov rax, qword ptr [r9 + 0x18]
0xe0a734: mov rdx, qword ptr [rax + rdi*8]
0xe0a738: jmp 0x140e0a617
0xe0a73d: xor edx, edx
0xe0a73f: jmp 0x140e0a617
0xe0a744: mov rdx, rsi
0xe0a747: mov rcx, r14
0xe0a74a: vzeroupper 
0xe0a74d: call 0x140df04f0
0xe0a752: lea rcx, [rsi + 0xde]
0xe0a759: call 0x140537250
0xe0a75e: cmp byte ptr [rax + 0xab], 0
0xe0a765: je 0x140e0a7a2
0xe0a767: mov rax, qword ptr [rsi + 8]
0xe0a76b: mov rdi, qword ptr [rax + 0x20]
0xe0a76f: mov rax, qword ptr [rdi]
0xe0a772: mov rcx, qword ptr [rax + 0xa0]
0xe0a779: test rcx, rcx
0xe0a77c: je 0x140e0a785
0xe0a77e: cmp qword ptr [rcx + 8], 0
0xe0a783: jne 0x140e0a7a2
0xe0a785: lea rdx, [rip + 0x5ec4934]
0xe0a78c: mov rcx, qword ptr [rdi + 8]
0xe0a790: call 0x1435ca140
0xe0a795: cmp eax, -1
0xe0a798: je 0x140e0a7a2
0xe0a79a: mov rcx, rdi
0xe0a79d: call 0x1435c66a0
0xe0a7a2: lea rcx, [rsi + 0xde]
0xe0a7a9: call 0x140537250
0xe0a7ae: cmp byte ptr [rax + 0xae], 0
0xe0a7b5: je 0x140e0a7f5
0xe0a7b7: mov rax, qword ptr [rsi + 0x118]
0xe0a7be: mov rdi, qword ptr [rax + 0x20]
0xe0a7c2: mov rax, qword ptr [rdi]
0xe0a7c5: mov rcx, qword ptr [rax + 0xa0]
0xe0a7cc: test rcx, rcx
0xe0a7cf: je 0x140e0a7d8
0xe0a7d1: cmp qword ptr [rcx + 8], 0
0xe0a7d6: jne 0x140e0a7f5
0xe0a7d8: lea rdx, [rip + 0x5ec6a5d]
0xe0a7df: mov rcx, qword ptr [rdi + 8]
0xe0a7e3: call 0x1435ca140
0xe0a7e8: cmp eax, -1
0xe0a7eb: je 0x140e0a7f5
0xe0a7ed: mov rcx, rdi
0xe0a7f0: call 0x1435c66a0
0xe0a7f5: mov rax, qword ptr [rsi + 8]
0xe0a7f9: mov rdi, qword ptr [rax + 0x20]
0xe0a7fd: mov rax, qword ptr [rdi]
0xe0a800: mov rcx, qword ptr [rax + 0xa0]
0xe0a807: test rcx, rcx
0xe0a80a: je 0x140e0a813
0xe0a80c: cmp qword ptr [rcx + 8], 0
0xe0a811: jne 0x140e0a830
0xe0a813: lea rdx, [rip + 0x5ec6b9a]
0xe0a81a: mov rcx, qword ptr [rdi + 8]
0xe0a81e: call 0x1435ca140
0xe0a823: cmp eax, -1
0xe0a826: je 0x140e0a830
0xe0a828: mov rcx, rdi
0xe0a82b: call 0x1435c66a0
0xe0a830: lea rcx, [rsi + 0x1e0]
0xe0a837: call 0x140391e90
0xe0a83c: mov rax, qword ptr [rsi + 0x118]
0xe0a843: mov rdi, qword ptr [rax + 0x20]
0xe0a847: mov rax, qword ptr [rdi]
0xe0a84a: mov rcx, qword ptr [rax + 0xa0]
0xe0a851: test rcx, rcx
0xe0a854: je 0x140e0a85d
0xe0a856: cmp qword ptr [rcx + 8], 0
0xe0a85b: jne 0x140e0a87a
0xe0a85d: lea rdx, [rip + 0x5ec6b60]
0xe0a864: mov rcx, qword ptr [rdi + 8]
0xe0a868: call 0x1435ca140
0xe0a86d: cmp eax, -1
0xe0a870: je 0x140e0a87a
0xe0a872: mov rcx, rdi
0xe0a875: call 0x1435c66a0
0xe0a87a: mov rdi, qword ptr [rsi + 0x120]
0xe0a881: test rdi, rdi
0xe0a884: je 0x140e0a8bd
0xe0a886: mov rdi, qword ptr [rdi + 0x20]
0xe0a88a: mov rax, qword ptr [rdi]
0xe0a88d: mov rcx, qword ptr [rax + 0xa0]
0xe0a894: test rcx, rcx
0xe0a897: je 0x140e0a8a0
0xe0a899: cmp qword ptr [rcx + 8], 0
0xe0a89e: jne 0x140e0a8bd
0xe0a8a0: lea rdx, [rip + 0x5ec4819]
0xe0a8a7: mov rcx, qword ptr [rdi + 8]
0xe0a8ab: call 0x1435ca140
0xe0a8b0: cmp eax, -1
0xe0a8b3: je 0x140e0a8bd
0xe0a8b5: mov rcx, rdi
0xe0a8b8: call 0x1435c66a0
0xe0a8bd: mov rdi, qword ptr [rsi + 0x1f8]
0xe0a8c4: test rdi, rdi
0xe0a8c7: je 0x140e0a932
0xe0a8c9: mov r15, qword ptr [rdi + 0x20]
0xe0a8cd: mov rax, qword ptr [r15]
0xe0a8d0: mov rcx, qword ptr [rax + 0xa0]
0xe0a8d7: test rcx, rcx
0xe0a8da: je 0x140e0a8e3
0xe0a8dc: cmp qword ptr [rcx + 8], 0
0xe0a8e1: jne 0x140e0a900
0xe0a8e3: lea rdx, [rip + 0x5ec6ada]
0xe0a8ea: mov rcx, qword ptr [r15 + 8]
0xe0a8ee: call 0x1435ca140
0xe0a8f3: cmp eax, -1
0xe0a8f6: je 0x140e0a900
0xe0a8f8: mov rcx, r15
0xe0a8fb: call 0x1435c66a0
0xe0a900: mov byte ptr [rsp + 0x31], 0x26
0xe0a905: lea rdx, [rsp + 0x31]
0xe0a90a: mov rcx, qword ptr [rdi + 0x20]
0xe0a90e: call 0x1435c9320
0xe0a913: mov rcx, qword ptr [rsi + 0x208]
0xe0a91a: test rcx, rcx
0xe0a91d: je 0x140e0a932
0xe0a91f: mov rcx, qword ptr [rcx + 0x20]
0xe0a923: mov byte ptr [rsp + 0x31], 0x26
0xe0a928: lea rdx, [rsp + 0x31]
0xe0a92d: call 0x1435c9320
0xe0a932: cmp qword ptr [rsi + 0x148], 0
0xe0a93a: je 0x140e0aac7
0xe0a940: mov rax, qword ptr [rsi + 0x150]
0xe0a947: mov rcx, qword ptr [rax + 8]
0xe0a94b: mov rdi, qword ptr [rcx + 0x20]
0xe0a94f: mov byte ptr [rsp + 0x30], 0x26
0xe0a954: mov rax, qword ptr [rdi]
0xe0a957: mov rcx, qword ptr [rax + 0xa0]
0xe0a95e: test rcx, rcx
0xe0a961: je 0x140e0a96e
0xe0a963: cmp qword ptr [rcx + 8], 0
0xe0a968: jne 0x140e0aa8f
0xe0a96e: mov rcx, qword ptr [rdi + 0x30]
0xe0a972: test rcx, rcx
0xe0a975: je 0x140e0aa8f
0xe0a97b: lea rdx, [rsp + 0x30]
0xe0a980: call 0x1435366d0
0xe0a985: test al, al
0xe0a987: je 0x140e0aa8f
0xe0a98d: lea rdx, [rsp + 0x30]
0xe0a992: mov rcx, rdi
0xe0a995: call 0x1435c72e0
0xe0a99a: movzx ecx, byte ptr [rsp + 0x30]
0xe0a99f: cmp cl, 0x2f
0xe0a9a2: jne 0x140e0a9e1
0xe0a9a4: mov byte ptr [rsp + 0x31], 0x30
0xe0a9a9: lea rdx, [rsp + 0x31]
0xe0a9ae: mov rcx, rdi
0xe0a9b1: call 0x1435c9320
0xe0a9b6: mov byte ptr [rsp + 0x31], 0x31
0xe0a9bb: lea rdx, [rsp + 0x31]
0xe0a9c0: mov rcx, rdi
0xe0a9c3: call 0x1435c9320
0xe0a9c8: mov byte ptr [rsp + 0x31], 0x32
0xe0a9cd: lea rdx, [rsp + 0x31]
0xe0a9d2: mov rcx, rdi
0xe0a9d5: call 0x1435c9320
0xe0a9da: mov byte ptr [rsp + 0x31], 0x33
0xe0a9df: jmp 0x140e0aa21
0xe0a9e1: cmp cl, 0x35
0xe0a9e4: jne 0x140e0aa33
0xe0a9e6: mov byte ptr [rsp + 0x31], 0x36
0xe0a9eb: lea rdx, [rsp + 0x31]
0xe0a9f0: mov rcx, rdi
0xe0a9f3: call 0x1435c9320
0xe0a9f8: mov byte ptr [rsp + 0x31], 0x37
0xe0a9fd: lea rdx, [rsp + 0x31]
0xe0aa02: mov rcx, rdi
0xe0aa05: call 0x1435c9320
0xe0aa0a: mov byte ptr [rsp + 0x31], 0x38
0xe0aa0f: lea rdx, [rsp + 0x31]
0xe0aa14: mov rcx, rdi
0xe0aa17: call 0x1435c9320
0xe0aa1c: mov byte ptr [rsp + 0x31], 0x39
0xe0aa21: lea rdx, [rsp + 0x31]
0xe0aa26: mov rcx, rdi
0xe0aa29: call 0x1435c9320
0xe0aa2e: movzx ecx, byte ptr [rsp + 0x30]
0xe0aa33: mov rax, qword ptr [rdi]
0xe0aa36: mov rdx, qword ptr [rax + 0x50]
0xe0aa3a: test rdx, rdx
0xe0aa3d: je 0x140e0aa8f
0xe0aa3f: sub cl, 0x47
0xe0aa42: cmp cl, 8
0xe0aa45: ja 0x140e0aa8f
0xe0aa47: vmovdqu xmm3, xmmword ptr [rip + 0x4f6a851]
0xe0aa4f: vpermilps xmm2, xmm3, 0x51
0xe0aa55: vpermilps xmm1, xmm3, 0x45
0xe0aa5b: vpermilps xmm0, xmm3, 0x15
0xe0aa61: vmovups xmmword ptr [rdx + 0x40], xmm3
0xe0aa66: vmovups xmmword ptr [rdx + 0x50], xmm2
0xe0aa6b: vmovups xmmword ptr [rdx + 0x60], xmm1
0xe0aa70: vmovups xmmword ptr [rdx + 0x70], xmm0
0xe0aa75: mov rax, qword ptr [rdi]
0xe0aa78: mov rcx, qword ptr [rax + 0x50]
0xe0aa7c: vmovups xmmword ptr [rcx], xmm3
0xe0aa80: vmovups xmmword ptr [rcx + 0x10], xmm2
0xe0aa85: vmovups xmmword ptr [rcx + 0x20], xmm1
0xe0aa8a: vmovups xmmword ptr [rcx + 0x30], xmm0
0xe0aa8f: mov rax, qword ptr [rsi + 0x158]
0xe0aa96: mov rcx, qword ptr [rax + 8]
0xe0aa9a: mov rcx, qword ptr [rcx + 0x20]
0xe0aa9e: mov byte ptr [rsp + 0x31], 0x26
0xe0aaa3: lea rdx, [rsp + 0x31]
0xe0aaa8: call 0x1435c9320
0xe0aaad: mov rax, qword ptr [rsi + 0x138]
0xe0aab4: mov rcx, qword ptr [rax + 0x20]
0xe0aab8: mov byte ptr [rsp + 0x31], 0x26
0xe0aabd: lea rdx, [rsp + 0x31]
0xe0aac2: call 0x1435c9320
0xe0aac7: mov rcx, qword ptr [rsi + 0x128]
0xe0aace: test rcx, rcx
0xe0aad1: je 0x140e0aae6
0xe0aad3: mov rcx, qword ptr [rcx + 0x20]
0xe0aad7: mov byte ptr [rsp + 0x31], 0x26
0xe0aadc: lea rdx, [rsp + 0x31]
0xe0aae1: call 0x1435c9320
0xe0aae6: mov rcx, qword ptr [rsi + 0x138]
0xe0aaed: test rcx, rcx
0xe0aaf0: je 0x140e0ab05
0xe0aaf2: mov rcx, qword ptr [rcx + 0x20]
0xe0aaf6: mov byte ptr [rsp + 0x31], 0x26
0xe0aafb: lea rdx, [rsp + 0x31]
0xe0ab00: call 0x1435c9320
0xe0ab05: mov rax, qword ptr [rsi + 0x118]
0xe0ab0c: mov rcx, qword ptr [rax + 0x20]
0xe0ab10: mov byte ptr [rsp + 0x31], 0x26
0xe0ab15: lea rdx, [rsp + 0x31]
0xe0ab1a: call 0x1435c9320
0xe0ab1f: mov edi, 0xffffffff
0xe0ab24: test ebx, ebx
0xe0ab26: je 0x140e0ac5e
0xe0ab2c: cmp dword ptr [r14 + 0x1bc], 0
0xe0ab34: je 0x140e0ab88
0xe0ab36: mov ecx, dword ptr [r14 + 0x1b8]
0xe0ab3d: test ecx, ecx
0xe0ab3f: je 0x140e0ab88
0xe0ab41: xor edx, edx
0xe0ab43: mov eax, ebx
0xe0ab45: div ecx
0xe0ab47: mov r8d, edx
0xe0ab4a: shl r8, 8
0xe0ab4e: add r8, qword ptr [r14 + 0x1c8]
0xe0ab55: xor edx, edx
0xe0ab57: mov r10d, dword ptr [r8]
0xe0ab5a: test r10d, r10d
0xe0ab5d: je 0x140e0ab88
0xe0ab5f: nop 
0xe0ab60: cmp dword ptr [r8 + rdx*8 + 8], ebx
0xe0ab65: jne 0x140e0ab81
0xe0ab67: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe0ab6c: mov rax, qword ptr [r14 + 0x1d0]
0xe0ab73: mov r9, qword ptr [rax + rcx*8]
0xe0ab77: cmp dword ptr [r9 + 4], ebx
0xe0ab7b: je 0x140e0ac22
0xe0ab81: inc edx
0xe0ab83: cmp edx, r10d
0xe0ab86: jb 0x140e0ab60
0xe0ab88: xor r9d, r9d
0xe0ab8b: mov r8, qword ptr [r9]
0xe0ab8e: mov edx, dword ptr [r9 + 8]
0xe0ab92: xor ecx, ecx
0xe0ab94: test edx, edx
0xe0ab96: je 0x140e0abaf
0xe0ab98: mov rax, r8
0xe0ab9b: nop dword ptr [rax + rax]
0xe0aba0: cmp qword ptr [rax], rsi
0xe0aba3: je 0x140e0abb1
0xe0aba5: inc ecx
0xe0aba7: add rax, 8
0xe0abab: cmp ecx, edx
0xe0abad: jb 0x140e0aba0
0xe0abaf: mov ecx, edi
0xe0abb1: dec edx
0xe0abb3: cmp ecx, edx
0xe0abb5: jae 0x140e0abbf
0xe0abb7: mov rax, qword ptr [r8 + rdx*8]
0xe0abbb: mov qword ptr [r8 + rcx*8], rax
0xe0abbf: sub dword ptr [r9 + 8], 1
0xe0abc4: jne 0x140e0ac53
0xe0abca: lea r9, [r14 + 0x1b8]
0xe0abd1: cmp dword ptr [r9 + 4], 0
0xe0abd6: je 0x140e0ac36
0xe0abd8: inc dword ptr [r9 + 0xc]
0xe0abdc: mov ecx, dword ptr [r9]
0xe0abdf: test ecx, ecx
0xe0abe1: je 0x140e0ac36
0xe0abe3: xor edx, edx
0xe0abe5: mov eax, ebx
0xe0abe7: div ecx
0xe0abe9: mov r8d, edx
0xe0abec: shl r8, 8
0xe0abf0: add r8, qword ptr [r9 + 0x10]
0xe0abf4: xor edx, edx
0xe0abf6: mov r11d, dword ptr [r8]
0xe0abf9: test r11d, r11d
0xe0abfc: je 0x140e0ac36
0xe0abfe: nop 
0xe0ac00: cmp dword ptr [r8 + rdx*8 + 8], ebx
0xe0ac05: jne 0x140e0ac19
0xe0ac07: mov r10d, dword ptr [r8 + rdx*8 + 0xc]
0xe0ac0c: mov rax, qword ptr [r9 + 0x18]
0xe0ac10: mov rcx, qword ptr [rax + r10*8]
0xe0ac14: cmp dword ptr [rcx + 4], ebx
0xe0ac17: je 0x140e0ac2b
0xe0ac19: inc edx
0xe0ac1b: cmp edx, r11d
0xe0ac1e: jb 0x140e0ac00
0xe0ac20: jmp 0x140e0ac36
0xe0ac22: add r9, 8
0xe0ac26: jmp 0x140e0ab8b
0xe0ac2b: mov edx, r10d
0xe0ac2e: mov rcx, r9
0xe0ac31: call 0x140465c80
0xe0ac36: mov rdx, qword ptr [rsi + 0x1c8]
0xe0ac3d: test rdx, rdx
0xe0ac40: je 0x140e0ac53
0xe0ac42: cmp dword ptr [rsi + 0x1c4], 0
0xe0ac49: jne 0x140e0ac53
0xe0ac4b: mov rcx, r14
0xe0ac4e: call 0x140e12cd0
0xe0ac53: mov rdx, rsi
0xe0ac56: mov rcx, r14
0xe0ac59: call 0x140df0b30
0xe0ac5e: lea rcx, [rsp + 0xb8]
0xe0ac66: call 0x140537250
0xe0ac6b: cmp dword ptr [r14 + 0x15c], 0
0xe0ac73: je 0x140e0acca
0xe0ac75: mov r9d, dword ptr [rax]
0xe0ac78: mov ecx, dword ptr [r14 + 0x158]
0xe0ac7f: test ecx, ecx
0xe0ac81: je 0x140e0acca
0xe0ac83: xor edx, edx
0xe0ac85: mov eax, r9d
0xe0ac88: div ecx
0xe0ac8a: mov r8d, edx
0xe0ac8d: shl r8, 8
0xe0ac91: add r8, qword ptr [r14 + 0x168]
0xe0ac98: xor edx, edx
0xe0ac9a: mov r11d, dword ptr [r8]
0xe0ac9d: test r11d, r11d
0xe0aca0: je 0x140e0acca
0xe0aca2: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xe0aca7: jne 0x140e0acc3
0xe0aca9: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe0acae: mov rax, qword ptr [r14 + 0x170]
0xe0acb5: mov r10, qword ptr [rax + rcx*8]
0xe0acb9: cmp dword ptr [r10 + 4], r9d
0xe0acbd: je 0x140e0ad8d
0xe0acc3: inc edx
0xe0acc5: cmp edx, r11d
0xe0acc8: jb 0x140e0aca2
0xe0acca: xor ecx, ecx
0xe0accc: mov rdx, r13
0xe0accf: call 0x140de45a0
0xe0acd4: mov rdx, rsi
0xe0acd7: mov rcx, r14
0xe0acda: call 0x140df38e0
0xe0acdf: cmp byte ptr [rip + 0x5ea1752], 0
0xe0ace6: jne 0x140e0adfa
0xe0acec: lea rcx, [rsp + 0xb8]
0xe0acf4: call 0x140537250
0xe0acf9: cmp dword ptr [r14 + 0x2bc], 0
0xe0ad01: je 0x140e0ad54
0xe0ad03: mov r9d, dword ptr [rax]
0xe0ad06: mov ecx, dword ptr [r14 + 0x2b8]
0xe0ad0d: test ecx, ecx
0xe0ad0f: je 0x140e0ad54
0xe0ad11: xor edx, edx
0xe0ad13: mov eax, r9d
0xe0ad16: div ecx
0xe0ad18: mov r8d, edx
0xe0ad1b: shl r8, 8
0xe0ad1f: add r8, qword ptr [r14 + 0x2c8]
0xe0ad26: xor edx, edx
0xe0ad28: mov r11d, dword ptr [r8]
0xe0ad2b: test r11d, r11d
0xe0ad2e: je 0x140e0ad54
0xe0ad30: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xe0ad35: jne 0x140e0ad4d
0xe0ad37: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe0ad3c: mov rax, qword ptr [r14 + 0x2d0]
0xe0ad43: mov r10, qword ptr [rax + rcx*8]
0xe0ad47: cmp dword ptr [r10 + 4], r9d
0xe0ad4b: je 0x140e0ad96
0xe0ad4d: inc edx
0xe0ad4f: cmp edx, r11d
0xe0ad52: jb 0x140e0ad30
0xe0ad54: xor ebx, ebx
0xe0ad56: mov rax, qword ptr [rsi]
0xe0ad59: mov rcx, rsi
0xe0ad5c: call qword ptr [rax + 0x518]
0xe0ad62: mov rax, qword ptr [rsi]
0xe0ad65: mov rcx, rsi
0xe0ad68: call qword ptr [rax + 0x170]
0xe0ad6e: mov rcx, qword ptr [rsi + 8]
0xe0ad72: mov qword ptr [rsp + 0x40], rcx
0xe0ad77: test rcx, rcx
0xe0ad7a: je 0x140e0adb4
0xe0ad7c: cmp byte ptr [rcx + 0x15], 0
0xe0ad80: je 0x140e0ad9c
0xe0ad82: mov qword ptr [rsp + 0x40], 0
0xe0ad8b: jmp 0x140e0adb4
0xe0ad8d: lea rcx, [r10 + 8]
0xe0ad91: jmp 0x140e0accc
0xe0ad96: lea rbx, [r10 + 8]
0xe0ad9a: jmp 0x140e0ad56
0xe0ad9c: cmp byte ptr [rcx + 0x14], 0
0xe0ada0: je 0x140e0ada8
0xe0ada2: lock inc dword ptr [rcx + 0x10]
0xe0ada6: jmp 0x140e0adb0
0xe0ada8: mov eax, dword ptr [rcx + 0x10]
0xe0adab: inc eax
0xe0adad: mov dword ptr [rcx + 0x10], eax
0xe0adb0: mov byte ptr [rcx + 0x16], 1
0xe0adb4: lea rdx, [rsp + 0x40]
0xe0adb9: mov rcx, rbx
0xe0adbc: call 0x1403d1120
0xe0adc1: nop 
0xe0adc2: mov rcx, qword ptr [rsp + 0x40]
0xe0adc7: test rcx, rcx
0xe0adca: je 0x140e0adfa
0xe0adcc: mov qword ptr [rsp + 0x40], 0
0xe0add5: cmp byte ptr [rcx + 0x14], 0
0xe0add9: je 0x140e0ade4
0xe0addb: lock xadd dword ptr [rcx + 0x10], edi
0xe0ade0: dec edi
0xe0ade2: jmp 0x140e0adec
0xe0ade4: mov edi, dword ptr [rcx + 0x10]
0xe0ade7: dec edi
0xe0ade9: mov dword ptr [rcx + 0x10], edi
0xe0adec: test edi, edi
0xe0adee: jne 0x140e0adfa
0xe0adf0: mov rax, qword ptr [rcx]
0xe0adf3: mov edx, 1
0xe0adf8: call qword ptr [rax]
0xe0adfa: mov rcx, qword ptr [rsi + 8]
0xe0adfe: call 0x143ed59a0
0xe0ae03: lea r11, [rsp + 0x80]
0xe0ae0b: mov rbx, qword ptr [r11 + 0x30]
0xe0ae0f: mov rsi, qword ptr [r11 + 0x40]
0xe0ae13: mov rsp, r11
0xe0ae16: pop r15
0xe0ae18: pop r14
0xe0ae1a: pop r13
0xe0ae1c: pop r12
0xe0ae1e: pop rdi
0xe0ae1f: ret 
0xe0ae20: iretd 
0xe0ae21: movabs eax, dword ptr [0xa47a00e0a13800e0]
0xe0ae2a: loopne 0x140e0ae2c
0xe0ae2c: sahf 
0xe0ae2d: movsb byte ptr [rdi], byte ptr [rsi]
0xe0ae2e: loopne 0x140e0ae30
0xe0ae30: or ah, byte ptr [rcx - 0x5a3fff20]
0xe0ae36: loopne 0x140e0ae38
0xe0ae38: add byte ptr [rax], al
0xe0ae3a: add byte ptr [rax], al
0xe0ae3c: add dword ptr [rip + 0x5050505], eax
0xe0ae42: add eax, 0x5050505
0xe0ae47: add al, byte ptr [rip + 0x2050502]
0xe0ae4d: add eax, 0x5050505
0xe0ae52: add eax, 0x5050505
0xe0ae57: add eax, 0x5050505
0xe0ae5c: add eax, 0x3050505
