0xdb4420: mov rax, rsp
0xdb4423: mov qword ptr [rax + 0x10], rbx
0xdb4427: mov qword ptr [rax + 0x18], r8
0xdb442b: mov qword ptr [rax + 8], rcx
0xdb442f: push rbp
0xdb4430: push rsi
0xdb4431: push rdi
0xdb4432: push r12
0xdb4434: push r13
0xdb4436: push r14
0xdb4438: push r15
0xdb443a: lea rbp, [rax - 0x78]
0xdb443e: sub rsp, 0x140
0xdb4445: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdb444a: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdb444f: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdb4454: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdb4459: mov rsi, r9
0xdb445c: mov r12, r8
0xdb445f: mov rdi, rdx
0xdb4462: mov r15, rcx
0xdb4465: xor eax, eax
0xdb4467: mov dword ptr [rbp - 0x3f], eax
0xdb446a: mov word ptr [rbp - 0x3b], ax
0xdb446e: mov byte ptr [rbp - 0x39], al
0xdb4471: mov qword ptr [rbp - 0x28], rcx
0xdb4475: movzx eax, word ptr [r8]
0xdb4479: mov word ptr [rbp - 0x50], ax
0xdb447d: movzx eax, byte ptr [r9 + 8]
0xdb4482: mov byte ptr [rbp - 0x40], al
0xdb4485: mov rax, qword ptr [r9]
0xdb4488: mov qword ptr [rbp - 0x48], rax
0xdb448c: mov r14, qword ptr [rbp + 0xa0]
0xdb4493: mov eax, dword ptr [r14]
0xdb4496: mov dword ptr [rbp - 0x38], eax
0xdb4499: mov rax, qword ptr [rbp + 0xa8]
0xdb44a0: vmovsd xmm0, qword ptr [rax]
0xdb44a4: vmovsd qword ptr [rbp - 0x34], xmm0
0xdb44a9: mov eax, dword ptr [rax + 8]
0xdb44ac: mov dword ptr [rbp - 0x2c], eax
0xdb44af: mov rax, qword ptr [rbp + 0xd0]
0xdb44b6: mov qword ptr [rbp - 0x10], rax
0xdb44ba: mov rax, qword ptr [rbp + 0xb0]
0xdb44c1: mov qword ptr [rbp - 0x20], rax
0xdb44c5: mov qword ptr [rbp - 0x18], 0
0xdb44cd: movzx eax, byte ptr [rbp + 0xd8]
0xdb44d4: mov byte ptr [rbp - 8], al
0xdb44d7: mov rax, qword ptr [rdx]
0xdb44da: mov r8b, 1
0xdb44dd: lea rdx, [rbp - 0x50]
0xdb44e1: mov rcx, rdi
0xdb44e4: call qword ptr [rax + 0x538]
0xdb44ea: test al, al
0xdb44ec: je 0x140db54d0
0xdb44f2: mov rbx, qword ptr [rdi + 8]
0xdb44f6: mov byte ptr [rbp + 0xd8], 0
0xdb44fd: vxorps xmm7, xmm7, xmm7
0xdb4501: vmovss dword ptr [rbp + 0xd0], xmm7
0xdb4509: mov byte ptr [rbp + 0xc8], 2
0xdb4510: lea r9, [rbp + 0xd8]
0xdb4517: lea r8, [rbp + 0xd0]
0xdb451e: lea rdx, [rbp + 0xc8]
0xdb4525: mov rcx, qword ptr [rbx + 0x20]
0xdb4529: call 0x14064b570
0xdb452e: mov byte ptr [rbp + 0xd8], 0
0xdb4535: vmovss dword ptr [rbp + 0xd0], xmm7
0xdb453d: mov byte ptr [rbp + 0xc8], 4
0xdb4544: lea r9, [rbp + 0xd8]
0xdb454b: lea r8, [rbp + 0xd0]
0xdb4552: lea rdx, [rbp + 0xc8]
0xdb4559: mov rcx, qword ptr [rbx + 0x20]
0xdb455d: call 0x14064b570
0xdb4562: cmp byte ptr [rsi + 8], 6
0xdb4566: jne 0x140db4572
0xdb4568: movzx eax, word ptr [rsi]
0xdb456b: mov word ptr [rdi + 0x288], ax
0xdb4572: mov ebx, dword ptr [r14]
0xdb4575: mov rcx, r12
0xdb4578: call 0x140537250
0xdb457d: mov r14d, 0xffff
0xdb4583: cmp byte ptr [rax + 0xab], 0
0xdb458a: jne 0x140db45e2
0xdb458c: mov rcx, r12
0xdb458f: call 0x140537250
0xdb4594: cmp byte ptr [rax + 0xaf], 0
0xdb459b: jne 0x140db45e2
0xdb459d: cmp byte ptr [rsi + 8], 0xe
0xdb45a1: jne 0x140db5182
0xdb45a7: mov eax, dword ptr [rsi]
0xdb45a9: mov dword ptr [rbp + 0xd8], eax
0xdb45af: mov byte ptr [rdi + 0x2b7], 1
0xdb45b6: cmp byte ptr [rsi + 8], 0xe
0xdb45ba: jne 0x140db5182
0xdb45c0: lea rcx, [rbp + 0xd8]
0xdb45c7: call 0x1404a2630
0xdb45cc: cmp byte ptr [rax + 0x49], 0
0xdb45d0: je 0x140db5182
0xdb45d6: mov byte ptr [rdi + 0x2b6], 1
0xdb45dd: jmp 0x140db5182
0xdb45e2: test ebx, ebx
0xdb45e4: jne 0x140db5182
0xdb45ea: mov ebx, r14d
0xdb45ed: movzx esi, bx
0xdb45f0: mov word ptr [rbp + 0xd0], bx
0xdb45f7: mov word ptr [rbp + 0xc8], bx
0xdb45fe: xor r13b, r13b
0xdb4601: mov rcx, r12
0xdb4604: call 0x140537250
0xdb4609: mov rcx, r12
0xdb460c: cmp byte ptr [rax + 0xab], r13b
0xdb4613: je 0x140db4a55
0xdb4619: call 0x140537250
0xdb461e: cmp dword ptr [rax + 0x2c], 0x16
0xdb4622: jne 0x140db47f4
0xdb4628: mov eax, dword ptr [rdi + 0x28c]
0xdb462e: mov dword ptr [rbp + 0xd8], eax
0xdb4634: lea rcx, [rbp + 0xd8]
0xdb463b: call 0x1405c15a0
0xdb4640: movzx esi, word ptr [rax + 0xf8]
0xdb4647: mov r15d, ebx
0xdb464a: cmp si, r15w
0xdb464e: jne 0x140db467a
0xdb4650: lea rbx, [rax + 0x58]
0xdb4654: cmp word ptr [rbx], r15w
0xdb4658: je 0x140db4677
0xdb465a: mov rcx, rbx
0xdb465d: call 0x1405d2070
0xdb4662: cmp word ptr [rax + 0x6c], r15w
0xdb4667: je 0x140db4677
0xdb4669: mov rcx, rbx
0xdb466c: call 0x1405d2070
0xdb4671: movzx esi, word ptr [rax + 0x6c]
0xdb4675: jmp 0x140db467a
0xdb4677: mov esi, r15d
0xdb467a: mov word ptr [rbp + 0xd0], si
0xdb4681: lea rcx, [rbp + 0xd8]
0xdb4688: call 0x1405c15a0
0xdb468d: movzx r14d, word ptr [rax + 0xfa]
0xdb4695: cmp r14w, r15w
0xdb4699: jne 0x140db46c6
0xdb469b: lea rbx, [rax + 0x58]
0xdb469f: cmp word ptr [rbx], r15w
0xdb46a3: je 0x140db46c3
0xdb46a5: mov rcx, rbx
0xdb46a8: call 0x1405d2070
0xdb46ad: cmp word ptr [rax + 0x6e], r15w
0xdb46b2: je 0x140db46c3
0xdb46b4: mov rcx, rbx
0xdb46b7: call 0x1405d2070
0xdb46bc: movzx r14d, word ptr [rax + 0x6e]
0xdb46c1: jmp 0x140db46c6
0xdb46c3: mov r14d, r15d
0xdb46c6: mov word ptr [rbp + 0xc8], r14w
0xdb46ce: lea rcx, [rbp + 0xd8]
0xdb46d5: call 0x1405c15a0
0xdb46da: cmp byte ptr [rax + 0x12], 0xd
0xdb46de: sete r13b
0xdb46e2: lea rcx, [rbp + 0xd8]
0xdb46e9: call 0x1405c15a0
0xdb46ee: mov rcx, qword ptr [rax + 0x18]
0xdb46f2: mov rax, qword ptr [rcx]
0xdb46f5: xor edx, edx
0xdb46f7: call qword ptr [rax + 8]
0xdb46fa: mov r15, rax
0xdb46fd: mov r12, qword ptr [rdi + 0x120]
0xdb4704: test r12, r12
0xdb4707: je 0x140db4788
0xdb4709: mov r12, qword ptr [r12 + 0x20]
0xdb470e: mov dword ptr [rbp + 0xd8], 0xffffffff
0xdb4718: mov ebx, dword ptr [rip + 0x5ef8b2a]
0xdb471e: lea rcx, [rbp + 0xd8]
0xdb4725: call 0x140473f20
0xdb472a: lea rcx, [rax + 8]
0xdb472e: call 0x1403d5f10
0xdb4733: xor edx, edx
0xdb4735: div ebx
0xdb4737: mov ebx, edx
0xdb4739: mov r8d, edx
0xdb473c: call 0x140dec160
0xdb4741: mov rax, qword ptr [rip + 0x5f1ca50]
0xdb4748: lea rdx, [rax + rbx*4]
0xdb474c: mov rax, qword ptr [r12]
0xdb4750: mov rcx, qword ptr [rax + 0xa0]
0xdb4757: test rcx, rcx
0xdb475a: je 0x140db4763
0xdb475c: cmp qword ptr [rcx + 8], 0
0xdb4761: jne 0x140db4788
0xdb4763: cmp dword ptr [rdx], 0
0xdb4766: je 0x140db4788
0xdb4768: mov rcx, qword ptr [r12 + 8]
0xdb476d: call 0x1435ca0a0
0xdb4772: test al, al
0xdb4774: je 0x140db4788
0xdb4776: mov rcx, qword ptr [r12 + 8]
0xdb477b: call 0x1435caec0
0xdb4780: mov rcx, r12
0xdb4783: call 0x1435c66a0
0xdb4788: mov r12, qword ptr [rbp + 0x90]
0xdb478f: test r15, r15
0xdb4792: je 0x140db47a6
0xdb4794: cmp byte ptr [r15], 0
0xdb4798: je 0x140db47a6
0xdb479a: mov rdx, r15
0xdb479d: mov rcx, qword ptr [rdi + 8]
0xdb47a1: call 0x143edd490
0xdb47a6: mov r15, qword ptr [rbp + 0x80]
0xdb47ad: lea rax, [rsp + 0x50]
0xdb47b2: mov qword ptr [rsp + 0x40], rax
0xdb47b7: mov dword ptr [rsp + 0x48], 0
0xdb47bf: mov dword ptr [rsp + 0x4c], 3
0xdb47c7: mov rcx, r12
0xdb47ca: call 0x140537250
0xdb47cf: cmp dword ptr [rax + 0x2c], 0x19
0xdb47d3: je 0x140db4b1c
0xdb47d9: mov rcx, r12
0xdb47dc: call 0x140537250
0xdb47e1: cmp dword ptr [rax + 0x2c], 0x1a
0xdb47e5: je 0x140db4b1c
0xdb47eb: mov eax, dword ptr [rsp + 0x48]
0xdb47ef: jmp 0x140db4b5e
0xdb47f4: mov eax, dword ptr [rdi + 0xd8]
0xdb47fa: mov dword ptr [rbp + 0xd8], eax
0xdb4800: cmp byte ptr [rdi + 0x1ee], r13b
0xdb4807: je 0x140db4878
0xdb4809: lea rcx, [rbp + 0xd8]
0xdb4810: call 0x140473f20
0xdb4815: movzx ecx, word ptr [rax + 0x360]
0xdb481c: mov r14d, ebx
0xdb481f: cmp cx, r14w
0xdb4823: jne 0x140db4904
0xdb4829: lea rcx, [rax + 0x1ac]
0xdb4830: call 0x1405c15a0
0xdb4835: movzx ecx, word ptr [rax + 0xf8]
0xdb483c: cmp cx, r14w
0xdb4840: jne 0x140db4904
0xdb4846: lea rbx, [rax + 0x58]
0xdb484a: cmp word ptr [rbx], r14w
0xdb484e: je 0x140db4901
0xdb4854: mov rcx, rbx
0xdb4857: call 0x1405d2070
0xdb485c: cmp word ptr [rax + 0x6c], r14w
0xdb4861: je 0x140db4901
0xdb4867: mov rcx, rbx
0xdb486a: call 0x1405d2070
0xdb486f: movzx ecx, word ptr [rax + 0x6c]
0xdb4873: jmp 0x140db4904
0xdb4878: mov edx, dword ptr [rip + 0x5f1b87e]
0xdb487e: add rdx, rdx
0xdb4881: mov rax, qword ptr [rip + 0x5ed8460]
0xdb4888: mov rcx, qword ptr [rax + 0x58]
0xdb488c: mov rcx, qword ptr [rcx + rdx*8]
0xdb4890: mov rax, 0xffffffffffffffff
0xdb4897: inc rax
0xdb489a: cmp byte ptr [rcx + rax], r13b
0xdb489e: jne 0x140db4897
0xdb48a0: mov edx, eax
0xdb48a2: call 0x141364780
0xdb48a7: mov r10d, eax
0xdb48aa: mov r11, qword ptr [rip + 0x5fb51cf]
0xdb48b1: cmp dword ptr [r11 + 0x6c], 0
0xdb48b6: je 0x140db48fb
0xdb48b8: mov ecx, dword ptr [r11 + 0x68]
0xdb48bc: test ecx, ecx
0xdb48be: je 0x140db48fb
0xdb48c0: xor edx, edx
0xdb48c2: div ecx
0xdb48c4: mov r8d, edx
0xdb48c7: shl r8, 8
0xdb48cb: add r8, qword ptr [r11 + 0x78]
0xdb48cf: xor edx, edx
0xdb48d1: mov ebx, dword ptr [r8]
0xdb48d4: test ebx, ebx
0xdb48d6: je 0x140db48fb
0xdb48d8: cmp dword ptr [r8 + rdx*8 + 8], r10d
0xdb48dd: jne 0x140db48f5
0xdb48df: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb48e4: mov rax, qword ptr [r11 + 0x80]
0xdb48eb: mov r9, qword ptr [rax + rcx*8]
0xdb48ef: cmp dword ptr [r9 + 4], r10d
0xdb48f3: je 0x140db4967
0xdb48f5: inc edx
0xdb48f7: cmp edx, ebx
0xdb48f9: jb 0x140db48d8
0xdb48fb: mov r14d, 0xffff
0xdb4901: mov ecx, r14d
0xdb4904: movzx esi, cx
0xdb4907: mov word ptr [rbp + 0xd0], cx
0xdb490e: lea rcx, [rbp + 0xd8]
0xdb4915: call 0x140473f20
0xdb491a: movzx ecx, word ptr [rax + 0x362]
0xdb4921: cmp cx, r14w
0xdb4925: jne 0x140db497c
0xdb4927: lea rcx, [rax + 0x1ac]
0xdb492e: call 0x1405c15a0
0xdb4933: movzx ecx, word ptr [rax + 0xfa]
0xdb493a: cmp cx, r14w
0xdb493e: jne 0x140db497c
0xdb4940: lea rbx, [rax + 0x58]
0xdb4944: cmp word ptr [rbx], r14w
0xdb4948: je 0x140db4979
0xdb494a: mov rcx, rbx
0xdb494d: call 0x1405d2070
0xdb4952: cmp word ptr [rax + 0x6e], r14w
0xdb4957: je 0x140db4979
0xdb4959: mov rcx, rbx
0xdb495c: call 0x1405d2070
0xdb4961: movzx ecx, word ptr [rax + 0x6e]
0xdb4965: jmp 0x140db497c
0xdb4967: add r9, 8
0xdb496b: je 0x140db48fb
0xdb496d: movzx ecx, word ptr [r9]
0xdb4971: mov r14d, 0xffff
0xdb4977: jmp 0x140db4904
0xdb4979: mov ecx, r14d
0xdb497c: movzx r14d, cx
0xdb4980: mov word ptr [rbp + 0xc8], cx
0xdb4987: lea rcx, [rbp + 0xd8]
0xdb498e: call 0x140473f20
0xdb4993: cmp byte ptr [rax + 0x392], 0xd
0xdb499a: sete r13b
0xdb499e: lea rcx, [rbp + 0xd8]
0xdb49a5: call 0x140473f20
0xdb49aa: mov rcx, qword ptr [rax + 0x18]
0xdb49ae: mov rax, qword ptr [rcx]
0xdb49b1: xor edx, edx
0xdb49b3: call qword ptr [rax + 8]
0xdb49b6: mov r15, rax
0xdb49b9: lea rcx, [rbp + 0xd8]
0xdb49c0: call 0x140473f20
0xdb49c5: cmp dword ptr [rax + 0x1ac], -1
0xdb49cc: je 0x140db478f
0xdb49d2: lea rcx, [rbp + 0xd8]
0xdb49d9: call 0x140473f20
0xdb49de: lea rcx, [rax + 0x1ac]
0xdb49e5: call 0x1405c15a0
0xdb49ea: mov ebx, 0xffff
0xdb49ef: cmp word ptr [rax + 0x5a], bx
0xdb49f3: je 0x140db478f
0xdb49f9: lea rcx, [rbp + 0xd8]
0xdb4a00: call 0x140473f20
0xdb4a05: lea rcx, [rax + 0x1ac]
0xdb4a0c: call 0x1405c15a0
0xdb4a11: lea rcx, [rax + 0x5a]
0xdb4a15: call 0x140430150
0xdb4a1a: cmp word ptr [rax + 0x34], bx
0xdb4a1e: je 0x140db478f
0xdb4a24: lea rcx, [rbp + 0xd8]
0xdb4a2b: call 0x140473f20
0xdb4a30: lea rcx, [rax + 0x1ac]
0xdb4a37: call 0x1405c15a0
0xdb4a3c: lea rcx, [rax + 0x5a]
0xdb4a40: call 0x140430150
0xdb4a45: movzx esi, word ptr [rax + 0x34]
0xdb4a49: mov word ptr [rbp + 0xd0], si
0xdb4a50: jmp 0x140db478f
0xdb4a55: call 0x140537250
0xdb4a5a: cmp byte ptr [rax + 0xaf], r13b
0xdb4a61: je 0x140db47ad
0xdb4a67: movzx eax, word ptr [rdi + 0xdc]
0xdb4a6e: mov word ptr [rbp + 0xd8], ax
0xdb4a75: lea rcx, [rbp + 0xd8]
0xdb4a7c: call 0x140430280
0xdb4a81: movzx esi, word ptr [rax + 0xb8]
0xdb4a88: cmp si, bx
0xdb4a8b: jne 0x140db4aca
0xdb4a8d: lea rcx, [rax + 0x14]
0xdb4a91: call 0x1405c15a0
0xdb4a96: movzx esi, word ptr [rax + 0xf8]
0xdb4a9d: cmp si, bx
0xdb4aa0: jne 0x140db4aca
0xdb4aa2: lea rbx, [rax + 0x58]
0xdb4aa6: mov esi, 0xffff
0xdb4aab: cmp word ptr [rbx], si
0xdb4aae: je 0x140db4aca
0xdb4ab0: mov rcx, rbx
0xdb4ab3: call 0x1405d2070
0xdb4ab8: cmp word ptr [rax + 0x6c], si
0xdb4abc: je 0x140db4aca
0xdb4abe: mov rcx, rbx
0xdb4ac1: call 0x1405d2070
0xdb4ac6: movzx esi, word ptr [rax + 0x6c]
0xdb4aca: mov word ptr [rbp + 0xd0], si
0xdb4ad1: lea rcx, [rbp + 0xd8]
0xdb4ad8: call 0x140430280
0xdb4add: lea rcx, [rax + 0x14]
0xdb4ae1: call 0x1405c15a0
0xdb4ae6: cmp byte ptr [rax + 0x12], 0xd
0xdb4aea: sete r13b
0xdb4aee: lea rdx, [rbp + 0xd8]
0xdb4af5: call 0x140655950
0xdb4afa: movzx ebx, al
0xdb4afd: lea rcx, [rbp + 0xd8]
0xdb4b04: call 0x140430280
0xdb4b09: movzx edx, bl
0xdb4b0c: mov rcx, rax
0xdb4b0f: call 0x1415e7e90
0xdb4b14: mov r15, rax
0xdb4b17: jmp 0x140db478f
0xdb4b1c: mov rbx, qword ptr [rdi + 0x118]
0xdb4b23: mov eax, dword ptr [rsp + 0x48]
0xdb4b27: cmp eax, dword ptr [rsp + 0x4c]
0xdb4b2b: jb 0x140db4b49
0xdb4b2d: mov r9d, 8
0xdb4b33: xor r8d, r8d
0xdb4b36: lea rdx, [rsp + 0x50]
0xdb4b3b: lea rcx, [rsp + 0x40]
0xdb4b40: call 0x140392380
0xdb4b45: mov eax, dword ptr [rsp + 0x48]
0xdb4b49: mov ecx, eax
0xdb4b4b: mov rax, qword ptr [rsp + 0x40]
0xdb4b50: mov qword ptr [rax + rcx*8], rbx
0xdb4b54: mov eax, dword ptr [rsp + 0x48]
0xdb4b58: inc eax
0xdb4b5a: mov dword ptr [rsp + 0x48], eax
0xdb4b5e: cmp qword ptr [rdi + 0x148], 0
0xdb4b66: je 0x140db4c6f
0xdb4b6c: mov rbx, qword ptr [rdi + 0x138]
0xdb4b73: cmp eax, dword ptr [rsp + 0x4c]
0xdb4b77: jb 0x140db4b95
0xdb4b79: mov r9d, 8
0xdb4b7f: xor r8d, r8d
0xdb4b82: lea rdx, [rsp + 0x50]
0xdb4b87: lea rcx, [rsp + 0x40]
0xdb4b8c: call 0x140392380
0xdb4b91: mov eax, dword ptr [rsp + 0x48]
0xdb4b95: mov ecx, eax
0xdb4b97: mov rax, qword ptr [rsp + 0x40]
0xdb4b9c: mov qword ptr [rax + rcx*8], rbx
0xdb4ba0: mov eax, dword ptr [rsp + 0x48]
0xdb4ba4: inc eax
0xdb4ba6: mov dword ptr [rsp + 0x48], eax
0xdb4baa: mov ecx, 0xffff
0xdb4baf: cmp cx, r14w
0xdb4bb3: je 0x140db4c6f
0xdb4bb9: lea rcx, [rbp + 0xc8]
0xdb4bc0: call 0x140388e00
0xdb4bc5: mov rcx, qword ptr [rax + 0x18]
0xdb4bc9: mov rdx, qword ptr [rcx]
0xdb4bcc: mov qword ptr [rsp + 0x30], 0
0xdb4bd5: lea rax, [rip + 0x5cb0d64]
0xdb4bdc: mov qword ptr [rsp + 0x30], rax
0xdb4be1: mov byte ptr [rsp + 0x38], 6
0xdb4be6: mov byte ptr [rsp + 0x38], 1
0xdb4beb: lea rcx, [rsp + 0x30]
0xdb4bf0: call 0x1403d5f80
0xdb4bf5: lea rcx, [rsp + 0x30]
0xdb4bfa: call 0x14141fe80
0xdb4bff: lea rcx, [rsp + 0x30]
0xdb4c04: call 0x141420260
0xdb4c09: nop 
0xdb4c0a: mov rax, qword ptr [r15]
0xdb4c0d: mov rcx, r15
0xdb4c10: call qword ptr [rax + 0x110]
0xdb4c16: lea rdx, [rsp + 0x30]
0xdb4c1b: mov rcx, qword ptr [rax + 0x311e8]
0xdb4c22: call 0x143f321f0
0xdb4c27: test al, al
0xdb4c29: je 0x140db4c61
0xdb4c2b: mov rax, qword ptr [rdi + 0x158]
0xdb4c32: mov rcx, qword ptr [rax + 8]
0xdb4c36: mov rcx, qword ptr [rcx + 0x20]
0xdb4c3a: mov byte ptr [rbp + 0xd8], 0
0xdb4c41: mov byte ptr [rbp + 0xc8], 0x26
0xdb4c48: lea r9, [rbp + 0xd8]
0xdb4c4f: lea r8, [rsp + 0x30]
0xdb4c54: lea rdx, [rbp + 0xc8]
0xdb4c5b: call 0x14064b880
0xdb4c60: nop 
0xdb4c61: lea rcx, [rsp + 0x30]
0xdb4c66: call 0x140394db0
0xdb4c6b: mov eax, dword ptr [rsp + 0x48]
0xdb4c6f: mov rbx, qword ptr [rdi + 0x128]
0xdb4c76: test rbx, rbx
0xdb4c79: je 0x140db4cb2
0xdb4c7b: cmp eax, dword ptr [rsp + 0x4c]
0xdb4c7f: jb 0x140db4c9d
0xdb4c81: mov r9d, 8
0xdb4c87: xor r8d, r8d
0xdb4c8a: lea rdx, [rsp + 0x50]
0xdb4c8f: lea rcx, [rsp + 0x40]
0xdb4c94: call 0x140392380
0xdb4c99: mov eax, dword ptr [rsp + 0x48]
0xdb4c9d: mov ecx, eax
0xdb4c9f: mov rax, qword ptr [rsp + 0x40]
0xdb4ca4: mov qword ptr [rax + rcx*8], rbx
0xdb4ca8: mov eax, dword ptr [rsp + 0x48]
0xdb4cac: inc eax
0xdb4cae: mov dword ptr [rsp + 0x48], eax
0xdb4cb2: mov rbx, qword ptr [rdi + 0x198]
0xdb4cb9: test rbx, rbx
0xdb4cbc: je 0x140db4cf5
0xdb4cbe: cmp eax, dword ptr [rsp + 0x4c]
0xdb4cc2: jb 0x140db4ce0
0xdb4cc4: mov r9d, 8
0xdb4cca: xor r8d, r8d
0xdb4ccd: lea rdx, [rsp + 0x50]
0xdb4cd2: lea rcx, [rsp + 0x40]
0xdb4cd7: call 0x140392380
0xdb4cdc: mov eax, dword ptr [rsp + 0x48]
0xdb4ce0: mov ecx, eax
0xdb4ce2: mov rax, qword ptr [rsp + 0x40]
0xdb4ce7: mov qword ptr [rax + rcx*8], rbx
0xdb4ceb: mov eax, dword ptr [rsp + 0x48]
0xdb4cef: inc eax
0xdb4cf1: mov dword ptr [rsp + 0x48], eax
0xdb4cf5: mov r14d, 0xffff
0xdb4cfb: cmp r14w, si
0xdb4cff: je 0x140db4ddd
0xdb4d05: mov rbx, qword ptr [rsp + 0x40]
0xdb4d0a: lea rsi, [rbx + rax*8]
0xdb4d0e: cmp rbx, rsi
0xdb4d11: je 0x140db4ddd
0xdb4d17: lea r12, [rip + 0x5cb0c22]
0xdb4d1e: nop 
0xdb4d20: mov r14, qword ptr [rbx]
0xdb4d23: lea rcx, [rbp + 0xd0]
0xdb4d2a: call 0x140388e00
0xdb4d2f: mov rcx, qword ptr [rax + 0x18]
0xdb4d33: mov rdx, qword ptr [rcx]
0xdb4d36: mov qword ptr [rsp + 0x30], 0
0xdb4d3f: mov qword ptr [rsp + 0x30], r12
0xdb4d44: mov byte ptr [rsp + 0x38], 6
0xdb4d49: mov byte ptr [rsp + 0x38], 1
0xdb4d4e: lea rcx, [rsp + 0x30]
0xdb4d53: call 0x1403d5f80
0xdb4d58: lea rcx, [rsp + 0x30]
0xdb4d5d: call 0x14141fe80
0xdb4d62: lea rcx, [rsp + 0x30]
0xdb4d67: call 0x141420260
0xdb4d6c: nop 
0xdb4d6d: mov rax, qword ptr [r15]
0xdb4d70: mov rcx, r15
0xdb4d73: call qword ptr [rax + 0x110]
0xdb4d79: lea rdx, [rsp + 0x30]
0xdb4d7e: mov rcx, qword ptr [rax + 0x311e8]
0xdb4d85: call 0x143f321f0
0xdb4d8a: test al, al
0xdb4d8c: je 0x140db4db9
0xdb4d8e: mov byte ptr [rbp + 0xd8], 0
0xdb4d95: mov byte ptr [rbp + 0xc8], 0x26
0xdb4d9c: lea r9, [rbp + 0xd8]
0xdb4da3: lea r8, [rsp + 0x30]
0xdb4da8: lea rdx, [rbp + 0xc8]
0xdb4daf: mov rcx, qword ptr [r14 + 0x20]
0xdb4db3: call 0x14064b880
0xdb4db8: nop 
0xdb4db9: lea rcx, [rsp + 0x30]
0xdb4dbe: call 0x140394db0
0xdb4dc3: add rbx, 8
0xdb4dc7: cmp rbx, rsi
0xdb4dca: jne 0x140db4d20
0xdb4dd0: mov r12, qword ptr [rbp + 0x90]
0xdb4dd7: mov r14d, 0xffff
0xdb4ddd: lea rax, [rsp + 0x50]
0xdb4de2: mov edx, 0x1fd
0xdb4de7: mov rcx, qword ptr [rsp + 0x40]
0xdb4dec: cmp rcx, rax
0xdb4def: je 0x140db4e18
0xdb4df1: test rcx, rcx
0xdb4df4: je 0x140db4e18
0xdb4df6: mov r8d, edx
0xdb4df9: mov rax, qword ptr gs:[0x58]
0xdb4e02: mov rdx, qword ptr [rax]
0xdb4e05: cmp byte ptr [r8 + rdx], 0
0xdb4e0a: je 0x140db4e13
0xdb4e0c: call 0x1447f03bc
0xdb4e11: jmp 0x140db4e18
0xdb4e13: call 0x1447f02bc
0xdb4e18: lea rax, [rsp + 0x78]
0xdb4e1d: mov qword ptr [rsp + 0x68], rax
0xdb4e22: mov dword ptr [rsp + 0x70], 0
0xdb4e2a: mov dword ptr [rsp + 0x74], 3
0xdb4e32: mov rdx, qword ptr [rdi + 0x120]
0xdb4e39: mov ecx, dword ptr [rsp + 0x70]
0xdb4e3d: test rdx, rdx
0xdb4e40: je 0x140db4e55
0xdb4e42: mov rax, qword ptr [rsp + 0x68]
0xdb4e47: mov qword ptr [rax + rcx*8], rdx
0xdb4e4b: mov ecx, dword ptr [rsp + 0x70]
0xdb4e4f: inc ecx
0xdb4e51: mov dword ptr [rsp + 0x70], ecx
0xdb4e55: mov rbx, qword ptr [rdi + 0x130]
0xdb4e5c: test rbx, rbx
0xdb4e5f: je 0x140db4e96
0xdb4e61: cmp ecx, dword ptr [rsp + 0x74]
0xdb4e65: jb 0x140db4e83
0xdb4e67: mov r9d, 8
0xdb4e6d: xor r8d, r8d
0xdb4e70: lea rdx, [rsp + 0x78]
0xdb4e75: lea rcx, [rsp + 0x68]
0xdb4e7a: call 0x140392380
0xdb4e7f: mov ecx, dword ptr [rsp + 0x70]
0xdb4e83: mov rax, qword ptr [rsp + 0x68]
0xdb4e88: mov qword ptr [rax + rcx*8], rbx
0xdb4e8c: mov ecx, dword ptr [rsp + 0x70]
0xdb4e90: inc ecx
0xdb4e92: mov dword ptr [rsp + 0x70], ecx
0xdb4e96: mov rbx, qword ptr [rdi + 0x190]
0xdb4e9d: test rbx, rbx
0xdb4ea0: je 0x140db4ed7
0xdb4ea2: cmp ecx, dword ptr [rsp + 0x74]
0xdb4ea6: jb 0x140db4ec4
0xdb4ea8: mov r9d, 8
0xdb4eae: xor r8d, r8d
0xdb4eb1: lea rdx, [rsp + 0x78]
0xdb4eb6: lea rcx, [rsp + 0x68]
0xdb4ebb: call 0x140392380
0xdb4ec0: mov ecx, dword ptr [rsp + 0x70]
0xdb4ec4: mov rax, qword ptr [rsp + 0x68]
0xdb4ec9: mov qword ptr [rax + rcx*8], rbx
0xdb4ecd: mov ecx, dword ptr [rsp + 0x70]
0xdb4ed1: inc ecx
0xdb4ed3: mov dword ptr [rsp + 0x70], ecx
0xdb4ed7: test r13b, r13b
0xdb4eda: je 0x140db4ef0
0xdb4edc: mov eax, dword ptr [rip + 0x5f19f56]
0xdb4ee2: mov dword ptr [rbp + 0xd8], eax
0xdb4ee8: mov eax, dword ptr [rip + 0x5f19f4e]
0xdb4eee: jmp 0x140db4f02
0xdb4ef0: mov eax, dword ptr [rip + 0x5f19f46]
0xdb4ef6: mov dword ptr [rbp + 0xd8], eax
0xdb4efc: mov eax, dword ptr [rip + 0x5f19f36]
0xdb4f02: mov dword ptr [rbp + 0xc8], eax
0xdb4f08: mov rbx, qword ptr [rsp + 0x68]
0xdb4f0d: lea rsi, [rbx + rcx*8]
0xdb4f11: cmp rbx, rsi
0xdb4f14: je 0x140db4f64
0xdb4f16: nop word ptr [rax + rax]
0xdb4f20: lea rax, [rbp + 0xd8]
0xdb4f27: mov qword ptr [rsp + 0x30], rax
0xdb4f2c: mov dword ptr [rsp + 0x38], 1
0xdb4f34: lea rax, [rbp + 0xc8]
0xdb4f3b: mov qword ptr [rbp - 0x70], rax
0xdb4f3f: mov dword ptr [rbp - 0x68], 1
0xdb4f46: mov rcx, qword ptr [rbx]
0xdb4f49: lea r8, [rsp + 0x30]
0xdb4f4e: lea rdx, [rbp - 0x70]
0xdb4f52: mov rcx, qword ptr [rcx + 0x20]
0xdb4f56: call 0x1435ca4f0
0xdb4f5b: add rbx, 8
0xdb4f5f: cmp rbx, rsi
0xdb4f62: jne 0x140db4f20
0xdb4f64: lea rax, [rsp + 0x78]
0xdb4f69: mov rcx, qword ptr [rsp + 0x68]
0xdb4f6e: cmp rcx, rax
0xdb4f71: je 0x140db4f9d
0xdb4f73: test rcx, rcx
0xdb4f76: je 0x140db4f9d
0xdb4f78: mov r8d, 0x1fd
0xdb4f7e: mov rax, qword ptr gs:[0x58]
0xdb4f87: mov rdx, qword ptr [rax]
0xdb4f8a: cmp byte ptr [r8 + rdx], 0
0xdb4f8f: je 0x140db4f98
0xdb4f91: call 0x1447f03bc
0xdb4f96: jmp 0x140db4f9d
0xdb4f98: call 0x1447f02bc
0xdb4f9d: mov rax, qword ptr [rdi + 0x120]
0xdb4fa4: mov rcx, qword ptr [rbp + 0xa8]
0xdb4fab: vmovss xmm0, dword ptr [rcx + 4]
0xdb4fb0: vcomiss xmm0, dword ptr [rip + 0x5f29090]
0xdb4fb8: jbe 0x140db50c0
0xdb4fbe: test rax, rax
0xdb4fc1: je 0x140db500b
0xdb4fc3: mov rbx, qword ptr [rax + 0x20]
0xdb4fc7: mov rax, qword ptr [rbx]
0xdb4fca: mov rcx, qword ptr [rax + 0xa0]
0xdb4fd1: test rcx, rcx
0xdb4fd4: je 0x140db4fdd
0xdb4fd6: cmp qword ptr [rcx + 8], 0
0xdb4fdb: jne 0x140db500b
0xdb4fdd: cmp dword ptr [rip + 0x5f1b038], 0
0xdb4fe4: je 0x140db500b
0xdb4fe6: lea rdx, [rip + 0x5f1b02f]
0xdb4fed: mov rcx, qword ptr [rbx + 8]
0xdb4ff1: call 0x1435ca0a0
0xdb4ff6: test al, al
0xdb4ff8: je 0x140db500b
0xdb4ffa: mov rcx, qword ptr [rbx + 8]
0xdb4ffe: call 0x1435caec0
0xdb5003: mov rcx, rbx
0xdb5006: call 0x1435c66a0
0xdb500b: mov rbx, qword ptr [rdi + 0x190]
0xdb5012: test rbx, rbx
0xdb5015: je 0x140db505f
0xdb5017: mov rbx, qword ptr [rbx + 0x20]
0xdb501b: mov rax, qword ptr [rbx]
0xdb501e: mov rcx, qword ptr [rax + 0xa0]
0xdb5025: test rcx, rcx
0xdb5028: je 0x140db5031
0xdb502a: cmp qword ptr [rcx + 8], 0
0xdb502f: jne 0x140db505f
0xdb5031: cmp dword ptr [rip + 0x5f1afe4], 0
0xdb5038: je 0x140db505f
0xdb503a: lea rdx, [rip + 0x5f1afdb]
0xdb5041: mov rcx, qword ptr [rbx + 8]
0xdb5045: call 0x1435ca0a0
0xdb504a: test al, al
0xdb504c: je 0x140db505f
0xdb504e: mov rcx, qword ptr [rbx + 8]
0xdb5052: call 0x1435caec0
0xdb5057: mov rcx, rbx
0xdb505a: call 0x1435c66a0
0xdb505f: mov rbx, qword ptr [rdi + 0x130]
0xdb5066: test rbx, rbx
0xdb5069: je 0x140db5182
0xdb506f: mov rbx, qword ptr [rbx + 0x20]
0xdb5073: mov rax, qword ptr [rbx]
0xdb5076: mov rcx, qword ptr [rax + 0xa0]
0xdb507d: test rcx, rcx
0xdb5080: je 0x140db508d
0xdb5082: cmp qword ptr [rcx + 8], 0
0xdb5087: jne 0x140db5182
0xdb508d: cmp dword ptr [rip + 0x5f1af88], 0
0xdb5094: je 0x140db5182
0xdb509a: lea rdx, [rip + 0x5f1af7b]
0xdb50a1: mov rcx, qword ptr [rbx + 8]
0xdb50a5: call 0x1435ca0a0
0xdb50aa: test al, al
0xdb50ac: je 0x140db5182
0xdb50b2: mov rcx, qword ptr [rbx + 8]
0xdb50b6: call 0x1435caec0
0xdb50bb: jmp 0x140db517a
0xdb50c0: test rax, rax
0xdb50c3: je 0x140db50fc
0xdb50c5: mov rbx, qword ptr [rax + 0x20]
0xdb50c9: mov rax, qword ptr [rbx]
0xdb50cc: mov rcx, qword ptr [rax + 0xa0]
0xdb50d3: test rcx, rcx
0xdb50d6: je 0x140db50df
0xdb50d8: cmp qword ptr [rcx + 8], 0
0xdb50dd: jne 0x140db50fc
0xdb50df: lea rdx, [rip + 0x5f1af36]
0xdb50e6: mov rcx, qword ptr [rbx + 8]
0xdb50ea: call 0x1435ca140
0xdb50ef: cmp eax, -1
0xdb50f2: je 0x140db50fc
0xdb50f4: mov rcx, rbx
0xdb50f7: call 0x1435c66a0
0xdb50fc: mov rbx, qword ptr [rdi + 0x190]
0xdb5103: test rbx, rbx
0xdb5106: je 0x140db513f
0xdb5108: mov rbx, qword ptr [rbx + 0x20]
0xdb510c: mov rax, qword ptr [rbx]
0xdb510f: mov rcx, qword ptr [rax + 0xa0]
0xdb5116: test rcx, rcx
0xdb5119: je 0x140db5122
0xdb511b: cmp qword ptr [rcx + 8], 0
0xdb5120: jne 0x140db513f
0xdb5122: lea rdx, [rip + 0x5f1aef3]
0xdb5129: mov rcx, qword ptr [rbx + 8]
0xdb512d: call 0x1435ca140
0xdb5132: cmp eax, -1
0xdb5135: je 0x140db513f
0xdb5137: mov rcx, rbx
0xdb513a: call 0x1435c66a0
0xdb513f: mov rbx, qword ptr [rdi + 0x130]
0xdb5146: test rbx, rbx
0xdb5149: je 0x140db5182
0xdb514b: mov rbx, qword ptr [rbx + 0x20]
0xdb514f: mov rax, qword ptr [rbx]
0xdb5152: mov rcx, qword ptr [rax + 0xa0]
0xdb5159: test rcx, rcx
0xdb515c: je 0x140db5165
0xdb515e: cmp qword ptr [rcx + 8], 0
0xdb5163: jne 0x140db5182
0xdb5165: lea rdx, [rip + 0x5f1aeb0]
0xdb516c: mov rcx, qword ptr [rbx + 8]
0xdb5170: call 0x1435ca140
0xdb5175: cmp eax, -1
0xdb5178: je 0x140db5182
0xdb517a: mov rcx, rbx
0xdb517d: call 0x1435c66a0
0xdb5182: mov rax, qword ptr [rbp + 0xa0]
0xdb5189: mov r8d, dword ptr [rax]
0xdb518c: test r8d, r8d
0xdb518f: je 0x140db51f7
0xdb5191: lea rdx, [rbp - 0x70]
0xdb5195: call 0x14064f570
0xdb519a: nop 
0xdb519b: cmp byte ptr [rbp - 0x60], 0
0xdb519f: je 0x140db51e3
0xdb51a1: mov rax, qword ptr [rbp - 0x68]
0xdb51a5: mov rcx, qword ptr [rax + 0x68]
0xdb51a9: mov rcx, qword ptr [rcx + 0x20]
0xdb51ad: add rcx, 0x30
0xdb51b1: call 0x140389570
0xdb51b6: movzx ecx, word ptr [rax + 0xbe]
0xdb51bd: mov word ptr [rbp + 0xd8], cx
0xdb51c4: cmp cx, r14w
0xdb51c8: je 0x140db51e3
0xdb51ca: lea rcx, [rbp + 0xd8]
0xdb51d1: call 0x1403891b0
0xdb51d6: cmp byte ptr [rax + 0x5b], 0
0xdb51da: je 0x140db51e3
0xdb51dc: mov byte ptr [rdi + 0x2b6], 1
0xdb51e3: lea rax, [rip + 0x4970c5e]
0xdb51ea: mov qword ptr [rbp - 0x70], rax
0xdb51ee: lea rcx, [rbp - 0x70]
0xdb51f2: call 0x141434880
0xdb51f7: mov rcx, r12
0xdb51fa: call 0x140537250
0xdb51ff: cmp dword ptr [rax + 0x2c], 0x5f
0xdb5203: jne 0x140db520c
0xdb5205: mov byte ptr [rdi + 0x1d5], 1
0xdb520c: mov rbx, qword ptr [rdi + 0x104]
0xdb5213: mov qword ptr [rbp + 0x90], rbx
0xdb521a: vmovss xmm6, dword ptr [rbp + 0xc0]
0xdb5222: vucomiss xmm6, xmm7
0xdb5226: jp 0x140db5253
0xdb5228: jne 0x140db5253
0xdb522a: xor sil, sil
0xdb522d: vmovss xmm0, dword ptr [rbp + 0x90]
0xdb5235: vucomiss xmm0, xmm7
0xdb5239: jp 0x140db5256
0xdb523b: jne 0x140db5256
0xdb523d: vmovss xmm0, dword ptr [rbp + 0x94]
0xdb5245: vucomiss xmm0, xmm7
0xdb5249: jp 0x140db5256
0xdb524b: je 0x140db54ce
0xdb5251: jmp 0x140db5256
0xdb5253: mov sil, 1
0xdb5256: mov rax, qword ptr [r15 + 0x590]
0xdb525d: mov rcx, qword ptr [rax + 8]
0xdb5261: mov rcx, qword ptr [rcx + 0x20]
0xdb5265: mov byte ptr [rbp + 0xd8], 6
0xdb526c: lea r8, [rbp + 0xd8]
0xdb5273: lea rdx, [rbp - 0x70]
0xdb5277: call 0x1435c8ef0
0xdb527c: lea rcx, [rbp - 0x70]
0xdb5280: call 0x140615320
0xdb5285: cmp byte ptr [rax + 0xe], 0
0xdb5289: je 0x140db528e
0xdb528b: mov rax, qword ptr [rax]
0xdb528e: vmovss xmm9, dword ptr [rax]
0xdb5292: test sil, sil
0xdb5295: je 0x140db52a1
0xdb5297: vaddss xmm7, xmm6, xmm6
0xdb529b: vmovaps xmm8, xmm7
0xdb529f: jmp 0x140db52b8
0xdb52a1: mov qword ptr [rbp + 0x90], rbx
0xdb52a8: vmovss xmm7, dword ptr [rbp + 0x90]
0xdb52b0: vmovss xmm8, dword ptr [rbp + 0x94]
0xdb52b8: lea rcx, [r15 + 0xa00]
0xdb52bf: call 0x1404a2010
0xdb52c4: vmovss xmm3, dword ptr [rax + 0x2c]
0xdb52c9: vmovss xmm0, dword ptr [rip + 0x5ef6767]
0xdb52d1: vdivss xmm1, xmm0, xmm0
0xdb52d5: vmulss xmm2, xmm1, xmm9
0xdb52da: vdivss xmm3, xmm3, xmm2
0xdb52de: vmovss xmm0, dword ptr [rip + 0x4fbddce]
0xdb52e6: vdivss xmm1, xmm0, xmm3
0xdb52ea: vmulss xmm0, xmm1, xmm7
0xdb52ee: vmovss dword ptr [rbp + 0x80], xmm0
0xdb52f6: vmulss xmm1, xmm8, xmm1
0xdb52fa: vmovss dword ptr [rbp + 0x84], xmm1
0xdb5302: test sil, sil
0xdb5305: je 0x140db5328
0xdb5307: vmovss dword ptr [rdi + 0x100], xmm6
0xdb530f: cmp byte ptr [rdi + 0x2b8], 0
0xdb5316: je 0x140db5328
0xdb5318: vdivss xmm0, xmm6, dword ptr [rip + 0x5ef6718]
0xdb5320: vmovss dword ptr [rdi + 0x280], xmm0
0xdb5328: mov rax, qword ptr [rdi + 0x118]
0xdb532f: mov rcx, qword ptr [rax + 0x20]
0xdb5333: mov byte ptr [rbp + 0xd8], 1
0xdb533a: mov byte ptr [rbp + 0xc8], 6
0xdb5341: lea r9, [rbp + 0xd8]
0xdb5348: lea r8, [rbp + 0x80]
0xdb534f: lea rdx, [rbp + 0xc8]
0xdb5356: call 0x14064b570
0xdb535b: mov rax, qword ptr [rdi + 0x118]
0xdb5362: mov rcx, qword ptr [rax + 0x20]
0xdb5366: mov byte ptr [rbp + 0xd8], 1
0xdb536d: mov byte ptr [rbp + 0xc8], 9
0xdb5374: lea r9, [rbp + 0xd8]
0xdb537b: lea r8, [rbp + 0x84]
0xdb5382: lea rdx, [rbp + 0xc8]
0xdb5389: call 0x14064b570
0xdb538e: vmovss xmm3, dword ptr [rip + 0x4fbdb9e]
0xdb5396: vmulss xmm1, xmm3, dword ptr [rbp + 0x80]
0xdb539e: vmulss xmm2, xmm1, dword ptr [rip + 0x5ef6822]
0xdb53a6: vmovss dword ptr [rbp + 0xa8], xmm2
0xdb53ae: vmulss xmm1, xmm3, dword ptr [rbp + 0x84]
0xdb53b6: vmulss xmm2, xmm1, dword ptr [rip + 0x5ef680a]
0xdb53be: vmovss dword ptr [rbp + 0xac], xmm2
0xdb53c6: mov rbx, qword ptr [rdi + 0x160]
0xdb53cd: vmovss xmm6, dword ptr [rip + 0x4fc097b]
0xdb53d5: test rbx, rbx
0xdb53d8: je 0x140db544e
0xdb53da: mov rax, qword ptr [rbx + 8]
0xdb53de: mov rcx, qword ptr [rax + 0x20]
0xdb53e2: mov byte ptr [rbp + 0xd8], 1
0xdb53e9: mov byte ptr [rbp + 0xc8], 2
0xdb53f0: lea r9, [rbp + 0xd8]
0xdb53f7: lea r8, [rbp + 0xa8]
0xdb53fe: lea rdx, [rbp + 0xc8]
0xdb5405: call 0x14064b570
0xdb540a: mov rax, qword ptr [rbx + 8]
0xdb540e: mov rcx, qword ptr [rax + 0x20]
0xdb5412: mov byte ptr [rbp + 0xd8], 1
0xdb5419: vmovss xmm0, dword ptr [rbp + 0xac]
0xdb5421: vxorps xmm1, xmm0, xmm6
0xdb5425: vmovss dword ptr [rbp + 0x90], xmm1
0xdb542d: mov byte ptr [rbp + 0xc8], 4
0xdb5434: lea r9, [rbp + 0xd8]
0xdb543b: lea r8, [rbp + 0x90]
0xdb5442: lea rdx, [rbp + 0xc8]
0xdb5449: call 0x14064b570
0xdb544e: mov rbx, qword ptr [rdi + 0x170]
0xdb5455: test rbx, rbx
0xdb5458: je 0x140db54ce
0xdb545a: mov rax, qword ptr [rbx + 8]
0xdb545e: mov rcx, qword ptr [rax + 0x20]
0xdb5462: mov byte ptr [rbp + 0xd8], 1
0xdb5469: mov byte ptr [rbp + 0xc8], 2
0xdb5470: lea r9, [rbp + 0xd8]
0xdb5477: lea r8, [rbp + 0xa8]
0xdb547e: lea rdx, [rbp + 0xc8]
0xdb5485: call 0x14064b570
0xdb548a: mov rax, qword ptr [rbx + 8]
0xdb548e: mov rcx, qword ptr [rax + 0x20]
0xdb5492: mov byte ptr [rbp + 0xd8], 1
0xdb5499: vmovss xmm0, dword ptr [rbp + 0xac]
0xdb54a1: vxorps xmm1, xmm0, xmm6
0xdb54a5: vmovss dword ptr [rbp + 0x90], xmm1
0xdb54ad: mov byte ptr [rbp + 0xc8], 4
0xdb54b4: lea r9, [rbp + 0xd8]
0xdb54bb: lea r8, [rbp + 0x90]
0xdb54c2: lea rdx, [rbp + 0xc8]
0xdb54c9: call 0x14064b570
0xdb54ce: mov al, 1
0xdb54d0: lea r11, [rsp + 0x140]
0xdb54d8: mov rbx, qword ptr [r11 + 0x48]
0xdb54dc: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdb54e2: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdb54e8: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdb54ee: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdb54f4: mov rsp, r11
0xdb54f7: pop r15
0xdb54f9: pop r14
0xdb54fb: pop r13
0xdb54fd: pop r12
0xdb54ff: pop rdi
0xdb5500: pop rsi
0xdb5501: pop rbp
0xdb5502: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x4a2630
0x4a2630: mov qword ptr [rsp + 0x10], rbx
0x4a2635: mov qword ptr [rsp + 0x18], rbp
0x4a263a: push rsi
0x4a263b: push rdi
0x4a263c: push r14
0x4a263e: sub rsp, 0x50
0x4a2642: mov edi, dword ptr [rcx]
0x4a2644: mov rbx, qword ptr [rip + 0x68cbded]
0x4a264b: cmp edi, dword ptr [rbx + 8]
0x4a264e: jae 0x1404a2736
0x4a2654: lea rsi, [rdi*8]
0x4a265c: mov rax, qword ptr [rbx + 0x58]
0x4a2660: mov rax, qword ptr [rsi + rax]
0x4a2664: test rax, rax
0x4a2667: jne 0x1404a2740
0x4a266d: lea r14, [rbx + 0x90]
0x4a2674: cmp qword ptr [r14], rax
0x4a2677: jne 0x1404a269e
0x4a2679: mov qword ptr [rsp + 0x20], r14
0x4a267e: xor r9d, r9d
0x4a2681: lea r8, [rip + 0x5313f18]
0x4a2688: mov rdx, qword ptr [rbx + 0x10]
0x4a268c: lea rcx, [rsp + 0x70]
0x4a2691: call 0x1425c5230
0x4a2696: mov eax, dword ptr [rsp + 0x70]
0x4a269a: test eax, eax
0x4a269c: jne 0x1404a2717
0x4a269e: call 0x141416af0
0x4a26a3: add rax, 0x7d0
0x4a26a9: mov qword ptr [rbx + 0x98], rax
0x4a26b0: mov rcx, qword ptr [r14]
0x4a26b3: mov rdx, qword ptr [rbx + 0x28]
0x4a26b7: lea r14, [rip + 0x527f602]
0x4a26be: mov qword ptr [rsp + 0x30], r14
0x4a26c3: mov byte ptr [rsp + 0x38], 0
0x4a26c8: lea rbp, [rip + 0x527f591]
0x4a26cf: mov qword ptr [rsp + 0x30], rbp
0x4a26d4: mov rax, qword ptr [rcx]
0x4a26d7: mov qword ptr [rsp + 0x40], rax
0x4a26dc: mov eax, dword ptr [rcx + 0xc]
0x4a26df: mov dword ptr [rsp + 0x48], eax
0x4a26e3: mov dword ptr [rsp + 0x4c], 0
0x4a26eb: mov eax, dword ptr [rdx + rsi + 4]
0x4a26ef: mov dword ptr [rsp + 0x4c], eax
0x4a26f3: lea r9, [rsp + 0x30]
0x4a26f8: mov r8d, edi
0x4a26fb: lea rdx, [rsp + 0x70]
0x4a2700: mov rcx, rbx
0x4a2703: call 0x1404a6440
0x4a2708: nop 
0x4a2709: mov qword ptr [rsp + 0x30], rbp
0x4a270e: mov qword ptr [rsp + 0x30], r14
0x4a2713: mov eax, dword ptr [rsp + 0x70]
0x4a2717: mov rcx, qword ptr [rip + 0x683b9ea]
0x4a271e: test eax, eax
0x4a2720: je 0x1404a2727
0x4a2722: mov rax, rcx
0x4a2725: jmp 0x1404a272f
0x4a2727: mov rax, qword ptr [rbx + 0x58]
0x4a272b: mov rax, qword ptr [rsi + rax]
0x4a272f: test rax, rax
0x4a2732: je 0x1404a273d
0x4a2734: jmp 0x1404a2740
0x4a2736: mov rcx, qword ptr [rip + 0x683b9cb]
0x4a273d: mov rax, rcx
0x4a2740: mov rbx, qword ptr [rsp + 0x78]
0x4a2745: mov rbp, qword ptr [rsp + 0x80]
0x4a274d: add rsp, 0x50
0x4a2751: pop r14
0x4a2753: pop rdi
0x4a2754: pop rsi
0x4a2755: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x3d5f10
0x3d5f10: push rbx
0x3d5f12: sub rsp, 0x20
0x3d5f16: mov rbx, qword ptr [rcx]
0x3d5f19: mov eax, dword ptr [rbx + 0xc]
0x3d5f1c: cmp eax, -1
0x3d5f1f: jne 0x1403d5f68
0x3d5f21: mov rcx, qword ptr [rbx]
0x3d5f24: test rcx, rcx
0x3d5f27: je 0x1403d5f5c
0x3d5f29: cmp byte ptr [rcx], 0
0x3d5f2c: je 0x1403d5f5c
0x3d5f2e: mov eax, dword ptr [rbx + 8]
0x3d5f31: cmp eax, -1
0x3d5f34: jne 0x1403d5f5e
0x3d5f36: mov rax, 0xffffffffffffffff
0x3d5f3d: nop dword ptr [rax]
0x3d5f40: inc rax
0x3d5f43: cmp byte ptr [rcx + rax], 0
0x3d5f47: jne 0x1403d5f40
0x3d5f49: mov edx, eax
0x3d5f4b: mov dword ptr [rbx + 8], eax
0x3d5f4e: call 0x141364780
0x3d5f53: mov dword ptr [rbx + 0xc], eax
0x3d5f56: add rsp, 0x20
0x3d5f5a: pop rbx
0x3d5f5b: ret 
0x3d5f5c: xor eax, eax
0x3d5f5e: mov edx, eax
0x3d5f60: call 0x141364780
0x3d5f65: mov dword ptr [rbx + 0xc], eax
0x3d5f68: add rsp, 0x20
0x3d5f6c: pop rbx
0x3d5f6d: ret 
CALLEE 0xdec160
0xdec160: mov qword ptr [rsp + 8], rbx
0xdec165: mov qword ptr [rsp + 0x10], rsi
0xdec16a: mov qword ptr [rsp + 0x18], rdi
0xdec16f: mov word ptr [rsp + 0x20], r9w
0xdec175: push rbp
0xdec176: push r12
0xdec178: push r13
0xdec17a: push r14
0xdec17c: push r15
0xdec17e: lea rbp, [rsp - 0x60]
0xdec183: sub rsp, 0x160
0xdec18a: mov esi, r8d
0xdec18d: mov edi, dword ptr [rip + 0x5ee500d]
0xdec193: cmp edi, r8d
0xdec196: ja 0x140dec2f1
0xdec19c: lea ebx, [r8 + 1]
0xdec1a0: mov r15d, 1
0xdec1a6: mov eax, dword ptr [rip + 0x5ee4ff8]
0xdec1ac: cmp eax, ebx
0xdec1ae: jae 0x140dec1d3
0xdec1b0: lea edx, [rax*2 + 1]
0xdec1b7: add edx, eax
0xdec1b9: shr edx, 1
0xdec1bb: cmp edx, r15d
0xdec1be: cmovb edx, r15d
0xdec1c2: cmp ebx, edx
0xdec1c4: cmova edx, ebx
0xdec1c7: lea rcx, [rip + 0x5ee4fca]
0xdec1ce: call 0x1403d2af0
0xdec1d3: mov edx, ebx
0xdec1d5: lea rcx, [rip + 0x5ee4fbc]
0xdec1dc: call 0x140d280b0
0xdec1e1: xor r14d, r14d
0xdec1e4: mov qword ptr [rbp + 0x48], r14
0xdec1e8: mov qword ptr [rbp + 0x50], 0x105
0xdec1f0: mov dword ptr [rbp + 0x54], r14d
0xdec1f4: mov byte ptr [rsp + 0x40], r14b
0xdec1f9: mov dword ptr [rbp + 0x54], r14d
0xdec1fd: mov byte ptr [rsp + 0x40], r14b
0xdec202: mov rax, qword ptr [rbp + 0x48]
0xdec206: test rax, rax
0xdec209: je 0x140dec20e
0xdec20b: mov byte ptr [rax], r14b
0xdec20e: lea r12, [rip + 0x4789d5b]
0xdec215: mov eax, 2
0xdec21a: lea r13, [rip + 0x4935c7f]
0xdec221: mov qword ptr [rsp + 0x20], r12
0xdec226: mov byte ptr [rsp + 0x28], 0
0xdec22b: mov word ptr [rsp + 0x2a], ax
0xdec230: mov qword ptr [rsp + 0x20], r13
0xdec235: mov ebx, edi
0xdec237: mov qword ptr [rsp + 0x30], rbx
0xdec23c: mov word ptr [rsp + 0x38], 0x100
0xdec243: mov dword ptr [rbp + 0x54], 0xffffffff
0xdec24a: lea rcx, [rsp + 0x40]
0xdec24f: mov rax, qword ptr [rbp + 0x48]
0xdec253: test rax, rax
0xdec256: cmovne rcx, rax
0xdec25a: lea r9, [rsp + 0x20]
0xdec25f: lea r8, [rip + 0x4885eda]
0xdec266: mov edx, dword ptr [rbp + 0x50]
0xdec269: call 0x14064c020
0xdec26e: nop 
0xdec26f: mov qword ptr [rsp + 0x20], r12
0xdec274: lea rdx, [rsp + 0x40]
0xdec279: mov rax, qword ptr [rbp + 0x48]
0xdec27d: test rax, rax
0xdec280: cmovne rdx, rax
0xdec284: mov dword ptr [rbp + 0xa8], r14d
0xdec28b: mov r9d, 0x2ffff
0xdec291: mov r8d, r15d
0xdec294: lea rcx, [rbp + 0xa8]
0xdec29b: call 0x1412becb0
0xdec2a0: mov ecx, dword ptr [rbp + 0xa8]
0xdec2a6: mov rax, qword ptr [rip + 0x5ee4eeb]
0xdec2ad: mov dword ptr [rax + rbx*4], ecx
0xdec2b0: inc edi
0xdec2b2: cmp edi, esi
0xdec2b4: mov eax, 2
0xdec2b9: jbe 0x140dec221
0xdec2bf: mov rcx, qword ptr [rbp + 0x48]
0xdec2c3: test rcx, rcx
0xdec2c6: je 0x140dec2f1
0xdec2c8: mov r8d, 0x1fd
0xdec2ce: mov rax, qword ptr gs:[0x58]
0xdec2d7: mov rdx, qword ptr [rax]
0xdec2da: cmp byte ptr [r8 + rdx], 0
0xdec2df: je 0x140dec2e8
0xdec2e1: call 0x1447f03bc
0xdec2e6: jmp 0x140dec2ed
0xdec2e8: call 0x1447f02bc
0xdec2ed: mov qword ptr [rbp + 0x48], r14
0xdec2f1: lea r11, [rsp + 0x160]
0xdec2f9: mov rbx, qword ptr [r11 + 0x30]
0xdec2fd: mov rsi, qword ptr [r11 + 0x38]
0xdec301: mov rdi, qword ptr [r11 + 0x40]
0xdec305: mov rsp, r11
0xdec308: pop r15
0xdec30a: pop r14
0xdec30c: pop r13
0xdec30e: pop r12
0xdec310: pop rbp
0xdec311: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x1364780
0x1364780: mov qword ptr [rsp + 8], rbx
0x1364785: mov qword ptr [rsp + 0x10], rsi
0x136478a: mov qword ptr [rsp + 0x18], rdi
0x136478f: lea ebx, [rdx - 0x2145e233]
0x1364795: mov rdi, rdx
0x1364798: mov r9d, ebx
0x136479b: mov r11d, ebx
0x136479e: test cl, 3
0x13647a1: jne 0x141364909
0x13647a7: cmp rdx, 0xc
0x13647ab: jbe 0x14136485e
0x13647b1: lea r8, [rdx - 0xd]
0x13647b5: movabs rax, 0xaaaaaaaaaaaaaaab
0x13647bf: mul r8
0x13647c2: mov rsi, rdx
0x13647c5: shr rsi, 3
0x13647c9: inc rsi
0x13647cc: imul rax, rsi, -0xc
0x13647d0: add rdi, rax
0x13647d3: nop dword ptr [rax]
0x13647d7: nop word ptr [rax + rax]
0x13647e0: mov r8d, dword ptr [rcx + 8]
0x13647e4: mov r10d, dword ptr [rcx + 4]
0x13647e8: add r8d, ebx
0x13647eb: add r10d, r9d
0x13647ee: sub r11d, r8d
0x13647f1: add r11d, dword ptr [rcx]
0x13647f4: mov r9d, r8d
0x13647f7: ror r9d, 0x1c
0x13647fb: add rcx, 0xc
0x13647ff: xor r9d, r11d
0x1364802: lea eax, [r10 + r8]
0x1364806: sub r10d, r9d
0x1364809: mov r8d, r9d
0x136480c: ror r8d, 0x1a
0x1364810: lea edx, [rax + r9]
0x1364814: xor r8d, r10d
0x1364817: sub eax, r8d
0x136481a: mov r9d, r8d
0x136481d: ror r9d, 0x18
0x1364821: xor r9d, eax
0x1364824: lea eax, [rdx + r8]
0x1364828: sub edx, r9d
0x136482b: mov r8d, r9d
0x136482e: ror r8d, 0x10
0x1364832: xor r8d, edx
0x1364835: lea edx, [rax + r9]
0x1364839: sub eax, r8d
0x136483c: mov r9d, r8d
0x136483f: ror r9d, 0xd
0x1364843: xor r9d, eax
0x1364846: mov ebx, r9d
0x1364849: lea r11d, [r8 + rdx]
0x136484d: sub edx, r9d
0x1364850: ror ebx, 0x1c
0x1364853: xor ebx, edx
0x1364855: add r9d, r11d
0x1364858: sub rsi, 1
0x136485c: jne 0x1413647e0
0x136485e: lea rdx, [rip - 0x1364865]
0x1364865: mov eax, dword ptr [rdx + rdi*4 + 0x1364c68]
0x136486c: add rax, rdx
0x136486f: jmp rax
0x1364871: add ebx, dword ptr [rcx + 8]
0x1364874: add r9d, dword ptr [rcx + 4]
0x1364878: add r11d, dword ptr [rcx]
0x136487b: jmp 0x141364c01
0x1364880: mov eax, dword ptr [rcx + 8]
0x1364883: add r9d, dword ptr [rcx + 4]
0x1364887: and eax, 0xffffff
0x136488c: add ebx, eax
0x136488e: add r11d, dword ptr [rcx]
0x1364891: jmp 0x141364c01
0x1364896: movzx eax, word ptr [rcx + 8]
0x136489a: add r9d, dword ptr [rcx + 4]
0x136489e: add ebx, eax
0x13648a0: add r11d, dword ptr [rcx]
0x13648a3: jmp 0x141364c01
0x13648a8: movzx eax, byte ptr [rcx + 8]
0x13648ac: add r9d, dword ptr [rcx + 4]
0x13648b0: add ebx, eax
0x13648b2: add r11d, dword ptr [rcx]
0x13648b5: jmp 0x141364c01
0x13648ba: mov eax, dword ptr [rcx + 4]
0x13648bd: and eax, 0xffffff
0x13648c2: add r9d, eax
0x13648c5: add r11d, dword ptr [rcx]
0x13648c8: jmp 0x141364c01
0x13648cd: movzx eax, word ptr [rcx + 4]
0x13648d1: add r9d, eax
0x13648d4: add r11d, dword ptr [rcx]
0x13648d7: jmp 0x141364c01
0x13648dc: movzx eax, byte ptr [rcx + 4]
0x13648e0: add r9d, eax
0x13648e3: add r11d, dword ptr [rcx]
0x13648e6: jmp 0x141364c01
0x13648eb: mov eax, dword ptr [rcx]
0x13648ed: and eax, 0xffffff
0x13648f2: jmp 0x141364bfe
0x13648f7: mov eax, ebx
0x13648f9: mov rbx, qword ptr [rsp + 8]
0x13648fe: mov rsi, qword ptr [rsp + 0x10]
0x1364903: mov rdi, qword ptr [rsp + 0x18]
0x1364908: ret 
0x1364909: test cl, 1
0x136490c: jne 0x141364a72
0x1364912: cmp rdi, 0xc
0x1364916: jbe 0x1413649e3
0x136491c: add rdx, -0xd
0x1364920: movabs rax, 0xaaaaaaaaaaaaaaab
0x136492a: mul rdx
0x136492d: mov rsi, rdx
0x1364930: shr rsi, 3
0x1364934: inc rsi
0x1364937: imul rax, rsi, -0xc
0x136493b: add rdi, rax
0x136493e: nop 
0x1364940: movzx eax, word ptr [rcx + 6]
0x1364944: movzx r10d, word ptr [rcx + 4]
0x1364949: movzx r8d, word ptr [rcx + 8]
0x136494e: movzx edx, word ptr [rcx]
0x1364951: shl eax, 0x10
0x1364954: add eax, r9d
0x1364957: add r10d, eax
0x136495a: movzx eax, word ptr [rcx + 0xa]
0x136495e: shl eax, 0x10
0x1364961: add eax, ebx
0x1364963: add r8d, eax
0x1364966: movzx eax, word ptr [rcx + 2]
0x136496a: shl eax, 0x10
0x136496d: mov r9d, r8d
0x1364970: sub eax, r8d
0x1364973: ror r9d, 0x1c
0x1364977: add eax, r11d
0x136497a: add rcx, 0xc
0x136497e: add edx, eax
0x1364980: lea eax, [r10 + r8]
0x1364984: xor r9d, edx
0x1364987: sub r10d, r9d
0x136498a: mov r8d, r9d
0x136498d: ror r8d, 0x1a
0x1364991: xor r8d, r10d
0x1364994: lea edx, [r9 + rax]
0x1364998: sub eax, r8d
0x136499b: mov r9d, r8d
0x136499e: ror r9d, 0x18
0x13649a2: xor r9d, eax
0x13649a5: lea eax, [rdx + r8]
0x13649a9: sub edx, r9d
0x13649ac: mov r8d, r9d
0x13649af: ror r8d, 0x10
0x13649b3: xor r8d, edx
0x13649b6: lea edx, [r9 + rax]
0x13649ba: sub eax, r8d
0x13649bd: mov r9d, r8d
0x13649c0: ror r9d, 0xd
0x13649c4: xor r9d, eax
0x13649c7: lea r11d, [r8 + rdx]
0x13649cb: sub edx, r9d
0x13649ce: mov ebx, r9d
0x13649d1: ror ebx, 0x1c
0x13649d4: add r9d, r11d
0x13649d7: xor ebx, edx
0x13649d9: sub rsi, 1
0x13649dd: jne 0x141364940
0x13649e3: lea rdx, [rip - 0x13649ea]
0x13649ea: mov eax, dword ptr [rdx + rdi*4 + 0x1364c9c]
0x13649f1: add rax, rdx
0x13649f4: jmp rax
0x13649f6: movzx edx, word ptr [rcx + 0xa]
0x13649fa: movzx eax, word ptr [rcx + 8]
0x13649fe: shl edx, 0x10
0x1364a01: add ebx, eax
0x1364a03: add ebx, edx
0x1364a05: movzx edx, word ptr [rcx + 6]
0x1364a09: movzx eax, word ptr [rcx + 4]
0x1364a0d: shl edx, 0x10
0x1364a10: add r9d, eax
0x1364a13: add r9d, edx
0x1364a16: movzx edx, word ptr [rcx + 2]
0x1364a1a: movzx eax, word ptr [rcx]
0x1364a1d: shl edx, 0x10
0x1364a20: add r11d, eax
0x1364a23: add r11d, edx
0x1364a26: jmp 0x141364c01
0x1364a2b: movzx eax, byte ptr [rcx + 0xa]
0x1364a2f: shl eax, 0x10
0x1364a32: add ebx, eax
0x1364a34: movzx eax, word ptr [rcx + 8]
0x1364a38: add ebx, eax
0x1364a3a: jmp 0x141364a05
0x1364a3c: movzx eax, byte ptr [rcx + 8]
0x1364a40: add ebx, eax
0x1364a42: jmp 0x141364a05
0x1364a44: movzx eax, byte ptr [rcx + 6]
0x1364a48: shl eax, 0x10
0x1364a4b: add r9d, eax
0x1364a4e: movzx eax, word ptr [rcx + 4]
0x1364a52: add r9d, eax
0x1364a55: jmp 0x141364a16
0x1364a57: movzx eax, byte ptr [rcx + 4]
0x1364a5b: add r9d, eax
0x1364a5e: jmp 0x141364a16
0x1364a60: movzx eax, byte ptr [rcx + 2]
0x1364a64: shl eax, 0x10
0x1364a67: add r11d, eax
0x1364a6a: movzx eax, word ptr [rcx]
0x1364a6d: jmp 0x141364bfe
0x1364a72: cmp rdi, 0xc
0x1364a76: jbe 0x141364b84
0x1364a7c: add rdx, -0xd
0x1364a80: movabs rax, 0xaaaaaaaaaaaaaaab
0x1364a8a: mul rdx
0x1364a8d: mov rsi, rdx
0x1364a90: shr rsi, 3
0x1364a94: inc rsi
0x1364a97: imul rax, rsi, -0xc
0x1364a9b: add rdi, rax
0x1364a9e: nop 
0x1364aa0: movzx eax, byte ptr [rcx + 6]
0x1364aa4: movzx edx, byte ptr [rcx + 8]
0x1364aa8: movzx r8d, byte ptr [rcx + 7]
0x1364aad: movzx r10d, byte ptr [rcx + 4]
0x1364ab2: shl r8d, 8
0x1364ab6: add r8d, eax
0x1364ab9: movzx eax, byte ptr [rcx + 5]
0x1364abd: shl r8d, 8
0x1364ac1: add eax, r8d
0x1364ac4: movzx r8d, byte ptr [rcx + 0xb]
0x1364ac9: shl r8d, 8
0x1364acd: shl eax, 8
0x1364ad0: add eax, r9d
0x1364ad3: add r10d, eax
0x1364ad6: movzx eax, byte ptr [rcx + 0xa]
0x1364ada: add r8d, eax
0x1364add: movzx eax, byte ptr [rcx + 9]
0x1364ae1: shl r8d, 8
0x1364ae5: add r8d, eax
0x1364ae8: movzx eax, byte ptr [rcx + 2]
0x1364aec: shl r8d, 8
0x1364af0: add r8d, ebx
0x1364af3: add r8d, edx
0x1364af6: movzx edx, byte ptr [rcx + 3]
0x1364afa: shl edx, 8
0x1364afd: mov r9d, r8d
0x1364b00: add edx, eax
0x1364b02: ror r9d, 0x1c
0x1364b06: movzx eax, byte ptr [rcx + 1]
0x1364b0a: shl edx, 8
0x1364b0d: add edx, eax
0x1364b0f: movzx eax, byte ptr [rcx]
0x1364b12: shl edx, 8
0x1364b15: add rcx, 0xc
0x1364b19: add edx, eax
0x1364b1b: lea eax, [r8 + r10]
0x1364b1f: sub edx, r8d
0x1364b22: add edx, r11d
0x1364b25: xor r9d, edx
0x1364b28: sub r10d, r9d
0x1364b2b: mov r8d, r9d
0x1364b2e: ror r8d, 0x1a
0x1364b32: xor r8d, r10d
0x1364b35: lea edx, [r9 + rax]
0x1364b39: sub eax, r8d
0x1364b3c: mov r9d, r8d
0x1364b3f: ror r9d, 0x18
0x1364b43: xor r9d, eax
0x1364b46: lea eax, [rdx + r8]
0x1364b4a: sub edx, r9d
0x1364b4d: mov r8d, r9d
0x1364b50: ror r8d, 0x10
0x1364b54: xor r8d, edx
0x1364b57: lea edx, [r9 + rax]
0x1364b5b: sub eax, r8d
0x1364b5e: mov r9d, r8d
0x1364b61: ror r9d, 0xd
0x1364b65: xor r9d, eax
0x1364b68: lea r11d, [r8 + rdx]
0x1364b6c: sub edx, r9d
0x1364b6f: mov ebx, r9d
0x1364b72: ror ebx, 0x1c
0x1364b75: add r9d, r11d
0x1364b78: xor ebx, edx
0x1364b7a: sub rsi, 1
0x1364b7e: jne 0x141364aa0
0x1364b84: lea rdx, [rip - 0x1364b8b]
0x1364b8b: mov eax, dword ptr [rdx + rdi*4 + 0x1364cd0]
0x1364b92: add rax, rdx
0x1364b95: jmp rax
0x1364b97: movzx eax, byte ptr [rcx + 0xb]
0x1364b9b: shl eax, 0x18
0x1364b9e: add ebx, eax
0x1364ba0: movzx eax, byte ptr [rcx + 0xa]
0x1364ba4: shl eax, 0x10
0x1364ba7: add ebx, eax
0x1364ba9: movzx eax, byte ptr [rcx + 9]
0x1364bad: shl eax, 8
0x1364bb0: add ebx, eax
0x1364bb2: movzx eax, byte ptr [rcx + 8]
0x1364bb6: add ebx, eax
0x1364bb8: movzx eax, byte ptr [rcx + 7]
0x1364bbc: shl eax, 0x18
0x1364bbf: add r9d, eax
0x1364bc2: movzx eax, byte ptr [rcx + 6]
0x1364bc6: shl eax, 0x10
0x1364bc9: add r9d, eax
0x1364bcc: movzx eax, byte ptr [rcx + 5]
0x1364bd0: shl eax, 8
0x1364bd3: add r9d, eax
0x1364bd6: movzx eax, byte ptr [rcx + 4]
0x1364bda: add r9d, eax
0x1364bdd: movzx eax, byte ptr [rcx + 3]
0x1364be1: shl eax, 0x18
0x1364be4: add r11d, eax
0x1364be7: movzx eax, byte ptr [rcx + 2]
0x1364beb: shl eax, 0x10
0x1364bee: add r11d, eax
0x1364bf1: movzx eax, byte ptr [rcx + 1]
0x1364bf5: shl eax, 8
0x1364bf8: add r11d, eax
0x1364bfb: movzx eax, byte ptr [rcx]
0x1364bfe: add r11d, eax
0x1364c01: mov rsi, qword ptr [rsp + 0x10]
0x1364c06: xor ebx, r9d
0x1364c09: mov rdi, qword ptr [rsp + 0x18]
0x1364c0e: mov eax, r9d
0x1364c11: ror eax, 0x12
0x1364c14: sub ebx, eax
0x1364c16: mov eax, ebx
0x1364c18: mov ecx, ebx
0x1364c1a: ror eax, 0x15
0x1364c1d: xor ecx, r11d
0x1364c20: sub ecx, eax
0x1364c22: mov eax, ecx
0x1364c24: mov r8d, ecx
0x1364c27: ror eax, 7
0x1364c2a: xor r8d, r9d
0x1364c2d: sub r8d, eax
0x1364c30: mov eax, r8d
0x1364c33: mov r9d, r8d
0x1364c36: ror eax, 0x10
0x1364c39: xor r9d, ebx
0x1364c3c: mov rbx, qword ptr [rsp + 8]
0x1364c41: sub r9d, eax
0x1364c44: mov eax, r9d
0x1364c47: mov edx, r9d
0x1364c4a: xor edx, ecx
0x1364c4c: ror eax, 0x1c
0x1364c4f: sub edx, eax
0x1364c51: mov ecx, edx
0x1364c53: xor edx, r8d
0x1364c56: ror ecx, 0x12
0x1364c59: sub edx, ecx
0x1364c5b: mov ecx, edx
0x1364c5d: xor edx, r9d
0x1364c60: ror ecx, 8
0x1364c63: sub edx, ecx
0x1364c65: mov eax, edx
0x1364c67: ret 
0x1364c68: test dword ptr [rax + 0x36], 0x364bfb01
0x1364c6f: add dword ptr [rdx + 0x4a], ebp
0x1364c72: add ebx, ebp
0x1364c75: add dword ptr ss:[rax + 0x48], edi
0x1364c7a: add esp, ebx
0x1364c7d: add ebp, ecx
0x1364c81: add dword ptr ss:[rdx + 0x74013648], edi
0x1364c89: add dword ptr ss:[rax - 0x69fec9b8], ebp
0x1364c91: add dword ptr ss:[rax + 0x71013648], eax
0x1364c99: add edi, esi
0x1364c9d: add ebx, edi
0x1364ca1: add dword ptr ss:[rdx + 0x4a], ebp
0x1364ca6: add dword ptr ss:[rax + 0x4a], esp
0x1364caa: add dword ptr ss:[rsi], edx
0x1364cad: add dword ptr ss:[rdi + 0x4a], edx
0x1364cb2: add dword ptr ss:[rsi + 0x4a], ecx
0x1364cb6: add dword ptr ss:[rdx + rcx*2 + 0x36], eax
0x1364cbb: add dword ptr [rip + 0x3c01364a], eax
0x1364cc1: add dword ptr ss:[rdx + rcx*2], esi
0x1364cc6: add dword ptr ss:[rbx], ebp
0x1364cc9: add esi, esi
0x1364ccd: add edi, esi
0x1364cd1: add ebx, edi
0x1364cd5: add ecx, esi
0x1364cd9: add edi, esp
0x1364cdd: add ebp, ebx
0x1364ce1: add esi, edx
0x1364ce5: add esp, ecx
0x1364ce9: add edx, eax
0x1364ced: add dword ptr ss:[rax - 0x4dfec9b5], edi
0x1364cf5: add dword ptr ss:[rcx - 0x5ffec9b5], ebp
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x430150
0x430150: mov qword ptr [rsp + 0x10], rbx
0x430155: mov qword ptr [rsp + 0x18], rbp
0x43015a: push rsi
0x43015b: push rdi
0x43015c: push r14
0x43015e: sub rsp, 0x50
0x430162: movzx edi, word ptr [rcx]
0x430165: mov rbx, qword ptr [rip + 0x6939924]
0x43016c: cmp edi, dword ptr [rbx + 8]
0x43016f: jae 0x140430258
0x430175: lea rsi, [rdi*8]
0x43017d: mov rax, qword ptr [rbx + 0x58]
0x430181: mov rax, qword ptr [rsi + rax]
0x430185: test rax, rax
0x430188: jne 0x140430262
0x43018e: lea r14, [rbx + 0x90]
0x430195: cmp qword ptr [r14], rax
0x430198: jne 0x1404301bf
0x43019a: mov qword ptr [rsp + 0x20], r14
0x43019f: xor r9d, r9d
0x4301a2: mov r8, qword ptr [rip + 0x566a9c7]
0x4301a9: mov rdx, qword ptr [rbx + 0x10]
0x4301ad: lea rcx, [rsp + 0x70]
0x4301b2: call 0x1425c5230
0x4301b7: mov eax, dword ptr [rsp + 0x70]
0x4301bb: test eax, eax
0x4301bd: jne 0x140430239
0x4301bf: call 0x141416af0
0x4301c4: add rax, 0x7d0
0x4301ca: mov qword ptr [rbx + 0x98], rax
0x4301d1: mov rcx, qword ptr [r14]
0x4301d4: mov rdx, qword ptr [rbx + 0x28]
0x4301d8: lea r14, [rip + 0x52f1ae1]
0x4301df: mov qword ptr [rsp + 0x30], r14
0x4301e4: mov byte ptr [rsp + 0x38], 0
0x4301e9: lea rbp, [rip + 0x52f1a70]
0x4301f0: mov qword ptr [rsp + 0x30], rbp
0x4301f5: mov rax, qword ptr [rcx]
0x4301f8: mov qword ptr [rsp + 0x40], rax
0x4301fd: mov eax, dword ptr [rcx + 0xc]
0x430200: mov dword ptr [rsp + 0x48], eax
0x430204: mov dword ptr [rsp + 0x4c], 0
0x43020c: mov eax, dword ptr [rdx + rsi + 4]
0x430210: mov dword ptr [rsp + 0x4c], eax
0x430214: lea r9, [rsp + 0x30]
0x430219: movzx r8d, di
0x43021d: lea rdx, [rsp + 0x70]
0x430222: mov rcx, rbx
0x430225: call 0x140434220
0x43022a: nop 
0x43022b: mov qword ptr [rsp + 0x30], rbp
0x430230: mov qword ptr [rsp + 0x30], r14
0x430235: mov eax, dword ptr [rsp + 0x70]
0x430239: mov rcx, qword ptr [rip + 0x68add48]
0x430240: test eax, eax
0x430242: je 0x140430249
0x430244: mov rax, rcx
0x430247: jmp 0x140430251
0x430249: mov rax, qword ptr [rbx + 0x58]
0x43024d: mov rax, qword ptr [rsi + rax]
0x430251: test rax, rax
0x430254: je 0x14043025f
0x430256: jmp 0x140430262
0x430258: mov rcx, qword ptr [rip + 0x68add29]
0x43025f: mov rax, rcx
0x430262: mov rbx, qword ptr [rsp + 0x78]
0x430267: mov rbp, qword ptr [rsp + 0x80]
0x43026f: add rsp, 0x50
0x430273: pop r14
0x430275: pop rdi
0x430276: pop rsi
0x430277: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x430150
0x430150: mov qword ptr [rsp + 0x10], rbx
0x430155: mov qword ptr [rsp + 0x18], rbp
0x43015a: push rsi
0x43015b: push rdi
0x43015c: push r14
0x43015e: sub rsp, 0x50
0x430162: movzx edi, word ptr [rcx]
0x430165: mov rbx, qword ptr [rip + 0x6939924]
0x43016c: cmp edi, dword ptr [rbx + 8]
0x43016f: jae 0x140430258
0x430175: lea rsi, [rdi*8]
0x43017d: mov rax, qword ptr [rbx + 0x58]
0x430181: mov rax, qword ptr [rsi + rax]
0x430185: test rax, rax
0x430188: jne 0x140430262
0x43018e: lea r14, [rbx + 0x90]
0x430195: cmp qword ptr [r14], rax
0x430198: jne 0x1404301bf
0x43019a: mov qword ptr [rsp + 0x20], r14
0x43019f: xor r9d, r9d
0x4301a2: mov r8, qword ptr [rip + 0x566a9c7]
0x4301a9: mov rdx, qword ptr [rbx + 0x10]
0x4301ad: lea rcx, [rsp + 0x70]
0x4301b2: call 0x1425c5230
0x4301b7: mov eax, dword ptr [rsp + 0x70]
0x4301bb: test eax, eax
0x4301bd: jne 0x140430239
0x4301bf: call 0x141416af0
0x4301c4: add rax, 0x7d0
0x4301ca: mov qword ptr [rbx + 0x98], rax
0x4301d1: mov rcx, qword ptr [r14]
0x4301d4: mov rdx, qword ptr [rbx + 0x28]
0x4301d8: lea r14, [rip + 0x52f1ae1]
0x4301df: mov qword ptr [rsp + 0x30], r14
0x4301e4: mov byte ptr [rsp + 0x38], 0
0x4301e9: lea rbp, [rip + 0x52f1a70]
0x4301f0: mov qword ptr [rsp + 0x30], rbp
0x4301f5: mov rax, qword ptr [rcx]
0x4301f8: mov qword ptr [rsp + 0x40], rax
0x4301fd: mov eax, dword ptr [rcx + 0xc]
0x430200: mov dword ptr [rsp + 0x48], eax
0x430204: mov dword ptr [rsp + 0x4c], 0
0x43020c: mov eax, dword ptr [rdx + rsi + 4]
0x430210: mov dword ptr [rsp + 0x4c], eax
0x430214: lea r9, [rsp + 0x30]
0x430219: movzx r8d, di
0x43021d: lea rdx, [rsp + 0x70]
0x430222: mov rcx, rbx
0x430225: call 0x140434220
0x43022a: nop 
0x43022b: mov qword ptr [rsp + 0x30], rbp
0x430230: mov qword ptr [rsp + 0x30], r14
0x430235: mov eax, dword ptr [rsp + 0x70]
0x430239: mov rcx, qword ptr [rip + 0x68add48]
0x430240: test eax, eax
0x430242: je 0x140430249
0x430244: mov rax, rcx
0x430247: jmp 0x140430251
0x430249: mov rax, qword ptr [rbx + 0x58]
0x43024d: mov rax, qword ptr [rsi + rax]
0x430251: test rax, rax
0x430254: je 0x14043025f
0x430256: jmp 0x140430262
0x430258: mov rcx, qword ptr [rip + 0x68add29]
0x43025f: mov rax, rcx
0x430262: mov rbx, qword ptr [rsp + 0x78]
0x430267: mov rbp, qword ptr [rsp + 0x80]
0x43026f: add rsp, 0x50
0x430273: pop r14
0x430275: pop rdi
0x430276: pop rsi
0x430277: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x430280
0x430280: mov qword ptr [rsp + 0x10], rbx
0x430285: mov qword ptr [rsp + 0x18], rbp
0x43028a: push rsi
0x43028b: push rdi
0x43028c: push r14
0x43028e: sub rsp, 0x50
0x430292: movzx edi, word ptr [rcx]
0x430295: mov rbx, qword ptr [rip + 0x693bbdc]
0x43029c: cmp edi, dword ptr [rbx + 8]
0x43029f: jae 0x140430388
0x4302a5: lea rsi, [rdi*8]
0x4302ad: mov rax, qword ptr [rbx + 0x58]
0x4302b1: mov rax, qword ptr [rsi + rax]
0x4302b5: test rax, rax
0x4302b8: jne 0x140430392
0x4302be: lea r14, [rbx + 0x90]
0x4302c5: cmp qword ptr [r14], rax
0x4302c8: jne 0x1404302ef
0x4302ca: mov qword ptr [rsp + 0x20], r14
0x4302cf: xor r9d, r9d
0x4302d2: lea r8, [rip + 0x51448a7]
0x4302d9: mov rdx, qword ptr [rbx + 0x10]
0x4302dd: lea rcx, [rsp + 0x70]
0x4302e2: call 0x1425c5230
0x4302e7: mov eax, dword ptr [rsp + 0x70]
0x4302eb: test eax, eax
0x4302ed: jne 0x140430369
0x4302ef: call 0x141416af0
0x4302f4: add rax, 0x7d0
0x4302fa: mov qword ptr [rbx + 0x98], rax
0x430301: mov rcx, qword ptr [r14]
0x430304: mov rdx, qword ptr [rbx + 0x28]
0x430308: lea r14, [rip + 0x52f19b1]
0x43030f: mov qword ptr [rsp + 0x30], r14
0x430314: mov byte ptr [rsp + 0x38], 0
0x430319: lea rbp, [rip + 0x52f1940]
0x430320: mov qword ptr [rsp + 0x30], rbp
0x430325: mov rax, qword ptr [rcx]
0x430328: mov qword ptr [rsp + 0x40], rax
0x43032d: mov eax, dword ptr [rcx + 0xc]
0x430330: mov dword ptr [rsp + 0x48], eax
0x430334: mov dword ptr [rsp + 0x4c], 0
0x43033c: mov eax, dword ptr [rdx + rsi + 4]
0x430340: mov dword ptr [rsp + 0x4c], eax
0x430344: lea r9, [rsp + 0x30]
0x430349: movzx r8d, di
0x43034d: lea rdx, [rsp + 0x70]
0x430352: mov rcx, rbx
0x430355: call 0x1404344e0
0x43035a: nop 
0x43035b: mov qword ptr [rsp + 0x30], rbp
0x430360: mov qword ptr [rsp + 0x30], r14
0x430365: mov eax, dword ptr [rsp + 0x70]
0x430369: mov rcx, qword ptr [rip + 0x68ae080]
0x430370: test eax, eax
0x430372: je 0x140430379
0x430374: mov rax, rcx
0x430377: jmp 0x140430381
0x430379: mov rax, qword ptr [rbx + 0x58]
0x43037d: mov rax, qword ptr [rsi + rax]
0x430381: test rax, rax
0x430384: je 0x14043038f
0x430386: jmp 0x140430392
0x430388: mov rcx, qword ptr [rip + 0x68ae061]
0x43038f: mov rax, rcx
0x430392: mov rbx, qword ptr [rsp + 0x78]
0x430397: mov rbp, qword ptr [rsp + 0x80]
0x43039f: add rsp, 0x50
0x4303a3: pop r14
0x4303a5: pop rdi
0x4303a6: pop rsi
0x4303a7: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x5d2070
0x5d2070: mov qword ptr [rsp + 0x10], rbx
0x5d2075: mov qword ptr [rsp + 0x18], rbp
0x5d207a: push rsi
0x5d207b: push rdi
0x5d207c: push r14
0x5d207e: sub rsp, 0x50
0x5d2082: movzx edi, word ptr [rcx]
0x5d2085: mov rbx, qword ptr [rip + 0x679d4e4]
0x5d208c: cmp edi, dword ptr [rbx + 8]
0x5d208f: jae 0x1405d2178
0x5d2095: lea rsi, [rdi*8]
0x5d209d: mov rax, qword ptr [rbx + 0x58]
0x5d20a1: mov rax, qword ptr [rsi + rax]
0x5d20a5: test rax, rax
0x5d20a8: jne 0x1405d2182
0x5d20ae: lea r14, [rbx + 0x90]
0x5d20b5: cmp qword ptr [r14], rax
0x5d20b8: jne 0x1405d20df
0x5d20ba: mov qword ptr [rsp + 0x20], r14
0x5d20bf: xor r9d, r9d
0x5d20c2: lea r8, [rip + 0x53b116f]
0x5d20c9: mov rdx, qword ptr [rbx + 0x10]
0x5d20cd: lea rcx, [rsp + 0x70]
0x5d20d2: call 0x1425c5230
0x5d20d7: mov eax, dword ptr [rsp + 0x70]
0x5d20db: test eax, eax
0x5d20dd: jne 0x1405d2159
0x5d20df: call 0x141416af0
0x5d20e4: add rax, 0x7d0
0x5d20ea: mov qword ptr [rbx + 0x98], rax
0x5d20f1: mov rcx, qword ptr [r14]
0x5d20f4: mov rdx, qword ptr [rbx + 0x28]
0x5d20f8: lea r14, [rip + 0x514fbc1]
0x5d20ff: mov qword ptr [rsp + 0x30], r14
0x5d2104: mov byte ptr [rsp + 0x38], 0
0x5d2109: lea rbp, [rip + 0x514fb50]
0x5d2110: mov qword ptr [rsp + 0x30], rbp
0x5d2115: mov rax, qword ptr [rcx]
0x5d2118: mov qword ptr [rsp + 0x40], rax
0x5d211d: mov eax, dword ptr [rcx + 0xc]
0x5d2120: mov dword ptr [rsp + 0x48], eax
0x5d2124: mov dword ptr [rsp + 0x4c], 0
0x5d212c: mov eax, dword ptr [rdx + rsi + 4]
0x5d2130: mov dword ptr [rsp + 0x4c], eax
0x5d2134: lea r9, [rsp + 0x30]
0x5d2139: movzx r8d, di
0x5d213d: lea rdx, [rsp + 0x70]
0x5d2142: mov rcx, rbx
0x5d2145: call 0x1405d4ae0
0x5d214a: nop 
0x5d214b: mov qword ptr [rsp + 0x30], rbp
0x5d2150: mov qword ptr [rsp + 0x30], r14
0x5d2155: mov eax, dword ptr [rsp + 0x70]
0x5d2159: mov rcx, qword ptr [rip + 0x6729260]
0x5d2160: test eax, eax
0x5d2162: je 0x1405d2169
0x5d2164: mov rax, rcx
0x5d2167: jmp 0x1405d2171
0x5d2169: mov rax, qword ptr [rbx + 0x58]
0x5d216d: mov rax, qword ptr [rsi + rax]
0x5d2171: test rax, rax
0x5d2174: je 0x1405d217f
0x5d2176: jmp 0x1405d2182
0x5d2178: mov rcx, qword ptr [rip + 0x6729241]
0x5d217f: mov rax, rcx
0x5d2182: mov rbx, qword ptr [rsp + 0x78]
0x5d2187: mov rbp, qword ptr [rsp + 0x80]
0x5d218f: add rsp, 0x50
0x5d2193: pop r14
0x5d2195: pop rdi
0x5d2196: pop rsi
0x5d2197: ret 
CALLEE 0x430280
0x430280: mov qword ptr [rsp + 0x10], rbx
0x430285: mov qword ptr [rsp + 0x18], rbp
0x43028a: push rsi
0x43028b: push rdi
0x43028c: push r14
0x43028e: sub rsp, 0x50
0x430292: movzx edi, word ptr [rcx]
0x430295: mov rbx, qword ptr [rip + 0x693bbdc]
0x43029c: cmp edi, dword ptr [rbx + 8]
0x43029f: jae 0x140430388
0x4302a5: lea rsi, [rdi*8]
0x4302ad: mov rax, qword ptr [rbx + 0x58]
0x4302b1: mov rax, qword ptr [rsi + rax]
0x4302b5: test rax, rax
0x4302b8: jne 0x140430392
0x4302be: lea r14, [rbx + 0x90]
0x4302c5: cmp qword ptr [r14], rax
0x4302c8: jne 0x1404302ef
0x4302ca: mov qword ptr [rsp + 0x20], r14
0x4302cf: xor r9d, r9d
0x4302d2: lea r8, [rip + 0x51448a7]
0x4302d9: mov rdx, qword ptr [rbx + 0x10]
0x4302dd: lea rcx, [rsp + 0x70]
0x4302e2: call 0x1425c5230
0x4302e7: mov eax, dword ptr [rsp + 0x70]
0x4302eb: test eax, eax
0x4302ed: jne 0x140430369
0x4302ef: call 0x141416af0
0x4302f4: add rax, 0x7d0
0x4302fa: mov qword ptr [rbx + 0x98], rax
0x430301: mov rcx, qword ptr [r14]
0x430304: mov rdx, qword ptr [rbx + 0x28]
0x430308: lea r14, [rip + 0x52f19b1]
0x43030f: mov qword ptr [rsp + 0x30], r14
0x430314: mov byte ptr [rsp + 0x38], 0
0x430319: lea rbp, [rip + 0x52f1940]
0x430320: mov qword ptr [rsp + 0x30], rbp
0x430325: mov rax, qword ptr [rcx]
0x430328: mov qword ptr [rsp + 0x40], rax
0x43032d: mov eax, dword ptr [rcx + 0xc]
0x430330: mov dword ptr [rsp + 0x48], eax
0x430334: mov dword ptr [rsp + 0x4c], 0
0x43033c: mov eax, dword ptr [rdx + rsi + 4]
0x430340: mov dword ptr [rsp + 0x4c], eax
0x430344: lea r9, [rsp + 0x30]
0x430349: movzx r8d, di
0x43034d: lea rdx, [rsp + 0x70]
0x430352: mov rcx, rbx
0x430355: call 0x1404344e0
0x43035a: nop 
0x43035b: mov qword ptr [rsp + 0x30], rbp
0x430360: mov qword ptr [rsp + 0x30], r14
0x430365: mov eax, dword ptr [rsp + 0x70]
0x430369: mov rcx, qword ptr [rip + 0x68ae080]
0x430370: test eax, eax
0x430372: je 0x140430379
0x430374: mov rax, rcx
0x430377: jmp 0x140430381
0x430379: mov rax, qword ptr [rbx + 0x58]
0x43037d: mov rax, qword ptr [rsi + rax]
0x430381: test rax, rax
0x430384: je 0x14043038f
0x430386: jmp 0x140430392
0x430388: mov rcx, qword ptr [rip + 0x68ae061]
0x43038f: mov rax, rcx
0x430392: mov rbx, qword ptr [rsp + 0x78]
0x430397: mov rbp, qword ptr [rsp + 0x80]
0x43039f: add rsp, 0x50
0x4303a3: pop r14
0x4303a5: pop rdi
0x4303a6: pop rsi
0x4303a7: ret 
CALLEE 0x5c15a0
0x5c15a0: mov qword ptr [rsp + 0x10], rbx
0x5c15a5: mov qword ptr [rsp + 0x18], rbp
0x5c15aa: push rsi
0x5c15ab: push rdi
0x5c15ac: push r14
0x5c15ae: sub rsp, 0x50
0x5c15b2: mov edi, dword ptr [rcx]
0x5c15b4: mov rbx, qword ptr [rip + 0x67ade45]
0x5c15bb: cmp edi, dword ptr [rbx + 8]
0x5c15be: jae 0x1405c16a6
0x5c15c4: lea rsi, [rdi*8]
0x5c15cc: mov rax, qword ptr [rbx + 0x58]
0x5c15d0: mov rax, qword ptr [rsi + rax]
0x5c15d4: test rax, rax
0x5c15d7: jne 0x1405c16b0
0x5c15dd: lea r14, [rbx + 0x90]
0x5c15e4: cmp qword ptr [r14], rax
0x5c15e7: jne 0x1405c160e
0x5c15e9: mov qword ptr [rsp + 0x20], r14
0x5c15ee: xor r9d, r9d
0x5c15f1: lea r8, [rip + 0x53c1da8]
0x5c15f8: mov rdx, qword ptr [rbx + 0x10]
0x5c15fc: lea rcx, [rsp + 0x70]
0x5c1601: call 0x1425c5230
0x5c1606: mov eax, dword ptr [rsp + 0x70]
0x5c160a: test eax, eax
0x5c160c: jne 0x1405c1687
0x5c160e: call 0x141416af0
0x5c1613: add rax, 0x7d0
0x5c1619: mov qword ptr [rbx + 0x98], rax
0x5c1620: mov rcx, qword ptr [r14]
0x5c1623: mov rdx, qword ptr [rbx + 0x28]
0x5c1627: lea r14, [rip + 0x5160692]
0x5c162e: mov qword ptr [rsp + 0x30], r14
0x5c1633: mov byte ptr [rsp + 0x38], 0
0x5c1638: lea rbp, [rip + 0x5160621]
0x5c163f: mov qword ptr [rsp + 0x30], rbp
0x5c1644: mov rax, qword ptr [rcx]
0x5c1647: mov qword ptr [rsp + 0x40], rax
0x5c164c: mov eax, dword ptr [rcx + 0xc]
0x5c164f: mov dword ptr [rsp + 0x48], eax
0x5c1653: mov dword ptr [rsp + 0x4c], 0
0x5c165b: mov eax, dword ptr [rdx + rsi + 4]
0x5c165f: mov dword ptr [rsp + 0x4c], eax
0x5c1663: lea r9, [rsp + 0x30]
0x5c1668: mov r8d, edi
0x5c166b: lea rdx, [rsp + 0x70]
0x5c1670: mov rcx, rbx
0x5c1673: call 0x1405c2910
0x5c1678: nop 
0x5c1679: mov qword ptr [rsp + 0x30], rbp
0x5c167e: mov qword ptr [rsp + 0x30], r14
0x5c1683: mov eax, dword ptr [rsp + 0x70]
0x5c1687: mov rcx, qword ptr [rip + 0x6739d9a]
0x5c168e: test eax, eax
0x5c1690: je 0x1405c1697
0x5c1692: mov rax, rcx
0x5c1695: jmp 0x1405c169f
0x5c1697: mov rax, qword ptr [rbx + 0x58]
0x5c169b: mov rax, qword ptr [rsi + rax]
0x5c169f: test rax, rax
0x5c16a2: je 0x1405c16ad
0x5c16a4: jmp 0x1405c16b0
0x5c16a6: mov rcx, qword ptr [rip + 0x6739d7b]
0x5c16ad: mov rax, rcx
0x5c16b0: mov rbx, qword ptr [rsp + 0x78]
0x5c16b5: mov rbp, qword ptr [rsp + 0x80]
0x5c16bd: add rsp, 0x50
0x5c16c1: pop r14
0x5c16c3: pop rdi
0x5c16c4: pop rsi
0x5c16c5: ret 
CALLEE 0x430280
0x430280: mov qword ptr [rsp + 0x10], rbx
0x430285: mov qword ptr [rsp + 0x18], rbp
0x43028a: push rsi
0x43028b: push rdi
0x43028c: push r14
0x43028e: sub rsp, 0x50
0x430292: movzx edi, word ptr [rcx]
0x430295: mov rbx, qword ptr [rip + 0x693bbdc]
0x43029c: cmp edi, dword ptr [rbx + 8]
0x43029f: jae 0x140430388
0x4302a5: lea rsi, [rdi*8]
0x4302ad: mov rax, qword ptr [rbx + 0x58]
0x4302b1: mov rax, qword ptr [rsi + rax]
0x4302b5: test rax, rax
0x4302b8: jne 0x140430392
0x4302be: lea r14, [rbx + 0x90]
0x4302c5: cmp qword ptr [r14], rax
0x4302c8: jne 0x1404302ef
0x4302ca: mov qword ptr [rsp + 0x20], r14
0x4302cf: xor r9d, r9d
0x4302d2: lea r8, [rip + 0x51448a7]
0x4302d9: mov rdx, qword ptr [rbx + 0x10]
0x4302dd: lea rcx, [rsp + 0x70]
0x4302e2: call 0x1425c5230
0x4302e7: mov eax, dword ptr [rsp + 0x70]
0x4302eb: test eax, eax
0x4302ed: jne 0x140430369
0x4302ef: call 0x141416af0
0x4302f4: add rax, 0x7d0
0x4302fa: mov qword ptr [rbx + 0x98], rax
0x430301: mov rcx, qword ptr [r14]
0x430304: mov rdx, qword ptr [rbx + 0x28]
0x430308: lea r14, [rip + 0x52f19b1]
0x43030f: mov qword ptr [rsp + 0x30], r14
0x430314: mov byte ptr [rsp + 0x38], 0
0x430319: lea rbp, [rip + 0x52f1940]
0x430320: mov qword ptr [rsp + 0x30], rbp
0x430325: mov rax, qword ptr [rcx]
0x430328: mov qword ptr [rsp + 0x40], rax
0x43032d: mov eax, dword ptr [rcx + 0xc]
0x430330: mov dword ptr [rsp + 0x48], eax
0x430334: mov dword ptr [rsp + 0x4c], 0
0x43033c: mov eax, dword ptr [rdx + rsi + 4]
0x430340: mov dword ptr [rsp + 0x4c], eax
0x430344: lea r9, [rsp + 0x30]
0x430349: movzx r8d, di
0x43034d: lea rdx, [rsp + 0x70]
0x430352: mov rcx, rbx
0x430355: call 0x1404344e0
0x43035a: nop 
0x43035b: mov qword ptr [rsp + 0x30], rbp
0x430360: mov qword ptr [rsp + 0x30], r14
0x430365: mov eax, dword ptr [rsp + 0x70]
0x430369: mov rcx, qword ptr [rip + 0x68ae080]
0x430370: test eax, eax
0x430372: je 0x140430379
0x430374: mov rax, rcx
0x430377: jmp 0x140430381
0x430379: mov rax, qword ptr [rbx + 0x58]
0x43037d: mov rax, qword ptr [rsi + rax]
0x430381: test rax, rax
0x430384: je 0x14043038f
0x430386: jmp 0x140430392
0x430388: mov rcx, qword ptr [rip + 0x68ae061]
0x43038f: mov rax, rcx
0x430392: mov rbx, qword ptr [rsp + 0x78]
0x430397: mov rbp, qword ptr [rsp + 0x80]
0x43039f: add rsp, 0x50
0x4303a3: pop r14
0x4303a5: pop rdi
0x4303a6: pop rsi
0x4303a7: ret 
CALLEE 0x15e7e90
0x15e7e90: push rbx
0x15e7e92: sub rsp, 0x20
0x15e7e96: mov eax, 0xffff
0x15e7e9b: mov rbx, rcx
0x15e7e9e: cmp word ptr [rcx + 0x188], ax
0x15e7ea5: je 0x1415e7f1e
0x15e7ea7: test dl, dl
0x15e7ea9: je 0x1415e7ef3
0x15e7eab: mov rcx, qword ptr [rcx + 0x128]
0x15e7eb2: test rcx, rcx
0x15e7eb5: je 0x1415e7ede
0x15e7eb7: mov rax, qword ptr [rcx]
0x15e7eba: xor edx, edx
0x15e7ebc: call qword ptr [rax + 8]
0x15e7ebf: test rax, rax
0x15e7ec2: je 0x1415e7ede
0x15e7ec4: cmp byte ptr [rax], 0
0x15e7ec7: je 0x1415e7ede
0x15e7ec9: mov rcx, qword ptr [rbx + 0x128]
0x15e7ed0: xor edx, edx
0x15e7ed2: mov rax, qword ptr [rcx]
0x15e7ed5: add rsp, 0x20
0x15e7ed9: pop rbx
0x15e7eda: jmp qword ptr [rax + 8]
0x15e7ede: mov rcx, qword ptr [rbx + 0x108]
0x15e7ee5: xor edx, edx
0x15e7ee7: mov rax, qword ptr [rcx]
0x15e7eea: add rsp, 0x20
0x15e7eee: pop rbx
0x15e7eef: jmp qword ptr [rax + 8]
0x15e7ef3: mov rcx, qword ptr [rcx + 0x108]
0x15e7efa: test rcx, rcx
0x15e7efd: je 0x1415e7f11
0x15e7eff: mov rax, qword ptr [rcx]
0x15e7f02: xor edx, edx
0x15e7f04: call qword ptr [rax + 8]
0x15e7f07: test rax, rax
0x15e7f0a: je 0x1415e7f11
0x15e7f0c: cmp byte ptr [rax], 0
0x15e7f0f: jne 0x1415e7ede
0x15e7f11: lea rax, [rip + 0x3fa8b48]
0x15e7f18: add rsp, 0x20
0x15e7f1c: pop rbx
0x15e7f1d: ret 
0x15e7f1e: mov rcx, qword ptr [rcx + 0x108]
0x15e7f25: xor edx, edx
0x15e7f27: mov rax, qword ptr [rcx]
0x15e7f2a: add rsp, 0x20
0x15e7f2e: pop rbx
0x15e7f2f: jmp qword ptr [rax + 8]
CALLEE 0x388e00
0x388e00: mov qword ptr [rsp + 0x10], rbx
0x388e05: mov qword ptr [rsp + 0x18], rbp
0x388e0a: push rsi
0x388e0b: push rdi
0x388e0c: push r14
0x388e0e: sub rsp, 0x50
0x388e12: movzx edi, word ptr [rcx]
0x388e15: mov rbx, qword ptr [rip + 0x69e0c64]
0x388e1c: cmp edi, dword ptr [rbx + 8]
0x388e1f: jae 0x140388f08
0x388e25: lea rsi, [rdi*8]
0x388e2d: mov rax, qword ptr [rbx + 0x58]
0x388e31: mov rax, qword ptr [rsi + rax]
0x388e35: test rax, rax
0x388e38: jne 0x140388f12
0x388e3e: lea r14, [rbx + 0x90]
0x388e45: cmp qword ptr [r14], rax
0x388e48: jne 0x140388e6f
0x388e4a: mov qword ptr [rsp + 0x20], r14
0x388e4f: xor r9d, r9d
0x388e52: lea r8, [rip + 0x5712a9f]
0x388e59: mov rdx, qword ptr [rbx + 0x10]
0x388e5d: lea rcx, [rsp + 0x70]
0x388e62: call 0x1425c5230
0x388e67: mov eax, dword ptr [rsp + 0x70]
0x388e6b: test eax, eax
0x388e6d: jne 0x140388ee9
0x388e6f: call 0x141416af0
0x388e74: add rax, 0x7d0
0x388e7a: mov qword ptr [rbx + 0x98], rax
0x388e81: mov rcx, qword ptr [r14]
0x388e84: mov rdx, qword ptr [rbx + 0x28]
0x388e88: lea r14, [rip + 0x5398e31]
0x388e8f: mov qword ptr [rsp + 0x30], r14
0x388e94: mov byte ptr [rsp + 0x38], 0
0x388e99: lea rbp, [rip + 0x5398dc0]
0x388ea0: mov qword ptr [rsp + 0x30], rbp
0x388ea5: mov rax, qword ptr [rcx]
0x388ea8: mov qword ptr [rsp + 0x40], rax
0x388ead: mov eax, dword ptr [rcx + 0xc]
0x388eb0: mov dword ptr [rsp + 0x48], eax
0x388eb4: mov dword ptr [rsp + 0x4c], 0
0x388ebc: mov eax, dword ptr [rdx + rsi + 4]
0x388ec0: mov dword ptr [rsp + 0x4c], eax
0x388ec4: lea r9, [rsp + 0x30]
0x388ec9: movzx r8d, di
0x388ecd: lea rdx, [rsp + 0x70]
0x388ed2: mov rcx, rbx
0x388ed5: call 0x14038b6b0
0x388eda: nop 
0x388edb: mov qword ptr [rsp + 0x30], rbp
0x388ee0: mov qword ptr [rsp + 0x30], r14
0x388ee5: mov eax, dword ptr [rsp + 0x70]
0x388ee9: mov rcx, qword ptr [rip + 0x69788a8]
0x388ef0: test eax, eax
0x388ef2: je 0x140388ef9
0x388ef4: mov rax, rcx
0x388ef7: jmp 0x140388f01
0x388ef9: mov rax, qword ptr [rbx + 0x58]
0x388efd: mov rax, qword ptr [rsi + rax]
0x388f01: test rax, rax
0x388f04: je 0x140388f0f
0x388f06: jmp 0x140388f12
0x388f08: mov rcx, qword ptr [rip + 0x6978889]
0x388f0f: mov rax, rcx
0x388f12: mov rbx, qword ptr [rsp + 0x78]
0x388f17: mov rbp, qword ptr [rsp + 0x80]
0x388f1f: add rsp, 0x50
0x388f23: pop r14
0x388f25: pop rdi
0x388f26: pop rsi
0x388f27: ret 
CALLEE 0x3d5f80
0x3d5f80: push rbx
0x3d5f82: push rbp
0x3d5f83: push rsi
0x3d5f84: sub rsp, 0x30
0x3d5f88: mov rsi, qword ptr [rcx]
0x3d5f8b: mov rbp, rdx
0x3d5f8e: mov rbx, rcx
0x3d5f91: cmp rdx, qword ptr [rsi]
0x3d5f94: je 0x1403d606a
CALLEE 0x141fe80
0x141fe80: push rsi
0x141fe82: push rdi
0x141fe83: sub rsp, 0x38
0x141fe87: mov rdi, qword ptr [rcx]
0x141fe8a: mov rsi, 0xffffffffffffffff
CALLEE 0x1420260
0x1420260: push rbp
0x1420262: push rdi
0x1420263: push r15
0x1420265: sub rsp, 0x20
0x1420269: mov rdi, qword ptr [rcx]
0x142026c: mov r15, rcx
0x142026f: mov rbp, qword ptr [rdi]
0x1420272: test rbp, rbp
0x1420275: je 0x14142034d
0x142027b: cmp byte ptr [rbp], 0
0x142027f: je 0x14142034d
CALLEE 0x3f321f0
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
CALLEE 0x64b880
0x64b880: mov qword ptr [rsp + 0x10], rbx
0x64b885: mov qword ptr [rsp + 0x18], rbp
0x64b88a: push rsi
0x64b88b: push rdi
0x64b88c: push r12
0x64b88e: push r14
0x64b890: push r15
0x64b892: sub rsp, 0x30
0x64b896: mov r15, r9
0x64b899: mov r12, r8
0x64b89c: mov rbp, rdx
0x64b89f: mov r14, rcx
0x64b8a2: mov rcx, qword ptr [rcx]
0x64b8a5: mov rax, qword ptr [rcx + 0xa0]
0x64b8ac: test rax, rax
0x64b8af: je 0x14064b8bc
0x64b8b1: cmp qword ptr [rax + 8], 0
0x64b8b6: jne 0x14064ba67
0x64b8bc: mov rsi, qword ptr [rcx + 0x20]
0x64b8c0: cmp qword ptr [rsi + 0x30], 0
0x64b8c5: jne 0x14064ba24
0x64b8cb: mov edx, 0x1fd
0x64b8d0: mov rax, qword ptr gs:[0x58]
0x64b8d9: mov rcx, qword ptr [rax]
0x64b8dc: cmp byte ptr [rdx + rcx], 0
0x64b8e0: mov edx, 0x10
0x64b8e5: mov ecx, 0xb0
0x64b8ea: je 0x14064b8f3
0x64b8ec: call 0x1447efa78
0x64b8f1: jmp 0x14064b8f8
0x64b8f3: call 0x1447ef9b0
0x64b8f8: mov rbx, rax
0x64b8fb: test rax, rax
0x64b8fe: jne 0x14064b91b
0x64b900: call 0x141318e70
0x64b905: xor r9d, r9d
0x64b908: xor r8d, r8d
0x64b90b: mov edx, 1
0x64b910: mov ecx, 0xa0000002
0x64b915: call qword ptr [rip + 0x4b9f82d]
0x64b91b: mov qword ptr [rsp + 0x60], rbx
0x64b920: xor edi, edi
0x64b922: test rbx, rbx
0x64b925: je 0x14064ba0e
0x64b92b: mov dword ptr [rsp + 0x80], edi
0x64b932: mov r9d, 0x2ffff
0x64b938: mov r8d, 1
0x64b93e: lea rdx, [rip + 0x4f4114b]
0x64b945: lea rcx, [rsp + 0x80]
0x64b94d: call 0x1412becb0
0x64b952: mov dword ptr [rbx], edi
0x64b954: mov byte ptr [rbx + 4], dil
0x64b958: mov dword ptr [rbx + 8], edi
0x64b95b: mov byte ptr [rbx + 0xc], dil
0x64b95f: mov dword ptr [rbx + 0x10], edi
0x64b962: mov byte ptr [rbx + 0x14], dil
0x64b966: mov dword ptr [rbx + 0x18], edi
0x64b969: mov byte ptr [rbx + 0x1c], dil
0x64b96d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b974: mov byte ptr [rbx + 0x24], dil
0x64b978: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b97f: mov byte ptr [rbx + 0x2c], dil
0x64b983: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b98a: mov byte ptr [rbx + 0x34], dil
0x64b98e: mov dword ptr [rbx + 0x38], edi
0x64b991: mov byte ptr [rbx + 0x3c], dil
0x64b995: mov dword ptr [rbx + 0x40], edi
0x64b998: mov byte ptr [rbx + 0x44], dil
0x64b99c: mov dword ptr [rbx + 0x48], edi
0x64b99f: mov byte ptr [rbx + 0x4c], dil
0x64b9a3: mov dword ptr [rbx + 0x50], edi
0x64b9a6: mov byte ptr [rbx + 0x54], dil
0x64b9aa: mov dword ptr [rbx + 0x58], edi
0x64b9ad: mov byte ptr [rbx + 0x5c], dil
0x64b9b1: mov dword ptr [rbx + 0x60], edi
0x64b9b4: mov byte ptr [rbx + 0x64], dil
0x64b9b8: mov dword ptr [rbx + 0x68], edi
0x64b9bb: mov qword ptr [rbx + 0x70], rdi
0x64b9bf: mov qword ptr [rbx + 0x78], rdi
0x64b9c3: mov qword ptr [rbx + 0x80], rdi
0x64b9ca: mov qword ptr [rbx + 0x88], rdi
0x64b9d1: mov dword ptr [rbx + 0x90], edi
0x64b9d7: xor eax, eax
0x64b9d9: mov word ptr [rbx + 0x94], ax
0x64b9e0: mov byte ptr [rbx + 0x96], 1
0x64b9e7: mov qword ptr [rbx + 0x98], rdi
0x64b9ee: mov qword ptr [rbx + 0xa0], rdi
0x64b9f5: mov eax, dword ptr [rsp + 0x80]
0x64b9fc: mov dword ptr [rbx + 0xa8], eax
0x64ba02: mov dword ptr [rbx + 0xac], 0xff000000
0x64ba0c: jmp 0x14064ba11
0x64ba0e: mov rbx, rdi
0x64ba11: cmp rbx, qword ptr [rsi + 0x30]
0x64ba15: je 0x14064ba24
0x64ba17: lea rcx, [rsi + 0x30]
0x64ba1b: call 0x14061a7b0
0x64ba20: mov qword ptr [rsi + 0x30], rbx
0x64ba24: mov byte ptr [rsp + 0x80], 0
0x64ba2c: mov rax, qword ptr [r14]
0x64ba2f: mov rcx, qword ptr [rax + 0x20]
0x64ba33: lea rax, [rsp + 0x80]
0x64ba3b: mov qword ptr [rsp + 0x20], rax
0x64ba40: mov r9, r15
0x64ba43: mov r8, r12
0x64ba46: mov rdx, rbp
0x64ba49: mov rcx, qword ptr [rcx + 0x30]
0x64ba4d: call 0x14064d220
0x64ba52: cmp byte ptr [rsp + 0x80], 0
0x64ba5a: jne 0x14064ba67
0x64ba5c: mov rdx, rbp
0x64ba5f: mov rcx, r14
0x64ba62: call 0x1435c72e0
0x64ba67: mov rbx, qword ptr [rsp + 0x68]
0x64ba6c: mov rbp, qword ptr [rsp + 0x70]
0x64ba71: add rsp, 0x30
0x64ba75: pop r15
0x64ba77: pop r14
0x64ba79: pop r12
0x64ba7b: pop rdi
0x64ba7c: pop rsi
0x64ba7d: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x388e00
0x388e00: mov qword ptr [rsp + 0x10], rbx
0x388e05: mov qword ptr [rsp + 0x18], rbp
0x388e0a: push rsi
0x388e0b: push rdi
0x388e0c: push r14
0x388e0e: sub rsp, 0x50
0x388e12: movzx edi, word ptr [rcx]
0x388e15: mov rbx, qword ptr [rip + 0x69e0c64]
0x388e1c: cmp edi, dword ptr [rbx + 8]
0x388e1f: jae 0x140388f08
0x388e25: lea rsi, [rdi*8]
0x388e2d: mov rax, qword ptr [rbx + 0x58]
0x388e31: mov rax, qword ptr [rsi + rax]
0x388e35: test rax, rax
0x388e38: jne 0x140388f12
0x388e3e: lea r14, [rbx + 0x90]
0x388e45: cmp qword ptr [r14], rax
0x388e48: jne 0x140388e6f
0x388e4a: mov qword ptr [rsp + 0x20], r14
0x388e4f: xor r9d, r9d
0x388e52: lea r8, [rip + 0x5712a9f]
0x388e59: mov rdx, qword ptr [rbx + 0x10]
0x388e5d: lea rcx, [rsp + 0x70]
0x388e62: call 0x1425c5230
0x388e67: mov eax, dword ptr [rsp + 0x70]
0x388e6b: test eax, eax
0x388e6d: jne 0x140388ee9
0x388e6f: call 0x141416af0
0x388e74: add rax, 0x7d0
0x388e7a: mov qword ptr [rbx + 0x98], rax
0x388e81: mov rcx, qword ptr [r14]
0x388e84: mov rdx, qword ptr [rbx + 0x28]
0x388e88: lea r14, [rip + 0x5398e31]
0x388e8f: mov qword ptr [rsp + 0x30], r14
0x388e94: mov byte ptr [rsp + 0x38], 0
0x388e99: lea rbp, [rip + 0x5398dc0]
0x388ea0: mov qword ptr [rsp + 0x30], rbp
0x388ea5: mov rax, qword ptr [rcx]
0x388ea8: mov qword ptr [rsp + 0x40], rax
0x388ead: mov eax, dword ptr [rcx + 0xc]
0x388eb0: mov dword ptr [rsp + 0x48], eax
0x388eb4: mov dword ptr [rsp + 0x4c], 0
0x388ebc: mov eax, dword ptr [rdx + rsi + 4]
0x388ec0: mov dword ptr [rsp + 0x4c], eax
0x388ec4: lea r9, [rsp + 0x30]
0x388ec9: movzx r8d, di
0x388ecd: lea rdx, [rsp + 0x70]
0x388ed2: mov rcx, rbx
0x388ed5: call 0x14038b6b0
0x388eda: nop 
0x388edb: mov qword ptr [rsp + 0x30], rbp
0x388ee0: mov qword ptr [rsp + 0x30], r14
0x388ee5: mov eax, dword ptr [rsp + 0x70]
0x388ee9: mov rcx, qword ptr [rip + 0x69788a8]
0x388ef0: test eax, eax
0x388ef2: je 0x140388ef9
0x388ef4: mov rax, rcx
0x388ef7: jmp 0x140388f01
0x388ef9: mov rax, qword ptr [rbx + 0x58]
0x388efd: mov rax, qword ptr [rsi + rax]
0x388f01: test rax, rax
0x388f04: je 0x140388f0f
0x388f06: jmp 0x140388f12
0x388f08: mov rcx, qword ptr [rip + 0x6978889]
0x388f0f: mov rax, rcx
0x388f12: mov rbx, qword ptr [rsp + 0x78]
0x388f17: mov rbp, qword ptr [rsp + 0x80]
0x388f1f: add rsp, 0x50
0x388f23: pop r14
0x388f25: pop rdi
0x388f26: pop rsi
0x388f27: ret 
CALLEE 0x3d5f80
0x3d5f80: push rbx
0x3d5f82: push rbp
0x3d5f83: push rsi
0x3d5f84: sub rsp, 0x30
0x3d5f88: mov rsi, qword ptr [rcx]
0x3d5f8b: mov rbp, rdx
0x3d5f8e: mov rbx, rcx
0x3d5f91: cmp rdx, qword ptr [rsi]
0x3d5f94: je 0x1403d606a
CALLEE 0x141fe80
0x141fe80: push rsi
0x141fe82: push rdi
0x141fe83: sub rsp, 0x38
0x141fe87: mov rdi, qword ptr [rcx]
0x141fe8a: mov rsi, 0xffffffffffffffff
CALLEE 0x1420260
0x1420260: push rbp
0x1420262: push rdi
0x1420263: push r15
0x1420265: sub rsp, 0x20
0x1420269: mov rdi, qword ptr [rcx]
0x142026c: mov r15, rcx
0x142026f: mov rbp, qword ptr [rdi]
0x1420272: test rbp, rbp
0x1420275: je 0x14142034d
0x142027b: cmp byte ptr [rbp], 0
0x142027f: je 0x14142034d
CALLEE 0x3f321f0
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
CALLEE 0x64b880
0x64b880: mov qword ptr [rsp + 0x10], rbx
0x64b885: mov qword ptr [rsp + 0x18], rbp
0x64b88a: push rsi
0x64b88b: push rdi
0x64b88c: push r12
0x64b88e: push r14
0x64b890: push r15
0x64b892: sub rsp, 0x30
0x64b896: mov r15, r9
0x64b899: mov r12, r8
0x64b89c: mov rbp, rdx
0x64b89f: mov r14, rcx
0x64b8a2: mov rcx, qword ptr [rcx]
0x64b8a5: mov rax, qword ptr [rcx + 0xa0]
0x64b8ac: test rax, rax
0x64b8af: je 0x14064b8bc
0x64b8b1: cmp qword ptr [rax + 8], 0
0x64b8b6: jne 0x14064ba67
0x64b8bc: mov rsi, qword ptr [rcx + 0x20]
0x64b8c0: cmp qword ptr [rsi + 0x30], 0
0x64b8c5: jne 0x14064ba24
0x64b8cb: mov edx, 0x1fd
0x64b8d0: mov rax, qword ptr gs:[0x58]
0x64b8d9: mov rcx, qword ptr [rax]
0x64b8dc: cmp byte ptr [rdx + rcx], 0
0x64b8e0: mov edx, 0x10
0x64b8e5: mov ecx, 0xb0
0x64b8ea: je 0x14064b8f3
0x64b8ec: call 0x1447efa78
0x64b8f1: jmp 0x14064b8f8
0x64b8f3: call 0x1447ef9b0
0x64b8f8: mov rbx, rax
0x64b8fb: test rax, rax
0x64b8fe: jne 0x14064b91b
0x64b900: call 0x141318e70
0x64b905: xor r9d, r9d
0x64b908: xor r8d, r8d
0x64b90b: mov edx, 1
0x64b910: mov ecx, 0xa0000002
0x64b915: call qword ptr [rip + 0x4b9f82d]
0x64b91b: mov qword ptr [rsp + 0x60], rbx
0x64b920: xor edi, edi
0x64b922: test rbx, rbx
0x64b925: je 0x14064ba0e
0x64b92b: mov dword ptr [rsp + 0x80], edi
0x64b932: mov r9d, 0x2ffff
0x64b938: mov r8d, 1
0x64b93e: lea rdx, [rip + 0x4f4114b]
0x64b945: lea rcx, [rsp + 0x80]
0x64b94d: call 0x1412becb0
0x64b952: mov dword ptr [rbx], edi
0x64b954: mov byte ptr [rbx + 4], dil
0x64b958: mov dword ptr [rbx + 8], edi
0x64b95b: mov byte ptr [rbx + 0xc], dil
0x64b95f: mov dword ptr [rbx + 0x10], edi
0x64b962: mov byte ptr [rbx + 0x14], dil
0x64b966: mov dword ptr [rbx + 0x18], edi
0x64b969: mov byte ptr [rbx + 0x1c], dil
0x64b96d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b974: mov byte ptr [rbx + 0x24], dil
0x64b978: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b97f: mov byte ptr [rbx + 0x2c], dil
0x64b983: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b98a: mov byte ptr [rbx + 0x34], dil
0x64b98e: mov dword ptr [rbx + 0x38], edi
0x64b991: mov byte ptr [rbx + 0x3c], dil
0x64b995: mov dword ptr [rbx + 0x40], edi
0x64b998: mov byte ptr [rbx + 0x44], dil
0x64b99c: mov dword ptr [rbx + 0x48], edi
0x64b99f: mov byte ptr [rbx + 0x4c], dil
0x64b9a3: mov dword ptr [rbx + 0x50], edi
0x64b9a6: mov byte ptr [rbx + 0x54], dil
0x64b9aa: mov dword ptr [rbx + 0x58], edi
0x64b9ad: mov byte ptr [rbx + 0x5c], dil
0x64b9b1: mov dword ptr [rbx + 0x60], edi
0x64b9b4: mov byte ptr [rbx + 0x64], dil
0x64b9b8: mov dword ptr [rbx + 0x68], edi
0x64b9bb: mov qword ptr [rbx + 0x70], rdi
0x64b9bf: mov qword ptr [rbx + 0x78], rdi
0x64b9c3: mov qword ptr [rbx + 0x80], rdi
0x64b9ca: mov qword ptr [rbx + 0x88], rdi
0x64b9d1: mov dword ptr [rbx + 0x90], edi
0x64b9d7: xor eax, eax
0x64b9d9: mov word ptr [rbx + 0x94], ax
0x64b9e0: mov byte ptr [rbx + 0x96], 1
0x64b9e7: mov qword ptr [rbx + 0x98], rdi
0x64b9ee: mov qword ptr [rbx + 0xa0], rdi
0x64b9f5: mov eax, dword ptr [rsp + 0x80]
0x64b9fc: mov dword ptr [rbx + 0xa8], eax
0x64ba02: mov dword ptr [rbx + 0xac], 0xff000000
0x64ba0c: jmp 0x14064ba11
0x64ba0e: mov rbx, rdi
0x64ba11: cmp rbx, qword ptr [rsi + 0x30]
0x64ba15: je 0x14064ba24
0x64ba17: lea rcx, [rsi + 0x30]
0x64ba1b: call 0x14061a7b0
0x64ba20: mov qword ptr [rsi + 0x30], rbx
0x64ba24: mov byte ptr [rsp + 0x80], 0
0x64ba2c: mov rax, qword ptr [r14]
0x64ba2f: mov rcx, qword ptr [rax + 0x20]
0x64ba33: lea rax, [rsp + 0x80]
0x64ba3b: mov qword ptr [rsp + 0x20], rax
0x64ba40: mov r9, r15
0x64ba43: mov r8, r12
0x64ba46: mov rdx, rbp
0x64ba49: mov rcx, qword ptr [rcx + 0x30]
0x64ba4d: call 0x14064d220
0x64ba52: cmp byte ptr [rsp + 0x80], 0
0x64ba5a: jne 0x14064ba67
0x64ba5c: mov rdx, rbp
0x64ba5f: mov rcx, r14
0x64ba62: call 0x1435c72e0
0x64ba67: mov rbx, qword ptr [rsp + 0x68]
0x64ba6c: mov rbp, qword ptr [rsp + 0x70]
0x64ba71: add rsp, 0x30
0x64ba75: pop r15
0x64ba77: pop r14
0x64ba79: pop r12
0x64ba7b: pop rdi
0x64ba7c: pop rsi
0x64ba7d: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x35ca4f0
0x35ca4f0: mov qword ptr [rsp + 0x18], r8
0x35ca4f5: push r12
0x35ca4f7: push r14
0x35ca4f9: sub rsp, 0x38
0x35ca4fd: mov rax, qword ptr [rcx]
0x35ca500: mov r14, rcx
0x35ca503: mov r12, rdx
0x35ca506: mov rcx, qword ptr [rax + 0xa0]
0x35ca50d: test rcx, rcx
0x35ca510: je 0x1435ca51d
0x35ca512: cmp qword ptr [rcx + 8], 0
0x35ca517: jne 0x1435ca5ff
0x35ca51d: mov eax, dword ptr [rdx + 8]
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x64f570
0x64f570: mov qword ptr [rsp + 8], rbx
0x64f575: mov qword ptr [rsp + 0x10], rdx
0x64f57a: push rdi
0x64f57b: sub rsp, 0x50
0x64f57f: mov rbx, rdx
0x64f582: xor edi, edi
0x64f584: mov dword ptr [rsp + 0x20], edi
0x64f588: test r8d, r8d
0x64f58b: jne 0x14064f5cd
0x64f58d: lea rdx, [rip + 0x50d68b4]
0x64f594: mov qword ptr [rbx], rdx
0x64f597: mov qword ptr [rbx + 8], rdi
0x64f59b: mov word ptr [rbx + 0x10], di
0x64f59f: mov qword ptr [rbx + 0x18], rdi
0x64f5a3: lea rax, [rip + 0x4f244de]
0x64f5aa: mov qword ptr [rbx], rax
0x64f5ad: lea rax, [rip + 0x4f24494]
0x64f5b4: mov qword ptr [rbx], rax
0x64f5b7: mov dword ptr [rsp + 0x20], 1
0x64f5bf: mov rax, rbx
0x64f5c2: mov rbx, qword ptr [rsp + 0x60]
0x64f5c7: add rsp, 0x50
0x64f5cb: pop rdi
0x64f5cc: ret 
0x64f5cd: lea rdx, [rsp + 0x28]
0x64f5d2: mov rcx, qword ptr [rip + 0x6719bb7]
0x64f5d9: mov rcx, qword ptr [rcx + 0x30]
0x64f5dd: call 0x1408adfe0
0x64f5e2: nop 
0x64f5e3: lea rdx, [rip + 0x50d685e]
0x64f5ea: mov qword ptr [rbx], rdx
0x64f5ed: mov rcx, qword ptr [rax + 8]
0x64f5f1: mov qword ptr [rbx + 8], rcx
0x64f5f5: movzx ecx, byte ptr [rax + 0x10]
0x64f5f9: mov byte ptr [rbx + 0x10], cl
0x64f5fc: movzx ecx, byte ptr [rax + 0x11]
0x64f600: mov byte ptr [rbx + 0x11], cl
0x64f603: mov rcx, qword ptr [rax + 0x18]
0x64f607: mov qword ptr [rbx + 0x18], rcx
0x64f60b: mov qword ptr [rax + 8], rdi
0x64f60f: mov byte ptr [rax + 0x10], 0
0x64f613: lea rax, [rip + 0x4f2446e]
0x64f61a: mov qword ptr [rbx], rax
0x64f61d: lea rax, [rip + 0x4f24424]
0x64f624: mov qword ptr [rbx], rax
0x64f627: mov dword ptr [rsp + 0x20], 1
0x64f62f: mov qword ptr [rsp + 0x28], rdx
0x64f634: lea rcx, [rsp + 0x28]
0x64f639: call 0x141434880
0x64f63e: mov rax, rbx
0x64f641: mov rbx, qword ptr [rsp + 0x60]
0x64f646: add rsp, 0x50
0x64f64a: pop rdi
0x64f64b: ret 
0x64f64c: int3 
CALLEE 0x389570
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
CALLEE 0x1434880
0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x4a2010
0x4a2010: mov qword ptr [rsp + 0x10], rbx
0x4a2015: mov qword ptr [rsp + 0x18], rbp
0x4a201a: push rsi
0x4a201b: push rdi
0x4a201c: push r14
0x4a201e: sub rsp, 0x50
0x4a2022: movzx edi, word ptr [rcx]
0x4a2025: mov rbx, qword ptr [rip + 0x68cc414]
0x4a202c: cmp edi, dword ptr [rbx + 8]
0x4a202f: jae 0x1404a2118
0x4a2035: lea rsi, [rdi*8]
0x4a203d: mov rax, qword ptr [rbx + 0x58]
0x4a2041: mov rax, qword ptr [rsi + rax]
0x4a2045: test rax, rax
0x4a2048: jne 0x1404a2122
0x4a204e: lea r14, [rbx + 0x90]
0x4a2055: cmp qword ptr [r14], rax
0x4a2058: jne 0x1404a207f
0x4a205a: mov qword ptr [rsp + 0x20], r14
0x4a205f: xor r9d, r9d
0x4a2062: lea r8, [rip + 0x54cfd0f]
0x4a2069: mov rdx, qword ptr [rbx + 0x10]
0x4a206d: lea rcx, [rsp + 0x70]
0x4a2072: call 0x1425c5230
0x4a2077: mov eax, dword ptr [rsp + 0x70]
0x4a207b: test eax, eax
0x4a207d: jne 0x1404a20f9
0x4a207f: call 0x141416af0
0x4a2084: add rax, 0x7d0
0x4a208a: mov qword ptr [rbx + 0x98], rax
0x4a2091: mov rcx, qword ptr [r14]
0x4a2094: mov rdx, qword ptr [rbx + 0x28]
0x4a2098: lea r14, [rip + 0x527fc21]
0x4a209f: mov qword ptr [rsp + 0x30], r14
0x4a20a4: mov byte ptr [rsp + 0x38], 0
0x4a20a9: lea rbp, [rip + 0x527fbb0]
0x4a20b0: mov qword ptr [rsp + 0x30], rbp
0x4a20b5: mov rax, qword ptr [rcx]
0x4a20b8: mov qword ptr [rsp + 0x40], rax
0x4a20bd: mov eax, dword ptr [rcx + 0xc]
0x4a20c0: mov dword ptr [rsp + 0x48], eax
0x4a20c4: mov dword ptr [rsp + 0x4c], 0
0x4a20cc: mov eax, dword ptr [rdx + rsi + 4]
0x4a20d0: mov dword ptr [rsp + 0x4c], eax
0x4a20d4: lea r9, [rsp + 0x30]
0x4a20d9: movzx r8d, di
0x4a20dd: lea rdx, [rsp + 0x70]
0x4a20e2: mov rcx, rbx
0x4a20e5: call 0x1404a5580
0x4a20ea: nop 
0x4a20eb: mov qword ptr [rsp + 0x30], rbp
0x4a20f0: mov qword ptr [rsp + 0x30], r14
0x4a20f5: mov eax, dword ptr [rsp + 0x70]
0x4a20f9: mov rcx, qword ptr [rip + 0x6857710]
0x4a2100: test eax, eax
0x4a2102: je 0x1404a2109
0x4a2104: mov rax, rcx
0x4a2107: jmp 0x1404a2111
0x4a2109: mov rax, qword ptr [rbx + 0x58]
0x4a210d: mov rax, qword ptr [rsi + rax]
0x4a2111: test rax, rax
0x4a2114: je 0x1404a211f
0x4a2116: jmp 0x1404a2122
0x4a2118: mov rcx, qword ptr [rip + 0x68576f1]
0x4a211f: mov rax, rcx
0x4a2122: mov rbx, qword ptr [rsp + 0x78]
0x4a2127: mov rbp, qword ptr [rsp + 0x80]
0x4a212f: add rsp, 0x50
0x4a2133: pop r14
0x4a2135: pop rdi
0x4a2136: pop rsi
0x4a2137: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
