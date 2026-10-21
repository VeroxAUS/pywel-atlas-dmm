0x1364780: mov qword ptr [rsp + 8], rbx
0x1364785: mov qword ptr [rsp + 0x10], rsi
0x136478a: mov qword ptr [rsp + 0x18], rdi
0x136478f: lea ebx, [rdx - 0x2145e233]
0x1364795: mov rdi, rdx
0x1364798: mov r9d, ebx
0x136479b: mov r11d, ebx
0x136479e: test cl, 3
0x13647a1: jne 0x141364909
0x13647a7: cmp rdx, 0xc
0x13647ab: jbe 0x14136485e
0x13647b1: lea r8, [rdx - 0xd]
0x13647b5: movabs rax, 0xaaaaaaaaaaaaaaab
0x13647bf: mul r8
0x13647c2: mov rsi, rdx
0x13647c5: shr rsi, 3
0x13647c9: inc rsi
0x13647cc: imul rax, rsi, -0xc
0x13647d0: add rdi, rax
0x13647d3: nop dword ptr [rax]
0x13647d7: nop word ptr [rax + rax]
0x13647e0: mov r8d, dword ptr [rcx + 8]
0x13647e4: mov r10d, dword ptr [rcx + 4]
0x13647e8: add r8d, ebx
0x13647eb: add r10d, r9d
0x13647ee: sub r11d, r8d
0x13647f1: add r11d, dword ptr [rcx]
0x13647f4: mov r9d, r8d
0x13647f7: ror r9d, 0x1c
0x13647fb: add rcx, 0xc
0x13647ff: xor r9d, r11d
0x1364802: lea eax, [r10 + r8]
0x1364806: sub r10d, r9d
0x1364809: mov r8d, r9d
0x136480c: ror r8d, 0x1a
0x1364810: lea edx, [rax + r9]
0x1364814: xor r8d, r10d
0x1364817: sub eax, r8d
0x136481a: mov r9d, r8d
0x136481d: ror r9d, 0x18
0x1364821: xor r9d, eax
0x1364824: lea eax, [rdx + r8]
0x1364828: sub edx, r9d
0x136482b: mov r8d, r9d
0x136482e: ror r8d, 0x10
0x1364832: xor r8d, edx
0x1364835: lea edx, [rax + r9]
0x1364839: sub eax, r8d
0x136483c: mov r9d, r8d
0x136483f: ror r9d, 0xd
0x1364843: xor r9d, eax
0x1364846: mov ebx, r9d
0x1364849: lea r11d, [r8 + rdx]
0x136484d: sub edx, r9d
0x1364850: ror ebx, 0x1c
0x1364853: xor ebx, edx
0x1364855: add r9d, r11d
0x1364858: sub rsi, 1
0x136485c: jne 0x1413647e0
0x136485e: lea rdx, [rip - 0x1364865]
0x1364865: mov eax, dword ptr [rdx + rdi*4 + 0x1364c68]
0x136486c: add rax, rdx
0x136486f: jmp rax
0x1364871: add ebx, dword ptr [rcx + 8]
0x1364874: add r9d, dword ptr [rcx + 4]
0x1364878: add r11d, dword ptr [rcx]
0x136487b: jmp 0x141364c01
0x1364880: mov eax, dword ptr [rcx + 8]
0x1364883: add r9d, dword ptr [rcx + 4]
0x1364887: and eax, 0xffffff
0x136488c: add ebx, eax
0x136488e: add r11d, dword ptr [rcx]
0x1364891: jmp 0x141364c01
0x1364896: movzx eax, word ptr [rcx + 8]
0x136489a: add r9d, dword ptr [rcx + 4]
0x136489e: add ebx, eax
0x13648a0: add r11d, dword ptr [rcx]
0x13648a3: jmp 0x141364c01
0x13648a8: movzx eax, byte ptr [rcx + 8]
0x13648ac: add r9d, dword ptr [rcx + 4]
0x13648b0: add ebx, eax
0x13648b2: add r11d, dword ptr [rcx]
0x13648b5: jmp 0x141364c01
0x13648ba: mov eax, dword ptr [rcx + 4]
0x13648bd: and eax, 0xffffff
0x13648c2: add r9d, eax
0x13648c5: add r11d, dword ptr [rcx]
0x13648c8: jmp 0x141364c01
0x13648cd: movzx eax, word ptr [rcx + 4]
0x13648d1: add r9d, eax
0x13648d4: add r11d, dword ptr [rcx]
0x13648d7: jmp 0x141364c01
0x13648dc: movzx eax, byte ptr [rcx + 4]
0x13648e0: add r9d, eax
0x13648e3: add r11d, dword ptr [rcx]
0x13648e6: jmp 0x141364c01
0x13648eb: mov eax, dword ptr [rcx]
0x13648ed: and eax, 0xffffff
0x13648f2: jmp 0x141364bfe
0x13648f7: mov eax, ebx
0x13648f9: mov rbx, qword ptr [rsp + 8]
0x13648fe: mov rsi, qword ptr [rsp + 0x10]
0x1364903: mov rdi, qword ptr [rsp + 0x18]
0x1364908: ret 
0x1364909: test cl, 1
0x136490c: jne 0x141364a72
0x1364912: cmp rdi, 0xc
0x1364916: jbe 0x1413649e3
0x136491c: add rdx, -0xd
0x1364920: movabs rax, 0xaaaaaaaaaaaaaaab
0x136492a: mul rdx
0x136492d: mov rsi, rdx
0x1364930: shr rsi, 3
0x1364934: inc rsi
0x1364937: imul rax, rsi, -0xc
0x136493b: add rdi, rax
0x136493e: nop 
0x1364940: movzx eax, word ptr [rcx + 6]
0x1364944: movzx r10d, word ptr [rcx + 4]
0x1364949: movzx r8d, word ptr [rcx + 8]
0x136494e: movzx edx, word ptr [rcx]
0x1364951: shl eax, 0x10
0x1364954: add eax, r9d
0x1364957: add r10d, eax
0x136495a: movzx eax, word ptr [rcx + 0xa]
0x136495e: shl eax, 0x10
0x1364961: add eax, ebx
0x1364963: add r8d, eax
0x1364966: movzx eax, word ptr [rcx + 2]
0x136496a: shl eax, 0x10
0x136496d: mov r9d, r8d
0x1364970: sub eax, r8d
0x1364973: ror r9d, 0x1c
0x1364977: add eax, r11d
0x136497a: add rcx, 0xc
0x136497e: add edx, eax
0x1364980: lea eax, [r10 + r8]
0x1364984: xor r9d, edx
0x1364987: sub r10d, r9d
0x136498a: mov r8d, r9d
0x136498d: ror r8d, 0x1a
0x1364991: xor r8d, r10d
0x1364994: lea edx, [r9 + rax]
0x1364998: sub eax, r8d
0x136499b: mov r9d, r8d
0x136499e: ror r9d, 0x18
0x13649a2: xor r9d, eax
0x13649a5: lea eax, [rdx + r8]
0x13649a9: sub edx, r9d
0x13649ac: mov r8d, r9d
0x13649af: ror r8d, 0x10
0x13649b3: xor r8d, edx
0x13649b6: lea edx, [r9 + rax]
0x13649ba: sub eax, r8d
0x13649bd: mov r9d, r8d
0x13649c0: ror r9d, 0xd
0x13649c4: xor r9d, eax
0x13649c7: lea r11d, [r8 + rdx]
0x13649cb: sub edx, r9d
0x13649ce: mov ebx, r9d
0x13649d1: ror ebx, 0x1c
0x13649d4: add r9d, r11d
0x13649d7: xor ebx, edx
0x13649d9: sub rsi, 1
0x13649dd: jne 0x141364940
0x13649e3: lea rdx, [rip - 0x13649ea]
0x13649ea: mov eax, dword ptr [rdx + rdi*4 + 0x1364c9c]
0x13649f1: add rax, rdx
0x13649f4: jmp rax
0x13649f6: movzx edx, word ptr [rcx + 0xa]
0x13649fa: movzx eax, word ptr [rcx + 8]
0x13649fe: shl edx, 0x10
0x1364a01: add ebx, eax
0x1364a03: add ebx, edx
0x1364a05: movzx edx, word ptr [rcx + 6]
0x1364a09: movzx eax, word ptr [rcx + 4]
0x1364a0d: shl edx, 0x10
0x1364a10: add r9d, eax
0x1364a13: add r9d, edx
0x1364a16: movzx edx, word ptr [rcx + 2]
0x1364a1a: movzx eax, word ptr [rcx]
0x1364a1d: shl edx, 0x10
0x1364a20: add r11d, eax
0x1364a23: add r11d, edx
0x1364a26: jmp 0x141364c01
0x1364a2b: movzx eax, byte ptr [rcx + 0xa]
0x1364a2f: shl eax, 0x10
0x1364a32: add ebx, eax
0x1364a34: movzx eax, word ptr [rcx + 8]
0x1364a38: add ebx, eax
0x1364a3a: jmp 0x141364a05
0x1364a3c: movzx eax, byte ptr [rcx + 8]
0x1364a40: add ebx, eax
0x1364a42: jmp 0x141364a05
0x1364a44: movzx eax, byte ptr [rcx + 6]
0x1364a48: shl eax, 0x10
0x1364a4b: add r9d, eax
0x1364a4e: movzx eax, word ptr [rcx + 4]
0x1364a52: add r9d, eax
0x1364a55: jmp 0x141364a16
0x1364a57: movzx eax, byte ptr [rcx + 4]
0x1364a5b: add r9d, eax
0x1364a5e: jmp 0x141364a16
0x1364a60: movzx eax, byte ptr [rcx + 2]
0x1364a64: shl eax, 0x10
0x1364a67: add r11d, eax
0x1364a6a: movzx eax, word ptr [rcx]
0x1364a6d: jmp 0x141364bfe
0x1364a72: cmp rdi, 0xc
0x1364a76: jbe 0x141364b84
0x1364a7c: add rdx, -0xd
0x1364a80: movabs rax, 0xaaaaaaaaaaaaaaab
0x1364a8a: mul rdx
0x1364a8d: mov rsi, rdx
0x1364a90: shr rsi, 3
0x1364a94: inc rsi
0x1364a97: imul rax, rsi, -0xc
0x1364a9b: add rdi, rax
0x1364a9e: nop 
0x1364aa0: movzx eax, byte ptr [rcx + 6]
0x1364aa4: movzx edx, byte ptr [rcx + 8]
0x1364aa8: movzx r8d, byte ptr [rcx + 7]
0x1364aad: movzx r10d, byte ptr [rcx + 4]
0x1364ab2: shl r8d, 8
0x1364ab6: add r8d, eax
0x1364ab9: movzx eax, byte ptr [rcx + 5]
0x1364abd: shl r8d, 8
0x1364ac1: add eax, r8d
0x1364ac4: movzx r8d, byte ptr [rcx + 0xb]
0x1364ac9: shl r8d, 8
0x1364acd: shl eax, 8
0x1364ad0: add eax, r9d
0x1364ad3: add r10d, eax
0x1364ad6: movzx eax, byte ptr [rcx + 0xa]
0x1364ada: add r8d, eax
0x1364add: movzx eax, byte ptr [rcx + 9]
0x1364ae1: shl r8d, 8
0x1364ae5: add r8d, eax
0x1364ae8: movzx eax, byte ptr [rcx + 2]
0x1364aec: shl r8d, 8
0x1364af0: add r8d, ebx
0x1364af3: add r8d, edx
0x1364af6: movzx edx, byte ptr [rcx + 3]
0x1364afa: shl edx, 8
0x1364afd: mov r9d, r8d
0x1364b00: add edx, eax
0x1364b02: ror r9d, 0x1c
0x1364b06: movzx eax, byte ptr [rcx + 1]
0x1364b0a: shl edx, 8
0x1364b0d: add edx, eax
0x1364b0f: movzx eax, byte ptr [rcx]
0x1364b12: shl edx, 8
0x1364b15: add rcx, 0xc
0x1364b19: add edx, eax
0x1364b1b: lea eax, [r8 + r10]
0x1364b1f: sub edx, r8d
0x1364b22: add edx, r11d
0x1364b25: xor r9d, edx
0x1364b28: sub r10d, r9d
0x1364b2b: mov r8d, r9d
0x1364b2e: ror r8d, 0x1a
0x1364b32: xor r8d, r10d
0x1364b35: lea edx, [r9 + rax]
0x1364b39: sub eax, r8d
0x1364b3c: mov r9d, r8d
0x1364b3f: ror r9d, 0x18
0x1364b43: xor r9d, eax
0x1364b46: lea eax, [rdx + r8]
0x1364b4a: sub edx, r9d
0x1364b4d: mov r8d, r9d
0x1364b50: ror r8d, 0x10
0x1364b54: xor r8d, edx
0x1364b57: lea edx, [r9 + rax]
0x1364b5b: sub eax, r8d
0x1364b5e: mov r9d, r8d
0x1364b61: ror r9d, 0xd
0x1364b65: xor r9d, eax
0x1364b68: lea r11d, [r8 + rdx]
0x1364b6c: sub edx, r9d
0x1364b6f: mov ebx, r9d
0x1364b72: ror ebx, 0x1c
0x1364b75: add r9d, r11d
0x1364b78: xor ebx, edx
0x1364b7a: sub rsi, 1
0x1364b7e: jne 0x141364aa0
0x1364b84: lea rdx, [rip - 0x1364b8b]
0x1364b8b: mov eax, dword ptr [rdx + rdi*4 + 0x1364cd0]
0x1364b92: add rax, rdx
0x1364b95: jmp rax
0x1364b97: movzx eax, byte ptr [rcx + 0xb]
0x1364b9b: shl eax, 0x18
0x1364b9e: add ebx, eax
0x1364ba0: movzx eax, byte ptr [rcx + 0xa]
0x1364ba4: shl eax, 0x10
0x1364ba7: add ebx, eax
0x1364ba9: movzx eax, byte ptr [rcx + 9]
0x1364bad: shl eax, 8
0x1364bb0: add ebx, eax
0x1364bb2: movzx eax, byte ptr [rcx + 8]
0x1364bb6: add ebx, eax
0x1364bb8: movzx eax, byte ptr [rcx + 7]
0x1364bbc: shl eax, 0x18
0x1364bbf: add r9d, eax
0x1364bc2: movzx eax, byte ptr [rcx + 6]
0x1364bc6: shl eax, 0x10
0x1364bc9: add r9d, eax
0x1364bcc: movzx eax, byte ptr [rcx + 5]
0x1364bd0: shl eax, 8
0x1364bd3: add r9d, eax
0x1364bd6: movzx eax, byte ptr [rcx + 4]
0x1364bda: add r9d, eax
0x1364bdd: movzx eax, byte ptr [rcx + 3]
0x1364be1: shl eax, 0x18
0x1364be4: add r11d, eax
0x1364be7: movzx eax, byte ptr [rcx + 2]
0x1364beb: shl eax, 0x10
0x1364bee: add r11d, eax
0x1364bf1: movzx eax, byte ptr [rcx + 1]
0x1364bf5: shl eax, 8
0x1364bf8: add r11d, eax
0x1364bfb: movzx eax, byte ptr [rcx]
0x1364bfe: add r11d, eax
0x1364c01: mov rsi, qword ptr [rsp + 0x10]
0x1364c06: xor ebx, r9d
0x1364c09: mov rdi, qword ptr [rsp + 0x18]
0x1364c0e: mov eax, r9d
0x1364c11: ror eax, 0x12
0x1364c14: sub ebx, eax
0x1364c16: mov eax, ebx
0x1364c18: mov ecx, ebx
0x1364c1a: ror eax, 0x15
0x1364c1d: xor ecx, r11d
0x1364c20: sub ecx, eax
0x1364c22: mov eax, ecx
0x1364c24: mov r8d, ecx
0x1364c27: ror eax, 7
0x1364c2a: xor r8d, r9d
0x1364c2d: sub r8d, eax
0x1364c30: mov eax, r8d
0x1364c33: mov r9d, r8d
0x1364c36: ror eax, 0x10
0x1364c39: xor r9d, ebx
0x1364c3c: mov rbx, qword ptr [rsp + 8]
0x1364c41: sub r9d, eax
0x1364c44: mov eax, r9d
0x1364c47: mov edx, r9d
0x1364c4a: xor edx, ecx
0x1364c4c: ror eax, 0x1c
0x1364c4f: sub edx, eax
0x1364c51: mov ecx, edx
0x1364c53: xor edx, r8d
0x1364c56: ror ecx, 0x12
0x1364c59: sub edx, ecx
0x1364c5b: mov ecx, edx
0x1364c5d: xor edx, r9d
0x1364c60: ror ecx, 8
0x1364c63: sub edx, ecx
0x1364c65: mov eax, edx
0x1364c67: ret 
0x1364c68: test dword ptr [rax + 0x36], 0x364bfb01
0x1364c6f: add dword ptr [rdx + 0x4a], ebp
0x1364c72: add ebx, ebp
0x1364c75: add dword ptr ss:[rax + 0x48], edi
0x1364c7a: add esp, ebx
0x1364c7d: add ebp, ecx
0x1364c81: add dword ptr ss:[rdx + 0x74013648], edi
0x1364c89: add dword ptr ss:[rax - 0x69fec9b8], ebp
0x1364c91: add dword ptr ss:[rax + 0x71013648], eax
0x1364c99: add edi, esi
0x1364c9d: add ebx, edi
0x1364ca1: add dword ptr ss:[rdx + 0x4a], ebp
0x1364ca6: add dword ptr ss:[rax + 0x4a], esp
0x1364caa: add dword ptr ss:[rsi], edx
0x1364cad: add dword ptr ss:[rdi + 0x4a], edx
0x1364cb2: add dword ptr ss:[rsi + 0x4a], ecx
0x1364cb6: add dword ptr ss:[rdx + rcx*2 + 0x36], eax
0x1364cbb: add dword ptr [rip + 0x3c01364a], eax
0x1364cc1: add dword ptr ss:[rdx + rcx*2], esi
0x1364cc6: add dword ptr ss:[rbx], ebp
0x1364cc9: add esi, esi
0x1364ccd: add edi, esi
0x1364cd1: add ebx, edi
0x1364cd5: add ecx, esi
0x1364cd9: add edi, esp
0x1364cdd: add ebp, ebx
0x1364ce1: add esi, edx
0x1364ce5: add esp, ecx
0x1364ce9: add edx, eax
0x1364ced: add dword ptr ss:[rax - 0x4dfec9b5], edi
0x1364cf5: add dword ptr ss:[rcx - 0x5ffec9b5], ebp