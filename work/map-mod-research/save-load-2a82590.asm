0x2a82590: mov dword ptr [rsp + 0x18], r8d
0x2a82595: mov qword ptr [rsp + 0x10], rdx
0x2a8259a: push rbx
0x2a8259b: push rbp
0x2a8259c: push rsi
0x2a8259d: push rdi
0x2a8259e: push r14
0x2a825a0: sub rsp, 0x30
0x2a825a4: mov rdi, rdx
0x2a825a7: mov rsi, rcx
0x2a825aa: xor r14d, r14d
0x2a825ad: mov dword ptr [rsp + 0x20], r14d
0x2a825b2: test r8d, r8d
0x2a825b5: je 0x142a8276d
0x2a825bb: mov eax, r8d
0x2a825be: shr eax, 0x1e
0x2a825c1: test al, 1
0x2a825c3: je 0x142a825d9
0x2a825c5: and r8d, 0x30000000
0x2a825cc: cmp r8d, 0x20000000
0x2a825d3: jne 0x142a8276d
0x2a825d9: lea rbx, [rcx + 0x68]
0x2a825dd: mov qword ptr [rsp + 0x78], rbx
0x2a825e2: mov ebp, 0xffffffff
0x2a825e7: test dword ptr [rbx + 0xc], 0x40000000
0x2a825ee: je 0x142a82615
0x2a825f0: mov ecx, r14d
0x2a825f3: mov eax, ebp
0x2a825f5: lock cmpxchg dword ptr [rbx + 8], ebp
0x2a825fa: test eax, eax
0x2a825fc: je 0x142a82615
0x2a825fe: nop 
0x2a82600: cmp ecx, 0x3e8
0x2a82606: jae 0x142a82615
0x2a82608: inc ecx
0x2a8260a: mov eax, ebp
0x2a8260c: lock cmpxchg dword ptr [rbx + 8], ebp
0x2a82611: test eax, eax
0x2a82613: jne 0x142a82600
0x2a82615: mov rax, qword ptr [rbx]
0x2a82618: mov dl, 1
0x2a8261a: mov rcx, rbx
0x2a8261d: call qword ptr [rax + 0x18]
0x2a82620: test dword ptr [rbx + 0xc], 0x40000000
0x2a82627: je 0x142a82648
0x2a82629: mov eax, ebp
0x2a8262b: lock cmpxchg dword ptr [rbx + 8], ebp
0x2a82630: test eax, eax
0x2a82632: je 0x142a82648
0x2a82634: mov rax, qword ptr [rbx]
0x2a82637: mov rcx, rbx
0x2a8263a: call qword ptr [rax + 0x38]
0x2a8263d: mov eax, ebp
0x2a8263f: lock cmpxchg dword ptr [rbx + 8], ebp
0x2a82644: test eax, eax
0x2a82646: jne 0x142a82634
0x2a82648: mov r8d, dword ptr [rsp + 0x70]
0x2a8264d: and r8d, 0xfffff
0x2a82654: cmp dword ptr [rsi + 0x9c], 0
0x2a8265b: je 0x142a826ad
0x2a8265d: mov ecx, dword ptr [rsi + 0x98]
0x2a82663: test ecx, ecx
0x2a82665: je 0x142a826ad
0x2a82667: xor edx, edx
0x2a82669: mov eax, r8d
0x2a8266c: div ecx
0x2a8266e: mov r10d, edx
0x2a82671: shl r10, 8
0x2a82675: add r10, qword ptr [rsi + 0xa8]
0x2a8267c: mov edx, r14d
0x2a8267f: mov r11d, dword ptr [r10]
0x2a82682: test r11d, r11d
0x2a82685: je 0x142a826ad
0x2a82687: mov eax, edx
0x2a82689: cmp dword ptr [r10 + rax*8 + 8], r8d
0x2a8268e: jne 0x142a826a6
0x2a82690: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x2a82695: mov rax, qword ptr [rsi + 0xb0]
0x2a8269c: mov r9, qword ptr [rax + rcx*8]
0x2a826a0: cmp dword ptr [r9 + 4], r8d
0x2a826a4: je 0x142a826db
0x2a826a6: inc edx
0x2a826a8: cmp edx, r11d
0x2a826ab: jb 0x142a82687
0x2a826ad: lea rax, [rip + 0x2ca3794]
0x2a826b4: mov qword ptr [rdi], rax
0x2a826b7: mov qword ptr [rdi + 8], r14
0x2a826bb: mov word ptr [rdi + 0x10], 0
0x2a826c1: mov qword ptr [rdi + 0x18], r14
0x2a826c5: lea rax, [rip + 0x2af13bc]
0x2a826cc: mov qword ptr [rdi], rax
0x2a826cf: lea rax, [rip + 0x2b3377a]
0x2a826d6: mov qword ptr [rdi], rax
0x2a826d9: jmp 0x142a8274c
0x2a826db: lea rsi, [r9 + 8]
0x2a826df: test rsi, rsi
0x2a826e2: je 0x142a826ad
0x2a826e4: mov rsi, qword ptr [rsi]
0x2a826e7: mov rax, qword ptr [rsi + 0x88]
0x2a826ee: cmp byte ptr [rax + 1], 0
0x2a826f2: jne 0x142a826ad
0x2a826f4: test rsi, rsi
0x2a826f7: je 0x142a8271d
0x2a826f9: mov edx, 4
0x2a826fe: mov r8d, 0x10
0x2a82704: mov rax, qword ptr [rsi]
0x2a82707: lea r9, [rsp + 0x70]
0x2a8270c: mov rcx, rsi
0x2a8270f: call qword ptr [rax + 0xb8]
0x2a82715: test al, al
0x2a82717: je 0x142a8271d
0x2a82719: mov cl, 1
0x2a8271b: jmp 0x142a8271f
0x2a8271d: xor cl, cl
0x2a8271f: lea rax, [rip + 0x2ca3722]
0x2a82726: mov qword ptr [rdi], rax
0x2a82729: mov qword ptr [rdi + 8], rsi
0x2a8272d: mov byte ptr [rdi + 0x10], cl
0x2a82730: mov byte ptr [rdi + 0x11], 0
0x2a82734: mov qword ptr [rdi + 0x18], r14
0x2a82738: lea rax, [rip + 0x2af1349]
0x2a8273f: mov qword ptr [rdi], rax
0x2a82742: lea rax, [rip + 0x2b33707]
0x2a82749: mov qword ptr [rdi], rax
0x2a8274c: mov dword ptr [rsp + 0x20], 1
0x2a82754: mov rax, qword ptr [rbx]
0x2a82757: mov dl, 1
0x2a82759: mov rcx, rbx
0x2a8275c: call qword ptr [rax + 0x20]
0x2a8275f: mov rax, rdi
0x2a82762: add rsp, 0x30
0x2a82766: pop r14
0x2a82768: pop rdi
0x2a82769: pop rsi
0x2a8276a: pop rbp
0x2a8276b: pop rbx
0x2a8276c: ret 
0x2a8276d: lea rax, [rip + 0x2ca36d4]
0x2a82774: mov qword ptr [rdx], rax
0x2a82777: mov qword ptr [rdx + 8], r14
0x2a8277b: mov word ptr [rdx + 0x10], r14w
0x2a82780: mov qword ptr [rdx + 0x18], r14
0x2a82784: lea rax, [rip + 0x2af12fd]
0x2a8278b: mov qword ptr [rdx], rax
0x2a8278e: lea rax, [rip + 0x2b336bb]
0x2a82795: mov qword ptr [rdx], rax
0x2a82798: mov dword ptr [rsp + 0x20], 1
0x2a827a0: mov rax, rdi
0x2a827a3: add rsp, 0x30
0x2a827a7: pop r14
0x2a827a9: pop rdi
0x2a827aa: pop rsi
0x2a827ab: pop rbp
0x2a827ac: pop rbx
0x2a827ad: ret 
0x2a827ae: int3 