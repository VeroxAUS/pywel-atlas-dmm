0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 