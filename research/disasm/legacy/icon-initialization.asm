0xd8a970: mov byte ptr [rsp + 0x18], r8b
0xd8a975: mov qword ptr [rsp + 0x10], rdx
0xd8a97a: push rbp
0xd8a97b: push rbx
0xd8a97c: push rsi
0xd8a97d: push rdi
0xd8a97e: push r12
0xd8a980: push r13
0xd8a982: push r14
0xd8a984: push r15
0xd8a986: mov rbp, rsp
0xd8a989: sub rsp, 0x78
0xd8a98d: mov rbx, rdx
0xd8a990: mov rdi, rcx
0xd8a993: lea rdx, [rcx + 0x1f8]
0xd8a99a: lea r8, [rip + 0x5f457af]
0xd8a9a1: call 0x140d8c4c0
0xd8a9a6: lea rdx, [rdi + 0x20c]
0xd8a9ad: lea r8, [rip + 0x5f457a0]
0xd8a9b4: mov rcx, rdi
0xd8a9b7: call 0x140d8c4c0
0xd8a9bc: lea rdx, [rdi + 0x220]
0xd8a9c3: lea r8, [rip + 0x5f4578e]
0xd8a9ca: mov rcx, rdi
0xd8a9cd: call 0x140d8c4c0
0xd8a9d2: mov r14, qword ptr [rdi + 8]
0xd8a9d6: lea rsi, [rdi + 0xde]
0xd8a9dd: movzx eax, word ptr [rbx]
0xd8a9e0: mov word ptr [rsi], ax
0xd8a9e3: movzx eax, byte ptr [rbx + 0x10]
0xd8a9e7: mov byte ptr [rdi + 0xd0], al
0xd8a9ed: mov rax, qword ptr [rbx + 8]
0xd8a9f1: mov qword ptr [rdi + 0xc8], rax
0xd8a9f8: vmovsd xmm0, qword ptr [rbx + 0x1c]
0xd8a9fd: vmovsd qword ptr [rdi + 0xe0], xmm0
0xd8aa05: mov eax, dword ptr [rbx + 0x24]
0xd8aa08: mov dword ptr [rdi + 0xe8], eax
0xd8aa0e: mov rax, qword ptr [rbx + 0x28]
0xd8aa12: mov qword ptr [rdi + 0x110], rax
0xd8aa19: movzx eax, byte ptr [rbx + 0x48]
0xd8aa1d: mov byte ptr [rdi + 0x1ee], al
0xd8aa23: mov edx, dword ptr [rbx + 0x18]
0xd8aa26: mov rcx, rdi
0xd8aa29: call 0x140decc40
0xd8aa2e: mov rcx, rsi
0xd8aa31: call 0x140537250
0xd8aa36: mov rcx, qword ptr [rax + 0x68]
0xd8aa3a: mov rax, qword ptr [rcx]
0xd8aa3d: xor edx, edx
0xd8aa3f: call qword ptr [rax + 8]
0xd8aa42: mov rdx, rax
0xd8aa45: mov rcx, qword ptr [rdi + 8]
0xd8aa49: call 0x143edd490
0xd8aa4e: mov rcx, rsi
0xd8aa51: call 0x140537250
0xd8aa56: mov rcx, qword ptr [rax + 0x38]
0xd8aa5a: mov rax, qword ptr [rcx]
0xd8aa5d: xor edx, edx
0xd8aa5f: call qword ptr [rax + 8]
0xd8aa62: lea rcx, [rdi + 0x238]
0xd8aa69: mov rdx, rax
0xd8aa6c: call 0x1403d5f80
0xd8aa71: mov rcx, rsi
0xd8aa74: call 0x140537250
0xd8aa79: movzx ecx, byte ptr [rax + 0x60]
0xd8aa7d: mov byte ptr [rdi + 0x2b8], cl
0xd8aa83: mov rcx, rsi
0xd8aa86: call 0x140537250
0xd8aa8b: movzx ecx, byte ptr [rax + 0x62]
0xd8aa8f: mov byte ptr [rdi + 0x1d4], cl
0xd8aa95: mov rax, qword ptr [rdi + 0x118]
0xd8aa9c: test rax, rax
0xd8aa9f: jne 0x140d8aac0
0xd8aaa1: lea rdx, [rip + 0x48dfbf8]
0xd8aaa8: mov rcx, r14
0xd8aaab: call 0x143ed64e0
0xd8aab0: mov qword ptr [rdi + 0x118], rax
0xd8aab7: test rax, rax
0xd8aaba: je 0x140d8afdb
0xd8aac0: mov rbx, qword ptr [r14 + 0xa0]
0xd8aac7: test rbx, rbx
0xd8aaca: je 0x140d8aad3
0xd8aacc: cmp qword ptr [rbx + 8], 0
0xd8aad1: jne 0x140d8ab33
0xd8aad3: mov rcx, qword ptr [r14 + 0xe0]
0xd8aada: test rcx, rcx
0xd8aadd: je 0x140d8aaf0
0xd8aadf: lea rdx, [rip + 0x5f455c6]
0xd8aae6: call 0x1404743a0
0xd8aaeb: test rax, rax
0xd8aaee: jne 0x140d8ab0f
0xd8aaf0: test rbx, rbx
0xd8aaf3: je 0x140d8ab33
0xd8aaf5: mov rcx, qword ptr [rbx + 0x68]
0xd8aaf9: test rcx, rcx
0xd8aafc: je 0x140d8ab33
0xd8aafe: lea rdx, [rip + 0x5f455a7]
0xd8ab05: call 0x1404743a0
0xd8ab0a: test rax, rax
0xd8ab0d: je 0x140d8ab33
0xd8ab0f: mov rax, qword ptr [rax]
0xd8ab12: mov rcx, qword ptr [rax]
0xd8ab15: test rcx, rcx
0xd8ab18: je 0x140d8ab33
0xd8ab1a: cmp byte ptr [rcx], 0
0xd8ab1d: je 0x140d8ab33
0xd8ab1f: lea rdx, [rdi + 0x104]
0xd8ab26: call 0x141424450
0xd8ab2b: test al, al
0xd8ab2d: je 0x140d8afdb
0xd8ab33: lea r8, [rdi + 0x180]
0xd8ab3a: lea rbx, [rip + 0x47e896b]
0xd8ab41: mov qword ptr [rsp + 0x20], rbx
0xd8ab46: lea r9, [rip + 0x5f45517]
0xd8ab4d: lea rdx, [rbp + 0x48]
0xd8ab51: mov rcx, rdi
0xd8ab54: call 0x14064ce00
0xd8ab59: lea r8, [rdi + 0x188]
0xd8ab60: mov qword ptr [rsp + 0x20], rbx
0xd8ab65: lea r9, [rip + 0x5f454fc]
0xd8ab6c: lea rdx, [rbp + 0x48]
0xd8ab70: mov rcx, rdi
0xd8ab73: call 0x14064ce00
0xd8ab78: lea r8, [rdi + 0x120]
0xd8ab7f: mov qword ptr [rsp + 0x20], rbx
0xd8ab84: lea r9, [rip + 0x5f454e5]
0xd8ab8b: lea rdx, [rbp + 0x48]
0xd8ab8f: mov rcx, rdi
0xd8ab92: call 0x140cb7a70
0xd8ab97: mov qword ptr [rsp + 0x20], rbx
0xd8ab9c: lea r9, [rip + 0x5f454d5]
0xd8aba3: lea r8, [rdi + 0x128]
0xd8abaa: lea rdx, [rbp + 0x48]
0xd8abae: mov rcx, rdi
0xd8abb1: call 0x140cb7a70
0xd8abb6: lea r8, [rdi + 0x260]
0xd8abbd: mov qword ptr [rsp + 0x20], rbx
0xd8abc2: lea r9, [rip + 0x5f455a7]
0xd8abc9: lea rdx, [rbp + 0x48]
0xd8abcd: mov rcx, rdi
0xd8abd0: call 0x140cb7a70
0xd8abd5: mov qword ptr [rsp + 0x20], rbx
0xd8abda: lea r9, [rip + 0x5f45593]
0xd8abe1: lea r8, [rdi + 0x268]
0xd8abe8: lea rdx, [rbp + 0x48]
0xd8abec: mov rcx, rdi
0xd8abef: call 0x140cb7a70
0xd8abf4: mov qword ptr [rsp + 0x20], rbx
0xd8abf9: lea r9, [rip + 0x5f45578]
0xd8ac00: lea r8, [rdi + 0x270]
0xd8ac07: lea rdx, [rbp + 0x48]
0xd8ac0b: mov rcx, rdi
0xd8ac0e: call 0x140cb7a70
0xd8ac13: lea r8, [rdi + 0x278]
0xd8ac1a: mov qword ptr [rsp + 0x20], rbx
0xd8ac1f: lea r9, [rip + 0x5f45556]
0xd8ac26: lea rdx, [rbp + 0x48]
0xd8ac2a: mov rcx, rdi
0xd8ac2d: call 0x140cb7a70
0xd8ac32: lea r8, [rdi + 0x248]
0xd8ac39: lea r9, [rip + 0x5f45524]
0xd8ac40: lea rdx, [rbp + 0x48]
0xd8ac44: mov rcx, rdi
0xd8ac47: call 0x140de5d50
0xd8ac4c: lea r8, [rdi + 0x190]
0xd8ac53: mov qword ptr [rsp + 0x20], rbx
0xd8ac58: lea r9, [rip + 0x5f4540d]
0xd8ac5f: lea rdx, [rbp + 0x48]
0xd8ac63: mov rcx, rdi
0xd8ac66: call 0x140cb7a70
0xd8ac6b: lea r8, [rdi + 0x198]
0xd8ac72: mov qword ptr [rsp + 0x20], rbx
0xd8ac77: lea r9, [rip + 0x5f453fe]
0xd8ac7e: lea rdx, [rbp + 0x48]
0xd8ac82: mov rcx, rdi
0xd8ac85: call 0x140cb7a70
0xd8ac8a: cmp dword ptr [rdi + 0x1c0], 0
0xd8ac91: je 0x140d8acbc
0xd8ac93: lea r8, [rdi + 0x1b0]
0xd8ac9a: mov qword ptr [rsp + 0x20], rbx
0xd8ac9f: lea r9, [rip + 0x5f45402]
0xd8aca6: lea rdx, [rbp + 0x48]
0xd8acaa: mov rcx, rdi
0xd8acad: call 0x140cb7860
0xd8acb2: cmp dword ptr [rbp + 0x48], 0
0xd8acb6: jne 0x140d8afdb
0xd8acbc: lea rax, [rip + 0x47e87e9]
0xd8acc3: mov qword ptr [rsp + 0x20], rax
0xd8acc8: lea r9, [rip + 0x5f453b1]
0xd8accf: lea r8, [rdi + 0x148]
0xd8acd6: lea rdx, [rbp + 0x48]
0xd8acda: mov rcx, rdi
0xd8acdd: call 0x14064ce00
0xd8ace2: cmp qword ptr [rdi + 0x148], 0
0xd8acea: je 0x140d8adba
0xd8acf0: lea r8, [rdi + 0x150]
0xd8acf7: lea rbx, [rip + 0x47e87ae]
0xd8acfe: mov qword ptr [rsp + 0x20], rbx
0xd8ad03: lea r9, [rip + 0x5f4537a]
0xd8ad0a: lea rdx, [rbp + 0x48]
0xd8ad0e: mov rcx, rdi
0xd8ad11: call 0x14064ce00
0xd8ad16: cmp dword ptr [rbp + 0x48], 0
0xd8ad1a: jne 0x140d8afdb
0xd8ad20: lea r8, [rdi + 0x130]
0xd8ad27: mov qword ptr [rsp + 0x20], rbx
0xd8ad2c: lea r9, [rip + 0x5f45341]
0xd8ad33: lea rdx, [rbp + 0x48]
0xd8ad37: mov rcx, rdi
0xd8ad3a: call 0x140cb7a70
0xd8ad3f: cmp dword ptr [rbp + 0x48], 0
0xd8ad43: jne 0x140d8afdb
0xd8ad49: lea r8, [rdi + 0x138]
0xd8ad50: mov qword ptr [rsp + 0x20], rbx
0xd8ad55: lea r9, [rip + 0x5f4532c]
0xd8ad5c: lea rdx, [rbp + 0x48]
0xd8ad60: mov rcx, rdi
0xd8ad63: call 0x140cb7a70
0xd8ad68: cmp dword ptr [rbp + 0x48], 0
0xd8ad6c: jne 0x140d8afdb
0xd8ad72: lea r8, [rdi + 0x158]
0xd8ad79: mov qword ptr [rsp + 0x20], rbx
0xd8ad7e: lea r9, [rip + 0x5f45307]
0xd8ad85: lea rdx, [rbp + 0x48]
0xd8ad89: mov rcx, rdi
0xd8ad8c: call 0x14064ce00
0xd8ad91: cmp dword ptr [rbp + 0x48], 0
0xd8ad95: jne 0x140d8afdb
0xd8ad9b: lea r8, [rdi + 0x250]
0xd8ada2: mov qword ptr [rsp + 0x20], rbx
0xd8ada7: lea r9, [rip + 0x5f453ba]
0xd8adae: lea rdx, [rbp + 0x48]
0xd8adb2: mov rcx, rdi
0xd8adb5: call 0x14064ce00
0xd8adba: lea rax, [rip + 0x47e86eb]
0xd8adc1: mov qword ptr [rsp + 0x20], rax
0xd8adc6: lea r9, [rip + 0x5f452c3]
0xd8adcd: lea r8, [rdi + 0x160]
0xd8add4: lea rdx, [rbp + 0x48]
0xd8add8: mov rcx, rdi
0xd8addb: call 0x14064ce00
0xd8ade0: cmp qword ptr [rdi + 0x160], 0
0xd8ade8: je 0x140d8ae1a
0xd8adea: lea r8, [rdi + 0x168]
0xd8adf1: lea rax, [rip + 0x47e86b4]
0xd8adf8: mov qword ptr [rsp + 0x20], rax
0xd8adfd: lea r9, [rip + 0x5f45290]
0xd8ae04: lea rdx, [rbp + 0x48]
0xd8ae08: mov rcx, rdi
0xd8ae0b: call 0x140cb7a70
0xd8ae10: cmp dword ptr [rbp + 0x48], 0
0xd8ae14: jne 0x140d8afdb
0xd8ae1a: lea rax, [rip + 0x47e868b]
0xd8ae21: mov qword ptr [rsp + 0x20], rax
0xd8ae26: lea r9, [rip + 0x5f4526b]
0xd8ae2d: lea r8, [rdi + 0x170]
0xd8ae34: lea rdx, [rbp + 0x48]
0xd8ae38: mov rcx, rdi
0xd8ae3b: call 0x14064ce00
0xd8ae40: lea rbx, [rip + 0x47e8665]
0xd8ae47: cmp qword ptr [rdi + 0x170], 0
0xd8ae4f: je 0x140d8ae7a
0xd8ae51: lea r8, [rdi + 0x178]
0xd8ae58: mov qword ptr [rsp + 0x20], rbx
0xd8ae5d: lea r9, [rip + 0x5f45238]
0xd8ae64: lea rdx, [rbp + 0x48]
0xd8ae68: mov rcx, rdi
0xd8ae6b: call 0x140cb7a70
0xd8ae70: cmp dword ptr [rbp + 0x48], 0
0xd8ae74: jne 0x140d8afdb
0xd8ae7a: mov rcx, rsi
0xd8ae7d: call 0x140537250
0xd8ae82: cmp byte ptr [rax + 0xab], 0
0xd8ae89: jne 0x140d8aea0
0xd8ae8b: mov rcx, rsi
0xd8ae8e: call 0x140537250
0xd8ae93: cmp byte ptr [rax + 0xaf], 0
0xd8ae9a: je 0x140d8af3c
0xd8aea0: mov rcx, rsi
0xd8aea3: call 0x140537250
0xd8aea8: cmp dword ptr [rax + 0x2c], 0x16
0xd8aeac: je 0x140d8af3c
0xd8aeb2: mov rcx, rsi
0xd8aeb5: call 0x140537250
0xd8aeba: cmp dword ptr [rax + 0x2c], 0x59
0xd8aebe: je 0x140d8af3c
0xd8aec0: mov rcx, rsi
0xd8aec3: call 0x140537250
0xd8aec8: cmp dword ptr [rax + 0x2c], 0x19
0xd8aecc: je 0x140d8af3c
0xd8aece: mov rcx, rsi
0xd8aed1: call 0x140537250
0xd8aed6: cmp dword ptr [rax + 0x2c], 0x1a
0xd8aeda: je 0x140d8af3c
0xd8aedc: mov rcx, rsi
0xd8aedf: call 0x140537250
0xd8aee4: cmp dword ptr [rax + 0x2c], 0x68
0xd8aee8: je 0x140d8af3c
0xd8aeea: lea r8, [rdi + 0x1a0]
0xd8aef1: mov qword ptr [rsp + 0x20], rbx
0xd8aef6: lea r9, [rip + 0x5f451a7]
0xd8aefd: lea rdx, [rbp + 0x48]
0xd8af01: mov rcx, rdi
0xd8af04: call 0x14064ce00
0xd8af09: cmp dword ptr [rbp + 0x48], 0
0xd8af0d: jne 0x140d8afdb
0xd8af13: lea r8, [rdi + 0x1a8]
0xd8af1a: mov qword ptr [rsp + 0x20], rbx
0xd8af1f: lea r9, [rip + 0x5f4517a]
0xd8af26: lea rdx, [rbp + 0x48]
0xd8af2a: mov rcx, rdi
0xd8af2d: call 0x14064ce00
0xd8af32: cmp dword ptr [rbp + 0x48], 0
0xd8af36: jne 0x140d8afdb
0xd8af3c: mov rcx, rsi
0xd8af3f: call 0x140537250
0xd8af44: mov ecx, dword ptr [rax + 0x2c]
0xd8af47: add ecx, -0x16
0xd8af4a: cmp ecx, 0x47
0xd8af4d: ja 0x140d8b146
0xd8af53: lea rdx, [rip - 0xd8af5a]
0xd8af5a: movzx eax, byte ptr [rdx + rcx + 0xd8b990]
0xd8af62: mov ecx, dword ptr [rdx + rax*4 + 0xd8b980]
0xd8af69: add rcx, rdx
0xd8af6c: jmp rcx
0xd8af6e: mov rbx, qword ptr [rdi + 0x118]
0xd8af75: mov rax, qword ptr [rbx + 0xa0]
0xd8af7c: test rax, rax
0xd8af7f: je 0x140d8af88
0xd8af81: cmp qword ptr [rax + 8], 0
0xd8af86: jne 0x140d8afdb
0xd8af88: mov rbx, qword ptr [rbx + 0xd8]
0xd8af8f: test rbx, rbx
0xd8af92: jne 0x140d8afaf
0xd8af94: test rax, rax
0xd8af97: je 0x140d8afdb
0xd8af99: mov rcx, qword ptr [rax + 0x58]
0xd8af9d: test rcx, rcx
0xd8afa0: je 0x140d8afdb
0xd8afa2: call 0x143ed84d0
0xd8afa7: mov rbx, rax
0xd8afaa: test rax, rax
0xd8afad: je 0x140d8afdb
0xd8afaf: mov rcx, qword ptr [rbx]
0xd8afb2: mov r8, qword ptr [rcx + 0x190]
0xd8afb9: lea rdx, [rip + 0x5f46904]
0xd8afc0: mov rcx, rbx
0xd8afc3: call r8
0xd8afc6: test al, al
0xd8afc8: mov r13d, 0
0xd8afce: cmove rbx, r13
0xd8afd2: test rbx, rbx
0xd8afd5: jne 0x140d8b149
0xd8afdb: xor al, al
0xd8afdd: add rsp, 0x78
0xd8afe1: pop r15
0xd8afe3: pop r14
0xd8afe5: pop r13
0xd8afe7: pop r12
0xd8afe9: pop rdi
0xd8afea: pop rsi
0xd8afeb: pop rbx
0xd8afec: pop rbp
0xd8afed: ret 
0xd8afee: mov rbx, qword ptr [rdi + 0x118]
0xd8aff5: mov rax, qword ptr [rbx + 0xa0]
0xd8affc: test rax, rax
0xd8afff: je 0x140d8b008
0xd8b001: cmp qword ptr [rax + 8], 0
0xd8b006: jne 0x140d8afdb
0xd8b008: mov rbx, qword ptr [rbx + 0xd8]
0xd8b00f: test rbx, rbx
0xd8b012: jne 0x140d8b02f
0xd8b014: test rax, rax
0xd8b017: je 0x140d8afdb
0xd8b019: mov rcx, qword ptr [rax + 0x58]
0xd8b01d: test rcx, rcx
0xd8b020: je 0x140d8afdb
0xd8b022: call 0x143ed84d0
0xd8b027: mov rbx, rax
0xd8b02a: test rax, rax
0xd8b02d: je 0x140d8afdb
0xd8b02f: mov rcx, qword ptr [rbx]
0xd8b032: mov r8, qword ptr [rcx + 0x190]
0xd8b039: lea rdx, [rip + 0x5f11160]
0xd8b040: mov rcx, rbx
0xd8b043: call r8
0xd8b046: test al, al
0xd8b048: mov r13d, 0
0xd8b04e: cmove rbx, r13
0xd8b052: test rbx, rbx
0xd8b055: je 0x140d8afdb
0xd8b057: cmp qword ptr [rdi + 0x180], r13
0xd8b05e: je 0x140d8afdb
0xd8b064: mov rcx, rsi
0xd8b067: call 0x140537250
0xd8b06c: cmp dword ptr [rax + 0x2c], 0x17
0xd8b070: jne 0x140d8b149
0xd8b076: cmp qword ptr [rdi + 0x188], r13
0xd8b07d: je 0x140d8afdb
0xd8b083: jmp 0x140d8b149
0xd8b088: mov rcx, rsi
0xd8b08b: call 0x140537250
0xd8b090: cmp dword ptr [rax + 0x2c], 0x4a
0xd8b094: jne 0x140d8b0c3
0xd8b096: mov rax, qword ptr [rdi]
0xd8b099: lea rdx, [rip + 0x5f4502c]
0xd8b0a0: mov rcx, rdi
0xd8b0a3: call qword ptr [rax + 0x190]
0xd8b0a9: mov rcx, rdi
0xd8b0ac: test al, al
0xd8b0ae: mov r13d, 0
0xd8b0b4: cmove rcx, r13
0xd8b0b8: test rcx, rcx
0xd8b0bb: je 0x140d8afdb
0xd8b0c1: jmp 0x140d8b128
0xd8b0c3: mov rcx, rsi
0xd8b0c6: call 0x140537250
0xd8b0cb: cmp dword ptr [rax + 0x2c], 0x4c
0xd8b0cf: je 0x140d8b0df
0xd8b0d1: mov rcx, rsi
0xd8b0d4: call 0x140537250
0xd8b0d9: cmp dword ptr [rax + 0x2c], 0x52
0xd8b0dd: jne 0x140d8b125
0xd8b0df: cmp qword ptr [rdi + 0x128], 0
0xd8b0e7: je 0x140d8afdb
0xd8b0ed: mov rcx, rsi
0xd8b0f0: call 0x140537250
0xd8b0f5: cmp dword ptr [rax + 0x2c], 0x52
0xd8b0f9: jne 0x140d8b125
0xd8b0fb: cmp qword ptr [rdi + 0x268], 0
0xd8b103: je 0x140d8afdb
0xd8b109: cmp qword ptr [rdi + 0x270], 0
0xd8b111: je 0x140d8afdb
0xd8b117: cmp qword ptr [rdi + 0x278], 0
0xd8b11f: je 0x140d8afdb
0xd8b125: xor r13d, r13d
0xd8b128: mov rcx, rsi
0xd8b12b: call 0x140537250
0xd8b130: cmp dword ptr [rax + 0x2c], 0x4f
0xd8b134: jne 0x140d8b149
0xd8b136: cmp qword ptr [rdi + 0x248], 0
0xd8b13e: je 0x140d8afdb
0xd8b144: jmp 0x140d8b149
0xd8b146: xor r13d, r13d
0xd8b149: mov rax, qword ptr [rdi + 0x118]
0xd8b150: mov r9, qword ptr [rax + 0x20]
0xd8b154: mov rax, qword ptr [r9]
0xd8b157: mov rcx, qword ptr [rax + 0xa0]
0xd8b15e: test rcx, rcx
0xd8b161: je 0x140d8b16e
0xd8b163: cmp qword ptr [rcx + 8], 0
0xd8b168: je 0x140d8b16e
0xd8b16a: xor al, al
0xd8b16c: jmp 0x140d8b1a1
0xd8b16e: mov r9, qword ptr [r9 + 8]
0xd8b172: mov edx, r13d
0xd8b175: mov r8d, dword ptr [r9 + 8]
0xd8b179: test r8d, r8d
0xd8b17c: je 0x140d8b196
0xd8b17e: mov r9, qword ptr [r9]
0xd8b181: mov eax, dword ptr [rip + 0x5f44ed5]
0xd8b187: mov ecx, edx
0xd8b189: cmp eax, dword ptr [r9 + rcx*4]
0xd8b18d: je 0x140d8b19b
0xd8b18f: inc edx
0xd8b191: cmp edx, r8d
0xd8b194: jb 0x140d8b187
0xd8b196: mov edx, 0xffffffff
0xd8b19b: cmp edx, -1
0xd8b19e: setne al
0xd8b1a1: mov byte ptr [rdi + 0x292], al
0xd8b1a7: mov rcx, qword ptr [rbp + 0x50]
0xd8b1ab: mov rcx, qword ptr [rcx + 0x30]
0xd8b1af: mov qword ptr [rdi + 0x140], rcx
0xd8b1b6: cmp byte ptr [rbp + 0x58], 0
0xd8b1ba: jne 0x140d8b1ca
0xd8b1bc: mov r8d, 0xffffffff
0xd8b1c2: mov rdx, r14
0xd8b1c5: call 0x143ed5b40
0xd8b1ca: mov r12d, 0x1ec
0xd8b1d0: mov rax, qword ptr gs:[0x58]
0xd8b1d9: mov r15, qword ptr [rax]
0xd8b1dc: mov rax, qword ptr [rip + 0x5fde345]
0xd8b1e3: cmp byte ptr [r12 + r15], 0
0xd8b1e8: cmovne rax, qword ptr [rip + 0x5fde340]
0xd8b1f0: mov rax, qword ptr [rax]
0xd8b1f3: mov rcx, qword ptr [rax + 8]
0xd8b1f7: mov rax, qword ptr [rcx + 0x270]
0xd8b1fe: mov rcx, qword ptr [rax + 0x178]
0xd8b205: mov eax, dword ptr [rax + 0x180]
0xd8b20b: lea rdx, [rcx + rax*2]
0xd8b20f: cmp rcx, rdx
0xd8b212: je 0x140d8b225
0xd8b214: movzx eax, word ptr [rsi]
0xd8b217: cmp ax, word ptr [rcx]
0xd8b21a: je 0x140d8b26d
0xd8b21c: add rcx, 2
0xd8b220: cmp rcx, rdx
0xd8b223: jne 0x140d8b217
0xd8b225: mov rbx, qword ptr [r14 + 0x20]
0xd8b229: mov byte ptr [rbp + 0x50], 0
0xd8b22d: mov rcx, rsi
0xd8b230: call 0x140537250
0xd8b235: imul edx, dword ptr [rax + 0x5c], 0x186a0
0xd8b23c: vmovss xmm0, dword ptr [rdi + 0xe8]
0xd8b244: vmulss xmm0, xmm0, dword ptr [rip + 0x4fe7b54]
0xd8b24c: vcvttss2si eax, xmm0
0xd8b250: sub edx, eax
0xd8b252: mov dword ptr [rbp + 0x60], edx
0xd8b255: mov byte ptr [rbp + 0x48], 0x3e
0xd8b259: lea r9, [rbp + 0x50]
0xd8b25d: lea r8, [rbp + 0x60]
0xd8b261: lea rdx, [rbp + 0x48]
0xd8b265: mov rcx, rbx
0xd8b268: call 0x140d4c5c0
0xd8b26d: mov rcx, rdi
0xd8b270: call 0x140d8ba50
0xd8b275: mov rcx, rsi
0xd8b278: call 0x140537250
0xd8b27d: cmp dword ptr [rax + 0x2c], 0x2c
0xd8b281: je 0x140d8b917
0xd8b287: mov rcx, rsi
0xd8b28a: call 0x140537250
0xd8b28f: cmp dword ptr [rax + 0x2c], 0x50
0xd8b293: je 0x140d8b917
0xd8b299: mov rcx, rsi
0xd8b29c: call 0x140537250
0xd8b2a1: cmp dword ptr [rax + 0x2c], 0x67
0xd8b2a5: je 0x140d8b917
0xd8b2ab: mov rcx, rsi
0xd8b2ae: call 0x140537250
0xd8b2b3: cmp dword ptr [rax + 0x2c], 0x4d
0xd8b2b7: je 0x140d8b3db
0xd8b2bd: mov rcx, rsi
0xd8b2c0: call 0x140537250
0xd8b2c5: cmp dword ptr [rax + 0x2c], 0x4e
0xd8b2c9: je 0x140d8b3db
0xd8b2cf: mov rcx, rsi
0xd8b2d2: call 0x140537250
0xd8b2d7: cmp dword ptr [rax + 0x2c], 0x19
0xd8b2db: je 0x140d8b2ef
0xd8b2dd: mov rcx, rsi
0xd8b2e0: call 0x140537250
0xd8b2e5: cmp dword ptr [rax + 0x2c], 0x1a
0xd8b2e9: jne 0x140d8b91e
0xd8b2ef: mov eax, dword ptr [rdi + 0xc8]
0xd8b2f5: mov dword ptr [rbp + 0x50], eax
0xd8b2f8: cmp eax, -1
0xd8b2fb: je 0x140d8b91e
0xd8b301: lea rcx, [rbp + 0x50]
0xd8b305: call 0x140473f20
0xd8b30a: mov r15d, 0xffff
0xd8b310: cmp word ptr [rax + 0x396], r15w
0xd8b318: jne 0x140d8b3b4
0xd8b31e: lea rcx, [rbp + 0x50]
0xd8b322: call 0x140473f20
0xd8b327: cmp word ptr [rax + 0x368], r15w
0xd8b32f: je 0x140d8b91e
0xd8b335: lea rcx, [rbp + 0x50]
0xd8b339: call 0x140473f20
0xd8b33e: lea rcx, [rax + 0x368]
0xd8b345: call 0x140389570
0xd8b34a: cmp word ptr [rax + 0x6c], r15w
0xd8b34f: je 0x140d8b91e
0xd8b355: lea rcx, [rbp + 0x50]
0xd8b359: call 0x140473f20
0xd8b35e: lea rcx, [rax + 0x368]
0xd8b365: call 0x140389570
0xd8b36a: movzx ecx, word ptr [rax + 0x6c]
0xd8b36e: mov word ptr [rbp + 0x50], cx
0xd8b372: lea rcx, [rbp + 0x50]
0xd8b376: call 0x140670050
0xd8b37b: test dword ptr [rax + 0x1c], 0x200
0xd8b382: jne 0x140d8b3b4
0xd8b384: lea rcx, [rbp + 0x50]
0xd8b388: call 0x140670050
0xd8b38d: cmp word ptr [rax + 0x14], r15w
0xd8b392: je 0x140d8b91e
0xd8b398: lea rcx, [rbp + 0x50]
0xd8b39c: call 0x140670050
0xd8b3a1: lea rcx, [rax + 0x14]
0xd8b3a5: call 0x14066f7b0
0xd8b3aa: cmp byte ptr [rax + 0x30], 1
0xd8b3ae: jne 0x140d8b91e
0xd8b3b4: mov rcx, rsi
0xd8b3b7: call 0x140537250
0xd8b3bc: movzx ecx, byte ptr [rax + 0xa8]
0xd8b3c3: mov eax, 1
0xd8b3c8: shlx eax, eax, ecx
0xd8b3cd: or eax, 0x40
0xd8b3d0: or dword ptr [rdi + 0x2b0], eax
0xd8b3d6: jmp 0x140d8b91e
0xd8b3db: lea rdx, [rbp - 0x28]
0xd8b3df: call 0x14064f4f0
0xd8b3e4: nop 
0xd8b3e5: cmp byte ptr [rbp - 0x18], 0
0xd8b3e9: je 0x140d8b8fe
0xd8b3ef: mov rax, qword ptr [rbp - 0x20]
0xd8b3f3: mov rcx, qword ptr [rax + 0x68]
0xd8b3f7: mov rax, qword ptr [rcx + 0x188]
0xd8b3fe: mov r14, qword ptr [rax + 0x18]
0xd8b402: mov rax, qword ptr [rip + 0x5fde11f]
0xd8b409: cmp byte ptr [r12 + r15], 0
0xd8b40e: cmovne rax, qword ptr [rip + 0x5fde11a]
0xd8b416: mov rax, qword ptr [rax]
0xd8b419: mov rcx, qword ptr [rax + 8]
0xd8b41d: mov r15, qword ptr [rcx + 0x310]
0xd8b424: mov rcx, rsi
0xd8b427: call 0x140537250
0xd8b42c: cmp dword ptr [rax + 0x2c], 0x4d
0xd8b430: jne 0x140d8b4c0
0xd8b436: movzx ebx, word ptr [rdi + 0xc8]
0xd8b43d: lea rdx, [r14 + 8]
0xd8b441: test r14, r14
0xd8b444: cmove rdx, r13
0xd8b448: mov rdx, qword ptr [rdx]
0xd8b44b: lea rcx, [rbp + 0x50]
0xd8b44f: call 0x140393df0
0xd8b454: nop 
0xd8b455: cmp dword ptr [r14 + 0x28], ebx
0xd8b459: jbe 0x140d8b46f
0xd8b45b: imul r15, rbx, 0x1c8
0xd8b462: add r15, qword ptr [r14 + 0x20]
0xd8b466: je 0x140d8b46f
0xd8b468: movzx r15d, word ptr [r15 + 0x18]
0xd8b46d: jmp 0x140d8b475
0xd8b46f: mov r15d, 0xffff
0xd8b475: mov rcx, qword ptr [rbp + 0x50]
0xd8b479: mov rax, qword ptr [rcx]
0xd8b47c: mov dl, 1
0xd8b47e: call qword ptr [rax + 0x20]
0xd8b481: lea r9, [rip + 0x5f44ce4]
0xd8b488: lea r8, [rdi + 0x258]
0xd8b48f: lea rdx, [rbp + 0x50]
0xd8b493: mov rcx, rdi
0xd8b496: call 0x140de5f20
0xd8b49b: cmp dword ptr [rbp + 0x50], 0
0xd8b49f: jne 0x140d8b8fe
0xd8b4a5: mov rax, qword ptr [rdi + 0x258]
0xd8b4ac: mov word ptr [rax + 0x138], r15w
0xd8b4b4: mov word ptr [rax + 0x13a], bx
0xd8b4bb: jmp 0x140d8b8e8
0xd8b4c0: mov rcx, rsi
0xd8b4c3: call 0x140537250
0xd8b4c8: cmp dword ptr [rax + 0x2c], 0x4e
0xd8b4cc: jne 0x140d8b8e8
0xd8b4d2: mov byte ptr [rdi + 0x1d5], 1
0xd8b4d9: lea r8, [rdi + 0x2a8]
0xd8b4e0: lea r12, [rip + 0x47e7fc5]
0xd8b4e7: mov qword ptr [rsp + 0x20], r12
0xd8b4ec: lea r9, [rip + 0x5f44c9d]
0xd8b4f3: lea rdx, [rbp + 0x50]
0xd8b4f7: mov rcx, rdi
0xd8b4fa: call 0x140cb7a70
0xd8b4ff: mov qword ptr [rsp + 0x20], r12
0xd8b504: lea r9, [rip + 0x5f44c81]
0xd8b50b: lea r8, [rdi + 0x2a0]
0xd8b512: lea rdx, [rbp + 0x50]
0xd8b516: mov rcx, rdi
0xd8b519: call 0x140cb7a70
0xd8b51e: mov qword ptr [rsp + 0x20], r12
0xd8b523: lea r9, [rip + 0x5f44c5e]
0xd8b52a: lea r8, [rdi + 0x298]
0xd8b531: lea rdx, [rbp + 0x50]
0xd8b535: mov rcx, rdi
0xd8b538: call 0x140cb7a70
0xd8b53d: cmp qword ptr [rdi + 0x298], 0
0xd8b545: je 0x140d8b8e8
0xd8b54b: cmp qword ptr [rdi + 0x2a0], 0
0xd8b553: je 0x140d8b8e8
0xd8b559: cmp byte ptr [rdi + 0xd0], 5
0xd8b560: jne 0x140d8b8e8
0xd8b566: mov eax, dword ptr [rdi + 0xc8]
0xd8b56c: mov r8d, dword ptr [r15 + 0xf0]
0xd8b573: mov edx, r13d
0xd8b576: test r8d, r8d
0xd8b579: je 0x140d8b591
0xd8b57b: mov r9, qword ptr [r15 + 0xe8]
0xd8b582: mov ecx, edx
0xd8b584: cmp dword ptr [r9 + rcx*8], eax
0xd8b588: je 0x140d8b596
0xd8b58a: inc edx
0xd8b58c: cmp edx, r8d
0xd8b58f: jb 0x140d8b582
0xd8b591: mov edx, 0xffffffff
0xd8b596: mov eax, edx
0xd8b598: mov rbx, qword ptr [r15 + 0xe8]
0xd8b59f: movzx ebx, word ptr [rbx + rax*8 + 4]
0xd8b5a4: mov word ptr [rbp + 0x60], bx
0xd8b5a8: mov r15d, 0xffff
0xd8b5ae: cmp bx, r15w
0xd8b5b2: je 0x140d8b8e8
0xd8b5b8: lea rsi, [r14 + 8]
0xd8b5bc: test r14, r14
0xd8b5bf: cmove rsi, r13
0xd8b5c3: mov rdx, qword ptr [rsi]
0xd8b5c6: lea rcx, [rbp + 0x50]
0xd8b5ca: call 0x140393df0
0xd8b5cf: nop 
0xd8b5d0: cmp dword ptr [r14 + 0x28], ebx
0xd8b5d4: jbe 0x140d8b5f1
0xd8b5d6: imul rdx, rbx, 0x1c8
0xd8b5dd: add rdx, qword ptr [r14 + 0x20]
0xd8b5e1: je 0x140d8b5f1
0xd8b5e3: movzx r13d, word ptr [rdx + 0x18]
0xd8b5e8: mov dword ptr [rbp - 0x38], r13d
0xd8b5ec: xor r13d, r13d
0xd8b5ef: jmp 0x140d8b5f5
0xd8b5f1: mov dword ptr [rbp - 0x38], r15d
0xd8b5f5: mov rcx, qword ptr [rbp + 0x50]
0xd8b5f9: mov rax, qword ptr [rcx]
0xd8b5fc: mov dl, 1
0xd8b5fe: call qword ptr [rax + 0x20]
0xd8b601: mov word ptr [rbp + 0x48], r15w
0xd8b606: mov rdx, qword ptr [rsi]
0xd8b609: lea rcx, [rbp + 0x50]
0xd8b60d: call 0x140393df0
0xd8b612: nop 
0xd8b613: cmp dword ptr [r14 + 0x28], ebx
0xd8b617: jbe 0x140d8b638
0xd8b619: imul rdx, rbx, 0x1c8
0xd8b620: add rdx, qword ptr [r14 + 0x20]
0xd8b624: je 0x140d8b638
0xd8b626: movzx esi, byte ptr [rdx + 0x1c]
0xd8b62a: mov rcx, qword ptr [rbp + 0x50]
0xd8b62e: mov rax, qword ptr [rcx]
0xd8b631: mov dl, 1
0xd8b633: call qword ptr [rax + 0x20]
0xd8b636: jmp 0x140d8b647
0xd8b638: mov rcx, qword ptr [rbp + 0x50]
0xd8b63c: mov rax, qword ptr [rcx]
0xd8b63f: mov dl, 1
0xd8b641: call qword ptr [rax + 0x20]
0xd8b644: mov sil, 3
0xd8b647: test sil, sil
0xd8b64a: sete sil
0xd8b64e: mov byte ptr [rbp + 0x50], sil
0xd8b652: lea rdx, [r14 + 8]
0xd8b656: test r14, r14
0xd8b659: cmove rdx, r13
0xd8b65d: mov rdx, qword ptr [rdx]
0xd8b660: lea rcx, [rbp - 0x30]
0xd8b664: call 0x140393df0
0xd8b669: nop 
0xd8b66a: cmp dword ptr [r14 + 0x28], ebx
0xd8b66e: jbe 0x140d8b69d
0xd8b670: imul rcx, rbx, 0x1c8
0xd8b677: mov rax, qword ptr [r14 + 0x20]
0xd8b67b: add rax, rcx
0xd8b67e: je 0x140d8b69d
0xd8b680: cmp byte ptr [rax + 0x1c], 0
0xd8b684: jne 0x140d8b69d
0xd8b686: mov rax, qword ptr [rax + 0x10]
0xd8b68a: movzx r13d, byte ptr [rax + 6]
0xd8b68f: mov rcx, qword ptr [rbp - 0x30]
0xd8b693: mov rax, qword ptr [rcx]
0xd8b696: mov dl, 1
0xd8b698: call qword ptr [rax + 0x20]
0xd8b69b: jmp 0x140d8b6ac
0xd8b69d: mov rcx, qword ptr [rbp - 0x30]
0xd8b6a1: mov rax, qword ptr [rcx]
0xd8b6a4: mov dl, 1
0xd8b6a6: call qword ptr [rax + 0x20]
0xd8b6a9: mov r13b, 5
0xd8b6ac: lea rcx, [rbp + 0x60]
0xd8b6b0: call 0x140430020
0xd8b6b5: mov r14, qword ptr [rax + 0xa0]
0xd8b6bc: mov eax, dword ptr [rax + 0xa8]
0xd8b6c2: lea r12, [rax + rax*8]
0xd8b6c6: shl r12, 5
0xd8b6ca: add r12, r14
0xd8b6cd: cmp r14, r12
0xd8b6d0: je 0x140d8b8e8
0xd8b6d6: nop word ptr [rax + rax]
0xd8b6e0: mov eax, dword ptr [rdi + 0xc8]
0xd8b6e6: cmp dword ptr [r14 + 0x60], eax
0xd8b6ea: jne 0x140d8b8d8
0xd8b6f0: lea rax, [rbp + 0x48]
0xd8b6f4: mov qword ptr [rsp + 0x30], rax
0xd8b6f9: mov byte ptr [rsp + 0x28], r13b
0xd8b6fe: mov byte ptr [rsp + 0x20], sil
0xd8b703: movzx r9d, bx
0xd8b707: movzx r8d, word ptr [rbp - 0x38]
0xd8b70c: mov rdx, qword ptr [rbp - 0x20]
0xd8b710: mov rcx, r14
0xd8b713: call 0x141786710
0xd8b718: test al, al
0xd8b71a: je 0x140d8b8d8
0xd8b720: mov rax, qword ptr [rdi + 0x298]
0xd8b727: mov rsi, qword ptr [rax + 0x20]
0xd8b72b: mov rax, qword ptr [rsi]
0xd8b72e: mov rax, qword ptr [rax + 0xa0]
0xd8b735: cmp r15w, word ptr [rbp + 0x48]
0xd8b73a: je 0x140d8b819
0xd8b740: test rax, rax
0xd8b743: je 0x140d8b74c
0xd8b745: cmp qword ptr [rax + 8], 0
0xd8b74a: jne 0x140d8b769
0xd8b74c: lea rdx, [rip + 0x5f438c5]
0xd8b753: mov rcx, qword ptr [rsi + 8]
0xd8b757: call 0x1435ca140
0xd8b75c: cmp eax, -1
0xd8b75f: je 0x140d8b769
0xd8b761: mov rcx, rsi
0xd8b764: call 0x1435c66a0
0xd8b769: mov rax, qword ptr [rdi + 0x2a0]
0xd8b770: mov rsi, qword ptr [rax + 0x20]
0xd8b774: mov rax, qword ptr [rsi]
0xd8b777: mov rcx, qword ptr [rax + 0xa0]
0xd8b77e: test rcx, rcx
0xd8b781: je 0x140d8b78a
0xd8b783: cmp qword ptr [rcx + 8], 0
0xd8b788: jne 0x140d8b7b8
0xd8b78a: cmp dword ptr [rip + 0x5f3cab7], 0
0xd8b791: je 0x140d8b7b8
0xd8b793: lea rdx, [rip + 0x5f3caae]
0xd8b79a: mov rcx, qword ptr [rsi + 8]
0xd8b79e: call 0x1435ca0a0
0xd8b7a3: test al, al
0xd8b7a5: je 0x140d8b7b8
0xd8b7a7: mov rcx, qword ptr [rsi + 8]
0xd8b7ab: call 0x1435caec0
0xd8b7b0: mov rcx, rsi
0xd8b7b3: call 0x1435c66a0
0xd8b7b8: mov rsi, qword ptr [rdi + 0x2a8]
0xd8b7bf: test rsi, rsi
0xd8b7c2: je 0x140d8b8d4
0xd8b7c8: mov rsi, qword ptr [rsi + 0x20]
0xd8b7cc: mov rax, qword ptr [rsi]
0xd8b7cf: mov rcx, qword ptr [rax + 0xa0]
0xd8b7d6: test rcx, rcx
0xd8b7d9: je 0x140d8b7e6
0xd8b7db: cmp qword ptr [rcx + 8], 0
0xd8b7e0: jne 0x140d8b8d4
0xd8b7e6: cmp dword ptr [rip + 0x5f3ca5b], 0
0xd8b7ed: je 0x140d8b8d4
0xd8b7f3: lea rdx, [rip + 0x5f3ca4e]
0xd8b7fa: mov rcx, qword ptr [rsi + 8]
0xd8b7fe: call 0x1435ca0a0
0xd8b803: test al, al
0xd8b805: je 0x140d8b8d4
0xd8b80b: mov rcx, qword ptr [rsi + 8]
0xd8b80f: call 0x1435caec0
0xd8b814: jmp 0x140d8b8cc
0xd8b819: test rax, rax
0xd8b81c: je 0x140d8b825
0xd8b81e: cmp qword ptr [rax + 8], 0
0xd8b823: jne 0x140d8b853
0xd8b825: cmp dword ptr [rip + 0x5f437ec], 0
0xd8b82c: je 0x140d8b853
0xd8b82e: lea rdx, [rip + 0x5f437e3]
0xd8b835: mov rcx, qword ptr [rsi + 8]
0xd8b839: call 0x1435ca0a0
0xd8b83e: test al, al
0xd8b840: je 0x140d8b853
0xd8b842: mov rcx, qword ptr [rsi + 8]
0xd8b846: call 0x1435caec0
0xd8b84b: mov rcx, rsi
0xd8b84e: call 0x1435c66a0
0xd8b853: mov rax, qword ptr [rdi + 0x2a0]
0xd8b85a: mov rsi, qword ptr [rax + 0x20]
0xd8b85e: mov rax, qword ptr [rsi]
0xd8b861: mov rcx, qword ptr [rax + 0xa0]
0xd8b868: test rcx, rcx
0xd8b86b: je 0x140d8b874
0xd8b86d: cmp qword ptr [rcx + 8], 0
0xd8b872: jne 0x140d8b891
0xd8b874: lea rdx, [rip + 0x5f3c9cd]
0xd8b87b: mov rcx, qword ptr [rsi + 8]
0xd8b87f: call 0x1435ca140
0xd8b884: cmp eax, -1
0xd8b887: je 0x140d8b891
0xd8b889: mov rcx, rsi
0xd8b88c: call 0x1435c66a0
0xd8b891: mov rsi, qword ptr [rdi + 0x2a8]
0xd8b898: test rsi, rsi
0xd8b89b: je 0x140d8b8d4
0xd8b89d: mov rsi, qword ptr [rsi + 0x20]
0xd8b8a1: mov rax, qword ptr [rsi]
0xd8b8a4: mov rcx, qword ptr [rax + 0xa0]
0xd8b8ab: test rcx, rcx
0xd8b8ae: je 0x140d8b8b7
0xd8b8b0: cmp qword ptr [rcx + 8], 0
0xd8b8b5: jne 0x140d8b8d4
0xd8b8b7: lea rdx, [rip + 0x5f3c98a]
0xd8b8be: mov rcx, qword ptr [rsi + 8]
0xd8b8c2: call 0x1435ca140
0xd8b8c7: cmp eax, -1
0xd8b8ca: je 0x140d8b8d4
0xd8b8cc: mov rcx, rsi
0xd8b8cf: call 0x1435c66a0
0xd8b8d4: movzx esi, byte ptr [rbp + 0x50]
0xd8b8d8: add r14, 0x120
0xd8b8df: cmp r14, r12
0xd8b8e2: jne 0x140d8b6e0
0xd8b8e8: lea rax, [rip + 0x499a559]
0xd8b8ef: mov qword ptr [rbp - 0x28], rax
0xd8b8f3: lea rcx, [rbp - 0x28]
0xd8b8f7: call 0x141434880
0xd8b8fc: jmp 0x140d8b91e
0xd8b8fe: lea rax, [rip + 0x499a543]
0xd8b905: mov qword ptr [rbp - 0x28], rax
0xd8b909: lea rcx, [rbp - 0x28]
0xd8b90d: call 0x141434880
0xd8b912: jmp 0x140d8afdb
0xd8b917: mov byte ptr [rdi + 0x1d5], 1
0xd8b91e: movzx eax, byte ptr [rdi + 0xd0]
0xd8b925: test al, al
0xd8b927: jne 0x140d8b937
0xd8b929: mov eax, dword ptr [rdi + 0xc8]
0xd8b92f: mov dword ptr [rdi + 0x28c], eax
0xd8b935: jmp 0x140d8b961
0xd8b937: cmp al, 1
0xd8b939: jne 0x140d8b94b
0xd8b93b: mov edx, dword ptr [rdi + 0xc8]
0xd8b941: mov rcx, rdi
0xd8b944: call 0x140decca0
0xd8b949: jmp 0x140d8b961
0xd8b94b: cmp al, 0x14
0xd8b94d: je 0x140d8b93b
0xd8b94f: cmp al, 2
0xd8b951: jne 0x140d8b968
0xd8b953: movzx eax, word ptr [rdi + 0xc8]
0xd8b95a: mov word ptr [rdi + 0xdc], ax
0xd8b961: mov byte ptr [rdi + 0x1ed], 1
0xd8b968: movzx eax, byte ptr [rdi + 0x1ea]
0xd8b96f: bts eax, 4
0xd8b973: mov byte ptr [rdi + 0x1ea], al
0xd8b979: mov al, 1
0xd8b97b: jmp 0x140d8afdd
0xd8b980: out dx, al
0xd8b981: scasd eax, dword ptr [rdi]
0xd8b982: fadd dword ptr [rax]
0xd8b984: outsb dx, byte ptr [rsi]
0xd8b985: scasd eax, dword ptr [rdi]
0xd8b986: fadd dword ptr [rax]
0xd8b988: mov byte ptr [rax - 0x4eb9ff28], dh
0xd8b98e: fadd dword ptr [rax]
0xd8b990: add byte ptr [rax], al
0xd8b992: add eax, dword ptr [rbx]
0xd8b994: add eax, dword ptr [rbx]
0xd8b996: add eax, dword ptr [rbx]
0xd8b998: add eax, dword ptr [rbx]
0xd8b99a: add eax, dword ptr [rbx]
0xd8b99c: add eax, dword ptr [rbx]
0xd8b99e: add eax, dword ptr [rbx]
0xd8b9a0: add eax, dword ptr [rbx]
0xd8b9a2: add eax, dword ptr [rbx]
0xd8b9a4: add eax, dword ptr [rbx]
0xd8b9a6: add dword ptr [rbx], eax
0xd8b9a8: add eax, dword ptr [rbx]
0xd8b9aa: add eax, dword ptr [rbx]
0xd8b9ac: add eax, dword ptr [rbx]
0xd8b9ae: add eax, dword ptr [rbx]
0xd8b9b0: add eax, dword ptr [rbx]
0xd8b9b2: add eax, dword ptr [rbx]
0xd8b9b4: add eax, dword ptr [rbx]
0xd8b9b6: add eax, dword ptr [rbx]
0xd8b9b8: add eax, dword ptr [rbx]
0xd8b9ba: add eax, dword ptr [rbx]
0xd8b9bc: add eax, dword ptr [rbx]
0xd8b9be: add eax, dword ptr [rbx]
0xd8b9c0: add eax, dword ptr [rbx]
0xd8b9c2: add eax, dword ptr [rbx]
0xd8b9c4: add al, byte ptr [rbx]
0xd8b9c6: add al, byte ptr [rdx]
0xd8b9c8: add al, byte ptr [rdx]
0xd8b9ca: add eax, dword ptr [rbx]
0xd8b9cc: add al, byte ptr [rdx]
0xd8b9ce: add eax, dword ptr [rbx]
0xd8b9d0: add eax, dword ptr [rbx]
0xd8b9d2: add eax, dword ptr [rbx]
0xd8b9d4: add byte ptr [rax], al
0xd8b9d6: add byte ptr [rax], al
CALLEE 0xd8c4c0
0xd8c4c0: mov qword ptr [rsp + 0x10], rbx
0xd8c4c5: mov qword ptr [rsp + 0x18], rsi
0xd8c4ca: push rbp
0xd8c4cb: push rdi
0xd8c4cc: push r14
0xd8c4ce: lea rbp, [rsp - 0x70]
0xd8c4d3: sub rsp, 0x170
0xd8c4da: mov rax, r8
0xd8c4dd: mov rsi, rdx
0xd8c4e0: mov rdi, rcx
0xd8c4e3: lea rbx, [rip + 0x47e6fc2]
0xd8c4ea: mov r8, rbx
0xd8c4ed: mov rdx, rax
0xd8c4f0: mov rcx, qword ptr [rcx + 8]
0xd8c4f4: call 0x143eda3d0
0xd8c4f9: test rax, rax
0xd8c4fc: je 0x140d8c6c9
0xd8c502: cmp byte ptr [rax], 0
0xd8c505: je 0x140d8c6c9
0xd8c50b: mov qword ptr [rsp + 0x20], rax
0xd8c510: mov rcx, 0xffffffffffffffff
0xd8c517: inc rcx
0xd8c51a: cmp byte ptr [rax + rcx], 0
0xd8c51e: jne 0x140d8c517
0xd8c520: mov dword ptr [rsp + 0x28], ecx
0xd8c524: xor r14d, r14d
0xd8c527: mov qword ptr [rsp + 0x30], r14
0xd8c52c: mov qword ptr [rsp + 0x38], r14
0xd8c531: and byte ptr [rsp + 0x40], 0xfe
0xd8c536: lea rax, [rsp + 0x48]
0xd8c53b: mov qword ptr [rbp + 0x90], rax
0xd8c542: mov qword ptr [rbp + 0x50], r14
0xd8c546: mov qword ptr [rbp + 0x58], 0x105
0xd8c54e: mov dword ptr [rbp + 0x5c], r14d
0xd8c552: mov byte ptr [rsp + 0x48], r14b
0xd8c557: mov dword ptr [rbp + 0x5c], r14d
0xd8c55b: mov byte ptr [rsp + 0x48], r14b
0xd8c560: mov rax, qword ptr [rbp + 0x50]
0xd8c564: test rax, rax
0xd8c567: je 0x140d8c56c
0xd8c569: mov byte ptr [rax], r14b
0xd8c56c: mov qword ptr [rbp + 0x60], r14
0xd8c570: mov dword ptr [rbp + 0x68], r14d
0xd8c574: test ecx, ecx
0xd8c576: je 0x140d8c598
0xd8c578: lea rdx, [rsp + 0x20]
0xd8c57d: lea rcx, [rsp + 0x30]
0xd8c582: call 0x1413eeec0
0xd8c587: lea rdx, [rip + 0x47fff26]
0xd8c58e: lea rcx, [rsp + 0x30]
0xd8c593: call 0x1413eede0
0xd8c598: or byte ptr [rsp + 0x40], 1
0xd8c59d: mov byte ptr [rsi + 0x10], 1
0xd8c5a1: mov rcx, qword ptr [rsp + 0x30]
0xd8c5a6: mov rcx, qword ptr [rcx]
0xd8c5a9: call qword ptr [rip + 0x445faf9]
0xd8c5af: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5b3: vmovss dword ptr [rsi], xmm1
0xd8c5b7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5bc: mov rcx, qword ptr [rcx + 8]
0xd8c5c0: call qword ptr [rip + 0x445fae2]
0xd8c5c6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5ca: vmovss dword ptr [rsi + 4], xmm1
0xd8c5cf: mov rcx, qword ptr [rsp + 0x30]
0xd8c5d4: mov rcx, qword ptr [rcx + 0x10]
0xd8c5d8: call qword ptr [rip + 0x445faca]
0xd8c5de: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5e2: vmovss dword ptr [rsi + 8], xmm1
0xd8c5e7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5ec: mov rcx, qword ptr [rcx + 0x18]
0xd8c5f0: call qword ptr [rip + 0x445fab2]
0xd8c5f6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5fa: vmovss dword ptr [rsi + 0xc], xmm1
0xd8c5ff: mov rcx, qword ptr [rdi + 8]
0xd8c603: mov rdi, qword ptr [rcx + 0xa0]
0xd8c60a: test rdi, rdi
0xd8c60d: je 0x140d8c616
0xd8c60f: cmp qword ptr [rdi + 8], 0
0xd8c614: jne 0x140d8c66c
0xd8c616: mov rcx, qword ptr [rcx + 0xe0]
0xd8c61d: test rcx, rcx
0xd8c620: je 0x140d8c63b
0xd8c622: lea rdx, [rip + 0x5f43b37]
0xd8c629: call 0x1404743a0
0xd8c62e: test rax, rax
0xd8c631: je 0x140d8c63b
0xd8c633: mov rax, qword ptr [rax]
0xd8c636: mov rbx, qword ptr [rax]
0xd8c639: jmp 0x140d8c66c
0xd8c63b: test rdi, rdi
0xd8c63e: je 0x140d8c665
0xd8c640: mov rcx, qword ptr [rdi + 0x68]
0xd8c644: test rcx, rcx
0xd8c647: je 0x140d8c665
0xd8c649: lea rdx, [rip + 0x5f43b10]
0xd8c650: call 0x1404743a0
0xd8c655: test rax, rax
0xd8c658: je 0x140d8c665
0xd8c65a: mov rax, qword ptr [rax]
0xd8c65d: mov rbx, qword ptr [rax]
0xd8c660: test rbx, rbx
0xd8c663: jne 0x140d8c66c
0xd8c665: lea rbx, [rip + 0x47faa74]
0xd8c66c: lea rdx, [rsi + 0x11]
0xd8c670: mov rcx, rbx
0xd8c673: call 0x141423cd0
0xd8c678: nop 
0xd8c679: lea rax, [rsp + 0x48]
0xd8c67e: mov qword ptr [rbp + 0x90], rax
0xd8c685: lea rcx, [rsp + 0x48]
0xd8c68a: call 0x140394170
0xd8c68f: nop 
0xd8c690: mov rcx, qword ptr [rsp + 0x30]
0xd8c695: test rcx, rcx
0xd8c698: je 0x140d8c6bf
0xd8c69a: mov r8d, 0x1fd
0xd8c6a0: mov rax, qword ptr gs:[0x58]
0xd8c6a9: mov rdx, qword ptr [rax]
0xd8c6ac: cmp byte ptr [r8 + rdx], 0
0xd8c6b1: je 0x140d8c6ba
0xd8c6b3: call 0x1447f03bc
0xd8c6b8: jmp 0x140d8c6bf
0xd8c6ba: call 0x1447f02bc
0xd8c6bf: mov qword ptr [rsp + 0x30], r14
0xd8c6c4: mov qword ptr [rsp + 0x38], r14
0xd8c6c9: lea r11, [rsp + 0x170]
0xd8c6d1: mov rbx, qword ptr [r11 + 0x28]
0xd8c6d5: mov rsi, qword ptr [r11 + 0x30]
0xd8c6d9: mov rsp, r11
0xd8c6dc: pop r14
0xd8c6de: pop rdi
0xd8c6df: pop rbp
0xd8c6e0: ret 
CALLEE 0xd8c4c0
0xd8c4c0: mov qword ptr [rsp + 0x10], rbx
0xd8c4c5: mov qword ptr [rsp + 0x18], rsi
0xd8c4ca: push rbp
0xd8c4cb: push rdi
0xd8c4cc: push r14
0xd8c4ce: lea rbp, [rsp - 0x70]
0xd8c4d3: sub rsp, 0x170
0xd8c4da: mov rax, r8
0xd8c4dd: mov rsi, rdx
0xd8c4e0: mov rdi, rcx
0xd8c4e3: lea rbx, [rip + 0x47e6fc2]
0xd8c4ea: mov r8, rbx
0xd8c4ed: mov rdx, rax
0xd8c4f0: mov rcx, qword ptr [rcx + 8]
0xd8c4f4: call 0x143eda3d0
0xd8c4f9: test rax, rax
0xd8c4fc: je 0x140d8c6c9
0xd8c502: cmp byte ptr [rax], 0
0xd8c505: je 0x140d8c6c9
0xd8c50b: mov qword ptr [rsp + 0x20], rax
0xd8c510: mov rcx, 0xffffffffffffffff
0xd8c517: inc rcx
0xd8c51a: cmp byte ptr [rax + rcx], 0
0xd8c51e: jne 0x140d8c517
0xd8c520: mov dword ptr [rsp + 0x28], ecx
0xd8c524: xor r14d, r14d
0xd8c527: mov qword ptr [rsp + 0x30], r14
0xd8c52c: mov qword ptr [rsp + 0x38], r14
0xd8c531: and byte ptr [rsp + 0x40], 0xfe
0xd8c536: lea rax, [rsp + 0x48]
0xd8c53b: mov qword ptr [rbp + 0x90], rax
0xd8c542: mov qword ptr [rbp + 0x50], r14
0xd8c546: mov qword ptr [rbp + 0x58], 0x105
0xd8c54e: mov dword ptr [rbp + 0x5c], r14d
0xd8c552: mov byte ptr [rsp + 0x48], r14b
0xd8c557: mov dword ptr [rbp + 0x5c], r14d
0xd8c55b: mov byte ptr [rsp + 0x48], r14b
0xd8c560: mov rax, qword ptr [rbp + 0x50]
0xd8c564: test rax, rax
0xd8c567: je 0x140d8c56c
0xd8c569: mov byte ptr [rax], r14b
0xd8c56c: mov qword ptr [rbp + 0x60], r14
0xd8c570: mov dword ptr [rbp + 0x68], r14d
0xd8c574: test ecx, ecx
0xd8c576: je 0x140d8c598
0xd8c578: lea rdx, [rsp + 0x20]
0xd8c57d: lea rcx, [rsp + 0x30]
0xd8c582: call 0x1413eeec0
0xd8c587: lea rdx, [rip + 0x47fff26]
0xd8c58e: lea rcx, [rsp + 0x30]
0xd8c593: call 0x1413eede0
0xd8c598: or byte ptr [rsp + 0x40], 1
0xd8c59d: mov byte ptr [rsi + 0x10], 1
0xd8c5a1: mov rcx, qword ptr [rsp + 0x30]
0xd8c5a6: mov rcx, qword ptr [rcx]
0xd8c5a9: call qword ptr [rip + 0x445faf9]
0xd8c5af: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5b3: vmovss dword ptr [rsi], xmm1
0xd8c5b7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5bc: mov rcx, qword ptr [rcx + 8]
0xd8c5c0: call qword ptr [rip + 0x445fae2]
0xd8c5c6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5ca: vmovss dword ptr [rsi + 4], xmm1
0xd8c5cf: mov rcx, qword ptr [rsp + 0x30]
0xd8c5d4: mov rcx, qword ptr [rcx + 0x10]
0xd8c5d8: call qword ptr [rip + 0x445faca]
0xd8c5de: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5e2: vmovss dword ptr [rsi + 8], xmm1
0xd8c5e7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5ec: mov rcx, qword ptr [rcx + 0x18]
0xd8c5f0: call qword ptr [rip + 0x445fab2]
0xd8c5f6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5fa: vmovss dword ptr [rsi + 0xc], xmm1
0xd8c5ff: mov rcx, qword ptr [rdi + 8]
0xd8c603: mov rdi, qword ptr [rcx + 0xa0]
0xd8c60a: test rdi, rdi
0xd8c60d: je 0x140d8c616
0xd8c60f: cmp qword ptr [rdi + 8], 0
0xd8c614: jne 0x140d8c66c
0xd8c616: mov rcx, qword ptr [rcx + 0xe0]
0xd8c61d: test rcx, rcx
0xd8c620: je 0x140d8c63b
0xd8c622: lea rdx, [rip + 0x5f43b37]
0xd8c629: call 0x1404743a0
0xd8c62e: test rax, rax
0xd8c631: je 0x140d8c63b
0xd8c633: mov rax, qword ptr [rax]
0xd8c636: mov rbx, qword ptr [rax]
0xd8c639: jmp 0x140d8c66c
0xd8c63b: test rdi, rdi
0xd8c63e: je 0x140d8c665
0xd8c640: mov rcx, qword ptr [rdi + 0x68]
0xd8c644: test rcx, rcx
0xd8c647: je 0x140d8c665
0xd8c649: lea rdx, [rip + 0x5f43b10]
0xd8c650: call 0x1404743a0
0xd8c655: test rax, rax
0xd8c658: je 0x140d8c665
0xd8c65a: mov rax, qword ptr [rax]
0xd8c65d: mov rbx, qword ptr [rax]
0xd8c660: test rbx, rbx
0xd8c663: jne 0x140d8c66c
0xd8c665: lea rbx, [rip + 0x47faa74]
0xd8c66c: lea rdx, [rsi + 0x11]
0xd8c670: mov rcx, rbx
0xd8c673: call 0x141423cd0
0xd8c678: nop 
0xd8c679: lea rax, [rsp + 0x48]
0xd8c67e: mov qword ptr [rbp + 0x90], rax
0xd8c685: lea rcx, [rsp + 0x48]
0xd8c68a: call 0x140394170
0xd8c68f: nop 
0xd8c690: mov rcx, qword ptr [rsp + 0x30]
0xd8c695: test rcx, rcx
0xd8c698: je 0x140d8c6bf
0xd8c69a: mov r8d, 0x1fd
0xd8c6a0: mov rax, qword ptr gs:[0x58]
0xd8c6a9: mov rdx, qword ptr [rax]
0xd8c6ac: cmp byte ptr [r8 + rdx], 0
0xd8c6b1: je 0x140d8c6ba
0xd8c6b3: call 0x1447f03bc
0xd8c6b8: jmp 0x140d8c6bf
0xd8c6ba: call 0x1447f02bc
0xd8c6bf: mov qword ptr [rsp + 0x30], r14
0xd8c6c4: mov qword ptr [rsp + 0x38], r14
0xd8c6c9: lea r11, [rsp + 0x170]
0xd8c6d1: mov rbx, qword ptr [r11 + 0x28]
0xd8c6d5: mov rsi, qword ptr [r11 + 0x30]
0xd8c6d9: mov rsp, r11
0xd8c6dc: pop r14
0xd8c6de: pop rdi
0xd8c6df: pop rbp
0xd8c6e0: ret 
CALLEE 0xd8c4c0
0xd8c4c0: mov qword ptr [rsp + 0x10], rbx
0xd8c4c5: mov qword ptr [rsp + 0x18], rsi
0xd8c4ca: push rbp
0xd8c4cb: push rdi
0xd8c4cc: push r14
0xd8c4ce: lea rbp, [rsp - 0x70]
0xd8c4d3: sub rsp, 0x170
0xd8c4da: mov rax, r8
0xd8c4dd: mov rsi, rdx
0xd8c4e0: mov rdi, rcx
0xd8c4e3: lea rbx, [rip + 0x47e6fc2]
0xd8c4ea: mov r8, rbx
0xd8c4ed: mov rdx, rax
0xd8c4f0: mov rcx, qword ptr [rcx + 8]
0xd8c4f4: call 0x143eda3d0
0xd8c4f9: test rax, rax
0xd8c4fc: je 0x140d8c6c9
0xd8c502: cmp byte ptr [rax], 0
0xd8c505: je 0x140d8c6c9
0xd8c50b: mov qword ptr [rsp + 0x20], rax
0xd8c510: mov rcx, 0xffffffffffffffff
0xd8c517: inc rcx
0xd8c51a: cmp byte ptr [rax + rcx], 0
0xd8c51e: jne 0x140d8c517
0xd8c520: mov dword ptr [rsp + 0x28], ecx
0xd8c524: xor r14d, r14d
0xd8c527: mov qword ptr [rsp + 0x30], r14
0xd8c52c: mov qword ptr [rsp + 0x38], r14
0xd8c531: and byte ptr [rsp + 0x40], 0xfe
0xd8c536: lea rax, [rsp + 0x48]
0xd8c53b: mov qword ptr [rbp + 0x90], rax
0xd8c542: mov qword ptr [rbp + 0x50], r14
0xd8c546: mov qword ptr [rbp + 0x58], 0x105
0xd8c54e: mov dword ptr [rbp + 0x5c], r14d
0xd8c552: mov byte ptr [rsp + 0x48], r14b
0xd8c557: mov dword ptr [rbp + 0x5c], r14d
0xd8c55b: mov byte ptr [rsp + 0x48], r14b
0xd8c560: mov rax, qword ptr [rbp + 0x50]
0xd8c564: test rax, rax
0xd8c567: je 0x140d8c56c
0xd8c569: mov byte ptr [rax], r14b
0xd8c56c: mov qword ptr [rbp + 0x60], r14
0xd8c570: mov dword ptr [rbp + 0x68], r14d
0xd8c574: test ecx, ecx
0xd8c576: je 0x140d8c598
0xd8c578: lea rdx, [rsp + 0x20]
0xd8c57d: lea rcx, [rsp + 0x30]
0xd8c582: call 0x1413eeec0
0xd8c587: lea rdx, [rip + 0x47fff26]
0xd8c58e: lea rcx, [rsp + 0x30]
0xd8c593: call 0x1413eede0
0xd8c598: or byte ptr [rsp + 0x40], 1
0xd8c59d: mov byte ptr [rsi + 0x10], 1
0xd8c5a1: mov rcx, qword ptr [rsp + 0x30]
0xd8c5a6: mov rcx, qword ptr [rcx]
0xd8c5a9: call qword ptr [rip + 0x445faf9]
0xd8c5af: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5b3: vmovss dword ptr [rsi], xmm1
0xd8c5b7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5bc: mov rcx, qword ptr [rcx + 8]
0xd8c5c0: call qword ptr [rip + 0x445fae2]
0xd8c5c6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5ca: vmovss dword ptr [rsi + 4], xmm1
0xd8c5cf: mov rcx, qword ptr [rsp + 0x30]
0xd8c5d4: mov rcx, qword ptr [rcx + 0x10]
0xd8c5d8: call qword ptr [rip + 0x445faca]
0xd8c5de: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5e2: vmovss dword ptr [rsi + 8], xmm1
0xd8c5e7: mov rcx, qword ptr [rsp + 0x30]
0xd8c5ec: mov rcx, qword ptr [rcx + 0x18]
0xd8c5f0: call qword ptr [rip + 0x445fab2]
0xd8c5f6: vcvtsd2ss xmm1, xmm0, xmm0
0xd8c5fa: vmovss dword ptr [rsi + 0xc], xmm1
0xd8c5ff: mov rcx, qword ptr [rdi + 8]
0xd8c603: mov rdi, qword ptr [rcx + 0xa0]
0xd8c60a: test rdi, rdi
0xd8c60d: je 0x140d8c616
0xd8c60f: cmp qword ptr [rdi + 8], 0
0xd8c614: jne 0x140d8c66c
0xd8c616: mov rcx, qword ptr [rcx + 0xe0]
0xd8c61d: test rcx, rcx
0xd8c620: je 0x140d8c63b
0xd8c622: lea rdx, [rip + 0x5f43b37]
0xd8c629: call 0x1404743a0
0xd8c62e: test rax, rax
0xd8c631: je 0x140d8c63b
0xd8c633: mov rax, qword ptr [rax]
0xd8c636: mov rbx, qword ptr [rax]
0xd8c639: jmp 0x140d8c66c
0xd8c63b: test rdi, rdi
0xd8c63e: je 0x140d8c665
0xd8c640: mov rcx, qword ptr [rdi + 0x68]
0xd8c644: test rcx, rcx
0xd8c647: je 0x140d8c665
0xd8c649: lea rdx, [rip + 0x5f43b10]
0xd8c650: call 0x1404743a0
0xd8c655: test rax, rax
0xd8c658: je 0x140d8c665
0xd8c65a: mov rax, qword ptr [rax]
0xd8c65d: mov rbx, qword ptr [rax]
0xd8c660: test rbx, rbx
0xd8c663: jne 0x140d8c66c
0xd8c665: lea rbx, [rip + 0x47faa74]
0xd8c66c: lea rdx, [rsi + 0x11]
0xd8c670: mov rcx, rbx
0xd8c673: call 0x141423cd0
0xd8c678: nop 
0xd8c679: lea rax, [rsp + 0x48]
0xd8c67e: mov qword ptr [rbp + 0x90], rax
0xd8c685: lea rcx, [rsp + 0x48]
0xd8c68a: call 0x140394170
0xd8c68f: nop 
0xd8c690: mov rcx, qword ptr [rsp + 0x30]
0xd8c695: test rcx, rcx
0xd8c698: je 0x140d8c6bf
0xd8c69a: mov r8d, 0x1fd
0xd8c6a0: mov rax, qword ptr gs:[0x58]
0xd8c6a9: mov rdx, qword ptr [rax]
0xd8c6ac: cmp byte ptr [r8 + rdx], 0
0xd8c6b1: je 0x140d8c6ba
0xd8c6b3: call 0x1447f03bc
0xd8c6b8: jmp 0x140d8c6bf
0xd8c6ba: call 0x1447f02bc
0xd8c6bf: mov qword ptr [rsp + 0x30], r14
0xd8c6c4: mov qword ptr [rsp + 0x38], r14
0xd8c6c9: lea r11, [rsp + 0x170]
0xd8c6d1: mov rbx, qword ptr [r11 + 0x28]
0xd8c6d5: mov rsi, qword ptr [r11 + 0x30]
0xd8c6d9: mov rsp, r11
0xd8c6dc: pop r14
0xd8c6de: pop rdi
0xd8c6df: pop rbp
0xd8c6e0: ret 
CALLEE 0xdecc40
0xdecc40: push rbx
0xdecc42: sub rsp, 0x40
0xdecc46: mov rbx, rcx
0xdecc49: mov dword ptr [rcx + 0x1c0], edx
0xdecc4f: xor eax, eax
0xdecc51: mov qword ptr [rcx + 0x1c8], rax
0xdecc58: mov dword ptr [rcx + 0x1c4], eax
0xdecc5e: test edx, edx
0xdecc60: je 0x140decc99
0xdecc62: mov r8d, edx
0xdecc65: lea rdx, [rsp + 0x20]
0xdecc6a: call 0x14064f570
0xdecc6f: nop 
0xdecc70: cmp byte ptr [rsp + 0x30], 0
0xdecc75: je 0x140decc83
0xdecc77: mov rax, qword ptr [rsp + 0x28]
0xdecc7c: mov qword ptr [rbx + 0x1c8], rax
0xdecc83: lea rax, [rip + 0x49391be]
0xdecc8a: mov qword ptr [rsp + 0x20], rax
0xdecc8f: lea rcx, [rsp + 0x20]
0xdecc94: call 0x141434880
0xdecc99: add rsp, 0x40
0xdecc9d: pop rbx
0xdecc9e: ret 
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
CALLEE 0x3d5f80
0x3d5f80: push rbx
0x3d5f82: push rbp
0x3d5f83: push rsi
0x3d5f84: sub rsp, 0x30
0x3d5f88: mov rsi, qword ptr [rcx]
0x3d5f8b: mov rbp, rdx
0x3d5f8e: mov rbx, rcx
0x3d5f91: cmp rdx, qword ptr [rsi]
0x3d5f94: je 0x1403d606a
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
CALLEE 0x3ed64e0
0x3ed64e0: mov qword ptr [rsp + 0x18], rbx
0x3ed64e5: mov qword ptr [rsp + 0x10], rdx
0x3ed64ea: push rbp
0x3ed64eb: push rsi
0x3ed64ec: push rdi
0x3ed64ed: sub rsp, 0x250
0x3ed64f4: mov rdi, rdx
0x3ed64f7: mov rsi, rcx
0x3ed64fa: mov r10, qword ptr [rcx + 0xa0]
0x3ed6501: test r10, r10
0x3ed6504: je 0x143ed6511
0x3ed6506: cmp qword ptr [r10 + 8], 0
0x3ed650b: jne 0x143ed6775
0x3ed6511: test rdi, rdi
0x3ed6514: je 0x143ed6775
0x3ed651a: mov r9, 0xffffffffffffffff
0x3ed6521: mov rax, r9
0x3ed6524: inc rax
0x3ed6527: cmp byte ptr [rdx + rax], 0
0x3ed652b: jne 0x143ed6524
0x3ed652d: test eax, eax
0x3ed652f: je 0x143ed6775
0x3ed6535: test byte ptr [rcx + 0x97], 1
0x3ed653c: je 0x143ed6750
0x3ed6542: xor ebx, ebx
0x3ed6544: test r10, r10
0x3ed6547: je 0x143ed655d
0x3ed6549: cmp qword ptr [r10 + 8], rbx
0x3ed654d: je 0x143ed655d
0x3ed654f: mov rcx, qword ptr [rcx + 0x38]
0x3ed6553: call 0x143ed8430
0x3ed6558: mov rbp, rax
0x3ed655b: jmp 0x143ed6596
0x3ed655d: movzx edx, word ptr [rcx + 0x8a]
0x3ed6564: mov eax, 0xffff
0x3ed6569: cmp dx, ax
0x3ed656c: je 0x143ed6750
0x3ed6572: mov rax, qword ptr [rcx + 0x58]
0x3ed6576: mov rcx, qword ptr [rax + 0xb0]
0x3ed657d: mov r8, qword ptr [rcx + 0xb8]
0x3ed6584: cmp edx, dword ptr [r8 + 8]
0x3ed6588: jb 0x143ed658f
0x3ed658a: mov rbp, rbx
0x3ed658d: jmp 0x143ed6596
0x3ed658f: mov rax, qword ptr [r8]
0x3ed6592: mov rbp, qword ptr [rax + rdx*8]
0x3ed6596: test rbp, rbp
0x3ed6599: je 0x143ed6750
0x3ed659f: test r10, r10
0x3ed65a2: je 0x143ed65b3
0x3ed65a4: cmp qword ptr [r10 + 8], rbx
0x3ed65a8: je 0x143ed65b3
0x3ed65aa: lea rax, [rsi + 0x95]
0x3ed65b1: jmp 0x143ed65c4
0x3ed65b3: lea rax, [rsi + 0x95]
0x3ed65ba: cmp byte ptr [rax], 4
0x3ed65bd: je 0x143ed661e
0x3ed65bf: test r10, r10
0x3ed65c2: je 0x143ed65d7
0x3ed65c4: cmp qword ptr [r10 + 8], rbx
0x3ed65c8: jne 0x143ed6750
0x3ed65ce: lea rcx, [rsi + 0x95]
0x3ed65d5: jmp 0x143ed65da
0x3ed65d7: mov rcx, rax
0x3ed65da: cmp byte ptr [rax], 5
0x3ed65dd: je 0x143ed661e
0x3ed65df: test r10, r10
0x3ed65e2: je 0x143ed65f5
0x3ed65e4: cmp qword ptr [r10 + 8], rbx
0x3ed65e8: jne 0x143ed6750
0x3ed65ee: lea rcx, [rsi + 0x95]
0x3ed65f5: cmp byte ptr [rcx], 6
0x3ed65f8: jne 0x143ed6750
0x3ed65fe: mov rax, qword ptr [rbp + 0xa0]
0x3ed6605: test rax, rax
0x3ed6608: je 0x143ed660e
0x3ed660a: mov rbx, qword ptr [rax + 0x10]
0x3ed660e: mov rdx, rdi
0x3ed6611: mov rcx, rbx
0x3ed6614: call 0x143d3d4e0
0x3ed6619: jmp 0x143ed6777
0x3ed661e: mov qword ptr [rsp + 0x238], rbx
0x3ed6626: mov qword ptr [rsp + 0x240], 0x201
0x3ed6632: mov dword ptr [rsp + 0x244], ebx
0x3ed6639: mov byte ptr [rsp + 0x30], 0
0x3ed663e: mov dword ptr [rsp + 0x244], ebx
0x3ed6645: mov byte ptr [rsp + 0x30], 0
0x3ed664a: mov rax, qword ptr [rsp + 0x238]
0x3ed6652: test rax, rax
0x3ed6655: je 0x143ed665a
0x3ed6657: mov byte ptr [rax], 0
0x3ed665a: mov rax, qword ptr [rsi + 0xa0]
0x3ed6661: test rax, rax
0x3ed6664: je 0x143ed6678
0x3ed6666: cmp qword ptr [rax + 8], 0
0x3ed666b: je 0x143ed6678
0x3ed666d: mov rcx, qword ptr [rsi + 0x38]
0x3ed6671: call 0x143ed39c0
0x3ed6676: jmp 0x143ed667f
0x3ed6678: mov rax, qword ptr [rsi + 0x60]
0x3ed667c: mov rax, qword ptr [rax]
0x3ed667f: mov qword ptr [rsp + 0x270], rax
0x3ed6687: mov dword ptr [rsp + 0x244], 0xffffffff
0x3ed6692: lea rcx, [rsp + 0x30]
0x3ed6697: mov rax, qword ptr [rsp + 0x238]
0x3ed669f: test rax, rax
0x3ed66a2: cmovne rcx, rax
0x3ed66a6: lea rax, [rsp + 0x278]
0x3ed66ae: mov qword ptr [rsp + 0x20], rax
0x3ed66b3: lea r9, [rsp + 0x270]
0x3ed66bb: lea r8, [rip + 0x1e94f4a]
0x3ed66c2: mov edx, dword ptr [rsp + 0x240]
0x3ed66c9: call 0x140537140
0x3ed66ce: mov rcx, qword ptr [rbp + 0xa0]
0x3ed66d5: test rcx, rcx
0x3ed66d8: je 0x143ed66e0
0x3ed66da: mov rcx, qword ptr [rcx + 0x10]
0x3ed66de: jmp 0x143ed66e3
0x3ed66e0: mov rcx, rbx
0x3ed66e3: lea rdx, [rsp + 0x30]
0x3ed66e8: mov rax, qword ptr [rsp + 0x238]
0x3ed66f0: test rax, rax
0x3ed66f3: cmovne rdx, rax
0x3ed66f7: call 0x143d3d4e0
0x3ed66fc: mov rdi, rax
0x3ed66ff: mov rcx, qword ptr [rsp + 0x238]
0x3ed6707: test rcx, rcx
0x3ed670a: je 0x143ed6743
0x3ed670c: mov eax, 0x1fd
0x3ed6711: mov rdx, qword ptr gs:[0x58]
0x3ed671a: mov r8, qword ptr [rdx]
0x3ed671d: cmp byte ptr [rax + r8], 0
0x3ed6722: je 0x143ed6736
0x3ed6724: call 0x1447f03bc
0x3ed6729: mov qword ptr [rsp + 0x238], rbx
0x3ed6731: mov rax, rdi
0x3ed6734: jmp 0x143ed6777
0x3ed6736: call 0x1447f02bc
0x3ed673b: mov qword ptr [rsp + 0x238], rbx
0x3ed6743: mov rax, rdi
0x3ed6746: jmp 0x143ed6777
0x3ed6748: nop dword ptr [rax + rax]
0x3ed6750: inc r9
0x3ed6753: cmp byte ptr [rdi + r9], 0
0x3ed6758: jne 0x143ed6750
0x3ed675a: mov edx, r9d
0x3ed675d: mov rcx, rdi
0x3ed6760: call 0x141364780
0x3ed6765: mov r8d, eax
0x3ed6768: mov rdx, rdi
0x3ed676b: mov rcx, rsi
0x3ed676e: call 0x143ed3be0
0x3ed6773: jmp 0x143ed6777
0x3ed6775: xor eax, eax
0x3ed6777: mov rbx, qword ptr [rsp + 0x280]
0x3ed677f: add rsp, 0x250
0x3ed6786: pop rdi
0x3ed6787: pop rsi
0x3ed6788: pop rbp
0x3ed6789: ret 
CALLEE 0x4743a0
0x4743a0: sub rsp, 8
0x4743a4: cmp dword ptr [rcx + 4], 0
0x4743a8: mov r8, rcx
0x4743ab: jne 0x1404743b4
0x4743ad: xor eax, eax
0x4743af: add rsp, 8
0x4743b3: ret 
0x4743b4: mov rax, qword ptr [rip + 0x681892d]
0x4743bb: mov ecx, dword ptr [rcx]
CALLEE 0x4743a0
0x4743a0: sub rsp, 8
0x4743a4: cmp dword ptr [rcx + 4], 0
0x4743a8: mov r8, rcx
0x4743ab: jne 0x1404743b4
0x4743ad: xor eax, eax
0x4743af: add rsp, 8
0x4743b3: ret 
0x4743b4: mov rax, qword ptr [rip + 0x681892d]
0x4743bb: mov ecx, dword ptr [rcx]
CALLEE 0x1424450
0x1424450: mov qword ptr [rsp + 0x10], rbx
0x1424455: mov qword ptr [rsp + 0x18], rdi
0x142445a: push rbp
0x142445b: lea rbp, [rsp - 0x70]
0x1424460: sub rsp, 0x170
0x1424467: mov rbx, rdx
0x142446a: mov qword ptr [rsp + 0x20], rcx
0x142446f: xor edi, edi
0x1424471: test rcx, rcx
0x1424474: jne 0x14142447e
0x1424476: mov dword ptr [rsp + 0x28], edi
0x142447a: mov eax, edi
0x142447c: jmp 0x141424492
0x142447e: mov rax, 0xffffffffffffffff
0x1424485: inc rax
0x1424488: cmp byte ptr [rcx + rax], dil
0x142448c: jne 0x141424485
0x142448e: mov dword ptr [rsp + 0x28], eax
0x1424492: mov qword ptr [rsp + 0x30], rdi
0x1424497: mov qword ptr [rsp + 0x38], rdi
0x142449c: and byte ptr [rsp + 0x40], 0xfe
0x14244a1: lea rcx, [rsp + 0x48]
0x14244a6: mov qword ptr [rbp + 0x80], rcx
0x14244ad: mov qword ptr [rbp + 0x50], rdi
0x14244b1: mov qword ptr [rbp + 0x58], 0x105
0x14244b9: mov dword ptr [rbp + 0x5c], edi
0x14244bc: mov byte ptr [rsp + 0x48], 0
0x14244c1: mov dword ptr [rbp + 0x5c], edi
0x14244c4: mov byte ptr [rsp + 0x48], 0
0x14244c9: mov rcx, qword ptr [rbp + 0x50]
0x14244cd: test rcx, rcx
0x14244d0: je 0x1414244d5
0x14244d2: mov byte ptr [rcx], 0
0x14244d5: mov qword ptr [rbp + 0x60], rdi
0x14244d9: mov dword ptr [rbp + 0x68], edi
0x14244dc: test eax, eax
0x14244de: je 0x141424500
0x14244e0: lea rdx, [rsp + 0x20]
0x14244e5: lea rcx, [rsp + 0x30]
0x14244ea: call 0x1413eeec0
0x14244ef: lea rdx, [rip + 0x415e14a]
0x14244f6: lea rcx, [rsp + 0x30]
0x14244fb: call 0x1413eede0
0x1424500: or byte ptr [rsp + 0x40], 1
0x1424505: cmp dword ptr [rsp + 0x38], 2
0x142450a: jne 0x14142453e
0x142450c: mov rcx, qword ptr [rsp + 0x30]
0x1424511: mov rcx, qword ptr [rcx]
0x1424514: call qword ptr [rip + 0x3dc7b8e]
0x142451a: vcvtsd2ss xmm1, xmm0, xmm0
0x142451e: vmovss dword ptr [rbx], xmm1
0x1424522: mov rcx, qword ptr [rsp + 0x30]
0x1424527: mov rcx, qword ptr [rcx + 8]
0x142452b: call qword ptr [rip + 0x3dc7b77]
0x1424531: vcvtsd2ss xmm1, xmm0, xmm0
0x1424535: vmovss dword ptr [rbx + 4], xmm1
0x142453a: mov bl, 1
0x142453c: jmp 0x141424540
0x142453e: xor bl, bl
0x1424540: lea rax, [rsp + 0x48]
0x1424545: mov qword ptr [rbp + 0x80], rax
0x142454c: lea rcx, [rsp + 0x48]
0x1424551: call 0x140394170
0x1424556: nop 
0x1424557: mov rcx, qword ptr [rsp + 0x30]
0x142455c: test rcx, rcx
0x142455f: je 0x141424586
0x1424561: mov r8d, 0x1fd
0x1424567: mov rax, qword ptr gs:[0x58]
0x1424570: mov rdx, qword ptr [rax]
0x1424573: cmp byte ptr [r8 + rdx], 0
0x1424578: je 0x141424581
0x142457a: call 0x1447f03bc
0x142457f: jmp 0x141424586
0x1424581: call 0x1447f02bc
0x1424586: mov qword ptr [rsp + 0x30], rdi
0x142458b: mov qword ptr [rsp + 0x38], rdi
0x1424590: movzx eax, bl
0x1424593: lea r11, [rsp + 0x170]
0x142459b: mov rbx, qword ptr [r11 + 0x18]
0x142459f: mov rdi, qword ptr [r11 + 0x20]
0x14245a3: mov rsp, r11
0x14245a6: pop rbp
0x14245a7: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xde5d50
0xde5d50: mov qword ptr [rsp + 8], rbx
0xde5d55: mov qword ptr [rsp + 0x10], rsi
0xde5d5a: mov qword ptr [rsp + 0x18], rdi
0xde5d5f: push rbp
0xde5d60: push r12
0xde5d62: push r13
0xde5d64: push r14
0xde5d66: push r15
0xde5d68: lea rbp, [rsp - 0x1f]
0xde5d6d: sub rsp, 0xa0
0xde5d74: mov r12, r8
0xde5d77: mov rsi, rdx
0xde5d7a: mov r15, rcx
0xde5d7d: xor r13d, r13d
0xde5d80: mov qword ptr [r8], r13
0xde5d83: lea r8, [rip + 0x478d722]
0xde5d8a: mov rdx, r9
0xde5d8d: mov rcx, qword ptr [rcx + 8]
0xde5d91: call 0x143eda3d0
0xde5d96: mov rdi, rax
0xde5d99: lea rax, [rbp - 0x31]
0xde5d9d: mov qword ptr [rbp - 0x41], rax
0xde5da1: mov dword ptr [rbp - 0x39], r13d
0xde5da5: mov dword ptr [rbp - 0x35], 0xa
0xde5dac: mov rax, qword ptr [r15 + 8]
0xde5db0: mov qword ptr [rbp - 0x61], rax
0xde5db4: mov qword ptr [rbp - 0x59], r13
0xde5db8: test rdi, rdi
0xde5dbb: je 0x140de5dfb
0xde5dbd: cmp byte ptr [rdi], r13b
0xde5dc0: je 0x140de5dfb
0xde5dc2: mov rbx, 0xffffffffffffffff
0xde5dc9: nop dword ptr [rax]
0xde5dd0: inc rbx
0xde5dd3: cmp byte ptr [rdi + rbx], 0
0xde5dd7: jne 0x140de5dd0
0xde5dd9: mov ecx, ebx
0xde5ddb: call 0x1414203f0
0xde5de0: mov r14, rax
0xde5de3: lea edx, [rbx + 1]
0xde5de6: mov r9, 0xffffffffffffffff
0xde5ded: mov r8, rdi
0xde5df0: mov rcx, qword ptr [rax]
0xde5df3: call qword ptr [rip + 0x44066b7]
0xde5df9: jmp 0x140de5e02
0xde5dfb: lea r14, [rip + 0x5c7fb3e]
0xde5e02: mov qword ptr [rbp - 0x59], r14
0xde5e06: mov qword ptr [rbp - 0x51], 1
0xde5e0e: mov word ptr [rbp - 0x49], 0x100
0xde5e14: mov byte ptr [rbp - 0x49], 0
0xde5e18: lea rdx, [rbp - 0x41]
0xde5e1c: lea rcx, [rbp - 0x61]
0xde5e20: call 0x143d1dab0
0xde5e25: nop 
0xde5e26: lea rcx, [rbp - 0x59]
0xde5e2a: call 0x140394db0
0xde5e2f: cmp dword ptr [rbp - 0x39], 0
0xde5e33: jne 0x140de5e42
0xde5e35: mov eax, dword ptr [rip + 0x5ef5cf5]
0xde5e3b: mov dword ptr [rsi], eax
0xde5e3d: jmp 0x140de5ec4
0xde5e42: mov rax, qword ptr [rbp - 0x41]
0xde5e46: mov rbx, qword ptr [rax]
0xde5e49: mov rax, qword ptr [rbx + 0xa0]
0xde5e50: test rax, rax
0xde5e53: je 0x140de5e5c
0xde5e55: cmp qword ptr [rax + 8], 0
0xde5e5a: jne 0x140de5ebc
0xde5e5c: mov rbx, qword ptr [rbx + 0xd8]
0xde5e63: test rbx, rbx
0xde5e66: jne 0x140de5e83
0xde5e68: test rax, rax
0xde5e6b: je 0x140de5ebc
0xde5e6d: mov rcx, qword ptr [rax + 0x58]
0xde5e71: test rcx, rcx
0xde5e74: je 0x140de5ebc
0xde5e76: call 0x143ed84d0
0xde5e7b: mov rbx, rax
0xde5e7e: test rax, rax
0xde5e81: je 0x140de5ebc
0xde5e83: mov rcx, qword ptr [rbx]
0xde5e86: mov r8, qword ptr [rcx + 0x190]
0xde5e8d: lea rdx, [rip + 0x5edd754]
0xde5e94: mov rcx, rbx
0xde5e97: call r8
0xde5e9a: test al, al
0xde5e9c: cmove rbx, r13
0xde5ea0: mov qword ptr [r12], rbx
0xde5ea4: test rbx, rbx
0xde5ea7: jne 0x140de5eb3
0xde5ea9: mov eax, dword ptr [rip + 0x5ef5c85]
0xde5eaf: mov dword ptr [rsi], eax
0xde5eb1: jmp 0x140de5ec4
0xde5eb3: mov qword ptr [rbx + 0x28], r15
0xde5eb7: mov dword ptr [rsi], r13d
0xde5eba: jmp 0x140de5ec4
0xde5ebc: mov eax, dword ptr [rip + 0x5ef5c72]
0xde5ec2: mov dword ptr [rsi], eax
0xde5ec4: lea rax, [rbp - 0x31]
0xde5ec8: mov rcx, qword ptr [rbp - 0x41]
0xde5ecc: cmp rcx, rax
0xde5ecf: je 0x140de5efb
0xde5ed1: test rcx, rcx
0xde5ed4: je 0x140de5efb
0xde5ed6: mov rax, qword ptr gs:[0x58]
0xde5edf: mov rdx, qword ptr [rax]
0xde5ee2: mov r8d, 0x1fd
0xde5ee8: cmp byte ptr [r8 + rdx], 0
0xde5eed: je 0x140de5ef6
0xde5eef: call 0x1447f03bc
0xde5ef4: jmp 0x140de5efb
0xde5ef6: call 0x1447f02bc
0xde5efb: mov rax, rsi
0xde5efe: lea r11, [rsp + 0xa0]
0xde5f06: mov rbx, qword ptr [r11 + 0x30]
0xde5f0a: mov rsi, qword ptr [r11 + 0x38]
0xde5f0e: mov rdi, qword ptr [r11 + 0x40]
0xde5f12: mov rsp, r11
0xde5f15: pop r15
0xde5f17: pop r14
0xde5f19: pop r13
0xde5f1b: pop r12
0xde5f1d: pop rbp
0xde5f1e: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7860
0xcb7860: mov qword ptr [rsp + 8], rbx
0xcb7865: mov qword ptr [rsp + 0x10], rbp
0xcb786a: mov qword ptr [rsp + 0x18], rsi
0xcb786f: push rdi
0xcb7870: push r14
0xcb7872: push r15
0xcb7874: sub rsp, 0xa0
0xcb787b: mov rdi, r8
0xcb787e: mov rsi, rdx
0xcb7881: mov rbx, rcx
0xcb7884: xor r15d, r15d
0xcb7887: mov dword ptr [r8 + 8], r15d
0xcb788b: mov r8, qword ptr [rsp + 0xe0]
0xcb7893: mov rdx, r9
0xcb7896: mov rcx, qword ptr [rcx + 8]
0xcb789a: call 0x143eda3d0
0xcb789f: mov rbp, rax
0xcb78a2: lea rax, [rsp + 0x50]
0xcb78a7: mov qword ptr [rsp + 0x40], rax
0xcb78ac: mov dword ptr [rsp + 0x48], r15d
0xcb78b1: mov dword ptr [rsp + 0x4c], 0xa
0xcb78b9: mov rax, qword ptr [rbx + 8]
0xcb78bd: mov qword ptr [rsp + 0x20], rax
0xcb78c2: mov qword ptr [rsp + 0x28], r15
0xcb78c7: test rbp, rbp
0xcb78ca: je 0x140cb790b
0xcb78cc: cmp byte ptr [rbp], r15b
0xcb78d0: je 0x140cb790b
0xcb78d2: mov rbx, 0xffffffffffffffff
0xcb78d9: nop dword ptr [rax]
0xcb78e0: inc rbx
0xcb78e3: cmp byte ptr [rbx + rbp], 0
0xcb78e7: jne 0x140cb78e0
0xcb78e9: mov ecx, ebx
0xcb78eb: call 0x1414203f0
0xcb78f0: mov r14, rax
0xcb78f3: lea edx, [rbx + 1]
0xcb78f6: mov r9, 0xffffffffffffffff
0xcb78fd: mov r8, rbp
0xcb7900: mov rcx, qword ptr [rax]
0xcb7903: call qword ptr [rip + 0x4534ba7]
0xcb7909: jmp 0x140cb7912
0xcb790b: lea r14, [rip + 0x5dae02e]
0xcb7912: mov qword ptr [rsp + 0x28], r14
0xcb7917: mov qword ptr [rsp + 0x30], r15
0xcb791c: mov word ptr [rsp + 0x38], 0x100
0xcb7923: mov byte ptr [rsp + 0x38], 1
0xcb7928: lea rdx, [rsp + 0x40]
0xcb792d: lea rcx, [rsp + 0x20]
0xcb7932: call 0x143d1dab0
0xcb7937: nop 
0xcb7938: lea rcx, [rsp + 0x28]
0xcb793d: call 0x140394db0
0xcb7942: mov edx, dword ptr [rsp + 0x48]
0xcb7946: test edx, edx
0xcb7948: jne 0x140cb7995
0xcb794a: mov eax, dword ptr [rip + 0x60241e0]
0xcb7950: mov dword ptr [rsi], eax
0xcb7952: lea rax, [rsp + 0x50]
0xcb7957: mov rcx, qword ptr [rsp + 0x40]
0xcb795c: cmp rcx, rax
0xcb795f: je 0x140cb7a4c
0xcb7965: test rcx, rcx
0xcb7968: je 0x140cb7a4c
0xcb796e: mov r8d, 0x1fd
0xcb7974: mov rax, qword ptr gs:[0x58]
0xcb797d: mov rdx, qword ptr [rax]
0xcb7980: cmp byte ptr [r8 + rdx], 0
0xcb7985: je 0x140cb7a47
0xcb798b: call 0x1447f03bc
0xcb7990: jmp 0x140cb7a4c
0xcb7995: mov rcx, rdi
0xcb7998: call 0x14035e3f0
0xcb799d: mov r14d, dword ptr [rsp + 0x48]
0xcb79a2: mov rbx, qword ptr [rsp + 0x40]
0xcb79a7: test r14d, r14d
0xcb79aa: je 0x140cb7a13
0xcb79ac: mov edx, dword ptr [rdi + 8]
0xcb79af: add edx, r14d
0xcb79b2: mov rcx, rdi
0xcb79b5: call 0x14035e3f0
0xcb79ba: test r14d, r14d
0xcb79bd: je 0x140cb7a13
0xcb79bf: mov ebp, r14d
0xcb79c2: mov r14d, 1
0xcb79c8: nop dword ptr [rax + rax]
0xcb79d0: mov ecx, dword ptr [rdi + 8]
0xcb79d3: mov eax, dword ptr [rdi + 0xc]
0xcb79d6: cmp eax, ecx
0xcb79d8: ja 0x140cb79f9
0xcb79da: lea edx, [rax*2 + 1]
0xcb79e1: add edx, eax
0xcb79e3: shr edx, 1
0xcb79e5: cmp edx, r14d
0xcb79e8: cmovb edx, r14d
0xcb79ec: cmp ecx, edx
0xcb79ee: cmova edx, ecx
0xcb79f1: mov rcx, rdi
0xcb79f4: call 0x14035e3f0
0xcb79f9: mov edx, dword ptr [rdi + 8]
0xcb79fc: mov rcx, qword ptr [rdi]
0xcb79ff: mov rax, qword ptr [rbx]
0xcb7a02: mov qword ptr [rcx + rdx*8], rax
0xcb7a06: inc dword ptr [rdi + 8]
0xcb7a09: add rbx, 8
0xcb7a0d: sub rbp, 1
0xcb7a11: jne 0x140cb79d0
0xcb7a13: mov dword ptr [rsi], r15d
0xcb7a16: lea rax, [rsp + 0x50]
0xcb7a1b: mov rcx, qword ptr [rsp + 0x40]
0xcb7a20: cmp rcx, rax
0xcb7a23: je 0x140cb7a4c
0xcb7a25: test rcx, rcx
0xcb7a28: je 0x140cb7a4c
0xcb7a2a: mov r8d, 0x1fd
0xcb7a30: mov rax, qword ptr gs:[0x58]
0xcb7a39: mov rdx, qword ptr [rax]
0xcb7a3c: cmp byte ptr [r8 + rdx], 0
0xcb7a41: jne 0x140cb798b
0xcb7a47: call 0x1447f02bc
0xcb7a4c: mov rax, rsi
0xcb7a4f: lea r11, [rsp + 0xa0]
0xcb7a57: mov rbx, qword ptr [r11 + 0x20]
0xcb7a5b: mov rbp, qword ptr [r11 + 0x28]
0xcb7a5f: mov rsi, qword ptr [r11 + 0x30]
0xcb7a63: mov rsp, r11
0xcb7a66: pop r15
0xcb7a68: pop r14
0xcb7a6a: pop rdi
0xcb7a6b: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
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
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
CALLEE 0x64ce00
0x64ce00: mov qword ptr [rsp + 8], rbx
0x64ce05: mov qword ptr [rsp + 0x10], rsi
0x64ce0a: mov qword ptr [rsp + 0x18], rdi
0x64ce0f: push rbp
0x64ce10: push r12
0x64ce12: push r13
0x64ce14: push r14
0x64ce16: push r15
0x64ce18: lea rbp, [rsp - 0x1f]
0x64ce1d: sub rsp, 0xa0
0x64ce24: mov r12, r8
0x64ce27: mov rsi, rdx
0x64ce2a: mov r15, rcx
0x64ce2d: xor r13d, r13d
0x64ce30: mov qword ptr [r8], r13
0x64ce33: mov r8, qword ptr [rbp + 0x6f]
0x64ce37: mov rdx, r9
0x64ce3a: mov rcx, qword ptr [rcx + 8]
0x64ce3e: call 0x143eda3d0
0x64ce43: mov rdi, rax
0x64ce46: lea rax, [rbp - 0x31]
0x64ce4a: mov qword ptr [rbp - 0x41], rax
0x64ce4e: mov dword ptr [rbp - 0x39], r13d
0x64ce52: mov dword ptr [rbp - 0x35], 0xa
0x64ce59: mov rax, qword ptr [r15 + 8]
0x64ce5d: mov qword ptr [rbp - 0x61], rax
0x64ce61: mov qword ptr [rbp - 0x59], r13
0x64ce65: test rdi, rdi
0x64ce68: je 0x14064cea1
0x64ce6a: cmp byte ptr [rdi], r13b
0x64ce6d: je 0x14064cea1
0x64ce6f: mov rbx, 0xffffffffffffffff
0x64ce76: inc rbx
0x64ce79: cmp byte ptr [rdi + rbx], 0
0x64ce7d: jne 0x14064ce76
0x64ce7f: mov ecx, ebx
0x64ce81: call 0x1414203f0
0x64ce86: mov r14, rax
0x64ce89: lea edx, [rbx + 1]
0x64ce8c: mov r9, 0xffffffffffffffff
0x64ce93: mov r8, rdi
0x64ce96: mov rcx, qword ptr [rax]
0x64ce99: call qword ptr [rip + 0x4b9f611]
0x64ce9f: jmp 0x14064cea8
0x64cea1: lea r14, [rip + 0x6418a98]
0x64cea8: mov qword ptr [rbp - 0x59], r14
0x64ceac: mov qword ptr [rbp - 0x51], 1
0x64ceb4: mov word ptr [rbp - 0x49], 0x100
0x64ceba: mov byte ptr [rbp - 0x49], 0
0x64cebe: lea rdx, [rbp - 0x41]
0x64cec2: lea rcx, [rbp - 0x61]
0x64cec6: call 0x143d1dab0
0x64cecb: nop 
0x64cecc: lea rcx, [rbp - 0x59]
0x64ced0: call 0x140394db0
0x64ced5: cmp dword ptr [rbp - 0x39], 0
0x64ced9: jne 0x14064cee8
0x64cedb: mov eax, dword ptr [rip + 0x668ec4f]
0x64cee1: mov dword ptr [rsi], eax
0x64cee3: jmp 0x14064cf6a
0x64cee8: mov rax, qword ptr [rbp - 0x41]
0x64ceec: mov rbx, qword ptr [rax]
0x64ceef: mov rax, qword ptr [rbx + 0xa0]
0x64cef6: test rax, rax
0x64cef9: je 0x14064cf02
0x64cefb: cmp qword ptr [rax + 8], 0
0x64cf00: jne 0x14064cf62
0x64cf02: mov rbx, qword ptr [rbx + 0xd8]
0x64cf09: test rbx, rbx
0x64cf0c: jne 0x14064cf29
0x64cf0e: test rax, rax
0x64cf11: je 0x14064cf62
0x64cf13: mov rcx, qword ptr [rax + 0x58]
0x64cf17: test rcx, rcx
0x64cf1a: je 0x14064cf62
0x64cf1c: call 0x143ed84d0
0x64cf21: mov rbx, rax
0x64cf24: test rax, rax
0x64cf27: je 0x14064cf62
0x64cf29: mov rcx, qword ptr [rbx]
0x64cf2c: mov r8, qword ptr [rcx + 0x190]
0x64cf33: lea rdx, [rip + 0x664f266]
0x64cf3a: mov rcx, rbx
0x64cf3d: call r8
0x64cf40: test al, al
0x64cf42: cmove rbx, r13
0x64cf46: mov qword ptr [r12], rbx
0x64cf4a: test rbx, rbx
0x64cf4d: jne 0x14064cf59
0x64cf4f: mov eax, dword ptr [rip + 0x668ebdf]
0x64cf55: mov dword ptr [rsi], eax
0x64cf57: jmp 0x14064cf6a
0x64cf59: mov qword ptr [rbx + 0x28], r15
0x64cf5d: mov dword ptr [rsi], r13d
0x64cf60: jmp 0x14064cf6a
0x64cf62: mov eax, dword ptr [rip + 0x668ebcc]
0x64cf68: mov dword ptr [rsi], eax
0x64cf6a: lea rax, [rbp - 0x31]
0x64cf6e: mov rcx, qword ptr [rbp - 0x41]
0x64cf72: cmp rcx, rax
0x64cf75: je 0x14064cfa1
0x64cf77: test rcx, rcx
0x64cf7a: je 0x14064cfa1
0x64cf7c: mov rax, qword ptr gs:[0x58]
0x64cf85: mov rdx, qword ptr [rax]
0x64cf88: mov r8d, 0x1fd
0x64cf8e: cmp byte ptr [r8 + rdx], 0
0x64cf93: je 0x14064cf9c
0x64cf95: call 0x1447f03bc
0x64cf9a: jmp 0x14064cfa1
0x64cf9c: call 0x1447f02bc
0x64cfa1: mov rax, rsi
0x64cfa4: lea r11, [rsp + 0xa0]
0x64cfac: mov rbx, qword ptr [r11 + 0x30]
0x64cfb0: mov rsi, qword ptr [r11 + 0x38]
0x64cfb4: mov rdi, qword ptr [r11 + 0x40]
0x64cfb8: mov rsp, r11
0x64cfbb: pop r15
0x64cfbd: pop r14
0x64cfbf: pop r13
0x64cfc1: pop r12
0x64cfc3: pop rbp
0x64cfc4: ret 
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
CALLEE 0x3ed5b40
0x3ed5b40: mov dword ptr [rsp + 0x18], r8d
0x3ed5b45: mov qword ptr [rsp + 0x10], rdx
0x3ed5b4a: push rbp
0x3ed5b4b: push rbx
0x3ed5b4c: push rsi
0x3ed5b4d: push rdi
0x3ed5b4e: push r12
0x3ed5b50: push r13
0x3ed5b52: push r14
0x3ed5b54: push r15
0x3ed5b56: mov rbp, rsp
0x3ed5b59: sub rsp, 0x68
0x3ed5b5d: mov r13d, r8d
0x3ed5b60: mov rsi, rdx
0x3ed5b63: mov r15, rcx
0x3ed5b66: mov rax, qword ptr [rcx + 0xa0]
0x3ed5b6d: test rax, rax
0x3ed5b70: je 0x143ed5b7d
0x3ed5b72: cmp qword ptr [rax + 8], 0
0x3ed5b77: jne 0x143ed6166
0x3ed5b7d: xor r14d, r14d
0x3ed5b80: mov ebx, r14d
0x3ed5b83: mov qword ptr [rbp - 0x48], rbx
0x3ed5b87: test rdx, rdx
0x3ed5b8a: je 0x143ed5bab
0x3ed5b8c: mov rbx, rdx
0x3ed5b8f: mov qword ptr [rbp - 0x48], rdx
0x3ed5b93: cmp byte ptr [rdx + 0x14], r14b
0x3ed5b97: je 0x143ed5b9f
0x3ed5b99: lock inc dword ptr [rdx + 0x10]
0x3ed5b9d: jmp 0x143ed5ba7
0x3ed5b9f: mov eax, dword ptr [rdx + 0x10]
0x3ed5ba2: inc eax
0x3ed5ba4: mov dword ptr [rdx + 0x10], eax
0x3ed5ba7: mov byte ptr [rdx + 0x16], 1
0x3ed5bab: mov rcx, rdx
0x3ed5bae: call 0x143ed59a0
0x3ed5bb3: mov rax, qword ptr [r15 + 0xa0]
0x3ed5bba: test rax, rax
0x3ed5bbd: je 0x143ed5bdc
0x3ed5bbf: cmp qword ptr [rax + 0x58], 0
0x3ed5bc4: je 0x143ed5bdc
0x3ed5bc6: cmp r13d, -1
0x3ed5bca: je 0x143ed5bdc
0x3ed5bcc: cmp r13d, dword ptr [rax + 0x90]
0x3ed5bd3: jb 0x143ed5bdc
0x3ed5bd5: inc r13d
0x3ed5bd8: mov dword ptr [rbp + 0x58], r13d
0x3ed5bdc: mov r9d, dword ptr [r15 + 0x48]
0x3ed5be0: mov dword ptr [rbp + 0x60], r9d
0x3ed5be4: mov ecx, dword ptr [r15 + 0x4c]
0x3ed5be8: cmp r9d, r13d
0x3ed5beb: ja 0x143ed5c73
0x3ed5bf1: mov eax, 1
0x3ed5bf6: cmp ecx, r9d
0x3ed5bf9: ja 0x143ed5c1b
0x3ed5bfb: lea edx, [rcx*2 + 1]
0x3ed5c02: add edx, ecx
0x3ed5c04: shr edx, 1
0x3ed5c06: cmp edx, eax
0x3ed5c08: cmovb edx, eax
0x3ed5c0b: cmp r9d, edx
0x3ed5c0e: cmova edx, r9d
0x3ed5c12: lea rcx, [r15 + 0x40]
0x3ed5c16: call 0x1403d3080
0x3ed5c1b: mov ecx, dword ptr [r15 + 0x48]
0x3ed5c1f: mov rax, qword ptr [r15 + 0x40]
0x3ed5c23: lea rdx, [rax + rcx*8]
0x3ed5c27: mov qword ptr [rdx], rbx
0x3ed5c2a: test rbx, rbx
0x3ed5c2d: je 0x143ed5c6a
0x3ed5c2f: cmp byte ptr [rbx + 0x15], 0
0x3ed5c33: je 0x143ed5c41
0x3ed5c35: mov qword ptr [rdx], r14
0x3ed5c38: inc dword ptr [r15 + 0x48]
0x3ed5c3c: jmp 0x143ed5d57
0x3ed5c41: cmp byte ptr [rbx + 0x14], 0
0x3ed5c45: je 0x143ed5c5b
0x3ed5c47: lock inc dword ptr [rbx + 0x10]
0x3ed5c4b: mov rax, qword ptr [rdx]
0x3ed5c4e: mov byte ptr [rax + 0x16], 1
0x3ed5c52: inc dword ptr [r15 + 0x48]
0x3ed5c56: jmp 0x143ed5d57
0x3ed5c5b: mov eax, dword ptr [rbx + 0x10]
0x3ed5c5e: inc eax
0x3ed5c60: mov dword ptr [rbx + 0x10], eax
0x3ed5c63: mov rax, qword ptr [rdx]
0x3ed5c66: mov byte ptr [rax + 0x16], 1
0x3ed5c6a: inc dword ptr [r15 + 0x48]
0x3ed5c6e: jmp 0x143ed5d57
0x3ed5c73: lea eax, [r9 + 1]
0x3ed5c77: mov r8d, 1
0x3ed5c7d: cmp ecx, eax
0x3ed5c7f: ja 0x143ed5ca3
0x3ed5c81: lea edx, [rcx*2 + 1]
0x3ed5c88: add edx, ecx
0x3ed5c8a: shr edx, 1
0x3ed5c8c: cmp edx, r8d
0x3ed5c8f: cmovb edx, r8d
0x3ed5c93: cmp r9d, edx
0x3ed5c96: cmova edx, r9d
0x3ed5c9a: lea rcx, [r15 + 0x40]
0x3ed5c9e: call 0x1403d3080
0x3ed5ca3: mov ecx, dword ptr [r15 + 0x48]
0x3ed5ca7: mov rax, qword ptr [r15 + 0x40]
0x3ed5cab: mov qword ptr [rax + rcx*8], r14
0x3ed5caf: lea eax, [r13 + 1]
0x3ed5cb3: mov edx, dword ptr [r15 + 0x48]
0x3ed5cb7: cmp edx, eax
0x3ed5cb9: jb 0x143ed5d07
0x3ed5cbb: mov esi, eax
0x3ed5cbd: nop dword ptr [rax]
0x3ed5cc0: mov rcx, qword ptr [r15 + 0x40]
0x3ed5cc4: lea eax, [rdx - 1]
0x3ed5cc7: mov dword ptr [rbp + 0x48], eax
0x3ed5cca: lea r13, [rcx + rax*8]
0x3ed5cce: mov eax, edx
0x3ed5cd0: lea rdi, [rcx + rax*8]
0x3ed5cd4: cmp r13, rdi
0x3ed5cd7: je 0x143ed5cf8
0x3ed5cd9: mov rcx, rdi
0x3ed5cdc: call 0x14038ad90
0x3ed5ce1: mov rax, qword ptr [r13]
0x3ed5ce5: mov qword ptr [rdi], rax
0x3ed5ce8: mov qword ptr [r13], r14
0x3ed5cec: mov rax, qword ptr [rdi]
0x3ed5cef: test rax, rax
0x3ed5cf2: je 0x143ed5cf8
0x3ed5cf4: mov byte ptr [rax + 0x16], 1
0x3ed5cf8: mov edx, dword ptr [rbp + 0x48]
0x3ed5cfb: cmp edx, esi
0x3ed5cfd: jae 0x143ed5cc0
0x3ed5cff: mov rsi, qword ptr [rbp + 0x50]
0x3ed5d03: mov r13d, dword ptr [rbp + 0x58]
0x3ed5d07: inc dword ptr [r15 + 0x48]
0x3ed5d0b: mov eax, r13d
0x3ed5d0e: lea rdi, [rax*8]
0x3ed5d16: mov rcx, qword ptr [r15 + 0x40]
0x3ed5d1a: add rcx, rdi
0x3ed5d1d: call 0x14038ad90
0x3ed5d22: mov rcx, qword ptr [r15 + 0x40]
0x3ed5d26: mov qword ptr [rcx + rdi], rbx
0x3ed5d2a: test rbx, rbx
0x3ed5d2d: je 0x143ed5d57
0x3ed5d2f: cmp byte ptr [rbx + 0x15], 0
0x3ed5d33: je 0x143ed5d3b
0x3ed5d35: mov qword ptr [rcx + rdi], r14
0x3ed5d39: jmp 0x143ed5d57
0x3ed5d3b: cmp byte ptr [rbx + 0x14], 0
0x3ed5d3f: je 0x143ed5d47
0x3ed5d41: lock inc dword ptr [rbx + 0x10]
0x3ed5d45: jmp 0x143ed5d4f
0x3ed5d47: mov eax, dword ptr [rbx + 0x10]
0x3ed5d4a: inc eax
0x3ed5d4c: mov dword ptr [rbx + 0x10], eax
0x3ed5d4f: mov rax, qword ptr [rcx + rdi]
0x3ed5d53: mov byte ptr [rax + 0x16], 1
0x3ed5d57: mov r10, qword ptr [r15 + 0xa0]
0x3ed5d5e: test r10, r10
0x3ed5d61: je 0x143ed5d97
0x3ed5d63: mov r8, qword ptr [r10 + 0x58]
0x3ed5d67: test r8, r8
0x3ed5d6a: je 0x143ed5d97
0x3ed5d6c: mov ecx, r14d
0x3ed5d6f: mov edx, dword ptr [r15 + 0x48]
0x3ed5d73: test edx, edx
0x3ed5d75: je 0x143ed5d97
0x3ed5d77: mov r9, qword ptr [r15 + 0x40]
0x3ed5d7b: nop dword ptr [rax + rax]
0x3ed5d80: mov eax, ecx
0x3ed5d82: cmp r8, qword ptr [r9 + rax*8]
0x3ed5d86: je 0x143ed5d90
0x3ed5d88: inc ecx
0x3ed5d8a: cmp ecx, edx
0x3ed5d8c: jb 0x143ed5d80
0x3ed5d8e: jmp 0x143ed5d97
0x3ed5d90: mov dword ptr [r10 + 0x90], ecx
0x3ed5d97: mov qword ptr [rsi + 0x38], r15
0x3ed5d9b: xor edx, edx
0x3ed5d9d: mov rcx, qword ptr [r15 + 0x18]
0x3ed5da1: call 0x1435b6460
0x3ed5da6: xor r12b, r12b
0x3ed5da9: mov rax, qword ptr [r15 + 0x20]
0x3ed5dad: mov r8, qword ptr [rax + 0x28]
0x3ed5db1: test r8, r8
0x3ed5db4: je 0x143ed5e0c
0x3ed5db6: lea rcx, [rsi + 0xa0]
0x3ed5dbd: test byte ptr [rsi + 0xb6], 8
0x3ed5dc4: je 0x143ed5df8
0x3ed5dc6: mov rax, qword ptr [rcx]
0x3ed5dc9: test rax, rax
0x3ed5dcc: je 0x143ed5dde
0x3ed5dce: cmp qword ptr [rax + 8], 0
0x3ed5dd3: je 0x143ed5dde
0x3ed5dd5: lea rax, [rsi + 0x20]
0x3ed5dd9: mov r12b, 1
0x3ed5ddc: jmp 0x143ed5dff
0x3ed5dde: lea rax, [rsi + 0x20]
0x3ed5de2: mov r9, qword ptr [rax]
0x3ed5de5: test r9, r9
0x3ed5de8: je 0x143ed5df3
0x3ed5dea: mov rdx, rax
0x3ed5ded: cmp qword ptr [r9 + 0x28], r8
0x3ed5df1: je 0x143ed5dfc
0x3ed5df3: mov r12b, 1
0x3ed5df6: jmp 0x143ed5dff
0x3ed5df8: lea rdx, [rsi + 0x20]
0x3ed5dfc: mov rax, rdx
0x3ed5dff: cmp qword ptr [rcx], 0
0x3ed5e03: jne 0x143ed5e0c
0x3ed5e05: mov rax, qword ptr [rax]
0x3ed5e08: mov qword ptr [rax + 0x28], r8
0x3ed5e0c: lea rcx, [rbp - 0x30]
0x3ed5e10: call 0x1435b97b0
0x3ed5e15: nop 
0x3ed5e16: movzx eax, byte ptr [r15 + 0x94]
0x3ed5e1e: mov byte ptr [rbp - 0x18], al
0x3ed5e21: movzx eax, word ptr [r15 + 0x8a]
0x3ed5e29: mov word ptr [rbp - 0x16], ax
0x3ed5e2d: mov word ptr [rbp - 0x13], 0x101
0x3ed5e33: mov rbx, qword ptr [rip + 0x2e538ce]
0x3ed5e3a: mov edi, dword ptr [rip + 0x2e538d0]
0x3ed5e40: add rdi, rbx
0x3ed5e43: cmp rbx, rdi
0x3ed5e46: je 0x143ed5ee4
0x3ed5e4c: mov r13d, 1
0x3ed5e52: lea rsi, [rip + 0x2db7327]
0x3ed5e59: nop dword ptr [rax]
0x3ed5e60: movzx eax, byte ptr [rbx]
0x3ed5e63: mov byte ptr [rbp + 0x48], al
0x3ed5e66: lea r8, [rbp + 0x48]
0x3ed5e6a: lea rdx, [rbp - 0x40]
0x3ed5e6e: mov rcx, qword ptr [r15 + 0x20]
0x3ed5e72: call 0x1435c8ef0
0x3ed5e77: mov rcx, rax
0x3ed5e7a: call 0x140615320
0x3ed5e7f: movzx ecx, byte ptr [rax + 0xc]
0x3ed5e83: mov rcx, qword ptr [rsi + rcx*8]
0x3ed5e87: mov rdx, rax
0x3ed5e8a: mov rcx, qword ptr [rcx + 0x18]
0x3ed5e8e: call 0x143598390
0x3ed5e93: test al, al
0x3ed5e95: jne 0x143ed5ed4
0x3ed5e97: mov ecx, dword ptr [rbp - 0x24]
0x3ed5e9a: mov eax, dword ptr [rbp - 0x28]
0x3ed5e9d: cmp ecx, eax
0x3ed5e9f: ja 0x143ed5ec4
0x3ed5ea1: lea edx, [rcx*2 + 1]
0x3ed5ea8: add edx, ecx
0x3ed5eaa: shr edx, 1
0x3ed5eac: cmp edx, r13d
0x3ed5eaf: cmovb edx, r13d
0x3ed5eb3: cmp eax, edx
0x3ed5eb5: cmova edx, eax
0x3ed5eb8: lea rcx, [rbp - 0x30]
0x3ed5ebc: call 0x1403d2be0
0x3ed5ec1: mov eax, dword ptr [rbp - 0x28]
0x3ed5ec4: mov edx, eax
0x3ed5ec6: movzx ecx, byte ptr [rbp + 0x48]
0x3ed5eca: mov rax, qword ptr [rbp - 0x30]
0x3ed5ece: mov byte ptr [rdx + rax], cl
0x3ed5ed1: inc dword ptr [rbp - 0x28]
0x3ed5ed4: inc rbx
0x3ed5ed7: cmp rbx, rdi
0x3ed5eda: jne 0x143ed5e60
0x3ed5edc: mov rsi, qword ptr [rbp + 0x50]
0x3ed5ee0: mov r13d, dword ptr [rbp + 0x58]
0x3ed5ee4: lea rdx, [rbp - 0x30]
0x3ed5ee8: mov rcx, rsi
0x3ed5eeb: call 0x143ed8720
0x3ed5ef0: nop 
0x3ed5ef1: mov rcx, qword ptr [rbp - 0x30]
0x3ed5ef5: test rcx, rcx
0x3ed5ef8: je 0x143ed5f1f
0x3ed5efa: mov r8d, 0x1fd
0x3ed5f00: mov rax, qword ptr gs:[0x58]
0x3ed5f09: mov rdx, qword ptr [rax]
0x3ed5f0c: cmp byte ptr [r8 + rdx], 0
0x3ed5f11: je 0x143ed5f1a
0x3ed5f13: call 0x1447f03bc
0x3ed5f18: jmp 0x143ed5f1f
0x3ed5f1a: call 0x1447f02bc
0x3ed5f1f: mov qword ptr [rbp - 0x30], r14
0x3ed5f23: mov qword ptr [rbp - 0x28], r14
0x3ed5f27: mov rax, qword ptr [r15 + 0xa0]
0x3ed5f2e: test rax, rax
0x3ed5f31: je 0x143ed5f45
0x3ed5f33: cmp qword ptr [rax + 8], 0
0x3ed5f38: je 0x143ed5f45
0x3ed5f3a: mov rcx, qword ptr [r15 + 0x38]
0x3ed5f3e: call 0x143ed8430
0x3ed5f43: jmp 0x143ed5f7b
0x3ed5f45: movzx edx, word ptr [r15 + 0x8a]
0x3ed5f4d: mov eax, 0xffff
0x3ed5f52: cmp dx, ax
0x3ed5f55: je 0x143ed5fb8
0x3ed5f57: mov rax, qword ptr [r15 + 0x58]
0x3ed5f5b: mov rcx, qword ptr [rax + 0xb0]
0x3ed5f62: mov r8, qword ptr [rcx + 0xb8]
0x3ed5f69: cmp edx, dword ptr [r8 + 8]
0x3ed5f6d: jb 0x143ed5f74
0x3ed5f6f: mov rax, r14
0x3ed5f72: jmp 0x143ed5f7b
0x3ed5f74: mov rax, qword ptr [r8]
0x3ed5f77: mov rax, qword ptr [rax + rdx*8]
0x3ed5f7b: test rax, rax
0x3ed5f7e: je 0x143ed5fb8
0x3ed5f80: mov rcx, qword ptr [rax + 0xa0]
0x3ed5f87: test rcx, rcx
0x3ed5f8a: je 0x143ed5f92
0x3ed5f8c: mov rcx, qword ptr [rcx + 0x10]
0x3ed5f90: jmp 0x143ed5f95
0x3ed5f92: mov rcx, r14
0x3ed5f95: mov byte ptr [rcx + 0x247], 1
0x3ed5f9c: mov rcx, qword ptr [rax + 0xa0]
0x3ed5fa3: test rcx, rcx
0x3ed5fa6: je 0x143ed5fae
0x3ed5fa8: mov rcx, qword ptr [rcx + 0x10]
0x3ed5fac: jmp 0x143ed5fb1
0x3ed5fae: mov rcx, r14
0x3ed5fb1: mov dl, 1
0x3ed5fb3: call 0x143d3d650
0x3ed5fb8: mov rcx, qword ptr [r15 + 0x58]
0x3ed5fbc: call 0x1410270d0
0x3ed5fc1: test al, al
0x3ed5fc3: jne 0x143ed6020
0x3ed5fc5: mov rax, qword ptr [r15 + 0xa0]
0x3ed5fcc: test rax, rax
0x3ed5fcf: je 0x143ed5fe3
0x3ed5fd1: cmp qword ptr [rax + 8], 0
0x3ed5fd6: je 0x143ed5fe3
0x3ed5fd8: mov rcx, qword ptr [r15 + 0x38]
0x3ed5fdc: call 0x143ed8480
0x3ed5fe1: jmp 0x143ed6014
0x3ed5fe3: movzx edx, byte ptr [r15 + 0x94]
0x3ed5feb: cmp dl, 0xff
0x3ed5fee: je 0x143ed6020
0x3ed5ff0: mov rax, qword ptr [r15 + 0x58]
0x3ed5ff4: mov rcx, qword ptr [rax + 0xb0]
0x3ed5ffb: mov r8, qword ptr [rcx + 0xb0]
0x3ed6002: cmp edx, dword ptr [r8 + 8]
0x3ed6006: jb 0x143ed600d
0x3ed6008: mov rax, r14
0x3ed600b: jmp 0x143ed6014
0x3ed600d: mov rax, qword ptr [r8]
0x3ed6010: mov rax, qword ptr [rax + rdx*8]
0x3ed6014: test rax, rax
0x3ed6017: je 0x143ed6020
0x3ed6019: mov byte ptr [rax + 0x136], 1
0x3ed6020: cmp dword ptr [r15 + 0xf0], 0
0x3ed6028: jne 0x143ed604e
0x3ed602a: lea rbx, [rsi + 0xa0]
0x3ed6031: mov rax, qword ptr [rbx]
0x3ed6034: test rax, rax
0x3ed6037: je 0x143ed6040
0x3ed6039: cmp qword ptr [rax + 8], 0
0x3ed603e: jne 0x143ed6060
0x3ed6040: mov rax, rbx
0x3ed6043: cmp dword ptr [rsi + 0x84], 0
0x3ed604a: je 0x143ed6060
0x3ed604c: jmp 0x143ed6055
0x3ed604e: lea rax, [rsi + 0xa0]
0x3ed6055: or byte ptr [r15 + 0xb3], 8
0x3ed605d: mov rbx, rax
0x3ed6060: mov rcx, rsi
0x3ed6063: call 0x143edcf10
0x3ed6068: test r12b, r12b
0x3ed606b: je 0x143ed6099
0x3ed606d: mov rcx, rsi
0x3ed6070: call 0x14063e140
0x3ed6075: mov rax, qword ptr [rbx]
0x3ed6078: test rax, rax
0x3ed607b: je 0x143ed6084
0x3ed607d: cmp qword ptr [rax + 8], 0
0x3ed6082: jne 0x143ed6099
0x3ed6084: mov rcx, qword ptr [rsi + 0x20]
0x3ed6088: test rcx, rcx
0x3ed608b: je 0x143ed6099
0x3ed608d: cmp qword ptr [rcx + 0x28], 0
0x3ed6092: je 0x143ed6099
0x3ed6094: call 0x1435c66a0
0x3ed6099: mov rax, qword ptr [rsi + 0xd8]
0x3ed60a0: test rax, rax
0x3ed60a3: je 0x143ed614e
0x3ed60a9: mov rdx, qword ptr [rsi + 0xa0]
0x3ed60b0: test rdx, rdx
0x3ed60b3: je 0x143ed60bf
0x3ed60b5: cmp qword ptr [rdx + 8], 0
0x3ed60ba: mov r8, r14
0x3ed60bd: jne 0x143ed60c2
0x3ed60bf: mov r8, rax
0x3ed60c2: cmp qword ptr [r8 + 0x10], 0
0x3ed60c7: je 0x143ed614e
0x3ed60cd: test rdx, rdx
0x3ed60d0: je 0x143ed60dc
0x3ed60d2: cmp qword ptr [rdx + 8], 0
0x3ed60d7: je 0x143ed60dc
0x3ed60d9: mov rax, r14
0x3ed60dc: test rax, rax
0x3ed60df: je 0x143ed614e
0x3ed60e1: mov rax, qword ptr [rsi + 0xd8]
0x3ed60e8: test rdx, rdx
0x3ed60eb: je 0x143ed60f7
0x3ed60ed: cmp qword ptr [rdx + 8], 0
0x3ed60f2: mov r8, r14
0x3ed60f5: jne 0x143ed60fa
0x3ed60f7: mov r8, rax
0x3ed60fa: cmp qword ptr [r8 + 0x10], 0
0x3ed60ff: je 0x143ed610d
0x3ed6101: test rdx, rdx
0x3ed6104: je 0x143ed6110
0x3ed6106: cmp qword ptr [rdx + 8], 0
0x3ed610b: je 0x143ed6110
0x3ed610d: mov rax, r14
0x3ed6110: cmp qword ptr [rax + 0x10], 0
0x3ed6115: je 0x143ed614e
0x3ed6117: mov rcx, qword ptr [rsi + 0xd8]
0x3ed611e: test rdx, rdx
0x3ed6121: je 0x143ed612d
0x3ed6123: cmp qword ptr [rdx + 8], 0
0x3ed6128: mov r8, r14
0x3ed612b: jne 0x143ed6130
0x3ed612d: mov r8, rcx
0x3ed6130: cmp qword ptr [r8 + 0x10], 0
0x3ed6135: je 0x143ed6146
0x3ed6137: test rdx, rdx
0x3ed613a: je 0x143ed6143
0x3ed613c: cmp qword ptr [rdx + 8], 0
0x3ed6141: jne 0x143ed6146
0x3ed6143: mov r14, rcx
0x3ed6146: mov rcx, r14
0x3ed6149: call 0x143e75970
0x3ed614e: cmp dword ptr [rbp + 0x60], r13d
0x3ed6152: jbe 0x143ed615d
0x3ed6154: mov rcx, r15
0x3ed6157: call 0x143ede590
0x3ed615c: nop 
0x3ed615d: lea rcx, [rbp - 0x48]
0x3ed6161: call 0x14038ad90
0x3ed6166: add rsp, 0x68
0x3ed616a: pop r15
0x3ed616c: pop r14
0x3ed616e: pop r13
0x3ed6170: pop r12
0x3ed6172: pop rdi
0x3ed6173: pop rsi
0x3ed6174: pop rbx
0x3ed6175: pop rbp
0x3ed6176: ret 
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
CALLEE 0xd4c5c0
0xd4c5c0: mov qword ptr [rsp + 0x10], rbx
0xd4c5c5: mov qword ptr [rsp + 0x18], rbp
0xd4c5ca: push rsi
0xd4c5cb: push rdi
0xd4c5cc: push r12
0xd4c5ce: push r14
0xd4c5d0: push r15
0xd4c5d2: sub rsp, 0x30
0xd4c5d6: mov r15, r9
0xd4c5d9: mov r12, r8
0xd4c5dc: mov rbp, rdx
0xd4c5df: mov r14, rcx
0xd4c5e2: mov rcx, qword ptr [rcx]
0xd4c5e5: mov rax, qword ptr [rcx + 0xa0]
0xd4c5ec: test rax, rax
0xd4c5ef: je 0x140d4c5fc
0xd4c5f1: cmp qword ptr [rax + 8], 0
0xd4c5f6: jne 0x140d4c7a7
0xd4c5fc: mov rsi, qword ptr [rcx + 0x20]
0xd4c600: cmp qword ptr [rsi + 0x30], 0
0xd4c605: jne 0x140d4c764
0xd4c60b: mov edx, 0x1fd
0xd4c610: mov rax, qword ptr gs:[0x58]
0xd4c619: mov rcx, qword ptr [rax]
0xd4c61c: cmp byte ptr [rdx + rcx], 0
0xd4c620: mov edx, 0x10
0xd4c625: mov ecx, 0xb0
0xd4c62a: je 0x140d4c633
0xd4c62c: call 0x1447efa78
0xd4c631: jmp 0x140d4c638
0xd4c633: call 0x1447ef9b0
0xd4c638: mov rbx, rax
0xd4c63b: test rax, rax
0xd4c63e: jne 0x140d4c65b
0xd4c640: call 0x141318e70
0xd4c645: xor r9d, r9d
0xd4c648: xor r8d, r8d
0xd4c64b: mov edx, 1
0xd4c650: mov ecx, 0xa0000002
0xd4c655: call qword ptr [rip + 0x449eaed]
0xd4c65b: mov qword ptr [rsp + 0x60], rbx
0xd4c660: xor edi, edi
0xd4c662: test rbx, rbx
0xd4c665: je 0x140d4c74e
0xd4c66b: mov dword ptr [rsp + 0x80], edi
0xd4c672: mov r9d, 0x2ffff
0xd4c678: mov r8d, 1
0xd4c67e: lea rdx, [rip + 0x484040b]
0xd4c685: lea rcx, [rsp + 0x80]
0xd4c68d: call 0x1412becb0
0xd4c692: mov dword ptr [rbx], edi
0xd4c694: mov byte ptr [rbx + 4], dil
0xd4c698: mov dword ptr [rbx + 8], edi
0xd4c69b: mov byte ptr [rbx + 0xc], dil
0xd4c69f: mov dword ptr [rbx + 0x10], edi
0xd4c6a2: mov byte ptr [rbx + 0x14], dil
0xd4c6a6: mov dword ptr [rbx + 0x18], edi
0xd4c6a9: mov byte ptr [rbx + 0x1c], dil
0xd4c6ad: mov dword ptr [rbx + 0x20], 0x3f800000
0xd4c6b4: mov byte ptr [rbx + 0x24], dil
0xd4c6b8: mov dword ptr [rbx + 0x28], 0x3f800000
0xd4c6bf: mov byte ptr [rbx + 0x2c], dil
0xd4c6c3: mov dword ptr [rbx + 0x30], 0x3f800000
0xd4c6ca: mov byte ptr [rbx + 0x34], dil
0xd4c6ce: mov dword ptr [rbx + 0x38], edi
0xd4c6d1: mov byte ptr [rbx + 0x3c], dil
0xd4c6d5: mov dword ptr [rbx + 0x40], edi
0xd4c6d8: mov byte ptr [rbx + 0x44], dil
0xd4c6dc: mov dword ptr [rbx + 0x48], edi
0xd4c6df: mov byte ptr [rbx + 0x4c], dil
0xd4c6e3: mov dword ptr [rbx + 0x50], edi
0xd4c6e6: mov byte ptr [rbx + 0x54], dil
0xd4c6ea: mov dword ptr [rbx + 0x58], edi
0xd4c6ed: mov byte ptr [rbx + 0x5c], dil
0xd4c6f1: mov dword ptr [rbx + 0x60], edi
0xd4c6f4: mov byte ptr [rbx + 0x64], dil
0xd4c6f8: mov dword ptr [rbx + 0x68], edi
0xd4c6fb: mov qword ptr [rbx + 0x70], rdi
0xd4c6ff: mov qword ptr [rbx + 0x78], rdi
0xd4c703: mov qword ptr [rbx + 0x80], rdi
0xd4c70a: mov qword ptr [rbx + 0x88], rdi
0xd4c711: mov dword ptr [rbx + 0x90], edi
0xd4c717: xor eax, eax
0xd4c719: mov word ptr [rbx + 0x94], ax
0xd4c720: mov byte ptr [rbx + 0x96], 1
0xd4c727: mov qword ptr [rbx + 0x98], rdi
0xd4c72e: mov qword ptr [rbx + 0xa0], rdi
0xd4c735: mov eax, dword ptr [rsp + 0x80]
0xd4c73c: mov dword ptr [rbx + 0xa8], eax
0xd4c742: mov dword ptr [rbx + 0xac], 0xff000000
0xd4c74c: jmp 0x140d4c751
0xd4c74e: mov rbx, rdi
0xd4c751: cmp rbx, qword ptr [rsi + 0x30]
0xd4c755: je 0x140d4c764
0xd4c757: lea rcx, [rsi + 0x30]
0xd4c75b: call 0x14061a7b0
0xd4c760: mov qword ptr [rsi + 0x30], rbx
0xd4c764: mov byte ptr [rsp + 0x80], 0
0xd4c76c: mov rax, qword ptr [r14]
0xd4c76f: mov rcx, qword ptr [rax + 0x20]
0xd4c773: lea rax, [rsp + 0x80]
0xd4c77b: mov qword ptr [rsp + 0x20], rax
0xd4c780: mov r9, r15
0xd4c783: mov r8, r12
0xd4c786: mov rdx, rbp
0xd4c789: mov rcx, qword ptr [rcx + 0x30]
0xd4c78d: call 0x140d4cf20
0xd4c792: cmp byte ptr [rsp + 0x80], 0
0xd4c79a: jne 0x140d4c7a7
0xd4c79c: mov rdx, rbp
0xd4c79f: mov rcx, r14
0xd4c7a2: call 0x1435c72e0
0xd4c7a7: mov rbx, qword ptr [rsp + 0x68]
0xd4c7ac: mov rbp, qword ptr [rsp + 0x70]
0xd4c7b1: add rsp, 0x30
0xd4c7b5: pop r15
0xd4c7b7: pop r14
0xd4c7b9: pop r12
0xd4c7bb: pop rdi
0xd4c7bc: pop rsi
0xd4c7bd: ret 
CALLEE 0xd8ba50
0xd8ba50: push rbp
0xd8ba52: push rbx
0xd8ba53: push rsi
0xd8ba54: push rdi
0xd8ba55: push r14
0xd8ba57: mov rbp, rsp
0xd8ba5a: sub rsp, 0x40
0xd8ba5e: mov rdi, rcx
0xd8ba61: mov r14, qword ptr [rcx + 8]
0xd8ba65: mov rbx, qword ptr [r14 + 0x20]
0xd8ba69: mov byte ptr [rbp + 0x30], 0
0xd8ba6d: add rcx, 0xde
0xd8ba74: call 0x140537250
0xd8ba79: imul edx, dword ptr [rax + 0x5c], 0x186a0
0xd8ba80: vmovss xmm0, dword ptr [rdi + 0xe8]
0xd8ba88: vmulss xmm0, xmm0, dword ptr [rip + 0x4fe7310]
0xd8ba90: vcvttss2si eax, xmm0
0xd8ba94: sub edx, eax
0xd8ba96: mov dword ptr [rbp + 0x40], edx
0xd8ba99: mov byte ptr [rbp + 0x38], 0x3e
0xd8ba9d: lea r9, [rbp + 0x30]
0xd8baa1: lea r8, [rbp + 0x40]
0xd8baa5: lea rdx, [rbp + 0x38]
0xd8baa9: mov rcx, rbx
0xd8baac: call 0x140d4c5c0
0xd8bab1: cmp byte ptr [rdi + 0x1ee], 0
0xd8bab8: je 0x140d8bad5
0xd8baba: lea rcx, [rdi + 0xde]
0xd8bac1: call 0x140537250
0xd8bac6: lea rcx, [rax + 0x22]
0xd8baca: call 0x140388e00
0xd8bacf: mov rcx, qword ptr [rax + 0x18]
0xd8bad3: jmp 0x140d8baea
0xd8bad5: mov ecx, dword ptr [rip + 0x5f44621]
0xd8badb: shl rcx, 4
0xd8badf: mov rax, qword ptr [rip + 0x5f01202]
0xd8bae6: add rcx, qword ptr [rax + 0x58]
0xd8baea: mov rdx, qword ptr [rcx]
0xd8baed: xor esi, esi
0xd8baef: test rdx, rdx
0xd8baf2: je 0x140d8bb82
0xd8baf8: cmp byte ptr [rdx], sil
0xd8bafb: je 0x140d8bb82
0xd8bb01: mov qword ptr [rbp - 0x10], rsi
0xd8bb05: lea rax, [rip + 0x5cd9e34]
0xd8bb0c: mov qword ptr [rbp - 0x10], rax
0xd8bb10: mov byte ptr [rbp - 8], 6
0xd8bb14: mov byte ptr [rbp - 8], 2
0xd8bb18: lea rcx, [rbp - 0x10]
0xd8bb1c: call 0x1403d5f80
0xd8bb21: lea rcx, [rbp - 0x10]
0xd8bb25: call 0x14141fe80
0xd8bb2a: lea rcx, [rbp - 0x10]
0xd8bb2e: call 0x141420260
0xd8bb33: nop 
0xd8bb34: mov rax, qword ptr [rdi]
0xd8bb37: mov rcx, rdi
0xd8bb3a: call qword ptr [rax + 0x110]
0xd8bb40: lea rdx, [rbp - 0x10]
0xd8bb44: mov rcx, qword ptr [rax + 0x311e8]
0xd8bb4b: call 0x143f321f0
0xd8bb50: test al, al
0xd8bb52: je 0x140d8bb79
0xd8bb54: mov rax, qword ptr [rdi + 0x118]
0xd8bb5b: mov rcx, qword ptr [rax + 0x20]
0xd8bb5f: mov byte ptr [rbp + 0x30], sil
0xd8bb63: mov byte ptr [rbp + 0x38], 0x26
0xd8bb67: lea r9, [rbp + 0x30]
0xd8bb6b: lea r8, [rbp - 0x10]
0xd8bb6f: lea rdx, [rbp + 0x38]
0xd8bb73: call 0x14064b880
0xd8bb78: nop 
0xd8bb79: lea rcx, [rbp - 0x10]
0xd8bb7d: call 0x140394db0
0xd8bb82: xor r8d, r8d
0xd8bb85: lea rdx, [rip + 0x5f445d0]
0xd8bb8c: mov rcx, r14
0xd8bb8f: call 0x143eda3d0
0xd8bb94: test rax, rax
0xd8bb97: je 0x140d8bcc6
0xd8bb9d: cmp byte ptr [rax], 0
0xd8bba0: je 0x140d8bcc6
0xd8bba6: mov byte ptr [rbp + 0x30], 0
0xd8bbaa: lea rdx, [rbp + 0x30]
0xd8bbae: mov rcx, rax
0xd8bbb1: call 0x141423cd0
0xd8bbb6: cmp byte ptr [rbp + 0x30], 1
0xd8bbba: jne 0x140d8bcc6
0xd8bbc0: mov rcx, qword ptr [rdi + 0x118]
0xd8bbc7: xor edx, edx
0xd8bbc9: mov rcx, qword ptr [rcx + 0x30]
0xd8bbcd: call 0x1435c3500
0xd8bbd2: mov rbx, rax
0xd8bbd5: test rax, rax
0xd8bbd8: je 0x140d8bcc6
0xd8bbde: mov rcx, qword ptr [rdi + 0x118]
0xd8bbe5: mov rdx, qword ptr [rcx + 0x18]
0xd8bbe9: mov rax, qword ptr [rdx]
0xd8bbec: mov rcx, qword ptr [rax + 0xa0]
0xd8bbf3: test rcx, rcx
0xd8bbf6: je 0x140d8bbff
0xd8bbf8: cmp qword ptr [rcx + 8], 0
0xd8bbfd: jne 0x140d8bc3a
0xd8bbff: mov rax, qword ptr [rax + 0x20]
0xd8bc03: mov rcx, qword ptr [rax + 0x20]
0xd8bc07: mov dword ptr [rcx + 0x50], 0xc2480000
0xd8bc0e: mov rax, qword ptr [rdx]
0xd8bc11: mov rcx, qword ptr [rax + 0x20]
0xd8bc15: mov rax, qword ptr [rcx + 0x20]
0xd8bc19: mov dword ptr [rax + 0x58], 0xc2480000
0xd8bc20: mov rax, qword ptr [rdx]
0xd8bc23: mov rcx, qword ptr [rax + 0x20]
0xd8bc27: mov rax, qword ptr [rcx + 0x20]
0xd8bc2b: mov dword ptr [rax + 0x60], esi
0xd8bc2e: mov rcx, qword ptr [rdx]
0xd8bc31: mov rcx, qword ptr [rcx + 0x18]
0xd8bc35: call 0x140d438d0
0xd8bc3a: mov rax, qword ptr [rdi + 0x118]
0xd8bc41: mov rdx, qword ptr [rax + 0x18]
0xd8bc45: mov rax, qword ptr [rdx]
0xd8bc48: mov rcx, qword ptr [rax + 0x20]
0xd8bc4c: mov rax, qword ptr [rcx + 0x20]
0xd8bc50: mov byte ptr [rax + 0x54], 2
0xd8bc54: mov rax, qword ptr [rdx]
0xd8bc57: mov rcx, qword ptr [rax + 0x20]
0xd8bc5b: mov rax, qword ptr [rcx + 0x20]
0xd8bc5f: mov byte ptr [rax + 0x5c], 2
0xd8bc63: mov rax, qword ptr [rdx]
0xd8bc66: mov rcx, qword ptr [rax + 0x20]
0xd8bc6a: mov rax, qword ptr [rcx + 0x20]
0xd8bc6e: mov byte ptr [rax + 0x64], 2
0xd8bc72: mov rcx, qword ptr [rdx]
0xd8bc75: mov rcx, qword ptr [rcx + 0x18]
0xd8bc79: call 0x140d438d0
0xd8bc7e: mov rax, qword ptr [rdi + 0x118]
0xd8bc85: mov rcx, qword ptr [rax + 0x20]
0xd8bc89: mov byte ptr [rbp + 0x30], 0
0xd8bc8d: mov byte ptr [rbp + 0x38], 6
0xd8bc91: lea r8, [rbx + 0x60]
0xd8bc95: lea r9, [rbp + 0x30]
0xd8bc99: lea rdx, [rbp + 0x38]
0xd8bc9d: call 0x14064b570
0xd8bca2: mov rax, qword ptr [rdi + 0x118]
0xd8bca9: mov rcx, qword ptr [rax + 0x20]
0xd8bcad: mov byte ptr [rbp + 0x30], 0
0xd8bcb1: mov byte ptr [rbp + 0x38], 9
0xd8bcb5: lea r8, [rbx + 0x64]
0xd8bcb9: lea r9, [rbp + 0x30]
0xd8bcbd: lea rdx, [rbp + 0x38]
0xd8bcc1: call 0x14064b570
0xd8bcc6: mov al, 1
0xd8bcc8: add rsp, 0x40
0xd8bccc: pop r14
0xd8bcce: pop rdi
0xd8bccf: pop rsi
0xd8bcd0: pop rbx
0xd8bcd1: pop rbp
0xd8bcd2: ret 
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
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x389570
0x389570: mov qword ptr [rsp + 0x10], rbx
0x389575: mov qword ptr [rsp + 0x18], rbp
0x38957a: push rsi
0x38957b: push rdi
0x38957c: push r14
0x38957e: sub rsp, 0x50
0x389582: movzx edi, word ptr [rcx]
0x389585: mov rbx, qword ptr [rip + 0x69e04bc]
0x38958c: cmp edi, dword ptr [rbx + 8]
0x38958f: jae 0x140389678
0x389595: lea rsi, [rdi*8]
0x38959d: mov rax, qword ptr [rbx + 0x58]
0x3895a1: mov rax, qword ptr [rsi + rax]
0x3895a5: test rax, rax
0x3895a8: jne 0x140389682
0x3895ae: lea r14, [rbx + 0x90]
0x3895b5: cmp qword ptr [r14], rax
0x3895b8: jne 0x1403895df
0x3895ba: mov qword ptr [rsp + 0x20], r14
0x3895bf: xor r9d, r9d
0x3895c2: lea r8, [rip + 0x55755c7]
0x3895c9: mov rdx, qword ptr [rbx + 0x10]
0x3895cd: lea rcx, [rsp + 0x70]
0x3895d2: call 0x1425c5230
0x3895d7: mov eax, dword ptr [rsp + 0x70]
0x3895db: test eax, eax
0x3895dd: jne 0x140389659
0x3895df: call 0x141416af0
0x3895e4: add rax, 0x7d0
0x3895ea: mov qword ptr [rbx + 0x98], rax
0x3895f1: mov rcx, qword ptr [r14]
0x3895f4: mov rdx, qword ptr [rbx + 0x28]
0x3895f8: lea r14, [rip + 0x53986c1]
0x3895ff: mov qword ptr [rsp + 0x30], r14
0x389604: mov byte ptr [rsp + 0x38], 0
0x389609: lea rbp, [rip + 0x5398650]
0x389610: mov qword ptr [rsp + 0x30], rbp
0x389615: mov rax, qword ptr [rcx]
0x389618: mov qword ptr [rsp + 0x40], rax
0x38961d: mov eax, dword ptr [rcx + 0xc]
0x389620: mov dword ptr [rsp + 0x48], eax
0x389624: mov dword ptr [rsp + 0x4c], 0
0x38962c: mov eax, dword ptr [rdx + rsi + 4]
0x389630: mov dword ptr [rsp + 0x4c], eax
0x389634: lea r9, [rsp + 0x30]
0x389639: movzx r8d, di
0x38963d: lea rdx, [rsp + 0x70]
0x389642: mov rcx, rbx
0x389645: call 0x14038b130
0x38964a: nop 
0x38964b: mov qword ptr [rsp + 0x30], rbp
0x389650: mov qword ptr [rsp + 0x30], r14
0x389655: mov eax, dword ptr [rsp + 0x70]
0x389659: mov rcx, qword ptr [rip + 0x695f9d0]
0x389660: test eax, eax
0x389662: je 0x140389669
0x389664: mov rax, rcx
0x389667: jmp 0x140389671
0x389669: mov rax, qword ptr [rbx + 0x58]
0x38966d: mov rax, qword ptr [rsi + rax]
0x389671: test rax, rax
0x389674: je 0x14038967f
0x389676: jmp 0x140389682
0x389678: mov rcx, qword ptr [rip + 0x695f9b1]
0x38967f: mov rax, rcx
0x389682: mov rbx, qword ptr [rsp + 0x78]
0x389687: mov rbp, qword ptr [rsp + 0x80]
0x38968f: add rsp, 0x50
0x389693: pop r14
0x389695: pop rdi
0x389696: pop rsi
0x389697: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x389570
0x389570: mov qword ptr [rsp + 0x10], rbx
0x389575: mov qword ptr [rsp + 0x18], rbp
0x38957a: push rsi
0x38957b: push rdi
0x38957c: push r14
0x38957e: sub rsp, 0x50
0x389582: movzx edi, word ptr [rcx]
0x389585: mov rbx, qword ptr [rip + 0x69e04bc]
0x38958c: cmp edi, dword ptr [rbx + 8]
0x38958f: jae 0x140389678
0x389595: lea rsi, [rdi*8]
0x38959d: mov rax, qword ptr [rbx + 0x58]
0x3895a1: mov rax, qword ptr [rsi + rax]
0x3895a5: test rax, rax
0x3895a8: jne 0x140389682
0x3895ae: lea r14, [rbx + 0x90]
0x3895b5: cmp qword ptr [r14], rax
0x3895b8: jne 0x1403895df
0x3895ba: mov qword ptr [rsp + 0x20], r14
0x3895bf: xor r9d, r9d
0x3895c2: lea r8, [rip + 0x55755c7]
0x3895c9: mov rdx, qword ptr [rbx + 0x10]
0x3895cd: lea rcx, [rsp + 0x70]
0x3895d2: call 0x1425c5230
0x3895d7: mov eax, dword ptr [rsp + 0x70]
0x3895db: test eax, eax
0x3895dd: jne 0x140389659
0x3895df: call 0x141416af0
0x3895e4: add rax, 0x7d0
0x3895ea: mov qword ptr [rbx + 0x98], rax
0x3895f1: mov rcx, qword ptr [r14]
0x3895f4: mov rdx, qword ptr [rbx + 0x28]
0x3895f8: lea r14, [rip + 0x53986c1]
0x3895ff: mov qword ptr [rsp + 0x30], r14
0x389604: mov byte ptr [rsp + 0x38], 0
0x389609: lea rbp, [rip + 0x5398650]
0x389610: mov qword ptr [rsp + 0x30], rbp
0x389615: mov rax, qword ptr [rcx]
0x389618: mov qword ptr [rsp + 0x40], rax
0x38961d: mov eax, dword ptr [rcx + 0xc]
0x389620: mov dword ptr [rsp + 0x48], eax
0x389624: mov dword ptr [rsp + 0x4c], 0
0x38962c: mov eax, dword ptr [rdx + rsi + 4]
0x389630: mov dword ptr [rsp + 0x4c], eax
0x389634: lea r9, [rsp + 0x30]
0x389639: movzx r8d, di
0x38963d: lea rdx, [rsp + 0x70]
0x389642: mov rcx, rbx
0x389645: call 0x14038b130
0x38964a: nop 
0x38964b: mov qword ptr [rsp + 0x30], rbp
0x389650: mov qword ptr [rsp + 0x30], r14
0x389655: mov eax, dword ptr [rsp + 0x70]
0x389659: mov rcx, qword ptr [rip + 0x695f9d0]
0x389660: test eax, eax
0x389662: je 0x140389669
0x389664: mov rax, rcx
0x389667: jmp 0x140389671
0x389669: mov rax, qword ptr [rbx + 0x58]
0x38966d: mov rax, qword ptr [rsi + rax]
0x389671: test rax, rax
0x389674: je 0x14038967f
0x389676: jmp 0x140389682
0x389678: mov rcx, qword ptr [rip + 0x695f9b1]
0x38967f: mov rax, rcx
0x389682: mov rbx, qword ptr [rsp + 0x78]
0x389687: mov rbp, qword ptr [rsp + 0x80]
0x38968f: add rsp, 0x50
0x389693: pop r14
0x389695: pop rdi
0x389696: pop rsi
0x389697: ret 
CALLEE 0x670050
0x670050: mov qword ptr [rsp + 0x10], rbx
0x670055: mov qword ptr [rsp + 0x18], rbp
0x67005a: push rsi
0x67005b: push rdi
0x67005c: push r14
0x67005e: sub rsp, 0x50
0x670062: movzx edi, word ptr [rcx]
0x670065: mov rbx, qword ptr [rip + 0x6701ddc]
0x67006c: cmp edi, dword ptr [rbx + 8]
0x67006f: jae 0x140670158
0x670075: lea rsi, [rdi*8]
0x67007d: mov rax, qword ptr [rbx + 0x58]
0x670081: mov rax, qword ptr [rsi + rax]
0x670085: test rax, rax
0x670088: jne 0x140670162
0x67008e: lea r14, [rbx + 0x90]
0x670095: cmp qword ptr [r14], rax
0x670098: jne 0x1406700bf
0x67009a: mov qword ptr [rsp + 0x20], r14
0x67009f: xor r9d, r9d
0x6700a2: lea r8, [rip + 0x53506bf]
0x6700a9: mov rdx, qword ptr [rbx + 0x10]
0x6700ad: lea rcx, [rsp + 0x70]
0x6700b2: call 0x1425c5230
0x6700b7: mov eax, dword ptr [rsp + 0x70]
0x6700bb: test eax, eax
0x6700bd: jne 0x140670139
0x6700bf: call 0x141416af0
0x6700c4: add rax, 0x7d0
0x6700ca: mov qword ptr [rbx + 0x98], rax
0x6700d1: mov rcx, qword ptr [r14]
0x6700d4: mov rdx, qword ptr [rbx + 0x28]
0x6700d8: lea r14, [rip + 0x50b1be1]
0x6700df: mov qword ptr [rsp + 0x30], r14
0x6700e4: mov byte ptr [rsp + 0x38], 0
0x6700e9: lea rbp, [rip + 0x50b1b70]
0x6700f0: mov qword ptr [rsp + 0x30], rbp
0x6700f5: mov rax, qword ptr [rcx]
0x6700f8: mov qword ptr [rsp + 0x40], rax
0x6700fd: mov eax, dword ptr [rcx + 0xc]
0x670100: mov dword ptr [rsp + 0x48], eax
0x670104: mov dword ptr [rsp + 0x4c], 0
0x67010c: mov eax, dword ptr [rdx + rsi + 4]
0x670110: mov dword ptr [rsp + 0x4c], eax
0x670114: lea r9, [rsp + 0x30]
0x670119: movzx r8d, di
0x67011d: lea rdx, [rsp + 0x70]
0x670122: mov rcx, rbx
0x670125: call 0x1406710b0
0x67012a: nop 
0x67012b: mov qword ptr [rsp + 0x30], rbp
0x670130: mov qword ptr [rsp + 0x30], r14
0x670135: mov eax, dword ptr [rsp + 0x70]
0x670139: mov rcx, qword ptr [rip + 0x668e460]
0x670140: test eax, eax
0x670142: je 0x140670149
0x670144: mov rax, rcx
0x670147: jmp 0x140670151
0x670149: mov rax, qword ptr [rbx + 0x58]
0x67014d: mov rax, qword ptr [rsi + rax]
0x670151: test rax, rax
0x670154: je 0x14067015f
0x670156: jmp 0x140670162
0x670158: mov rcx, qword ptr [rip + 0x668e441]
0x67015f: mov rax, rcx
0x670162: mov rbx, qword ptr [rsp + 0x78]
0x670167: mov rbp, qword ptr [rsp + 0x80]
0x67016f: add rsp, 0x50
0x670173: pop r14
0x670175: pop rdi
0x670176: pop rsi
0x670177: ret 
CALLEE 0x670050
0x670050: mov qword ptr [rsp + 0x10], rbx
0x670055: mov qword ptr [rsp + 0x18], rbp
0x67005a: push rsi
0x67005b: push rdi
0x67005c: push r14
0x67005e: sub rsp, 0x50
0x670062: movzx edi, word ptr [rcx]
0x670065: mov rbx, qword ptr [rip + 0x6701ddc]
0x67006c: cmp edi, dword ptr [rbx + 8]
0x67006f: jae 0x140670158
0x670075: lea rsi, [rdi*8]
0x67007d: mov rax, qword ptr [rbx + 0x58]
0x670081: mov rax, qword ptr [rsi + rax]
0x670085: test rax, rax
0x670088: jne 0x140670162
0x67008e: lea r14, [rbx + 0x90]
0x670095: cmp qword ptr [r14], rax
0x670098: jne 0x1406700bf
0x67009a: mov qword ptr [rsp + 0x20], r14
0x67009f: xor r9d, r9d
0x6700a2: lea r8, [rip + 0x53506bf]
0x6700a9: mov rdx, qword ptr [rbx + 0x10]
0x6700ad: lea rcx, [rsp + 0x70]
0x6700b2: call 0x1425c5230
0x6700b7: mov eax, dword ptr [rsp + 0x70]
0x6700bb: test eax, eax
0x6700bd: jne 0x140670139
0x6700bf: call 0x141416af0
0x6700c4: add rax, 0x7d0
0x6700ca: mov qword ptr [rbx + 0x98], rax
0x6700d1: mov rcx, qword ptr [r14]
0x6700d4: mov rdx, qword ptr [rbx + 0x28]
0x6700d8: lea r14, [rip + 0x50b1be1]
0x6700df: mov qword ptr [rsp + 0x30], r14
0x6700e4: mov byte ptr [rsp + 0x38], 0
0x6700e9: lea rbp, [rip + 0x50b1b70]
0x6700f0: mov qword ptr [rsp + 0x30], rbp
0x6700f5: mov rax, qword ptr [rcx]
0x6700f8: mov qword ptr [rsp + 0x40], rax
0x6700fd: mov eax, dword ptr [rcx + 0xc]
0x670100: mov dword ptr [rsp + 0x48], eax
0x670104: mov dword ptr [rsp + 0x4c], 0
0x67010c: mov eax, dword ptr [rdx + rsi + 4]
0x670110: mov dword ptr [rsp + 0x4c], eax
0x670114: lea r9, [rsp + 0x30]
0x670119: movzx r8d, di
0x67011d: lea rdx, [rsp + 0x70]
0x670122: mov rcx, rbx
0x670125: call 0x1406710b0
0x67012a: nop 
0x67012b: mov qword ptr [rsp + 0x30], rbp
0x670130: mov qword ptr [rsp + 0x30], r14
0x670135: mov eax, dword ptr [rsp + 0x70]
0x670139: mov rcx, qword ptr [rip + 0x668e460]
0x670140: test eax, eax
0x670142: je 0x140670149
0x670144: mov rax, rcx
0x670147: jmp 0x140670151
0x670149: mov rax, qword ptr [rbx + 0x58]
0x67014d: mov rax, qword ptr [rsi + rax]
0x670151: test rax, rax
0x670154: je 0x14067015f
0x670156: jmp 0x140670162
0x670158: mov rcx, qword ptr [rip + 0x668e441]
0x67015f: mov rax, rcx
0x670162: mov rbx, qword ptr [rsp + 0x78]
0x670167: mov rbp, qword ptr [rsp + 0x80]
0x67016f: add rsp, 0x50
0x670173: pop r14
0x670175: pop rdi
0x670176: pop rsi
0x670177: ret 
CALLEE 0x670050
0x670050: mov qword ptr [rsp + 0x10], rbx
0x670055: mov qword ptr [rsp + 0x18], rbp
0x67005a: push rsi
0x67005b: push rdi
0x67005c: push r14
0x67005e: sub rsp, 0x50
0x670062: movzx edi, word ptr [rcx]
0x670065: mov rbx, qword ptr [rip + 0x6701ddc]
0x67006c: cmp edi, dword ptr [rbx + 8]
0x67006f: jae 0x140670158
0x670075: lea rsi, [rdi*8]
0x67007d: mov rax, qword ptr [rbx + 0x58]
0x670081: mov rax, qword ptr [rsi + rax]
0x670085: test rax, rax
0x670088: jne 0x140670162
0x67008e: lea r14, [rbx + 0x90]
0x670095: cmp qword ptr [r14], rax
0x670098: jne 0x1406700bf
0x67009a: mov qword ptr [rsp + 0x20], r14
0x67009f: xor r9d, r9d
0x6700a2: lea r8, [rip + 0x53506bf]
0x6700a9: mov rdx, qword ptr [rbx + 0x10]
0x6700ad: lea rcx, [rsp + 0x70]
0x6700b2: call 0x1425c5230
0x6700b7: mov eax, dword ptr [rsp + 0x70]
0x6700bb: test eax, eax
0x6700bd: jne 0x140670139
0x6700bf: call 0x141416af0
0x6700c4: add rax, 0x7d0
0x6700ca: mov qword ptr [rbx + 0x98], rax
0x6700d1: mov rcx, qword ptr [r14]
0x6700d4: mov rdx, qword ptr [rbx + 0x28]
0x6700d8: lea r14, [rip + 0x50b1be1]
0x6700df: mov qword ptr [rsp + 0x30], r14
0x6700e4: mov byte ptr [rsp + 0x38], 0
0x6700e9: lea rbp, [rip + 0x50b1b70]
0x6700f0: mov qword ptr [rsp + 0x30], rbp
0x6700f5: mov rax, qword ptr [rcx]
0x6700f8: mov qword ptr [rsp + 0x40], rax
0x6700fd: mov eax, dword ptr [rcx + 0xc]
0x670100: mov dword ptr [rsp + 0x48], eax
0x670104: mov dword ptr [rsp + 0x4c], 0
0x67010c: mov eax, dword ptr [rdx + rsi + 4]
0x670110: mov dword ptr [rsp + 0x4c], eax
0x670114: lea r9, [rsp + 0x30]
0x670119: movzx r8d, di
0x67011d: lea rdx, [rsp + 0x70]
0x670122: mov rcx, rbx
0x670125: call 0x1406710b0
0x67012a: nop 
0x67012b: mov qword ptr [rsp + 0x30], rbp
0x670130: mov qword ptr [rsp + 0x30], r14
0x670135: mov eax, dword ptr [rsp + 0x70]
0x670139: mov rcx, qword ptr [rip + 0x668e460]
0x670140: test eax, eax
0x670142: je 0x140670149
0x670144: mov rax, rcx
0x670147: jmp 0x140670151
0x670149: mov rax, qword ptr [rbx + 0x58]
0x67014d: mov rax, qword ptr [rsi + rax]
0x670151: test rax, rax
0x670154: je 0x14067015f
0x670156: jmp 0x140670162
0x670158: mov rcx, qword ptr [rip + 0x668e441]
0x67015f: mov rax, rcx
0x670162: mov rbx, qword ptr [rsp + 0x78]
0x670167: mov rbp, qword ptr [rsp + 0x80]
0x67016f: add rsp, 0x50
0x670173: pop r14
0x670175: pop rdi
0x670176: pop rsi
0x670177: ret 
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
CALLEE 0x64f4f0
0x64f4f0: mov qword ptr [rsp + 0x10], rdx
0x64f4f5: push rbx
0x64f4f6: sub rsp, 0x30
0x64f4fa: mov rbx, rdx
0x64f4fd: mov dword ptr [rsp + 0x20], 0
0x64f505: mov rcx, qword ptr [rip + 0x6719c84]
0x64f50c: mov rcx, qword ptr [rcx + 0x30]
0x64f510: call 0x1408b44e0
0x64f515: nop 
0x64f516: mov dword ptr [rsp + 0x20], 1
0x64f51e: mov rax, rbx
0x64f521: add rsp, 0x30
0x64f525: pop rbx
0x64f526: ret 
0x64f527: int3 
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
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0xde5f20
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
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0xcb7a70
0xcb7a70: mov qword ptr [rsp + 8], rbx
0xcb7a75: mov qword ptr [rsp + 0x10], rbp
0xcb7a7a: mov qword ptr [rsp + 0x18], rsi
0xcb7a7f: push rdi
0xcb7a80: push r14
0xcb7a82: push r15
0xcb7a84: sub rsp, 0xa0
0xcb7a8b: mov r15, r8
0xcb7a8e: mov rdi, rdx
0xcb7a91: mov rbx, rcx
0xcb7a94: mov r8, qword ptr [rsp + 0xe0]
0xcb7a9c: mov rdx, r9
0xcb7a9f: mov rcx, qword ptr [rcx + 8]
0xcb7aa3: call 0x143eda3d0
0xcb7aa8: mov rsi, rax
0xcb7aab: lea rax, [rsp + 0x50]
0xcb7ab0: mov qword ptr [rsp + 0x40], rax
0xcb7ab5: xor ebp, ebp
0xcb7ab7: mov dword ptr [rsp + 0x48], ebp
0xcb7abb: mov dword ptr [rsp + 0x4c], 0xa
0xcb7ac3: mov rax, qword ptr [rbx + 8]
0xcb7ac7: mov qword ptr [rsp + 0x20], rax
0xcb7acc: mov qword ptr [rsp + 0x28], rbp
0xcb7ad1: test rsi, rsi
0xcb7ad4: je 0x140cb7b0d
0xcb7ad6: cmp byte ptr [rsi], bpl
0xcb7ad9: je 0x140cb7b0d
0xcb7adb: mov rbx, 0xffffffffffffffff
0xcb7ae2: inc rbx
0xcb7ae5: cmp byte ptr [rsi + rbx], 0
0xcb7ae9: jne 0x140cb7ae2
0xcb7aeb: mov ecx, ebx
0xcb7aed: call 0x1414203f0
0xcb7af2: mov r14, rax
0xcb7af5: lea edx, [rbx + 1]
0xcb7af8: mov r9, 0xffffffffffffffff
0xcb7aff: mov r8, rsi
0xcb7b02: mov rcx, qword ptr [rax]
0xcb7b05: call qword ptr [rip + 0x45349a5]
0xcb7b0b: jmp 0x140cb7b14
0xcb7b0d: lea r14, [rip + 0x5dade2c]
0xcb7b14: mov qword ptr [rsp + 0x28], r14
0xcb7b19: mov qword ptr [rsp + 0x30], 1
0xcb7b22: mov word ptr [rsp + 0x38], 0x100
0xcb7b29: mov byte ptr [rsp + 0x38], 1
0xcb7b2e: lea rdx, [rsp + 0x40]
0xcb7b33: lea rcx, [rsp + 0x20]
0xcb7b38: call 0x143d1dab0
0xcb7b3d: nop 
0xcb7b3e: lea rcx, [rsp + 0x28]
0xcb7b43: call 0x140394db0
0xcb7b48: cmp dword ptr [rsp + 0x48], 0
0xcb7b4d: jne 0x140cb7b8b
0xcb7b4f: mov eax, dword ptr [rip + 0x6023fdb]
0xcb7b55: mov dword ptr [rdi], eax
0xcb7b57: lea rax, [rsp + 0x50]
0xcb7b5c: mov rcx, qword ptr [rsp + 0x40]
0xcb7b61: cmp rcx, rax
0xcb7b64: je 0x140cb7bca
0xcb7b66: test rcx, rcx
0xcb7b69: je 0x140cb7bca
0xcb7b6b: mov r8d, 0x1fd
0xcb7b71: mov rax, qword ptr gs:[0x58]
0xcb7b7a: mov rdx, qword ptr [rax]
0xcb7b7d: cmp byte ptr [r8 + rdx], 0
0xcb7b82: je 0x140cb7bc5
0xcb7b84: call 0x1447f03bc
0xcb7b89: jmp 0x140cb7bca
0xcb7b8b: mov rax, qword ptr [rsp + 0x40]
0xcb7b90: mov rcx, qword ptr [rax]
0xcb7b93: mov qword ptr [r15], rcx
0xcb7b96: mov dword ptr [rdi], ebp
0xcb7b98: lea rax, [rsp + 0x50]
0xcb7b9d: mov rcx, qword ptr [rsp + 0x40]
0xcb7ba2: cmp rcx, rax
0xcb7ba5: je 0x140cb7bca
0xcb7ba7: test rcx, rcx
0xcb7baa: je 0x140cb7bca
0xcb7bac: mov r8d, 0x1fd
0xcb7bb2: mov rax, qword ptr gs:[0x58]
0xcb7bbb: mov rdx, qword ptr [rax]
0xcb7bbe: cmp byte ptr [r8 + rdx], 0
0xcb7bc3: jne 0x140cb7b84
0xcb7bc5: call 0x1447f02bc
0xcb7bca: mov rax, rdi
0xcb7bcd: lea r11, [rsp + 0xa0]
0xcb7bd5: mov rbx, qword ptr [r11 + 0x20]
0xcb7bd9: mov rbp, qword ptr [r11 + 0x28]
0xcb7bdd: mov rsi, qword ptr [r11 + 0x30]
0xcb7be1: mov rsp, r11
0xcb7be4: pop r15
0xcb7be6: pop r14
0xcb7be8: pop rdi
0xcb7be9: ret 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x430020
0x430020: mov qword ptr [rsp + 0x10], rbx
0x430025: mov qword ptr [rsp + 0x18], rbp
0x43002a: push rsi
0x43002b: push rdi
0x43002c: push r14
0x43002e: sub rsp, 0x50
0x430032: movzx edi, word ptr [rcx]
0x430035: mov rbx, qword ptr [rip + 0x693be34]
0x43003c: cmp edi, dword ptr [rbx + 8]
0x43003f: jae 0x140430128
0x430045: lea rsi, [rdi*8]
0x43004d: mov rax, qword ptr [rbx + 0x58]
0x430051: mov rax, qword ptr [rsi + rax]
0x430055: test rax, rax
0x430058: jne 0x140430132
0x43005e: lea r14, [rbx + 0x90]
0x430065: cmp qword ptr [r14], rax
0x430068: jne 0x14043008f
0x43006a: mov qword ptr [rsp + 0x20], r14
0x43006f: xor r9d, r9d
0x430072: mov r8, qword ptr [rip + 0x566ab07]
0x430079: mov rdx, qword ptr [rbx + 0x10]
0x43007d: lea rcx, [rsp + 0x70]
0x430082: call 0x1425c5230
0x430087: mov eax, dword ptr [rsp + 0x70]
0x43008b: test eax, eax
0x43008d: jne 0x140430109
0x43008f: call 0x141416af0
0x430094: add rax, 0x7d0
0x43009a: mov qword ptr [rbx + 0x98], rax
0x4300a1: mov rcx, qword ptr [r14]
0x4300a4: mov rdx, qword ptr [rbx + 0x28]
0x4300a8: lea r14, [rip + 0x52f1c11]
0x4300af: mov qword ptr [rsp + 0x30], r14
0x4300b4: mov byte ptr [rsp + 0x38], 0
0x4300b9: lea rbp, [rip + 0x52f1ba0]
0x4300c0: mov qword ptr [rsp + 0x30], rbp
0x4300c5: mov rax, qword ptr [rcx]
0x4300c8: mov qword ptr [rsp + 0x40], rax
0x4300cd: mov eax, dword ptr [rcx + 0xc]
0x4300d0: mov dword ptr [rsp + 0x48], eax
0x4300d4: mov dword ptr [rsp + 0x4c], 0
0x4300dc: mov eax, dword ptr [rdx + rsi + 4]
0x4300e0: mov dword ptr [rsp + 0x4c], eax
0x4300e4: lea r9, [rsp + 0x30]
0x4300e9: movzx r8d, di
0x4300ed: lea rdx, [rsp + 0x70]
0x4300f2: mov rcx, rbx
0x4300f5: call 0x140433880
0x4300fa: nop 
0x4300fb: mov qword ptr [rsp + 0x30], rbp
0x430100: mov qword ptr [rsp + 0x30], r14
0x430105: mov eax, dword ptr [rsp + 0x70]
0x430109: mov rcx, qword ptr [rip + 0x68af5d0]
0x430110: test eax, eax
0x430112: je 0x140430119
0x430114: mov rax, rcx
0x430117: jmp 0x140430121
0x430119: mov rax, qword ptr [rbx + 0x58]
0x43011d: mov rax, qword ptr [rsi + rax]
0x430121: test rax, rax
0x430124: je 0x14043012f
0x430126: jmp 0x140430132
0x430128: mov rcx, qword ptr [rip + 0x68af5b1]
0x43012f: mov rax, rcx
0x430132: mov rbx, qword ptr [rsp + 0x78]
0x430137: mov rbp, qword ptr [rsp + 0x80]
0x43013f: add rsp, 0x50
0x430143: pop r14
0x430145: pop rdi
0x430146: pop rsi
0x430147: ret 
CALLEE 0x1786710
0x1786710: mov qword ptr [rsp + 0x10], rbx
0x1786715: mov qword ptr [rsp + 0x18], rsi
0x178671a: mov qword ptr [rsp + 0x20], rdi
0x178671f: push r14
0x1786721: sub rsp, 0x860
0x1786728: movzx r10d, r9w
0x178672c: movzx r11d, r8w
0x1786730: mov rsi, rcx
0x1786733: cmp byte ptr [rcx], 2
0x1786736: jne 0x141786866
0x178673c: mov r8, rdx
0x178673f: mov dl, 4
0x1786741: lea rcx, [rsp + 0x20]
0x1786746: call 0x142239930
0x178674b: nop 
0x178674c: lea rax, [rip + 0x41cf90d]
0x1786753: mov qword ptr [rsp + 0x20], rax
0x1786758: mov word ptr [rsp + 0x850], r11w
0x1786761: mov word ptr [rsp + 0x852], r10w
0x178676a: lea rax, [rip + 0x52e47cf]
0x1786771: mov qword ptr [rsp + 0x858], rax
0x1786779: mov rdi, qword ptr [rsi + 0xf8]
0x1786780: mov eax, dword ptr [rsi + 0x100]
0x1786786: lea rbx, [rdi + rax*8]
0x178678a: mov r14, qword ptr [rsp + 0x8a0]
0x1786792: cmp rdi, rbx
0x1786795: je 0x1417867cd
0x1786797: mov rcx, rdi
0x178679a: call 0x1403a0670
0x178679f: mov rcx, qword ptr [rax + 0x18]
0x17867a3: mov rax, qword ptr [rcx]
0x17867a6: xor r8d, r8d
0x17867a9: lea rdx, [rsp + 0x20]
0x17867ae: cmp qword ptr [rsp + 0x848], r8
0x17867b6: jne 0x1417867bd
0x17867b8: call qword ptr [rax + 8]
0x17867bb: jmp 0x1417867c0
0x17867bd: call qword ptr [rax + 0x10]
0x17867c0: test al, al
0x17867c2: jne 0x141786833
0x17867c4: add rdi, 8
0x17867c8: cmp rdi, rbx
0x17867cb: jne 0x141786797
0x17867cd: lea rax, [rip + 0x3dedcb4]
0x17867d4: mov qword ptr [rsp + 0x20], rax
0x17867d9: lea rax, [rsp + 0x30]
0x17867de: mov qword ptr [rsp + 0x870], rax
0x17867e6: lea rcx, [rsp + 0x30]
0x17867eb: call 0x1403a2ac0
0x17867f0: cmp byte ptr [rsp + 0x890], 0
0x17867f8: je 0x1417868b4
0x17867fe: mov rcx, rsi
0x1786801: call 0x140d87e60
0x1786806: test al, al
0x1786808: jne 0x1417868b4
0x178680e: movzx eax, byte ptr [rsp + 0x898]
0x1786816: cmp al, 4
0x1786818: jne 0x141786882
0x178681a: mov rcx, rsi
0x178681d: call 0x1417650f0
0x1786822: test al, al
0x1786824: jne 0x1417868b4
0x178682a: lea rcx, [rip + 0x3f25ab7]
0x1786831: jmp 0x141786894
0x1786833: movzx ebx, byte ptr [rdi + 2]
0x1786837: movzx eax, word ptr [rdi + 4]
0x178683b: mov word ptr [r14], ax
0x178683f: lea rax, [rip + 0x3dedc42]
0x1786846: mov qword ptr [rsp + 0x20], rax
0x178684b: lea rax, [rsp + 0x30]
0x1786850: mov qword ptr [rsp + 0x870], rax
0x1786858: lea rcx, [rsp + 0x30]
0x178685d: call 0x1403a2ac0
0x1786862: test bl, bl
0x1786864: jne 0x1417867f0
0x1786866: xor al, al
0x1786868: lea r11, [rsp + 0x860]
0x1786870: mov rbx, qword ptr [r11 + 0x18]
0x1786874: mov rsi, qword ptr [r11 + 0x20]
0x1786878: mov rdi, qword ptr [r11 + 0x28]
0x178687c: mov rsp, r11
0x178687f: pop r14
0x1786881: ret 
0x1786882: cmp al, 3
0x1786884: lea rcx, [rip + 0x40406f5]
0x178688b: je 0x141786894
0x178688d: lea rcx, [rip + 0x3f25a04]
0x1786894: call 0x141364680
0x1786899: mov edx, eax
0x178689b: lea rcx, [rsp + 0x870]
0x17868a3: call 0x14038ac90
0x17868a8: movzx eax, word ptr [rsp + 0x870]
0x17868b0: mov word ptr [r14], ax
0x17868b4: mov al, 1
0x17868b6: jmp 0x141786868
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x1434880
0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 
CALLEE 0x1434880
0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 
CALLEE 0xdecca0
0xdecca0: mov qword ptr [rsp + 8], rbx
0xdecca5: mov qword ptr [rsp + 0x18], rsi
0xdeccaa: push rbp
0xdeccab: push rdi
0xdeccac: push r14
0xdeccae: lea rbp, [rsp - 0x47]
0xdeccb3: sub rsp, 0xa0
0xdeccba: mov rdi, rcx
0xdeccbd: mov dword ptr [rcx + 0xd8], edx
0xdeccc3: cmp qword ptr [rcx + 0x1c8], 0
0xdecccb: jne 0x140decdde
0xdeccd1: cmp edx, -1
0xdeccd4: je 0x140decdde
0xdeccda: add rcx, 0xd8
0xdecce1: call 0x140473f20
0xdecce6: mov ecx, 0xffff
0xdecceb: cmp word ptr [rax + 0x368], cx
0xdeccf2: je 0x140decdde
0xdeccf8: lea rcx, [rdi + 0xd8]
0xdeccff: call 0x140473f20
0xdecd04: lea rcx, [rax + 0x368]
0xdecd0b: call 0x140389570
0xdecd10: cmp byte ptr [rax + 0x14b], 0
0xdecd17: je 0x140decdde
0xdecd1d: lea rdx, [rbp - 0x11]
0xdecd21: call 0x14064f530
0xdecd26: nop 
0xdecd27: lea r14, [rip + 0x493911a]
0xdecd2e: cmp byte ptr [rbp - 1], 0
0xdecd32: je 0x140decdd1
0xdecd38: lea rdx, [rbp + 0xf]
0xdecd3c: mov rcx, qword ptr [rbp - 9]
0xdecd40: call 0x1417fa6c0
0xdecd45: nop 
0xdecd46: cmp byte ptr [rbp + 0x1f], 0
0xdecd4a: je 0x140decd99
0xdecd4c: mov rbx, qword ptr [rbp + 0x17]
0xdecd50: lea rcx, [rdi + 0xd8]
0xdecd57: call 0x140473f20
0xdecd5c: lea rcx, [rax + 0x368]
0xdecd63: call 0x140389570
0xdecd68: mov r8d, dword ptr [rax]
0xdecd6b: lea rdx, [rbp + 0x6f]
0xdecd6f: mov rcx, rbx
0xdecd72: call 0x1420d5620
0xdecd77: mov r8d, dword ptr [rbp + 0x6f]
0xdecd7b: lea rdx, [rbp - 0x31]
0xdecd7f: call 0x14064f570
0xdecd84: nop 
0xdecd85: cmp byte ptr [rbp - 0x21], 0
0xdecd89: jne 0x140decdf6
0xdecd8b: mov qword ptr [rbp - 0x31], r14
0xdecd8f: lea rcx, [rbp - 0x31]
0xdecd93: call 0x141434880
0xdecd98: nop 
0xdecd99: lea rax, [rip + 0x4b260c0]
0xdecda0: mov qword ptr [rbp + 0xf], rax
0xdecda4: cmp byte ptr [rbp + 0x1f], 0
0xdecda8: je 0x140decdb8
0xdecdaa: mov rcx, qword ptr [rbp + 0x37]
0xdecdae: mov rax, qword ptr [rcx]
0xdecdb1: call qword ptr [rax + 0x148]
0xdecdb7: nop 
0xdecdb8: lea rax, [rip + 0x4786a81]
0xdecdbf: mov qword ptr [rbp + 0xf], rax
0xdecdc3: mov qword ptr [rbp + 0xf], r14
0xdecdc7: lea rcx, [rbp + 0xf]
0xdecdcb: call 0x141434880
0xdecdd0: nop 
0xdecdd1: mov qword ptr [rbp - 0x11], r14
0xdecdd5: lea rcx, [rbp - 0x11]
0xdecdd9: call 0x141434880
0xdecdde: lea r11, [rsp + 0xa0]
0xdecde6: mov rbx, qword ptr [r11 + 0x20]
0xdecdea: mov rsi, qword ptr [r11 + 0x30]
0xdecdee: mov rsp, r11
0xdecdf1: pop r14
0xdecdf3: pop rdi
0xdecdf4: pop rbp
0xdecdf5: ret 
0xdecdf6: mov rax, qword ptr [rbp - 0x29]
0xdecdfa: mov qword ptr [rdi + 0x1c8], rax
0xdece01: mov eax, dword ptr [rax + 0x60]
0xdece04: mov dword ptr [rdi + 0x1c4], eax
0xdece0a: mov qword ptr [rbp - 0x31], r14
0xdece0e: lea rcx, [rbp - 0x31]
0xdece12: call 0x141434880
0xdece17: nop 
0xdece18: lea rax, [rip + 0x4b26041]
0xdece1f: mov qword ptr [rbp + 0xf], rax
0xdece23: cmp byte ptr [rbp + 0x1f], 0
0xdece27: je 0x140dece37
0xdece29: mov rcx, qword ptr [rbp + 0x37]
0xdece2d: mov rax, qword ptr [rcx]
0xdece30: call qword ptr [rax + 0x148]
0xdece36: nop 
0xdece37: lea rax, [rip + 0x4786a02]
0xdece3e: mov qword ptr [rbp + 0xf], rax
0xdece42: mov qword ptr [rbp + 0xf], r14
0xdece46: lea rcx, [rbp + 0xf]
0xdece4a: call 0x141434880
0xdece4f: nop 
0xdece50: jmp 0x140decdd1
