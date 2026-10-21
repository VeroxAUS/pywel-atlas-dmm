0x2356270: mov qword ptr [rsp + 8], rbx
0x2356275: mov qword ptr [rsp + 0x10], rsi
0x235627a: push rbp
0x235627b: push rdi
0x235627c: push r12
0x235627e: push r14
0x2356280: push r15
0x2356282: lea rbp, [rsp - 0x60]
0x2356287: sub rsp, 0x160
0x235628e: mov r14, rdx
0x2356291: cmp byte ptr [rip + 0x4a46a50], 3
0x2356298: jae 0x1423564ca
0x235629e: mov r9, qword ptr [rcx + 0x10]
0x23562a2: test r9, r9
0x23562a5: je 0x1423564ca
0x23562ab: xor r15d, r15d
0x23562ae: mov qword ptr [rbp + 0x48], r15
0x23562b2: mov qword ptr [rbp + 0x50], 0x105
0x23562ba: mov dword ptr [rbp + 0x54], r15d
0x23562be: mov byte ptr [rsp + 0x40], r15b
0x23562c3: mov dword ptr [rbp + 0x54], r15d
0x23562c7: mov byte ptr [rsp + 0x40], r15b
0x23562cc: mov rax, qword ptr [rbp + 0x48]
0x23562d0: test rax, rax
0x23562d3: je 0x1423562d8
0x23562d5: mov byte ptr [rax], r15b
0x23562d8: lea rcx, [r8 + 0x28]
0x23562dc: mov rax, qword ptr [rcx + 0x88]
0x23562e3: test rax, rax
0x23562e6: cmovne rcx, rax
0x23562ea: mov qword ptr [rbp + 0xa8], rcx
0x23562f1: mov dword ptr [rbp + 0x54], 0xffffffff
0x23562f8: lea rcx, [rsp + 0x40]
0x23562fd: mov rax, qword ptr [rbp + 0x48]
0x2356301: test rax, rax
0x2356304: cmovne rcx, rax
0x2356308: add r9, 0x20
0x235630c: lea rax, [rbp + 0xa8]
0x2356313: mov qword ptr [rsp + 0x20], rax
0x2356318: lea r8, [rip + 0x3222b1d]
0x235631f: mov edx, dword ptr [rbp + 0x50]
0x2356322: call 0x14064c240
0x2356327: mov qword ptr [rsp + 0x30], r15
0x235632c: mov qword ptr [rsp + 0x38], r15
0x2356331: lea rcx, [rsp + 0x40]
0x2356336: mov rax, qword ptr [rbp + 0x48]
0x235633a: test rax, rax
0x235633d: cmovne rcx, rax
0x2356341: lea r8, [rsp + 0x30]
0x2356346: lea rdx, [rip + 0x34854d3]
0x235634d: call 0x141328100
0x2356352: mov rcx, qword ptr [rip + 0x4a12fc7]
0x2356359: test rcx, rcx
0x235635c: je 0x142356420
0x2356362: call 0x1413003d0
0x2356367: mov rdi, rax
0x235636a: test rax, rax
0x235636d: je 0x142356420
0x2356373: mov qword ptr [rbp + 0xa8], r15
0x235637a: lea r12, [rip + 0x470f5bf]
0x2356381: cmp byte ptr [rax], 0
0x2356384: je 0x1423563bb
0x2356386: mov rbx, 0xffffffffffffffff
0x235638d: nop dword ptr [rax]
0x2356390: inc rbx
0x2356393: cmp byte ptr [rax + rbx], 0
0x2356397: jne 0x142356390
0x2356399: mov ecx, ebx
0x235639b: call 0x1414203f0
0x23563a0: mov rsi, rax
0x23563a3: lea edx, [rbx + 1]
0x23563a6: mov r9, 0xffffffffffffffff
0x23563ad: mov r8, rdi
0x23563b0: mov rcx, qword ptr [rax]
0x23563b3: call qword ptr [rip + 0x2e960f7]
0x23563b9: jmp 0x1423563be
0x23563bb: mov rsi, r12
0x23563be: mov qword ptr [rbp + 0xa8], rsi
0x23563c5: mov eax, dword ptr [rsp + 0x3c]
0x23563c9: mov r8d, dword ptr [rsp + 0x38]
0x23563ce: cmp eax, r8d
0x23563d1: ja 0x1423563fe
0x23563d3: lea edx, [rax*2 + 1]
0x23563da: add edx, eax
0x23563dc: shr edx, 1
0x23563de: mov eax, 1
0x23563e3: cmp edx, eax
0x23563e5: cmovb edx, eax
0x23563e8: cmp r8d, edx
0x23563eb: cmova edx, r8d
0x23563ef: lea rcx, [rsp + 0x30]
0x23563f4: call 0x14044b9e0
0x23563f9: mov r8d, dword ptr [rsp + 0x38]
0x23563fe: mov ecx, r8d
0x2356401: mov rax, qword ptr [rsp + 0x30]
0x2356406: mov qword ptr [rax + rcx*8], rsi
0x235640a: mov qword ptr [rbp + 0xa8], r12
0x2356411: inc r8d
0x2356414: mov dword ptr [rsp + 0x38], r8d
0x2356419: mov qword ptr [rbp + 0xa8], r12
0x2356420: call 0x141318e70
0x2356425: lea r8, [rsp + 0x30]
0x235642a: mov rdx, r14
0x235642d: mov rcx, qword ptr [rax + 0x1988]
0x2356434: call 0x141317d40
0x2356439: inc byte ptr [rip + 0x4a468a9]
0x235643f: mov r14d, 0x1fd
0x2356445: mov rsi, qword ptr [rsp + 0x30]
0x235644a: test rsi, rsi
0x235644d: je 0x142356494
0x235644f: mov eax, dword ptr [rsp + 0x38]
0x2356453: test eax, eax
0x2356455: je 0x142356472
0x2356457: mov rbx, rsi
0x235645a: mov edi, eax
0x235645c: nop dword ptr [rax]
0x2356460: mov rcx, rbx
0x2356463: call 0x140394db0
0x2356468: add rbx, 8
0x235646c: sub rdi, 1
0x2356470: jne 0x142356460
0x2356472: mov rax, qword ptr gs:[0x58]
0x235647b: mov rdx, qword ptr [rax]
0x235647e: mov rcx, rsi
0x2356481: cmp byte ptr [r14 + rdx], 0
0x2356486: je 0x14235648f
0x2356488: call 0x1447f03bc
0x235648d: jmp 0x142356494
0x235648f: call 0x1447f02bc
0x2356494: mov qword ptr [rsp + 0x30], r15
0x2356499: mov qword ptr [rsp + 0x38], r15
0x235649e: mov rcx, qword ptr [rbp + 0x48]
0x23564a2: test rcx, rcx
0x23564a5: je 0x1423564ca
0x23564a7: mov rax, qword ptr gs:[0x58]
0x23564b0: mov rdx, qword ptr [rax]
0x23564b3: cmp byte ptr [r14 + rdx], 0
0x23564b8: je 0x1423564c1
0x23564ba: call 0x1447f03bc
0x23564bf: jmp 0x1423564c6
0x23564c1: call 0x1447f02bc
0x23564c6: mov qword ptr [rbp + 0x48], r15
0x23564ca: lea r11, [rsp + 0x160]
0x23564d2: mov rbx, qword ptr [r11 + 0x30]
0x23564d6: mov rsi, qword ptr [r11 + 0x38]
0x23564da: mov rsp, r11
0x23564dd: pop r15
0x23564df: pop r14
0x23564e1: pop r12
0x23564e3: pop rdi
0x23564e4: pop rbp
0x23564e5: ret 