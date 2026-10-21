0x103be8e0: mov qword ptr [rsp + 8], rbx
0x103be8e5: mov qword ptr [rsp + 0x10], rsi
0x103be8ea: mov qword ptr [rsp + 0x20], rdi
0x103be8ef: mov dword ptr [rsp + 0x18], r8d
0x103be8f4: push rbp
0x103be8f5: push r12
0x103be8f7: push r13
0x103be8f9: push r14
0x103be8fb: push r15
0x103be8fd: mov rbp, rsp
0x103be900: sub rsp, 0x60
0x103be904: mov r12, r9
0x103be907: mov r13d, r8d
0x103be90a: mov r14, rdx
0x103be90d: mov r15, rcx
0x103be910: cmp byte ptr [rip - 0x96cfb2f], 0
0x103be917: jne 0x1503be924
0x103be919: mov dword ptr [rdx], 0
0x103be91f: jmp 0x1503bea2a
0x103be924: mov rax, qword ptr [rip - 0x9655283]
0x103be92b: mov rdi, qword ptr [rax + 0x10]
0x103be92f: mov r8, r15
0x103be932: lea rdx, [rbp - 0x28]
0x103be936: call 0x14186f000
0x103be93b: mov eax, dword ptr [rbp - 0x28]
0x103be93e: test eax, eax
0x103be940: je 0x1503be947
0x103be942: mov dword ptr [rbp - 0x2c], eax
0x103be945: jmp 0x1503be9be
0x103be947: mov qword ptr [rbp - 0x20], rdi
0x103be94b: xor bl, bl
0x103be94d: mov byte ptr [rbp - 0x18], bl
0x103be950: mov rsi, qword ptr [rdi]
0x103be953: mov qword ptr [rbp - 0x28], rsi
0x103be957: mov rax, qword ptr [rsi]
0x103be95a: mov rcx, rsi
0x103be95d: call qword ptr [rax + 8]
0x103be960: nop 
0x103be961: cmp byte ptr [rdi + 0x60], bl
0x103be964: jne 0x1503be96f
0x103be966: mov byte ptr [rdi + 0x60], 1
0x103be96a: mov bl, 1
0x103be96c: mov byte ptr [rbp - 0x18], bl
0x103be96f: mov rax, qword ptr [rsi]
0x103be972: mov rcx, rsi
0x103be975: call qword ptr [rax + 0x10]
0x103be978: nop 
0x103be979: test bl, bl
0x103be97b: jne 0x1503be988
0x103be97d: mov eax, dword ptr [rip - 0x96c6cdf]
0x103be983: mov dword ptr [rbp - 0x2c], eax
0x103be986: jmp 0x1503be9be
0x103be988: mov qword ptr [rsp + 0x20], r12
0x103be98d: mov r9, r15
0x103be990: mov r8d, r13d
0x103be993: lea rdx, [rbp - 0x2c]
0x103be997: mov rcx, rdi
0x103be99a: call 0x14186e450
0x103be99f: nop 
0x103be9a0: mov rbx, qword ptr [rdi]
0x103be9a3: mov qword ptr [rbp - 0x28], rbx
0x103be9a7: mov rax, qword ptr [rbx]
0x103be9aa: mov rcx, rbx
0x103be9ad: call qword ptr [rax + 8]
0x103be9b0: nop 
0x103be9b1: mov byte ptr [rdi + 0x60], 0
0x103be9b5: mov rax, qword ptr [rbx]
0x103be9b8: mov rcx, rbx
0x103be9bb: call qword ptr [rax + 0x10]
0x103be9be: test byte ptr [r12], 3
0x103be9c3: sete byte ptr [rbp - 0x30]
0x103be9c7: cmp dword ptr [rbp - 0x2c], 0
0x103be9cb: sete byte ptr [rbp - 0x2f]
0x103be9cf: mov rax, qword ptr [r15]
0x103be9d2: mov rcx, r15
0x103be9d5: call qword ptr [rax + 0xe8]
0x103be9db: lea rbx, [rip - 0xa8995ea]
0x103be9e2: mov qword ptr [rbp - 0x20], rbx
0x103be9e6: mov byte ptr [rbp - 0x18], 0
0x103be9ea: lea rcx, [rip - 0xa8995b9]
0x103be9f1: mov qword ptr [rbp - 0x20], rcx
0x103be9f5: mov qword ptr [rbp - 0x10], rax
0x103be9f9: lea rax, [rbp - 0x2c]
0x103be9fd: mov qword ptr [rsp + 0x28], rax
0x103bea02: lea rax, [rbp - 0x30]
0x103bea06: mov qword ptr [rsp + 0x20], rax
0x103bea0b: lea r9, [rbp - 0x2f]
0x103bea0f: lea r8, [rbp + 0x40]
0x103bea13: lea rdx, [rbp - 0x20]
0x103bea17: mov rcx, r15
0x103bea1a: call 0x142a1fd40
0x103bea1f: nop 
0x103bea20: mov qword ptr [rbp - 0x20], rbx
0x103bea24: mov eax, dword ptr [rbp - 0x2c]
0x103bea27: mov dword ptr [r14], eax
0x103bea2a: mov rax, r14
0x103bea2d: lea r11, [rsp + 0x60]
0x103bea32: mov rbx, qword ptr [r11 + 0x30]
0x103bea36: mov rsi, qword ptr [r11 + 0x38]
0x103bea3a: mov rdi, qword ptr [r11 + 0x48]
0x103bea3e: mov rsp, r11
0x103bea41: pop r15
0x103bea43: pop r14
0x103bea45: pop r13
0x103bea47: pop r12
0x103bea49: pop rbp
0x103bea4a: ret 