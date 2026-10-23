; map-tooltip 0x3edd6b0: tooltip attribute getter (the planned hook)
; Static disassembly of CrimsonDesert.exe (timestamp 1790086912), read-only.
; Comments after ; give the string, or the interned UI name, stored at a RIP-relative target.
0x3edd6b0: push rbx
0x3edd6b2: sub rsp, 0x20
0x3edd6b6: mov rbx, qword ptr [rcx + 0xa0]
0x3edd6bd: test rbx, rbx
0x3edd6c0: je 0x3edd6c9
0x3edd6c2: cmp qword ptr [rbx + 8], 0
0x3edd6c7: jne 0x3edd71c
0x3edd6c9: mov rcx, qword ptr [rcx + 0xe0]
0x3edd6d0: test rcx, rcx
0x3edd6d3: je 0x3edd6f2
0x3edd6d5: lea rdx, [rip + 0x2e8995c]    ; 0x6d67038 name 'tooltip'
0x3edd6dc: call 0x4743a0
0x3edd6e1: test rax, rax
0x3edd6e4: je 0x3edd6f2
0x3edd6e6: mov rax, qword ptr [rax]
0x3edd6e9: mov rax, qword ptr [rax]
0x3edd6ec: add rsp, 0x20
0x3edd6f0: pop rbx
0x3edd6f1: ret 
0x3edd6f2: test rbx, rbx
0x3edd6f5: je 0x3edd71c
0x3edd6f7: mov rcx, qword ptr [rbx + 0x68]
0x3edd6fb: test rcx, rcx
0x3edd6fe: je 0x3edd71c
0x3edd700: lea rdx, [rip + 0x2e89931]    ; 0x6d67038 name 'tooltip'
0x3edd707: call 0x4743a0
0x3edd70c: test rax, rax
0x3edd70f: je 0x3edd71c
0x3edd711: mov rax, qword ptr [rax]
0x3edd714: mov rax, qword ptr [rax]
0x3edd717: test rax, rax
0x3edd71a: jne 0x3edd71e
0x3edd71c: xor eax, eax
0x3edd71e: add rsp, 0x20
0x3edd722: pop rbx
0x3edd723: ret 
