0x22a8e10: lea rax, [rip + 0x369c349]
0x22a8e17: ret 
0x22a8e18: int3 
0x22a8e19: int3 
0x22a8e1a: int3 
0x22a8e1b: int3 
0x22a8e1c: int3 
0x22a8e1d: int3 
0x22a8e1e: int3 
0x22a8e1f: int3 
0x22a8e20: push rbx
0x22a8e22: sub rsp, 0x30
0x22a8e26: mov rcx, qword ptr [rdx + 0x828]
0x22a8e2d: test rcx, rcx
0x22a8e30: je 0x1422a8ed1
0x22a8e36: mov rax, qword ptr [rcx + 0x88]
0x22a8e3d: movzx r8d, byte ptr [rax + 1]
0x22a8e42: lea eax, [r8 - 3]
0x22a8e46: cmp eax, 6
0x22a8e49: ja 0x1422a8e61
0x22a8e4b: cdqe 
0x22a8e4d: lea r9, [rip - 0x22a8e54]
0x22a8e54: mov edx, dword ptr [r9 + rax*4 + 0x22a8edc]
0x22a8e5c: add rdx, r9
0x22a8e5f: jmp rdx
0x22a8e61: cmp r8b, 1
0x22a8e65: jne 0x1422a8ed1
0x22a8e67: lea rdx, [rsp + 0x48]
0x22a8e6c: call 0x1417ff530
0x22a8e71: nop 
0x22a8e72: mov rax, qword ptr [rsp + 0x48]
0x22a8e77: test rax, rax
0x22a8e7a: jne 0x1422a8e80
0x22a8e7c: mov bl, 1
0x22a8e7e: jmp 0x1422a8e87
0x22a8e80: cmp byte ptr [rax + 0x48], 3
0x22a8e84: setne bl
0x22a8e87: mov rcx, qword ptr [rsp + 0x48]
0x22a8e8c: test rcx, rcx
0x22a8e8f: je 0x1422a8ec8
0x22a8e91: mov qword ptr [rsp + 0x48], 0
0x22a8e9a: cmp byte ptr [rcx + 0x14], 0
0x22a8e9e: je 0x1422a8eae
0x22a8ea0: mov eax, 0xffffffff
0x22a8ea5: lock xadd dword ptr [rcx + 0x10], eax
0x22a8eaa: dec eax
0x22a8eac: jmp 0x1422a8eb6
0x22a8eae: mov eax, dword ptr [rcx + 0x10]
0x22a8eb1: dec eax
0x22a8eb3: mov dword ptr [rcx + 0x10], eax
0x22a8eb6: test eax, eax
0x22a8eb8: jne 0x1422a8ec8
0x22a8eba: mov rdx, qword ptr [rcx]
0x22a8ebd: mov r8, qword ptr [rdx]
0x22a8ec0: mov edx, 1
0x22a8ec5: call r8
0x22a8ec8: movzx eax, bl
0x22a8ecb: add rsp, 0x30
0x22a8ecf: pop rbx
0x22a8ed0: ret 
0x22a8ed1: mov al, 2
0x22a8ed3: add rsp, 0x30
0x22a8ed7: pop rbx
0x22a8ed8: ret 
0x22a8ed9: nop dword ptr [rax]
0x22a8edc: mov gs, word ptr [edx]
0x22a8edf: add ah, byte ptr [rdi - 0x72]
0x22a8ee2: sub al, byte ptr [rdx]
0x22a8ee4: mov gs, word ptr [edx]
0x22a8ee7: add ah, byte ptr [rdi - 0x72]
0x22a8eea: sub al, byte ptr [rdx]