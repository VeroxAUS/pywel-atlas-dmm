target=0xe016b0 reference=0xdf5687 return=0xdf568e function=14636176
0xdf5490: mov qword ptr [rsp + 8], rbx
0xdf5495: mov qword ptr [rsp + 0x10], rsi
0xdf549a: mov qword ptr [rsp + 0x20], rdi
0xdf549f: push rbp
0xdf54a0: push r12
0xdf54a2: push r13
0xdf54a4: push r14
0xdf54a6: push r15
0xdf54a8: lea rbp, [rsp - 0x20]
0xdf54ad: sub rsp, 0x120
0xdf54b4: mov rbx, rcx
0xdf54b7: mov rax, qword ptr [rip + 0x5f73d2a]
0xdf54be: mov rsi, qword ptr [rax + 0xb0]
0xdf54c5: mov r12, qword ptr [rsi + 0x808]
0xdf54cc: xor edi, edi
0xdf54ce: test dl, dl
0xdf54d0: je 0x140df7288
0xdf54d6: mov qword ptr [rbp - 0x60], rcx
0xdf54da: lea rax, [rip + 0xc10f]
0xdf54e1: mov qword ptr [rbp - 0x58], rax
0xdf54e5: mov qword ptr [rbp - 0x50], rdi
0xdf54e9: mov word ptr [rbp - 0x48], di
0xdf54ed: lea rdx, [rbp - 0x60]
0xdf54f1: lea rcx, [r12 + 0x40]
0xdf54f6: call 0x140476290
0xdf54fb: nop 
0xdf54fc: mov byte ptr [rbp - 0x47], dil
0xdf5500: mov rcx, qword ptr [rsi + 0x210]
0xdf5507: add rcx, 0x40
0xdf550b: mov qword ptr [rsp + 0x40], rbx
0xdf5510: lea r8, [rip + 0xc109]
0xdf5517: mov qword ptr [rsp + 0x48], r8
0xdf551c: mov qword ptr [rsp + 0x50], rdi
0xdf5521: mov word ptr [rsp + 0x58], di
0xdf5526: lea rdx, [rsp + 0x40]
0xdf552b: call 0x140476290
0xdf5530: nop 
0xdf5531: mov byte ptr [rsp + 0x59], dil
0xdf5536: mov r14, qword ptr [rsi + 0x610]
0xdf553d: mov qword ptr [rsp + 0x20], rbx
0xdf5542: lea rax, [rip + 0xc117]
0xdf5549: mov qword ptr [rsp + 0x28], rax
0xdf554e: mov qword ptr [rsp + 0x30], rdi
0xdf5553: mov word ptr [rsp + 0x38], di
0xdf5558: mov ecx, dword ptr [r14 + 0x48]
0xdf555c: mov eax, dword ptr [r14 + 0x4c]
0xdf5560: mov r15d, 1
0xdf5566: mov edx, 0x1fd
0xdf556b: cmp eax, ecx
0xdf556d: ja 0x140df565c
0xdf5573: lea r12d, [rax*2 + 1]
0xdf557b: add r12d, eax
0xdf557e: shr r12d, 1
0xdf5581: cmp r12d, r15d
0xdf5584: cmovb r12d, r15d
0xdf5588: cmp ecx, r12d
0xdf558b: cmova r12d, ecx
0xdf558f: cmp r12d, eax
0xdf5592: jbe 0x140df565c
0xdf5598: mov ecx, r12d
0xdf559b: shl ecx, 5
0xdf559e: mov r8d, edx
0xdf55a1: mov rax, qword ptr gs:[0x58]
0xdf55aa: mov rax, qword ptr [rax]
0xdf55ad: add rax, r8
0xdf55b0: mov qword ptr [rbp + 0x60], rax
0xdf55b4: mov edx, 8
0xdf55b9: cmp byte ptr [rax], dil
0xdf55bc: je 0x140df55c5
0xdf55be: call 0x1447efa78
0xdf55c3: jmp 0x140df55ca
0xdf55c5: call 0x1447ef9b0
0xdf55ca: mov r13, rax
0xdf55cd: test rax, rax
0xdf55d0: jne 0x140df55eb
0xdf55d2: call 0x141318e70
0xdf55d7: xor r9d, r9d
0xdf55da: xor r8d, r8d
0xdf55dd: mov edx, r15d
0xdf55e0: mov ecx, 0xa0000002
0xdf55e5: call qword ptr [rip + 0x43f5b5d]
0xdf55eb: mov r15d, edi
0xdf55ee: cmp dword ptr [r14 + 0x48], edi
0xdf55f2: jbe 0x140df562b
0xdf55f4: nop dword ptr [rax]
0xdf55f8: nop dword ptr [rax + rax]
0xdf5600: mov ecx, r15d
0xdf5603: shl rcx, 5
0xdf5607: mov rax, qword ptr [r14 + 0x40]
0xdf560b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf5610: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5616: add rcx, qword ptr [r14 + 0x40]
0xdf561a: vzeroupper 
0xdf561d: call 0x14035f1f0
0xdf5622: inc r15d
0xdf5625: cmp r15d, dword ptr [r14 + 0x48]
0xdf5629: jb 0x140df5600
0xdf562b: mov rcx, qword ptr [r14 + 0x40]
0xdf562f: test rcx, rcx
0xdf5632: je 0x140df5649
0xdf5634: mov rax, qword ptr [rbp + 0x60]
0xdf5638: cmp byte ptr [rax], 0
0xdf563b: je 0x140df5644
0xdf563d: call 0x1447f03bc
0xdf5642: jmp 0x140df5649
0xdf5644: call 0x1447f02bc
0xdf5649: mov qword ptr [r14 + 0x40], r13
0xdf564d: mov dword ptr [r14 + 0x4c], r12d
0xdf5651: mov r15d, 1
0xdf5657: mov edx, 0x1fd
0xdf565c: mov eax, dword ptr [r14 + 0x48]
0xdf5660: shl rax, 5
0xdf5664: add rax, qword ptr [r14 + 0x40]
0xdf5668: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf566e: vmovups ymmword ptr [rax], ymm0
0xdf5672: inc dword ptr [r14 + 0x48]
0xdf5676: mov byte ptr [rsp + 0x39], 0
0xdf567b: mov r14, qword ptr [rsi + 0x618]
0xdf5682: mov qword ptr [rsp + 0x40], rbx
0xdf5687: lea rax, [rip + 0xc022]
0xdf568e: mov qword ptr [rsp + 0x48], rax
0xdf5693: mov qword ptr [rsp + 0x50], rdi
0xdf5698: mov word ptr [rsp + 0x58], 0
0xdf569f: mov ecx, dword ptr [r14 + 0x48]
0xdf56a3: mov eax, dword ptr [r14 + 0x4c]
0xdf56a7: cmp eax, ecx
0xdf56a9: ja 0x140df5791
0xdf56af: lea r12d, [rax*2 + 1]
0xdf56b7: add r12d, eax
0xdf56ba: shr r12d, 1
0xdf56bd: cmp r12d, 1
0xdf56c1: cmovb r12d, r15d
0xdf56c5: cmp ecx, r12d
0xdf56c8: cmova r12d, ecx
0xdf56cc: cmp r12d, eax
0xdf56cf: jbe 0x140df5791
0xdf56d5: mov ecx, r12d
0xdf56d8: shl ecx, 5
0xdf56db: mov r8d, edx
0xdf56de: mov rax, qword ptr gs:[0x58]
0xdf56e7: mov rax, qword ptr [rax]
0xdf56ea: add rax, r8
0xdf56ed: mov qword ptr [rbp + 0x60], rax
0xdf56f1: mov edx, 8
0xdf56f6: vzeroupper 
0xdf56f9: cmp byte ptr [rax], 0
0xdf56fc: je 0x140df5705
0xdf56fe: call 0x1447efa78
0xdf5703: jmp 0x140df570a
0xdf5705: call 0x1447ef9b0
0xdf570a: mov r13, rax
0xdf570d: test rax, rax
0xdf5710: jne 0x140df572b
0xdf5712: call 0x141318e70
0xdf5717: xor r9d, r9d
0xdf571a: xor r8d, r8d
0xdf571d: mov edx, r15d
0xdf5720: mov ecx, 0xa0000002
0xdf5725: call qword ptr [rip + 0x43f5a1d]
0xdf572b: mov r15d, edi
0xdf572e: cmp dword ptr [r14 + 0x48], edi
0xdf5732: jbe 0x140df576b
0xdf5734: nop dword ptr [rax]
0xdf5738: nop dword ptr [rax + rax]
0xdf5740: mov ecx, r15d
0xdf5743: shl rcx, 5
0xdf5747: mov rax, qword ptr [r14 + 0x40]
0xdf574b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf5750: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5756: add rcx, qword ptr [r14 + 0x40]
0xdf575a: vzeroupper 
0xdf575d: call 0x14035f1f0
0xdf5762: inc r15d
0xdf5765: cmp r15d, dword ptr [r14 + 0x48]
0xdf5769: jb 0x140df5740
0xdf576b: mov rcx, qword ptr [r14 + 0x40]
0xdf576f: test rcx, rcx
0xdf5772: je 0x140df5789
0xdf5774: mov rax, qword ptr [rbp + 0x60]
0xdf5778: cmp byte ptr [rax], 0
0xdf577b: je 0x140df5784
0xdf577d: call 0x1447f03bc
0xdf5782: jmp 0x140df5789
0xdf5784: call 0x1447f02bc
0xdf5789: mov qword ptr [r14 + 0x40], r13
0xdf578d: mov dword ptr [r14 + 0x4c], r12d
0xdf5791: mov eax, dword ptr [r14 + 0x48]
0xdf5795: shl rax, 5
0xdf5799: add rax, qword ptr [r14 + 0x40]
0xdf579d: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf57a3: vmovups ymmword ptr [rax], ymm0
0xdf57a7: inc dword ptr [r14 + 0x48]
0xdf57ab: mov byte ptr [rsp + 0x59], 0
0xdf57b0: mov r14, qword ptr [rsi + 0x650]
0xdf57b7: mov qword ptr [rsp + 0x20], rbx
0xdf57bc: lea rax, [rip + 0xbf2d]
0xdf57c3: mov qword ptr [rsp + 0x28], rax
0xdf57c8: mov qword ptr [rsp + 0x30], rdi
0xdf57cd: mov word ptr [rsp + 0x38], 0
0xdf57d4: mov ecx, dword ptr [r14 + 0x48]
0xdf57d8: mov eax, dword ptr [r14 + 0x4c]
0xdf57dc: mov r15d, 1
0xdf57e2: cmp eax, ecx
0xdf57e4: ja 0x140df58d7
0xdf57ea: lea r12d, [rax*2 + 1]
0xdf57f2: add r12d, eax
0xdf57f5: shr r12d, 1
0xdf57f8: cmp r12d, r15d
0xdf57fb: cmovb r12d, r15d
0xdf57ff: cmp ecx, r12d
0xdf5802: cmova r12d, ecx
0xdf5806: cmp r12d, eax
0xdf5809: jbe 0x140df58d7
0xdf580f: mov ecx, r12d
0xdf5812: shl ecx, 5
0xdf5815: mov r8d, 0x1fd
0xdf581b: mov rax, qword ptr gs:[0x58]
0xdf5824: mov rax, qword ptr [rax]
0xdf5827: add rax, r8
0xdf582a: mov qword ptr [rbp + 0x60], rax
0xdf582e: mov edx, 8
0xdf5833: vzeroupper 
0xdf5836: cmp byte ptr [rax], 0
0xdf5839: je 0x140df5842
0xdf583b: call 0x1447efa78
0xdf5840: jmp 0x140df5847
0xdf5842: call 0x1447ef9b0
0xdf5847: mov r13, rax
0xdf584a: test rax, rax
0xdf584d: jne 0x140df5868
0xdf584f: call 0x141318e70
0xdf5854: xor r9d, r9d
0xdf5857: xor r8d, r8d
0xdf585a: mov edx, r15d
0xdf585d: mov ecx, 0xa0000002
0xdf5862: call qword ptr [rip + 0x43f58e0]
0xdf5868: mov r15d, edi
0xdf586b: cmp dword ptr [r14 + 0x48], edi
0xdf586f: jbe 0x140df58ab
0xdf5871: nop dword ptr [rax]
0xdf5875: nop word ptr [rax + rax]
0xdf5880: mov ecx, r15d
0xdf5883: shl rcx, 5
0xdf5887: mov rax, qword ptr [r14 + 0x40]
0xdf588b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5890: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5896: add rcx, qword ptr [r14 + 0x40]
0xdf589a: vzeroupper 
0xdf589d: call 0x14035f1f0
0xdf58a2: inc r15d
0xdf58a5: cmp r15d, dword ptr [r14 + 0x48]
0xdf58a9: jb 0x140df5880
0xdf58ab: mov rcx, qword ptr [r14 + 0x40]
0xdf58af: test rcx, rcx
0xdf58b2: je 0x140df58c9
0xdf58b4: mov rax, qword ptr [rbp + 0x60]
0xdf58b8: cmp byte ptr [rax], 0
0xdf58bb: je 0x140df58c4
0xdf58bd: call 0x1447f03bc
0xdf58c2: jmp 0x140df58c9
0xdf58c4: call 0x1447f02bc
0xdf58c9: mov qword ptr [r14 + 0x40], r13
0xdf58cd: mov dword ptr [r14 + 0x4c], r12d
0xdf58d1: mov r15d, 1
0xdf58d7: mov eax, dword ptr [r14 + 0x48]
0xdf58db: shl rax, 5
0xdf58df: add rax, qword ptr [r14 + 0x40]
0xdf58e3: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf58e9: vmovups ymmword ptr [rax], ymm0
0xdf58ed: inc dword ptr [r14 + 0x48]
0xdf58f1: mov byte ptr [rsp + 0x39], 0
0xdf58f6: mov r14, qword ptr [rsi + 0x630]
0xdf58fd: mov qword ptr [rsp + 0x40], rbx
0xdf5902: lea rax, [rip + 0xbe07]
0xdf5909: mov qword ptr [rsp + 0x48], rax
0xdf590e: mov qword ptr [rsp + 0x50], rdi
0xdf5913: mov word ptr [rsp + 0x58], 0
0xdf591a: mov ecx, dword ptr [r14 + 0x48]
0xdf591e: mov eax, dword ptr [r14 + 0x4c]
0xdf5922: cmp eax, ecx
0xdf5924: ja 0x140df5a11
0xdf592a: lea r12d, [rax*2 + 1]
0xdf5932: add r12d, eax
0xdf5935: shr r12d, 1
0xdf5938: cmp r12d, 1
0xdf593c: cmovb r12d, r15d
0xdf5940: cmp ecx, r12d
0xdf5943: cmova r12d, ecx
0xdf5947: cmp r12d, eax
0xdf594a: jbe 0x140df5a11
0xdf5950: mov ecx, r12d
0xdf5953: shl ecx, 5
0xdf5956: mov r8d, 0x1fd
0xdf595c: mov rax, qword ptr gs:[0x58]
0xdf5965: mov rax, qword ptr [rax]
0xdf5968: add rax, r8
0xdf596b: mov qword ptr [rbp + 0x60], rax
0xdf596f: mov edx, 8
0xdf5974: vzeroupper 
0xdf5977: cmp byte ptr [rax], 0
0xdf597a: je 0x140df5983
0xdf597c: call 0x1447efa78
0xdf5981: jmp 0x140df5988
0xdf5983: call 0x1447ef9b0
0xdf5988: mov r13, rax
0xdf598b: test rax, rax
0xdf598e: jne 0x140df59a9
0xdf5990: call 0x141318e70
0xdf5995: xor r9d, r9d
0xdf5998: xor r8d, r8d
0xdf599b: mov edx, r15d
0xdf599e: mov ecx, 0xa0000002
0xdf59a3: call qword ptr [rip + 0x43f579f]
0xdf59a9: mov r15d, edi
0xdf59ac: cmp dword ptr [r14 + 0x48], edi
0xdf59b0: jbe 0x140df59eb
0xdf59b2: nop dword ptr [rax]
0xdf59b6: nop word ptr [rax + rax]
0xdf59c0: mov ecx, r15d
0xdf59c3: shl rcx, 5
0xdf59c7: mov rax, qword ptr [r14 + 0x40]
0xdf59cb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf59d0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf59d6: add rcx, qword ptr [r14 + 0x40]
0xdf59da: vzeroupper 
0xdf59dd: call 0x14035f1f0
0xdf59e2: inc r15d
0xdf59e5: cmp r15d, dword ptr [r14 + 0x48]
0xdf59e9: jb 0x140df59c0
0xdf59eb: mov rcx, qword ptr [r14 + 0x40]
0xdf59ef: test rcx, rcx
0xdf59f2: je 0x140df5a09
0xdf59f4: mov rax, qword ptr [rbp + 0x60]
0xdf59f8: cmp byte ptr [rax], 0
0xdf59fb: je 0x140df5a04
0xdf59fd: call 0x1447f03bc
0xdf5a02: jmp 0x140df5a09
0xdf5a04: call 0x1447f02bc
0xdf5a09: mov qword ptr [r14 + 0x40], r13
0xdf5a0d: mov dword ptr [r14 + 0x4c], r12d
0xdf5a11: mov eax, dword ptr [r14 + 0x48]
0xdf5a15: shl rax, 5
0xdf5a19: add rax, qword ptr [r14 + 0x40]
0xdf5a1d: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf5a23: vmovups ymmword ptr [rax], ymm0
0xdf5a27: inc dword ptr [r14 + 0x48]
0xdf5a2b: mov byte ptr [rsp + 0x59], 0
0xdf5a30: mov rcx, qword ptr [rsi + 0x628]
0xdf5a37: add rcx, 0x40
0xdf5a3b: mov qword ptr [rsp + 0x20], rbx
0xdf5a40: lea r8, [rip + 0xbcd9]
0xdf5a47: mov qword ptr [rsp + 0x28], r8
0xdf5a4c: mov qword ptr [rsp + 0x30], rdi
0xdf5a51: mov word ptr [rsp + 0x38], 0
0xdf5a58: lea rdx, [rsp + 0x20]
0xdf5a5d: vzeroupper 
0xdf5a60: call 0x140476290
0xdf5a65: nop 
0xdf5a66: mov byte ptr [rsp + 0x39], 0
0xdf5a6b: mov r14, qword ptr [rsi + 0x620]
0xdf5a72: mov qword ptr [rbp - 0x60], rbx
0xdf5a76: lea rax, [rip + 0xbcd3]
0xdf5a7d: mov qword ptr [rbp - 0x58], rax
0xdf5a81: mov qword ptr [rbp - 0x50], rdi
0xdf5a85: mov word ptr [rbp - 0x48], 0
0xdf5a8b: mov ecx, dword ptr [r14 + 0x48]
0xdf5a8f: mov eax, dword ptr [r14 + 0x4c]
0xdf5a93: mov r15d, 1
0xdf5a99: cmp eax, ecx
0xdf5a9b: ja 0x140df5b87
0xdf5aa1: lea r12d, [rax*2 + 1]
0xdf5aa9: add r12d, eax
0xdf5aac: shr r12d, 1
0xdf5aaf: cmp r12d, r15d
0xdf5ab2: cmovb r12d, r15d
0xdf5ab6: cmp ecx, r12d
0xdf5ab9: cmova r12d, ecx
0xdf5abd: cmp r12d, eax
0xdf5ac0: jbe 0x140df5b87
0xdf5ac6: mov ecx, r12d
0xdf5ac9: shl ecx, 5
0xdf5acc: mov r8d, 0x1fd
0xdf5ad2: mov rax, qword ptr gs:[0x58]
0xdf5adb: mov rax, qword ptr [rax]
0xdf5ade: add rax, r8
0xdf5ae1: mov qword ptr [rbp + 0x60], rax
0xdf5ae5: mov edx, 8
0xdf5aea: cmp byte ptr [rax], 0
0xdf5aed: je 0x140df5af6
0xdf5aef: call 0x1447efa78
0xdf5af4: jmp 0x140df5afb
0xdf5af6: call 0x1447ef9b0
0xdf5afb: mov r13, rax
0xdf5afe: test rax, rax
0xdf5b01: jne 0x140df5b1c
0xdf5b03: call 0x141318e70
0xdf5b08: xor r9d, r9d
0xdf5b0b: xor r8d, r8d
0xdf5b0e: mov edx, r15d
0xdf5b11: mov ecx, 0xa0000002
0xdf5b16: call qword ptr [rip + 0x43f562c]
0xdf5b1c: mov r15d, edi
0xdf5b1f: cmp dword ptr [r14 + 0x48], edi
0xdf5b23: jbe 0x140df5b5b
0xdf5b25: nop word ptr [rax + rax]
0xdf5b30: mov ecx, r15d
0xdf5b33: shl rcx, 5
0xdf5b37: mov rax, qword ptr [r14 + 0x40]
0xdf5b3b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5b40: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5b46: add rcx, qword ptr [r14 + 0x40]
0xdf5b4a: vzeroupper 
0xdf5b4d: call 0x14035f1f0
0xdf5b52: inc r15d
0xdf5b55: cmp r15d, dword ptr [r14 + 0x48]
0xdf5b59: jb 0x140df5b30
0xdf5b5b: mov rcx, qword ptr [r14 + 0x40]
0xdf5b5f: test rcx, rcx
0xdf5b62: je 0x140df5b79
0xdf5b64: mov rax, qword ptr [rbp + 0x60]
0xdf5b68: cmp byte ptr [rax], 0
0xdf5b6b: je 0x140df5b74
0xdf5b6d: call 0x1447f03bc
0xdf5b72: jmp 0x140df5b79
0xdf5b74: call 0x1447f02bc
0xdf5b79: mov qword ptr [r14 + 0x40], r13
0xdf5b7d: mov dword ptr [r14 + 0x4c], r12d
0xdf5b81: mov r15d, 1
0xdf5b87: mov eax, dword ptr [r14 + 0x48]
0xdf5b8b: shl rax, 5
0xdf5b8f: add rax, qword ptr [r14 + 0x40]
0xdf5b93: vmovups ymm0, ymmword ptr [rbp - 0x60]
0xdf5b98: vmovups ymmword ptr [rax], ymm0
0xdf5b9c: inc dword ptr [r14 + 0x48]
0xdf5ba0: mov byte ptr [rbp - 0x47], 0
0xdf5ba4: mov r14, qword ptr [rsi + 0x638]
0xdf5bab: mov qword ptr [rsp + 0x20], rbx
0xdf5bb0: lea rax, [rip + 0xbbb9]
0xdf5bb7: mov qword ptr [rsp + 0x28], rax
0xdf5bbc: mov qword ptr [rsp + 0x30], rdi
0xdf5bc1: mov word ptr [rsp + 0x38], 0
0xdf5bc8: mov ecx, dword ptr [r14 + 0x48]
0xdf5bcc: mov eax, dword ptr [r14 + 0x4c]
0xdf5bd0: cmp eax, ecx
0xdf5bd2: ja 0x140df5cb1
0xdf5bd8: lea r12d, [rax*2 + 1]
0xdf5be0: add r12d, eax
0xdf5be3: shr r12d, 1
0xdf5be6: cmp r12d, 1
0xdf5bea: cmovb r12d, r15d
0xdf5bee: cmp ecx, r12d
0xdf5bf1: cmova r12d, ecx
0xdf5bf5: cmp r12d, eax
0xdf5bf8: jbe 0x140df5cb1
0xdf5bfe: mov ecx, r12d
0xdf5c01: shl ecx, 5
0xdf5c04: mov r8d, 0x1fd
0xdf5c0a: mov rax, qword ptr gs:[0x58]
0xdf5c13: mov rax, qword ptr [rax]
0xdf5c16: add rax, r8
0xdf5c19: mov qword ptr [rbp + 0x60], rax
0xdf5c1d: mov edx, 8
0xdf5c22: vzeroupper 
0xdf5c25: cmp byte ptr [rax], 0
0xdf5c28: je 0x140df5c31
0xdf5c2a: call 0x1447efa78
0xdf5c2f: jmp 0x140df5c36
0xdf5c31: call 0x1447ef9b0
0xdf5c36: mov r13, rax
0xdf5c39: test rax, rax
0xdf5c3c: jne 0x140df5c57
0xdf5c3e: call 0x141318e70
0xdf5c43: xor r9d, r9d
0xdf5c46: xor r8d, r8d
0xdf5c49: mov edx, r15d
0xdf5c4c: mov ecx, 0xa0000002
0xdf5c51: call qword ptr [rip + 0x43f54f1]
0xdf5c57: mov r15d, edi
0xdf5c5a: cmp dword ptr [r14 + 0x48], edi
0xdf5c5e: jbe 0x140df5c8b
0xdf5c60: mov ecx, r15d
0xdf5c63: shl rcx, 5
0xdf5c67: mov rax, qword ptr [r14 + 0x40]
0xdf5c6b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5c70: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5c76: add rcx, qword ptr [r14 + 0x40]
0xdf5c7a: vzeroupper 
0xdf5c7d: call 0x14035f1f0
0xdf5c82: inc r15d
0xdf5c85: cmp r15d, dword ptr [r14 + 0x48]
0xdf5c89: jb 0x140df5c60
0xdf5c8b: mov rcx, qword ptr [r14 + 0x40]
0xdf5c8f: test rcx, rcx
0xdf5c92: je 0x140df5ca9
0xdf5c94: mov rax, qword ptr [rbp + 0x60]
0xdf5c98: cmp byte ptr [rax], 0
0xdf5c9b: je 0x140df5ca4
0xdf5c9d: call 0x1447f03bc
0xdf5ca2: jmp 0x140df5ca9
0xdf5ca4: call 0x1447f02bc
0xdf5ca9: mov qword ptr [r14 + 0x40], r13
0xdf5cad: mov dword ptr [r14 + 0x4c], r12d
0xdf5cb1: mov eax, dword ptr [r14 + 0x48]
0xdf5cb5: shl rax, 5
0xdf5cb9: add rax, qword ptr [r14 + 0x40]
0xdf5cbd: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf5cc3: vmovups ymmword ptr [rax], ymm0
0xdf5cc7: inc dword ptr [r14 + 0x48]
0xdf5ccb: mov byte ptr [rsp + 0x39], 0
0xdf5cd0: mov r14, qword ptr [rsi + 0x640]
0xdf5cd7: mov qword ptr [rsp + 0x40], rbx
0xdf5cdc: lea rax, [rip + 0xbaad]
0xdf5ce3: mov qword ptr [rsp + 0x48], rax
0xdf5ce8: mov qword ptr [rsp + 0x50], rdi
0xdf5ced: mov word ptr [rsp + 0x58], 0
0xdf5cf4: mov ecx, dword ptr [r14 + 0x48]
0xdf5cf8: mov eax, dword ptr [r14 + 0x4c]
0xdf5cfc: mov r15d, 1
0xdf5d02: cmp eax, ecx
0xdf5d04: ja 0x140df5df7
0xdf5d0a: lea r12d, [rax*2 + 1]
0xdf5d12: add r12d, eax
0xdf5d15: shr r12d, 1
0xdf5d18: cmp r12d, r15d
0xdf5d1b: cmovb r12d, r15d
0xdf5d1f: cmp ecx, r12d
0xdf5d22: cmova r12d, ecx
0xdf5d26: cmp r12d, eax
0xdf5d29: jbe 0x140df5df7
0xdf5d2f: mov ecx, r12d
0xdf5d32: shl ecx, 5
0xdf5d35: mov r8d, 0x1fd
0xdf5d3b: mov rax, qword ptr gs:[0x58]
0xdf5d44: mov rax, qword ptr [rax]
0xdf5d47: add rax, r8
0xdf5d4a: mov qword ptr [rbp + 0x60], rax
0xdf5d4e: mov edx, 8
0xdf5d53: vzeroupper 
0xdf5d56: cmp byte ptr [rax], 0
0xdf5d59: je 0x140df5d62
0xdf5d5b: call 0x1447efa78
0xdf5d60: jmp 0x140df5d67
0xdf5d62: call 0x1447ef9b0
0xdf5d67: mov r13, rax
0xdf5d6a: test rax, rax
0xdf5d6d: jne 0x140df5d88
0xdf5d6f: call 0x141318e70
0xdf5d74: xor r9d, r9d
0xdf5d77: xor r8d, r8d
0xdf5d7a: mov edx, r15d
0xdf5d7d: mov ecx, 0xa0000002
0xdf5d82: call qword ptr [rip + 0x43f53c0]
0xdf5d88: mov r15d, edi
0xdf5d8b: cmp dword ptr [r14 + 0x48], edi
0xdf5d8f: jbe 0x140df5dcb
0xdf5d91: nop dword ptr [rax]
0xdf5d95: nop word ptr [rax + rax]
0xdf5da0: mov ecx, r15d
0xdf5da3: shl rcx, 5
0xdf5da7: mov rax, qword ptr [r14 + 0x40]
0xdf5dab: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5db0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5db6: add rcx, qword ptr [r14 + 0x40]
0xdf5dba: vzeroupper 
0xdf5dbd: call 0x14035f1f0
0xdf5dc2: inc r15d
0xdf5dc5: cmp r15d, dword ptr [r14 + 0x48]
0xdf5dc9: jb 0x140df5da0
0xdf5dcb: mov rcx, qword ptr [r14 + 0x40]
0xdf5dcf: test rcx, rcx
0xdf5dd2: je 0x140df5de9
0xdf5dd4: mov rax, qword ptr [rbp + 0x60]
0xdf5dd8: cmp byte ptr [rax], 0
0xdf5ddb: je 0x140df5de4
0xdf5ddd: call 0x1447f03bc
0xdf5de2: jmp 0x140df5de9
0xdf5de4: call 0x1447f02bc
0xdf5de9: mov qword ptr [r14 + 0x40], r13
0xdf5ded: mov dword ptr [r14 + 0x4c], r12d
0xdf5df1: mov r15d, 1
0xdf5df7: mov eax, dword ptr [r14 + 0x48]
0xdf5dfb: shl rax, 5
0xdf5dff: add rax, qword ptr [r14 + 0x40]
0xdf5e03: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf5e09: vmovups ymmword ptr [rax], ymm0
0xdf5e0d: inc dword ptr [r14 + 0x48]
0xdf5e11: mov byte ptr [rsp + 0x59], 0
0xdf5e16: mov r14, qword ptr [rsi + 0x648]
0xdf5e1d: mov qword ptr [rsp + 0x20], rbx
0xdf5e22: lea rax, [rip + 0xb977]
0xdf5e29: mov qword ptr [rsp + 0x28], rax
0xdf5e2e: mov qword ptr [rsp + 0x30], rdi
0xdf5e33: mov word ptr [rsp + 0x38], 0
0xdf5e3a: mov ecx, dword ptr [r14 + 0x48]
0xdf5e3e: mov eax, dword ptr [r14 + 0x4c]
0xdf5e42: cmp eax, ecx
0xdf5e44: ja 0x140df5f31
0xdf5e4a: lea r12d, [rax*2 + 1]
0xdf5e52: add r12d, eax
0xdf5e55: shr r12d, 1
0xdf5e58: cmp r12d, 1
0xdf5e5c: cmovb r12d, r15d
0xdf5e60: cmp ecx, r12d
0xdf5e63: cmova r12d, ecx
0xdf5e67: cmp r12d, eax
0xdf5e6a: jbe 0x140df5f31
0xdf5e70: mov ecx, r12d
0xdf5e73: shl ecx, 5
0xdf5e76: mov r8d, 0x1fd
0xdf5e7c: mov rax, qword ptr gs:[0x58]
0xdf5e85: mov rax, qword ptr [rax]
0xdf5e88: add rax, r8
0xdf5e8b: mov qword ptr [rbp + 0x60], rax
0xdf5e8f: mov edx, 8
0xdf5e94: vzeroupper 
0xdf5e97: cmp byte ptr [rax], 0
0xdf5e9a: je 0x140df5ea3
0xdf5e9c: call 0x1447efa78
0xdf5ea1: jmp 0x140df5ea8
0xdf5ea3: call 0x1447ef9b0
0xdf5ea8: mov r13, rax
0xdf5eab: test rax, rax
0xdf5eae: jne 0x140df5ec9
0xdf5eb0: call 0x141318e70
0xdf5eb5: xor r9d, r9d
0xdf5eb8: xor r8d, r8d
0xdf5ebb: mov edx, r15d
0xdf5ebe: mov ecx, 0xa0000002
0xdf5ec3: call qword ptr [rip + 0x43f527f]
0xdf5ec9: mov r15d, edi
0xdf5ecc: cmp dword ptr [r14 + 0x48], edi
0xdf5ed0: jbe 0x140df5f0b
0xdf5ed2: nop dword ptr [rax]
0xdf5ed6: nop word ptr [rax + rax]
0xdf5ee0: mov ecx, r15d
0xdf5ee3: shl rcx, 5
0xdf5ee7: mov rax, qword ptr [r14 + 0x40]
0xdf5eeb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5ef0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5ef6: add rcx, qword ptr [r14 + 0x40]
0xdf5efa: vzeroupper 
0xdf5efd: call 0x14035f1f0
0xdf5f02: inc r15d
0xdf5f05: cmp r15d, dword ptr [r14 + 0x48]
0xdf5f09: jb 0x140df5ee0
0xdf5f0b: mov rcx, qword ptr [r14 + 0x40]
0xdf5f0f: test rcx, rcx
0xdf5f12: je 0x140df5f29
0xdf5f14: mov rax, qword ptr [rbp + 0x60]
0xdf5f18: cmp byte ptr [rax], 0
0xdf5f1b: je 0x140df5f24
0xdf5f1d: call 0x1447f03bc
0xdf5f22: jmp 0x140df5f29
0xdf5f24: call 0x1447f02bc
0xdf5f29: mov qword ptr [r14 + 0x40], r13
0xdf5f2d: mov dword ptr [r14 + 0x4c], r12d
0xdf5f31: mov eax, dword ptr [r14 + 0x48]
0xdf5f35: shl rax, 5
0xdf5f39: add rax, qword ptr [r14 + 0x40]
0xdf5f3d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf5f43: vmovups ymmword ptr [rax], ymm0
0xdf5f47: inc dword ptr [r14 + 0x48]
0xdf5f4b: mov byte ptr [rsp + 0x39], 0
0xdf5f50: mov r14, qword ptr [rsi + 0x658]
0xdf5f57: mov qword ptr [rsp + 0x40], rbx
0xdf5f5c: lea rax, [rip + 0xb84d]
0xdf5f63: mov qword ptr [rsp + 0x48], rax
0xdf5f68: mov qword ptr [rsp + 0x50], rdi
0xdf5f6d: mov word ptr [rsp + 0x58], 0
0xdf5f74: mov ecx, dword ptr [r14 + 0x48]
0xdf5f78: mov eax, dword ptr [r14 + 0x4c]
0xdf5f7c: mov r15d, 1
0xdf5f82: cmp eax, ecx
0xdf5f84: ja 0x140df6077
0xdf5f8a: lea r12d, [rax*2 + 1]
0xdf5f92: add r12d, eax
0xdf5f95: shr r12d, 1
0xdf5f98: cmp r12d, r15d
0xdf5f9b: cmovb r12d, r15d
0xdf5f9f: cmp ecx, r12d
0xdf5fa2: cmova r12d, ecx
0xdf5fa6: cmp r12d, eax
0xdf5fa9: jbe 0x140df6077
0xdf5faf: mov ecx, r12d
0xdf5fb2: shl ecx, 5
0xdf5fb5: mov r8d, 0x1fd
0xdf5fbb: mov rax, qword ptr gs:[0x58]
0xdf5fc4: mov rax, qword ptr [rax]
0xdf5fc7: add rax, r8
0xdf5fca: mov qword ptr [rbp + 0x60], rax
0xdf5fce: mov edx, 8
0xdf5fd3: vzeroupper 
0xdf5fd6: cmp byte ptr [rax], 0
0xdf5fd9: je 0x140df5fe2
0xdf5fdb: call 0x1447efa78
0xdf5fe0: jmp 0x140df5fe7
0xdf5fe2: call 0x1447ef9b0
0xdf5fe7: mov r13, rax
0xdf5fea: test rax, rax
0xdf5fed: jne 0x140df6008
0xdf5fef: call 0x141318e70
0xdf5ff4: xor r9d, r9d
0xdf5ff7: xor r8d, r8d
0xdf5ffa: mov edx, r15d
0xdf5ffd: mov ecx, 0xa0000002
0xdf6002: call qword ptr [rip + 0x43f5140]
0xdf6008: mov r15d, edi
0xdf600b: cmp dword ptr [r14 + 0x48], edi
0xdf600f: jbe 0x140df604b
0xdf6011: nop dword ptr [rax]
0xdf6015: nop word ptr [rax + rax]
0xdf6020: mov ecx, r15d
0xdf6023: shl rcx, 5
0xdf6027: mov rax, qword ptr [r14 + 0x40]
0xdf602b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6030: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6036: add rcx, qword ptr [r14 + 0x40]
0xdf603a: vzeroupper 
0xdf603d: call 0x14035f1f0
0xdf6042: inc r15d
0xdf6045: cmp r15d, dword ptr [r14 + 0x48]
0xdf6049: jb 0x140df6020
0xdf604b: mov rcx, qword ptr [r14 + 0x40]
0xdf604f: test rcx, rcx
0xdf6052: je 0x140df6069
0xdf6054: mov rax, qword ptr [rbp + 0x60]
0xdf6058: cmp byte ptr [rax], 0
0xdf605b: je 0x140df6064
0xdf605d: call 0x1447f03bc
0xdf6062: jmp 0x140df6069
0xdf6064: call 0x1447f02bc
0xdf6069: mov qword ptr [r14 + 0x40], r13
0xdf606d: mov dword ptr [r14 + 0x4c], r12d
0xdf6071: mov r15d, 1
0xdf6077: mov eax, dword ptr [r14 + 0x48]
0xdf607b: shl rax, 5
0xdf607f: add rax, qword ptr [r14 + 0x40]
0xdf6083: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf6089: vmovups ymmword ptr [rax], ymm0
0xdf608d: inc dword ptr [r14 + 0x48]
0xdf6091: mov byte ptr [rsp + 0x59], 0
0xdf6096: mov r14, qword ptr [rsi + 0x670]
0xdf609d: mov qword ptr [rsp + 0x20], rbx
0xdf60a2: lea rax, [rip + 0xb717]
0xdf60a9: mov qword ptr [rsp + 0x28], rax
0xdf60ae: mov qword ptr [rsp + 0x30], rdi
0xdf60b3: mov word ptr [rsp + 0x38], 0
0xdf60ba: mov ecx, dword ptr [r14 + 0x48]
0xdf60be: mov eax, dword ptr [r14 + 0x4c]
0xdf60c2: cmp eax, ecx
0xdf60c4: ja 0x140df61b1
0xdf60ca: lea r12d, [rax*2 + 1]
0xdf60d2: add r12d, eax
0xdf60d5: shr r12d, 1
0xdf60d8: cmp r12d, 1
0xdf60dc: cmovb r12d, r15d
0xdf60e0: cmp ecx, r12d
0xdf60e3: cmova r12d, ecx
0xdf60e7: cmp r12d, eax
0xdf60ea: jbe 0x140df61b1
0xdf60f0: mov ecx, r12d
0xdf60f3: shl ecx, 5
0xdf60f6: mov r8d, 0x1fd
0xdf60fc: mov rax, qword ptr gs:[0x58]
0xdf6105: mov rax, qword ptr [rax]
0xdf6108: add rax, r8
0xdf610b: mov qword ptr [rbp + 0x60], rax
0xdf610f: mov edx, 8
0xdf6114: vzeroupper 
0xdf6117: cmp byte ptr [rax], 0
0xdf611a: je 0x140df6123
0xdf611c: call 0x1447efa78
0xdf6121: jmp 0x140df6128
0xdf6123: call 0x1447ef9b0
0xdf6128: mov r13, rax
0xdf612b: test rax, rax
0xdf612e: jne 0x140df6149
0xdf6130: call 0x141318e70
0xdf6135: xor r9d, r9d
0xdf6138: xor r8d, r8d
0xdf613b: mov edx, r15d
0xdf613e: mov ecx, 0xa0000002
0xdf6143: call qword ptr [rip + 0x43f4fff]
0xdf6149: mov r15d, edi
0xdf614c: cmp dword ptr [r14 + 0x48], edi
0xdf6150: jbe 0x140df618b
0xdf6152: nop dword ptr [rax]
0xdf6156: nop word ptr [rax + rax]
0xdf6160: mov ecx, r15d
0xdf6163: shl rcx, 5
0xdf6167: mov rax, qword ptr [r14 + 0x40]
0xdf616b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6170: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6176: add rcx, qword ptr [r14 + 0x40]
0xdf617a: vzeroupper 
0xdf617d: call 0x14035f1f0
0xdf6182: inc r15d
0xdf6185: cmp r15d, dword ptr [r14 + 0x48]
0xdf6189: jb 0x140df6160
0xdf618b: mov rcx, qword ptr [r14 + 0x40]
0xdf618f: test rcx, rcx
0xdf6192: je 0x140df61a9
0xdf6194: mov rax, qword ptr [rbp + 0x60]
0xdf6198: cmp byte ptr [rax], 0
0xdf619b: je 0x140df61a4
0xdf619d: call 0x1447f03bc
0xdf61a2: jmp 0x140df61a9
0xdf61a4: call 0x1447f02bc
0xdf61a9: mov qword ptr [r14 + 0x40], r13
0xdf61ad: mov dword ptr [r14 + 0x4c], r12d
0xdf61b1: mov eax, dword ptr [r14 + 0x48]
0xdf61b5: shl rax, 5
0xdf61b9: add rax, qword ptr [r14 + 0x40]
0xdf61bd: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf61c3: vmovups ymmword ptr [rax], ymm0
0xdf61c7: inc dword ptr [r14 + 0x48]
0xdf61cb: mov byte ptr [rsp + 0x39], 0
0xdf61d0: mov rcx, qword ptr [rsi + 0xc8]
0xdf61d7: add rcx, 0x40
0xdf61db: mov qword ptr [rsp + 0x40], rbx
0xdf61e0: lea r8, [rip + 0xb5e9]
0xdf61e7: mov qword ptr [rsp + 0x48], r8
0xdf61ec: mov qword ptr [rsp + 0x50], rdi
0xdf61f1: mov word ptr [rsp + 0x58], 0
0xdf61f8: lea rdx, [rsp + 0x40]
0xdf61fd: vzeroupper 
0xdf6200: call 0x140476290
0xdf6205: nop 
0xdf6206: mov byte ptr [rsp + 0x59], 0
0xdf620b: mov rcx, qword ptr [rsi + 0x108]
0xdf6212: add rcx, 0x40
0xdf6216: mov qword ptr [rbp - 0x60], rbx
0xdf621a: lea r8, [rip + 0xb5bf]
0xdf6221: mov qword ptr [rbp - 0x58], r8
0xdf6225: mov qword ptr [rbp - 0x50], rdi
0xdf6229: mov word ptr [rbp - 0x48], 0
0xdf622f: lea rdx, [rbp - 0x60]
0xdf6233: call 0x140476290
0xdf6238: nop 
0xdf6239: mov byte ptr [rbp - 0x47], 0
0xdf623d: mov rcx, qword ptr [rsi + 0xd0]
0xdf6244: add rcx, 0x40
0xdf6248: mov qword ptr [rsp + 0x60], rbx
0xdf624d: lea rdx, [rip + 0xb59c]
0xdf6254: mov qword ptr [rsp + 0x68], rdx
0xdf6259: mov qword ptr [rsp + 0x70], rdi
0xdf625e: mov word ptr [rsp + 0x78], 0
0xdf6265: lea rdx, [rsp + 0x60]
0xdf626a: call 0x140476290
0xdf626f: nop 
0xdf6270: mov byte ptr [rsp + 0x79], 0
0xdf6275: mov r14, qword ptr [rsi + 0xe0]
0xdf627c: mov qword ptr [rbp - 0x80], rbx
0xdf6280: lea rdx, [rip + 0xb579]
0xdf6287: mov qword ptr [rbp - 0x78], rdx
0xdf628b: mov qword ptr [rbp - 0x70], rdi
0xdf628f: mov word ptr [rbp - 0x68], 0
0xdf6295: mov ecx, dword ptr [r14 + 0x48]
0xdf6299: mov eax, dword ptr [r14 + 0x4c]
0xdf629d: mov r15d, 1
0xdf62a3: cmp eax, ecx
0xdf62a5: ja 0x140df6387
0xdf62ab: lea r12d, [rax*2 + 1]
0xdf62b3: add r12d, eax
0xdf62b6: shr r12d, 1
0xdf62b9: cmp r12d, r15d
0xdf62bc: cmovb r12d, r15d
0xdf62c0: cmp ecx, r12d
0xdf62c3: cmova r12d, ecx
0xdf62c7: cmp r12d, eax
0xdf62ca: jbe 0x140df6387
0xdf62d0: mov ecx, r12d
0xdf62d3: shl ecx, 5
0xdf62d6: mov r8d, 0x1fd
0xdf62dc: mov rax, qword ptr gs:[0x58]
0xdf62e5: mov rax, qword ptr [rax]
0xdf62e8: add rax, r8
0xdf62eb: mov qword ptr [rbp + 0x60], rax
0xdf62ef: mov edx, 8
0xdf62f4: cmp byte ptr [rax], 0
0xdf62f7: je 0x140df6300
0xdf62f9: call 0x1447efa78
0xdf62fe: jmp 0x140df6305
0xdf6300: call 0x1447ef9b0
0xdf6305: mov r13, rax
0xdf6308: test rax, rax
0xdf630b: jne 0x140df6326
0xdf630d: call 0x141318e70
0xdf6312: xor r9d, r9d
0xdf6315: xor r8d, r8d
0xdf6318: mov edx, r15d
0xdf631b: mov ecx, 0xa0000002
0xdf6320: call qword ptr [rip + 0x43f4e22]
0xdf6326: mov r15d, edi
0xdf6329: cmp dword ptr [r14 + 0x48], edi
0xdf632d: jbe 0x140df635b
0xdf632f: nop 
0xdf6330: mov ecx, r15d
0xdf6333: shl rcx, 5
0xdf6337: mov rax, qword ptr [r14 + 0x40]
0xdf633b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6340: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6346: add rcx, qword ptr [r14 + 0x40]
0xdf634a: vzeroupper 
0xdf634d: call 0x14035f1f0
0xdf6352: inc r15d
0xdf6355: cmp r15d, dword ptr [r14 + 0x48]
0xdf6359: jb 0x140df6330
0xdf635b: mov rcx, qword ptr [r14 + 0x40]
0xdf635f: test rcx, rcx
0xdf6362: je 0x140df6379
0xdf6364: mov rax, qword ptr [rbp + 0x60]
0xdf6368: cmp byte ptr [rax], 0
0xdf636b: je 0x140df6374
0xdf636d: call 0x1447f03bc
0xdf6372: jmp 0x140df6379
0xdf6374: call 0x1447f02bc
0xdf6379: mov qword ptr [r14 + 0x40], r13
0xdf637d: mov dword ptr [r14 + 0x4c], r12d
0xdf6381: mov r15d, 1
0xdf6387: mov eax, dword ptr [r14 + 0x48]
0xdf638b: shl rax, 5
0xdf638f: add rax, qword ptr [r14 + 0x40]
0xdf6393: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6398: vmovups ymmword ptr [rax], ymm0
0xdf639c: inc dword ptr [r14 + 0x48]
0xdf63a0: mov byte ptr [rbp - 0x67], 0
0xdf63a4: mov rcx, qword ptr [rsi + 0xe8]
0xdf63ab: add rcx, 0x40
0xdf63af: mov qword ptr [rsp + 0x60], rbx
0xdf63b4: lea r8, [rip + 0xb4b5]
0xdf63bb: mov qword ptr [rsp + 0x68], r8
0xdf63c0: mov qword ptr [rsp + 0x70], rdi
0xdf63c5: mov word ptr [rsp + 0x78], 0
0xdf63cc: lea rdx, [rsp + 0x60]
0xdf63d1: vzeroupper 
0xdf63d4: call 0x140476290
0xdf63d9: nop 
0xdf63da: mov byte ptr [rsp + 0x79], 0
0xdf63df: mov rcx, qword ptr [rsi + 0x9e0]
0xdf63e6: add rcx, 0x40
0xdf63ea: mov qword ptr [rsp + 0x20], rbx
0xdf63ef: lea r8, [rip + 0xb49a]
0xdf63f6: mov qword ptr [rsp + 0x28], r8
0xdf63fb: mov qword ptr [rsp + 0x30], rdi
0xdf6400: mov word ptr [rsp + 0x38], 0
0xdf6407: lea rdx, [rsp + 0x20]
0xdf640c: call 0x140476290
0xdf6411: nop 
0xdf6412: mov byte ptr [rsp + 0x39], 0
0xdf6417: mov rcx, qword ptr [rsi + 0x358]
0xdf641e: add rcx, 0x40
0xdf6422: mov qword ptr [rsp + 0x40], rbx
0xdf6427: lea rdx, [rip + 0xb472]
0xdf642e: mov qword ptr [rsp + 0x48], rdx
0xdf6433: mov qword ptr [rsp + 0x50], rdi
0xdf6438: mov word ptr [rsp + 0x58], 0
0xdf643f: lea rdx, [rsp + 0x40]
0xdf6444: call 0x140476290
0xdf6449: nop 
0xdf644a: mov byte ptr [rsp + 0x59], 0
0xdf644f: mov r14, qword ptr [rsi + 0xd8]
0xdf6456: mov qword ptr [rbp - 0x60], rbx
0xdf645a: lea rdx, [rip + 0xb44f]
0xdf6461: mov qword ptr [rbp - 0x58], rdx
0xdf6465: mov qword ptr [rbp - 0x50], rdi
0xdf6469: mov word ptr [rbp - 0x48], 0
0xdf646f: mov ecx, dword ptr [r14 + 0x48]
0xdf6473: mov eax, dword ptr [r14 + 0x4c]
0xdf6477: cmp eax, ecx
0xdf6479: ja 0x140df6561
0xdf647f: lea r12d, [rax*2 + 1]
0xdf6487: add r12d, eax
0xdf648a: shr r12d, 1
0xdf648d: cmp r12d, 1
0xdf6491: cmovb r12d, r15d
0xdf6495: cmp ecx, r12d
0xdf6498: cmova r12d, ecx
0xdf649c: cmp r12d, eax
0xdf649f: jbe 0x140df6561
0xdf64a5: mov ecx, r12d
0xdf64a8: shl ecx, 5
0xdf64ab: mov r8d, 0x1fd
0xdf64b1: mov rax, qword ptr gs:[0x58]
0xdf64ba: mov rax, qword ptr [rax]
0xdf64bd: add rax, r8
0xdf64c0: mov qword ptr [rbp + 0x60], rax
0xdf64c4: mov edx, 8
0xdf64c9: cmp byte ptr [rax], 0
0xdf64cc: je 0x140df64d5
0xdf64ce: call 0x1447efa78
0xdf64d3: jmp 0x140df64da
0xdf64d5: call 0x1447ef9b0
0xdf64da: mov r13, rax
0xdf64dd: test rax, rax
0xdf64e0: jne 0x140df64fb
0xdf64e2: call 0x141318e70
0xdf64e7: xor r9d, r9d
0xdf64ea: xor r8d, r8d
0xdf64ed: mov edx, r15d
0xdf64f0: mov ecx, 0xa0000002
0xdf64f5: call qword ptr [rip + 0x43f4c4d]
0xdf64fb: mov r15d, edi
0xdf64fe: cmp dword ptr [r14 + 0x48], edi
0xdf6502: jbe 0x140df653b
0xdf6504: nop dword ptr [rax]
0xdf6508: nop dword ptr [rax + rax]
0xdf6510: mov ecx, r15d
0xdf6513: shl rcx, 5
0xdf6517: mov rax, qword ptr [r14 + 0x40]
0xdf651b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6520: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6526: add rcx, qword ptr [r14 + 0x40]
0xdf652a: vzeroupper 
0xdf652d: call 0x14035f1f0
0xdf6532: inc r15d
0xdf6535: cmp r15d, dword ptr [r14 + 0x48]
0xdf6539: jb 0x140df6510
0xdf653b: mov rcx, qword ptr [r14 + 0x40]
0xdf653f: test rcx, rcx
0xdf6542: je 0x140df6559
0xdf6544: mov rax, qword ptr [rbp + 0x60]
0xdf6548: cmp byte ptr [rax], 0
0xdf654b: je 0x140df6554
0xdf654d: call 0x1447f03bc
0xdf6552: jmp 0x140df6559
0xdf6554: call 0x1447f02bc
0xdf6559: mov qword ptr [r14 + 0x40], r13
0xdf655d: mov dword ptr [r14 + 0x4c], r12d
0xdf6561: mov eax, dword ptr [r14 + 0x48]
0xdf6565: shl rax, 5
0xdf6569: add rax, qword ptr [r14 + 0x40]
0xdf656d: vmovups ymm0, ymmword ptr [rbp - 0x60]
0xdf6572: vmovups ymmword ptr [rax], ymm0
0xdf6576: inc dword ptr [r14 + 0x48]
0xdf657a: mov byte ptr [rbp - 0x47], 0
0xdf657e: mov r14, qword ptr [rsi + 0x660]
0xdf6585: mov qword ptr [rbp - 0x80], rbx
0xdf6589: lea rax, [rip + 0xb400]
0xdf6590: mov qword ptr [rbp - 0x78], rax
0xdf6594: mov qword ptr [rbp - 0x70], rdi
0xdf6598: mov word ptr [rbp - 0x68], 0
0xdf659e: mov ecx, dword ptr [r14 + 0x48]
0xdf65a2: mov eax, dword ptr [r14 + 0x4c]
0xdf65a6: mov r15d, 1
0xdf65ac: cmp eax, ecx
0xdf65ae: ja 0x140df6697
0xdf65b4: lea r12d, [rax*2 + 1]
0xdf65bc: add r12d, eax
0xdf65bf: shr r12d, 1
0xdf65c2: cmp r12d, r15d
0xdf65c5: cmovb r12d, r15d
0xdf65c9: cmp ecx, r12d
0xdf65cc: cmova r12d, ecx
0xdf65d0: cmp r12d, eax
0xdf65d3: jbe 0x140df6697
0xdf65d9: mov ecx, r12d
0xdf65dc: shl ecx, 5
0xdf65df: mov r8d, 0x1fd
0xdf65e5: mov rax, qword ptr gs:[0x58]
0xdf65ee: mov rax, qword ptr [rax]
0xdf65f1: add rax, r8
0xdf65f4: mov qword ptr [rbp + 0x60], rax
0xdf65f8: mov edx, 8
0xdf65fd: vzeroupper 
0xdf6600: cmp byte ptr [rax], 0
0xdf6603: je 0x140df660c
0xdf6605: call 0x1447efa78
0xdf660a: jmp 0x140df6611
0xdf660c: call 0x1447ef9b0
0xdf6611: mov r13, rax
0xdf6614: test rax, rax
0xdf6617: jne 0x140df6632
0xdf6619: call 0x141318e70
0xdf661e: xor r9d, r9d
0xdf6621: xor r8d, r8d
0xdf6624: mov edx, r15d
0xdf6627: mov ecx, 0xa0000002
0xdf662c: call qword ptr [rip + 0x43f4b16]
0xdf6632: mov r15d, edi
0xdf6635: cmp dword ptr [r14 + 0x48], edi
0xdf6639: jbe 0x140df666b
0xdf663b: nop dword ptr [rax + rax]
0xdf6640: mov ecx, r15d
0xdf6643: shl rcx, 5
0xdf6647: mov rax, qword ptr [r14 + 0x40]
0xdf664b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6650: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6656: add rcx, qword ptr [r14 + 0x40]
0xdf665a: vzeroupper 
0xdf665d: call 0x14035f1f0
0xdf6662: inc r15d
0xdf6665: cmp r15d, dword ptr [r14 + 0x48]
0xdf6669: jb 0x140df6640
0xdf666b: mov rcx, qword ptr [r14 + 0x40]
0xdf666f: test rcx, rcx
0xdf6672: je 0x140df6689
0xdf6674: mov rax, qword ptr [rbp + 0x60]
0xdf6678: cmp byte ptr [rax], 0
0xdf667b: je 0x140df6684
0xdf667d: call 0x1447f03bc
0xdf6682: jmp 0x140df6689
0xdf6684: call 0x1447f02bc
0xdf6689: mov qword ptr [r14 + 0x40], r13
0xdf668d: mov dword ptr [r14 + 0x4c], r12d
0xdf6691: mov r15d, 1
0xdf6697: mov eax, dword ptr [r14 + 0x48]
0xdf669b: shl rax, 5
0xdf669f: add rax, qword ptr [r14 + 0x40]
0xdf66a3: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf66a8: vmovups ymmword ptr [rax], ymm0
0xdf66ac: inc dword ptr [r14 + 0x48]
0xdf66b0: mov byte ptr [rbp - 0x67], 0
0xdf66b4: mov rcx, qword ptr [rsi + 0x668]
0xdf66bb: add rcx, 0x40
0xdf66bf: mov qword ptr [rsp + 0x60], rbx
0xdf66c4: lea r8, [rip + 0xb2d5]
0xdf66cb: mov qword ptr [rsp + 0x68], r8
0xdf66d0: mov qword ptr [rsp + 0x70], rdi
0xdf66d5: mov word ptr [rsp + 0x78], 0
0xdf66dc: lea rdx, [rsp + 0x60]
0xdf66e1: vzeroupper 
0xdf66e4: call 0x140476290
0xdf66e9: nop 
0xdf66ea: mov byte ptr [rsp + 0x79], 0
0xdf66ef: mov r14, qword ptr [rsi + 0x680]
0xdf66f6: mov qword ptr [rsp + 0x20], rbx
0xdf66fb: lea rax, [rip + 0xb2ae]
0xdf6702: mov qword ptr [rsp + 0x28], rax
0xdf6707: mov qword ptr [rsp + 0x30], rdi
0xdf670c: mov word ptr [rsp + 0x38], 0
0xdf6713: mov ecx, dword ptr [r14 + 0x48]
0xdf6717: mov eax, dword ptr [r14 + 0x4c]
0xdf671b: cmp eax, ecx
0xdf671d: ja 0x140df6801
0xdf6723: lea r12d, [rax*2 + 1]
0xdf672b: add r12d, eax
0xdf672e: shr r12d, 1
0xdf6731: cmp r12d, 1
0xdf6735: cmovb r12d, r15d
0xdf6739: cmp ecx, r12d
0xdf673c: cmova r12d, ecx
0xdf6740: cmp r12d, eax
0xdf6743: jbe 0x140df6801
0xdf6749: mov ecx, r12d
0xdf674c: shl ecx, 5
0xdf674f: mov r8d, 0x1fd
0xdf6755: mov rax, qword ptr gs:[0x58]
0xdf675e: mov rax, qword ptr [rax]
0xdf6761: add rax, r8
0xdf6764: mov qword ptr [rbp + 0x60], rax
0xdf6768: mov edx, 8
0xdf676d: cmp byte ptr [rax], 0
0xdf6770: je 0x140df6779
0xdf6772: call 0x1447efa78
0xdf6777: jmp 0x140df677e
0xdf6779: call 0x1447ef9b0
0xdf677e: mov r13, rax
0xdf6781: test rax, rax
0xdf6784: jne 0x140df679f
0xdf6786: call 0x141318e70
0xdf678b: xor r9d, r9d
0xdf678e: xor r8d, r8d
0xdf6791: mov edx, r15d
0xdf6794: mov ecx, 0xa0000002
0xdf6799: call qword ptr [rip + 0x43f49a9]
0xdf679f: mov r15d, edi
0xdf67a2: cmp dword ptr [r14 + 0x48], edi
0xdf67a6: jbe 0x140df67db
0xdf67a8: nop dword ptr [rax + rax]
0xdf67b0: mov ecx, r15d
0xdf67b3: shl rcx, 5
0xdf67b7: mov rax, qword ptr [r14 + 0x40]
0xdf67bb: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf67c0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf67c6: add rcx, qword ptr [r14 + 0x40]
0xdf67ca: vzeroupper 
0xdf67cd: call 0x14035f1f0
0xdf67d2: inc r15d
0xdf67d5: cmp r15d, dword ptr [r14 + 0x48]
0xdf67d9: jb 0x140df67b0
0xdf67db: mov rcx, qword ptr [r14 + 0x40]
0xdf67df: test rcx, rcx
0xdf67e2: je 0x140df67f9
0xdf67e4: mov rax, qword ptr [rbp + 0x60]
0xdf67e8: cmp byte ptr [rax], 0
0xdf67eb: je 0x140df67f4
0xdf67ed: call 0x1447f03bc
0xdf67f2: jmp 0x140df67f9
0xdf67f4: call 0x1447f02bc
0xdf67f9: mov qword ptr [r14 + 0x40], r13
0xdf67fd: mov dword ptr [r14 + 0x4c], r12d
0xdf6801: mov eax, dword ptr [r14 + 0x48]
0xdf6805: shl rax, 5
0xdf6809: add rax, qword ptr [r14 + 0x40]
0xdf680d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf6813: vmovups ymmword ptr [rax], ymm0
0xdf6817: inc dword ptr [r14 + 0x48]
0xdf681b: mov byte ptr [rsp + 0x39], 0
0xdf6820: mov r14, qword ptr [rsi + 0x688]
0xdf6827: mov qword ptr [rbp - 0x80], rbx
0xdf682b: lea rax, [rip + 0xb1de]
0xdf6832: mov qword ptr [rbp - 0x78], rax
0xdf6836: mov qword ptr [rbp - 0x70], rdi
0xdf683a: mov word ptr [rbp - 0x68], 0
0xdf6840: mov ecx, dword ptr [r14 + 0x48]
0xdf6844: mov eax, dword ptr [r14 + 0x4c]
0xdf6848: mov r15d, 1
0xdf684e: cmp eax, ecx
0xdf6850: ja 0x140df6937
0xdf6856: lea r12d, [rax*2 + 1]
0xdf685e: add r12d, eax
0xdf6861: shr r12d, 1
0xdf6864: cmp r12d, r15d
0xdf6867: cmovb r12d, r15d
0xdf686b: cmp ecx, r12d
0xdf686e: cmova r12d, ecx
0xdf6872: cmp r12d, eax
0xdf6875: jbe 0x140df6937
0xdf687b: mov ecx, r12d
0xdf687e: shl ecx, 5
0xdf6881: mov r8d, 0x1fd
0xdf6887: mov rax, qword ptr gs:[0x58]
0xdf6890: mov rax, qword ptr [rax]
0xdf6893: add rax, r8
0xdf6896: mov qword ptr [rbp + 0x60], rax
0xdf689a: mov edx, 8
0xdf689f: vzeroupper 
0xdf68a2: cmp byte ptr [rax], 0
0xdf68a5: je 0x140df68ae
0xdf68a7: call 0x1447efa78
0xdf68ac: jmp 0x140df68b3
0xdf68ae: call 0x1447ef9b0
0xdf68b3: mov r13, rax
0xdf68b6: test rax, rax
0xdf68b9: jne 0x140df68d4
0xdf68bb: call 0x141318e70
0xdf68c0: xor r9d, r9d
0xdf68c3: xor r8d, r8d
0xdf68c6: mov edx, r15d
0xdf68c9: mov ecx, 0xa0000002
0xdf68ce: call qword ptr [rip + 0x43f4874]
0xdf68d4: mov r15d, edi
0xdf68d7: cmp dword ptr [r14 + 0x48], edi
0xdf68db: jbe 0x140df690b
0xdf68dd: nop dword ptr [rax]
0xdf68e0: mov ecx, r15d
0xdf68e3: shl rcx, 5
0xdf68e7: mov rax, qword ptr [r14 + 0x40]
0xdf68eb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf68f0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf68f6: add rcx, qword ptr [r14 + 0x40]
0xdf68fa: vzeroupper 
0xdf68fd: call 0x14035f1f0
0xdf6902: inc r15d
0xdf6905: cmp r15d, dword ptr [r14 + 0x48]
0xdf6909: jb 0x140df68e0
0xdf690b: mov rcx, qword ptr [r14 + 0x40]
0xdf690f: test rcx, rcx
0xdf6912: je 0x140df6929
0xdf6914: mov rax, qword ptr [rbp + 0x60]
0xdf6918: cmp byte ptr [rax], 0
0xdf691b: je 0x140df6924
0xdf691d: call 0x1447f03bc
0xdf6922: jmp 0x140df6929
0xdf6924: call 0x1447f02bc
0xdf6929: mov qword ptr [r14 + 0x40], r13
0xdf692d: mov dword ptr [r14 + 0x4c], r12d
0xdf6931: mov r15d, 1
0xdf6937: mov eax, dword ptr [r14 + 0x48]
0xdf693b: shl rax, 5
0xdf693f: add rax, qword ptr [r14 + 0x40]
0xdf6943: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6948: vmovups ymmword ptr [rax], ymm0
0xdf694c: inc dword ptr [r14 + 0x48]
0xdf6950: mov byte ptr [rbp - 0x67], 0
0xdf6954: mov r14, qword ptr [rsi + 0x690]
0xdf695b: mov qword ptr [rsp + 0x60], rbx
0xdf6960: lea rax, [rip + 0xb119]
0xdf6967: mov qword ptr [rsp + 0x68], rax
0xdf696c: mov qword ptr [rsp + 0x70], rdi
0xdf6971: mov word ptr [rsp + 0x78], 0
0xdf6978: mov ecx, dword ptr [r14 + 0x48]
0xdf697c: mov eax, dword ptr [r14 + 0x4c]
0xdf6980: cmp eax, ecx
0xdf6982: ja 0x140df6a61
0xdf6988: lea r12d, [rax*2 + 1]
0xdf6990: add r12d, eax
0xdf6993: shr r12d, 1
0xdf6996: cmp r12d, 1
0xdf699a: cmovb r12d, r15d
0xdf699e: cmp ecx, r12d
0xdf69a1: cmova r12d, ecx
0xdf69a5: cmp r12d, eax
0xdf69a8: jbe 0x140df6a61
0xdf69ae: mov ecx, r12d
0xdf69b1: shl ecx, 5
0xdf69b4: mov r8d, 0x1fd
0xdf69ba: mov rax, qword ptr gs:[0x58]
0xdf69c3: mov rax, qword ptr [rax]
0xdf69c6: add rax, r8
0xdf69c9: mov qword ptr [rbp + 0x60], rax
0xdf69cd: mov edx, 8
0xdf69d2: vzeroupper 
0xdf69d5: cmp byte ptr [rax], 0
0xdf69d8: je 0x140df69e1
0xdf69da: call 0x1447efa78
0xdf69df: jmp 0x140df69e6
0xdf69e1: call 0x1447ef9b0
0xdf69e6: mov r13, rax
0xdf69e9: test rax, rax
0xdf69ec: jne 0x140df6a07
0xdf69ee: call 0x141318e70
0xdf69f3: xor r9d, r9d
0xdf69f6: xor r8d, r8d
0xdf69f9: mov edx, r15d
0xdf69fc: mov ecx, 0xa0000002
0xdf6a01: call qword ptr [rip + 0x43f4741]
0xdf6a07: mov r15d, edi
0xdf6a0a: cmp dword ptr [r14 + 0x48], edi
0xdf6a0e: jbe 0x140df6a3b
0xdf6a10: mov ecx, r15d
0xdf6a13: shl rcx, 5
0xdf6a17: mov rax, qword ptr [r14 + 0x40]
0xdf6a1b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6a20: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6a26: add rcx, qword ptr [r14 + 0x40]
0xdf6a2a: vzeroupper 
0xdf6a2d: call 0x14035f1f0
0xdf6a32: inc r15d
0xdf6a35: cmp r15d, dword ptr [r14 + 0x48]
0xdf6a39: jb 0x140df6a10
0xdf6a3b: mov rcx, qword ptr [r14 + 0x40]
0xdf6a3f: test rcx, rcx
0xdf6a42: je 0x140df6a59
0xdf6a44: mov rax, qword ptr [rbp + 0x60]
0xdf6a48: cmp byte ptr [rax], 0
0xdf6a4b: je 0x140df6a54
0xdf6a4d: call 0x1447f03bc
0xdf6a52: jmp 0x140df6a59
0xdf6a54: call 0x1447f02bc
0xdf6a59: mov qword ptr [r14 + 0x40], r13
0xdf6a5d: mov dword ptr [r14 + 0x4c], r12d
0xdf6a61: mov eax, dword ptr [r14 + 0x48]
0xdf6a65: shl rax, 5
0xdf6a69: add rax, qword ptr [r14 + 0x40]
0xdf6a6d: vmovups ymm0, ymmword ptr [rsp + 0x60]
0xdf6a73: vmovups ymmword ptr [rax], ymm0
0xdf6a77: inc dword ptr [r14 + 0x48]
0xdf6a7b: mov byte ptr [rsp + 0x79], 0
0xdf6a80: mov r14, qword ptr [rsi + 0x698]
0xdf6a87: mov qword ptr [rbp - 0x80], rbx
0xdf6a8b: lea rax, [rip + 0xb01e]
0xdf6a92: mov qword ptr [rbp - 0x78], rax
0xdf6a96: mov qword ptr [rbp - 0x70], rdi
0xdf6a9a: mov word ptr [rbp - 0x68], 0
0xdf6aa0: mov ecx, dword ptr [r14 + 0x48]
0xdf6aa4: mov eax, dword ptr [r14 + 0x4c]
0xdf6aa8: mov r15d, 1
0xdf6aae: cmp eax, ecx
0xdf6ab0: ja 0x140df6b97
0xdf6ab6: lea r12d, [rax*2 + 1]
0xdf6abe: add r12d, eax
0xdf6ac1: shr r12d, 1
0xdf6ac4: cmp r12d, r15d
0xdf6ac7: cmovb r12d, r15d
0xdf6acb: cmp ecx, r12d
0xdf6ace: cmova r12d, ecx
0xdf6ad2: cmp r12d, eax
0xdf6ad5: jbe 0x140df6b97
0xdf6adb: mov ecx, r12d
0xdf6ade: shl ecx, 5
0xdf6ae1: mov r8d, 0x1fd
0xdf6ae7: mov rax, qword ptr gs:[0x58]
0xdf6af0: mov rax, qword ptr [rax]
0xdf6af3: add rax, r8
0xdf6af6: mov qword ptr [rbp + 0x60], rax
0xdf6afa: mov edx, 8
0xdf6aff: vzeroupper 
0xdf6b02: cmp byte ptr [rax], 0
0xdf6b05: je 0x140df6b0e
0xdf6b07: call 0x1447efa78
0xdf6b0c: jmp 0x140df6b13
0xdf6b0e: call 0x1447ef9b0
0xdf6b13: mov r13, rax
0xdf6b16: test rax, rax
0xdf6b19: jne 0x140df6b34
0xdf6b1b: call 0x141318e70
0xdf6b20: xor r9d, r9d
0xdf6b23: xor r8d, r8d
0xdf6b26: mov edx, r15d
0xdf6b29: mov ecx, 0xa0000002
0xdf6b2e: call qword ptr [rip + 0x43f4614]
0xdf6b34: mov r15d, edi
0xdf6b37: cmp dword ptr [r14 + 0x48], edi
0xdf6b3b: jbe 0x140df6b6b
0xdf6b3d: nop dword ptr [rax]
0xdf6b40: mov ecx, r15d
0xdf6b43: shl rcx, 5
0xdf6b47: mov rax, qword ptr [r14 + 0x40]
0xdf6b4b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6b50: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6b56: add rcx, qword ptr [r14 + 0x40]
0xdf6b5a: vzeroupper 
0xdf6b5d: call 0x14035f1f0
0xdf6b62: inc r15d
0xdf6b65: cmp r15d, dword ptr [r14 + 0x48]
0xdf6b69: jb 0x140df6b40
0xdf6b6b: mov rcx, qword ptr [r14 + 0x40]
0xdf6b6f: test rcx, rcx
0xdf6b72: je 0x140df6b89
0xdf6b74: mov rax, qword ptr [rbp + 0x60]
0xdf6b78: cmp byte ptr [rax], 0
0xdf6b7b: je 0x140df6b84
0xdf6b7d: call 0x1447f03bc
0xdf6b82: jmp 0x140df6b89
0xdf6b84: call 0x1447f02bc
0xdf6b89: mov qword ptr [r14 + 0x40], r13
0xdf6b8d: mov dword ptr [r14 + 0x4c], r12d
0xdf6b91: mov r15d, 1
0xdf6b97: mov eax, dword ptr [r14 + 0x48]
0xdf6b9b: shl rax, 5
0xdf6b9f: add rax, qword ptr [r14 + 0x40]
0xdf6ba3: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6ba8: vmovups ymmword ptr [rax], ymm0
0xdf6bac: inc dword ptr [r14 + 0x48]
0xdf6bb0: mov byte ptr [rbp - 0x67], 0
0xdf6bb4: mov rcx, qword ptr [rsi + 0x2f0]
0xdf6bbb: add rcx, 0x40
0xdf6bbf: mov qword ptr [rsp + 0x60], rbx
0xdf6bc4: lea r8, [rip + 0xaf05]
0xdf6bcb: mov qword ptr [rsp + 0x68], r8
0xdf6bd0: mov qword ptr [rsp + 0x70], rdi
0xdf6bd5: mov word ptr [rsp + 0x78], 0
0xdf6bdc: lea rdx, [rsp + 0x60]
0xdf6be1: vzeroupper 
0xdf6be4: call 0x140476290
0xdf6be9: nop 
0xdf6bea: mov byte ptr [rsp + 0x79], 0
0xdf6bef: mov r14, qword ptr [rsi + 0x270]
0xdf6bf6: mov qword ptr [rsp + 0x20], rbx
0xdf6bfb: lea rax, [rip + 0xaeee]
0xdf6c02: mov qword ptr [rsp + 0x28], rax
0xdf6c07: mov qword ptr [rsp + 0x30], rdi
0xdf6c0c: mov word ptr [rsp + 0x38], 0
0xdf6c13: mov ecx, dword ptr [r14 + 0x48]
0xdf6c17: mov eax, dword ptr [r14 + 0x4c]
0xdf6c1b: cmp eax, ecx
0xdf6c1d: ja 0x140df6d01
0xdf6c23: lea r12d, [rax*2 + 1]
0xdf6c2b: add r12d, eax
0xdf6c2e: shr r12d, 1
0xdf6c31: cmp r12d, 1
0xdf6c35: cmovb r12d, r15d
0xdf6c39: cmp ecx, r12d
0xdf6c3c: cmova r12d, ecx
0xdf6c40: cmp r12d, eax
0xdf6c43: jbe 0x140df6d01
0xdf6c49: mov ecx, r12d
0xdf6c4c: shl ecx, 5
0xdf6c4f: mov r8d, 0x1fd
0xdf6c55: mov rax, qword ptr gs:[0x58]
0xdf6c5e: mov rax, qword ptr [rax]
0xdf6c61: add rax, r8
0xdf6c64: mov qword ptr [rbp + 0x60], rax
0xdf6c68: mov edx, 8
0xdf6c6d: cmp byte ptr [rax], 0
0xdf6c70: je 0x140df6c79
0xdf6c72: call 0x1447efa78
0xdf6c77: jmp 0x140df6c7e
0xdf6c79: call 0x1447ef9b0
0xdf6c7e: mov r13, rax
0xdf6c81: test rax, rax
0xdf6c84: jne 0x140df6c9f
0xdf6c86: call 0x141318e70
0xdf6c8b: xor r9d, r9d
0xdf6c8e: xor r8d, r8d
0xdf6c91: mov edx, r15d
0xdf6c94: mov ecx, 0xa0000002
0xdf6c99: call qword ptr [rip + 0x43f44a9]
0xdf6c9f: mov r15d, edi
0xdf6ca2: cmp dword ptr [r14 + 0x48], edi
0xdf6ca6: jbe 0x140df6cdb
0xdf6ca8: nop dword ptr [rax + rax]
0xdf6cb0: mov ecx, r15d
0xdf6cb3: shl rcx, 5
0xdf6cb7: mov rax, qword ptr [r14 + 0x40]
0xdf6cbb: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6cc0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6cc6: add rcx, qword ptr [r14 + 0x40]
0xdf6cca: vzeroupper 
0xdf6ccd: call 0x14035f1f0
0xdf6cd2: inc r15d
0xdf6cd5: cmp r15d, dword ptr [r14 + 0x48]
0xdf6cd9: jb 0x140df6cb0
0xdf6cdb: mov rcx, qword ptr [r14 + 0x40]
0xdf6cdf: test rcx, rcx
0xdf6ce2: je 0x140df6cf9
0xdf6ce4: mov rax, qword ptr [rbp + 0x60]
0xdf6ce8: cmp byte ptr [rax], 0
0xdf6ceb: je 0x140df6cf4
0xdf6ced: call 0x1447f03bc
0xdf6cf2: jmp 0x140df6cf9
0xdf6cf4: call 0x1447f02bc
0xdf6cf9: mov qword ptr [r14 + 0x40], r13
0xdf6cfd: mov dword ptr [r14 + 0x4c], r12d
0xdf6d01: mov eax, dword ptr [r14 + 0x48]
0xdf6d05: shl rax, 5
0xdf6d09: add rax, qword ptr [r14 + 0x40]
0xdf6d0d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf6d13: vmovups ymmword ptr [rax], ymm0
0xdf6d17: inc dword ptr [r14 + 0x48]
0xdf6d1b: mov byte ptr [rsp + 0x39], 0
0xdf6d20: mov rcx, qword ptr [rsi + 0x278]
0xdf6d27: add rcx, 0x40
0xdf6d2b: mov qword ptr [rbp - 0x80], rbx
0xdf6d2f: lea r8, [rip + 0xadca]
0xdf6d36: mov qword ptr [rbp - 0x78], r8
0xdf6d3a: mov qword ptr [rbp - 0x70], rdi
0xdf6d3e: mov word ptr [rbp - 0x68], 0
0xdf6d44: lea rdx, [rbp - 0x80]
0xdf6d48: vzeroupper 
0xdf6d4b: call 0x140476290
0xdf6d50: nop 
0xdf6d51: mov byte ptr [rbp - 0x67], 0
0xdf6d55: mov r14, qword ptr [rsi + 0x6f8]
0xdf6d5c: mov qword ptr [rsp + 0x60], rbx
0xdf6d61: lea rax, [rip + 0xada8]
0xdf6d68: mov qword ptr [rsp + 0x68], rax
0xdf6d6d: mov qword ptr [rsp + 0x70], rdi
0xdf6d72: mov word ptr [rsp + 0x78], 0
0xdf6d79: mov ecx, dword ptr [r14 + 0x48]
0xdf6d7d: mov eax, dword ptr [r14 + 0x4c]
0xdf6d81: mov r15d, 1
0xdf6d87: cmp eax, ecx
0xdf6d89: ja 0x140df6e77
0xdf6d8f: lea r12d, [rax*2 + 1]
0xdf6d97: add r12d, eax
0xdf6d9a: shr r12d, 1
0xdf6d9d: cmp r12d, r15d
0xdf6da0: cmovb r12d, r15d
0xdf6da4: cmp ecx, r12d
0xdf6da7: cmova r12d, ecx
0xdf6dab: cmp r12d, eax
0xdf6dae: jbe 0x140df6e77
0xdf6db4: mov ecx, r12d
0xdf6db7: shl ecx, 5
0xdf6dba: mov r8d, 0x1fd
0xdf6dc0: mov rax, qword ptr gs:[0x58]
0xdf6dc9: mov rax, qword ptr [rax]
0xdf6dcc: add rax, r8
0xdf6dcf: mov qword ptr [rbp + 0x60], rax
0xdf6dd3: mov edx, 8
0xdf6dd8: cmp byte ptr [rax], 0
0xdf6ddb: je 0x140df6de4
0xdf6ddd: call 0x1447efa78
0xdf6de2: jmp 0x140df6de9
0xdf6de4: call 0x1447ef9b0
0xdf6de9: mov r13, rax
0xdf6dec: test rax, rax
0xdf6def: jne 0x140df6e0a
0xdf6df1: call 0x141318e70
0xdf6df6: xor r9d, r9d
0xdf6df9: xor r8d, r8d
0xdf6dfc: mov edx, r15d
0xdf6dff: mov ecx, 0xa0000002
0xdf6e04: call qword ptr [rip + 0x43f433e]
0xdf6e0a: mov r15d, edi
0xdf6e0d: cmp dword ptr [r14 + 0x48], edi
0xdf6e11: jbe 0x140df6e4b
0xdf6e13: nop dword ptr [rax]
0xdf6e17: nop word ptr [rax + rax]
0xdf6e20: mov ecx, r15d
0xdf6e23: shl rcx, 5
0xdf6e27: mov rax, qword ptr [r14 + 0x40]
0xdf6e2b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6e30: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6e36: add rcx, qword ptr [r14 + 0x40]
0xdf6e3a: vzeroupper 
0xdf6e3d: call 0x14035f1f0
0xdf6e42: inc r15d
0xdf6e45: cmp r15d, dword ptr [r14 + 0x48]
0xdf6e49: jb 0x140df6e20
0xdf6e4b: mov rcx, qword ptr [r14 + 0x40]
0xdf6e4f: test rcx, rcx
0xdf6e52: je 0x140df6e69
0xdf6e54: mov rax, qword ptr [rbp + 0x60]
0xdf6e58: cmp byte ptr [rax], 0
0xdf6e5b: je 0x140df6e64
0xdf6e5d: call 0x1447f03bc
0xdf6e62: jmp 0x140df6e69
0xdf6e64: call 0x1447f02bc
0xdf6e69: mov qword ptr [r14 + 0x40], r13
0xdf6e6d: mov dword ptr [r14 + 0x4c], r12d
0xdf6e71: mov r15d, 1
0xdf6e77: mov eax, dword ptr [r14 + 0x48]
0xdf6e7b: shl rax, 5
0xdf6e7f: add rax, qword ptr [r14 + 0x40]
0xdf6e83: vmovups ymm0, ymmword ptr [rsp + 0x60]
0xdf6e89: vmovups ymmword ptr [rax], ymm0
0xdf6e8d: inc dword ptr [r14 + 0x48]
0xdf6e91: mov byte ptr [rsp + 0x79], 0
0xdf6e96: mov r14, qword ptr [rsi + 0x178]
0xdf6e9d: mov qword ptr [rbp - 0x80], rbx
0xdf6ea1: lea rax, [rip + 0xac78]
0xdf6ea8: mov qword ptr [rbp - 0x78], rax
0xdf6eac: mov qword ptr [rbp - 0x70], rdi
0xdf6eb0: mov word ptr [rbp - 0x68], 0
0xdf6eb6: mov ecx, dword ptr [r14 + 0x48]
0xdf6eba: mov eax, dword ptr [r14 + 0x4c]
0xdf6ebe: cmp eax, ecx
0xdf6ec0: ja 0x140df6fa1
0xdf6ec6: lea r12d, [rax*2 + 1]
0xdf6ece: add r12d, eax
0xdf6ed1: shr r12d, 1
0xdf6ed4: cmp r12d, 1
0xdf6ed8: cmovb r12d, r15d
0xdf6edc: cmp ecx, r12d
0xdf6edf: cmova r12d, ecx
0xdf6ee3: cmp r12d, eax
0xdf6ee6: jbe 0x140df6fa1
0xdf6eec: mov ecx, r12d
0xdf6eef: shl ecx, 5
0xdf6ef2: mov r8d, 0x1fd
0xdf6ef8: mov rax, qword ptr gs:[0x58]
0xdf6f01: mov rax, qword ptr [rax]
0xdf6f04: add rax, r8
0xdf6f07: mov qword ptr [rbp + 0x60], rax
0xdf6f0b: mov edx, 8
0xdf6f10: vzeroupper 
0xdf6f13: cmp byte ptr [rax], 0
0xdf6f16: je 0x140df6f1f
0xdf6f18: call 0x1447efa78
0xdf6f1d: jmp 0x140df6f24
0xdf6f1f: call 0x1447ef9b0
0xdf6f24: mov r13, rax
0xdf6f27: test rax, rax
0xdf6f2a: jne 0x140df6f45
0xdf6f2c: call 0x141318e70
0xdf6f31: xor r9d, r9d
0xdf6f34: xor r8d, r8d
0xdf6f37: mov edx, r15d
0xdf6f3a: mov ecx, 0xa0000002
0xdf6f3f: call qword ptr [rip + 0x43f4203]
0xdf6f45: mov r15d, edi
0xdf6f48: cmp dword ptr [r14 + 0x48], edi
0xdf6f4c: jbe 0x140df6f7b
0xdf6f4e: nop 
0xdf6f50: mov ecx, r15d
0xdf6f53: shl rcx, 5
0xdf6f57: mov rax, qword ptr [r14 + 0x40]
0xdf6f5b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6f60: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6f66: add rcx, qword ptr [r14 + 0x40]
0xdf6f6a: vzeroupper 
0xdf6f6d: call 0x14035f1f0
0xdf6f72: inc r15d
0xdf6f75: cmp r15d, dword ptr [r14 + 0x48]
0xdf6f79: jb 0x140df6f50
0xdf6f7b: mov rcx, qword ptr [r14 + 0x40]
0xdf6f7f: test rcx, rcx
0xdf6f82: je 0x140df6f99
0xdf6f84: mov rax, qword ptr [rbp + 0x60]
0xdf6f88: cmp byte ptr [rax], 0
0xdf6f8b: je 0x140df6f94
0xdf6f8d: call 0x1447f03bc
0xdf6f92: jmp 0x140df6f99
0xdf6f94: call 0x1447f02bc
0xdf6f99: mov qword ptr [r14 + 0x40], r13
0xdf6f9d: mov dword ptr [r14 + 0x4c], r12d
0xdf6fa1: mov eax, dword ptr [r14 + 0x48]
0xdf6fa5: shl rax, 5
0xdf6fa9: add rax, qword ptr [r14 + 0x40]
0xdf6fad: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6fb2: vmovups ymmword ptr [rax], ymm0
0xdf6fb6: inc dword ptr [r14 + 0x48]
0xdf6fba: mov byte ptr [rbp - 0x67], 0
0xdf6fbe: mov rcx, qword ptr [rsi + 0x180]
0xdf6fc5: add rcx, 0x40
0xdf6fc9: mov qword ptr [rsp + 0x60], rbx
0xdf6fce: lea r8, [rip + 0xab9b]
0xdf6fd5: mov qword ptr [rsp + 0x68], r8
0xdf6fda: mov qword ptr [rsp + 0x70], rdi
0xdf6fdf: mov word ptr [rsp + 0x78], 0
0xdf6fe6: lea rdx, [rsp + 0x60]
0xdf6feb: vzeroupper 
0xdf6fee: call 0x140476290
0xdf6ff3: nop 
0xdf6ff4: mov byte ptr [rsp + 0x79], 0
0xdf6ff9: mov rcx, qword ptr [rsi + 0x188]
0xdf7000: add rcx, 0x40
0xdf7004: mov qword ptr [rsp + 0x20], rbx
0xdf7009: lea r8, [rip + 0xab70]
0xdf7010: mov qword ptr [rsp + 0x28], r8
0xdf7015: mov qword ptr [rsp + 0x30], rdi
0xdf701a: mov word ptr [rsp + 0x38], 0
0xdf7021: lea rdx, [rsp + 0x20]
0xdf7026: call 0x140476290
0xdf702b: nop 
0xdf702c: mov byte ptr [rsp + 0x39], 0
0xdf7031: mov rcx, qword ptr [rsi + 0x450]
0xdf7038: add rcx, 0x40
0xdf703c: mov qword ptr [rsp + 0x40], rbx
0xdf7041: lea r8, [rip + 0xab48]
0xdf7048: mov qword ptr [rsp + 0x48], r8
0xdf704d: mov qword ptr [rsp + 0x50], rdi
0xdf7052: mov word ptr [rsp + 0x58], 0
0xdf7059: lea rdx, [rsp + 0x40]
0xdf705e: call 0x140476290
0xdf7063: nop 
0xdf7064: mov byte ptr [rsp + 0x59], 0
0xdf7069: mov rcx, qword ptr [rsi + 0x6c8]
0xdf7070: add rcx, 0x40
0xdf7074: mov qword ptr [rbp - 0x60], rbx
0xdf7078: lea r8, [rip + 0xab21]
0xdf707f: mov qword ptr [rbp - 0x58], r8
0xdf7083: mov qword ptr [rbp - 0x50], rdi
0xdf7087: mov word ptr [rbp - 0x48], 0
0xdf708d: lea rdx, [rbp - 0x60]
0xdf7091: call 0x140476290
0xdf7096: nop 
0xdf7097: mov byte ptr [rbp - 0x47], 0
0xdf709b: mov rcx, qword ptr [rsi + 0x6d0]
0xdf70a2: add rcx, 0x40
0xdf70a6: mov qword ptr [rbp - 0x40], rbx
0xdf70aa: lea r8, [rip + 0xaaff]
0xdf70b1: mov qword ptr [rbp - 0x38], r8
0xdf70b5: mov qword ptr [rbp - 0x30], rdi
0xdf70b9: mov word ptr [rbp - 0x28], 0
0xdf70bf: lea rdx, [rbp - 0x40]
0xdf70c3: call 0x140476290
0xdf70c8: nop 
0xdf70c9: mov byte ptr [rbp - 0x27], 0
0xdf70cd: mov rcx, qword ptr [rsi + 0x6d8]
0xdf70d4: add rcx, 0x40
0xdf70d8: mov qword ptr [rbp - 0x20], rbx
0xdf70dc: lea r8, [rip + 0xaaed]
0xdf70e3: mov qword ptr [rbp - 0x18], r8
0xdf70e7: mov qword ptr [rbp - 0x10], rdi
0xdf70eb: mov word ptr [rbp - 8], 0
0xdf70f1: lea rdx, [rbp - 0x20]
0xdf70f5: call 0x140476290
0xdf70fa: nop 
0xdf70fb: mov byte ptr [rbp - 7], 0
0xdf70ff: mov r14, qword ptr [rsi + 0x6e0]
0xdf7106: mov qword ptr [rbp], rbx
0xdf710a: lea rax, [rip + 0xaadf]
0xdf7111: mov qword ptr [rbp + 8], rax
0xdf7115: mov qword ptr [rbp + 0x10], rdi
0xdf7119: mov word ptr [rbp + 0x18], 0
0xdf711f: mov ecx, dword ptr [r14 + 0x48]
0xdf7123: mov eax, dword ptr [r14 + 0x4c]
0xdf7127: cmp eax, ecx
0xdf7129: ja 0x140df71ff
0xdf712f: lea r15d, [rax*2 + 1]
0xdf7137: add r15d, eax
0xdf713a: shr r15d, 1
0xdf713d: cmp r15d, 1
0xdf7141: mov r13d, 1
0xdf7147: cmovb r15d, r13d
0xdf714b: cmp ecx, r15d
0xdf714e: cmova r15d, ecx
0xdf7152: cmp r15d, eax
0xdf7155: jbe 0x140df71ff
0xdf715b: mov ecx, r15d
0xdf715e: shl ecx, 5
0xdf7161: mov r9d, 0x1fd
0xdf7167: mov rax, qword ptr gs:[0x58]
0xdf7170: mov r8, qword ptr [rax]
0xdf7173: mov edx, 8
0xdf7178: cmp byte ptr [r9 + r8], 0
0xdf717d: je 0x140df7186
0xdf717f: call 0x1447efa78
0xdf7184: jmp 0x140df718b
0xdf7186: call 0x1447ef9b0
0xdf718b: mov r12, rax
0xdf718e: test rax, rax
0xdf7191: jne 0x140df71ac
0xdf7193: call 0x141318e70
0xdf7198: xor r9d, r9d
0xdf719b: xor r8d, r8d
0xdf719e: mov edx, r13d
0xdf71a1: mov ecx, 0xa0000002
0xdf71a6: call qword ptr [rip + 0x43f3f9c]
0xdf71ac: cmp dword ptr [r14 + 0x48], 0
0xdf71b1: jbe 0x140df71e9
0xdf71b3: nop dword ptr [rax]
0xdf71b7: nop word ptr [rax + rax]
0xdf71c0: mov ecx, edi
0xdf71c2: shl rcx, 5
0xdf71c6: mov rax, qword ptr [r14 + 0x40]
0xdf71ca: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf71cf: vmovups ymmword ptr [rcx + r12], ymm0
0xdf71d5: add rcx, qword ptr [r14 + 0x40]
0xdf71d9: vzeroupper 
0xdf71dc: call 0x14035f1f0
0xdf71e1: inc edi
0xdf71e3: cmp edi, dword ptr [r14 + 0x48]
0xdf71e7: jb 0x140df71c0
0xdf71e9: mov rcx, qword ptr [r14 + 0x40]
0xdf71ed: test rcx, rcx
0xdf71f0: je 0x140df71f7
0xdf71f2: call 0x1413738b0
0xdf71f7: mov qword ptr [r14 + 0x40], r12
0xdf71fb: mov dword ptr [r14 + 0x4c], r15d
0xdf71ff: mov eax, dword ptr [r14 + 0x48]
0xdf7203: shl rax, 5
0xdf7207: add rax, qword ptr [r14 + 0x40]
0xdf720b: vmovups ymm0, ymmword ptr [rbp]
0xdf7210: vmovups ymmword ptr [rax], ymm0
0xdf7214: inc dword ptr [r14 + 0x48]
0xdf7218: lea rcx, [rbp]
0xdf721c: vzeroupper 
0xdf721f: call 0x14035f1f0
0xdf7224: mov rcx, qword ptr [rsi + 0x120]
0xdf722b: add rcx, 0x40
0xdf722f: mov rdx, rbx
0xdf7232: call 0x140e00760
0xdf7237: mov rcx, qword ptr [rsi + 0x128]
0xdf723e: add rcx, 0x40
0xdf7242: mov rdx, rbx
0xdf7245: call 0x140e007a0
0xdf724a: mov rcx, qword ptr [rsi + 0x148]
0xdf7251: add rcx, 0x40
0xdf7255: mov rdx, rbx
0xdf7258: call 0x140e007e0
0xdf725d: mov rcx, qword ptr [rsi + 0xb60]
0xdf7264: add rcx, 0x40
0xdf7268: mov rdx, rbx
0xdf726b: call 0x140e00820
0xdf7270: mov rcx, qword ptr [rsi + 0xad0]
0xdf7277: add rcx, 0x40
0xdf727b: mov rdx, rbx
0xdf727e: call 0x140e00860
0xdf7283: jmp 0x140df8122
0xdf7288: mov edx, dword ptr [r12 + 0x48]
0xdf728d: mov r14d, edi
0xdf7290: test edx, edx
0xdf7292: je 0x140df7302
0xdf7294: mov r8, qword ptr [r12 + 0x40]
0xdf7299: lea rax, [rip + 0xa350]
0xdf72a0: mov r15d, r14d
0xdf72a3: shl r15, 5
0xdf72a7: lea rcx, [r8 + r15]
0xdf72ab: cmp rbx, qword ptr [rcx]
0xdf72ae: jne 0x140df72b6
0xdf72b0: cmp rax, qword ptr [rcx + 8]
0xdf72b4: je 0x140df72c0
0xdf72b6: inc r14d
0xdf72b9: cmp r14d, edx
0xdf72bc: jb 0x140df72a0
0xdf72be: jmp 0x140df7302
0xdf72c0: call 0x14035f1f0
0xdf72c5: mov eax, dword ptr [r12 + 0x48]
0xdf72ca: dec eax
0xdf72cc: cmp r14d, eax
0xdf72cf: jae 0x140df72fd
0xdf72d1: mov rcx, qword ptr [r12 + 0x40]
0xdf72d6: shl rax, 5
0xdf72da: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf72df: vmovups ymmword ptr [rcx + r15], ymm0
0xdf72e5: mov ecx, dword ptr [r12 + 0x48]
0xdf72ea: dec ecx
0xdf72ec: shl rcx, 5
0xdf72f0: add rcx, qword ptr [r12 + 0x40]
0xdf72f5: vzeroupper 
0xdf72f8: call 0x14035f1f0
0xdf72fd: dec dword ptr [r12 + 0x48]
0xdf7302: mov rcx, qword ptr [rsi + 0x210]
0xdf7309: add rcx, 0x40
0xdf730d: lea r8, [rip + 0xa30c]
0xdf7314: mov rdx, rbx
0xdf7317: call 0x140763d30
0xdf731c: mov r12, qword ptr [rsi + 0x610]
0xdf7323: mov edx, dword ptr [r12 + 0x48]
0xdf7328: mov r14d, edi
0xdf732b: test edx, edx
0xdf732d: je 0x140df73a2
0xdf732f: mov r8, qword ptr [r12 + 0x40]
0xdf7334: lea rax, [rip + 0xa325]
0xdf733b: nop dword ptr [rax + rax]
0xdf7340: mov r15d, r14d
0xdf7343: shl r15, 5
0xdf7347: lea rcx, [r15 + r8]
0xdf734b: cmp rbx, qword ptr [rcx]
0xdf734e: jne 0x140df7356
0xdf7350: cmp rax, qword ptr [rcx + 8]
0xdf7354: je 0x140df7360
0xdf7356: inc r14d
0xdf7359: cmp r14d, edx
0xdf735c: jb 0x140df7340
0xdf735e: jmp 0x140df73a2
0xdf7360: call 0x14035f1f0
0xdf7365: mov eax, dword ptr [r12 + 0x48]
0xdf736a: dec eax
0xdf736c: cmp r14d, eax
0xdf736f: jae 0x140df739d
0xdf7371: mov rcx, qword ptr [r12 + 0x40]
0xdf7376: shl rax, 5
0xdf737a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf737f: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7385: mov ecx, dword ptr [r12 + 0x48]
0xdf738a: dec ecx
0xdf738c: shl rcx, 5
0xdf7390: add rcx, qword ptr [r12 + 0x40]
0xdf7395: vzeroupper 
0xdf7398: call 0x14035f1f0
0xdf739d: dec dword ptr [r12 + 0x48]
0xdf73a2: mov r12, qword ptr [rsi + 0x618]
0xdf73a9: add r12, 0x40
0xdf73ad: mov edx, dword ptr [r12 + 8]
0xdf73b2: mov r14d, edi
0xdf73b5: test edx, edx
0xdf73b7: je 0x140df7430
0xdf73b9: mov r8, qword ptr [r12]
0xdf73bd: lea rax, [rip + 0xa2ec]
0xdf73c4: nop dword ptr [rax]
0xdf73c8: nop dword ptr [rax + rax]
0xdf73d0: mov r15d, r14d
0xdf73d3: shl r15, 5
0xdf73d7: lea rcx, [r15 + r8]
0xdf73db: cmp rbx, qword ptr [rcx]
0xdf73de: jne 0x140df73e6
0xdf73e0: cmp rax, qword ptr [rcx + 8]
0xdf73e4: je 0x140df73f0
0xdf73e6: inc r14d
0xdf73e9: cmp r14d, edx
0xdf73ec: jb 0x140df73d0
0xdf73ee: jmp 0x140df7430
0xdf73f0: call 0x14035f1f0
0xdf73f5: mov eax, dword ptr [r12 + 8]
0xdf73fa: dec eax
0xdf73fc: cmp r14d, eax
0xdf73ff: jae 0x140df742b
0xdf7401: mov rcx, qword ptr [r12]
0xdf7405: shl rax, 5
0xdf7409: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf740e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7414: mov ecx, dword ptr [r12 + 8]
0xdf7419: dec ecx
0xdf741b: shl rcx, 5
0xdf741f: add rcx, qword ptr [r12]
0xdf7423: vzeroupper 
0xdf7426: call 0x14035f1f0
0xdf742b: dec dword ptr [r12 + 8]
0xdf7430: mov r12, qword ptr [rsi + 0x650]
0xdf7437: add r12, 0x40
0xdf743b: mov edx, dword ptr [r12 + 8]
0xdf7440: mov r14d, edi
0xdf7443: test edx, edx
0xdf7445: je 0x140df74c0
0xdf7447: mov r8, qword ptr [r12]
0xdf744b: lea rax, [rip + 0xa29e]
0xdf7452: nop dword ptr [rax]
0xdf7456: nop word ptr [rax + rax]
0xdf7460: mov r15d, r14d
0xdf7463: shl r15, 5
0xdf7467: lea rcx, [r15 + r8]
0xdf746b: cmp rbx, qword ptr [rcx]
0xdf746e: jne 0x140df7476
0xdf7470: cmp rax, qword ptr [rcx + 8]
0xdf7474: je 0x140df7480
0xdf7476: inc r14d
0xdf7479: cmp r14d, edx
0xdf747c: jb 0x140df7460
0xdf747e: jmp 0x140df74c0
0xdf7480: call 0x14035f1f0
0xdf7485: mov eax, dword ptr [r12 + 8]
0xdf748a: dec eax
0xdf748c: cmp r14d, eax
0xdf748f: jae 0x140df74bb
0xdf7491: mov rcx, qword ptr [r12]
0xdf7495: shl rax, 5
0xdf7499: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf749e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf74a4: mov ecx, dword ptr [r12 + 8]
0xdf74a9: dec ecx
0xdf74ab: shl rcx, 5
0xdf74af: add rcx, qword ptr [r12]
0xdf74b3: vzeroupper 
0xdf74b6: call 0x14035f1f0
0xdf74bb: dec dword ptr [r12 + 8]
0xdf74c0: mov r12, qword ptr [rsi + 0x630]
0xdf74c7: add r12, 0x40
0xdf74cb: mov edx, dword ptr [r12 + 8]
0xdf74d0: mov r14d, edi
0xdf74d3: test edx, edx
0xdf74d5: je 0x140df7550
0xdf74d7: mov r8, qword ptr [r12]
0xdf74db: lea rax, [rip + 0xa22e]
0xdf74e2: nop dword ptr [rax]
0xdf74e6: nop word ptr [rax + rax]
0xdf74f0: mov r15d, r14d
0xdf74f3: shl r15, 5
0xdf74f7: lea rcx, [r15 + r8]
0xdf74fb: cmp rbx, qword ptr [rcx]
0xdf74fe: jne 0x140df7506
0xdf7500: cmp rax, qword ptr [rcx + 8]
0xdf7504: je 0x140df7510
0xdf7506: inc r14d
0xdf7509: cmp r14d, edx
0xdf750c: jb 0x140df74f0
0xdf750e: jmp 0x140df7550
0xdf7510: call 0x14035f1f0
0xdf7515: mov eax, dword ptr [r12 + 8]
0xdf751a: dec eax
0xdf751c: cmp r14d, eax
0xdf751f: jae 0x140df754b
0xdf7521: mov rcx, qword ptr [r12]
0xdf7525: shl rax, 5
0xdf7529: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf752e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7534: mov ecx, dword ptr [r12 + 8]
0xdf7539: dec ecx
0xdf753b: shl rcx, 5
0xdf753f: add rcx, qword ptr [r12]
0xdf7543: vzeroupper 
0xdf7546: call 0x14035f1f0
0xdf754b: dec dword ptr [r12 + 8]
0xdf7550: mov rcx, qword ptr [rsi + 0x628]
0xdf7557: add rcx, 0x40
0xdf755b: lea r8, [rip + 0xa1be]
0xdf7562: mov rdx, rbx
0xdf7565: call 0x140763d30
0xdf756a: mov r12, qword ptr [rsi + 0x620]
0xdf7571: mov edx, dword ptr [r12 + 0x48]
0xdf7576: mov r14d, edi
0xdf7579: test edx, edx
0xdf757b: je 0x140df75f2
0xdf757d: mov r8, qword ptr [r12 + 0x40]
0xdf7582: lea rax, [rip + 0xa1c7]
0xdf7589: nop dword ptr [rax]
0xdf7590: mov r15d, r14d
0xdf7593: shl r15, 5
0xdf7597: lea rcx, [r15 + r8]
0xdf759b: cmp rbx, qword ptr [rcx]
0xdf759e: jne 0x140df75a6
0xdf75a0: cmp rax, qword ptr [rcx + 8]
0xdf75a4: je 0x140df75b0
0xdf75a6: inc r14d
0xdf75a9: cmp r14d, edx
0xdf75ac: jb 0x140df7590
0xdf75ae: jmp 0x140df75f2
0xdf75b0: call 0x14035f1f0
0xdf75b5: mov eax, dword ptr [r12 + 0x48]
0xdf75ba: dec eax
0xdf75bc: cmp r14d, eax
0xdf75bf: jae 0x140df75ed
0xdf75c1: mov rcx, qword ptr [r12 + 0x40]
0xdf75c6: shl rax, 5
0xdf75ca: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf75cf: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf75d5: mov ecx, dword ptr [r12 + 0x48]
0xdf75da: dec ecx
0xdf75dc: shl rcx, 5
0xdf75e0: add rcx, qword ptr [r12 + 0x40]
0xdf75e5: vzeroupper 
0xdf75e8: call 0x14035f1f0
0xdf75ed: dec dword ptr [r12 + 0x48]
0xdf75f2: mov r12, qword ptr [rsi + 0x638]
0xdf75f9: add r12, 0x40
0xdf75fd: mov edx, dword ptr [r12 + 8]
0xdf7602: mov r14d, edi
0xdf7605: test edx, edx
0xdf7607: je 0x140df7680
0xdf7609: mov r8, qword ptr [r12]
0xdf760d: lea rax, [rip + 0xa15c]
0xdf7614: nop dword ptr [rax]
0xdf7618: nop dword ptr [rax + rax]
0xdf7620: mov r15d, r14d
0xdf7623: shl r15, 5
0xdf7627: lea rcx, [r15 + r8]
0xdf762b: cmp rbx, qword ptr [rcx]
0xdf762e: jne 0x140df7636
0xdf7630: cmp rax, qword ptr [rcx + 8]
0xdf7634: je 0x140df7640
0xdf7636: inc r14d
0xdf7639: cmp r14d, edx
0xdf763c: jb 0x140df7620
0xdf763e: jmp 0x140df7680
0xdf7640: call 0x14035f1f0
0xdf7645: mov eax, dword ptr [r12 + 8]
0xdf764a: dec eax
0xdf764c: cmp r14d, eax
0xdf764f: jae 0x140df767b
0xdf7651: mov rcx, qword ptr [r12]
0xdf7655: shl rax, 5
0xdf7659: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf765e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7664: mov ecx, dword ptr [r12 + 8]
0xdf7669: dec ecx
0xdf766b: shl rcx, 5
0xdf766f: add rcx, qword ptr [r12]
0xdf7673: vzeroupper 
0xdf7676: call 0x14035f1f0
0xdf767b: dec dword ptr [r12 + 8]
0xdf7680: mov r12, qword ptr [rsi + 0x640]
0xdf7687: add r12, 0x40
0xdf768b: mov edx, dword ptr [r12 + 8]
0xdf7690: mov r14d, edi
0xdf7693: test edx, edx
0xdf7695: je 0x140df7710
0xdf7697: mov r8, qword ptr [r12]
0xdf769b: lea rax, [rip + 0xa0ee]
0xdf76a2: nop dword ptr [rax]
0xdf76a6: nop word ptr [rax + rax]
0xdf76b0: mov r15d, r14d
0xdf76b3: shl r15, 5
0xdf76b7: lea rcx, [r15 + r8]
0xdf76bb: cmp rbx, qword ptr [rcx]
0xdf76be: jne 0x140df76c6
0xdf76c0: cmp rax, qword ptr [rcx + 8]
0xdf76c4: je 0x140df76d0
0xdf76c6: inc r14d
0xdf76c9: cmp r14d, edx
0xdf76cc: jb 0x140df76b0
0xdf76ce: jmp 0x140df7710
0xdf76d0: call 0x14035f1f0
0xdf76d5: mov eax, dword ptr [r12 + 8]
0xdf76da: dec eax
0xdf76dc: cmp r14d, eax
0xdf76df: jae 0x140df770b
0xdf76e1: mov rcx, qword ptr [r12]
0xdf76e5: shl rax, 5
0xdf76e9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf76ee: vmovups ymmword ptr [rcx + r15], ymm0
0xdf76f4: mov ecx, dword ptr [r12 + 8]
0xdf76f9: dec ecx
0xdf76fb: shl rcx, 5
0xdf76ff: add rcx, qword ptr [r12]
0xdf7703: vzeroupper 
0xdf7706: call 0x14035f1f0
0xdf770b: dec dword ptr [r12 + 8]
0xdf7710: mov r12, qword ptr [rsi + 0x648]
0xdf7717: add r12, 0x40
0xdf771b: mov edx, dword ptr [r12 + 8]
0xdf7720: mov r14d, edi
0xdf7723: test edx, edx
0xdf7725: je 0x140df77a0
0xdf7727: mov r8, qword ptr [r12]
0xdf772b: lea rax, [rip + 0xa06e]
0xdf7732: nop dword ptr [rax]
0xdf7736: nop word ptr [rax + rax]
0xdf7740: mov r15d, r14d
0xdf7743: shl r15, 5
0xdf7747: lea rcx, [r15 + r8]
0xdf774b: cmp rbx, qword ptr [rcx]
0xdf774e: jne 0x140df7756
0xdf7750: cmp rax, qword ptr [rcx + 8]
0xdf7754: je 0x140df7760
0xdf7756: inc r14d
0xdf7759: cmp r14d, edx
0xdf775c: jb 0x140df7740
0xdf775e: jmp 0x140df77a0
0xdf7760: call 0x14035f1f0
0xdf7765: mov eax, dword ptr [r12 + 8]
0xdf776a: dec eax
0xdf776c: cmp r14d, eax
0xdf776f: jae 0x140df779b
0xdf7771: mov rcx, qword ptr [r12]
0xdf7775: shl rax, 5
0xdf7779: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf777e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7784: mov ecx, dword ptr [r12 + 8]
0xdf7789: dec ecx
0xdf778b: shl rcx, 5
0xdf778f: add rcx, qword ptr [r12]
0xdf7793: vzeroupper 
0xdf7796: call 0x14035f1f0
0xdf779b: dec dword ptr [r12 + 8]
0xdf77a0: mov r12, qword ptr [rsi + 0x658]
0xdf77a7: add r12, 0x40
0xdf77ab: mov edx, dword ptr [r12 + 8]
0xdf77b0: mov r14d, edi
0xdf77b3: test edx, edx
0xdf77b5: je 0x140df7830
0xdf77b7: mov r8, qword ptr [r12]
0xdf77bb: lea rax, [rip + 0x9fee]
0xdf77c2: nop dword ptr [rax]
0xdf77c6: nop word ptr [rax + rax]
0xdf77d0: mov r15d, r14d
0xdf77d3: shl r15, 5
0xdf77d7: lea rcx, [r15 + r8]
0xdf77db: cmp rbx, qword ptr [rcx]
0xdf77de: jne 0x140df77e6
0xdf77e0: cmp rax, qword ptr [rcx + 8]
0xdf77e4: je 0x140df77f0
0xdf77e6: inc r14d
0xdf77e9: cmp r14d, edx
0xdf77ec: jb 0x140df77d0
0xdf77ee: jmp 0x140df7830
0xdf77f0: call 0x14035f1f0
0xdf77f5: mov eax, dword ptr [r12 + 8]
0xdf77fa: dec eax
0xdf77fc: cmp r14d, eax
0xdf77ff: jae 0x140df782b
0xdf7801: mov rcx, qword ptr [r12]
0xdf7805: shl rax, 5
0xdf7809: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf780e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7814: mov ecx, dword ptr [r12 + 8]
0xdf7819: dec ecx
0xdf781b: shl rcx, 5
0xdf781f: add rcx, qword ptr [r12]
0xdf7823: vzeroupper 
0xdf7826: call 0x14035f1f0
0xdf782b: dec dword ptr [r12 + 8]
0xdf7830: mov r12, qword ptr [rsi + 0x670]
0xdf7837: add r12, 0x40
0xdf783b: mov edx, dword ptr [r12 + 8]
0xdf7840: mov r14d, edi
0xdf7843: test edx, edx
0xdf7845: je 0x140df78c0
0xdf7847: mov r8, qword ptr [r12]
0xdf784b: lea rax, [rip + 0x9f6e]
0xdf7852: nop dword ptr [rax]
0xdf7856: nop word ptr [rax + rax]
0xdf7860: mov r15d, r14d
0xdf7863: shl r15, 5
0xdf7867: lea rcx, [r15 + r8]
0xdf786b: cmp rbx, qword ptr [rcx]
0xdf786e: jne 0x140df7876
0xdf7870: cmp rax, qword ptr [rcx + 8]
0xdf7874: je 0x140df7880
0xdf7876: inc r14d
0xdf7879: cmp r14d, edx
0xdf787c: jb 0x140df7860
0xdf787e: jmp 0x140df78c0
0xdf7880: call 0x14035f1f0
0xdf7885: mov eax, dword ptr [r12 + 8]
0xdf788a: dec eax
0xdf788c: cmp r14d, eax
0xdf788f: jae 0x140df78bb
0xdf7891: mov rcx, qword ptr [r12]
0xdf7895: shl rax, 5
0xdf7899: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf789e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf78a4: mov ecx, dword ptr [r12 + 8]
0xdf78a9: dec ecx
0xdf78ab: shl rcx, 5
0xdf78af: add rcx, qword ptr [r12]
0xdf78b3: vzeroupper 
0xdf78b6: call 0x14035f1f0
0xdf78bb: dec dword ptr [r12 + 8]
0xdf78c0: mov rcx, qword ptr [rsi + 0xc8]
0xdf78c7: add rcx, 0x40
0xdf78cb: lea r8, [rip + 0x9efe]
0xdf78d2: mov rdx, rbx
0xdf78d5: call 0x140763d30
0xdf78da: mov rcx, qword ptr [rsi + 0x108]
0xdf78e1: add rcx, 0x40
0xdf78e5: lea r8, [rip + 0x9ef4]
0xdf78ec: mov rdx, rbx
0xdf78ef: call 0x140763d30
0xdf78f4: mov r12, qword ptr [rsi + 0xd0]
0xdf78fb: mov eax, dword ptr [r12 + 0x48]
0xdf7900: mov r14d, edi
0xdf7903: test eax, eax
0xdf7905: je 0x140df7982
0xdf7907: mov r8, qword ptr [r12 + 0x40]
0xdf790c: lea rdx, [rip + 0x9edd]
0xdf7913: nop dword ptr [rax]
0xdf7917: nop word ptr [rax + rax]
0xdf7920: mov r15d, r14d
0xdf7923: shl r15, 5
0xdf7927: lea rcx, [r15 + r8]
0xdf792b: cmp rbx, qword ptr [rcx]
0xdf792e: jne 0x140df7936
0xdf7930: cmp rdx, qword ptr [rcx + 8]
0xdf7934: je 0x140df7940
0xdf7936: inc r14d
0xdf7939: cmp r14d, eax
0xdf793c: jb 0x140df7920
0xdf793e: jmp 0x140df7982
0xdf7940: call 0x14035f1f0
0xdf7945: mov eax, dword ptr [r12 + 0x48]
0xdf794a: dec eax
0xdf794c: cmp r14d, eax
0xdf794f: jae 0x140df797d
0xdf7951: mov rcx, qword ptr [r12 + 0x40]
0xdf7956: shl rax, 5
0xdf795a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf795f: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7965: mov ecx, dword ptr [r12 + 0x48]
0xdf796a: dec ecx
0xdf796c: shl rcx, 5
0xdf7970: add rcx, qword ptr [r12 + 0x40]
0xdf7975: vzeroupper 
0xdf7978: call 0x14035f1f0
0xdf797d: dec dword ptr [r12 + 0x48]
0xdf7982: mov r12, qword ptr [rsi + 0xe0]
0xdf7989: add r12, 0x40
0xdf798d: mov eax, dword ptr [r12 + 8]
0xdf7992: mov r14d, edi
0xdf7995: test eax, eax
0xdf7997: je 0x140df7a10
0xdf7999: mov r8, qword ptr [r12]
0xdf799d: lea rdx, [rip + 0x9e5c]
0xdf79a4: nop dword ptr [rax]
0xdf79a8: nop dword ptr [rax + rax]
0xdf79b0: mov r15d, r14d
0xdf79b3: shl r15, 5
0xdf79b7: lea rcx, [r15 + r8]
0xdf79bb: cmp rbx, qword ptr [rcx]
0xdf79be: jne 0x140df79c6
0xdf79c0: cmp rdx, qword ptr [rcx + 8]
0xdf79c4: je 0x140df79d0
0xdf79c6: inc r14d
0xdf79c9: cmp r14d, eax
0xdf79cc: jb 0x140df79b0
0xdf79ce: jmp 0x140df7a10
0xdf79d0: call 0x14035f1f0
0xdf79d5: mov eax, dword ptr [r12 + 8]
0xdf79da: dec eax
0xdf79dc: cmp r14d, eax
0xdf79df: jae 0x140df7a0b
0xdf79e1: mov rcx, qword ptr [r12]
0xdf79e5: shl rax, 5
0xdf79e9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf79ee: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf79f4: mov ecx, dword ptr [r12 + 8]
0xdf79f9: dec ecx
0xdf79fb: shl rcx, 5
0xdf79ff: add rcx, qword ptr [r12]
0xdf7a03: vzeroupper 
0xdf7a06: call 0x14035f1f0
0xdf7a0b: dec dword ptr [r12 + 8]
0xdf7a10: mov rcx, qword ptr [rsi + 0xe8]
0xdf7a17: add rcx, 0x40
0xdf7a1b: lea r8, [rip + 0x9e4e]
0xdf7a22: mov rdx, rbx
0xdf7a25: call 0x140763d30
0xdf7a2a: mov rcx, qword ptr [rsi + 0x9e0]
0xdf7a31: add rcx, 0x40
0xdf7a35: lea r8, [rip + 0x9e54]
0xdf7a3c: mov rdx, rbx
0xdf7a3f: call 0x140763d30
0xdf7a44: mov r12, qword ptr [rsi + 0x358]
0xdf7a4b: mov eax, dword ptr [r12 + 0x48]
0xdf7a50: mov r14d, edi
0xdf7a53: test eax, eax
0xdf7a55: je 0x140df7ad2
0xdf7a57: mov r8, qword ptr [r12 + 0x40]
0xdf7a5c: lea rdx, [rip + 0x9e3d]
0xdf7a63: nop dword ptr [rax]
0xdf7a67: nop word ptr [rax + rax]
0xdf7a70: mov r15d, r14d
0xdf7a73: shl r15, 5
0xdf7a77: lea rcx, [r15 + r8]
0xdf7a7b: cmp rbx, qword ptr [rcx]
0xdf7a7e: jne 0x140df7a86
0xdf7a80: cmp rdx, qword ptr [rcx + 8]
0xdf7a84: je 0x140df7a90
0xdf7a86: inc r14d
0xdf7a89: cmp r14d, eax
0xdf7a8c: jb 0x140df7a70
0xdf7a8e: jmp 0x140df7ad2
0xdf7a90: call 0x14035f1f0
0xdf7a95: mov eax, dword ptr [r12 + 0x48]
0xdf7a9a: dec eax
0xdf7a9c: cmp r14d, eax
0xdf7a9f: jae 0x140df7acd
0xdf7aa1: mov rcx, qword ptr [r12 + 0x40]
0xdf7aa6: shl rax, 5
0xdf7aaa: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7aaf: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7ab5: mov ecx, dword ptr [r12 + 0x48]
0xdf7aba: dec ecx
0xdf7abc: shl rcx, 5
0xdf7ac0: add rcx, qword ptr [r12 + 0x40]
0xdf7ac5: vzeroupper 
0xdf7ac8: call 0x14035f1f0
0xdf7acd: dec dword ptr [r12 + 0x48]
0xdf7ad2: mov r12, qword ptr [rsi + 0xd8]
0xdf7ad9: add r12, 0x40
0xdf7add: mov eax, dword ptr [r12 + 8]
0xdf7ae2: mov r14d, edi
0xdf7ae5: test eax, eax
0xdf7ae7: je 0x140df7b60
0xdf7ae9: mov r8, qword ptr [r12]
0xdf7aed: lea rdx, [rip + 0x9dbc]
0xdf7af4: nop dword ptr [rax]
0xdf7af8: nop dword ptr [rax + rax]
0xdf7b00: mov r15d, r14d
0xdf7b03: shl r15, 5
0xdf7b07: lea rcx, [r8 + r15]
0xdf7b0b: cmp rbx, qword ptr [rcx]
0xdf7b0e: jne 0x140df7b16
0xdf7b10: cmp rdx, qword ptr [rcx + 8]
0xdf7b14: je 0x140df7b20
0xdf7b16: inc r14d
0xdf7b19: cmp r14d, eax
0xdf7b1c: jb 0x140df7b00
0xdf7b1e: jmp 0x140df7b60
0xdf7b20: call 0x14035f1f0
0xdf7b25: mov eax, dword ptr [r12 + 8]
0xdf7b2a: dec eax
0xdf7b2c: cmp r14d, eax
0xdf7b2f: jae 0x140df7b5b
0xdf7b31: mov rcx, qword ptr [r12]
0xdf7b35: shl rax, 5
0xdf7b39: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7b3e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7b44: mov ecx, dword ptr [r12 + 8]
0xdf7b49: dec ecx
0xdf7b4b: shl rcx, 5
0xdf7b4f: add rcx, qword ptr [r12]
0xdf7b53: vzeroupper 
0xdf7b56: call 0x14035f1f0
0xdf7b5b: dec dword ptr [r12 + 8]
0xdf7b60: mov r12, qword ptr [rsi + 0x660]
0xdf7b67: add r12, 0x40
0xdf7b6b: mov edx, dword ptr [r12 + 8]
0xdf7b70: mov r14d, edi
0xdf7b73: test edx, edx
0xdf7b75: je 0x140df7bf0
0xdf7b77: mov r8, qword ptr [r12]
0xdf7b7b: lea rax, [rip + 0x9e0e]
0xdf7b82: nop dword ptr [rax]
0xdf7b86: nop word ptr [rax + rax]
0xdf7b90: mov r15d, r14d
0xdf7b93: shl r15, 5
0xdf7b97: lea rcx, [r8 + r15]
0xdf7b9b: cmp rbx, qword ptr [rcx]
0xdf7b9e: jne 0x140df7ba6
0xdf7ba0: cmp rax, qword ptr [rcx + 8]
0xdf7ba4: je 0x140df7bb0
0xdf7ba6: inc r14d
0xdf7ba9: cmp r14d, edx
0xdf7bac: jb 0x140df7b90
0xdf7bae: jmp 0x140df7bf0
0xdf7bb0: call 0x14035f1f0
0xdf7bb5: mov eax, dword ptr [r12 + 8]
0xdf7bba: dec eax
0xdf7bbc: cmp r14d, eax
0xdf7bbf: jae 0x140df7beb
0xdf7bc1: mov rcx, qword ptr [r12]
0xdf7bc5: shl rax, 5
0xdf7bc9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7bce: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7bd4: mov ecx, dword ptr [r12 + 8]
0xdf7bd9: dec ecx
0xdf7bdb: shl rcx, 5
0xdf7bdf: add rcx, qword ptr [r12]
0xdf7be3: vzeroupper 
0xdf7be6: call 0x14035f1f0
0xdf7beb: dec dword ptr [r12 + 8]
0xdf7bf0: mov rcx, qword ptr [rsi + 0x668]
0xdf7bf7: add rcx, 0x40
0xdf7bfb: lea r8, [rip + 0x9d9e]
0xdf7c02: mov rdx, rbx
0xdf7c05: call 0x140763d30
0xdf7c0a: mov r12, qword ptr [rsi + 0x680]
0xdf7c11: mov edx, dword ptr [r12 + 0x48]
0xdf7c16: mov r14d, edi
0xdf7c19: test edx, edx
0xdf7c1b: je 0x140df7c92
0xdf7c1d: mov r8, qword ptr [r12 + 0x40]
0xdf7c22: lea rax, [rip + 0x9d87]
0xdf7c29: nop dword ptr [rax]
0xdf7c30: mov r15d, r14d
0xdf7c33: shl r15, 5
0xdf7c37: lea rcx, [r8 + r15]
0xdf7c3b: cmp rbx, qword ptr [rcx]
0xdf7c3e: jne 0x140df7c46
0xdf7c40: cmp rax, qword ptr [rcx + 8]
0xdf7c44: je 0x140df7c50
0xdf7c46: inc r14d
0xdf7c49: cmp r14d, edx
0xdf7c4c: jb 0x140df7c30
0xdf7c4e: jmp 0x140df7c92
0xdf7c50: call 0x14035f1f0
0xdf7c55: mov eax, dword ptr [r12 + 0x48]
0xdf7c5a: dec eax
0xdf7c5c: cmp r14d, eax
0xdf7c5f: jae 0x140df7c8d
0xdf7c61: mov rcx, qword ptr [r12 + 0x40]
0xdf7c66: shl rax, 5
0xdf7c6a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7c6f: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7c75: mov ecx, dword ptr [r12 + 0x48]
0xdf7c7a: dec ecx
0xdf7c7c: shl rcx, 5
0xdf7c80: add rcx, qword ptr [r12 + 0x40]
0xdf7c85: vzeroupper 
0xdf7c88: call 0x14035f1f0
0xdf7c8d: dec dword ptr [r12 + 0x48]
0xdf7c92: mov r12, qword ptr [rsi + 0x688]
0xdf7c99: add r12, 0x40
0xdf7c9d: mov edx, dword ptr [r12 + 8]
0xdf7ca2: mov r14d, edi
0xdf7ca5: test edx, edx
0xdf7ca7: je 0x140df7d20
0xdf7ca9: mov r8, qword ptr [r12]
0xdf7cad: lea rax, [rip + 0x9d5c]
0xdf7cb4: nop dword ptr [rax]
0xdf7cb8: nop dword ptr [rax + rax]
0xdf7cc0: mov r15d, r14d
0xdf7cc3: shl r15, 5
0xdf7cc7: lea rcx, [r8 + r15]
0xdf7ccb: cmp rbx, qword ptr [rcx]
0xdf7cce: jne 0x140df7cd6
0xdf7cd0: cmp rax, qword ptr [rcx + 8]
0xdf7cd4: je 0x140df7ce0
0xdf7cd6: inc r14d
0xdf7cd9: cmp r14d, edx
0xdf7cdc: jb 0x140df7cc0
0xdf7cde: jmp 0x140df7d20
0xdf7ce0: call 0x14035f1f0
0xdf7ce5: mov eax, dword ptr [r12 + 8]
0xdf7cea: dec eax
0xdf7cec: cmp r14d, eax
0xdf7cef: jae 0x140df7d1b
0xdf7cf1: mov rcx, qword ptr [r12]
0xdf7cf5: shl rax, 5
0xdf7cf9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7cfe: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7d04: mov ecx, dword ptr [r12 + 8]
0xdf7d09: dec ecx
0xdf7d0b: shl rcx, 5
0xdf7d0f: add rcx, qword ptr [r12]
0xdf7d13: vzeroupper 
0xdf7d16: call 0x14035f1f0
0xdf7d1b: dec dword ptr [r12 + 8]
0xdf7d20: mov r12, qword ptr [rsi + 0x690]
0xdf7d27: add r12, 0x40
0xdf7d2b: mov edx, dword ptr [r12 + 8]
0xdf7d30: mov r14d, edi
0xdf7d33: test edx, edx
0xdf7d35: je 0x140df7db0
0xdf7d37: mov r8, qword ptr [r12]
0xdf7d3b: lea rax, [rip + 0x9d3e]
0xdf7d42: nop dword ptr [rax]
0xdf7d46: nop word ptr [rax + rax]
0xdf7d50: mov r15d, r14d
0xdf7d53: shl r15, 5
0xdf7d57: lea rcx, [r15 + r8]
0xdf7d5b: cmp rbx, qword ptr [rcx]
0xdf7d5e: jne 0x140df7d66
0xdf7d60: cmp rax, qword ptr [rcx + 8]
0xdf7d64: je 0x140df7d70
0xdf7d66: inc r14d
0xdf7d69: cmp r14d, edx
0xdf7d6c: jb 0x140df7d50
0xdf7d6e: jmp 0x140df7db0
0xdf7d70: call 0x14035f1f0
0xdf7d75: mov eax, dword ptr [r12 + 8]
0xdf7d7a: dec eax
0xdf7d7c: cmp r14d, eax
0xdf7d7f: jae 0x140df7dab
0xdf7d81: mov rcx, qword ptr [r12]
0xdf7d85: shl rax, 5
0xdf7d89: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7d8e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7d94: mov ecx, dword ptr [r12 + 8]
0xdf7d99: dec ecx
0xdf7d9b: shl rcx, 5
0xdf7d9f: add rcx, qword ptr [r12]
0xdf7da3: vzeroupper 
0xdf7da6: call 0x14035f1f0
0xdf7dab: dec dword ptr [r12 + 8]
0xdf7db0: mov r12, qword ptr [rsi + 0x698]
0xdf7db7: add r12, 0x40
0xdf7dbb: mov edx, dword ptr [r12 + 8]
0xdf7dc0: mov r14d, edi
0xdf7dc3: test edx, edx
0xdf7dc5: je 0x140df7e40
0xdf7dc7: mov r8, qword ptr [r12]
0xdf7dcb: lea rax, [rip + 0x9cde]
0xdf7dd2: nop dword ptr [rax]
0xdf7dd6: nop word ptr [rax + rax]
0xdf7de0: mov r15d, r14d
0xdf7de3: shl r15, 5
0xdf7de7: lea rcx, [r8 + r15]
0xdf7deb: cmp rbx, qword ptr [rcx]
0xdf7dee: jne 0x140df7df6
0xdf7df0: cmp rax, qword ptr [rcx + 8]
0xdf7df4: je 0x140df7e00
0xdf7df6: inc r14d
0xdf7df9: cmp r14d, edx
0xdf7dfc: jb 0x140df7de0
0xdf7dfe: jmp 0x140df7e40
0xdf7e00: call 0x14035f1f0
0xdf7e05: mov eax, dword ptr [r12 + 8]
0xdf7e0a: dec eax
0xdf7e0c: cmp r14d, eax
0xdf7e0f: jae 0x140df7e3b
0xdf7e11: mov rcx, qword ptr [r12]
0xdf7e15: shl rax, 5
0xdf7e19: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7e1e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7e24: mov ecx, dword ptr [r12 + 8]
0xdf7e29: dec ecx
0xdf7e2b: shl rcx, 5
0xdf7e2f: add rcx, qword ptr [r12]
0xdf7e33: vzeroupper 
0xdf7e36: call 0x14035f1f0
0xdf7e3b: dec dword ptr [r12 + 8]
0xdf7e40: mov rcx, qword ptr [rsi + 0x2f0]
0xdf7e47: add rcx, 0x40
0xdf7e4b: lea r8, [rip + 0x9c7e]
0xdf7e52: mov rdx, rbx
0xdf7e55: call 0x140763d30
0xdf7e5a: mov r12, qword ptr [rsi + 0x270]
0xdf7e61: mov edx, dword ptr [r12 + 0x48]
0xdf7e66: mov r14d, edi
0xdf7e69: test edx, edx
0xdf7e6b: je 0x140df7ee2
0xdf7e6d: mov r8, qword ptr [r12 + 0x40]
0xdf7e72: lea rax, [rip + 0x9c77]
0xdf7e79: nop dword ptr [rax]
0xdf7e80: mov r15d, r14d
0xdf7e83: shl r15, 5
0xdf7e87: lea rcx, [r8 + r15]
0xdf7e8b: cmp rbx, qword ptr [rcx]
0xdf7e8e: jne 0x140df7e96
0xdf7e90: cmp rax, qword ptr [rcx + 8]
0xdf7e94: je 0x140df7ea0
0xdf7e96: inc r14d
0xdf7e99: cmp r14d, edx
0xdf7e9c: jb 0x140df7e80
0xdf7e9e: jmp 0x140df7ee2
0xdf7ea0: call 0x14035f1f0
0xdf7ea5: mov eax, dword ptr [r12 + 0x48]
0xdf7eaa: dec eax
0xdf7eac: cmp r14d, eax
0xdf7eaf: jae 0x140df7edd
0xdf7eb1: mov rcx, qword ptr [r12 + 0x40]
0xdf7eb6: shl rax, 5
0xdf7eba: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7ebf: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7ec5: mov ecx, dword ptr [r12 + 0x48]
0xdf7eca: dec ecx
0xdf7ecc: shl rcx, 5
0xdf7ed0: add rcx, qword ptr [r12 + 0x40]
0xdf7ed5: vzeroupper 
0xdf7ed8: call 0x14035f1f0
0xdf7edd: dec dword ptr [r12 + 0x48]
0xdf7ee2: mov rcx, qword ptr [rsi + 0x278]
0xdf7ee9: add rcx, 0x40
0xdf7eed: lea r8, [rip + 0x9c0c]
0xdf7ef4: mov rdx, rbx
0xdf7ef7: call 0x140763d30
0xdf7efc: mov r12, qword ptr [rsi + 0x6f8]
0xdf7f03: mov edx, dword ptr [r12 + 0x48]
0xdf7f08: mov r14d, edi
0xdf7f0b: test edx, edx
0xdf7f0d: je 0x140df7f82
0xdf7f0f: mov r8, qword ptr [r12 + 0x40]
0xdf7f14: lea rax, [rip + 0x9bf5]
0xdf7f1b: nop dword ptr [rax + rax]
0xdf7f20: mov r15d, r14d
0xdf7f23: shl r15, 5
0xdf7f27: lea rcx, [r8 + r15]
0xdf7f2b: cmp rbx, qword ptr [rcx]
0xdf7f2e: jne 0x140df7f36
0xdf7f30: cmp rax, qword ptr [rcx + 8]
0xdf7f34: je 0x140df7f40
0xdf7f36: inc r14d
0xdf7f39: cmp r14d, edx
0xdf7f3c: jb 0x140df7f20
0xdf7f3e: jmp 0x140df7f82
0xdf7f40: call 0x14035f1f0
0xdf7f45: mov eax, dword ptr [r12 + 0x48]
0xdf7f4a: dec eax
0xdf7f4c: cmp r14d, eax
0xdf7f4f: jae 0x140df7f7d
0xdf7f51: mov rcx, qword ptr [r12 + 0x40]
0xdf7f56: shl rax, 5
0xdf7f5a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7f5f: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7f65: mov ecx, dword ptr [r12 + 0x48]
0xdf7f6a: dec ecx
0xdf7f6c: shl rcx, 5
0xdf7f70: add rcx, qword ptr [r12 + 0x40]
0xdf7f75: vzeroupper 
0xdf7f78: call 0x14035f1f0
0xdf7f7d: dec dword ptr [r12 + 0x48]
0xdf7f82: mov r15, qword ptr [rsi + 0x178]
0xdf7f89: add r15, 0x40
0xdf7f8d: mov edx, dword ptr [r15 + 8]
0xdf7f91: test edx, edx
0xdf7f93: je 0x140df7ff8
0xdf7f95: mov r8, qword ptr [r15]
0xdf7f98: lea rax, [rip + 0x9b81]
0xdf7f9f: nop 
0xdf7fa0: mov r14d, edi
0xdf7fa3: shl r14, 5
0xdf7fa7: lea rcx, [r8 + r14]
0xdf7fab: cmp rbx, qword ptr [rcx]
0xdf7fae: jne 0x140df7fb6
0xdf7fb0: cmp rax, qword ptr [rcx + 8]
0xdf7fb4: je 0x140df7fbe
0xdf7fb6: inc edi
0xdf7fb8: cmp edi, edx
0xdf7fba: jb 0x140df7fa0
0xdf7fbc: jmp 0x140df7ff8
0xdf7fbe: call 0x14035f1f0
0xdf7fc3: mov eax, dword ptr [r15 + 8]
0xdf7fc7: dec eax
0xdf7fc9: cmp edi, eax
0xdf7fcb: jae 0x140df7ff4
0xdf7fcd: mov rcx, qword ptr [r15]
0xdf7fd0: shl rax, 5
0xdf7fd4: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7fd9: vmovups ymmword ptr [rcx + r14], ymm0
0xdf7fdf: mov ecx, dword ptr [r15 + 8]
0xdf7fe3: dec ecx
0xdf7fe5: shl rcx, 5
0xdf7fe9: add rcx, qword ptr [r15]
0xdf7fec: vzeroupper 
0xdf7fef: call 0x14035f1f0
0xdf7ff4: dec dword ptr [r15 + 8]
0xdf7ff8: mov rcx, qword ptr [rsi + 0x180]
0xdf7fff: add rcx, 0x40
0xdf8003: lea r8, [rip + 0x9b66]
0xdf800a: mov rdx, rbx
0xdf800d: call 0x140763d30
0xdf8012: mov rcx, qword ptr [rsi + 0x188]
0xdf8019: add rcx, 0x40
0xdf801d: lea r8, [rip + 0x9b5c]
0xdf8024: mov rdx, rbx
0xdf8027: call 0x140763d30
0xdf802c: mov rcx, qword ptr [rsi + 0x450]
0xdf8033: add rcx, 0x40
0xdf8037: lea r8, [rip + 0x9b52]
0xdf803e: mov rdx, rbx
0xdf8041: call 0x140763d30
0xdf8046: mov rcx, qword ptr [rsi + 0x6c8]
0xdf804d: add rcx, 0x40
0xdf8051: lea r8, [rip + 0x9b48]
0xdf8058: mov rdx, rbx
0xdf805b: call 0x140763d30
0xdf8060: mov rcx, qword ptr [rsi + 0x6d0]
0xdf8067: add rcx, 0x40
0xdf806b: lea r8, [rip + 0x9b3e]
0xdf8072: mov rdx, rbx
0xdf8075: call 0x140763d30
0xdf807a: mov rcx, qword ptr [rsi + 0x6d8]
0xdf8081: add rcx, 0x40
0xdf8085: lea r8, [rip + 0x9b44]
0xdf808c: mov rdx, rbx
0xdf808f: call 0x140763d30
0xdf8094: mov rcx, qword ptr [rsi + 0x6e0]
0xdf809b: add rcx, 0x40
0xdf809f: mov rdx, rbx
0xdf80a2: call 0x140e006b0
0xdf80a7: mov rcx, qword ptr [rsi + 0x120]
0xdf80ae: add rcx, 0x40
0xdf80b2: lea r8, [rip + 0x9b47]
0xdf80b9: mov rdx, rbx
0xdf80bc: call 0x140763d30
0xdf80c1: mov rcx, qword ptr [rsi + 0x128]
0xdf80c8: add rcx, 0x40
0xdf80cc: lea r8, [rip + 0x9b3d]
0xdf80d3: mov rdx, rbx
0xdf80d6: call 0x140763d30
0xdf80db: mov rcx, qword ptr [rsi + 0x148]
0xdf80e2: add rcx, 0x40
0xdf80e6: lea r8, [rip + 0x9b33]
0xdf80ed: mov rdx, rbx
0xdf80f0: call 0x140763d30
0xdf80f5: mov rcx, qword ptr [rsi + 0xb60]
0xdf80fc: add rcx, 0x40
0xdf8100: lea r8, [rip + 0x9b29]
0xdf8107: mov rdx, rbx
0xdf810a: call 0x140763d30
0xdf810f: mov rcx, qword ptr [rsi + 0xad0]
0xdf8116: add rcx, 0x40
0xdf811a: mov rdx, rbx
0xdf811d: call 0x140e009a0
0xdf8122: lea r11, [rsp + 0x120]
0xdf812a: mov rbx, qword ptr [r11 + 0x30]
0xdf812e: mov rsi, qword ptr [r11 + 0x38]
0xdf8132: mov rdi, qword ptr [r11 + 0x48]
0xdf8136: mov rsp, r11
0xdf8139: pop r15
0xdf813b: pop r14
0xdf813d: pop r13
0xdf813f: pop r12
0xdf8141: pop rbp
0xdf8142: ret 
target=0xe016b0 reference=0xdf73bd return=0xdf73c4 function=14636176
0xdf5490: mov qword ptr [rsp + 8], rbx
0xdf5495: mov qword ptr [rsp + 0x10], rsi
0xdf549a: mov qword ptr [rsp + 0x20], rdi
0xdf549f: push rbp
0xdf54a0: push r12
0xdf54a2: push r13
0xdf54a4: push r14
0xdf54a6: push r15
0xdf54a8: lea rbp, [rsp - 0x20]
0xdf54ad: sub rsp, 0x120
0xdf54b4: mov rbx, rcx
0xdf54b7: mov rax, qword ptr [rip + 0x5f73d2a]
0xdf54be: mov rsi, qword ptr [rax + 0xb0]
0xdf54c5: mov r12, qword ptr [rsi + 0x808]
0xdf54cc: xor edi, edi
0xdf54ce: test dl, dl
0xdf54d0: je 0x140df7288
0xdf54d6: mov qword ptr [rbp - 0x60], rcx
0xdf54da: lea rax, [rip + 0xc10f]
0xdf54e1: mov qword ptr [rbp - 0x58], rax
0xdf54e5: mov qword ptr [rbp - 0x50], rdi
0xdf54e9: mov word ptr [rbp - 0x48], di
0xdf54ed: lea rdx, [rbp - 0x60]
0xdf54f1: lea rcx, [r12 + 0x40]
0xdf54f6: call 0x140476290
0xdf54fb: nop 
0xdf54fc: mov byte ptr [rbp - 0x47], dil
0xdf5500: mov rcx, qword ptr [rsi + 0x210]
0xdf5507: add rcx, 0x40
0xdf550b: mov qword ptr [rsp + 0x40], rbx
0xdf5510: lea r8, [rip + 0xc109]
0xdf5517: mov qword ptr [rsp + 0x48], r8
0xdf551c: mov qword ptr [rsp + 0x50], rdi
0xdf5521: mov word ptr [rsp + 0x58], di
0xdf5526: lea rdx, [rsp + 0x40]
0xdf552b: call 0x140476290
0xdf5530: nop 
0xdf5531: mov byte ptr [rsp + 0x59], dil
0xdf5536: mov r14, qword ptr [rsi + 0x610]
0xdf553d: mov qword ptr [rsp + 0x20], rbx
0xdf5542: lea rax, [rip + 0xc117]
0xdf5549: mov qword ptr [rsp + 0x28], rax
0xdf554e: mov qword ptr [rsp + 0x30], rdi
0xdf5553: mov word ptr [rsp + 0x38], di
0xdf5558: mov ecx, dword ptr [r14 + 0x48]
0xdf555c: mov eax, dword ptr [r14 + 0x4c]
0xdf5560: mov r15d, 1
0xdf5566: mov edx, 0x1fd
0xdf556b: cmp eax, ecx
0xdf556d: ja 0x140df565c
0xdf5573: lea r12d, [rax*2 + 1]
0xdf557b: add r12d, eax
0xdf557e: shr r12d, 1
0xdf5581: cmp r12d, r15d
0xdf5584: cmovb r12d, r15d
0xdf5588: cmp ecx, r12d
0xdf558b: cmova r12d, ecx
0xdf558f: cmp r12d, eax
0xdf5592: jbe 0x140df565c
0xdf5598: mov ecx, r12d
0xdf559b: shl ecx, 5
0xdf559e: mov r8d, edx
0xdf55a1: mov rax, qword ptr gs:[0x58]
0xdf55aa: mov rax, qword ptr [rax]
0xdf55ad: add rax, r8
0xdf55b0: mov qword ptr [rbp + 0x60], rax
0xdf55b4: mov edx, 8
0xdf55b9: cmp byte ptr [rax], dil
0xdf55bc: je 0x140df55c5
0xdf55be: call 0x1447efa78
0xdf55c3: jmp 0x140df55ca
0xdf55c5: call 0x1447ef9b0
0xdf55ca: mov r13, rax
0xdf55cd: test rax, rax
0xdf55d0: jne 0x140df55eb
0xdf55d2: call 0x141318e70
0xdf55d7: xor r9d, r9d
0xdf55da: xor r8d, r8d
0xdf55dd: mov edx, r15d
0xdf55e0: mov ecx, 0xa0000002
0xdf55e5: call qword ptr [rip + 0x43f5b5d]
0xdf55eb: mov r15d, edi
0xdf55ee: cmp dword ptr [r14 + 0x48], edi
0xdf55f2: jbe 0x140df562b
0xdf55f4: nop dword ptr [rax]
0xdf55f8: nop dword ptr [rax + rax]
0xdf5600: mov ecx, r15d
0xdf5603: shl rcx, 5
0xdf5607: mov rax, qword ptr [r14 + 0x40]
0xdf560b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf5610: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5616: add rcx, qword ptr [r14 + 0x40]
0xdf561a: vzeroupper 
0xdf561d: call 0x14035f1f0
0xdf5622: inc r15d
0xdf5625: cmp r15d, dword ptr [r14 + 0x48]
0xdf5629: jb 0x140df5600
0xdf562b: mov rcx, qword ptr [r14 + 0x40]
0xdf562f: test rcx, rcx
0xdf5632: je 0x140df5649
0xdf5634: mov rax, qword ptr [rbp + 0x60]
0xdf5638: cmp byte ptr [rax], 0
0xdf563b: je 0x140df5644
0xdf563d: call 0x1447f03bc
0xdf5642: jmp 0x140df5649
0xdf5644: call 0x1447f02bc
0xdf5649: mov qword ptr [r14 + 0x40], r13
0xdf564d: mov dword ptr [r14 + 0x4c], r12d
0xdf5651: mov r15d, 1
0xdf5657: mov edx, 0x1fd
0xdf565c: mov eax, dword ptr [r14 + 0x48]
0xdf5660: shl rax, 5
0xdf5664: add rax, qword ptr [r14 + 0x40]
0xdf5668: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf566e: vmovups ymmword ptr [rax], ymm0
0xdf5672: inc dword ptr [r14 + 0x48]
0xdf5676: mov byte ptr [rsp + 0x39], 0
0xdf567b: mov r14, qword ptr [rsi + 0x618]
0xdf5682: mov qword ptr [rsp + 0x40], rbx
0xdf5687: lea rax, [rip + 0xc022]
0xdf568e: mov qword ptr [rsp + 0x48], rax
0xdf5693: mov qword ptr [rsp + 0x50], rdi
0xdf5698: mov word ptr [rsp + 0x58], 0
0xdf569f: mov ecx, dword ptr [r14 + 0x48]
0xdf56a3: mov eax, dword ptr [r14 + 0x4c]
0xdf56a7: cmp eax, ecx
0xdf56a9: ja 0x140df5791
0xdf56af: lea r12d, [rax*2 + 1]
0xdf56b7: add r12d, eax
0xdf56ba: shr r12d, 1
0xdf56bd: cmp r12d, 1
0xdf56c1: cmovb r12d, r15d
0xdf56c5: cmp ecx, r12d
0xdf56c8: cmova r12d, ecx
0xdf56cc: cmp r12d, eax
0xdf56cf: jbe 0x140df5791
0xdf56d5: mov ecx, r12d
0xdf56d8: shl ecx, 5
0xdf56db: mov r8d, edx
0xdf56de: mov rax, qword ptr gs:[0x58]
0xdf56e7: mov rax, qword ptr [rax]
0xdf56ea: add rax, r8
0xdf56ed: mov qword ptr [rbp + 0x60], rax
0xdf56f1: mov edx, 8
0xdf56f6: vzeroupper 
0xdf56f9: cmp byte ptr [rax], 0
0xdf56fc: je 0x140df5705
0xdf56fe: call 0x1447efa78
0xdf5703: jmp 0x140df570a
0xdf5705: call 0x1447ef9b0
0xdf570a: mov r13, rax
0xdf570d: test rax, rax
0xdf5710: jne 0x140df572b
0xdf5712: call 0x141318e70
0xdf5717: xor r9d, r9d
0xdf571a: xor r8d, r8d
0xdf571d: mov edx, r15d
0xdf5720: mov ecx, 0xa0000002
0xdf5725: call qword ptr [rip + 0x43f5a1d]
0xdf572b: mov r15d, edi
0xdf572e: cmp dword ptr [r14 + 0x48], edi
0xdf5732: jbe 0x140df576b
0xdf5734: nop dword ptr [rax]
0xdf5738: nop dword ptr [rax + rax]
0xdf5740: mov ecx, r15d
0xdf5743: shl rcx, 5
0xdf5747: mov rax, qword ptr [r14 + 0x40]
0xdf574b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf5750: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5756: add rcx, qword ptr [r14 + 0x40]
0xdf575a: vzeroupper 
0xdf575d: call 0x14035f1f0
0xdf5762: inc r15d
0xdf5765: cmp r15d, dword ptr [r14 + 0x48]
0xdf5769: jb 0x140df5740
0xdf576b: mov rcx, qword ptr [r14 + 0x40]
0xdf576f: test rcx, rcx
0xdf5772: je 0x140df5789
0xdf5774: mov rax, qword ptr [rbp + 0x60]
0xdf5778: cmp byte ptr [rax], 0
0xdf577b: je 0x140df5784
0xdf577d: call 0x1447f03bc
0xdf5782: jmp 0x140df5789
0xdf5784: call 0x1447f02bc
0xdf5789: mov qword ptr [r14 + 0x40], r13
0xdf578d: mov dword ptr [r14 + 0x4c], r12d
0xdf5791: mov eax, dword ptr [r14 + 0x48]
0xdf5795: shl rax, 5
0xdf5799: add rax, qword ptr [r14 + 0x40]
0xdf579d: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf57a3: vmovups ymmword ptr [rax], ymm0
0xdf57a7: inc dword ptr [r14 + 0x48]
0xdf57ab: mov byte ptr [rsp + 0x59], 0
0xdf57b0: mov r14, qword ptr [rsi + 0x650]
0xdf57b7: mov qword ptr [rsp + 0x20], rbx
0xdf57bc: lea rax, [rip + 0xbf2d]
0xdf57c3: mov qword ptr [rsp + 0x28], rax
0xdf57c8: mov qword ptr [rsp + 0x30], rdi
0xdf57cd: mov word ptr [rsp + 0x38], 0
0xdf57d4: mov ecx, dword ptr [r14 + 0x48]
0xdf57d8: mov eax, dword ptr [r14 + 0x4c]
0xdf57dc: mov r15d, 1
0xdf57e2: cmp eax, ecx
0xdf57e4: ja 0x140df58d7
0xdf57ea: lea r12d, [rax*2 + 1]
0xdf57f2: add r12d, eax
0xdf57f5: shr r12d, 1
0xdf57f8: cmp r12d, r15d
0xdf57fb: cmovb r12d, r15d
0xdf57ff: cmp ecx, r12d
0xdf5802: cmova r12d, ecx
0xdf5806: cmp r12d, eax
0xdf5809: jbe 0x140df58d7
0xdf580f: mov ecx, r12d
0xdf5812: shl ecx, 5
0xdf5815: mov r8d, 0x1fd
0xdf581b: mov rax, qword ptr gs:[0x58]
0xdf5824: mov rax, qword ptr [rax]
0xdf5827: add rax, r8
0xdf582a: mov qword ptr [rbp + 0x60], rax
0xdf582e: mov edx, 8
0xdf5833: vzeroupper 
0xdf5836: cmp byte ptr [rax], 0
0xdf5839: je 0x140df5842
0xdf583b: call 0x1447efa78
0xdf5840: jmp 0x140df5847
0xdf5842: call 0x1447ef9b0
0xdf5847: mov r13, rax
0xdf584a: test rax, rax
0xdf584d: jne 0x140df5868
0xdf584f: call 0x141318e70
0xdf5854: xor r9d, r9d
0xdf5857: xor r8d, r8d
0xdf585a: mov edx, r15d
0xdf585d: mov ecx, 0xa0000002
0xdf5862: call qword ptr [rip + 0x43f58e0]
0xdf5868: mov r15d, edi
0xdf586b: cmp dword ptr [r14 + 0x48], edi
0xdf586f: jbe 0x140df58ab
0xdf5871: nop dword ptr [rax]
0xdf5875: nop word ptr [rax + rax]
0xdf5880: mov ecx, r15d
0xdf5883: shl rcx, 5
0xdf5887: mov rax, qword ptr [r14 + 0x40]
0xdf588b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5890: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5896: add rcx, qword ptr [r14 + 0x40]
0xdf589a: vzeroupper 
0xdf589d: call 0x14035f1f0
0xdf58a2: inc r15d
0xdf58a5: cmp r15d, dword ptr [r14 + 0x48]
0xdf58a9: jb 0x140df5880
0xdf58ab: mov rcx, qword ptr [r14 + 0x40]
0xdf58af: test rcx, rcx
0xdf58b2: je 0x140df58c9
0xdf58b4: mov rax, qword ptr [rbp + 0x60]
0xdf58b8: cmp byte ptr [rax], 0
0xdf58bb: je 0x140df58c4
0xdf58bd: call 0x1447f03bc
0xdf58c2: jmp 0x140df58c9
0xdf58c4: call 0x1447f02bc
0xdf58c9: mov qword ptr [r14 + 0x40], r13
0xdf58cd: mov dword ptr [r14 + 0x4c], r12d
0xdf58d1: mov r15d, 1
0xdf58d7: mov eax, dword ptr [r14 + 0x48]
0xdf58db: shl rax, 5
0xdf58df: add rax, qword ptr [r14 + 0x40]
0xdf58e3: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf58e9: vmovups ymmword ptr [rax], ymm0
0xdf58ed: inc dword ptr [r14 + 0x48]
0xdf58f1: mov byte ptr [rsp + 0x39], 0
0xdf58f6: mov r14, qword ptr [rsi + 0x630]
0xdf58fd: mov qword ptr [rsp + 0x40], rbx
0xdf5902: lea rax, [rip + 0xbe07]
0xdf5909: mov qword ptr [rsp + 0x48], rax
0xdf590e: mov qword ptr [rsp + 0x50], rdi
0xdf5913: mov word ptr [rsp + 0x58], 0
0xdf591a: mov ecx, dword ptr [r14 + 0x48]
0xdf591e: mov eax, dword ptr [r14 + 0x4c]
0xdf5922: cmp eax, ecx
0xdf5924: ja 0x140df5a11
0xdf592a: lea r12d, [rax*2 + 1]
0xdf5932: add r12d, eax
0xdf5935: shr r12d, 1
0xdf5938: cmp r12d, 1
0xdf593c: cmovb r12d, r15d
0xdf5940: cmp ecx, r12d
0xdf5943: cmova r12d, ecx
0xdf5947: cmp r12d, eax
0xdf594a: jbe 0x140df5a11
0xdf5950: mov ecx, r12d
0xdf5953: shl ecx, 5
0xdf5956: mov r8d, 0x1fd
0xdf595c: mov rax, qword ptr gs:[0x58]
0xdf5965: mov rax, qword ptr [rax]
0xdf5968: add rax, r8
0xdf596b: mov qword ptr [rbp + 0x60], rax
0xdf596f: mov edx, 8
0xdf5974: vzeroupper 
0xdf5977: cmp byte ptr [rax], 0
0xdf597a: je 0x140df5983
0xdf597c: call 0x1447efa78
0xdf5981: jmp 0x140df5988
0xdf5983: call 0x1447ef9b0
0xdf5988: mov r13, rax
0xdf598b: test rax, rax
0xdf598e: jne 0x140df59a9
0xdf5990: call 0x141318e70
0xdf5995: xor r9d, r9d
0xdf5998: xor r8d, r8d
0xdf599b: mov edx, r15d
0xdf599e: mov ecx, 0xa0000002
0xdf59a3: call qword ptr [rip + 0x43f579f]
0xdf59a9: mov r15d, edi
0xdf59ac: cmp dword ptr [r14 + 0x48], edi
0xdf59b0: jbe 0x140df59eb
0xdf59b2: nop dword ptr [rax]
0xdf59b6: nop word ptr [rax + rax]
0xdf59c0: mov ecx, r15d
0xdf59c3: shl rcx, 5
0xdf59c7: mov rax, qword ptr [r14 + 0x40]
0xdf59cb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf59d0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf59d6: add rcx, qword ptr [r14 + 0x40]
0xdf59da: vzeroupper 
0xdf59dd: call 0x14035f1f0
0xdf59e2: inc r15d
0xdf59e5: cmp r15d, dword ptr [r14 + 0x48]
0xdf59e9: jb 0x140df59c0
0xdf59eb: mov rcx, qword ptr [r14 + 0x40]
0xdf59ef: test rcx, rcx
0xdf59f2: je 0x140df5a09
0xdf59f4: mov rax, qword ptr [rbp + 0x60]
0xdf59f8: cmp byte ptr [rax], 0
0xdf59fb: je 0x140df5a04
0xdf59fd: call 0x1447f03bc
0xdf5a02: jmp 0x140df5a09
0xdf5a04: call 0x1447f02bc
0xdf5a09: mov qword ptr [r14 + 0x40], r13
0xdf5a0d: mov dword ptr [r14 + 0x4c], r12d
0xdf5a11: mov eax, dword ptr [r14 + 0x48]
0xdf5a15: shl rax, 5
0xdf5a19: add rax, qword ptr [r14 + 0x40]
0xdf5a1d: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf5a23: vmovups ymmword ptr [rax], ymm0
0xdf5a27: inc dword ptr [r14 + 0x48]
0xdf5a2b: mov byte ptr [rsp + 0x59], 0
0xdf5a30: mov rcx, qword ptr [rsi + 0x628]
0xdf5a37: add rcx, 0x40
0xdf5a3b: mov qword ptr [rsp + 0x20], rbx
0xdf5a40: lea r8, [rip + 0xbcd9]
0xdf5a47: mov qword ptr [rsp + 0x28], r8
0xdf5a4c: mov qword ptr [rsp + 0x30], rdi
0xdf5a51: mov word ptr [rsp + 0x38], 0
0xdf5a58: lea rdx, [rsp + 0x20]
0xdf5a5d: vzeroupper 
0xdf5a60: call 0x140476290
0xdf5a65: nop 
0xdf5a66: mov byte ptr [rsp + 0x39], 0
0xdf5a6b: mov r14, qword ptr [rsi + 0x620]
0xdf5a72: mov qword ptr [rbp - 0x60], rbx
0xdf5a76: lea rax, [rip + 0xbcd3]
0xdf5a7d: mov qword ptr [rbp - 0x58], rax
0xdf5a81: mov qword ptr [rbp - 0x50], rdi
0xdf5a85: mov word ptr [rbp - 0x48], 0
0xdf5a8b: mov ecx, dword ptr [r14 + 0x48]
0xdf5a8f: mov eax, dword ptr [r14 + 0x4c]
0xdf5a93: mov r15d, 1
0xdf5a99: cmp eax, ecx
0xdf5a9b: ja 0x140df5b87
0xdf5aa1: lea r12d, [rax*2 + 1]
0xdf5aa9: add r12d, eax
0xdf5aac: shr r12d, 1
0xdf5aaf: cmp r12d, r15d
0xdf5ab2: cmovb r12d, r15d
0xdf5ab6: cmp ecx, r12d
0xdf5ab9: cmova r12d, ecx
0xdf5abd: cmp r12d, eax
0xdf5ac0: jbe 0x140df5b87
0xdf5ac6: mov ecx, r12d
0xdf5ac9: shl ecx, 5
0xdf5acc: mov r8d, 0x1fd
0xdf5ad2: mov rax, qword ptr gs:[0x58]
0xdf5adb: mov rax, qword ptr [rax]
0xdf5ade: add rax, r8
0xdf5ae1: mov qword ptr [rbp + 0x60], rax
0xdf5ae5: mov edx, 8
0xdf5aea: cmp byte ptr [rax], 0
0xdf5aed: je 0x140df5af6
0xdf5aef: call 0x1447efa78
0xdf5af4: jmp 0x140df5afb
0xdf5af6: call 0x1447ef9b0
0xdf5afb: mov r13, rax
0xdf5afe: test rax, rax
0xdf5b01: jne 0x140df5b1c
0xdf5b03: call 0x141318e70
0xdf5b08: xor r9d, r9d
0xdf5b0b: xor r8d, r8d
0xdf5b0e: mov edx, r15d
0xdf5b11: mov ecx, 0xa0000002
0xdf5b16: call qword ptr [rip + 0x43f562c]
0xdf5b1c: mov r15d, edi
0xdf5b1f: cmp dword ptr [r14 + 0x48], edi
0xdf5b23: jbe 0x140df5b5b
0xdf5b25: nop word ptr [rax + rax]
0xdf5b30: mov ecx, r15d
0xdf5b33: shl rcx, 5
0xdf5b37: mov rax, qword ptr [r14 + 0x40]
0xdf5b3b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5b40: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5b46: add rcx, qword ptr [r14 + 0x40]
0xdf5b4a: vzeroupper 
0xdf5b4d: call 0x14035f1f0
0xdf5b52: inc r15d
0xdf5b55: cmp r15d, dword ptr [r14 + 0x48]
0xdf5b59: jb 0x140df5b30
0xdf5b5b: mov rcx, qword ptr [r14 + 0x40]
0xdf5b5f: test rcx, rcx
0xdf5b62: je 0x140df5b79
0xdf5b64: mov rax, qword ptr [rbp + 0x60]
0xdf5b68: cmp byte ptr [rax], 0
0xdf5b6b: je 0x140df5b74
0xdf5b6d: call 0x1447f03bc
0xdf5b72: jmp 0x140df5b79
0xdf5b74: call 0x1447f02bc
0xdf5b79: mov qword ptr [r14 + 0x40], r13
0xdf5b7d: mov dword ptr [r14 + 0x4c], r12d
0xdf5b81: mov r15d, 1
0xdf5b87: mov eax, dword ptr [r14 + 0x48]
0xdf5b8b: shl rax, 5
0xdf5b8f: add rax, qword ptr [r14 + 0x40]
0xdf5b93: vmovups ymm0, ymmword ptr [rbp - 0x60]
0xdf5b98: vmovups ymmword ptr [rax], ymm0
0xdf5b9c: inc dword ptr [r14 + 0x48]
0xdf5ba0: mov byte ptr [rbp - 0x47], 0
0xdf5ba4: mov r14, qword ptr [rsi + 0x638]
0xdf5bab: mov qword ptr [rsp + 0x20], rbx
0xdf5bb0: lea rax, [rip + 0xbbb9]
0xdf5bb7: mov qword ptr [rsp + 0x28], rax
0xdf5bbc: mov qword ptr [rsp + 0x30], rdi
0xdf5bc1: mov word ptr [rsp + 0x38], 0
0xdf5bc8: mov ecx, dword ptr [r14 + 0x48]
0xdf5bcc: mov eax, dword ptr [r14 + 0x4c]
0xdf5bd0: cmp eax, ecx
0xdf5bd2: ja 0x140df5cb1
0xdf5bd8: lea r12d, [rax*2 + 1]
0xdf5be0: add r12d, eax
0xdf5be3: shr r12d, 1
0xdf5be6: cmp r12d, 1
0xdf5bea: cmovb r12d, r15d
0xdf5bee: cmp ecx, r12d
0xdf5bf1: cmova r12d, ecx
0xdf5bf5: cmp r12d, eax
0xdf5bf8: jbe 0x140df5cb1
0xdf5bfe: mov ecx, r12d
0xdf5c01: shl ecx, 5
0xdf5c04: mov r8d, 0x1fd
0xdf5c0a: mov rax, qword ptr gs:[0x58]
0xdf5c13: mov rax, qword ptr [rax]
0xdf5c16: add rax, r8
0xdf5c19: mov qword ptr [rbp + 0x60], rax
0xdf5c1d: mov edx, 8
0xdf5c22: vzeroupper 
0xdf5c25: cmp byte ptr [rax], 0
0xdf5c28: je 0x140df5c31
0xdf5c2a: call 0x1447efa78
0xdf5c2f: jmp 0x140df5c36
0xdf5c31: call 0x1447ef9b0
0xdf5c36: mov r13, rax
0xdf5c39: test rax, rax
0xdf5c3c: jne 0x140df5c57
0xdf5c3e: call 0x141318e70
0xdf5c43: xor r9d, r9d
0xdf5c46: xor r8d, r8d
0xdf5c49: mov edx, r15d
0xdf5c4c: mov ecx, 0xa0000002
0xdf5c51: call qword ptr [rip + 0x43f54f1]
0xdf5c57: mov r15d, edi
0xdf5c5a: cmp dword ptr [r14 + 0x48], edi
0xdf5c5e: jbe 0x140df5c8b
0xdf5c60: mov ecx, r15d
0xdf5c63: shl rcx, 5
0xdf5c67: mov rax, qword ptr [r14 + 0x40]
0xdf5c6b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5c70: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5c76: add rcx, qword ptr [r14 + 0x40]
0xdf5c7a: vzeroupper 
0xdf5c7d: call 0x14035f1f0
0xdf5c82: inc r15d
0xdf5c85: cmp r15d, dword ptr [r14 + 0x48]
0xdf5c89: jb 0x140df5c60
0xdf5c8b: mov rcx, qword ptr [r14 + 0x40]
0xdf5c8f: test rcx, rcx
0xdf5c92: je 0x140df5ca9
0xdf5c94: mov rax, qword ptr [rbp + 0x60]
0xdf5c98: cmp byte ptr [rax], 0
0xdf5c9b: je 0x140df5ca4
0xdf5c9d: call 0x1447f03bc
0xdf5ca2: jmp 0x140df5ca9
0xdf5ca4: call 0x1447f02bc
0xdf5ca9: mov qword ptr [r14 + 0x40], r13
0xdf5cad: mov dword ptr [r14 + 0x4c], r12d
0xdf5cb1: mov eax, dword ptr [r14 + 0x48]
0xdf5cb5: shl rax, 5
0xdf5cb9: add rax, qword ptr [r14 + 0x40]
0xdf5cbd: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf5cc3: vmovups ymmword ptr [rax], ymm0
0xdf5cc7: inc dword ptr [r14 + 0x48]
0xdf5ccb: mov byte ptr [rsp + 0x39], 0
0xdf5cd0: mov r14, qword ptr [rsi + 0x640]
0xdf5cd7: mov qword ptr [rsp + 0x40], rbx
0xdf5cdc: lea rax, [rip + 0xbaad]
0xdf5ce3: mov qword ptr [rsp + 0x48], rax
0xdf5ce8: mov qword ptr [rsp + 0x50], rdi
0xdf5ced: mov word ptr [rsp + 0x58], 0
0xdf5cf4: mov ecx, dword ptr [r14 + 0x48]
0xdf5cf8: mov eax, dword ptr [r14 + 0x4c]
0xdf5cfc: mov r15d, 1
0xdf5d02: cmp eax, ecx
0xdf5d04: ja 0x140df5df7
0xdf5d0a: lea r12d, [rax*2 + 1]
0xdf5d12: add r12d, eax
0xdf5d15: shr r12d, 1
0xdf5d18: cmp r12d, r15d
0xdf5d1b: cmovb r12d, r15d
0xdf5d1f: cmp ecx, r12d
0xdf5d22: cmova r12d, ecx
0xdf5d26: cmp r12d, eax
0xdf5d29: jbe 0x140df5df7
0xdf5d2f: mov ecx, r12d
0xdf5d32: shl ecx, 5
0xdf5d35: mov r8d, 0x1fd
0xdf5d3b: mov rax, qword ptr gs:[0x58]
0xdf5d44: mov rax, qword ptr [rax]
0xdf5d47: add rax, r8
0xdf5d4a: mov qword ptr [rbp + 0x60], rax
0xdf5d4e: mov edx, 8
0xdf5d53: vzeroupper 
0xdf5d56: cmp byte ptr [rax], 0
0xdf5d59: je 0x140df5d62
0xdf5d5b: call 0x1447efa78
0xdf5d60: jmp 0x140df5d67
0xdf5d62: call 0x1447ef9b0
0xdf5d67: mov r13, rax
0xdf5d6a: test rax, rax
0xdf5d6d: jne 0x140df5d88
0xdf5d6f: call 0x141318e70
0xdf5d74: xor r9d, r9d
0xdf5d77: xor r8d, r8d
0xdf5d7a: mov edx, r15d
0xdf5d7d: mov ecx, 0xa0000002
0xdf5d82: call qword ptr [rip + 0x43f53c0]
0xdf5d88: mov r15d, edi
0xdf5d8b: cmp dword ptr [r14 + 0x48], edi
0xdf5d8f: jbe 0x140df5dcb
0xdf5d91: nop dword ptr [rax]
0xdf5d95: nop word ptr [rax + rax]
0xdf5da0: mov ecx, r15d
0xdf5da3: shl rcx, 5
0xdf5da7: mov rax, qword ptr [r14 + 0x40]
0xdf5dab: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5db0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5db6: add rcx, qword ptr [r14 + 0x40]
0xdf5dba: vzeroupper 
0xdf5dbd: call 0x14035f1f0
0xdf5dc2: inc r15d
0xdf5dc5: cmp r15d, dword ptr [r14 + 0x48]
0xdf5dc9: jb 0x140df5da0
0xdf5dcb: mov rcx, qword ptr [r14 + 0x40]
0xdf5dcf: test rcx, rcx
0xdf5dd2: je 0x140df5de9
0xdf5dd4: mov rax, qword ptr [rbp + 0x60]
0xdf5dd8: cmp byte ptr [rax], 0
0xdf5ddb: je 0x140df5de4
0xdf5ddd: call 0x1447f03bc
0xdf5de2: jmp 0x140df5de9
0xdf5de4: call 0x1447f02bc
0xdf5de9: mov qword ptr [r14 + 0x40], r13
0xdf5ded: mov dword ptr [r14 + 0x4c], r12d
0xdf5df1: mov r15d, 1
0xdf5df7: mov eax, dword ptr [r14 + 0x48]
0xdf5dfb: shl rax, 5
0xdf5dff: add rax, qword ptr [r14 + 0x40]
0xdf5e03: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf5e09: vmovups ymmword ptr [rax], ymm0
0xdf5e0d: inc dword ptr [r14 + 0x48]
0xdf5e11: mov byte ptr [rsp + 0x59], 0
0xdf5e16: mov r14, qword ptr [rsi + 0x648]
0xdf5e1d: mov qword ptr [rsp + 0x20], rbx
0xdf5e22: lea rax, [rip + 0xb977]
0xdf5e29: mov qword ptr [rsp + 0x28], rax
0xdf5e2e: mov qword ptr [rsp + 0x30], rdi
0xdf5e33: mov word ptr [rsp + 0x38], 0
0xdf5e3a: mov ecx, dword ptr [r14 + 0x48]
0xdf5e3e: mov eax, dword ptr [r14 + 0x4c]
0xdf5e42: cmp eax, ecx
0xdf5e44: ja 0x140df5f31
0xdf5e4a: lea r12d, [rax*2 + 1]
0xdf5e52: add r12d, eax
0xdf5e55: shr r12d, 1
0xdf5e58: cmp r12d, 1
0xdf5e5c: cmovb r12d, r15d
0xdf5e60: cmp ecx, r12d
0xdf5e63: cmova r12d, ecx
0xdf5e67: cmp r12d, eax
0xdf5e6a: jbe 0x140df5f31
0xdf5e70: mov ecx, r12d
0xdf5e73: shl ecx, 5
0xdf5e76: mov r8d, 0x1fd
0xdf5e7c: mov rax, qword ptr gs:[0x58]
0xdf5e85: mov rax, qword ptr [rax]
0xdf5e88: add rax, r8
0xdf5e8b: mov qword ptr [rbp + 0x60], rax
0xdf5e8f: mov edx, 8
0xdf5e94: vzeroupper 
0xdf5e97: cmp byte ptr [rax], 0
0xdf5e9a: je 0x140df5ea3
0xdf5e9c: call 0x1447efa78
0xdf5ea1: jmp 0x140df5ea8
0xdf5ea3: call 0x1447ef9b0
0xdf5ea8: mov r13, rax
0xdf5eab: test rax, rax
0xdf5eae: jne 0x140df5ec9
0xdf5eb0: call 0x141318e70
0xdf5eb5: xor r9d, r9d
0xdf5eb8: xor r8d, r8d
0xdf5ebb: mov edx, r15d
0xdf5ebe: mov ecx, 0xa0000002
0xdf5ec3: call qword ptr [rip + 0x43f527f]
0xdf5ec9: mov r15d, edi
0xdf5ecc: cmp dword ptr [r14 + 0x48], edi
0xdf5ed0: jbe 0x140df5f0b
0xdf5ed2: nop dword ptr [rax]
0xdf5ed6: nop word ptr [rax + rax]
0xdf5ee0: mov ecx, r15d
0xdf5ee3: shl rcx, 5
0xdf5ee7: mov rax, qword ptr [r14 + 0x40]
0xdf5eeb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf5ef0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf5ef6: add rcx, qword ptr [r14 + 0x40]
0xdf5efa: vzeroupper 
0xdf5efd: call 0x14035f1f0
0xdf5f02: inc r15d
0xdf5f05: cmp r15d, dword ptr [r14 + 0x48]
0xdf5f09: jb 0x140df5ee0
0xdf5f0b: mov rcx, qword ptr [r14 + 0x40]
0xdf5f0f: test rcx, rcx
0xdf5f12: je 0x140df5f29
0xdf5f14: mov rax, qword ptr [rbp + 0x60]
0xdf5f18: cmp byte ptr [rax], 0
0xdf5f1b: je 0x140df5f24
0xdf5f1d: call 0x1447f03bc
0xdf5f22: jmp 0x140df5f29
0xdf5f24: call 0x1447f02bc
0xdf5f29: mov qword ptr [r14 + 0x40], r13
0xdf5f2d: mov dword ptr [r14 + 0x4c], r12d
0xdf5f31: mov eax, dword ptr [r14 + 0x48]
0xdf5f35: shl rax, 5
0xdf5f39: add rax, qword ptr [r14 + 0x40]
0xdf5f3d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf5f43: vmovups ymmword ptr [rax], ymm0
0xdf5f47: inc dword ptr [r14 + 0x48]
0xdf5f4b: mov byte ptr [rsp + 0x39], 0
0xdf5f50: mov r14, qword ptr [rsi + 0x658]
0xdf5f57: mov qword ptr [rsp + 0x40], rbx
0xdf5f5c: lea rax, [rip + 0xb84d]
0xdf5f63: mov qword ptr [rsp + 0x48], rax
0xdf5f68: mov qword ptr [rsp + 0x50], rdi
0xdf5f6d: mov word ptr [rsp + 0x58], 0
0xdf5f74: mov ecx, dword ptr [r14 + 0x48]
0xdf5f78: mov eax, dword ptr [r14 + 0x4c]
0xdf5f7c: mov r15d, 1
0xdf5f82: cmp eax, ecx
0xdf5f84: ja 0x140df6077
0xdf5f8a: lea r12d, [rax*2 + 1]
0xdf5f92: add r12d, eax
0xdf5f95: shr r12d, 1
0xdf5f98: cmp r12d, r15d
0xdf5f9b: cmovb r12d, r15d
0xdf5f9f: cmp ecx, r12d
0xdf5fa2: cmova r12d, ecx
0xdf5fa6: cmp r12d, eax
0xdf5fa9: jbe 0x140df6077
0xdf5faf: mov ecx, r12d
0xdf5fb2: shl ecx, 5
0xdf5fb5: mov r8d, 0x1fd
0xdf5fbb: mov rax, qword ptr gs:[0x58]
0xdf5fc4: mov rax, qword ptr [rax]
0xdf5fc7: add rax, r8
0xdf5fca: mov qword ptr [rbp + 0x60], rax
0xdf5fce: mov edx, 8
0xdf5fd3: vzeroupper 
0xdf5fd6: cmp byte ptr [rax], 0
0xdf5fd9: je 0x140df5fe2
0xdf5fdb: call 0x1447efa78
0xdf5fe0: jmp 0x140df5fe7
0xdf5fe2: call 0x1447ef9b0
0xdf5fe7: mov r13, rax
0xdf5fea: test rax, rax
0xdf5fed: jne 0x140df6008
0xdf5fef: call 0x141318e70
0xdf5ff4: xor r9d, r9d
0xdf5ff7: xor r8d, r8d
0xdf5ffa: mov edx, r15d
0xdf5ffd: mov ecx, 0xa0000002
0xdf6002: call qword ptr [rip + 0x43f5140]
0xdf6008: mov r15d, edi
0xdf600b: cmp dword ptr [r14 + 0x48], edi
0xdf600f: jbe 0x140df604b
0xdf6011: nop dword ptr [rax]
0xdf6015: nop word ptr [rax + rax]
0xdf6020: mov ecx, r15d
0xdf6023: shl rcx, 5
0xdf6027: mov rax, qword ptr [r14 + 0x40]
0xdf602b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6030: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6036: add rcx, qword ptr [r14 + 0x40]
0xdf603a: vzeroupper 
0xdf603d: call 0x14035f1f0
0xdf6042: inc r15d
0xdf6045: cmp r15d, dword ptr [r14 + 0x48]
0xdf6049: jb 0x140df6020
0xdf604b: mov rcx, qword ptr [r14 + 0x40]
0xdf604f: test rcx, rcx
0xdf6052: je 0x140df6069
0xdf6054: mov rax, qword ptr [rbp + 0x60]
0xdf6058: cmp byte ptr [rax], 0
0xdf605b: je 0x140df6064
0xdf605d: call 0x1447f03bc
0xdf6062: jmp 0x140df6069
0xdf6064: call 0x1447f02bc
0xdf6069: mov qword ptr [r14 + 0x40], r13
0xdf606d: mov dword ptr [r14 + 0x4c], r12d
0xdf6071: mov r15d, 1
0xdf6077: mov eax, dword ptr [r14 + 0x48]
0xdf607b: shl rax, 5
0xdf607f: add rax, qword ptr [r14 + 0x40]
0xdf6083: vmovups ymm0, ymmword ptr [rsp + 0x40]
0xdf6089: vmovups ymmword ptr [rax], ymm0
0xdf608d: inc dword ptr [r14 + 0x48]
0xdf6091: mov byte ptr [rsp + 0x59], 0
0xdf6096: mov r14, qword ptr [rsi + 0x670]
0xdf609d: mov qword ptr [rsp + 0x20], rbx
0xdf60a2: lea rax, [rip + 0xb717]
0xdf60a9: mov qword ptr [rsp + 0x28], rax
0xdf60ae: mov qword ptr [rsp + 0x30], rdi
0xdf60b3: mov word ptr [rsp + 0x38], 0
0xdf60ba: mov ecx, dword ptr [r14 + 0x48]
0xdf60be: mov eax, dword ptr [r14 + 0x4c]
0xdf60c2: cmp eax, ecx
0xdf60c4: ja 0x140df61b1
0xdf60ca: lea r12d, [rax*2 + 1]
0xdf60d2: add r12d, eax
0xdf60d5: shr r12d, 1
0xdf60d8: cmp r12d, 1
0xdf60dc: cmovb r12d, r15d
0xdf60e0: cmp ecx, r12d
0xdf60e3: cmova r12d, ecx
0xdf60e7: cmp r12d, eax
0xdf60ea: jbe 0x140df61b1
0xdf60f0: mov ecx, r12d
0xdf60f3: shl ecx, 5
0xdf60f6: mov r8d, 0x1fd
0xdf60fc: mov rax, qword ptr gs:[0x58]
0xdf6105: mov rax, qword ptr [rax]
0xdf6108: add rax, r8
0xdf610b: mov qword ptr [rbp + 0x60], rax
0xdf610f: mov edx, 8
0xdf6114: vzeroupper 
0xdf6117: cmp byte ptr [rax], 0
0xdf611a: je 0x140df6123
0xdf611c: call 0x1447efa78
0xdf6121: jmp 0x140df6128
0xdf6123: call 0x1447ef9b0
0xdf6128: mov r13, rax
0xdf612b: test rax, rax
0xdf612e: jne 0x140df6149
0xdf6130: call 0x141318e70
0xdf6135: xor r9d, r9d
0xdf6138: xor r8d, r8d
0xdf613b: mov edx, r15d
0xdf613e: mov ecx, 0xa0000002
0xdf6143: call qword ptr [rip + 0x43f4fff]
0xdf6149: mov r15d, edi
0xdf614c: cmp dword ptr [r14 + 0x48], edi
0xdf6150: jbe 0x140df618b
0xdf6152: nop dword ptr [rax]
0xdf6156: nop word ptr [rax + rax]
0xdf6160: mov ecx, r15d
0xdf6163: shl rcx, 5
0xdf6167: mov rax, qword ptr [r14 + 0x40]
0xdf616b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6170: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6176: add rcx, qword ptr [r14 + 0x40]
0xdf617a: vzeroupper 
0xdf617d: call 0x14035f1f0
0xdf6182: inc r15d
0xdf6185: cmp r15d, dword ptr [r14 + 0x48]
0xdf6189: jb 0x140df6160
0xdf618b: mov rcx, qword ptr [r14 + 0x40]
0xdf618f: test rcx, rcx
0xdf6192: je 0x140df61a9
0xdf6194: mov rax, qword ptr [rbp + 0x60]
0xdf6198: cmp byte ptr [rax], 0
0xdf619b: je 0x140df61a4
0xdf619d: call 0x1447f03bc
0xdf61a2: jmp 0x140df61a9
0xdf61a4: call 0x1447f02bc
0xdf61a9: mov qword ptr [r14 + 0x40], r13
0xdf61ad: mov dword ptr [r14 + 0x4c], r12d
0xdf61b1: mov eax, dword ptr [r14 + 0x48]
0xdf61b5: shl rax, 5
0xdf61b9: add rax, qword ptr [r14 + 0x40]
0xdf61bd: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf61c3: vmovups ymmword ptr [rax], ymm0
0xdf61c7: inc dword ptr [r14 + 0x48]
0xdf61cb: mov byte ptr [rsp + 0x39], 0
0xdf61d0: mov rcx, qword ptr [rsi + 0xc8]
0xdf61d7: add rcx, 0x40
0xdf61db: mov qword ptr [rsp + 0x40], rbx
0xdf61e0: lea r8, [rip + 0xb5e9]
0xdf61e7: mov qword ptr [rsp + 0x48], r8
0xdf61ec: mov qword ptr [rsp + 0x50], rdi
0xdf61f1: mov word ptr [rsp + 0x58], 0
0xdf61f8: lea rdx, [rsp + 0x40]
0xdf61fd: vzeroupper 
0xdf6200: call 0x140476290
0xdf6205: nop 
0xdf6206: mov byte ptr [rsp + 0x59], 0
0xdf620b: mov rcx, qword ptr [rsi + 0x108]
0xdf6212: add rcx, 0x40
0xdf6216: mov qword ptr [rbp - 0x60], rbx
0xdf621a: lea r8, [rip + 0xb5bf]
0xdf6221: mov qword ptr [rbp - 0x58], r8
0xdf6225: mov qword ptr [rbp - 0x50], rdi
0xdf6229: mov word ptr [rbp - 0x48], 0
0xdf622f: lea rdx, [rbp - 0x60]
0xdf6233: call 0x140476290
0xdf6238: nop 
0xdf6239: mov byte ptr [rbp - 0x47], 0
0xdf623d: mov rcx, qword ptr [rsi + 0xd0]
0xdf6244: add rcx, 0x40
0xdf6248: mov qword ptr [rsp + 0x60], rbx
0xdf624d: lea rdx, [rip + 0xb59c]
0xdf6254: mov qword ptr [rsp + 0x68], rdx
0xdf6259: mov qword ptr [rsp + 0x70], rdi
0xdf625e: mov word ptr [rsp + 0x78], 0
0xdf6265: lea rdx, [rsp + 0x60]
0xdf626a: call 0x140476290
0xdf626f: nop 
0xdf6270: mov byte ptr [rsp + 0x79], 0
0xdf6275: mov r14, qword ptr [rsi + 0xe0]
0xdf627c: mov qword ptr [rbp - 0x80], rbx
0xdf6280: lea rdx, [rip + 0xb579]
0xdf6287: mov qword ptr [rbp - 0x78], rdx
0xdf628b: mov qword ptr [rbp - 0x70], rdi
0xdf628f: mov word ptr [rbp - 0x68], 0
0xdf6295: mov ecx, dword ptr [r14 + 0x48]
0xdf6299: mov eax, dword ptr [r14 + 0x4c]
0xdf629d: mov r15d, 1
0xdf62a3: cmp eax, ecx
0xdf62a5: ja 0x140df6387
0xdf62ab: lea r12d, [rax*2 + 1]
0xdf62b3: add r12d, eax
0xdf62b6: shr r12d, 1
0xdf62b9: cmp r12d, r15d
0xdf62bc: cmovb r12d, r15d
0xdf62c0: cmp ecx, r12d
0xdf62c3: cmova r12d, ecx
0xdf62c7: cmp r12d, eax
0xdf62ca: jbe 0x140df6387
0xdf62d0: mov ecx, r12d
0xdf62d3: shl ecx, 5
0xdf62d6: mov r8d, 0x1fd
0xdf62dc: mov rax, qword ptr gs:[0x58]
0xdf62e5: mov rax, qword ptr [rax]
0xdf62e8: add rax, r8
0xdf62eb: mov qword ptr [rbp + 0x60], rax
0xdf62ef: mov edx, 8
0xdf62f4: cmp byte ptr [rax], 0
0xdf62f7: je 0x140df6300
0xdf62f9: call 0x1447efa78
0xdf62fe: jmp 0x140df6305
0xdf6300: call 0x1447ef9b0
0xdf6305: mov r13, rax
0xdf6308: test rax, rax
0xdf630b: jne 0x140df6326
0xdf630d: call 0x141318e70
0xdf6312: xor r9d, r9d
0xdf6315: xor r8d, r8d
0xdf6318: mov edx, r15d
0xdf631b: mov ecx, 0xa0000002
0xdf6320: call qword ptr [rip + 0x43f4e22]
0xdf6326: mov r15d, edi
0xdf6329: cmp dword ptr [r14 + 0x48], edi
0xdf632d: jbe 0x140df635b
0xdf632f: nop 
0xdf6330: mov ecx, r15d
0xdf6333: shl rcx, 5
0xdf6337: mov rax, qword ptr [r14 + 0x40]
0xdf633b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6340: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6346: add rcx, qword ptr [r14 + 0x40]
0xdf634a: vzeroupper 
0xdf634d: call 0x14035f1f0
0xdf6352: inc r15d
0xdf6355: cmp r15d, dword ptr [r14 + 0x48]
0xdf6359: jb 0x140df6330
0xdf635b: mov rcx, qword ptr [r14 + 0x40]
0xdf635f: test rcx, rcx
0xdf6362: je 0x140df6379
0xdf6364: mov rax, qword ptr [rbp + 0x60]
0xdf6368: cmp byte ptr [rax], 0
0xdf636b: je 0x140df6374
0xdf636d: call 0x1447f03bc
0xdf6372: jmp 0x140df6379
0xdf6374: call 0x1447f02bc
0xdf6379: mov qword ptr [r14 + 0x40], r13
0xdf637d: mov dword ptr [r14 + 0x4c], r12d
0xdf6381: mov r15d, 1
0xdf6387: mov eax, dword ptr [r14 + 0x48]
0xdf638b: shl rax, 5
0xdf638f: add rax, qword ptr [r14 + 0x40]
0xdf6393: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6398: vmovups ymmword ptr [rax], ymm0
0xdf639c: inc dword ptr [r14 + 0x48]
0xdf63a0: mov byte ptr [rbp - 0x67], 0
0xdf63a4: mov rcx, qword ptr [rsi + 0xe8]
0xdf63ab: add rcx, 0x40
0xdf63af: mov qword ptr [rsp + 0x60], rbx
0xdf63b4: lea r8, [rip + 0xb4b5]
0xdf63bb: mov qword ptr [rsp + 0x68], r8
0xdf63c0: mov qword ptr [rsp + 0x70], rdi
0xdf63c5: mov word ptr [rsp + 0x78], 0
0xdf63cc: lea rdx, [rsp + 0x60]
0xdf63d1: vzeroupper 
0xdf63d4: call 0x140476290
0xdf63d9: nop 
0xdf63da: mov byte ptr [rsp + 0x79], 0
0xdf63df: mov rcx, qword ptr [rsi + 0x9e0]
0xdf63e6: add rcx, 0x40
0xdf63ea: mov qword ptr [rsp + 0x20], rbx
0xdf63ef: lea r8, [rip + 0xb49a]
0xdf63f6: mov qword ptr [rsp + 0x28], r8
0xdf63fb: mov qword ptr [rsp + 0x30], rdi
0xdf6400: mov word ptr [rsp + 0x38], 0
0xdf6407: lea rdx, [rsp + 0x20]
0xdf640c: call 0x140476290
0xdf6411: nop 
0xdf6412: mov byte ptr [rsp + 0x39], 0
0xdf6417: mov rcx, qword ptr [rsi + 0x358]
0xdf641e: add rcx, 0x40
0xdf6422: mov qword ptr [rsp + 0x40], rbx
0xdf6427: lea rdx, [rip + 0xb472]
0xdf642e: mov qword ptr [rsp + 0x48], rdx
0xdf6433: mov qword ptr [rsp + 0x50], rdi
0xdf6438: mov word ptr [rsp + 0x58], 0
0xdf643f: lea rdx, [rsp + 0x40]
0xdf6444: call 0x140476290
0xdf6449: nop 
0xdf644a: mov byte ptr [rsp + 0x59], 0
0xdf644f: mov r14, qword ptr [rsi + 0xd8]
0xdf6456: mov qword ptr [rbp - 0x60], rbx
0xdf645a: lea rdx, [rip + 0xb44f]
0xdf6461: mov qword ptr [rbp - 0x58], rdx
0xdf6465: mov qword ptr [rbp - 0x50], rdi
0xdf6469: mov word ptr [rbp - 0x48], 0
0xdf646f: mov ecx, dword ptr [r14 + 0x48]
0xdf6473: mov eax, dword ptr [r14 + 0x4c]
0xdf6477: cmp eax, ecx
0xdf6479: ja 0x140df6561
0xdf647f: lea r12d, [rax*2 + 1]
0xdf6487: add r12d, eax
0xdf648a: shr r12d, 1
0xdf648d: cmp r12d, 1
0xdf6491: cmovb r12d, r15d
0xdf6495: cmp ecx, r12d
0xdf6498: cmova r12d, ecx
0xdf649c: cmp r12d, eax
0xdf649f: jbe 0x140df6561
0xdf64a5: mov ecx, r12d
0xdf64a8: shl ecx, 5
0xdf64ab: mov r8d, 0x1fd
0xdf64b1: mov rax, qword ptr gs:[0x58]
0xdf64ba: mov rax, qword ptr [rax]
0xdf64bd: add rax, r8
0xdf64c0: mov qword ptr [rbp + 0x60], rax
0xdf64c4: mov edx, 8
0xdf64c9: cmp byte ptr [rax], 0
0xdf64cc: je 0x140df64d5
0xdf64ce: call 0x1447efa78
0xdf64d3: jmp 0x140df64da
0xdf64d5: call 0x1447ef9b0
0xdf64da: mov r13, rax
0xdf64dd: test rax, rax
0xdf64e0: jne 0x140df64fb
0xdf64e2: call 0x141318e70
0xdf64e7: xor r9d, r9d
0xdf64ea: xor r8d, r8d
0xdf64ed: mov edx, r15d
0xdf64f0: mov ecx, 0xa0000002
0xdf64f5: call qword ptr [rip + 0x43f4c4d]
0xdf64fb: mov r15d, edi
0xdf64fe: cmp dword ptr [r14 + 0x48], edi
0xdf6502: jbe 0x140df653b
0xdf6504: nop dword ptr [rax]
0xdf6508: nop dword ptr [rax + rax]
0xdf6510: mov ecx, r15d
0xdf6513: shl rcx, 5
0xdf6517: mov rax, qword ptr [r14 + 0x40]
0xdf651b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6520: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6526: add rcx, qword ptr [r14 + 0x40]
0xdf652a: vzeroupper 
0xdf652d: call 0x14035f1f0
0xdf6532: inc r15d
0xdf6535: cmp r15d, dword ptr [r14 + 0x48]
0xdf6539: jb 0x140df6510
0xdf653b: mov rcx, qword ptr [r14 + 0x40]
0xdf653f: test rcx, rcx
0xdf6542: je 0x140df6559
0xdf6544: mov rax, qword ptr [rbp + 0x60]
0xdf6548: cmp byte ptr [rax], 0
0xdf654b: je 0x140df6554
0xdf654d: call 0x1447f03bc
0xdf6552: jmp 0x140df6559
0xdf6554: call 0x1447f02bc
0xdf6559: mov qword ptr [r14 + 0x40], r13
0xdf655d: mov dword ptr [r14 + 0x4c], r12d
0xdf6561: mov eax, dword ptr [r14 + 0x48]
0xdf6565: shl rax, 5
0xdf6569: add rax, qword ptr [r14 + 0x40]
0xdf656d: vmovups ymm0, ymmword ptr [rbp - 0x60]
0xdf6572: vmovups ymmword ptr [rax], ymm0
0xdf6576: inc dword ptr [r14 + 0x48]
0xdf657a: mov byte ptr [rbp - 0x47], 0
0xdf657e: mov r14, qword ptr [rsi + 0x660]
0xdf6585: mov qword ptr [rbp - 0x80], rbx
0xdf6589: lea rax, [rip + 0xb400]
0xdf6590: mov qword ptr [rbp - 0x78], rax
0xdf6594: mov qword ptr [rbp - 0x70], rdi
0xdf6598: mov word ptr [rbp - 0x68], 0
0xdf659e: mov ecx, dword ptr [r14 + 0x48]
0xdf65a2: mov eax, dword ptr [r14 + 0x4c]
0xdf65a6: mov r15d, 1
0xdf65ac: cmp eax, ecx
0xdf65ae: ja 0x140df6697
0xdf65b4: lea r12d, [rax*2 + 1]
0xdf65bc: add r12d, eax
0xdf65bf: shr r12d, 1
0xdf65c2: cmp r12d, r15d
0xdf65c5: cmovb r12d, r15d
0xdf65c9: cmp ecx, r12d
0xdf65cc: cmova r12d, ecx
0xdf65d0: cmp r12d, eax
0xdf65d3: jbe 0x140df6697
0xdf65d9: mov ecx, r12d
0xdf65dc: shl ecx, 5
0xdf65df: mov r8d, 0x1fd
0xdf65e5: mov rax, qword ptr gs:[0x58]
0xdf65ee: mov rax, qword ptr [rax]
0xdf65f1: add rax, r8
0xdf65f4: mov qword ptr [rbp + 0x60], rax
0xdf65f8: mov edx, 8
0xdf65fd: vzeroupper 
0xdf6600: cmp byte ptr [rax], 0
0xdf6603: je 0x140df660c
0xdf6605: call 0x1447efa78
0xdf660a: jmp 0x140df6611
0xdf660c: call 0x1447ef9b0
0xdf6611: mov r13, rax
0xdf6614: test rax, rax
0xdf6617: jne 0x140df6632
0xdf6619: call 0x141318e70
0xdf661e: xor r9d, r9d
0xdf6621: xor r8d, r8d
0xdf6624: mov edx, r15d
0xdf6627: mov ecx, 0xa0000002
0xdf662c: call qword ptr [rip + 0x43f4b16]
0xdf6632: mov r15d, edi
0xdf6635: cmp dword ptr [r14 + 0x48], edi
0xdf6639: jbe 0x140df666b
0xdf663b: nop dword ptr [rax + rax]
0xdf6640: mov ecx, r15d
0xdf6643: shl rcx, 5
0xdf6647: mov rax, qword ptr [r14 + 0x40]
0xdf664b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6650: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6656: add rcx, qword ptr [r14 + 0x40]
0xdf665a: vzeroupper 
0xdf665d: call 0x14035f1f0
0xdf6662: inc r15d
0xdf6665: cmp r15d, dword ptr [r14 + 0x48]
0xdf6669: jb 0x140df6640
0xdf666b: mov rcx, qword ptr [r14 + 0x40]
0xdf666f: test rcx, rcx
0xdf6672: je 0x140df6689
0xdf6674: mov rax, qword ptr [rbp + 0x60]
0xdf6678: cmp byte ptr [rax], 0
0xdf667b: je 0x140df6684
0xdf667d: call 0x1447f03bc
0xdf6682: jmp 0x140df6689
0xdf6684: call 0x1447f02bc
0xdf6689: mov qword ptr [r14 + 0x40], r13
0xdf668d: mov dword ptr [r14 + 0x4c], r12d
0xdf6691: mov r15d, 1
0xdf6697: mov eax, dword ptr [r14 + 0x48]
0xdf669b: shl rax, 5
0xdf669f: add rax, qword ptr [r14 + 0x40]
0xdf66a3: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf66a8: vmovups ymmword ptr [rax], ymm0
0xdf66ac: inc dword ptr [r14 + 0x48]
0xdf66b0: mov byte ptr [rbp - 0x67], 0
0xdf66b4: mov rcx, qword ptr [rsi + 0x668]
0xdf66bb: add rcx, 0x40
0xdf66bf: mov qword ptr [rsp + 0x60], rbx
0xdf66c4: lea r8, [rip + 0xb2d5]
0xdf66cb: mov qword ptr [rsp + 0x68], r8
0xdf66d0: mov qword ptr [rsp + 0x70], rdi
0xdf66d5: mov word ptr [rsp + 0x78], 0
0xdf66dc: lea rdx, [rsp + 0x60]
0xdf66e1: vzeroupper 
0xdf66e4: call 0x140476290
0xdf66e9: nop 
0xdf66ea: mov byte ptr [rsp + 0x79], 0
0xdf66ef: mov r14, qword ptr [rsi + 0x680]
0xdf66f6: mov qword ptr [rsp + 0x20], rbx
0xdf66fb: lea rax, [rip + 0xb2ae]
0xdf6702: mov qword ptr [rsp + 0x28], rax
0xdf6707: mov qword ptr [rsp + 0x30], rdi
0xdf670c: mov word ptr [rsp + 0x38], 0
0xdf6713: mov ecx, dword ptr [r14 + 0x48]
0xdf6717: mov eax, dword ptr [r14 + 0x4c]
0xdf671b: cmp eax, ecx
0xdf671d: ja 0x140df6801
0xdf6723: lea r12d, [rax*2 + 1]
0xdf672b: add r12d, eax
0xdf672e: shr r12d, 1
0xdf6731: cmp r12d, 1
0xdf6735: cmovb r12d, r15d
0xdf6739: cmp ecx, r12d
0xdf673c: cmova r12d, ecx
0xdf6740: cmp r12d, eax
0xdf6743: jbe 0x140df6801
0xdf6749: mov ecx, r12d
0xdf674c: shl ecx, 5
0xdf674f: mov r8d, 0x1fd
0xdf6755: mov rax, qword ptr gs:[0x58]
0xdf675e: mov rax, qword ptr [rax]
0xdf6761: add rax, r8
0xdf6764: mov qword ptr [rbp + 0x60], rax
0xdf6768: mov edx, 8
0xdf676d: cmp byte ptr [rax], 0
0xdf6770: je 0x140df6779
0xdf6772: call 0x1447efa78
0xdf6777: jmp 0x140df677e
0xdf6779: call 0x1447ef9b0
0xdf677e: mov r13, rax
0xdf6781: test rax, rax
0xdf6784: jne 0x140df679f
0xdf6786: call 0x141318e70
0xdf678b: xor r9d, r9d
0xdf678e: xor r8d, r8d
0xdf6791: mov edx, r15d
0xdf6794: mov ecx, 0xa0000002
0xdf6799: call qword ptr [rip + 0x43f49a9]
0xdf679f: mov r15d, edi
0xdf67a2: cmp dword ptr [r14 + 0x48], edi
0xdf67a6: jbe 0x140df67db
0xdf67a8: nop dword ptr [rax + rax]
0xdf67b0: mov ecx, r15d
0xdf67b3: shl rcx, 5
0xdf67b7: mov rax, qword ptr [r14 + 0x40]
0xdf67bb: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf67c0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf67c6: add rcx, qword ptr [r14 + 0x40]
0xdf67ca: vzeroupper 
0xdf67cd: call 0x14035f1f0
0xdf67d2: inc r15d
0xdf67d5: cmp r15d, dword ptr [r14 + 0x48]
0xdf67d9: jb 0x140df67b0
0xdf67db: mov rcx, qword ptr [r14 + 0x40]
0xdf67df: test rcx, rcx
0xdf67e2: je 0x140df67f9
0xdf67e4: mov rax, qword ptr [rbp + 0x60]
0xdf67e8: cmp byte ptr [rax], 0
0xdf67eb: je 0x140df67f4
0xdf67ed: call 0x1447f03bc
0xdf67f2: jmp 0x140df67f9
0xdf67f4: call 0x1447f02bc
0xdf67f9: mov qword ptr [r14 + 0x40], r13
0xdf67fd: mov dword ptr [r14 + 0x4c], r12d
0xdf6801: mov eax, dword ptr [r14 + 0x48]
0xdf6805: shl rax, 5
0xdf6809: add rax, qword ptr [r14 + 0x40]
0xdf680d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf6813: vmovups ymmword ptr [rax], ymm0
0xdf6817: inc dword ptr [r14 + 0x48]
0xdf681b: mov byte ptr [rsp + 0x39], 0
0xdf6820: mov r14, qword ptr [rsi + 0x688]
0xdf6827: mov qword ptr [rbp - 0x80], rbx
0xdf682b: lea rax, [rip + 0xb1de]
0xdf6832: mov qword ptr [rbp - 0x78], rax
0xdf6836: mov qword ptr [rbp - 0x70], rdi
0xdf683a: mov word ptr [rbp - 0x68], 0
0xdf6840: mov ecx, dword ptr [r14 + 0x48]
0xdf6844: mov eax, dword ptr [r14 + 0x4c]
0xdf6848: mov r15d, 1
0xdf684e: cmp eax, ecx
0xdf6850: ja 0x140df6937
0xdf6856: lea r12d, [rax*2 + 1]
0xdf685e: add r12d, eax
0xdf6861: shr r12d, 1
0xdf6864: cmp r12d, r15d
0xdf6867: cmovb r12d, r15d
0xdf686b: cmp ecx, r12d
0xdf686e: cmova r12d, ecx
0xdf6872: cmp r12d, eax
0xdf6875: jbe 0x140df6937
0xdf687b: mov ecx, r12d
0xdf687e: shl ecx, 5
0xdf6881: mov r8d, 0x1fd
0xdf6887: mov rax, qword ptr gs:[0x58]
0xdf6890: mov rax, qword ptr [rax]
0xdf6893: add rax, r8
0xdf6896: mov qword ptr [rbp + 0x60], rax
0xdf689a: mov edx, 8
0xdf689f: vzeroupper 
0xdf68a2: cmp byte ptr [rax], 0
0xdf68a5: je 0x140df68ae
0xdf68a7: call 0x1447efa78
0xdf68ac: jmp 0x140df68b3
0xdf68ae: call 0x1447ef9b0
0xdf68b3: mov r13, rax
0xdf68b6: test rax, rax
0xdf68b9: jne 0x140df68d4
0xdf68bb: call 0x141318e70
0xdf68c0: xor r9d, r9d
0xdf68c3: xor r8d, r8d
0xdf68c6: mov edx, r15d
0xdf68c9: mov ecx, 0xa0000002
0xdf68ce: call qword ptr [rip + 0x43f4874]
0xdf68d4: mov r15d, edi
0xdf68d7: cmp dword ptr [r14 + 0x48], edi
0xdf68db: jbe 0x140df690b
0xdf68dd: nop dword ptr [rax]
0xdf68e0: mov ecx, r15d
0xdf68e3: shl rcx, 5
0xdf68e7: mov rax, qword ptr [r14 + 0x40]
0xdf68eb: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf68f0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf68f6: add rcx, qword ptr [r14 + 0x40]
0xdf68fa: vzeroupper 
0xdf68fd: call 0x14035f1f0
0xdf6902: inc r15d
0xdf6905: cmp r15d, dword ptr [r14 + 0x48]
0xdf6909: jb 0x140df68e0
0xdf690b: mov rcx, qword ptr [r14 + 0x40]
0xdf690f: test rcx, rcx
0xdf6912: je 0x140df6929
0xdf6914: mov rax, qword ptr [rbp + 0x60]
0xdf6918: cmp byte ptr [rax], 0
0xdf691b: je 0x140df6924
0xdf691d: call 0x1447f03bc
0xdf6922: jmp 0x140df6929
0xdf6924: call 0x1447f02bc
0xdf6929: mov qword ptr [r14 + 0x40], r13
0xdf692d: mov dword ptr [r14 + 0x4c], r12d
0xdf6931: mov r15d, 1
0xdf6937: mov eax, dword ptr [r14 + 0x48]
0xdf693b: shl rax, 5
0xdf693f: add rax, qword ptr [r14 + 0x40]
0xdf6943: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6948: vmovups ymmword ptr [rax], ymm0
0xdf694c: inc dword ptr [r14 + 0x48]
0xdf6950: mov byte ptr [rbp - 0x67], 0
0xdf6954: mov r14, qword ptr [rsi + 0x690]
0xdf695b: mov qword ptr [rsp + 0x60], rbx
0xdf6960: lea rax, [rip + 0xb119]
0xdf6967: mov qword ptr [rsp + 0x68], rax
0xdf696c: mov qword ptr [rsp + 0x70], rdi
0xdf6971: mov word ptr [rsp + 0x78], 0
0xdf6978: mov ecx, dword ptr [r14 + 0x48]
0xdf697c: mov eax, dword ptr [r14 + 0x4c]
0xdf6980: cmp eax, ecx
0xdf6982: ja 0x140df6a61
0xdf6988: lea r12d, [rax*2 + 1]
0xdf6990: add r12d, eax
0xdf6993: shr r12d, 1
0xdf6996: cmp r12d, 1
0xdf699a: cmovb r12d, r15d
0xdf699e: cmp ecx, r12d
0xdf69a1: cmova r12d, ecx
0xdf69a5: cmp r12d, eax
0xdf69a8: jbe 0x140df6a61
0xdf69ae: mov ecx, r12d
0xdf69b1: shl ecx, 5
0xdf69b4: mov r8d, 0x1fd
0xdf69ba: mov rax, qword ptr gs:[0x58]
0xdf69c3: mov rax, qword ptr [rax]
0xdf69c6: add rax, r8
0xdf69c9: mov qword ptr [rbp + 0x60], rax
0xdf69cd: mov edx, 8
0xdf69d2: vzeroupper 
0xdf69d5: cmp byte ptr [rax], 0
0xdf69d8: je 0x140df69e1
0xdf69da: call 0x1447efa78
0xdf69df: jmp 0x140df69e6
0xdf69e1: call 0x1447ef9b0
0xdf69e6: mov r13, rax
0xdf69e9: test rax, rax
0xdf69ec: jne 0x140df6a07
0xdf69ee: call 0x141318e70
0xdf69f3: xor r9d, r9d
0xdf69f6: xor r8d, r8d
0xdf69f9: mov edx, r15d
0xdf69fc: mov ecx, 0xa0000002
0xdf6a01: call qword ptr [rip + 0x43f4741]
0xdf6a07: mov r15d, edi
0xdf6a0a: cmp dword ptr [r14 + 0x48], edi
0xdf6a0e: jbe 0x140df6a3b
0xdf6a10: mov ecx, r15d
0xdf6a13: shl rcx, 5
0xdf6a17: mov rax, qword ptr [r14 + 0x40]
0xdf6a1b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6a20: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6a26: add rcx, qword ptr [r14 + 0x40]
0xdf6a2a: vzeroupper 
0xdf6a2d: call 0x14035f1f0
0xdf6a32: inc r15d
0xdf6a35: cmp r15d, dword ptr [r14 + 0x48]
0xdf6a39: jb 0x140df6a10
0xdf6a3b: mov rcx, qword ptr [r14 + 0x40]
0xdf6a3f: test rcx, rcx
0xdf6a42: je 0x140df6a59
0xdf6a44: mov rax, qword ptr [rbp + 0x60]
0xdf6a48: cmp byte ptr [rax], 0
0xdf6a4b: je 0x140df6a54
0xdf6a4d: call 0x1447f03bc
0xdf6a52: jmp 0x140df6a59
0xdf6a54: call 0x1447f02bc
0xdf6a59: mov qword ptr [r14 + 0x40], r13
0xdf6a5d: mov dword ptr [r14 + 0x4c], r12d
0xdf6a61: mov eax, dword ptr [r14 + 0x48]
0xdf6a65: shl rax, 5
0xdf6a69: add rax, qword ptr [r14 + 0x40]
0xdf6a6d: vmovups ymm0, ymmword ptr [rsp + 0x60]
0xdf6a73: vmovups ymmword ptr [rax], ymm0
0xdf6a77: inc dword ptr [r14 + 0x48]
0xdf6a7b: mov byte ptr [rsp + 0x79], 0
0xdf6a80: mov r14, qword ptr [rsi + 0x698]
0xdf6a87: mov qword ptr [rbp - 0x80], rbx
0xdf6a8b: lea rax, [rip + 0xb01e]
0xdf6a92: mov qword ptr [rbp - 0x78], rax
0xdf6a96: mov qword ptr [rbp - 0x70], rdi
0xdf6a9a: mov word ptr [rbp - 0x68], 0
0xdf6aa0: mov ecx, dword ptr [r14 + 0x48]
0xdf6aa4: mov eax, dword ptr [r14 + 0x4c]
0xdf6aa8: mov r15d, 1
0xdf6aae: cmp eax, ecx
0xdf6ab0: ja 0x140df6b97
0xdf6ab6: lea r12d, [rax*2 + 1]
0xdf6abe: add r12d, eax
0xdf6ac1: shr r12d, 1
0xdf6ac4: cmp r12d, r15d
0xdf6ac7: cmovb r12d, r15d
0xdf6acb: cmp ecx, r12d
0xdf6ace: cmova r12d, ecx
0xdf6ad2: cmp r12d, eax
0xdf6ad5: jbe 0x140df6b97
0xdf6adb: mov ecx, r12d
0xdf6ade: shl ecx, 5
0xdf6ae1: mov r8d, 0x1fd
0xdf6ae7: mov rax, qword ptr gs:[0x58]
0xdf6af0: mov rax, qword ptr [rax]
0xdf6af3: add rax, r8
0xdf6af6: mov qword ptr [rbp + 0x60], rax
0xdf6afa: mov edx, 8
0xdf6aff: vzeroupper 
0xdf6b02: cmp byte ptr [rax], 0
0xdf6b05: je 0x140df6b0e
0xdf6b07: call 0x1447efa78
0xdf6b0c: jmp 0x140df6b13
0xdf6b0e: call 0x1447ef9b0
0xdf6b13: mov r13, rax
0xdf6b16: test rax, rax
0xdf6b19: jne 0x140df6b34
0xdf6b1b: call 0x141318e70
0xdf6b20: xor r9d, r9d
0xdf6b23: xor r8d, r8d
0xdf6b26: mov edx, r15d
0xdf6b29: mov ecx, 0xa0000002
0xdf6b2e: call qword ptr [rip + 0x43f4614]
0xdf6b34: mov r15d, edi
0xdf6b37: cmp dword ptr [r14 + 0x48], edi
0xdf6b3b: jbe 0x140df6b6b
0xdf6b3d: nop dword ptr [rax]
0xdf6b40: mov ecx, r15d
0xdf6b43: shl rcx, 5
0xdf6b47: mov rax, qword ptr [r14 + 0x40]
0xdf6b4b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6b50: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6b56: add rcx, qword ptr [r14 + 0x40]
0xdf6b5a: vzeroupper 
0xdf6b5d: call 0x14035f1f0
0xdf6b62: inc r15d
0xdf6b65: cmp r15d, dword ptr [r14 + 0x48]
0xdf6b69: jb 0x140df6b40
0xdf6b6b: mov rcx, qword ptr [r14 + 0x40]
0xdf6b6f: test rcx, rcx
0xdf6b72: je 0x140df6b89
0xdf6b74: mov rax, qword ptr [rbp + 0x60]
0xdf6b78: cmp byte ptr [rax], 0
0xdf6b7b: je 0x140df6b84
0xdf6b7d: call 0x1447f03bc
0xdf6b82: jmp 0x140df6b89
0xdf6b84: call 0x1447f02bc
0xdf6b89: mov qword ptr [r14 + 0x40], r13
0xdf6b8d: mov dword ptr [r14 + 0x4c], r12d
0xdf6b91: mov r15d, 1
0xdf6b97: mov eax, dword ptr [r14 + 0x48]
0xdf6b9b: shl rax, 5
0xdf6b9f: add rax, qword ptr [r14 + 0x40]
0xdf6ba3: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6ba8: vmovups ymmword ptr [rax], ymm0
0xdf6bac: inc dword ptr [r14 + 0x48]
0xdf6bb0: mov byte ptr [rbp - 0x67], 0
0xdf6bb4: mov rcx, qword ptr [rsi + 0x2f0]
0xdf6bbb: add rcx, 0x40
0xdf6bbf: mov qword ptr [rsp + 0x60], rbx
0xdf6bc4: lea r8, [rip + 0xaf05]
0xdf6bcb: mov qword ptr [rsp + 0x68], r8
0xdf6bd0: mov qword ptr [rsp + 0x70], rdi
0xdf6bd5: mov word ptr [rsp + 0x78], 0
0xdf6bdc: lea rdx, [rsp + 0x60]
0xdf6be1: vzeroupper 
0xdf6be4: call 0x140476290
0xdf6be9: nop 
0xdf6bea: mov byte ptr [rsp + 0x79], 0
0xdf6bef: mov r14, qword ptr [rsi + 0x270]
0xdf6bf6: mov qword ptr [rsp + 0x20], rbx
0xdf6bfb: lea rax, [rip + 0xaeee]
0xdf6c02: mov qword ptr [rsp + 0x28], rax
0xdf6c07: mov qword ptr [rsp + 0x30], rdi
0xdf6c0c: mov word ptr [rsp + 0x38], 0
0xdf6c13: mov ecx, dword ptr [r14 + 0x48]
0xdf6c17: mov eax, dword ptr [r14 + 0x4c]
0xdf6c1b: cmp eax, ecx
0xdf6c1d: ja 0x140df6d01
0xdf6c23: lea r12d, [rax*2 + 1]
0xdf6c2b: add r12d, eax
0xdf6c2e: shr r12d, 1
0xdf6c31: cmp r12d, 1
0xdf6c35: cmovb r12d, r15d
0xdf6c39: cmp ecx, r12d
0xdf6c3c: cmova r12d, ecx
0xdf6c40: cmp r12d, eax
0xdf6c43: jbe 0x140df6d01
0xdf6c49: mov ecx, r12d
0xdf6c4c: shl ecx, 5
0xdf6c4f: mov r8d, 0x1fd
0xdf6c55: mov rax, qword ptr gs:[0x58]
0xdf6c5e: mov rax, qword ptr [rax]
0xdf6c61: add rax, r8
0xdf6c64: mov qword ptr [rbp + 0x60], rax
0xdf6c68: mov edx, 8
0xdf6c6d: cmp byte ptr [rax], 0
0xdf6c70: je 0x140df6c79
0xdf6c72: call 0x1447efa78
0xdf6c77: jmp 0x140df6c7e
0xdf6c79: call 0x1447ef9b0
0xdf6c7e: mov r13, rax
0xdf6c81: test rax, rax
0xdf6c84: jne 0x140df6c9f
0xdf6c86: call 0x141318e70
0xdf6c8b: xor r9d, r9d
0xdf6c8e: xor r8d, r8d
0xdf6c91: mov edx, r15d
0xdf6c94: mov ecx, 0xa0000002
0xdf6c99: call qword ptr [rip + 0x43f44a9]
0xdf6c9f: mov r15d, edi
0xdf6ca2: cmp dword ptr [r14 + 0x48], edi
0xdf6ca6: jbe 0x140df6cdb
0xdf6ca8: nop dword ptr [rax + rax]
0xdf6cb0: mov ecx, r15d
0xdf6cb3: shl rcx, 5
0xdf6cb7: mov rax, qword ptr [r14 + 0x40]
0xdf6cbb: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6cc0: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6cc6: add rcx, qword ptr [r14 + 0x40]
0xdf6cca: vzeroupper 
0xdf6ccd: call 0x14035f1f0
0xdf6cd2: inc r15d
0xdf6cd5: cmp r15d, dword ptr [r14 + 0x48]
0xdf6cd9: jb 0x140df6cb0
0xdf6cdb: mov rcx, qword ptr [r14 + 0x40]
0xdf6cdf: test rcx, rcx
0xdf6ce2: je 0x140df6cf9
0xdf6ce4: mov rax, qword ptr [rbp + 0x60]
0xdf6ce8: cmp byte ptr [rax], 0
0xdf6ceb: je 0x140df6cf4
0xdf6ced: call 0x1447f03bc
0xdf6cf2: jmp 0x140df6cf9
0xdf6cf4: call 0x1447f02bc
0xdf6cf9: mov qword ptr [r14 + 0x40], r13
0xdf6cfd: mov dword ptr [r14 + 0x4c], r12d
0xdf6d01: mov eax, dword ptr [r14 + 0x48]
0xdf6d05: shl rax, 5
0xdf6d09: add rax, qword ptr [r14 + 0x40]
0xdf6d0d: vmovups ymm0, ymmword ptr [rsp + 0x20]
0xdf6d13: vmovups ymmword ptr [rax], ymm0
0xdf6d17: inc dword ptr [r14 + 0x48]
0xdf6d1b: mov byte ptr [rsp + 0x39], 0
0xdf6d20: mov rcx, qword ptr [rsi + 0x278]
0xdf6d27: add rcx, 0x40
0xdf6d2b: mov qword ptr [rbp - 0x80], rbx
0xdf6d2f: lea r8, [rip + 0xadca]
0xdf6d36: mov qword ptr [rbp - 0x78], r8
0xdf6d3a: mov qword ptr [rbp - 0x70], rdi
0xdf6d3e: mov word ptr [rbp - 0x68], 0
0xdf6d44: lea rdx, [rbp - 0x80]
0xdf6d48: vzeroupper 
0xdf6d4b: call 0x140476290
0xdf6d50: nop 
0xdf6d51: mov byte ptr [rbp - 0x67], 0
0xdf6d55: mov r14, qword ptr [rsi + 0x6f8]
0xdf6d5c: mov qword ptr [rsp + 0x60], rbx
0xdf6d61: lea rax, [rip + 0xada8]
0xdf6d68: mov qword ptr [rsp + 0x68], rax
0xdf6d6d: mov qword ptr [rsp + 0x70], rdi
0xdf6d72: mov word ptr [rsp + 0x78], 0
0xdf6d79: mov ecx, dword ptr [r14 + 0x48]
0xdf6d7d: mov eax, dword ptr [r14 + 0x4c]
0xdf6d81: mov r15d, 1
0xdf6d87: cmp eax, ecx
0xdf6d89: ja 0x140df6e77
0xdf6d8f: lea r12d, [rax*2 + 1]
0xdf6d97: add r12d, eax
0xdf6d9a: shr r12d, 1
0xdf6d9d: cmp r12d, r15d
0xdf6da0: cmovb r12d, r15d
0xdf6da4: cmp ecx, r12d
0xdf6da7: cmova r12d, ecx
0xdf6dab: cmp r12d, eax
0xdf6dae: jbe 0x140df6e77
0xdf6db4: mov ecx, r12d
0xdf6db7: shl ecx, 5
0xdf6dba: mov r8d, 0x1fd
0xdf6dc0: mov rax, qword ptr gs:[0x58]
0xdf6dc9: mov rax, qword ptr [rax]
0xdf6dcc: add rax, r8
0xdf6dcf: mov qword ptr [rbp + 0x60], rax
0xdf6dd3: mov edx, 8
0xdf6dd8: cmp byte ptr [rax], 0
0xdf6ddb: je 0x140df6de4
0xdf6ddd: call 0x1447efa78
0xdf6de2: jmp 0x140df6de9
0xdf6de4: call 0x1447ef9b0
0xdf6de9: mov r13, rax
0xdf6dec: test rax, rax
0xdf6def: jne 0x140df6e0a
0xdf6df1: call 0x141318e70
0xdf6df6: xor r9d, r9d
0xdf6df9: xor r8d, r8d
0xdf6dfc: mov edx, r15d
0xdf6dff: mov ecx, 0xa0000002
0xdf6e04: call qword ptr [rip + 0x43f433e]
0xdf6e0a: mov r15d, edi
0xdf6e0d: cmp dword ptr [r14 + 0x48], edi
0xdf6e11: jbe 0x140df6e4b
0xdf6e13: nop dword ptr [rax]
0xdf6e17: nop word ptr [rax + rax]
0xdf6e20: mov ecx, r15d
0xdf6e23: shl rcx, 5
0xdf6e27: mov rax, qword ptr [r14 + 0x40]
0xdf6e2b: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf6e30: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6e36: add rcx, qword ptr [r14 + 0x40]
0xdf6e3a: vzeroupper 
0xdf6e3d: call 0x14035f1f0
0xdf6e42: inc r15d
0xdf6e45: cmp r15d, dword ptr [r14 + 0x48]
0xdf6e49: jb 0x140df6e20
0xdf6e4b: mov rcx, qword ptr [r14 + 0x40]
0xdf6e4f: test rcx, rcx
0xdf6e52: je 0x140df6e69
0xdf6e54: mov rax, qword ptr [rbp + 0x60]
0xdf6e58: cmp byte ptr [rax], 0
0xdf6e5b: je 0x140df6e64
0xdf6e5d: call 0x1447f03bc
0xdf6e62: jmp 0x140df6e69
0xdf6e64: call 0x1447f02bc
0xdf6e69: mov qword ptr [r14 + 0x40], r13
0xdf6e6d: mov dword ptr [r14 + 0x4c], r12d
0xdf6e71: mov r15d, 1
0xdf6e77: mov eax, dword ptr [r14 + 0x48]
0xdf6e7b: shl rax, 5
0xdf6e7f: add rax, qword ptr [r14 + 0x40]
0xdf6e83: vmovups ymm0, ymmword ptr [rsp + 0x60]
0xdf6e89: vmovups ymmword ptr [rax], ymm0
0xdf6e8d: inc dword ptr [r14 + 0x48]
0xdf6e91: mov byte ptr [rsp + 0x79], 0
0xdf6e96: mov r14, qword ptr [rsi + 0x178]
0xdf6e9d: mov qword ptr [rbp - 0x80], rbx
0xdf6ea1: lea rax, [rip + 0xac78]
0xdf6ea8: mov qword ptr [rbp - 0x78], rax
0xdf6eac: mov qword ptr [rbp - 0x70], rdi
0xdf6eb0: mov word ptr [rbp - 0x68], 0
0xdf6eb6: mov ecx, dword ptr [r14 + 0x48]
0xdf6eba: mov eax, dword ptr [r14 + 0x4c]
0xdf6ebe: cmp eax, ecx
0xdf6ec0: ja 0x140df6fa1
0xdf6ec6: lea r12d, [rax*2 + 1]
0xdf6ece: add r12d, eax
0xdf6ed1: shr r12d, 1
0xdf6ed4: cmp r12d, 1
0xdf6ed8: cmovb r12d, r15d
0xdf6edc: cmp ecx, r12d
0xdf6edf: cmova r12d, ecx
0xdf6ee3: cmp r12d, eax
0xdf6ee6: jbe 0x140df6fa1
0xdf6eec: mov ecx, r12d
0xdf6eef: shl ecx, 5
0xdf6ef2: mov r8d, 0x1fd
0xdf6ef8: mov rax, qword ptr gs:[0x58]
0xdf6f01: mov rax, qword ptr [rax]
0xdf6f04: add rax, r8
0xdf6f07: mov qword ptr [rbp + 0x60], rax
0xdf6f0b: mov edx, 8
0xdf6f10: vzeroupper 
0xdf6f13: cmp byte ptr [rax], 0
0xdf6f16: je 0x140df6f1f
0xdf6f18: call 0x1447efa78
0xdf6f1d: jmp 0x140df6f24
0xdf6f1f: call 0x1447ef9b0
0xdf6f24: mov r13, rax
0xdf6f27: test rax, rax
0xdf6f2a: jne 0x140df6f45
0xdf6f2c: call 0x141318e70
0xdf6f31: xor r9d, r9d
0xdf6f34: xor r8d, r8d
0xdf6f37: mov edx, r15d
0xdf6f3a: mov ecx, 0xa0000002
0xdf6f3f: call qword ptr [rip + 0x43f4203]
0xdf6f45: mov r15d, edi
0xdf6f48: cmp dword ptr [r14 + 0x48], edi
0xdf6f4c: jbe 0x140df6f7b
0xdf6f4e: nop 
0xdf6f50: mov ecx, r15d
0xdf6f53: shl rcx, 5
0xdf6f57: mov rax, qword ptr [r14 + 0x40]
0xdf6f5b: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf6f60: vmovups ymmword ptr [rcx + r13], ymm0
0xdf6f66: add rcx, qword ptr [r14 + 0x40]
0xdf6f6a: vzeroupper 
0xdf6f6d: call 0x14035f1f0
0xdf6f72: inc r15d
0xdf6f75: cmp r15d, dword ptr [r14 + 0x48]
0xdf6f79: jb 0x140df6f50
0xdf6f7b: mov rcx, qword ptr [r14 + 0x40]
0xdf6f7f: test rcx, rcx
0xdf6f82: je 0x140df6f99
0xdf6f84: mov rax, qword ptr [rbp + 0x60]
0xdf6f88: cmp byte ptr [rax], 0
0xdf6f8b: je 0x140df6f94
0xdf6f8d: call 0x1447f03bc
0xdf6f92: jmp 0x140df6f99
0xdf6f94: call 0x1447f02bc
0xdf6f99: mov qword ptr [r14 + 0x40], r13
0xdf6f9d: mov dword ptr [r14 + 0x4c], r12d
0xdf6fa1: mov eax, dword ptr [r14 + 0x48]
0xdf6fa5: shl rax, 5
0xdf6fa9: add rax, qword ptr [r14 + 0x40]
0xdf6fad: vmovups ymm0, ymmword ptr [rbp - 0x80]
0xdf6fb2: vmovups ymmword ptr [rax], ymm0
0xdf6fb6: inc dword ptr [r14 + 0x48]
0xdf6fba: mov byte ptr [rbp - 0x67], 0
0xdf6fbe: mov rcx, qword ptr [rsi + 0x180]
0xdf6fc5: add rcx, 0x40
0xdf6fc9: mov qword ptr [rsp + 0x60], rbx
0xdf6fce: lea r8, [rip + 0xab9b]
0xdf6fd5: mov qword ptr [rsp + 0x68], r8
0xdf6fda: mov qword ptr [rsp + 0x70], rdi
0xdf6fdf: mov word ptr [rsp + 0x78], 0
0xdf6fe6: lea rdx, [rsp + 0x60]
0xdf6feb: vzeroupper 
0xdf6fee: call 0x140476290
0xdf6ff3: nop 
0xdf6ff4: mov byte ptr [rsp + 0x79], 0
0xdf6ff9: mov rcx, qword ptr [rsi + 0x188]
0xdf7000: add rcx, 0x40
0xdf7004: mov qword ptr [rsp + 0x20], rbx
0xdf7009: lea r8, [rip + 0xab70]
0xdf7010: mov qword ptr [rsp + 0x28], r8
0xdf7015: mov qword ptr [rsp + 0x30], rdi
0xdf701a: mov word ptr [rsp + 0x38], 0
0xdf7021: lea rdx, [rsp + 0x20]
0xdf7026: call 0x140476290
0xdf702b: nop 
0xdf702c: mov byte ptr [rsp + 0x39], 0
0xdf7031: mov rcx, qword ptr [rsi + 0x450]
0xdf7038: add rcx, 0x40
0xdf703c: mov qword ptr [rsp + 0x40], rbx
0xdf7041: lea r8, [rip + 0xab48]
0xdf7048: mov qword ptr [rsp + 0x48], r8
0xdf704d: mov qword ptr [rsp + 0x50], rdi
0xdf7052: mov word ptr [rsp + 0x58], 0
0xdf7059: lea rdx, [rsp + 0x40]
0xdf705e: call 0x140476290
0xdf7063: nop 
0xdf7064: mov byte ptr [rsp + 0x59], 0
0xdf7069: mov rcx, qword ptr [rsi + 0x6c8]
0xdf7070: add rcx, 0x40
0xdf7074: mov qword ptr [rbp - 0x60], rbx
0xdf7078: lea r8, [rip + 0xab21]
0xdf707f: mov qword ptr [rbp - 0x58], r8
0xdf7083: mov qword ptr [rbp - 0x50], rdi
0xdf7087: mov word ptr [rbp - 0x48], 0
0xdf708d: lea rdx, [rbp - 0x60]
0xdf7091: call 0x140476290
0xdf7096: nop 
0xdf7097: mov byte ptr [rbp - 0x47], 0
0xdf709b: mov rcx, qword ptr [rsi + 0x6d0]
0xdf70a2: add rcx, 0x40
0xdf70a6: mov qword ptr [rbp - 0x40], rbx
0xdf70aa: lea r8, [rip + 0xaaff]
0xdf70b1: mov qword ptr [rbp - 0x38], r8
0xdf70b5: mov qword ptr [rbp - 0x30], rdi
0xdf70b9: mov word ptr [rbp - 0x28], 0
0xdf70bf: lea rdx, [rbp - 0x40]
0xdf70c3: call 0x140476290
0xdf70c8: nop 
0xdf70c9: mov byte ptr [rbp - 0x27], 0
0xdf70cd: mov rcx, qword ptr [rsi + 0x6d8]
0xdf70d4: add rcx, 0x40
0xdf70d8: mov qword ptr [rbp - 0x20], rbx
0xdf70dc: lea r8, [rip + 0xaaed]
0xdf70e3: mov qword ptr [rbp - 0x18], r8
0xdf70e7: mov qword ptr [rbp - 0x10], rdi
0xdf70eb: mov word ptr [rbp - 8], 0
0xdf70f1: lea rdx, [rbp - 0x20]
0xdf70f5: call 0x140476290
0xdf70fa: nop 
0xdf70fb: mov byte ptr [rbp - 7], 0
0xdf70ff: mov r14, qword ptr [rsi + 0x6e0]
0xdf7106: mov qword ptr [rbp], rbx
0xdf710a: lea rax, [rip + 0xaadf]
0xdf7111: mov qword ptr [rbp + 8], rax
0xdf7115: mov qword ptr [rbp + 0x10], rdi
0xdf7119: mov word ptr [rbp + 0x18], 0
0xdf711f: mov ecx, dword ptr [r14 + 0x48]
0xdf7123: mov eax, dword ptr [r14 + 0x4c]
0xdf7127: cmp eax, ecx
0xdf7129: ja 0x140df71ff
0xdf712f: lea r15d, [rax*2 + 1]
0xdf7137: add r15d, eax
0xdf713a: shr r15d, 1
0xdf713d: cmp r15d, 1
0xdf7141: mov r13d, 1
0xdf7147: cmovb r15d, r13d
0xdf714b: cmp ecx, r15d
0xdf714e: cmova r15d, ecx
0xdf7152: cmp r15d, eax
0xdf7155: jbe 0x140df71ff
0xdf715b: mov ecx, r15d
0xdf715e: shl ecx, 5
0xdf7161: mov r9d, 0x1fd
0xdf7167: mov rax, qword ptr gs:[0x58]
0xdf7170: mov r8, qword ptr [rax]
0xdf7173: mov edx, 8
0xdf7178: cmp byte ptr [r9 + r8], 0
0xdf717d: je 0x140df7186
0xdf717f: call 0x1447efa78
0xdf7184: jmp 0x140df718b
0xdf7186: call 0x1447ef9b0
0xdf718b: mov r12, rax
0xdf718e: test rax, rax
0xdf7191: jne 0x140df71ac
0xdf7193: call 0x141318e70
0xdf7198: xor r9d, r9d
0xdf719b: xor r8d, r8d
0xdf719e: mov edx, r13d
0xdf71a1: mov ecx, 0xa0000002
0xdf71a6: call qword ptr [rip + 0x43f3f9c]
0xdf71ac: cmp dword ptr [r14 + 0x48], 0
0xdf71b1: jbe 0x140df71e9
0xdf71b3: nop dword ptr [rax]
0xdf71b7: nop word ptr [rax + rax]
0xdf71c0: mov ecx, edi
0xdf71c2: shl rcx, 5
0xdf71c6: mov rax, qword ptr [r14 + 0x40]
0xdf71ca: vmovups ymm0, ymmword ptr [rcx + rax]
0xdf71cf: vmovups ymmword ptr [rcx + r12], ymm0
0xdf71d5: add rcx, qword ptr [r14 + 0x40]
0xdf71d9: vzeroupper 
0xdf71dc: call 0x14035f1f0
0xdf71e1: inc edi
0xdf71e3: cmp edi, dword ptr [r14 + 0x48]
0xdf71e7: jb 0x140df71c0
0xdf71e9: mov rcx, qword ptr [r14 + 0x40]
0xdf71ed: test rcx, rcx
0xdf71f0: je 0x140df71f7
0xdf71f2: call 0x1413738b0
0xdf71f7: mov qword ptr [r14 + 0x40], r12
0xdf71fb: mov dword ptr [r14 + 0x4c], r15d
0xdf71ff: mov eax, dword ptr [r14 + 0x48]
0xdf7203: shl rax, 5
0xdf7207: add rax, qword ptr [r14 + 0x40]
0xdf720b: vmovups ymm0, ymmword ptr [rbp]
0xdf7210: vmovups ymmword ptr [rax], ymm0
0xdf7214: inc dword ptr [r14 + 0x48]
0xdf7218: lea rcx, [rbp]
0xdf721c: vzeroupper 
0xdf721f: call 0x14035f1f0
0xdf7224: mov rcx, qword ptr [rsi + 0x120]
0xdf722b: add rcx, 0x40
0xdf722f: mov rdx, rbx
0xdf7232: call 0x140e00760
0xdf7237: mov rcx, qword ptr [rsi + 0x128]
0xdf723e: add rcx, 0x40
0xdf7242: mov rdx, rbx
0xdf7245: call 0x140e007a0
0xdf724a: mov rcx, qword ptr [rsi + 0x148]
0xdf7251: add rcx, 0x40
0xdf7255: mov rdx, rbx
0xdf7258: call 0x140e007e0
0xdf725d: mov rcx, qword ptr [rsi + 0xb60]
0xdf7264: add rcx, 0x40
0xdf7268: mov rdx, rbx
0xdf726b: call 0x140e00820
0xdf7270: mov rcx, qword ptr [rsi + 0xad0]
0xdf7277: add rcx, 0x40
0xdf727b: mov rdx, rbx
0xdf727e: call 0x140e00860
0xdf7283: jmp 0x140df8122
0xdf7288: mov edx, dword ptr [r12 + 0x48]
0xdf728d: mov r14d, edi
0xdf7290: test edx, edx
0xdf7292: je 0x140df7302
0xdf7294: mov r8, qword ptr [r12 + 0x40]
0xdf7299: lea rax, [rip + 0xa350]
0xdf72a0: mov r15d, r14d
0xdf72a3: shl r15, 5
0xdf72a7: lea rcx, [r8 + r15]
0xdf72ab: cmp rbx, qword ptr [rcx]
0xdf72ae: jne 0x140df72b6
0xdf72b0: cmp rax, qword ptr [rcx + 8]
0xdf72b4: je 0x140df72c0
0xdf72b6: inc r14d
0xdf72b9: cmp r14d, edx
0xdf72bc: jb 0x140df72a0
0xdf72be: jmp 0x140df7302
0xdf72c0: call 0x14035f1f0
0xdf72c5: mov eax, dword ptr [r12 + 0x48]
0xdf72ca: dec eax
0xdf72cc: cmp r14d, eax
0xdf72cf: jae 0x140df72fd
0xdf72d1: mov rcx, qword ptr [r12 + 0x40]
0xdf72d6: shl rax, 5
0xdf72da: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf72df: vmovups ymmword ptr [rcx + r15], ymm0
0xdf72e5: mov ecx, dword ptr [r12 + 0x48]
0xdf72ea: dec ecx
0xdf72ec: shl rcx, 5
0xdf72f0: add rcx, qword ptr [r12 + 0x40]
0xdf72f5: vzeroupper 
0xdf72f8: call 0x14035f1f0
0xdf72fd: dec dword ptr [r12 + 0x48]
0xdf7302: mov rcx, qword ptr [rsi + 0x210]
0xdf7309: add rcx, 0x40
0xdf730d: lea r8, [rip + 0xa30c]
0xdf7314: mov rdx, rbx
0xdf7317: call 0x140763d30
0xdf731c: mov r12, qword ptr [rsi + 0x610]
0xdf7323: mov edx, dword ptr [r12 + 0x48]
0xdf7328: mov r14d, edi
0xdf732b: test edx, edx
0xdf732d: je 0x140df73a2
0xdf732f: mov r8, qword ptr [r12 + 0x40]
0xdf7334: lea rax, [rip + 0xa325]
0xdf733b: nop dword ptr [rax + rax]
0xdf7340: mov r15d, r14d
0xdf7343: shl r15, 5
0xdf7347: lea rcx, [r15 + r8]
0xdf734b: cmp rbx, qword ptr [rcx]
0xdf734e: jne 0x140df7356
0xdf7350: cmp rax, qword ptr [rcx + 8]
0xdf7354: je 0x140df7360
0xdf7356: inc r14d
0xdf7359: cmp r14d, edx
0xdf735c: jb 0x140df7340
0xdf735e: jmp 0x140df73a2
0xdf7360: call 0x14035f1f0
0xdf7365: mov eax, dword ptr [r12 + 0x48]
0xdf736a: dec eax
0xdf736c: cmp r14d, eax
0xdf736f: jae 0x140df739d
0xdf7371: mov rcx, qword ptr [r12 + 0x40]
0xdf7376: shl rax, 5
0xdf737a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf737f: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7385: mov ecx, dword ptr [r12 + 0x48]
0xdf738a: dec ecx
0xdf738c: shl rcx, 5
0xdf7390: add rcx, qword ptr [r12 + 0x40]
0xdf7395: vzeroupper 
0xdf7398: call 0x14035f1f0
0xdf739d: dec dword ptr [r12 + 0x48]
0xdf73a2: mov r12, qword ptr [rsi + 0x618]
0xdf73a9: add r12, 0x40
0xdf73ad: mov edx, dword ptr [r12 + 8]
0xdf73b2: mov r14d, edi
0xdf73b5: test edx, edx
0xdf73b7: je 0x140df7430
0xdf73b9: mov r8, qword ptr [r12]
0xdf73bd: lea rax, [rip + 0xa2ec]
0xdf73c4: nop dword ptr [rax]
0xdf73c8: nop dword ptr [rax + rax]
0xdf73d0: mov r15d, r14d
0xdf73d3: shl r15, 5
0xdf73d7: lea rcx, [r15 + r8]
0xdf73db: cmp rbx, qword ptr [rcx]
0xdf73de: jne 0x140df73e6
0xdf73e0: cmp rax, qword ptr [rcx + 8]
0xdf73e4: je 0x140df73f0
0xdf73e6: inc r14d
0xdf73e9: cmp r14d, edx
0xdf73ec: jb 0x140df73d0
0xdf73ee: jmp 0x140df7430
0xdf73f0: call 0x14035f1f0
0xdf73f5: mov eax, dword ptr [r12 + 8]
0xdf73fa: dec eax
0xdf73fc: cmp r14d, eax
0xdf73ff: jae 0x140df742b
0xdf7401: mov rcx, qword ptr [r12]
0xdf7405: shl rax, 5
0xdf7409: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf740e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7414: mov ecx, dword ptr [r12 + 8]
0xdf7419: dec ecx
0xdf741b: shl rcx, 5
0xdf741f: add rcx, qword ptr [r12]
0xdf7423: vzeroupper 
0xdf7426: call 0x14035f1f0
0xdf742b: dec dword ptr [r12 + 8]
0xdf7430: mov r12, qword ptr [rsi + 0x650]
0xdf7437: add r12, 0x40
0xdf743b: mov edx, dword ptr [r12 + 8]
0xdf7440: mov r14d, edi
0xdf7443: test edx, edx
0xdf7445: je 0x140df74c0
0xdf7447: mov r8, qword ptr [r12]
0xdf744b: lea rax, [rip + 0xa29e]
0xdf7452: nop dword ptr [rax]
0xdf7456: nop word ptr [rax + rax]
0xdf7460: mov r15d, r14d
0xdf7463: shl r15, 5
0xdf7467: lea rcx, [r15 + r8]
0xdf746b: cmp rbx, qword ptr [rcx]
0xdf746e: jne 0x140df7476
0xdf7470: cmp rax, qword ptr [rcx + 8]
0xdf7474: je 0x140df7480
0xdf7476: inc r14d
0xdf7479: cmp r14d, edx
0xdf747c: jb 0x140df7460
0xdf747e: jmp 0x140df74c0
0xdf7480: call 0x14035f1f0
0xdf7485: mov eax, dword ptr [r12 + 8]
0xdf748a: dec eax
0xdf748c: cmp r14d, eax
0xdf748f: jae 0x140df74bb
0xdf7491: mov rcx, qword ptr [r12]
0xdf7495: shl rax, 5
0xdf7499: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf749e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf74a4: mov ecx, dword ptr [r12 + 8]
0xdf74a9: dec ecx
0xdf74ab: shl rcx, 5
0xdf74af: add rcx, qword ptr [r12]
0xdf74b3: vzeroupper 
0xdf74b6: call 0x14035f1f0
0xdf74bb: dec dword ptr [r12 + 8]
0xdf74c0: mov r12, qword ptr [rsi + 0x630]
0xdf74c7: add r12, 0x40
0xdf74cb: mov edx, dword ptr [r12 + 8]
0xdf74d0: mov r14d, edi
0xdf74d3: test edx, edx
0xdf74d5: je 0x140df7550
0xdf74d7: mov r8, qword ptr [r12]
0xdf74db: lea rax, [rip + 0xa22e]
0xdf74e2: nop dword ptr [rax]
0xdf74e6: nop word ptr [rax + rax]
0xdf74f0: mov r15d, r14d
0xdf74f3: shl r15, 5
0xdf74f7: lea rcx, [r15 + r8]
0xdf74fb: cmp rbx, qword ptr [rcx]
0xdf74fe: jne 0x140df7506
0xdf7500: cmp rax, qword ptr [rcx + 8]
0xdf7504: je 0x140df7510
0xdf7506: inc r14d
0xdf7509: cmp r14d, edx
0xdf750c: jb 0x140df74f0
0xdf750e: jmp 0x140df7550
0xdf7510: call 0x14035f1f0
0xdf7515: mov eax, dword ptr [r12 + 8]
0xdf751a: dec eax
0xdf751c: cmp r14d, eax
0xdf751f: jae 0x140df754b
0xdf7521: mov rcx, qword ptr [r12]
0xdf7525: shl rax, 5
0xdf7529: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf752e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7534: mov ecx, dword ptr [r12 + 8]
0xdf7539: dec ecx
0xdf753b: shl rcx, 5
0xdf753f: add rcx, qword ptr [r12]
0xdf7543: vzeroupper 
0xdf7546: call 0x14035f1f0
0xdf754b: dec dword ptr [r12 + 8]
0xdf7550: mov rcx, qword ptr [rsi + 0x628]
0xdf7557: add rcx, 0x40
0xdf755b: lea r8, [rip + 0xa1be]
0xdf7562: mov rdx, rbx
0xdf7565: call 0x140763d30
0xdf756a: mov r12, qword ptr [rsi + 0x620]
0xdf7571: mov edx, dword ptr [r12 + 0x48]
0xdf7576: mov r14d, edi
0xdf7579: test edx, edx
0xdf757b: je 0x140df75f2
0xdf757d: mov r8, qword ptr [r12 + 0x40]
0xdf7582: lea rax, [rip + 0xa1c7]
0xdf7589: nop dword ptr [rax]
0xdf7590: mov r15d, r14d
0xdf7593: shl r15, 5
0xdf7597: lea rcx, [r15 + r8]
0xdf759b: cmp rbx, qword ptr [rcx]
0xdf759e: jne 0x140df75a6
0xdf75a0: cmp rax, qword ptr [rcx + 8]
0xdf75a4: je 0x140df75b0
0xdf75a6: inc r14d
0xdf75a9: cmp r14d, edx
0xdf75ac: jb 0x140df7590
0xdf75ae: jmp 0x140df75f2
0xdf75b0: call 0x14035f1f0
0xdf75b5: mov eax, dword ptr [r12 + 0x48]
0xdf75ba: dec eax
0xdf75bc: cmp r14d, eax
0xdf75bf: jae 0x140df75ed
0xdf75c1: mov rcx, qword ptr [r12 + 0x40]
0xdf75c6: shl rax, 5
0xdf75ca: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf75cf: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf75d5: mov ecx, dword ptr [r12 + 0x48]
0xdf75da: dec ecx
0xdf75dc: shl rcx, 5
0xdf75e0: add rcx, qword ptr [r12 + 0x40]
0xdf75e5: vzeroupper 
0xdf75e8: call 0x14035f1f0
0xdf75ed: dec dword ptr [r12 + 0x48]
0xdf75f2: mov r12, qword ptr [rsi + 0x638]
0xdf75f9: add r12, 0x40
0xdf75fd: mov edx, dword ptr [r12 + 8]
0xdf7602: mov r14d, edi
0xdf7605: test edx, edx
0xdf7607: je 0x140df7680
0xdf7609: mov r8, qword ptr [r12]
0xdf760d: lea rax, [rip + 0xa15c]
0xdf7614: nop dword ptr [rax]
0xdf7618: nop dword ptr [rax + rax]
0xdf7620: mov r15d, r14d
0xdf7623: shl r15, 5
0xdf7627: lea rcx, [r15 + r8]
0xdf762b: cmp rbx, qword ptr [rcx]
0xdf762e: jne 0x140df7636
0xdf7630: cmp rax, qword ptr [rcx + 8]
0xdf7634: je 0x140df7640
0xdf7636: inc r14d
0xdf7639: cmp r14d, edx
0xdf763c: jb 0x140df7620
0xdf763e: jmp 0x140df7680
0xdf7640: call 0x14035f1f0
0xdf7645: mov eax, dword ptr [r12 + 8]
0xdf764a: dec eax
0xdf764c: cmp r14d, eax
0xdf764f: jae 0x140df767b
0xdf7651: mov rcx, qword ptr [r12]
0xdf7655: shl rax, 5
0xdf7659: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf765e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7664: mov ecx, dword ptr [r12 + 8]
0xdf7669: dec ecx
0xdf766b: shl rcx, 5
0xdf766f: add rcx, qword ptr [r12]
0xdf7673: vzeroupper 
0xdf7676: call 0x14035f1f0
0xdf767b: dec dword ptr [r12 + 8]
0xdf7680: mov r12, qword ptr [rsi + 0x640]
0xdf7687: add r12, 0x40
0xdf768b: mov edx, dword ptr [r12 + 8]
0xdf7690: mov r14d, edi
0xdf7693: test edx, edx
0xdf7695: je 0x140df7710
0xdf7697: mov r8, qword ptr [r12]
0xdf769b: lea rax, [rip + 0xa0ee]
0xdf76a2: nop dword ptr [rax]
0xdf76a6: nop word ptr [rax + rax]
0xdf76b0: mov r15d, r14d
0xdf76b3: shl r15, 5
0xdf76b7: lea rcx, [r15 + r8]
0xdf76bb: cmp rbx, qword ptr [rcx]
0xdf76be: jne 0x140df76c6
0xdf76c0: cmp rax, qword ptr [rcx + 8]
0xdf76c4: je 0x140df76d0
0xdf76c6: inc r14d
0xdf76c9: cmp r14d, edx
0xdf76cc: jb 0x140df76b0
0xdf76ce: jmp 0x140df7710
0xdf76d0: call 0x14035f1f0
0xdf76d5: mov eax, dword ptr [r12 + 8]
0xdf76da: dec eax
0xdf76dc: cmp r14d, eax
0xdf76df: jae 0x140df770b
0xdf76e1: mov rcx, qword ptr [r12]
0xdf76e5: shl rax, 5
0xdf76e9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf76ee: vmovups ymmword ptr [rcx + r15], ymm0
0xdf76f4: mov ecx, dword ptr [r12 + 8]
0xdf76f9: dec ecx
0xdf76fb: shl rcx, 5
0xdf76ff: add rcx, qword ptr [r12]
0xdf7703: vzeroupper 
0xdf7706: call 0x14035f1f0
0xdf770b: dec dword ptr [r12 + 8]
0xdf7710: mov r12, qword ptr [rsi + 0x648]
0xdf7717: add r12, 0x40
0xdf771b: mov edx, dword ptr [r12 + 8]
0xdf7720: mov r14d, edi
0xdf7723: test edx, edx
0xdf7725: je 0x140df77a0
0xdf7727: mov r8, qword ptr [r12]
0xdf772b: lea rax, [rip + 0xa06e]
0xdf7732: nop dword ptr [rax]
0xdf7736: nop word ptr [rax + rax]
0xdf7740: mov r15d, r14d
0xdf7743: shl r15, 5
0xdf7747: lea rcx, [r15 + r8]
0xdf774b: cmp rbx, qword ptr [rcx]
0xdf774e: jne 0x140df7756
0xdf7750: cmp rax, qword ptr [rcx + 8]
0xdf7754: je 0x140df7760
0xdf7756: inc r14d
0xdf7759: cmp r14d, edx
0xdf775c: jb 0x140df7740
0xdf775e: jmp 0x140df77a0
0xdf7760: call 0x14035f1f0
0xdf7765: mov eax, dword ptr [r12 + 8]
0xdf776a: dec eax
0xdf776c: cmp r14d, eax
0xdf776f: jae 0x140df779b
0xdf7771: mov rcx, qword ptr [r12]
0xdf7775: shl rax, 5
0xdf7779: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf777e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7784: mov ecx, dword ptr [r12 + 8]
0xdf7789: dec ecx
0xdf778b: shl rcx, 5
0xdf778f: add rcx, qword ptr [r12]
0xdf7793: vzeroupper 
0xdf7796: call 0x14035f1f0
0xdf779b: dec dword ptr [r12 + 8]
0xdf77a0: mov r12, qword ptr [rsi + 0x658]
0xdf77a7: add r12, 0x40
0xdf77ab: mov edx, dword ptr [r12 + 8]
0xdf77b0: mov r14d, edi
0xdf77b3: test edx, edx
0xdf77b5: je 0x140df7830
0xdf77b7: mov r8, qword ptr [r12]
0xdf77bb: lea rax, [rip + 0x9fee]
0xdf77c2: nop dword ptr [rax]
0xdf77c6: nop word ptr [rax + rax]
0xdf77d0: mov r15d, r14d
0xdf77d3: shl r15, 5
0xdf77d7: lea rcx, [r15 + r8]
0xdf77db: cmp rbx, qword ptr [rcx]
0xdf77de: jne 0x140df77e6
0xdf77e0: cmp rax, qword ptr [rcx + 8]
0xdf77e4: je 0x140df77f0
0xdf77e6: inc r14d
0xdf77e9: cmp r14d, edx
0xdf77ec: jb 0x140df77d0
0xdf77ee: jmp 0x140df7830
0xdf77f0: call 0x14035f1f0
0xdf77f5: mov eax, dword ptr [r12 + 8]
0xdf77fa: dec eax
0xdf77fc: cmp r14d, eax
0xdf77ff: jae 0x140df782b
0xdf7801: mov rcx, qword ptr [r12]
0xdf7805: shl rax, 5
0xdf7809: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf780e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7814: mov ecx, dword ptr [r12 + 8]
0xdf7819: dec ecx
0xdf781b: shl rcx, 5
0xdf781f: add rcx, qword ptr [r12]
0xdf7823: vzeroupper 
0xdf7826: call 0x14035f1f0
0xdf782b: dec dword ptr [r12 + 8]
0xdf7830: mov r12, qword ptr [rsi + 0x670]
0xdf7837: add r12, 0x40
0xdf783b: mov edx, dword ptr [r12 + 8]
0xdf7840: mov r14d, edi
0xdf7843: test edx, edx
0xdf7845: je 0x140df78c0
0xdf7847: mov r8, qword ptr [r12]
0xdf784b: lea rax, [rip + 0x9f6e]
0xdf7852: nop dword ptr [rax]
0xdf7856: nop word ptr [rax + rax]
0xdf7860: mov r15d, r14d
0xdf7863: shl r15, 5
0xdf7867: lea rcx, [r15 + r8]
0xdf786b: cmp rbx, qword ptr [rcx]
0xdf786e: jne 0x140df7876
0xdf7870: cmp rax, qword ptr [rcx + 8]
0xdf7874: je 0x140df7880
0xdf7876: inc r14d
0xdf7879: cmp r14d, edx
0xdf787c: jb 0x140df7860
0xdf787e: jmp 0x140df78c0
0xdf7880: call 0x14035f1f0
0xdf7885: mov eax, dword ptr [r12 + 8]
0xdf788a: dec eax
0xdf788c: cmp r14d, eax
0xdf788f: jae 0x140df78bb
0xdf7891: mov rcx, qword ptr [r12]
0xdf7895: shl rax, 5
0xdf7899: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf789e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf78a4: mov ecx, dword ptr [r12 + 8]
0xdf78a9: dec ecx
0xdf78ab: shl rcx, 5
0xdf78af: add rcx, qword ptr [r12]
0xdf78b3: vzeroupper 
0xdf78b6: call 0x14035f1f0
0xdf78bb: dec dword ptr [r12 + 8]
0xdf78c0: mov rcx, qword ptr [rsi + 0xc8]
0xdf78c7: add rcx, 0x40
0xdf78cb: lea r8, [rip + 0x9efe]
0xdf78d2: mov rdx, rbx
0xdf78d5: call 0x140763d30
0xdf78da: mov rcx, qword ptr [rsi + 0x108]
0xdf78e1: add rcx, 0x40
0xdf78e5: lea r8, [rip + 0x9ef4]
0xdf78ec: mov rdx, rbx
0xdf78ef: call 0x140763d30
0xdf78f4: mov r12, qword ptr [rsi + 0xd0]
0xdf78fb: mov eax, dword ptr [r12 + 0x48]
0xdf7900: mov r14d, edi
0xdf7903: test eax, eax
0xdf7905: je 0x140df7982
0xdf7907: mov r8, qword ptr [r12 + 0x40]
0xdf790c: lea rdx, [rip + 0x9edd]
0xdf7913: nop dword ptr [rax]
0xdf7917: nop word ptr [rax + rax]
0xdf7920: mov r15d, r14d
0xdf7923: shl r15, 5
0xdf7927: lea rcx, [r15 + r8]
0xdf792b: cmp rbx, qword ptr [rcx]
0xdf792e: jne 0x140df7936
0xdf7930: cmp rdx, qword ptr [rcx + 8]
0xdf7934: je 0x140df7940
0xdf7936: inc r14d
0xdf7939: cmp r14d, eax
0xdf793c: jb 0x140df7920
0xdf793e: jmp 0x140df7982
0xdf7940: call 0x14035f1f0
0xdf7945: mov eax, dword ptr [r12 + 0x48]
0xdf794a: dec eax
0xdf794c: cmp r14d, eax
0xdf794f: jae 0x140df797d
0xdf7951: mov rcx, qword ptr [r12 + 0x40]
0xdf7956: shl rax, 5
0xdf795a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf795f: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7965: mov ecx, dword ptr [r12 + 0x48]
0xdf796a: dec ecx
0xdf796c: shl rcx, 5
0xdf7970: add rcx, qword ptr [r12 + 0x40]
0xdf7975: vzeroupper 
0xdf7978: call 0x14035f1f0
0xdf797d: dec dword ptr [r12 + 0x48]
0xdf7982: mov r12, qword ptr [rsi + 0xe0]
0xdf7989: add r12, 0x40
0xdf798d: mov eax, dword ptr [r12 + 8]
0xdf7992: mov r14d, edi
0xdf7995: test eax, eax
0xdf7997: je 0x140df7a10
0xdf7999: mov r8, qword ptr [r12]
0xdf799d: lea rdx, [rip + 0x9e5c]
0xdf79a4: nop dword ptr [rax]
0xdf79a8: nop dword ptr [rax + rax]
0xdf79b0: mov r15d, r14d
0xdf79b3: shl r15, 5
0xdf79b7: lea rcx, [r15 + r8]
0xdf79bb: cmp rbx, qword ptr [rcx]
0xdf79be: jne 0x140df79c6
0xdf79c0: cmp rdx, qword ptr [rcx + 8]
0xdf79c4: je 0x140df79d0
0xdf79c6: inc r14d
0xdf79c9: cmp r14d, eax
0xdf79cc: jb 0x140df79b0
0xdf79ce: jmp 0x140df7a10
0xdf79d0: call 0x14035f1f0
0xdf79d5: mov eax, dword ptr [r12 + 8]
0xdf79da: dec eax
0xdf79dc: cmp r14d, eax
0xdf79df: jae 0x140df7a0b
0xdf79e1: mov rcx, qword ptr [r12]
0xdf79e5: shl rax, 5
0xdf79e9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf79ee: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf79f4: mov ecx, dword ptr [r12 + 8]
0xdf79f9: dec ecx
0xdf79fb: shl rcx, 5
0xdf79ff: add rcx, qword ptr [r12]
0xdf7a03: vzeroupper 
0xdf7a06: call 0x14035f1f0
0xdf7a0b: dec dword ptr [r12 + 8]
0xdf7a10: mov rcx, qword ptr [rsi + 0xe8]
0xdf7a17: add rcx, 0x40
0xdf7a1b: lea r8, [rip + 0x9e4e]
0xdf7a22: mov rdx, rbx
0xdf7a25: call 0x140763d30
0xdf7a2a: mov rcx, qword ptr [rsi + 0x9e0]
0xdf7a31: add rcx, 0x40
0xdf7a35: lea r8, [rip + 0x9e54]
0xdf7a3c: mov rdx, rbx
0xdf7a3f: call 0x140763d30
0xdf7a44: mov r12, qword ptr [rsi + 0x358]
0xdf7a4b: mov eax, dword ptr [r12 + 0x48]
0xdf7a50: mov r14d, edi
0xdf7a53: test eax, eax
0xdf7a55: je 0x140df7ad2
0xdf7a57: mov r8, qword ptr [r12 + 0x40]
0xdf7a5c: lea rdx, [rip + 0x9e3d]
0xdf7a63: nop dword ptr [rax]
0xdf7a67: nop word ptr [rax + rax]
0xdf7a70: mov r15d, r14d
0xdf7a73: shl r15, 5
0xdf7a77: lea rcx, [r15 + r8]
0xdf7a7b: cmp rbx, qword ptr [rcx]
0xdf7a7e: jne 0x140df7a86
0xdf7a80: cmp rdx, qword ptr [rcx + 8]
0xdf7a84: je 0x140df7a90
0xdf7a86: inc r14d
0xdf7a89: cmp r14d, eax
0xdf7a8c: jb 0x140df7a70
0xdf7a8e: jmp 0x140df7ad2
0xdf7a90: call 0x14035f1f0
0xdf7a95: mov eax, dword ptr [r12 + 0x48]
0xdf7a9a: dec eax
0xdf7a9c: cmp r14d, eax
0xdf7a9f: jae 0x140df7acd
0xdf7aa1: mov rcx, qword ptr [r12 + 0x40]
0xdf7aa6: shl rax, 5
0xdf7aaa: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7aaf: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7ab5: mov ecx, dword ptr [r12 + 0x48]
0xdf7aba: dec ecx
0xdf7abc: shl rcx, 5
0xdf7ac0: add rcx, qword ptr [r12 + 0x40]
0xdf7ac5: vzeroupper 
0xdf7ac8: call 0x14035f1f0
0xdf7acd: dec dword ptr [r12 + 0x48]
0xdf7ad2: mov r12, qword ptr [rsi + 0xd8]
0xdf7ad9: add r12, 0x40
0xdf7add: mov eax, dword ptr [r12 + 8]
0xdf7ae2: mov r14d, edi
0xdf7ae5: test eax, eax
0xdf7ae7: je 0x140df7b60
0xdf7ae9: mov r8, qword ptr [r12]
0xdf7aed: lea rdx, [rip + 0x9dbc]
0xdf7af4: nop dword ptr [rax]
0xdf7af8: nop dword ptr [rax + rax]
0xdf7b00: mov r15d, r14d
0xdf7b03: shl r15, 5
0xdf7b07: lea rcx, [r8 + r15]
0xdf7b0b: cmp rbx, qword ptr [rcx]
0xdf7b0e: jne 0x140df7b16
0xdf7b10: cmp rdx, qword ptr [rcx + 8]
0xdf7b14: je 0x140df7b20
0xdf7b16: inc r14d
0xdf7b19: cmp r14d, eax
0xdf7b1c: jb 0x140df7b00
0xdf7b1e: jmp 0x140df7b60
0xdf7b20: call 0x14035f1f0
0xdf7b25: mov eax, dword ptr [r12 + 8]
0xdf7b2a: dec eax
0xdf7b2c: cmp r14d, eax
0xdf7b2f: jae 0x140df7b5b
0xdf7b31: mov rcx, qword ptr [r12]
0xdf7b35: shl rax, 5
0xdf7b39: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7b3e: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7b44: mov ecx, dword ptr [r12 + 8]
0xdf7b49: dec ecx
0xdf7b4b: shl rcx, 5
0xdf7b4f: add rcx, qword ptr [r12]
0xdf7b53: vzeroupper 
0xdf7b56: call 0x14035f1f0
0xdf7b5b: dec dword ptr [r12 + 8]
0xdf7b60: mov r12, qword ptr [rsi + 0x660]
0xdf7b67: add r12, 0x40
0xdf7b6b: mov edx, dword ptr [r12 + 8]
0xdf7b70: mov r14d, edi
0xdf7b73: test edx, edx
0xdf7b75: je 0x140df7bf0
0xdf7b77: mov r8, qword ptr [r12]
0xdf7b7b: lea rax, [rip + 0x9e0e]
0xdf7b82: nop dword ptr [rax]
0xdf7b86: nop word ptr [rax + rax]
0xdf7b90: mov r15d, r14d
0xdf7b93: shl r15, 5
0xdf7b97: lea rcx, [r8 + r15]
0xdf7b9b: cmp rbx, qword ptr [rcx]
0xdf7b9e: jne 0x140df7ba6
0xdf7ba0: cmp rax, qword ptr [rcx + 8]
0xdf7ba4: je 0x140df7bb0
0xdf7ba6: inc r14d
0xdf7ba9: cmp r14d, edx
0xdf7bac: jb 0x140df7b90
0xdf7bae: jmp 0x140df7bf0
0xdf7bb0: call 0x14035f1f0
0xdf7bb5: mov eax, dword ptr [r12 + 8]
0xdf7bba: dec eax
0xdf7bbc: cmp r14d, eax
0xdf7bbf: jae 0x140df7beb
0xdf7bc1: mov rcx, qword ptr [r12]
0xdf7bc5: shl rax, 5
0xdf7bc9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7bce: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7bd4: mov ecx, dword ptr [r12 + 8]
0xdf7bd9: dec ecx
0xdf7bdb: shl rcx, 5
0xdf7bdf: add rcx, qword ptr [r12]
0xdf7be3: vzeroupper 
0xdf7be6: call 0x14035f1f0
0xdf7beb: dec dword ptr [r12 + 8]
0xdf7bf0: mov rcx, qword ptr [rsi + 0x668]
0xdf7bf7: add rcx, 0x40
0xdf7bfb: lea r8, [rip + 0x9d9e]
0xdf7c02: mov rdx, rbx
0xdf7c05: call 0x140763d30
0xdf7c0a: mov r12, qword ptr [rsi + 0x680]
0xdf7c11: mov edx, dword ptr [r12 + 0x48]
0xdf7c16: mov r14d, edi
0xdf7c19: test edx, edx
0xdf7c1b: je 0x140df7c92
0xdf7c1d: mov r8, qword ptr [r12 + 0x40]
0xdf7c22: lea rax, [rip + 0x9d87]
0xdf7c29: nop dword ptr [rax]
0xdf7c30: mov r15d, r14d
0xdf7c33: shl r15, 5
0xdf7c37: lea rcx, [r8 + r15]
0xdf7c3b: cmp rbx, qword ptr [rcx]
0xdf7c3e: jne 0x140df7c46
0xdf7c40: cmp rax, qword ptr [rcx + 8]
0xdf7c44: je 0x140df7c50
0xdf7c46: inc r14d
0xdf7c49: cmp r14d, edx
0xdf7c4c: jb 0x140df7c30
0xdf7c4e: jmp 0x140df7c92
0xdf7c50: call 0x14035f1f0
0xdf7c55: mov eax, dword ptr [r12 + 0x48]
0xdf7c5a: dec eax
0xdf7c5c: cmp r14d, eax
0xdf7c5f: jae 0x140df7c8d
0xdf7c61: mov rcx, qword ptr [r12 + 0x40]
0xdf7c66: shl rax, 5
0xdf7c6a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7c6f: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7c75: mov ecx, dword ptr [r12 + 0x48]
0xdf7c7a: dec ecx
0xdf7c7c: shl rcx, 5
0xdf7c80: add rcx, qword ptr [r12 + 0x40]
0xdf7c85: vzeroupper 
0xdf7c88: call 0x14035f1f0
0xdf7c8d: dec dword ptr [r12 + 0x48]
0xdf7c92: mov r12, qword ptr [rsi + 0x688]
0xdf7c99: add r12, 0x40
0xdf7c9d: mov edx, dword ptr [r12 + 8]
0xdf7ca2: mov r14d, edi
0xdf7ca5: test edx, edx
0xdf7ca7: je 0x140df7d20
0xdf7ca9: mov r8, qword ptr [r12]
0xdf7cad: lea rax, [rip + 0x9d5c]
0xdf7cb4: nop dword ptr [rax]
0xdf7cb8: nop dword ptr [rax + rax]
0xdf7cc0: mov r15d, r14d
0xdf7cc3: shl r15, 5
0xdf7cc7: lea rcx, [r8 + r15]
0xdf7ccb: cmp rbx, qword ptr [rcx]
0xdf7cce: jne 0x140df7cd6
0xdf7cd0: cmp rax, qword ptr [rcx + 8]
0xdf7cd4: je 0x140df7ce0
0xdf7cd6: inc r14d
0xdf7cd9: cmp r14d, edx
0xdf7cdc: jb 0x140df7cc0
0xdf7cde: jmp 0x140df7d20
0xdf7ce0: call 0x14035f1f0
0xdf7ce5: mov eax, dword ptr [r12 + 8]
0xdf7cea: dec eax
0xdf7cec: cmp r14d, eax
0xdf7cef: jae 0x140df7d1b
0xdf7cf1: mov rcx, qword ptr [r12]
0xdf7cf5: shl rax, 5
0xdf7cf9: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7cfe: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7d04: mov ecx, dword ptr [r12 + 8]
0xdf7d09: dec ecx
0xdf7d0b: shl rcx, 5
0xdf7d0f: add rcx, qword ptr [r12]
0xdf7d13: vzeroupper 
0xdf7d16: call 0x14035f1f0
0xdf7d1b: dec dword ptr [r12 + 8]
0xdf7d20: mov r12, qword ptr [rsi + 0x690]
0xdf7d27: add r12, 0x40
0xdf7d2b: mov edx, dword ptr [r12 + 8]
0xdf7d30: mov r14d, edi
0xdf7d33: test edx, edx
0xdf7d35: je 0x140df7db0
0xdf7d37: mov r8, qword ptr [r12]
0xdf7d3b: lea rax, [rip + 0x9d3e]
0xdf7d42: nop dword ptr [rax]
0xdf7d46: nop word ptr [rax + rax]
0xdf7d50: mov r15d, r14d
0xdf7d53: shl r15, 5
0xdf7d57: lea rcx, [r15 + r8]
0xdf7d5b: cmp rbx, qword ptr [rcx]
0xdf7d5e: jne 0x140df7d66
0xdf7d60: cmp rax, qword ptr [rcx + 8]
0xdf7d64: je 0x140df7d70
0xdf7d66: inc r14d
0xdf7d69: cmp r14d, edx
0xdf7d6c: jb 0x140df7d50
0xdf7d6e: jmp 0x140df7db0
0xdf7d70: call 0x14035f1f0
0xdf7d75: mov eax, dword ptr [r12 + 8]
0xdf7d7a: dec eax
0xdf7d7c: cmp r14d, eax
0xdf7d7f: jae 0x140df7dab
0xdf7d81: mov rcx, qword ptr [r12]
0xdf7d85: shl rax, 5
0xdf7d89: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7d8e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7d94: mov ecx, dword ptr [r12 + 8]
0xdf7d99: dec ecx
0xdf7d9b: shl rcx, 5
0xdf7d9f: add rcx, qword ptr [r12]
0xdf7da3: vzeroupper 
0xdf7da6: call 0x14035f1f0
0xdf7dab: dec dword ptr [r12 + 8]
0xdf7db0: mov r12, qword ptr [rsi + 0x698]
0xdf7db7: add r12, 0x40
0xdf7dbb: mov edx, dword ptr [r12 + 8]
0xdf7dc0: mov r14d, edi
0xdf7dc3: test edx, edx
0xdf7dc5: je 0x140df7e40
0xdf7dc7: mov r8, qword ptr [r12]
0xdf7dcb: lea rax, [rip + 0x9cde]
0xdf7dd2: nop dword ptr [rax]
0xdf7dd6: nop word ptr [rax + rax]
0xdf7de0: mov r15d, r14d
0xdf7de3: shl r15, 5
0xdf7de7: lea rcx, [r8 + r15]
0xdf7deb: cmp rbx, qword ptr [rcx]
0xdf7dee: jne 0x140df7df6
0xdf7df0: cmp rax, qword ptr [rcx + 8]
0xdf7df4: je 0x140df7e00
0xdf7df6: inc r14d
0xdf7df9: cmp r14d, edx
0xdf7dfc: jb 0x140df7de0
0xdf7dfe: jmp 0x140df7e40
0xdf7e00: call 0x14035f1f0
0xdf7e05: mov eax, dword ptr [r12 + 8]
0xdf7e0a: dec eax
0xdf7e0c: cmp r14d, eax
0xdf7e0f: jae 0x140df7e3b
0xdf7e11: mov rcx, qword ptr [r12]
0xdf7e15: shl rax, 5
0xdf7e19: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7e1e: vmovups ymmword ptr [r15 + rcx], ymm0
0xdf7e24: mov ecx, dword ptr [r12 + 8]
0xdf7e29: dec ecx
0xdf7e2b: shl rcx, 5
0xdf7e2f: add rcx, qword ptr [r12]
0xdf7e33: vzeroupper 
0xdf7e36: call 0x14035f1f0
0xdf7e3b: dec dword ptr [r12 + 8]
0xdf7e40: mov rcx, qword ptr [rsi + 0x2f0]
0xdf7e47: add rcx, 0x40
0xdf7e4b: lea r8, [rip + 0x9c7e]
0xdf7e52: mov rdx, rbx
0xdf7e55: call 0x140763d30
0xdf7e5a: mov r12, qword ptr [rsi + 0x270]
0xdf7e61: mov edx, dword ptr [r12 + 0x48]
0xdf7e66: mov r14d, edi
0xdf7e69: test edx, edx
0xdf7e6b: je 0x140df7ee2
0xdf7e6d: mov r8, qword ptr [r12 + 0x40]
0xdf7e72: lea rax, [rip + 0x9c77]
0xdf7e79: nop dword ptr [rax]
0xdf7e80: mov r15d, r14d
0xdf7e83: shl r15, 5
0xdf7e87: lea rcx, [r8 + r15]
0xdf7e8b: cmp rbx, qword ptr [rcx]
0xdf7e8e: jne 0x140df7e96
0xdf7e90: cmp rax, qword ptr [rcx + 8]
0xdf7e94: je 0x140df7ea0
0xdf7e96: inc r14d
0xdf7e99: cmp r14d, edx
0xdf7e9c: jb 0x140df7e80
0xdf7e9e: jmp 0x140df7ee2
0xdf7ea0: call 0x14035f1f0
0xdf7ea5: mov eax, dword ptr [r12 + 0x48]
0xdf7eaa: dec eax
0xdf7eac: cmp r14d, eax
0xdf7eaf: jae 0x140df7edd
0xdf7eb1: mov rcx, qword ptr [r12 + 0x40]
0xdf7eb6: shl rax, 5
0xdf7eba: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7ebf: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7ec5: mov ecx, dword ptr [r12 + 0x48]
0xdf7eca: dec ecx
0xdf7ecc: shl rcx, 5
0xdf7ed0: add rcx, qword ptr [r12 + 0x40]
0xdf7ed5: vzeroupper 
0xdf7ed8: call 0x14035f1f0
0xdf7edd: dec dword ptr [r12 + 0x48]
0xdf7ee2: mov rcx, qword ptr [rsi + 0x278]
0xdf7ee9: add rcx, 0x40
0xdf7eed: lea r8, [rip + 0x9c0c]
0xdf7ef4: mov rdx, rbx
0xdf7ef7: call 0x140763d30
0xdf7efc: mov r12, qword ptr [rsi + 0x6f8]
0xdf7f03: mov edx, dword ptr [r12 + 0x48]
0xdf7f08: mov r14d, edi
0xdf7f0b: test edx, edx
0xdf7f0d: je 0x140df7f82
0xdf7f0f: mov r8, qword ptr [r12 + 0x40]
0xdf7f14: lea rax, [rip + 0x9bf5]
0xdf7f1b: nop dword ptr [rax + rax]
0xdf7f20: mov r15d, r14d
0xdf7f23: shl r15, 5
0xdf7f27: lea rcx, [r8 + r15]
0xdf7f2b: cmp rbx, qword ptr [rcx]
0xdf7f2e: jne 0x140df7f36
0xdf7f30: cmp rax, qword ptr [rcx + 8]
0xdf7f34: je 0x140df7f40
0xdf7f36: inc r14d
0xdf7f39: cmp r14d, edx
0xdf7f3c: jb 0x140df7f20
0xdf7f3e: jmp 0x140df7f82
0xdf7f40: call 0x14035f1f0
0xdf7f45: mov eax, dword ptr [r12 + 0x48]
0xdf7f4a: dec eax
0xdf7f4c: cmp r14d, eax
0xdf7f4f: jae 0x140df7f7d
0xdf7f51: mov rcx, qword ptr [r12 + 0x40]
0xdf7f56: shl rax, 5
0xdf7f5a: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7f5f: vmovups ymmword ptr [rcx + r15], ymm0
0xdf7f65: mov ecx, dword ptr [r12 + 0x48]
0xdf7f6a: dec ecx
0xdf7f6c: shl rcx, 5
0xdf7f70: add rcx, qword ptr [r12 + 0x40]
0xdf7f75: vzeroupper 
0xdf7f78: call 0x14035f1f0
0xdf7f7d: dec dword ptr [r12 + 0x48]
0xdf7f82: mov r15, qword ptr [rsi + 0x178]
0xdf7f89: add r15, 0x40
0xdf7f8d: mov edx, dword ptr [r15 + 8]
0xdf7f91: test edx, edx
0xdf7f93: je 0x140df7ff8
0xdf7f95: mov r8, qword ptr [r15]
0xdf7f98: lea rax, [rip + 0x9b81]
0xdf7f9f: nop 
0xdf7fa0: mov r14d, edi
0xdf7fa3: shl r14, 5
0xdf7fa7: lea rcx, [r8 + r14]
0xdf7fab: cmp rbx, qword ptr [rcx]
0xdf7fae: jne 0x140df7fb6
0xdf7fb0: cmp rax, qword ptr [rcx + 8]
0xdf7fb4: je 0x140df7fbe
0xdf7fb6: inc edi
0xdf7fb8: cmp edi, edx
0xdf7fba: jb 0x140df7fa0
0xdf7fbc: jmp 0x140df7ff8
0xdf7fbe: call 0x14035f1f0
0xdf7fc3: mov eax, dword ptr [r15 + 8]
0xdf7fc7: dec eax
0xdf7fc9: cmp edi, eax
0xdf7fcb: jae 0x140df7ff4
0xdf7fcd: mov rcx, qword ptr [r15]
0xdf7fd0: shl rax, 5
0xdf7fd4: vmovups ymm0, ymmword ptr [rax + rcx]
0xdf7fd9: vmovups ymmword ptr [rcx + r14], ymm0
0xdf7fdf: mov ecx, dword ptr [r15 + 8]
0xdf7fe3: dec ecx
0xdf7fe5: shl rcx, 5
0xdf7fe9: add rcx, qword ptr [r15]
0xdf7fec: vzeroupper 
0xdf7fef: call 0x14035f1f0
0xdf7ff4: dec dword ptr [r15 + 8]
0xdf7ff8: mov rcx, qword ptr [rsi + 0x180]
0xdf7fff: add rcx, 0x40
0xdf8003: lea r8, [rip + 0x9b66]
0xdf800a: mov rdx, rbx
0xdf800d: call 0x140763d30
0xdf8012: mov rcx, qword ptr [rsi + 0x188]
0xdf8019: add rcx, 0x40
0xdf801d: lea r8, [rip + 0x9b5c]
0xdf8024: mov rdx, rbx
0xdf8027: call 0x140763d30
0xdf802c: mov rcx, qword ptr [rsi + 0x450]
0xdf8033: add rcx, 0x40
0xdf8037: lea r8, [rip + 0x9b52]
0xdf803e: mov rdx, rbx
0xdf8041: call 0x140763d30
0xdf8046: mov rcx, qword ptr [rsi + 0x6c8]
0xdf804d: add rcx, 0x40
0xdf8051: lea r8, [rip + 0x9b48]
0xdf8058: mov rdx, rbx
0xdf805b: call 0x140763d30
0xdf8060: mov rcx, qword ptr [rsi + 0x6d0]
0xdf8067: add rcx, 0x40
0xdf806b: lea r8, [rip + 0x9b3e]
0xdf8072: mov rdx, rbx
0xdf8075: call 0x140763d30
0xdf807a: mov rcx, qword ptr [rsi + 0x6d8]
0xdf8081: add rcx, 0x40
0xdf8085: lea r8, [rip + 0x9b44]
0xdf808c: mov rdx, rbx
0xdf808f: call 0x140763d30
0xdf8094: mov rcx, qword ptr [rsi + 0x6e0]
0xdf809b: add rcx, 0x40
0xdf809f: mov rdx, rbx
0xdf80a2: call 0x140e006b0
0xdf80a7: mov rcx, qword ptr [rsi + 0x120]
0xdf80ae: add rcx, 0x40
0xdf80b2: lea r8, [rip + 0x9b47]
0xdf80b9: mov rdx, rbx
0xdf80bc: call 0x140763d30
0xdf80c1: mov rcx, qword ptr [rsi + 0x128]
0xdf80c8: add rcx, 0x40
0xdf80cc: lea r8, [rip + 0x9b3d]
0xdf80d3: mov rdx, rbx
0xdf80d6: call 0x140763d30
0xdf80db: mov rcx, qword ptr [rsi + 0x148]
0xdf80e2: add rcx, 0x40
0xdf80e6: lea r8, [rip + 0x9b33]
0xdf80ed: mov rdx, rbx
0xdf80f0: call 0x140763d30
0xdf80f5: mov rcx, qword ptr [rsi + 0xb60]
0xdf80fc: add rcx, 0x40
0xdf8100: lea r8, [rip + 0x9b29]
0xdf8107: mov rdx, rbx
0xdf810a: call 0x140763d30
0xdf810f: mov rcx, qword ptr [rsi + 0xad0]
0xdf8116: add rcx, 0x40
0xdf811a: mov rdx, rbx
0xdf811d: call 0x140e009a0
0xdf8122: lea r11, [rsp + 0x120]
0xdf812a: mov rbx, qword ptr [r11 + 0x30]
0xdf812e: mov rsi, qword ptr [r11 + 0x38]
0xdf8132: mov rdi, qword ptr [r11 + 0x48]
0xdf8136: mov rsp, r11
0xdf8139: pop r15
0xdf813b: pop r14
0xdf813d: pop r13
0xdf813f: pop r12
0xdf8141: pop rbp
0xdf8142: ret 
target=0xdf88c0 reference=0xe016de return=0xe016e3 function=14685872
