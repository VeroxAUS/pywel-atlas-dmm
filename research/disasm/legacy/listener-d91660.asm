0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 