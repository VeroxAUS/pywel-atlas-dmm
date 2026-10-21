0xdec5b0: jmp 0x14ab66230
0xdec5b5: jbe 0x140dec5d0
0xdec5b7: xchg edi, eax
0xdec5b8: hlt 
0xdec5b9: mov gs, esi
0xdec5bb: jae 0x1407e9bfc
0xdec5c1: jae 0x140dec56b
0xdec5c3: je 0x14124dfc0
0xdec5c9: pop rbx
0xdec5ca: movsd dword ptr [rdi], dword ptr [rsi]
0xdec5cb: xchg edi, eax
0xdec5cc: sub dword ptr [rdi + rcx + 0x167df080], ebx
0xdec5d3: add byte ptr [rax + rax], ah
0xdec5d6: int3 
CALLEE 0xab66230
0xab66230: mov qword ptr [rsp + 8], rbx
0xab66235: mov qword ptr [rsp + 0x18], rsi
0xab6623a: mov qword ptr [rsp + 0x20], rdi
0xab6623f: push rbp
0xab66240: lea rbp, [rsp - 0x60]
0xab66245: sub rsp, 0x160
0xab6624c: movzx r9d, cl
0xab66250: lea rcx, [rip - 0x3e959b7]
0xab66257: lea rax, [rip - 0x3e955be]
0xab6625e: test dl, dl
0xab66260: cmove rax, rcx
0xab66264: lea rbx, [rax + r9*4]
0xab66268: cmp dword ptr [rbx], 0
0xab6626b: jne 0x14ab66372
0xab66271: xor esi, esi
0xab66273: mov qword ptr [rbp + 0x48], rsi
0xab66277: mov qword ptr [rbp + 0x50], 0x105
0xab6627f: mov dword ptr [rbp + 0x54], esi
0xab66282: mov byte ptr [rsp + 0x40], sil
0xab66287: mov dword ptr [rbp + 0x54], esi
0xab6628a: mov byte ptr [rsp + 0x40], sil
0xab6628f: mov rax, qword ptr [rbp + 0x48]
0xab66293: test rax, rax
0xab66296: je 0x14ab6629b
0xab66298: mov byte ptr [rax], sil
0xab6629b: lea rax, [rip - 0x54f421a]
0xab662a2: lea r8, [rip - 0x54f4211]
0xab662a9: test dl, dl
0xab662ab: mov word ptr [rip - 0x311db21], dx
0xab662b2: cmovne r8, rax
0xab662b6: lea rdi, [rip - 0x55f034d]
0xab662bd: mov qword ptr [rsp + 0x20], rdi
0xab662c2: mov byte ptr [rsp + 0x28], 0
0xab662c7: mov eax, 2
0xab662cc: mov word ptr [rsp + 0x2a], ax
0xab662d1: lea rax, [rip - 0x5444438]
0xab662d8: mov qword ptr [rsp + 0x20], rax
0xab662dd: mov qword ptr [rsp + 0x30], r9
0xab662e2: mov word ptr [rsp + 0x38], 0x100
0xab662e9: mov dword ptr [rbp + 0x54], 0xffffffff
0xab662f0: lea rcx, [rsp + 0x40]
0xab662f5: mov rax, qword ptr [rbp + 0x48]
0xab662f9: test rax, rax
0xab662fc: cmovne rcx, rax
0xab66300: lea r9, [rsp + 0x20]
0xab66305: mov edx, dword ptr [rbp + 0x50]
0xab66308: call 0x14064c020
0xab6630d: nop 
0xab6630e: mov qword ptr [rsp + 0x20], rdi
0xab66313: lea rdx, [rsp + 0x40]
0xab66318: mov rax, qword ptr [rbp + 0x48]
0xab6631c: test rax, rax
0xab6631f: cmovne rdx, rax
0xab66323: mov dword ptr [rbp + 0x78], esi
0xab66326: mov r9d, 0x2ffff
0xab6632c: mov r8d, 1
0xab66332: lea rcx, [rbp + 0x78]
0xab66336: call 0x1412becb0
0xab6633b: mov eax, dword ptr [rbp + 0x78]
0xab6633e: mov dword ptr [rbx], eax
0xab66340: mov rcx, qword ptr [rbp + 0x48]
0xab66344: test rcx, rcx
0xab66347: je 0x14ab66372
0xab66349: mov r8d, 0x1fd
0xab6634f: mov rax, qword ptr gs:[0x58]
0xab66358: mov rdx, qword ptr [rax]
0xab6635b: cmp byte ptr [r8 + rdx], 0
0xab66360: je 0x14ab66369
0xab66362: call 0x1447f03bc
0xab66367: jmp 0x14ab6636e
0xab66369: call 0x1447f02bc
0xab6636e: mov qword ptr [rbp + 0x48], rsi
0xab66372: mov rax, rbx
0xab66375: lea r11, [rsp + 0x160]
0xab6637d: mov rbx, qword ptr [r11 + 0x10]
0xab66381: mov rsi, qword ptr [r11 + 0x20]
0xab66385: mov rdi, qword ptr [r11 + 0x28]
0xab66389: mov rsp, r11
0xab6638c: pop rbp
0xab6638d: ret 
