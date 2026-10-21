0xe13cf0: mov rax, rsp
0xe13cf3: mov qword ptr [rax + 8], rbx
0xe13cf7: push rbp
0xe13cf8: push rsi
0xe13cf9: push rdi
0xe13cfa: push r12
0xe13cfc: push r13
0xe13cfe: push r14
0xe13d00: push r15
0xe13d02: lea rbp, [rax - 0xf8]
0xe13d09: sub rsp, 0x1c0
0xe13d10: vmovaps xmmword ptr [rax - 0x48], xmm6
0xe13d15: vmovaps xmmword ptr [rax - 0x58], xmm7
0xe13d1a: vmovaps xmmword ptr [rax - 0x68], xmm8
0xe13d1f: vmovaps xmmword ptr [rax - 0x78], xmm9
0xe13d24: vmovaps xmmword ptr [rax - 0x88], xmm10
0xe13d2c: vmovaps xmmword ptr [rax - 0x98], xmm11
0xe13d34: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xe13d3c: vmovaps xmmword ptr [rax - 0xb8], xmm13
0xe13d44: vmovaps xmmword ptr [rax - 0xc8], xmm14
0xe13d4c: vmovaps xmmword ptr [rax - 0xd8], xmm15
0xe13d54: vmovaps xmm14, xmm1
0xe13d58: mov r14, rcx
0xe13d5b: xor r13d, r13d
0xe13d5e: call 0x140dee390
0xe13d63: lea rdx, [rbp - 8]
0xe13d67: call 0x14064f530
0xe13d6c: nop 
0xe13d6d: cmp byte ptr [rbp + 8], r13b
0xe13d71: je 0x140e14b32
0xe13d77: cmp byte ptr [r14 + 0x563], r13b
0xe13d7e: je 0x140e13d8f
0xe13d80: mov rcx, r14
0xe13d83: call 0x140e085c0
0xe13d88: mov byte ptr [r14 + 0x563], r13b
0xe13d8f: mov rax, qword ptr [rbp]
0xe13d93: lea rdx, [rax + 8]
0xe13d97: test rax, rax
0xe13d9a: cmove rdx, r13
0xe13d9e: mov rdx, qword ptr [rdx]
0xe13da1: lea rcx, [rbp + 0x110]
0xe13da8: call 0x140393df0
0xe13dad: nop 
0xe13dae: mov rax, qword ptr [rbp]
0xe13db2: mov rcx, qword ptr [rax + 0x68]
0xe13db6: lea rdx, [rbp - 0x20]
0xe13dba: mov rcx, qword ptr [rcx + 0x1a0]
0xe13dc1: call 0x1404f8220
0xe13dc6: movsx ecx, word ptr [rax + 0xe]
0xe13dca: vxorps xmm0, xmm0, xmm0
0xe13dce: vcvtsi2ss xmm0, xmm0, ecx
0xe13dd2: vmulss xmm0, xmm0, dword ptr [rip + 0x4f5f91a]
0xe13dda: vaddss xmm4, xmm0, dword ptr [rax + 8]
0xe13ddf: vmovss xmm3, dword ptr [rax + 4]
0xe13de4: movsx ecx, word ptr [rax + 0xc]
0xe13de8: vxorps xmm0, xmm0, xmm0
0xe13dec: vcvtsi2ss xmm0, xmm0, ecx
0xe13df0: vmulss xmm1, xmm0, dword ptr [rip + 0x4f5f8fc]
0xe13df8: vaddss xmm2, xmm1, dword ptr [rax]
0xe13dfc: vmovss dword ptr [rbp - 0x70], xmm2
0xe13e01: vmovss dword ptr [rbp - 0x6c], xmm3
0xe13e06: vmovss dword ptr [rbp - 0x68], xmm4
0xe13e0b: mov rax, qword ptr [rbp]
0xe13e0f: mov rcx, qword ptr [rax + 0x68]
0xe13e13: mov rcx, qword ptr [rcx + 0x1a0]
0xe13e1a: call 0x1417e9170
0xe13e1f: vmovaps xmm6, xmm0
0xe13e23: mov rcx, qword ptr [rbp + 0x110]
0xe13e2a: mov rax, qword ptr [rcx]
0xe13e2d: mov dl, 1
0xe13e2f: call qword ptr [rax + 0x20]
0xe13e32: vmovss xmm1, dword ptr [r14 + 0x330]
0xe13e3b: vmovss xmm7, dword ptr [rbp - 0x70]
0xe13e40: vsubss xmm0, xmm1, xmm7
0xe13e44: vmovss xmm3, dword ptr [rip + 0x4f5ee10]
0xe13e4c: vmovss xmm5, dword ptr [rbp - 0x68]
0xe13e51: vmovss xmm4, dword ptr [rbp - 0x6c]
0xe13e56: vmovss xmm2, dword ptr [rip + 0x4f5fa4a]
0xe13e5e: vcomiss xmm3, xmm0
0xe13e62: jb 0x140e13ea0
0xe13e64: vcomiss xmm0, xmm2
0xe13e68: jb 0x140e13ea0
0xe13e6a: vmovss xmm0, dword ptr [r14 + 0x334]
0xe13e73: vsubss xmm1, xmm0, xmm4
0xe13e77: vcomiss xmm3, xmm1
0xe13e7b: jb 0x140e13ea0
0xe13e7d: vcomiss xmm1, xmm2
0xe13e81: jb 0x140e13ea0
0xe13e83: vmovss xmm0, dword ptr [r14 + 0x338]
0xe13e8c: vsubss xmm1, xmm0, xmm5
0xe13e90: vcomiss xmm3, xmm1
0xe13e94: jb 0x140e13ea0
0xe13e96: vcomiss xmm1, xmm2
0xe13e9a: jb 0x140e13ea0
0xe13e9c: xor bl, bl
0xe13e9e: jmp 0x140e13ebd
0xe13ea0: mov bl, 1
0xe13ea2: vunpcklps xmm0, xmm7, xmm4
0xe13ea6: vmovsd qword ptr [rbp - 0x70], xmm0
0xe13eab: vmovsd qword ptr [r14 + 0x330], xmm0
0xe13eb4: vmovss dword ptr [r14 + 0x338], xmm5
0xe13ebd: mov byte ptr [rbp - 0x7f], bl
0xe13ec0: mov rax, qword ptr [r14 + 0x400]
0xe13ec7: mov rcx, qword ptr [rax + 8]
0xe13ecb: mov rax, qword ptr [rcx + 0x18]
0xe13ecf: mov rax, qword ptr [rax]
0xe13ed2: vmovss xmm0, dword ptr [r14 + 0x328]
0xe13edb: vsubss xmm1, xmm0, dword ptr [rax + 0x78]
0xe13ee0: vcomiss xmm3, xmm1
0xe13ee4: jb 0x140e13f0c
0xe13ee6: vcomiss xmm1, xmm2
0xe13eea: jb 0x140e13f0c
0xe13eec: vmovss xmm0, dword ptr [r14 + 0x32c]
0xe13ef5: vsubss xmm1, xmm0, dword ptr [rax + 0x7c]
0xe13efa: vcomiss xmm3, xmm1
0xe13efe: jb 0x140e13f0c
0xe13f00: vcomiss xmm1, xmm2
0xe13f04: jb 0x140e13f0c
0xe13f06: mov byte ptr [rbp - 0x7d], 0
0xe13f0a: jmp 0x140e13f1b
0xe13f0c: mov byte ptr [rbp - 0x7d], 1
0xe13f10: mov rax, qword ptr [rax + 0x78]
0xe13f14: mov qword ptr [r14 + 0x328], rax
0xe13f1b: vcomiss xmm4, dword ptr [rip + 0x5eca125]
0xe13f23: seta al
0xe13f26: mov byte ptr [rbp - 0x80], 0
0xe13f2a: cmp byte ptr [r14 + 0x569], al
0xe13f31: je 0x140e13f3e
0xe13f33: mov byte ptr [r14 + 0x569], al
0xe13f3a: mov byte ptr [rbp - 0x80], 1
0xe13f3e: vxorps xmm2, xmm2, xmm2
0xe13f42: vcvtsi2ss xmm2, xmm2, dword ptr [rip + 0x5e991be]
0xe13f4a: vdivss xmm0, xmm5, xmm2
0xe13f4e: vxorps xmm1, xmm1, xmm1
0xe13f52: vroundss xmm1, xmm1, xmm0, 1
0xe13f58: vcvttss2si ecx, xmm1
0xe13f5c: vdivss xmm2, xmm7, xmm2
0xe13f60: vxorps xmm0, xmm0, xmm0
0xe13f64: vroundss xmm0, xmm0, xmm2, 1
0xe13f6a: vcvttss2si eax, xmm0
0xe13f6e: mov dword ptr [rbp + 0x110], eax
0xe13f74: mov dword ptr [rbp + 0x114], ecx
0xe13f7a: cmp eax, dword ptr [r14 + 0x2a8]
0xe13f81: jne 0x140e13f8c
0xe13f83: cmp ecx, dword ptr [r14 + 0x2ac]
0xe13f8a: je 0x140e13f9b
0xe13f8c: mov rdx, qword ptr [rbp + 0x110]
0xe13f93: mov rcx, r14
0xe13f96: call 0x140df4060
0xe13f9b: mov rax, qword ptr [r14]
0xe13f9e: mov rcx, r14
0xe13fa1: call qword ptr [rax + 0x110]
0xe13fa7: mov rcx, qword ptr [rax + 0x10]
0xe13fab: vmovss xmm1, dword ptr [rcx + 0x70]
0xe13fb0: vmovss xmm0, dword ptr [rcx + 0x50]
0xe13fb5: vmovss xmm15, dword ptr [rip + 0x4f5f0f7]
0xe13fbd: vxorps xmm10, xmm10, xmm10
0xe13fc2: cmp byte ptr [rip + 0x5f0ca9f], 0
0xe13fc9: je 0x140e13fff
0xe13fcb: vmovaps xmm1, xmm15
0xe13fd0: vxorps xmm0, xmm0, xmm0
0xe13fd4: call 0x144898ff2
0xe13fd9: vmovaps xmm11, xmm0
0xe13fdd: vaddss xmm0, xmm11, xmm10
0xe13fe2: vmulss xmm2, xmm0, dword ptr [rip + 0x4f5f562]
0xe13fea: vmovss xmm0, dword ptr [r14 + 0x530]
0xe13ff3: vucomiss xmm0, xmm2
0xe13ff7: jp 0x140e14016
0xe13ff9: jne 0x140e14016
0xe13ffb: xor dl, dl
0xe13ffd: jmp 0x140e14021
0xe13fff: vucomiss xmm10, xmm0
0xe14003: jp 0x140e13fd4
0xe14005: jne 0x140e13fd4
0xe14007: vucomiss xmm10, xmm1
0xe1400b: jp 0x140e13fd4
0xe1400d: jne 0x140e13fd4
0xe1400f: vxorps xmm11, xmm11, xmm11
0xe14014: jmp 0x140e13fdd
0xe14016: mov dl, 1
0xe14018: vmovss dword ptr [r14 + 0x530], xmm2
0xe14021: vcomiss xmm10, xmm6
0xe14025: jbe 0x140e14031
0xe14027: vaddss xmm13, xmm6, dword ptr [rip + 0x4f5f361]
0xe1402f: jmp 0x140e14039
0xe14031: vsubss xmm13, xmm6, dword ptr [rip + 0x4f5f357]
0xe14039: vmovss xmm1, dword ptr [r14 + 0x53c]
0xe14042: vmovss dword ptr [rbp - 0x30], xmm1
0xe14047: vmovss xmm0, dword ptr [r14 + 0x540]
0xe14050: vmovss dword ptr [rbp - 0x2c], xmm0
0xe14055: mov rax, qword ptr [r14 + 0x3a0]
0xe1405c: mov rcx, qword ptr [rax + 0x18]
0xe14060: mov rax, qword ptr [rcx]
0xe14063: mov rcx, qword ptr [rax + 0x20]
0xe14067: mov rax, qword ptr [rcx + 0x20]
0xe1406b: vmovss xmm8, dword ptr [rax + 0x30]
0xe14070: vmovss xmm7, dword ptr [rax + 0x28]
0xe14075: vmovss xmm12, dword ptr [rax + 0x20]
0xe1407a: vmovss dword ptr [rbp - 0x20], xmm12
0xe1407f: vmovss dword ptr [rbp - 0x1c], xmm7
0xe14084: vmovss xmm9, dword ptr [r14 + 0x554]
0xe1408d: vmulss xmm0, xmm12, xmm1
0xe14091: vmovss dword ptr [r14 + 0x554], xmm0
0xe1409a: vucomiss xmm9, xmm0
0xe1409e: jp 0x140e140a6
0xe140a0: jne 0x140e140a6
0xe140a2: xor al, al
0xe140a4: jmp 0x140e140a8
0xe140a6: mov al, 1
0xe140a8: test bl, bl
0xe140aa: jne 0x140e140b7
0xe140ac: test dl, dl
0xe140ae: jne 0x140e140b7
0xe140b0: test al, al
0xe140b2: mov byte ptr [rbp - 0x7e], dl
0xe140b5: je 0x140e140bb
0xe140b7: mov byte ptr [rbp - 0x7e], 1
0xe140bb: xor bl, bl
0xe140bd: mov byte ptr [rbp - 0x7c], bl
0xe140c0: mov rax, qword ptr [r14 + 0x398]
0xe140c7: mov rcx, qword ptr [rax + 0x18]
0xe140cb: mov rdx, qword ptr [rcx]
0xe140ce: mov rax, qword ptr [rdx + 0x20]
0xe140d2: mov r8, qword ptr [rax + 0x20]
0xe140d6: vxorps xmm6, xmm2, xmmword ptr [rip + 0x4f61c72]
0xe140de: vmovss xmm0, dword ptr [r8 + 0x48]
0xe140e4: vucomiss xmm0, xmm6
0xe140e8: jp 0x140e140f0
0xe140ea: je 0x140e1420d
0xe140f0: mov rax, qword ptr [rdx + 0xa0]
0xe140f7: test rax, rax
0xe140fa: je 0x140e14103
0xe140fc: cmp qword ptr [rax + 8], 0
0xe14101: jne 0x140e1410e
0xe14103: vmovss dword ptr [r8 + 0x48], xmm6
0xe14109: call 0x140d438d0
0xe1410e: mov rax, qword ptr [r14 + 0x390]
0xe14115: mov rcx, qword ptr [rax + 0x18]
0xe14119: mov rdx, qword ptr [rcx]
0xe1411c: mov rax, qword ptr [rdx + 0xa0]
0xe14123: test rax, rax
0xe14126: je 0x140e1412f
0xe14128: cmp qword ptr [rax + 8], 0
0xe1412d: jne 0x140e14141
0xe1412f: mov rax, qword ptr [rdx + 0x20]
0xe14133: mov rdx, qword ptr [rax + 0x20]
0xe14137: vmovss dword ptr [rdx + 0x48], xmm6
0xe1413c: call 0x140d438d0
0xe14141: mov rax, qword ptr [r14 + 0x3a8]
0xe14148: mov rcx, qword ptr [rax + 0x18]
0xe1414c: mov rdx, qword ptr [rcx]
0xe1414f: mov rax, qword ptr [rdx + 0xa0]
0xe14156: test rax, rax
0xe14159: je 0x140e14162
0xe1415b: cmp qword ptr [rax + 8], 0
0xe14160: jne 0x140e14174
0xe14162: mov rax, qword ptr [rdx + 0x20]
0xe14166: mov rdx, qword ptr [rax + 0x20]
0xe1416a: vmovss dword ptr [rdx + 0x48], xmm6
0xe1416f: call 0x140d438d0
0xe14174: mov rax, qword ptr [r14 + 0x3b0]
0xe1417b: mov rcx, qword ptr [rax + 0x18]
0xe1417f: mov rdx, qword ptr [rcx]
0xe14182: mov rax, qword ptr [rdx + 0xa0]
0xe14189: test rax, rax
0xe1418c: je 0x140e14195
0xe1418e: cmp qword ptr [rax + 8], 0
0xe14193: jne 0x140e141a7
0xe14195: mov rax, qword ptr [rdx + 0x20]
0xe14199: mov rdx, qword ptr [rax + 0x20]
0xe1419d: vmovss dword ptr [rdx + 0x48], xmm6
0xe141a2: call 0x140d438d0
0xe141a7: mov rax, qword ptr [r14 + 0x3b8]
0xe141ae: mov rcx, qword ptr [rax + 0x18]
0xe141b2: mov rdx, qword ptr [rcx]
0xe141b5: mov rax, qword ptr [rdx + 0xa0]
0xe141bc: test rax, rax
0xe141bf: je 0x140e141c8
0xe141c1: cmp qword ptr [rax + 8], 0
0xe141c6: jne 0x140e141da
0xe141c8: mov rax, qword ptr [rdx + 0x20]
0xe141cc: mov rdx, qword ptr [rax + 0x20]
0xe141d0: vmovss dword ptr [rdx + 0x48], xmm6
0xe141d5: call 0x140d438d0
0xe141da: mov rax, qword ptr [r14 + 0x410]
0xe141e1: mov rcx, qword ptr [rax + 0x18]
0xe141e5: mov rdx, qword ptr [rcx]
0xe141e8: mov rax, qword ptr [rdx + 0xa0]
0xe141ef: test rax, rax
0xe141f2: je 0x140e141fb
0xe141f4: cmp qword ptr [rax + 8], 0
0xe141f9: jne 0x140e1420d
0xe141fb: mov rax, qword ptr [rdx + 0x20]
0xe141ff: mov rdx, qword ptr [rax + 0x20]
0xe14203: vmovss dword ptr [rdx + 0x48], xmm6
0xe14208: call 0x140d438d0
0xe1420d: mov byte ptr [rbp + 0x110], bl
0xe14213: vmovss xmm0, dword ptr [r14 + 0x4b0]
0xe1421c: vucomiss xmm0, xmm12
0xe14221: jp 0x140e14248
0xe14223: jne 0x140e14248
0xe14225: vmovss xmm0, dword ptr [r14 + 0x4b4]
0xe1422e: vucomiss xmm0, xmm7
0xe14232: jp 0x140e14248
0xe14234: jne 0x140e14248
0xe14236: vmovss xmm0, dword ptr [r14 + 0x4b8]
0xe1423f: vucomiss xmm0, xmm8
0xe14244: jp 0x140e14248
0xe14246: je 0x140e1426a
0xe14248: vunpcklps xmm0, xmm12, xmm7
0xe1424c: vmovsd qword ptr [rbp - 0x20], xmm0
0xe14251: vmovsd qword ptr [r14 + 0x4b0], xmm0
0xe1425a: vmovss dword ptr [r14 + 0x4b8], xmm8
0xe14263: mov byte ptr [rbp + 0x110], 1
0xe1426a: vucomiss xmm9, dword ptr [r14 + 0x554]
0xe14273: jp 0x140e14277
0xe14275: je 0x140e1427e
0xe14277: mov byte ptr [rbp + 0x110], 1
0xe1427e: cmp byte ptr [r14 + 0x562], bl
0xe14285: jne 0x140e14ae9
0xe1428b: mov rcx, qword ptr [r14 + 0x390]
0xe14292: lea rdx, [rbp - 0x60]
0xe14296: mov rcx, qword ptr [rcx + 0x18]
0xe1429a: call 0x1435b4b90
0xe1429f: vmovss xmm0, dword ptr [rbp - 0x60]
0xe142a4: vmulss xmm9, xmm0, dword ptr [rip + 0x4f5ec88]
0xe142ac: mov byte ptr [rbp + 0x118], bl
0xe142b2: xor r8d, r8d
0xe142b5: mov dword ptr [rbp - 0x3c], r8d
0xe142b9: mov dword ptr [rip + 0x5ebd168], r8d
0xe142c0: mov edx, 0xffffffff
0xe142c5: cmp byte ptr [rip + 0x5e98ded], bl
0xe142cb: je 0x140e14466
0xe142d1: lea rdx, [r14 + 0x258]
0xe142d8: call 0x140e08540
0xe142dd: mov rbx, qword ptr [r14 + 0x298]
0xe142e4: mov eax, dword ptr [r14 + 0x2a0]
0xe142eb: lea rdi, [rbx + rax*8]
0xe142ef: cmp rbx, rdi
0xe142f2: je 0x140e14319
0xe142f4: nop dword ptr [rax]
0xe142f8: nop dword ptr [rax + rax]
0xe14300: mov rax, qword ptr [rbx]
0xe14303: mov qword ptr [rbp - 0x60], rax
0xe14307: lea rdx, [rbp - 0x60]
0xe1430b: call 0x140e17df0
0xe14310: add rbx, 8
0xe14314: cmp rbx, rdi
0xe14317: jne 0x140e14300
0xe14319: mov eax, dword ptr [rip + 0x5ebd109]
0xe1431f: mov dword ptr [rbp - 0x3c], eax
0xe14322: lea rdx, [r14 + 0x248]
0xe14329: call 0x140e08540
0xe1432e: mov rbx, qword ptr [r14 + 0x288]
0xe14335: mov eax, dword ptr [r14 + 0x290]
0xe1433c: lea rdi, [rbx + rax*8]
0xe14340: cmp rbx, rdi
0xe14343: je 0x140e14369
0xe14345: nop word ptr [rax + rax]
0xe14350: mov rax, qword ptr [rbx]
0xe14353: mov qword ptr [rbp - 0x60], rax
0xe14357: lea rdx, [rbp - 0x60]
0xe1435b: call 0x140e17df0
0xe14360: add rbx, 8
0xe14364: cmp rbx, rdi
0xe14367: jne 0x140e14350
0xe14369: lea rcx, [r14 + 0x258]
0xe14370: call 0x1407ee2c0
0xe14375: xor r8d, r8d
0xe14378: mov dword ptr [r14 + 0x2a0], r8d
0xe1437f: mov eax, dword ptr [rip + 0x5e98e23]
0xe14385: mov dword ptr [rbp - 0x40], eax
0xe14388: mov dword ptr [rbp - 0x74], r8d
0xe1438c: mov edi, dword ptr [rip + 0x5ebd096]
0xe14392: mov dword ptr [rbp - 0x10], edi
0xe14395: test edi, edi
0xe14397: je 0x140e148e4
0xe1439d: mov ecx, edi
0xe1439f: cmp dword ptr [rip + 0x5e98e53], edi
0xe143a5: cmovb ecx, dword ptr [rip + 0x5e98e4c]
0xe143ac: mov dword ptr [rbp - 0xc], ecx
0xe143af: cmp dword ptr [r14 + 0x538], edi
0xe143b6: jb 0x140e143bf
0xe143b8: mov dword ptr [r14 + 0x538], r8d
0xe143bf: mov dword ptr [rbp - 0x38], r8d
0xe143c3: mov rcx, r8
0xe143c6: mov qword ptr [rbp - 0x60], rcx
0xe143ca: mov rbx, qword ptr [rbp - 0x30]
0xe143ce: nop 
0xe143d0: mov rax, qword ptr [rip + 0x5ebd049]
0xe143d7: mov rsi, qword ptr [rcx + rax]
0xe143db: vxorps xmm0, xmm0, xmm0
0xe143df: vmovups xmmword ptr [rbp - 0x58], xmm0
0xe143e4: xor r15b, r15b
0xe143e7: mov dword ptr [rbp - 0x48], 0
0xe143ee: mov word ptr [rbp - 0x44], 0
0xe143f4: mov byte ptr [rbp - 0x42], r15b
0xe143f8: movzx r13d, byte ptr [rsi + 0x270]
0xe14400: movzx r12d, word ptr [rsi + 0xde]
0xe14408: mov word ptr [rbp - 0x78], r12w
0xe1440d: vmovss xmm0, dword ptr [rsi + 0xe0]
0xe14415: vsubss xmm1, xmm0, dword ptr [rbp - 0x70]
0xe1441a: vmovss dword ptr [rbp - 0x30], xmm1
0xe1441f: vmovss xmm2, dword ptr [rsi + 0xe8]
0xe14427: vsubss xmm0, xmm2, dword ptr [rbp - 0x68]
0xe1442c: vmovss dword ptr [rbp - 0x2c], xmm0
0xe14431: mov rax, qword ptr [rbp - 0x30]
0xe14435: mov qword ptr [rbp - 0x58], rax
0xe14439: vmovss xmm0, dword ptr [rbp - 0x54]
0xe1443e: vmulss xmm3, xmm0, xmm0
0xe14442: vmovss xmm1, dword ptr [rbp - 0x58]
0xe14447: vmulss xmm2, xmm1, xmm1
0xe1444b: vaddss xmm4, xmm3, xmm2
0xe1444f: vxorps xmm0, xmm0, xmm0
0xe14453: vucomiss xmm0, xmm4
0xe14457: ja 0x140e1453b
0xe1445d: vsqrtss xmm0, xmm4, xmm4
0xe14461: jmp 0x140e14547
0xe14466: lea r12, [r14 + 0x158]
0xe1446d: mov ecx, dword ptr [r12 + 4]
0xe14472: mov dword ptr [rbp - 0x74], ecx
0xe14475: test ecx, ecx
0xe14477: jne 0x140e1448c
0xe14479: mov r12, r8
0xe1447c: mov rdi, r8
0xe1447f: mov r13d, edx
0xe14482: mov ecx, edx
0xe14484: mov dword ptr [rbp - 0x78], edx
0xe14487: mov dword ptr [rbp - 0x74], edx
0xe1448a: jmp 0x140e144a0
0xe1448c: mov rax, qword ptr [r12 + 0x18]
0xe14491: mov rdi, qword ptr [rax]
0xe14494: mov r13d, r8d
0xe14497: mov ecx, dword ptr [r12 + 0xc]
0xe1449c: mov dword ptr [rbp - 0x78], ecx
0xe1449f: nop 
0xe144a0: test rdi, rdi
0xe144a3: je 0x140e1437f
0xe144a9: cmp dword ptr [r12 + 0xc], ecx
0xe144ae: jne 0x140e1437f
0xe144b4: add rdi, 8
0xe144b8: mov esi, dword ptr [rdi + 4]
0xe144bb: test esi, esi
0xe144bd: jne 0x140e144ce
0xe144bf: mov rdi, r8
0xe144c2: mov rax, r8
0xe144c5: mov ebx, edx
0xe144c7: mov r15d, edx
0xe144ca: mov esi, edx
0xe144cc: jmp 0x140e144e0
0xe144ce: mov rax, qword ptr [rdi + 0x18]
0xe144d2: mov rax, qword ptr [rax]
0xe144d5: mov ebx, r8d
0xe144d8: mov r15d, dword ptr [rdi + 0xc]
0xe144dc: nop dword ptr [rax]
0xe144e0: test rax, rax
0xe144e3: je 0x140e14514
0xe144e5: cmp dword ptr [rdi + 0xc], r15d
0xe144e9: jne 0x140e14514
0xe144eb: mov rax, qword ptr [rax + 0x18]
0xe144ef: mov qword ptr [rbp - 0x60], rax
0xe144f3: lea rdx, [rbp - 0x60]
0xe144f7: call 0x140e17df0
0xe144fc: inc ebx
0xe144fe: xor r8d, r8d
0xe14501: cmp ebx, esi
0xe14503: jae 0x140e1450f
0xe14505: mov rax, qword ptr [rdi + 0x18]
0xe14509: mov rax, qword ptr [rax + rbx*8]
0xe1450d: jmp 0x140e144e0
0xe1450f: mov rax, r8
0xe14512: jmp 0x140e144e0
0xe14514: inc r13d
0xe14517: mov ecx, dword ptr [rbp - 0x78]
0xe1451a: mov edx, 0xffffffff
0xe1451f: cmp r13d, dword ptr [rbp - 0x74]
0xe14523: jae 0x140e14533
0xe14525: mov rax, qword ptr [r12 + 0x18]
0xe1452a: mov rdi, qword ptr [rax + r13*8]
0xe1452e: jmp 0x140e144a0
0xe14533: mov rdi, r8
0xe14536: jmp 0x140e144a0
0xe1453b: vmovaps xmm0, xmm4
0xe1453f: call 0x144898f6e
0xe14544: xor r8d, r8d
0xe14547: vmovss dword ptr [rbp - 0x50], xmm0
0xe1454c: vmovd xmm2, r8d
0xe14551: movzx eax, byte ptr [rsi + 0x260]
0xe14558: vmovd xmm1, eax
0xe1455c: vpcmpeqd xmm3, xmm1, xmm2
0xe14560: vblendvps xmm1, xmm9, xmm10, xmm3
0xe14566: vmovss dword ptr [rbp - 0x4c], xmm1
0xe1456b: mov edi, r12d
0xe1456e: cmp r12w, word ptr [rip + 0x5c507c2]
0xe14576: sete byte ptr [rbp - 0x42]
0xe1457a: mov r12d, dword ptr [rbp - 0x38]
0xe1457e: cmp r12d, dword ptr [rbp - 0x3c]
0xe14582: jb 0x140e145b3
0xe14584: vsubss xmm0, xmm0, dword ptr [rsi + 0x100]
0xe1458c: vmulss xmm3, xmm0, dword ptr [r14 + 0x554]
0xe14595: vaddss xmm1, xmm1, xmm9
0xe1459a: vaddss xmm2, xmm1, dword ptr [rsi + 0x258]
0xe145a2: vdivss xmm0, xmm2, xmm12
0xe145a7: vcomiss xmm0, xmm3
0xe145ab: seta r15b
0xe145af: mov byte ptr [rbp - 0x48], r15b
0xe145b3: vmovss xmm0, dword ptr [rsi + 0xe4]
0xe145bb: vcomiss xmm0, dword ptr [rip + 0x5ec9a85]
0xe145c3: seta al
0xe145c6: mov byte ptr [rbp - 0x47], al
0xe145c9: cmp al, byte ptr [r14 + 0x569]
0xe145d0: sete byte ptr [rbp - 0x46]
0xe145d4: cmp qword ptr [rsi + 0x1f8], 0
0xe145dc: je 0x140e145fd
0xe145de: test r15b, r15b
0xe145e1: jne 0x140e145fd
0xe145e3: movzx eax, word ptr [rip + 0x5c5075a]
0xe145ea: cmp edi, eax
0xe145ec: je 0x140e145f9
0xe145ee: movzx eax, word ptr [rip + 0x5c50763]
0xe145f5: cmp edi, eax
0xe145f7: jne 0x140e145fd
0xe145f9: mov byte ptr [rbp - 0x44], 1
0xe145fd: lea rcx, [rbp - 0x78]
0xe14601: call 0x140537250
0xe14606: cmp byte ptr [rax + 0xab], 0
0xe1460d: je 0x140e1472a
0xe14613: movzx eax, word ptr [rip + 0x5c5070e]
0xe1461a: cmp edi, eax
0xe1461c: je 0x140e1462d
0xe1461e: movzx eax, word ptr [rip + 0x5c50707]
0xe14625: cmp edi, eax
0xe14627: mov byte ptr [rbp - 0x45], 1
0xe1462b: jne 0x140e14631
0xe1462d: mov byte ptr [rbp - 0x45], 0
0xe14631: cmp qword ptr [rsi + 0x1f8], 0
0xe14639: je 0x140e14721
0xe1463f: cmp byte ptr [rbp - 0x48], 0
0xe14643: jne 0x140e14721
0xe14649: movzx eax, word ptr [rip + 0x5c506f4]
0xe14650: cmp edi, eax
0xe14652: je 0x140e14663
0xe14654: movzx eax, word ptr [rip + 0x5c506fd]
0xe1465b: cmp edi, eax
0xe1465d: jne 0x140e14721
0xe14663: mov byte ptr [rbp - 0x44], 1
0xe14667: cmp byte ptr [rbp - 0x45], 0
0xe1466b: je 0x140e146ae
0xe1466d: cmp byte ptr [rbp - 0x80], 0
0xe14671: je 0x140e146ae
0xe14673: movzx eax, word ptr [rip + 0x5c506ca]
0xe1467a: cmp edi, eax
0xe1467c: je 0x140e146aa
0xe1467e: movzx eax, word ptr [rip + 0x5c506c3]
0xe14685: cmp edi, eax
0xe14687: je 0x140e146aa
0xe14689: movzx eax, word ptr [rip + 0x5c506bc]
0xe14690: cmp edi, eax
0xe14692: je 0x140e146aa
0xe14694: movzx eax, word ptr [rip + 0x5c506b5]
0xe1469b: cmp edi, eax
0xe1469d: je 0x140e146aa
0xe1469f: movzx eax, word ptr [rip + 0x5c506ae]
0xe146a6: cmp edi, eax
0xe146a8: jne 0x140e146ae
0xe146aa: mov byte ptr [rbp - 0x43], 1
0xe146ae: mov eax, r12d
0xe146b1: sub eax, dword ptr [r14 + 0x538]
0xe146b8: mov edi, dword ptr [rbp - 0x10]
0xe146bb: add eax, edi
0xe146bd: xor edx, edx
0xe146bf: div edi
0xe146c1: mov r15d, dword ptr [rbp - 0xc]
0xe146c5: cmp edx, r15d
0xe146c8: jae 0x140e146e6
0xe146ca: lea rax, [rbp - 0x70]
0xe146ce: mov qword ptr [rsp + 0x20], rax
0xe146d3: mov r9, qword ptr [rbp]
0xe146d7: lea r8, [rbp - 0x58]
0xe146db: mov rdx, rsi
0xe146de: mov rcx, r14
0xe146e1: call 0x140e0ffc0
0xe146e6: test r13b, r13b
0xe146e9: jne 0x140e14796
0xe146ef: cmp byte ptr [rbp - 0x48], r13b
0xe146f3: jne 0x140e14796
0xe146f9: lea rcx, [rbp - 0x78]
0xe146fd: call 0x140537250
0xe14702: cmp byte ptr [rax + 0xb2], r13b
0xe14709: jne 0x140e14796
0xe1470f: mov r8b, 1
0xe14712: mov dl, 0x11
0xe14714: mov rcx, rsi
0xe14717: call 0x140deca40
0xe1471c: jmp 0x140e148aa
0xe14721: mov byte ptr [rbp - 0x44], 0
0xe14725: jmp 0x140e14667
0xe1472a: lea rcx, [rbp - 0x78]
0xe1472e: call 0x140537250
0xe14733: cmp byte ptr [rax + 0xaf], 0
0xe1473a: je 0x140e14667
0xe14740: movzx eax, word ptr [rip + 0x5c50601]
0xe14747: cmp edi, eax
0xe14749: je 0x140e14770
0xe1474b: movzx eax, word ptr [rip + 0x5c505fa]
0xe14752: cmp edi, eax
0xe14754: je 0x140e14770
0xe14756: movzx eax, word ptr [rip + 0x5c505f3]
0xe1475d: cmp edi, eax
0xe1475f: je 0x140e14770
0xe14761: movzx eax, word ptr [rip + 0x5c505ec]
0xe14768: cmp edi, eax
0xe1476a: jne 0x140e14667
0xe14770: mov byte ptr [rbp - 0x45], 1
0xe14774: cmp qword ptr [rsi + 0x1f8], 0
0xe1477c: je 0x140e1478d
0xe1477e: cmp byte ptr [rbp - 0x48], 0
0xe14782: jne 0x140e1478d
0xe14784: mov byte ptr [rbp - 0x44], 1
0xe14788: jmp 0x140e1466d
0xe1478d: mov byte ptr [rbp - 0x44], 0
0xe14791: jmp 0x140e1466d
0xe14796: xor r13d, r13d
0xe14799: mov ecx, r13d
0xe1479c: lea rdx, [rsi + 0x1e8]
0xe147a3: mov rax, rdx
0xe147a6: cmp byte ptr [rax], r13b
0xe147a9: jne 0x140e147b9
0xe147ab: inc ecx
0xe147ad: inc rax
0xe147b0: cmp ecx, 3
0xe147b3: jb 0x140e147a6
0xe147b5: xor cl, cl
0xe147b7: jmp 0x140e147bb
0xe147b9: mov cl, 1
0xe147bb: movzx eax, byte ptr [rsi + 0x1ea]
0xe147c2: btr eax, 1
0xe147c6: mov byte ptr [rsi + 0x1ea], al
0xe147cc: mov eax, r13d
0xe147cf: nop 
0xe147d0: cmp byte ptr [rdx], r13b
0xe147d3: jne 0x140e147e3
0xe147d5: inc eax
0xe147d7: inc rdx
0xe147da: cmp eax, 3
0xe147dd: jb 0x140e147d0
0xe147df: xor al, al
0xe147e1: jmp 0x140e147e5
0xe147e3: mov al, 1
0xe147e5: cmp cl, al
0xe147e7: je 0x140e147fb
0xe147e9: mov rdx, qword ptr [rsi]
0xe147ec: mov rcx, rsi
0xe147ef: test al, al
0xe147f1: je 0x140e147f8
0xe147f3: call qword ptr [rdx + 0x28]
0xe147f6: jmp 0x140e147fb
0xe147f8: call qword ptr [rdx + 0x20]
0xe147fb: cmp byte ptr [rbp - 0x7e], r13b
0xe147ff: jne 0x140e14817
0xe14801: cmp byte ptr [rsi + 0x1ef], r13b
0xe14808: jne 0x140e14817
0xe1480a: cmp byte ptr [rsi + 0x1f0], r13b
0xe14811: je 0x140e148aa
0xe14817: mov byte ptr [rsi + 0x1ef], r13b
0xe1481e: movzx eax, byte ptr [rsi + 0x1f0]
0xe14825: mov byte ptr [rsi + 0x1f0], r13b
0xe1482c: mov byte ptr [rsp + 0x70], al
0xe14830: movzx eax, byte ptr [rbp - 0x7f]
0xe14834: mov byte ptr [rsp + 0x68], al
0xe14838: mov rax, qword ptr [rbp - 0x20]
0xe1483c: mov qword ptr [rsp + 0x60], rax
0xe14841: mov qword ptr [rsp + 0x58], rbx
0xe14846: movzx eax, byte ptr [rbp + 0x110]
0xe1484d: mov byte ptr [rsp + 0x50], al
0xe14851: vmovss dword ptr [rsp + 0x48], xmm13
0xe14857: vmovss dword ptr [rsp + 0x40], xmm11
0xe1485d: lea rax, [rbp + 0x118]
0xe14864: mov qword ptr [rsp + 0x38], rax
0xe14869: vmovss dword ptr [rsp + 0x30], xmm9
0xe1486f: lea rax, [rbp - 0x70]
0xe14873: mov qword ptr [rsp + 0x28], rax
0xe14878: mov rax, qword ptr [rbp]
0xe1487c: mov qword ptr [rsp + 0x20], rax
0xe14881: lea r9, [rbp - 0x58]
0xe14885: vmovaps xmm2, xmm14
0xe1488a: mov rdx, rsi
0xe1488d: mov rcx, r14
0xe14890: call 0x140e0f260
0xe14895: test al, al
0xe14897: je 0x140e148aa
0xe14899: mov byte ptr [rbp - 0x7c], 1
0xe1489d: mov ecx, dword ptr [rbp - 0x74]
0xe148a0: inc ecx
0xe148a2: mov dword ptr [rbp - 0x74], ecx
0xe148a5: cmp ecx, dword ptr [rbp - 0x40]
0xe148a8: jae 0x140e148cc
0xe148aa: inc r12d
0xe148ad: mov dword ptr [rbp - 0x38], r12d
0xe148b1: mov rcx, qword ptr [rbp - 0x60]
0xe148b5: add rcx, 8
0xe148b9: mov qword ptr [rbp - 0x60], rcx
0xe148bd: cmp r12d, edi
0xe148c0: mov r8d, 0
0xe148c6: jb 0x140e143d0
0xe148cc: mov eax, dword ptr [r14 + 0x538]
0xe148d3: add eax, r15d
0xe148d6: xor edx, edx
0xe148d8: div edi
0xe148da: mov dword ptr [r14 + 0x538], edx
0xe148e1: xor r8d, r8d
0xe148e4: cmp byte ptr [rip + 0x5e986dd], 0
0xe148eb: je 0x140e14a1b
0xe148f1: mov rax, qword ptr [rbp - 0x20]
0xe148f5: mov qword ptr [rbp + 0x110], rax
0xe148fc: lea r15, [r14 + 0x1d8]
0xe14903: mov ecx, dword ptr [r15 + 4]
0xe14907: test ecx, ecx
0xe14909: jne 0x140e1491f
0xe1490b: mov r15, r8
0xe1490e: mov rdi, r8
0xe14911: mov r13d, 0xffffffff
0xe14917: mov esi, r13d
0xe1491a: mov r12d, r13d
0xe1491d: jmp 0x140e14930
0xe1491f: mov rax, qword ptr [r15 + 0x18]
0xe14923: mov rdi, qword ptr [rax]
0xe14926: mov esi, r8d
0xe14929: mov r12d, dword ptr [r15 + 0xc]
0xe1492d: mov r13d, ecx
0xe14930: vmovss xmm8, dword ptr [rbp + 0x110]
0xe14938: vmovdqu xmm7, xmmword ptr [rip + 0x4f613c0]
0xe14940: test rdi, rdi
0xe14943: je 0x140e14a1b
0xe14949: cmp dword ptr [r15 + 0xc], r12d
0xe1494d: jne 0x140e14a1b
0xe14953: mov rbx, qword ptr [rdi + 8]
0xe14957: vmovss xmm0, dword ptr [rbx + 0xc]
0xe1495c: vsubss xmm6, xmm0, dword ptr [rbp - 0x6c]
0xe14961: vandps xmm6, xmm6, xmm7
0xe14965: cmp dword ptr [rbx], 0x37
0xe14968: jne 0x140e149ce
0xe1496a: vmovss xmm0, dword ptr [rbx + 8]
0xe1496f: vsubss xmm4, xmm0, dword ptr [rbp - 0x70]
0xe14974: vmovss xmm1, dword ptr [rbx + 0x10]
0xe14979: vsubss xmm2, xmm1, dword ptr [rbp - 0x68]
0xe1497e: vmulss xmm3, xmm2, xmm2
0xe14982: vmulss xmm0, xmm4, xmm4
0xe14986: vaddss xmm0, xmm3, xmm0
0xe1498a: vxorps xmm1, xmm1, xmm1
0xe1498e: vucomiss xmm1, xmm0
0xe14992: ja 0x140e1499a
0xe14994: vsqrtss xmm0, xmm0, xmm0
0xe14998: jmp 0x140e149a2
0xe1499a: call 0x144898f6e
0xe1499f: xor r8d, r8d
0xe149a2: vsubss xmm0, xmm0, dword ptr [rip + 0x5f6d7d6]
0xe149aa: vmulss xmm3, xmm0, dword ptr [r14 + 0x554]
0xe149b3: vaddss xmm1, xmm9, xmm10
0xe149b8: vaddss xmm0, xmm1, dword ptr [rip + 0x5f6d7bc]
0xe149c0: vdivss xmm2, xmm0, xmm8
0xe149c5: vcomiss xmm2, xmm3
0xe149c9: setbe al
0xe149cc: jmp 0x140e149d0
0xe149ce: xor al, al
0xe149d0: mov ecx, 0x2d
0xe149d5: mov byte ptr [rcx + rbx], al
0xe149d8: mov rax, qword ptr [rdi + 8]
0xe149dc: cmp dword ptr [rax], 0x37
0xe149df: je 0x140e149fb
0xe149e1: vmovss xmm0, dword ptr [rip + 0x5e95cbf]
0xe149e9: vcomiss xmm0, xmm6
0xe149ed: ja 0x140e149fb
0xe149ef: vcomiss xmm6, xmm0
0xe149f3: jbe 0x140e149ff
0xe149f5: mov byte ptr [rax + 0x20], 0
0xe149f9: jmp 0x140e149ff
0xe149fb: mov byte ptr [rax + 0x20], 1
0xe149ff: inc esi
0xe14a01: cmp esi, r13d
0xe14a04: jae 0x140e14a13
0xe14a06: mov rax, qword ptr [r15 + 0x18]
0xe14a0a: mov rdi, qword ptr [rax + rsi*8]
0xe14a0e: jmp 0x140e14940
0xe14a13: mov rdi, r8
0xe14a16: jmp 0x140e14940
0xe14a1b: mov rcx, qword ptr [r14 + 0x3e8]
0xe14a22: test rcx, rcx
0xe14a25: je 0x140e14a8c
0xe14a27: movzx eax, byte ptr [rbp + 0x118]
0xe14a2e: cmp al, byte ptr [r14 + 0x56a]
0xe14a35: je 0x140e14a8c
0xe14a37: vmovd xmm1, r8d
0xe14a3c: vmovd xmm0, eax
0xe14a40: vpcmpeqd xmm2, xmm0, xmm1
0xe14a44: vmovss xmm1, dword ptr [rip + 0x5e98a2c]
0xe14a4c: vblendvps xmm0, xmm1, xmm15, xmm2
0xe14a52: vmovss dword ptr [rbp - 0x40], xmm0
0xe14a57: mov rax, qword ptr [rcx + 8]
0xe14a5b: mov rcx, qword ptr [rax + 0x20]
0xe14a5f: mov byte ptr [rbp + 0x110], 0
0xe14a66: mov byte ptr [rbp - 0x80], 0x52
0xe14a6a: lea r9, [rbp + 0x110]
0xe14a71: lea r8, [rbp - 0x40]
0xe14a75: lea rdx, [rbp - 0x80]
0xe14a79: call 0x14064b570
0xe14a7e: movzx eax, byte ptr [rbp + 0x118]
0xe14a85: mov byte ptr [r14 + 0x56a], al
0xe14a8c: vmovss xmm0, dword ptr [rip + 0x5e982b4]
0xe14a94: vmovss dword ptr [r14 + 0x534], xmm0
0xe14a9d: lea rdx, [rbp - 0x70]
0xe14aa1: mov rcx, r14
0xe14aa4: call 0x140e115b0
0xe14aa9: vmovsd xmm0, qword ptr [rbp - 0x70]
0xe14aae: vmovsd qword ptr [rbp - 0x20], xmm0
0xe14ab3: mov eax, dword ptr [rbp - 0x68]
0xe14ab6: mov dword ptr [rbp - 0x18], eax
0xe14ab9: movzx r9d, byte ptr [rbp - 0x7d]
0xe14abe: movzx r8d, byte ptr [rbp - 0x7f]
0xe14ac3: lea rdx, [rbp - 0x20]
0xe14ac7: mov rcx, r14
0xe14aca: call 0x140e0ce20
0xe14acf: movzx r9d, byte ptr [rbp - 0x7d]
0xe14ad4: movzx r8d, byte ptr [rbp - 0x7f]
0xe14ad9: lea rdx, [rbp - 0x70]
0xe14add: mov rcx, r14
0xe14ae0: call 0x140e0eb10
0xe14ae5: movzx ebx, byte ptr [rbp - 0x7c]
0xe14ae9: mov rcx, r14
0xe14aec: call 0x140e113e0
0xe14af1: cmp byte ptr [r14 + 0x56c], 0
0xe14af9: jne 0x140e14b05
0xe14afb: cmp byte ptr [r14 + 0x56d], 0
0xe14b03: je 0x140e14b1a
0xe14b05: vmovaps xmm2, xmm14
0xe14b0a: movzx edx, byte ptr [r14 + 0x56e]
0xe14b12: mov rcx, r14
0xe14b15: call 0x140e12410
0xe14b1a: cmp byte ptr [rbp - 0x7e], 0
0xe14b1e: jne 0x140e14b24
0xe14b20: test bl, bl
0xe14b22: je 0x140e14b32
0xe14b24: mov rcx, qword ptr [r14 + 8]
0xe14b28: mov rcx, qword ptr [rcx + 0x18]
0xe14b2c: call 0x140e035c0
0xe14b31: nop 
0xe14b32: lea rax, [rip + 0x491130f]
0xe14b39: mov qword ptr [rbp - 8], rax
0xe14b3d: lea rcx, [rbp - 8]
0xe14b41: call 0x141434880
0xe14b46: lea r11, [rsp + 0x1c0]
0xe14b4e: mov rbx, qword ptr [r11 + 0x40]
0xe14b52: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xe14b58: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xe14b5e: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xe14b64: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xe14b6a: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xe14b70: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xe14b76: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xe14b7c: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xe14b82: vmovaps xmm14, xmmword ptr [r11 - 0x90]
0xe14b8b: vmovaps xmm15, xmmword ptr [r11 - 0xa0]
0xe14b94: mov rsp, r11
0xe14b97: pop r15
0xe14b99: pop r14
0xe14b9b: pop r13
0xe14b9d: pop r12
0xe14b9f: pop rdi
0xe14ba0: pop rsi
0xe14ba1: pop rbp
0xe14ba2: ret 