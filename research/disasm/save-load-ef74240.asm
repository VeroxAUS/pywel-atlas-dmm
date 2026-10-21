0xef74240: mov qword ptr [rsp + 8], rbx
0xef74245: mov qword ptr [rsp + 0x10], rbp
0xef7424a: mov qword ptr [rsp + 0x20], rsi
0xef7424f: mov qword ptr [rsp + 0x18], r8
0xef74254: push rdi
0xef74255: push r14
0xef74257: push r15
0xef74259: sub rsp, 0x20
0xef7425d: mov rbx, r9
0xef74260: mov esi, edx
0xef74262: mov r14, rcx
0xef74265: mov rax, qword ptr gs:[0x58]
0xef7426e: mov rbp, qword ptr [rax]
0xef74271: mov eax, 0x240
0xef74276: xor r15d, r15d
0xef74279: mov dword ptr [rax + rbp], r15d
0xef7427d: mov edx, 0x48000003
0xef74282: sub edx, dword ptr [rip + 0x3dc734]
0xef74288: lea rcx, [rsp + 0x50]
0xef7428d: call 0x141424650
0xef74292: nop 
0xef74293: mov rdi, qword ptr [rbx]
0xef74296: lea rbx, [rip - 0x829a1ed]
0xef7429d: test rdi, rdi
0xef742a0: je 0x14ef742bf
0xef742a2: call 0x1414245b0
0xef742a7: cmp dword ptr [rax + 8], r15d
0xef742ab: ja 0x14ef742b2
0xef742ad: mov rax, rbx
0xef742b0: jmp 0x14ef742b8
0xef742b2: mov rax, qword ptr [rax]
0xef742b5: mov rax, qword ptr [rax]
0xef742b8: mov qword ptr [rax + 0x808], rdi
0xef742bf: mov rax, qword ptr [rsp + 0x60]
0xef742c4: mov rdi, qword ptr [rax]
0xef742c7: test rdi, rdi
0xef742ca: je 0x14ef742ea
0xef742cc: call 0x1414245b0
0xef742d1: cmp dword ptr [rax + 8], 1
0xef742d5: ja 0x14ef742dc
0xef742d7: mov rax, rbx
0xef742da: jmp 0x14ef742e3
0xef742dc: mov rax, qword ptr [rax]
0xef742df: mov rax, qword ptr [rax + 8]
0xef742e3: mov qword ptr [rax + 0x808], rdi
0xef742ea: call 0x1414245b0
0xef742ef: mov cx, word ptr [rip + 0x78f9c07]
0xef742f6: add dword ptr [rip + 0x78f9da1], ecx
0xef742fc: cmp dword ptr [rax + 8], 2
0xef74300: jbe 0x14ef74309
0xef74302: mov rax, qword ptr [rax]
0xef74305: mov rbx, qword ptr [rax + 0x10]
0xef74309: lea rax, [rip - 0x95f0940]
0xef74310: mov qword ptr [rbx + 0x808], rax
0xef74317: lea r8, [rip - 0x95f0696]
0xef7431e: mov edx, esi
0xef74320: mov rcx, r14
0xef74323: call 0x141424bd0
0xef74328: nop 
0xef74329: call 0x1414245b0
0xef7432e: mov rdi, rax
0xef74331: mov ebx, r15d
0xef74334: cmp dword ptr [rax + 8], ebx
0xef74337: jbe 0x14ef74384
0xef74339: mov r14d, dword ptr [rip - 0x1c7713c]
0xef74340: add r14d, 0xdb63d6b5
0xef74347: nop word ptr [rax + rax]
0xef74350: mov edx, ebx
0xef74352: mov rcx, qword ptr [rdi]
0xef74355: lea rsi, [rcx + rdx*8]
0xef74359: mov rcx, qword ptr [rsi]
0xef7435c: test rcx, rcx
0xef7435f: je 0x14ef74377
0xef74361: cmp byte ptr [r14 + rbp], 0
0xef74366: je 0x14ef7436f
0xef74368: call 0x1447f03bc
0xef7436d: jmp 0x14ef74374
0xef7436f: call 0x1447f02bc
0xef74374: mov qword ptr [rsi], r15
0xef74377: inc ebx
0xef74379: cmp ebx, dword ptr [rdi + 8]
0xef7437c: jb 0x14ef74350
0xef7437e: mov dword ptr [rdi + 8], r15d
0xef74382: jmp 0x14ef74388
0xef74384: mov dword ptr [rax + 8], r15d
0xef74388: mov rbx, qword ptr [rsp + 0x40]
0xef7438d: mov rbp, qword ptr [rsp + 0x48]
0xef74392: mov rsi, qword ptr [rsp + 0x58]
0xef74397: add rsp, 0x20
0xef7439b: pop r15
0xef7439d: pop r14
0xef7439f: pop rdi
0xef743a0: ret 