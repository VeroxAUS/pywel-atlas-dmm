0xdb3bd0: mov qword ptr [rsp + 8], rbx
0xdb3bd5: mov qword ptr [rsp + 0x20], r9
0xdb3bda: mov qword ptr [rsp + 0x10], rdx
0xdb3bdf: push rbp
0xdb3be0: push rsi
0xdb3be1: push rdi
0xdb3be2: push r12
0xdb3be4: push r13
0xdb3be6: push r14
0xdb3be8: push r15
0xdb3bea: lea rbp, [rsp - 7]
0xdb3bef: sub rsp, 0xa0
0xdb3bf6: mov r13, r8
0xdb3bf9: mov rbx, rcx
0xdb3bfc: xor edi, edi
0xdb3bfe: mov rcx, rdx
0xdb3c01: call 0x140537250
0xdb3c06: mov r8, r13
0xdb3c09: mov rdx, rax
0xdb3c0c: mov rcx, rbx
0xdb3c0f: call 0x140def2d0
0xdb3c14: test al, al
0xdb3c16: je 0x140db3c1f
0xdb3c18: xor eax, eax
0xdb3c1a: jmp 0x140db43ca
0xdb3c1f: mov rax, qword ptr [rbx]
0xdb3c22: mov rcx, rbx
0xdb3c25: call qword ptr [rax + 0x110]
0xdb3c2b: mov r12, qword ptr [rax + 0x31200]
0xdb3c32: mov dword ptr [rbp + 0x87], edi
0xdb3c38: mov esi, 1
0xdb3c3d: mov r9d, 0x2ffff
0xdb3c43: mov r8d, esi
0xdb3c46: mov rdx, qword ptr [rbp + 0x97]
0xdb3c4d: lea rcx, [rbp + 0x87]
0xdb3c54: call 0x1412becb0
0xdb3c59: mov dword ptr [rbp + 0x77], edi
0xdb3c5c: mov r9d, 0x2ffff
0xdb3c62: mov r8d, esi
0xdb3c65: lea rdx, [rip + 0x48b6b84]
0xdb3c6c: lea rcx, [rbp + 0x77]
0xdb3c70: call 0x1412becb0
0xdb3c75: lea rax, [rbp + 0x87]
0xdb3c7c: mov qword ptr [rsp + 0x20], rax
0xdb3c81: lea r9, [rbp + 0x77]
0xdb3c85: mov r8, qword ptr [rbx + 8]
0xdb3c89: lea rdx, [rbp - 0x31]
0xdb3c8d: mov rcx, r12
0xdb3c90: call 0x143d2f5b0
0xdb3c95: nop 
0xdb3c96: mov r15, 0xffffffffffffffff
0xdb3c9d: mov rax, qword ptr [rbp - 0x31]
0xdb3ca1: test rax, rax
0xdb3ca4: je 0x140db438b
0xdb3caa: mov rdi, rax
0xdb3cad: cmp qword ptr [rax + 0xa0], 0
0xdb3cb5: jne 0x140db3cc3
0xdb3cb7: mov rcx, rax
0xdb3cba: call 0x140f02840
0xdb3cbf: mov rax, qword ptr [rbp - 0x31]
0xdb3cc3: mov rcx, qword ptr [rdi + 0xa0]
0xdb3cca: test rcx, rcx
0xdb3ccd: je 0x140db3cda
0xdb3ccf: mov dword ptr [rcx + 0x8c], r15d
0xdb3cd6: mov rax, qword ptr [rbp - 0x31]
0xdb3cda: mov rcx, qword ptr [rax + 0xa0]
0xdb3ce1: test rcx, rcx
0xdb3ce4: je 0x140db3cf1
0xdb3ce6: cmp qword ptr [rcx + 8], 0
0xdb3ceb: jne 0x140db42dd
0xdb3cf1: mov rsi, qword ptr [rax + 0xd8]
0xdb3cf8: test rsi, rsi
0xdb3cfb: jne 0x140db3d24
0xdb3cfd: test rcx, rcx
0xdb3d00: je 0x140db42d8
0xdb3d06: mov rcx, qword ptr [rcx + 0x58]
0xdb3d0a: test rcx, rcx
0xdb3d0d: je 0x140db42d8
0xdb3d13: call 0x143ed84d0
0xdb3d18: mov rsi, rax
0xdb3d1b: test rax, rax
0xdb3d1e: je 0x140db42d8
0xdb3d24: mov rax, qword ptr [rsi]
0xdb3d27: lea rdx, [rip + 0x5f1c3a2]
0xdb3d2e: mov rcx, rsi
0xdb3d31: call qword ptr [rax + 0x190]
0xdb3d37: test al, al
0xdb3d39: mov ecx, 0
0xdb3d3e: cmove rsi, rcx
0xdb3d42: mov edi, 0x1b0
0xdb3d47: mov r8d, 0x1b4
0xdb3d4d: mov r14d, r8d
0xdb3d50: test rsi, rsi
0xdb3d53: jne 0x140db3ed9
0xdb3d59: mov rax, qword ptr gs:[0x58]
0xdb3d62: mov rcx, qword ptr [rax]
0xdb3d65: mov eax, dword ptr [rcx + rdi]
0xdb3d68: lea rsi, [rcx + r8]
0xdb3d6c: test al, 1
0xdb3d6e: jne 0x140db3d7e
0xdb3d70: or eax, 1
0xdb3d73: mov dword ptr [rcx + rdi], eax
0xdb3d76: call qword ptr [rip + 0x4437564]
0xdb3d7c: mov dword ptr [rsi], eax
0xdb3d7e: mov eax, dword ptr [rsi]
0xdb3d80: cmp dword ptr [rip + 0x5cb154e], eax
0xdb3d86: je 0x140db3da6
0xdb3d88: cmp byte ptr [rbx + 0xaf7], 0
0xdb3d8f: je 0x140db3da6
0xdb3d91: lea rcx, [rbx + 0x570]
0xdb3d98: lea rdx, [rbp - 0x31]
0xdb3d9c: call 0x1403d1120
0xdb3da1: jmp 0x140db4389
0xdb3da6: mov rax, qword ptr [rbp - 0x31]
0xdb3daa: mov rcx, qword ptr [rax + 0xa0]
0xdb3db1: xor edi, edi
0xdb3db3: test rcx, rcx
0xdb3db6: mov edx, edi
0xdb3db8: je 0x140db3dbd
0xdb3dba: mov rdx, qword ptr [rcx]
0xdb3dbd: xor r8d, r8d
0xdb3dc0: mov rdx, qword ptr [rdx]
0xdb3dc3: mov rcx, r12
0xdb3dc6: call 0x143d2cb50
0xdb3dcb: mov rbx, rax
0xdb3dce: mov rcx, qword ptr [rbp - 0x31]
0xdb3dd2: mov rdx, qword ptr [rcx + 0xa0]
0xdb3dd9: test rdx, rdx
0xdb3ddc: jne 0x140db3de3
0xdb3dde: mov rdx, rdi
0xdb3de1: jmp 0x140db3de6
0xdb3de3: mov rdx, qword ptr [rdx]
0xdb3de6: mov eax, dword ptr [rdx + 8]
0xdb3de9: mov dword ptr [rbp + 0x77], eax
0xdb3dec: mov eax, dword ptr [rdx + 0xc]
0xdb3def: mov dword ptr [rbp + 0x87], eax
0xdb3df5: call 0x143edee50
0xdb3dfa: mov rax, qword ptr [rbp - 0x31]
0xdb3dfe: mov r9, qword ptr [rax + 0x38]
0xdb3e02: test r9, r9
0xdb3e05: je 0x140db3e4d
0xdb3e07: mov rcx, qword ptr [r9 + 0xa0]
0xdb3e0e: test rcx, rcx
0xdb3e11: je 0x140db3e1a
0xdb3e13: cmp qword ptr [rcx + 8], 0
0xdb3e18: jne 0x140db3e4d
0xdb3e1a: mov r8d, dword ptr [r9 + 0x48]
0xdb3e1e: mov edx, edi
0xdb3e20: test r8d, r8d
0xdb3e23: je 0x140db3e4d
0xdb3e25: mov r10, qword ptr [r9 + 0x40]
0xdb3e29: nop dword ptr [rax]
0xdb3e30: mov ecx, edx
0xdb3e32: cmp rax, qword ptr [r10 + rcx*8]
0xdb3e36: je 0x140db3e41
0xdb3e38: inc edx
0xdb3e3a: cmp edx, r8d
0xdb3e3d: jb 0x140db3e30
0xdb3e3f: jmp 0x140db3e4d
0xdb3e41: mov rcx, r9
0xdb3e44: call 0x143ed6180
0xdb3e49: mov rax, qword ptr [rbp - 0x31]
0xdb3e4d: and byte ptr [rax + 0x98], 0xfd
0xdb3e54: mov r8b, 1
0xdb3e57: mov rdx, qword ptr [rbx]
0xdb3e5a: lea rcx, [rbp - 0x29]
0xdb3e5e: call 0x140393650
0xdb3e63: nop 
0xdb3e64: xor r9d, r9d
0xdb3e67: lea r8, [rbp + 0x87]
0xdb3e6e: lea rdx, [rbp + 0x77]
0xdb3e72: mov rcx, rbx
0xdb3e75: call 0x143d2c120
0xdb3e7a: lea rdx, [rbp - 0x31]
0xdb3e7e: mov rcx, rax
0xdb3e81: call 0x1403d1120
0xdb3e86: nop 
0xdb3e87: mov rbx, qword ptr [rbp - 0x29]
0xdb3e8b: mov rax, qword ptr [rbx]
0xdb3e8e: xor edx, edx
0xdb3e90: mov rcx, rbx
0xdb3e93: call qword ptr [rax + 0x20]
0xdb3e96: cmp byte ptr [rbp - 0x21], 1
0xdb3e9a: jne 0x140db438b
0xdb3ea0: mov eax, r15d
0xdb3ea3: lock xadd dword ptr [rbx + 8], eax
0xdb3ea8: cmp eax, 1
0xdb3eab: jne 0x140db3ec3
0xdb3ead: test dword ptr [rbx + 0xc], 0x40000000
0xdb3eb4: je 0x140db438b
0xdb3eba: mov rax, qword ptr [rbx]
0xdb3ebd: mov rcx, rbx
0xdb3ec0: call qword ptr [rax + 0x40]
0xdb3ec3: test dword ptr [rbx + 0xc], 0x40000000
0xdb3eca: je 0x140db438b
0xdb3ed0: lock dec dword ptr [rbx + 0xc]
0xdb3ed4: jmp 0x140db438b
0xdb3ed9: movzx eax, byte ptr [rbp + 0xaf]
0xdb3ee0: mov byte ptr [rsp + 0x58], al
0xdb3ee4: mov rax, qword ptr [rbp + 0x8f]
0xdb3eeb: mov qword ptr [rsp + 0x50], rax
0xdb3ef0: mov byte ptr [rsp + 0x48], cl
0xdb3ef4: vmovss xmm0, dword ptr [rbp + 0x7f]
0xdb3ef9: vmovss dword ptr [rsp + 0x40], xmm0
0xdb3eff: mov qword ptr [rsp + 0x38], rcx
0xdb3f04: mov rax, qword ptr [rbp + 0x6f]
0xdb3f08: mov qword ptr [rsp + 0x30], rax
0xdb3f0d: mov rax, qword ptr [rbp + 0x67]
0xdb3f11: mov qword ptr [rsp + 0x28], rax
0xdb3f16: mov rax, qword ptr [rbp + 0x5f]
0xdb3f1a: mov qword ptr [rsp + 0x20], rax
0xdb3f1f: mov r9, r13
0xdb3f22: mov r8, qword ptr [rbp + 0x4f]
0xdb3f26: mov rdx, rsi
0xdb3f29: mov rcx, rbx
0xdb3f2c: call 0x140db4420
0xdb3f31: test al, al
0xdb3f33: mov rax, qword ptr gs:[0x58]
0xdb3f3c: jne 0x140db40b1
0xdb3f42: mov rsi, qword ptr [rax]
0xdb3f45: mov eax, dword ptr [rsi + rdi]
0xdb3f48: test al, 1
0xdb3f4a: jne 0x140db3f5c
0xdb3f4c: or eax, 1
0xdb3f4f: mov dword ptr [rsi + rdi], eax
0xdb3f52: call qword ptr [rip + 0x4437388]
0xdb3f58: mov dword ptr [r14 + rsi], eax
0xdb3f5c: mov eax, dword ptr [r14 + rsi]
0xdb3f60: cmp dword ptr [rip + 0x5cb136e], eax
0xdb3f66: je 0x140db3fd2
0xdb3f68: cmp byte ptr [rbx + 0xaf7], 0
0xdb3f6f: je 0x140db3fd2
0xdb3f71: add rbx, 0x570
0xdb3f78: mov ecx, dword ptr [rbx + 8]
0xdb3f7b: mov eax, dword ptr [rbx + 0xc]
0xdb3f7e: cmp eax, ecx
0xdb3f80: ja 0x140db3fa5
0xdb3f82: lea edx, [rax*2 + 1]
0xdb3f89: add edx, eax
0xdb3f8b: shr edx, 1
0xdb3f8d: cmp edx, 1
0xdb3f90: mov eax, 1
0xdb3f95: cmovb edx, eax
0xdb3f98: cmp ecx, edx
0xdb3f9a: cmova edx, ecx
0xdb3f9d: mov rcx, rbx
0xdb3fa0: call 0x1403d3080
0xdb3fa5: mov edx, dword ptr [rbx + 8]
0xdb3fa8: mov rcx, qword ptr [rbx]
0xdb3fab: xor edi, edi
0xdb3fad: mov qword ptr [rcx + rdx*8], rdi
0xdb3fb1: mov rax, qword ptr [rbp - 0x31]
0xdb3fb5: mov qword ptr [rcx + rdx*8], rax
0xdb3fb9: mov qword ptr [rbp - 0x31], rdi
0xdb3fbd: mov rax, qword ptr [rcx + rdx*8]
0xdb3fc1: test rax, rax
0xdb3fc4: je 0x140db3fca
0xdb3fc6: mov byte ptr [rax + 0x16], 1
0xdb3fca: inc dword ptr [rbx + 8]
0xdb3fcd: jmp 0x140db438b
0xdb3fd2: mov rax, qword ptr [rbp - 0x31]
0xdb3fd6: mov rcx, qword ptr [rax + 0xa0]
0xdb3fdd: xor edi, edi
0xdb3fdf: test rcx, rcx
0xdb3fe2: mov edx, edi
0xdb3fe4: je 0x140db3fe9
0xdb3fe6: mov rdx, qword ptr [rcx]
0xdb3fe9: xor r8d, r8d
0xdb3fec: mov rdx, qword ptr [rdx]
0xdb3fef: mov rcx, r12
0xdb3ff2: call 0x143d2cb50
0xdb3ff7: mov rbx, rax
0xdb3ffa: mov rcx, qword ptr [rbp - 0x31]
0xdb3ffe: mov rdx, qword ptr [rcx + 0xa0]
0xdb4005: test rdx, rdx
0xdb4008: jne 0x140db400f
0xdb400a: mov rdx, rdi
0xdb400d: jmp 0x140db4012
0xdb400f: mov rdx, qword ptr [rdx]
0xdb4012: mov eax, dword ptr [rdx + 8]
0xdb4015: mov dword ptr [rbp + 0x77], eax
0xdb4018: mov eax, dword ptr [rdx + 0xc]
0xdb401b: mov dword ptr [rbp + 0x87], eax
0xdb4021: call 0x143edee50
0xdb4026: mov rax, qword ptr [rbp - 0x31]
0xdb402a: mov r9, qword ptr [rax + 0x38]
0xdb402e: test r9, r9
0xdb4031: je 0x140db4072
0xdb4033: mov rcx, qword ptr [r9 + 0xa0]
0xdb403a: test rcx, rcx
0xdb403d: je 0x140db4046
0xdb403f: cmp qword ptr [rcx + 8], 0
0xdb4044: jne 0x140db4072
0xdb4046: mov r8d, dword ptr [r9 + 0x48]
0xdb404a: mov edx, edi
0xdb404c: test r8d, r8d
0xdb404f: je 0x140db4072
0xdb4051: mov r10, qword ptr [r9 + 0x40]
0xdb4055: mov ecx, edx
0xdb4057: cmp rax, qword ptr [r10 + rcx*8]
0xdb405b: je 0x140db4066
0xdb405d: inc edx
0xdb405f: cmp edx, r8d
0xdb4062: jb 0x140db4055
0xdb4064: jmp 0x140db4072
0xdb4066: mov rcx, r9
0xdb4069: call 0x143ed6180
0xdb406e: mov rax, qword ptr [rbp - 0x31]
0xdb4072: and byte ptr [rax + 0x98], 0xfd
0xdb4079: mov r8b, 1
0xdb407c: mov rdx, qword ptr [rbx]
0xdb407f: lea rcx, [rbp - 0x29]
0xdb4083: call 0x140393650
0xdb4088: nop 
0xdb4089: xor r9d, r9d
0xdb408c: lea r8, [rbp + 0x87]
0xdb4093: lea rdx, [rbp + 0x77]
0xdb4097: mov rcx, rbx
0xdb409a: call 0x143d2c120
0xdb409f: lea rdx, [rbp - 0x31]
0xdb40a3: mov rcx, rax
0xdb40a6: call 0x1403d1120
0xdb40ab: nop 
0xdb40ac: jmp 0x140db3e87
0xdb40b1: mov r12, qword ptr [rax]
0xdb40b4: mov eax, dword ptr [r12 + rdi]
0xdb40b8: test al, 1
0xdb40ba: jne 0x140db40cd
0xdb40bc: or eax, 1
0xdb40bf: mov dword ptr [r12 + rdi], eax
0xdb40c3: call qword ptr [rip + 0x4437217]
0xdb40c9: mov dword ptr [r14 + r12], eax
0xdb40cd: mov eax, dword ptr [r14 + r12]
0xdb40d1: cmp dword ptr [rip + 0x5cb11fd], eax
0xdb40d7: je 0x140db42a6
0xdb40dd: cmp byte ptr [rbx + 0xaf7], 0
0xdb40e4: je 0x140db42a6
0xdb40ea: lea r12, [rbx + 0x550]
0xdb40f1: xor r13d, r13d
0xdb40f4: mov qword ptr [rbp - 0x11], r13
0xdb40f8: mov r14, qword ptr [rbp - 0x31]
0xdb40fc: mov qword ptr [rbp - 0x11], r14
0xdb4100: mov qword ptr [rbp - 0x31], r13
0xdb4104: test r14, r14
0xdb4107: je 0x140db410e
0xdb4109: mov byte ptr [r14 + 0x16], 1
0xdb410e: mov qword ptr [rbp - 9], r13
0xdb4112: lea r9, [rip + 0x5cb1827]
0xdb4119: mov rdi, qword ptr [rbp + 0x9f]
0xdb4120: test rdi, rdi
0xdb4123: je 0x140db4163
0xdb4125: cmp byte ptr [rdi], 0
0xdb4128: je 0x140db4163
0xdb412a: mov rbx, r15
0xdb412d: nop dword ptr [rax]
0xdb4130: inc rbx
0xdb4133: cmp byte ptr [rdi + rbx], 0
0xdb4137: jne 0x140db4130
0xdb4139: mov ecx, ebx
0xdb413b: call 0x1414203f0
0xdb4140: mov qword ptr [rbp + 0x77], rax
0xdb4144: lea edx, [rbx + 1]
0xdb4147: mov r9, r15
0xdb414a: mov r8, rdi
0xdb414d: mov rcx, qword ptr [rax]
0xdb4150: call qword ptr [rip + 0x443835a]
0xdb4156: mov r8, qword ptr [rbp + 0x77]
0xdb415a: lea r9, [rip + 0x5cb17df]
0xdb4161: jmp 0x140db416a
0xdb4163: mov r8, r9
0xdb4166: mov qword ptr [rbp + 0x77], r9
0xdb416a: mov qword ptr [rbp - 9], r8
0xdb416e: mov qword ptr [rbp - 1], r13
0xdb4172: mov rdi, qword ptr [rbp + 0xa7]
0xdb4179: test rdi, rdi
0xdb417c: je 0x140db41b8
0xdb417e: cmp byte ptr [rdi], 0
0xdb4181: je 0x140db41b8
0xdb4183: mov rbx, r15
0xdb4186: inc rbx
0xdb4189: cmp byte ptr [rdi + rbx], 0
0xdb418d: jne 0x140db4186
0xdb418f: mov ecx, ebx
0xdb4191: call 0x1414203f0
0xdb4196: mov r13, rax
0xdb4199: lea edx, [rbx + 1]
0xdb419c: mov r9, r15
0xdb419f: mov r8, rdi
0xdb41a2: mov rcx, qword ptr [rax]
0xdb41a5: call qword ptr [rip + 0x4438305]
0xdb41ab: mov r8, qword ptr [rbp + 0x77]
0xdb41af: lea r9, [rip + 0x5cb178a]
0xdb41b6: jmp 0x140db41bb
0xdb41b8: mov r13, r9
0xdb41bb: mov qword ptr [rbp - 1], r13
0xdb41bf: xor edi, edi
0xdb41c1: mov qword ptr [rbp - 0x29], rdi
0xdb41c5: mov qword ptr [rbp - 0x29], r14
0xdb41c9: mov qword ptr [rbp - 0x11], rdi
0xdb41cd: test r14, r14
0xdb41d0: je 0x140db41d7
0xdb41d2: mov byte ptr [r14 + 0x16], 1
0xdb41d7: mov qword ptr [rbp - 0x21], rdi
0xdb41db: mov qword ptr [rbp - 0x21], r8
0xdb41df: mov qword ptr [rbp - 9], r9
0xdb41e3: mov qword ptr [rbp - 0x19], rdi
0xdb41e7: mov qword ptr [rbp - 0x19], r13
0xdb41eb: mov qword ptr [rbp - 1], r9
0xdb41ef: mov ecx, dword ptr [r12 + 8]
0xdb41f4: mov eax, dword ptr [r12 + 0xc]
0xdb41f9: cmp eax, ecx
0xdb41fb: ja 0x140db422b
0xdb41fd: lea edx, [rax*2 + 1]
0xdb4204: add edx, eax
0xdb4206: shr edx, 1
0xdb4208: cmp edx, 1
0xdb420b: mov eax, 1
0xdb4210: cmovb edx, eax
0xdb4213: cmp ecx, edx
0xdb4215: cmova edx, ecx
0xdb4218: mov rcx, r12
0xdb421b: call 0x140deb1d0
0xdb4220: mov r8, qword ptr [rbp + 0x77]
0xdb4224: lea r9, [rip + 0x5cb1715]
0xdb422b: mov eax, dword ptr [r12 + 8]
0xdb4230: lea rcx, [rax + rax*2]
0xdb4234: mov rax, qword ptr [r12]
0xdb4238: lea rdx, [rax + rcx*8]
0xdb423c: mov qword ptr [rbp + 0x77], rdx
0xdb4240: mov qword ptr [rdx], r14
0xdb4243: mov qword ptr [rbp - 0x29], rdi
0xdb4247: test r14, r14
0xdb424a: je 0x140db4251
0xdb424c: mov byte ptr [r14 + 0x16], 1
0xdb4251: mov qword ptr [rdx + 8], r8
0xdb4255: mov qword ptr [rbp - 0x21], r9
0xdb4259: mov qword ptr [rdx + 0x10], r13
0xdb425d: mov qword ptr [rbp - 0x19], r9
0xdb4261: inc dword ptr [r12 + 8]
0xdb4266: lea rcx, [rbp - 0x19]
0xdb426a: call 0x140394db0
0xdb426f: nop 
0xdb4270: lea rcx, [rbp - 0x21]
0xdb4274: call 0x140394db0
0xdb4279: nop 
0xdb427a: lea rcx, [rbp - 0x29]
0xdb427e: call 0x14038ad90
0xdb4283: nop 
0xdb4284: lea rcx, [rbp - 1]
0xdb4288: call 0x140394db0
0xdb428d: nop 
0xdb428e: lea rcx, [rbp - 9]
0xdb4292: call 0x140394db0
0xdb4297: nop 
0xdb4298: lea rcx, [rbp - 0x11]
0xdb429c: call 0x14038ad90
0xdb42a1: jmp 0x140db438e
0xdb42a6: xor edi, edi
0xdb42a8: mov dword ptr [rbp + 0x87], edi
0xdb42ae: lea rax, [rbp + 0x87]
0xdb42b5: mov qword ptr [rsp + 0x20], rax
0xdb42ba: mov r9, qword ptr [rbp + 0xa7]
0xdb42c1: mov r8, qword ptr [rbp + 0x9f]
0xdb42c8: mov rdx, rsi
0xdb42cb: mov rcx, rbx
0xdb42ce: call 0x140db5510
0xdb42d3: jmp 0x140db438e
0xdb42d8: mov esi, 1
0xdb42dd: mov rax, qword ptr gs:[0x58]
0xdb42e6: mov rcx, qword ptr [rax]
0xdb42e9: mov eax, 0x1b0
0xdb42ee: mov edx, eax
0xdb42f0: mov eax, dword ptr [rax + rcx]
0xdb42f3: mov edi, 0x1b4
0xdb42f8: add rdi, rcx
0xdb42fb: test al, 1
0xdb42fd: jne 0x140db430d
0xdb42ff: or eax, 1
0xdb4302: mov dword ptr [rdx + rcx], eax
0xdb4305: call qword ptr [rip + 0x4436fd5]
0xdb430b: mov dword ptr [rdi], eax
0xdb430d: mov eax, dword ptr [rdi]
0xdb430f: cmp dword ptr [rip + 0x5cb0fbf], eax
0xdb4315: je 0x140db437d
0xdb4317: cmp byte ptr [rbx + 0xaf7], 0
0xdb431e: je 0x140db437d
0xdb4320: add rbx, 0x570
0xdb4327: mov ecx, dword ptr [rbx + 8]
0xdb432a: mov eax, dword ptr [rbx + 0xc]
0xdb432d: cmp eax, ecx
0xdb432f: ja 0x140db434f
0xdb4331: lea edx, [rax*2 + 1]
0xdb4338: add edx, eax
0xdb433a: shr edx, 1
0xdb433c: cmp edx, 1
0xdb433f: cmovb edx, esi
0xdb4342: cmp ecx, edx
0xdb4344: cmova edx, ecx
0xdb4347: mov rcx, rbx
0xdb434a: call 0x1403d3080
0xdb434f: mov edx, dword ptr [rbx + 8]
0xdb4352: mov rcx, qword ptr [rbx]
0xdb4355: xor edi, edi
0xdb4357: mov qword ptr [rcx + rdx*8], rdi
0xdb435b: mov rax, qword ptr [rbp - 0x31]
0xdb435f: mov qword ptr [rcx + rdx*8], rax
0xdb4363: mov qword ptr [rbp - 0x31], rdi
0xdb4367: mov rax, qword ptr [rcx + rdx*8]
0xdb436b: test rax, rax
0xdb436e: je 0x140db3fca
0xdb4374: mov byte ptr [rax + 0x16], 1
0xdb4378: inc dword ptr [rbx + 8]
0xdb437b: jmp 0x140db438b
0xdb437d: lea rdx, [rbp - 0x31]
0xdb4381: mov rcx, r12
0xdb4384: call 0x143d2f610
0xdb4389: xor edi, edi
0xdb438b: mov rsi, rdi
0xdb438e: mov rcx, qword ptr [rbp - 0x31]
0xdb4392: test rcx, rcx
0xdb4395: je 0x140db43c7
0xdb4397: mov qword ptr [rbp - 0x31], rdi
0xdb439b: cmp byte ptr [rcx + 0x14], 0
0xdb439f: je 0x140db43ac
0xdb43a1: lock xadd dword ptr [rcx + 0x10], r15d
0xdb43a7: dec r15d
0xdb43aa: jmp 0x140db43b7
0xdb43ac: mov eax, dword ptr [rcx + 0x10]
0xdb43af: dec eax
0xdb43b1: mov dword ptr [rcx + 0x10], eax
0xdb43b4: mov r15d, eax
0xdb43b7: test r15d, r15d
0xdb43ba: jne 0x140db43c7
0xdb43bc: mov r8, qword ptr [rcx]
0xdb43bf: mov edx, 1
0xdb43c4: call qword ptr [r8]
0xdb43c7: mov rax, rsi
0xdb43ca: mov rbx, qword ptr [rsp + 0xe0]
0xdb43d2: add rsp, 0xa0
0xdb43d9: pop r15
0xdb43db: pop r14
0xdb43dd: pop r13
0xdb43df: pop r12
0xdb43e1: pop rdi
0xdb43e2: pop rsi
0xdb43e3: pop rbp
0xdb43e4: ret 