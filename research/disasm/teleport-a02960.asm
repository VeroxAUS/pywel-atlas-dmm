0xa02960: mov qword ptr [rsp + 0x10], rbx
0xa02965: mov qword ptr [rsp + 0x18], rbp
0xa0296a: push rsi
0xa0296b: push rdi
0xa0296c: push r14
0xa0296e: sub rsp, 0x80
0xa02975: vmovaps xmmword ptr [rsp + 0x70], xmm7
0xa0297b: vmovaps xmmword ptr [rsp + 0x60], xmm8
0xa02981: movzx ebx, r9b
0xa02985: mov rdi, r8
0xa02988: mov rsi, rdx
0xa0298b: mov rbp, rcx
0xa0298e: mov rax, qword ptr [rcx + 8]
0xa02992: lea rdx, [rax + 8]
0xa02996: xor r14d, r14d
0xa02999: test rax, rax
0xa0299c: cmove rdx, r14
0xa029a0: mov r8b, 1
0xa029a3: mov rdx, qword ptr [rdx]
0xa029a6: lea rcx, [rsp + 0x50]
0xa029ab: call 0x140393650
0xa029b0: nop 
0xa029b1: vmovsd xmm2, qword ptr [rdi]
0xa029b5: vmovsd qword ptr [rsp + 0x40], xmm2
0xa029bb: vmovss xmm4, dword ptr [rip + 0x5370d31]
0xa029c3: vdivss xmm0, xmm2, xmm4
0xa029c7: vcvttss2si eax, xmm0
0xa029cb: vmovss xmm3, dword ptr [rdi + 8]
0xa029d0: vdivss xmm1, xmm3, xmm4
0xa029d4: vcvttss2si ecx, xmm1
0xa029d8: mov word ptr [rsp + 0x4c], ax
0xa029dd: mov word ptr [rsp + 0x4e], cx
0xa029e2: cwde 
0xa029e3: vxorps xmm0, xmm0, xmm0
0xa029e7: vcvtsi2ss xmm0, xmm0, eax
0xa029eb: vmulss xmm1, xmm0, xmm4
0xa029ef: vsubss xmm2, xmm2, xmm1
0xa029f3: vmovss dword ptr [rsp + 0x40], xmm2
0xa029f9: vxorps xmm8, xmm8, xmm8
0xa029fe: vaddss xmm1, xmm8, dword ptr [rsp + 0x44]
0xa02a04: vmovss dword ptr [rsp + 0x44], xmm1
0xa02a0a: movsx eax, cx
0xa02a0d: vxorps xmm0, xmm0, xmm0
0xa02a11: vcvtsi2ss xmm0, xmm0, eax
0xa02a15: vmulss xmm1, xmm0, xmm4
0xa02a19: vsubss xmm2, xmm3, xmm1
0xa02a1d: vmovss dword ptr [rsp + 0x48], xmm2
0xa02a23: mov byte ptr [rsp + 0x30], r14b
0xa02a28: mov byte ptr [rsp + 0x28], r14b
0xa02a2d: lea rax, [rip + 0x4b43454]
0xa02a34: mov qword ptr [rsp + 0x20], rax
0xa02a39: xor r9d, r9d
0xa02a3c: movzx r8d, bl
0xa02a40: lea rdx, [rsp + 0x40]
0xa02a45: mov rcx, rbp
0xa02a48: call 0x1409fca60
0xa02a4d: xor r9d, r9d
0xa02a50: mov r8b, 0xf
0xa02a53: lea rdx, [rdi + 0xc]
0xa02a57: mov rcx, rbp
0xa02a5a: call 0x1409fce60
0xa02a5f: nop 
0xa02a60: mov rbx, qword ptr [rsp + 0x50]
0xa02a65: mov rax, qword ptr [rbx]
0xa02a68: xor edx, edx
0xa02a6a: mov rcx, rbx
0xa02a6d: call qword ptr [rax + 0x20]
0xa02a70: cmp byte ptr [rsp + 0x58], 1
0xa02a75: jne 0x140a02aa5
0xa02a77: mov eax, 0xffffffff
0xa02a7c: lock xadd dword ptr [rbx + 8], eax
0xa02a81: cmp eax, 1
0xa02a84: jne 0x140a02a98
0xa02a86: test dword ptr [rbx + 0xc], 0x40000000
0xa02a8d: je 0x140a02aa5
0xa02a8f: mov rax, qword ptr [rbx]
0xa02a92: mov rcx, rbx
0xa02a95: call qword ptr [rax + 0x40]
0xa02a98: test dword ptr [rbx + 0xc], 0x40000000
0xa02a9f: je 0x140a02aa5
0xa02aa1: lock dec dword ptr [rbx + 0xc]
0xa02aa5: lea rcx, [rdi + 0xc]
0xa02aa9: call 0x140393bb0
0xa02aae: vmovaps xmm7, xmm0
0xa02ab2: call 0x144898f68
0xa02ab7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x5373291]
0xa02abf: vmovss dword ptr [rsp + 0x40], xmm1
0xa02ac5: vmovss dword ptr [rsp + 0x44], xmm8
0xa02acb: vmovaps xmm0, xmm7
0xa02acf: call 0x144898f56
0xa02ad4: vxorps xmm1, xmm0, xmmword ptr [rip + 0x5373274]
0xa02adc: vmovss dword ptr [rsp + 0x48], xmm1
0xa02ae2: mov rax, qword ptr [rbp + 8]
0xa02ae6: mov rcx, qword ptr [rax + 0x68]
0xa02aea: mov rcx, qword ptr [rcx + 0x1a8]
0xa02af1: lea rdx, [rsp + 0x40]
0xa02af6: mov rcx, qword ptr [rcx + 0x28]
0xa02afa: call 0x141f847a0
0xa02aff: mov dword ptr [rsi], r14d
0xa02b02: mov rax, rsi
0xa02b05: lea r11, [rsp + 0x80]
0xa02b0d: mov rbx, qword ptr [r11 + 0x28]
0xa02b11: mov rbp, qword ptr [r11 + 0x30]
0xa02b15: vmovaps xmm7, xmmword ptr [rsp + 0x70]
0xa02b1b: vmovaps xmm8, xmmword ptr [r11 - 0x20]
0xa02b21: mov rsp, r11
0xa02b24: pop r14
0xa02b26: pop rdi
0xa02b27: pop rsi
0xa02b28: ret 