0xdeffa0: mov qword ptr [rsp + 8], rbx
0xdeffa5: mov qword ptr [rsp + 0x10], rsi
0xdeffaa: push rdi
0xdeffab: sub rsp, 0x20
0xdeffaf: mov r10d, dword ptr [r9]
0xdeffb2: mov rdi, r8
0xdeffb5: mov rsi, rdx
0xdeffb8: mov rbx, rcx
0xdeffbb: test r10d, r10d
0xdeffbe: je 0x140df00a9
0xdeffc4: cmp dword ptr [rcx + 0x1bc], 0
0xdeffcb: je 0x140df001a
0xdeffcd: mov ecx, dword ptr [rcx + 0x1b8]
0xdeffd3: test ecx, ecx
0xdeffd5: je 0x140df001a
0xdeffd7: xor edx, edx
0xdeffd9: mov eax, r10d
0xdeffdc: div ecx
0xdeffde: mov r9d, edx
0xdeffe1: xor edx, edx
0xdeffe3: shl r9, 8
0xdeffe7: add r9, qword ptr [rbx + 0x1c8]
0xdeffee: mov r11d, dword ptr [r9]
0xdefff1: test r11d, r11d
0xdefff4: je 0x140df001a
0xdefff6: cmp dword ptr [r9 + rdx*8 + 8], r10d
0xdefffb: jne 0x140df0013
0xdefffd: mov ecx, dword ptr [r9 + rdx*8 + 0xc]
0xdf0002: mov rax, qword ptr [rbx + 0x1d0]
0xdf0009: mov r8, qword ptr [rax + rcx*8]
0xdf000d: cmp dword ptr [r8 + 4], r10d
0xdf0011: je 0x140df002c
0xdf0013: inc edx
0xdf0015: cmp edx, r11d
0xdf0018: jb 0x140defff6
0xdf001a: xor eax, eax
0xdf001c: mov rbx, qword ptr [rsp + 0x30]
0xdf0021: mov rsi, qword ptr [rsp + 0x38]
0xdf0026: add rsp, 0x20
0xdf002a: pop rdi
0xdf002b: ret 
0xdf002c: lea rcx, [r8 + 8]
0xdf0030: test rcx, rcx
0xdf0033: je 0x140df001a
0xdf0035: mov eax, dword ptr [rcx + 8]
0xdf0038: test eax, eax
0xdf003a: je 0x140df001a
0xdf003c: mov rcx, qword ptr [rcx]
0xdf003f: lea r8, [rcx + rax*8]
0xdf0043: cmp rcx, r8
0xdf0046: je 0x140df001a
0xdf0048: movzx r9d, word ptr [rsi]
0xdf004c: nop dword ptr [rax]
0xdf0050: mov rdx, qword ptr [rcx]
0xdf0053: cmp word ptr [rdx + 0xde], r9w
0xdf005b: jne 0x140df007b
0xdf005d: mov rax, qword ptr [rdx + 0xd0]
0xdf0064: vmovups xmm0, xmmword ptr [rdx + 0xc8]
0xdf006c: cmp al, byte ptr [rdi + 8]
0xdf006f: jne 0x140df007b
0xdf0071: vmovq rax, xmm0
0xdf0076: cmp rax, qword ptr [rdi]
0xdf0079: je 0x140df0096
0xdf007b: add rcx, 8
0xdf007f: cmp rcx, r8
0xdf0082: jne 0x140df0050
0xdf0084: xor eax, eax
0xdf0086: mov rbx, qword ptr [rsp + 0x30]
0xdf008b: mov rsi, qword ptr [rsp + 0x38]
0xdf0090: add rsp, 0x20
0xdf0094: pop rdi
0xdf0095: ret 
0xdf0096: mov rax, rdx
0xdf0099: mov rbx, qword ptr [rsp + 0x30]
0xdf009e: mov rsi, qword ptr [rsp + 0x38]
0xdf00a3: add rsp, 0x20
0xdf00a7: pop rdi
0xdf00a8: ret 
0xdf00a9: mov rcx, rsi
0xdf00ac: call 0x140537250
0xdf00b1: cmp dword ptr [rbx + 0x15c], 0
0xdf00b8: je 0x140df001a
0xdf00be: mov ecx, dword ptr [rbx + 0x158]
0xdf00c4: test ecx, ecx
0xdf00c6: je 0x140df001a
0xdf00cc: mov r9d, dword ptr [rax]
0xdf00cf: xor edx, edx
0xdf00d1: mov eax, r9d
0xdf00d4: div ecx
0xdf00d6: mov r10d, edx
0xdf00d9: xor edx, edx
0xdf00db: shl r10, 8
0xdf00df: add r10, qword ptr [rbx + 0x168]
0xdf00e6: mov r11d, dword ptr [r10]
0xdf00e9: test r11d, r11d
0xdf00ec: je 0x140df001a
0xdf00f2: cmp dword ptr [r10 + rdx*8 + 8], r9d
0xdf00f7: jne 0x140df010f
0xdf00f9: mov ecx, dword ptr [r10 + rdx*8 + 0xc]
0xdf00fe: mov rax, qword ptr [rbx + 0x170]
0xdf0105: mov r8, qword ptr [rax + rcx*8]
0xdf0109: cmp dword ptr [r8 + 4], r9d
0xdf010d: je 0x140df0128
0xdf010f: inc edx
0xdf0111: cmp edx, r11d
0xdf0114: jb 0x140df00f2
0xdf0116: xor eax, eax
0xdf0118: mov rbx, qword ptr [rsp + 0x30]
0xdf011d: mov rsi, qword ptr [rsp + 0x38]
0xdf0122: add rsp, 0x20
0xdf0126: pop rdi
0xdf0127: ret 
0xdf0128: lea rcx, [r8 + 8]
0xdf012c: test rcx, rcx
0xdf012f: je 0x140df001a
0xdf0135: cmp dword ptr [rcx + 4], 0
0xdf0139: je 0x140df001a
0xdf013f: mov rdx, rdi
0xdf0142: call 0x140de4500
0xdf0147: test rax, rax
0xdf014a: je 0x140df001a
0xdf0150: mov rax, qword ptr [rax]
0xdf0153: mov rbx, qword ptr [rsp + 0x30]
0xdf0158: mov rsi, qword ptr [rsp + 0x38]
0xdf015d: add rsp, 0x20
0xdf0161: pop rdi
0xdf0162: ret 
0xdf0163: int3 