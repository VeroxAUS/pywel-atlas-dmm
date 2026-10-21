0x2941020: mov qword ptr [rsp + 8], rbx
0x2941025: mov dword ptr [rsp + 0x20], r9d
0x294102a: mov qword ptr [rsp + 0x18], r8
0x294102f: push rbp
0x2941030: push rsi
0x2941031: push rdi
0x2941032: push r12
0x2941034: push r13
0x2941036: push r14
0x2941038: push r15
0x294103a: lea rbp, [rsp - 0x27]
0x294103f: sub rsp, 0xc0
0x2941046: mov r15, rdx
0x2941049: mov r14, qword ptr [rcx + 8]
0x294104d: mov rdi, qword ptr [r14 + 0x78]
0x2941051: mov r12d, dword ptr [r14 + 0x80]
0x2941058: shl r12, 4
0x294105c: add r12, rdi
0x294105f: cmp rdi, r12
0x2941062: je 0x1429410a5
0x2941064: nop dword ptr [rax]
0x2941068: nop dword ptr [rax + rax]
0x2941070: mov rsi, qword ptr [rdi]
0x2941073: movzx eax, word ptr [rdi + 8]
0x2941077: mov word ptr [rbp + 0x7f], ax
0x294107b: cmp byte ptr [rsi + 0x12], 0
0x294107f: jne 0x14294109c
0x2941081: mov rax, qword ptr [rsi]
0x2941084: lea rdx, [rbp + 0x77]
0x2941088: mov rcx, rsi
0x294108b: call qword ptr [rax + 0x68]
0x294108e: mov ebx, dword ptr [rax]
0x2941090: test ebx, ebx
0x2941092: jne 0x142941137
0x2941098: mov byte ptr [rsi + 0x12], 1
0x294109c: add rdi, 0x10
0x29410a0: cmp rdi, r12
0x29410a3: jne 0x142941070
0x29410a5: mov rax, qword ptr [r14 + 0x68]
0x29410a9: mov rdi, qword ptr [rax + 0x110]
0x29410b0: movzx ebx, word ptr [rdi + 0xe0]
0x29410b7: call 0x141303de0
0x29410bc: lea rdx, [rip + 0x2c4b985]
0x29410c3: mov rcx, rax
0x29410c6: call 0x1413037b0
0x29410cb: mov esi, 0x1ec
0x29410d0: mov r12d, 0xffff
0x29410d6: test rax, rax
0x29410d9: je 0x1429410e0
0x29410db: cmp byte ptr [rax], 0
0x29410de: jne 0x1429410fe
0x29410e0: call 0x141303de0
0x29410e5: lea rdx, [rip + 0x2c4b944]
0x29410ec: mov rcx, rax
0x29410ef: call 0x1413037b0
0x29410f4: test rax, rax
0x29410f7: je 0x14294115d
0x29410f9: cmp byte ptr [rax], 0
0x29410fc: je 0x14294115d
0x29410fe: mov rax, qword ptr gs:[0x58]
0x2941107: mov rcx, qword ptr [rax]
0x294110a: mov r8, qword ptr [rip + 0x4428417]
0x2941111: mov rdx, r8
0x2941114: mov r9, qword ptr [rip + 0x4428415]
0x294111b: cmp byte ptr [rsi + rcx], 0
0x294111f: cmovne rdx, r9
0x2941123: mov rax, qword ptr [rdx]
0x2941126: mov rcx, qword ptr [rax + 8]
0x294112a: mov rbx, qword ptr [rcx + 0x28]
0x294112e: movzx ebx, word ptr [rbx + 0x100]
0x2941135: jmp 0x142941185
0x2941137: lea rax, [rbp + 0x7f]
0x294113b: mov qword ptr [rsp + 0x60], rax
0x2941140: lea rax, [rip + 0x2c457d9]
0x2941147: mov qword ptr [rsp + 0x58], rax
0x294114c: mov dword ptr [rsp + 0x48], ebx
0x2941150: call 0x14050d2d0
0x2941155: mov dword ptr [r15], ebx
0x2941158: jmp 0x1429415bd
0x294115d: mov rax, qword ptr [rip + 0x4428544]
0x2941164: mov rax, qword ptr [rax + 0x10]
0x2941168: movzx eax, word ptr [rax + 0x7c]
0x294116c: cmp ax, r12w
0x2941170: je 0x142941177
0x2941172: movzx ebx, ax
0x2941175: jmp 0x1429411b1
0x2941177: mov r9, qword ptr [rip + 0x44283b2]
0x294117e: mov r8, qword ptr [rip + 0x44283a3]
0x2941185: cmp bx, r12w
0x2941189: jne 0x1429411b1
0x294118b: mov rax, qword ptr gs:[0x58]
0x2941194: mov rcx, qword ptr [rax]
0x2941197: cmp byte ptr [rsi + rcx], 0
0x294119b: cmovne r8, r9
0x294119f: mov rax, qword ptr [r8]
0x29411a2: mov rcx, qword ptr [rax + 8]
0x29411a6: mov rbx, qword ptr [rcx + 0x28]
0x29411aa: movzx ebx, word ptr [rbx + 0x100]
0x29411b1: mov word ptr [rdi + 0xe0], bx
0x29411b8: mov rcx, qword ptr [r14 + 0x68]
0x29411bc: mov rcx, qword ptr [rcx + 0x1a0]
0x29411c3: call 0x142bc2d00
0x29411c8: lea rbx, [r14 + 0x18]
0x29411cc: mov qword ptr [rbp + 0x77], rbx
0x29411d0: mov rax, qword ptr [rbx]
0x29411d3: mov rcx, rbx
0x29411d6: call qword ptr [rax + 8]
0x29411d9: nop 
0x29411da: lea rdx, [r14 + 8]
0x29411de: xor r13d, r13d
0x29411e1: test r14, r14
0x29411e4: cmove rdx, r13
0x29411e8: mov r8b, 1
0x29411eb: mov rdx, qword ptr [rdx]
0x29411ee: lea rcx, [rbp - 0x29]
0x29411f2: call 0x140393650
0x29411f7: nop 
0x29411f8: movzx eax, word ptr [r14 + 0x5e]
0x29411fd: mov edi, 8
0x2941202: cmp di, ax
0x2941205: je 0x14294137e
0x294120b: cmp ax, 1
0x294120f: je 0x14294126f
0x2941211: mov eax, dword ptr [rip + 0x439a719]
0x2941217: test eax, eax
0x2941219: je 0x14294126f
0x294121b: mov dword ptr [r15], eax
0x294121e: mov rdi, qword ptr [rbp - 0x29]
0x2941222: mov rax, qword ptr [rdi]
0x2941225: xor edx, edx
0x2941227: mov rcx, rdi
0x294122a: call qword ptr [rax + 0x20]
0x294122d: cmp byte ptr [rbp - 0x21], 1
0x2941231: jne 0x142941261
0x2941233: mov eax, 0xffffffff
0x2941238: lock xadd dword ptr [rdi + 8], eax
0x294123d: cmp eax, 1
0x2941240: jne 0x142941254
0x2941242: test dword ptr [rdi + 0xc], 0x40000000
0x2941249: je 0x142941261
0x294124b: mov rax, qword ptr [rdi]
0x294124e: mov rcx, rdi
0x2941251: call qword ptr [rax + 0x40]
0x2941254: test dword ptr [rdi + 0xc], 0x40000000
0x294125b: je 0x142941261
0x294125d: lock dec dword ptr [rdi + 0xc]
0x2941261: mov rax, qword ptr [rbx]
0x2941264: mov rcx, rbx
0x2941267: call qword ptr [rax + 0x10]
0x294126a: jmp 0x1429415bd
0x294126f: mov rax, qword ptr [r14]
0x2941272: mov rcx, r14
0x2941275: call qword ptr [rax + 0x60]
0x2941278: cmp word ptr [r14 + 0x5e], 2
0x294127e: je 0x1429412de
0x2941280: mov eax, dword ptr [rip + 0x439a6a2]
0x2941286: test eax, eax
0x2941288: je 0x1429412de
0x294128a: mov dword ptr [r15], eax
0x294128d: mov rdi, qword ptr [rbp - 0x29]
0x2941291: mov rax, qword ptr [rdi]
0x2941294: xor edx, edx
0x2941296: mov rcx, rdi
0x2941299: call qword ptr [rax + 0x20]
0x294129c: cmp byte ptr [rbp - 0x21], 1
0x29412a0: jne 0x1429412d0
0x29412a2: mov eax, 0xffffffff
0x29412a7: lock xadd dword ptr [rdi + 8], eax
0x29412ac: cmp eax, 1
0x29412af: jne 0x1429412c3
0x29412b1: test dword ptr [rdi + 0xc], 0x40000000
0x29412b8: je 0x1429412d0
0x29412ba: mov rax, qword ptr [rdi]
0x29412bd: mov rcx, rdi
0x29412c0: call qword ptr [rax + 0x40]
0x29412c3: test dword ptr [rdi + 0xc], 0x40000000
0x29412ca: je 0x1429412d0
0x29412cc: lock dec dword ptr [rdi + 0xc]
0x29412d0: mov rax, qword ptr [rbx]
0x29412d3: mov rcx, rbx
0x29412d6: call qword ptr [rax + 0x10]
0x29412d9: jmp 0x1429415bd
0x29412de: mov rax, qword ptr [r14]
0x29412e1: mov rcx, r14
0x29412e4: call qword ptr [rax + 0x68]
0x29412e7: cmp word ptr [r14 + 0x5e], 4
0x29412ed: je 0x14294134d
0x29412ef: mov eax, dword ptr [rip + 0x439a637]
0x29412f5: test eax, eax
0x29412f7: je 0x14294134d
0x29412f9: mov dword ptr [r15], eax
0x29412fc: mov rdi, qword ptr [rbp - 0x29]
0x2941300: mov rax, qword ptr [rdi]
0x2941303: xor edx, edx
0x2941305: mov rcx, rdi
0x2941308: call qword ptr [rax + 0x20]
0x294130b: cmp byte ptr [rbp - 0x21], 1
0x294130f: jne 0x14294133f
0x2941311: mov eax, 0xffffffff
0x2941316: lock xadd dword ptr [rdi + 8], eax
0x294131b: cmp eax, 1
0x294131e: jne 0x142941332
0x2941320: test dword ptr [rdi + 0xc], 0x40000000
0x2941327: je 0x14294133f
0x2941329: mov rax, qword ptr [rdi]
0x294132c: mov rcx, rdi
0x294132f: call qword ptr [rax + 0x40]
0x2941332: test dword ptr [rdi + 0xc], 0x40000000
0x2941339: je 0x14294133f
0x294133b: lock dec dword ptr [rdi + 0xc]
0x294133f: mov rax, qword ptr [rbx]
0x2941342: mov rcx, rbx
0x2941345: call qword ptr [rax + 0x10]
0x2941348: jmp 0x1429415bd
0x294134d: call 0x141439540
0x2941352: mov rcx, qword ptr [rax]
0x2941355: test rcx, rcx
0x2941358: je 0x142941371
0x294135a: cmp qword ptr [rcx + 8], 0
0x294135f: je 0x142941371
0x2941361: call 0x141439540
0x2941366: mov rcx, qword ptr [rax + 8]
0x294136a: lock inc dword ptr [rcx + 0xb0]
0x2941371: cmp word ptr [r14 + 0x5e], 4
0x2941377: jne 0x14294137e
0x2941379: mov word ptr [r14 + 0x5e], di
0x294137e: mov rdi, qword ptr [rbp - 0x29]
0x2941382: mov rax, qword ptr [rdi]
0x2941385: xor edx, edx
0x2941387: mov rcx, rdi
0x294138a: call qword ptr [rax + 0x20]
0x294138d: cmp byte ptr [rbp - 0x21], 1
0x2941391: jne 0x1429413c1
0x2941393: mov eax, 0xffffffff
0x2941398: lock xadd dword ptr [rdi + 8], eax
0x294139d: cmp eax, 1
0x29413a0: jne 0x1429413b4
0x29413a2: test dword ptr [rdi + 0xc], 0x40000000
0x29413a9: je 0x1429413c1
0x29413ab: mov rax, qword ptr [rdi]
0x29413ae: mov rcx, rdi
0x29413b1: call qword ptr [rax + 0x40]
0x29413b4: test dword ptr [rdi + 0xc], 0x40000000
0x29413bb: je 0x1429413c1
0x29413bd: lock dec dword ptr [rdi + 0xc]
0x29413c1: mov rax, qword ptr [rbx]
0x29413c4: mov rcx, rbx
0x29413c7: call qword ptr [rax + 0x10]
0x29413ca: mov rdi, qword ptr [r14 + 0x78]
0x29413ce: mov r12d, dword ptr [r14 + 0x80]
0x29413d5: shl r12, 4
0x29413d9: add r12, rdi
0x29413dc: cmp rdi, r12
0x29413df: je 0x14294140d
0x29413e1: mov rcx, qword ptr [rdi]
0x29413e4: movzx eax, word ptr [rdi + 8]
0x29413e8: mov word ptr [rbp + 0x7f], ax
0x29413ec: cmp word ptr [r14 + 0x5e], 0x10
0x29413f2: je 0x142941464
0x29413f4: mov rax, qword ptr [rcx]
0x29413f7: lea rdx, [rbp + 0x77]
0x29413fb: call qword ptr [rax + 0x78]
0x29413fe: mov esi, dword ptr [rax]
0x2941400: test esi, esi
0x2941402: jne 0x14294143e
0x2941404: add rdi, 0x10
0x2941408: cmp rdi, r12
0x294140b: jne 0x1429413e1
0x294140d: mov qword ptr [rbp + 0x77], rbx
0x2941411: mov rax, qword ptr [rbx]
0x2941414: mov rcx, rbx
0x2941417: call qword ptr [rax + 8]
0x294141a: nop 
0x294141b: cmp word ptr [r14 + 0x5e], 8
0x2941421: je 0x142941476
0x2941423: mov edi, dword ptr [rip + 0x439a503]
0x2941429: test edi, edi
0x294142b: je 0x142941476
0x294142d: mov rax, qword ptr [rbx]
0x2941430: mov rcx, rbx
0x2941433: call qword ptr [rax + 0x10]
0x2941436: mov dword ptr [r15], edi
0x2941439: jmp 0x1429415bd
0x294143e: lea rax, [rbp + 0x7f]
0x2941442: mov qword ptr [rsp + 0x60], rax
0x2941447: lea rax, [rip + 0x2fcd252]
0x294144e: mov qword ptr [rsp + 0x58], rax
0x2941453: mov dword ptr [rsp + 0x48], esi
0x2941457: call 0x14050d2d0
0x294145c: mov dword ptr [r15], esi
0x294145f: jmp 0x1429415bd
0x2941464: mov esi, dword ptr [rip + 0x439a4be]
0x294146a: test esi, esi
0x294146c: je 0x14294140d
0x294146e: mov dword ptr [r15], esi
0x2941471: jmp 0x1429415bd
0x2941476: mov rax, qword ptr [r14]
0x2941479: mov rcx, r14
0x294147c: call qword ptr [rax + 0x78]
0x294147f: nop 
0x2941480: mov rax, qword ptr [rbx]
0x2941483: mov rcx, rbx
0x2941486: call qword ptr [rax + 0x10]
0x2941489: mov rdx, r14
0x294148c: call 0x1429415e0
0x2941491: mov rax, qword ptr [r14 + 0x68]
0x2941495: mov rbx, qword ptr [rax + 0x1a0]
0x294149c: xor edx, edx
0x294149e: mov rcx, rbx
0x29414a1: call 0x142bcbc00
0x29414a6: mov dword ptr [rbp - 0x19], r13d
0x29414aa: mov eax, 0xffff
0x29414af: mov word ptr [rbp - 0x15], ax
0x29414b3: vxorps xmm0, xmm0, xmm0
0x29414b7: vmovups xmmword ptr [rbp - 0x11], xmm0
0x29414bc: mov dword ptr [rbp - 1], 0
0x29414c3: mov byte ptr [rbp + 3], 0
0x29414c7: mov dword ptr [rbp + 7], r13d
0x29414cb: mov qword ptr [rbp + 0xf], r13
0x29414cf: mov qword ptr [rbp + 0x17], r13
0x29414d3: mov rax, qword ptr [rbx + 8]
0x29414d7: lea rdx, [rax + 8]
0x29414db: test rax, rax
0x29414de: cmove rdx, r13
0x29414e2: mov rdx, qword ptr [rdx]
0x29414e5: lea rcx, [rbp + 0x77]
0x29414e9: call 0x140393df0
0x29414ee: nop 
0x29414ef: add rbx, 0x4f0
0x29414f6: mov eax, dword ptr [rbx + 0x60]
0x29414f9: mov dword ptr [rbp - 0x19], eax
0x29414fc: movzx eax, word ptr [rbx + 0x64]
0x2941500: mov word ptr [rbp - 0x15], ax
0x2941504: vmovsd xmm0, qword ptr [rbx + 0x68]
0x2941509: vmovsd qword ptr [rbp - 0x11], xmm0
0x294150e: mov eax, dword ptr [rbx + 0x70]
0x2941511: mov dword ptr [rbp - 9], eax
0x2941514: vmovss xmm0, dword ptr [rbx + 0x74]
0x2941519: vmovss dword ptr [rbp - 5], xmm0
0x294151e: movzx eax, byte ptr [rbx + 0x78]
0x2941522: mov byte ptr [rbp - 1], al
0x2941525: movzx eax, byte ptr [rbx + 0x79]
0x2941529: mov byte ptr [rbp], al
0x294152c: movzx eax, byte ptr [rbx + 0x7a]
0x2941530: mov byte ptr [rbp + 1], al
0x2941533: movzx eax, byte ptr [rbx + 0x7b]
0x2941537: mov byte ptr [rbp + 2], al
0x294153a: movzx eax, byte ptr [rbx + 0x7c]
0x294153e: mov byte ptr [rbp + 3], al
0x2941541: mov eax, dword ptr [rbx + 0x80]
0x2941547: mov dword ptr [rbp + 7], eax
0x294154a: lea rdx, [rbx + 0x88]
0x2941551: lea rcx, [rbp + 0xf]
0x2941555: call 0x142bd2f60
0x294155a: nop 
0x294155b: mov rcx, qword ptr [rbp + 0x77]
0x294155f: mov rax, qword ptr [rcx]
0x2941562: mov dl, 1
0x2941564: call qword ptr [rax + 0x20]
0x2941567: lea r8, [rbp - 0x19]
0x294156b: lea rdx, [rbp + 0x7f]
0x294156f: mov rcx, rbx
0x2941572: call 0x142bbf630
0x2941577: nop 
0x2941578: mov rcx, qword ptr [rbp + 0xf]
0x294157c: test rcx, rcx
0x294157f: je 0x1429415a6
0x2941581: mov r8d, 0x1fd
0x2941587: mov rax, qword ptr gs:[0x58]
0x2941590: mov rdx, qword ptr [rax]
0x2941593: cmp byte ptr [r8 + rdx], 0
0x2941598: je 0x1429415a1
0x294159a: call 0x1447f03bc
0x294159f: jmp 0x1429415a6
0x29415a1: call 0x1447f02bc
0x29415a6: mov qword ptr [rbp + 0xf], r13
0x29415aa: mov qword ptr [rbp + 0x17], r13
0x29415ae: mov eax, dword ptr [rbp + 0x7f]
0x29415b1: test eax, eax
0x29415b3: je 0x1429415ba
0x29415b5: mov dword ptr [r15], eax
0x29415b8: jmp 0x1429415bd
0x29415ba: mov dword ptr [r15], r13d
0x29415bd: mov rax, r15
0x29415c0: mov rbx, qword ptr [rsp + 0x100]
0x29415c8: add rsp, 0xc0
0x29415cf: pop r15
0x29415d1: pop r14
0x29415d3: pop r13
0x29415d5: pop r12
0x29415d7: pop rdi
0x29415d8: pop rsi
0x29415d9: pop rbp
0x29415da: ret 