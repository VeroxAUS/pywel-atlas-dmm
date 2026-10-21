0xdec470: mov qword ptr [rsp + 0x10], rbx
0xdec475: mov qword ptr [rsp + 0x18], rsi
0xdec47a: mov qword ptr [rsp + 0x20], rdi
0xdec47f: push rbp
0xdec480: lea rbp, [rsp - 0x60]
0xdec485: sub rsp, 0x160
0xdec48c: movzx edx, cl
0xdec48f: lea rax, [rip + 0x5ee400a]
0xdec496: lea rbx, [rax + rdx*4]
0xdec49a: cmp dword ptr [rbx], 0
0xdec49d: jne 0x140dec590
0xdec4a3: xor esi, esi
0xdec4a5: mov qword ptr [rbp + 0x48], rsi
0xdec4a9: mov qword ptr [rbp + 0x50], 0x105
0xdec4b1: mov dword ptr [rbp + 0x54], esi
0xdec4b4: mov byte ptr [rsp + 0x40], sil
0xdec4b9: mov dword ptr [rbp + 0x54], esi
0xdec4bc: mov byte ptr [rsp + 0x40], sil
0xdec4c1: mov rax, qword ptr [rbp + 0x48]
0xdec4c5: test rax, rax
0xdec4c8: je 0x140dec4cd
0xdec4ca: mov byte ptr [rax], sil
0xdec4cd: lea rdi, [rip + 0x4789a9c]
0xdec4d4: mov qword ptr [rsp + 0x20], rdi
0xdec4d9: mov byte ptr [rsp + 0x28], 0
0xdec4de: mov eax, 2
0xdec4e3: mov word ptr [rsp + 0x2a], ax
0xdec4e8: lea rax, [rip + 0x49359b1]
0xdec4ef: mov qword ptr [rsp + 0x20], rax
0xdec4f4: mov qword ptr [rsp + 0x30], rdx
0xdec4f9: mov word ptr [rsp + 0x38], 0x100
0xdec500: mov dword ptr [rbp + 0x54], 0xffffffff
0xdec507: lea rcx, [rsp + 0x40]
0xdec50c: mov rax, qword ptr [rbp + 0x48]
0xdec510: test rax, rax
0xdec513: cmovne rcx, rax
0xdec517: lea r9, [rsp + 0x20]
0xdec51c: lea r8, [rip + 0x4885b5d]
0xdec523: mov edx, dword ptr [rbp + 0x50]
0xdec526: call 0x14064c020
0xdec52b: nop 
0xdec52c: mov qword ptr [rsp + 0x20], rdi
0xdec531: lea rdx, [rsp + 0x40]
0xdec536: mov rax, qword ptr [rbp + 0x48]
0xdec53a: test rax, rax
0xdec53d: cmovne rdx, rax
0xdec541: mov dword ptr [rbp + 0x70], esi
0xdec544: mov r9d, 0x2ffff
0xdec54a: mov r8d, 1
0xdec550: lea rcx, [rbp + 0x70]
0xdec554: call 0x1412becb0
0xdec559: mov eax, dword ptr [rbp + 0x70]
0xdec55c: mov dword ptr [rbx], eax
0xdec55e: mov rcx, qword ptr [rbp + 0x48]
0xdec562: test rcx, rcx
0xdec565: je 0x140dec590
0xdec567: mov r8d, 0x1fd
0xdec56d: mov rax, qword ptr gs:[0x58]
0xdec576: mov rdx, qword ptr [rax]
0xdec579: cmp byte ptr [r8 + rdx], 0
0xdec57e: je 0x140dec587
0xdec580: call 0x1447f03bc
0xdec585: jmp 0x140dec58c
0xdec587: call 0x1447f02bc
0xdec58c: mov qword ptr [rbp + 0x48], rsi
0xdec590: mov rax, rbx
0xdec593: lea r11, [rsp + 0x160]
0xdec59b: mov rbx, qword ptr [r11 + 0x18]
0xdec59f: mov rsi, qword ptr [r11 + 0x20]
0xdec5a3: mov rdi, qword ptr [r11 + 0x28]
0xdec5a7: mov rsp, r11
0xdec5aa: pop rbp
0xdec5ab: ret 
CALLEE 0x12becb0
0x12becb0: mov qword ptr [rsp + 0x20], rbx
0x12becb5: mov dword ptr [rsp + 0x18], r8d
0x12becba: mov qword ptr [rsp + 0x10], rdx
0x12becbf: mov qword ptr [rsp + 8], rcx
0x12becc4: push rbp
0x12becc5: push rsi
0x12becc6: push rdi
0x12becc7: push r12
0x12becc9: push r13
0x12beccb: push r14
0x12beccd: push r15
0x12beccf: lea rbp, [rsp - 0x27]
0x12becd4: sub rsp, 0xc0
0x12becdb: mov edi, r9d
0x12becde: mov r12, rdx
0x12bece1: xor ebx, ebx
0x12bece3: mov dword ptr [rcx], ebx
0x12bece5: test rdx, rdx
0x12bece8: je 0x1412bf294
0x12becee: xor eax, eax
0x12becf0: mov r15d, 1
0x12becf6: mov ecx, 0x1fd
0x12becfb: mov r13, 0xffffffffffffffff
0x12bed02: lock cmpxchg dword ptr [rip + 0x5ac688d], r15d
0x12bed0b: jne 0x1412befe9
0x12bed11: mov r14d, ecx
0x12bed14: mov rax, qword ptr gs:[0x58]
0x12bed1d: add r14, qword ptr [rax]
0x12bed20: mov edx, 0x10
0x12bed25: mov ecx, 0xb0
0x12bed2a: cmp byte ptr [r14], bl
0x12bed2d: je 0x1412bed36
0x12bed2f: call 0x1447efa78
0x12bed34: jmp 0x1412bed3b
0x12bed36: call 0x1447ef9b0
0x12bed3b: mov rsi, rax
0x12bed3e: test rax, rax
0x12bed41: jne 0x1412bed5c
0x12bed43: call 0x141318e70
0x12bed48: xor r9d, r9d
0x12bed4b: xor r8d, r8d
0x12bed4e: mov edx, r15d
0x12bed51: mov ecx, 0xa0000002
0x12bed56: call qword ptr [rip + 0x3f2c3ec]
0x12bed5c: mov qword ptr [rbp + 0xf], rsi
0x12bed60: test rsi, rsi
0x12bed63: je 0x1412bedd3
0x12bed65: mov qword ptr [rbp - 0x29], rsi
0x12bed69: mov rcx, rsi
0x12bed6c: call 0x141371960
0x12bed71: nop 
0x12bed72: lea rax, [rip + 0x42be157]
0x12bed79: mov qword ptr [rsi], rax
0x12bed7c: mov qword ptr [rsi + 0x30], rbx
0x12bed80: mov dword ptr [rsi + 0x38], ebx
0x12bed83: mov dword ptr [rsi + 0x3c], 0xffffffff
0x12bed8a: mov qword ptr [rsi + 0x40], rbx
0x12bed8e: mov qword ptr [rsi + 0x48], rbx
0x12bed92: mov qword ptr [rsi + 0x50], rbx
0x12bed96: mov qword ptr [rsi + 0x58], rbx
0x12bed9a: lea rbx, [rsi + 0x60]
0x12bed9e: mov qword ptr [rbp - 0x49], rbx
0x12beda2: mov qword ptr [rbp - 0x11], rbx
0x12beda6: mov rcx, rbx
0x12beda9: call 0x141371960
0x12bedae: nop 
0x12bedaf: lea rax, [rip + 0x42be11a]
0x12bedb6: mov qword ptr [rbx], rax
0x12bedb9: lea rax, [rbx + 0x30]
0x12bedbd: mov qword ptr [rbp - 1], rax
0x12bedc1: xor ebx, ebx
0x12bedc3: mov qword ptr [rax], rbx
0x12bedc6: mov qword ptr [rax + 8], rbx
0x12bedca: mov dword ptr [rax + 0x10], ebx
0x12bedcd: mov qword ptr [rax + 0x18], rbx
0x12bedd1: jmp 0x1412bedd6
0x12bedd3: mov rsi, rbx
0x12bedd6: mov dword ptr [rsi + 0x50], 0x8e
0x12beddd: mov dword ptr [rsi + 0x54], 0x2ffff
0x12bede4: mov edx, 0x2ffff8
0x12bede9: mov r8d, 0x10
0x12bedef: call 0x141373730
0x12bedf4: mov qword ptr [rbp - 1], rax
0x12bedf8: test rax, rax
0x12bedfb: je 0x1412bee2f
0x12bedfd: mov qword ptr [rax], 0x2ffff
0x12bee04: lea rbx, [rax + 8]
0x12bee08: lea rax, [rip + 0xf01]
0x12bee0f: mov qword ptr [rsp + 0x20], rax
0x12bee14: lea r9, [rip + 0xed5]
0x12bee1b: mov edx, 0x10
0x12bee20: mov r8d, 0x2ffff
0x12bee26: mov rcx, rbx
0x12bee29: call 0x1448959e4
0x12bee2e: nop 
0x12bee2f: mov qword ptr [rsi + 0x58], rbx
0x12bee33: lea rbx, [rsi + 0x60]
0x12bee37: mov qword ptr [rbp - 1], rbx
0x12bee3b: mov byte ptr [rbp + 7], 1
0x12bee3f: mov ecx, r15d
0x12bee42: lock xadd dword ptr [rbx + 8], ecx
0x12bee47: inc ecx
0x12bee49: mov eax, dword ptr [rbx + 0xc]
0x12bee4c: shr eax, 0x1f
0x12bee4f: test al, al
0x12bee51: jne 0x1412bee62
0x12bee53: cmp ecx, 1
0x12bee56: sete dl
0x12bee59: mov rax, qword ptr [rbx]
0x12bee5c: mov rcx, rbx
0x12bee5f: call qword ptr [rax + 0x30]
0x12bee62: test dword ptr [rbx + 0xc], 0x40000000
0x12bee69: je 0x1412bee6f
0x12bee6b: lock inc dword ptr [rbx + 0xc]
0x12bee6f: mov rax, qword ptr [rbx]
0x12bee72: xor edx, edx
0x12bee74: mov rcx, rbx
0x12bee77: call qword ptr [rax + 0x18]
0x12bee7a: nop 
0x12bee7b: lea rcx, [rbx + 0x30]
0x12bee7f: mov edx, 0x20
0x12bee84: call 0x1404347a0
0x12bee89: nop 
0x12bee8a: mov rax, qword ptr [rbx]
0x12bee8d: xor edx, edx
0x12bee8f: mov rcx, rbx
0x12bee92: call qword ptr [rax + 0x20]
0x12bee95: mov eax, r13d
0x12bee98: lock xadd dword ptr [rsi + 0x68], eax
0x12bee9d: cmp eax, 1
0x12beea0: jne 0x1412beeb4
0x12beea2: test dword ptr [rsi + 0x6c], 0x40000000
0x12beea9: je 0x1412beeb4
0x12beeab: mov rax, qword ptr [rbx]
0x12beeae: mov rcx, rbx
0x12beeb1: call qword ptr [rax + 0x40]
0x12beeb4: test dword ptr [rbx + 0xc], 0x40000000
0x12beebb: je 0x1412beec1
0x12beebd: lock dec dword ptr [rbx + 0xc]
0x12beec1: mov r8d, dword ptr [rsi + 0x54]
0x12beec5: shl r8, 4
0x12beec9: xor edx, edx
0x12beecb: mov rcx, qword ptr [rsi + 0x58]
0x12beecf: call 0x144898e24
0x12beed4: inc dword ptr [rsi + 0x3c]
0x12beed7: mov r8d, 0xc30
0x12beedd: nop dword ptr [rax]
0x12beee0: mov r10b, 1
0x12beee3: mov r9d, r8d
0x12beee6: shr r9d, 1
0x12beee9: mov ecx, 2
0x12beeee: cmp r9d, ecx
0x12beef1: jb 0x1412bef13
0x12beef3: xor edx, edx
0x12beef5: mov eax, r8d
0x12beef8: div ecx
0x12beefa: test edx, edx
0x12beefc: je 0x1412bef07
0x12beefe: inc ecx
0x12bef00: cmp ecx, r9d
0x12bef03: jbe 0x1412beef3
0x12bef05: jmp 0x1412bef13
0x12bef07: xor r10b, r10b
0x12bef0a: inc r8d
0x12bef0d: cmp r8d, -1
0x12bef11: jb 0x1412beee0
0x12bef13: mov edx, 0xffffffff
0x12bef18: test r10b, r10b
0x12bef1b: cmovne edx, r8d
0x12bef1f: cmp edx, dword ptr [rsi + 0x30]
0x12bef22: jbe 0x1412bef2d
0x12bef24: lea rcx, [rsi + 0x30]
0x12bef28: call 0x140762f40
0x12bef2d: xor edx, edx
0x12bef2f: lea r15, [rip + 0x42b4576]
0x12bef36: mov rcx, r15
0x12bef39: call 0x141364780
0x12bef3e: mov qword ptr [rbp - 0x41], r15
0x12bef42: mov dword ptr [rbp - 0x39], eax
0x12bef45: xor r15d, r15d
0x12bef48: mov word ptr [rbp - 0x35], r15w
0x12bef4d: mov byte ptr [rbp - 0x33], r15b
0x12bef51: mov dword ptr [rbp - 0x49], r15d
0x12bef55: lea rax, [rbp - 0x41]
0x12bef59: mov qword ptr [rbp - 0x29], rax
0x12bef5d: inc dword ptr [rsi + 0x3c]
0x12bef60: lea rax, [rbp - 1]
0x12bef64: mov qword ptr [rsp + 0x38], rax
0x12bef69: lea rax, [rbp - 0x11]
0x12bef6d: mov qword ptr [rsp + 0x30], rax
0x12bef72: lea rax, [rbp - 0x31]
0x12bef76: mov qword ptr [rsp + 0x28], rax
0x12bef7b: lea r9, [rbp - 0x49]
0x12bef7f: mov r8d, dword ptr [rbp - 0x39]
0x12bef83: lea rdx, [rbp - 0x29]
0x12bef87: lea rcx, [rsi + 0x30]
0x12bef8b: call 0x1412bf8a0
0x12bef90: mov ecx, dword ptr [rbp - 0x49]
0x12bef93: shl rcx, 4
0x12bef97: add rcx, qword ptr [rsi + 0x58]
0x12bef9b: lea rdx, [rbp - 0x41]
0x12bef9f: call 0x1412bfc50
0x12befa4: mov qword ptr [rip + 0x59cdd3d], rsi
0x12befab: call 0x1412bd090
0x12befb0: nop 
0x12befb1: cmp byte ptr [rbp - 0x33], r15b
0x12befb5: je 0x1412befd9
0x12befb7: mov rcx, qword ptr [rbp - 0x41]
0x12befbb: test rcx, rcx
0x12befbe: je 0x1412befd5
0x12befc0: cmp byte ptr [r14], r15b
0x12befc3: je 0x1412befcc
0x12befc5: call 0x1447f03bc
0x12befca: jmp 0x1412befd1
0x12befcc: call 0x1447f02bc
0x12befd1: mov qword ptr [rbp - 0x41], r15
0x12befd5: mov byte ptr [rbp - 0x33], 0
0x12befd9: mov dword ptr [rbp - 0x39], 0xffffffff
0x12befe0: mov word ptr [rbp - 0x35], r15w
0x12befe5: mov qword ptr [rbp - 0x41], r15
0x12befe9: cmp qword ptr [rip + 0x59cdcf7], 0
0x12beff1: jne 0x1412befff
0x12beff3: pause 
0x12beff5: cmp qword ptr [rip + 0x59cdceb], 0
0x12beffd: je 0x1412beff3
0x12befff: mov rsi, r13
0x12bf002: inc rsi
0x12bf005: cmp byte ptr [r12 + rsi], 0
0x12bf00a: jne 0x1412bf002
0x12bf00c: lea eax, [rsi - 1]
0x12bf00f: cmp eax, 0xfffd
0x12bf014: ja 0x1412bf294
0x12bf01a: mov edx, esi
0x12bf01c: mov rcx, r12
0x12bf01f: call 0x141364780
0x12bf024: mov r15d, eax
0x12bf027: mov dword ptr [rbp - 0x49], eax
0x12bf02a: mov qword ptr [rbp - 0x11], r12
0x12bf02e: mov dword ptr [rbp - 9], eax
0x12bf031: mov word ptr [rbp - 5], si
0x12bf035: mov byte ptr [rbp - 3], 0
0x12bf039: mov rbx, qword ptr [rip + 0x59cdca8]
0x12bf040: mov qword ptr [rbp - 1], rbx
0x12bf044: test dword ptr [rbx + 0xc], 0x40000000
0x12bf04b: je 0x1412bf077
0x12bf04d: xor ecx, ecx
0x12bf04f: mov eax, r13d
0x12bf052: lock cmpxchg dword ptr [rbx + 8], r13d
0x12bf058: test eax, eax
0x12bf05a: je 0x1412bf077
0x12bf05c: nop dword ptr [rax]
0x12bf060: cmp ecx, 0x3e8
0x12bf066: jae 0x1412bf077
0x12bf068: inc ecx
0x12bf06a: mov eax, r13d
0x12bf06d: lock cmpxchg dword ptr [rbx + 8], r13d
0x12bf073: test eax, eax
0x12bf075: jne 0x1412bf060
0x12bf077: mov rax, qword ptr [rbx]
0x12bf07a: mov dl, 1
0x12bf07c: mov rcx, rbx
0x12bf07f: call qword ptr [rax + 0x18]
0x12bf082: test dword ptr [rbx + 0xc], 0x40000000
0x12bf089: je 0x1412bf0b6
0x12bf08b: mov eax, r13d
0x12bf08e: lock cmpxchg dword ptr [rbx + 8], r13d
0x12bf094: test eax, eax
0x12bf096: je 0x1412bf0b6
0x12bf098: nop dword ptr [rax + rax]
0x12bf0a0: mov rax, qword ptr [rbx]
0x12bf0a3: mov rcx, rbx
0x12bf0a6: call qword ptr [rax + 0x38]
0x12bf0a9: mov eax, r13d
0x12bf0ac: lock cmpxchg dword ptr [rbx + 8], r13d
0x12bf0b2: test eax, eax
0x12bf0b4: jne 0x1412bf0a0
0x12bf0b6: mov r9, qword ptr [rip + 0x59cdc2b]
0x12bf0bd: mov qword ptr [rbp - 0x29], r9
0x12bf0c1: cmp dword ptr [r9 + 0x34], 0
0x12bf0c6: je 0x1412bf146
0x12bf0c8: xor edx, edx
0x12bf0ca: mov r8d, dword ptr [rbp - 0x49]
0x12bf0ce: mov eax, r8d
0x12bf0d1: div dword ptr [r9 + 0x30]
0x12bf0d5: mov r12d, edx
0x12bf0d8: shl r12, 9
0x12bf0dc: add r12, qword ptr [r9 + 0x40]
0x12bf0e0: xor r14d, r14d
0x12bf0e3: cmp dword ptr [r12], r14d
0x12bf0e7: jbe 0x1412bf2af
0x12bf0ed: nop dword ptr [rax]
0x12bf0f0: cmp dword ptr [r12 + r14*8 + 8], r8d
0x12bf0f5: jne 0x1412bf135
0x12bf0f7: mov r15d, dword ptr [r12 + r14*8 + 0xc]
0x12bf0fc: shl r15, 5
0x12bf100: add r15, qword ptr [r9 + 0x48]
0x12bf104: cmp dword ptr [r15 + 0x10], r8d
0x12bf108: jne 0x1412bf135
0x12bf10a: movzx eax, word ptr [r15 + 0x14]
0x12bf10f: cmp ax, si
0x12bf112: jne 0x1412bf135
0x12bf114: mov r8d, eax
0x12bf117: mov rdx, qword ptr [rbp + 0x6f]
0x12bf11b: mov rcx, qword ptr [r15 + 8]
0x12bf11f: call qword ptr [rip + 0x3f2d40b]
0x12bf125: test eax, eax
0x12bf127: je 0x1412bf25a
0x12bf12d: mov r8d, dword ptr [rbp - 0x49]
0x12bf131: mov r9, qword ptr [rbp - 0x29]
0x12bf135: inc r14d
0x12bf138: cmp r14d, dword ptr [r12]
0x12bf13c: jb 0x1412bf0f0
0x12bf13e: mov r15d, dword ptr [rbp - 0x49]
0x12bf142: mov r12, qword ptr [rbp + 0x6f]
0x12bf146: mov rax, qword ptr [rbx]
0x12bf149: mov dl, 1
0x12bf14b: mov rcx, rbx
0x12bf14e: call qword ptr [rax + 0x20]
0x12bf151: cmp dword ptr [rbp + 0x77], 0
0x12bf155: je 0x1412bf283
0x12bf15b: lea eax, [rsi + 1]
0x12bf15e: mov ebx, eax
0x12bf160: mov r8d, 0x10
0x12bf166: mov edx, eax
0x12bf168: call 0x141373730
0x12bf16d: mov r14, rax
0x12bf170: mov r9, r13
0x12bf173: mov r8, r12
0x12bf176: mov edx, ebx
0x12bf178: mov rcx, rax
0x12bf17b: call qword ptr [rip + 0x3f2d32f]
0x12bf181: mov qword ptr [rbp - 0x41], r14
0x12bf185: mov dword ptr [rbp - 0x39], r15d
0x12bf189: mov word ptr [rbp - 0x35], si
0x12bf18d: mov r12b, 1
0x12bf190: mov byte ptr [rbp - 0x33], r12b
0x12bf194: mov qword ptr [rbp - 0x21], r14
0x12bf198: mov dword ptr [rbp - 0x19], r15d
0x12bf19c: mov word ptr [rbp - 0x15], si
0x12bf1a0: mov byte ptr [rbp - 0x13], 0
0x12bf1a4: mov rsi, qword ptr [rip + 0x59cdb3d]
0x12bf1ab: mov qword ptr [rbp + 0x17], rsi
0x12bf1af: mov byte ptr [rbp + 0x1f], r12b
0x12bf1b3: mov ecx, 1
0x12bf1b8: lock xadd dword ptr [rsi + 8], ecx
0x12bf1bd: inc ecx
0x12bf1bf: mov eax, dword ptr [rsi + 0xc]
0x12bf1c2: shr eax, 0x1f
0x12bf1c5: test al, al
0x12bf1c7: jne 0x1412bf1d8
0x12bf1c9: cmp ecx, 1
0x12bf1cc: sete dl
0x12bf1cf: mov rax, qword ptr [rsi]
0x12bf1d2: mov rcx, rsi
0x12bf1d5: call qword ptr [rax + 0x30]
0x12bf1d8: test dword ptr [rsi + 0xc], 0x40000000
0x12bf1df: je 0x1412bf1e5
0x12bf1e1: lock inc dword ptr [rsi + 0xc]
0x12bf1e5: mov rax, qword ptr [rsi]
0x12bf1e8: xor edx, edx
0x12bf1ea: mov rcx, rsi
0x12bf1ed: call qword ptr [rax + 0x18]
0x12bf1f0: nop 
0x12bf1f1: mov dword ptr [rbp - 0x49], 0x2ffff
0x12bf1f8: mov rcx, qword ptr [rip + 0x59cdae9]
0x12bf1ff: add rcx, 0x30
0x12bf203: lea rax, [rbp - 0x21]
0x12bf207: mov qword ptr [rbp + 0xf], rax
0x12bf20b: inc dword ptr [rcx + 0xc]
0x12bf20e: lea rax, [rbp - 0x29]
0x12bf212: mov qword ptr [rsp + 0x38], rax
0x12bf217: lea rax, [rbp - 1]
0x12bf21b: mov qword ptr [rsp + 0x30], rax
0x12bf220: lea rax, [rbp + 0x6f]
0x12bf224: mov qword ptr [rsp + 0x28], rax
0x12bf229: lea r9, [rbp - 0x49]
0x12bf22d: mov r8d, r15d
0x12bf230: lea rdx, [rbp + 0xf]
0x12bf234: call 0x1412bf8a0
0x12bf239: movzx r15d, byte ptr [rbp + 0x6f]
0x12bf23e: test r15d, r15d
0x12bf241: jne 0x1412bf3c8
0x12bf247: cmp edi, 0x2ffff
0x12bf24d: jae 0x1412bf2b7
0x12bf24f: mov rbx, qword ptr [rbp + 0x67]
0x12bf253: mov dword ptr [rbx], edi
0x12bf255: jmp 0x1412bf39b
0x12bf25a: test r15, r15
0x12bf25d: je 0x1412bf13e
0x12bf263: lea rax, [r15 + 0x18]
0x12bf267: test rax, rax
0x12bf26a: je 0x1412bf13e
0x12bf270: mov eax, dword ptr [rax]
0x12bf272: mov rdx, qword ptr [rbp + 0x67]
0x12bf276: mov dword ptr [rdx], eax
0x12bf278: mov rax, qword ptr [rbx]
0x12bf27b: mov dl, 1
0x12bf27d: mov rcx, rbx
0x12bf280: call qword ptr [rax + 0x20]
0x12bf283: xor edi, edi
0x12bf285: mov dword ptr [rbp - 9], 0xffffffff
0x12bf28c: mov word ptr [rbp - 5], di
0x12bf290: mov qword ptr [rbp - 0x11], rdi
0x12bf294: mov rbx, qword ptr [rsp + 0x118]
0x12bf29c: add rsp, 0xc0
0x12bf2a3: pop r15
0x12bf2a5: pop r14
0x12bf2a7: pop r13
0x12bf2a9: pop r12
0x12bf2ab: pop rdi
0x12bf2ac: pop rsi
0x12bf2ad: pop rbp
0x12bf2ae: ret 
0x12bf2af: mov r15d, r8d
0x12bf2b2: jmp 0x1412bf142
0x12bf2b7: mov rbx, qword ptr [rip + 0x59cda2a]
0x12bf2be: add rbx, 0x60
0x12bf2c2: mov qword ptr [rbp - 1], rbx
0x12bf2c6: mov byte ptr [rbp + 7], 1
0x12bf2ca: mov r14d, 1
0x12bf2d0: mov ecx, r14d
0x12bf2d3: lock xadd dword ptr [rbx + 8], ecx
0x12bf2d8: inc ecx
0x12bf2da: mov eax, dword ptr [rbx + 0xc]
0x12bf2dd: shr eax, 0x1f
0x12bf2e0: test al, al
0x12bf2e2: jne 0x1412bf2f3
0x12bf2e4: cmp ecx, r14d
0x12bf2e7: sete dl
0x12bf2ea: mov rax, qword ptr [rbx]
0x12bf2ed: mov rcx, rbx
0x12bf2f0: call qword ptr [rax + 0x30]
0x12bf2f3: test dword ptr [rbx + 0xc], 0x40000000
0x12bf2fa: je 0x1412bf300
0x12bf2fc: lock inc dword ptr [rbx + 0xc]
0x12bf300: mov rax, qword ptr [rbx]
0x12bf303: xor edx, edx
0x12bf305: mov rcx, rbx
0x12bf308: call qword ptr [rax + 0x18]
0x12bf30b: nop 
0x12bf30c: cmp dword ptr [rbx + 0x38], 0
0x12bf310: jne 0x1412bf321
0x12bf312: mov rdx, qword ptr [rbp + 0x67]
0x12bf316: mov dword ptr [rdx], 0x2ffff
0x12bf31c: xor dil, dil
0x12bf31f: jmp 0x1412bf34b
0x12bf321: mov eax, dword ptr [rbx + 0x30]
0x12bf324: lea ecx, [rax + 1]
0x12bf327: mov dword ptr [rbx + 0x30], ecx
0x12bf32a: xor edx, edx
0x12bf32c: div dword ptr [rbx + 0x3c]
0x12bf32f: mov rax, qword ptr [rbx + 0x48]
0x12bf333: mov ecx, dword ptr [rax + rdx*4]
0x12bf336: mov rdx, qword ptr [rbp + 0x67]
0x12bf33a: mov dword ptr [rdx], ecx
0x12bf33c: add dword ptr [rbx + 0x38], -1
0x12bf340: jne 0x1412bf348
0x12bf342: xor eax, eax
0x12bf344: mov qword ptr [rbx + 0x30], rax
0x12bf348: mov dil, 1
0x12bf34b: mov rax, qword ptr [rbx]
0x12bf34e: xor edx, edx
0x12bf350: mov rcx, rbx
0x12bf353: call qword ptr [rax + 0x20]
0x12bf356: mov eax, r13d
0x12bf359: lock xadd dword ptr [rbx + 8], eax
0x12bf35e: cmp eax, 1
0x12bf361: jne 0x1412bf375
0x12bf363: test dword ptr [rbx + 0xc], 0x40000000
0x12bf36a: je 0x1412bf382
0x12bf36c: mov rax, qword ptr [rbx]
0x12bf36f: mov rcx, rbx
0x12bf372: call qword ptr [rax + 0x40]
0x12bf375: test dword ptr [rbx + 0xc], 0x40000000
0x12bf37c: je 0x1412bf382
0x12bf37e: lock dec dword ptr [rbx + 0xc]
0x12bf382: mov rbx, qword ptr [rbp + 0x67]
0x12bf386: test dil, dil
0x12bf389: jne 0x1412bf39b
0x12bf38b: mov rax, qword ptr [rip + 0x59cd956]
0x12bf392: lock xadd dword ptr [rax + 0x50], r14d
0x12bf398: mov dword ptr [rbx], r14d
0x12bf39b: mov ecx, dword ptr [rbx]
0x12bf39d: mov rax, qword ptr [rbp - 0x29]
0x12bf3a1: mov dword ptr [rax], ecx
0x12bf3a3: mov ecx, dword ptr [rbx]
0x12bf3a5: shl rcx, 4
0x12bf3a9: mov rax, qword ptr [rip + 0x59cd938]
0x12bf3b0: add rcx, qword ptr [rax + 0x58]
0x12bf3b4: lea rdx, [rbp - 0x41]
0x12bf3b8: call 0x1412bfc50
0x12bf3bd: movzx r12d, byte ptr [rbp - 0x33]
0x12bf3c2: mov r14, qword ptr [rbp - 0x41]
0x12bf3c6: jmp 0x1412bf3d4
0x12bf3c8: mov rax, qword ptr [rbp - 0x29]
0x12bf3cc: mov ecx, dword ptr [rax]
0x12bf3ce: mov rbx, qword ptr [rbp + 0x67]
0x12bf3d2: mov dword ptr [rbx], ecx
0x12bf3d4: mov rax, qword ptr [rsi]
0x12bf3d7: xor edx, edx
0x12bf3d9: mov rcx, rsi
0x12bf3dc: call qword ptr [rax + 0x20]
0x12bf3df: lock xadd dword ptr [rsi + 8], r13d
0x12bf3e5: cmp r13d, 1
0x12bf3e9: jne 0x1412bf3fd
0x12bf3eb: test dword ptr [rsi + 0xc], 0x40000000
0x12bf3f2: je 0x1412bf40a
0x12bf3f4: mov rax, qword ptr [rsi]
0x12bf3f7: mov rcx, rsi
0x12bf3fa: call qword ptr [rax + 0x40]
0x12bf3fd: test dword ptr [rsi + 0xc], 0x40000000
0x12bf404: je 0x1412bf40a
0x12bf406: lock dec dword ptr [rsi + 0xc]
0x12bf40a: test r15d, r15d
0x12bf40d: je 0x1412bf429
0x12bf40f: nop 
0x12bf410: pause 
0x12bf412: mov edx, dword ptr [rbx]
0x12bf414: add rdx, rdx
0x12bf417: mov rax, qword ptr [rip + 0x59cd8ca]
0x12bf41e: mov rcx, qword ptr [rax + 0x58]
0x12bf422: cmp qword ptr [rcx + rdx*8], 0
0x12bf427: je 0x1412bf410
0x12bf429: mov ebx, 0x1fd
0x12bf42e: cmp byte ptr [rbp - 0x13], 0
0x12bf432: je 0x1412bf467
0x12bf434: mov rcx, qword ptr [rbp - 0x21]
0x12bf438: test rcx, rcx
0x12bf43b: je 0x1412bf463
0x12bf43d: mov rax, qword ptr gs:[0x58]
0x12bf446: mov rdx, qword ptr [rax]
0x12bf449: cmp byte ptr [rbx + rdx], 0
0x12bf44d: je 0x1412bf456
0x12bf44f: call 0x1447f03bc
0x12bf454: jmp 0x1412bf45b
0x12bf456: call 0x1447f02bc
0x12bf45b: mov qword ptr [rbp - 0x21], 0
0x12bf463: mov byte ptr [rbp - 0x13], 0
0x12bf467: mov dword ptr [rbp - 0x19], 0xffffffff
0x12bf46e: xor edi, edi
0x12bf470: mov word ptr [rbp - 0x15], di
0x12bf474: mov qword ptr [rbp - 0x21], rdi
0x12bf478: test r12b, r12b
0x12bf47b: je 0x1412bf4ab
0x12bf47d: test r14, r14
0x12bf480: je 0x1412bf4a7
0x12bf482: mov rax, qword ptr gs:[0x58]
0x12bf48b: mov rdx, qword ptr [rax]
0x12bf48e: mov rcx, r14
0x12bf491: cmp byte ptr [rbx + rdx], dil
0x12bf495: je 0x1412bf49e
0x12bf497: call 0x1447f03bc
0x12bf49c: jmp 0x1412bf4a3
0x12bf49e: call 0x1447f02bc
0x12bf4a3: mov qword ptr [rbp - 0x41], rdi
0x12bf4a7: mov byte ptr [rbp - 0x33], 0
0x12bf4ab: mov dword ptr [rbp - 0x39], 0xffffffff
0x12bf4b2: mov word ptr [rbp - 0x35], di
0x12bf4b6: mov qword ptr [rbp - 0x41], rdi
0x12bf4ba: jmp 0x1412bf285
0x12bf4bf: int3 
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
