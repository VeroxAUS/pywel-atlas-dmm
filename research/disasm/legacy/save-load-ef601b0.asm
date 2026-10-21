0xef601b0: mov qword ptr [rsp + 8], rbx
0xef601b5: mov qword ptr [rsp + 0x18], rsi
0xef601ba: push rbp
0xef601bb: push rdi
0xef601bc: push r14
0xef601be: lea rbp, [rsp - 0x2c0]
0xef601c6: sub rsp, 0x3c0
0xef601cd: mov rdi, rdx
0xef601d0: mov rbx, rcx
0xef601d3: cmp dword ptr [rdx + 0x6a8], 0
0xef601da: jne 0x14ef601e3
0xef601dc: mov al, 1
0xef601de: jmp 0x14ef60420
0xef601e3: call 0x142358d40
0xef601e8: xor r14d, r14d
0xef601eb: mov qword ptr [rbp + 0x68], r14
0xef601ef: mov qword ptr [rbp + 0x70], 0x105
0xef601f7: mov dword ptr [rbp + 0x74], r14d
0xef601fb: mov byte ptr [rsp + 0x60], r14b
0xef60200: mov dword ptr [rbp + 0x74], r14d
0xef60204: mov byte ptr [rsp + 0x60], r14b
0xef60209: mov rax, qword ptr [rbp + 0x68]
0xef6020d: test rax, rax
0xef60210: je 0x14ef60215
0xef60212: mov byte ptr [rax], r14b
0xef60215: lea rcx, [rdi + 0x28]
0xef60219: mov rax, qword ptr [rcx + 0x88]
0xef60220: test rax, rax
0xef60223: cmovne rcx, rax
0xef60227: mov qword ptr [rbp + 0x2e8], rcx
0xef6022e: mov dword ptr [rbp + 0x74], 0xffffffff
0xef60235: lea rcx, [rsp + 0x60]
0xef6023a: mov rax, qword ptr [rbp + 0x68]
0xef6023e: test rax, rax
0xef60241: cmovne rcx, rax
0xef60245: lea r9, [rbx + 0x20]
0xef60249: lea rax, [rbp + 0x2e8]
0xef60250: mov qword ptr [rsp + 0x20], rax
0xef60255: lea r8, [rip - 0x99e7420]
0xef6025c: mov edx, dword ptr [rbp + 0x70]
0xef6025f: call 0x14064c240
0xef60264: mov qword ptr [rbp + 0x2a8], r14
0xef6026b: mov qword ptr [rbp + 0x2b0], 0x105
0xef60276: mov dword ptr [rbp + 0x2b4], r14d
0xef6027d: mov byte ptr [rbp + 0x1a0], 0
0xef60284: mov dword ptr [rbp + 0x2b4], r14d
0xef6028b: mov byte ptr [rbp + 0x1a0], 0
0xef60292: mov rax, qword ptr [rbp + 0x2a8]
0xef60299: test rax, rax
0xef6029c: je 0x14ef602a1
0xef6029e: mov byte ptr [rax], 0
0xef602a1: lea r8, [rbp + 0x1a0]
0xef602a8: mov rdx, rdi
0xef602ab: mov rcx, rbx
0xef602ae: call 0x14235a500
0xef602b3: mov qword ptr [rbp + 0x188], r14
0xef602ba: mov qword ptr [rbp + 0x190], 0x105
0xef602c5: mov dword ptr [rbp + 0x194], r14d
0xef602cc: mov byte ptr [rbp + 0x80], 0
0xef602d3: mov dword ptr [rbp + 0x194], r14d
0xef602da: mov byte ptr [rbp + 0x80], 0
0xef602e1: mov rax, qword ptr [rbp + 0x188]
0xef602e8: test rax, rax
0xef602eb: je 0x14ef602f0
0xef602ed: mov byte ptr [rax], 0
0xef602f0: lea r8, [rbp + 0x80]
0xef602f7: mov rdx, rdi
0xef602fa: mov rcx, rbx
0xef602fd: call 0x14235a680
0xef60302: lea r9, [rbp + 0x80]
0xef60309: lea r8, [rbp + 0x1a0]
0xef60310: lea rdx, [rsp + 0x60]
0xef60315: call 0x14235a800
0xef6031a: test al, al
0xef6031c: jne 0x14ef60362
0xef6031e: lea rax, [rip - 0x95dc8a5]
0xef60325: mov qword ptr [rsp + 0x58], rax
0xef6032a: mov dword ptr [rsp + 0x50], 6
0xef60332: mov dword ptr [rsp + 0x48], r14d
0xef60337: lea r9, [rip - 0x99ece92]
0xef6033e: mov qword ptr [rsp + 0x40], r9
0xef60343: mov dword ptr [rsp + 0x38], r14d
0xef60348: mov qword ptr [rsp + 0x30], r9
0xef6034d: mov qword ptr [rsp + 0x28], r9
0xef60352: mov qword ptr [rsp + 0x20], r9
0xef60357: mov cl, 1
0xef60359: call 0x14035d8d0
0xef6035e: xor bl, bl
0xef60360: jmp 0x14ef6038b
0xef60362: lea r8, [rsp + 0x60]
0xef60367: mov rax, qword ptr [rbp + 0x68]
0xef6036b: test rax, rax
0xef6036e: cmovne r8, rax
0xef60372: lea rdx, [rdi + 0x6a0]
0xef60379: mov rcx, rbx
0xef6037c: call 0x142357da0
0xef60381: movzx ebx, al
0xef60384: mov dword ptr [rdi + 0x6a8], r14d
0xef6038b: mov edi, 0x1fd
0xef60390: mov rcx, qword ptr [rbp + 0x188]
0xef60397: test rcx, rcx
0xef6039a: je 0x14ef603c1
0xef6039c: mov rax, qword ptr gs:[0x58]
0xef603a5: mov rdx, qword ptr [rax]
0xef603a8: cmp byte ptr [rdi + rdx], 0
0xef603ac: je 0x14ef603b5
0xef603ae: call 0x1447f03bc
0xef603b3: jmp 0x14ef603ba
0xef603b5: call 0x1447f02bc
0xef603ba: mov qword ptr [rbp + 0x188], r14
0xef603c1: mov rcx, qword ptr [rbp + 0x2a8]
0xef603c8: test rcx, rcx
0xef603cb: je 0x14ef603f2
0xef603cd: mov rax, qword ptr gs:[0x58]
0xef603d6: mov rdx, qword ptr [rax]
0xef603d9: cmp byte ptr [rdi + rdx], 0
0xef603dd: je 0x14ef603e6
0xef603df: call 0x1447f03bc
0xef603e4: jmp 0x14ef603eb
0xef603e6: call 0x1447f02bc
0xef603eb: mov qword ptr [rbp + 0x2a8], r14
0xef603f2: mov rcx, qword ptr [rbp + 0x68]
0xef603f6: test rcx, rcx
0xef603f9: je 0x14ef6041d
0xef603fb: mov rax, qword ptr gs:[0x58]
0xef60404: mov rdx, qword ptr [rax]
0xef60407: cmp byte ptr [rdi + rdx], 0
0xef6040b: je 0x14ef60414
0xef6040d: call 0x1447f03bc
0xef60412: jmp 0x14ef60419
0xef60414: call 0x1447f02bc
0xef60419: mov qword ptr [rbp + 0x68], r14
0xef6041d: movzx eax, bl
0xef60420: lea r11, [rsp + 0x3c0]
0xef60428: mov rbx, qword ptr [r11 + 0x20]
0xef6042c: mov rsi, qword ptr [r11 + 0x30]
0xef60430: mov rsp, r11
0xef60433: pop r14
0xef60435: pop rdi
0xef60436: pop rbp
0xef60437: ret 