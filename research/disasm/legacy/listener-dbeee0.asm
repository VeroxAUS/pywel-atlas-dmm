0xdbeee0: mov rax, rsp
0xdbeee3: mov qword ptr [rax + 8], rcx
0xdbeee7: push rbx
0xdbeee8: push rsi
0xdbeee9: push rdi
0xdbeeea: push r12
0xdbeeec: push r13
0xdbeeee: push r14
0xdbeef0: push r15
0xdbeef2: sub rsp, 0x310
0xdbeef9: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdbeefe: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdbef03: vmovaps xmmword ptr [rax - 0x68], xmm8
0xdbef08: vmovaps xmmword ptr [rax - 0x78], xmm9
0xdbef0d: vmovaps xmmword ptr [rax - 0x88], xmm10
0xdbef15: vmovaps xmmword ptr [rax - 0x98], xmm11
0xdbef1d: vmovaps xmmword ptr [rax - 0xa8], xmm12
0xdbef25: vmovaps xmmword ptr [rax - 0xb8], xmm13
0xdbef2d: vmovaps xmmword ptr [rax - 0xc8], xmm14
0xdbef35: vmovaps xmmword ptr [rax - 0xd8], xmm15
0xdbef3d: mov r13, rcx
0xdbef40: xor r14d, r14d
0xdbef43: mov eax, r14d
0xdbef46: mov dword ptr [rsp + 0x68], eax
0xdbef4a: mov dword ptr [rsp + 0x70], eax
0xdbef4e: cmp qword ptr [rcx + 0x820], rax
0xdbef55: je 0x140dc175f
0xdbef5b: lea rdx, [rsp + 0x1d8]
0xdbef63: call 0x14064f4f0
0xdbef68: nop 
0xdbef69: cmp byte ptr [rsp + 0x1e8], r14b
0xdbef71: je 0x140dc1743
0xdbef77: mov rax, qword ptr [rsp + 0x1e0]
0xdbef7f: mov rcx, qword ptr [rax + 0x68]
0xdbef83: mov rax, qword ptr [rcx + 0x188]
0xdbef8a: mov r15, qword ptr [rax + 0x18]
0xdbef8e: mov qword ptr [rsp + 0x208], r15
0xdbef96: vmovss xmm0, dword ptr [r13 + 0xaa0]
0xdbef9f: vsubss xmm2, xmm0, dword ptr [rip + 0x5eeca41]
0xdbefa7: vmovss xmm0, dword ptr [rip + 0x5eecad9]
0xdbefaf: vsubss xmm1, xmm0, dword ptr [rip + 0x5eeca31]
0xdbefb7: vdivss xmm3, xmm2, xmm1
0xdbefbb: vmovss xmm14, dword ptr [rip + 0x4fb40f1]
0xdbefc3: vsubss xmm1, xmm14, xmm3
0xdbefc7: vmovups xmm0, xmmword ptr [r13 + 0x96c]
0xdbefd0: vxorps xmm10, xmm10, xmm10
0xdbefd5: cmp byte ptr [r13 + 0x97c], r14b
0xdbefdc: je 0x140dbf077
0xdbefe2: vmovss xmm5, dword ptr [r13 + 0xac0]
0xdbefeb: mov dword ptr [r13 + 0xac0], r14d
0xdbeff2: vshufps xmm4, xmm0, xmm0, 0x55
0xdbeff7: vcomiss xmm1, xmm0
0xdbeffb: jbe 0x140dbf01a
0xdbeffd: vcomiss xmm4, xmm1
0xdbf001: jbe 0x140dbf01a
0xdbf003: vsubss xmm1, xmm1, xmm0
0xdbf007: vsubss xmm0, xmm4, xmm0
0xdbf00b: vdivss xmm2, xmm1, xmm0
0xdbf00f: vmovss dword ptr [r13 + 0xac0], xmm2
0xdbf018: jmp 0x140dbf06b
0xdbf01a: vshufps xmm3, xmm0, xmm0, 0xaa
0xdbf01f: vcomiss xmm1, xmm3
0xdbf023: jbe 0x140dbf04b
0xdbf025: vshufps xmm0, xmm0, xmm0, 0xff
0xdbf02a: vcomiss xmm0, xmm1
0xdbf02e: jbe 0x140dbf04b
0xdbf030: vsubss xmm1, xmm1, xmm3
0xdbf034: vsubss xmm0, xmm0, xmm3
0xdbf038: vdivss xmm2, xmm1, xmm0
0xdbf03c: vsubss xmm2, xmm14, xmm2
0xdbf040: vmovss dword ptr [r13 + 0xac0], xmm2
0xdbf049: jmp 0x140dbf06b
0xdbf04b: vxorps xmm2, xmm2, xmm2
0xdbf04f: vcomiss xmm1, xmm4
0xdbf053: jb 0x140dbf06b
0xdbf055: vcomiss xmm3, xmm1
0xdbf059: jb 0x140dbf06b
0xdbf05b: mov dword ptr [r13 + 0xac0], 0x3f800000
0xdbf066: vmovaps xmm2, xmm14
0xdbf06b: vucomiss xmm5, xmm2
0xdbf06f: jp 0x140dbf077
0xdbf071: jne 0x140dbf077
0xdbf073: xor al, al
0xdbf075: jmp 0x140dbf079
0xdbf077: mov al, 1
0xdbf079: or byte ptr [r13 + 0xad7], al
0xdbf080: vmovss xmm9, dword ptr [rip + 0x4fb3eac]
0xdbf088: cmp dword ptr [r13 + 0x480], 0
0xdbf090: jne 0x140dbf0a0
0xdbf092: cmp dword ptr [r13 + 0x490], 0
0xdbf09a: je 0x140dbf706
0xdbf0a0: mov rbx, qword ptr [r13 + 8]
0xdbf0a4: lea rdx, [rsp + 0x358]
0xdbf0ac: mov rcx, qword ptr [rbx + 0x18]
0xdbf0b0: call 0x1435b4b90
0xdbf0b5: vmovss xmm6, dword ptr [r13 + 0xa98]
0xdbf0be: vmulss xmm1, xmm9, dword ptr [rax + 4]
0xdbf0c3: vmulss xmm2, xmm1, xmm6
0xdbf0c7: vaddss xmm7, xmm2, dword ptr [r13 + 0xa5c]
0xdbf0d0: vmulss xmm1, xmm9, dword ptr [rax]
0xdbf0d4: vmulss xmm2, xmm1, xmm6
0xdbf0d8: vsubss xmm8, xmm2, dword ptr [r13 + 0xa58]
0xdbf0e1: mov rax, qword ptr [rbx + 0xa0]
0xdbf0e8: test rax, rax
0xdbf0eb: je 0x140dbf102
0xdbf0ed: cmp qword ptr [rax + 8], 0
0xdbf0f2: je 0x140dbf102
0xdbf0f4: mov rcx, qword ptr [rbx + 0x38]
0xdbf0f8: call 0x143ed8480
0xdbf0fd: mov rcx, rax
0xdbf100: jmp 0x140dbf137
0xdbf102: movzx edx, byte ptr [rbx + 0x94]
0xdbf109: cmp dl, 0xff
0xdbf10c: jne 0x140dbf113
0xdbf10e: mov rcx, r14
0xdbf111: jmp 0x140dbf137
0xdbf113: mov rax, qword ptr [rbx + 0x58]
0xdbf117: mov rcx, qword ptr [rax + 0xb0]
0xdbf11e: mov r8, qword ptr [rcx + 0xb0]
0xdbf125: cmp edx, dword ptr [r8 + 8]
0xdbf129: jb 0x140dbf130
0xdbf12b: mov rcx, r14
0xdbf12e: jmp 0x140dbf137
0xdbf130: mov rax, qword ptr [r8]
0xdbf133: mov rcx, qword ptr [rax + rdx*8]
0xdbf137: cmp byte ptr [rcx + 0x13b], 0
0xdbf13e: jne 0x140dbf14a
0xdbf140: vmovss xmm0, dword ptr [rcx + 0xd8]
0xdbf148: jmp 0x140dbf163
0xdbf14a: mov eax, 0xe0
0xdbf14f: mov edx, 0xdc
0xdbf154: cmp byte ptr [rcx + 0x13c], 0
0xdbf15b: cmove eax, edx
0xdbf15e: vmovss xmm0, dword ptr [rax + rcx]
0xdbf163: vmulss xmm1, xmm0, dword ptr [rcx + 0xd4]
0xdbf16b: vdivss xmm0, xmm14, xmm6
0xdbf16f: vmulss xmm1, xmm0, xmm1
0xdbf173: mov rax, qword ptr [r13 + 0x820]
0xdbf17a: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf182: mov qword ptr [rax + 0x40], r14
0xdbf186: mov dword ptr [rax + 0x48], r14d
0xdbf18a: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf192: mov qword ptr [rax + 0x54], r14
0xdbf196: mov dword ptr [rax + 0x5c], r14d
0xdbf19a: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf1a2: vmovss dword ptr [rax + 0x68], xmm8
0xdbf1a7: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf1ac: mov dword ptr [rax + 0x70], r14d
0xdbf1b0: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf1b7: mov rax, qword ptr [r13 + 0x870]
0xdbf1be: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf1c6: mov qword ptr [rax + 0x40], r14
0xdbf1ca: mov dword ptr [rax + 0x48], r14d
0xdbf1ce: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf1d6: mov qword ptr [rax + 0x54], r14
0xdbf1da: mov dword ptr [rax + 0x5c], r14d
0xdbf1de: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf1e6: vmovss dword ptr [rax + 0x68], xmm8
0xdbf1eb: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf1f0: mov dword ptr [rax + 0x70], r14d
0xdbf1f4: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf1fb: mov rax, qword ptr [r13 + 0x8c0]
0xdbf202: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf20a: mov qword ptr [rax + 0x40], r14
0xdbf20e: mov dword ptr [rax + 0x48], r14d
0xdbf212: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf21a: mov qword ptr [rax + 0x54], r14
0xdbf21e: mov dword ptr [rax + 0x5c], r14d
0xdbf222: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf22a: vmovss dword ptr [rax + 0x68], xmm8
0xdbf22f: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf234: mov dword ptr [rax + 0x70], r14d
0xdbf238: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf23f: mov rax, qword ptr [r13 + 0x910]
0xdbf246: mov qword ptr [rax + 0x38], 0x3f800000
0xdbf24e: mov qword ptr [rax + 0x40], r14
0xdbf252: mov dword ptr [rax + 0x48], r14d
0xdbf256: mov qword ptr [rax + 0x4c], 0x3f800000
0xdbf25e: mov qword ptr [rax + 0x54], r14
0xdbf262: mov dword ptr [rax + 0x5c], r14d
0xdbf266: mov qword ptr [rax + 0x60], 0x3f800000
0xdbf26e: vmovss dword ptr [rax + 0x68], xmm8
0xdbf273: vmovss dword ptr [rax + 0x6c], xmm7
0xdbf278: mov dword ptr [rax + 0x70], r14d
0xdbf27c: mov dword ptr [rax + 0x74], 0x3f800000
0xdbf283: vmovss dword ptr [rsp + 0x110], xmm1
0xdbf28c: vmovups xmmword ptr [rsp + 0x114], xmm10
0xdbf295: vmovss dword ptr [rsp + 0x124], xmm1
0xdbf29e: vmovss dword ptr [rsp + 0x128], xmm10
0xdbf2a7: vmovss dword ptr [rsp + 0x12c], xmm10
0xdbf2b0: vmovaps ymm0, ymmword ptr [rip + 0x4fb7688]
0xdbf2b8: vmovups ymmword ptr [rsp + 0x130], ymm0
0xdbf2c1: mov rax, qword ptr [r13 + 0x820]
0xdbf2c8: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf2cd: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf2d2: vmovups ymm0, ymmword ptr [rsp + 0x110]
0xdbf2db: vperm2f128 ymm5, ymm0, ymm0, 0
0xdbf2e1: vperm2f128 ymm6, ymm0, ymm0, 0x11
0xdbf2e7: vmovups ymm1, ymmword ptr [rsp + 0x130]
0xdbf2f0: vperm2f128 ymm7, ymm1, ymm1, 0
0xdbf2f6: vperm2f128 ymm8, ymm1, ymm1, 0x11
0xdbf2fc: vshufps ymm0, ymm3, ymm3, 0
0xdbf301: vmulps ymm2, ymm0, ymm5
0xdbf305: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf30a: vfmadd231ps ymm2, ymm1, ymm6
0xdbf30f: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf314: vfmadd231ps ymm2, ymm0, ymm7
0xdbf319: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf31e: vfmadd231ps ymm2, ymm1, ymm8
0xdbf323: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf328: vshufps ymm0, ymm4, ymm4, 0
0xdbf32d: vmulps ymm3, ymm0, ymm5
0xdbf331: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf336: vfmadd231ps ymm3, ymm1, ymm6
0xdbf33b: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf340: vfmadd231ps ymm3, ymm0, ymm7
0xdbf345: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf34a: vfmadd231ps ymm3, ymm1, ymm8
0xdbf34f: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf354: mov rax, qword ptr [r13 + 0x870]
0xdbf35b: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf360: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf365: vshufps ymm0, ymm2, ymm2, 0
0xdbf36a: vmulps ymm3, ymm0, ymm5
0xdbf36e: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf373: vfmadd231ps ymm3, ymm1, ymm6
0xdbf378: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf37d: vfmadd231ps ymm3, ymm0, ymm7
0xdbf382: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf387: vfmadd231ps ymm3, ymm1, ymm8
0xdbf38c: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf391: vshufps ymm0, ymm4, ymm4, 0
0xdbf396: vmulps ymm2, ymm0, ymm5
0xdbf39a: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf39f: vfmadd231ps ymm2, ymm1, ymm6
0xdbf3a4: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf3a9: vfmadd231ps ymm2, ymm0, ymm7
0xdbf3ae: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf3b3: vfmadd231ps ymm2, ymm1, ymm8
0xdbf3b8: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf3bd: mov rax, qword ptr [r13 + 0x8c0]
0xdbf3c4: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf3c9: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf3ce: vshufps ymm0, ymm2, ymm2, 0
0xdbf3d3: vmulps ymm3, ymm0, ymm5
0xdbf3d7: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf3dc: vfmadd231ps ymm3, ymm1, ymm6
0xdbf3e1: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf3e6: vfmadd231ps ymm3, ymm0, ymm7
0xdbf3eb: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf3f0: vfmadd231ps ymm3, ymm1, ymm8
0xdbf3f5: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf3fa: vshufps ymm0, ymm4, ymm4, 0
0xdbf3ff: vmulps ymm2, ymm0, ymm5
0xdbf403: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf408: vfmadd231ps ymm2, ymm1, ymm6
0xdbf40d: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf412: vfmadd231ps ymm2, ymm0, ymm7
0xdbf417: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf41c: vfmadd231ps ymm2, ymm1, ymm8
0xdbf421: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf426: mov rax, qword ptr [r13 + 0x910]
0xdbf42d: vmovups ymm2, ymmword ptr [rax + 0x38]
0xdbf432: vmovups ymm4, ymmword ptr [rax + 0x58]
0xdbf437: vshufps ymm0, ymm2, ymm2, 0
0xdbf43c: vmulps ymm3, ymm0, ymm5
0xdbf440: vshufps ymm1, ymm2, ymm2, 0x55
0xdbf445: vfmadd231ps ymm3, ymm1, ymm6
0xdbf44a: vshufps ymm0, ymm2, ymm2, 0xaa
0xdbf44f: vfmadd231ps ymm3, ymm0, ymm7
0xdbf454: vshufps ymm1, ymm2, ymm2, 0xff
0xdbf459: vfmadd231ps ymm3, ymm1, ymm8
0xdbf45e: vmovups ymmword ptr [rax + 0x38], ymm3
0xdbf463: vshufps ymm0, ymm4, ymm4, 0
0xdbf468: vmulps ymm2, ymm0, ymm5
0xdbf46c: vshufps ymm1, ymm4, ymm4, 0x55
0xdbf471: vfmadd231ps ymm2, ymm1, ymm6
0xdbf476: vshufps ymm0, ymm4, ymm4, 0xaa
0xdbf47b: vfmadd231ps ymm2, ymm0, ymm7
0xdbf480: vshufps ymm1, ymm4, ymm4, 0xff
0xdbf485: vfmadd231ps ymm2, ymm1, ymm8
0xdbf48a: vmovups ymmword ptr [rax + 0x58], ymm2
0xdbf48f: cmp byte ptr [rip + 0x5fa7842], 0
0xdbf496: je 0x140dbf706
0xdbf49c: cmp qword ptr [r13 + 0x7b0], 0
0xdbf4a4: je 0x140dbf706
0xdbf4aa: mov rax, qword ptr [r13 + 0x820]
0xdbf4b1: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf4b6: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf4bb: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf4c4: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf4cd: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf4d3: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf4d9: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf4df: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf4e5: vshufps ymm0, ymm3, ymm3, 0
0xdbf4ea: vmulps ymm2, ymm0, ymm4
0xdbf4ee: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf4f3: vfmadd231ps ymm2, ymm1, ymm5
0xdbf4f8: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf4fd: vfmadd231ps ymm2, ymm0, ymm6
0xdbf502: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf507: vfmadd231ps ymm2, ymm1, ymm7
0xdbf50c: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf511: vshufps ymm0, ymm8, ymm8, 0
0xdbf517: vmulps ymm3, ymm0, ymm4
0xdbf51b: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf521: vfmadd231ps ymm3, ymm1, ymm5
0xdbf526: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf52c: vfmadd231ps ymm3, ymm0, ymm6
0xdbf531: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf537: vfmadd231ps ymm3, ymm1, ymm7
0xdbf53c: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf541: mov rax, qword ptr [r13 + 0x8c0]
0xdbf548: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf54d: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf552: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf55b: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf564: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf56a: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf570: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf576: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf57c: vshufps ymm0, ymm3, ymm3, 0
0xdbf581: vmulps ymm2, ymm0, ymm4
0xdbf585: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf58a: vfmadd231ps ymm2, ymm1, ymm5
0xdbf58f: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf594: vfmadd231ps ymm2, ymm0, ymm6
0xdbf599: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf59e: vfmadd231ps ymm2, ymm1, ymm7
0xdbf5a3: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf5a8: vshufps ymm0, ymm8, ymm8, 0
0xdbf5ae: vmulps ymm3, ymm0, ymm4
0xdbf5b2: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf5b8: vfmadd231ps ymm3, ymm1, ymm5
0xdbf5bd: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf5c3: vfmadd231ps ymm3, ymm0, ymm6
0xdbf5c8: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf5ce: vfmadd231ps ymm3, ymm1, ymm7
0xdbf5d3: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf5d8: mov rax, qword ptr [r13 + 0x910]
0xdbf5df: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf5e4: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf5e9: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf5f2: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf5fb: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf601: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf607: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf60d: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf613: vshufps ymm0, ymm3, ymm3, 0
0xdbf618: vmulps ymm2, ymm0, ymm4
0xdbf61c: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf621: vfmadd231ps ymm2, ymm1, ymm5
0xdbf626: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf62b: vfmadd231ps ymm2, ymm0, ymm6
0xdbf630: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf635: vfmadd231ps ymm2, ymm1, ymm7
0xdbf63a: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf63f: vshufps ymm0, ymm8, ymm8, 0
0xdbf645: vmulps ymm3, ymm0, ymm4
0xdbf649: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf64f: vfmadd231ps ymm3, ymm1, ymm5
0xdbf654: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf65a: vfmadd231ps ymm3, ymm0, ymm6
0xdbf65f: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf665: vfmadd231ps ymm3, ymm1, ymm7
0xdbf66a: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf66f: mov rax, qword ptr [r13 + 0x870]
0xdbf676: vmovups ymm3, ymmword ptr [rax + 0x38]
0xdbf67b: vmovups ymm8, ymmword ptr [rax + 0x58]
0xdbf680: vmovups ymm0, ymmword ptr [r13 + 0xa18]
0xdbf689: vmovups ymm1, ymmword ptr [r13 + 0xa38]
0xdbf692: vperm2f128 ymm4, ymm0, ymm0, 0
0xdbf698: vperm2f128 ymm5, ymm0, ymm0, 0x11
0xdbf69e: vperm2f128 ymm6, ymm1, ymm1, 0
0xdbf6a4: vperm2f128 ymm7, ymm1, ymm1, 0x11
0xdbf6aa: vshufps ymm0, ymm3, ymm3, 0
0xdbf6af: vmulps ymm2, ymm0, ymm4
0xdbf6b3: vshufps ymm1, ymm3, ymm3, 0x55
0xdbf6b8: vfmadd231ps ymm2, ymm1, ymm5
0xdbf6bd: vshufps ymm0, ymm3, ymm3, 0xaa
0xdbf6c2: vfmadd231ps ymm2, ymm0, ymm6
0xdbf6c7: vshufps ymm1, ymm3, ymm3, 0xff
0xdbf6cc: vfmadd231ps ymm2, ymm1, ymm7
0xdbf6d1: vmovups ymmword ptr [rax + 0x38], ymm2
0xdbf6d6: vshufps ymm0, ymm8, ymm8, 0
0xdbf6dc: vmulps ymm3, ymm0, ymm4
0xdbf6e0: vshufps ymm1, ymm8, ymm8, 0x55
0xdbf6e6: vfmadd231ps ymm3, ymm1, ymm5
0xdbf6eb: vshufps ymm0, ymm8, ymm8, 0xaa
0xdbf6f1: vfmadd231ps ymm3, ymm0, ymm6
0xdbf6f6: vshufps ymm1, ymm8, ymm8, 0xff
0xdbf6fc: vfmadd231ps ymm3, ymm1, ymm7
0xdbf701: vmovups ymmword ptr [rax + 0x58], ymm3
0xdbf706: lea rdx, [r13 + 0x828]
0xdbf70d: mov rcx, r13
0xdbf710: vzeroupper 
0xdbf713: call 0x140dc17c0
0xdbf718: lea rdx, [r13 + 0x878]
0xdbf71f: mov rcx, r13
0xdbf722: call 0x140dc17c0
0xdbf727: lea rdx, [r13 + 0x8c8]
0xdbf72e: mov rcx, r13
0xdbf731: call 0x140dc17c0
0xdbf736: lea rdx, [r13 + 0x918]
0xdbf73d: mov rcx, r13
0xdbf740: call 0x140dc17c0
0xdbf745: cmp byte ptr [r13 + 0xad8], 0
0xdbf74d: je 0x140dbf761
0xdbf74f: cmp dword ptr [r13 + 0x490], 0
0xdbf757: je 0x140dbf761
0xdbf759: mov byte ptr [r13 + 0xad7], 1
0xdbf761: mov byte ptr [r13 + 0xad8], 0
0xdbf769: cmp byte ptr [rip + 0x5eebff8], 0
0xdbf770: jne 0x140dbf780
0xdbf772: cmp byte ptr [r13 + 0xad7], 0
0xdbf77a: je 0x140dc1743
0xdbf780: mov byte ptr [r13 + 0xad7], 0
0xdbf788: mov rcx, qword ptr [r13 + 0x820]
0xdbf78f: call 0x143d11360
0xdbf794: mov rcx, qword ptr [r13 + 0x870]
0xdbf79b: call 0x143d11360
0xdbf7a0: mov rcx, qword ptr [r13 + 0x8c0]
0xdbf7a7: call 0x143d11360
0xdbf7ac: mov rcx, qword ptr [r13 + 0x910]
0xdbf7b3: call 0x143d11360
0xdbf7b8: mov rcx, qword ptr [r13 + 0x820]
0xdbf7bf: lea r9, [r13 + 0x84c]
0xdbf7c6: vmovss xmm0, dword ptr [r9]
0xdbf7cb: lea r10, [r13 + 0x848]
0xdbf7d2: mov eax, dword ptr [r10]
0xdbf7d5: mov dword ptr [rcx + 0xc8], eax
0xdbf7db: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf7e3: mov rcx, qword ptr [r13 + 0x870]
0xdbf7ea: lea rdi, [r13 + 0x89c]
0xdbf7f1: vmovss xmm0, dword ptr [rdi]
0xdbf7f5: lea rsi, [r13 + 0x898]
0xdbf7fc: mov eax, dword ptr [rsi]
0xdbf7fe: mov dword ptr [rcx + 0xc8], eax
0xdbf804: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf80c: mov rcx, qword ptr [r13 + 0x8c0]
0xdbf813: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdbf81c: mov eax, dword ptr [r13 + 0x8e8]
0xdbf823: mov dword ptr [rcx + 0xc8], eax
0xdbf829: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf831: mov rcx, qword ptr [r13 + 0x910]
0xdbf838: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdbf841: mov eax, dword ptr [r13 + 0x8e8]
0xdbf848: mov dword ptr [rcx + 0xc8], eax
0xdbf84e: vmovss dword ptr [rcx + 0xcc], xmm0
0xdbf856: mov r12, r14
0xdbf859: mov qword ptr [rsp + 0x78], r14
0xdbf85e: mov qword ptr [rsp + 0x180], r14
0xdbf866: mov qword ptr [rsp + 0x188], r14
0xdbf86e: mov rdx, r14
0xdbf871: mov qword ptr [rsp + 0x368], rdx
0xdbf879: mov qword ptr [rsp + 0x170], rdx
0xdbf881: mov qword ptr [rsp + 0x178], r14
0xdbf889: mov rax, r14
0xdbf88c: mov qword ptr [rsp + 0xc8], rax
0xdbf894: mov qword ptr [rsp + 0x190], rax
0xdbf89c: mov qword ptr [rsp + 0x198], r14
0xdbf8a4: mov rbx, qword ptr [r13 + 0x478]
0xdbf8ab: mov qword ptr [rsp + 0x60], rbx
0xdbf8b0: mov eax, dword ptr [r13 + 0x480]
0xdbf8b7: lea rcx, [rax + rax*2]
0xdbf8bb: lea rax, [rbx + rcx*8]
0xdbf8bf: mov qword ptr [rsp + 0xa0], rax
0xdbf8c7: mov ecx, 1
0xdbf8cc: mov r8d, 0x1fd
0xdbf8d2: vmovss xmm12, dword ptr [rip + 0x4fb6476]
0xdbf8da: cmp rbx, rax
0xdbf8dd: je 0x140dc007a
0xdbf8e3: mov edi, 0xffff
0xdbf8e8: vmovss xmm15, dword ptr [rip + 0x4fb4098]
0xdbf8f0: jmp 0x140dbf905
0xdbf8f2: nop dword ptr [rax]
0xdbf8f6: nop word ptr [rax + rax]
0xdbf900: mov ecx, 1
0xdbf905: mov r8d, ecx
0xdbf908: movzx edx, word ptr [rbx]
0xdbf90b: call 0x140652f40
0xdbf910: mov byte ptr [rsp + 0x368], al
0xdbf917: mov rcx, rbx
0xdbf91a: call 0x140433650
0xdbf91f: movzx ebx, word ptr [rax + 0x18]
0xdbf923: test r15, r15
0xdbf926: lea rdx, [r15 + 8]
0xdbf92a: jne 0x140dbf92f
0xdbf92c: mov rdx, r14
0xdbf92f: mov rdx, qword ptr [rdx]
0xdbf932: lea rcx, [rsp + 0x210]
0xdbf93a: call 0x140393df0
0xdbf93f: nop 
0xdbf940: cmp dword ptr [r15 + 0x28], ebx
0xdbf944: jbe 0x140dbf959
0xdbf946: imul rdx, rbx, 0x1c8
0xdbf94d: add rdx, qword ptr [r15 + 0x20]
0xdbf951: je 0x140dbf959
0xdbf953: movzx eax, word ptr [rdx + 0x18]
0xdbf957: jmp 0x140dbf95b
0xdbf959: mov eax, edi
0xdbf95b: mov word ptr [rsp + 0x358], ax
0xdbf963: mov rcx, qword ptr [rsp + 0x210]
0xdbf96b: mov rax, qword ptr [rcx]
0xdbf96e: mov dl, 1
0xdbf970: call qword ptr [rax + 0x20]
0xdbf973: mov byte ptr [rsp + 0x360], 1
0xdbf97b: lea rcx, [rsp + 0x358]
0xdbf983: call 0x140430150
0xdbf988: cmp word ptr [rax + 0x24], di
0xdbf98c: je 0x140dbf9b1
0xdbf98e: lea rcx, [rsp + 0x358]
0xdbf996: call 0x140430150
0xdbf99b: mov r8d, 1
0xdbf9a1: movzx edx, word ptr [rax + 0x24]
0xdbf9a5: call 0x140652f40
0xdbf9aa: mov byte ptr [rsp + 0x360], al
0xdbf9b1: mov rbx, qword ptr [rsp + 0x60]
0xdbf9b6: mov rcx, rbx
0xdbf9b9: call 0x140433650
0xdbf9be: cmp word ptr [rax + 0x18], di
0xdbf9c2: je 0x140dbf9ea
0xdbf9c4: mov rcx, rbx
0xdbf9c7: call 0x140433650
0xdbf9cc: movzx r8d, word ptr [rax + 0x18]
0xdbf9d1: lea rdx, [rsp + 0x258]
0xdbf9d9: mov rcx, r15
0xdbf9dc: call 0x14176bcc0
0xdbf9e1: vmovsd xmm0, qword ptr [rax]
0xdbf9e5: mov ecx, dword ptr [rax + 8]
0xdbf9e8: jmp 0x140dbfa29
0xdbf9ea: movzx edx, word ptr [rbx]
0xdbf9ed: mov rcx, qword ptr [rsp + 0x1e0]
0xdbf9f5: call 0x140d91e30
0xdbf9fa: cmp dword ptr [rax + 0x58], 0
0xdbf9fe: jne 0x140dbfa05
0xdbfa00: movzx eax, di
0xdbfa03: jmp 0x140dbfa0c
0xdbfa05: mov rax, qword ptr [rax + 0x50]
0xdbfa09: movzx eax, word ptr [rax]
0xdbfa0c: mov word ptr [rsp + 0x358], ax
0xdbfa14: lea rcx, [rsp + 0x358]
0xdbfa1c: call 0x140537250
0xdbfa21: vmovsd xmm0, qword ptr [rax + 0x14]
0xdbfa26: mov ecx, dword ptr [rax + 0x1c]
0xdbfa29: vmovsd qword ptr [rsp + 0x218], xmm0
0xdbfa32: mov r12, qword ptr [rbx + 8]
0xdbfa36: mov qword ptr [rsp + 0x78], r12
0xdbfa3b: mov eax, dword ptr [rbx + 0x10]
0xdbfa3e: lea rax, [r12 + rax*2]
0xdbfa42: mov qword ptr [rsp + 0x168], rax
0xdbfa4a: cmp r12, rax
0xdbfa4d: je 0x140dc000c
0xdbfa53: vmovd xmm0, ecx
0xdbfa57: vxorps xmm13, xmm0, xmm12
0xdbfa5c: vmovss xmm11, dword ptr [rsp + 0x218]
0xdbfa65: vmovss dword ptr [rsp + 0x160], xmm11
0xdbfa6e: vmovss dword ptr [rsp + 0x164], xmm13
0xdbfa77: mov r14, qword ptr [rsp + 0x160]
0xdbfa7f: nop 
0xdbfa80: mov rcx, r12
0xdbfa83: call 0x140433650
0xdbfa88: cmp word ptr [rax + 0x18], di
0xdbfa8c: je 0x140dbfab4
0xdbfa8e: mov rcx, r12
0xdbfa91: call 0x140433650
0xdbfa96: movzx r8d, word ptr [rax + 0x18]
0xdbfa9b: lea rdx, [rsp + 0x264]
0xdbfaa3: mov rcx, r15
0xdbfaa6: call 0x14176bcc0
0xdbfaab: vmovsd xmm0, qword ptr [rax]
0xdbfaaf: mov ecx, dword ptr [rax + 8]
0xdbfab2: jmp 0x140dbfaf5
0xdbfab4: movzx edx, word ptr [r12]
0xdbfab9: mov rcx, qword ptr [rsp + 0x1e0]
0xdbfac1: call 0x140d91e30
0xdbfac6: cmp dword ptr [rax + 0x58], 0
0xdbfaca: jne 0x140dbfad1
0xdbfacc: movzx eax, di
0xdbfacf: jmp 0x140dbfad8
0xdbfad1: mov rax, qword ptr [rax + 0x50]
0xdbfad5: movzx eax, word ptr [rax]
0xdbfad8: mov word ptr [rsp + 0x358], ax
0xdbfae0: lea rcx, [rsp + 0x358]
0xdbfae8: call 0x140537250
0xdbfaed: vmovsd xmm0, qword ptr [rax + 0x14]
0xdbfaf2: mov ecx, dword ptr [rax + 0x1c]
0xdbfaf5: vmovsd qword ptr [rsp + 0x228], xmm0
0xdbfafe: vmovd xmm0, ecx
0xdbfb02: vxorps xmm8, xmm0, xmm12
0xdbfb07: vmovss xmm9, dword ptr [rsp + 0x228]
0xdbfb10: vmovss dword ptr [rsp + 0xe0], xmm9
0xdbfb19: vmovss dword ptr [rsp + 0xe4], xmm8
0xdbfb22: cmp byte ptr [rip + 0x5eebc8f], 0
0xdbfb29: je 0x140dbfbf0
0xdbfb2f: vaddss xmm7, xmm11, xmm14
0xdbfb34: vsubss xmm1, xmm8, xmm13
0xdbfb39: vsubss xmm0, xmm9, xmm11
0xdbfb3e: vdivss xmm2, xmm1, xmm0
0xdbfb42: vdivss xmm3, xmm15, xmm2
0xdbfb46: vaddss xmm0, xmm11, xmm14
0xdbfb4b: vmulss xmm6, xmm3, xmm0
0xdbfb4f: vmulss xmm1, xmm7, xmm7
0xdbfb53: vmulss xmm0, xmm6, xmm6
0xdbfb57: vaddss xmm2, xmm1, xmm0
0xdbfb5b: vcomiss xmm2, xmm10
0xdbfb60: jbe 0x140dbfb87
0xdbfb62: vxorps xmm0, xmm0, xmm0
0xdbfb66: vucomiss xmm0, xmm2
0xdbfb6a: ja 0x140dbfb72
0xdbfb6c: vsqrtss xmm0, xmm2, xmm2
0xdbfb70: jmp 0x140dbfb7b
0xdbfb72: vmovaps xmm0, xmm2
0xdbfb76: call 0x144898f6e
0xdbfb7b: vdivss xmm0, xmm14, xmm0
0xdbfb7f: vmulss xmm7, xmm0, xmm7
0xdbfb83: vmulss xmm6, xmm6, xmm0
0xdbfb87: vcomiss xmm6, xmm10
0xdbfb8c: jbe 0x140dbfb98
0xdbfb8e: vmulss xmm7, xmm7, xmm15
0xdbfb93: vmulss xmm6, xmm6, xmm15
0xdbfb98: vmulss xmm3, xmm6, dword ptr [rip + 0x5eebb78]
0xdbfba0: vmulss xmm2, xmm7, dword ptr [rip + 0x5eebb70]
0xdbfba8: vaddss xmm0, xmm2, xmm11
0xdbfbad: vmovss dword ptr [rsp + 0x1a0], xmm0
0xdbfbb6: vaddss xmm1, xmm13, xmm3
0xdbfbba: vmovss dword ptr [rsp + 0x1a4], xmm1
0xdbfbc3: mov rdi, qword ptr [rsp + 0x1a0]
0xdbfbcb: vaddss xmm0, xmm2, xmm9
0xdbfbd0: vmovss dword ptr [rsp + 0x1d0], xmm0
0xdbfbd9: vaddss xmm1, xmm8, xmm3
0xdbfbdd: vmovss dword ptr [rsp + 0x1d4], xmm1
0xdbfbe6: mov rsi, qword ptr [rsp + 0x1d0]
0xdbfbee: jmp 0x140dbfc3e
0xdbfbf0: vsubss xmm0, xmm11, xmm10
0xdbfbf5: vmovss dword ptr [rsp + 0x1c0], xmm0
0xdbfbfe: vsubss xmm1, xmm13, dword ptr [rip + 0x5eebb12]
0xdbfc06: vmovss dword ptr [rsp + 0x1c4], xmm1
0xdbfc0f: mov rdi, qword ptr [rsp + 0x1c0]
0xdbfc17: vsubss xmm0, xmm9, xmm10
0xdbfc1c: vmovss dword ptr [rsp + 0x1b8], xmm0
0xdbfc25: vsubss xmm1, xmm8, dword ptr [rip + 0x5eebaeb]
0xdbfc2d: vmovss dword ptr [rsp + 0x1bc], xmm1
0xdbfc36: mov rsi, qword ptr [rsp + 0x1b8]
0xdbfc3e: mov qword ptr [rsp + 0xf0], rdi
0xdbfc46: mov byte ptr [rsp + 0x358], 0
0xdbfc4e: mov rcx, rbx
0xdbfc51: call 0x140433650
0xdbfc56: mov ecx, 0xffff
0xdbfc5b: cmp word ptr [rax + 0x18], cx
0xdbfc5f: je 0x140dc07f1
0xdbfc65: mov rcx, r12
0xdbfc68: call 0x140433650
0xdbfc6d: mov ecx, 0xffff
0xdbfc72: cmp word ptr [rax + 0x18], cx
0xdbfc76: je 0x140dc07f1
0xdbfc7c: mov rcx, rbx
0xdbfc7f: call 0x140433650
0xdbfc84: movzx ebx, word ptr [rax + 0x18]
0xdbfc88: test r15, r15
0xdbfc8b: je 0x140dbfc93
0xdbfc8d: lea rdx, [r15 + 8]
0xdbfc91: jmp 0x140dbfc97
0xdbfc93: xor eax, eax
0xdbfc95: mov edx, eax
0xdbfc97: mov rdx, qword ptr [rdx]
0xdbfc9a: lea rcx, [rsp + 0x1b0]
0xdbfca2: call 0x140393df0
0xdbfca7: nop 
0xdbfca8: cmp dword ptr [r15 + 0x28], ebx
0xdbfcac: jbe 0x140dbfdb7
0xdbfcb2: imul rbx, rbx, 0x1c8
0xdbfcb9: add rbx, qword ptr [r15 + 0x20]
0xdbfcbd: je 0x140dbfdb7
0xdbfcc3: movzx ebx, byte ptr [rbx + 0x1c]
0xdbfcc7: mov rcx, qword ptr [rsp + 0x1b0]
0xdbfccf: mov rax, qword ptr [rcx]
0xdbfcd2: mov dl, 1
0xdbfcd4: call qword ptr [rax + 0x20]
0xdbfcd7: test bl, bl
0xdbfcd9: jne 0x140dbfdc7
0xdbfcdf: mov rcx, qword ptr [rsp + 0x60]
0xdbfce4: call 0x140433650
0xdbfce9: movzx ebx, word ptr [rax + 0x18]
0xdbfced: mov rdx, qword ptr [r15 + 8]
0xdbfcf1: lea rcx, [rsp + 0xd0]
0xdbfcf9: call 0x140393df0
0xdbfcfe: nop 
0xdbfcff: mov r9d, dword ptr [r15 + 0x28]
0xdbfd03: cmp r9d, ebx
0xdbfd06: jbe 0x140dbfd8e
0xdbfd0c: mov r8, qword ptr [r15 + 0x20]
0xdbfd10: imul rax, rbx, 0x1c8
0xdbfd17: add rax, r8
0xdbfd1a: je 0x140dbfd8e
0xdbfd1c: cmp byte ptr [rax + 0x1c], 0
0xdbfd20: jne 0x140dbfd8e
0xdbfd22: mov rbx, qword ptr [rax + 0x10]
0xdbfd26: movzx edx, word ptr [rbx]
0xdbfd29: mov eax, 0xffff
0xdbfd2e: cmp dx, ax
0xdbfd31: je 0x140dbfd8e
0xdbfd33: movzx ebx, word ptr [rbx + 2]
0xdbfd37: cmp ax, bx
0xdbfd3a: je 0x140dbfd65
0xdbfd3c: cmp r9d, ebx
0xdbfd3f: jbe 0x140dbfd65
0xdbfd41: imul rax, rbx, 0x1c8
0xdbfd48: add rax, r8
0xdbfd4b: je 0x140dbfd65
0xdbfd4d: cmp word ptr [rax + 0x18], dx
0xdbfd51: jne 0x140dbfd65
0xdbfd53: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd5b: mov rax, qword ptr [rcx]
0xdbfd5e: mov dl, 1
0xdbfd60: call qword ptr [rax + 0x20]
0xdbfd63: jmp 0x140dbfda3
0xdbfd65: cmp dword ptr [r15 + 0x38], edx
0xdbfd69: jbe 0x140dbfd8e
0xdbfd6b: imul rbx, rdx, 0xd0
0xdbfd72: add rbx, qword ptr [r15 + 0x30]
0xdbfd76: je 0x140dbfd8e
0xdbfd78: movzx ebx, word ptr [rbx + 0x38]
0xdbfd7c: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd84: mov rax, qword ptr [rcx]
0xdbfd87: mov dl, 1
0xdbfd89: call qword ptr [rax + 0x20]
0xdbfd8c: jmp 0x140dbfda3
0xdbfd8e: mov rcx, qword ptr [rsp + 0xd0]
0xdbfd96: mov rax, qword ptr [rcx]
0xdbfd99: mov dl, 1
0xdbfd9b: call qword ptr [rax + 0x20]
0xdbfd9e: mov ebx, 0xffff
0xdbfda3: mov rcx, r12
0xdbfda6: call 0x140433650
0xdbfdab: cmp bx, word ptr [rax + 0x18]
0xdbfdaf: je 0x140dbff00
0xdbfdb5: jmp 0x140dbfdc7
0xdbfdb7: mov rcx, qword ptr [rsp + 0x1b0]
0xdbfdbf: mov rax, qword ptr [rcx]
0xdbfdc2: mov dl, 1
0xdbfdc4: call qword ptr [rax + 0x20]
0xdbfdc7: mov rcx, r12
0xdbfdca: call 0x140433650
0xdbfdcf: movzx ebx, word ptr [rax + 0x18]
0xdbfdd3: test r15, r15
0xdbfdd6: je 0x140dbfdde
0xdbfdd8: lea rdx, [r15 + 8]
0xdbfddc: jmp 0x140dbfde2
0xdbfdde: xor eax, eax
0xdbfde0: mov edx, eax
0xdbfde2: mov rdx, qword ptr [rdx]
0xdbfde5: lea rcx, [rsp + 0x1c8]
0xdbfded: call 0x140393df0
0xdbfdf2: nop 
0xdbfdf3: cmp dword ptr [r15 + 0x28], ebx
0xdbfdf7: jbe 0x140dc00fc
0xdbfdfd: imul rbx, rbx, 0x1c8
0xdbfe04: add rbx, qword ptr [r15 + 0x20]
0xdbfe08: je 0x140dc00fc
0xdbfe0e: movzx ebx, byte ptr [rbx + 0x1c]
0xdbfe12: mov rcx, qword ptr [rsp + 0x1c8]
0xdbfe1a: mov rax, qword ptr [rcx]
0xdbfe1d: mov dl, 1
0xdbfe1f: call qword ptr [rax + 0x20]
0xdbfe22: test bl, bl
0xdbfe24: jne 0x140dc010c
0xdbfe2a: mov rcx, r12
0xdbfe2d: call 0x140433650
0xdbfe32: movzx ebx, word ptr [rax + 0x18]
0xdbfe36: mov rdx, qword ptr [r15 + 8]
0xdbfe3a: lea rcx, [rsp + 0xd8]
0xdbfe42: call 0x140393df0
0xdbfe47: nop 
0xdbfe48: mov r9d, dword ptr [r15 + 0x28]
0xdbfe4c: cmp r9d, ebx
0xdbfe4f: jbe 0x140dbfed7
0xdbfe55: mov r8, qword ptr [r15 + 0x20]
0xdbfe59: imul rax, rbx, 0x1c8
0xdbfe60: add rax, r8
0xdbfe63: je 0x140dbfed7
0xdbfe65: cmp byte ptr [rax + 0x1c], 0
0xdbfe69: jne 0x140dbfed7
0xdbfe6b: mov rbx, qword ptr [rax + 0x10]
0xdbfe6f: movzx edx, word ptr [rbx]
0xdbfe72: mov eax, 0xffff
0xdbfe77: cmp dx, ax
0xdbfe7a: je 0x140dbfed7
0xdbfe7c: movzx ebx, word ptr [rbx + 2]
0xdbfe80: cmp ax, bx
0xdbfe83: je 0x140dbfeae
0xdbfe85: cmp r9d, ebx
0xdbfe88: jbe 0x140dbfeae
0xdbfe8a: imul rax, rbx, 0x1c8
0xdbfe91: add rax, r8
0xdbfe94: je 0x140dbfeae
0xdbfe96: cmp word ptr [rax + 0x18], dx
0xdbfe9a: jne 0x140dbfeae
0xdbfe9c: mov rcx, qword ptr [rsp + 0xd8]
0xdbfea4: mov rax, qword ptr [rcx]
0xdbfea7: mov dl, 1
0xdbfea9: call qword ptr [rax + 0x20]
0xdbfeac: jmp 0x140dbfeec
0xdbfeae: cmp dword ptr [r15 + 0x38], edx
0xdbfeb2: jbe 0x140dbfed7
0xdbfeb4: imul rbx, rdx, 0xd0
0xdbfebb: add rbx, qword ptr [r15 + 0x30]
0xdbfebf: je 0x140dbfed7
0xdbfec1: movzx ebx, word ptr [rbx + 0x38]
0xdbfec5: mov rcx, qword ptr [rsp + 0xd8]
0xdbfecd: mov rax, qword ptr [rcx]
0xdbfed0: mov dl, 1
0xdbfed2: call qword ptr [rax + 0x20]
0xdbfed5: jmp 0x140dbfeec
0xdbfed7: mov rcx, qword ptr [rsp + 0xd8]
0xdbfedf: mov rax, qword ptr [rcx]
0xdbfee2: mov dl, 1
0xdbfee4: call qword ptr [rax + 0x20]
0xdbfee7: mov ebx, 0xffff
0xdbfeec: mov rcx, qword ptr [rsp + 0x60]
0xdbfef1: call 0x140433650
0xdbfef6: cmp bx, word ptr [rax + 0x18]
0xdbfefa: jne 0x140dc010c
0xdbff00: cmp byte ptr [rip + 0x5eeb901], 0
0xdbff07: je 0x140dbffe8
0xdbff0d: mov byte ptr [rsp + 0x358], 1
0xdbff15: cmp byte ptr [rsp + 0x368], 0
0xdbff1d: je 0x140dbffe8
0xdbff23: cmp byte ptr [rsp + 0x360], 0
0xdbff2b: je 0x140dbffe8
0xdbff31: mov r8d, 1
0xdbff37: movzx edx, word ptr [r12]
0xdbff3c: call 0x140652f40
0xdbff41: mov byte ptr [rsp + 0x6c], al
0xdbff45: mov byte ptr [rsp + 0x6d], 1
0xdbff4a: mov rcx, r12
0xdbff4d: call 0x140433650
0xdbff52: movzx ebx, word ptr [rax + 0x18]
0xdbff56: mov rdx, qword ptr [r15 + 8]
0xdbff5a: lea rcx, [rsp + 0x1f8]
0xdbff62: call 0x140393df0
0xdbff67: nop 
0xdbff68: cmp dword ptr [r15 + 0x28], ebx
0xdbff6c: jbe 0x140dbff81
0xdbff6e: imul rdx, rbx, 0x1c8
0xdbff75: add rdx, qword ptr [r15 + 0x20]
0xdbff79: je 0x140dbff81
0xdbff7b: movzx eax, word ptr [rdx + 0x18]
0xdbff7f: jmp 0x140dbff86
0xdbff81: mov eax, 0xffff
0xdbff86: mov word ptr [rsp + 0xc0], ax
0xdbff8e: mov rcx, qword ptr [rsp + 0x1f8]
0xdbff96: mov rax, qword ptr [rcx]
0xdbff99: mov dl, 1
0xdbff9b: call qword ptr [rax + 0x20]
0xdbff9e: lea rcx, [rsp + 0xc0]
0xdbffa6: call 0x140430150
0xdbffab: mov ecx, 0xffff
0xdbffb0: cmp word ptr [rax + 0x24], cx
0xdbffb4: je 0x140dbffd4
0xdbffb6: lea rcx, [rsp + 0xc0]
0xdbffbe: call 0x140430150
0xdbffc3: mov r8d, 1
0xdbffc9: movzx edx, word ptr [rax + 0x24]
0xdbffcd: call 0x140652f40
0xdbffd2: jmp 0x140dbffd9
0xdbffd4: movzx eax, byte ptr [rsp + 0x6d]
0xdbffd9: cmp byte ptr [rsp + 0x6c], 0
0xdbffde: je 0x140dbffe8
0xdbffe0: test al, al
0xdbffe2: jne 0x140dc010c
0xdbffe8: mov rbx, qword ptr [rsp + 0x60]
0xdbffed: add r12, 2
0xdbfff1: mov qword ptr [rsp + 0x78], r12
0xdbfff6: cmp r12, qword ptr [rsp + 0x168]
0xdbfffe: mov edi, 0xffff
0xdc0003: jne 0x140dbfa80
0xdc0009: xor r14d, r14d
0xdc000c: add rbx, 0x18
0xdc0010: mov qword ptr [rsp + 0x60], rbx
0xdc0015: cmp rbx, qword ptr [rsp + 0xa0]
0xdc001d: jne 0x140dbf900
0xdc0023: lea r9, [r13 + 0x84c]
0xdc002a: lea r10, [r13 + 0x848]
0xdc0031: lea rdi, [r13 + 0x89c]
0xdc0038: lea rsi, [r13 + 0x898]
0xdc003f: mov r12, qword ptr [rsp + 0x180]
0xdc0047: mov qword ptr [rsp + 0x78], r12
0xdc004c: mov rax, qword ptr [rsp + 0x170]
0xdc0054: mov qword ptr [rsp + 0x368], rax
0xdc005c: mov rax, qword ptr [rsp + 0x190]
0xdc0064: mov qword ptr [rsp + 0xc8], rax
0xdc006c: vmovss xmm9, dword ptr [rip + 0x4fb2ec0]
0xdc0074: mov r8d, 0x1fd
0xdc007a: mov qword ptr [rsp + 0x50], r14
0xdc007f: mov qword ptr [rsp + 0x58], 0
0xdc0088: vmovss xmm6, dword ptr [rip + 0x4fb2c88]
0xdc0090: vmovss dword ptr [rsp + 0x80], xmm6
0xdc0099: vmovss dword ptr [rsp + 0x84], xmm6
0xdc00a2: vmovss dword ptr [rsp + 0x88], xmm6
0xdc00ab: vmovss xmm0, dword ptr [r13 + 0x834]
0xdc00b4: vmovss dword ptr [rsp + 0x8c], xmm0
0xdc00bd: mov r14, r12
0xdc00c0: mov qword ptr [rsp + 0x360], r12
0xdc00c8: mov eax, dword ptr [rsp + 0x188]
0xdc00cf: shl rax, 4
0xdc00d3: add rax, r12
0xdc00d6: mov qword ptr [rsp + 0xa0], rax
0xdc00de: cmp r12, rax
0xdc00e1: je 0x140dc0cbb
0xdc00e7: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc00f0: lea r12, [r13 + 0x84c]
0xdc00f7: jmp 0x140dc09c6
0xdc00fc: mov rcx, qword ptr [rsp + 0x1c8]
0xdc0104: mov rax, qword ptr [rcx]
0xdc0107: mov dl, 1
0xdc0109: call qword ptr [rax + 0x20]
0xdc010c: xor eax, eax
0xdc010e: mov qword ptr [rsp + 0x90], rax
0xdc0116: mov qword ptr [rsp + 0x98], rax
0xdc011e: mov rax, qword ptr gs:[0x58]
0xdc0127: mov rcx, qword ptr [rax]
0xdc012a: mov eax, 0x1ec
0xdc012f: mov rdx, qword ptr [rip + 0x5fa93f2]
0xdc0136: cmp byte ptr [rax + rcx], 0
0xdc013a: cmovne rdx, qword ptr [rip + 0x5fa93ee]
0xdc0142: mov rax, qword ptr [rdx]
0xdc0145: mov rcx, qword ptr [rax + 8]
0xdc0149: mov r15, qword ptr [rcx + 0x348]
0xdc0150: mov rcx, r12
0xdc0153: call 0x140433650
0xdc0158: lea rbx, [rax + 0x18]
0xdc015c: mov rcx, qword ptr [rsp + 0x60]
0xdc0161: call 0x140433650
0xdc0166: lea rdx, [rax + 0x18]
0xdc016a: lea r9, [rsp + 0x90]
0xdc0172: mov r8, rbx
0xdc0175: mov rcx, r15
0xdc0178: call 0x1415dad20
0xdc017d: mov r15d, dword ptr [rsp + 0x98]
0xdc0185: test r15d, r15d
0xdc0188: jne 0x140dc05f0
0xdc018e: mov rcx, qword ptr [rsp + 0x60]
0xdc0193: call 0x140433650
0xdc0198: lea rcx, [rax + 0x18]
0xdc019c: call 0x140430020
0xdc01a1: mov rbx, qword ptr [rax + 0x90]
0xdc01a8: mov eax, dword ptr [rax + 0x98]
0xdc01ae: lea rcx, [rax + rax*2]
0xdc01b2: lea rax, [rbx + rcx*8]
0xdc01b6: mov qword ptr [rsp + 0xc8], rax
0xdc01be: cmp rbx, rax
0xdc01c1: je 0x140dc01e7
0xdc01c3: mov rcx, r12
0xdc01c6: call 0x140433650
0xdc01cb: movzx ecx, word ptr [rax + 0x18]
0xdc01cf: cmp word ptr [rbx + 2], cx
0xdc01d3: je 0x140dc02c1
0xdc01d9: add rbx, 0x18
0xdc01dd: cmp rbx, qword ptr [rsp + 0xc8]
0xdc01e5: jne 0x140dc01c3
0xdc01e7: mov r12, qword ptr [rsp + 0x90]
0xdc01ef: mov rbx, qword ptr [rsp + 0x1e0]
0xdc01f7: lea rdx, [rbx + 8]
0xdc01fb: test rbx, rbx
0xdc01fe: mov eax, 0
0xdc0203: cmove rdx, rax
0xdc0207: mov rdx, qword ptr [rdx]
0xdc020a: lea rcx, [rsp + 0x238]
0xdc0212: call 0x140393df0
0xdc0217: nop 
0xdc0218: mov qword ptr [rsp + 0x240], rbx
0xdc0220: mov r15d, dword ptr [rsp + 0x68]
0xdc0225: or r15d, 4
0xdc0229: mov dword ptr [rsp + 0x70], r15d
0xdc022e: mov rcx, qword ptr [rsp + 0x60]
0xdc0233: call 0x140433650
0xdc0238: lea rcx, [rax + 0x18]
0xdc023c: call 0x140430020
0xdc0241: movzx ecx, word ptr [rax + 0x12]
0xdc0245: mov rax, qword ptr [rbx + 0x68]
0xdc0249: mov rax, qword ptr [rax + 0x150]
0xdc0250: lea rcx, [rcx + rcx*2]
0xdc0254: mov rax, qword ptr [rax + 0x18]
0xdc0258: mov eax, dword ptr [rax + rcx*8]
0xdc025b: mov dword ptr [rsp + 0xc0], eax
0xdc0262: and r15d, 0xfffffffb
0xdc0266: mov dword ptr [rsp + 0x68], r15d
0xdc026b: mov dword ptr [rsp + 0x70], r15d
0xdc0270: mov rcx, qword ptr [rsp + 0x238]
0xdc0278: mov rax, qword ptr [rcx]
0xdc027b: mov dl, 1
0xdc027d: call qword ptr [rax + 0x20]
0xdc0280: mov rbx, qword ptr [rsp + 0x60]
0xdc0285: mov rcx, rbx
0xdc0288: call 0x140433650
0xdc028d: lea rcx, [rax + 0x18]
0xdc0291: call 0x140430020
0xdc0296: lea rcx, [rax + 0x12]
0xdc029a: mov eax, 0xffff
0xdc029f: cmp word ptr [rcx], ax
0xdc02a2: je 0x140dc049f
0xdc02a8: call 0x140433650
0xdc02ad: cmp dword ptr [rax + 0x90], 1
0xdc02b4: jge 0x140dc048e
0xdc02ba: xor eax, eax
0xdc02bc: jmp 0x140dc0495
0xdc02c1: mov rdx, qword ptr [rbx + 8]
0xdc02c5: mov qword ptr [rsp + 0xc8], rdx
0xdc02cd: mov eax, dword ptr [rbx + 0x10]
0xdc02d0: lea rcx, [rax + rax*2]
0xdc02d4: lea rax, [rdx + rcx*4]
0xdc02d8: mov qword ptr [rsp + 0x100], rax
0xdc02e0: cmp rdx, rax
0xdc02e3: je 0x140dc01e7
0xdc02e9: mov rax, qword ptr gs:[0x58]
0xdc02f2: mov r8, qword ptr [rax]
0xdc02f5: mov qword ptr [rsp + 0xc0], r8
0xdc02fd: mov r13d, dword ptr [rsp + 0x9c]
0xdc0305: mov r12, qword ptr [rsp + 0x90]
0xdc030d: mov r14d, 0x1fd
0xdc0313: mov edi, 1
0xdc0318: nop dword ptr [rax + rax]
0xdc0320: vmovss xmm0, dword ptr [rdx]
0xdc0324: vmovss dword ptr [rsp + 0x1a8], xmm0
0xdc032d: vmovss xmm1, dword ptr [rdx + 8]
0xdc0332: vxorps xmm2, xmm1, xmm12
0xdc0337: vmovss dword ptr [rsp + 0x1ac], xmm2
0xdc0340: cmp r13d, r15d
0xdc0343: ja 0x140dc0434
0xdc0349: lea ebx, [r13*2 + 1]
0xdc0351: add ebx, r13d
0xdc0354: shr ebx, 1
0xdc0356: cmp ebx, edi
0xdc0358: cmovb ebx, edi
0xdc035b: cmp r15d, ebx
0xdc035e: cmova ebx, r15d
0xdc0362: cmp ebx, r13d
0xdc0365: jbe 0x140dc0434
0xdc036b: lea ecx, [rbx*8]
0xdc0372: mov eax, r14d
0xdc0375: mov qword ptr [rsp + 0x200], rax
0xdc037d: mov edx, 4
0xdc0382: cmp byte ptr [r14 + r8], 0
0xdc0387: je 0x140dc0390
0xdc0389: call 0x1447efa78
0xdc038e: jmp 0x140dc0395
0xdc0390: call 0x1447ef9b0
0xdc0395: mov r13, rax
0xdc0398: test rax, rax
0xdc039b: jne 0x140dc03b5
0xdc039d: call 0x141318e70
0xdc03a2: xor r9d, r9d
0xdc03a5: xor r8d, r8d
0xdc03a8: mov edx, edi
0xdc03aa: mov ecx, 0xa0000002
0xdc03af: call qword ptr [rip + 0x442ad93]
0xdc03b5: test r15d, r15d
0xdc03b8: je 0x140dc03e5
0xdc03ba: mov rdx, r13
0xdc03bd: mov rcx, r12
0xdc03c0: sub rcx, r13
0xdc03c3: mov r8d, r15d
0xdc03c6: nop word ptr [rax + rax]
0xdc03d0: mov rax, qword ptr [rcx + rdx]
0xdc03d4: mov qword ptr [rdx], rax
0xdc03d7: lea rdx, [rdx + 8]
0xdc03db: sub r8, rdi
0xdc03de: jne 0x140dc03d0
0xdc03e0: mov eax, r14d
0xdc03e3: jmp 0x140dc03ed
0xdc03e5: mov rax, qword ptr [rsp + 0x200]
0xdc03ed: test r12, r12
0xdc03f0: je 0x140dc040f
0xdc03f2: mov rcx, qword ptr [rsp + 0xc0]
0xdc03fa: cmp byte ptr [rcx + rax], 0
0xdc03fe: mov rcx, r12
0xdc0401: je 0x140dc040a
0xdc0403: call 0x1447f03bc
0xdc0408: jmp 0x140dc040f
0xdc040a: call 0x1447f02bc
0xdc040f: mov r12, r13
0xdc0412: mov qword ptr [rsp + 0x90], r13
0xdc041a: mov r13d, ebx
0xdc041d: mov dword ptr [rsp + 0x9c], ebx
0xdc0424: mov rdx, qword ptr [rsp + 0xc8]
0xdc042c: mov r8, qword ptr [rsp + 0xc0]
0xdc0434: mov ecx, r15d
0xdc0437: mov rax, qword ptr [rsp + 0x1a8]
0xdc043f: mov qword ptr [r12 + rcx*8], rax
0xdc0443: inc r15d
0xdc0446: mov dword ptr [rsp + 0x98], r15d
0xdc044e: add rdx, 0xc
0xdc0452: mov qword ptr [rsp + 0xc8], rdx
0xdc045a: cmp rdx, qword ptr [rsp + 0x100]
0xdc0462: jne 0x140dc0320
0xdc0468: test r15d, r15d
0xdc046b: mov rdi, qword ptr [rsp + 0xf0]
0xdc0473: mov r14, qword ptr [rsp + 0x160]
0xdc047b: jne 0x140dc0600
0xdc0481: mov r13, qword ptr [rsp + 0x350]
0xdc0489: jmp 0x140dc01ef
0xdc048e: mov rax, qword ptr [rax + 0x88]
0xdc0495: cmp dword ptr [rax + 0x58], 1
0xdc0499: ja 0x140dc0587
0xdc049f: mov rcx, rbx
0xdc04a2: call 0x140433650
0xdc04a7: lea rcx, [rax + 0x18]
0xdc04ab: call 0x140430020
0xdc04b0: mov edx, dword ptr [rsp + 0xc0]
0xdc04b7: mov rcx, rax
0xdc04ba: call 0x141786f10
0xdc04bf: test al, al
0xdc04c1: jne 0x140dc0587
0xdc04c7: vmovss dword ptr [rsp + 0x40], xmm10
0xdc04cd: lea rax, [rsp + 0x100]
0xdc04d5: mov r9, rdi
0xdc04d8: mov r8, qword ptr [rsp + 0xe0]
0xdc04e0: mov rdx, r14
0xdc04e3: cmp byte ptr [rsp + 0x358], 0
0xdc04eb: je 0x140dc053a
0xdc04ed: vmovups xmm0, xmmword ptr [r13 + 0x878]
0xdc04f6: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc04ff: vmovss xmm0, dword ptr [r13 + 0x89c]
0xdc0508: vmovss dword ptr [rsp + 0x38], xmm0
0xdc050e: vmovss xmm1, dword ptr [r13 + 0x898]
0xdc0517: vmovss dword ptr [rsp + 0x30], xmm1
0xdc051d: mov qword ptr [rsp + 0x28], rax
0xdc0522: mov qword ptr [rsp + 0x20], rsi
0xdc0527: mov rcx, qword ptr [r13 + 0x870]
0xdc052e: call 0x143d11690
0xdc0533: xor edi, edi
0xdc0535: jmp 0x140dc07a0
0xdc053a: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc0543: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc054c: vmovss xmm0, dword ptr [r13 + 0x84c]
0xdc0555: vmovss dword ptr [rsp + 0x38], xmm0
0xdc055b: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc0564: vmovss dword ptr [rsp + 0x30], xmm1
0xdc056a: mov qword ptr [rsp + 0x28], rax
0xdc056f: mov qword ptr [rsp + 0x20], rsi
0xdc0574: mov rcx, qword ptr [r13 + 0x820]
0xdc057b: call 0x143d11690
0xdc0580: xor edi, edi
0xdc0582: jmp 0x140dc07a0
0xdc0587: vmovups xmm0, xmmword ptr [r13 + 0x8c8]
0xdc0590: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0599: vmovss dword ptr [rsp + 0x40], xmm10
0xdc059f: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdc05a8: vmovss dword ptr [rsp + 0x38], xmm0
0xdc05ae: vmovss xmm1, dword ptr [r13 + 0x8e8]
0xdc05b7: vmovss dword ptr [rsp + 0x30], xmm1
0xdc05bd: lea rax, [rsp + 0x100]
0xdc05c5: mov qword ptr [rsp + 0x28], rax
0xdc05ca: mov qword ptr [rsp + 0x20], rsi
0xdc05cf: mov r9, rdi
0xdc05d2: mov r8, qword ptr [rsp + 0xe0]
0xdc05da: mov rdx, r14
0xdc05dd: mov rcx, qword ptr [r13 + 0x8c0]
0xdc05e4: call 0x143d11690
0xdc05e9: xor edi, edi
0xdc05eb: jmp 0x140dc07a0
0xdc05f0: mov r13d, dword ptr [rsp + 0x9c]
0xdc05f8: mov r12, qword ptr [rsp + 0x90]
0xdc0600: mov rbx, qword ptr [rsp + 0x1e0]
0xdc0608: lea rdx, [rbx + 8]
0xdc060c: test rbx, rbx
0xdc060f: mov eax, 0
0xdc0614: cmove rdx, rax
0xdc0618: mov rdx, qword ptr [rdx]
0xdc061b: lea rcx, [rsp + 0x248]
0xdc0623: call 0x140393df0
0xdc0628: nop 
0xdc0629: mov qword ptr [rsp + 0x250], rbx
0xdc0631: mov edi, dword ptr [rsp + 0x68]
0xdc0635: or edi, 2
0xdc0638: mov dword ptr [rsp + 0x70], edi
0xdc063c: mov rsi, qword ptr [rsp + 0x60]
0xdc0641: mov rcx, rsi
0xdc0644: call 0x140433650
0xdc0649: lea rcx, [rax + 0x18]
0xdc064d: call 0x140430020
0xdc0652: movzx ecx, word ptr [rax + 0x12]
0xdc0656: mov rax, qword ptr [rbx + 0x68]
0xdc065a: mov rax, qword ptr [rax + 0x150]
0xdc0661: lea rcx, [rcx + rcx*2]
0xdc0665: mov rax, qword ptr [rax + 0x18]
0xdc0669: mov ebx, dword ptr [rax + rcx*8]
0xdc066c: and edi, 0xfffffffd
0xdc066f: mov dword ptr [rsp + 0x68], edi
0xdc0673: mov dword ptr [rsp + 0x70], edi
0xdc0677: mov rcx, qword ptr [rsp + 0x248]
0xdc067f: mov rax, qword ptr [rcx]
0xdc0682: mov dl, 1
0xdc0684: call qword ptr [rax + 0x20]
0xdc0687: mov rcx, rsi
0xdc068a: call 0x140433650
0xdc068f: lea rcx, [rax + 0x18]
0xdc0693: call 0x140430020
0xdc0698: lea rcx, [rax + 0x12]
0xdc069c: mov eax, 0xffff
0xdc06a1: cmp word ptr [rcx], ax
0xdc06a4: je 0x140dc06c5
0xdc06a6: call 0x140433650
0xdc06ab: cmp dword ptr [rax + 0x90], 1
0xdc06b2: jge 0x140dc06b8
0xdc06b4: xor eax, eax
0xdc06b6: jmp 0x140dc06bf
0xdc06b8: mov rax, qword ptr [rax + 0x88]
0xdc06bf: cmp dword ptr [rax + 0x58], 1
0xdc06c3: ja 0x140dc0702
0xdc06c5: mov rcx, rsi
0xdc06c8: call 0x140433650
0xdc06cd: lea rcx, [rax + 0x18]
0xdc06d1: call 0x140430020
0xdc06d6: mov edx, ebx
0xdc06d8: mov rcx, rax
0xdc06db: call 0x141786f10
0xdc06e0: test al, al
0xdc06e2: jne 0x140dc0702
0xdc06e4: lea rbx, [rsp + 0x170]
0xdc06ec: lea rax, [rsp + 0x180]
0xdc06f4: cmp byte ptr [rsp + 0x358], 0
0xdc06fc: cmove rbx, rax
0xdc0700: jmp 0x140dc070a
0xdc0702: lea rbx, [rsp + 0x190]
0xdc070a: xor edi, edi
0xdc070c: mov qword ptr [rsp + 0x80], rdi
0xdc0714: mov qword ptr [rsp + 0x88], rdi
0xdc071c: mov edx, dword ptr [rbx + 8]
0xdc071f: cmp dword ptr [rbx + 0xc], edx
0xdc0722: ja 0x140dc072c
0xdc0724: mov rcx, rbx
0xdc0727: call 0x14040eaf0
0xdc072c: mov eax, dword ptr [rbx + 8]
0xdc072f: mov edx, eax
0xdc0731: add rdx, rdx
0xdc0734: mov rcx, qword ptr [rbx]
0xdc0737: mov qword ptr [rcx + rdx*8], rdi
0xdc073b: mov qword ptr [rsp + 0x80], rdi
0xdc0743: mov qword ptr [rcx + rdx*8 + 8], rdi
0xdc0748: mov qword ptr [rsp + 0x88], rdi
0xdc0750: inc eax
0xdc0752: mov dword ptr [rbx + 8], eax
0xdc0755: mov qword ptr [rsp + 0x80], rdi
0xdc075d: mov qword ptr [rsp + 0x88], rdi
0xdc0765: mov rax, qword ptr [rcx + rdx*8]
0xdc0769: mov qword ptr [rcx + rdx*8], r12
0xdc076d: mov r12, rax
0xdc0770: mov qword ptr [rsp + 0x90], rax
0xdc0778: mov eax, dword ptr [rcx + rdx*8 + 8]
0xdc077c: mov dword ptr [rcx + rdx*8 + 8], r15d
0xdc0781: mov dword ptr [rsp + 0x98], eax
0xdc0788: mov eax, dword ptr [rcx + rdx*8 + 0xc]
0xdc078c: mov dword ptr [rcx + rdx*8 + 0xc], r13d
0xdc0791: mov dword ptr [rsp + 0x9c], eax
0xdc0798: mov r13, qword ptr [rsp + 0x350]
0xdc07a0: test r12, r12
0xdc07a3: je 0x140dc07cb
0xdc07a5: mov edx, 0x1fd
0xdc07aa: mov rax, qword ptr gs:[0x58]
0xdc07b3: mov rcx, qword ptr [rax]
0xdc07b6: cmp byte ptr [rdx + rcx], 0
0xdc07ba: mov rcx, r12
0xdc07bd: je 0x140dc07c6
0xdc07bf: call 0x1447f03bc
0xdc07c4: jmp 0x140dc07cb
0xdc07c6: call 0x1447f02bc
0xdc07cb: mov qword ptr [rsp + 0x90], rdi
0xdc07d3: mov qword ptr [rsp + 0x98], 0
0xdc07df: mov r15, qword ptr [rsp + 0x208]
0xdc07e7: mov r12, qword ptr [rsp + 0x78]
0xdc07ec: jmp 0x140dbffe8
0xdc07f1: mov rbx, qword ptr [rsp + 0x1e0]
0xdc07f9: lea rdx, [rbx + 8]
0xdc07fd: test rbx, rbx
0xdc0800: mov eax, 0
0xdc0805: cmove rdx, rax
0xdc0809: mov rdx, qword ptr [rdx]
0xdc080c: lea rcx, [rsp + 0xb0]
0xdc0814: call 0x140393df0
0xdc0819: nop 
0xdc081a: mov qword ptr [rsp + 0xb8], rbx
0xdc0822: mov eax, dword ptr [rsp + 0x68]
0xdc0826: or eax, 1
0xdc0829: mov dword ptr [rsp + 0x70], eax
0xdc082d: mov dword ptr [rsp + 0x68], eax
0xdc0831: mov rcx, qword ptr [rsp + 0x60]
0xdc0836: call 0x140433650
0xdc083b: lea rcx, [rax + 0x18]
0xdc083f: call 0x140430020
0xdc0844: movzx ecx, word ptr [rax + 0x12]
0xdc0848: mov rax, qword ptr [rbx + 0x68]
0xdc084c: mov rax, qword ptr [rax + 0x150]
0xdc0853: lea rcx, [rcx + rcx*2]
0xdc0857: mov rax, qword ptr [rax + 0x18]
0xdc085b: mov eax, dword ptr [rax + rcx*8]
0xdc085e: mov dword ptr [rsp + 0x358], eax
0xdc0865: mov eax, dword ptr [rsp + 0x68]
0xdc0869: and eax, 0xfffffffe
0xdc086c: mov dword ptr [rsp + 0x68], eax
0xdc0870: mov dword ptr [rsp + 0x70], eax
0xdc0874: mov rcx, qword ptr [rsp + 0xb0]
0xdc087c: mov rax, qword ptr [rcx]
0xdc087f: mov dl, 1
0xdc0881: call qword ptr [rax + 0x20]
0xdc0884: mov rbx, qword ptr [rsp + 0x60]
0xdc0889: mov rcx, rbx
0xdc088c: call 0x140433650
0xdc0891: lea rcx, [rax + 0x18]
0xdc0895: call 0x140430020
0xdc089a: lea rcx, [rax + 0x12]
0xdc089e: mov eax, 0xffff
0xdc08a3: cmp word ptr [rcx], ax
0xdc08a6: je 0x140dc08cb
0xdc08a8: call 0x140433650
0xdc08ad: cmp dword ptr [rax + 0x90], 1
0xdc08b4: jge 0x140dc08ba
0xdc08b6: xor eax, eax
0xdc08b8: jmp 0x140dc08c1
0xdc08ba: mov rax, qword ptr [rax + 0x88]
0xdc08c1: cmp dword ptr [rax + 0x58], 1
0xdc08c5: ja 0x140dc0956
0xdc08cb: mov rcx, rbx
0xdc08ce: call 0x140433650
0xdc08d3: lea rcx, [rax + 0x18]
0xdc08d7: call 0x140430020
0xdc08dc: mov edx, dword ptr [rsp + 0x358]
0xdc08e3: mov rcx, rax
0xdc08e6: call 0x141786f10
0xdc08eb: test al, al
0xdc08ed: jne 0x140dc0956
0xdc08ef: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc08f8: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0901: vmovss dword ptr [rsp + 0x40], xmm10
0xdc0907: vmovss xmm0, dword ptr [r13 + 0x84c]
0xdc0910: vmovss dword ptr [rsp + 0x38], xmm0
0xdc0916: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc091f: vmovss dword ptr [rsp + 0x30], xmm1
0xdc0925: lea rax, [rsp + 0x100]
0xdc092d: mov qword ptr [rsp + 0x28], rax
0xdc0932: mov qword ptr [rsp + 0x20], rsi
0xdc0937: mov r9, rdi
0xdc093a: mov r8, qword ptr [rsp + 0xe0]
0xdc0942: mov rdx, r14
0xdc0945: mov rcx, qword ptr [r13 + 0x820]
0xdc094c: call 0x143d11690
0xdc0951: jmp 0x140dbffed
0xdc0956: vmovups xmm0, xmmword ptr [r13 + 0x8c8]
0xdc095f: vmovups xmmword ptr [rsp + 0x100], xmm0
0xdc0968: vmovss dword ptr [rsp + 0x40], xmm10
0xdc096e: vmovss xmm0, dword ptr [r13 + 0x8ec]
0xdc0977: vmovss dword ptr [rsp + 0x38], xmm0
0xdc097d: vmovss xmm1, dword ptr [r13 + 0x8e8]
0xdc0986: vmovss dword ptr [rsp + 0x30], xmm1
0xdc098c: lea rax, [rsp + 0x100]
0xdc0994: mov qword ptr [rsp + 0x28], rax
0xdc0999: mov qword ptr [rsp + 0x20], rsi
0xdc099e: mov r9, rdi
0xdc09a1: mov r8, qword ptr [rsp + 0xe0]
0xdc09a9: mov rdx, r14
0xdc09ac: mov rcx, qword ptr [r13 + 0x8c0]
0xdc09b3: call 0x143d11690
0xdc09b8: jmp 0x140dbffed
0xdc09bd: nop dword ptr [rax]
0xdc09c0: mov r8d, 0x1fd
0xdc09c6: xor r15d, r15d
0xdc09c9: mov edx, r15d
0xdc09cc: mov dword ptr [rsp + 0x58], edx
0xdc09d0: mov esi, dword ptr [r14 + 8]
0xdc09d4: mov ecx, dword ptr [rsp + 0x5c]
0xdc09d8: cmp esi, ecx
0xdc09da: jbe 0x140dc0aa9
0xdc09e0: lea ecx, [rsi*8]
0xdc09e7: mov edi, r8d
0xdc09ea: mov rax, qword ptr gs:[0x58]
0xdc09f3: mov rdx, qword ptr [rax]
0xdc09f6: cmp byte ptr [rdi + rdx], r15b
0xdc09fa: mov edx, 4
0xdc09ff: je 0x140dc0a08
0xdc0a01: call 0x1447efa78
0xdc0a06: jmp 0x140dc0a0d
0xdc0a08: call 0x1447ef9b0
0xdc0a0d: mov rbx, rax
0xdc0a10: test rax, rax
0xdc0a13: jne 0x140dc0a30
0xdc0a15: call 0x141318e70
0xdc0a1a: xor r9d, r9d
0xdc0a1d: xor r8d, r8d
0xdc0a20: mov edx, 1
0xdc0a25: mov ecx, 0xa0000002
0xdc0a2a: call qword ptr [rip + 0x442a718]
0xdc0a30: mov r8d, r15d
0xdc0a33: mov edx, dword ptr [rsp + 0x58]
0xdc0a37: test edx, edx
0xdc0a39: je 0x140dc0a61
0xdc0a3b: nop dword ptr [rax + rax]
0xdc0a40: mov edx, r8d
0xdc0a43: mov rax, qword ptr [rsp + 0x50]
0xdc0a48: mov rcx, qword ptr [rax + rdx*8]
0xdc0a4c: mov qword ptr [rbx + rdx*8], rcx
0xdc0a50: inc r8d
0xdc0a53: mov edx, dword ptr [rsp + 0x58]
0xdc0a57: cmp r8d, edx
0xdc0a5a: jb 0x140dc0a40
0xdc0a5c: mov edi, 0x1fd
0xdc0a61: mov rcx, qword ptr [rsp + 0x50]
0xdc0a66: test rcx, rcx
0xdc0a69: je 0x140dc0a9c
0xdc0a6b: mov rax, qword ptr gs:[0x58]
0xdc0a74: mov rdx, qword ptr [rax]
0xdc0a77: cmp byte ptr [rdi + rdx], r15b
0xdc0a7b: je 0x140dc0a93
0xdc0a7d: call 0x1447f03bc
0xdc0a82: mov edx, dword ptr [rsp + 0x58]
0xdc0a86: mov qword ptr [rsp + 0x50], rbx
0xdc0a8b: mov ecx, esi
0xdc0a8d: mov dword ptr [rsp + 0x5c], ecx
0xdc0a91: jmp 0x140dc0aae
0xdc0a93: call 0x1447f02bc
0xdc0a98: mov edx, dword ptr [rsp + 0x58]
0xdc0a9c: mov qword ptr [rsp + 0x50], rbx
0xdc0aa1: mov ecx, esi
0xdc0aa3: mov dword ptr [rsp + 0x5c], ecx
0xdc0aa7: jmp 0x140dc0aae
0xdc0aa9: mov rbx, qword ptr [rsp + 0x50]
0xdc0aae: mov rsi, qword ptr [r14]
0xdc0ab1: mov eax, dword ptr [r14 + 8]
0xdc0ab5: lea r15, [rsi + rax*8]
0xdc0ab9: cmp rsi, r15
0xdc0abc: je 0x140dc0c25
0xdc0ac2: xor r12d, r12d
0xdc0ac5: nop word ptr [rax + rax]
0xdc0ad0: vmovss xmm0, dword ptr [rsi]
0xdc0ad4: vaddss xmm1, xmm0, dword ptr [r13 + 0x860]
0xdc0add: vmovss dword ptr [rsp + 0x358], xmm1
0xdc0ae6: vmovss xmm2, dword ptr [rsi + 4]
0xdc0aeb: vaddss xmm0, xmm2, dword ptr [r13 + 0x864]
0xdc0af4: vmovss dword ptr [rsp + 0x35c], xmm0
0xdc0afd: cmp ecx, edx
0xdc0aff: ja 0x140dc0be7
0xdc0b05: lea edi, [rcx*2 + 1]
0xdc0b0c: add edi, ecx
0xdc0b0e: shr edi, 1
0xdc0b10: cmp edi, 1
0xdc0b13: mov eax, 1
0xdc0b18: cmovb edi, eax
0xdc0b1b: cmp edx, edi
0xdc0b1d: cmova edi, edx
0xdc0b20: cmp edi, ecx
0xdc0b22: jbe 0x140dc0be7
0xdc0b28: lea ecx, [rdi*8]
0xdc0b2f: mov r14d, 0x1fd
0xdc0b35: mov rax, qword ptr gs:[0x58]
0xdc0b3e: mov rdx, qword ptr [rax]
0xdc0b41: cmp byte ptr [r14 + rdx], r12b
0xdc0b45: mov edx, 4
0xdc0b4a: je 0x140dc0b53
0xdc0b4c: call 0x1447efa78
0xdc0b51: jmp 0x140dc0b58
0xdc0b53: call 0x1447ef9b0
0xdc0b58: mov rbx, rax
0xdc0b5b: test rax, rax
0xdc0b5e: jne 0x140dc0b7b
0xdc0b60: call 0x141318e70
0xdc0b65: xor r9d, r9d
0xdc0b68: xor r8d, r8d
0xdc0b6b: mov edx, 1
0xdc0b70: mov ecx, 0xa0000002
0xdc0b75: call qword ptr [rip + 0x442a5cd]
0xdc0b7b: mov r8d, r12d
0xdc0b7e: mov edx, dword ptr [rsp + 0x58]
0xdc0b82: test edx, edx
0xdc0b84: je 0x140dc0bb2
0xdc0b86: nop word ptr [rax + rax]
0xdc0b90: mov edx, r8d
0xdc0b93: mov rax, qword ptr [rsp + 0x50]
0xdc0b98: mov rcx, qword ptr [rax + rdx*8]
0xdc0b9c: mov qword ptr [rbx + rdx*8], rcx
0xdc0ba0: inc r8d
0xdc0ba3: mov edx, dword ptr [rsp + 0x58]
0xdc0ba7: cmp r8d, edx
0xdc0baa: jb 0x140dc0b90
0xdc0bac: mov r14d, 0x1fd
0xdc0bb2: mov rcx, qword ptr [rsp + 0x50]
0xdc0bb7: test rcx, rcx
0xdc0bba: je 0x140dc0bde
0xdc0bbc: mov rax, qword ptr gs:[0x58]
0xdc0bc5: mov rdx, qword ptr [rax]
0xdc0bc8: cmp byte ptr [r14 + rdx], r12b
0xdc0bcc: je 0x140dc0bd5
0xdc0bce: call 0x1447f03bc
0xdc0bd3: jmp 0x140dc0bda
0xdc0bd5: call 0x1447f02bc
0xdc0bda: mov edx, dword ptr [rsp + 0x58]
0xdc0bde: mov qword ptr [rsp + 0x50], rbx
0xdc0be3: mov dword ptr [rsp + 0x5c], edi
0xdc0be7: mov ecx, edx
0xdc0be9: mov rax, qword ptr [rsp + 0x358]
0xdc0bf1: mov qword ptr [rbx + rcx*8], rax
0xdc0bf5: mov edx, dword ptr [rsp + 0x58]
0xdc0bf9: inc edx
0xdc0bfb: mov dword ptr [rsp + 0x58], edx
0xdc0bff: add rsi, 8
0xdc0c03: mov rbx, qword ptr [rsp + 0x50]
0xdc0c08: cmp rsi, r15
0xdc0c0b: je 0x140dc0c16
0xdc0c0d: mov ecx, dword ptr [rsp + 0x5c]
0xdc0c11: jmp 0x140dc0ad0
0xdc0c16: mov r14, qword ptr [rsp + 0x360]
0xdc0c1e: lea r12, [r13 + 0x84c]
0xdc0c25: mov rcx, qword ptr [r13 + 0x820]
0xdc0c2c: vmovdqa xmmword ptr [rsp + 0xb0], xmm7
0xdc0c35: lea eax, [rdx - 1]
0xdc0c38: lea r8, [rbx + rax*8]
0xdc0c3c: mov rax, qword ptr [rcx]
0xdc0c3f: mov byte ptr [rsp + 0x40], 0
0xdc0c44: vmovss dword ptr [rsp + 0x38], xmm10
0xdc0c4a: vmovss xmm0, dword ptr [r12]
0xdc0c50: vmovss dword ptr [rsp + 0x30], xmm0
0xdc0c56: vmovss xmm1, dword ptr [r13 + 0x848]
0xdc0c5f: vmovss dword ptr [rsp + 0x28], xmm1
0xdc0c65: lea rdx, [rsp + 0xb0]
0xdc0c6d: mov qword ptr [rsp + 0x20], rdx
0xdc0c72: lea r9, [rsp + 0x50]
0xdc0c77: mov rdx, rbx
0xdc0c7a: call qword ptr [rax + 0x398]
0xdc0c80: add r14, 0x10
0xdc0c84: mov qword ptr [rsp + 0x360], r14
0xdc0c8c: cmp r14, qword ptr [rsp + 0xa0]
0xdc0c94: jne 0x140dc09c0
0xdc0c9a: lea r9, [r13 + 0x84c]
0xdc0ca1: lea r10, [r13 + 0x848]
0xdc0ca8: lea rdi, [r13 + 0x89c]
0xdc0caf: lea rsi, [r13 + 0x898]
0xdc0cb6: mov r12, qword ptr [rsp + 0x78]
0xdc0cbb: mov ebx, dword ptr [rsp + 0x188]
0xdc0cc2: shl rbx, 4
0xdc0cc6: add rbx, r12
0xdc0cc9: cmp r12, rbx
0xdc0ccc: je 0x140dc0d59
0xdc0cd2: mov rcx, qword ptr [r13 + 0x820]
0xdc0cd9: mov rdx, qword ptr [r12]
0xdc0cdd: vmovups xmm0, xmmword ptr [r13 + 0x828]
0xdc0ce6: vmovups xmmword ptr [rsp + 0xb0], xmm0
0xdc0cef: mov eax, dword ptr [r12 + 8]
0xdc0cf4: dec eax
0xdc0cf6: lea r8, [rdx + rax*8]
0xdc0cfa: mov rax, qword ptr [rcx]
0xdc0cfd: mov byte ptr [rsp + 0x40], 0
0xdc0d02: vmovss dword ptr [rsp + 0x38], xmm10
0xdc0d08: vmovss xmm0, dword ptr [r9]
0xdc0d0d: vmovss dword ptr [rsp + 0x30], xmm0
0xdc0d13: vmovss xmm1, dword ptr [r10]
0xdc0d18: vmovss dword ptr [rsp + 0x28], xmm1
0xdc0d1e: lea r9, [rsp + 0xb0]
0xdc0d26: mov qword ptr [rsp + 0x20], r9
0xdc0d2b: mov r9, r12
0xdc0d2e: call qword ptr [rax + 0x398]
0xdc0d34: add r12, 0x10
0xdc0d38: cmp r12, rbx
0xdc0d3b: lea r9, [r13 + 0x84c]
0xdc0d42: lea r10, [r13 + 0x848]
0xdc0d49: jne 0x140dc0cd2
0xdc0d4b: lea rdi, [r13 + 0x89c]
0xdc0d52: lea rsi, [r13 + 0x898]
0xdc0d59: vmovss xmm0, dword ptr [r13 + 0x884]
0xdc0d62: mov r14, qword ptr [rsp + 0x368]
0xdc0d6a: mov qword ptr [rsp + 0x360], r14
0xdc0d72: mov eax, dword ptr [rsp + 0x178]
0xdc0d79: shl rax, 4
0xdc0d7d: add rax, r14
0xdc0d80: mov qword ptr [rsp + 0x168], rax
0xdc0d88: cmp r14, rax
0xdc0d8b: je 0x140dc13cc
0xdc0d91: vmovss dword ptr [rsp + 0x80], xmm6
0xdc0d9a: vmovss dword ptr [rsp + 0x84], xmm6
0xdc0da3: vmovss dword ptr [rsp + 0x88], xmm6
0xdc0dac: vmovss dword ptr [rsp + 0x8c], xmm0
0xdc0db5: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc0dbe: vmovdqu xmm8, xmmword ptr [rip + 0x4fb4b9a]
0xdc0dc6: mov edx, dword ptr [rsp + 0x5c]
0xdc0dca: xor r12d, r12d
0xdc0dcd: nop dword ptr [rax]
0xdc0dd0: mov ecx, r12d
0xdc0dd3: mov dword ptr [rsp + 0x58], ecx
0xdc0dd7: mov esi, dword ptr [r14 + 8]
0xdc0ddb: cmp esi, edx
0xdc0ddd: jbe 0x140dc0ea9
0xdc0de3: lea ecx, [rsi*8]
0xdc0dea: mov r15d, 0x1fd
0xdc0df0: mov edi, r15d
0xdc0df3: mov rax, qword ptr gs:[0x58]
0xdc0dfc: mov rdx, qword ptr [rax]
0xdc0dff: cmp byte ptr [r15 + rdx], 0
0xdc0e04: mov edx, 4
0xdc0e09: je 0x140dc0e12
0xdc0e0b: call 0x1447efa78
0xdc0e10: jmp 0x140dc0e17
0xdc0e12: call 0x1447ef9b0
0xdc0e17: mov rbx, rax
0xdc0e1a: test rax, rax
0xdc0e1d: jne 0x140dc0e3a
0xdc0e1f: call 0x141318e70
0xdc0e24: xor r9d, r9d
0xdc0e27: xor r8d, r8d
0xdc0e2a: mov edx, 1
0xdc0e2f: mov ecx, 0xa0000002
0xdc0e34: call qword ptr [rip + 0x442a30e]
0xdc0e3a: mov r8d, r12d
0xdc0e3d: mov ecx, dword ptr [rsp + 0x58]
0xdc0e41: test ecx, ecx
0xdc0e43: je 0x140dc0e6f
0xdc0e45: nop word ptr [rax + rax]
0xdc0e50: mov edx, r8d
0xdc0e53: mov rax, qword ptr [rsp + 0x50]
0xdc0e58: mov rcx, qword ptr [rax + rdx*8]
0xdc0e5c: mov qword ptr [rbx + rdx*8], rcx
0xdc0e60: inc r8d
0xdc0e63: mov ecx, dword ptr [rsp + 0x58]
0xdc0e67: cmp r8d, ecx
0xdc0e6a: jb 0x140dc0e50
0xdc0e6c: mov edi, r15d
0xdc0e6f: mov r8, qword ptr [rsp + 0x50]
0xdc0e74: test r8, r8
0xdc0e77: je 0x140dc0e9e
0xdc0e79: mov rax, qword ptr gs:[0x58]
0xdc0e82: mov rdx, qword ptr [rax]
0xdc0e85: mov rcx, r8
0xdc0e88: cmp byte ptr [rdi + rdx], 0
0xdc0e8c: je 0x140dc0e95
0xdc0e8e: call 0x1447f03bc
0xdc0e93: jmp 0x140dc0e9a
0xdc0e95: call 0x1447f02bc
0xdc0e9a: mov ecx, dword ptr [rsp + 0x58]
0xdc0e9e: mov qword ptr [rsp + 0x50], rbx
0xdc0ea3: mov edx, esi
0xdc0ea5: mov dword ptr [rsp + 0x5c], edx
0xdc0ea9: mov rsi, qword ptr [r14]
0xdc0eac: mov eax, dword ptr [r14 + 8]
0xdc0eb0: lea r15, [rsi + rax*8]
0xdc0eb4: cmp rsi, r15
0xdc0eb7: je 0x140dc100e
0xdc0ebd: nop dword ptr [rax]
0xdc0ec0: vmovss xmm0, dword ptr [rsi]
0xdc0ec4: vaddss xmm1, xmm0, dword ptr [r13 + 0x8b0]
0xdc0ecd: vmovss dword ptr [rsp + 0x78], xmm1
0xdc0ed3: vmovss xmm2, dword ptr [rsi + 4]
0xdc0ed8: vaddss xmm0, xmm2, dword ptr [r13 + 0x8b4]
0xdc0ee1: vmovss dword ptr [rsp + 0x7c], xmm0
0xdc0ee7: cmp edx, ecx
0xdc0ee9: ja 0x140dc0fdb
0xdc0eef: lea ebx, [rdx*2 + 1]
0xdc0ef6: add ebx, edx
0xdc0ef8: shr ebx, 1
0xdc0efa: cmp ebx, 1
0xdc0efd: mov eax, 1
0xdc0f02: cmovb ebx, eax
0xdc0f05: cmp ecx, ebx
0xdc0f07: cmova ebx, ecx
0xdc0f0a: cmp ebx, edx
0xdc0f0c: jbe 0x140dc0fdb
0xdc0f12: lea ecx, [rbx*8]
0xdc0f19: mov r14d, 0x1fd
0xdc0f1f: mov rax, qword ptr gs:[0x58]
0xdc0f28: mov rdx, qword ptr [rax]
0xdc0f2b: cmp byte ptr [r14 + rdx], 0
0xdc0f30: mov edx, 4
0xdc0f35: je 0x140dc0f3e
0xdc0f37: call 0x1447efa78
0xdc0f3c: jmp 0x140dc0f43
0xdc0f3e: call 0x1447ef9b0
0xdc0f43: mov rdi, rax
0xdc0f46: test rax, rax
0xdc0f49: jne 0x140dc0f66
0xdc0f4b: call 0x141318e70
0xdc0f50: xor r9d, r9d
0xdc0f53: xor r8d, r8d
0xdc0f56: mov edx, 1
0xdc0f5b: mov ecx, 0xa0000002
0xdc0f60: call qword ptr [rip + 0x442a1e2]
0xdc0f66: mov r8d, r12d
0xdc0f69: mov ecx, dword ptr [rsp + 0x58]
0xdc0f6d: test ecx, ecx
0xdc0f6f: je 0x140dc0fa2
0xdc0f71: nop dword ptr [rax]
0xdc0f75: nop word ptr [rax + rax]
0xdc0f80: mov edx, r8d
0xdc0f83: mov rax, qword ptr [rsp + 0x50]
0xdc0f88: mov rcx, qword ptr [rax + rdx*8]
0xdc0f8c: mov qword ptr [rdi + rdx*8], rcx
0xdc0f90: inc r8d
0xdc0f93: mov ecx, dword ptr [rsp + 0x58]
0xdc0f97: cmp r8d, ecx
0xdc0f9a: jb 0x140dc0f80
0xdc0f9c: mov r14d, 0x1fd
0xdc0fa2: mov r8, qword ptr [rsp + 0x50]
0xdc0fa7: test r8, r8
0xdc0faa: je 0x140dc0fd2
0xdc0fac: mov rax, qword ptr gs:[0x58]
0xdc0fb5: mov rdx, qword ptr [rax]
0xdc0fb8: mov rcx, r8
0xdc0fbb: cmp byte ptr [r14 + rdx], 0
0xdc0fc0: je 0x140dc0fc9
0xdc0fc2: call 0x1447f03bc
0xdc0fc7: jmp 0x140dc0fce
0xdc0fc9: call 0x1447f02bc
0xdc0fce: mov ecx, dword ptr [rsp + 0x58]
0xdc0fd2: mov qword ptr [rsp + 0x50], rdi
0xdc0fd7: mov dword ptr [rsp + 0x5c], ebx
0xdc0fdb: mov edx, ecx
0xdc0fdd: mov rcx, qword ptr [rsp + 0x78]
0xdc0fe2: mov rax, qword ptr [rsp + 0x50]
0xdc0fe7: mov qword ptr [rax + rdx*8], rcx
0xdc0feb: mov ecx, dword ptr [rsp + 0x58]
0xdc0fef: inc ecx
0xdc0ff1: mov dword ptr [rsp + 0x58], ecx
0xdc0ff5: add rsi, 8
0xdc0ff9: mov edx, dword ptr [rsp + 0x5c]
0xdc0ffd: cmp rsi, r15
0xdc1000: jne 0x140dc0ec0
0xdc1006: mov r14, qword ptr [rsp + 0x360]
0xdc100e: mov rax, qword ptr [r13 + 0x870]
0xdc1015: mov qword ptr [rsp + 0xa0], rax
0xdc101d: vmovss xmm1, dword ptr [r13 + 0x89c]
0xdc1026: vmovss xmm2, dword ptr [r13 + 0x898]
0xdc102f: cmp ecx, 2
0xdc1032: jb 0x140dc13a4
0xdc1038: vmovups xmmword ptr [rsp + 0x110], xmm8
0xdc1041: vmovaps xmm6, xmm10
0xdc1046: vmovss dword ptr [rsp + 0x120], xmm6
0xdc104f: vmovups xmm0, xmmword ptr [rip + 0x5ca4209]
0xdc1057: vmovups xmmword ptr [rsp + 0x124], xmm0
0xdc1060: mov byte ptr [rsp + 0x134], 0x1e
0xdc1068: mov rsi, r12
0xdc106b: mov qword ptr [rsp + 0x138], r12
0xdc1073: mov r14d, r12d
0xdc1076: mov dword ptr [rsp + 0x140], r12d
0xdc107e: mov edx, r12d
0xdc1081: mov dword ptr [rsp + 0x144], edx
0xdc1088: mov qword ptr [rsp + 0x148], r12
0xdc1090: mov qword ptr [rsp + 0x150], 0
0xdc109c: mov byte ptr [rsp + 0x158], 0
0xdc10a4: vmovups xmmword ptr [rsp + 0x124], xmm7
0xdc10ad: vmovss dword ptr [rsp + 0x118], xmm2
0xdc10b6: vmovss dword ptr [rsp + 0x11c], xmm1
0xdc10bf: vmovss dword ptr [rsp + 0x110], xmm10
0xdc10c8: mov byte ptr [rsp + 0x134], 0x1e
0xdc10d0: mov byte ptr [rsp + 0x158], 0
0xdc10d8: mov r11, qword ptr [rsp + 0x50]
0xdc10dd: mov rax, qword ptr [r11]
0xdc10e0: mov qword ptr [rsp + 0x358], rax
0xdc10e8: mov rbx, qword ptr [rip + 0x4784d71]
0xdc10ef: mov qword ptr [rsp + 0xe8], rbx
0xdc10f7: mov r9d, r12d
0xdc10fa: mov r10d, r12d
0xdc10fd: mov edi, r12d
0xdc1100: mov r8d, r12d
0xdc1103: lea r15d, [rcx - 1]
0xdc1107: mov qword ptr [rsp + 0xf0], r15
0xdc110f: mov r13d, 8
0xdc1115: nop word ptr [rax + rax]
0xdc1120: lea rcx, [r11 + r13]
0xdc1124: lea r11, [rsp + 0xe8]
0xdc112c: cmp r11, rcx
0xdc112f: je 0x140dc113c
0xdc1131: mov rbx, qword ptr [rcx]
0xdc1134: mov qword ptr [rsp + 0xe8], rbx
0xdc113c: lea r11, [rsp + 0xe8]
0xdc1144: cmp r11, rcx
0xdc1147: cmove r8d, edi
0xdc114b: mov qword ptr [rsp + 0xb0], rax
0xdc1153: mov qword ptr [rsp + 0xb8], rbx
0xdc115b: lea rax, [rsp + 0xe8]
0xdc1163: cmp rax, rcx
0xdc1166: cmove r10d, r9d
0xdc116a: cmp edx, r10d
0xdc116d: ja 0x140dc125d
0xdc1173: lea edi, [rdx*2 + 1]
0xdc117a: add edi, edx
0xdc117c: shr edi, 1
0xdc117e: cmp edi, 1
0xdc1181: mov eax, 1
0xdc1186: cmovb edi, eax
0xdc1189: cmp r8d, edi
0xdc118c: cmova edi, r8d
0xdc1190: cmp edi, edx
0xdc1192: jbe 0x140dc125d
0xdc1198: mov ecx, edi
0xdc119a: shl ecx, 4
0xdc119d: mov r12d, 0x1fd
0xdc11a3: mov rax, qword ptr gs:[0x58]
0xdc11ac: mov rdx, qword ptr [rax]
0xdc11af: cmp byte ptr [r12 + rdx], 0
0xdc11b4: mov edx, 4
0xdc11b9: je 0x140dc11c2
0xdc11bb: call 0x1447efa78
0xdc11c0: jmp 0x140dc11c7
0xdc11c2: call 0x1447ef9b0
0xdc11c7: mov r15, rax
0xdc11ca: test rax, rax
0xdc11cd: jne 0x140dc11ea
0xdc11cf: call 0x141318e70
0xdc11d4: xor r9d, r9d
0xdc11d7: xor r8d, r8d
0xdc11da: mov edx, 1
0xdc11df: mov ecx, 0xa0000002
0xdc11e4: call qword ptr [rip + 0x4429f5e]
0xdc11ea: test r14d, r14d
0xdc11ed: je 0x140dc121a
0xdc11ef: mov rax, rsi
0xdc11f2: mov r8, r15
0xdc11f5: sub r8, rsi
0xdc11f8: mov edx, r14d
0xdc11fb: nop dword ptr [rax + rax]
0xdc1200: vmovups xmm0, xmmword ptr [rax]
0xdc1204: vmovups xmmword ptr [rax + r8], xmm0
0xdc120a: lea rax, [rax + 0x10]
0xdc120e: sub rdx, 1
0xdc1212: jne 0x140dc1200
0xdc1214: mov r12d, 0x1fd
0xdc121a: test rsi, rsi
0xdc121d: je 0x140dc1241
0xdc121f: mov rax, qword ptr gs:[0x58]
0xdc1228: mov rdx, qword ptr [rax]
0xdc122b: mov rcx, rsi
0xdc122e: cmp byte ptr [r12 + rdx], 0
0xdc1233: je 0x140dc123c
0xdc1235: call 0x1447f03bc
0xdc123a: jmp 0x140dc1241
0xdc123c: call 0x1447f02bc
0xdc1241: mov rsi, r15
0xdc1244: mov qword ptr [rsp + 0x138], r15
0xdc124c: mov edx, edi
0xdc124e: mov dword ptr [rsp + 0x144], edx
0xdc1255: mov r15, qword ptr [rsp + 0xf0]
0xdc125d: mov eax, r14d
0xdc1260: add rax, rax
0xdc1263: vmovups xmm0, xmmword ptr [rsp + 0xb0]
0xdc126c: vmovups xmmword ptr [rsi + rax*8], xmm0
0xdc1271: inc r14d
0xdc1274: mov dword ptr [rsp + 0x140], r14d
0xdc127c: mov r9d, r14d
0xdc127f: vmovss xmm0, dword ptr [rsp + 0xec]
0xdc1288: vsubss xmm4, xmm0, dword ptr [rsp + 0x35c]
0xdc1291: vmovss xmm1, dword ptr [rsp + 0xe8]
0xdc129a: vsubss xmm2, xmm1, dword ptr [rsp + 0x358]
0xdc12a3: vmulss xmm3, xmm2, xmm2
0xdc12a7: vmulss xmm0, xmm4, xmm4
0xdc12ab: vaddss xmm1, xmm3, xmm0
0xdc12af: vaddss xmm6, xmm6, xmm1
0xdc12b3: vmovss dword ptr [rsp + 0x120], xmm6
0xdc12bc: mov rax, rbx
0xdc12bf: mov qword ptr [rsp + 0x358], rbx
0xdc12c7: mov r10d, r14d
0xdc12ca: mov edi, r14d
0xdc12cd: mov r8d, r14d
0xdc12d0: sub r15, 1
0xdc12d4: mov qword ptr [rsp + 0xf0], r15
0xdc12dc: lea r13, [r13 + 8]
0xdc12e0: je 0x140dc12ec
0xdc12e2: mov r11, qword ptr [rsp + 0x50]
0xdc12e7: jmp 0x140dc1120
0xdc12ec: mov rbx, qword ptr [rsp + 0xa0]
0xdc12f4: lea rcx, [rbx + 0x98]
0xdc12fb: lea rdx, [rsp + 0x110]
0xdc1303: call 0x143d16300
0xdc1308: mov byte ptr [rbx + 0xe0], 1
0xdc130f: mov rcx, qword ptr [rsp + 0x148]
0xdc1317: test rcx, rcx
0xdc131a: mov r13, qword ptr [rsp + 0x350]
0xdc1322: mov ebx, 0x1fd
0xdc1327: je 0x140dc1347
0xdc1329: mov rax, qword ptr gs:[0x58]
0xdc1332: mov rdx, qword ptr [rax]
0xdc1335: cmp byte ptr [rbx + rdx], 0
0xdc1339: je 0x140dc1342
0xdc133b: call 0x1447f03bc
0xdc1340: jmp 0x140dc1347
0xdc1342: call 0x1447f02bc
0xdc1347: xor r12d, r12d
0xdc134a: mov qword ptr [rsp + 0x148], r12
0xdc1352: mov qword ptr [rsp + 0x150], r12
0xdc135a: mov rcx, qword ptr [rsp + 0x138]
0xdc1362: test rcx, rcx
0xdc1365: je 0x140dc1388
0xdc1367: mov r8d, ebx
0xdc136a: mov rax, qword ptr gs:[0x58]
0xdc1373: mov rdx, qword ptr [rax]
0xdc1376: cmp byte ptr [r8 + rdx], r12b
0xdc137a: je 0x140dc1383
0xdc137c: call 0x1447f03bc
0xdc1381: jmp 0x140dc1388
0xdc1383: call 0x1447f02bc
0xdc1388: mov qword ptr [rsp + 0x138], r12
0xdc1390: mov qword ptr [rsp + 0x140], r12
0xdc1398: mov edx, dword ptr [rsp + 0x5c]
0xdc139c: mov r14, qword ptr [rsp + 0x360]
0xdc13a4: add r14, 0x10
0xdc13a8: mov qword ptr [rsp + 0x360], r14
0xdc13b0: cmp r14, qword ptr [rsp + 0x168]
0xdc13b8: jne 0x140dc0dd0
0xdc13be: lea rdi, [r13 + 0x89c]
0xdc13c5: lea rsi, [r13 + 0x898]
0xdc13cc: mov ebx, dword ptr [rsp + 0x178]
0xdc13d3: shl rbx, 4
0xdc13d7: mov r14, qword ptr [rsp + 0x368]
0xdc13df: add rbx, r14
0xdc13e2: cmp r14, rbx
0xdc13e5: je 0x140dc1432
0xdc13e7: vmovups xmm0, xmmword ptr [r13 + 0x878]
0xdc13f0: vmovups xmmword ptr [rsp + 0xb0], xmm0
0xdc13f9: mov byte ptr [rsp + 0x38], 0
0xdc13fe: vmovss dword ptr [rsp + 0x28], xmm10
0xdc1404: vmovss xmm0, dword ptr [rdi]
0xdc1408: vmovss dword ptr [rsp + 0x20], xmm0
0xdc140e: vmovss xmm3, dword ptr [rsi]
0xdc1412: lea r8, [rsp + 0xb0]
0xdc141a: mov rdx, r14
0xdc141d: mov rcx, qword ptr [r13 + 0x870]
0xdc1424: call 0x143d14990
0xdc1429: add r14, 0x10
0xdc142d: cmp r14, rbx
0xdc1430: jne 0x140dc13e7
0xdc1432: vmovss xmm0, dword ptr [rip + 0x4fb1bb2]
0xdc143a: vmovss dword ptr [rsp + 0x80], xmm0
0xdc1443: vmovss xmm1, dword ptr [rip + 0x4fb1b6d]
0xdc144b: vmovss dword ptr [rsp + 0x84], xmm1
0xdc1454: vmovss xmm0, dword ptr [rip + 0x4fb1b00]
0xdc145c: vmovss dword ptr [rsp + 0x88], xmm0
0xdc1465: vmovss xmm1, dword ptr [r13 + 0x8d4]
0xdc146e: vmovss dword ptr [rsp + 0x8c], xmm1
0xdc1477: mov ebx, dword ptr [rsp + 0x198]
0xdc147e: shl rbx, 4
0xdc1482: mov rdi, qword ptr [rsp + 0xc8]
0xdc148a: add rbx, rdi
0xdc148d: cmp rdi, rbx
0xdc1490: je 0x140dc14ef
0xdc1492: vmovups xmm7, xmmword ptr [rsp + 0x80]
0xdc149b: vmovss xmm6, dword ptr [rip + 0x4fb1ea5]
0xdc14a3: vmovdqa xmmword ptr [rsp + 0xb0], xmm7
0xdc14ac: vmulss xmm2, xmm6, dword ptr [r13 + 0x8ec]
0xdc14b5: vmulss xmm3, xmm6, dword ptr [r13 + 0x8e8]
0xdc14be: mov byte ptr [rsp + 0x38], 0
0xdc14c3: vmovss dword ptr [rsp + 0x28], xmm10
0xdc14c9: vmovss dword ptr [rsp + 0x20], xmm2
0xdc14cf: lea r8, [rsp + 0xb0]
0xdc14d7: mov rdx, rdi
0xdc14da: mov rcx, qword ptr [r13 + 0x8c0]
0xdc14e1: call 0x143d14990
0xdc14e6: add rdi, 0x10
0xdc14ea: cmp rdi, rbx
0xdc14ed: jne 0x140dc14a3
0xdc14ef: mov rdi, qword ptr [r13 + 0x488]
0xdc14f6: mov eax, dword ptr [r13 + 0x490]
0xdc14fd: lea rcx, [rax + rax*2]
0xdc1501: lea r14, [rdi + rcx*8]
0xdc1505: cmp rdi, r14
0xdc1508: je 0x140dc16de
0xdc150e: nop 
0xdc1510: mov rbx, qword ptr [rdi + 8]
0xdc1514: mov eax, dword ptr [rdi + 0x10]
0xdc1517: lea rsi, [rbx + rax*8]
0xdc151b: cmp rbx, rsi
0xdc151e: je 0x140dc16d1
0xdc1524: nop dword ptr [rax]
0xdc1528: nop dword ptr [rax + rax]
0xdc1530: mov rcx, qword ptr [rbx]
0xdc1533: mov rax, qword ptr [rdi]
0xdc1536: vmovss xmm0, dword ptr [rax + 0xe8]
0xdc153e: vxorps xmm6, xmm0, xmm12
0xdc1543: vmovss xmm5, dword ptr [rax + 0xe0]
0xdc154b: vmovss dword ptr [rsp + 0x78], xmm5
0xdc1551: vmovss dword ptr [rsp + 0x7c], xmm6
0xdc1557: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdc155f: vxorps xmm4, xmm0, xmm12
0xdc1564: vmovss xmm1, dword ptr [rcx + 0xe0]
0xdc156c: vmovss dword ptr [rsp + 0x368], xmm1
0xdc1575: vmovss dword ptr [rsp + 0x36c], xmm4
0xdc157e: mov rax, qword ptr [r13 + 0x860]
0xdc1585: mov qword ptr [rsp + 0x350], rax
0xdc158d: vmovss xmm3, dword ptr [rsp + 0x350]
0xdc1596: vaddss xmm0, xmm1, xmm3
0xdc159a: vmovss dword ptr [rsp + 0x358], xmm0
0xdc15a3: vmovss xmm2, dword ptr [rsp + 0x354]
0xdc15ac: vaddss xmm1, xmm4, xmm2
0xdc15b0: vmovss dword ptr [rsp + 0x35c], xmm1
0xdc15b9: mov rax, qword ptr [rsp + 0x358]
0xdc15c1: mov qword ptr [rsp + 0x350], rax
0xdc15c9: vaddss xmm0, xmm5, xmm3
0xdc15cd: vmovss dword ptr [rsp + 0x360], xmm0
0xdc15d6: vaddss xmm1, xmm6, xmm2
0xdc15da: vmovss dword ptr [rsp + 0x364], xmm1
0xdc15e3: mov rax, qword ptr [rsp + 0x360]
0xdc15eb: mov qword ptr [rsp + 0xa0], rax
0xdc15f3: vmulss xmm2, xmm9, dword ptr [r13 + 0x938]
0xdc15fc: vmovups xmm1, xmmword ptr [r13 + 0x918]
0xdc1605: vmovups xmmword ptr [rsp + 0xb0], xmm1
0xdc160e: vmovss xmm0, dword ptr [r13 + 0x93c]
0xdc1617: vmovss dword ptr [rsp + 0x30], xmm0
0xdc161d: vmovss dword ptr [rsp + 0x28], xmm2
0xdc1623: vmovss dword ptr [rsp + 0x20], xmm2
0xdc1629: lea r9, [rsp + 0xb0]
0xdc1631: lea r8, [rsp + 0x350]
0xdc1639: lea rdx, [rsp + 0xa0]
0xdc1641: mov rcx, qword ptr [r13 + 0x910]
0xdc1648: call 0x143d11410
0xdc164d: mov rax, qword ptr [rsp + 0x368]
0xdc1655: mov qword ptr [rsp + 0x350], rax
0xdc165d: mov rax, qword ptr [rsp + 0x78]
0xdc1662: mov qword ptr [rsp + 0xa0], rax
0xdc166a: vmulss xmm2, xmm9, dword ptr [r13 + 0x938]
0xdc1673: vmovups xmm1, xmmword ptr [r13 + 0x918]
0xdc167c: vmovups xmmword ptr [rsp + 0xb0], xmm1
0xdc1685: vmovss xmm0, dword ptr [r13 + 0x93c]
0xdc168e: vmovss dword ptr [rsp + 0x30], xmm0
0xdc1694: vmovss dword ptr [rsp + 0x28], xmm2
0xdc169a: vmovss dword ptr [rsp + 0x20], xmm2
0xdc16a0: lea r9, [rsp + 0xb0]
0xdc16a8: lea r8, [rsp + 0x350]
0xdc16b0: lea rdx, [rsp + 0xa0]
0xdc16b8: mov rcx, qword ptr [r13 + 0x910]
0xdc16bf: call 0x143d11410
0xdc16c4: add rbx, 8
0xdc16c8: cmp rbx, rsi
0xdc16cb: jne 0x140dc1530
0xdc16d1: add rdi, 0x18
0xdc16d5: cmp rdi, r14
0xdc16d8: jne 0x140dc1510
0xdc16de: mov rcx, qword ptr [rsp + 0x50]
0xdc16e3: test rcx, rcx
0xdc16e6: je 0x140dc170d
0xdc16e8: mov r8d, 0x1fd
0xdc16ee: mov rax, qword ptr gs:[0x58]
0xdc16f7: mov rdx, qword ptr [rax]
0xdc16fa: cmp byte ptr [r8 + rdx], 0
0xdc16ff: je 0x140dc1708
0xdc1701: call 0x1447f03bc
0xdc1706: jmp 0x140dc170d
0xdc1708: call 0x1447f02bc
0xdc170d: xor eax, eax
0xdc170f: mov qword ptr [rsp + 0x50], rax
0xdc1714: mov qword ptr [rsp + 0x58], rax
0xdc1719: lea rcx, [rsp + 0x190]
0xdc1721: call 0x14040c5c0
0xdc1726: nop 
0xdc1727: lea rcx, [rsp + 0x170]
0xdc172f: call 0x14040c5c0
0xdc1734: nop 
0xdc1735: lea rcx, [rsp + 0x180]
0xdc173d: call 0x14040c5c0
0xdc1742: nop 
0xdc1743: lea rax, [rip + 0x49646fe]
0xdc174a: mov qword ptr [rsp + 0x1d8], rax
0xdc1752: lea rcx, [rsp + 0x1d8]
0xdc175a: call 0x141434880
0xdc175f: lea r11, [rsp + 0x310]
0xdc1767: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdc176d: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdc1773: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xdc1779: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xdc177f: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xdc1785: vmovaps xmm11, xmmword ptr [r11 - 0x60]
0xdc178b: vmovaps xmm12, xmmword ptr [r11 - 0x70]
0xdc1791: vmovaps xmm13, xmmword ptr [r11 - 0x80]
0xdc1797: vmovaps xmm14, xmmword ptr [r11 - 0x90]
0xdc17a0: vmovaps xmm15, xmmword ptr [r11 - 0xa0]
0xdc17a9: mov rsp, r11
0xdc17ac: pop r15
0xdc17ae: pop r14
0xdc17b0: pop r13
0xdc17b2: pop r12
0xdc17b4: pop rdi
0xdc17b5: pop rsi
0xdc17b6: pop rbx
0xdc17b7: ret 