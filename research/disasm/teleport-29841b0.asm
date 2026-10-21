0x29841b0: mov qword ptr [rsp + 8], rbx
0x29841b5: push rbp
0x29841b6: push rsi
0x29841b7: push rdi
0x29841b8: push r12
0x29841ba: push r13
0x29841bc: push r14
0x29841be: push r15
0x29841c0: lea rbp, [rsp - 0xf0]
0x29841c8: sub rsp, 0x200
0x29841cf: mov r14, r8
0x29841d2: mov rdi, rdx
0x29841d5: mov r15, rcx
0x29841d8: mov rbx, qword ptr [r8 + 0x18]
0x29841dc: movzx ecx, word ptr [rbx + 3]
0x29841e0: movzx eax, word ptr [r8 + 0x10]
0x29841e5: sub rax, 5
0x29841e9: cmp rax, rcx
0x29841ec: jne 0x14298467f
0x29841f2: cmp byte ptr [r8 + 0x38], 0
0x29841f7: jne 0x142984207
0x29841f9: mov eax, 0x7fc1
0x29841fe: cmp ax, cx
0x2984201: jb 0x14298467f
0x2984207: xor esi, esi
0x2984209: cmp byte ptr [r15 + 0x21], sil
0x298420d: je 0x142984216
0x298420f: mov dword ptr [rdx], esi
0x2984211: jmp 0x142984739
0x2984216: mov dword ptr [rbp + 0x140], esi
0x298421c: vxorps xmm0, xmm0, xmm0
0x2984220: vmovups xmmword ptr [rbp], xmm0
0x2984225: vxorps xmm1, xmm1, xmm1
0x2984229: vmovss dword ptr [rbp + 0x10], xmm1
0x298422e: vmovss dword ptr [rbp + 0x14], xmm1
0x2984233: vmovss xmm0, dword ptr [rip + 0x33eee79]
0x298423b: vmovss dword ptr [rbp + 0x18], xmm0
0x2984240: mov dword ptr [rbp + 0x1c], esi
0x2984243: vmovsd xmm0, qword ptr [rip + 0x2bc1c4d]
0x298424b: vmovsd qword ptr [rbp + 0x20], xmm0
0x2984250: mov eax, dword ptr [rip + 0x2bc1c4a]
0x2984256: mov dword ptr [rbp + 0x28], eax
0x2984259: vmovss dword ptr [rbp + 0x2c], xmm1
0x298425e: vmovdqu xmm0, xmmword ptr [rip + 0x33f133a]
0x2984266: vmovups xmmword ptr [rbp + 0x30], xmm0
0x298426b: vmovss dword ptr [rbp + 0x40], xmm1
0x2984270: vmovss dword ptr [rbp + 0x44], xmm1
0x2984275: lea rcx, [rbp + 0x48]
0x2984279: call 0x1408a6590
0x298427e: mov byte ptr [rbp + 0xd0], sil
0x2984285: mov qword ptr [rbp + 0xd8], rsi
0x298428c: mov byte ptr [rbp + 0xe0], sil
0x2984293: movzx ecx, word ptr [rbx + 3]
0x2984297: lea r13, [rip + 0x2d9da22]
0x298429e: mov qword ptr [rbp - 0x80], r13
0x29842a2: mov byte ptr [rbp - 0x78], sil
0x29842a6: lea r12, [rip + 0x2d9d9b3]
0x29842ad: mov qword ptr [rbp - 0x80], r12
0x29842b1: lea rax, [rbx + 5]
0x29842b5: mov qword ptr [rbp - 0x70], rax
0x29842b9: mov dword ptr [rbp - 0x68], ecx
0x29842bc: mov dword ptr [rbp - 0x64], esi
0x29842bf: mov rax, qword ptr [rbp - 0x80]
0x29842c3: mov r9, qword ptr [rax + 8]
0x29842c7: lea rax, [rip - 0x156505e]
0x29842ce: mov r8d, 4
0x29842d4: lea rdx, [rbp + 0x140]
0x29842db: lea rcx, [rbp - 0x80]
0x29842df: cmp r9, rax
0x29842e2: jne 0x1429842eb
0x29842e4: call 0x14141f270
0x29842e9: jmp 0x1429842ee
0x29842eb: call r9
0x29842ee: test al, al
0x29842f0: jne 0x142984307
0x29842f2: mov eax, dword ptr [rip + 0x4357678]
0x29842f8: mov dword ptr [rdi], eax
0x29842fa: mov qword ptr [rbp - 0x80], r12
0x29842fe: mov qword ptr [rbp - 0x80], r13
0x2984302: jmp 0x142984739
0x2984307: mov rax, qword ptr [rbp - 0x80]
0x298430b: mov r9, qword ptr [rax + 8]
0x298430f: lea r12, [rip - 0x262a776]
0x2984316: cmp r9, r12
0x2984319: je 0x142984663
0x298431f: mov r8d, 0xc
0x2984325: lea rdx, [rbp]
0x2984329: lea rcx, [rbp - 0x80]
0x298432d: call r9
0x2984330: test al, al
0x2984332: je 0x142984663
0x2984338: lea rdx, [rbp + 0xc]
0x298433c: lea rcx, [rbp - 0x80]
0x2984340: call 0x14141fa90
0x2984345: test al, al
0x2984347: je 0x142984663
0x298434d: mov rax, qword ptr [rbp - 0x80]
0x2984351: mov r9, qword ptr [rax + 8]
0x2984355: cmp r9, r12
0x2984358: je 0x142984663
0x298435e: mov r8d, 4
0x2984364: lea rdx, [rbp + 0x1c]
0x2984368: lea rcx, [rbp - 0x80]
0x298436c: call r9
0x298436f: test al, al
0x2984371: je 0x142984663
0x2984377: lea rdx, [rbp + 0x20]
0x298437b: lea rcx, [rbp - 0x80]
0x298437f: call 0x14141fb70
0x2984384: test al, al
0x2984386: je 0x142984663
0x298438c: lea rdx, [rbp + 0x48]
0x2984390: lea rcx, [rbp - 0x80]
0x2984394: call 0x1412ad8d0
0x2984399: test al, al
0x298439b: je 0x142984663
0x29843a1: mov rax, qword ptr [rbp - 0x80]
0x29843a5: mov r9, qword ptr [rax + 8]
0x29843a9: cmp r9, r12
0x29843ac: je 0x142984663
0x29843b2: mov r8d, 1
0x29843b8: lea rdx, [rbp + 0xd0]
0x29843bf: lea rcx, [rbp - 0x80]
0x29843c3: call r9
0x29843c6: test al, al
0x29843c8: je 0x142984663
0x29843ce: mov rax, qword ptr [rbp - 0x80]
0x29843d2: mov r9, qword ptr [rax + 8]
0x29843d6: cmp r9, r12
0x29843d9: je 0x142984663
0x29843df: mov r8d, 8
0x29843e5: lea rdx, [rbp + 0xd8]
0x29843ec: lea rcx, [rbp - 0x80]
0x29843f0: call r9
0x29843f3: test al, al
0x29843f5: je 0x142984663
0x29843fb: mov rax, qword ptr [rbp - 0x80]
0x29843ff: mov r9, qword ptr [rax + 8]
0x2984403: cmp r9, r12
0x2984406: je 0x142984663
0x298440c: mov r8d, 1
0x2984412: lea rdx, [rbp + 0xe0]
0x2984419: lea rcx, [rbp - 0x80]
0x298441d: call r9
0x2984420: test al, al
0x2984422: je 0x142984663
0x2984428: mov rax, qword ptr [rbp - 0x80]
0x298442c: mov r9, qword ptr [rax + 8]
0x2984430: cmp r9, r12
0x2984433: je 0x142984647
0x2984439: mov r8d, 8
0x298443f: lea rdx, [rbp - 0x28]
0x2984443: lea rcx, [rbp - 0x80]
0x2984447: call r9
0x298444a: test al, al
0x298444c: je 0x142984647
0x2984452: movzx eax, word ptr [rbx + 3]
0x2984456: cmp dword ptr [rbp - 0x64], eax
0x2984459: je 0x142984477
0x298445b: mov eax, dword ptr [rip + 0x435750f]
0x2984461: mov dword ptr [rdi], eax
0x2984463: lea rax, [rip + 0x2d9d7f6]
0x298446a: mov qword ptr [rbp - 0x80], rax
0x298446e: mov qword ptr [rbp - 0x80], r13
0x2984472: jmp 0x142984739
0x2984477: mov rbx, qword ptr [r14]
0x298447a: mov r8d, dword ptr [rbp + 0x140]
0x2984481: test r8d, r8d
0x2984484: jne 0x142984548
0x298448a: mov r12d, 0x3f5
0x2984490: mov word ptr [rbp - 0x60], r12w
0x2984495: mov byte ptr [rbp - 0x5e], 0xff
0x2984499: mov ebx, dword ptr [rip + 0x43574d9]
0x298449f: mov dword ptr [rbp - 0x5d], ebx
0x29844a2: movzx eax, word ptr [r15 + 0xc]
0x29844a7: mov word ptr [rbp - 0x59], ax
0x29844ab: mov qword ptr [rbp - 0x57], rsi
0x29844af: call 0x1414276d0
0x29844b4: mov dword ptr [rbp + 0x148], ebx
0x29844ba: lea rdx, [rbp + 0x148]
0x29844c1: mov rcx, rax
0x29844c4: call 0x141427c10
0x29844c9: test rax, rax
0x29844cc: je 0x1429844d8
0x29844ce: cmp dword ptr [rax + 8], 2
0x29844d2: je 0x142984631
0x29844d8: mov ebx, dword ptr [rip + 0x435749a]
0x29844de: call 0x1414276d0
0x29844e3: mov dword ptr [rbp + 0x148], ebx
0x29844e9: lea rdx, [rbp + 0x148]
0x29844f0: mov rcx, rax
0x29844f3: call 0x141427c10
0x29844f8: test rax, rax
0x29844fb: je 0x142984631
0x2984501: cmp dword ptr [rax + 8], 1
0x2984505: jne 0x142984631
0x298450b: mov rcx, qword ptr [r14]
0x298450e: mov rax, qword ptr [rcx]
0x2984511: call qword ptr [rax + 0xe8]
0x2984517: test rax, rax
0x298451a: je 0x142984631
0x2984520: mov r9d, 0x11
0x2984526: mov edx, r12d
0x2984529: mov qword ptr [rsp + 0x30], rax
0x298452e: mov byte ptr [rsp + 0x20], 0
0x2984533: lea r8, [rbp - 0x60]
0x2984537: mov rcx, qword ptr [rip + 0x43e5142]
0x298453e: call 0x142773630
0x2984543: jmp 0x142984631
0x2984548: lea rdx, [rbp - 0x48]
0x298454c: mov rcx, qword ptr [rip + 0x43e5145]
0x2984553: mov rcx, qword ptr [rcx]
0x2984556: call 0x142a82370
0x298455b: nop 
0x298455c: cmp byte ptr [rbp - 0x38], 0
0x2984560: jne 0x142984567
0x2984562: jmp 0x14298461d
0x2984567: mov r14, qword ptr [rbp - 0x40]
0x298456b: mov rax, qword ptr [rbx]
0x298456e: mov rcx, rbx
0x2984571: call qword ptr [rax + 0x160]
0x2984577: test rax, rax
0x298457a: je 0x14298461d
0x2984580: mov rax, qword ptr [rbx]
0x2984583: lea rdx, [rbp + 0x148]
0x298458a: mov rcx, rbx
0x298458d: call qword ptr [rax + 0x170]
0x2984593: mov ecx, dword ptr [r14 + 0x90]
0x298459a: cmp dword ptr [rax], ecx
0x298459c: jne 0x14298461d
0x298459e: mov rax, qword ptr [rbp - 0x40]
0x29845a2: mov rcx, qword ptr [rax + 0x68]
0x29845a6: mov rcx, qword ptr [rcx + 0x58]
0x29845aa: test rcx, rcx
0x29845ad: jne 0x1429845b1
0x29845af: jmp 0x14298461d
0x29845b1: lea r9, [rbp - 0x28]
0x29845b5: lea r8, [rbp]
0x29845b9: lea rdx, [rbp + 0x148]
0x29845c0: call 0x142ac5bf0
0x29845c5: cmp dword ptr [rbp + 0x148], 0
0x29845cc: je 0x14298461b
0x29845ce: mov rcx, qword ptr [rbp - 0x40]
0x29845d2: lea rbx, [rip + 0x31a0e1f]
0x29845d9: mov qword ptr [rbp - 0x60], rbx
0x29845dd: mov byte ptr [rbp - 0x58], 0
0x29845e1: lea rax, [rip + 0x31a0e50]
0x29845e8: mov qword ptr [rbp - 0x60], rax
0x29845ec: mov qword ptr [rbp - 0x50], rsi
0x29845f0: test rcx, rcx
0x29845f3: je 0x142984602
0x29845f5: mov rax, qword ptr [rcx]
0x29845f8: call qword ptr [rax + 0xe8]
0x29845fe: mov qword ptr [rbp - 0x50], rax
0x2984602: lea r8, [rbp + 0x140]
0x2984609: lea rdx, [rbp - 0x60]
0x298460d: mov rcx, qword ptr [rbp - 0x40]
0x2984611: call 0x14297e170
0x2984616: nop 
0x2984617: mov qword ptr [rbp - 0x60], rbx
0x298461b: jmp 0x14298461d
0x298461d: lea rax, [rip + 0x2da1824]
0x2984624: mov qword ptr [rbp - 0x48], rax
0x2984628: lea rcx, [rbp - 0x48]
0x298462c: call 0x141434880
0x2984631: mov dword ptr [rdi], esi
0x2984633: lea rax, [rip + 0x2d9d626]
0x298463a: mov qword ptr [rbp - 0x80], rax
0x298463e: mov qword ptr [rbp - 0x80], r13
0x2984642: jmp 0x142984739
0x2984647: mov eax, dword ptr [rip + 0x4357323]
0x298464d: mov dword ptr [rdi], eax
0x298464f: lea rax, [rip + 0x2d9d60a]
0x2984656: mov qword ptr [rbp - 0x80], rax
0x298465a: mov qword ptr [rbp - 0x80], r13
0x298465e: jmp 0x142984739
0x2984663: mov eax, dword ptr [rip + 0x4357307]
0x2984669: mov dword ptr [rdi], eax
0x298466b: lea rax, [rip + 0x2d9d5ee]
0x2984672: mov qword ptr [rbp - 0x80], rax
0x2984676: mov qword ptr [rbp - 0x80], r13
0x298467a: jmp 0x142984739
0x298467f: mov rbx, qword ptr [r8]
0x2984682: test rbx, rbx
0x2984685: je 0x142984710
0x298468b: mov rax, qword ptr [rbx]
0x298468e: lea rdx, [rbp - 0x10]
0x2984692: mov rcx, rbx
0x2984695: call qword ptr [rax + 0xd0]
0x298469b: mov rdx, qword ptr [rax]
0x298469e: mov qword ptr [rbp + 0x148], rdx
0x29846a5: mov rax, qword ptr [rbx]
0x29846a8: lea rdx, [rbp - 8]
0x29846ac: mov rcx, rbx
0x29846af: call qword ptr [rax + 0xd8]
0x29846b5: mov rdx, qword ptr [rax]
0x29846b8: mov qword ptr [rbp - 0x20], rdx
0x29846bc: mov rax, qword ptr [rbx]
0x29846bf: mov rcx, rbx
0x29846c2: call qword ptr [rax + 0xc8]
0x29846c8: mov qword ptr [rbp - 0x18], rax
0x29846cc: lea rax, [r15 + 0xc]
0x29846d0: lea rcx, [r15 + 0x22]
0x29846d4: lea rdx, [rbp + 0x148]
0x29846db: mov qword ptr [rsp + 0x80], rdx
0x29846e3: lea rdx, [rbp - 0x20]
0x29846e7: mov qword ptr [rsp + 0x78], rdx
0x29846ec: lea rdx, [rbp - 0x18]
0x29846f0: mov qword ptr [rsp + 0x70], rdx
0x29846f5: mov qword ptr [rsp + 0x68], rax
0x29846fa: mov qword ptr [rsp + 0x60], rcx
0x29846ff: mov eax, dword ptr [rip + 0x435726f]
0x2984705: mov dword ptr [rsp + 0x48], eax
0x2984709: call 0x14143b450
0x298470e: jmp 0x142984731
0x2984710: lea rax, [r15 + 0xc]
0x2984714: lea rcx, [r15 + 0x22]
0x2984718: mov qword ptr [rsp + 0x68], rax
0x298471d: mov qword ptr [rsp + 0x60], rcx
0x2984722: mov eax, dword ptr [rip + 0x435724c]
0x2984728: mov dword ptr [rsp + 0x48], eax
0x298472c: call 0x14143b670
0x2984731: mov eax, dword ptr [rip + 0x435723d]
0x2984737: mov dword ptr [rdi], eax
0x2984739: mov rax, rdi
0x298473c: mov rbx, qword ptr [rsp + 0x240]
0x2984744: add rsp, 0x200
0x298474b: pop r15
0x298474d: pop r14
0x298474f: pop r13
0x2984751: pop r12
0x2984753: pop rdi
0x2984754: pop rsi
0x2984755: pop rbp
0x2984756: ret 