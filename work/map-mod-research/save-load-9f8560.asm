0x9f8560: mov qword ptr [rsp + 8], rbx
0x9f8565: mov qword ptr [rsp + 0x18], rbp
0x9f856a: mov qword ptr [rsp + 0x20], rsi
0x9f856f: mov qword ptr [rsp + 0x10], rdx
0x9f8574: push rdi
0x9f8575: push r12
0x9f8577: push r13
0x9f8579: push r14
0x9f857b: push r15
0x9f857d: sub rsp, 0x60
0x9f8581: mov rbx, rdx
0x9f8584: mov rdi, rcx
0x9f8587: xor eax, eax
0x9f8589: mov dword ptr [rsp + 0x20], eax
0x9f858d: mov rdx, qword ptr [rcx + 8]
0x9f8591: cmp byte ptr [rdx + 0xc0], al
0x9f8597: jne 0x1409f85e3
0x9f8599: cmp byte ptr [rdx + 0xc2], al
0x9f859f: jne 0x1409f85e3
0x9f85a1: lea r14, [rip + 0x4d2d8a0]
0x9f85a8: mov qword ptr [rbx], r14
0x9f85ab: mov qword ptr [rbx + 8], rax
0x9f85af: mov word ptr [rbx + 0x10], ax
0x9f85b3: mov qword ptr [rbx + 0x18], rax
0x9f85b7: lea r15, [rip + 0x4b7b282]
0x9f85be: mov qword ptr [rbx], r15
0x9f85c1: mov byte ptr [rbx + 0x11], al
0x9f85c4: lea r12, [rip + 0x4f1a895]
0x9f85cb: mov qword ptr [rbx], r12
0x9f85ce: mov qword ptr [rbx + 0x20], rax
0x9f85d2: mov qword ptr [rbx + 0x28], rcx
0x9f85d6: mov dword ptr [rsp + 0x20], 1
0x9f85de: jmp 0x1409f86ba
0x9f85e3: mov rax, qword ptr [rip + 0x6370ba6]
0x9f85ea: mov rcx, qword ptr [rax + 0xc8]
0x9f85f1: mov rbp, qword ptr [rcx]
0x9f85f4: mov rcx, rbp
0x9f85f7: call 0x1409a6580
0x9f85fc: mov r13, rax
0x9f85ff: test rbp, rbp
0x9f8602: je 0x1409f8615
0x9f8604: mov rcx, rbp
0x9f8607: call 0x1414343a0
0x9f860c: test al, al
0x9f860e: je 0x1409f8615
0x9f8610: mov sil, 1
0x9f8613: jmp 0x1409f8618
0x9f8615: xor sil, sil
0x9f8618: lea r14, [rip + 0x4d2d829]
0x9f861f: mov qword ptr [rsp + 0x28], r14
0x9f8624: mov qword ptr [rsp + 0x30], rbp
0x9f8629: mov byte ptr [rsp + 0x38], sil
0x9f862e: mov byte ptr [rsp + 0x39], 0
0x9f8633: xor eax, eax
0x9f8635: mov qword ptr [rsp + 0x40], rax
0x9f863a: lea r15, [rip + 0x4b7b1ff]
0x9f8641: mov qword ptr [rsp + 0x28], r15
0x9f8646: mov byte ptr [rsp + 0x39], al
0x9f864a: lea r12, [rip + 0x4f1a80f]
0x9f8651: mov qword ptr [rsp + 0x28], r12
0x9f8656: mov qword ptr [rsp + 0x48], r13
0x9f865b: mov qword ptr [rsp + 0x50], rdi
0x9f8660: test rbp, rbp
0x9f8663: je 0x1409f8678
0x9f8665: test sil, sil
0x9f8668: jne 0x1409f8678
0x9f866a: mov rax, qword ptr [rdi]
0x9f866d: mov rcx, rdi
0x9f8670: call qword ptr [rax + 0x148]
0x9f8676: xor eax, eax
0x9f8678: mov qword ptr [rbx], r14
0x9f867b: mov qword ptr [rbx + 8], rbp
0x9f867f: mov byte ptr [rbx + 0x10], sil
0x9f8683: mov byte ptr [rbx + 0x11], 0
0x9f8687: mov qword ptr [rbx + 0x18], rax
0x9f868b: mov qword ptr [rsp + 0x30], rax
0x9f8690: mov byte ptr [rsp + 0x38], 0
0x9f8695: mov qword ptr [rbx], r15
0x9f8698: mov qword ptr [rbx], r12
0x9f869b: mov qword ptr [rbx + 0x20], r13
0x9f869f: mov qword ptr [rbx + 0x28], rdi
0x9f86a3: mov dword ptr [rsp + 0x20], 1
0x9f86ab: mov qword ptr [rsp + 0x28], r12
0x9f86b0: mov qword ptr [rsp + 0x28], r15
0x9f86b5: mov qword ptr [rsp + 0x28], r14
0x9f86ba: mov rax, rbx
0x9f86bd: lea r11, [rsp + 0x60]
0x9f86c2: mov rbx, qword ptr [r11 + 0x30]
0x9f86c6: mov rbp, qword ptr [r11 + 0x40]
0x9f86ca: mov rsi, qword ptr [r11 + 0x48]
0x9f86ce: mov rsp, r11
0x9f86d1: pop r15
0x9f86d3: pop r14
0x9f86d5: pop r13
0x9f86d7: pop r12
0x9f86d9: pop rdi
0x9f86da: ret 
0x9f86db: int3 