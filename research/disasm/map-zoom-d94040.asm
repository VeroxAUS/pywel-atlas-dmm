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
0xd940c7: vsubss xmm2, xmm0, dword ptr [rip + 0x5f17919]  ; [0x6cab9e8] = runtime global (no file value)
0xd940cf: vmovss xmm0, dword ptr [rip + 0x5f179b1]  ; [0x6caba88] = runtime global (no file value)
0xd940d7: vsubss xmm1, xmm0, dword ptr [rip + 0x5f17909]  ; [0x6cab9e8] = runtime global (no file value)
0xd940df: vdivss xmm3, xmm2, xmm1
0xd940e3: vmovss xmm2, dword ptr [rip + 0x4fdefc9]  ; [0x5d730b4] = 1 (0x3f800000)
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
0xd94149: lea r13, [rip + 0x47f9500]  ; [0x558d650] = 3.52647 (0x4061b1c0)
0xd94150: mov r15d, 0xffff
0xd94156: vxorps xmm11, xmm11, xmm11
0xd9415b: vmovss xmm12, dword ptr [rip + 0x4fdf22d]  ; [0x5d73390] = 3.14159 (0x40490fdb)
0xd94163: vmovss xmm13, dword ptr [rip + 0x4fdedc9]  ; [0x5d72f34] = 0.5 (0x3f000000)
0xd9416b: vmovss xmm15, dword ptr [rip + 0x4fdf70d]  ; [0x5d73880] = -1.19209e-07 (0xb4000000)
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
0xd9420f: lea rdx, [rip + 0x5f3beba]  ; [0x6cd00d0] = runtime global (no file value)
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
0xd942d8: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf414]  ; [0x5d736f4] = 1000 (0x447a0000)
0xd942e0: vaddss xmm8, xmm1, dword ptr [rax + 8]
0xd942e5: vmovss xmm6, dword ptr [rax + 4]
0xd942ea: movsx ecx, word ptr [rax + 0xc]
0xd942ee: vxorps xmm0, xmm0, xmm0
0xd942f2: vcvtsi2ss xmm0, xmm0, ecx
0xd942f6: vmulss xmm1, xmm0, dword ptr [rip + 0x4fdf3f6]  ; [0x5d736f4] = 1000 (0x447a0000)
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
0xd9436d: lea rax, [rip + 0x47e0114]  ; [0x5574488] = 2.89929 (0x40398df0)
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
0xd94461: mov r8, qword ptr [rip + 0x5fd50c0]  ; [0x6d69528] = runtime global (no file value)
0xd94468: mov rax, r8
0xd9446b: mov r10, qword ptr [rip + 0x5fd50be]  ; [0x6d69530] = runtime global (no file value)
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
0xd944f1: vmulss xmm2, xmm0, dword ptr [rip + 0x4fdf053]  ; [0x5d7354c] = 57.2958 (0x42652ee1)
0xd944f9: movzx edx, byte ptr [rsi + r14]
0xd944fe: mov r10, qword ptr [rip + 0x5fd502b]  ; [0x6d69530] = runtime global (no file value)
0xd94505: mov r8, qword ptr [rip + 0x5fd501c]  ; [0x6d69528] = runtime global (no file value)
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
0xd9456b: vmovss xmm3, dword ptr [rip + 0x5f1a295]  ; [0x6cae808] = runtime global (no file value)
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
0xd9463c: lea rax, [rip + 0x4991805]  ; [0x5725e48] = 12.205 (0x414347d0)
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
0xd94763: mov eax, dword ptr [rip + 0x5f3bcfb]  ; [0x6cd0464] = runtime global (no file value)
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
0xd947c0: mov eax, dword ptr [rip + 0x5f3bc9e]  ; [0x6cd0464] = runtime global (no file value)
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
0xd94994: mov eax, dword ptr [rip + 0x5f3baca]  ; [0x6cd0464] = runtime global (no file value)
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
0xd94a2f: mov eax, dword ptr [rip + 0x5f3ba2f]  ; [0x6cd0464] = runtime global (no file value)
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
0xd94abf: lea rbx, [rip + 0x5ef86ba]  ; [0x6c8d180] = runtime global (no file value)
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
0xd94bd9: mov eax, dword ptr [rip + 0x5f3b885]  ; [0x6cd0464] = runtime global (no file value)
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
0xd94c4e: mov eax, dword ptr [rip + 0x5f3b810]  ; [0x6cd0464] = runtime global (no file value)
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
0xd94c7d: mov rax, qword ptr [rip + 0x5fd48a4]  ; [0x6d69528] = runtime global (no file value)
0xd94c84: cmp byte ptr [r14 + rsi], 0
0xd94c89: cmovne rax, qword ptr [rip + 0x5fd489f]  ; [0x6d69530] = runtime global (no file value)
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
0xd94d4f: mov rax, qword ptr [rip + 0x5fd47d2]  ; [0x6d69528] = runtime global (no file value)
0xd94d56: cmp byte ptr [r14 + rsi], 0
0xd94d5b: cmovne rax, qword ptr [rip + 0x5fd47cd]  ; [0x6d69530] = runtime global (no file value)
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
0xd94eed: mov rdx, qword ptr [rip + 0x5fd4634]  ; [0x6d69528] = runtime global (no file value)
0xd94ef4: mov r8, qword ptr [rip + 0x5fd4635]  ; [0x6d69530] = runtime global (no file value)
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
0xd94f90: mov r8, qword ptr [rip + 0x5fd4599]  ; [0x6d69530] = runtime global (no file value)
0xd94f97: mov rdx, qword ptr [rip + 0x5fd458a]  ; [0x6d69528] = runtime global (no file value)
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
0xd9506e: vmovss xmm1, dword ptr [rip + 0x5f16c42]  ; [0x6cabcb8] = runtime global (no file value)
0xd95076: vcmpltss xmm0, xmm8, xmm1
0xd9507b: vblendvps xmm6, xmm6, xmm1, xmm0
0xd95081: vmovss xmm0, dword ptr [rip + 0x5f169af]  ; [0x6caba38] = runtime global (no file value)
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
0xd95135: cmp byte ptr [rip + 0x5fd1b9c], 0  ; [0x6d66cd8] = runtime global (no file value)
0xd9513c: je 0x140d95168
0xd9513e: vsubss xmm0, xmm14, xmm11
0xd95143: vmovss xmm1, dword ptr [rip + 0x4fddaa1]  ; [0x5d72bec] = 1.19209e-07 (0x34000000)
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
0xd951f6: vcomiss xmm0, dword ptr [rip + 0x5f48e4a]  ; [0x6cde048] = runtime global (no file value)
0xd951fe: seta r14b
0xd95202: mov byte ptr [rbp + 0x978], r14b
0xd95209: mov rax, qword ptr [rbp + 0x990]
0xd95210: vmovss xmm0, dword ptr [rax + 4]
0xd95215: vcomiss xmm0, dword ptr [rip + 0x5f48e2b]  ; [0x6cde048] = runtime global (no file value)
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
0xd952e3: mov rcx, qword ptr [rip + 0x5fd3efe]  ; [0x6d691e8] = runtime global (no file value)
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
0xd953f8: vcomiss xmm0, dword ptr [rip + 0x5f166d8]  ; [0x6cabad8] = runtime global (no file value)
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
0xd95430: mov eax, dword ptr [rip + 0x5f3abf2]  ; [0x6cd0028] = runtime global (no file value)
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
0xd955a5: lea rdx, [rip + 0x5f3aa5c]  ; [0x6cd0008] = runtime global (no file value)
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
0xd955e9: lea rdx, [rip + 0x5f3aa18]  ; [0x6cd0008] = runtime global (no file value)
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
0xd95649: lea rdx, [rip + 0x5f3a9a8]  ; [0x6ccfff8] = runtime global (no file value)
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
0xd956d4: cmp dword ptr [rip + 0x5f3acb5], 0  ; [0x6cd0390] = runtime global (no file value)
0xd956db: je 0x140d9573b
0xd956dd: lea rdx, [rip + 0x5f3acac]  ; [0x6cd0390] = runtime global (no file value)
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
0xd9570d: cmp dword ptr [rip + 0x5f3ac80], 0  ; [0x6cd0394] = runtime global (no file value)
0xd95714: je 0x140d9573b
0xd95716: lea rdx, [rip + 0x5f3ac77]  ; [0x6cd0394] = runtime global (no file value)
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
0xd95764: vmovss xmm0, dword ptr [rip + 0x5f162cc]  ; [0x6caba38] = runtime global (no file value)
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
0xd957ad: lea rdx, [rip + 0x5f3a844]  ; [0x6ccfff8] = runtime global (no file value)
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
0xd957e8: lea rdx, [rip + 0x5f3a809]  ; [0x6ccfff8] = runtime global (no file value)
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
0xd95839: vmulss xmm2, xmm1, dword ptr [rip + 0x5f16387]  ; [0x6cabbc8] = runtime global (no file value)
0xd95841: jmp 0x140d958d4
0xd95846: test rcx, rcx
0xd95849: je 0x140d95852
0xd9584b: cmp qword ptr [rcx + 8], 0
0xd95850: jne 0x140d95880
0xd95852: cmp dword ptr [rip + 0x5f3a79f], 0  ; [0x6ccfff8] = runtime global (no file value)
0xd95859: je 0x140d95880
0xd9585b: lea rdx, [rip + 0x5f3a796]  ; [0x6ccfff8] = runtime global (no file value)
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
0xd9589e: cmp dword ptr [rip + 0x5f3a753], 0  ; [0x6ccfff8] = runtime global (no file value)
0xd958a5: je 0x140d958cc
0xd958a7: lea rdx, [rip + 0x5f3a74a]  ; [0x6ccfff8] = runtime global (no file value)
0xd958ae: mov rcx, qword ptr [rbx + 8]
0xd958b2: call 0x1435ca0a0
0xd958b7: test al, al
0xd958b9: je 0x140d958cc
0xd958bb: mov rcx, qword ptr [rbx + 8]
0xd958bf: call 0x1435caec0
0xd958c4: mov rcx, rbx
0xd958c7: call 0x1435c66a0
0xd958cc: vmulss xmm2, xmm6, dword ptr [rip + 0x4fdda74]  ; [0x5d73348] = 2.5 (0x40200000)
0xd958d4: vmovss dword ptr [rsp + 0x48], xmm2
0xd958da: mov rax, qword ptr [r14 + 8]
0xd958de: mov rcx, qword ptr [rax + 0x20]
0xd958e2: mov byte ptr [rsp + 0x51], 0
0xd958e7: vxorps xmm0, xmm2, xmmword ptr [rip + 0x4fe0461]  ; [0x5d75d50] = -0 (0x80000000)
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
0xd959a7: vmovss xmm0, dword ptr [rip + 0x5f16089]  ; [0x6caba38] = runtime global (no file value)
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
0xd95a1b: cmp dword ptr [rip + 0x5f3a5d6], 0  ; [0x6ccfff8] = runtime global (no file value)
0xd95a22: je 0x140d95a50
0xd95a24: lea rdx, [rip + 0x5f3a5cd]  ; [0x6ccfff8] = runtime global (no file value)
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
0xd95af1: lea rdx, [rip + 0x5f395c8]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95b34: lea rdx, [rip + 0x5f39585]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95b88: lea rdx, [rip + 0x5f3a801]  ; [0x6cd0390] = runtime global (no file value)
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
0xd95bc6: lea rdx, [rip + 0x5f3a7c7]  ; [0x6cd0394] = runtime global (no file value)
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
0xd95c29: cmp dword ptr [rip + 0x5f39490], 0  ; [0x6ccf0c0] = runtime global (no file value)
0xd95c30: je 0x140d95c57
0xd95c32: lea rdx, [rip + 0x5f39487]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95c85: cmp dword ptr [rip + 0x5f39434], 0  ; [0x6ccf0c0] = runtime global (no file value)
0xd95c8c: je 0x140d95b51
0xd95c92: lea rdx, [rip + 0x5f39427]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95cd7: cmp dword ptr [rip + 0x5f393e2], 0  ; [0x6ccf0c0] = runtime global (no file value)
0xd95cde: je 0x140d95d05
0xd95ce0: lea rdx, [rip + 0x5f393d9]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95d2b: cmp dword ptr [rip + 0x5f3938e], 0  ; [0x6ccf0c0] = runtime global (no file value)
0xd95d32: je 0x140d95d59
0xd95d34: lea rdx, [rip + 0x5f39385]  ; [0x6ccf0c0] = runtime global (no file value)
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
0xd95da4: lea rdx, [rip + 0x5f3a5e5]  ; [0x6cd0390] = runtime global (no file value)
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
0xd95de2: lea rdx, [rip + 0x5f3a5ab]  ; [0x6cd0394] = runtime global (no file value)
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
0xd95e3f: lea r13, [rip + 0x47f780a]  ; [0x558d650] = 3.52647 (0x4061b1c0)
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
0xd95ea9: int3 