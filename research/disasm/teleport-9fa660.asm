0x9fa660: mov qword ptr [rsp + 0x20], r9
0x9fa665: mov qword ptr [rsp + 0x18], r8
0x9fa66a: mov qword ptr [rsp + 0x10], rdx
0x9fa66f: mov qword ptr [rsp + 8], rcx
0x9fa674: push rbp
0x9fa675: push rbx
0x9fa676: push rsi
0x9fa677: push rdi
0x9fa678: push r12
0x9fa67a: push r13
0x9fa67c: push r14
0x9fa67e: push r15
0x9fa680: lea rbp, [rsp - 0x5e28]
0x9fa688: mov eax, 0x5f28
0x9fa68d: call 0x1448962c0
0x9fa692: sub rsp, rax
0x9fa695: mov rsi, r8
0x9fa698: mov rdi, rdx
0x9fa69b: xor r14d, r14d
0x9fa69e: mov dword ptr [rsp + 0x78], r14d
0x9fa6a3: mov rax, qword ptr [rcx + 8]
0x9fa6a7: mov qword ptr [rbp - 0x80], rax
0x9fa6ab: mov rax, qword ptr [rip + 0x636eade]
0x9fa6b2: mov r9, qword ptr [rax + 0xc8]
0x9fa6b9: mov rbx, qword ptr [r9]
0x9fa6bc: mov r8b, 1
0x9fa6bf: mov rdx, qword ptr [rbx + 8]
0x9fa6c3: lea rcx, [rsp + 0x48]
0x9fa6c8: call 0x140393650
0x9fa6cd: nop 
0x9fa6ce: mov dword ptr [rbx + 0xa8], r14d
0x9fa6d5: mov rbx, qword ptr [rsp + 0x48]
0x9fa6da: mov rax, qword ptr [rbx]
0x9fa6dd: xor edx, edx
0x9fa6df: mov rcx, rbx
0x9fa6e2: call qword ptr [rax + 0x20]
0x9fa6e5: cmp byte ptr [rsp + 0x50], 1
0x9fa6ea: jne 0x1409fa71a
0x9fa6ec: mov eax, 0xffffffff
0x9fa6f1: lock xadd dword ptr [rbx + 8], eax
0x9fa6f6: cmp eax, 1
0x9fa6f9: jne 0x1409fa70d
0x9fa6fb: test dword ptr [rbx + 0xc], 0x40000000
0x9fa702: je 0x1409fa71a
0x9fa704: mov rax, qword ptr [rbx]
0x9fa707: mov rcx, rbx
0x9fa70a: call qword ptr [rax + 0x40]
0x9fa70d: test dword ptr [rbx + 0xc], 0x40000000
0x9fa714: je 0x1409fa71a
0x9fa716: lock dec dword ptr [rbx + 0xc]
0x9fa71a: mov edx, dword ptr [rsi]
0x9fa71c: lea rcx, [rsp + 0x40]
0x9fa721: call 0x140780350
0x9fa726: mov eax, 0xffff
0x9fa72b: cmp ax, word ptr [rsp + 0x40]
0x9fa730: jne 0x1409fa742
0x9fa732: mov eax, dword ptr [rip + 0x62eaaa0]
0x9fa738: mov dword ptr [rdi], eax
0x9fa73a: mov rax, rdi
0x9fa73d: jmp 0x1409facb5
0x9fa742: lea rax, [rbp + 0x60]
0x9fa746: mov qword ptr [rbp + 0x50], rax
0x9fa74a: mov dword ptr [rbp + 0x58], r14d
0x9fa74e: mov dword ptr [rbp + 0x5c], 0xbb8
0x9fa755: lea rdx, [rbp + 0x50]
0x9fa759: mov rcx, qword ptr [rip + 0x636ea30]
0x9fa760: mov rcx, qword ptr [rcx + 0x30]
0x9fa764: call 0x1408aed50
0x9fa769: lea rdx, [rbp - 0x70]
0x9fa76d: mov rcx, qword ptr [rip + 0x636ea1c]
0x9fa774: mov rcx, qword ptr [rcx + 0x30]
0x9fa778: call 0x1408b4700
0x9fa77d: nop 
0x9fa77e: mov r12, r14
0x9fa781: cmp byte ptr [rbp - 0x60], r12b
0x9fa785: cmovne r12, qword ptr [rbp - 0x68]
0x9fa78a: mov r14, qword ptr [rbp + 0x50]
0x9fa78e: mov eax, dword ptr [rbp + 0x58]
0x9fa791: lea r15, [r14 + rax*8]
0x9fa795: lea rcx, [rip + 0x4d2b6ac]
0x9fa79c: mov r13d, 1
0x9fa7a2: cmp r14, r15
0x9fa7a5: je 0x1409fa931
0x9fa7ab: lea rbx, [rip + 0x4b7908e]
0x9fa7b2: mov rdi, qword ptr [r14]
0x9fa7b5: test rdi, rdi
0x9fa7b8: je 0x1409fa7d2
0x9fa7ba: mov rcx, rdi
0x9fa7bd: call 0x1414343a0
0x9fa7c2: lea rcx, [rip + 0x4d2b67f]
0x9fa7c9: test al, al
0x9fa7cb: je 0x1409fa7d2
0x9fa7cd: mov sil, 1
0x9fa7d0: jmp 0x1409fa7d5
0x9fa7d2: xor sil, sil
0x9fa7d5: mov qword ptr [rsp + 0x48], rcx
0x9fa7da: mov qword ptr [rsp + 0x50], rdi
0x9fa7df: mov byte ptr [rsp + 0x58], sil
0x9fa7e4: mov byte ptr [rsp + 0x59], 0
0x9fa7e9: mov qword ptr [rsp + 0x60], 0
0x9fa7f2: mov qword ptr [rsp + 0x48], rbx
0x9fa7f7: mov byte ptr [rsp + 0x59], 0
0x9fa7fc: mov rax, qword ptr [rdi + 0x88]
0x9fa803: cmp byte ptr [rax + 1], 0
0x9fa807: jne 0x1409fa835
0x9fa809: cmp rdi, r12
0x9fa80c: jne 0x1409fa818
0x9fa80e: mov qword ptr [rsp + 0x48], rbx
0x9fa813: jmp 0x1409fa8e7
0x9fa818: mov r9d, dword ptr [rip + 0x62e1119]
0x9fa81f: mov r8b, 0x13
0x9fa822: lea rdx, [rbp - 0x78]
0x9fa826: mov rcx, rdi
0x9fa829: call 0x142068340
0x9fa82e: lea rcx, [rip + 0x4d2b613]
0x9fa835: mov rax, qword ptr [rdi + 0x88]
0x9fa83c: cmp byte ptr [rax + 1], 1
0x9fa840: jne 0x1409fa855
0x9fa842: cmp byte ptr [rdi + 0x96], 0
0x9fa849: je 0x1409fa855
0x9fa84b: mov qword ptr [rsp + 0x48], rbx
0x9fa850: jmp 0x1409fa8e7
0x9fa855: mov rax, qword ptr [rbp - 0x80]
0x9fa859: mov rbx, qword ptr [rax + 0xa0]
0x9fa860: mov rax, qword ptr [rdi]
0x9fa863: mov rcx, rdi
0x9fa866: call qword ptr [rax + 0x160]
0x9fa86c: cmp rax, rbx
0x9fa86f: jne 0x1409fa89a
0x9fa871: mov rax, qword ptr [rdi + 0x68]
0x9fa875: mov rcx, qword ptr [rax + 0x20]
0x9fa879: add rcx, 0x30
0x9fa87d: call 0x140389570
0x9fa882: cmp word ptr [rax + 0x104], 0
0x9fa88a: je 0x1409fa89a
0x9fa88c: lea rbx, [rip + 0x4b78fad]
0x9fa893: mov qword ptr [rsp + 0x48], rbx
0x9fa898: jmp 0x1409fa8e0
0x9fa89a: mov rax, qword ptr [rdi + 0x88]
0x9fa8a1: movzx ecx, byte ptr [rax + 1]
0x9fa8a5: cmp cl, 8
0x9fa8a8: je 0x1409fa8d4
0x9fa8aa: cmp cl, 9
0x9fa8ad: je 0x1409fa8d4
0x9fa8af: mov r9d, dword ptr [rip + 0x62e1082]
0x9fa8b6: mov r8b, 0x13
0x9fa8b9: lea rdx, [rbp - 0x74]
0x9fa8bd: mov rcx, rdi
0x9fa8c0: call 0x142068340
0x9fa8c5: nop 
0x9fa8c6: lea rbx, [rip + 0x4b78f73]
0x9fa8cd: mov qword ptr [rsp + 0x48], rbx
0x9fa8d2: jmp 0x1409fa8e0
0x9fa8d4: lea rbx, [rip + 0x4b78f65]
0x9fa8db: mov qword ptr [rsp + 0x48], rbx
0x9fa8e0: lea rcx, [rip + 0x4d2b561]
0x9fa8e7: mov qword ptr [rsp + 0x48], rcx
0x9fa8ec: test sil, sil
0x9fa8ef: je 0x1409fa91d
0x9fa8f1: mov rax, qword ptr [rdi]
0x9fa8f4: mov rcx, rdi
0x9fa8f7: call qword ptr [rax + 8]
0x9fa8fa: test al, al
0x9fa8fc: je 0x1409fa911
0x9fa8fe: xor eax, eax
0x9fa900: lock cmpxchg byte ptr [rdi + 0x4b], r13b
0x9fa906: jne 0x1409fa911
0x9fa908: mov rax, qword ptr [rdi]
0x9fa90b: mov rcx, rdi
0x9fa90e: call qword ptr [rax + 0x10]
0x9fa911: mov byte ptr [rsp + 0x58], 0
0x9fa916: lea rcx, [rip + 0x4d2b52b]
0x9fa91d: add r14, 8
0x9fa921: cmp r14, r15
0x9fa924: jne 0x1409fa7b2
0x9fa92a: mov rsi, qword ptr [rbp + 0x5e80]
0x9fa931: mov rax, qword ptr [rip + 0x636e858]
0x9fa938: mov rdx, qword ptr [rax + 0x20]
0x9fa93c: mov rax, qword ptr [rax + 0xc8]
0x9fa943: mov rcx, qword ptr [rax]
0x9fa946: mov rdx, qword ptr [rdx + 0x1118]
0x9fa94d: mov rcx, qword ptr [rcx + 0x238]
0x9fa954: call 0x1406e2920
0x9fa959: mov rax, qword ptr [rip + 0x636e830]
0x9fa960: mov rax, qword ptr [rax + 0x60]
0x9fa964: mov qword ptr [rbp + 0x5e80], rax
0x9fa96b: mov r14, qword ptr [rbp + 0x5e90]
0x9fa972: mov ebx, dword ptr [r14]
0x9fa975: mov rdi, qword ptr [rbp + 0x5e88]
0x9fa97c: mov edi, dword ptr [rdi]
0x9fa97e: mov esi, dword ptr [rsi]
0x9fa980: lea rax, [rbp - 0x40]
0x9fa984: mov qword ptr [rbp - 0x50], rax
0x9fa988: mov dword ptr [rbp - 0x48], 0
0x9fa98f: mov dword ptr [rbp - 0x44], 3
0x9fa996: mov rax, qword ptr [rbp + 0x5e98]
0x9fa99d: mov r15, qword ptr [rax]
0x9fa9a0: mov eax, dword ptr [rax + 8]
0x9fa9a3: lea r12, [rax + rax*2]
0x9fa9a7: shl r12, 4
0x9fa9ab: add r12, r15
0x9fa9ae: mov ecx, dword ptr [rbp - 0x48]
0x9fa9b1: cmp r15, r12
0x9fa9b4: je 0x1409faa47
0x9fa9ba: lea r14, [r15 + 8]
0x9fa9be: nop 
0x9fa9c0: mov eax, dword ptr [r15]
0x9fa9c3: mov dword ptr [rsp + 0x48], eax
0x9fa9c7: mov eax, dword ptr [r14 - 4]
0x9fa9cb: mov dword ptr [rsp + 0x4c], eax
0x9fa9cf: vmovups ymm0, ymmword ptr [r14]
0x9fa9d4: vmovups ymmword ptr [rsp + 0x50], ymm0
0x9fa9da: vmovsd xmm1, qword ptr [r14 + 0x20]
0x9fa9e0: vmovsd qword ptr [rsp + 0x70], xmm1
0x9fa9e6: cmp ecx, dword ptr [rbp - 0x44]
0x9fa9e9: jb 0x1409faa07
0x9fa9eb: mov r9d, 0x30
0x9fa9f1: xor r8d, r8d
0x9fa9f4: lea rdx, [rbp - 0x40]
0x9fa9f8: lea rcx, [rbp - 0x50]
0x9fa9fc: vzeroupper 
0x9fa9ff: call 0x140392380
0x9faa04: mov ecx, dword ptr [rbp - 0x48]
0x9faa07: mov eax, ecx
0x9faa09: lea rcx, [rax + rax*2]
0x9faa0d: add rcx, rcx
0x9faa10: mov rax, qword ptr [rbp - 0x50]
0x9faa14: vmovups ymm0, ymmword ptr [rsp + 0x48]
0x9faa1a: vmovups ymmword ptr [rax + rcx*8], ymm0
0x9faa1f: vmovups xmm1, xmmword ptr [rsp + 0x68]
0x9faa25: vmovups xmmword ptr [rax + rcx*8 + 0x20], xmm1
0x9faa2b: mov ecx, dword ptr [rbp - 0x48]
0x9faa2e: inc ecx
0x9faa30: mov dword ptr [rbp - 0x48], ecx
0x9faa33: add r15, 0x30
0x9faa37: add r14, 0x30
0x9faa3b: cmp r15, r12
0x9faa3e: jne 0x1409fa9c0
0x9faa40: mov r14, qword ptr [rbp + 0x5e90]
0x9faa47: mov rax, qword ptr [rbp - 0x50]
0x9faa4b: mov qword ptr [rsp + 0x48], rax
0x9faa50: mov dword ptr [rsp + 0x50], ecx
0x9faa54: lea rax, [rsp + 0x48]
0x9faa59: mov qword ptr [rsp + 0x38], rax
0x9faa5e: mov dword ptr [rsp + 0x30], ebx
0x9faa62: mov byte ptr [rsp + 0x28], 0
0x9faa67: mov byte ptr [rsp + 0x20], 0
0x9faa6c: mov r9b, 1
0x9faa6f: mov r8d, edi
0x9faa72: mov edx, esi
0x9faa74: mov rcx, qword ptr [rbp + 0x5e80]
0x9faa7b: vzeroupper 
0x9faa7e: call 0x1407792c0
0x9faa83: nop 
0x9faa84: lea rax, [rbp - 0x40]
0x9faa88: mov r15d, 0x1fd
0x9faa8e: mov rcx, qword ptr [rbp - 0x50]
0x9faa92: cmp rcx, rax
0x9faa95: je 0x1409faabb
0x9faa97: test rcx, rcx
0x9faa9a: je 0x1409faabb
0x9faa9c: mov rax, qword ptr gs:[0x58]
0x9faaa5: mov rdx, qword ptr [rax]
0x9faaa8: cmp byte ptr [r15 + rdx], 0
0x9faaad: je 0x1409faab6
0x9faaaf: call 0x1447f03bc
0x9faab4: jmp 0x1409faabb
0x9faab6: call 0x1447f02bc
0x9faabb: lea rsi, [rip - 0x9faac2]
0x9faac2: mov rbx, qword ptr [rbp - 0x80]
0x9faac6: test byte ptr [rbx + 0x5e], 0x10
0x9faaca: je 0x1409fab47
0x9faacc: mov rax, qword ptr [rbp + 0x5e70]
0x9faad3: mov rax, qword ptr [rax + 8]
0x9faad7: mov rcx, qword ptr [rax + 0x88]
0x9faade: movzx edx, byte ptr [rcx + 1]
0x9faae2: lea eax, [rdx - 3]
0x9faae5: cmp eax, 6
0x9faae8: ja 0x1409faaf8
0x9faaea: cdqe 
0x9faaec: mov ecx, dword ptr [rsi + rax*4 + 0x9faccc]
0x9faaf3: add rcx, rsi
0x9faaf6: jmp rcx
0x9faaf8: cmp dl, 1
0x9faafb: jne 0x1409fab47
0x9faafd: mov byte ptr [rbp + 0x5e80], 0
0x9fab04: mov rax, qword ptr [rbx + 0x68]
0x9fab08: mov rcx, qword ptr [rax + 0x40]
0x9fab0c: mov rax, qword ptr [rcx + 0x130]
0x9fab13: mov rcx, qword ptr [rax + 8]
0x9fab17: mov rax, qword ptr [rcx + 8]
0x9fab1b: lea rcx, [rax - 0x28]
0x9fab1f: test rax, rax
0x9fab22: mov r12d, 0
0x9fab28: cmove rcx, r12
0x9fab2c: call 0x14041f760
0x9fab31: test rax, rax
0x9fab34: je 0x1409fab4a
0x9fab36: lea rdx, [rbp + 0x5e80]
0x9fab3d: mov rcx, rax
0x9fab40: call 0x140466130
0x9fab45: jmp 0x1409fab4a
0x9fab47: xor r12d, r12d
0x9fab4a: mov rax, qword ptr [rbx + 0x68]
0x9fab4e: mov rcx, qword ptr [rax + 0x20]
0x9fab52: add rcx, 0x30
0x9fab56: call 0x140389570
0x9fab5b: mov eax, dword ptr [rax]
0x9fab5d: cmp dword ptr [r14], eax
0x9fab60: je 0x1409fac62
0x9fab66: mov rax, qword ptr [rbx + 0xa0]
0x9fab6d: mov rbx, qword ptr [rax + 0xd8]
0x9fab74: test rbx, rbx
0x9fab77: je 0x1409fab98
0x9fab79: mov edx, 4
0x9fab7e: mov r8d, 0x10
0x9fab84: mov rax, qword ptr [rbx]
0x9fab87: mov rcx, rbx
0x9fab8a: call qword ptr [rax + 0xc0]
0x9fab90: test al, al
0x9fab92: je 0x1409fab98
0x9fab94: mov al, 1
0x9fab96: jmp 0x1409fab9a
0x9fab98: xor al, al
0x9fab9a: lea rdi, [rip + 0x4d2b2a7]
0x9faba1: mov qword ptr [rsp + 0x48], rdi
0x9faba6: mov qword ptr [rsp + 0x50], rbx
0x9fabab: mov byte ptr [rsp + 0x58], al
0x9fabaf: mov byte ptr [rsp + 0x59], 0
0x9fabb4: mov qword ptr [rsp + 0x60], r12
0x9fabb9: lea rcx, [rip + 0x4b78ec8]
0x9fabc0: mov qword ptr [rsp + 0x48], rcx
0x9fabc5: lea rcx, [rip + 0x4b78e9c]
0x9fabcc: mov qword ptr [rsp + 0x48], rcx
0x9fabd1: mov dword ptr [rsp + 0x78], r13d
0x9fabd6: test al, al
0x9fabd8: je 0x1409fac48
0x9fabda: test byte ptr [rbx + 0x5e], 0x10
0x9fabde: je 0x1409fac48
0x9fabe0: mov rax, qword ptr [rbx + 0x88]
0x9fabe7: movzx edx, byte ptr [rax + 1]
0x9fabeb: lea eax, [rdx - 3]
0x9fabee: cmp eax, 6
0x9fabf1: ja 0x1409fac01
0x9fabf3: cdqe 
0x9fabf5: mov ecx, dword ptr [rsi + rax*4 + 0x9face8]
0x9fabfc: add rcx, rsi
0x9fabff: jmp rcx
0x9fac01: cmp dl, 1
0x9fac04: jne 0x1409fac48
0x9fac06: mov byte ptr [rbp + 0x5e80], 0
0x9fac0d: mov rax, qword ptr [rbx + 0x68]
0x9fac11: mov rcx, qword ptr [rax + 0x40]
0x9fac15: mov rax, qword ptr [rcx + 0x130]
0x9fac1c: mov rcx, qword ptr [rax + 8]
0x9fac20: mov rax, qword ptr [rcx + 8]
0x9fac24: lea rcx, [rax - 0x28]
0x9fac28: test rax, rax
0x9fac2b: cmove rcx, r12
0x9fac2f: call 0x14041f760
0x9fac34: test rax, rax
0x9fac37: je 0x1409fac48
0x9fac39: lea rdx, [rbp + 0x5e80]
0x9fac40: mov rcx, rax
0x9fac43: call 0x140466130
0x9fac48: and r13d, 0xfffffffe
0x9fac4c: mov dword ptr [rsp + 0x78], r13d
0x9fac51: mov qword ptr [rsp + 0x48], rdi
0x9fac56: lea rcx, [rsp + 0x48]
0x9fac5b: call 0x141434880
0x9fac60: jmp 0x1409fac69
0x9fac62: lea rdi, [rip + 0x4d2b1df]
0x9fac69: mov rbx, qword ptr [rbp + 0x5e78]
0x9fac70: mov dword ptr [rbx], r12d
0x9fac73: mov qword ptr [rbp - 0x70], rdi
0x9fac77: lea rcx, [rbp - 0x70]
0x9fac7b: call 0x141434880
0x9fac80: nop 
0x9fac81: lea rax, [rbp + 0x60]
0x9fac85: mov rcx, qword ptr [rbp + 0x50]
0x9fac89: cmp rcx, rax
0x9fac8c: je 0x1409facb2
0x9fac8e: test rcx, rcx
0x9fac91: je 0x1409facb2
0x9fac93: mov rax, qword ptr gs:[0x58]
0x9fac9c: mov rdx, qword ptr [rax]
0x9fac9f: cmp byte ptr [r15 + rdx], 0
0x9faca4: je 0x1409facad
0x9faca6: call 0x1447f03bc
0x9facab: jmp 0x1409facb2
0x9facad: call 0x1447f02bc
0x9facb2: mov rax, rbx
0x9facb5: add rsp, 0x5f28
0x9facbc: pop r15
0x9facbe: pop r14
0x9facc0: pop r13
0x9facc2: pop r12
0x9facc4: pop rdi
0x9facc5: pop rsi
0x9facc6: pop rbx
0x9facc7: pop rbp
0x9facc8: ret 
0x9facc9: nop dword ptr [rax]
0x9faccc: std 
0x9faccd: stosb byte ptr [rdi], al
0x9facce: lahf 
0x9faccf: add ch, bh
0x9facd1: stosb byte ptr [rdi], al
0x9facd2: lahf 
0x9facd3: add ch, bh
0x9facd5: stosb byte ptr [rdi], al
0x9facd6: lahf 
0x9facd7: add ch, bh
0x9facd9: stosb byte ptr [rdi], al
0x9facda: lahf 
0x9facdb: add al, bh
0x9facdd: stosb byte ptr [rdi], al
0x9facde: lahf 
0x9facdf: add ch, bh
0x9face1: stosb byte ptr [rdi], al
0x9face2: lahf 
0x9face3: add ch, bh
0x9face5: stosb byte ptr [rdi], al
0x9face6: lahf 
0x9face7: add byte ptr [rsi], al
0x9face9: lodsb al, byte ptr [rsi]
0x9facea: lahf 
0x9faceb: add byte ptr [rsi], al
0x9faced: lodsb al, byte ptr [rsi]
0x9facee: lahf 
0x9facef: add byte ptr [rsi], al
0x9facf1: lodsb al, byte ptr [rsi]
0x9facf2: lahf 
0x9facf3: add byte ptr [rsi], al
0x9facf5: lodsb al, byte ptr [rsi]
0x9facf6: lahf 
0x9facf7: add byte ptr [rcx], al
0x9facf9: lodsb al, byte ptr [rsi]
0x9facfa: lahf 
0x9facfb: add byte ptr [rsi], al
0x9facfd: lodsb al, byte ptr [rsi]
0x9facfe: lahf 
0x9facff: add byte ptr [rsi], al
0x9fad01: lodsb al, byte ptr [rsi]
0x9fad02: lahf 