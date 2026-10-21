0x3f321f0: mov qword ptr [rsp + 8], rbx
0x3f321f5: mov qword ptr [rsp + 0x18], rbp
0x3f321fa: mov qword ptr [rsp + 0x20], rsi
0x3f321ff: push rdi
0x3f32200: sub rsp, 0x20
0x3f32204: mov rdi, rdx
0x3f32207: mov rsi, rcx
0x3f3220a: cmp byte ptr [rdx + 8], 5
0x3f3220e: jne 0x143f32221
0x3f32210: add rcx, 0xe0
0x3f32217: call 0x143f34410
0x3f3221c: jmp 0x143f322b9
0x3f32221: lea rbx, [rcx + 0xb0]
0x3f32228: mov qword ptr [rsp + 0x38], rbx
0x3f3222d: mov ebp, 0xffffffff
0x3f32232: test dword ptr [rbx + 0xc], 0x40000000
0x3f32239: je 0x143f3225d
0x3f3223b: xor ecx, ecx
0x3f3223d: mov eax, ebp
0x3f3223f: lock cmpxchg dword ptr [rbx + 8], ebp
0x3f32244: test eax, eax
0x3f32246: je 0x143f3225d
0x3f32248: cmp ecx, 0x3e8
0x3f3224e: jae 0x143f3225d
0x3f32250: inc ecx
0x3f32252: mov eax, ebp
0x3f32254: lock cmpxchg dword ptr [rbx + 8], ebp
0x3f32259: test eax, eax
0x3f3225b: jne 0x143f32248
0x3f3225d: mov rax, qword ptr [rbx]
0x3f32260: mov dl, 1
0x3f32262: mov rcx, rbx
0x3f32265: call qword ptr [rax + 0x18]
0x3f32268: test dword ptr [rbx + 0xc], 0x40000000
0x3f3226f: je 0x143f32294
0x3f32271: mov eax, ebp
0x3f32273: lock cmpxchg dword ptr [rbx + 8], ebp
0x3f32278: test eax, eax
0x3f3227a: je 0x143f32294
0x3f3227c: nop dword ptr [rax]
0x3f32280: mov rax, qword ptr [rbx]
0x3f32283: mov rcx, rbx
0x3f32286: call qword ptr [rax + 0x38]
0x3f32289: mov eax, ebp
0x3f3228b: lock cmpxchg dword ptr [rbx + 8], ebp
0x3f32290: test eax, eax
0x3f32292: jne 0x143f32280
0x3f32294: lea rcx, [rsi + 0x90]
0x3f3229b: mov rdx, rdi
0x3f3229e: call 0x143f34410
0x3f322a3: movzx edi, al
0x3f322a6: mov rcx, qword ptr [rbx]
0x3f322a9: mov r8, qword ptr [rcx + 0x20]
0x3f322ad: mov dl, 1
0x3f322af: mov rcx, rbx
0x3f322b2: call r8
0x3f322b5: movzx eax, dil
0x3f322b9: mov rbx, qword ptr [rsp + 0x30]
0x3f322be: mov rbp, qword ptr [rsp + 0x40]
0x3f322c3: mov rsi, qword ptr [rsp + 0x48]
0x3f322c8: add rsp, 0x20
0x3f322cc: pop rdi
0x3f322cd: ret 