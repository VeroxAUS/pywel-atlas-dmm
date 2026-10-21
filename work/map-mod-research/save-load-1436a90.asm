0x1436a90: mov qword ptr [rsp + 8], rbx
0x1436a95: mov qword ptr [rsp + 0x10], rbp
0x1436a9a: mov qword ptr [rsp + 0x20], rsi
0x1436a9f: push rdi
0x1436aa0: sub rsp, 0x20
0x1436aa4: movzx esi, dx
0x1436aa7: mov rdi, rcx
0x1436aaa: mov rax, qword ptr gs:[0x58]
0x1436ab3: mov rbx, qword ptr [rax]
0x1436ab6: mov ebp, 0x98
0x1436abb: cmp byte ptr [rbx + rbp], 0
0x1436abf: jne 0x141436ac6
0x1436ac1: call 0x1448953c4
0x1436ac6: mov eax, 0x1d2
0x1436acb: cmp byte ptr [rax + rbx], 0
0x1436acf: jne 0x141436b36
0x1436ad1: cmp byte ptr [rbx + rbp], 0
0x1436ad5: jne 0x141436adc
0x1436ad7: call 0x1448953c4
0x1436adc: mov eax, 0x1d4
0x1436ae1: cmp byte ptr [rax + rbx], 0
0x1436ae5: jne 0x141436b36
0x1436ae7: lea rbx, [rdi + 0x18]
0x1436aeb: mov qword ptr [rsp + 0x40], rbx
0x1436af0: mov rax, qword ptr [rbx]
0x1436af3: mov rcx, rbx
0x1436af6: call qword ptr [rax + 8]
0x1436af9: nop 
0x1436afa: test word ptr [rdi + 0x5e], si
0x1436afe: jne 0x141436b0c
0x1436b00: mov rcx, rdi
0x1436b03: call 0x141436910
0x1436b08: test al, al
0x1436b0a: je 0x141436b21
0x1436b0c: cmp byte ptr [rdi + 0x4a], 0
0x1436b10: je 0x141436b21
0x1436b12: xor edx, edx
0x1436b14: mov rcx, rdi
0x1436b17: call 0x141434470
0x1436b1c: mov dil, 1
0x1436b1f: jmp 0x141436b24
0x1436b21: xor dil, dil
0x1436b24: mov rcx, qword ptr [rbx]
0x1436b27: mov rdx, qword ptr [rcx + 0x10]
0x1436b2b: mov rcx, rbx
0x1436b2e: call rdx
0x1436b30: movzx eax, dil
0x1436b34: jmp 0x141436b4e
0x1436b36: test word ptr [rdi + 0x5e], si
0x1436b3a: jne 0x141436b48
0x1436b3c: mov rcx, rdi
0x1436b3f: call 0x141436910
0x1436b44: test al, al
0x1436b46: je 0x141436b4e
0x1436b48: lock inc dword ptr [rdi + 0x10]
0x1436b4c: mov al, 1
0x1436b4e: mov rbx, qword ptr [rsp + 0x30]
0x1436b53: mov rbp, qword ptr [rsp + 0x38]
0x1436b58: mov rsi, qword ptr [rsp + 0x48]
0x1436b5d: add rsp, 0x20
0x1436b61: pop rdi
0x1436b62: ret 