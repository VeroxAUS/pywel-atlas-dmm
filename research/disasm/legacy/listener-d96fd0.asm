0xd96fd0: sub rsp, 0x58
0xd96fd4: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd96fdc: vmovss xmm1, dword ptr [rip + 0x5f14e14]
0xd96fe4: vsubss xmm3, xmm0, dword ptr [rip + 0x5f14dbc]
0xd96fec: vsubss xmm2, xmm1, dword ptr [rip + 0x5f14db4]
0xd96ff4: movsxd rax, dword ptr [rip + 0x5f14d0d]
0xd96ffb: vdivss xmm0, xmm3, xmm2
0xd96fff: vmovaps xmmword ptr [rsp + 0x30], xmm7
0xd97005: vmovaps xmmword ptr [rsp + 0x20], xmm8
0xd9700b: vmovss xmm8, dword ptr [rip + 0x4fdc0a1]
0xd97013: vminss xmm1, xmm0, xmm8
0xd97018: vxorps xmm0, xmm0, xmm0
0xd9701c: vmaxss xmm5, xmm0, xmm1
0xd97020: cmp eax, 0x1e
0xd97023: ja 0x140d9763b
0xd97029: lea rdx, [rip - 0xd97030]