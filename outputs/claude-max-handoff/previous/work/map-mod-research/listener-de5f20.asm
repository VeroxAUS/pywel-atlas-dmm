0xde5f20: mov qword ptr [rsp + 8], rbx
0xde5f25: mov qword ptr [rsp + 0x10], rsi
0xde5f2a: mov qword ptr [rsp + 0x18], rdi
0xde5f2f: push rbp
0xde5f30: push r12
0xde5f32: push r13
0xde5f34: push r14
0xde5f36: push r15
0xde5f38: lea rbp, [rsp - 0x1f]
0xde5f3d: sub rsp, 0xa0
0xde5f44: mov r12, r8
0xde5f47: mov rsi, rdx
0xde5f4a: mov r15, rcx
0xde5f4d: xor r13d, r13d
0xde5f50: mov qword ptr [r8], r13
0xde5f53: lea r8, [rip + 0x478d552]
0xde5f5a: mov rdx, r9
0xde5f5d: mov rcx, qword ptr [rcx + 8]
0xde5f61: call 0x143eda3d0
0xde5f66: mov rdi, rax
0xde5f69: lea rax, [rbp - 0x31]
0xde5f6d: mov qword ptr [rbp - 0x41], rax
0xde5f71: mov dword ptr [rbp - 0x39], r13d
0xde5f75: mov dword ptr [rbp - 0x35], 0xa
0xde5f7c: mov rax, qword ptr [r15 + 8]
0xde5f80: mov qword ptr [rbp - 0x61], rax
0xde5f84: mov qword ptr [rbp - 0x59], r13
0xde5f88: test rdi, rdi
0xde5f8b: je 0x140de5fcb
0xde5f8d: cmp byte ptr [rdi], r13b
0xde5f90: je 0x140de5fcb
0xde5f92: mov rbx, 0xffffffffffffffff
0xde5f99: nop dword ptr [rax]
0xde5fa0: inc rbx
0xde5fa3: cmp byte ptr [rdi + rbx], 0
0xde5fa7: jne 0x140de5fa0
0xde5fa9: mov ecx, ebx
0xde5fab: call 0x1414203f0
0xde5fb0: mov r14, rax
0xde5fb3: lea edx, [rbx + 1]
0xde5fb6: mov r9, 0xffffffffffffffff
0xde5fbd: mov r8, rdi
0xde5fc0: mov rcx, qword ptr [rax]
0xde5fc3: call qword ptr [rip + 0x44064e7]
0xde5fc9: jmp 0x140de5fd2
0xde5fcb: lea r14, [rip + 0x5c7f96e]
0xde5fd2: mov qword ptr [rbp - 0x59], r14
0xde5fd6: mov qword ptr [rbp - 0x51], 1
0xde5fde: mov word ptr [rbp - 0x49], 0x100
0xde5fe4: mov byte ptr [rbp - 0x49], 0
0xde5fe8: lea rdx, [rbp - 0x41]
0xde5fec: lea rcx, [rbp - 0x61]
0xde5ff0: call 0x143d1dab0
0xde5ff5: nop 
0xde5ff6: lea rcx, [rbp - 0x59]
0xde5ffa: call 0x140394db0
0xde5fff: cmp dword ptr [rbp - 0x39], 0
0xde6003: jne 0x140de6012
0xde6005: mov eax, dword ptr [rip + 0x5ef5b25]
0xde600b: mov dword ptr [rsi], eax
0xde600d: jmp 0x140de6094
0xde6012: mov rax, qword ptr [rbp - 0x41]
0xde6016: mov rbx, qword ptr [rax]
0xde6019: mov rax, qword ptr [rbx + 0xa0]
0xde6020: test rax, rax
0xde6023: je 0x140de602c
0xde6025: cmp qword ptr [rax + 8], 0
0xde602a: jne 0x140de608c
0xde602c: mov rbx, qword ptr [rbx + 0xd8]
0xde6033: test rbx, rbx
0xde6036: jne 0x140de6053
0xde6038: test rax, rax
0xde603b: je 0x140de608c
0xde603d: mov rcx, qword ptr [rax + 0x58]
0xde6041: test rcx, rcx
0xde6044: je 0x140de608c
0xde6046: call 0x143ed84d0
0xde604b: mov rbx, rax
0xde604e: test rax, rax
0xde6051: je 0x140de608c
0xde6053: mov rcx, qword ptr [rbx]
0xde6056: mov r8, qword ptr [rcx + 0x190]
0xde605d: lea rdx, [rip + 0x5ee9164]
0xde6064: mov rcx, rbx
0xde6067: call r8
0xde606a: test al, al
0xde606c: cmove rbx, r13
0xde6070: mov qword ptr [r12], rbx
0xde6074: test rbx, rbx
0xde6077: jne 0x140de6083
0xde6079: mov eax, dword ptr [rip + 0x5ef5ab5]
0xde607f: mov dword ptr [rsi], eax
0xde6081: jmp 0x140de6094
0xde6083: mov qword ptr [rbx + 0x28], r15
0xde6087: mov dword ptr [rsi], r13d
0xde608a: jmp 0x140de6094
0xde608c: mov eax, dword ptr [rip + 0x5ef5aa2]
0xde6092: mov dword ptr [rsi], eax
0xde6094: lea rax, [rbp - 0x31]
0xde6098: mov rcx, qword ptr [rbp - 0x41]
0xde609c: cmp rcx, rax
0xde609f: je 0x140de60cb
0xde60a1: test rcx, rcx
0xde60a4: je 0x140de60cb
0xde60a6: mov rax, qword ptr gs:[0x58]
0xde60af: mov rdx, qword ptr [rax]
0xde60b2: mov r8d, 0x1fd
0xde60b8: cmp byte ptr [r8 + rdx], 0
0xde60bd: je 0x140de60c6
0xde60bf: call 0x1447f03bc
0xde60c4: jmp 0x140de60cb
0xde60c6: call 0x1447f02bc
0xde60cb: mov rax, rsi
0xde60ce: lea r11, [rsp + 0xa0]
0xde60d6: mov rbx, qword ptr [r11 + 0x30]
0xde60da: mov rsi, qword ptr [r11 + 0x38]
0xde60de: mov rdi, qword ptr [r11 + 0x40]
0xde60e2: mov rsp, r11
0xde60e5: pop r15
0xde60e7: pop r14
0xde60e9: pop r13
0xde60eb: pop r12
0xde60ed: pop rbp
0xde60ee: ret 