0x430280: mov qword ptr [rsp + 0x10], rbx
0x430285: mov qword ptr [rsp + 0x18], rbp
0x43028a: push rsi
0x43028b: push rdi
0x43028c: push r14
0x43028e: sub rsp, 0x50
0x430292: movzx edi, word ptr [rcx]
0x430295: mov rbx, qword ptr [rip + 0x693bbdc]
0x43029c: cmp edi, dword ptr [rbx + 8]
0x43029f: jae 0x140430388
0x4302a5: lea rsi, [rdi*8]
0x4302ad: mov rax, qword ptr [rbx + 0x58]
0x4302b1: mov rax, qword ptr [rsi + rax]
0x4302b5: test rax, rax
0x4302b8: jne 0x140430392
0x4302be: lea r14, [rbx + 0x90]
0x4302c5: cmp qword ptr [r14], rax
0x4302c8: jne 0x1404302ef
0x4302ca: mov qword ptr [rsp + 0x20], r14
0x4302cf: xor r9d, r9d
0x4302d2: lea r8, [rip + 0x51448a7]
0x4302d9: mov rdx, qword ptr [rbx + 0x10]
0x4302dd: lea rcx, [rsp + 0x70]
0x4302e2: call 0x1425c5230
0x4302e7: mov eax, dword ptr [rsp + 0x70]
0x4302eb: test eax, eax
0x4302ed: jne 0x140430369
0x4302ef: call 0x141416af0
0x4302f4: add rax, 0x7d0
0x4302fa: mov qword ptr [rbx + 0x98], rax
0x430301: mov rcx, qword ptr [r14]
0x430304: mov rdx, qword ptr [rbx + 0x28]
0x430308: lea r14, [rip + 0x52f19b1]
0x43030f: mov qword ptr [rsp + 0x30], r14
0x430314: mov byte ptr [rsp + 0x38], 0
0x430319: lea rbp, [rip + 0x52f1940]
0x430320: mov qword ptr [rsp + 0x30], rbp
0x430325: mov rax, qword ptr [rcx]
0x430328: mov qword ptr [rsp + 0x40], rax
0x43032d: mov eax, dword ptr [rcx + 0xc]
0x430330: mov dword ptr [rsp + 0x48], eax
0x430334: mov dword ptr [rsp + 0x4c], 0
0x43033c: mov eax, dword ptr [rdx + rsi + 4]
0x430340: mov dword ptr [rsp + 0x4c], eax
0x430344: lea r9, [rsp + 0x30]
0x430349: movzx r8d, di
0x43034d: lea rdx, [rsp + 0x70]
0x430352: mov rcx, rbx
0x430355: call 0x1404344e0
0x43035a: nop 
0x43035b: mov qword ptr [rsp + 0x30], rbp
0x430360: mov qword ptr [rsp + 0x30], r14
0x430365: mov eax, dword ptr [rsp + 0x70]
0x430369: mov rcx, qword ptr [rip + 0x68ae080]
0x430370: test eax, eax
0x430372: je 0x140430379
0x430374: mov rax, rcx
0x430377: jmp 0x140430381
0x430379: mov rax, qword ptr [rbx + 0x58]
0x43037d: mov rax, qword ptr [rsi + rax]
0x430381: test rax, rax
0x430384: je 0x14043038f
0x430386: jmp 0x140430392
0x430388: mov rcx, qword ptr [rip + 0x68ae061]
0x43038f: mov rax, rcx
0x430392: mov rbx, qword ptr [rsp + 0x78]
0x430397: mov rbp, qword ptr [rsp + 0x80]
0x43039f: add rsp, 0x50
0x4303a3: pop r14
0x4303a5: pop rdi
0x4303a6: pop rsi
0x4303a7: ret 