0x23571d0: mov qword ptr [rsp + 0x10], rdx
0x23571d5: mov qword ptr [rsp + 8], rcx
0x23571da: push rbp
0x23571db: push rbx
0x23571dc: push rsi
0x23571dd: push rdi
0x23571de: push r12
0x23571e0: push r13
0x23571e2: push r14
0x23571e4: push r15
0x23571e6: lea rbp, [rsp - 0x628]
0x23571ee: sub rsp, 0x728
0x23571f5: mov r15, rdx
0x23571f8: mov r13, rcx
0x23571fb: cmp dword ptr [rdx + 0x6b8], 0
0x2357202: jne 0x14235720b
0x2357204: mov al, 1
0x2357206: jmp 0x142357c3d
0x235720b: call 0x142358d40
0x2357210: xor esi, esi
0x2357212: mov qword ptr [rbp + 0x198], rsi
0x2357219: mov qword ptr [rbp + 0x1a0], 0x105
0x2357224: mov dword ptr [rbp + 0x1a4], esi
0x235722a: mov byte ptr [rbp + 0x90], sil
0x2357231: mov dword ptr [rbp + 0x1a4], esi
0x2357237: mov byte ptr [rbp + 0x90], sil
0x235723e: mov rax, qword ptr [rbp + 0x198]
0x2357245: test rax, rax
0x2357248: je 0x14235724d
0x235724a: mov byte ptr [rax], sil
0x235724d: lea rcx, [r15 + 0x28]
0x2357251: mov rax, qword ptr [rcx + 0x88]
0x2357258: test rax, rax
0x235725b: cmovne rcx, rax
0x235725f: mov qword ptr [rbp + 0x680], rcx
0x2357266: mov dword ptr [rbp + 0x1a4], 0xffffffff
0x2357270: lea rcx, [rbp + 0x90]
0x2357277: mov rax, qword ptr [rbp + 0x198]
0x235727e: test rax, rax
0x2357281: cmovne rcx, rax
0x2357285: lea r9, [r13 + 0x20]
0x2357289: lea rax, [rbp + 0x680]
0x2357290: mov qword ptr [rsp + 0x20], rax
0x2357295: lea r8, [rip + 0x3221ba0]
0x235729c: mov edx, dword ptr [rbp + 0x1a0]
0x23572a2: call 0x14064c240
0x23572a7: mov qword ptr [rbp + 0x3d8], rsi
0x23572ae: mov qword ptr [rbp + 0x3e0], 0x105
0x23572b9: mov dword ptr [rbp + 0x3e4], esi
0x23572bf: mov byte ptr [rbp + 0x2d0], 0
0x23572c6: mov dword ptr [rbp + 0x3e4], esi
0x23572cc: mov byte ptr [rbp + 0x2d0], 0
0x23572d3: mov rax, qword ptr [rbp + 0x3d8]
0x23572da: test rax, rax
0x23572dd: je 0x1423572e2
0x23572df: mov byte ptr [rax], 0
0x23572e2: lea r8, [rbp + 0x2d0]
0x23572e9: mov rdx, r15
0x23572ec: mov rcx, r13
0x23572ef: call 0x14235a500
0x23572f4: mov qword ptr [rbp + 0x2b8], rsi
0x23572fb: mov qword ptr [rbp + 0x2c0], 0x105
0x2357306: mov dword ptr [rbp + 0x2c4], esi
0x235730c: mov byte ptr [rbp + 0x1b0], 0
0x2357313: mov dword ptr [rbp + 0x2c4], esi
0x2357319: mov byte ptr [rbp + 0x1b0], 0
0x2357320: mov rax, qword ptr [rbp + 0x2b8]
0x2357327: test rax, rax
0x235732a: je 0x14235732f
0x235732c: mov byte ptr [rax], 0
0x235732f: lea r8, [rbp + 0x1b0]
0x2357336: mov rdx, r15
0x2357339: mov rcx, r13
0x235733c: call 0x14235a680
0x2357341: lea r9, [rbp + 0x1b0]
0x2357348: lea r8, [rbp + 0x2d0]
0x235734f: lea rdx, [rbp + 0x90]
0x2357356: call 0x14235a800
0x235735b: test al, al
0x235735d: jne 0x14235738c
0x235735f: lea rax, [rip + 0x362c73a]
0x2357366: mov qword ptr [rsp + 0x58], rax
0x235736b: mov dword ptr [rsp + 0x50], 6
0x2357373: mov dword ptr [rsp + 0x48], esi
0x2357377: lea rbx, [rip + 0x321c12e]
0x235737e: mov qword ptr [rsp + 0x40], rbx
0x2357383: mov dword ptr [rsp + 0x38], esi
0x2357387: jmp 0x14235746b
0x235738c: lea rcx, [rbp + 0x90]
0x2357393: mov rax, qword ptr [rbp + 0x198]
0x235739a: test rax, rax
0x235739d: cmovne rcx, rax
0x23573a1: call 0x141329600
0x23573a6: test al, al
0x23573a8: mov rax, qword ptr [rbp + 0x3d8]
0x23573af: jne 0x1423573f7
0x23573b1: lea rbx, [rbp + 0x2d0]
0x23573b8: test rax, rax
0x23573bb: cmovne rbx, rax
0x23573bf: mov rcx, rbx
0x23573c2: call 0x141329600
0x23573c7: test al, al
0x23573c9: jne 0x14235748d
0x23573cf: mov rcx, rbx
0x23573d2: call 0x141329870
0x23573d7: test al, al
0x23573d9: je 0x1423573eb
0x23573db: mov rcx, rbx
0x23573de: call 0x141329700
0x23573e3: test al, al
0x23573e5: jne 0x14235748d
0x23573eb: lea rax, [rip + 0x362c6ce]
0x23573f2: jmp 0x142357366
0x23573f7: lea rdi, [rbp + 0x2d0]
0x23573fe: test rax, rax
0x2357401: cmovne rdi, rax
0x2357405: lea rsi, [rbp + 0x90]
0x235740c: mov rax, qword ptr [rbp + 0x198]
0x2357413: test rax, rax
0x2357416: cmovne rsi, rax
0x235741a: xor r14d, r14d
0x235741d: mov ebx, r14d
0x2357420: mov rdx, rdi
0x2357423: mov rcx, rsi
0x2357426: call 0x141329eb0
0x235742b: test al, al
0x235742d: jne 0x14235748b
0x235742f: mov ecx, 7
0x2357434: call qword ptr [rip + 0x2e94056]
0x235743a: inc ebx
0x235743c: cmp ebx, 4
0x235743f: jb 0x142357420
0x2357441: lea rax, [rip + 0x362c590]
0x2357448: mov qword ptr [rsp + 0x58], rax
0x235744d: mov dword ptr [rsp + 0x50], 6
0x2357455: mov dword ptr [rsp + 0x48], r14d
0x235745a: lea rbx, [rip + 0x321c04b]
0x2357461: mov qword ptr [rsp + 0x40], rbx
0x2357466: mov dword ptr [rsp + 0x38], r14d
0x235746b: mov qword ptr [rsp + 0x30], rbx
0x2357470: mov qword ptr [rsp + 0x28], rbx
0x2357475: mov qword ptr [rsp + 0x20], rbx
0x235747a: mov r9, rbx
0x235747d: mov cl, 1
0x235747f: call 0x14035d8d0
0x2357484: xor bl, bl
0x2357486: jmp 0x142357c14
0x235748b: xor esi, esi
0x235748d: mov qword ptr [rsp + 0x60], rsi
0x2357492: mov qword ptr [rsp + 0x68], 0
0x235749b: lea rcx, [rbp + 0x2d0]
0x23574a2: mov rax, qword ptr [rbp + 0x3d8]
0x23574a9: test rax, rax
0x23574ac: cmovne rcx, rax
0x23574b0: lea r8, [rsp + 0x60]
0x23574b5: call 0x14132b030
0x23574ba: lea rcx, [rbp + 0x1b0]
0x23574c1: mov rax, qword ptr [rbp + 0x2b8]
0x23574c8: test rax, rax
0x23574cb: cmovne rcx, rax
0x23574cf: call 0x141329700
0x23574d4: test al, al
0x23574d6: jne 0x142357505
0x23574d8: lea rax, [rip + 0x362c521]
0x23574df: mov qword ptr [rsp + 0x58], rax
0x23574e4: mov dword ptr [rsp + 0x50], 6
0x23574ec: mov dword ptr [rsp + 0x48], esi
0x23574f0: lea rbx, [rip + 0x321bfb5]
0x23574f7: mov qword ptr [rsp + 0x40], rbx
0x23574fc: mov dword ptr [rsp + 0x38], esi
0x2357500: jmp 0x142357be3
0x2357505: mov r12, qword ptr [rsp + 0x60]
0x235750a: mov eax, dword ptr [rsp + 0x68]
0x235750e: lea rax, [r12 + rax*8]
0x2357512: mov qword ptr [rbp + 0x688], rax
0x2357519: mov r14, 0xffffffffffffffff
0x2357520: cmp r12, rax
0x2357523: je 0x14235786b
0x2357529: mov rax, qword ptr gs:[0x58]
0x2357532: mov r15, qword ptr [rax]
0x2357535: nop word ptr [rax + rax]
0x2357540: mov rax, qword ptr [r12]
0x2357544: mov rdi, qword ptr [rax]
0x2357547: test rdi, rdi
0x235754a: je 0x14235756e
0x235754c: cmp byte ptr [rdi], 0
0x235754f: je 0x14235756e
0x2357551: mov ebx, dword ptr [rax + 8]
0x2357554: cmp ebx, -1
0x2357557: jne 0x142357570
0x2357559: mov rbx, r14
0x235755c: nop dword ptr [rax]
0x2357560: inc rbx
0x2357563: cmp byte ptr [rdi + rbx], 0
0x2357567: jne 0x142357560
0x2357569: mov dword ptr [rax + 8], ebx
0x235756c: jmp 0x142357570
0x235756e: mov ebx, esi
0x2357570: mov byte ptr [rbp + 0x3f0], 0
0x2357577: mov r8d, 0x104
0x235757d: lea rdx, [rip + 0x33c32cc]
0x2357584: lea rcx, [rbp + 0x3f0]
0x235758b: call qword ptr [rip + 0x2e94f27]
0x2357591: mov dword ptr [rbp + 0x4f4], 0xffff0000
0x235759b: mov byte ptr [rbp + 0x4f8], 0
0x23575a2: mov r8d, ebx
0x23575a5: mov rdx, rdi
0x23575a8: lea rcx, [rbp + 0x3f0]
0x23575af: call 0x141378e20
0x23575b4: nop 
0x23575b5: mov qword ptr [rbp + 0x78], rsi
0x23575b9: mov qword ptr [rbp + 0x80], 0x105
0x23575c4: mov dword ptr [rbp + 0x84], esi
0x23575ca: mov byte ptr [rsp + 0x70], 0
0x23575cf: mov dword ptr [rbp + 0x84], esi
0x23575d5: mov byte ptr [rsp + 0x70], 0
0x23575da: mov rax, qword ptr [rbp + 0x78]
0x23575de: test rax, rax
0x23575e1: je 0x1423575e6
0x23575e3: mov byte ptr [rax], 0
0x23575e6: mov ecx, dword ptr [rbp + 0x80]
0x23575ec: mov dword ptr [rbp + 0x84], 0xffffffff
0x23575f6: lea rdi, [rsp + 0x70]
0x23575fb: mov rax, qword ptr [rbp + 0x78]
0x23575ff: test rax, rax
0x2357602: cmovne rdi, rax
0x2357606: mov byte ptr [rdi], 0
0x2357609: movsx edx, word ptr [rbp + 0x4f6]
0x2357610: movzx eax, word ptr [rbp + 0x4f4]
0x2357617: sub eax, edx
0x2357619: lea r8d, [rax - 1]
0x235761d: cmp ecx, eax
0x235761f: jb 0x142357640
0x2357621: mov ebx, r8d
0x2357624: lea eax, [rdx + 1]
0x2357627: movsxd rcx, eax
0x235762a: lea rdx, [rbp + 0x3f0]
0x2357631: add rdx, rcx
0x2357634: mov rcx, rdi
0x2357637: call 0x144898e1e
0x235763c: mov byte ptr [rdi + rbx], 0
0x2357640: mov qword ptr [rbp + 0x608], rsi
0x2357647: mov qword ptr [rbp + 0x610], 0x105
0x2357652: mov dword ptr [rbp + 0x614], esi
0x2357658: mov byte ptr [rbp + 0x500], 0
0x235765f: mov dword ptr [rbp + 0x614], esi
0x2357665: mov byte ptr [rbp + 0x500], 0
0x235766c: mov rax, qword ptr [rbp + 0x608]
0x2357673: test rax, rax
0x2357676: je 0x14235767b
0x2357678: mov byte ptr [rax], 0
0x235767b: lea rbx, [rbp + 0x1b0]
0x2357682: mov rax, qword ptr [rbp + 0x2b8]
0x2357689: test rax, rax
0x235768c: cmovne rbx, rax
0x2357690: mov esi, dword ptr [rbp + 0x610]
0x2357696: mov dword ptr [rbp + 0x614], 0xffffffff
0x23576a0: lea rdi, [rbp + 0x500]
0x23576a7: mov rax, qword ptr [rbp + 0x608]
0x23576ae: test rax, rax
0x23576b1: cmovne rdi, rax
0x23576b5: mov eax, 0x240
0x23576ba: mov dword ptr [rax + r15], 0
0x23576c2: mov edx, 2
0x23576c7: lea rcx, [rbp + 0x680]
0x23576ce: call 0x141424650
0x23576d3: nop 
0x23576d4: test rbx, rbx
0x23576d7: je 0x1423576fa
0x23576d9: call 0x1414245b0
0x23576de: cmp dword ptr [rax + 8], 0
0x23576e2: ja 0x1423576ed
0x23576e4: lea rax, [rip + 0x49829c5]
0x23576eb: jmp 0x1423576f3
0x23576ed: mov rax, qword ptr [rax]
0x23576f0: mov rax, qword ptr [rax]
0x23576f3: mov qword ptr [rax + 0x808], rbx
0x23576fa: lea rbx, [rsp + 0x70]
0x23576ff: mov rax, qword ptr [rbp + 0x78]
0x2357703: test rax, rax
0x2357706: cmovne rbx, rax
0x235770a: call 0x1414245b0
0x235770f: cmp dword ptr [rax + 8], 1
0x2357713: ja 0x14235771e
0x2357715: lea rax, [rip + 0x4982994]
0x235771c: jmp 0x142357725
0x235771e: mov rax, qword ptr [rax]
0x2357721: mov rax, qword ptr [rax + 8]
0x2357725: mov qword ptr [rax + 0x808], rbx
0x235772c: lea r8, [rip + 0x3221709]
0x2357733: mov edx, esi
0x2357735: mov rcx, rdi
0x2357738: call 0x141424bd0
0x235773d: nop 
0x235773e: call 0x1414245b0
0x2357743: mov rsi, rax
0x2357746: xor edi, edi
0x2357748: mov ebx, edi
0x235774a: cmp dword ptr [rax + 8], edi
0x235774d: jbe 0x14235779b
0x235774f: mov r13d, 0x1fd
0x2357755: nop word ptr [rax + rax]
0x2357760: mov edx, ebx
0x2357762: mov rcx, qword ptr [rsi]
0x2357765: lea rdi, [rcx + rdx*8]
0x2357769: mov rcx, qword ptr [rdi]
0x235776c: test rcx, rcx
0x235776f: je 0x14235778b
0x2357771: cmp byte ptr [r15 + r13], 0
0x2357776: je 0x14235777f
0x2357778: call 0x1447f03bc
0x235777d: jmp 0x142357784
0x235777f: call 0x1447f02bc
0x2357784: mov qword ptr [rdi], 0
0x235778b: inc ebx
0x235778d: cmp ebx, dword ptr [rsi + 8]
0x2357790: jb 0x142357760
0x2357792: mov r13, qword ptr [rbp + 0x670]
0x2357799: xor edi, edi
0x235779b: mov dword ptr [rsi + 8], edi
0x235779e: lea rdx, [rbp + 0x500]
0x23577a5: mov rax, qword ptr [rbp + 0x608]
0x23577ac: test rax, rax
0x23577af: cmovne rdx, rax
0x23577b3: mov rcx, qword ptr [r12]
0x23577b7: mov rcx, qword ptr [rcx]
0x23577ba: call 0x141328e90
0x23577bf: nop 
0x23577c0: test al, al
0x23577c2: je 0x142357986
0x23577c8: mov rcx, qword ptr [rbp + 0x608]
0x23577cf: mov ebx, 0x1fd
0x23577d4: add rbx, r15
0x23577d7: test rcx, rcx
0x23577da: je 0x142357801
0x23577dc: cmp byte ptr [rbx], 0
0x23577df: je 0x1423577f1
0x23577e1: call 0x1447f03bc
0x23577e6: xor esi, esi
0x23577e8: mov qword ptr [rbp + 0x608], rsi
0x23577ef: jmp 0x142357803
0x23577f1: call 0x1447f02bc
0x23577f6: xor esi, esi
0x23577f8: mov qword ptr [rbp + 0x608], rsi
0x23577ff: jmp 0x142357803
0x2357801: xor esi, esi
0x2357803: mov rcx, qword ptr [rbp + 0x78]
0x2357807: test rcx, rcx
0x235780a: je 0x142357821
0x235780c: cmp byte ptr [rbx], 0
0x235780f: je 0x142357818
0x2357811: call 0x1447f03bc
0x2357816: jmp 0x14235781d
0x2357818: call 0x1447f02bc
0x235781d: mov qword ptr [rbp + 0x78], rsi
0x2357821: mov byte ptr [rbp + 0x3f0], 0
0x2357828: mov r8d, 0x104
0x235782e: lea rdx, [rip + 0x33c301b]
0x2357835: lea rcx, [rbp + 0x3f0]
0x235783c: call qword ptr [rip + 0x2e94c76]
0x2357842: mov dword ptr [rbp + 0x4f4], 0xffff0000
0x235784c: mov byte ptr [rbp + 0x4f8], 0
0x2357853: add r12, 8
0x2357857: cmp r12, qword ptr [rbp + 0x688]
0x235785e: jne 0x142357540
0x2357864: mov r15, qword ptr [rbp + 0x678]
0x235786b: lea rdi, [rbp + 0x1b0]
0x2357872: mov rcx, qword ptr [rbp + 0x2b8]
0x2357879: test rcx, rcx
0x235787c: cmovne rdi, rcx
0x2357880: mov rbx, qword ptr [r15 + 0x6b0]
0x2357887: mov eax, dword ptr [r15 + 0x6b8]
0x235788e: lea rsi, [rbx + rax*8]
0x2357892: cmp rbx, rsi
0x2357895: je 0x1423578c6
0x2357897: nop word ptr [rax + rax]
0x23578a0: mov r8, qword ptr [rbx]
0x23578a3: mov rdx, rdi
0x23578a6: mov rcx, r13
0x23578a9: call 0x142358750
0x23578ae: test al, al
0x23578b0: je 0x142357a51
0x23578b6: add rbx, 8
0x23578ba: cmp rbx, rsi
0x23578bd: jne 0x1423578a0
0x23578bf: mov rcx, qword ptr [rbp + 0x2b8]
0x23578c6: lea rdi, [rbp + 0x90]
0x23578cd: mov rax, qword ptr [rbp + 0x198]
0x23578d4: test rax, rax
0x23578d7: cmovne rdi, rax
0x23578db: lea rsi, [rbp + 0x1b0]
0x23578e2: test rcx, rcx
0x23578e5: cmovne rsi, rcx
0x23578e9: xor r12d, r12d
0x23578ec: mov ebx, r12d
0x23578ef: nop 
0x23578f0: mov rdx, rdi
0x23578f3: mov rcx, rsi
0x23578f6: call 0x141329eb0
0x23578fb: test al, al
0x23578fd: jne 0x142357adc
0x2357903: mov ecx, 7
0x2357908: call qword ptr [rip + 0x2e93b82]
0x235790e: inc ebx
0x2357910: cmp ebx, 4
0x2357913: jb 0x1423578f0
0x2357915: lea rax, [rip + 0x362c3c4]
0x235791c: mov qword ptr [rsp + 0x58], rax
0x2357921: mov dword ptr [rsp + 0x50], 6
0x2357929: mov dword ptr [rsp + 0x48], r12d
0x235792e: lea rbx, [rip + 0x321bb77]
0x2357935: mov qword ptr [rsp + 0x40], rbx
0x235793a: mov dword ptr [rsp + 0x38], r12d
0x235793f: mov qword ptr [rsp + 0x30], rbx
0x2357944: mov qword ptr [rsp + 0x28], rbx
0x2357949: mov qword ptr [rsp + 0x20], rbx
0x235794e: mov r9, rbx
0x2357951: mov cl, 1
0x2357953: call 0x14035d8d0
0x2357958: lea r9, [rbp + 0x1b0]
0x235795f: lea r8, [rbp + 0x2d0]
0x2357966: lea rdx, [rbp + 0x90]
0x235796d: call 0x14235a800
0x2357972: test al, al
0x2357974: jne 0x142357bfc
0x235797a: lea rax, [rip + 0x362c37f]
0x2357981: jmp 0x142357bc7
0x2357986: mov rcx, qword ptr [rbp + 0x608]
0x235798d: mov ebx, 0x1fd
0x2357992: add rbx, r15
0x2357995: test rcx, rcx
0x2357998: je 0x1423579b2
0x235799a: cmp byte ptr [rbx], 0
0x235799d: je 0x1423579a6
0x235799f: call 0x1447f03bc
0x23579a4: jmp 0x1423579ab
0x23579a6: call 0x1447f02bc
0x23579ab: mov qword ptr [rbp + 0x608], rdi
0x23579b2: mov rcx, qword ptr [rbp + 0x78]
0x23579b6: test rcx, rcx
0x23579b9: je 0x1423579d0
0x23579bb: cmp byte ptr [rbx], 0
0x23579be: je 0x1423579c7
0x23579c0: call 0x1447f03bc
0x23579c5: jmp 0x1423579cc
0x23579c7: call 0x1447f02bc
0x23579cc: mov qword ptr [rbp + 0x78], rdi
0x23579d0: mov byte ptr [rbp + 0x3f0], 0
0x23579d7: mov r8d, 0x104
0x23579dd: lea rdx, [rip + 0x33c2e6c]
0x23579e4: lea rcx, [rbp + 0x3f0]
0x23579eb: call qword ptr [rip + 0x2e94ac7]
0x23579f1: mov dword ptr [rbp + 0x4f4], 0xffff0000
0x23579fb: mov byte ptr [rbp + 0x4f8], 0
0x2357a02: lea r9, [rbp + 0x1b0]
0x2357a09: lea r8, [rbp + 0x2d0]
0x2357a10: lea rdx, [rbp + 0x90]
0x2357a17: call 0x14235a800
0x2357a1c: test al, al
0x2357a1e: jne 0x142357bfc
0x2357a24: lea rax, [rip + 0x362bff5]
0x2357a2b: mov qword ptr [rsp + 0x58], rax
0x2357a30: mov dword ptr [rsp + 0x50], 6
0x2357a38: mov dword ptr [rsp + 0x48], edi
0x2357a3c: lea rbx, [rip + 0x321ba69]
0x2357a43: mov qword ptr [rsp + 0x40], rbx
0x2357a48: mov dword ptr [rsp + 0x38], edi
0x2357a4c: jmp 0x142357be3
0x2357a51: lea rax, [rip + 0x362c1d8]
0x2357a58: mov qword ptr [rsp + 0x58], rax
0x2357a5d: mov dword ptr [rsp + 0x50], 6
0x2357a65: xor edi, edi
0x2357a67: mov dword ptr [rsp + 0x48], edi
0x2357a6b: lea rbx, [rip + 0x321ba3a]
0x2357a72: mov qword ptr [rsp + 0x40], rbx
0x2357a77: mov dword ptr [rsp + 0x38], edi
0x2357a7b: mov qword ptr [rsp + 0x30], rbx
0x2357a80: mov qword ptr [rsp + 0x28], rbx
0x2357a85: mov qword ptr [rsp + 0x20], rbx
0x2357a8a: mov r9, rbx
0x2357a8d: mov cl, 1
0x2357a8f: call 0x14035d8d0
0x2357a94: lea r9, [rbp + 0x1b0]
0x2357a9b: lea r8, [rbp + 0x2d0]
0x2357aa2: lea rdx, [rbp + 0x90]
0x2357aa9: call 0x14235a800
0x2357aae: test al, al
0x2357ab0: jne 0x142357bfc
0x2357ab6: lea rax, [rip + 0x362bf83]
0x2357abd: mov qword ptr [rsp + 0x58], rax
0x2357ac2: mov dword ptr [rsp + 0x50], 6
0x2357aca: mov dword ptr [rsp + 0x48], edi
0x2357ace: mov qword ptr [rsp + 0x40], rbx
0x2357ad3: mov dword ptr [rsp + 0x38], edi
0x2357ad7: jmp 0x142357be3
0x2357adc: lea rdx, [rbp + 0x2d0]
0x2357ae3: mov rax, qword ptr [rbp + 0x3d8]
0x2357aea: test rax, rax
0x2357aed: cmovne rdx, rax
0x2357af1: mov qword ptr [rbp + 0x78], r12
0x2357af5: mov qword ptr [rbp + 0x80], 0x105
0x2357b00: mov dword ptr [rbp + 0x84], r12d
0x2357b07: mov byte ptr [rsp + 0x70], 0
0x2357b0c: nop dword ptr [rax]
0x2357b10: inc r14
0x2357b13: cmp byte ptr [rdx + r14], 0
0x2357b18: jne 0x142357b10
0x2357b1a: mov dword ptr [rbp + 0x84], r12d
0x2357b21: mov byte ptr [rsp + 0x70], 0
0x2357b26: mov rax, qword ptr [rbp + 0x78]
0x2357b2a: test rax, rax
0x2357b2d: je 0x142357b32
0x2357b2f: mov byte ptr [rax], 0
0x2357b32: mov r8d, r14d
0x2357b35: lea rcx, [rsp + 0x70]
0x2357b3a: call 0x140393f50
0x2357b3f: nop 
0x2357b40: lea rdx, [rsp + 0x70]
0x2357b45: call 0x142358a20
0x2357b4a: movzx ebx, al
0x2357b4d: lea rcx, [rsp + 0x70]
0x2357b52: call 0x140394170
0x2357b57: test bl, bl
0x2357b59: jne 0x142357c00
0x2357b5f: lea rax, [rip + 0x362c1ba]
0x2357b66: mov qword ptr [rsp + 0x58], rax
0x2357b6b: mov dword ptr [rsp + 0x50], 6
0x2357b73: mov dword ptr [rsp + 0x48], r12d
0x2357b78: lea rbx, [rip + 0x321b92d]
0x2357b7f: mov qword ptr [rsp + 0x40], rbx
0x2357b84: mov dword ptr [rsp + 0x38], r12d
0x2357b89: mov qword ptr [rsp + 0x30], rbx
0x2357b8e: mov qword ptr [rsp + 0x28], rbx
0x2357b93: mov qword ptr [rsp + 0x20], rbx
0x2357b98: mov r9, rbx
0x2357b9b: mov cl, 1
0x2357b9d: call 0x14035d8d0
0x2357ba2: lea r9, [rbp + 0x1b0]
0x2357ba9: lea r8, [rbp + 0x2d0]
0x2357bb0: lea rdx, [rbp + 0x90]
0x2357bb7: call 0x14235a800
0x2357bbc: test al, al
0x2357bbe: jne 0x142357bfc
0x2357bc0: lea rax, [rip + 0x362c179]
0x2357bc7: mov qword ptr [rsp + 0x58], rax
0x2357bcc: mov dword ptr [rsp + 0x50], 6
0x2357bd4: mov dword ptr [rsp + 0x48], r12d
0x2357bd9: mov qword ptr [rsp + 0x40], rbx
0x2357bde: mov dword ptr [rsp + 0x38], r12d
0x2357be3: mov qword ptr [rsp + 0x30], rbx
0x2357be8: mov qword ptr [rsp + 0x28], rbx
0x2357bed: mov qword ptr [rsp + 0x20], rbx
0x2357bf2: mov r9, rbx
0x2357bf5: mov cl, 1
0x2357bf7: call 0x14035d8d0
0x2357bfc: xor bl, bl
0x2357bfe: jmp 0x142357c09
0x2357c00: mov dword ptr [r15 + 0x6b8], r12d
0x2357c07: mov bl, 1
0x2357c09: lea rcx, [rsp + 0x60]
0x2357c0e: call 0x140439370
0x2357c13: nop 
0x2357c14: lea rcx, [rbp + 0x1b0]
0x2357c1b: call 0x140394170
0x2357c20: nop 
0x2357c21: lea rcx, [rbp + 0x2d0]
0x2357c28: call 0x140394170
0x2357c2d: nop 
0x2357c2e: lea rcx, [rbp + 0x90]
0x2357c35: call 0x140394170
0x2357c3a: movzx eax, bl
0x2357c3d: add rsp, 0x728
0x2357c44: pop r15
0x2357c46: pop r14
0x2357c48: pop r13
0x2357c4a: pop r12
0x2357c4c: pop rdi
0x2357c4d: pop rsi
0x2357c4e: pop rbx
0x2357c4f: pop rbp
0x2357c50: ret 