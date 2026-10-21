0xacf580: push rbx
0xacf582: push rbp
0xacf583: push rsi
0xacf584: push rdi
0xacf585: push r12
0xacf587: push r13
0xacf589: push r14
0xacf58b: push r15
0xacf58d: sub rsp, 0x138
0xacf594: mov rdi, rcx
0xacf597: mov r8, qword ptr [rcx + 0x28]
0xacf59b: mov r14, qword ptr [r8 + 0x1120]
0xacf5a2: mov r15, qword ptr [r8 + 0x1130]
0xacf5a9: mov r12, qword ptr [r8 + 0x10f8]
0xacf5b0: mov rdx, qword ptr [rcx + 0x30]
0xacf5b4: mov r13, qword ptr [rdx + 8]
0xacf5b8: mov rax, qword ptr [rdx + 0x10]
0xacf5bc: mov qword ptr [rsp + 0x190], rax
0xacf5c4: mov rax, qword ptr [rdx + 0x30]
0xacf5c8: mov qword ptr [rsp + 0x198], rax
0xacf5d0: mov rax, qword ptr [rdx + 0x40]
0xacf5d4: mov qword ptr [rsp + 0x20], rax
0xacf5d9: mov rax, qword ptr [rdx + 0x48]
0xacf5dd: mov qword ptr [rsp + 0x40], rax
0xacf5e2: mov rax, qword ptr [rdx]
0xacf5e5: mov qword ptr [rsp + 0x48], rax
0xacf5ea: mov rax, qword ptr [rdx + 0x20]
0xacf5ee: mov qword ptr [rsp + 0x50], rax
0xacf5f3: mov rax, qword ptr [rdx + 0x38]
0xacf5f7: mov qword ptr [rsp + 0x30], rax
0xacf5fc: mov rax, qword ptr [rcx + 0x38]
0xacf600: mov rcx, qword ptr [rax + 0x10]
0xacf604: mov qword ptr [rsp + 0x58], rcx
0xacf609: mov rcx, qword ptr [rdx + 0x50]
0xacf60d: mov qword ptr [rsp + 0x28], rcx
0xacf612: mov rcx, qword ptr [rdx + 0x78]
0xacf616: mov qword ptr [rsp + 0x38], rcx
0xacf61b: mov rcx, qword ptr [r8 + 0x11b0]
0xacf622: mov qword ptr [rsp + 0x180], rcx
0xacf62a: mov rcx, qword ptr [rdi + 0x108]
0xacf631: mov qword ptr [rsp + 0x188], rcx
0xacf639: mov rax, qword ptr [rax + 0x30]
0xacf63d: mov qword ptr [rsp + 0x60], rax
0xacf642: mov rax, qword ptr [r8 + 0x1160]
0xacf649: mov qword ptr [rsp + 0x68], rax
0xacf64e: mov ebp, 0x1fd
0xacf653: mov rax, qword ptr gs:[0x58]
0xacf65c: add rbp, qword ptr [rax]
0xacf65f: mov edx, 0x10
0xacf664: mov ecx, 0x98
0xacf669: cmp byte ptr [rbp], 0
0xacf66d: je 0x140acf676
0xacf66f: call 0x1447efa78
0xacf674: jmp 0x140acf67b
0xacf676: call 0x1447ef9b0
0xacf67b: mov rbx, rax
0xacf67e: test rax, rax
0xacf681: jne 0x140acf69e
0xacf683: call 0x141318e70
0xacf688: xor r9d, r9d
0xacf68b: xor r8d, r8d
0xacf68e: mov edx, 1
0xacf693: mov ecx, 0xa0000002
0xacf698: call qword ptr [rip + 0x471baaa]
0xacf69e: mov qword ptr [rsp + 0x70], rbx
0xacf6a3: test rbx, rbx
0xacf6a6: je 0x140acf759
0xacf6ac: mov qword ptr [rbx], r14
0xacf6af: mov qword ptr [rbx + 8], r15
0xacf6b3: mov qword ptr [rbx + 0x10], r12
0xacf6b7: mov rax, qword ptr [rsp + 0x180]
0xacf6bf: mov qword ptr [rbx + 0x18], rax
0xacf6c3: mov rax, qword ptr [rsp + 0x188]
0xacf6cb: mov qword ptr [rbx + 0x20], rax
0xacf6cf: mov qword ptr [rbx + 0x28], r13
0xacf6d3: mov rax, qword ptr [rsp + 0x190]
0xacf6db: mov qword ptr [rbx + 0x30], rax
0xacf6df: mov rax, qword ptr [rsp + 0x198]
0xacf6e7: mov qword ptr [rbx + 0x38], rax
0xacf6eb: mov rax, qword ptr [rsp + 0x20]
0xacf6f0: mov qword ptr [rbx + 0x40], rax
0xacf6f4: mov rax, qword ptr [rsp + 0x28]
0xacf6f9: mov qword ptr [rbx + 0x48], rax
0xacf6fd: mov rax, qword ptr [rsp + 0x30]
0xacf702: mov qword ptr [rbx + 0x50], rax
0xacf706: mov rax, qword ptr [rsp + 0x38]
0xacf70b: mov qword ptr [rbx + 0x58], rax
0xacf70f: mov rax, qword ptr [rsp + 0x40]
0xacf714: mov qword ptr [rbx + 0x60], rax
0xacf718: mov rax, qword ptr [rsp + 0x48]
0xacf71d: mov qword ptr [rbx + 0x68], rax
0xacf721: mov rax, qword ptr [rsp + 0x50]
0xacf726: mov qword ptr [rbx + 0x70], rax
0xacf72a: mov rax, qword ptr [rsp + 0x58]
0xacf72f: mov qword ptr [rbx + 0x78], rax
0xacf733: mov rax, qword ptr [rsp + 0x60]
0xacf738: mov qword ptr [rbx + 0x80], rax
0xacf73f: mov rax, qword ptr [rsp + 0x68]
0xacf744: mov qword ptr [rbx + 0x88], rax
0xacf74b: mov byte ptr [rbx + 0x90], 0
0xacf752: mov qword ptr [rip + 0x6299d7f], rbx
0xacf759: cmp rbx, qword ptr [rdi + 0x70]
0xacf75d: je 0x140acf76c
0xacf75f: lea rcx, [rdi + 0x70]
0xacf763: call 0x140ad4370
0xacf768: mov qword ptr [rdi + 0x70], rbx
0xacf76c: mov rsi, qword ptr [rdi + 0x28]
0xacf770: mov r15, qword ptr [rsi + 0x1100]
0xacf777: mov r12, qword ptr [rdi + 0x60]
0xacf77b: mov r13, qword ptr [rdi + 0x68]
0xacf77f: mov rax, qword ptr [rdi + 0x58]
0xacf783: mov qword ptr [rsp + 0x180], rax
0xacf78b: mov rax, qword ptr [rsi + 0x1148]
0xacf792: mov qword ptr [rsp + 0x188], rax
0xacf79a: mov rax, qword ptr [rsi + 0x10f8]
0xacf7a1: mov qword ptr [rsp + 0x190], rax
0xacf7a9: mov rax, qword ptr [rsi + 0x1128]
0xacf7b0: mov qword ptr [rsp + 0x198], rax
0xacf7b8: mov rax, qword ptr [rsi + 0x1108]
0xacf7bf: mov qword ptr [rsp + 0x68], rax
0xacf7c4: mov rax, qword ptr [rsi + 0x1180]
0xacf7cb: mov qword ptr [rsp + 0x60], rax
0xacf7d0: mov rax, qword ptr [rsi + 0x1158]
0xacf7d7: mov qword ptr [rsp + 0x58], rax
0xacf7dc: mov rax, qword ptr [rsi + 0x10f0]
0xacf7e3: mov qword ptr [rsp + 0x50], rax
0xacf7e8: mov rax, qword ptr [rdi + 0x18]
0xacf7ec: mov rcx, qword ptr [rax + 0x60]
0xacf7f0: mov rcx, qword ptr [rcx + 0x2b8]
0xacf7f7: mov rax, qword ptr [rcx]
0xacf7fa: call qword ptr [rax + 0x48]
0xacf7fd: mov qword ptr [rsp + 0x88], rax
0xacf805: mov r9, qword ptr [rdi + 0x30]
0xacf809: mov rax, qword ptr [r9 + 0x58]
0xacf80d: mov qword ptr [rsp + 0x98], rax
0xacf815: mov rax, qword ptr [r9]
0xacf818: mov qword ptr [rsp + 0x90], rax
0xacf820: mov rax, qword ptr [rdi + 0x38]
0xacf824: mov qword ptr [rsp + 0xa8], rax
0xacf82c: mov rax, qword ptr [rdi + 0x40]
0xacf830: mov qword ptr [rsp + 0xb0], rax
0xacf838: mov rax, qword ptr [rdi + 0x108]
0xacf83f: mov qword ptr [rsp + 0x20], rax
0xacf844: mov rax, qword ptr [r9 + 0x48]
0xacf848: mov qword ptr [rsp + 0x120], rax
0xacf850: mov r8, qword ptr [rdi + 0x28]
0xacf854: mov rax, qword ptr [r8 + 0x1120]
0xacf85b: mov qword ptr [rsp + 0x78], rax
0xacf860: mov rax, qword ptr [r9 + 0x70]
0xacf864: mov qword ptr [rsp + 0xb8], rax
0xacf86c: mov rdx, qword ptr [rdi + 0x18]
0xacf870: mov r14, qword ptr [rdx + 0x60]
0xacf874: mov rax, qword ptr [rdx + 0x58]
0xacf878: mov qword ptr [rsp + 0xc0], rax
0xacf880: mov rax, qword ptr [r14 + 0x2b8]
0xacf887: mov qword ptr [rsp + 0xc8], rax
0xacf88f: mov rax, qword ptr [rdx + 0x68]
0xacf893: mov qword ptr [rsp + 0xd0], rax
0xacf89b: mov rax, qword ptr [rdi + 0x20]
0xacf89f: mov rcx, qword ptr [rax]
0xacf8a2: mov rax, qword ptr [rcx + 0x18]
0xacf8a6: mov qword ptr [rsp + 0xd8], rax
0xacf8ae: mov rax, qword ptr [rdx + 0x80]
0xacf8b5: mov qword ptr [rsp + 0xe0], rax
0xacf8bd: mov rax, qword ptr [r9 + 0x50]
0xacf8c1: mov qword ptr [rsp + 0xf8], rax
0xacf8c9: mov rax, qword ptr [r8 + 0x1160]
0xacf8d0: mov qword ptr [rsp + 0x100], rax
0xacf8d8: mov rax, qword ptr [rdx + 0xa0]
0xacf8df: mov qword ptr [rsp + 0xe8], rax
0xacf8e7: mov rax, qword ptr [rdx + 0x70]
0xacf8eb: mov qword ptr [rsp + 0x108], rax
0xacf8f3: mov rax, qword ptr [r9 + 0x60]
0xacf8f7: mov qword ptr [rsp + 0x110], rax
0xacf8ff: mov rax, qword ptr [r8 + 0x1168]
0xacf906: mov qword ptr [rsp + 0x48], rax
0xacf90b: mov rax, qword ptr [r8 + 0x1178]
0xacf912: mov qword ptr [rsp + 0x40], rax
0xacf917: mov rax, qword ptr [r8 + 0x1110]
0xacf91e: mov qword ptr [rsp + 0x38], rax
0xacf923: mov rax, qword ptr [r8 + 0x1188]
0xacf92a: mov qword ptr [rsp + 0x30], rax
0xacf92f: mov rax, qword ptr [r8 + 0x11c0]
0xacf936: mov qword ptr [rsp + 0x28], rax
0xacf93b: mov rax, qword ptr [rdi + 0x128]
0xacf942: mov qword ptr [rsp + 0x118], rax
0xacf94a: mov rax, qword ptr [rdi + 0x10]
0xacf94e: mov qword ptr [rsp + 0x70], rax
0xacf953: mov rax, qword ptr [r9 + 0x20]
0xacf957: mov qword ptr [rsp + 0x80], rax
0xacf95f: mov rax, qword ptr [r9 + 0x80]
0xacf966: mov qword ptr [rsp + 0xa0], rax
0xacf96e: mov rax, qword ptr [r14 + 0x1088]
0xacf975: mov qword ptr [rsp + 0xf0], rax
0xacf97d: mov edx, 0x10
0xacf982: mov ecx, 0x150
0xacf987: cmp byte ptr [rbp], 0
0xacf98b: je 0x140acf994
0xacf98d: call 0x1447efa78
0xacf992: jmp 0x140acf999
0xacf994: call 0x1447ef9b0
0xacf999: mov rbx, rax
0xacf99c: test rax, rax
0xacf99f: jne 0x140acf9bc
0xacf9a1: call 0x141318e70
0xacf9a6: xor r9d, r9d
0xacf9a9: xor r8d, r8d
0xacf9ac: mov edx, 1
0xacf9b1: mov ecx, 0xa0000002
0xacf9b6: call qword ptr [rip + 0x471b78c]
0xacf9bc: mov qword ptr [rsp + 0x128], rbx
0xacf9c4: test rbx, rbx
0xacf9c7: je 0x140acfbcd
0xacf9cd: mov qword ptr [rbx], r15
0xacf9d0: mov qword ptr [rbx + 8], r12
0xacf9d4: mov qword ptr [rbx + 0x10], r13
0xacf9d8: mov rax, qword ptr [rsp + 0x180]
0xacf9e0: mov qword ptr [rbx + 0x18], rax
0xacf9e4: mov qword ptr [rbx + 0x20], rsi
0xacf9e8: mov rax, qword ptr [rsp + 0x188]
0xacf9f0: mov qword ptr [rbx + 0x28], rax
0xacf9f4: mov rax, qword ptr [rsp + 0x190]
0xacf9fc: mov qword ptr [rbx + 0x30], rax
0xacfa00: mov rax, qword ptr [rsp + 0x198]
0xacfa08: mov qword ptr [rbx + 0x38], rax
0xacfa0c: mov rax, qword ptr [rsp + 0x68]
0xacfa11: mov qword ptr [rbx + 0x40], rax
0xacfa15: mov rax, qword ptr [rsp + 0x60]
0xacfa1a: mov qword ptr [rbx + 0x48], rax
0xacfa1e: mov rax, qword ptr [rsp + 0x58]
0xacfa23: mov qword ptr [rbx + 0x50], rax
0xacfa27: mov rax, qword ptr [rsp + 0x50]
0xacfa2c: mov qword ptr [rbx + 0x58], rax
0xacfa30: mov rax, qword ptr [rsp + 0x48]
0xacfa35: mov qword ptr [rbx + 0x60], rax
0xacfa39: mov rax, qword ptr [rsp + 0x40]
0xacfa3e: mov qword ptr [rbx + 0x68], rax
0xacfa42: mov rax, qword ptr [rsp + 0x38]
0xacfa47: mov qword ptr [rbx + 0x70], rax
0xacfa4b: mov rax, qword ptr [rsp + 0x30]
0xacfa50: mov qword ptr [rbx + 0x78], rax
0xacfa54: mov rax, qword ptr [rsp + 0x28]
0xacfa59: mov qword ptr [rbx + 0x80], rax
0xacfa60: mov rax, qword ptr [rsp + 0x20]
0xacfa65: mov qword ptr [rbx + 0x88], rax
0xacfa6c: mov rax, qword ptr [rsp + 0x120]
0xacfa74: mov qword ptr [rbx + 0x90], rax
0xacfa7b: mov rax, qword ptr [rsp + 0x78]
0xacfa80: mov qword ptr [rbx + 0x98], rax
0xacfa87: mov rax, qword ptr [rsp + 0x80]
0xacfa8f: mov qword ptr [rbx + 0xa0], rax
0xacfa96: mov rax, qword ptr [rsp + 0x88]
0xacfa9e: mov qword ptr [rbx + 0xa8], rax
0xacfaa5: mov rax, qword ptr [rsp + 0x90]
0xacfaad: mov qword ptr [rbx + 0xb0], rax
0xacfab4: mov rax, qword ptr [rsp + 0x98]
0xacfabc: mov qword ptr [rbx + 0xb8], rax
0xacfac3: mov rax, qword ptr [rsp + 0xa0]
0xacfacb: mov qword ptr [rbx + 0xc0], rax
0xacfad2: mov rax, qword ptr [rsp + 0xa8]
0xacfada: mov qword ptr [rbx + 0xc8], rax
0xacfae1: mov rax, qword ptr [rsp + 0xb0]
0xacfae9: mov qword ptr [rbx + 0xd0], rax
0xacfaf0: mov rax, qword ptr [rsp + 0xb8]
0xacfaf8: mov qword ptr [rbx + 0xd8], rax
0xacfaff: mov qword ptr [rbx + 0xe0], r14
0xacfb06: mov rax, qword ptr [rsp + 0xc0]
0xacfb0e: mov qword ptr [rbx + 0xe8], rax
0xacfb15: mov rax, qword ptr [rsp + 0xc8]
0xacfb1d: mov qword ptr [rbx + 0xf0], rax
0xacfb24: mov rax, qword ptr [rsp + 0xd0]
0xacfb2c: mov qword ptr [rbx + 0xf8], rax
0xacfb33: mov rax, qword ptr [rsp + 0xd8]
0xacfb3b: mov qword ptr [rbx + 0x100], rax
0xacfb42: mov rax, qword ptr [rsp + 0xe0]
0xacfb4a: mov qword ptr [rbx + 0x108], rax
0xacfb51: mov rax, qword ptr [rsp + 0xe8]
0xacfb59: mov qword ptr [rbx + 0x110], rax
0xacfb60: mov rax, qword ptr [rsp + 0xf0]
0xacfb68: mov qword ptr [rbx + 0x118], rax
0xacfb6f: mov rax, qword ptr [rsp + 0xf8]
0xacfb77: mov qword ptr [rbx + 0x120], rax
0xacfb7e: mov rax, qword ptr [rsp + 0x100]
0xacfb86: mov qword ptr [rbx + 0x128], rax
0xacfb8d: mov rax, qword ptr [rsp + 0x108]
0xacfb95: mov qword ptr [rbx + 0x130], rax
0xacfb9c: mov rax, qword ptr [rsp + 0x110]
0xacfba4: mov qword ptr [rbx + 0x138], rax
0xacfbab: mov rax, qword ptr [rsp + 0x118]
0xacfbb3: mov qword ptr [rbx + 0x140], rax
0xacfbba: mov rax, qword ptr [rsp + 0x70]
0xacfbbf: mov qword ptr [rbx + 0x148], rax
0xacfbc6: mov qword ptr [rip + 0x62995c3], rbx
0xacfbcd: mov rcx, qword ptr [rdi + 0x78]
0xacfbd1: cmp rbx, rcx
0xacfbd4: je 0x140acfbf1
0xacfbd6: test rcx, rcx
0xacfbd9: je 0x140acfbed
0xacfbdb: cmp byte ptr [rbp], 0
0xacfbdf: je 0x140acfbe8
0xacfbe1: call 0x1447f03bc
0xacfbe6: jmp 0x140acfbed
0xacfbe8: call 0x1447f02bc
0xacfbed: mov qword ptr [rdi + 0x78], rbx
0xacfbf1: add rsp, 0x138
0xacfbf8: pop r15
0xacfbfa: pop r14
0xacfbfc: pop r13
0xacfbfe: pop r12
0xacfc00: pop rdi
0xacfc01: pop rsi
0xacfc02: pop rbp
0xacfc03: pop rbx
0xacfc04: ret 