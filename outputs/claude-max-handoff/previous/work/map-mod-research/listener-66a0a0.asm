0x66a0a0: mov qword ptr [rsp + 0x10], rbx
0x66a0a5: mov qword ptr [rsp + 0x18], rsi
0x66a0aa: mov qword ptr [rsp + 0x20], rdi
0x66a0af: mov qword ptr [rsp + 8], rcx
0x66a0b4: push rbp
0x66a0b5: push r14
0x66a0b7: push r15
0x66a0b9: lea rbp, [rsp - 0x47]
0x66a0be: sub rsp, 0x90
0x66a0c5: xor r14d, r14d
0x66a0c8: mov dword ptr [rbp - 0x29], r14d
0x66a0cc: lea rdx, [rbp - 0x11]
0x66a0d0: mov rcx, qword ptr [rip + 0x66ff0b9]
0x66a0d7: mov rcx, qword ptr [rcx + 0x30]
0x66a0db: call 0x1408b44e0
0x66a0e0: nop 
0x66a0e1: lea r15, [rip + 0x50bbd60]
0x66a0e8: cmp byte ptr [rbp - 1], r14b
0x66a0ec: jne 0x14066a0f6
0x66a0ee: xor dil, dil
0x66a0f1: jmp 0x14066a1b0
0x66a0f6: lea rdx, [rbp + 0xf]
0x66a0fa: mov rcx, qword ptr [rbp - 9]
0x66a0fe: call 0x1417fa6c0
0x66a103: nop 
0x66a104: cmp byte ptr [rbp + 0x1f], 0
0x66a108: jne 0x14066a10f
0x66a10a: xor dil, dil
0x66a10d: jmp 0x14066a178
0x66a10f: mov rcx, qword ptr [rbp + 0x17]
0x66a113: mov rax, qword ptr [rcx]
0x66a116: call qword ptr [rax + 0x48]
0x66a119: mov rbx, rax
0x66a11c: lea rdx, [rax + 8]
0x66a120: test rax, rax
0x66a123: cmove rdx, r14
0x66a127: mov rdx, qword ptr [rdx]
0x66a12a: lea rcx, [rbp - 0x21]
0x66a12e: call 0x140393df0
0x66a133: nop 
0x66a134: mov qword ptr [rbp - 0x19], rbx
0x66a138: mov esi, 4
0x66a13d: mov dword ptr [rbp - 0x29], esi
0x66a140: lea rdx, [rbp + 0x67]
0x66a144: mov rcx, rbx
0x66a147: call 0x141f6ffa0
0x66a14c: nop 
0x66a14d: cmp qword ptr [rbp + 0x67], 0
0x66a152: jne 0x14066a159
0x66a154: xor dil, dil
0x66a157: jmp 0x14066a15c
0x66a159: mov dil, 1
0x66a15c: lea rcx, [rbp + 0x67]
0x66a160: call 0x14038ad90
0x66a165: and esi, 0xfffffffb
0x66a168: mov dword ptr [rbp - 0x29], esi
0x66a16b: mov rcx, qword ptr [rbp - 0x21]
0x66a16f: mov rax, qword ptr [rcx]
0x66a172: mov dl, 1
0x66a174: call qword ptr [rax + 0x20]
0x66a177: nop 
0x66a178: lea rax, [rip + 0x52a8ce1]
0x66a17f: mov qword ptr [rbp + 0xf], rax
0x66a183: cmp byte ptr [rbp + 0x1f], 0
0x66a187: je 0x14066a197
0x66a189: mov rcx, qword ptr [rbp + 0x37]
0x66a18d: mov rax, qword ptr [rcx]
0x66a190: call qword ptr [rax + 0x148]
0x66a196: nop 
0x66a197: lea rax, [rip + 0x4f096a2]
0x66a19e: mov qword ptr [rbp + 0xf], rax
0x66a1a2: mov qword ptr [rbp + 0xf], r15
0x66a1a6: lea rcx, [rbp + 0xf]
0x66a1aa: call 0x141434880
0x66a1af: nop 
0x66a1b0: mov qword ptr [rbp - 0x11], r15
0x66a1b4: cmp byte ptr [rbp - 1], 0
0x66a1b8: je 0x14066a22e
0x66a1ba: cmp byte ptr [rbp], 0
0x66a1be: jne 0x14066a1cf
0x66a1c0: mov rcx, qword ptr [rbp - 9]
0x66a1c4: mov rax, qword ptr [rcx]
0x66a1c7: call qword ptr [rax + 8]
0x66a1ca: movzx esi, al
0x66a1cd: jmp 0x14066a20d
0x66a1cf: mov rsi, qword ptr [rbp - 9]
0x66a1d3: lea rbx, [rsi + 0x18]
0x66a1d7: mov qword ptr [rbp + 0x67], rbx
0x66a1db: mov rax, qword ptr [rbx]
0x66a1de: mov rcx, rbx
0x66a1e1: call qword ptr [rax + 8]
0x66a1e4: nop 
0x66a1e5: dec word ptr [rsi + 0x48]
0x66a1e9: cmp byte ptr [rsi + 0x4a], 0
0x66a1ed: jne 0x14066a201
0x66a1ef: lock xadd dword ptr [rsi + 0x10], r14d
0x66a1f5: add r14w, word ptr [rsi + 0x48]
0x66a1fa: jne 0x14066a201
0x66a1fc: mov sil, 1
0x66a1ff: jmp 0x14066a204
0x66a201: xor sil, sil
0x66a204: mov rax, qword ptr [rbx]
0x66a207: mov rcx, rbx
0x66a20a: call qword ptr [rax + 0x10]
0x66a20d: test sil, sil
0x66a210: je 0x14066a22a
0x66a212: mov rcx, qword ptr [rbp - 9]
0x66a216: mov edx, 1
0x66a21b: xor eax, eax
0x66a21d: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x66a222: jne 0x14066a22a
0x66a224: mov rdx, qword ptr [rcx]
0x66a227: call qword ptr [rdx + 0x10]
0x66a22a: mov byte ptr [rbp - 1], 0
0x66a22e: movzx eax, dil
0x66a232: lea r11, [rsp + 0x90]
0x66a23a: mov rbx, qword ptr [r11 + 0x28]
0x66a23e: mov rsi, qword ptr [r11 + 0x30]
0x66a242: mov rdi, qword ptr [r11 + 0x38]
0x66a246: mov rsp, r11
0x66a249: pop r15
0x66a24b: pop r14
0x66a24d: pop rbp
0x66a24e: ret 