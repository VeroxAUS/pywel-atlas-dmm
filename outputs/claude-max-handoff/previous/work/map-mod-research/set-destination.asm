0xdc32e0: mov rax, rsp
0xdc32e3: mov qword ptr [rax + 0x18], rbx
0xdc32e7: push rbp
0xdc32e8: push rsi
0xdc32e9: push rdi
0xdc32ea: push r14
0xdc32ec: push r15
0xdc32ee: lea rbp, [rax - 0x5f]
0xdc32f2: sub rsp, 0xa0
0xdc32f9: vmovaps xmmword ptr [rax - 0x38], xmm7
0xdc32fe: vmovaps xmmword ptr [rax - 0x48], xmm8
0xdc3303: mov r14, rcx
0xdc3306: xor edi, edi
0xdc3308: mov dword ptr [rbp - 0x49], edi
0xdc330b: xor edx, edx
0xdc330d: call 0x140dc35c0
0xdc3312: mov rax, qword ptr [r14 + 0x5c0]
0xdc3319: test rax, rax
0xdc331c: je 0x140dc3323
0xdc331e: mov rdi, rax
0xdc3321: jmp 0x140dc3363
0xdc3323: mov rsi, qword ptr [r14 + 0x328]
0xdc332a: mov eax, dword ptr [r14 + 0x330]
0xdc3331: lea r15, [rsi + rax*8]
0xdc3335: cmp rsi, r15
0xdc3338: je 0x140dc3363
0xdc333a: nop word ptr [rax + rax]
0xdc3340: mov rbx, qword ptr [rsi]
0xdc3343: lea rcx, [rbx + 0xde]
0xdc334a: call 0x140537250
0xdc334f: cmp dword ptr [rax + 0x2c], 0x1b
0xdc3353: cmove rbx, rdi
0xdc3357: mov rdi, rbx
0xdc335a: add rsi, 8
0xdc335e: cmp rsi, r15
0xdc3361: jne 0x140dc3340
0xdc3363: mov qword ptr [rbp - 0x19], 0xffffffffffffffff
0xdc336b: mov byte ptr [rbp - 0x11], 0x15
0xdc336f: xor eax, eax
0xdc3371: mov dword ptr [rbp - 0x10], eax
0xdc3374: mov word ptr [rbp - 0xc], ax
0xdc3378: mov byte ptr [rbp - 0xa], al
0xdc337b: mov esi, 0xffff
0xdc3380: test rdi, rdi
0xdc3383: je 0x140dc345b
0xdc3389: vmovups xmm0, xmmword ptr [rdi + 0xc8]
0xdc3391: vpextrb eax, xmm0, 8
0xdc3397: mov byte ptr [rbp - 0x11], al
0xdc339a: vmovq rbx, xmm0
0xdc339f: mov qword ptr [rbp - 0x19], rbx
0xdc33a3: cmp al, 2
0xdc33a5: jne 0x140dc33c1
0xdc33a7: mov byte ptr [rbp + 0x67], 1
0xdc33ab: mov word ptr [rbp + 0x6f], bx
0xdc33af: lea r8, [rbp + 0x67]
0xdc33b3: lea rdx, [rbp + 0x6f]
0xdc33b7: call 0x1406599f0
0xdc33bc: jmp 0x140dc358e
0xdc33c1: cmp al, 1
0xdc33c3: jne 0x140dc33e5
0xdc33c5: mov rdx, rdi
0xdc33c8: mov rcx, qword ptr [r14 + 0x518]
0xdc33cf: call 0x140dd8ff0
0xdc33d4: test al, al
0xdc33d6: jne 0x140dc33e5
0xdc33d8: xor r8d, r8d
0xdc33db: mov edx, ebx
0xdc33dd: mov rcx, r14
0xdc33e0: call 0x140db98e0
0xdc33e5: vmovups xmm0, xmmword ptr [rdi + 0xc8]
0xdc33ed: vmovups xmmword ptr [rbp - 0x31], xmm0
0xdc33f2: vpextrb eax, xmm0, 8
0xdc33f8: cmp al, 4
0xdc33fa: jne 0x140dc3440
0xdc33fc: movzx eax, word ptr [rbp - 0x31]
0xdc3400: mov word ptr [rbp + 0x67], ax
0xdc3404: cmp ax, si
0xdc3407: je 0x140dc3427
0xdc3409: lea rcx, [rbp + 0x67]
0xdc340d: call 0x140430020
0xdc3412: vmovsd xmm0, qword ptr [rax + 0x48]
0xdc3417: mov ecx, dword ptr [rax + 0x50]
0xdc341a: vmovsd qword ptr [rbp - 0x41], xmm0
0xdc341f: mov dword ptr [rbp - 0x39], ecx
0xdc3422: jmp 0x140dc34e9
0xdc3427: vxorps xmm0, xmm0, xmm0
0xdc342b: vmovd ecx, xmm0
0xdc342f: vunpcklps xmm0, xmm0, xmm0
0xdc3433: vmovsd qword ptr [rbp - 0x41], xmm0
0xdc3438: mov dword ptr [rbp - 0x39], ecx
0xdc343b: jmp 0x140dc34e9
0xdc3440: vmovsd xmm0, qword ptr [rdi + 0xe0]
0xdc3448: mov ecx, dword ptr [rdi + 0xe8]
0xdc344e: vmovsd qword ptr [rbp - 0x41], xmm0
0xdc3453: mov dword ptr [rbp - 0x39], ecx
0xdc3456: jmp 0x140dc34e9
0xdc345b: vmovss xmm7, dword ptr [r14 + 0xa6c]
0xdc3464: vmovss xmm3, dword ptr [r14 + 0xa68]
0xdc346d: vmovsd xmm8, qword ptr [rip + 0x4782a13]
0xdc3475: vmovss xmm0, dword ptr [r14 + 0xa88]
0xdc347e: vdivss xmm1, xmm0, xmm3
0xdc3482: vmulss xmm2, xmm1, xmm3
0xdc3486: vmulss xmm0, xmm3, dword ptr [rip + 0x4fafaa6]
0xdc348e: vsubss xmm1, xmm2, xmm0
0xdc3492: vmulss xmm2, xmm1, dword ptr [r14 + 0xa98]
0xdc349b: vaddss xmm5, xmm2, dword ptr [r14 + 0xa58]
0xdc34a4: vmovss xmm0, dword ptr [r14 + 0xa8c]
0xdc34ad: vdivss xmm1, xmm0, xmm7
0xdc34b1: vmulss xmm3, xmm1, xmm7
0xdc34b5: vmulss xmm2, xmm7, dword ptr [rip + 0x4fafa77]
0xdc34bd: vsubss xmm0, xmm3, xmm2
0xdc34c1: vmulss xmm1, xmm0, dword ptr [r14 + 0xa98]
0xdc34ca: vsubss xmm4, xmm1, dword ptr [r14 + 0xa5c]
0xdc34d3: vmulss xmm0, xmm4, dword ptr [rip + 0x4fb04ad]
0xdc34db: vmovss xmm8, xmm8, xmm5
0xdc34df: vmovsd qword ptr [rbp - 0x41], xmm8
0xdc34e4: vmovss dword ptr [rbp - 0x39], xmm0
0xdc34e9: lea rdx, [rbp + 0x67]
0xdc34ed: call 0x1406585c0
0xdc34f2: cmp word ptr [rax], si
0xdc34f5: je 0x140dc350c
0xdc34f7: mov byte ptr [rbp + 0x67], 0
0xdc34fb: mov word ptr [rbp + 0x6f], si
0xdc34ff: lea r8, [rbp + 0x67]
0xdc3503: lea rdx, [rbp + 0x6f]
0xdc3507: call 0x1406599f0
0xdc350c: mov rax, qword ptr [r14]
0xdc350f: mov rcx, r14
0xdc3512: call qword ptr [rax + 0x110]
0xdc3518: vmovups xmm0, xmmword ptr [rbp - 0x19]
0xdc351d: vmovdqa xmmword ptr [rbp - 0x19], xmm0
0xdc3522: lea r8, [rbp - 0x41]
0xdc3526: lea rdx, [rbp - 0x19]
0xdc352a: call 0x140def810
0xdc352f: nop 
0xdc3530: lea rdx, [rbp - 9]
0xdc3534: mov rcx, qword ptr [rip + 0x5fa5c55]
0xdc353b: mov rcx, qword ptr [rcx + 0x30]
0xdc353f: call 0x1408b44e0
0xdc3544: mov ebx, 1
0xdc3549: mov dword ptr [rbp - 0x49], ebx
0xdc354c: cmp byte ptr [rbp + 7], bl
0xdc354f: jne 0x140dc3574
0xdc3551: mov byte ptr [rbp + 0x67], bl
0xdc3554: mov rax, qword ptr [rbp - 1]
0xdc3558: mov rcx, qword ptr [rax + 0x68]
0xdc355c: mov rcx, qword ptr [rcx + 0x168]
0xdc3563: lea r9, [rbp + 0x67]
0xdc3567: lea r8, [rbp - 0x41]
0xdc356b: mov rcx, qword ptr [rcx + 8]
0xdc356f: call 0x140b85340
0xdc3574: and ebx, 0xfffffffe
0xdc3577: mov dword ptr [rbp - 0x49], ebx
0xdc357a: lea rax, [rip + 0x49628c7]
0xdc3581: mov qword ptr [rbp - 9], rax
0xdc3585: lea rcx, [rbp - 9]
0xdc3589: call 0x141434880
0xdc358e: lea r11, [rsp + 0xa0]
0xdc3596: mov rbx, qword ptr [r11 + 0x40]
0xdc359a: vmovaps xmm7, xmmword ptr [r11 - 0x10]
0xdc35a0: vmovaps xmm8, xmmword ptr [r11 - 0x20]
0xdc35a6: mov rsp, r11
0xdc35a9: pop r15
0xdc35ab: pop r14
0xdc35ad: pop rdi
0xdc35ae: pop rsi
0xdc35af: pop rbp
0xdc35b0: ret 
0xdc35b1: int3 
0xdc35b2: int3 
0xdc35b3: int3 
0xdc35b4: int3 
0xdc35b5: int3 
0xdc35b6: int3 
0xdc35b7: int3 
0xdc35b8: int3 
0xdc35b9: int3 
0xdc35ba: int3 
0xdc35bb: int3 
0xdc35bc: int3 
0xdc35bd: int3 
0xdc35be: int3 
0xdc35bf: int3 