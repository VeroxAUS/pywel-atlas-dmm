0xe016b0: sub rsp, 0x48
0xe016b4: mov eax, dword ptr [r8 + 8]
0xe016b8: vmovsd xmm0, qword ptr [r8]
0xe016bd: mov dword ptr [rsp + 0x38], eax
0xe016c1: lea r8, [rsp + 0x30]
0xe016c6: movzx eax, byte ptr [rsp + 0x78]
0xe016cb: mov byte ptr [rsp + 0x28], al
0xe016cf: movzx eax, byte ptr [rsp + 0x70]
0xe016d4: mov byte ptr [rsp + 0x20], al
0xe016d8: vmovsd qword ptr [rsp + 0x30], xmm0
0xe016de: call 0x140df88c0
0xe016e3: add rsp, 0x48
0xe016e7: ret 