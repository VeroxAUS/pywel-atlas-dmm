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