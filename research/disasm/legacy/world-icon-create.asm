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
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0xdef2d0
0xdef2d0: mov qword ptr [rsp + 8], rbx
0xdef2d5: push rdi
0xdef2d6: sub rsp, 0x20
0xdef2da: cmp dword ptr [rcx + 0x15c], 0
0xdef2e1: mov rdi, r8
0xdef2e4: mov r10, rcx
0xdef2e7: je 0x140def337
0xdef2e9: mov ecx, dword ptr [rcx + 0x158]
0xdef2ef: test ecx, ecx
0xdef2f1: je 0x140def337
0xdef2f3: mov r9d, dword ptr [rdx]
0xdef2f6: xor edx, edx
0xdef2f8: mov eax, r9d
0xdef2fb: div ecx
0xdef2fd: xor eax, eax
0xdef2ff: mov r11d, edx
0xdef302: shl r11, 8
0xdef306: add r11, qword ptr [r10 + 0x168]
0xdef30d: mov ebx, dword ptr [r11]
0xdef310: test ebx, ebx
0xdef312: je 0x140def337
0xdef314: cmp dword ptr [r11 + rax*8 + 8], r9d
0xdef319: jne 0x140def331
0xdef31b: mov edx, dword ptr [r11 + rax*8 + 0xc]
0xdef320: mov rcx, qword ptr [r10 + 0x170]
0xdef327: mov r8, qword ptr [rcx + rdx*8]
0xdef32b: cmp dword ptr [r8 + 4], r9d
0xdef32f: je 0x140def344
0xdef331: inc eax
0xdef333: cmp eax, ebx
0xdef335: jb 0x140def314
0xdef337: xor al, al
0xdef339: mov rbx, qword ptr [rsp + 0x30]
0xdef33e: add rsp, 0x20
0xdef342: pop rdi
0xdef343: ret 
0xdef344: lea rcx, [r8 + 8]
0xdef348: test rcx, rcx
0xdef34b: je 0x140def337
0xdef34d: mov rdx, rdi
0xdef350: call 0x140de4500
0xdef355: mov rbx, qword ptr [rsp + 0x30]
0xdef35a: test rax, rax
0xdef35d: setne al
0xdef360: add rsp, 0x20
0xdef364: pop rdi
0xdef365: ret 
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
CALLEE 0x3d2f5b0
0x3d2f5b0: mov qword ptr [rsp + 8], rbx
0x3d2f5b5: mov qword ptr [rsp + 0x10], rdx
0x3d2f5ba: push rdi
0x3d2f5bb: sub rsp, 0x30
0x3d2f5bf: mov rdi, r9
0x3d2f5c2: mov rax, r8
0x3d2f5c5: mov rbx, rdx
0x3d2f5c8: mov dword ptr [rsp + 0x20], 0
0x3d2f5d0: mov r8b, 1
0x3d2f5d3: mov rdx, rax
0x3d2f5d6: call 0x143d2cb50
0x3d2f5db: test rax, rax
0x3d2f5de: jne 0x143d2f5e5
0x3d2f5e0: mov qword ptr [rbx], rax
0x3d2f5e3: jmp 0x143d2f5f9
0x3d2f5e5: mov r9, qword ptr [rsp + 0x60]
0x3d2f5ea: mov r8, rdi
0x3d2f5ed: mov rdx, rbx
0x3d2f5f0: mov rcx, rax
0x3d2f5f3: call 0x143d2b780
0x3d2f5f8: nop 
0x3d2f5f9: mov dword ptr [rsp + 0x20], 1
0x3d2f601: mov rax, rbx
0x3d2f604: mov rbx, qword ptr [rsp + 0x40]
0x3d2f609: add rsp, 0x30
0x3d2f60d: pop rdi
0x3d2f60e: ret 
0x3d2f60f: int3 
CALLEE 0xf02840
0xf02840: mov qword ptr [rsp + 0x10], rbx
0xf02845: push rdi
0xf02846: sub rsp, 0x20
0xf0284a: lea rdi, [rcx + 0xa0]
0xf02851: cmp qword ptr [rdi], 0
0xf02855: jne 0x140f02938
0xf0285b: mov edx, 0x1fd
0xf02860: mov rax, qword ptr gs:[0x58]
0xf02869: mov rcx, qword ptr [rax]
0xf0286c: cmp byte ptr [rdx + rcx], 0
0xf02870: mov edx, 0x10
0xf02875: mov ecx, 0xa0
0xf0287a: je 0x140f02883
0xf0287c: call 0x1447efa78
0xf02881: jmp 0x140f02888
0xf02883: call 0x1447ef9b0
0xf02888: mov rbx, rax
0xf0288b: test rax, rax
0xf0288e: jne 0x140f028ab
0xf02890: call 0x141318e70
0xf02895: xor r9d, r9d
0xf02898: xor r8d, r8d
0xf0289b: mov edx, 1
0xf028a0: mov ecx, 0xa0000002
0xf028a5: call qword ptr [rip + 0x42e889d]
0xf028ab: mov qword ptr [rsp + 0x30], rbx
0xf028b0: xor eax, eax
0xf028b2: test rbx, rbx
0xf028b5: je 0x140f02925
0xf028b7: mov qword ptr [rbx], rax
0xf028ba: mov qword ptr [rbx + 8], rax
0xf028be: mov qword ptr [rbx + 0x10], rax
0xf028c2: mov qword ptr [rbx + 0x18], rax
0xf028c6: mov qword ptr [rbx + 0x20], rax
0xf028ca: mov qword ptr [rbx + 0x28], rax
0xf028ce: mov qword ptr [rbx + 0x30], rax
0xf028d2: mov qword ptr [rbx + 0x38], rax
0xf028d6: mov qword ptr [rbx + 0x40], rax
0xf028da: mov qword ptr [rbx + 0x48], rax
0xf028de: mov qword ptr [rbx + 0x50], rax
0xf028e2: mov qword ptr [rbx + 0x58], rax
0xf028e6: mov qword ptr [rbx + 0x60], rax
0xf028ea: mov qword ptr [rbx + 0x68], rax
0xf028ee: mov qword ptr [rbx + 0x70], rax
0xf028f2: mov dword ptr [rbx + 0x78], 0x800000
0xf028f9: mov dword ptr [rbx + 0x7c], 0x800000
0xf02900: mov qword ptr [rbx + 0x80], 0x800000
0xf0290b: mov dword ptr [rbx + 0x88], eax
0xf02911: mov qword ptr [rbx + 0x8c], 0xffffffff80000000
0xf0291c: mov qword ptr [rbx + 0x98], rax
0xf02923: jmp 0x140f02928
0xf02925: mov rbx, rax
0xf02928: cmp rbx, qword ptr [rdi]
0xf0292b: je 0x140f02938
0xf0292d: mov rcx, rdi
0xf02930: call 0x140f7e8e0
0xf02935: mov qword ptr [rdi], rbx
0xf02938: mov rbx, qword ptr [rsp + 0x38]
0xf0293d: add rsp, 0x20
0xf02941: pop rdi
0xf02942: ret 
CALLEE 0x3d1120
0x3d1120: mov qword ptr [rsp + 8], rbx
0x3d1125: push rdi
0x3d1126: sub rsp, 0x20
0x3d112a: mov rbx, rcx
0x3d112d: mov rdi, rdx
0x3d1130: mov ecx, dword ptr [rcx + 8]
0x3d1133: mov eax, dword ptr [rbx + 0xc]
0x3d1136: cmp eax, ecx
0x3d1138: ja 0x1403d115c
0x3d113a: lea edx, [rax*2 + 1]
0x3d1141: add edx, eax
0x3d1143: mov eax, 1
0x3d1148: shr edx, 1
0x3d114a: cmp edx, eax
0x3d114c: cmovb edx, eax
0x3d114f: cmp ecx, edx
0x3d1151: cmova edx, ecx
0x3d1154: mov rcx, rbx
0x3d1157: call 0x1403d3080
0x3d115c: mov ecx, dword ptr [rbx + 8]
0x3d115f: mov rax, qword ptr [rbx]
0x3d1162: lea rdx, [rax + rcx*8]
0x3d1166: xor ecx, ecx
0x3d1168: mov qword ptr [rdx], rcx
0x3d116b: mov rax, qword ptr [rdi]
0x3d116e: mov qword ptr [rdx], rax
0x3d1171: mov qword ptr [rdi], rcx
0x3d1174: mov rax, qword ptr [rdx]
0x3d1177: test rax, rax
0x3d117a: je 0x1403d1180
0x3d117c: mov byte ptr [rax + 0x16], 1
0x3d1180: inc dword ptr [rbx + 8]
0x3d1183: mov rbx, qword ptr [rsp + 0x30]
0x3d1188: add rsp, 0x20
0x3d118c: pop rdi
0x3d118d: ret 
CALLEE 0x3d2cb50
0x3d2cb50: mov qword ptr [rsp + 0x10], rdx
0x3d2cb55: push rbx
0x3d2cb56: push rbp
0x3d2cb57: push rsi
0x3d2cb58: push rdi
0x3d2cb59: push r12
0x3d2cb5b: push r14
0x3d2cb5d: push r15
0x3d2cb5f: sub rsp, 0x80
0x3d2cb66: movzx r15d, r8b
0x3d2cb6a: mov rbp, rcx
0x3d2cb6d: lea rdi, [rcx + 8]
0x3d2cb71: mov qword ptr [rsp + 0x68], rdi
0x3d2cb76: mov byte ptr [rsp + 0x70], 1
0x3d2cb7b: mov edx, 1
0x3d2cb80: lock xadd dword ptr [rdi + 8], edx
0x3d2cb85: inc edx
0x3d2cb87: mov eax, dword ptr [rdi + 0xc]
0x3d2cb8a: shr eax, 0x1f
0x3d2cb8d: test al, al
0x3d2cb8f: jne 0x143d2cba0
0x3d2cb91: cmp edx, 1
0x3d2cb94: sete dl
0x3d2cb97: mov rax, qword ptr [rdi]
0x3d2cb9a: mov rcx, rdi
0x3d2cb9d: call qword ptr [rax + 0x30]
0x3d2cba0: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cba7: je 0x143d2cbad
0x3d2cba9: lock inc dword ptr [rdi + 0xc]
0x3d2cbad: mov rax, qword ptr [rdi]
0x3d2cbb0: xor edx, edx
0x3d2cbb2: mov rcx, rdi
0x3d2cbb5: call qword ptr [rax + 0x18]
0x3d2cbb8: nop 
0x3d2cbb9: xor r12d, r12d
0x3d2cbbc: cmp dword ptr [rbp + 0x3c], r12d
0x3d2cbc0: je 0x143d2cc3f
0x3d2cbc2: mov rsi, qword ptr [rsp + 0xc8]
0x3d2cbca: mov qword ptr [rsp + 0xc0], rsi
0x3d2cbd2: mov edx, 8
0x3d2cbd7: lea rcx, [rsp + 0xc0]
0x3d2cbdf: call 0x1403d6210
0x3d2cbe4: mov r10d, eax
0x3d2cbe7: mov ecx, dword ptr [rbp + 0x38]
0x3d2cbea: test ecx, ecx
0x3d2cbec: je 0x143d2cc3f
0x3d2cbee: xor edx, edx
0x3d2cbf0: div ecx
0x3d2cbf2: mov r8d, edx
0x3d2cbf5: shl r8, 8
0x3d2cbf9: add r8, qword ptr [rbp + 0x48]
0x3d2cbfd: mov edx, r12d
0x3d2cc00: mov r9d, dword ptr [r8]
0x3d2cc03: test r9d, r9d
0x3d2cc06: je 0x143d2cc3f
0x3d2cc08: nop dword ptr [rax + rax]
0x3d2cc10: mov eax, edx
0x3d2cc12: cmp dword ptr [r8 + rax*8 + 8], r10d
0x3d2cc17: jne 0x143d2cc2c
0x3d2cc19: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0x3d2cc1e: mov rax, qword ptr [rbp + 0x50]
0x3d2cc22: mov rbx, qword ptr [rax + rcx*8]
0x3d2cc26: cmp qword ptr [rbx + 8], rsi
0x3d2cc2a: je 0x143d2cc35
0x3d2cc2c: inc edx
0x3d2cc2e: cmp edx, r9d
0x3d2cc31: jb 0x143d2cc10
0x3d2cc33: jmp 0x143d2cc3f
0x3d2cc35: add rbx, 0x10
0x3d2cc39: jne 0x143d2cd6c
0x3d2cc3f: test r15b, r15b
0x3d2cc42: je 0x143d2cdaa
0x3d2cc48: mov edx, 0x1fd
0x3d2cc4d: mov rax, qword ptr gs:[0x58]
0x3d2cc56: mov rcx, qword ptr [rax]
0x3d2cc59: cmp byte ptr [rdx + rcx], r12b
0x3d2cc5d: mov edx, 0x10
0x3d2cc62: mov ecx, 0x68
0x3d2cc67: je 0x143d2cc70
0x3d2cc69: call 0x1447efa78
0x3d2cc6e: jmp 0x143d2cc75
0x3d2cc70: call 0x1447ef9b0
0x3d2cc75: mov rsi, rax
0x3d2cc78: test rax, rax
0x3d2cc7b: jne 0x143d2cc98
0x3d2cc7d: call 0x141318e70
0x3d2cc82: xor r9d, r9d
0x3d2cc85: xor r8d, r8d
0x3d2cc88: mov edx, 1
0x3d2cc8d: mov ecx, 0xa0000002
0x3d2cc92: call qword ptr [rip + 0x14be4b0]
0x3d2cc98: mov qword ptr [rsp + 0xc0], rsi
0x3d2cca0: test rsi, rsi
0x3d2cca3: je 0x143d2ccf0
0x3d2cca5: mov rax, qword ptr [rsp + 0xc8]
0x3d2ccad: lea rbx, [rsi + 0x38]
0x3d2ccb1: mov qword ptr [rsi], rbx
0x3d2ccb4: mov qword ptr [rsi + 8], r12
0x3d2ccb8: mov dword ptr [rsi + 0x10], r12d
0x3d2ccbc: mov dword ptr [rsi + 0x14], 0xffffffff
0x3d2ccc3: mov qword ptr [rsi + 0x18], r12
0x3d2ccc7: mov qword ptr [rsi + 0x20], r12
0x3d2cccb: mov qword ptr [rsi + 0x28], rax
0x3d2cccf: mov qword ptr [rsi + 0x30], rbp
0x3d2ccd3: mov qword ptr [rsp + 0xd8], rbx
0x3d2ccdb: mov rcx, rbx
0x3d2ccde: call 0x141371960
0x3d2cce3: nop 
0x3d2cce4: lea rax, [rip + 0x18501e5]
0x3d2cceb: mov qword ptr [rbx], rax
0x3d2ccee: jmp 0x143d2ccf3
0x3d2ccf0: mov rsi, r12
0x3d2ccf3: mov qword ptr [rsp + 0xd8], rsi
0x3d2ccfb: lea rax, [rsp + 0xc8]
0x3d2cd03: mov qword ptr [rsp + 0x50], rax
0x3d2cd08: inc dword ptr [rbp + 0x44]
0x3d2cd0b: mov rax, qword ptr [rsp + 0xc8]
0x3d2cd13: mov qword ptr [rsp + 0xc0], rax
0x3d2cd1b: mov edx, 8
0x3d2cd20: lea rcx, [rsp + 0xc0]
0x3d2cd28: call 0x1403d6210
0x3d2cd2d: mov r8d, eax
0x3d2cd30: lea rax, [rsp + 0x58]
0x3d2cd35: mov qword ptr [rsp + 0x38], rax
0x3d2cd3a: lea rax, [rsp + 0x60]
0x3d2cd3f: mov qword ptr [rsp + 0x30], rax
0x3d2cd44: lea rax, [rsp + 0xc0]
0x3d2cd4c: mov qword ptr [rsp + 0x28], rax
0x3d2cd51: lea r9, [rsp + 0xd8]
0x3d2cd59: lea rdx, [rsp + 0x50]
0x3d2cd5e: lea rcx, [rbp + 0x38]
0x3d2cd62: call 0x143d32570
0x3d2cd67: mov rbx, qword ptr [rsp + 0x58]
0x3d2cd6c: mov rax, qword ptr [rdi]
0x3d2cd6f: xor edx, edx
0x3d2cd71: mov rcx, rdi
0x3d2cd74: call qword ptr [rax + 0x20]
0x3d2cd77: mov eax, 0xffffffff
0x3d2cd7c: lock xadd dword ptr [rdi + 8], eax
0x3d2cd81: cmp eax, 1
0x3d2cd84: jne 0x143d2cd98
0x3d2cd86: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd8d: je 0x143d2cda5
0x3d2cd8f: mov rax, qword ptr [rdi]
0x3d2cd92: mov rcx, rdi
0x3d2cd95: call qword ptr [rax + 0x40]
0x3d2cd98: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd9f: je 0x143d2cda5
0x3d2cda1: lock dec dword ptr [rdi + 0xc]
0x3d2cda5: mov rax, qword ptr [rbx]
0x3d2cda8: jmp 0x143d2cde5
0x3d2cdaa: mov rax, qword ptr [rdi]
0x3d2cdad: xor edx, edx
0x3d2cdaf: mov rcx, rdi
0x3d2cdb2: call qword ptr [rax + 0x20]
0x3d2cdb5: mov eax, 0xffffffff
0x3d2cdba: lock xadd dword ptr [rdi + 8], eax
0x3d2cdbf: cmp eax, 1
0x3d2cdc2: jne 0x143d2cdd6
0x3d2cdc4: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cdcb: je 0x143d2cde3
0x3d2cdcd: mov rax, qword ptr [rdi]
0x3d2cdd0: mov rcx, rdi
0x3d2cdd3: call qword ptr [rax + 0x40]
0x3d2cdd6: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cddd: je 0x143d2cde3
0x3d2cddf: lock dec dword ptr [rdi + 0xc]
0x3d2cde3: xor eax, eax
0x3d2cde5: add rsp, 0x80
0x3d2cdec: pop r15
0x3d2cdee: pop r14
0x3d2cdf0: pop r12
0x3d2cdf2: pop rdi
0x3d2cdf3: pop rsi
0x3d2cdf4: pop rbp
0x3d2cdf5: pop rbx
0x3d2cdf6: ret 
CALLEE 0x3edee50
0x3edee50: mov qword ptr [rsp + 8], rbx
0x3edee55: mov qword ptr [rsp + 0x10], rbp
0x3edee5a: mov qword ptr [rsp + 0x18], rsi
0x3edee5f: mov qword ptr [rsp + 0x20], rdi
0x3edee64: push r14
0x3edee66: sub rsp, 0x50
0x3edee6a: mov rsi, rcx
0x3edee6d: mov rax, qword ptr [rcx + 0xa0]
0x3edee74: xor r14d, r14d
0x3edee77: test rax, rax
0x3edee7a: je 0x143edef79
0x3edee80: mov rcx, qword ptr [rax]
0x3edee83: test rcx, rcx
0x3edee86: je 0x143edef79
0x3edee8c: mov byte ptr [rcx + 0x19], 1
0x3edee90: mov ebx, r14d
0x3edee93: mov qword ptr [rsp + 0x20], rbx
0x3edee98: mov r8d, r14d
0x3edee9b: mov qword ptr [rsp + 0x28], r14
0x3edeea0: mov rdx, qword ptr [rsi + 0x20]
0x3edeea4: mov rax, qword ptr [rdx]
0x3edeea7: mov rcx, qword ptr [rax + 0xa0]
0x3edeeae: test rcx, rcx
0x3edeeb1: je 0x143edeeb9
0x3edeeb3: cmp qword ptr [rcx + 8], r14
0x3edeeb7: jne 0x143edeed1
0x3edeeb9: mov rdx, qword ptr [rdx + 8]
0x3edeebd: lea rcx, [rsp + 0x20]
0x3edeec2: call 0x1408447d0
0x3edeec7: mov r8d, dword ptr [rsp + 0x28]
0x3edeecc: mov rbx, qword ptr [rsp + 0x20]
0x3edeed1: mov rax, qword ptr [rsi + 0xa0]
0x3edeed8: mov rcx, qword ptr [rax]
0x3edeedb: mov r9, qword ptr [rcx + 0x10]
0x3edeedf: mov r10d, dword ptr [r9 + 8]
0x3edeee3: test r10d, r10d
0x3edeee6: jne 0x143edeeed
0x3edeee8: test r8d, r8d
0x3edeeeb: je 0x143edef44
0x3edeeed: mov r9, qword ptr [r9]
0x3edeef0: cmp r8d, r10d
0x3edeef3: jne 0x143edef1c
0x3edeef5: mov edx, r14d
0x3edeef8: test r8d, r8d
0x3edeefb: je 0x143edef44
0x3edeefd: nop dword ptr [rax]
0x3edef00: mov eax, edx
0x3edef02: lea rcx, [rax*4]
0x3edef0a: mov eax, dword ptr [rcx + r9]
0x3edef0e: cmp dword ptr [rcx + rbx], eax
0x3edef11: jne 0x143edef1c
0x3edef13: inc edx
0x3edef15: cmp edx, r8d
0x3edef18: jb 0x143edef00
0x3edef1a: jmp 0x143edef44
0x3edef1c: mov qword ptr [rsp + 0x30], r9
0x3edef21: mov dword ptr [rsp + 0x38], r10d
0x3edef26: mov qword ptr [rsp + 0x40], rbx
0x3edef2b: mov dword ptr [rsp + 0x48], r8d
0x3edef30: lea r8, [rsp + 0x30]
0x3edef35: lea rdx, [rsp + 0x40]
0x3edef3a: mov rcx, qword ptr [rsi + 0x20]
0x3edef3e: call 0x1435ca4f0
0x3edef43: nop 
0x3edef44: test rbx, rbx
0x3edef47: je 0x143edef6f
0x3edef49: mov ecx, 0x1fd
0x3edef4e: mov rax, qword ptr gs:[0x58]
0x3edef57: mov rdx, qword ptr [rax]
0x3edef5a: cmp byte ptr [rcx + rdx], 0
0x3edef5e: mov rcx, rbx
0x3edef61: je 0x143edef6a
0x3edef63: call 0x1447f03bc
0x3edef68: jmp 0x143edef6f
0x3edef6a: call 0x1447f02bc
0x3edef6f: mov qword ptr [rsp + 0x20], r14
0x3edef74: mov qword ptr [rsp + 0x28], r14
0x3edef79: mov rax, qword ptr [rsi + 0xa0]
0x3edef80: test rax, rax
0x3edef83: je 0x143edef8c
0x3edef85: cmp qword ptr [rax + 8], 0
0x3edef8a: jne 0x143edefaf
0x3edef8c: mov rax, qword ptr [rsi + 0x20]
0x3edef90: mov rbx, qword ptr [rax + 0x30]
0x3edef94: test rbx, rbx
0x3edef97: je 0x143edefaf
0x3edef99: lea rcx, [rbx + 0x70]
0x3edef9d: call 0x143582ac0
0x3edefa2: mov dword ptr [rbx + 0x88], r14d
0x3edefa9: inc dword ptr [rbx + 0x90]
0x3edefaf: mov rbx, qword ptr [rsi + 0xa0]
0x3edefb6: test rbx, rbx
0x3edefb9: je 0x143edf000
0x3edefbb: mov eax, dword ptr [rbx + 0x40]
0x3edefbe: test eax, eax
0x3edefc0: je 0x143edf000
0x3edefc2: mov rbx, qword ptr [rbx + 0x38]
0x3edefc6: lea rbp, [rbx + rax*8]
0x3edefca: cmp rbx, rbp
0x3edefcd: je 0x143edf000
0x3edefcf: nop 
0x3edefd0: mov rdi, qword ptr [rbx]
0x3edefd3: test rdi, rdi
0x3edefd6: je 0x143edeff7
0x3edefd8: mov rdi, qword ptr [rdi + 0x18]
0x3edefdc: test rdi, rdi
0x3edefdf: je 0x143edeff7
0x3edefe1: lea rcx, [rdi + 0x70]
0x3edefe5: call 0x143582ac0
0x3edefea: mov dword ptr [rdi + 0x88], r14d
0x3edeff1: inc dword ptr [rdi + 0x90]
0x3edeff7: add rbx, 8
0x3edeffb: cmp rbx, rbp
0x3edeffe: jne 0x143edefd0
0x3edf000: mov rax, qword ptr [rsi + 0xa0]
0x3edf007: test rax, rax
0x3edf00a: je 0x143edf013
0x3edf00c: cmp qword ptr [rax + 8], 0
0x3edf011: jne 0x143edf052
0x3edf013: mov rbx, qword ptr [rsi + 0xd8]
0x3edf01a: test rbx, rbx
0x3edf01d: jne 0x143edf03a
0x3edf01f: test rax, rax
0x3edf022: je 0x143edf052
0x3edf024: mov rcx, qword ptr [rax + 0x58]
0x3edf028: test rcx, rcx
0x3edf02b: je 0x143edf052
0x3edf02d: call 0x143ed84d0
0x3edf032: mov rbx, rax
0x3edf035: test rax, rax
0x3edf038: je 0x143edf052
0x3edf03a: mov rax, qword ptr [rbx]
0x3edf03d: mov rcx, rbx
0x3edf040: call qword ptr [rax + 0x170]
0x3edf046: mov rax, qword ptr [rbx]
0x3edf049: mov rcx, rbx
0x3edf04c: call qword ptr [rax + 0x180]
0x3edf052: mov rbx, qword ptr [rsi + 0x40]
0x3edf056: mov eax, dword ptr [rsi + 0x48]
0x3edf059: lea rdi, [rbx + rax*8]
0x3edf05d: cmp rbx, rdi
0x3edf060: je 0x143edf073
0x3edf062: mov rcx, qword ptr [rbx]
0x3edf065: call 0x143edee50
0x3edf06a: add rbx, 8
0x3edf06e: cmp rbx, rdi
0x3edf071: jne 0x143edf062
0x3edf073: mov rbx, qword ptr [rsp + 0x60]
0x3edf078: mov rbp, qword ptr [rsp + 0x68]
0x3edf07d: mov rsi, qword ptr [rsp + 0x70]
0x3edf082: mov rdi, qword ptr [rsp + 0x78]
0x3edf087: add rsp, 0x50
0x3edf08b: pop r14
0x3edf08d: ret 
CALLEE 0x3ed6180
0x3ed6180: push rbx
0x3ed6182: push rbp
0x3ed6183: sub rsp, 0x28
0x3ed6187: mov rax, qword ptr [rcx + 0xa0]
0x3ed618e: mov rbx, rcx
0x3ed6191: mov ebp, edx
0x3ed6193: test rax, rax
0x3ed6196: je 0x143ed61a3
0x3ed6198: cmp qword ptr [rax + 8], 0
0x3ed619d: jne 0x143ed6310
0x3ed61a3: mov rax, qword ptr [rcx + 0x40]
CALLEE 0x393650
0x393650: mov qword ptr [rsp + 8], rbx
0x393655: push rdi
0x393656: sub rsp, 0x20
0x39365a: mov qword ptr [rcx], rdx
0x39365d: mov rbx, rdx
0x393660: mov byte ptr [rcx + 8], r8b
0x393664: mov rdi, rcx
0x393667: cmp r8b, 1
0x39366b: jne 0x14039369f
0x39366d: mov ecx, 1
0x393672: lock xadd dword ptr [rdx + 8], ecx
0x393677: mov eax, dword ptr [rdx + 0xc]
0x39367a: inc ecx
0x39367c: shr eax, 0x1f
0x39367f: test al, al
0x393681: jne 0x140393692
0x393683: mov rax, qword ptr [rbx]
0x393686: cmp ecx, 1
0x393689: mov rcx, rbx
0x39368c: sete dl
0x39368f: call qword ptr [rax + 0x30]
0x393692: test dword ptr [rbx + 0xc], 0x40000000
0x393699: je 0x14039369f
0x39369b: lock inc dword ptr [rbx + 0xc]
0x39369f: mov rax, qword ptr [rbx]
0x3936a2: xor edx, edx
0x3936a4: mov rcx, rbx
0x3936a7: call qword ptr [rax + 0x18]
0x3936aa: mov rbx, qword ptr [rsp + 0x30]
0x3936af: mov rax, rdi
0x3936b2: add rsp, 0x20
0x3936b6: pop rdi
0x3936b7: ret 
CALLEE 0x3d2c120
0x3d2c120: mov qword ptr [rsp + 0x20], rbx
0x3d2c125: mov qword ptr [rsp + 0x18], r8
0x3d2c12a: push rbp
0x3d2c12b: push rsi
0x3d2c12c: push rdi
0x3d2c12d: push r12
0x3d2c12f: push r13
0x3d2c131: push r14
0x3d2c133: push r15
0x3d2c135: mov rbp, rsp
0x3d2c138: sub rsp, 0x80
0x3d2c13f: movzx r13d, r9b
0x3d2c143: mov r12, rdx
0x3d2c146: mov r11, rcx
0x3d2c149: xor edi, edi
0x3d2c14b: mov r15, qword ptr [rip + 0x2f60b96]
0x3d2c152: cmp dword ptr [rcx + 0xc], edi
0x3d2c155: je 0x143d2c1ba
0x3d2c157: mov edi, dword ptr [rdx]
0x3d2c159: mov edx, edi
0x3d2c15b: add rdx, rdx
0x3d2c15e: mov rax, qword ptr [r15 + 0x58]
0x3d2c162: mov ebx, dword ptr [rax + rdx*8 + 8]
0x3d2c166: mov ecx, dword ptr [rcx + 8]
0x3d2c169: test ecx, ecx
0x3d2c16b: je 0x143d2c1b8
0x3d2c16d: xor edx, edx
0x3d2c16f: mov eax, ebx
0x3d2c171: div ecx
0x3d2c173: mov r9d, edx
0x3d2c176: shl r9, 8
0x3d2c17a: add r9, qword ptr [r11 + 0x18]
0x3d2c17e: xor edx, edx
0x3d2c180: mov r10d, dword ptr [r9]
0x3d2c183: test r10d, r10d
0x3d2c186: je 0x143d2c1b8
0x3d2c188: cmp dword ptr [r9 + rdx*8 + 8], ebx
0x3d2c18d: jne 0x143d2c1a2
0x3d2c18f: mov ecx, dword ptr [r9 + rdx*8 + 0xc]
0x3d2c194: mov rax, qword ptr [r11 + 0x20]
0x3d2c198: mov r8, qword ptr [rax + rcx*8]
0x3d2c19c: cmp dword ptr [r8 + 4], edi
0x3d2c1a0: je 0x143d2c1ab
0x3d2c1a2: inc edx
0x3d2c1a4: cmp edx, r10d
0x3d2c1a7: jb 0x143d2c188
0x3d2c1a9: jmp 0x143d2c1b8
0x3d2c1ab: lea rsi, [r8 + 8]
0x3d2c1af: test rsi, rsi
0x3d2c1b2: jne 0x143d2c314
0x3d2c1b8: xor edi, edi
0x3d2c1ba: test r13b, r13b
0x3d2c1bd: je 0x143d2c45b
0x3d2c1c3: mov qword ptr [rbp - 0x20], 0
0x3d2c1cb: mov dword ptr [rbp - 0x18], edi
0x3d2c1ce: mov dword ptr [rbp - 0x14], 0xffffffff
0x3d2c1d5: vpxor xmm0, xmm0, xmm0
0x3d2c1d9: vmovdqu xmmword ptr [rbp - 0x10], xmm0
0x3d2c1de: mov qword ptr [rbp + 0x48], r12
0x3d2c1e2: inc dword ptr [r11 + 0x14]
0x3d2c1e6: mov eax, dword ptr [r12]
0x3d2c1ea: add rax, rax
0x3d2c1ed: mov r8, qword ptr [r15 + 0x58]
0x3d2c1f1: lea rcx, [rbp - 0x30]
0x3d2c1f5: mov qword ptr [rsp + 0x38], rcx
0x3d2c1fa: lea rcx, [rbp - 0x28]
0x3d2c1fe: mov qword ptr [rsp + 0x30], rcx
0x3d2c203: lea rcx, [rbp + 0x40]
0x3d2c207: mov qword ptr [rsp + 0x28], rcx
0x3d2c20c: lea r9, [rbp - 0x20]
0x3d2c210: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c215: lea rdx, [rbp + 0x48]
0x3d2c219: lea rcx, [r11 + 8]
0x3d2c21d: call 0x143d31d30
0x3d2c222: mov rsi, qword ptr [rbp - 0x30]
0x3d2c226: inc dword ptr [rbp - 0x14]
0x3d2c229: mov r12d, 0x1fd
0x3d2c22f: mov ebx, r12d
0x3d2c232: mov rcx, qword ptr [rbp - 0x10]
0x3d2c236: test rcx, rcx
0x3d2c239: je 0x143d2c265
0x3d2c23b: mov dword ptr [rbp - 0x20], edi
0x3d2c23e: mov rax, qword ptr gs:[0x58]
0x3d2c247: mov rdx, qword ptr [rax]
0x3d2c24a: cmp byte ptr [r12 + rdx], 0
0x3d2c24f: je 0x143d2c258
0x3d2c251: call 0x1447f03bc
0x3d2c256: jmp 0x143d2c25d
0x3d2c258: call 0x1447f02bc
0x3d2c25d: mov qword ptr [rbp - 0x10], rdi
0x3d2c261: mov qword ptr [rbp - 0x10], rdi
0x3d2c265: mov r14, qword ptr [rbp - 8]
0x3d2c269: test r14, r14
0x3d2c26c: je 0x143d2c30b
0x3d2c272: mov eax, dword ptr [rbp - 0x1c]
0x3d2c275: test eax, eax
0x3d2c277: je 0x143d2c2cb
0x3d2c279: mov rbx, r14
0x3d2c27c: mov edi, eax
0x3d2c27e: nop 
0x3d2c280: mov rcx, qword ptr [rbx]
0x3d2c283: mov qword ptr [rbp + 0x40], rcx
0x3d2c287: add rcx, 8
0x3d2c28b: call 0x1403d3000
0x3d2c290: mov rcx, qword ptr [rbx]
0x3d2c293: test rcx, rcx
0x3d2c296: je 0x143d2c2b7
0x3d2c298: mov rax, qword ptr gs:[0x58]
0x3d2c2a1: mov rdx, qword ptr [rax]
0x3d2c2a4: cmp byte ptr [r12 + rdx], 0
0x3d2c2a9: je 0x143d2c2b2
0x3d2c2ab: call 0x1447f03bc
0x3d2c2b0: jmp 0x143d2c2b7
0x3d2c2b2: call 0x1447f02bc
0x3d2c2b7: mov qword ptr [rbx], 0
0x3d2c2be: add rbx, 8
0x3d2c2c2: sub rdi, 1
0x3d2c2c6: jne 0x143d2c280
0x3d2c2c8: mov ebx, r12d
0x3d2c2cb: mov qword ptr [rbp - 0x1c], 0
0x3d2c2d3: mov rax, qword ptr gs:[0x58]
0x3d2c2dc: mov rdx, qword ptr [rax]
0x3d2c2df: mov rcx, r14
0x3d2c2e2: cmp byte ptr [rbx + rdx], 0
0x3d2c2e6: je 0x143d2c2fe
0x3d2c2e8: call 0x1447f03bc
0x3d2c2ed: mov qword ptr [rbp - 8], rdi
0x3d2c2f1: mov qword ptr [rbp - 8], rdi
0x3d2c2f5: mov r15, qword ptr [rip + 0x2f609ec]
0x3d2c2fc: jmp 0x143d2c31c
0x3d2c2fe: call 0x1447f02bc
0x3d2c303: mov qword ptr [rbp - 8], rdi
0x3d2c307: mov qword ptr [rbp - 8], rdi
0x3d2c30b: mov r15, qword ptr [rip + 0x2f609d6]
0x3d2c312: jmp 0x143d2c31c
0x3d2c314: xor edi, edi
0x3d2c316: mov r12d, 0x1fd
0x3d2c31c: mov rdx, qword ptr [rbp + 0x50]
0x3d2c320: cmp dword ptr [rsi + 4], 0
0x3d2c324: je 0x143d2c396
0x3d2c326: mov ebx, dword ptr [rdx]
0x3d2c328: mov ecx, ebx
0x3d2c32a: add rcx, rcx
0x3d2c32d: mov rax, qword ptr [r15 + 0x58]
0x3d2c331: mov r11d, dword ptr [rax + rcx*8 + 8]
0x3d2c336: mov ecx, dword ptr [rsi]
0x3d2c338: test ecx, ecx
0x3d2c33a: je 0x143d2c396
0x3d2c33c: xor edx, edx
0x3d2c33e: mov eax, r11d
0x3d2c341: div ecx
0x3d2c343: mov r9d, edx
0x3d2c346: shl r9, 8
0x3d2c34a: add r9, qword ptr [rsi + 0x10]
0x3d2c34e: mov edx, edi
0x3d2c350: mov r10d, dword ptr [r9]
0x3d2c353: test r10d, r10d
0x3d2c356: je 0x143d2c392
0x3d2c358: nop dword ptr [rax + rax]
0x3d2c360: mov eax, edx
0x3d2c362: cmp dword ptr [r9 + rax*8 + 8], r11d
0x3d2c367: jne 0x143d2c37c
0x3d2c369: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0x3d2c36e: mov rax, qword ptr [rsi + 0x18]
0x3d2c372: mov r8, qword ptr [rax + rcx*8]
0x3d2c376: cmp dword ptr [r8 + 4], ebx
0x3d2c37a: je 0x143d2c385
0x3d2c37c: inc edx
0x3d2c37e: cmp edx, r10d
0x3d2c381: jb 0x143d2c360
0x3d2c383: jmp 0x143d2c392
0x3d2c385: lea r14, [r8 + 8]
0x3d2c389: test r14, r14
0x3d2c38c: jne 0x143d2c456
0x3d2c392: mov rdx, qword ptr [rbp + 0x50]
0x3d2c396: test r13b, r13b
0x3d2c399: je 0x143d2c45b
0x3d2c39f: mov qword ptr [rbp - 0x20], rdi
0x3d2c3a3: mov qword ptr [rbp - 0x18], 0
0x3d2c3ab: mov qword ptr [rbp + 0x48], rdx
0x3d2c3af: inc dword ptr [rsi + 0xc]
0x3d2c3b2: mov eax, dword ptr [rdx]
0x3d2c3b4: add rax, rax
0x3d2c3b7: mov r8, qword ptr [r15 + 0x58]
0x3d2c3bb: lea rcx, [rbp - 0x30]
0x3d2c3bf: mov qword ptr [rsp + 0x38], rcx
0x3d2c3c4: lea rcx, [rbp - 0x28]
0x3d2c3c8: mov qword ptr [rsp + 0x30], rcx
0x3d2c3cd: lea rcx, [rbp + 0x40]
0x3d2c3d1: mov qword ptr [rsp + 0x28], rcx
0x3d2c3d6: lea r9, [rbp - 0x20]
0x3d2c3da: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c3df: lea rdx, [rbp + 0x48]
0x3d2c3e3: mov rcx, rsi
0x3d2c3e6: call 0x140e18930
0x3d2c3eb: mov r14, qword ptr [rbp - 0x30]
0x3d2c3ef: mov rsi, qword ptr [rbp - 0x20]
0x3d2c3f3: test rsi, rsi
0x3d2c3f6: je 0x143d2c44a
0x3d2c3f8: mov eax, dword ptr [rbp - 0x18]
0x3d2c3fb: test eax, eax
0x3d2c3fd: je 0x143d2c416
0x3d2c3ff: mov rbx, rsi
0x3d2c402: mov edi, eax
0x3d2c404: mov rcx, rbx
0x3d2c407: call 0x14038ad90
0x3d2c40c: add rbx, 8
0x3d2c410: sub rdi, 1
0x3d2c414: jne 0x143d2c404
0x3d2c416: mov r8d, r12d
0x3d2c419: mov rax, qword ptr gs:[0x58]
0x3d2c422: mov rdx, qword ptr [rax]
0x3d2c425: mov rcx, rsi
0x3d2c428: cmp byte ptr [r8 + rdx], 0
0x3d2c42d: je 0x143d2c445
0x3d2c42f: call 0x1447f03bc
0x3d2c434: mov qword ptr [rbp - 0x20], rdi
0x3d2c438: mov qword ptr [rbp - 0x18], 0
0x3d2c440: mov rax, r14
0x3d2c443: jmp 0x143d2c45d
0x3d2c445: call 0x1447f02bc
0x3d2c44a: mov qword ptr [rbp - 0x20], rdi
0x3d2c44e: mov qword ptr [rbp - 0x18], 0
0x3d2c456: mov rax, r14
0x3d2c459: jmp 0x143d2c45d
0x3d2c45b: xor eax, eax
0x3d2c45d: mov rbx, qword ptr [rsp + 0xd8]
0x3d2c465: add rsp, 0x80
0x3d2c46c: pop r15
0x3d2c46e: pop r14
0x3d2c470: pop r13
0x3d2c472: pop r12
0x3d2c474: pop rdi
0x3d2c475: pop rsi
0x3d2c476: pop rbp
0x3d2c477: ret 
CALLEE 0x3d1120
0x3d1120: mov qword ptr [rsp + 8], rbx
0x3d1125: push rdi
0x3d1126: sub rsp, 0x20
0x3d112a: mov rbx, rcx
0x3d112d: mov rdi, rdx
0x3d1130: mov ecx, dword ptr [rcx + 8]
0x3d1133: mov eax, dword ptr [rbx + 0xc]
0x3d1136: cmp eax, ecx
0x3d1138: ja 0x1403d115c
0x3d113a: lea edx, [rax*2 + 1]
0x3d1141: add edx, eax
0x3d1143: mov eax, 1
0x3d1148: shr edx, 1
0x3d114a: cmp edx, eax
0x3d114c: cmovb edx, eax
0x3d114f: cmp ecx, edx
0x3d1151: cmova edx, ecx
0x3d1154: mov rcx, rbx
0x3d1157: call 0x1403d3080
0x3d115c: mov ecx, dword ptr [rbx + 8]
0x3d115f: mov rax, qword ptr [rbx]
0x3d1162: lea rdx, [rax + rcx*8]
0x3d1166: xor ecx, ecx
0x3d1168: mov qword ptr [rdx], rcx
0x3d116b: mov rax, qword ptr [rdi]
0x3d116e: mov qword ptr [rdx], rax
0x3d1171: mov qword ptr [rdi], rcx
0x3d1174: mov rax, qword ptr [rdx]
0x3d1177: test rax, rax
0x3d117a: je 0x1403d1180
0x3d117c: mov byte ptr [rax + 0x16], 1
0x3d1180: inc dword ptr [rbx + 8]
0x3d1183: mov rbx, qword ptr [rsp + 0x30]
0x3d1188: add rsp, 0x20
0x3d118c: pop rdi
0x3d118d: ret 
CALLEE 0xdb4420
0xdb4420: mov rax, rsp
0xdb4423: mov qword ptr [rax + 0x10], rbx
0xdb4427: mov qword ptr [rax + 0x18], r8
0xdb442b: mov qword ptr [rax + 8], rcx
0xdb442f: push rbp
0xdb4430: push rsi
0xdb4431: push rdi
0xdb4432: push r12
0xdb4434: push r13
0xdb4436: push r14
0xdb4438: push r15
0xdb443a: lea rbp, [rax - 0x78]
0xdb443e: sub rsp, 0x140
0xdb4445: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdb444a: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdb444f: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdb4454: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdb4459: mov rsi, r9
0xdb445c: mov r12, r8
0xdb445f: mov rdi, rdx
0xdb4462: mov r15, rcx
0xdb4465: xor eax, eax
0xdb4467: mov dword ptr [rbp - 0x3f], eax
0xdb446a: mov word ptr [rbp - 0x3b], ax
0xdb446e: mov byte ptr [rbp - 0x39], al
0xdb4471: mov qword ptr [rbp - 0x28], rcx
0xdb4475: movzx eax, word ptr [r8]
0xdb4479: mov word ptr [rbp - 0x50], ax
0xdb447d: movzx eax, byte ptr [r9 + 8]
0xdb4482: mov byte ptr [rbp - 0x40], al
0xdb4485: mov rax, qword ptr [r9]
0xdb4488: mov qword ptr [rbp - 0x48], rax
0xdb448c: mov r14, qword ptr [rbp + 0xa0]
0xdb4493: mov eax, dword ptr [r14]
0xdb4496: mov dword ptr [rbp - 0x38], eax
0xdb4499: mov rax, qword ptr [rbp + 0xa8]
0xdb44a0: vmovsd xmm0, qword ptr [rax]
0xdb44a4: vmovsd qword ptr [rbp - 0x34], xmm0
0xdb44a9: mov eax, dword ptr [rax + 8]
0xdb44ac: mov dword ptr [rbp - 0x2c], eax
0xdb44af: mov rax, qword ptr [rbp + 0xd0]
0xdb44b6: mov qword ptr [rbp - 0x10], rax
0xdb44ba: mov rax, qword ptr [rbp + 0xb0]
0xdb44c1: mov qword ptr [rbp - 0x20], rax
0xdb44c5: mov qword ptr [rbp - 0x18], 0
0xdb44cd: movzx eax, byte ptr [rbp + 0xd8]
0xdb44d4: mov byte ptr [rbp - 8], al
0xdb44d7: mov rax, qword ptr [rdx]
0xdb44da: mov r8b, 1
0xdb44dd: lea rdx, [rbp - 0x50]
0xdb44e1: mov rcx, rdi
0xdb44e4: call qword ptr [rax + 0x538]
0xdb44ea: test al, al
0xdb44ec: je 0x140db54d0
0xdb44f2: mov rbx, qword ptr [rdi + 8]
0xdb44f6: mov byte ptr [rbp + 0xd8], 0
0xdb44fd: vxorps xmm7, xmm7, xmm7
0xdb4501: vmovss dword ptr [rbp + 0xd0], xmm7
0xdb4509: mov byte ptr [rbp + 0xc8], 2
0xdb4510: lea r9, [rbp + 0xd8]
0xdb4517: lea r8, [rbp + 0xd0]
0xdb451e: lea rdx, [rbp + 0xc8]
0xdb4525: mov rcx, qword ptr [rbx + 0x20]
0xdb4529: call 0x14064b570
0xdb452e: mov byte ptr [rbp + 0xd8], 0
0xdb4535: vmovss dword ptr [rbp + 0xd0], xmm7
0xdb453d: mov byte ptr [rbp + 0xc8], 4
0xdb4544: lea r9, [rbp + 0xd8]
0xdb454b: lea r8, [rbp + 0xd0]
0xdb4552: lea rdx, [rbp + 0xc8]
0xdb4559: mov rcx, qword ptr [rbx + 0x20]
0xdb455d: call 0x14064b570
0xdb4562: cmp byte ptr [rsi + 8], 6
0xdb4566: jne 0x140db4572
0xdb4568: movzx eax, word ptr [rsi]
0xdb456b: mov word ptr [rdi + 0x288], ax
0xdb4572: mov ebx, dword ptr [r14]
0xdb4575: mov rcx, r12
0xdb4578: call 0x140537250
0xdb457d: mov r14d, 0xffff
0xdb4583: cmp byte ptr [rax + 0xab], 0
0xdb458a: jne 0x140db45e2
0xdb458c: mov rcx, r12
0xdb458f: call 0x140537250
0xdb4594: cmp byte ptr [rax + 0xaf], 0
0xdb459b: jne 0x140db45e2
0xdb459d: cmp byte ptr [rsi + 8], 0xe
0xdb45a1: jne 0x140db5182
0xdb45a7: mov eax, dword ptr [rsi]
0xdb45a9: mov dword ptr [rbp + 0xd8], eax
0xdb45af: mov byte ptr [rdi + 0x2b7], 1
0xdb45b6: cmp byte ptr [rsi + 8], 0xe
0xdb45ba: jne 0x140db5182
0xdb45c0: lea rcx, [rbp + 0xd8]
0xdb45c7: call 0x1404a2630
0xdb45cc: cmp byte ptr [rax + 0x49], 0
0xdb45d0: je 0x140db5182
0xdb45d6: mov byte ptr [rdi + 0x2b6], 1
0xdb45dd: jmp 0x140db5182
0xdb45e2: test ebx, ebx
0xdb45e4: jne 0x140db5182
0xdb45ea: mov ebx, r14d
0xdb45ed: movzx esi, bx
0xdb45f0: mov word ptr [rbp + 0xd0], bx
0xdb45f7: mov word ptr [rbp + 0xc8], bx
0xdb45fe: xor r13b, r13b
0xdb4601: mov rcx, r12
0xdb4604: call 0x140537250
0xdb4609: mov rcx, r12
0xdb460c: cmp byte ptr [rax + 0xab], r13b
0xdb4613: je 0x140db4a55
0xdb4619: call 0x140537250
0xdb461e: cmp dword ptr [rax + 0x2c], 0x16
0xdb4622: jne 0x140db47f4
0xdb4628: mov eax, dword ptr [rdi + 0x28c]
0xdb462e: mov dword ptr [rbp + 0xd8], eax
0xdb4634: lea rcx, [rbp + 0xd8]
0xdb463b: call 0x1405c15a0
0xdb4640: movzx esi, word ptr [rax + 0xf8]
0xdb4647: mov r15d, ebx
0xdb464a: cmp si, r15w
0xdb464e: jne 0x140db467a
0xdb4650: lea rbx, [rax + 0x58]
0xdb4654: cmp word ptr [rbx], r15w
0xdb4658: je 0x140db4677
0xdb465a: mov rcx, rbx
0xdb465d: call 0x1405d2070
0xdb4662: cmp word ptr [rax + 0x6c], r15w
0xdb4667: je 0x140db4677
0xdb4669: mov rcx, rbx
0xdb466c: call 0x1405d2070
0xdb4671: movzx esi, word ptr [rax + 0x6c]
0xdb4675: jmp 0x140db467a
0xdb4677: mov esi, r15d
0xdb467a: mov word ptr [rbp + 0xd0], si
0xdb4681: lea rcx, [rbp + 0xd8]
0xdb4688: call 0x1405c15a0
0xdb468d: movzx r14d, word ptr [rax + 0xfa]
0xdb4695: cmp r14w, r15w
0xdb4699: jne 0x140db46c6
0xdb469b: lea rbx, [rax + 0x58]
0xdb469f: cmp word ptr [rbx], r15w
0xdb46a3: je 0x140db46c3
0xdb46a5: mov rcx, rbx
0xdb46a8: call 0x1405d2070
0xdb46ad: cmp word ptr [rax + 0x6e], r15w
0xdb46b2: je 0x140db46c3
0xdb46b4: mov rcx, rbx
0xdb46b7: call 0x1405d2070
0xdb46bc: movzx r14d, word ptr [rax + 0x6e]
0xdb46c1: jmp 0x140db46c6
0xdb46c3: mov r14d, r15d
0xdb46c6: mov word ptr [rbp + 0xc8], r14w
0xdb46ce: lea rcx, [rbp + 0xd8]
0xdb46d5: call 0x1405c15a0
0xdb46da: cmp byte ptr [rax + 0x12], 0xd
0xdb46de: sete r13b
0xdb46e2: lea rcx, [rbp + 0xd8]
0xdb46e9: call 0x1405c15a0
0xdb46ee: mov rcx, qword ptr [rax + 0x18]
0xdb46f2: mov rax, qword ptr [rcx]
0xdb46f5: xor edx, edx
0xdb46f7: call qword ptr [rax + 8]
0xdb46fa: mov r15, rax
0xdb46fd: mov r12, qword ptr [rdi + 0x120]
0xdb4704: test r12, r12
0xdb4707: je 0x140db4788
0xdb4709: mov r12, qword ptr [r12 + 0x20]
0xdb470e: mov dword ptr [rbp + 0xd8], 0xffffffff
0xdb4718: mov ebx, dword ptr [rip + 0x5ef8b2a]
0xdb471e: lea rcx, [rbp + 0xd8]
0xdb4725: call 0x140473f20
0xdb472a: lea rcx, [rax + 8]
0xdb472e: call 0x1403d5f10
0xdb4733: xor edx, edx
0xdb4735: div ebx
0xdb4737: mov ebx, edx
0xdb4739: mov r8d, edx
0xdb473c: call 0x140dec160
0xdb4741: mov rax, qword ptr [rip + 0x5f1ca50]
0xdb4748: lea rdx, [rax + rbx*4]
0xdb474c: mov rax, qword ptr [r12]
0xdb4750: mov rcx, qword ptr [rax + 0xa0]
0xdb4757: test rcx, rcx
0xdb475a: je 0x140db4763
0xdb475c: cmp qword ptr [rcx + 8], 0
0xdb4761: jne 0x140db4788
0xdb4763: cmp dword ptr [rdx], 0
0xdb4766: je 0x140db4788
0xdb4768: mov rcx, qword ptr [r12 + 8]
0xdb476d: call 0x1435ca0a0
0xdb4772: test al, al
0xdb4774: je 0x140db4788
0xdb4776: mov rcx, qword ptr [r12 + 8]
0xdb477b: call 0x1435caec0
0xdb4780: mov rcx, r12
0xdb4783: call 0x1435c66a0
0xdb4788: mov r12, qword ptr [rbp + 0x90]
0xdb478f: test r15, r15
0xdb4792: je 0x140db47a6
0xdb4794: cmp byte ptr [r15], 0
0xdb4798: je 0x140db47a6
0xdb479a: mov rdx, r15
0xdb479d: mov rcx, qword ptr [rdi + 8]
0xdb47a1: call 0x143edd490
0xdb47a6: mov r15, qword ptr [rbp + 0x80]
0xdb47ad: lea rax, [rsp + 0x50]
0xdb47b2: mov qword ptr [rsp + 0x40], rax
0xdb47b7: mov dword ptr [rsp + 0x48], 0
0xdb47bf: mov dword ptr [rsp + 0x4c], 3
0xdb47c7: mov rcx, r12
0xdb47ca: call 0x140537250
0xdb47cf: cmp dword ptr [rax + 0x2c], 0x19
0xdb47d3: je 0x140db4b1c
0xdb47d9: mov rcx, r12
0xdb47dc: call 0x140537250
0xdb47e1: cmp dword ptr [rax + 0x2c], 0x1a
0xdb47e5: je 0x140db4b1c
0xdb47eb: mov eax, dword ptr [rsp + 0x48]
0xdb47ef: jmp 0x140db4b5e
0xdb47f4: mov eax, dword ptr [rdi + 0xd8]
0xdb47fa: mov dword ptr [rbp + 0xd8], eax
0xdb4800: cmp byte ptr [rdi + 0x1ee], r13b
0xdb4807: je 0x140db4878
0xdb4809: lea rcx, [rbp + 0xd8]
0xdb4810: call 0x140473f20
0xdb4815: movzx ecx, word ptr [rax + 0x360]
0xdb481c: mov r14d, ebx
0xdb481f: cmp cx, r14w
0xdb4823: jne 0x140db4904
0xdb4829: lea rcx, [rax + 0x1ac]
0xdb4830: call 0x1405c15a0
0xdb4835: movzx ecx, word ptr [rax + 0xf8]
0xdb483c: cmp cx, r14w
0xdb4840: jne 0x140db4904
0xdb4846: lea rbx, [rax + 0x58]
0xdb484a: cmp word ptr [rbx], r14w
0xdb484e: je 0x140db4901
0xdb4854: mov rcx, rbx
0xdb4857: call 0x1405d2070
0xdb485c: cmp word ptr [rax + 0x6c], r14w
0xdb4861: je 0x140db4901
0xdb4867: mov rcx, rbx
0xdb486a: call 0x1405d2070
0xdb486f: movzx ecx, word ptr [rax + 0x6c]
0xdb4873: jmp 0x140db4904
0xdb4878: mov edx, dword ptr [rip + 0x5f1b87e]
0xdb487e: add rdx, rdx
0xdb4881: mov rax, qword ptr [rip + 0x5ed8460]
0xdb4888: mov rcx, qword ptr [rax + 0x58]
0xdb488c: mov rcx, qword ptr [rcx + rdx*8]
0xdb4890: mov rax, 0xffffffffffffffff
0xdb4897: inc rax
0xdb489a: cmp byte ptr [rcx + rax], r13b
0xdb489e: jne 0x140db4897
0xdb48a0: mov edx, eax
0xdb48a2: call 0x141364780
0xdb48a7: mov r10d, eax
0xdb48aa: mov r11, qword ptr [rip + 0x5fb51cf]
0xdb48b1: cmp dword ptr [r11 + 0x6c], 0
0xdb48b6: je 0x140db48fb
0xdb48b8: mov ecx, dword ptr [r11 + 0x68]
0xdb48bc: test ecx, ecx
0xdb48be: je 0x140db48fb
0xdb48c0: xor edx, edx
0xdb48c2: div ecx
0xdb48c4: mov r8d, edx
0xdb48c7: shl r8, 8
0xdb48cb: add r8, qword ptr [r11 + 0x78]
0xdb48cf: xor edx, edx
0xdb48d1: mov ebx, dword ptr [r8]
0xdb48d4: test ebx, ebx
0xdb48d6: je 0x140db48fb
0xdb48d8: cmp dword ptr [r8 + rdx*8 + 8], r10d
0xdb48dd: jne 0x140db48f5
0xdb48df: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb48e4: mov rax, qword ptr [r11 + 0x80]
0xdb48eb: mov r9, qword ptr [rax + rcx*8]
0xdb48ef: cmp dword ptr [r9 + 4], r10d
0xdb48f3: je 0x140db4967
0xdb48f5: inc edx
0xdb48f7: cmp edx, ebx
0xdb48f9: jb 0x140db48d8
0xdb48fb: mov r14d, 0xffff
0xdb4901: mov ecx, r14d
0xdb4904: movzx esi, cx
0xdb4907: mov word ptr [rbp + 0xd0], cx
0xdb490e: lea rcx, [rbp + 0xd8]
0xdb4915: call 0x140473f20
0xdb491a: movzx ecx, word ptr [rax + 0x362]
0xdb4921: cmp cx, r14w
0xdb4925: jne 0x140db497c
0xdb4927: lea rcx, [rax + 0x1ac]
0xdb492e: call 0x1405c15a0
0xdb4933: movzx ecx, word ptr [rax + 0xfa]
0xdb493a: cmp cx, r14w
0xdb493e: jne 0x140db497c
0xdb4940: lea rbx, [rax + 0x58]
0xdb4944: cmp word ptr [rbx], r14w
0xdb4948: je 0x140db4979
0xdb494a: mov rcx, rbx
0xdb494d: call 0x1405d2070
0xdb4952: cmp word ptr [rax + 0x6e], r14w
0xdb4957: je 0x140db4979
0xdb4959: mov rcx, rbx
0xdb495c: call 0x1405d2070
0xdb4961: movzx ecx, word ptr [rax + 0x6e]
0xdb4965: jmp 0x140db497c
0xdb4967: add r9, 8
0xdb496b: je 0x140db48fb
0xdb496d: movzx ecx, word ptr [r9]
0xdb4971: mov r14d, 0xffff
0xdb4977: jmp 0x140db4904
0xdb4979: mov ecx, r14d
0xdb497c: movzx r14d, cx
0xdb4980: mov word ptr [rbp + 0xc8], cx
0xdb4987: lea rcx, [rbp + 0xd8]
0xdb498e: call 0x140473f20
0xdb4993: cmp byte ptr [rax + 0x392], 0xd
0xdb499a: sete r13b
0xdb499e: lea rcx, [rbp + 0xd8]
0xdb49a5: call 0x140473f20
0xdb49aa: mov rcx, qword ptr [rax + 0x18]
0xdb49ae: mov rax, qword ptr [rcx]
0xdb49b1: xor edx, edx
0xdb49b3: call qword ptr [rax + 8]
0xdb49b6: mov r15, rax
0xdb49b9: lea rcx, [rbp + 0xd8]
0xdb49c0: call 0x140473f20
0xdb49c5: cmp dword ptr [rax + 0x1ac], -1
0xdb49cc: je 0x140db478f
0xdb49d2: lea rcx, [rbp + 0xd8]
0xdb49d9: call 0x140473f20
0xdb49de: lea rcx, [rax + 0x1ac]
0xdb49e5: call 0x1405c15a0
0xdb49ea: mov ebx, 0xffff
0xdb49ef: cmp word ptr [rax + 0x5a], bx
0xdb49f3: je 0x140db478f
0xdb49f9: lea rcx, [rbp + 0xd8]
0xdb4a00: call 0x140473f20
0xdb4a05: lea rcx, [rax + 0x1ac]
0xdb4a0c: call 0x1405c15a0
0xdb4a11: lea rcx, [rax + 0x5a]
0xdb4a15: call 0x140430150
0xdb4a1a: cmp word ptr [rax + 0x34], bx
0xdb4a1e: je 0x140db478f
0xdb4a24: lea rcx, [rbp + 0xd8]
0xdb4a2b: call 0x140473f20
0xdb4a30: lea rcx, [rax + 0x1ac]
0xdb4a37: call 0x1405c15a0
0xdb4a3c: lea rcx, [rax + 0x5a]
0xdb4a40: call 0x140430150
0xdb4a45: movzx esi, word ptr [rax + 0x34]
0xdb4a49: mov word ptr [rbp + 0xd0], si
0xdb4a50: jmp 0x140db478f
0xdb4a55: call 0x140537250
0xdb4a5a: cmp byte ptr [rax + 0xaf], r13b
0xdb4a61: je 0x140db47ad
0xdb4a67: movzx eax, word ptr [rdi + 0xdc]
0xdb4a6e: mov word ptr [rbp + 0xd8], ax
0xdb4a75: lea rcx, [rbp + 0xd8]
0xdb4a7c: call 0x140430280
0xdb4a81: movzx esi, word ptr [rax + 0xb8]
0xdb4a88: cmp si, bx
0xdb4a8b: jne 0x140db4aca
0xdb4a8d: lea rcx, [rax + 0x14]
0xdb4a91: call 0x1405c15a0
0xdb4a96: movzx esi, word ptr [rax + 0xf8]
0xdb4a9d: cmp si, bx
0xdb4aa0: jne 0x140db4aca
0xdb4aa2: lea rbx, [rax + 0x58]
0xdb4aa6: mov esi, 0xffff
0xdb4aab: cmp word ptr [rbx], si
0xdb4aae: je 0x140db4aca
0xdb4ab0: mov rcx, rbx
0xdb4ab3: call 0x1405d2070
0xdb4ab8: cmp word ptr [rax + 0x6c], si
0xdb4abc: je 0x140db4aca
0xdb4abe: mov rcx, rbx
0xdb4ac1: call 0x1405d2070
0xdb4ac6: movzx esi, word ptr [rax + 0x6c]
0xdb4aca: mov word ptr [rbp + 0xd0], si
0xdb4ad1: lea rcx, [rbp + 0xd8]
0xdb4ad8: call 0x140430280
0xdb4add: lea rcx, [rax + 0x14]
0xdb4ae1: call 0x1405c15a0
0xdb4ae6: cmp byte ptr [rax + 0x12], 0xd
0xdb4aea: sete r13b
0xdb4aee: lea rdx, [rbp + 0xd8]
0xdb4af5: call 0x140655950
0xdb4afa: movzx ebx, al
0xdb4afd: lea rcx, [rbp + 0xd8]
0xdb4b04: call 0x140430280
0xdb4b09: movzx edx, bl
0xdb4b0c: mov rcx, rax
0xdb4b0f: call 0x1415e7e90
0xdb4b14: mov r15, rax
0xdb4b17: jmp 0x140db478f
0xdb4b1c: mov rbx, qword ptr [rdi + 0x118]
0xdb4b23: mov eax, dword ptr [rsp + 0x48]
0xdb4b27: cmp eax, dword ptr [rsp + 0x4c]
0xdb4b2b: jb 0x140db4b49
0xdb4b2d: mov r9d, 8
0xdb4b33: xor r8d, r8d
0xdb4b36: lea rdx, [rsp + 0x50]
0xdb4b3b: lea rcx, [rsp + 0x40]
0xdb4b40: call 0x140392380
0xdb4b45: mov eax, dword ptr [rsp + 0x48]
0xdb4b49: mov ecx, eax
0xdb4b4b: mov rax, qword ptr [rsp + 0x40]
0xdb4b50: mov qword ptr [rax + rcx*8], rbx
0xdb4b54: mov eax, dword ptr [rsp + 0x48]
0xdb4b58: inc eax
0xdb4b5a: mov dword ptr [rsp + 0x48], eax
0xdb4b5e: cmp qword ptr [rdi + 0x148], 0
0xdb4b66: je 0x140db4c6f
0xdb4b6c: mov rbx, qword ptr [rdi + 0x138]
0xdb4b73: cmp eax, dword ptr [rsp + 0x4c]
0xdb4b77: jb 0x140db4b95
0xdb4b79: mov r9d, 8
0xdb4b7f: xor r8d, r8d
0xdb4b82: lea rdx, [rsp + 0x50]
0xdb4b87: lea rcx, [rsp + 0x40]
0xdb4b8c: call 0x140392380
0xdb4b91: mov eax, dword ptr [rsp + 0x48]
0xdb4b95: mov ecx, eax
0xdb4b97: mov rax, qword ptr [rsp + 0x40]
0xdb4b9c: mov qword ptr [rax + rcx*8], rbx
0xdb4ba0: mov eax, dword ptr [rsp + 0x48]
0xdb4ba4: inc eax
0xdb4ba6: mov dword ptr [rsp + 0x48], eax
0xdb4baa: mov ecx, 0xffff
0xdb4baf: cmp cx, r14w
0xdb4bb3: je 0x140db4c6f
0xdb4bb9: lea rcx, [rbp + 0xc8]
0xdb4bc0: call 0x140388e00
0xdb4bc5: mov rcx, qword ptr [rax + 0x18]
0xdb4bc9: mov rdx, qword ptr [rcx]
0xdb4bcc: mov qword ptr [rsp + 0x30], 0
0xdb4bd5: lea rax, [rip + 0x5cb0d64]
0xdb4bdc: mov qword ptr [rsp + 0x30], rax
0xdb4be1: mov byte ptr [rsp + 0x38], 6
0xdb4be6: mov byte ptr [rsp + 0x38], 1
0xdb4beb: lea rcx, [rsp + 0x30]
0xdb4bf0: call 0x1403d5f80
0xdb4bf5: lea rcx, [rsp + 0x30]
0xdb4bfa: call 0x14141fe80
0xdb4bff: lea rcx, [rsp + 0x30]
0xdb4c04: call 0x141420260
0xdb4c09: nop 
0xdb4c0a: mov rax, qword ptr [r15]
0xdb4c0d: mov rcx, r15
0xdb4c10: call qword ptr [rax + 0x110]
0xdb4c16: lea rdx, [rsp + 0x30]
0xdb4c1b: mov rcx, qword ptr [rax + 0x311e8]
0xdb4c22: call 0x143f321f0
0xdb4c27: test al, al
0xdb4c29: je 0x140db4c61
0xdb4c2b: mov rax, qword ptr [rdi + 0x158]
0xdb4c32: mov rcx, qword ptr [rax + 8]
0xdb4c36: mov rcx, qword ptr [rcx + 0x20]
0xdb4c3a: mov byte ptr [rbp + 0xd8], 0
0xdb4c41: mov byte ptr [rbp + 0xc8], 0x26
0xdb4c48: lea r9, [rbp + 0xd8]
0xdb4c4f: lea r8, [rsp + 0x30]
0xdb4c54: lea rdx, [rbp + 0xc8]
0xdb4c5b: call 0x14064b880
0xdb4c60: nop 
0xdb4c61: lea rcx, [rsp + 0x30]
0xdb4c66: call 0x140394db0
0xdb4c6b: mov eax, dword ptr [rsp + 0x48]
0xdb4c6f: mov rbx, qword ptr [rdi + 0x128]
0xdb4c76: test rbx, rbx
0xdb4c79: je 0x140db4cb2
0xdb4c7b: cmp eax, dword ptr [rsp + 0x4c]
0xdb4c7f: jb 0x140db4c9d
0xdb4c81: mov r9d, 8
0xdb4c87: xor r8d, r8d
0xdb4c8a: lea rdx, [rsp + 0x50]
0xdb4c8f: lea rcx, [rsp + 0x40]
0xdb4c94: call 0x140392380
0xdb4c99: mov eax, dword ptr [rsp + 0x48]
0xdb4c9d: mov ecx, eax
0xdb4c9f: mov rax, qword ptr [rsp + 0x40]
0xdb4ca4: mov qword ptr [rax + rcx*8], rbx
0xdb4ca8: mov eax, dword ptr [rsp + 0x48]
0xdb4cac: inc eax
0xdb4cae: mov dword ptr [rsp + 0x48], eax
0xdb4cb2: mov rbx, qword ptr [rdi + 0x198]
0xdb4cb9: test rbx, rbx
0xdb4cbc: je 0x140db4cf5
0xdb4cbe: cmp eax, dword ptr [rsp + 0x4c]
0xdb4cc2: jb 0x140db4ce0
0xdb4cc4: mov r9d, 8
0xdb4cca: xor r8d, r8d
0xdb4ccd: lea rdx, [rsp + 0x50]
0xdb4cd2: lea rcx, [rsp + 0x40]
0xdb4cd7: call 0x140392380
0xdb4cdc: mov eax, dword ptr [rsp + 0x48]
0xdb4ce0: mov ecx, eax
0xdb4ce2: mov rax, qword ptr [rsp + 0x40]
0xdb4ce7: mov qword ptr [rax + rcx*8], rbx
0xdb4ceb: mov eax, dword ptr [rsp + 0x48]
0xdb4cef: inc eax
0xdb4cf1: mov dword ptr [rsp + 0x48], eax
0xdb4cf5: mov r14d, 0xffff
0xdb4cfb: cmp r14w, si
0xdb4cff: je 0x140db4ddd
0xdb4d05: mov rbx, qword ptr [rsp + 0x40]
0xdb4d0a: lea rsi, [rbx + rax*8]
0xdb4d0e: cmp rbx, rsi
0xdb4d11: je 0x140db4ddd
0xdb4d17: lea r12, [rip + 0x5cb0c22]
0xdb4d1e: nop 
0xdb4d20: mov r14, qword ptr [rbx]
0xdb4d23: lea rcx, [rbp + 0xd0]
0xdb4d2a: call 0x140388e00
0xdb4d2f: mov rcx, qword ptr [rax + 0x18]
0xdb4d33: mov rdx, qword ptr [rcx]
0xdb4d36: mov qword ptr [rsp + 0x30], 0
0xdb4d3f: mov qword ptr [rsp + 0x30], r12
0xdb4d44: mov byte ptr [rsp + 0x38], 6
0xdb4d49: mov byte ptr [rsp + 0x38], 1
0xdb4d4e: lea rcx, [rsp + 0x30]
0xdb4d53: call 0x1403d5f80
0xdb4d58: lea rcx, [rsp + 0x30]
0xdb4d5d: call 0x14141fe80
0xdb4d62: lea rcx, [rsp + 0x30]
0xdb4d67: call 0x141420260
0xdb4d6c: nop 
0xdb4d6d: mov rax, qword ptr [r15]
0xdb4d70: mov rcx, r15
0xdb4d73: call qword ptr [rax + 0x110]
0xdb4d79: lea rdx, [rsp + 0x30]
0xdb4d7e: mov rcx, qword ptr [rax + 0x311e8]
0xdb4d85: call 0x143f321f0
0xdb4d8a: test al, al
0xdb4d8c: je 0x140db4db9
0xdb4d8e: mov byte ptr [rbp + 0xd8], 0
0xdb4d95: mov byte ptr [rbp + 0xc8], 0x26
0xdb4d9c: lea r9, [rbp + 0xd8]
0xdb4da3: lea r8, [rsp + 0x30]
0xdb4da8: lea rdx, [rbp + 0xc8]
0xdb4daf: mov rcx, qword ptr [r14 + 0x20]
0xdb4db3: call 0x14064b880
0xdb4db8: nop 
0xdb4db9: lea rcx, [rsp + 0x30]
0xdb4dbe: call 0x140394db0
0xdb4dc3: add rbx, 8
0xdb4dc7: cmp rbx, rsi
0xdb4dca: jne 0x140db4d20
0xdb4dd0: mov r12, qword ptr [rbp + 0x90]
0xdb4dd7: mov r14d, 0xffff
0xdb4ddd: lea rax, [rsp + 0x50]
0xdb4de2: mov edx, 0x1fd
0xdb4de7: mov rcx, qword ptr [rsp + 0x40]
0xdb4dec: cmp rcx, rax
0xdb4def: je 0x140db4e18
0xdb4df1: test rcx, rcx
0xdb4df4: je 0x140db4e18
0xdb4df6: mov r8d, edx
0xdb4df9: mov rax, qword ptr gs:[0x58]
0xdb4e02: mov rdx, qword ptr [rax]
0xdb4e05: cmp byte ptr [r8 + rdx], 0
0xdb4e0a: je 0x140db4e13
0xdb4e0c: call 0x1447f03bc
0xdb4e11: jmp 0x140db4e18
0xdb4e13: call 0x1447f02bc
0xdb4e18: lea rax, [rsp + 0x78]
0xdb4e1d: mov qword ptr [rsp + 0x68], rax
0xdb4e22: mov dword ptr [rsp + 0x70], 0
0xdb4e2a: mov dword ptr [rsp + 0x74], 3
0xdb4e32: mov rdx, qword ptr [rdi + 0x120]
0xdb4e39: mov ecx, dword ptr [rsp + 0x70]
0xdb4e3d: test rdx, rdx
0xdb4e40: je 0x140db4e55
0xdb4e42: mov rax, qword ptr [rsp + 0x68]
0xdb4e47: mov qword ptr [rax + rcx*8], rdx
0xdb4e4b: mov ecx, dword ptr [rsp + 0x70]
0xdb4e4f: inc ecx
0xdb4e51: mov dword ptr [rsp + 0x70], ecx
0xdb4e55: mov rbx, qword ptr [rdi + 0x130]
0xdb4e5c: test rbx, rbx
0xdb4e5f: je 0x140db4e96
0xdb4e61: cmp ecx, dword ptr [rsp + 0x74]
0xdb4e65: jb 0x140db4e83
0xdb4e67: mov r9d, 8
0xdb4e6d: xor r8d, r8d
0xdb4e70: lea rdx, [rsp + 0x78]
0xdb4e75: lea rcx, [rsp + 0x68]
0xdb4e7a: call 0x140392380
0xdb4e7f: mov ecx, dword ptr [rsp + 0x70]
0xdb4e83: mov rax, qword ptr [rsp + 0x68]
0xdb4e88: mov qword ptr [rax + rcx*8], rbx
0xdb4e8c: mov ecx, dword ptr [rsp + 0x70]
0xdb4e90: inc ecx
0xdb4e92: mov dword ptr [rsp + 0x70], ecx
0xdb4e96: mov rbx, qword ptr [rdi + 0x190]
0xdb4e9d: test rbx, rbx
0xdb4ea0: je 0x140db4ed7
0xdb4ea2: cmp ecx, dword ptr [rsp + 0x74]
0xdb4ea6: jb 0x140db4ec4
0xdb4ea8: mov r9d, 8
0xdb4eae: xor r8d, r8d
0xdb4eb1: lea rdx, [rsp + 0x78]
0xdb4eb6: lea rcx, [rsp + 0x68]
0xdb4ebb: call 0x140392380
0xdb4ec0: mov ecx, dword ptr [rsp + 0x70]
0xdb4ec4: mov rax, qword ptr [rsp + 0x68]
0xdb4ec9: mov qword ptr [rax + rcx*8], rbx
0xdb4ecd: mov ecx, dword ptr [rsp + 0x70]
0xdb4ed1: inc ecx
0xdb4ed3: mov dword ptr [rsp + 0x70], ecx
0xdb4ed7: test r13b, r13b
0xdb4eda: je 0x140db4ef0
0xdb4edc: mov eax, dword ptr [rip + 0x5f19f56]
0xdb4ee2: mov dword ptr [rbp + 0xd8], eax
0xdb4ee8: mov eax, dword ptr [rip + 0x5f19f4e]
0xdb4eee: jmp 0x140db4f02
0xdb4ef0: mov eax, dword ptr [rip + 0x5f19f46]
0xdb4ef6: mov dword ptr [rbp + 0xd8], eax
0xdb4efc: mov eax, dword ptr [rip + 0x5f19f36]
0xdb4f02: mov dword ptr [rbp + 0xc8], eax
0xdb4f08: mov rbx, qword ptr [rsp + 0x68]
0xdb4f0d: lea rsi, [rbx + rcx*8]
0xdb4f11: cmp rbx, rsi
0xdb4f14: je 0x140db4f64
0xdb4f16: nop word ptr [rax + rax]
0xdb4f20: lea rax, [rbp + 0xd8]
0xdb4f27: mov qword ptr [rsp + 0x30], rax
0xdb4f2c: mov dword ptr [rsp + 0x38], 1
0xdb4f34: lea rax, [rbp + 0xc8]
0xdb4f3b: mov qword ptr [rbp - 0x70], rax
0xdb4f3f: mov dword ptr [rbp - 0x68], 1
0xdb4f46: mov rcx, qword ptr [rbx]
0xdb4f49: lea r8, [rsp + 0x30]
0xdb4f4e: lea rdx, [rbp - 0x70]
0xdb4f52: mov rcx, qword ptr [rcx + 0x20]
0xdb4f56: call 0x1435ca4f0
0xdb4f5b: add rbx, 8
0xdb4f5f: cmp rbx, rsi
0xdb4f62: jne 0x140db4f20
0xdb4f64: lea rax, [rsp + 0x78]
0xdb4f69: mov rcx, qword ptr [rsp + 0x68]
0xdb4f6e: cmp rcx, rax
0xdb4f71: je 0x140db4f9d
0xdb4f73: test rcx, rcx
0xdb4f76: je 0x140db4f9d
0xdb4f78: mov r8d, 0x1fd
0xdb4f7e: mov rax, qword ptr gs:[0x58]
0xdb4f87: mov rdx, qword ptr [rax]
0xdb4f8a: cmp byte ptr [r8 + rdx], 0
0xdb4f8f: je 0x140db4f98
0xdb4f91: call 0x1447f03bc
0xdb4f96: jmp 0x140db4f9d
0xdb4f98: call 0x1447f02bc
0xdb4f9d: mov rax, qword ptr [rdi + 0x120]
0xdb4fa4: mov rcx, qword ptr [rbp + 0xa8]
0xdb4fab: vmovss xmm0, dword ptr [rcx + 4]
0xdb4fb0: vcomiss xmm0, dword ptr [rip + 0x5f29090]
0xdb4fb8: jbe 0x140db50c0
0xdb4fbe: test rax, rax
0xdb4fc1: je 0x140db500b
0xdb4fc3: mov rbx, qword ptr [rax + 0x20]
0xdb4fc7: mov rax, qword ptr [rbx]
0xdb4fca: mov rcx, qword ptr [rax + 0xa0]
0xdb4fd1: test rcx, rcx
0xdb4fd4: je 0x140db4fdd
0xdb4fd6: cmp qword ptr [rcx + 8], 0
0xdb4fdb: jne 0x140db500b
0xdb4fdd: cmp dword ptr [rip + 0x5f1b038], 0
0xdb4fe4: je 0x140db500b
0xdb4fe6: lea rdx, [rip + 0x5f1b02f]
0xdb4fed: mov rcx, qword ptr [rbx + 8]
0xdb4ff1: call 0x1435ca0a0
0xdb4ff6: test al, al
0xdb4ff8: je 0x140db500b
0xdb4ffa: mov rcx, qword ptr [rbx + 8]
0xdb4ffe: call 0x1435caec0
0xdb5003: mov rcx, rbx
0xdb5006: call 0x1435c66a0
0xdb500b: mov rbx, qword ptr [rdi + 0x190]
0xdb5012: test rbx, rbx
0xdb5015: je 0x140db505f
0xdb5017: mov rbx, qword ptr [rbx + 0x20]
0xdb501b: mov rax, qword ptr [rbx]
0xdb501e: mov rcx, qword ptr [rax + 0xa0]
0xdb5025: test rcx, rcx
0xdb5028: je 0x140db5031
0xdb502a: cmp qword ptr [rcx + 8], 0
0xdb502f: jne 0x140db505f
0xdb5031: cmp dword ptr [rip + 0x5f1afe4], 0
0xdb5038: je 0x140db505f
0xdb503a: lea rdx, [rip + 0x5f1afdb]
0xdb5041: mov rcx, qword ptr [rbx + 8]
0xdb5045: call 0x1435ca0a0
0xdb504a: test al, al
0xdb504c: je 0x140db505f
0xdb504e: mov rcx, qword ptr [rbx + 8]
0xdb5052: call 0x1435caec0
0xdb5057: mov rcx, rbx
0xdb505a: call 0x1435c66a0
0xdb505f: mov rbx, qword ptr [rdi + 0x130]
0xdb5066: test rbx, rbx
0xdb5069: je 0x140db5182
0xdb506f: mov rbx, qword ptr [rbx + 0x20]
0xdb5073: mov rax, qword ptr [rbx]
0xdb5076: mov rcx, qword ptr [rax + 0xa0]
0xdb507d: test rcx, rcx
0xdb5080: je 0x140db508d
0xdb5082: cmp qword ptr [rcx + 8], 0
0xdb5087: jne 0x140db5182
0xdb508d: cmp dword ptr [rip + 0x5f1af88], 0
0xdb5094: je 0x140db5182
0xdb509a: lea rdx, [rip + 0x5f1af7b]
0xdb50a1: mov rcx, qword ptr [rbx + 8]
0xdb50a5: call 0x1435ca0a0
0xdb50aa: test al, al
0xdb50ac: je 0x140db5182
0xdb50b2: mov rcx, qword ptr [rbx + 8]
0xdb50b6: call 0x1435caec0
0xdb50bb: jmp 0x140db517a
0xdb50c0: test rax, rax
0xdb50c3: je 0x140db50fc
0xdb50c5: mov rbx, qword ptr [rax + 0x20]
0xdb50c9: mov rax, qword ptr [rbx]
0xdb50cc: mov rcx, qword ptr [rax + 0xa0]
0xdb50d3: test rcx, rcx
0xdb50d6: je 0x140db50df
0xdb50d8: cmp qword ptr [rcx + 8], 0
0xdb50dd: jne 0x140db50fc
0xdb50df: lea rdx, [rip + 0x5f1af36]
0xdb50e6: mov rcx, qword ptr [rbx + 8]
0xdb50ea: call 0x1435ca140
0xdb50ef: cmp eax, -1
0xdb50f2: je 0x140db50fc
0xdb50f4: mov rcx, rbx
0xdb50f7: call 0x1435c66a0
0xdb50fc: mov rbx, qword ptr [rdi + 0x190]
0xdb5103: test rbx, rbx
0xdb5106: je 0x140db513f
0xdb5108: mov rbx, qword ptr [rbx + 0x20]
0xdb510c: mov rax, qword ptr [rbx]
0xdb510f: mov rcx, qword ptr [rax + 0xa0]
0xdb5116: test rcx, rcx
0xdb5119: je 0x140db5122
0xdb511b: cmp qword ptr [rcx + 8], 0
0xdb5120: jne 0x140db513f
0xdb5122: lea rdx, [rip + 0x5f1aef3]
0xdb5129: mov rcx, qword ptr [rbx + 8]
0xdb512d: call 0x1435ca140
0xdb5132: cmp eax, -1
0xdb5135: je 0x140db513f
0xdb5137: mov rcx, rbx
0xdb513a: call 0x1435c66a0
0xdb513f: mov rbx, qword ptr [rdi + 0x130]
0xdb5146: test rbx, rbx
0xdb5149: je 0x140db5182
0xdb514b: mov rbx, qword ptr [rbx + 0x20]
0xdb514f: mov rax, qword ptr [rbx]
0xdb5152: mov rcx, qword ptr [rax + 0xa0]
0xdb5159: test rcx, rcx
0xdb515c: je 0x140db5165
0xdb515e: cmp qword ptr [rcx + 8], 0
0xdb5163: jne 0x140db5182
0xdb5165: lea rdx, [rip + 0x5f1aeb0]
0xdb516c: mov rcx, qword ptr [rbx + 8]
0xdb5170: call 0x1435ca140
0xdb5175: cmp eax, -1
0xdb5178: je 0x140db5182
0xdb517a: mov rcx, rbx
0xdb517d: call 0x1435c66a0
0xdb5182: mov rax, qword ptr [rbp + 0xa0]
0xdb5189: mov r8d, dword ptr [rax]
0xdb518c: test r8d, r8d
0xdb518f: je 0x140db51f7
0xdb5191: lea rdx, [rbp - 0x70]
0xdb5195: call 0x14064f570
0xdb519a: nop 
0xdb519b: cmp byte ptr [rbp - 0x60], 0
0xdb519f: je 0x140db51e3
0xdb51a1: mov rax, qword ptr [rbp - 0x68]
0xdb51a5: mov rcx, qword ptr [rax + 0x68]
0xdb51a9: mov rcx, qword ptr [rcx + 0x20]
0xdb51ad: add rcx, 0x30
0xdb51b1: call 0x140389570
0xdb51b6: movzx ecx, word ptr [rax + 0xbe]
0xdb51bd: mov word ptr [rbp + 0xd8], cx
0xdb51c4: cmp cx, r14w
0xdb51c8: je 0x140db51e3
0xdb51ca: lea rcx, [rbp + 0xd8]
0xdb51d1: call 0x1403891b0
0xdb51d6: cmp byte ptr [rax + 0x5b], 0
0xdb51da: je 0x140db51e3
0xdb51dc: mov byte ptr [rdi + 0x2b6], 1
0xdb51e3: lea rax, [rip + 0x4970c5e]
0xdb51ea: mov qword ptr [rbp - 0x70], rax
0xdb51ee: lea rcx, [rbp - 0x70]
0xdb51f2: call 0x141434880
0xdb51f7: mov rcx, r12
0xdb51fa: call 0x140537250
0xdb51ff: cmp dword ptr [rax + 0x2c], 0x5f
0xdb5203: jne 0x140db520c
0xdb5205: mov byte ptr [rdi + 0x1d5], 1
0xdb520c: mov rbx, qword ptr [rdi + 0x104]
0xdb5213: mov qword ptr [rbp + 0x90], rbx
0xdb521a: vmovss xmm6, dword ptr [rbp + 0xc0]
0xdb5222: vucomiss xmm6, xmm7
0xdb5226: jp 0x140db5253
0xdb5228: jne 0x140db5253
0xdb522a: xor sil, sil
0xdb522d: vmovss xmm0, dword ptr [rbp + 0x90]
0xdb5235: vucomiss xmm0, xmm7
0xdb5239: jp 0x140db5256
0xdb523b: jne 0x140db5256
0xdb523d: vmovss xmm0, dword ptr [rbp + 0x94]
0xdb5245: vucomiss xmm0, xmm7
0xdb5249: jp 0x140db5256
0xdb524b: je 0x140db54ce
0xdb5251: jmp 0x140db5256
0xdb5253: mov sil, 1
0xdb5256: mov rax, qword ptr [r15 + 0x590]
0xdb525d: mov rcx, qword ptr [rax + 8]
0xdb5261: mov rcx, qword ptr [rcx + 0x20]
0xdb5265: mov byte ptr [rbp + 0xd8], 6
0xdb526c: lea r8, [rbp + 0xd8]
0xdb5273: lea rdx, [rbp - 0x70]
0xdb5277: call 0x1435c8ef0
0xdb527c: lea rcx, [rbp - 0x70]
0xdb5280: call 0x140615320
0xdb5285: cmp byte ptr [rax + 0xe], 0
0xdb5289: je 0x140db528e
0xdb528b: mov rax, qword ptr [rax]
0xdb528e: vmovss xmm9, dword ptr [rax]
0xdb5292: test sil, sil
0xdb5295: je 0x140db52a1
0xdb5297: vaddss xmm7, xmm6, xmm6
0xdb529b: vmovaps xmm8, xmm7
0xdb529f: jmp 0x140db52b8
0xdb52a1: mov qword ptr [rbp + 0x90], rbx
0xdb52a8: vmovss xmm7, dword ptr [rbp + 0x90]
0xdb52b0: vmovss xmm8, dword ptr [rbp + 0x94]
0xdb52b8: lea rcx, [r15 + 0xa00]
0xdb52bf: call 0x1404a2010
0xdb52c4: vmovss xmm3, dword ptr [rax + 0x2c]
0xdb52c9: vmovss xmm0, dword ptr [rip + 0x5ef6767]
0xdb52d1: vdivss xmm1, xmm0, xmm0
0xdb52d5: vmulss xmm2, xmm1, xmm9
0xdb52da: vdivss xmm3, xmm3, xmm2
0xdb52de: vmovss xmm0, dword ptr [rip + 0x4fbddce]
0xdb52e6: vdivss xmm1, xmm0, xmm3
0xdb52ea: vmulss xmm0, xmm1, xmm7
0xdb52ee: vmovss dword ptr [rbp + 0x80], xmm0
0xdb52f6: vmulss xmm1, xmm8, xmm1
0xdb52fa: vmovss dword ptr [rbp + 0x84], xmm1
0xdb5302: test sil, sil
0xdb5305: je 0x140db5328
0xdb5307: vmovss dword ptr [rdi + 0x100], xmm6
0xdb530f: cmp byte ptr [rdi + 0x2b8], 0
0xdb5316: je 0x140db5328
0xdb5318: vdivss xmm0, xmm6, dword ptr [rip + 0x5ef6718]
0xdb5320: vmovss dword ptr [rdi + 0x280], xmm0
0xdb5328: mov rax, qword ptr [rdi + 0x118]
0xdb532f: mov rcx, qword ptr [rax + 0x20]
0xdb5333: mov byte ptr [rbp + 0xd8], 1
0xdb533a: mov byte ptr [rbp + 0xc8], 6
0xdb5341: lea r9, [rbp + 0xd8]
0xdb5348: lea r8, [rbp + 0x80]
0xdb534f: lea rdx, [rbp + 0xc8]
0xdb5356: call 0x14064b570
0xdb535b: mov rax, qword ptr [rdi + 0x118]
0xdb5362: mov rcx, qword ptr [rax + 0x20]
0xdb5366: mov byte ptr [rbp + 0xd8], 1
0xdb536d: mov byte ptr [rbp + 0xc8], 9
0xdb5374: lea r9, [rbp + 0xd8]
0xdb537b: lea r8, [rbp + 0x84]
0xdb5382: lea rdx, [rbp + 0xc8]
0xdb5389: call 0x14064b570
0xdb538e: vmovss xmm3, dword ptr [rip + 0x4fbdb9e]
0xdb5396: vmulss xmm1, xmm3, dword ptr [rbp + 0x80]
0xdb539e: vmulss xmm2, xmm1, dword ptr [rip + 0x5ef6822]
0xdb53a6: vmovss dword ptr [rbp + 0xa8], xmm2
0xdb53ae: vmulss xmm1, xmm3, dword ptr [rbp + 0x84]
0xdb53b6: vmulss xmm2, xmm1, dword ptr [rip + 0x5ef680a]
0xdb53be: vmovss dword ptr [rbp + 0xac], xmm2
0xdb53c6: mov rbx, qword ptr [rdi + 0x160]
0xdb53cd: vmovss xmm6, dword ptr [rip + 0x4fc097b]
0xdb53d5: test rbx, rbx
0xdb53d8: je 0x140db544e
0xdb53da: mov rax, qword ptr [rbx + 8]
0xdb53de: mov rcx, qword ptr [rax + 0x20]
0xdb53e2: mov byte ptr [rbp + 0xd8], 1
0xdb53e9: mov byte ptr [rbp + 0xc8], 2
0xdb53f0: lea r9, [rbp + 0xd8]
0xdb53f7: lea r8, [rbp + 0xa8]
0xdb53fe: lea rdx, [rbp + 0xc8]
0xdb5405: call 0x14064b570
0xdb540a: mov rax, qword ptr [rbx + 8]
0xdb540e: mov rcx, qword ptr [rax + 0x20]
0xdb5412: mov byte ptr [rbp + 0xd8], 1
0xdb5419: vmovss xmm0, dword ptr [rbp + 0xac]
0xdb5421: vxorps xmm1, xmm0, xmm6
0xdb5425: vmovss dword ptr [rbp + 0x90], xmm1
0xdb542d: mov byte ptr [rbp + 0xc8], 4
0xdb5434: lea r9, [rbp + 0xd8]
0xdb543b: lea r8, [rbp + 0x90]
0xdb5442: lea rdx, [rbp + 0xc8]
0xdb5449: call 0x14064b570
0xdb544e: mov rbx, qword ptr [rdi + 0x170]
0xdb5455: test rbx, rbx
0xdb5458: je 0x140db54ce
0xdb545a: mov rax, qword ptr [rbx + 8]
0xdb545e: mov rcx, qword ptr [rax + 0x20]
0xdb5462: mov byte ptr [rbp + 0xd8], 1
0xdb5469: mov byte ptr [rbp + 0xc8], 2
0xdb5470: lea r9, [rbp + 0xd8]
0xdb5477: lea r8, [rbp + 0xa8]
0xdb547e: lea rdx, [rbp + 0xc8]
0xdb5485: call 0x14064b570
0xdb548a: mov rax, qword ptr [rbx + 8]
0xdb548e: mov rcx, qword ptr [rax + 0x20]
0xdb5492: mov byte ptr [rbp + 0xd8], 1
0xdb5499: vmovss xmm0, dword ptr [rbp + 0xac]
0xdb54a1: vxorps xmm1, xmm0, xmm6
0xdb54a5: vmovss dword ptr [rbp + 0x90], xmm1
0xdb54ad: mov byte ptr [rbp + 0xc8], 4
0xdb54b4: lea r9, [rbp + 0xd8]
0xdb54bb: lea r8, [rbp + 0x90]
0xdb54c2: lea rdx, [rbp + 0xc8]
0xdb54c9: call 0x14064b570
0xdb54ce: mov al, 1
0xdb54d0: lea r11, [rsp + 0x140]
0xdb54d8: mov rbx, qword ptr [r11 + 0x48]
0xdb54dc: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdb54e2: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdb54e8: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdb54ee: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdb54f4: mov rsp, r11
0xdb54f7: pop r15
0xdb54f9: pop r14
0xdb54fb: pop r13
0xdb54fd: pop r12
0xdb54ff: pop rdi
0xdb5500: pop rsi
0xdb5501: pop rbp
0xdb5502: ret 
CALLEE 0x3d3080
0x3d3080: push rbx
0x3d3082: push rbp
0x3d3083: sub rsp, 0x28
0x3d3087: mov ebp, edx
0x3d3089: mov rbx, rcx
0x3d308c: cmp edx, dword ptr [rcx + 0xc]
0x3d308f: ja 0x1403d309a
0x3d3091: xor al, al
0x3d3093: add rsp, 0x28
0x3d3097: pop rbp
0x3d3098: pop rbx
0x3d3099: ret 
0x3d309a: mov rax, qword ptr gs:[0x58]
0x3d30a3: lea ecx, [rdx*8]
0x3d30aa: mov qword ptr [rsp + 0x40], rsi
0x3d30af: mov edx, 8
CALLEE 0x3d2cb50
0x3d2cb50: mov qword ptr [rsp + 0x10], rdx
0x3d2cb55: push rbx
0x3d2cb56: push rbp
0x3d2cb57: push rsi
0x3d2cb58: push rdi
0x3d2cb59: push r12
0x3d2cb5b: push r14
0x3d2cb5d: push r15
0x3d2cb5f: sub rsp, 0x80
0x3d2cb66: movzx r15d, r8b
0x3d2cb6a: mov rbp, rcx
0x3d2cb6d: lea rdi, [rcx + 8]
0x3d2cb71: mov qword ptr [rsp + 0x68], rdi
0x3d2cb76: mov byte ptr [rsp + 0x70], 1
0x3d2cb7b: mov edx, 1
0x3d2cb80: lock xadd dword ptr [rdi + 8], edx
0x3d2cb85: inc edx
0x3d2cb87: mov eax, dword ptr [rdi + 0xc]
0x3d2cb8a: shr eax, 0x1f
0x3d2cb8d: test al, al
0x3d2cb8f: jne 0x143d2cba0
0x3d2cb91: cmp edx, 1
0x3d2cb94: sete dl
0x3d2cb97: mov rax, qword ptr [rdi]
0x3d2cb9a: mov rcx, rdi
0x3d2cb9d: call qword ptr [rax + 0x30]
0x3d2cba0: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cba7: je 0x143d2cbad
0x3d2cba9: lock inc dword ptr [rdi + 0xc]
0x3d2cbad: mov rax, qword ptr [rdi]
0x3d2cbb0: xor edx, edx
0x3d2cbb2: mov rcx, rdi
0x3d2cbb5: call qword ptr [rax + 0x18]
0x3d2cbb8: nop 
0x3d2cbb9: xor r12d, r12d
0x3d2cbbc: cmp dword ptr [rbp + 0x3c], r12d
0x3d2cbc0: je 0x143d2cc3f
0x3d2cbc2: mov rsi, qword ptr [rsp + 0xc8]
0x3d2cbca: mov qword ptr [rsp + 0xc0], rsi
0x3d2cbd2: mov edx, 8
0x3d2cbd7: lea rcx, [rsp + 0xc0]
0x3d2cbdf: call 0x1403d6210
0x3d2cbe4: mov r10d, eax
0x3d2cbe7: mov ecx, dword ptr [rbp + 0x38]
0x3d2cbea: test ecx, ecx
0x3d2cbec: je 0x143d2cc3f
0x3d2cbee: xor edx, edx
0x3d2cbf0: div ecx
0x3d2cbf2: mov r8d, edx
0x3d2cbf5: shl r8, 8
0x3d2cbf9: add r8, qword ptr [rbp + 0x48]
0x3d2cbfd: mov edx, r12d
0x3d2cc00: mov r9d, dword ptr [r8]
0x3d2cc03: test r9d, r9d
0x3d2cc06: je 0x143d2cc3f
0x3d2cc08: nop dword ptr [rax + rax]
0x3d2cc10: mov eax, edx
0x3d2cc12: cmp dword ptr [r8 + rax*8 + 8], r10d
0x3d2cc17: jne 0x143d2cc2c
0x3d2cc19: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0x3d2cc1e: mov rax, qword ptr [rbp + 0x50]
0x3d2cc22: mov rbx, qword ptr [rax + rcx*8]
0x3d2cc26: cmp qword ptr [rbx + 8], rsi
0x3d2cc2a: je 0x143d2cc35
0x3d2cc2c: inc edx
0x3d2cc2e: cmp edx, r9d
0x3d2cc31: jb 0x143d2cc10
0x3d2cc33: jmp 0x143d2cc3f
0x3d2cc35: add rbx, 0x10
0x3d2cc39: jne 0x143d2cd6c
0x3d2cc3f: test r15b, r15b
0x3d2cc42: je 0x143d2cdaa
0x3d2cc48: mov edx, 0x1fd
0x3d2cc4d: mov rax, qword ptr gs:[0x58]
0x3d2cc56: mov rcx, qword ptr [rax]
0x3d2cc59: cmp byte ptr [rdx + rcx], r12b
0x3d2cc5d: mov edx, 0x10
0x3d2cc62: mov ecx, 0x68
0x3d2cc67: je 0x143d2cc70
0x3d2cc69: call 0x1447efa78
0x3d2cc6e: jmp 0x143d2cc75
0x3d2cc70: call 0x1447ef9b0
0x3d2cc75: mov rsi, rax
0x3d2cc78: test rax, rax
0x3d2cc7b: jne 0x143d2cc98
0x3d2cc7d: call 0x141318e70
0x3d2cc82: xor r9d, r9d
0x3d2cc85: xor r8d, r8d
0x3d2cc88: mov edx, 1
0x3d2cc8d: mov ecx, 0xa0000002
0x3d2cc92: call qword ptr [rip + 0x14be4b0]
0x3d2cc98: mov qword ptr [rsp + 0xc0], rsi
0x3d2cca0: test rsi, rsi
0x3d2cca3: je 0x143d2ccf0
0x3d2cca5: mov rax, qword ptr [rsp + 0xc8]
0x3d2ccad: lea rbx, [rsi + 0x38]
0x3d2ccb1: mov qword ptr [rsi], rbx
0x3d2ccb4: mov qword ptr [rsi + 8], r12
0x3d2ccb8: mov dword ptr [rsi + 0x10], r12d
0x3d2ccbc: mov dword ptr [rsi + 0x14], 0xffffffff
0x3d2ccc3: mov qword ptr [rsi + 0x18], r12
0x3d2ccc7: mov qword ptr [rsi + 0x20], r12
0x3d2cccb: mov qword ptr [rsi + 0x28], rax
0x3d2cccf: mov qword ptr [rsi + 0x30], rbp
0x3d2ccd3: mov qword ptr [rsp + 0xd8], rbx
0x3d2ccdb: mov rcx, rbx
0x3d2ccde: call 0x141371960
0x3d2cce3: nop 
0x3d2cce4: lea rax, [rip + 0x18501e5]
0x3d2cceb: mov qword ptr [rbx], rax
0x3d2ccee: jmp 0x143d2ccf3
0x3d2ccf0: mov rsi, r12
0x3d2ccf3: mov qword ptr [rsp + 0xd8], rsi
0x3d2ccfb: lea rax, [rsp + 0xc8]
0x3d2cd03: mov qword ptr [rsp + 0x50], rax
0x3d2cd08: inc dword ptr [rbp + 0x44]
0x3d2cd0b: mov rax, qword ptr [rsp + 0xc8]
0x3d2cd13: mov qword ptr [rsp + 0xc0], rax
0x3d2cd1b: mov edx, 8
0x3d2cd20: lea rcx, [rsp + 0xc0]
0x3d2cd28: call 0x1403d6210
0x3d2cd2d: mov r8d, eax
0x3d2cd30: lea rax, [rsp + 0x58]
0x3d2cd35: mov qword ptr [rsp + 0x38], rax
0x3d2cd3a: lea rax, [rsp + 0x60]
0x3d2cd3f: mov qword ptr [rsp + 0x30], rax
0x3d2cd44: lea rax, [rsp + 0xc0]
0x3d2cd4c: mov qword ptr [rsp + 0x28], rax
0x3d2cd51: lea r9, [rsp + 0xd8]
0x3d2cd59: lea rdx, [rsp + 0x50]
0x3d2cd5e: lea rcx, [rbp + 0x38]
0x3d2cd62: call 0x143d32570
0x3d2cd67: mov rbx, qword ptr [rsp + 0x58]
0x3d2cd6c: mov rax, qword ptr [rdi]
0x3d2cd6f: xor edx, edx
0x3d2cd71: mov rcx, rdi
0x3d2cd74: call qword ptr [rax + 0x20]
0x3d2cd77: mov eax, 0xffffffff
0x3d2cd7c: lock xadd dword ptr [rdi + 8], eax
0x3d2cd81: cmp eax, 1
0x3d2cd84: jne 0x143d2cd98
0x3d2cd86: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd8d: je 0x143d2cda5
0x3d2cd8f: mov rax, qword ptr [rdi]
0x3d2cd92: mov rcx, rdi
0x3d2cd95: call qword ptr [rax + 0x40]
0x3d2cd98: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cd9f: je 0x143d2cda5
0x3d2cda1: lock dec dword ptr [rdi + 0xc]
0x3d2cda5: mov rax, qword ptr [rbx]
0x3d2cda8: jmp 0x143d2cde5
0x3d2cdaa: mov rax, qword ptr [rdi]
0x3d2cdad: xor edx, edx
0x3d2cdaf: mov rcx, rdi
0x3d2cdb2: call qword ptr [rax + 0x20]
0x3d2cdb5: mov eax, 0xffffffff
0x3d2cdba: lock xadd dword ptr [rdi + 8], eax
0x3d2cdbf: cmp eax, 1
0x3d2cdc2: jne 0x143d2cdd6
0x3d2cdc4: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cdcb: je 0x143d2cde3
0x3d2cdcd: mov rax, qword ptr [rdi]
0x3d2cdd0: mov rcx, rdi
0x3d2cdd3: call qword ptr [rax + 0x40]
0x3d2cdd6: test dword ptr [rdi + 0xc], 0x40000000
0x3d2cddd: je 0x143d2cde3
0x3d2cddf: lock dec dword ptr [rdi + 0xc]
0x3d2cde3: xor eax, eax
0x3d2cde5: add rsp, 0x80
0x3d2cdec: pop r15
0x3d2cdee: pop r14
0x3d2cdf0: pop r12
0x3d2cdf2: pop rdi
0x3d2cdf3: pop rsi
0x3d2cdf4: pop rbp
0x3d2cdf5: pop rbx
0x3d2cdf6: ret 
CALLEE 0x3edee50
0x3edee50: mov qword ptr [rsp + 8], rbx
0x3edee55: mov qword ptr [rsp + 0x10], rbp
0x3edee5a: mov qword ptr [rsp + 0x18], rsi
0x3edee5f: mov qword ptr [rsp + 0x20], rdi
0x3edee64: push r14
0x3edee66: sub rsp, 0x50
0x3edee6a: mov rsi, rcx
0x3edee6d: mov rax, qword ptr [rcx + 0xa0]
0x3edee74: xor r14d, r14d
0x3edee77: test rax, rax
0x3edee7a: je 0x143edef79
0x3edee80: mov rcx, qword ptr [rax]
0x3edee83: test rcx, rcx
0x3edee86: je 0x143edef79
0x3edee8c: mov byte ptr [rcx + 0x19], 1
0x3edee90: mov ebx, r14d
0x3edee93: mov qword ptr [rsp + 0x20], rbx
0x3edee98: mov r8d, r14d
0x3edee9b: mov qword ptr [rsp + 0x28], r14
0x3edeea0: mov rdx, qword ptr [rsi + 0x20]
0x3edeea4: mov rax, qword ptr [rdx]
0x3edeea7: mov rcx, qword ptr [rax + 0xa0]
0x3edeeae: test rcx, rcx
0x3edeeb1: je 0x143edeeb9
0x3edeeb3: cmp qword ptr [rcx + 8], r14
0x3edeeb7: jne 0x143edeed1
0x3edeeb9: mov rdx, qword ptr [rdx + 8]
0x3edeebd: lea rcx, [rsp + 0x20]
0x3edeec2: call 0x1408447d0
0x3edeec7: mov r8d, dword ptr [rsp + 0x28]
0x3edeecc: mov rbx, qword ptr [rsp + 0x20]
0x3edeed1: mov rax, qword ptr [rsi + 0xa0]
0x3edeed8: mov rcx, qword ptr [rax]
0x3edeedb: mov r9, qword ptr [rcx + 0x10]
0x3edeedf: mov r10d, dword ptr [r9 + 8]
0x3edeee3: test r10d, r10d
0x3edeee6: jne 0x143edeeed
0x3edeee8: test r8d, r8d
0x3edeeeb: je 0x143edef44
0x3edeeed: mov r9, qword ptr [r9]
0x3edeef0: cmp r8d, r10d
0x3edeef3: jne 0x143edef1c
0x3edeef5: mov edx, r14d
0x3edeef8: test r8d, r8d
0x3edeefb: je 0x143edef44
0x3edeefd: nop dword ptr [rax]
0x3edef00: mov eax, edx
0x3edef02: lea rcx, [rax*4]
0x3edef0a: mov eax, dword ptr [rcx + r9]
0x3edef0e: cmp dword ptr [rcx + rbx], eax
0x3edef11: jne 0x143edef1c
0x3edef13: inc edx
0x3edef15: cmp edx, r8d
0x3edef18: jb 0x143edef00
0x3edef1a: jmp 0x143edef44
0x3edef1c: mov qword ptr [rsp + 0x30], r9
0x3edef21: mov dword ptr [rsp + 0x38], r10d
0x3edef26: mov qword ptr [rsp + 0x40], rbx
0x3edef2b: mov dword ptr [rsp + 0x48], r8d
0x3edef30: lea r8, [rsp + 0x30]
0x3edef35: lea rdx, [rsp + 0x40]
0x3edef3a: mov rcx, qword ptr [rsi + 0x20]
0x3edef3e: call 0x1435ca4f0
0x3edef43: nop 
0x3edef44: test rbx, rbx
0x3edef47: je 0x143edef6f
0x3edef49: mov ecx, 0x1fd
0x3edef4e: mov rax, qword ptr gs:[0x58]
0x3edef57: mov rdx, qword ptr [rax]
0x3edef5a: cmp byte ptr [rcx + rdx], 0
0x3edef5e: mov rcx, rbx
0x3edef61: je 0x143edef6a
0x3edef63: call 0x1447f03bc
0x3edef68: jmp 0x143edef6f
0x3edef6a: call 0x1447f02bc
0x3edef6f: mov qword ptr [rsp + 0x20], r14
0x3edef74: mov qword ptr [rsp + 0x28], r14
0x3edef79: mov rax, qword ptr [rsi + 0xa0]
0x3edef80: test rax, rax
0x3edef83: je 0x143edef8c
0x3edef85: cmp qword ptr [rax + 8], 0
0x3edef8a: jne 0x143edefaf
0x3edef8c: mov rax, qword ptr [rsi + 0x20]
0x3edef90: mov rbx, qword ptr [rax + 0x30]
0x3edef94: test rbx, rbx
0x3edef97: je 0x143edefaf
0x3edef99: lea rcx, [rbx + 0x70]
0x3edef9d: call 0x143582ac0
0x3edefa2: mov dword ptr [rbx + 0x88], r14d
0x3edefa9: inc dword ptr [rbx + 0x90]
0x3edefaf: mov rbx, qword ptr [rsi + 0xa0]
0x3edefb6: test rbx, rbx
0x3edefb9: je 0x143edf000
0x3edefbb: mov eax, dword ptr [rbx + 0x40]
0x3edefbe: test eax, eax
0x3edefc0: je 0x143edf000
0x3edefc2: mov rbx, qword ptr [rbx + 0x38]
0x3edefc6: lea rbp, [rbx + rax*8]
0x3edefca: cmp rbx, rbp
0x3edefcd: je 0x143edf000
0x3edefcf: nop 
0x3edefd0: mov rdi, qword ptr [rbx]
0x3edefd3: test rdi, rdi
0x3edefd6: je 0x143edeff7
0x3edefd8: mov rdi, qword ptr [rdi + 0x18]
0x3edefdc: test rdi, rdi
0x3edefdf: je 0x143edeff7
0x3edefe1: lea rcx, [rdi + 0x70]
0x3edefe5: call 0x143582ac0
0x3edefea: mov dword ptr [rdi + 0x88], r14d
0x3edeff1: inc dword ptr [rdi + 0x90]
0x3edeff7: add rbx, 8
0x3edeffb: cmp rbx, rbp
0x3edeffe: jne 0x143edefd0
0x3edf000: mov rax, qword ptr [rsi + 0xa0]
0x3edf007: test rax, rax
0x3edf00a: je 0x143edf013
0x3edf00c: cmp qword ptr [rax + 8], 0
0x3edf011: jne 0x143edf052
0x3edf013: mov rbx, qword ptr [rsi + 0xd8]
0x3edf01a: test rbx, rbx
0x3edf01d: jne 0x143edf03a
0x3edf01f: test rax, rax
0x3edf022: je 0x143edf052
0x3edf024: mov rcx, qword ptr [rax + 0x58]
0x3edf028: test rcx, rcx
0x3edf02b: je 0x143edf052
0x3edf02d: call 0x143ed84d0
0x3edf032: mov rbx, rax
0x3edf035: test rax, rax
0x3edf038: je 0x143edf052
0x3edf03a: mov rax, qword ptr [rbx]
0x3edf03d: mov rcx, rbx
0x3edf040: call qword ptr [rax + 0x170]
0x3edf046: mov rax, qword ptr [rbx]
0x3edf049: mov rcx, rbx
0x3edf04c: call qword ptr [rax + 0x180]
0x3edf052: mov rbx, qword ptr [rsi + 0x40]
0x3edf056: mov eax, dword ptr [rsi + 0x48]
0x3edf059: lea rdi, [rbx + rax*8]
0x3edf05d: cmp rbx, rdi
0x3edf060: je 0x143edf073
0x3edf062: mov rcx, qword ptr [rbx]
0x3edf065: call 0x143edee50
0x3edf06a: add rbx, 8
0x3edf06e: cmp rbx, rdi
0x3edf071: jne 0x143edf062
0x3edf073: mov rbx, qword ptr [rsp + 0x60]
0x3edf078: mov rbp, qword ptr [rsp + 0x68]
0x3edf07d: mov rsi, qword ptr [rsp + 0x70]
0x3edf082: mov rdi, qword ptr [rsp + 0x78]
0x3edf087: add rsp, 0x50
0x3edf08b: pop r14
0x3edf08d: ret 
CALLEE 0x3ed6180
0x3ed6180: push rbx
0x3ed6182: push rbp
0x3ed6183: sub rsp, 0x28
0x3ed6187: mov rax, qword ptr [rcx + 0xa0]
0x3ed618e: mov rbx, rcx
0x3ed6191: mov ebp, edx
0x3ed6193: test rax, rax
0x3ed6196: je 0x143ed61a3
0x3ed6198: cmp qword ptr [rax + 8], 0
0x3ed619d: jne 0x143ed6310
0x3ed61a3: mov rax, qword ptr [rcx + 0x40]
CALLEE 0x393650
0x393650: mov qword ptr [rsp + 8], rbx
0x393655: push rdi
0x393656: sub rsp, 0x20
0x39365a: mov qword ptr [rcx], rdx
0x39365d: mov rbx, rdx
0x393660: mov byte ptr [rcx + 8], r8b
0x393664: mov rdi, rcx
0x393667: cmp r8b, 1
0x39366b: jne 0x14039369f
0x39366d: mov ecx, 1
0x393672: lock xadd dword ptr [rdx + 8], ecx
0x393677: mov eax, dword ptr [rdx + 0xc]
0x39367a: inc ecx
0x39367c: shr eax, 0x1f
0x39367f: test al, al
0x393681: jne 0x140393692
0x393683: mov rax, qword ptr [rbx]
0x393686: cmp ecx, 1
0x393689: mov rcx, rbx
0x39368c: sete dl
0x39368f: call qword ptr [rax + 0x30]
0x393692: test dword ptr [rbx + 0xc], 0x40000000
0x393699: je 0x14039369f
0x39369b: lock inc dword ptr [rbx + 0xc]
0x39369f: mov rax, qword ptr [rbx]
0x3936a2: xor edx, edx
0x3936a4: mov rcx, rbx
0x3936a7: call qword ptr [rax + 0x18]
0x3936aa: mov rbx, qword ptr [rsp + 0x30]
0x3936af: mov rax, rdi
0x3936b2: add rsp, 0x20
0x3936b6: pop rdi
0x3936b7: ret 
CALLEE 0x3d2c120
0x3d2c120: mov qword ptr [rsp + 0x20], rbx
0x3d2c125: mov qword ptr [rsp + 0x18], r8
0x3d2c12a: push rbp
0x3d2c12b: push rsi
0x3d2c12c: push rdi
0x3d2c12d: push r12
0x3d2c12f: push r13
0x3d2c131: push r14
0x3d2c133: push r15
0x3d2c135: mov rbp, rsp
0x3d2c138: sub rsp, 0x80
0x3d2c13f: movzx r13d, r9b
0x3d2c143: mov r12, rdx
0x3d2c146: mov r11, rcx
0x3d2c149: xor edi, edi
0x3d2c14b: mov r15, qword ptr [rip + 0x2f60b96]
0x3d2c152: cmp dword ptr [rcx + 0xc], edi
0x3d2c155: je 0x143d2c1ba
0x3d2c157: mov edi, dword ptr [rdx]
0x3d2c159: mov edx, edi
0x3d2c15b: add rdx, rdx
0x3d2c15e: mov rax, qword ptr [r15 + 0x58]
0x3d2c162: mov ebx, dword ptr [rax + rdx*8 + 8]
0x3d2c166: mov ecx, dword ptr [rcx + 8]
0x3d2c169: test ecx, ecx
0x3d2c16b: je 0x143d2c1b8
0x3d2c16d: xor edx, edx
0x3d2c16f: mov eax, ebx
0x3d2c171: div ecx
0x3d2c173: mov r9d, edx
0x3d2c176: shl r9, 8
0x3d2c17a: add r9, qword ptr [r11 + 0x18]
0x3d2c17e: xor edx, edx
0x3d2c180: mov r10d, dword ptr [r9]
0x3d2c183: test r10d, r10d
0x3d2c186: je 0x143d2c1b8
0x3d2c188: cmp dword ptr [r9 + rdx*8 + 8], ebx
0x3d2c18d: jne 0x143d2c1a2
0x3d2c18f: mov ecx, dword ptr [r9 + rdx*8 + 0xc]
0x3d2c194: mov rax, qword ptr [r11 + 0x20]
0x3d2c198: mov r8, qword ptr [rax + rcx*8]
0x3d2c19c: cmp dword ptr [r8 + 4], edi
0x3d2c1a0: je 0x143d2c1ab
0x3d2c1a2: inc edx
0x3d2c1a4: cmp edx, r10d
0x3d2c1a7: jb 0x143d2c188
0x3d2c1a9: jmp 0x143d2c1b8
0x3d2c1ab: lea rsi, [r8 + 8]
0x3d2c1af: test rsi, rsi
0x3d2c1b2: jne 0x143d2c314
0x3d2c1b8: xor edi, edi
0x3d2c1ba: test r13b, r13b
0x3d2c1bd: je 0x143d2c45b
0x3d2c1c3: mov qword ptr [rbp - 0x20], 0
0x3d2c1cb: mov dword ptr [rbp - 0x18], edi
0x3d2c1ce: mov dword ptr [rbp - 0x14], 0xffffffff
0x3d2c1d5: vpxor xmm0, xmm0, xmm0
0x3d2c1d9: vmovdqu xmmword ptr [rbp - 0x10], xmm0
0x3d2c1de: mov qword ptr [rbp + 0x48], r12
0x3d2c1e2: inc dword ptr [r11 + 0x14]
0x3d2c1e6: mov eax, dword ptr [r12]
0x3d2c1ea: add rax, rax
0x3d2c1ed: mov r8, qword ptr [r15 + 0x58]
0x3d2c1f1: lea rcx, [rbp - 0x30]
0x3d2c1f5: mov qword ptr [rsp + 0x38], rcx
0x3d2c1fa: lea rcx, [rbp - 0x28]
0x3d2c1fe: mov qword ptr [rsp + 0x30], rcx
0x3d2c203: lea rcx, [rbp + 0x40]
0x3d2c207: mov qword ptr [rsp + 0x28], rcx
0x3d2c20c: lea r9, [rbp - 0x20]
0x3d2c210: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c215: lea rdx, [rbp + 0x48]
0x3d2c219: lea rcx, [r11 + 8]
0x3d2c21d: call 0x143d31d30
0x3d2c222: mov rsi, qword ptr [rbp - 0x30]
0x3d2c226: inc dword ptr [rbp - 0x14]
0x3d2c229: mov r12d, 0x1fd
0x3d2c22f: mov ebx, r12d
0x3d2c232: mov rcx, qword ptr [rbp - 0x10]
0x3d2c236: test rcx, rcx
0x3d2c239: je 0x143d2c265
0x3d2c23b: mov dword ptr [rbp - 0x20], edi
0x3d2c23e: mov rax, qword ptr gs:[0x58]
0x3d2c247: mov rdx, qword ptr [rax]
0x3d2c24a: cmp byte ptr [r12 + rdx], 0
0x3d2c24f: je 0x143d2c258
0x3d2c251: call 0x1447f03bc
0x3d2c256: jmp 0x143d2c25d
0x3d2c258: call 0x1447f02bc
0x3d2c25d: mov qword ptr [rbp - 0x10], rdi
0x3d2c261: mov qword ptr [rbp - 0x10], rdi
0x3d2c265: mov r14, qword ptr [rbp - 8]
0x3d2c269: test r14, r14
0x3d2c26c: je 0x143d2c30b
0x3d2c272: mov eax, dword ptr [rbp - 0x1c]
0x3d2c275: test eax, eax
0x3d2c277: je 0x143d2c2cb
0x3d2c279: mov rbx, r14
0x3d2c27c: mov edi, eax
0x3d2c27e: nop 
0x3d2c280: mov rcx, qword ptr [rbx]
0x3d2c283: mov qword ptr [rbp + 0x40], rcx
0x3d2c287: add rcx, 8
0x3d2c28b: call 0x1403d3000
0x3d2c290: mov rcx, qword ptr [rbx]
0x3d2c293: test rcx, rcx
0x3d2c296: je 0x143d2c2b7
0x3d2c298: mov rax, qword ptr gs:[0x58]
0x3d2c2a1: mov rdx, qword ptr [rax]
0x3d2c2a4: cmp byte ptr [r12 + rdx], 0
0x3d2c2a9: je 0x143d2c2b2
0x3d2c2ab: call 0x1447f03bc
0x3d2c2b0: jmp 0x143d2c2b7
0x3d2c2b2: call 0x1447f02bc
0x3d2c2b7: mov qword ptr [rbx], 0
0x3d2c2be: add rbx, 8
0x3d2c2c2: sub rdi, 1
0x3d2c2c6: jne 0x143d2c280
0x3d2c2c8: mov ebx, r12d
0x3d2c2cb: mov qword ptr [rbp - 0x1c], 0
0x3d2c2d3: mov rax, qword ptr gs:[0x58]
0x3d2c2dc: mov rdx, qword ptr [rax]
0x3d2c2df: mov rcx, r14
0x3d2c2e2: cmp byte ptr [rbx + rdx], 0
0x3d2c2e6: je 0x143d2c2fe
0x3d2c2e8: call 0x1447f03bc
0x3d2c2ed: mov qword ptr [rbp - 8], rdi
0x3d2c2f1: mov qword ptr [rbp - 8], rdi
0x3d2c2f5: mov r15, qword ptr [rip + 0x2f609ec]
0x3d2c2fc: jmp 0x143d2c31c
0x3d2c2fe: call 0x1447f02bc
0x3d2c303: mov qword ptr [rbp - 8], rdi
0x3d2c307: mov qword ptr [rbp - 8], rdi
0x3d2c30b: mov r15, qword ptr [rip + 0x2f609d6]
0x3d2c312: jmp 0x143d2c31c
0x3d2c314: xor edi, edi
0x3d2c316: mov r12d, 0x1fd
0x3d2c31c: mov rdx, qword ptr [rbp + 0x50]
0x3d2c320: cmp dword ptr [rsi + 4], 0
0x3d2c324: je 0x143d2c396
0x3d2c326: mov ebx, dword ptr [rdx]
0x3d2c328: mov ecx, ebx
0x3d2c32a: add rcx, rcx
0x3d2c32d: mov rax, qword ptr [r15 + 0x58]
0x3d2c331: mov r11d, dword ptr [rax + rcx*8 + 8]
0x3d2c336: mov ecx, dword ptr [rsi]
0x3d2c338: test ecx, ecx
0x3d2c33a: je 0x143d2c396
0x3d2c33c: xor edx, edx
0x3d2c33e: mov eax, r11d
0x3d2c341: div ecx
0x3d2c343: mov r9d, edx
0x3d2c346: shl r9, 8
0x3d2c34a: add r9, qword ptr [rsi + 0x10]
0x3d2c34e: mov edx, edi
0x3d2c350: mov r10d, dword ptr [r9]
0x3d2c353: test r10d, r10d
0x3d2c356: je 0x143d2c392
0x3d2c358: nop dword ptr [rax + rax]
0x3d2c360: mov eax, edx
0x3d2c362: cmp dword ptr [r9 + rax*8 + 8], r11d
0x3d2c367: jne 0x143d2c37c
0x3d2c369: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0x3d2c36e: mov rax, qword ptr [rsi + 0x18]
0x3d2c372: mov r8, qword ptr [rax + rcx*8]
0x3d2c376: cmp dword ptr [r8 + 4], ebx
0x3d2c37a: je 0x143d2c385
0x3d2c37c: inc edx
0x3d2c37e: cmp edx, r10d
0x3d2c381: jb 0x143d2c360
0x3d2c383: jmp 0x143d2c392
0x3d2c385: lea r14, [r8 + 8]
0x3d2c389: test r14, r14
0x3d2c38c: jne 0x143d2c456
0x3d2c392: mov rdx, qword ptr [rbp + 0x50]
0x3d2c396: test r13b, r13b
0x3d2c399: je 0x143d2c45b
0x3d2c39f: mov qword ptr [rbp - 0x20], rdi
0x3d2c3a3: mov qword ptr [rbp - 0x18], 0
0x3d2c3ab: mov qword ptr [rbp + 0x48], rdx
0x3d2c3af: inc dword ptr [rsi + 0xc]
0x3d2c3b2: mov eax, dword ptr [rdx]
0x3d2c3b4: add rax, rax
0x3d2c3b7: mov r8, qword ptr [r15 + 0x58]
0x3d2c3bb: lea rcx, [rbp - 0x30]
0x3d2c3bf: mov qword ptr [rsp + 0x38], rcx
0x3d2c3c4: lea rcx, [rbp - 0x28]
0x3d2c3c8: mov qword ptr [rsp + 0x30], rcx
0x3d2c3cd: lea rcx, [rbp + 0x40]
0x3d2c3d1: mov qword ptr [rsp + 0x28], rcx
0x3d2c3d6: lea r9, [rbp - 0x20]
0x3d2c3da: mov r8d, dword ptr [r8 + rax*8 + 8]
0x3d2c3df: lea rdx, [rbp + 0x48]
0x3d2c3e3: mov rcx, rsi
0x3d2c3e6: call 0x140e18930
0x3d2c3eb: mov r14, qword ptr [rbp - 0x30]
0x3d2c3ef: mov rsi, qword ptr [rbp - 0x20]
0x3d2c3f3: test rsi, rsi
0x3d2c3f6: je 0x143d2c44a
0x3d2c3f8: mov eax, dword ptr [rbp - 0x18]
0x3d2c3fb: test eax, eax
0x3d2c3fd: je 0x143d2c416
0x3d2c3ff: mov rbx, rsi
0x3d2c402: mov edi, eax
0x3d2c404: mov rcx, rbx
0x3d2c407: call 0x14038ad90
0x3d2c40c: add rbx, 8
0x3d2c410: sub rdi, 1
0x3d2c414: jne 0x143d2c404
0x3d2c416: mov r8d, r12d
0x3d2c419: mov rax, qword ptr gs:[0x58]
0x3d2c422: mov rdx, qword ptr [rax]
0x3d2c425: mov rcx, rsi
0x3d2c428: cmp byte ptr [r8 + rdx], 0
0x3d2c42d: je 0x143d2c445
0x3d2c42f: call 0x1447f03bc
0x3d2c434: mov qword ptr [rbp - 0x20], rdi
0x3d2c438: mov qword ptr [rbp - 0x18], 0
0x3d2c440: mov rax, r14
0x3d2c443: jmp 0x143d2c45d
0x3d2c445: call 0x1447f02bc
0x3d2c44a: mov qword ptr [rbp - 0x20], rdi
0x3d2c44e: mov qword ptr [rbp - 0x18], 0
0x3d2c456: mov rax, r14
0x3d2c459: jmp 0x143d2c45d
0x3d2c45b: xor eax, eax
0x3d2c45d: mov rbx, qword ptr [rsp + 0xd8]
0x3d2c465: add rsp, 0x80
0x3d2c46c: pop r15
0x3d2c46e: pop r14
0x3d2c470: pop r13
0x3d2c472: pop r12
0x3d2c474: pop rdi
0x3d2c475: pop rsi
0x3d2c476: pop rbp
0x3d2c477: ret 
CALLEE 0x3d1120
0x3d1120: mov qword ptr [rsp + 8], rbx
0x3d1125: push rdi
0x3d1126: sub rsp, 0x20
0x3d112a: mov rbx, rcx
0x3d112d: mov rdi, rdx
0x3d1130: mov ecx, dword ptr [rcx + 8]
0x3d1133: mov eax, dword ptr [rbx + 0xc]
0x3d1136: cmp eax, ecx
0x3d1138: ja 0x1403d115c
0x3d113a: lea edx, [rax*2 + 1]
0x3d1141: add edx, eax
0x3d1143: mov eax, 1
0x3d1148: shr edx, 1
0x3d114a: cmp edx, eax
0x3d114c: cmovb edx, eax
0x3d114f: cmp ecx, edx
0x3d1151: cmova edx, ecx
0x3d1154: mov rcx, rbx
0x3d1157: call 0x1403d3080
0x3d115c: mov ecx, dword ptr [rbx + 8]
0x3d115f: mov rax, qword ptr [rbx]
0x3d1162: lea rdx, [rax + rcx*8]
0x3d1166: xor ecx, ecx
0x3d1168: mov qword ptr [rdx], rcx
0x3d116b: mov rax, qword ptr [rdi]
0x3d116e: mov qword ptr [rdx], rax
0x3d1171: mov qword ptr [rdi], rcx
0x3d1174: mov rax, qword ptr [rdx]
0x3d1177: test rax, rax
0x3d117a: je 0x1403d1180
0x3d117c: mov byte ptr [rax + 0x16], 1
0x3d1180: inc dword ptr [rbx + 8]
0x3d1183: mov rbx, qword ptr [rsp + 0x30]
0x3d1188: add rsp, 0x20
0x3d118c: pop rdi
0x3d118d: ret 
CALLEE 0x14203f0
0x14203f0: mov qword ptr [rsp + 8], rbx
0x14203f5: push rdi
0x14203f6: sub rsp, 0x20
0x14203fa: mov rax, qword ptr gs:[0x58]
0x1420403: mov edi, ecx
0x1420405: mov r8d, 0x1fd
0x142040b: add ecx, 0x19
0x142040e: mov rdx, qword ptr [rax]
0x1420411: cmp byte ptr [r8 + rdx], 0
0x1420416: mov edx, 0x10
0x142041b: je 0x141420424
0x142041d: call 0x1447efa78
0x1420422: jmp 0x141420429
0x1420424: call 0x1447ef9b0
0x1420429: mov rbx, rax
0x142042c: test rax, rax
0x142042f: jne 0x14142044c
0x1420431: call 0x141318e70
0x1420436: xor r9d, r9d
0x1420439: xor r8d, r8d
0x142043c: mov edx, 1
0x1420441: mov ecx, 0xa0000002
0x1420446: call qword ptr [rip + 0x3dcacfc]
0x142044c: mov rax, qword ptr [rip + 0x56454ed]
0x1420453: mov qword ptr [rbx], rax
0x1420456: lea rax, [rbx + 0x18]
0x142045a: mov qword ptr [rbx + 8], 0xffffffffffffffff
0x1420462: mov qword ptr [rbx], rax
0x1420465: mov rax, rbx
0x1420468: mov dword ptr [rbx + 0x10], 1
0x142046f: mov byte ptr [rbx + 0x14], 0
0x1420473: mov dword ptr [rbx + 8], edi
0x1420476: mov rbx, qword ptr [rsp + 0x30]
0x142047b: add rsp, 0x20
0x142047f: pop rdi
0x1420480: ret 
CALLEE 0x14203f0
0x14203f0: mov qword ptr [rsp + 8], rbx
0x14203f5: push rdi
0x14203f6: sub rsp, 0x20
0x14203fa: mov rax, qword ptr gs:[0x58]
0x1420403: mov edi, ecx
0x1420405: mov r8d, 0x1fd
0x142040b: add ecx, 0x19
0x142040e: mov rdx, qword ptr [rax]
0x1420411: cmp byte ptr [r8 + rdx], 0
0x1420416: mov edx, 0x10
0x142041b: je 0x141420424
0x142041d: call 0x1447efa78
0x1420422: jmp 0x141420429
0x1420424: call 0x1447ef9b0
0x1420429: mov rbx, rax
0x142042c: test rax, rax
0x142042f: jne 0x14142044c
0x1420431: call 0x141318e70
0x1420436: xor r9d, r9d
0x1420439: xor r8d, r8d
0x142043c: mov edx, 1
0x1420441: mov ecx, 0xa0000002
0x1420446: call qword ptr [rip + 0x3dcacfc]
0x142044c: mov rax, qword ptr [rip + 0x56454ed]
0x1420453: mov qword ptr [rbx], rax
0x1420456: lea rax, [rbx + 0x18]
0x142045a: mov qword ptr [rbx + 8], 0xffffffffffffffff
0x1420462: mov qword ptr [rbx], rax
0x1420465: mov rax, rbx
0x1420468: mov dword ptr [rbx + 0x10], 1
0x142046f: mov byte ptr [rbx + 0x14], 0
0x1420473: mov dword ptr [rbx + 8], edi
0x1420476: mov rbx, qword ptr [rsp + 0x30]
0x142047b: add rsp, 0x20
0x142047f: pop rdi
0x1420480: ret 
CALLEE 0xdeb1d0
0xdeb1d0: mov qword ptr [rsp + 0x10], rbx
0xdeb1d5: push rbp
0xdeb1d6: push rsi
0xdeb1d7: push rdi
0xdeb1d8: push r12
0xdeb1da: push r13
0xdeb1dc: push r14
0xdeb1de: push r15
0xdeb1e0: sub rsp, 0x20
0xdeb1e4: mov r14d, edx
0xdeb1e7: mov rdi, rcx
0xdeb1ea: cmp edx, dword ptr [rcx + 0xc]
0xdeb1ed: ja 0x140deb1f6
0xdeb1ef: xor al, al
0xdeb1f1: jmp 0x140deb30a
0xdeb1f6: lea ecx, [rdx + rdx*2]
0xdeb1f9: shl ecx, 3
0xdeb1fc: mov r15d, 0x1fd
0xdeb202: mov rax, qword ptr gs:[0x58]
0xdeb20b: add r15, qword ptr [rax]
0xdeb20e: mov edx, 8
0xdeb213: cmp byte ptr [r15], 0
0xdeb217: je 0x140deb220
0xdeb219: call 0x1447efa78
0xdeb21e: jmp 0x140deb225
0xdeb220: call 0x1447ef9b0
0xdeb225: mov rsi, rax
0xdeb228: test rax, rax
0xdeb22b: jne 0x140deb248
0xdeb22d: call 0x141318e70
0xdeb232: xor r9d, r9d
0xdeb235: xor r8d, r8d
0xdeb238: mov edx, 1
0xdeb23d: mov ecx, 0xa0000002
0xdeb242: call qword ptr [rip + 0x43fff00]
0xdeb248: xor r12d, r12d
0xdeb24b: mov ebp, r12d
0xdeb24e: cmp dword ptr [rdi + 8], r12d
0xdeb252: jbe 0x140deb2e7
0xdeb258: lea r13, [rip + 0x5c7a6e1]
0xdeb25f: nop 
0xdeb260: mov eax, ebp
0xdeb262: lea rcx, [rax + rax*2]
0xdeb266: lea r8, [rcx*8]
0xdeb26e: lea rcx, [r8 + rsi]
0xdeb272: mov qword ptr [rsp + 0x60], rcx
0xdeb277: mov rdx, qword ptr [rdi]
0xdeb27a: add rdx, r8
0xdeb27d: mov qword ptr [rcx], r12
0xdeb280: mov rax, qword ptr [rdx]
0xdeb283: mov qword ptr [rcx], rax
0xdeb286: mov qword ptr [rdx], r12
0xdeb289: mov rax, qword ptr [rcx]
0xdeb28c: test rax, rax
0xdeb28f: je 0x140deb295
0xdeb291: mov byte ptr [rax + 0x16], 1
0xdeb295: mov qword ptr [rcx + 8], r12
0xdeb299: mov rax, qword ptr [rdx + 8]
0xdeb29d: mov qword ptr [rcx + 8], rax
0xdeb2a1: mov qword ptr [rdx + 8], r13
0xdeb2a5: mov qword ptr [rcx + 0x10], r12
0xdeb2a9: mov rax, qword ptr [rdx + 0x10]
0xdeb2ad: mov qword ptr [rcx + 0x10], rax
0xdeb2b1: mov qword ptr [rdx + 0x10], r13
0xdeb2b5: mov rbx, qword ptr [rdi]
0xdeb2b8: add rbx, r8
0xdeb2bb: mov qword ptr [rsp + 0x70], rbx
0xdeb2c0: lea rcx, [rbx + 0x10]
0xdeb2c4: call 0x140394db0
0xdeb2c9: nop 
0xdeb2ca: lea rcx, [rbx + 8]
0xdeb2ce: call 0x140394db0
0xdeb2d3: nop 
0xdeb2d4: mov rcx, rbx
0xdeb2d7: call 0x14038ad90
0xdeb2dc: inc ebp
0xdeb2de: cmp ebp, dword ptr [rdi + 8]
0xdeb2e1: jb 0x140deb260
0xdeb2e7: mov rcx, qword ptr [rdi]
0xdeb2ea: test rcx, rcx
0xdeb2ed: je 0x140deb301
0xdeb2ef: cmp byte ptr [r15], 0
0xdeb2f3: je 0x140deb2fc
0xdeb2f5: call 0x1447f03bc
0xdeb2fa: jmp 0x140deb301
0xdeb2fc: call 0x1447f02bc
0xdeb301: mov qword ptr [rdi], rsi
0xdeb304: mov dword ptr [rdi + 0xc], r14d
0xdeb308: mov al, 1
0xdeb30a: mov rbx, qword ptr [rsp + 0x68]
0xdeb30f: add rsp, 0x20
0xdeb313: pop r15
0xdeb315: pop r14
0xdeb317: pop r13
0xdeb319: pop r12
0xdeb31b: pop rdi
0xdeb31c: pop rsi
0xdeb31d: pop rbp
0xdeb31e: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x38ad90
0x38ad90: sub rsp, 0x28
0x38ad94: mov rax, rcx
0x38ad97: mov rcx, qword ptr [rcx]
0x38ad9a: test rcx, rcx
0x38ad9d: je 0x14038ade5
0x38ad9f: mov qword ptr [rax], 0
0x38ada6: cmp byte ptr [rcx + 0x14], 0
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x394db0
0x394db0: mov qword ptr [rsp + 0x10], rbx
0x394db5: mov qword ptr [rsp + 0x18], rsi
0x394dba: push rdi
0x394dbb: sub rsp, 0x20
0x394dbf: mov rbx, qword ptr [rcx]
0x394dc2: lea rsi, [rip + 0x66d0b77]
0x394dc9: mov rdi, rcx
0x394dcc: cmp rbx, rsi
0x394dcf: je 0x140394e2b
0x394dd1: mov eax, dword ptr [rbx + 0x10]
0x394dd4: test eax, eax
0x394dd6: js 0x140394e2b
0x394dd8: mov eax, 0xffffffff
0x394ddd: lock xadd dword ptr [rbx + 0x10], eax
0x394de2: cmp eax, 1
0x394de5: jne 0x140394e2b
0x394de7: test rbx, rbx
0x394dea: je 0x140394e2b
0x394dec: mov rcx, rbx
0x394def: call 0x141420360
0x394df4: mov rax, qword ptr gs:[0x58]
0x394dfd: mov ecx, 0x1fd
0x394e02: mov rdx, qword ptr [rax]
0x394e05: cmp byte ptr [rcx + rdx], 0
0x394e09: mov rcx, rbx
0x394e0c: je 0x140394e26
0x394e0e: call 0x1447f03bc
0x394e13: mov qword ptr [rdi], rsi
0x394e16: mov rbx, qword ptr [rsp + 0x38]
0x394e1b: mov rsi, qword ptr [rsp + 0x40]
0x394e20: add rsp, 0x20
0x394e24: pop rdi
0x394e25: ret 
0x394e26: call 0x1447f02bc
0x394e2b: mov rbx, qword ptr [rsp + 0x38]
0x394e30: mov qword ptr [rdi], rsi
0x394e33: mov rsi, qword ptr [rsp + 0x40]
0x394e38: add rsp, 0x20
0x394e3c: pop rdi
0x394e3d: ret 
CALLEE 0x38ad90
0x38ad90: sub rsp, 0x28
0x38ad94: mov rax, rcx
0x38ad97: mov rcx, qword ptr [rcx]
0x38ad9a: test rcx, rcx
0x38ad9d: je 0x14038ade5
0x38ad9f: mov qword ptr [rax], 0
0x38ada6: cmp byte ptr [rcx + 0x14], 0
CALLEE 0xdb5510
0xdb5510: mov rax, rsp
0xdb5513: mov qword ptr [rax + 0x20], r9
0xdb5517: mov qword ptr [rax + 0x18], r8
0xdb551b: mov qword ptr [rax + 0x10], rdx
0xdb551f: mov qword ptr [rax + 8], rcx
0xdb5523: push rbp
0xdb5524: push rbx
0xdb5525: push rsi
0xdb5526: push rdi
0xdb5527: push r12
0xdb5529: push r13
0xdb552b: push r14
0xdb552d: push r15
0xdb552f: lea rbp, [rax - 0x3f8]
0xdb5536: sub rsp, 0x4b8
0xdb553d: vmovaps xmmword ptr [rax - 0x58], xmm6
0xdb5542: mov r13, rdx
0xdb5545: mov r15, rcx
0xdb5548: xor r14d, r14d
0xdb554b: mov eax, r14d
0xdb554e: mov dword ptr [rbp - 0x2c], eax
0xdb5551: mov dword ptr [rbp - 0x60], eax
0xdb5554: movzx edi, word ptr [rdx + 0xde]
0xdb555b: mov word ptr [rsp + 0x50], di
0xdb5560: vmovups xmm0, xmmword ptr [rdx + 0xc8]
0xdb5568: vmovups xmmword ptr [rbp - 0x40], xmm0
0xdb556d: mov r12d, dword ptr [rdx + 0x1c0]
0xdb5574: mov dword ptr [rbp + 0x48], r12d
0xdb5578: mov dword ptr [rbp - 0x30], r12d
0xdb557c: mov rcx, qword ptr [rdx + 8]
0xdb5580: call 0x143edd6b0
0xdb5585: mov qword ptr [rbp + 0x10], rax
0xdb5589: cmp byte ptr [r15 + 0xae8], r14b
0xdb5590: sete byte ptr [rsp + 0x54]
0xdb5595: mov rsi, qword ptr [rbp + 0x420]
0xdb559c: mov r15d, dword ptr [rsi]
0xdb559f: mov eax, 0xffff
0xdb55a4: mov word ptr [rsp + 0x60], ax
0xdb55a9: mov dword ptr [rbp - 0x50], r14d
0xdb55ad: mov r8d, 0xffffffff
0xdb55b3: mov rdx, qword ptr [r13 + 8]
0xdb55b7: mov rcx, qword ptr [r13 + 0x140]
0xdb55be: call 0x143ed5b40
0xdb55c3: mov ebx, 0x1fd
0xdb55c8: test r12d, r12d
0xdb55cb: mov r12, qword ptr [rbp + 0x400]
0xdb55d2: je 0x140db569d
0xdb55d8: lea rcx, [r12 + 0x1b8]
0xdb55e0: mov qword ptr [rsp + 0x70], r14
0xdb55e5: mov qword ptr [rsp + 0x78], r14
0xdb55ea: lea rax, [rbp - 0x30]
0xdb55ee: mov qword ptr [rbp - 0x58], rax
0xdb55f2: inc dword ptr [rcx + 0xc]
0xdb55f5: lea rax, [rsp + 0x68]
0xdb55fa: mov qword ptr [rsp + 0x38], rax
0xdb55ff: lea rax, [rbp - 0x70]
0xdb5603: mov qword ptr [rsp + 0x30], rax
0xdb5608: lea rax, [rbp + 0x420]
0xdb560f: mov qword ptr [rsp + 0x28], rax
0xdb5614: lea r9, [rsp + 0x70]
0xdb5619: mov r8d, dword ptr [rbp - 0x30]
0xdb561d: lea rdx, [rbp - 0x58]
0xdb5621: call 0x140dea280
0xdb5626: nop 
0xdb5627: mov rcx, qword ptr [rsp + 0x70]
0xdb562c: test rcx, rcx
0xdb562f: je 0x140db564f
0xdb5631: mov rax, qword ptr gs:[0x58]
0xdb563a: mov rdx, qword ptr [rax]
0xdb563d: cmp byte ptr [rbx + rdx], r14b
0xdb5641: je 0x140db564a
0xdb5643: call 0x1447f03bc
0xdb5648: jmp 0x140db564f
0xdb564a: call 0x1447f02bc
0xdb564f: mov qword ptr [rsp + 0x70], r14
0xdb5654: mov qword ptr [rsp + 0x78], r14
0xdb5659: mov rbx, qword ptr [rsp + 0x68]
0xdb565e: mov ecx, dword ptr [rbx + 8]
0xdb5661: mov eax, dword ptr [rbx + 0xc]
0xdb5664: cmp eax, ecx
0xdb5666: ja 0x140db568b
0xdb5668: lea edx, [rax*2 + 1]
0xdb566f: add edx, eax
0xdb5671: shr edx, 1
0xdb5673: cmp edx, 1
0xdb5676: mov eax, 1
0xdb567b: cmovb edx, eax
0xdb567e: cmp ecx, edx
0xdb5680: cmova edx, ecx
0xdb5683: mov rcx, rbx
0xdb5686: call 0x14035e3f0
0xdb568b: mov ecx, dword ptr [rbx + 8]
0xdb568e: mov rax, qword ptr [rbx]
0xdb5691: mov qword ptr [rax + rcx*8], r13
0xdb5695: inc dword ptr [rbx + 8]
0xdb5698: mov ebx, 0x1fd
0xdb569d: cmp byte ptr [rip + 0x5f0c494], 0
0xdb56a4: je 0x140db5772
0xdb56aa: test r15d, r15d
0xdb56ad: je 0x140db5772
0xdb56b3: lea rcx, [r12 + 0x1f8]
0xdb56bb: mov qword ptr [rsp + 0x70], r14
0xdb56c0: mov qword ptr [rsp + 0x78], r14
0xdb56c5: mov qword ptr [rbp - 0x58], rsi
0xdb56c9: inc dword ptr [rcx + 0xc]
0xdb56cc: lea rax, [rsp + 0x68]
0xdb56d1: mov qword ptr [rsp + 0x38], rax
0xdb56d6: lea rax, [rbp - 0x70]
0xdb56da: mov qword ptr [rsp + 0x30], rax
0xdb56df: lea rax, [rbp + 0x420]
0xdb56e6: mov qword ptr [rsp + 0x28], rax
0xdb56eb: lea r9, [rsp + 0x70]
0xdb56f0: mov r8d, dword ptr [rsi]
0xdb56f3: lea rdx, [rbp - 0x58]
0xdb56f7: call 0x140dea280
0xdb56fc: nop 
0xdb56fd: mov rcx, qword ptr [rsp + 0x70]
0xdb5702: test rcx, rcx
0xdb5705: je 0x140db5729
0xdb5707: mov r8d, ebx
0xdb570a: mov rax, qword ptr gs:[0x58]
0xdb5713: mov rdx, qword ptr [rax]
0xdb5716: cmp byte ptr [r8 + rdx], 0
0xdb571b: je 0x140db5724
0xdb571d: call 0x1447f03bc
0xdb5722: jmp 0x140db5729
0xdb5724: call 0x1447f02bc
0xdb5729: mov qword ptr [rsp + 0x70], r14
0xdb572e: mov qword ptr [rsp + 0x78], r14
0xdb5733: mov rbx, qword ptr [rsp + 0x68]
0xdb5738: mov ecx, dword ptr [rbx + 8]
0xdb573b: mov eax, dword ptr [rbx + 0xc]
0xdb573e: cmp eax, ecx
0xdb5740: ja 0x140db5765
0xdb5742: lea edx, [rax*2 + 1]
0xdb5749: add edx, eax
0xdb574b: shr edx, 1
0xdb574d: cmp edx, 1
0xdb5750: mov eax, 1
0xdb5755: cmovb edx, eax
0xdb5758: cmp ecx, edx
0xdb575a: cmova edx, ecx
0xdb575d: mov rcx, rbx
0xdb5760: call 0x14035e3f0
0xdb5765: mov ecx, dword ptr [rbx + 8]
0xdb5768: mov rax, qword ptr [rbx]
0xdb576b: mov qword ptr [rax + rcx*8], r13
0xdb576f: inc dword ptr [rbx + 8]
0xdb5772: mov rax, qword ptr [r13 + 0x118]
0xdb5779: mov rbx, qword ptr [rax + 0x20]
0xdb577d: mov rax, qword ptr [rbx]
0xdb5780: mov r10, qword ptr [rax + 0xa0]
0xdb5787: lea r8, [r10 + 8]
0xdb578b: test r10, r10
0xdb578e: je 0x140db5796
0xdb5790: cmp qword ptr [r8], 0
0xdb5794: jne 0x140db57ce
0xdb5796: mov r11, qword ptr [rbx + 8]
0xdb579a: mov edx, r14d
0xdb579d: mov r9d, dword ptr [r11 + 8]
0xdb57a1: test r9d, r9d
0xdb57a4: je 0x140db57ce
0xdb57a6: mov r11, qword ptr [r11]
0xdb57a9: mov eax, dword ptr [rip + 0x5f1acb9]
0xdb57af: nop 
0xdb57b0: mov ecx, edx
0xdb57b2: cmp eax, dword ptr [r11 + rcx*4]
0xdb57b6: je 0x140db57c1
0xdb57b8: inc edx
0xdb57ba: cmp edx, r9d
0xdb57bd: jb 0x140db57b0
0xdb57bf: jmp 0x140db57ce
0xdb57c1: lea r8, [r10 + 8]
0xdb57c5: cmp edx, -1
0xdb57c8: jne 0x140db5886
0xdb57ce: test r10, r10
0xdb57d1: je 0x140db57d9
0xdb57d3: cmp qword ptr [r8], 0
0xdb57d7: jne 0x140db5808
0xdb57d9: mov r9, qword ptr [rbx + 8]
0xdb57dd: mov edx, r14d
0xdb57e0: mov r8d, dword ptr [r9 + 8]
0xdb57e4: test r8d, r8d
0xdb57e7: je 0x140db5808
0xdb57e9: mov r9, qword ptr [r9]
0xdb57ec: mov eax, dword ptr [rip + 0x5f1ac7a]
0xdb57f2: mov ecx, edx
0xdb57f4: cmp eax, dword ptr [r9 + rcx*4]
0xdb57f8: je 0x140db5803
0xdb57fa: inc edx
0xdb57fc: cmp edx, r8d
0xdb57ff: jb 0x140db57f2
0xdb5801: jmp 0x140db5808
0xdb5803: cmp edx, -1
0xdb5806: jne 0x140db5886
0xdb5808: test r10, r10
0xdb580b: je 0x140db5814
0xdb580d: cmp qword ptr [r10 + 8], 0
0xdb5812: jne 0x140db5846
0xdb5814: mov r9, qword ptr [rbx + 8]
0xdb5818: mov edx, r14d
0xdb581b: mov r8d, dword ptr [r9 + 8]
0xdb581f: test r8d, r8d
0xdb5822: je 0x140db5846
0xdb5824: mov r9, qword ptr [r9]
0xdb5827: mov eax, dword ptr [rip + 0x5f1ac43]
0xdb582d: nop dword ptr [rax]
0xdb5830: mov ecx, edx
0xdb5832: cmp eax, dword ptr [r9 + rcx*4]
0xdb5836: je 0x140db5841
0xdb5838: inc edx
0xdb583a: cmp edx, r8d
0xdb583d: jb 0x140db5830
0xdb583f: jmp 0x140db5846
0xdb5841: cmp edx, -1
0xdb5844: jne 0x140db5886
0xdb5846: test r10, r10
0xdb5849: je 0x140db5852
0xdb584b: cmp qword ptr [r10 + 8], 0
0xdb5850: jne 0x140db58c8
0xdb5852: mov r9, qword ptr [rbx + 8]
0xdb5856: mov edx, r14d
0xdb5859: mov r8d, dword ptr [r9 + 8]
0xdb585d: test r8d, r8d
0xdb5860: je 0x140db58c8
0xdb5862: mov r9, qword ptr [r9]
0xdb5865: mov eax, dword ptr [rip + 0x5f1ac09]
0xdb586b: nop dword ptr [rax + rax]
0xdb5870: mov ecx, edx
0xdb5872: cmp eax, dword ptr [r9 + rcx*4]
0xdb5876: je 0x140db5881
0xdb5878: inc edx
0xdb587a: cmp edx, r8d
0xdb587d: jb 0x140db5870
0xdb587f: jmp 0x140db58c8
0xdb5881: cmp edx, -1
0xdb5884: je 0x140db58c8
0xdb5886: lea rbx, [r12 + 0x438]
0xdb588e: mov ecx, dword ptr [rbx + 8]
0xdb5891: mov eax, dword ptr [rbx + 0xc]
0xdb5894: cmp eax, ecx
0xdb5896: ja 0x140db58bb
0xdb5898: lea edx, [rax*2 + 1]
0xdb589f: add edx, eax
0xdb58a1: shr edx, 1
0xdb58a3: cmp edx, 1
0xdb58a6: mov eax, 1
0xdb58ab: cmovb edx, eax
0xdb58ae: cmp ecx, edx
0xdb58b0: cmova edx, ecx
0xdb58b3: mov rcx, rbx
0xdb58b6: call 0x14035e3f0
0xdb58bb: mov ecx, dword ptr [rbx + 8]
0xdb58be: mov rax, qword ptr [rbx]
0xdb58c1: mov qword ptr [rax + rcx*8], r13
0xdb58c5: inc dword ptr [rbx + 8]
0xdb58c8: lea rcx, [rsp + 0x50]
0xdb58cd: call 0x140537250
0xdb58d2: mov ecx, dword ptr [rax]
0xdb58d4: mov dword ptr [rsp + 0x58], ecx
0xdb58d8: lea rcx, [r12 + 0x158]
0xdb58e0: mov qword ptr [rsp + 0x70], r14
0xdb58e5: mov dword ptr [rsp + 0x78], r14d
0xdb58ea: mov dword ptr [rsp + 0x7c], 0xffffffff
0xdb58f2: vpxor xmm0, xmm0, xmm0
0xdb58f6: vmovdqu xmmword ptr [rbp - 0x80], xmm0
0xdb58fb: lea rax, [rsp + 0x58]
0xdb5900: mov qword ptr [rbp - 0x58], rax
0xdb5904: inc dword ptr [rcx + 0xc]
0xdb5907: lea rax, [rsp + 0x68]
0xdb590c: mov qword ptr [rsp + 0x38], rax
0xdb5911: lea rax, [rbp - 0x70]
0xdb5915: mov qword ptr [rsp + 0x30], rax
0xdb591a: lea rax, [rbp + 0x420]
0xdb5921: mov qword ptr [rsp + 0x28], rax
0xdb5926: lea r9, [rsp + 0x70]
0xdb592b: mov r8d, dword ptr [rsp + 0x58]
0xdb5930: lea rdx, [rbp - 0x58]
0xdb5934: call 0x1405d5a10
0xdb5939: nop 
0xdb593a: inc dword ptr [rsp + 0x7c]
0xdb593e: mov r13d, 0x1fd
0xdb5944: mov ebx, r13d
0xdb5947: mov rcx, qword ptr [rbp - 0x80]
0xdb594b: test rcx, rcx
0xdb594e: je 0x140db597d
0xdb5950: mov dword ptr [rsp + 0x70], r14d
0xdb5955: mov rax, qword ptr gs:[0x58]
0xdb595e: mov rdx, qword ptr [rax]
0xdb5961: cmp byte ptr [r13 + rdx], 0
0xdb5967: je 0x140db5970
0xdb5969: call 0x1447f03bc
0xdb596e: jmp 0x140db5975
0xdb5970: call 0x1447f02bc
0xdb5975: mov qword ptr [rbp - 0x80], r14
0xdb5979: mov qword ptr [rbp - 0x80], r14
0xdb597d: mov r15, qword ptr [rbp - 0x78]
0xdb5981: test r15, r15
0xdb5984: je 0x140db59f9
0xdb5986: mov eax, dword ptr [rsp + 0x74]
0xdb598a: test eax, eax
0xdb598c: je 0x140db59cb
0xdb598e: mov rbx, r15
0xdb5991: mov esi, eax
0xdb5993: mov rcx, qword ptr [rbx]
0xdb5996: test rcx, rcx
0xdb5999: je 0x140db59bb
0xdb599b: mov rax, qword ptr gs:[0x58]
0xdb59a4: mov rdx, qword ptr [rax]
0xdb59a7: cmp byte ptr [r13 + rdx], 0
0xdb59ad: je 0x140db59b6
0xdb59af: call 0x1447f03bc
0xdb59b4: jmp 0x140db59bb
0xdb59b6: call 0x1447f02bc
0xdb59bb: mov qword ptr [rbx], r14
0xdb59be: add rbx, 8
0xdb59c2: sub rsi, 1
0xdb59c6: jne 0x140db5993
0xdb59c8: mov ebx, r13d
0xdb59cb: mov qword ptr [rsp + 0x74], r14
0xdb59d0: mov rax, qword ptr gs:[0x58]
0xdb59d9: mov rdx, qword ptr [rax]
0xdb59dc: mov rcx, r15
0xdb59df: cmp byte ptr [rbx + rdx], 0
0xdb59e3: je 0x140db59ec
0xdb59e5: call 0x1447f03bc
0xdb59ea: jmp 0x140db59f1
0xdb59ec: call 0x1447f02bc
0xdb59f1: mov qword ptr [rbp - 0x78], r14
0xdb59f5: mov qword ptr [rbp - 0x78], r14
0xdb59f9: lea rax, [rbp - 0x40]
0xdb59fd: mov qword ptr [rbp + 0x420], rax
0xdb5a04: lea r8, [rbp + 0x408]
0xdb5a0b: lea rdx, [rbp + 0x420]
0xdb5a12: mov r13, qword ptr [rsp + 0x68]
0xdb5a17: mov rcx, r13
0xdb5a1a: call 0x140de87f0
0xdb5a1f: mov rax, qword ptr gs:[0x58]
0xdb5a28: mov rdx, qword ptr [rax]
0xdb5a2b: mov qword ptr [rbp - 0x58], rdx
0xdb5a2f: mov eax, 0x1ec
0xdb5a34: mov rcx, qword ptr [rip + 0x5fb3aed]
0xdb5a3b: cmp byte ptr [rax + rdx], 0
0xdb5a3f: cmovne rcx, qword ptr [rip + 0x5fb3ae9]
0xdb5a47: mov rax, qword ptr [rcx]
0xdb5a4a: mov rcx, qword ptr [rax + 8]
0xdb5a4e: mov rbx, qword ptr [rcx + 0x410]
0xdb5a55: cmp byte ptr [rbp - 0x38], 1
0xdb5a59: jne 0x140db5aaf
0xdb5a5b: lea rcx, [rsp + 0x50]
0xdb5a60: call 0x140537250
0xdb5a65: cmp dword ptr [rax + 0x2c], 0x19
0xdb5a69: jne 0x140db5aaf
0xdb5a6b: mov r15b, 1
0xdb5a6e: mov eax, dword ptr [rbp - 0x40]
0xdb5a71: mov dword ptr [rbp + 0x420], eax
0xdb5a77: lea rcx, [rbp + 0x420]
0xdb5a7e: call 0x140473f20
0xdb5a83: mov r8d, dword ptr [rax]
0xdb5a86: lea rdx, [rbp - 0x70]
0xdb5a8a: mov rcx, rbx
0xdb5a8d: call 0x14185b650
0xdb5a92: mov rcx, qword ptr [rax]
0xdb5a95: mov qword ptr [rbp + 0x420], rcx
0xdb5a9c: mov eax, dword ptr [rbp + 0x424]
0xdb5aa2: mov dword ptr [rbp - 0x50], eax
0xdb5aa5: movzx eax, cx
0xdb5aa8: mov word ptr [rsp + 0x60], cx
0xdb5aad: jmp 0x140db5adc
0xdb5aaf: xor r15b, r15b
0xdb5ab2: cmp dword ptr [r13 + 4], 1
0xdb5ab7: jne 0x140db5ad7
0xdb5ab9: lea rcx, [rsp + 0x50]
0xdb5abe: call 0x140537250
0xdb5ac3: mov r8d, dword ptr [rax]
0xdb5ac6: lea rdx, [rbp + 0x420]
0xdb5acd: mov rcx, rbx
0xdb5ad0: call 0x14185b590
0xdb5ad5: jmp 0x140db5a92
0xdb5ad7: movzx eax, word ptr [rsp + 0x60]
0xdb5adc: movzx ebx, ax
0xdb5adf: mov esi, 0xffff
0xdb5ae4: cmp ebx, esi
0xdb5ae6: je 0x140db5c50
0xdb5aec: lea rcx, [rsp + 0x50]
0xdb5af1: call 0x140537250
0xdb5af6: movzx r11d, byte ptr [rax + 0xa8]
0xdb5afe: cmp r11b, 1
0xdb5b02: je 0x140db5b0a
0xdb5b04: cmp r11b, 3
0xdb5b08: jne 0x140db5b0d
0xdb5b0a: mov r11b, 2
0xdb5b0d: mov r10, r14
0xdb5b10: mov r9, qword ptr [r12 + 0xb90]
0xdb5b18: mov eax, dword ptr [r12 + 0xb98]
0xdb5b20: lea rcx, [rax + rax*4]
0xdb5b24: lea rsi, [r9 + rcx*8]
0xdb5b28: cmp r9, rsi
0xdb5b2b: je 0x140db5c4b
0xdb5b31: cmp byte ptr [r9 + 0x20], r11b
0xdb5b35: jne 0x140db5b66
0xdb5b37: mov rdx, qword ptr [r9]
0xdb5b3a: mov eax, dword ptr [r9 + 8]
0xdb5b3e: lea rcx, [rax + rax*2]
0xdb5b42: lea r8, [rdx + rcx*8]
0xdb5b46: cmp rdx, r8
0xdb5b49: je 0x140db5b66
0xdb5b4b: nop dword ptr [rax + rax]
0xdb5b50: movzx eax, word ptr [rdx + 0x10]
0xdb5b54: cmp eax, ebx
0xdb5b56: je 0x140db5b63
0xdb5b58: add rdx, 0x18
0xdb5b5c: cmp rdx, r8
0xdb5b5f: jne 0x140db5b50
0xdb5b61: jmp 0x140db5b66
0xdb5b63: mov r10, rdx
0xdb5b66: add r9, 0x28
0xdb5b6a: cmp r9, rsi
0xdb5b6d: jne 0x140db5b31
0xdb5b6f: test r10, r10
0xdb5b72: je 0x140db5c4b
0xdb5b78: mov eax, dword ptr [rbp - 0x50]
0xdb5b7b: cmp dword ptr [r10 + 8], eax
0xdb5b7f: jbe 0x140db5c4b
0xdb5b85: lea rcx, [rax + rax*4]
0xdb5b89: mov rax, qword ptr [r10]
0xdb5b8c: lea rbx, [rax + rcx*8]
0xdb5b90: test r15b, r15b
0xdb5b93: je 0x140db5bdd
0xdb5b95: mov eax, dword ptr [rbx + 0x18]
0xdb5b98: test eax, eax
0xdb5b9a: sete sil
0xdb5b9e: mov r15d, dword ptr [rbp - 0x40]
0xdb5ba2: mov ecx, dword ptr [rbx + 0x1c]
0xdb5ba5: cmp ecx, eax
0xdb5ba7: ja 0x140db5bcd
0xdb5ba9: lea edx, [rcx*2 + 1]
0xdb5bb0: add edx, ecx
0xdb5bb2: shr edx, 1
0xdb5bb4: cmp edx, 1
0xdb5bb7: mov ecx, 1
0xdb5bbc: cmovb edx, ecx
0xdb5bbf: cmp eax, edx
0xdb5bc1: cmova edx, eax
0xdb5bc4: lea rcx, [rbx + 0x10]
0xdb5bc8: call 0x1403d2af0
0xdb5bcd: mov ecx, dword ptr [rbx + 0x18]
0xdb5bd0: mov rax, qword ptr [rbx + 0x10]
0xdb5bd4: mov dword ptr [rax + rcx*4], r15d
0xdb5bd8: inc dword ptr [rbx + 0x18]
0xdb5bdb: jmp 0x140db5c1d
0xdb5bdd: mov eax, dword ptr [rbx + 8]
0xdb5be0: test eax, eax
0xdb5be2: sete sil
0xdb5be6: mov ecx, dword ptr [rbx + 0xc]
0xdb5be9: cmp ecx, eax
0xdb5beb: ja 0x140db5c10
0xdb5bed: lea edx, [rcx*2 + 1]
0xdb5bf4: add edx, ecx
0xdb5bf6: shr edx, 1
0xdb5bf8: cmp edx, 1
0xdb5bfb: mov ecx, 1
0xdb5c00: cmovb edx, ecx
0xdb5c03: cmp eax, edx
0xdb5c05: cmova edx, eax
0xdb5c08: mov rcx, rbx
0xdb5c0b: call 0x14040d850
0xdb5c10: mov ecx, dword ptr [rbx + 8]
0xdb5c13: mov rax, qword ptr [rbx]
0xdb5c16: mov word ptr [rax + rcx*2], di
0xdb5c1a: inc dword ptr [rbx + 8]
0xdb5c1d: test sil, sil
0xdb5c20: je 0x140db5c4b
0xdb5c22: mov rax, qword ptr [r12 + 0xb10]
0xdb5c2a: mov rcx, qword ptr [rax + 8]
0xdb5c2e: movzx eax, byte ptr [rcx + 0xb0]
0xdb5c35: and al, 0x60
0xdb5c37: cmp al, 0x40
0xdb5c39: jne 0x140db5c4b
0xdb5c3b: mov rcx, r12
0xdb5c3e: call 0x140dd3ee0
0xdb5c43: mov rcx, r12
0xdb5c46: call 0x140dd3950
0xdb5c4b: mov esi, 0xffff
0xdb5c50: lea rcx, [rsp + 0x50]
0xdb5c55: call 0x140537250
0xdb5c5a: cmp dword ptr [rax + 0x2c], 0x25
0xdb5c5e: jne 0x140db5c65
0xdb5c60: xor r8d, r8d
0xdb5c63: jmp 0x140db5c78
0xdb5c65: lea rcx, [rsp + 0x50]
0xdb5c6a: call 0x140537250
0xdb5c6f: cmp dword ptr [rax + 0x2c], 0x66
0xdb5c73: jne 0x140db5c84
0xdb5c75: mov r8b, 1
0xdb5c78: mov edx, dword ptr [r13 + 4]
0xdb5c7c: mov rcx, r12
0xdb5c7f: call 0x140d92930
0xdb5c84: mov word ptr [rbp - 0x28], si
0xdb5c88: mov qword ptr [rbp - 0x20], r14
0xdb5c8c: mov r12, 0xffffffffffffffff
0xdb5c93: mov qword ptr [rbp - 0x18], r12
0xdb5c97: mov byte ptr [rbp - 0x10], 0x15
0xdb5c9b: xor eax, eax
0xdb5c9d: mov dword ptr [rbp - 0xf], eax
0xdb5ca0: mov dword ptr [rbp - 0xb], 0xff000000
0xdb5ca7: mov qword ptr [rbp], r14
0xdb5cab: lea rsi, [rip + 0x5cafc8e]
0xdb5cb2: mov qword ptr [rbp], rsi
0xdb5cb6: mov qword ptr [rbp + 8], r14
0xdb5cba: mov qword ptr [rbp + 8], rsi
0xdb5cbe: mov word ptr [rbp - 0x28], di
0xdb5cc2: lea rcx, [rsp + 0x50]
0xdb5cc7: call 0x140537250
0xdb5ccc: mov rcx, qword ptr [rax + 0x40]
0xdb5cd0: mov qword ptr [rbp - 0x20], rcx
0xdb5cd4: movzx eax, byte ptr [rbp - 0x38]
0xdb5cd8: mov byte ptr [rbp - 0x10], al
0xdb5cdb: mov rax, qword ptr [rbp - 0x40]
0xdb5cdf: mov qword ptr [rbp - 0x18], rax
0xdb5ce3: mov r15, qword ptr [rbp + 0x400]
0xdb5cea: mov rax, qword ptr [r15]
0xdb5ced: mov rcx, r15
0xdb5cf0: call qword ptr [rax + 0x110]
0xdb5cf6: mov rbx, qword ptr [rax + 0x311e8]
0xdb5cfd: mov qword ptr [rbp - 0x70], r14
0xdb5d01: mov qword ptr [rbp - 0x70], rsi
0xdb5d05: mov byte ptr [rbp - 0x68], 6
0xdb5d09: mov byte ptr [rbp - 0x68], 2
0xdb5d0d: mov rsi, qword ptr [rbp + 0x418]
0xdb5d14: mov rdx, rsi
0xdb5d17: lea rcx, [rbp - 0x70]
0xdb5d1b: call 0x1403d5f80
0xdb5d20: lea rcx, [rbp - 0x70]
0xdb5d24: call 0x14141fe80
0xdb5d29: lea rcx, [rbp - 0x70]
0xdb5d2d: call 0x141420260
0xdb5d32: nop 
0xdb5d33: lea rdx, [rbp - 0x70]
0xdb5d37: mov rcx, rbx
0xdb5d3a: call 0x143f321f0
0xdb5d3f: movzx ebx, al
0xdb5d42: lea rcx, [rbp - 0x70]
0xdb5d46: call 0x140394db0
0xdb5d4b: mov r13, qword ptr [rbp + 0x408]
0xdb5d52: mov qword ptr [rsp + 0x58], r13
0xdb5d57: test bl, bl
0xdb5d59: je 0x140db5d6c
0xdb5d5b: mov rdx, rsi
0xdb5d5e: lea rcx, [rbp + 8]
0xdb5d62: call 0x1403d5f80
0xdb5d67: jmp 0x140db5e18
0xdb5d6c: mov rax, qword ptr [r15]
0xdb5d6f: mov rcx, r15
0xdb5d72: call qword ptr [rax + 0x110]
0xdb5d78: mov rbx, qword ptr [rax + 0x311e8]
0xdb5d7f: mov qword ptr [rbp - 0x70], r14
0xdb5d83: lea r15, [rip + 0x5cafbb6]
0xdb5d8a: mov qword ptr [rbp - 0x70], r15
0xdb5d8e: mov byte ptr [rbp - 0x68], 6
0xdb5d92: mov byte ptr [rbp - 0x68], 2
0xdb5d96: mov rsi, qword ptr [rbp + 0x410]
0xdb5d9d: mov rdx, rsi
0xdb5da0: lea rcx, [rbp - 0x70]
0xdb5da4: call 0x1403d5f80
0xdb5da9: lea rcx, [rbp - 0x70]
0xdb5dad: call 0x14141fe80
0xdb5db2: lea rcx, [rbp - 0x70]
0xdb5db6: call 0x141420260
0xdb5dbb: nop 
0xdb5dbc: lea rdx, [rbp - 0x70]
0xdb5dc0: mov rcx, rbx
0xdb5dc3: call 0x143f321f0
0xdb5dc8: movzx ebx, al
0xdb5dcb: lea rcx, [rbp - 0x70]
0xdb5dcf: call 0x140394db0
0xdb5dd4: test bl, bl
0xdb5dd6: je 0x140db5de6
0xdb5dd8: mov rdx, rsi
0xdb5ddb: lea rcx, [rbp + 8]
0xdb5ddf: call 0x1403d5f80
0xdb5de4: jmp 0x140db5e18
0xdb5de6: mov rcx, qword ptr [r13 + 0x118]
0xdb5ded: xor edx, edx
0xdb5def: mov rcx, qword ptr [rcx + 0x30]
0xdb5df3: call 0x1435c3500
0xdb5df8: test rax, rax
0xdb5dfb: je 0x140db5e18
0xdb5dfd: mov rax, qword ptr [rax + 0x30]
0xdb5e01: mov rcx, qword ptr [rax]
0xdb5e04: mov qword ptr [rbp + 8], rcx
0xdb5e08: cmp rcx, r15
0xdb5e0b: je 0x140db5e18
0xdb5e0d: mov eax, dword ptr [rcx + 0x10]
0xdb5e10: test eax, eax
0xdb5e12: js 0x140db5e18
0xdb5e14: lock inc dword ptr [rcx + 0x10]
0xdb5e18: lea rcx, [rsp + 0x50]
0xdb5e1d: call 0x140537250
0xdb5e22: mov r15, rax
0xdb5e25: mov qword ptr [rsp + 0x68], rax
0xdb5e2a: lea rdx, [rbp + 0x50]
0xdb5e2e: mov rcx, qword ptr [rip + 0x5fb33b3]
0xdb5e35: mov rcx, qword ptr [rcx]
0xdb5e38: call 0x1408b44e0
0xdb5e3d: nop 
0xdb5e3e: lea rsi, [rip + 0x4970003]
0xdb5e45: cmp byte ptr [rbp + 0x60], 0
0xdb5e49: je 0x140db7210
0xdb5e4f: lea rcx, [rsp + 0x50]
0xdb5e54: call 0x140537250
0xdb5e59: cmp byte ptr [rax + 0xab], 0
0xdb5e60: jne 0x140db6747
0xdb5e66: lea rcx, [rsp + 0x50]
0xdb5e6b: call 0x140537250
0xdb5e70: cmp byte ptr [rax + 0xaf], 0
0xdb5e77: jne 0x140db6747
0xdb5e7d: lea rcx, [rsp + 0x50]
0xdb5e82: call 0x140537250
0xdb5e87: lea rcx, [rsp + 0x50]
0xdb5e8c: cmp byte ptr [rax + 0xae], 0
0xdb5e93: je 0x140db5ee6
0xdb5e95: call 0x140537250
0xdb5e9a: mov rcx, qword ptr [rax + 0x38]
0xdb5e9e: mov rax, qword ptr [rcx]
0xdb5ea1: xor edx, edx
0xdb5ea3: call qword ptr [rax + 8]
0xdb5ea6: mov rdx, rax
0xdb5ea9: lea rcx, [rbp]
0xdb5ead: call 0x1403d5f80
0xdb5eb2: mov r13, qword ptr [rbp + 0x400]
0xdb5eb9: mov rcx, qword ptr [r13 + 0x600]
0xdb5ec0: cmp dword ptr [rcx + 0x108], 0
0xdb5ec7: jbe 0x140db6038
0xdb5ecd: cmp dword ptr [rcx + 0x118], 0
0xdb5ed4: jbe 0x140db6038
0xdb5eda: mov rcx, qword ptr [rcx + 0x100]
0xdb5ee1: mov rcx, qword ptr [rcx]
0xdb5ee4: jmp 0x140db5f62
0xdb5ee6: call 0x140537250
0xdb5eeb: cmp dword ptr [rax + 0x2c], 0x25
0xdb5eef: je 0x140db673e
0xdb5ef5: lea rcx, [rsp + 0x50]
0xdb5efa: call 0x140537250
0xdb5eff: cmp dword ptr [rax + 0x2c], 0x66
0xdb5f03: je 0x140db673e
0xdb5f09: lea rcx, [rsp + 0x50]
0xdb5f0e: call 0x140537250
0xdb5f13: cmp dword ptr [rax + 0x2c], 0x1b
0xdb5f17: jne 0x140db5f7b
0xdb5f19: mov eax, 1
0xdb5f1e: mov qword ptr [rbp - 0x20], rax
0xdb5f22: mov rdx, qword ptr [rbp + 0x10]
0xdb5f26: lea rcx, [rbp]
0xdb5f2a: call 0x1403d5f80
0xdb5f2f: mov r13, qword ptr [rbp + 0x400]
0xdb5f36: mov rcx, qword ptr [r13 + 0x600]
0xdb5f3d: cmp dword ptr [rcx + 0x108], 1
0xdb5f44: jbe 0x140db6038
0xdb5f4a: cmp dword ptr [rcx + 0x118], 1
0xdb5f51: jbe 0x140db6038
0xdb5f57: mov rcx, qword ptr [rcx + 0x100]
0xdb5f5e: mov rcx, qword ptr [rcx + 8]
0xdb5f62: lea rdx, [rbp - 0x28]
0xdb5f66: movzx r8d, byte ptr [rsp + 0x54]
0xdb5f6c: call 0x140d89410
0xdb5f71: mov r12, qword ptr [rsp + 0x58]
0xdb5f76: jmp 0x140db6606
0xdb5f7b: mov r8d, dword ptr [rbp - 0x30]
0xdb5f7f: test r8d, r8d
0xdb5f82: je 0x140db60c8
0xdb5f88: lea rdx, [rsp + 0x70]
0xdb5f8d: mov rcx, qword ptr [rip + 0x5fb3254]
0xdb5f94: mov rcx, qword ptr [rcx]
0xdb5f97: call 0x1408ae940
0xdb5f9c: nop 
0xdb5f9d: cmp byte ptr [rbp - 0x80], 0
0xdb5fa1: je 0x140db6022
0xdb5fa3: mov rax, qword ptr [rsp + 0x78]
0xdb5fa8: mov rcx, qword ptr [rax + 0x68]
0xdb5fac: mov rcx, qword ptr [rcx + 0x20]
0xdb5fb0: add rcx, 0x30
0xdb5fb4: call 0x140389570
0xdb5fb9: cmp word ptr [rax + 0x104], 0
0xdb5fc1: jne 0x140db6042
0xdb5fc3: mov rbx, qword ptr [rsp + 0x78]
0xdb5fc8: mov rax, qword ptr [rbx + 0x88]
0xdb5fcf: movzx ecx, byte ptr [rax + 1]
0xdb5fd3: cmp cl, 4
0xdb5fd6: je 0x140db5fe0
0xdb5fd8: sub cl, 5
0xdb5fdb: cmp cl, 1
0xdb5fde: ja 0x140db6022
0xdb5fe0: test rbx, rbx
0xdb5fe3: lea rdx, [rbx + 8]
0xdb5fe7: jne 0x140db5fec
0xdb5fe9: mov rdx, r14
0xdb5fec: mov rdx, qword ptr [rdx]
0xdb5fef: lea rcx, [rbp + 0x408]
0xdb5ff6: call 0x140393df0
0xdb5ffb: nop 
0xdb5ffc: mov rax, qword ptr [rbx + 0x68]
0xdb6000: mov rcx, qword ptr [rax + 0x118]
0xdb6007: mov ebx, dword ptr [rcx + 0x18]
0xdb600a: mov rcx, qword ptr [rbp + 0x408]
0xdb6011: mov rax, qword ptr [rcx]
0xdb6014: mov dl, 1
0xdb6016: call qword ptr [rax + 0x20]
0xdb6019: mov rax, qword ptr [rbp + 0x58]
0xdb601d: cmp ebx, dword ptr [rax + 0x60]
0xdb6020: je 0x140db6046
0xdb6022: mov r13, qword ptr [rbp + 0x400]
0xdb6029: mov qword ptr [rsp + 0x70], rsi
0xdb602e: lea rcx, [rsp + 0x70]
0xdb6033: call 0x141434880
0xdb6038: mov r12, qword ptr [rsp + 0x58]
0xdb603d: jmp 0x140db6606
0xdb6042: mov rax, qword ptr [rbp + 0x58]
0xdb6046: mov eax, dword ptr [rax + 0x60]
0xdb6049: mov qword ptr [rbp - 0x20], rax
0xdb604d: mov rax, qword ptr [rsp + 0x78]
0xdb6052: mov rcx, qword ptr [rax + 0x68]
0xdb6056: mov rax, qword ptr [rcx + 0x20]
0xdb605a: movzx ecx, word ptr [rax + 0x30]
0xdb605e: mov word ptr [rbp + 0x408], cx
0xdb6065: lea rcx, [rbp + 0x408]
0xdb606c: call 0x140389570
0xdb6071: mov rcx, qword ptr [rax + 0x18]
0xdb6075: mov rax, qword ptr [rcx]
0xdb6078: xor edx, edx
0xdb607a: call qword ptr [rax + 8]
0xdb607d: mov rdx, rax
0xdb6080: lea rcx, [rbp]
0xdb6084: call 0x1403d5f80
0xdb6089: mov r13, qword ptr [rbp + 0x400]
0xdb6090: mov rcx, qword ptr [r13 + 0x600]
0xdb6097: cmp dword ptr [rcx + 0x108], 1
0xdb609e: jbe 0x140db6029
0xdb60a0: cmp dword ptr [rcx + 0x118], 1
0xdb60a7: jbe 0x140db6029
0xdb60a9: mov rcx, qword ptr [rcx + 0x100]
0xdb60b0: movzx r8d, byte ptr [rsp + 0x54]
0xdb60b6: lea rdx, [rbp - 0x28]
0xdb60ba: mov rcx, qword ptr [rcx + 8]
0xdb60be: call 0x140d89410
0xdb60c3: jmp 0x140db6029
0xdb60c8: lea rcx, [rsp + 0x50]
0xdb60cd: call 0x140537250
0xdb60d2: cmp dword ptr [rax + 0x2c], 0x4d
0xdb60d6: jne 0x140db611d
0xdb60d8: mov r12, qword ptr [rsp + 0x58]
0xdb60dd: mov rsi, qword ptr [r12 + 0x258]
0xdb60e5: xor r9d, r9d
0xdb60e8: movzx r8d, word ptr [rsi + 0x13a]
0xdb60f0: lea rdx, [rsi + 0x138]
0xdb60f7: mov rcx, rsi
0xdb60fa: call 0x140cf1490
0xdb60ff: movzx edx, word ptr [rsi + 0x13a]
0xdb6106: mov rcx, rsi
0xdb6109: call 0x140cf1950
0xdb610e: mov dword ptr [rsi + 0x138], 0xffffffff
0xdb6118: jmp 0x140db65ff
0xdb611d: lea rcx, [rsp + 0x50]
0xdb6122: call 0x140537250
0xdb6127: cmp dword ptr [rax + 0x2c], 0x68
0xdb612b: jne 0x140db65fa
0xdb6131: movzx ebx, word ptr [rbp - 0x3c]
0xdb6135: mov word ptr [rbp + 0x420], bx
0xdb613c: xor sil, sil
0xdb613f: mov r13, qword ptr [r13 + 0x118]
0xdb6146: test r13, r13
0xdb6149: je 0x140db63e1
0xdb614f: mov eax, dword ptr [rbp - 0x40]
0xdb6152: mov dword ptr [rbp + 0x408], eax
0xdb6158: lea rcx, [rbp + 0x408]
0xdb615f: call 0x140473f20
0xdb6164: mov edx, 0xffff
0xdb6169: cmp word ptr [rax + 0x396], dx
0xdb6170: je 0x140db61cb
0xdb6172: mov rbx, qword ptr [r13 + 0x20]
0xdb6176: mov rax, qword ptr [rbx]
0xdb6179: mov rcx, qword ptr [rax + 0xa0]
0xdb6180: test rcx, rcx
0xdb6183: je 0x140db6190
0xdb6185: cmp qword ptr [rcx + 8], 0
0xdb618a: jne 0x140db63e1
0xdb6190: cmp dword ptr [rip + 0x5f1a005], 0
0xdb6197: je 0x140db63e1
0xdb619d: lea rdx, [rip + 0x5f19ff8]
0xdb61a4: mov rcx, qword ptr [rbx + 8]
0xdb61a8: call 0x1435ca0a0
0xdb61ad: test al, al
0xdb61af: je 0x140db63e1
0xdb61b5: mov rcx, qword ptr [rbx + 8]
0xdb61b9: call 0x1435caec0
0xdb61be: mov rcx, rbx
0xdb61c1: call 0x1435c66a0
0xdb61c6: jmp 0x140db63e1
0xdb61cb: lea rcx, [rbp + 0x408]
0xdb61d2: call 0x140473f20
0xdb61d7: lea rcx, [rax + 0x368]
0xdb61de: call 0x140389570
0xdb61e3: movzx ecx, word ptr [rax + 0x6c]
0xdb61e7: mov word ptr [rbp + 0x408], cx
0xdb61ee: mov r15d, 0xffff
0xdb61f4: cmp cx, r15w
0xdb61f8: jne 0x140db6200
0xdb61fa: movzx eax, r15w
0xdb61fe: jmp 0x140db624b
0xdb6200: lea rcx, [rbp + 0x408]
0xdb6207: call 0x140670050
0xdb620c: test byte ptr [rax + 0x1c], 1
0xdb6210: jne 0x140db623b
0xdb6212: cmp dword ptr [rip + 0x5f40f2b], 0
0xdb6219: je 0x140db623b
0xdb621b: lea rcx, [rbp + 0x408]
0xdb6222: call 0x140670050
0xdb6227: test byte ptr [rax + 0x1c], 8
0xdb622b: jne 0x140db623b
0xdb622d: cmp dword ptr [rip + 0x5f40f10], 0
0xdb6234: je 0x140db623b
0xdb6236: mov eax, r15d
0xdb6239: jmp 0x140db624b
0xdb623b: lea rcx, [rbp + 0x408]
0xdb6242: call 0x140670050
0xdb6247: movzx eax, word ptr [rax + 0x14]
0xdb624b: mov word ptr [rbp + 0x408], ax
0xdb6252: lea rcx, [rbp + 0x408]
0xdb6259: call 0x14066f7b0
0xdb625e: mov rsi, qword ptr [rax + 0x60]
0xdb6262: mov eax, dword ptr [rax + 0x68]
0xdb6265: imul rcx, rax, 0x68
0xdb6269: add rcx, rsi
0xdb626c: cmp rsi, rcx
0xdb626f: je 0x140db6290
0xdb6271: cmp byte ptr [rsi + 0x36], 0
0xdb6275: je 0x140db6287
0xdb6277: mov rax, qword ptr [rsi + 0x38]
0xdb627b: cmp byte ptr [rax + 0x60], 0
0xdb627f: jne 0x140db6287
0xdb6281: cmp word ptr [rax + 0x38], bx
0xdb6285: je 0x140db6297
0xdb6287: add rsi, 0x68
0xdb628b: cmp rsi, rcx
0xdb628e: jne 0x140db6271
0xdb6290: mov rsi, qword ptr [rip + 0x5f4b439]
0xdb6297: lea rcx, [rsi + 8]
0xdb629b: cmp word ptr [rcx], r15w
0xdb629f: je 0x140db62b3
0xdb62a1: call 0x14066f7b0
0xdb62a6: mov eax, dword ptr [rax + 0x68]
0xdb62a9: cmp dword ptr [rsi + 0x28], eax
0xdb62ac: jae 0x140db62b3
0xdb62ae: mov r15b, 1
0xdb62b1: jmp 0x140db62b6
0xdb62b3: xor r15b, r15b
0xdb62b6: lea rcx, [rbp + 0x408]
0xdb62bd: call 0x14066f7b0
0xdb62c2: mov rsi, qword ptr [rax + 0x60]
0xdb62c6: mov eax, dword ptr [rax + 0x68]
0xdb62c9: imul rcx, rax, 0x68
0xdb62cd: add rcx, rsi
0xdb62d0: cmp rsi, rcx
0xdb62d3: je 0x140db62f4
0xdb62d5: cmp byte ptr [rsi + 0x35], 0
0xdb62d9: je 0x140db62eb
0xdb62db: mov rax, qword ptr [rsi + 0x38]
0xdb62df: cmp byte ptr [rax + 0x60], 0
0xdb62e3: jne 0x140db62eb
0xdb62e5: cmp word ptr [rax + 0x38], bx
0xdb62e9: je 0x140db62fb
0xdb62eb: add rsi, 0x68
0xdb62ef: cmp rsi, rcx
0xdb62f2: jne 0x140db62d5
0xdb62f4: mov rsi, qword ptr [rip + 0x5f4b3d5]
0xdb62fb: lea rcx, [rsi + 8]
0xdb62ff: mov edx, 0xffff
0xdb6304: cmp word ptr [rcx], dx
0xdb6307: je 0x140db631a
0xdb6309: call 0x14066f7b0
0xdb630e: mov eax, dword ptr [rax + 0x68]
0xdb6311: cmp dword ptr [rsi + 0x28], eax
0xdb6314: jae 0x140db631a
0xdb6316: mov al, 1
0xdb6318: jmp 0x140db631c
0xdb631a: xor al, al
0xdb631c: test r15b, r15b
0xdb631f: je 0x140db635c
0xdb6321: test al, al
0xdb6323: je 0x140db635c
0xdb6325: mov sil, 1
0xdb6328: mov rbx, qword ptr [r13 + 0x20]
0xdb632c: mov rax, qword ptr [rbx]
0xdb632f: mov rcx, qword ptr [rax + 0xa0]
0xdb6336: test rcx, rcx
0xdb6339: je 0x140db6346
0xdb633b: cmp qword ptr [rcx + 8], 0
0xdb6340: jne 0x140db63dc
0xdb6346: cmp dword ptr [rip + 0x5f19e47], 0
0xdb634d: je 0x140db63dc
0xdb6353: lea rdx, [rip + 0x5f19e3a]
0xdb635a: jmp 0x140db63be
0xdb635c: xor sil, sil
0xdb635f: test r15b, r15b
0xdb6362: je 0x140db6390
0xdb6364: mov rbx, qword ptr [r13 + 0x20]
0xdb6368: mov rax, qword ptr [rbx]
0xdb636b: mov rcx, qword ptr [rax + 0xa0]
0xdb6372: test rcx, rcx
0xdb6375: je 0x140db637e
0xdb6377: cmp qword ptr [rcx + 8], 0
0xdb637c: jne 0x140db63dc
0xdb637e: cmp dword ptr [rip + 0x5f19e13], 0
0xdb6385: je 0x140db63dc
0xdb6387: lea rdx, [rip + 0x5f19e0a]
0xdb638e: jmp 0x140db63be
0xdb6390: test al, al
0xdb6392: je 0x140db63dc
0xdb6394: mov rbx, qword ptr [r13 + 0x20]
0xdb6398: mov rax, qword ptr [rbx]
0xdb639b: mov rcx, qword ptr [rax + 0xa0]
0xdb63a2: test rcx, rcx
0xdb63a5: je 0x140db63ae
0xdb63a7: cmp qword ptr [rcx + 8], 0
0xdb63ac: jne 0x140db63dc
0xdb63ae: cmp dword ptr [rip + 0x5f19de7], 0
0xdb63b5: je 0x140db63dc
0xdb63b7: lea rdx, [rip + 0x5f19dde]
0xdb63be: mov rcx, qword ptr [rbx + 8]
0xdb63c2: call 0x1435ca0a0
0xdb63c7: test al, al
0xdb63c9: je 0x140db63dc
0xdb63cb: mov rcx, qword ptr [rbx + 8]
0xdb63cf: call 0x1435caec0
0xdb63d4: mov rcx, rbx
0xdb63d7: call 0x1435c66a0
0xdb63dc: mov r15, qword ptr [rsp + 0x68]
0xdb63e1: mov rbx, qword ptr [rsp + 0x58]
0xdb63e6: mov rbx, qword ptr [rbx + 0x128]
0xdb63ed: test rbx, rbx
0xdb63f0: je 0x140db65fa
0xdb63f6: mov qword ptr [rbp + 0x178], r14
0xdb63fd: mov qword ptr [rbp + 0x180], 0x105
0xdb6408: mov dword ptr [rbp + 0x184], r14d
0xdb640f: mov byte ptr [rbp + 0x70], 0
0xdb6413: mov dword ptr [rbp + 0x184], r14d
0xdb641a: mov byte ptr [rbp + 0x70], 0
0xdb641e: mov rax, qword ptr [rbp + 0x178]
0xdb6425: test rax, rax
0xdb6428: je 0x140db642d
0xdb642a: mov byte ptr [rax], 0
0xdb642d: mov r8d, 0x10
0xdb6433: lea rdx, [rip + 0x48b5bbe]
0xdb643a: lea rcx, [rbp + 0x70]
0xdb643e: call 0x140393f50
0xdb6443: nop 
0xdb6444: lea rcx, [rbp + 0x420]
0xdb644b: call 0x14038ab60
0xdb6450: cmp dword ptr [rax + 0x98], 0
0xdb6457: je 0x140db64d9
0xdb645d: lea rcx, [rbp + 0x420]
0xdb6464: call 0x14038ab60
0xdb6469: mov ecx, dword ptr [rax + 0x98]
0xdb646f: dec ecx
0xdb6471: shl rcx, 5
0xdb6475: add rcx, qword ptr [rax + 0x90]
0xdb647c: call 0x140388e00
0xdb6481: mov rcx, qword ptr [rax + 0x18]
0xdb6485: mov rdx, qword ptr [rcx]
0xdb6488: mov dword ptr [rbp + 0x184], 0xffffffff
0xdb6492: lea rax, [rbp + 0x70]
0xdb6496: mov rcx, qword ptr [rbp + 0x178]
0xdb649d: test rcx, rcx
0xdb64a0: cmovne rax, rcx
0xdb64a4: cmp rdx, rax
0xdb64a7: je 0x140db64e0
0xdb64a9: nop dword ptr [rax]
0xdb64b0: inc r12
0xdb64b3: cmp byte ptr [rdx + r12], 0
0xdb64b8: jne 0x140db64b0
0xdb64ba: mov dword ptr [rbp + 0x184], r14d
0xdb64c1: mov byte ptr [rbp + 0x70], 0
0xdb64c5: test rcx, rcx
0xdb64c8: je 0x140db64cd
0xdb64ca: mov byte ptr [rcx], 0
0xdb64cd: mov r8d, r12d
0xdb64d0: lea rcx, [rbp + 0x70]
0xdb64d4: call 0x140393f50
0xdb64d9: mov rcx, qword ptr [rbp + 0x178]
0xdb64e0: mov dword ptr [rbp + 0x184], 0xffffffff
0xdb64ea: lea rdx, [rbp + 0x70]
0xdb64ee: test rcx, rcx
0xdb64f1: cmovne rdx, rcx
0xdb64f5: mov qword ptr [rbp - 0x70], r14
0xdb64f9: lea rax, [rip + 0x5caf440]
0xdb6500: mov qword ptr [rbp - 0x70], rax
0xdb6504: mov byte ptr [rbp - 0x68], 6
0xdb6508: mov byte ptr [rbp - 0x68], 2
0xdb650c: lea rcx, [rbp - 0x70]
0xdb6510: call 0x1403d5f80
0xdb6515: lea rcx, [rbp - 0x70]
0xdb6519: call 0x14141fe80
0xdb651e: lea rcx, [rbp - 0x70]
0xdb6522: call 0x141420260
0xdb6527: nop 
0xdb6528: mov byte ptr [rbp + 0x408], 0
0xdb652f: mov byte ptr [rbp + 0x420], 0x26
0xdb6536: lea r9, [rbp + 0x408]
0xdb653d: lea r8, [rbp - 0x70]
0xdb6541: lea rdx, [rbp + 0x420]
0xdb6548: mov rcx, qword ptr [rbx + 0x20]
0xdb654c: call 0x14064b880
0xdb6551: mov rbx, qword ptr [rbx + 0x20]
0xdb6555: mov rax, qword ptr [rbx]
0xdb6558: mov rcx, qword ptr [rax + 0xa0]
0xdb655f: test sil, sil
0xdb6562: je 0x140db6598
0xdb6564: test rcx, rcx
0xdb6567: je 0x140db6570
0xdb6569: cmp qword ptr [rcx + 8], 0
0xdb656e: jne 0x140db65c2
0xdb6570: cmp dword ptr [rip + 0x5f19c1d], 0
0xdb6577: je 0x140db65c2
0xdb6579: lea rdx, [rip + 0x5f19c14]
0xdb6580: mov rcx, qword ptr [rbx + 8]
0xdb6584: call 0x1435ca0a0
0xdb6589: test al, al
0xdb658b: je 0x140db65c2
0xdb658d: mov rcx, qword ptr [rbx + 8]
0xdb6591: call 0x1435caec0
0xdb6596: jmp 0x140db65b9
0xdb6598: test rcx, rcx
0xdb659b: je 0x140db65a4
0xdb659d: cmp qword ptr [rcx + 8], 0
0xdb65a2: jne 0x140db65c2
0xdb65a4: lea rdx, [rip + 0x5f19be9]
0xdb65ab: mov rcx, qword ptr [rbx + 8]
0xdb65af: call 0x1435ca140
0xdb65b4: cmp eax, -1
0xdb65b7: je 0x140db65c2
0xdb65b9: mov rcx, rbx
0xdb65bc: call 0x1435c66a0
0xdb65c1: nop 
0xdb65c2: lea rcx, [rbp - 0x70]
0xdb65c6: call 0x140394db0
0xdb65cb: nop 
0xdb65cc: mov rcx, qword ptr [rbp + 0x178]
0xdb65d3: test rcx, rcx
0xdb65d6: je 0x140db65fa
0xdb65d8: mov eax, 0x1fd
0xdb65dd: mov rdx, qword ptr [rbp - 0x58]
0xdb65e1: cmp byte ptr [rax + rdx], 0
0xdb65e5: je 0x140db65ee
0xdb65e7: call 0x1447f03bc
0xdb65ec: jmp 0x140db65f3
0xdb65ee: call 0x1447f02bc
0xdb65f3: mov qword ptr [rbp + 0x178], r14
0xdb65fa: mov r12, qword ptr [rsp + 0x58]
0xdb65ff: mov r13, qword ptr [rbp + 0x400]
0xdb6606: lea rcx, [rsp + 0x50]
0xdb660b: call 0x140537250
0xdb6610: vmovss xmm0, dword ptr [rax + 0x88]
0xdb6618: vxorps xmm6, xmm6, xmm6
0xdb661c: vucomiss xmm0, xmm6
0xdb6620: jp 0x140db6628
0xdb6622: je 0x140db6cde
0xdb6628: lea rsi, [r13 + 0x178]
0xdb662f: lea rcx, [rsp + 0x50]
0xdb6634: call 0x140537250
0xdb6639: cmp dword ptr [rsi + 4], 0
0xdb663d: je 0x140db66ad
0xdb663f: mov r9d, dword ptr [rax]
0xdb6642: mov ecx, dword ptr [rsi]
0xdb6644: test ecx, ecx
0xdb6646: je 0x140db66a1
0xdb6648: xor edx, edx
0xdb664a: mov eax, r9d
0xdb664d: div ecx
0xdb664f: mov r8d, edx
0xdb6652: shl r8, 8
0xdb6656: add r8, qword ptr [r13 + 0x188]
0xdb665d: mov edx, r14d
0xdb6660: mov r10d, dword ptr [r8]
0xdb6663: test r10d, r10d
0xdb6666: je 0x140db66a1
0xdb6668: nop dword ptr [rax + rax]
0xdb6670: mov eax, edx
0xdb6672: cmp dword ptr [r8 + rax*8 + 8], r9d
0xdb6677: jne 0x140db6693
0xdb6679: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xdb667e: mov rax, qword ptr [r13 + 0x190]
0xdb6685: mov rbx, qword ptr [rax + rcx*8]
0xdb6689: cmp dword ptr [rbx + 4], r9d
0xdb668d: je 0x140db6ae0
0xdb6693: inc edx
0xdb6695: cmp edx, r10d
0xdb6698: jb 0x140db6670
0xdb669a: lea rsi, [r13 + 0x178]
0xdb66a1: mov rbx, r14
0xdb66a4: test rbx, rbx
0xdb66a7: jne 0x140db6b77
0xdb66ad: mov qword ptr [rsp + 0x70], r14
0xdb66b2: mov dword ptr [rsp + 0x78], r14d
0xdb66b7: mov dword ptr [rsp + 0x7c], 0xffffffff
0xdb66bf: vpxor xmm0, xmm0, xmm0
0xdb66c3: vmovdqu xmmword ptr [rbp - 0x80], xmm0
0xdb66c8: mov qword ptr [rbp + 0x420], r15
0xdb66cf: inc dword ptr [rsi + 0xc]
0xdb66d2: lea rax, [rbp + 0x10]
0xdb66d6: mov qword ptr [rsp + 0x38], rax
0xdb66db: lea rax, [rbp - 0x70]
0xdb66df: mov qword ptr [rsp + 0x30], rax
0xdb66e4: lea rax, [rbp + 0x408]
0xdb66eb: mov qword ptr [rsp + 0x28], rax
0xdb66f0: lea r9, [rsp + 0x70]
0xdb66f5: mov r8d, dword ptr [r15]
0xdb66f8: lea rdx, [rbp + 0x420]
0xdb66ff: mov rcx, rsi
0xdb6702: call 0x1405d5a10
0xdb6707: nop 
0xdb6708: inc dword ptr [rsp + 0x7c]
0xdb670c: mov eax, 0x1fd
0xdb6711: mov ebx, eax
0xdb6713: mov rcx, qword ptr [rbp - 0x80]
0xdb6717: mov r13, qword ptr [rbp - 0x58]
0xdb671b: test rcx, rcx
0xdb671e: je 0x140db6afd
0xdb6724: mov dword ptr [rsp + 0x70], r14d
0xdb6729: cmp byte ptr [rax + r13], 0
0xdb672e: je 0x140db6af0
0xdb6734: call 0x1447f03bc
0xdb6739: jmp 0x140db6af5
0xdb673e: mov qword ptr [rbp - 0x20], r14
0xdb6742: jmp 0x140db5f22
0xdb6747: cmp dword ptr [rbp + 0x48], 0
0xdb674b: jne 0x140db65fa
0xdb6751: lea rcx, [rsp + 0x50]
0xdb6756: call 0x140537250
0xdb675b: lea rcx, [rsp + 0x50]
0xdb6760: cmp byte ptr [rax + 0xab], 0
0xdb6767: je 0x140db68ac
0xdb676d: call 0x140537250
0xdb6772: mov r12, qword ptr [rsp + 0x58]
0xdb6777: cmp dword ptr [rax + 0x2c], 0x16
0xdb677b: je 0x140db65ff
0xdb6781: mov eax, dword ptr [r12 + 0xd8]
0xdb6789: mov dword ptr [rbp + 0x408], eax
0xdb678f: lea rcx, [rbp + 0x408]
0xdb6796: call 0x140473f20
0xdb679b: lea rcx, [rax + 0x1ac]
0xdb67a2: cmp dword ptr [rcx], -1
0xdb67a5: je 0x140db67c5
0xdb67a7: call 0x1405c15a0
0xdb67ac: lea rcx, [rax + 0x58]
0xdb67b0: mov edx, 0xffff
0xdb67b5: cmp word ptr [rcx], dx
0xdb67b8: je 0x140db67bf
0xdb67ba: call 0x1405d2070
0xdb67bf: movzx ecx, byte ptr [rax + 0x11]
0xdb67c3: jmp 0x140db67cc
0xdb67c5: movzx ecx, byte ptr [rax + 0x1a8]
0xdb67cc: mov byte ptr [rbp - 8], cl
0xdb67cf: lea rcx, [rbp + 0x408]
0xdb67d6: call 0x140473f20
0xdb67db: mov rcx, qword ptr [rax + 0x18]
0xdb67df: mov rax, qword ptr [rcx]
0xdb67e2: xor edx, edx
0xdb67e4: call qword ptr [rax + 8]
0xdb67e7: mov rdx, rax
0xdb67ea: lea rcx, [rbp]
0xdb67ee: call 0x1403d5f80
0xdb67f3: lea rcx, [rsp + 0x50]
0xdb67f8: call 0x140537250
0xdb67fd: cmp dword ptr [rax + 0x2c], 0x19
0xdb6801: je 0x140db6817
0xdb6803: lea rcx, [rsp + 0x50]
0xdb6808: call 0x140537250
0xdb680d: cmp dword ptr [rax + 0x2c], 0x1a
0xdb6811: jne 0x140db65ff
0xdb6817: lea rcx, [rbp + 0x408]
0xdb681e: call 0x140473f20
0xdb6823: lea rcx, [rax + 0x360]
0xdb682a: call 0x140388e00
0xdb682f: lea rcx, [rax + 0x18]
0xdb6833: call 0x1403d5f10
0xdb6838: mov eax, eax
0xdb683a: mov qword ptr [rbp - 0x20], rax
0xdb683e: lea rcx, [rbp + 0x408]
0xdb6845: call 0x140473f20
0xdb684a: lea rcx, [rax + 0x360]
0xdb6851: call 0x140388e00
0xdb6856: mov rdx, qword ptr [rax + 0x18]
0xdb685a: mov rdx, qword ptr [rdx]
0xdb685d: lea rcx, [rbp + 8]
0xdb6861: call 0x1403d5f80
0xdb6866: mov r13, qword ptr [rbp + 0x400]
0xdb686d: mov rcx, qword ptr [r13 + 0x600]
0xdb6874: cmp dword ptr [rcx + 0x108], 0
0xdb687b: jbe 0x140db6606
0xdb6881: cmp dword ptr [rcx + 0x118], 0
0xdb6888: jbe 0x140db6606
0xdb688e: mov rcx, qword ptr [rcx + 0x100]
0xdb6895: movzx r8d, byte ptr [rsp + 0x54]
0xdb689b: lea rdx, [rbp - 0x28]
0xdb689f: mov rcx, qword ptr [rcx]
0xdb68a2: call 0x140d89410
0xdb68a7: jmp 0x140db6606
0xdb68ac: call 0x140537250
0xdb68b1: cmp byte ptr [rax + 0xaf], 0
0xdb68b8: je 0x140db65fa
0xdb68be: lea rcx, [rsp + 0x50]
0xdb68c3: call 0x140537250
0xdb68c8: cmp dword ptr [rax + 0x2c], 0x5a
0xdb68cc: je 0x140db6902
0xdb68ce: lea rcx, [rsp + 0x50]
0xdb68d3: call 0x140537250
0xdb68d8: cmp dword ptr [rax + 0x2c], 0x5b
0xdb68dc: je 0x140db6902
0xdb68de: lea rcx, [rsp + 0x50]
0xdb68e3: call 0x140537250
0xdb68e8: cmp dword ptr [rax + 0x2c], 0x5c
0xdb68ec: je 0x140db6902
0xdb68ee: lea rcx, [rsp + 0x50]
0xdb68f3: call 0x140537250
0xdb68f8: cmp dword ptr [rax + 0x2c], 0x5d
0xdb68fc: jne 0x140db65fa
0xdb6902: mov r12, qword ptr [rsp + 0x58]
0xdb6907: movzx eax, word ptr [r12 + 0xdc]
0xdb6910: mov word ptr [rbp + 0x408], ax
0xdb6917: lea rcx, [rbp + 0x408]
0xdb691e: call 0x140430280
0xdb6923: mov r13, qword ptr [rbp + 0x400]
0xdb692a: lea rbx, [r13 + 0x4d8]
0xdb6931: mov r8d, dword ptr [rbx + 8]
0xdb6935: mov edx, r14d
0xdb6938: test r8d, r8d
0xdb693b: je 0x140db696e
0xdb693d: mov r9, qword ptr [rbx]
0xdb6940: mov r10d, dword ptr [rax + 0x14]
0xdb6944: nop dword ptr [rax]
0xdb6948: nop dword ptr [rax + rax]
0xdb6950: mov eax, edx
0xdb6952: lea rcx, [rax + rax*4]
0xdb6956: cmp dword ptr [r9 + rcx*8], r10d
0xdb695a: je 0x140db6a4c
0xdb6960: inc edx
0xdb6962: cmp edx, r8d
0xdb6965: jb 0x140db6950
0xdb6967: lea rbx, [r13 + 0x4d8]
0xdb696e: mov edx, 0xffffffff
0xdb6973: cmp edx, -1
0xdb6976: jne 0x140db6a8a
0xdb697c: mov rsi, rbx
0xdb697f: mov qword ptr [rsp + 0x70], r14
0xdb6984: mov qword ptr [rsp + 0x78], r14
0xdb6989: mov qword ptr [rbp - 0x80], r14
0xdb698d: mov qword ptr [rbp - 0x78], r14
0xdb6991: lea rcx, [rbp + 0x408]
0xdb6998: call 0x140430280
0xdb699d: nop 
0xdb699e: mov eax, dword ptr [rax + 0x14]
0xdb69a1: mov dword ptr [rbp + 0x18], eax
0xdb69a4: lea rax, [rbp + 0x20]
0xdb69a8: mov qword ptr [rbp + 0x420], rax
0xdb69af: mov qword ptr [rbp + 0x20], r14
0xdb69b3: mov qword ptr [rbp + 0x28], r14
0xdb69b7: lea rdx, [rsp + 0x70]
0xdb69bc: lea rcx, [rbp + 0x20]
0xdb69c0: call 0x140de92f0
0xdb69c5: nop 
0xdb69c6: mov qword ptr [rbp + 0x30], r14
0xdb69ca: mov qword ptr [rbp + 0x38], r14
0xdb69ce: lea rdx, [rbp - 0x80]
0xdb69d2: lea rcx, [rbp + 0x30]
0xdb69d6: call 0x1403a1400
0xdb69db: nop 
0xdb69dc: mov dword ptr [rbp - 0x60], 8
0xdb69e3: mov edx, dword ptr [rbx + 8]
0xdb69e6: cmp dword ptr [rbx + 0xc], edx
0xdb69e9: ja 0x140db69fa
0xdb69eb: mov rcx, rbx
0xdb69ee: call 0x140de9430
0xdb69f3: lea rbx, [r13 + 0x4d8]
0xdb69fa: mov eax, dword ptr [rsi + 8]
0xdb69fd: lea rcx, [rax + rax*4]
0xdb6a01: mov rax, qword ptr [rsi]
0xdb6a04: lea rcx, [rax + rcx*8]
0xdb6a08: lea rdx, [rbp + 0x18]
0xdb6a0c: call 0x140de59e0
0xdb6a11: inc dword ptr [rsi + 8]
0xdb6a14: mov eax, 8
0xdb6a19: and eax, 0xfffffff7
0xdb6a1c: mov dword ptr [rbp - 0x2c], eax
0xdb6a1f: mov dword ptr [rbp - 0x60], eax
0xdb6a22: lea rax, [rbp + 0x20]
0xdb6a26: mov qword ptr [rbp + 0x408], rax
0xdb6a2d: mov rcx, qword ptr [rbp + 0x30]
0xdb6a31: test rcx, rcx
0xdb6a34: je 0x140db6a5d
0xdb6a36: mov eax, 0x1fd
0xdb6a3b: mov rdx, qword ptr [rbp - 0x58]
0xdb6a3f: cmp byte ptr [rax + rdx], 0
0xdb6a43: je 0x140db6a58
0xdb6a45: call 0x1447f03bc
0xdb6a4a: jmp 0x140db6a5d
0xdb6a4c: lea rbx, [r13 + 0x4d8]
0xdb6a53: jmp 0x140db6973
0xdb6a58: call 0x1447f02bc
0xdb6a5d: mov qword ptr [rbp + 0x30], r14
0xdb6a61: mov qword ptr [rbp + 0x38], r14
0xdb6a65: lea rcx, [rbp + 0x20]
0xdb6a69: call 0x140465ef0
0xdb6a6e: nop 
0xdb6a6f: mov qword ptr [rbp - 0x80], r14
0xdb6a73: mov qword ptr [rbp - 0x78], r14
0xdb6a77: lea rcx, [rsp + 0x70]
0xdb6a7c: call 0x140465ef0
0xdb6a81: mov edx, dword ptr [r13 + 0x4e0]
0xdb6a88: dec edx
0xdb6a8a: mov eax, edx
0xdb6a8c: lea rcx, [rax + rax*4]
0xdb6a90: mov rax, qword ptr [rbx]
0xdb6a93: lea rbx, [rax + rcx*8]
0xdb6a97: mov ecx, dword ptr [rbx + 0x20]
0xdb6a9a: mov eax, dword ptr [rbx + 0x24]
0xdb6a9d: cmp eax, ecx
0xdb6a9f: ja 0x140db6ac5
0xdb6aa1: lea edx, [rax*2 + 1]
0xdb6aa8: add edx, eax
0xdb6aaa: shr edx, 1
0xdb6aac: cmp edx, 1
0xdb6aaf: mov eax, 1
0xdb6ab4: cmovb edx, eax
0xdb6ab7: cmp ecx, edx
0xdb6ab9: cmova edx, ecx
0xdb6abc: lea rcx, [rbx + 0x18]
0xdb6ac0: call 0x14035e3f0
0xdb6ac5: mov ecx, dword ptr [rbx + 0x20]
0xdb6ac8: mov rax, qword ptr [rbx + 0x18]
0xdb6acc: mov qword ptr [rax + rcx*8], r12
0xdb6ad0: inc dword ptr [rbx + 0x20]
0xdb6ad3: mov byte ptr [r13 + 0xadd], 1
0xdb6adb: jmp 0x140db6606
0xdb6ae0: add rbx, 8
0xdb6ae4: lea rsi, [r13 + 0x178]
0xdb6aeb: jmp 0x140db66a4
0xdb6af0: call 0x1447f02bc
0xdb6af5: mov qword ptr [rbp - 0x80], r14
0xdb6af9: mov qword ptr [rbp - 0x80], r14
0xdb6afd: mov r15, qword ptr [rbp - 0x78]
0xdb6b01: test r15, r15
0xdb6b04: je 0x140db6b73
0xdb6b06: mov eax, dword ptr [rsp + 0x74]
0xdb6b0a: test eax, eax
0xdb6b0c: je 0x140db6b50
0xdb6b0e: mov rbx, r15
0xdb6b11: mov esi, eax
0xdb6b13: mov r12d, 0x1fd
0xdb6b19: nop dword ptr [rax]
0xdb6b20: mov rcx, qword ptr [rbx]
0xdb6b23: test rcx, rcx
0xdb6b26: je 0x140db6b3b
0xdb6b28: cmp byte ptr [r12 + r13], 0
0xdb6b2d: je 0x140db6b36
0xdb6b2f: call 0x1447f03bc
0xdb6b34: jmp 0x140db6b3b
0xdb6b36: call 0x1447f02bc
0xdb6b3b: mov qword ptr [rbx], r14
0xdb6b3e: add rbx, 8
0xdb6b42: sub rsi, 1
0xdb6b46: jne 0x140db6b20
0xdb6b48: mov ebx, r12d
0xdb6b4b: mov r12, qword ptr [rsp + 0x58]
0xdb6b50: mov qword ptr [rsp + 0x74], r14
0xdb6b55: mov rcx, r15
0xdb6b58: cmp byte ptr [rbx + r13], 0
0xdb6b5d: je 0x140db6b66
0xdb6b5f: call 0x1447f03bc
0xdb6b64: jmp 0x140db6b6b
0xdb6b66: call 0x1447f02bc
0xdb6b6b: mov qword ptr [rbp - 0x78], r14
0xdb6b6f: mov qword ptr [rbp - 0x78], r14
0xdb6b73: mov rbx, qword ptr [rbp + 0x10]
0xdb6b77: inc dword ptr [rbx + 0xc]
0xdb6b7a: mov edx, 0x10
0xdb6b7f: lea rcx, [rbp - 0x40]
0xdb6b83: call 0x141364780
0xdb6b88: mov esi, eax
0xdb6b8a: cmp dword ptr [rbx], 0
0xdb6b8d: jne 0x140db6b99
0xdb6b8f: mov edx, eax
0xdb6b91: mov rcx, rbx
0xdb6b94: call 0x140391680
0xdb6b99: mov ecx, dword ptr [rbx]
0xdb6b9b: test ecx, ecx
0xdb6b9d: je 0x140db6bf7
0xdb6b9f: xor edx, edx
0xdb6ba1: mov eax, esi
0xdb6ba3: div ecx
0xdb6ba5: mov r9d, edx
0xdb6ba8: shl r9, 8
0xdb6bac: add r9, qword ptr [rbx + 0x10]
0xdb6bb0: mov edx, r14d
0xdb6bb3: mov r10d, dword ptr [r9]
0xdb6bb6: test r10d, r10d
0xdb6bb9: je 0x140db6bf7
0xdb6bbb: mov r15, qword ptr [rbp - 0x38]
0xdb6bbf: mov r11, qword ptr [rbp - 0x40]
0xdb6bc3: mov eax, edx
0xdb6bc5: cmp dword ptr [r9 + rax*8 + 8], esi
0xdb6bca: jne 0x140db6be5
0xdb6bcc: mov ecx, dword ptr [r9 + rax*8 + 0xc]
0xdb6bd1: mov rax, qword ptr [rbx + 0x18]
0xdb6bd5: mov r8, qword ptr [rax + rcx*8]
0xdb6bd9: cmp byte ptr [r8 + 0x10], r15b
0xdb6bdd: jne 0x140db6be5
0xdb6bdf: cmp qword ptr [r8 + 8], r11
0xdb6be3: je 0x140db6bee
0xdb6be5: inc edx
0xdb6be7: cmp edx, r10d
0xdb6bea: jb 0x140db6bc3
0xdb6bec: jmp 0x140db6bf7
0xdb6bee: test r8, r8
0xdb6bf1: jne 0x140db6cde
0xdb6bf7: xor edx, edx
0xdb6bf9: mov eax, esi
0xdb6bfb: div dword ptr [rbx]
0xdb6bfd: mov r12d, edx
0xdb6c00: mov ecx, edx
0xdb6c02: shl rcx, 8
0xdb6c06: mov rax, qword ptr [rbx + 0x10]
0xdb6c0a: cmp dword ptr [rcx + rax], 0x1f
0xdb6c0e: jne 0x140db6c23
0xdb6c10: mov edx, esi
0xdb6c12: mov rcx, rbx
0xdb6c15: call 0x140391680
0xdb6c1a: xor edx, edx
0xdb6c1c: mov eax, esi
0xdb6c1e: div dword ptr [rbx]
0xdb6c20: mov r12d, edx
0xdb6c23: mov r15d, r12d
0xdb6c26: shl r15, 8
0xdb6c2a: add r15, qword ptr [rbx + 0x10]
0xdb6c2e: mov eax, dword ptr [r15]
0xdb6c31: mov dword ptr [rbp + 0x408], eax
0xdb6c37: mov r13d, dword ptr [rbx + 4]
0xdb6c3b: cmp r13d, dword ptr [rbx + 8]
0xdb6c3f: jb 0x140db6c53
0xdb6c41: lea edx, [r13 + 1]
0xdb6c45: mov rcx, rbx
0xdb6c48: call 0x1403a41c0
0xdb6c4d: mov eax, dword ptr [rbp + 0x408]
0xdb6c53: mov dword ptr [r15 + rax*8 + 8], esi
0xdb6c58: mov dword ptr [r15 + rax*8 + 0xc], r13d
0xdb6c5d: inc dword ptr [r15]
0xdb6c60: mov r15d, 0x1fd
0xdb6c66: mov rax, qword ptr gs:[0x58]
0xdb6c6f: mov rcx, qword ptr [rax]
0xdb6c72: mov edx, 8
0xdb6c77: cmp byte ptr [r15 + rcx], 0
0xdb6c7c: mov ecx, 0x20
0xdb6c81: je 0x140db6c8a
0xdb6c83: call 0x1447efa78
0xdb6c88: jmp 0x140db6c8f
0xdb6c8a: call 0x1447ef9b0
0xdb6c8f: mov rsi, rax
0xdb6c92: test rax, rax
0xdb6c95: jne 0x140db6cb2
0xdb6c97: call 0x141318e70
0xdb6c9c: xor r9d, r9d
0xdb6c9f: xor r8d, r8d
0xdb6ca2: mov edx, 1
0xdb6ca7: mov ecx, 0xa0000002
0xdb6cac: call qword ptr [rip + 0x4434496]
0xdb6cb2: vmovups xmm0, xmmword ptr [rbp - 0x40]
0xdb6cb7: imul eax, r12d, 0x1f
0xdb6cbb: add eax, dword ptr [rbp + 0x408]
0xdb6cc1: mov dword ptr [rsi], eax
0xdb6cc3: vmovups xmmword ptr [rsi + 8], xmm0
0xdb6cc8: mov r12, qword ptr [rsp + 0x58]
0xdb6ccd: mov qword ptr [rsi + 0x18], r12
0xdb6cd1: mov rax, qword ptr [rbx + 0x18]
0xdb6cd5: mov qword ptr [rax + r13*8], rsi
0xdb6cd9: inc dword ptr [rbx + 4]
0xdb6cdc: jmp 0x140db6ce4
0xdb6cde: mov r15d, 0x1fd
0xdb6ce4: mov rsi, qword ptr [rbp + 0x400]
0xdb6ceb: mov rax, qword ptr [rsi + 0x658]
0xdb6cf2: mov r8, qword ptr [rax + 8]
0xdb6cf6: mov eax, dword ptr [rax + 0x10]
0xdb6cf9: lea rcx, [rax + rax*2]
0xdb6cfd: lea r9, [r8 + rcx*8]
0xdb6d01: cmp r8, r9
0xdb6d04: je 0x140db6d3f
0xdb6d06: nop word ptr [rax + rax]
0xdb6d10: mov rcx, qword ptr [r8]
0xdb6d13: mov edx, dword ptr [r8 + 8]
0xdb6d17: mov eax, r14d
0xdb6d1a: test edx, edx
0xdb6d1c: je 0x140db6d36
0xdb6d1e: nop 
0xdb6d20: cmp word ptr [rcx], di
0xdb6d23: je 0x140db6d31
0xdb6d25: inc eax
0xdb6d27: add rcx, 2
0xdb6d2b: cmp eax, edx
0xdb6d2d: jb 0x140db6d20
0xdb6d2f: jmp 0x140db6d36
0xdb6d31: cmp eax, -1
0xdb6d34: jne 0x140db6d87
0xdb6d36: add r8, 0x18
0xdb6d3a: cmp r8, r9
0xdb6d3d: jne 0x140db6d10
0xdb6d3f: mov r13d, 0x1ec
0xdb6d45: lea rcx, [rsp + 0x50]
0xdb6d4a: call 0x140537250
0xdb6d4f: cmp dword ptr [rax + 0x2c], 0x4b
0xdb6d53: je 0x140db6d69
0xdb6d55: lea rcx, [rsp + 0x50]
0xdb6d5a: call 0x140537250
0xdb6d5f: cmp dword ptr [rax + 0x2c], 0x51
0xdb6d63: jne 0x140db6e44
0xdb6d69: mov ecx, r14d
0xdb6d6c: lea rax, [r12 + 0x1e8]
0xdb6d74: cmp byte ptr [rax], 0
0xdb6d77: jne 0x140db6df6
0xdb6d79: inc ecx
0xdb6d7b: inc rax
0xdb6d7e: cmp ecx, 3
0xdb6d81: jb 0x140db6d74
0xdb6d83: xor dl, dl
0xdb6d85: jmp 0x140db6df8
0xdb6d87: mov r13d, 0x1ec
0xdb6d8d: cmp byte ptr [r8 + 0x10], 0
0xdb6d92: je 0x140db6d45
0xdb6d94: mov rax, qword ptr gs:[0x58]
0xdb6d9d: mov rcx, qword ptr [rax]
0xdb6da0: mov rdx, qword ptr [rip + 0x5fb2781]
0xdb6da7: cmp byte ptr [r13 + rcx], 0
0xdb6dad: cmovne rdx, qword ptr [rip + 0x5fb277b]
0xdb6db5: mov rax, qword ptr [rdx]
0xdb6db8: mov rcx, qword ptr [rax + 8]
0xdb6dbc: mov rax, qword ptr [rcx + 0x270]
0xdb6dc3: cmp di, word ptr [rax + 0x134]
0xdb6dca: jne 0x140db6de4
0xdb6dcc: vmovss xmm0, dword ptr [r12 + 0xe4]
0xdb6dd6: vcomiss xmm0, dword ptr [rip + 0x5f2726a]
0xdb6dde: ja 0x140db6d45
0xdb6de4: mov r8b, 1
0xdb6de7: xor edx, edx
0xdb6de9: mov rcx, r12
0xdb6dec: call 0x140deca40
0xdb6df1: jmp 0x140db6d45
0xdb6df6: mov dl, 1
0xdb6df8: movzx eax, byte ptr [r12 + 0x1e8]
0xdb6e01: bts eax, 5
0xdb6e05: mov byte ptr [r12 + 0x1e8], al
0xdb6e0d: mov ecx, r14d
0xdb6e10: lea rax, [r12 + 0x1e8]
0xdb6e18: cmp byte ptr [rax], 0
0xdb6e1b: jne 0x140db6e2b
0xdb6e1d: inc ecx
0xdb6e1f: inc rax
0xdb6e22: cmp ecx, 3
0xdb6e25: jb 0x140db6e18
0xdb6e27: xor al, al
0xdb6e29: jmp 0x140db6e2d
0xdb6e2b: mov al, 1
0xdb6e2d: cmp dl, al
0xdb6e2f: je 0x140db6e44
0xdb6e31: mov rdx, qword ptr [r12]
0xdb6e35: mov rcx, r12
0xdb6e38: test al, al
0xdb6e3a: je 0x140db6e41
0xdb6e3c: call qword ptr [rdx + 0x28]
0xdb6e3f: jmp 0x140db6e44
0xdb6e41: call qword ptr [rdx + 0x20]
0xdb6e44: lea rcx, [rsp + 0x50]
0xdb6e49: call 0x140537250
0xdb6e4e: cmp byte ptr [rax + 0xb5], 0
0xdb6e55: je 0x140db6e95
0xdb6e57: cmp byte ptr [rsi + 0xae6], 0
0xdb6e5e: jne 0x140db6e95
0xdb6e60: cmp qword ptr [r12 + 0x260], 0
0xdb6e69: je 0x140db6e95
0xdb6e6b: vmovd xmm1, r14d
0xdb6e70: movzx eax, byte ptr [rsi + 0xae4]
0xdb6e77: vmovd xmm0, eax
0xdb6e7b: vpcmpeqd xmm3, xmm0, xmm1
0xdb6e7f: vmovss xmm2, dword ptr [rip + 0x4fbc22d]
0xdb6e87: vblendvps xmm1, xmm2, xmm6, xmm3
0xdb6e8d: mov rcx, r12
0xdb6e90: call 0x140d8bd40
0xdb6e95: mov rcx, r12
0xdb6e98: call 0x140d8bf00
0xdb6e9d: cmp al, 3
0xdb6e9f: jne 0x140db6eb0
0xdb6ea1: mov rax, qword ptr [rsi + 0x468]
0xdb6ea8: cmp byte ptr [rax + 3], 0
0xdb6eac: je 0x140db6ec1
0xdb6eae: jmp 0x140db6ece
0xdb6eb0: cmp al, 4
0xdb6eb2: jne 0x140db6ece
0xdb6eb4: mov rax, qword ptr [rsi + 0x468]
0xdb6ebb: cmp byte ptr [rax + 4], 0
0xdb6ebf: jne 0x140db6ece
0xdb6ec1: mov r8b, 1
0xdb6ec4: mov dl, 0xc
0xdb6ec6: mov rcx, r12
0xdb6ec9: call 0x140deca40
0xdb6ece: cmp byte ptr [rip + 0x5ef54c3], 0
0xdb6ed5: je 0x140db70e2
0xdb6edb: mov rax, qword ptr [rbp + 0x58]
0xdb6edf: mov rax, qword ptr [rax + 0x68]
0xdb6ee3: mov rcx, qword ptr [rax + 0x1a0]
0xdb6eea: mov rax, qword ptr [rcx]
0xdb6eed: lea rdx, [rbp + 0x18]
0xdb6ef1: call qword ptr [rax + 0x140]
0xdb6ef7: mov edi, dword ptr [rbp - 0x2c]
0xdb6efa: or edi, 2
0xdb6efd: mov dword ptr [rbp - 0x60], edi
0xdb6f00: cmp byte ptr [rbp + 0x28], 0
0xdb6f04: je 0x140db709e
0xdb6f0a: lea rcx, [rsp + 0x50]
0xdb6f0f: call 0x140537250
0xdb6f14: cmp dword ptr [rax + 0x2c], 0x4c
0xdb6f18: jne 0x140db709e
0xdb6f1e: mov rcx, qword ptr [rbp + 0x20]
0xdb6f22: mov rax, qword ptr [rcx]
0xdb6f25: call qword ptr [rax + 0x40]
0xdb6f28: mov rbx, rax
0xdb6f2b: lea rdx, [rax + 8]
0xdb6f2f: test rax, rax
0xdb6f32: cmove rdx, r14
0xdb6f36: mov rdx, qword ptr [rdx]
0xdb6f39: lea rcx, [rsp + 0x70]
0xdb6f3e: call 0x140393df0
0xdb6f43: nop 
0xdb6f44: mov qword ptr [rsp + 0x78], rbx
0xdb6f49: or edi, 4
0xdb6f4c: mov dword ptr [rbp - 0x60], edi
0xdb6f4f: mov rax, qword ptr [rbx]
0xdb6f52: lea rdx, [rbp + 0x408]
0xdb6f59: mov rcx, rbx
0xdb6f5c: call qword ptr [rax + 0x28]
0xdb6f5f: and edi, 0xfffffffb
0xdb6f62: mov dword ptr [rbp - 0x60], edi
0xdb6f65: mov rcx, qword ptr [rsp + 0x70]
0xdb6f6a: mov rax, qword ptr [rcx]
0xdb6f6d: mov dl, 1
0xdb6f6f: call qword ptr [rax + 0x20]
0xdb6f72: mov rax, qword ptr [rbp - 0x38]
0xdb6f76: cmp al, 0xe
0xdb6f78: jne 0x140db705c
0xdb6f7e: lea rax, [rbp + 0x1a0]
0xdb6f85: mov qword ptr [rbp + 0x190], rax
0xdb6f8c: mov dword ptr [rbp + 0x198], r14d
0xdb6f93: mov dword ptr [rbp + 0x19c], 0x20
0xdb6f9d: mov rax, qword ptr gs:[0x58]
0xdb6fa6: mov rbx, qword ptr [rax]
0xdb6fa9: mov eax, r13d
0xdb6fac: mov rcx, qword ptr [rip + 0x5fb2575]
0xdb6fb3: cmp byte ptr [rax + rbx], 0
0xdb6fb7: cmovne rcx, qword ptr [rip + 0x5fb2571]
0xdb6fbf: lea rax, [rbp + 0x190]
0xdb6fc6: mov qword ptr [rsp + 0x70], rax
0xdb6fcb: mov qword ptr [rsp + 0x78], r14
0xdb6fd0: mov rax, qword ptr [rcx]
0xdb6fd3: mov rcx, qword ptr [rax + 8]
0xdb6fd7: lea rdx, [rsp + 0x70]
0xdb6fdc: mov rcx, qword ptr [rcx + 0x390]
0xdb6fe3: call 0x1415e0850
0xdb6fe8: movzx edx, word ptr [rbp + 0x408]
0xdb6fef: mov eax, 0xffff
0xdb6ff4: cmp edx, eax
0xdb6ff6: je 0x140db702d
0xdb6ff8: cmp dword ptr [rbp - 0x40], -1
0xdb6ffc: je 0x140db702d
0xdb6ffe: mov rax, qword ptr [rbp - 0x3c]
0xdb7002: cmp eax, dword ptr [rbp + 0x198]
0xdb7008: jae 0x140db702d
0xdb700a: mov ecx, eax
0xdb700c: add rcx, rcx
0xdb700f: mov rax, qword ptr [rbp + 0x190]
0xdb7016: movzx ecx, word ptr [rax + rcx*8 + 8]
0xdb701b: cmp ecx, edx
0xdb701d: jne 0x140db702d
0xdb701f: mov r8b, 1
0xdb7022: mov dl, 0x13
0xdb7024: mov rcx, r12
0xdb7027: call 0x140deca40
0xdb702c: nop 
0xdb702d: lea rax, [rbp + 0x1a0]
0xdb7034: mov rcx, qword ptr [rbp + 0x190]
0xdb703b: cmp rcx, rax
0xdb703e: je 0x140db709e
0xdb7040: test rcx, rcx
0xdb7043: je 0x140db709e
0xdb7045: mov eax, r15d
0xdb7048: cmp byte ptr [rax + rbx], 0
0xdb704c: je 0x140db7055
0xdb704e: call 0x1447f03bc
0xdb7053: jmp 0x140db709e
0xdb7055: call 0x1447f02bc
0xdb705a: jmp 0x140db709e
0xdb705c: cmp al, 4
0xdb705e: jne 0x140db709e
0xdb7060: lea rcx, [rbp + 0x408]
0xdb7067: call 0x140430020
0xdb706c: mov ecx, r14d
0xdb706f: mov edx, dword ptr [rax + 0x30]
0xdb7072: test edx, edx
0xdb7074: je 0x140db709e
0xdb7076: mov r8, qword ptr [rax + 0x28]
0xdb707a: mov r9, qword ptr [rbp - 0x40]
0xdb707e: nop 
0xdb7080: mov eax, ecx
0xdb7082: cmp r9w, word ptr [r8 + rax*2]
0xdb7087: je 0x140db7091
0xdb7089: inc ecx
0xdb708b: cmp ecx, edx
0xdb708d: jb 0x140db7080
0xdb708f: jmp 0x140db709e
0xdb7091: mov r8b, 1
0xdb7094: mov dl, 0x13
0xdb7096: mov rcx, r12
0xdb7099: call 0x140deca40
0xdb709e: and edi, 0xfffffffd
0xdb70a1: mov dword ptr [rbp - 0x60], edi
0xdb70a4: lea rax, [rip + 0x4b5bdb5]
0xdb70ab: mov qword ptr [rbp + 0x18], rax
0xdb70af: cmp byte ptr [rbp + 0x28], 0
0xdb70b3: je 0x140db70c3
0xdb70b5: mov rcx, qword ptr [rbp + 0x40]
0xdb70b9: mov rax, qword ptr [rcx]
0xdb70bc: call qword ptr [rax + 0x148]
0xdb70c2: nop 
0xdb70c3: lea rax, [rip + 0x47bc776]
0xdb70ca: mov qword ptr [rbp + 0x18], rax
0xdb70ce: lea rax, [rip + 0x496ed73]
0xdb70d5: mov qword ptr [rbp + 0x18], rax
0xdb70d9: lea rcx, [rbp + 0x18]
0xdb70dd: call 0x141434880
0xdb70e2: movzx edi, word ptr [rsp + 0x60]
0xdb70e7: mov eax, 0xffff
0xdb70ec: cmp ax, di
0xdb70ef: je 0x140db7197
0xdb70f5: cmp byte ptr [rsi + 0xbf1], 0
0xdb70fc: je 0x140db7197
0xdb7102: lea rcx, [rsp + 0x50]
0xdb7107: call 0x140537250
0xdb710c: movzx r15d, byte ptr [rax + 0xa8]
0xdb7114: mov rbx, qword ptr [rsi + 0xb90]
0xdb711b: mov eax, dword ptr [rsi + 0xb98]
0xdb7121: lea rcx, [rax + rax*4]
0xdb7125: lea rsi, [rbx + rcx*8]
0xdb7129: cmp rbx, rsi
0xdb712c: je 0x140db7190
0xdb712e: mov r14d, dword ptr [rbp - 0x50]
0xdb7132: cmp byte ptr [rbx + 0x20], r15b
0xdb7136: jne 0x140db7184
0xdb7138: mov rdx, qword ptr [rbx]
0xdb713b: mov eax, dword ptr [rbx + 8]
0xdb713e: lea rcx, [rax + rax*2]
0xdb7142: lea r8, [rdx + rcx*8]
0xdb7146: cmp rdx, r8
0xdb7149: je 0x140db7184
0xdb714b: nop dword ptr [rax + rax]
0xdb7150: movzx eax, word ptr [rdx + 0x10]
0xdb7154: cmp eax, edi
0xdb7156: je 0x140db7163
0xdb7158: add rdx, 0x18
0xdb715c: cmp rdx, r8
0xdb715f: jne 0x140db7150
0xdb7161: jmp 0x140db7184
0xdb7163: cmp dword ptr [rdx + 8], r14d
0xdb7167: jbe 0x140db7184
0xdb7169: lea rcx, [r14 + r14*4]
0xdb716d: mov rax, qword ptr [rdx]
0xdb7170: cmp byte ptr [rax + rcx*8 + 0x24], 0
0xdb7175: jne 0x140db7184
0xdb7177: mov r8b, 1
0xdb717a: mov dl, 0x12
0xdb717c: mov rcx, r12
0xdb717f: call 0x140deca40
0xdb7184: add rbx, 0x28
0xdb7188: cmp rbx, rsi
0xdb718b: jne 0x140db7132
0xdb718d: xor r14d, r14d
0xdb7190: mov rsi, qword ptr [rbp + 0x400]
0xdb7197: mov ecx, r14d
0xdb719a: lea rax, [r12 + 0x1e8]
0xdb71a2: cmp byte ptr [rax], 0
0xdb71a5: jne 0x140db71b5
0xdb71a7: inc ecx
0xdb71a9: inc rax
0xdb71ac: cmp ecx, 3
0xdb71af: jb 0x140db71a2
0xdb71b1: xor cl, cl
0xdb71b3: jmp 0x140db71b7
0xdb71b5: mov cl, 1
0xdb71b7: movzx eax, byte ptr [r12 + 0x1ea]
0xdb71c0: btr eax, 4
0xdb71c4: mov byte ptr [r12 + 0x1ea], al
0xdb71cc: lea rax, [r12 + 0x1e8]
0xdb71d4: cmp byte ptr [rax], 0
0xdb71d7: jne 0x140db71e9
0xdb71d9: inc r14d
0xdb71dc: inc rax
0xdb71df: cmp r14d, 3
0xdb71e3: jb 0x140db71d4
0xdb71e5: xor al, al
0xdb71e7: jmp 0x140db71eb
0xdb71e9: mov al, 1
0xdb71eb: cmp cl, al
0xdb71ed: je 0x140db7202
0xdb71ef: mov rdx, qword ptr [r12]
0xdb71f3: mov rcx, r12
0xdb71f6: test al, al
0xdb71f8: je 0x140db71ff
0xdb71fa: call qword ptr [rdx + 0x28]
0xdb71fd: jmp 0x140db7202
0xdb71ff: call qword ptr [rdx + 0x20]
0xdb7202: mov byte ptr [rsi + 0xace], 1
0xdb7209: lea rsi, [rip + 0x496ec38]
0xdb7210: mov qword ptr [rbp + 0x50], rsi
0xdb7214: lea rcx, [rbp + 0x50]
0xdb7218: call 0x141434880
0xdb721d: nop 
0xdb721e: lea rcx, [rbp + 8]
0xdb7222: call 0x140394db0
0xdb7227: nop 
0xdb7228: lea rcx, [rbp]
0xdb722c: call 0x140394db0
0xdb7231: vmovaps xmm6, xmmword ptr [rsp + 0x4a0]
0xdb723a: add rsp, 0x4b8
0xdb7241: pop r15
0xdb7243: pop r14
0xdb7245: pop r13
0xdb7247: pop r12
0xdb7249: pop rdi
0xdb724a: pop rsi
0xdb724b: pop rbx
0xdb724c: pop rbp
0xdb724d: ret 
CALLEE 0x3d3080
0x3d3080: push rbx
0x3d3082: push rbp
0x3d3083: sub rsp, 0x28
0x3d3087: mov ebp, edx
0x3d3089: mov rbx, rcx
0x3d308c: cmp edx, dword ptr [rcx + 0xc]
0x3d308f: ja 0x1403d309a
0x3d3091: xor al, al
0x3d3093: add rsp, 0x28
0x3d3097: pop rbp
0x3d3098: pop rbx
0x3d3099: ret 
0x3d309a: mov rax, qword ptr gs:[0x58]
0x3d30a3: lea ecx, [rdx*8]
0x3d30aa: mov qword ptr [rsp + 0x40], rsi
0x3d30af: mov edx, 8
CALLEE 0x3d2f610
0x3d2f610: push rbx
0x3d2f612: push rsi
0x3d2f613: push rdi
0x3d2f614: sub rsp, 0x30
0x3d2f618: mov rdi, rdx
0x3d2f61b: mov rax, qword ptr [rdx]
0x3d2f61e: mov rdx, qword ptr [rax + 0xa0]
0x3d2f625: xor ebx, ebx
0x3d2f627: test rdx, rdx
0x3d2f62a: jne 0x143d2f630
0x3d2f62c: mov edx, ebx
0x3d2f62e: jmp 0x143d2f633
0x3d2f630: mov rdx, qword ptr [rdx]
0x3d2f633: xor r8d, r8d
0x3d2f636: mov rdx, qword ptr [rdx]
0x3d2f639: call 0x143d2cb50
0x3d2f63e: mov rsi, rax
0x3d2f641: mov rdx, qword ptr [rdi]
0x3d2f644: mov rcx, qword ptr [rdx + 0xa0]
0x3d2f64b: test rcx, rcx
0x3d2f64e: je 0x143d2f653
0x3d2f650: mov rbx, qword ptr [rcx]
0x3d2f653: mov eax, dword ptr [rbx + 8]
0x3d2f656: mov dword ptr [rsp + 0x60], eax
0x3d2f65a: mov eax, dword ptr [rbx + 0xc]
0x3d2f65d: mov dword ptr [rsp + 0x58], eax
0x3d2f661: mov rcx, rdx
0x3d2f664: call 0x143edee50
0x3d2f669: mov rcx, qword ptr [rdi]
0x3d2f66c: call 0x143ed59a0
0x3d2f671: mov rax, qword ptr [rdi]
0x3d2f674: and byte ptr [rax + 0x98], 0xfd
0x3d2f67b: mov r8b, 1
0x3d2f67e: mov rdx, qword ptr [rsi]
0x3d2f681: lea rcx, [rsp + 0x20]
0x3d2f686: call 0x140393650
0x3d2f68b: nop 
0x3d2f68c: xor r9d, r9d
0x3d2f68f: lea r8, [rsp + 0x58]
0x3d2f694: lea rdx, [rsp + 0x60]
0x3d2f699: mov rcx, rsi
0x3d2f69c: call 0x143d2c120
0x3d2f6a1: mov rdx, rdi
0x3d2f6a4: mov rcx, rax
0x3d2f6a7: call 0x1403d1120
0x3d2f6ac: nop 
0x3d2f6ad: mov rbx, qword ptr [rsp + 0x20]
0x3d2f6b2: mov rax, qword ptr [rbx]
0x3d2f6b5: xor edx, edx
0x3d2f6b7: mov rcx, rbx
0x3d2f6ba: call qword ptr [rax + 0x20]
0x3d2f6bd: cmp byte ptr [rsp + 0x28], 1
0x3d2f6c2: jne 0x143d2f6f2
0x3d2f6c4: mov eax, 0xffffffff
0x3d2f6c9: lock xadd dword ptr [rbx + 8], eax
0x3d2f6ce: cmp eax, 1
0x3d2f6d1: jne 0x143d2f6e5
0x3d2f6d3: test dword ptr [rbx + 0xc], 0x40000000
0x3d2f6da: je 0x143d2f6f2
0x3d2f6dc: mov rax, qword ptr [rbx]
0x3d2f6df: mov rcx, rbx
0x3d2f6e2: call qword ptr [rax + 0x40]
0x3d2f6e5: test dword ptr [rbx + 0xc], 0x40000000
0x3d2f6ec: je 0x143d2f6f2
0x3d2f6ee: lock dec dword ptr [rbx + 0xc]
0x3d2f6f2: add rsp, 0x30
0x3d2f6f6: pop rdi
0x3d2f6f7: pop rsi
0x3d2f6f8: pop rbx
0x3d2f6f9: ret 
