0x2356e20: mov qword ptr [rsp + 0x10], rbx
0x2356e25: mov qword ptr [rsp + 0x18], rsi
0x2356e2a: push rdi
0x2356e2b: sub rsp, 0x150
0x2356e32: mov rdi, rdx
0x2356e35: mov rbx, rcx
0x2356e38: call 0x142358d40
0x2356e3d: xor esi, esi
0x2356e3f: mov qword ptr [rsp + 0x138], rsi
0x2356e47: mov qword ptr [rsp + 0x140], 0x105
0x2356e53: mov dword ptr [rsp + 0x144], esi
0x2356e5a: mov byte ptr [rsp + 0x30], sil
0x2356e5f: mov dword ptr [rsp + 0x144], esi
0x2356e66: mov byte ptr [rsp + 0x30], sil
0x2356e6b: mov rax, qword ptr [rsp + 0x138]
0x2356e73: test rax, rax
0x2356e76: je 0x142356e7b
0x2356e78: mov byte ptr [rax], sil
0x2356e7b: lea rcx, [rdi + 0x28]
0x2356e7f: mov rax, qword ptr [rcx + 0x88]
0x2356e86: test rax, rax
0x2356e89: cmovne rcx, rax
0x2356e8d: mov qword ptr [rsp + 0x160], rcx
0x2356e95: mov dword ptr [rsp + 0x144], 0xffffffff
0x2356ea0: lea rcx, [rsp + 0x30]
0x2356ea5: mov rax, qword ptr [rsp + 0x138]
0x2356ead: test rax, rax
0x2356eb0: cmovne rcx, rax
0x2356eb4: lea r9, [rbx + 0x20]
0x2356eb8: lea rax, [rsp + 0x160]
0x2356ec0: mov qword ptr [rsp + 0x20], rax
0x2356ec5: lea r8, [rip + 0x3221f70]
0x2356ecc: mov edx, dword ptr [rsp + 0x140]
0x2356ed3: call 0x14064c240
0x2356ed8: lea rdx, [rsp + 0x30]
0x2356edd: call 0x142358a20
0x2356ee2: movzx ebx, al
0x2356ee5: mov rcx, qword ptr [rsp + 0x138]
0x2356eed: test rcx, rcx
0x2356ef0: je 0x142356f21
0x2356ef2: mov eax, 0x1fd
0x2356ef7: mov rdx, qword ptr gs:[0x58]
0x2356f00: mov r8, qword ptr [rdx]
0x2356f03: cmp byte ptr [rax + r8], 0
0x2356f08: je 0x142356f11
0x2356f0a: call 0x1447f03bc
0x2356f0f: jmp 0x142356f16
0x2356f11: call 0x1447f02bc
0x2356f16: mov qword ptr [rsp + 0x138], rsi
0x2356f1e: movzx eax, bl
0x2356f21: lea r11, [rsp + 0x150]
0x2356f29: mov rbx, qword ptr [r11 + 0x18]
0x2356f2d: mov rsi, qword ptr [r11 + 0x20]
0x2356f31: mov rsp, r11
0x2356f34: pop rdi
0x2356f35: ret 