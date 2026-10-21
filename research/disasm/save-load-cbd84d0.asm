0xcbd84d0: mov r11, rsp
0xcbd84d3: mov qword ptr [r11 + 8], rbx
0xcbd84d7: mov qword ptr [r11 + 0x10], rbp
0xcbd84db: mov qword ptr [r11 + 0x20], rsi
0xcbd84df: push rdi
0xcbd84e0: push r12
0xcbd84e2: push r13
0xcbd84e4: push r14
0xcbd84e6: push r15
0xcbd84e8: sub rsp, 0x40
0xcbd84ec: mov r12, r9
0xcbd84ef: mov r13, r8
0xcbd84f2: mov r14, rdx
0xcbd84f5: mov rsi, rcx
0xcbd84f8: mov rdi, qword ptr [rsp + 0x98]
0xcbd8500: mov rax, qword ptr [r8 + 0x68]
0xcbd8504: mov rcx, qword ptr [rax + 0x1a0]
0xcbd850b: movzx eax, word ptr [rcx + 0x28]
0xcbd850f: mov word ptr [r11 + 0x18], ax
0xcbd8514: lea rcx, [r11 + 0x18]
0xcbd8518: call 0x1404a2010
0xcbd851d: cmp byte ptr [rax + 0x6b], 0
0xcbd8521: je 0x14cbd85d4
0xcbd8527: mov r9, r12
0xcbd852a: mov r8, r13
0xcbd852d: lea rdx, [rsp + 0x80]
0xcbd8535: call 0x14186f000
0xcbd853a: mov eax, dword ptr [rax]
0xcbd853c: test eax, eax
0xcbd853e: je 0x14cbd8548
0xcbd8540: mov dword ptr [r14], eax
0xcbd8543: jmp 0x14cbd8769
0xcbd8548: cmp byte ptr [rip - 0x5ef3b27], 0
0xcbd854f: je 0x14cbd85e3
0xcbd8555: test byte ptr [r12], 1
0xcbd855a: jne 0x14cbd85e3
0xcbd8560: movzx ecx, byte ptr [rsp + 0x90]
0xcbd8568: test ecx, ecx
0xcbd856a: je 0x14cbd85e3
0xcbd856c: sub ecx, 0xd2214901
0xcbd8572: add ecx, dword ptr [rip + 0xbfe638]
0xcbd8578: je 0x14cbd85e3
0xcbd857a: sub ecx, 1
0xcbd857d: je 0x14cbd85e3
0xcbd857f: sub ecx, 1
0xcbd8582: je 0x14cbd8599
0xcbd8584: cmp ecx, 1
0xcbd8587: je 0x14cbd85e3
0xcbd8589: mov byte ptr [rdi + 8], 0
0xcbd858d: mov dword ptr [r14], 0
0xcbd8594: jmp 0x14cbd8769
0xcbd8599: xor ecx, ecx
0xcbd859b: call qword ptr [rip - 0x79ec041]
0xcbd85a1: mov rbx, rax
0xcbd85a4: call 0x141416980
0xcbd85a9: add rbx, rax
0xcbd85ac: mov r15, qword ptr [rsi]
0xcbd85af: mov qword ptr [rsp + 0x80], r15
0xcbd85b7: mov rax, qword ptr [r15]
0xcbd85ba: mov rcx, r15
0xcbd85bd: call qword ptr [rax + 8]
0xcbd85c0: nop 
0xcbd85c1: cmp qword ptr [rsi + 0x68], rbx
0xcbd85c5: mov rax, qword ptr [r15]
0xcbd85c8: mov rcx, r15
0xcbd85cb: jle 0x14cbd85e0
0xcbd85cd: call qword ptr [rax + 0x10]
0xcbd85d0: mov byte ptr [rdi + 8], 0
0xcbd85d4: mov dword ptr [r14], 0
0xcbd85db: jmp 0x14cbd8769
0xcbd85e0: call qword ptr [rax + 0x10]
0xcbd85e3: mov byte ptr [rdi + 8], 1
0xcbd85e7: mov qword ptr [rsp + 0x30], rsi
0xcbd85ec: xor bpl, bpl
0xcbd85ef: mov byte ptr [rsp + 0x38], bpl
0xcbd85f4: mov rbx, qword ptr [rsi]
0xcbd85f7: mov qword ptr [rsp + 0x80], rbx
0xcbd85ff: mov rax, qword ptr [rbx]
0xcbd8602: mov rcx, rbx
0xcbd8605: call qword ptr [rax + 8]
0xcbd8608: nop 
0xcbd8609: cmp byte ptr [rsi + 0x60], bpl
0xcbd860d: jne 0x14cbd861b
0xcbd860f: mov byte ptr [rsi + 0x60], 1
0xcbd8613: mov bpl, 1
0xcbd8616: mov byte ptr [rsp + 0x38], bpl
0xcbd861b: mov rax, qword ptr [rbx]
0xcbd861e: mov rcx, rbx
0xcbd8621: call qword ptr [rax + 0x10]
0xcbd8624: nop 
0xcbd8625: test bpl, bpl
0xcbd8628: jne 0x14cbd8638
0xcbd862a: mov eax, dword ptr [rip - 0x5ee098c]
0xcbd8630: mov dword ptr [r14], eax
0xcbd8633: jmp 0x14cbd8769
0xcbd8638: test byte ptr [r12], 4
0xcbd863d: je 0x14cbd8680
0xcbd863f: mov rbx, qword ptr [rsi]
0xcbd8642: mov qword ptr [rsp + 0x80], rbx
0xcbd864a: mov rax, qword ptr [rbx]
0xcbd864d: mov rcx, rbx
0xcbd8650: call qword ptr [rax + 8]
0xcbd8653: nop 
0xcbd8654: inc word ptr [rsi + 0x58]
0xcbd8658: movzx eax, word ptr [rsi + 0x58]
0xcbd865c: mov word ptr [rdi], ax
0xcbd865f: mov eax, dword ptr [rsi + 0x5c]
0xcbd8662: cmp eax, -1
0xcbd8665: jne 0x14cbd8672
0xcbd8667: mov rcx, rsi
0xcbd866a: call 0x141871850
0xcbd866f: mov dword ptr [rsi + 0x5c], eax
0xcbd8672: mov dword ptr [rdi + 4], eax
0xcbd8675: mov rax, qword ptr [rbx]
0xcbd8678: mov rcx, rbx
0xcbd867b: call qword ptr [rax + 0x10]
0xcbd867e: jmp 0x14cbd868b
0xcbd8680: mov rcx, rsi
0xcbd8683: call 0x141871850
0xcbd8688: mov dword ptr [rdi + 4], eax
0xcbd868b: mov eax, dword ptr [rdi + 4]
0xcbd868e: cmp dword ptr [rsi + 0x78], eax
0xcbd8691: je 0x14cbd86b7
0xcbd8693: xor ecx, ecx
0xcbd8695: call qword ptr [rip - 0x79ec13b]
0xcbd869b: mov rbx, rax
0xcbd869e: call 0x141416980
0xcbd86a3: lea rcx, [rbx + 0x258]
0xcbd86aa: add rcx, rax
0xcbd86ad: mov qword ptr [rsi + 0x70], rcx
0xcbd86b1: mov eax, dword ptr [rdi + 4]
0xcbd86b4: mov dword ptr [rsi + 0x78], eax
0xcbd86b7: mov qword ptr [rsp + 0x20], r12
0xcbd86bc: mov r9, r13
0xcbd86bf: mov r8d, dword ptr [rdi + 4]
0xcbd86c3: lea rdx, [rsp + 0x80]
0xcbd86cb: mov rcx, rsi
0xcbd86ce: call 0x14186e450
0xcbd86d3: mov eax, dword ptr [rax]
0xcbd86d5: test eax, eax
0xcbd86d7: je 0x14cbd8700
0xcbd86d9: mov dword ptr [r14], eax
0xcbd86dc: test bpl, bpl
0xcbd86df: je 0x14cbd8769
0xcbd86e5: mov rbx, qword ptr [rsi]
0xcbd86e8: mov qword ptr [rsp + 0x80], rbx
0xcbd86f0: mov rax, qword ptr [rbx]
0xcbd86f3: mov rcx, rbx
0xcbd86f6: call qword ptr [rax + 8]
0xcbd86f9: nop 
0xcbd86fa: mov byte ptr [rsi + 0x60], 0
0xcbd86fe: jmp 0x14cbd8760
0xcbd8700: xor ecx, ecx
0xcbd8702: call qword ptr [rip - 0x79ec1a8]
0xcbd8708: mov rbx, rax
0xcbd870b: call 0x141416980
0xcbd8710: add rax, 0x384
0xcbd8716: add rbx, rax
0xcbd8719: mov rdi, qword ptr [rsi]
0xcbd871c: mov qword ptr [rsp + 0x80], rdi
0xcbd8724: mov rax, qword ptr [rdi]
0xcbd8727: mov rcx, rdi
0xcbd872a: call qword ptr [rax + 8]
0xcbd872d: nop 
0xcbd872e: mov qword ptr [rsi + 0x68], rbx
0xcbd8732: mov rax, qword ptr [rdi]
0xcbd8735: mov rcx, rdi
0xcbd8738: call qword ptr [rax + 0x10]
0xcbd873b: mov dword ptr [r14], 0
0xcbd8742: test bpl, bpl
0xcbd8745: je 0x14cbd8769
0xcbd8747: mov rbx, qword ptr [rsi]
0xcbd874a: mov qword ptr [rsp + 0x80], rbx
0xcbd8752: mov rax, qword ptr [rbx]
0xcbd8755: mov rcx, rbx
0xcbd8758: call qword ptr [rax + 8]
0xcbd875b: nop 
0xcbd875c: mov byte ptr [rsi + 0x60], 0
0xcbd8760: mov rax, qword ptr [rbx]
0xcbd8763: mov rcx, rbx
0xcbd8766: call qword ptr [rax + 0x10]
0xcbd8769: mov rax, r14
0xcbd876c: mov rbx, qword ptr [rsp + 0x70]
0xcbd8771: mov rbp, qword ptr [rsp + 0x78]
0xcbd8776: mov rsi, qword ptr [rsp + 0x88]
0xcbd877e: add rsp, 0x40
0xcbd8782: pop r15
0xcbd8784: pop r14
0xcbd8786: pop r13
0xcbd8788: pop r12
0xcbd878a: pop rdi
0xcbd878b: ret 