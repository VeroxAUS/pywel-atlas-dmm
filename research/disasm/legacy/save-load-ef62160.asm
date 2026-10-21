0xef62160: mov qword ptr [rsp + 0x20], rbx
0xef62165: mov qword ptr [rsp + 0x10], rdx
0xef6216a: push rbp
0xef6216b: push rsi
0xef6216c: push rdi
0xef6216d: push r12
0xef6216f: push r13
0xef62171: push r14
0xef62173: push r15
0xef62175: sub rsp, 0x70
0xef62179: mov r15, rdx
0xef6217c: mov rsi, rcx
0xef6217f: lea rbx, [rcx + 0x138]
0xef62186: cmp rdx, rbx
0xef62189: je 0x14ef621c1
0xef6218b: mov rax, qword ptr [rdx]
0xef6218e: cmp qword ptr [rbx], rax
0xef62191: je 0x14ef621c1
0xef62193: mov rcx, rbx
0xef62196: call 0x14038ad90
0xef6219b: mov rcx, qword ptr [r15]
0xef6219e: mov qword ptr [rbx], rcx
0xef621a1: test rcx, rcx
0xef621a4: je 0x14ef621c1
0xef621a6: cmp byte ptr [rcx + 0x14], 0
0xef621aa: je 0x14ef621b2
0xef621ac: lock inc dword ptr [rcx + 0x10]
0xef621b0: jmp 0x14ef621ba
0xef621b2: mov eax, dword ptr [rcx + 0x10]
0xef621b5: inc eax
0xef621b7: mov dword ptr [rcx + 0x10], eax
0xef621ba: mov rax, qword ptr [rbx]
0xef621bd: mov byte ptr [rax + 0x16], 1
0xef621c1: mov rcx, qword ptr [r15]
0xef621c4: mov rax, qword ptr [rcx]
0xef621c7: call qword ptr [rax + 0x20]
0xef621ca: mov r14, rax
0xef621cd: mov rcx, qword ptr [rsi + 0x10]
0xef621d1: mov rdx, qword ptr [rcx + 0x50]
0xef621d5: mov rbp, qword ptr [rdx]
0xef621d8: call 0x1413590b0
0xef621dd: mov rbx, rax
0xef621e0: mov rcx, qword ptr [rax]
0xef621e3: mov rdx, qword ptr [rcx]
0xef621e6: test rdx, rdx
0xef621e9: je 0x14ef621f0
0xef621eb: cmp byte ptr [rdx], 0
0xef621ee: jne 0x14ef62203
0xef621f0: mov rcx, rbx
0xef621f3: call 0x14135a130
0xef621f8: test al, al
0xef621fa: mov rax, qword ptr [rip - 0x84fc8e1]
0xef62201: je 0x14ef62206
0xef62203: mov rax, qword ptr [rbx]
0xef62206: mov r12, qword ptr [rax]
0xef62209: mov eax, dword ptr [rsi + 0x130]
0xef6220f: mov dword ptr [rsp + 0xc0], eax
0xef62216: lea rdi, [rsi + 0x20]
0xef6221a: mov dword ptr [rdi + 0x114], 0xffffffff
0xef62224: mov rax, qword ptr [rdi + 0x108]
0xef6222b: mov r13, rdi
0xef6222e: test rax, rax
0xef62231: cmovne r13, rax
0xef62235: mov edx, 0x240
0xef6223a: mov rax, qword ptr gs:[0x58]
0xef62243: mov rcx, qword ptr [rax]
0xef62246: mov dword ptr [rdx + rcx], 0
0xef6224d: mov edx, 3
0xef62252: lea rcx, [rsp + 0xb0]
0xef6225a: call 0x141424650
0xef6225f: nop 
0xef62260: lea rbx, [rip - 0x82881b7]
0xef62267: test r12, r12
0xef6226a: je 0x14ef6228d
0xef6226c: call 0x1414245b0
0xef62271: cmp dword ptr [rax + 8], 0
0xef62275: ja 0x14ef6227c
0xef62277: mov rax, rbx
0xef6227a: jmp 0x14ef62282
0xef6227c: mov rax, qword ptr [rax]
0xef6227f: mov rax, qword ptr [rax]
0xef62282: mov qword ptr [rax + 0x808], r12
0xef62289: lea rdi, [rsi + 0x20]
0xef6228d: test rbp, rbp
0xef62290: je 0x14ef622b0
0xef62292: call 0x1414245b0
0xef62297: cmp dword ptr [rax + 8], 1
0xef6229b: ja 0x14ef622a2
0xef6229d: mov rax, rbx
0xef622a0: jmp 0x14ef622a9
0xef622a2: mov rax, qword ptr [rax]
0xef622a5: mov rax, qword ptr [rax + 8]
0xef622a9: mov qword ptr [rax + 0x808], rbp
0xef622b0: test r14, r14
0xef622b3: je 0x14ef622d2
0xef622b5: call 0x1414245b0
0xef622ba: cmp dword ptr [rax + 8], 2
0xef622be: jbe 0x14ef622c7
0xef622c0: mov rax, qword ptr [rax]
0xef622c3: mov rbx, qword ptr [rax + 0x10]
0xef622c7: mov qword ptr [rbx + 0x808], r14
0xef622ce: lea rdi, [rsi + 0x20]
0xef622d2: lea r8, [rip - 0x984e1c9]
0xef622d9: mov edx, dword ptr [rsp + 0xc0]
0xef622e0: mov rcx, r13
0xef622e3: call 0x141424bd0
0xef622e8: nop 
0xef622e9: call 0x1414245b0
0xef622ee: mov r14, rax
0xef622f1: xor r12d, r12d
0xef622f4: mov ebx, r12d
0xef622f7: cmp dword ptr [rax + 8], ebx
0xef622fa: jbe 0x14ef62349
0xef622fc: mov r13d, 0x1fd
0xef62302: mov rcx, qword ptr gs:[0x58]
0xef6230b: mov rbp, qword ptr [rcx]
0xef6230e: nop 
0xef62310: mov ecx, ebx
0xef62312: mov rax, qword ptr [r14]
0xef62315: lea rdi, [rax + rcx*8]
0xef62319: mov rcx, qword ptr [rdi]
0xef6231c: test rcx, rcx
0xef6231f: je 0x14ef6233d
0xef62321: cmp byte ptr [rbp + r13], r12b
0xef62326: je 0x14ef62335
0xef62328: call 0x1447f03bc
0xef6232d: sub byte ptr [rip - 0x7519d5d], al
0xef62333: jmp 0x14ef6233a
0xef62335: call 0x1447f02bc
0xef6233a: mov qword ptr [rdi], r12
0xef6233d: inc ebx
0xef6233f: cmp ebx, dword ptr [r14 + 8]
0xef62343: jb 0x14ef62310
0xef62345: lea rdi, [rsi + 0x20]
0xef62349: mov dword ptr [r14 + 8], r12d
0xef6234d: lea rcx, [rsi + 0x20]
0xef62351: mov rax, qword ptr [rcx + 0x108]
0xef62358: test rax, rax
0xef6235b: cmovne rcx, rax
0xef6235f: mov qword ptr [rsp + 0xb0], rcx
0xef62367: lea rax, [rsp + 0xb0]
0xef6236f: mov qword ptr [rsp + 0x60], rax
0xef62374: lea rax, [rip - 0x95de5d3]
0xef6237b: mov qword ptr [rsp + 0x58], rax
0xef62380: mov dword ptr [rsp + 0x50], 1
0xef62388: mov dword ptr [rsp + 0x48], r12d
0xef6238d: lea r9, [rip - 0x99eeee8]
0xef62394: mov qword ptr [rsp + 0x40], r9
0xef62399: mov dword ptr [rsp + 0x38], r12d
0xef6239e: mov qword ptr [rsp + 0x30], r9
0xef623a3: mov qword ptr [rsp + 0x28], r9
0xef623a8: mov qword ptr [rsp + 0x20], r9
0xef623ad: xor ecx, ecx
0xef623af: call 0x14035de50
0xef623b4: mov rax, qword ptr [rdi + 0x108]
0xef623bb: mov rcx, rdi
0xef623be: test rax, rax
0xef623c1: cmovne rcx, rax
0xef623c5: call 0x141329600
0xef623ca: test al, al
0xef623cc: jne 0x14ef62410
0xef623ce: mov rax, qword ptr [rdi + 0x108]
0xef623d5: test rax, rax
0xef623d8: cmovne rdi, rax
0xef623dc: mov rcx, rdi
0xef623df: call 0x141329600
0xef623e4: test al, al
0xef623e6: jne 0x14ef62410
0xef623e8: mov rcx, rdi
0xef623eb: call 0x141329870
0xef623f0: test al, al
0xef623f2: je 0x14ef62400
0xef623f4: mov rcx, rdi
0xef623f7: call 0x141329700
0xef623fc: test al, al
0xef623fe: jne 0x14ef62410
0xef62400: mov byte ptr [rsi + 8], r12b
0xef62404: mov rcx, r15
0xef62407: call 0x14038ad90
0xef6240c: xor al, al
0xef6240e: jmp 0x14ef62435
0xef62410: mov byte ptr [rsi + 8], 1
0xef62414: lea rcx, [rip - 0x84dcee3]
0xef6241b: call qword ptr [rip - 0x9d75979]
0xef62421: mov rcx, qword ptr [rax]
0xef62424: mov qword ptr [rsi + 0x148], rcx
0xef6242b: mov rcx, r15
0xef6242e: call 0x14038ad90
0xef62433: mov al, 1
0xef62435: mov rbx, qword ptr [rsp + 0xc8]
0xef6243d: add rsp, 0x70
0xef62441: pop r15
0xef62443: pop r14
0xef62445: pop r13
0xef62447: pop r12
0xef62449: pop rdi
0xef6244a: pop rsi
0xef6244b: pop rbp
0xef6244c: ret 