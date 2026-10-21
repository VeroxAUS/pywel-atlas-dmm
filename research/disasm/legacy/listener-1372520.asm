0x1372520: sub rsp, 0x18
0x1372524: vmulss xmm1, xmm2, dword ptr [rip + 0x4a008bc]
0x137252c: vmovss xmm5, dword ptr [rip + 0x4a00a00]
0x1372534: vxorps xmm0, xmm0, xmm0
0x1372538: vcomiss xmm2, xmm0
0x137253c: vmovaps xmmword ptr [rsp], xmm6
0x1372541: jb 0x141372549
0x1372543: vaddss xmm0, xmm1, xmm5
0x1372547: jmp 0x14137254d
0x1372549: vsubss xmm0, xmm1, xmm5
0x137254d: vcvttss2si eax, xmm0
0x1372551: vxorps xmm0, xmm0, xmm0
0x1372555: vcvtsi2ss xmm0, xmm0, eax
0x1372559: vmulss xmm0, xmm0, dword ptr [rip + 0x4a00ec7]
0x1372561: vsubss xmm3, xmm2, xmm0
0x1372565: vcomiss xmm3, dword ptr [rip + 0x4a00c5b]
0x137256d: jbe 0x141372585
0x137256f: vmovss xmm0, dword ptr [rip + 0x4a00e19]
0x1372577: vmovss xmm6, dword ptr [rip + 0x4a01409]
0x137257f: vsubss xmm3, xmm0, xmm3
0x1372583: jmp 0x1413725b1
0x1372585: vmovss xmm0, dword ptr [rip + 0x4a01437]
0x137258d: vcomiss xmm0, xmm3
0x1372591: jbe 0x1413725a9
0x1372593: vmovss xmm0, dword ptr [rip + 0x4a01469]
0x137259b: vmovss xmm6, dword ptr [rip + 0x4a013e5]
0x13725a3: vsubss xmm3, xmm0, xmm3
0x13725a7: jmp 0x1413725b1
0x13725a9: vmovss xmm6, dword ptr [rip + 0x4a00b03]
0x13725b1: vmovss xmm0, dword ptr [rip + 0x4a0064f]
0x13725b9: vmulss xmm4, xmm3, xmm3
0x13725bd: vmulss xmm1, xmm4, dword ptr [rip + 0x4a0061f]
0x13725c5: vsubss xmm0, xmm0, xmm1
0x13725c9: vmulss xmm1, xmm0, xmm4
0x13725cd: vsubss xmm1, xmm1, dword ptr [rip + 0x4a00667]
0x13725d5: vmulss xmm0, xmm1, xmm4
0x13725d9: vaddss xmm0, xmm0, dword ptr [rip + 0x4a006d7]
0x13725e1: vmulss xmm1, xmm0, xmm4
0x13725e5: vsubss xmm1, xmm1, dword ptr [rip + 0x4a00807]
0x13725ed: vmulss xmm0, xmm1, xmm4
0x13725f1: vaddss xmm2, xmm0, dword ptr [rip + 0x4a00abb]
0x13725f9: vmovss xmm0, dword ptr [rip + 0x4a00627]
0x1372601: vmulss xmm1, xmm4, dword ptr [rip + 0x4a005e7]
0x1372609: vsubss xmm0, xmm0, xmm1
0x137260d: vmulss xmm1, xmm0, xmm4
0x1372611: vsubss xmm1, xmm1, dword ptr [rip + 0x4a0064b]
0x1372619: vmulss xmm0, xmm1, xmm4
0x137261d: vaddss xmm0, xmm0, dword ptr [rip + 0x4a0071b]
0x1372625: vmulss xmm1, xmm0, xmm4
0x1372629: vmulss xmm3, xmm2, xmm3
0x137262d: vsubss xmm2, xmm1, xmm5
0x1372631: vmovss dword ptr [rcx], xmm3
0x1372635: vmulss xmm3, xmm2, xmm4
0x1372639: vaddss xmm0, xmm3, dword ptr [rip + 0x4a00a73]
0x1372641: vmulss xmm1, xmm0, xmm6
0x1372645: vmovaps xmm6, xmmword ptr [rsp]
0x137264a: vmovss dword ptr [rdx], xmm1
0x137264e: add rsp, 0x18
0x1372652: ret 