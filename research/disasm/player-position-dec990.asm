0xdec990: mov qword ptr [rsp + 8], rbx
0xdec995: push rdi
0xdec996: sub rsp, 0x20
0xdec99a: mov qword ptr [rcx + 0xc8], 0xffffffffffffffff
0xdec9a5: xor edi, edi
0xdec9a7: mov byte ptr [rcx + 0xd0], 0x15
0xdec9ae: mov rbx, rcx
0xdec9b1: mov qword ptr [rcx + 0xd8], 0xffffffffffffffff
0xdec9bc: vmovsd xmm0, qword ptr [rip + 0x47594c4]
0xdec9c4: vmovsd qword ptr [rcx + 0xe0], xmm0
0xdec9cc: mov eax, dword ptr [rip + 0x47594be]
0xdec9d2: mov dword ptr [rcx + 0xe8], eax
0xdec9d8: mov dword ptr [rcx + 0x100], edi
0xdec9de: mov qword ptr [rcx + 0x110], rdi
0xdec9e5: mov dword ptr [rcx + 0x1c0], edi
0xdec9eb: mov qword ptr [rcx + 0x1c8], rdi
0xdec9f2: mov qword ptr [rcx + 0x1d0], rdi
0xdec9f9: mov byte ptr [rcx + 0x1d8], 5
0xdeca00: add rcx, 0x1e0
0xdeca07: call 0x140391e90
0xdeca0c: xor eax, eax
0xdeca0e: mov word ptr [rbx + 0x1e8], ax
0xdeca15: mov byte ptr [rbx + 0x1ea], al
0xdeca1b: mov dword ptr [rbx + 0x1c4], edi
0xdeca21: mov byte ptr [rbx + 0x1ed], 1
0xdeca28: mov byte ptr [rbx + 0x1f0], 1
0xdeca2f: mov rbx, qword ptr [rsp + 0x30]
0xdeca34: add rsp, 0x20
0xdeca38: pop rdi
0xdeca39: ret 