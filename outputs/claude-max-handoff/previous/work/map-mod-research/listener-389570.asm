0x389570: mov qword ptr [rsp + 0x10], rbx
0x389575: mov qword ptr [rsp + 0x18], rbp
0x38957a: push rsi
0x38957b: push rdi
0x38957c: push r14
0x38957e: sub rsp, 0x50
0x389582: movzx edi, word ptr [rcx]
0x389585: mov rbx, qword ptr [rip + 0x69e04bc]
0x38958c: cmp edi, dword ptr [rbx + 8]
0x38958f: jae 0x140389678
0x389595: lea rsi, [rdi*8]
0x38959d: mov rax, qword ptr [rbx + 0x58]
0x3895a1: mov rax, qword ptr [rsi + rax]
0x3895a5: test rax, rax
0x3895a8: jne 0x140389682
0x3895ae: lea r14, [rbx + 0x90]
0x3895b5: cmp qword ptr [r14], rax
0x3895b8: jne 0x1403895df
0x3895ba: mov qword ptr [rsp + 0x20], r14
0x3895bf: xor r9d, r9d
0x3895c2: lea r8, [rip + 0x55755c7]
0x3895c9: mov rdx, qword ptr [rbx + 0x10]
0x3895cd: lea rcx, [rsp + 0x70]
0x3895d2: call 0x1425c5230
0x3895d7: mov eax, dword ptr [rsp + 0x70]
0x3895db: test eax, eax
0x3895dd: jne 0x140389659
0x3895df: call 0x141416af0
0x3895e4: add rax, 0x7d0
0x3895ea: mov qword ptr [rbx + 0x98], rax
0x3895f1: mov rcx, qword ptr [r14]
0x3895f4: mov rdx, qword ptr [rbx + 0x28]
0x3895f8: lea r14, [rip + 0x53986c1]
0x3895ff: mov qword ptr [rsp + 0x30], r14
0x389604: mov byte ptr [rsp + 0x38], 0
0x389609: lea rbp, [rip + 0x5398650]
0x389610: mov qword ptr [rsp + 0x30], rbp
0x389615: mov rax, qword ptr [rcx]
0x389618: mov qword ptr [rsp + 0x40], rax
0x38961d: mov eax, dword ptr [rcx + 0xc]
0x389620: mov dword ptr [rsp + 0x48], eax
0x389624: mov dword ptr [rsp + 0x4c], 0
0x38962c: mov eax, dword ptr [rdx + rsi + 4]
0x389630: mov dword ptr [rsp + 0x4c], eax
0x389634: lea r9, [rsp + 0x30]
0x389639: movzx r8d, di
0x38963d: lea rdx, [rsp + 0x70]
0x389642: mov rcx, rbx
0x389645: call 0x14038b130
0x38964a: nop 
0x38964b: mov qword ptr [rsp + 0x30], rbp
0x389650: mov qword ptr [rsp + 0x30], r14
0x389655: mov eax, dword ptr [rsp + 0x70]
0x389659: mov rcx, qword ptr [rip + 0x695f9d0]
0x389660: test eax, eax
0x389662: je 0x140389669
0x389664: mov rax, rcx
0x389667: jmp 0x140389671
0x389669: mov rax, qword ptr [rbx + 0x58]
0x38966d: mov rax, qword ptr [rsi + rax]
0x389671: test rax, rax
0x389674: je 0x14038967f
0x389676: jmp 0x140389682
0x389678: mov rcx, qword ptr [rip + 0x695f9b1]
0x38967f: mov rax, rcx
0x389682: mov rbx, qword ptr [rsp + 0x78]
0x389687: mov rbp, qword ptr [rsp + 0x80]
0x38968f: add rsp, 0x50
0x389693: pop r14
0x389695: pop rdi
0x389696: pop rsi
0x389697: ret 