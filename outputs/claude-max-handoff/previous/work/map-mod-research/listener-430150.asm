0x430150: mov qword ptr [rsp + 0x10], rbx
0x430155: mov qword ptr [rsp + 0x18], rbp
0x43015a: push rsi
0x43015b: push rdi
0x43015c: push r14
0x43015e: sub rsp, 0x50
0x430162: movzx edi, word ptr [rcx]
0x430165: mov rbx, qword ptr [rip + 0x6939924]
0x43016c: cmp edi, dword ptr [rbx + 8]
0x43016f: jae 0x140430258
0x430175: lea rsi, [rdi*8]
0x43017d: mov rax, qword ptr [rbx + 0x58]
0x430181: mov rax, qword ptr [rsi + rax]
0x430185: test rax, rax
0x430188: jne 0x140430262
0x43018e: lea r14, [rbx + 0x90]
0x430195: cmp qword ptr [r14], rax
0x430198: jne 0x1404301bf
0x43019a: mov qword ptr [rsp + 0x20], r14
0x43019f: xor r9d, r9d
0x4301a2: mov r8, qword ptr [rip + 0x566a9c7]
0x4301a9: mov rdx, qword ptr [rbx + 0x10]
0x4301ad: lea rcx, [rsp + 0x70]
0x4301b2: call 0x1425c5230
0x4301b7: mov eax, dword ptr [rsp + 0x70]
0x4301bb: test eax, eax
0x4301bd: jne 0x140430239
0x4301bf: call 0x141416af0
0x4301c4: add rax, 0x7d0
0x4301ca: mov qword ptr [rbx + 0x98], rax
0x4301d1: mov rcx, qword ptr [r14]
0x4301d4: mov rdx, qword ptr [rbx + 0x28]
0x4301d8: lea r14, [rip + 0x52f1ae1]
0x4301df: mov qword ptr [rsp + 0x30], r14
0x4301e4: mov byte ptr [rsp + 0x38], 0
0x4301e9: lea rbp, [rip + 0x52f1a70]
0x4301f0: mov qword ptr [rsp + 0x30], rbp
0x4301f5: mov rax, qword ptr [rcx]
0x4301f8: mov qword ptr [rsp + 0x40], rax
0x4301fd: mov eax, dword ptr [rcx + 0xc]
0x430200: mov dword ptr [rsp + 0x48], eax
0x430204: mov dword ptr [rsp + 0x4c], 0
0x43020c: mov eax, dword ptr [rdx + rsi + 4]
0x430210: mov dword ptr [rsp + 0x4c], eax
0x430214: lea r9, [rsp + 0x30]
0x430219: movzx r8d, di
0x43021d: lea rdx, [rsp + 0x70]
0x430222: mov rcx, rbx
0x430225: call 0x140434220
0x43022a: nop 
0x43022b: mov qword ptr [rsp + 0x30], rbp
0x430230: mov qword ptr [rsp + 0x30], r14
0x430235: mov eax, dword ptr [rsp + 0x70]
0x430239: mov rcx, qword ptr [rip + 0x68add48]
0x430240: test eax, eax
0x430242: je 0x140430249
0x430244: mov rax, rcx
0x430247: jmp 0x140430251
0x430249: mov rax, qword ptr [rbx + 0x58]
0x43024d: mov rax, qword ptr [rsi + rax]
0x430251: test rax, rax
0x430254: je 0x14043025f
0x430256: jmp 0x140430262
0x430258: mov rcx, qword ptr [rip + 0x68add29]
0x43025f: mov rax, rcx
0x430262: mov rbx, qword ptr [rsp + 0x78]
0x430267: mov rbp, qword ptr [rsp + 0x80]
0x43026f: add rsp, 0x50
0x430273: pop r14
0x430275: pop rdi
0x430276: pop rsi
0x430277: ret 