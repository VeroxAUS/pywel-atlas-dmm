0x9fe740: mov qword ptr [rsp + 0x10], rbx
0x9fe745: mov qword ptr [rsp + 0x18], rbp
0x9fe74a: mov qword ptr [rsp + 0x20], rsi
0x9fe74f: push rdi
0x9fe750: sub rsp, 0x60
0x9fe754: vmovaps xmmword ptr [rsp + 0x50], xmm6
0x9fe75a: movzx esi, r9b
0x9fe75e: vmovaps xmm6, xmm2
0x9fe762: mov rdi, rdx
0x9fe765: mov rbp, rcx
0x9fe768: mov rax, qword ptr [rcx + 8]
0x9fe76c: lea rdx, [rax + 8]
0x9fe770: xor ecx, ecx
0x9fe772: test rax, rax
0x9fe775: cmove rdx, rcx
0x9fe779: mov r8b, 1
0x9fe77c: mov rdx, qword ptr [rdx]
0x9fe77f: lea rcx, [rsp + 0x40]
0x9fe784: call 0x140393650
0x9fe789: nop 
0x9fe78a: mov byte ptr [rsp + 0x30], 0
0x9fe78f: movzx ebx, byte ptr [rsp + 0x98]
0x9fe797: mov byte ptr [rsp + 0x28], bl
0x9fe79b: lea rax, [rip + 0x4b476e6]
0x9fe7a2: mov qword ptr [rsp + 0x20], rax
0x9fe7a7: xor r9d, r9d
0x9fe7aa: movzx r8d, sil
0x9fe7ae: mov rdx, rdi
0x9fe7b1: mov rcx, rbp
0x9fe7b4: call 0x1409fca60
0x9fe7b9: movzx r9d, bl
0x9fe7bd: movzx r8d, byte ptr [rsp + 0x90]
0x9fe7c6: vmovaps xmm1, xmm6
0x9fe7ca: mov rcx, rbp
0x9fe7cd: call 0x1409fcd40
0x9fe7d2: nop 
0x9fe7d3: mov rbx, qword ptr [rsp + 0x40]
0x9fe7d8: mov rax, qword ptr [rbx]
0x9fe7db: xor edx, edx
0x9fe7dd: mov rcx, rbx
0x9fe7e0: call qword ptr [rax + 0x20]
0x9fe7e3: cmp byte ptr [rsp + 0x48], 1
0x9fe7e8: jne 0x1409fe818
0x9fe7ea: mov eax, 0xffffffff
0x9fe7ef: lock xadd dword ptr [rbx + 8], eax
0x9fe7f4: cmp eax, 1
0x9fe7f7: jne 0x1409fe80b
0x9fe7f9: test dword ptr [rbx + 0xc], 0x40000000
0x9fe800: je 0x1409fe818
0x9fe802: mov rax, qword ptr [rbx]
0x9fe805: mov rcx, rbx
0x9fe808: call qword ptr [rax + 0x40]
0x9fe80b: test dword ptr [rbx + 0xc], 0x40000000
0x9fe812: je 0x1409fe818
0x9fe814: lock dec dword ptr [rbx + 0xc]
0x9fe818: lea r11, [rsp + 0x60]
0x9fe81d: mov rbx, qword ptr [r11 + 0x18]
0x9fe821: mov rbp, qword ptr [r11 + 0x20]
0x9fe825: mov rsi, qword ptr [r11 + 0x28]
0x9fe829: vmovaps xmm6, xmmword ptr [rsp + 0x50]
0x9fe82f: mov rsp, r11
0x9fe832: pop rdi
0x9fe833: ret 