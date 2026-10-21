0x39a4f0: mov qword ptr [rsp + 0x10], rbx
0x39a4f5: mov qword ptr [rsp + 0x18], rbp
0x39a4fa: mov qword ptr [rsp + 0x20], rsi
0x39a4ff: push rdi
0x39a500: sub rsp, 0x100
0x39a507: movzx ebp, dl
0x39a50a: mov rsi, rcx
0x39a50d: xor ebx, ebx
0x39a50f: mov dword ptr [rsp + 0x30], ebx
0x39a513: mov rax, qword ptr [rcx + 8]
0x39a517: lea rdx, [rax + 8]
0x39a51b: test rax, rax
0x39a51e: cmove rdx, rbx
0x39a522: mov r8b, 1
0x39a525: mov rdx, qword ptr [rdx]
0x39a528: lea rcx, [rsp + 0x38]
0x39a52d: call 0x140393650
0x39a532: nop 
0x39a533: xor eax, eax
0x39a535: mov byte ptr [rsi + 0x4c], al
0x39a538: mov word ptr [rsi + 0x4d], ax
0x39a53c: mov byte ptr [rsi + 0x4f], al
0x39a53f: mov byte ptr [rsi + 0x39], al
0x39a542: mov word ptr [rsi + 0x40], ax
0x39a546: mov byte ptr [rsi + 0x42], al
0x39a549: vmovsd xmm0, qword ptr [rip + 0x51ab937]
0x39a551: vmovsd qword ptr [rsi + 0x68], xmm0
0x39a556: mov eax, dword ptr [rip + 0x51ab934]
0x39a55c: mov dword ptr [rsi + 0x70], eax
0x39a55f: mov dword ptr [rsi + 0x74], ebx
0x39a562: mov qword ptr [rsi + 0x78], rbx
0x39a566: mov dword ptr [rsi + 0x60], ebx
0x39a569: mov rdi, qword ptr [rsp + 0x38]
0x39a56e: mov rax, qword ptr [rdi]
0x39a571: xor edx, edx
0x39a573: mov rcx, rdi
0x39a576: call qword ptr [rax + 0x20]
0x39a579: cmp byte ptr [rsp + 0x40], 1
0x39a57e: jne 0x14039a5ae
0x39a580: mov eax, 0xffffffff
0x39a585: lock xadd dword ptr [rdi + 8], eax
0x39a58a: cmp eax, 1
0x39a58d: jne 0x14039a5a1
0x39a58f: test dword ptr [rdi + 0xc], 0x40000000
0x39a596: je 0x14039a5ae
0x39a598: mov rax, qword ptr [rdi]
0x39a59b: mov rcx, rdi
0x39a59e: call qword ptr [rax + 0x40]
0x39a5a1: test dword ptr [rdi + 0xc], 0x40000000
0x39a5a8: je 0x14039a5ae
0x39a5aa: lock dec dword ptr [rdi + 0xc]
0x39a5ae: mov rdi, qword ptr [rsi + 8]
0x39a5b2: lea rdx, [rdi + 8]
0x39a5b6: test rdi, rdi
0x39a5b9: cmove rdx, rbx
0x39a5bd: mov rdx, qword ptr [rdx]
0x39a5c0: lea rcx, [rsp + 0x38]
0x39a5c5: call 0x140393df0
0x39a5ca: nop 
0x39a5cb: mov qword ptr [rsp + 0x40], rdi
0x39a5d0: mov edx, 1
0x39a5d5: mov dword ptr [rsp + 0x30], edx
0x39a5d9: mov rax, qword ptr [rdi + 0x68]
0x39a5dd: mov rcx, qword ptr [rax + 0x20]
0x39a5e1: mov ebx, dword ptr [rcx + 0x394]
0x39a5e7: or ebx, dword ptr [rcx + 0x390]
0x39a5ed: and edx, 0xfffffffe
0x39a5f0: mov dword ptr [rsp + 0x30], edx
0x39a5f4: mov rcx, qword ptr [rsp + 0x38]
0x39a5f9: mov rax, qword ptr [rcx]
0x39a5fc: mov dl, 1
0x39a5fe: call qword ptr [rax + 0x20]
0x39a601: bt ebx, 0x19
0x39a605: jae 0x14039a6f7
0x39a60b: mov ebx, 0xffff
0x39a610: test bpl, bpl
0x39a613: jne 0x14039a657
0x39a615: mov rax, qword ptr [rsi + 8]
0x39a619: mov rcx, qword ptr [rax + 0x68]
0x39a61d: mov rcx, qword ptr [rcx + 0x20]
0x39a621: add rcx, 0x30
0x39a625: call 0x140389570
0x39a62a: movzx ecx, word ptr [rax + 0xbe]
0x39a631: mov word ptr [rsp + 0x110], cx
0x39a639: cmp cx, bx
0x39a63c: je 0x14039a651
0x39a63e: lea rcx, [rsp + 0x110]
0x39a646: call 0x1403891b0
0x39a64b: cmp byte ptr [rax + 0x56], bpl
0x39a64f: jne 0x14039a657
0x39a651: vxorps xmm3, xmm3, xmm3
0x39a655: jmp 0x14039a65f
0x39a657: vmovss xmm3, dword ptr [rip + 0x68f5519]
0x39a65f: mov rax, qword ptr [rsi + 8]
0x39a663: mov rcx, qword ptr [rax + 0x68]
0x39a667: mov byte ptr [rsp + 0x20], 0
0x39a66c: xor r8d, r8d
0x39a66f: mov edx, 0x2000000
0x39a674: mov rcx, qword ptr [rcx + 0x20]
0x39a678: call 0x141795490
0x39a67d: mov rax, qword ptr [rsi + 8]
0x39a681: mov rcx, qword ptr [rax + 0x88]
0x39a688: movzx edx, byte ptr [rcx + 1]
0x39a68c: lea eax, [rdx - 3]
0x39a68f: cmp eax, 6
0x39a692: ja 0x14039a6aa
0x39a694: cdqe 
0x39a696: lea r8, [rip - 0x39a69d]
0x39a69d: mov ecx, dword ptr [r8 + rax*4 + 0x39a710]
0x39a6a5: add rcx, r8
0x39a6a8: jmp rcx
0x39a6aa: cmp dl, 1
0x39a6ad: jne 0x14039a6f7
0x39a6af: mov dword ptr [rsp + 0x38], ebx
0x39a6b3: mov eax, dword ptr [rip + 0x66d2a07]
0x39a6b9: mov dword ptr [rsp + 0x40], eax
0x39a6bd: mov eax, dword ptr [rip + 0x66d29f9]
0x39a6c3: mov dword ptr [rsp + 0x3c], eax
0x39a6c7: lea rdx, [rsp + 0x38]
0x39a6cc: lea rcx, [rsp + 0x50]
0x39a6d1: call 0x1417b54d0
0x39a6d6: mov rax, qword ptr [rsi + 8]
0x39a6da: mov rcx, qword ptr [rax + 0x68]
0x39a6de: xor r9d, r9d
0x39a6e1: lea r8, [rsp + 0x50]
0x39a6e6: lea rdx, [rsp + 0x110]
0x39a6ee: mov rcx, qword ptr [rcx + 0x58]
0x39a6f2: call 0x14207aa10
0x39a6f7: lea r11, [rsp + 0x100]
0x39a6ff: mov rbx, qword ptr [r11 + 0x18]
0x39a703: mov rbp, qword ptr [r11 + 0x20]
0x39a707: mov rsi, qword ptr [r11 + 0x28]
0x39a70b: mov rsp, r11
0x39a70e: pop rdi
0x39a70f: ret 
0x39a710: scasd eax, dword ptr [rdi]
0x39a711: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a712: cmp dword ptr [rax], eax
0x39a714: scasd eax, dword ptr [rdi]
0x39a715: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a716: cmp dword ptr [rax], eax
0x39a718: scasd eax, dword ptr [rdi]
0x39a719: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a71a: cmp dword ptr [rax], eax
0x39a71c: scasd eax, dword ptr [rdi]
0x39a71d: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a71e: cmp dword ptr [rax], eax
0x39a720: stosb byte ptr [rdi], al
0x39a721: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a722: cmp dword ptr [rax], eax
0x39a724: scasd eax, dword ptr [rdi]
0x39a725: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a726: cmp dword ptr [rax], eax
0x39a728: scasd eax, dword ptr [rdi]
0x39a729: cmpsb byte ptr [rsi], byte ptr [rdi]
0x39a72a: cmp dword ptr [rax], eax