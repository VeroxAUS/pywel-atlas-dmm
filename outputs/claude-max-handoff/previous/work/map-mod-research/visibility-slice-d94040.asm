0xd94040: mov rax, rsp
0xd94043: mov qword ptr [rax + 0x20], r9
0xd94047: mov qword ptr [rax + 0x18], r8
0xd9404b: mov byte ptr [rax + 0x10], dl
0xd9404e: mov qword ptr [rax + 8], rcx
0xd94052: push rbp
0xd94053: push rbx
0xd94054: push rsi
0xd94055: push rdi
0xd94056: push r12
0xd94058: push r13
0xd9405a: push r14
0xd9405c: push r15
0xd9405e: lea rbp, [rax - 0x968]
0xd94065: sub rsp, 0xa28
0xd9406c: vmovaps xmmword ptr [rax - 0x58], xmm6
0xd94071: vmovaps xmmword ptr [rax - 0x68], xmm7
0xd94076: vmovaps xmmword ptr [rax - 0x78], xmm8
0xd9407b: vmovaps xmmword ptr [rax - 0x88], xmm9
0xd94083: vmovaps xmmword ptr [rax - 0x98], xmm10
0xd9408b: vmovaps xmmword ptr [rax - 0xa8], xmm11
0xd94093: vmovaps xmmword ptr [rax - 0xb8], xmm12
0xd9409b: vmovaps xmmword ptr [rax - 0xc8], xmm13
0xd940a3: vmovaps xmmword ptr [rax - 0xd8], xmm14
0xd940ab: vmovaps xmmword ptr [rax - 0xe8], xmm15
0xd940b3: mov rsi, r9
0xd940b6: mov rdi, r8
0xd940b9: mov rbx, rcx
0xd940bc: xor r14d, r14d
0xd940bf: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd940c7: vsubss xmm2, xmm0, dword ptr [rip + 0x5f17919]
0xd940cf: vmovss xmm0, dword ptr [rip + 0x5f179b1]
0xd940d7: vsubss xmm1, xmm0, dword ptr [rip + 0x5f17909]
0xd940df: vdivss xmm3, xmm2, xmm1
0xd940e3: vmovss xmm2, dword ptr [rip + 0x4fdefc9]
0xd940eb: vsubss xmm10, xmm2, xmm3
0xd940ef: call 0x140d96760
0xd940f4: vmovaps xmm14, xmm0
0xd940f8: mov rax, qword ptr [rdi + 0xa0]
0xd940ff: test rax, rax
0xd94102: je 0x140d94127
0xd94104: cmp qword ptr [rax + 8], r14
0xd94108: jne 0x140d95e4c
0xd9410e: mov ecx, dword ptr [rdi + 0x48]
0xd94111: mov dword ptr [rbp - 0x80], ecx
0xd94114: cmp qword ptr [rax + 0x58], r14
0xd94118: je 0x140d9412d
0xd9411a: cmp ecx, 1
0xd9411d: jbe 0x140d95e4c
0xd94123: dec ecx
0xd94125: jmp 0x140d9412a
0xd94127: mov ecx, dword ptr [rdi + 0x48]
0xd9412a: mov dword ptr [rbp - 0x80], ecx
0xd9412d: mov edx, r14d
0xd94130: mov dword ptr [rbp - 0x7c], edx
0xd94133: test ecx, ecx
0xd94135: je 0x140d95e4c
0xd9413b: mov r8, r14
0xd9413e: mov qword ptr [rbp - 0x60], r14
0xd94142: mov r9, r14
0xd94145: mov qword ptr [rbp - 0x58], r14
0xd94149: lea r13, [rip + 0x47f9500]
0xd94150: mov r15d, 0xffff
0xd94156: vxorps xmm11, xmm11, xmm11
0xd9415b: vmovss xmm12, dword ptr [rip + 0x4fdf22d]
0xd94163: vmovss xmm13, dword ptr [rip + 0x4fdedc9]
0xd9416b: vmovss xmm15, dword ptr [rip + 0x4fdf70d]
0xd94173: mov rax, qword ptr [rdi + 0xa0]
0xd9417a: test rax, rax
0xd9417d: je 0x140d9418a
0xd9417f: cmp qword ptr [rax + 8], 0
0xd94184: jne 0x140d9422e
0xd9418a: mov ecx, dword ptr [rdi + 0x48]
0xd9418d: cmp ecx, edx
0xd9418f: jbe 0x140d9422e
0xd94195: test rax, rax
0xd94198: je 0x140d941c5
0xd9419a: cmp qword ptr [rax + 0x58], 0
0xd9419f: je 0x140d941c5
0xd941a1: cmp ecx, 1
0xd941a4: je 0x140d9422e
0xd941aa: mov rdi, qword ptr [rdi + 0x40]
0xd941ae: cmp edx, dword ptr [rax + 0x90]
0xd941b4: jae 0x140d941bc
0xd941b6: mov rdi, qword ptr [r9 + rdi]
0xd941ba: jmp 0x140d941cd
0xd941bc: lea eax, [rdx + 1]
0xd941bf: mov rdi, qword ptr [rdi + rax*8]
0xd941c3: jmp 0x140d941cd
0xd941c5: mov rax, qword ptr [rdi + 0x40]
0xd941c9: mov rdi, qword ptr [rax + r8*8]
0xd941cd: test rdi, rdi
0xd941d0: je 0x140d9422e
0xd941d2: mov rax, qword ptr [rdi + 0xa0]
0xd941d9: test rax, rax
0xd941dc: je 0x140d941e5
0xd941de: cmp qword ptr [rax + 8], 0
0xd941e3: jne 0x140d9422e
0xd941e5: mov rdi, qword ptr [rdi + 0xd8]
0xd941ec: test rdi, rdi
0xd941ef: jne 0x140d9420c
0xd941f1: test rax, rax
0xd941f4: je 0x140d9422e
0xd941f6: mov rcx, qword ptr [rax + 0x58]
0xd941fa: test rcx, rcx
0xd941fd: je 0x140d9422e
0xd941ff: call 0x143ed84d0
0xd94204: mov rdi, rax
0xd94207: test rax, rax
0xd9420a: je 0x140d9422e
0xd9420c: mov rax, qword ptr [rdi]
0xd9420f: lea rdx, [rip + 0x5f3beba]
0xd94216: mov rcx, rdi
0xd94219: call qword ptr [rax + 0x190]
0xd9421f: test al, al
0xd94221: cmove rdi, r14
0xd94225: test rdi, rdi
0xd94228: cmove rdi, r14
0xd9422c: jmp 0x140d94231
0xd9422e: mov rdi, r14
0xd94231: vmovd xmm1, r14d
0xd94236: movzx eax, byte ptr [rdi + 0x292]
0xd9423d: vmovd xmm0, eax
0xd94241: vpcmpeqd xmm2, xmm0, xmm1
0xd94245: vmovss xmm0, dword ptr [rbp + 0x998]
0xd9424d: vblendvps xmm9, xmm0, xmm11, xmm2
0xd94253: lea r12, [rdi + 0xde]
0xd9425a: mov rcx, r12
0xd9425d: call 0x140537250
0xd94262: cmp byte ptr [rax + 0xb0], 0
0xd94269: je 0x140d9465d
0xd9426f: movzx r15d, word ptr [r12]
0xd94274: vmovaps xmm7, xmm11
0xd94279: vmovaps xmm8, xmm11
0xd9427e: mov r8d, dword ptr [rdi + 0x1c0]
0xd94285: lea rdx, [rbp - 0x28]
0xd94289: call 0x14064f570
0xd9428e: nop 
0xd9428f: mov r9, qword ptr [rbp - 0x18]
0xd94293: test r9b, r9b
0xd94296: je 0x140d9444b
0xd9429c: mov rbx, qword ptr [rbp - 0x20]
0xd942a0: lea rdx, [rbx + 8]
0xd942a4: test rbx, rbx
0xd942a7: cmove rdx, r14
0xd942ab: mov rdx, qword ptr [rdx]
0xd942ae: lea rcx, [rbp - 0x38]
0xd942b2: call 0x140393df0
0xd942b7: nop 
0xd942b8: mov rcx, qword ptr [rbx + 0x68]
0xd942bc: lea rdx, [rbp + 0x30]
0xd942c0: mov rcx, qword ptr [rcx + 0x1a0]
0xd942c7: call 0x1404f8220
0xd942cc: movsx ecx, word ptr [rax + 0xe]
0xd942d0: vxorps xmm0, xmm0, xmm0
0xd942d4: vcvtsi2ss xmm0, xmm0, ecx
0xd942d8: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf414]
0xd942e0: vaddss xmm8, xmm1, dword ptr [rax + 8]
0xd942e5: vmovss xmm6, dword ptr [rax + 4]
0xd942ea: movsx ecx, word ptr [rax + 0xc]
0xd942ee: vxorps xmm0, xmm0, xmm0
0xd942f2: vcvtsi2ss xmm0, xmm0, ecx
0xd942f6: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf3f6]
0xd942fe: vaddss xmm7, xmm1, dword ptr [rax]
0xd94302: mov rcx, qword ptr [rbp - 0x38]
0xd94306: mov rax, qword ptr [rcx]
0xd94309: mov dl, 1
0xd9430b: call qword ptr [rax + 0x20]
0xd9430e: vmovss dword ptr [rbp - 0x50], xmm7
0xd94313: vmovss dword ptr [rbp - 0x4c], xmm6
0xd94318: vmovss dword ptr [rbp - 0x48], xmm8
0xd9431d: mov r10, qword ptr [rdi + 0x1e0]
0xd94324: test r10, r10
0xd94327: je 0x140d9443b
0xd9432d: mov r8, qword ptr [rbp - 0x20]
0xd94331: mov dl, 5
0xd94333: lea rcx, [rbp + 0x40]
0xd94337: call 0x142239930
0xd9433c: nop 
0xd9433d: mov qword ptr [rbp + 0x40], r13
0xd94341: mov qword ptr [rbp + 0x870], rsi
0xd94348: mov rcx, qword ptr [r10]
0xd9434b: mov rax, qword ptr [rcx]
0xd9434e: xor r8d, r8d
0xd94351: lea rdx, [rbp + 0x40]
0xd94355: cmp qword ptr [rbp + 0x868], r8
0xd9435c: jne 0x140d94363
0xd9435e: call qword ptr [rax + 8]
0xd94361: jmp 0x140d94366
0xd94363: call qword ptr [rax + 0x10]
0xd94366: movzx ebx, al
0xd94369: mov qword ptr [rbp + 0x40], r13
0xd9436d: lea rax, [rip + 0x47e0114]
0xd94374: mov qword ptr [rbp + 0x40], rax
0xd94378: lea rax, [rbp + 0x50]
0xd9437c: mov qword ptr [rbp + 0x18], rax
0xd94380: lea rcx, [rbp + 0x50]
0xd94384: call 0x1403a2ac0
0xd94389: mov ecx, r14d
0xd9438c: lea rdx, [rdi + 0x1e8]
0xd94393: mov rax, rdx
0xd94396: test bl, bl
0xd94398: jne 0x140d943e3
0xd9439a: nop word ptr [rax + rax]
0xd943a0: cmp byte ptr [rax], 0
0xd943a3: jne 0x140d943b3
0xd943a5: inc ecx
0xd943a7: inc rax
0xd943aa: cmp ecx, 3
0xd943ad: jb 0x140d943a0
0xd943af: xor cl, cl
0xd943b1: jmp 0x140d943b5
0xd943b3: mov cl, 1
0xd943b5: movzx eax, byte ptr [rdi + 0x1e9]
0xd943bc: bts eax, 3
0xd943c0: mov byte ptr [rdi + 0x1e9], al
0xd943c6: mov eax, r14d
0xd943c9: nop dword ptr [rax]
0xd943d0: cmp byte ptr [rdx], 0
0xd943d3: jne 0x140d94423
0xd943d5: inc eax
0xd943d7: inc rdx
0xd943da: cmp eax, 3
0xd943dd: jb 0x140d943d0
0xd943df: xor al, al
0xd943e1: jmp 0x140d94425
0xd943e3: cmp byte ptr [rax], 0
0xd943e6: jne 0x140d943f6
0xd943e8: inc ecx
0xd943ea: inc rax
0xd943ed: cmp ecx, 3
0xd943f0: jb 0x140d943e3
0xd943f2: xor cl, cl
0xd943f4: jmp 0x140d943f8
0xd943f6: mov cl, 1
0xd943f8: movzx eax, byte ptr [rdi + 0x1e9]
0xd943ff: btr eax, 3
0xd94403: mov byte ptr [rdi + 0x1e9], al
0xd94409: mov eax, r14d
0xd9440c: nop dword ptr [rax]
0xd94410: cmp byte ptr [rdx], 0
0xd94413: jne 0x140d94423
0xd94415: inc eax
0xd94417: inc rdx
0xd9441a: cmp eax, 3
0xd9441d: jb 0x140d94410
0xd9441f: xor al, al
0xd94421: jmp 0x140d94425
0xd94423: mov al, 1
0xd94425: cmp cl, al
0xd94427: je 0x140d9443b
0xd94429: mov rdx, qword ptr [rdi]
0xd9442c: mov rcx, rdi
0xd9442f: test al, al
0xd94431: je 0x140d94438
0xd94433: call qword ptr [rdx + 0x28]
0xd94436: jmp 0x140d9443b
0xd94438: call qword ptr [rdx + 0x20]
0xd9443b: lea rdx, [rbp - 0x50]
0xd9443f: mov rcx, rdi
0xd94442: call 0x140decaf0
0xd94447: mov r9, qword ptr [rbp - 0x18]
0xd9444b: mov esi, 0x1ec
0xd94450: mov rax, qword ptr gs:[0x58]
0xd94459: mov r14, qword ptr [rax]
0xd9445c: movzx edx, byte ptr [rsi + r14]
0xd94461: mov r8, qword ptr [rip + 0x5fd50c0]
0xd94468: mov rax, r8
0xd9446b: mov r10, qword ptr [rip + 0x5fd50be]
0xd94472: test dl, dl
0xd94474: cmovne rax, r10
0xd94478: mov rax, qword ptr [rax]
0xd9447b: mov rcx, qword ptr [rax + 8]
0xd9447f: mov rax, qword ptr [rcx + 0x270]
0xd94486: cmp r15w, word ptr [rax + 0xf8]
0xd9448e: jne 0x140d94518
0xd94494: vmovaps xmm2, xmm11
0xd94499: test r9b, r9b
0xd9449c: je 0x140d9450c
0xd9449e: mov rbx, qword ptr [rbp - 0x20]
0xd944a2: lea rdx, [rbx + 8]
0xd944a6: test rbx, rbx
0xd944a9: mov ecx, 0
0xd944ae: cmove rdx, rcx
0xd944b2: mov rdx, qword ptr [rdx]
0xd944b5: lea rcx, [rbp - 0x30]
0xd944b9: call 0x140393df0
0xd944be: nop 
0xd944bf: mov rcx, qword ptr [rbx + 0x68]
0xd944c3: mov rcx, qword ptr [rcx + 0x1a0]
0xd944ca: call 0x1417e9170
0xd944cf: vmovaps xmm6, xmm0
0xd944d3: mov rcx, qword ptr [rbp - 0x30]
0xd944d7: mov rax, qword ptr [rcx]
0xd944da: mov dl, 1
0xd944dc: call qword ptr [rax + 0x20]
0xd944df: vcomiss xmm11, xmm6
0xd944e3: jbe 0x140d944ec
0xd944e5: vaddss xmm0, xmm6, xmm12
0xd944ea: jmp 0x140d944f1
0xd944ec: vsubss xmm0, xmm6, xmm12
0xd944f1: vmulss xmm2, xmm0, dword ptr [rip + 0x4fdf053]
0xd944f9: movzx edx, byte ptr [rsi + r14]
0xd944fe: mov r10, qword ptr [rip + 0x5fd502b]
0xd94505: mov r8, qword ptr [rip + 0x5fd501c]
0xd9450c: vmulss xmm1, xmm13, dword ptr [rdi + 0x1d0]
0xd94514: vsubss xmm9, xmm2, xmm1
0xd94518: mov rax, r8
0xd9451b: test dl, dl
0xd9451d: cmovne rax, r10
0xd94521: mov rax, qword ptr [rax]
0xd94524: mov rcx, qword ptr [rax + 8]
0xd94528: mov rax, qword ptr [rcx + 0x270]
0xd9452f: cmp r15w, word ptr [rax + 0x10a]
0xd94537: je 0x140d9455b
0xd94539: test dl, dl
0xd9453b: cmovne r8, r10
0xd9453f: mov rax, qword ptr [r8]
0xd94542: mov rcx, qword ptr [rax + 8]
0xd94546: mov rax, qword ptr [rcx + 0x270]
0xd9454d: cmp r15w, word ptr [rax + 0xf8]
0xd94555: jne 0x140d94639
0xd9455b: mov rax, qword ptr [rbp + 0x990]
0xd94562: vsubss xmm2, xmm8, dword ptr [rax + 8]
0xd94567: vsubss xmm0, xmm7, dword ptr [rax]
0xd9456b: vmovss xmm3, dword ptr [rip + 0x5f1a295]
0xd94573: vmulss xmm1, xmm0, xmm0
0xd94577: vmulss xmm0, xmm2, xmm2
0xd9457b: vaddss xmm2, xmm1, xmm0
0xd9457f: vmulss xmm1, xmm3, xmm3
0xd94583: xor r14d, r14d
0xd94586: lea rdx, [rdi + 0x1e8]
0xd9458d: mov ecx, r14d
0xd94590: mov rax, rdx
0xd94593: vcomiss xmm1, xmm2
0xd94597: jb 0x140d945e8
0xd94599: nop dword ptr [rax]
0xd945a0: cmp byte ptr [rax], r14b
0xd945a3: jne 0x140d945b3
0xd945a5: inc ecx
0xd945a7: inc rax
0xd945aa: cmp ecx, 3
0xd945ad: jb 0x140d945a0
0xd945af: xor cl, cl
0xd945b1: jmp 0x140d945b5
0xd945b3: mov cl, 1
0xd945b5: movzx eax, byte ptr [rdi + 0x1e9]
0xd945bc: btr eax, 2
0xd945c0: mov byte ptr [rdi + 0x1e9], al
0xd945c6: mov eax, r14d
0xd945c9: nop dword ptr [rax]
0xd945d0: cmp byte ptr [rdx], r14b
0xd945d3: jne 0x140d94624
0xd945d5: inc eax
0xd945d7: inc rdx
0xd945da: cmp eax, 3
0xd945dd: jb 0x140d945d0
0xd945df: xor al, al
0xd945e1: jmp 0x140d94626
0xd945e3: call qword ptr [rdx + 0x20]
0xd945e6: jmp 0x140d9463c
0xd945e8: cmp byte ptr [rax], r14b
0xd945eb: jne 0x140d945fb
0xd945ed: inc ecx
0xd945ef: inc rax
0xd945f2: cmp ecx, 3
0xd945f5: jb 0x140d945e8
0xd945f7: xor cl, cl
0xd945f9: jmp 0x140d945fd
0xd945fb: mov cl, 1
0xd945fd: movzx eax, byte ptr [rdi + 0x1e9]
0xd94604: bts eax, 2
0xd94608: mov byte ptr [rdi + 0x1e9], al
0xd9460e: mov eax, r14d
0xd94611: cmp byte ptr [rdx], r14b
0xd94614: jne 0x140d94624
0xd94616: inc eax
0xd94618: inc rdx
0xd9461b: cmp eax, 3
0xd9461e: jb 0x140d94611
0xd94620: xor al, al
0xd94622: jmp 0x140d94626
0xd94624: mov al, 1
0xd94626: cmp cl, al
0xd94628: je 0x140d9463c
0xd9462a: mov rdx, qword ptr [rdi]
0xd9462d: mov rcx, rdi
0xd94630: test al, al
0xd94632: je 0x140d945e3
0xd94634: call qword ptr [rdx + 0x28]
0xd94637: jmp 0x140d9463c
0xd94639: xor r14d, r14d
0xd9463c: lea rax, [rip + 0x4991805]
0xd94643: mov qword ptr [rbp - 0x28], rax
0xd94647: lea rcx, [rbp - 0x28]
0xd9464b: call 0x141434880
0xd94650: mov rbx, qword ptr [rbp + 0x970]
0xd94657: mov r15d, 0xffff
0xd9465d: vmovss xmm0, dword ptr [rdi + 0xe0]
0xd94665: vmovss dword ptr [rbp - 0x68], xmm0
0xd9466a: vmovss xmm1, dword ptr [rdi + 0xe8]
0xd94672: vmovss dword ptr [rbp - 0x64], xmm1
0xd94677: vmovss xmm3, dword ptr [rbx + 0xa9c]
0xd9467f: movzx r8d, byte ptr [rbx + 0xae4]
0xd94687: vmovss xmm1, dword ptr [rbx + 0xabc]
0xd9468f: mov rcx, rdi
0xd94692: call 0x140d91820
0xd94697: vmovaps xmm8, xmm0
0xd9469b: mov r13b, 1
0xd9469e: mov byte ptr [rbp + 0x978], r13b
0xd946a5: mov ecx, dword ptr [rbx + 0xbf8]
0xd946ab: cmp ecx, 2
0xd946ae: je 0x140d947e9
0xd946b4: lea eax, [rcx - 4]
0xd946b7: cmp eax, 1
0xd946ba: jbe 0x140d947e9
0xd946c0: cmp ecx, 1
0xd946c3: jne 0x140d94a6c
0xd946c9: movzx eax, word ptr [r12]
0xd946ce: mov word ptr [rbp + 0x978], ax
0xd946d5: cmp dword ptr [rdi + 0xd8], -1
0xd946dc: jne 0x140d946e8
0xd946de: cmp ax, r15w
0xd946e2: je 0x140d94a6c
0xd946e8: lea rcx, [rbp + 0x978]
0xd946ef: call 0x140537250
0xd946f4: mov ecx, dword ptr [rax + 0x2c]
0xd946f7: cmp ecx, 0x16
0xd946fa: je 0x140d9470d
0xd946fc: lea eax, [rcx - 0x5a]