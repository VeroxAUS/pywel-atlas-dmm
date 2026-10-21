0xd96760: sub rsp, 0x48
0xd96764: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd9676c: vmovss xmm1, dword ptr [rip + 0x5f15724]
0xd96774: vsubss xmm3, xmm0, dword ptr [rip + 0x5f156cc]
0xd9677c: vsubss xmm2, xmm1, dword ptr [rip + 0x5f156c4]
0xd96784: movsxd rax, dword ptr [rip + 0x5f155cd]
0xd9678b: vdivss xmm0, xmm3, xmm2
0xd9678f: vmovaps xmmword ptr [rsp + 0x20], xmm8
0xd96795: vmovss xmm8, dword ptr [rip + 0x4fdc917]
0xd9679d: vminss xmm1, xmm0, xmm8
0xd967a2: vxorps xmm0, xmm0, xmm0
0xd967a6: vmaxss xmm5, xmm0, xmm1
0xd967aa: cmp eax, 0x1e
0xd967ad: ja 0x140d96f43
0xd967b3: lea rdx, [rip - 0xd967ba]