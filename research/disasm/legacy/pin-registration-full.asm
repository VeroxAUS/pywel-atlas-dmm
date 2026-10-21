0xdb85a0: push rbp
0xdb85a2: push rdi
0xdb85a3: push r14
0xdb85a5: sub rsp, 0x40
0xdb85a9: mov rbp, rcx
0xdb85ac: mov qword ptr [rsp + 0x60], rbx
0xdb85b1: mov ebx, dword ptr [rdx + 0x1c0]
0xdb85b7: lea rcx, [rdx + 0xde]
0xdb85be: movzx eax, word ptr [rcx]
0xdb85c1: movzx r14d, r8b
0xdb85c5: mov word ptr [rsp + 0x68], ax
0xdb85ca: mov rdi, rdx
0xdb85cd: call 0x140537250
0xdb85d2: vmovss xmm1, dword ptr [rdi + 0x100]
0xdb85da: cmp byte ptr [rax + 0xb5], 0
0xdb85e1: je 0x140db869d
0xdb85e7: vxorps xmm0, xmm0, xmm0
0xdb85eb: vucomiss xmm1, xmm0
0xdb85ef: jp 0x140db85f3
0xdb85f1: je 0x140db8653
0xdb85f3: lea rcx, [rsp + 0x68]
0xdb85f8: call 0x140537250
0xdb85fd: vmovss xmm0, dword ptr [rax + 0xa4]
0xdb8605: vcomiss xmm0, dword ptr [rip + 0x4fbaaa7]
0xdb860d: jbe 0x140db8653
0xdb860f: vmovss xmm0, dword ptr [rdi + 0x100]
0xdb8617: vmovaps xmmword ptr [rsp + 0x30], xmm6
0xdb861d: vmovaps xmmword ptr [rsp + 0x20], xmm7
0xdb8623: vmovss xmm7, dword ptr [rip + 0x5ef354d]
0xdb862b: lea rcx, [rsp + 0x68]
0xdb8630: vaddss xmm6, xmm0, xmm0
0xdb8634: call 0x140537250
0xdb8639: vmulss xmm0, xmm7, dword ptr [rax + 0xa4]
0xdb8641: vmovaps xmm7, xmmword ptr [rsp + 0x20]
0xdb8647: vcomiss xmm6, xmm0
0xdb864b: vmovaps xmm6, xmmword ptr [rsp + 0x30]
0xdb8651: ja 0x140db869d
0xdb8653: mov qword ptr [rsp + 0x70], rsi
0xdb8658: lea rsi, [rbp + 0x4f8]
0xdb865f: mov ecx, dword ptr [rsi + 8]
0xdb8662: mov eax, dword ptr [rsi + 0xc]
0xdb8665: cmp eax, ecx
0xdb8667: ja 0x140db868b
0xdb8669: lea edx, [rax*2 + 1]
0xdb8670: add edx, eax
0xdb8672: mov eax, 1
0xdb8677: shr edx, 1
0xdb8679: cmp edx, eax
0xdb867b: cmovb edx, eax
0xdb867e: cmp ecx, edx
0xdb8680: cmova edx, ecx
0xdb8683: mov rcx, rsi
0xdb8686: call 0x14035e3f0
0xdb868b: mov ecx, dword ptr [rsi + 8]
0xdb868e: mov rax, qword ptr [rsi]
0xdb8691: mov qword ptr [rax + rcx*8], rdi
0xdb8695: inc dword ptr [rsi + 8]
0xdb8698: mov rsi, qword ptr [rsp + 0x70]
0xdb869d: lea rcx, [rsp + 0x68]
0xdb86a2: call 0x140537250
0xdb86a7: mov rcx, qword ptr [rdi + 8]
0xdb86ab: movzx edx, byte ptr [rax + 0x62]
0xdb86af: call 0x140dec340
0xdb86b4: lea rcx, [rsp + 0x68]
0xdb86b9: call 0x140537250
0xdb86be: cmp dword ptr [rax + 0x2c], 0x43
0xdb86c2: je 0x140db86d4
0xdb86c4: lea rcx, [rsp + 0x68]
0xdb86c9: call 0x140537250
0xdb86ce: cmp dword ptr [rax + 0x2c], 0x42
0xdb86d2: jne 0x140db86e2
0xdb86d4: mov qword ptr [rbp + 0x5b8], rdi
0xdb86db: mov byte ptr [rbp + 0xad0], 1
0xdb86e2: test ebx, ebx
0xdb86e4: mov rbx, qword ptr [rsp + 0x60]
0xdb86e9: je 0x140db86f6
0xdb86eb: mov rdx, rdi
0xdb86ee: mov rcx, rbp
0xdb86f1: call 0x140df0780
0xdb86f6: movzx r8d, r14b
0xdb86fa: mov rdx, rdi
0xdb86fd: mov rcx, rbp
0xdb8700: call 0x140df0320
0xdb8705: mov rdx, rdi
0xdb8708: mov rcx, rbp
0xdb870b: add rsp, 0x40
0xdb870f: pop r14
0xdb8711: pop rdi
0xdb8712: pop rbp
0xdb8713: jmp 0x140dcfe70
0xdb8718: int3 
0xdb8719: int3 
0xdb871a: int3 
0xdb871b: int3 
0xdb871c: int3 
0xdb871d: int3 
0xdb871e: int3 
0xdb871f: int3 
0xdb8720: mov qword ptr [rsp + 8], rbx
0xdb8725: mov qword ptr [rsp + 0x18], rsi
0xdb872a: mov word ptr [rsp + 0x10], dx
0xdb872f: push rbp
0xdb8730: push rdi
0xdb8731: push r12
0xdb8733: push r14
0xdb8735: push r15
0xdb8737: mov rbp, rsp
0xdb873a: sub rsp, 0x80
0xdb8741: mov r14, r8
0xdb8744: mov rsi, rcx
0xdb8747: xor r15d, r15d
0xdb874a: mov dword ptr [rbp - 0x50], r15d
0xdb874e: cmp byte ptr [rip + 0x5ef3c93], r15b
0xdb8755: jne 0x140db875e
0xdb8757: xor al, al
0xdb8759: jmp 0x140db888b
0xdb875e: lea r12, [rip + 0x48b77bb]
0xdb8765: mov qword ptr [rbp - 0x28], r12
0xdb8769: lea rax, [rip + 0x48b77d0]
0xdb8770: mov qword ptr [rbp - 0x28], rax
0xdb8774: mov eax, 0xffff
0xdb8779: mov word ptr [rbp - 0x20], ax
0xdb877d: mov qword ptr [rbp - 0x18], 0xffffffffffffffff
0xdb8785: mov byte ptr [rbp - 0x10], 0x15
0xdb8789: xor eax, eax
0xdb878b: mov dword ptr [rbp - 0xf], eax
0xdb878e: mov word ptr [rbp - 0xb], ax
0xdb8792: mov byte ptr [rbp - 9], al
0xdb8795: mov dword ptr [rbp - 8], r15d
0xdb8799: mov word ptr [rbp - 0x20], dx
0xdb879d: movzx eax, byte ptr [r8 + 8]
0xdb87a2: mov byte ptr [rbp - 0x10], al
0xdb87a5: mov rax, qword ptr [r8]
0xdb87a8: mov qword ptr [rbp - 0x18], rax
0xdb87ac: mov dword ptr [rbp - 8], r9d
0xdb87b0: mov rax, qword ptr [rcx]
0xdb87b3: call qword ptr [rax + 0x110]
0xdb87b9: mov rcx, qword ptr [rax + 0xb0]
0xdb87c0: mov qword ptr [rbp - 0x48], r15
0xdb87c4: mov qword ptr [rbp - 0x40], r15
0xdb87c8: mov qword ptr [rbp - 0x38], r15
0xdb87cc: mov word ptr [rbp - 0x30], 0
0xdb87d2: mov qword ptr [rbp - 0x48], rsi
0xdb87d6: lea rax, [rip + 0x301d3]
0xdb87dd: mov qword ptr [rbp - 0x40], rax
0xdb87e1: mov byte ptr [rbp - 0x30], 0
0xdb87e5: mov ebx, 1
0xdb87ea: mov dword ptr [rbp - 0x50], ebx
0xdb87ed: movzx eax, byte ptr [rbp + 0x50]
0xdb87f1: mov byte ptr [rsp + 0x20], al
0xdb87f5: lea r9, [rbp - 0x48]
0xdb87f9: lea r8, [rbp - 0x28]
0xdb87fd: lea rdx, [rip + 0x5f177dc]
0xdb8804: call 0x143d20850
0xdb8809: movzx edi, al
0xdb880c: and ebx, 0xfffffffe
0xdb880f: mov dword ptr [rbp - 0x50], ebx
0xdb8812: cmp byte ptr [rbp - 0x2f], 0
0xdb8816: je 0x140db884a
0xdb8818: mov rcx, qword ptr [rbp - 0x48]
0xdb881c: test rcx, rcx
0xdb881f: je 0x140db884a
0xdb8821: mov r8d, 0x1fd
0xdb8827: mov rax, qword ptr gs:[0x58]
0xdb8830: mov rdx, qword ptr [rax]
0xdb8833: cmp byte ptr [r8 + rdx], 0
0xdb8838: je 0x140db8841
0xdb883a: call 0x1447f03bc
0xdb883f: jmp 0x140db8846
0xdb8841: call 0x1447f02bc
0xdb8846: mov qword ptr [rbp - 0x48], r15
0xdb884a: mov byte ptr [rbp - 0x2f], 0
0xdb884e: mov qword ptr [rbp - 0x48], r15
0xdb8852: mov qword ptr [rbp - 0x40], r15
0xdb8856: mov qword ptr [rbp - 0x38], r15
0xdb885a: mov byte ptr [rbp - 0x2f], 0
0xdb885e: lea rcx, [rbp - 0x48]
0xdb8862: call 0x14035f1f0
0xdb8867: test dil, dil
0xdb886a: je 0x140db8883
0xdb886c: lea rcx, [rbp + 0x38]
0xdb8870: call 0x140537250
0xdb8875: mov r8, r14
0xdb8878: mov edx, dword ptr [rax]
0xdb887a: mov rcx, rsi
0xdb887d: call 0x140df5250
0xdb8882: nop 
0xdb8883: mov qword ptr [rbp - 0x28], r12
0xdb8887: movzx eax, dil
0xdb888b: lea r11, [rsp + 0x80]
0xdb8893: mov rbx, qword ptr [r11 + 0x30]
0xdb8897: mov rsi, qword ptr [r11 + 0x40]
0xdb889b: mov rsp, r11
0xdb889e: pop r15
0xdb88a0: pop r14
0xdb88a2: pop r12
0xdb88a4: pop rdi
0xdb88a5: pop rbp
0xdb88a6: ret 
0xdb88a7: int3 
0xdb88a8: int3 
0xdb88a9: int3 
0xdb88aa: int3 
0xdb88ab: int3 
0xdb88ac: int3 
0xdb88ad: int3 
0xdb88ae: int3 
0xdb88af: int3 
0xdb88b0: jmp 0x14aae9e10
