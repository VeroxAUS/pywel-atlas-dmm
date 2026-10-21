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
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x6b1ed0
0x6b1ed0: mov qword ptr [rsp + 0x10], rbx
0x6b1ed5: mov qword ptr [rsp + 0x18], rbp
0x6b1eda: push rdi
0x6b1edb: sub rsp, 0x20
0x6b1edf: xor ebp, ebp
0x6b1ee1: mov rdi, rdx
0x6b1ee4: mov qword ptr [rcx], rbp
0x6b1ee7: mov rbx, rcx
0x6b1eea: mov qword ptr [rcx + 8], rbp
0x6b1eee: cmp rdx, rcx
0x6b1ef1: je 0x1406b1f83
0x6b1ef7: cmp dword ptr [rdx + 8], ebp
0x6b1efa: je 0x1406b1f83
0x6b1f00: mov ecx, dword ptr [rdx + 0xc]
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x6b1ed0
0x6b1ed0: mov qword ptr [rsp + 0x10], rbx
0x6b1ed5: mov qword ptr [rsp + 0x18], rbp
0x6b1eda: push rdi
0x6b1edb: sub rsp, 0x20
0x6b1edf: xor ebp, ebp
0x6b1ee1: mov rdi, rdx
0x6b1ee4: mov qword ptr [rcx], rbp
0x6b1ee7: mov rbx, rcx
0x6b1eea: mov qword ptr [rcx + 8], rbp
0x6b1eee: cmp rdx, rcx
0x6b1ef1: je 0x1406b1f83
0x6b1ef7: cmp dword ptr [rdx + 8], ebp
0x6b1efa: je 0x1406b1f83
0x6b1f00: mov ecx, dword ptr [rdx + 0xc]
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x3d4130
0x3d4130: mov qword ptr [rsp + 0x18], rbx
0x3d4135: push rsi
0x3d4136: sub rsp, 0x20
0x3d413a: mov esi, edx
0x3d413c: mov rbx, rcx
0x3d413f: cmp edx, dword ptr [rcx + 0xc]
0x3d4142: ja 0x1403d4151
0x3d4144: xor al, al
0x3d4146: mov rbx, qword ptr [rsp + 0x40]
0x3d414b: add rsp, 0x20
0x3d414f: pop rsi
0x3d4150: ret 
0x3d4151: mov rax, qword ptr gs:[0x58]
0x3d415a: lea ecx, [rdx*8]
0x3d4161: mov qword ptr [rsp + 0x30], rbp
0x3d4166: mov edx, 4
0x3d416b: mov ebp, 0x1fd
0x3d4170: mov qword ptr [rsp + 0x38], rdi
0x3d4175: add rbp, qword ptr [rax]
0x3d4178: cmp byte ptr [rbp], 0
0x3d417c: je 0x1403d4185
0x3d417e: call 0x1447efa78
0x3d4183: jmp 0x1403d418a
0x3d4185: call 0x1447ef9b0
0x3d418a: mov rdi, rax
0x3d418d: test rax, rax
0x3d4190: jne 0x1403d41ad
0x3d4192: call 0x141318e70
0x3d4197: xor r9d, r9d
0x3d419a: xor r8d, r8d
0x3d419d: mov edx, 1
0x3d41a2: mov ecx, 0xa0000002
0x3d41a7: call qword ptr [rip + 0x4e16f9b]
0x3d41ad: xor r8d, r8d
0x3d41b0: cmp dword ptr [rbx + 8], r8d
0x3d41b4: jbe 0x1403d41dc
0x3d41b6: nop word ptr [rax + rax]
0x3d41c0: mov rax, qword ptr [rbx]
0x3d41c3: lea rdx, [r8*8]
0x3d41cb: inc r8d
0x3d41ce: mov rcx, qword ptr [rdx + rax]
0x3d41d2: mov qword ptr [rdx + rdi], rcx
0x3d41d6: cmp r8d, dword ptr [rbx + 8]
0x3d41da: jb 0x1403d41c0
0x3d41dc: mov rcx, qword ptr [rbx]
0x3d41df: test rcx, rcx
0x3d41e2: je 0x1403d41f6
0x3d41e4: cmp byte ptr [rbp], 0
0x3d41e8: je 0x1403d41f1
0x3d41ea: call 0x1447f03bc
0x3d41ef: jmp 0x1403d41f6
0x3d41f1: call 0x1447f02bc
0x3d41f6: mov rbp, qword ptr [rsp + 0x30]
0x3d41fb: mov al, 1
0x3d41fd: mov qword ptr [rbx], rdi
0x3d4200: mov rdi, qword ptr [rsp + 0x38]
0x3d4205: mov dword ptr [rbx + 0xc], esi
0x3d4208: mov rbx, qword ptr [rsp + 0x40]
0x3d420d: add rsp, 0x20
0x3d4211: pop rsi
0x3d4212: ret 
CALLEE 0x3d6210
0x3d6210: sub rsp, 8
0x3d6214: lea r9, [rcx + rdx]
0x3d6218: cmp rdx, 0x10
0x3d621c: jb 0x1403d62cb
CALLEE 0x40fac0
0x40fac0: mov qword ptr [rsp + 0x18], rbx
0x40fac5: mov qword ptr [rsp + 0x20], r9
0x40faca: mov qword ptr [rsp + 0x10], rdx
0x40facf: push rbp
0x40fad0: push rsi
0x40fad1: push rdi
0x40fad2: push r12
0x40fad4: push r13
0x40fad6: push r14
0x40fad8: push r15
0x40fada: sub rsp, 0x30
0x40fade: mov esi, r8d
0x40fae1: mov r14, rdx
0x40fae4: mov rdi, rcx
0x40fae7: cmp dword ptr [rcx], 0
0x40faea: jne 0x14040faf4
0x40faec: mov edx, r8d
0x40faef: call 0x140391680
0x40faf4: mov r10d, dword ptr [rdi]
0x40faf7: test r10d, r10d
0x40fafa: je 0x14040fb49
0x40fafc: xor edx, edx
0x40fafe: mov eax, esi
0x40fb00: div r10d
0x40fb03: mov r8d, edx
0x40fb06: shl r8, 8
0x40fb0a: add r8, qword ptr [rdi + 0x10]
0x40fb0e: xor edx, edx
0x40fb10: mov r9d, dword ptr [r8]
0x40fb13: test r9d, r9d
0x40fb16: je 0x14040fb49
0x40fb18: cmp dword ptr [r8 + rdx*8 + 8], esi
0x40fb1d: jne 0x14040fb42
0x40fb1f: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0x40fb24: mov rax, qword ptr [rdi + 0x18]
0x40fb28: mov rbx, qword ptr [rax + rcx*8]
0x40fb2c: mov rcx, qword ptr [r14]
0x40fb2f: mov eax, dword ptr [rcx]
0x40fb31: cmp dword ptr [rbx + 4], eax
0x40fb34: jne 0x14040fb42
0x40fb36: mov eax, dword ptr [rcx + 4]
0x40fb39: cmp dword ptr [rbx + 8], eax
0x40fb3c: je 0x14040fc08
0x40fb42: inc edx
0x40fb44: cmp edx, r9d
0x40fb47: jb 0x14040fb18
0x40fb49: mov rax, qword ptr [rsp + 0x98]
0x40fb51: mov byte ptr [rax], 0
0x40fb54: xor edx, edx
0x40fb56: mov eax, esi
0x40fb58: div r10d
0x40fb5b: mov ecx, edx
0x40fb5d: shl rcx, 8
0x40fb61: mov rax, qword ptr [rdi + 0x10]
0x40fb65: cmp dword ptr [rcx + rax], 0x1f
0x40fb69: jne 0x14040fb7b
0x40fb6b: mov edx, esi
0x40fb6d: mov rcx, rdi
0x40fb70: call 0x140391680
0x40fb75: xor edx, edx
0x40fb77: mov eax, esi
0x40fb79: div dword ptr [rdi]
0x40fb7b: mov r12d, edx
0x40fb7e: shl r12, 8
0x40fb82: add r12, qword ptr [rdi + 0x10]
0x40fb86: mov ecx, dword ptr [r12]
0x40fb8a: mov dword ptr [rsp + 0xb0], ecx
0x40fb91: imul eax, edx, 0x1f
0x40fb94: add eax, ecx
0x40fb96: mov dword ptr [rsp + 0x70], eax
0x40fb9a: mov r13d, dword ptr [rdi + 4]
0x40fb9e: mov dword ptr [rsp + 0x90], r13d
0x40fba6: lea r15, [rdi + 8]
0x40fbaa: mov ecx, dword ptr [r15]
0x40fbad: lea rbp, [rdi + 4]
0x40fbb1: mov edx, 0x1fd
0x40fbb6: cmp r13d, ecx
0x40fbb9: jb 0x14040fcd9
0x40fbbf: lea eax, [r13 + 1]
0x40fbc3: lea rbp, [rdi + 4]
0x40fbc7: cmp eax, ecx
0x40fbc9: jbe 0x14040fcd9
0x40fbcf: lea r13d, [rax*2 + 1]
0x40fbd7: add r13d, eax
0x40fbda: shr r13d, 1
0x40fbdd: lea ecx, [r13*8]
0x40fbe5: mov rax, qword ptr gs:[0x58]
0x40fbee: mov rax, qword ptr [rax]
0x40fbf1: mov qword ptr [rsp + 0x20], rax
0x40fbf6: cmp byte ptr [rdx + rax], 0
0x40fbfa: mov edx, 0x40
0x40fbff: je 0x14040fc21
0x40fc01: call 0x1447efa78
0x40fc06: jmp 0x14040fc26
0x40fc08: test rbx, rbx
0x40fc0b: je 0x14040fb49
0x40fc11: mov rax, qword ptr [rsp + 0x98]
0x40fc19: mov byte ptr [rax], 1
0x40fc1c: jmp 0x14040fd94
0x40fc21: call 0x1447ef9b0
0x40fc26: mov r14, rax
0x40fc29: lea rbp, [rdi + 4]
0x40fc2d: test rax, rax
0x40fc30: jne 0x14040fc55
0x40fc32: call 0x141318e70
0x40fc37: xor r9d, r9d
0x40fc3a: xor r8d, r8d
0x40fc3d: mov edx, 1
0x40fc42: mov ecx, 0xa0000002
0x40fc47: call qword ptr [rip + 0x4ddb4fb]
0x40fc4d: lea rbp, [rdi + 4]
0x40fc51: lea r15, [rdi + 8]
0x40fc55: lea rbx, [rdi + 0x18]
0x40fc59: cmp qword ptr [rbx], 0
0x40fc5d: je 0x14040fcc1
0x40fc5f: xor r8d, r8d
0x40fc62: mov rcx, rbx
0x40fc65: cmp dword ptr [rbp], r8d
0x40fc69: jbe 0x14040fc94
0x40fc6b: nop dword ptr [rax + rax]
0x40fc70: lea rdx, [r8*8]
0x40fc78: mov rax, qword ptr [rbx]
0x40fc7b: mov rcx, qword ptr [rdx + rax]
0x40fc7f: mov qword ptr [rdx + r14], rcx
0x40fc83: inc r8d
0x40fc86: cmp r8d, dword ptr [rbp]
0x40fc8a: jb 0x14040fc70
0x40fc8c: lea rcx, [rdi + 0x18]
0x40fc90: lea r15, [rdi + 8]
0x40fc94: mov rbx, rcx
0x40fc97: mov rcx, qword ptr [rcx]
0x40fc9a: test rcx, rcx
0x40fc9d: je 0x14040fcbd
0x40fc9f: mov rax, qword ptr [rsp + 0x20]
0x40fca4: mov r8d, 0x1fd
0x40fcaa: cmp byte ptr [r8 + rax], 0
0x40fcaf: je 0x14040fcb8
0x40fcb1: call 0x1447f03bc
0x40fcb6: jmp 0x14040fcbd
0x40fcb8: call 0x1447f02bc
0x40fcbd: lea rbp, [rdi + 4]
0x40fcc1: mov qword ptr [rbx], r14
0x40fcc4: mov dword ptr [r15], r13d
0x40fcc7: mov r14, qword ptr [rsp + 0x78]
0x40fccc: mov r13d, dword ptr [rsp + 0x90]
0x40fcd4: mov edx, 0x1fd
0x40fcd9: mov eax, dword ptr [rsp + 0xb0]
0x40fce0: mov dword ptr [r12 + rax*8 + 8], esi
0x40fce5: mov dword ptr [r12 + rax*8 + 0xc], r13d
0x40fcea: inc dword ptr [r12]
0x40fcee: mov rax, qword ptr gs:[0x58]
0x40fcf7: mov rcx, qword ptr [rax]
0x40fcfa: cmp byte ptr [rdx + rcx], 0
0x40fcfe: mov edx, 8
0x40fd03: mov ecx, 0x20
0x40fd08: je 0x14040fd11
0x40fd0a: call 0x1447efa78
0x40fd0f: jmp 0x14040fd16
0x40fd11: call 0x1447ef9b0
0x40fd16: mov rbx, rax
0x40fd19: test rax, rax
0x40fd1c: jne 0x14040fd3d
0x40fd1e: call 0x141318e70
0x40fd23: xor r9d, r9d
0x40fd26: xor r8d, r8d
0x40fd29: mov edx, 1
0x40fd2e: mov ecx, 0xa0000002
0x40fd33: call qword ptr [rip + 0x4ddb40f]
0x40fd39: lea rbp, [rdi + 4]
0x40fd3d: mov qword ptr [rsp + 0x20], rbx
0x40fd42: mov rax, qword ptr [r14]
0x40fd45: mov rcx, qword ptr [rax]
0x40fd48: mov eax, dword ptr [rsp + 0x70]
0x40fd4c: mov dword ptr [rbx], eax
0x40fd4e: mov qword ptr [rbx + 4], rcx
0x40fd52: xor ecx, ecx
0x40fd54: mov qword ptr [rbx + 0x10], rcx
0x40fd58: mov qword ptr [rbx + 0x18], rcx
0x40fd5c: mov rdx, qword ptr [rsp + 0x88]
0x40fd64: mov rax, qword ptr [rdx]
0x40fd67: mov qword ptr [rbx + 0x10], rax
0x40fd6b: mov qword ptr [rdx], rcx
0x40fd6e: mov ecx, dword ptr [rbx + 0x18]
0x40fd71: mov eax, dword ptr [rdx + 8]
0x40fd74: mov dword ptr [rbx + 0x18], eax
0x40fd77: mov dword ptr [rdx + 8], ecx
0x40fd7a: mov ecx, dword ptr [rbx + 0x1c]
0x40fd7d: mov eax, dword ptr [rdx + 0xc]
0x40fd80: mov dword ptr [rbx + 0x1c], eax
0x40fd83: mov dword ptr [rdx + 0xc], ecx
0x40fd86: mov ecx, r13d
0x40fd89: mov rax, qword ptr [rdi + 0x18]
0x40fd8d: mov qword ptr [rax + rcx*8], rbx
0x40fd91: inc dword ptr [rbp]
0x40fd94: lea rcx, [rbx + 4]
0x40fd98: mov rax, qword ptr [rsp + 0xa0]
0x40fda0: mov qword ptr [rax], rcx
0x40fda3: lea rcx, [rbx + 0x10]
0x40fda7: mov rax, qword ptr [rsp + 0xa8]
0x40fdaf: mov qword ptr [rax], rcx
0x40fdb2: mov rbx, qword ptr [rsp + 0x80]
0x40fdba: add rsp, 0x30
0x40fdbe: pop r15
0x40fdc0: pop r14
0x40fdc2: pop r13
0x40fdc4: pop r12
0x40fdc6: pop rdi
0x40fdc7: pop rsi
0x40fdc8: pop rbp
0x40fdc9: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x47efa78
0x47efa78: mov qword ptr [rsp + 8], rbx
0x47efa7d: push rdi
0x47efa7e: sub rsp, 0x20
0x47efa82: mov rdi, rcx
0x47efa85: mov rbx, rdx
0x47efa88: lea rcx, [rip + 0x2426f39]
0x47efa8f: call qword ptr [rip + 0x9fb753]
0x47efa95: mov rax, qword ptr [rip + 0x241ebcc]
0x47efa9c: test rax, rax
0x47efa9f: jne 0x1447efaad
0x47efaa1: call 0x1447f19a8
0x47efaa6: mov qword ptr [rip + 0x241ebbb], rax
0x47efaad: mov r8, rbx
0x47efab0: mov rdx, rdi
0x47efab3: mov rcx, rax
0x47efab6: call 0x1447ef648
0x47efabb: lea rcx, [rip + 0x2426f06]
0x47efac2: mov rbx, rax
0x47efac5: call qword ptr [rip + 0x9fb725]
0x47efacb: mov rax, rbx
0x47eface: mov rbx, qword ptr [rsp + 0x30]
0x47efad3: add rsp, 0x20
0x47efad7: pop rdi
0x47efad8: ret 
CALLEE 0x47ef9b0
0x47ef9b0: mov qword ptr [rsp + 8], rbx
0x47ef9b5: mov qword ptr [rsp + 0x10], rsi
0x47ef9ba: push rdi
0x47ef9bb: sub rsp, 0x20
0x47ef9bf: mov rax, qword ptr gs:[0x58]
0x47ef9c8: mov rdi, rdx
0x47ef9cb: mov r8d, dword ptr [rip + 0x249927e]
0x47ef9d2: mov rsi, rcx
0x47ef9d5: mov rbx, qword ptr [rax + r8*8]
0x47ef9d9: mov eax, 0x98
0x47ef9de: cmp byte ptr [rax + rbx], 0
0x47ef9e2: jne 0x1447ef9e9
0x47ef9e4: call 0x1448953c4
0x47ef9e9: mov ecx, 0x90
0x47ef9ee: mov r8, rdi
0x47ef9f1: mov rdx, rsi
0x47ef9f4: mov rcx, qword ptr [rcx + rbx]
0x47ef9f8: mov rbx, qword ptr [rsp + 0x30]
0x47ef9fd: mov rsi, qword ptr [rsp + 0x38]
0x47efa02: add rsp, 0x20
0x47efa06: pop rdi
0x47efa07: jmp 0x1447ef648
CALLEE 0x40dc40
0x40dc40: mov qword ptr [rsp + 0x10], rbx
0x40dc45: mov qword ptr [rsp + 0x18], rbp
0x40dc4a: mov qword ptr [rsp + 0x20], rsi
0x40dc4f: push rdi
0x40dc50: sub rsp, 0x20
0x40dc54: mov rdi, rcx
0x40dc57: mov rbx, qword ptr [rcx]
0x40dc5a: test rbx, rbx
0x40dc5d: je 0x14040dcbe
0x40dc5f: mov qword ptr [rsp + 0x30], rbx
0x40dc64: mov rcx, qword ptr [rbx]
0x40dc67: mov ebp, 0x1fd
0x40dc6c: test rcx, rcx
0x40dc6f: je 0x14040dc90
0x40dc71: mov rax, qword ptr gs:[0x58]
0x40dc7a: mov rdx, qword ptr [rax]
0x40dc7d: cmp byte ptr [rbp + rdx], 0
0x40dc82: je 0x14040dc8b
0x40dc84: call 0x1447f03bc
0x40dc89: jmp 0x14040dc90
0x40dc8b: call 0x1447f02bc
0x40dc90: xor esi, esi
0x40dc92: mov qword ptr [rbx], rsi
0x40dc95: mov qword ptr [rbx + 8], rsi
0x40dc99: mov rax, qword ptr gs:[0x58]
0x40dca2: mov rdx, qword ptr [rax]
0x40dca5: mov rcx, rbx
0x40dca8: cmp byte ptr [rbp + rdx], sil
0x40dcad: je 0x14040dcb6
0x40dcaf: call 0x1447f03bc
0x40dcb4: jmp 0x14040dcbb
0x40dcb6: call 0x1447f02bc
0x40dcbb: mov qword ptr [rdi], rsi
0x40dcbe: mov rbx, qword ptr [rsp + 0x38]
0x40dcc3: mov rbp, qword ptr [rsp + 0x40]
0x40dcc8: mov rsi, qword ptr [rsp + 0x48]
0x40dccd: add rsp, 0x20
0x40dcd1: pop rdi
0x40dcd2: ret 
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x3d6210
0x3d6210: sub rsp, 8
0x3d6214: lea r9, [rcx + rdx]
0x3d6218: cmp rdx, 0x10
0x3d621c: jb 0x1403d62cb
CALLEE 0xe02530
0xe02530: mov qword ptr [rsp + 0x10], rbx
0xe02535: mov qword ptr [rsp + 0x20], r9
0xe0253a: push rbp
0xe0253b: push rsi
0xe0253c: push rdi
0xe0253d: push r12
0xe0253f: push r13
0xe02541: push r14
0xe02543: push r15
0xe02545: sub rsp, 0x40
0xe02549: mov ebp, r8d
0xe0254c: mov r13, rdx
0xe0254f: mov rdi, rcx
0xe02552: cmp dword ptr [rcx], 0
0xe02555: jne 0x140e0255f
0xe02557: mov edx, r8d
0xe0255a: call 0x140391680
0xe0255f: mov r10d, dword ptr [rdi]
0xe02562: xor r14d, r14d
0xe02565: test r10d, r10d
0xe02568: je 0x140e025bb
0xe0256a: xor edx, edx
0xe0256c: mov eax, ebp
0xe0256e: div r10d
0xe02571: mov r8d, edx
0xe02574: shl r8, 8
0xe02578: add r8, qword ptr [rdi + 0x10]
0xe0257c: mov edx, r14d
0xe0257f: mov r9d, dword ptr [r8]
0xe02582: test r9d, r9d
0xe02585: je 0x140e025bb
0xe02587: mov eax, edx
0xe02589: cmp dword ptr [r8 + rax*8 + 8], ebp
0xe0258e: jne 0x140e025b4
0xe02590: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0xe02595: mov rax, qword ptr [rdi + 0x18]
0xe02599: mov rbx, qword ptr [rax + rcx*8]
0xe0259d: mov rcx, qword ptr [r13]
0xe025a1: mov eax, dword ptr [rcx]
0xe025a3: cmp dword ptr [rbx + 4], eax
0xe025a6: jne 0x140e025b4
0xe025a8: mov eax, dword ptr [rcx + 4]
0xe025ab: cmp dword ptr [rbx + 8], eax
0xe025ae: je 0x140e0267e
0xe025b4: inc edx
0xe025b6: cmp edx, r9d
0xe025b9: jb 0x140e02587
0xe025bb: mov rax, qword ptr [rsp + 0xa8]
0xe025c3: mov byte ptr [rax], r14b
0xe025c6: xor edx, edx
0xe025c8: mov eax, ebp
0xe025ca: div r10d
0xe025cd: mov ecx, edx
0xe025cf: shl rcx, 8
0xe025d3: mov rax, qword ptr [rdi + 0x10]
0xe025d7: cmp dword ptr [rcx + rax], 0x1f
0xe025db: jne 0x140e025ed
0xe025dd: mov edx, ebp
0xe025df: mov rcx, rdi
0xe025e2: call 0x140391680
0xe025e7: xor edx, edx
0xe025e9: mov eax, ebp
0xe025eb: div dword ptr [rdi]
0xe025ed: mov r8d, edx
0xe025f0: shl r8, 8
0xe025f4: add r8, qword ptr [rdi + 0x10]
0xe025f8: mov qword ptr [rsp + 0x30], r8
0xe025fd: mov ecx, dword ptr [r8]
0xe02600: mov dword ptr [rsp + 0x80], ecx
0xe02607: imul eax, edx, 0x1f
0xe0260a: add eax, ecx
0xe0260c: mov dword ptr [rsp + 0x20], eax
0xe02610: mov r15d, dword ptr [rdi + 4]
0xe02614: mov dword ptr [rsp + 0xc0], r15d
0xe0261c: lea r12, [rdi + 8]
0xe02620: mov ecx, dword ptr [r12]
0xe02624: lea rsi, [rdi + 4]
0xe02628: mov edx, 0x1fd
0xe0262d: cmp r15d, ecx
0xe02630: jb 0x140e02750
0xe02636: lea eax, [r15 + 1]
0xe0263a: lea rsi, [rdi + 4]
0xe0263e: cmp eax, ecx
0xe02640: jbe 0x140e02750
0xe02646: lea eax, [rax + rax*2]
0xe02649: inc eax
0xe0264b: shr eax, 1
0xe0264d: mov dword ptr [rsp + 0xa0], eax
0xe02654: lea ecx, [rax*8]
0xe0265b: mov rax, qword ptr gs:[0x58]
0xe02664: mov rax, qword ptr [rax]
0xe02667: mov qword ptr [rsp + 0x28], rax
0xe0266c: cmp byte ptr [rax + rdx], r14b
0xe02670: mov edx, 0x40
0xe02675: je 0x140e02697
0xe02677: call 0x1447efa78
0xe0267c: jmp 0x140e0269c
0xe0267e: test rbx, rbx
0xe02681: je 0x140e025bb
0xe02687: mov rax, qword ptr [rsp + 0xa8]
0xe0268f: mov byte ptr [rax], 1
0xe02692: jmp 0x140e027eb
0xe02697: call 0x1447ef9b0
0xe0269c: mov r15, rax
0xe0269f: lea rsi, [rdi + 4]
0xe026a3: test rax, rax
0xe026a6: jne 0x140e026cb
0xe026a8: call 0x141318e70
0xe026ad: xor r9d, r9d
0xe026b0: xor r8d, r8d
0xe026b3: mov edx, 1
0xe026b8: mov ecx, 0xa0000002
0xe026bd: call qword ptr [rip + 0x43e8a85]
0xe026c3: lea rsi, [rdi + 4]
0xe026c7: lea r12, [rdi + 8]
0xe026cb: lea rbx, [rdi + 0x18]
0xe026cf: cmp qword ptr [rbx], r14
0xe026d2: je 0x140e02730
0xe026d4: mov rcx, rbx
0xe026d7: cmp dword ptr [rsi], r14d
0xe026da: jbe 0x140e02703
0xe026dc: nop dword ptr [rax]
0xe026e0: lea rdx, [r14*8]
0xe026e8: mov rax, qword ptr [rbx]
0xe026eb: mov rcx, qword ptr [rdx + rax]
0xe026ef: mov qword ptr [rdx + r15], rcx
0xe026f3: inc r14d
0xe026f6: cmp r14d, dword ptr [rsi]
0xe026f9: jb 0x140e026e0
0xe026fb: lea rcx, [rdi + 0x18]
0xe026ff: lea r12, [rdi + 8]
0xe02703: mov rbx, rcx
0xe02706: mov rcx, qword ptr [rcx]
0xe02709: test rcx, rcx
0xe0270c: je 0x140e0272c
0xe0270e: mov rax, qword ptr [rsp + 0x28]
0xe02713: mov r8d, 0x1fd
0xe02719: cmp byte ptr [r8 + rax], 0
0xe0271e: je 0x140e02727
0xe02720: call 0x1447f03bc
0xe02725: jmp 0x140e0272c
0xe02727: call 0x1447f02bc
0xe0272c: lea rsi, [rdi + 4]
0xe02730: mov qword ptr [rbx], r15
0xe02733: mov eax, dword ptr [rsp + 0xa0]
0xe0273a: mov dword ptr [r12], eax
0xe0273e: mov r15d, dword ptr [rsp + 0xc0]
0xe02746: mov r8, qword ptr [rsp + 0x30]
0xe0274b: mov edx, 0x1fd
0xe02750: mov eax, dword ptr [rsp + 0x80]
0xe02757: mov dword ptr [r8 + rax*8 + 8], ebp
0xe0275c: mov dword ptr [r8 + rax*8 + 0xc], r15d
0xe02761: inc dword ptr [r8]
0xe02764: mov rax, qword ptr gs:[0x58]
0xe0276d: mov rcx, qword ptr [rax]
0xe02770: cmp byte ptr [rdx + rcx], 0
0xe02774: mov edx, 8
0xe02779: mov ecx, 0x30
0xe0277e: je 0x140e02787
0xe02780: call 0x1447efa78
0xe02785: jmp 0x140e0278c
0xe02787: call 0x1447ef9b0
0xe0278c: mov rbx, rax
0xe0278f: test rax, rax
0xe02792: jne 0x140e027b3
0xe02794: call 0x141318e70
0xe02799: xor r9d, r9d
0xe0279c: xor r8d, r8d
0xe0279f: mov edx, 1
0xe027a4: mov ecx, 0xa0000002
0xe027a9: call qword ptr [rip + 0x43e8999]
0xe027af: lea rsi, [rdi + 4]
0xe027b3: mov qword ptr [rsp + 0x80], rbx
0xe027bb: mov rax, qword ptr [r13]
0xe027bf: mov rcx, qword ptr [rax]
0xe027c2: mov eax, dword ptr [rsp + 0x20]
0xe027c6: mov dword ptr [rbx], eax
0xe027c8: mov qword ptr [rbx + 4], rcx
0xe027cc: lea rcx, [rbx + 0x10]
0xe027d0: mov rdx, qword ptr [rsp + 0x98]
0xe027d8: call 0x140e03370
0xe027dd: nop 
0xe027de: mov ecx, r15d
0xe027e1: mov rax, qword ptr [rdi + 0x18]
0xe027e5: mov qword ptr [rax + rcx*8], rbx
0xe027e9: inc dword ptr [rsi]
0xe027eb: lea rcx, [rbx + 4]
0xe027ef: mov rax, qword ptr [rsp + 0xb0]
0xe027f7: mov qword ptr [rax], rcx
0xe027fa: lea rcx, [rbx + 0x10]
0xe027fe: mov rax, qword ptr [rsp + 0xb8]
0xe02806: mov qword ptr [rax], rcx
0xe02809: mov rbx, qword ptr [rsp + 0x88]
0xe02811: add rsp, 0x40
0xe02815: pop r15
0xe02817: pop r14
0xe02819: pop r13
0xe0281b: pop r12
0xe0281d: pop rdi
0xe0281e: pop rsi
0xe0281f: pop rbp
0xe02820: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x47f03bc
0x47f03bc: sub rsp, 0x28
0x47f03c0: mov r9, rcx
0x47f03c3: test rcx, rcx
0x47f03c6: je 0x1447f03fc
0x47f03c8: dec rcx
0x47f03cb: mov rax, r9
0x47f03ce: and rcx, 0xfffffffffe000000
0x47f03d5: xor r8d, r8d
0x47f03d8: sub rax, rcx
0x47f03db: shr rax, 0x10
0x47f03df: lea rdx, [rcx + 0x108]
0x47f03e6: lea rax, [rax + rax*4]
0x47f03ea: shl rax, 4
0x47f03ee: add rdx, rax
0x47f03f1: mov eax, dword ptr [rdx + 4]
0x47f03f4: sub rdx, rax
0x47f03f7: call 0x1447efff4
0x47f03fc: add rsp, 0x28
0x47f0400: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
CALLEE 0x1364780
0x1364780: mov qword ptr [rsp + 8], rbx
0x1364785: mov qword ptr [rsp + 0x10], rsi
0x136478a: mov qword ptr [rsp + 0x18], rdi
0x136478f: lea ebx, [rdx - 0x2145e233]
0x1364795: mov rdi, rdx
0x1364798: mov r9d, ebx
0x136479b: mov r11d, ebx
0x136479e: test cl, 3
0x13647a1: jne 0x141364909
0x13647a7: cmp rdx, 0xc
0x13647ab: jbe 0x14136485e
0x13647b1: lea r8, [rdx - 0xd]
0x13647b5: movabs rax, 0xaaaaaaaaaaaaaaab
0x13647bf: mul r8
0x13647c2: mov rsi, rdx
0x13647c5: shr rsi, 3
0x13647c9: inc rsi
0x13647cc: imul rax, rsi, -0xc
0x13647d0: add rdi, rax
0x13647d3: nop dword ptr [rax]
0x13647d7: nop word ptr [rax + rax]
0x13647e0: mov r8d, dword ptr [rcx + 8]
0x13647e4: mov r10d, dword ptr [rcx + 4]
0x13647e8: add r8d, ebx
0x13647eb: add r10d, r9d
0x13647ee: sub r11d, r8d
0x13647f1: add r11d, dword ptr [rcx]
0x13647f4: mov r9d, r8d
0x13647f7: ror r9d, 0x1c
0x13647fb: add rcx, 0xc
0x13647ff: xor r9d, r11d
0x1364802: lea eax, [r10 + r8]
0x1364806: sub r10d, r9d
0x1364809: mov r8d, r9d
0x136480c: ror r8d, 0x1a
0x1364810: lea edx, [rax + r9]
0x1364814: xor r8d, r10d
0x1364817: sub eax, r8d
0x136481a: mov r9d, r8d
0x136481d: ror r9d, 0x18
0x1364821: xor r9d, eax
0x1364824: lea eax, [rdx + r8]
0x1364828: sub edx, r9d
0x136482b: mov r8d, r9d
0x136482e: ror r8d, 0x10
0x1364832: xor r8d, edx
0x1364835: lea edx, [rax + r9]
0x1364839: sub eax, r8d
0x136483c: mov r9d, r8d
0x136483f: ror r9d, 0xd
0x1364843: xor r9d, eax
0x1364846: mov ebx, r9d
0x1364849: lea r11d, [r8 + rdx]
0x136484d: sub edx, r9d
0x1364850: ror ebx, 0x1c
0x1364853: xor ebx, edx
0x1364855: add r9d, r11d
0x1364858: sub rsi, 1
0x136485c: jne 0x1413647e0
0x136485e: lea rdx, [rip - 0x1364865]
0x1364865: mov eax, dword ptr [rdx + rdi*4 + 0x1364c68]
0x136486c: add rax, rdx
0x136486f: jmp rax
0x1364871: add ebx, dword ptr [rcx + 8]
0x1364874: add r9d, dword ptr [rcx + 4]
0x1364878: add r11d, dword ptr [rcx]
0x136487b: jmp 0x141364c01
0x1364880: mov eax, dword ptr [rcx + 8]
0x1364883: add r9d, dword ptr [rcx + 4]
0x1364887: and eax, 0xffffff
0x136488c: add ebx, eax
0x136488e: add r11d, dword ptr [rcx]
0x1364891: jmp 0x141364c01
0x1364896: movzx eax, word ptr [rcx + 8]
0x136489a: add r9d, dword ptr [rcx + 4]
0x136489e: add ebx, eax
0x13648a0: add r11d, dword ptr [rcx]
0x13648a3: jmp 0x141364c01
0x13648a8: movzx eax, byte ptr [rcx + 8]
0x13648ac: add r9d, dword ptr [rcx + 4]
0x13648b0: add ebx, eax
0x13648b2: add r11d, dword ptr [rcx]
0x13648b5: jmp 0x141364c01
0x13648ba: mov eax, dword ptr [rcx + 4]
0x13648bd: and eax, 0xffffff
0x13648c2: add r9d, eax
0x13648c5: add r11d, dword ptr [rcx]
0x13648c8: jmp 0x141364c01
0x13648cd: movzx eax, word ptr [rcx + 4]
0x13648d1: add r9d, eax
0x13648d4: add r11d, dword ptr [rcx]
0x13648d7: jmp 0x141364c01
0x13648dc: movzx eax, byte ptr [rcx + 4]
0x13648e0: add r9d, eax
0x13648e3: add r11d, dword ptr [rcx]
0x13648e6: jmp 0x141364c01
0x13648eb: mov eax, dword ptr [rcx]
0x13648ed: and eax, 0xffffff
0x13648f2: jmp 0x141364bfe
0x13648f7: mov eax, ebx
0x13648f9: mov rbx, qword ptr [rsp + 8]
0x13648fe: mov rsi, qword ptr [rsp + 0x10]
0x1364903: mov rdi, qword ptr [rsp + 0x18]
0x1364908: ret 
0x1364909: test cl, 1
0x136490c: jne 0x141364a72
0x1364912: cmp rdi, 0xc
0x1364916: jbe 0x1413649e3
0x136491c: add rdx, -0xd
0x1364920: movabs rax, 0xaaaaaaaaaaaaaaab
0x136492a: mul rdx
0x136492d: mov rsi, rdx
0x1364930: shr rsi, 3
0x1364934: inc rsi
0x1364937: imul rax, rsi, -0xc
0x136493b: add rdi, rax
0x136493e: nop 
0x1364940: movzx eax, word ptr [rcx + 6]
0x1364944: movzx r10d, word ptr [rcx + 4]
0x1364949: movzx r8d, word ptr [rcx + 8]
0x136494e: movzx edx, word ptr [rcx]
0x1364951: shl eax, 0x10
0x1364954: add eax, r9d
0x1364957: add r10d, eax
0x136495a: movzx eax, word ptr [rcx + 0xa]
0x136495e: shl eax, 0x10
0x1364961: add eax, ebx
0x1364963: add r8d, eax
0x1364966: movzx eax, word ptr [rcx + 2]
0x136496a: shl eax, 0x10
0x136496d: mov r9d, r8d
0x1364970: sub eax, r8d
0x1364973: ror r9d, 0x1c
0x1364977: add eax, r11d
0x136497a: add rcx, 0xc
0x136497e: add edx, eax
0x1364980: lea eax, [r10 + r8]
0x1364984: xor r9d, edx
0x1364987: sub r10d, r9d
0x136498a: mov r8d, r9d
0x136498d: ror r8d, 0x1a
0x1364991: xor r8d, r10d
0x1364994: lea edx, [r9 + rax]
0x1364998: sub eax, r8d
0x136499b: mov r9d, r8d
0x136499e: ror r9d, 0x18
0x13649a2: xor r9d, eax
0x13649a5: lea eax, [rdx + r8]
0x13649a9: sub edx, r9d
0x13649ac: mov r8d, r9d
0x13649af: ror r8d, 0x10
0x13649b3: xor r8d, edx
0x13649b6: lea edx, [r9 + rax]
0x13649ba: sub eax, r8d
0x13649bd: mov r9d, r8d
0x13649c0: ror r9d, 0xd
0x13649c4: xor r9d, eax
0x13649c7: lea r11d, [r8 + rdx]
0x13649cb: sub edx, r9d
0x13649ce: mov ebx, r9d
0x13649d1: ror ebx, 0x1c
0x13649d4: add r9d, r11d
0x13649d7: xor ebx, edx
0x13649d9: sub rsi, 1
0x13649dd: jne 0x141364940
0x13649e3: lea rdx, [rip - 0x13649ea]
0x13649ea: mov eax, dword ptr [rdx + rdi*4 + 0x1364c9c]
0x13649f1: add rax, rdx
0x13649f4: jmp rax
0x13649f6: movzx edx, word ptr [rcx + 0xa]
0x13649fa: movzx eax, word ptr [rcx + 8]
0x13649fe: shl edx, 0x10
0x1364a01: add ebx, eax
0x1364a03: add ebx, edx
0x1364a05: movzx edx, word ptr [rcx + 6]
0x1364a09: movzx eax, word ptr [rcx + 4]
0x1364a0d: shl edx, 0x10
0x1364a10: add r9d, eax
0x1364a13: add r9d, edx
0x1364a16: movzx edx, word ptr [rcx + 2]
0x1364a1a: movzx eax, word ptr [rcx]
0x1364a1d: shl edx, 0x10
0x1364a20: add r11d, eax
0x1364a23: add r11d, edx
0x1364a26: jmp 0x141364c01
0x1364a2b: movzx eax, byte ptr [rcx + 0xa]
0x1364a2f: shl eax, 0x10
0x1364a32: add ebx, eax
0x1364a34: movzx eax, word ptr [rcx + 8]
0x1364a38: add ebx, eax
0x1364a3a: jmp 0x141364a05
0x1364a3c: movzx eax, byte ptr [rcx + 8]
0x1364a40: add ebx, eax
0x1364a42: jmp 0x141364a05
0x1364a44: movzx eax, byte ptr [rcx + 6]
0x1364a48: shl eax, 0x10
0x1364a4b: add r9d, eax
0x1364a4e: movzx eax, word ptr [rcx + 4]
0x1364a52: add r9d, eax
0x1364a55: jmp 0x141364a16
0x1364a57: movzx eax, byte ptr [rcx + 4]
0x1364a5b: add r9d, eax
0x1364a5e: jmp 0x141364a16
0x1364a60: movzx eax, byte ptr [rcx + 2]
0x1364a64: shl eax, 0x10
0x1364a67: add r11d, eax
0x1364a6a: movzx eax, word ptr [rcx]
0x1364a6d: jmp 0x141364bfe
0x1364a72: cmp rdi, 0xc
0x1364a76: jbe 0x141364b84
0x1364a7c: add rdx, -0xd
0x1364a80: movabs rax, 0xaaaaaaaaaaaaaaab
0x1364a8a: mul rdx
0x1364a8d: mov rsi, rdx
0x1364a90: shr rsi, 3
0x1364a94: inc rsi
0x1364a97: imul rax, rsi, -0xc
0x1364a9b: add rdi, rax
0x1364a9e: nop 
0x1364aa0: movzx eax, byte ptr [rcx + 6]
0x1364aa4: movzx edx, byte ptr [rcx + 8]
0x1364aa8: movzx r8d, byte ptr [rcx + 7]
0x1364aad: movzx r10d, byte ptr [rcx + 4]
0x1364ab2: shl r8d, 8
0x1364ab6: add r8d, eax
0x1364ab9: movzx eax, byte ptr [rcx + 5]
0x1364abd: shl r8d, 8
0x1364ac1: add eax, r8d
0x1364ac4: movzx r8d, byte ptr [rcx + 0xb]
0x1364ac9: shl r8d, 8
0x1364acd: shl eax, 8
0x1364ad0: add eax, r9d
0x1364ad3: add r10d, eax
0x1364ad6: movzx eax, byte ptr [rcx + 0xa]
0x1364ada: add r8d, eax
0x1364add: movzx eax, byte ptr [rcx + 9]
0x1364ae1: shl r8d, 8
0x1364ae5: add r8d, eax
0x1364ae8: movzx eax, byte ptr [rcx + 2]
0x1364aec: shl r8d, 8
0x1364af0: add r8d, ebx
0x1364af3: add r8d, edx
0x1364af6: movzx edx, byte ptr [rcx + 3]
0x1364afa: shl edx, 8
0x1364afd: mov r9d, r8d
0x1364b00: add edx, eax
0x1364b02: ror r9d, 0x1c
0x1364b06: movzx eax, byte ptr [rcx + 1]
0x1364b0a: shl edx, 8
0x1364b0d: add edx, eax
0x1364b0f: movzx eax, byte ptr [rcx]
0x1364b12: shl edx, 8
0x1364b15: add rcx, 0xc
0x1364b19: add edx, eax
0x1364b1b: lea eax, [r8 + r10]
0x1364b1f: sub edx, r8d
0x1364b22: add edx, r11d
0x1364b25: xor r9d, edx
0x1364b28: sub r10d, r9d
0x1364b2b: mov r8d, r9d
0x1364b2e: ror r8d, 0x1a
0x1364b32: xor r8d, r10d
0x1364b35: lea edx, [r9 + rax]
0x1364b39: sub eax, r8d
0x1364b3c: mov r9d, r8d
0x1364b3f: ror r9d, 0x18
0x1364b43: xor r9d, eax
0x1364b46: lea eax, [rdx + r8]
0x1364b4a: sub edx, r9d
0x1364b4d: mov r8d, r9d
0x1364b50: ror r8d, 0x10
0x1364b54: xor r8d, edx
0x1364b57: lea edx, [r9 + rax]
0x1364b5b: sub eax, r8d
0x1364b5e: mov r9d, r8d
0x1364b61: ror r9d, 0xd
0x1364b65: xor r9d, eax
0x1364b68: lea r11d, [r8 + rdx]
0x1364b6c: sub edx, r9d
0x1364b6f: mov ebx, r9d
0x1364b72: ror ebx, 0x1c
0x1364b75: add r9d, r11d
0x1364b78: xor ebx, edx
0x1364b7a: sub rsi, 1
0x1364b7e: jne 0x141364aa0
0x1364b84: lea rdx, [rip - 0x1364b8b]
0x1364b8b: mov eax, dword ptr [rdx + rdi*4 + 0x1364cd0]
0x1364b92: add rax, rdx
0x1364b95: jmp rax
0x1364b97: movzx eax, byte ptr [rcx + 0xb]
0x1364b9b: shl eax, 0x18
0x1364b9e: add ebx, eax
0x1364ba0: movzx eax, byte ptr [rcx + 0xa]
0x1364ba4: shl eax, 0x10
0x1364ba7: add ebx, eax
0x1364ba9: movzx eax, byte ptr [rcx + 9]
0x1364bad: shl eax, 8
0x1364bb0: add ebx, eax
0x1364bb2: movzx eax, byte ptr [rcx + 8]
0x1364bb6: add ebx, eax
0x1364bb8: movzx eax, byte ptr [rcx + 7]
0x1364bbc: shl eax, 0x18
0x1364bbf: add r9d, eax
0x1364bc2: movzx eax, byte ptr [rcx + 6]
0x1364bc6: shl eax, 0x10
0x1364bc9: add r9d, eax
0x1364bcc: movzx eax, byte ptr [rcx + 5]
0x1364bd0: shl eax, 8
0x1364bd3: add r9d, eax
0x1364bd6: movzx eax, byte ptr [rcx + 4]
0x1364bda: add r9d, eax
0x1364bdd: movzx eax, byte ptr [rcx + 3]
0x1364be1: shl eax, 0x18
0x1364be4: add r11d, eax
0x1364be7: movzx eax, byte ptr [rcx + 2]
0x1364beb: shl eax, 0x10
0x1364bee: add r11d, eax
0x1364bf1: movzx eax, byte ptr [rcx + 1]
0x1364bf5: shl eax, 8
0x1364bf8: add r11d, eax
0x1364bfb: movzx eax, byte ptr [rcx]
0x1364bfe: add r11d, eax
0x1364c01: mov rsi, qword ptr [rsp + 0x10]
0x1364c06: xor ebx, r9d
0x1364c09: mov rdi, qword ptr [rsp + 0x18]
0x1364c0e: mov eax, r9d
0x1364c11: ror eax, 0x12
0x1364c14: sub ebx, eax
0x1364c16: mov eax, ebx
0x1364c18: mov ecx, ebx
0x1364c1a: ror eax, 0x15
0x1364c1d: xor ecx, r11d
0x1364c20: sub ecx, eax
0x1364c22: mov eax, ecx
0x1364c24: mov r8d, ecx
0x1364c27: ror eax, 7
0x1364c2a: xor r8d, r9d
0x1364c2d: sub r8d, eax
0x1364c30: mov eax, r8d
0x1364c33: mov r9d, r8d
0x1364c36: ror eax, 0x10
0x1364c39: xor r9d, ebx
0x1364c3c: mov rbx, qword ptr [rsp + 8]
0x1364c41: sub r9d, eax
0x1364c44: mov eax, r9d
0x1364c47: mov edx, r9d
0x1364c4a: xor edx, ecx
0x1364c4c: ror eax, 0x1c
0x1364c4f: sub edx, eax
0x1364c51: mov ecx, edx
0x1364c53: xor edx, r8d
0x1364c56: ror ecx, 0x12
0x1364c59: sub edx, ecx
0x1364c5b: mov ecx, edx
0x1364c5d: xor edx, r9d
0x1364c60: ror ecx, 8
0x1364c63: sub edx, ecx
0x1364c65: mov eax, edx
0x1364c67: ret 
0x1364c68: test dword ptr [rax + 0x36], 0x364bfb01
0x1364c6f: add dword ptr [rdx + 0x4a], ebp
0x1364c72: add ebx, ebp
0x1364c75: add dword ptr ss:[rax + 0x48], edi
0x1364c7a: add esp, ebx
0x1364c7d: add ebp, ecx
0x1364c81: add dword ptr ss:[rdx + 0x74013648], edi
0x1364c89: add dword ptr ss:[rax - 0x69fec9b8], ebp
0x1364c91: add dword ptr ss:[rax + 0x71013648], eax
0x1364c99: add edi, esi
0x1364c9d: add ebx, edi
0x1364ca1: add dword ptr ss:[rdx + 0x4a], ebp
0x1364ca6: add dword ptr ss:[rax + 0x4a], esp
0x1364caa: add dword ptr ss:[rsi], edx
0x1364cad: add dword ptr ss:[rdi + 0x4a], edx
0x1364cb2: add dword ptr ss:[rsi + 0x4a], ecx
0x1364cb6: add dword ptr ss:[rdx + rcx*2 + 0x36], eax
0x1364cbb: add dword ptr [rip + 0x3c01364a], eax
0x1364cc1: add dword ptr ss:[rdx + rcx*2], esi
0x1364cc6: add dword ptr ss:[rbx], ebp
0x1364cc9: add esi, esi
0x1364ccd: add edi, esi
0x1364cd1: add ebx, edi
0x1364cd5: add ecx, esi
0x1364cd9: add edi, esp
0x1364cdd: add ebp, ebx
0x1364ce1: add esi, edx
0x1364ce5: add esp, ecx
0x1364ce9: add edx, eax
0x1364ced: add dword ptr ss:[rax - 0x4dfec9b5], edi
0x1364cf5: add dword ptr ss:[rcx - 0x5ffec9b5], ebp
CALLEE 0xe02830
0xe02830: mov qword ptr [rsp + 0x18], rbx
0xe02835: mov qword ptr [rsp + 0x20], r9
0xe0283a: mov qword ptr [rsp + 0x10], rdx
0xe0283f: push rbp
0xe02840: push rsi
0xe02841: push rdi
0xe02842: push r12
0xe02844: push r13
0xe02846: push r14
0xe02848: push r15
0xe0284a: sub rsp, 0x20
0xe0284e: mov ebp, r8d
0xe02851: mov r14, rdx
0xe02854: mov rdi, rcx
0xe02857: cmp dword ptr [rcx], 0
0xe0285a: jne 0x140e02864
0xe0285c: mov edx, r8d
0xe0285f: call 0x140391680
0xe02864: mov r10d, dword ptr [rdi]
0xe02867: test r10d, r10d
0xe0286a: je 0x140e028bc
0xe0286c: xor edx, edx
0xe0286e: mov eax, ebp
0xe02870: div r10d
0xe02873: mov r8d, edx
0xe02876: shl r8, 8
0xe0287a: add r8, qword ptr [rdi + 0x10]
0xe0287e: xor edx, edx
0xe02880: mov r9d, dword ptr [r8]
0xe02883: test r9d, r9d
0xe02886: je 0x140e028bc
0xe02888: cmp dword ptr [r8 + rdx*8 + 8], ebp
0xe0288d: jne 0x140e028b5
0xe0288f: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xe02894: mov rax, qword ptr [rdi + 0x18]
0xe02898: mov rbx, qword ptr [rax + rcx*8]
0xe0289c: mov rcx, qword ptr [r14]
0xe0289f: movzx eax, byte ptr [rcx + 8]
0xe028a3: cmp byte ptr [rbx + 0x10], al
0xe028a6: jne 0x140e028b5
0xe028a8: mov rax, qword ptr [rcx]
0xe028ab: cmp qword ptr [rbx + 8], rax
0xe028af: je 0x140e02972
0xe028b5: inc edx
0xe028b7: cmp edx, r9d
0xe028ba: jb 0x140e02888
0xe028bc: mov rax, qword ptr [rsp + 0x88]
0xe028c4: mov byte ptr [rax], 0
0xe028c7: xor edx, edx
0xe028c9: mov eax, ebp
0xe028cb: div r10d
0xe028ce: mov ecx, edx
0xe028d0: shl rcx, 8
0xe028d4: mov rax, qword ptr [rdi + 0x10]
0xe028d8: cmp dword ptr [rcx + rax], 0x1f
0xe028dc: jne 0x140e028ee
0xe028de: mov edx, ebp
0xe028e0: mov rcx, rdi
0xe028e3: call 0x140391680
0xe028e8: xor edx, edx
0xe028ea: mov eax, ebp
0xe028ec: div dword ptr [rdi]
0xe028ee: mov r12d, edx
0xe028f1: shl r12, 8
0xe028f5: add r12, qword ptr [rdi + 0x10]
0xe028f9: mov ecx, dword ptr [r12]
0xe028fd: mov dword ptr [rsp + 0xa0], ecx
0xe02904: imul eax, edx, 0x1f
0xe02907: add eax, ecx
0xe02909: mov dword ptr [rsp + 0x78], eax
0xe0290d: mov r13d, dword ptr [rdi + 4]
0xe02911: lea r15, [rdi + 8]
0xe02915: mov ecx, dword ptr [r15]
0xe02918: lea rsi, [rdi + 4]
0xe0291c: mov edx, 0x1fd
0xe02921: cmp r13d, ecx
0xe02924: jb 0x140e02a47
0xe0292a: lea eax, [r13 + 1]
0xe0292e: lea rsi, [rdi + 4]
0xe02932: cmp eax, ecx
0xe02934: jbe 0x140e02a47
0xe0293a: lea eax, [rax + rax*2]
0xe0293d: inc eax
0xe0293f: shr eax, 1
0xe02941: mov dword ptr [rsp + 0x80], eax
0xe02948: lea ecx, [rax*8]
0xe0294f: mov rax, qword ptr gs:[0x58]
0xe02958: mov rax, qword ptr [rax]
0xe0295b: mov qword ptr [rsp + 0x60], rax
0xe02960: cmp byte ptr [rdx + rax], 0
0xe02964: mov edx, 0x40
0xe02969: je 0x140e0298b
0xe0296b: call 0x1447efa78
0xe02970: jmp 0x140e02990
0xe02972: test rbx, rbx
0xe02975: je 0x140e028bc
0xe0297b: mov rax, qword ptr [rsp + 0x88]
0xe02983: mov byte ptr [rax], 1
0xe02986: jmp 0x140e02ad6
0xe0298b: call 0x1447ef9b0
0xe02990: mov r14, rax
0xe02993: lea rsi, [rdi + 4]
0xe02997: test rax, rax
0xe0299a: jne 0x140e029bf
0xe0299c: call 0x141318e70
0xe029a1: xor r9d, r9d
0xe029a4: xor r8d, r8d
0xe029a7: mov edx, 1
0xe029ac: mov ecx, 0xa0000002
0xe029b1: call qword ptr [rip + 0x43e8791]
0xe029b7: lea rsi, [rdi + 4]
0xe029bb: lea r15, [rdi + 8]
0xe029bf: lea rbx, [rdi + 0x18]
0xe029c3: cmp qword ptr [rbx], 0
0xe029c7: je 0x140e02a30
0xe029c9: xor r8d, r8d
0xe029cc: mov rcx, rbx
0xe029cf: cmp dword ptr [rsi], r8d
0xe029d2: jbe 0x140e02a03
0xe029d4: nop dword ptr [rax]
0xe029d8: nop dword ptr [rax + rax]
0xe029e0: lea rdx, [r8*8]
0xe029e8: mov rax, qword ptr [rbx]
0xe029eb: mov rcx, qword ptr [rdx + rax]
0xe029ef: mov qword ptr [rdx + r14], rcx
0xe029f3: inc r8d
0xe029f6: cmp r8d, dword ptr [rsi]
0xe029f9: jb 0x140e029e0
0xe029fb: lea rcx, [rdi + 0x18]
0xe029ff: lea r15, [rdi + 8]
0xe02a03: mov rbx, rcx
0xe02a06: mov rcx, qword ptr [rcx]
0xe02a09: test rcx, rcx
0xe02a0c: je 0x140e02a2c
0xe02a0e: mov rax, qword ptr [rsp + 0x60]
0xe02a13: mov r8d, 0x1fd
0xe02a19: cmp byte ptr [r8 + rax], 0
0xe02a1e: je 0x140e02a27
0xe02a20: call 0x1447f03bc
0xe02a25: jmp 0x140e02a2c
0xe02a27: call 0x1447f02bc
0xe02a2c: lea rsi, [rdi + 4]
0xe02a30: mov qword ptr [rbx], r14
0xe02a33: mov eax, dword ptr [rsp + 0x80]
0xe02a3a: mov dword ptr [r15], eax
0xe02a3d: mov r14, qword ptr [rsp + 0x68]
0xe02a42: mov edx, 0x1fd
0xe02a47: mov eax, dword ptr [rsp + 0xa0]
0xe02a4e: mov dword ptr [r12 + rax*8 + 8], ebp
0xe02a53: mov dword ptr [r12 + rax*8 + 0xc], r13d
0xe02a58: inc dword ptr [r12]
0xe02a5c: mov rax, qword ptr gs:[0x58]
0xe02a65: mov rcx, qword ptr [rax]
0xe02a68: cmp byte ptr [rdx + rcx], 0
0xe02a6c: mov edx, 8
0xe02a71: mov ecx, 0x28
0xe02a76: je 0x140e02a7f
0xe02a78: call 0x1447efa78
0xe02a7d: jmp 0x140e02a84
0xe02a7f: call 0x1447ef9b0
0xe02a84: mov rbx, rax
0xe02a87: test rax, rax
0xe02a8a: jne 0x140e02aab
0xe02a8c: call 0x141318e70
0xe02a91: xor r9d, r9d
0xe02a94: xor r8d, r8d
0xe02a97: mov edx, 1
0xe02a9c: mov ecx, 0xa0000002
0xe02aa1: call qword ptr [rip + 0x43e86a1]
0xe02aa7: lea rsi, [rdi + 4]
0xe02aab: mov qword ptr [rsp + 0x60], rbx
0xe02ab0: mov rax, qword ptr [r14]
0xe02ab3: vmovups xmm0, xmmword ptr [rax]
0xe02ab7: mov eax, dword ptr [rsp + 0x78]
0xe02abb: mov dword ptr [rbx], eax
0xe02abd: vmovups xmmword ptr [rbx + 8], xmm0
0xe02ac2: xor eax, eax
0xe02ac4: mov qword ptr [rbx + 0x18], rax
0xe02ac8: mov qword ptr [rbx + 0x20], rax
0xe02acc: mov rax, qword ptr [rdi + 0x18]
0xe02ad0: mov qword ptr [rax + r13*8], rbx
0xe02ad4: inc dword ptr [rsi]
0xe02ad6: lea rcx, [rbx + 8]
0xe02ada: mov rax, qword ptr [rsp + 0x90]
0xe02ae2: mov qword ptr [rax], rcx
0xe02ae5: lea rcx, [rbx + 0x18]
0xe02ae9: mov rax, qword ptr [rsp + 0x98]
0xe02af1: mov qword ptr [rax], rcx
0xe02af4: mov rbx, qword ptr [rsp + 0x70]
0xe02af9: add rsp, 0x20
0xe02afd: pop r15
0xe02aff: pop r14
0xe02b01: pop r13
0xe02b03: pop r12
0xe02b05: pop rdi
0xe02b06: pop rsi
0xe02b07: pop rbp
0xe02b08: ret 
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x6b1ed0
0x6b1ed0: mov qword ptr [rsp + 0x10], rbx
0x6b1ed5: mov qword ptr [rsp + 0x18], rbp
0x6b1eda: push rdi
0x6b1edb: sub rsp, 0x20
0x6b1edf: xor ebp, ebp
0x6b1ee1: mov rdi, rdx
0x6b1ee4: mov qword ptr [rcx], rbp
0x6b1ee7: mov rbx, rcx
0x6b1eea: mov qword ptr [rcx + 8], rbp
0x6b1eee: cmp rdx, rcx
0x6b1ef1: je 0x1406b1f83
0x6b1ef7: cmp dword ptr [rdx + 8], ebp
0x6b1efa: je 0x1406b1f83
0x6b1f00: mov ecx, dword ptr [rdx + 0xc]
CALLEE 0x35e3f0
0x35e3f0: mov qword ptr [rsp + 0x18], rbx
0x35e3f5: push rsi
0x35e3f6: sub rsp, 0x20
0x35e3fa: mov esi, edx
0x35e3fc: mov rbx, rcx
0x35e3ff: cmp edx, dword ptr [rcx + 0xc]
0x35e402: ja 0x14035e411
0x35e404: xor al, al
0x35e406: mov rbx, qword ptr [rsp + 0x40]
0x35e40b: add rsp, 0x20
0x35e40f: pop rsi
0x35e410: ret 
0x35e411: mov rax, qword ptr gs:[0x58]
0x35e41a: lea ecx, [rdx*8]
0x35e421: mov qword ptr [rsp + 0x30], rbp
0x35e426: mov edx, 8
0x35e42b: mov ebp, 0x1fd
0x35e430: mov qword ptr [rsp + 0x38], rdi
0x35e435: add rbp, qword ptr [rax]
0x35e438: cmp byte ptr [rbp], 0
0x35e43c: je 0x14035e445
0x35e43e: call 0x1447efa78
0x35e443: jmp 0x14035e44a
0x35e445: call 0x1447ef9b0
0x35e44a: mov rdi, rax
0x35e44d: test rax, rax
0x35e450: jne 0x14035e46d
0x35e452: call 0x141318e70
0x35e457: xor r9d, r9d
0x35e45a: xor r8d, r8d
0x35e45d: mov edx, 1
0x35e462: mov ecx, 0xa0000002
0x35e467: call qword ptr [rip + 0x4e8ccdb]
0x35e46d: xor r8d, r8d
0x35e470: cmp dword ptr [rbx + 8], r8d
0x35e474: jbe 0x14035e49c
0x35e476: nop word ptr [rax + rax]
0x35e480: mov rax, qword ptr [rbx]
0x35e483: lea rdx, [r8*8]
0x35e48b: inc r8d
0x35e48e: mov rcx, qword ptr [rdx + rax]
0x35e492: mov qword ptr [rdx + rdi], rcx
0x35e496: cmp r8d, dword ptr [rbx + 8]
0x35e49a: jb 0x14035e480
0x35e49c: mov rcx, qword ptr [rbx]
0x35e49f: test rcx, rcx
0x35e4a2: je 0x14035e4b6
0x35e4a4: cmp byte ptr [rbp], 0
0x35e4a8: je 0x14035e4b1
0x35e4aa: call 0x1447f03bc
0x35e4af: jmp 0x14035e4b6
0x35e4b1: call 0x1447f02bc
0x35e4b6: mov rbp, qword ptr [rsp + 0x30]
0x35e4bb: mov al, 1
0x35e4bd: mov qword ptr [rbx], rdi
0x35e4c0: mov rdi, qword ptr [rsp + 0x38]
0x35e4c5: mov dword ptr [rbx + 0xc], esi
0x35e4c8: mov rbx, qword ptr [rsp + 0x40]
0x35e4cd: add rsp, 0x20
0x35e4d1: pop rsi
0x35e4d2: ret 
CALLEE 0x47f02bc
0x47f02bc: sub rsp, 0x28
0x47f02c0: mov r9, rcx
0x47f02c3: test rcx, rcx
0x47f02c6: je 0x1447f033d
0x47f02c8: mov r8, qword ptr gs:[0x30]
0x47f02d1: lea r10, [rcx - 1]
0x47f02d5: and r10, 0xfffffffffe000000
0x47f02dc: mov rax, rcx
0x47f02df: sub rax, r10
0x47f02e2: shr rax, 0x10
0x47f02e6: mov rdx, qword ptr [r10 + 0x100]
0x47f02ed: lea rcx, [r10 + 0x108]
0x47f02f4: lea rax, [rax + rax*4]
0x47f02f8: shl rax, 4
0x47f02fc: add rcx, rax
0x47f02ff: mov eax, dword ptr [rcx + 4]
0x47f0302: sub rcx, rax
0x47f0305: cmp r8, rdx
0x47f0308: jne 0x1447f032f
0x47f030a: cmp byte ptr [rcx + 0xe], 0
0x47f030e: jne 0x1447f032a
0x47f0310: mov rax, qword ptr [rcx + 0x20]
0x47f0314: mov qword ptr [r9], rax
0x47f0317: add dword ptr [rcx + 0x18], -1
0x47f031b: mov qword ptr [rcx + 0x20], r9
0x47f031f: jne 0x1447f033d
0x47f0321: add rsp, 0x28
0x47f0325: jmp 0x1447f41e0
0x47f032a: mov r8b, 1
0x47f032d: jmp 0x1447f0332
0x47f032f: xor r8d, r8d
0x47f0332: mov rdx, rcx
0x47f0335: mov rcx, r10
0x47f0338: call 0x1447efff4
0x47f033d: add rsp, 0x28
0x47f0341: ret 
