0x2c17520: mov qword ptr [rsp + 0x10], rbx
0x2c17525: mov qword ptr [rsp + 8], rcx
0x2c1752a: push rbp
0x2c1752b: push rsi
0x2c1752c: push rdi
0x2c1752d: push r12
0x2c1752f: push r13
0x2c17531: push r14
0x2c17533: push r15
0x2c17535: lea rbp, [rsp - 0x27]
0x2c1753a: sub rsp, 0x90
0x2c17541: mov rbx, r8
0x2c17544: mov r12, rdx
0x2c17547: mov rsi, rcx
0x2c1754a: mov r13, qword ptr [rcx + 8]
0x2c1754e: lea rdi, [r13 + 0x18]
0x2c17552: mov qword ptr [rbp + 0x7f], rdi
0x2c17556: mov rax, qword ptr [rdi]
0x2c17559: mov rcx, rdi
0x2c1755c: call qword ptr [rax + 8]
0x2c1755f: nop 
0x2c17560: lea rdx, [r13 + 8]
0x2c17564: xor r15d, r15d
0x2c17567: test r13, r13
0x2c1756a: cmove rdx, r15
0x2c1756e: mov r8b, 1
0x2c17571: mov rdx, qword ptr [rdx]
0x2c17574: lea rcx, [rbp + 0xf]
0x2c17578: call 0x140393650
0x2c1757d: nop 
0x2c1757e: mov r14, 0xffffffffffffffff
0x2c17585: cmp word ptr [r13 + 0x5e], 2
0x2c1758b: je 0x142c175a9
0x2c1758d: lea rdx, [rbx + 0x16]
0x2c17591: lea rcx, [rsi + 0x88]
0x2c17598: call 0x142c187a0
0x2c1759d: mov qword ptr [rsi + 0x78], r14
0x2c175a1: mov qword ptr [rsi + 0x18], r14
0x2c175a5: mov qword ptr [rsi + 0x70], r15
0x2c175a9: mov eax, dword ptr [rbx + 0x10]
0x2c175ac: mov dword ptr [rsi + 0x84], eax
0x2c175b2: mov rbx, qword ptr [rbp + 0xf]
0x2c175b6: mov rax, qword ptr [rbx]
0x2c175b9: xor edx, edx
0x2c175bb: mov rcx, rbx
0x2c175be: call qword ptr [rax + 0x20]
0x2c175c1: cmp byte ptr [rbp + 0x17], 1
0x2c175c5: jne 0x142c175f3
0x2c175c7: mov eax, r14d
0x2c175ca: lock xadd dword ptr [rbx + 8], eax
0x2c175cf: cmp eax, 1
0x2c175d2: jne 0x142c175e6
0x2c175d4: test dword ptr [rbx + 0xc], 0x40000000
0x2c175db: je 0x142c175f3
0x2c175dd: mov rax, qword ptr [rbx]
0x2c175e0: mov rcx, rbx
0x2c175e3: call qword ptr [rax + 0x40]
0x2c175e6: test dword ptr [rbx + 0xc], 0x40000000
0x2c175ed: je 0x142c175f3
0x2c175ef: lock dec dword ptr [rbx + 0xc]
0x2c175f3: mov rax, qword ptr [rdi]
0x2c175f6: mov rcx, rdi
0x2c175f9: call qword ptr [rax + 0x10]
0x2c175fc: mov rax, qword ptr gs:[0x58]
0x2c17605: mov rcx, qword ptr [rax]
0x2c17608: mov eax, 0x1ec
0x2c1760d: mov rbx, qword ptr [rip + 0x4151e1c]
0x2c17614: cmp byte ptr [rax + rcx], 0
0x2c17618: cmovne rbx, qword ptr [rip + 0x4075760]
0x2c17620: xor ecx, ecx
0x2c17622: call qword ptr [rip + 0x25d4f38]
0x2c17628: add rax, rbx
0x2c1762b: mov qword ptr [rbp + 7], rax
0x2c1762f: cmp byte ptr [rip + 0x40d77b2], 0
0x2c17636: je 0x142c17792
0x2c1763c: mov dword ptr [rsi + 0x6c], 0xffffffff
0x2c17643: mov r8, qword ptr [rsi + 0x60]
0x2c17647: lea rcx, [rsi + 0x20]
0x2c1764b: test r8, r8
0x2c1764e: cmovne rcx, r8
0x2c17652: lea rdx, [rip + 0x2f1844f]
0x2c17659: cmp rcx, rdx
0x2c1765c: je 0x142c1767f
0x2c1765e: mov dword ptr [rsi + 0x6c], r15d
0x2c17662: mov word ptr [rsi + 0x20], r15w
0x2c17667: test r8, r8
0x2c1766a: je 0x142c17670
0x2c1766c: mov word ptr [r8], r15w
0x2c17670: mov r8d, 0xe
0x2c17676: lea rcx, [rsi + 0x20]
0x2c1767a: call 0x140438db0
0x2c1767f: mov qword ptr [rsi + 0x18], 1
0x2c17687: mov rax, qword ptr [rip + 0x4152012]
0x2c1768e: mov rsi, qword ptr [rax + 0x30]
0x2c17692: mov qword ptr [rbp + 0xf], rsi
0x2c17696: xor bl, bl
0x2c17698: mov byte ptr [rbp + 0x17], bl
0x2c1769b: mov rdi, qword ptr [rsi]
0x2c1769e: mov qword ptr [rbp + 0x77], rdi
0x2c176a2: mov rax, qword ptr [rdi]
0x2c176a5: mov rcx, rdi
0x2c176a8: call qword ptr [rax + 8]
0x2c176ab: nop 
0x2c176ac: cmp byte ptr [rsi + 0x60], bl
0x2c176af: jne 0x142c176ba
0x2c176b1: mov byte ptr [rsi + 0x60], 1
0x2c176b5: mov bl, 1
0x2c176b7: mov byte ptr [rbp + 0x17], bl
0x2c176ba: mov rax, qword ptr [rdi]
0x2c176bd: mov rcx, rdi
0x2c176c0: call qword ptr [rax + 0x10]
0x2c176c3: nop 
0x2c176c4: test bl, bl
0x2c176c6: jne 0x142c176d7
0x2c176c8: mov eax, dword ptr [rip + 0x40e05d6]
0x2c176ce: mov dword ptr [r12], eax
0x2c176d2: jmp 0x142c17a1a
0x2c176d7: mov rcx, rsi
0x2c176da: call 0x141870c20
0x2c176df: nop 
0x2c176e0: mov rbx, qword ptr [rsi]
0x2c176e3: mov qword ptr [rbp + 0x77], rbx
0x2c176e7: mov rax, qword ptr [rbx]
0x2c176ea: mov rcx, rbx
0x2c176ed: call qword ptr [rax + 8]
0x2c176f0: nop 
0x2c176f1: mov byte ptr [rsi + 0x60], 0
0x2c176f5: mov rax, qword ptr [rbx]
0x2c176f8: mov rcx, rbx
0x2c176fb: call qword ptr [rax + 0x10]
0x2c176fe: call 0x141303de0
0x2c17703: lea rdx, [rip + 0x297533e]
0x2c1770a: mov rcx, rax
0x2c1770d: call 0x1413037b0
0x2c17712: test rax, rax
0x2c17715: je 0x142c1771c
0x2c17717: cmp byte ptr [rax], 0
0x2c1771a: jne 0x142c17792
0x2c1771c: call 0x141303de0
0x2c17721: lea rdx, [rip + 0x2975308]
0x2c17728: mov rcx, rax
0x2c1772b: call 0x1413037b0
0x2c17730: test rax, rax
0x2c17733: je 0x142c1773a
0x2c17735: cmp byte ptr [rax], 0
0x2c17738: jne 0x142c17792
0x2c1773a: mov r10d, r15d
0x2c1773d: mov r11, r15
0x2c17740: mov rdx, qword ptr [rsi + 0x40]
0x2c17744: mov r8, rdx
0x2c17747: mov eax, dword ptr [rsi + 0x48]
0x2c1774a: imul r9, rax, 0x68
0x2c1774e: add r9, rdx
0x2c17751: cmp rdx, r9
0x2c17754: je 0x142c17792
0x2c17756: mov ecx, dword ptr [r8]
0x2c17759: cmp ecx, 2
0x2c1775c: jbe 0x142c17766
0x2c1775e: lea eax, [rcx - 0x64]
0x2c17761: cmp eax, 8
0x2c17764: ja 0x142c17775
0x2c17766: mov rax, qword ptr [r8 + 8]
0x2c1776a: cmp r11, rax
0x2c1776d: jge 0x142c17775
0x2c1776f: mov r11, rax
0x2c17772: mov r10d, ecx
0x2c17775: add r8, 0x68
0x2c17779: cmp r8, r9
0x2c1777c: jne 0x142c17756
0x2c1777e: nop 
0x2c17780: cmp dword ptr [rdx], r10d
0x2c17783: je 0x142c17874
0x2c17789: add rdx, 0x68
0x2c1778d: cmp rdx, r9
0x2c17790: jne 0x142c17780
0x2c17792: mov rdi, qword ptr [r13 + 0x78]
0x2c17796: mov r15d, dword ptr [r13 + 0x80]
0x2c1779d: shl r15, 4
0x2c177a1: add r15, rdi
0x2c177a4: cmp rdi, r15
0x2c177a7: je 0x142c177e5
0x2c177a9: nop dword ptr [rax]
0x2c177b0: mov rsi, qword ptr [rdi]
0x2c177b3: movzx eax, word ptr [rdi + 8]
0x2c177b7: mov word ptr [rbp + 0x77], ax
0x2c177bb: cmp byte ptr [rsi + 0x12], 0
0x2c177bf: jne 0x142c177dc
0x2c177c1: mov rax, qword ptr [rsi]
0x2c177c4: lea rdx, [rbp + 0x7f]
0x2c177c8: mov rcx, rsi
0x2c177cb: call qword ptr [rax + 0x68]
0x2c177ce: mov ebx, dword ptr [rax]
0x2c177d0: test ebx, ebx
0x2c177d2: jne 0x142c17899
0x2c177d8: mov byte ptr [rsi + 0x12], 1
0x2c177dc: add rdi, 0x10
0x2c177e0: cmp rdi, r15
0x2c177e3: jne 0x142c177b0
0x2c177e5: lea rdi, [r13 + 0x18]
0x2c177e9: mov qword ptr [rbp + 0x77], rdi
0x2c177ed: mov rax, qword ptr [rdi]
0x2c177f0: mov rcx, rdi
0x2c177f3: call qword ptr [rax + 8]
0x2c177f6: nop 
0x2c177f7: mov r8b, 1
0x2c177fa: mov rdx, qword ptr [r13 + 8]
0x2c177fe: lea rcx, [rbp + 0xf]
0x2c17802: call 0x140393650
0x2c17807: nop 
0x2c17808: cmp word ptr [r13 + 0x5e], 1
0x2c1780e: je 0x142c178c0
0x2c17814: mov eax, dword ptr [rip + 0x40c4116]
0x2c1781a: test eax, eax
0x2c1781c: je 0x142c178c0
0x2c17822: mov dword ptr [r12], eax
0x2c17826: mov rbx, qword ptr [rbp + 0xf]
0x2c1782a: mov rax, qword ptr [rbx]
0x2c1782d: xor edx, edx
0x2c1782f: mov rcx, rbx
0x2c17832: call qword ptr [rax + 0x20]
0x2c17835: cmp byte ptr [rbp + 0x17], 1
0x2c17839: jne 0x142c17866
0x2c1783b: lock xadd dword ptr [rbx + 8], r14d
0x2c17841: cmp r14d, 1
0x2c17845: jne 0x142c17859
0x2c17847: test dword ptr [rbx + 0xc], 0x40000000
0x2c1784e: je 0x142c17866
0x2c17850: mov rax, qword ptr [rbx]
0x2c17853: mov rcx, rbx
0x2c17856: call qword ptr [rax + 0x40]
0x2c17859: test dword ptr [rbx + 0xc], 0x40000000
0x2c17860: je 0x142c17866
0x2c17862: lock dec dword ptr [rbx + 0xc]
0x2c17866: mov rax, qword ptr [rdi]
0x2c17869: mov rcx, rdi
0x2c1786c: call qword ptr [rax + 0x10]
0x2c1786f: jmp 0x142c17a1a
0x2c17874: mov r9, r13
0x2c17877: mov r8d, r10d
0x2c1787a: lea rdx, [rbp + 0x77]
0x2c1787e: mov rcx, rsi
0x2c17881: call 0x14186f570
0x2c17886: mov eax, dword ptr [rax]
0x2c17888: test eax, eax
0x2c1788a: je 0x142c17792
0x2c17890: mov dword ptr [r12], eax
0x2c17894: jmp 0x142c17a1a
0x2c17899: lea rax, [rbp + 0x77]
0x2c1789d: mov qword ptr [rsp + 0x60], rax
0x2c178a2: lea rax, [rip + 0x296f077]
0x2c178a9: mov qword ptr [rsp + 0x58], rax
0x2c178ae: mov dword ptr [rsp + 0x48], ebx
0x2c178b2: call 0x14050d2d0
0x2c178b7: mov dword ptr [r12], ebx
0x2c178bb: jmp 0x142c17a1a
0x2c178c0: call 0x141439540
0x2c178c5: mov rcx, qword ptr [rax]
0x2c178c8: test rcx, rcx
0x2c178cb: je 0x142c178e4
0x2c178cd: cmp qword ptr [rcx + 8], 0
0x2c178d2: je 0x142c178e4
0x2c178d4: call 0x141439540
0x2c178d9: mov rcx, qword ptr [rax + 8]
0x2c178dd: lock inc dword ptr [rcx + 0xa8]
0x2c178e4: movzx eax, word ptr [r13 + 0x5e]
0x2c178e9: cmp ax, 1
0x2c178ed: jne 0x142c17a38
0x2c178f3: mov word ptr [r13 + 0x5e], 2
0x2c178fa: mov rax, qword ptr [rbp + 0x67]
0x2c178fe: mov rcx, qword ptr [rbp + 7]
0x2c17902: mov qword ptr [rax + 0x70], rcx
0x2c17906: call 0x141439540
0x2c1790b: mov rcx, qword ptr [rax]
0x2c1790e: test rcx, rcx
0x2c17911: je 0x142c1793a
0x2c17913: cmp qword ptr [rcx + 8], 0
0x2c17918: je 0x142c1793a
0x2c1791a: call 0x141439540
0x2c1791f: mov rcx, qword ptr [rax + 8]
0x2c17923: lock dec dword ptr [rcx + 0xa8]
0x2c1792a: call 0x141439540
0x2c1792f: mov rcx, qword ptr [rax + 8]
0x2c17933: lock inc dword ptr [rcx + 0xac]
0x2c1793a: cmp word ptr [r13 + 0x5e], 2
0x2c17940: jne 0x142c17949
0x2c17942: mov word ptr [r13 + 0x5e], 4
0x2c17949: mov rbx, qword ptr [rbp + 0xf]
0x2c1794d: mov rax, qword ptr [rbx]
0x2c17950: xor edx, edx
0x2c17952: mov rcx, rbx
0x2c17955: call qword ptr [rax + 0x20]
0x2c17958: cmp byte ptr [rbp + 0x17], 1
0x2c1795c: jne 0x142c17989
0x2c1795e: lock xadd dword ptr [rbx + 8], r14d
0x2c17964: cmp r14d, 1
0x2c17968: jne 0x142c1797c
0x2c1796a: test dword ptr [rbx + 0xc], 0x40000000
0x2c17971: je 0x142c17989
0x2c17973: mov rax, qword ptr [rbx]
0x2c17976: mov rcx, rbx
0x2c17979: call qword ptr [rax + 0x40]
0x2c1797c: test dword ptr [rbx + 0xc], 0x40000000
0x2c17983: je 0x142c17989
0x2c17985: lock dec dword ptr [rbx + 0xc]
0x2c17989: mov rax, qword ptr [rdi]
0x2c1798c: mov rcx, rdi
0x2c1798f: call qword ptr [rax + 0x10]
0x2c17992: mov eax, dword ptr [r13 + 0x60]
0x2c17996: mov dword ptr [rbp + 0x67], eax
0x2c17999: mov rax, qword ptr [r13 + 0x1f8]
0x2c179a0: lea rbx, [rip + 0x2f0da51]
0x2c179a7: mov qword ptr [rbp + 0xf], rbx
0x2c179ab: mov byte ptr [rbp + 0x17], 0
0x2c179af: lea rdi, [rip + 0x2f0da82]
0x2c179b6: mov qword ptr [rbp + 0xf], rdi
0x2c179ba: mov qword ptr [rbp + 0x1f], rax
0x2c179be: lea r8, [rbp + 0x67]
0x2c179c2: lea rdx, [rbp + 0xf]
0x2c179c6: mov rcx, r13
0x2c179c9: call 0x142a1ee40
0x2c179ce: nop 
0x2c179cf: mov qword ptr [rbp + 0xf], rbx
0x2c179d3: cmp qword ptr [r13 + 0x1f8], 0
0x2c179db: je 0x142c179ea
0x2c179dd: mov rcx, qword ptr [r13 + 0x68]
0x2c179e1: mov rcx, qword ptr [rcx + 0x10]
0x2c179e5: call 0x142b7fc70
0x2c179ea: mov rax, qword ptr [r13 + 0x1f8]
0x2c179f1: mov qword ptr [rbp + 0xf], rbx
0x2c179f5: mov byte ptr [rbp + 0x17], 0
0x2c179f9: mov qword ptr [rbp + 0xf], rdi
0x2c179fd: mov qword ptr [rbp + 0x1f], rax
0x2c17a01: lea rdx, [rbp + 0xf]
0x2c17a05: mov rcx, r13
0x2c17a08: call 0x142a1f280
0x2c17a0d: nop 
0x2c17a0e: mov qword ptr [rbp + 0xf], rbx
0x2c17a12: mov dword ptr [r12], 0
0x2c17a1a: mov rax, r12
0x2c17a1d: mov rbx, qword ptr [rsp + 0xd8]
0x2c17a25: add rsp, 0x90
0x2c17a2c: pop r15
0x2c17a2e: pop r14
0x2c17a30: pop r13
0x2c17a32: pop r12
0x2c17a34: pop rdi
0x2c17a35: pop rsi
0x2c17a36: pop rbp
0x2c17a37: ret 
0x2c17a38: cmp ax, 2
0x2c17a3c: je 0x142c178fa
0x2c17a42: mov eax, dword ptr [rip + 0x40c3ee0]
0x2c17a48: test eax, eax
0x2c17a4a: je 0x142c178fa
0x2c17a50: mov dword ptr [r12], eax
0x2c17a54: mov rbx, qword ptr [rbp + 0xf]
0x2c17a58: mov rax, qword ptr [rbx]
0x2c17a5b: xor edx, edx
0x2c17a5d: mov rcx, rbx
0x2c17a60: call qword ptr [rax + 0x20]
0x2c17a63: cmp byte ptr [rbp + 0x17], 1
0x2c17a67: jne 0x142c17a94
0x2c17a69: lock xadd dword ptr [rbx + 8], r14d
0x2c17a6f: cmp r14d, 1
0x2c17a73: jne 0x142c17a87
0x2c17a75: test dword ptr [rbx + 0xc], 0x40000000
0x2c17a7c: je 0x142c17a94
0x2c17a7e: mov rax, qword ptr [rbx]
0x2c17a81: mov rcx, rbx
0x2c17a84: call qword ptr [rax + 0x40]
0x2c17a87: test dword ptr [rbx + 0xc], 0x40000000
0x2c17a8e: je 0x142c17a94
0x2c17a90: lock dec dword ptr [rbx + 0xc]
0x2c17a94: mov rax, qword ptr [rdi]
0x2c17a97: mov rcx, rdi
0x2c17a9a: call qword ptr [rax + 0x10]
0x2c17a9d: jmp 0x142c17a1a