0x1871930: mov qword ptr [rsp + 0x10], rbx
0x1871935: mov qword ptr [rsp + 0x18], rsi
0x187193a: push rbp
0x187193b: push rdi
0x187193c: push r13
0x187193e: push r14
0x1871940: push r15
0x1871942: lea rbp, [rsp - 0xc0]
0x187194a: sub rsp, 0x1c0
0x1871951: movzx r15d, r9w
0x1871955: mov r13, r8
0x1871958: mov rsi, rdx
0x187195b: mov rdi, rcx
0x187195e: mov qword ptr [rbp - 0x80], rcx
0x1871962: xor bl, bl
0x1871964: mov byte ptr [rbp - 0x78], bl
0x1871967: mov r14, qword ptr [rcx]
0x187196a: mov qword ptr [rbp + 0xf0], r14
0x1871971: mov rax, qword ptr [r14]
0x1871974: mov rcx, r14
0x1871977: call qword ptr [rax + 8]
0x187197a: nop 
0x187197b: cmp byte ptr [rdi + 0x60], bl
0x187197e: jne 0x141871989
0x1871980: mov byte ptr [rdi + 0x60], 1
0x1871984: mov bl, 1
0x1871986: mov byte ptr [rbp - 0x78], bl
0x1871989: mov rax, qword ptr [r14]
0x187198c: mov rcx, r14
0x187198f: call qword ptr [rax + 0x10]
0x1871992: nop 
0x1871993: test bl, bl
0x1871995: jne 0x1418719a4
0x1871997: mov eax, dword ptr [rip + 0x5486307]
0x187199d: mov dword ptr [rsi], eax
0x187199f: jmp 0x141871d36
0x18719a4: mov r14, qword ptr [rdi]
0x18719a7: mov qword ptr [rbp + 0xf0], r14
0x18719ae: mov rax, qword ptr [r14]
0x18719b1: mov rcx, r14
0x18719b4: call qword ptr [rax + 8]
0x18719b7: nop 
0x18719b8: mov rax, qword ptr [rbp + 0x110]
0x18719bf: test byte ptr [rax], 8
0x18719c2: jne 0x141871a34
0x18719c4: cmp r15w, word ptr [rdi + 0x58]
0x18719c9: je 0x1418719fa
0x18719cb: mov eax, dword ptr [rip + 0x54863e3]
0x18719d1: mov dword ptr [rsi], eax
0x18719d3: mov rax, qword ptr [r14]
0x18719d6: mov rcx, r14
0x18719d9: call qword ptr [rax + 0x10]
0x18719dc: nop 
0x18719dd: mov rbx, qword ptr [rdi]
0x18719e0: mov qword ptr [rbp + 0xf0], rbx
0x18719e7: mov rax, qword ptr [rbx]
0x18719ea: mov rcx, rbx
0x18719ed: call qword ptr [rax + 8]
0x18719f0: nop 
0x18719f1: mov byte ptr [rdi + 0x60], 0
0x18719f5: jmp 0x141871d2d
0x18719fa: lea rcx, [rdi + 0x5c]
0x18719fe: mov eax, dword ptr [rcx]
0x1871a00: cmp eax, -1
0x1871a03: jne 0x141871a6f
0x1871a05: mov eax, dword ptr [rip + 0x5485ef5]
0x1871a0b: mov dword ptr [rsi], eax
0x1871a0d: mov rax, qword ptr [r14]
0x1871a10: mov rcx, r14
0x1871a13: call qword ptr [rax + 0x10]
0x1871a16: nop 
0x1871a17: mov rbx, qword ptr [rdi]
0x1871a1a: mov qword ptr [rbp + 0xf0], rbx
0x1871a21: mov rax, qword ptr [rbx]
0x1871a24: mov rcx, rbx
0x1871a27: call qword ptr [rax + 8]
0x1871a2a: nop 
0x1871a2b: mov byte ptr [rdi + 0x60], 0
0x1871a2f: jmp 0x141871d2d
0x1871a34: mov eax, dword ptr [rdi + 0x5c]
0x1871a37: cmp eax, -1
0x1871a3a: jne 0x141871a67
0x1871a3c: xor ebx, ebx
0x1871a3e: mov dword ptr [rsi], ebx
0x1871a40: mov rax, qword ptr [r14]
0x1871a43: mov rcx, r14
0x1871a46: call qword ptr [rax + 0x10]
0x1871a49: nop 
0x1871a4a: mov rbx, qword ptr [rdi]
0x1871a4d: mov qword ptr [rbp + 0xf0], rbx
0x1871a54: mov rax, qword ptr [rbx]
0x1871a57: mov rcx, rbx
0x1871a5a: call qword ptr [rax + 8]
0x1871a5d: nop 
0x1871a5e: mov byte ptr [rdi + 0x60], 0
0x1871a62: jmp 0x141871d2d
0x1871a67: inc word ptr [rdi + 0x58]
0x1871a6b: lea rcx, [rdi + 0x5c]
0x1871a6f: mov r15, qword ptr [rbp + 0x118]
0x1871a76: mov dword ptr [r15], eax
0x1871a79: mov dword ptr [rcx], 0xffffffff
0x1871a7f: mov rax, qword ptr [r14]
0x1871a82: mov rcx, r14
0x1871a85: call qword ptr [rax + 0x10]
0x1871a88: xor ebx, ebx
0x1871a8a: mov qword ptr [rbp + 0xa8], rbx
0x1871a91: mov qword ptr [rbp + 0xb0], 0x105
0x1871a9c: mov dword ptr [rbp + 0xb4], ebx
0x1871aa2: mov byte ptr [rbp - 0x60], bl
0x1871aa5: mov dword ptr [rbp + 0xb4], ebx
0x1871aab: mov byte ptr [rbp - 0x60], bl
0x1871aae: mov rax, qword ptr [rbp + 0xa8]
0x1871ab5: test rax, rax
0x1871ab8: je 0x141871abc
0x1871aba: mov byte ptr [rax], bl
0x1871abc: mov eax, dword ptr [r15]
0x1871abf: mov dword ptr [rbp + 0xf0], eax
0x1871ac5: mov dword ptr [rbp + 0xb4], 0xffffffff
0x1871acf: lea rcx, [rbp - 0x60]
0x1871ad3: mov rax, qword ptr [rbp + 0xa8]
0x1871ada: test rax, rax
0x1871add: cmovne rcx, rax
0x1871ae1: lea rax, [rbp + 0xf0]
0x1871ae8: mov qword ptr [rsp + 0x20], rax
0x1871aed: lea r9, [rip + 0x3f37a14]
0x1871af4: lea r8, [rip + 0x3d1d33d]
0x1871afb: mov edx, dword ptr [rbp + 0xb0]
0x1871b01: call 0x14066efb0
0x1871b06: mov r14, qword ptr [rdi + 0x50]
0x1871b0a: mov r8, qword ptr [rbp + 0xa8]
0x1871b11: add r14, 0x18
0x1871b15: test r8, r8
0x1871b18: je 0x141871b24
0x1871b1a: mov qword ptr [rsp + 0x70], r8
0x1871b1f: mov rcx, r8
0x1871b22: jmp 0x141871b30
0x1871b24: lea rcx, [rbp - 0x60]
0x1871b28: mov r8, rcx
0x1871b2b: mov qword ptr [rsp + 0x70], rcx
0x1871b30: mov rax, 0xffffffffffffffff
0x1871b37: inc rax
0x1871b3a: cmp byte ptr [rcx + rax], 0
0x1871b3e: jne 0x141871b37
0x1871b40: mov dword ptr [rsp + 0x78], eax
0x1871b44: vmovups xmm0, xmmword ptr [rsp + 0x70]
0x1871b4a: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x1871b4f: cmp dword ptr [r14 + 4], 0
0x1871b54: je 0x141871ca7
0x1871b5a: lea rcx, [rbp - 0x70]
0x1871b5e: mov qword ptr [rsp + 0x70], rcx
0x1871b63: mov edx, eax
0x1871b65: mov rcx, r8
0x1871b68: call 0x141364780
0x1871b6d: lea r9, [rbp + 0xf0]
0x1871b74: lea r8, [rsp + 0x70]
0x1871b79: mov edx, eax
0x1871b7b: mov rcx, r14
0x1871b7e: call 0x140612620
0x1871b83: test rax, rax
0x1871b86: je 0x141871ca7
0x1871b8c: add rax, 0x10
0x1871b90: je 0x141871ca7
0x1871b96: mov rdx, qword ptr [rax]
0x1871b99: test rdx, rdx
0x1871b9c: je 0x141871ca7
0x1871ba2: mov rcx, qword ptr [rdi + 0x50]
0x1871ba6: call 0x142355700
0x1871bab: test al, al
0x1871bad: jne 0x141871c3e
0x1871bb3: lea rax, [rbp - 0x60]
0x1871bb7: mov qword ptr [rsp + 0x60], rax
0x1871bbc: lea rax, [rip + 0x3f6971d]
0x1871bc3: mov qword ptr [rsp + 0x58], rax
0x1871bc8: mov dword ptr [rsp + 0x50], 6
0x1871bd0: mov eax, dword ptr [rip + 0x5485d2a]
0x1871bd6: mov dword ptr [rsp + 0x48], eax
0x1871bda: mov cl, 1
0x1871bdc: call 0x141351ab0
0x1871be1: mov eax, dword ptr [rip + 0x5485d19]
0x1871be7: mov dword ptr [rsi], eax
0x1871be9: mov rcx, qword ptr [rbp + 0xa8]
0x1871bf0: test rcx, rcx
0x1871bf3: je 0x141871c21
0x1871bf5: mov r8d, 0x1fd
0x1871bfb: mov rax, qword ptr gs:[0x58]
0x1871c04: mov rdx, qword ptr [rax]
0x1871c07: cmp byte ptr [r8 + rdx], 0
0x1871c0c: je 0x141871c15
0x1871c0e: call 0x1447f03bc
0x1871c13: jmp 0x141871c1a
0x1871c15: call 0x1447f02bc
0x1871c1a: mov qword ptr [rbp + 0xa8], rbx
0x1871c21: mov rbx, qword ptr [rdi]
0x1871c24: mov qword ptr [rbp + 0xf0], rbx
0x1871c2b: mov rax, qword ptr [rbx]
0x1871c2e: mov rcx, rbx
0x1871c31: call qword ptr [rax + 8]
0x1871c34: nop 
0x1871c35: mov byte ptr [rdi + 0x60], 0
0x1871c39: jmp 0x141871d2d
0x1871c3e: mov r8d, dword ptr [r15]
0x1871c41: mov rdx, qword ptr [r13 + 0xa0]
0x1871c48: mov rcx, rdi
0x1871c4b: call 0x141870df0
0x1871c50: mov dword ptr [rsi], ebx
0x1871c52: mov rcx, qword ptr [rbp + 0xa8]
0x1871c59: test rcx, rcx
0x1871c5c: je 0x141871c8a
0x1871c5e: mov r8d, 0x1fd
0x1871c64: mov rax, qword ptr gs:[0x58]
0x1871c6d: mov rdx, qword ptr [rax]
0x1871c70: cmp byte ptr [r8 + rdx], 0
0x1871c75: je 0x141871c7e
0x1871c77: call 0x1447f03bc
0x1871c7c: jmp 0x141871c83
0x1871c7e: call 0x1447f02bc
0x1871c83: mov qword ptr [rbp + 0xa8], rbx
0x1871c8a: mov rbx, qword ptr [rdi]
0x1871c8d: mov qword ptr [rbp + 0xf0], rbx
0x1871c94: mov rax, qword ptr [rbx]
0x1871c97: mov rcx, rbx
0x1871c9a: call qword ptr [rax + 8]
0x1871c9d: nop 
0x1871c9e: mov byte ptr [rdi + 0x60], 0
0x1871ca2: jmp 0x141871d2d
0x1871ca7: lea rax, [rbp - 0x60]
0x1871cab: mov qword ptr [rsp + 0x60], rax
0x1871cb0: lea rax, [rip + 0x3f696d1]
0x1871cb7: mov qword ptr [rsp + 0x58], rax
0x1871cbc: mov dword ptr [rsp + 0x50], 6
0x1871cc4: mov eax, dword ptr [rip + 0x5485c36]
0x1871cca: mov dword ptr [rsp + 0x48], eax
0x1871cce: mov cl, 1
0x1871cd0: call 0x141351ab0
0x1871cd5: mov eax, dword ptr [rip + 0x5485c25]
0x1871cdb: mov dword ptr [rsi], eax
0x1871cdd: mov rcx, qword ptr [rbp + 0xa8]
0x1871ce4: test rcx, rcx
0x1871ce7: je 0x141871d15
0x1871ce9: mov r8d, 0x1fd
0x1871cef: mov rax, qword ptr gs:[0x58]
0x1871cf8: mov rdx, qword ptr [rax]
0x1871cfb: cmp byte ptr [r8 + rdx], 0
0x1871d00: je 0x141871d09
0x1871d02: call 0x1447f03bc
0x1871d07: jmp 0x141871d0e
0x1871d09: call 0x1447f02bc
0x1871d0e: mov qword ptr [rbp + 0xa8], rbx
0x1871d15: mov rbx, qword ptr [rdi]
0x1871d18: mov qword ptr [rbp + 0xf0], rbx
0x1871d1f: mov rax, qword ptr [rbx]
0x1871d22: mov rcx, rbx
0x1871d25: call qword ptr [rax + 8]
0x1871d28: nop 
0x1871d29: mov byte ptr [rdi + 0x60], 0
0x1871d2d: mov rax, qword ptr [rbx]
0x1871d30: mov rcx, rbx
0x1871d33: call qword ptr [rax + 0x10]
0x1871d36: mov rax, rsi
0x1871d39: lea r11, [rsp + 0x1c0]
0x1871d41: mov rbx, qword ptr [r11 + 0x38]
0x1871d45: mov rsi, qword ptr [r11 + 0x40]
0x1871d49: mov rsp, r11
0x1871d4c: pop r15
0x1871d4e: pop r14
0x1871d50: pop r13
0x1871d52: pop rdi
0x1871d53: pop rbp
0x1871d54: ret 