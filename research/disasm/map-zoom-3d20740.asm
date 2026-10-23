0x3d20740: mov qword ptr [rsp + 8], rbx
0x3d20745: mov qword ptr [rsp + 0x10], rbp
0x3d2074a: mov qword ptr [rsp + 0x18], rsi
0x3d2074f: mov qword ptr [rsp + 0x20], rdi
0x3d20754: push r12
0x3d20756: push r14
0x3d20758: push r15
0x3d2075a: sub rsp, 0x20
0x3d2075e: add rcx, 0x58
0x3d20762: mov rsi, r9
0x3d20765: mov rbp, r8
0x3d20768: call 0x1404743a0
0x3d2076d: mov r15, rax
0x3d20770: test rax, rax
0x3d20773: je 0x143d20825
0x3d20779: mov r14d, dword ptr [rax + 8]
0x3d2077d: xor edi, edi
0x3d2077f: test r14d, r14d
0x3d20782: je 0x143d20825
0x3d20788: mov r12d, 0x238
0x3d2078e: nop 
0x3d20790: mov rax, qword ptr [r15]
0x3d20793: mov rcx, qword ptr [rax + rdi*8]
0x3d20797: movzx eax, byte ptr [rsi + 0x18]
0x3d2079b: mov r10, qword ptr [rcx + 0x18]
0x3d2079f: test al, al
0x3d207a1: je 0x143d20807
0x3d207a3: mov r9, qword ptr [rsi + 8]
0x3d207a7: mov edx, eax
0x3d207a9: mov rax, qword ptr [rip + 0x3048c78]  ; [0x6d69428] = runtime global (no file value)
0x3d207b0: mov rdx, qword ptr [rax + rdx*8 + 0x18]
0x3d207b5: test byte ptr [rdx + 0x128], 2
0x3d207bc: je 0x143d207f0
0x3d207be: mov rax, qword ptr gs:[0x58]
0x3d207c7: mov rcx, r9
0x3d207ca: mov ebx, r12d
0x3d207cd: add rbx, qword ptr [rax]
0x3d207d0: mov rax, qword ptr [rsi]
0x3d207d3: mov rdx, qword ptr [rbx]
0x3d207d6: mov qword ptr [rdx + 0x30], rax
0x3d207da: mov qword ptr [rdx + 0x38], rbp
0x3d207de: mov qword ptr [rdx + 0x40], r10
0x3d207e2: call 0x1413ea3e0
0x3d207e7: mov rax, qword ptr [rbx]
0x3d207ea: movzx eax, byte ptr [rax + 0x20]
0x3d207ee: jmp 0x143d20816
0x3d207f0: test r9, r9
0x3d207f3: je 0x143d20803
0x3d207f5: mov rcx, qword ptr [rsi]
0x3d207f8: mov r8, r10
0x3d207fb: mov rdx, rbp
0x3d207fe: call r9
0x3d20801: jmp 0x143d20816
0x3d20803: xor al, al
0x3d20805: jmp 0x143d20816
0x3d20807: mov rax, qword ptr [rsi + 8]
0x3d2080b: mov r8, r10
0x3d2080e: mov rcx, qword ptr [rsi]
0x3d20811: mov rdx, rbp
0x3d20814: call rax
0x3d20816: cmp al, 1
0x3d20818: je 0x143d20846
0x3d2081a: inc edi
0x3d2081c: cmp edi, r14d
0x3d2081f: jb 0x143d20790
0x3d20825: xor al, al
0x3d20827: mov rbx, qword ptr [rsp + 0x40]
0x3d2082c: mov rbp, qword ptr [rsp + 0x48]
0x3d20831: mov rsi, qword ptr [rsp + 0x50]
0x3d20836: mov rdi, qword ptr [rsp + 0x58]
0x3d2083b: add rsp, 0x20
0x3d2083f: pop r15
0x3d20841: pop r14
0x3d20843: pop r12
0x3d20845: ret 
0x3d20846: mov al, 1
0x3d20848: jmp 0x143d20827
0x3d2084a: int3 