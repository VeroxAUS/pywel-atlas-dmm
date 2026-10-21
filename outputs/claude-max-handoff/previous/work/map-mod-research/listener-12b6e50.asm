0x12b6e50: mov qword ptr [rsp + 8], rbx
0x12b6e55: mov qword ptr [rsp + 0x10], rsi
0x12b6e5a: mov qword ptr [rsp + 0x18], rdi
0x12b6e5f: mov qword ptr [rsp + 0x20], r14
0x12b6e64: push rbp
0x12b6e65: lea rbp, [rsp - 0x580]
0x12b6e6d: sub rsp, 0x680
0x12b6e74: mov r14, rdx
0x12b6e77: mov r10, rcx
0x12b6e7a: mov rax, qword ptr [rdx + 8]
0x12b6e7e: mov r8d, dword ptr [rax + 0x14]
0x12b6e82: cmp dword ptr [rcx + 4], 0
0x12b6e86: je 0x1412b70a2
0x12b6e8c: mov ecx, dword ptr [rcx]
0x12b6e8e: test ecx, ecx
0x12b6e90: je 0x1412b70a2
0x12b6e96: xor edx, edx
0x12b6e98: mov eax, r8d
0x12b6e9b: div ecx
0x12b6e9d: mov r11d, edx
0x12b6ea0: shl r11, 8
0x12b6ea4: add r11, qword ptr [r10 + 0x10]
0x12b6ea8: xor edx, edx
0x12b6eaa: mov ebx, dword ptr [r11]
0x12b6ead: test ebx, ebx
0x12b6eaf: je 0x1412b70a2
0x12b6eb5: cmp dword ptr [r11 + rdx*8 + 8], r8d
0x12b6eba: jne 0x1412b6ecf
0x12b6ebc: mov ecx, dword ptr [r11 + rdx*8 + 0xc]
0x12b6ec1: mov rax, qword ptr [r10 + 0x18]
0x12b6ec5: mov r9, qword ptr [rax + rcx*8]
0x12b6ec9: cmp dword ptr [r9 + 4], r8d
0x12b6ecd: je 0x1412b6eda
0x12b6ecf: inc edx
0x12b6ed1: cmp edx, ebx
0x12b6ed3: jb 0x1412b6eb5
0x12b6ed5: jmp 0x1412b70a2
0x12b6eda: lea rdi, [r9 + 8]
0x12b6ede: test rdi, rdi
0x12b6ee1: je 0x1412b70a2
0x12b6ee7: mov rsi, qword ptr [rdi]
0x12b6eea: mov ebx, dword ptr [rdi + 8]
0x12b6eed: lea rax, [rsp + 0x30]
0x12b6ef2: mov qword ptr [rsp + 0x20], rax
0x12b6ef7: mov dword ptr [rsp + 0x28], 0
0x12b6eff: mov dword ptr [rsp + 0x2c], 0x64
0x12b6f07: mov eax, dword ptr [rsp + 0x2c]
0x12b6f0b: mov ecx, dword ptr [rsp + 0x28]
0x12b6f0f: sub eax, ecx
0x12b6f11: cmp ebx, eax
0x12b6f13: jbe 0x1412b6f32
0x12b6f15: lea r8d, [rbx + rcx]
0x12b6f19: mov r9d, 8
0x12b6f1f: lea rdx, [rsp + 0x30]
0x12b6f24: lea rcx, [rsp + 0x20]
0x12b6f29: call 0x140392380
0x12b6f2e: mov ecx, dword ptr [rsp + 0x28]
0x12b6f32: mov r8, rbx
0x12b6f35: shl r8, 3
0x12b6f39: mov rax, qword ptr [rsp + 0x20]
0x12b6f3e: lea rcx, [rax + rcx*8]
0x12b6f42: mov rdx, rsi
0x12b6f45: call 0x144898e1e
0x12b6f4a: add dword ptr [rsp + 0x28], ebx
0x12b6f4e: mov rbx, qword ptr [rsp + 0x20]
0x12b6f53: mov eax, dword ptr [rsp + 0x28]
0x12b6f57: lea rsi, [rbx + rax*8]
0x12b6f5b: cmp rbx, rsi
0x12b6f5e: je 0x1412b6f7e
0x12b6f60: mov rax, qword ptr [rbx]
0x12b6f63: mov rcx, qword ptr [rax]
0x12b6f66: cmp byte ptr [rcx + 8], 0
0x12b6f6a: je 0x1412b6f75
0x12b6f6c: mov rax, qword ptr [rcx]
0x12b6f6f: mov rdx, r14
0x12b6f72: call qword ptr [rax + 8]
0x12b6f75: add rbx, 8
0x12b6f79: cmp rbx, rsi
0x12b6f7c: jne 0x1412b6f60
0x12b6f7e: lea rax, [rsp + 0x30]
0x12b6f83: mov r14d, 0x1fd
0x12b6f89: mov rcx, qword ptr [rsp + 0x20]
0x12b6f8e: cmp rcx, rax
0x12b6f91: je 0x1412b6fb7
0x12b6f93: test rcx, rcx
0x12b6f96: je 0x1412b6fb7
0x12b6f98: mov rax, qword ptr gs:[0x58]
0x12b6fa1: mov rdx, qword ptr [rax]
0x12b6fa4: cmp byte ptr [r14 + rdx], 0
0x12b6fa9: je 0x1412b6fb2
0x12b6fab: call 0x1447f03bc
0x12b6fb0: jmp 0x1412b6fb7
0x12b6fb2: call 0x1447f02bc
0x12b6fb7: mov rsi, qword ptr [rdi + 0x10]
0x12b6fbb: mov ebx, dword ptr [rdi + 0x18]
0x12b6fbe: lea rax, [rbp + 0x260]
0x12b6fc5: mov qword ptr [rbp + 0x250], rax
0x12b6fcc: mov dword ptr [rbp + 0x258], 0
0x12b6fd6: mov dword ptr [rbp + 0x25c], 0x64
0x12b6fe0: mov eax, dword ptr [rbp + 0x25c]
0x12b6fe6: mov ecx, dword ptr [rbp + 0x258]
0x12b6fec: sub eax, ecx
0x12b6fee: cmp ebx, eax
0x12b6ff0: jbe 0x1412b7015
0x12b6ff2: lea r8d, [rbx + rcx]
0x12b6ff6: mov r9d, 8
0x12b6ffc: lea rdx, [rbp + 0x260]
0x12b7003: lea rcx, [rbp + 0x250]
0x12b700a: call 0x140392380
0x12b700f: mov ecx, dword ptr [rbp + 0x258]
0x12b7015: mov r8, rbx
0x12b7018: shl r8, 3
0x12b701c: mov rax, qword ptr [rbp + 0x250]
0x12b7023: lea rcx, [rax + rcx*8]
0x12b7027: mov rdx, rsi
0x12b702a: call 0x144898e1e
0x12b702f: add dword ptr [rbp + 0x258], ebx
0x12b7035: mov rbx, qword ptr [rbp + 0x250]
0x12b703c: mov eax, dword ptr [rbp + 0x258]
0x12b7042: lea rdi, [rbx + rax*8]
0x12b7046: cmp rbx, rdi
0x12b7049: je 0x1412b706b
0x12b704b: nop dword ptr [rax + rax]
0x12b7050: mov rax, qword ptr [rbx]
0x12b7053: mov rcx, qword ptr [rax]
0x12b7056: cmp byte ptr [rcx + 8], 0
0x12b705a: je 0x1412b7062
0x12b705c: mov rax, qword ptr [rcx]
0x12b705f: call qword ptr [rax + 0x10]
0x12b7062: add rbx, 8
0x12b7066: cmp rbx, rdi
0x12b7069: jne 0x1412b7050
0x12b706b: lea rax, [rbp + 0x260]
0x12b7072: mov rcx, qword ptr [rbp + 0x250]
0x12b7079: cmp rcx, rax
0x12b707c: je 0x1412b70a2
0x12b707e: test rcx, rcx
0x12b7081: je 0x1412b70a2
0x12b7083: mov rax, qword ptr gs:[0x58]
0x12b708c: mov rdx, qword ptr [rax]
0x12b708f: cmp byte ptr [r14 + rdx], 0
0x12b7094: je 0x1412b709d
0x12b7096: call 0x1447f03bc
0x12b709b: jmp 0x1412b70a2
0x12b709d: call 0x1447f02bc
0x12b70a2: lea r11, [rsp + 0x680]
0x12b70aa: mov rbx, qword ptr [r11 + 0x10]
0x12b70ae: mov rsi, qword ptr [r11 + 0x18]
0x12b70b2: mov rdi, qword ptr [r11 + 0x20]
0x12b70b6: mov r14, qword ptr [r11 + 0x28]
0x12b70ba: mov rsp, r11
0x12b70bd: pop rbp
0x12b70be: ret 