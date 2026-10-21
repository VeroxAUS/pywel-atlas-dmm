0x40fac0: mov qword ptr [rsp + 0x18], rbx
0x40fac5: mov qword ptr [rsp + 0x20], r9
0x40faca: mov qword ptr [rsp + 0x10], rdx
0x40facf: push rbp
0x40fad0: push rsi
0x40fad1: push rdi
0x40fad2: push r12
0x40fad4: push r13
0x40fad6: push r14
0x40fad8: push r15
0x40fada: sub rsp, 0x30
0x40fade: mov esi, r8d
0x40fae1: mov r14, rdx
0x40fae4: mov rdi, rcx
0x40fae7: cmp dword ptr [rcx], 0
0x40faea: jne 0x14040faf4
0x40faec: mov edx, r8d
0x40faef: call 0x140391680
0x40faf4: mov r10d, dword ptr [rdi]
0x40faf7: test r10d, r10d
0x40fafa: je 0x14040fb49
0x40fafc: xor edx, edx
0x40fafe: mov eax, esi
0x40fb00: div r10d
0x40fb03: mov r8d, edx
0x40fb06: shl r8, 8
0x40fb0a: add r8, qword ptr [rdi + 0x10]
0x40fb0e: xor edx, edx
0x40fb10: mov r9d, dword ptr [r8]
0x40fb13: test r9d, r9d
0x40fb16: je 0x14040fb49
0x40fb18: cmp dword ptr [r8 + rdx*8 + 8], esi
0x40fb1d: jne 0x14040fb42
0x40fb1f: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0x40fb24: mov rax, qword ptr [rdi + 0x18]
0x40fb28: mov rbx, qword ptr [rax + rcx*8]
0x40fb2c: mov rcx, qword ptr [r14]
0x40fb2f: mov eax, dword ptr [rcx]
0x40fb31: cmp dword ptr [rbx + 4], eax
0x40fb34: jne 0x14040fb42
0x40fb36: mov eax, dword ptr [rcx + 4]
0x40fb39: cmp dword ptr [rbx + 8], eax
0x40fb3c: je 0x14040fc08
0x40fb42: inc edx
0x40fb44: cmp edx, r9d
0x40fb47: jb 0x14040fb18
0x40fb49: mov rax, qword ptr [rsp + 0x98]
0x40fb51: mov byte ptr [rax], 0
0x40fb54: xor edx, edx
0x40fb56: mov eax, esi
0x40fb58: div r10d
0x40fb5b: mov ecx, edx
0x40fb5d: shl rcx, 8
0x40fb61: mov rax, qword ptr [rdi + 0x10]
0x40fb65: cmp dword ptr [rcx + rax], 0x1f
0x40fb69: jne 0x14040fb7b
0x40fb6b: mov edx, esi
0x40fb6d: mov rcx, rdi
0x40fb70: call 0x140391680
0x40fb75: xor edx, edx
0x40fb77: mov eax, esi
0x40fb79: div dword ptr [rdi]
0x40fb7b: mov r12d, edx
0x40fb7e: shl r12, 8
0x40fb82: add r12, qword ptr [rdi + 0x10]
0x40fb86: mov ecx, dword ptr [r12]
0x40fb8a: mov dword ptr [rsp + 0xb0], ecx
0x40fb91: imul eax, edx, 0x1f
0x40fb94: add eax, ecx
0x40fb96: mov dword ptr [rsp + 0x70], eax
0x40fb9a: mov r13d, dword ptr [rdi + 4]
0x40fb9e: mov dword ptr [rsp + 0x90], r13d
0x40fba6: lea r15, [rdi + 8]
0x40fbaa: mov ecx, dword ptr [r15]
0x40fbad: lea rbp, [rdi + 4]
0x40fbb1: mov edx, 0x1fd
0x40fbb6: cmp r13d, ecx
0x40fbb9: jb 0x14040fcd9
0x40fbbf: lea eax, [r13 + 1]
0x40fbc3: lea rbp, [rdi + 4]
0x40fbc7: cmp eax, ecx
0x40fbc9: jbe 0x14040fcd9
0x40fbcf: lea r13d, [rax*2 + 1]
0x40fbd7: add r13d, eax
0x40fbda: shr r13d, 1
0x40fbdd: lea ecx, [r13*8]
0x40fbe5: mov rax, qword ptr gs:[0x58]
0x40fbee: mov rax, qword ptr [rax]
0x40fbf1: mov qword ptr [rsp + 0x20], rax
0x40fbf6: cmp byte ptr [rdx + rax], 0
0x40fbfa: mov edx, 0x40
0x40fbff: je 0x14040fc21
0x40fc01: call 0x1447efa78
0x40fc06: jmp 0x14040fc26
0x40fc08: test rbx, rbx
0x40fc0b: je 0x14040fb49
0x40fc11: mov rax, qword ptr [rsp + 0x98]
0x40fc19: mov byte ptr [rax], 1
0x40fc1c: jmp 0x14040fd94
0x40fc21: call 0x1447ef9b0
0x40fc26: mov r14, rax
0x40fc29: lea rbp, [rdi + 4]
0x40fc2d: test rax, rax
0x40fc30: jne 0x14040fc55
0x40fc32: call 0x141318e70
0x40fc37: xor r9d, r9d
0x40fc3a: xor r8d, r8d
0x40fc3d: mov edx, 1
0x40fc42: mov ecx, 0xa0000002
0x40fc47: call qword ptr [rip + 0x4ddb4fb]
0x40fc4d: lea rbp, [rdi + 4]
0x40fc51: lea r15, [rdi + 8]
0x40fc55: lea rbx, [rdi + 0x18]
0x40fc59: cmp qword ptr [rbx], 0
0x40fc5d: je 0x14040fcc1
0x40fc5f: xor r8d, r8d
0x40fc62: mov rcx, rbx
0x40fc65: cmp dword ptr [rbp], r8d
0x40fc69: jbe 0x14040fc94
0x40fc6b: nop dword ptr [rax + rax]
0x40fc70: lea rdx, [r8*8]
0x40fc78: mov rax, qword ptr [rbx]
0x40fc7b: mov rcx, qword ptr [rdx + rax]
0x40fc7f: mov qword ptr [rdx + r14], rcx
0x40fc83: inc r8d
0x40fc86: cmp r8d, dword ptr [rbp]
0x40fc8a: jb 0x14040fc70
0x40fc8c: lea rcx, [rdi + 0x18]
0x40fc90: lea r15, [rdi + 8]
0x40fc94: mov rbx, rcx
0x40fc97: mov rcx, qword ptr [rcx]
0x40fc9a: test rcx, rcx
0x40fc9d: je 0x14040fcbd
0x40fc9f: mov rax, qword ptr [rsp + 0x20]
0x40fca4: mov r8d, 0x1fd
0x40fcaa: cmp byte ptr [r8 + rax], 0
0x40fcaf: je 0x14040fcb8
0x40fcb1: call 0x1447f03bc
0x40fcb6: jmp 0x14040fcbd
0x40fcb8: call 0x1447f02bc
0x40fcbd: lea rbp, [rdi + 4]
0x40fcc1: mov qword ptr [rbx], r14
0x40fcc4: mov dword ptr [r15], r13d
0x40fcc7: mov r14, qword ptr [rsp + 0x78]
0x40fccc: mov r13d, dword ptr [rsp + 0x90]
0x40fcd4: mov edx, 0x1fd
0x40fcd9: mov eax, dword ptr [rsp + 0xb0]
0x40fce0: mov dword ptr [r12 + rax*8 + 8], esi
0x40fce5: mov dword ptr [r12 + rax*8 + 0xc], r13d
0x40fcea: inc dword ptr [r12]
0x40fcee: mov rax, qword ptr gs:[0x58]
0x40fcf7: mov rcx, qword ptr [rax]
0x40fcfa: cmp byte ptr [rdx + rcx], 0
0x40fcfe: mov edx, 8
0x40fd03: mov ecx, 0x20
0x40fd08: je 0x14040fd11
0x40fd0a: call 0x1447efa78
0x40fd0f: jmp 0x14040fd16
0x40fd11: call 0x1447ef9b0
0x40fd16: mov rbx, rax
0x40fd19: test rax, rax
0x40fd1c: jne 0x14040fd3d
0x40fd1e: call 0x141318e70
0x40fd23: xor r9d, r9d
0x40fd26: xor r8d, r8d
0x40fd29: mov edx, 1
0x40fd2e: mov ecx, 0xa0000002
0x40fd33: call qword ptr [rip + 0x4ddb40f]
0x40fd39: lea rbp, [rdi + 4]
0x40fd3d: mov qword ptr [rsp + 0x20], rbx
0x40fd42: mov rax, qword ptr [r14]
0x40fd45: mov rcx, qword ptr [rax]
0x40fd48: mov eax, dword ptr [rsp + 0x70]
0x40fd4c: mov dword ptr [rbx], eax
0x40fd4e: mov qword ptr [rbx + 4], rcx
0x40fd52: xor ecx, ecx
0x40fd54: mov qword ptr [rbx + 0x10], rcx
0x40fd58: mov qword ptr [rbx + 0x18], rcx
0x40fd5c: mov rdx, qword ptr [rsp + 0x88]
0x40fd64: mov rax, qword ptr [rdx]
0x40fd67: mov qword ptr [rbx + 0x10], rax
0x40fd6b: mov qword ptr [rdx], rcx
0x40fd6e: mov ecx, dword ptr [rbx + 0x18]
0x40fd71: mov eax, dword ptr [rdx + 8]
0x40fd74: mov dword ptr [rbx + 0x18], eax
0x40fd77: mov dword ptr [rdx + 8], ecx
0x40fd7a: mov ecx, dword ptr [rbx + 0x1c]
0x40fd7d: mov eax, dword ptr [rdx + 0xc]
0x40fd80: mov dword ptr [rbx + 0x1c], eax
0x40fd83: mov dword ptr [rdx + 0xc], ecx
0x40fd86: mov ecx, r13d
0x40fd89: mov rax, qword ptr [rdi + 0x18]
0x40fd8d: mov qword ptr [rax + rcx*8], rbx
0x40fd91: inc dword ptr [rbp]
0x40fd94: lea rcx, [rbx + 4]
0x40fd98: mov rax, qword ptr [rsp + 0xa0]
0x40fda0: mov qword ptr [rax], rcx
0x40fda3: lea rcx, [rbx + 0x10]
0x40fda7: mov rax, qword ptr [rsp + 0xa8]
0x40fdaf: mov qword ptr [rax], rcx
0x40fdb2: mov rbx, qword ptr [rsp + 0x80]
0x40fdba: add rsp, 0x30
0x40fdbe: pop r15
0x40fdc0: pop r14
0x40fdc2: pop r13
0x40fdc4: pop r12
0x40fdc6: pop rdi
0x40fdc7: pop rsi
0x40fdc8: pop rbp
0x40fdc9: ret 