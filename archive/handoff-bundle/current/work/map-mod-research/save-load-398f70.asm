0x398f70: mov dword ptr [rcx + 0x60], 0
0x398f77: ret 
0x398f78: int3 
0x398f79: int3 
0x398f7a: int3 
0x398f7b: int3 
0x398f7c: int3 
0x398f7d: int3 
0x398f7e: int3 
0x398f7f: int3 
0x398f80: mov qword ptr [rsp + 8], rbx
0x398f85: mov qword ptr [rsp + 0x18], rbp
0x398f8a: mov qword ptr [rsp + 0x20], rsi
0x398f8f: push rdi
0x398f90: push r12
0x398f92: push r13
0x398f94: push r14
0x398f96: push r15
0x398f98: sub rsp, 0x40
0x398f9c: mov ebp, r9d
0x398f9f: mov rbx, r8
0x398fa2: movzx edi, dl
0x398fa5: mov rsi, rcx
0x398fa8: mov qword ptr [rsp + 0x20], rbx
0x398fad: mov dword ptr [rsp + 0x28], r9d
0x398fb2: xor r15b, r15b
0x398fb5: mov rax, qword ptr [rcx + 8]
0x398fb9: lea rdx, [rax + 8]
0x398fbd: xor r14d, r14d
0x398fc0: test rax, rax
0x398fc3: cmove rdx, r14
0x398fc7: mov r8b, 1
0x398fca: mov rdx, qword ptr [rdx]
0x398fcd: lea rcx, [rsp + 0x30]
0x398fd2: call 0x140393650
0x398fd7: nop 
0x398fd8: mov r8d, dword ptr [rsi + 0x60]
0x398fdc: test dil, dil
0x398fdf: je 0x14039910b
0x398fe5: test r8d, r8d
0x398fe8: sete r15b
0x398fec: mov ecx, r14d
0x398fef: test r8d, r8d
0x398ff2: je 0x14039901c
0x398ff4: mov rdx, qword ptr [rsi + 0x58]
0x398ff8: nop dword ptr [rax + rax]
0x399000: mov eax, ecx
0x399002: add rax, rax
0x399005: cmp rbx, qword ptr [rdx + rax*8]
0x399009: jne 0x140399015
0x39900b: cmp ebp, dword ptr [rdx + rax*8 + 8]
0x39900f: je 0x14039915a
0x399015: inc ecx
0x399017: cmp ecx, r8d
0x39901a: jb 0x140399000
0x39901c: mov eax, dword ptr [rsi + 0x64]
0x39901f: cmp eax, r8d
0x399022: ja 0x1403990f1
0x399028: lea edi, [rax*2 + 1]
0x39902f: add edi, eax
0x399031: shr edi, 1
0x399033: mov r12d, 1
0x399039: cmp edi, r12d
0x39903c: cmovb edi, r12d
0x399040: cmp r8d, edi
0x399043: cmova edi, r8d
0x399047: cmp edi, eax
0x399049: jbe 0x1403990f1
0x39904f: mov ecx, edi
0x399051: shl ecx, 4
0x399054: mov r13d, 0x1fd
0x39905a: mov rax, qword ptr gs:[0x58]
0x399063: mov r14, qword ptr [rax]
0x399066: mov edx, 8
0x39906b: cmp byte ptr [r14 + r13], 0