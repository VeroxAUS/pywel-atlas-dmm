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