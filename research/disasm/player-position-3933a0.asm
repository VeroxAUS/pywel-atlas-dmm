0x3933a0: vmovss xmm0, dword ptr [rcx + 0x18]
0x3933a5: vucomiss xmm0, dword ptr [rip + 0x66d2567]
0x3933ad: jp 0x14039345e
0x3933b3: jne 0x14039345e
0x3933b9: vmovss xmm0, dword ptr [rcx + 0xc]
0x3933be: vucomiss xmm0, dword ptr [rip + 0x66d2542]
0x3933c6: jp 0x14039345e
0x3933cc: jne 0x14039345e
0x3933d2: vmovss xmm0, dword ptr [rcx + 0x10]
0x3933d7: vucomiss xmm0, dword ptr [rip + 0x66d252d]
0x3933df: jp 0x14039345e
0x3933e1: jne 0x14039345e
0x3933e3: vmovss xmm0, dword ptr [rcx + 0x14]
0x3933e8: vucomiss xmm0, dword ptr [rip + 0x66d2520]
0x3933f0: jp 0x14039345e
0x3933f2: jne 0x14039345e
0x3933f4: vmovss xmm0, dword ptr [rcx + 0x1c]
0x3933f9: vxorps xmm1, xmm1, xmm1
0x3933fd: vucomiss xmm0, xmm1
0x393401: jp 0x14039345e
0x393403: jne 0x14039345e
0x393405: vmovss xmm0, dword ptr [rcx + 0x20]
0x39340a: vucomiss xmm0, xmm1
0x39340e: jp 0x14039345e
0x393410: jne 0x14039345e
0x393412: vmovss xmm0, dword ptr [rcx + 0x24]
0x393417: vucomiss xmm0, xmm1
0x39341b: jp 0x14039345e
0x39341d: jne 0x14039345e
0x39341f: vmovss xmm0, dword ptr [rcx]
0x393423: vmovss xmm1, dword ptr [rip + 0x59dfc89]
0x39342b: vucomiss xmm0, xmm1
0x39342f: jp 0x14039345e
0x393431: jne 0x14039345e
0x393433: vmovss xmm0, dword ptr [rcx + 4]
0x393438: vucomiss xmm0, xmm1
0x39343c: jp 0x14039345e
0x39343e: jne 0x14039345e
0x393440: vmovss xmm0, dword ptr [rcx + 8]
0x393445: vucomiss xmm0, xmm1
0x393449: jp 0x14039345e
0x39344b: jne 0x14039345e
0x39344d: cmp word ptr [rcx + 0x28], 0
0x393452: jne 0x14039345e
0x393454: cmp word ptr [rcx + 0x2a], 0
0x393459: jne 0x14039345e
0x39345b: mov al, 1
0x39345d: ret 
0x39345e: xor al, al
0x393460: ret 
0x393461: int3 
0x393462: int3 
0x393463: int3 
0x393464: int3 
0x393465: int3 
0x393466: int3 
0x393467: int3 
0x393468: int3 
0x393469: int3 
0x39346a: int3 
0x39346b: int3 
0x39346c: int3 
0x39346d: int3 
0x39346e: int3 
0x39346f: int3 
0x393470: push rbx
0x393472: sub rsp, 0x80
0x393479: vmovups ymm0, ymmword ptr [rcx]
0x39347d: mov eax, dword ptr [rcx + 0x28]
0x393480: mov rbx, rdx
0x393483: vmovaps xmmword ptr [rsp + 0x70], xmm6
0x393489: vmovsd xmm6, qword ptr [rcx + 0x20]
0x39348e: lea rdx, [rcx + 0x38]
0x393492: mov dword ptr [rsp + 0x68], eax
0x393496: vmovsd qword ptr [rsp + 0x60], xmm6
0x39349c: mov rcx, rdx
0x39349f: vmovups ymmword ptr [rsp + 0x20], ymm0
0x3934a5: vmovups ymmword ptr [rsp + 0x40], ymm0
0x3934ab: vzeroupper 
0x3934ae: call 0x1403933a0
0x3934b3: test al, al
0x3934b5: jne 0x1403934cf
0x3934b7: lea rcx, [rsp + 0x40]
0x3934bc: call 0x1412b1c00
0x3934c1: vmovups ymm0, ymmword ptr [rsp + 0x40]
0x3934c7: vmovsd xmm6, qword ptr [rsp + 0x60]
0x3934cd: jmp 0x1403934d5
0x3934cf: vmovups ymm0, ymmword ptr [rsp + 0x20]
0x3934d5: movsx eax, word ptr [rsp + 0x68]
0x3934da: vmovups ymmword ptr [rbx], ymm0
0x3934de: vxorps xmm0, xmm0, xmm0
0x3934e2: vcvtsi2ss xmm0, xmm0, eax
0x3934e6: vmulss xmm0, xmm0, dword ptr [rip + 0x59e0206]
0x3934ee: movsx eax, word ptr [rsp + 0x6a]
0x3934f3: vmovsd qword ptr [rbx + 0x20], xmm6
0x3934f8: vaddss xmm1, xmm0, dword ptr [rbx + 0x1c]
0x3934fd: vxorps xmm0, xmm0, xmm0
0x393501: vaddss xmm0, xmm0, dword ptr [rbx + 0x20]
0x393506: vmovss dword ptr [rbx + 0x20], xmm0
0x39350b: vxorps xmm0, xmm0, xmm0
0x39350f: vcvtsi2ss xmm0, xmm0, eax
0x393513: vmovss dword ptr [rbx + 0x1c], xmm1
0x393518: vmulss xmm1, xmm0, dword ptr [rip + 0x59e01d4]
0x393520: vaddss xmm2, xmm1, dword ptr [rbx + 0x24]
0x393525: vmovss dword ptr [rbx + 0x24], xmm2
0x39352a: mov rax, rbx
0x39352d: vzeroupper 
0x393530: vmovaps xmm6, xmmword ptr [rsp + 0x70]
0x393536: add rsp, 0x80
0x39353d: pop rbx
0x39353e: ret 
0x39353f: int3 
0x393540: vmovss xmm2, dword ptr [rcx]
0x393544: vmovss xmm4, dword ptr [rip + 0x59e01a8]
0x39354c: vmovss xmm3, dword ptr [rcx + 8]
0x393551: vdivss xmm0, xmm2, xmm4
0x393555: vcvttss2si eax, xmm0
0x393559: add word ptr [rcx + 0xc], ax
0x39355d: vdivss xmm0, xmm3, xmm4
0x393561: vcvttss2si edx, xmm0
0x393565: add word ptr [rcx + 0xe], dx
0x393569: vxorps xmm0, xmm0, xmm0
0x39356d: cwde 
0x39356e: vcvtsi2ss xmm0, xmm0, eax
0x393572: vmulss xmm1, xmm0, xmm4
0x393576: vsubss xmm2, xmm2, xmm1
0x39357a: vmovss xmm1, dword ptr [rcx + 4]
0x39357f: vxorps xmm0, xmm0, xmm0
0x393583: vsubss xmm0, xmm1, xmm0
0x393587: vxorps xmm1, xmm1, xmm1
0x39358b: movsx eax, dx
0x39358e: vcvtsi2ss xmm1, xmm1, eax
0x393592: vmovss dword ptr [rcx + 4], xmm0
0x393597: vmulss xmm0, xmm1, xmm4
0x39359b: vmovss dword ptr [rcx], xmm2
0x39359f: vsubss xmm2, xmm3, xmm0
0x3935a3: vmovss dword ptr [rcx + 8], xmm2
0x3935a8: ret 
0x3935a9: int3 
0x3935aa: int3 
0x3935ab: int3 
0x3935ac: int3 
0x3935ad: int3 
0x3935ae: int3 
0x3935af: int3 
0x3935b0: jmp 0x14882ade0
0x3935b5: popfq 
0x3935b6: fcmovnb st(0), st(7)
0x3935b8: sbb dword ptr [rdi], ebx
0x3935ba: mov ch, 0x31
0x3935bc: jo 0x13d29637e
0x3935c2: xor bh, byte ptr [rip - 0x1c5b73f1]
0x3935c8: sar dh, 0xe9
0x3935cb: fimul dword ptr [rdi]