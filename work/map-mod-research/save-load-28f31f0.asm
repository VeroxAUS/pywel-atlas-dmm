0x28f31f0: mov qword ptr [rsp + 8], rcx
0x28f31f5: push rbp
0x28f31f6: push rbx
0x28f31f7: push rsi
0x28f31f8: push rdi
0x28f31f9: push r12
0x28f31fb: push r13
0x28f31fd: push r14
0x28f31ff: push r15
0x28f3201: lea rbp, [rsp - 0x8a38]
0x28f3209: mov eax, 0x8b38
0x28f320e: call 0x1448962c0
0x28f3213: sub rsp, rax
0x28f3216: vmovaps xmmword ptr [rsp + 0x8b20], xmm6
0x28f321f: mov r14, rcx
0x28f3222: xor r13d, r13d
0x28f3225: mov eax, r13d
0x28f3228: mov dword ptr [rbp + 0x60], eax
0x28f322b: mov dword ptr [rbp + 0x38], eax
0x28f322e: mov rax, qword ptr [rcx]
0x28f3231: mov rdx, qword ptr [rax + 0xe8]
0x28f3238: call rdx
0x28f323a: test rax, rax
0x28f323d: je 0x1428f827d
0x28f3243: mov rax, qword ptr [r14 + 0x68]
0x28f3247: mov rdi, qword ptr [rax + 0x10]
0x28f324b: lea r15, [r14 + 0x68]
0x28f324f: lea rsi, [rip + 0x32321a2]
0x28f3256: test rdi, rdi
0x28f3259: je 0x1428f32d3
0x28f325b: mov qword ptr [rbp + 0x68], r13
0x28f325f: mov qword ptr [rbp + 0x70], r13
0x28f3263: lea rdx, [r14 + 8]
0x28f3267: test r14, r14
0x28f326a: cmove rdx, r13
0x28f326e: lea rcx, [rbp + 0x3a0]
0x28f3275: call 0x140393e80
0x28f327a: nop 
0x28f327b: mov rdx, qword ptr [rdi + 0x18]
0x28f327f: lea rcx, [rbp + 0x68]
0x28f3283: call 0x1428fddb0
0x28f3288: nop 
0x28f3289: lea rcx, [rbp + 0x3a0]
0x28f3290: call 0x1403944d0
0x28f3295: lea r15, [r14 + 0x68]
0x28f3299: cmp dword ptr [rbp + 0x70], r13d
0x28f329d: je 0x1428f32ca
0x28f329f: mov rdx, r14
0x28f32a2: lea rcx, [rbp + 0xb50]
0x28f32a9: call 0x142a757a0
0x28f32ae: nop 
0x28f32af: lea r8, [rbp + 0x68]
0x28f32b3: mov rdx, rax
0x28f32b6: mov rcx, r14
0x28f32b9: call 0x142a1bd40
0x28f32be: nop 
0x28f32bf: mov qword ptr [rbp + 0xb50], rsi
0x28f32c6: lea r15, [r14 + 0x68]
0x28f32ca: lea rcx, [rbp + 0x68]
0x28f32ce: call 0x140c23580
0x28f32d3: mov rax, qword ptr [r14 + 0x68]
0x28f32d7: mov rsi, qword ptr [rax + 0x20]
0x28f32db: mov qword ptr [rbp - 0x80], rsi
0x28f32df: mov qword ptr [rbp + 0x10], r13
0x28f32e3: mov qword ptr [rbp + 0x18], r13
0x28f32e7: mov qword ptr [rbp - 0x50], r13
0x28f32eb: mov qword ptr [rbp - 0x48], r13
0x28f32ef: lea rcx, [rbp + 0x14b0]
0x28f32f6: call 0x142445010
0x28f32fb: lea rdx, [r14 + 8]
0x28f32ff: test r14, r14
0x28f3302: cmove rdx, r13
0x28f3306: lea rcx, [rbp + 0x3a8]
0x28f330d: call 0x140393e80
0x28f3312: nop 
0x28f3313: mov rax, qword ptr [r14 + 0x68]
0x28f3317: mov rcx, qword ptr [rax + 0x20]
0x28f331b: add rcx, 0x30
0x28f331f: call 0x140389570
0x28f3324: movzx ecx, word ptr [rax + 0x5b8]
0x28f332b: mov word ptr [rsp + 0x60], cx
0x28f3330: lea rcx, [rsp + 0x60]
0x28f3335: call 0x1406365e0
0x28f333a: mov r13, rax
0x28f333d: mov r12d, dword ptr [rax + 0x20]
0x28f3341: mov edx, r12d
0x28f3344: lea rcx, [rbp + 0x10]
0x28f3348: call 0x140c20c00
0x28f334d: test r12d, r12d
0x28f3350: je 0x1428f3386
0x28f3352: xor eax, eax
0x28f3354: mov ebx, eax
0x28f3356: mov rdi, qword ptr [rbp + 0x10]
0x28f335a: mov r15d, r12d
0x28f335d: nop dword ptr [rax]
0x28f3360: mov rdx, qword ptr [r13 + 0x18]
0x28f3364: mov r8, rdi
0x28f3367: movzx edx, word ptr [rbx + rdx]
0x28f336b: mov rcx, qword ptr [rsi + 0x18]
0x28f336f: call 0x1417b2b90
0x28f3374: add rdi, 0x58
0x28f3378: lea rbx, [rbx + 2]
0x28f337c: sub r15, 1
0x28f3380: jne 0x1428f3360
0x28f3382: lea r15, [r14 + 0x68]
0x28f3386: lea rcx, [rsp + 0x60]
0x28f338b: call 0x1406365e0
0x28f3390: mov r13, rax
0x28f3393: mov r12d, dword ptr [rax + 0x30]
0x28f3397: mov edx, r12d
0x28f339a: lea rcx, [rbp - 0x50]
0x28f339e: call 0x140c20da0
0x28f33a3: xor eax, eax
0x28f33a5: mov ebx, eax
0x28f33a7: test r12d, r12d
0x28f33aa: je 0x1428f33df
0x28f33ac: mov edi, eax
0x28f33ae: nop 
0x28f33b0: mov r9, qword ptr [r13 + 0x28]
0x28f33b4: mov edx, ebx
0x28f33b6: lea rcx, [rbp - 0x50]
0x28f33ba: call 0x140c20d90
0x28f33bf: mov r8, rax
0x28f33c2: movzx edx, word ptr [rdi + r9]
0x28f33c7: mov rcx, qword ptr [rsi + 0x18]
0x28f33cb: call 0x1417b29f0
0x28f33d0: inc ebx
0x28f33d2: lea rdi, [rdi + 2]
0x28f33d6: cmp ebx, r12d
0x28f33d9: jb 0x1428f33b0
0x28f33db: lea r15, [r14 + 0x68]
0x28f33df: lea rcx, [rbp + 0x830]
0x28f33e6: call 0x14178e640
0x28f33eb: nop 
0x28f33ec: lea rdx, [rbp + 0x830]
0x28f33f3: mov r13, qword ptr [rbp - 0x80]
0x28f33f7: mov rcx, r13
0x28f33fa: call 0x141795a00
0x28f33ff: movzx r12d, al
0x28f3403: lea rdx, [rbp + 0x14b0]
0x28f340a: lea rcx, [rbp + 0x830]
0x28f3411: call 0x14178e950
0x28f3416: nop 
0x28f3417: lea rcx, [rbp + 0x830]
0x28f341e: call 0x1403d8c70
0x28f3423: nop 
0x28f3424: lea rcx, [rbp + 0x3a8]
0x28f342b: call 0x1403944d0
0x28f3430: mov ecx, dword ptr [rip + 0x4399962]
0x28f3436: mov dword ptr [rbp + 0x198], ecx
0x28f343c: movzx ecx, word ptr [r13 + 0x98]
0x28f3444: mov word ptr [rbp + 0xf2], cx
0x28f344b: mov rcx, qword ptr [r13 + 0x90]
0x28f3452: mov qword ptr [rbp + 0x3b0], rcx
0x28f3459: mov r8, qword ptr [r14 + 0x68]
0x28f345d: mov rax, qword ptr [r8 + 0x20]
0x28f3461: mov rcx, qword ptr [rax + 0x88]
0x28f3468: mov rax, qword ptr [rcx + 8]
0x28f346c: mov qword ptr [rbp + 0x3b8], rax
0x28f3473: mov rax, qword ptr [r8 + 0x20]
0x28f3477: mov rcx, qword ptr [rax + 0x88]
0x28f347e: mov eax, dword ptr [rcx]
0x28f3480: mov dword ptr [rbp + 0x1b8], eax
0x28f3486: mov rcx, r14
0x28f3489: call 0x14206a890
0x28f348e: mov rsi, rax
0x28f3491: mov rcx, qword ptr [r8 + 0x20]
0x28f3495: movzx edx, byte ptr [rcx + 0x273]
0x28f349c: mov byte ptr [rbp + 0x8a90], dl
0x28f34a2: mov rcx, qword ptr [r8 + 0x20]
0x28f34a6: movzx edx, byte ptr [rcx + 0x272]
0x28f34ad: mov byte ptr [rbp + 0x8a98], dl
0x28f34b3: lea rdx, [rbp + 0x3c0]
0x28f34ba: mov rcx, r13
0x28f34bd: call 0x1417e91d0
0x28f34c2: nop 
0x28f34c3: mov rdx, rax
0x28f34c6: lea rcx, [rbp + 0xce8]
0x28f34cd: call 0x1413ac660
0x28f34d2: mov rdi, rax
0x28f34d5: mov rcx, qword ptr [r15]
0x28f34d8: mov rcx, qword ptr [rcx + 0x20]
0x28f34dc: add rcx, 0x30
0x28f34e0: call 0x140389570
0x28f34e5: mov rbx, rax
0x28f34e8: mov rdx, r14
0x28f34eb: lea rcx, [rbp + 0xb68]
0x28f34f2: call 0x142a757a0
0x28f34f7: nop 
0x28f34f8: lea rcx, [rbp + 0x198]
0x28f34ff: mov qword ptr [rsp + 0x58], rcx
0x28f3504: lea rcx, [rbp + 0xf2]
0x28f350b: mov qword ptr [rsp + 0x50], rcx
0x28f3510: lea rcx, [rbp + 0x3b0]
0x28f3517: mov qword ptr [rsp + 0x48], rcx
0x28f351c: lea rcx, [rbp + 0x3b8]
0x28f3523: mov qword ptr [rsp + 0x40], rcx
0x28f3528: lea rcx, [rbp + 0x1b8]
0x28f352f: mov qword ptr [rsp + 0x38], rcx
0x28f3534: mov qword ptr [rsp + 0x30], rsi
0x28f3539: lea rcx, [rbp + 0x8a90]
0x28f3540: mov qword ptr [rsp + 0x28], rcx
0x28f3545: lea rcx, [rbp + 0x8a98]
0x28f354c: mov qword ptr [rsp + 0x20], rcx
0x28f3551: mov r9, rdi
0x28f3554: mov r8, rbx
0x28f3557: mov rdx, rax
0x28f355a: mov rcx, r14
0x28f355d: call 0x142990270
0x28f3562: nop 
0x28f3563: lea rsi, [rip + 0x3231e8e]
0x28f356a: mov qword ptr [rbp + 0xb68], rsi
0x28f3571: lea rcx, [rbp + 0x3c0]
0x28f3578: call 0x14044ffa0
0x28f357d: cmp dword ptr [rbp + 0x18], 0
0x28f3581: je 0x1428f35aa
0x28f3583: mov rdx, r14
0x28f3586: lea rcx, [rbp + 0xb80]
0x28f358d: call 0x142a757a0
0x28f3592: nop 
0x28f3593: lea r8, [rbp + 0x10]
0x28f3597: mov rdx, rax
0x28f359a: mov rcx, r14
0x28f359d: call 0x142990920
0x28f35a2: nop 
0x28f35a3: mov qword ptr [rbp + 0xb80], rsi
0x28f35aa: mov rdi, r15
0x28f35ad: cmp dword ptr [rbp - 0x48], 0
0x28f35b1: je 0x1428f35de
0x28f35b3: mov rdx, r14
0x28f35b6: lea rcx, [rbp + 0xb98]
0x28f35bd: call 0x142a757a0
0x28f35c2: nop 
0x28f35c3: lea r8, [rbp - 0x50]
0x28f35c7: mov rdx, rax
0x28f35ca: mov rcx, r14
0x28f35cd: call 0x142990e30
0x28f35d2: nop 
0x28f35d3: mov qword ptr [rbp + 0xb98], rsi
0x28f35da: lea rdi, [r14 + 0x68]
0x28f35de: mov rbx, r15
0x28f35e1: test r12b, r12b
0x28f35e4: je 0x1428f3624
0x28f35e6: mov eax, dword ptr [r14 + 0x60]
0x28f35ea: mov dword ptr [rbp + 0x1b4], eax
0x28f35f0: mov rdx, r14
0x28f35f3: lea rcx, [rbp + 0xbb0]
0x28f35fa: call 0x142a757a0
0x28f35ff: nop 
0x28f3600: lea r9, [rbp + 0x14b0]
0x28f3607: lea r8, [rbp + 0x1b4]
0x28f360e: mov rdx, rax
0x28f3611: mov rcx, r14
0x28f3614: call 0x14298a3a0
0x28f3619: nop 
0x28f361a: mov qword ptr [rbp + 0xbb0], rsi
0x28f3621: mov rbx, rdi
0x28f3624: mov r8, r14
0x28f3627: lea rdx, [rsp + 0x64]
0x28f362c: mov rcx, r13
0x28f362f: call 0x142945810
0x28f3634: nop 
0x28f3635: lea rcx, [rbp - 0x50]
0x28f3639: call 0x14035e2e0
0x28f363e: nop 
0x28f363f: lea rcx, [rbp + 0x10]
0x28f3643: call 0x14035e2e0
0x28f3648: mov rax, qword ptr [r15]
0x28f364b: mov rdi, qword ptr [rax + 0x28]
0x28f364f: test rdi, rdi
0x28f3652: je 0x1428f380a
0x28f3658: mov rcx, r14
0x28f365b: call 0x14206a890
0x28f3660: mov rbx, qword ptr [rax]
0x28f3663: xor r15d, r15d
0x28f3666: mov qword ptr [rbp + 0x68], r15
0x28f366a: mov esi, r15d
0x28f366d: mov qword ptr [rbp + 0x70], r15
0x28f3671: lea rcx, [rbp + 0xd30]
0x28f3678: call 0x140584630
0x28f367d: nop 
0x28f367e: lea r12, [r14 + 8]
0x28f3682: mov rdx, r12
0x28f3685: test r14, r14
0x28f3688: cmove rdx, r15
0x28f368c: lea rcx, [rbp + 0x3c8]
0x28f3693: call 0x140393e80
0x28f3698: nop 
0x28f3699: lea rcx, [rdi + 0x18]
0x28f369d: cmp dword ptr [rcx + 4], r15d
0x28f36a1: je 0x1428f3715
0x28f36a3: lea rdx, [rbp + 0x10]
0x28f36a7: call 0x1409d6f50
0x28f36ac: lea rcx, [rbp + 0x10]
0x28f36b0: call 0x1411f9ac0
0x28f36b5: test al, al
0x28f36b7: je 0x1428f3715
0x28f36b9: nop dword ptr [rax]
0x28f36c0: mov rdx, qword ptr [rbp + 0x18]
0x28f36c4: lea rcx, [rbp - 0x50]
0x28f36c8: call 0x14244c370
0x28f36cd: mov qword ptr [rbp - 0x50], rbx
0x28f36d1: mov byte ptr [rbp - 0x48], 0
0x28f36d5: mov eax, dword ptr [rdx + 4]
0x28f36d8: mov dword ptr [rbp - 0x44], eax
0x28f36db: mov eax, dword ptr [rdx + 0x10]
0x28f36de: mov dword ptr [rbp - 0x40], eax
0x28f36e1: mov eax, dword ptr [rdx + 0xc]
0x28f36e4: mov dword ptr [rbp - 0x3c], eax
0x28f36e7: mov rax, qword ptr [rdx + 0x18]
0x28f36eb: mov qword ptr [rbp - 0x38], rax
0x28f36ef: lea rdx, [rbp - 0x50]
0x28f36f3: lea rcx, [rbp + 0x68]
0x28f36f7: call 0x14066fff0
0x28f36fc: lea rcx, [rbp + 0x10]
0x28f3700: call 0x1411f9ae0
0x28f3705: lea rcx, [rbp + 0x10]
0x28f3709: call 0x1411f9ac0
0x28f370e: test al, al
0x28f3710: jne 0x1428f36c0
0x28f3712: mov esi, dword ptr [rbp + 0x70]
0x28f3715: mov rbx, qword ptr [rdi + 0x38]
0x28f3719: mov edi, dword ptr [rdi + 0x40]
0x28f371c: shl rdi, 4
0x28f3720: add rdi, rbx
0x28f3723: cmp rbx, rdi
0x28f3726: je 0x1428f375f
0x28f3728: mov rcx, rbx
0x28f372b: call 0x14038ab60
0x28f3730: mov ecx, dword ptr [rax]
0x28f3732: mov dword ptr [rbp + 0x648], ecx
0x28f3738: mov rax, qword ptr [rbx + 8]
0x28f373c: mov qword ptr [rbp + 0x650], rax
0x28f3743: lea rdx, [rbp + 0x648]
0x28f374a: lea rcx, [rbp + 0xd30]
0x28f3751: call 0x141f1f850
0x28f3756: add rbx, 0x10
0x28f375a: cmp rbx, rdi
0x28f375d: jne 0x1428f3728
0x28f375f: lea rcx, [rbp + 0x3c8]
0x28f3766: call 0x1403944d0
0x28f376b: test esi, esi
0x28f376d: je 0x1428f37a7
0x28f376f: mov byte ptr [rbp + 2], 0
0x28f3773: mov rdx, r14
0x28f3776: lea rcx, [rbp + 0xbc8]
0x28f377d: call 0x142a757a0
0x28f3782: nop 
0x28f3783: lea r9, [rbp + 0x68]
0x28f3787: lea r8, [rbp + 2]
0x28f378b: mov rdx, rax
0x28f378e: mov rcx, r14
0x28f3791: call 0x142a66990
0x28f3796: nop 
0x28f3797: lea rsi, [rip + 0x3231c5a]
0x28f379e: mov qword ptr [rbp + 0xbc8], rsi
0x28f37a5: jmp 0x1428f37ae
0x28f37a7: lea rsi, [rip + 0x3231c4a]
0x28f37ae: mov rcx, qword ptr [rbp + 0xd38]
0x28f37b5: test ecx, ecx
0x28f37b7: je 0x1428f37ee
0x28f37b9: mov rax, qword ptr [rbp + 0xd30]
0x28f37c0: mov qword ptr [rbp - 0x50], rax
0x28f37c4: mov dword ptr [rbp - 0x48], ecx
0x28f37c7: mov rdx, r14
0x28f37ca: lea rcx, [rbp + 0xbe0]
0x28f37d1: call 0x142a757a0
0x28f37d6: nop 
0x28f37d7: lea r8, [rbp - 0x50]
0x28f37db: mov rdx, rax
0x28f37de: mov rcx, r14
0x28f37e1: call 0x142a67d90
0x28f37e6: nop 
0x28f37e7: mov qword ptr [rbp + 0xbe0], rsi
0x28f37ee: lea rcx, [rbp + 0xd30]
0x28f37f5: call 0x14038a130
0x28f37fa: nop 
0x28f37fb: lea rcx, [rbp + 0x68]
0x28f37ff: call 0x14035e2e0
0x28f3804: lea rbx, [r14 + 0x68]
0x28f3808: jmp 0x1428f3811
0x28f380a: lea r12, [r14 + 8]
0x28f380e: xor r15d, r15d
0x28f3811: mov qword ptr [rbp + 0x68], r15
0x28f3815: mov qword ptr [rbp + 0x70], 0
0x28f381d: mov rax, qword ptr [rbx]
0x28f3820: mov r13, qword ptr [rax + 0xb8]
0x28f3827: mov qword ptr [rbp + 0x30], r13
0x28f382b: test r13, r13
0x28f382e: je 0x1428f3860
0x28f3830: mov rdx, r12
0x28f3833: test r14, r14
0x28f3836: cmove rdx, r15
0x28f383a: lea rcx, [rbp + 0x3d0]
0x28f3841: call 0x140393e80
0x28f3846: nop 
0x28f3847: lea rdx, [rbp + 0x68]
0x28f384b: mov rcx, r13
0x28f384e: call 0x1421381f0
0x28f3853: nop 
0x28f3854: lea rcx, [rbp + 0x3d0]
0x28f385b: call 0x1403944d0
0x28f3860: mov rax, qword ptr [rbx]
0x28f3863: mov rsi, qword ptr [rax + 0x38]
0x28f3867: mov qword ptr [rbp + 0x188], r15
0x28f386e: mov qword ptr [rbp + 0x190], 0
0x28f3879: lea rcx, [rbp + 0x74d0]
0x28f3880: call 0x14038a310
0x28f3885: nop 
0x28f3886: lea rcx, [rbp + 0x15c0]
0x28f388d: call 0x1424097a0
0x28f3892: nop 
0x28f3893: mov rdx, r12
0x28f3896: test r14, r14
0x28f3899: cmove rdx, r15
0x28f389d: lea rcx, [rbp + 0x3d8]
0x28f38a4: call 0x140393e80
0x28f38a9: nop 
0x28f38aa: mov rcx, qword ptr [rsi + 0x90]
0x28f38b1: call 0x1404649e0
0x28f38b6: movzx r15d, word ptr [rax + 0x20]
0x28f38bb: xor eax, eax
0x28f38bd: movzx ebx, ax
0x28f38c0: cmp ax, r15w
0x28f38c4: jge 0x1428f393c
0x28f38c6: mov r13d, 0xff
0x28f38cc: nop dword ptr [rax]
0x28f38d0: movzx edx, bx
0x28f38d3: mov rcx, rsi
0x28f38d6: call 0x1420c32e0
0x28f38db: mov rdi, rax
0x28f38de: mov rcx, rax
0x28f38e1: call 0x14240b450
0x28f38e6: test al, al
0x28f38e8: je 0x1428f392f
0x28f38ea: mov rcx, qword ptr [rsi + 0x90]
0x28f38f1: call 0x1420ceb00
0x28f38f6: test al, al
0x28f38f8: jne 0x1428f392f
0x28f38fa: mov word ptr [rbp + 0xf0], r13w
0x28f3902: movzx r9d, bx
0x28f3906: lea r8, [rbp + 0xf0]
0x28f390d: mov rdx, rdi
0x28f3910: lea rcx, [rbp + 0x1690]
0x28f3917: call 0x142449610
0x28f391c: lea rdx, [rbp + 0x1690]
0x28f3923: lea rcx, [rbp + 0x188]
0x28f392a: call 0x1405d4a80
0x28f392f: inc bx
0x28f3932: cmp bx, r15w
0x28f3936: jl 0x1428f38d0
0x28f3938: mov r13, qword ptr [rbp + 0x30]
0x28f393c: mov eax, dword ptr [rsi + 0x9c]
0x28f3942: mov dword ptr [rsp + 0x64], eax
0x28f3946: lea rdx, [rbp + 0x74d0]
0x28f394d: mov rcx, rsi
0x28f3950: call 0x1420caa50
0x28f3955: nop 
0x28f3956: lea rcx, [rbp + 0x3d8]
0x28f395d: call 0x1403944d0
0x28f3962: cmp dword ptr [rbp + 0x190], 0
0x28f3969: je 0x1428f39a3
0x28f396b: mov rdx, r14
0x28f396e: lea rcx, [rbp + 0xbf8]
0x28f3975: call 0x142a757a0
0x28f397a: nop 
0x28f397b: lea r9, [rbp + 0x188]
0x28f3982: lea r8, [rsp + 0x64]
0x28f3987: mov rdx, rax
0x28f398a: mov rcx, r14
0x28f398d: call 0x1429eea50
0x28f3992: nop 
0x28f3993: lea r15, [rip + 0x3231a5e]
0x28f399a: mov qword ptr [rbp + 0xbf8], r15
0x28f39a1: jmp 0x1428f39aa
0x28f39a3: lea r15, [rip + 0x3231a4e]
0x28f39aa: mov rdi, qword ptr [rbp + 0x74d0]
0x28f39b1: mov eax, dword ptr [rbp + 0x74d8]
0x28f39b7: imul rsi, rax, 0x110
0x28f39be: add rsi, rdi
0x28f39c1: cmp rdi, rsi
0x28f39c4: je 0x1428f3a5b
0x28f39ca: nop word ptr [rax + rax]
0x28f39d0: lea rcx, [rdi + 8]
0x28f39d4: call 0x1420c0e10
0x28f39d9: test al, al
0x28f39db: jne 0x1428f3a4b
0x28f39dd: lea rcx, [rbp + 0x1b60]
0x28f39e4: call 0x14244a5e0
0x28f39e9: lea rdx, [rbp + 0x1b60]
0x28f39f0: lea rcx, [rdi + 8]
0x28f39f4: call 0x1420c17a0
0x28f39f9: mov byte ptr [rbp + 3], 1
0x28f39fd: mov byte ptr [rbp + 4], 0
0x28f3a01: mov rcx, rdi
0x28f3a04: call 0x140388780
0x28f3a09: mov rbx, rax
0x28f3a0c: mov rdx, r14
0x28f3a0f: lea rcx, [rbp + 0xc10]
0x28f3a16: call 0x142a757a0
0x28f3a1b: nop 
0x28f3a1c: lea rcx, [rbp + 3]
0x28f3a20: mov qword ptr [rsp + 0x28], rcx
0x28f3a25: lea rcx, [rbp + 4]
0x28f3a29: mov qword ptr [rsp + 0x20], rcx
0x28f3a2e: lea r9, [rbp + 0x1b60]
0x28f3a35: mov r8, rbx
0x28f3a38: mov rdx, rax
0x28f3a3b: mov rcx, r14
0x28f3a3e: call 0x1429f7850
0x28f3a43: nop 
0x28f3a44: mov qword ptr [rbp + 0xc10], r15
0x28f3a4b: add rdi, 0x110
0x28f3a52: cmp rdi, rsi
0x28f3a55: jne 0x1428f39d0
0x28f3a5b: mov rsi, qword ptr [rbp + 0x188]
0x28f3a62: mov eax, dword ptr [rbp + 0x190]
0x28f3a68: imul r15, rax, 0x1b8
0x28f3a6f: add r15, rsi
0x28f3a72: cmp rsi, r15
0x28f3a75: je 0x1428f3b59
0x28f3a7b: xor r13d, r13d
0x28f3a7e: nop 
0x28f3a80: mov rdx, rsi
0x28f3a83: lea rcx, [rbp + 0xf90]
0x28f3a8a: call 0x14240a090
0x28f3a8f: nop 
0x28f3a90: movzx eax, word ptr [rbp + 0xf98]
0x28f3a97: mov word ptr [rsp + 0x60], ax
0x28f3a9c: lea rcx, [rsp + 0x60]
0x28f3aa1: call 0x14038ab60
0x28f3aa6: lea rcx, [rax + 0x42]
0x28f3aaa: call 0x14045ffc0
0x28f3aaf: cmp byte ptr [rax + 0x24], 0
0x28f3ab3: je 0x1428f3b39
0x28f3ab9: mov qword ptr [rbp + 0x1c0], r13
0x28f3ac0: mov qword ptr [rbp + 0x1c8], r13
0x28f3ac7: lea rdx, [rbp + 0x1c0]
0x28f3ace: lea rcx, [rbp + 0xf90]
0x28f3ad5: call 0x14240f4e0
0x28f3ada: mov rbx, qword ptr [rbp + 0x1c0]
0x28f3ae1: mov eax, dword ptr [rbp + 0x1c8]
0x28f3ae7: lea rdi, [rbx + rax*8]
0x28f3aeb: cmp rbx, rdi
0x28f3aee: je 0x1428f3b2c
0x28f3af0: mov byte ptr [rsp + 0x60], 1
0x28f3af5: nop word ptr [rax + rax]
0x28f3b00: mov r8d, dword ptr [rbx + 4]
0x28f3b04: lea rdx, [rsp + 0x60]
0x28f3b09: lea rcx, [rbp + 0xdd0]
0x28f3b10: call 0x141ecdb40
0x28f3b15: mov r8, rax
0x28f3b18: movzx edx, word ptr [rbx]
0x28f3b1b: mov rcx, r14
0x28f3b1e: call 0x1417fbc30
0x28f3b23: add rbx, 8
0x28f3b27: cmp rbx, rdi
0x28f3b2a: jne 0x1428f3b00
0x28f3b2c: lea rcx, [rbp + 0x1c0]
0x28f3b33: call 0x14035e2e0
0x28f3b38: nop 
0x28f3b39: lea rcx, [rbp + 0xf90]
0x28f3b40: call 0x14240af60
0x28f3b45: add rsi, 0x1b8
0x28f3b4c: cmp rsi, r15
0x28f3b4f: jne 0x1428f3a80
0x28f3b55: mov r13, qword ptr [rbp + 0x30]
0x28f3b59: lea rcx, [rbp + 0x15c0]
0x28f3b60: call 0x14240af60
0x28f3b65: nop 
0x28f3b66: lea rcx, [rbp + 0x74d0]
0x28f3b6d: call 0x1427ba6f0
0x28f3b72: nop 
0x28f3b73: lea rcx, [rbp + 0x188]
0x28f3b7a: call 0x14035e2e0
0x28f3b7f: mov rax, qword ptr [r14 + 0x68]
0x28f3b83: mov rsi, qword ptr [rax + 0x168]
0x28f3b8a: test rsi, rsi
0x28f3b8d: je 0x1428f408e
0x28f3b93: xor ebx, ebx
0x28f3b95: mov qword ptr [rsp + 0x70], rbx
0x28f3b9a: mov qword ptr [rsp + 0x78], rbx
0x28f3b9f: mov qword ptr [rbp + 0x40], rbx
0x28f3ba3: mov r12d, ebx
0x28f3ba6: mov qword ptr [rbp + 0x48], rbx
0x28f3baa: mov qword ptr [rbp + 0x10], rbx
0x28f3bae: mov qword ptr [rbp + 0x18], rbx
0x28f3bb2: mov qword ptr [rbp + 0x1f0], rbx
0x28f3bb9: mov qword ptr [rbp + 0x1f8], rbx
0x28f3bc0: mov qword ptr [rbp + 0x1e0], rbx
0x28f3bc7: mov qword ptr [rbp + 0x1e8], rbx
0x28f3bce: mov qword ptr [rbp + 0x1d0], rbx
0x28f3bd5: mov qword ptr [rbp + 0x1d8], rbx
0x28f3bdc: mov qword ptr [rbp - 0x50], rbx
0x28f3be0: mov qword ptr [rbp - 0x48], rbx
0x28f3be4: lea rdx, [r14 + 8]
0x28f3be8: test r14, r14
0x28f3beb: cmove rdx, rbx
0x28f3bef: lea rcx, [rbp + 0x3e0]
0x28f3bf6: call 0x140393e80
0x28f3bfb: nop 
0x28f3bfc: lea rcx, [rbp + 0x1850]
0x28f3c03: call 0x14038a180
0x28f3c08: nop 
0x28f3c09: lea rax, [rbp + 0x1850]
0x28f3c10: mov qword ptr [rbp + 0x618], rax
0x28f3c17: mov qword ptr [rbp + 0x620], rbx
0x28f3c1e: lea rdx, [rbp + 0x618]
0x28f3c25: mov rcx, rsi
0x28f3c28: call 0x1428d6350
0x28f3c2d: mov rbx, qword ptr [rbp + 0x1850]
0x28f3c34: lea rcx, [rbp + 0x1850]
0x28f3c3b: call 0x1405d2d90
0x28f3c40: mov rdi, rax
0x28f3c43: cmp rbx, rax
0x28f3c46: je 0x1428f3c7c
0x28f3c48: nop dword ptr [rax + rax]
0x28f3c50: lea rcx, [rbp - 0x78]
0x28f3c54: call 0x140c21dd0
0x28f3c59: lea rdx, [rbp - 0x78]
0x28f3c5d: mov rcx, rbx
0x28f3c60: call 0x1417e1d90
0x28f3c65: lea rdx, [rbp - 0x78]
0x28f3c69: lea rcx, [rsp + 0x70]
0x28f3c6e: call 0x140635fe0
0x28f3c73: add rbx, 0x18
0x28f3c77: cmp rbx, rdi
0x28f3c7a: jne 0x1428f3c50
0x28f3c7c: lea rcx, [rsi + 0x38]
0x28f3c80: call 0x140e00a50
0x28f3c85: mov r15, rax
0x28f3c88: mov rdi, qword ptr [rcx]
0x28f3c8b: cmp rdi, rax
0x28f3c8e: je 0x1428f3ce8
0x28f3c90: lea rbx, [rdi + 0x18]
0x28f3c94: lea rcx, [rbp - 0x78]
0x28f3c98: call 0x142444240
0x28f3c9d: mov rcx, rdi
0x28f3ca0: call 0x1404a2630
0x28f3ca5: mov ecx, dword ptr [rax]
0x28f3ca7: mov dword ptr [rbp - 0x78], ecx
0x28f3caa: vmovups xmm0, xmmword ptr [rbx - 0x10]
0x28f3caf: vmovups xmmword ptr [rbp - 0x70], xmm0
0x28f3cb4: vmovsd xmm1, qword ptr [rbx]
0x28f3cb8: vmovsd qword ptr [rbp - 0x60], xmm1
0x28f3cbd: mov eax, dword ptr [rbx + 8]
0x28f3cc0: mov dword ptr [rbp - 0x58], eax
0x28f3cc3: movzx eax, byte ptr [rbx + 0xc]
0x28f3cc7: mov byte ptr [rbp - 0x54], al
0x28f3cca: lea rdx, [rbp - 0x78]
0x28f3cce: lea rcx, [rbp + 0x40]
0x28f3cd2: call 0x14096f7c0
0x28f3cd7: add rdi, 0x30
0x28f3cdb: lea rbx, [rbx + 0x30]
0x28f3cdf: cmp rdi, r15
0x28f3ce2: jne 0x1428f3c94
0x28f3ce4: mov r12d, dword ptr [rbp + 0x48]
0x28f3ce8: mov rbx, qword ptr [rsi + 0x78]
0x28f3cec: mov eax, dword ptr [rsi + 0x80]
0x28f3cf2: lea rdi, [rbx + rax*4]
0x28f3cf6: cmp rbx, rdi
0x28f3cf9: je 0x1428f3d35
0x28f3cfb: nop dword ptr [rax + rax]
0x28f3d00: mov rcx, rbx
0x28f3d03: call 0x1404a2af0
0x28f3d08: movzx ecx, word ptr [rax]
0x28f3d0b: mov word ptr [rbp + 0x118], cx
0x28f3d12: movzx eax, byte ptr [rbx + 2]
0x28f3d16: mov byte ptr [rbp + 0x11a], al
0x28f3d1c: lea rdx, [rbp + 0x118]
0x28f3d23: lea rcx, [rbp + 0x10]
0x28f3d27: call 0x14040b890
0x28f3d2c: add rbx, 4
0x28f3d30: cmp rbx, rdi
0x28f3d33: jne 0x1428f3d00
0x28f3d35: xor r15d, r15d
0x28f3d38: mov qword ptr [rbp + 0x658], r15
0x28f3d3f: lea rax, [rbp + 0x1f0]
0x28f3d46: mov qword ptr [rbp + 0x660], rax
0x28f3d4d: lea rdx, [rbp + 0x658]
0x28f3d54: mov rcx, rsi
0x28f3d57: call 0x1428d4ab0
0x28f3d5c: mov rbx, qword ptr [rsi + 0xf8]
0x28f3d63: mov eax, dword ptr [rsi + 0x100]
0x28f3d69: lea rdi, [rbx + rax*4]
0x28f3d6d: cmp rbx, rdi
0x28f3d70: je 0x1428f3da5
0x28f3d72: nop dword ptr [rax]
0x28f3d76: nop word ptr [rax + rax]
0x28f3d80: mov eax, dword ptr [rbx]
0x28f3d82: mov dword ptr [rsp + 0x64], eax
0x28f3d86: lea rcx, [rsp + 0x64]
0x28f3d8b: call 0x140388f30
0x28f3d90: mov rdx, rax
0x28f3d93: lea rcx, [rbp - 0x50]
0x28f3d97: call 0x1406f54a0
0x28f3d9c: add rbx, 4
0x28f3da0: cmp rbx, rdi
0x28f3da3: jne 0x1428f3d80
0x28f3da5: movzx ebx, word ptr [rsi + 0x118]
0x28f3dac: mov word ptr [rsp + 0x60], bx
0x28f3db1: mov qword ptr [rbp + 0x608], r15
0x28f3db8: lea rax, [rbp + 0x1e0]
0x28f3dbf: mov qword ptr [rbp + 0x610], rax
0x28f3dc6: xor r8d, r8d
0x28f3dc9: lea rdx, [rbp + 0x608]
0x28f3dd0: mov rcx, rsi
0x28f3dd3: call 0x1417e3500
0x28f3dd8: mov qword ptr [rbp + 0x668], r15
0x28f3ddf: lea rax, [rbp + 0x1d0]
0x28f3de6: mov qword ptr [rbp + 0x670], rax
0x28f3ded: mov r8b, 1
0x28f3df0: lea rdx, [rbp + 0x668]
0x28f3df7: mov rcx, rsi
0x28f3dfa: call 0x1417e3500
0x28f3dff: nop 
0x28f3e00: lea rcx, [rbp + 0x1850]
0x28f3e07: call 0x14038a130
0x28f3e0c: nop 
0x28f3e0d: lea rcx, [rbp + 0x3e0]
0x28f3e14: call 0x1403944d0
0x28f3e19: mov eax, dword ptr [rsp + 0x78]
0x28f3e1d: test eax, eax
0x28f3e1f: je 0x1428f3e5d
0x28f3e21: mov rcx, qword ptr [rsp + 0x70]
0x28f3e26: mov qword ptr [rbp - 0x78], rcx
0x28f3e2a: mov dword ptr [rbp - 0x70], eax
0x28f3e2d: mov rdx, r14
0x28f3e30: lea rcx, [rbp + 0xc28]
0x28f3e37: call 0x142a757a0
0x28f3e3c: nop 
0x28f3e3d: lea r8, [rbp - 0x78]
0x28f3e41: mov rdx, rax
0x28f3e44: mov rcx, r14
0x28f3e47: call 0x1429fa080
0x28f3e4c: nop 
0x28f3e4d: lea rdi, [rip + 0x32315a4]
0x28f3e54: mov qword ptr [rbp + 0xc28], rdi
0x28f3e5b: jmp 0x1428f3e64
0x28f3e5d: lea rdi, [rip + 0x3231594]
0x28f3e64: test r12d, r12d
0x28f3e67: je 0x1428f3eb1
0x28f3e69: mov rax, qword ptr [rbp + 0x40]
0x28f3e6d: mov qword ptr [rbp - 0x78], rax
0x28f3e71: mov dword ptr [rbp - 0x70], r12d
0x28f3e75: mov byte ptr [rbp + 5], 0
0x28f3e79: mov byte ptr [rbp + 6], 1
0x28f3e7d: mov rdx, r14
0x28f3e80: lea rcx, [rbp + 0xc40]
0x28f3e87: call 0x142a757a0
0x28f3e8c: nop 
0x28f3e8d: lea rcx, [rbp - 0x78]
0x28f3e91: mov qword ptr [rsp + 0x20], rcx
0x28f3e96: lea r9, [rbp + 5]
0x28f3e9a: lea r8, [rbp + 6]
0x28f3e9e: mov rdx, rax
0x28f3ea1: mov rcx, r14
0x28f3ea4: call 0x142976be0
0x28f3ea9: nop 
0x28f3eaa: mov qword ptr [rbp + 0xc40], rdi
0x28f3eb1: mov eax, dword ptr [rbp + 0x18]
0x28f3eb4: test eax, eax
0x28f3eb6: je 0x1428f3eea
0x28f3eb8: mov rcx, qword ptr [rbp + 0x10]
0x28f3ebc: mov qword ptr [rbp - 0x78], rcx
0x28f3ec0: mov dword ptr [rbp - 0x70], eax
0x28f3ec3: mov rdx, r14
0x28f3ec6: lea rcx, [rbp + 0xc58]
0x28f3ecd: call 0x142a757a0
0x28f3ed2: nop 
0x28f3ed3: lea r8, [rbp - 0x78]
0x28f3ed7: mov rdx, rax
0x28f3eda: mov rcx, r14
0x28f3edd: call 0x1429fb3d0
0x28f3ee2: nop 
0x28f3ee3: mov qword ptr [rbp + 0xc58], rdi
0x28f3eea: mov rax, qword ptr [rbp + 0x1f0]
0x28f3ef1: mov qword ptr [rbp - 0x78], rax
0x28f3ef5: mov eax, dword ptr [rbp + 0x1f8]
0x28f3efb: mov dword ptr [rbp - 0x70], eax
0x28f3efe: mov byte ptr [rbp + 7], 1
0x28f3f02: mov rdx, r14
0x28f3f05: lea rcx, [rbp + 0xc70]
0x28f3f0c: call 0x142a757a0
0x28f3f11: nop 
0x28f3f12: lea r9, [rbp - 0x78]
0x28f3f16: lea r8, [rbp + 7]
0x28f3f1a: mov rdx, rax
0x28f3f1d: mov rcx, r14
0x28f3f20: call 0x1429ab4c0
0x28f3f25: nop 
0x28f3f26: mov qword ptr [rbp + 0xc70], rdi
0x28f3f2d: mov eax, dword ptr [rbp - 0x48]
0x28f3f30: test eax, eax
0x28f3f32: je 0x1428f3f66
0x28f3f34: mov rcx, qword ptr [rbp - 0x50]
0x28f3f38: mov qword ptr [rbp - 0x78], rcx
0x28f3f3c: mov dword ptr [rbp - 0x70], eax
0x28f3f3f: mov rdx, r14
0x28f3f42: lea rcx, [rbp + 0xc88]
0x28f3f49: call 0x142a757a0
0x28f3f4e: nop 
0x28f3f4f: lea r8, [rbp - 0x78]
0x28f3f53: mov rdx, rax
0x28f3f56: mov rcx, r14
0x28f3f59: call 0x1429aaf60
0x28f3f5e: nop 
0x28f3f5f: mov qword ptr [rbp + 0xc88], rdi
0x28f3f66: mov eax, 0xffff
0x28f3f6b: cmp ax, bx
0x28f3f6e: je 0x1428f3fab
0x28f3f70: mov byte ptr [rbp + 8], 0
0x28f3f74: lea rcx, [rsp + 0x60]
0x28f3f79: call 0x14040b0e0
0x28f3f7e: mov rbx, rax
0x28f3f81: mov rdx, r14
0x28f3f84: lea rcx, [rbp + 0x898]
0x28f3f8b: call 0x142a757a0
0x28f3f90: nop 
0x28f3f91: lea r9, [rbp + 8]
0x28f3f95: mov r8, rbx
0x28f3f98: mov rdx, rax
0x28f3f9b: mov rcx, r14
0x28f3f9e: call 0x1429b49c0
0x28f3fa3: nop 
0x28f3fa4: mov qword ptr [rbp + 0x898], rdi
0x28f3fab: mov ecx, dword ptr [rbp + 0x1e8]
0x28f3fb1: test ecx, ecx
0x28f3fb3: je 0x1428f3ff2
0x28f3fb5: mov rax, qword ptr [rbp + 0x1e0]
0x28f3fbc: mov qword ptr [rbp - 0x78], rax
0x28f3fc0: mov dword ptr [rbp - 0x70], ecx
0x28f3fc3: mov byte ptr [rbp - 0x18], 0
0x28f3fc7: mov rdx, r14
0x28f3fca: lea rcx, [rbp + 0x8b0]
0x28f3fd1: call 0x142a757a0
0x28f3fd6: nop 
0x28f3fd7: lea r9, [rbp - 0x78]
0x28f3fdb: lea r8, [rbp - 0x18]
0x28f3fdf: mov rdx, rax
0x28f3fe2: mov rcx, r14
0x28f3fe5: call 0x1429b2700
0x28f3fea: nop 
0x28f3feb: mov qword ptr [rbp + 0x8b0], rdi
0x28f3ff2: mov ecx, dword ptr [rbp + 0x1d8]
0x28f3ff8: test ecx, ecx
0x28f3ffa: je 0x1428f4039
0x28f3ffc: mov rax, qword ptr [rbp + 0x1d0]
0x28f4003: mov qword ptr [rbp - 0x78], rax
0x28f4007: mov dword ptr [rbp - 0x70], ecx
0x28f400a: mov byte ptr [rbp - 0x17], 1
0x28f400e: mov rdx, r14
0x28f4011: lea rcx, [rbp + 0x8c8]
0x28f4018: call 0x142a757a0
0x28f401d: nop 
0x28f401e: lea r9, [rbp - 0x78]
0x28f4022: lea r8, [rbp - 0x17]
0x28f4026: mov rdx, rax
0x28f4029: mov rcx, r14
0x28f402c: call 0x1429b2700
0x28f4031: nop 
0x28f4032: mov qword ptr [rbp + 0x8c8], rdi
0x28f4039: lea rcx, [rbp - 0x50]
0x28f403d: call 0x14035e2e0
0x28f4042: nop 
0x28f4043: lea rcx, [rbp + 0x1d0]
0x28f404a: call 0x14035e2e0
0x28f404f: nop 
0x28f4050: lea rcx, [rbp + 0x1e0]
0x28f4057: call 0x14035e2e0
0x28f405c: nop 
0x28f405d: lea rcx, [rbp + 0x1f0]
0x28f4064: call 0x14035e2e0
0x28f4069: nop 
0x28f406a: lea rcx, [rbp + 0x10]
0x28f406e: call 0x14035e2e0
0x28f4073: nop 
0x28f4074: lea rcx, [rbp + 0x40]
0x28f4078: call 0x14035e2e0
0x28f407d: nop 
0x28f407e: lea rcx, [rsp + 0x70]
0x28f4083: call 0x14035e2e0
0x28f4088: lea r12, [r14 + 8]
0x28f408c: jmp 0x1428f4091
0x28f408e: xor r15d, r15d
0x28f4091: test r13, r13
0x28f4094: je 0x1428f4fdd
0x28f409a: mov qword ptr [rbp + 0xa0], r15
0x28f40a1: mov qword ptr [rbp + 0xa8], 0
0x28f40ac: mov qword ptr [rbp + 0xd0], r15
0x28f40b3: mov qword ptr [rbp + 0xd8], 0
0x28f40be: mov qword ptr [rsp + 0x70], r15
0x28f40c3: mov qword ptr [rsp + 0x78], 0
0x28f40cc: mov qword ptr [rbp + 0x168], r15
0x28f40d3: mov qword ptr [rbp + 0x170], 0
0x28f40de: mov rdx, r12
0x28f40e1: test r14, r14
0x28f40e4: cmove rdx, r15
0x28f40e8: lea rcx, [rbp + 0x3e8]
0x28f40ef: call 0x140393e80
0x28f40f4: nop 
0x28f40f5: mov eax, dword ptr [r13 + 0x20]
0x28f40f9: mov r12d, r15d
0x28f40fc: test eax, eax
0x28f40fe: je 0x1428f41a2
0x28f4104: mov r14d, eax
0x28f4107: nop word ptr [rax + rax]
0x28f4110: mov edx, r12d
0x28f4113: mov rcx, r13
0x28f4116: call 0x14212a8b0
0x28f411b: mov rsi, rax
0x28f411e: movzx r15d, word ptr [rax + 0xc]
0x28f4123: xor eax, eax
0x28f4125: movzx ebx, ax
0x28f4128: cmp ax, r15w
0x28f412c: jge 0x1428f418f
0x28f412e: nop 
0x28f4130: movzx edx, bx
0x28f4133: mov rcx, rsi
0x28f4136: call 0x142408900
0x28f413b: mov rdi, rax
0x28f413e: mov rcx, rax
0x28f4141: call 0x14240b450
0x28f4146: test al, al
0x28f4148: je 0x1428f4186
0x28f414a: movzx ecx, word ptr [rsi + 0x10]
0x28f414e: mov word ptr [rsp + 0x60], cx
0x28f4153: lea rcx, [rsp + 0x60]
0x28f4158: call 0x1404a2500
0x28f415d: movzx r9d, bx
0x28f4161: mov r8, rax
0x28f4164: mov rdx, rdi
0x28f4167: lea rcx, [rbp + 0x1690]
0x28f416e: call 0x142449610
0x28f4173: lea rdx, [rbp + 0x1690]
0x28f417a: lea rcx, [rbp + 0xa0]
0x28f4181: call 0x1405d4a80
0x28f4186: inc bx
0x28f4189: cmp bx, r15w
0x28f418d: jl 0x1428f4130
0x28f418f: inc r12d
0x28f4192: cmp r12d, r14d
0x28f4195: jb 0x1428f4110
0x28f419b: mov r14, qword ptr [rbp + 0x8a80]
0x28f41a2: lea rcx, [rbp + 0x1a2]
0x28f41a9: call 0x141ab1250
0x28f41ae: movzx edx, word ptr [rax]
0x28f41b1: mov rcx, r13
0x28f41b4: call 0x14212de20
0x28f41b9: movzx r12d, ax
0x28f41bd: lea rcx, [r13 + 0xb8]
0x28f41c4: lea rdx, [rbp + 0x10]
0x28f41c8: call 0x1409d6f50
0x28f41cd: lea rcx, [rbp + 0x10]
0x28f41d1: call 0x1411f9ac0
0x28f41d6: test al, al
0x28f41d8: je 0x1428f42b0
0x28f41de: nop 
0x28f41e0: mov rbx, qword ptr [rbp + 0xd0]
0x28f41e7: lea rcx, [rbp + 0xd0]
0x28f41ee: call 0x1405d2d90
0x28f41f3: mov rdi, rax
0x28f41f6: mov r15, qword ptr [rbp + 0x18]
0x28f41fa: cmp rbx, rax
0x28f41fd: je 0x1428f421e
0x28f41ff: nop 
0x28f4200: lea rcx, [r15 + 8]
0x28f4204: call 0x1404a2500
0x28f4209: movzx ecx, word ptr [rax]
0x28f420c: cmp word ptr [rbx], cx
0x28f420f: je 0x1428f4422
0x28f4215: add rbx, 0x18
0x28f4219: cmp rbx, rdi
0x28f421c: jne 0x1428f4200
0x28f421e: mov eax, dword ptr [r15 + 4]
0x28f4222: mov dword ptr [rbp + 0x11c], eax
0x28f4228: lea rax, [rbp + 0x11c]
0x28f422f: mov qword ptr [rbp - 0x50], rax
0x28f4233: lea rax, [rbp + 0x120]
0x28f423a: mov qword ptr [rbp - 0x48], rax
0x28f423e: lea rdx, [rbp - 0x50]
0x28f4242: lea rcx, [rbp + 0x790]
0x28f4249: call 0x1428fdf40
0x28f424e: mov rbx, rax
0x28f4251: lea rcx, [r15 + 8]
0x28f4255: call 0x1404a2500
0x28f425a: mov r8, rbx
0x28f425d: mov rdx, rax
0x28f4260: lea rcx, [rbp + 0x8e0]
0x28f4267: call 0x1428ec740
0x28f426c: nop 
0x28f426d: mov rdx, rax
0x28f4270: lea rcx, [rbp + 0xd0]
0x28f4277: call 0x1428ed130
0x28f427c: nop 
0x28f427d: lea rcx, [rbp + 0x8e0]
0x28f4284: call 0x140423920
0x28f4289: nop 
0x28f428a: lea rcx, [rbp + 0x790]
0x28f4291: call 0x14035e2e0
0x28f4296: lea rcx, [rbp + 0x10]
0x28f429a: call 0x1411f9ae0
0x28f429f: lea rcx, [rbp + 0x10]
0x28f42a3: call 0x1411f9ac0
0x28f42a8: test al, al
0x28f42aa: jne 0x1428f41e0
0x28f42b0: lea rcx, [r13 + 0x58]
0x28f42b4: lea rdx, [rbp + 0x10]
0x28f42b8: call 0x1409d6f50
0x28f42bd: lea rcx, [rbp + 0x10]
0x28f42c1: call 0x1411f9ac0
0x28f42c6: test al, al
0x28f42c8: je 0x1428f4323
0x28f42ca: nop word ptr [rax + rax]
0x28f42d0: lea rcx, [rbp - 0x50]
0x28f42d4: call 0x142449330
0x28f42d9: mov rcx, qword ptr [rbp + 0x18]
0x28f42dd: mov eax, dword ptr [rcx + 4]
0x28f42e0: mov dword ptr [rbp - 0x50], eax
0x28f42e3: mov eax, dword ptr [rcx + 0xc]
0x28f42e6: mov dword ptr [rbp - 0x48], eax
0x28f42e9: mov eax, dword ptr [rcx + 8]
0x28f42ec: mov dword ptr [rbp - 0x44], eax
0x28f42ef: mov rax, qword ptr [rcx + 0x10]
0x28f42f3: mov qword ptr [rbp - 0x40], rax
0x28f42f7: mov rax, qword ptr [rcx + 0x18]
0x28f42fb: mov qword ptr [rbp - 0x38], rax
0x28f42ff: lea rdx, [rbp - 0x50]
0x28f4303: lea rcx, [rsp + 0x70]
0x28f4308: call 0x1406362b0
0x28f430d: lea rcx, [rbp + 0x10]
0x28f4311: call 0x1411f9ae0
0x28f4316: lea rcx, [rbp + 0x10]
0x28f431a: call 0x1411f9ac0
0x28f431f: test al, al
0x28f4321: jne 0x1428f42d0
0x28f4323: xor r15d, r15d
0x28f4326: mov qword ptr [rbp + 0x6b8], r15
0x28f432d: lea rax, [rbp + 0x168]
0x28f4334: mov qword ptr [rbp + 0x6c0], rax
0x28f433b: lea rdx, [rbp + 0x6b8]
0x28f4342: mov rcx, r13
0x28f4345: call 0x142135330
0x28f434a: nop 
0x28f434b: lea rcx, [rbp + 0x3e8]
0x28f4352: call 0x1403944d0
0x28f4357: lea rcx, [rsp + 0x60]
0x28f435c: call 0x141ab1250
0x28f4361: mov rcx, qword ptr [r14 + 0x68]
0x28f4365: mov rcx, qword ptr [rcx + 0x20]
0x28f4369: add rcx, 0x30
0x28f436d: call 0x140389570
0x28f4372: movzx edx, word ptr [rsp + 0x60]
0x28f4377: mov rcx, rax
0x28f437a: call 0x141f3e9f0
0x28f437f: test al, al
0x28f4381: je 0x1428f4434
0x28f4387: lea rcx, [rsp + 0x60]
0x28f438c: call 0x1404a2500
0x28f4391: sub r12w, word ptr [rax + 0x48]
0x28f4396: mov word ptr [rbp + 0xc4], r12w
0x28f439e: cmp r15w, r12w
0x28f43a2: jge 0x1428f4434
0x28f43a8: mov byte ptr [rbp - 0x16], r15b
0x28f43ac: mov byte ptr [rbp - 0x15], r15b
0x28f43b0: mov qword ptr [rbp + 0x3f0], r15
0x28f43b7: lea rcx, [rbp + 0x1a0]
0x28f43be: call 0x141ab1250
0x28f43c3: mov rcx, rax
0x28f43c6: call 0x1404a2500
0x28f43cb: mov rbx, rax
0x28f43ce: mov rdx, r14
0x28f43d1: lea rcx, [rbp + 0x8f8]
0x28f43d8: call 0x142a757a0
0x28f43dd: nop 
0x28f43de: lea rcx, [rbp - 0x16]
0x28f43e2: mov qword ptr [rsp + 0x30], rcx
0x28f43e7: lea rcx, [rbp - 0x15]
0x28f43eb: mov qword ptr [rsp + 0x28], rcx
0x28f43f0: lea rcx, [rbp + 0x3f0]
0x28f43f7: mov qword ptr [rsp + 0x20], rcx
0x28f43fc: lea r9, [rbp + 0xc4]
0x28f4403: mov r8, rbx
0x28f4406: mov rdx, rax
0x28f4409: mov rcx, r14
0x28f440c: call 0x1429ec810
0x28f4411: nop 
0x28f4412: lea rsi, [rip + 0x3230fdf]
0x28f4419: mov qword ptr [rbp + 0x8f8], rsi
0x28f4420: jmp 0x1428f443b
0x28f4422: lea rdx, [r15 + 4]
0x28f4426: lea rcx, [rbx + 8]
0x28f442a: call 0x1403d0bf0
0x28f442f: jmp 0x1428f4296
0x28f4434: lea rsi, [rip + 0x3230fbd]
0x28f443b: cmp dword ptr [rbp + 0xa8], 0
0x28f4442: je 0x1428f44c2
0x28f4444: mov byte ptr [rbp - 0x14], 0
0x28f4448: mov byte ptr [rbp - 0x13], 1
0x28f444c: mov byte ptr [rbp - 0x12], 0
0x28f4450: mov byte ptr [rbp - 0x11], 0
0x28f4454: mov eax, 0x17
0x28f4459: mov word ptr [rbp + 0xc0], ax
0x28f4460: mov byte ptr [rbp - 0x10], 0x13
0x28f4464: mov rdx, r14
0x28f4467: lea rcx, [rbp + 0x910]
0x28f446e: call 0x142a757a0
0x28f4473: nop 
0x28f4474: lea rcx, [rbp + 0xa0]
0x28f447b: mov qword ptr [rsp + 0x40], rcx
0x28f4480: lea rcx, [rbp - 0x14]
0x28f4484: mov qword ptr [rsp + 0x38], rcx
0x28f4489: lea rcx, [rbp - 0x13]
0x28f448d: mov qword ptr [rsp + 0x30], rcx
0x28f4492: lea rcx, [rbp - 0x12]
0x28f4496: mov qword ptr [rsp + 0x28], rcx
0x28f449b: lea rcx, [rbp - 0x11]
0x28f449f: mov qword ptr [rsp + 0x20], rcx
0x28f44a4: lea r9, [rbp + 0xc0]
0x28f44ab: lea r8, [rbp - 0x10]
0x28f44af: mov rdx, rax
0x28f44b2: mov rcx, r14
0x28f44b5: call 0x1429edbe0
0x28f44ba: nop 
0x28f44bb: mov qword ptr [rbp + 0x910], rsi
0x28f44c2: mov rbx, qword ptr [rbp + 0xd0]
0x28f44c9: lea rcx, [rbp + 0xd0]
0x28f44d0: call 0x1405d2d90
0x28f44d5: mov rdi, rax
0x28f44d8: lea r12, [rip + 0x3230f59]
0x28f44df: cmp rbx, rax
0x28f44e2: je 0x1428f4549
0x28f44e4: nop dword ptr [rax]
0x28f44e8: nop dword ptr [rax + rax]
0x28f44f0: mov qword ptr [rbp + 0x308], rsi
0x28f44f7: mov byte ptr [rbp + 0x310], 0
0x28f44fe: mov qword ptr [rbp + 0x308], r12
0x28f4505: mov qword ptr [rbp + 0x318], r15
0x28f450c: mov rcx, qword ptr [r14]
0x28f450f: mov rdx, qword ptr [rcx + 0xe8]
0x28f4516: mov rcx, r14
0x28f4519: call rdx
0x28f451b: mov qword ptr [rbp + 0x318], rax
0x28f4522: lea r9, [rbx + 8]
0x28f4526: mov r8, rbx
0x28f4529: lea rdx, [rbp + 0x308]
0x28f4530: mov rcx, r14
0x28f4533: call 0x1429fd5b0
0x28f4538: nop 
0x28f4539: mov qword ptr [rbp + 0x308], rsi
0x28f4540: add rbx, 0x18
0x28f4544: cmp rbx, rdi
0x28f4547: jne 0x1428f44f0
0x28f4549: mov eax, dword ptr [rsp + 0x78]
0x28f454d: test eax, eax
0x28f454f: je 0x1428f45aa
0x28f4551: mov rcx, qword ptr [rsp + 0x70]
0x28f4556: mov qword ptr [rbp - 0x50], rcx
0x28f455a: mov dword ptr [rbp - 0x48], eax
0x28f455d: mov qword ptr [rbp + 0x320], rsi
0x28f4564: mov byte ptr [rbp + 0x328], 0
0x28f456b: mov qword ptr [rbp + 0x320], r12
0x28f4572: mov qword ptr [rbp + 0x330], r15
0x28f4579: mov rax, qword ptr [r14]
0x28f457c: mov rdx, qword ptr [rax + 0xe8]
0x28f4583: mov rcx, r14
0x28f4586: call rdx
0x28f4588: mov qword ptr [rbp + 0x330], rax
0x28f458f: lea r8, [rbp - 0x50]
0x28f4593: lea rdx, [rbp + 0x320]
0x28f459a: mov rcx, r14
0x28f459d: call 0x1429fe5c0
0x28f45a2: nop 
0x28f45a3: mov qword ptr [rbp + 0x320], rsi
0x28f45aa: cmp dword ptr [rbp + 0x170], 0
0x28f45b1: je 0x1428f461e
0x28f45b3: mov qword ptr [rbp + 0x3f8], r15
0x28f45ba: mov byte ptr [rbp - 0xf], 0
0x28f45be: mov qword ptr [rbp + 0x338], rsi
0x28f45c5: mov byte ptr [rbp + 0x340], 0
0x28f45cc: mov qword ptr [rbp + 0x338], r12
0x28f45d3: mov qword ptr [rbp + 0x348], r15
0x28f45da: mov rax, qword ptr [r14]
0x28f45dd: mov rdx, qword ptr [rax + 0xe8]
0x28f45e4: mov rcx, r14
0x28f45e7: call rdx
0x28f45e9: mov qword ptr [rbp + 0x348], rax
0x28f45f0: lea rax, [rbp + 0x168]
0x28f45f7: mov qword ptr [rsp + 0x20], rax
0x28f45fc: lea r9, [rbp + 0x3f8]
0x28f4603: lea r8, [rbp - 0xf]
0x28f4607: lea rdx, [rbp + 0x338]
0x28f460e: mov rcx, r14
0x28f4611: call 0x142a01a30
0x28f4616: nop 
0x28f4617: mov qword ptr [rbp + 0x338], rsi
0x28f461e: mov rsi, r15
0x28f4621: mov qword ptr [rbp + 0x10], r15
0x28f4625: mov edi, r15d
0x28f4628: mov qword ptr [rbp + 0x18], r15
0x28f462c: lea rdx, [r14 + 8]
0x28f4630: test r14, r14
0x28f4633: mov eax, 0
0x28f4638: cmove rdx, rax
0x28f463c: mov rdx, qword ptr [rdx]
0x28f463f: lea rcx, [rbp + 0x98]
0x28f4646: call 0x140393df0
0x28f464b: nop 
0x28f464c: mov r12, qword ptr [r13 + 0x48]
0x28f4650: mov eax, dword ptr [r13 + 0x50]
0x28f4654: lea rax, [r12 + rax*2]
0x28f4658: cmp r12, rax
0x28f465b: je 0x1428f478c
0x28f4661: mov r14, rax
0x28f4664: nop dword ptr [rax]
0x28f4668: nop dword ptr [rax + rax]
0x28f4670: movzx eax, word ptr [r12]
0x28f4675: mov word ptr [rsp + 0x60], ax
0x28f467a: lea rcx, [rsp + 0x60]
0x28f467f: call 0x1403885b0
0x28f4684: mov qword ptr [rbp - 0x80], rax
0x28f4688: cmp r15d, edi
0x28f468b: ja 0x1428f4767
0x28f4691: lea ebx, [r15*2 + 1]
0x28f4699: add ebx, r15d
0x28f469c: shr ebx, 1
0x28f469e: cmp ebx, 1
0x28f46a1: mov ecx, 1
0x28f46a6: cmovb ebx, ecx
0x28f46a9: cmp edi, ebx
0x28f46ab: cmova ebx, edi
0x28f46ae: cmp ebx, r15d
0x28f46b1: jbe 0x1428f4767
0x28f46b7: lea ecx, [rbx*4]
0x28f46be: mov r13d, 0x1fd
0x28f46c4: mov rax, qword ptr gs:[0x58]
0x28f46cd: mov rdx, qword ptr [rax]
0x28f46d0: cmp byte ptr [rdx + r13], 0
0x28f46d5: mov edx, 4
0x28f46da: je 0x1428f46e3
0x28f46dc: call 0x1447efa78
0x28f46e1: jmp 0x1428f46e8
0x28f46e3: call 0x1447ef9b0
0x28f46e8: mov r15, rax
0x28f46eb: test rax, rax
0x28f46ee: jne 0x1428f470b
0x28f46f0: call 0x141318e70
0x28f46f5: xor r9d, r9d
0x28f46f8: xor r8d, r8d
0x28f46fb: mov edx, 1
0x28f4700: mov ecx, 0xa0000002
0x28f4705: call qword ptr [rip + 0x28f6a3d]
0x28f470b: test edi, edi
0x28f470d: je 0x1428f472f
0x28f470f: mov rdx, r15
0x28f4712: mov rcx, rsi
0x28f4715: sub rcx, r15
0x28f4718: mov r8d, edi
0x28f471b: nop dword ptr [rax + rax]
0x28f4720: mov eax, dword ptr [rcx + rdx]
0x28f4723: mov dword ptr [rdx], eax
0x28f4725: lea rdx, [rdx + 4]
0x28f4729: sub r8, 1
0x28f472d: jne 0x1428f4720
0x28f472f: test rsi, rsi
0x28f4732: je 0x1428f4756
0x28f4734: mov rax, qword ptr gs:[0x58]
0x28f473d: mov rdx, qword ptr [rax]
0x28f4740: mov rcx, rsi
0x28f4743: cmp byte ptr [rdx + r13], 0
0x28f4748: je 0x1428f4751
0x28f474a: call 0x1447f03bc
0x28f474f: jmp 0x1428f4756
0x28f4751: call 0x1447f02bc
0x28f4756: mov rsi, r15
0x28f4759: mov qword ptr [rbp + 0x10], r15
0x28f475d: mov r15d, ebx
0x28f4760: mov dword ptr [rbp + 0x1c], ebx
0x28f4763: mov rax, qword ptr [rbp - 0x80]
0x28f4767: mov ecx, edi
0x28f4769: mov eax, dword ptr [rax + 8]
0x28f476c: mov dword ptr [rsi + rcx*4], eax
0x28f476f: inc edi
0x28f4771: mov dword ptr [rbp + 0x18], edi
0x28f4774: add r12, 2
0x28f4778: cmp r12, r14
0x28f477b: jne 0x1428f4670
0x28f4781: mov r14, qword ptr [rbp + 0x8a80]
0x28f4788: mov r13, qword ptr [rbp + 0x30]
0x28f478c: mov rcx, qword ptr [rbp + 0x98]
0x28f4793: mov rax, qword ptr [rcx]
0x28f4796: mov r8, qword ptr [rax + 0x20]
0x28f479a: mov dl, 1
0x28f479c: call r8
0x28f479f: test edi, edi
0x28f47a1: je 0x1428f47da
0x28f47a3: mov qword ptr [rbp - 0x50], rsi
0x28f47a7: mov dword ptr [rbp - 0x48], edi
0x28f47aa: mov rdx, r14
0x28f47ad: lea rcx, [rbp + 0x928]
0x28f47b4: call 0x142a757a0
0x28f47b9: nop 
0x28f47ba: lea r8, [rbp - 0x50]
0x28f47be: mov rdx, rax
0x28f47c1: mov rcx, r14
0x28f47c4: call 0x1429fdb00
0x28f47c9: nop 
0x28f47ca: lea r12, [rip + 0x3230c27]
0x28f47d1: mov qword ptr [rbp + 0x928], r12
0x28f47d8: jmp 0x1428f47e1
0x28f47da: lea r12, [rip + 0x3230c17]
0x28f47e1: lea r15, [r14 + 8]
0x28f47e5: mov rdx, r15
0x28f47e8: test r14, r14
0x28f47eb: mov edi, 0
0x28f47f0: cmove rdx, rdi
0x28f47f4: mov rdx, qword ptr [rdx]
0x28f47f7: lea rcx, [rbp - 0x80]
0x28f47fb: call 0x140393df0
0x28f4800: nop 
0x28f4801: movzx ebx, byte ptr [r13 + 0x248]
0x28f4809: mov rcx, qword ptr [rbp - 0x80]
0x28f480d: mov rax, qword ptr [rcx]
0x28f4810: mov r8, qword ptr [rax + 0x20]
0x28f4814: mov dl, 1
0x28f4816: call r8
0x28f4819: test bl, bl
0x28f481b: je 0x1428f4865
0x28f481d: mov word ptr [rbp + 0xc8], di
0x28f4824: lea rax, [rbp + 0xc8]
0x28f482b: mov qword ptr [rbp - 0x50], rax
0x28f482f: mov eax, 1
0x28f4834: mov dword ptr [rbp - 0x48], eax
0x28f4837: mov byte ptr [rbp - 0xe], al
0x28f483a: mov rdx, r14
0x28f483d: lea rcx, [rbp + 0x940]
0x28f4844: call 0x142a757a0
0x28f4849: nop 
0x28f484a: lea r9, [rbp - 0x50]
0x28f484e: lea r8, [rbp - 0xe]
0x28f4852: mov rdx, rax
0x28f4855: mov rcx, r14
0x28f4858: call 0x1429ffb30
0x28f485d: nop 
0x28f485e: mov qword ptr [rbp + 0x940], r12
0x28f4865: mov r12, rdi
0x28f4868: mov qword ptr [rbp - 0x78], rdi
0x28f486c: mov qword ptr [rbp - 0x70], rdi
0x28f4870: mov qword ptr [rbp + 0x158], rdi
0x28f4877: mov qword ptr [rbp + 0x160], 0
0x28f4882: mov rdx, r15
0x28f4885: test r14, r14
0x28f4888: cmove rdx, rdi
0x28f488c: mov rdx, qword ptr [rdx]
0x28f488f: lea rcx, [rbp - 0x80]
0x28f4893: call 0x140393df0
0x28f4898: nop 
0x28f4899: mov qword ptr [rbp + 0x5a8], rdi
0x28f48a0: lea rax, [rbp + 0x158]
0x28f48a7: mov qword ptr [rbp + 0x5b0], rax
0x28f48ae: lea rdx, [rbp + 0x5a8]
0x28f48b5: mov rcx, r13
0x28f48b8: call 0x142135720
0x28f48bd: nop 
0x28f48be: mov rcx, qword ptr [rbp - 0x80]
0x28f48c2: mov rax, qword ptr [rcx]
0x28f48c5: mov r8, qword ptr [rax + 0x20]
0x28f48c9: mov dl, 1
0x28f48cb: call r8
0x28f48ce: mov rbx, qword ptr [rbp + 0x158]
0x28f48d5: mov eax, dword ptr [rbp + 0x160]
0x28f48db: lea rdi, [rbx + rax*2]
0x28f48df: cmp rbx, rdi
0x28f48e2: je 0x1428f495f
0x28f48e4: nop dword ptr [rax]
0x28f48e8: nop dword ptr [rax + rax]
0x28f48f0: movzx eax, word ptr [rbx]
0x28f48f3: mov word ptr [rsp + 0x60], ax
0x28f48f8: lea rcx, [rsp + 0x60]
0x28f48fd: call 0x140388b80
0x28f4902: mov rdx, rax
0x28f4905: lea rcx, [rbp - 0x78]
0x28f4909: call 0x140d42110
0x28f490e: add rbx, 2
0x28f4912: cmp rbx, rdi
0x28f4915: jne 0x1428f48f0
0x28f4917: mov eax, dword ptr [rbp - 0x70]
0x28f491a: mov r12, qword ptr [rbp - 0x78]
0x28f491e: test eax, eax
0x28f4920: je 0x1428f495f
0x28f4922: mov qword ptr [rbp - 0x50], r12
0x28f4926: mov dword ptr [rbp - 0x48], eax
0x28f4929: mov byte ptr [rbp - 0xd], 0
0x28f492d: mov rdx, r14
0x28f4930: lea rcx, [rbp + 0x958]
0x28f4937: call 0x142a757a0
0x28f493c: nop 
0x28f493d: lea r9, [rbp - 0x50]
0x28f4941: lea r8, [rbp - 0xd]
0x28f4945: mov rdx, rax
0x28f4948: mov rcx, r14
0x28f494b: call 0x1429ffb30
0x28f4950: nop 
0x28f4951: lea rax, [rip + 0x3230aa0]
0x28f4958: mov qword ptr [rbp + 0x958], rax
0x28f495f: xor ebx, ebx
0x28f4961: mov qword ptr [rbp + 0x148], rbx
0x28f4968: mov qword ptr [rbp + 0x150], rbx
0x28f496f: mov rdx, r15
0x28f4972: test r14, r14
0x28f4975: cmove rdx, rbx
0x28f4979: lea rcx, [rbp + 0x400]
0x28f4980: call 0x140393e80
0x28f4985: nop 
0x28f4986: mov qword ptr [rbp + 0x5b8], rbx
0x28f498d: lea rax, [rbp + 0x148]
0x28f4994: mov qword ptr [rbp + 0x5c0], rax
0x28f499b: lea rdx, [rbp + 0x5b8]
0x28f49a2: mov rcx, r13
0x28f49a5: call 0x142134820
0x28f49aa: nop 
0x28f49ab: lea rcx, [rbp + 0x400]
0x28f49b2: call 0x1403944d0
0x28f49b7: mov rbx, qword ptr [rbp + 0x148]
0x28f49be: lea rcx, [rbp + 0x148]
0x28f49c5: call 0x142139a20
0x28f49ca: mov rdi, rax
0x28f49cd: cmp rbx, rax
0x28f49d0: je 0x1428f4a5b
0x28f49d6: xor r13d, r13d
0x28f49d9: lea r12, [rip + 0x3230a18]
0x28f49e0: lea r15, [rip + 0x3230a51]
0x28f49e7: nop word ptr [rax + rax]
0x28f49f0: mov qword ptr [rbp + 0x350], r12
0x28f49f7: mov byte ptr [rbp + 0x358], 0
0x28f49fe: mov qword ptr [rbp + 0x350], r15
0x28f4a05: mov qword ptr [rbp + 0x360], r13
0x28f4a0c: mov rcx, qword ptr [r14]
0x28f4a0f: mov rdx, qword ptr [rcx + 0xe8]
0x28f4a16: mov rcx, r14
0x28f4a19: call rdx
0x28f4a1b: mov qword ptr [rbp + 0x360], rax
0x28f4a22: lea r8, [rbx + 2]
0x28f4a26: lea r9, [r8 + 2]
0x28f4a2a: mov qword ptr [rsp + 0x20], rbx
0x28f4a2f: lea rdx, [rbp + 0x350]
0x28f4a36: mov rcx, r14
0x28f4a39: call 0x1429ff010
0x28f4a3e: nop 
0x28f4a3f: mov qword ptr [rbp + 0x350], r12
0x28f4a46: add rbx, 6
0x28f4a4a: cmp rbx, rdi
0x28f4a4d: jne 0x1428f49f0
0x28f4a4f: mov r13, qword ptr [rbp + 0x30]
0x28f4a53: mov r12, qword ptr [rbp - 0x78]
0x28f4a57: lea r15, [r14 + 8]
0x28f4a5b: mov rdx, r15
0x28f4a5e: test r14, r14
0x28f4a61: mov edi, 0
0x28f4a66: cmove rdx, rdi
0x28f4a6a: mov rdx, qword ptr [rdx]
0x28f4a6d: lea rcx, [rbp - 0x80]
0x28f4a71: call 0x140393df0
0x28f4a76: nop 
0x28f4a77: movzx ebx, byte ptr [r13 + 0x249]
0x28f4a7f: mov rcx, qword ptr [rbp - 0x80]
0x28f4a83: mov rax, qword ptr [rcx]
0x28f4a86: mov r8, qword ptr [rax + 0x20]
0x28f4a8a: mov dl, 1
0x28f4a8c: call r8
0x28f4a8f: test bl, bl
0x28f4a91: je 0x1428f4aea
0x28f4a93: lea rbx, [rip + 0x323095e]
0x28f4a9a: mov qword ptr [rbp + 0x368], rbx
0x28f4aa1: mov byte ptr [rbp + 0x370], dil
0x28f4aa8: lea rax, [rip + 0x3230989]
0x28f4aaf: mov qword ptr [rbp + 0x368], rax
0x28f4ab6: mov qword ptr [rbp + 0x378], rdi
0x28f4abd: mov rax, qword ptr [r14]
0x28f4ac0: mov rdx, qword ptr [rax + 0xe8]
0x28f4ac7: mov rcx, r14
0x28f4aca: call rdx
0x28f4acc: mov qword ptr [rbp + 0x378], rax
0x28f4ad3: lea rdx, [rbp + 0x368]
0x28f4ada: mov rcx, r14
0x28f4add: call 0x142a00070
0x28f4ae2: nop 
0x28f4ae3: mov qword ptr [rbp + 0x368], rbx
0x28f4aea: mov qword ptr [rbp + 0x78], rdi
0x28f4aee: mov qword ptr [rbp + 0x80], 0
0x28f4af9: mov rdx, r15
0x28f4afc: test r14, r14
0x28f4aff: cmove rdx, rdi
0x28f4b03: mov rdx, qword ptr [rdx]
0x28f4b06: lea rcx, [rbp - 0x80]
0x28f4b0a: call 0x140393df0
0x28f4b0f: nop 
0x28f4b10: mov rbx, qword ptr [r13 + 0x110]
0x28f4b17: mov eax, dword ptr [r13 + 0x118]
0x28f4b1e: imul rdi, rax, 0x38
0x28f4b22: add rdi, rbx
0x28f4b25: cmp rbx, rdi
0x28f4b28: je 0x1428f4ce1
0x28f4b2e: mov r15d, dword ptr [rbp + 0x60]
0x28f4b32: xor r14d, r14d
0x28f4b35: mov r12d, 0x1fd
0x28f4b3b: nop dword ptr [rax + rax]
0x28f4b40: mov qword ptr [rbp + 0x108], r14
0x28f4b47: mov qword ptr [rbp + 0x110], r14
0x28f4b4e: movzx eax, word ptr [rbx]
0x28f4b51: mov word ptr [rbp + 0x120], ax
0x28f4b58: mov qword ptr [rbp + 0x128], r14
0x28f4b5f: mov qword ptr [rbp + 0x130], r14
0x28f4b66: mov rax, qword ptr [rbp + 0x108]
0x28f4b6d: mov qword ptr [rbp + 0x128], rax
0x28f4b74: mov qword ptr [rbp + 0x108], r14
0x28f4b7b: mov eax, dword ptr [rbp + 0x110]
0x28f4b81: mov dword ptr [rbp + 0x130], eax
0x28f4b87: mov dword ptr [rbp + 0x110], r14d
0x28f4b8e: mov eax, dword ptr [rbp + 0x114]
0x28f4b94: mov dword ptr [rbp + 0x134], eax
0x28f4b9a: mov dword ptr [rbp + 0x114], r14d
0x28f4ba1: or r15d, 0x10
0x28f4ba5: mov dword ptr [rbp + 0x38], r15d
0x28f4ba9: mov eax, dword ptr [rbp + 0x80]
0x28f4baf: cmp dword ptr [rbp + 0x84], eax
0x28f4bb5: ja 0x1428f4bc8
0x28f4bb7: mov edx, eax
0x28f4bb9: lea rcx, [rbp + 0x78]
0x28f4bbd: call 0x1404a8520
0x28f4bc2: mov eax, dword ptr [rbp + 0x80]
0x28f4bc8: lea rcx, [rax + rax*2]
0x28f4bcc: mov rax, qword ptr [rbp + 0x78]
0x28f4bd0: lea rdx, [rax + rcx*8]
0x28f4bd4: mov qword ptr [rbp - 0x20], rdx
0x28f4bd8: movzx eax, word ptr [rbp + 0x120]
0x28f4bdf: mov word ptr [rdx], ax
0x28f4be2: mov qword ptr [rdx + 8], r14
0x28f4be6: mov qword ptr [rdx + 0x10], r14
0x28f4bea: mov rax, qword ptr [rbp + 0x128]
0x28f4bf1: mov qword ptr [rdx + 8], rax
0x28f4bf5: mov qword ptr [rbp + 0x128], r14
0x28f4bfc: mov ecx, dword ptr [rdx + 0x10]
0x28f4bff: mov eax, dword ptr [rbp + 0x130]
0x28f4c05: mov dword ptr [rdx + 0x10], eax
0x28f4c08: mov dword ptr [rbp + 0x130], ecx
0x28f4c0e: mov ecx, dword ptr [rdx + 0x14]
0x28f4c11: mov eax, dword ptr [rbp + 0x134]
0x28f4c17: mov dword ptr [rdx + 0x14], eax
0x28f4c1a: mov dword ptr [rbp + 0x134], ecx
0x28f4c20: inc dword ptr [rbp + 0x80]
0x28f4c26: and r15d, 0xffffffef
0x28f4c2a: mov dword ptr [rbp + 0x38], r15d
0x28f4c2e: mov rcx, qword ptr [rbp + 0x128]
0x28f4c35: test rcx, rcx
0x28f4c38: je 0x1428f4c59
0x28f4c3a: mov rax, qword ptr gs:[0x58]
0x28f4c43: mov rdx, qword ptr [rax]
0x28f4c46: cmp byte ptr [r12 + rdx], 0
0x28f4c4b: je 0x1428f4c54
0x28f4c4d: call 0x1447f03bc
0x28f4c52: jmp 0x1428f4c59
0x28f4c54: call 0x1447f02bc
0x28f4c59: mov qword ptr [rbp + 0x128], r14
0x28f4c60: mov qword ptr [rbp + 0x130], r14
0x28f4c67: mov rcx, qword ptr [rbp + 0x108]
0x28f4c6e: test rcx, rcx
0x28f4c71: je 0x1428f4c92
0x28f4c73: mov rax, qword ptr gs:[0x58]
0x28f4c7c: mov rdx, qword ptr [rax]
0x28f4c7f: cmp byte ptr [r12 + rdx], 0
0x28f4c84: je 0x1428f4c8d
0x28f4c86: call 0x1447f03bc
0x28f4c8b: jmp 0x1428f4c92
0x28f4c8d: call 0x1447f02bc
0x28f4c92: mov qword ptr [rbp + 0x108], r14
0x28f4c99: mov qword ptr [rbp + 0x110], r14
0x28f4ca0: mov eax, dword ptr [rbp + 0x80]
0x28f4ca6: dec eax
0x28f4ca8: mov ecx, eax
0x28f4caa: lea rdx, [rax*2 + 1]
0x28f4cb2: mov rax, qword ptr [rbp + 0x78]
0x28f4cb6: add rdx, rcx
0x28f4cb9: lea rdx, [rax + rdx*8]
0x28f4cbd: mov rcx, rbx
0x28f4cc0: call 0x142129c60
0x28f4cc5: add rbx, 0x38
0x28f4cc9: cmp rbx, rdi
0x28f4ccc: jne 0x1428f4b40
0x28f4cd2: mov dword ptr [rbp + 0x60], r15d
0x28f4cd6: mov r14, qword ptr [rbp + 0x8a80]
0x28f4cdd: mov r12, qword ptr [rbp - 0x78]
0x28f4ce1: mov rcx, qword ptr [rbp - 0x80]
0x28f4ce5: mov rax, qword ptr [rcx]
0x28f4ce8: mov r8, qword ptr [rax + 0x20]
0x28f4cec: mov dl, 1
0x28f4cee: call r8
0x28f4cf1: mov rdi, qword ptr [rbp + 0x78]
0x28f4cf5: mov eax, dword ptr [rbp + 0x80]
0x28f4cfb: lea rcx, [rax + rax*2]
0x28f4cff: lea r15, [rdi + rcx*8]
0x28f4d03: cmp rdi, r15
0x28f4d06: je 0x1428f4d6f
0x28f4d08: lea r12, [rip + 0x32306e9]
0x28f4d0f: nop 
0x28f4d10: movzx edx, word ptr [rdi]
0x28f4d13: mov rcx, r13
0x28f4d16: call 0x142b571f0
0x28f4d1b: mov ecx, dword ptr [rdi + 0x10]
0x28f4d1e: test ecx, ecx
0x28f4d20: je 0x1428f4d62
0x28f4d22: mov rax, qword ptr [rdi + 8]
0x28f4d26: mov qword ptr [rbp - 0x50], rax
0x28f4d2a: mov dword ptr [rbp - 0x48], ecx
0x28f4d2d: mov rcx, rdi
0x28f4d30: call 0x1409cb1d0
0x28f4d35: mov rbx, rax
0x28f4d38: mov rdx, r14
0x28f4d3b: lea rcx, [rbp + 0x970]
0x28f4d42: call 0x142a757a0
0x28f4d47: nop 
0x28f4d48: lea r9, [rbp - 0x50]
0x28f4d4c: mov r8, rbx
0x28f4d4f: mov rdx, rax
0x28f4d52: mov rcx, r14
0x28f4d55: call 0x1429ff680
0x28f4d5a: nop 
0x28f4d5b: mov qword ptr [rbp + 0x970], r12
0x28f4d62: add rdi, 0x18
0x28f4d66: cmp rdi, r15
0x28f4d69: jne 0x1428f4d10
0x28f4d6b: mov r12, qword ptr [rbp - 0x78]
0x28f4d6f: mov rdx, qword ptr [rbp + 0x78]
0x28f4d73: xor r15d, r15d
0x28f4d76: test rdx, rdx
0x28f4d79: je 0x1428f4db5
0x28f4d7b: mov ebx, r15d
0x28f4d7e: cmp dword ptr [rbp + 0x80], r15d
0x28f4d85: jbe 0x1428f4dad
0x28f4d87: nop word ptr [rax + rax]
0x28f4d90: mov eax, ebx
0x28f4d92: lea rcx, [rax + rax*2]
0x28f4d96: lea rcx, [rdx + rcx*8]
0x28f4d9a: call 0x140423920
0x28f4d9f: inc ebx
0x28f4da1: mov rdx, qword ptr [rbp + 0x78]
0x28f4da5: cmp ebx, dword ptr [rbp + 0x80]
0x28f4dab: jb 0x1428f4d90
0x28f4dad: mov rcx, rdx
0x28f4db0: call 0x140410420
0x28f4db5: mov qword ptr [rbp + 0x78], r15
0x28f4db9: mov qword ptr [rbp + 0x80], 0
0x28f4dc4: mov rcx, qword ptr [rbp + 0x148]
0x28f4dcb: mov edi, 0x1fd
0x28f4dd0: test rcx, rcx
0x28f4dd3: je 0x1428f4df3
0x28f4dd5: mov rax, qword ptr gs:[0x58]
0x28f4dde: mov rdx, qword ptr [rax]
0x28f4de1: cmp byte ptr [rdi + rdx], 0
0x28f4de5: je 0x1428f4dee
0x28f4de7: call 0x1447f03bc
0x28f4dec: jmp 0x1428f4df3
0x28f4dee: call 0x1447f02bc
0x28f4df3: mov qword ptr [rbp + 0x148], r15
0x28f4dfa: mov qword ptr [rbp + 0x150], 0
0x28f4e05: mov rcx, qword ptr [rbp + 0x158]
0x28f4e0c: test rcx, rcx
0x28f4e0f: je 0x1428f4e33
0x28f4e11: mov r8d, edi
0x28f4e14: mov rax, qword ptr gs:[0x58]
0x28f4e1d: mov rdx, qword ptr [rax]
0x28f4e20: cmp byte ptr [r8 + rdx], 0
0x28f4e25: je 0x1428f4e2e
0x28f4e27: call 0x1447f03bc
0x28f4e2c: jmp 0x1428f4e33
0x28f4e2e: call 0x1447f02bc
0x28f4e33: mov qword ptr [rbp + 0x158], r15
0x28f4e3a: mov qword ptr [rbp + 0x160], 0
0x28f4e45: test r12, r12
0x28f4e48: je 0x1428f4e6f
0x28f4e4a: mov r8d, edi
0x28f4e4d: mov rax, qword ptr gs:[0x58]
0x28f4e56: mov rdx, qword ptr [rax]
0x28f4e59: mov rcx, r12
0x28f4e5c: cmp byte ptr [r8 + rdx], 0
0x28f4e61: je 0x1428f4e6a
0x28f4e63: call 0x1447f03bc
0x28f4e68: jmp 0x1428f4e6f
0x28f4e6a: call 0x1447f02bc
0x28f4e6f: mov qword ptr [rbp - 0x78], r15
0x28f4e73: mov qword ptr [rbp - 0x70], 0
0x28f4e7b: test rsi, rsi
0x28f4e7e: je 0x1428f4ea3
0x28f4e80: mov edx, edi
0x28f4e82: mov rax, qword ptr gs:[0x58]
0x28f4e8b: mov rcx, qword ptr [rax]
0x28f4e8e: cmp byte ptr [rdx + rcx], 0
0x28f4e92: mov rcx, rsi
0x28f4e95: je 0x1428f4e9e
0x28f4e97: call 0x1447f03bc
0x28f4e9c: jmp 0x1428f4ea3
0x28f4e9e: call 0x1447f02bc
0x28f4ea3: mov qword ptr [rbp + 0x10], r15
0x28f4ea7: mov qword ptr [rbp + 0x18], 0
0x28f4eaf: mov rcx, qword ptr [rbp + 0x168]
0x28f4eb6: test rcx, rcx
0x28f4eb9: je 0x1428f4edd
0x28f4ebb: mov r8d, edi
0x28f4ebe: mov rax, qword ptr gs:[0x58]
0x28f4ec7: mov rdx, qword ptr [rax]
0x28f4eca: cmp byte ptr [r8 + rdx], 0
0x28f4ecf: je 0x1428f4ed8
0x28f4ed1: call 0x1447f03bc
0x28f4ed6: jmp 0x1428f4edd
0x28f4ed8: call 0x1447f02bc
0x28f4edd: mov qword ptr [rbp + 0x168], r15
0x28f4ee4: mov qword ptr [rbp + 0x170], 0
0x28f4eef: mov rcx, qword ptr [rsp + 0x70]
0x28f4ef4: test rcx, rcx
0x28f4ef7: je 0x1428f4f1b
0x28f4ef9: mov r8d, edi
0x28f4efc: mov rax, qword ptr gs:[0x58]
0x28f4f05: mov rdx, qword ptr [rax]
0x28f4f08: cmp byte ptr [r8 + rdx], 0
0x28f4f0d: je 0x1428f4f16
0x28f4f0f: call 0x1447f03bc
0x28f4f14: jmp 0x1428f4f1b
0x28f4f16: call 0x1447f02bc
0x28f4f1b: mov qword ptr [rsp + 0x70], r15
0x28f4f20: mov qword ptr [rsp + 0x78], 0
0x28f4f29: mov r9, qword ptr [rbp + 0xd0]
0x28f4f30: test r9, r9
0x28f4f33: je 0x1428f4f8b
0x28f4f35: mov ebx, r15d
0x28f4f38: cmp dword ptr [rbp + 0xd8], 0
0x28f4f3f: jbe 0x1428f4f61
0x28f4f41: mov eax, ebx
0x28f4f43: lea rcx, [rax + rax*2]
0x28f4f47: lea rcx, [r9 + rcx*8]
0x28f4f4b: call 0x140423920
0x28f4f50: inc ebx
0x28f4f52: mov r9, qword ptr [rbp + 0xd0]
0x28f4f59: cmp ebx, dword ptr [rbp + 0xd8]
0x28f4f5f: jb 0x1428f4f41
0x28f4f61: test r9, r9
0x28f4f64: je 0x1428f4f8b
0x28f4f66: mov r8d, edi
0x28f4f69: mov rax, qword ptr gs:[0x58]
0x28f4f72: mov rdx, qword ptr [rax]
0x28f4f75: mov rcx, r9
0x28f4f78: cmp byte ptr [r8 + rdx], 0
0x28f4f7d: je 0x1428f4f86
0x28f4f7f: call 0x1447f03bc
0x28f4f84: jmp 0x1428f4f8b
0x28f4f86: call 0x1447f02bc
0x28f4f8b: mov qword ptr [rbp + 0xd0], r15
0x28f4f92: mov qword ptr [rbp + 0xd8], 0
0x28f4f9d: mov rcx, qword ptr [rbp + 0xa0]
0x28f4fa4: test rcx, rcx
0x28f4fa7: je 0x1428f4fcb
0x28f4fa9: mov r8d, edi
0x28f4fac: mov rax, qword ptr gs:[0x58]
0x28f4fb5: mov rdx, qword ptr [rax]
0x28f4fb8: cmp byte ptr [r8 + rdx], 0
0x28f4fbd: je 0x1428f4fc6
0x28f4fbf: call 0x1447f03bc
0x28f4fc4: jmp 0x1428f4fcb
0x28f4fc6: call 0x1447f02bc
0x28f4fcb: mov qword ptr [rbp + 0xa0], r15
0x28f4fd2: mov qword ptr [rbp + 0xa8], 0
0x28f4fdd: mov rax, qword ptr [r14 + 0x68]
0x28f4fe1: mov r8, qword ptr [rax + 0xd0]
0x28f4fe8: test r8, r8
0x28f4feb: je 0x1428f51e7
0x28f4ff1: lea rcx, [rbp + 0x1d60]
0x28f4ff8: call 0x14038a180
0x28f4ffd: nop 
0x28f4ffe: lea rax, [rbp + 0x1d60]
0x28f5005: mov qword ptr [rbp + 0x5c8], rax
0x28f500c: mov qword ptr [rbp + 0x5d0], r15
0x28f5013: lea rdx, [rbp + 0x5c8]
0x28f501a: mov rcx, r8
0x28f501d: call 0x142c0a990
0x28f5022: mov rdi, qword ptr [rbp + 0x1d60]
0x28f5029: lea rcx, [rbp + 0x1d60]
0x28f5030: call 0x1428fe150
0x28f5035: mov rsi, rax
0x28f5038: cmp rdi, rax
0x28f503b: je 0x1428f516b
0x28f5041: lea r12, [rip + 0x32303b0]
0x28f5048: nop dword ptr [rax + rax]
0x28f5050: lea rax, [rbp + 0x5fd0]
0x28f5057: mov qword ptr [rbp + 0x5fc0], rax
0x28f505e: mov dword ptr [rbp + 0x5fc8], r15d
0x28f5065: mov dword ptr [rbp + 0x5fcc], 0x20
0x28f506f: lea rax, [rbp + 0x5fc0]
0x28f5076: mov qword ptr [rbp + 0x5d8], rax
0x28f507d: mov qword ptr [rbp + 0x5e0], r15
0x28f5084: lea rdx, [rbp + 0x5d8]
0x28f508b: mov rcx, rdi
0x28f508e: call 0x1421f1d10
0x28f5093: mov rax, qword ptr [rbp + 0x5fc0]
0x28f509a: mov qword ptr [rbp - 0x50], rax
0x28f509e: mov eax, dword ptr [rbp + 0x5fc8]
0x28f50a4: mov dword ptr [rbp - 0x48], eax
0x28f50a7: mov rax, qword ptr [rdi + 0x10]
0x28f50ab: mov qword ptr [rbp + 0x408], rax
0x28f50b2: lea rcx, [rdi + 8]
0x28f50b6: call 0x14066f7b0
0x28f50bb: mov rbx, rax
0x28f50be: mov qword ptr [rbp + 0x380], r12
0x28f50c5: mov byte ptr [rbp + 0x388], 0
0x28f50cc: lea rax, [rip + 0x3230365]
0x28f50d3: mov qword ptr [rbp + 0x380], rax
0x28f50da: mov qword ptr [rbp + 0x390], r15
0x28f50e1: mov rcx, qword ptr [r14]
0x28f50e4: mov rdx, qword ptr [rcx + 0xe8]
0x28f50eb: mov rcx, r14
0x28f50ee: call rdx
0x28f50f0: mov qword ptr [rbp + 0x390], rax
0x28f50f7: lea rax, [rbp - 0x50]
0x28f50fb: mov qword ptr [rsp + 0x20], rax
0x28f5100: lea r9, [rbp + 0x408]
0x28f5107: mov r8, rbx
0x28f510a: lea rdx, [rbp + 0x380]
0x28f5111: mov rcx, r14
0x28f5114: call 0x1429f7d30
0x28f5119: nop 
0x28f511a: mov qword ptr [rbp + 0x380], r12
0x28f5121: lea rax, [rbp + 0x5fd0]
0x28f5128: mov rcx, qword ptr [rbp + 0x5fc0]
0x28f512f: cmp rcx, rax
0x28f5132: je 0x1428f515e
0x28f5134: test rcx, rcx
0x28f5137: je 0x1428f515e
0x28f5139: mov r8d, 0x1fd
0x28f513f: mov rax, qword ptr gs:[0x58]
0x28f5148: mov rdx, qword ptr [rax]
0x28f514b: cmp byte ptr [r8 + rdx], 0
0x28f5150: je 0x1428f5159
0x28f5152: call 0x1447f03bc
0x28f5157: jmp 0x1428f515e
0x28f5159: call 0x1447f02bc
0x28f515e: add rdi, 0x48
0x28f5162: cmp rdi, rsi
0x28f5165: jne 0x1428f5050
0x28f516b: mov rdi, qword ptr [rbp + 0x1d60]
0x28f5172: mov eax, dword ptr [rbp + 0x1d68]
0x28f5178: lea rcx, [rax + rax*8]
0x28f517c: lea rbx, [rdi + rcx*8]
0x28f5180: cmp rbx, rdi
0x28f5183: je 0x1428f51a7
0x28f5185: nop word ptr [rax + rax]
0x28f5190: sub rbx, 0x48
0x28f5194: mov rax, qword ptr [rbx]
0x28f5197: mov r8, qword ptr [rax]
0x28f519a: xor edx, edx
0x28f519c: mov rcx, rbx
0x28f519f: call r8
0x28f51a2: cmp rbx, rdi
0x28f51a5: jne 0x1428f5190
0x28f51a7: lea rax, [rbp + 0x1d70]
0x28f51ae: mov rcx, qword ptr [rbp + 0x1d60]
0x28f51b5: mov r13d, 0x1fd
0x28f51bb: cmp rcx, rax
0x28f51be: je 0x1428f51ed
0x28f51c0: test rcx, rcx
0x28f51c3: je 0x1428f51ed
0x28f51c5: mov rax, qword ptr gs:[0x58]
0x28f51ce: mov rdx, qword ptr [rax]
0x28f51d1: cmp byte ptr [r13 + rdx], 0
0x28f51d7: je 0x1428f51e0
0x28f51d9: call 0x1447f03bc
0x28f51de: jmp 0x1428f51ed
0x28f51e0: call 0x1447f02bc
0x28f51e5: jmp 0x1428f51ed
0x28f51e7: mov r13d, 0x1fd
0x28f51ed: mov rax, qword ptr [r14 + 0x68]
0x28f51f1: mov rdi, qword ptr [rax + 0xe8]
0x28f51f8: test rdi, rdi
0x28f51fb: je 0x1428f5371
0x28f5201: mov byte ptr [rbp + 0xca0], 0
0x28f5208: lea rdx, [r14 + 8]
0x28f520c: test r14, r14
0x28f520f: cmove rdx, r15
0x28f5213: mov rdx, qword ptr [rdx]
0x28f5216: lea rcx, [rbp - 0x80]
0x28f521a: call 0x140393df0
0x28f521f: nop 
0x28f5220: add rdi, 0x18
0x28f5224: mov qword ptr [rbp + 0x1a8], r15
0x28f522b: lea r12, [rip + 0x417070e]
0x28f5232: je 0x1428f526b
0x28f5234: cmp byte ptr [rdi], 0
0x28f5237: je 0x1428f526b
0x28f5239: mov rbx, 0xffffffffffffffff
0x28f5240: inc rbx
0x28f5243: cmp byte ptr [rdi + rbx], 0
0x28f5247: jne 0x1428f5240
0x28f5249: mov ecx, ebx
0x28f524b: call 0x1414203f0
0x28f5250: mov rsi, rax
0x28f5253: lea edx, [rbx + 1]
0x28f5256: mov r9, 0xffffffffffffffff
0x28f525d: mov r8, rdi
0x28f5260: mov rcx, qword ptr [rax]
0x28f5263: call qword ptr [rip + 0x28f7247]
0x28f5269: jmp 0x1428f526e
0x28f526b: mov rsi, r12
0x28f526e: mov qword ptr [rbp + 0x1a8], rsi
0x28f5275: mov ebx, dword ptr [rbp + 0x60]
0x28f5278: or ebx, 0x20
0x28f527b: mov dword ptr [rbp + 0x38], ebx
0x28f527e: mov r9, 0xffffffffffffffff
0x28f5285: mov r8, qword ptr [rsi]
0x28f5288: mov edx, 0x33
0x28f528d: lea rcx, [rbp + 0xca0]
0x28f5294: call qword ptr [rip + 0x28f7216]
0x28f529a: and ebx, 0xffffffdf
0x28f529d: mov dword ptr [rbp + 0x60], ebx
0x28f52a0: mov dword ptr [rbp + 0x38], ebx
0x28f52a3: mov rbx, qword ptr [rbp + 0x1a8]
0x28f52aa: cmp rbx, r12
0x28f52ad: je 0x1428f52f7
0x28f52af: mov eax, dword ptr [rbx + 0x10]
0x28f52b2: test eax, eax
0x28f52b4: js 0x1428f52f7
0x28f52b6: mov eax, 0xffffffff
0x28f52bb: lock xadd dword ptr [rbx + 0x10], eax
0x28f52c0: cmp eax, 1
0x28f52c3: jne 0x1428f52f7
0x28f52c5: test rbx, rbx
0x28f52c8: je 0x1428f52f7
0x28f52ca: mov rcx, rbx
0x28f52cd: call 0x141420360
0x28f52d2: mov r8d, r13d
0x28f52d5: mov rax, qword ptr gs:[0x58]
0x28f52de: mov rdx, qword ptr [rax]
0x28f52e1: mov rcx, rbx
0x28f52e4: cmp byte ptr [r8 + rdx], 0
0x28f52e9: je 0x1428f52f2
0x28f52eb: call 0x1447f03bc
0x28f52f0: jmp 0x1428f52f7
0x28f52f2: call 0x1447f02bc
0x28f52f7: mov qword ptr [rbp + 0x1a8], r12
0x28f52fe: mov rcx, qword ptr [rbp - 0x80]
0x28f5302: mov rax, qword ptr [rcx]
0x28f5305: mov r8, qword ptr [rax + 0x20]
0x28f5309: mov dl, 1
0x28f530b: call r8
0x28f530e: cmp byte ptr [rbp + 0xca0], 0
0x28f5315: je 0x1428f5371
0x28f5317: mov byte ptr [rbp - 0xc], 1
0x28f531b: lea rdx, [rbp + 0xca0]
0x28f5322: lea rcx, [rbp + 0xcd8]
0x28f5329: call 0x1413ac640
0x28f532e: mov rbx, rax
0x28f5331: mov rcx, qword ptr [r14]
0x28f5334: mov rdx, qword ptr [rcx + 0xe8]
0x28f533b: mov rcx, r14
0x28f533e: call rdx
0x28f5340: mov rdx, rax
0x28f5343: lea rcx, [rbp + 0x988]
0x28f534a: call 0x142a75710
0x28f534f: nop 
0x28f5350: lea r9, [rbp - 0xc]
0x28f5354: mov r8, rbx
0x28f5357: mov rdx, rax
0x28f535a: mov rcx, r14
0x28f535d: call 0x142a69020
0x28f5362: nop 
0x28f5363: lea rax, [rip + 0x323008e]
0x28f536a: mov qword ptr [rbp + 0x988], rax
0x28f5371: mov rax, qword ptr [r14 + 0x68]
0x28f5375: mov rbx, qword ptr [rax + 0xf0]
0x28f537c: mov qword ptr [rbp + 0x98], rbx
0x28f5383: mov qword ptr [rbp + 0x178], r15
0x28f538a: mov qword ptr [rbp + 0x180], 0
0x28f5395: mov rsi, r15
0x28f5398: mov qword ptr [rsp + 0x70], r15
0x28f539d: mov edi, r15d
0x28f53a0: mov qword ptr [rsp + 0x78], 0
0x28f53a9: lea rdx, [r14 + 8]
0x28f53ad: test r14, r14
0x28f53b0: mov r14d, 0
0x28f53b6: cmove rdx, r14
0x28f53ba: mov rdx, qword ptr [rdx]
0x28f53bd: lea rcx, [rbp - 0x80]
0x28f53c1: call 0x140393df0
0x28f53c6: nop 
0x28f53c7: lea rdx, [rbx + 0x58]
0x28f53cb: lea rcx, [rbp + 0x178]
0x28f53d2: call 0x140a1aeb0
0x28f53d7: lea r12, [rbx + 0x38]
0x28f53db: mov edx, dword ptr [r12 + 4]
0x28f53e0: mov dword ptr [rsp + 0x68], edx
0x28f53e4: test edx, edx
0x28f53e6: jne 0x1428f53ff
0x28f53e8: mov r12d, r14d
0x28f53eb: mov ecx, r14d
0x28f53ee: mov edx, 0xffffffff
0x28f53f3: mov r13d, edx
0x28f53f6: mov r14d, edx
0x28f53f9: mov dword ptr [rsp + 0x68], edx
0x28f53fd: jmp 0x1428f5410
0x28f53ff: mov rax, qword ptr [r12 + 0x18]
0x28f5404: mov rcx, qword ptr [rax]
0x28f5407: mov r13d, r14d
0x28f540a: mov r14d, dword ptr [r12 + 0xc]
0x28f540f: nop 
0x28f5410: test rcx, rcx
0x28f5413: je 0x1428f5558
0x28f5419: cmp dword ptr [r12 + 0xc], r14d
0x28f541e: jne 0x1428f5558
0x28f5424: mov eax, dword ptr [rcx + 4]
0x28f5427: mov dword ptr [rbp + 0x5e8], eax
0x28f542d: mov rax, qword ptr [rcx + 8]
0x28f5431: mov qword ptr [rbp + 0x5f0], rax
0x28f5438: cmp r15d, edi
0x28f543b: ja 0x1428f5521
0x28f5441: lea ebx, [r15*2 + 1]
0x28f5449: add ebx, r15d
0x28f544c: shr ebx, 1
0x28f544e: cmp ebx, 1
0x28f5451: mov eax, 1
0x28f5456: cmovb ebx, eax
0x28f5459: cmp edi, ebx
0x28f545b: cmova ebx, edi
0x28f545e: cmp ebx, r15d
0x28f5461: jbe 0x1428f5521
0x28f5467: mov ecx, ebx
0x28f5469: shl ecx, 4
0x28f546c: mov r8d, 0x1fd
0x28f5472: mov rax, qword ptr gs:[0x58]
0x28f547b: mov rdx, qword ptr [rax]
0x28f547e: cmp byte ptr [r8 + rdx], 0
0x28f5483: mov edx, 8
0x28f5488: je 0x1428f5491
0x28f548a: call 0x1447efa78
0x28f548f: jmp 0x1428f5496
0x28f5491: call 0x1447ef9b0
0x28f5496: mov r15, rax
0x28f5499: test rax, rax
0x28f549c: jne 0x1428f54b9
0x28f549e: call 0x141318e70
0x28f54a3: xor r9d, r9d
0x28f54a6: xor r8d, r8d
0x28f54a9: mov edx, 1
0x28f54ae: mov ecx, 0xa0000002
0x28f54b3: call qword ptr [rip + 0x28f5c8f]
0x28f54b9: test edi, edi
0x28f54bb: je 0x1428f54e3
0x28f54bd: mov rax, r15
0x28f54c0: mov rcx, rsi
0x28f54c3: sub rcx, r15
0x28f54c6: mov edx, edi
0x28f54c8: nop dword ptr [rax + rax]
0x28f54d0: vmovups xmm0, xmmword ptr [rcx + rax]
0x28f54d5: vmovups xmmword ptr [rax], xmm0
0x28f54d9: lea rax, [rax + 0x10]
0x28f54dd: sub rdx, 1
0x28f54e1: jne 0x1428f54d0
0x28f54e3: test rsi, rsi
0x28f54e6: je 0x1428f550e
0x28f54e8: mov rax, qword ptr gs:[0x58]
0x28f54f1: mov rdx, qword ptr [rax]
0x28f54f4: mov ecx, 0x1fd
0x28f54f9: cmp byte ptr [rcx + rdx], 0
0x28f54fd: mov rcx, rsi
0x28f5500: je 0x1428f5509
0x28f5502: call 0x1447f03bc
0x28f5507: jmp 0x1428f550e
0x28f5509: call 0x1447f02bc
0x28f550e: mov rsi, r15
0x28f5511: mov qword ptr [rsp + 0x70], r15
0x28f5516: mov r15d, ebx
0x28f5519: mov dword ptr [rsp + 0x7c], ebx
0x28f551d: mov edx, dword ptr [rsp + 0x68]
0x28f5521: mov eax, edi
0x28f5523: add rax, rax
0x28f5526: vmovups xmm0, xmmword ptr [rbp + 0x5e8]
0x28f552e: vmovups xmmword ptr [rsi + rax*8], xmm0
0x28f5533: inc edi
0x28f5535: mov dword ptr [rsp + 0x78], edi
0x28f5539: inc r13d
0x28f553c: cmp r13d, edx
0x28f553f: jae 0x1428f554f
0x28f5541: mov rax, qword ptr [r12 + 0x18]
0x28f5546: mov rcx, qword ptr [rax + r13*8]
0x28f554a: jmp 0x1428f5410
0x28f554f: xor eax, eax
0x28f5551: mov ecx, eax
0x28f5553: jmp 0x1428f5410
0x28f5558: mov rcx, qword ptr [rbp - 0x80]
0x28f555c: mov rax, qword ptr [rcx]
0x28f555f: mov r8, qword ptr [rax + 0x20]
0x28f5563: mov dl, 1
0x28f5565: call r8
0x28f5568: mov rbx, qword ptr [rbp + 0x178]
0x28f556f: mov eax, dword ptr [rbp + 0x180]
0x28f5575: imul r15, rax, 0x150
0x28f557c: add r15, rbx
0x28f557f: cmp rbx, r15
0x28f5582: mov r14, qword ptr [rbp + 0x8a80]
0x28f5589: mov r13, qword ptr [rbp + 0x98]
0x28f5590: je 0x1428f5678
0x28f5596: nop word ptr [rax + rax]
0x28f55a0: mov r8d, dword ptr [rbx + 0x13c]
0x28f55a7: lea rdx, [rbp + 0x878]
0x28f55ae: mov rcx, qword ptr [rip + 0x44740f3]
0x28f55b5: mov rcx, qword ptr [rcx]
0x28f55b8: call 0x142a827b0
0x28f55bd: nop 
0x28f55be: cmp byte ptr [rbp + 0x888], 0
0x28f55c5: je 0x1428f565c
0x28f55cb: xor edx, edx
0x28f55cd: lea rcx, [rbp + 0x730]
0x28f55d4: call 0x1427a7e50
0x28f55d9: nop 
0x28f55da: mov r8d, dword ptr [rbx + 0x138]
0x28f55e1: test r8d, r8d
0x28f55e4: je 0x1428f5643
0x28f55e6: lea rdx, [rbp + 0xd08]
0x28f55ed: mov rcx, qword ptr [rip + 0x44740b4]
0x28f55f4: mov rcx, qword ptr [rcx]
0x28f55f7: call 0x142a82150
0x28f55fc: nop 
0x28f55fd: mov rdx, rax
0x28f5600: lea rcx, [rbp + 0x858]
0x28f5607: call 0x142804d70
0x28f560c: nop 
0x28f560d: lea rdx, [rbp + 0x858]
0x28f5614: lea rcx, [rbp + 0x730]
0x28f561b: call 0x140360940
0x28f5620: nop 
0x28f5621: lea rcx, [rbp + 0x858]
0x28f5628: call 0x1403608f0
0x28f562d: nop 
0x28f562e: lea rcx, [rbp + 0xd08]
0x28f5635: call 0x1403608f0
0x28f563a: cmp byte ptr [rbp + 0x740], 0
0x28f5641: je 0x1428f564f
0x28f5643: mov rdx, rbx
0x28f5646: mov rcx, r13
0x28f5649: call 0x142bf35a0
0x28f564e: nop 
0x28f564f: lea rcx, [rbp + 0x730]
0x28f5656: call 0x1403608f0
0x28f565b: nop 
0x28f565c: lea rcx, [rbp + 0x878]
0x28f5663: call 0x1403608f0
0x28f5668: add rbx, 0x150
0x28f566f: cmp rbx, r15
0x28f5672: jne 0x1428f55a0
0x28f5678: test edi, edi
0x28f567a: je 0x1428f56ab
0x28f567c: mov rdx, r14
0x28f567f: lea rcx, [rbp + 0x9a0]
0x28f5686: call 0x142a757a0
0x28f568b: nop 
0x28f568c: lea r8, [rsp + 0x70]
0x28f5691: mov rdx, rax
0x28f5694: mov rcx, r14
0x28f5697: call 0x142a62af0
0x28f569c: nop 
0x28f569d: lea rax, [rip + 0x322fd54]
0x28f56a4: mov qword ptr [rbp + 0x9a0], rax
0x28f56ab: lea rdx, [r14 + 8]
0x28f56af: test r14, r14
0x28f56b2: mov edi, 0
0x28f56b7: cmove rdx, rdi
0x28f56bb: lea rcx, [rbp + 0x410]
0x28f56c2: call 0x140393e80
0x28f56c7: nop 
0x28f56c8: mov r12d, edi
0x28f56cb: mov qword ptr [rbp - 0x78], rdi
0x28f56cf: mov ebx, edi
0x28f56d1: mov dword ptr [rbp - 0x70], ebx
0x28f56d4: mov r15d, edi
0x28f56d7: mov dword ptr [rbp - 0x6c], edi
0x28f56da: mov rdi, qword ptr [r13 + 0x220]
0x28f56e1: mov eax, dword ptr [r13 + 0x228]
0x28f56e8: lea rax, [rdi + rax*2]
0x28f56ec: cmp rdi, rax
0x28f56ef: je 0x1428f57cd
0x28f56f5: mov r14, rax
0x28f56f8: mov esi, 1
0x28f56fd: nop dword ptr [rax]
0x28f5700: movzx eax, word ptr [rdi]
0x28f5703: mov word ptr [rsp + 0x60], ax
0x28f5708: lea rcx, [rsp + 0x60]
0x28f570d: call 0x1403880a0
0x28f5712: mov r13, rax
0x28f5715: cmp r15d, ebx
0x28f5718: ja 0x1428f5745
0x28f571a: lea edx, [r15*2 + 1]
0x28f5722: add edx, r15d
0x28f5725: shr edx, 1
0x28f5727: cmp edx, esi
0x28f5729: cmovb edx, esi
0x28f572c: cmp ebx, edx
0x28f572e: cmova edx, ebx
0x28f5731: lea rcx, [rbp - 0x78]
0x28f5735: call 0x1403d2af0
0x28f573a: mov r15d, dword ptr [rbp - 0x6c]
0x28f573e: mov ebx, dword ptr [rbp - 0x70]
0x28f5741: mov r12, qword ptr [rbp - 0x78]
0x28f5745: mov ecx, ebx
0x28f5747: mov eax, dword ptr [r13]
0x28f574b: mov dword ptr [r12 + rcx*4], eax
0x28f574f: inc ebx
0x28f5751: mov dword ptr [rbp - 0x70], ebx
0x28f5754: add rdi, 2
0x28f5758: cmp rdi, r14
0x28f575b: jne 0x1428f5700
0x28f575d: test ebx, ebx
0x28f575f: mov r14, qword ptr [rbp + 0x8a80]
0x28f5766: mov rsi, qword ptr [rsp + 0x70]
0x28f576b: je 0x1428f57cd
0x28f576d: lea rbx, [rip + 0x322fc84]
0x28f5774: mov qword ptr [rbp + 0x260], rbx
0x28f577b: mov byte ptr [rbp + 0x268], 0
0x28f5782: lea rax, [rip + 0x322fcaf]
0x28f5789: mov qword ptr [rbp + 0x260], rax
0x28f5790: xor r15d, r15d
0x28f5793: mov qword ptr [rbp + 0x270], r15
0x28f579a: mov rax, qword ptr [r14]
0x28f579d: mov rdx, qword ptr [rax + 0xe8]
0x28f57a4: mov rcx, r14
0x28f57a7: call rdx
0x28f57a9: mov qword ptr [rbp + 0x270], rax
0x28f57b0: lea r8, [rbp - 0x78]
0x28f57b4: lea rdx, [rbp + 0x260]
0x28f57bb: mov rcx, r14
0x28f57be: call 0x142a64250
0x28f57c3: nop 
0x28f57c4: mov qword ptr [rbp + 0x260], rbx
0x28f57cb: jmp 0x1428f57d0
0x28f57cd: xor r15d, r15d
0x28f57d0: mov ebx, 0x1fd
0x28f57d5: test r12, r12
0x28f57d8: je 0x1428f57fb
0x28f57da: mov rax, qword ptr gs:[0x58]
0x28f57e3: mov rdx, qword ptr [rax]
0x28f57e6: mov rcx, r12
0x28f57e9: cmp byte ptr [rbx + rdx], 0
0x28f57ed: je 0x1428f57f6
0x28f57ef: call 0x1447f03bc
0x28f57f4: jmp 0x1428f57fb
0x28f57f6: call 0x1447f02bc
0x28f57fb: mov qword ptr [rbp - 0x78], r15
0x28f57ff: mov qword ptr [rbp - 0x70], 0
0x28f5807: mov rcx, qword ptr [rbp + 0x410]
0x28f580e: mov rax, qword ptr [rcx]
0x28f5811: mov r8, qword ptr [rax + 0x20]
0x28f5815: mov dl, 1
0x28f5817: call r8
0x28f581a: nop 
0x28f581b: test rsi, rsi
0x28f581e: je 0x1428f5843
0x28f5820: mov edx, ebx
0x28f5822: mov rax, qword ptr gs:[0x58]
0x28f582b: mov rcx, qword ptr [rax]
0x28f582e: cmp byte ptr [rdx + rcx], 0
0x28f5832: mov rcx, rsi
0x28f5835: je 0x1428f583e
0x28f5837: call 0x1447f03bc
0x28f583c: jmp 0x1428f5843
0x28f583e: call 0x1447f02bc
0x28f5843: mov qword ptr [rsp + 0x70], r15
0x28f5848: mov qword ptr [rsp + 0x78], 0
0x28f5851: mov rcx, qword ptr [rbp + 0x178]
0x28f5858: test rcx, rcx
0x28f585b: je 0x1428f587f
0x28f585d: mov r8d, ebx
0x28f5860: mov rax, qword ptr gs:[0x58]
0x28f5869: mov rdx, qword ptr [rax]
0x28f586c: cmp byte ptr [r8 + rdx], 0
0x28f5871: je 0x1428f587a
0x28f5873: call 0x1447f03bc
0x28f5878: jmp 0x1428f587f
0x28f587a: call 0x1447f02bc
0x28f587f: mov qword ptr [rbp + 0x178], r15
0x28f5886: mov qword ptr [rbp + 0x180], 0
0x28f5891: mov rax, qword ptr [r14 + 0x68]
0x28f5895: mov r13, qword ptr [rax + 0x110]
0x28f589c: mov qword ptr [rbp + 0xe0], r13
0x28f58a3: test r13, r13
0x28f58a6: je 0x1428f692e
0x28f58ac: mov qword ptr [rbp + 0x50], r15
0x28f58b0: mov qword ptr [rbp + 0x58], 0
0x28f58b8: mov qword ptr [rsp + 0x70], r15
0x28f58bd: mov qword ptr [rsp + 0x78], 0
0x28f58c6: mov qword ptr [rbp - 0x78], r15
0x28f58ca: mov qword ptr [rbp - 0x70], 0
0x28f58d2: mov qword ptr [rbp - 0x50], r15
0x28f58d6: mov qword ptr [rbp - 0x48], 0
0x28f58de: mov qword ptr [rbp + 0x10], r15
0x28f58e2: mov qword ptr [rbp + 0x18], 0
0x28f58ea: mov qword ptr [rbp + 0x40], r15
0x28f58ee: mov qword ptr [rbp + 0x48], 0
0x28f58f6: mov r12, r15
0x28f58f9: mov qword ptr [rbp + 0xa0], r15
0x28f5900: mov edi, r15d
0x28f5903: mov qword ptr [rbp + 0xa8], 0
0x28f590e: mov esi, r15d
0x28f5911: mov qword ptr [rbp + 0xf8], r15
0x28f5918: mov qword ptr [rbp + 0x100], 0
0x28f5923: lea rdx, [r14 + 8]
0x28f5927: test r14, r14
0x28f592a: cmove rdx, r15
0x28f592e: mov rdx, qword ptr [rdx]
0x28f5931: lea rcx, [rbp - 0x80]
0x28f5935: call 0x140393df0
0x28f593a: nop 
0x28f593b: mov rbx, qword ptr [r13 + 0x18]
0x28f593f: mov eax, dword ptr [r13 + 0x20]
0x28f5943: lea r15, [rbx + rax*8]
0x28f5947: cmp rbx, r15
0x28f594a: je 0x1428f5968
0x28f594c: nop dword ptr [rax]
0x28f5950: mov rdx, qword ptr [rbx]
0x28f5953: lea rcx, [rbp + 0xf8]
0x28f595a: call 0x140d86b40
0x28f595f: add rbx, 8
0x28f5963: cmp rbx, r15
0x28f5966: jne 0x1428f5950
0x28f5968: lea rdx, [r13 + 0xa8]
0x28f596f: lea rcx, [rbp - 0x50]
0x28f5973: call 0x1403a1400
0x28f5978: movzx eax, byte ptr [r13 + 0xd4]
0x28f5980: mov byte ptr [rbp + 0x8a88], al
0x28f5986: mov rax, qword ptr [r13 + 0xd8]
0x28f598d: mov qword ptr [rbp - 0x20], rax
0x28f5991: lea rcx, [r13 + 0x88]
0x28f5998: call 0x140de44d0
0x28f599d: mov r15, rax
0x28f59a0: mov rbx, qword ptr [rcx]
0x28f59a3: cmp rbx, rax
0x28f59a6: je 0x1428f5a05
0x28f59a8: xor r14d, r14d
0x28f59ab: nop dword ptr [rax + rax]
0x28f59b0: mov dword ptr [rbp + 0x6c8], r14d
0x28f59b7: mov word ptr [rbp + 0x6cc], r14w
0x28f59bf: mov qword ptr [rbp + 0x6e0], r14
0x28f59c6: mov rcx, qword ptr [rbx]
0x28f59c9: mov qword ptr [rbp + 0x6d0], rcx
0x28f59d0: movzx ecx, byte ptr [rbx + 8]
0x28f59d4: mov byte ptr [rbp + 0x6d8], cl
0x28f59da: mov rax, qword ptr [rbx + 0x10]
0x28f59de: mov qword ptr [rbp + 0x6e8], rax
0x28f59e5: lea rdx, [rbp + 0x6c8]
0x28f59ec: lea rcx, [rbp + 0x10]
0x28f59f0: call 0x14096f7c0
0x28f59f5: add rbx, 0x28
0x28f59f9: cmp rbx, r15
0x28f59fc: jne 0x1428f59b0
0x28f59fe: mov r14, qword ptr [rbp + 0x8a80]
0x28f5a05: mov rbx, qword ptr [r13 + 0x98]
0x28f5a0c: mov r15d, dword ptr [r13 + 0xa0]
0x28f5a13: shl r15, 5
0x28f5a17: add r15, rbx
0x28f5a1a: cmp rbx, r15
0x28f5a1d: je 0x1428f5a7f
0x28f5a1f: xor r14d, r14d
0x28f5a22: mov dword ptr [rbp + 0x6f0], r14d
0x28f5a29: mov qword ptr [rbp + 0x6f8], 0xffffffffffffffff
0x28f5a34: mov byte ptr [rbp + 0x700], r14b
0x28f5a3b: mov qword ptr [rbp + 0x708], r14
0x28f5a42: mov rcx, rbx
0x28f5a45: call 0x1403896a0
0x28f5a4a: movzx ecx, word ptr [rax]
0x28f5a4d: mov word ptr [rbp + 0x6f4], cx
0x28f5a54: mov rax, qword ptr [rbx + 0x10]
0x28f5a58: mov qword ptr [rbp + 0x710], rax
0x28f5a5f: lea rdx, [rbp + 0x6f0]
0x28f5a66: lea rcx, [rbp + 0x40]
0x28f5a6a: call 0x14096f7c0
0x28f5a6f: add rbx, 0x20
0x28f5a73: cmp rbx, r15
0x28f5a76: jne 0x1428f5a22
0x28f5a78: mov r14, qword ptr [rbp + 0x8a80]
0x28f5a7f: lea rdx, [rbp + 0x200]
0x28f5a86: mov rcx, r13
0x28f5a89: call 0x142b97d20
0x28f5a8e: nop 
0x28f5a8f: mov r15, qword ptr [rbp + 0x200]
0x28f5a96: mov r13d, dword ptr [rbp + 0x208]
0x28f5a9d: shl r13, 4
0x28f5aa1: add r13, r15
0x28f5aa4: cmp r15, r13
0x28f5aa7: je 0x1428f5bd8
0x28f5aad: mov r14d, 1
0x28f5ab3: mov rbx, qword ptr [r15 + 8]
0x28f5ab7: mov rcx, r15
0x28f5aba: call 0x1403891b0
0x28f5abf: movzx ecx, byte ptr [rax]
0x28f5ac2: mov byte ptr [rbp + 0x5f8], cl
0x28f5ac8: mov qword ptr [rbp + 0x600], rbx
0x28f5acf: cmp esi, edi
0x28f5ad1: ja 0x1428f5ba9
0x28f5ad7: lea ebx, [rsi*2 + 1]
0x28f5ade: add ebx, esi
0x28f5ae0: shr ebx, 1
0x28f5ae2: cmp ebx, r14d
0x28f5ae5: cmovb ebx, r14d
0x28f5ae9: cmp edi, ebx
0x28f5aeb: cmova ebx, edi
0x28f5aee: cmp ebx, esi
0x28f5af0: jbe 0x1428f5ba9
0x28f5af6: mov ecx, ebx
0x28f5af8: shl ecx, 4
0x28f5afb: mov r12d, 0x1fd
0x28f5b01: mov rax, qword ptr gs:[0x58]
0x28f5b0a: mov rdx, qword ptr [rax]
0x28f5b0d: cmp byte ptr [r12 + rdx], 0
0x28f5b12: mov edx, 8
0x28f5b17: je 0x1428f5b20
0x28f5b19: call 0x1447efa78
0x28f5b1e: jmp 0x1428f5b25
0x28f5b20: call 0x1447ef9b0
0x28f5b25: mov rsi, rax
0x28f5b28: test rax, rax
0x28f5b2b: jne 0x1428f5b46
0x28f5b2d: call 0x141318e70
0x28f5b32: xor r9d, r9d
0x28f5b35: xor r8d, r8d
0x28f5b38: mov edx, r14d
0x28f5b3b: mov ecx, 0xa0000002
0x28f5b40: call qword ptr [rip + 0x28f5602]
0x28f5b46: mov rcx, qword ptr [rbp + 0xa0]
0x28f5b4d: test edi, edi
0x28f5b4f: je 0x1428f5b73
0x28f5b51: mov rax, rcx
0x28f5b54: mov r8, rsi
0x28f5b57: sub r8, rcx
0x28f5b5a: mov edx, edi
0x28f5b5c: nop dword ptr [rax]
0x28f5b60: vmovups xmm0, xmmword ptr [rax]
0x28f5b64: vmovups xmmword ptr [rax + r8], xmm0
0x28f5b6a: lea rax, [rax + 0x10]
0x28f5b6e: sub rdx, r14
0x28f5b71: jne 0x1428f5b60
0x28f5b73: test rcx, rcx
0x28f5b76: je 0x1428f5b97
0x28f5b78: mov rax, qword ptr gs:[0x58]
0x28f5b81: mov rdx, qword ptr [rax]
0x28f5b84: cmp byte ptr [r12 + rdx], 0
0x28f5b89: je 0x1428f5b92
0x28f5b8b: call 0x1447f03bc
0x28f5b90: jmp 0x1428f5b97
0x28f5b92: call 0x1447f02bc
0x28f5b97: mov r12, rsi
0x28f5b9a: mov qword ptr [rbp + 0xa0], rsi
0x28f5ba1: mov esi, ebx
0x28f5ba3: mov dword ptr [rbp + 0xac], ebx
0x28f5ba9: mov eax, edi
0x28f5bab: add rax, rax
0x28f5bae: vmovups xmm0, xmmword ptr [rbp + 0x5f8]
0x28f5bb6: vmovups xmmword ptr [r12 + rax*8], xmm0
0x28f5bbc: inc edi
0x28f5bbe: mov dword ptr [rbp + 0xa8], edi
0x28f5bc4: add r15, 0x10
0x28f5bc8: cmp r15, r13
0x28f5bcb: jne 0x1428f5ab3
0x28f5bd1: mov r14, qword ptr [rbp + 0x8a80]
0x28f5bd8: mov rcx, qword ptr [rbp + 0x200]
0x28f5bdf: mov esi, 0x1fd
0x28f5be4: test rcx, rcx
0x28f5be7: je 0x1428f5c07
0x28f5be9: mov rax, qword ptr gs:[0x58]
0x28f5bf2: mov rdx, qword ptr [rax]
0x28f5bf5: cmp byte ptr [rsi + rdx], 0
0x28f5bf9: je 0x1428f5c02
0x28f5bfb: call 0x1447f03bc
0x28f5c00: jmp 0x1428f5c07
0x28f5c02: call 0x1447f02bc
0x28f5c07: xor r13d, r13d
0x28f5c0a: mov qword ptr [rbp + 0x200], r13
0x28f5c11: mov qword ptr [rbp + 0x208], r13
0x28f5c18: mov rcx, qword ptr [rbp - 0x80]
0x28f5c1c: mov rax, qword ptr [rcx]
0x28f5c1f: mov r8, qword ptr [rax + 0x20]
0x28f5c23: mov dl, 1
0x28f5c25: call r8
0x28f5c28: cmp byte ptr [rbp + 0x8a88], r13b
0x28f5c2f: jbe 0x1428f5c64
0x28f5c31: mov rdx, r14
0x28f5c34: lea rcx, [rbp + 0x9b8]
0x28f5c3b: call 0x142a757a0
0x28f5c40: nop 
0x28f5c41: lea r8, [rbp + 0x8a88]
0x28f5c48: mov rdx, rax
0x28f5c4b: mov rcx, r14
0x28f5c4e: call 0x142a29720
0x28f5c53: nop 
0x28f5c54: lea rbx, [rip + 0x322f79d]
0x28f5c5b: mov qword ptr [rbp + 0x9b8], rbx
0x28f5c62: jmp 0x1428f5c6b
0x28f5c64: lea rbx, [rip + 0x322f78d]
0x28f5c6b: test edi, edi
0x28f5c6d: je 0x1428f5c99
0x28f5c6f: mov rdx, r14
0x28f5c72: lea rcx, [rbp + 0x9d0]
0x28f5c79: call 0x142a757a0
0x28f5c7e: nop 
0x28f5c7f: lea r8, [rbp + 0xa0]
0x28f5c86: mov rdx, rax
0x28f5c89: mov rcx, r14
0x28f5c8c: call 0x142a23ce0
0x28f5c91: nop 
0x28f5c92: mov qword ptr [rbp + 0x9d0], rbx
0x28f5c99: mov ebx, dword ptr [rbp + 0x100]
0x28f5c9f: cmp ebx, dword ptr [rbp + 0x5c]
0x28f5ca2: jbe 0x1428f5d71
0x28f5ca8: imul ecx, ebx, 0x35e0
0x28f5cae: mov r15d, esi
0x28f5cb1: mov rax, qword ptr gs:[0x58]
0x28f5cba: mov rdx, qword ptr [rax]
0x28f5cbd: cmp byte ptr [r15 + rdx], 0
0x28f5cc2: mov edx, 8
0x28f5cc7: je 0x1428f5cd0
0x28f5cc9: call 0x1447efa78
0x28f5cce: jmp 0x1428f5cd5
0x28f5cd0: call 0x1447ef9b0
0x28f5cd5: mov rsi, rax
0x28f5cd8: test rax, rax
0x28f5cdb: jne 0x1428f5cf8
0x28f5cdd: call 0x141318e70
0x28f5ce2: xor r9d, r9d
0x28f5ce5: xor r8d, r8d
0x28f5ce8: mov edx, 1
0x28f5ced: mov ecx, 0xa0000002
0x28f5cf2: call qword ptr [rip + 0x28f5450]
0x28f5cf8: mov edi, r13d
0x28f5cfb: cmp dword ptr [rbp + 0x58], r13d
0x28f5cff: jbe 0x1428f5d42
0x28f5d01: nop dword ptr [rax]
0x28f5d05: nop word ptr [rax + rax]
0x28f5d10: mov eax, edi
0x28f5d12: imul rbx, rax, 0x35e0
0x28f5d19: mov rdx, qword ptr [rbp + 0x50]
0x28f5d1d: add rdx, rbx
0x28f5d20: lea rcx, [rsi + rbx]
0x28f5d24: call 0x140c23dc0
0x28f5d29: mov rcx, qword ptr [rbp + 0x50]
0x28f5d2d: add rcx, rbx
0x28f5d30: call 0x140be56d0
0x28f5d35: inc edi
0x28f5d37: cmp edi, dword ptr [rbp + 0x58]
0x28f5d3a: jb 0x1428f5d10
0x28f5d3c: mov ebx, dword ptr [rbp + 0x100]
0x28f5d42: mov rcx, qword ptr [rbp + 0x50]
0x28f5d46: test rcx, rcx
0x28f5d49: je 0x1428f5d6a
0x28f5d4b: mov rax, qword ptr gs:[0x58]
0x28f5d54: mov rdx, qword ptr [rax]
0x28f5d57: cmp byte ptr [r15 + rdx], 0
0x28f5d5c: je 0x1428f5d65
0x28f5d5e: call 0x1447f03bc
0x28f5d63: jmp 0x1428f5d6a
0x28f5d65: call 0x1447f02bc
0x28f5d6a: mov qword ptr [rbp + 0x50], rsi
0x28f5d6e: mov dword ptr [rbp + 0x5c], ebx
0x28f5d71: mov edx, ebx
0x28f5d73: lea rcx, [rsp + 0x70]
0x28f5d78: call 0x1428fe160
0x28f5d7d: mov edx, ebx
0x28f5d7f: lea rcx, [rbp - 0x78]
0x28f5d83: call 0x1428fe330
0x28f5d88: mov dword ptr [rsp + 0x64], r13d
0x28f5d8d: test ebx, ebx
0x28f5d8f: je 0x1428f6316
0x28f5d95: mov rcx, qword ptr [rsp + 0x70]
0x28f5d9a: lea rdi, [rcx + 0x10]
0x28f5d9e: mov qword ptr [rbp - 0x80], rdi
0x28f5da2: mov rax, qword ptr [rbp - 0x78]
0x28f5da6: sub rax, rcx
0x28f5da9: mov qword ptr [rbp + 0x418], rax
0x28f5db0: mov edx, r13d
0x28f5db3: lea rcx, [rbp + 0xf8]
0x28f5dba: call 0x140808df0
0x28f5dbf: mov r15, rax
0x28f5dc2: mov qword ptr [rbp + 0x98], rax
0x28f5dc9: lea rcx, [rbp + 0x29e0]
0x28f5dd0: call 0x140be55c0
0x28f5dd5: nop 
0x28f5dd6: lea rcx, [r15 + 0x20]
0x28f5dda: call 0x140389570
0x28f5ddf: mov ecx, dword ptr [rax]
0x28f5de1: mov dword ptr [rbp + 0x29e0], ecx
0x28f5de7: lea rax, [r15 + 0x28]
0x28f5deb: mov qword ptr [rbp + 0x88], rax
0x28f5df2: mov rcx, qword ptr [rax]
0x28f5df5: mov qword ptr [rbp + 0x29e8], rcx
0x28f5dfc: movzx eax, word ptr [r15 + 0x148]
0x28f5e04: mov word ptr [rsp + 0x60], ax
0x28f5e09: lea rcx, [rsp + 0x60]
0x28f5e0e: call 0x140389570
0x28f5e13: mov ecx, dword ptr [rax]
0x28f5e15: mov dword ptr [rbp + 0x2a24], ecx
0x28f5e1b: lea rdx, [r15 + 0x30]
0x28f5e1f: lea rcx, [rbp + 0x29f0]
0x28f5e26: call 0x1428fdff0
0x28f5e2b: lea rdx, [rbp + 0x2a28]
0x28f5e32: mov rcx, qword ptr [r15 + 0x120]
0x28f5e39: call 0x141eccfe0
0x28f5e3e: movzx ecx, word ptr [r15 + 0x54]
0x28f5e43: mov word ptr [rbp + 0x2a78], cx
0x28f5e4a: mov rax, qword ptr [r15 + 0x58]
0x28f5e4e: mov qword ptr [rbp + 0x2a80], rax
0x28f5e55: mov rax, qword ptr [r15 + 0x60]
0x28f5e59: mov qword ptr [rbp + 0x2a88], rax
0x28f5e60: mov rax, qword ptr [r15 + 0x138]
0x28f5e67: mov qword ptr [rbp + 0x2a98], rax
0x28f5e6e: mov rax, qword ptr [r15 + 0x140]
0x28f5e75: mov qword ptr [rbp + 0x2aa0], rax
0x28f5e7c: lea rcx, [r15 + 0x78]
0x28f5e80: call 0x140430020
0x28f5e85: mov ecx, dword ptr [rax]
0x28f5e87: mov dword ptr [rbp + 0x2aa8], ecx
0x28f5e8d: mov rax, qword ptr [r15 + 0x80]
0x28f5e94: mov qword ptr [rbp + 0x2ab0], rax
0x28f5e9b: mov rax, qword ptr [r15 + 0x88]
0x28f5ea2: mov qword ptr [rbp + 0x2ab8], rax
0x28f5ea9: mov rax, qword ptr [r15 + 0x90]
0x28f5eb0: mov qword ptr [rbp + 0x2ac0], rax
0x28f5eb7: mov rax, qword ptr [r15 + 0x98]
0x28f5ebe: mov qword ptr [rbp + 0x2ac8], rax
0x28f5ec5: mov eax, dword ptr [r15 + 0xb4]
0x28f5ecc: mov dword ptr [rbp + 0x2ad0], eax
0x28f5ed2: vmovss xmm0, dword ptr [r15 + 0xb8]
0x28f5edb: vmovss dword ptr [rbp + 0x2ad4], xmm0
0x28f5ee3: vmovss xmm1, dword ptr [r15 + 0xbc]
0x28f5eec: vmovss dword ptr [rbp + 0x2ad8], xmm1
0x28f5ef4: vmovss xmm0, dword ptr [r15 + 0xc0]
0x28f5efd: vmovss dword ptr [rbp + 0x2adc], xmm0
0x28f5f05: movzx eax, byte ptr [r15 + 0xc4]
0x28f5f0d: mov byte ptr [rbp + 0x2ae0], al
0x28f5f13: vmovsd xmm0, qword ptr [r15 + 0xc8]
0x28f5f1c: vmovsd qword ptr [rbp + 0x2ae8], xmm0
0x28f5f24: mov eax, dword ptr [r15 + 0xd0]
0x28f5f2b: mov dword ptr [rbp + 0x2af0], eax
0x28f5f31: vmovss xmm0, dword ptr [r15 + 0xd4]
0x28f5f3a: vmovss dword ptr [rbp + 0x2ae4], xmm0
0x28f5f42: mov eax, dword ptr [r15 + 0xd8]
0x28f5f49: mov dword ptr [rbp + 0x2af4], eax
0x28f5f4f: movzx eax, byte ptr [r15 + 0xdc]
0x28f5f57: mov byte ptr [rbp + 0x2af8], al
0x28f5f5d: movzx eax, byte ptr [r15 + 0xdd]
0x28f5f65: mov byte ptr [rbp + 0x2af9], al
0x28f5f6b: lea rdx, [r15 + 0xe1]
0x28f5f72: lea rcx, [rbp + 0x2afd]
0x28f5f79: call 0x142157b90
0x28f5f7e: movzx ecx, byte ptr [r15 + 0xde]
0x28f5f86: mov byte ptr [rbp + 0x2afa], cl
0x28f5f8c: movzx eax, byte ptr [r15 + 0xdf]
0x28f5f94: mov byte ptr [rbp + 0x2afb], al
0x28f5f9a: movzx eax, byte ptr [r15 + 0xe0]
0x28f5fa2: mov byte ptr [rbp + 0x2afc], al
0x28f5fa8: mov rax, qword ptr [r15 + 0xa0]
0x28f5faf: mov qword ptr [rbp + 0x2c18], rax
0x28f5fb6: mov rax, qword ptr [r15 + 0xa8]
0x28f5fbd: mov qword ptr [rbp + 0x2c20], rax
0x28f5fc4: mov eax, dword ptr [r15 + 0xb0]
0x28f5fcb: mov dword ptr [rbp + 0x2c28], eax
0x28f5fd1: mov rcx, qword ptr [r15 + 0x118]
0x28f5fd8: test rcx, rcx
0x28f5fdb: je 0x1428f5fe9
0x28f5fdd: lea rdx, [rbp + 0x2b04]
0x28f5fe4: call 0x14178e950
0x28f5fe9: lea rdx, [rbp + 0x29e0]
0x28f5ff0: lea rcx, [rbp + 0x50]
0x28f5ff4: call 0x1428fe050
0x28f5ff9: movzx r12d, word ptr [r15 + 0x158]
0x28f6001: xor r8d, r8d
0x28f6004: movzx ebx, r8w
0x28f6008: cmp r8w, r12w
0x28f600c: jge 0x1428f60ce
0x28f6012: mov r14d, 1
0x28f6018: mov r13d, 0xffff
0x28f601e: nop 
0x28f6020: movzx eax, bx
0x28f6023: imul rdx, rax, 0xc8
0x28f602a: add rdx, qword ptr [r15 + 0x150]
0x28f6031: cmp qword ptr [rip + 0x4406d40], rdx
0x28f6038: je 0x1428f60b2
0x28f603a: cmp word ptr [rdx + 8], r13w
0x28f603f: je 0x1428f60b2
0x28f6041: cmp qword ptr [rdx + 0x10], 0
0x28f6046: jle 0x1428f60b2
0x28f6048: mov eax, 0xff
0x28f604d: mov word ptr [rbp + 0xc2], ax
0x28f6054: movzx r9d, bx
0x28f6058: lea r8, [rbp + 0xc2]
0x28f605f: lea rcx, [rbp + 0x2670]
0x28f6066: call 0x142449610
0x28f606b: mov rsi, rax
0x28f606e: mov r8d, dword ptr [rdi]
0x28f6071: mov ecx, dword ptr [rdi + 4]
0x28f6074: cmp ecx, r8d
0x28f6077: ja 0x1428f609b
0x28f6079: lea edx, [rcx*2 + 1]
0x28f6080: add edx, ecx
0x28f6082: shr edx, 1
0x28f6084: cmp edx, r14d
0x28f6087: cmovb edx, r14d
0x28f608b: cmp r8d, edx
0x28f608e: cmova edx, r8d
0x28f6092: lea rcx, [rdi - 8]
0x28f6096: call 0x1405d4990
0x28f609b: mov eax, dword ptr [rdi]
0x28f609d: imul rcx, rax, 0x1b8
0x28f60a4: add rcx, qword ptr [rdi - 8]
0x28f60a8: mov rdx, rsi
0x28f60ab: call 0x1405d5790
0x28f60b0: inc dword ptr [rdi]
0x28f60b2: inc bx
0x28f60b5: cmp bx, r12w
0x28f60b9: jl 0x1428f6020
0x28f60bf: mov r14, qword ptr [rbp + 0x8a80]
0x28f60c6: mov r13d, dword ptr [rsp + 0x64]
0x28f60cb: xor r8d, r8d
0x28f60ce: cmp dword ptr [rdi], 0
0x28f60d1: je 0x1428f60db
0x28f60d3: mov rax, qword ptr [r15 + 0x28]
0x28f60d7: mov qword ptr [rdi - 0x10], rax
0x28f60db: movzx r12d, word ptr [r15 + 0x168]
0x28f60e3: movzx ebx, r8w
0x28f60e7: cmp r8w, r12w
0x28f60eb: jge 0x1428f6190
0x28f60f1: mov r14d, 0xffff
0x28f60f7: nop word ptr [rax + rax]
0x28f6100: movzx eax, bx
0x28f6103: imul rsi, rax, 0xc8
0x28f610a: add rsi, qword ptr [r15 + 0x160]
0x28f6111: cmp qword ptr [rip + 0x4406c60], rsi
0x28f6118: je 0x1428f6179
0x28f611a: lea rcx, [rsi + 8]
0x28f611e: cmp word ptr [rcx], r14w
0x28f6122: je 0x1428f6179
0x28f6124: cmp qword ptr [rsi + 0x10], 0
0x28f6129: jle 0x1428f6179
0x28f612b: call 0x14038ab60
0x28f6130: xor r8d, r8d
0x28f6133: lea rdx, [rbp + 0x3c]
0x28f6137: mov rcx, rax
0x28f613a: call 0x142416360
0x28f613f: lea rcx, [rbp + 0x3c]
0x28f6143: call 0x1404a2500
0x28f6148: movzx r9d, bx
0x28f614c: mov r8, rax
0x28f614f: mov rdx, rsi
0x28f6152: lea rcx, [rbp + 0x2828]
0x28f6159: call 0x142449610
0x28f615e: mov r8, rax
0x28f6161: mov edx, r13d
0x28f6164: lea rcx, [rbp - 0x78]
0x28f6168: call 0x140584190
0x28f616d: lea rcx, [rax + 8]
0x28f6171: mov rdx, r8
0x28f6174: call 0x1405d4a80
0x28f6179: inc bx
0x28f617c: cmp bx, r12w
0x28f6180: jl 0x1428f6100
0x28f6186: mov r14, qword ptr [rbp + 0x8a80]
0x28f618d: xor r8d, r8d
0x28f6190: mov rax, qword ptr [rbp + 0x418]
0x28f6197: cmp dword ptr [rdi + rax], 0
0x28f619b: je 0x1428f61b0
0x28f619d: mov edx, r13d
0x28f61a0: lea rcx, [rbp - 0x78]
0x28f61a4: call 0x140584190
0x28f61a9: mov rcx, qword ptr [r15 + 0x28]
0x28f61ad: mov qword ptr [rax], rcx
0x28f61b0: mov edx, dword ptr [r15 + 4]
0x28f61b4: mov dword ptr [rbp + 0x30], edx
0x28f61b7: test edx, edx
0x28f61b9: jne 0x1428f61d9
0x28f61bb: mov r15, r8
0x28f61be: mov qword ptr [rbp + 0x98], r8
0x28f61c5: mov rcx, r8
0x28f61c8: mov r13d, 0xffffffff
0x28f61ce: mov eax, r13d
0x28f61d1: mov edx, r13d
0x28f61d4: mov dword ptr [rbp + 0x30], eax
0x28f61d7: jmp 0x1428f61e7
0x28f61d9: mov rax, qword ptr [r15 + 0x18]
0x28f61dd: mov rcx, qword ptr [rax]
0x28f61e0: mov r13d, r8d
0x28f61e3: mov eax, dword ptr [r15 + 0xc]
0x28f61e7: mov dword ptr [rsp + 0x68], eax
0x28f61eb: mov dword ptr [rsp + 0x60], r13d
0x28f61f0: mov rdi, qword ptr [rbp + 0x88]
0x28f61f7: test rcx, rcx
0x28f61fa: je 0x1428f62dd
0x28f6200: cmp dword ptr [r15 + 0xc], eax
0x28f6204: jne 0x1428f62dd
0x28f620a: mov rbx, qword ptr [rcx + 8]
0x28f620e: mov eax, dword ptr [rcx + 0x10]
0x28f6211: lea rsi, [rbx + rax*8]
0x28f6215: cmp rbx, rsi
0x28f6218: je 0x1428f62b3
0x28f621e: lea r12, [rcx + 4]
0x28f6222: xor r15d, r15d
0x28f6225: lea r13, [rip + 0x322f1cc]
0x28f622c: nop dword ptr [rax]
0x28f6230: mov byte ptr [rbp - 0xb], 1
0x28f6234: mov qword ptr [rbp + 0x278], r13
0x28f623b: mov byte ptr [rbp + 0x280], 0
0x28f6242: lea rax, [rip + 0x322f1ef]
0x28f6249: mov qword ptr [rbp + 0x278], rax
0x28f6250: mov qword ptr [rbp + 0x288], r15
0x28f6257: mov rax, qword ptr [r14]
0x28f625a: mov rdx, qword ptr [rax + 0xe8]
0x28f6261: mov rcx, r14
0x28f6264: call rdx
0x28f6266: mov qword ptr [rbp + 0x288], rax
0x28f626d: lea rax, [rbp - 0xb]
0x28f6271: mov qword ptr [rsp + 0x28], rax
0x28f6276: mov qword ptr [rsp + 0x20], r12
0x28f627b: mov r9, rdi
0x28f627e: mov r8, rbx
0x28f6281: lea rdx, [rbp + 0x278]
0x28f6288: mov rcx, r14
0x28f628b: call 0x142a2dd80
0x28f6290: nop 
0x28f6291: mov qword ptr [rbp + 0x278], r13
0x28f6298: add rbx, 8
0x28f629c: cmp rbx, rsi
0x28f629f: jne 0x1428f6230
0x28f62a1: mov r15, qword ptr [rbp + 0x98]
0x28f62a8: mov r13d, dword ptr [rsp + 0x60]
0x28f62ad: mov edx, dword ptr [rbp + 0x30]
0x28f62b0: xor r8d, r8d
0x28f62b3: inc r13d
0x28f62b6: mov dword ptr [rsp + 0x60], r13d
0x28f62bb: cmp r13d, edx
0x28f62be: jae 0x1428f62d1
0x28f62c0: mov rax, qword ptr [r15 + 0x18]
0x28f62c4: mov rcx, qword ptr [rax + r13*8]
0x28f62c8: mov eax, dword ptr [rsp + 0x68]
0x28f62cc: jmp 0x1428f61f7
0x28f62d1: mov rcx, r8
0x28f62d4: mov eax, dword ptr [rsp + 0x68]
0x28f62d8: jmp 0x1428f61f7
0x28f62dd: lea rcx, [rbp + 0x29e0]
0x28f62e4: call 0x140be56d0
0x28f62e9: mov r13d, dword ptr [rsp + 0x64]
0x28f62ee: inc r13d
0x28f62f1: mov dword ptr [rsp + 0x64], r13d
0x28f62f6: mov rdi, qword ptr [rbp - 0x80]
0x28f62fa: add rdi, 0x18
0x28f62fe: mov qword ptr [rbp - 0x80], rdi
0x28f6302: cmp r13d, dword ptr [rbp + 0x100]
0x28f6309: jb 0x1428f5db0
0x28f630f: mov r12, qword ptr [rbp + 0xa0]
0x28f6316: mov rdx, r14
0x28f6319: lea rcx, [rbp + 0x770]
0x28f6320: call 0x140387ef0
0x28f6325: nop 
0x28f6326: lea rdx, [rbp + 0x19e]
0x28f632d: mov rcx, qword ptr [rax + 8]
0x28f6331: call 0x1417f5a30
0x28f6336: movzx ebx, word ptr [rax]
0x28f6339: lea rcx, [rbp + 0x770]
0x28f6340: call 0x140385820
0x28f6345: mov eax, 0xffff
0x28f634a: cmp bx, ax
0x28f634d: je 0x1428f63cc
0x28f634f: mov rdx, r14
0x28f6352: lea rcx, [rbp + 0x780]
0x28f6359: call 0x140387ef0
0x28f635e: nop 
0x28f635f: lea rdx, [rbp + 0x1bc]
0x28f6366: mov rcx, qword ptr [rax + 8]
0x28f636a: call 0x1417f5a30
0x28f636f: mov rcx, rax
0x28f6372: call 0x140430150
0x28f6377: mov rdi, rax
0x28f637a: mov rcx, qword ptr [r14 + 0x68]
0x28f637e: mov rcx, qword ptr [rcx + 0x20]
0x28f6382: add rcx, 0x30
0x28f6386: call 0x140389570
0x28f638b: mov rbx, rax
0x28f638e: mov rdx, r14
0x28f6391: lea rcx, [rbp + 0x9e8]
0x28f6398: call 0x142a757a0
0x28f639d: nop 
0x28f639e: mov r9, rdi
0x28f63a1: mov r8, rbx
0x28f63a4: mov rdx, rax
0x28f63a7: mov rcx, r14
0x28f63aa: call 0x142a28cb0
0x28f63af: nop 
0x28f63b0: lea r13, [rip + 0x322f041]
0x28f63b7: mov qword ptr [rbp + 0x9e8], r13
0x28f63be: lea rcx, [rbp + 0x780]
0x28f63c5: call 0x140385820
0x28f63ca: jmp 0x1428f63d3
0x28f63cc: lea r13, [rip + 0x322f025]
0x28f63d3: cmp dword ptr [rbp + 0x58], 0
0x28f63d7: je 0x1428f6577
0x28f63dd: mov rdx, r14
0x28f63e0: lea rcx, [rbp + 0xa00]
0x28f63e7: call 0x142a757a0
0x28f63ec: nop 
0x28f63ed: lea r8, [rbp + 0x50]
0x28f63f1: mov rdx, rax
0x28f63f4: mov rcx, r14
0x28f63f7: call 0x142a23320
0x28f63fc: nop 
0x28f63fd: mov qword ptr [rbp + 0xa00], r13
0x28f6404: mov rbx, qword ptr [rbp + 0x50]
0x28f6408: mov esi, dword ptr [rbp + 0x58]
0x28f640b: imul r15, rsi, 0x35e0
0x28f6412: add r15, rbx
0x28f6415: cmp rbx, r15
0x28f6418: je 0x1428f64da
0x28f641e: mov rsi, qword ptr [rbp + 0xe0]
0x28f6425: xor r12d, r12d
0x28f6428: mov r13d, 0xffff
0x28f642e: nop 
0x28f6430: mov r9d, dword ptr [rbx]
0x28f6433: mov r11, qword ptr [rip + 0x447360e]
0x28f643a: cmp dword ptr [r11 + 0x6c], r12d
0x28f643e: je 0x1428f64b9
0x28f6440: mov ecx, dword ptr [r11 + 0x68]
0x28f6444: test ecx, ecx
0x28f6446: je 0x1428f64b9
0x28f6448: xor edx, edx
0x28f644a: mov eax, r9d
0x28f644d: div ecx
0x28f644f: mov r8d, edx
0x28f6452: shl r8, 8
0x28f6456: add r8, qword ptr [r11 + 0x78]
0x28f645a: mov edx, r12d
0x28f645d: mov edi, dword ptr [r8]
0x28f6460: test edi, edi
0x28f6462: je 0x1428f64b9
0x28f6464: mov eax, edx
0x28f6466: cmp dword ptr [r8 + rax*8 + 8], r9d
0x28f646b: jne 0x1428f6483
0x28f646d: mov ecx, dword ptr [r8 + rax*8 + 0xc]
0x28f6472: mov rax, qword ptr [r11 + 0x80]
0x28f6479: mov r10, qword ptr [rax + rcx*8]
0x28f647d: cmp dword ptr [r10 + 4], r9d
0x28f6481: je 0x1428f648b
0x28f6483: inc edx
0x28f6485: cmp edx, edi
0x28f6487: jb 0x1428f6464
0x28f6489: jmp 0x1428f64b9
0x28f648b: add r10, 8
0x28f648f: je 0x1428f64b9
0x28f6491: cmp word ptr [r10], r13w
0x28f6495: je 0x1428f64b9
0x28f6497: cmp byte ptr [rbx + 0x119], r12b
0x28f649e: jne 0x1428f64b9
0x28f64a0: mov byte ptr [rsp + 0x20], r12b
0x28f64a5: mov r9b, 1
0x28f64a8: mov r8, qword ptr [rbx + 8]
0x28f64ac: lea rdx, [rsp + 0x64]
0x28f64b1: mov rcx, rsi
0x28f64b4: call 0x142b9bee0
0x28f64b9: add rbx, 0x35e0
0x28f64c0: cmp rbx, r15
0x28f64c3: jne 0x1428f6430
0x28f64c9: mov esi, dword ptr [rbp + 0x58]
0x28f64cc: mov r12, qword ptr [rbp + 0xa0]
0x28f64d3: lea r13, [rip + 0x322ef1e]
0x28f64da: xor eax, eax
0x28f64dc: mov ebx, eax
0x28f64de: test esi, esi
0x28f64e0: je 0x1428f6577
0x28f64e6: nop word ptr [rax + rax]
0x28f64f0: mov edx, ebx
0x28f64f2: lea rcx, [rsp + 0x70]
0x28f64f7: call 0x140584190
0x28f64fc: mov rdi, rax
0x28f64ff: cmp qword ptr [rax], -1
0x28f6503: je 0x1428f652f
0x28f6505: mov rdx, r14
0x28f6508: lea rcx, [rbp + 0xa18]
0x28f650f: call 0x142a757a0
0x28f6514: nop 
0x28f6515: lea r9, [rdi + 8]
0x28f6519: mov r8, rdi
0x28f651c: mov rdx, rax
0x28f651f: mov rcx, r14
0x28f6522: call 0x1429f1df0
0x28f6527: nop 
0x28f6528: mov qword ptr [rbp + 0xa18], r13
0x28f652f: mov edx, ebx
0x28f6531: lea rcx, [rbp - 0x78]
0x28f6535: call 0x140584190
0x28f653a: mov rdi, rax
0x28f653d: cmp qword ptr [rax], -1
0x28f6541: je 0x1428f656d
0x28f6543: mov rdx, r14
0x28f6546: lea rcx, [rbp + 0xa30]
0x28f654d: call 0x142a757a0
0x28f6552: nop 
0x28f6553: lea r9, [rdi + 8]
0x28f6557: mov r8, rdi
0x28f655a: mov rdx, rax
0x28f655d: mov rcx, r14
0x28f6560: call 0x1429f2340
0x28f6565: nop 
0x28f6566: mov qword ptr [rbp + 0xa30], r13
0x28f656d: inc ebx
0x28f656f: cmp ebx, esi
0x28f6571: jb 0x1428f64f0
0x28f6577: mov rsi, qword ptr [rbp - 0x50]
0x28f657b: mov eax, dword ptr [rbp - 0x48]
0x28f657e: test eax, eax
0x28f6580: je 0x1428f65ce
0x28f6582: mov qword ptr [rbp + 0xe0], rsi
0x28f6589: mov dword ptr [rbp + 0xe8], eax
0x28f658f: mov byte ptr [rbp - 0xa], 0
0x28f6593: mov byte ptr [rbp - 9], 1
0x28f6597: mov rdx, r14
0x28f659a: lea rcx, [rbp + 0xa48]
0x28f65a1: call 0x142a757a0
0x28f65a6: nop 
0x28f65a7: lea rcx, [rbp + 0xe0]
0x28f65ae: mov qword ptr [rsp + 0x20], rcx
0x28f65b3: lea r9, [rbp - 0xa]
0x28f65b7: lea r8, [rbp - 9]
0x28f65bb: mov rdx, rax
0x28f65be: mov rcx, r14
0x28f65c1: call 0x142a29150
0x28f65c6: nop 
0x28f65c7: mov qword ptr [rbp + 0xa48], r13
0x28f65ce: mov eax, dword ptr [rbp + 0x18]
0x28f65d1: mov r13, qword ptr [rbp + 0x10]
0x28f65d5: test eax, eax
0x28f65d7: je 0x1428f6619
0x28f65d9: mov qword ptr [rbp + 0xe0], r13
0x28f65e0: mov dword ptr [rbp + 0xe8], eax
0x28f65e6: mov rdx, r14
0x28f65e9: lea rcx, [rbp + 0xa60]
0x28f65f0: call 0x142a757a0
0x28f65f5: nop 
0x28f65f6: lea r8, [rbp + 0xe0]
0x28f65fd: mov rdx, rax
0x28f6600: mov rcx, r14
0x28f6603: call 0x142a25960
0x28f6608: nop 
0x28f6609: lea rbx, [rip + 0x322ede8]
0x28f6610: mov qword ptr [rbp + 0xa60], rbx
0x28f6617: jmp 0x1428f6620
0x28f6619: lea rbx, [rip + 0x322edd8]
0x28f6620: mov eax, dword ptr [rbp + 0x48]
0x28f6623: mov r15, qword ptr [rbp + 0x40]
0x28f6627: test eax, eax
0x28f6629: je 0x1428f6662
0x28f662b: mov qword ptr [rbp + 0xe0], r15
0x28f6632: mov dword ptr [rbp + 0xe8], eax
0x28f6638: mov rdx, r14
0x28f663b: lea rcx, [rbp + 0xa78]
0x28f6642: call 0x142a757a0
0x28f6647: nop 
0x28f6648: lea r8, [rbp + 0xe0]
0x28f664f: mov rdx, rax
0x28f6652: mov rcx, r14
0x28f6655: call 0x142a25f80
0x28f665a: nop 
0x28f665b: mov qword ptr [rbp + 0xa78], rbx
0x28f6662: mov rax, qword ptr [rbp - 0x20]
0x28f6666: test rax, rax
0x28f6669: jle 0x1428f669c
0x28f666b: mov qword ptr [rbp + 0x420], rax
0x28f6672: mov rdx, r14
0x28f6675: lea rcx, [rbp + 0xa90]
0x28f667c: call 0x142a757a0
0x28f6681: nop 
0x28f6682: lea r8, [rbp + 0x420]
0x28f6689: mov rdx, rax
0x28f668c: mov rcx, r14
0x28f668f: call 0x142a2ad70
0x28f6694: nop 
0x28f6695: mov qword ptr [rbp + 0xa90], rbx
0x28f669c: mov rcx, qword ptr [rbp + 0xf8]
0x28f66a3: test rcx, rcx
0x28f66a6: je 0x1428f66f8
0x28f66a8: mov eax, dword ptr [rbp + 0x100]
0x28f66ae: test eax, eax
0x28f66b0: je 0x1428f66d3
0x28f66b2: mov rbx, rcx
0x28f66b5: mov edi, eax
0x28f66b7: mov rcx, rbx
0x28f66ba: call 0x1421562b0
0x28f66bf: add rbx, 0x180
0x28f66c6: sub rdi, 1
0x28f66ca: jne 0x1428f66b7
0x28f66cc: mov rcx, qword ptr [rbp + 0xf8]
0x28f66d3: mov edi, 0x1fd
0x28f66d8: mov rax, qword ptr gs:[0x58]
0x28f66e1: mov rdx, qword ptr [rax]
0x28f66e4: cmp byte ptr [rdi + rdx], 0
0x28f66e8: je 0x1428f66f1
0x28f66ea: call 0x1447f03bc
0x28f66ef: jmp 0x1428f66fd
0x28f66f1: call 0x1447f02bc
0x28f66f6: jmp 0x1428f66fd
0x28f66f8: mov edi, 0x1fd
0x28f66fd: xor ebx, ebx
0x28f66ff: mov qword ptr [rbp + 0xf8], rbx
0x28f6706: mov qword ptr [rbp + 0x100], rbx
0x28f670d: test r12, r12
0x28f6710: je 0x1428f6734
0x28f6712: mov edx, edi
0x28f6714: mov rax, qword ptr gs:[0x58]
0x28f671d: mov rcx, qword ptr [rax]
0x28f6720: cmp byte ptr [rdx + rcx], bl
0x28f6723: mov rcx, r12
0x28f6726: je 0x1428f672f
0x28f6728: call 0x1447f03bc
0x28f672d: jmp 0x1428f6734
0x28f672f: call 0x1447f02bc
0x28f6734: mov qword ptr [rbp + 0xa0], rbx
0x28f673b: mov qword ptr [rbp + 0xa8], rbx
0x28f6742: mov r12d, 0x1fd
0x28f6748: test r15, r15
0x28f674b: je 0x1428f676f
0x28f674d: mov rax, qword ptr gs:[0x58]
0x28f6756: mov rdx, qword ptr [rax]
0x28f6759: mov rcx, r15
0x28f675c: cmp byte ptr [r12 + rdx], 0
0x28f6761: je 0x1428f676a
0x28f6763: call 0x1447f03bc
0x28f6768: jmp 0x1428f676f
0x28f676a: call 0x1447f02bc
0x28f676f: xor r15d, r15d
0x28f6772: mov qword ptr [rbp + 0x40], r15
0x28f6776: mov qword ptr [rbp + 0x48], r15
0x28f677a: test r13, r13
0x28f677d: je 0x1428f67a3
0x28f677f: mov r8d, r12d
0x28f6782: mov rax, qword ptr gs:[0x58]
0x28f678b: mov rdx, qword ptr [rax]
0x28f678e: mov rcx, r13
0x28f6791: cmp byte ptr [r8 + rdx], r15b
0x28f6795: je 0x1428f679e
0x28f6797: call 0x1447f03bc
0x28f679c: jmp 0x1428f67a3
0x28f679e: call 0x1447f02bc
0x28f67a3: mov qword ptr [rbp + 0x10], r15
0x28f67a7: mov qword ptr [rbp + 0x18], r15
0x28f67ab: test rsi, rsi
0x28f67ae: je 0x1428f67d5
0x28f67b0: mov r8d, r12d
0x28f67b3: mov rax, qword ptr gs:[0x58]
0x28f67bc: mov rdx, qword ptr [rax]
0x28f67bf: mov rcx, rsi
0x28f67c2: cmp byte ptr [r8 + rdx], 0
0x28f67c7: je 0x1428f67d0
0x28f67c9: call 0x1447f03bc
0x28f67ce: jmp 0x1428f67d5
0x28f67d0: call 0x1447f02bc
0x28f67d5: mov qword ptr [rbp - 0x50], r15
0x28f67d9: mov qword ptr [rbp - 0x48], r15
0x28f67dd: mov rcx, qword ptr [rbp - 0x78]
0x28f67e1: test rcx, rcx
0x28f67e4: je 0x1428f6869
0x28f67ea: mov eax, dword ptr [rbp - 0x70]
0x28f67ed: test eax, eax
0x28f67ef: je 0x1428f6847
0x28f67f1: lea rbx, [rcx + 8]
0x28f67f5: mov edi, eax
0x28f67f7: nop word ptr [rax + rax]
0x28f6800: lea rax, [rbx - 8]
0x28f6804: mov qword ptr [rbp - 0x20], rax
0x28f6808: mov rcx, qword ptr [rbx]
0x28f680b: test rcx, rcx
0x28f680e: je 0x1428f6832
0x28f6810: mov r8d, r12d
0x28f6813: mov rax, qword ptr gs:[0x58]
0x28f681c: mov rdx, qword ptr [rax]
0x28f681f: cmp byte ptr [r8 + rdx], 0
0x28f6824: je 0x1428f682d
0x28f6826: call 0x1447f03bc
0x28f682b: jmp 0x1428f6832
0x28f682d: call 0x1447f02bc
0x28f6832: mov qword ptr [rbx], r15
0x28f6835: mov qword ptr [rbx + 8], r15
0x28f6839: add rbx, 0x18
0x28f683d: sub rdi, 1
0x28f6841: jne 0x1428f6800
0x28f6843: mov rcx, qword ptr [rbp - 0x78]
0x28f6847: mov r8d, r12d
0x28f684a: mov rax, qword ptr gs:[0x58]
0x28f6853: mov rdx, qword ptr [rax]
0x28f6856: cmp byte ptr [r8 + rdx], 0
0x28f685b: je 0x1428f6864
0x28f685d: call 0x1447f03bc
0x28f6862: jmp 0x1428f6869
0x28f6864: call 0x1447f02bc
0x28f6869: mov qword ptr [rbp - 0x78], r15
0x28f686d: mov qword ptr [rbp - 0x70], r15
0x28f6871: mov rcx, qword ptr [rsp + 0x70]
0x28f6876: test rcx, rcx
0x28f6879: je 0x1428f68c1
0x28f687b: mov eax, dword ptr [rsp + 0x78]
0x28f687f: test eax, eax
0x28f6881: je 0x1428f689f
0x28f6883: mov rbx, rcx
0x28f6886: mov edi, eax
0x28f6888: mov rcx, rbx
0x28f688b: call 0x140423920
0x28f6890: add rbx, 0x18
0x28f6894: sub rdi, 1
0x28f6898: jne 0x1428f6888
0x28f689a: mov rcx, qword ptr [rsp + 0x70]
0x28f689f: mov r8d, r12d
0x28f68a2: mov rax, qword ptr gs:[0x58]
0x28f68ab: mov rdx, qword ptr [rax]
0x28f68ae: cmp byte ptr [r8 + rdx], 0
0x28f68b3: je 0x1428f68bc
0x28f68b5: call 0x1447f03bc
0x28f68ba: jmp 0x1428f68c1
0x28f68bc: call 0x1447f02bc
0x28f68c1: mov qword ptr [rsp + 0x70], r15
0x28f68c6: mov qword ptr [rsp + 0x78], r15
0x28f68cb: mov r9, qword ptr [rbp + 0x50]
0x28f68cf: test r9, r9
0x28f68d2: je 0x1428f6926
0x28f68d4: mov ebx, r15d
0x28f68d7: cmp dword ptr [rbp + 0x58], r15d
0x28f68db: jbe 0x1428f68fc
0x28f68dd: nop dword ptr [rax]
0x28f68e0: mov eax, ebx
0x28f68e2: imul rcx, rax, 0x35e0
0x28f68e9: add rcx, r9
0x28f68ec: call 0x140be56d0
0x28f68f1: inc ebx
0x28f68f3: mov r9, qword ptr [rbp + 0x50]
0x28f68f7: cmp ebx, dword ptr [rbp + 0x58]
0x28f68fa: jb 0x1428f68e0
0x28f68fc: test r9, r9
0x28f68ff: je 0x1428f6926
0x28f6901: mov r8d, r12d
0x28f6904: mov rax, qword ptr gs:[0x58]
0x28f690d: mov rdx, qword ptr [rax]
0x28f6910: mov rcx, r9
0x28f6913: cmp byte ptr [r8 + rdx], 0
0x28f6918: je 0x1428f6921
0x28f691a: call 0x1447f03bc
0x28f691f: jmp 0x1428f6926
0x28f6921: call 0x1447f02bc
0x28f6926: mov qword ptr [rbp + 0x50], r15
0x28f692a: mov qword ptr [rbp + 0x58], r15
0x28f692e: mov rax, qword ptr [r14 + 0x88]
0x28f6935: movzx ecx, byte ptr [rax + 1]
0x28f6939: cmp cl, 4
0x28f693c: je 0x1428f694a
0x28f693e: sub cl, 5
0x28f6941: cmp cl, 1
0x28f6944: ja 0x1428f6a1c
0x28f694a: lea r12, [r14 + 8]
0x28f694e: mov rdx, r12
0x28f6951: test r14, r14
0x28f6954: cmove rdx, r15
0x28f6958: mov rdx, qword ptr [rdx]
0x28f695b: lea rcx, [rbp - 0x20]
0x28f695f: call 0x140393df0
0x28f6964: nop 
0x28f6965: mov rax, qword ptr [r14 + 0x68]
0x28f6969: mov rcx, qword ptr [rax + 0x118]
0x28f6970: mov eax, dword ptr [rcx + 0x18]
0x28f6973: mov dword ptr [rbp + 0x1b0], eax
0x28f6979: mov rcx, qword ptr [rbp - 0x20]
0x28f697d: mov rax, qword ptr [rcx]
0x28f6980: mov r8, qword ptr [rax + 0x20]
0x28f6984: mov dl, 1
0x28f6986: call r8
0x28f6989: mov rax, qword ptr [r14 + 0x68]
0x28f698d: mov rax, qword ptr [rax + 0x118]
0x28f6994: test rax, rax
0x28f6997: je 0x1428f69aa
0x28f6999: mov rax, qword ptr [rax + 0x20]
0x28f699d: cmp rax, -1
0x28f69a1: mov qword ptr [rbp + 0x218], rax
0x28f69a8: jne 0x1428f69b5
0x28f69aa: mov qword ptr [rbp + 0x218], 0xffffffffffffffff
0x28f69b5: lea r13, [rip + 0x322ea3c]
0x28f69bc: mov qword ptr [rbp + 0x290], r13
0x28f69c3: mov byte ptr [rbp + 0x298], 0
0x28f69ca: lea rax, [rip + 0x322ea67]
0x28f69d1: mov qword ptr [rbp + 0x290], rax
0x28f69d8: mov qword ptr [rbp + 0x2a0], r15
0x28f69df: mov rax, qword ptr [r14]
0x28f69e2: mov rdx, qword ptr [rax + 0xe8]
0x28f69e9: mov rcx, r14
0x28f69ec: call rdx
0x28f69ee: mov qword ptr [rbp + 0x2a0], rax
0x28f69f5: lea r9, [rbp + 0x1b0]
0x28f69fc: lea r8, [rbp + 0x218]
0x28f6a03: lea rdx, [rbp + 0x290]
0x28f6a0a: mov rcx, r14
0x28f6a0d: call 0x142a246c0
0x28f6a12: nop 
0x28f6a13: mov qword ptr [rbp + 0x290], r13
0x28f6a1a: jmp 0x1428f6a27
0x28f6a1c: lea r12, [r14 + 8]
0x28f6a20: lea r13, [rip + 0x322e9d1]
0x28f6a27: mov rax, qword ptr [r14 + 0x68]
0x28f6a2b: mov rdi, qword ptr [rax + 0x120]
0x28f6a32: test rdi, rdi
0x28f6a35: je 0x1428f6bf4
0x28f6a3b: lea rax, [rbp + 0x1070]
0x28f6a42: mov qword ptr [rbp + 0x1060], rax
0x28f6a49: mov dword ptr [rbp + 0x1068], r15d
0x28f6a50: mov dword ptr [rbp + 0x106c], 0x10
0x28f6a5a: mov rdx, r12
0x28f6a5d: test r14, r14
0x28f6a60: cmove rdx, r15
0x28f6a64: mov rdx, qword ptr [rdx]
0x28f6a67: lea rcx, [rbp - 0x20]
0x28f6a6b: call 0x140393df0
0x28f6a70: nop 
0x28f6a71: mov r15d, dword ptr [rdi + 0x38]
0x28f6a75: mov rdi, qword ptr [rdi + 0x30]
0x28f6a79: mov eax, dword ptr [rbp + 0x106c]
0x28f6a7f: mov ecx, dword ptr [rbp + 0x1068]
0x28f6a85: sub eax, ecx
0x28f6a87: cmp r15d, eax
0x28f6a8a: jbe 0x1428f6aa2
0x28f6a8c: lea edx, [r15 + rcx]
0x28f6a90: lea rcx, [rbp + 0x1060]
0x28f6a97: call 0x140c23c50
0x28f6a9c: mov ecx, dword ptr [rbp + 0x1068]
0x28f6aa2: mov ebx, ecx
0x28f6aa4: shl rbx, 6
0x28f6aa8: add rbx, qword ptr [rbp + 0x1060]
0x28f6aaf: mov rsi, r15
0x28f6ab2: shl rsi, 6
0x28f6ab6: add rsi, rdi
0x28f6ab9: cmp rdi, rsi
0x28f6abc: je 0x1428f6b27
0x28f6abe: lea r13, [rip + 0x2c9772b]
0x28f6ac5: lea r14, [rip + 0x2c97484]
0x28f6acc: nop dword ptr [rax]
0x28f6ad0: mov qword ptr [rbp + 0xe0], rbx
0x28f6ad7: mov rdx, rdi
0x28f6ada: mov rcx, rbx
0x28f6add: call 0x141382510
0x28f6ae2: nop 
0x28f6ae3: mov qword ptr [rbx], r13
0x28f6ae6: mov qword ptr [rbx], r14
0x28f6ae9: mov eax, dword ptr [rdi + 0x28]
0x28f6aec: mov dword ptr [rbx + 0x28], eax
0x28f6aef: movzx eax, byte ptr [rdi + 0x2c]
0x28f6af3: mov byte ptr [rbx + 0x2c], al
0x28f6af6: mov rax, qword ptr [rdi + 0x30]
0x28f6afa: mov qword ptr [rbx + 0x30], rax
0x28f6afe: mov rax, qword ptr [rdi + 0x38]
0x28f6b02: mov qword ptr [rbx + 0x38], rax
0x28f6b06: add rdi, 0x40
0x28f6b0a: add rbx, 0x40
0x28f6b0e: cmp rdi, rsi
0x28f6b11: jne 0x1428f6ad0
0x28f6b13: mov ecx, dword ptr [rbp + 0x1068]
0x28f6b19: mov r14, qword ptr [rbp + 0x8a80]
0x28f6b20: lea r13, [rip + 0x322e8d1]
0x28f6b27: add ecx, r15d
0x28f6b2a: mov dword ptr [rbp + 0x1068], ecx
0x28f6b30: mov rcx, qword ptr [rbp - 0x20]
0x28f6b34: mov rax, qword ptr [rcx]
0x28f6b37: mov r8, qword ptr [rax + 0x20]
0x28f6b3b: mov dl, 1
0x28f6b3d: call r8
0x28f6b40: mov ecx, dword ptr [rbp + 0x1068]
0x28f6b46: test ecx, ecx
0x28f6b48: je 0x1428f6b7f
0x28f6b4a: mov rax, qword ptr [rbp + 0x1060]
0x28f6b51: mov qword ptr [rbp - 0x50], rax
0x28f6b55: mov dword ptr [rbp - 0x48], ecx
0x28f6b58: mov rdx, r14
0x28f6b5b: lea rcx, [rbp + 0xaa8]
0x28f6b62: call 0x142a757a0
0x28f6b67: nop 
0x28f6b68: lea r8, [rbp - 0x50]
0x28f6b6c: mov rdx, rax
0x28f6b6f: mov rcx, r14
0x28f6b72: call 0x142a6f810
0x28f6b77: nop 
0x28f6b78: mov qword ptr [rbp + 0xaa8], r13
0x28f6b7f: mov rdi, qword ptr [rbp + 0x1060]
0x28f6b86: mov ebx, dword ptr [rbp + 0x1068]
0x28f6b8c: shl rbx, 6
0x28f6b90: add rbx, rdi
0x28f6b93: cmp rbx, rdi
0x28f6b96: je 0x1428f6bb7
0x28f6b98: nop dword ptr [rax + rax]
0x28f6ba0: sub rbx, 0x40
0x28f6ba4: mov rax, qword ptr [rbx]
0x28f6ba7: mov r8, qword ptr [rax]
0x28f6baa: xor edx, edx
0x28f6bac: mov rcx, rbx
0x28f6baf: call r8
0x28f6bb2: cmp rbx, rdi
0x28f6bb5: jne 0x1428f6ba0
0x28f6bb7: lea rax, [rbp + 0x1070]
0x28f6bbe: mov rcx, qword ptr [rbp + 0x1060]
0x28f6bc5: cmp rcx, rax
0x28f6bc8: je 0x1428f6bf4
0x28f6bca: test rcx, rcx
0x28f6bcd: je 0x1428f6bf4
0x28f6bcf: mov r8d, 0x1fd
0x28f6bd5: mov rax, qword ptr gs:[0x58]
0x28f6bde: mov rdx, qword ptr [rax]
0x28f6be1: cmp byte ptr [r8 + rdx], 0
0x28f6be6: je 0x1428f6bef
0x28f6be8: call 0x1447f03bc
0x28f6bed: jmp 0x1428f6bf4
0x28f6bef: call 0x1447f02bc
0x28f6bf4: mov rax, qword ptr [r14 + 0x68]
0x28f6bf8: mov rcx, qword ptr [rax + 0x138]
0x28f6bff: test rcx, rcx
0x28f6c02: je 0x1428f6c17
0x28f6c04: mov r8, r14
0x28f6c07: mov rdx, qword ptr [r14 + 0xa0]
0x28f6c0e: mov rcx, qword ptr [rcx + 0x18]
0x28f6c12: call 0x14290ff30
0x28f6c17: mov rax, qword ptr [r14 + 0x68]
0x28f6c1b: mov rsi, qword ptr [rax + 0x140]
0x28f6c22: test rsi, rsi
0x28f6c25: je 0x1428f7209
0x28f6c2b: xor eax, eax
0x28f6c2d: mov ebx, eax
0x28f6c2f: mov qword ptr [rbp + 0x88], rax
0x28f6c36: mov edi, eax
0x28f6c38: mov qword ptr [rbp + 0x90], rax
0x28f6c3f: mov r15d, eax
0x28f6c42: mov rdx, r12
0x28f6c45: test r14, r14
0x28f6c48: cmove rdx, rax
0x28f6c4c: mov rdx, qword ptr [rdx]
0x28f6c4f: lea rcx, [rbp + 0xe0]
0x28f6c56: call 0x140393df0
0x28f6c5b: nop 
0x28f6c5c: lea rdx, [rsi + 0x18]
0x28f6c60: mov qword ptr [rbp + 0x30], rdx
0x28f6c64: lea r9, [rsi + 0x38]
0x28f6c68: mov qword ptr [rbp - 0x20], r9
0x28f6c6c: mov esi, dword ptr [r9 + 4]
0x28f6c70: add esi, dword ptr [rdx + 4]
0x28f6c73: je 0x1428f6cd8
0x28f6c75: imul ecx, esi, 0x78
0x28f6c78: mov r12d, 0x1fd
0x28f6c7e: mov rax, qword ptr gs:[0x58]
0x28f6c87: mov rdx, qword ptr [rax]
0x28f6c8a: cmp byte ptr [r12 + rdx], bl
0x28f6c8e: mov edx, 8
0x28f6c93: je 0x1428f6c9c
0x28f6c95: call 0x1447efa78
0x28f6c9a: jmp 0x1428f6ca1
0x28f6c9c: call 0x1447ef9b0
0x28f6ca1: mov rbx, rax
0x28f6ca4: test rax, rax
0x28f6ca7: jne 0x1428f6cc4
0x28f6ca9: call 0x141318e70
0x28f6cae: xor r9d, r9d
0x28f6cb1: xor r8d, r8d
0x28f6cb4: mov edx, 1
0x28f6cb9: mov ecx, 0xa0000002
0x28f6cbe: call qword ptr [rip + 0x28f4484]
0x28f6cc4: mov qword ptr [rbp + 0x88], rbx
0x28f6ccb: mov r15d, esi
0x28f6cce: mov dword ptr [rbp + 0x94], esi
0x28f6cd4: mov rdx, qword ptr [rbp + 0x30]
0x28f6cd8: mov ecx, dword ptr [rdx + 4]
0x28f6cdb: mov dword ptr [rbp + 0x3c], ecx
0x28f6cde: xor esi, esi
0x28f6ce0: test ecx, ecx
0x28f6ce2: jne 0x1428f6d07
0x28f6ce4: mov edx, esi
0x28f6ce6: mov qword ptr [rbp + 0x30], rdx
0x28f6cea: mov eax, esi
0x28f6cec: mov r13d, 0xffffffff
0x28f6cf2: mov dword ptr [rsp + 0x68], r13d
0x28f6cf7: mov r8d, r13d
0x28f6cfa: mov dword ptr [rsp + 0x64], r13d
0x28f6cff: mov ecx, r13d
0x28f6d02: mov dword ptr [rbp + 0x3c], ecx
0x28f6d05: jmp 0x1428f6d20
0x28f6d07: mov rax, qword ptr [rdx + 0x18]
0x28f6d0b: mov rax, qword ptr [rax]
0x28f6d0e: mov r13d, esi
0x28f6d11: mov dword ptr [rsp + 0x68], esi
0x28f6d15: mov r8d, dword ptr [rdx + 0xc]
0x28f6d19: mov dword ptr [rsp + 0x64], r8d
0x28f6d1e: nop 
0x28f6d20: test rax, rax
0x28f6d23: je 0x1428f6ebb
0x28f6d29: cmp dword ptr [rdx + 0xc], r8d
0x28f6d2d: jne 0x1428f6ebb
0x28f6d33: mov rsi, qword ptr [rax + 8]
0x28f6d37: mov eax, dword ptr [rax + 0x10]
0x28f6d3a: imul r12, rax, 0x68
0x28f6d3e: add r12, rsi
0x28f6d41: cmp rsi, r12
0x28f6d44: je 0x1428f6e94
0x28f6d4a: xor r14d, r14d
0x28f6d4d: mov r13d, 1
0x28f6d53: nop dword ptr [rax]
0x28f6d57: nop word ptr [rax + rax]
0x28f6d60: mov qword ptr [rbp + 0x530], r14
0x28f6d67: mov dword ptr [rbp + 0x538], r14d
0x28f6d6e: vpxor xmm0, xmm0, xmm0
0x28f6d72: vmovdqu xmmword ptr [rbp + 0x540], xmm0
0x28f6d7a: mov dword ptr [rbp + 0x550], r14d
0x28f6d81: mov qword ptr [rbp + 0x558], r14
0x28f6d88: mov dword ptr [rbp + 0x560], r14d
0x28f6d8f: mov qword ptr [rbp + 0x568], r14
0x28f6d96: mov dword ptr [rbp + 0x570], r14d
0x28f6d9d: mov qword ptr [rbp + 0x578], r14
0x28f6da4: mov dword ptr [rbp + 0x580], r14d
0x28f6dab: mov dword ptr [rbp + 0x588], 0x3000000
0x28f6db5: mov qword ptr [rbp + 0x590], r14
0x28f6dbc: mov qword ptr [rbp + 0x598], r14
0x28f6dc3: mov byte ptr [rbp + 0x5a0], 0x12
0x28f6dca: cmp r15d, edi
0x28f6dcd: ja 0x1428f6e08
0x28f6dcf: lea edx, [r15*2 + 1]
0x28f6dd7: add edx, r15d
0x28f6dda: shr edx, 1
0x28f6ddc: cmp edx, r13d
0x28f6ddf: cmovb edx, r13d
0x28f6de3: cmp edi, edx
0x28f6de5: cmova edx, edi
0x28f6de8: lea rcx, [rbp + 0x88]
0x28f6def: call 0x140c22c50
0x28f6df4: mov r15d, dword ptr [rbp + 0x94]
0x28f6dfb: mov edi, dword ptr [rbp + 0x90]
0x28f6e01: mov rbx, qword ptr [rbp + 0x88]
0x28f6e08: mov eax, edi
0x28f6e0a: imul rcx, rax, 0x78
0x28f6e0e: vmovups ymm0, ymmword ptr [rbp + 0x530]
0x28f6e16: vmovups ymmword ptr [rcx + rbx], ymm0
0x28f6e1b: vmovups ymm1, ymmword ptr [rbp + 0x550]
0x28f6e23: vmovups ymmword ptr [rcx + rbx + 0x20], ymm1
0x28f6e29: vmovups ymm0, ymmword ptr [rbp + 0x570]
0x28f6e31: vmovups ymmword ptr [rcx + rbx + 0x40], ymm0
0x28f6e37: vmovups xmm1, xmmword ptr [rbp + 0x590]
0x28f6e3f: vmovups xmmword ptr [rcx + rbx + 0x60], xmm1
0x28f6e45: vmovsd xmm0, qword ptr [rbp + 0x5a0]
0x28f6e4d: vmovsd qword ptr [rcx + rbx + 0x70], xmm0
0x28f6e53: inc edi
0x28f6e55: mov dword ptr [rbp + 0x90], edi
0x28f6e5b: lea ecx, [rdi - 1]
0x28f6e5e: imul rdx, rcx, 0x78
0x28f6e62: add rdx, rbx
0x28f6e65: mov r9b, 0x12
0x28f6e68: xor r8d, r8d
0x28f6e6b: mov rcx, rsi
0x28f6e6e: vzeroupper 
0x28f6e71: call 0x141ecd630
0x28f6e76: add rsi, 0x68
0x28f6e7a: cmp rsi, r12
0x28f6e7d: jne 0x1428f6d60
0x28f6e83: mov r13d, dword ptr [rsp + 0x68]
0x28f6e88: mov rdx, qword ptr [rbp + 0x30]
0x28f6e8c: mov ecx, dword ptr [rbp + 0x3c]
0x28f6e8f: mov r8d, dword ptr [rsp + 0x64]
0x28f6e94: inc r13d
0x28f6e97: mov dword ptr [rsp + 0x68], r13d
0x28f6e9c: xor esi, esi
0x28f6e9e: cmp r13d, ecx
0x28f6ea1: jae 0x1428f6eb3
0x28f6ea3: mov rax, qword ptr [rdx + 0x18]
0x28f6ea7: mov rax, qword ptr [rax + r13*8]
0x28f6eab: mov ecx, dword ptr [rbp + 0x3c]
0x28f6eae: jmp 0x1428f6d20
0x28f6eb3: mov rax, rsi
0x28f6eb6: jmp 0x1428f6d20
0x28f6ebb: lea rdx, [rbp - 0x50]
0x28f6ebf: mov rcx, qword ptr [rbp - 0x20]
0x28f6ec3: call 0x1409d6f50
0x28f6ec8: mov r14d, dword ptr [rbp - 0x40]
0x28f6ecc: mov dword ptr [rsp + 0x64], r14d
0x28f6ed1: mov rax, qword ptr [rbp - 0x48]
0x28f6ed5: mov rdx, qword ptr [rbp - 0x50]
0x28f6ed9: nop dword ptr [rax]
0x28f6ee0: test rax, rax
0x28f6ee3: je 0x1428f7137
0x28f6ee9: mov ecx, dword ptr [rbp - 0x3c]
0x28f6eec: cmp dword ptr [rdx + 0xc], ecx
0x28f6eef: jne 0x1428f7137
0x28f6ef5: mov r12, qword ptr [rax + 8]
0x28f6ef9: mov eax, dword ptr [rax + 0x10]
0x28f6efc: imul rax, rax, 0x68
0x28f6f00: add rax, r12
0x28f6f03: mov qword ptr [rbp - 0x20], rax
0x28f6f07: cmp r12, rax
0x28f6f0a: je 0x1428f7114
0x28f6f10: mov r14d, 1
0x28f6f16: nop word ptr [rax + rax]
0x28f6f20: mov qword ptr [rbp + 0x4b8], 0
0x28f6f2b: mov dword ptr [rbp + 0x4c0], esi
0x28f6f31: vpxor xmm0, xmm0, xmm0
0x28f6f35: vmovdqu xmmword ptr [rbp + 0x4c8], xmm0
0x28f6f3d: mov dword ptr [rbp + 0x4d8], esi
0x28f6f43: mov qword ptr [rbp + 0x4e0], rsi
0x28f6f4a: mov dword ptr [rbp + 0x4e8], esi
0x28f6f50: mov qword ptr [rbp + 0x4f0], rsi
0x28f6f57: mov dword ptr [rbp + 0x4f8], esi
0x28f6f5d: mov qword ptr [rbp + 0x500], rsi
0x28f6f64: mov dword ptr [rbp + 0x508], esi
0x28f6f6a: mov dword ptr [rbp + 0x510], 0x3000000
0x28f6f74: mov qword ptr [rbp + 0x518], rsi
0x28f6f7b: mov qword ptr [rbp + 0x520], rsi
0x28f6f82: mov byte ptr [rbp + 0x528], 0x12
0x28f6f89: cmp r15d, edi
0x28f6f8c: ja 0x1428f708e
0x28f6f92: lea esi, [r15*2 + 1]
0x28f6f9a: add esi, r15d
0x28f6f9d: shr esi, 1
0x28f6f9f: cmp esi, r14d
0x28f6fa2: cmovb esi, r14d
0x28f6fa6: cmp edi, esi
0x28f6fa8: cmova esi, edi
0x28f6fab: cmp esi, r15d
0x28f6fae: jbe 0x1428f708c
0x28f6fb4: imul ecx, esi, 0x78
0x28f6fb7: mov r13d, 0x1fd
0x28f6fbd: mov rax, qword ptr gs:[0x58]
0x28f6fc6: mov rdx, qword ptr [rax]
0x28f6fc9: cmp byte ptr [rdx + r13], 0
0x28f6fce: mov edx, 8
0x28f6fd3: je 0x1428f6fdc
0x28f6fd5: call 0x1447efa78
0x28f6fda: jmp 0x1428f6fe1
0x28f6fdc: call 0x1447ef9b0
0x28f6fe1: mov r15, rax
0x28f6fe4: test rax, rax
0x28f6fe7: jne 0x1428f7002
0x28f6fe9: call 0x141318e70
0x28f6fee: xor r9d, r9d
0x28f6ff1: xor r8d, r8d
0x28f6ff4: mov edx, r14d
0x28f6ff7: mov ecx, 0xa0000002
0x28f6ffc: call qword ptr [rip + 0x28f4146]
0x28f7002: test edi, edi
0x28f7004: je 0x1428f704f
0x28f7006: mov rax, r15
0x28f7009: mov rdx, rbx
0x28f700c: sub rdx, r15
0x28f700f: mov ecx, edi
0x28f7011: vmovups ymm0, ymmword ptr [rdx + rax]
0x28f7016: vmovups ymmword ptr [rax], ymm0
0x28f701a: vmovups ymm1, ymmword ptr [rdx + rax + 0x20]
0x28f7020: vmovups ymmword ptr [rax + 0x20], ymm1
0x28f7025: vmovups ymm0, ymmword ptr [rdx + rax + 0x40]
0x28f702b: vmovups ymmword ptr [rax + 0x40], ymm0
0x28f7030: vmovups xmm1, xmmword ptr [rdx + rax + 0x60]
0x28f7036: vmovups xmmword ptr [rax + 0x60], xmm1
0x28f703b: vmovsd xmm0, qword ptr [rdx + rax + 0x70]
0x28f7041: vmovsd qword ptr [rax + 0x70], xmm0
0x28f7046: lea rax, [rax + 0x78]
0x28f704a: sub rcx, r14
0x28f704d: jne 0x1428f7011
0x28f704f: test rbx, rbx
0x28f7052: je 0x1428f7079
0x28f7054: mov rax, qword ptr gs:[0x58]
0x28f705d: mov rdx, qword ptr [rax]
0x28f7060: mov rcx, rbx
0x28f7063: vzeroupper 
0x28f7066: cmp byte ptr [rdx + r13], 0
0x28f706b: je 0x1428f7074
0x28f706d: call 0x1447f03bc
0x28f7072: jmp 0x1428f7079
0x28f7074: call 0x1447f02bc
0x28f7079: mov rbx, r15
0x28f707c: mov qword ptr [rbp + 0x88], rbx
0x28f7083: mov r15d, esi
0x28f7086: mov dword ptr [rbp + 0x94], esi
0x28f708c: xor esi, esi
0x28f708e: mov eax, edi
0x28f7090: imul rcx, rax, 0x78
0x28f7094: vmovups ymm0, ymmword ptr [rbp + 0x4b8]
0x28f709c: vmovups ymmword ptr [rcx + rbx], ymm0
0x28f70a1: vmovups ymm1, ymmword ptr [rbp + 0x4d8]
0x28f70a9: vmovups ymmword ptr [rcx + rbx + 0x20], ymm1
0x28f70af: vmovups ymm0, ymmword ptr [rbp + 0x4f8]
0x28f70b7: vmovups ymmword ptr [rcx + rbx + 0x40], ymm0
0x28f70bd: vmovups xmm1, xmmword ptr [rbp + 0x518]
0x28f70c5: vmovups xmmword ptr [rcx + rbx + 0x60], xmm1
0x28f70cb: vmovsd xmm0, qword ptr [rbp + 0x528]
0x28f70d3: vmovsd qword ptr [rcx + rbx + 0x70], xmm0
0x28f70d9: inc edi
0x28f70db: mov dword ptr [rbp + 0x90], edi
0x28f70e1: lea ecx, [rdi - 1]
0x28f70e4: imul rdx, rcx, 0x78
0x28f70e8: add rdx, rbx
0x28f70eb: mov r9b, 0x12
0x28f70ee: movzx r8d, r14b
0x28f70f2: mov rcx, r12
0x28f70f5: vzeroupper 
0x28f70f8: call 0x141ecd630
0x28f70fd: add r12, 0x68
0x28f7101: cmp r12, qword ptr [rbp - 0x20]
0x28f7105: jne 0x1428f6f20
0x28f710b: mov r14d, dword ptr [rsp + 0x64]
0x28f7110: mov rdx, qword ptr [rbp - 0x50]
0x28f7114: inc r14d
0x28f7117: mov dword ptr [rsp + 0x64], r14d
0x28f711c: cmp r14d, dword ptr [rbp - 0x38]
0x28f7120: jae 0x1428f712f
0x28f7122: mov rax, qword ptr [rdx + 0x18]
0x28f7126: mov rax, qword ptr [rax + r14*8]
0x28f712a: jmp 0x1428f6ee0
0x28f712f: mov rax, rsi
0x28f7132: jmp 0x1428f6ee0
0x28f7137: mov rcx, qword ptr [rbp + 0xe0]
0x28f713e: mov rax, qword ptr [rcx]
0x28f7141: mov r8, qword ptr [rax + 0x20]
0x28f7145: mov dl, 1
0x28f7147: call r8
0x28f714a: test edi, edi
0x28f714c: mov r14, qword ptr [rbp + 0x8a80]
0x28f7153: je 0x1428f71c8
0x28f7155: mov byte ptr [rbp - 8], 0
0x28f7159: mov byte ptr [rbp - 7], 1
0x28f715d: lea rdi, [rip + 0x322e294]
0x28f7164: mov qword ptr [rbp + 0x2a8], rdi
0x28f716b: mov byte ptr [rbp + 0x2b0], 0
0x28f7172: lea rax, [rip + 0x322e2bf]
0x28f7179: mov qword ptr [rbp + 0x2a8], rax
0x28f7180: mov qword ptr [rbp + 0x2b8], rsi
0x28f7187: mov rax, qword ptr [r14]
0x28f718a: mov rdx, qword ptr [rax + 0xe8]
0x28f7191: mov rcx, r14
0x28f7194: call rdx
0x28f7196: mov qword ptr [rbp + 0x2b8], rax
0x28f719d: lea rax, [rbp + 0x88]
0x28f71a4: mov qword ptr [rsp + 0x20], rax
0x28f71a9: lea r9, [rbp - 8]
0x28f71ad: lea r8, [rbp - 7]
0x28f71b1: lea rdx, [rbp + 0x2a8]
0x28f71b8: mov rcx, r14
0x28f71bb: call 0x1429d5e50
0x28f71c0: nop 
0x28f71c1: mov qword ptr [rbp + 0x2a8], rdi
0x28f71c8: test rbx, rbx
0x28f71cb: je 0x1428f71f3
0x28f71cd: mov edx, 0x1fd
0x28f71d2: mov rax, qword ptr gs:[0x58]
0x28f71db: mov rcx, qword ptr [rax]
0x28f71de: cmp byte ptr [rdx + rcx], 0
0x28f71e2: mov rcx, rbx
0x28f71e5: je 0x1428f71ee
0x28f71e7: call 0x1447f03bc
0x28f71ec: jmp 0x1428f71f3
0x28f71ee: call 0x1447f02bc
0x28f71f3: mov qword ptr [rbp + 0x88], rsi
0x28f71fa: mov qword ptr [rbp + 0x90], 0
0x28f7205: lea r12, [r14 + 8]
0x28f7209: mov rax, qword ptr [r14 + 0x68]
0x28f720d: mov r13, qword ptr [rax + 0x148]
0x28f7214: mov qword ptr [rbp - 0x20], r13
0x28f7218: test r13, r13
0x28f721b: je 0x1428f74a6
0x28f7221: mov rbx, rsi
0x28f7224: mov qword ptr [rbp - 0x78], rbx
0x28f7228: mov qword ptr [rbp - 0x70], 0
0x28f7230: xor eax, eax
0x28f7232: mov r15d, eax
0x28f7235: mov rdx, r12
0x28f7238: test r14, r14
0x28f723b: cmove rdx, rax
0x28f723f: mov rdx, qword ptr [rdx]
0x28f7242: lea rcx, [rbp + 0xe0]
0x28f7249: call 0x140393df0
0x28f724e: nop 
0x28f724f: mov edi, dword ptr [r13 + 0x30]
0x28f7253: add edi, dword ptr [r13 + 0x20]
0x28f7257: je 0x1428f72b5
0x28f7259: mov ecx, edi
0x28f725b: shl ecx, 6
0x28f725e: mov r8d, 0x1fd
0x28f7264: mov rax, qword ptr gs:[0x58]
0x28f726d: mov rdx, qword ptr [rax]
0x28f7270: cmp byte ptr [r8 + rdx], 0
0x28f7275: mov edx, 8
0x28f727a: je 0x1428f7283
0x28f727c: call 0x1447efa78
0x28f7281: jmp 0x1428f7288
0x28f7283: call 0x1447ef9b0
0x28f7288: mov rbx, rax
0x28f728b: test rax, rax
0x28f728e: jne 0x1428f72ab
0x28f7290: call 0x141318e70
0x28f7295: xor r9d, r9d
0x28f7298: xor r8d, r8d
0x28f729b: mov edx, 1
0x28f72a0: mov ecx, 0xa0000002
0x28f72a5: call qword ptr [rip + 0x28f3e9d]
0x28f72ab: mov qword ptr [rbp - 0x78], rbx
0x28f72af: mov r15d, edi
0x28f72b2: mov dword ptr [rbp - 0x6c], edi
0x28f72b5: mov rdi, qword ptr [r13 + 0x18]
0x28f72b9: mov r12d, dword ptr [r13 + 0x20]
0x28f72bd: shl r12, 6
0x28f72c1: add r12, rdi
0x28f72c4: cmp rdi, r12
0x28f72c7: je 0x1428f7407
0x28f72cd: xor r14d, r14d
0x28f72d0: mov r13d, 1
0x28f72d6: nop word ptr [rax + rax]
0x28f72e0: mov rax, r14
0x28f72e3: mov qword ptr [rbp + 0x678], rax
0x28f72ea: vpxor xmm0, xmm0, xmm0
0x28f72ee: vmovups ymmword ptr [rbp + 0x680], ymm0
0x28f72f6: vmovups xmmword ptr [rbp + 0x6a0], xmm0
0x28f72fe: mov byte ptr [rbp + 0x6b0], 3
0x28f7305: cmp r15d, esi
0x28f7308: ja 0x1428f7341
0x28f730a: lea edx, [r15*2 + 1]
0x28f7312: add edx, r15d
0x28f7315: shr edx, 1
0x28f7317: cmp edx, r13d
0x28f731a: cmovb edx, r13d
0x28f731e: cmp esi, edx
0x28f7320: cmova edx, esi
0x28f7323: lea rcx, [rbp - 0x78]
0x28f7327: vzeroupper 
0x28f732a: call 0x140c23450
0x28f732f: mov r15d, dword ptr [rbp - 0x6c]
0x28f7333: mov esi, dword ptr [rbp - 0x70]
0x28f7336: mov rbx, qword ptr [rbp - 0x78]
0x28f733a: mov rax, qword ptr [rbp + 0x678]
0x28f7341: mov ecx, esi
0x28f7343: shl rcx, 6
0x28f7347: mov qword ptr [rcx + rbx], rax
0x28f734b: mov rax, qword ptr [rbp + 0x680]
0x28f7352: mov qword ptr [rcx + rbx + 8], rax
0x28f7357: mov rax, qword ptr [rbp + 0x688]
0x28f735e: mov qword ptr [rcx + rbx + 0x10], rax
0x28f7363: mov rax, qword ptr [rbp + 0x690]
0x28f736a: mov qword ptr [rcx + rbx + 0x18], rax
0x28f736f: mov rax, qword ptr [rbp + 0x698]
0x28f7376: mov qword ptr [rcx + rbx + 0x20], rax
0x28f737b: mov rax, qword ptr [rbp + 0x6a0]
0x28f7382: mov qword ptr [rcx + rbx + 0x28], rax
0x28f7387: mov rax, qword ptr [rbp + 0x6a8]
0x28f738e: mov qword ptr [rcx + rbx + 0x30], rax
0x28f7393: movzx eax, byte ptr [rbp + 0x6b0]
0x28f739a: mov byte ptr [rcx + rbx + 0x38], al
0x28f739e: inc esi
0x28f73a0: mov dword ptr [rbp - 0x70], esi
0x28f73a3: lea ecx, [rsi - 1]
0x28f73a6: shl rcx, 6
0x28f73aa: mov rax, qword ptr [rdi + 8]
0x28f73ae: mov qword ptr [rcx + rbx], rax
0x28f73b2: mov rax, qword ptr [rdi + 0x10]
0x28f73b6: mov qword ptr [rcx + rbx + 8], rax
0x28f73bb: mov rax, qword ptr [rdi + 0x18]
0x28f73bf: mov qword ptr [rcx + rbx + 0x10], rax
0x28f73c4: mov rax, qword ptr [rdi + 0x20]
0x28f73c8: mov qword ptr [rcx + rbx + 0x18], rax
0x28f73cd: mov rax, qword ptr [rdi + 0x28]
0x28f73d1: mov qword ptr [rcx + rbx + 0x20], rax
0x28f73d6: mov rax, qword ptr [rdi + 0x30]
0x28f73da: mov qword ptr [rcx + rbx + 0x28], rax
0x28f73df: mov rax, qword ptr [rdi + 0x38]
0x28f73e3: mov qword ptr [rcx + rbx + 0x30], rax
0x28f73e8: movzx eax, byte ptr [rdi]
0x28f73eb: mov byte ptr [rcx + rbx + 0x38], al
0x28f73ef: add rdi, 0x40
0x28f73f3: cmp rdi, r12
0x28f73f6: jne 0x1428f72e0
0x28f73fc: mov r14, qword ptr [rbp + 0x8a80]
0x28f7403: mov r13, qword ptr [rbp - 0x20]
0x28f7407: mov rbx, qword ptr [r13 + 0x28]
0x28f740b: mov edi, dword ptr [r13 + 0x30]
0x28f740f: shl rdi, 6
0x28f7413: add rdi, rbx
0x28f7416: cmp rbx, rdi
0x28f7419: je 0x1428f7458
0x28f741b: nop dword ptr [rax + rax]
0x28f7420: lea rcx, [rbp + 0x1470]
0x28f7427: vzeroupper 
0x28f742a: call 0x14244aaa0
0x28f742f: mov rdx, rax
0x28f7432: lea rcx, [rbp - 0x78]
0x28f7436: call 0x1428fdd10
0x28f743b: lea rcx, [rbp - 0x78]
0x28f743f: call 0x141ecd7e0
0x28f7444: mov rdx, rax
0x28f7447: mov rcx, rbx
0x28f744a: call 0x141ecdb00
0x28f744f: add rbx, 0x40
0x28f7453: cmp rbx, rdi
0x28f7456: jne 0x1428f7420
0x28f7458: lea rcx, [rbp + 0xe0]
0x28f745f: vzeroupper 
0x28f7462: call 0x1403944d0
0x28f7467: mov byte ptr [rbp - 6], 1
0x28f746b: mov rdx, r14
0x28f746e: lea rcx, [rbp + 0xac0]
0x28f7475: call 0x142a757a0
0x28f747a: nop 
0x28f747b: lea r9, [rbp - 0x78]
0x28f747f: lea r8, [rbp - 6]
0x28f7483: mov rdx, rax
0x28f7486: mov rcx, r14
0x28f7489: call 0x142a11a20
0x28f748e: nop 
0x28f748f: lea rax, [rip + 0x322df62]
0x28f7496: mov qword ptr [rbp + 0xac0], rax
0x28f749d: lea rcx, [rbp - 0x78]
0x28f74a1: call 0x14035e2e0
0x28f74a6: mov rax, qword ptr [r14 + 0x68]
0x28f74aa: mov r15, qword ptr [rax + 0x150]
0x28f74b1: test r15, r15
0x28f74b4: je 0x1428f7e5e
0x28f74ba: xor edi, edi
0x28f74bc: mov qword ptr [rbp + 0x40], rdi
0x28f74c0: mov qword ptr [rbp + 0x48], rdi
0x28f74c4: mov qword ptr [rbp + 0x138], rdi
0x28f74cb: mov qword ptr [rbp + 0x140], rdi
0x28f74d2: mov qword ptr [rsp + 0x70], rdi
0x28f74d7: mov qword ptr [rsp + 0x78], rdi
0x28f74dc: mov qword ptr [rbp + 0x10], rdi
0x28f74e0: mov r13d, edi
0x28f74e3: mov qword ptr [rbp + 0x18], rdi
0x28f74e7: lea rax, [rbp + 0xe10]
0x28f74ee: mov qword ptr [rbp + 0xe00], rax
0x28f74f5: mov dword ptr [rbp + 0xe08], edi
0x28f74fb: mov dword ptr [rbp + 0xe0c], 0x10
0x28f7505: lea rax, [rbp + 0x7b0]
0x28f750c: mov qword ptr [rbp + 0x7a0], rax
0x28f7513: mov dword ptr [rbp + 0x7a8], edi
0x28f7519: mov dword ptr [rbp + 0x7ac], 0x10
0x28f7523: mov qword ptr [rbp + 0x220], rdi
0x28f752a: mov dword ptr [rbp + 0x228], edi
0x28f7530: mov dword ptr [rbp + 0x22c], 0xffffffff
0x28f753a: vpxor xmm0, xmm0, xmm0
0x28f753e: vmovdqu xmmword ptr [rbp + 0x230], xmm0
0x28f7546: mov qword ptr [rbp + 0x240], rdi
0x28f754d: mov dword ptr [rbp + 0x248], edi
0x28f7553: mov dword ptr [rbp + 0x24c], 0xffffffff
0x28f755d: vmovdqu xmmword ptr [rbp + 0x250], xmm0
0x28f7565: mov qword ptr [rbp - 0x78], rdi
0x28f7569: mov qword ptr [rbp - 0x70], rdi
0x28f756d: mov edx, 0x1fd
0x28f7572: mov rax, qword ptr gs:[0x58]
0x28f757b: mov rcx, qword ptr [rax]
0x28f757e: cmp byte ptr [rdx + rcx], dil
0x28f7582: mov edx, 2
0x28f7587: mov ecx, 0x12
0x28f758c: je 0x1428f7595
0x28f758e: call 0x1447efa78
0x28f7593: jmp 0x1428f759a
0x28f7595: call 0x1447ef9b0
0x28f759a: mov rbx, rax
0x28f759d: test rax, rax
0x28f75a0: jne 0x1428f75bd
0x28f75a2: call 0x141318e70
0x28f75a7: xor r9d, r9d
0x28f75aa: xor r8d, r8d
0x28f75ad: mov edx, 1
0x28f75b2: mov ecx, 0xa0000002
0x28f75b7: call qword ptr [rip + 0x28f3b8b]
0x28f75bd: mov qword ptr [rbp - 0x78], rbx
0x28f75c1: mov dword ptr [rbp - 0x6c], 3
0x28f75c8: lea rdx, [r14 + 8]
0x28f75cc: test r14, r14
0x28f75cf: cmove rdx, rdi
0x28f75d3: mov rdx, qword ptr [rdx]
0x28f75d6: lea rcx, [rbp - 0x20]
0x28f75da: call 0x140393df0
0x28f75df: nop 
0x28f75e0: lea rdx, [r15 + 0x18]
0x28f75e4: lea rcx, [rbp + 0x40]
0x28f75e8: call 0x140a4ed30
0x28f75ed: lea rdx, [r15 + 0x70]
0x28f75f1: lea rcx, [rbp + 0x138]
0x28f75f8: call 0x1404d9200
0x28f75fd: lea rdx, [r15 + 0x48]
0x28f7601: lea rcx, [rbp + 0x240]
0x28f7608: call 0x1409d6ca0
0x28f760d: mov rsi, qword ptr [r15 + 0x98]
0x28f7614: mov eax, dword ptr [r15 + 0xa0]
0x28f761b: lea rcx, [rax + rax*2]
0x28f761f: lea r12, [rsi + rcx*8]
0x28f7623: cmp rsi, r12
0x28f7626: je 0x1428f7672
0x28f7628: nop dword ptr [rax + rax]
0x28f7630: movzx edi, byte ptr [rsi + 0x10]
0x28f7634: mov rbx, qword ptr [rsi + 8]
0x28f7638: mov rcx, rsi
0x28f763b: call 0x140433650
0x28f7640: mov ecx, dword ptr [rax]
0x28f7642: mov dword ptr [rbp + 0x718], ecx
0x28f7648: mov qword ptr [rbp + 0x720], rbx
0x28f764f: mov byte ptr [rbp + 0x728], dil
0x28f7656: lea rdx, [rbp + 0x718]
0x28f765d: lea rcx, [rbp + 0xe00]
0x28f7664: call 0x1428fe490
0x28f7669: add rsi, 0x18
0x28f766d: cmp rsi, r12
0x28f7670: jne 0x1428f7630
0x28f7672: lea rdx, [r15 + 0xa8]
0x28f7679: lea rcx, [rbp + 0x220]
0x28f7680: call 0x141805f50
0x28f7685: lea rdx, [rbp + 0xdb0]
0x28f768c: lea rcx, [rbp + 0x220]
0x28f7693: call 0x1409d6f50
0x28f7698: mov rdx, rax
0x28f769b: lea rcx, [rbp - 0x50]
0x28f769f: call 0x1409d8040
0x28f76a4: mov r12d, dword ptr [rbp - 0x38]
0x28f76a8: mov esi, dword ptr [rbp - 0x3c]
0x28f76ab: mov rdi, qword ptr [rbp - 0x50]
0x28f76af: mov edx, dword ptr [rbp + 0x7a8]
0x28f76b5: mov ebx, dword ptr [rbp - 0x40]
0x28f76b8: mov rcx, qword ptr [rbp - 0x48]
0x28f76bc: nop dword ptr [rax]
0x28f76c0: test rcx, rcx
0x28f76c3: je 0x1428f773e
0x28f76c5: cmp dword ptr [rdi + 0xc], esi
0x28f76c8: jne 0x1428f773e
0x28f76ca: mov eax, dword ptr [rcx + 4]
0x28f76cd: mov dword ptr [rbp + 0x210], eax
0x28f76d3: movzx eax, byte ptr [rcx + 8]
0x28f76d7: mov byte ptr [rbp + 0x214], al
0x28f76dd: cmp edx, dword ptr [rbp + 0x7ac]
0x28f76e3: jb 0x1428f7707
0x28f76e5: mov r9d, 8
0x28f76eb: xor r8d, r8d
0x28f76ee: lea rdx, [rbp + 0x7b0]
0x28f76f5: lea rcx, [rbp + 0x7a0]
0x28f76fc: call 0x140392380
0x28f7701: mov edx, dword ptr [rbp + 0x7a8]
0x28f7707: mov rcx, qword ptr [rbp + 0x210]
0x28f770e: mov rax, qword ptr [rbp + 0x7a0]
0x28f7715: mov qword ptr [rax + rdx*8], rcx
0x28f7719: mov edx, dword ptr [rbp + 0x7a8]
0x28f771f: inc edx
0x28f7721: mov dword ptr [rbp + 0x7a8], edx
0x28f7727: inc ebx
0x28f7729: cmp ebx, r12d
0x28f772c: jae 0x1428f7738
0x28f772e: mov rax, qword ptr [rdi + 0x18]
0x28f7732: mov rcx, qword ptr [rax + rbx*8]
0x28f7736: jmp 0x1428f76c0
0x28f7738: xor eax, eax
0x28f773a: mov ecx, eax
0x28f773c: jmp 0x1428f76c0
0x28f773e: lea rdx, [rbp - 0x78]
0x28f7742: mov rcx, r15
0x28f7745: call 0x142143170
0x28f774a: nop 
0x28f774b: mov rcx, qword ptr [rbp - 0x20]
0x28f774f: mov rax, qword ptr [rcx]
0x28f7752: mov r8, qword ptr [rax + 0x20]
0x28f7756: mov dl, 1
0x28f7758: call r8
0x28f775b: mov esi, dword ptr [rbp + 0x48]
0x28f775e: mov edx, esi
0x28f7760: lea rcx, [rsp + 0x70]
0x28f7765: call 0x140410660
0x28f776a: mov rax, qword ptr gs:[0x58]
0x28f7773: mov rcx, qword ptr [rax]
0x28f7776: mov edx, 0x1ec
0x28f777b: mov rax, qword ptr [rip + 0x4471da6]
0x28f7782: cmp byte ptr [rdx + rcx], 0
0x28f7786: cmovne rax, qword ptr [rip + 0x4471da2]
0x28f778e: mov rax, qword ptr [rax]
0x28f7791: mov rcx, qword ptr [rax + 8]
0x28f7795: mov r15, qword ptr [rcx + 0x1a8]
0x28f779c: xor eax, eax
0x28f779e: mov edi, eax
0x28f77a0: mov r12, qword ptr [rbp + 0x40]
0x28f77a4: test esi, esi
0x28f77a6: je 0x1428f783d
0x28f77ac: mov rbx, r12
0x28f77af: nop 
0x28f77b0: cmp dword ptr [rbx], 0
0x28f77b3: jle 0x1428f782f
0x28f77b5: mov r8d, edi
0x28f77b8: lea rdx, [rbp + 0x19c]
0x28f77bf: mov rcx, r15
0x28f77c2: call 0x140de3f10
0x28f77c7: mov rcx, rax
0x28f77ca: call 0x140433650
0x28f77cf: mov ecx, dword ptr [rax]
0x28f77d1: mov dword ptr [rbp + 0x438], ecx
0x28f77d7: mov eax, dword ptr [rbx]
0x28f77d9: mov dword ptr [rbp + 0x43c], eax
0x28f77df: mov rax, qword ptr [rbx + 8]
0x28f77e3: mov qword ptr [rbp + 0x448], rax
0x28f77ea: movzx eax, byte ptr [rbx + 0x10]
0x28f77ee: mov byte ptr [rbp + 0x450], al
0x28f77f4: lea rdx, [rbp + 0x438]
0x28f77fb: lea rcx, [rbp + 0x220]
0x28f7802: call 0x1403924f0
0x28f7807: test rax, rax
0x28f780a: je 0x1428f7817
0x28f780c: movzx eax, byte ptr [rax]
0x28f780f: mov byte ptr [rbp + 0x440], al
0x28f7815: jmp 0x1428f781e
0x28f7817: mov byte ptr [rbp + 0x440], 0x19
0x28f781e: lea rdx, [rbp + 0x438]
0x28f7825: lea rcx, [rsp + 0x70]
0x28f782a: call 0x14066fff0
0x28f782f: inc edi
0x28f7831: add rbx, 0x18
0x28f7835: cmp edi, esi
0x28f7837: jb 0x1428f77b0
0x28f783d: mov rbx, qword ptr [rbp + 0x138]
0x28f7844: mov eax, dword ptr [rbp + 0x140]
0x28f784a: lea rdi, [rbx + rax*8]
0x28f784e: xor r15d, r15d
0x28f7851: cmp rbx, rdi
0x28f7854: je 0x1428f789d
0x28f7856: nop word ptr [rax + rax]
0x28f7860: mov qword ptr [rbp + 0x760], r15
0x28f7867: mov rcx, rbx
0x28f786a: call 0x140433650
0x28f786f: mov ecx, dword ptr [rax]
0x28f7871: mov dword ptr [rbp + 0x750], ecx
0x28f7877: mov eax, dword ptr [rbx + 4]
0x28f787a: mov dword ptr [rbp + 0x754], eax
0x28f7880: lea rdx, [rbp + 0x750]
0x28f7887: lea rcx, [rbp + 0x10]
0x28f788b: call 0x14066fff0
0x28f7890: add rbx, 8
0x28f7894: cmp rbx, rdi
0x28f7897: jne 0x1428f7860
0x28f7899: mov r13d, dword ptr [rbp + 0x18]
0x28f789d: cmp dword ptr [rsp + 0x78], 0
0x28f78a2: je 0x1428f78f7
0x28f78a4: mov byte ptr [rbp - 5], 0
0x28f78a8: mov byte ptr [rbp - 4], 0
0x28f78ac: mov byte ptr [rbp - 3], 1
0x28f78b0: mov rdx, r14
0x28f78b3: lea rcx, [rbp + 0xad8]
0x28f78ba: call 0x142a757a0
0x28f78bf: nop 
0x28f78c0: lea rcx, [rsp + 0x70]
0x28f78c5: mov qword ptr [rsp + 0x28], rcx
0x28f78ca: lea rcx, [rbp - 5]
0x28f78ce: mov qword ptr [rsp + 0x20], rcx
0x28f78d3: lea r9, [rbp - 4]
0x28f78d7: lea r8, [rbp - 3]
0x28f78db: mov rdx, rax
0x28f78de: mov rcx, r14
0x28f78e1: call 0x142a12b20
0x28f78e6: nop 
0x28f78e7: lea rdi, [rip + 0x322db0a]
0x28f78ee: mov qword ptr [rbp + 0xad8], rdi
0x28f78f5: jmp 0x1428f78fe
0x28f78f7: lea rdi, [rip + 0x322dafa]
0x28f78fe: test r13d, r13d
0x28f7901: je 0x1428f793f
0x28f7903: mov byte ptr [rbp - 2], 0
0x28f7907: mov byte ptr [rbp - 1], 1
0x28f790b: mov rdx, r14
0x28f790e: lea rcx, [rbp + 0xaf0]
0x28f7915: call 0x142a757a0
0x28f791a: nop 
0x28f791b: lea rcx, [rbp + 0x10]
0x28f791f: mov qword ptr [rsp + 0x20], rcx
0x28f7924: lea r9, [rbp - 2]
0x28f7928: lea r8, [rbp - 1]
0x28f792c: mov rdx, rax
0x28f792f: mov rcx, r14
0x28f7932: call 0x142a137b0
0x28f7937: nop 
0x28f7938: mov qword ptr [rbp + 0xaf0], rdi
0x28f793f: mov ecx, dword ptr [rbp + 0xe08]
0x28f7945: test ecx, ecx
0x28f7947: je 0x1428f797e
0x28f7949: mov rax, qword ptr [rbp + 0xe00]
0x28f7950: mov qword ptr [rbp - 0x50], rax
0x28f7954: mov dword ptr [rbp - 0x48], ecx
0x28f7957: mov rdx, r14
0x28f795a: lea rcx, [rbp + 0xb08]
0x28f7961: call 0x142a757a0
0x28f7966: nop 
0x28f7967: lea r8, [rbp - 0x50]
0x28f796b: mov rdx, rax
0x28f796e: mov rcx, r14
0x28f7971: call 0x142a16be0
0x28f7976: nop 
0x28f7977: mov qword ptr [rbp + 0xb08], rdi
0x28f797e: mov ecx, dword ptr [rbp + 0x7a8]
0x28f7984: test ecx, ecx
0x28f7986: je 0x1428f79c5
0x28f7988: mov rax, qword ptr [rbp + 0x7a0]
0x28f798f: mov qword ptr [rbp - 0x50], rax
0x28f7993: mov dword ptr [rbp - 0x48], ecx
0x28f7996: mov byte ptr [rbp], 0
0x28f799a: mov rdx, r14
0x28f799d: lea rcx, [rbp + 0xb20]
0x28f79a4: call 0x142a757a0
0x28f79a9: nop 
0x28f79aa: lea r9, [rbp - 0x50]
0x28f79ae: lea r8, [rbp]
0x28f79b2: mov rdx, rax
0x28f79b5: mov rcx, r14
0x28f79b8: call 0x142a17730
0x28f79bd: nop 
0x28f79be: mov qword ptr [rbp + 0xb20], rdi
0x28f79c5: mov eax, dword ptr [rbp - 0x70]
0x28f79c8: mov rbx, qword ptr [rbp - 0x78]
0x28f79cc: test eax, eax
0x28f79ce: je 0x1428f79fe
0x28f79d0: mov qword ptr [rbp - 0x50], rbx
0x28f79d4: mov dword ptr [rbp - 0x48], eax
0x28f79d7: mov rdx, r14
0x28f79da: lea rcx, [rbp + 0xb38]
0x28f79e1: call 0x142a757a0
0x28f79e6: nop 
0x28f79e7: lea r8, [rbp - 0x50]
0x28f79eb: mov rdx, rax
0x28f79ee: mov rcx, r14
0x28f79f1: call 0x142a18120
0x28f79f6: nop 
0x28f79f7: mov qword ptr [rbp + 0xb38], rdi
0x28f79fe: cmp dword ptr [rbp + 0x244], 0
0x28f7a05: je 0x1428f7c92
0x28f7a0b: mov rsi, r15
0x28f7a0e: mov qword ptr [rbp - 0x50], r15
0x28f7a12: mov edi, r15d
0x28f7a15: mov qword ptr [rbp - 0x48], 0
0x28f7a1d: mov r10d, r15d
0x28f7a20: lea rdx, [rbp + 0xd90]
0x28f7a27: lea rcx, [rbp + 0x240]
0x28f7a2e: call 0x1409d6f50
0x28f7a33: mov rdx, rax
0x28f7a36: lea rcx, [rbp + 0xa0]
0x28f7a3d: call 0x1409d8040
0x28f7a42: mov r12d, 0x1fd
0x28f7a48: mov rdx, qword ptr gs:[0x58]
0x28f7a51: mov r13d, dword ptr [rbp + 0xb0]
0x28f7a58: mov rcx, qword ptr [rbp + 0xa8]
0x28f7a5f: mov r14, qword ptr [rbp + 0xa0]
0x28f7a66: test rcx, rcx
0x28f7a69: je 0x1428f7bcf
0x28f7a6f: mov eax, dword ptr [rbp + 0xb4]
0x28f7a75: cmp dword ptr [r14 + 0xc], eax
0x28f7a79: jne 0x1428f7bcf
0x28f7a7f: cmp byte ptr [rcx + 9], 2
0x28f7a83: jne 0x1428f7bae
0x28f7a89: mov eax, dword ptr [rcx + 4]
0x28f7a8c: mov dword ptr [rbp + 0x628], eax
0x28f7a92: mov eax, dword ptr [rcx + 0x20]
0x28f7a95: mov dword ptr [rbp + 0x62c], eax
0x28f7a9b: movzx eax, byte ptr [rcx + 8]
0x28f7a9f: mov byte ptr [rbp + 0x630], al
0x28f7aa5: mov rax, qword ptr [rcx + 0x10]
0x28f7aa9: mov qword ptr [rbp + 0x638], rax
0x28f7ab0: mov rax, qword ptr [rcx + 0x18]
0x28f7ab4: mov qword ptr [rbp + 0x640], rax
0x28f7abb: cmp r10d, edi
0x28f7abe: ja 0x1428f7b96
0x28f7ac4: lea ebx, [r10*2 + 1]
0x28f7acc: add ebx, r10d
0x28f7acf: shr ebx, 1
0x28f7ad1: cmp ebx, 1
0x28f7ad4: mov eax, 1
0x28f7ad9: cmovb ebx, eax
0x28f7adc: cmp edi, ebx
0x28f7ade: cmova ebx, edi
0x28f7ae1: cmp ebx, r10d
0x28f7ae4: jbe 0x1428f7b96
0x28f7aea: mov ecx, ebx
0x28f7aec: shl ecx, 5
0x28f7aef: mov rax, qword ptr [rdx]
0x28f7af2: mov edx, 8
0x28f7af7: vzeroupper 
0x28f7afa: cmp byte ptr [r12 + rax], 0
0x28f7aff: je 0x1428f7b08
0x28f7b01: call 0x1447efa78
0x28f7b06: jmp 0x1428f7b0d
0x28f7b08: call 0x1447ef9b0
0x28f7b0d: mov r15, rax
0x28f7b10: test rax, rax
0x28f7b13: jne 0x1428f7b30
0x28f7b15: call 0x141318e70
0x28f7b1a: xor r9d, r9d
0x28f7b1d: xor r8d, r8d
0x28f7b20: mov edx, 1
0x28f7b25: mov ecx, 0xa0000002
0x28f7b2a: call qword ptr [rip + 0x28f3618]
0x28f7b30: test edi, edi
0x28f7b32: je 0x1428f7b53
0x28f7b34: mov rax, r15
0x28f7b37: mov rcx, rsi
0x28f7b3a: sub rcx, r15
0x28f7b3d: mov edx, edi
0x28f7b3f: nop 
0x28f7b40: vmovups ymm0, ymmword ptr [rcx + rax]
0x28f7b45: vmovups ymmword ptr [rax], ymm0
0x28f7b49: lea rax, [rax + 0x20]
0x28f7b4d: sub rdx, 1
0x28f7b51: jne 0x1428f7b40
0x28f7b53: test rsi, rsi
0x28f7b56: je 0x1428f7b7d
0x28f7b58: mov rax, qword ptr gs:[0x58]
0x28f7b61: mov rax, qword ptr [rax]
0x28f7b64: mov rcx, rsi
0x28f7b67: vzeroupper 
0x28f7b6a: cmp byte ptr [r12 + rax], 0
0x28f7b6f: je 0x1428f7b78
0x28f7b71: call 0x1447f03bc
0x28f7b76: jmp 0x1428f7b7d
0x28f7b78: call 0x1447f02bc
0x28f7b7d: mov rsi, r15
0x28f7b80: mov qword ptr [rbp - 0x50], r15
0x28f7b84: mov r10d, ebx
0x28f7b87: mov dword ptr [rbp - 0x44], ebx
0x28f7b8a: mov rdx, qword ptr gs:[0x58]
0x28f7b93: xor r15d, r15d
0x28f7b96: mov eax, edi
0x28f7b98: shl rax, 5
0x28f7b9c: vmovups ymm0, ymmword ptr [rbp + 0x628]
0x28f7ba4: vmovups ymmword ptr [rax + rsi], ymm0
0x28f7ba9: inc edi
0x28f7bab: mov dword ptr [rbp - 0x48], edi
0x28f7bae: inc r13d
0x28f7bb1: cmp r13d, dword ptr [rbp + 0xb8]
0x28f7bb8: jae 0x1428f7bc7
0x28f7bba: mov rax, qword ptr [r14 + 0x18]
0x28f7bbe: mov rcx, qword ptr [rax + r13*8]
0x28f7bc2: jmp 0x1428f7a66
0x28f7bc7: mov rcx, r15
0x28f7bca: jmp 0x1428f7a66
0x28f7bcf: test edi, edi
0x28f7bd1: mov r14, qword ptr [rbp + 0x8a80]
0x28f7bd8: je 0x1428f7c50
0x28f7bda: mov qword ptr [rbp + 0xa0], rsi
0x28f7be1: mov dword ptr [rbp + 0xa8], edi
0x28f7be7: mov byte ptr [rbp + 1], 1
0x28f7beb: lea rbx, [rip + 0x322d806]
0x28f7bf2: mov qword ptr [rbp + 0x2c0], rbx
0x28f7bf9: mov byte ptr [rbp + 0x2c8], 0
0x28f7c00: lea rax, [rip + 0x322d831]
0x28f7c07: mov qword ptr [rbp + 0x2c0], rax
0x28f7c0e: mov qword ptr [rbp + 0x2d0], r15
0x28f7c15: mov rax, qword ptr [r14]
0x28f7c18: mov rdx, qword ptr [rax + 0xe8]
0x28f7c1f: mov rcx, r14
0x28f7c22: vzeroupper 
0x28f7c25: call rdx
0x28f7c27: mov qword ptr [rbp + 0x2d0], rax
0x28f7c2e: lea r9, [rbp + 0xa0]
0x28f7c35: lea r8, [rbp + 1]
0x28f7c39: lea rdx, [rbp + 0x2c0]
0x28f7c40: mov rcx, r14
0x28f7c43: call 0x142a14fa0
0x28f7c48: nop 
0x28f7c49: mov qword ptr [rbp + 0x2c0], rbx
0x28f7c50: test rsi, rsi
0x28f7c53: je 0x1428f7c7e
0x28f7c55: mov edx, 0x1fd
0x28f7c5a: mov rax, qword ptr gs:[0x58]
0x28f7c63: mov rcx, qword ptr [rax]
0x28f7c66: cmp byte ptr [rdx + rcx], 0
0x28f7c6a: mov rcx, rsi
0x28f7c6d: vzeroupper 
0x28f7c70: je 0x1428f7c79
0x28f7c72: call 0x1447f03bc
0x28f7c77: jmp 0x1428f7c7e
0x28f7c79: call 0x1447f02bc
0x28f7c7e: mov qword ptr [rbp - 0x50], r15
0x28f7c82: mov qword ptr [rbp - 0x48], 0
0x28f7c8a: mov rbx, qword ptr [rbp - 0x78]
0x28f7c8e: mov r12, qword ptr [rbp + 0x40]
0x28f7c92: mov edi, 0x1fd
0x28f7c97: test rbx, rbx
0x28f7c9a: je 0x1428f7cc0
0x28f7c9c: mov rax, qword ptr gs:[0x58]
0x28f7ca5: mov rdx, qword ptr [rax]
0x28f7ca8: mov rcx, rbx
0x28f7cab: vzeroupper 
0x28f7cae: cmp byte ptr [rdi + rdx], 0
0x28f7cb2: je 0x1428f7cbb
0x28f7cb4: call 0x1447f03bc
0x28f7cb9: jmp 0x1428f7cc0
0x28f7cbb: call 0x1447f02bc
0x28f7cc0: mov qword ptr [rbp - 0x78], r15
0x28f7cc4: mov qword ptr [rbp - 0x70], 0
0x28f7ccc: inc dword ptr [rbp + 0x24c]
0x28f7cd2: lea rcx, [rbp + 0x240]
0x28f7cd9: vzeroupper 
0x28f7cdc: call 0x1403955e0
0x28f7ce1: nop 
0x28f7ce2: inc dword ptr [rbp + 0x22c]
0x28f7ce8: lea rcx, [rbp + 0x220]
0x28f7cef: call 0x1403955e0
0x28f7cf4: nop 
0x28f7cf5: lea rax, [rbp + 0x7b0]
0x28f7cfc: mov rcx, qword ptr [rbp + 0x7a0]
0x28f7d03: cmp rcx, rax
0x28f7d06: je 0x1428f7d30
0x28f7d08: test rcx, rcx
0x28f7d0b: je 0x1428f7d30
0x28f7d0d: mov r8d, edi
0x28f7d10: mov rax, qword ptr gs:[0x58]
0x28f7d19: mov rdx, qword ptr [rax]
0x28f7d1c: cmp byte ptr [r8 + rdx], 0
0x28f7d21: je 0x1428f7d2a
0x28f7d23: call 0x1447f03bc
0x28f7d28: jmp 0x1428f7d30
0x28f7d2a: call 0x1447f02bc
0x28f7d2f: nop 
0x28f7d30: lea rax, [rbp + 0xe10]
0x28f7d37: mov rcx, qword ptr [rbp + 0xe00]
0x28f7d3e: cmp rcx, rax
0x28f7d41: je 0x1428f7d6b
0x28f7d43: test rcx, rcx
0x28f7d46: je 0x1428f7d6b
0x28f7d48: mov r8d, edi
0x28f7d4b: mov rax, qword ptr gs:[0x58]
0x28f7d54: mov rdx, qword ptr [rax]
0x28f7d57: cmp byte ptr [r8 + rdx], 0
0x28f7d5c: je 0x1428f7d65
0x28f7d5e: call 0x1447f03bc
0x28f7d63: jmp 0x1428f7d6b
0x28f7d65: call 0x1447f02bc
0x28f7d6a: nop 
0x28f7d6b: mov rcx, qword ptr [rbp + 0x10]
0x28f7d6f: test rcx, rcx
0x28f7d72: je 0x1428f7d96
0x28f7d74: mov r8d, edi
0x28f7d77: mov rax, qword ptr gs:[0x58]
0x28f7d80: mov rdx, qword ptr [rax]
0x28f7d83: cmp byte ptr [r8 + rdx], 0
0x28f7d88: je 0x1428f7d91
0x28f7d8a: call 0x1447f03bc
0x28f7d8f: jmp 0x1428f7d96
0x28f7d91: call 0x1447f02bc
0x28f7d96: mov qword ptr [rbp + 0x10], r15
0x28f7d9a: mov qword ptr [rbp + 0x18], 0
0x28f7da2: mov rcx, qword ptr [rsp + 0x70]
0x28f7da7: test rcx, rcx
0x28f7daa: je 0x1428f7dce
0x28f7dac: mov r8d, edi
0x28f7daf: mov rax, qword ptr gs:[0x58]
0x28f7db8: mov rdx, qword ptr [rax]
0x28f7dbb: cmp byte ptr [r8 + rdx], 0
0x28f7dc0: je 0x1428f7dc9
0x28f7dc2: call 0x1447f03bc
0x28f7dc7: jmp 0x1428f7dce
0x28f7dc9: call 0x1447f02bc
0x28f7dce: mov qword ptr [rsp + 0x70], r15
0x28f7dd3: mov qword ptr [rsp + 0x78], 0
0x28f7ddc: mov rcx, qword ptr [rbp + 0x138]
0x28f7de3: test rcx, rcx
0x28f7de6: je 0x1428f7e0a
0x28f7de8: mov r8d, edi
0x28f7deb: mov rax, qword ptr gs:[0x58]
0x28f7df4: mov rdx, qword ptr [rax]
0x28f7df7: cmp byte ptr [r8 + rdx], 0
0x28f7dfc: je 0x1428f7e05
0x28f7dfe: call 0x1447f03bc
0x28f7e03: jmp 0x1428f7e0a
0x28f7e05: call 0x1447f02bc
0x28f7e0a: mov qword ptr [rbp + 0x138], r15
0x28f7e11: mov qword ptr [rbp + 0x140], 0
0x28f7e1c: test r12, r12
0x28f7e1f: je 0x1428f7e52
0x28f7e21: mov r8d, edi
0x28f7e24: mov rax, qword ptr gs:[0x58]
0x28f7e2d: mov rdx, qword ptr [rax]
0x28f7e30: mov rcx, r12
0x28f7e33: cmp byte ptr [r8 + rdx], 0
0x28f7e38: je 0x1428f7e4d
0x28f7e3a: call 0x1447f03bc
0x28f7e3f: mov qword ptr [rbp + 0x40], r15
0x28f7e43: mov qword ptr [rbp + 0x48], 0
0x28f7e4b: jmp 0x1428f7e5e
0x28f7e4d: call 0x1447f02bc
0x28f7e52: mov qword ptr [rbp + 0x40], r15
0x28f7e56: mov qword ptr [rbp + 0x48], 0
0x28f7e5e: mov rax, qword ptr [r14 + 0x68]
0x28f7e62: mov rcx, qword ptr [rax + 0x168]
0x28f7e69: test rcx, rcx
0x28f7e6c: je 0x1428f7e73
0x28f7e6e: call 0x1428c1270
0x28f7e73: mov rax, qword ptr [r14 + 0x68]
0x28f7e77: mov rsi, qword ptr [rax + 0xa0]
0x28f7e7e: test rsi, rsi
0x28f7e81: je 0x1428f7fac
0x28f7e87: mov rdi, r15
0x28f7e8a: mov qword ptr [rbp - 0x50], r15
0x28f7e8e: mov r12d, r15d
0x28f7e91: mov qword ptr [rbp - 0x48], 0
0x28f7e99: mov rax, qword ptr [rsi + 8]
0x28f7e9d: lea rdx, [rax + 8]
0x28f7ea1: test rax, rax
0x28f7ea4: cmove rdx, r15
0x28f7ea8: mov rdx, qword ptr [rdx]
0x28f7eab: lea rcx, [rbp + 0x8a80]
0x28f7eb2: call 0x140393df0
0x28f7eb7: nop 
0x28f7eb8: mov rbx, qword ptr [rsi + 0x48]
0x28f7ebc: mov eax, dword ptr [rsi + 0x50]
0x28f7ebf: lea r15, [rbx + rax*2]
0x28f7ec3: cmp rbx, r15
0x28f7ec6: je 0x1428f7eed
0x28f7ec8: mov rcx, rbx
0x28f7ecb: call 0x1405b4800
0x28f7ed0: mov rdx, rax
0x28f7ed3: lea rcx, [rbp - 0x50]
0x28f7ed7: call 0x1405b49d0
0x28f7edc: add rbx, 2
0x28f7ee0: cmp rbx, r15
0x28f7ee3: jne 0x1428f7ec8
0x28f7ee5: mov r12d, dword ptr [rbp - 0x48]
0x28f7ee9: mov rdi, qword ptr [rbp - 0x50]
0x28f7eed: mov rcx, qword ptr [rbp + 0x8a80]
0x28f7ef4: mov rax, qword ptr [rcx]
0x28f7ef7: mov r8, qword ptr [rax + 0x20]
0x28f7efb: mov dl, 1
0x28f7efd: call r8
0x28f7f00: mov qword ptr [rbp + 0x10], rdi
0x28f7f04: mov dword ptr [rbp + 0x18], r12d
0x28f7f08: mov rcx, qword ptr [rsi + 8]
0x28f7f0c: lea r12, [rip + 0x322d4e5]
0x28f7f13: mov qword ptr [rbp + 0x2f0], r12
0x28f7f1a: mov byte ptr [rbp + 0x2f8], 0
0x28f7f21: lea r13, [rip + 0x322d510]
0x28f7f28: mov qword ptr [rbp + 0x2f0], r13
0x28f7f2f: xor r15d, r15d
0x28f7f32: mov qword ptr [rbp + 0x300], r15
0x28f7f39: test rcx, rcx
0x28f7f3c: je 0x1428f7f51
0x28f7f3e: mov rax, qword ptr [rcx]
0x28f7f41: mov rdx, qword ptr [rax + 0xe8]
0x28f7f48: call rdx
0x28f7f4a: mov qword ptr [rbp + 0x300], rax
0x28f7f51: lea r8, [rbp + 0x10]
0x28f7f55: lea rdx, [rbp + 0x2f0]
0x28f7f5c: mov rcx, qword ptr [rsi + 8]
0x28f7f60: call 0x1429b3140
0x28f7f65: nop 
0x28f7f66: mov qword ptr [rbp + 0x2f0], r12
0x28f7f6d: test rdi, rdi
0x28f7f70: je 0x1428f7fa2
0x28f7f72: mov r8d, 0x1fd
0x28f7f78: mov rax, qword ptr gs:[0x58]
0x28f7f81: mov rdx, qword ptr [rax]
0x28f7f84: mov rcx, rdi
0x28f7f87: cmp byte ptr [r8 + rdx], 0
0x28f7f8c: je 0x1428f7f9d
0x28f7f8e: call 0x1447f03bc
0x28f7f93: mov qword ptr [rbp - 0x50], r15
0x28f7f97: mov qword ptr [rbp - 0x48], r15
0x28f7f9b: jmp 0x1428f7fba
0x28f7f9d: call 0x1447f02bc
0x28f7fa2: mov qword ptr [rbp - 0x50], r15
0x28f7fa6: mov qword ptr [rbp - 0x48], r15
0x28f7faa: jmp 0x1428f7fba
0x28f7fac: lea r12, [rip + 0x322d445]
0x28f7fb3: lea r13, [rip + 0x322d47e]
0x28f7fba: mov rax, qword ptr [r14 + 0x68]
0x28f7fbe: mov rcx, qword ptr [rax + 0xf8]
0x28f7fc5: test rcx, rcx
0x28f7fc8: je 0x1428f7fcf
0x28f7fca: call 0x142904a40
0x28f7fcf: mov rax, qword ptr [r14 + 0x68]
0x28f7fd3: mov rcx, qword ptr [rax + 0x188]
0x28f7fda: mov rcx, qword ptr [rcx + 0x18]
0x28f7fde: call 0x14283e760
0x28f7fe3: mov rax, qword ptr [r14 + 0x68]
0x28f7fe7: mov rbx, qword ptr [rax + 0x1a0]
0x28f7fee: xor edx, edx
0x28f7ff0: mov rcx, rbx
0x28f7ff3: call 0x142bcbc00
0x28f7ff8: test r14, r14
0x28f7ffb: lea rax, [r14 + 8]
0x28f7fff: cmove rax, r15
0x28f8003: mov rdx, qword ptr [rax]
0x28f8006: lea rcx, [rbp - 0x20]
0x28f800a: call 0x140393df0
0x28f800f: nop 
0x28f8010: vmovups ymm0, ymmword ptr [rbx + 0x39c]
0x28f8018: vmovups ymmword ptr [rbp - 0x50], ymm0
0x28f801d: vmovups xmm2, xmmword ptr [rbx + 0x3bc]
0x28f8025: vmovups xmmword ptr [rbp - 0x30], xmm2
0x28f802a: vmovdqu xmm0, xmmword ptr [rip + 0x347d9ae]
0x28f8032: vmovups xmmword ptr [rbp + 0x464], xmm0
0x28f803a: vxorps xmm1, xmm1, xmm1
0x28f803e: vmovss dword ptr [rbp + 0x474], xmm1
0x28f8046: vmovss dword ptr [rbp + 0x478], xmm1
0x28f804e: vmovss dword ptr [rbp + 0x47c], xmm1
0x28f8056: vpextrb eax, xmm2, 0xc
0x28f805c: test al, al
0x28f805e: je 0x1428f807a
0x28f8060: vmovups ymm0, ymmword ptr [rbp - 0x4c]
0x28f8065: vmovups ymmword ptr [rbp + 0x458], ymm0
0x28f806d: vmovsd xmm1, qword ptr [rbp - 0x2c]
0x28f8072: vmovsd qword ptr [rbp + 0x478], xmm1
0x28f807a: mov rcx, qword ptr [r14 + 0x68]
0x28f807e: lea rdx, [rbp + 0xcf8]
0x28f8085: mov rcx, qword ptr [rcx + 0x1a0]
0x28f808c: vzeroupper 
0x28f808f: call 0x1404f8220
0x28f8094: movsx ecx, word ptr [rax + 0xe]
0x28f8098: vxorps xmm0, xmm0, xmm0
0x28f809c: vcvtsi2ss xmm0, xmm0, ecx
0x28f80a0: vmulss xmm0, xmm0, dword ptr [rip + 0x347b64c]
0x28f80a8: vaddss xmm4, xmm0, dword ptr [rax + 8]
0x28f80ad: vmovss xmm3, dword ptr [rax + 4]
0x28f80b2: movsx ecx, word ptr [rax + 0xc]
0x28f80b6: vxorps xmm0, xmm0, xmm0
0x28f80ba: vcvtsi2ss xmm0, xmm0, ecx
0x28f80be: vmulss xmm1, xmm0, dword ptr [rip + 0x347b62e]
0x28f80c6: vaddss xmm2, xmm1, dword ptr [rax]
0x28f80ca: vmovss dword ptr [rbp + 0x480], xmm2
0x28f80d2: vmovss dword ptr [rbp + 0x484], xmm3
0x28f80da: vmovss dword ptr [rbp + 0x488], xmm4
0x28f80e2: vmovsd xmm0, qword ptr [rbp + 0x474]
0x28f80ea: vmovsd qword ptr [rbp + 0x48c], xmm0
0x28f80f2: mov eax, dword ptr [rbp + 0x47c]
0x28f80f8: mov dword ptr [rbp + 0x494], eax
0x28f80fe: movzx eax, word ptr [rbx + 0x28]
0x28f8102: mov word ptr [rbp + 0x8a80], ax
0x28f8109: lea rcx, [rbp + 0x8a80]
0x28f8110: call 0x1404a2010
0x28f8115: mov ecx, dword ptr [rax]
0x28f8117: mov dword ptr [rbp + 0x498], ecx
0x28f811d: mov rbx, qword ptr [r14 + 0x68]
0x28f8121: mov rcx, qword ptr [rbx + 0x1a0]
0x28f8128: call 0x1417e9170
0x28f812d: vmovss dword ptr [rbp + 0x49c], xmm0
0x28f8135: mov eax, dword ptr [rbp - 0x50]
0x28f8138: mov dword ptr [rbp + 0x4a0], eax
0x28f813e: vmovups xmm0, xmmword ptr [rbp + 0x464]
0x28f8146: vmovups xmmword ptr [rbp + 0x4a4], xmm0
0x28f814e: mov rax, qword ptr [rbx + 0x1a8]
0x28f8155: mov rbx, qword ptr [rax + 0x28]
0x28f8159: mov rdx, qword ptr [rbx]
0x28f815c: lea rcx, [rbp + 0x428]
0x28f8163: call 0x140393df0
0x28f8168: nop 
0x28f8169: mov qword ptr [rbp + 0x430], rbx
0x28f8170: mov r8d, dword ptr [rbp + 0x60]
0x28f8174: or r8d, 4
0x28f8178: mov dword ptr [rbp + 0x38], r8d
0x28f817c: mov rax, qword ptr [rbp + 0x430]
0x28f8183: mov rcx, qword ptr [rax + 0x18]
0x28f8187: mov rdx, qword ptr [rcx + 0xd0]
0x28f818e: test rdx, rdx
0x28f8191: je 0x1428f81b8
0x28f8193: mov eax, dword ptr [rdx + 0x3b0]
0x28f8199: cmp dword ptr [rdx + 0x3b8], eax
0x28f819f: jb 0x1428f81a7
0x28f81a1: cmp dword ptr [rdx + 0x28], 0
0x28f81a5: je 0x1428f81b8
0x28f81a7: mov ecx, dword ptr [rdx + 0x30]
0x28f81aa: mov rax, qword ptr [rdx + 0x20]
0x28f81ae: mov rcx, qword ptr [rax + rcx*8]
0x28f81b2: vmovsd xmm6, qword ptr [rcx]
0x28f81b6: jmp 0x1428f81bc
0x28f81b8: vxorpd xmm6, xmm6, xmm6
0x28f81bc: and r8d, 0xfffffffb
0x28f81c0: mov dword ptr [rbp + 0x38], r8d
0x28f81c4: mov rcx, qword ptr [rbp + 0x428]
0x28f81cb: mov rax, qword ptr [rcx]
0x28f81ce: mov r8, qword ptr [rax + 0x20]
0x28f81d2: mov dl, 1
0x28f81d4: call r8
0x28f81d7: vcvtsd2ss xmm0, xmm6, xmm6
0x28f81db: vmovss dword ptr [rbp + 0x4b4], xmm0
0x28f81e3: mov rcx, qword ptr [rbp - 0x20]
0x28f81e7: mov rax, qword ptr [rcx]
0x28f81ea: mov r8, qword ptr [rax + 0x20]
0x28f81ee: mov dl, 1
0x28f81f0: call r8
0x28f81f3: mov qword ptr [rbp + 0x2d8], r12
0x28f81fa: mov byte ptr [rbp + 0x2e0], 0
0x28f8201: mov qword ptr [rbp + 0x2d8], r13
0x28f8208: mov qword ptr [rbp + 0x2e8], r15
0x28f820f: mov rax, qword ptr [r14]
0x28f8212: mov rdx, qword ptr [rax + 0xe8]
0x28f8219: mov rcx, r14
0x28f821c: call rdx
0x28f821e: mov qword ptr [rbp + 0x2e8], rax
0x28f8225: lea r8, [rbp + 0x480]
0x28f822c: lea rdx, [rbp + 0x2d8]
0x28f8233: mov rcx, r14
0x28f8236: call 0x142975c10
0x28f823b: nop 
0x28f823c: mov qword ptr [rbp + 0x2d8], r12
0x28f8243: mov rcx, qword ptr [rbp + 0x68]
0x28f8247: test rcx, rcx
0x28f824a: je 0x1428f8271
0x28f824c: mov r8d, 0x1fd
0x28f8252: mov rax, qword ptr gs:[0x58]
0x28f825b: mov rdx, qword ptr [rax]
0x28f825e: cmp byte ptr [r8 + rdx], 0
0x28f8263: je 0x1428f826c
0x28f8265: call 0x1447f03bc
0x28f826a: jmp 0x1428f8271
0x28f826c: call 0x1447f02bc
0x28f8271: mov qword ptr [rbp + 0x68], r15
0x28f8275: mov qword ptr [rbp + 0x70], 0
0x28f827d: vmovaps xmm6, xmmword ptr [rsp + 0x8b20]
0x28f8286: add rsp, 0x8b38
0x28f828d: pop r15
0x28f828f: pop r14
0x28f8291: pop r13
0x28f8293: pop r12
0x28f8295: pop rdi
0x28f8296: pop rsi
0x28f8297: pop rbx
0x28f8298: pop rbp
0x28f8299: ret 