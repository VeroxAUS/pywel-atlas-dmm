0x50ea80: sub rsp, 0x58
0x50ea84: vxorps xmm0, xmm0, xmm0
0x50ea88: xor eax, eax
0x50ea8a: lea r9, [rsp + 0x30]
0x50ea8f: mov qword ptr [rdx], rax
0x50ea92: mov r11, rdx
0x50ea95: mov qword ptr [rdx + 8], rax
0x50ea99: mov r10, rcx
0x50ea9c: movsx eax, word ptr [r8 + 0xc]
0x50eaa1: lea rdx, [rsp + 0x20]
0x50eaa6: vmovss xmm3, dword ptr [r8 + 4]
0x50eaac: vcvtsi2sd xmm0, xmm0, eax
0x50eab0: movsx eax, word ptr [r8 + 0xe]
0x50eab5: vcvtss2sd xmm3, xmm3, xmm3
0x50eab9: vmovaps xmmword ptr [rsp + 0x40], xmm6
0x50eabf: vmovsd xmm6, qword ptr [rip + 0x5864919]
0x50eac7: vmulsd xmm1, xmm0, xmm6
0x50eacb: vmovss xmm0, dword ptr [r8]
0x50ead0: vcvtss2sd xmm0, xmm0, xmm0
0x50ead4: vaddsd xmm2, xmm1, xmm0
0x50ead8: vmovss xmm1, dword ptr [rcx]
0x50eadc: vmovss xmm0, dword ptr [rcx + 4]
0x50eae1: vcvtss2sd xmm0, xmm0, xmm0
0x50eae5: vcvtss2sd xmm1, xmm1, xmm1
0x50eae9: vmulsd xmm2, xmm2, xmm1
0x50eaed: vmulsd xmm1, xmm3, xmm0
0x50eaf1: vxorps xmm0, xmm0, xmm0
0x50eaf5: vcvtsi2sd xmm0, xmm0, eax
0x50eaf9: vmovsd qword ptr [rsp + 0x28], xmm1
0x50eaff: vmovss xmm1, dword ptr [r8 + 8]
0x50eb05: vmovsd qword ptr [rsp + 0x20], xmm2
0x50eb0b: vmulsd xmm2, xmm0, xmm6
0x50eb0f: vmovss xmm0, dword ptr [rcx + 8]
0x50eb14: vcvtss2sd xmm1, xmm1, xmm1
0x50eb18: vcvtss2sd xmm0, xmm0, xmm0
0x50eb1c: vaddsd xmm3, xmm2, xmm1
0x50eb20: vmulsd xmm2, xmm3, xmm0
0x50eb24: add rcx, 0xc
0x50eb28: lea r8, [rsp + 0x28]
0x50eb2d: vmovsd qword ptr [rsp + 0x30], xmm2
0x50eb33: call 0x1404dfc20
0x50eb38: movsx ecx, word ptr [r10 + 0x28]
0x50eb3d: movsx eax, word ptr [r10 + 0x2a]
0x50eb42: vmovss xmm1, dword ptr [r10 + 0x1c]
0x50eb48: vxorps xmm0, xmm0, xmm0
0x50eb4c: vcvtsi2sd xmm0, xmm0, ecx
0x50eb50: vmulsd xmm2, xmm0, xmm6
0x50eb54: vmovss xmm0, dword ptr [r10 + 0x20]
0x50eb5a: vcvtss2sd xmm0, xmm0, xmm0
0x50eb5e: vaddsd xmm5, xmm0, qword ptr [rsp + 0x28]
0x50eb64: vmovss xmm0, dword ptr [r10 + 0x24]
0x50eb6a: vcvtss2sd xmm1, xmm1, xmm1
0x50eb6e: vaddsd xmm2, xmm2, xmm1
0x50eb72: vaddsd xmm3, xmm2, qword ptr [rsp + 0x20]
0x50eb78: vcvtss2sd xmm0, xmm0, xmm0
0x50eb7c: vxorps xmm1, xmm1, xmm1
0x50eb80: vcvtsi2sd xmm1, xmm1, eax
0x50eb84: vmulsd xmm2, xmm1, xmm6
0x50eb88: vaddsd xmm2, xmm2, xmm0
0x50eb8c: vaddsd xmm4, xmm2, qword ptr [rsp + 0x30]
0x50eb92: vdivsd xmm1, xmm3, xmm6
0x50eb96: vcvttsd2si eax, xmm1
0x50eb9a: vdivsd xmm0, xmm4, xmm6
0x50eb9e: vcvttsd2si ecx, xmm0
0x50eba2: vxorps xmm0, xmm0, xmm0
0x50eba6: mov word ptr [r11 + 0xc], ax
0x50ebab: cwde 
0x50ebac: vcvtsi2sd xmm0, xmm0, eax
0x50ebb0: vmulsd xmm1, xmm0, xmm6
0x50ebb4: vsubsd xmm2, xmm3, xmm1
0x50ebb8: vcvtsd2ss xmm3, xmm2, xmm2
0x50ebbc: vcvtsd2ss xmm0, xmm5, xmm5
0x50ebc0: vxorps xmm1, xmm1, xmm1
0x50ebc4: movsx eax, cx
0x50ebc7: vcvtsi2sd xmm1, xmm1, eax
0x50ebcb: vmovss dword ptr [r11 + 4], xmm0
0x50ebd1: vmulsd xmm0, xmm1, xmm6
0x50ebd5: vsubsd xmm2, xmm4, xmm0
0x50ebd9: vmovss dword ptr [r11], xmm3
0x50ebde: vcvtsd2ss xmm3, xmm2, xmm2
0x50ebe2: vmovss dword ptr [r11 + 8], xmm3
0x50ebe8: mov word ptr [r11 + 0xe], cx
0x50ebed: vmovaps xmm6, xmmword ptr [rsp + 0x40]
0x50ebf3: mov rax, r11
0x50ebf6: add rsp, 0x58
0x50ebfa: ret 