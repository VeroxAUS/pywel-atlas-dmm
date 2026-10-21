0x2354fa0: mov qword ptr [rsp + 0x10], rbx
0x2354fa5: mov qword ptr [rsp + 8], rcx
0x2354faa: push rbp
0x2354fab: push rsi
0x2354fac: push rdi
0x2354fad: push r12
0x2354faf: push r13
0x2354fb1: push r14
0x2354fb3: push r15
0x2354fb5: sub rsp, 0x50
0x2354fb9: mov rsi, r8
0x2354fbc: mov r15, rdx
0x2354fbf: mov rdi, rcx
0x2354fc2: mov ebp, 0x1fd
0x2354fc7: mov rax, qword ptr gs:[0x58]
0x2354fd0: add rbp, qword ptr [rax]
0x2354fd3: mov edx, 0x10
0x2354fd8: mov ecx, 0x18
0x2354fdd: cmp byte ptr [rbp], 0
0x2354fe1: je 0x142354fea
0x2354fe3: call 0x1447efa78
0x2354fe8: jmp 0x142354fef
0x2354fea: call 0x1447ef9b0
0x2354fef: mov rbx, rax
0x2354ff2: test rax, rax
0x2354ff5: jne 0x142355012
0x2354ff7: call 0x141318e70
0x2354ffc: xor r9d, r9d
0x2354fff: xor r8d, r8d
0x2355002: mov edx, 1
0x2355007: mov ecx, 0xa0000002
0x235500c: call qword ptr [rip + 0x2e96136]
0x2355012: mov qword ptr [rsp + 0xa0], rbx
0x235501a: xor r12d, r12d
0x235501d: test rbx, rbx
0x2355020: je 0x142355049
0x2355022: lea rax, [rip + 0x33cc6a7]
0x2355029: mov qword ptr [rbx], rax
0x235502c: mov byte ptr [rbx + 0x10], 1
0x2355030: xor r9d, r9d
0x2355033: xor r8d, r8d
0x2355036: mov edx, 1
0x235503b: xor ecx, ecx
0x235503d: call qword ptr [rip + 0x2e962dd]
0x2355043: mov qword ptr [rbx + 8], rax
0x2355047: jmp 0x14235504c
0x2355049: mov rbx, r12
0x235504c: mov qword ptr [rdi], r12
0x235504f: test rbx, rbx
0x2355052: je 0x142355057
0x2355054: mov qword ptr [rdi], rbx
0x2355057: mov byte ptr [rdi + 8], 0
0x235505b: mov qword ptr [rdi + 0x10], r12
0x235505f: lea rax, [rdi + 0x18]
0x2355063: mov qword ptr [rsp + 0xa0], rax
0x235506b: mov qword ptr [rax], r12
0x235506e: mov dword ptr [rax + 8], r12d
0x2355072: mov dword ptr [rax + 0xc], 0xffffffff
0x2355079: mov qword ptr [rax + 0x10], r12
0x235507d: mov qword ptr [rax + 0x18], r12
0x2355081: mov qword ptr [rdi + 0x38], r12
0x2355085: mov qword ptr [rdi + 0x40], r12
0x2355089: mov qword ptr [rdi + 0x48], rsi
0x235508d: lea r13, [rip + 0x47108ac]
0x2355094: mov qword ptr [rdi + 0x50], r13
0x2355098: lea rax, [rdi + 0x58]
0x235509c: mov qword ptr [rsp + 0xa8], rax
0x23550a4: mov qword ptr [rax], r12
0x23550a7: mov qword ptr [rax + 8], r12
0x23550ab: lea rax, [rdi + 0x68]
0x23550af: mov qword ptr [rsp + 0x20], rax
0x23550b4: mov qword ptr [rax], r12
0x23550b7: mov qword ptr [rax + 8], r12
0x23550bb: lea rax, [rdi + 0x78]
0x23550bf: mov qword ptr [rsp + 0x28], rax
0x23550c4: mov qword ptr [rax + 0x108], r12
0x23550cb: mov qword ptr [rax + 0x110], 0x105
0x23550d6: mov byte ptr [rax], 0
0x23550d9: mov rcx, qword ptr [rax + 0x108]
0x23550e0: test rcx, rcx
0x23550e3: je 0x1423550e8
0x23550e5: mov byte ptr [rcx], 0
0x23550e8: mov dword ptr [rax + 0x114], r12d
0x23550ef: mov byte ptr [rax], 0
0x23550f2: mov rcx, qword ptr [rax + 0x108]
0x23550f9: test rcx, rcx
0x23550fc: je 0x142355101
0x23550fe: mov byte ptr [rcx], 0
0x2355101: mov edx, 0x10
0x2355106: mov ecx, 0xb0
0x235510b: cmp byte ptr [rbp], 0
0x235510f: je 0x142355118
0x2355111: call 0x1447efa78
0x2355116: jmp 0x14235511d
0x2355118: call 0x1447ef9b0
0x235511d: mov rsi, rax
0x2355120: test rax, rax
0x2355123: jne 0x142355140
0x2355125: call 0x141318e70
0x235512a: xor r9d, r9d
0x235512d: xor r8d, r8d
0x2355130: mov edx, 1
0x2355135: mov ecx, 0xa0000002
0x235513a: call qword ptr [rip + 0x2e96008]
0x2355140: mov qword ptr [rsp + 0xa0], rsi
0x2355148: test rsi, rsi
0x235514b: je 0x1423551e8
0x2355151: mov qword ptr [rsp + 0xa8], rsi
0x2355159: mov qword ptr [rsi], r12
0x235515c: mov qword ptr [rsi + 8], r12
0x2355160: lea rax, [rsi + 0x10]
0x2355164: mov qword ptr [rsp + 0x28], rax
0x2355169: mov qword ptr [rax], r12
0x235516c: mov qword ptr [rax + 8], r12
0x2355170: lea rax, [rsi + 0x20]
0x2355174: mov qword ptr [rsp + 0x20], rax
0x2355179: mov qword ptr [rax], r12
0x235517c: mov qword ptr [rax + 8], r12
0x2355180: lea rax, [rsi + 0x30]
0x2355184: mov qword ptr [rsp + 0x30], rax
0x2355189: mov qword ptr [rax], r12
0x235518c: mov qword ptr [rax + 8], r12
0x2355190: lea rax, [rsi + 0x40]
0x2355194: mov qword ptr [rsp + 0x38], rax
0x2355199: mov qword ptr [rax], r12
0x235519c: mov qword ptr [rax + 8], r12
0x23551a0: lea rax, [rsi + 0x50]
0x23551a4: mov qword ptr [rsp + 0x40], rax
0x23551a9: mov qword ptr [rax], r12
0x23551ac: mov qword ptr [rax + 8], r12
0x23551b0: mov qword ptr [rsi + 0x60], rdi
0x23551b4: mov qword ptr [rsi + 0x68], r15
0x23551b8: mov word ptr [rsi + 0x70], 0
0x23551be: mov qword ptr [rsi + 0x78], r13
0x23551c2: lea rbx, [rsi + 0x80]
0x23551c9: mov qword ptr [rsp + 0x48], rbx
0x23551ce: mov edx, 0xfa0
0x23551d3: mov rcx, rbx
0x23551d6: call 0x141371610
0x23551db: nop 
0x23551dc: lea rax, [rip + 0x3226f3d]
0x23551e3: mov qword ptr [rbx], rax
0x23551e6: jmp 0x1423551eb
0x23551e8: mov rsi, r12
0x23551eb: mov qword ptr [rdi + 0x190], r12
0x23551f2: test rsi, rsi
0x23551f5: je 0x14235520a
0x23551f7: lea rcx, [rdi + 0x190]
0x23551fe: call 0x14235ce90
0x2355203: mov qword ptr [rdi + 0x190], rsi
0x235520a: mov edx, 0x10
0x235520f: mov ecx, 0x150
0x2355214: cmp byte ptr [rbp], 0
0x2355218: je 0x142355221
0x235521a: call 0x1447efa78
0x235521f: jmp 0x142355226
0x2355221: call 0x1447ef9b0
0x2355226: mov rbx, rax
0x2355229: test rax, rax
0x235522c: jne 0x142355249
0x235522e: call 0x141318e70
0x2355233: xor r9d, r9d
0x2355236: xor r8d, r8d
0x2355239: mov edx, 1
0x235523e: mov ecx, 0xa0000002
0x2355243: call qword ptr [rip + 0x2e95eff]
0x2355249: mov qword ptr [rsp + 0xa0], rbx
0x2355251: test rbx, rbx
0x2355254: je 0x142355371
0x235525a: lea rax, [rip + 0x362edef]
0x2355261: mov qword ptr [rbx], rax
0x2355264: mov byte ptr [rbx + 8], 0
0x2355268: lea rax, [rip + 0x362ed71]
0x235526f: mov qword ptr [rbx], rax
0x2355272: mov qword ptr [rbx + 0x10], rdi
0x2355276: mov edx, 0x10
0x235527b: mov ecx, 0x20
0x2355280: cmp byte ptr [rbp], 0
0x2355284: je 0x14235528d
0x2355286: call 0x1447efa78
0x235528b: jmp 0x142355292
0x235528d: call 0x1447ef9b0
0x2355292: mov rsi, rax
0x2355295: test rax, rax
0x2355298: jne 0x1423552b5
0x235529a: call 0x141318e70
0x235529f: xor r9d, r9d
0x23552a2: xor r8d, r8d
0x23552a5: mov edx, 1
0x23552aa: mov ecx, 0xa0000002
0x23552af: call qword ptr [rip + 0x2e95e93]
0x23552b5: mov qword ptr [rsp + 0xa8], rsi
0x23552bd: test rsi, rsi
0x23552c0: je 0x1423552d7
0x23552c2: mov qword ptr [rsi], 0xffffffffffffffff
0x23552c9: mov dword ptr [rsi + 8], r12d
0x23552cd: mov qword ptr [rsi + 0x10], r13
0x23552d1: mov byte ptr [rsi + 0x18], 0
0x23552d5: jmp 0x1423552da
0x23552d7: mov rsi, r12
0x23552da: mov qword ptr [rbx + 0x18], r12
0x23552de: test rsi, rsi
0x23552e1: je 0x1423552f0
0x23552e3: lea rcx, [rbx + 0x18]
0x23552e7: call 0x141301c00
0x23552ec: mov qword ptr [rbx + 0x18], rsi
0x23552f0: lea rcx, [rbx + 0x20]
0x23552f4: mov qword ptr [rsp + 0xa8], rcx
0x23552fc: mov qword ptr [rcx + 0x108], r12
0x2355303: mov qword ptr [rcx + 0x110], 0x105
0x235530e: mov byte ptr [rcx], 0
0x2355311: mov rax, qword ptr [rcx + 0x108]
0x2355318: test rax, rax
0x235531b: je 0x142355320
0x235531d: mov byte ptr [rax], 0
0x2355320: mov dword ptr [rcx + 0x114], r12d
0x2355327: mov byte ptr [rcx], 0
0x235532a: mov rax, qword ptr [rcx + 0x108]
0x2355331: test rax, rax
0x2355334: je 0x142355339
0x2355336: mov byte ptr [rax], 0
0x2355339: xor r8d, r8d
0x235533c: lea rdx, [rip + 0x321e169]
0x2355343: call 0x140393f50
0x2355348: nop 
0x2355349: mov qword ptr [rbx + 0x138], r12
0x2355350: lea rax, [rip + 0x362ed69]
0x2355357: mov qword ptr [rbx], rax
0x235535a: lea rax, [rip + 0x362e66f]
0x2355361: mov qword ptr [rbx + 0x140], rax
0x2355368: mov qword ptr [rbx + 0x148], r12
0x235536f: jmp 0x142355374
0x2355371: mov rbx, r12
0x2355374: mov rcx, qword ptr [rdi + 0x10]
0x2355378: cmp rbx, rcx
0x235537b: je 0x142355390
0x235537d: test rcx, rcx
0x2355380: je 0x14235538c
0x2355382: mov rax, qword ptr [rcx]
0x2355385: mov edx, 1
0x235538a: call qword ptr [rax]
0x235538c: mov qword ptr [rdi + 0x10], rbx
0x2355390: mov rax, rdi
0x2355393: mov rbx, qword ptr [rsp + 0x98]
0x235539b: add rsp, 0x50
0x235539f: pop r15
0x23553a1: pop r14
0x23553a3: pop r13
0x23553a5: pop r12
0x23553a7: pop rdi
0x23553a8: pop rsi
0x23553a9: pop rbp
0x23553aa: ret 