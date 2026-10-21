0xb54130: mov qword ptr [rsp + 8], rbx
0xb54135: mov qword ptr [rsp + 0x10], rsi
0xb5413a: push rdi
0xb5413b: sub rsp, 0x20
0xb5413f: mov ecx, dword ptr [r8 + 0x30]
0xb54143: mov rsi, r8
0xb54146: mov eax, dword ptr [r8 + 0x34]
0xb5414a: mov rdi, rdx
0xb5414d: cmp eax, ecx
0xb5414f: ja 0x140b54174
0xb54151: lea edx, [rax*2 + 1]
0xb54158: add edx, eax
0xb5415a: mov eax, 1
0xb5415f: shr edx, 1
0xb54161: cmp edx, eax
0xb54163: cmovb edx, eax
0xb54166: cmp ecx, edx
0xb54168: cmova edx, ecx
0xb5416b: lea rcx, [r8 + 0x28]
0xb5416f: call 0x14035e3f0
0xb54174: mov rax, qword ptr [rsi + 0x20]
0xb54178: mov edx, dword ptr [rsi + 0x30]
0xb5417b: mov rcx, qword ptr [rsi + 0x28]
0xb5417f: mov rbx, qword ptr [rsp + 0x30]
0xb54184: mov dword ptr [rdi], 0
0xb5418a: mov qword ptr [rcx + rdx*8], rax
0xb5418e: mov rax, rdi
0xb54191: inc dword ptr [rsi + 0x30]
0xb54194: mov rsi, qword ptr [rsp + 0x38]
0xb54199: add rsp, 0x20
0xb5419d: pop rdi
0xb5419e: ret 