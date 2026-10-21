0xdf4060: mov qword ptr [rsp + 0x10], rdx
0xdf4065: mov qword ptr [rsp + 8], rcx
0xdf406a: push rbp
0xdf406b: push rbx
0xdf406c: push rsi
0xdf406d: push rdi
0xdf406e: push r12
0xdf4070: push r13
0xdf4072: push r14
0xdf4074: push r15
0xdf4076: lea rbp, [rsp - 0x1f]
0xdf407b: sub rsp, 0x88
0xdf4082: mov rbx, rdx
0xdf4085: mov r13, rcx
0xdf4088: xor edi, edi
0xdf408a: mov dword ptr [rbp - 0x49], edi
0xdf408d: lea rsi, [rcx + 0x248]
0xdf4094: mov rcx, rsi
0xdf4097: call 0x1407ee2c0
0xdf409c: mov dword ptr [r13 + 0x290], edi
0xdf40a3: mov eax, dword ptr [rip + 0x5eb90af]
0xdf40a9: cdq 
0xdf40aa: sub eax, edx
0xdf40ac: sar eax, 1
0xdf40ae: mov r8d, eax
0xdf40b1: mov edx, dword ptr [r13 + 0x2ac]
0xdf40b8: mov ecx, dword ptr [r13 + 0x2a8]
0xdf40bf: mov r12d, ecx
0xdf40c2: sub r12d, eax
0xdf40c5: mov dword ptr [rbp + 0x7f], r12d
0xdf40c9: mov r9d, edx
0xdf40cc: sub r9d, eax
0xdf40cf: mov dword ptr [rbp - 9], r9d
0xdf40d3: add ecx, eax
0xdf40d5: mov dword ptr [rbp - 5], ecx
0xdf40d8: lea edi, [rax + rdx]
0xdf40db: mov dword ptr [rbp - 0x39], edi
0xdf40de: mov edx, ebx
0xdf40e0: sub edx, eax
0xdf40e2: mov dword ptr [rbp + 0x77], edx
0xdf40e5: mov eax, dword ptr [rbp + 0x73]
0xdf40e8: mov r10d, eax
0xdf40eb: sub r10d, r8d
0xdf40ee: mov dword ptr [rbp - 0x41], r10d
0xdf40f2: lea r11d, [r8 + rbx]
0xdf40f6: mov dword ptr [rbp - 0x3d], r11d
0xdf40fa: add eax, r8d
0xdf40fd: mov dword ptr [rbp - 0x45], eax
0xdf4100: cmp r12d, ecx
0xdf4103: jg 0x140df43b4
0xdf4109: mov rbx, qword ptr [rbp + 0x67]
0xdf410d: nop dword ptr [rax]
0xdf4110: mov r13d, r9d
0xdf4113: mov dword ptr [rbp - 0x35], r9d
0xdf4117: cmp r9d, edi
0xdf411a: jg 0x140df4395
0xdf4120: cmp edx, r12d
0xdf4123: jg 0x140df4138
0xdf4125: cmp r12d, r11d
0xdf4128: jg 0x140df4138
0xdf412a: cmp r10d, r13d
0xdf412d: jg 0x140df4138
0xdf412f: cmp r13d, eax
0xdf4132: jle 0x140df437e
0xdf4138: mov dword ptr [rbp - 1], r12d
0xdf413c: mov dword ptr [rbp + 3], r13d
0xdf4140: lea rcx, [rbx + 0x268]
0xdf4147: lea rdx, [rbp - 1]
0xdf414b: call 0x1409b3230
0xdf4150: test rax, rax
0xdf4153: je 0x140df41e8
0xdf4159: mov r14, qword ptr [rax]
0xdf415c: mov eax, dword ptr [rax + 8]
0xdf415f: lea r15, [r14 + rax*8]
0xdf4163: cmp r14, r15
0xdf4166: je 0x140df41e8
0xdf416c: lea rdi, [rbx + 0x298]
0xdf4173: mov r12d, 1
0xdf4179: nop dword ptr [rax]
0xdf4180: mov rsi, qword ptr [r14]
0xdf4183: xor ecx, ecx
0xdf4185: mov edx, dword ptr [rdi + 8]
0xdf4188: test edx, edx
0xdf418a: je 0x140df41a3
0xdf418c: mov r8, qword ptr [rdi]
0xdf418f: nop 
0xdf4190: cmp rsi, qword ptr [r8 + rcx*8]
0xdf4194: je 0x140df419e
0xdf4196: inc ecx
0xdf4198: cmp ecx, edx
0xdf419a: jb 0x140df4190
0xdf419c: jmp 0x140df41a3
0xdf419e: cmp ecx, -1
0xdf41a1: jne 0x140df41d8
0xdf41a3: mov ecx, edx
0xdf41a5: mov eax, dword ptr [rdi + 0xc]
0xdf41a8: cmp eax, edx
0xdf41aa: ja 0x140df41cb
0xdf41ac: lea edx, [rax*2 + 1]
0xdf41b3: add edx, eax
0xdf41b5: shr edx, 1
0xdf41b7: cmp edx, r12d
0xdf41ba: cmovb edx, r12d
0xdf41be: cmp ecx, edx
0xdf41c0: cmova edx, ecx
0xdf41c3: mov rcx, rdi
0xdf41c6: call 0x14035e3f0
0xdf41cb: mov ecx, dword ptr [rdi + 8]
0xdf41ce: mov rax, qword ptr [rdi]
0xdf41d1: mov qword ptr [rax + rcx*8], rsi
0xdf41d5: inc dword ptr [rdi + 8]
0xdf41d8: add r14, 8
0xdf41dc: cmp r14, r15
0xdf41df: jne 0x140df4180
0xdf41e1: mov r12d, dword ptr [rbp + 0x7f]
0xdf41e5: mov edi, dword ptr [rbp - 0x39]
0xdf41e8: mov dword ptr [rbp - 0x31], r12d
0xdf41ec: mov dword ptr [rbp - 0x2d], r13d
0xdf41f0: lea rcx, [rbx + 0x218]
0xdf41f7: lea rdx, [rbp - 0x31]
0xdf41fb: call 0x1409b3230
0xdf4200: mov r14, rax
0xdf4203: test rax, rax
0xdf4206: je 0x140df4370
0xdf420c: mov r15d, dword ptr [rax + 4]
0xdf4210: xor ecx, ecx
0xdf4212: test r15d, r15d
0xdf4215: jne 0x140df422a
0xdf4217: mov r8d, ecx
0xdf421a: mov esi, 0xffffffff
0xdf421f: mov r12d, esi
0xdf4222: mov r15d, esi
0xdf4225: mov r14d, ecx
0xdf4228: jmp 0x140df4237
0xdf422a: mov rax, qword ptr [rax + 0x18]
0xdf422e: mov r8, qword ptr [rax]
0xdf4231: mov esi, ecx
0xdf4233: mov r12d, dword ptr [r14 + 0xc]
0xdf4237: mov r13d, dword ptr [rbp - 0x49]
0xdf423b: nop dword ptr [rax + rax]
0xdf4240: test r8, r8
0xdf4243: je 0x140df4365
0xdf4249: cmp dword ptr [r14 + 0xc], r12d
0xdf424d: jne 0x140df4365
0xdf4253: lea rdi, [rbx + 0x258]
0xdf425a: mov r9d, dword ptr [rdi + 8]
0xdf425e: test r9d, r9d
0xdf4261: je 0x140df4299
0xdf4263: mov r10, qword ptr [rdi]
0xdf4266: movzx r11d, byte ptr [r8 + 0x10]
0xdf426b: nop dword ptr [rax + rax]
0xdf4270: mov edx, ecx
0xdf4272: shl rdx, 5
0xdf4276: cmp byte ptr [rdx + r10 + 8], r11b
0xdf427b: jne 0x140df428b
0xdf427d: mov rax, qword ptr [r8 + 8]
0xdf4281: cmp qword ptr [rdx + r10], rax
0xdf4285: je 0x140df4324
0xdf428b: inc ecx
0xdf428d: cmp ecx, r9d
0xdf4290: jb 0x140df4270
0xdf4292: lea rdi, [rbx + 0x258]
0xdf4299: mov ecx, 0xffffffff
0xdf429e: lea rdx, [r8 + 0x18]
0xdf42a2: cmp ecx, -1
0xdf42a5: jne 0x140df4330
0xdf42ab: vmovups xmm0, xmmword ptr [r8 + 8]
0xdf42b1: vmovups xmmword ptr [rbp - 0x29], xmm0
0xdf42b6: lea rcx, [rbp - 0x19]
0xdf42ba: call 0x1406b1ed0
0xdf42bf: nop 
0xdf42c0: or r13d, 2
0xdf42c4: mov dword ptr [rbp - 0x49], r13d
0xdf42c8: mov edx, dword ptr [rdi + 8]
0xdf42cb: cmp dword ptr [rdi + 0xc], edx
0xdf42ce: ja 0x140df42d8
0xdf42d0: mov rcx, rdi
0xdf42d3: call 0x140e01c50
0xdf42d8: mov edx, dword ptr [rdi + 8]
0xdf42db: shl rdx, 5
0xdf42df: add rdx, qword ptr [rdi]
0xdf42e2: mov qword ptr [rbp + 7], rdx
0xdf42e6: vmovups xmm0, xmmword ptr [rbp - 0x29]
0xdf42eb: vmovups xmmword ptr [rdx], xmm0
0xdf42ef: mov rax, qword ptr [rbp - 0x19]
0xdf42f3: mov qword ptr [rdx + 0x10], rax
0xdf42f7: xor ecx, ecx
0xdf42f9: mov qword ptr [rbp - 0x19], rcx
0xdf42fd: mov eax, dword ptr [rbp - 0x11]
0xdf4300: mov dword ptr [rdx + 0x18], eax
0xdf4303: mov dword ptr [rbp - 0x11], ecx
0xdf4306: mov eax, dword ptr [rbp - 0xd]
0xdf4309: mov dword ptr [rdx + 0x1c], eax
0xdf430c: mov dword ptr [rbp - 0xd], ecx
0xdf430f: inc dword ptr [rdi + 8]
0xdf4312: and r13d, 0xfffffffd
0xdf4316: mov dword ptr [rbp - 0x49], r13d
0xdf431a: mov qword ptr [rbp - 0x19], rcx
0xdf431e: mov qword ptr [rbp - 0x11], rcx
0xdf4322: jmp 0x140df4347
0xdf4324: lea rdi, [rbx + 0x258]
0xdf432b: jmp 0x140df429e
0xdf4330: mov ecx, ecx
0xdf4332: shl rcx, 5
0xdf4336: mov rax, qword ptr [rdi]
0xdf4339: add rax, 0x10
0xdf433d: add rcx, rax
0xdf4340: call 0x1408c2f90
0xdf4345: xor ecx, ecx
0xdf4347: inc esi
0xdf4349: cmp esi, r15d
0xdf434c: jae 0x140df435d
0xdf434e: mov rax, qword ptr [r14 + 0x18]
0xdf4352: mov r8, qword ptr [rax + rsi*8]
0xdf4356: xor ecx, ecx
0xdf4358: jmp 0x140df4240
0xdf435d: mov r8, rcx
0xdf4360: jmp 0x140df4240
0xdf4365: mov r13d, dword ptr [rbp - 0x35]
0xdf4369: mov r12d, dword ptr [rbp + 0x7f]
0xdf436d: mov edi, dword ptr [rbp - 0x39]
0xdf4370: mov r11d, dword ptr [rbp - 0x3d]
0xdf4374: mov r10d, dword ptr [rbp - 0x41]
0xdf4378: mov eax, dword ptr [rbp - 0x45]
0xdf437b: mov edx, dword ptr [rbp + 0x77]
0xdf437e: inc r13d
0xdf4381: mov dword ptr [rbp - 0x35], r13d
0xdf4385: cmp r13d, edi
0xdf4388: jle 0x140df4120
0xdf438e: mov r9d, dword ptr [rbp - 9]
0xdf4392: mov ecx, dword ptr [rbp - 5]
0xdf4395: inc r12d
0xdf4398: mov dword ptr [rbp + 0x7f], r12d
0xdf439c: cmp r12d, ecx
0xdf439f: jle 0x140df4110
0xdf43a5: mov r13, qword ptr [rbp + 0x67]
0xdf43a9: lea rsi, [r13 + 0x248]
0xdf43b0: mov rbx, qword ptr [rbp + 0x6f]
0xdf43b4: cmp edx, r11d
0xdf43b7: jg 0x140df4683
0xdf43bd: nop dword ptr [rax]
0xdf43c0: mov edi, r10d
0xdf43c3: mov dword ptr [rbp + 0x67], r10d
0xdf43c7: cmp r10d, eax
0xdf43ca: jg 0x140df466a
0xdf43d0: mov dword ptr [rbp + 0x7f], edx
0xdf43d3: lea rbx, [r13 + 0x268]
0xdf43da: mov dword ptr [rbp - 0x31], edx
0xdf43dd: lea r12, [r13 + 0x218]
0xdf43e4: nop dword ptr [rax]
0xdf43e8: nop dword ptr [rax + rax]
0xdf43f0: mov dword ptr [rbp + 0x83], edi
0xdf43f6: lea rdx, [rbp + 0x7f]
0xdf43fa: mov rcx, rbx
0xdf43fd: call 0x1409b3230
0xdf4402: test rax, rax
0xdf4405: je 0x140df44ed
0xdf440b: mov r14, qword ptr [rax]
0xdf440e: mov eax, dword ptr [rax + 8]
0xdf4411: lea r15, [r14 + rax*8]
0xdf4415: cmp r14, r15
0xdf4418: je 0x140df44ed
0xdf441e: lea rsi, [r13 + 0x288]
0xdf4425: mov ebx, 1
0xdf442a: nop word ptr [rax + rax]
0xdf4430: mov rdi, qword ptr [r14]
0xdf4433: xor eax, eax
0xdf4435: mov r8d, dword ptr [r13 + 0x2a0]
0xdf443c: test r8d, r8d
0xdf443f: je 0x140df447d
0xdf4441: mov r9, qword ptr [r13 + 0x298]
0xdf4448: nop dword ptr [rax + rax]
0xdf4450: lea rdx, [r9 + rax*8]
0xdf4454: cmp rdi, qword ptr [rdx]
0xdf4457: je 0x140df4462
0xdf4459: inc eax
0xdf445b: cmp eax, r8d
0xdf445e: jb 0x140df4450
0xdf4460: jmp 0x140df447d
0xdf4462: cmp eax, -1
0xdf4465: je 0x140df447d
0xdf4467: lea ecx, [r8 - 1]
0xdf446b: cmp eax, ecx
0xdf446d: jae 0x140df4476
0xdf446f: mov rcx, qword ptr [r9 + rcx*8]
0xdf4473: mov qword ptr [rdx], rcx
0xdf4476: dec dword ptr [r13 + 0x2a0]
0xdf447d: xor ecx, ecx
0xdf447f: mov edx, dword ptr [rsi + 8]
0xdf4482: test edx, edx
0xdf4484: je 0x140df44a3
0xdf4486: mov r8, qword ptr [rsi]
0xdf4489: nop dword ptr [rax]
0xdf4490: cmp rdi, qword ptr [r8 + rcx*8]
0xdf4494: je 0x140df449e
0xdf4496: inc ecx
0xdf4498: cmp ecx, edx
0xdf449a: jb 0x140df4490
0xdf449c: jmp 0x140df44a3
0xdf449e: cmp ecx, -1
0xdf44a1: jne 0x140df44d6
0xdf44a3: mov ecx, edx
0xdf44a5: mov eax, dword ptr [rsi + 0xc]
0xdf44a8: cmp eax, edx
0xdf44aa: ja 0x140df44c9
0xdf44ac: lea edx, [rax*2 + 1]
0xdf44b3: add edx, eax
0xdf44b5: shr edx, 1
0xdf44b7: cmp edx, ebx
0xdf44b9: cmovb edx, ebx
0xdf44bc: cmp ecx, edx
0xdf44be: cmova edx, ecx
0xdf44c1: mov rcx, rsi
0xdf44c4: call 0x14035e3f0
0xdf44c9: mov ecx, dword ptr [rsi + 8]
0xdf44cc: mov rax, qword ptr [rsi]
0xdf44cf: mov qword ptr [rax + rcx*8], rdi
0xdf44d3: inc dword ptr [rsi + 8]
0xdf44d6: add r14, 8
0xdf44da: cmp r14, r15
0xdf44dd: jne 0x140df4430
0xdf44e3: mov edi, dword ptr [rbp + 0x67]
0xdf44e6: lea rbx, [r13 + 0x268]
0xdf44ed: mov dword ptr [rbp - 0x2d], edi
0xdf44f0: lea rdx, [rbp - 0x31]
0xdf44f4: mov rcx, r12
0xdf44f7: call 0x1409b3230
0xdf44fc: mov r14, rax
0xdf44ff: test rax, rax
0xdf4502: je 0x140df464f
0xdf4508: mov r15d, dword ptr [rax + 4]
0xdf450c: xor ecx, ecx
0xdf450e: test r15d, r15d
0xdf4511: jne 0x140df4526
0xdf4513: mov r8d, ecx
0xdf4516: mov esi, 0xffffffff
0xdf451b: mov r12d, esi
0xdf451e: mov r15d, esi
0xdf4521: mov r14d, ecx
0xdf4524: jmp 0x140df4533
0xdf4526: mov rax, qword ptr [rax + 0x18]
0xdf452a: mov r8, qword ptr [rax]
0xdf452d: mov esi, ecx
0xdf452f: mov r12d, dword ptr [r14 + 0xc]
0xdf4533: mov ebx, dword ptr [rbp - 0x49]
0xdf4536: test r8, r8
0xdf4539: je 0x140df463e
0xdf453f: cmp dword ptr [r14 + 0xc], r12d
0xdf4543: jne 0x140df463e
0xdf4549: mov r9d, dword ptr [r13 + 0x250]
0xdf4550: test r9d, r9d
0xdf4553: je 0x140df457f
0xdf4555: mov r10, qword ptr [r13 + 0x248]
0xdf455c: movzx r11d, byte ptr [r8 + 0x10]
0xdf4561: mov edx, ecx
0xdf4563: shl rdx, 5
0xdf4567: cmp byte ptr [rdx + r10 + 8], r11b
0xdf456c: jne 0x140df4578
0xdf456e: mov rax, qword ptr [r8 + 8]
0xdf4572: cmp qword ptr [rdx + r10], rax
0xdf4576: je 0x140df4584
0xdf4578: inc ecx
0xdf457a: cmp ecx, r9d
0xdf457d: jb 0x140df4561
0xdf457f: mov ecx, 0xffffffff
0xdf4584: lea rdi, [r13 + 0x248]
0xdf458b: lea rdx, [r8 + 0x18]
0xdf458f: cmp ecx, -1
0xdf4592: jne 0x140df4609
0xdf4594: vmovups xmm0, xmmword ptr [r8 + 8]
0xdf459a: vmovups xmmword ptr [rbp - 0x29], xmm0
0xdf459f: lea rcx, [rbp - 0x19]
0xdf45a3: call 0x1406b1ed0
0xdf45a8: nop 
0xdf45a9: or ebx, 1
0xdf45ac: mov dword ptr [rbp - 0x49], ebx
0xdf45af: mov edx, dword ptr [rdi + 8]
0xdf45b2: cmp dword ptr [rdi + 0xc], edx
0xdf45b5: ja 0x140df45bf
0xdf45b7: mov rcx, rdi
0xdf45ba: call 0x140e01c50
0xdf45bf: mov edx, dword ptr [rdi + 8]
0xdf45c2: shl rdx, 5
0xdf45c6: add rdx, qword ptr [rdi]
0xdf45c9: mov qword ptr [rbp + 7], rdx
0xdf45cd: vmovups xmm0, xmmword ptr [rbp - 0x29]
0xdf45d2: vmovups xmmword ptr [rdx], xmm0
0xdf45d6: mov rax, qword ptr [rbp - 0x19]
0xdf45da: mov qword ptr [rdx + 0x10], rax
0xdf45de: xor ecx, ecx
0xdf45e0: mov qword ptr [rbp - 0x19], rcx
0xdf45e4: mov eax, dword ptr [rbp - 0x11]
0xdf45e7: mov dword ptr [rdx + 0x18], eax
0xdf45ea: mov dword ptr [rbp - 0x11], ecx
0xdf45ed: mov eax, dword ptr [rbp - 0xd]
0xdf45f0: mov dword ptr [rdx + 0x1c], eax
0xdf45f3: mov dword ptr [rbp - 0xd], ecx
0xdf45f6: inc dword ptr [rdi + 8]
0xdf45f9: and ebx, 0xfffffffe
0xdf45fc: mov dword ptr [rbp - 0x49], ebx
0xdf45ff: mov qword ptr [rbp - 0x19], rcx
0xdf4603: mov qword ptr [rbp - 0x11], rcx
0xdf4607: jmp 0x140df4620
0xdf4609: mov ecx, ecx
0xdf460b: shl rcx, 5
0xdf460f: mov rax, qword ptr [rdi]
0xdf4612: add rax, 0x10
0xdf4616: add rcx, rax
0xdf4619: call 0x1408c2f90
0xdf461e: xor ecx, ecx
0xdf4620: inc esi
0xdf4622: cmp esi, r15d
0xdf4625: jae 0x140df4636
0xdf4627: mov rax, qword ptr [r14 + 0x18]
0xdf462b: mov r8, qword ptr [rax + rsi*8]
0xdf462f: xor ecx, ecx
0xdf4631: jmp 0x140df4536
0xdf4636: mov r8, rcx
0xdf4639: jmp 0x140df4536
0xdf463e: mov edi, dword ptr [rbp + 0x67]
0xdf4641: lea rbx, [r13 + 0x268]
0xdf4648: lea r12, [r13 + 0x218]
0xdf464f: inc edi
0xdf4651: mov dword ptr [rbp + 0x67], edi
0xdf4654: mov eax, dword ptr [rbp - 0x45]
0xdf4657: cmp edi, eax
0xdf4659: jle 0x140df43f0
0xdf465f: mov edx, dword ptr [rbp + 0x77]
0xdf4662: mov r10d, dword ptr [rbp - 0x41]
0xdf4666: mov r11d, dword ptr [rbp - 0x3d]
0xdf466a: inc edx
0xdf466c: mov dword ptr [rbp + 0x77], edx
0xdf466f: cmp edx, r11d
0xdf4672: jle 0x140df43c0
0xdf4678: lea rsi, [r13 + 0x248]
0xdf467f: mov rbx, qword ptr [rbp + 0x6f]
0xdf4683: mov rdi, qword ptr [r13 + 0x238]
0xdf468a: mov r15d, dword ptr [r13 + 0x240]
0xdf4691: shl r15, 5
0xdf4695: add r15, rdi
0xdf4698: cmp rdi, r15
0xdf469b: je 0x140df4721
0xdf46a1: lea r14, [rdi + 0x10]
0xdf46a5: mov r8d, dword ptr [rsi + 8]
0xdf46a9: xor ecx, ecx
0xdf46ab: test r8d, r8d
0xdf46ae: je 0x140df46dd
0xdf46b0: mov r9, qword ptr [rsi]
0xdf46b3: movzx r10d, byte ptr [r14 - 8]
0xdf46b8: nop dword ptr [rax + rax]
0xdf46c0: mov edx, ecx
0xdf46c2: shl rdx, 5
0xdf46c6: cmp byte ptr [rdx + r9 + 8], r10b
0xdf46cb: jne 0x140df46d6
0xdf46cd: mov rax, qword ptr [rdi]
0xdf46d0: cmp qword ptr [rdx + r9], rax
0xdf46d4: je 0x140df473c
0xdf46d6: inc ecx
0xdf46d8: cmp ecx, r8d
0xdf46db: jb 0x140df46c0
0xdf46dd: cmp dword ptr [rsi + 0xc], r8d
0xdf46e1: ja 0x140df46ee
0xdf46e3: mov edx, r8d
0xdf46e6: mov rcx, rsi
0xdf46e9: call 0x140e01c50
0xdf46ee: mov ecx, dword ptr [rsi + 8]
0xdf46f1: shl rcx, 5
0xdf46f5: add rcx, qword ptr [rsi]
0xdf46f8: mov qword ptr [rbp + 0x6f], rcx
0xdf46fc: vmovups xmm0, xmmword ptr [rdi]
0xdf4700: vmovups xmmword ptr [rcx], xmm0
0xdf4704: add rcx, 0x10
0xdf4708: mov rdx, r14
0xdf470b: call 0x1406b1ed0
0xdf4710: nop 
0xdf4711: inc dword ptr [rsi + 8]
0xdf4714: add rdi, 0x20
0xdf4718: add r14, 0x20
0xdf471c: cmp rdi, r15
0xdf471f: jne 0x140df46a5
0xdf4721: mov qword ptr [r13 + 0x2a8], rbx
0xdf4728: add rsp, 0x88
0xdf472f: pop r15
0xdf4731: pop r14
0xdf4733: pop r13
0xdf4735: pop r12
0xdf4737: pop rdi
0xdf4738: pop rsi
0xdf4739: pop rbx
0xdf473a: pop rbp
0xdf473b: ret 
0xdf473c: cmp ecx, -1
0xdf473f: je 0x140df46dd
0xdf4741: shl rcx, 5
0xdf4745: lea rax, [r9 + 0x10]
0xdf4749: add rcx, rax
0xdf474c: mov rdx, r14
0xdf474f: call 0x1408c2f90
0xdf4754: jmp 0x140df4714