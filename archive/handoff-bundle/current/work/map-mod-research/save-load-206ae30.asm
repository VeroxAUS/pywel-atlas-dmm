0x206ae30: mov qword ptr [rsp + 8], rbx
0x206ae35: mov qword ptr [rsp + 0x10], rdx
0x206ae3a: push rdi
0x206ae3b: sub rsp, 0x30
0x206ae3f: mov rbx, rdx
0x206ae42: mov dword ptr [rsp + 0x20], 0
0x206ae4a: mov rdi, qword ptr [rcx + 0xd8]
0x206ae51: test rdi, rdi
0x206ae54: je 0x14206ae75
0x206ae56: mov edx, 4
0x206ae5b: mov r8d, 0x10
0x206ae61: mov rax, qword ptr [rdi]
0x206ae64: mov rcx, rdi
0x206ae67: call qword ptr [rax + 0xc0]
0x206ae6d: test al, al
0x206ae6f: je 0x14206ae75
0x206ae71: mov al, 1
0x206ae73: jmp 0x14206ae77
0x206ae75: xor al, al
0x206ae77: lea rcx, [rip + 0x36bafca]
0x206ae7e: mov qword ptr [rbx], rcx
0x206ae81: mov qword ptr [rbx + 8], rdi
0x206ae85: mov byte ptr [rbx + 0x10], al
0x206ae88: mov byte ptr [rbx + 0x11], 0
0x206ae8c: mov qword ptr [rbx + 0x18], 0
0x206ae94: lea rax, [rip + 0x3508bed]
0x206ae9b: mov qword ptr [rbx], rax
0x206ae9e: lea rax, [rip + 0x3508bc3]
0x206aea5: mov qword ptr [rbx], rax
0x206aea8: mov dword ptr [rsp + 0x20], 1
0x206aeb0: mov rax, rbx
0x206aeb3: mov rbx, qword ptr [rsp + 0x40]
0x206aeb8: add rsp, 0x30
0x206aebc: pop rdi
0x206aebd: ret 
0x206aebe: int3 