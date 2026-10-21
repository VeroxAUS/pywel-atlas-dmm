0x1424450: mov qword ptr [rsp + 0x10], rbx
0x1424455: mov qword ptr [rsp + 0x18], rdi
0x142445a: push rbp
0x142445b: lea rbp, [rsp - 0x70]
0x1424460: sub rsp, 0x170
0x1424467: mov rbx, rdx
0x142446a: mov qword ptr [rsp + 0x20], rcx
0x142446f: xor edi, edi
0x1424471: test rcx, rcx
0x1424474: jne 0x14142447e
0x1424476: mov dword ptr [rsp + 0x28], edi
0x142447a: mov eax, edi
0x142447c: jmp 0x141424492
0x142447e: mov rax, 0xffffffffffffffff
0x1424485: inc rax
0x1424488: cmp byte ptr [rcx + rax], dil
0x142448c: jne 0x141424485
0x142448e: mov dword ptr [rsp + 0x28], eax
0x1424492: mov qword ptr [rsp + 0x30], rdi
0x1424497: mov qword ptr [rsp + 0x38], rdi
0x142449c: and byte ptr [rsp + 0x40], 0xfe
0x14244a1: lea rcx, [rsp + 0x48]
0x14244a6: mov qword ptr [rbp + 0x80], rcx
0x14244ad: mov qword ptr [rbp + 0x50], rdi
0x14244b1: mov qword ptr [rbp + 0x58], 0x105
0x14244b9: mov dword ptr [rbp + 0x5c], edi
0x14244bc: mov byte ptr [rsp + 0x48], 0
0x14244c1: mov dword ptr [rbp + 0x5c], edi
0x14244c4: mov byte ptr [rsp + 0x48], 0
0x14244c9: mov rcx, qword ptr [rbp + 0x50]
0x14244cd: test rcx, rcx
0x14244d0: je 0x1414244d5
0x14244d2: mov byte ptr [rcx], 0
0x14244d5: mov qword ptr [rbp + 0x60], rdi
0x14244d9: mov dword ptr [rbp + 0x68], edi
0x14244dc: test eax, eax
0x14244de: je 0x141424500
0x14244e0: lea rdx, [rsp + 0x20]
0x14244e5: lea rcx, [rsp + 0x30]
0x14244ea: call 0x1413eeec0
0x14244ef: lea rdx, [rip + 0x415e14a]
0x14244f6: lea rcx, [rsp + 0x30]
0x14244fb: call 0x1413eede0
0x1424500: or byte ptr [rsp + 0x40], 1
0x1424505: cmp dword ptr [rsp + 0x38], 2
0x142450a: jne 0x14142453e
0x142450c: mov rcx, qword ptr [rsp + 0x30]
0x1424511: mov rcx, qword ptr [rcx]
0x1424514: call qword ptr [rip + 0x3dc7b8e]
0x142451a: vcvtsd2ss xmm1, xmm0, xmm0
0x142451e: vmovss dword ptr [rbx], xmm1
0x1424522: mov rcx, qword ptr [rsp + 0x30]
0x1424527: mov rcx, qword ptr [rcx + 8]
0x142452b: call qword ptr [rip + 0x3dc7b77]
0x1424531: vcvtsd2ss xmm1, xmm0, xmm0
0x1424535: vmovss dword ptr [rbx + 4], xmm1
0x142453a: mov bl, 1
0x142453c: jmp 0x141424540
0x142453e: xor bl, bl
0x1424540: lea rax, [rsp + 0x48]
0x1424545: mov qword ptr [rbp + 0x80], rax
0x142454c: lea rcx, [rsp + 0x48]
0x1424551: call 0x140394170
0x1424556: nop 
0x1424557: mov rcx, qword ptr [rsp + 0x30]
0x142455c: test rcx, rcx
0x142455f: je 0x141424586
0x1424561: mov r8d, 0x1fd
0x1424567: mov rax, qword ptr gs:[0x58]
0x1424570: mov rdx, qword ptr [rax]
0x1424573: cmp byte ptr [r8 + rdx], 0
0x1424578: je 0x141424581
0x142457a: call 0x1447f03bc
0x142457f: jmp 0x141424586
0x1424581: call 0x1447f02bc
0x1424586: mov qword ptr [rsp + 0x30], rdi
0x142458b: mov qword ptr [rsp + 0x38], rdi
0x1424590: movzx eax, bl
0x1424593: lea r11, [rsp + 0x170]
0x142459b: mov rbx, qword ptr [r11 + 0x18]
0x142459f: mov rdi, qword ptr [r11 + 0x20]
0x14245a3: mov rsp, r11
0x14245a6: pop rbp
0x14245a7: ret 