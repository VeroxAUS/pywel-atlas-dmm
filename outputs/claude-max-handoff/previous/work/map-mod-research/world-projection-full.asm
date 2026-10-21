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
0xd946ff: cmp eax, 3
0xd94702: jbe 0x140d9470d
0xd94704: cmp ecx, 0x17
0xd94707: jne 0x140d94a6c
0xd9470d: xor r13b, r13b
0xd94710: mov rax, qword ptr [rdi + 0x118]
0xd94717: mov rcx, qword ptr [rax + 0x20]
0xd9471b: mov byte ptr [rsp + 0x4c], 0x52
0xd94720: lea rdx, [rsp + 0x4c]
0xd94725: call 0x1435c9320
0xd9472a: mov r9, qword ptr [rdi + 0x118]
0xd94731: test r9, r9
0xd94734: je 0x140d94787
0xd94736: mov r10, qword ptr [r9 + 0x20]
0xd9473a: mov rax, qword ptr [r10]
0xd9473d: mov rcx, qword ptr [rax + 0xa0]
0xd94744: test rcx, rcx
0xd94747: je 0x140d94750
0xd94749: cmp qword ptr [rcx + 8], 0
0xd9474e: jne 0x140d9477f
0xd94750: mov r10, qword ptr [r10 + 8]
0xd94754: mov edx, r14d
0xd94757: mov r8d, dword ptr [r10 + 8]
0xd9475b: test r8d, r8d
0xd9475e: je 0x140d9477f
0xd94760: mov r10, qword ptr [r10]
0xd94763: mov eax, dword ptr [rip + 0x5f3bcfb]
0xd94769: nop dword ptr [rax]
0xd94770: mov ecx, edx
0xd94772: cmp eax, dword ptr [r10 + rcx*4]
0xd94776: je 0x140d9477f
0xd94778: inc edx
0xd9477a: cmp edx, r8d
0xd9477d: jb 0x140d94770
0xd9477f: and byte ptr [r9 + 0xb4], 0xf7
0xd94787: mov r9, qword ptr [rdi + 0x260]
0xd9478e: test r9, r9
0xd94791: je 0x140d947dd
0xd94793: mov r10, qword ptr [r9 + 0x20]
0xd94797: mov rax, qword ptr [r10]
0xd9479a: mov rcx, qword ptr [rax + 0xa0]
0xd947a1: test rcx, rcx
0xd947a4: je 0x140d947ad
0xd947a6: cmp qword ptr [rcx + 8], 0
0xd947ab: jne 0x140d947d5
0xd947ad: mov r10, qword ptr [r10 + 8]
0xd947b1: mov edx, r14d
0xd947b4: mov r8d, dword ptr [r10 + 8]
0xd947b8: test r8d, r8d
0xd947bb: je 0x140d947d5
0xd947bd: mov r10, qword ptr [r10]
0xd947c0: mov eax, dword ptr [rip + 0x5f3bc9e]
0xd947c6: mov ecx, edx
0xd947c8: cmp eax, dword ptr [r10 + rcx*4]
0xd947cc: je 0x140d947d5
0xd947ce: inc edx
0xd947d0: cmp edx, r8d
0xd947d3: jb 0x140d947c6
0xd947d5: and byte ptr [r9 + 0xb4], 0xf7
0xd947dd: mov byte ptr [rdi + 0x2b9], 1
0xd947e4: jmp 0x140d94a6c
0xd947e9: mov ecx, dword ptr [rdi + 0xd8]
0xd947ef: mov dword ptr [rsp + 0x48], ecx
0xd947f3: movzx eax, word ptr [r12]
0xd947f8: mov word ptr [rsp + 0x44], ax
0xd947fd: cmp ecx, -1
0xd94800: jne 0x140d9480e
0xd94802: cmp ax, r15w
0xd94806: je 0x140d94a6c
0xd9480c: jmp 0x140d94814
0xd9480e: cmp ax, r15w
0xd94812: je 0x140d9483c
0xd94814: mov eax, dword ptr [rdi + 0x2b0]
0xd9481a: test eax, eax
0xd9481c: je 0x140d94826
0xd9481e: shr eax, 2
0xd94821: and al, r13b
0xd94824: jmp 0x140d94838
0xd94826: mov rcx, r12
0xd94829: call 0x140537250
0xd9482e: cmp byte ptr [rax + 0xa8], 2
0xd94835: sete al
0xd94838: test al, al
0xd9483a: jne 0x140d94872
0xd9483c: cmp word ptr [r12], r15w
0xd94841: je 0x140d9486f
0xd94843: mov eax, dword ptr [rdi + 0x2b0]
0xd94849: test eax, eax
0xd9484b: je 0x140d94855
0xd9484d: shr eax, 3
0xd94850: and al, r13b
0xd94853: jmp 0x140d9486b
0xd94855: lea rcx, [rdi + 0xde]
0xd9485c: call 0x140537250
0xd94861: cmp byte ptr [rax + 0xa8], 3
0xd94868: sete al
0xd9486b: test al, al
0xd9486d: jne 0x140d94872
0xd9486f: xor r13b, r13b
0xd94872: lea rcx, [rsp + 0x48]
0xd94877: call 0x140473f20
0xd9487c: movzx r15d, byte ptr [rax + 0x3d1]
0xd94884: lea rcx, [rsp + 0x44]
0xd94889: call 0x140537250
0xd9488e: cmp dword ptr [rax + 0x2c], 0x1e
0xd94892: je 0x140d948b8
0xd94894: lea rcx, [rsp + 0x44]
0xd94899: call 0x140537250
0xd9489e: cmp dword ptr [rax + 0x2c], 0x20
0xd948a2: je 0x140d948b8
0xd948a4: lea rcx, [rsp + 0x44]
0xd948a9: call 0x140537250
0xd948ae: cmp dword ptr [rax + 0x2c], 0x21
0xd948b2: je 0x140d948b8
0xd948b4: xor bl, bl
0xd948b6: jmp 0x140d948ba
0xd948b8: mov bl, 1
0xd948ba: lea rcx, [rsp + 0x44]
0xd948bf: call 0x140537250
0xd948c4: mov r12d, dword ptr [rax + 0x2c]
0xd948c8: lea rcx, [rsp + 0x44]
0xd948cd: call 0x140537250
0xd948d2: mov r14d, dword ptr [rax + 0x2c]
0xd948d6: mov rax, qword ptr [rdi + 0xd0]
0xd948dd: cmp al, 9
0xd948df: jne 0x140d948fc
0xd948e1: mov eax, dword ptr [rdi + 0xc8]
0xd948e7: mov word ptr [rsp + 0x48], ax
0xd948ec: lea rcx, [rsp + 0x48]
0xd948f1: call 0x140433650
0xd948f6: movzx esi, byte ptr [rax + 0x62]
0xd948fa: jmp 0x140d948ff
0xd948fc: xor sil, sil
0xd948ff: lea rcx, [rsp + 0x44]
0xd94904: call 0x140537250
0xd94909: test r15b, r15b
0xd9490c: jne 0x140d9493d
0xd9490e: test bl, bl
0xd94910: jne 0x140d9493d
0xd94912: cmp r14d, 0x5e
0xd94916: je 0x140d9493d
0xd94918: cmp byte ptr [rax + 0xbc], bl
0xd9491e: jne 0x140d9493d
0xd94920: test sil, sil
0xd94923: jne 0x140d9493d
0xd94925: cmp r12d, 0x24
0xd94929: je 0x140d9493d
0xd9492b: cmp byte ptr [rdi + 0x2b6], sil
0xd94932: jne 0x140d9493d
0xd94934: test r13b, r13b
0xd94937: je 0x140d94a64
0xd9493d: xor r13b, r13b
0xd94940: mov rax, qword ptr [rdi + 0x118]
0xd94947: mov rcx, qword ptr [rax + 0x20]
0xd9494b: mov byte ptr [rsp + 0x4d], 0x52
0xd94950: lea rdx, [rsp + 0x4d]
0xd94955: call 0x1435c9320
0xd9495a: mov r9, qword ptr [rdi + 0x118]
0xd94961: test r9, r9
0xd94964: je 0x140d949e2
0xd94966: mov r10, qword ptr [r9 + 0x20]
0xd9496a: mov rax, qword ptr [r10]
0xd9496d: mov rcx, qword ptr [rax + 0xa0]
0xd94974: test rcx, rcx
0xd94977: je 0x140d94980
0xd94979: cmp qword ptr [rcx + 8], 0
0xd9497e: jne 0x140d949b6
0xd94980: mov r10, qword ptr [r10 + 8]
0xd94984: xor eax, eax
0xd94986: mov edx, eax
0xd94988: mov r8d, dword ptr [r10 + 8]
0xd9498c: test r8d, r8d
0xd9498f: je 0x140d949b6
0xd94991: mov r10, qword ptr [r10]
0xd94994: mov eax, dword ptr [rip + 0x5f3baca]
0xd9499a: nop word ptr [rax + rax]
0xd949a0: mov ecx, edx
0xd949a2: cmp eax, dword ptr [r10 + rcx*4]
0xd949a6: je 0x140d949b1
0xd949a8: inc edx
0xd949aa: cmp edx, r8d
0xd949ad: jb 0x140d949a0
0xd949af: jmp 0x140d949b6
0xd949b1: cmp edx, -1
0xd949b4: jne 0x140d949d1
0xd949b6: mov r11, qword ptr [rbp + 0x970]
0xd949bd: cmp byte ptr [r11 + 0xace], 1
0xd949c5: je 0x140d949d8
0xd949c7: and byte ptr [r9 + 0xb4], 0xf7
0xd949cf: jmp 0x140d949e9
0xd949d1: mov r11, qword ptr [rbp + 0x970]
0xd949d8: and byte ptr [r9 + 0xb4], 0xf7
0xd949e0: jmp 0x140d949e9
0xd949e2: mov r11, qword ptr [rbp + 0x970]
0xd949e9: mov r9, qword ptr [rdi + 0x260]
0xd949f0: test r9, r9
0xd949f3: je 0x140d947dd
0xd949f9: mov r10, qword ptr [r9 + 0x20]
0xd949fd: mov rax, qword ptr [r10]
0xd94a00: mov rcx, qword ptr [rax + 0xa0]
0xd94a07: test rcx, rcx
0xd94a0a: je 0x140d94a17
0xd94a0c: cmp qword ptr [rcx + 8], 0
0xd94a11: jne 0x140d947d5
0xd94a17: mov r10, qword ptr [r10 + 8]
0xd94a1b: xor eax, eax
0xd94a1d: mov edx, eax
0xd94a1f: mov r8d, dword ptr [r10 + 8]
0xd94a23: test r8d, r8d
0xd94a26: je 0x140d947d5
0xd94a2c: mov r10, qword ptr [r10]
0xd94a2f: mov eax, dword ptr [rip + 0x5f3ba2f]
0xd94a35: nop word ptr [rax + rax]
0xd94a40: mov ecx, edx
0xd94a42: cmp eax, dword ptr [r10 + rcx*4]
0xd94a46: je 0x140d947d5
0xd94a4c: inc edx
0xd94a4e: cmp edx, r8d
0xd94a51: jb 0x140d94a40
0xd94a53: and byte ptr [r9 + 0xb4], 0xf7
0xd94a5b: mov byte ptr [rdi + 0x2b9], 1
0xd94a62: jmp 0x140d94a6c
0xd94a64: movzx r13d, byte ptr [rbp + 0x978]
0xd94a6c: mov rax, qword ptr [rdi + 0x118]
0xd94a73: mov rcx, qword ptr [rax + 0x20]
0xd94a77: mov byte ptr [rsp + 0x4e], 6
0xd94a7c: lea r8, [rsp + 0x4e]
0xd94a81: lea rdx, [rbp - 8]
0xd94a85: call 0x1435c8ef0
0xd94a8a: mov rax, qword ptr [rdi + 0x118]
0xd94a91: mov rcx, qword ptr [rax + 0x20]
0xd94a95: mov byte ptr [rsp + 0x4f], 9
0xd94a9a: lea r8, [rsp + 0x4f]
0xd94a9f: lea rdx, [rbp + 8]
0xd94aa3: call 0x1435c8ef0
0xd94aa8: vmovaps xmm6, xmm11
0xd94aad: vmovaps xmm7, xmm11
0xd94ab2: lea rcx, [rbp - 8]
0xd94ab6: call 0x140615320
0xd94abb: movzx ecx, byte ptr [rax + 0xc]
0xd94abf: lea rbx, [rip + 0x5ef86ba]
0xd94ac6: mov rcx, qword ptr [rbx + rcx*8]
0xd94aca: mov rdx, rax
0xd94acd: mov rcx, qword ptr [rcx + 0x18]
0xd94ad1: call 0x143598390
0xd94ad6: test al, al
0xd94ad8: jne 0x140d94af0
0xd94ada: lea rcx, [rbp - 8]
0xd94ade: call 0x140615320
0xd94ae3: cmp byte ptr [rax + 0xe], 0
0xd94ae7: je 0x140d94aec
0xd94ae9: mov rax, qword ptr [rax]
0xd94aec: vmovss xmm6, dword ptr [rax]
0xd94af0: lea rcx, [rbp + 8]
0xd94af4: call 0x140615320
0xd94af9: movzx ecx, byte ptr [rax + 0xc]
0xd94afd: mov rcx, qword ptr [rbx + rcx*8]
0xd94b01: mov rdx, rax
0xd94b04: mov rcx, qword ptr [rcx + 0x18]
0xd94b08: call 0x143598390
0xd94b0d: test al, al
0xd94b0f: jne 0x140d94b27
0xd94b11: lea rcx, [rbp + 8]
0xd94b15: call 0x140615320
0xd94b1a: cmp byte ptr [rax + 0xe], 0
0xd94b1e: je 0x140d94b23
0xd94b20: mov rax, qword ptr [rax]
0xd94b23: vmovss xmm7, dword ptr [rax]
0xd94b27: vmovss dword ptr [rbp - 0x70], xmm6
0xd94b2c: vmovss dword ptr [rbp - 0x6c], xmm7
0xd94b31: lea rcx, [rdi + 0xde]
0xd94b38: call 0x140537250
0xd94b3d: movzx ecx, byte ptr [rax + 0xb1]
0xd94b44: vmovss dword ptr [rsp + 0x38], xmm14
0xd94b4a: mov byte ptr [rsp + 0x30], cl
0xd94b4e: movzx eax, byte ptr [rdi + 0x1eb]
0xd94b55: mov byte ptr [rsp + 0x28], al
0xd94b59: vmovss dword ptr [rsp + 0x20], xmm8
0xd94b5f: mov rbx, qword ptr [rbp - 0x70]
0xd94b63: mov r9, rbx
0xd94b66: mov r8, qword ptr [rbp - 0x68]
0xd94b6a: mov rdx, qword ptr [rdi + 8]
0xd94b6e: mov r12, qword ptr [rbp + 0x970]
0xd94b75: mov rcx, r12
0xd94b78: call 0x140d91660
0xd94b7d: movzx r15d, al
0xd94b81: mov byte ptr [rdi + 0x1eb], al
0xd94b87: mov byte ptr [rdi + 0x1ec], 1
0xd94b8e: mov rdx, rdi
0xd94b91: mov rcx, r12
0xd94b94: call 0x140db2510
0xd94b99: mov r8, qword ptr [rdi + 8]
0xd94b9d: test r15b, r15b
0xd94ba0: jne 0x140d94c1b
0xd94ba2: test r8, r8
0xd94ba5: je 0x140d95dff
0xd94bab: mov r10, qword ptr [r8 + 0x20]
0xd94baf: mov rax, qword ptr [r10]
0xd94bb2: mov rcx, qword ptr [rax + 0xa0]
0xd94bb9: test rcx, rcx
0xd94bbc: je 0x140d94bc5
0xd94bbe: cmp qword ptr [rcx + 8], 0
0xd94bc3: jne 0x140d94bf6
0xd94bc5: mov r10, qword ptr [r10 + 8]
0xd94bc9: xor eax, eax
0xd94bcb: mov edx, eax
0xd94bcd: mov r9d, dword ptr [r10 + 8]
0xd94bd1: test r9d, r9d
0xd94bd4: je 0x140d94bf6
0xd94bd6: mov r10, qword ptr [r10]
0xd94bd9: mov eax, dword ptr [rip + 0x5f3b885]
0xd94bdf: nop 
0xd94be0: mov ecx, edx
0xd94be2: cmp eax, dword ptr [r10 + rcx*4]
0xd94be6: je 0x140d94bf1
0xd94be8: inc edx
0xd94bea: cmp edx, r9d
0xd94bed: jb 0x140d94be0
0xd94bef: jmp 0x140d94bf6
0xd94bf1: cmp edx, -1
0xd94bf4: jne 0x140d94c0e
0xd94bf6: cmp byte ptr [r12 + 0xace], 1
0xd94bff: je 0x140d94c0e
0xd94c01: or byte ptr [r8 + 0xb4], 8
0xd94c09: jmp 0x140d95dff
0xd94c0e: and byte ptr [r8 + 0xb4], 0xf7
0xd94c16: jmp 0x140d95dff
0xd94c1b: test r8, r8
0xd94c1e: je 0x140d94c6b
0xd94c20: mov r10, qword ptr [r8 + 0x20]
0xd94c24: mov rax, qword ptr [r10]
0xd94c27: mov rcx, qword ptr [rax + 0xa0]
0xd94c2e: test rcx, rcx
0xd94c31: je 0x140d94c3a
0xd94c33: cmp qword ptr [rcx + 8], 0
0xd94c38: jne 0x140d94c63
0xd94c3a: mov r10, qword ptr [r10 + 8]
0xd94c3e: xor eax, eax
0xd94c40: mov edx, eax
0xd94c42: mov r9d, dword ptr [r10 + 8]
0xd94c46: test r9d, r9d
0xd94c49: je 0x140d94c63
0xd94c4b: mov r10, qword ptr [r10]
0xd94c4e: mov eax, dword ptr [rip + 0x5f3b810]
0xd94c54: mov ecx, edx
0xd94c56: cmp eax, dword ptr [r10 + rcx*4]
0xd94c5a: je 0x140d94c63
0xd94c5c: inc edx
0xd94c5e: cmp edx, r9d
0xd94c61: jb 0x140d94c54
0xd94c63: and byte ptr [r8 + 0xb4], 0xf7
0xd94c6b: mov rax, qword ptr gs:[0x58]
0xd94c74: mov rsi, qword ptr [rax]
0xd94c77: mov r14d, 0x1ec
0xd94c7d: mov rax, qword ptr [rip + 0x5fd48a4]
0xd94c84: cmp byte ptr [r14 + rsi], 0
0xd94c89: cmovne rax, qword ptr [rip + 0x5fd489f]
0xd94c91: mov rax, qword ptr [rax]
0xd94c94: mov rcx, qword ptr [rax + 8]
0xd94c98: mov rax, qword ptr [rcx + 0x270]
0xd94c9f: movzx ecx, word ptr [rax + 0x134]
0xd94ca6: cmp word ptr [rdi + 0xde], cx
0xd94cad: jne 0x140d94ce6
0xd94caf: movzx eax, byte ptr [r12 + 0xae4]
0xd94cb8: mov byte ptr [rsp + 0x28], al
0xd94cbc: vmovss xmm0, dword ptr [r12 + 0xabc]
0xd94cc6: vmovss dword ptr [rsp + 0x20], xmm0
0xd94ccc: vmovaps xmm3, xmm8
0xd94cd1: vmovss xmm2, dword ptr [r12 + 0xa98]
0xd94cdb: mov rdx, rbx
0xd94cde: mov rcx, rdi
0xd94ce1: call 0x140d8cb20
0xd94ce6: mov ebx, 0xffff
0xd94ceb: cmp word ptr [rdi + 0x288], bx
0xd94cf2: je 0x140d94d04
0xd94cf4: mov rcx, rdi
0xd94cf7: call 0x140d8bf00
0xd94cfc: cmp al, 3
0xd94cfe: je 0x140d94e62
0xd94d04: cmp dword ptr [r12 + 0xbf8], 3
0xd94d0d: jne 0x140d94e62
0xd94d13: cmp word ptr [rdi + 0xde], bx
0xd94d1a: je 0x140d94e62
0xd94d20: mov eax, dword ptr [rdi + 0x2b0]
0xd94d26: test eax, eax
0xd94d28: je 0x140d94d31
0xd94d2a: shr eax, 4
0xd94d2d: and al, 1
0xd94d2f: jmp 0x140d94d47
0xd94d31: lea rcx, [rdi + 0xde]
0xd94d38: call 0x140537250
0xd94d3d: cmp byte ptr [rax + 0xa8], 4
0xd94d44: sete al
0xd94d47: test al, al
0xd94d49: je 0x140d94e62
0xd94d4f: mov rax, qword ptr [rip + 0x5fd47d2]
0xd94d56: cmp byte ptr [r14 + rsi], 0
0xd94d5b: cmovne rax, qword ptr [rip + 0x5fd47cd]
0xd94d63: mov rdx, qword ptr [rdi + 0x118]
0xd94d6a: mov rax, qword ptr [rax]
0xd94d6d: mov rcx, qword ptr [rax + 8]
0xd94d71: mov rax, qword ptr [rcx + 0x270]
0xd94d78: movzx ecx, word ptr [rax + 0x148]
0xd94d7f: mov byte ptr [rsp + 0x20], r15b
0xd94d84: vmovaps xmm3, xmm10
0xd94d89: lea r8, [rsp + 0x60]
0xd94d8e: cmp word ptr [rdi + 0xde], cx
0xd94d95: mov rcx, r12
0xd94d98: jne 0x140d94de2
0xd94d9a: vmovups xmm0, xmmword ptr [r12 + 0x994]
0xd94da4: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94daa: mov eax, dword ptr [r12 + 0x9a4]
0xd94db2: mov dword ptr [rsp + 0x70], eax
0xd94db6: call 0x140dabae0
0xd94dbb: movzx ebx, al
0xd94dbe: mov rdx, qword ptr [rdi + 0x260]
0xd94dc5: test rdx, rdx
0xd94dc8: je 0x140d94e45
0xd94dca: vmovups xmm0, xmmword ptr [r12 + 0x994]
0xd94dd4: mov ecx, dword ptr [r12 + 0x9a4]
0xd94ddc: mov dword ptr [rsp + 0x70], ecx
0xd94de0: jmp 0x140d94e28
0xd94de2: vmovups xmm0, xmmword ptr [r12 + 0x980]
0xd94dec: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94df2: mov eax, dword ptr [r12 + 0x990]
0xd94dfa: mov dword ptr [rsp + 0x70], eax
0xd94dfe: call 0x140dabae0
0xd94e03: movzx ebx, al
0xd94e06: mov rdx, qword ptr [rdi + 0x260]
0xd94e0d: test rdx, rdx
0xd94e10: je 0x140d94e45
0xd94e12: vmovups xmm0, xmmword ptr [r12 + 0x980]
0xd94e1c: mov eax, dword ptr [r12 + 0x990]
0xd94e24: mov dword ptr [rsp + 0x70], eax
0xd94e28: mov byte ptr [rsp + 0x20], r15b
0xd94e2d: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94e33: vmovaps xmm3, xmm10
0xd94e38: lea r8, [rsp + 0x60]
0xd94e3d: mov rcx, r12
0xd94e40: call 0x140dabae0
0xd94e45: mov byte ptr [rdi + 0x2b9], bl
0xd94e4b: movzx r8d, bl
0xd94e4f: xor r8b, 1
0xd94e53: xor edx, edx
0xd94e55: mov rcx, rdi
0xd94e58: call 0x140deca40
0xd94e5d: jmp 0x140d951af
0xd94e62: cmp dword ptr [rdi + 0x2bc], 0
0xd94e69: ja 0x140d951b7
0xd94e6f: cmp r13b, 1
0xd94e73: jne 0x140d951b7
0xd94e79: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94e81: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94e87: mov eax, dword ptr [rdi + 0x208]
0xd94e8d: mov dword ptr [rsp + 0x70], eax
0xd94e91: mov byte ptr [rsp + 0x20], r15b
0xd94e96: vmovaps xmm3, xmm10
0xd94e9b: lea r8, [rsp + 0x60]
0xd94ea0: mov rdx, qword ptr [rdi + 0x118]
0xd94ea7: mov rcx, r12
0xd94eaa: call 0x140dabae0
0xd94eaf: movzx ebx, al
0xd94eb2: mov rdx, qword ptr [rdi + 0x260]
0xd94eb9: test rdx, rdx
0xd94ebc: je 0x140d94eed
0xd94ebe: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94ec6: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94ecc: mov ecx, dword ptr [rdi + 0x208]
0xd94ed2: mov dword ptr [rsp + 0x70], ecx
0xd94ed6: mov byte ptr [rsp + 0x20], r15b
0xd94edb: vmovaps xmm3, xmm10
0xd94ee0: lea r8, [rsp + 0x60]
0xd94ee5: mov rcx, r12
0xd94ee8: call 0x140dabae0
0xd94eed: mov rdx, qword ptr [rip + 0x5fd4634]
0xd94ef4: mov r8, qword ptr [rip + 0x5fd4635]
0xd94efb: cmp qword ptr [rdi + 0x160], 0
0xd94f03: je 0x140d94f9e
0xd94f09: movzx r9d, byte ptr [r14 + rsi]
0xd94f0e: mov rax, rdx
0xd94f11: test r9b, r9b
0xd94f14: cmovne rax, r8
0xd94f18: movzx r10d, word ptr [rdi + 0xde]
0xd94f20: mov rax, qword ptr [rax]
0xd94f23: mov rcx, qword ptr [rax + 8]
0xd94f27: mov rax, qword ptr [rcx + 0x270]
0xd94f2e: cmp r10w, word ptr [rax + 0xce]
0xd94f36: je 0x140d94f5a
0xd94f38: mov rax, rdx
0xd94f3b: test r9b, r9b
0xd94f3e: cmovne rax, r8
0xd94f42: mov rax, qword ptr [rax]
0xd94f45: mov rcx, qword ptr [rax + 8]
0xd94f49: mov rax, qword ptr [rcx + 0x270]
0xd94f50: cmp r10w, word ptr [rax + 0x15c]
0xd94f58: jne 0x140d94f9e
0xd94f5a: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd94f62: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd94f68: mov eax, dword ptr [rdi + 0x208]
0xd94f6e: mov dword ptr [rsp + 0x70], eax
0xd94f72: mov byte ptr [rsp + 0x20], r15b
0xd94f77: vmovaps xmm3, xmm10
0xd94f7c: lea r8, [rsp + 0x60]
0xd94f81: mov rdx, qword ptr [rdi + 0x168]
0xd94f88: mov rcx, r12
0xd94f8b: call 0x140dabae0
0xd94f90: mov r8, qword ptr [rip + 0x5fd4599]
0xd94f97: mov rdx, qword ptr [rip + 0x5fd458a]
0xd94f9e: cmp qword ptr [rdi + 0x170], 0
0xd94fa6: je 0x140d95030
0xd94fac: movzx r9d, byte ptr [r14 + rsi]
0xd94fb1: mov rax, rdx
0xd94fb4: test r9b, r9b
0xd94fb7: cmovne rax, r8
0xd94fbb: movzx r10d, word ptr [rdi + 0xde]
0xd94fc3: mov rax, qword ptr [rax]
0xd94fc6: mov rcx, qword ptr [rax + 8]
0xd94fca: mov rax, qword ptr [rcx + 0x270]
0xd94fd1: cmp r10w, word ptr [rax + 0xce]
0xd94fd9: je 0x140d94ffa
0xd94fdb: test r9b, r9b
0xd94fde: cmovne rdx, r8
0xd94fe2: mov rax, qword ptr [rdx]
0xd94fe5: mov rcx, qword ptr [rax + 8]
0xd94fe9: mov rax, qword ptr [rcx + 0x270]
0xd94ff0: cmp r10w, word ptr [rax + 0x15c]
0xd94ff8: jne 0x140d95030
0xd94ffa: vmovups xmm0, xmmword ptr [rdi + 0x1f8]
0xd95002: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95008: mov eax, dword ptr [rdi + 0x208]
0xd9500e: mov dword ptr [rsp + 0x70], eax
0xd95012: mov byte ptr [rsp + 0x20], r15b
0xd95017: vmovaps xmm3, xmm10
0xd9501c: lea r8, [rsp + 0x60]
0xd95021: mov rdx, qword ptr [rdi + 0x178]
0xd95028: mov rcx, r12
0xd9502b: call 0x140dabae0
0xd95030: lea rcx, [rdi + 0xde]
0xd95037: call 0x140537250
0xd9503c: cmp byte ptr [rax + 0x61], 0
0xd95040: jne 0x140d951a9
0xd95046: cmp qword ptr [rdi + 0x148], 0
0xd9504e: je 0x140d951a9
0xd95054: vmovaps xmm6, xmm8
0xd95059: lea rcx, [rdi + 0xde]
0xd95060: call 0x140537250
0xd95065: cmp byte ptr [rax + 0xb4], 0
0xd9506c: je 0x140d95081
0xd9506e: vmovss xmm1, dword ptr [rip + 0x5f16c42]
0xd95076: vcmpltss xmm0, xmm8, xmm1
0xd9507b: vblendvps xmm6, xmm6, xmm1, xmm0
0xd95081: vmovss xmm0, dword ptr [rip + 0x5f169af]
0xd95089: vdivss xmm1, xmm0, xmm6
0xd9508d: mov rax, qword ptr [rdi + 0x148]
0xd95094: mov rcx, qword ptr [rax + 8]
0xd95098: mov rdx, qword ptr [rcx + 0x18]
0xd9509c: mov rcx, qword ptr [rdx]
0xd9509f: mov rax, qword ptr [rcx + 0xa0]
0xd950a6: test rax, rax
0xd950a9: je 0x140d950b2
0xd950ab: cmp qword ptr [rax + 8], 0
0xd950b0: jne 0x140d950ed
0xd950b2: mov rax, qword ptr [rcx + 0x20]
0xd950b6: mov rcx, qword ptr [rax + 0x20]
0xd950ba: vmovss dword ptr [rcx + 0x20], xmm1
0xd950bf: mov rax, qword ptr [rdx]
0xd950c2: mov rcx, qword ptr [rax + 0x20]
0xd950c6: mov rax, qword ptr [rcx + 0x20]
0xd950ca: vmovss dword ptr [rax + 0x28], xmm1
0xd950cf: mov rax, qword ptr [rdx]
0xd950d2: mov rcx, qword ptr [rax + 0x20]
0xd950d6: mov rax, qword ptr [rcx + 0x20]
0xd950da: mov dword ptr [rax + 0x30], 0x3f800000
0xd950e1: mov rcx, qword ptr [rdx]
0xd950e4: mov rcx, qword ptr [rcx + 0x18]
0xd950e8: call 0x140d438d0
0xd950ed: mov rdx, qword ptr [rdi + 0x150]
0xd950f4: test rdx, rdx
0xd950f7: je 0x140d95168
0xd950f9: vmovups xmm0, xmmword ptr [rdi + 0x20c]
0xd95101: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95107: mov eax, dword ptr [rdi + 0x21c]
0xd9510d: mov dword ptr [rsp + 0x70], eax
0xd95111: mov byte ptr [rsp + 0x20], r15b
0xd95116: vmovaps xmm3, xmm10
0xd9511b: lea r8, [rsp + 0x60]
0xd95120: mov rdx, qword ptr [rdx + 8]
0xd95124: mov rcx, r12
0xd95127: call 0x140dabae0
0xd9512c: or bl, al
0xd9512e: mov rcx, qword ptr [rdi + 0x250]
0xd95135: cmp byte ptr [rip + 0x5fd1b9c], 0
0xd9513c: je 0x140d95168
0xd9513e: vsubss xmm0, xmm14, xmm11
0xd95143: vmovss xmm1, dword ptr [rip + 0x4fddaa1]
0xd9514b: vcomiss xmm1, xmm0
0xd9514f: jb 0x140d95158
0xd95151: vcomiss xmm0, xmm15
0xd95156: jae 0x140d95163
0xd95158: test bl, bl
0xd9515a: je 0x140d95163
0xd9515c: call 0x140cb6bd0
0xd95161: jmp 0x140d95168
0xd95163: call 0x140cb6d80
0xd95168: mov rdx, qword ptr [rdi + 0x158]
0xd9516f: test rdx, rdx
0xd95172: je 0x140d951a9
0xd95174: vmovups xmm0, xmmword ptr [rdi + 0x220]
0xd9517c: vmovups xmmword ptr [rsp + 0x60], xmm0
0xd95182: mov eax, dword ptr [rdi + 0x230]
0xd95188: mov dword ptr [rsp + 0x70], eax
0xd9518c: mov byte ptr [rsp + 0x20], r15b
0xd95191: vmovaps xmm3, xmm10
0xd95196: lea r8, [rsp + 0x60]
0xd9519b: mov rdx, qword ptr [rdx + 8]
0xd9519f: mov rcx, r12
0xd951a2: call 0x140dabae0
0xd951a7: or bl, al
0xd951a9: mov byte ptr [rdi + 0x2b9], bl
0xd951af: test bl, bl
0xd951b1: je 0x140d95dff
0xd951b7: vmovups xmm6, xmmword ptr [rdi + 0xc8]
0xd951bf: vmovups xmmword ptr [rsp + 0x60], xmm6
0xd951c5: lea rcx, [rdi + 0xde]
0xd951cc: call 0x140537250
0xd951d1: mov r13d, dword ptr [rax + 0x2c]
0xd951d5: cmp r13d, 0x19
0xd951d9: je 0x140d951e6
0xd951db: cmp r13d, 0x1a
0xd951df: je 0x140d951e6
0xd951e1: xor r15b, r15b
0xd951e4: jmp 0x140d951e9
0xd951e6: mov r15b, 1
0xd951e9: mov byte ptr [rsp + 0x44], r15b
0xd951ee: vmovss xmm0, dword ptr [rdi + 0xe4]
0xd951f6: vcomiss xmm0, dword ptr [rip + 0x5f48e4a]
0xd951fe: seta r14b
0xd95202: mov byte ptr [rbp + 0x978], r14b
0xd95209: mov rax, qword ptr [rbp + 0x990]
0xd95210: vmovss xmm0, dword ptr [rax + 4]
0xd95215: vcomiss xmm0, dword ptr [rip + 0x5f48e2b]
0xd9521d: seta byte ptr [rsp + 0x40]
0xd95222: lea rcx, [rdi + 0xde]
0xd95229: call 0x140537250
0xd9522e: cmp byte ptr [rax + 0xab], 0
0xd95235: jne 0x140d9524c
0xd95237: lea rcx, [rdi + 0xde]
0xd9523e: call 0x140537250
0xd95243: cmp byte ptr [rax + 0xaf], 0
0xd9524a: je 0x140d95265
0xd9524c: mov rcx, rdi
0xd9524f: call 0x140d8bf00
0xd95254: movzx ecx, al
0xd95257: mov rax, qword ptr [r12 + 0x468]
0xd9525f: cmp byte ptr [rcx + rax], 0
0xd95263: jne 0x140d952a8
0xd95265: lea rcx, [rdi + 0xde]
0xd9526c: call 0x140537250
0xd95271: cmp dword ptr [rax + 0x2c], 0x5e
0xd95275: je 0x140d952a8
0xd95277: movzx eax, byte ptr [rdi + 0xd0]
0xd9527e: cmp al, 0xe
0xd95280: je 0x140d9528a
0xd95282: cmp al, 0xf
0xd95284: jne 0x140d954ab
0xd9528a: mov eax, dword ptr [rdi + 0xc8]
0xd95290: mov dword ptr [rsp + 0x48], eax
0xd95294: lea rcx, [rsp + 0x48]
0xd95299: call 0x1404a2630
0xd9529e: cmp byte ptr [rax + 0x4e], 0
0xd952a2: je 0x140d954ab
0xd952a8: mov sil, 1
0xd952ab: xor bl, bl
0xd952ad: call 0x14066a0a0
0xd952b2: test al, al
0xd952b4: jne 0x140d95468
0xd952ba: vpextrb eax, xmm6, 8
0xd952c0: cmp al, 2
0xd952c2: jne 0x140d95326
0xd952c4: movzx eax, word ptr [rsp + 0x60]
0xd952c9: mov word ptr [rsp + 0x48], ax
0xd952ce: xor eax, eax
0xd952d0: mov qword ptr [rsp + 0x20], rax
0xd952d5: lea r9, [rsp + 0x48]
0xd952da: mov r8, qword ptr [rbp + 0x988]
0xd952e1: xor edx, edx
0xd952e3: mov rcx, qword ptr [rip + 0x5fd3efe]
0xd952ea: mov rcx, qword ptr [rcx + 0xa0]
0xd952f1: call 0x140656450
0xd952f6: movzx ebx, al
0xd952f9: lea rcx, [rsp + 0x48]
0xd952fe: call 0x140430280
0xd95303: cmp byte ptr [rax + 0xff], 0
0xd9530a: je 0x140d95468
0xd95310: cmp byte ptr [r12 + 0xadc], 0
0xd95319: jne 0x140d95468
0xd9531f: xor bl, bl
0xd95321: jmp 0x140d95468
0xd95326: cmp al, 1
0xd95328: jne 0x140d95344
0xd9532a: mov eax, dword ptr [rsp + 0x60]
0xd9532e: mov dword ptr [rsp + 0x48], eax
0xd95332: xor r8d, r8d
0xd95335: lea rdx, [rsp + 0x48]
0xd9533a: call 0x1406572d0
0xd9533f: jmp 0x140d95465
0xd95344: cmp al, 0x12
0xd95346: jne 0x140d953da
0xd9534c: movzx eax, word ptr [rsp + 0x60]
0xd95351: mov word ptr [rsp + 0x48], ax
0xd95356: lea rcx, [rsp + 0x48]
0xd9535b: call 0x1403880a0
0xd95360: movzx ecx, word ptr [rax + 0xa0]
0xd95367: mov word ptr [rsp + 0x48], cx
0xd9536c: lea rcx, [rsp + 0x48]
0xd95371: call 0x140433650
0xd95376: cmp dword ptr [rax + 0x100], -1
0xd9537d: je 0x140d953d3
0xd9537f: lea rcx, [rsp + 0x48]
0xd95384: call 0x140433650
0xd95389: lea rdx, [rax + 0x100]
0xd95390: call 0x140655f00
0xd95395: test al, al
0xd95397: jne 0x140d95468
0xd9539d: lea rcx, [rsp + 0x48]
0xd953a2: call 0x140433650
0xd953a7: lea rdx, [rax + 0x100]
0xd953ae: xor r8d, r8d
0xd953b1: call 0x1406572d0
0xd953b6: movzx ebx, al
0xd953b9: test al, 0xfa
0xd953bb: jne 0x140d953c8
0xd953bd: cmp al, 4
0xd953bf: je 0x140d953c8
0xd953c1: mov bl, 2
0xd953c3: jmp 0x140d95468
0xd953c8: lea eax, [rbx - 2]
0xd953cb: cmp al, 1
0xd953cd: jbe 0x140d95468
0xd953d3: mov bl, 4
0xd953d5: jmp 0x140d95468
0xd953da: cmp r13d, 0x16
0xd953de: jne 0x140d95450
0xd953e0: mov bl, 4
0xd953e2: mov rax, qword ptr [rdi + 0x120]
0xd953e9: test rax, rax
0xd953ec: je 0x140d95468
0xd953ee: vmovss xmm0, dword ptr [r12 + 0xabc]
0xd953f8: vcomiss xmm0, dword ptr [rip + 0x5f166d8]
0xd95400: jb 0x140d95468
0xd95402: mov rdx, qword ptr [rax + 0x20]
0xd95406: mov rax, qword ptr [rdx]
0xd95409: mov rcx, qword ptr [rax + 0xa0]
0xd95410: test rcx, rcx
0xd95413: je 0x140d9541c
0xd95415: cmp qword ptr [rcx + 8], 0
0xd9541a: jne 0x140d95468
0xd9541c: mov rax, qword ptr [rdx + 8]
0xd95420: xor ecx, ecx
0xd95422: mov edx, ecx
0xd95424: mov r8d, dword ptr [rax + 8]
0xd95428: test r8d, r8d
0xd9542b: je 0x140d95468
0xd9542d: mov r9, qword ptr [rax]
0xd95430: mov eax, dword ptr [rip + 0x5f3abf2]
0xd95436: mov ecx, edx
0xd95438: cmp eax, dword ptr [r9 + rcx*4]
0xd9543c: je 0x140d95447
0xd9543e: inc edx
0xd95440: cmp edx, r8d
0xd95443: jb 0x140d95436
0xd95445: jmp 0x140d95468
0xd95447: cmp edx, -1
0xd9544a: je 0x140d95468
0xd9544c: xor bl, bl
0xd9544e: jmp 0x140d95468
0xd95450: sub al, 0xe
0xd95452: cmp al, 1
0xd95454: ja 0x140d95468
0xd95456: xor r9d, r9d
0xd95459: lea r8, [rdi + 0xe0]
0xd95460: call 0x140658ae0
0xd95465: movzx ebx, al
0xd95468: cmp byte ptr [rdi + 0x1d8], bl
0xd9546e: je 0x140d9547d
0xd95470: mov byte ptr [rdi + 0x1d8], bl
0xd95476: mov byte ptr [rdi + 0x1ed], 1
0xd9547d: cmp bl, 2
0xd95480: setb r8b
0xd95484: mov dl, 1
0xd95486: mov rcx, rdi
0xd95489: call 0x140deca40
0xd9548e: test r15b, r15b
0xd95491: je 0x140d954ae
0xd95493: cmp r14b, byte ptr [r12 + 0xadc]
0xd9549b: setne r8b
0xd9549f: mov dl, 0xd
0xd954a1: mov rcx, rdi
0xd954a4: call 0x140deca40
0xd954a9: jmp 0x140d954ae
0xd954ab: xor sil, sil
0xd954ae: xor r14d, r14d
0xd954b1: mov ecx, r14d
0xd954b4: lea rax, [rdi + 0x1e8]
0xd954bb: nop dword ptr [rax + rax]
0xd954c0: cmp byte ptr [rax], r14b
0xd954c3: jne 0x140d95e02
0xd954c9: inc ecx
0xd954cb: inc rax
0xd954ce: cmp ecx, 3
0xd954d1: jb 0x140d954c0
0xd954d3: mov rax, qword ptr [rdi + 8]
0xd954d7: mov rcx, qword ptr [rax + 0x18]
0xd954db: mov rdx, qword ptr [rcx]
0xd954de: mov rax, qword ptr [rdx + 0xa0]
0xd954e5: test rax, rax
0xd954e8: je 0x140d954f0
0xd954ea: cmp qword ptr [rax + 8], r14
0xd954ee: jne 0x140d95502
0xd954f0: mov rax, qword ptr [rdx + 0x20]
0xd954f4: mov rdx, qword ptr [rax + 0x20]
0xd954f8: vmovss dword ptr [rdx + 0x48], xmm9
0xd954fd: call 0x140d438d0
0xd95502: mov rax, qword ptr [rdi + 8]
0xd95506: mov rcx, qword ptr [rax + 0x18]
0xd9550a: mov rax, qword ptr [rcx]
0xd9550d: mov rdx, qword ptr [rax + 0x20]
0xd95511: mov rax, qword ptr [rdx + 0x20]
0xd95515: mov byte ptr [rax + 0x4c], 3
0xd95519: call 0x140d438d0
0xd9551e: cmp r13d, 0x16
0xd95522: je 0x140d95e02
0xd95528: test sil, sil
0xd9552b: je 0x140d95e02
0xd95531: cmp qword ptr [rdi + 0x148], r14
0xd95538: je 0x140d95547
0xd9553a: mov rax, qword ptr [rdi + 0x150]
0xd95541: mov rbx, qword ptr [rax + 8]
0xd95545: jmp 0x140d9554a
0xd95547: mov rbx, r14
0xd9554a: lea eax, [r13 - 0x5a]
0xd9554e: cmp eax, 3
0xd95551: jbe 0x140d9555e
0xd95553: cmp r13d, 0x17
0xd95557: je 0x140d9555e
0xd95559: xor sil, sil
0xd9555c: jmp 0x140d95561
0xd9555e: mov sil, 1
0xd95561: movzx r12d, byte ptr [rdi + 0x1d8]
0xd95569: cmp r12b, 4
0xd9556d: jne 0x140d95667
0xd95573: test sil, sil
0xd95576: je 0x140d955cb
0xd95578: mov rbx, qword ptr [rdi + 0x128]
0xd9557f: test rbx, rbx
0xd95582: je 0x140d95992
0xd95588: mov rbx, qword ptr [rbx + 0x20]
0xd9558c: mov rax, qword ptr [rbx]
0xd9558f: mov rcx, qword ptr [rax + 0xa0]
0xd95596: test rcx, rcx
0xd95599: je 0x140d955a5
0xd9559b: cmp qword ptr [rcx + 8], r14
0xd9559f: jne 0x140d95992
0xd955a5: lea rdx, [rip + 0x5f3aa5c]
0xd955ac: mov rcx, qword ptr [rbx + 8]
0xd955b0: call 0x1435ca140
0xd955b5: cmp eax, -1
0xd955b8: je 0x140d95992
0xd955be: mov rcx, rbx
0xd955c1: call 0x1435c66a0
0xd955c6: jmp 0x140d95992
0xd955cb: test rbx, rbx
0xd955ce: je 0x140d95606
0xd955d0: mov rbx, qword ptr [rbx + 0x20]
0xd955d4: mov rax, qword ptr [rbx]
0xd955d7: mov rcx, qword ptr [rax + 0xa0]
0xd955de: test rcx, rcx
0xd955e1: je 0x140d955e9
0xd955e3: cmp qword ptr [rcx + 8], r14
0xd955e7: jne 0x140d95606
0xd955e9: lea rdx, [rip + 0x5f3aa18]
0xd955f0: mov rcx, qword ptr [rbx + 8]
0xd955f4: call 0x1435ca140
0xd955f9: cmp eax, -1
0xd955fc: je 0x140d95606
0xd955fe: mov rcx, rbx
0xd95601: call 0x1435c66a0
0xd95606: mov rbx, qword ptr [rdi + 0x130]
0xd9560d: movzx edx, byte ptr [rbp + 0x978]
0xd95614: movzx esi, byte ptr [rsp + 0x40]
0xd95619: test rbx, rbx
0xd9561c: je 0x140d95a50
0xd95622: mov rbx, qword ptr [rbx + 0x20]
0xd95626: mov rax, qword ptr [rbx]
0xd95629: mov rcx, qword ptr [rax + 0xa0]
0xd95630: cmp dl, sil
0xd95633: jne 0x140d95a0f
0xd95639: test rcx, rcx
0xd9563c: je 0x140d95649
0xd9563e: cmp qword ptr [rcx + 8], 0
0xd95643: jne 0x140d95a50
0xd95649: lea rdx, [rip + 0x5f3a9a8]
0xd95650: mov rcx, qword ptr [rbx + 8]
0xd95654: call 0x1435ca140
0xd95659: cmp eax, -1
0xd9565c: je 0x140d95a49
0xd95662: jmp 0x140d95a41
0xd95667: lea eax, [r12 - 2]
0xd9566c: cmp al, 1
0xd9566e: ja 0x140d95989
0xd95674: xor eax, eax
0xd95676: mov r15d, eax
0xd95679: cmp r12b, 2
0xd9567d: jne 0x140d9568f
0xd9567f: mov r14, qword ptr [rdi + 0x160]
0xd95686: mov r15, qword ptr [rdi + 0x168]
0xd9568d: jmp 0x140d956a3
0xd9568f: cmp r12b, 3
0xd95693: jne 0x140d956a3
0xd95695: mov r14, qword ptr [rdi + 0x170]
0xd9569c: mov r15, qword ptr [rdi + 0x178]
0xd956a3: cmp byte ptr [rsp + 0x44], al
0xd956a7: je 0x140d9573b
0xd956ad: cmp r12b, 2
0xd956b1: jne 0x140d956e6
0xd956b3: mov rax, qword ptr [rdi + 0x118]
0xd956ba: mov rbx, qword ptr [rax + 0x20]
0xd956be: mov rax, qword ptr [rbx]
0xd956c1: mov rcx, qword ptr [rax + 0xa0]
0xd956c8: test rcx, rcx
0xd956cb: je 0x140d956d4
0xd956cd: cmp qword ptr [rcx + 8], 0
0xd956d2: jne 0x140d9573b
0xd956d4: cmp dword ptr [rip + 0x5f3acb5], 0
0xd956db: je 0x140d9573b
0xd956dd: lea rdx, [rip + 0x5f3acac]
0xd956e4: jmp 0x140d9571d
0xd956e6: cmp r12b, 3
0xd956ea: jne 0x140d9573b
0xd956ec: mov rax, qword ptr [rdi + 0x118]
0xd956f3: mov rbx, qword ptr [rax + 0x20]
0xd956f7: mov rax, qword ptr [rbx]
0xd956fa: mov rcx, qword ptr [rax + 0xa0]
0xd95701: test rcx, rcx
0xd95704: je 0x140d9570d
0xd95706: cmp qword ptr [rcx + 8], 0
0xd9570b: jne 0x140d9573b
0xd9570d: cmp dword ptr [rip + 0x5f3ac80], 0
0xd95714: je 0x140d9573b
0xd95716: lea rdx, [rip + 0x5f3ac77]
0xd9571d: mov rcx, qword ptr [rbx + 8]
0xd95721: call 0x1435ca0a0
0xd95726: test al, al
0xd95728: je 0x140d9573b
0xd9572a: mov rcx, qword ptr [rbx + 8]
0xd9572e: call 0x1435caec0
0xd95733: mov rcx, rbx
0xd95736: call 0x1435c66a0
0xd9573b: test r14, r14
0xd9573e: je 0x140d95989
0xd95744: test r15, r15
0xd95747: je 0x140d95989
0xd9574d: mov rcx, r14
0xd95750: call 0x140cb6bd0
0xd95755: test sil, sil
0xd95758: je 0x140d95606
0xd9575e: vmovss dword ptr [rsp + 0x48], xmm11
0xd95764: vmovss xmm0, dword ptr [rip + 0x5f162cc]
0xd9576c: vdivss xmm6, xmm0, xmm8
0xd95771: movzx esi, byte ptr [rsp + 0x40]
0xd95776: mov rbx, qword ptr [r15 + 0x20]
0xd9577a: mov rax, qword ptr [rbx]
0xd9577d: mov rcx, qword ptr [rax + 0xa0]
0xd95784: cmp byte ptr [rbp + 0x978], sil
0xd9578b: jne 0x140d95846
0xd95791: mov r11, qword ptr [rbp + 0x970]
0xd95798: vmulss xmm6, xmm6, dword ptr [r11 + 0xabc]
0xd957a1: test rcx, rcx
0xd957a4: je 0x140d957ad
0xd957a6: cmp qword ptr [rcx + 8], 0
0xd957ab: jne 0x140d957ca
0xd957ad: lea rdx, [rip + 0x5f3a844]
0xd957b4: mov rcx, qword ptr [rbx + 8]
0xd957b8: call 0x1435ca140
0xd957bd: cmp eax, -1
0xd957c0: je 0x140d957ca
0xd957c2: mov rcx, rbx
0xd957c5: call 0x1435c66a0
0xd957ca: mov rax, qword ptr [r14 + 8]
0xd957ce: mov rbx, qword ptr [rax + 0x20]
0xd957d2: mov rax, qword ptr [rbx]
0xd957d5: mov rcx, qword ptr [rax + 0xa0]
0xd957dc: test rcx, rcx
0xd957df: je 0x140d957e8
0xd957e1: cmp qword ptr [rcx + 8], 0
0xd957e6: jne 0x140d95805
0xd957e8: lea rdx, [rip + 0x5f3a809]
0xd957ef: mov rcx, qword ptr [rbx + 8]
0xd957f3: call 0x1435ca140
0xd957f8: cmp eax, -1
0xd957fb: je 0x140d95805
0xd957fd: mov rcx, rbx
0xd95800: call 0x1435c66a0
0xd95805: mov rax, qword ptr [rdi + 0x118]
0xd9580c: mov rcx, qword ptr [rax + 0x20]
0xd95810: mov byte ptr [rsp + 0x50], 6
0xd95815: lea r8, [rsp + 0x50]
0xd9581a: lea rdx, [rbp + 0x20]
0xd9581e: call 0x1435c8ef0
0xd95823: lea rcx, [rbp + 0x20]
0xd95827: call 0x140615320
0xd9582c: cmp byte ptr [rax + 0xe], 0
0xd95830: je 0x140d95835
0xd95832: mov rax, qword ptr [rax]
0xd95835: vmulss xmm1, xmm13, dword ptr [rax]
0xd95839: vmulss xmm2, xmm1, dword ptr [rip + 0x5f16387]
0xd95841: jmp 0x140d958d4
0xd95846: test rcx, rcx
0xd95849: je 0x140d95852
0xd9584b: cmp qword ptr [rcx + 8], 0
0xd95850: jne 0x140d95880
0xd95852: cmp dword ptr [rip + 0x5f3a79f], 0
0xd95859: je 0x140d95880
0xd9585b: lea rdx, [rip + 0x5f3a796]
0xd95862: mov rcx, qword ptr [rbx + 8]
0xd95866: call 0x1435ca0a0
0xd9586b: test al, al
0xd9586d: je 0x140d95880
0xd9586f: mov rcx, qword ptr [rbx + 8]
0xd95873: call 0x1435caec0
0xd95878: mov rcx, rbx
0xd9587b: call 0x1435c66a0
0xd95880: mov rax, qword ptr [r14 + 8]
0xd95884: mov rbx, qword ptr [rax + 0x20]
0xd95888: mov rax, qword ptr [rbx]
0xd9588b: mov rcx, qword ptr [rax + 0xa0]
0xd95892: test rcx, rcx
0xd95895: je 0x140d9589e
0xd95897: cmp qword ptr [rcx + 8], 0
0xd9589c: jne 0x140d958cc
0xd9589e: cmp dword ptr [rip + 0x5f3a753], 0
0xd958a5: je 0x140d958cc
0xd958a7: lea rdx, [rip + 0x5f3a74a]
0xd958ae: mov rcx, qword ptr [rbx + 8]
0xd958b2: call 0x1435ca0a0
0xd958b7: test al, al
0xd958b9: je 0x140d958cc
0xd958bb: mov rcx, qword ptr [rbx + 8]
0xd958bf: call 0x1435caec0
0xd958c4: mov rcx, rbx
0xd958c7: call 0x1435c66a0
0xd958cc: vmulss xmm2, xmm6, dword ptr [rip + 0x4fdda74]
0xd958d4: vmovss dword ptr [rsp + 0x48], xmm2
0xd958da: mov rax, qword ptr [r14 + 8]
0xd958de: mov rcx, qword ptr [rax + 0x20]
0xd958e2: mov byte ptr [rsp + 0x51], 0
0xd958e7: vxorps xmm0, xmm2, xmmword ptr [rip + 0x4fe0461]
0xd958ef: vmovss dword ptr [rbp - 0x78], xmm0
0xd958f4: mov byte ptr [rsp + 0x52], 4
0xd958f9: lea r9, [rsp + 0x51]
0xd958fe: lea r8, [rbp - 0x78]
0xd95902: lea rdx, [rsp + 0x52]
0xd95907: call 0x14064b570
0xd9590c: mov rax, qword ptr [r14 + 8]
0xd95910: mov rcx, qword ptr [rax + 0x20]
0xd95914: mov byte ptr [rsp + 0x53], 0
0xd95919: mov byte ptr [rsp + 0x54], 2
0xd9591e: lea r9, [rsp + 0x53]
0xd95923: lea r8, [rsp + 0x48]
0xd95928: lea rdx, [rsp + 0x54]
0xd9592d: call 0x14064b570
0xd95932: mov rdx, qword ptr [r15 + 0x18]
0xd95936: mov rcx, qword ptr [rdx]
0xd95939: mov rax, qword ptr [rcx + 0xa0]
0xd95940: test rax, rax
0xd95943: je 0x140d9594c
0xd95945: cmp qword ptr [rax + 8], 0
0xd9594a: jne 0x140d95997
0xd9594c: mov rax, qword ptr [rcx + 0x20]
0xd95950: mov rcx, qword ptr [rax + 0x20]
0xd95954: vmovss dword ptr [rcx + 0x20], xmm6
0xd95959: mov rax, qword ptr [rdx]
0xd9595c: mov rcx, qword ptr [rax + 0x20]
0xd95960: mov rax, qword ptr [rcx + 0x20]
0xd95964: vmovss dword ptr [rax + 0x28], xmm6
0xd95969: mov rax, qword ptr [rdx]
0xd9596c: mov rcx, qword ptr [rax + 0x20]
0xd95970: mov rax, qword ptr [rcx + 0x20]
0xd95974: mov dword ptr [rax + 0x30], 0x3f800000
0xd9597b: mov rcx, qword ptr [rdx]
0xd9597e: mov rcx, qword ptr [rcx + 0x18]
0xd95982: call 0x140d438d0
0xd95987: jmp 0x140d95997
0xd95989: test sil, sil
0xd9598c: je 0x140d95606
0xd95992: movzx esi, byte ptr [rsp + 0x40]
0xd95997: mov rax, qword ptr [rdi + 0x188]
0xd9599e: test rax, rax
0xd959a1: je 0x140d95a49
0xd959a7: vmovss xmm0, dword ptr [rip + 0x5f16089]
0xd959af: vdivss xmm1, xmm0, xmm8
0xd959b4: mov rax, qword ptr [rax + 8]
0xd959b8: mov rdx, qword ptr [rax + 0x18]
0xd959bc: mov rcx, qword ptr [rdx]
0xd959bf: mov rax, qword ptr [rcx + 0xa0]
0xd959c6: test rax, rax
0xd959c9: je 0x140d959d2
0xd959cb: cmp qword ptr [rax + 8], 0
0xd959d0: jne 0x140d95a49
0xd959d2: mov rax, qword ptr [rcx + 0x20]
0xd959d6: mov rcx, qword ptr [rax + 0x20]
0xd959da: vmovss dword ptr [rcx + 0x20], xmm1
0xd959df: mov rax, qword ptr [rdx]
0xd959e2: mov rcx, qword ptr [rax + 0x20]
0xd959e6: mov rax, qword ptr [rcx + 0x20]
0xd959ea: vmovss dword ptr [rax + 0x28], xmm1
0xd959ef: mov rax, qword ptr [rdx]
0xd959f2: mov rcx, qword ptr [rax + 0x20]
0xd959f6: mov rax, qword ptr [rcx + 0x20]
0xd959fa: mov dword ptr [rax + 0x30], 0x3f800000
0xd95a01: mov rcx, qword ptr [rdx]
0xd95a04: mov rcx, qword ptr [rcx + 0x18]
0xd95a08: call 0x140d438d0
0xd95a0d: jmp 0x140d95a49
0xd95a0f: test rcx, rcx
0xd95a12: je 0x140d95a1b
0xd95a14: cmp qword ptr [rcx + 8], 0
0xd95a19: jne 0x140d95a50
0xd95a1b: cmp dword ptr [rip + 0x5f3a5d6], 0
0xd95a22: je 0x140d95a50
0xd95a24: lea rdx, [rip + 0x5f3a5cd]
0xd95a2b: mov rcx, qword ptr [rbx + 8]
0xd95a2f: call 0x1435ca0a0
0xd95a34: test al, al
0xd95a36: je 0x140d95a49
0xd95a38: mov rcx, qword ptr [rbx + 8]
0xd95a3c: call 0x1435caec0
0xd95a41: mov rcx, rbx
0xd95a44: call 0x1435c66a0
0xd95a49: movzx edx, byte ptr [rbp + 0x978]
0xd95a50: movzx r14d, byte ptr [rsp + 0x44]
0xd95a56: test r14b, r14b
0xd95a59: jne 0x140d95aad
0xd95a5b: cmp r13d, 0x5e
0xd95a5f: je 0x140d95aad
0xd95a61: mov rcx, qword ptr [rdi + 0x1a0]
0xd95a68: mov rbx, qword ptr [rdi + 0x1a8]
0xd95a6f: test rcx, rcx
0xd95a72: je 0x140d95aad
0xd95a74: test rbx, rbx
0xd95a77: je 0x140d95aad
0xd95a79: cmp dl, sil
0xd95a7c: jne 0x140d95a8d
0xd95a7e: call 0x140cb6d80
0xd95a83: mov rcx, rbx
0xd95a86: call 0x140cb6d80
0xd95a8b: jmp 0x140d95aad
0xd95a8d: test dl, dl
0xd95a8f: je 0x140d95aa0
0xd95a91: call 0x140cb6bd0
0xd95a96: mov rcx, rbx
0xd95a99: call 0x140cb6d80
0xd95a9e: jmp 0x140d95aad
0xd95aa0: call 0x140cb6d80
0xd95aa5: mov rcx, rbx
0xd95aa8: call 0x140cb6bd0
0xd95aad: cmp byte ptr [rdi + 0x1ed], 0
0xd95ab4: je 0x140d95dff
0xd95aba: mov byte ptr [rdi + 0x1ed], 0
0xd95ac1: mov rbx, qword ptr [rdi + 0x120]
0xd95ac8: cmp r12b, 4
0xd95acc: jne 0x140d95bfd
0xd95ad2: test rbx, rbx
0xd95ad5: je 0x140d95b0e
0xd95ad7: mov rbx, qword ptr [rbx + 0x20]
0xd95adb: mov rax, qword ptr [rbx]
0xd95ade: mov rcx, qword ptr [rax + 0xa0]
0xd95ae5: test rcx, rcx
0xd95ae8: je 0x140d95af1
0xd95aea: cmp qword ptr [rcx + 8], 0
0xd95aef: jne 0x140d95b0e
0xd95af1: lea rdx, [rip + 0x5f395c8]
0xd95af8: mov rcx, qword ptr [rbx + 8]
0xd95afc: call 0x1435ca140
0xd95b01: cmp eax, -1
0xd95b04: je 0x140d95b0e
0xd95b06: mov rcx, rbx
0xd95b09: call 0x1435c66a0
0xd95b0e: mov rbx, qword ptr [rdi + 0x130]
0xd95b15: test rbx, rbx
0xd95b18: je 0x140d95b51
0xd95b1a: mov rbx, qword ptr [rbx + 0x20]
0xd95b1e: mov rax, qword ptr [rbx]
0xd95b21: mov rcx, qword ptr [rax + 0xa0]
0xd95b28: test rcx, rcx
0xd95b2b: je 0x140d95b34
0xd95b2d: cmp qword ptr [rcx + 8], 0
0xd95b32: jne 0x140d95b51
0xd95b34: lea rdx, [rip + 0x5f39585]
0xd95b3b: mov rcx, qword ptr [rbx + 8]
0xd95b3f: call 0x1435ca140
0xd95b44: cmp eax, -1
0xd95b47: je 0x140d95b51
0xd95b49: mov rcx, rbx
0xd95b4c: call 0x1435c66a0
0xd95b51: mov rcx, qword ptr [rdi + 0x160]
0xd95b58: test rcx, rcx
0xd95b5b: je 0x140d95b62
0xd95b5d: call 0x140cb6d80
0xd95b62: test r14b, r14b
0xd95b65: je 0x140d95be3
0xd95b67: mov rax, qword ptr [rdi + 0x118]
0xd95b6e: mov rbx, qword ptr [rax + 0x20]
0xd95b72: mov rax, qword ptr [rbx]
0xd95b75: mov rcx, qword ptr [rax + 0xa0]
0xd95b7c: test rcx, rcx
0xd95b7f: je 0x140d95b88
0xd95b81: cmp qword ptr [rcx + 8], 0
0xd95b86: jne 0x140d95ba5
0xd95b88: lea rdx, [rip + 0x5f3a801]
0xd95b8f: mov rcx, qword ptr [rbx + 8]
0xd95b93: call 0x1435ca140
0xd95b98: cmp eax, -1
0xd95b9b: je 0x140d95ba5
0xd95b9d: mov rcx, rbx
0xd95ba0: call 0x1435c66a0
0xd95ba5: mov rax, qword ptr [rdi + 0x118]
0xd95bac: mov rbx, qword ptr [rax + 0x20]
0xd95bb0: mov rax, qword ptr [rbx]
0xd95bb3: mov rcx, qword ptr [rax + 0xa0]
0xd95bba: test rcx, rcx
0xd95bbd: je 0x140d95bc6
0xd95bbf: cmp qword ptr [rcx + 8], 0
0xd95bc4: jne 0x140d95be3
0xd95bc6: lea rdx, [rip + 0x5f3a7c7]
0xd95bcd: mov rcx, qword ptr [rbx + 8]
0xd95bd1: call 0x1435ca140
0xd95bd6: cmp eax, -1
0xd95bd9: je 0x140d95be3
0xd95bdb: mov rcx, rbx
0xd95bde: call 0x1435c66a0
0xd95be3: mov rcx, qword ptr [rdi + 0x170]
0xd95bea: test rcx, rcx
0xd95bed: je 0x140d95dff
0xd95bf3: call 0x140cb6d80
0xd95bf8: jmp 0x140d95dff
0xd95bfd: lea eax, [r12 - 2]
0xd95c02: cmp al, 1
0xd95c04: jbe 0x140d95cb8
0xd95c0a: test rbx, rbx
0xd95c0d: je 0x140d95c57
0xd95c0f: mov rbx, qword ptr [rbx + 0x20]
0xd95c13: mov rax, qword ptr [rbx]
0xd95c16: mov rcx, qword ptr [rax + 0xa0]
0xd95c1d: test rcx, rcx
0xd95c20: je 0x140d95c29
0xd95c22: cmp qword ptr [rcx + 8], 0
0xd95c27: jne 0x140d95c57
0xd95c29: cmp dword ptr [rip + 0x5f39490], 0
0xd95c30: je 0x140d95c57
0xd95c32: lea rdx, [rip + 0x5f39487]
0xd95c39: mov rcx, qword ptr [rbx + 8]
0xd95c3d: call 0x1435ca0a0
0xd95c42: test al, al
0xd95c44: je 0x140d95c57
0xd95c46: mov rcx, qword ptr [rbx + 8]
0xd95c4a: call 0x1435caec0
0xd95c4f: mov rcx, rbx
0xd95c52: call 0x1435c66a0
0xd95c57: mov rbx, qword ptr [rdi + 0x130]
0xd95c5e: test rbx, rbx
0xd95c61: je 0x140d95b51
0xd95c67: mov rbx, qword ptr [rbx + 0x20]
0xd95c6b: mov rax, qword ptr [rbx]
0xd95c6e: mov rcx, qword ptr [rax + 0xa0]
0xd95c75: test rcx, rcx
0xd95c78: je 0x140d95c85
0xd95c7a: cmp qword ptr [rcx + 8], 0
0xd95c7f: jne 0x140d95b51
0xd95c85: cmp dword ptr [rip + 0x5f39434], 0
0xd95c8c: je 0x140d95b51
0xd95c92: lea rdx, [rip + 0x5f39427]
0xd95c99: mov rcx, qword ptr [rbx + 8]
0xd95c9d: call 0x1435ca0a0
0xd95ca2: test al, al
0xd95ca4: je 0x140d95b51
0xd95caa: mov rcx, qword ptr [rbx + 8]
0xd95cae: call 0x1435caec0
0xd95cb3: jmp 0x140d95b49
0xd95cb8: test rbx, rbx
0xd95cbb: je 0x140d95d05
0xd95cbd: mov rbx, qword ptr [rbx + 0x20]
0xd95cc1: mov rax, qword ptr [rbx]
0xd95cc4: mov rcx, qword ptr [rax + 0xa0]
0xd95ccb: test rcx, rcx
0xd95cce: je 0x140d95cd7
0xd95cd0: cmp qword ptr [rcx + 8], 0
0xd95cd5: jne 0x140d95d05
0xd95cd7: cmp dword ptr [rip + 0x5f393e2], 0
0xd95cde: je 0x140d95d05
0xd95ce0: lea rdx, [rip + 0x5f393d9]
0xd95ce7: mov rcx, qword ptr [rbx + 8]
0xd95ceb: call 0x1435ca0a0
0xd95cf0: test al, al
0xd95cf2: je 0x140d95d05
0xd95cf4: mov rcx, qword ptr [rbx + 8]
0xd95cf8: call 0x1435caec0
0xd95cfd: mov rcx, rbx
0xd95d00: call 0x1435c66a0
0xd95d05: mov rbx, qword ptr [rdi + 0x130]
0xd95d0c: test rbx, rbx
0xd95d0f: je 0x140d95d59
0xd95d11: mov rbx, qword ptr [rbx + 0x20]
0xd95d15: mov rax, qword ptr [rbx]
0xd95d18: mov rcx, qword ptr [rax + 0xa0]
0xd95d1f: test rcx, rcx
0xd95d22: je 0x140d95d2b
0xd95d24: cmp qword ptr [rcx + 8], 0
0xd95d29: jne 0x140d95d59
0xd95d2b: cmp dword ptr [rip + 0x5f3938e], 0
0xd95d32: je 0x140d95d59
0xd95d34: lea rdx, [rip + 0x5f39385]
0xd95d3b: mov rcx, qword ptr [rbx + 8]
0xd95d3f: call 0x1435ca0a0
0xd95d44: test al, al
0xd95d46: je 0x140d95d59
0xd95d48: mov rcx, qword ptr [rbx + 8]
0xd95d4c: call 0x1435caec0
0xd95d51: mov rcx, rbx
0xd95d54: call 0x1435c66a0
0xd95d59: cmp r12b, 2
0xd95d5d: je 0x140d95be3
0xd95d63: cmp r12b, 3
0xd95d67: jne 0x140d95dff
0xd95d6d: mov rcx, qword ptr [rdi + 0x160]
0xd95d74: test rcx, rcx
0xd95d77: je 0x140d95d7e
0xd95d79: call 0x140cb6d80
0xd95d7e: test r14b, r14b
0xd95d81: je 0x140d95dff
0xd95d83: mov rax, qword ptr [rdi + 0x118]
0xd95d8a: mov rbx, qword ptr [rax + 0x20]
0xd95d8e: mov rax, qword ptr [rbx]
0xd95d91: mov rcx, qword ptr [rax + 0xa0]
0xd95d98: test rcx, rcx
0xd95d9b: je 0x140d95da4
0xd95d9d: cmp qword ptr [rcx + 8], 0
0xd95da2: jne 0x140d95dc1
0xd95da4: lea rdx, [rip + 0x5f3a5e5]
0xd95dab: mov rcx, qword ptr [rbx + 8]
0xd95daf: call 0x1435ca140
0xd95db4: cmp eax, -1
0xd95db7: je 0x140d95dc1
0xd95db9: mov rcx, rbx
0xd95dbc: call 0x1435c66a0
0xd95dc1: mov rax, qword ptr [rdi + 0x118]
0xd95dc8: mov rbx, qword ptr [rax + 0x20]
0xd95dcc: mov rax, qword ptr [rbx]
0xd95dcf: mov rcx, qword ptr [rax + 0xa0]
0xd95dd6: test rcx, rcx
0xd95dd9: je 0x140d95de2
0xd95ddb: cmp qword ptr [rcx + 8], 0
0xd95de0: jne 0x140d95dff
0xd95de2: lea rdx, [rip + 0x5f3a5ab]
0xd95de9: mov rcx, qword ptr [rbx + 8]
0xd95ded: call 0x1435ca140
0xd95df2: cmp eax, -1
0xd95df5: je 0x140d95dff
0xd95df7: mov rcx, rbx
0xd95dfa: call 0x1435c66a0
0xd95dff: xor r14d, r14d
0xd95e02: mov edx, dword ptr [rbp - 0x7c]
0xd95e05: inc edx
0xd95e07: mov dword ptr [rbp - 0x7c], edx
0xd95e0a: mov r8, qword ptr [rbp - 0x60]
0xd95e0e: inc r8
0xd95e11: mov qword ptr [rbp - 0x60], r8
0xd95e15: mov r9, qword ptr [rbp - 0x58]
0xd95e19: add r9, 8
0xd95e1d: mov qword ptr [rbp - 0x58], r9
0xd95e21: cmp edx, dword ptr [rbp - 0x80]
0xd95e24: mov rbx, qword ptr [rbp + 0x970]
0xd95e2b: mov rdi, qword ptr [rbp + 0x980]
0xd95e32: mov rsi, qword ptr [rbp + 0x988]
0xd95e39: mov r15d, 0xffff
0xd95e3f: lea r13, [rip + 0x47f780a]
0xd95e46: jb 0x140d94173
0xd95e4c: lea r11, [rsp + 0xa28]
0xd95e54: vmovaps xmm6, xmmword ptr [r11 - 0x18]
0xd95e5a: vmovaps xmm7, xmmword ptr [r11 - 0x28]
0xd95e60: vmovaps xmm8, xmmword ptr [r11 - 0x38]
0xd95e66: vmovaps xmm9, xmmword ptr [r11 - 0x48]
0xd95e6c: vmovaps xmm10, xmmword ptr [r11 - 0x58]
0xd95e72: vmovaps xmm11, xmmword ptr [r11 - 0x68]
0xd95e78: vmovaps xmm12, xmmword ptr [r11 - 0x78]
0xd95e7e: vmovaps xmm13, xmmword ptr [r11 - 0x88]
0xd95e87: vmovaps xmm14, xmmword ptr [r11 - 0x98]
0xd95e90: vmovaps xmm15, xmmword ptr [r11 - 0xa8]
0xd95e99: mov rsp, r11
0xd95e9c: pop r15
0xd95e9e: pop r14
0xd95ea0: pop r13
0xd95ea2: pop r12
0xd95ea4: pop rdi
0xd95ea5: pop rsi
0xd95ea6: pop rbx
0xd95ea7: pop rbp
0xd95ea8: ret 
CALLEE 0xd96760
0xd96760: sub rsp, 0x48
0xd96764: vmovss xmm0, dword ptr [rcx + 0xaa0]
0xd9676c: vmovss xmm1, dword ptr [rip + 0x5f15724]
0xd96774: vsubss xmm3, xmm0, dword ptr [rip + 0x5f156cc]
0xd9677c: vsubss xmm2, xmm1, dword ptr [rip + 0x5f156c4]
0xd96784: movsxd rax, dword ptr [rip + 0x5f155cd]
0xd9678b: vdivss xmm0, xmm3, xmm2
0xd9678f: vmovaps xmmword ptr [rsp + 0x20], xmm8
0xd96795: vmovss xmm8, dword ptr [rip + 0x4fdc917]
0xd9679d: vminss xmm1, xmm0, xmm8
0xd967a2: vxorps xmm0, xmm0, xmm0
0xd967a6: vmaxss xmm5, xmm0, xmm1
0xd967aa: cmp eax, 0x1e
0xd967ad: ja 0x140d96f43
0xd967b3: lea rdx, [rip - 0xd967ba]
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x64f570
0x64f570: mov qword ptr [rsp + 8], rbx
0x64f575: mov qword ptr [rsp + 0x10], rdx
0x64f57a: push rdi
0x64f57b: sub rsp, 0x50
0x64f57f: mov rbx, rdx
0x64f582: xor edi, edi
0x64f584: mov dword ptr [rsp + 0x20], edi
0x64f588: test r8d, r8d
0x64f58b: jne 0x14064f5cd
0x64f58d: lea rdx, [rip + 0x50d68b4]
0x64f594: mov qword ptr [rbx], rdx
0x64f597: mov qword ptr [rbx + 8], rdi
0x64f59b: mov word ptr [rbx + 0x10], di
0x64f59f: mov qword ptr [rbx + 0x18], rdi
0x64f5a3: lea rax, [rip + 0x4f244de]
0x64f5aa: mov qword ptr [rbx], rax
0x64f5ad: lea rax, [rip + 0x4f24494]
0x64f5b4: mov qword ptr [rbx], rax
0x64f5b7: mov dword ptr [rsp + 0x20], 1
0x64f5bf: mov rax, rbx
0x64f5c2: mov rbx, qword ptr [rsp + 0x60]
0x64f5c7: add rsp, 0x50
0x64f5cb: pop rdi
0x64f5cc: ret 
0x64f5cd: lea rdx, [rsp + 0x28]
0x64f5d2: mov rcx, qword ptr [rip + 0x6719bb7]
0x64f5d9: mov rcx, qword ptr [rcx + 0x30]
0x64f5dd: call 0x1408adfe0
0x64f5e2: nop 
0x64f5e3: lea rdx, [rip + 0x50d685e]
0x64f5ea: mov qword ptr [rbx], rdx
0x64f5ed: mov rcx, qword ptr [rax + 8]
0x64f5f1: mov qword ptr [rbx + 8], rcx
0x64f5f5: movzx ecx, byte ptr [rax + 0x10]
0x64f5f9: mov byte ptr [rbx + 0x10], cl
0x64f5fc: movzx ecx, byte ptr [rax + 0x11]
0x64f600: mov byte ptr [rbx + 0x11], cl
0x64f603: mov rcx, qword ptr [rax + 0x18]
0x64f607: mov qword ptr [rbx + 0x18], rcx
0x64f60b: mov qword ptr [rax + 8], rdi
0x64f60f: mov byte ptr [rax + 0x10], 0
0x64f613: lea rax, [rip + 0x4f2446e]
0x64f61a: mov qword ptr [rbx], rax
0x64f61d: lea rax, [rip + 0x4f24424]
0x64f624: mov qword ptr [rbx], rax
0x64f627: mov dword ptr [rsp + 0x20], 1
0x64f62f: mov qword ptr [rsp + 0x28], rdx
0x64f634: lea rcx, [rsp + 0x28]
0x64f639: call 0x141434880
0x64f63e: mov rax, rbx
0x64f641: mov rbx, qword ptr [rsp + 0x60]
0x64f646: add rsp, 0x50
0x64f64a: pop rdi
0x64f64b: ret 
0x64f64c: int3 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x4f8220
0x4f8220: push rbx
0x4f8222: sub rsp, 0x80
0x4f8229: mov eax, dword ptr [rcx + 0xbc]
0x4f822f: mov rbx, rdx
0x4f8232: vmovsd xmm0, qword ptr [rcx + 0xb4]
0x4f823a: vmovsd xmm1, qword ptr [rcx + 0xf0]
0x4f8242: mov dword ptr [rsp + 0x28], eax
0x4f8246: movzx eax, word ptr [rcx + 0xc0]
0x4f824d: mov word ptr [rsp + 0x2c], ax
0x4f8252: movzx eax, word ptr [rcx + 0xc2]
0x4f8259: vmovsd qword ptr [rsp + 0x20], xmm0
0x4f825f: vmovups ymm0, ymmword ptr [rcx + 0xd0]
0x4f8267: mov word ptr [rsp + 0x2e], ax
0x4f826c: mov rax, qword ptr [rcx + 0xc8]
0x4f8273: vmovups ymmword ptr [rsp + 0x38], ymm0
0x4f8279: vmovups xmm0, xmmword ptr [rcx + 0xfc]
0x4f8281: mov qword ptr [rsp + 0x30], rax
0x4f8286: mov eax, dword ptr [rcx + 0xf8]
0x4f828c: lea rcx, [rsp + 0x38]
0x4f8291: mov dword ptr [rsp + 0x60], eax
0x4f8295: vmovsd qword ptr [rsp + 0x58], xmm1
0x4f829b: vmovups xmmword ptr [rsp + 0x64], xmm0
0x4f82a1: vzeroupper 
0x4f82a4: call 0x1403933a0
0x4f82a9: test al, al
0x4f82ab: je 0x1404f82c3
0x4f82ad: vmovups xmm0, xmmword ptr [rsp + 0x20]
0x4f82b3: vmovups xmmword ptr [rdx], xmm0
0x4f82b7: mov rax, rdx
0x4f82ba: add rsp, 0x80
0x4f82c1: pop rbx
0x4f82c2: ret 
0x4f82c3: lea r8, [rsp + 0x20]
0x4f82c8: lea rcx, [rsp + 0x38]
0x4f82cd: call 0x14050ea80
0x4f82d2: mov rax, rbx
0x4f82d5: add rsp, 0x80
0x4f82dc: pop rbx
0x4f82dd: ret 
CALLEE 0x2239930
0x2239930: mov qword ptr [rsp + 8], rcx
0x2239935: lea rax, [rip + 0x333ab4c]
0x223993c: mov qword ptr [rcx], rax
0x223993f: mov byte ptr [rcx + 8], dl
0x2239942: lea rax, [rcx + 0x10]
0x2239946: mov qword ptr [rsp + 0x18], rax
0x223994b: xor r9d, r9d
0x223994e: mov qword ptr [rax + 0x808], r9
0x2239955: mov qword ptr [rax + 0x810], 0x801
0x2239960: mov byte ptr [rax], r9b
0x2239963: mov rdx, qword ptr [rax + 0x808]
0x223996a: test rdx, rdx
0x223996d: je 0x142239972
0x223996f: mov byte ptr [rdx], r9b
0x2239972: mov dword ptr [rax + 0x814], r9d
0x2239979: mov byte ptr [rax], 0
0x223997c: mov rdx, qword ptr [rax + 0x808]
0x2239983: test rdx, rdx
0x2239986: je 0x14223998b
0x2239988: mov byte ptr [rdx], 0
0x223998b: mov qword ptr [rcx + 0x828], r8
0x2239992: mov rax, rcx
0x2239995: ret 
CALLEE 0x3a2ac0
0x3a2ac0: mov qword ptr [rsp + 8], rcx
0x3a2ac5: push rbx
0x3a2ac6: sub rsp, 0x20
0x3a2aca: mov rbx, rcx
0x3a2acd: mov rcx, qword ptr [rcx + 0x808]
0x3a2ad4: test rcx, rcx
0x3a2ad7: je 0x1403a2b18
0x3a2ad9: mov r8d, 0x1fd
0x3a2adf: mov rax, qword ptr gs:[0x58]
0x3a2ae8: mov rdx, qword ptr [rax]
0x3a2aeb: cmp byte ptr [r8 + rdx], 0
0x3a2af0: je 0x1403a2b08
0x3a2af2: call 0x1447f03bc
0x3a2af7: mov qword ptr [rbx + 0x808], 0
0x3a2b02: add rsp, 0x20
0x3a2b06: pop rbx
0x3a2b07: ret 
0x3a2b08: call 0x1447f02bc
0x3a2b0d: mov qword ptr [rbx + 0x808], 0
0x3a2b18: add rsp, 0x20
0x3a2b1c: pop rbx
0x3a2b1d: ret 
CALLEE 0xdecaf0
0xdecaf0: mov qword ptr [rsp + 0x10], rbx
0xdecaf5: push rdi
0xdecaf6: sub rsp, 0x20
0xdecafa: vmovss xmm0, dword ptr [rcx + 0xe0]
0xdecb02: vsubss xmm3, xmm0, dword ptr [rdx]
0xdecb06: vmovss xmm2, dword ptr [rip + 0x4f86292]
0xdecb0e: vcomiss xmm2, xmm3
0xdecb12: mov rdi, rdx
0xdecb15: mov rbx, rcx
0xdecb18: jb 0x140decb67
0xdecb1a: vmovss xmm1, dword ptr [rip + 0x4f86dde]
0xdecb22: vcomiss xmm3, xmm1
0xdecb26: jb 0x140decb67
0xdecb28: vmovss xmm0, dword ptr [rcx + 0xe4]
0xdecb30: vsubss xmm3, xmm0, dword ptr [rdx + 4]
0xdecb35: vcomiss xmm2, xmm3
0xdecb39: jb 0x140decb67
0xdecb3b: vcomiss xmm3, xmm1
0xdecb3f: jb 0x140decb67
0xdecb41: vmovss xmm0, dword ptr [rcx + 0xe8]
0xdecb49: vsubss xmm3, xmm0, dword ptr [rdx + 8]
0xdecb4e: vcomiss xmm2, xmm3
0xdecb52: jb 0x140decb67
0xdecb54: vcomiss xmm3, xmm1
0xdecb58: jb 0x140decb67
0xdecb5a: xor al, al
0xdecb5c: mov rbx, qword ptr [rsp + 0x38]
0xdecb61: add rsp, 0x20
0xdecb65: pop rdi
0xdecb66: ret 
0xdecb67: cmp qword ptr [rcx + 0x28], 0
0xdecb6c: vmovsd xmm0, qword ptr [rdx]
0xdecb70: vmovsd qword ptr [rcx + 0xe0], xmm0
0xdecb78: mov eax, dword ptr [rdx + 8]
0xdecb7b: mov dword ptr [rcx + 0xe8], eax
0xdecb81: mov byte ptr [rcx + 0x1ef], 1
0xdecb88: je 0x140decc2a
0xdecb8e: mov rax, qword ptr [rcx]
0xdecb91: call qword ptr [rax + 0x520]
0xdecb97: test al, al
0xdecb99: jne 0x140decc2a
0xdecb9f: vmovss xmm0, dword ptr [rdi]
0xdecba3: mov ecx, dword ptr [rbx + 0xec]
0xdecba9: vxorps xmm2, xmm2, xmm2
0xdecbad: vxorps xmm3, xmm3, xmm3
0xdecbb1: vcvtsi2ss xmm3, xmm3, dword ptr [rip + 0x5ec054f]
0xdecbb9: vdivss xmm1, xmm0, xmm3
0xdecbbd: vmovss xmm0, dword ptr [rdi + 8]
0xdecbc2: vroundss xmm2, xmm2, xmm1, 1
0xdecbc8: vcvttss2si eax, xmm2
0xdecbcc: mov dword ptr [rsp + 0x30], eax
0xdecbd0: vxorps xmm2, xmm2, xmm2
0xdecbd4: vdivss xmm1, xmm0, xmm3
0xdecbd8: vroundss xmm2, xmm2, xmm1, 1
0xdecbde: vcvttss2si edx, xmm2
0xdecbe2: mov dword ptr [rsp + 0x34], edx
0xdecbe6: cmp eax, ecx
0xdecbe8: jne 0x140decbf2
0xdecbea: cmp edx, dword ptr [rbx + 0xf0]
0xdecbf0: je 0x140decc2a
0xdecbf2: cmp ecx, 0x7fffffff
0xdecbf8: jne 0x140decc02
0xdecbfa: cmp dword ptr [rbx + 0xf0], ecx
0xdecc00: je 0x140decc1e
0xdecc02: mov rcx, qword ptr [rbx + 0x28]
0xdecc06: lea r9, [rsp + 0x30]
0xdecc0b: lea r8, [rbx + 0xec]
0xdecc12: mov rdx, rbx
0xdecc15: mov rax, qword ptr [rcx]
0xdecc18: call qword ptr [rax + 0x4d8]
0xdecc1e: mov rax, qword ptr [rsp + 0x30]
0xdecc23: mov qword ptr [rbx + 0xec], rax
0xdecc2a: mov rbx, qword ptr [rsp + 0x38]
0xdecc2f: mov al, 1
0xdecc31: add rsp, 0x20
0xdecc35: pop rdi
0xdecc36: ret 
CALLEE 0x393df0
0x393df0: mov qword ptr [rsp + 8], rbx
0x393df5: mov qword ptr [rsp + 0x10], rsi
0x393dfa: push rdi
0x393dfb: sub rsp, 0x20
0x393dff: mov qword ptr [rcx], rdx
0x393e02: mov rbx, rdx
0x393e05: test dword ptr [rdx + 0xc], 0x40000000
0x393e0c: mov rdi, rcx
0x393e0f: mov esi, 0xffffffff
0x393e14: je 0x140393e38
0x393e16: xor edx, edx
0x393e18: mov eax, esi
0x393e1a: lock cmpxchg dword ptr [rbx + 8], esi
0x393e1f: test eax, eax
0x393e21: je 0x140393e38
0x393e23: cmp edx, 0x3e8
0x393e29: jae 0x140393e38
0x393e2b: inc edx
0x393e2d: mov eax, esi
0x393e2f: lock cmpxchg dword ptr [rbx + 8], esi
0x393e34: test eax, eax
0x393e36: jne 0x140393e23
0x393e38: mov rax, qword ptr [rbx]
0x393e3b: mov dl, 1
0x393e3d: mov rcx, rbx
0x393e40: call qword ptr [rax + 0x18]
0x393e43: test dword ptr [rbx + 0xc], 0x40000000
0x393e4a: je 0x140393e6b
0x393e4c: mov eax, esi
0x393e4e: lock cmpxchg dword ptr [rbx + 8], esi
0x393e53: test eax, eax
0x393e55: je 0x140393e6b
0x393e57: mov rax, qword ptr [rbx]
0x393e5a: mov rcx, rbx
0x393e5d: call qword ptr [rax + 0x38]
0x393e60: mov eax, esi
0x393e62: lock cmpxchg dword ptr [rbx + 8], esi
0x393e67: test eax, eax
0x393e69: jne 0x140393e57
0x393e6b: mov rbx, qword ptr [rsp + 0x30]
0x393e70: mov rax, rdi
0x393e73: mov rsi, qword ptr [rsp + 0x38]
0x393e78: add rsp, 0x20
0x393e7c: pop rdi
0x393e7d: ret 
CALLEE 0x17e9170
0x17e9170: sub rsp, 0x78
0x17e9174: vmovups xmm0, xmmword ptr [rcx + 0xa4]
0x17e917c: mov rax, qword ptr [rcx + 0xc8]
0x17e9183: lea r8, [rsp + 0x48]
0x17e9188: vmovups xmm1, xmmword ptr [rcx + 0xfc]
0x17e9190: vmovups xmmword ptr [rsp + 0x30], xmm0
0x17e9196: vmovups xmm0, xmmword ptr [rcx + 0xdc]
0x17e919e: lea rcx, [rsp + 0x30]
0x17e91a3: mov qword ptr [rsp + 0x40], rax
0x17e91a8: lea rdx, [rsp + 0x20]
0x17e91ad: vmovups xmmword ptr [rsp + 0x48], xmm0
0x17e91b3: vmovups xmmword ptr [rsp + 0x58], xmm1
0x17e91b9: call 0x1403936e0
0x17e91be: lea rcx, [rsp + 0x20]
0x17e91c3: call 0x140393bb0
0x17e91c8: add rsp, 0x78
0x17e91cc: ret 
CALLEE 0x1434880
0x1434880: mov qword ptr [rsp + 0x10], rbx
0x1434885: mov qword ptr [rsp + 0x18], rsi
0x143488a: push rdi
0x143488b: sub rsp, 0x20
0x143488f: mov rsi, rcx
0x1434892: cmp byte ptr [rcx + 0x10], 0
0x1434896: je 0x14143490c
0x1434898: mov rdi, qword ptr [rcx + 8]
0x143489c: cmp byte ptr [rcx + 0x11], 0
0x14348a0: jne 0x1414348b0
0x14348a2: mov rax, qword ptr [rdi]
0x14348a5: mov rcx, rdi
0x14348a8: call qword ptr [rax + 8]
0x14348ab: movzx edi, al
0x14348ae: jmp 0x1414348eb
0x14348b0: lea rbx, [rdi + 0x18]
0x14348b4: mov qword ptr [rsp + 0x30], rbx
0x14348b9: mov rax, qword ptr [rbx]
0x14348bc: mov rcx, rbx
0x14348bf: call qword ptr [rax + 8]
0x14348c2: nop 
0x14348c3: dec word ptr [rdi + 0x48]
0x14348c7: cmp byte ptr [rdi + 0x4a], 0
0x14348cb: jne 0x1414348df
0x14348cd: xor eax, eax
0x14348cf: lock xadd dword ptr [rdi + 0x10], eax
0x14348d4: add ax, word ptr [rdi + 0x48]
0x14348d8: jne 0x1414348df
0x14348da: mov dil, 1
0x14348dd: jmp 0x1414348e2
0x14348df: xor dil, dil
0x14348e2: mov rax, qword ptr [rbx]
0x14348e5: mov rcx, rbx
0x14348e8: call qword ptr [rax + 0x10]
0x14348eb: test dil, dil
0x14348ee: je 0x141434908
0x14348f0: mov rcx, qword ptr [rsi + 8]
0x14348f4: mov edx, 1
0x14348f9: xor eax, eax
0x14348fb: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x1434900: jne 0x141434908
0x1434902: mov rax, qword ptr [rcx]
0x1434905: call qword ptr [rax + 0x10]
0x1434908: mov byte ptr [rsi + 0x10], 0
0x143490c: mov rbx, qword ptr [rsp + 0x38]
0x1434911: mov rsi, qword ptr [rsp + 0x40]
0x1434916: add rsp, 0x20
0x143491a: pop rdi
0x143491b: ret 
CALLEE 0xd91820
0xd91820: mov r11, rsp
0xd91823: mov qword ptr [r11 + 0x10], rbx
0xd91827: mov qword ptr [r11 + 0x18], rsi
0xd9182b: push rdi
0xd9182c: sub rsp, 0x80
0xd91833: cmp byte ptr [rcx + 0x2b8], 0
0xd9183a: mov rbx, rcx
0xd9183d: vmovaps xmmword ptr [rsp + 0x70], xmm6
0xd91843: vmovaps xmmword ptr [rsp + 0x60], xmm7
0xd91849: vmovaps xmmword ptr [r11 - 0x38], xmm8
0xd9184f: vmovss xmm8, dword ptr [rip + 0x4fe185d]
0xd91857: vmovaps xmmword ptr [r11 - 0x48], xmm9
0xd9185d: vmovaps xmmword ptr [r11 - 0x58], xmm10
0xd91863: vmovaps xmm9, xmm1
0xd91867: vmovaps xmm7, xmm3
0xd9186b: movzx esi, r8b
0xd9186f: je 0x140d91b0b
0xd91875: movzx eax, word ptr [rcx + 0xde]
0xd9187c: lea rcx, [r11 + 8]
0xd91880: mov word ptr [r11 + 8], ax
0xd91885: call 0x140537250
0xd9188a: cmp byte ptr [rax + 0xb5], 0
0xd91891: je 0x140d91990
0xd91897: cmp qword ptr [rbx + 0x260], 0
0xd9189f: jne 0x140d91986
0xd918a5: lea rcx, [rsp + 0x90]
0xd918ad: call 0x140537250
0xd918b2: mov ecx, esi
0xd918b4: movzx edx, byte ptr [rax + 0xb6]
0xd918bb: movzx eax, sil
0xd918bf: xor al, 1
0xd918c1: test dl, dl
0xd918c3: movzx eax, al
0xd918c6: cmove ecx, eax
0xd918c9: test cl, cl
0xd918cb: je 0x140d91986
0xd918d1: vmovss xmm1, dword ptr [rbx + 0x100]
0xd918d9: vxorps xmm0, xmm0, xmm0
0xd918dd: vucomiss xmm1, xmm0
0xd918e1: jp 0x140d918e9
0xd918e3: je 0x140d9196c
0xd918e9: lea rcx, [rsp + 0x90]
0xd918f1: call 0x140537250
0xd918f6: vmovss xmm0, dword ptr [rax + 0xa4]
0xd918fe: vcomiss xmm0, xmm8
0xd91903: jbe 0x140d9196c
0xd91905: vmovss xmm6, dword ptr [rip + 0x5f1a26b]
0xd9190d: lea rcx, [rsp + 0x90]
0xd91915: call 0x140537250
0xd9191a: vdivss xmm0, xmm6, xmm7
0xd9191e: vmulss xmm1, xmm0, xmm9
0xd91923: lea r8, [rsp + 0x90]
0xd9192b: vmulss xmm6, xmm1, dword ptr [rax + 0xa4]
0xd91933: mov rax, qword ptr [rbx + 0x118]
0xd9193a: lea rdx, [rsp + 0x20]
0xd9193f: mov rcx, qword ptr [rax + 0x20]
0xd91943: mov byte ptr [rsp + 0x90], 6
0xd9194b: call 0x1435c8ef0
0xd91950: lea rcx, [rsp + 0x20]
0xd91955: call 0x140615320
0xd9195a: cmp byte ptr [rax + 0xe], 0
0xd9195e: je 0x140d91963
0xd91960: mov rax, qword ptr [rax]
0xd91963: vdivss xmm8, xmm6, dword ptr [rax]
0xd91967: jmp 0x140d91b0b
0xd9196c: lea rcx, [rsp + 0x90]
0xd91974: call 0x140537250
0xd91979: vmulss xmm8, xmm9, dword ptr [rax + 0xa4]
0xd91981: jmp 0x140d91b0b
0xd91986: vmovaps xmm8, xmm9
0xd9198b: jmp 0x140d91b0b
0xd91990: lea rcx, [rsp + 0x90]
0xd91998: call 0x140537250
0xd9199d: vxorps xmm10, xmm10, xmm10
0xd919a2: vmovss xmm0, dword ptr [rax + 0x8c]
0xd919aa: vucomiss xmm0, xmm10
0xd919af: jp 0x140d919b3
0xd919b1: je 0x140d919e3
0xd919b3: lea rcx, [rsp + 0x90]
0xd919bb: call 0x140537250
0xd919c0: vcomiss xmm9, dword ptr [rax + 0x8c]
0xd919c8: jbe 0x140d919e3
0xd919ca: lea rcx, [rbx + 0xde]
0xd919d1: call 0x140537250
0xd919d6: vmovss xmm8, dword ptr [rax + 0x8c]
0xd919de: jmp 0x140d91b0b
0xd919e3: lea rcx, [rsp + 0x90]
0xd919eb: call 0x140537250
0xd919f0: vmovss xmm0, dword ptr [rax + 0x90]
0xd919f8: vucomiss xmm0, xmm10
0xd919fd: jp 0x140d91a01
0xd919ff: je 0x140d91a36
0xd91a01: lea rcx, [rsp + 0x90]
0xd91a09: call 0x140537250
0xd91a0e: vmovss xmm0, dword ptr [rax + 0x90]
0xd91a16: vcomiss xmm0, xmm9
0xd91a1b: jbe 0x140d91a36
0xd91a1d: lea rcx, [rbx + 0xde]
0xd91a24: call 0x140537250
0xd91a29: vmovss xmm8, dword ptr [rax + 0x90]
0xd91a31: jmp 0x140d91b0b
0xd91a36: lea rcx, [rsp + 0x90]
0xd91a3e: call 0x140537250
0xd91a43: vmovss xmm0, dword ptr [rax + 0xa0]
0xd91a4b: vucomiss xmm0, xmm10
0xd91a50: jp 0x140d91a58
0xd91a52: je 0x140d91986
0xd91a58: lea rcx, [rsp + 0x90]
0xd91a60: call 0x140537250
0xd91a65: lea rcx, [rsp + 0x90]
0xd91a6d: vsubss xmm7, xmm9, dword ptr [rax + 0x98]
0xd91a75: call 0x140537250
0xd91a7a: lea rcx, [rsp + 0x90]
0xd91a82: vmovss xmm6, dword ptr [rax + 0x9c]
0xd91a8a: call 0x140537250
0xd91a8f: vsubss xmm0, xmm6, dword ptr [rax + 0x98]
0xd91a97: vdivss xmm1, xmm7, xmm0
0xd91a9b: vminss xmm2, xmm1, xmm8
0xd91aa0: vmaxss xmm8, xmm10, xmm2
0xd91aa4: vucomiss xmm8, xmm10
0xd91aa9: jp 0x140d91ab4
0xd91aab: jne 0x140d91ab4
0xd91aad: vmovaps xmm0, xmm9
0xd91ab2: jmp 0x140d91b10
0xd91ab4: lea rcx, [rsp + 0x90]
0xd91abc: call 0x140537250
0xd91ac1: mov rcx, qword ptr [rbx + 0x118]
0xd91ac8: lea rdx, [rsp + 0x20]
0xd91acd: vmovss xmm7, dword ptr [rax + 0x94]
0xd91ad5: mov rcx, qword ptr [rcx + 0x18]
0xd91ad9: call 0x1435b4b90
0xd91ade: lea rcx, [rsp + 0x90]
0xd91ae6: vmovss xmm6, dword ptr [rax]
0xd91aea: call 0x140537250
0xd91aef: vmaxss xmm0, xmm6, xmm7
0xd91af3: vmulss xmm1, xmm8, dword ptr [rax + 0xa0]
0xd91afb: vdivss xmm1, xmm1, xmm0
0xd91aff: vmulss xmm2, xmm1, dword ptr [rip + 0x5f19f31]
0xd91b07: vsubss xmm8, xmm9, xmm2
0xd91b0b: vmovaps xmm0, xmm8
0xd91b10: vmovaps xmm6, xmmword ptr [rsp + 0x70]
0xd91b16: vmovaps xmm7, xmmword ptr [rsp + 0x60]
0xd91b1c: lea r11, [rsp + 0x80]
0xd91b24: mov rbx, qword ptr [r11 + 0x18]
0xd91b28: mov rsi, qword ptr [r11 + 0x20]
0xd91b2c: vmovaps xmm8, xmmword ptr [r11 - 0x30]
0xd91b32: vmovaps xmm9, xmmword ptr [r11 - 0x40]
0xd91b38: vmovaps xmm10, xmmword ptr [r11 - 0x50]
0xd91b3e: mov rsp, r11
0xd91b41: pop rdi
0xd91b42: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x35c9320
0x35c9320: mov qword ptr [rsp + 8], rbx
0x35c9325: mov byte ptr [rsp + 0x18], r8b
0x35c932a: push rdi
0x35c932b: sub rsp, 0x20
0x35c932f: mov rax, qword ptr [rcx]
0x35c9332: mov rbx, rcx
0x35c9335: mov rdi, rdx
0x35c9338: mov rcx, qword ptr [rax + 0xa0]
0x35c933f: test rcx, rcx
0x35c9342: je 0x1435c934f
0x35c9344: cmp qword ptr [rcx + 8], 0
0x35c9349: jne 0x1435c9484
0x35c934f: mov rcx, qword ptr [rbx + 0x30]
0x35c9353: test rcx, rcx
0x35c9356: je 0x1435c9484
0x35c935c: call 0x1435366d0
0x35c9361: test al, al
0x35c9363: je 0x1435c9484
0x35c9369: mov rdx, rdi
0x35c936c: mov rcx, rbx
0x35c936f: call 0x1435c72e0
0x35c9374: movzx eax, byte ptr [rdi]
0x35c9377: cmp al, 0x2f
0x35c9379: jne 0x1435c93c1
0x35c937b: xor r8d, r8d
0x35c937e: mov byte ptr [rsp + 0x40], 0x30
0x35c9383: lea rdx, [rsp + 0x40]
0x35c9388: mov rcx, rbx
0x35c938b: call 0x1435c9320
0x35c9390: xor r8d, r8d
0x35c9393: mov byte ptr [rsp + 0x40], 0x31
0x35c9398: lea rdx, [rsp + 0x40]
0x35c939d: mov rcx, rbx
0x35c93a0: call 0x1435c9320
0x35c93a5: xor r8d, r8d
0x35c93a8: mov byte ptr [rsp + 0x40], 0x32
0x35c93ad: lea rdx, [rsp + 0x40]
0x35c93b2: mov rcx, rbx
0x35c93b5: call 0x1435c9320
0x35c93ba: mov byte ptr [rsp + 0x40], 0x33
0x35c93bf: jmp 0x1435c9409
0x35c93c1: cmp al, 0x35
0x35c93c3: jne 0x1435c9419
0x35c93c5: xor r8d, r8d
0x35c93c8: mov byte ptr [rsp + 0x40], 0x36
0x35c93cd: lea rdx, [rsp + 0x40]
0x35c93d2: mov rcx, rbx
0x35c93d5: call 0x1435c9320
0x35c93da: xor r8d, r8d
0x35c93dd: mov byte ptr [rsp + 0x40], 0x37
0x35c93e2: lea rdx, [rsp + 0x40]
0x35c93e7: mov rcx, rbx
0x35c93ea: call 0x1435c9320
0x35c93ef: xor r8d, r8d
0x35c93f2: mov byte ptr [rsp + 0x40], 0x38
0x35c93f7: lea rdx, [rsp + 0x40]
0x35c93fc: mov rcx, rbx
0x35c93ff: call 0x1435c9320
0x35c9404: mov byte ptr [rsp + 0x40], 0x39
0x35c9409: xor r8d, r8d
0x35c940c: lea rdx, [rsp + 0x40]
0x35c9411: mov rcx, rbx
0x35c9414: call 0x1435c9320
0x35c9419: mov rax, qword ptr [rbx]
0x35c941c: mov rdx, qword ptr [rax + 0x50]
0x35c9420: test rdx, rdx
0x35c9423: je 0x1435c9484
0x35c9425: movzx ecx, byte ptr [rdi]
0x35c9428: cmp cl, 0x4c
0x35c942b: je 0x1435c943c
0x35c942d: lea eax, [rcx - 0x4d]
0x35c9430: cmp al, 2
0x35c9432: jbe 0x1435c943c
0x35c9434: sub cl, 0x47
0x35c9437: cmp cl, 4
0x35c943a: ja 0x1435c9484
0x35c943c: vmovdqu xmm3, xmmword ptr [rip + 0x27abe5c]
0x35c9444: vmovups xmmword ptr [rdx + 0x40], xmm3
0x35c9449: vpermilps xmm2, xmm3, 0x51
0x35c944f: vmovups xmmword ptr [rdx + 0x50], xmm2
0x35c9454: vpermilps xmm1, xmm3, 0x45
0x35c945a: vmovups xmmword ptr [rdx + 0x60], xmm1
0x35c945f: vpermilps xmm0, xmm3, 0x15
0x35c9465: vmovups xmmword ptr [rdx + 0x70], xmm0
0x35c946a: mov rax, qword ptr [rbx]
0x35c946d: mov rcx, qword ptr [rax + 0x50]
0x35c9471: vmovups xmmword ptr [rcx], xmm3
0x35c9475: vmovups xmmword ptr [rcx + 0x10], xmm2
0x35c947a: vmovups xmmword ptr [rcx + 0x20], xmm1
0x35c947f: vmovups xmmword ptr [rcx + 0x30], xmm0
0x35c9484: mov rbx, qword ptr [rsp + 0x30]
0x35c9489: add rsp, 0x20
0x35c948d: pop rdi
0x35c948e: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x473f20
0x473f20: mov qword ptr [rsp + 0x10], rbx
0x473f25: mov qword ptr [rsp + 0x18], rbp
0x473f2a: push rsi
0x473f2b: push rdi
0x473f2c: push r14
0x473f2e: sub rsp, 0x50
0x473f32: mov edi, dword ptr [rcx]
0x473f34: mov rbx, qword ptr [rip + 0x68f82bd]
0x473f3b: cmp edi, dword ptr [rbx + 8]
0x473f3e: jae 0x140474026
0x473f44: lea rsi, [rdi*8]
0x473f4c: mov rax, qword ptr [rbx + 0x58]
0x473f50: mov rax, qword ptr [rsi + rax]
0x473f54: test rax, rax
0x473f57: jne 0x140474030
0x473f5d: lea r14, [rbx + 0x90]
0x473f64: cmp qword ptr [r14], rax
0x473f67: jne 0x140473f8e
0x473f69: mov qword ptr [rsp + 0x20], r14
0x473f6e: xor r9d, r9d
0x473f71: lea r8, [rip + 0x550f6f8]
0x473f78: mov rdx, qword ptr [rbx + 0x10]
0x473f7c: lea rcx, [rsp + 0x70]
0x473f81: call 0x1425c5230
0x473f86: mov eax, dword ptr [rsp + 0x70]
0x473f8a: test eax, eax
0x473f8c: jne 0x140474007
0x473f8e: call 0x141416af0
0x473f93: add rax, 0x7d0
0x473f99: mov qword ptr [rbx + 0x98], rax
0x473fa0: mov rcx, qword ptr [r14]
0x473fa3: mov rdx, qword ptr [rbx + 0x28]
0x473fa7: lea r14, [rip + 0x52add12]
0x473fae: mov qword ptr [rsp + 0x30], r14
0x473fb3: mov byte ptr [rsp + 0x38], 0
0x473fb8: lea rbp, [rip + 0x52adca1]
0x473fbf: mov qword ptr [rsp + 0x30], rbp
0x473fc4: mov rax, qword ptr [rcx]
0x473fc7: mov qword ptr [rsp + 0x40], rax
0x473fcc: mov eax, dword ptr [rcx + 0xc]
0x473fcf: mov dword ptr [rsp + 0x48], eax
0x473fd3: mov dword ptr [rsp + 0x4c], 0
0x473fdb: mov eax, dword ptr [rdx + rsi + 4]
0x473fdf: mov dword ptr [rsp + 0x4c], eax
0x473fe3: lea r9, [rsp + 0x30]
0x473fe8: mov r8d, edi
0x473feb: lea rdx, [rsp + 0x70]
0x473ff0: mov rcx, rbx
0x473ff3: call 0x140476aa0
0x473ff8: nop 
0x473ff9: mov qword ptr [rsp + 0x30], rbp
0x473ffe: mov qword ptr [rsp + 0x30], r14
0x474003: mov eax, dword ptr [rsp + 0x70]
0x474007: mov rcx, qword ptr [rip + 0x68875b2]
0x47400e: test eax, eax
0x474010: je 0x140474017
0x474012: mov rax, rcx
0x474015: jmp 0x14047401f
0x474017: mov rax, qword ptr [rbx + 0x58]
0x47401b: mov rax, qword ptr [rsi + rax]
0x47401f: test rax, rax
0x474022: je 0x14047402d
0x474024: jmp 0x140474030
0x474026: mov rcx, qword ptr [rip + 0x6887593]
0x47402d: mov rax, rcx
0x474030: mov rbx, qword ptr [rsp + 0x78]
0x474035: mov rbp, qword ptr [rsp + 0x80]
0x47403d: add rsp, 0x50
0x474041: pop r14
0x474043: pop rdi
0x474044: pop rsi
0x474045: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x433650
0x433650: mov qword ptr [rsp + 0x10], rbx
0x433655: mov qword ptr [rsp + 0x18], rbp
0x43365a: push rsi
0x43365b: push rdi
0x43365c: push r14
0x43365e: sub rsp, 0x50
0x433662: movzx edi, word ptr [rcx]
0x433665: mov rbx, qword ptr [rip + 0x693642c]
0x43366c: cmp edi, dword ptr [rbx + 8]
0x43366f: jae 0x140433758
0x433675: lea rsi, [rdi*8]
0x43367d: mov rax, qword ptr [rbx + 0x58]
0x433681: mov rax, qword ptr [rsi + rax]
0x433685: test rax, rax
0x433688: jne 0x140433762
0x43368e: lea r14, [rbx + 0x90]
0x433695: cmp qword ptr [r14], rax
0x433698: jne 0x1404336bf
0x43369a: mov qword ptr [rsp + 0x20], r14
0x43369f: xor r9d, r9d
0x4336a2: lea r8, [rip + 0x558c397]
0x4336a9: mov rdx, qword ptr [rbx + 0x10]
0x4336ad: lea rcx, [rsp + 0x70]
0x4336b2: call 0x1425c5230
0x4336b7: mov eax, dword ptr [rsp + 0x70]
0x4336bb: test eax, eax
0x4336bd: jne 0x140433739
0x4336bf: call 0x141416af0
0x4336c4: add rax, 0x7d0
0x4336ca: mov qword ptr [rbx + 0x98], rax
0x4336d1: mov rcx, qword ptr [r14]
0x4336d4: mov rdx, qword ptr [rbx + 0x28]
0x4336d8: lea r14, [rip + 0x52ee5e1]
0x4336df: mov qword ptr [rsp + 0x30], r14
0x4336e4: mov byte ptr [rsp + 0x38], 0
0x4336e9: lea rbp, [rip + 0x52ee570]
0x4336f0: mov qword ptr [rsp + 0x30], rbp
0x4336f5: mov rax, qword ptr [rcx]
0x4336f8: mov qword ptr [rsp + 0x40], rax
0x4336fd: mov eax, dword ptr [rcx + 0xc]
0x433700: mov dword ptr [rsp + 0x48], eax
0x433704: mov dword ptr [rsp + 0x4c], 0
0x43370c: mov eax, dword ptr [rdx + rsi + 4]
0x433710: mov dword ptr [rsp + 0x4c], eax
0x433714: lea r9, [rsp + 0x30]
0x433719: movzx r8d, di
0x43371d: lea rdx, [rsp + 0x70]
0x433722: mov rcx, rbx
0x433725: call 0x140433b40
0x43372a: nop 
0x43372b: mov qword ptr [rsp + 0x30], rbp
0x433730: mov qword ptr [rsp + 0x30], r14
0x433735: mov eax, dword ptr [rsp + 0x70]
0x433739: mov rcx, qword ptr [rip + 0x68ca790]
0x433740: test eax, eax
0x433742: je 0x140433749
0x433744: mov rax, rcx
0x433747: jmp 0x140433751
0x433749: mov rax, qword ptr [rbx + 0x58]
0x43374d: mov rax, qword ptr [rsi + rax]
0x433751: test rax, rax
0x433754: je 0x14043375f
0x433756: jmp 0x140433762
0x433758: mov rcx, qword ptr [rip + 0x68ca771]
0x43375f: mov rax, rcx
0x433762: mov rbx, qword ptr [rsp + 0x78]
0x433767: mov rbp, qword ptr [rsp + 0x80]
0x43376f: add rsp, 0x50
0x433773: pop r14
0x433775: pop rdi
0x433776: pop rsi
0x433777: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x35c9320
0x35c9320: mov qword ptr [rsp + 8], rbx
0x35c9325: mov byte ptr [rsp + 0x18], r8b
0x35c932a: push rdi
0x35c932b: sub rsp, 0x20
0x35c932f: mov rax, qword ptr [rcx]
0x35c9332: mov rbx, rcx
0x35c9335: mov rdi, rdx
0x35c9338: mov rcx, qword ptr [rax + 0xa0]
0x35c933f: test rcx, rcx
0x35c9342: je 0x1435c934f
0x35c9344: cmp qword ptr [rcx + 8], 0
0x35c9349: jne 0x1435c9484
0x35c934f: mov rcx, qword ptr [rbx + 0x30]
0x35c9353: test rcx, rcx
0x35c9356: je 0x1435c9484
0x35c935c: call 0x1435366d0
0x35c9361: test al, al
0x35c9363: je 0x1435c9484
0x35c9369: mov rdx, rdi
0x35c936c: mov rcx, rbx
0x35c936f: call 0x1435c72e0
0x35c9374: movzx eax, byte ptr [rdi]
0x35c9377: cmp al, 0x2f
0x35c9379: jne 0x1435c93c1
0x35c937b: xor r8d, r8d
0x35c937e: mov byte ptr [rsp + 0x40], 0x30
0x35c9383: lea rdx, [rsp + 0x40]
0x35c9388: mov rcx, rbx
0x35c938b: call 0x1435c9320
0x35c9390: xor r8d, r8d
0x35c9393: mov byte ptr [rsp + 0x40], 0x31
0x35c9398: lea rdx, [rsp + 0x40]
0x35c939d: mov rcx, rbx
0x35c93a0: call 0x1435c9320
0x35c93a5: xor r8d, r8d
0x35c93a8: mov byte ptr [rsp + 0x40], 0x32
0x35c93ad: lea rdx, [rsp + 0x40]
0x35c93b2: mov rcx, rbx
0x35c93b5: call 0x1435c9320
0x35c93ba: mov byte ptr [rsp + 0x40], 0x33
0x35c93bf: jmp 0x1435c9409
0x35c93c1: cmp al, 0x35
0x35c93c3: jne 0x1435c9419
0x35c93c5: xor r8d, r8d
0x35c93c8: mov byte ptr [rsp + 0x40], 0x36
0x35c93cd: lea rdx, [rsp + 0x40]
0x35c93d2: mov rcx, rbx
0x35c93d5: call 0x1435c9320
0x35c93da: xor r8d, r8d
0x35c93dd: mov byte ptr [rsp + 0x40], 0x37
0x35c93e2: lea rdx, [rsp + 0x40]
0x35c93e7: mov rcx, rbx
0x35c93ea: call 0x1435c9320
0x35c93ef: xor r8d, r8d
0x35c93f2: mov byte ptr [rsp + 0x40], 0x38
0x35c93f7: lea rdx, [rsp + 0x40]
0x35c93fc: mov rcx, rbx
0x35c93ff: call 0x1435c9320
0x35c9404: mov byte ptr [rsp + 0x40], 0x39
0x35c9409: xor r8d, r8d
0x35c940c: lea rdx, [rsp + 0x40]
0x35c9411: mov rcx, rbx
0x35c9414: call 0x1435c9320
0x35c9419: mov rax, qword ptr [rbx]
0x35c941c: mov rdx, qword ptr [rax + 0x50]
0x35c9420: test rdx, rdx
0x35c9423: je 0x1435c9484
0x35c9425: movzx ecx, byte ptr [rdi]
0x35c9428: cmp cl, 0x4c
0x35c942b: je 0x1435c943c
0x35c942d: lea eax, [rcx - 0x4d]
0x35c9430: cmp al, 2
0x35c9432: jbe 0x1435c943c
0x35c9434: sub cl, 0x47
0x35c9437: cmp cl, 4
0x35c943a: ja 0x1435c9484
0x35c943c: vmovdqu xmm3, xmmword ptr [rip + 0x27abe5c]
0x35c9444: vmovups xmmword ptr [rdx + 0x40], xmm3
0x35c9449: vpermilps xmm2, xmm3, 0x51
0x35c944f: vmovups xmmword ptr [rdx + 0x50], xmm2
0x35c9454: vpermilps xmm1, xmm3, 0x45
0x35c945a: vmovups xmmword ptr [rdx + 0x60], xmm1
0x35c945f: vpermilps xmm0, xmm3, 0x15
0x35c9465: vmovups xmmword ptr [rdx + 0x70], xmm0
0x35c946a: mov rax, qword ptr [rbx]
0x35c946d: mov rcx, qword ptr [rax + 0x50]
0x35c9471: vmovups xmmword ptr [rcx], xmm3
0x35c9475: vmovups xmmword ptr [rcx + 0x10], xmm2
0x35c947a: vmovups xmmword ptr [rcx + 0x20], xmm1
0x35c947f: vmovups xmmword ptr [rcx + 0x30], xmm0
0x35c9484: mov rbx, qword ptr [rsp + 0x30]
0x35c9489: add rsp, 0x20
0x35c948d: pop rdi
0x35c948e: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
CALLEE 0x3598390
0x3598390: mov qword ptr [rsp + 8], rbx
0x3598395: mov qword ptr [rsp + 0x10], rsi
0x359839a: push rdi
0x359839b: sub rsp, 0x20
0x359839f: mov ebx, dword ptr [rcx + 8]
0x35983a2: mov rdi, rdx
0x35983a5: mov rsi, rcx
0x35983a8: cmp ebx, -1
0x35983ab: je 0x143598412
0x35983ad: mov eax, dword ptr [rdx + 8]
0x35983b0: cmp eax, -1
0x35983b3: je 0x143598412
0x35983b5: cmp ebx, eax
0x35983b7: jne 0x143598412
0x35983b9: call 0x140411e10
0x35983be: cmp ebx, dword ptr [rax + 0x10]
0x35983c1: jae 0x1435983f9
0x35983c3: mov rax, qword ptr [rax + 8]
0x35983c7: mov rdx, qword ptr [rax + rbx*8]
0x35983cb: test rdx, rdx
0x35983ce: je 0x1435983f9
0x35983d0: test byte ptr [rdx + 6], 1
0x35983d4: je 0x1435983dd
0x35983d6: cmp word ptr [rdx + 4], 8
0x35983db: jbe 0x1435983f9
0x35983dd: mov rcx, qword ptr [rsi]
0x35983e0: mov rdx, qword ptr [rdi]
0x35983e3: mov rax, qword ptr [rcx]
0x35983e6: mov rbx, qword ptr [rsp + 0x30]
0x35983eb: mov rsi, qword ptr [rsp + 0x38]
0x35983f0: add rsp, 0x20
0x35983f4: pop rdi
0x35983f5: jmp qword ptr [rax + 8]
0x35983f9: mov rax, qword ptr [rdi]
0x35983fc: cmp qword ptr [rsi], rax
0x35983ff: sete al
0x3598402: mov rbx, qword ptr [rsp + 0x30]
0x3598407: mov rsi, qword ptr [rsp + 0x38]
0x359840c: add rsp, 0x20
0x3598410: pop rdi
0x3598411: ret 
0x3598412: mov rbx, qword ptr [rsp + 0x30]
0x3598417: xor al, al
0x3598419: mov rsi, qword ptr [rsp + 0x38]
0x359841e: add rsp, 0x20
0x3598422: pop rdi
0x3598423: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0xd91660
0xd91660: mov qword ptr [rsp + 0x10], rbx
0xd91665: mov qword ptr [rsp + 0x20], rsi
0xd9166a: mov qword ptr [rsp + 0x18], r8
0xd9166f: push rbp
0xd91670: push rdi
0xd91671: push r14
0xd91673: mov rbp, rsp
0xd91676: sub rsp, 0x40
0xd9167a: mov rdi, rcx
0xd9167d: mov rsi, rdx
0xd91680: mov rcx, qword ptr [rcx + 8]
0xd91684: lea rdx, [rbp + 0x20]
0xd91688: mov rbx, r9
0xd9168b: mov rcx, qword ptr [rcx + 0x18]
0xd9168f: call 0x1435b4b90
0xd91694: vmovss xmm0, dword ptr [rbp + 0x30]
0xd91699: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xd916a1: vmovss xmm3, dword ptr [rdi + 0xa98]
0xd916a9: vmovss xmm4, dword ptr [rip + 0x4fe1883]
0xd916b1: vmovss xmm0, dword ptr [rdi + 0xa5c]
0xd916b9: movzx r14d, byte ptr [rbp + 0x48]
0xd916be: lea r9, [rbp + 0x40]
0xd916c2: vdivss xmm2, xmm1, xmm3
0xd916c6: vmulss xmm1, xmm4, dword ptr [rbp + 0x20]
0xd916cb: vaddss xmm2, xmm2, xmm1
0xd916cf: vsubss xmm1, xmm0, dword ptr [rbp + 0x34]
0xd916d4: vmulss xmm0, xmm4, dword ptr [rbp + 0x24]
0xd916d9: vdivss xmm3, xmm1, xmm3
0xd916dd: vaddss xmm1, xmm3, xmm0
0xd916e1: vmovss dword ptr [rbp + 0x34], xmm1
0xd916e6: vmovss dword ptr [rbp + 0x30], xmm2
0xd916eb: mov rdx, qword ptr [rbp + 0x30]
0xd916ef: mov r8, rbx
0xd916f2: mov rcx, rdi
0xd916f5: mov byte ptr [rsp + 0x20], r14b
0xd916fa: call 0x140d91480
0xd916ff: movzx ebx, al
0xd91702: test al, al
0xd91704: jne 0x140d9170f
0xd91706: test r14b, r14b
0xd91709: je 0x140d917e4
0xd9170f: mov rcx, qword ptr [rsi + 0x20]
0xd91713: lea r9, [rbp + 0x20]
0xd91717: lea r8, [rbp + 0x30]
0xd9171b: mov byte ptr [rbp + 0x20], 0
0xd9171f: lea rdx, [rbp - 0x10]
0xd91723: mov byte ptr [rbp - 0x10], 2
0xd91727: call 0x14064b570
0xd9172c: mov rcx, qword ptr [rsi + 0x20]
0xd91730: lea r9, [rbp + 0x20]
0xd91734: lea r8, [rbp + 0x34]
0xd91738: mov byte ptr [rbp + 0x20], 0
0xd9173c: lea rdx, [rbp - 0x10]
0xd91740: mov byte ptr [rbp - 0x10], 4
0xd91744: call 0x14064b570
0xd91749: mov rdx, qword ptr [rsi + 0x18]
0xd9174d: mov rcx, qword ptr [rdx]
0xd91750: mov rax, qword ptr [rcx + 0xa0]
0xd91757: test rax, rax
0xd9175a: je 0x140d91763
0xd9175c: cmp qword ptr [rax + 8], 0
0xd91761: jne 0x140d917a3
0xd91763: mov rax, qword ptr [rcx + 0x20]
0xd91767: vmovss xmm0, dword ptr [rbp + 0x40]
0xd9176c: mov rcx, qword ptr [rax + 0x20]
0xd91770: vmovss dword ptr [rcx + 0x20], xmm0
0xd91775: mov rax, qword ptr [rdx]
0xd91778: mov rcx, qword ptr [rax + 0x20]
0xd9177c: mov rax, qword ptr [rcx + 0x20]
0xd91780: vmovss dword ptr [rax + 0x28], xmm0
0xd91785: mov rax, qword ptr [rdx]
0xd91788: mov rcx, qword ptr [rax + 0x20]
0xd9178c: mov rax, qword ptr [rcx + 0x20]
0xd91790: mov dword ptr [rax + 0x30], 0x3f800000
0xd91797: mov rcx, qword ptr [rdx]
0xd9179a: mov rcx, qword ptr [rcx + 0x18]
0xd9179e: call 0x140d438d0
0xd917a3: cmp byte ptr [rbp + 0x50], 0
0xd917a7: jne 0x140d917e1
0xd917a9: cmp byte ptr [rip + 0x5fd5528], 0
0xd917b0: je 0x140d917e1
0xd917b2: vmovss xmm0, dword ptr [rbp + 0x58]
0xd917b7: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4fe4591]
0xd917bf: mov rcx, qword ptr [rsi + 0x20]
0xd917c3: lea r9, [rbp + 0x20]
0xd917c7: lea r8, [rbp - 0xc]
0xd917cb: mov byte ptr [rbp + 0x20], 0
0xd917cf: lea rdx, [rbp - 0x10]
0xd917d3: mov byte ptr [rbp - 0x10], 0x49
0xd917d7: vmovss dword ptr [rbp - 0xc], xmm1
0xd917dc: call 0x14064b570
0xd917e1: movzx eax, bl
0xd917e4: mov rbx, qword ptr [rsp + 0x68]
0xd917e9: mov rsi, qword ptr [rsp + 0x78]
0xd917ee: add rsp, 0x40
0xd917f2: pop r14
0xd917f4: pop rdi
0xd917f5: pop rbp
0xd917f6: ret 
CALLEE 0xdb2510
0xdb2510: mov rax, rsp
0xdb2513: mov qword ptr [rax + 8], rbx
0xdb2517: push rbp
0xdb2518: push rsi
0xdb2519: push rdi
0xdb251a: push r12
0xdb251c: push r13
0xdb251e: push r14
0xdb2520: push r15
0xdb2522: lea rbp, [rax - 0x5f]
0xdb2526: sub rsp, 0xa0
0xdb252d: vmovaps xmmword ptr [rax - 0x48], xmm6
0xdb2532: vmovaps xmmword ptr [rax - 0x58], xmm7
0xdb2537: mov r13, rdx
0xdb253a: mov rdi, rcx
0xdb253d: cmp byte ptr [rdx + 0x2ba], 0
0xdb2544: jne 0x140db29fd
0xdb254a: lea rcx, [rdx + 0xde]
0xdb2551: call 0x140537250
0xdb2556: mov esi, 0xffff
0xdb255b: cmp word ptr [rax + 0x30], si
0xdb255f: je 0x140db2580
0xdb2561: lea rcx, [r13 + 0xde]
0xdb2568: call 0x140537250
0xdb256d: lea rcx, [rax + 0x30]
0xdb2571: call 0x140433650
0xdb2576: cmp word ptr [rax + 0x18], si
0xdb257a: je 0x140db29fd
0xdb2580: mov edx, 0x1ec
0xdb2585: mov rax, qword ptr gs:[0x58]
0xdb258e: mov rcx, qword ptr [rax]
0xdb2591: mov qword ptr [rbp - 0x39], rcx
0xdb2595: mov rax, qword ptr [rip + 0x5fb6f8c]
0xdb259c: cmp byte ptr [rdx + rcx], 0
0xdb25a0: cmovne rax, qword ptr [rip + 0x5fb6f88]
0xdb25a8: mov rax, qword ptr [rax]
0xdb25ab: mov rcx, qword ptr [rax + 8]
0xdb25af: mov rax, qword ptr [rcx + 0x270]
0xdb25b6: movzx ecx, word ptr [rax + 0x134]
0xdb25bd: cmp word ptr [r13 + 0xde], cx
0xdb25c5: jne 0x140db29fd
0xdb25cb: vmovups xmm0, xmmword ptr [r13 + 0xc8]
0xdb25d4: vmovups xmmword ptr [rbp - 0x31], xmm0
0xdb25d9: vpextrb eax, xmm0, 8
0xdb25df: cmp al, 6
0xdb25e1: jne 0x140db29fd
0xdb25e7: movzx ebx, word ptr [rbp - 0x31]
0xdb25eb: mov word ptr [rbp + 0x6f], bx
0xdb25ef: lea rcx, [rbp + 0x6f]
0xdb25f3: call 0x140537250
0xdb25f8: lea rcx, [rax + 0x30]
0xdb25fc: cmp word ptr [rcx], si
0xdb25ff: je 0x140db29fd
0xdb2605: call 0x140433650
0xdb260a: cmp word ptr [rax + 0x18], si
0xdb260e: je 0x140db29fd
0xdb2614: cmp bx, si
0xdb2617: je 0x140db29fd
0xdb261d: mov rcx, r13
0xdb2620: call 0x140d8ef00
0xdb2625: test al, al
0xdb2627: je 0x140db29fd
0xdb262d: movzx eax, word ptr [r13 + 0x340]
0xdb2635: mov word ptr [rbp + 0x6f], ax
0xdb2639: lea rcx, [rbp + 0x6f]
0xdb263d: call 0x140430020
0xdb2642: cmp dword ptr [rdi + 0x524], 0
0xdb2649: je 0x140db29fd
0xdb264f: mov r9d, dword ptr [rax]
0xdb2652: mov ecx, dword ptr [rdi + 0x520]
0xdb2658: test ecx, ecx
0xdb265a: je 0x140db29fd
0xdb2660: xor edx, edx
0xdb2662: mov eax, r9d
0xdb2665: div ecx
0xdb2667: mov r8d, edx
0xdb266a: shl r8, 8
0xdb266e: add r8, qword ptr [rdi + 0x530]
0xdb2675: xor edx, edx
0xdb2677: mov r11d, dword ptr [r8]
0xdb267a: test r11d, r11d
0xdb267d: je 0x140db29fd
0xdb2683: cmp dword ptr [r8 + rdx*8 + 8], r9d
0xdb2688: jne 0x140db26a0
0xdb268a: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb268f: mov rax, qword ptr [rdi + 0x538]
0xdb2696: mov r10, qword ptr [rax + rcx*8]
0xdb269a: cmp dword ptr [r10 + 4], r9d
0xdb269e: je 0x140db26ac
0xdb26a0: inc edx
0xdb26a2: cmp edx, r11d
0xdb26a5: jb 0x140db2683
0xdb26a7: jmp 0x140db29fd
0xdb26ac: lea rbx, [r10 + 8]
0xdb26b0: test rbx, rbx
0xdb26b3: je 0x140db29fd
0xdb26b9: lea rdx, [rbp - 0x21]
0xdb26bd: call 0x14064f4f0
0xdb26c2: nop 
0xdb26c3: cmp byte ptr [rbp - 0x11], 0
0xdb26c7: jne 0x140db26ce
0xdb26c9: jmp 0x140db29e9
0xdb26ce: mov rsi, qword ptr [rbx]
0xdb26d1: mov eax, dword ptr [rbx + 8]
0xdb26d4: lea rcx, [rax + rax*2]
0xdb26d8: lea r12, [rsi + rcx*8]
0xdb26dc: cmp rsi, r12
0xdb26df: je 0x140db29e9
0xdb26e5: lea r15, [rsi + 0xa]
0xdb26e9: vmovss xmm7, dword ptr [rip + 0x4fc0843]
0xdb26f1: mov rcx, r15
0xdb26f4: call 0x140430020
0xdb26f9: mov r8d, 1
0xdb26ff: movzx edx, word ptr [rax + 0x12]
0xdb2703: call 0x140652f40
0xdb2708: mov r14, qword ptr [rsi]
0xdb270b: test r14, r14
0xdb270e: je 0x140db29d8
0xdb2714: xor edx, edx
0xdb2716: lea rcx, [r13 + 0x1e8]
0xdb271d: nop dword ptr [rax]
0xdb2720: cmp byte ptr [rcx], 0
0xdb2723: jne 0x140db2990
0xdb2729: inc edx
0xdb272b: inc rcx
0xdb272e: cmp edx, 3
0xdb2731: jb 0x140db2720
0xdb2733: test al, al
0xdb2735: je 0x140db2990
0xdb273b: mov rbx, qword ptr [r14 + 0x20]
0xdb273f: mov rax, qword ptr [rbx]
0xdb2742: mov rcx, qword ptr [rax + 0xa0]
0xdb2749: test rcx, rcx
0xdb274c: je 0x140db2755
0xdb274e: cmp qword ptr [rcx + 8], 0
0xdb2753: jne 0x140db2772
0xdb2755: lea rdx, [rip + 0x5f1c8bc]
0xdb275c: mov rcx, qword ptr [rbx + 8]
0xdb2760: call 0x1435ca140
0xdb2765: cmp eax, -1
0xdb2768: je 0x140db2772
0xdb276a: mov rcx, rbx
0xdb276d: call 0x1435c66a0
0xdb2772: mov rax, qword ptr [rip + 0x5fb6daf]
0xdb2779: mov rcx, qword ptr [rbp - 0x39]
0xdb277d: mov edx, 0x1ec
0xdb2782: cmp byte ptr [rdx + rcx], 0
0xdb2786: cmovne rax, qword ptr [rip + 0x5fb6da2]
0xdb278e: mov rax, qword ptr [rax]
0xdb2791: mov rcx, qword ptr [rax + 8]
0xdb2795: mov rcx, qword ptr [rcx + 0x270]
0xdb279c: add rcx, 0x134
0xdb27a3: call 0x140537250
0xdb27a8: mov ebx, dword ptr [rax]
0xdb27aa: mov rcx, r15
0xdb27ad: call 0x140430020
0xdb27b2: movzx edx, word ptr [rax + 0x12]
0xdb27b6: mov rcx, qword ptr [rbp - 0x19]
0xdb27ba: call 0x140d91e30
0xdb27bf: cmp dword ptr [rax + 0x58], 0
0xdb27c3: jne 0x140db27cc
0xdb27c5: mov eax, 0xffff
0xdb27ca: jmp 0x140db27d3
0xdb27cc: mov rax, qword ptr [rax + 0x50]
0xdb27d0: movzx eax, word ptr [rax]
0xdb27d3: xor ecx, ecx
0xdb27d5: mov dword ptr [rbp - 0x28], ecx
0xdb27d8: mov word ptr [rbp - 0x24], cx
0xdb27dc: mov byte ptr [rbp - 0x22], cl
0xdb27df: mov qword ptr [rbp - 0x31], 0xffffffffffffffff
0xdb27e7: mov word ptr [rbp - 0x31], ax
0xdb27eb: mov byte ptr [rbp - 0x29], 6
0xdb27ef: cmp dword ptr [rdi + 0x15c], ecx
0xdb27f5: je 0x140db29d8
0xdb27fb: mov ecx, dword ptr [rdi + 0x158]
0xdb2801: test ecx, ecx
0xdb2803: je 0x140db29d8
0xdb2809: xor edx, edx
0xdb280b: mov eax, ebx
0xdb280d: div ecx
0xdb280f: mov r8d, edx
0xdb2812: shl r8, 8
0xdb2816: add r8, qword ptr [rdi + 0x168]
0xdb281d: xor edx, edx
0xdb281f: mov r10d, dword ptr [r8]
0xdb2822: test r10d, r10d
0xdb2825: je 0x140db29d8
0xdb282b: nop dword ptr [rax + rax]
0xdb2830: cmp dword ptr [r8 + rdx*8 + 8], ebx
0xdb2835: jne 0x140db284d
0xdb2837: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0xdb283c: mov rax, qword ptr [rdi + 0x170]
0xdb2843: mov r9, qword ptr [rax + rcx*8]
0xdb2847: cmp dword ptr [r9 + 4], ebx
0xdb284b: je 0x140db2859
0xdb284d: inc edx
0xdb284f: cmp edx, r10d
0xdb2852: jb 0x140db2830
0xdb2854: jmp 0x140db29d8
0xdb2859: lea rcx, [r9 + 8]
0xdb285d: test rcx, rcx
0xdb2860: je 0x140db29d8
0xdb2866: lea rdx, [rbp - 0x31]
0xdb286a: call 0x140de4500
0xdb286f: test rax, rax
0xdb2872: je 0x140db29d8
0xdb2878: mov rcx, qword ptr [rdi + 8]
0xdb287c: lea rdx, [rbp - 0x41]
0xdb2880: mov rcx, qword ptr [rcx + 0x18]
0xdb2884: call 0x1435b4b90
0xdb2889: vmovss xmm4, dword ptr [rdi + 0xa98]
0xdb2891: vmovss xmm0, dword ptr [r15 + 2]
0xdb2897: vsubss xmm1, xmm0, dword ptr [rdi + 0xa58]
0xdb289f: vdivss xmm3, xmm1, xmm4
0xdb28a3: vmulss xmm0, xmm7, dword ptr [rbp - 0x41]
0xdb28a8: vaddss xmm1, xmm3, xmm0
0xdb28ac: vmovss dword ptr [rbp + 0x7f], xmm1
0xdb28b1: vmovss xmm2, dword ptr [r15 + 6]
0xdb28b7: vaddss xmm0, xmm2, dword ptr [rdi + 0xa5c]
0xdb28bf: vdivss xmm3, xmm0, xmm4
0xdb28c3: vmulss xmm2, xmm7, dword ptr [rbp - 0x3d]
0xdb28c8: vaddss xmm0, xmm3, xmm2
0xdb28cc: vmovss dword ptr [rbp + 0x83], xmm0
0xdb28d4: vmovss xmm3, dword ptr [rdi + 0xa9c]
0xdb28dc: movzx r8d, byte ptr [rdi + 0xae4]
0xdb28e4: vmovss xmm1, dword ptr [rdi + 0xabc]
0xdb28ec: mov rcx, r13
0xdb28ef: call 0x140d91820
0xdb28f4: vmovaps xmm6, xmm0
0xdb28f8: mov byte ptr [rbp + 0x6f], 0
0xdb28fc: mov byte ptr [rbp + 0x77], 2
0xdb2900: lea r9, [rbp + 0x6f]
0xdb2904: lea r8, [rbp + 0x7f]
0xdb2908: lea rdx, [rbp + 0x77]
0xdb290c: mov rcx, qword ptr [r14 + 0x20]
0xdb2910: call 0x14064b570
0xdb2915: mov byte ptr [rbp + 0x6f], 0
0xdb2919: mov byte ptr [rbp + 0x77], 4
0xdb291d: lea r9, [rbp + 0x6f]
0xdb2921: lea r8, [rbp + 0x83]
0xdb2928: lea rdx, [rbp + 0x77]
0xdb292c: mov rcx, qword ptr [r14 + 0x20]
0xdb2930: call 0x14064b570
0xdb2935: mov rdx, qword ptr [r14 + 0x18]
0xdb2939: mov rcx, qword ptr [rdx]
0xdb293c: mov rax, qword ptr [rcx + 0xa0]
0xdb2943: test rax, rax
0xdb2946: je 0x140db2953
0xdb2948: cmp qword ptr [rax + 8], 0
0xdb294d: jne 0x140db29d8
0xdb2953: mov rax, qword ptr [rcx + 0x20]
0xdb2957: mov rcx, qword ptr [rax + 0x20]
0xdb295b: vmovss dword ptr [rcx + 0x20], xmm6
0xdb2960: mov rax, qword ptr [rdx]
0xdb2963: mov rcx, qword ptr [rax + 0x20]
0xdb2967: mov rax, qword ptr [rcx + 0x20]
0xdb296b: vmovss dword ptr [rax + 0x28], xmm6
0xdb2970: mov rax, qword ptr [rdx]
0xdb2973: mov rcx, qword ptr [rax + 0x20]
0xdb2977: mov rax, qword ptr [rcx + 0x20]
0xdb297b: mov dword ptr [rax + 0x30], 0x3f800000
0xdb2982: mov rcx, qword ptr [rdx]
0xdb2985: mov rcx, qword ptr [rcx + 0x18]
0xdb2989: call 0x140d438d0
0xdb298e: jmp 0x140db29d8
0xdb2990: mov rbx, qword ptr [r14 + 0x20]
0xdb2994: mov rax, qword ptr [rbx]
0xdb2997: mov rcx, qword ptr [rax + 0xa0]
0xdb299e: test rcx, rcx
0xdb29a1: je 0x140db29aa
0xdb29a3: cmp qword ptr [rcx + 8], 0
0xdb29a8: jne 0x140db29d8
0xdb29aa: cmp dword ptr [rip + 0x5f1c667], 0
0xdb29b1: je 0x140db29d8
0xdb29b3: lea rdx, [rip + 0x5f1c65e]
0xdb29ba: mov rcx, qword ptr [rbx + 8]
0xdb29be: call 0x1435ca0a0
0xdb29c3: test al, al
0xdb29c5: je 0x140db29d8
0xdb29c7: mov rcx, qword ptr [rbx + 8]
0xdb29cb: call 0x1435caec0
0xdb29d0: mov rcx, rbx
0xdb29d3: call 0x1435c66a0
0xdb29d8: add rsi, 0x18
0xdb29dc: add r15, 0x18
0xdb29e0: cmp rsi, r12
0xdb29e3: jne 0x140db26f1
0xdb29e9: lea rax, [rip + 0x4973458]
0xdb29f0: mov qword ptr [rbp - 0x21], rax
0xdb29f4: lea rcx, [rbp - 0x21]
0xdb29f8: call 0x141434880
0xdb29fd: lea r11, [rsp + 0xa0]
0xdb2a05: mov rbx, qword ptr [r11 + 0x40]
0xdb2a09: vmovaps xmm6, xmmword ptr [r11 - 0x10]
0xdb2a0f: vmovaps xmm7, xmmword ptr [r11 - 0x20]
0xdb2a15: mov rsp, r11
0xdb2a18: pop r15
0xdb2a1a: pop r14
0xdb2a1c: pop r13
0xdb2a1e: pop r12
0xdb2a20: pop rdi
0xdb2a21: pop rsi
0xdb2a22: pop rbp
0xdb2a23: ret 
CALLEE 0xd8cb20
0xd8cb20: mov rax, rsp
0xd8cb23: push rbp
0xd8cb24: push rbx
0xd8cb25: push rsi
0xd8cb26: push r14
0xd8cb28: push r15
0xd8cb2a: lea rbp, [rax - 0x4f]
0xd8cb2e: sub rsp, 0xe0
0xd8cb35: vmovaps xmmword ptr [rax - 0x48], xmm7
0xd8cb3a: vmovaps xmmword ptr [rax - 0x58], xmm8
0xd8cb3f: vmovaps xmmword ptr [rax - 0x68], xmm9
0xd8cb44: vmovaps xmmword ptr [rax - 0x78], xmm10
0xd8cb49: vmovaps xmmword ptr [rax - 0x88], xmm11
CALLEE 0xd8bf00
0xd8bf00: mov qword ptr [rsp + 8], rbx
0xd8bf05: push rdi
0xd8bf06: sub rsp, 0x20
0xd8bf0a: mov rdi, rcx
0xd8bf0d: mov edx, 0xffff
0xd8bf12: mov eax, 0xde
0xd8bf17: mov ecx, 0x288
0xd8bf1c: cmp word ptr [rdi + 0x288], dx
0xd8bf23: cmove ecx, eax
0xd8bf26: add rcx, rdi
0xd8bf29: call 0x140537250
0xd8bf2e: movzx ebx, byte ptr [rax + 0x2a]
0xd8bf32: cmp bl, 3
0xd8bf35: jae 0x140d8bf71
0xd8bf37: lea rcx, [rdi + 0xde]
0xd8bf3e: call 0x140537250
0xd8bf43: cmp byte ptr [rax + 0xb7], 0
0xd8bf4a: je 0x140d8bf71
0xd8bf4c: vmovss xmm0, dword ptr [rdi + 0xe4]
0xd8bf54: vcomiss xmm0, dword ptr [rip + 0x5f520ec]
0xd8bf5c: mov eax, ebx
0xd8bf5e: mov ecx, 3
0xd8bf63: cmovae eax, ecx
0xd8bf66: mov rbx, qword ptr [rsp + 0x30]
0xd8bf6b: add rsp, 0x20
0xd8bf6f: pop rdi
0xd8bf70: ret 
0xd8bf71: movzx eax, bl
0xd8bf74: mov rbx, qword ptr [rsp + 0x30]
0xd8bf79: add rsp, 0x20
0xd8bf7d: pop rdi
0xd8bf7e: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdeca40
0xdeca40: mov qword ptr [rsp + 8], rbx
0xdeca45: push rdi
0xdeca46: sub rsp, 0x20
0xdeca4a: xor r10d, r10d
0xdeca4d: lea r9, [rcx + 0x1e8]
0xdeca54: movzx edi, r8b
0xdeca58: mov r11d, r10d
0xdeca5b: mov rax, r9
0xdeca5e: movzx r8d, dl
0xdeca62: mov rbx, rcx
0xdeca65: cmp byte ptr [rax], r10b
0xdeca68: jne 0x140deca7a
0xdeca6a: inc r11d
0xdeca6d: inc rax
0xdeca70: cmp r11d, 3
0xdeca74: jb 0x140deca65
0xdeca76: xor dl, dl
0xdeca78: jmp 0x140deca7c
0xdeca7a: mov dl, 1
0xdeca7c: mov rcx, r8
0xdeca7f: shr r8, 3
0xdeca83: and ecx, 7
0xdeca86: movzx eax, byte ptr [r8 + r9]
0xdeca8b: test dil, dil
0xdeca8e: je 0x140deca95
0xdeca90: bts eax, ecx
0xdeca93: jmp 0x140deca98
0xdeca95: btr eax, ecx
0xdeca98: mov byte ptr [r8 + r9], al
0xdeca9c: nop dword ptr [rax]
0xdecaa0: cmp byte ptr [r9], 0
0xdecaa4: jne 0x140decab6
0xdecaa6: inc r10d
0xdecaa9: inc r9
0xdecaac: cmp r10d, 3
0xdecab0: jb 0x140decaa0
0xdecab2: xor al, al
0xdecab4: jmp 0x140decab8
0xdecab6: mov al, 1
0xdecab8: cmp dl, al
0xdecaba: je 0x140decad7
0xdecabc: mov rdx, qword ptr [rbx]
0xdecabf: mov rcx, rbx
0xdecac2: test al, al
0xdecac4: je 0x140decad4
0xdecac6: mov rbx, qword ptr [rsp + 0x30]
0xdecacb: add rsp, 0x20
0xdecacf: pop rdi
0xdecad0: jmp qword ptr [rdx + 0x28]
0xdecad4: call qword ptr [rdx + 0x20]
0xdecad7: mov rbx, qword ptr [rsp + 0x30]
0xdecadc: add rsp, 0x20
0xdecae0: pop rdi
0xdecae1: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0xcb6bd0
0xcb6bd0: push rsi
0xcb6bd2: sub rsp, 0x30
0xcb6bd6: cmp byte ptr [rcx + 0xbd], 0
0xcb6bdd: mov rsi, rcx
0xcb6be0: mov byte ptr [rcx + 0xbe], 0
0xcb6be7: jne 0x140cb6d6d
0xcb6bed: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0xdabae0
0xdabae0: mov qword ptr [rsp + 0x10], rbx
0xdabae5: push rsi
0xdabae6: sub rsp, 0x50
0xdabaea: cmp byte ptr [r8 + 0x10], 0
0xdabaef: mov rbx, rdx
0xdabaf2: mov rsi, rcx
0xdabaf5: jne 0x140dabb04
0xdabaf7: mov al, 1
0xdabaf9: mov rbx, qword ptr [rsp + 0x68]
0xdabafe: add rsp, 0x50
0xdabb02: pop rsi
0xdabb03: ret 
0xdabb04: cmp byte ptr [r8 + 0x10], 0
0xdabb09: vmovups xmm0, xmmword ptr [r8]
0xdabb0e: mov qword ptr [rsp + 0x60], rdi
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0xd8bf00
0xd8bf00: mov qword ptr [rsp + 8], rbx
0xd8bf05: push rdi
0xd8bf06: sub rsp, 0x20
0xd8bf0a: mov rdi, rcx
0xd8bf0d: mov edx, 0xffff
0xd8bf12: mov eax, 0xde
0xd8bf17: mov ecx, 0x288
0xd8bf1c: cmp word ptr [rdi + 0x288], dx
0xd8bf23: cmove ecx, eax
0xd8bf26: add rcx, rdi
0xd8bf29: call 0x140537250
0xd8bf2e: movzx ebx, byte ptr [rax + 0x2a]
0xd8bf32: cmp bl, 3
0xd8bf35: jae 0x140d8bf71
0xd8bf37: lea rcx, [rdi + 0xde]
0xd8bf3e: call 0x140537250
0xd8bf43: cmp byte ptr [rax + 0xb7], 0
0xd8bf4a: je 0x140d8bf71
0xd8bf4c: vmovss xmm0, dword ptr [rdi + 0xe4]
0xd8bf54: vcomiss xmm0, dword ptr [rip + 0x5f520ec]
0xd8bf5c: mov eax, ebx
0xd8bf5e: mov ecx, 3
0xd8bf63: cmovae eax, ecx
0xd8bf66: mov rbx, qword ptr [rsp + 0x30]
0xd8bf6b: add rsp, 0x20
0xd8bf6f: pop rdi
0xd8bf70: ret 
0xd8bf71: movzx eax, bl
0xd8bf74: mov rbx, qword ptr [rsp + 0x30]
0xd8bf79: add rsp, 0x20
0xd8bf7d: pop rdi
0xd8bf7e: ret 
CALLEE 0x537250
0x537250: mov qword ptr [rsp + 0x10], rbx
0x537255: mov qword ptr [rsp + 0x18], rbp
0x53725a: push rsi
0x53725b: push rdi
0x53725c: push r14
0x53725e: sub rsp, 0x50
0x537262: movzx edi, word ptr [rcx]
0x537265: mov rbx, qword ptr [rip + 0x68371ac]
0x53726c: cmp edi, dword ptr [rbx + 8]
0x53726f: jae 0x140537358
0x537275: lea rsi, [rdi*8]
0x53727d: mov rax, qword ptr [rbx + 0x58]
0x537281: mov rax, qword ptr [rsi + rax]
0x537285: test rax, rax
0x537288: jne 0x140537362
0x53728e: lea r14, [rbx + 0x90]
0x537295: cmp qword ptr [r14], rax
0x537298: jne 0x1405372bf
0x53729a: mov qword ptr [rsp + 0x20], r14
0x53729f: xor r9d, r9d
0x5372a2: lea r8, [rip + 0x5450ed7]
0x5372a9: mov rdx, qword ptr [rbx + 0x10]
0x5372ad: lea rcx, [rsp + 0x70]
0x5372b2: call 0x1425c5230
0x5372b7: mov eax, dword ptr [rsp + 0x70]
0x5372bb: test eax, eax
0x5372bd: jne 0x140537339
0x5372bf: call 0x141416af0
0x5372c4: add rax, 0x7d0
0x5372ca: mov qword ptr [rbx + 0x98], rax
0x5372d1: mov rcx, qword ptr [r14]
0x5372d4: mov rdx, qword ptr [rbx + 0x28]
0x5372d8: lea r14, [rip + 0x51ea9e1]
0x5372df: mov qword ptr [rsp + 0x30], r14
0x5372e4: mov byte ptr [rsp + 0x38], 0
0x5372e9: lea rbp, [rip + 0x51ea970]
0x5372f0: mov qword ptr [rsp + 0x30], rbp
0x5372f5: mov rax, qword ptr [rcx]
0x5372f8: mov qword ptr [rsp + 0x40], rax
0x5372fd: mov eax, dword ptr [rcx + 0xc]
0x537300: mov dword ptr [rsp + 0x48], eax
0x537304: mov dword ptr [rsp + 0x4c], 0
0x53730c: mov eax, dword ptr [rdx + rsi + 4]
0x537310: mov dword ptr [rsp + 0x4c], eax
0x537314: lea r9, [rsp + 0x30]
0x537319: movzx r8d, di
0x53731d: lea rdx, [rsp + 0x70]
0x537322: mov rcx, rbx
0x537325: call 0x140538330
0x53732a: nop 
0x53732b: mov qword ptr [rsp + 0x30], rbp
0x537330: mov qword ptr [rsp + 0x30], r14
0x537335: mov eax, dword ptr [rsp + 0x70]
0x537339: mov rcx, qword ptr [rip + 0x67c45e8]
0x537340: test eax, eax
0x537342: je 0x140537349
0x537344: mov rax, rcx
0x537347: jmp 0x140537351
0x537349: mov rax, qword ptr [rbx + 0x58]
0x53734d: mov rax, qword ptr [rsi + rax]
0x537351: test rax, rax
0x537354: je 0x14053735f
0x537356: jmp 0x140537362
0x537358: mov rcx, qword ptr [rip + 0x67c45c9]
0x53735f: mov rax, rcx
0x537362: mov rbx, qword ptr [rsp + 0x78]
0x537367: mov rbp, qword ptr [rsp + 0x80]
0x53736f: add rsp, 0x50
0x537373: pop r14
0x537375: pop rdi
0x537376: pop rsi
0x537377: ret 
CALLEE 0x4a2630
0x4a2630: mov qword ptr [rsp + 0x10], rbx
0x4a2635: mov qword ptr [rsp + 0x18], rbp
0x4a263a: push rsi
0x4a263b: push rdi
0x4a263c: push r14
0x4a263e: sub rsp, 0x50
0x4a2642: mov edi, dword ptr [rcx]
0x4a2644: mov rbx, qword ptr [rip + 0x68cbded]
0x4a264b: cmp edi, dword ptr [rbx + 8]
0x4a264e: jae 0x1404a2736
0x4a2654: lea rsi, [rdi*8]
0x4a265c: mov rax, qword ptr [rbx + 0x58]
0x4a2660: mov rax, qword ptr [rsi + rax]
0x4a2664: test rax, rax
0x4a2667: jne 0x1404a2740
0x4a266d: lea r14, [rbx + 0x90]
0x4a2674: cmp qword ptr [r14], rax
0x4a2677: jne 0x1404a269e
0x4a2679: mov qword ptr [rsp + 0x20], r14
0x4a267e: xor r9d, r9d
0x4a2681: lea r8, [rip + 0x5313f18]
0x4a2688: mov rdx, qword ptr [rbx + 0x10]
0x4a268c: lea rcx, [rsp + 0x70]
0x4a2691: call 0x1425c5230
0x4a2696: mov eax, dword ptr [rsp + 0x70]
0x4a269a: test eax, eax
0x4a269c: jne 0x1404a2717
0x4a269e: call 0x141416af0
0x4a26a3: add rax, 0x7d0
0x4a26a9: mov qword ptr [rbx + 0x98], rax
0x4a26b0: mov rcx, qword ptr [r14]
0x4a26b3: mov rdx, qword ptr [rbx + 0x28]
0x4a26b7: lea r14, [rip + 0x527f602]
0x4a26be: mov qword ptr [rsp + 0x30], r14
0x4a26c3: mov byte ptr [rsp + 0x38], 0
0x4a26c8: lea rbp, [rip + 0x527f591]
0x4a26cf: mov qword ptr [rsp + 0x30], rbp
0x4a26d4: mov rax, qword ptr [rcx]
0x4a26d7: mov qword ptr [rsp + 0x40], rax
0x4a26dc: mov eax, dword ptr [rcx + 0xc]
0x4a26df: mov dword ptr [rsp + 0x48], eax
0x4a26e3: mov dword ptr [rsp + 0x4c], 0
0x4a26eb: mov eax, dword ptr [rdx + rsi + 4]
0x4a26ef: mov dword ptr [rsp + 0x4c], eax
0x4a26f3: lea r9, [rsp + 0x30]
0x4a26f8: mov r8d, edi
0x4a26fb: lea rdx, [rsp + 0x70]
0x4a2700: mov rcx, rbx
0x4a2703: call 0x1404a6440
0x4a2708: nop 
0x4a2709: mov qword ptr [rsp + 0x30], rbp
0x4a270e: mov qword ptr [rsp + 0x30], r14
0x4a2713: mov eax, dword ptr [rsp + 0x70]
0x4a2717: mov rcx, qword ptr [rip + 0x683b9ea]
0x4a271e: test eax, eax
0x4a2720: je 0x1404a2727
0x4a2722: mov rax, rcx
0x4a2725: jmp 0x1404a272f
0x4a2727: mov rax, qword ptr [rbx + 0x58]
0x4a272b: mov rax, qword ptr [rsi + rax]
0x4a272f: test rax, rax
0x4a2732: je 0x1404a273d
0x4a2734: jmp 0x1404a2740
0x4a2736: mov rcx, qword ptr [rip + 0x683b9cb]
0x4a273d: mov rax, rcx
0x4a2740: mov rbx, qword ptr [rsp + 0x78]
0x4a2745: mov rbp, qword ptr [rsp + 0x80]
0x4a274d: add rsp, 0x50
0x4a2751: pop r14
0x4a2753: pop rdi
0x4a2754: pop rsi
0x4a2755: ret 
CALLEE 0x66a0a0
0x66a0a0: mov qword ptr [rsp + 0x10], rbx
0x66a0a5: mov qword ptr [rsp + 0x18], rsi
0x66a0aa: mov qword ptr [rsp + 0x20], rdi
0x66a0af: mov qword ptr [rsp + 8], rcx
0x66a0b4: push rbp
0x66a0b5: push r14
0x66a0b7: push r15
0x66a0b9: lea rbp, [rsp - 0x47]
0x66a0be: sub rsp, 0x90
0x66a0c5: xor r14d, r14d
0x66a0c8: mov dword ptr [rbp - 0x29], r14d
0x66a0cc: lea rdx, [rbp - 0x11]
0x66a0d0: mov rcx, qword ptr [rip + 0x66ff0b9]
0x66a0d7: mov rcx, qword ptr [rcx + 0x30]
0x66a0db: call 0x1408b44e0
0x66a0e0: nop 
0x66a0e1: lea r15, [rip + 0x50bbd60]
0x66a0e8: cmp byte ptr [rbp - 1], r14b
0x66a0ec: jne 0x14066a0f6
0x66a0ee: xor dil, dil
0x66a0f1: jmp 0x14066a1b0
0x66a0f6: lea rdx, [rbp + 0xf]
0x66a0fa: mov rcx, qword ptr [rbp - 9]
0x66a0fe: call 0x1417fa6c0
0x66a103: nop 
0x66a104: cmp byte ptr [rbp + 0x1f], 0
0x66a108: jne 0x14066a10f
0x66a10a: xor dil, dil
0x66a10d: jmp 0x14066a178
0x66a10f: mov rcx, qword ptr [rbp + 0x17]
0x66a113: mov rax, qword ptr [rcx]
0x66a116: call qword ptr [rax + 0x48]
0x66a119: mov rbx, rax
0x66a11c: lea rdx, [rax + 8]
0x66a120: test rax, rax
0x66a123: cmove rdx, r14
0x66a127: mov rdx, qword ptr [rdx]
0x66a12a: lea rcx, [rbp - 0x21]
0x66a12e: call 0x140393df0
0x66a133: nop 
0x66a134: mov qword ptr [rbp - 0x19], rbx
0x66a138: mov esi, 4
0x66a13d: mov dword ptr [rbp - 0x29], esi
0x66a140: lea rdx, [rbp + 0x67]
0x66a144: mov rcx, rbx
0x66a147: call 0x141f6ffa0
0x66a14c: nop 
0x66a14d: cmp qword ptr [rbp + 0x67], 0
0x66a152: jne 0x14066a159
0x66a154: xor dil, dil
0x66a157: jmp 0x14066a15c
0x66a159: mov dil, 1
0x66a15c: lea rcx, [rbp + 0x67]
0x66a160: call 0x14038ad90
0x66a165: and esi, 0xfffffffb
0x66a168: mov dword ptr [rbp - 0x29], esi
0x66a16b: mov rcx, qword ptr [rbp - 0x21]
0x66a16f: mov rax, qword ptr [rcx]
0x66a172: mov dl, 1
0x66a174: call qword ptr [rax + 0x20]
0x66a177: nop 
0x66a178: lea rax, [rip + 0x52a8ce1]
0x66a17f: mov qword ptr [rbp + 0xf], rax
0x66a183: cmp byte ptr [rbp + 0x1f], 0
0x66a187: je 0x14066a197
0x66a189: mov rcx, qword ptr [rbp + 0x37]
0x66a18d: mov rax, qword ptr [rcx]
0x66a190: call qword ptr [rax + 0x148]
0x66a196: nop 
0x66a197: lea rax, [rip + 0x4f096a2]
0x66a19e: mov qword ptr [rbp + 0xf], rax
0x66a1a2: mov qword ptr [rbp + 0xf], r15
0x66a1a6: lea rcx, [rbp + 0xf]
0x66a1aa: call 0x141434880
0x66a1af: nop 
0x66a1b0: mov qword ptr [rbp - 0x11], r15
0x66a1b4: cmp byte ptr [rbp - 1], 0
0x66a1b8: je 0x14066a22e
0x66a1ba: cmp byte ptr [rbp], 0
0x66a1be: jne 0x14066a1cf
0x66a1c0: mov rcx, qword ptr [rbp - 9]
0x66a1c4: mov rax, qword ptr [rcx]
0x66a1c7: call qword ptr [rax + 8]
0x66a1ca: movzx esi, al
0x66a1cd: jmp 0x14066a20d
0x66a1cf: mov rsi, qword ptr [rbp - 9]
0x66a1d3: lea rbx, [rsi + 0x18]
0x66a1d7: mov qword ptr [rbp + 0x67], rbx
0x66a1db: mov rax, qword ptr [rbx]
0x66a1de: mov rcx, rbx
0x66a1e1: call qword ptr [rax + 8]
0x66a1e4: nop 
0x66a1e5: dec word ptr [rsi + 0x48]
0x66a1e9: cmp byte ptr [rsi + 0x4a], 0
0x66a1ed: jne 0x14066a201
0x66a1ef: lock xadd dword ptr [rsi + 0x10], r14d
0x66a1f5: add r14w, word ptr [rsi + 0x48]
0x66a1fa: jne 0x14066a201
0x66a1fc: mov sil, 1
0x66a1ff: jmp 0x14066a204
0x66a201: xor sil, sil
0x66a204: mov rax, qword ptr [rbx]
0x66a207: mov rcx, rbx
0x66a20a: call qword ptr [rax + 0x10]
0x66a20d: test sil, sil
0x66a210: je 0x14066a22a
0x66a212: mov rcx, qword ptr [rbp - 9]
0x66a216: mov edx, 1
0x66a21b: xor eax, eax
0x66a21d: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x66a222: jne 0x14066a22a
0x66a224: mov rdx, qword ptr [rcx]
0x66a227: call qword ptr [rdx + 0x10]
0x66a22a: mov byte ptr [rbp - 1], 0
0x66a22e: movzx eax, dil
0x66a232: lea r11, [rsp + 0x90]
0x66a23a: mov rbx, qword ptr [r11 + 0x28]
0x66a23e: mov rsi, qword ptr [r11 + 0x30]
0x66a242: mov rdi, qword ptr [r11 + 0x38]
0x66a246: mov rsp, r11
0x66a249: pop r15
0x66a24b: pop r14
0x66a24d: pop rbp
0x66a24e: ret 
CALLEE 0x656450
0x656450: mov qword ptr [rsp + 0x20], rbx
0x656455: mov qword ptr [rsp + 0x18], r8
0x65645a: mov qword ptr [rsp + 0x10], rdx
0x65645f: mov qword ptr [rsp + 8], rcx
0x656464: push rbp
0x656465: push rsi
0x656466: push rdi
0x656467: push r12
0x656469: push r13
0x65646b: push r14
0x65646d: push r15
0x65646f: lea rbp, [rsp - 0x670]
0x656477: sub rsp, 0x770
0x65647e: mov rbx, r9
0x656481: mov r14, r8
0x656484: xor r15d, r15d
0x656487: mov dword ptr [rsp + 0x20], r15d
0x65648c: lea rax, [rip + 0x50cf9b5]
0x656493: mov qword ptr [rbp - 0x58], rax
0x656497: mov qword ptr [rbp - 0x50], r15
0x65649b: mov word ptr [rbp - 0x48], r15w
0x6564a0: mov qword ptr [rbp - 0x40], r15
0x6564a4: lea r12, [rip + 0x4f1d5dd]
0x6564ab: mov qword ptr [rbp - 0x58], r12
0x6564af: lea r13, [rip + 0x4f1d592]
0x6564b6: mov qword ptr [rbp - 0x58], r13
0x6564ba: mov rax, qword ptr [rip + 0x6712ccf]
0x6564c1: mov rcx, qword ptr [rax + 0x30]
0x6564c5: mov rdi, qword ptr [rcx + 0x50]
0x6564c9: test rdi, rdi
0x6564cc: je 0x1406564ee
0x6564ce: mov edx, 4
0x6564d3: mov r8d, 0x10
0x6564d9: mov rax, qword ptr [rdi]
0x6564dc: mov rcx, rdi
0x6564df: call qword ptr [rax + 0xc0]
0x6564e5: test al, al
0x6564e7: je 0x1406564ee
0x6564e9: mov sil, 1
0x6564ec: jmp 0x1406564f1
0x6564ee: xor sil, sil
0x6564f1: lea rax, [rip + 0x50cf950]
0x6564f8: mov qword ptr [rsp + 0x30], rax
0x6564fd: mov qword ptr [rsp + 0x38], rdi
0x656502: mov byte ptr [rsp + 0x40], sil
0x656507: mov byte ptr [rsp + 0x41], 0
0x65650c: mov qword ptr [rsp + 0x48], r15
0x656511: mov qword ptr [rsp + 0x30], r12
0x656516: mov qword ptr [rsp + 0x30], r13
0x65651b: mov dword ptr [rsp + 0x20], 2
0x656523: mov rax, qword ptr [rbp - 0x58]
0x656527: mov rdx, qword ptr [rax + 0x10]
0x65652b: lea rax, [rip + 0xdde33e]
0x656532: lea rcx, [rbp - 0x58]
0x656536: cmp rdx, rax
0x656539: jne 0x140656542
0x65653b: call 0x141434880
0x656540: jmp 0x140656544
0x656542: call rdx
0x656544: mov qword ptr [rbp - 0x40], r15
0x656548: mov qword ptr [rbp - 0x50], rdi
0x65654c: mov byte ptr [rbp - 0x48], sil
0x656550: mov qword ptr [rsp + 0x38], r15
0x656555: mov byte ptr [rsp + 0x40], 0
0x65655a: mov eax, 2
0x65655f: and eax, 0xfffffffd
0x656562: mov dword ptr [rsp + 0x50], eax
0x656566: mov dword ptr [rsp + 0x20], eax
0x65656a: lea rax, [rip + 0x50cf8d7]
0x656571: mov qword ptr [rsp + 0x30], rax
0x656576: cmp byte ptr [rbp - 0x48], 0
0x65657a: jne 0x140656584
0x65657c: xor dil, dil
0x65657f: jmp 0x1406570db
0x656584: mov rsi, qword ptr [rbp - 0x50]
0x656588: mov qword ptr [rbp - 0x18], rsi
0x65658c: mov qword ptr [rbp - 0x78], rax
0x656590: mov qword ptr [rbp - 0x70], r15
0x656594: mov word ptr [rbp - 0x68], 0
0x65659a: mov qword ptr [rbp - 0x60], r15
0x65659e: mov qword ptr [rbp - 0x78], r12
0x6565a2: mov qword ptr [rbp - 0x78], r13
0x6565a6: test r14, r14
0x6565a9: jne 0x140656636
0x6565af: lea rdx, [rsp + 0x30]
0x6565b4: mov rcx, qword ptr [rip + 0x6712bd5]
0x6565bb: mov rcx, qword ptr [rcx + 0x30]
0x6565bf: call 0x1408b4570
0x6565c4: mov rdi, rax
0x6565c7: mov rcx, qword ptr [rbp - 0x78]
0x6565cb: mov rax, qword ptr [rcx + 0x10]
0x6565cf: lea rcx, [rip + 0xdde29a]
0x6565d6: cmp rax, rcx
0x6565d9: lea rcx, [rbp - 0x78]
0x6565dd: jne 0x1406565e6
0x6565df: call 0x141434880
0x6565e4: jmp 0x1406565e8
0x6565e6: call rax
0x6565e8: mov rax, qword ptr [rdi + 0x18]
0x6565ec: mov qword ptr [rbp - 0x60], rax
0x6565f0: mov rax, qword ptr [rdi + 8]
0x6565f4: mov qword ptr [rbp - 0x70], rax
0x6565f8: movzx eax, byte ptr [rdi + 0x10]
0x6565fc: mov byte ptr [rbp - 0x68], al
0x6565ff: mov qword ptr [rdi + 8], r15
0x656603: mov byte ptr [rdi + 0x10], 0
0x656607: lea rax, [rip + 0x50cf83a]
0x65660e: mov qword ptr [rsp + 0x30], rax
0x656613: lea rcx, [rsp + 0x30]
0x656618: call 0x141434880
0x65661d: cmp byte ptr [rbp - 0x68], 0
0x656621: jne 0x14065662b
0x656623: xor dil, dil
0x656626: jmp 0x1406570c0
0x65662b: mov r14, qword ptr [rbp - 0x70]
0x65662f: mov qword ptr [rbp + 0x6c0], r14
0x656636: lea rdx, [rbp]
0x65663a: mov rcx, r14
0x65663d: call 0x1417fa6c0
0x656642: nop 
0x656643: cmp byte ptr [rbp + 0x10], 0
0x656647: jne 0x140656651
0x656649: xor dil, dil
0x65664c: jmp 0x140657081
0x656651: mov qword ptr [rsp + 0x30], r15
0x656656: mov qword ptr [rsp + 0x38], r15
0x65665b: mov dword ptr [rsp + 0x40], r15d
0x656660: mov byte ptr [rsp + 0x44], 0
0x656665: mov eax, 0xc
0x65666a: mov word ptr [rsp + 0x46], ax
0x65666f: mov qword ptr [rsp + 0x48], r15
0x656674: mov rcx, qword ptr [rsi + 0x68]
0x656678: lea rdx, [rsp + 0x30]
0x65667d: mov rcx, qword ptr [rcx + 0x1a0]
0x656684: call 0x1421a1da0
0x656689: mov eax, dword ptr [rsp + 0x30]
0x65668d: lea rcx, [rax + rax*2]
0x656691: mov eax, dword ptr [rsp + 0x34]
0x656695: lea rcx, [rax + rcx*8]
0x656699: imul rdx, rcx, 0x3c
0x65669d: mov eax, dword ptr [rsp + 0x38]
0x6566a1: add rdx, rax
0x6566a4: imul rcx, rdx, 0x3c
0x6566a8: mov eax, dword ptr [rsp + 0x3c]
0x6566ac: add rcx, rax
0x6566af: mov qword ptr [rbp - 0x28], rcx
0x6566b3: mov qword ptr [rbp - 0x20], rcx
0x6566b7: mov rcx, rbx
0x6566ba: call 0x140430280
0x6566bf: mov esi, 0xffff
0x6566c4: cmp word ptr [rax + 0x1d0], si
0x6566cb: je 0x1406566dc
0x6566cd: mov rcx, rbx
0x6566d0: call 0x140430280
0x6566d5: lea rbx, [rax + 0x1d0]
0x6566dc: movzx eax, word ptr [rbx]
0x6566df: mov word ptr [rbp + 0x6b8], ax
0x6566e6: lea rcx, [rsp + 0x78]
0x6566eb: mov qword ptr [rsp + 0x68], rcx
0x6566f0: mov dword ptr [rsp + 0x70], r15d
0x6566f5: mov dword ptr [rsp + 0x74], 8
0x6566fd: mov edx, dword ptr [rsp + 0x70]
0x656701: mov rcx, qword ptr [rsp + 0x68]
0x656706: mov word ptr [rcx + rdx*2], ax
0x65670a: inc dword ptr [rsp + 0x70]
0x65670e: lea rcx, [rbp + 0x6b8]
0x656715: call 0x140430280
0x65671a: cmp dword ptr [rax + 0x1e0], 0
0x656721: je 0x140656782
0x656723: lea rcx, [rbp + 0x6b8]
0x65672a: call 0x140430280
0x65672f: mov rdi, qword ptr [rax + 0x1d8]
0x656736: mov ebx, dword ptr [rax + 0x1e0]
0x65673c: mov eax, dword ptr [rsp + 0x74]
0x656740: mov ecx, dword ptr [rsp + 0x70]
0x656744: sub eax, ecx
0x656746: cmp ebx, eax
0x656748: jbe 0x140656767
0x65674a: lea r8d, [rcx + rbx]
0x65674e: mov r9d, 2
0x656754: lea rdx, [rsp + 0x78]
0x656759: lea rcx, [rsp + 0x68]
0x65675e: call 0x140392380
0x656763: mov ecx, dword ptr [rsp + 0x70]
0x656767: mov r8, rbx
0x65676a: add r8, r8
0x65676d: mov rax, qword ptr [rsp + 0x68]
0x656772: lea rcx, [rax + rcx*2]
0x656776: mov rdx, rdi
0x656779: call 0x144898e1e
0x65677e: add dword ptr [rsp + 0x70], ebx
0x656782: mov rcx, qword ptr [rbp + 8]
0x656786: mov rax, qword ptr [rcx]
0x656789: call qword ptr [rax + 0x40]
0x65678c: mov rcx, rax
0x65678f: mov qword ptr [rbp - 0x38], rax
0x656793: xor dil, dil
0x656796: mov byte ptr [rbp + 0x6b8], dil
0x65679d: mov qword ptr [rbp + 0x4d8], r15
0x6567a4: mov qword ptr [rbp + 0x4e0], 0x105
0x6567af: mov dword ptr [rbp + 0x4e4], r15d
0x6567b6: mov byte ptr [rbp + 0x3d0], dil
0x6567bd: mov dword ptr [rbp + 0x4e4], r15d
0x6567c4: mov byte ptr [rbp + 0x3d0], dil
0x6567cb: mov rax, qword ptr [rbp + 0x4d8]
0x6567d2: test rax, rax
0x6567d5: je 0x1406567da
0x6567d7: mov byte ptr [rax], dil
0x6567da: lea r12, [rbp + 0x3d0]
0x6567e1: cmp qword ptr [rbp + 0x6d0], 0
0x6567e9: cmove r12, r15
0x6567ed: mov r13, qword ptr [rsp + 0x68]
0x6567f2: mov qword ptr [rsp + 0x60], r13
0x6567f7: mov eax, dword ptr [rsp + 0x70]
0x6567fb: lea rax, [rax*2]
0x656803: add rax, r13
0x656806: mov qword ptr [rbp - 0x10], rax
0x65680a: cmp r13, rax
0x65680d: je 0x140656eae
0x656813: lea r15, [rcx + 8]
0x656817: test rcx, rcx
0x65681a: mov eax, 0
0x65681f: cmove r15, rax
0x656823: mov qword ptr [rbp - 8], r15
0x656827: test r12, r12
0x65682a: je 0x140656849
0x65682c: mov dword ptr [r12 + 0x114], eax
0x656834: mov byte ptr [r12], 0
0x656839: mov rax, qword ptr [r12 + 0x108]
0x656841: test rax, rax
0x656844: je 0x140656849
0x656846: mov byte ptr [rax], 0
0x656849: mov dil, 4
0x65684c: mov dword ptr [rsp + 0x24], 0xffffffff
0x656854: mov ebx, 0xffffffff
0x656859: mov dword ptr [rsp + 0x54], ebx
0x65685d: mov word ptr [rbp + 0x6b0], si
0x656864: mov rcx, r13
0x656867: call 0x140430280
0x65686c: mov r14, rax
0x65686f: lea rsi, [rax + 0x48]
0x656873: cmp dword ptr [rsi + 8], 0
0x656877: jne 0x1406568a5
0x656879: lea rcx, [rax + 0x188]
0x656880: mov eax, 0xffff
0x656885: cmp word ptr [rcx], ax
0x656888: je 0x140656895
0x65688a: call 0x140430280
0x65688f: cmp dword ptr [rax + 0x50], 0
0x656893: jne 0x1406568a5
0x656895: lea rcx, [r14 + 0x14]
0x656899: call 0x1405c15a0
0x65689e: lea rsi, [rax + 0x90]
0x6568a5: mov rdx, qword ptr [r15]
0x6568a8: lea rcx, [rbp - 0x30]
0x6568ac: call 0x140393df0
0x6568b1: nop 
0x6568b2: movzx edx, word ptr [r13]
0x6568b7: mov r14, qword ptr [rbp - 0x38]
0x6568bb: mov rcx, r14
0x6568be: call 0x141abf910
0x6568c3: mov r15, rax
0x6568c6: mov qword ptr [rsp + 0x28], rax
0x6568cb: lea r9, [rbp + 0x6b0]
0x6568d2: lea r8, [rsp + 0x24]
0x6568d7: movzx edx, word ptr [r13]
0x6568dc: mov rcx, r14
0x6568df: call 0x141ac0110
0x6568e4: cmp dword ptr [rsp + 0x24], -1
0x6568e9: setne r13b
0x6568ed: je 0x140656914
0x6568ef: mov r8, qword ptr [rsp + 0x60]
0x6568f4: lea rdx, [rbp + 0x30]
0x6568f8: mov rcx, r14
0x6568fb: call 0x141ac02a0
0x656900: vmovups ymm0, ymmword ptr [rax]
0x656904: vmovups ymmword ptr [rbp + 0x30], ymm0
0x656909: vpextrd dword ptr [rsp + 0x54], xmm0, 1
0x656911: mov ebx, dword ptr [rbp + 0x30]
0x656914: mov rcx, qword ptr [rsp + 0x60]
0x656919: vzeroupper 
0x65691c: call 0x140430280
0x656921: cmp dword ptr [r14 + 0x6c], 0
0x656926: je 0x140656974
0x656928: mov r10d, dword ptr [rax]
0x65692b: mov ecx, dword ptr [r14 + 0x68]
0x65692f: test ecx, ecx
0x656931: je 0x140656974
0x656933: xor edx, edx
0x656935: mov eax, r10d
0x656938: div ecx
0x65693a: mov r8d, edx
0x65693d: shl r8, 8
0x656941: add r8, qword ptr [r14 + 0x78]
0x656945: xor edx, edx
0x656947: mov r11d, dword ptr [r8]
0x65694a: test r11d, r11d
0x65694d: je 0x140656974
0x65694f: nop 
0x656950: cmp dword ptr [r8 + rdx*8 + 8], r10d
0x656955: jne 0x14065696d
0x656957: mov ecx, dword ptr [r8 + rdx*8 + 0xc]
0x65695c: mov rax, qword ptr [r14 + 0x80]
0x656963: mov r9, qword ptr [rax + rcx*8]
0x656967: cmp dword ptr [r9 + 4], r10d
0x65696b: je 0x1406569bb
0x65696d: inc edx
0x65696f: cmp edx, r11d
0x656972: jb 0x140656950
0x656974: mov r14d, 0xffffffff
0x65697a: mov dword ptr [rsp + 0x58], r14d
0x65697f: mov rcx, qword ptr [rbp - 0x30]
0x656983: mov rax, qword ptr [rcx]
0x656986: mov dl, 1
0x656988: call qword ptr [rax + 0x20]
0x65698b: test r15, r15
0x65698e: je 0x1406569ca
0x656990: cmp r15, qword ptr [rbp - 0x28]
0x656994: jbe 0x1406569ca
0x656996: mov rbx, qword ptr [rbp + 0x6d0]
0x65699d: test rbx, rbx
0x6569a0: je 0x1406569b3
0x6569a2: mov r9, r12
0x6569a5: lea r8, [rbp - 0x20]
0x6569a9: lea rdx, [rsp + 0x28]
0x6569ae: call 0x140657cf0
0x6569b3: mov dil, 3
0x6569b6: jmp 0x140657017
0x6569bb: add r9, 8
0x6569bf: je 0x140656974
0x6569c1: mov r14d, dword ptr [r9 + 0xa4]
0x6569c8: jmp 0x14065697a
0x6569ca: mov edx, dword ptr [rsi + 8]
0x6569cd: xor r15d, r15d
0x6569d0: test edx, edx
0x6569d2: je 0x140656bd5
0x6569d8: mov rax, qword ptr [rbp + 0x6c0]
0x6569df: mov rax, qword ptr [rax + 0x68]
0x6569e3: mov r8, qword ptr [rax + 0x20]
0x6569e7: mov ecx, r15d
0x6569ea: movzx r8d, word ptr [r8 + 0x30]
0x6569ef: mov r9, qword ptr [rsi]
0x6569f2: mov eax, ecx
0x6569f4: cmp r8w, word ptr [r9 + rax*2]
0x6569f9: je 0x140656bd5
0x6569ff: inc ecx
0x656a01: cmp ecx, edx
0x656a03: jb 0x1406569f2
0x656a05: mov rbx, qword ptr [rbp + 0x6d0]
0x656a0c: test rbx, rbx
0x656a0f: je 0x140656bcd
0x656a15: mov qword ptr [rbp + 0x158], r15
0x656a1c: mov qword ptr [rbp + 0x160], 0x105
0x656a27: mov dword ptr [rbp + 0x164], r15d
0x656a2e: mov byte ptr [rbp + 0x50], 0
0x656a32: mov dword ptr [rbp + 0x164], r15d
0x656a39: mov byte ptr [rbp + 0x50], 0
0x656a3d: mov rax, qword ptr [rbp + 0x158]
0x656a44: test rax, rax
0x656a47: je 0x140656a4c
0x656a49: mov byte ptr [rax], 0
0x656a4c: mov rbx, qword ptr [rsi]
0x656a4f: mov eax, dword ptr [rsi + 8]
0x656a52: lea rdi, [rbx + rax*2]
0x656a56: cmp rbx, rdi
0x656a59: je 0x140656b1a
0x656a5f: nop 
0x656a60: movzx eax, word ptr [rbx]
0x656a63: mov word ptr [rbp + 0x6b0], ax
0x656a6a: mov eax, dword ptr [rbp + 0x164]
0x656a70: cmp eax, -1
0x656a73: jne 0x140656a9f
0x656a75: lea rcx, [rbp + 0x50]
0x656a79: mov rax, qword ptr [rbp + 0x158]
0x656a80: test rax, rax
0x656a83: cmovne rcx, rax
0x656a87: mov rax, 0xffffffffffffffff
0x656a8e: nop 
0x656a90: inc rax
0x656a93: cmp byte ptr [rcx + rax], 0
0x656a97: jne 0x140656a90
0x656a99: mov dword ptr [rbp + 0x164], eax
0x656a9f: test eax, eax
0x656aa1: je 0x140656ab9
0x656aa3: mov r8d, 2
0x656aa9: lea rdx, [rip + 0x4f2bb90]
0x656ab0: lea rcx, [rbp + 0x50]
0x656ab4: call 0x140393f50
0x656ab9: lea rcx, [rbp + 0x6b0]
0x656ac0: call 0x140389570
0x656ac5: mov rcx, qword ptr [rax + 0x18]
0x656ac9: mov rax, qword ptr [rcx]
0x656acc: xor edx, edx
0x656ace: call qword ptr [rax + 8]
0x656ad1: mov qword ptr [rbp + 0x6b0], rax
0x656ad8: mov dword ptr [rbp + 0x164], 0xffffffff
0x656ae2: lea rcx, [rbp + 0x50]
0x656ae6: mov rax, qword ptr [rbp + 0x158]
0x656aed: test rax, rax
0x656af0: cmovne rcx, rax
0x656af4: lea r9, [rbp + 0x6b0]
0x656afb: lea r8, [rip + 0x4f2048e]
0x656b02: mov edx, dword ptr [rbp + 0x160]
0x656b08: call 0x14035ee40
0x656b0d: add rbx, 2
0x656b11: cmp rbx, rdi
0x656b14: jne 0x140656a60
0x656b1a: lea rcx, [rbp + 0x50]
0x656b1e: mov rax, qword ptr [rbp + 0x158]
0x656b25: test rax, rax
0x656b28: cmovne rcx, rax
0x656b2c: mov qword ptr [rsp + 0x28], rcx
0x656b31: mov rax, qword ptr gs:[0x58]
0x656b3a: mov rcx, qword ptr [rax]
0x656b3d: mov eax, 0x1ec
0x656b42: mov rdx, qword ptr [rip + 0x67129df]
0x656b49: cmp byte ptr [rax + rcx], 0
0x656b4d: cmovne rdx, qword ptr [rip + 0x67129db]
0x656b55: mov rax, qword ptr [rdx]
0x656b58: mov rcx, qword ptr [rax + 8]
0x656b5c: mov rax, qword ptr [rcx + 0x1c0]
0x656b63: movzx ecx, word ptr [rax + 0xa8]
0x656b6a: mov word ptr [rbp + 0x6b0], cx
0x656b71: lea rcx, [rbp + 0x6b0]
0x656b78: call 0x140389080
0x656b7d: mov rcx, qword ptr [rax + 0x18]
0x656b81: mov rax, qword ptr [rcx]
0x656b84: xor edx, edx
0x656b86: call qword ptr [rax + 8]
0x656b89: mov dword ptr [r12 + 0x114], 0xffffffff
0x656b95: mov r8, qword ptr [r12 + 0x108]
0x656b9d: mov rcx, r12
0x656ba0: test r8, r8
0x656ba3: cmovne rcx, r8
0x656ba7: lea r9, [rsp + 0x28]
0x656bac: mov r8, rax
0x656baf: mov edx, dword ptr [r12 + 0x110]
0x656bb7: call 0x14035ee40
0x656bbc: nop 
0x656bbd: lea rcx, [rbp + 0x50]
0x656bc1: call 0x140394170
0x656bc6: mov rbx, qword ptr [rbp + 0x6d0]
0x656bcd: mov dil, 2
0x656bd0: jmp 0x140657017
0x656bd5: cmp r14d, -1
0x656bd9: je 0x140656bf0
0x656bdb: mov r8, r12
0x656bde: lea rdx, [rsp + 0x58]
0x656be3: call 0x1406572d0
0x656be8: movzx edi, al
0x656beb: jmp 0x140656e7c
0x656bf0: test r13b, r13b
0x656bf3: je 0x140656e86
0x656bf9: mov r13d, 0xffff
0x656bff: cmp r13w, word ptr [rbp + 0x6b0]
0x656c07: je 0x140656e4f
0x656c0d: mov r14, qword ptr [rbp - 0x18]
0x656c11: lea rdx, [r14 + 8]
0x656c15: test r14, r14
0x656c18: cmove rdx, r15
0x656c1c: mov rdx, qword ptr [rdx]
0x656c1f: lea rcx, [rsp + 0x30]
0x656c24: call 0x140393df0
0x656c29: nop 
0x656c2a: mov qword ptr [rsp + 0x38], r14
0x656c2f: mov esi, dword ptr [rsp + 0x50]
0x656c33: or esi, 4
0x656c36: mov dword ptr [rsp + 0x20], esi
0x656c3a: lea rcx, [rbp + 0x6b0]
0x656c41: call 0x140389570
0x656c46: mov rcx, qword ptr [r14 + 0x68]
0x656c4a: mov edx, dword ptr [rax]
0x656c4c: mov rcx, qword ptr [rcx + 0x110]
0x656c53: call 0x14214e7a0
0x656c58: mov rdx, rax
0x656c5b: lea rcx, [rbp + 0x4f0]
0x656c62: call 0x142155d70
0x656c67: nop 
0x656c68: and esi, 0xfffffffb
0x656c6b: mov dword ptr [rsp + 0x50], esi
0x656c6f: mov dword ptr [rsp + 0x20], esi
0x656c73: mov rcx, qword ptr [rsp + 0x30]
0x656c78: mov rax, qword ptr [rcx]
0x656c7b: mov dl, 1
0x656c7d: call qword ptr [rax + 0x20]
0x656c80: mov rcx, qword ptr [r14 + 0x68]
0x656c84: mov rdx, qword ptr [rbp + 0x518]
0x656c8b: mov rcx, qword ptr [rcx + 0x110]
0x656c92: call 0x14214d130
0x656c97: cmp al, 3
0x656c99: jne 0x140656e3d
0x656c9f: cmp qword ptr [rbp + 0x6d0], 0
0x656ca7: je 0x140656e3a
0x656cad: mov qword ptr [rbp + 0x298], r15
0x656cb4: mov qword ptr [rbp + 0x2a0], 0x105
0x656cbf: mov dword ptr [rbp + 0x2a4], r15d
0x656cc6: mov byte ptr [rbp + 0x190], 0
0x656ccd: mov dword ptr [rbp + 0x2a4], r15d
0x656cd4: mov byte ptr [rbp + 0x190], 0
0x656cdb: mov rax, qword ptr [rbp + 0x298]
0x656ce2: test rax, rax
0x656ce5: je 0x140656cea
0x656ce7: mov byte ptr [rax], 0
0x656cea: movzx eax, word ptr [rbp + 0x568]
0x656cf1: mov word ptr [rbp + 0x6b0], ax
0x656cf8: lea rcx, [rip + 0x4f3a001]
0x656cff: mov qword ptr [rsp + 0x58], rcx
0x656d04: cmp ax, r13w
0x656d08: je 0x140656d52
0x656d0a: lea rcx, [rbp + 0x6b0]
0x656d11: call 0x140430020
0x656d16: lea rcx, [rax + 0x12]
0x656d1a: call 0x140433650
0x656d1f: lea rdx, [rbp + 0x170]
0x656d26: mov rcx, qword ptr [rax + 0x88]
0x656d2d: call 0x142424250
0x656d32: nop 
0x656d33: mov rcx, qword ptr [rax]
0x656d36: mov rax, qword ptr [rcx]
0x656d39: xor edx, edx
0x656d3b: call qword ptr [rax + 8]
0x656d3e: mov rdi, rax
0x656d41: lea rcx, [rbp + 0x188]
0x656d48: call 0x140394db0
0x656d4d: mov qword ptr [rsp + 0x58], rdi
0x656d52: mov dword ptr [rbp + 0x2a4], 0xffffffff
0x656d5c: lea rcx, [rbp + 0x190]
0x656d63: mov rax, qword ptr [rbp + 0x298]
0x656d6a: test rax, rax
0x656d6d: cmovne rcx, rax
0x656d71: lea r9, [rsp + 0x58]
0x656d76: lea r8, [rip + 0x4f20213]
0x656d7d: mov edx, dword ptr [rbp + 0x2a0]
0x656d83: call 0x14035ee40
0x656d88: lea rcx, [rbp + 0x190]
0x656d8f: mov rax, qword ptr [rbp + 0x298]
0x656d96: test rax, rax
0x656d99: cmovne rcx, rax
0x656d9d: mov qword ptr [rsp + 0x28], rcx
0x656da2: mov rax, qword ptr gs:[0x58]
0x656dab: mov rcx, qword ptr [rax]
0x656dae: mov eax, 0x1ec
0x656db3: mov rdx, qword ptr [rip + 0x671276e]
0x656dba: cmp byte ptr [rax + rcx], 0
0x656dbe: cmovne rdx, qword ptr [rip + 0x671276a]
0x656dc6: mov rax, qword ptr [rdx]
0x656dc9: mov rcx, qword ptr [rax + 8]
0x656dcd: mov rax, qword ptr [rcx + 0x1c0]
0x656dd4: movzx ecx, word ptr [rax + 0xac]
0x656ddb: mov word ptr [rbp + 0x6b0], cx
0x656de2: lea rcx, [rbp + 0x6b0]
0x656de9: call 0x140389080
0x656dee: mov rcx, qword ptr [rax + 0x18]
0x656df2: mov rax, qword ptr [rcx]
0x656df5: xor edx, edx
0x656df7: call qword ptr [rax + 8]
0x656dfa: mov dword ptr [r12 + 0x114], 0xffffffff
0x656e06: mov r8, qword ptr [r12 + 0x108]
0x656e0e: mov rcx, r12
0x656e11: test r8, r8
0x656e14: cmovne rcx, r8
0x656e18: lea r9, [rsp + 0x28]
0x656e1d: mov r8, rax
0x656e20: mov edx, dword ptr [r12 + 0x110]
0x656e28: call 0x14035ee40
0x656e2d: nop 
0x656e2e: lea rcx, [rbp + 0x190]
0x656e35: call 0x140394170
0x656e3a: mov dil, 2
0x656e3d: lea rcx, [rbp + 0x4f0]
0x656e44: call 0x1421562b0
0x656e49: cmp dil, 2
0x656e4d: je 0x140656e7c
0x656e4f: mov r8, r12
0x656e52: lea rdx, [rsp + 0x24]
0x656e57: call 0x1406572d0
0x656e5c: cmp al, 4
0x656e5e: je 0x140656e65
0x656e60: movzx edi, al
0x656e63: jmp 0x140656e7c
0x656e65: cmp ebx, -1
0x656e68: setne cl
0x656e6b: jne 0x140656efe
0x656e71: cmp dword ptr [rsp + 0x54], -1
0x656e76: jne 0x140656efe
0x656e7c: cmp dil, 4
0x656e80: jne 0x140657010
0x656e86: mov rax, qword ptr [rbp + 0x6d0]
0x656e8d: test rax, rax
0x656e90: je 0x140656eab
0x656e92: mov dword ptr [rax + 0x114], r15d
0x656e99: mov byte ptr [rax], 0
0x656e9c: mov rax, qword ptr [rax + 0x108]
0x656ea3: test rax, rax
0x656ea6: je 0x140656eab
0x656ea8: mov byte ptr [rax], 0
0x656eab: mov dil, 4
0x656eae: lea rcx, [rbp + 0x3d0]
0x656eb5: call 0x140394170
0x656eba: nop 
0x656ebb: lea rax, [rsp + 0x78]
0x656ec0: mov rcx, qword ptr [rsp + 0x68]
0x656ec5: cmp rcx, rax
0x656ec8: je 0x140657081
0x656ece: test rcx, rcx
0x656ed1: je 0x140657081
0x656ed7: mov r8d, 0x1fd
0x656edd: mov rax, qword ptr gs:[0x58]
0x656ee6: mov rdx, qword ptr [rax]
0x656ee9: cmp byte ptr [r8 + rdx], 0
0x656eee: je 0x14065707b
0x656ef4: call 0x1447f03bc
0x656ef9: jmp 0x140657081
0x656efe: cmp qword ptr [rbp + 0x6d0], 0
0x656f06: je 0x14065700d
0x656f0c: mov qword ptr [rbp + 0x3b8], r15
0x656f13: mov qword ptr [rbp + 0x3c0], 0x105
0x656f1e: mov dword ptr [rbp + 0x3c4], r15d
0x656f25: mov byte ptr [rbp + 0x2b0], 0
0x656f2c: mov dword ptr [rbp + 0x3c4], r15d
0x656f33: mov byte ptr [rbp + 0x2b0], 0
0x656f3a: mov rax, qword ptr [rbp + 0x3b8]
0x656f41: test rax, rax
0x656f44: je 0x140656f49
0x656f46: mov byte ptr [rax], 0
0x656f49: test cl, cl
0x656f4b: je 0x140656f5b
0x656f4d: lea r8, [rbp + 0x2b0]
0x656f54: mov edx, ebx
0x656f56: call 0x140657110
0x656f5b: lea rcx, [rbp + 0x2b0]
0x656f62: mov rax, qword ptr [rbp + 0x3b8]
0x656f69: test rax, rax
0x656f6c: cmovne rcx, rax
0x656f70: mov qword ptr [rsp + 0x28], rcx
0x656f75: mov rax, qword ptr gs:[0x58]
0x656f7e: mov rcx, qword ptr [rax]
0x656f81: mov eax, 0x1ec
0x656f86: mov rdx, qword ptr [rip + 0x671259b]
0x656f8d: cmp byte ptr [rax + rcx], 0
0x656f91: cmovne rdx, qword ptr [rip + 0x6712597]
0x656f99: mov rax, qword ptr [rdx]
0x656f9c: mov rcx, qword ptr [rax + 8]
0x656fa0: mov rax, qword ptr [rcx + 0x1c0]
0x656fa7: movzx ecx, word ptr [rax + 0xae]
0x656fae: mov word ptr [rbp + 0x6b0], cx
0x656fb5: lea rcx, [rbp + 0x6b0]
0x656fbc: call 0x140389080
0x656fc1: mov rcx, qword ptr [rax + 0x18]
0x656fc5: mov rax, qword ptr [rcx]
0x656fc8: xor edx, edx
0x656fca: call qword ptr [rax + 8]
0x656fcd: mov dword ptr [r12 + 0x114], 0xffffffff
0x656fd9: mov r8, qword ptr [r12 + 0x108]
0x656fe1: mov rcx, r12
0x656fe4: test r8, r8
0x656fe7: cmovne rcx, r8
0x656feb: lea r9, [rsp + 0x28]
0x656ff0: mov r8, rax
0x656ff3: mov edx, dword ptr [r12 + 0x110]
0x656ffb: call 0x14035ee40
0x657000: nop 
0x657001: lea rcx, [rbp + 0x2b0]
0x657008: call 0x140394170
0x65700d: mov dil, 1
0x657010: mov rbx, qword ptr [rbp + 0x6d0]
0x657017: cmp byte ptr [rbp + 0x6b8], dil
0x65701e: jae 0x140657049
0x657020: mov byte ptr [rbp + 0x6b8], dil
0x657027: test rbx, rbx
0x65702a: je 0x140657050
0x65702c: lea rax, [rbp + 0x3d0]
0x657033: cmp rbx, rax
0x657036: je 0x140657050
0x657038: lea rdx, [rbp + 0x3d0]
0x65703f: mov rcx, rbx
0x657042: call 0x14044d550
0x657047: jmp 0x140657050
0x657049: movzx edi, byte ptr [rbp + 0x6b8]
0x657050: mov r13, qword ptr [rsp + 0x60]
0x657055: add r13, 2
0x657059: mov qword ptr [rsp + 0x60], r13
0x65705e: cmp r13, qword ptr [rbp - 0x10]
0x657062: mov r15, qword ptr [rbp - 8]
0x657066: mov eax, 0
0x65706b: mov esi, 0xffff
0x657070: jne 0x140656827
0x657076: jmp 0x140656eae
0x65707b: call 0x1447f02bc
0x657080: nop 
0x657081: lea rax, [rip + 0x52bbdd8]
0x657088: mov qword ptr [rbp], rax
0x65708c: cmp byte ptr [rbp + 0x10], 0
0x657090: je 0x1406570a0
0x657092: mov rcx, qword ptr [rbp + 0x28]
0x657096: mov rax, qword ptr [rcx]
0x657099: call qword ptr [rax + 0x148]
0x65709f: nop 
0x6570a0: lea rax, [rip + 0x4f1c799]
0x6570a7: mov qword ptr [rbp], rax
0x6570ab: lea rax, [rip + 0x50ced96]
0x6570b2: mov qword ptr [rbp], rax
0x6570b6: lea rcx, [rbp]
0x6570ba: call 0x141434880
0x6570bf: nop 
0x6570c0: lea rax, [rip + 0x50ced81]
0x6570c7: mov qword ptr [rbp - 0x78], rax
0x6570cb: lea rcx, [rbp - 0x78]
0x6570cf: call 0x141434880
0x6570d4: lea rax, [rip + 0x50ced6d]
0x6570db: mov qword ptr [rbp - 0x58], rax
0x6570df: lea rcx, [rbp - 0x58]
0x6570e3: call 0x141434880
0x6570e8: movzx eax, dil
0x6570ec: mov rbx, qword ptr [rsp + 0x7c8]
0x6570f4: add rsp, 0x770
0x6570fb: pop r15
0x6570fd: pop r14
0x6570ff: pop r13
0x657101: pop r12
0x657103: pop rdi
0x657104: pop rsi
0x657105: pop rbp
0x657106: ret 
CALLEE 0x430280
0x430280: mov qword ptr [rsp + 0x10], rbx
0x430285: mov qword ptr [rsp + 0x18], rbp
0x43028a: push rsi
0x43028b: push rdi
0x43028c: push r14
0x43028e: sub rsp, 0x50
0x430292: movzx edi, word ptr [rcx]
0x430295: mov rbx, qword ptr [rip + 0x693bbdc]
0x43029c: cmp edi, dword ptr [rbx + 8]
0x43029f: jae 0x140430388
0x4302a5: lea rsi, [rdi*8]
0x4302ad: mov rax, qword ptr [rbx + 0x58]
0x4302b1: mov rax, qword ptr [rsi + rax]
0x4302b5: test rax, rax
0x4302b8: jne 0x140430392
0x4302be: lea r14, [rbx + 0x90]
0x4302c5: cmp qword ptr [r14], rax
0x4302c8: jne 0x1404302ef
0x4302ca: mov qword ptr [rsp + 0x20], r14
0x4302cf: xor r9d, r9d
0x4302d2: lea r8, [rip + 0x51448a7]
0x4302d9: mov rdx, qword ptr [rbx + 0x10]
0x4302dd: lea rcx, [rsp + 0x70]
0x4302e2: call 0x1425c5230
0x4302e7: mov eax, dword ptr [rsp + 0x70]
0x4302eb: test eax, eax
0x4302ed: jne 0x140430369
0x4302ef: call 0x141416af0
0x4302f4: add rax, 0x7d0
0x4302fa: mov qword ptr [rbx + 0x98], rax
0x430301: mov rcx, qword ptr [r14]
0x430304: mov rdx, qword ptr [rbx + 0x28]
0x430308: lea r14, [rip + 0x52f19b1]
0x43030f: mov qword ptr [rsp + 0x30], r14
0x430314: mov byte ptr [rsp + 0x38], 0
0x430319: lea rbp, [rip + 0x52f1940]
0x430320: mov qword ptr [rsp + 0x30], rbp
0x430325: mov rax, qword ptr [rcx]
0x430328: mov qword ptr [rsp + 0x40], rax
0x43032d: mov eax, dword ptr [rcx + 0xc]
0x430330: mov dword ptr [rsp + 0x48], eax
0x430334: mov dword ptr [rsp + 0x4c], 0
0x43033c: mov eax, dword ptr [rdx + rsi + 4]
0x430340: mov dword ptr [rsp + 0x4c], eax
0x430344: lea r9, [rsp + 0x30]
0x430349: movzx r8d, di
0x43034d: lea rdx, [rsp + 0x70]
0x430352: mov rcx, rbx
0x430355: call 0x1404344e0
0x43035a: nop 
0x43035b: mov qword ptr [rsp + 0x30], rbp
0x430360: mov qword ptr [rsp + 0x30], r14
0x430365: mov eax, dword ptr [rsp + 0x70]
0x430369: mov rcx, qword ptr [rip + 0x68ae080]
0x430370: test eax, eax
0x430372: je 0x140430379
0x430374: mov rax, rcx
0x430377: jmp 0x140430381
0x430379: mov rax, qword ptr [rbx + 0x58]
0x43037d: mov rax, qword ptr [rsi + rax]
0x430381: test rax, rax
0x430384: je 0x14043038f
0x430386: jmp 0x140430392
0x430388: mov rcx, qword ptr [rip + 0x68ae061]
0x43038f: mov rax, rcx
0x430392: mov rbx, qword ptr [rsp + 0x78]
0x430397: mov rbp, qword ptr [rsp + 0x80]
0x43039f: add rsp, 0x50
0x4303a3: pop r14
0x4303a5: pop rdi
0x4303a6: pop rsi
0x4303a7: ret 
CALLEE 0x6572d0
0x6572d0: mov qword ptr [rsp + 0x18], r8
0x6572d5: mov qword ptr [rsp + 0x10], rdx
0x6572da: mov qword ptr [rsp + 8], rcx
0x6572df: push rbp
0x6572e0: push rbx
0x6572e1: push rsi
0x6572e2: push rdi
0x6572e3: push r12
0x6572e5: push r13
0x6572e7: push r14
0x6572e9: push r15
0x6572eb: lea rbp, [rsp - 0x118]
0x6572f3: sub rsp, 0x218
0x6572fa: mov r13, r8
0x6572fd: mov r12, rdx
0x657300: xor r15d, r15d
0x657303: mov dword ptr [rsp + 0x30], r15d
0x657308: lea rdx, [rbp - 0x38]
0x65730c: mov rcx, qword ptr [rip + 0x6711e7d]
0x657313: mov rcx, qword ptr [rcx + 0x30]
0x657317: call 0x1408b44e0
0x65731c: nop 
0x65731d: lea rdi, [rip + 0x50ceb24]
0x657324: cmp byte ptr [rbp - 0x28], r15b
0x657328: jne 0x140657331
0x65732a: xor bl, bl
0x65732c: jmp 0x140657cc0
0x657331: lea rdx, [rbp - 0x58]
0x657335: mov rcx, qword ptr [rip + 0x6711e54]
0x65733c: mov rcx, qword ptr [rcx + 0x30]
0x657340: call 0x1408b4570
0x657345: nop 
0x657346: cmp byte ptr [rbp - 0x48], 0
0x65734a: jne 0x140657353
0x65734c: xor bl, bl
0x65734e: jmp 0x140657cb2
0x657353: lea rdx, [rsp + 0x78]
0x657358: mov rcx, qword ptr [rbp - 0x50]
0x65735c: call 0x1417fa6c0
0x657361: nop 
0x657362: cmp byte ptr [rbp - 0x78], 0
0x657366: je 0x140657c6d
0x65736c: mov qword ptr [rsp + 0x38], r15
0x657371: mov qword ptr [rsp + 0x40], r15
0x657376: mov dword ptr [rsp + 0x48], r15d
0x65737b: mov byte ptr [rsp + 0x4c], 0
0x657380: mov eax, 0xc
0x657385: mov word ptr [rsp + 0x4e], ax
0x65738a: mov qword ptr [rsp + 0x50], r15
0x65738f: mov rax, qword ptr [rbp - 0x30]
0x657393: mov rcx, qword ptr [rax + 0x68]
0x657397: lea rdx, [rsp + 0x38]
0x65739c: mov rcx, qword ptr [rcx + 0x1a0]
0x6573a3: call 0x1421a1da0
0x6573a8: mov eax, dword ptr [rsp + 0x38]
0x6573ac: lea rcx, [rax + rax*2]
0x6573b0: mov eax, dword ptr [rsp + 0x3c]
0x6573b4: lea rcx, [rax + rcx*8]
0x6573b8: imul rdx, rcx, 0x3c
0x6573bc: mov eax, dword ptr [rsp + 0x40]
0x6573c0: add rdx, rax
0x6573c3: imul rcx, rdx, 0x3c
0x6573c7: mov eax, dword ptr [rsp + 0x44]
0x6573cb: add rcx, rax
0x6573ce: mov qword ptr [rsp + 0x60], rcx
0x6573d3: mov qword ptr [rsp + 0x58], rcx
0x6573d8: mov ebx, 0xffffffff
0x6573dd: mov edi, 0xffff
0x6573e2: mov byte ptr [rbp + 0x160], 0
0x6573e9: mov byte ptr [rbp + 0x178], 0
0x6573f0: mov rcx, qword ptr [rbp - 0x80]
0x6573f4: mov rax, qword ptr [rcx]
0x6573f7: call qword ptr [rax + 0x40]
0x6573fa: mov rsi, rax
0x6573fd: lea rdx, [rax + 8]
0x657401: test rax, rax
0x657404: cmove rdx, r15
0x657408: mov rdx, qword ptr [rdx]
0x65740b: lea rcx, [rsp + 0x38]
0x657410: call 0x140393df0
0x657415: nop 
0x657416: mov edx, dword ptr [r12]
0x65741a: mov rcx, rsi
0x65741d: call 0x141ac10f0
0x657422: mov byte ptr [rsp + 0x20], al
0x657426: mov edx, dword ptr [r12]
0x65742a: mov rcx, rsi
0x65742d: call 0x141ac11f0
0x657432: mov qword ptr [rsp + 0x68], rax
0x657437: mov eax, dword ptr [r12]
0x65743b: mov dword ptr [rsp + 0x28], eax
0x65743f: lea rcx, [rsp + 0x28]
0x657444: call 0x140473f20
0x657449: cmp dword ptr [rax + 0x280], ebx
0x65744f: je 0x1406574d3
0x657455: lea rcx, [rsp + 0x28]
0x65745a: call 0x140473f20
0x65745f: cmp dword ptr [rsi + 0x4c], 0
0x657463: je 0x1406574d3
0x657465: mov r8d, dword ptr [rax]
0x657468: mov ecx, dword ptr [rsi + 0x48]
0x65746b: test ecx, ecx
0x65746d: je 0x1406574d3
0x65746f: xor edx, edx
0x657471: mov eax, r8d
0x657474: div ecx
0x657476: mov r10d, edx
0x657479: shl r10, 8
0x65747d: add r10, qword ptr [rsi + 0x58]
0x657481: mov edx, r15d
0x657484: mov r11d, dword ptr [r10]
0x657487: test r11d, r11d
0x65748a: je 0x1406574d3
0x65748c: nop dword ptr [rax]
0x657490: mov eax, edx
0x657492: cmp dword ptr [r10 + rax*8 + 8], r8d
0x657497: jne 0x1406574ac
0x657499: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x65749e: mov rax, qword ptr [rsi + 0x60]
0x6574a2: mov r9, qword ptr [rax + rcx*8]
0x6574a6: cmp dword ptr [r9 + 4], r8d
0x6574aa: je 0x1406574b5
0x6574ac: inc edx
0x6574ae: cmp edx, r11d
0x6574b1: jb 0x140657490
0x6574b3: jmp 0x1406574d3
0x6574b5: lea r14, [r9 + 8]
0x6574b9: test r14, r14
0x6574bc: je 0x1406574d3
0x6574be: lea rcx, [rsp + 0x28]
0x6574c3: call 0x140473f20
0x6574c8: mov r15d, dword ptr [rax + 0x280]
0x6574cf: add r15, qword ptr [r14 + 0x38]
0x6574d3: mov rcx, rsi
0x6574d6: mov eax, 0x48
0x6574db: lea r14, [rax + rcx]
0x6574df: mov qword ptr [rsp + 0x70], r15
0x6574e4: mov eax, dword ptr [r12]
0x6574e8: mov dword ptr [rsp + 0x28], eax
0x6574ec: lea rcx, [rsp + 0x28]
0x6574f1: call 0x140473f20
0x6574f6: cmp dword ptr [r14 + 4], 0
0x6574fb: je 0x14065754c
0x6574fd: mov r8d, dword ptr [rax]
0x657500: mov ecx, dword ptr [r14]
0x657503: test ecx, ecx
0x657505: je 0x14065754c
0x657507: xor edx, edx
0x657509: mov eax, r8d
0x65750c: div ecx
0x65750e: mov r10d, edx
0x657511: shl r10, 8
0x657515: add r10, qword ptr [rsi + 0x58]
0x657519: xor ecx, ecx
0x65751b: mov edx, ecx
0x65751d: mov r11d, dword ptr [r10]
0x657520: test r11d, r11d
0x657523: je 0x14065754c
0x657525: mov eax, edx
0x657527: cmp dword ptr [r10 + rax*8 + 8], r8d
0x65752c: jne 0x140657545
0x65752e: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x657533: mov rax, qword ptr [rsi + 0x60]
0x657537: mov r9, qword ptr [rax + rcx*8]
0x65753b: cmp dword ptr [r9 + 4], r8d
0x65753f: je 0x140657608
0x657545: inc edx
0x657547: cmp edx, r11d
0x65754a: jb 0x140657525
0x65754c: xor r12b, r12b
0x65754f: mov rcx, qword ptr [rsp + 0x38]
0x657554: mov rax, qword ptr [rcx]
0x657557: mov dl, 1
0x657559: call qword ptr [rax + 0x20]
0x65755c: mov rcx, qword ptr [rbp - 0x80]
0x657560: mov rax, qword ptr [rcx]
0x657563: call qword ptr [rax + 0x48]
0x657566: mov r14, rax
0x657569: lea rdx, [rax + 8]
0x65756d: test rax, rax
0x657570: mov eax, 0
0x657575: cmove rdx, rax
0x657579: mov rdx, qword ptr [rdx]
0x65757c: lea rcx, [rsp + 0x38]
0x657581: call 0x140393df0
0x657586: nop 
0x657587: mov qword ptr [rsp + 0x40], r14
0x65758c: mov dword ptr [rsp + 0x30], 4
0x657594: mov rcx, qword ptr [rbp + 0x168]
0x65759b: call 0x140473f20
0x6575a0: cmp dword ptr [r14 + 0x74], 0
0x6575a5: je 0x14065764f
0x6575ab: mov r9d, dword ptr [rax]
0x6575ae: mov ecx, dword ptr [r14 + 0x70]
0x6575b2: test ecx, ecx
0x6575b4: je 0x14065764f
0x6575ba: xor edx, edx
0x6575bc: mov eax, r9d
0x6575bf: div ecx
0x6575c1: mov r10d, edx
0x6575c4: shl r10, 8
0x6575c8: add r10, qword ptr [r14 + 0x80]
0x6575cf: xor eax, eax
0x6575d1: mov edx, eax
0x6575d3: mov r11d, dword ptr [r10]
0x6575d6: test r11d, r11d
0x6575d9: je 0x14065764f
0x6575db: nop dword ptr [rax + rax]
0x6575e0: mov eax, edx
0x6575e2: cmp dword ptr [r10 + rax*8 + 8], r9d
0x6575e7: jne 0x1406575ff
0x6575e9: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x6575ee: mov rax, qword ptr [r14 + 0x88]
0x6575f5: mov r8, qword ptr [rax + rcx*8]
0x6575f9: cmp dword ptr [r8 + 4], r9d
0x6575fd: je 0x14065761c
0x6575ff: inc edx
0x657601: cmp edx, r11d
0x657604: jb 0x1406575e0
0x657606: jmp 0x14065764f
0x657608: add r9, 8
0x65760c: je 0x14065754c
0x657612: movzx r12d, byte ptr [r9 + 0x2c]
0x657617: jmp 0x14065754f
0x65761c: add r8, 8
0x657620: je 0x14065764f
0x657622: mov ebx, dword ptr [r8 + 0x1c]
0x657626: movzx edi, word ptr [r8 + 0x20]
0x65762b: movzx eax, byte ptr [r8 + 0x18]
0x657630: cmp al, 3
0x657632: je 0x14065763f
0x657634: cmp al, 7
0x657636: mov byte ptr [rbp + 0x160], 0
0x65763d: jne 0x140657646
0x65763f: mov byte ptr [rbp + 0x160], 1
0x657646: cmp al, 6
0x657648: sete byte ptr [rbp + 0x178]
0x65764f: mov eax, 4
0x657654: and eax, 0xfffffffb
0x657657: mov dword ptr [rsp + 0x30], eax
0x65765b: mov rcx, qword ptr [rsp + 0x38]
0x657660: mov rax, qword ptr [rcx]
0x657663: mov dl, 1
0x657665: call qword ptr [rax + 0x20]
0x657668: mov rax, qword ptr gs:[0x58]
0x657671: mov rdx, qword ptr [rax]
0x657674: mov eax, 0x1ec
0x657679: mov rcx, qword ptr [rip + 0x6711ea8]
0x657680: cmp byte ptr [rax + rdx], 0
0x657684: cmovne rcx, qword ptr [rip + 0x6711ea4]
0x65768c: mov rax, qword ptr [rcx]
0x65768f: mov rcx, qword ptr [rax + 8]
0x657693: mov r14, qword ptr [rcx + 0x1c0]
0x65769a: movzx ecx, r12b
0x65769e: test r12b, r12b
0x6576a1: je 0x140657c2e
0x6576a7: sub ecx, 1
0x6576aa: je 0x140657c2e
0x6576b0: sub ecx, 2
0x6576b3: je 0x140657c6d
0x6576b9: cmp ecx, 1
0x6576bc: je 0x140657c6d
0x6576c2: cmp byte ptr [rsp + 0x20], 0
0x6576c7: jne 0x140657c6d
0x6576cd: cmp ebx, -1
0x6576d0: je 0x1406577bd
0x6576d6: test r13, r13
0x6576d9: je 0x1406577b6
0x6576df: xor eax, eax
0x6576e1: mov qword ptr [rbp + 0xf8], rax
0x6576e8: mov qword ptr [rbp + 0x100], 0x105
0x6576f3: mov dword ptr [rbp + 0x104], eax
0x6576f9: mov byte ptr [rbp - 0x10], al
0x6576fc: mov dword ptr [rbp + 0x104], eax
0x657702: mov byte ptr [rbp - 0x10], al
0x657705: mov rax, qword ptr [rbp + 0xf8]
0x65770c: test rax, rax
0x65770f: je 0x140657714
0x657711: mov byte ptr [rax], 0
0x657714: lea r8, [rbp - 0x10]
0x657718: mov edx, ebx
0x65771a: call 0x140657110
0x65771f: mov eax, 0xffff
0x657724: lea rcx, [rbp - 0x10]
0x657728: cmp di, ax
0x65772b: mov rax, qword ptr [rbp + 0xf8]
0x657732: je 0x140657745
0x657734: test rax, rax
0x657737: cmovne rcx, rax
0x65773b: movzx eax, word ptr [r14 + 0xaa]
0x657743: jmp 0x140657754
0x657745: test rax, rax
0x657748: cmovne rcx, rax
0x65774c: movzx eax, word ptr [r14 + 0xae]
0x657754: mov qword ptr [rbp + 0x178], rcx
0x65775b: mov word ptr [rbp + 0x160], ax
0x657762: lea rcx, [rbp + 0x160]
0x657769: call 0x140389080
0x65776e: mov rcx, qword ptr [rax + 0x18]
0x657772: mov rax, qword ptr [rcx]
0x657775: xor edx, edx
0x657777: call qword ptr [rax + 8]
0x65777a: mov r8, rax
0x65777d: mov rax, qword ptr [r13 + 0x108]
0x657784: mov edx, dword ptr [r13 + 0x110]
0x65778b: mov dword ptr [r13 + 0x114], 0xffffffff
0x657796: test rax, rax
0x657799: cmovne r13, rax
0x65779d: lea r9, [rbp + 0x178]
0x6577a4: mov rcx, r13
0x6577a7: call 0x14035ee40
0x6577ac: nop 
0x6577ad: lea rcx, [rbp - 0x10]
0x6577b1: call 0x140394170
0x6577b6: mov bl, 1
0x6577b8: jmp 0x140657c6f
0x6577bd: mov rbx, qword ptr [rbp + 0x168]
0x6577c4: cmp r12b, 5
0x6577c8: jne 0x140657805
0x6577ca: mov rcx, rbx
0x6577cd: call 0x140473f20
0x6577d2: cmp dword ptr [rax + 0x280], -1
0x6577d9: je 0x140657805
0x6577db: test r13, r13
0x6577de: je 0x140657836
0x6577e0: test r15, r15
0x6577e3: je 0x140657836
0x6577e5: cmp r15, qword ptr [rsp + 0x60]
0x6577ea: jbe 0x140657836
0x6577ec: mov r9, r13
0x6577ef: lea r8, [rsp + 0x58]
0x6577f4: lea rdx, [rsp + 0x70]
0x6577f9: call 0x140657cf0
0x6577fe: mov bl, 3
0x657800: jmp 0x140657c6f
0x657805: cmp byte ptr [rbp + 0x178], 0
0x65780c: je 0x14065783d
0x65780e: test r13, r13
0x657811: je 0x140657836
0x657813: mov rax, qword ptr [rsp + 0x68]
0x657818: test rax, rax
0x65781b: je 0x140657836
0x65781d: cmp rax, qword ptr [rsp + 0x60]
0x657822: jbe 0x140657836
0x657824: mov r9, r13
0x657827: lea r8, [rsp + 0x58]
0x65782c: lea rdx, [rsp + 0x68]
0x657831: call 0x140657cf0
0x657836: mov bl, 3
0x657838: jmp 0x140657c6f
0x65783d: cmp byte ptr [rbp + 0x160], 0
0x657844: je 0x140657888
0x657846: test r13, r13
0x657849: je 0x140657c26
0x65784f: movzx eax, word ptr [r14 + 0xc4]
0x657857: mov word ptr [rbp + 0x160], ax
0x65785e: lea rcx, [rbp + 0x160]
0x657865: call 0x140389080
0x65786a: mov rcx, qword ptr [rax + 0x18]
0x65786e: mov rax, qword ptr [rcx]
0x657871: xor edx, edx
0x657873: call qword ptr [rax + 8]
0x657876: mov rdx, rax
0x657879: mov rcx, r13
0x65787c: call 0x140423790
0x657881: mov bl, 2
0x657883: jmp 0x140657c6f
0x657888: lea r8, [rsp + 0x58]
0x65788d: mov edx, dword ptr [rbx]
0x65788f: mov rcx, rsi
0x657892: call 0x141ac0bf0
0x657897: test al, al
0x657899: jne 0x1406578dd
0x65789b: test r13, r13
0x65789e: je 0x140657c26
0x6578a4: movzx eax, word ptr [r14 + 0xa6]
0x6578ac: mov word ptr [rbp + 0x160], ax
0x6578b3: lea rcx, [rbp + 0x160]
0x6578ba: call 0x140389080
0x6578bf: mov rcx, qword ptr [rax + 0x18]
0x6578c3: mov rax, qword ptr [rcx]
0x6578c6: xor edx, edx
0x6578c8: call qword ptr [rax + 8]
0x6578cb: mov rdx, rax
0x6578ce: mov rcx, r13
0x6578d1: call 0x140423790
0x6578d6: mov bl, 2
0x6578d8: jmp 0x140657c6f
0x6578dd: mov rcx, rbx
0x6578e0: call 0x140473f20
0x6578e5: lea rcx, [rax + 0x1b0]
0x6578ec: cmp dword ptr [rcx], -1
0x6578ef: je 0x140657903
0x6578f1: call 0x140473f20
0x6578f6: mov rcx, rax
0x6578f9: call 0x142350790
0x6578fe: mov r8, rax
0x657901: jmp 0x140657924
0x657903: lea r8, [rax + 0x220]
0x65790a: cmp dword ptr [r8 + 8], 0
0x65790f: jne 0x140657924
0x657911: lea rcx, [rax + 0x1ac]
0x657918: call 0x1405c15a0
0x65791d: lea r8, [rax + 0x90]
0x657924: mov r9d, dword ptr [r8 + 8]
0x657928: test r9d, r9d
0x65792b: je 0x140657c2a
0x657931: xor r10d, r10d
0x657934: mov edx, r10d
0x657937: test r9d, r9d
0x65793a: je 0x140657967
0x65793c: mov rax, qword ptr [rbp - 0x50]
0x657940: mov rcx, qword ptr [rax + 0x68]
0x657944: mov rax, qword ptr [rcx + 0x20]
0x657948: movzx ecx, word ptr [rax + 0x30]
0x65794c: mov r10, qword ptr [r8]
0x65794f: nop 
0x657950: mov eax, edx
0x657952: cmp cx, word ptr [r10 + rax*2]
0x657957: je 0x140657c2a
0x65795d: inc edx
0x65795f: cmp edx, r9d
0x657962: jb 0x140657950
0x657964: xor r10d, r10d
0x657967: test r13, r13
0x65796a: je 0x140657c26
0x657970: mov qword ptr [rbp + 0xf8], r10
0x657977: mov qword ptr [rbp + 0x100], 0x105
0x657982: mov dword ptr [rbp + 0x104], r10d
0x657989: mov byte ptr [rbp - 0x10], 0
0x65798d: mov dword ptr [rbp + 0x104], r10d
0x657994: mov byte ptr [rbp - 0x10], 0
0x657998: mov rax, qword ptr [rbp + 0xf8]
0x65799f: test rax, rax
0x6579a2: je 0x1406579a7
0x6579a4: mov byte ptr [rax], 0
0x6579a7: mov r15, qword ptr [r8]
0x6579aa: mov eax, dword ptr [r8 + 8]
0x6579ae: lea rax, [r15 + rax*2]
0x6579b2: mov qword ptr [rbp + 0x160], rax
0x6579b9: cmp r15, rax
0x6579bc: je 0x140657b79
0x6579c2: mov rax, qword ptr gs:[0x58]
0x6579cb: mov r12, qword ptr [rax]
0x6579ce: mov eax, 0x240
0x6579d3: add rax, r12
0x6579d6: mov qword ptr [rbp + 0x178], rax
0x6579dd: mov r13, qword ptr [rbp + 0x160]
0x6579e4: movzx eax, word ptr [r15]
0x6579e8: mov word ptr [rbp + 0x160], ax
0x6579ef: mov eax, dword ptr [rbp + 0x104]
0x6579f5: cmp eax, -1
0x6579f8: jne 0x140657a22
0x6579fa: lea rcx, [rbp - 0x10]
0x6579fe: mov rax, qword ptr [rbp + 0xf8]
0x657a05: test rax, rax
0x657a08: cmovne rcx, rax
0x657a0c: mov rax, 0xffffffffffffffff
0x657a13: inc rax
0x657a16: cmp byte ptr [rcx + rax], 0
0x657a1a: jne 0x140657a13
0x657a1c: mov dword ptr [rbp + 0x104], eax
0x657a22: test eax, eax
0x657a24: je 0x140657a3c
0x657a26: mov r8d, 2
0x657a2c: lea rdx, [rip + 0x4f2ac0d]
0x657a33: lea rcx, [rbp - 0x10]
0x657a37: call 0x140393f50
0x657a3c: lea rcx, [rbp + 0x160]
0x657a43: call 0x140389570
0x657a48: mov rcx, qword ptr [rax + 0x18]
0x657a4c: mov rax, qword ptr [rcx]
0x657a4f: xor edx, edx
0x657a51: call qword ptr [rax + 8]
0x657a54: mov rdi, rax
0x657a57: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a61: mov rcx, qword ptr [rbp + 0xf8]
0x657a68: test rcx, rcx
0x657a6b: setne al
0x657a6e: lea rbx, [rbp - 0x10]
0x657a72: test rcx, rcx
0x657a75: cmovne rbx, rcx
0x657a79: mov r14d, dword ptr [rbp + 0x100]
0x657a80: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a8a: lea rsi, [rbp - 0x10]
0x657a8e: test al, al
0x657a90: cmovne rsi, rcx
0x657a94: mov rax, qword ptr [rbp + 0x178]
0x657a9b: xor ecx, ecx
0x657a9d: mov dword ptr [rax], ecx
0x657a9f: mov edx, 2
0x657aa4: lea rcx, [rbp + 0x160]
0x657aab: call 0x141424650
0x657ab0: nop 
0x657ab1: test rbx, rbx
0x657ab4: je 0x140657ad7
0x657ab6: call 0x1414245b0
0x657abb: cmp dword ptr [rax + 8], 0
0x657abf: ja 0x140657aca
0x657ac1: lea rax, [rip + 0x66825e8]
0x657ac8: jmp 0x140657ad0
0x657aca: mov rax, qword ptr [rax]
0x657acd: mov rax, qword ptr [rax]
0x657ad0: mov qword ptr [rax + 0x808], rbx
0x657ad7: test rdi, rdi
0x657ada: je 0x140657afe
0x657adc: call 0x1414245b0
0x657ae1: cmp dword ptr [rax + 8], 1
0x657ae5: ja 0x140657af0
0x657ae7: lea rax, [rip + 0x66825c2]
0x657aee: jmp 0x140657af7
0x657af0: mov rax, qword ptr [rax]
0x657af3: mov rax, qword ptr [rax + 8]
0x657af7: mov qword ptr [rax + 0x808], rdi
0x657afe: lea r8, [rip + 0x4f391a7]
0x657b05: mov edx, r14d
0x657b08: mov rcx, rsi
0x657b0b: call 0x141424bd0
0x657b10: nop 
0x657b11: call 0x1414245b0
0x657b16: mov rsi, rax
0x657b19: xor r10d, r10d
0x657b1c: mov ebx, r10d
0x657b1f: cmp dword ptr [rax + 8], r10d
0x657b23: jbe 0x140657b61
0x657b25: mov r14d, 0x1fd
0x657b2b: nop dword ptr [rax + rax]
0x657b30: mov ecx, ebx
0x657b32: mov rax, qword ptr [rsi]
0x657b35: lea rdi, [rax + rcx*8]
0x657b39: mov rcx, qword ptr [rdi]
0x657b3c: test rcx, rcx
0x657b3f: je 0x140657b5a
0x657b41: cmp byte ptr [r14 + r12], 0
0x657b46: je 0x140657b4f
0x657b48: call 0x1447f03bc
0x657b4d: jmp 0x140657b54
0x657b4f: call 0x1447f02bc
0x657b54: xor r10d, r10d
0x657b57: mov qword ptr [rdi], r10
0x657b5a: inc ebx
0x657b5c: cmp ebx, dword ptr [rsi + 8]
0x657b5f: jb 0x140657b30
0x657b61: mov dword ptr [rsi + 8], r10d
0x657b65: add r15, 2
0x657b69: cmp r15, r13
0x657b6c: jne 0x1406579e4
0x657b72: mov r13, qword ptr [rbp + 0x170]
0x657b79: lea rcx, [rbp - 0x10]
0x657b7d: mov rax, qword ptr [rbp + 0xf8]
0x657b84: test rax, rax
0x657b87: cmovne rcx, rax
0x657b8b: mov qword ptr [rbp + 0x178], rcx
0x657b92: mov rax, qword ptr gs:[0x58]
0x657b9b: mov rcx, qword ptr [rax]
0x657b9e: mov eax, 0x1ec
0x657ba3: mov rdx, qword ptr [rip + 0x671197e]
0x657baa: cmp byte ptr [rax + rcx], 0
0x657bae: cmovne rdx, qword ptr [rip + 0x671197a]
0x657bb6: mov rax, qword ptr [rdx]
0x657bb9: mov rcx, qword ptr [rax + 8]
0x657bbd: mov rax, qword ptr [rcx + 0x1c0]
0x657bc4: movzx ecx, word ptr [rax + 0xa8]
0x657bcb: mov word ptr [rbp + 0x160], cx
0x657bd2: lea rcx, [rbp + 0x160]
0x657bd9: call 0x140389080
0x657bde: mov rcx, qword ptr [rax + 0x18]
0x657be2: mov rax, qword ptr [rcx]
0x657be5: xor edx, edx
0x657be7: call qword ptr [rax + 8]
0x657bea: mov r8, rax
0x657bed: mov edx, dword ptr [r13 + 0x110]
0x657bf4: mov dword ptr [r13 + 0x114], 0xffffffff
0x657bff: mov rax, qword ptr [r13 + 0x108]
0x657c06: test rax, rax
0x657c09: cmovne r13, rax
0x657c0d: lea r9, [rbp + 0x178]
0x657c14: mov rcx, r13
0x657c17: call 0x14035ee40
0x657c1c: nop 
0x657c1d: lea rcx, [rbp - 0x10]
0x657c21: call 0x140394170
0x657c26: mov bl, 2
0x657c28: jmp 0x140657c6f
0x657c2a: mov bl, 4
0x657c2c: jmp 0x140657c6f
0x657c2e: test r13, r13
0x657c31: je 0x1406577b6
0x657c37: movzx eax, word ptr [r14 + 0xa6]
0x657c3f: mov word ptr [rbp + 0x160], ax
0x657c46: lea rcx, [rbp + 0x160]
0x657c4d: call 0x140389080
0x657c52: mov rcx, qword ptr [rax + 0x18]
0x657c56: mov rax, qword ptr [rcx]
0x657c59: xor edx, edx
0x657c5b: call qword ptr [rax + 8]
0x657c5e: mov rdx, rax
0x657c61: mov rcx, r13
0x657c64: call 0x140423790
0x657c69: mov bl, 1
0x657c6b: jmp 0x140657c6f
0x657c6d: xor bl, bl
0x657c6f: lea rax, [rip + 0x52bb1ea]
0x657c76: mov qword ptr [rsp + 0x78], rax
0x657c7b: cmp byte ptr [rbp - 0x78], 0
0x657c7f: je 0x140657c8f
0x657c81: mov rcx, qword ptr [rbp - 0x60]
0x657c85: mov rax, qword ptr [rcx]
0x657c88: call qword ptr [rax + 0x148]
0x657c8e: nop 
0x657c8f: lea rax, [rip + 0x4f1bbaa]
0x657c96: mov qword ptr [rsp + 0x78], rax
0x657c9b: lea rdi, [rip + 0x50ce1a6]
0x657ca2: mov qword ptr [rsp + 0x78], rdi
0x657ca7: lea rcx, [rsp + 0x78]
0x657cac: call 0x141434880
0x657cb1: nop 
0x657cb2: mov qword ptr [rbp - 0x58], rdi
0x657cb6: lea rcx, [rbp - 0x58]
0x657cba: call 0x141434880
0x657cbf: nop 
0x657cc0: mov qword ptr [rbp - 0x38], rdi
0x657cc4: lea rcx, [rbp - 0x38]
0x657cc8: call 0x141434880
0x657ccd: movzx eax, bl
0x657cd0: add rsp, 0x218
0x657cd7: pop r15
0x657cd9: pop r14
0x657cdb: pop r13
0x657cdd: pop r12
0x657cdf: pop rdi
0x657ce0: pop rsi
0x657ce1: pop rbx
0x657ce2: pop rbp
0x657ce3: ret 
CALLEE 0x3880a0
0x3880a0: mov qword ptr [rsp + 0x10], rbx
0x3880a5: mov qword ptr [rsp + 0x18], rbp
0x3880aa: push rsi
0x3880ab: push rdi
0x3880ac: push r14
0x3880ae: sub rsp, 0x50
0x3880b2: movzx edi, word ptr [rcx]
0x3880b5: mov rbx, qword ptr [rip + 0x69e1a34]
0x3880bc: cmp edi, dword ptr [rbx + 8]
0x3880bf: jae 0x1403881a8
0x3880c5: lea rsi, [rdi*8]
0x3880cd: mov rax, qword ptr [rbx + 0x58]
0x3880d1: mov rax, qword ptr [rsi + rax]
0x3880d5: test rax, rax
0x3880d8: jne 0x1403881b2
0x3880de: lea r14, [rbx + 0x90]
0x3880e5: cmp qword ptr [r14], rax
0x3880e8: jne 0x14038810f
0x3880ea: mov qword ptr [rsp + 0x20], r14
0x3880ef: xor r9d, r9d
0x3880f2: mov r8, qword ptr [rip + 0x57127b7]
0x3880f9: mov rdx, qword ptr [rbx + 0x10]
0x3880fd: lea rcx, [rsp + 0x70]
0x388102: call 0x1425c5230
0x388107: mov eax, dword ptr [rsp + 0x70]
0x38810b: test eax, eax
0x38810d: jne 0x140388189
0x38810f: call 0x141416af0
0x388114: add rax, 0x7d0
0x38811a: mov qword ptr [rbx + 0x98], rax
0x388121: mov rcx, qword ptr [r14]
0x388124: mov rdx, qword ptr [rbx + 0x28]
0x388128: lea r14, [rip + 0x5399b91]
0x38812f: mov qword ptr [rsp + 0x30], r14
0x388134: mov byte ptr [rsp + 0x38], 0
0x388139: lea rbp, [rip + 0x5399b20]
0x388140: mov qword ptr [rsp + 0x30], rbp
0x388145: mov rax, qword ptr [rcx]
0x388148: mov qword ptr [rsp + 0x40], rax
0x38814d: mov eax, dword ptr [rcx + 0xc]
0x388150: mov dword ptr [rsp + 0x48], eax
0x388154: mov dword ptr [rsp + 0x4c], 0
0x38815c: mov eax, dword ptr [rdx + rsi + 4]
0x388160: mov dword ptr [rsp + 0x4c], eax
0x388164: lea r9, [rsp + 0x30]
0x388169: movzx r8d, di
0x38816d: lea rdx, [rsp + 0x70]
0x388172: mov rcx, rbx
0x388175: call 0x14038cf30
0x38817a: nop 
0x38817b: mov qword ptr [rsp + 0x30], rbp
0x388180: mov qword ptr [rsp + 0x30], r14
0x388185: mov eax, dword ptr [rsp + 0x70]
0x388189: mov rcx, qword ptr [rip + 0x6978328]
0x388190: test eax, eax
0x388192: je 0x140388199
0x388194: mov rax, rcx
0x388197: jmp 0x1403881a1
0x388199: mov rax, qword ptr [rbx + 0x58]
0x38819d: mov rax, qword ptr [rsi + rax]
0x3881a1: test rax, rax
0x3881a4: je 0x1403881af
0x3881a6: jmp 0x1403881b2
0x3881a8: mov rcx, qword ptr [rip + 0x6978309]
0x3881af: mov rax, rcx
0x3881b2: mov rbx, qword ptr [rsp + 0x78]
0x3881b7: mov rbp, qword ptr [rsp + 0x80]
0x3881bf: add rsp, 0x50
0x3881c3: pop r14
0x3881c5: pop rdi
0x3881c6: pop rsi
0x3881c7: ret 
CALLEE 0x433650
0x433650: mov qword ptr [rsp + 0x10], rbx
0x433655: mov qword ptr [rsp + 0x18], rbp
0x43365a: push rsi
0x43365b: push rdi
0x43365c: push r14
0x43365e: sub rsp, 0x50
0x433662: movzx edi, word ptr [rcx]
0x433665: mov rbx, qword ptr [rip + 0x693642c]
0x43366c: cmp edi, dword ptr [rbx + 8]
0x43366f: jae 0x140433758
0x433675: lea rsi, [rdi*8]
0x43367d: mov rax, qword ptr [rbx + 0x58]
0x433681: mov rax, qword ptr [rsi + rax]
0x433685: test rax, rax
0x433688: jne 0x140433762
0x43368e: lea r14, [rbx + 0x90]
0x433695: cmp qword ptr [r14], rax
0x433698: jne 0x1404336bf
0x43369a: mov qword ptr [rsp + 0x20], r14
0x43369f: xor r9d, r9d
0x4336a2: lea r8, [rip + 0x558c397]
0x4336a9: mov rdx, qword ptr [rbx + 0x10]
0x4336ad: lea rcx, [rsp + 0x70]
0x4336b2: call 0x1425c5230
0x4336b7: mov eax, dword ptr [rsp + 0x70]
0x4336bb: test eax, eax
0x4336bd: jne 0x140433739
0x4336bf: call 0x141416af0
0x4336c4: add rax, 0x7d0
0x4336ca: mov qword ptr [rbx + 0x98], rax
0x4336d1: mov rcx, qword ptr [r14]
0x4336d4: mov rdx, qword ptr [rbx + 0x28]
0x4336d8: lea r14, [rip + 0x52ee5e1]
0x4336df: mov qword ptr [rsp + 0x30], r14
0x4336e4: mov byte ptr [rsp + 0x38], 0
0x4336e9: lea rbp, [rip + 0x52ee570]
0x4336f0: mov qword ptr [rsp + 0x30], rbp
0x4336f5: mov rax, qword ptr [rcx]
0x4336f8: mov qword ptr [rsp + 0x40], rax
0x4336fd: mov eax, dword ptr [rcx + 0xc]
0x433700: mov dword ptr [rsp + 0x48], eax
0x433704: mov dword ptr [rsp + 0x4c], 0
0x43370c: mov eax, dword ptr [rdx + rsi + 4]
0x433710: mov dword ptr [rsp + 0x4c], eax
0x433714: lea r9, [rsp + 0x30]
0x433719: movzx r8d, di
0x43371d: lea rdx, [rsp + 0x70]
0x433722: mov rcx, rbx
0x433725: call 0x140433b40
0x43372a: nop 
0x43372b: mov qword ptr [rsp + 0x30], rbp
0x433730: mov qword ptr [rsp + 0x30], r14
0x433735: mov eax, dword ptr [rsp + 0x70]
0x433739: mov rcx, qword ptr [rip + 0x68ca790]
0x433740: test eax, eax
0x433742: je 0x140433749
0x433744: mov rax, rcx
0x433747: jmp 0x140433751
0x433749: mov rax, qword ptr [rbx + 0x58]
0x43374d: mov rax, qword ptr [rsi + rax]
0x433751: test rax, rax
0x433754: je 0x14043375f
0x433756: jmp 0x140433762
0x433758: mov rcx, qword ptr [rip + 0x68ca771]
0x43375f: mov rax, rcx
0x433762: mov rbx, qword ptr [rsp + 0x78]
0x433767: mov rbp, qword ptr [rsp + 0x80]
0x43376f: add rsp, 0x50
0x433773: pop r14
0x433775: pop rdi
0x433776: pop rsi
0x433777: ret 
CALLEE 0x433650
0x433650: mov qword ptr [rsp + 0x10], rbx
0x433655: mov qword ptr [rsp + 0x18], rbp
0x43365a: push rsi
0x43365b: push rdi
0x43365c: push r14
0x43365e: sub rsp, 0x50
0x433662: movzx edi, word ptr [rcx]
0x433665: mov rbx, qword ptr [rip + 0x693642c]
0x43366c: cmp edi, dword ptr [rbx + 8]
0x43366f: jae 0x140433758
0x433675: lea rsi, [rdi*8]
0x43367d: mov rax, qword ptr [rbx + 0x58]
0x433681: mov rax, qword ptr [rsi + rax]
0x433685: test rax, rax
0x433688: jne 0x140433762
0x43368e: lea r14, [rbx + 0x90]
0x433695: cmp qword ptr [r14], rax
0x433698: jne 0x1404336bf
0x43369a: mov qword ptr [rsp + 0x20], r14
0x43369f: xor r9d, r9d
0x4336a2: lea r8, [rip + 0x558c397]
0x4336a9: mov rdx, qword ptr [rbx + 0x10]
0x4336ad: lea rcx, [rsp + 0x70]
0x4336b2: call 0x1425c5230
0x4336b7: mov eax, dword ptr [rsp + 0x70]
0x4336bb: test eax, eax
0x4336bd: jne 0x140433739
0x4336bf: call 0x141416af0
0x4336c4: add rax, 0x7d0
0x4336ca: mov qword ptr [rbx + 0x98], rax
0x4336d1: mov rcx, qword ptr [r14]
0x4336d4: mov rdx, qword ptr [rbx + 0x28]
0x4336d8: lea r14, [rip + 0x52ee5e1]
0x4336df: mov qword ptr [rsp + 0x30], r14
0x4336e4: mov byte ptr [rsp + 0x38], 0
0x4336e9: lea rbp, [rip + 0x52ee570]
0x4336f0: mov qword ptr [rsp + 0x30], rbp
0x4336f5: mov rax, qword ptr [rcx]
0x4336f8: mov qword ptr [rsp + 0x40], rax
0x4336fd: mov eax, dword ptr [rcx + 0xc]
0x433700: mov dword ptr [rsp + 0x48], eax
0x433704: mov dword ptr [rsp + 0x4c], 0
0x43370c: mov eax, dword ptr [rdx + rsi + 4]
0x433710: mov dword ptr [rsp + 0x4c], eax
0x433714: lea r9, [rsp + 0x30]
0x433719: movzx r8d, di
0x43371d: lea rdx, [rsp + 0x70]
0x433722: mov rcx, rbx
0x433725: call 0x140433b40
0x43372a: nop 
0x43372b: mov qword ptr [rsp + 0x30], rbp
0x433730: mov qword ptr [rsp + 0x30], r14
0x433735: mov eax, dword ptr [rsp + 0x70]
0x433739: mov rcx, qword ptr [rip + 0x68ca790]
0x433740: test eax, eax
0x433742: je 0x140433749
0x433744: mov rax, rcx
0x433747: jmp 0x140433751
0x433749: mov rax, qword ptr [rbx + 0x58]
0x43374d: mov rax, qword ptr [rsi + rax]
0x433751: test rax, rax
0x433754: je 0x14043375f
0x433756: jmp 0x140433762
0x433758: mov rcx, qword ptr [rip + 0x68ca771]
0x43375f: mov rax, rcx
0x433762: mov rbx, qword ptr [rsp + 0x78]
0x433767: mov rbp, qword ptr [rsp + 0x80]
0x43376f: add rsp, 0x50
0x433773: pop r14
0x433775: pop rdi
0x433776: pop rsi
0x433777: ret 
CALLEE 0x433650
0x433650: mov qword ptr [rsp + 0x10], rbx
0x433655: mov qword ptr [rsp + 0x18], rbp
0x43365a: push rsi
0x43365b: push rdi
0x43365c: push r14
0x43365e: sub rsp, 0x50
0x433662: movzx edi, word ptr [rcx]
0x433665: mov rbx, qword ptr [rip + 0x693642c]
0x43366c: cmp edi, dword ptr [rbx + 8]
0x43366f: jae 0x140433758
0x433675: lea rsi, [rdi*8]
0x43367d: mov rax, qword ptr [rbx + 0x58]
0x433681: mov rax, qword ptr [rsi + rax]
0x433685: test rax, rax
0x433688: jne 0x140433762
0x43368e: lea r14, [rbx + 0x90]
0x433695: cmp qword ptr [r14], rax
0x433698: jne 0x1404336bf
0x43369a: mov qword ptr [rsp + 0x20], r14
0x43369f: xor r9d, r9d
0x4336a2: lea r8, [rip + 0x558c397]
0x4336a9: mov rdx, qword ptr [rbx + 0x10]
0x4336ad: lea rcx, [rsp + 0x70]
0x4336b2: call 0x1425c5230
0x4336b7: mov eax, dword ptr [rsp + 0x70]
0x4336bb: test eax, eax
0x4336bd: jne 0x140433739
0x4336bf: call 0x141416af0
0x4336c4: add rax, 0x7d0
0x4336ca: mov qword ptr [rbx + 0x98], rax
0x4336d1: mov rcx, qword ptr [r14]
0x4336d4: mov rdx, qword ptr [rbx + 0x28]
0x4336d8: lea r14, [rip + 0x52ee5e1]
0x4336df: mov qword ptr [rsp + 0x30], r14
0x4336e4: mov byte ptr [rsp + 0x38], 0
0x4336e9: lea rbp, [rip + 0x52ee570]
0x4336f0: mov qword ptr [rsp + 0x30], rbp
0x4336f5: mov rax, qword ptr [rcx]
0x4336f8: mov qword ptr [rsp + 0x40], rax
0x4336fd: mov eax, dword ptr [rcx + 0xc]
0x433700: mov dword ptr [rsp + 0x48], eax
0x433704: mov dword ptr [rsp + 0x4c], 0
0x43370c: mov eax, dword ptr [rdx + rsi + 4]
0x433710: mov dword ptr [rsp + 0x4c], eax
0x433714: lea r9, [rsp + 0x30]
0x433719: movzx r8d, di
0x43371d: lea rdx, [rsp + 0x70]
0x433722: mov rcx, rbx
0x433725: call 0x140433b40
0x43372a: nop 
0x43372b: mov qword ptr [rsp + 0x30], rbp
0x433730: mov qword ptr [rsp + 0x30], r14
0x433735: mov eax, dword ptr [rsp + 0x70]
0x433739: mov rcx, qword ptr [rip + 0x68ca790]
0x433740: test eax, eax
0x433742: je 0x140433749
0x433744: mov rax, rcx
0x433747: jmp 0x140433751
0x433749: mov rax, qword ptr [rbx + 0x58]
0x43374d: mov rax, qword ptr [rsi + rax]
0x433751: test rax, rax
0x433754: je 0x14043375f
0x433756: jmp 0x140433762
0x433758: mov rcx, qword ptr [rip + 0x68ca771]
0x43375f: mov rax, rcx
0x433762: mov rbx, qword ptr [rsp + 0x78]
0x433767: mov rbp, qword ptr [rsp + 0x80]
0x43376f: add rsp, 0x50
0x433773: pop r14
0x433775: pop rdi
0x433776: pop rsi
0x433777: ret 
CALLEE 0x6572d0
0x6572d0: mov qword ptr [rsp + 0x18], r8
0x6572d5: mov qword ptr [rsp + 0x10], rdx
0x6572da: mov qword ptr [rsp + 8], rcx
0x6572df: push rbp
0x6572e0: push rbx
0x6572e1: push rsi
0x6572e2: push rdi
0x6572e3: push r12
0x6572e5: push r13
0x6572e7: push r14
0x6572e9: push r15
0x6572eb: lea rbp, [rsp - 0x118]
0x6572f3: sub rsp, 0x218
0x6572fa: mov r13, r8
0x6572fd: mov r12, rdx
0x657300: xor r15d, r15d
0x657303: mov dword ptr [rsp + 0x30], r15d
0x657308: lea rdx, [rbp - 0x38]
0x65730c: mov rcx, qword ptr [rip + 0x6711e7d]
0x657313: mov rcx, qword ptr [rcx + 0x30]
0x657317: call 0x1408b44e0
0x65731c: nop 
0x65731d: lea rdi, [rip + 0x50ceb24]
0x657324: cmp byte ptr [rbp - 0x28], r15b
0x657328: jne 0x140657331
0x65732a: xor bl, bl
0x65732c: jmp 0x140657cc0
0x657331: lea rdx, [rbp - 0x58]
0x657335: mov rcx, qword ptr [rip + 0x6711e54]
0x65733c: mov rcx, qword ptr [rcx + 0x30]
0x657340: call 0x1408b4570
0x657345: nop 
0x657346: cmp byte ptr [rbp - 0x48], 0
0x65734a: jne 0x140657353
0x65734c: xor bl, bl
0x65734e: jmp 0x140657cb2
0x657353: lea rdx, [rsp + 0x78]
0x657358: mov rcx, qword ptr [rbp - 0x50]
0x65735c: call 0x1417fa6c0
0x657361: nop 
0x657362: cmp byte ptr [rbp - 0x78], 0
0x657366: je 0x140657c6d
0x65736c: mov qword ptr [rsp + 0x38], r15
0x657371: mov qword ptr [rsp + 0x40], r15
0x657376: mov dword ptr [rsp + 0x48], r15d
0x65737b: mov byte ptr [rsp + 0x4c], 0
0x657380: mov eax, 0xc
0x657385: mov word ptr [rsp + 0x4e], ax
0x65738a: mov qword ptr [rsp + 0x50], r15
0x65738f: mov rax, qword ptr [rbp - 0x30]
0x657393: mov rcx, qword ptr [rax + 0x68]
0x657397: lea rdx, [rsp + 0x38]
0x65739c: mov rcx, qword ptr [rcx + 0x1a0]
0x6573a3: call 0x1421a1da0
0x6573a8: mov eax, dword ptr [rsp + 0x38]
0x6573ac: lea rcx, [rax + rax*2]
0x6573b0: mov eax, dword ptr [rsp + 0x3c]
0x6573b4: lea rcx, [rax + rcx*8]
0x6573b8: imul rdx, rcx, 0x3c
0x6573bc: mov eax, dword ptr [rsp + 0x40]
0x6573c0: add rdx, rax
0x6573c3: imul rcx, rdx, 0x3c
0x6573c7: mov eax, dword ptr [rsp + 0x44]
0x6573cb: add rcx, rax
0x6573ce: mov qword ptr [rsp + 0x60], rcx
0x6573d3: mov qword ptr [rsp + 0x58], rcx
0x6573d8: mov ebx, 0xffffffff
0x6573dd: mov edi, 0xffff
0x6573e2: mov byte ptr [rbp + 0x160], 0
0x6573e9: mov byte ptr [rbp + 0x178], 0
0x6573f0: mov rcx, qword ptr [rbp - 0x80]
0x6573f4: mov rax, qword ptr [rcx]
0x6573f7: call qword ptr [rax + 0x40]
0x6573fa: mov rsi, rax
0x6573fd: lea rdx, [rax + 8]
0x657401: test rax, rax
0x657404: cmove rdx, r15
0x657408: mov rdx, qword ptr [rdx]
0x65740b: lea rcx, [rsp + 0x38]
0x657410: call 0x140393df0
0x657415: nop 
0x657416: mov edx, dword ptr [r12]
0x65741a: mov rcx, rsi
0x65741d: call 0x141ac10f0
0x657422: mov byte ptr [rsp + 0x20], al
0x657426: mov edx, dword ptr [r12]
0x65742a: mov rcx, rsi
0x65742d: call 0x141ac11f0
0x657432: mov qword ptr [rsp + 0x68], rax
0x657437: mov eax, dword ptr [r12]
0x65743b: mov dword ptr [rsp + 0x28], eax
0x65743f: lea rcx, [rsp + 0x28]
0x657444: call 0x140473f20
0x657449: cmp dword ptr [rax + 0x280], ebx
0x65744f: je 0x1406574d3
0x657455: lea rcx, [rsp + 0x28]
0x65745a: call 0x140473f20
0x65745f: cmp dword ptr [rsi + 0x4c], 0
0x657463: je 0x1406574d3
0x657465: mov r8d, dword ptr [rax]
0x657468: mov ecx, dword ptr [rsi + 0x48]
0x65746b: test ecx, ecx
0x65746d: je 0x1406574d3
0x65746f: xor edx, edx
0x657471: mov eax, r8d
0x657474: div ecx
0x657476: mov r10d, edx
0x657479: shl r10, 8
0x65747d: add r10, qword ptr [rsi + 0x58]
0x657481: mov edx, r15d
0x657484: mov r11d, dword ptr [r10]
0x657487: test r11d, r11d
0x65748a: je 0x1406574d3
0x65748c: nop dword ptr [rax]
0x657490: mov eax, edx
0x657492: cmp dword ptr [r10 + rax*8 + 8], r8d
0x657497: jne 0x1406574ac
0x657499: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x65749e: mov rax, qword ptr [rsi + 0x60]
0x6574a2: mov r9, qword ptr [rax + rcx*8]
0x6574a6: cmp dword ptr [r9 + 4], r8d
0x6574aa: je 0x1406574b5
0x6574ac: inc edx
0x6574ae: cmp edx, r11d
0x6574b1: jb 0x140657490
0x6574b3: jmp 0x1406574d3
0x6574b5: lea r14, [r9 + 8]
0x6574b9: test r14, r14
0x6574bc: je 0x1406574d3
0x6574be: lea rcx, [rsp + 0x28]
0x6574c3: call 0x140473f20
0x6574c8: mov r15d, dword ptr [rax + 0x280]
0x6574cf: add r15, qword ptr [r14 + 0x38]
0x6574d3: mov rcx, rsi
0x6574d6: mov eax, 0x48
0x6574db: lea r14, [rax + rcx]
0x6574df: mov qword ptr [rsp + 0x70], r15
0x6574e4: mov eax, dword ptr [r12]
0x6574e8: mov dword ptr [rsp + 0x28], eax
0x6574ec: lea rcx, [rsp + 0x28]
0x6574f1: call 0x140473f20
0x6574f6: cmp dword ptr [r14 + 4], 0
0x6574fb: je 0x14065754c
0x6574fd: mov r8d, dword ptr [rax]
0x657500: mov ecx, dword ptr [r14]
0x657503: test ecx, ecx
0x657505: je 0x14065754c
0x657507: xor edx, edx
0x657509: mov eax, r8d
0x65750c: div ecx
0x65750e: mov r10d, edx
0x657511: shl r10, 8
0x657515: add r10, qword ptr [rsi + 0x58]
0x657519: xor ecx, ecx
0x65751b: mov edx, ecx
0x65751d: mov r11d, dword ptr [r10]
0x657520: test r11d, r11d
0x657523: je 0x14065754c
0x657525: mov eax, edx
0x657527: cmp dword ptr [r10 + rax*8 + 8], r8d
0x65752c: jne 0x140657545
0x65752e: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x657533: mov rax, qword ptr [rsi + 0x60]
0x657537: mov r9, qword ptr [rax + rcx*8]
0x65753b: cmp dword ptr [r9 + 4], r8d
0x65753f: je 0x140657608
0x657545: inc edx
0x657547: cmp edx, r11d
0x65754a: jb 0x140657525
0x65754c: xor r12b, r12b
0x65754f: mov rcx, qword ptr [rsp + 0x38]
0x657554: mov rax, qword ptr [rcx]
0x657557: mov dl, 1
0x657559: call qword ptr [rax + 0x20]
0x65755c: mov rcx, qword ptr [rbp - 0x80]
0x657560: mov rax, qword ptr [rcx]
0x657563: call qword ptr [rax + 0x48]
0x657566: mov r14, rax
0x657569: lea rdx, [rax + 8]
0x65756d: test rax, rax
0x657570: mov eax, 0
0x657575: cmove rdx, rax
0x657579: mov rdx, qword ptr [rdx]
0x65757c: lea rcx, [rsp + 0x38]
0x657581: call 0x140393df0
0x657586: nop 
0x657587: mov qword ptr [rsp + 0x40], r14
0x65758c: mov dword ptr [rsp + 0x30], 4
0x657594: mov rcx, qword ptr [rbp + 0x168]
0x65759b: call 0x140473f20
0x6575a0: cmp dword ptr [r14 + 0x74], 0
0x6575a5: je 0x14065764f
0x6575ab: mov r9d, dword ptr [rax]
0x6575ae: mov ecx, dword ptr [r14 + 0x70]
0x6575b2: test ecx, ecx
0x6575b4: je 0x14065764f
0x6575ba: xor edx, edx
0x6575bc: mov eax, r9d
0x6575bf: div ecx
0x6575c1: mov r10d, edx
0x6575c4: shl r10, 8
0x6575c8: add r10, qword ptr [r14 + 0x80]
0x6575cf: xor eax, eax
0x6575d1: mov edx, eax
0x6575d3: mov r11d, dword ptr [r10]
0x6575d6: test r11d, r11d
0x6575d9: je 0x14065764f
0x6575db: nop dword ptr [rax + rax]
0x6575e0: mov eax, edx
0x6575e2: cmp dword ptr [r10 + rax*8 + 8], r9d
0x6575e7: jne 0x1406575ff
0x6575e9: mov ecx, dword ptr [r10 + rax*8 + 0xc]
0x6575ee: mov rax, qword ptr [r14 + 0x88]
0x6575f5: mov r8, qword ptr [rax + rcx*8]
0x6575f9: cmp dword ptr [r8 + 4], r9d
0x6575fd: je 0x14065761c
0x6575ff: inc edx
0x657601: cmp edx, r11d
0x657604: jb 0x1406575e0
0x657606: jmp 0x14065764f
0x657608: add r9, 8
0x65760c: je 0x14065754c
0x657612: movzx r12d, byte ptr [r9 + 0x2c]
0x657617: jmp 0x14065754f
0x65761c: add r8, 8
0x657620: je 0x14065764f
0x657622: mov ebx, dword ptr [r8 + 0x1c]
0x657626: movzx edi, word ptr [r8 + 0x20]
0x65762b: movzx eax, byte ptr [r8 + 0x18]
0x657630: cmp al, 3
0x657632: je 0x14065763f
0x657634: cmp al, 7
0x657636: mov byte ptr [rbp + 0x160], 0
0x65763d: jne 0x140657646
0x65763f: mov byte ptr [rbp + 0x160], 1
0x657646: cmp al, 6
0x657648: sete byte ptr [rbp + 0x178]
0x65764f: mov eax, 4
0x657654: and eax, 0xfffffffb
0x657657: mov dword ptr [rsp + 0x30], eax
0x65765b: mov rcx, qword ptr [rsp + 0x38]
0x657660: mov rax, qword ptr [rcx]
0x657663: mov dl, 1
0x657665: call qword ptr [rax + 0x20]
0x657668: mov rax, qword ptr gs:[0x58]
0x657671: mov rdx, qword ptr [rax]
0x657674: mov eax, 0x1ec
0x657679: mov rcx, qword ptr [rip + 0x6711ea8]
0x657680: cmp byte ptr [rax + rdx], 0
0x657684: cmovne rcx, qword ptr [rip + 0x6711ea4]
0x65768c: mov rax, qword ptr [rcx]
0x65768f: mov rcx, qword ptr [rax + 8]
0x657693: mov r14, qword ptr [rcx + 0x1c0]
0x65769a: movzx ecx, r12b
0x65769e: test r12b, r12b
0x6576a1: je 0x140657c2e
0x6576a7: sub ecx, 1
0x6576aa: je 0x140657c2e
0x6576b0: sub ecx, 2
0x6576b3: je 0x140657c6d
0x6576b9: cmp ecx, 1
0x6576bc: je 0x140657c6d
0x6576c2: cmp byte ptr [rsp + 0x20], 0
0x6576c7: jne 0x140657c6d
0x6576cd: cmp ebx, -1
0x6576d0: je 0x1406577bd
0x6576d6: test r13, r13
0x6576d9: je 0x1406577b6
0x6576df: xor eax, eax
0x6576e1: mov qword ptr [rbp + 0xf8], rax
0x6576e8: mov qword ptr [rbp + 0x100], 0x105
0x6576f3: mov dword ptr [rbp + 0x104], eax
0x6576f9: mov byte ptr [rbp - 0x10], al
0x6576fc: mov dword ptr [rbp + 0x104], eax
0x657702: mov byte ptr [rbp - 0x10], al
0x657705: mov rax, qword ptr [rbp + 0xf8]
0x65770c: test rax, rax
0x65770f: je 0x140657714
0x657711: mov byte ptr [rax], 0
0x657714: lea r8, [rbp - 0x10]
0x657718: mov edx, ebx
0x65771a: call 0x140657110
0x65771f: mov eax, 0xffff
0x657724: lea rcx, [rbp - 0x10]
0x657728: cmp di, ax
0x65772b: mov rax, qword ptr [rbp + 0xf8]
0x657732: je 0x140657745
0x657734: test rax, rax
0x657737: cmovne rcx, rax
0x65773b: movzx eax, word ptr [r14 + 0xaa]
0x657743: jmp 0x140657754
0x657745: test rax, rax
0x657748: cmovne rcx, rax
0x65774c: movzx eax, word ptr [r14 + 0xae]
0x657754: mov qword ptr [rbp + 0x178], rcx
0x65775b: mov word ptr [rbp + 0x160], ax
0x657762: lea rcx, [rbp + 0x160]
0x657769: call 0x140389080
0x65776e: mov rcx, qword ptr [rax + 0x18]
0x657772: mov rax, qword ptr [rcx]
0x657775: xor edx, edx
0x657777: call qword ptr [rax + 8]
0x65777a: mov r8, rax
0x65777d: mov rax, qword ptr [r13 + 0x108]
0x657784: mov edx, dword ptr [r13 + 0x110]
0x65778b: mov dword ptr [r13 + 0x114], 0xffffffff
0x657796: test rax, rax
0x657799: cmovne r13, rax
0x65779d: lea r9, [rbp + 0x178]
0x6577a4: mov rcx, r13
0x6577a7: call 0x14035ee40
0x6577ac: nop 
0x6577ad: lea rcx, [rbp - 0x10]
0x6577b1: call 0x140394170
0x6577b6: mov bl, 1
0x6577b8: jmp 0x140657c6f
0x6577bd: mov rbx, qword ptr [rbp + 0x168]
0x6577c4: cmp r12b, 5
0x6577c8: jne 0x140657805
0x6577ca: mov rcx, rbx
0x6577cd: call 0x140473f20
0x6577d2: cmp dword ptr [rax + 0x280], -1
0x6577d9: je 0x140657805
0x6577db: test r13, r13
0x6577de: je 0x140657836
0x6577e0: test r15, r15
0x6577e3: je 0x140657836
0x6577e5: cmp r15, qword ptr [rsp + 0x60]
0x6577ea: jbe 0x140657836
0x6577ec: mov r9, r13
0x6577ef: lea r8, [rsp + 0x58]
0x6577f4: lea rdx, [rsp + 0x70]
0x6577f9: call 0x140657cf0
0x6577fe: mov bl, 3
0x657800: jmp 0x140657c6f
0x657805: cmp byte ptr [rbp + 0x178], 0
0x65780c: je 0x14065783d
0x65780e: test r13, r13
0x657811: je 0x140657836
0x657813: mov rax, qword ptr [rsp + 0x68]
0x657818: test rax, rax
0x65781b: je 0x140657836
0x65781d: cmp rax, qword ptr [rsp + 0x60]
0x657822: jbe 0x140657836
0x657824: mov r9, r13
0x657827: lea r8, [rsp + 0x58]
0x65782c: lea rdx, [rsp + 0x68]
0x657831: call 0x140657cf0
0x657836: mov bl, 3
0x657838: jmp 0x140657c6f
0x65783d: cmp byte ptr [rbp + 0x160], 0
0x657844: je 0x140657888
0x657846: test r13, r13
0x657849: je 0x140657c26
0x65784f: movzx eax, word ptr [r14 + 0xc4]
0x657857: mov word ptr [rbp + 0x160], ax
0x65785e: lea rcx, [rbp + 0x160]
0x657865: call 0x140389080
0x65786a: mov rcx, qword ptr [rax + 0x18]
0x65786e: mov rax, qword ptr [rcx]
0x657871: xor edx, edx
0x657873: call qword ptr [rax + 8]
0x657876: mov rdx, rax
0x657879: mov rcx, r13
0x65787c: call 0x140423790
0x657881: mov bl, 2
0x657883: jmp 0x140657c6f
0x657888: lea r8, [rsp + 0x58]
0x65788d: mov edx, dword ptr [rbx]
0x65788f: mov rcx, rsi
0x657892: call 0x141ac0bf0
0x657897: test al, al
0x657899: jne 0x1406578dd
0x65789b: test r13, r13
0x65789e: je 0x140657c26
0x6578a4: movzx eax, word ptr [r14 + 0xa6]
0x6578ac: mov word ptr [rbp + 0x160], ax
0x6578b3: lea rcx, [rbp + 0x160]
0x6578ba: call 0x140389080
0x6578bf: mov rcx, qword ptr [rax + 0x18]
0x6578c3: mov rax, qword ptr [rcx]
0x6578c6: xor edx, edx
0x6578c8: call qword ptr [rax + 8]
0x6578cb: mov rdx, rax
0x6578ce: mov rcx, r13
0x6578d1: call 0x140423790
0x6578d6: mov bl, 2
0x6578d8: jmp 0x140657c6f
0x6578dd: mov rcx, rbx
0x6578e0: call 0x140473f20
0x6578e5: lea rcx, [rax + 0x1b0]
0x6578ec: cmp dword ptr [rcx], -1
0x6578ef: je 0x140657903
0x6578f1: call 0x140473f20
0x6578f6: mov rcx, rax
0x6578f9: call 0x142350790
0x6578fe: mov r8, rax
0x657901: jmp 0x140657924
0x657903: lea r8, [rax + 0x220]
0x65790a: cmp dword ptr [r8 + 8], 0
0x65790f: jne 0x140657924
0x657911: lea rcx, [rax + 0x1ac]
0x657918: call 0x1405c15a0
0x65791d: lea r8, [rax + 0x90]
0x657924: mov r9d, dword ptr [r8 + 8]
0x657928: test r9d, r9d
0x65792b: je 0x140657c2a
0x657931: xor r10d, r10d
0x657934: mov edx, r10d
0x657937: test r9d, r9d
0x65793a: je 0x140657967
0x65793c: mov rax, qword ptr [rbp - 0x50]
0x657940: mov rcx, qword ptr [rax + 0x68]
0x657944: mov rax, qword ptr [rcx + 0x20]
0x657948: movzx ecx, word ptr [rax + 0x30]
0x65794c: mov r10, qword ptr [r8]
0x65794f: nop 
0x657950: mov eax, edx
0x657952: cmp cx, word ptr [r10 + rax*2]
0x657957: je 0x140657c2a
0x65795d: inc edx
0x65795f: cmp edx, r9d
0x657962: jb 0x140657950
0x657964: xor r10d, r10d
0x657967: test r13, r13
0x65796a: je 0x140657c26
0x657970: mov qword ptr [rbp + 0xf8], r10
0x657977: mov qword ptr [rbp + 0x100], 0x105
0x657982: mov dword ptr [rbp + 0x104], r10d
0x657989: mov byte ptr [rbp - 0x10], 0
0x65798d: mov dword ptr [rbp + 0x104], r10d
0x657994: mov byte ptr [rbp - 0x10], 0
0x657998: mov rax, qword ptr [rbp + 0xf8]
0x65799f: test rax, rax
0x6579a2: je 0x1406579a7
0x6579a4: mov byte ptr [rax], 0
0x6579a7: mov r15, qword ptr [r8]
0x6579aa: mov eax, dword ptr [r8 + 8]
0x6579ae: lea rax, [r15 + rax*2]
0x6579b2: mov qword ptr [rbp + 0x160], rax
0x6579b9: cmp r15, rax
0x6579bc: je 0x140657b79
0x6579c2: mov rax, qword ptr gs:[0x58]
0x6579cb: mov r12, qword ptr [rax]
0x6579ce: mov eax, 0x240
0x6579d3: add rax, r12
0x6579d6: mov qword ptr [rbp + 0x178], rax
0x6579dd: mov r13, qword ptr [rbp + 0x160]
0x6579e4: movzx eax, word ptr [r15]
0x6579e8: mov word ptr [rbp + 0x160], ax
0x6579ef: mov eax, dword ptr [rbp + 0x104]
0x6579f5: cmp eax, -1
0x6579f8: jne 0x140657a22
0x6579fa: lea rcx, [rbp - 0x10]
0x6579fe: mov rax, qword ptr [rbp + 0xf8]
0x657a05: test rax, rax
0x657a08: cmovne rcx, rax
0x657a0c: mov rax, 0xffffffffffffffff
0x657a13: inc rax
0x657a16: cmp byte ptr [rcx + rax], 0
0x657a1a: jne 0x140657a13
0x657a1c: mov dword ptr [rbp + 0x104], eax
0x657a22: test eax, eax
0x657a24: je 0x140657a3c
0x657a26: mov r8d, 2
0x657a2c: lea rdx, [rip + 0x4f2ac0d]
0x657a33: lea rcx, [rbp - 0x10]
0x657a37: call 0x140393f50
0x657a3c: lea rcx, [rbp + 0x160]
0x657a43: call 0x140389570
0x657a48: mov rcx, qword ptr [rax + 0x18]
0x657a4c: mov rax, qword ptr [rcx]
0x657a4f: xor edx, edx
0x657a51: call qword ptr [rax + 8]
0x657a54: mov rdi, rax
0x657a57: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a61: mov rcx, qword ptr [rbp + 0xf8]
0x657a68: test rcx, rcx
0x657a6b: setne al
0x657a6e: lea rbx, [rbp - 0x10]
0x657a72: test rcx, rcx
0x657a75: cmovne rbx, rcx
0x657a79: mov r14d, dword ptr [rbp + 0x100]
0x657a80: mov dword ptr [rbp + 0x104], 0xffffffff
0x657a8a: lea rsi, [rbp - 0x10]
0x657a8e: test al, al
0x657a90: cmovne rsi, rcx
0x657a94: mov rax, qword ptr [rbp + 0x178]
0x657a9b: xor ecx, ecx
0x657a9d: mov dword ptr [rax], ecx
0x657a9f: mov edx, 2
0x657aa4: lea rcx, [rbp + 0x160]
0x657aab: call 0x141424650
0x657ab0: nop 
0x657ab1: test rbx, rbx
0x657ab4: je 0x140657ad7
0x657ab6: call 0x1414245b0
0x657abb: cmp dword ptr [rax + 8], 0
0x657abf: ja 0x140657aca
0x657ac1: lea rax, [rip + 0x66825e8]
0x657ac8: jmp 0x140657ad0
0x657aca: mov rax, qword ptr [rax]
0x657acd: mov rax, qword ptr [rax]
0x657ad0: mov qword ptr [rax + 0x808], rbx
0x657ad7: test rdi, rdi
0x657ada: je 0x140657afe
0x657adc: call 0x1414245b0
0x657ae1: cmp dword ptr [rax + 8], 1
0x657ae5: ja 0x140657af0
0x657ae7: lea rax, [rip + 0x66825c2]
0x657aee: jmp 0x140657af7
0x657af0: mov rax, qword ptr [rax]
0x657af3: mov rax, qword ptr [rax + 8]
0x657af7: mov qword ptr [rax + 0x808], rdi
0x657afe: lea r8, [rip + 0x4f391a7]
0x657b05: mov edx, r14d
0x657b08: mov rcx, rsi
0x657b0b: call 0x141424bd0
0x657b10: nop 
0x657b11: call 0x1414245b0
0x657b16: mov rsi, rax
0x657b19: xor r10d, r10d
0x657b1c: mov ebx, r10d
0x657b1f: cmp dword ptr [rax + 8], r10d
0x657b23: jbe 0x140657b61
0x657b25: mov r14d, 0x1fd
0x657b2b: nop dword ptr [rax + rax]
0x657b30: mov ecx, ebx
0x657b32: mov rax, qword ptr [rsi]
0x657b35: lea rdi, [rax + rcx*8]
0x657b39: mov rcx, qword ptr [rdi]
0x657b3c: test rcx, rcx
0x657b3f: je 0x140657b5a
0x657b41: cmp byte ptr [r14 + r12], 0
0x657b46: je 0x140657b4f
0x657b48: call 0x1447f03bc
0x657b4d: jmp 0x140657b54
0x657b4f: call 0x1447f02bc
0x657b54: xor r10d, r10d
0x657b57: mov qword ptr [rdi], r10
0x657b5a: inc ebx
0x657b5c: cmp ebx, dword ptr [rsi + 8]
0x657b5f: jb 0x140657b30
0x657b61: mov dword ptr [rsi + 8], r10d
0x657b65: add r15, 2
0x657b69: cmp r15, r13
0x657b6c: jne 0x1406579e4
0x657b72: mov r13, qword ptr [rbp + 0x170]
0x657b79: lea rcx, [rbp - 0x10]
0x657b7d: mov rax, qword ptr [rbp + 0xf8]
0x657b84: test rax, rax
0x657b87: cmovne rcx, rax
0x657b8b: mov qword ptr [rbp + 0x178], rcx
0x657b92: mov rax, qword ptr gs:[0x58]
0x657b9b: mov rcx, qword ptr [rax]
0x657b9e: mov eax, 0x1ec
0x657ba3: mov rdx, qword ptr [rip + 0x671197e]
0x657baa: cmp byte ptr [rax + rcx], 0
0x657bae: cmovne rdx, qword ptr [rip + 0x671197a]
0x657bb6: mov rax, qword ptr [rdx]
0x657bb9: mov rcx, qword ptr [rax + 8]
0x657bbd: mov rax, qword ptr [rcx + 0x1c0]
0x657bc4: movzx ecx, word ptr [rax + 0xa8]
0x657bcb: mov word ptr [rbp + 0x160], cx
0x657bd2: lea rcx, [rbp + 0x160]
0x657bd9: call 0x140389080
0x657bde: mov rcx, qword ptr [rax + 0x18]
0x657be2: mov rax, qword ptr [rcx]
0x657be5: xor edx, edx
0x657be7: call qword ptr [rax + 8]
0x657bea: mov r8, rax
0x657bed: mov edx, dword ptr [r13 + 0x110]
0x657bf4: mov dword ptr [r13 + 0x114], 0xffffffff
0x657bff: mov rax, qword ptr [r13 + 0x108]
0x657c06: test rax, rax
0x657c09: cmovne r13, rax
0x657c0d: lea r9, [rbp + 0x178]
0x657c14: mov rcx, r13
0x657c17: call 0x14035ee40
0x657c1c: nop 
0x657c1d: lea rcx, [rbp - 0x10]
0x657c21: call 0x140394170
0x657c26: mov bl, 2
0x657c28: jmp 0x140657c6f
0x657c2a: mov bl, 4
0x657c2c: jmp 0x140657c6f
0x657c2e: test r13, r13
0x657c31: je 0x1406577b6
0x657c37: movzx eax, word ptr [r14 + 0xa6]
0x657c3f: mov word ptr [rbp + 0x160], ax
0x657c46: lea rcx, [rbp + 0x160]
0x657c4d: call 0x140389080
0x657c52: mov rcx, qword ptr [rax + 0x18]
0x657c56: mov rax, qword ptr [rcx]
0x657c59: xor edx, edx
0x657c5b: call qword ptr [rax + 8]
0x657c5e: mov rdx, rax
0x657c61: mov rcx, r13
0x657c64: call 0x140423790
0x657c69: mov bl, 1
0x657c6b: jmp 0x140657c6f
0x657c6d: xor bl, bl
0x657c6f: lea rax, [rip + 0x52bb1ea]
0x657c76: mov qword ptr [rsp + 0x78], rax
0x657c7b: cmp byte ptr [rbp - 0x78], 0
0x657c7f: je 0x140657c8f
0x657c81: mov rcx, qword ptr [rbp - 0x60]
0x657c85: mov rax, qword ptr [rcx]
0x657c88: call qword ptr [rax + 0x148]
0x657c8e: nop 
0x657c8f: lea rax, [rip + 0x4f1bbaa]
0x657c96: mov qword ptr [rsp + 0x78], rax
0x657c9b: lea rdi, [rip + 0x50ce1a6]
0x657ca2: mov qword ptr [rsp + 0x78], rdi
0x657ca7: lea rcx, [rsp + 0x78]
0x657cac: call 0x141434880
0x657cb1: nop 
0x657cb2: mov qword ptr [rbp - 0x58], rdi
0x657cb6: lea rcx, [rbp - 0x58]
0x657cba: call 0x141434880
0x657cbf: nop 
0x657cc0: mov qword ptr [rbp - 0x38], rdi
0x657cc4: lea rcx, [rbp - 0x38]
0x657cc8: call 0x141434880
0x657ccd: movzx eax, bl
0x657cd0: add rsp, 0x218
0x657cd7: pop r15
0x657cd9: pop r14
0x657cdb: pop r13
0x657cdd: pop r12
0x657cdf: pop rdi
0x657ce0: pop rsi
0x657ce1: pop rbx
0x657ce2: pop rbp
0x657ce3: ret 
CALLEE 0x658ae0
0x658ae0: mov qword ptr [rsp + 0x18], rbx
0x658ae5: mov qword ptr [rsp + 0x10], rdx
0x658aea: mov qword ptr [rsp + 8], rcx
0x658aef: push rbp
0x658af0: push rsi
0x658af1: push rdi
0x658af2: push r12
0x658af4: push r13
0x658af6: push r14
0x658af8: push r15
0x658afa: mov rbp, rsp
0x658afd: sub rsp, 0x70
0x658b01: mov rdi, r9
0x658b04: mov rbx, r8
0x658b07: xor r14d, r14d
0x658b0a: lea rdx, [rbp - 0x48]
0x658b0e: mov rcx, qword ptr [rip + 0x671067b]
0x658b15: mov rcx, qword ptr [rcx + 0x30]
0x658b19: call 0x1408b44e0
0x658b1e: nop 
0x658b1f: cmp byte ptr [rbp - 0x38], r14b
0x658b23: jne 0x140658b2d
0x658b25: xor sil, sil
0x658b28: jmp 0x140658e06
0x658b2d: mov edx, 0x1ec
0x658b32: mov rax, qword ptr gs:[0x58]
0x658b3b: mov rcx, qword ptr [rax]
0x658b3e: cmp byte ptr [rdx + rcx], 0
0x658b42: mov rdx, qword ptr [rip + 0x67109e7]
0x658b49: jne 0x140658b52
0x658b4b: mov rdx, qword ptr [rip + 0x67109d6]
0x658b52: mov rax, qword ptr [rdx]
0x658b55: mov rcx, qword ptr [rax + 8]
0x658b59: mov r13, qword ptr [rcx + 0x1c0]
0x658b60: mov rcx, qword ptr [rax + 8]
0x658b64: mov r8, rbx
0x658b67: lea rdx, [rbp + 0x48]
0x658b6b: mov rcx, qword ptr [rcx + 0x310]
0x658b72: call 0x141789770
0x658b77: movzx ebx, word ptr [rbp + 0x48]
0x658b7b: mov r15d, ebx
0x658b7e: mov eax, 0xffff
0x658b83: cmp ebx, eax
0x658b85: je 0x140658d65
0x658b8b: mov rax, qword ptr [rbp - 0x40]
0x658b8f: mov rcx, qword ptr [rax + 0x68]
0x658b93: mov rax, qword ptr [rcx + 0x188]
0x658b9a: mov rsi, qword ptr [rax + 0x18]
0x658b9e: lea rdx, [rsi + 8]
0x658ba2: test rsi, rsi
0x658ba5: cmove rdx, r14
0x658ba9: mov rdx, qword ptr [rdx]
0x658bac: lea rcx, [rbp + 0x48]
0x658bb0: call 0x140393df0
0x658bb5: nop 
0x658bb6: cmp dword ptr [rsi + 0x28], ebx
0x658bb9: jbe 0x140658d59
0x658bbf: imul r12, rbx, 0x1c8
0x658bc6: mov rbx, qword ptr [rsi + 0x20]
0x658bca: add rbx, r12
0x658bcd: je 0x140658d59
0x658bd3: movzx ebx, byte ptr [rbx + 0x1c]
0x658bd7: mov rcx, qword ptr [rbp + 0x48]
0x658bdb: mov rax, qword ptr [rcx]
0x658bde: mov dl, 1
0x658be0: call qword ptr [rax + 0x20]
0x658be3: test bl, bl
0x658be5: jne 0x140658d65
0x658beb: mov rax, qword ptr [rbp - 0x40]
0x658bef: mov rcx, qword ptr [rax + 0x68]
0x658bf3: mov rax, qword ptr [rcx + 0x188]
0x658bfa: mov rbx, qword ptr [rax + 0x18]
0x658bfe: lea rdx, [rbx + 8]
0x658c02: test rbx, rbx
0x658c05: cmove rdx, r14
0x658c09: mov rdx, qword ptr [rdx]
0x658c0c: lea rcx, [rbp + 0x48]
0x658c10: call 0x140393df0
0x658c15: nop 
0x658c16: cmp dword ptr [rbx + 0x28], r15d
0x658c1a: jbe 0x140658c2b
0x658c1c: mov rbx, qword ptr [rbx + 0x20]
0x658c20: add rbx, r12
0x658c23: je 0x140658c2b
0x658c25: mov rbx, qword ptr [rbx + 0x10]
0x658c29: jmp 0x140658c32
0x658c2b: mov rbx, qword ptr [rip + 0x66852de]
0x658c32: mov rcx, qword ptr [rbp + 0x48]
0x658c36: mov rax, qword ptr [rcx]
0x658c39: mov dl, 1
0x658c3b: call qword ptr [rax + 0x20]
0x658c3e: cmp byte ptr [rbx + 5], 0
0x658c42: jne 0x140658d65
0x658c48: movzx eax, byte ptr [rbx + 6]
0x658c4c: cmp al, 4
0x658c4e: je 0x140658d65
0x658c54: test rdi, rdi
0x658c57: je 0x140658d51
0x658c5d: cmp al, 3
0x658c5f: jne 0x140658cb3
0x658c61: movzx eax, word ptr [r13 + 0xf6]
0x658c69: mov word ptr [rbp + 0x48], ax
0x658c6d: lea rcx, [rbp + 0x48]
0x658c71: call 0x140389080
0x658c76: mov rcx, qword ptr [rax + 0x18]
0x658c7a: mov rax, qword ptr [rcx]
0x658c7d: xor edx, edx
0x658c7f: call qword ptr [rax + 8]
0x658c82: mov edx, dword ptr [rdi + 0x110]
0x658c88: mov dword ptr [rdi + 0x114], 0xffffffff
0x658c92: mov rcx, qword ptr [rdi + 0x108]
0x658c99: test rcx, rcx
0x658c9c: cmovne rdi, rcx
0x658ca0: mov r8, rax
0x658ca3: mov rcx, rdi
0x658ca6: call 0x141424a80
0x658cab: mov sil, 2
0x658cae: jmp 0x140658e06
0x658cb3: mov rcx, rbx
0x658cb6: call 0x140430150
0x658cbb: lea rcx, [rax + 0x24]
0x658cbf: mov eax, 0xffff
0x658cc4: cmp word ptr [rcx], ax
0x658cc7: jne 0x140658cd2
0x658cc9: lea rbx, [rip + 0x4f1a7dc]
0x658cd0: jmp 0x140658cff
0x658cd2: call 0x140433650
0x658cd7: lea rdx, [rbp - 0x28]
0x658cdb: mov rcx, qword ptr [rax + 0x88]
0x658ce2: call 0x142424250
0x658ce7: nop 
0x658ce8: mov rcx, qword ptr [rax]
0x658ceb: mov rax, qword ptr [rcx]
0x658cee: xor edx, edx
0x658cf0: call qword ptr [rax + 8]
0x658cf3: mov rbx, rax
0x658cf6: lea rcx, [rbp - 0x10]
0x658cfa: call 0x140394db0
0x658cff: mov qword ptr [rbp + 0x40], rbx
0x658d03: movzx eax, word ptr [r13 + 0xf2]
0x658d0b: mov word ptr [rbp + 0x48], ax
0x658d0f: lea rcx, [rbp + 0x48]
0x658d13: call 0x140389080
0x658d18: mov rcx, qword ptr [rax + 0x18]
0x658d1c: mov rax, qword ptr [rcx]
0x658d1f: xor edx, edx
0x658d21: call qword ptr [rax + 8]
0x658d24: mov edx, dword ptr [rdi + 0x110]
0x658d2a: mov dword ptr [rdi + 0x114], 0xffffffff
0x658d34: mov rcx, qword ptr [rdi + 0x108]
0x658d3b: test rcx, rcx
0x658d3e: cmovne rdi, rcx
0x658d42: lea r9, [rbp + 0x40]
0x658d46: mov r8, rax
0x658d49: mov rcx, rdi
0x658d4c: call 0x14035ee40
0x658d51: mov sil, 2
0x658d54: jmp 0x140658e06
0x658d59: mov rcx, qword ptr [rbp + 0x48]
0x658d5d: mov rax, qword ptr [rcx]
0x658d60: mov dl, 1
0x658d62: call qword ptr [rax + 0x20]
0x658d65: mov rax, qword ptr [rbp - 0x40]
0x658d69: lea rdx, [rax + 8]
0x658d6d: test rax, rax
0x658d70: cmove rdx, r14
0x658d74: mov rdx, qword ptr [rdx]
0x658d77: lea rcx, [rbp + 0x40]
0x658d7b: call 0x140393df0
0x658d80: nop 
0x658d81: mov rax, qword ptr [rbp - 0x40]
0x658d85: mov rcx, qword ptr [rax + 0x68]
0x658d89: mov rax, qword ptr [rcx + 0x120]
0x658d90: cmp byte ptr [rax + 0x18], 0
0x658d94: je 0x140658df7
0x658d96: test rdi, rdi
0x658d99: je 0x140658de6
0x658d9b: movzx eax, word ptr [r13 + 0xcc]
0x658da3: mov word ptr [rbp + 0x48], ax
0x658da7: lea rcx, [rbp + 0x48]
0x658dab: call 0x140389080
0x658db0: mov rcx, qword ptr [rax + 0x18]
0x658db4: mov rax, qword ptr [rcx]
0x658db7: xor edx, edx
0x658db9: call qword ptr [rax + 8]
0x658dbc: mov edx, dword ptr [rdi + 0x110]
0x658dc2: mov dword ptr [rdi + 0x114], 0xffffffff
0x658dcc: mov r8, qword ptr [rdi + 0x108]
0x658dd3: test r8, r8
0x658dd6: cmovne rdi, r8
0x658dda: mov r8, rax
0x658ddd: mov rcx, rdi
0x658de0: call 0x141424a80
0x658de5: nop 
0x658de6: mov rcx, qword ptr [rbp + 0x40]
0x658dea: mov rax, qword ptr [rcx]
0x658ded: mov dl, 1
0x658def: call qword ptr [rax + 0x20]
0x658df2: mov sil, 2
0x658df5: jmp 0x140658e06
0x658df7: mov rcx, qword ptr [rbp + 0x40]
0x658dfb: mov rax, qword ptr [rcx]
0x658dfe: mov dl, 1
0x658e00: call qword ptr [rax + 0x20]
0x658e03: mov sil, 4
0x658e06: lea rax, [rip + 0x50cd03b]
0x658e0d: mov qword ptr [rbp - 0x48], rax
0x658e11: cmp byte ptr [rbp - 0x38], 0
0x658e15: je 0x140658e8b
0x658e17: cmp byte ptr [rbp - 0x37], 0
0x658e1b: jne 0x140658e2c
0x658e1d: mov rcx, qword ptr [rbp - 0x40]
0x658e21: mov rax, qword ptr [rcx]
0x658e24: call qword ptr [rax + 8]
0x658e27: movzx edi, al
0x658e2a: jmp 0x140658e6a
0x658e2c: mov rdi, qword ptr [rbp - 0x40]
0x658e30: lea rbx, [rdi + 0x18]
0x658e34: mov qword ptr [rbp + 0x48], rbx
0x658e38: mov rax, qword ptr [rbx]
0x658e3b: mov rcx, rbx
0x658e3e: call qword ptr [rax + 8]
0x658e41: nop 
0x658e42: dec word ptr [rdi + 0x48]
0x658e46: cmp byte ptr [rdi + 0x4a], 0
0x658e4a: jne 0x140658e5e
0x658e4c: lock xadd dword ptr [rdi + 0x10], r14d
0x658e52: add r14w, word ptr [rdi + 0x48]
0x658e57: jne 0x140658e5e
0x658e59: mov dil, 1
0x658e5c: jmp 0x140658e61
0x658e5e: xor dil, dil
0x658e61: mov rax, qword ptr [rbx]
0x658e64: mov rcx, rbx
0x658e67: call qword ptr [rax + 0x10]
0x658e6a: test dil, dil
0x658e6d: je 0x140658e87
0x658e6f: mov rcx, qword ptr [rbp - 0x40]
0x658e73: mov edx, 1
0x658e78: xor eax, eax
0x658e7a: lock cmpxchg byte ptr [rcx + 0x4b], dl
0x658e7f: jne 0x140658e87
0x658e81: mov rdx, qword ptr [rcx]
0x658e84: call qword ptr [rdx + 0x10]
0x658e87: mov byte ptr [rbp - 0x38], 0
0x658e8b: movzx eax, sil
0x658e8f: mov rbx, qword ptr [rsp + 0xc0]
0x658e97: add rsp, 0x70
0x658e9b: pop r15
0x658e9d: pop r14
0x658e9f: pop r13
0x658ea1: pop r12
0x658ea3: pop rdi
0x658ea4: pop rsi
0x658ea5: pop rbp
0x658ea6: ret 
CALLEE 0xdeca40
0xdeca40: mov qword ptr [rsp + 8], rbx
0xdeca45: push rdi
0xdeca46: sub rsp, 0x20
0xdeca4a: xor r10d, r10d
0xdeca4d: lea r9, [rcx + 0x1e8]
0xdeca54: movzx edi, r8b
0xdeca58: mov r11d, r10d
0xdeca5b: mov rax, r9
0xdeca5e: movzx r8d, dl
0xdeca62: mov rbx, rcx
0xdeca65: cmp byte ptr [rax], r10b
0xdeca68: jne 0x140deca7a
0xdeca6a: inc r11d
0xdeca6d: inc rax
0xdeca70: cmp r11d, 3
0xdeca74: jb 0x140deca65
0xdeca76: xor dl, dl
0xdeca78: jmp 0x140deca7c
0xdeca7a: mov dl, 1
0xdeca7c: mov rcx, r8
0xdeca7f: shr r8, 3
0xdeca83: and ecx, 7
0xdeca86: movzx eax, byte ptr [r8 + r9]
0xdeca8b: test dil, dil
0xdeca8e: je 0x140deca95
0xdeca90: bts eax, ecx
0xdeca93: jmp 0x140deca98
0xdeca95: btr eax, ecx
0xdeca98: mov byte ptr [r8 + r9], al
0xdeca9c: nop dword ptr [rax]
0xdecaa0: cmp byte ptr [r9], 0
0xdecaa4: jne 0x140decab6
0xdecaa6: inc r10d
0xdecaa9: inc r9
0xdecaac: cmp r10d, 3
0xdecab0: jb 0x140decaa0
0xdecab2: xor al, al
0xdecab4: jmp 0x140decab8
0xdecab6: mov al, 1
0xdecab8: cmp dl, al
0xdecaba: je 0x140decad7
0xdecabc: mov rdx, qword ptr [rbx]
0xdecabf: mov rcx, rbx
0xdecac2: test al, al
0xdecac4: je 0x140decad4
0xdecac6: mov rbx, qword ptr [rsp + 0x30]
0xdecacb: add rsp, 0x20
0xdecacf: pop rdi
0xdecad0: jmp qword ptr [rdx + 0x28]
0xdecad4: call qword ptr [rdx + 0x20]
0xdecad7: mov rbx, qword ptr [rsp + 0x30]
0xdecadc: add rsp, 0x20
0xdecae0: pop rdi
0xdecae1: ret 
CALLEE 0xdeca40
0xdeca40: mov qword ptr [rsp + 8], rbx
0xdeca45: push rdi
0xdeca46: sub rsp, 0x20
0xdeca4a: xor r10d, r10d
0xdeca4d: lea r9, [rcx + 0x1e8]
0xdeca54: movzx edi, r8b
0xdeca58: mov r11d, r10d
0xdeca5b: mov rax, r9
0xdeca5e: movzx r8d, dl
0xdeca62: mov rbx, rcx
0xdeca65: cmp byte ptr [rax], r10b
0xdeca68: jne 0x140deca7a
0xdeca6a: inc r11d
0xdeca6d: inc rax
0xdeca70: cmp r11d, 3
0xdeca74: jb 0x140deca65
0xdeca76: xor dl, dl
0xdeca78: jmp 0x140deca7c
0xdeca7a: mov dl, 1
0xdeca7c: mov rcx, r8
0xdeca7f: shr r8, 3
0xdeca83: and ecx, 7
0xdeca86: movzx eax, byte ptr [r8 + r9]
0xdeca8b: test dil, dil
0xdeca8e: je 0x140deca95
0xdeca90: bts eax, ecx
0xdeca93: jmp 0x140deca98
0xdeca95: btr eax, ecx
0xdeca98: mov byte ptr [r8 + r9], al
0xdeca9c: nop dword ptr [rax]
0xdecaa0: cmp byte ptr [r9], 0
0xdecaa4: jne 0x140decab6
0xdecaa6: inc r10d
0xdecaa9: inc r9
0xdecaac: cmp r10d, 3
0xdecab0: jb 0x140decaa0
0xdecab2: xor al, al
0xdecab4: jmp 0x140decab8
0xdecab6: mov al, 1
0xdecab8: cmp dl, al
0xdecaba: je 0x140decad7
0xdecabc: mov rdx, qword ptr [rbx]
0xdecabf: mov rcx, rbx
0xdecac2: test al, al
0xdecac4: je 0x140decad4
0xdecac6: mov rbx, qword ptr [rsp + 0x30]
0xdecacb: add rsp, 0x20
0xdecacf: pop rdi
0xdecad0: jmp qword ptr [rdx + 0x28]
0xdecad4: call qword ptr [rdx + 0x20]
0xdecad7: mov rbx, qword ptr [rsp + 0x30]
0xdecadc: add rsp, 0x20
0xdecae0: pop rdi
0xdecae1: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0xcb6bd0
0xcb6bd0: push rsi
0xcb6bd2: sub rsp, 0x30
0xcb6bd6: cmp byte ptr [rcx + 0xbd], 0
0xcb6bdd: mov rsi, rcx
0xcb6be0: mov byte ptr [rcx + 0xbe], 0
0xcb6be7: jne 0x140cb6d6d
0xcb6bed: mov rax, qword ptr [rcx + 8]
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c8ef0
0x35c8ef0: push rbp
0x35c8ef2: push rbx
0x35c8ef3: push rdi
0x35c8ef4: push r13
0x35c8ef6: push r14
0x35c8ef8: mov rbp, rsp
0x35c8efb: sub rsp, 0x80
0x35c8f02: mov r9, qword ptr [rcx]
0x35c8f05: mov rbx, rdx
0x35c8f08: mov rdi, r8
0x35c8f0b: mov r14, rcx
0x35c8f0e: mov rdx, qword ptr [r9 + 0xa0]
0x35c8f15: test rdx, rdx
0x35c8f18: je 0x1435c8f68
0x35c8f1a: cmp qword ptr [rdx + 8], 0
0x35c8f1f: je 0x1435c8f68
0x35c8f21: movzx ecx, byte ptr [r8]
0x35c8f25: lea rax, [rip + 0x36c4254]
0x35c8f2c: mov rax, qword ptr [rax + rcx*8]
0x35c8f30: test byte ptr [rax + 0x26], 2
0x35c8f34: je 0x1435c8f53
0x35c8f36: xor r13d, r13d
0x35c8f39: mov dword ptr [rbx + 8], 0xffffffff
0x35c8f40: mov qword ptr [rbx], r13
0x35c8f43: mov byte ptr [rbx + 0xc], 0xff
0x35c8f47: mov byte ptr [rbx + 0xd], cl
0x35c8f4a: mov byte ptr [rbx + 0xe], 1
0x35c8f4e: jmp 0x1435c9309
0x35c8f53: mov rcx, qword ptr [r9 + 0x38]
0x35c8f57: mov rdx, rbx
0x35c8f5a: mov rcx, qword ptr [rcx + 0x20]
0x35c8f5e: call 0x1435c8ef0
0x35c8f63: jmp 0x1435c9309
0x35c8f68: test byte ptr [r9 + 0x97], 2
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0x64b570
0x64b570: mov qword ptr [rsp + 0x10], rbx
0x64b575: mov qword ptr [rsp + 0x18], rbp
0x64b57a: push rsi
0x64b57b: push rdi
0x64b57c: push r12
0x64b57e: push r14
0x64b580: push r15
0x64b582: sub rsp, 0x30
0x64b586: mov rsi, r9
0x64b589: mov r12, r8
0x64b58c: mov r14, rdx
0x64b58f: mov rdi, rcx
0x64b592: mov rcx, qword ptr [rcx]
0x64b595: mov rax, qword ptr [rcx + 0xa0]
0x64b59c: test rax, rax
0x64b59f: je 0x14064b5ac
0x64b5a1: cmp qword ptr [rax + 8], 0
0x64b5a6: jne 0x14064b82a
0x64b5ac: mov r15, qword ptr [rcx + 0x20]
0x64b5b0: cmp qword ptr [r15 + 0x30], 0
0x64b5b5: jne 0x14064b714
0x64b5bb: mov edx, 0x1fd
0x64b5c0: mov rax, qword ptr gs:[0x58]
0x64b5c9: mov rcx, qword ptr [rax]
0x64b5cc: cmp byte ptr [rdx + rcx], 0
0x64b5d0: mov edx, 0x10
0x64b5d5: mov ecx, 0xb0
0x64b5da: je 0x14064b5e3
0x64b5dc: call 0x1447efa78
0x64b5e1: jmp 0x14064b5e8
0x64b5e3: call 0x1447ef9b0
0x64b5e8: mov rbx, rax
0x64b5eb: test rax, rax
0x64b5ee: jne 0x14064b60b
0x64b5f0: call 0x141318e70
0x64b5f5: xor r9d, r9d
0x64b5f8: xor r8d, r8d
0x64b5fb: mov edx, 1
0x64b600: mov ecx, 0xa0000002
0x64b605: call qword ptr [rip + 0x4b9fb3d]
0x64b60b: mov qword ptr [rsp + 0x60], rbx
0x64b610: xor ebp, ebp
0x64b612: test rbx, rbx
0x64b615: je 0x14064b6fe
0x64b61b: mov dword ptr [rsp + 0x80], ebp
0x64b622: mov r9d, 0x2ffff
0x64b628: mov r8d, 1
0x64b62e: lea rdx, [rip + 0x4f4145b]
0x64b635: lea rcx, [rsp + 0x80]
0x64b63d: call 0x1412becb0
0x64b642: mov dword ptr [rbx], ebp
0x64b644: mov byte ptr [rbx + 4], bpl
0x64b648: mov dword ptr [rbx + 8], ebp
0x64b64b: mov byte ptr [rbx + 0xc], bpl
0x64b64f: mov dword ptr [rbx + 0x10], ebp
0x64b652: mov byte ptr [rbx + 0x14], bpl
0x64b656: mov dword ptr [rbx + 0x18], ebp
0x64b659: mov byte ptr [rbx + 0x1c], bpl
0x64b65d: mov dword ptr [rbx + 0x20], 0x3f800000
0x64b664: mov byte ptr [rbx + 0x24], bpl
0x64b668: mov dword ptr [rbx + 0x28], 0x3f800000
0x64b66f: mov byte ptr [rbx + 0x2c], bpl
0x64b673: mov dword ptr [rbx + 0x30], 0x3f800000
0x64b67a: mov byte ptr [rbx + 0x34], bpl
0x64b67e: mov dword ptr [rbx + 0x38], ebp
0x64b681: mov byte ptr [rbx + 0x3c], bpl
0x64b685: mov dword ptr [rbx + 0x40], ebp
0x64b688: mov byte ptr [rbx + 0x44], bpl
0x64b68c: mov dword ptr [rbx + 0x48], ebp
0x64b68f: mov byte ptr [rbx + 0x4c], bpl
0x64b693: mov dword ptr [rbx + 0x50], ebp
0x64b696: mov byte ptr [rbx + 0x54], bpl
0x64b69a: mov dword ptr [rbx + 0x58], ebp
0x64b69d: mov byte ptr [rbx + 0x5c], bpl
0x64b6a1: mov dword ptr [rbx + 0x60], ebp
0x64b6a4: mov byte ptr [rbx + 0x64], bpl
0x64b6a8: mov dword ptr [rbx + 0x68], ebp
0x64b6ab: mov qword ptr [rbx + 0x70], rbp
0x64b6af: mov qword ptr [rbx + 0x78], rbp
0x64b6b3: mov qword ptr [rbx + 0x80], rbp
0x64b6ba: mov qword ptr [rbx + 0x88], rbp
0x64b6c1: mov dword ptr [rbx + 0x90], ebp
0x64b6c7: xor eax, eax
0x64b6c9: mov word ptr [rbx + 0x94], ax
0x64b6d0: mov byte ptr [rbx + 0x96], 1
0x64b6d7: mov qword ptr [rbx + 0x98], rbp
0x64b6de: mov qword ptr [rbx + 0xa0], rbp
0x64b6e5: mov eax, dword ptr [rsp + 0x80]
0x64b6ec: mov dword ptr [rbx + 0xa8], eax
0x64b6f2: mov dword ptr [rbx + 0xac], 0xff000000
0x64b6fc: jmp 0x14064b701
0x64b6fe: mov rbx, rbp
0x64b701: cmp rbx, qword ptr [r15 + 0x30]
0x64b705: je 0x14064b714
0x64b707: lea rcx, [r15 + 0x30]
0x64b70b: call 0x14061a7b0
0x64b710: mov qword ptr [r15 + 0x30], rbx
0x64b714: mov rdx, qword ptr [rdi]
0x64b717: mov rax, qword ptr [rdx + 0x20]
0x64b71b: mov rcx, qword ptr [rax + 0x30]
0x64b71f: mov byte ptr [rsp + 0x80], 0
0x64b727: cmp byte ptr [r14], 0x40
0x64b72b: jne 0x14064b760
0x64b72d: movzx eax, byte ptr [rsi]
0x64b730: cmp al, 1
0x64b732: je 0x14064b738
0x64b734: test al, al
0x64b736: jne 0x14064b760
0x64b738: mov rax, qword ptr [rdx + 0x58]
0x64b73c: cmp byte ptr [rax + 0x312c4], 0
0x64b743: jne 0x14064b760
0x64b745: vmovss xmm0, dword ptr [rip + 0x66de88b]
0x64b74d: vmaxss xmm1, xmm0, dword ptr [r12]
0x64b753: vmovss dword ptr [rsp + 0x60], xmm1
0x64b759: lea r8, [rsp + 0x60]
0x64b75e: jmp 0x14064b763
0x64b760: mov r8, r12
0x64b763: lea rax, [rsp + 0x80]
0x64b76b: mov qword ptr [rsp + 0x20], rax
0x64b770: mov r9, rsi
0x64b773: mov rdx, r14
0x64b776: call 0x14064cb30
0x64b77b: cmp byte ptr [rsp + 0x80], 0
0x64b783: jne 0x14064b82a
0x64b789: mov rdx, r14
0x64b78c: mov rcx, rdi
0x64b78f: call 0x1435c72e0
0x64b794: cmp byte ptr [r14], 0x2f
0x64b798: jne 0x14064b82a
0x64b79e: mov byte ptr [rsp + 0x80], 0x30
0x64b7a6: mov byte ptr [rsp + 0x20], 0
0x64b7ab: mov r9, rsi
0x64b7ae: mov r8, r12
0x64b7b1: lea rdx, [rsp + 0x80]
0x64b7b9: mov rcx, rdi
0x64b7bc: call 0x14064b570
0x64b7c1: mov byte ptr [rsp + 0x80], 0x31
0x64b7c9: mov byte ptr [rsp + 0x20], 0
0x64b7ce: mov r9, rsi
0x64b7d1: mov r8, r12
0x64b7d4: lea rdx, [rsp + 0x80]
0x64b7dc: mov rcx, rdi
0x64b7df: call 0x14064b570
0x64b7e4: mov byte ptr [rsp + 0x80], 0x32
0x64b7ec: mov byte ptr [rsp + 0x20], 0
0x64b7f1: mov r9, rsi
0x64b7f4: mov r8, r12
0x64b7f7: lea rdx, [rsp + 0x80]
0x64b7ff: mov rcx, rdi
0x64b802: call 0x14064b570
0x64b807: mov byte ptr [rsp + 0x80], 0x33
0x64b80f: mov byte ptr [rsp + 0x20], 0
0x64b814: mov r9, rsi
0x64b817: mov r8, r12
0x64b81a: lea rdx, [rsp + 0x80]
0x64b822: mov rcx, rdi
0x64b825: call 0x14064b570
0x64b82a: mov rbx, qword ptr [rsp + 0x68]
0x64b82f: mov rbp, qword ptr [rsp + 0x70]
0x64b834: add rsp, 0x30
0x64b838: pop r15
0x64b83a: pop r14
0x64b83c: pop r12
0x64b83e: pop rdi
0x64b83f: pop rsi
0x64b840: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0xd438d0
0xd438d0: push rbx
0xd438d2: sub rsp, 0x20
0xd438d6: mov rax, qword ptr [rcx]
0xd438d9: xor r9d, r9d
0xd438dc: mov rbx, rcx
0xd438df: or byte ptr [rax + 0xb3], 0x80
0xd438e6: mov r10, qword ptr [rcx]
0xd438e9: mov r11, qword ptr [r10 + 0xa0]
0xd438f0: test r11, r11
0xd438f3: je 0x140d43906
0xd438f5: cmp qword ptr [r11 + 8], r9
0xd438f9: je 0x140d43906
0xd438fb: mov rcx, qword ptr [r10 + 0x38]
0xd438ff: call 0x143ed8480
0xd43904: jmp 0x140d43937
0xd43906: movzx edx, byte ptr [r10 + 0x94]
0xd4390e: cmp dl, 0xff
0xd43911: je 0x140d4398f
0xd43913: mov rax, qword ptr [r10 + 0x58]
0xd43917: mov rcx, qword ptr [rax + 0xb0]
0xd4391e: mov r8, qword ptr [rcx + 0xb0]
0xd43925: cmp edx, dword ptr [r8 + 8]
0xd43929: jb 0x140d43930
0xd4392b: mov rax, r9
0xd4392e: jmp 0x140d43937
0xd43930: mov rax, qword ptr [r8]
0xd43933: mov rax, qword ptr [rax + rdx*8]
0xd43937: test rax, rax
0xd4393a: je 0x140d4398f
0xd4393c: test r11, r11
0xd4393f: je 0x140d43952
0xd43941: cmp qword ptr [r11 + 8], r9
0xd43945: je 0x140d43952
0xd43947: mov rcx, qword ptr [r10 + 0x38]
0xd4394b: call 0x143ed8480
0xd43950: jmp 0x140d43988
0xd43952: movzx edx, byte ptr [r10 + 0x94]
0xd4395a: cmp dl, 0xff
0xd4395d: jne 0x140d43964
0xd4395f: mov rax, r9
0xd43962: jmp 0x140d43988
0xd43964: mov rax, qword ptr [r10 + 0x58]
0xd43968: mov rcx, qword ptr [rax + 0xb0]
0xd4396f: mov r8, qword ptr [rcx + 0xb0]
0xd43976: cmp edx, dword ptr [r8 + 8]
0xd4397a: jb 0x140d43981
0xd4397c: mov rax, r9
0xd4397f: jmp 0x140d43988
0xd43981: mov rax, qword ptr [r8]
0xd43984: mov rax, qword ptr [rax + rdx*8]
0xd43988: mov byte ptr [rax + 0x142], 1
0xd4398f: mov r10, qword ptr [rbx]
0xd43992: mov ebx, 0xffff
0xd43997: mov r11, qword ptr [r10 + 0xa0]
0xd4399e: test r11, r11
0xd439a1: je 0x140d439b4
0xd439a3: cmp qword ptr [r11 + 8], r9
0xd439a7: je 0x140d439b4
0xd439a9: mov rcx, qword ptr [r10 + 0x38]
0xd439ad: call 0x143ed8430
0xd439b2: jmp 0x140d439e9
0xd439b4: movzx edx, word ptr [r10 + 0x8a]
0xd439bc: cmp dx, bx
0xd439bf: je 0x140d43a52
0xd439c5: mov rax, qword ptr [r10 + 0x58]
0xd439c9: mov rcx, qword ptr [rax + 0xb0]
0xd439d0: mov r8, qword ptr [rcx + 0xb8]
0xd439d7: cmp edx, dword ptr [r8 + 8]
0xd439db: jb 0x140d439e2
0xd439dd: mov rax, r9
0xd439e0: jmp 0x140d439e9
0xd439e2: mov rax, qword ptr [r8]
0xd439e5: mov rax, qword ptr [rax + rdx*8]
0xd439e9: test rax, rax
0xd439ec: je 0x140d43a52
0xd439ee: test r11, r11
0xd439f1: je 0x140d43a04
0xd439f3: cmp qword ptr [r11 + 8], r9
0xd439f7: je 0x140d43a04
0xd439f9: mov rcx, qword ptr [r10 + 0x38]
0xd439fd: call 0x143ed8430
0xd43a02: jmp 0x140d43a3a
0xd43a04: movzx edx, word ptr [r10 + 0x8a]
0xd43a0c: cmp dx, bx
0xd43a0f: jne 0x140d43a16
0xd43a11: mov rax, r9
0xd43a14: jmp 0x140d43a3a
0xd43a16: mov rax, qword ptr [r10 + 0x58]
0xd43a1a: mov rcx, qword ptr [rax + 0xb0]
0xd43a21: mov r8, qword ptr [rcx + 0xb8]
0xd43a28: cmp edx, dword ptr [r8 + 8]
0xd43a2c: jb 0x140d43a33
0xd43a2e: mov rax, r9
0xd43a31: jmp 0x140d43a3a
0xd43a33: mov rax, qword ptr [r8]
0xd43a36: mov rax, qword ptr [rax + rdx*8]
0xd43a3a: mov rcx, qword ptr [rax + 0xa0]
0xd43a41: test rcx, rcx
0xd43a44: je 0x140d43a4a
0xd43a46: mov r9, qword ptr [rcx + 0x10]
0xd43a4a: mov byte ptr [r9 + 0x245], 1
0xd43a52: add rsp, 0x20
0xd43a56: pop rbx
0xd43a57: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6bd0
0xcb6bd0: push rsi
0xcb6bd2: sub rsp, 0x30
0xcb6bd6: cmp byte ptr [rcx + 0xbd], 0
0xcb6bdd: mov rsi, rcx
0xcb6be0: mov byte ptr [rcx + 0xbe], 0
0xcb6be7: jne 0x140cb6d6d
0xcb6bed: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0xcb6bd0
0xcb6bd0: push rsi
0xcb6bd2: sub rsp, 0x30
0xcb6bd6: cmp byte ptr [rcx + 0xbd], 0
0xcb6bdd: mov rsi, rcx
0xcb6be0: mov byte ptr [rcx + 0xbe], 0
0xcb6be7: jne 0x140cb6d6d
0xcb6bed: mov rax, qword ptr [rcx + 8]
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35ca0a0
0x35ca0a0: mov qword ptr [rsp + 8], rbx
0x35ca0a5: mov qword ptr [rsp + 0x10], rsi
0x35ca0aa: mov qword ptr [rsp + 0x18], rdi
0x35ca0af: push r14
0x35ca0b1: sub rsp, 0x20
0x35ca0b5: mov r8d, dword ptr [rcx + 8]
0x35ca0b9: lea rdi, [rcx + 8]
0x35ca0bd: xor eax, eax
0x35ca0bf: mov r14, rdx
0x35ca0c2: mov rbx, rcx
0x35ca0c5: test r8d, r8d
0x35ca0c8: je 0x1435ca0e1
0x35ca0ca: mov r9, qword ptr [rcx]
0x35ca0cd: mov r10d, dword ptr [rdx]
0x35ca0d0: cmp r10d, dword ptr [r9 + rax*4]
0x35ca0d4: je 0x1435ca130
0x35ca0d6: inc eax
0x35ca0d8: cmp eax, r8d
0x35ca0db: jb 0x1435ca0d0
0x35ca0dd: lea rdi, [rcx + 8]
0x35ca0e1: mov eax, dword ptr [rcx + 0xc]
0x35ca0e4: cmp eax, r8d
0x35ca0e7: ja 0x1435ca10a
0x35ca0e9: lea edx, [rax*2 + 1]
0x35ca0f0: add edx, eax
0x35ca0f2: mov eax, 1
0x35ca0f7: shr edx, 1
0x35ca0f9: cmp edx, eax
0x35ca0fb: cmovb edx, eax
0x35ca0fe: cmp r8d, edx
0x35ca101: cmova edx, r8d
0x35ca105: call 0x1403d2af0
0x35ca10a: mov eax, dword ptr [r14]
0x35ca10d: mov edx, dword ptr [rbx + 8]
0x35ca110: mov rcx, qword ptr [rbx]
0x35ca113: mov dword ptr [rcx + rdx*4], eax
0x35ca116: mov al, 1
0x35ca118: inc dword ptr [rdi]
0x35ca11a: mov rbx, qword ptr [rsp + 0x30]
0x35ca11f: mov rsi, qword ptr [rsp + 0x38]
0x35ca124: mov rdi, qword ptr [rsp + 0x40]
0x35ca129: add rsp, 0x20
0x35ca12d: pop r14
0x35ca12f: ret 
0x35ca130: cmp eax, -1
0x35ca133: je 0x1435ca0dd
0x35ca135: xor al, al
0x35ca137: jmp 0x1435ca11a
CALLEE 0x35caec0
0x35caec0: push r15
0x35caec2: sub rsp, 0x10
0x35caec6: mov eax, dword ptr [rcx + 8]
0x35caec9: mov r15, rcx
0x35caecc: mov r11d, eax
0x35caecf: shr r11d, 1
0x35caed2: je 0x1435cafb3
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0xcb6d80
0xcb6d80: push rsi
0xcb6d82: sub rsp, 0x30
0xcb6d86: cmp byte ptr [rcx + 0xbe], 0
0xcb6d8d: mov rsi, rcx
0xcb6d90: mov byte ptr [rcx + 0xbd], 0
0xcb6d97: jne 0x140cb6f5c
0xcb6d9d: mov rax, qword ptr [rcx + 8]
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
CALLEE 0x35c66a0
0x35c66a0: mov qword ptr [rsp + 0x18], rbx
0x35c66a5: push rbp
0x35c66a6: push rsi
0x35c66a7: push rdi
0x35c66a8: push r12
0x35c66aa: push r13
0x35c66ac: push r14
0x35c66ae: push r15
0x35c66b0: sub rsp, 0x160
0x35c66b7: mov rbx, rcx
0x35c66ba: mov rcx, qword ptr [rcx]
0x35c66bd: call 0x14063e140
0x35c66c2: xor r12d, r12d
0x35c66c5: mov qword ptr [rsp + 0x148], r12
0x35c66cd: mov qword ptr [rsp + 0x150], 0x105
0x35c66d9: mov dword ptr [rsp + 0x154], r12d
0x35c66e1: mov byte ptr [rsp + 0x40], r12b
0x35c66e6: mov dword ptr [rsp + 0x154], r12d
0x35c66ee: mov byte ptr [rsp + 0x40], r12b
0x35c66f3: mov rax, qword ptr [rsp + 0x148]
0x35c66fb: test rax, rax
0x35c66fe: je 0x1435c6703
0x35c6700: mov byte ptr [rax], r12b
0x35c6703: lea rdx, [rsp + 0x40]
0x35c6708: mov rcx, rbx
0x35c670b: call 0x1435ca610
0x35c6710: lea r13, [rbx + 0x10]
0x35c6714: mov dword ptr [r13 + 8], r12d
0x35c6718: xor eax, eax
0x35c671a: mov word ptr [rsp + 0x1a0], ax
0x35c6722: mov r10, qword ptr [rbx]
0x35c6725: mov rax, qword ptr [r10 + 0x58]
0x35c6729: mov rbp, qword ptr [rax + 0xb0]
0x35c6730: mov r14, qword ptr [rbx + 0x28]
0x35c6734: lea r15, [rsp + 0x40]
0x35c6739: mov rax, qword ptr [rsp + 0x148]
0x35c6741: test rax, rax
0x35c6744: cmovne r15, rax
0x35c6748: mov rax, qword ptr [r10 + 0xa0]
0x35c674f: test rax, rax
0x35c6752: je 0x1435c6769
0x35c6754: cmp qword ptr [rax + 8], 0
0x35c6759: je 0x1435c6769
0x35c675b: mov rcx, qword ptr [r10 + 0x38]
0x35c675f: call 0x143edd440
0x35c6764: mov rsi, rax
0x35c6767: jmp 0x1435c6782
0x35c6769: cmp qword ptr [r10 + 0xf8], 0
0x35c6771: jne 0x1435c677b
0x35c6773: mov rcx, r10
0x35c6776: call 0x143edca60
0x35c677b: mov rsi, qword ptr [r10 + 0xf8]
0x35c6782: mov rbp, qword ptr [rbp + 0x18]
0x35c6786: mov rdi, qword ptr [r14 + 0x20]
0x35c678a: test rdi, rdi
0x35c678d: je 0x1435c67d5
0x35c678f: mov qword ptr [rsp + 0x1a8], rdi
0x35c6797: mov rax, qword ptr [rdi]
0x35c679a: mov rcx, rdi
0x35c679d: call qword ptr [rax + 8]
0x35c67a0: nop 
0x35c67a1: lea rax, [rsp + 0x1a0]
0x35c67a9: mov qword ptr [rsp + 0x30], rax
0x35c67ae: mov qword ptr [rsp + 0x28], r13
0x35c67b3: mov byte ptr [rsp + 0x20], 1
0x35c67b8: mov r9, r15
0x35c67bb: mov r8, rsi
0x35c67be: mov rdx, rbp
0x35c67c1: mov rcx, r14
0x35c67c4: call 0x1435403e0
0x35c67c9: nop 
0x35c67ca: mov rax, qword ptr [rdi]
0x35c67cd: mov rcx, rdi
0x35c67d0: call qword ptr [rax + 0x10]
0x35c67d3: jmp 0x1435c67fd
0x35c67d5: lea rax, [rsp + 0x1a0]
0x35c67dd: mov qword ptr [rsp + 0x30], rax
0x35c67e2: mov qword ptr [rsp + 0x28], r13
0x35c67e7: mov byte ptr [rsp + 0x20], 0
0x35c67ec: mov r9, r15
0x35c67ef: mov r8, rsi
0x35c67f2: mov rdx, rbp
0x35c67f5: mov rcx, r14
0x35c67f8: call 0x1435403e0
0x35c67fd: mov rcx, qword ptr [rbx]
0x35c6800: movzx eax, byte ptr [rcx + 0xb1]
0x35c6807: movzx esi, al
0x35c680a: and sil, 1
0x35c680e: and al, 0xfe
0x35c6810: mov byte ptr [rcx + 0xb1], al
0x35c6816: movzx edi, byte ptr [rsp + 0x1a0]
0x35c681e: and edi, 0x10
0x35c6821: setne dl
0x35c6824: mov rcx, qword ptr [rbx]
0x35c6827: call 0x1435c6950
0x35c682c: test byte ptr [rsp + 0x1a1], 1
0x35c6834: je 0x1435c6867
0x35c6836: test edi, edi
0x35c6838: jne 0x1435c6857
0x35c683a: mov rax, qword ptr [rbx]
0x35c683d: mov rcx, qword ptr [rax + 0xa0]
0x35c6844: test rcx, rcx
0x35c6847: je 0x1435c6850
0x35c6849: cmp qword ptr [rcx + 8], 0
0x35c684e: jne 0x1435c6857
0x35c6850: or byte ptr [rax + 0x97], 2
0x35c6857: mov rcx, qword ptr [rbx]
0x35c685a: xor edx, edx
0x35c685c: mov rcx, qword ptr [rcx + 0x18]
0x35c6860: call 0x1435b6460
0x35c6865: jmp 0x1435c686f
0x35c6867: mov rcx, qword ptr [rbx]
0x35c686a: call 0x143ed9150
0x35c686f: xor r8d, r8d
0x35c6872: xor edx, edx
0x35c6874: mov rcx, qword ptr [rbx]
0x35c6877: call 0x143ed9270
0x35c687c: test sil, sil
0x35c687f: je 0x1435c68f7
0x35c6881: mov rdx, qword ptr [rbx]
0x35c6884: mov rax, qword ptr [rdx + 0x28]
0x35c6888: mov rcx, qword ptr [rax + 0x10]
0x35c688c: mov rax, qword ptr [rax + 8]
0x35c6890: mov r8, qword ptr [rax + 0xa0]
0x35c6897: test r8, r8
0x35c689a: je 0x1435c68f7
0x35c689c: cmp qword ptr [r8 + 8], 0
0x35c68a1: jne 0x1435c68f7
0x35c68a3: test rcx, rcx
0x35c68a6: je 0x1435c68f7
0x35c68a8: mov rax, qword ptr [rcx + 0x30]
0x35c68ac: test rax, rax
0x35c68af: je 0x1435c68bd
0x35c68b1: cmp byte ptr [rax + 0x28], 0
0x35c68b5: jne 0x1435c68f0
0x35c68b7: cmp dword ptr [rax + 0x20], -1
0x35c68bb: jne 0x1435c68f0
0x35c68bd: mov rax, qword ptr [rcx + 0x18]
0x35c68c1: test rax, rax
0x35c68c4: je 0x1435c68db
0x35c68c6: test byte ptr [rax + 0x6c], 4
0x35c68ca: jne 0x1435c68f0
0x35c68cc: cmp byte ptr [rip + 0x37a05f5], 0
0x35c68d3: je 0x1435c68db
0x35c68d5: cmp byte ptr [rcx + 0x4d], 0
0x35c68d9: jne 0x1435c68f0
0x35c68db: mov rax, qword ptr [rcx + 0x28]
0x35c68df: test rax, rax
0x35c68e2: je 0x1435c68f7
0x35c68e4: test byte ptr [rax + 0x42], 2
0x35c68e8: jne 0x1435c68f7
0x35c68ea: cmp byte ptr [rax + 0x22], 1
0x35c68ee: jne 0x1435c68f7
0x35c68f0: or byte ptr [rdx + 0xb1], 1
0x35c68f7: mov rcx, qword ptr [rsp + 0x148]
0x35c68ff: test rcx, rcx
0x35c6902: je 0x1435c6931
0x35c6904: mov r8d, 0x1fd
0x35c690a: mov rax, qword ptr gs:[0x58]
0x35c6913: mov rdx, qword ptr [rax]
0x35c6916: cmp byte ptr [r8 + rdx], 0
0x35c691b: je 0x1435c6924
0x35c691d: call 0x1447f03bc
0x35c6922: jmp 0x1435c6929
0x35c6924: call 0x1447f02bc
0x35c6929: mov qword ptr [rsp + 0x148], r12
0x35c6931: mov rbx, qword ptr [rsp + 0x1b0]
0x35c6939: add rsp, 0x160
0x35c6940: pop r15
0x35c6942: pop r14
0x35c6944: pop r13
0x35c6946: pop r12
0x35c6948: pop rdi
0x35c6949: pop rsi
0x35c694a: pop rbp
0x35c694b: ret 
