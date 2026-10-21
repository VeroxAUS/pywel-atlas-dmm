0xdf2cf0: mov rax, rsp
0xdf2cf3: mov qword ptr [rax + 0x18], r8
0xdf2cf7: mov qword ptr [rax + 0x10], rdx
0xdf2cfb: mov qword ptr [rax + 8], rcx
0xdf2cff: push rbp
0xdf2d00: push rbx
0xdf2d01: push rsi
0xdf2d02: push rdi
0xdf2d03: push r12
0xdf2d05: push r13
0xdf2d07: push r14
0xdf2d09: push r15
0xdf2d0b: lea rbp, [rax - 0x68]
0xdf2d0f: sub rsp, 0x128
0xdf2d16: vmovaps xmmword ptr [rax - 0x58], xmm6
0xdf2d1b: vmovaps xmmword ptr [rax - 0x68], xmm7
0xdf2d20: vmovaps xmmword ptr [rax - 0x78], xmm8
0xdf2d25: mov rsi, r8
0xdf2d28: mov r15, rdx
0xdf2d2b: mov r13, rcx
0xdf2d2e: xor r12d, r12d
0xdf2d31: mov edi, r12d
0xdf2d34: mov dword ptr [rsp + 0x78], r12d
0xdf2d39: mov byte ptr [rbp + 0x88], 1
0xdf2d40: mov qword ptr [rbp - 0x60], r12
0xdf2d44: mov qword ptr [rbp - 0x58], r12
0xdf2d48: mov r14d, 1
0xdf2d4e: mov edx, r14d
0xdf2d51: lea rcx, [rbp - 0x60]
0xdf2d55: call 0x14035e3f0
0xdf2d5a: mov ecx, dword ptr [rbp - 0x58]
0xdf2d5d: mov rdx, qword ptr [rbp - 0x60]
0xdf2d61: mov qword ptr [rdx + rcx*8], rsi
0xdf2d65: inc ecx
0xdf2d67: mov dword ptr [rbp - 0x58], ecx
0xdf2d6a: mov rax, qword ptr [rsi]
0xdf2d6d: mov rcx, rsi
0xdf2d70: call qword ptr [rax + 0x520]
0xdf2d76: test al, al
0xdf2d78: je 0x140df2fb2
0xdf2d7e: lea rbx, [r13 + 0x238]
0xdf2d85: mov r9d, dword ptr [rbx + 8]
0xdf2d89: mov ecx, r12d
0xdf2d8c: test r9d, r9d
0xdf2d8f: je 0x140df2dbd
0xdf2d91: mov r8, qword ptr [rbx]
0xdf2d94: movzx r10d, byte ptr [r15 + 8]
0xdf2d99: nop dword ptr [rax]
0xdf2da0: mov edx, ecx
0xdf2da2: shl rdx, 5
0xdf2da6: cmp byte ptr [rdx + r8 + 8], r10b
0xdf2dab: jne 0x140df2db6
0xdf2dad: mov rax, qword ptr [r15]
0xdf2db0: cmp qword ptr [rdx + r8], rax
0xdf2db4: je 0x140df2dc2
0xdf2db6: inc ecx
0xdf2db8: cmp ecx, r9d
0xdf2dbb: jb 0x140df2da0
0xdf2dbd: mov ecx, 0xffffffff
0xdf2dc2: cmp ecx, -1
0xdf2dc5: jne 0x140df2e54
0xdf2dcb: vmovups xmm0, xmmword ptr [r15]
0xdf2dd0: vmovups xmmword ptr [rsp + 0x58], xmm0
0xdf2dd6: lea rdx, [rbp - 0x60]
0xdf2dda: lea rcx, [rsp + 0x68]
0xdf2ddf: call 0x1406b1ed0
0xdf2de4: nop 
0xdf2de5: mov dword ptr [rsp + 0x78], r14d
0xdf2dea: mov edx, dword ptr [rbx + 8]
0xdf2ded: cmp dword ptr [rbx + 0xc], edx
0xdf2df0: ja 0x140df2dfa
0xdf2df2: mov rcx, rbx
0xdf2df5: call 0x140e01c50
0xdf2dfa: mov edx, dword ptr [rbx + 8]
0xdf2dfd: shl rdx, 5
0xdf2e01: add rdx, qword ptr [rbx]
0xdf2e04: mov qword ptr [rbp + 0x80], rdx
0xdf2e0b: vmovups xmm0, xmmword ptr [rsp + 0x58]
0xdf2e11: vmovups xmmword ptr [rdx], xmm0
0xdf2e15: mov rax, qword ptr [rsp + 0x68]
0xdf2e1a: mov qword ptr [rdx + 0x10], rax
0xdf2e1e: mov qword ptr [rsp + 0x68], r12
0xdf2e23: mov eax, dword ptr [rsp + 0x70]
0xdf2e27: mov dword ptr [rdx + 0x18], eax
0xdf2e2a: mov dword ptr [rsp + 0x70], r12d
0xdf2e2f: mov eax, dword ptr [rsp + 0x74]
0xdf2e33: mov dword ptr [rdx + 0x1c], eax
0xdf2e36: mov dword ptr [rsp + 0x74], r12d
0xdf2e3b: inc dword ptr [rbx + 8]
0xdf2e3e: mov edi, r14d
0xdf2e41: and edi, 0xfffffffe
0xdf2e44: mov dword ptr [rsp + 0x78], edi
0xdf2e48: mov qword ptr [rsp + 0x68], r12
0xdf2e4d: mov qword ptr [rsp + 0x70], r12
0xdf2e52: jmp 0x140df2e96
0xdf2e54: shl rcx, 5
0xdf2e58: mov rbx, qword ptr [rbx]
0xdf2e5b: add rbx, rcx
0xdf2e5e: mov ecx, dword ptr [rbx + 0x18]
0xdf2e61: mov eax, dword ptr [rbx + 0x1c]
0xdf2e64: cmp eax, ecx
0xdf2e66: ja 0x140df2e88
0xdf2e68: lea edx, [rax*2 + 1]
0xdf2e6f: add edx, eax
0xdf2e71: shr edx, 1
0xdf2e73: cmp edx, r14d
0xdf2e76: cmovb edx, r14d
0xdf2e7a: cmp ecx, edx
0xdf2e7c: cmova edx, ecx
0xdf2e7f: lea rcx, [rbx + 0x10]
0xdf2e83: call 0x14035e3f0
0xdf2e88: mov ecx, dword ptr [rbx + 0x18]
0xdf2e8b: mov rax, qword ptr [rbx + 0x10]
0xdf2e8f: mov qword ptr [rax + rcx*8], rsi
0xdf2e93: inc dword ptr [rbx + 0x18]
0xdf2e96: lea rbx, [r13 + 0x248]
0xdf2e9d: mov r9d, dword ptr [rbx + 8]
0xdf2ea1: mov ecx, r12d
0xdf2ea4: test r9d, r9d
0xdf2ea7: je 0x140df2ece
0xdf2ea9: mov r8, qword ptr [rbx]
0xdf2eac: movzx r10d, byte ptr [r15 + 8]
0xdf2eb1: mov edx, ecx
0xdf2eb3: shl rdx, 5
0xdf2eb7: cmp byte ptr [rdx + r8 + 8], r10b
0xdf2ebc: jne 0x140df2ec7
0xdf2ebe: mov rax, qword ptr [r15]
0xdf2ec1: cmp qword ptr [rdx + r8], rax
0xdf2ec5: je 0x140df2ed3
0xdf2ec7: inc ecx
0xdf2ec9: cmp ecx, r9d
0xdf2ecc: jb 0x140df2eb1
0xdf2ece: mov ecx, 0xffffffff
0xdf2ed3: cmp ecx, -1
0xdf2ed6: jne 0x140df2f69
0xdf2edc: vmovups xmm0, xmmword ptr [r15]
0xdf2ee1: vmovups xmmword ptr [rsp + 0x58], xmm0
0xdf2ee7: lea rdx, [rbp - 0x60]
0xdf2eeb: lea rcx, [rsp + 0x68]
0xdf2ef0: call 0x1406b1ed0
0xdf2ef5: nop 
0xdf2ef6: or edi, 2
0xdf2ef9: mov dword ptr [rsp + 0x78], edi
0xdf2efd: mov edx, dword ptr [rbx + 8]
0xdf2f00: cmp dword ptr [rbx + 0xc], edx
0xdf2f03: ja 0x140df2f0d
0xdf2f05: mov rcx, rbx
0xdf2f08: call 0x140e01c50
0xdf2f0d: mov edx, dword ptr [rbx + 8]
0xdf2f10: shl rdx, 5
0xdf2f14: add rdx, qword ptr [rbx]
0xdf2f17: mov qword ptr [rbp + 0x80], rdx
0xdf2f1e: vmovups xmm0, xmmword ptr [rsp + 0x58]
0xdf2f24: vmovups xmmword ptr [rdx], xmm0
0xdf2f28: mov rax, qword ptr [rsp + 0x68]
0xdf2f2d: mov qword ptr [rdx + 0x10], rax
0xdf2f31: mov qword ptr [rsp + 0x68], r12
0xdf2f36: mov eax, dword ptr [rsp + 0x70]
0xdf2f3a: mov dword ptr [rdx + 0x18], eax
0xdf2f3d: mov dword ptr [rsp + 0x70], r12d
0xdf2f42: mov eax, dword ptr [rsp + 0x74]
0xdf2f46: mov dword ptr [rdx + 0x1c], eax
0xdf2f49: mov dword ptr [rsp + 0x74], r12d
0xdf2f4e: inc dword ptr [rbx + 8]
0xdf2f51: and edi, 0xfffffffd
0xdf2f54: mov dword ptr [rsp + 0x78], edi
0xdf2f58: mov qword ptr [rsp + 0x68], r12
0xdf2f5d: mov qword ptr [rsp + 0x70], r12
0xdf2f62: mov bl, 1
0xdf2f64: jmp 0x140df34e7
0xdf2f69: shl rcx, 5
0xdf2f6d: mov rbx, qword ptr [rbx]
0xdf2f70: add rbx, rcx
0xdf2f73: mov ecx, dword ptr [rbx + 0x18]
0xdf2f76: mov eax, dword ptr [rbx + 0x1c]
0xdf2f79: cmp eax, ecx
0xdf2f7b: ja 0x140df2f9d
0xdf2f7d: lea edx, [rax*2 + 1]
0xdf2f84: add edx, eax
0xdf2f86: shr edx, 1
0xdf2f88: cmp edx, 1
0xdf2f8b: cmovb edx, r14d
0xdf2f8f: cmp ecx, edx
0xdf2f91: cmova edx, ecx
0xdf2f94: lea rcx, [rbx + 0x10]
0xdf2f98: call 0x14035e3f0
0xdf2f9d: mov ecx, dword ptr [rbx + 0x18]
0xdf2fa0: mov rax, qword ptr [rbx + 0x10]
0xdf2fa4: mov qword ptr [rax + rcx*8], rsi
0xdf2fa8: inc dword ptr [rbx + 0x18]
0xdf2fab: mov bl, 1
0xdf2fad: jmp 0x140df34e7
0xdf2fb2: mov rdi, qword ptr [rbp + 0x80]
0xdf2fb9: lea rbx, [rdi + 0xec]
0xdf2fc0: mov rax, qword ptr [rdi]
0xdf2fc3: mov rcx, rdi
0xdf2fc6: call qword ptr [rax + 0x530]
0xdf2fcc: vxorps xmm3, xmm3, xmm3
0xdf2fd0: vmovss xmm0, dword ptr [rdi + 0xe8]
0xdf2fd8: vxorps xmm2, xmm2, xmm2
0xdf2fdc: vcvtsi2ss xmm3, xmm3, dword ptr [rip + 0x5eba124]
0xdf2fe4: vdivss xmm1, xmm0, xmm3
0xdf2fe8: vroundss xmm2, xmm2, xmm1, 1
0xdf2fee: vcvttss2si ecx, xmm2
0xdf2ff2: vxorps xmm2, xmm2, xmm2
0xdf2ff6: test al, al
0xdf2ff8: je 0x140df351b
0xdf2ffe: vmovss xmm6, dword ptr [rdi + 0xe0]
0xdf3006: vdivss xmm0, xmm6, xmm3
0xdf300a: vxorps xmm1, xmm1, xmm1
0xdf300e: vroundss xmm1, xmm1, xmm0, 1
0xdf3014: vcvttss2si eax, xmm1
0xdf3018: mov dword ptr [rbp - 0x68], eax
0xdf301b: mov dword ptr [rbp - 0x64], ecx
0xdf301e: mov rax, qword ptr [rbp - 0x68]
0xdf3022: mov qword ptr [rbx], rax
0xdf3025: vmovss xmm5, dword ptr [rdi + 0x100]
0xdf302d: vmovss xmm3, dword ptr [rdi + 0xe8]
0xdf3035: vxorps xmm4, xmm4, xmm4
0xdf3039: vcvtsi2ss xmm4, xmm4, dword ptr [rip + 0x5eba0c7]
0xdf3041: vsubss xmm0, xmm3, xmm5
0xdf3045: vdivss xmm1, xmm0, xmm4
0xdf3049: vroundss xmm2, xmm2, xmm1, 1
0xdf304f: vcvttss2si eax, xmm2
0xdf3053: mov dword ptr [rbp - 0x80], eax
0xdf3056: vsubss xmm0, xmm6, xmm5
0xdf305a: vdivss xmm1, xmm0, xmm4
0xdf305e: vxorps xmm2, xmm2, xmm2
0xdf3062: vroundss xmm2, xmm2, xmm1, 1
0xdf3068: vcvttss2si r12d, xmm2
0xdf306c: vaddss xmm0, xmm3, xmm5
0xdf3070: vdivss xmm1, xmm0, xmm4
0xdf3074: vxorps xmm2, xmm2, xmm2
0xdf3078: vroundss xmm2, xmm2, xmm1, 1
0xdf307e: vcvttss2si ecx, xmm2
0xdf3082: mov dword ptr [rsp + 0x7c], ecx
0xdf3086: vaddss xmm0, xmm5, xmm6
0xdf308a: vdivss xmm1, xmm0, xmm4
0xdf308e: vxorps xmm2, xmm2, xmm2
0xdf3092: vroundss xmm2, xmm2, xmm1, 1
0xdf3098: vcvttss2si esi, xmm2
0xdf309c: mov dword ptr [rbp - 0x50], esi
0xdf309f: sub ecx, eax
0xdf30a1: cmp esi, r12d
0xdf30a4: jne 0x140df30b6
0xdf30a6: test ecx, ecx
0xdf30a8: jne 0x140df30b6
0xdf30aa: movzx eax, r14b
0xdf30ae: xor r12d, r12d
0xdf30b1: jmp 0x140df34dc
0xdf30b6: mov eax, dword ptr [rip + 0x5eba09c]
0xdf30bc: cdq 
0xdf30bd: sub eax, edx
0xdf30bf: sar eax, 1
0xdf30c1: mov r8d, eax
0xdf30c4: mov edx, dword ptr [r13 + 0x2ac]
0xdf30cb: mov eax, edx
0xdf30cd: sub eax, r8d
0xdf30d0: mov r11d, eax
0xdf30d3: mov ecx, dword ptr [r13 + 0x2a8]
0xdf30da: mov r9d, ecx
0xdf30dd: sub r9d, r8d
0xdf30e0: shl rax, 0x20
0xdf30e4: or rax, r9
0xdf30e7: mov qword ptr [rbp - 0x38], rax
0xdf30eb: lea r10d, [r8 + rdx]
0xdf30ef: add ecx, r8d
0xdf30f2: mov r8d, r10d
0xdf30f5: shl r8, 0x20
0xdf30f9: mov eax, ecx
0xdf30fb: or r8, rax
0xdf30fe: mov qword ptr [rbp - 0x40], r8
0xdf3102: cmp r12d, ecx
0xdf3105: mov ecx, dword ptr [rbp - 0x80]
0xdf3108: mov eax, dword ptr [rsp + 0x7c]
0xdf310c: jg 0x140df3122
0xdf310e: cmp esi, r9d
0xdf3111: jl 0x140df3122
0xdf3113: cmp ecx, r10d
0xdf3116: jg 0x140df3122
0xdf3118: cmp eax, r11d
0xdf311b: mov byte ptr [rsp + 0x50], r14b
0xdf3120: jge 0x140df3127
0xdf3122: mov byte ptr [rsp + 0x50], 0
0xdf3127: xor r15b, r15b
0xdf312a: mov qword ptr [rbp - 0x78], 0
0xdf3132: xor r14d, r14d
0xdf3135: mov qword ptr [rbp - 0x70], r14
0xdf3139: xor r13d, r13d
0xdf313c: cmp r12d, esi
0xdf313f: jg 0x140df339f
0xdf3145: mov rbx, qword ptr [rbp - 0x78]
0xdf3149: mov edx, dword ptr [rbp - 0x50]
0xdf314c: nop dword ptr [rax]
0xdf3150: mov esi, ecx
0xdf3152: cmp ecx, eax
0xdf3154: jg 0x140df338c
0xdf315a: nop word ptr [rax + rax]
0xdf3160: mov ecx, dword ptr [rip + 0x5eb9fa2]
0xdf3166: mov eax, ecx
0xdf3168: imul eax, esi
0xdf316b: vxorps xmm2, xmm2, xmm2
0xdf316f: vcvtsi2ss xmm2, xmm2, eax
0xdf3173: vmovss xmm4, dword ptr [rdi + 0xe8]
0xdf317b: vxorps xmm6, xmm6, xmm6
0xdf317f: vcvtsi2ss xmm6, xmm6, ecx
0xdf3183: vmovss xmm7, dword ptr [rdi + 0xe0]
0xdf318b: imul ecx, r12d
0xdf318f: vxorps xmm3, xmm3, xmm3
0xdf3193: vcvtsi2ss xmm3, xmm3, ecx
0xdf3197: vmovss xmm8, dword ptr [rdi + 0x100]
0xdf319f: vaddss xmm0, xmm6, xmm2
0xdf31a3: vminss xmm1, xmm4, xmm0
0xdf31a7: vmaxss xmm2, xmm2, xmm1
0xdf31ab: vsubss xmm5, xmm4, xmm2
0xdf31af: vaddss xmm0, xmm3, xmm6
0xdf31b3: vminss xmm1, xmm7, xmm0
0xdf31b7: vmaxss xmm2, xmm3, xmm1
0xdf31bb: vsubss xmm3, xmm7, xmm2
0xdf31bf: vmulss xmm4, xmm3, xmm3
0xdf31c3: vmulss xmm0, xmm5, xmm5
0xdf31c7: vaddss xmm2, xmm4, xmm0
0xdf31cb: vmulss xmm1, xmm8, xmm8
0xdf31d0: vcomiss xmm2, xmm1
0xdf31d4: ja 0x140df3378
0xdf31da: mov dword ptr [rbp - 0x48], r12d
0xdf31de: mov dword ptr [rbp - 0x44], esi
0xdf31e1: cmp r13d, r14d
0xdf31e4: ja 0x140df321a
0xdf31e6: lea edx, [r13*2 + 1]
0xdf31ee: add edx, r13d
0xdf31f1: shr edx, 1
0xdf31f3: cmp edx, 1
0xdf31f6: mov eax, 1
0xdf31fb: cmovb edx, eax
0xdf31fe: cmp r14d, edx
0xdf3201: cmova edx, r14d
0xdf3205: lea rcx, [rbp - 0x78]
0xdf3209: call 0x1403d4130
0xdf320e: mov r13d, dword ptr [rbp - 0x6c]
0xdf3212: mov r14d, dword ptr [rbp - 0x70]
0xdf3216: mov rbx, qword ptr [rbp - 0x78]
0xdf321a: mov ecx, r14d
0xdf321d: mov rax, qword ptr [rbp - 0x48]
0xdf3221: mov qword ptr [rbx + rcx*8], rax
0xdf3225: inc r14d
0xdf3228: mov dword ptr [rbp - 0x70], r14d
0xdf322c: mov rdi, qword ptr [rbp + 0x70]
0xdf3230: mov qword ptr [rsp + 0x58], 0
0xdf3239: mov qword ptr [rsp + 0x60], 0
0xdf3242: mov dword ptr [rbp - 0x68], r12d
0xdf3246: mov dword ptr [rbp - 0x64], esi
0xdf3249: lea rax, [rbp - 0x68]
0xdf324d: mov qword ptr [rbp - 0x28], rax
0xdf3251: inc dword ptr [rdi + 0x274]
0xdf3257: mov edx, 8
0xdf325c: lea rcx, [rbp - 0x68]
0xdf3260: call 0x1403d6210
0xdf3265: lea rcx, [rbp - 0x20]
0xdf3269: mov qword ptr [rsp + 0x38], rcx
0xdf326e: lea rcx, [rbp - 0x30]
0xdf3272: mov qword ptr [rsp + 0x30], rcx
0xdf3277: lea rcx, [rsp + 0x51]
0xdf327c: mov qword ptr [rsp + 0x28], rcx
0xdf3281: lea r9, [rsp + 0x58]
0xdf3286: mov r8d, eax
0xdf3289: lea rdx, [rbp - 0x28]
0xdf328d: lea rcx, [rdi + 0x268]
0xdf3294: call 0x14040fac0
0xdf3299: nop 
0xdf329a: mov rcx, qword ptr [rsp + 0x58]
0xdf329f: test rcx, rcx
0xdf32a2: je 0x140df32c9
0xdf32a4: mov r8d, 0x1fd
0xdf32aa: mov rax, qword ptr gs:[0x58]
0xdf32b3: mov rdx, qword ptr [rax]
0xdf32b6: cmp byte ptr [r8 + rdx], 0
0xdf32bb: je 0x140df32c4
0xdf32bd: call 0x1447f03bc
0xdf32c2: jmp 0x140df32c9
0xdf32c4: call 0x1447f02bc
0xdf32c9: mov qword ptr [rsp + 0x58], 0
0xdf32d2: mov qword ptr [rsp + 0x60], 0
0xdf32db: mov rdi, qword ptr [rbp - 0x20]
0xdf32df: mov ecx, dword ptr [rdi + 8]
0xdf32e2: mov eax, dword ptr [rdi + 0xc]
0xdf32e5: cmp eax, ecx
0xdf32e7: ja 0x140df330c
0xdf32e9: lea edx, [rax*2 + 1]
0xdf32f0: add edx, eax
0xdf32f2: shr edx, 1
0xdf32f4: cmp edx, 1
0xdf32f7: mov eax, 1
0xdf32fc: cmovb edx, eax
0xdf32ff: cmp ecx, edx
0xdf3301: cmova edx, ecx
0xdf3304: mov rcx, rdi
0xdf3307: call 0x14035e3f0
0xdf330c: mov ecx, dword ptr [rdi + 8]
0xdf330f: mov rax, qword ptr [rdi]
0xdf3312: mov rdx, qword ptr [rbp + 0x80]
0xdf3319: mov qword ptr [rax + rcx*8], rdx
0xdf331d: inc dword ptr [rdi + 8]
0xdf3320: cmp byte ptr [rsp + 0x50], 0
0xdf3325: je 0x140df3371
0xdf3327: test r15b, r15b
0xdf332a: jne 0x140df3371
0xdf332c: mov r8, qword ptr [rbp - 0x40]
0xdf3330: mov rdx, r8
0xdf3333: shr rdx, 0x20
0xdf3337: mov r9, qword ptr [rbp - 0x38]
0xdf333b: mov rcx, r9
0xdf333e: shr rcx, 0x20
0xdf3342: mov eax, esi
0xdf3344: shl rax, 0x20
0xdf3348: or eax, r12d
0xdf334b: cmp r9d, eax
0xdf334e: jg 0x140df3371
0xdf3350: mov rdi, qword ptr [rbp + 0x80]
0xdf3357: cmp ecx, esi
0xdf3359: jg 0x140df3378
0xdf335b: cmp eax, r8d
0xdf335e: jg 0x140df3378
0xdf3360: movzx r15d, r15b
0xdf3364: cmp esi, edx
0xdf3366: mov eax, 1
0xdf336b: cmovle r15d, eax
0xdf336f: jmp 0x140df3378
0xdf3371: mov rdi, qword ptr [rbp + 0x80]
0xdf3378: inc esi
0xdf337a: mov eax, dword ptr [rsp + 0x7c]
0xdf337e: cmp esi, eax
0xdf3380: jle 0x140df3160
0xdf3386: mov ecx, dword ptr [rbp - 0x80]
0xdf3389: mov edx, dword ptr [rbp - 0x50]
0xdf338c: inc r12d
0xdf338f: cmp r12d, edx
0xdf3392: jle 0x140df3150
0xdf3398: lea rbx, [rdi + 0xec]
0xdf339f: lea rsi, [rdi + 0xf8]
0xdf33a6: mov edx, 0x1fd
0xdf33ab: mov rax, qword ptr gs:[0x58]
0xdf33b4: mov rcx, qword ptr [rax]
0xdf33b7: cmp byte ptr [rdx + rcx], 0
0xdf33bb: mov edx, 0x10
0xdf33c0: mov ecx, edx
0xdf33c2: je 0x140df33cb
0xdf33c4: call 0x1447efa78
0xdf33c9: jmp 0x140df33d0
0xdf33cb: call 0x1447ef9b0
0xdf33d0: mov rdi, rax
0xdf33d3: test rax, rax
0xdf33d6: jne 0x140df33f3
0xdf33d8: call 0x141318e70
0xdf33dd: xor r9d, r9d
0xdf33e0: xor r8d, r8d
0xdf33e3: mov edx, 1
0xdf33e8: mov ecx, 0xa0000002
0xdf33ed: call qword ptr [rip + 0x43f7d55]
0xdf33f3: mov qword ptr [rbp - 0x30], rdi
0xdf33f7: xor eax, eax
0xdf33f9: test rdi, rdi
0xdf33fc: je 0x140df342c
0xdf33fe: mov qword ptr [rdi], rax
0xdf3401: mov qword ptr [rdi + 8], rax
0xdf3405: mov rax, qword ptr [rdi]
0xdf3408: mov rcx, qword ptr [rbp - 0x78]
0xdf340c: mov qword ptr [rdi], rcx
0xdf340f: mov r12, rax
0xdf3412: mov qword ptr [rbp - 0x78], rax
0xdf3416: mov eax, dword ptr [rdi + 8]
0xdf3419: mov dword ptr [rdi + 8], r14d
0xdf341d: mov dword ptr [rbp - 0x70], eax
0xdf3420: mov eax, dword ptr [rdi + 0xc]
0xdf3423: mov dword ptr [rdi + 0xc], r13d
0xdf3427: mov dword ptr [rbp - 0x6c], eax
0xdf342a: jmp 0x140df3433
0xdf342c: mov rdi, rax
0xdf342f: mov r12, qword ptr [rbp - 0x78]
0xdf3433: cmp rdi, qword ptr [rsi]
0xdf3436: je 0x140df3443
0xdf3438: mov rcx, rsi
0xdf343b: call 0x14040dc40
0xdf3440: mov qword ptr [rsi], rdi
0xdf3443: mov r13, qword ptr [rbp + 0x70]
0xdf3447: test r15b, r15b
0xdf344a: je 0x140df3496
0xdf344c: lea rdi, [r13 + 0x288]
0xdf3453: mov ecx, dword ptr [rdi + 8]
0xdf3456: mov eax, dword ptr [rdi + 0xc]
0xdf3459: cmp eax, ecx
0xdf345b: ja 0x140df3480
0xdf345d: lea edx, [rax*2 + 1]
0xdf3464: add edx, eax
0xdf3466: shr edx, 1
0xdf3468: cmp edx, 1
0xdf346b: mov eax, 1
0xdf3470: cmovb edx, eax
0xdf3473: cmp ecx, edx
0xdf3475: cmova edx, ecx
0xdf3478: mov rcx, rdi
0xdf347b: call 0x14035e3f0
0xdf3480: mov ecx, dword ptr [rdi + 8]
0xdf3483: mov rax, qword ptr [rdi]
0xdf3486: mov rdx, qword ptr [rbp + 0x80]
0xdf348d: mov qword ptr [rax + rcx*8], rdx
0xdf3491: inc dword ptr [rdi + 8]
0xdf3494: jmp 0x140df349e
0xdf3496: xor al, al
0xdf3498: mov byte ptr [rbp + 0x88], al
0xdf349e: test r12, r12
0xdf34a1: je 0x140df34cb
0xdf34a3: mov r8d, 0x1fd
0xdf34a9: mov rax, qword ptr gs:[0x58]
0xdf34b2: mov rdx, qword ptr [rax]
0xdf34b5: mov rcx, r12
0xdf34b8: cmp byte ptr [r8 + rdx], 0
0xdf34bd: je 0x140df34c6
0xdf34bf: call 0x1447f03bc
0xdf34c4: jmp 0x140df34cb
0xdf34c6: call 0x1447f02bc
0xdf34cb: xor r12d, r12d
0xdf34ce: mov qword ptr [rbp - 0x78], r12
0xdf34d2: mov qword ptr [rbp - 0x70], r12
0xdf34d6: mov r15, qword ptr [rbp + 0x78]
0xdf34da: xor al, al
0xdf34dc: test al, al
0xdf34de: jne 0x140df353e
0xdf34e0: movzx ebx, byte ptr [rbp + 0x88]
0xdf34e7: mov rcx, qword ptr [rbp - 0x60]
0xdf34eb: test rcx, rcx
0xdf34ee: je 0x140df38a5
0xdf34f4: mov r8d, 0x1fd
0xdf34fa: mov rax, qword ptr gs:[0x58]
0xdf3503: mov rdx, qword ptr [rax]
0xdf3506: cmp byte ptr [r8 + rdx], 0
0xdf350b: je 0x140df38a0
0xdf3511: call 0x1447f03bc
0xdf3516: jmp 0x140df38a5
0xdf351b: vmovss xmm0, dword ptr [rdi + 0xe0]
0xdf3523: vdivss xmm1, xmm0, xmm3
0xdf3527: vroundss xmm2, xmm2, xmm1, 1
0xdf352d: vcvttss2si eax, xmm2
0xdf3531: mov dword ptr [rbp - 0x48], eax
0xdf3534: mov dword ptr [rbp - 0x44], ecx
0xdf3537: mov rax, qword ptr [rbp - 0x48]
0xdf353b: mov qword ptr [rbx], rax
0xdf353e: mov qword ptr [rsp + 0x58], 0
0xdf3547: mov dword ptr [rsp + 0x60], r12d
0xdf354c: mov dword ptr [rsp + 0x64], 0xffffffff
0xdf3554: vpxor xmm0, xmm0, xmm0
0xdf3558: vmovdqu xmmword ptr [rsp + 0x68], xmm0
0xdf355e: mov qword ptr [rbp - 0x38], rbx
0xdf3562: inc dword ptr [r13 + 0x224]
0xdf3569: mov edx, 8
0xdf356e: mov rcx, rbx
0xdf3571: call 0x1403d6210
0xdf3576: lea rcx, [rbp - 0x40]
0xdf357a: mov qword ptr [rsp + 0x38], rcx
0xdf357f: lea rcx, [rbp - 0x30]
0xdf3583: mov qword ptr [rsp + 0x30], rcx
0xdf3588: lea rcx, [rsp + 0x51]
0xdf358d: mov qword ptr [rsp + 0x28], rcx
0xdf3592: lea r9, [rsp + 0x58]
0xdf3597: mov r8d, eax
0xdf359a: lea rdx, [rbp - 0x38]
0xdf359e: lea rcx, [r13 + 0x218]
0xdf35a5: call 0x140e02530
0xdf35aa: nop 
0xdf35ab: inc dword ptr [rsp + 0x64]
0xdf35af: mov ebx, 0x1fd
0xdf35b4: mov rcx, qword ptr [rsp + 0x68]
0xdf35b9: test rcx, rcx
0xdf35bc: je 0x140df35eb
0xdf35be: mov dword ptr [rsp + 0x58], r12d
0xdf35c3: mov rax, qword ptr gs:[0x58]
0xdf35cc: mov rdx, qword ptr [rax]
0xdf35cf: cmp byte ptr [rbx + rdx], 0
0xdf35d3: je 0x140df35dc
0xdf35d5: call 0x1447f03bc
0xdf35da: jmp 0x140df35e1
0xdf35dc: call 0x1447f02bc
0xdf35e1: mov qword ptr [rsp + 0x68], r12
0xdf35e6: mov qword ptr [rsp + 0x68], r12
0xdf35eb: mov r14, qword ptr [rsp + 0x70]
0xdf35f0: test r14, r14
0xdf35f3: je 0x140df36bc
0xdf35f9: mov eax, dword ptr [rsp + 0x5c]
0xdf35fd: test eax, eax
0xdf35ff: je 0x140df3688
0xdf3605: mov rdi, r14
0xdf3608: mov esi, eax
0xdf360a: mov r13d, 0x1fd
0xdf3610: mov rbx, qword ptr [rdi]
0xdf3613: mov qword ptr [rbp - 0x30], rbx
0xdf3617: mov rcx, qword ptr [rbx + 0x18]
0xdf361b: test rcx, rcx
0xdf361e: je 0x140df3640
0xdf3620: mov rax, qword ptr gs:[0x58]
0xdf3629: mov rdx, qword ptr [rax]
0xdf362c: cmp byte ptr [r13 + rdx], 0
0xdf3632: je 0x140df363b
0xdf3634: call 0x1447f03bc
0xdf3639: jmp 0x140df3640
0xdf363b: call 0x1447f02bc
0xdf3640: mov qword ptr [rbx + 0x18], r12
0xdf3644: mov qword ptr [rbx + 0x20], 0
0xdf364c: mov rcx, qword ptr [rdi]
0xdf364f: test rcx, rcx
0xdf3652: je 0x140df3674
0xdf3654: mov rax, qword ptr gs:[0x58]
0xdf365d: mov rdx, qword ptr [rax]
0xdf3660: cmp byte ptr [r13 + rdx], 0
0xdf3666: je 0x140df366f
0xdf3668: call 0x1447f03bc
0xdf366d: jmp 0x140df3674
0xdf366f: call 0x1447f02bc
0xdf3674: mov qword ptr [rdi], r12
0xdf3677: add rdi, 8
0xdf367b: sub rsi, 1
0xdf367f: jne 0x140df3610
0xdf3681: mov ebx, r13d
0xdf3684: mov r13, qword ptr [rbp + 0x70]
0xdf3688: mov qword ptr [rsp + 0x5c], 0
0xdf3691: mov rax, qword ptr gs:[0x58]
0xdf369a: mov rdx, qword ptr [rax]
0xdf369d: mov rcx, r14
0xdf36a0: cmp byte ptr [rbx + rdx], 0
0xdf36a4: je 0x140df36ad
0xdf36a6: call 0x1447f03bc
0xdf36ab: jmp 0x140df36b2
0xdf36ad: call 0x1447f02bc
0xdf36b2: mov qword ptr [rsp + 0x70], r12
0xdf36b7: mov qword ptr [rsp + 0x70], r12
0xdf36bc: mov qword ptr [rbp - 0x38], r15
0xdf36c0: mov rbx, qword ptr [rbp - 0x40]
0xdf36c4: inc dword ptr [rbx + 0xc]
0xdf36c7: mov edx, 0x10
0xdf36cc: mov rcx, r15
0xdf36cf: call 0x141364780
0xdf36d4: lea rcx, [rbp - 0x40]
0xdf36d8: mov qword ptr [rsp + 0x38], rcx
0xdf36dd: lea rcx, [rbp - 0x30]
0xdf36e1: mov qword ptr [rsp + 0x30], rcx
0xdf36e6: lea rcx, [rsp + 0x51]
0xdf36eb: mov qword ptr [rsp + 0x28], rcx
0xdf36f0: mov r8d, eax
0xdf36f3: lea rdx, [rbp - 0x38]
0xdf36f7: mov rcx, rbx
0xdf36fa: call 0x140e02830
0xdf36ff: mov rbx, qword ptr [rbp - 0x40]
0xdf3703: mov ecx, dword ptr [rbx + 8]
0xdf3706: mov eax, dword ptr [rbx + 0xc]
0xdf3709: mov esi, 1
0xdf370e: cmp eax, ecx
0xdf3710: ja 0x140df372f
0xdf3712: lea edx, [rax*2 + 1]
0xdf3719: add edx, eax
0xdf371b: shr edx, 1
0xdf371d: cmp edx, esi
0xdf371f: cmovb edx, esi
0xdf3722: cmp ecx, edx
0xdf3724: cmova edx, ecx
0xdf3727: mov rcx, rbx
0xdf372a: call 0x14035e3f0
0xdf372f: mov ecx, dword ptr [rbx + 8]
0xdf3732: mov rax, qword ptr [rbx]
0xdf3735: mov rdi, qword ptr [rbp + 0x80]
0xdf373c: mov qword ptr [rax + rcx*8], rdi
0xdf3740: inc dword ptr [rbx + 8]
0xdf3743: lea rdx, [rdi + 0xec]
0xdf374a: mov rcx, r13
0xdf374d: call 0x140df4760
0xdf3752: test al, al
0xdf3754: je 0x140df3899
0xdf375a: lea rbx, [r13 + 0x248]
0xdf3761: mov r9d, dword ptr [rbx + 8]
0xdf3765: mov ecx, r12d
0xdf3768: test r9d, r9d
0xdf376b: je 0x140df37a8
0xdf376d: mov r8, qword ptr [rbx]
0xdf3770: movzx r10d, byte ptr [r15 + 8]
0xdf3775: nop word ptr [rax + rax]
0xdf3780: mov edx, ecx
0xdf3782: shl rdx, 5
0xdf3786: cmp byte ptr [rdx + r8 + 8], r10b
0xdf378b: jne 0x140df379a
0xdf378d: mov rax, qword ptr [r15]
0xdf3790: cmp qword ptr [rdx + r8], rax
0xdf3794: je 0x140df3847
0xdf379a: inc ecx
0xdf379c: cmp ecx, r9d
0xdf379f: jb 0x140df3780
0xdf37a1: lea rbx, [r13 + 0x248]
0xdf37a8: mov ecx, 0xffffffff
0xdf37ad: cmp ecx, -1
0xdf37b0: jne 0x140df3853
0xdf37b6: vmovups xmm0, xmmword ptr [r15]
0xdf37bb: vmovups xmmword ptr [rsp + 0x58], xmm0
0xdf37c1: lea rdx, [rbp - 0x60]
0xdf37c5: lea rcx, [rsp + 0x68]
0xdf37ca: call 0x1406b1ed0
0xdf37cf: nop 
0xdf37d0: mov edi, 4
0xdf37d5: mov dword ptr [rsp + 0x78], edi
0xdf37d9: mov edx, dword ptr [rbx + 8]
0xdf37dc: cmp dword ptr [rbx + 0xc], edx
0xdf37df: ja 0x140df37e9
0xdf37e1: mov rcx, rbx
0xdf37e4: call 0x140e01c50
0xdf37e9: mov edx, dword ptr [rbx + 8]
0xdf37ec: shl rdx, 5
0xdf37f0: add rdx, qword ptr [rbx]
0xdf37f3: mov qword ptr [rbp + 0x80], rdx
0xdf37fa: vmovups xmm0, xmmword ptr [rsp + 0x58]
0xdf3800: vmovups xmmword ptr [rdx], xmm0
0xdf3804: mov rax, qword ptr [rsp + 0x68]
0xdf3809: mov qword ptr [rdx + 0x10], rax
0xdf380d: mov qword ptr [rsp + 0x68], r12
0xdf3812: mov eax, dword ptr [rsp + 0x70]
0xdf3816: mov dword ptr [rdx + 0x18], eax
0xdf3819: mov dword ptr [rsp + 0x70], r12d
0xdf381e: mov eax, dword ptr [rsp + 0x74]
0xdf3822: mov dword ptr [rdx + 0x1c], eax
0xdf3825: mov dword ptr [rsp + 0x74], r12d
0xdf382a: inc dword ptr [rbx + 8]
0xdf382d: and edi, 0xfffffffb
0xdf3830: mov dword ptr [rsp + 0x78], edi
0xdf3834: mov qword ptr [rsp + 0x68], r12
0xdf3839: mov qword ptr [rsp + 0x70], 0
0xdf3842: jmp 0x140df34e0
0xdf3847: lea rbx, [r13 + 0x248]
0xdf384e: jmp 0x140df37ad
0xdf3853: shl rcx, 5
0xdf3857: mov rbx, qword ptr [rbx]
0xdf385a: add rbx, rcx
0xdf385d: mov ecx, dword ptr [rbx + 0x18]
0xdf3860: mov eax, dword ptr [rbx + 0x1c]
0xdf3863: cmp eax, ecx
0xdf3865: ja 0x140df3886
0xdf3867: lea edx, [rax*2 + 1]
0xdf386e: add edx, eax
0xdf3870: shr edx, 1
0xdf3872: cmp edx, 1
0xdf3875: cmovb edx, esi
0xdf3878: cmp ecx, edx
0xdf387a: cmova edx, ecx
0xdf387d: lea rcx, [rbx + 0x10]
0xdf3881: call 0x14035e3f0
0xdf3886: mov ecx, dword ptr [rbx + 0x18]
0xdf3889: mov rax, qword ptr [rbx + 0x10]
0xdf388d: mov qword ptr [rax + rcx*8], rdi
0xdf3891: inc dword ptr [rbx + 0x18]
0xdf3894: jmp 0x140df34e0
0xdf3899: xor bl, bl
0xdf389b: jmp 0x140df34e7
0xdf38a0: call 0x1447f02bc
0xdf38a5: mov qword ptr [rbp - 0x60], r12
0xdf38a9: mov qword ptr [rbp - 0x58], 0
0xdf38b1: movzx eax, bl
0xdf38b4: lea r11, [rsp + 0x128]
0xdf38bc: vmovaps xmm6, xmmword ptr [r11 - 0x18]
0xdf38c2: vmovaps xmm7, xmmword ptr [r11 - 0x28]
0xdf38c8: vmovaps xmm8, xmmword ptr [r11 - 0x38]
0xdf38ce: mov rsp, r11
0xdf38d1: pop r15
0xdf38d3: pop r14
0xdf38d5: pop r13
0xdf38d7: pop r12
0xdf38d9: pop rdi
0xdf38da: pop rsi
0xdf38db: pop rbx
0xdf38dc: pop rbp
0xdf38dd: ret 