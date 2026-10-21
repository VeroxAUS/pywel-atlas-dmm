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