0x1871040: mov qword ptr [rsp + 8], rbx
0x1871045: mov qword ptr [rsp + 0x10], rsi
0x187104a: mov dword ptr [rsp + 0x18], r8d
0x187104f: push rbp
0x1871050: push rdi
0x1871051: push r12
0x1871053: push r14
0x1871055: push r15
0x1871057: lea rbp, [rsp - 0xd0]
0x187105f: sub rsp, 0x1d0
0x1871066: movzx r12d, r9b
0x187106a: mov ebx, r8d
0x187106d: mov rsi, rdx
0x1871070: mov rdi, rcx
0x1871073: cmp r8d, 2
0x1871077: jbe 0x1418710e6
0x1871079: lea eax, [r8 - 0x64]
0x187107d: cmp eax, 8
0x1871080: jbe 0x1418710e6
0x1871082: lea eax, [r8 - 0xc8]
0x1871089: cmp eax, 7
0x187108c: jbe 0x1418710e6
0x187108e: lea eax, [r8 - 3]
0x1871092: test eax, eax
0x1871094: je 0x1418710e6
0x1871096: mov dword ptr [rsp + 0x70], 0xe
0x187109e: lea rax, [rsp + 0x70]
0x18710a3: mov qword ptr [rsp + 0x68], rax
0x18710a8: lea rax, [rbp + 0x110]
0x18710af: mov qword ptr [rsp + 0x60], rax
0x18710b4: lea rax, [rip + 0x3f6a3d5]
0x18710bb: mov qword ptr [rsp + 0x58], rax
0x18710c0: mov dword ptr [rsp + 0x50], 6
0x18710c8: mov eax, dword ptr [rip + 0x5486832]
0x18710ce: mov dword ptr [rsp + 0x48], eax
0x18710d2: mov cl, 1
0x18710d4: call 0x141292ef0
0x18710d9: mov eax, dword ptr [rip + 0x5486821]
0x18710df: mov dword ptr [rsi], eax
0x18710e1: jmp 0x14187139e
0x18710e6: mov qword ptr [rbp - 0x70], rdi
0x18710ea: xor r15b, r15b
0x18710ed: mov byte ptr [rbp - 0x68], r15b
0x18710f1: mov r14, qword ptr [rcx]
0x18710f4: mov qword ptr [rbp - 0x80], r14
0x18710f8: mov rax, qword ptr [r14]
0x18710fb: mov rcx, r14
0x18710fe: call qword ptr [rax + 8]
0x1871101: nop 
0x1871102: cmp byte ptr [rdi + 0x60], r15b
0x1871106: jne 0x141871113
0x1871108: mov byte ptr [rdi + 0x60], 1
0x187110c: mov r15b, 1
0x187110f: mov byte ptr [rbp - 0x68], r15b
0x1871113: mov rax, qword ptr [r14]
0x1871116: mov rcx, r14
0x1871119: call qword ptr [rax + 0x10]
0x187111c: nop 
0x187111d: test r15b, r15b
0x1871120: jne 0x14187112f
0x1871122: mov eax, dword ptr [rip + 0x5486b7c]
0x1871128: mov dword ptr [rsi], eax
0x187112a: jmp 0x14187139e
0x187112f: xor r15d, r15d
0x1871132: mov qword ptr [rbp + 0xb8], r15
0x1871139: mov qword ptr [rbp + 0xc0], 0x105
0x1871144: mov dword ptr [rbp + 0xc4], r15d
0x187114b: mov byte ptr [rbp - 0x50], r15b
0x187114f: mov dword ptr [rbp + 0xc4], r15d
0x1871156: mov byte ptr [rbp - 0x50], r15b
0x187115a: mov rax, qword ptr [rbp + 0xb8]
0x1871161: test rax, rax
0x1871164: je 0x141871169
0x1871166: mov byte ptr [rax], r15b
0x1871169: mov dword ptr [rsp + 0x70], ebx
0x187116d: mov dword ptr [rbp + 0xc4], 0xffffffff
0x1871177: lea rcx, [rbp - 0x50]
0x187117b: mov rax, qword ptr [rbp + 0xb8]
0x1871182: test rax, rax
0x1871185: cmovne rcx, rax
0x1871189: lea rax, [rsp + 0x70]
0x187118e: mov qword ptr [rsp + 0x20], rax
0x1871193: lea r9, [rip + 0x3f3836e]
0x187119a: lea r8, [rip + 0x3d1dc97]
0x18711a1: mov edx, dword ptr [rbp + 0xc0]
0x18711a7: call 0x14066efb0
0x18711ac: mov rbx, qword ptr [rdi + 0x50]
0x18711b0: lea r14, [rbp - 0x50]
0x18711b4: mov rax, qword ptr [rbp + 0xb8]
0x18711bb: test rax, rax
0x18711be: cmovne r14, rax
0x18711c2: mov rcx, qword ptr [rbx]
0x18711c5: mov rax, qword ptr [rcx]
0x18711c8: mov edx, 0xffffffff
0x18711cd: call qword ptr [rax + 0x18]
0x18711d0: mov qword ptr [rbp - 0x80], r14
0x18711d4: test r14, r14
0x18711d7: jne 0x1418711de
0x18711d9: mov eax, r15d
0x18711dc: jmp 0x1418711ef
0x18711de: mov rax, 0xffffffffffffffff
0x18711e5: inc rax
0x18711e8: cmp byte ptr [r14 + rax], 0
0x18711ed: jne 0x1418711e5
0x18711ef: mov dword ptr [rbp - 0x78], eax
0x18711f2: vmovups xmm0, xmmword ptr [rbp - 0x80]
0x18711f7: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x18711fc: cmp dword ptr [rbx + 0x1c], 0
0x1871200: je 0x141871314
0x1871206: lea rcx, [rbp - 0x60]
0x187120a: mov qword ptr [rbp - 0x80], rcx
0x187120e: mov edx, eax
0x1871210: mov rcx, r14
0x1871213: call 0x141364780
0x1871218: lea r9, [rsp + 0x70]
0x187121d: lea r8, [rbp - 0x80]
0x1871221: mov edx, eax
0x1871223: lea rcx, [rbx + 0x18]
0x1871227: call 0x140612620
0x187122c: test rax, rax
0x187122f: je 0x141871314
0x1871235: add rax, 0x10
0x1871239: je 0x141871314
0x187123f: mov rdx, qword ptr [rax]
0x1871242: test rdx, rdx
0x1871245: je 0x141871314
0x187124b: mov rcx, qword ptr [rdi + 0x50]
0x187124f: call 0x142356000
0x1871254: test al, al
0x1871256: jne 0x1418712b2
0x1871258: mov eax, dword ptr [rip + 0x5486712]
0x187125e: mov dword ptr [rsi], eax
0x1871260: mov rcx, qword ptr [rbp + 0xb8]
0x1871267: test rcx, rcx
0x187126a: je 0x141871298
0x187126c: mov r8d, 0x1fd
0x1871272: mov rax, qword ptr gs:[0x58]
0x187127b: mov rdx, qword ptr [rax]
0x187127e: cmp byte ptr [r8 + rdx], 0
0x1871283: je 0x14187128c
0x1871285: call 0x1447f03bc
0x187128a: jmp 0x141871291
0x187128c: call 0x1447f02bc
0x1871291: mov qword ptr [rbp + 0xb8], r15
0x1871298: mov rbx, qword ptr [rdi]
0x187129b: mov qword ptr [rbp - 0x80], rbx
0x187129f: mov rax, qword ptr [rbx]
0x18712a2: mov rcx, rbx
0x18712a5: call qword ptr [rax + 8]
0x18712a8: nop 
0x18712a9: mov byte ptr [rdi + 0x60], 0
0x18712ad: jmp 0x141871395
0x18712b2: test r12b, r12b
0x18712b5: je 0x1418712bf
0x18712b7: mov rcx, rdi
0x18712ba: call 0x141870c20
0x18712bf: mov dword ptr [rsi], r15d
0x18712c2: mov rcx, qword ptr [rbp + 0xb8]
0x18712c9: test rcx, rcx
0x18712cc: je 0x1418712fa
0x18712ce: mov r8d, 0x1fd
0x18712d4: mov rax, qword ptr gs:[0x58]
0x18712dd: mov rdx, qword ptr [rax]
0x18712e0: cmp byte ptr [r8 + rdx], 0
0x18712e5: je 0x1418712ee
0x18712e7: call 0x1447f03bc
0x18712ec: jmp 0x1418712f3
0x18712ee: call 0x1447f02bc
0x18712f3: mov qword ptr [rbp + 0xb8], r15
0x18712fa: mov rbx, qword ptr [rdi]
0x18712fd: mov qword ptr [rbp - 0x80], rbx
0x1871301: mov rax, qword ptr [rbx]
0x1871304: mov rcx, rbx
0x1871307: call qword ptr [rax + 8]
0x187130a: nop 
0x187130b: mov byte ptr [rdi + 0x60], 0
0x187130f: jmp 0x141871395
0x1871314: lea rax, [rbp + 0x110]
0x187131b: mov qword ptr [rsp + 0x60], rax
0x1871320: lea rax, [rip + 0x3f69fe9]
0x1871327: mov qword ptr [rsp + 0x58], rax
0x187132c: mov dword ptr [rsp + 0x50], 1
0x1871334: mov eax, dword ptr [rip + 0x5486636]
0x187133a: mov dword ptr [rsp + 0x48], eax
0x187133e: xor ecx, ecx
0x1871340: call 0x14035dae0
0x1871345: mov dword ptr [rsi], r15d
0x1871348: mov rcx, qword ptr [rbp + 0xb8]
0x187134f: test rcx, rcx
0x1871352: je 0x141871380
0x1871354: mov r8d, 0x1fd
0x187135a: mov rax, qword ptr gs:[0x58]
0x1871363: mov rdx, qword ptr [rax]
0x1871366: cmp byte ptr [r8 + rdx], 0
0x187136b: je 0x141871374
0x187136d: call 0x1447f03bc
0x1871372: jmp 0x141871379
0x1871374: call 0x1447f02bc
0x1871379: mov qword ptr [rbp + 0xb8], r15
0x1871380: mov rbx, qword ptr [rdi]
0x1871383: mov qword ptr [rbp - 0x80], rbx
0x1871387: mov rax, qword ptr [rbx]
0x187138a: mov rcx, rbx
0x187138d: call qword ptr [rax + 8]
0x1871390: nop 
0x1871391: mov byte ptr [rdi + 0x60], 0
0x1871395: mov rax, qword ptr [rbx]
0x1871398: mov rcx, rbx
0x187139b: call qword ptr [rax + 0x10]
0x187139e: mov rax, rsi
0x18713a1: lea r11, [rsp + 0x1d0]
0x18713a9: mov rbx, qword ptr [r11 + 0x30]
0x18713ad: mov rsi, qword ptr [r11 + 0x38]
0x18713b1: mov rsp, r11
0x18713b4: pop r15
0x18713b6: pop r14
0x18713b8: pop r12
0x18713ba: pop rdi
0x18713bb: pop rbp
0x18713bc: ret 