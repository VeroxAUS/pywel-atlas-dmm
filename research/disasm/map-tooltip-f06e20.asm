; map-tooltip 0xf06e20: KnowledgeInfo component setup (element binding)
; Static disassembly of CrimsonDesert.exe (timestamp 1790086912), read-only.
; Comments after ; give the string, or the interned UI name, stored at a RIP-relative target.
0xf06e20: mov qword ptr [rsp + 0x10], rbx
0xf06e25: mov qword ptr [rsp + 0x18], rsi
0xf06e2a: push rbp
0xf06e2b: push rdi
0xf06e2c: push r14
0xf06e2e: mov rbp, rsp
0xf06e31: sub rsp, 0x40
0xf06e35: mov rsi, rdx
0xf06e38: mov rdi, rcx
0xf06e3b: or byte ptr [rcx + 0x22], 0x20
0xf06e3f: lea r8, [rcx + 0xd0]
0xf06e46: lea r9, [rip + 0x5dcc10b]    ; 0x6cd2f58 name 'selector-knowledge-info-texture'
0xf06e4d: lea rdx, [rbp + 0x20]
0xf06e51: call 0xf7b7d0
0xf06e56: lea r8, [rdi + 0xe0]
0xf06e5d: lea r9, [rip + 0x5dcc0f8]    ; 0x6cd2f5c name 'selector-knowledge-info-sub-texture'
0xf06e64: lea rdx, [rbp + 0x20]
0xf06e68: mov rcx, rdi
0xf06e6b: call 0xd03fc0
0xf06e70: lea r8, [rdi + 0xe8]
0xf06e77: lea r14, [rip + 0x466c62e]    ; 0x55734ac
0xf06e7e: mov qword ptr [rsp + 0x20], r14
0xf06e83: lea r9, [rip + 0x5dcc0d6]    ; 0x6cd2f60 name 'selector-knowledge-info-image-wrap'
0xf06e8a: lea rdx, [rbp + 0x20]
0xf06e8e: mov rcx, rdi
0xf06e91: call 0xcb7a70
0xf06e96: lea r8, [rdi + 0xf8]
0xf06e9d: mov qword ptr [rsp + 0x20], r14
0xf06ea2: lea r9, [rip + 0x5dcc0bb]    ; 0x6cd2f64 name 'selector-knowledge-info-category-title'
0xf06ea9: lea rdx, [rbp + 0x20]
0xf06ead: mov rcx, rdi
0xf06eb0: call 0xcb7a70
0xf06eb5: lea r8, [rdi + 0x100]
0xf06ebc: mov qword ptr [rsp + 0x20], r14
0xf06ec1: lea r9, [rip + 0x5dcc0a0]    ; 0x6cd2f68 name 'selector-skillinfo-enforce-text'
0xf06ec8: lea rdx, [rbp + 0x20]
0xf06ecc: mov rcx, rdi
0xf06ecf: call 0xcb7a70
0xf06ed4: lea r8, [rdi + 0x108]
0xf06edb: mov qword ptr [rsp + 0x20], r14
0xf06ee0: lea r9, [rip + 0x5dcc0a1]    ; 0x6cd2f88 name 'selector-knowledge-use-resource-wrap'
0xf06ee7: lea rdx, [rbp + 0x20]
0xf06eeb: mov rcx, rdi
0xf06eee: call 0xcb7a70
0xf06ef3: lea r8, [rdi + 0x110]
0xf06efa: mov qword ptr [rsp + 0x20], r14
0xf06eff: lea r9, [rip + 0x5dcc086]    ; 0x6cd2f8c name 'selector-knowledge-condition-text'
0xf06f06: lea rdx, [rbp + 0x20]
0xf06f0a: mov rcx, rdi
0xf06f0d: call 0xcb7a70
0xf06f12: mov qword ptr [rsp + 0x20], r14
0xf06f17: lea r9, [rip + 0x5dcc062]    ; 0x6cd2f80 name 'selector-knowledge-level-wrap'
0xf06f1e: lea r8, [rdi + 0x128]
0xf06f25: lea rdx, [rbp + 0x20]
0xf06f29: mov rcx, rdi
0xf06f2c: call 0xcb7a70
0xf06f31: cmp qword ptr [rdi + 0x128], 0
0xf06f39: je 0xf06f7f
0xf06f3b: lea r8, [rdi + 0x130]
0xf06f42: mov qword ptr [rsp + 0x20], r14
0xf06f47: lea r9, [rip + 0x5dcc036]    ; 0x6cd2f84 name 'selector-knowledge-level-text'
0xf06f4e: lea rdx, [rbp + 0x20]
0xf06f52: mov rcx, rdi
0xf06f55: call 0xcb7a70
0xf06f5a: mov eax, dword ptr [rbp + 0x20]
0xf06f5d: test eax, eax
0xf06f5f: jne 0xf07780
0xf06f65: lea r8, [rdi + 0x1e0]
0xf06f6c: lea r9, [rip + 0x5dcc041]    ; 0x6cd2fb4 name 'selector-knowledge-level-gauge'
0xf06f73: lea rdx, [rbp + 0x20]
0xf06f77: mov rcx, rdi
0xf06f7a: call 0xf7ba20
0xf06f7f: mov qword ptr [rsp + 0x20], r14
0xf06f84: lea r9, [rip + 0x5dcc005]    ; 0x6cd2f90 name 'selector-sublevel-level-wrap'
0xf06f8b: lea r8, [rdi + 0x138]
0xf06f92: lea rdx, [rbp + 0x20]
0xf06f96: mov rcx, rdi
0xf06f99: call 0xcb7a70
0xf06f9e: cmp qword ptr [rdi + 0x138], 0
0xf06fa6: je 0xf07026
0xf06fa8: lea r8, [rdi + 0x140]
0xf06faf: mov qword ptr [rsp + 0x20], r14
0xf06fb4: lea r9, [rip + 0x5dcbfdd]    ; 0x6cd2f98 name 'selector-sublevel-level-text'
0xf06fbb: lea rdx, [rbp + 0x20]
0xf06fbf: mov rcx, rdi
0xf06fc2: call 0xcb7a70
0xf06fc7: mov eax, dword ptr [rbp + 0x20]
0xf06fca: test eax, eax
0xf06fcc: jne 0xf07780
0xf06fd2: lea r8, [rdi + 0x148]
0xf06fd9: mov qword ptr [rsp + 0x20], r14
0xf06fde: lea r9, [rip + 0x5dcbfb7]    ; 0x6cd2f9c name 'selector-sublevel-current-level-desc'
0xf06fe5: lea rdx, [rbp + 0x20]
0xf06fe9: mov rcx, rdi
0xf06fec: call 0xcb7a70
0xf06ff1: mov eax, dword ptr [rbp + 0x20]
0xf06ff4: test eax, eax
0xf06ff6: jne 0xf07780
0xf06ffc: lea r8, [rdi + 0x150]
0xf07003: mov qword ptr [rsp + 0x20], r14
0xf07008: lea r9, [rip + 0x5dcbf91]    ; 0x6cd2fa0 name 'selector-sublevel-next-level-desc'
0xf0700f: lea rdx, [rbp + 0x20]
0xf07013: mov rcx, rdi
0xf07016: call 0xcb7a70
0xf0701b: mov eax, dword ptr [rbp + 0x20]
0xf0701e: test eax, eax
0xf07020: jne 0xf07780
0xf07026: lea r8, [rdi + 0x158]
0xf0702d: mov qword ptr [rsp + 0x20], r14
0xf07032: lea r9, [rip + 0x5dcbf5b]    ; 0x6cd2f94 name 'selector-knowledge-stage-condition-text'
0xf07039: lea rdx, [rbp + 0x20]
0xf0703d: mov rcx, rdi
0xf07040: call 0xcb7a70
0xf07045: lea r9, [rip + 0x5dcbf8c]    ; 0x6cd2fd8 name 'selector-skill-tooltip-keyguide-group'
0xf0704c: lea r8, [rdi + 0x328]
0xf07053: lea rdx, [rbp + 0x20]
0xf07057: mov rcx, rdi
0xf0705a: call 0xd0db30
0xf0705f: cmp qword ptr [rdi + 0x328], 0
0xf07067: je 0xf070f5
0xf0706d: lea r8, [rdi + 0x338]
0xf07074: mov byte ptr [rsp + 0x30], 1
0xf07079: mov qword ptr [rsp + 0x20], r14
0xf0707e: lea r9, [rip + 0x5dcbf57]    ; 0x6cd2fdc name 'selector-prev-tooltip-keyguide'
0xf07085: lea rdx, [rbp + 0x20]
0xf07089: mov rcx, rdi
0xf0708c: call 0xd04360
0xf07091: mov eax, dword ptr [rbp + 0x20]
0xf07094: test eax, eax
0xf07096: jne 0xf07780
0xf0709c: lea r8, [rdi + 0x340]
0xf070a3: mov byte ptr [rsp + 0x30], 1
0xf070a8: mov qword ptr [rsp + 0x20], r14
0xf070ad: lea r9, [rip + 0x5dcbf2c]    ; 0x6cd2fe0 name 'selector-next-tooltip-keyguide'
0xf070b4: lea rdx, [rbp + 0x20]
0xf070b8: mov rcx, rdi
0xf070bb: call 0xd04360
0xf070c0: mov eax, dword ptr [rbp + 0x20]
0xf070c3: test eax, eax
0xf070c5: jne 0xf07780
0xf070cb: lea r8, [rdi + 0x348]
0xf070d2: mov qword ptr [rsp + 0x20], r14
0xf070d7: lea r9, [rip + 0x5dcbf06]    ; 0x6cd2fe4
0xf070de: lea rdx, [rbp + 0x20]
0xf070e2: mov rcx, rdi
0xf070e5: call 0xcb7a70
0xf070ea: mov eax, dword ptr [rbp + 0x20]
0xf070ed: test eax, eax
0xf070ef: jne 0xf07780
0xf070f5: lea rdx, [rip + 0x47bb5d4]    ; 0x56c26d0 'KnowledgeInfoTitle'
0xf070fc: mov rcx, qword ptr [rdi + 8]
0xf07100: call 0x3ed64e0
0xf07105: mov qword ptr [rdi + 0xf0], rax
0xf0710c: test rax, rax
0xf0710f: je 0xf0777a
0xf07115: lea rdx, [rip + 0x47bb5cc]    ; 0x56c26e8 'KnowledgeInfoDiscriptionText'
0xf0711c: mov rcx, qword ptr [rdi + 8]
0xf07120: call 0x3ed64e0
0xf07125: mov qword ptr [rdi + 0x118], rax
0xf0712c: test rax, rax
0xf0712f: je 0xf0777a
0xf07135: lea rdx, [rip + 0x47bb64c]    ; 0x56c2788 'KnowledgeInfoDiscriptionTextWrap'
0xf0713c: mov rcx, qword ptr [rdi + 8]
0xf07140: call 0x3ed64e0
0xf07145: mov qword ptr [rdi + 0x120], rax
0xf0714c: mov rax, qword ptr [rdi]
0xf0714f: mov rcx, rdi
0xf07152: call qword ptr [rax + 0x110]
0xf07158: mov r10, qword ptr [rax + 0x31200]
0xf0715f: mov rcx, qword ptr [rdi + 8]
0xf07163: mov rax, qword ptr [rcx + 0xa0]
0xf0716a: test rax, rax
0xf0716d: je 0xf0717a
0xf0716f: cmp qword ptr [rax + 8], 0
0xf07174: je 0xf0717a
0xf07176: xor eax, eax
0xf07178: jmp 0xf07187
0xf0717a: mov rax, qword ptr [rcx + 0x20]
0xf0717e: test rax, rax
0xf07181: je 0xf07187
0xf07183: mov rax, qword ptr [rax + 0x28]
0xf07187: mov qword ptr [rsp + 0x20], rax
0xf0718c: lea r9, [rip + 0x47bb61d]    ; 0x56c27b0 'PostKnowledgeInfo'
0xf07193: lea r8, [rip + 0x476183e]    ; 0x56689d8 'KnowledgePanel2'
0xf0719a: lea rdx, [rbp + 0x20]
0xf0719e: mov rcx, r10
0xf071a1: call 0x3d2ce00
0xf071a6: nop 
0xf071a7: mov rcx, qword ptr [rbp + 0x20]
0xf071ab: test rcx, rcx
0xf071ae: je 0xf07767
0xf071b4: lea rdx, [rip + 0x47bb58d]    ; 0x56c2748 'PreKnowledgeLevelText'
0xf071bb: call 0x3ed64e0
0xf071c0: test rax, rax
0xf071c3: je 0xf07767
0xf071c9: lea rdx, [rip + 0x47bb590]    ; 0x56c2760 'PostKnowledgeInfoDiscriptionText'
0xf071d0: mov rcx, qword ptr [rbp + 0x20]
0xf071d4: call 0x3ed64e0
0xf071d9: test rax, rax
0xf071dc: je 0xf07767
0xf071e2: lea rcx, [rbp + 0x20]
0xf071e6: call 0x38ad90
0xf071eb: mov rax, qword ptr [rdi]
0xf071ee: mov rcx, rdi
0xf071f1: call qword ptr [rax + 0x110]
0xf071f7: mov r10, qword ptr [rax + 0x31200]
0xf071fe: mov rcx, qword ptr [rdi + 8]
0xf07202: mov rax, qword ptr [rcx + 0xa0]
0xf07209: test rax, rax
0xf0720c: je 0xf07219
0xf0720e: cmp qword ptr [rax + 8], 0
0xf07213: je 0xf07219
0xf07215: xor eax, eax
0xf07217: jmp 0xf07226
0xf07219: mov rax, qword ptr [rcx + 0x20]
0xf0721d: test rax, rax
0xf07220: je 0xf07226
0xf07222: mov rax, qword ptr [rax + 0x28]
0xf07226: mov qword ptr [rsp + 0x20], rax
0xf0722b: lea r9, [rip + 0x47bb3d6]    ; 0x56c2608 'SkillTreeAddInfoDivider'
0xf07232: lea r8, [rip + 0x46b7177]    ; 0x55be3b0 'SkillTreePanel'
0xf07239: lea rdx, [rbp + 0x20]
0xf0723d: mov rcx, r10
0xf07240: call 0x3d2ce00
0xf07245: nop 
0xf07246: mov rcx, qword ptr [rbp + 0x20]
0xf0724a: test rcx, rcx
0xf0724d: je 0xf07754
0xf07253: lea rdx, [rip + 0x47bb3c6]    ; 0x56c2620 'AddInfoDividerText'
0xf0725a: call 0x3ed64e0
0xf0725f: test rax, rax
0xf07262: je 0xf07754
0xf07268: lea rcx, [rbp + 0x20]
0xf0726c: call 0x38ad90
0xf07271: mov rax, qword ptr [rdi]
0xf07274: mov rcx, rdi
0xf07277: call qword ptr [rax + 0x110]
0xf0727d: mov r10, qword ptr [rax + 0x31200]
0xf07284: mov rcx, qword ptr [rdi + 8]
0xf07288: mov rax, qword ptr [rcx + 0xa0]
0xf0728f: test rax, rax
0xf07292: je 0xf0729f
0xf07294: cmp qword ptr [rax + 8], 0
0xf07299: je 0xf0729f
0xf0729b: xor eax, eax
0xf0729d: jmp 0xf072ac
0xf0729f: mov rax, qword ptr [rcx + 0x20]
0xf072a3: test rax, rax
0xf072a6: je 0xf072ac
0xf072a8: mov rax, qword ptr [rax + 0x28]
0xf072ac: mov qword ptr [rsp + 0x20], rax
0xf072b1: lea r9, [rip + 0x47bb318]    ; 0x56c25d0 'SkillAddInfoItemContainer'
0xf072b8: lea r8, [rip + 0x46b70f1]    ; 0x55be3b0 'SkillTreePanel'
0xf072bf: lea rdx, [rbp + 0x20]
0xf072c3: mov rcx, r10
0xf072c6: call 0x3d2ce00
0xf072cb: nop 
0xf072cc: mov rcx, qword ptr [rbp + 0x20]
0xf072d0: test rcx, rcx
0xf072d3: je 0xf07741
0xf072d9: lea rdx, [rip + 0x47bb310]    ; 0x56c25f0 'SkillAddInfoItemWrap'
0xf072e0: call 0x3ed64e0
0xf072e5: test rax, rax
0xf072e8: je 0xf07741
0xf072ee: lea rcx, [rbp + 0x20]
0xf072f2: call 0x38ad90
0xf072f7: mov rax, qword ptr [rdi]
0xf072fa: mov rcx, rdi
0xf072fd: call qword ptr [rax + 0x110]
0xf07303: mov r10, qword ptr [rax + 0x31200]
0xf0730a: mov rcx, qword ptr [rdi + 8]
0xf0730e: mov rax, qword ptr [rcx + 0xa0]
0xf07315: test rax, rax
0xf07318: je 0xf07325
0xf0731a: cmp qword ptr [rax + 8], 0
0xf0731f: je 0xf07325
0xf07321: xor eax, eax
0xf07323: jmp 0xf07332
0xf07325: mov rax, qword ptr [rcx + 0x20]
0xf07329: test rax, rax
0xf0732c: je 0xf07332
0xf0732e: mov rax, qword ptr [rax + 0x28]
0xf07332: mov qword ptr [rsp + 0x20], rax
0xf07337: lea r9, [rip + 0x47bb35a]    ; 0x56c2698 'SkillResourceStatusItem'
0xf0733e: lea r8, [rip + 0x46b706b]    ; 0x55be3b0 'SkillTreePanel'
0xf07345: lea rdx, [rbp + 0x20]
0xf07349: mov rcx, r10
0xf0734c: call 0x3d2ce00
0xf07351: nop 
0xf07352: cmp qword ptr [rbp + 0x20], 0
0xf07357: jne 0xf0736f
0xf07359: mov eax, dword ptr [rip + 0x5dd47d1]    ; 0x6cdbb30
0xf0735f: mov dword ptr [rsi], eax
0xf07361: lea rcx, [rbp + 0x20]
0xf07365: call 0x38ad90
0xf0736a: jmp 0xf07782
0xf0736f: lea rcx, [rbp + 0x20]
0xf07373: call 0x38ad90
0xf07378: mov rax, qword ptr [rdi + 8]
0xf0737c: mov rbx, qword ptr [rax + 0xa0]
0xf07383: test rbx, rbx
0xf07386: je 0xf07394
0xf07388: cmp qword ptr [rbx + 8], 0
0xf0738d: je 0xf07394
0xf0738f: mov rcx, r14
0xf07392: jmp 0xf073ea
0xf07394: mov rcx, qword ptr [rax + 0xe0]
0xf0739b: test rcx, rcx
0xf0739e: je 0xf073b9
0xf073a0: lea rdx, [rip + 0x5dcbb51]    ; 0x6cd2ef8 name 'desc-text-align-right'
0xf073a7: call 0x4743a0
0xf073ac: test rax, rax
0xf073af: je 0xf073b9
0xf073b1: mov rax, qword ptr [rax]
0xf073b4: mov rcx, qword ptr [rax]
0xf073b7: jmp 0xf073ea
0xf073b9: test rbx, rbx
0xf073bc: je 0xf073e3
0xf073be: mov rcx, qword ptr [rbx + 0x68]
0xf073c2: test rcx, rcx
0xf073c5: je 0xf073e3
0xf073c7: lea rdx, [rip + 0x5dcbb2a]    ; 0x6cd2ef8 name 'desc-text-align-right'
0xf073ce: call 0x4743a0
0xf073d3: test rax, rax
0xf073d6: je 0xf073e3
0xf073d8: mov rax, qword ptr [rax]
0xf073db: mov rcx, qword ptr [rax]
0xf073de: test rcx, rcx
0xf073e1: jne 0xf073ea
0xf073e3: lea rcx, [rip + 0x467fd1e]    ; 0x5587108 'false'
0xf073ea: lea rdx, [rdi + 0x1b8]
0xf073f1: call 0x1423cd0
0xf073f6: lea rdx, [rip + 0x47bb2b3]    ; 0x56c26b0 'KnowledgeInfoDescriptionWrap'
0xf073fd: mov rcx, qword ptr [rdi + 8]
0xf07401: call 0x3ed64e0
0xf07406: test rax, rax
0xf07409: je 0xf0742a
0xf0740b: mov rcx, rax
0xf0740e: call 0x3e7feb0
0xf07413: mov qword ptr [rdi + 0x198], rax
0xf0741a: test rax, rax
0xf0741d: jne 0xf0742a
0xf0741f: mov eax, dword ptr [rip + 0x5dd470f]    ; 0x6cdbb34
0xf07425: jmp 0xf07780
0xf0742a: mov qword ptr [rsp + 0x20], r14
0xf0742f: lea r9, [rip + 0x5dcbb76]    ; 0x6cd2fac name 'selector-knowledge-record-wrap'
0xf07436: lea r8, [rdi + 0x1c0]
0xf0743d: lea rdx, [rbp + 0x20]
0xf07441: mov rcx, rdi
0xf07444: call 0xcb7a70
0xf07449: cmp qword ptr [rdi + 0x1c0], 0
0xf07451: je 0xf0747d
0xf07453: lea r8, [rdi + 0x1c8]
0xf0745a: mov qword ptr [rsp + 0x20], r14
0xf0745f: lea r9, [rip + 0x5dcbb4a]    ; 0x6cd2fb0 name 'selector-knowledge-record-text'
0xf07466: lea rdx, [rbp + 0x20]
0xf0746a: mov rcx, rdi
0xf0746d: call 0xcb7a70
0xf07472: mov eax, dword ptr [rbp + 0x20]
0xf07475: test eax, eax
0xf07477: jne 0xf07780
0xf0747d: lea r8, [rdi + 0x1d0]
0xf07484: mov qword ptr [rsp + 0x20], r14
0xf07489: lea r9, [rip + 0x5dcbb14]    ; 0x6cd2fa4 name 'selector-sublevel-active-condition-text'
0xf07490: lea rdx, [rbp + 0x20]
0xf07494: mov rcx, rdi
0xf07497: call 0xcb7a70
0xf0749c: lea r8, [rdi + 0x1d8]
0xf074a3: mov qword ptr [rsp + 0x20], r14
0xf074a8: lea r9, [rip + 0x5dcbaf9]    ; 0x6cd2fa8 name 'selector-sublevel-active-condition-detail-wrap'
0xf074af: lea rdx, [rbp + 0x20]
0xf074b3: mov rcx, rdi
0xf074b6: call 0xcb7a70
0xf074bb: lea r8, [rdi + 0x1e8]
0xf074c2: mov qword ptr [rsp + 0x20], r14
0xf074c7: lea r9, [rip + 0x5dcbaea]    ; 0x6cd2fb8 name 'selector-unlearned-element-list'
0xf074ce: lea rdx, [rbp + 0x20]
0xf074d2: mov rcx, rdi
0xf074d5: call 0xcb7860
0xf074da: mov qword ptr [rsp + 0x20], r14
0xf074df: lea r9, [rip + 0x5dcbad6]    ; 0x6cd2fbc name 'selector-knowledge-multichange-wrap'
0xf074e6: lea r8, [rdi + 0x300]
0xf074ed: lea rdx, [rbp + 0x20]
0xf074f1: mov rcx, rdi
0xf074f4: call 0xcb7a70
0xf074f9: cmp qword ptr [rdi + 0x300], 0
0xf07501: je 0xf0752d
0xf07503: lea r8, [rdi + 0x308]
0xf0750a: mov byte ptr [rsp + 0x30], 1
0xf0750f: lea r9, [rip + 0x5dcbaaa]    ; 0x6cd2fc0 name 'selector-need-stuff-list'
0xf07516: lea rdx, [rbp + 0x20]
0xf0751a: mov rcx, rdi
0xf0751d: call 0xd03de0
0xf07522: mov eax, dword ptr [rbp + 0x20]
0xf07525: test eax, eax
0xf07527: jne 0xf07780
0xf0752d: lea r8, [rdi + 0x318]
0xf07534: mov qword ptr [rsp + 0x20], r14
0xf07539: lea r9, [rip + 0x5dcba90]    ; 0x6cd2fd0 name 'selector-skill-text-wrap'
0xf07540: lea rdx, [rbp + 0x20]
0xf07544: mov rcx, rdi
0xf07547: call 0xcb7a70
0xf0754c: lea r8, [rdi + 0x320]
0xf07553: lea r9, [rip + 0x5dcba7a]    ; 0x6cd2fd4 name 'selector-skill-media-wrap'
0xf0755a: lea rdx, [rbp + 0x20]
0xf0755e: mov rcx, rdi
0xf07561: call 0xebcbe0
0xf07566: lea r8, [rdi + 0x1f8]
0xf0756d: lea r9, [rip + 0x5dcba74]    ; 0x6cd2fe8 name 'selector-skill-item-tooltip'
0xf07574: lea rdx, [rbp + 0x20]
0xf07578: mov rcx, rdi
0xf0757b: call 0xd0d120
0xf07580: lea r8, [rdi + 0x368]
0xf07587: mov qword ptr [rsp + 0x20], r14
0xf0758c: lea r9, [rip + 0x5dcba59]    ; 0x6cd2fec name 'selector-skill-addinfo-wrap'
0xf07593: lea rdx, [rbp + 0x20]
0xf07597: mov rcx, rdi
0xf0759a: call 0xcb7a70
0xf0759f: lea r8, [rdi + 0x370]
0xf075a6: mov qword ptr [rsp + 0x20], r14
0xf075ab: lea r9, [rip + 0x5dcba3e]    ; 0x6cd2ff0 name 'selector-skill-learned-condition-wrap'
0xf075b2: lea rdx, [rbp + 0x20]
0xf075b6: mov rcx, rdi
0xf075b9: call 0xcb7a70
0xf075be: lea r8, [rdi + 0x378]
0xf075c5: mov qword ptr [rsp + 0x20], r14
0xf075ca: lea r9, [rip + 0x5dcba23]    ; 0x6cd2ff4 name 'selector-skill-addinfo-exist-follow-learn-text'
0xf075d1: lea rdx, [rbp + 0x20]
0xf075d5: mov rcx, rdi
0xf075d8: call 0xcb7a70
0xf075dd: lea r8, [rdi + 0x380]
0xf075e4: mov qword ptr [rsp + 0x20], r14
0xf075e9: lea r9, [rip + 0x5dcba08]    ; 0x6cd2ff8 name 'selector-skill-addinfo-not-exist-follow-learn-text'
0xf075f0: lea rdx, [rbp + 0x20]
0xf075f4: mov rcx, rdi
0xf075f7: call 0xcb7a70
0xf075fc: lea r8, [rdi + 0x388]
0xf07603: mov qword ptr [rsp + 0x20], r14
0xf07608: lea r9, [rip + 0x5dcb9ed]    ; 0x6cd2ffc name 'selector-skill-addinfo-post-knowledge-container'
0xf0760f: lea rdx, [rbp + 0x20]
0xf07613: mov rcx, rdi
0xf07616: call 0xcb7a70
0xf0761b: lea r8, [rdi + 0x390]
0xf07622: mov qword ptr [rsp + 0x20], r14
0xf07627: lea r9, [rip + 0x5dcb9d2]    ; 0x6cd3000 name 'selector-skill-addinfo-post-knowledge-wrap'
0xf0762e: lea rdx, [rbp + 0x20]
0xf07632: mov rcx, rdi
0xf07635: call 0xcb7a70
0xf0763a: lea r8, [rdi + 0x398]
0xf07641: mov qword ptr [rsp + 0x20], r14
0xf07646: lea r9, [rip + 0x5dcb9b7]    ; 0x6cd3004 name 'selector-skill-addinfo-title'
0xf0764d: lea rdx, [rbp + 0x20]
0xf07651: mov rcx, rdi
0xf07654: call 0xcb7a70
0xf07659: lea r8, [rdi + 0x3a0]
0xf07660: mov qword ptr [rsp + 0x20], r14
0xf07665: lea r9, [rip + 0x5dcb99c]    ; 0x6cd3008 name 'selector-skill-addinfo-desc'
0xf0766c: lea rdx, [rbp + 0x20]
0xf07670: mov rcx, rdi
0xf07673: call 0xcb7a70
0xf07678: lea r8, [rdi + 0x3a8]
0xf0767f: mov qword ptr [rsp + 0x20], r14
0xf07684: lea r9, [rip + 0x5dcb981]    ; 0x6cd300c name 'selector-skill-learned-condition-desc'
0xf0768b: lea rdx, [rbp + 0x20]
0xf0768f: mov rcx, rdi
0xf07692: call 0xcb7a70
0xf07697: lea r8, [rdi + 0x3e0]
0xf0769e: lea r9, [rip + 0x5dcc19f]    ; 0x6cd3844 name 'selector-management-operating-cost-wrap'
0xf076a5: lea rdx, [rbp + 0x20]
0xf076a9: mov rcx, rdi
0xf076ac: call 0xe35980
0xf076b1: mov rcx, qword ptr [rdi + 8]
0xf076b5: mov rbx, qword ptr [rcx + 0xa0]
0xf076bc: test rbx, rbx
0xf076bf: je 0xf076c8
0xf076c1: cmp qword ptr [rbx + 8], 0
0xf076c6: jne 0xf0771e
0xf076c8: mov rcx, qword ptr [rcx + 0xe0]
0xf076cf: test rcx, rcx
0xf076d2: je 0xf076ed
0xf076d4: lea rdx, [rip + 0x5dcb935]    ; 0x6cd3010 name 'is-worldmap-knowledge-tooltip'
0xf076db: call 0x4743a0
0xf076e0: test rax, rax
0xf076e3: je 0xf076ed
0xf076e5: mov rax, qword ptr [rax]
0xf076e8: mov r14, qword ptr [rax]
0xf076eb: jmp 0xf0771e
0xf076ed: test rbx, rbx
0xf076f0: je 0xf07717
0xf076f2: mov rcx, qword ptr [rbx + 0x68]
0xf076f6: test rcx, rcx
0xf076f9: je 0xf07717
0xf076fb: lea rdx, [rip + 0x5dcb90e]    ; 0x6cd3010 name 'is-worldmap-knowledge-tooltip'
0xf07702: call 0x4743a0
0xf07707: test rax, rax
0xf0770a: je 0xf07717
0xf0770c: mov rax, qword ptr [rax]
0xf0770f: mov r14, qword ptr [rax]
0xf07712: test r14, r14
0xf07715: jne 0xf0771e
0xf07717: lea r14, [rip + 0x467f9ea]    ; 0x5587108 'false'
0xf0771e: lea rdx, [rdi + 0x1ba]
0xf07725: mov rcx, r14
0xf07728: call 0x1423cd0
0xf0772d: test al, al
0xf0772f: jne 0xf07739
0xf07731: mov eax, dword ptr [rip + 0x5df0265]    ; 0x6cf799c
0xf07737: jmp 0xf07780
0xf07739: mov dword ptr [rsi], 0
0xf0773f: jmp 0xf07782
0xf07741: mov eax, dword ptr [rip + 0x5dd43e9]    ; 0x6cdbb30
0xf07747: mov dword ptr [rsi], eax
0xf07749: lea rcx, [rbp + 0x20]
0xf0774d: call 0x38ad90
0xf07752: jmp 0xf07782
0xf07754: mov eax, dword ptr [rip + 0x5dd43d6]    ; 0x6cdbb30
0xf0775a: mov dword ptr [rsi], eax
0xf0775c: lea rcx, [rbp + 0x20]
0xf07760: call 0x38ad90
0xf07765: jmp 0xf07782
0xf07767: mov eax, dword ptr [rip + 0x5dd43c3]    ; 0x6cdbb30
0xf0776d: mov dword ptr [rsi], eax
0xf0776f: lea rcx, [rbp + 0x20]
0xf07773: call 0x38ad90
0xf07778: jmp 0xf07782
0xf0777a: mov eax, dword ptr [rip + 0x5dd43b0]    ; 0x6cdbb30
0xf07780: mov dword ptr [rsi], eax
0xf07782: mov rax, rsi
0xf07785: mov rbx, qword ptr [rsp + 0x68]
0xf0778a: mov rsi, qword ptr [rsp + 0x70]
0xf0778f: add rsp, 0x40
0xf07793: pop r14
0xf07795: pop rdi
0xf07796: pop rbp
0xf07797: ret 
