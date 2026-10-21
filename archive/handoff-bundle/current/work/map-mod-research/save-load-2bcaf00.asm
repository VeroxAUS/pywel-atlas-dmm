0x2bcaf00: mov qword ptr [rsp + 0x10], rbx
0x2bcaf05: mov byte ptr [rsp + 0x18], r8b
0x2bcaf0a: push rbp
0x2bcaf0b: push rsi
0x2bcaf0c: push rdi
0x2bcaf0d: push r14
0x2bcaf0f: push r15
0x2bcaf11: lea rbp, [rsp - 0x37]
0x2bcaf16: sub rsp, 0xa0
0x2bcaf1d: mov r14, rdx
0x2bcaf20: mov rdi, rcx
0x2bcaf23: xor esi, esi
0x2bcaf25: mov r15, qword ptr [rcx + 8]
0x2bcaf29: lea rdx, [rbp + 7]
0x2bcaf2d: call 0x142bc4280
0x2bcaf32: nop 
0x2bcaf33: cmp byte ptr [rbp + 0x17], sil
0x2bcaf37: jne 0x142bcaf8e
0x2bcaf39: mov r9d, dword ptr [rip + 0x412bc14]
0x2bcaf40: mov r8b, 0xb
0x2bcaf43: lea rdx, [rbp + 0x67]
0x2bcaf47: mov rcx, r15
0x2bcaf4a: call 0x142068340
0x2bcaf4f: mov eax, dword ptr [rip + 0x412bbff]
0x2bcaf55: mov dword ptr [r14], eax
0x2bcaf58: lea rax, [rip + 0x2d47f01]
0x2bcaf5f: mov qword ptr [rbp + 7], rax
0x2bcaf63: cmp byte ptr [rbp + 0x17], sil
0x2bcaf67: je 0x142bcaf77
0x2bcaf69: mov rcx, qword ptr [rbp + 0x2f]
0x2bcaf6d: mov rax, qword ptr [rcx]
0x2bcaf70: call qword ptr [rax + 0x148]
0x2bcaf76: nop 
0x2bcaf77: lea rax, [rip + 0x29a88c2]
0x2bcaf7e: mov qword ptr [rbp + 7], rax
0x2bcaf82: lea rdi, [rip + 0x2b5aebf]
0x2bcaf89: jmp 0x142bcb2e6
0x2bcaf8e: lea rdx, [rbp - 0x19]
0x2bcaf92: mov rcx, qword ptr [r15 + 0xa0]
0x2bcaf99: call 0x14206ae30
0x2bcaf9e: nop 
0x2bcaf9f: cmp byte ptr [rbp - 9], 0
0x2bcafa3: jne 0x142bcb07e
0x2bcafa9: mov r9d, dword ptr [rip + 0x412bf0c]
0x2bcafb0: mov r8b, 0xb
0x2bcafb3: lea rdx, [rbp + 0x67]
0x2bcafb7: mov rcx, r15
0x2bcafba: call 0x142068340
0x2bcafbf: mov eax, dword ptr [rip + 0x412bef7]
0x2bcafc5: mov dword ptr [r14], eax
0x2bcafc8: lea rdi, [rip + 0x2b5ae79]
0x2bcafcf: mov qword ptr [rbp - 0x19], rdi
0x2bcafd3: cmp byte ptr [rbp - 9], 0
0x2bcafd7: je 0x142bcb04f
0x2bcafd9: cmp byte ptr [rbp - 8], 0
0x2bcafdd: jne 0x142bcafee
0x2bcafdf: mov rcx, qword ptr [rbp - 0x11]
0x2bcafe3: mov rax, qword ptr [rcx]
0x2bcafe6: call qword ptr [rax + 8]
0x2bcafe9: movzx esi, al
0x2bcafec: jmp 0x142bcb02e
0x2bcafee: mov r15, qword ptr [rbp - 0x11]
0x2bcaff2: lea rbx, [r15 + 0x18]
0x2bcaff6: mov qword ptr [rbp + 0x67], rbx
0x2bcaffa: mov rax, qword ptr [rbx]
0x2bcaffd: mov rcx, rbx
0x2bcb000: call qword ptr [rax + 8]
0x2bcb003: nop 
0x2bcb004: dec word ptr [r15 + 0x48]
0x2bcb009: cmp byte ptr [r15 + 0x4a], 0
0x2bcb00e: jne 0x142bcb022
0x2bcb010: lock xadd dword ptr [r15 + 0x10], esi
0x2bcb016: add si, word ptr [r15 + 0x48]
0x2bcb01b: jne 0x142bcb022
0x2bcb01d: mov sil, 1
0x2bcb020: jmp 0x142bcb025
0x2bcb022: xor sil, sil
0x2bcb025: mov rax, qword ptr [rbx]
0x2bcb028: mov rcx, rbx
0x2bcb02b: call qword ptr [rax + 0x10]
0x2bcb02e: test sil, sil
0x2bcb031: je 0x142bcb04b
0x2bcb033: mov rcx, qword ptr [rbp - 0x11]
0x2bcb037: mov edx, 1
0x2bcb03c: xor eax, eax
0x2bcb03e: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x2bcb043: jne 0x142bcb04b
0x2bcb045: mov rax, qword ptr [rcx]
0x2bcb048: call qword ptr [rax + 0x10]
0x2bcb04b: mov byte ptr [rbp - 9], 0
0x2bcb04f: lea rax, [rip + 0x2d47e0a]
0x2bcb056: mov qword ptr [rbp + 7], rax
0x2bcb05a: cmp byte ptr [rbp + 0x17], 0
0x2bcb05e: je 0x142bcb06e
0x2bcb060: mov rcx, qword ptr [rbp + 0x2f]
0x2bcb064: mov rax, qword ptr [rcx]
0x2bcb067: call qword ptr [rax + 0x148]
0x2bcb06d: nop 
0x2bcb06e: lea rax, [rip + 0x29a87cb]
0x2bcb075: mov qword ptr [rbp + 7], rax
0x2bcb079: jmp 0x142bcb2e6
0x2bcb07e: mov rax, qword ptr gs:[0x58]
0x2bcb087: mov rcx, qword ptr [rax]
0x2bcb08a: mov eax, 0x1ec
0x2bcb08f: mov rbx, qword ptr [rip + 0x419e3a2]
0x2bcb096: cmp byte ptr [rax + rcx], 0
0x2bcb09a: cmovne rbx, rsi
0x2bcb09e: call 0x141416b80
0x2bcb0a3: add rax, rbx
0x2bcb0a6: mov qword ptr [rbp + 0x7f], rax
0x2bcb0aa: lea rax, [rbp + 0x7f]
0x2bcb0ae: mov qword ptr [rsp + 0x28], rax
0x2bcb0b3: movzx eax, byte ptr [rbp + 0x77]
0x2bcb0b7: mov byte ptr [rsp + 0x20], al
0x2bcb0bb: mov r9, qword ptr [rbp - 0x11]
0x2bcb0bf: mov r8, qword ptr [rbp + 0xf]
0x2bcb0c3: lea rdx, [rbp + 0x67]
0x2bcb0c7: mov rcx, rdi
0x2bcb0ca: call 0x14219d7f0
0x2bcb0cf: mov eax, dword ptr [rbp + 0x67]
0x2bcb0d2: test eax, eax
0x2bcb0d4: je 0x142bcb193
0x2bcb0da: mov dword ptr [r14], eax
0x2bcb0dd: lea rdi, [rip + 0x2b5ad64]
0x2bcb0e4: mov qword ptr [rbp - 0x19], rdi
0x2bcb0e8: cmp byte ptr [rbp - 9], 0
0x2bcb0ec: je 0x142bcb164
0x2bcb0ee: cmp byte ptr [rbp - 8], 0
0x2bcb0f2: jne 0x142bcb103
0x2bcb0f4: mov rcx, qword ptr [rbp - 0x11]
0x2bcb0f8: mov rax, qword ptr [rcx]
0x2bcb0fb: call qword ptr [rax + 8]
0x2bcb0fe: movzx esi, al
0x2bcb101: jmp 0x142bcb143
0x2bcb103: mov r15, qword ptr [rbp - 0x11]
0x2bcb107: lea rbx, [r15 + 0x18]
0x2bcb10b: mov qword ptr [rbp + 0x67], rbx
0x2bcb10f: mov rax, qword ptr [rbx]
0x2bcb112: mov rcx, rbx
0x2bcb115: call qword ptr [rax + 8]
0x2bcb118: nop 
0x2bcb119: dec word ptr [r15 + 0x48]
0x2bcb11e: cmp byte ptr [r15 + 0x4a], 0
0x2bcb123: jne 0x142bcb137
0x2bcb125: lock xadd dword ptr [r15 + 0x10], esi
0x2bcb12b: add si, word ptr [r15 + 0x48]
0x2bcb130: jne 0x142bcb137
0x2bcb132: mov sil, 1
0x2bcb135: jmp 0x142bcb13a
0x2bcb137: xor sil, sil
0x2bcb13a: mov rax, qword ptr [rbx]
0x2bcb13d: mov rcx, rbx
0x2bcb140: call qword ptr [rax + 0x10]
0x2bcb143: test sil, sil
0x2bcb146: je 0x142bcb160
0x2bcb148: mov rcx, qword ptr [rbp - 0x11]
0x2bcb14c: mov edx, 1
0x2bcb151: xor eax, eax
0x2bcb153: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x2bcb158: jne 0x142bcb160
0x2bcb15a: mov rax, qword ptr [rcx]
0x2bcb15d: call qword ptr [rax + 0x10]
0x2bcb160: mov byte ptr [rbp - 9], 0
0x2bcb164: lea rax, [rip + 0x2d47cf5]
0x2bcb16b: mov qword ptr [rbp + 7], rax
0x2bcb16f: cmp byte ptr [rbp + 0x17], 0
0x2bcb173: je 0x142bcb183
0x2bcb175: mov rcx, qword ptr [rbp + 0x2f]
0x2bcb179: mov rax, qword ptr [rcx]
0x2bcb17c: call qword ptr [rax + 0x148]
0x2bcb182: nop 
0x2bcb183: lea rax, [rip + 0x29a86b6]
0x2bcb18a: mov qword ptr [rbp + 7], rax
0x2bcb18e: jmp 0x142bcb2e6
0x2bcb193: mov rcx, qword ptr [rbp + 0xf]
0x2bcb197: mov rax, qword ptr [rcx]
0x2bcb19a: call qword ptr [rax + 0x48]
0x2bcb19d: mov rcx, rax
0x2bcb1a0: call 0x14287e5c0
0x2bcb1a5: mov rcx, qword ptr [rip + 0x419e4f4]
0x2bcb1ac: mov rax, qword ptr [rcx + 0x30]
0x2bcb1b0: mov byte ptr [rax + 0x61], 0
0x2bcb1b4: mov rbx, qword ptr [rcx + 0x30]
0x2bcb1b8: mov rdi, qword ptr [rbx]
0x2bcb1bb: mov qword ptr [rbp + 0x67], rdi
0x2bcb1bf: mov rax, qword ptr [rdi]
0x2bcb1c2: mov rcx, rdi
0x2bcb1c5: call qword ptr [rax + 8]
0x2bcb1c8: nop 
0x2bcb1c9: mov dword ptr [rbx + 0x64], 0xffffffff
0x2bcb1d0: mov rax, qword ptr [rdi]
0x2bcb1d3: mov rcx, rdi
0x2bcb1d6: call qword ptr [rax + 0x10]
0x2bcb1d9: mov rax, qword ptr [rip + 0x419e4c0]
0x2bcb1e0: mov rcx, qword ptr [rax + 0x30]
0x2bcb1e4: mov byte ptr [rcx + 0x88], 0
0x2bcb1eb: lea rbx, [rip + 0x2f5a206]
0x2bcb1f2: mov qword ptr [rbp - 0x31], rbx
0x2bcb1f6: mov byte ptr [rbp - 0x29], 0
0x2bcb1fa: lea rax, [rip + 0x2f5a237]
0x2bcb201: mov qword ptr [rbp - 0x31], rax
0x2bcb205: mov qword ptr [rbp - 0x21], rsi
0x2bcb209: mov rax, qword ptr [r15]
0x2bcb20c: mov rcx, r15
0x2bcb20f: call qword ptr [rax + 0xe8]
0x2bcb215: mov qword ptr [rbp - 0x21], rax
0x2bcb219: lea r9, [rbp + 0x7f]
0x2bcb21d: lea r8, [rbp + 0x77]
0x2bcb221: lea rdx, [rbp - 0x31]
0x2bcb225: mov rcx, r15
0x2bcb228: call 0x14299e3a0
0x2bcb22d: nop 
0x2bcb22e: mov qword ptr [rbp - 0x31], rbx
0x2bcb232: mov dword ptr [r14], esi
0x2bcb235: lea rdi, [rip + 0x2b5ac0c]
0x2bcb23c: mov qword ptr [rbp - 0x19], rdi
0x2bcb240: cmp byte ptr [rbp - 9], 0
0x2bcb244: je 0x142bcb2bc
0x2bcb246: cmp byte ptr [rbp - 8], 0
0x2bcb24a: jne 0x142bcb25b
0x2bcb24c: mov rcx, qword ptr [rbp - 0x11]
0x2bcb250: mov rax, qword ptr [rcx]
0x2bcb253: call qword ptr [rax + 8]
0x2bcb256: movzx esi, al
0x2bcb259: jmp 0x142bcb29b
0x2bcb25b: mov r15, qword ptr [rbp - 0x11]
0x2bcb25f: lea rbx, [r15 + 0x18]
0x2bcb263: mov qword ptr [rbp + 0x67], rbx
0x2bcb267: mov rax, qword ptr [rbx]
0x2bcb26a: mov rcx, rbx
0x2bcb26d: call qword ptr [rax + 8]
0x2bcb270: nop 
0x2bcb271: dec word ptr [r15 + 0x48]
0x2bcb276: cmp byte ptr [r15 + 0x4a], 0
0x2bcb27b: jne 0x142bcb28f
0x2bcb27d: lock xadd dword ptr [r15 + 0x10], esi
0x2bcb283: add si, word ptr [r15 + 0x48]
0x2bcb288: jne 0x142bcb28f
0x2bcb28a: mov sil, 1
0x2bcb28d: jmp 0x142bcb292
0x2bcb28f: xor sil, sil
0x2bcb292: mov rax, qword ptr [rbx]
0x2bcb295: mov rcx, rbx
0x2bcb298: call qword ptr [rax + 0x10]
0x2bcb29b: test sil, sil
0x2bcb29e: je 0x142bcb2b8
0x2bcb2a0: mov rcx, qword ptr [rbp - 0x11]
0x2bcb2a4: mov edx, 1
0x2bcb2a9: xor eax, eax
0x2bcb2ab: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x2bcb2b0: jne 0x142bcb2b8
0x2bcb2b2: mov rax, qword ptr [rcx]
0x2bcb2b5: call qword ptr [rax + 0x10]
0x2bcb2b8: mov byte ptr [rbp - 9], 0
0x2bcb2bc: lea rax, [rip + 0x2d47b9d]
0x2bcb2c3: mov qword ptr [rbp + 7], rax
0x2bcb2c7: cmp byte ptr [rbp + 0x17], 0
0x2bcb2cb: je 0x142bcb2db
0x2bcb2cd: mov rcx, qword ptr [rbp + 0x2f]
0x2bcb2d1: mov rax, qword ptr [rcx]
0x2bcb2d4: call qword ptr [rax + 0x148]
0x2bcb2da: nop 
0x2bcb2db: lea rax, [rip + 0x29a855e]
0x2bcb2e2: mov qword ptr [rbp + 7], rax
0x2bcb2e6: mov qword ptr [rbp + 7], rdi
0x2bcb2ea: lea rcx, [rbp + 7]
0x2bcb2ee: call 0x141434880
0x2bcb2f3: mov rax, r14
0x2bcb2f6: mov rbx, qword ptr [rsp + 0xd8]
0x2bcb2fe: add rsp, 0xa0
0x2bcb305: pop r15
0x2bcb307: pop r14
0x2bcb309: pop rdi
0x2bcb30a: pop rsi
0x2bcb30b: pop rbp
0x2bcb30c: ret 