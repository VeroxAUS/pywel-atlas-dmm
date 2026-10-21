0x4f8220: push rbx
0x4f8222: sub rsp, 0x80
0x4f8229: mov eax, dword ptr [rcx + 0xbc]
0x4f822f: mov rbx, rdx
0x4f8232: vmovsd xmm0, qword ptr [rcx + 0xb4]
0x4f823a: vmovsd xmm1, qword ptr [rcx + 0xf0]
0x4f8242: mov dword ptr [rsp + 0x28], eax
0x4f8246: movzx eax, word ptr [rcx + 0xc0]
0x4f824d: mov word ptr [rsp + 0x2c], ax
0x4f8252: movzx eax, word ptr [rcx + 0xc2]
0x4f8259: vmovsd qword ptr [rsp + 0x20], xmm0
0x4f825f: vmovups ymm0, ymmword ptr [rcx + 0xd0]
0x4f8267: mov word ptr [rsp + 0x2e], ax
0x4f826c: mov rax, qword ptr [rcx + 0xc8]
0x4f8273: vmovups ymmword ptr [rsp + 0x38], ymm0
0x4f8279: vmovups xmm0, xmmword ptr [rcx + 0xfc]
0x4f8281: mov qword ptr [rsp + 0x30], rax
0x4f8286: mov eax, dword ptr [rcx + 0xf8]
0x4f828c: lea rcx, [rsp + 0x38]
0x4f8291: mov dword ptr [rsp + 0x60], eax
0x4f8295: vmovsd qword ptr [rsp + 0x58], xmm1
0x4f829b: vmovups xmmword ptr [rsp + 0x64], xmm0
0x4f82a1: vzeroupper 
0x4f82a4: call 0x1403933a0
0x4f82a9: test al, al
0x4f82ab: je 0x1404f82c3
0x4f82ad: vmovups xmm0, xmmword ptr [rsp + 0x20]
0x4f82b3: vmovups xmmword ptr [rdx], xmm0
0x4f82b7: mov rax, rdx
0x4f82ba: add rsp, 0x80
0x4f82c1: pop rbx
0x4f82c2: ret 
0x4f82c3: lea r8, [rsp + 0x20]
0x4f82c8: lea rcx, [rsp + 0x38]
0x4f82cd: call 0x14050ea80
0x4f82d2: mov rax, rbx
0x4f82d5: add rsp, 0x80
0x4f82dc: pop rbx
0x4f82dd: ret 