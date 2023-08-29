00000000  55                push ebp
00000001  89E5              mov ebp,esp
00000003  83EC08            sub esp,byte +0x8
00000006  83EC0C            sub esp,byte +0xc
00000009  6A64              push byte +0x64
0000000B  E825340000        call 0x3435
00000010  83C410            add esp,byte +0x10
00000013  C9                leave
00000014  C3                ret
00000015  55                push ebp
00000016  89E5              mov ebp,esp
00000018  83EC08            sub esp,byte +0x8
0000001B  83EC0C            sub esp,byte +0xc
0000001E  6A60              push byte +0x60
00000020  E810340000        call 0x3435
00000025  83C410            add esp,byte +0x10
00000028  C9                leave
00000029  C3                ret
0000002A  55                push ebp
0000002B  89E5              mov ebp,esp
0000002D  83EC68            sub esp,byte +0x68
00000030  C745F4EFBEADDE    mov dword [ebp-0xc],0xdeadbeef
00000037  66C745F25551      mov word [ebp-0xe],0x5155
0000003D  83EC0C            sub esp,byte +0xc
00000040  6A0F              push byte +0xf
00000042  E81E220000        call 0x2265
00000047  83C410            add esp,byte +0x10
0000004A  E8E1240000        call 0x2530
0000004F  C7459CD4090000    mov dword [ebp-0x64],0x9d4
00000056  C74598F85C1000    mov dword [ebp-0x68],0x105cf8
0000005D  8D4598            lea eax,[ebp-0x68]
00000060  50                push eax
00000061  8D459C            lea eax,[ebp-0x64]
00000064  50                push eax
00000065  68165D1000        push dword 0x105d16
0000006A  8D45A2            lea eax,[ebp-0x5e]
0000006D  50                push eax
0000006E  E85B290000        call 0x29ce
00000073  83C410            add esp,byte +0x10
00000076  83EC08            sub esp,byte +0x8
00000079  68D4090000        push dword 0x9d4
0000007E  682A5D1000        push dword 0x105d2a
00000083  E8E22B0000        call 0x2c6a
00000088  83C410            add esp,byte +0x10
0000008B  83EC0C            sub esp,byte +0xc
0000008E  68F85C1000        push dword 0x105cf8
00000093  E8BB230000        call 0x2453
00000098  83C410            add esp,byte +0x10
0000009B  83EC0C            sub esp,byte +0xc
0000009E  683A5D1000        push dword 0x105d3a
000000A3  E8C22B0000        call 0x2c6a
000000A8  83C410            add esp,byte +0x10
000000AB  0FB605A2A51000    movzx eax,byte [dword 0x10a5a2]
000000B2  83F001            xor eax,byte +0x1
000000B5  84C0              test al,al
000000B7  0F849C000000      jz near 0x159
000000BD  83EC0C            sub esp,byte +0xc
000000C0  68405D1000        push dword 0x105d40
000000C5  E889230000        call 0x2453
000000CA  83C410            add esp,byte +0x10
000000CD  E863150000        call 0x1635
000000D2  83EC0C            sub esp,byte +0xc
000000D5  68705D1000        push dword 0x105d70
000000DA  E874230000        call 0x2453
000000DF  83C410            add esp,byte +0x10
000000E2  FB                sti
000000E3  83EC0C            sub esp,byte +0xc
000000E6  68905D1000        push dword 0x105d90
000000EB  E863230000        call 0x2453
000000F0  83C410            add esp,byte +0x10
000000F3  E8CC320000        call 0x33c4
000000F8  83EC0C            sub esp,byte +0xc
000000FB  68B05D1000        push dword 0x105db0
00000100  E84E230000        call 0x2453
00000105  83C410            add esp,byte +0x10
00000108  E8971A0000        call 0x1ba4
0000010D  E8A9370000        call 0x38bb
00000112  83EC0C            sub esp,byte +0xc
00000115  68D05D1000        push dword 0x105dd0
0000011A  E834230000        call 0x2453
0000011F  83C410            add esp,byte +0x10
00000122  83EC0C            sub esp,byte +0xc
00000125  68F45D1000        push dword 0x105df4
0000012A  E824230000        call 0x2453
0000012F  83C410            add esp,byte +0x10
00000132  83EC0C            sub esp,byte +0xc
00000135  68E8030000        push dword 0x3e8
0000013A  E8A7340000        call 0x35e6
0000013F  83C410            add esp,byte +0x10
00000142  83EC0C            sub esp,byte +0xc
00000145  680C5E1000        push dword 0x105e0c
0000014A  E804230000        call 0x2453
0000014F  83C410            add esp,byte +0x10
00000152  C605A2A5100001    mov byte [dword 0x10a5a2],0x1
00000159  83EC0C            sub esp,byte +0xc
0000015C  682F5E1000        push dword 0x105e2f
00000161  E8042B0000        call 0x2c6a
00000166  83C410            add esp,byte +0x10
00000169  EB05              jmp short 0x170
0000016B  E8F8110000        call 0x1368
00000170  0FB605A1A51000    movzx eax,byte [dword 0x10a5a1]
00000177  83F001            xor eax,byte +0x1
0000017A  84C0              test al,al
0000017C  75ED              jnz 0x16b
0000017E  90                nop
0000017F  E867230000        call 0x24eb
00000184  83EC0C            sub esp,byte +0xc
00000187  68345E1000        push dword 0x105e34
0000018C  E8D92A0000        call 0x2c6a
00000191  83C410            add esp,byte +0x10
00000194  F4                hlt
00000195  83EC0C            sub esp,byte +0xc
00000198  68805E1000        push dword 0x105e80
0000019D  E8C82A0000        call 0x2c6a
000001A2  83C410            add esp,byte +0x10
000001A5  90                nop
000001A6  C9                leave
000001A7  C3                ret
000001A8  55                push ebp
000001A9  89E5              mov ebp,esp
000001AB  83EC14            sub esp,byte +0x14
000001AE  8B4510            mov eax,[ebp+0x10]
000001B1  8845EC            mov [ebp-0x14],al
000001B4  C745FC00000000    mov dword [ebp-0x4],0x0
000001BB  EB25              jmp short 0x1e2
000001BD  8B5508            mov edx,[ebp+0x8]
000001C0  8B45FC            mov eax,[ebp-0x4]
000001C3  01D0              add eax,edx
000001C5  0FB600            movzx eax,byte [eax]
000001C8  8845FB            mov [ebp-0x5],al
000001CB  0FB645FB          movzx eax,byte [ebp-0x5]
000001CF  3A45EC            cmp al,[ebp-0x14]
000001D2  750A              jnz 0x1de
000001D4  8B5508            mov edx,[ebp+0x8]
000001D7  8B45FC            mov eax,[ebp-0x4]
000001DA  01D0              add eax,edx
000001DC  EB11              jmp short 0x1ef
000001DE  8345FC01          add dword [ebp-0x4],byte +0x1
000001E2  8B45FC            mov eax,[ebp-0x4]
000001E5  3B450C            cmp eax,[ebp+0xc]
000001E8  72D3              jc 0x1bd
000001EA  B800000000        mov eax,0x0
000001EF  C9                leave
000001F0  C3                ret
000001F1  55                push ebp
000001F2  89E5              mov ebp,esp
000001F4  83EC38            sub esp,byte +0x38
000001F7  83EC0C            sub esp,byte +0xc
000001FA  68CB5E1000        push dword 0x105ecb
000001FF  E8B6390000        call 0x3bba
00000204  83C410            add esp,byte +0x10
00000207  8D5001            lea edx,[eax+0x1]
0000020A  8B4508            mov eax,[ebp+0x8]
0000020D  01D0              add eax,edx
0000020F  83EC08            sub esp,byte +0x8
00000212  68D35E1000        push dword 0x105ed3
00000217  50                push eax
00000218  E8C23C0000        call 0x3edf
0000021D  83C410            add esp,byte +0x10
00000220  8945F4            mov [ebp-0xc],eax
00000223  83EC08            sub esp,byte +0x8
00000226  68D35E1000        push dword 0x105ed3
0000022B  6A00              push byte +0x0
0000022D  E8AD3C0000        call 0x3edf
00000232  83C410            add esp,byte +0x10
00000235  8945F0            mov [ebp-0x10],eax
00000238  83EC08            sub esp,byte +0x8
0000023B  68D35E1000        push dword 0x105ed3
00000240  6A00              push byte +0x0
00000242  E8983C0000        call 0x3edf
00000247  83C410            add esp,byte +0x10
0000024A  8945EC            mov [ebp-0x14],eax
0000024D  837DF400          cmp dword [ebp-0xc],byte +0x0
00000251  0F84B8000000      jz near 0x30f
00000257  837DF000          cmp dword [ebp-0x10],byte +0x0
0000025B  0F84AE000000      jz near 0x30f
00000261  837DEC00          cmp dword [ebp-0x14],byte +0x0
00000265  0F84A4000000      jz near 0x30f
0000026B  83EC04            sub esp,byte +0x4
0000026E  6A00              push byte +0x0
00000270  6A00              push byte +0x0
00000272  FF75F4            push dword [ebp-0xc]
00000275  E8683A0000        call 0x3ce2
0000027A  83C410            add esp,byte +0x10
0000027D  8945E8            mov [ebp-0x18],eax
00000280  83EC04            sub esp,byte +0x4
00000283  6A00              push byte +0x0
00000285  6A00              push byte +0x0
00000287  FF75F0            push dword [ebp-0x10]
0000028A  E8533A0000        call 0x3ce2
0000028F  83C410            add esp,byte +0x10
00000292  8945E4            mov [ebp-0x1c],eax
00000295  8B45E8            mov eax,[ebp-0x18]
00000298  83EC04            sub esp,byte +0x4
0000029B  FF75EC            push dword [ebp-0x14]
0000029E  FF75E4            push dword [ebp-0x1c]
000002A1  50                push eax
000002A2  E8C53C0000        call 0x3f6c
000002A7  83C410            add esp,byte +0x10
000002AA  8945E0            mov [ebp-0x20],eax
000002AD  8B45E0            mov eax,[ebp-0x20]
000002B0  85C0              test eax,eax
000002B2  7449              jz 0x2fd
000002B4  83EC04            sub esp,byte +0x4
000002B7  8D45E0            lea eax,[ebp-0x20]
000002BA  50                push eax
000002BB  68D55E1000        push dword 0x105ed5
000002C0  8D45CC            lea eax,[ebp-0x34]
000002C3  50                push eax
000002C4  E805270000        call 0x29ce
000002C9  83C410            add esp,byte +0x10
000002CC  83EC0C            sub esp,byte +0xc
000002CF  68D85E1000        push dword 0x105ed8
000002D4  E87A210000        call 0x2453
000002D9  83C410            add esp,byte +0x10
000002DC  83EC0C            sub esp,byte +0xc
000002DF  8D45CC            lea eax,[ebp-0x34]
000002E2  50                push eax
000002E3  E86B210000        call 0x2453
000002E8  83C410            add esp,byte +0x10
000002EB  83EC0C            sub esp,byte +0xc
000002EE  68F25E1000        push dword 0x105ef2
000002F3  E85B210000        call 0x2453
000002F8  83C410            add esp,byte +0x10
000002FB  EB23              jmp short 0x320
000002FD  83EC0C            sub esp,byte +0xc
00000300  68F45E1000        push dword 0x105ef4
00000305  E849210000        call 0x2453
0000030A  83C410            add esp,byte +0x10
0000030D  EB11              jmp short 0x320
0000030F  83EC0C            sub esp,byte +0xc
00000312  68085F1000        push dword 0x105f08
00000317  E837210000        call 0x2453
0000031C  83C410            add esp,byte +0x10
0000031F  90                nop
00000320  90                nop
00000321  C9                leave
00000322  C3                ret
00000323  55                push ebp
00000324  89E5              mov ebp,esp
00000326  83EC48            sub esp,byte +0x48
00000329  83EC0C            sub esp,byte +0xc
0000032C  68465F1000        push dword 0x105f46
00000331  E884380000        call 0x3bba
00000336  83C410            add esp,byte +0x10
00000339  8D5001            lea edx,[eax+0x1]
0000033C  8B4508            mov eax,[ebp+0x8]
0000033F  01D0              add eax,edx
00000341  83EC08            sub esp,byte +0x8
00000344  68D35E1000        push dword 0x105ed3
00000349  50                push eax
0000034A  E8903B0000        call 0x3edf
0000034F  83C410            add esp,byte +0x10
00000352  8945F4            mov [ebp-0xc],eax
00000355  83EC08            sub esp,byte +0x8
00000358  68D35E1000        push dword 0x105ed3
0000035D  6A00              push byte +0x0
0000035F  E87B3B0000        call 0x3edf
00000364  83C410            add esp,byte +0x10
00000367  8945F0            mov [ebp-0x10],eax
0000036A  83EC08            sub esp,byte +0x8
0000036D  68D35E1000        push dword 0x105ed3
00000372  6A00              push byte +0x0
00000374  E8663B0000        call 0x3edf
00000379  83C410            add esp,byte +0x10
0000037C  8945EC            mov [ebp-0x14],eax
0000037F  837DF400          cmp dword [ebp-0xc],byte +0x0
00000383  0F84EA000000      jz near 0x473
00000389  837DF000          cmp dword [ebp-0x10],byte +0x0
0000038D  0F84E0000000      jz near 0x473
00000393  837DEC00          cmp dword [ebp-0x14],byte +0x0
00000397  0F84D6000000      jz near 0x473
0000039D  83EC04            sub esp,byte +0x4
000003A0  6A00              push byte +0x0
000003A2  6A00              push byte +0x0
000003A4  FF75F4            push dword [ebp-0xc]
000003A7  E836390000        call 0x3ce2
000003AC  83C410            add esp,byte +0x10
000003AF  8945E8            mov [ebp-0x18],eax
000003B2  83EC04            sub esp,byte +0x4
000003B5  6A00              push byte +0x0
000003B7  6A00              push byte +0x0
000003B9  FF75F0            push dword [ebp-0x10]
000003BC  E821390000        call 0x3ce2
000003C1  83C410            add esp,byte +0x10
000003C4  8945E4            mov [ebp-0x1c],eax
000003C7  83EC04            sub esp,byte +0x4
000003CA  6A00              push byte +0x0
000003CC  6A00              push byte +0x0
000003CE  FF75EC            push dword [ebp-0x14]
000003D1  E80C390000        call 0x3ce2
000003D6  83C410            add esp,byte +0x10
000003D9  8945E0            mov [ebp-0x20],eax
000003DC  8B45E0            mov eax,[ebp-0x20]
000003DF  8845DF            mov [ebp-0x21],al
000003E2  0FB645DF          movzx eax,byte [ebp-0x21]
000003E6  83EC08            sub esp,byte +0x8
000003E9  50                push eax
000003EA  684E5F1000        push dword 0x105f4e
000003EF  E876280000        call 0x2c6a
000003F4  83C410            add esp,byte +0x10
000003F7  0FB655DF          movzx edx,byte [ebp-0x21]
000003FB  8B45E8            mov eax,[ebp-0x18]
000003FE  83EC04            sub esp,byte +0x4
00000401  52                push edx
00000402  FF75E4            push dword [ebp-0x1c]
00000405  50                push eax
00000406  E89DFDFFFF        call 0x1a8
0000040B  83C410            add esp,byte +0x10
0000040E  8945D8            mov [ebp-0x28],eax
00000411  8B45D8            mov eax,[ebp-0x28]
00000414  85C0              test eax,eax
00000416  7449              jz 0x461
00000418  83EC04            sub esp,byte +0x4
0000041B  8D45D8            lea eax,[ebp-0x28]
0000041E  50                push eax
0000041F  68D55E1000        push dword 0x105ed5
00000424  8D45C4            lea eax,[ebp-0x3c]
00000427  50                push eax
00000428  E8A1250000        call 0x29ce
0000042D  83C410            add esp,byte +0x10
00000430  83EC0C            sub esp,byte +0xc
00000433  685C5F1000        push dword 0x105f5c
00000438  E816200000        call 0x2453
0000043D  83C410            add esp,byte +0x10
00000440  83EC0C            sub esp,byte +0xc
00000443  8D45C4            lea eax,[ebp-0x3c]
00000446  50                push eax
00000447  E807200000        call 0x2453
0000044C  83C410            add esp,byte +0x10
0000044F  83EC0C            sub esp,byte +0xc
00000452  68F25E1000        push dword 0x105ef2
00000457  E8F71F0000        call 0x2453
0000045C  83C410            add esp,byte +0x10
0000045F  EB23              jmp short 0x484
00000461  83EC0C            sub esp,byte +0xc
00000464  68745F1000        push dword 0x105f74
00000469  E8E51F0000        call 0x2453
0000046E  83C410            add esp,byte +0x10
00000471  EB11              jmp short 0x484
00000473  83EC0C            sub esp,byte +0xc
00000476  68885F1000        push dword 0x105f88
0000047B  E8D31F0000        call 0x2453
00000480  83C410            add esp,byte +0x10
00000483  90                nop
00000484  90                nop
00000485  C9                leave
00000486  C3                ret
00000487  55                push ebp
00000488  89E5              mov ebp,esp
0000048A  83EC38            sub esp,byte +0x38
0000048D  C745DC10000000    mov dword [ebp-0x24],0x10
00000494  C745D810000000    mov dword [ebp-0x28],0x10
0000049B  83EC08            sub esp,byte +0x8
0000049E  68C9000000        push dword 0xc9
000004A3  68C45F1000        push dword 0x105fc4
000004A8  E8BD270000        call 0x2c6a
000004AD  83C410            add esp,byte +0x10
000004B0  83EC08            sub esp,byte +0x8
000004B3  68CD000000        push dword 0xcd
000004B8  68C45F1000        push dword 0x105fc4
000004BD  E8A8270000        call 0x2c6a
000004C2  83C410            add esp,byte +0x10
000004C5  83EC08            sub esp,byte +0x8
000004C8  68CD000000        push dword 0xcd
000004CD  68C45F1000        push dword 0x105fc4
000004D2  E893270000        call 0x2c6a
000004D7  83C410            add esp,byte +0x10
000004DA  83EC08            sub esp,byte +0x8
000004DD  68CD000000        push dword 0xcd
000004E2  68C45F1000        push dword 0x105fc4
000004E7  E87E270000        call 0x2c6a
000004EC  83C410            add esp,byte +0x10
000004EF  83EC08            sub esp,byte +0x8
000004F2  68CD000000        push dword 0xcd
000004F7  68C45F1000        push dword 0x105fc4
000004FC  E869270000        call 0x2c6a
00000501  83C410            add esp,byte +0x10
00000504  83EC08            sub esp,byte +0x8
00000507  68D1000000        push dword 0xd1
0000050C  68C45F1000        push dword 0x105fc4
00000511  E854270000        call 0x2c6a
00000516  83C410            add esp,byte +0x10
00000519  C745F400000000    mov dword [ebp-0xc],0x0
00000520  EB19              jmp short 0x53b
00000522  83EC08            sub esp,byte +0x8
00000525  68CD000000        push dword 0xcd
0000052A  68C45F1000        push dword 0x105fc4
0000052F  E836270000        call 0x2c6a
00000534  83C410            add esp,byte +0x10
00000537  8345F401          add dword [ebp-0xc],byte +0x1
0000053B  8B45D8            mov eax,[ebp-0x28]
0000053E  C1E002            shl eax,byte 0x2
00000541  3945F4            cmp [ebp-0xc],eax
00000544  7CDC              jl 0x522
00000546  83EC08            sub esp,byte +0x8
00000549  68BB000000        push dword 0xbb
0000054E  68C75F1000        push dword 0x105fc7
00000553  E812270000        call 0x2c6a
00000558  83C410            add esp,byte +0x10
0000055B  83EC08            sub esp,byte +0x8
0000055E  68BA000000        push dword 0xba
00000563  68C45F1000        push dword 0x105fc4
00000568  E8FD260000        call 0x2c6a
0000056D  83C410            add esp,byte +0x10
00000570  83EC0C            sub esp,byte +0xc
00000573  68CB5F1000        push dword 0x105fcb
00000578  E8ED260000        call 0x2c6a
0000057D  83C410            add esp,byte +0x10
00000580  83EC08            sub esp,byte +0x8
00000583  68B3000000        push dword 0xb3
00000588  68C45F1000        push dword 0x105fc4
0000058D  E8D8260000        call 0x2c6a
00000592  83C410            add esp,byte +0x10
00000595  C745F000000000    mov dword [ebp-0x10],0x0
0000059C  EB26              jmp short 0x5c4
0000059E  83EC0C            sub esp,byte +0xc
000005A1  68D35E1000        push dword 0x105ed3
000005A6  E8BF260000        call 0x2c6a
000005AB  83C410            add esp,byte +0x10
000005AE  8B45F0            mov eax,[ebp-0x10]
000005B1  0FB6C0            movzx eax,al
000005B4  83EC0C            sub esp,byte +0xc
000005B7  50                push eax
000005B8  E8DE260000        call 0x2c9b
000005BD  83C410            add esp,byte +0x10
000005C0  8345F001          add dword [ebp-0x10],byte +0x1
000005C4  8B45F0            mov eax,[ebp-0x10]
000005C7  3B45D8            cmp eax,[ebp-0x28]
000005CA  7CD2              jl 0x59e
000005CC  83EC08            sub esp,byte +0x8
000005CF  68BA000000        push dword 0xba
000005D4  68C75F1000        push dword 0x105fc7
000005D9  E88C260000        call 0x2c6a
000005DE  83C410            add esp,byte +0x10
000005E1  83EC08            sub esp,byte +0x8
000005E4  68C7000000        push dword 0xc7
000005E9  68C45F1000        push dword 0x105fc4
000005EE  E877260000        call 0x2c6a
000005F3  83C410            add esp,byte +0x10
000005F6  83EC08            sub esp,byte +0x8
000005F9  68C4000000        push dword 0xc4
000005FE  68C45F1000        push dword 0x105fc4
00000603  E862260000        call 0x2c6a
00000608  83C410            add esp,byte +0x10
0000060B  83EC08            sub esp,byte +0x8
0000060E  68C4000000        push dword 0xc4
00000613  68C45F1000        push dword 0x105fc4
00000618  E84D260000        call 0x2c6a
0000061D  83C410            add esp,byte +0x10
00000620  83EC08            sub esp,byte +0x8
00000623  68C4000000        push dword 0xc4
00000628  68C45F1000        push dword 0x105fc4
0000062D  E838260000        call 0x2c6a
00000632  83C410            add esp,byte +0x10
00000635  83EC08            sub esp,byte +0x8
00000638  68C4000000        push dword 0xc4
0000063D  68C45F1000        push dword 0x105fc4
00000642  E823260000        call 0x2c6a
00000647  83C410            add esp,byte +0x10
0000064A  83EC08            sub esp,byte +0x8
0000064D  68C5000000        push dword 0xc5
00000652  68C45F1000        push dword 0x105fc4
00000657  E80E260000        call 0x2c6a
0000065C  83C410            add esp,byte +0x10
0000065F  C745EC00000000    mov dword [ebp-0x14],0x0
00000666  EB19              jmp short 0x681
00000668  83EC08            sub esp,byte +0x8
0000066B  68C4000000        push dword 0xc4
00000670  68C45F1000        push dword 0x105fc4
00000675  E8F0250000        call 0x2c6a
0000067A  83C410            add esp,byte +0x10
0000067D  8345EC01          add dword [ebp-0x14],byte +0x1
00000681  8B45D8            mov eax,[ebp-0x28]
00000684  C1E002            shl eax,byte 0x2
00000687  3945EC            cmp [ebp-0x14],eax
0000068A  7CDC              jl 0x668
0000068C  83EC08            sub esp,byte +0x8
0000068F  68B6000000        push dword 0xb6
00000694  68C75F1000        push dword 0x105fc7
00000699  E8CC250000        call 0x2c6a
0000069E  83C410            add esp,byte +0x10
000006A1  C745E800000000    mov dword [ebp-0x18],0x0
000006A8  E9B7000000        jmp 0x764
000006AD  83EC08            sub esp,byte +0x8
000006B0  68BA000000        push dword 0xba
000006B5  68D05F1000        push dword 0x105fd0
000006BA  E8AB250000        call 0x2c6a
000006BF  83C410            add esp,byte +0x10
000006C2  8B45E8            mov eax,[ebp-0x18]
000006C5  C1E004            shl eax,byte 0x4
000006C8  0FB6C0            movzx eax,al
000006CB  83EC0C            sub esp,byte +0xc
000006CE  50                push eax
000006CF  E8C7250000        call 0x2c9b
000006D4  83C410            add esp,byte +0x10
000006D7  83EC08            sub esp,byte +0x8
000006DA  68B3000000        push dword 0xb3
000006DF  68C45F1000        push dword 0x105fc4
000006E4  E881250000        call 0x2c6a
000006E9  83C410            add esp,byte +0x10
000006EC  C745E400000000    mov dword [ebp-0x1c],0x0
000006F3  EB4E              jmp short 0x743
000006F5  8B45E8            mov eax,[ebp-0x18]
000006F8  89C1              mov ecx,eax
000006FA  8B45D8            mov eax,[ebp-0x28]
000006FD  89C2              mov edx,eax
000006FF  89C8              mov eax,ecx
00000701  0FAFC2            imul eax,edx
00000704  8B55E4            mov edx,[ebp-0x1c]
00000707  01D0              add eax,edx
00000709  8845D7            mov [ebp-0x29],al
0000070C  807DD700          cmp byte [ebp-0x29],0x0
00000710  7406              jz 0x718
00000712  807DD70A          cmp byte [ebp-0x29],0xa
00000716  7512              jnz 0x72a
00000718  83EC0C            sub esp,byte +0xc
0000071B  68CB5F1000        push dword 0x105fcb
00000720  E845250000        call 0x2c6a
00000725  83C410            add esp,byte +0x10
00000728  EB15              jmp short 0x73f
0000072A  0FB645D7          movzx eax,byte [ebp-0x29]
0000072E  83EC08            sub esp,byte +0x8
00000731  50                push eax
00000732  68D45F1000        push dword 0x105fd4
00000737  E82E250000        call 0x2c6a
0000073C  83C410            add esp,byte +0x10
0000073F  8345E401          add dword [ebp-0x1c],byte +0x1
00000743  8B45E4            mov eax,[ebp-0x1c]
00000746  3B45D8            cmp eax,[ebp-0x28]
00000749  7CAA              jl 0x6f5
0000074B  83EC08            sub esp,byte +0x8
0000074E  68BA000000        push dword 0xba
00000753  68C75F1000        push dword 0x105fc7
00000758  E80D250000        call 0x2c6a
0000075D  83C410            add esp,byte +0x10
00000760  8345E801          add dword [ebp-0x18],byte +0x1
00000764  8B45E8            mov eax,[ebp-0x18]
00000767  3B45DC            cmp eax,[ebp-0x24]
0000076A  0F8C3DFFFFFF      jl near 0x6ad
00000770  83EC08            sub esp,byte +0x8
00000773  68C8000000        push dword 0xc8
00000778  68C45F1000        push dword 0x105fc4
0000077D  E8E8240000        call 0x2c6a
00000782  83C410            add esp,byte +0x10
00000785  83EC08            sub esp,byte +0x8
00000788  68CD000000        push dword 0xcd
0000078D  68C45F1000        push dword 0x105fc4
00000792  E8D3240000        call 0x2c6a
00000797  83C410            add esp,byte +0x10
0000079A  83EC08            sub esp,byte +0x8
0000079D  68CD000000        push dword 0xcd
000007A2  68C45F1000        push dword 0x105fc4
000007A7  E8BE240000        call 0x2c6a
000007AC  83C410            add esp,byte +0x10
000007AF  83EC08            sub esp,byte +0x8
000007B2  68CD000000        push dword 0xcd
000007B7  68C45F1000        push dword 0x105fc4
000007BC  E8A9240000        call 0x2c6a
000007C1  83C410            add esp,byte +0x10
000007C4  83EC08            sub esp,byte +0x8
000007C7  68CD000000        push dword 0xcd
000007CC  68C45F1000        push dword 0x105fc4
000007D1  E894240000        call 0x2c6a
000007D6  83C410            add esp,byte +0x10
000007D9  83EC08            sub esp,byte +0x8
000007DC  68CF000000        push dword 0xcf
000007E1  68C45F1000        push dword 0x105fc4
000007E6  E87F240000        call 0x2c6a
000007EB  83C410            add esp,byte +0x10
000007EE  C745E000000000    mov dword [ebp-0x20],0x0
000007F5  EB19              jmp short 0x810
000007F7  83EC08            sub esp,byte +0x8
000007FA  68CD000000        push dword 0xcd
000007FF  68C45F1000        push dword 0x105fc4
00000804  E861240000        call 0x2c6a
00000809  83C410            add esp,byte +0x10
0000080C  8345E001          add dword [ebp-0x20],byte +0x1
00000810  8B45D8            mov eax,[ebp-0x28]
00000813  C1E002            shl eax,byte 0x2
00000816  3945E0            cmp [ebp-0x20],eax
00000819  7CDC              jl 0x7f7
0000081B  83EC08            sub esp,byte +0x8
0000081E  68BC000000        push dword 0xbc
00000823  68C75F1000        push dword 0x105fc7
00000828  E83D240000        call 0x2c6a
0000082D  83C410            add esp,byte +0x10
00000830  90                nop
00000831  C9                leave
00000832  C3                ret
00000833  55                push ebp
00000834  89E5              mov ebp,esp
00000836  83EC38            sub esp,byte +0x38
00000839  C745F4005C2605    mov dword [ebp-0xc],0x5265c00
00000840  C745F080EE3600    mov dword [ebp-0x10],0x36ee80
00000847  C745EC60EA0000    mov dword [ebp-0x14],0xea60
0000084E  C745E8E8030000    mov dword [ebp-0x18],0x3e8
00000855  8B4508            mov eax,[ebp+0x8]
00000858  BA00000000        mov edx,0x0
0000085D  F775F4            div dword [ebp-0xc]
00000860  8945E4            mov [ebp-0x1c],eax
00000863  8B4508            mov eax,[ebp+0x8]
00000866  BA00000000        mov edx,0x0
0000086B  F775F4            div dword [ebp-0xc]
0000086E  895508            mov [ebp+0x8],edx
00000871  8B4508            mov eax,[ebp+0x8]
00000874  BA00000000        mov edx,0x0
00000879  F775F0            div dword [ebp-0x10]
0000087C  8945E0            mov [ebp-0x20],eax
0000087F  8B4508            mov eax,[ebp+0x8]
00000882  BA00000000        mov edx,0x0
00000887  F775F0            div dword [ebp-0x10]
0000088A  895508            mov [ebp+0x8],edx
0000088D  8B4508            mov eax,[ebp+0x8]
00000890  BA00000000        mov edx,0x0
00000895  F775EC            div dword [ebp-0x14]
00000898  8945DC            mov [ebp-0x24],eax
0000089B  8B4508            mov eax,[ebp+0x8]
0000089E  BA00000000        mov edx,0x0
000008A3  F775EC            div dword [ebp-0x14]
000008A6  895508            mov [ebp+0x8],edx
000008A9  8B4508            mov eax,[ebp+0x8]
000008AC  BA00000000        mov edx,0x0
000008B1  F775E8            div dword [ebp-0x18]
000008B4  8945D8            mov [ebp-0x28],eax
000008B7  8B4508            mov eax,[ebp+0x8]
000008BA  BA00000000        mov edx,0x0
000008BF  F775E8            div dword [ebp-0x18]
000008C2  8955D4            mov [ebp-0x2c],edx
000008C5  83EC08            sub esp,byte +0x8
000008C8  FF75E4            push dword [ebp-0x1c]
000008CB  68DA5F1000        push dword 0x105fda
000008D0  E895230000        call 0x2c6a
000008D5  83C410            add esp,byte +0x10
000008D8  83EC08            sub esp,byte +0x8
000008DB  FF75E0            push dword [ebp-0x20]
000008DE  68E35F1000        push dword 0x105fe3
000008E3  E882230000        call 0x2c6a
000008E8  83C410            add esp,byte +0x10
000008EB  83EC08            sub esp,byte +0x8
000008EE  FF75DC            push dword [ebp-0x24]
000008F1  68EF5F1000        push dword 0x105fef
000008F6  E86F230000        call 0x2c6a
000008FB  83C410            add esp,byte +0x10
000008FE  83EC08            sub esp,byte +0x8
00000901  FF75D8            push dword [ebp-0x28]
00000904  68FB5F1000        push dword 0x105ffb
00000909  E85C230000        call 0x2c6a
0000090E  83C410            add esp,byte +0x10
00000911  83EC08            sub esp,byte +0x8
00000914  FF75D4            push dword [ebp-0x2c]
00000917  6808601000        push dword 0x106008
0000091C  E849230000        call 0x2c6a
00000921  83C410            add esp,byte +0x10
00000924  90                nop
00000925  C9                leave
00000926  C3                ret
00000927  55                push ebp
00000928  89E5              mov ebp,esp
0000092A  83EC38            sub esp,byte +0x38
0000092D  C745F4005C2605    mov dword [ebp-0xc],0x5265c00
00000934  C745F080EE3600    mov dword [ebp-0x10],0x36ee80
0000093B  C745EC60EA0000    mov dword [ebp-0x14],0xea60
00000942  C745E8E8030000    mov dword [ebp-0x18],0x3e8
00000949  8B4508            mov eax,[ebp+0x8]
0000094C  BA00000000        mov edx,0x0
00000951  F775F4            div dword [ebp-0xc]
00000954  8945E4            mov [ebp-0x1c],eax
00000957  8B4508            mov eax,[ebp+0x8]
0000095A  BA00000000        mov edx,0x0
0000095F  F775F4            div dword [ebp-0xc]
00000962  895508            mov [ebp+0x8],edx
00000965  8B4508            mov eax,[ebp+0x8]
00000968  BA00000000        mov edx,0x0
0000096D  F775F0            div dword [ebp-0x10]
00000970  8945E0            mov [ebp-0x20],eax
00000973  8B4508            mov eax,[ebp+0x8]
00000976  BA00000000        mov edx,0x0
0000097B  F775F0            div dword [ebp-0x10]
0000097E  895508            mov [ebp+0x8],edx
00000981  8B4508            mov eax,[ebp+0x8]
00000984  BA00000000        mov edx,0x0
00000989  F775EC            div dword [ebp-0x14]
0000098C  8945DC            mov [ebp-0x24],eax
0000098F  8B4508            mov eax,[ebp+0x8]
00000992  BA00000000        mov edx,0x0
00000997  F775EC            div dword [ebp-0x14]
0000099A  895508            mov [ebp+0x8],edx
0000099D  8B4508            mov eax,[ebp+0x8]
000009A0  BA00000000        mov edx,0x0
000009A5  F775E8            div dword [ebp-0x18]
000009A8  8945D8            mov [ebp-0x28],eax
000009AB  8B4508            mov eax,[ebp+0x8]
000009AE  BA00000000        mov edx,0x0
000009B3  F775E8            div dword [ebp-0x18]
000009B6  8955D4            mov [ebp-0x2c],edx
000009B9  83EC08            sub esp,byte +0x8
000009BC  FF75E0            push dword [ebp-0x20]
000009BF  681A601000        push dword 0x10601a
000009C4  E8A1220000        call 0x2c6a
000009C9  83C410            add esp,byte +0x10
000009CC  83EC08            sub esp,byte +0x8
000009CF  FF75DC            push dword [ebp-0x24]
000009D2  681A601000        push dword 0x10601a
000009D7  E88E220000        call 0x2c6a
000009DC  83C410            add esp,byte +0x10
000009DF  83EC08            sub esp,byte +0x8
000009E2  FF75D8            push dword [ebp-0x28]
000009E5  681E601000        push dword 0x10601e
000009EA  E87B220000        call 0x2c6a
000009EF  83C410            add esp,byte +0x10
000009F2  E8F41A0000        call 0x24eb
000009F7  90                nop
000009F8  C9                leave
000009F9  C3                ret
000009FA  55                push ebp
000009FB  89E5              mov ebp,esp
000009FD  83EC18            sub esp,byte +0x18
00000A00  83EC08            sub esp,byte +0x8
00000A03  6A0A              push byte +0xa
00000A05  68D4030000        push dword 0x3d4
00000A0A  E8432A0000        call 0x3452
00000A0F  83C410            add esp,byte +0x10
00000A12  83EC0C            sub esp,byte +0xc
00000A15  68D5030000        push dword 0x3d5
00000A1A  E8162A0000        call 0x3435
00000A1F  83C410            add esp,byte +0x10
00000A22  8845F7            mov [ebp-0x9],al
00000A25  804DF720          or byte [ebp-0x9],0x20
00000A29  0FB645F7          movzx eax,byte [ebp-0x9]
00000A2D  83EC08            sub esp,byte +0x8
00000A30  50                push eax
00000A31  68D5030000        push dword 0x3d5
00000A36  E8172A0000        call 0x3452
00000A3B  83C410            add esp,byte +0x10
00000A3E  90                nop
00000A3F  C9                leave
00000A40  C3                ret
00000A41  55                push ebp
00000A42  89E5              mov ebp,esp
00000A44  83EC18            sub esp,byte +0x18
00000A47  83EC08            sub esp,byte +0x8
00000A4A  6A0A              push byte +0xa
00000A4C  68D4030000        push dword 0x3d4
00000A51  E8FC290000        call 0x3452
00000A56  83C410            add esp,byte +0x10
00000A59  83EC0C            sub esp,byte +0xc
00000A5C  68D5030000        push dword 0x3d5
00000A61  E8CF290000        call 0x3435
00000A66  83C410            add esp,byte +0x10
00000A69  8845F7            mov [ebp-0x9],al
00000A6C  8065F7DF          and byte [ebp-0x9],0xdf
00000A70  0FB645F7          movzx eax,byte [ebp-0x9]
00000A74  83EC08            sub esp,byte +0x8
00000A77  50                push eax
00000A78  68D5030000        push dword 0x3d5
00000A7D  E8D0290000        call 0x3452
00000A82  83C410            add esp,byte +0x10
00000A85  90                nop
00000A86  C9                leave
00000A87  C3                ret
00000A88  55                push ebp
00000A89  89E5              mov ebp,esp
00000A8B  83EC18            sub esp,byte +0x18
00000A8E  83EC0C            sub esp,byte +0xc
00000A91  6800010000        push dword 0x100
00000A96  E8472E0000        call 0x38e2
00000A9B  83C410            add esp,byte +0x10
00000A9E  8945F4            mov [ebp-0xc],eax
00000AA1  83EC0C            sub esp,byte +0xc
00000AA4  6880000000        push dword 0x80
00000AA9  E8342E0000        call 0x38e2
00000AAE  83C410            add esp,byte +0x10
00000AB1  8945F0            mov [ebp-0x10],eax
00000AB4  83EC08            sub esp,byte +0x8
00000AB7  FF75F4            push dword [ebp-0xc]
00000ABA  6821601000        push dword 0x106021
00000ABF  E8A6210000        call 0x2c6a
00000AC4  83C410            add esp,byte +0x10
00000AC7  83EC0C            sub esp,byte +0xc
00000ACA  682B601000        push dword 0x10602b
00000ACF  E896210000        call 0x2c6a
00000AD4  83C410            add esp,byte +0x10
00000AD7  E8C62F0000        call 0x3aa2
00000ADC  83EC0C            sub esp,byte +0xc
00000ADF  FF75F4            push dword [ebp-0xc]
00000AE2  E8BC2E0000        call 0x39a3
00000AE7  83C410            add esp,byte +0x10
00000AEA  83EC0C            sub esp,byte +0xc
00000AED  6840601000        push dword 0x106040
00000AF2  E873210000        call 0x2c6a
00000AF7  83C410            add esp,byte +0x10
00000AFA  E8A32F0000        call 0x3aa2
00000AFF  83EC0C            sub esp,byte +0xc
00000B02  FF75F0            push dword [ebp-0x10]
00000B05  E8992E0000        call 0x39a3
00000B0A  83C410            add esp,byte +0x10
00000B0D  83EC0C            sub esp,byte +0xc
00000B10  6868601000        push dword 0x106068
00000B15  E850210000        call 0x2c6a
00000B1A  83C410            add esp,byte +0x10
00000B1D  E8802F0000        call 0x3aa2
00000B22  B800000000        mov eax,0x0
00000B27  C9                leave
00000B28  C3                ret
00000B29  55                push ebp
00000B2A  89E5              mov ebp,esp
00000B2C  83EC18            sub esp,byte +0x18
00000B2F  83EC0C            sub esp,byte +0xc
00000B32  6A0C              push byte +0xc
00000B34  E8A92D0000        call 0x38e2
00000B39  83C410            add esp,byte +0x10
00000B3C  8945F4            mov [ebp-0xc],eax
00000B3F  8B45F4            mov eax,[ebp-0xc]
00000B42  8B550C            mov edx,[ebp+0xc]
00000B45  8910              mov [eax],edx
00000B47  8B45F4            mov eax,[ebp-0xc]
00000B4A  C7400400000000    mov dword [eax+0x4],0x0
00000B51  8B4508            mov eax,[ebp+0x8]
00000B54  8B10              mov edx,[eax]
00000B56  8B45F4            mov eax,[ebp-0xc]
00000B59  895008            mov [eax+0x8],edx
00000B5C  8B4508            mov eax,[ebp+0x8]
00000B5F  8B00              mov eax,[eax]
00000B61  85C0              test eax,eax
00000B63  740D              jz 0xb72
00000B65  8B4508            mov eax,[ebp+0x8]
00000B68  8B00              mov eax,[eax]
00000B6A  8B55F4            mov edx,[ebp-0xc]
00000B6D  895004            mov [eax+0x4],edx
00000B70  EB09              jmp short 0xb7b
00000B72  8B4508            mov eax,[ebp+0x8]
00000B75  8B55F4            mov edx,[ebp-0xc]
00000B78  895004            mov [eax+0x4],edx
00000B7B  8B4508            mov eax,[ebp+0x8]
00000B7E  8B55F4            mov edx,[ebp-0xc]
00000B81  8910              mov [eax],edx
00000B83  90                nop
00000B84  C9                leave
00000B85  C3                ret
00000B86  55                push ebp
00000B87  89E5              mov ebp,esp
00000B89  83EC18            sub esp,byte +0x18
00000B8C  83EC0C            sub esp,byte +0xc
00000B8F  6A0C              push byte +0xc
00000B91  E84C2D0000        call 0x38e2
00000B96  83C410            add esp,byte +0x10
00000B99  8945F4            mov [ebp-0xc],eax
00000B9C  8B45F4            mov eax,[ebp-0xc]
00000B9F  8B550C            mov edx,[ebp+0xc]
00000BA2  8910              mov [eax],edx
00000BA4  8B4508            mov eax,[ebp+0x8]
00000BA7  8B5004            mov edx,[eax+0x4]
00000BAA  8B45F4            mov eax,[ebp-0xc]
00000BAD  895004            mov [eax+0x4],edx
00000BB0  8B45F4            mov eax,[ebp-0xc]
00000BB3  C7400800000000    mov dword [eax+0x8],0x0
00000BBA  8B4508            mov eax,[ebp+0x8]
00000BBD  8B4004            mov eax,[eax+0x4]
00000BC0  85C0              test eax,eax
00000BC2  740E              jz 0xbd2
00000BC4  8B4508            mov eax,[ebp+0x8]
00000BC7  8B4004            mov eax,[eax+0x4]
00000BCA  8B55F4            mov edx,[ebp-0xc]
00000BCD  895008            mov [eax+0x8],edx
00000BD0  EB08              jmp short 0xbda
00000BD2  8B4508            mov eax,[ebp+0x8]
00000BD5  8B55F4            mov edx,[ebp-0xc]
00000BD8  8910              mov [eax],edx
00000BDA  8B4508            mov eax,[ebp+0x8]
00000BDD  8B55F4            mov edx,[ebp-0xc]
00000BE0  895004            mov [eax+0x4],edx
00000BE3  90                nop
00000BE4  C9                leave
00000BE5  C3                ret
00000BE6  55                push ebp
00000BE7  89E5              mov ebp,esp
00000BE9  83EC08            sub esp,byte +0x8
00000BEC  8B450C            mov eax,[ebp+0xc]
00000BEF  8B4004            mov eax,[eax+0x4]
00000BF2  85C0              test eax,eax
00000BF4  7411              jz 0xc07
00000BF6  8B450C            mov eax,[ebp+0xc]
00000BF9  8B4004            mov eax,[eax+0x4]
00000BFC  8B550C            mov edx,[ebp+0xc]
00000BFF  8B5208            mov edx,[edx+0x8]
00000C02  895008            mov [eax+0x8],edx
00000C05  EB0B              jmp short 0xc12
00000C07  8B450C            mov eax,[ebp+0xc]
00000C0A  8B5008            mov edx,[eax+0x8]
00000C0D  8B4508            mov eax,[ebp+0x8]
00000C10  8910              mov [eax],edx
00000C12  8B450C            mov eax,[ebp+0xc]
00000C15  8B4008            mov eax,[eax+0x8]
00000C18  85C0              test eax,eax
00000C1A  7411              jz 0xc2d
00000C1C  8B450C            mov eax,[ebp+0xc]
00000C1F  8B4008            mov eax,[eax+0x8]
00000C22  8B550C            mov edx,[ebp+0xc]
00000C25  8B5204            mov edx,[edx+0x4]
00000C28  895004            mov [eax+0x4],edx
00000C2B  EB0C              jmp short 0xc39
00000C2D  8B450C            mov eax,[ebp+0xc]
00000C30  8B5004            mov edx,[eax+0x4]
00000C33  8B4508            mov eax,[ebp+0x8]
00000C36  895004            mov [eax+0x4],edx
00000C39  83EC0C            sub esp,byte +0xc
00000C3C  FF750C            push dword [ebp+0xc]
00000C3F  E85F2D0000        call 0x39a3
00000C44  83C410            add esp,byte +0x10
00000C47  90                nop
00000C48  C9                leave
00000C49  C3                ret
00000C4A  55                push ebp
00000C4B  89E5              mov ebp,esp
00000C4D  83EC18            sub esp,byte +0x18
00000C50  8B4508            mov eax,[ebp+0x8]
00000C53  8B00              mov eax,[eax]
00000C55  8945F4            mov [ebp-0xc],eax
00000C58  EB34              jmp short 0xc8e
00000C5A  83EC08            sub esp,byte +0x8
00000C5D  FF75F4            push dword [ebp-0xc]
00000C60  688F601000        push dword 0x10608f
00000C65  E800200000        call 0x2c6a
00000C6A  83C410            add esp,byte +0x10
00000C6D  8B45F4            mov eax,[ebp-0xc]
00000C70  8B00              mov eax,[eax]
00000C72  8B00              mov eax,[eax]
00000C74  83EC08            sub esp,byte +0x8
00000C77  50                push eax
00000C78  68A0601000        push dword 0x1060a0
00000C7D  E8E81F0000        call 0x2c6a
00000C82  83C410            add esp,byte +0x10
00000C85  8B45F4            mov eax,[ebp-0xc]
00000C88  8B4008            mov eax,[eax+0x8]
00000C8B  8945F4            mov [ebp-0xc],eax
00000C8E  837DF400          cmp dword [ebp-0xc],byte +0x0
00000C92  75C6              jnz 0xc5a
00000C94  90                nop
00000C95  90                nop
00000C96  C9                leave
00000C97  C3                ret
00000C98  55                push ebp
00000C99  89E5              mov ebp,esp
00000C9B  83EC18            sub esp,byte +0x18
00000C9E  8B4508            mov eax,[ebp+0x8]
00000CA1  8B00              mov eax,[eax]
00000CA3  8945F4            mov [ebp-0xc],eax
00000CA6  EB1D              jmp short 0xcc5
00000CA8  8B45F4            mov eax,[ebp-0xc]
00000CAB  8945F0            mov [ebp-0x10],eax
00000CAE  8B45F4            mov eax,[ebp-0xc]
00000CB1  8B4008            mov eax,[eax+0x8]
00000CB4  8945F4            mov [ebp-0xc],eax
00000CB7  83EC0C            sub esp,byte +0xc
00000CBA  FF75F0            push dword [ebp-0x10]
00000CBD  E8E12C0000        call 0x39a3
00000CC2  83C410            add esp,byte +0x10
00000CC5  837DF400          cmp dword [ebp-0xc],byte +0x0
00000CC9  75DD              jnz 0xca8
00000CCB  90                nop
00000CCC  90                nop
00000CCD  C9                leave
00000CCE  C3                ret
00000CCF  55                push ebp
00000CD0  89E5              mov ebp,esp
00000CD2  83EC28            sub esp,byte +0x28
00000CD5  C745EC00000000    mov dword [ebp-0x14],0x0
00000CDC  C745F000000000    mov dword [ebp-0x10],0x0
00000CE3  C745E801000000    mov dword [ebp-0x18],0x1
00000CEA  C745E402000000    mov dword [ebp-0x1c],0x2
00000CF1  C745E003000000    mov dword [ebp-0x20],0x3
00000CF8  83EC08            sub esp,byte +0x8
00000CFB  8D45E8            lea eax,[ebp-0x18]
00000CFE  50                push eax
00000CFF  8D45EC            lea eax,[ebp-0x14]
00000D02  50                push eax
00000D03  E87EFEFFFF        call 0xb86
00000D08  83C410            add esp,byte +0x10
00000D0B  83EC08            sub esp,byte +0x8
00000D0E  8D45E4            lea eax,[ebp-0x1c]
00000D11  50                push eax
00000D12  8D45EC            lea eax,[ebp-0x14]
00000D15  50                push eax
00000D16  E86BFEFFFF        call 0xb86
00000D1B  83C410            add esp,byte +0x10
00000D1E  83EC08            sub esp,byte +0x8
00000D21  8D45E0            lea eax,[ebp-0x20]
00000D24  50                push eax
00000D25  8D45EC            lea eax,[ebp-0x14]
00000D28  50                push eax
00000D29  E8FBFDFFFF        call 0xb29
00000D2E  83C410            add esp,byte +0x10
00000D31  83EC0C            sub esp,byte +0xc
00000D34  68AB601000        push dword 0x1060ab
00000D39  E82C1F0000        call 0x2c6a
00000D3E  83C410            add esp,byte +0x10
00000D41  83EC0C            sub esp,byte +0xc
00000D44  8D45EC            lea eax,[ebp-0x14]
00000D47  50                push eax
00000D48  E8FDFEFFFF        call 0xc4a
00000D4D  83C410            add esp,byte +0x10
00000D50  8B45EC            mov eax,[ebp-0x14]
00000D53  8B4008            mov eax,[eax+0x8]
00000D56  8945F4            mov [ebp-0xc],eax
00000D59  83EC08            sub esp,byte +0x8
00000D5C  FF75F4            push dword [ebp-0xc]
00000D5F  8D45EC            lea eax,[ebp-0x14]
00000D62  50                push eax
00000D63  E87EFEFFFF        call 0xbe6
00000D68  83C410            add esp,byte +0x10
00000D6B  83EC0C            sub esp,byte +0xc
00000D6E  68B2601000        push dword 0x1060b2
00000D73  E8F21E0000        call 0x2c6a
00000D78  83C410            add esp,byte +0x10
00000D7B  83EC0C            sub esp,byte +0xc
00000D7E  8D45EC            lea eax,[ebp-0x14]
00000D81  50                push eax
00000D82  E8C3FEFFFF        call 0xc4a
00000D87  83C410            add esp,byte +0x10
00000D8A  83EC0C            sub esp,byte +0xc
00000D8D  8D45EC            lea eax,[ebp-0x14]
00000D90  50                push eax
00000D91  E802FFFFFF        call 0xc98
00000D96  83C410            add esp,byte +0x10
00000D99  B800000000        mov eax,0x0
00000D9E  C9                leave
00000D9F  C3                ret
00000DA0  55                push ebp
00000DA1  89E5              mov ebp,esp
00000DA3  83EC58            sub esp,byte +0x58
00000DA6  E83F150000        call 0x22ea
00000DAB  8945F0            mov [ebp-0x10],eax
00000DAE  83EC08            sub esp,byte +0x8
00000DB1  68C7601000        push dword 0x1060c7
00000DB6  FF7508            push dword [ebp+0x8]
00000DB9  E8202E0000        call 0x3bde
00000DBE  83C410            add esp,byte +0x10
00000DC1  85C0              test eax,eax
00000DC3  0F8487050000      jz near 0x1350
00000DC9  83EC08            sub esp,byte +0x8
00000DCC  68C8601000        push dword 0x1060c8
00000DD1  FF7508            push dword [ebp+0x8]
00000DD4  E8052E0000        call 0x3bde
00000DD9  83C410            add esp,byte +0x10
00000DDC  85C0              test eax,eax
00000DDE  751F              jnz 0xdff
00000DE0  83EC08            sub esp,byte +0x8
00000DE3  68CF0C1000        push dword 0x100ccf
00000DE8  68D0601000        push dword 0x1060d0
00000DED  E8781E0000        call 0x2c6a
00000DF2  83C410            add esp,byte +0x10
00000DF5  E8D5FEFFFF        call 0xccf
00000DFA  E93F050000        jmp 0x133e
00000DFF  83EC08            sub esp,byte +0x8
00000E02  68DD601000        push dword 0x1060dd
00000E07  FF7508            push dword [ebp+0x8]
00000E0A  E8CF2D0000        call 0x3bde
00000E0F  83C410            add esp,byte +0x10
00000E12  85C0              test eax,eax
00000E14  753D              jnz 0xe53
00000E16  E851370000        call 0x456c
00000E1B  C745F400000000    mov dword [ebp-0xc],0x0
00000E22  EB24              jmp short 0xe48
00000E24  83EC08            sub esp,byte +0x8
00000E27  6A64              push byte +0x64
00000E29  6A01              push byte +0x1
00000E2B  E87B370000        call 0x45ab
00000E30  83C410            add esp,byte +0x10
00000E33  83EC08            sub esp,byte +0x8
00000E36  50                push eax
00000E37  68E4601000        push dword 0x1060e4
00000E3C  E8291E0000        call 0x2c6a
00000E41  83C410            add esp,byte +0x10
00000E44  8345F401          add dword [ebp-0xc],byte +0x1
00000E48  837DF409          cmp dword [ebp-0xc],byte +0x9
00000E4C  7ED6              jng 0xe24
00000E4E  E9EB040000        jmp 0x133e
00000E53  83EC08            sub esp,byte +0x8
00000E56  68E8601000        push dword 0x1060e8
00000E5B  FF7508            push dword [ebp+0x8]
00000E5E  E87B2D0000        call 0x3bde
00000E63  83C410            add esp,byte +0x10
00000E66  85C0              test eax,eax
00000E68  750A              jnz 0xe74
00000E6A  E836350000        call 0x43a5
00000E6F  E9CA040000        jmp 0x133e
00000E74  83EC08            sub esp,byte +0x8
00000E77  68ED601000        push dword 0x1060ed
00000E7C  FF7508            push dword [ebp+0x8]
00000E7F  E85A2D0000        call 0x3bde
00000E84  83C410            add esp,byte +0x10
00000E87  85C0              test eax,eax
00000E89  750A              jnz 0xe95
00000E8B  E87D380000        call 0x470d
00000E90  E9A9040000        jmp 0x133e
00000E95  83EC08            sub esp,byte +0x8
00000E98  68F3601000        push dword 0x1060f3
00000E9D  FF7508            push dword [ebp+0x8]
00000EA0  E8392D0000        call 0x3bde
00000EA5  83C410            add esp,byte +0x10
00000EA8  85C0              test eax,eax
00000EAA  7516              jnz 0xec2
00000EAC  E8EA260000        call 0x359b
00000EB1  83EC0C            sub esp,byte +0xc
00000EB4  50                push eax
00000EB5  E86DFAFFFF        call 0x927
00000EBA  83C410            add esp,byte +0x10
00000EBD  E97C040000        jmp 0x133e
00000EC2  83EC08            sub esp,byte +0x8
00000EC5  68FA601000        push dword 0x1060fa
00000ECA  FF7508            push dword [ebp+0x8]
00000ECD  E80C2D0000        call 0x3bde
00000ED2  83C410            add esp,byte +0x10
00000ED5  85C0              test eax,eax
00000ED7  750A              jnz 0xee3
00000ED9  E81CFBFFFF        call 0x9fa
00000EDE  E95B040000        jmp 0x133e
00000EE3  83EC08            sub esp,byte +0x8
00000EE6  68FF601000        push dword 0x1060ff
00000EEB  FF7508            push dword [ebp+0x8]
00000EEE  E8EB2C0000        call 0x3bde
00000EF3  83C410            add esp,byte +0x10
00000EF6  85C0              test eax,eax
00000EF8  750A              jnz 0xf04
00000EFA  E842FBFFFF        call 0xa41
00000EFF  E93A040000        jmp 0x133e
00000F04  83EC08            sub esp,byte +0x8
00000F07  6804611000        push dword 0x106104
00000F0C  FF7508            push dword [ebp+0x8]
00000F0F  E8CA2C0000        call 0x3bde
00000F14  83C410            add esp,byte +0x10
00000F17  85C0              test eax,eax
00000F19  750A              jnz 0xf25
00000F1B  E886110000        call 0x20a6
00000F20  E919040000        jmp 0x133e
00000F25  83EC08            sub esp,byte +0x8
00000F28  6809611000        push dword 0x106109
00000F2D  FF7508            push dword [ebp+0x8]
00000F30  E8A92C0000        call 0x3bde
00000F35  83C410            add esp,byte +0x10
00000F38  85C0              test eax,eax
00000F3A  750A              jnz 0xf46
00000F3C  E82D330000        call 0x426e
00000F41  E9F8030000        jmp 0x133e
00000F46  83EC08            sub esp,byte +0x8
00000F49  6812611000        push dword 0x106112
00000F4E  FF7508            push dword [ebp+0x8]
00000F51  E8882C0000        call 0x3bde
00000F56  83C410            add esp,byte +0x10
00000F59  85C0              test eax,eax
00000F5B  750C              jnz 0xf69
00000F5D  C605A1A5100001    mov byte [dword 0x10a5a1],0x1
00000F64  E9D5030000        jmp 0x133e
00000F69  83EC08            sub esp,byte +0x8
00000F6C  6817611000        push dword 0x106117
00000F71  FF7508            push dword [ebp+0x8]
00000F74  E8652C0000        call 0x3bde
00000F79  83C410            add esp,byte +0x10
00000F7C  85C0              test eax,eax
00000F7E  752C              jnz 0xfac
00000F80  83EC0C            sub esp,byte +0xc
00000F83  681E611000        push dword 0x10611e
00000F88  E8DD1C0000        call 0x2c6a
00000F8D  83C410            add esp,byte +0x10
00000F90  83EC04            sub esp,byte +0x4
00000F93  6800002000        push dword 0x200000
00000F98  68400B0000        push dword 0xb40
00000F9D  6A02              push byte +0x2
00000F9F  E8D71F0000        call 0x2f7b
00000FA4  83C410            add esp,byte +0x10
00000FA7  E992030000        jmp 0x133e
00000FAC  83EC08            sub esp,byte +0x8
00000FAF  683B611000        push dword 0x10613b
00000FB4  FF7508            push dword [ebp+0x8]
00000FB7  E88D2E0000        call 0x3e49
00000FBC  83C410            add esp,byte +0x10
00000FBF  394508            cmp [ebp+0x8],eax
00000FC2  0F8594000000      jnz near 0x105c
00000FC8  8B4508            mov eax,[ebp+0x8]
00000FCB  83C005            add eax,byte +0x5
00000FCE  83EC08            sub esp,byte +0x8
00000FD1  68D35E1000        push dword 0x105ed3
00000FD6  50                push eax
00000FD7  E8032F0000        call 0x3edf
00000FDC  83C410            add esp,byte +0x10
00000FDF  8945B8            mov [ebp-0x48],eax
00000FE2  83EC08            sub esp,byte +0x8
00000FE5  68D35E1000        push dword 0x105ed3
00000FEA  6A00              push byte +0x0
00000FEC  E8EE2E0000        call 0x3edf
00000FF1  83C410            add esp,byte +0x10
00000FF4  8945B4            mov [ebp-0x4c],eax
00000FF7  837DB800          cmp dword [ebp-0x48],byte +0x0
00000FFB  744A              jz 0x1047
00000FFD  837DB400          cmp dword [ebp-0x4c],byte +0x0
00001001  7444              jz 0x1047
00001003  83EC04            sub esp,byte +0x4
00001006  6A00              push byte +0x0
00001008  6A00              push byte +0x0
0000100A  FF75B8            push dword [ebp-0x48]
0000100D  E8D02C0000        call 0x3ce2
00001012  83C410            add esp,byte +0x10
00001015  8945B0            mov [ebp-0x50],eax
00001018  83EC04            sub esp,byte +0x4
0000101B  6A00              push byte +0x0
0000101D  6A00              push byte +0x0
0000101F  FF75B4            push dword [ebp-0x4c]
00001022  E8BB2C0000        call 0x3ce2
00001027  83C410            add esp,byte +0x10
0000102A  668945AE          mov [ebp-0x52],ax
0000102E  0FB755AE          movzx edx,word [ebp-0x52]
00001032  8B45B0            mov eax,[ebp-0x50]
00001035  83EC08            sub esp,byte +0x8
00001038  52                push edx
00001039  50                push eax
0000103A  E8C21C0000        call 0x2d01
0000103F  83C410            add esp,byte +0x10
00001042  E9F7020000        jmp 0x133e
00001047  83EC0C            sub esp,byte +0xc
0000104A  6840611000        push dword 0x106140
0000104F  E8FF130000        call 0x2453
00001054  83C410            add esp,byte +0x10
00001057  E9E2020000        jmp 0x133e
0000105C  83EC08            sub esp,byte +0x8
0000105F  6877611000        push dword 0x106177
00001064  FF7508            push dword [ebp+0x8]
00001067  E8DD2D0000        call 0x3e49
0000106C  83C410            add esp,byte +0x10
0000106F  394508            cmp [ebp+0x8],eax
00001072  0F8596000000      jnz near 0x110e
00001078  8B4508            mov eax,[ebp+0x8]
0000107B  83C007            add eax,byte +0x7
0000107E  83EC08            sub esp,byte +0x8
00001081  68D35E1000        push dword 0x105ed3
00001086  50                push eax
00001087  E8532E0000        call 0x3edf
0000108C  83C410            add esp,byte +0x10
0000108F  8945C8            mov [ebp-0x38],eax
00001092  83EC08            sub esp,byte +0x8
00001095  68D35E1000        push dword 0x105ed3
0000109A  6A00              push byte +0x0
0000109C  E83E2E0000        call 0x3edf
000010A1  83C410            add esp,byte +0x10
000010A4  8945C4            mov [ebp-0x3c],eax
000010A7  837DC800          cmp dword [ebp-0x38],byte +0x0
000010AB  744C              jz 0x10f9
000010AD  837DC400          cmp dword [ebp-0x3c],byte +0x0
000010B1  7446              jz 0x10f9
000010B3  83EC04            sub esp,byte +0x4
000010B6  6A00              push byte +0x0
000010B8  6A00              push byte +0x0
000010BA  FF75C8            push dword [ebp-0x38]
000010BD  E8202C0000        call 0x3ce2
000010C2  83C410            add esp,byte +0x10
000010C5  8945C0            mov [ebp-0x40],eax
000010C8  83EC04            sub esp,byte +0x4
000010CB  6A00              push byte +0x0
000010CD  6A00              push byte +0x0
000010CF  FF75C4            push dword [ebp-0x3c]
000010D2  E80B2C0000        call 0x3ce2
000010D7  83C410            add esp,byte +0x10
000010DA  668945BE          mov [ebp-0x42],ax
000010DE  0FB755BE          movzx edx,word [ebp-0x42]
000010E2  8B45C0            mov eax,[ebp-0x40]
000010E5  83EC04            sub esp,byte +0x4
000010E8  6A01              push byte +0x1
000010EA  52                push edx
000010EB  50                push eax
000010EC  E82E270000        call 0x381f
000010F1  83C410            add esp,byte +0x10
000010F4  E945020000        jmp 0x133e
000010F9  83EC0C            sub esp,byte +0xc
000010FC  6880611000        push dword 0x106180
00001101  E84D130000        call 0x2453
00001106  83C410            add esp,byte +0x10
00001109  E930020000        jmp 0x133e
0000110E  83EC08            sub esp,byte +0x8
00001111  68B5611000        push dword 0x1061b5
00001116  FF7508            push dword [ebp+0x8]
00001119  E82B2D0000        call 0x3e49
0000111E  83C410            add esp,byte +0x10
00001121  394508            cmp [ebp+0x8],eax
00001124  0F85C8000000      jnz near 0x11f2
0000112A  8B4508            mov eax,[ebp+0x8]
0000112D  83C007            add eax,byte +0x7
00001130  83EC08            sub esp,byte +0x8
00001133  68D35E1000        push dword 0x105ed3
00001138  50                push eax
00001139  E8A12D0000        call 0x3edf
0000113E  83C410            add esp,byte +0x10
00001141  8945E0            mov [ebp-0x20],eax
00001144  83EC08            sub esp,byte +0x8
00001147  68D35E1000        push dword 0x105ed3
0000114C  6A00              push byte +0x0
0000114E  E88C2D0000        call 0x3edf
00001153  83C410            add esp,byte +0x10
00001156  8945DC            mov [ebp-0x24],eax
00001159  83EC08            sub esp,byte +0x8
0000115C  68D35E1000        push dword 0x105ed3
00001161  6A00              push byte +0x0
00001163  E8772D0000        call 0x3edf
00001168  83C410            add esp,byte +0x10
0000116B  8945D8            mov [ebp-0x28],eax
0000116E  837DE000          cmp dword [ebp-0x20],byte +0x0
00001172  7469              jz 0x11dd
00001174  837DDC00          cmp dword [ebp-0x24],byte +0x0
00001178  7463              jz 0x11dd
0000117A  837DD800          cmp dword [ebp-0x28],byte +0x0
0000117E  745D              jz 0x11dd
00001180  83EC04            sub esp,byte +0x4
00001183  6A00              push byte +0x0
00001185  6A00              push byte +0x0
00001187  FF75E0            push dword [ebp-0x20]
0000118A  E8532B0000        call 0x3ce2
0000118F  83C410            add esp,byte +0x10
00001192  8945D4            mov [ebp-0x2c],eax
00001195  83EC04            sub esp,byte +0x4
00001198  6A00              push byte +0x0
0000119A  6A00              push byte +0x0
0000119C  FF75DC            push dword [ebp-0x24]
0000119F  E83E2B0000        call 0x3ce2
000011A4  83C410            add esp,byte +0x10
000011A7  8945D0            mov [ebp-0x30],eax
000011AA  83EC04            sub esp,byte +0x4
000011AD  6A00              push byte +0x0
000011AF  6A00              push byte +0x0
000011B1  FF75D8            push dword [ebp-0x28]
000011B4  E8292B0000        call 0x3ce2
000011B9  83C410            add esp,byte +0x10
000011BC  668945CE          mov [ebp-0x32],ax
000011C0  0FB74DCE          movzx ecx,word [ebp-0x32]
000011C4  8B55D4            mov edx,[ebp-0x2c]
000011C7  8B45D0            mov eax,[ebp-0x30]
000011CA  83EC04            sub esp,byte +0x4
000011CD  51                push ecx
000011CE  52                push edx
000011CF  50                push eax
000011D0  E8D7250000        call 0x37ac
000011D5  83C410            add esp,byte +0x10
000011D8  E961010000        jmp 0x133e
000011DD  83EC0C            sub esp,byte +0xc
000011E0  68BC611000        push dword 0x1061bc
000011E5  E869120000        call 0x2453
000011EA  83C410            add esp,byte +0x10
000011ED  E94C010000        jmp 0x133e
000011F2  83EC08            sub esp,byte +0x8
000011F5  68F9611000        push dword 0x1061f9
000011FA  FF7508            push dword [ebp+0x8]
000011FD  E8472C0000        call 0x3e49
00001202  83C410            add esp,byte +0x10
00001205  394508            cmp [ebp+0x8],eax
00001208  755A              jnz 0x1264
0000120A  8B4508            mov eax,[ebp+0x8]
0000120D  83C004            add eax,byte +0x4
00001210  83EC08            sub esp,byte +0x8
00001213  68D35E1000        push dword 0x105ed3
00001218  50                push eax
00001219  E8C12C0000        call 0x3edf
0000121E  83C410            add esp,byte +0x10
00001221  8945EC            mov [ebp-0x14],eax
00001224  837DEC00          cmp dword [ebp-0x14],byte +0x0
00001228  7425              jz 0x124f
0000122A  83EC04            sub esp,byte +0x4
0000122D  6A00              push byte +0x0
0000122F  6A00              push byte +0x0
00001231  FF75EC            push dword [ebp-0x14]
00001234  E8A92A0000        call 0x3ce2
00001239  83C410            add esp,byte +0x10
0000123C  8945E8            mov [ebp-0x18],eax
0000123F  8B45E8            mov eax,[ebp-0x18]
00001242  8945E4            mov [ebp-0x1c],eax
00001245  8B45E4            mov eax,[ebp-0x1c]
00001248  FFD0              call eax
0000124A  E9EF000000        jmp 0x133e
0000124F  83EC0C            sub esp,byte +0xc
00001252  6800621000        push dword 0x106200
00001257  E8F7110000        call 0x2453
0000125C  83C410            add esp,byte +0x10
0000125F  E9DA000000        jmp 0x133e
00001264  83EC08            sub esp,byte +0x8
00001267  682F621000        push dword 0x10622f
0000126C  FF7508            push dword [ebp+0x8]
0000126F  E8D52B0000        call 0x3e49
00001274  83C410            add esp,byte +0x10
00001277  394508            cmp [ebp+0x8],eax
0000127A  750A              jnz 0x1286
0000127C  E806F2FFFF        call 0x487
00001281  E9B8000000        jmp 0x133e
00001286  83EC08            sub esp,byte +0x8
00001289  68465F1000        push dword 0x105f46
0000128E  FF7508            push dword [ebp+0x8]
00001291  E8B32B0000        call 0x3e49
00001296  83C410            add esp,byte +0x10
00001299  394508            cmp [ebp+0x8],eax
0000129C  7513              jnz 0x12b1
0000129E  83EC0C            sub esp,byte +0xc
000012A1  FF7508            push dword [ebp+0x8]
000012A4  E87AF0FFFF        call 0x323
000012A9  83C410            add esp,byte +0x10
000012AC  E98D000000        jmp 0x133e
000012B1  83EC08            sub esp,byte +0x8
000012B4  68CB5E1000        push dword 0x105ecb
000012B9  FF7508            push dword [ebp+0x8]
000012BC  E8882B0000        call 0x3e49
000012C1  83C410            add esp,byte +0x10
000012C4  394508            cmp [ebp+0x8],eax
000012C7  7510              jnz 0x12d9
000012C9  83EC0C            sub esp,byte +0xc
000012CC  FF7508            push dword [ebp+0x8]
000012CF  E81DEFFFFF        call 0x1f1
000012D4  83C410            add esp,byte +0x10
000012D7  EB65              jmp short 0x133e
000012D9  83EC08            sub esp,byte +0x8
000012DC  6835621000        push dword 0x106235
000012E1  FF7508            push dword [ebp+0x8]
000012E4  E8F5280000        call 0x3bde
000012E9  83C410            add esp,byte +0x10
000012EC  85C0              test eax,eax
000012EE  7417              jz 0x1307
000012F0  83EC08            sub esp,byte +0x8
000012F3  6839621000        push dword 0x106239
000012F8  FF7508            push dword [ebp+0x8]
000012FB  E8DE280000        call 0x3bde
00001300  83C410            add esp,byte +0x10
00001303  85C0              test eax,eax
00001305  7514              jnz 0x131b
00001307  E824120000        call 0x2530
0000130C  83EC0C            sub esp,byte +0xc
0000130F  6A00              push byte +0x0
00001311  E8670F0000        call 0x227d
00001316  83C410            add esp,byte +0x10
00001319  EB23              jmp short 0x133e
0000131B  83EC0C            sub esp,byte +0xc
0000131E  683D621000        push dword 0x10623d
00001323  E82B110000        call 0x2453
00001328  83C410            add esp,byte +0x10
0000132B  83EC0C            sub esp,byte +0xc
0000132E  FF7508            push dword [ebp+0x8]
00001331  E81D110000        call 0x2453
00001336  83C410            add esp,byte +0x10
00001339  E8AD110000        call 0x24eb
0000133E  83EC0C            sub esp,byte +0xc
00001341  684F621000        push dword 0x10624f
00001346  E808110000        call 0x2453
0000134B  83C410            add esp,byte +0x10
0000134E  EB16              jmp short 0x1366
00001350  90                nop
00001351  8B45F0            mov eax,[ebp-0x10]
00001354  2D9C000000        sub eax,0x9c
00001359  83EC0C            sub esp,byte +0xc
0000135C  50                push eax
0000135D  E81B0F0000        call 0x227d
00001362  83C410            add esp,byte +0x10
00001365  90                nop
00001366  C9                leave
00001367  C3                ret
00001368  55                push ebp
00001369  89E5              mov ebp,esp
0000136B  83EC18            sub esp,byte +0x18
0000136E  E88DECFFFF        call 0x0
00001373  0FB6C0            movzx eax,al
00001376  83E001            and eax,byte +0x1
00001379  85C0              test eax,eax
0000137B  74F1              jz 0x136e
0000137D  E893ECFFFF        call 0x15
00001382  8845F6            mov [ebp-0xa],al
00001385  807DF680          cmp byte [ebp-0xa],0x80
00001389  760A              jna 0x1395
0000138B  B801000000        mov eax,0x1
00001390  E9C5000000        jmp 0x145a
00001395  0FB645F6          movzx eax,byte [ebp-0xa]
00001399  0FB680405C1000    movzx eax,byte [eax+0x105c40]
000013A0  0FBEC0            movsx eax,al
000013A3  83EC0C            sub esp,byte +0xc
000013A6  50                push eax
000013A7  E8B71E0000        call 0x3263
000013AC  83C410            add esp,byte +0x10
000013AF  807DF60E          cmp byte [ebp-0xa],0xe
000013B3  751B              jnz 0x13d0
000013B5  83EC0C            sub esp,byte +0xc
000013B8  68C0A51000        push dword 0x10a5c0
000013BD  E8AB0C0000        call 0x206d
000013C2  83C410            add esp,byte +0x10
000013C5  85C0              test eax,eax
000013C7  74A5              jz 0x136e
000013C9  E8AF110000        call 0x257d
000013CE  EB9E              jmp short 0x136e
000013D0  807DF61C          cmp byte [ebp-0xa],0x1c
000013D4  7521              jnz 0x13f7
000013D6  E810110000        call 0x24eb
000013DB  83EC0C            sub esp,byte +0xc
000013DE  68C0A51000        push dword 0x10a5c0
000013E3  E8B8F9FFFF        call 0xda0
000013E8  83C410            add esp,byte +0x10
000013EB  C605C0A5100000    mov byte [dword 0x10a5c0],0x0
000013F2  E977FFFFFF        jmp 0x136e
000013F7  83EC0C            sub esp,byte +0xc
000013FA  6A2A              push byte +0x2a
000013FC  E8DE1F0000        call 0x33df
00001401  83C410            add esp,byte +0x10
00001404  84C0              test al,al
00001406  7410              jz 0x1418
00001408  0FB645F6          movzx eax,byte [ebp-0xa]
0000140C  0FB680A05C1000    movzx eax,byte [eax+0x105ca0]
00001413  8845F7            mov [ebp-0x9],al
00001416  EB0E              jmp short 0x1426
00001418  0FB645F6          movzx eax,byte [ebp-0xa]
0000141C  0FB680405C1000    movzx eax,byte [eax+0x105c40]
00001423  8845F7            mov [ebp-0x9],al
00001426  0FBE45F7          movsx eax,byte [ebp-0x9]
0000142A  83EC08            sub esp,byte +0x8
0000142D  50                push eax
0000142E  68C0A51000        push dword 0x10a5c0
00001433  E8F90B0000        call 0x2031
00001438  83C410            add esp,byte +0x10
0000143B  0FB645F7          movzx eax,byte [ebp-0x9]
0000143F  8845F4            mov [ebp-0xc],al
00001442  C645F500          mov byte [ebp-0xb],0x0
00001446  83EC0C            sub esp,byte +0xc
00001449  8D45F4            lea eax,[ebp-0xc]
0000144C  50                push eax
0000144D  E801100000        call 0x2453
00001452  83C410            add esp,byte +0x10
00001455  E914FFFFFF        jmp 0x136e
0000145A  C9                leave
0000145B  C3                ret
0000145C  6690              xchg ax,ax
0000145E  6690              xchg ax,ax
00001460  60                pusha
00001461  668CD8            mov ax,ds
00001464  50                push eax
00001465  66B81000          mov ax,0x10
00001469  8ED8              mov ds,eax
0000146B  8EC0              mov es,eax
0000146D  8EE0              mov fs,eax
0000146F  8EE8              mov gs,eax
00001471  54                push esp
00001472  E801060000        call 0x1a78
00001477  58                pop eax
00001478  58                pop eax
00001479  8ED8              mov ds,eax
0000147B  8EC0              mov es,eax
0000147D  8EE0              mov fs,eax
0000147F  8EE8              mov gs,eax
00001481  61                popa
00001482  83C408            add esp,byte +0x8
00001485  CF                iret
00001486  60                pusha
00001487  668CD8            mov ax,ds
0000148A  50                push eax
0000148B  66B81000          mov ax,0x10
0000148F  8ED8              mov ds,eax
00001491  8EC0              mov es,eax
00001493  8EE0              mov fs,eax
00001495  8EE8              mov gs,eax
00001497  54                push esp
00001498  E86F060000        call 0x1b0c
0000149D  5B                pop ebx
0000149E  5B                pop ebx
0000149F  8EDB              mov ds,ebx
000014A1  8EC3              mov es,ebx
000014A3  8EE3              mov fs,ebx
000014A5  8EEB              mov gs,ebx
000014A7  61                popa
000014A8  83C408            add esp,byte +0x8
000014AB  CF                iret
000014AC  6A00              push byte +0x0
000014AE  6A00              push byte +0x0
000014B0  EBAE              jmp short 0x1460
000014B2  6A00              push byte +0x0
000014B4  6A01              push byte +0x1
000014B6  EBA8              jmp short 0x1460
000014B8  6A00              push byte +0x0
000014BA  6A02              push byte +0x2
000014BC  EBA2              jmp short 0x1460
000014BE  6A00              push byte +0x0
000014C0  6A03              push byte +0x3
000014C2  EB9C              jmp short 0x1460
000014C4  6A00              push byte +0x0
000014C6  6A04              push byte +0x4
000014C8  EB96              jmp short 0x1460
000014CA  6A00              push byte +0x0
000014CC  6A05              push byte +0x5
000014CE  EB90              jmp short 0x1460
000014D0  6A00              push byte +0x0
000014D2  6A06              push byte +0x6
000014D4  EB8A              jmp short 0x1460
000014D6  6A00              push byte +0x0
000014D8  6A07              push byte +0x7
000014DA  EB84              jmp short 0x1460
000014DC  6A08              push byte +0x8
000014DE  EB80              jmp short 0x1460
000014E0  6A00              push byte +0x0
000014E2  6A09              push byte +0x9
000014E4  E977FFFFFF        jmp 0x1460
000014E9  6A0A              push byte +0xa
000014EB  E970FFFFFF        jmp 0x1460
000014F0  6A0B              push byte +0xb
000014F2  E969FFFFFF        jmp 0x1460
000014F7  6A0C              push byte +0xc
000014F9  E962FFFFFF        jmp 0x1460
000014FE  6A0D              push byte +0xd
00001500  E95BFFFFFF        jmp 0x1460
00001505  6A0E              push byte +0xe
00001507  E954FFFFFF        jmp 0x1460
0000150C  6A00              push byte +0x0
0000150E  6A0F              push byte +0xf
00001510  E94BFFFFFF        jmp 0x1460
00001515  6A00              push byte +0x0
00001517  6A10              push byte +0x10
00001519  E942FFFFFF        jmp 0x1460
0000151E  6A00              push byte +0x0
00001520  6A11              push byte +0x11
00001522  E939FFFFFF        jmp 0x1460
00001527  6A00              push byte +0x0
00001529  6A12              push byte +0x12
0000152B  E930FFFFFF        jmp 0x1460
00001530  6A00              push byte +0x0
00001532  6A13              push byte +0x13
00001534  E927FFFFFF        jmp 0x1460
00001539  6A00              push byte +0x0
0000153B  6A14              push byte +0x14
0000153D  E91EFFFFFF        jmp 0x1460
00001542  6A00              push byte +0x0
00001544  6A15              push byte +0x15
00001546  E915FFFFFF        jmp 0x1460
0000154B  6A00              push byte +0x0
0000154D  6A16              push byte +0x16
0000154F  E90CFFFFFF        jmp 0x1460
00001554  6A00              push byte +0x0
00001556  6A17              push byte +0x17
00001558  E903FFFFFF        jmp 0x1460
0000155D  6A00              push byte +0x0
0000155F  6A18              push byte +0x18
00001561  E9FAFEFFFF        jmp 0x1460
00001566  6A00              push byte +0x0
00001568  6A19              push byte +0x19
0000156A  E9F1FEFFFF        jmp 0x1460
0000156F  6A00              push byte +0x0
00001571  6A1A              push byte +0x1a
00001573  E9E8FEFFFF        jmp 0x1460
00001578  6A00              push byte +0x0
0000157A  6A1B              push byte +0x1b
0000157C  E9DFFEFFFF        jmp 0x1460
00001581  6A00              push byte +0x0
00001583  6A1C              push byte +0x1c
00001585  E9D6FEFFFF        jmp 0x1460
0000158A  6A00              push byte +0x0
0000158C  6A1D              push byte +0x1d
0000158E  E9CDFEFFFF        jmp 0x1460
00001593  6A00              push byte +0x0
00001595  6A1E              push byte +0x1e
00001597  E9C4FEFFFF        jmp 0x1460
0000159C  6A00              push byte +0x0
0000159E  6A1F              push byte +0x1f
000015A0  E9BBFEFFFF        jmp 0x1460
000015A5  6A00              push byte +0x0
000015A7  6A20              push byte +0x20
000015A9  E9D8FEFFFF        jmp 0x1486
000015AE  6A01              push byte +0x1
000015B0  6A21              push byte +0x21
000015B2  E9CFFEFFFF        jmp 0x1486
000015B7  6A02              push byte +0x2
000015B9  6A22              push byte +0x22
000015BB  E9C6FEFFFF        jmp 0x1486
000015C0  6A03              push byte +0x3
000015C2  6A23              push byte +0x23
000015C4  E9BDFEFFFF        jmp 0x1486
000015C9  6A04              push byte +0x4
000015CB  6A24              push byte +0x24
000015CD  E9B4FEFFFF        jmp 0x1486
000015D2  6A05              push byte +0x5
000015D4  6A25              push byte +0x25
000015D6  E9ABFEFFFF        jmp 0x1486
000015DB  6A06              push byte +0x6
000015DD  6A26              push byte +0x26
000015DF  E9A2FEFFFF        jmp 0x1486
000015E4  6A07              push byte +0x7
000015E6  6A27              push byte +0x27
000015E8  E999FEFFFF        jmp 0x1486
000015ED  6A08              push byte +0x8
000015EF  6A28              push byte +0x28
000015F1  E990FEFFFF        jmp 0x1486
000015F6  6A09              push byte +0x9
000015F8  6A29              push byte +0x29
000015FA  E987FEFFFF        jmp 0x1486
000015FF  6A0A              push byte +0xa
00001601  6A2A              push byte +0x2a
00001603  E97EFEFFFF        jmp 0x1486
00001608  6A0B              push byte +0xb
0000160A  6A2B              push byte +0x2b
0000160C  E975FEFFFF        jmp 0x1486
00001611  6A0C              push byte +0xc
00001613  6A2C              push byte +0x2c
00001615  E96CFEFFFF        jmp 0x1486
0000161A  6A0D              push byte +0xd
0000161C  6A2D              push byte +0x2d
0000161E  E963FEFFFF        jmp 0x1486
00001623  6A0E              push byte +0xe
00001625  6A2E              push byte +0x2e
00001627  E95AFEFFFF        jmp 0x1486
0000162C  6A0F              push byte +0xf
0000162E  6A2F              push byte +0x2f
00001630  E951FEFFFF        jmp 0x1486
00001635  55                push ebp
00001636  89E5              mov ebp,esp
00001638  83EC08            sub esp,byte +0x8
0000163B  B8AC141000        mov eax,0x1014ac
00001640  83EC08            sub esp,byte +0x8
00001643  50                push eax
00001644  6A00              push byte +0x0
00001646  E89C1E0000        call 0x34e7
0000164B  83C410            add esp,byte +0x10
0000164E  B8B2141000        mov eax,0x1014b2
00001653  83EC08            sub esp,byte +0x8
00001656  50                push eax
00001657  6A01              push byte +0x1
00001659  E8891E0000        call 0x34e7
0000165E  83C410            add esp,byte +0x10
00001661  B8B8141000        mov eax,0x1014b8
00001666  83EC08            sub esp,byte +0x8
00001669  50                push eax
0000166A  6A02              push byte +0x2
0000166C  E8761E0000        call 0x34e7
00001671  83C410            add esp,byte +0x10
00001674  B8BE141000        mov eax,0x1014be
00001679  83EC08            sub esp,byte +0x8
0000167C  50                push eax
0000167D  6A03              push byte +0x3
0000167F  E8631E0000        call 0x34e7
00001684  83C410            add esp,byte +0x10
00001687  B8C4141000        mov eax,0x1014c4
0000168C  83EC08            sub esp,byte +0x8
0000168F  50                push eax
00001690  6A04              push byte +0x4
00001692  E8501E0000        call 0x34e7
00001697  83C410            add esp,byte +0x10
0000169A  B8CA141000        mov eax,0x1014ca
0000169F  83EC08            sub esp,byte +0x8
000016A2  50                push eax
000016A3  6A05              push byte +0x5
000016A5  E83D1E0000        call 0x34e7
000016AA  83C410            add esp,byte +0x10
000016AD  B8D0141000        mov eax,0x1014d0
000016B2  83EC08            sub esp,byte +0x8
000016B5  50                push eax
000016B6  6A06              push byte +0x6
000016B8  E82A1E0000        call 0x34e7
000016BD  83C410            add esp,byte +0x10
000016C0  B8D6141000        mov eax,0x1014d6
000016C5  83EC08            sub esp,byte +0x8
000016C8  50                push eax
000016C9  6A07              push byte +0x7
000016CB  E8171E0000        call 0x34e7
000016D0  83C410            add esp,byte +0x10
000016D3  B8DC141000        mov eax,0x1014dc
000016D8  83EC08            sub esp,byte +0x8
000016DB  50                push eax
000016DC  6A08              push byte +0x8
000016DE  E8041E0000        call 0x34e7
000016E3  83C410            add esp,byte +0x10
000016E6  B8E0141000        mov eax,0x1014e0
000016EB  83EC08            sub esp,byte +0x8
000016EE  50                push eax
000016EF  6A09              push byte +0x9
000016F1  E8F11D0000        call 0x34e7
000016F6  83C410            add esp,byte +0x10
000016F9  B8E9141000        mov eax,0x1014e9
000016FE  83EC08            sub esp,byte +0x8
00001701  50                push eax
00001702  6A0A              push byte +0xa
00001704  E8DE1D0000        call 0x34e7
00001709  83C410            add esp,byte +0x10
0000170C  B8F0141000        mov eax,0x1014f0
00001711  83EC08            sub esp,byte +0x8
00001714  50                push eax
00001715  6A0B              push byte +0xb
00001717  E8CB1D0000        call 0x34e7
0000171C  83C410            add esp,byte +0x10
0000171F  B8F7141000        mov eax,0x1014f7
00001724  83EC08            sub esp,byte +0x8
00001727  50                push eax
00001728  6A0C              push byte +0xc
0000172A  E8B81D0000        call 0x34e7
0000172F  83C410            add esp,byte +0x10
00001732  B8FE141000        mov eax,0x1014fe
00001737  83EC08            sub esp,byte +0x8
0000173A  50                push eax
0000173B  6A0D              push byte +0xd
0000173D  E8A51D0000        call 0x34e7
00001742  83C410            add esp,byte +0x10
00001745  B805151000        mov eax,0x101505
0000174A  83EC08            sub esp,byte +0x8
0000174D  50                push eax
0000174E  6A0E              push byte +0xe
00001750  E8921D0000        call 0x34e7
00001755  83C410            add esp,byte +0x10
00001758  B80C151000        mov eax,0x10150c
0000175D  83EC08            sub esp,byte +0x8
00001760  50                push eax
00001761  6A0F              push byte +0xf
00001763  E87F1D0000        call 0x34e7
00001768  83C410            add esp,byte +0x10
0000176B  B815151000        mov eax,0x101515
00001770  83EC08            sub esp,byte +0x8
00001773  50                push eax
00001774  6A10              push byte +0x10
00001776  E86C1D0000        call 0x34e7
0000177B  83C410            add esp,byte +0x10
0000177E  B81E151000        mov eax,0x10151e
00001783  83EC08            sub esp,byte +0x8
00001786  50                push eax
00001787  6A11              push byte +0x11
00001789  E8591D0000        call 0x34e7
0000178E  83C410            add esp,byte +0x10
00001791  B827151000        mov eax,0x101527
00001796  83EC08            sub esp,byte +0x8
00001799  50                push eax
0000179A  6A12              push byte +0x12
0000179C  E8461D0000        call 0x34e7
000017A1  83C410            add esp,byte +0x10
000017A4  B830151000        mov eax,0x101530
000017A9  83EC08            sub esp,byte +0x8
000017AC  50                push eax
000017AD  6A13              push byte +0x13
000017AF  E8331D0000        call 0x34e7
000017B4  83C410            add esp,byte +0x10
000017B7  B839151000        mov eax,0x101539
000017BC  83EC08            sub esp,byte +0x8
000017BF  50                push eax
000017C0  6A14              push byte +0x14
000017C2  E8201D0000        call 0x34e7
000017C7  83C410            add esp,byte +0x10
000017CA  B842151000        mov eax,0x101542
000017CF  83EC08            sub esp,byte +0x8
000017D2  50                push eax
000017D3  6A15              push byte +0x15
000017D5  E80D1D0000        call 0x34e7
000017DA  83C410            add esp,byte +0x10
000017DD  B84B151000        mov eax,0x10154b
000017E2  83EC08            sub esp,byte +0x8
000017E5  50                push eax
000017E6  6A16              push byte +0x16
000017E8  E8FA1C0000        call 0x34e7
000017ED  83C410            add esp,byte +0x10
000017F0  B854151000        mov eax,0x101554
000017F5  83EC08            sub esp,byte +0x8
000017F8  50                push eax
000017F9  6A17              push byte +0x17
000017FB  E8E71C0000        call 0x34e7
00001800  83C410            add esp,byte +0x10
00001803  B85D151000        mov eax,0x10155d
00001808  83EC08            sub esp,byte +0x8
0000180B  50                push eax
0000180C  6A18              push byte +0x18
0000180E  E8D41C0000        call 0x34e7
00001813  83C410            add esp,byte +0x10
00001816  B866151000        mov eax,0x101566
0000181B  83EC08            sub esp,byte +0x8
0000181E  50                push eax
0000181F  6A19              push byte +0x19
00001821  E8C11C0000        call 0x34e7
00001826  83C410            add esp,byte +0x10
00001829  B86F151000        mov eax,0x10156f
0000182E  83EC08            sub esp,byte +0x8
00001831  50                push eax
00001832  6A1A              push byte +0x1a
00001834  E8AE1C0000        call 0x34e7
00001839  83C410            add esp,byte +0x10
0000183C  B878151000        mov eax,0x101578
00001841  83EC08            sub esp,byte +0x8
00001844  50                push eax
00001845  6A1B              push byte +0x1b
00001847  E89B1C0000        call 0x34e7
0000184C  83C410            add esp,byte +0x10
0000184F  B881151000        mov eax,0x101581
00001854  83EC08            sub esp,byte +0x8
00001857  50                push eax
00001858  6A1C              push byte +0x1c
0000185A  E8881C0000        call 0x34e7
0000185F  83C410            add esp,byte +0x10
00001862  B88A151000        mov eax,0x10158a
00001867  83EC08            sub esp,byte +0x8
0000186A  50                push eax
0000186B  6A1D              push byte +0x1d
0000186D  E8751C0000        call 0x34e7
00001872  83C410            add esp,byte +0x10
00001875  B893151000        mov eax,0x101593
0000187A  83EC08            sub esp,byte +0x8
0000187D  50                push eax
0000187E  6A1E              push byte +0x1e
00001880  E8621C0000        call 0x34e7
00001885  83C410            add esp,byte +0x10
00001888  B89C151000        mov eax,0x10159c
0000188D  83EC08            sub esp,byte +0x8
00001890  50                push eax
00001891  6A1F              push byte +0x1f
00001893  E84F1C0000        call 0x34e7
00001898  83C410            add esp,byte +0x10
0000189B  83EC08            sub esp,byte +0x8
0000189E  6A11              push byte +0x11
000018A0  6A20              push byte +0x20
000018A2  E8AB1B0000        call 0x3452
000018A7  83C410            add esp,byte +0x10
000018AA  83EC08            sub esp,byte +0x8
000018AD  6A11              push byte +0x11
000018AF  68A0000000        push dword 0xa0
000018B4  E8991B0000        call 0x3452
000018B9  83C410            add esp,byte +0x10
000018BC  83EC08            sub esp,byte +0x8
000018BF  6A20              push byte +0x20
000018C1  6A21              push byte +0x21
000018C3  E88A1B0000        call 0x3452
000018C8  83C410            add esp,byte +0x10
000018CB  83EC08            sub esp,byte +0x8
000018CE  6A28              push byte +0x28
000018D0  68A1000000        push dword 0xa1
000018D5  E8781B0000        call 0x3452
000018DA  83C410            add esp,byte +0x10
000018DD  83EC08            sub esp,byte +0x8
000018E0  6A04              push byte +0x4
000018E2  6A21              push byte +0x21
000018E4  E8691B0000        call 0x3452
000018E9  83C410            add esp,byte +0x10
000018EC  83EC08            sub esp,byte +0x8
000018EF  6A02              push byte +0x2
000018F1  68A1000000        push dword 0xa1
000018F6  E8571B0000        call 0x3452
000018FB  83C410            add esp,byte +0x10
000018FE  83EC08            sub esp,byte +0x8
00001901  6A01              push byte +0x1
00001903  6A21              push byte +0x21
00001905  E8481B0000        call 0x3452
0000190A  83C410            add esp,byte +0x10
0000190D  83EC08            sub esp,byte +0x8
00001910  6A01              push byte +0x1
00001912  68A1000000        push dword 0xa1
00001917  E8361B0000        call 0x3452
0000191C  83C410            add esp,byte +0x10
0000191F  83EC08            sub esp,byte +0x8
00001922  6A00              push byte +0x0
00001924  6A21              push byte +0x21
00001926  E8271B0000        call 0x3452
0000192B  83C410            add esp,byte +0x10
0000192E  83EC08            sub esp,byte +0x8
00001931  6A00              push byte +0x0
00001933  68A1000000        push dword 0xa1
00001938  E8151B0000        call 0x3452
0000193D  83C410            add esp,byte +0x10
00001940  B8A5151000        mov eax,0x1015a5
00001945  83EC08            sub esp,byte +0x8
00001948  50                push eax
00001949  6A20              push byte +0x20
0000194B  E8971B0000        call 0x34e7
00001950  83C410            add esp,byte +0x10
00001953  B8AE151000        mov eax,0x1015ae
00001958  83EC08            sub esp,byte +0x8
0000195B  50                push eax
0000195C  6A21              push byte +0x21
0000195E  E8841B0000        call 0x34e7
00001963  83C410            add esp,byte +0x10
00001966  B8B7151000        mov eax,0x1015b7
0000196B  83EC08            sub esp,byte +0x8
0000196E  50                push eax
0000196F  6A22              push byte +0x22
00001971  E8711B0000        call 0x34e7
00001976  83C410            add esp,byte +0x10
00001979  B8C0151000        mov eax,0x1015c0
0000197E  83EC08            sub esp,byte +0x8
00001981  50                push eax
00001982  6A23              push byte +0x23
00001984  E85E1B0000        call 0x34e7
00001989  83C410            add esp,byte +0x10
0000198C  B8C9151000        mov eax,0x1015c9
00001991  83EC08            sub esp,byte +0x8
00001994  50                push eax
00001995  6A24              push byte +0x24
00001997  E84B1B0000        call 0x34e7
0000199C  83C410            add esp,byte +0x10
0000199F  B8D2151000        mov eax,0x1015d2
000019A4  83EC08            sub esp,byte +0x8
000019A7  50                push eax
000019A8  6A25              push byte +0x25
000019AA  E8381B0000        call 0x34e7
000019AF  83C410            add esp,byte +0x10
000019B2  B8DB151000        mov eax,0x1015db
000019B7  83EC08            sub esp,byte +0x8
000019BA  50                push eax
000019BB  6A26              push byte +0x26
000019BD  E8251B0000        call 0x34e7
000019C2  83C410            add esp,byte +0x10
000019C5  B8E4151000        mov eax,0x1015e4
000019CA  83EC08            sub esp,byte +0x8
000019CD  50                push eax
000019CE  6A27              push byte +0x27
000019D0  E8121B0000        call 0x34e7
000019D5  83C410            add esp,byte +0x10
000019D8  B8ED151000        mov eax,0x1015ed
000019DD  83EC08            sub esp,byte +0x8
000019E0  50                push eax
000019E1  6A28              push byte +0x28
000019E3  E8FF1A0000        call 0x34e7
000019E8  83C410            add esp,byte +0x10
000019EB  B8F6151000        mov eax,0x1015f6
000019F0  83EC08            sub esp,byte +0x8
000019F3  50                push eax
000019F4  6A29              push byte +0x29
000019F6  E8EC1A0000        call 0x34e7
000019FB  83C410            add esp,byte +0x10
000019FE  B8FF151000        mov eax,0x1015ff
00001A03  83EC08            sub esp,byte +0x8
00001A06  50                push eax
00001A07  6A2A              push byte +0x2a
00001A09  E8D91A0000        call 0x34e7
00001A0E  83C410            add esp,byte +0x10
00001A11  B808161000        mov eax,0x101608
00001A16  83EC08            sub esp,byte +0x8
00001A19  50                push eax
00001A1A  6A2B              push byte +0x2b
00001A1C  E8C61A0000        call 0x34e7
00001A21  83C410            add esp,byte +0x10
00001A24  B811161000        mov eax,0x101611
00001A29  83EC08            sub esp,byte +0x8
00001A2C  50                push eax
00001A2D  6A2C              push byte +0x2c
00001A2F  E8B31A0000        call 0x34e7
00001A34  83C410            add esp,byte +0x10
00001A37  B81A161000        mov eax,0x10161a
00001A3C  83EC08            sub esp,byte +0x8
00001A3F  50                push eax
00001A40  6A2D              push byte +0x2d
00001A42  E8A01A0000        call 0x34e7
00001A47  83C410            add esp,byte +0x10
00001A4A  B823161000        mov eax,0x101623
00001A4F  83EC08            sub esp,byte +0x8
00001A52  50                push eax
00001A53  6A2E              push byte +0x2e
00001A55  E88D1A0000        call 0x34e7
00001A5A  83C410            add esp,byte +0x10
00001A5D  B82C161000        mov eax,0x10162c
00001A62  83EC08            sub esp,byte +0x8
00001A65  50                push eax
00001A66  6A2F              push byte +0x2f
00001A68  E87A1A0000        call 0x34e7
00001A6D  83C410            add esp,byte +0x10
00001A70  E8BE1A0000        call 0x3533
00001A75  90                nop
00001A76  C9                leave
00001A77  C3                ret
00001A78  55                push ebp
00001A79  89E5              mov ebp,esp
00001A7B  83EC18            sub esp,byte +0x18
00001A7E  83EC0C            sub esp,byte +0xc
00001A81  688E631000        push dword 0x10638e
00001A86  E8C8090000        call 0x2453
00001A8B  83C410            add esp,byte +0x10
00001A8E  8B4508            mov eax,[ebp+0x8]
00001A91  8B4024            mov eax,[eax+0x24]
00001A94  83EC08            sub esp,byte +0x8
00001A97  8D55F1            lea edx,[ebp-0xf]
00001A9A  52                push edx
00001A9B  50                push eax
00001A9C  E8DA040000        call 0x1f7b
00001AA1  83C410            add esp,byte +0x10
00001AA4  83EC0C            sub esp,byte +0xc
00001AA7  8D45F1            lea eax,[ebp-0xf]
00001AAA  50                push eax
00001AAB  E8A3090000        call 0x2453
00001AB0  83C410            add esp,byte +0x10
00001AB3  E8330A0000        call 0x24eb
00001AB8  8B4508            mov eax,[ebp+0x8]
00001ABB  8B4024            mov eax,[eax+0x24]
00001ABE  8B048500871000    mov eax,[eax*4+0x108700]
00001AC5  83EC0C            sub esp,byte +0xc
00001AC8  50                push eax
00001AC9  E885090000        call 0x2453
00001ACE  83C410            add esp,byte +0x10
00001AD1  E8150A0000        call 0x24eb
00001AD6  A168A71000        mov eax,[0x10a768]
00001ADB  8945F4            mov [ebp-0xc],eax
00001ADE  83EC0C            sub esp,byte +0xc
00001AE1  FF7508            push dword [ebp+0x8]
00001AE4  8B45F4            mov eax,[ebp-0xc]
00001AE7  FFD0              call eax
00001AE9  83C410            add esp,byte +0x10
00001AEC  90                nop
00001AED  C9                leave
00001AEE  C3                ret
00001AEF  55                push ebp
00001AF0  89E5              mov ebp,esp
00001AF2  83EC04            sub esp,byte +0x4
00001AF5  8B4508            mov eax,[ebp+0x8]
00001AF8  8845FC            mov [ebp-0x4],al
00001AFB  0FB645FC          movzx eax,byte [ebp-0x4]
00001AFF  8B550C            mov edx,[ebp+0xc]
00001B02  891485C0A61000    mov [eax*4+0x10a6c0],edx
00001B09  90                nop
00001B0A  C9                leave
00001B0B  C3                ret
00001B0C  55                push ebp
00001B0D  89E5              mov ebp,esp
00001B0F  83EC18            sub esp,byte +0x18
00001B12  8B4508            mov eax,[ebp+0x8]
00001B15  8B4024            mov eax,[eax+0x24]
00001B18  8B0485C0A61000    mov eax,[eax*4+0x10a6c0]
00001B1F  85C0              test eax,eax
00001B21  741E              jz 0x1b41
00001B23  8B4508            mov eax,[ebp+0x8]
00001B26  8B4024            mov eax,[eax+0x24]
00001B29  8B0485C0A61000    mov eax,[eax*4+0x10a6c0]
00001B30  8945F4            mov [ebp-0xc],eax
00001B33  83EC0C            sub esp,byte +0xc
00001B36  FF7508            push dword [ebp+0x8]
00001B39  8B45F4            mov eax,[ebp-0xc]
00001B3C  FFD0              call eax
00001B3E  83C410            add esp,byte +0x10
00001B41  8B4508            mov eax,[ebp+0x8]
00001B44  8B4024            mov eax,[eax+0x24]
00001B47  83F827            cmp eax,byte +0x27
00001B4A  7612              jna 0x1b5e
00001B4C  83EC08            sub esp,byte +0x8
00001B4F  6A20              push byte +0x20
00001B51  68A0000000        push dword 0xa0
00001B56  E8F7180000        call 0x3452
00001B5B  83C410            add esp,byte +0x10
00001B5E  83EC08            sub esp,byte +0x8
00001B61  6A20              push byte +0x20
00001B63  6A20              push byte +0x20
00001B65  E8E8180000        call 0x3452
00001B6A  83C410            add esp,byte +0x10
00001B6D  90                nop
00001B6E  C9                leave
00001B6F  C3                ret
00001B70  55                push ebp
00001B71  89E5              mov ebp,esp
00001B73  83EC10            sub esp,byte +0x10
00001B76  C745FC00000000    mov dword [ebp-0x4],0x0
00001B7D  EB19              jmp short 0x1b98
00001B7F  8B55FC            mov edx,[ebp-0x4]
00001B82  8B4508            mov eax,[ebp+0x8]
00001B85  01D0              add eax,edx
00001B87  8B4DFC            mov ecx,[ebp-0x4]
00001B8A  8B550C            mov edx,[ebp+0xc]
00001B8D  01CA              add edx,ecx
00001B8F  0FB600            movzx eax,byte [eax]
00001B92  8802              mov [edx],al
00001B94  8345FC01          add dword [ebp-0x4],byte +0x1
00001B98  8B45FC            mov eax,[ebp-0x4]
00001B9B  394510            cmp [ebp+0x10],eax
00001B9E  77DF              ja 0x1b7f
00001BA0  90                nop
00001BA1  90                nop
00001BA2  C9                leave
00001BA3  C3                ret
00001BA4  55                push ebp
00001BA5  89E5              mov ebp,esp
00001BA7  C705C0BA1000C0AA  mov dword [dword 0x10bac0],0x10aac0
         -1000
00001BB1  A1C0BA1000        mov eax,[0x10bac0]
00001BB6  C700F00F0000      mov dword [eax],0xff0
00001BBC  A1C0BA1000        mov eax,[0x10bac0]
00001BC1  C7400800000000    mov dword [eax+0x8],0x0
00001BC8  A1C0BA1000        mov eax,[0x10bac0]
00001BCD  C7400C00000000    mov dword [eax+0xc],0x0
00001BD4  90                nop
00001BD5  5D                pop ebp
00001BD6  C3                ret
00001BD7  55                push ebp
00001BD8  89E5              mov ebp,esp
00001BDA  81EC08010000      sub esp,0x108
00001BE0  83EC08            sub esp,byte +0x8
00001BE3  8D85F8FEFFFF      lea eax,[ebp-0x108]
00001BE9  50                push eax
00001BEA  6A10              push byte +0x10
00001BEC  E88A030000        call 0x1f7b
00001BF1  83C410            add esp,byte +0x10
00001BF4  83EC0C            sub esp,byte +0xc
00001BF7  68A3631000        push dword 0x1063a3
00001BFC  E852080000        call 0x2453
00001C01  83C410            add esp,byte +0x10
00001C04  83EC0C            sub esp,byte +0xc
00001C07  8D85F8FEFFFF      lea eax,[ebp-0x108]
00001C0D  50                push eax
00001C0E  E840080000        call 0x2453
00001C13  83C410            add esp,byte +0x10
00001C16  E8D0080000        call 0x24eb
00001C1B  90                nop
00001C1C  C9                leave
00001C1D  C3                ret
00001C1E  55                push ebp
00001C1F  89E5              mov ebp,esp
00001C21  81EC08020000      sub esp,0x208
00001C27  8B4508            mov eax,[ebp+0x8]
00001C2A  8B00              mov eax,[eax]
00001C2C  83EC08            sub esp,byte +0x8
00001C2F  8D95F8FEFFFF      lea edx,[ebp-0x108]
00001C35  52                push edx
00001C36  50                push eax
00001C37  E83F030000        call 0x1f7b
00001C3C  83C410            add esp,byte +0x10
00001C3F  83EC0C            sub esp,byte +0xc
00001C42  68BC631000        push dword 0x1063bc
00001C47  E807080000        call 0x2453
00001C4C  83C410            add esp,byte +0x10
00001C4F  83EC0C            sub esp,byte +0xc
00001C52  8D85F8FEFFFF      lea eax,[ebp-0x108]
00001C58  50                push eax
00001C59  E8F5070000        call 0x2453
00001C5E  83C410            add esp,byte +0x10
00001C61  8B4508            mov eax,[ebp+0x8]
00001C64  0FB64004          movzx eax,byte [eax+0x4]
00001C68  0FB6C0            movzx eax,al
00001C6B  83EC08            sub esp,byte +0x8
00001C6E  8D95F8FDFFFF      lea edx,[ebp-0x208]
00001C74  52                push edx
00001C75  50                push eax
00001C76  E800030000        call 0x1f7b
00001C7B  83C410            add esp,byte +0x10
00001C7E  83EC0C            sub esp,byte +0xc
00001C81  68C5631000        push dword 0x1063c5
00001C86  E8C8070000        call 0x2453
00001C8B  83C410            add esp,byte +0x10
00001C8E  83EC0C            sub esp,byte +0xc
00001C91  8D85F8FDFFFF      lea eax,[ebp-0x208]
00001C97  50                push eax
00001C98  E8B6070000        call 0x2453
00001C9D  83C410            add esp,byte +0x10
00001CA0  83EC0C            sub esp,byte +0xc
00001CA3  68CF631000        push dword 0x1063cf
00001CA8  E8A6070000        call 0x2453
00001CAD  83C410            add esp,byte +0x10
00001CB0  90                nop
00001CB1  C9                leave
00001CB2  C3                ret
00001CB3  55                push ebp
00001CB4  89E5              mov ebp,esp
00001CB6  83EC18            sub esp,byte +0x18
00001CB9  A1C0BA1000        mov eax,[0x10bac0]
00001CBE  8945F4            mov [ebp-0xc],eax
00001CC1  83EC0C            sub esp,byte +0xc
00001CC4  68D3631000        push dword 0x1063d3
00001CC9  E885070000        call 0x2453
00001CCE  83C410            add esp,byte +0x10
00001CD1  EB17              jmp short 0x1cea
00001CD3  83EC0C            sub esp,byte +0xc
00001CD6  FF75F4            push dword [ebp-0xc]
00001CD9  E840FFFFFF        call 0x1c1e
00001CDE  83C410            add esp,byte +0x10
00001CE1  8B45F4            mov eax,[ebp-0xc]
00001CE4  8B4008            mov eax,[eax+0x8]
00001CE7  8945F4            mov [ebp-0xc],eax
00001CEA  837DF400          cmp dword [ebp-0xc],byte +0x0
00001CEE  75E3              jnz 0x1cd3
00001CF0  83EC0C            sub esp,byte +0xc
00001CF3  68D5631000        push dword 0x1063d5
00001CF8  E856070000        call 0x2453
00001CFD  83C410            add esp,byte +0x10
00001D00  90                nop
00001D01  C9                leave
00001D02  C3                ret
00001D03  55                push ebp
00001D04  89E5              mov ebp,esp
00001D06  83EC10            sub esp,byte +0x10
00001D09  C745FC00000000    mov dword [ebp-0x4],0x0
00001D10  C745F801100000    mov dword [ebp-0x8],0x1001
00001D17  8B4508            mov eax,[ebp+0x8]
00001D1A  8945F4            mov [ebp-0xc],eax
00001D1D  EB3E              jmp short 0x1d5d
00001D1F  8B45F4            mov eax,[ebp-0xc]
00001D22  0FB64004          movzx eax,byte [eax+0x4]
00001D26  83F001            xor eax,byte +0x1
00001D29  84C0              test al,al
00001D2B  7427              jz 0x1d54
00001D2D  8B45F4            mov eax,[ebp-0xc]
00001D30  8B00              mov eax,[eax]
00001D32  8B550C            mov edx,[ebp+0xc]
00001D35  83C210            add edx,byte +0x10
00001D38  39D0              cmp eax,edx
00001D3A  7218              jc 0x1d54
00001D3C  8B45F4            mov eax,[ebp-0xc]
00001D3F  8B00              mov eax,[eax]
00001D41  3945F8            cmp [ebp-0x8],eax
00001D44  720E              jc 0x1d54
00001D46  8B45F4            mov eax,[ebp-0xc]
00001D49  8945FC            mov [ebp-0x4],eax
00001D4C  8B45F4            mov eax,[ebp-0xc]
00001D4F  8B00              mov eax,[eax]
00001D51  8945F8            mov [ebp-0x8],eax
00001D54  8B45F4            mov eax,[ebp-0xc]
00001D57  8B4008            mov eax,[eax+0x8]
00001D5A  8945F4            mov [ebp-0xc],eax
00001D5D  837DF400          cmp dword [ebp-0xc],byte +0x0
00001D61  75BC              jnz 0x1d1f
00001D63  8B45FC            mov eax,[ebp-0x4]
00001D66  C9                leave
00001D67  C3                ret
00001D68  55                push ebp
00001D69  89E5              mov ebp,esp
00001D6B  83EC10            sub esp,byte +0x10
00001D6E  A1C0BA1000        mov eax,[0x10bac0]
00001D73  FF7508            push dword [ebp+0x8]
00001D76  50                push eax
00001D77  E887FFFFFF        call 0x1d03
00001D7C  83C408            add esp,byte +0x8
00001D7F  8945FC            mov [ebp-0x4],eax
00001D82  837DFC00          cmp dword [ebp-0x4],byte +0x0
00001D86  746B              jz 0x1df3
00001D88  8B45FC            mov eax,[ebp-0x4]
00001D8B  8B00              mov eax,[eax]
00001D8D  2B4508            sub eax,[ebp+0x8]
00001D90  8D50F0            lea edx,[eax-0x10]
00001D93  8B45FC            mov eax,[ebp-0x4]
00001D96  8910              mov [eax],edx
00001D98  8B45FC            mov eax,[ebp-0x4]
00001D9B  8B00              mov eax,[eax]
00001D9D  8D5010            lea edx,[eax+0x10]
00001DA0  8B45FC            mov eax,[ebp-0x4]
00001DA3  01D0              add eax,edx
00001DA5  8945F8            mov [ebp-0x8],eax
00001DA8  8B45F8            mov eax,[ebp-0x8]
00001DAB  8B5508            mov edx,[ebp+0x8]
00001DAE  8910              mov [eax],edx
00001DB0  8B45F8            mov eax,[ebp-0x8]
00001DB3  C6400401          mov byte [eax+0x4],0x1
00001DB7  8B45FC            mov eax,[ebp-0x4]
00001DBA  8B5008            mov edx,[eax+0x8]
00001DBD  8B45F8            mov eax,[ebp-0x8]
00001DC0  895008            mov [eax+0x8],edx
00001DC3  8B45F8            mov eax,[ebp-0x8]
00001DC6  8B55FC            mov edx,[ebp-0x4]
00001DC9  89500C            mov [eax+0xc],edx
00001DCC  8B45FC            mov eax,[ebp-0x4]
00001DCF  8B4008            mov eax,[eax+0x8]
00001DD2  85C0              test eax,eax
00001DD4  740C              jz 0x1de2
00001DD6  8B45FC            mov eax,[ebp-0x4]
00001DD9  8B4008            mov eax,[eax+0x8]
00001DDC  8B55F8            mov edx,[ebp-0x8]
00001DDF  89500C            mov [eax+0xc],edx
00001DE2  8B45FC            mov eax,[ebp-0x4]
00001DE5  8B55F8            mov edx,[ebp-0x8]
00001DE8  895008            mov [eax+0x8],edx
00001DEB  8B45F8            mov eax,[ebp-0x8]
00001DEE  83C010            add eax,byte +0x10
00001DF1  EB05              jmp short 0x1df8
00001DF3  B800000000        mov eax,0x0
00001DF8  C9                leave
00001DF9  C3                ret
00001DFA  55                push ebp
00001DFB  89E5              mov ebp,esp
00001DFD  83EC10            sub esp,byte +0x10
00001E00  8B4508            mov eax,[ebp+0x8]
00001E03  8B4008            mov eax,[eax+0x8]
00001E06  8945FC            mov [ebp-0x4],eax
00001E09  837DFC00          cmp dword [ebp-0x4],byte +0x0
00001E0D  7454              jz 0x1e63
00001E0F  8B45FC            mov eax,[ebp-0x4]
00001E12  0FB64004          movzx eax,byte [eax+0x4]
00001E16  83F001            xor eax,byte +0x1
00001E19  84C0              test al,al
00001E1B  7446              jz 0x1e63
00001E1D  8B4508            mov eax,[ebp+0x8]
00001E20  8B10              mov edx,[eax]
00001E22  8B4508            mov eax,[ebp+0x8]
00001E25  8B4008            mov eax,[eax+0x8]
00001E28  8B00              mov eax,[eax]
00001E2A  01C2              add edx,eax
00001E2C  8B4508            mov eax,[ebp+0x8]
00001E2F  8910              mov [eax],edx
00001E31  8B4508            mov eax,[ebp+0x8]
00001E34  8B00              mov eax,[eax]
00001E36  8D5010            lea edx,[eax+0x10]
00001E39  8B4508            mov eax,[ebp+0x8]
00001E3C  8910              mov [eax],edx
00001E3E  8B4508            mov eax,[ebp+0x8]
00001E41  8B4008            mov eax,[eax+0x8]
00001E44  8B5008            mov edx,[eax+0x8]
00001E47  8B4508            mov eax,[ebp+0x8]
00001E4A  895008            mov [eax+0x8],edx
00001E4D  8B4508            mov eax,[ebp+0x8]
00001E50  8B4008            mov eax,[eax+0x8]
00001E53  85C0              test eax,eax
00001E55  740C              jz 0x1e63
00001E57  8B4508            mov eax,[ebp+0x8]
00001E5A  8B4008            mov eax,[eax+0x8]
00001E5D  8B5508            mov edx,[ebp+0x8]
00001E60  89500C            mov [eax+0xc],edx
00001E63  8B4508            mov eax,[ebp+0x8]
00001E66  C9                leave
00001E67  C3                ret
00001E68  55                push ebp
00001E69  89E5              mov ebp,esp
00001E6B  83EC10            sub esp,byte +0x10
00001E6E  8B4508            mov eax,[ebp+0x8]
00001E71  8B400C            mov eax,[eax+0xc]
00001E74  8945FC            mov [ebp-0x4],eax
00001E77  837DFC00          cmp dword [ebp-0x4],byte +0x0
00001E7B  744E              jz 0x1ecb
00001E7D  8B45FC            mov eax,[ebp-0x4]
00001E80  0FB64004          movzx eax,byte [eax+0x4]
00001E84  83F001            xor eax,byte +0x1
00001E87  84C0              test al,al
00001E89  7440              jz 0x1ecb
00001E8B  8B45FC            mov eax,[ebp-0x4]
00001E8E  8B10              mov edx,[eax]
00001E90  8B4508            mov eax,[ebp+0x8]
00001E93  8B00              mov eax,[eax]
00001E95  01C2              add edx,eax
00001E97  8B45FC            mov eax,[ebp-0x4]
00001E9A  8910              mov [eax],edx
00001E9C  8B45FC            mov eax,[ebp-0x4]
00001E9F  8B00              mov eax,[eax]
00001EA1  8D5010            lea edx,[eax+0x10]
00001EA4  8B45FC            mov eax,[ebp-0x4]
00001EA7  8910              mov [eax],edx
00001EA9  8B4508            mov eax,[ebp+0x8]
00001EAC  8B5008            mov edx,[eax+0x8]
00001EAF  8B45FC            mov eax,[ebp-0x4]
00001EB2  895008            mov [eax+0x8],edx
00001EB5  8B4508            mov eax,[ebp+0x8]
00001EB8  8B4008            mov eax,[eax+0x8]
00001EBB  85C0              test eax,eax
00001EBD  740C              jz 0x1ecb
00001EBF  8B4508            mov eax,[ebp+0x8]
00001EC2  8B4008            mov eax,[eax+0x8]
00001EC5  8B55FC            mov edx,[ebp-0x4]
00001EC8  89500C            mov [eax+0xc],edx
00001ECB  90                nop
00001ECC  C9                leave
00001ECD  C3                ret
00001ECE  55                push ebp
00001ECF  89E5              mov ebp,esp
00001ED1  83EC10            sub esp,byte +0x10
00001ED4  837D0800          cmp dword [ebp+0x8],byte +0x0
00001ED8  7431              jz 0x1f0b
00001EDA  8B4508            mov eax,[ebp+0x8]
00001EDD  83E810            sub eax,byte +0x10
00001EE0  8945FC            mov [ebp-0x4],eax
00001EE3  837DFC00          cmp dword [ebp-0x4],byte +0x0
00001EE7  7425              jz 0x1f0e
00001EE9  8B45FC            mov eax,[ebp-0x4]
00001EEC  C6400400          mov byte [eax+0x4],0x0
00001EF0  FF75FC            push dword [ebp-0x4]
00001EF3  E802FFFFFF        call 0x1dfa
00001EF8  83C404            add esp,byte +0x4
00001EFB  8945FC            mov [ebp-0x4],eax
00001EFE  FF75FC            push dword [ebp-0x4]
00001F01  E862FFFFFF        call 0x1e68
00001F06  83C404            add esp,byte +0x4
00001F09  EB04              jmp short 0x1f0f
00001F0B  90                nop
00001F0C  EB01              jmp short 0x1f0f
00001F0E  90                nop
00001F0F  C9                leave
00001F10  C3                ret
00001F11  55                push ebp
00001F12  89E5              mov ebp,esp
00001F14  83EC18            sub esp,byte +0x18
00001F17  C745F400000000    mov dword [ebp-0xc],0x0
00001F1E  83EC0C            sub esp,byte +0xc
00001F21  FF7508            push dword [ebp+0x8]
00001F24  E8911C0000        call 0x3bba
00001F29  83C410            add esp,byte +0x10
00001F2C  83E801            sub eax,byte +0x1
00001F2F  8945F0            mov [ebp-0x10],eax
00001F32  EB3B              jmp short 0x1f6f
00001F34  8B55F4            mov edx,[ebp-0xc]
00001F37  8B4508            mov eax,[ebp+0x8]
00001F3A  01D0              add eax,edx
00001F3C  0FB600            movzx eax,byte [eax]
00001F3F  0FBEC0            movsx eax,al
00001F42  8945EC            mov [ebp-0x14],eax
00001F45  8B55F0            mov edx,[ebp-0x10]
00001F48  8B4508            mov eax,[ebp+0x8]
00001F4B  01D0              add eax,edx
00001F4D  8B4DF4            mov ecx,[ebp-0xc]
00001F50  8B5508            mov edx,[ebp+0x8]
00001F53  01CA              add edx,ecx
00001F55  0FB600            movzx eax,byte [eax]
00001F58  8802              mov [edx],al
00001F5A  8B55F0            mov edx,[ebp-0x10]
00001F5D  8B4508            mov eax,[ebp+0x8]
00001F60  01D0              add eax,edx
00001F62  8B55EC            mov edx,[ebp-0x14]
00001F65  8810              mov [eax],dl
00001F67  8345F401          add dword [ebp-0xc],byte +0x1
00001F6B  836DF001          sub dword [ebp-0x10],byte +0x1
00001F6F  8B45F4            mov eax,[ebp-0xc]
00001F72  3B45F0            cmp eax,[ebp-0x10]
00001F75  7CBD              jl 0x1f34
00001F77  90                nop
00001F78  90                nop
00001F79  C9                leave
00001F7A  C3                ret
00001F7B  55                push ebp
00001F7C  89E5              mov ebp,esp
00001F7E  53                push ebx
00001F7F  83EC14            sub esp,byte +0x14
00001F82  8B4508            mov eax,[ebp+0x8]
00001F85  8945F0            mov [ebp-0x10],eax
00001F88  837DF000          cmp dword [ebp-0x10],byte +0x0
00001F8C  7903              jns 0x1f91
00001F8E  F75D08            neg dword [ebp+0x8]
00001F91  C745F400000000    mov dword [ebp-0xc],0x0
00001F98  8B4D08            mov ecx,[ebp+0x8]
00001F9B  BA67666666        mov edx,0x66666667
00001FA0  89C8              mov eax,ecx
00001FA2  F7EA              imul edx
00001FA4  89D0              mov eax,edx
00001FA6  C1F802            sar eax,byte 0x2
00001FA9  89CB              mov ebx,ecx
00001FAB  C1FB1F            sar ebx,byte 0x1f
00001FAE  29D8              sub eax,ebx
00001FB0  89C2              mov edx,eax
00001FB2  89D0              mov eax,edx
00001FB4  C1E002            shl eax,byte 0x2
00001FB7  01D0              add eax,edx
00001FB9  01C0              add eax,eax
00001FBB  29C1              sub ecx,eax
00001FBD  89CA              mov edx,ecx
00001FBF  89D0              mov eax,edx
00001FC1  8D4830            lea ecx,[eax+0x30]
00001FC4  8B45F4            mov eax,[ebp-0xc]
00001FC7  8D5001            lea edx,[eax+0x1]
00001FCA  8955F4            mov [ebp-0xc],edx
00001FCD  89C2              mov edx,eax
00001FCF  8B450C            mov eax,[ebp+0xc]
00001FD2  01D0              add eax,edx
00001FD4  89CA              mov edx,ecx
00001FD6  8810              mov [eax],dl
00001FD8  8B4D08            mov ecx,[ebp+0x8]
00001FDB  BA67666666        mov edx,0x66666667
00001FE0  89C8              mov eax,ecx
00001FE2  F7EA              imul edx
00001FE4  89D0              mov eax,edx
00001FE6  C1F802            sar eax,byte 0x2
00001FE9  C1F91F            sar ecx,byte 0x1f
00001FEC  89CA              mov edx,ecx
00001FEE  29D0              sub eax,edx
00001FF0  894508            mov [ebp+0x8],eax
00001FF3  837D0800          cmp dword [ebp+0x8],byte +0x0
00001FF7  7F9F              jg 0x1f98
00001FF9  837DF000          cmp dword [ebp-0x10],byte +0x0
00001FFD  7913              jns 0x2012
00001FFF  8B45F4            mov eax,[ebp-0xc]
00002002  8D5001            lea edx,[eax+0x1]
00002005  8955F4            mov [ebp-0xc],edx
00002008  89C2              mov edx,eax
0000200A  8B450C            mov eax,[ebp+0xc]
0000200D  01D0              add eax,edx
0000200F  C6002D            mov byte [eax],0x2d
00002012  8B55F4            mov edx,[ebp-0xc]
00002015  8B450C            mov eax,[ebp+0xc]
00002018  01D0              add eax,edx
0000201A  C60000            mov byte [eax],0x0
0000201D  83EC0C            sub esp,byte +0xc
00002020  FF750C            push dword [ebp+0xc]
00002023  E8E9FEFFFF        call 0x1f11
00002028  83C410            add esp,byte +0x10
0000202B  90                nop
0000202C  8B5DFC            mov ebx,[ebp-0x4]
0000202F  C9                leave
00002030  C3                ret
00002031  55                push ebp
00002032  89E5              mov ebp,esp
00002034  83EC28            sub esp,byte +0x28
00002037  8B450C            mov eax,[ebp+0xc]
0000203A  8845E4            mov [ebp-0x1c],al
0000203D  83EC0C            sub esp,byte +0xc
00002040  FF7508            push dword [ebp+0x8]
00002043  E8721B0000        call 0x3bba
00002048  83C410            add esp,byte +0x10
0000204B  8945F4            mov [ebp-0xc],eax
0000204E  8B55F4            mov edx,[ebp-0xc]
00002051  8B4508            mov eax,[ebp+0x8]
00002054  01C2              add edx,eax
00002056  0FB645E4          movzx eax,byte [ebp-0x1c]
0000205A  8802              mov [edx],al
0000205C  8B45F4            mov eax,[ebp-0xc]
0000205F  8D5001            lea edx,[eax+0x1]
00002062  8B4508            mov eax,[ebp+0x8]
00002065  01D0              add eax,edx
00002067  C60000            mov byte [eax],0x0
0000206A  90                nop
0000206B  C9                leave
0000206C  C3                ret
0000206D  55                push ebp
0000206E  89E5              mov ebp,esp
00002070  83EC18            sub esp,byte +0x18
00002073  83EC0C            sub esp,byte +0xc
00002076  FF7508            push dword [ebp+0x8]
00002079  E83C1B0000        call 0x3bba
0000207E  83C410            add esp,byte +0x10
00002081  8945F4            mov [ebp-0xc],eax
00002084  837DF400          cmp dword [ebp-0xc],byte +0x0
00002088  7E15              jng 0x209f
0000208A  8B45F4            mov eax,[ebp-0xc]
0000208D  8D50FF            lea edx,[eax-0x1]
00002090  8B4508            mov eax,[ebp+0x8]
00002093  01D0              add eax,edx
00002095  C60000            mov byte [eax],0x0
00002098  B801000000        mov eax,0x1
0000209D  EB05              jmp short 0x20a4
0000209F  B800000000        mov eax,0x0
000020A4  C9                leave
000020A5  C3                ret
000020A6  55                push ebp
000020A7  89E5              mov ebp,esp
000020A9  57                push edi
000020AA  56                push esi
000020AB  53                push ebx
000020AC  83EC6C            sub esp,byte +0x6c
000020AF  89C0              mov eax,eax
000020B1  89DA              mov edx,ebx
000020B3  89C9              mov ecx,ecx
000020B5  89D3              mov ebx,edx
000020B7  89F6              mov esi,esi
000020B9  897DA4            mov [ebp-0x5c],edi
000020BC  896DA0            mov [ebp-0x60],ebp
000020BF  89659C            mov [ebp-0x64],esp
000020C2  8C4D90            mov [ebp-0x70],cs
000020C5  9C                pushf
000020C6  8F4598            pop dword [ebp-0x68]
000020C9  8C5D94            mov [ebp-0x6c],ds
000020CC  8CD7              mov edi,ss
000020CE  8945E4            mov [ebp-0x1c],eax
000020D1  8955E0            mov [ebp-0x20],edx
000020D4  894DDC            mov [ebp-0x24],ecx
000020D7  895DD8            mov [ebp-0x28],ebx
000020DA  8975D4            mov [ebp-0x2c],esi
000020DD  8B45A4            mov eax,[ebp-0x5c]
000020E0  8945D0            mov [ebp-0x30],eax
000020E3  8B45A0            mov eax,[ebp-0x60]
000020E6  8945CC            mov [ebp-0x34],eax
000020E9  8B459C            mov eax,[ebp-0x64]
000020EC  8945C8            mov [ebp-0x38],eax
000020EF  8B4598            mov eax,[ebp-0x68]
000020F2  8945C4            mov [ebp-0x3c],eax
000020F5  8B4594            mov eax,[ebp-0x6c]
000020F8  8945C0            mov [ebp-0x40],eax
000020FB  8B4590            mov eax,[ebp-0x70]
000020FE  8945BC            mov [ebp-0x44],eax
00002101  897DB8            mov [ebp-0x48],edi
00002104  89D2              mov edx,edx
00002106  894004            mov [eax+0x4],eax
00002109  8955B4            mov [ebp-0x4c],edx
0000210C  8945B0            mov [ebp-0x50],eax
0000210F  E800000000        call 0x2114
00002114  58                pop eax
00002115  8945AC            mov [ebp-0x54],eax
00002118  89E0              mov eax,esp
0000211A  8945A8            mov [ebp-0x58],eax
0000211D  8B45E4            mov eax,[ebp-0x1c]
00002120  83EC08            sub esp,byte +0x8
00002123  50                push eax
00002124  68D8631000        push dword 0x1063d8
00002129  E83C0B0000        call 0x2c6a
0000212E  83C410            add esp,byte +0x10
00002131  8B45E0            mov eax,[ebp-0x20]
00002134  83EC08            sub esp,byte +0x8
00002137  50                push eax
00002138  68E5631000        push dword 0x1063e5
0000213D  E8280B0000        call 0x2c6a
00002142  83C410            add esp,byte +0x10
00002145  8B45DC            mov eax,[ebp-0x24]
00002148  83EC08            sub esp,byte +0x8
0000214B  50                push eax
0000214C  68F2631000        push dword 0x1063f2
00002151  E8140B0000        call 0x2c6a
00002156  83C410            add esp,byte +0x10
00002159  8B45D8            mov eax,[ebp-0x28]
0000215C  83EC08            sub esp,byte +0x8
0000215F  50                push eax
00002160  68FF631000        push dword 0x1063ff
00002165  E8000B0000        call 0x2c6a
0000216A  83C410            add esp,byte +0x10
0000216D  8B45D4            mov eax,[ebp-0x2c]
00002170  83EC08            sub esp,byte +0x8
00002173  50                push eax
00002174  680C641000        push dword 0x10640c
00002179  E8EC0A0000        call 0x2c6a
0000217E  83C410            add esp,byte +0x10
00002181  8B45D0            mov eax,[ebp-0x30]
00002184  83EC08            sub esp,byte +0x8
00002187  50                push eax
00002188  6819641000        push dword 0x106419
0000218D  E8D80A0000        call 0x2c6a
00002192  83C410            add esp,byte +0x10
00002195  8B45CC            mov eax,[ebp-0x34]
00002198  83EC08            sub esp,byte +0x8
0000219B  50                push eax
0000219C  6826641000        push dword 0x106426
000021A1  E8C40A0000        call 0x2c6a
000021A6  83C410            add esp,byte +0x10
000021A9  8B45C8            mov eax,[ebp-0x38]
000021AC  83EC08            sub esp,byte +0x8
000021AF  50                push eax
000021B0  6833641000        push dword 0x106433
000021B5  E8B00A0000        call 0x2c6a
000021BA  83C410            add esp,byte +0x10
000021BD  8B45C4            mov eax,[ebp-0x3c]
000021C0  83EC08            sub esp,byte +0x8
000021C3  50                push eax
000021C4  6840641000        push dword 0x106440
000021C9  E89C0A0000        call 0x2c6a
000021CE  83C410            add esp,byte +0x10
000021D1  8B45C0            mov eax,[ebp-0x40]
000021D4  83EC08            sub esp,byte +0x8
000021D7  50                push eax
000021D8  6850641000        push dword 0x106450
000021DD  E8880A0000        call 0x2c6a
000021E2  83C410            add esp,byte +0x10
000021E5  8B45BC            mov eax,[ebp-0x44]
000021E8  83EC08            sub esp,byte +0x8
000021EB  50                push eax
000021EC  685C641000        push dword 0x10645c
000021F1  E8740A0000        call 0x2c6a
000021F6  83C410            add esp,byte +0x10
000021F9  8B45B8            mov eax,[ebp-0x48]
000021FC  83EC08            sub esp,byte +0x8
000021FF  50                push eax
00002200  6868641000        push dword 0x106468
00002205  E8600A0000        call 0x2c6a
0000220A  83C410            add esp,byte +0x10
0000220D  83EC08            sub esp,byte +0x8
00002210  FF75AC            push dword [ebp-0x54]
00002213  6874641000        push dword 0x106474
00002218  E84D0A0000        call 0x2c6a
0000221D  83C410            add esp,byte +0x10
00002220  8B45B4            mov eax,[ebp-0x4c]
00002223  83EC08            sub esp,byte +0x8
00002226  50                push eax
00002227  687F641000        push dword 0x10647f
0000222C  E8390A0000        call 0x2c6a
00002231  83C410            add esp,byte +0x10
00002234  8B45B0            mov eax,[ebp-0x50]
00002237  83EC08            sub esp,byte +0x8
0000223A  50                push eax
0000223B  688F641000        push dword 0x10648f
00002240  E8250A0000        call 0x2c6a
00002245  83C410            add esp,byte +0x10
00002248  8B45A8            mov eax,[ebp-0x58]
0000224B  83EC08            sub esp,byte +0x8
0000224E  50                push eax
0000224F  68A1641000        push dword 0x1064a1
00002254  E8110A0000        call 0x2c6a
00002259  83C410            add esp,byte +0x10
0000225C  90                nop
0000225D  8D65F4            lea esp,[ebp-0xc]
00002260  5B                pop ebx
00002261  5E                pop esi
00002262  5F                pop edi
00002263  5D                pop ebp
00002264  C3                ret
00002265  55                push ebp
00002266  89E5              mov ebp,esp
00002268  83EC04            sub esp,byte +0x4
0000226B  8B4508            mov eax,[ebp+0x8]
0000226E  8845FC            mov [ebp-0x4],al
00002271  0FB645FC          movzx eax,byte [ebp-0x4]
00002275  A280871000        mov [0x108780],al
0000227A  90                nop
0000227B  C9                leave
0000227C  C3                ret
0000227D  55                push ebp
0000227E  89E5              mov ebp,esp
00002280  83EC08            sub esp,byte +0x8
00002283  8B4508            mov eax,[ebp+0x8]
00002286  89C2              mov edx,eax
00002288  C1EA1F            shr edx,byte 0x1f
0000228B  01D0              add eax,edx
0000228D  D1F8              sar eax,1
0000228F  894508            mov [ebp+0x8],eax
00002292  83EC08            sub esp,byte +0x8
00002295  6A0E              push byte +0xe
00002297  68D4030000        push dword 0x3d4
0000229C  E8B1110000        call 0x3452
000022A1  83C410            add esp,byte +0x10
000022A4  8B4508            mov eax,[ebp+0x8]
000022A7  C1F808            sar eax,byte 0x8
000022AA  0FB6C0            movzx eax,al
000022AD  83EC08            sub esp,byte +0x8
000022B0  50                push eax
000022B1  68D5030000        push dword 0x3d5
000022B6  E897110000        call 0x3452
000022BB  83C410            add esp,byte +0x10
000022BE  83EC08            sub esp,byte +0x8
000022C1  6A0F              push byte +0xf
000022C3  68D4030000        push dword 0x3d4
000022C8  E885110000        call 0x3452
000022CD  83C410            add esp,byte +0x10
000022D0  8B4508            mov eax,[ebp+0x8]
000022D3  0FB6C0            movzx eax,al
000022D6  83EC08            sub esp,byte +0x8
000022D9  50                push eax
000022DA  68D5030000        push dword 0x3d5
000022DF  E86E110000        call 0x3452
000022E4  83C410            add esp,byte +0x10
000022E7  90                nop
000022E8  C9                leave
000022E9  C3                ret
000022EA  55                push ebp
000022EB  89E5              mov ebp,esp
000022ED  83EC18            sub esp,byte +0x18
000022F0  83EC08            sub esp,byte +0x8
000022F3  6A0E              push byte +0xe
000022F5  68D4030000        push dword 0x3d4
000022FA  E853110000        call 0x3452
000022FF  83C410            add esp,byte +0x10
00002302  83EC0C            sub esp,byte +0xc
00002305  68D5030000        push dword 0x3d5
0000230A  E826110000        call 0x3435
0000230F  83C410            add esp,byte +0x10
00002312  0FB6C0            movzx eax,al
00002315  C1E008            shl eax,byte 0x8
00002318  8945F4            mov [ebp-0xc],eax
0000231B  83EC08            sub esp,byte +0x8
0000231E  6A0F              push byte +0xf
00002320  68D4030000        push dword 0x3d4
00002325  E828110000        call 0x3452
0000232A  83C410            add esp,byte +0x10
0000232D  83EC0C            sub esp,byte +0xc
00002330  68D5030000        push dword 0x3d5
00002335  E8FB100000        call 0x3435
0000233A  83C410            add esp,byte +0x10
0000233D  0FB6C0            movzx eax,al
00002340  0145F4            add [ebp-0xc],eax
00002343  8B45F4            mov eax,[ebp-0xc]
00002346  01C0              add eax,eax
00002348  C9                leave
00002349  C3                ret
0000234A  55                push ebp
0000234B  89E5              mov ebp,esp
0000234D  8B550C            mov edx,[ebp+0xc]
00002350  89D0              mov eax,edx
00002352  C1E002            shl eax,byte 0x2
00002355  01D0              add eax,edx
00002357  C1E004            shl eax,byte 0x4
0000235A  89C2              mov edx,eax
0000235C  8B4508            mov eax,[ebp+0x8]
0000235F  01D0              add eax,edx
00002361  01C0              add eax,eax
00002363  5D                pop ebp
00002364  C3                ret
00002365  55                push ebp
00002366  89E5              mov ebp,esp
00002368  8B4D08            mov ecx,[ebp+0x8]
0000236B  BA67666666        mov edx,0x66666667
00002370  89C8              mov eax,ecx
00002372  F7EA              imul edx
00002374  89D0              mov eax,edx
00002376  C1F806            sar eax,byte 0x6
00002379  C1F91F            sar ecx,byte 0x1f
0000237C  89CA              mov edx,ecx
0000237E  29D0              sub eax,edx
00002380  5D                pop ebp
00002381  C3                ret
00002382  55                push ebp
00002383  89E5              mov ebp,esp
00002385  FF7508            push dword [ebp+0x8]
00002388  E8D8FFFFFF        call 0x2365
0000238D  83C404            add esp,byte +0x4
00002390  83C001            add eax,byte +0x1
00002393  50                push eax
00002394  6A00              push byte +0x0
00002396  E8AFFFFFFF        call 0x234a
0000239B  83C408            add esp,byte +0x8
0000239E  C9                leave
0000239F  C3                ret
000023A0  55                push ebp
000023A1  89E5              mov ebp,esp
000023A3  83EC14            sub esp,byte +0x14
000023A6  8B4508            mov eax,[ebp+0x8]
000023A9  8845EC            mov [ebp-0x14],al
000023AC  C745FC00800B00    mov dword [ebp-0x4],0xb8000
000023B3  8B550C            mov edx,[ebp+0xc]
000023B6  8B45FC            mov eax,[ebp-0x4]
000023B9  01C2              add edx,eax
000023BB  0FB645EC          movzx eax,byte [ebp-0x14]
000023BF  8802              mov [edx],al
000023C1  8B450C            mov eax,[ebp+0xc]
000023C4  8D5001            lea edx,[eax+0x1]
000023C7  8B45FC            mov eax,[ebp-0x4]
000023CA  01C2              add edx,eax
000023CC  0FB60580871000    movzx eax,byte [dword 0x108780]
000023D3  8802              mov [edx],al
000023D5  90                nop
000023D6  C9                leave
000023D7  C3                ret
000023D8  55                push ebp
000023D9  89E5              mov ebp,esp
000023DB  53                push ebx
000023DC  83EC14            sub esp,byte +0x14
000023DF  6A00              push byte +0x0
000023E1  6A00              push byte +0x0
000023E3  E862FFFFFF        call 0x234a
000023E8  83C408            add esp,byte +0x8
000023EB  0500800B00        add eax,0xb8000
000023F0  89C3              mov ebx,eax
000023F2  6A01              push byte +0x1
000023F4  6A00              push byte +0x0
000023F6  E84FFFFFFF        call 0x234a
000023FB  83C408            add esp,byte +0x8
000023FE  0500800B00        add eax,0xb8000
00002403  83EC04            sub esp,byte +0x4
00002406  68000F0000        push dword 0xf00
0000240B  53                push ebx
0000240C  50                push eax
0000240D  E85EF7FFFF        call 0x1b70
00002412  83C410            add esp,byte +0x10
00002415  C745F400000000    mov dword [ebp-0xc],0x0
0000241C  EB22              jmp short 0x2440
0000241E  83EC08            sub esp,byte +0x8
00002421  6A18              push byte +0x18
00002423  FF75F4            push dword [ebp-0xc]
00002426  E81FFFFFFF        call 0x234a
0000242B  83C410            add esp,byte +0x10
0000242E  83EC08            sub esp,byte +0x8
00002431  50                push eax
00002432  6A20              push byte +0x20
00002434  E867FFFFFF        call 0x23a0
00002439  83C410            add esp,byte +0x10
0000243C  8345F401          add dword [ebp-0xc],byte +0x1
00002440  837DF44F          cmp dword [ebp-0xc],byte +0x4f
00002444  7ED8              jng 0x241e
00002446  8B4508            mov eax,[ebp+0x8]
00002449  2DA0000000        sub eax,0xa0
0000244E  8B5DFC            mov ebx,[ebp-0x4]
00002451  C9                leave
00002452  C3                ret
00002453  55                push ebp
00002454  89E5              mov ebp,esp
00002456  83EC18            sub esp,byte +0x18
00002459  E88CFEFFFF        call 0x22ea
0000245E  8945F4            mov [ebp-0xc],eax
00002461  C745F000000000    mov dword [ebp-0x10],0x0
00002468  EB61              jmp short 0x24cb
0000246A  817DF49F0F0000    cmp dword [ebp-0xc],0xf9f
00002471  7E11              jng 0x2484
00002473  83EC0C            sub esp,byte +0xc
00002476  FF75F4            push dword [ebp-0xc]
00002479  E85AFFFFFF        call 0x23d8
0000247E  83C410            add esp,byte +0x10
00002481  8945F4            mov [ebp-0xc],eax
00002484  8B55F0            mov edx,[ebp-0x10]
00002487  8B4508            mov eax,[ebp+0x8]
0000248A  01D0              add eax,edx
0000248C  0FB600            movzx eax,byte [eax]
0000248F  3C0A              cmp al,0xa
00002491  7513              jnz 0x24a6
00002493  83EC0C            sub esp,byte +0xc
00002496  FF75F4            push dword [ebp-0xc]
00002499  E8E4FEFFFF        call 0x2382
0000249E  83C410            add esp,byte +0x10
000024A1  8945F4            mov [ebp-0xc],eax
000024A4  EB21              jmp short 0x24c7
000024A6  8B55F0            mov edx,[ebp-0x10]
000024A9  8B4508            mov eax,[ebp+0x8]
000024AC  01D0              add eax,edx
000024AE  0FB600            movzx eax,byte [eax]
000024B1  0FBEC0            movsx eax,al
000024B4  83EC08            sub esp,byte +0x8
000024B7  FF75F4            push dword [ebp-0xc]
000024BA  50                push eax
000024BB  E8E0FEFFFF        call 0x23a0
000024C0  83C410            add esp,byte +0x10
000024C3  8345F402          add dword [ebp-0xc],byte +0x2
000024C7  8345F001          add dword [ebp-0x10],byte +0x1
000024CB  8B55F0            mov edx,[ebp-0x10]
000024CE  8B4508            mov eax,[ebp+0x8]
000024D1  01D0              add eax,edx
000024D3  0FB600            movzx eax,byte [eax]
000024D6  84C0              test al,al
000024D8  7590              jnz 0x246a
000024DA  83EC0C            sub esp,byte +0xc
000024DD  FF75F4            push dword [ebp-0xc]
000024E0  E898FDFFFF        call 0x227d
000024E5  83C410            add esp,byte +0x10
000024E8  90                nop
000024E9  C9                leave
000024EA  C3                ret
000024EB  55                push ebp
000024EC  89E5              mov ebp,esp
000024EE  83EC18            sub esp,byte +0x18
000024F1  E8F4FDFFFF        call 0x22ea
000024F6  83EC0C            sub esp,byte +0xc
000024F9  50                push eax
000024FA  E883FEFFFF        call 0x2382
000024FF  83C410            add esp,byte +0x10
00002502  8945F4            mov [ebp-0xc],eax
00002505  817DF49F0F0000    cmp dword [ebp-0xc],0xf9f
0000250C  7E11              jng 0x251f
0000250E  83EC0C            sub esp,byte +0xc
00002511  FF75F4            push dword [ebp-0xc]
00002514  E8BFFEFFFF        call 0x23d8
00002519  83C410            add esp,byte +0x10
0000251C  8945F4            mov [ebp-0xc],eax
0000251F  83EC0C            sub esp,byte +0xc
00002522  FF75F4            push dword [ebp-0xc]
00002525  E853FDFFFF        call 0x227d
0000252A  83C410            add esp,byte +0x10
0000252D  90                nop
0000252E  C9                leave
0000252F  C3                ret
00002530  55                push ebp
00002531  89E5              mov ebp,esp
00002533  83EC18            sub esp,byte +0x18
00002536  C745F0D0070000    mov dword [ebp-0x10],0x7d0
0000253D  C745F400000000    mov dword [ebp-0xc],0x0
00002544  EB14              jmp short 0x255a
00002546  8B45F4            mov eax,[ebp-0xc]
00002549  01C0              add eax,eax
0000254B  50                push eax
0000254C  6A20              push byte +0x20
0000254E  E84DFEFFFF        call 0x23a0
00002553  83C408            add esp,byte +0x8
00002556  8345F401          add dword [ebp-0xc],byte +0x1
0000255A  8B45F4            mov eax,[ebp-0xc]
0000255D  3B45F0            cmp eax,[ebp-0x10]
00002560  7CE4              jl 0x2546
00002562  6A00              push byte +0x0
00002564  6A00              push byte +0x0
00002566  E8DFFDFFFF        call 0x234a
0000256B  83C408            add esp,byte +0x8
0000256E  83EC0C            sub esp,byte +0xc
00002571  50                push eax
00002572  E806FDFFFF        call 0x227d
00002577  83C410            add esp,byte +0x10
0000257A  90                nop
0000257B  C9                leave
0000257C  C3                ret
0000257D  55                push ebp
0000257E  89E5              mov ebp,esp
00002580  83EC18            sub esp,byte +0x18
00002583  E862FDFFFF        call 0x22ea
00002588  83E802            sub eax,byte +0x2
0000258B  8945F4            mov [ebp-0xc],eax
0000258E  83EC08            sub esp,byte +0x8
00002591  FF75F4            push dword [ebp-0xc]
00002594  6A20              push byte +0x20
00002596  E805FEFFFF        call 0x23a0
0000259B  83C410            add esp,byte +0x10
0000259E  83EC0C            sub esp,byte +0xc
000025A1  FF75F4            push dword [ebp-0xc]
000025A4  E8D4FCFFFF        call 0x227d
000025A9  83C410            add esp,byte +0x10
000025AC  90                nop
000025AD  C9                leave
000025AE  C3                ret
000025AF  55                push ebp
000025B0  89E5              mov ebp,esp
000025B2  53                push ebx
000025B3  83EC20            sub esp,byte +0x20
000025B6  8B5D08            mov ebx,[ebp+0x8]
000025B9  8B4D0C            mov ecx,[ebp+0xc]
000025BC  8B5510            mov edx,[ebp+0x10]
000025BF  8B4514            mov eax,[ebp+0x14]
000025C2  885DE8            mov [ebp-0x18],bl
000025C5  884DE4            mov [ebp-0x1c],cl
000025C8  8855E0            mov [ebp-0x20],dl
000025CB  8845DC            mov [ebp-0x24],al
000025CE  0FB645E4          movzx eax,byte [ebp-0x1c]
000025D2  C1E007            shl eax,byte 0x7
000025D5  89C2              mov edx,eax
000025D7  0FB645E4          movzx eax,byte [ebp-0x1c]
000025DB  C1E005            shl eax,byte 0x5
000025DE  01C2              add edx,eax
000025E0  0FB645E8          movzx eax,byte [ebp-0x18]
000025E4  01C0              add eax,eax
000025E6  01D0              add eax,edx
000025E8  0500800B00        add eax,0xb8000
000025ED  8945F8            mov [ebp-0x8],eax
000025F0  0FB655DC          movzx edx,byte [ebp-0x24]
000025F4  8B45F8            mov eax,[ebp-0x8]
000025F7  8810              mov [eax],dl
000025F9  8345F801          add dword [ebp-0x8],byte +0x1
000025FD  8B45F8            mov eax,[ebp-0x8]
00002600  0FB655E0          movzx edx,byte [ebp-0x20]
00002604  8810              mov [eax],dl
00002606  8345F801          add dword [ebp-0x8],byte +0x1
0000260A  90                nop
0000260B  8B5DFC            mov ebx,[ebp-0x4]
0000260E  C9                leave
0000260F  C3                ret
00002610  55                push ebp
00002611  89E5              mov ebp,esp
00002613  83EC10            sub esp,byte +0x10
00002616  8B4508            mov eax,[ebp+0x8]
00002619  8945FC            mov [ebp-0x4],eax
0000261C  EB61              jmp short 0x267f
0000261E  8B45FC            mov eax,[ebp-0x4]
00002621  0FB600            movzx eax,byte [eax]
00002624  3C0A              cmp al,0xa
00002626  751A              jnz 0x2642
00002628  0FB605C4BA1000    movzx eax,byte [dword 0x10bac4]
0000262F  83C001            add eax,byte +0x1
00002632  A2C4BA1000        mov [0x10bac4],al
00002637  C605C5BA100000    mov byte [dword 0x10bac5],0x0
0000263E  8345FC01          add dword [ebp-0x4],byte +0x1
00002642  8B45FC            mov eax,[ebp-0x4]
00002645  0FB600            movzx eax,byte [eax]
00002648  0FBEC8            movsx ecx,al
0000264B  0FB605C4BA1000    movzx eax,byte [dword 0x10bac4]
00002652  0FB6D0            movzx edx,al
00002655  0FB605C5BA1000    movzx eax,byte [dword 0x10bac5]
0000265C  0FB6C0            movzx eax,al
0000265F  51                push ecx
00002660  6A0F              push byte +0xf
00002662  52                push edx
00002663  50                push eax
00002664  E846FFFFFF        call 0x25af
00002669  83C410            add esp,byte +0x10
0000266C  0FB605C5BA1000    movzx eax,byte [dword 0x10bac5]
00002673  83C001            add eax,byte +0x1
00002676  A2C5BA1000        mov [0x10bac5],al
0000267B  8345FC01          add dword [ebp-0x4],byte +0x1
0000267F  8B45FC            mov eax,[ebp-0x4]
00002682  0FB600            movzx eax,byte [eax]
00002685  84C0              test al,al
00002687  7595              jnz 0x261e
00002689  90                nop
0000268A  90                nop
0000268B  C9                leave
0000268C  C3                ret
0000268D  55                push ebp
0000268E  89E5              mov ebp,esp
00002690  53                push ebx
00002691  83EC10            sub esp,byte +0x10
00002694  837D0800          cmp dword [ebp+0x8],byte +0x0
00002698  7514              jnz 0x26ae
0000269A  8B450C            mov eax,[ebp+0xc]
0000269D  C60030            mov byte [eax],0x30
000026A0  8B450C            mov eax,[ebp+0xc]
000026A3  83C001            add eax,byte +0x1
000026A6  C60000            mov byte [eax],0x0
000026A9  E9A7000000        jmp 0x2755
000026AE  C745F800000000    mov dword [ebp-0x8],0x0
000026B5  8B4508            mov eax,[ebp+0x8]
000026B8  8945F4            mov [ebp-0xc],eax
000026BB  EB1F              jmp short 0x26dc
000026BD  8345F801          add dword [ebp-0x8],byte +0x1
000026C1  8B4DF4            mov ecx,[ebp-0xc]
000026C4  BA67666666        mov edx,0x66666667
000026C9  89C8              mov eax,ecx
000026CB  F7EA              imul edx
000026CD  89D0              mov eax,edx
000026CF  C1F802            sar eax,byte 0x2
000026D2  C1F91F            sar ecx,byte 0x1f
000026D5  89CA              mov edx,ecx
000026D7  29D0              sub eax,edx
000026D9  8945F4            mov [ebp-0xc],eax
000026DC  837DF400          cmp dword [ebp-0xc],byte +0x0
000026E0  75DB              jnz 0x26bd
000026E2  8B45F8            mov eax,[ebp-0x8]
000026E5  83E801            sub eax,byte +0x1
000026E8  8945F0            mov [ebp-0x10],eax
000026EB  EB57              jmp short 0x2744
000026ED  8B4D08            mov ecx,[ebp+0x8]
000026F0  BA67666666        mov edx,0x66666667
000026F5  89C8              mov eax,ecx
000026F7  F7EA              imul edx
000026F9  89D0              mov eax,edx
000026FB  C1F802            sar eax,byte 0x2
000026FE  89CB              mov ebx,ecx
00002700  C1FB1F            sar ebx,byte 0x1f
00002703  29D8              sub eax,ebx
00002705  89C2              mov edx,eax
00002707  89D0              mov eax,edx
00002709  C1E002            shl eax,byte 0x2
0000270C  01D0              add eax,edx
0000270E  01C0              add eax,eax
00002710  29C1              sub ecx,eax
00002712  89CA              mov edx,ecx
00002714  89D0              mov eax,edx
00002716  8D4830            lea ecx,[eax+0x30]
00002719  8B55F0            mov edx,[ebp-0x10]
0000271C  8B450C            mov eax,[ebp+0xc]
0000271F  01D0              add eax,edx
00002721  89CA              mov edx,ecx
00002723  8810              mov [eax],dl
00002725  8B4D08            mov ecx,[ebp+0x8]
00002728  BA67666666        mov edx,0x66666667
0000272D  89C8              mov eax,ecx
0000272F  F7EA              imul edx
00002731  89D0              mov eax,edx
00002733  C1F802            sar eax,byte 0x2
00002736  C1F91F            sar ecx,byte 0x1f
00002739  89CA              mov edx,ecx
0000273B  29D0              sub eax,edx
0000273D  894508            mov [ebp+0x8],eax
00002740  836DF001          sub dword [ebp-0x10],byte +0x1
00002744  837DF000          cmp dword [ebp-0x10],byte +0x0
00002748  79A3              jns 0x26ed
0000274A  8B55F8            mov edx,[ebp-0x8]
0000274D  8B450C            mov eax,[ebp+0xc]
00002750  01D0              add eax,edx
00002752  C60000            mov byte [eax],0x0
00002755  8B5DFC            mov ebx,[ebp-0x4]
00002758  C9                leave
00002759  C3                ret
0000275A  55                push ebp
0000275B  89E5              mov ebp,esp
0000275D  83EC10            sub esp,byte +0x10
00002760  8B4508            mov eax,[ebp+0x8]
00002763  8945FC            mov [ebp-0x4],eax
00002766  C745F800000000    mov dword [ebp-0x8],0x0
0000276D  EB33              jmp short 0x27a2
0000276F  8B45FC            mov eax,[ebp-0x4]
00002772  C1E81C            shr eax,byte 0x1c
00002775  8945F4            mov [ebp-0xc],eax
00002778  837DF409          cmp dword [ebp-0xc],byte +0x9
0000277C  7F0A              jg 0x2788
0000277E  8B45F4            mov eax,[ebp-0xc]
00002781  83C030            add eax,byte +0x30
00002784  89C2              mov edx,eax
00002786  EB08              jmp short 0x2790
00002788  8B45F4            mov eax,[ebp-0xc]
0000278B  83C037            add eax,byte +0x37
0000278E  89C2              mov edx,eax
00002790  8B4DF8            mov ecx,[ebp-0x8]
00002793  8B450C            mov eax,[ebp+0xc]
00002796  01C8              add eax,ecx
00002798  8810              mov [eax],dl
0000279A  C165FC04          shl dword [ebp-0x4],byte 0x4
0000279E  8345F801          add dword [ebp-0x8],byte +0x1
000027A2  8B45F8            mov eax,[ebp-0x8]
000027A5  83F807            cmp eax,byte +0x7
000027A8  76C5              jna 0x276f
000027AA  8B450C            mov eax,[ebp+0xc]
000027AD  83C008            add eax,byte +0x8
000027B0  C60000            mov byte [eax],0x0
000027B3  90                nop
000027B4  C9                leave
000027B5  C3                ret
000027B6  55                push ebp
000027B7  89E5              mov ebp,esp
000027B9  83EC14            sub esp,byte +0x14
000027BC  8B4508            mov eax,[ebp+0x8]
000027BF  8845EC            mov [ebp-0x14],al
000027C2  0FB645EC          movzx eax,byte [ebp-0x14]
000027C6  C0E804            shr al,byte 0x4
000027C9  0FB6C0            movzx eax,al
000027CC  8945FC            mov [ebp-0x4],eax
000027CF  0FB645EC          movzx eax,byte [ebp-0x14]
000027D3  83E00F            and eax,byte +0xf
000027D6  8945F8            mov [ebp-0x8],eax
000027D9  837DFC09          cmp dword [ebp-0x4],byte +0x9
000027DD  7F0A              jg 0x27e9
000027DF  8B45FC            mov eax,[ebp-0x4]
000027E2  83C030            add eax,byte +0x30
000027E5  89C2              mov edx,eax
000027E7  EB08              jmp short 0x27f1
000027E9  8B45FC            mov eax,[ebp-0x4]
000027EC  83C037            add eax,byte +0x37
000027EF  89C2              mov edx,eax
000027F1  8B450C            mov eax,[ebp+0xc]
000027F4  8810              mov [eax],dl
000027F6  837DF809          cmp dword [ebp-0x8],byte +0x9
000027FA  7F0A              jg 0x2806
000027FC  8B45F8            mov eax,[ebp-0x8]
000027FF  83C030            add eax,byte +0x30
00002802  89C2              mov edx,eax
00002804  EB08              jmp short 0x280e
00002806  8B45F8            mov eax,[ebp-0x8]
00002809  83C037            add eax,byte +0x37
0000280C  89C2              mov edx,eax
0000280E  8B450C            mov eax,[ebp+0xc]
00002811  83C001            add eax,byte +0x1
00002814  8810              mov [eax],dl
00002816  8B450C            mov eax,[ebp+0xc]
00002819  83C002            add eax,byte +0x2
0000281C  C60000            mov byte [eax],0x0
0000281F  90                nop
00002820  C9                leave
00002821  C3                ret
00002822  55                push ebp
00002823  89E5              mov ebp,esp
00002825  83EC20            sub esp,byte +0x20
00002828  C745E730313233    mov dword [ebp-0x19],0x33323130
0000282F  C745EB34353637    mov dword [ebp-0x15],0x37363534
00002836  C745EF38394142    mov dword [ebp-0x11],0x42413938
0000283D  C745F343444546    mov dword [ebp-0xd],0x46454443
00002844  C645F700          mov byte [ebp-0x9],0x0
00002848  8B4510            mov eax,[ebp+0x10]
0000284B  83E801            sub eax,byte +0x1
0000284E  8945FC            mov [ebp-0x4],eax
00002851  EB36              jmp short 0x2889
00002853  8B45FC            mov eax,[ebp-0x4]
00002856  C1E002            shl eax,byte 0x2
00002859  8B5508            mov edx,[ebp+0x8]
0000285C  89C1              mov ecx,eax
0000285E  D3FA              sar edx,cl
00002860  89D0              mov eax,edx
00002862  83E00F            and eax,byte +0xf
00002865  8945F8            mov [ebp-0x8],eax
00002868  8B4510            mov eax,[ebp+0x10]
0000286B  83E801            sub eax,byte +0x1
0000286E  2B45FC            sub eax,[ebp-0x4]
00002871  89C2              mov edx,eax
00002873  8B450C            mov eax,[ebp+0xc]
00002876  01C2              add edx,eax
00002878  8D4DE7            lea ecx,[ebp-0x19]
0000287B  8B45F8            mov eax,[ebp-0x8]
0000287E  01C8              add eax,ecx
00002880  0FB600            movzx eax,byte [eax]
00002883  8802              mov [edx],al
00002885  836DFC01          sub dword [ebp-0x4],byte +0x1
00002889  837DFC00          cmp dword [ebp-0x4],byte +0x0
0000288D  79C4              jns 0x2853
0000288F  8B5510            mov edx,[ebp+0x10]
00002892  8B450C            mov eax,[ebp+0xc]
00002895  01D0              add eax,edx
00002897  C60000            mov byte [eax],0x0
0000289A  90                nop
0000289B  C9                leave
0000289C  C3                ret
0000289D  55                push ebp
0000289E  89E5              mov ebp,esp
000028A0  83EC10            sub esp,byte +0x10
000028A3  C745FC00000000    mov dword [ebp-0x4],0x0
000028AA  EB08              jmp short 0x28b4
000028AC  C16D0804          shr dword [ebp+0x8],byte 0x4
000028B0  8345FC01          add dword [ebp-0x4],byte +0x1
000028B4  837D0800          cmp dword [ebp+0x8],byte +0x0
000028B8  75F2              jnz 0x28ac
000028BA  8B45FC            mov eax,[ebp-0x4]
000028BD  C9                leave
000028BE  C3                ret
000028BF  55                push ebp
000028C0  89E5              mov ebp,esp
000028C2  83EC10            sub esp,byte +0x10
000028C5  8B450C            mov eax,[ebp+0xc]
000028C8  83E801            sub eax,byte +0x1
000028CB  8945FC            mov [ebp-0x4],eax
000028CE  EB3D              jmp short 0x290d
000028D0  8B4508            mov eax,[ebp+0x8]
000028D3  83E00F            and eax,byte +0xf
000028D6  8945F8            mov [ebp-0x8],eax
000028D9  837DF809          cmp dword [ebp-0x8],byte +0x9
000028DD  7F14              jg 0x28f3
000028DF  8B45F8            mov eax,[ebp-0x8]
000028E2  8D4830            lea ecx,[eax+0x30]
000028E5  8B55FC            mov edx,[ebp-0x4]
000028E8  8B4510            mov eax,[ebp+0x10]
000028EB  01D0              add eax,edx
000028ED  89CA              mov edx,ecx
000028EF  8810              mov [eax],dl
000028F1  EB12              jmp short 0x2905
000028F3  8B45F8            mov eax,[ebp-0x8]
000028F6  8D4837            lea ecx,[eax+0x37]
000028F9  8B55FC            mov edx,[ebp-0x4]
000028FC  8B4510            mov eax,[ebp+0x10]
000028FF  01D0              add eax,edx
00002901  89CA              mov edx,ecx
00002903  8810              mov [eax],dl
00002905  C16D0804          shr dword [ebp+0x8],byte 0x4
00002909  836DFC01          sub dword [ebp-0x4],byte +0x1
0000290D  837DFC00          cmp dword [ebp-0x4],byte +0x0
00002911  79BD              jns 0x28d0
00002913  90                nop
00002914  90                nop
00002915  C9                leave
00002916  C3                ret
00002917  55                push ebp
00002918  89E5              mov ebp,esp
0000291A  83EC10            sub esp,byte +0x10
0000291D  FF7508            push dword [ebp+0x8]
00002920  E878FFFFFF        call 0x289d
00002925  83C404            add esp,byte +0x4
00002928  8945F4            mov [ebp-0xc],eax
0000292B  8B450C            mov eax,[ebp+0xc]
0000292E  2B45F4            sub eax,[ebp-0xc]
00002931  8945FC            mov [ebp-0x4],eax
00002934  837DFC00          cmp dword [ebp-0x4],byte +0x0
00002938  7907              jns 0x2941
0000293A  C745FC00000000    mov dword [ebp-0x4],0x0
00002941  C745F800000000    mov dword [ebp-0x8],0x0
00002948  EB1B              jmp short 0x2965
0000294A  8B4514            mov eax,[ebp+0x14]
0000294D  8B00              mov eax,[eax]
0000294F  8D4801            lea ecx,[eax+0x1]
00002952  8B5514            mov edx,[ebp+0x14]
00002955  890A              mov [edx],ecx
00002957  89C2              mov edx,eax
00002959  8B4510            mov eax,[ebp+0x10]
0000295C  01D0              add eax,edx
0000295E  C60030            mov byte [eax],0x30
00002961  8345F801          add dword [ebp-0x8],byte +0x1
00002965  8B45F8            mov eax,[ebp-0x8]
00002968  3B45FC            cmp eax,[ebp-0x4]
0000296B  7CDD              jl 0x294a
0000296D  8B4514            mov eax,[ebp+0x14]
00002970  8B00              mov eax,[eax]
00002972  89C2              mov edx,eax
00002974  8B4510            mov eax,[ebp+0x10]
00002977  01D0              add eax,edx
00002979  50                push eax
0000297A  FF75F4            push dword [ebp-0xc]
0000297D  FF7508            push dword [ebp+0x8]
00002980  E83AFFFFFF        call 0x28bf
00002985  83C40C            add esp,byte +0xc
00002988  8B4514            mov eax,[ebp+0x14]
0000298B  8B10              mov edx,[eax]
0000298D  8B45F4            mov eax,[ebp-0xc]
00002990  01C2              add edx,eax
00002992  8B4514            mov eax,[ebp+0x14]
00002995  8910              mov [eax],edx
00002997  90                nop
00002998  C9                leave
00002999  C3                ret
0000299A  55                push ebp
0000299B  89E5              mov ebp,esp
0000299D  83EC04            sub esp,byte +0x4
000029A0  8B4508            mov eax,[ebp+0x8]
000029A3  8845FC            mov [ebp-0x4],al
000029A6  807DFC09          cmp byte [ebp-0x4],0x9
000029AA  770B              ja 0x29b7
000029AC  0FB645FC          movzx eax,byte [ebp-0x4]
000029B0  83C030            add eax,byte +0x30
000029B3  89C1              mov ecx,eax
000029B5  EB09              jmp short 0x29c0
000029B7  0FB645FC          movzx eax,byte [ebp-0x4]
000029BB  83C037            add eax,byte +0x37
000029BE  89C1              mov ecx,eax
000029C0  8B450C            mov eax,[ebp+0xc]
000029C3  8D5001            lea edx,[eax+0x1]
000029C6  89550C            mov [ebp+0xc],edx
000029C9  8808              mov [eax],cl
000029CB  90                nop
000029CC  C9                leave
000029CD  C3                ret
000029CE  55                push ebp
000029CF  89E5              mov ebp,esp
000029D1  83EC60            sub esp,byte +0x60
000029D4  8D4510            lea eax,[ebp+0x10]
000029D7  8945C4            mov [ebp-0x3c],eax
000029DA  C745FC00000000    mov dword [ebp-0x4],0x0
000029E1  E966020000        jmp 0x2c4c
000029E6  8B450C            mov eax,[ebp+0xc]
000029E9  0FB600            movzx eax,byte [eax]
000029EC  3C25              cmp al,0x25
000029EE  0F8539020000      jnz near 0x2c2d
000029F4  83450C01          add dword [ebp+0xc],byte +0x1
000029F8  8B450C            mov eax,[ebp+0xc]
000029FB  0FB600            movzx eax,byte [eax]
000029FE  0FBEC0            movsx eax,al
00002A01  83E858            sub eax,byte +0x58
00002A04  83F81B            cmp eax,byte +0x1b
00002A07  0F873A020000      ja near 0x2c47
00002A0D  8B0485B4641000    mov eax,[eax*4+0x1064b4]
00002A14  FFE0              jmp eax
00002A16  8B45C4            mov eax,[ebp-0x3c]
00002A19  8D5004            lea edx,[eax+0x4]
00002A1C  8955C4            mov [ebp-0x3c],edx
00002A1F  8B00              mov eax,[eax]
00002A21  8945D4            mov [ebp-0x2c],eax
00002A24  8B45FC            mov eax,[ebp-0x4]
00002A27  8D5001            lea edx,[eax+0x1]
00002A2A  8955FC            mov [ebp-0x4],edx
00002A2D  89C2              mov edx,eax
00002A2F  8B4508            mov eax,[ebp+0x8]
00002A32  01C2              add edx,eax
00002A34  8B45D4            mov eax,[ebp-0x2c]
00002A37  0FB600            movzx eax,byte [eax]
00002A3A  8802              mov [edx],al
00002A3C  E907020000        jmp 0x2c48
00002A41  8B45C4            mov eax,[ebp-0x3c]
00002A44  8D5004            lea edx,[eax+0x4]
00002A47  8955C4            mov [ebp-0x3c],edx
00002A4A  8B00              mov eax,[eax]
00002A4C  8B00              mov eax,[eax]
00002A4E  8945F8            mov [ebp-0x8],eax
00002A51  EB20              jmp short 0x2a73
00002A53  8B45F8            mov eax,[ebp-0x8]
00002A56  8D5001            lea edx,[eax+0x1]
00002A59  8955F8            mov [ebp-0x8],edx
00002A5C  0FB608            movzx ecx,byte [eax]
00002A5F  8B45FC            mov eax,[ebp-0x4]
00002A62  8D5001            lea edx,[eax+0x1]
00002A65  8955FC            mov [ebp-0x4],edx
00002A68  89C2              mov edx,eax
00002A6A  8B4508            mov eax,[ebp+0x8]
00002A6D  01D0              add eax,edx
00002A6F  89CA              mov edx,ecx
00002A71  8810              mov [eax],dl
00002A73  8B45F8            mov eax,[ebp-0x8]
00002A76  0FB600            movzx eax,byte [eax]
00002A79  84C0              test al,al
00002A7B  75D6              jnz 0x2a53
00002A7D  E9C6010000        jmp 0x2c48
00002A82  8B45C4            mov eax,[ebp-0x3c]
00002A85  8D5004            lea edx,[eax+0x4]
00002A88  8955C4            mov [ebp-0x3c],edx
00002A8B  8B00              mov eax,[eax]
00002A8D  8B00              mov eax,[eax]
00002A8F  8945D8            mov [ebp-0x28],eax
00002A92  8B45D8            mov eax,[ebp-0x28]
00002A95  8D55B8            lea edx,[ebp-0x48]
00002A98  52                push edx
00002A99  50                push eax
00002A9A  E8EEFBFFFF        call 0x268d
00002A9F  83C408            add esp,byte +0x8
00002AA2  C745F400000000    mov dword [ebp-0xc],0x0
00002AA9  837DD809          cmp dword [ebp-0x28],byte +0x9
00002AAD  7735              ja 0x2ae4
00002AAF  8B45FC            mov eax,[ebp-0x4]
00002AB2  8D5001            lea edx,[eax+0x1]
00002AB5  8955FC            mov [ebp-0x4],edx
00002AB8  89C2              mov edx,eax
00002ABA  8B4508            mov eax,[ebp+0x8]
00002ABD  01D0              add eax,edx
00002ABF  C60030            mov byte [eax],0x30
00002AC2  EB20              jmp short 0x2ae4
00002AC4  8B45F4            mov eax,[ebp-0xc]
00002AC7  8D5001            lea edx,[eax+0x1]
00002ACA  8955F4            mov [ebp-0xc],edx
00002ACD  8B55FC            mov edx,[ebp-0x4]
00002AD0  8D4A01            lea ecx,[edx+0x1]
00002AD3  894DFC            mov [ebp-0x4],ecx
00002AD6  89D1              mov ecx,edx
00002AD8  8B5508            mov edx,[ebp+0x8]
00002ADB  01CA              add edx,ecx
00002ADD  0FB64405B8        movzx eax,byte [ebp+eax-0x48]
00002AE2  8802              mov [edx],al
00002AE4  8D55B8            lea edx,[ebp-0x48]
00002AE7  8B45F4            mov eax,[ebp-0xc]
00002AEA  01D0              add eax,edx
00002AEC  0FB600            movzx eax,byte [eax]
00002AEF  84C0              test al,al
00002AF1  75D1              jnz 0x2ac4
00002AF3  E950010000        jmp 0x2c48
00002AF8  8B45C4            mov eax,[ebp-0x3c]
00002AFB  8D5004            lea edx,[eax+0x4]
00002AFE  8955C4            mov [ebp-0x3c],edx
00002B01  8B00              mov eax,[eax]
00002B03  8B00              mov eax,[eax]
00002B05  8945DC            mov [ebp-0x24],eax
00002B08  8D45AF            lea eax,[ebp-0x51]
00002B0B  50                push eax
00002B0C  FF75DC            push dword [ebp-0x24]
00002B0F  E846FCFFFF        call 0x275a
00002B14  83C408            add esp,byte +0x8
00002B17  C745F000000000    mov dword [ebp-0x10],0x0
00002B1E  EB20              jmp short 0x2b40
00002B20  8B45F0            mov eax,[ebp-0x10]
00002B23  8D5001            lea edx,[eax+0x1]
00002B26  8955F0            mov [ebp-0x10],edx
00002B29  8B55FC            mov edx,[ebp-0x4]
00002B2C  8D4A01            lea ecx,[edx+0x1]
00002B2F  894DFC            mov [ebp-0x4],ecx
00002B32  89D1              mov ecx,edx
00002B34  8B5508            mov edx,[ebp+0x8]
00002B37  01CA              add edx,ecx
00002B39  0FB64405AF        movzx eax,byte [ebp+eax-0x51]
00002B3E  8802              mov [edx],al
00002B40  8D55AF            lea edx,[ebp-0x51]
00002B43  8B45F0            mov eax,[ebp-0x10]
00002B46  01D0              add eax,edx
00002B48  0FB600            movzx eax,byte [eax]
00002B4B  84C0              test al,al
00002B4D  75D1              jnz 0x2b20
00002B4F  E9F4000000        jmp 0x2c48
00002B54  8B45C4            mov eax,[ebp-0x3c]
00002B57  8D5004            lea edx,[eax+0x4]
00002B5A  8955C4            mov [ebp-0x3c],edx
00002B5D  8B00              mov eax,[eax]
00002B5F  8B00              mov eax,[eax]
00002B61  8945D0            mov [ebp-0x30],eax
00002B64  C745EC00000000    mov dword [ebp-0x14],0x0
00002B6B  83450C01          add dword [ebp+0xc],byte +0x1
00002B6F  8B450C            mov eax,[ebp+0xc]
00002B72  0FB600            movzx eax,byte [eax]
00002B75  3C2F              cmp al,0x2f
00002B77  7E1B              jng 0x2b94
00002B79  8B450C            mov eax,[ebp+0xc]
00002B7C  0FB600            movzx eax,byte [eax]
00002B7F  3C39              cmp al,0x39
00002B81  7F11              jg 0x2b94
00002B83  8B450C            mov eax,[ebp+0xc]
00002B86  0FB600            movzx eax,byte [eax]
00002B89  0FBEC0            movsx eax,al
00002B8C  83E830            sub eax,byte +0x30
00002B8F  8945EC            mov [ebp-0x14],eax
00002B92  EB07              jmp short 0x2b9b
00002B94  C745EC08000000    mov dword [ebp-0x14],0x8
00002B9B  FF75D0            push dword [ebp-0x30]
00002B9E  E8FAFCFFFF        call 0x289d
00002BA3  83C404            add esp,byte +0x4
00002BA6  8945CC            mov [ebp-0x34],eax
00002BA9  8B45EC            mov eax,[ebp-0x14]
00002BAC  2B45CC            sub eax,[ebp-0x34]
00002BAF  8945E8            mov [ebp-0x18],eax
00002BB2  837DE800          cmp dword [ebp-0x18],byte +0x0
00002BB6  7907              jns 0x2bbf
00002BB8  C745E800000000    mov dword [ebp-0x18],0x0
00002BBF  C745E400000000    mov dword [ebp-0x1c],0x0
00002BC6  EB17              jmp short 0x2bdf
00002BC8  8B45FC            mov eax,[ebp-0x4]
00002BCB  8D5001            lea edx,[eax+0x1]
00002BCE  8955FC            mov [ebp-0x4],edx
00002BD1  89C2              mov edx,eax
00002BD3  8B4508            mov eax,[ebp+0x8]
00002BD6  01D0              add eax,edx
00002BD8  C60030            mov byte [eax],0x30
00002BDB  8345E401          add dword [ebp-0x1c],byte +0x1
00002BDF  8B45E4            mov eax,[ebp-0x1c]
00002BE2  3B45E8            cmp eax,[ebp-0x18]
00002BE5  7CE1              jl 0x2bc8
00002BE7  8B45CC            mov eax,[ebp-0x34]
00002BEA  83E801            sub eax,byte +0x1
00002BED  8945E0            mov [ebp-0x20],eax
00002BF0  EB33              jmp short 0x2c25
00002BF2  8B45E0            mov eax,[ebp-0x20]
00002BF5  C1E002            shl eax,byte 0x2
00002BF8  8B55D0            mov edx,[ebp-0x30]
00002BFB  89C1              mov ecx,eax
00002BFD  D3EA              shr edx,cl
00002BFF  89D0              mov eax,edx
00002C01  83E00F            and eax,byte +0xf
00002C04  8845CB            mov [ebp-0x35],al
00002C07  8B55FC            mov edx,[ebp-0x4]
00002C0A  8B4508            mov eax,[ebp+0x8]
00002C0D  01C2              add edx,eax
00002C0F  0FB645CB          movzx eax,byte [ebp-0x35]
00002C13  52                push edx
00002C14  50                push eax
00002C15  E880FDFFFF        call 0x299a
00002C1A  83C408            add esp,byte +0x8
00002C1D  8345FC01          add dword [ebp-0x4],byte +0x1
00002C21  836DE001          sub dword [ebp-0x20],byte +0x1
00002C25  837DE000          cmp dword [ebp-0x20],byte +0x0
00002C29  79C7              jns 0x2bf2
00002C2B  EB1B              jmp short 0x2c48
00002C2D  8B45FC            mov eax,[ebp-0x4]
00002C30  8D5001            lea edx,[eax+0x1]
00002C33  8955FC            mov [ebp-0x4],edx
00002C36  89C2              mov edx,eax
00002C38  8B4508            mov eax,[ebp+0x8]
00002C3B  01C2              add edx,eax
00002C3D  8B450C            mov eax,[ebp+0xc]
00002C40  0FB600            movzx eax,byte [eax]
00002C43  8802              mov [edx],al
00002C45  EB01              jmp short 0x2c48
00002C47  90                nop
00002C48  83450C01          add dword [ebp+0xc],byte +0x1
00002C4C  8B450C            mov eax,[ebp+0xc]
00002C4F  0FB600            movzx eax,byte [eax]
00002C52  84C0              test al,al
00002C54  0F858CFDFFFF      jnz near 0x29e6
00002C5A  8B55FC            mov edx,[ebp-0x4]
00002C5D  8B4508            mov eax,[ebp+0x8]
00002C60  01D0              add eax,edx
00002C62  C60000            mov byte [eax],0x0
00002C65  8B45FC            mov eax,[ebp-0x4]
00002C68  C9                leave
00002C69  C3                ret
00002C6A  55                push ebp
00002C6B  89E5              mov ebp,esp
00002C6D  83EC68            sub esp,byte +0x68
00002C70  8D450C            lea eax,[ebp+0xc]
00002C73  8945F4            mov [ebp-0xc],eax
00002C76  8B45F4            mov eax,[ebp-0xc]
00002C79  50                push eax
00002C7A  FF7508            push dword [ebp+0x8]
00002C7D  8D45A4            lea eax,[ebp-0x5c]
00002C80  50                push eax
00002C81  E848FDFFFF        call 0x29ce
00002C86  83C40C            add esp,byte +0xc
00002C89  83EC0C            sub esp,byte +0xc
00002C8C  8D45A4            lea eax,[ebp-0x5c]
00002C8F  50                push eax
00002C90  E8BEF7FFFF        call 0x2453
00002C95  83C410            add esp,byte +0x10
00002C98  90                nop
00002C99  C9                leave
00002C9A  C3                ret
00002C9B  55                push ebp
00002C9C  89E5              mov ebp,esp
00002C9E  83EC28            sub esp,byte +0x28
00002CA1  8B4508            mov eax,[ebp+0x8]
00002CA4  8845E4            mov [ebp-0x1c],al
00002CA7  0FB645E4          movzx eax,byte [ebp-0x1c]
00002CAB  8D55F7            lea edx,[ebp-0x9]
00002CAE  52                push edx
00002CAF  50                push eax
00002CB0  E801FBFFFF        call 0x27b6
00002CB5  83C408            add esp,byte +0x8
00002CB8  83EC0C            sub esp,byte +0xc
00002CBB  8D45F7            lea eax,[ebp-0x9]
00002CBE  50                push eax
00002CBF  E88FF7FFFF        call 0x2453
00002CC4  83C410            add esp,byte +0x10
00002CC7  83EC0C            sub esp,byte +0xc
00002CCA  6824651000        push dword 0x106524
00002CCF  E87FF7FFFF        call 0x2453
00002CD4  83C410            add esp,byte +0x10
00002CD7  90                nop
00002CD8  C9                leave
00002CD9  C3                ret
00002CDA  55                push ebp
00002CDB  89E5              mov ebp,esp
00002CDD  83EC18            sub esp,byte +0x18
00002CE0  8D45EF            lea eax,[ebp-0x11]
00002CE3  50                push eax
00002CE4  FF7508            push dword [ebp+0x8]
00002CE7  E86EFAFFFF        call 0x275a
00002CEC  83C408            add esp,byte +0x8
00002CEF  83EC0C            sub esp,byte +0xc
00002CF2  8D45EF            lea eax,[ebp-0x11]
00002CF5  50                push eax
00002CF6  E858F7FFFF        call 0x2453
00002CFB  83C410            add esp,byte +0x10
00002CFE  90                nop
00002CFF  C9                leave
00002D00  C3                ret
00002D01  55                push ebp
00002D02  89E5              mov ebp,esp
00002D04  83EC28            sub esp,byte +0x28
00002D07  8B4508            mov eax,[ebp+0x8]
00002D0A  8945E8            mov [ebp-0x18],eax
00002D0D  C745E410000000    mov dword [ebp-0x1c],0x10
00002D14  C745F400000000    mov dword [ebp-0xc],0x0
00002D1B  E90C010000        jmp 0x2e2c
00002D20  8B5508            mov edx,[ebp+0x8]
00002D23  8B45F4            mov eax,[ebp-0xc]
00002D26  01D0              add eax,edx
00002D28  83EC0C            sub esp,byte +0xc
00002D2B  50                push eax
00002D2C  E8A9FFFFFF        call 0x2cda
00002D31  83C410            add esp,byte +0x10
00002D34  83EC0C            sub esp,byte +0xc
00002D37  6826651000        push dword 0x106526
00002D3C  E812F7FFFF        call 0x2453
00002D41  83C410            add esp,byte +0x10
00002D44  C745F000000000    mov dword [ebp-0x10],0x0
00002D4B  EB42              jmp short 0x2d8f
00002D4D  8B55F0            mov edx,[ebp-0x10]
00002D50  8B45F4            mov eax,[ebp-0xc]
00002D53  01D0              add eax,edx
00002D55  39450C            cmp [ebp+0xc],eax
00002D58  7621              jna 0x2d7b
00002D5A  8B55F0            mov edx,[ebp-0x10]
00002D5D  8B45F4            mov eax,[ebp-0xc]
00002D60  01C2              add edx,eax
00002D62  8B45E8            mov eax,[ebp-0x18]
00002D65  01D0              add eax,edx
00002D67  0FB600            movzx eax,byte [eax]
00002D6A  0FB6C0            movzx eax,al
00002D6D  83EC0C            sub esp,byte +0xc
00002D70  50                push eax
00002D71  E825FFFFFF        call 0x2c9b
00002D76  83C410            add esp,byte +0x10
00002D79  EB10              jmp short 0x2d8b
00002D7B  83EC0C            sub esp,byte +0xc
00002D7E  6829651000        push dword 0x106529
00002D83  E8E2FEFFFF        call 0x2c6a
00002D88  83C410            add esp,byte +0x10
00002D8B  8345F001          add dword [ebp-0x10],byte +0x1
00002D8F  8B45F0            mov eax,[ebp-0x10]
00002D92  3B45E4            cmp eax,[ebp-0x1c]
00002D95  7CB6              jl 0x2d4d
00002D97  83EC0C            sub esp,byte +0xc
00002D9A  682D651000        push dword 0x10652d
00002D9F  E8C6FEFFFF        call 0x2c6a
00002DA4  83C410            add esp,byte +0x10
00002DA7  C745EC00000000    mov dword [ebp-0x14],0x0
00002DAE  EB5E              jmp short 0x2e0e
00002DB0  8B55EC            mov edx,[ebp-0x14]
00002DB3  8B45F4            mov eax,[ebp-0xc]
00002DB6  01D0              add eax,edx
00002DB8  39450C            cmp [ebp+0xc],eax
00002DBB  763D              jna 0x2dfa
00002DBD  8B55EC            mov edx,[ebp-0x14]
00002DC0  8B45F4            mov eax,[ebp-0xc]
00002DC3  01C2              add edx,eax
00002DC5  8B45E8            mov eax,[ebp-0x18]
00002DC8  01D0              add eax,edx
00002DCA  0FB600            movzx eax,byte [eax]
00002DCD  8845E3            mov [ebp-0x1d],al
00002DD0  807DE31F          cmp byte [ebp-0x1d],0x1f
00002DD4  760C              jna 0x2de2
00002DD6  807DE37E          cmp byte [ebp-0x1d],0x7e
00002DDA  7706              ja 0x2de2
00002DDC  0FB645E3          movzx eax,byte [ebp-0x1d]
00002DE0  EB05              jmp short 0x2de7
00002DE2  B82E000000        mov eax,0x2e
00002DE7  83EC08            sub esp,byte +0x8
00002DEA  50                push eax
00002DEB  6830651000        push dword 0x106530
00002DF0  E875FEFFFF        call 0x2c6a
00002DF5  83C410            add esp,byte +0x10
00002DF8  EB10              jmp short 0x2e0a
00002DFA  83EC0C            sub esp,byte +0xc
00002DFD  6824651000        push dword 0x106524
00002E02  E863FEFFFF        call 0x2c6a
00002E07  83C410            add esp,byte +0x10
00002E0A  8345EC01          add dword [ebp-0x14],byte +0x1
00002E0E  8B45EC            mov eax,[ebp-0x14]
00002E11  3B45E4            cmp eax,[ebp-0x1c]
00002E14  7C9A              jl 0x2db0
00002E16  83EC0C            sub esp,byte +0xc
00002E19  6833651000        push dword 0x106533
00002E1E  E847FEFFFF        call 0x2c6a
00002E23  83C410            add esp,byte +0x10
00002E26  8B45E4            mov eax,[ebp-0x1c]
00002E29  0145F4            add [ebp-0xc],eax
00002E2C  8B45F4            mov eax,[ebp-0xc]
00002E2F  3B450C            cmp eax,[ebp+0xc]
00002E32  0F82E8FEFFFF      jc near 0x2d20
00002E38  90                nop
00002E39  90                nop
00002E3A  C9                leave
00002E3B  C3                ret
00002E3C  55                push ebp
00002E3D  89E5              mov ebp,esp
00002E3F  83EC18            sub esp,byte +0x18
00002E42  8B4508            mov eax,[ebp+0x8]
00002E45  8B4D0C            mov ecx,[ebp+0xc]
00002E48  8B5510            mov edx,[ebp+0x10]
00002E4B  668945F4          mov [ebp-0xc],ax
00002E4F  89C8              mov eax,ecx
00002E51  8845F0            mov [ebp-0x10],al
00002E54  89D0              mov eax,edx
00002E56  8845EC            mov [ebp-0x14],al
00002E59  0FB655F0          movzx edx,byte [ebp-0x10]
00002E5D  0FB745F4          movzx eax,word [ebp-0xc]
00002E61  83EC08            sub esp,byte +0x8
00002E64  52                push edx
00002E65  50                push eax
00002E66  E8E7050000        call 0x3452
00002E6B  83C410            add esp,byte +0x10
00002E6E  0FB655EC          movzx edx,byte [ebp-0x14]
00002E72  0FB745F4          movzx eax,word [ebp-0xc]
00002E76  83C001            add eax,byte +0x1
00002E79  0FB7C0            movzx eax,ax
00002E7C  83EC08            sub esp,byte +0x8
00002E7F  52                push edx
00002E80  50                push eax
00002E81  E8CC050000        call 0x3452
00002E86  83C410            add esp,byte +0x10
00002E89  90                nop
00002E8A  C9                leave
00002E8B  C3                ret
00002E8C  55                push ebp
00002E8D  89E5              mov ebp,esp
00002E8F  83EC08            sub esp,byte +0x8
00002E92  83EC04            sub esp,byte +0x4
00002E95  6A63              push byte +0x63
00002E97  6A05              push byte +0x5
00002E99  68C2030000        push dword 0x3c2
00002E9E  E899FFFFFF        call 0x2e3c
00002EA3  83C410            add esp,byte +0x10
00002EA6  83EC04            sub esp,byte +0x4
00002EA9  6A13              push byte +0x13
00002EAB  6A03              push byte +0x3
00002EAD  68D4030000        push dword 0x3d4
00002EB2  E885FFFFFF        call 0x2e3c
00002EB7  83C410            add esp,byte +0x10
00002EBA  90                nop
00002EBB  C9                leave
00002EBC  C3                ret
00002EBD  55                push ebp
00002EBE  89E5              mov ebp,esp
00002EC0  83EC10            sub esp,byte +0x10
00002EC3  B8F7010000        mov eax,0x1f7
00002EC8  89C2              mov edx,eax
00002ECA  66ED              in ax,dx
00002ECC  668945FE          mov [ebp-0x2],ax
00002ED0  0FB745FE          movzx eax,word [ebp-0x2]
00002ED4  2500080000        and eax,0x800
00002ED9  85C0              test eax,eax
00002EDB  74E6              jz 0x2ec3
00002EDD  90                nop
00002EDE  90                nop
00002EDF  C9                leave
00002EE0  C3                ret
00002EE1  55                push ebp
00002EE2  89E5              mov ebp,esp
00002EE4  B830000000        mov eax,0x30
00002EE9  BAF2010000        mov edx,0x1f2
00002EEE  EE                out dx,al
00002EEF  8B4508            mov eax,[ebp+0x8]
00002EF2  BAF3010000        mov edx,0x1f3
00002EF7  EE                out dx,al
00002EF8  8B4508            mov eax,[ebp+0x8]
00002EFB  C1E808            shr eax,byte 0x8
00002EFE  0FB6C0            movzx eax,al
00002F01  BAF4010000        mov edx,0x1f4
00002F06  EE                out dx,al
00002F07  8B4508            mov eax,[ebp+0x8]
00002F0A  C1E810            shr eax,byte 0x10
00002F0D  0FB6C0            movzx eax,al
00002F10  BAF5010000        mov edx,0x1f5
00002F15  EE                out dx,al
00002F16  8B4508            mov eax,[ebp+0x8]
00002F19  C1E818            shr eax,byte 0x18
00002F1C  83E00F            and eax,byte +0xf
00002F1F  BAF6010000        mov edx,0x1f6
00002F24  EE                out dx,al
00002F25  E893FFFFFF        call 0x2ebd
00002F2A  90                nop
00002F2B  5D                pop ebp
00002F2C  C3                ret
00002F2D  55                push ebp
00002F2E  89E5              mov ebp,esp
00002F30  83EC10            sub esp,byte +0x10
00002F33  8B4508            mov eax,[ebp+0x8]
00002F36  8945F8            mov [ebp-0x8],eax
00002F39  BAF7010000        mov edx,0x1f7
00002F3E  66B80102          mov ax,0x201
00002F42  66EF              out dx,ax
00002F44  E874FFFFFF        call 0x2ebd
00002F49  C745FC00000000    mov dword [ebp-0x4],0x0
00002F50  EB1C              jmp short 0x2f6e
00002F52  8B45FC            mov eax,[ebp-0x4]
00002F55  8D1400            lea edx,[eax+eax]
00002F58  8B45F8            mov eax,[ebp-0x8]
00002F5B  8D0C02            lea ecx,[edx+eax]
00002F5E  B8F0010000        mov eax,0x1f0
00002F63  89C2              mov edx,eax
00002F65  66ED              in ax,dx
00002F67  668901            mov [ecx],ax
00002F6A  8345FC01          add dword [ebp-0x4],byte +0x1
00002F6E  817DFCFF000000    cmp dword [ebp-0x4],0xff
00002F75  76DB              jna 0x2f52
00002F77  90                nop
00002F78  90                nop
00002F79  C9                leave
00002F7A  C3                ret
00002F7B  55                push ebp
00002F7C  89E5              mov ebp,esp
00002F7E  83EC10            sub esp,byte +0x10
00002F81  8B4510            mov eax,[ebp+0x10]
00002F84  8945FC            mov [ebp-0x4],eax
00002F87  FF7508            push dword [ebp+0x8]
00002F8A  E852FFFFFF        call 0x2ee1
00002F8F  83C404            add esp,byte +0x4
00002F92  C745F800000000    mov dword [ebp-0x8],0x0
00002F99  EB79              jmp short 0x3014
00002F9B  B8F7010000        mov eax,0x1f7
00002FA0  89C2              mov edx,eax
00002FA2  66ED              in ax,dx
00002FA4  668945F2          mov [ebp-0xe],ax
00002FA8  0FB745F2          movzx eax,word [ebp-0xe]
00002FAC  2500080000        and eax,0x800
00002FB1  85C0              test eax,eax
00002FB3  74E6              jz 0x2f9b
00002FB5  B820000000        mov eax,0x20
00002FBA  BAF7010000        mov edx,0x1f7
00002FBF  66EF              out dx,ax
00002FC1  B8F7010000        mov eax,0x1f7
00002FC6  89C2              mov edx,eax
00002FC8  66ED              in ax,dx
00002FCA  668945F2          mov [ebp-0xe],ax
00002FCE  0FB745F2          movzx eax,word [ebp-0xe]
00002FD2  2500080000        and eax,0x800
00002FD7  85C0              test eax,eax
00002FD9  74E6              jz 0x2fc1
00002FDB  C745F400000000    mov dword [ebp-0xc],0x0
00002FE2  EB1C              jmp short 0x3000
00002FE4  8B45F4            mov eax,[ebp-0xc]
00002FE7  8D1400            lea edx,[eax+eax]
00002FEA  8B45FC            mov eax,[ebp-0x4]
00002FED  8D0C02            lea ecx,[edx+eax]
00002FF0  B8F0010000        mov eax,0x1f0
00002FF5  89C2              mov edx,eax
00002FF7  66ED              in ax,dx
00002FF9  668901            mov [ecx],ax
00002FFC  8345F401          add dword [ebp-0xc],byte +0x1
00003000  817DF4FF000000    cmp dword [ebp-0xc],0xff
00003007  76DB              jna 0x2fe4
00003009  8145FC00020000    add dword [ebp-0x4],0x200
00003010  8345F801          add dword [ebp-0x8],byte +0x1
00003014  8B45F8            mov eax,[ebp-0x8]
00003017  3B450C            cmp eax,[ebp+0xc]
0000301A  0F827BFFFFFF      jc near 0x2f9b
00003020  90                nop
00003021  90                nop
00003022  C9                leave
00003023  C3                ret
00003024  55                push ebp
00003025  89E5              mov ebp,esp
00003027  83EC10            sub esp,byte +0x10
0000302A  8B4508            mov eax,[ebp+0x8]
0000302D  8945F8            mov [ebp-0x8],eax
00003030  BAF7010000        mov edx,0x1f7
00003035  66B80103          mov ax,0x301
00003039  66EF              out dx,ax
0000303B  E87DFEFFFF        call 0x2ebd
00003040  C745FC00000000    mov dword [ebp-0x4],0x0
00003047  EB19              jmp short 0x3062
00003049  8B45FC            mov eax,[ebp-0x4]
0000304C  8D1400            lea edx,[eax+eax]
0000304F  8B45F8            mov eax,[ebp-0x8]
00003052  01D0              add eax,edx
00003054  0FB700            movzx eax,word [eax]
00003057  BAF0010000        mov edx,0x1f0
0000305C  66EF              out dx,ax
0000305E  8345FC01          add dword [ebp-0x4],byte +0x1
00003062  817DFCFF000000    cmp dword [ebp-0x4],0xff
00003069  76DE              jna 0x3049
0000306B  90                nop
0000306C  90                nop
0000306D  C9                leave
0000306E  C3                ret
0000306F  55                push ebp
00003070  89E5              mov ebp,esp
00003072  83EC10            sub esp,byte +0x10
00003075  8B4510            mov eax,[ebp+0x10]
00003078  8945FC            mov [ebp-0x4],eax
0000307B  FF7508            push dword [ebp+0x8]
0000307E  E85EFEFFFF        call 0x2ee1
00003083  83C404            add esp,byte +0x4
00003086  C745F800000000    mov dword [ebp-0x8],0x0
0000308D  EB76              jmp short 0x3105
0000308F  B8F7010000        mov eax,0x1f7
00003094  89C2              mov edx,eax
00003096  66ED              in ax,dx
00003098  668945F2          mov [ebp-0xe],ax
0000309C  0FB745F2          movzx eax,word [ebp-0xe]
000030A0  2500080000        and eax,0x800
000030A5  85C0              test eax,eax
000030A7  74E6              jz 0x308f
000030A9  B830000000        mov eax,0x30
000030AE  BAF7010000        mov edx,0x1f7
000030B3  66EF              out dx,ax
000030B5  B8F7010000        mov eax,0x1f7
000030BA  89C2              mov edx,eax
000030BC  66ED              in ax,dx
000030BE  668945F2          mov [ebp-0xe],ax
000030C2  0FB745F2          movzx eax,word [ebp-0xe]
000030C6  2500080000        and eax,0x800
000030CB  85C0              test eax,eax
000030CD  74E6              jz 0x30b5
000030CF  C745F400000000    mov dword [ebp-0xc],0x0
000030D6  EB19              jmp short 0x30f1
000030D8  8B45F4            mov eax,[ebp-0xc]
000030DB  8D1400            lea edx,[eax+eax]
000030DE  8B45FC            mov eax,[ebp-0x4]
000030E1  01D0              add eax,edx
000030E3  0FB700            movzx eax,word [eax]
000030E6  BAF0010000        mov edx,0x1f0
000030EB  66EF              out dx,ax
000030ED  8345F401          add dword [ebp-0xc],byte +0x1
000030F1  817DF4FF000000    cmp dword [ebp-0xc],0xff
000030F8  76DE              jna 0x30d8
000030FA  8145FC00020000    add dword [ebp-0x4],0x200
00003101  8345F801          add dword [ebp-0x8],byte +0x1
00003105  8B45F8            mov eax,[ebp-0x8]
00003108  3B450C            cmp eax,[ebp+0xc]
0000310B  7282              jc 0x308f
0000310D  90                nop
0000310E  90                nop
0000310F  C9                leave
00003110  C3                ret
00003111  55                push ebp
00003112  89E5              mov ebp,esp
00003114  83EC08            sub esp,byte +0x8
00003117  83EC0C            sub esp,byte +0xc
0000311A  6835651000        push dword 0x106535
0000311F  E8960A0000        call 0x3bba
00003124  83C410            add esp,byte +0x10
00003127  83EC04            sub esp,byte +0x4
0000312A  50                push eax
0000312B  6835651000        push dword 0x106535
00003130  FF7508            push dword [ebp+0x8]
00003133  E8AF0F0000        call 0x40e7
00003138  83C410            add esp,byte +0x10
0000313B  85C0              test eax,eax
0000313D  0F85C0000000      jnz near 0x3203
00003143  83EC0C            sub esp,byte +0xc
00003146  6835651000        push dword 0x106535
0000314B  E86A0A0000        call 0x3bba
00003150  83C410            add esp,byte +0x10
00003153  8B5508            mov edx,[ebp+0x8]
00003156  01D0              add eax,edx
00003158  0FB600            movzx eax,byte [eax]
0000315B  0FBEC0            movsx eax,al
0000315E  83EC0C            sub esp,byte +0xc
00003161  50                push eax
00003162  E82A0A0000        call 0x3b91
00003167  83C410            add esp,byte +0x10
0000316A  84C0              test al,al
0000316C  0F8491000000      jz near 0x3203
00003172  83EC0C            sub esp,byte +0xc
00003175  6835651000        push dword 0x106535
0000317A  E83B0A0000        call 0x3bba
0000317F  83C410            add esp,byte +0x10
00003182  8D5001            lea edx,[eax+0x1]
00003185  8B4508            mov eax,[ebp+0x8]
00003188  01D0              add eax,edx
0000318A  0FB600            movzx eax,byte [eax]
0000318D  0FBEC0            movsx eax,al
00003190  83EC0C            sub esp,byte +0xc
00003193  50                push eax
00003194  E8F8090000        call 0x3b91
00003199  83C410            add esp,byte +0x10
0000319C  84C0              test al,al
0000319E  7463              jz 0x3203
000031A0  83EC0C            sub esp,byte +0xc
000031A3  6835651000        push dword 0x106535
000031A8  E80D0A0000        call 0x3bba
000031AD  83C410            add esp,byte +0x10
000031B0  8D5002            lea edx,[eax+0x2]
000031B3  8B4508            mov eax,[ebp+0x8]
000031B6  01D0              add eax,edx
000031B8  0FB600            movzx eax,byte [eax]
000031BB  0FBEC0            movsx eax,al
000031BE  83EC0C            sub esp,byte +0xc
000031C1  50                push eax
000031C2  E8CA090000        call 0x3b91
000031C7  83C410            add esp,byte +0x10
000031CA  84C0              test al,al
000031CC  7435              jz 0x3203
000031CE  83EC0C            sub esp,byte +0xc
000031D1  6835651000        push dword 0x106535
000031D6  E8DF090000        call 0x3bba
000031DB  83C410            add esp,byte +0x10
000031DE  8D5003            lea edx,[eax+0x3]
000031E1  8B4508            mov eax,[ebp+0x8]
000031E4  01D0              add eax,edx
000031E6  0FB600            movzx eax,byte [eax]
000031E9  0FBEC0            movsx eax,al
000031EC  83EC0C            sub esp,byte +0xc
000031EF  50                push eax
000031F0  E89C090000        call 0x3b91
000031F5  83C410            add esp,byte +0x10
000031F8  84C0              test al,al
000031FA  7407              jz 0x3203
000031FC  B801000000        mov eax,0x1
00003201  EB05              jmp short 0x3208
00003203  B800000000        mov eax,0x0
00003208  83E001            and eax,byte +0x1
0000320B  C9                leave
0000320C  C3                ret
0000320D  55                push ebp
0000320E  89E5              mov ebp,esp
00003210  83EC18            sub esp,byte +0x18
00003213  E8D2F0FFFF        call 0x22ea
00003218  8945F4            mov [ebp-0xc],eax
0000321B  83EC0C            sub esp,byte +0xc
0000321E  68000F0000        push dword 0xf00
00003223  E855F0FFFF        call 0x227d
00003228  83C410            add esp,byte +0x10
0000322B  83EC0C            sub esp,byte +0xc
0000322E  FF7508            push dword [ebp+0x8]
00003231  E81DF2FFFF        call 0x2453
00003236  83C410            add esp,byte +0x10
00003239  83EC0C            sub esp,byte +0xc
0000323C  FF75F4            push dword [ebp-0xc]
0000323F  E839F0FFFF        call 0x227d
00003244  83C410            add esp,byte +0x10
00003247  90                nop
00003248  C9                leave
00003249  C3                ret
0000324A  55                push ebp
0000324B  89E5              mov ebp,esp
0000324D  83EC08            sub esp,byte +0x8
00003250  83EC0C            sub esp,byte +0xc
00003253  68C8BA1000        push dword 0x10bac8
00003258  E8B0FFFFFF        call 0x320d
0000325D  83C410            add esp,byte +0x10
00003260  90                nop
00003261  C9                leave
00003262  C3                ret
00003263  55                push ebp
00003264  89E5              mov ebp,esp
00003266  83EC28            sub esp,byte +0x28
00003269  8B4508            mov eax,[ebp+0x8]
0000326C  8845E4            mov [ebp-0x1c],al
0000326F  807DE400          cmp byte [ebp-0x1c],0x0
00003273  0F84E3000000      jz near 0x335c
00003279  0FB645E4          movzx eax,byte [ebp-0x1c]
0000327D  0FBEC0            movsx eax,al
00003280  83EC0C            sub esp,byte +0xc
00003283  50                push eax
00003284  E8A0080000        call 0x3b29
00003289  83C410            add esp,byte +0x10
0000328C  8845F7            mov [ebp-0x9],al
0000328F  0FBE45F7          movsx eax,byte [ebp-0x9]
00003293  83EC0C            sub esp,byte +0xc
00003296  50                push eax
00003297  E8B4080000        call 0x3b50
0000329C  83C410            add esp,byte +0x10
0000329F  84C0              test al,al
000032A1  0F84A8000000      jz near 0x334f
000032A7  A1D4BA1000        mov eax,[0x10bad4]
000032AC  83F809            cmp eax,byte +0x9
000032AF  0F8F9A000000      jg near 0x334f
000032B5  A1D4BA1000        mov eax,[0x10bad4]
000032BA  8D5001            lea edx,[eax+0x1]
000032BD  8915D4BA1000      mov [dword 0x10bad4],edx
000032C3  0FB655F7          movzx edx,byte [ebp-0x9]
000032C7  8890C8BA1000      mov [eax+0x10bac8],dl
000032CD  A1D4BA1000        mov eax,[0x10bad4]
000032D2  C680C8BA100000    mov byte [eax+0x10bac8],0x0
000032D9  83EC0C            sub esp,byte +0xc
000032DC  68C8BA1000        push dword 0x10bac8
000032E1  E82BFEFFFF        call 0x3111
000032E6  83C410            add esp,byte +0x10
000032E9  84C0              test al,al
000032EB  746E              jz 0x335b
000032ED  83EC0C            sub esp,byte +0xc
000032F0  6835651000        push dword 0x106535
000032F5  E8C0080000        call 0x3bba
000032FA  83C410            add esp,byte +0x10
000032FD  8D5004            lea edx,[eax+0x4]
00003300  A1D4BA1000        mov eax,[0x10bad4]
00003305  39C2              cmp edx,eax
00003307  7552              jnz 0x335b
00003309  83EC0C            sub esp,byte +0xc
0000330C  6835651000        push dword 0x106535
00003311  E8A4080000        call 0x3bba
00003316  83C410            add esp,byte +0x10
00003319  05C8BA1000        add eax,0x10bac8
0000331E  83EC04            sub esp,byte +0x4
00003321  6A04              push byte +0x4
00003323  50                push eax
00003324  8D45F2            lea eax,[ebp-0xe]
00003327  50                push eax
00003328  E8170D0000        call 0x4044
0000332D  83C410            add esp,byte +0x10
00003330  C645F600          mov byte [ebp-0xa],0x0
00003334  83EC0C            sub esp,byte +0xc
00003337  8D45F2            lea eax,[ebp-0xe]
0000333A  50                push eax
0000333B  E80AFFFFFF        call 0x324a
00003340  83C410            add esp,byte +0x10
00003343  C705D4BA10000000  mov dword [dword 0x10bad4],0x0
         -0000
0000334D  EB0C              jmp short 0x335b
0000334F  C705D4BA10000000  mov dword [dword 0x10bad4],0x0
         -0000
00003359  EB01              jmp short 0x335c
0000335B  90                nop
0000335C  90                nop
0000335D  C9                leave
0000335E  C3                ret
0000335F  55                push ebp
00003360  89E5              mov ebp,esp
00003362  83EC18            sub esp,byte +0x18
00003365  83EC0C            sub esp,byte +0xc
00003368  6A60              push byte +0x60
0000336A  E8C6000000        call 0x3435
0000336F  83C410            add esp,byte +0x10
00003372  8845F7            mov [ebp-0x9],al
00003375  807DF7E0          cmp byte [ebp-0x9],0xe0
00003379  7509              jnz 0x3384
0000337B  C60560BB100001    mov byte [dword 0x10bb60],0x1
00003382  EB3E              jmp short 0x33c2
00003384  0FB645F7          movzx eax,byte [ebp-0x9]
00003388  84C0              test al,al
0000338A  7911              jns 0x339d
0000338C  8045F780          add byte [ebp-0x9],0x80
00003390  0FB645F7          movzx eax,byte [ebp-0x9]
00003394  C680E0BA100000    mov byte [eax+0x10bae0],0x0
0000339B  EB25              jmp short 0x33c2
0000339D  0FB645F7          movzx eax,byte [ebp-0x9]
000033A1  84C0              test al,al
000033A3  781D              js 0x33c2
000033A5  0FB645F7          movzx eax,byte [ebp-0x9]
000033A9  C680E0BA100001    mov byte [eax+0x10bae0],0x1
000033B0  0FB60560BB1000    movzx eax,byte [dword 0x10bb60]
000033B7  84C0              test al,al
000033B9  7407              jz 0x33c2
000033BB  C60560BB100000    mov byte [dword 0x10bb60],0x0
000033C2  C9                leave
000033C3  C3                ret
000033C4  55                push ebp
000033C5  89E5              mov ebp,esp
000033C7  83EC08            sub esp,byte +0x8
000033CA  83EC08            sub esp,byte +0x8
000033CD  685F331000        push dword 0x10335f
000033D2  6A21              push byte +0x21
000033D4  E816E7FFFF        call 0x1aef
000033D9  83C410            add esp,byte +0x10
000033DC  90                nop
000033DD  C9                leave
000033DE  C3                ret
000033DF  55                push ebp
000033E0  89E5              mov ebp,esp
000033E2  83EC04            sub esp,byte +0x4
000033E5  8B4508            mov eax,[ebp+0x8]
000033E8  8845FC            mov [ebp-0x4],al
000033EB  0FB645FC          movzx eax,byte [ebp-0x4]
000033EF  84C0              test al,al
000033F1  780D              js 0x3400
000033F3  0FB645FC          movzx eax,byte [ebp-0x4]
000033F7  0FB680E0BA1000    movzx eax,byte [eax+0x10bae0]
000033FE  EB05              jmp short 0x3405
00003400  B800000000        mov eax,0x0
00003405  C9                leave
00003406  C3                ret
00003407  55                push ebp
00003408  89E5              mov ebp,esp
0000340A  83EC18            sub esp,byte +0x18
0000340D  83EC0C            sub esp,byte +0xc
00003410  6A21              push byte +0x21
00003412  E860010000        call 0x3577
00003417  83C410            add esp,byte +0x10
0000341A  90                nop
0000341B  E8E0CBFFFF        call 0x0
00003420  83E001            and eax,byte +0x1
00003423  85C0              test eax,eax
00003425  74F4              jz 0x341b
00003427  E8E9CBFFFF        call 0x15
0000342C  8845F7            mov [ebp-0x9],al
0000342F  0FB645F7          movzx eax,byte [ebp-0x9]
00003433  C9                leave
00003434  C3                ret
00003435  55                push ebp
00003436  89E5              mov ebp,esp
00003438  83EC14            sub esp,byte +0x14
0000343B  8B4508            mov eax,[ebp+0x8]
0000343E  668945EC          mov [ebp-0x14],ax
00003442  0FB745EC          movzx eax,word [ebp-0x14]
00003446  89C2              mov edx,eax
00003448  EC                in al,dx
00003449  8845FF            mov [ebp-0x1],al
0000344C  0FB645FF          movzx eax,byte [ebp-0x1]
00003450  C9                leave
00003451  C3                ret
00003452  55                push ebp
00003453  89E5              mov ebp,esp
00003455  83EC08            sub esp,byte +0x8
00003458  8B4508            mov eax,[ebp+0x8]
0000345B  8B550C            mov edx,[ebp+0xc]
0000345E  668945FC          mov [ebp-0x4],ax
00003462  89D0              mov eax,edx
00003464  8845F8            mov [ebp-0x8],al
00003467  0FB645F8          movzx eax,byte [ebp-0x8]
0000346B  0FB755FC          movzx edx,word [ebp-0x4]
0000346F  EE                out dx,al
00003470  90                nop
00003471  C9                leave
00003472  C3                ret
00003473  55                push ebp
00003474  89E5              mov ebp,esp
00003476  83EC14            sub esp,byte +0x14
00003479  8B4508            mov eax,[ebp+0x8]
0000347C  668945EC          mov [ebp-0x14],ax
00003480  0FB745EC          movzx eax,word [ebp-0x14]
00003484  89C2              mov edx,eax
00003486  66ED              in ax,dx
00003488  668945FE          mov [ebp-0x2],ax
0000348C  0FB745FE          movzx eax,word [ebp-0x2]
00003490  C9                leave
00003491  C3                ret
00003492  55                push ebp
00003493  89E5              mov ebp,esp
00003495  83EC08            sub esp,byte +0x8
00003498  8B5508            mov edx,[ebp+0x8]
0000349B  8B450C            mov eax,[ebp+0xc]
0000349E  668955FC          mov [ebp-0x4],dx
000034A2  668945F8          mov [ebp-0x8],ax
000034A6  0FB745F8          movzx eax,word [ebp-0x8]
000034AA  0FB755FC          movzx edx,word [ebp-0x4]
000034AE  66EF              out dx,ax
000034B0  90                nop
000034B1  C9                leave
000034B2  C3                ret
000034B3  55                push ebp
000034B4  89E5              mov ebp,esp
000034B6  83EC08            sub esp,byte +0x8
000034B9  83EC0C            sub esp,byte +0xc
000034BC  6898671000        push dword 0x106798
000034C1  E88DEFFFFF        call 0x2453
000034C6  83C410            add esp,byte +0x10
000034C9  90                nop
000034CA  C9                leave
000034CB  C3                ret
000034CC  55                push ebp
000034CD  89E5              mov ebp,esp
000034CF  83EC08            sub esp,byte +0x8
000034D2  83EC08            sub esp,byte +0x8
000034D5  68B3341000        push dword 0x1034b3
000034DA  6A2A              push byte +0x2a
000034DC  E80EE6FFFF        call 0x1aef
000034E1  83C410            add esp,byte +0x10
000034E4  90                nop
000034E5  C9                leave
000034E6  C3                ret
000034E7  55                push ebp
000034E8  89E5              mov ebp,esp
000034EA  8B450C            mov eax,[ebp+0xc]
000034ED  89C2              mov edx,eax
000034EF  8B4508            mov eax,[ebp+0x8]
000034F2  668914C580BB1000  mov [eax*8+0x10bb80],dx
000034FA  8B4508            mov eax,[ebp+0x8]
000034FD  66C704C582BB1000  mov word [eax*8+0x10bb82],0x8
         -0800
00003507  8B4508            mov eax,[ebp+0x8]
0000350A  C604C584BB100000  mov byte [eax*8+0x10bb84],0x0
00003512  8B4508            mov eax,[ebp+0x8]
00003515  C604C585BB10008E  mov byte [eax*8+0x10bb85],0x8e
0000351D  8B450C            mov eax,[ebp+0xc]
00003520  C1E810            shr eax,byte 0x10
00003523  89C2              mov edx,eax
00003525  8B4508            mov eax,[ebp+0x8]
00003528  668914C586BB1000  mov [eax*8+0x10bb86],dx
00003530  90                nop
00003531  5D                pop ebp
00003532  C3                ret
00003533  55                push ebp
00003534  89E5              mov ebp,esp
00003536  B880BB1000        mov eax,0x10bb80
0000353B  A382C31000        mov [0x10c382],eax
00003540  66C70580C31000FF  mov word [dword 0x10c380],0x7ff
         -07
00003549  B880C31000        mov eax,0x10c380
0000354E  0F0118            lidt [eax]
00003551  90                nop
00003552  5D                pop ebp
00003553  C3                ret
00003554  55                push ebp
00003555  89E5              mov ebp,esp
00003557  83EC08            sub esp,byte +0x8
0000355A  A1A0C31000        mov eax,[0x10c3a0]
0000355F  83C001            add eax,byte +0x1
00003562  A3A0C31000        mov [0x10c3a0],eax
00003567  83EC0C            sub esp,byte +0xc
0000356A  6A01              push byte +0x1
0000356C  E870010000        call 0x36e1
00003571  83C410            add esp,byte +0x10
00003574  90                nop
00003575  C9                leave
00003576  C3                ret
00003577  55                push ebp
00003578  89E5              mov ebp,esp
0000357A  83EC10            sub esp,byte +0x10
0000357D  A1A0C31000        mov eax,[0x10c3a0]
00003582  8945FC            mov [ebp-0x4],eax
00003585  90                nop
00003586  A1A0C31000        mov eax,[0x10c3a0]
0000358B  2B45FC            sub eax,[ebp-0x4]
0000358E  89C2              mov edx,eax
00003590  8B4508            mov eax,[ebp+0x8]
00003593  39C2              cmp edx,eax
00003595  72EF              jc 0x3586
00003597  90                nop
00003598  90                nop
00003599  C9                leave
0000359A  C3                ret
0000359B  55                push ebp
0000359C  89E5              mov ebp,esp
0000359E  A1A0C31000        mov eax,[0x10c3a0]
000035A3  5D                pop ebp
000035A4  C3                ret
000035A5  55                push ebp
000035A6  89E5              mov ebp,esp
000035A8  83EC18            sub esp,byte +0x18
000035AB  A13CC41000        mov eax,[0x10c43c]
000035B0  85C0              test eax,eax
000035B2  0F94C0            setz al
000035B5  0FB6C0            movzx eax,al
000035B8  A33CC41000        mov [0x10c43c],eax
000035BD  E828EDFFFF        call 0x22ea
000035C2  8945F4            mov [ebp-0xc],eax
000035C5  83EC0C            sub esp,byte +0xc
000035C8  6890000000        push dword 0x90
000035CD  E8ABECFFFF        call 0x227d
000035D2  83C410            add esp,byte +0x10
000035D5  83EC0C            sub esp,byte +0xc
000035D8  FF75F4            push dword [ebp-0xc]
000035DB  E89DECFFFF        call 0x227d
000035E0  83C410            add esp,byte +0x10
000035E3  90                nop
000035E4  C9                leave
000035E5  C3                ret
000035E6  55                push ebp
000035E7  89E5              mov ebp,esp
000035E9  83EC18            sub esp,byte +0x18
000035EC  83EC08            sub esp,byte +0x8
000035EF  6854351000        push dword 0x103554
000035F4  6A20              push byte +0x20
000035F6  E8F4E4FFFF        call 0x1aef
000035FB  83C410            add esp,byte +0x10
000035FE  B8DC341200        mov eax,0x1234dc
00003603  BA00000000        mov edx,0x0
00003608  F77508            div dword [ebp+0x8]
0000360B  8945F4            mov [ebp-0xc],eax
0000360E  8B45F4            mov eax,[ebp-0xc]
00003611  8845F3            mov [ebp-0xd],al
00003614  8B45F4            mov eax,[ebp-0xc]
00003617  C1E808            shr eax,byte 0x8
0000361A  8845F2            mov [ebp-0xe],al
0000361D  83EC08            sub esp,byte +0x8
00003620  6A36              push byte +0x36
00003622  6A43              push byte +0x43
00003624  E829FEFFFF        call 0x3452
00003629  83C410            add esp,byte +0x10
0000362C  0FB645F3          movzx eax,byte [ebp-0xd]
00003630  83EC08            sub esp,byte +0x8
00003633  50                push eax
00003634  6A40              push byte +0x40
00003636  E817FEFFFF        call 0x3452
0000363B  83C410            add esp,byte +0x10
0000363E  0FB645F2          movzx eax,byte [ebp-0xe]
00003642  83EC08            sub esp,byte +0x8
00003645  50                push eax
00003646  6A40              push byte +0x40
00003648  E805FEFFFF        call 0x3452
0000364D  83C410            add esp,byte +0x10
00003650  83EC08            sub esp,byte +0x8
00003653  68A5351000        push dword 0x1035a5
00003658  6A64              push byte +0x64
0000365A  E806000000        call 0x3665
0000365F  83C410            add esp,byte +0x10
00003662  90                nop
00003663  C9                leave
00003664  C3                ret
00003665  55                push ebp
00003666  89E5              mov ebp,esp
00003668  0FB60538C41000    movzx eax,byte [dword 0x10c438]
0000366F  3C09              cmp al,0x9
00003671  776B              ja 0x36de
00003673  0FB60538C41000    movzx eax,byte [dword 0x10c438]
0000367A  0FB6D0            movzx edx,al
0000367D  89D0              mov eax,edx
0000367F  01C0              add eax,eax
00003681  01D0              add eax,edx
00003683  C1E002            shl eax,byte 0x2
00003686  8D90C0C31000      lea edx,[eax+0x10c3c0]
0000368C  8B4508            mov eax,[ebp+0x8]
0000368F  8902              mov [edx],eax
00003691  0FB60538C41000    movzx eax,byte [dword 0x10c438]
00003698  0FB6D0            movzx edx,al
0000369B  89D0              mov eax,edx
0000369D  01C0              add eax,eax
0000369F  01D0              add eax,edx
000036A1  C1E002            shl eax,byte 0x2
000036A4  8D90C4C31000      lea edx,[eax+0x10c3c4]
000036AA  8B4508            mov eax,[ebp+0x8]
000036AD  8902              mov [edx],eax
000036AF  0FB60538C41000    movzx eax,byte [dword 0x10c438]
000036B6  0FB6D0            movzx edx,al
000036B9  89D0              mov eax,edx
000036BB  01C0              add eax,eax
000036BD  01D0              add eax,edx
000036BF  C1E002            shl eax,byte 0x2
000036C2  8D90C8C31000      lea edx,[eax+0x10c3c8]
000036C8  8B450C            mov eax,[ebp+0xc]
000036CB  8902              mov [edx],eax
000036CD  0FB60538C41000    movzx eax,byte [dword 0x10c438]
000036D4  83C001            add eax,byte +0x1
000036D7  A238C41000        mov [0x10c438],al
000036DC  EB01              jmp short 0x36df
000036DE  90                nop
000036DF  5D                pop ebp
000036E0  C3                ret
000036E1  55                push ebp
000036E2  89E5              mov ebp,esp
000036E4  83EC18            sub esp,byte +0x18
000036E7  C645F700          mov byte [ebp-0x9],0x0
000036EB  E9A8000000        jmp 0x3798
000036F0  0FB655F7          movzx edx,byte [ebp-0x9]
000036F4  89D0              mov eax,edx
000036F6  01C0              add eax,eax
000036F8  01D0              add eax,edx
000036FA  C1E002            shl eax,byte 0x2
000036FD  05C0C31000        add eax,0x10c3c0
00003702  8B00              mov eax,[eax]
00003704  394508            cmp [ebp+0x8],eax
00003707  732F              jnc 0x3738
00003709  0FB655F7          movzx edx,byte [ebp-0x9]
0000370D  89D0              mov eax,edx
0000370F  01C0              add eax,eax
00003711  01D0              add eax,edx
00003713  C1E002            shl eax,byte 0x2
00003716  05C0C31000        add eax,0x10c3c0
0000371B  8B00              mov eax,[eax]
0000371D  0FB64DF7          movzx ecx,byte [ebp-0x9]
00003721  2B4508            sub eax,[ebp+0x8]
00003724  89C2              mov edx,eax
00003726  89C8              mov eax,ecx
00003728  01C0              add eax,eax
0000372A  01C8              add eax,ecx
0000372C  C1E002            shl eax,byte 0x2
0000372F  05C0C31000        add eax,0x10c3c0
00003734  8910              mov [eax],edx
00003736  EB56              jmp short 0x378e
00003738  0FB655F7          movzx edx,byte [ebp-0x9]
0000373C  89D0              mov eax,edx
0000373E  01C0              add eax,eax
00003740  01D0              add eax,edx
00003742  C1E002            shl eax,byte 0x2
00003745  05C8C31000        add eax,0x10c3c8
0000374A  8B00              mov eax,[eax]
0000374C  85C0              test eax,eax
0000374E  7416              jz 0x3766
00003750  0FB655F7          movzx edx,byte [ebp-0x9]
00003754  89D0              mov eax,edx
00003756  01C0              add eax,eax
00003758  01D0              add eax,edx
0000375A  C1E002            shl eax,byte 0x2
0000375D  05C8C31000        add eax,0x10c3c8
00003762  8B00              mov eax,[eax]
00003764  FFD0              call eax
00003766  0FB655F7          movzx edx,byte [ebp-0x9]
0000376A  0FB64DF7          movzx ecx,byte [ebp-0x9]
0000376E  89D0              mov eax,edx
00003770  01C0              add eax,eax
00003772  01D0              add eax,edx
00003774  C1E002            shl eax,byte 0x2
00003777  05C4C31000        add eax,0x10c3c4
0000377C  8B10              mov edx,[eax]
0000377E  89C8              mov eax,ecx
00003780  01C0              add eax,eax
00003782  01C8              add eax,ecx
00003784  C1E002            shl eax,byte 0x2
00003787  05C0C31000        add eax,0x10c3c0
0000378C  8910              mov [eax],edx
0000378E  0FB645F7          movzx eax,byte [ebp-0x9]
00003792  83C001            add eax,byte +0x1
00003795  8845F7            mov [ebp-0x9],al
00003798  0FB60538C41000    movzx eax,byte [dword 0x10c438]
0000379F  3845F7            cmp [ebp-0x9],al
000037A2  0F8248FFFFFF      jc near 0x36f0
000037A8  90                nop
000037A9  90                nop
000037AA  C9                leave
000037AB  C3                ret
000037AC  55                push ebp
000037AD  89E5              mov ebp,esp
000037AF  83EC10            sub esp,byte +0x10
000037B2  8B4508            mov eax,[ebp+0x8]
000037B5  8945FC            mov [ebp-0x4],eax
000037B8  8B450C            mov eax,[ebp+0xc]
000037BB  8945F8            mov [ebp-0x8],eax
000037BE  8B45FC            mov eax,[ebp-0x4]
000037C1  3B45F8            cmp eax,[ebp-0x8]
000037C4  7328              jnc 0x37ee
000037C6  EB17              jmp short 0x37df
000037C8  8B55F8            mov edx,[ebp-0x8]
000037CB  8D4201            lea eax,[edx+0x1]
000037CE  8945F8            mov [ebp-0x8],eax
000037D1  8B45FC            mov eax,[ebp-0x4]
000037D4  8D4801            lea ecx,[eax+0x1]
000037D7  894DFC            mov [ebp-0x4],ecx
000037DA  0FB612            movzx edx,byte [edx]
000037DD  8810              mov [eax],dl
000037DF  8B4510            mov eax,[ebp+0x10]
000037E2  8D50FF            lea edx,[eax-0x1]
000037E5  895510            mov [ebp+0x10],edx
000037E8  85C0              test eax,eax
000037EA  75DC              jnz 0x37c8
000037EC  EB2E              jmp short 0x381c
000037EE  8B4510            mov eax,[ebp+0x10]
000037F1  0145FC            add [ebp-0x4],eax
000037F4  8B4510            mov eax,[ebp+0x10]
000037F7  0145F8            add [ebp-0x8],eax
000037FA  EB13              jmp short 0x380f
000037FC  836DF801          sub dword [ebp-0x8],byte +0x1
00003800  836DFC01          sub dword [ebp-0x4],byte +0x1
00003804  8B45F8            mov eax,[ebp-0x8]
00003807  0FB610            movzx edx,byte [eax]
0000380A  8B45FC            mov eax,[ebp-0x4]
0000380D  8810              mov [eax],dl
0000380F  8B4510            mov eax,[ebp+0x10]
00003812  8D50FF            lea edx,[eax-0x1]
00003815  895510            mov [ebp+0x10],edx
00003818  85C0              test eax,eax
0000381A  75E0              jnz 0x37fc
0000381C  90                nop
0000381D  C9                leave
0000381E  C3                ret
0000381F  55                push ebp
00003820  89E5              mov ebp,esp
00003822  83EC10            sub esp,byte +0x10
00003825  8B4508            mov eax,[ebp+0x8]
00003828  8945FC            mov [ebp-0x4],eax
0000382B  8B450C            mov eax,[ebp+0xc]
0000382E  8845FB            mov [ebp-0x5],al
00003831  EB0F              jmp short 0x3842
00003833  8B45FC            mov eax,[ebp-0x4]
00003836  8D5001            lea edx,[eax+0x1]
00003839  8955FC            mov [ebp-0x4],edx
0000383C  0FB655FB          movzx edx,byte [ebp-0x5]
00003840  8810              mov [eax],dl
00003842  8B4510            mov eax,[ebp+0x10]
00003845  8D50FF            lea edx,[eax-0x1]
00003848  895510            mov [ebp+0x10],edx
0000384B  85C0              test eax,eax
0000384D  75E4              jnz 0x3833
0000384F  90                nop
00003850  90                nop
00003851  C9                leave
00003852  C3                ret
00003853  55                push ebp
00003854  89E5              mov ebp,esp
00003856  83EC10            sub esp,byte +0x10
00003859  8B4508            mov eax,[ebp+0x8]
0000385C  8945F8            mov [ebp-0x8],eax
0000385F  8B450C            mov eax,[ebp+0xc]
00003862  8945F4            mov [ebp-0xc],eax
00003865  C745FC00000000    mov dword [ebp-0x4],0x0
0000386C  EB3E              jmp short 0x38ac
0000386E  8B55F8            mov edx,[ebp-0x8]
00003871  8B45FC            mov eax,[ebp-0x4]
00003874  01D0              add eax,edx
00003876  0FB610            movzx edx,byte [eax]
00003879  8B4DF4            mov ecx,[ebp-0xc]
0000387C  8B45FC            mov eax,[ebp-0x4]
0000387F  01C8              add eax,ecx
00003881  0FB600            movzx eax,byte [eax]
00003884  38C2              cmp dl,al
00003886  7420              jz 0x38a8
00003888  8B55F8            mov edx,[ebp-0x8]
0000388B  8B45FC            mov eax,[ebp-0x4]
0000388E  01D0              add eax,edx
00003890  0FB600            movzx eax,byte [eax]
00003893  0FB6C0            movzx eax,al
00003896  8B4DF4            mov ecx,[ebp-0xc]
00003899  8B55FC            mov edx,[ebp-0x4]
0000389C  01CA              add edx,ecx
0000389E  0FB612            movzx edx,byte [edx]
000038A1  0FB6D2            movzx edx,dl
000038A4  29D0              sub eax,edx
000038A6  EB11              jmp short 0x38b9
000038A8  8345FC01          add dword [ebp-0x4],byte +0x1
000038AC  8B45FC            mov eax,[ebp-0x4]
000038AF  3B4510            cmp eax,[ebp+0x10]
000038B2  72BA              jc 0x386e
000038B4  B800000000        mov eax,0x0
000038B9  C9                leave
000038BA  C3                ret
000038BB  55                push ebp
000038BC  89E5              mov ebp,esp
000038BE  C70540C4200040C4  mov dword [dword 0x20c440],0x10c440
         -1000
000038C8  A140C42000        mov eax,[0x20c440]
000038CD  C700F8FF0F00      mov dword [eax],0xffff8
000038D3  A140C42000        mov eax,[0x20c440]
000038D8  C7400400000000    mov dword [eax+0x4],0x0
000038DF  90                nop
000038E0  5D                pop ebp
000038E1  C3                ret
000038E2  55                push ebp
000038E3  89E5              mov ebp,esp
000038E5  83EC10            sub esp,byte +0x10
000038E8  8B4508            mov eax,[ebp+0x8]
000038EB  83C001            add eax,byte +0x1
000038EE  83E0FE            and eax,byte -0x2
000038F1  894508            mov [ebp+0x8],eax
000038F4  C745FC00000000    mov dword [ebp-0x4],0x0
000038FB  A140C42000        mov eax,[0x20c440]
00003900  8945F8            mov [ebp-0x8],eax
00003903  E98A000000        jmp 0x3992
00003908  8B45F8            mov eax,[ebp-0x8]
0000390B  8B00              mov eax,[eax]
0000390D  394508            cmp [ebp+0x8],eax
00003910  7771              ja 0x3983
00003912  8B45F8            mov eax,[ebp-0x8]
00003915  8B00              mov eax,[eax]
00003917  8B5508            mov edx,[ebp+0x8]
0000391A  83C20A            add edx,byte +0xa
0000391D  39D0              cmp eax,edx
0000391F  723B              jc 0x395c
00003921  8B4508            mov eax,[ebp+0x8]
00003924  8D5008            lea edx,[eax+0x8]
00003927  8B45F8            mov eax,[ebp-0x8]
0000392A  01D0              add eax,edx
0000392C  8945F4            mov [ebp-0xc],eax
0000392F  8B45F8            mov eax,[ebp-0x8]
00003932  8B00              mov eax,[eax]
00003934  2B4508            sub eax,[ebp+0x8]
00003937  8D50F8            lea edx,[eax-0x8]
0000393A  8B45F4            mov eax,[ebp-0xc]
0000393D  8910              mov [eax],edx
0000393F  8B45F8            mov eax,[ebp-0x8]
00003942  8B5004            mov edx,[eax+0x4]
00003945  8B45F4            mov eax,[ebp-0xc]
00003948  895004            mov [eax+0x4],edx
0000394B  8B45F8            mov eax,[ebp-0x8]
0000394E  8B5508            mov edx,[ebp+0x8]
00003951  8910              mov [eax],edx
00003953  8B45F8            mov eax,[ebp-0x8]
00003956  8B55F4            mov edx,[ebp-0xc]
00003959  895004            mov [eax+0x4],edx
0000395C  837DFC00          cmp dword [ebp-0x4],byte +0x0
00003960  740E              jz 0x3970
00003962  8B45F8            mov eax,[ebp-0x8]
00003965  8B5004            mov edx,[eax+0x4]
00003968  8B45FC            mov eax,[ebp-0x4]
0000396B  895004            mov [eax+0x4],edx
0000396E  EB0B              jmp short 0x397b
00003970  8B45F8            mov eax,[ebp-0x8]
00003973  8B4004            mov eax,[eax+0x4]
00003976  A340C42000        mov [0x20c440],eax
0000397B  8B45F8            mov eax,[ebp-0x8]
0000397E  83C008            add eax,byte +0x8
00003981  EB1E              jmp short 0x39a1
00003983  8B45F8            mov eax,[ebp-0x8]
00003986  8945FC            mov [ebp-0x4],eax
00003989  8B45F8            mov eax,[ebp-0x8]
0000398C  8B4004            mov eax,[eax+0x4]
0000398F  8945F8            mov [ebp-0x8],eax
00003992  837DF800          cmp dword [ebp-0x8],byte +0x0
00003996  0F856CFFFFFF      jnz near 0x3908
0000399C  B800000000        mov eax,0x0
000039A1  C9                leave
000039A2  C3                ret
000039A3  55                push ebp
000039A4  89E5              mov ebp,esp
000039A6  83EC10            sub esp,byte +0x10
000039A9  837D0800          cmp dword [ebp+0x8],byte +0x0
000039AD  741F              jz 0x39ce
000039AF  8B4508            mov eax,[ebp+0x8]
000039B2  83E808            sub eax,byte +0x8
000039B5  8945FC            mov [ebp-0x4],eax
000039B8  8B1540C42000      mov edx,[dword 0x20c440]
000039BE  8B45FC            mov eax,[ebp-0x4]
000039C1  895004            mov [eax+0x4],edx
000039C4  8B45FC            mov eax,[ebp-0x4]
000039C7  A340C42000        mov [0x20c440],eax
000039CC  EB01              jmp short 0x39cf
000039CE  90                nop
000039CF  C9                leave
000039D0  C3                ret
000039D1  55                push ebp
000039D2  89E5              mov ebp,esp
000039D4  83EC10            sub esp,byte +0x10
000039D7  837D0800          cmp dword [ebp+0x8],byte +0x0
000039DB  7510              jnz 0x39ed
000039DD  FF750C            push dword [ebp+0xc]
000039E0  E8FDFEFFFF        call 0x38e2
000039E5  83C404            add esp,byte +0x4
000039E8  E9B3000000        jmp 0x3aa0
000039ED  837D0C00          cmp dword [ebp+0xc],byte +0x0
000039F1  7515              jnz 0x3a08
000039F3  FF7508            push dword [ebp+0x8]
000039F6  E8A8FFFFFF        call 0x39a3
000039FB  83C404            add esp,byte +0x4
000039FE  B800000000        mov eax,0x0
00003A03  E998000000        jmp 0x3aa0
00003A08  8B4508            mov eax,[ebp+0x8]
00003A0B  83E808            sub eax,byte +0x8
00003A0E  8945FC            mov [ebp-0x4],eax
00003A11  8B45FC            mov eax,[ebp-0x4]
00003A14  8B00              mov eax,[eax]
00003A16  39450C            cmp [ebp+0xc],eax
00003A19  774F              ja 0x3a6a
00003A1B  8B45FC            mov eax,[ebp-0x4]
00003A1E  8B00              mov eax,[eax]
00003A20  8B550C            mov edx,[ebp+0xc]
00003A23  83C20A            add edx,byte +0xa
00003A26  39D0              cmp eax,edx
00003A28  723B              jc 0x3a65
00003A2A  8B450C            mov eax,[ebp+0xc]
00003A2D  8D5008            lea edx,[eax+0x8]
00003A30  8B45FC            mov eax,[ebp-0x4]
00003A33  01D0              add eax,edx
00003A35  8945F4            mov [ebp-0xc],eax
00003A38  8B45FC            mov eax,[ebp-0x4]
00003A3B  8B00              mov eax,[eax]
00003A3D  2B450C            sub eax,[ebp+0xc]
00003A40  8D50F8            lea edx,[eax-0x8]
00003A43  8B45F4            mov eax,[ebp-0xc]
00003A46  8910              mov [eax],edx
00003A48  8B45FC            mov eax,[ebp-0x4]
00003A4B  8B5004            mov edx,[eax+0x4]
00003A4E  8B45F4            mov eax,[ebp-0xc]
00003A51  895004            mov [eax+0x4],edx
00003A54  8B45FC            mov eax,[ebp-0x4]
00003A57  8B550C            mov edx,[ebp+0xc]
00003A5A  8910              mov [eax],edx
00003A5C  8B45FC            mov eax,[ebp-0x4]
00003A5F  8B55F4            mov edx,[ebp-0xc]
00003A62  895004            mov [eax+0x4],edx
00003A65  8B4508            mov eax,[ebp+0x8]
00003A68  EB36              jmp short 0x3aa0
00003A6A  FF750C            push dword [ebp+0xc]
00003A6D  E870FEFFFF        call 0x38e2
00003A72  83C404            add esp,byte +0x4
00003A75  8945F8            mov [ebp-0x8],eax
00003A78  837DF800          cmp dword [ebp-0x8],byte +0x0
00003A7C  741F              jz 0x3a9d
00003A7E  8B45FC            mov eax,[ebp-0x4]
00003A81  8B00              mov eax,[eax]
00003A83  50                push eax
00003A84  FF7508            push dword [ebp+0x8]
00003A87  FF75F8            push dword [ebp-0x8]
00003A8A  E81DFDFFFF        call 0x37ac
00003A8F  83C40C            add esp,byte +0xc
00003A92  FF7508            push dword [ebp+0x8]
00003A95  E809FFFFFF        call 0x39a3
00003A9A  83C404            add esp,byte +0x4
00003A9D  8B45F8            mov eax,[ebp-0x8]
00003AA0  C9                leave
00003AA1  C3                ret
00003AA2  55                push ebp
00003AA3  89E5              mov ebp,esp
00003AA5  83EC18            sub esp,byte +0x18
00003AA8  A140C42000        mov eax,[0x20c440]
00003AAD  8945F4            mov [ebp-0xc],eax
00003AB0  83EC08            sub esp,byte +0x8
00003AB3  6A00              push byte +0x0
00003AB5  68AA671000        push dword 0x1067aa
00003ABA  E8ABF1FFFF        call 0x2c6a
00003ABF  83C410            add esp,byte +0x10
00003AC2  83EC08            sub esp,byte +0x8
00003AC5  FF75F4            push dword [ebp-0xc]
00003AC8  68BA671000        push dword 0x1067ba
00003ACD  E898F1FFFF        call 0x2c6a
00003AD2  83C410            add esp,byte +0x10
00003AD5  8B45F4            mov eax,[ebp-0xc]
00003AD8  8B00              mov eax,[eax]
00003ADA  83EC08            sub esp,byte +0x8
00003ADD  50                push eax
00003ADE  68C8671000        push dword 0x1067c8
00003AE3  E882F1FFFF        call 0x2c6a
00003AE8  83C410            add esp,byte +0x10
00003AEB  EB32              jmp short 0x3b1f
00003AED  83EC08            sub esp,byte +0x8
00003AF0  FF75F4            push dword [ebp-0xc]
00003AF3  68BA671000        push dword 0x1067ba
00003AF8  E86DF1FFFF        call 0x2c6a
00003AFD  83C410            add esp,byte +0x10
00003B00  8B45F4            mov eax,[ebp-0xc]
00003B03  8B00              mov eax,[eax]
00003B05  83EC08            sub esp,byte +0x8
00003B08  50                push eax
00003B09  68C8671000        push dword 0x1067c8
00003B0E  E857F1FFFF        call 0x2c6a
00003B13  83C410            add esp,byte +0x10
00003B16  8B45F4            mov eax,[ebp-0xc]
00003B19  8B4004            mov eax,[eax+0x4]
00003B1C  8945F4            mov [ebp-0xc],eax
00003B1F  837DF400          cmp dword [ebp-0xc],byte +0x0
00003B23  75C8              jnz 0x3aed
00003B25  90                nop
00003B26  90                nop
00003B27  C9                leave
00003B28  C3                ret
00003B29  55                push ebp
00003B2A  89E5              mov ebp,esp
00003B2C  83EC04            sub esp,byte +0x4
00003B2F  8B4508            mov eax,[ebp+0x8]
00003B32  8845FC            mov [ebp-0x4],al
00003B35  807DFC40          cmp byte [ebp-0x4],0x40
00003B39  7E0F              jng 0x3b4a
00003B3B  807DFC5A          cmp byte [ebp-0x4],0x5a
00003B3F  7F09              jg 0x3b4a
00003B41  0FB645FC          movzx eax,byte [ebp-0x4]
00003B45  83C020            add eax,byte +0x20
00003B48  EB04              jmp short 0x3b4e
00003B4A  0FB645FC          movzx eax,byte [ebp-0x4]
00003B4E  C9                leave
00003B4F  C3                ret
00003B50  55                push ebp
00003B51  89E5              mov ebp,esp
00003B53  83EC04            sub esp,byte +0x4
00003B56  8B4508            mov eax,[ebp+0x8]
00003B59  8845FC            mov [ebp-0x4],al
00003B5C  807DFC40          cmp byte [ebp-0x4],0x40
00003B60  7E06              jng 0x3b68
00003B62  807DFC5A          cmp byte [ebp-0x4],0x5a
00003B66  7E18              jng 0x3b80
00003B68  807DFC60          cmp byte [ebp-0x4],0x60
00003B6C  7E06              jng 0x3b74
00003B6E  807DFC7A          cmp byte [ebp-0x4],0x7a
00003B72  7E0C              jng 0x3b80
00003B74  807DFC2F          cmp byte [ebp-0x4],0x2f
00003B78  7E0D              jng 0x3b87
00003B7A  807DFC39          cmp byte [ebp-0x4],0x39
00003B7E  7F07              jg 0x3b87
00003B80  B801000000        mov eax,0x1
00003B85  EB05              jmp short 0x3b8c
00003B87  B800000000        mov eax,0x0
00003B8C  83E001            and eax,byte +0x1
00003B8F  C9                leave
00003B90  C3                ret
00003B91  55                push ebp
00003B92  89E5              mov ebp,esp
00003B94  83EC04            sub esp,byte +0x4
00003B97  8B4508            mov eax,[ebp+0x8]
00003B9A  8845FC            mov [ebp-0x4],al
00003B9D  807DFC2F          cmp byte [ebp-0x4],0x2f
00003BA1  7E0D              jng 0x3bb0
00003BA3  807DFC39          cmp byte [ebp-0x4],0x39
00003BA7  7F07              jg 0x3bb0
00003BA9  B801000000        mov eax,0x1
00003BAE  EB05              jmp short 0x3bb5
00003BB0  B800000000        mov eax,0x0
00003BB5  83E001            and eax,byte +0x1
00003BB8  C9                leave
00003BB9  C3                ret
00003BBA  55                push ebp
00003BBB  89E5              mov ebp,esp
00003BBD  83EC10            sub esp,byte +0x10
00003BC0  8B4508            mov eax,[ebp+0x8]
00003BC3  8945FC            mov [ebp-0x4],eax
00003BC6  EB04              jmp short 0x3bcc
00003BC8  8345FC01          add dword [ebp-0x4],byte +0x1
00003BCC  8B45FC            mov eax,[ebp-0x4]
00003BCF  0FB600            movzx eax,byte [eax]
00003BD2  84C0              test al,al
00003BD4  75F2              jnz 0x3bc8
00003BD6  8B45FC            mov eax,[ebp-0x4]
00003BD9  2B4508            sub eax,[ebp+0x8]
00003BDC  C9                leave
00003BDD  C3                ret
00003BDE  55                push ebp
00003BDF  89E5              mov ebp,esp
00003BE1  EB08              jmp short 0x3beb
00003BE3  83450801          add dword [ebp+0x8],byte +0x1
00003BE7  83450C01          add dword [ebp+0xc],byte +0x1
00003BEB  8B4508            mov eax,[ebp+0x8]
00003BEE  0FB600            movzx eax,byte [eax]
00003BF1  84C0              test al,al
00003BF3  7410              jz 0x3c05
00003BF5  8B4508            mov eax,[ebp+0x8]
00003BF8  0FB610            movzx edx,byte [eax]
00003BFB  8B450C            mov eax,[ebp+0xc]
00003BFE  0FB600            movzx eax,byte [eax]
00003C01  38C2              cmp dl,al
00003C03  74DE              jz 0x3be3
00003C05  8B4508            mov eax,[ebp+0x8]
00003C08  0FB600            movzx eax,byte [eax]
00003C0B  0FB6D0            movzx edx,al
00003C0E  8B450C            mov eax,[ebp+0xc]
00003C11  0FB600            movzx eax,byte [eax]
00003C14  0FB6C8            movzx ecx,al
00003C17  89D0              mov eax,edx
00003C19  29C8              sub eax,ecx
00003C1B  5D                pop ebp
00003C1C  C3                ret
00003C1D  55                push ebp
00003C1E  89E5              mov ebp,esp
00003C20  83EC10            sub esp,byte +0x10
00003C23  C745FC00000000    mov dword [ebp-0x4],0x0
00003C2A  C745F801000000    mov dword [ebp-0x8],0x1
00003C31  C745F400000000    mov dword [ebp-0xc],0x0
00003C38  EB04              jmp short 0x3c3e
00003C3A  8345F401          add dword [ebp-0xc],byte +0x1
00003C3E  8B55F4            mov edx,[ebp-0xc]
00003C41  8B4508            mov eax,[ebp+0x8]
00003C44  01D0              add eax,edx
00003C46  0FB600            movzx eax,byte [eax]
00003C49  3C20              cmp al,0x20
00003C4B  74ED              jz 0x3c3a
00003C4D  8B55F4            mov edx,[ebp-0xc]
00003C50  8B4508            mov eax,[ebp+0x8]
00003C53  01D0              add eax,edx
00003C55  0FB600            movzx eax,byte [eax]
00003C58  3C2B              cmp al,0x2b
00003C5A  740F              jz 0x3c6b
00003C5C  8B55F4            mov edx,[ebp-0xc]
00003C5F  8B4508            mov eax,[ebp+0x8]
00003C62  01D0              add eax,edx
00003C64  0FB600            movzx eax,byte [eax]
00003C67  3C2D              cmp al,0x2d
00003C69  7550              jnz 0x3cbb
00003C6B  8B45F4            mov eax,[ebp-0xc]
00003C6E  8D5001            lea edx,[eax+0x1]
00003C71  8955F4            mov [ebp-0xc],edx
00003C74  89C2              mov edx,eax
00003C76  8B4508            mov eax,[ebp+0x8]
00003C79  01D0              add eax,edx
00003C7B  0FB600            movzx eax,byte [eax]
00003C7E  3C2D              cmp al,0x2d
00003C80  7507              jnz 0x3c89
00003C82  B8FFFFFFFF        mov eax,0xffffffff
00003C87  EB05              jmp short 0x3c8e
00003C89  B801000000        mov eax,0x1
00003C8E  8945F8            mov [ebp-0x8],eax
00003C91  EB28              jmp short 0x3cbb
00003C93  8B55FC            mov edx,[ebp-0x4]
00003C96  89D0              mov eax,edx
00003C98  C1E002            shl eax,byte 0x2
00003C9B  01D0              add eax,edx
00003C9D  01C0              add eax,eax
00003C9F  89C1              mov ecx,eax
00003CA1  8B55F4            mov edx,[ebp-0xc]
00003CA4  8B4508            mov eax,[ebp+0x8]
00003CA7  01D0              add eax,edx
00003CA9  0FB600            movzx eax,byte [eax]
00003CAC  0FBEC0            movsx eax,al
00003CAF  83E830            sub eax,byte +0x30
00003CB2  01C8              add eax,ecx
00003CB4  8945FC            mov [ebp-0x4],eax
00003CB7  8345F401          add dword [ebp-0xc],byte +0x1
00003CBB  8B55F4            mov edx,[ebp-0xc]
00003CBE  8B4508            mov eax,[ebp+0x8]
00003CC1  01D0              add eax,edx
00003CC3  0FB600            movzx eax,byte [eax]
00003CC6  3C2F              cmp al,0x2f
00003CC8  7E0F              jng 0x3cd9
00003CCA  8B55F4            mov edx,[ebp-0xc]
00003CCD  8B4508            mov eax,[ebp+0x8]
00003CD0  01D0              add eax,edx
00003CD2  0FB600            movzx eax,byte [eax]
00003CD5  3C39              cmp al,0x39
00003CD7  7EBA              jng 0x3c93
00003CD9  8B45F8            mov eax,[ebp-0x8]
00003CDC  0FAF45FC          imul eax,[ebp-0x4]
00003CE0  C9                leave
00003CE1  C3                ret
00003CE2  55                push ebp
00003CE3  89E5              mov ebp,esp
00003CE5  83EC10            sub esp,byte +0x10
00003CE8  C745FC00000000    mov dword [ebp-0x4],0x0
00003CEF  C645FB00          mov byte [ebp-0x5],0x0
00003CF3  EB04              jmp short 0x3cf9
00003CF5  83450801          add dword [ebp+0x8],byte +0x1
00003CF9  8B4508            mov eax,[ebp+0x8]
00003CFC  0FB600            movzx eax,byte [eax]
00003CFF  3C20              cmp al,0x20
00003D01  74F2              jz 0x3cf5
00003D03  8B4508            mov eax,[ebp+0x8]
00003D06  0FB600            movzx eax,byte [eax]
00003D09  3C2D              cmp al,0x2d
00003D0B  750A              jnz 0x3d17
00003D0D  C645FB01          mov byte [ebp-0x5],0x1
00003D11  83450801          add dword [ebp+0x8],byte +0x1
00003D15  EB0E              jmp short 0x3d25
00003D17  8B4508            mov eax,[ebp+0x8]
00003D1A  0FB600            movzx eax,byte [eax]
00003D1D  3C2B              cmp al,0x2b
00003D1F  7504              jnz 0x3d25
00003D21  83450801          add dword [ebp+0x8],byte +0x1
00003D25  837D1000          cmp dword [ebp+0x10],byte +0x0
00003D29  7536              jnz 0x3d61
00003D2B  8B4508            mov eax,[ebp+0x8]
00003D2E  0FB600            movzx eax,byte [eax]
00003D31  3C30              cmp al,0x30
00003D33  752C              jnz 0x3d61
00003D35  83450801          add dword [ebp+0x8],byte +0x1
00003D39  8B4508            mov eax,[ebp+0x8]
00003D3C  0FB600            movzx eax,byte [eax]
00003D3F  3C78              cmp al,0x78
00003D41  740A              jz 0x3d4d
00003D43  8B4508            mov eax,[ebp+0x8]
00003D46  0FB600            movzx eax,byte [eax]
00003D49  3C58              cmp al,0x58
00003D4B  750D              jnz 0x3d5a
00003D4D  C7451010000000    mov dword [ebp+0x10],0x10
00003D54  83450801          add dword [ebp+0x8],byte +0x1
00003D58  EB07              jmp short 0x3d61
00003D5A  C7451008000000    mov dword [ebp+0x10],0x8
00003D61  837D1000          cmp dword [ebp+0x10],byte +0x0
00003D65  7515              jnz 0x3d7c
00003D67  8B4508            mov eax,[ebp+0x8]
00003D6A  0FB600            movzx eax,byte [eax]
00003D6D  3C30              cmp al,0x30
00003D6F  750B              jnz 0x3d7c
00003D71  C7451008000000    mov dword [ebp+0x10],0x8
00003D78  83450801          add dword [ebp+0x8],byte +0x1
00003D7C  837D1000          cmp dword [ebp+0x10],byte +0x0
00003D80  0F8596000000      jnz near 0x3e1c
00003D86  C745100A000000    mov dword [ebp+0x10],0xa
00003D8D  E98A000000        jmp 0x3e1c
00003D92  8B4508            mov eax,[ebp+0x8]
00003D95  0FB600            movzx eax,byte [eax]
00003D98  3C2F              cmp al,0x2f
00003D9A  7E1B              jng 0x3db7
00003D9C  8B4508            mov eax,[ebp+0x8]
00003D9F  0FB600            movzx eax,byte [eax]
00003DA2  3C39              cmp al,0x39
00003DA4  7F11              jg 0x3db7
00003DA6  8B4508            mov eax,[ebp+0x8]
00003DA9  0FB600            movzx eax,byte [eax]
00003DAC  0FBEC0            movsx eax,al
00003DAF  83E830            sub eax,byte +0x30
00003DB2  8945F4            mov [ebp-0xc],eax
00003DB5  EB48              jmp short 0x3dff
00003DB7  8B4508            mov eax,[ebp+0x8]
00003DBA  0FB600            movzx eax,byte [eax]
00003DBD  3C40              cmp al,0x40
00003DBF  7E1B              jng 0x3ddc
00003DC1  8B4508            mov eax,[ebp+0x8]
00003DC4  0FB600            movzx eax,byte [eax]
00003DC7  3C5A              cmp al,0x5a
00003DC9  7F11              jg 0x3ddc
00003DCB  8B4508            mov eax,[ebp+0x8]
00003DCE  0FB600            movzx eax,byte [eax]
00003DD1  0FBEC0            movsx eax,al
00003DD4  83E837            sub eax,byte +0x37
00003DD7  8945F4            mov [ebp-0xc],eax
00003DDA  EB23              jmp short 0x3dff
00003DDC  8B4508            mov eax,[ebp+0x8]
00003DDF  0FB600            movzx eax,byte [eax]
00003DE2  3C60              cmp al,0x60
00003DE4  7E47              jng 0x3e2d
00003DE6  8B4508            mov eax,[ebp+0x8]
00003DE9  0FB600            movzx eax,byte [eax]
00003DEC  3C7A              cmp al,0x7a
00003DEE  7F3D              jg 0x3e2d
00003DF0  8B4508            mov eax,[ebp+0x8]
00003DF3  0FB600            movzx eax,byte [eax]
00003DF6  0FBEC0            movsx eax,al
00003DF9  83E857            sub eax,byte +0x57
00003DFC  8945F4            mov [ebp-0xc],eax
00003DFF  8B45F4            mov eax,[ebp-0xc]
00003E02  3B4510            cmp eax,[ebp+0x10]
00003E05  7D25              jnl 0x3e2c
00003E07  8B4510            mov eax,[ebp+0x10]
00003E0A  0FAF45FC          imul eax,[ebp-0x4]
00003E0E  89C2              mov edx,eax
00003E10  8B45F4            mov eax,[ebp-0xc]
00003E13  01D0              add eax,edx
00003E15  8945FC            mov [ebp-0x4],eax
00003E18  83450801          add dword [ebp+0x8],byte +0x1
00003E1C  8B4508            mov eax,[ebp+0x8]
00003E1F  0FB600            movzx eax,byte [eax]
00003E22  84C0              test al,al
00003E24  0F8568FFFFFF      jnz near 0x3d92
00003E2A  EB01              jmp short 0x3e2d
00003E2C  90                nop
00003E2D  837D0C00          cmp dword [ebp+0xc],byte +0x0
00003E31  7408              jz 0x3e3b
00003E33  8B450C            mov eax,[ebp+0xc]
00003E36  8B5508            mov edx,[ebp+0x8]
00003E39  8910              mov [eax],edx
00003E3B  807DFB00          cmp byte [ebp-0x5],0x0
00003E3F  7403              jz 0x3e44
00003E41  F75DFC            neg dword [ebp-0x4]
00003E44  8B45FC            mov eax,[ebp-0x4]
00003E47  C9                leave
00003E48  C3                ret
00003E49  55                push ebp
00003E4A  89E5              mov ebp,esp
00003E4C  83EC10            sub esp,byte +0x10
00003E4F  8B450C            mov eax,[ebp+0xc]
00003E52  0FB600            movzx eax,byte [eax]
00003E55  84C0              test al,al
00003E57  7548              jnz 0x3ea1
00003E59  8B4508            mov eax,[ebp+0x8]
00003E5C  EB52              jmp short 0x3eb0
00003E5E  8B4508            mov eax,[ebp+0x8]
00003E61  8945FC            mov [ebp-0x4],eax
00003E64  8B450C            mov eax,[ebp+0xc]
00003E67  8945F8            mov [ebp-0x8],eax
00003E6A  EB08              jmp short 0x3e74
00003E6C  8345FC01          add dword [ebp-0x4],byte +0x1
00003E70  8345F801          add dword [ebp-0x8],byte +0x1
00003E74  8B45FC            mov eax,[ebp-0x4]
00003E77  0FB610            movzx edx,byte [eax]
00003E7A  8B45F8            mov eax,[ebp-0x8]
00003E7D  0FB600            movzx eax,byte [eax]
00003E80  38C2              cmp dl,al
00003E82  750A              jnz 0x3e8e
00003E84  8B45F8            mov eax,[ebp-0x8]
00003E87  0FB600            movzx eax,byte [eax]
00003E8A  84C0              test al,al
00003E8C  75DE              jnz 0x3e6c
00003E8E  8B45F8            mov eax,[ebp-0x8]
00003E91  0FB600            movzx eax,byte [eax]
00003E94  84C0              test al,al
00003E96  7505              jnz 0x3e9d
00003E98  8B4508            mov eax,[ebp+0x8]
00003E9B  EB13              jmp short 0x3eb0
00003E9D  83450801          add dword [ebp+0x8],byte +0x1
00003EA1  8B4508            mov eax,[ebp+0x8]
00003EA4  0FB600            movzx eax,byte [eax]
00003EA7  84C0              test al,al
00003EA9  75B3              jnz 0x3e5e
00003EAB  B800000000        mov eax,0x0
00003EB0  C9                leave
00003EB1  C3                ret
00003EB2  55                push ebp
00003EB3  89E5              mov ebp,esp
00003EB5  EB17              jmp short 0x3ece
00003EB7  8B4508            mov eax,[ebp+0x8]
00003EBA  0FB600            movzx eax,byte [eax]
00003EBD  0FBEC0            movsx eax,al
00003EC0  39450C            cmp [ebp+0xc],eax
00003EC3  7505              jnz 0x3eca
00003EC5  8B4508            mov eax,[ebp+0x8]
00003EC8  EB13              jmp short 0x3edd
00003ECA  83450801          add dword [ebp+0x8],byte +0x1
00003ECE  8B4508            mov eax,[ebp+0x8]
00003ED1  0FB600            movzx eax,byte [eax]
00003ED4  84C0              test al,al
00003ED6  75DF              jnz 0x3eb7
00003ED8  B800000000        mov eax,0x0
00003EDD  5D                pop ebp
00003EDE  C3                ret
00003EDF  55                push ebp
00003EE0  89E5              mov ebp,esp
00003EE2  83EC10            sub esp,byte +0x10
00003EE5  837D0800          cmp dword [ebp+0x8],byte +0x0
00003EE9  7408              jz 0x3ef3
00003EEB  8B4508            mov eax,[ebp+0x8]
00003EEE  A344C42000        mov [0x20c444],eax
00003EF3  A144C42000        mov eax,[0x20c444]
00003EF8  85C0              test eax,eax
00003EFA  740C              jz 0x3f08
00003EFC  A144C42000        mov eax,[0x20c444]
00003F01  0FB600            movzx eax,byte [eax]
00003F04  84C0              test al,al
00003F06  7507              jnz 0x3f0f
00003F08  B800000000        mov eax,0x0
00003F0D  EB5B              jmp short 0x3f6a
00003F0F  A144C42000        mov eax,[0x20c444]
00003F14  8945FC            mov [ebp-0x4],eax
00003F17  EB42              jmp short 0x3f5b
00003F19  A144C42000        mov eax,[0x20c444]
00003F1E  0FB600            movzx eax,byte [eax]
00003F21  0FBEC0            movsx eax,al
00003F24  50                push eax
00003F25  FF750C            push dword [ebp+0xc]
00003F28  E885FFFFFF        call 0x3eb2
00003F2D  83C408            add esp,byte +0x8
00003F30  85C0              test eax,eax
00003F32  741A              jz 0x3f4e
00003F34  A144C42000        mov eax,[0x20c444]
00003F39  C60000            mov byte [eax],0x0
00003F3C  A144C42000        mov eax,[0x20c444]
00003F41  83C001            add eax,byte +0x1
00003F44  A344C42000        mov [0x20c444],eax
00003F49  8B45FC            mov eax,[ebp-0x4]
00003F4C  EB1C              jmp short 0x3f6a
00003F4E  A144C42000        mov eax,[0x20c444]
00003F53  83C001            add eax,byte +0x1
00003F56  A344C42000        mov [0x20c444],eax
00003F5B  A144C42000        mov eax,[0x20c444]
00003F60  0FB600            movzx eax,byte [eax]
00003F63  84C0              test al,al
00003F65  75B2              jnz 0x3f19
00003F67  8B45FC            mov eax,[ebp-0x4]
00003F6A  C9                leave
00003F6B  C3                ret
00003F6C  55                push ebp
00003F6D  89E5              mov ebp,esp
00003F6F  83EC18            sub esp,byte +0x18
00003F72  FF7510            push dword [ebp+0x10]
00003F75  E840FCFFFF        call 0x3bba
00003F7A  83C404            add esp,byte +0x4
00003F7D  8945F0            mov [ebp-0x10],eax
00003F80  C745F400000000    mov dword [ebp-0xc],0x0
00003F87  EB2C              jmp short 0x3fb5
00003F89  8B5508            mov edx,[ebp+0x8]
00003F8C  8B45F4            mov eax,[ebp-0xc]
00003F8F  01D0              add eax,edx
00003F91  83EC04            sub esp,byte +0x4
00003F94  FF75F0            push dword [ebp-0x10]
00003F97  FF7510            push dword [ebp+0x10]
00003F9A  50                push eax
00003F9B  E8B3F8FFFF        call 0x3853
00003FA0  83C410            add esp,byte +0x10
00003FA3  85C0              test eax,eax
00003FA5  750A              jnz 0x3fb1
00003FA7  8B5508            mov edx,[ebp+0x8]
00003FAA  8B45F4            mov eax,[ebp-0xc]
00003FAD  01D0              add eax,edx
00003FAF  EB17              jmp short 0x3fc8
00003FB1  8345F401          add dword [ebp-0xc],byte +0x1
00003FB5  8B450C            mov eax,[ebp+0xc]
00003FB8  2B45F0            sub eax,[ebp-0x10]
00003FBB  83C001            add eax,byte +0x1
00003FBE  3945F4            cmp [ebp-0xc],eax
00003FC1  72C6              jc 0x3f89
00003FC3  B800000000        mov eax,0x0
00003FC8  C9                leave
00003FC9  C3                ret
00003FCA  55                push ebp
00003FCB  89E5              mov ebp,esp
00003FCD  83EC18            sub esp,byte +0x18
00003FD0  FF7508            push dword [ebp+0x8]
00003FD3  E8E2FBFFFF        call 0x3bba
00003FD8  83C404            add esp,byte +0x4
00003FDB  83C001            add eax,byte +0x1
00003FDE  8945F4            mov [ebp-0xc],eax
00003FE1  83EC0C            sub esp,byte +0xc
00003FE4  FF75F4            push dword [ebp-0xc]
00003FE7  E8F6F8FFFF        call 0x38e2
00003FEC  83C410            add esp,byte +0x10
00003FEF  8945F0            mov [ebp-0x10],eax
00003FF2  837DF000          cmp dword [ebp-0x10],byte +0x0
00003FF6  7411              jz 0x4009
00003FF8  83EC08            sub esp,byte +0x8
00003FFB  FF7508            push dword [ebp+0x8]
00003FFE  FF75F0            push dword [ebp-0x10]
00004001  E808000000        call 0x400e
00004006  83C410            add esp,byte +0x10
00004009  8B45F0            mov eax,[ebp-0x10]
0000400C  C9                leave
0000400D  C3                ret
0000400E  55                push ebp
0000400F  89E5              mov ebp,esp
00004011  83EC10            sub esp,byte +0x10
00004014  8B4508            mov eax,[ebp+0x8]
00004017  8945FC            mov [ebp-0x4],eax
0000401A  EB13              jmp short 0x402f
0000401C  8B450C            mov eax,[ebp+0xc]
0000401F  0FB610            movzx edx,byte [eax]
00004022  8B4508            mov eax,[ebp+0x8]
00004025  8810              mov [eax],dl
00004027  83450801          add dword [ebp+0x8],byte +0x1
0000402B  83450C01          add dword [ebp+0xc],byte +0x1
0000402F  8B450C            mov eax,[ebp+0xc]
00004032  0FB600            movzx eax,byte [eax]
00004035  84C0              test al,al
00004037  75E3              jnz 0x401c
00004039  8B4508            mov eax,[ebp+0x8]
0000403C  C60000            mov byte [eax],0x0
0000403F  8B45FC            mov eax,[ebp-0x4]
00004042  C9                leave
00004043  C3                ret
00004044  55                push ebp
00004045  89E5              mov ebp,esp
00004047  83EC10            sub esp,byte +0x10
0000404A  C745FC00000000    mov dword [ebp-0x4],0x0
00004051  EB19              jmp short 0x406c
00004053  8B550C            mov edx,[ebp+0xc]
00004056  8B45FC            mov eax,[ebp-0x4]
00004059  01D0              add eax,edx
0000405B  8B4D08            mov ecx,[ebp+0x8]
0000405E  8B55FC            mov edx,[ebp-0x4]
00004061  01CA              add edx,ecx
00004063  0FB600            movzx eax,byte [eax]
00004066  8802              mov [edx],al
00004068  8345FC01          add dword [ebp-0x4],byte +0x1
0000406C  8B45FC            mov eax,[ebp-0x4]
0000406F  3B4510            cmp eax,[ebp+0x10]
00004072  7320              jnc 0x4094
00004074  8B550C            mov edx,[ebp+0xc]
00004077  8B45FC            mov eax,[ebp-0x4]
0000407A  01D0              add eax,edx
0000407C  0FB600            movzx eax,byte [eax]
0000407F  84C0              test al,al
00004081  75D0              jnz 0x4053
00004083  EB0F              jmp short 0x4094
00004085  8B5508            mov edx,[ebp+0x8]
00004088  8B45FC            mov eax,[ebp-0x4]
0000408B  01D0              add eax,edx
0000408D  C60000            mov byte [eax],0x0
00004090  8345FC01          add dword [ebp-0x4],byte +0x1
00004094  8B45FC            mov eax,[ebp-0x4]
00004097  3B4510            cmp eax,[ebp+0x10]
0000409A  72E9              jc 0x4085
0000409C  8B4508            mov eax,[ebp+0x8]
0000409F  C9                leave
000040A0  C3                ret
000040A1  55                push ebp
000040A2  89E5              mov ebp,esp
000040A4  83EC10            sub esp,byte +0x10
000040A7  8B4508            mov eax,[ebp+0x8]
000040AA  8945FC            mov [ebp-0x4],eax
000040AD  EB04              jmp short 0x40b3
000040AF  83450801          add dword [ebp+0x8],byte +0x1
000040B3  8B4508            mov eax,[ebp+0x8]
000040B6  0FB600            movzx eax,byte [eax]
000040B9  84C0              test al,al
000040BB  75F2              jnz 0x40af
000040BD  EB13              jmp short 0x40d2
000040BF  8B450C            mov eax,[ebp+0xc]
000040C2  0FB610            movzx edx,byte [eax]
000040C5  8B4508            mov eax,[ebp+0x8]
000040C8  8810              mov [eax],dl
000040CA  83450801          add dword [ebp+0x8],byte +0x1
000040CE  83450C01          add dword [ebp+0xc],byte +0x1
000040D2  8B450C            mov eax,[ebp+0xc]
000040D5  0FB600            movzx eax,byte [eax]
000040D8  84C0              test al,al
000040DA  75E3              jnz 0x40bf
000040DC  8B4508            mov eax,[ebp+0x8]
000040DF  C60000            mov byte [eax],0x0
000040E2  8B45FC            mov eax,[ebp-0x4]
000040E5  C9                leave
000040E6  C3                ret
000040E7  55                push ebp
000040E8  89E5              mov ebp,esp
000040EA  83EC10            sub esp,byte +0x10
000040ED  C745FC00000000    mov dword [ebp-0x4],0x0
000040F4  EB54              jmp short 0x414a
000040F6  8B5508            mov edx,[ebp+0x8]
000040F9  8B45FC            mov eax,[ebp-0x4]
000040FC  01D0              add eax,edx
000040FE  0FB610            movzx edx,byte [eax]
00004101  8B4D0C            mov ecx,[ebp+0xc]
00004104  8B45FC            mov eax,[ebp-0x4]
00004107  01C8              add eax,ecx
00004109  0FB600            movzx eax,byte [eax]
0000410C  38C2              cmp dl,al
0000410E  7420              jz 0x4130
00004110  8B5508            mov edx,[ebp+0x8]
00004113  8B45FC            mov eax,[ebp-0x4]
00004116  01D0              add eax,edx
00004118  0FB600            movzx eax,byte [eax]
0000411B  0FBEC0            movsx eax,al
0000411E  8B4D0C            mov ecx,[ebp+0xc]
00004121  8B55FC            mov edx,[ebp-0x4]
00004124  01CA              add edx,ecx
00004126  0FB612            movzx edx,byte [edx]
00004129  0FBED2            movsx edx,dl
0000412C  29D0              sub eax,edx
0000412E  EB27              jmp short 0x4157
00004130  8B5508            mov edx,[ebp+0x8]
00004133  8B45FC            mov eax,[ebp-0x4]
00004136  01D0              add eax,edx
00004138  0FB600            movzx eax,byte [eax]
0000413B  84C0              test al,al
0000413D  7507              jnz 0x4146
0000413F  B800000000        mov eax,0x0
00004144  EB11              jmp short 0x4157
00004146  8345FC01          add dword [ebp-0x4],byte +0x1
0000414A  8B45FC            mov eax,[ebp-0x4]
0000414D  3B4510            cmp eax,[ebp+0x10]
00004150  72A4              jc 0x40f6
00004152  B800000000        mov eax,0x0
00004157  C9                leave
00004158  C3                ret
00004159  55                push ebp
0000415A  89E5              mov ebp,esp
0000415C  83EC18            sub esp,byte +0x18
0000415F  83EC0C            sub esp,byte +0xc
00004162  6A30              push byte +0x30
00004164  E8FCE0FFFF        call 0x2265
00004169  83C410            add esp,byte +0x10
0000416C  C645F700          mov byte [ebp-0x9],0x0
00004170  EB1A              jmp short 0x418c
00004172  83EC0C            sub esp,byte +0xc
00004175  68986E1000        push dword 0x106e98
0000417A  E8EBEAFFFF        call 0x2c6a
0000417F  83C410            add esp,byte +0x10
00004182  0FB645F7          movzx eax,byte [ebp-0x9]
00004186  83C001            add eax,byte +0x1
00004189  8845F7            mov [ebp-0x9],al
0000418C  807DF74F          cmp byte [ebp-0x9],0x4f
00004190  76E0              jna 0x4172
00004192  90                nop
00004193  90                nop
00004194  C9                leave
00004195  C3                ret
00004196  55                push ebp
00004197  89E5              mov ebp,esp
00004199  83EC08            sub esp,byte +0x8
0000419C  83EC0C            sub esp,byte +0xc
0000419F  6A07              push byte +0x7
000041A1  E8BFE0FFFF        call 0x2265
000041A6  83C410            add esp,byte +0x10
000041A9  E882E3FFFF        call 0x2530
000041AE  90                nop
000041AF  C9                leave
000041B0  C3                ret
000041B1  55                push ebp
000041B2  89E5              mov ebp,esp
000041B4  83EC18            sub esp,byte +0x18
000041B7  8B4508            mov eax,[ebp+0x8]
000041BA  8845F4            mov [ebp-0xc],al
000041BD  A160C82000        mov eax,[0x20c860]
000041C2  3DFE030000        cmp eax,0x3fe
000041C7  7F2D              jg 0x41f6
000041C9  A160C82000        mov eax,[0x20c860]
000041CE  0FB655F4          movzx edx,byte [ebp-0xc]
000041D2  889060C42000      mov [eax+0x20c460],dl
000041D8  A160C82000        mov eax,[0x20c860]
000041DD  83C001            add eax,byte +0x1
000041E0  A360C82000        mov [0x20c860],eax
000041E5  A160C82000        mov eax,[0x20c860]
000041EA  C68060C4200000    mov byte [eax+0x20c460],0x0
000041F1  E84A000000        call 0x4240
000041F6  90                nop
000041F7  C9                leave
000041F8  C3                ret
000041F9  55                push ebp
000041FA  89E5              mov ebp,esp
000041FC  83EC08            sub esp,byte +0x8
000041FF  A160C82000        mov eax,[0x20c860]
00004204  85C0              test eax,eax
00004206  7E1E              jng 0x4226
00004208  A160C82000        mov eax,[0x20c860]
0000420D  83E801            sub eax,byte +0x1
00004210  A360C82000        mov [0x20c860],eax
00004215  A160C82000        mov eax,[0x20c860]
0000421A  C68060C4200000    mov byte [eax+0x20c460],0x0
00004221  E81A000000        call 0x4240
00004226  90                nop
00004227  C9                leave
00004228  C3                ret
00004229  55                push ebp
0000422A  89E5              mov ebp,esp
0000422C  C60560C4200000    mov byte [dword 0x20c460],0x0
00004233  C70560C820000000  mov dword [dword 0x20c860],0x0
         -0000
0000423D  90                nop
0000423E  5D                pop ebp
0000423F  C3                ret
00004240  55                push ebp
00004241  89E5              mov ebp,esp
00004243  83EC08            sub esp,byte +0x8
00004246  83EC0C            sub esp,byte +0xc
00004249  6897000000        push dword 0x97
0000424E  E812E0FFFF        call 0x2265
00004253  83C410            add esp,byte +0x10
00004256  83EC08            sub esp,byte +0x8
00004259  6860C42000        push dword 0x20c460
0000425E  689A6E1000        push dword 0x106e9a
00004263  E802EAFFFF        call 0x2c6a
00004268  83C410            add esp,byte +0x10
0000426B  90                nop
0000426C  C9                leave
0000426D  C3                ret
0000426E  55                push ebp
0000426F  89E5              mov ebp,esp
00004271  83EC18            sub esp,byte +0x18
00004274  90                nop
00004275  E886BDFFFF        call 0x0
0000427A  83E001            and eax,byte +0x1
0000427D  85C0              test eax,eax
0000427F  74F4              jz 0x4275
00004281  E88FBDFFFF        call 0x15
00004286  8845F7            mov [ebp-0x9],al
00004289  0FB645F7          movzx eax,byte [ebp-0x9]
0000428D  8B048520891000    mov eax,[eax*4+0x108920]
00004294  83EC08            sub esp,byte +0x8
00004297  50                push eax
00004298  689D6E1000        push dword 0x106e9d
0000429D  E8C8E9FFFF        call 0x2c6a
000042A2  83C410            add esp,byte +0x10
000042A5  83EC0C            sub esp,byte +0xc
000042A8  68A16E1000        push dword 0x106ea1
000042AD  E8B8E9FFFF        call 0x2c6a
000042B2  83C410            add esp,byte +0x10
000042B5  0FB645F7          movzx eax,byte [ebp-0x9]
000042B9  84C0              test al,al
000042BB  78B7              js 0x4274
000042BD  807DF701          cmp byte [ebp-0x9],0x1
000042C1  75B1              jnz 0x4274
000042C3  B800000000        mov eax,0x0
000042C8  C9                leave
000042C9  C3                ret
000042CA  55                push ebp
000042CB  89E5              mov ebp,esp
000042CD  83EC18            sub esp,byte +0x18
000042D0  E85BE2FFFF        call 0x2530
000042D5  E87FFEFFFF        call 0x4159
000042DA  E861FFFFFF        call 0x4240
000042DF  90                nop
000042E0  E81BBDFFFF        call 0x0
000042E5  83E001            and eax,byte +0x1
000042E8  85C0              test eax,eax
000042EA  74F4              jz 0x42e0
000042EC  E824BDFFFF        call 0x15
000042F1  8845F7            mov [ebp-0x9],al
000042F4  0FB645F7          movzx eax,byte [ebp-0x9]
000042F8  84C0              test al,al
000042FA  78D4              js 0x42d0
000042FC  807DF701          cmp byte [ebp-0x9],0x1
00004300  750F              jnz 0x4311
00004302  E88FFEFFFF        call 0x4196
00004307  B800000000        mov eax,0x0
0000430C  E992000000        jmp 0x43a3
00004311  807DF73B          cmp byte [ebp-0x9],0x3b
00004315  7507              jnz 0x431e
00004317  E80DFFFFFF        call 0x4229
0000431C  EBB2              jmp short 0x42d0
0000431E  807DF71C          cmp byte [ebp-0x9],0x1c
00004322  750F              jnz 0x4333
00004324  83EC0C            sub esp,byte +0xc
00004327  6A0A              push byte +0xa
00004329  E883FEFFFF        call 0x41b1
0000432E  83C410            add esp,byte +0x10
00004331  EB9D              jmp short 0x42d0
00004333  807DF70E          cmp byte [ebp-0x9],0xe
00004337  7507              jnz 0x4340
00004339  E8BBFEFFFF        call 0x41f9
0000433E  EB90              jmp short 0x42d0
00004340  83EC0C            sub esp,byte +0xc
00004343  6A2A              push byte +0x2a
00004345  E895F0FFFF        call 0x33df
0000434A  83C410            add esp,byte +0x10
0000434D  84C0              test al,al
0000434F  7429              jz 0x437a
00004351  807DF72A          cmp byte [ebp-0x9],0x2a
00004355  7446              jz 0x439d
00004357  0FB645F7          movzx eax,byte [ebp-0x9]
0000435B  0FB680406E1000    movzx eax,byte [eax+0x106e40]
00004362  8845F6            mov [ebp-0xa],al
00004365  0FB645F6          movzx eax,byte [ebp-0xa]
00004369  83EC0C            sub esp,byte +0xc
0000436C  50                push eax
0000436D  E83FFEFFFF        call 0x41b1
00004372  83C410            add esp,byte +0x10
00004375  E956FFFFFF        jmp 0x42d0
0000437A  0FB645F7          movzx eax,byte [ebp-0x9]
0000437E  0FB680E06D1000    movzx eax,byte [eax+0x106de0]
00004385  8845F6            mov [ebp-0xa],al
00004388  0FB645F6          movzx eax,byte [ebp-0xa]
0000438C  83EC0C            sub esp,byte +0xc
0000438F  50                push eax
00004390  E81CFEFFFF        call 0x41b1
00004395  83C410            add esp,byte +0x10
00004398  E933FFFFFF        jmp 0x42d0
0000439D  90                nop
0000439E  E92DFFFFFF        jmp 0x42d0
000043A3  C9                leave
000043A4  C3                ret
000043A5  55                push ebp
000043A6  89E5              mov ebp,esp
000043A8  83EC18            sub esp,byte +0x18
000043AB  C745F400000000    mov dword [ebp-0xc],0x0
000043B2  E879E1FFFF        call 0x2530
000043B7  E89DFDFFFF        call 0x4159
000043BC  83EC08            sub esp,byte +0x8
000043BF  6800010000        push dword 0x100
000043C4  6A00              push byte +0x0
000043C6  E836E9FFFF        call 0x2d01
000043CB  83C410            add esp,byte +0x10
000043CE  8B45F4            mov eax,[ebp-0xc]
000043D1  01C0              add eax,eax
000043D3  83C001            add eax,byte +0x1
000043D6  83EC0C            sub esp,byte +0xc
000043D9  50                push eax
000043DA  E89EDEFFFF        call 0x227d
000043DF  83C410            add esp,byte +0x10
000043E2  83EC08            sub esp,byte +0x8
000043E5  6A03              push byte +0x3
000043E7  68A76E1000        push dword 0x106ea7
000043EC  E879E8FFFF        call 0x2c6a
000043F1  83C410            add esp,byte +0x10
000043F4  90                nop
000043F5  E806BCFFFF        call 0x0
000043FA  83E001            and eax,byte +0x1
000043FD  85C0              test eax,eax
000043FF  74F4              jz 0x43f5
00004401  E80FBCFFFF        call 0x15
00004406  8845F3            mov [ebp-0xd],al
00004409  0FB645F3          movzx eax,byte [ebp-0xd]
0000440D  8945EC            mov [ebp-0x14],eax
00004410  837DEC00          cmp dword [ebp-0x14],byte +0x0
00004414  740D              jz 0x4423
00004416  817DECE0000000    cmp dword [ebp-0x14],0xe0
0000441D  0F85A5000000      jnz near 0x44c8
00004423  E8DFEFFFFF        call 0x3407
00004428  0FB6C0            movzx eax,al
0000442B  8945EC            mov [ebp-0x14],eax
0000442E  837DEC50          cmp dword [ebp-0x14],byte +0x50
00004432  743A              jz 0x446e
00004434  837DEC50          cmp dword [ebp-0x14],byte +0x50
00004438  0F8F84000000      jg near 0x44c2
0000443E  837DEC4D          cmp dword [ebp-0x14],byte +0x4d
00004442  745F              jz 0x44a3
00004444  837DEC4D          cmp dword [ebp-0x14],byte +0x4d
00004448  7F78              jg 0x44c2
0000444A  837DEC48          cmp dword [ebp-0x14],byte +0x48
0000444E  7408              jz 0x4458
00004450  837DEC4B          cmp dword [ebp-0x14],byte +0x4b
00004454  7437              jz 0x448d
00004456  EB6A              jmp short 0x44c2
00004458  837DF40F          cmp dword [ebp-0xc],byte +0xf
0000445C  7E08              jng 0x4466
0000445E  8B45F4            mov eax,[ebp-0xc]
00004461  83E810            sub eax,byte +0x10
00004464  EB03              jmp short 0x4469
00004466  8B45F4            mov eax,[ebp-0xc]
00004469  8945F4            mov [ebp-0xc],eax
0000446C  EB55              jmp short 0x44c3
0000446E  8B45F4            mov eax,[ebp-0xc]
00004471  8D5010            lea edx,[eax+0x10]
00004474  A160C82000        mov eax,[0x20c860]
00004479  39C2              cmp edx,eax
0000447B  7D08              jnl 0x4485
0000447D  8B45F4            mov eax,[ebp-0xc]
00004480  83C010            add eax,byte +0x10
00004483  EB03              jmp short 0x4488
00004485  8B45F4            mov eax,[ebp-0xc]
00004488  8945F4            mov [ebp-0xc],eax
0000448B  EB36              jmp short 0x44c3
0000448D  837DF400          cmp dword [ebp-0xc],byte +0x0
00004491  7E08              jng 0x449b
00004493  8B45F4            mov eax,[ebp-0xc]
00004496  83E801            sub eax,byte +0x1
00004499  EB03              jmp short 0x449e
0000449B  8B45F4            mov eax,[ebp-0xc]
0000449E  8945F4            mov [ebp-0xc],eax
000044A1  EB20              jmp short 0x44c3
000044A3  8B45F4            mov eax,[ebp-0xc]
000044A6  8D5001            lea edx,[eax+0x1]
000044A9  A160C82000        mov eax,[0x20c860]
000044AE  39C2              cmp edx,eax
000044B0  7D08              jnl 0x44ba
000044B2  8B45F4            mov eax,[ebp-0xc]
000044B5  83C001            add eax,byte +0x1
000044B8  EB03              jmp short 0x44bd
000044BA  8B45F4            mov eax,[ebp-0xc]
000044BD  8945F4            mov [ebp-0xc],eax
000044C0  EB01              jmp short 0x44c3
000044C2  90                nop
000044C3  E99C000000        jmp 0x4564
000044C8  837DEC1B          cmp dword [ebp-0x14],byte +0x1b
000044CC  750A              jnz 0x44d8
000044CE  E8C3FCFFFF        call 0x4196
000044D3  E991000000        jmp 0x4569
000044D8  837DEC2F          cmp dword [ebp-0x14],byte +0x2f
000044DC  7E06              jng 0x44e4
000044DE  837DEC39          cmp dword [ebp-0x14],byte +0x39
000044E2  7E0C              jng 0x44f0
000044E4  837DEC40          cmp dword [ebp-0x14],byte +0x40
000044E8  7E2A              jng 0x4514
000044EA  837DEC46          cmp dword [ebp-0x14],byte +0x46
000044EE  7F24              jg 0x4514
000044F0  A160C82000        mov eax,[0x20c860]
000044F5  3945F4            cmp [ebp-0xc],eax
000044F8  7D6A              jnl 0x4564
000044FA  8B45EC            mov eax,[ebp-0x14]
000044FD  89C2              mov edx,eax
000044FF  8B45F4            mov eax,[ebp-0xc]
00004502  0560C42000        add eax,0x20c460
00004507  8810              mov [eax],dl
00004509  8345F401          add dword [ebp-0xc],byte +0x1
0000450D  E82EFDFFFF        call 0x4240
00004512  EB50              jmp short 0x4564
00004514  837DEC08          cmp dword [ebp-0x14],byte +0x8
00004518  7518              jnz 0x4532
0000451A  837DF400          cmp dword [ebp-0xc],byte +0x0
0000451E  0F8E8EFEFFFF      jng near 0x43b2
00004524  836DF401          sub dword [ebp-0xc],byte +0x1
00004528  E8CCFCFFFF        call 0x41f9
0000452D  E980FEFFFF        jmp 0x43b2
00004532  837DEC0D          cmp dword [ebp-0x14],byte +0xd
00004536  7516              jnz 0x454e
00004538  83EC0C            sub esp,byte +0xc
0000453B  6A0A              push byte +0xa
0000453D  E86FFCFFFF        call 0x41b1
00004542  83C410            add esp,byte +0x10
00004545  8345F402          add dword [ebp-0xc],byte +0x2
00004549  E964FEFFFF        jmp 0x43b2
0000454E  8B45EC            mov eax,[ebp-0x14]
00004551  0FB6C0            movzx eax,al
00004554  83EC0C            sub esp,byte +0xc
00004557  50                push eax
00004558  E854FCFFFF        call 0x41b1
0000455D  83C410            add esp,byte +0x10
00004560  8345F401          add dword [ebp-0xc],byte +0x1
00004564  E949FEFFFF        jmp 0x43b2
00004569  90                nop
0000456A  C9                leave
0000456B  C3                ret
0000456C  55                push ebp
0000456D  89E5              mov ebp,esp
0000456F  83EC08            sub esp,byte +0x8
00004572  E824F0FFFF        call 0x359b
00004577  A3948A1000        mov [0x108a94],eax
0000457C  90                nop
0000457D  C9                leave
0000457E  C3                ret
0000457F  55                push ebp
00004580  89E5              mov ebp,esp
00004582  83EC08            sub esp,byte +0x8
00004585  E8E2FFFFFF        call 0x456c
0000458A  A1948A1000        mov eax,[0x108a94]
0000458F  69C06D4EC641      imul eax,eax,dword 0x41c64e6d
00004595  0539300000        add eax,0x3039
0000459A  25FFFFFF7F        and eax,0x7fffffff
0000459F  A3948A1000        mov [0x108a94],eax
000045A4  A1948A1000        mov eax,[0x108a94]
000045A9  C9                leave
000045AA  C3                ret
000045AB  55                push ebp
000045AC  89E5              mov ebp,esp
000045AE  83EC08            sub esp,byte +0x8
000045B1  E8C9FFFFFF        call 0x457f
000045B6  8B550C            mov edx,[ebp+0xc]
000045B9  2B5508            sub edx,[ebp+0x8]
000045BC  83C201            add edx,byte +0x1
000045BF  89D1              mov ecx,edx
000045C1  BA00000000        mov edx,0x0
000045C6  F7F1              div ecx
000045C8  8B4508            mov eax,[ebp+0x8]
000045CB  01D0              add eax,edx
000045CD  C9                leave
000045CE  C3                ret
000045CF  55                push ebp
000045D0  89E5              mov ebp,esp
000045D2  83EC18            sub esp,byte +0x18
000045D5  83EC0C            sub esp,byte +0xc
000045D8  6A30              push byte +0x30
000045DA  E886DCFFFF        call 0x2265
000045DF  83C410            add esp,byte +0x10
000045E2  C645F700          mov byte [ebp-0x9],0x0
000045E6  EB20              jmp short 0x4608
000045E8  0FB645F7          movzx eax,byte [ebp-0x9]
000045EC  6A20              push byte +0x20
000045EE  68DC000000        push dword 0xdc
000045F3  6A00              push byte +0x0
000045F5  50                push eax
000045F6  E8B3000000        call 0x46ae
000045FB  83C410            add esp,byte +0x10
000045FE  0FB645F7          movzx eax,byte [ebp-0x9]
00004602  83C001            add eax,byte +0x1
00004605  8845F7            mov [ebp-0x9],al
00004608  807DF744          cmp byte [ebp-0x9],0x44
0000460C  76DA              jna 0x45e8
0000460E  C645F645          mov byte [ebp-0xa],0x45
00004612  EB20              jmp short 0x4634
00004614  0FB645F6          movzx eax,byte [ebp-0xa]
00004618  6A20              push byte +0x20
0000461A  68CA000000        push dword 0xca
0000461F  6A00              push byte +0x0
00004621  50                push eax
00004622  E887000000        call 0x46ae
00004627  83C410            add esp,byte +0x10
0000462A  0FB645F6          movzx eax,byte [ebp-0xa]
0000462E  83C001            add eax,byte +0x1
00004631  8845F6            mov [ebp-0xa],al
00004634  807DF64F          cmp byte [ebp-0xa],0x4f
00004638  76DA              jna 0x4614
0000463A  83EC0C            sub esp,byte +0xc
0000463D  68AA6E1000        push dword 0x106eaa
00004642  E80CDEFFFF        call 0x2453
00004647  83C410            add esp,byte +0x10
0000464A  90                nop
0000464B  C9                leave
0000464C  C3                ret
0000464D  55                push ebp
0000464E  89E5              mov ebp,esp
00004650  83EC08            sub esp,byte +0x8
00004653  83EC0C            sub esp,byte +0xc
00004656  6A07              push byte +0x7
00004658  E808DCFFFF        call 0x2265
0000465D  83C410            add esp,byte +0x10
00004660  E8CBDEFFFF        call 0x2530
00004665  90                nop
00004666  C9                leave
00004667  C3                ret
00004668  55                push ebp
00004669  89E5              mov ebp,esp
0000466B  83EC08            sub esp,byte +0x8
0000466E  83EC04            sub esp,byte +0x4
00004671  68A00F0000        push dword 0xfa0
00004676  6A00              push byte +0x0
00004678  6880C82000        push dword 0x20c880
0000467D  E89DF1FFFF        call 0x381f
00004682  83C410            add esp,byte +0x10
00004685  90                nop
00004686  C9                leave
00004687  C3                ret
00004688  55                push ebp
00004689  89E5              mov ebp,esp
0000468B  83EC18            sub esp,byte +0x18
0000468E  C745F400800B00    mov dword [ebp-0xc],0xb8000
00004695  83EC04            sub esp,byte +0x4
00004698  68A00F0000        push dword 0xfa0
0000469D  FF7508            push dword [ebp+0x8]
000046A0  FF75F4            push dword [ebp-0xc]
000046A3  E804F1FFFF        call 0x37ac
000046A8  83C410            add esp,byte +0x10
000046AB  90                nop
000046AC  C9                leave
000046AD  C3                ret
000046AE  55                push ebp
000046AF  89E5              mov ebp,esp
000046B1  53                push ebx
000046B2  83EC20            sub esp,byte +0x20
000046B5  8B5D08            mov ebx,[ebp+0x8]
000046B8  8B4D0C            mov ecx,[ebp+0xc]
000046BB  8B5510            mov edx,[ebp+0x10]
000046BE  8B4514            mov eax,[ebp+0x14]
000046C1  885DE8            mov [ebp-0x18],bl
000046C4  884DE4            mov [ebp-0x1c],cl
000046C7  8855E0            mov [ebp-0x20],dl
000046CA  8845DC            mov [ebp-0x24],al
000046CD  0FB655E4          movzx edx,byte [ebp-0x1c]
000046D1  89D0              mov eax,edx
000046D3  C1E002            shl eax,byte 0x2
000046D6  01D0              add eax,edx
000046D8  C1E004            shl eax,byte 0x4
000046DB  89C2              mov edx,eax
000046DD  0FB645E8          movzx eax,byte [ebp-0x18]
000046E1  01D0              add eax,edx
000046E3  01C0              add eax,eax
000046E5  0580C82000        add eax,0x20c880
000046EA  8945F8            mov [ebp-0x8],eax
000046ED  0FB655DC          movzx edx,byte [ebp-0x24]
000046F1  8B45F8            mov eax,[ebp-0x8]
000046F4  8810              mov [eax],dl
000046F6  8345F801          add dword [ebp-0x8],byte +0x1
000046FA  8B45F8            mov eax,[ebp-0x8]
000046FD  0FB655E0          movzx edx,byte [ebp-0x20]
00004701  8810              mov [eax],dl
00004703  8345F801          add dword [ebp-0x8],byte +0x1
00004707  90                nop
00004708  8B5DFC            mov ebx,[ebp-0x4]
0000470B  C9                leave
0000470C  C3                ret
0000470D  55                push ebp
0000470E  89E5              mov ebp,esp
00004710  57                push edi
00004711  56                push esi
00004712  53                push ebx
00004713  83EC0C            sub esp,byte +0xc
00004716  C6059C8A100028    mov byte [dword 0x108a9c],0x28
0000471D  C6059D8A10000C    mov byte [dword 0x108a9d],0xc
00004724  83EC04            sub esp,byte +0x4
00004727  68A00F0000        push dword 0xfa0
0000472C  6A00              push byte +0x0
0000472E  6800800B00        push dword 0xb8000
00004733  E8E7F0FFFF        call 0x381f
00004738  83C410            add esp,byte +0x10
0000473B  0FB6059D8A1000    movzx eax,byte [dword 0x108a9d]
00004742  0FB6D0            movzx edx,al
00004745  0FB6059C8A1000    movzx eax,byte [dword 0x108a9c]
0000474C  0FB6C0            movzx eax,al
0000474F  6A03              push byte +0x3
00004751  6A0F              push byte +0xf
00004753  52                push edx
00004754  50                push eax
00004755  E854FFFFFF        call 0x46ae
0000475A  83C410            add esp,byte +0x10
0000475D  E86DFEFFFF        call 0x45cf
00004762  83EC0C            sub esp,byte +0xc
00004765  6A48              push byte +0x48
00004767  E873ECFFFF        call 0x33df
0000476C  83C410            add esp,byte +0x10
0000476F  84C0              test al,al
00004771  741A              jz 0x478d
00004773  0FB6059D8A1000    movzx eax,byte [dword 0x108a9d]
0000477A  84C0              test al,al
0000477C  740F              jz 0x478d
0000477E  0FB6059D8A1000    movzx eax,byte [dword 0x108a9d]
00004785  83E801            sub eax,byte +0x1
00004788  A29D8A1000        mov [0x108a9d],al
0000478D  83EC0C            sub esp,byte +0xc
00004790  6A50              push byte +0x50
00004792  E848ECFFFF        call 0x33df
00004797  83C410            add esp,byte +0x10
0000479A  84C0              test al,al
0000479C  741A              jz 0x47b8
0000479E  0FB6059D8A1000    movzx eax,byte [dword 0x108a9d]
000047A5  3C17              cmp al,0x17
000047A7  770F              ja 0x47b8
000047A9  0FB6059D8A1000    movzx eax,byte [dword 0x108a9d]
000047B0  83C001            add eax,byte +0x1
000047B3  A29D8A1000        mov [0x108a9d],al
000047B8  83EC0C            sub esp,byte +0xc
000047BB  6A4B              push byte +0x4b
000047BD  E81DECFFFF        call 0x33df
000047C2  83C410            add esp,byte +0x10
000047C5  84C0              test al,al
000047C7  741A              jz 0x47e3
000047C9  0FB6059C8A1000    movzx eax,byte [dword 0x108a9c]
000047D0  84C0              test al,al
000047D2  740F              jz 0x47e3
000047D4  0FB6059C8A1000    movzx eax,byte [dword 0x108a9c]
000047DB  83E801            sub eax,byte +0x1
000047DE  A29C8A1000        mov [0x108a9c],al
000047E3  83EC0C            sub esp,byte +0xc
000047E6  6A4D              push byte +0x4d
000047E8  E8F2EBFFFF        call 0x33df
000047ED  83C410            add esp,byte +0x10
000047F0  84C0              test al,al
000047F2  741A              jz 0x480e
000047F4  0FB6059C8A1000    movzx eax,byte [dword 0x108a9c]
000047FB  3C4E              cmp al,0x4e
000047FD  770F              ja 0x480e
000047FF  0FB6059C8A1000    movzx eax,byte [dword 0x108a9c]
00004806  83C001            add eax,byte +0x1
00004809  A29C8A1000        mov [0x108a9c],al
0000480E  83EC0C            sub esp,byte +0xc
00004811  6A4C              push byte +0x4c
00004813  E8C7EBFFFF        call 0x33df
00004818  83C410            add esp,byte +0x10
0000481B  84C0              test al,al
0000481D  7457              jz 0x4876
0000481F  83EC08            sub esp,byte +0x8
00004822  6800010000        push dword 0x100
00004827  6A00              push byte +0x0
00004829  E87DFDFFFF        call 0x45ab
0000482E  83C410            add esp,byte +0x10
00004831  0FBEF8            movsx edi,al
00004834  83EC08            sub esp,byte +0x8
00004837  6A10              push byte +0x10
00004839  6A00              push byte +0x0
0000483B  E86BFDFFFF        call 0x45ab
00004840  83C410            add esp,byte +0x10
00004843  0FB6F0            movzx esi,al
00004846  83EC08            sub esp,byte +0x8
00004849  6A19              push byte +0x19
0000484B  6A00              push byte +0x0
0000484D  E859FDFFFF        call 0x45ab
00004852  83C410            add esp,byte +0x10
00004855  0FB6D8            movzx ebx,al
00004858  83EC08            sub esp,byte +0x8
0000485B  6A50              push byte +0x50
0000485D  6A00              push byte +0x0
0000485F  E847FDFFFF        call 0x45ab
00004864  83C410            add esp,byte +0x10
00004867  0FB6C0            movzx eax,al
0000486A  57                push edi
0000486B  56                push esi
0000486C  53                push ebx
0000486D  50                push eax
0000486E  E83BFEFFFF        call 0x46ae
00004873  83C410            add esp,byte +0x10
00004876  83EC0C            sub esp,byte +0xc
00004879  6A38              push byte +0x38
0000487B  E85FEBFFFF        call 0x33df
00004880  83C410            add esp,byte +0x10
00004883  84C0              test al,al
00004885  7459              jz 0x48e0
00004887  83EC08            sub esp,byte +0x8
0000488A  6800010000        push dword 0x100
0000488F  6A00              push byte +0x0
00004891  E815FDFFFF        call 0x45ab
00004896  83C410            add esp,byte +0x10
00004899  0FBEF8            movsx edi,al
0000489C  83EC08            sub esp,byte +0x8
0000489F  6A10              push byte +0x10
000048A1  6A00              push byte +0x0
000048A3  E803FDFFFF        call 0x45ab
000048A8  83C410            add esp,byte +0x10
000048AB  0FB6F0            movzx esi,al
000048AE  83EC08            sub esp,byte +0x8
000048B1  6A19              push byte +0x19
000048B3  6A00              push byte +0x0
000048B5  E8F1FCFFFF        call 0x45ab
000048BA  83C410            add esp,byte +0x10
000048BD  0FB6D8            movzx ebx,al
000048C0  83EC08            sub esp,byte +0x8
000048C3  6A50              push byte +0x50
000048C5  6A00              push byte +0x0
000048C7  E8DFFCFFFF        call 0x45ab
000048CC  83C410            add esp,byte +0x10
000048CF  0FB6C0            movzx eax,al
000048D2  57                push edi
000048D3  56                push esi
000048D4  53                push ebx
000048D5  50                push eax
000048D6  E8D3FDFFFF        call 0x46ae
000048DB  83C410            add esp,byte +0x10
000048DE  EB18              jmp short 0x48f8
000048E0  83EC0C            sub esp,byte +0xc
000048E3  6A01              push byte +0x1
000048E5  E8F5EAFFFF        call 0x33df
000048EA  83C410            add esp,byte +0x10
000048ED  84C0              test al,al
000048EF  7407              jz 0x48f8
000048F1  E857FDFFFF        call 0x464d
000048F6  EB22              jmp short 0x491a
000048F8  83EC0C            sub esp,byte +0xc
000048FB  6880C82000        push dword 0x20c880
00004900  E883FDFFFF        call 0x4688
00004905  83C410            add esp,byte +0x10
00004908  83EC0C            sub esp,byte +0xc
0000490B  6A32              push byte +0x32
0000490D  E865ECFFFF        call 0x3577
00004912  83C410            add esp,byte +0x10
00004915  E90AFEFFFF        jmp 0x4724
0000491A  90                nop
0000491B  8D65F4            lea esp,[ebp-0xc]
0000491E  5B                pop ebx
0000491F  5E                pop esi
00004920  5F                pop edi
00004921  5D                pop ebp
00004922  C3                ret
00004923  55                push ebp
00004924  89E5              mov ebp,esp
00004926  83EC18            sub esp,byte +0x18
00004929  C745F400000000    mov dword [ebp-0xc],0x0
00004930  83EC0C            sub esp,byte +0xc
00004933  68B06E1000        push dword 0x106eb0
00004938  E82DE3FFFF        call 0x2c6a
0000493D  83C410            add esp,byte +0x10
00004940  EB55              jmp short 0x4997
00004942  8B4508            mov eax,[ebp+0x8]
00004945  0FB600            movzx eax,byte [eax]
00004948  0FB6C0            movzx eax,al
0000494B  83EC08            sub esp,byte +0x8
0000494E  50                push eax
0000494F  68B26E1000        push dword 0x106eb2
00004954  E811E3FFFF        call 0x2c6a
00004959  83C410            add esp,byte +0x10
0000495C  8345F401          add dword [ebp-0xc],byte +0x1
00004960  837DF407          cmp dword [ebp-0xc],byte +0x7
00004964  7619              jna 0x497f
00004966  C745F400000000    mov dword [ebp-0xc],0x0
0000496D  83EC0C            sub esp,byte +0xc
00004970  68BA6E1000        push dword 0x106eba
00004975  E8F0E2FFFF        call 0x2c6a
0000497A  83C410            add esp,byte +0x10
0000497D  EB10              jmp short 0x498f
0000497F  83EC0C            sub esp,byte +0xc
00004982  68BD6E1000        push dword 0x106ebd
00004987  E8DEE2FFFF        call 0x2c6a
0000498C  83C410            add esp,byte +0x10
0000498F  83450801          add dword [ebp+0x8],byte +0x1
00004993  836D0C01          sub dword [ebp+0xc],byte +0x1
00004997  837D0C00          cmp dword [ebp+0xc],byte +0x0
0000499B  75A5              jnz 0x4942
0000499D  83EC0C            sub esp,byte +0xc
000049A0  68BF6E1000        push dword 0x106ebf
000049A5  E8C0E2FFFF        call 0x2c6a
000049AA  83C410            add esp,byte +0x10
000049AD  90                nop
000049AE  C9                leave
000049AF  C3                ret
000049B0  55                push ebp
000049B1  89E5              mov ebp,esp
000049B3  83EC08            sub esp,byte +0x8
000049B6  83EC0C            sub esp,byte +0xc
000049B9  68C16E1000        push dword 0x106ec1
000049BE  E8A7E2FFFF        call 0x2c6a
000049C3  83C410            add esp,byte +0x10
000049C6  83EC0C            sub esp,byte +0xc
000049C9  68DB6E1000        push dword 0x106edb
000049CE  E897E2FFFF        call 0x2c6a
000049D3  83C410            add esp,byte +0x10
000049D6  83EC0C            sub esp,byte +0xc
000049D9  68DE6E1000        push dword 0x106ede
000049DE  E887E2FFFF        call 0x2c6a
000049E3  83C410            add esp,byte +0x10
000049E6  8B4508            mov eax,[ebp+0x8]
000049E9  0FB600            movzx eax,byte [eax]
000049EC  0FB6C0            movzx eax,al
000049EF  83EC08            sub esp,byte +0x8
000049F2  50                push eax
000049F3  68EA6E1000        push dword 0x106eea
000049F8  E86DE2FFFF        call 0x2c6a
000049FD  83C410            add esp,byte +0x10
00004A00  83450801          add dword [ebp+0x8],byte +0x1
00004A04  83EC0C            sub esp,byte +0xc
00004A07  68F46E1000        push dword 0x106ef4
00004A0C  E859E2FFFF        call 0x2c6a
00004A11  83C410            add esp,byte +0x10
00004A14  83EC08            sub esp,byte +0x8
00004A17  6A05              push byte +0x5
00004A19  FF7508            push dword [ebp+0x8]
00004A1C  E802FFFFFF        call 0x4923
00004A21  83C410            add esp,byte +0x10
00004A24  83450805          add dword [ebp+0x8],byte +0x5
00004A28  83EC0C            sub esp,byte +0xc
00004A2B  68FF6E1000        push dword 0x106eff
00004A30  E835E2FFFF        call 0x2c6a
00004A35  83C410            add esp,byte +0x10
00004A38  83EC08            sub esp,byte +0x8
00004A3B  6A19              push byte +0x19
00004A3D  FF7508            push dword [ebp+0x8]
00004A40  E8DEFEFFFF        call 0x4923
00004A45  83C410            add esp,byte +0x10
00004A48  83450819          add dword [ebp+0x8],byte +0x19
00004A4C  83EC0C            sub esp,byte +0xc
00004A4F  680B6F1000        push dword 0x106f0b
00004A54  E811E2FFFF        call 0x2c6a
00004A59  83C410            add esp,byte +0x10
00004A5C  83EC08            sub esp,byte +0x8
00004A5F  6A09              push byte +0x9
00004A61  FF7508            push dword [ebp+0x8]
00004A64  E8BAFEFFFF        call 0x4923
00004A69  83C410            add esp,byte +0x10
00004A6C  83450809          add dword [ebp+0x8],byte +0x9
00004A70  83EC0C            sub esp,byte +0xc
00004A73  68156F1000        push dword 0x106f15
00004A78  E8EDE1FFFF        call 0x2c6a
00004A7D  83C410            add esp,byte +0x10
00004A80  83EC08            sub esp,byte +0x8
00004A83  6A15              push byte +0x15
00004A85  FF7508            push dword [ebp+0x8]
00004A88  E896FEFFFF        call 0x4923
00004A8D  83C410            add esp,byte +0x10
00004A90  83450815          add dword [ebp+0x8],byte +0x15
00004A94  83EC0C            sub esp,byte +0xc
00004A97  681F6F1000        push dword 0x106f1f
00004A9C  E8C9E1FFFF        call 0x2c6a
00004AA1  83C410            add esp,byte +0x10
00004AA4  90                nop
00004AA5  C9                leave
00004AA6  C3                ret
00004AA7  55                push ebp
00004AA8  89E5              mov ebp,esp
00004AAA  83EC18            sub esp,byte +0x18
00004AAD  83EC0C            sub esp,byte +0xc
00004AB0  68CC030000        push dword 0x3cc
00004AB5  E87BE9FFFF        call 0x3435
00004ABA  83C410            add esp,byte +0x10
00004ABD  8B5508            mov edx,[ebp+0x8]
00004AC0  8802              mov [edx],al
00004AC2  83450801          add dword [ebp+0x8],byte +0x1
00004AC6  C745F400000000    mov dword [ebp-0xc],0x0
00004ACD  EB34              jmp short 0x4b03
00004ACF  8B45F4            mov eax,[ebp-0xc]
00004AD2  0FB6C0            movzx eax,al
00004AD5  83EC08            sub esp,byte +0x8
00004AD8  50                push eax
00004AD9  68C4030000        push dword 0x3c4
00004ADE  E86FE9FFFF        call 0x3452
00004AE3  83C410            add esp,byte +0x10
00004AE6  83EC0C            sub esp,byte +0xc
00004AE9  68C5030000        push dword 0x3c5
00004AEE  E842E9FFFF        call 0x3435
00004AF3  83C410            add esp,byte +0x10
00004AF6  8B5508            mov edx,[ebp+0x8]
00004AF9  8802              mov [edx],al
00004AFB  83450801          add dword [ebp+0x8],byte +0x1
00004AFF  8345F401          add dword [ebp-0xc],byte +0x1
00004B03  837DF404          cmp dword [ebp-0xc],byte +0x4
00004B07  76C6              jna 0x4acf
00004B09  C745F400000000    mov dword [ebp-0xc],0x0
00004B10  EB34              jmp short 0x4b46
00004B12  8B45F4            mov eax,[ebp-0xc]
00004B15  0FB6C0            movzx eax,al
00004B18  83EC08            sub esp,byte +0x8
00004B1B  50                push eax
00004B1C  68D4030000        push dword 0x3d4
00004B21  E82CE9FFFF        call 0x3452
00004B26  83C410            add esp,byte +0x10
00004B29  83EC0C            sub esp,byte +0xc
00004B2C  68D5030000        push dword 0x3d5
00004B31  E8FFE8FFFF        call 0x3435
00004B36  83C410            add esp,byte +0x10
00004B39  8B5508            mov edx,[ebp+0x8]
00004B3C  8802              mov [edx],al
00004B3E  83450801          add dword [ebp+0x8],byte +0x1
00004B42  8345F401          add dword [ebp-0xc],byte +0x1
00004B46  837DF418          cmp dword [ebp-0xc],byte +0x18
00004B4A  76C6              jna 0x4b12
00004B4C  C745F400000000    mov dword [ebp-0xc],0x0
00004B53  EB34              jmp short 0x4b89
00004B55  8B45F4            mov eax,[ebp-0xc]
00004B58  0FB6C0            movzx eax,al
00004B5B  83EC08            sub esp,byte +0x8
00004B5E  50                push eax
00004B5F  68CE030000        push dword 0x3ce
00004B64  E8E9E8FFFF        call 0x3452
00004B69  83C410            add esp,byte +0x10
00004B6C  83EC0C            sub esp,byte +0xc
00004B6F  68CF030000        push dword 0x3cf
00004B74  E8BCE8FFFF        call 0x3435
00004B79  83C410            add esp,byte +0x10
00004B7C  8B5508            mov edx,[ebp+0x8]
00004B7F  8802              mov [edx],al
00004B81  83450801          add dword [ebp+0x8],byte +0x1
00004B85  8345F401          add dword [ebp-0xc],byte +0x1
00004B89  837DF408          cmp dword [ebp-0xc],byte +0x8
00004B8D  76C6              jna 0x4b55
00004B8F  C745F400000000    mov dword [ebp-0xc],0x0
00004B96  EB44              jmp short 0x4bdc
00004B98  83EC0C            sub esp,byte +0xc
00004B9B  68DA030000        push dword 0x3da
00004BA0  E890E8FFFF        call 0x3435
00004BA5  83C410            add esp,byte +0x10
00004BA8  8B45F4            mov eax,[ebp-0xc]
00004BAB  0FB6C0            movzx eax,al
00004BAE  83EC08            sub esp,byte +0x8
00004BB1  50                push eax
00004BB2  68C0030000        push dword 0x3c0
00004BB7  E896E8FFFF        call 0x3452
00004BBC  83C410            add esp,byte +0x10
00004BBF  83EC0C            sub esp,byte +0xc
00004BC2  68C1030000        push dword 0x3c1
00004BC7  E869E8FFFF        call 0x3435
00004BCC  83C410            add esp,byte +0x10
00004BCF  8B5508            mov edx,[ebp+0x8]
00004BD2  8802              mov [edx],al
00004BD4  83450801          add dword [ebp+0x8],byte +0x1
00004BD8  8345F401          add dword [ebp-0xc],byte +0x1
00004BDC  837DF414          cmp dword [ebp-0xc],byte +0x14
00004BE0  76B6              jna 0x4b98
00004BE2  83EC0C            sub esp,byte +0xc
00004BE5  68DA030000        push dword 0x3da
00004BEA  E846E8FFFF        call 0x3435
00004BEF  83C410            add esp,byte +0x10
00004BF2  83EC08            sub esp,byte +0x8
00004BF5  6A20              push byte +0x20
00004BF7  68C0030000        push dword 0x3c0
00004BFC  E851E8FFFF        call 0x3452
00004C01  83C410            add esp,byte +0x10
00004C04  90                nop
00004C05  C9                leave
00004C06  C3                ret
00004C07  55                push ebp
00004C08  89E5              mov ebp,esp
00004C0A  83EC18            sub esp,byte +0x18
00004C0D  8B4508            mov eax,[ebp+0x8]
00004C10  0FB600            movzx eax,byte [eax]
00004C13  0FB6C0            movzx eax,al
00004C16  83EC08            sub esp,byte +0x8
00004C19  50                push eax
00004C1A  68C2030000        push dword 0x3c2
00004C1F  E82EE8FFFF        call 0x3452
00004C24  83C410            add esp,byte +0x10
00004C27  83450801          add dword [ebp+0x8],byte +0x1
00004C2B  C745F400000000    mov dword [ebp-0xc],0x0
00004C32  EB39              jmp short 0x4c6d
00004C34  8B45F4            mov eax,[ebp-0xc]
00004C37  0FB6C0            movzx eax,al
00004C3A  83EC08            sub esp,byte +0x8
00004C3D  50                push eax
00004C3E  68C4030000        push dword 0x3c4
00004C43  E80AE8FFFF        call 0x3452
00004C48  83C410            add esp,byte +0x10
00004C4B  8B4508            mov eax,[ebp+0x8]
00004C4E  0FB600            movzx eax,byte [eax]
00004C51  0FB6C0            movzx eax,al
00004C54  83EC08            sub esp,byte +0x8
00004C57  50                push eax
00004C58  68C5030000        push dword 0x3c5
00004C5D  E8F0E7FFFF        call 0x3452
00004C62  83C410            add esp,byte +0x10
00004C65  83450801          add dword [ebp+0x8],byte +0x1
00004C69  8345F401          add dword [ebp-0xc],byte +0x1
00004C6D  837DF404          cmp dword [ebp-0xc],byte +0x4
00004C71  76C1              jna 0x4c34
00004C73  83EC08            sub esp,byte +0x8
00004C76  6A03              push byte +0x3
00004C78  68D4030000        push dword 0x3d4
00004C7D  E8D0E7FFFF        call 0x3452
00004C82  83C410            add esp,byte +0x10
00004C85  83EC0C            sub esp,byte +0xc
00004C88  68D5030000        push dword 0x3d5
00004C8D  E8A3E7FFFF        call 0x3435
00004C92  83C410            add esp,byte +0x10
00004C95  83C880            or eax,byte -0x80
00004C98  0FB6C0            movzx eax,al
00004C9B  83EC08            sub esp,byte +0x8
00004C9E  50                push eax
00004C9F  68D5030000        push dword 0x3d5
00004CA4  E8A9E7FFFF        call 0x3452
00004CA9  83C410            add esp,byte +0x10
00004CAC  83EC08            sub esp,byte +0x8
00004CAF  6A11              push byte +0x11
00004CB1  68D4030000        push dword 0x3d4
00004CB6  E897E7FFFF        call 0x3452
00004CBB  83C410            add esp,byte +0x10
00004CBE  83EC0C            sub esp,byte +0xc
00004CC1  68D5030000        push dword 0x3d5
00004CC6  E86AE7FFFF        call 0x3435
00004CCB  83C410            add esp,byte +0x10
00004CCE  0FB6C0            movzx eax,al
00004CD1  83E07F            and eax,byte +0x7f
00004CD4  83EC08            sub esp,byte +0x8
00004CD7  50                push eax
00004CD8  68D5030000        push dword 0x3d5
00004CDD  E870E7FFFF        call 0x3452
00004CE2  83C410            add esp,byte +0x10
00004CE5  8B4508            mov eax,[ebp+0x8]
00004CE8  83C003            add eax,byte +0x3
00004CEB  0FB610            movzx edx,byte [eax]
00004CEE  8B4508            mov eax,[ebp+0x8]
00004CF1  83C003            add eax,byte +0x3
00004CF4  83CA80            or edx,byte -0x80
00004CF7  8810              mov [eax],dl
00004CF9  8B4508            mov eax,[ebp+0x8]
00004CFC  83C011            add eax,byte +0x11
00004CFF  0FB610            movzx edx,byte [eax]
00004D02  8B4508            mov eax,[ebp+0x8]
00004D05  83C011            add eax,byte +0x11
00004D08  83E27F            and edx,byte +0x7f
00004D0B  8810              mov [eax],dl
00004D0D  C745F400000000    mov dword [ebp-0xc],0x0
00004D14  EB39              jmp short 0x4d4f
00004D16  8B45F4            mov eax,[ebp-0xc]
00004D19  0FB6C0            movzx eax,al
00004D1C  83EC08            sub esp,byte +0x8
00004D1F  50                push eax
00004D20  68D4030000        push dword 0x3d4
00004D25  E828E7FFFF        call 0x3452
00004D2A  83C410            add esp,byte +0x10
00004D2D  8B4508            mov eax,[ebp+0x8]
00004D30  0FB600            movzx eax,byte [eax]
00004D33  0FB6C0            movzx eax,al
00004D36  83EC08            sub esp,byte +0x8
00004D39  50                push eax
00004D3A  68D5030000        push dword 0x3d5
00004D3F  E80EE7FFFF        call 0x3452
00004D44  83C410            add esp,byte +0x10
00004D47  83450801          add dword [ebp+0x8],byte +0x1
00004D4B  8345F401          add dword [ebp-0xc],byte +0x1
00004D4F  837DF418          cmp dword [ebp-0xc],byte +0x18
00004D53  76C1              jna 0x4d16
00004D55  C745F400000000    mov dword [ebp-0xc],0x0
00004D5C  EB39              jmp short 0x4d97
00004D5E  8B45F4            mov eax,[ebp-0xc]
00004D61  0FB6C0            movzx eax,al
00004D64  83EC08            sub esp,byte +0x8
00004D67  50                push eax
00004D68  68CE030000        push dword 0x3ce
00004D6D  E8E0E6FFFF        call 0x3452
00004D72  83C410            add esp,byte +0x10
00004D75  8B4508            mov eax,[ebp+0x8]
00004D78  0FB600            movzx eax,byte [eax]
00004D7B  0FB6C0            movzx eax,al
00004D7E  83EC08            sub esp,byte +0x8
00004D81  50                push eax
00004D82  68CF030000        push dword 0x3cf
00004D87  E8C6E6FFFF        call 0x3452
00004D8C  83C410            add esp,byte +0x10
00004D8F  83450801          add dword [ebp+0x8],byte +0x1
00004D93  8345F401          add dword [ebp-0xc],byte +0x1
00004D97  837DF408          cmp dword [ebp-0xc],byte +0x8
00004D9B  76C1              jna 0x4d5e
00004D9D  C745F400000000    mov dword [ebp-0xc],0x0
00004DA4  EB49              jmp short 0x4def
00004DA6  83EC0C            sub esp,byte +0xc
00004DA9  68DA030000        push dword 0x3da
00004DAE  E882E6FFFF        call 0x3435
00004DB3  83C410            add esp,byte +0x10
00004DB6  8B45F4            mov eax,[ebp-0xc]
00004DB9  0FB6C0            movzx eax,al
00004DBC  83EC08            sub esp,byte +0x8
00004DBF  50                push eax
00004DC0  68C0030000        push dword 0x3c0
00004DC5  E888E6FFFF        call 0x3452
00004DCA  83C410            add esp,byte +0x10
00004DCD  8B4508            mov eax,[ebp+0x8]
00004DD0  0FB600            movzx eax,byte [eax]
00004DD3  0FB6C0            movzx eax,al
00004DD6  83EC08            sub esp,byte +0x8
00004DD9  50                push eax
00004DDA  68C0030000        push dword 0x3c0
00004DDF  E86EE6FFFF        call 0x3452
00004DE4  83C410            add esp,byte +0x10
00004DE7  83450801          add dword [ebp+0x8],byte +0x1
00004DEB  8345F401          add dword [ebp-0xc],byte +0x1
00004DEF  837DF414          cmp dword [ebp-0xc],byte +0x14
00004DF3  76B1              jna 0x4da6
00004DF5  83EC0C            sub esp,byte +0xc
00004DF8  68DA030000        push dword 0x3da
00004DFD  E833E6FFFF        call 0x3435
00004E02  83C410            add esp,byte +0x10
00004E05  83EC08            sub esp,byte +0x8
00004E08  6A20              push byte +0x20
00004E0A  68C0030000        push dword 0x3c0
00004E0F  E83EE6FFFF        call 0x3452
00004E14  83C410            add esp,byte +0x10
00004E17  90                nop
00004E18  C9                leave
00004E19  C3                ret
00004E1A  55                push ebp
00004E1B  89E5              mov ebp,esp
00004E1D  83EC18            sub esp,byte +0x18
00004E20  83650803          and dword [ebp+0x8],byte +0x3
00004E24  8B4508            mov eax,[ebp+0x8]
00004E27  BA01000000        mov edx,0x1
00004E2C  89C1              mov ecx,eax
00004E2E  D3E2              shl edx,cl
00004E30  89D0              mov eax,edx
00004E32  8845F7            mov [ebp-0x9],al
00004E35  83EC08            sub esp,byte +0x8
00004E38  6A04              push byte +0x4
00004E3A  68CE030000        push dword 0x3ce
00004E3F  E80EE6FFFF        call 0x3452
00004E44  83C410            add esp,byte +0x10
00004E47  8B4508            mov eax,[ebp+0x8]
00004E4A  0FB6C0            movzx eax,al
00004E4D  83EC08            sub esp,byte +0x8
00004E50  50                push eax
00004E51  68CF030000        push dword 0x3cf
00004E56  E8F7E5FFFF        call 0x3452
00004E5B  83C410            add esp,byte +0x10
00004E5E  83EC08            sub esp,byte +0x8
00004E61  6A02              push byte +0x2
00004E63  68C4030000        push dword 0x3c4
00004E68  E8E5E5FFFF        call 0x3452
00004E6D  83C410            add esp,byte +0x10
00004E70  0FB645F7          movzx eax,byte [ebp-0x9]
00004E74  83EC08            sub esp,byte +0x8
00004E77  50                push eax
00004E78  68C5030000        push dword 0x3c5
00004E7D  E8D0E5FFFF        call 0x3452
00004E82  83C410            add esp,byte +0x10
00004E85  90                nop
00004E86  C9                leave
00004E87  C3                ret
00004E88  55                push ebp
00004E89  89E5              mov ebp,esp
00004E8B  83EC18            sub esp,byte +0x18
00004E8E  83EC08            sub esp,byte +0x8
00004E91  6A06              push byte +0x6
00004E93  68CE030000        push dword 0x3ce
00004E98  E8B5E5FFFF        call 0x3452
00004E9D  83C410            add esp,byte +0x10
00004EA0  83EC0C            sub esp,byte +0xc
00004EA3  68CF030000        push dword 0x3cf
00004EA8  E888E5FFFF        call 0x3435
00004EAD  83C410            add esp,byte +0x10
00004EB0  0FB6C0            movzx eax,al
00004EB3  8945F4            mov [ebp-0xc],eax
00004EB6  C16DF402          shr dword [ebp-0xc],byte 0x2
00004EBA  8365F403          and dword [ebp-0xc],byte +0x3
00004EBE  837DF403          cmp dword [ebp-0xc],byte +0x3
00004EC2  7426              jz 0x4eea
00004EC4  837DF403          cmp dword [ebp-0xc],byte +0x3
00004EC8  7728              ja 0x4ef2
00004ECA  837DF401          cmp dword [ebp-0xc],byte +0x1
00004ECE  7608              jna 0x4ed8
00004ED0  837DF402          cmp dword [ebp-0xc],byte +0x2
00004ED4  740B              jz 0x4ee1
00004ED6  EB1A              jmp short 0x4ef2
00004ED8  C745F400A00000    mov dword [ebp-0xc],0xa000
00004EDF  EB11              jmp short 0x4ef2
00004EE1  C745F400B00000    mov dword [ebp-0xc],0xb000
00004EE8  EB08              jmp short 0x4ef2
00004EEA  C745F400B80000    mov dword [ebp-0xc],0xb800
00004EF1  90                nop
00004EF2  8B45F4            mov eax,[ebp-0xc]
00004EF5  C9                leave
00004EF6  C3                ret
00004EF7  55                push ebp
00004EF8  89E5              mov ebp,esp
00004EFA  83EC08            sub esp,byte +0x8
00004EFD  E886FFFFFF        call 0x4e88
00004F02  8B5508            mov edx,[ebp+0x8]
00004F05  01D0              add eax,edx
00004F07  83EC04            sub esp,byte +0x4
00004F0A  FF7510            push dword [ebp+0x10]
00004F0D  FF750C            push dword [ebp+0xc]
00004F10  50                push eax
00004F11  E896E8FFFF        call 0x37ac
00004F16  83C410            add esp,byte +0x10
00004F19  90                nop
00004F1A  C9                leave
00004F1B  C3                ret
00004F1C  55                push ebp
00004F1D  89E5              mov ebp,esp
00004F1F  83EC08            sub esp,byte +0x8
00004F22  E861FFFFFF        call 0x4e88
00004F27  8B5508            mov edx,[ebp+0x8]
00004F2A  01D0              add eax,edx
00004F2C  8B550C            mov edx,[ebp+0xc]
00004F2F  8810              mov [eax],dl
00004F31  90                nop
00004F32  C9                leave
00004F33  C3                ret
00004F34  55                push ebp
00004F35  89E5              mov ebp,esp
00004F37  83EC08            sub esp,byte +0x8
00004F3A  E849FFFFFF        call 0x4e88
00004F3F  8B5508            mov edx,[ebp+0x8]
00004F42  01D0              add eax,edx
00004F44  0FB600            movzx eax,byte [eax]
00004F47  0FB6C0            movzx eax,al
00004F4A  C9                leave
00004F4B  C3                ret
00004F4C  55                push ebp
00004F4D  89E5              mov ebp,esp
00004F4F  83EC18            sub esp,byte +0x18
00004F52  83EC08            sub esp,byte +0x8
00004F55  6A02              push byte +0x2
00004F57  68C4030000        push dword 0x3c4
00004F5C  E8F1E4FFFF        call 0x3452
00004F61  83C410            add esp,byte +0x10
00004F64  83EC0C            sub esp,byte +0xc
00004F67  68C5030000        push dword 0x3c5
00004F6C  E8C4E4FFFF        call 0x3435
00004F71  83C410            add esp,byte +0x10
00004F74  8845F3            mov [ebp-0xd],al
00004F77  83EC08            sub esp,byte +0x8
00004F7A  6A04              push byte +0x4
00004F7C  68C4030000        push dword 0x3c4
00004F81  E8CCE4FFFF        call 0x3452
00004F86  83C410            add esp,byte +0x10
00004F89  83EC0C            sub esp,byte +0xc
00004F8C  68C5030000        push dword 0x3c5
00004F91  E89FE4FFFF        call 0x3435
00004F96  83C410            add esp,byte +0x10
00004F99  8845F2            mov [ebp-0xe],al
00004F9C  0FB645F2          movzx eax,byte [ebp-0xe]
00004FA0  83C804            or eax,byte +0x4
00004FA3  0FB6C0            movzx eax,al
00004FA6  83EC08            sub esp,byte +0x8
00004FA9  50                push eax
00004FAA  68C5030000        push dword 0x3c5
00004FAF  E89EE4FFFF        call 0x3452
00004FB4  83C410            add esp,byte +0x10
00004FB7  83EC08            sub esp,byte +0x8
00004FBA  6A04              push byte +0x4
00004FBC  68CE030000        push dword 0x3ce
00004FC1  E88CE4FFFF        call 0x3452
00004FC6  83C410            add esp,byte +0x10
00004FC9  83EC0C            sub esp,byte +0xc
00004FCC  68CF030000        push dword 0x3cf
00004FD1  E85FE4FFFF        call 0x3435
00004FD6  83C410            add esp,byte +0x10
00004FD9  8845F1            mov [ebp-0xf],al
00004FDC  83EC08            sub esp,byte +0x8
00004FDF  6A05              push byte +0x5
00004FE1  68CE030000        push dword 0x3ce
00004FE6  E867E4FFFF        call 0x3452
00004FEB  83C410            add esp,byte +0x10
00004FEE  83EC0C            sub esp,byte +0xc
00004FF1  68CF030000        push dword 0x3cf
00004FF6  E83AE4FFFF        call 0x3435
00004FFB  83C410            add esp,byte +0x10
00004FFE  8845F0            mov [ebp-0x10],al
00005001  0FB645F0          movzx eax,byte [ebp-0x10]
00005005  25EF000000        and eax,0xef
0000500A  83EC08            sub esp,byte +0x8
0000500D  50                push eax
0000500E  68CF030000        push dword 0x3cf
00005013  E83AE4FFFF        call 0x3452
00005018  83C410            add esp,byte +0x10
0000501B  83EC08            sub esp,byte +0x8
0000501E  6A06              push byte +0x6
00005020  68CE030000        push dword 0x3ce
00005025  E828E4FFFF        call 0x3452
0000502A  83C410            add esp,byte +0x10
0000502D  83EC0C            sub esp,byte +0xc
00005030  68CF030000        push dword 0x3cf
00005035  E8FBE3FFFF        call 0x3435
0000503A  83C410            add esp,byte +0x10
0000503D  8845EF            mov [ebp-0x11],al
00005040  0FB645EF          movzx eax,byte [ebp-0x11]
00005044  25FD000000        and eax,0xfd
00005049  83EC08            sub esp,byte +0x8
0000504C  50                push eax
0000504D  68CF030000        push dword 0x3cf
00005052  E8FBE3FFFF        call 0x3452
00005057  83C410            add esp,byte +0x10
0000505A  83EC0C            sub esp,byte +0xc
0000505D  6A02              push byte +0x2
0000505F  E8B6FDFFFF        call 0x4e1a
00005064  83C410            add esp,byte +0x10
00005067  C745F400000000    mov dword [ebp-0xc],0x0
0000506E  EB22              jmp short 0x5092
00005070  8B45F4            mov eax,[ebp-0xc]
00005073  C1E005            shl eax,byte 0x5
00005076  83EC04            sub esp,byte +0x4
00005079  FF750C            push dword [ebp+0xc]
0000507C  FF7508            push dword [ebp+0x8]
0000507F  50                push eax
00005080  E872FEFFFF        call 0x4ef7
00005085  83C410            add esp,byte +0x10
00005088  8B450C            mov eax,[ebp+0xc]
0000508B  014508            add [ebp+0x8],eax
0000508E  8345F401          add dword [ebp-0xc],byte +0x1
00005092  817DF4FF000000    cmp dword [ebp-0xc],0xff
00005099  76D5              jna 0x5070
0000509B  83EC08            sub esp,byte +0x8
0000509E  6A02              push byte +0x2
000050A0  68C4030000        push dword 0x3c4
000050A5  E8A8E3FFFF        call 0x3452
000050AA  83C410            add esp,byte +0x10
000050AD  0FB645F3          movzx eax,byte [ebp-0xd]
000050B1  83EC08            sub esp,byte +0x8
000050B4  50                push eax
000050B5  68C5030000        push dword 0x3c5
000050BA  E893E3FFFF        call 0x3452
000050BF  83C410            add esp,byte +0x10
000050C2  83EC08            sub esp,byte +0x8
000050C5  6A04              push byte +0x4
000050C7  68C4030000        push dword 0x3c4
000050CC  E881E3FFFF        call 0x3452
000050D1  83C410            add esp,byte +0x10
000050D4  0FB645F2          movzx eax,byte [ebp-0xe]
000050D8  83EC08            sub esp,byte +0x8
000050DB  50                push eax
000050DC  68C5030000        push dword 0x3c5
000050E1  E86CE3FFFF        call 0x3452
000050E6  83C410            add esp,byte +0x10
000050E9  83EC08            sub esp,byte +0x8
000050EC  6A04              push byte +0x4
000050EE  68CE030000        push dword 0x3ce
000050F3  E85AE3FFFF        call 0x3452
000050F8  83C410            add esp,byte +0x10
000050FB  0FB645F1          movzx eax,byte [ebp-0xf]
000050FF  83EC08            sub esp,byte +0x8
00005102  50                push eax
00005103  68CF030000        push dword 0x3cf
00005108  E845E3FFFF        call 0x3452
0000510D  83C410            add esp,byte +0x10
00005110  83EC08            sub esp,byte +0x8
00005113  6A05              push byte +0x5
00005115  68CE030000        push dword 0x3ce
0000511A  E833E3FFFF        call 0x3452
0000511F  83C410            add esp,byte +0x10
00005122  0FB645F0          movzx eax,byte [ebp-0x10]
00005126  83EC08            sub esp,byte +0x8
00005129  50                push eax
0000512A  68CF030000        push dword 0x3cf
0000512F  E81EE3FFFF        call 0x3452
00005134  83C410            add esp,byte +0x10
00005137  83EC08            sub esp,byte +0x8
0000513A  6A06              push byte +0x6
0000513C  68CE030000        push dword 0x3ce
00005141  E80CE3FFFF        call 0x3452
00005146  83C410            add esp,byte +0x10
00005149  0FB645EF          movzx eax,byte [ebp-0x11]
0000514D  83EC08            sub esp,byte +0x8
00005150  50                push eax
00005151  68CF030000        push dword 0x3cf
00005156  E8F7E2FFFF        call 0x3452
0000515B  83C410            add esp,byte +0x10
0000515E  90                nop
0000515F  C9                leave
00005160  C3                ret
00005161  55                push ebp
00005162  89E5              mov ebp,esp
00005164  83EC18            sub esp,byte +0x18
00005167  8B4510            mov eax,[ebp+0x10]
0000516A  83E001            and eax,byte +0x1
0000516D  89C2              mov edx,eax
0000516F  89D0              mov eax,edx
00005171  C1E008            shl eax,byte 0x8
00005174  29D0              sub eax,edx
00005176  894510            mov [ebp+0x10],eax
00005179  A124D82000        mov eax,[0x20d824]
0000517E  C1E803            shr eax,byte 0x3
00005181  8945F4            mov [ebp-0xc],eax
00005184  8B45F4            mov eax,[ebp-0xc]
00005187  0FAF450C          imul eax,[ebp+0xc]
0000518B  89C2              mov edx,eax
0000518D  8B4508            mov eax,[ebp+0x8]
00005190  C1E803            shr eax,byte 0x3
00005193  01D0              add eax,edx
00005195  8945F0            mov [ebp-0x10],eax
00005198  83650807          and dword [ebp+0x8],byte +0x7
0000519C  8B4508            mov eax,[ebp+0x8]
0000519F  BA80000000        mov edx,0x80
000051A4  89C1              mov ecx,eax
000051A6  D3FA              sar edx,cl
000051A8  89D0              mov eax,edx
000051AA  8945EC            mov [ebp-0x14],eax
000051AD  83EC0C            sub esp,byte +0xc
000051B0  FF75F0            push dword [ebp-0x10]
000051B3  E87CFDFFFF        call 0x4f34
000051B8  83C410            add esp,byte +0x10
000051BB  89C2              mov edx,eax
000051BD  8B45EC            mov eax,[ebp-0x14]
000051C0  F7D0              not eax
000051C2  21C2              and edx,eax
000051C4  8B4510            mov eax,[ebp+0x10]
000051C7  2345EC            and eax,[ebp-0x14]
000051CA  09D0              or eax,edx
000051CC  83EC08            sub esp,byte +0x8
000051CF  50                push eax
000051D0  FF75F0            push dword [ebp-0x10]
000051D3  E844FDFFFF        call 0x4f1c
000051D8  83C410            add esp,byte +0x10
000051DB  90                nop
000051DC  C9                leave
000051DD  C3                ret
000051DE  55                push ebp
000051DF  89E5              mov ebp,esp
000051E1  83EC18            sub esp,byte +0x18
000051E4  8B4510            mov eax,[ebp+0x10]
000051E7  83E003            and eax,byte +0x3
000051EA  6BC055            imul eax,eax,byte +0x55
000051ED  894510            mov [ebp+0x10],eax
000051F0  A124D82000        mov eax,[0x20d824]
000051F5  C1E802            shr eax,byte 0x2
000051F8  8945F4            mov [ebp-0xc],eax
000051FB  8B45F4            mov eax,[ebp-0xc]
000051FE  0FAF450C          imul eax,[ebp+0xc]
00005202  89C2              mov edx,eax
00005204  8B4508            mov eax,[ebp+0x8]
00005207  C1E802            shr eax,byte 0x2
0000520A  01D0              add eax,edx
0000520C  8945F0            mov [ebp-0x10],eax
0000520F  8B4508            mov eax,[ebp+0x8]
00005212  83E003            and eax,byte +0x3
00005215  01C0              add eax,eax
00005217  894508            mov [ebp+0x8],eax
0000521A  8B4508            mov eax,[ebp+0x8]
0000521D  BAC0000000        mov edx,0xc0
00005222  89C1              mov ecx,eax
00005224  D3FA              sar edx,cl
00005226  89D0              mov eax,edx
00005228  8945EC            mov [ebp-0x14],eax
0000522B  83EC0C            sub esp,byte +0xc
0000522E  FF75F0            push dword [ebp-0x10]
00005231  E8FEFCFFFF        call 0x4f34
00005236  83C410            add esp,byte +0x10
00005239  89C2              mov edx,eax
0000523B  8B45EC            mov eax,[ebp-0x14]
0000523E  F7D0              not eax
00005240  21C2              and edx,eax
00005242  8B4510            mov eax,[ebp+0x10]
00005245  2345EC            and eax,[ebp-0x14]
00005248  09D0              or eax,edx
0000524A  83EC08            sub esp,byte +0x8
0000524D  50                push eax
0000524E  FF75F0            push dword [ebp-0x10]
00005251  E8C6FCFFFF        call 0x4f1c
00005256  83C410            add esp,byte +0x10
00005259  90                nop
0000525A  C9                leave
0000525B  C3                ret
0000525C  55                push ebp
0000525D  89E5              mov ebp,esp
0000525F  83EC28            sub esp,byte +0x28
00005262  A124D82000        mov eax,[0x20d824]
00005267  C1E803            shr eax,byte 0x3
0000526A  8945EC            mov [ebp-0x14],eax
0000526D  8B45EC            mov eax,[ebp-0x14]
00005270  0FAF450C          imul eax,[ebp+0xc]
00005274  89C2              mov edx,eax
00005276  8B4508            mov eax,[ebp+0x8]
00005279  C1E803            shr eax,byte 0x3
0000527C  01D0              add eax,edx
0000527E  8945E8            mov [ebp-0x18],eax
00005281  83650807          and dword [ebp+0x8],byte +0x7
00005285  8B4508            mov eax,[ebp+0x8]
00005288  BA80000000        mov edx,0x80
0000528D  89C1              mov ecx,eax
0000528F  D3FA              sar edx,cl
00005291  89D0              mov eax,edx
00005293  8945E4            mov [ebp-0x1c],eax
00005296  C745F001000000    mov dword [ebp-0x10],0x1
0000529D  C745F400000000    mov dword [ebp-0xc],0x0
000052A4  EB67              jmp short 0x530d
000052A6  83EC0C            sub esp,byte +0xc
000052A9  FF75F4            push dword [ebp-0xc]
000052AC  E869FBFFFF        call 0x4e1a
000052B1  83C410            add esp,byte +0x10
000052B4  8B45F0            mov eax,[ebp-0x10]
000052B7  234510            and eax,[ebp+0x10]
000052BA  85C0              test eax,eax
000052BC  7422              jz 0x52e0
000052BE  83EC0C            sub esp,byte +0xc
000052C1  FF75E8            push dword [ebp-0x18]
000052C4  E86BFCFFFF        call 0x4f34
000052C9  83C410            add esp,byte +0x10
000052CC  0B45E4            or eax,[ebp-0x1c]
000052CF  83EC08            sub esp,byte +0x8
000052D2  50                push eax
000052D3  FF75E8            push dword [ebp-0x18]
000052D6  E841FCFFFF        call 0x4f1c
000052DB  83C410            add esp,byte +0x10
000052DE  EB26              jmp short 0x5306
000052E0  83EC0C            sub esp,byte +0xc
000052E3  FF75E8            push dword [ebp-0x18]
000052E6  E849FCFFFF        call 0x4f34
000052EB  83C410            add esp,byte +0x10
000052EE  89C2              mov edx,eax
000052F0  8B45E4            mov eax,[ebp-0x1c]
000052F3  F7D0              not eax
000052F5  21D0              and eax,edx
000052F7  83EC08            sub esp,byte +0x8
000052FA  50                push eax
000052FB  FF75E8            push dword [ebp-0x18]
000052FE  E819FCFFFF        call 0x4f1c
00005303  83C410            add esp,byte +0x10
00005306  D165F0            shl dword [ebp-0x10],1
00005309  8345F401          add dword [ebp-0xc],byte +0x1
0000530D  837DF403          cmp dword [ebp-0xc],byte +0x3
00005311  7693              jna 0x52a6
00005313  90                nop
00005314  90                nop
00005315  C9                leave
00005316  C3                ret
00005317  55                push ebp
00005318  89E5              mov ebp,esp
0000531A  83EC18            sub esp,byte +0x18
0000531D  A124D82000        mov eax,[0x20d824]
00005322  8945F4            mov [ebp-0xc],eax
00005325  8B45F4            mov eax,[ebp-0xc]
00005328  0FAF450C          imul eax,[ebp+0xc]
0000532C  89C2              mov edx,eax
0000532E  8B4508            mov eax,[ebp+0x8]
00005331  01D0              add eax,edx
00005333  8945F0            mov [ebp-0x10],eax
00005336  83EC08            sub esp,byte +0x8
00005339  FF7510            push dword [ebp+0x10]
0000533C  FF75F0            push dword [ebp-0x10]
0000533F  E8D8FBFFFF        call 0x4f1c
00005344  83C410            add esp,byte +0x10
00005347  90                nop
00005348  C9                leave
00005349  C3                ret
0000534A  55                push ebp
0000534B  89E5              mov ebp,esp
0000534D  83EC18            sub esp,byte +0x18
00005350  A124D82000        mov eax,[0x20d824]
00005355  C1E802            shr eax,byte 0x2
00005358  8945F4            mov [ebp-0xc],eax
0000535B  8B45F4            mov eax,[ebp-0xc]
0000535E  0FAF450C          imul eax,[ebp+0xc]
00005362  89C2              mov edx,eax
00005364  8B4508            mov eax,[ebp+0x8]
00005367  C1E802            shr eax,byte 0x2
0000536A  01D0              add eax,edx
0000536C  8945F0            mov [ebp-0x10],eax
0000536F  8B4508            mov eax,[ebp+0x8]
00005372  83E003            and eax,byte +0x3
00005375  83EC0C            sub esp,byte +0xc
00005378  50                push eax
00005379  E89CFAFFFF        call 0x4e1a
0000537E  83C410            add esp,byte +0x10
00005381  83EC08            sub esp,byte +0x8
00005384  FF7510            push dword [ebp+0x10]
00005387  FF75F0            push dword [ebp-0x10]
0000538A  E88DFBFFFF        call 0x4f1c
0000538F  83C410            add esp,byte +0x10
00005392  90                nop
00005393  C9                leave
00005394  C3                ret
00005395  55                push ebp
00005396  89E5              mov ebp,esp
00005398  83EC18            sub esp,byte +0x18
0000539B  C745F000000000    mov dword [ebp-0x10],0x0
000053A2  EB30              jmp short 0x53d4
000053A4  C745F400000000    mov dword [ebp-0xc],0x0
000053AB  EB19              jmp short 0x53c6
000053AD  A120D82000        mov eax,[0x20d820]
000053B2  83EC04            sub esp,byte +0x4
000053B5  6A00              push byte +0x0
000053B7  FF75F0            push dword [ebp-0x10]
000053BA  FF75F4            push dword [ebp-0xc]
000053BD  FFD0              call eax
000053BF  83C410            add esp,byte +0x10
000053C2  8345F401          add dword [ebp-0xc],byte +0x1
000053C6  A124D82000        mov eax,[0x20d824]
000053CB  3945F4            cmp [ebp-0xc],eax
000053CE  72DD              jc 0x53ad
000053D0  8345F001          add dword [ebp-0x10],byte +0x1
000053D4  A128D82000        mov eax,[0x20d828]
000053D9  3945F0            cmp [ebp-0x10],eax
000053DC  72C6              jc 0x53a4
000053DE  C745F000000000    mov dword [ebp-0x10],0x0
000053E5  EB54              jmp short 0x543b
000053E7  A120D82000        mov eax,[0x20d820]
000053EC  8B1524D82000      mov edx,[dword 0x20d824]
000053F2  8B0D28D82000      mov ecx,[dword 0x20d828]
000053F8  29CA              sub edx,ecx
000053FA  89D1              mov ecx,edx
000053FC  D1E9              shr ecx,1
000053FE  8B55F0            mov edx,[ebp-0x10]
00005401  01CA              add edx,ecx
00005403  83EC04            sub esp,byte +0x4
00005406  6A01              push byte +0x1
00005408  FF75F0            push dword [ebp-0x10]
0000540B  52                push edx
0000540C  FFD0              call eax
0000540E  83C410            add esp,byte +0x10
00005411  A120D82000        mov eax,[0x20d820]
00005416  8B0D28D82000      mov ecx,[dword 0x20d828]
0000541C  8B1524D82000      mov edx,[dword 0x20d824]
00005422  01CA              add edx,ecx
00005424  D1EA              shr edx,1
00005426  2B55F0            sub edx,[ebp-0x10]
00005429  83EC04            sub esp,byte +0x4
0000542C  6A02              push byte +0x2
0000542E  FF75F0            push dword [ebp-0x10]
00005431  52                push edx
00005432  FFD0              call eax
00005434  83C410            add esp,byte +0x10
00005437  8345F001          add dword [ebp-0x10],byte +0x1
0000543B  A128D82000        mov eax,[0x20d828]
00005440  3945F0            cmp [ebp-0x10],eax
00005443  72A2              jc 0x53e7
00005445  E8BDDFFFFF        call 0x3407
0000544A  90                nop
0000544B  C9                leave
0000544C  C3                ret
0000544D  55                push ebp
0000544E  89E5              mov ebp,esp
00005450  83EC48            sub esp,byte +0x48
00005453  83EC0C            sub esp,byte +0xc
00005456  8D45BB            lea eax,[ebp-0x45]
00005459  50                push eax
0000545A  E848F6FFFF        call 0x4aa7
0000545F  83C410            add esp,byte +0x10
00005462  83EC0C            sub esp,byte +0xc
00005465  8D45BB            lea eax,[ebp-0x45]
00005468  50                push eax
00005469  E842F5FFFF        call 0x49b0
0000546E  83C410            add esp,byte +0x10
00005471  90                nop
00005472  C9                leave
00005473  C3                ret
00005474  55                push ebp
00005475  89E5              mov ebp,esp
00005477  83EC18            sub esp,byte +0x18
0000547A  837D0800          cmp dword [ebp+0x8],byte +0x0
0000547E  7427              jz 0x54a7
00005480  83EC0C            sub esp,byte +0xc
00005483  68E08B1000        push dword 0x108be0
00005488  E87AF7FFFF        call 0x4c07
0000548D  83C410            add esp,byte +0x10
00005490  C745F05A000000    mov dword [ebp-0x10],0x5a
00005497  C745F43C000000    mov dword [ebp-0xc],0x3c
0000549E  C745EC08000000    mov dword [ebp-0x14],0x8
000054A5  EB25              jmp short 0x54cc
000054A7  83EC0C            sub esp,byte +0xc
000054AA  68208B1000        push dword 0x108b20
000054AF  E853F7FFFF        call 0x4c07
000054B4  83C410            add esp,byte +0x10
000054B7  C745F050000000    mov dword [ebp-0x10],0x50
000054BE  C745F419000000    mov dword [ebp-0xc],0x19
000054C5  C745EC10000000    mov dword [ebp-0x14],0x10
000054CC  837DEC0F          cmp dword [ebp-0x14],byte +0xf
000054D0  7614              jna 0x54e6
000054D2  83EC08            sub esp,byte +0x8
000054D5  6A10              push byte +0x10
000054D7  68A0951000        push dword 0x1095a0
000054DC  E86BFAFFFF        call 0x4f4c
000054E1  83C410            add esp,byte +0x10
000054E4  EB12              jmp short 0x54f8
000054E6  83EC08            sub esp,byte +0x8
000054E9  6A08              push byte +0x8
000054EB  68A08D1000        push dword 0x108da0
000054F0  E857FAFFFF        call 0x4f4c
000054F5  83C410            add esp,byte +0x10
000054F8  BA8A000000        mov edx,0x8a
000054FD  8B45F0            mov eax,[ebp-0x10]
00005500  668902            mov [edx],ax
00005503  8B45F0            mov eax,[ebp-0x10]
00005506  89C2              mov edx,eax
00005508  8B45F4            mov eax,[ebp-0xc]
0000550B  0FAFC2            imul eax,edx
0000550E  BA8C000000        mov edx,0x8c
00005513  01C0              add eax,eax
00005515  668902            mov [edx],ax
00005518  B890000000        mov eax,0x90
0000551D  66C7000000        mov word [eax],0x0
00005522  8B45EC            mov eax,[ebp-0x14]
00005525  BAA0000000        mov edx,0xa0
0000552A  83E801            sub eax,byte +0x1
0000552D  8802              mov [edx],al
0000552F  8B45EC            mov eax,[ebp-0x14]
00005532  BAA1000000        mov edx,0xa1
00005537  83E802            sub eax,byte +0x2
0000553A  8802              mov [edx],al
0000553C  8B45F4            mov eax,[ebp-0xc]
0000553F  BAC4000000        mov edx,0xc4
00005544  83E801            sub eax,byte +0x1
00005547  8802              mov [edx],al
00005549  B8C5000000        mov eax,0xc5
0000554E  8B55EC            mov edx,[ebp-0x14]
00005551  8810              mov [eax],dl
00005553  C745E800000000    mov dword [ebp-0x18],0x0
0000555A  EB11              jmp short 0x556d
0000555C  8B45E8            mov eax,[ebp-0x18]
0000555F  01C0              add eax,eax
00005561  0501B80000        add eax,0xb801
00005566  C60007            mov byte [eax],0x7
00005569  8345E801          add dword [ebp-0x18],byte +0x1
0000556D  8B45F0            mov eax,[ebp-0x10]
00005570  0FAF45F4          imul eax,[ebp-0xc]
00005574  3945E8            cmp [ebp-0x18],eax
00005577  72E3              jc 0x555c
00005579  90                nop
0000557A  90                nop
0000557B  C9                leave
0000557C  C3                ret
0000557D  55                push ebp
0000557E  89E5              mov ebp,esp
00005580  83EC08            sub esp,byte +0x8
00005583  83EC0C            sub esp,byte +0xc
00005586  68246F1000        push dword 0x106f24
0000558B  E8DAD6FFFF        call 0x2c6a
00005590  83C410            add esp,byte +0x10
00005593  E86FDEFFFF        call 0x3407
00005598  83EC0C            sub esp,byte +0xc
0000559B  68608C1000        push dword 0x108c60
000055A0  E862F6FFFF        call 0x4c07
000055A5  83C410            add esp,byte +0x10
000055A8  C70524D820004001  mov dword [dword 0x20d824],0x140
         -0000
000055B2  C70528D82000C800  mov dword [dword 0x20d828],0xc8
         -0000
000055BC  C70520D82000DE51  mov dword [dword 0x20d820],0x1051de
         -1000
000055C6  E8CAFDFFFF        call 0x5395
000055CB  83EC0C            sub esp,byte +0xc
000055CE  68A08C1000        push dword 0x108ca0
000055D3  E82FF6FFFF        call 0x4c07
000055D8  83C410            add esp,byte +0x10
000055DB  C70524D820008002  mov dword [dword 0x20d824],0x280
         -0000
000055E5  C70528D82000E001  mov dword [dword 0x20d828],0x1e0
         -0000
000055EF  C70520D820005C52  mov dword [dword 0x20d820],0x10525c
         -1000
000055F9  E897FDFFFF        call 0x5395
000055FE  83EC0C            sub esp,byte +0xc
00005601  68208D1000        push dword 0x108d20
00005606  E8FCF5FFFF        call 0x4c07
0000560B  83C410            add esp,byte +0x10
0000560E  C70524D820004001  mov dword [dword 0x20d824],0x140
         -0000
00005618  C70528D82000C800  mov dword [dword 0x20d828],0xc8
         -0000
00005622  C70520D820001753  mov dword [dword 0x20d820],0x105317
         -1000
0000562C  E864FDFFFF        call 0x5395
00005631  83EC0C            sub esp,byte +0xc
00005634  68608D1000        push dword 0x108d60
00005639  E8C9F5FFFF        call 0x4c07
0000563E  83C410            add esp,byte +0x10
00005641  C70524D820004001  mov dword [dword 0x20d824],0x140
         -0000
0000564B  C70528D82000C800  mov dword [dword 0x20d828],0xc8
         -0000
00005655  C70520D820004A53  mov dword [dword 0x20d820],0x10534a
         -1000
0000565F  E831FDFFFF        call 0x5395
00005664  83EC0C            sub esp,byte +0xc
00005667  6A00              push byte +0x0
00005669  E806FEFFFF        call 0x5474
0000566E  83C410            add esp,byte +0x10
00005671  90                nop
00005672  C9                leave
00005673  C3                ret
00005674  55                push ebp
00005675  89E5              mov ebp,esp
00005677  83EC14            sub esp,byte +0x14
0000567A  8B4508            mov eax,[ebp+0x8]
0000567D  8845EC            mov [ebp-0x14],al
00005680  C645FF00          mov byte [ebp-0x1],0x0
00005684  0FB645EC          movzx eax,byte [ebp-0x14]
00005688  83E001            and eax,byte +0x1
0000568B  85C0              test eax,eax
0000568D  7404              jz 0x5693
0000568F  804DFF80          or byte [ebp-0x1],0x80
00005693  0FB645EC          movzx eax,byte [ebp-0x14]
00005697  83E002            and eax,byte +0x2
0000569A  85C0              test eax,eax
0000569C  7404              jz 0x56a2
0000569E  804DFF40          or byte [ebp-0x1],0x40
000056A2  0FB645EC          movzx eax,byte [ebp-0x14]
000056A6  83E004            and eax,byte +0x4
000056A9  85C0              test eax,eax
000056AB  7404              jz 0x56b1
000056AD  804DFF20          or byte [ebp-0x1],0x20
000056B1  0FB645EC          movzx eax,byte [ebp-0x14]
000056B5  83E008            and eax,byte +0x8
000056B8  85C0              test eax,eax
000056BA  7404              jz 0x56c0
000056BC  804DFF10          or byte [ebp-0x1],0x10
000056C0  0FB645EC          movzx eax,byte [ebp-0x14]
000056C4  83E010            and eax,byte +0x10
000056C7  85C0              test eax,eax
000056C9  7404              jz 0x56cf
000056CB  804DFF08          or byte [ebp-0x1],0x8
000056CF  0FB645EC          movzx eax,byte [ebp-0x14]
000056D3  83E020            and eax,byte +0x20
000056D6  85C0              test eax,eax
000056D8  7404              jz 0x56de
000056DA  804DFF04          or byte [ebp-0x1],0x4
000056DE  0FB645EC          movzx eax,byte [ebp-0x14]
000056E2  83E040            and eax,byte +0x40
000056E5  85C0              test eax,eax
000056E7  7404              jz 0x56ed
000056E9  804DFF02          or byte [ebp-0x1],0x2
000056ED  0FB645EC          movzx eax,byte [ebp-0x14]
000056F1  84C0              test al,al
000056F3  7904              jns 0x56f9
000056F5  804DFF01          or byte [ebp-0x1],0x1
000056F9  0FB645FF          movzx eax,byte [ebp-0x1]
000056FD  C9                leave
000056FE  C3                ret
000056FF  55                push ebp
00005700  89E5              mov ebp,esp
00005702  83EC48            sub esp,byte +0x48
00005705  C745D421747865    mov dword [ebp-0x2c],0x65787421
0000570C  C745D874207364    mov dword [ebp-0x28],0x64732074
00005713  C745DC7261776B    mov dword [ebp-0x24],0x6b776172
0000571A  C745E063614200    mov dword [ebp-0x20],0x426163
00005721  C745C63F726F72    mov dword [ebp-0x3a],0x726f723f
00005728  C745CA72696D20    mov dword [ebp-0x36],0x206d6972
0000572F  C745CE6120746F    mov dword [ebp-0x32],0x6f742061
00005736  66C745D24700      mov word [ebp-0x2e],0x47
0000573C  83EC0C            sub esp,byte +0xc
0000573F  6A00              push byte +0x0
00005741  E82EFDFFFF        call 0x5474
00005746  83C410            add esp,byte +0x10
00005749  83EC08            sub esp,byte +0x8
0000574C  6A02              push byte +0x2
0000574E  68C4030000        push dword 0x3c4
00005753  E8FADCFFFF        call 0x3452
00005758  83C410            add esp,byte +0x10
0000575B  83EC0C            sub esp,byte +0xc
0000575E  68C5030000        push dword 0x3c5
00005763  E8CDDCFFFF        call 0x3435
00005768  83C410            add esp,byte +0x10
0000576B  8845EF            mov [ebp-0x11],al
0000576E  83EC08            sub esp,byte +0x8
00005771  6A04              push byte +0x4
00005773  68C4030000        push dword 0x3c4
00005778  E8D5DCFFFF        call 0x3452
0000577D  83C410            add esp,byte +0x10
00005780  83EC0C            sub esp,byte +0xc
00005783  68C5030000        push dword 0x3c5
00005788  E8A8DCFFFF        call 0x3435
0000578D  83C410            add esp,byte +0x10
00005790  8845EE            mov [ebp-0x12],al
00005793  0FB645EE          movzx eax,byte [ebp-0x12]
00005797  83C804            or eax,byte +0x4
0000579A  0FB6C0            movzx eax,al
0000579D  83EC08            sub esp,byte +0x8
000057A0  50                push eax
000057A1  68C5030000        push dword 0x3c5
000057A6  E8A7DCFFFF        call 0x3452
000057AB  83C410            add esp,byte +0x10
000057AE  83EC08            sub esp,byte +0x8
000057B1  6A04              push byte +0x4
000057B3  68CE030000        push dword 0x3ce
000057B8  E895DCFFFF        call 0x3452
000057BD  83C410            add esp,byte +0x10
000057C0  83EC0C            sub esp,byte +0xc
000057C3  68CF030000        push dword 0x3cf
000057C8  E868DCFFFF        call 0x3435
000057CD  83C410            add esp,byte +0x10
000057D0  8845ED            mov [ebp-0x13],al
000057D3  83EC08            sub esp,byte +0x8
000057D6  6A05              push byte +0x5
000057D8  68CE030000        push dword 0x3ce
000057DD  E870DCFFFF        call 0x3452
000057E2  83C410            add esp,byte +0x10
000057E5  83EC0C            sub esp,byte +0xc
000057E8  68CF030000        push dword 0x3cf
000057ED  E843DCFFFF        call 0x3435
000057F2  83C410            add esp,byte +0x10
000057F5  8845EC            mov [ebp-0x14],al
000057F8  0FB645EC          movzx eax,byte [ebp-0x14]
000057FC  25EF000000        and eax,0xef
00005801  83EC08            sub esp,byte +0x8
00005804  50                push eax
00005805  68CF030000        push dword 0x3cf
0000580A  E843DCFFFF        call 0x3452
0000580F  83C410            add esp,byte +0x10
00005812  83EC08            sub esp,byte +0x8
00005815  6A06              push byte +0x6
00005817  68CE030000        push dword 0x3ce
0000581C  E831DCFFFF        call 0x3452
00005821  83C410            add esp,byte +0x10
00005824  83EC0C            sub esp,byte +0xc
00005827  68CF030000        push dword 0x3cf
0000582C  E804DCFFFF        call 0x3435
00005831  83C410            add esp,byte +0x10
00005834  8845EB            mov [ebp-0x15],al
00005837  0FB645EB          movzx eax,byte [ebp-0x15]
0000583B  25FD000000        and eax,0xfd
00005840  83EC08            sub esp,byte +0x8
00005843  50                push eax
00005844  68CF030000        push dword 0x3cf
00005849  E804DCFFFF        call 0x3452
0000584E  83C410            add esp,byte +0x10
00005851  83EC0C            sub esp,byte +0xc
00005854  6A02              push byte +0x2
00005856  E8BFF5FFFF        call 0x4e1a
0000585B  83C410            add esp,byte +0x10
0000585E  C745E410000000    mov dword [ebp-0x1c],0x10
00005865  C745F400000000    mov dword [ebp-0xc],0x0
0000586C  EB60              jmp short 0x58ce
0000586E  C745F000000000    mov dword [ebp-0x10],0x0
00005875  EB4B              jmp short 0x58c2
00005877  8B45E4            mov eax,[ebp-0x1c]
0000587A  0FAF45F4          imul eax,[ebp-0xc]
0000587E  89C2              mov edx,eax
00005880  8B45F0            mov eax,[ebp-0x10]
00005883  01D0              add eax,edx
00005885  0FB680A0951000    movzx eax,byte [eax+0x1095a0]
0000588C  0FB6C0            movzx eax,al
0000588F  83EC0C            sub esp,byte +0xc
00005892  50                push eax
00005893  E8DCFDFFFF        call 0x5674
00005898  83C410            add esp,byte +0x10
0000589B  0FB6C0            movzx eax,al
0000589E  8B55F4            mov edx,[ebp-0xc]
000058A1  81C200020000      add edx,0x200
000058A7  89D1              mov ecx,edx
000058A9  C1E105            shl ecx,byte 0x5
000058AC  8B55F0            mov edx,[ebp-0x10]
000058AF  01CA              add edx,ecx
000058B1  83EC08            sub esp,byte +0x8
000058B4  50                push eax
000058B5  52                push edx
000058B6  E861F6FFFF        call 0x4f1c
000058BB  83C410            add esp,byte +0x10
000058BE  8345F001          add dword [ebp-0x10],byte +0x1
000058C2  8B45F0            mov eax,[ebp-0x10]
000058C5  3B45E4            cmp eax,[ebp-0x1c]
000058C8  72AD              jc 0x5877
000058CA  8345F401          add dword [ebp-0xc],byte +0x1
000058CE  817DF4FF000000    cmp dword [ebp-0xc],0xff
000058D5  7697              jna 0x586e
000058D7  83EC08            sub esp,byte +0x8
000058DA  6A02              push byte +0x2
000058DC  68C4030000        push dword 0x3c4
000058E1  E86CDBFFFF        call 0x3452
000058E6  83C410            add esp,byte +0x10
000058E9  0FB645EF          movzx eax,byte [ebp-0x11]
000058ED  83EC08            sub esp,byte +0x8
000058F0  50                push eax
000058F1  68C5030000        push dword 0x3c5
000058F6  E857DBFFFF        call 0x3452
000058FB  83C410            add esp,byte +0x10
000058FE  83EC08            sub esp,byte +0x8
00005901  6A04              push byte +0x4
00005903  68C4030000        push dword 0x3c4
00005908  E845DBFFFF        call 0x3452
0000590D  83C410            add esp,byte +0x10
00005910  0FB645EE          movzx eax,byte [ebp-0x12]
00005914  83EC08            sub esp,byte +0x8
00005917  50                push eax
00005918  68C5030000        push dword 0x3c5
0000591D  E830DBFFFF        call 0x3452
00005922  83C410            add esp,byte +0x10
00005925  83EC08            sub esp,byte +0x8
00005928  6A04              push byte +0x4
0000592A  68CE030000        push dword 0x3ce
0000592F  E81EDBFFFF        call 0x3452
00005934  83C410            add esp,byte +0x10
00005937  0FB645ED          movzx eax,byte [ebp-0x13]
0000593B  83EC08            sub esp,byte +0x8
0000593E  50                push eax
0000593F  68CF030000        push dword 0x3cf
00005944  E809DBFFFF        call 0x3452
00005949  83C410            add esp,byte +0x10
0000594C  83EC08            sub esp,byte +0x8
0000594F  6A05              push byte +0x5
00005951  68CE030000        push dword 0x3ce
00005956  E8F7DAFFFF        call 0x3452
0000595B  83C410            add esp,byte +0x10
0000595E  0FB645EC          movzx eax,byte [ebp-0x14]
00005962  83EC08            sub esp,byte +0x8
00005965  50                push eax
00005966  68CF030000        push dword 0x3cf
0000596B  E8E2DAFFFF        call 0x3452
00005970  83C410            add esp,byte +0x10
00005973  83EC08            sub esp,byte +0x8
00005976  6A06              push byte +0x6
00005978  68CE030000        push dword 0x3ce
0000597D  E8D0DAFFFF        call 0x3452
00005982  83C410            add esp,byte +0x10
00005985  0FB645EB          movzx eax,byte [ebp-0x15]
00005989  83EC08            sub esp,byte +0x8
0000598C  50                push eax
0000598D  68CF030000        push dword 0x3cf
00005992  E8BBDAFFFF        call 0x3452
00005997  83C410            add esp,byte +0x10
0000599A  83EC08            sub esp,byte +0x8
0000599D  6A03              push byte +0x3
0000599F  68C4030000        push dword 0x3c4
000059A4  E8A9DAFFFF        call 0x3452
000059A9  83C410            add esp,byte +0x10
000059AC  83EC08            sub esp,byte +0x8
000059AF  6A04              push byte +0x4
000059B1  68C5030000        push dword 0x3c5
000059B6  E897DAFFFF        call 0x3452
000059BB  83C410            add esp,byte +0x10
000059BE  C745F400000000    mov dword [ebp-0xc],0x0
000059C5  EB45              jmp short 0x5a0c
000059C7  8D55D4            lea edx,[ebp-0x2c]
000059CA  8B45F4            mov eax,[ebp-0xc]
000059CD  01D0              add eax,edx
000059CF  0FB600            movzx eax,byte [eax]
000059D2  0FBEC0            movsx eax,al
000059D5  8B55F4            mov edx,[ebp-0xc]
000059D8  81C2A8020000      add edx,0x2a8
000059DE  01D2              add edx,edx
000059E0  83EC08            sub esp,byte +0x8
000059E3  50                push eax
000059E4  52                push edx
000059E5  E832F5FFFF        call 0x4f1c
000059EA  83C410            add esp,byte +0x10
000059ED  8B45F4            mov eax,[ebp-0xc]
000059F0  05A8020000        add eax,0x2a8
000059F5  01C0              add eax,eax
000059F7  83C001            add eax,byte +0x1
000059FA  83EC08            sub esp,byte +0x8
000059FD  6A0F              push byte +0xf
000059FF  50                push eax
00005A00  E817F5FFFF        call 0x4f1c
00005A05  83C410            add esp,byte +0x10
00005A08  8345F401          add dword [ebp-0xc],byte +0x1
00005A0C  837DF40F          cmp dword [ebp-0xc],byte +0xf
00005A10  76B5              jna 0x59c7
00005A12  C745F400000000    mov dword [ebp-0xc],0x0
00005A19  EB45              jmp short 0x5a60
00005A1B  8D55C6            lea edx,[ebp-0x3a]
00005A1E  8B45F4            mov eax,[ebp-0xc]
00005A21  01D0              add eax,edx
00005A23  0FB600            movzx eax,byte [eax]
00005A26  0FBEC0            movsx eax,al
00005A29  8B55F4            mov edx,[ebp-0xc]
00005A2C  81C228050000      add edx,0x528
00005A32  01D2              add edx,edx
00005A34  83EC08            sub esp,byte +0x8
00005A37  50                push eax
00005A38  52                push edx
00005A39  E8DEF4FFFF        call 0x4f1c
00005A3E  83C410            add esp,byte +0x10
00005A41  8B45F4            mov eax,[ebp-0xc]
00005A44  0528050000        add eax,0x528
00005A49  01C0              add eax,eax
00005A4B  83C001            add eax,byte +0x1
00005A4E  83EC08            sub esp,byte +0x8
00005A51  6A0F              push byte +0xf
00005A53  50                push eax
00005A54  E8C3F4FFFF        call 0x4f1c
00005A59  83C410            add esp,byte +0x10
00005A5C  8345F401          add dword [ebp-0xc],byte +0x1
00005A60  837DF40D          cmp dword [ebp-0xc],byte +0xd
00005A64  76B5              jna 0x5a1b
00005A66  90                nop
00005A67  90                nop
00005A68  C9                leave
00005A69  C3                ret
00005A6A  55                push ebp
00005A6B  89E5              mov ebp,esp
00005A6D  83EC08            sub esp,byte +0x8
00005A70  83EC0C            sub esp,byte +0xc
00005A73  686D6F1000        push dword 0x106f6d
00005A78  E8D6C9FFFF        call 0x2453
00005A7D  83C410            add esp,byte +0x10
00005A80  E866CAFFFF        call 0x24eb
00005A85  B800000000        mov eax,0x0
00005A8A  C9                leave
00005A8B  C3                ret
00005A8C  0000              add [eax],al
00005A8E  0000              add [eax],al
00005A90  0000              add [eax],al
00005A92  0000              add [eax],al
00005A94  0000              add [eax],al
00005A96  0000              add [eax],al
00005A98  0000              add [eax],al
00005A9A  0000              add [eax],al
00005A9C  0000              add [eax],al
00005A9E  0000              add [eax],al
00005AA0  45                inc ebp
00005AA1  52                push edx
00005AA2  52                push edx
00005AA3  4F                dec edi
00005AA4  52                push edx
00005AA5  004573            add [ebp+0x73],al
00005AA8  6300              arpl [eax],ax
00005AAA  3100              xor [eax],eax
00005AAC  3200              xor al,[eax]
00005AAE  3300              xor eax,[eax]
00005AB0  3400              xor al,0x0
00005AB2  3500360037        xor eax,0x37003600
00005AB7  0038              add [eax],bh
00005AB9  0039              add [ecx],bh
00005ABB  0030              add [eax],dh
00005ABD  002D003D0042      add [dword 0x42003d00],ch
00005AC3  61                popa
00005AC4  636B73            arpl [ebx+0x73],bp
00005AC7  7061              jo 0x5b2a
00005AC9  636500            arpl [ebp+0x0],sp
00005ACC  54                push esp
00005ACD  61                popa
00005ACE  6200              bound eax,[eax]
00005AD0  51                push ecx
00005AD1  005700            add [edi+0x0],dl
00005AD4  45                inc ebp
00005AD5  005200            add [edx+0x0],dl
00005AD8  54                push esp
00005AD9  005A00            add [edx+0x0],bl
00005ADC  55                push ebp
00005ADD  004900            add [ecx+0x0],cl
00005AE0  4F                dec edi
00005AE1  005000            add [eax+0x0],dl
00005AE4  5B                pop ebx
00005AE5  005D00            add [ebp+0x0],bl
00005AE8  45                inc ebp
00005AE9  6E                outsb
00005AEA  7465              jz 0x5b51
00005AEC  7200              jc 0x5aee
00005AEE  4C                dec esp
00005AEF  6374726C          arpl [edx+esi*2+0x6c],si
00005AF3  004100            add [ecx+0x0],al
00005AF6  53                push ebx
00005AF7  00440046          add [eax+eax+0x46],al
00005AFB  004700            add [edi+0x0],al
00005AFE  48                dec eax
00005AFF  004A00            add [edx+0x0],cl
00005B02  4B                dec ebx
00005B03  004C003B          add [eax+eax+0x3b],cl
00005B07  0027              add [edi],ah
00005B09  006000            add [eax+0x0],ah
00005B0C  4C                dec esp
00005B0D  53                push ebx
00005B0E  6869667400        push dword 0x746669
00005B13  5C                pop esp
00005B14  005900            add [ecx+0x0],bl
00005B17  58                pop eax
00005B18  004300            add [ebx+0x0],al
00005B1B  56                push esi
00005B1C  004200            add [edx+0x0],al
00005B1F  4E                dec esi
00005B20  004D00            add [ebp+0x0],cl
00005B23  2C00              sub al,0x0
00005B25  2E002F            add [cs:edi],ch
00005B28  005253            add [edx+0x53],dl
00005B2B  6869667400        push dword 0x746669
00005B30  4B                dec ebx
00005B31  657970            gs jns 0x5ba4
00005B34  61                popa
00005B35  64202A            and [fs:edx],ch
00005B38  004C416C          add [ecx+eax*2+0x6c],cl
00005B3C  7400              jz 0x5b3e
00005B3E  53                push ebx
00005B3F  7061              jo 0x5ba2
00005B41  636562            arpl [ebp+0x62],sp
00005B44  61                popa
00005B45  7200              jc 0x5b47
00005B47  43                inc ebx
00005B48  61                popa
00005B49  7073              jo 0x5bbe
00005B4B  4C                dec esp
00005B4C  6F                outsd
00005B4D  636B00            arpl [ebx+0x0],bp
00005B50  46                inc esi
00005B51  3100              xor [eax],eax
00005B53  46                inc esi
00005B54  3200              xor al,[eax]
00005B56  46                inc esi
00005B57  3300              xor eax,[eax]
00005B59  46                inc esi
00005B5A  3400              xor al,0x0
00005B5C  46                inc esi
00005B5D  3500463600        xor eax,0x364600
00005B62  46                inc esi
00005B63  37                aaa
00005B64  004638            add [esi+0x38],al
00005B67  004639            add [esi+0x39],al
00005B6A  004631            add [esi+0x31],al
00005B6D  3000              xor [eax],al
00005B6F  4E                dec esi
00005B70  756D              jnz 0x5bdf
00005B72  4C                dec esp
00005B73  6F                outsd
00005B74  636B00            arpl [ebx+0x0],bp
00005B77  53                push ebx
00005B78  63726F            arpl [edx+0x6f],si
00005B7B  6C                insb
00005B7C  6C                insb
00005B7D  4C                dec esp
00005B7E  6F                outsd
00005B7F  636B00            arpl [ebx+0x0],bp
00005B82  4B                dec ebx
00005B83  657970            gs jns 0x5bf6
00005B86  61                popa
00005B87  642037            and [fs:edi],dh
00005B8A  004B65            add [ebx+0x65],cl
00005B8D  7970              jns 0x5bff
00005B8F  61                popa
00005B90  642038            and [fs:eax],bh
00005B93  004B65            add [ebx+0x65],cl
00005B96  7970              jns 0x5c08
00005B98  61                popa
00005B99  642039            and [fs:ecx],bh
00005B9C  004B65            add [ebx+0x65],cl
00005B9F  7970              jns 0x5c11
00005BA1  61                popa
00005BA2  64202D004B6579    and [dword fs:0x79654b00],ch
00005BA9  7061              jo 0x5c0c
00005BAB  64203400          and [fs:eax+eax],dh
00005BAF  4B                dec ebx
00005BB0  657970            gs jns 0x5c23
00005BB3  61                popa
00005BB4  642035004B6579    and [dword fs:0x79654b00],dh
00005BBB  7061              jo 0x5c1e
00005BBD  642036            and [fs:esi],dh
00005BC0  004B65            add [ebx+0x65],cl
00005BC3  7970              jns 0x5c35
00005BC5  61                popa
00005BC6  64202B            and [fs:ebx],ch
00005BC9  004B65            add [ebx+0x65],cl
00005BCC  7970              jns 0x5c3e
00005BCE  61                popa
00005BCF  642031            and [fs:ecx],dh
00005BD2  004B65            add [ebx+0x65],cl
00005BD5  7970              jns 0x5c47
00005BD7  61                popa
00005BD8  642032            and [fs:edx],dh
00005BDB  004B65            add [ebx+0x65],cl
00005BDE  7970              jns 0x5c50
00005BE0  61                popa
00005BE1  642033            and [fs:ebx],dh
00005BE4  004B65            add [ebx+0x65],cl
00005BE7  7970              jns 0x5c59
00005BE9  61                popa
00005BEA  642030            and [fs:eax],dh
00005BED  004B65            add [ebx+0x65],cl
00005BF0  7970              jns 0x5c62
00005BF2  61                popa
00005BF3  64202E            and [fs:esi],ch
00005BF6  00416C            add [ecx+0x6c],al
00005BF9  7453              jz 0x5c4e
00005BFB  7973              jns 0x5c70
00005BFD  52                push edx
00005BFE  657100            gs jno 0x5c01
00005C01  3F                aas
00005C02  3F                aas
00005C03  3F                aas
00005C04  004631            add [esi+0x31],al
00005C07  3100              xor [eax],eax
00005C09  46                inc esi
00005C0A  3132              xor [edx],esi
00005C0C  005550            add [ebp+0x50],dl
00005C0F  5F                pop edi
00005C10  41                inc ecx
00005C11  52                push edx
00005C12  52                push edx
00005C13  4F                dec edi
00005C14  57                push edi
00005C15  00444F57          add [edi+ecx*2+0x57],al
00005C19  4E                dec esi
00005C1A  5F                pop edi
00005C1B  41                inc ecx
00005C1C  52                push edx
00005C1D  52                push edx
00005C1E  4F                dec edi
00005C1F  57                push edi
00005C20  004C4546          add [ebp+eax*2+0x46],cl
00005C24  54                push esp
00005C25  5F                pop edi
00005C26  41                inc ecx
00005C27  52                push edx
00005C28  52                push edx
00005C29  4F                dec edi
00005C2A  57                push edi
00005C2B  005249            add [edx+0x49],dl
00005C2E  47                inc edi
00005C2F  48                dec eax
00005C30  54                push esp
00005C31  5F                pop edi
00005C32  41                inc ecx
00005C33  52                push edx
00005C34  52                push edx
00005C35  4F                dec edi
00005C36  57                push edi
00005C37  0000              add [eax],al
00005C39  0000              add [eax],al
00005C3B  0000              add [eax],al
00005C3D  0000              add [eax],al
00005C3F  003F              add [edi],bh
00005C41  3F                aas
00005C42  3132              xor [edx],esi
00005C44  33343536373839    xor esi,[esi+0x39383736]
00005C4B  302D3D9F3F71      xor [dword 0x713f9f3d],ch
00005C51  7765              ja 0x5cb8
00005C53  7274              jc 0x5cc9
00005C55  7A75              jpe 0x5ccc
00005C57  696F705B5D3F3F    imul ebp,[edi+0x70],dword 0x3f3f5d5b
00005C5E  61                popa
00005C5F  7364              jnc 0x5cc5
00005C61  6667686A6B        push word 0x6b6a
00005C66  6C                insb
00005C67  3B27              cmp esp,[edi]
00005C69  60                pusha
00005C6A  005C7978          add [ecx+edi*2+0x78],bl
00005C6E  637662            arpl [esi+0x62],si
00005C71  6E                outsb
00005C72  6D                insd
00005C73  2C2E              sub al,0x2e
00005C75  2F                das
00005C76  3F                aas
00005C77  3F                aas
00005C78  3F                aas
00005C79  203F              and [edi],bh
00005C7B  3F                aas
00005C7C  3F                aas
00005C7D  3F                aas
00005C7E  3F                aas
00005C7F  3F                aas
00005C80  3F                aas
00005C81  3F                aas
00005C82  3F                aas
00005C83  3F                aas
00005C84  3F                aas
00005C85  3F                aas
00005C86  3F                aas
00005C87  3F                aas
00005C88  3F                aas
00005C89  3F                aas
00005C8A  3F                aas
00005C8B  3F                aas
00005C8C  3F                aas
00005C8D  3F                aas
00005C8E  3F                aas
00005C8F  3F                aas
00005C90  3F                aas
00005C91  3F                aas
00005C92  3F                aas
00005C93  3F                aas
00005C94  5E                pop esi
00005C95  763C              jna 0x5cd3
00005C97  3E0000            add [ds:eax],al
00005C9A  0000              add [eax],al
00005C9C  0000              add [eax],al
00005C9E  0000              add [eax],al
00005CA0  3F                aas
00005CA1  3F                aas
00005CA2  2122              and [edx],esp
00005CA4  A7                cmpsd
00005CA5  2425              and al,0x25
00005CA7  262F              es das
00005CA9  2829              sub [ecx],ch
00005CAB  3D5F2A3F3F        cmp eax,0x3f3f2a5f
00005CB0  51                push ecx
00005CB1  57                push edi
00005CB2  45                inc ebp
00005CB3  52                push edx
00005CB4  54                push esp
00005CB5  5A                pop edx
00005CB6  55                push ebp
00005CB7  49                dec ecx
00005CB8  4F                dec edi
00005CB9  50                push eax
00005CBA  5B                pop ebx
00005CBB  5D                pop ebp
00005CBC  3F                aas
00005CBD  3F                aas
00005CBE  41                inc ecx
00005CBF  53                push ebx
00005CC0  44                inc esp
00005CC1  46                inc esi
00005CC2  47                inc edi
00005CC3  48                dec eax
00005CC4  4A                dec edx
00005CC5  4B                dec ebx
00005CC6  4C                dec esp
00005CC7  3B27              cmp esp,[edi]
00005CC9  60                pusha
00005CCA  005C5958          add [ecx+ebx*2+0x58],bl
00005CCE  43                inc ebx
00005CCF  56                push esi
00005CD0  42                inc edx
00005CD1  4E                dec esi
00005CD2  4D                dec ebp
00005CD3  2C2E              sub al,0x2e
00005CD5  2F                das
00005CD6  3F                aas
00005CD7  3F                aas
00005CD8  3F                aas
00005CD9  203F              and [edi],bh
00005CDB  3F                aas
00005CDC  3F                aas
00005CDD  3F                aas
00005CDE  3F                aas
00005CDF  3F                aas
00005CE0  3F                aas
00005CE1  3F                aas
00005CE2  3F                aas
00005CE3  3F                aas
00005CE4  3F                aas
00005CE5  3F                aas
00005CE6  3F                aas
00005CE7  3F                aas
00005CE8  3F                aas
00005CE9  3F                aas
00005CEA  3F                aas
00005CEB  3F                aas
00005CEC  3F                aas
00005CED  3F                aas
00005CEE  3F                aas
00005CEF  3F                aas
00005CF0  3F                aas
00005CF1  3F                aas
00005CF2  3F                aas
00005CF3  3F                aas
00005CF4  5E                pop esi
00005CF5  763C              jna 0x5d33
00005CF7  3E46              ds inc esi
00005CF9  7220              jc 0x5d1b
00005CFB  32352E204175      xor dh,[dword 0x7541202e]
00005D01  672031            and [bx+di],dh
00005D04  353A35393A        xor eax,0x3a39353a
00005D09  3532204345        xor eax,0x45432032
00005D0E  53                push ebx
00005D0F  54                push esp
00005D10  2032              and [edx],dh
00005D12  3032              xor [edx],dh
00005D14  3300              xor eax,[eax]
00005D16  44                inc esp
00005D17  657574            gs jnz 0x5d8e
00005D1A  65724F            gs jc 0x5d6c
00005D1D  53                push ebx
00005D1E  2030              and [eax],dh
00005D20  2E2564202825      cs and eax,0x25282064
00005D26  7329              jnc 0x5d51
00005D28  0A00              or al,[eax]
00005D2A  44                inc esp
00005D2B  657574            gs jnz 0x5da2
00005D2E  65724F            gs jc 0x5d80
00005D31  53                push ebx
00005D32  2030              and [eax],dh
00005D34  2E2564202800      cs and eax,0x282064
00005D3A  290A              sub [edx],ecx
00005D3C  0000              add [eax],al
00005D3E  0000              add [eax],al
00005D40  49                dec ecx
00005D41  6E                outsb
00005D42  7374              jnc 0x5db8
00005D44  61                popa
00005D45  6C                insb
00005D46  6C                insb
00005D47  696E6720696E74    imul ebp,[esi+0x67],dword 0x746e6920
00005D4E  657272            gs jc 0x5dc3
00005D51  7570              jnz 0x5dc3
00005D53  7420              jz 0x5d75
00005D55  7365              jnc 0x5dbc
00005D57  7276              jc 0x5dcf
00005D59  69636520726F75    imul esp,[ebx+0x65],dword 0x756f7220
00005D60  7469              jz 0x5dcb
00005D62  6E                outsb
00005D63  657320            gs jnc 0x5d86
00005D66  284953            sub [ecx+0x53],cl
00005D69  52                push edx
00005D6A  7329              jnc 0x5d95
00005D6C  2E0A00            or al,[cs:eax]
00005D6F  00456E            add [ebp+0x6e],al
00005D72  61                popa
00005D73  626C696E          bound ebp,[ecx+ebp*2+0x6e]
00005D77  67206578          and [di+0x78],ah
00005D7B  7465              jz 0x5de2
00005D7D  726E              jc 0x5ded
00005D7F  61                popa
00005D80  6C                insb
00005D81  20696E            and [ecx+0x6e],ch
00005D84  7465              jz 0x5deb
00005D86  7272              jc 0x5dfa
00005D88  7570              jnz 0x5dfa
00005D8A  7473              jz 0x5dff
00005D8C  2E0A00            or al,[cs:eax]
00005D8F  00496E            add [ecx+0x6e],cl
00005D92  697469616C697A69  imul esi,[ecx+ebp*2+0x61],dword 0x697a696c
00005D9A  6E                outsb
00005D9B  67206B65          and [bp+di+0x65],ch
00005D9F  7962              jns 0x5e03
00005DA1  6F                outsd
00005DA2  61                popa
00005DA3  7264              jc 0x5e09
00005DA5  2028              and [eax],ch
00005DA7  49                dec ecx
00005DA8  52                push edx
00005DA9  51                push ecx
00005DAA  2031              and [ecx],dh
00005DAC  292E              sub [esi],ebp
00005DAE  0A00              or al,[eax]
00005DB0  49                dec ecx
00005DB1  6E                outsb
00005DB2  697469616C697A69  imul esi,[ecx+ebp*2+0x61],dword 0x697a696c
00005DBA  6E                outsb
00005DBB  67206479          and [si+0x79],ah
00005DBF  6E                outsb
00005DC0  61                popa
00005DC1  6D                insd
00005DC2  6963206D656D6F    imul esp,[ebx+0x20],dword 0x6f6d656d
00005DC9  7279              jc 0x5e44
00005DCB  2E0A00            or al,[cs:eax]
00005DCE  0000              add [eax],al
00005DD0  41                inc ecx
00005DD1  3230              xor dh,[eax]
00005DD3  204C696E          and [ecx+ebp*2+0x6e],cl
00005DD7  65207761          and [gs:edi+0x61],dh
00005DDB  7320              jnc 0x5dfd
00005DDD  61                popa
00005DDE  63746976          arpl [ecx+ebp*2+0x76],si
00005DE2  61                popa
00005DE3  7465              jz 0x5e4a
00005DE5  64206279          and [fs:edx+0x79],ah
00005DE9  20746865          and [eax+ebp*2+0x65],dh
00005DED  204D42            and [ebp+0x42],cl
00005DF0  52                push edx
00005DF1  2E0A00            or al,[cs:eax]
00005DF4  49                dec ecx
00005DF5  6E                outsb
00005DF6  697469616C697A69  imul esi,[ecx+ebp*2+0x61],dword 0x697a696c
00005DFE  6E                outsb
00005DFF  67207469          and [si+0x69],dh
00005E03  6D                insd
00005E04  65722E            gs jc 0x5e35
00005E07  0A00              or al,[eax]
00005E09  0000              add [eax],al
00005E0B  00496E            add [ecx+0x6e],cl
00005E0E  697469616C697A69  imul esi,[ecx+ebp*2+0x61],dword 0x697a696c
00005E16  6E                outsb
00005E17  67205053          and [bx+si+0x53],dl
00005E1B  2F                das
00005E1C  3220              xor ah,[eax]
00005E1E  6D                insd
00005E1F  6F                outsd
00005E20  7573              jnz 0x5e95
00005E22  6520696E          and [gs:ecx+0x6e],ch
00005E26  7465              jz 0x5e8d
00005E28  7266              jc 0x5e90
00005E2A  61                popa
00005E2B  63650A            arpl [ebp+0xa],sp
00005E2E  000A              add [edx],cl
00005E30  3E2000            and [ds:eax],al
00005E33  00576F            add [edi+0x6f],dl
00005E36  772C              ja 0x5e64
00005E38  207765            and [edi+0x65],dh
00005E3B  207368            and [ebx+0x68],dh
00005E3E  6F                outsd
00005E3F  756C              jnz 0x5ead
00005E41  64206765          and [fs:edi+0x65],ah
00005E45  7420              jz 0x5e67
00005E47  686572652E        push dword 0x2e657265
00005E4C  2E2E0A4578        or al,[cs:ebp+0x78]
00005E51  6974696E672E2E2E  imul esi,[ecx+ebp*2+0x6e],dword 0x2e2e2e67
00005E59  0A5374            or dl,[ebx+0x74]
00005E5C  6F                outsd
00005E5D  7070              jo 0x5ecf
00005E5F  696E6720746865    imul ebp,[esi+0x67],dword 0x65687420
00005E66  204350            and [ebx+0x50],al
00005E69  55                push ebp
00005E6A  2E2E2E0A6573      or ah,[cs:ebp+0x73]
00005E70  636170            arpl [ecx+0x70],sp
00005E73  65206573          and [gs:ebp+0x73],ah
00005E77  7061              jo 0x5eda
00005E79  63652E            arpl [ebp+0x2e],sp
00005E7C  2E2E0A00          or al,[cs:eax]
00005E80  50                push eax
00005E81  2E53              cs push ebx
00005E83  2E205768          and [cs:edi+0x68],dl
00005E87  7920              jns 0x5ea9
00005E89  69732074686973    imul esi,[ebx+0x20],dword 0x73696874
00005E90  207374            and [ebx+0x74],dh
00005E93  696C6C20776F726B  imul ebp,[esp+ebp*2+0x20],dword 0x6b726f77
00005E9B  696E6720776865    imul ebp,[esi+0x67],dword 0x65687720
00005EA2  6E                outsb
00005EA3  20746865          and [eax+ebp*2+0x65],dh
00005EA7  204350            and [ebx+0x50],al
00005EAA  55                push ebp
00005EAB  206973            and [ecx+0x73],ch
00005EAE  206F66            and [edi+0x66],ch
00005EB1  66696369616C      imul sp,[ebx+0x69],word 0x6c61
00005EB7  6C                insb
00005EB8  7920              jns 0x5eda
00005EBA  7374              jnc 0x5f30
00005EBC  6F                outsd
00005EBD  7070              jo 0x5f2f
00005EBF  65642028          and [fs:eax],ch
00005EC3  686C742920        push dword 0x2029746c
00005EC8  3F                aas
00005EC9  0A00              or al,[eax]
00005ECB  7365              jnc 0x5f32
00005ECD  61                popa
00005ECE  7263              jc 0x5f33
00005ED0  6873002000        push dword 0x200073
00005ED5  2570005374        and eax,0x74530070
00005EDA  7269              jc 0x5f45
00005EDC  6E                outsb
00005EDD  6720666F          and [bp+0x6f],ah
00005EE1  756E              jnz 0x5f51
00005EE3  64206174          and [fs:ecx+0x74],ah
00005EE7  206164            and [ecx+0x64],ah
00005EEA  647265            fs jc 0x5f52
00005EED  7373              jnc 0x5f62
00005EEF  3A20              cmp ah,[eax]
00005EF1  000A              add [edx],cl
00005EF3  005374            add [ebx+0x74],dl
00005EF6  7269              jc 0x5f61
00005EF8  6E                outsb
00005EF9  67206E6F          and [bp+0x6f],ch
00005EFD  7420              jz 0x5f1f
00005EFF  666F              outsw
00005F01  756E              jnz 0x5f71
00005F03  642E0A00          or al,[cs:eax]
00005F07  00496E            add [ecx+0x6e],cl
00005F0A  7661              jna 0x5f6d
00005F0C  6C                insb
00005F0D  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
00005F15  657465            gs jz 0x5f7d
00005F18  7273              jc 0x5f8d
00005F1A  20666F            and [esi+0x6f],ah
00005F1D  7220              jc 0x5f3f
00005F1F  27                daa
00005F20  7365              jnc 0x5f87
00005F22  61                popa
00005F23  7263              jc 0x5f88
00005F25  6820616464        push dword 0x64646120
00005F2A  7265              jc 0x5f91
00005F2C  7373              jnc 0x5fa1
00005F2E  207369            and [ebx+0x69],dh
00005F31  7A65              jpe 0x5f98
00005F33  207374            and [ebx+0x74],dh
00005F36  7269              jc 0x5fa1
00005F38  6E                outsb
00005F39  6727              a16 daa
00005F3B  20636F            and [ebx+0x6f],ah
00005F3E  6D                insd
00005F3F  6D                insd
00005F40  61                popa
00005F41  6E                outsb
00005F42  642E0A00          or al,[cs:eax]
00005F46  7365              jnc 0x5fad
00005F48  61                popa
00005F49  7263              jc 0x5fae
00005F4B  6862007365        push dword 0x65730062
00005F50  61                popa
00005F51  7263              jc 0x5fb6
00005F53  68696E6720        push dword 0x20676e69
00005F58  25640A0042        and eax,0x42000a64
00005F5D  7974              jns 0x5fd3
00005F5F  6520666F          and [gs:esi+0x6f],ah
00005F63  756E              jnz 0x5fd3
00005F65  64206174          and [fs:ecx+0x74],ah
00005F69  206164            and [ecx+0x64],ah
00005F6C  647265            fs jc 0x5fd4
00005F6F  7373              jnc 0x5fe4
00005F71  3A20              cmp ah,[eax]
00005F73  004279            add [edx+0x79],al
00005F76  7465              jz 0x5fdd
00005F78  206E6F            and [esi+0x6f],ch
00005F7B  7420              jz 0x5f9d
00005F7D  666F              outsw
00005F7F  756E              jnz 0x5fef
00005F81  642E0A00          or al,[cs:eax]
00005F85  0000              add [eax],al
00005F87  00496E            add [ecx+0x6e],cl
00005F8A  7661              jna 0x5fed
00005F8C  6C                insb
00005F8D  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
00005F95  657465            gs jz 0x5ffd
00005F98  7273              jc 0x600d
00005F9A  20666F            and [esi+0x6f],ah
00005F9D  7220              jc 0x5fbf
00005F9F  27                daa
00005FA0  7365              jnc 0x6007
00005FA2  61                popa
00005FA3  7263              jc 0x6008
00005FA5  6820616464        push dword 0x64646120
00005FAA  7265              jc 0x6011
00005FAC  7373              jnc 0x6021
00005FAE  207369            and [ebx+0x69],dh
00005FB1  7A65              jpe 0x6018
00005FB3  206279            and [edx+0x79],ah
00005FB6  7465              jz 0x601d
00005FB8  27                daa
00005FB9  20636F            and [ebx+0x6f],ah
00005FBC  6D                insd
00005FBD  6D                insd
00005FBE  61                popa
00005FBF  6E                outsb
00005FC0  642E0A00          or al,[cs:eax]
00005FC4  2563002563        and eax,0x63250063
00005FC9  0A00              or al,[eax]
00005FCB  2020              and [eax],ah
00005FCD  2020              and [eax],ah
00005FCF  002563200020      add [dword 0x20002063],ah
00005FD5  202563200025      and [dword 0x25002063],ah
00005FDB  6420546167        and [fs:ecx+0x67],dl
00005FE0  650A00            or al,[gs:eax]
00005FE3  2564205374        and eax,0x74532064
00005FE8  756E              jnz 0x6058
00005FEA  64656E            gs outsb
00005FED  0A00              or al,[eax]
00005FEF  2564204D69        and eax,0x694d2064
00005FF4  6E                outsb
00005FF5  7574              jnz 0x606b
00005FF7  656E              gs outsb
00005FF9  0A00              or al,[eax]
00005FFB  2564205365        and eax,0x65532064
00006000  6B756E64          imul esi,[ebp+0x6e],byte +0x64
00006004  656E              gs outsb
00006006  0A00              or al,[eax]
00006008  2564204D69        and eax,0x694d2064
0000600D  6C                insb
0000600E  6C                insb
0000600F  6973656B756E64    imul esi,[ebx+0x65],dword 0x646e756b
00006016  656E              gs outsb
00006018  0A00              or al,[eax]
0000601A  25643A0025        and eax,0x25003a64
0000601F  64006D65          add [fs:ebp+0x65],ch
00006023  6D                insd
00006024  203D2025700A      and [dword 0xa702520],bh
0000602A  00416C            add [ecx+0x6c],al
0000602D  6C                insb
0000602E  6F                outsd
0000602F  636174            arpl [ecx+0x74],sp
00006032  656420626C        and [fs:edx+0x6c],ah
00006037  6F                outsd
00006038  636B73            arpl [ebx+0x73],bp
0000603B  3A0A              cmp cl,[edx]
0000603D  0000              add [eax],al
0000603F  000A              add [edx],cl
00006041  41                inc ecx
00006042  6C                insb
00006043  6C                insb
00006044  6F                outsd
00006045  636174            arpl [ecx+0x74],sp
00006048  656420626C        and [fs:edx+0x6c],ah
0000604D  6F                outsd
0000604E  636B73            arpl [ebx+0x73],bp
00006051  206166            and [ecx+0x66],ah
00006054  7465              jz 0x60bb
00006056  7220              jc 0x6078
00006058  667265            o16 jc 0x60c0
0000605B  65696E67206D656D  imul ebp,[gs:esi+0x67],dword 0x6d656d20
00006063  3A0A              cmp cl,[edx]
00006065  0000              add [eax],al
00006067  000A              add [edx],cl
00006069  41                inc ecx
0000606A  6C                insb
0000606B  6C                insb
0000606C  6F                outsd
0000606D  636174            arpl [ecx+0x74],sp
00006070  656420626C        and [fs:edx+0x6c],ah
00006075  6F                outsd
00006076  636B73            arpl [ebx+0x73],bp
00006079  206166            and [ecx+0x66],ah
0000607C  7465              jz 0x60e3
0000607E  7220              jc 0x60a0
00006080  667265            o16 jc 0x60e8
00006083  65696E67206D656D  imul ebp,[gs:esi+0x67],dword 0x6d656d20
0000608B  323A              xor bh,[edx]
0000608D  0A00              or al,[eax]
0000608F  4E                dec esi
00006090  6F                outsd
00006091  6465204164        and [gs:ecx+0x64],al
00006096  647265            fs jc 0x60fe
00006099  7373              jnc 0x610e
0000609B  3A20              cmp ah,[eax]
0000609D  2570002044        and eax,0x44200070
000060A2  61                popa
000060A3  7461              jz 0x6106
000060A5  3A20              cmp ah,[eax]
000060A7  25640A004C        and eax,0x4c000a64
000060AC  6973743A0A004C    imul esi,[ebx+0x74],dword 0x4c000a3a
000060B3  69737420616674    imul esi,[ebx+0x74],dword 0x74666120
000060BA  657220            gs jc 0x60dd
000060BD  7265              jc 0x6124
000060BF  6D                insd
000060C0  6F                outsd
000060C1  7661              jna 0x6124
000060C3  6C                insb
000060C4  3A0A              cmp cl,[edx]
000060C6  0000              add [eax],al
000060C8  6D                insd
000060C9  656D              gs insd
000060CB  7465              jz 0x6132
000060CD  7374              jnc 0x6143
000060CF  006C6C5F          add [esp+ebp*2+0x5f],ch
000060D3  6D                insd
000060D4  61                popa
000060D5  696E3A2025700A    imul ebp,[esi+0x3a],dword 0xa702520
000060DC  007261            add [edx+0x61],dh
000060DF  6E                outsb
000060E0  646F              fs outsd
000060E2  6D                insd
000060E3  0025640A0065      add [dword 0x65000a64],ah
000060E9  64697400736E616B  imul esi,[fs:eax+eax+0x73],dword 0x656b616e
         -65
000060F2  007570            add [ebp+0x70],dh
000060F5  7469              jz 0x6160
000060F7  6D                insd
000060F8  65006869          add [gs:eax+0x69],ch
000060FC  6465007368        add [gs:ebx+0x68],dh
00006101  6F                outsd
00006102  7700              ja 0x6104
00006104  7265              jc 0x616b
00006106  677300            jnc 0x6109
00006109  6B657963          imul esp,[ebp+0x79],byte +0x63
0000610D  6F                outsd
0000610E  64657300          gs jnc 0x6112
00006112  657869            gs js 0x617e
00006115  7400              jz 0x6117
00006117  7374              jnc 0x618d
00006119  61                popa
0000611A  67653200          xor al,[gs:bx+si]
0000611E  4C                dec esp
0000611F  6F                outsd
00006120  61                popa
00006121  64696E67204B6572  imul ebp,[fs:esi+0x67],dword 0x72654b20
00006129  6E                outsb
0000612A  656C              gs insb
0000612C  20746F20          and [edi+ebp*2+0x20],dh
00006130  307831            xor [eax+0x31],bh
00006133  3030              xor [eax],dh
00006135  3030              xor [eax],dh
00006137  302E              xor [esi],ch
00006139  0A00              or al,[eax]
0000613B  64756D            fs jnz 0x61ab
0000613E  7000              jo 0x6140
00006140  49                dec ecx
00006141  6E                outsb
00006142  7661              jna 0x61a5
00006144  6C                insb
00006145  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
0000614D  657465            gs jz 0x61b5
00006150  7273              jc 0x61c5
00006152  20666F            and [esi+0x6f],ah
00006155  7220              jc 0x6177
00006157  27                daa
00006158  64756D            fs jnz 0x61c8
0000615B  7020              jo 0x617d
0000615D  61                popa
0000615E  64647265          fs jc 0x61c7
00006162  7373              jnc 0x61d7
00006164  206C656E          and [ebp+0x6e],ch
00006168  677468            jz 0x61d3
0000616B  27                daa
0000616C  20636F            and [ebx+0x6f],ah
0000616F  6D                insd
00006170  6D                insd
00006171  61                popa
00006172  6E                outsb
00006173  642E0A00          or al,[cs:eax]
00006177  6D                insd
00006178  656D              gs insd
0000617A  7365              jnc 0x61e1
0000617C  7400              jz 0x617e
0000617E  0000              add [eax],al
00006180  49                dec ecx
00006181  6E                outsb
00006182  7661              jna 0x61e5
00006184  6C                insb
00006185  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
0000618D  657465            gs jz 0x61f5
00006190  7273              jc 0x6205
00006192  20666F            and [esi+0x6f],ah
00006195  7220              jc 0x61b7
00006197  27                daa
00006198  6D                insd
00006199  656D              gs insd
0000619B  7365              jnc 0x6202
0000619D  7420              jz 0x61bf
0000619F  64657374          gs jnc 0x6217
000061A3  207661            and [esi+0x61],dh
000061A6  6C                insb
000061A7  7565              jnz 0x620e
000061A9  27                daa
000061AA  20636F            and [ebx+0x6f],ah
000061AD  6D                insd
000061AE  6D                insd
000061AF  61                popa
000061B0  6E                outsb
000061B1  642E0A00          or al,[cs:eax]
000061B5  6D                insd
000061B6  656D              gs insd
000061B8  637079            arpl [eax+0x79],si
000061BB  00496E            add [ecx+0x6e],cl
000061BE  7661              jna 0x6221
000061C0  6C                insb
000061C1  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
000061C9  657465            gs jz 0x6231
000061CC  7273              jc 0x6241
000061CE  20666F            and [esi+0x6f],ah
000061D1  7220              jc 0x61f3
000061D3  27                daa
000061D4  6D                insd
000061D5  656D              gs insd
000061D7  637079            arpl [eax+0x79],si
000061DA  20736F            and [ebx+0x6f],dh
000061DD  7572              jnz 0x6251
000061DF  636520            arpl [ebp+0x20],sp
000061E2  64657374          gs jnc 0x625a
000061E6  206C656E          and [ebp+0x6e],ch
000061EA  677468            jz 0x6255
000061ED  27                daa
000061EE  20636F            and [ebx+0x6f],ah
000061F1  6D                insd
000061F2  6D                insd
000061F3  61                popa
000061F4  6E                outsb
000061F5  642E0A00          or al,[cs:eax]
000061F9  7275              jc 0x6270
000061FB  6E                outsb
000061FC  0000              add [eax],al
000061FE  0000              add [eax],al
00006200  49                dec ecx
00006201  6E                outsb
00006202  7661              jna 0x6265
00006204  6C                insb
00006205  696420706172616D  imul esp,[eax+0x70],dword 0x6d617261
0000620D  657465            gs jz 0x6275
00006210  7273              jc 0x6285
00006212  20666F            and [esi+0x6f],ah
00006215  7220              jc 0x6237
00006217  27                daa
00006218  7275              jc 0x628f
0000621A  6E                outsb
0000621B  206164            and [ecx+0x64],ah
0000621E  647265            fs jc 0x6286
00006221  7373              jnc 0x6296
00006223  27                daa
00006224  20636F            and [ebx+0x6f],ah
00006227  6D                insd
00006228  6D                insd
00006229  61                popa
0000622A  6E                outsb
0000622B  642E0A00          or al,[cs:eax]
0000622F  61                popa
00006230  7363              jnc 0x6295
00006232  696900636C7200    imul ebp,[ecx+0x0],dword 0x726c63
00006239  7273              jc 0x62ae
0000623B  7400              jz 0x623d
0000623D  55                push ebp
0000623E  6E                outsb
0000623F  6B6E6F77          imul ebp,[esi+0x6f],byte +0x77
00006243  6E                outsb
00006244  20636F            and [ebx+0x6f],ah
00006247  6D                insd
00006248  6D                insd
00006249  61                popa
0000624A  6E                outsb
0000624B  643A20            cmp ah,[fs:eax]
0000624E  003E              add [esi],bh
00006250  2000              and [eax],al
00006252  44                inc esp
00006253  69766973696F6E    imul esi,[esi+0x69],dword 0x6e6f6973
0000625A  204279            and [edx+0x79],al
0000625D  205A65            and [edx+0x65],bl
00006260  726F              jc 0x62d1
00006262  00446562          add [ebp+0x62],al
00006266  7567              jnz 0x62cf
00006268  004E6F            add [esi+0x6f],cl
0000626B  6E                outsb
0000626C  204D61            and [ebp+0x61],cl
0000626F  736B              jnc 0x62dc
00006271  61                popa
00006272  626C6520          bound ebp,[ebp+0x20]
00006276  49                dec ecx
00006277  6E                outsb
00006278  7465              jz 0x62df
0000627A  7272              jc 0x62ee
0000627C  7570              jnz 0x62ee
0000627E  7400              jz 0x6280
00006280  42                inc edx
00006281  7265              jc 0x62e8
00006283  61                popa
00006284  6B706F69          imul esi,[eax+0x6f],byte +0x69
00006288  6E                outsb
00006289  7400              jz 0x628b
0000628B  49                dec ecx
0000628C  6E                outsb
0000628D  746F              jz 0x62fe
0000628F  20446574          and [ebp+0x74],al
00006293  6563746564        arpl [gs:ebp+0x64],si
00006298  204F76            and [edi+0x76],cl
0000629B  657266            gs jc 0x6304
0000629E  6C                insb
0000629F  6F                outsd
000062A0  7700              ja 0x62a2
000062A2  4F                dec edi
000062A3  7574              jnz 0x6319
000062A5  206F66            and [edi+0x66],ch
000062A8  20426F            and [edx+0x6f],al
000062AB  756E              jnz 0x631b
000062AD  647300            fs jnc 0x62b0
000062B0  49                dec ecx
000062B1  6E                outsb
000062B2  7661              jna 0x6315
000062B4  6C                insb
000062B5  6964204F70636F64  imul esp,[eax+0x4f],dword 0x646f6370
000062BD  65004E6F          add [gs:esi+0x6f],cl
000062C1  20436F            and [ebx+0x6f],al
000062C4  7072              jo 0x6338
000062C6  6F                outsd
000062C7  636573            arpl [ebp+0x73],sp
000062CA  736F              jnc 0x633b
000062CC  7200              jc 0x62ce
000062CE  44                inc esp
000062CF  6F                outsd
000062D0  7562              jnz 0x6334
000062D2  6C                insb
000062D3  65204661          and [gs:esi+0x61],al
000062D7  756C              jnz 0x6345
000062D9  7400              jz 0x62db
000062DB  43                inc ebx
000062DC  6F                outsd
000062DD  7072              jo 0x6351
000062DF  6F                outsd
000062E0  636573            arpl [ebp+0x73],sp
000062E3  736F              jnc 0x6354
000062E5  7220              jc 0x6307
000062E7  53                push ebx
000062E8  65676D            gs a16 insd
000062EB  656E              gs outsb
000062ED  7420              jz 0x630f
000062EF  4F                dec edi
000062F0  7665              jna 0x6357
000062F2  7272              jc 0x6366
000062F4  756E              jnz 0x6364
000062F6  004261            add [edx+0x61],al
000062F9  6420545353        and [fs:ebx+edx*2+0x53],dl
000062FE  005365            add [ebx+0x65],dl
00006301  676D              a16 insd
00006303  656E              gs outsb
00006305  7420              jz 0x6327
00006307  4E                dec esi
00006308  6F                outsd
00006309  7420              jz 0x632b
0000630B  50                push eax
0000630C  7265              jc 0x6373
0000630E  7365              jnc 0x6375
00006310  6E                outsb
00006311  7400              jz 0x6313
00006313  53                push ebx
00006314  7461              jz 0x6377
00006316  636B20            arpl [ebx+0x20],bp
00006319  46                inc esi
0000631A  61                popa
0000631B  756C              jnz 0x6389
0000631D  7400              jz 0x631f
0000631F  47                inc edi
00006320  656E              gs outsb
00006322  657261            gs jc 0x6386
00006325  6C                insb
00006326  205072            and [eax+0x72],dl
00006329  6F                outsd
0000632A  7465              jz 0x6391
0000632C  6374696F          arpl [ecx+ebp*2+0x6f],si
00006330  6E                outsb
00006331  204661            and [esi+0x61],al
00006334  756C              jnz 0x63a2
00006336  7400              jz 0x6338
00006338  50                push eax
00006339  61                popa
0000633A  6765204661        and [gs:bp+0x61],al
0000633F  756C              jnz 0x63ad
00006341  7400              jz 0x6343
00006343  55                push ebp
00006344  6E                outsb
00006345  6B6E6F77          imul ebp,[esi+0x6f],byte +0x77
00006349  6E                outsb
0000634A  20496E            and [ecx+0x6e],cl
0000634D  7465              jz 0x63b4
0000634F  7272              jc 0x63c3
00006351  7570              jnz 0x63c3
00006353  7400              jz 0x6355
00006355  43                inc ebx
00006356  6F                outsd
00006357  7072              jo 0x63cb
00006359  6F                outsd
0000635A  636573            arpl [ebp+0x73],sp
0000635D  736F              jnc 0x63ce
0000635F  7220              jc 0x6381
00006361  46                inc esi
00006362  61                popa
00006363  756C              jnz 0x63d1
00006365  7400              jz 0x6367
00006367  41                inc ecx
00006368  6C                insb
00006369  69676E6D656E74    imul esp,[edi+0x6e],dword 0x746e656d
00006370  204368            and [ebx+0x68],al
00006373  65636B00          arpl [gs:ebx+0x0],bp
00006377  4D                dec ebp
00006378  61                popa
00006379  636869            arpl [eax+0x69],bp
0000637C  6E                outsb
0000637D  65204368          and [gs:ebx+0x68],al
00006381  65636B00          arpl [gs:ebx+0x0],bp
00006385  52                push edx
00006386  657365            gs jnc 0x63ee
00006389  7276              jc 0x6401
0000638B  6564007265        add [fs:edx+0x65],dh
00006390  636569            arpl [ebp+0x69],sp
00006393  7665              jna 0x63fa
00006395  6420696E          and [fs:ecx+0x6e],ch
00006399  7465              jz 0x6400
0000639B  7272              jc 0x640f
0000639D  7570              jnz 0x640f
0000639F  743A              jz 0x63db
000063A1  2000              and [eax],al
000063A3  44                inc esp
000063A4  59                pop ecx
000063A5  4E                dec esi
000063A6  41                inc ecx
000063A7  4D                dec ebp
000063A8  49                dec ecx
000063A9  43                inc ebx
000063AA  5F                pop edi
000063AB  4D                dec ebp
000063AC  45                inc ebp
000063AD  4D                dec ebp
000063AE  5F                pop edi
000063AF  4E                dec esi
000063B0  4F                dec edi
000063B1  44                inc esp
000063B2  45                inc ebp
000063B3  5F                pop edi
000063B4  53                push ebx
000063B5  49                dec ecx
000063B6  5A                pop edx
000063B7  45                inc ebp
000063B8  203D20007B73      and [dword 0x737b0020],bh
000063BE  697A65203D2000    imul edi,[edx+0x65],dword 0x203d20
000063C5  3B20              cmp esp,[eax]
000063C7  7573              jnz 0x643c
000063C9  6564203D20007D3B  and [dword fs:0x3b7d0020],bh
000063D1  2000              and [eax],al
000063D3  5B                pop ebx
000063D4  005D0A            add [ebp+0xa],bl
000063D7  0020              add [eax],ah
000063D9  204541            and [ebp+0x41],al
000063DC  58                pop eax
000063DD  3A20              cmp ah,[eax]
000063DF  307825            xor [eax+0x25],bh
000063E2  700A              jo 0x63ee
000063E4  0020              add [eax],ah
000063E6  204542            and [ebp+0x42],al
000063E9  58                pop eax
000063EA  3A20              cmp ah,[eax]
000063EC  307825            xor [eax+0x25],bh
000063EF  700A              jo 0x63fb
000063F1  0020              add [eax],ah
000063F3  204543            and [ebp+0x43],al
000063F6  58                pop eax
000063F7  3A20              cmp ah,[eax]
000063F9  307825            xor [eax+0x25],bh
000063FC  700A              jo 0x6408
000063FE  0020              add [eax],ah
00006400  204544            and [ebp+0x44],al
00006403  58                pop eax
00006404  3A20              cmp ah,[eax]
00006406  307825            xor [eax+0x25],bh
00006409  700A              jo 0x6415
0000640B  0020              add [eax],ah
0000640D  204553            and [ebp+0x53],al
00006410  49                dec ecx
00006411  3A20              cmp ah,[eax]
00006413  307825            xor [eax+0x25],bh
00006416  700A              jo 0x6422
00006418  0020              add [eax],ah
0000641A  204544            and [ebp+0x44],al
0000641D  49                dec ecx
0000641E  3A20              cmp ah,[eax]
00006420  307825            xor [eax+0x25],bh
00006423  700A              jo 0x642f
00006425  0020              add [eax],ah
00006427  204542            and [ebp+0x42],al
0000642A  50                push eax
0000642B  3A20              cmp ah,[eax]
0000642D  307825            xor [eax+0x25],bh
00006430  700A              jo 0x643c
00006432  0020              add [eax],ah
00006434  204553            and [ebp+0x53],al
00006437  50                push eax
00006438  3A20              cmp ah,[eax]
0000643A  307825            xor [eax+0x25],bh
0000643D  700A              jo 0x6449
0000643F  0020              add [eax],ah
00006441  204546            and [ebp+0x46],al
00006444  4C                dec esp
00006445  41                inc ecx
00006446  47                inc edi
00006447  53                push ebx
00006448  3A20              cmp ah,[eax]
0000644A  307825            xor [eax+0x25],bh
0000644D  700A              jo 0x6459
0000644F  0020              add [eax],ah
00006451  2044533A          and [ebx+edx*2+0x3a],al
00006455  2030              and [eax],dh
00006457  7825              js 0x647e
00006459  700A              jo 0x6465
0000645B  0020              add [eax],ah
0000645D  204353            and [ebx+0x53],al
00006460  3A20              cmp ah,[eax]
00006462  307825            xor [eax+0x25],bh
00006465  700A              jo 0x6471
00006467  0020              add [eax],ah
00006469  205353            and [ebx+0x53],dl
0000646C  3A20              cmp ah,[eax]
0000646E  307825            xor [eax+0x25],bh
00006471  700A              jo 0x647d
00006473  0020              add [eax],ah
00006475  204549            and [ebp+0x49],al
00006478  50                push eax
00006479  3A20              cmp ah,[eax]
0000647B  25700A0020        and eax,0x20000a70
00006480  20494E            and [ecx+0x4e],cl
00006483  54                push esp
00006484  5F                pop edi
00006485  4E                dec esi
00006486  4F                dec edi
00006487  3A20              cmp ah,[eax]
00006489  307825            xor [eax+0x25],bh
0000648C  700A              jo 0x6498
0000648E  0020              add [eax],ah
00006490  204552            and [ebp+0x52],al
00006493  52                push edx
00006494  5F                pop edi
00006495  43                inc ebx
00006496  4F                dec edi
00006497  44                inc esp
00006498  45                inc ebp
00006499  3A20              cmp ah,[eax]
0000649B  307825            xor [eax+0x25],bh
0000649E  700A              jo 0x64aa
000064A0  0020              add [eax],ah
000064A2  205553            and [ebp+0x53],dl
000064A5  45                inc ebp
000064A6  52                push edx
000064A7  45                inc ebp
000064A8  53                push ebx
000064A9  50                push eax
000064AA  3A20              cmp ah,[eax]
000064AC  307825            xor [eax+0x25],bh
000064AF  700A              jo 0x64bb
000064B1  0000              add [eax],al
000064B3  00542B10          add [ebx+ebp+0x10],dl
000064B7  00472C            add [edi+0x2c],al
000064BA  1000              adc [eax],al
000064BC  47                inc edi
000064BD  2C10              sub al,0x10
000064BF  00472C            add [edi+0x2c],al
000064C2  1000              adc [eax],al
000064C4  47                inc edi
000064C5  2C10              sub al,0x10
000064C7  00472C            add [edi+0x2c],al
000064CA  1000              adc [eax],al
000064CC  47                inc edi
000064CD  2C10              sub al,0x10
000064CF  00472C            add [edi+0x2c],al
000064D2  1000              adc [eax],al
000064D4  47                inc edi
000064D5  2C10              sub al,0x10
000064D7  00472C            add [edi+0x2c],al
000064DA  1000              adc [eax],al
000064DC  47                inc edi
000064DD  2C10              sub al,0x10
000064DF  0016              add [esi],dl
000064E1  2A10              sub dl,[eax]
000064E3  00822A100047      add [edx+0x4700102a],al
000064E9  2C10              sub al,0x10
000064EB  00472C            add [edi+0x2c],al
000064EE  1000              adc [eax],al
000064F0  47                inc edi
000064F1  2C10              sub al,0x10
000064F3  00472C            add [edi+0x2c],al
000064F6  1000              adc [eax],al
000064F8  47                inc edi
000064F9  2C10              sub al,0x10
000064FB  00472C            add [edi+0x2c],al
000064FE  1000              adc [eax],al
00006500  47                inc edi
00006501  2C10              sub al,0x10
00006503  00472C            add [edi+0x2c],al
00006506  1000              adc [eax],al
00006508  47                inc edi
00006509  2C10              sub al,0x10
0000650B  00472C            add [edi+0x2c],al
0000650E  1000              adc [eax],al
00006510  47                inc edi
00006511  2C10              sub al,0x10
00006513  00F8              add al,bh
00006515  2A10              sub dl,[eax]
00006517  00472C            add [edi+0x2c],al
0000651A  1000              adc [eax],al
0000651C  47                inc edi
0000651D  2C10              sub al,0x10
0000651F  00412A            add [ecx+0x2a],al
00006522  1000              adc [eax],al
00006524  2000              and [eax],al
00006526  3A20              cmp ah,[eax]
00006528  0020              add [eax],ah
0000652A  2020              and [eax],ah
0000652C  0020              add [eax],ah
0000652E  2000              and [eax],al
00006530  2563000A00        and eax,0xa0063
00006535  7379              jnc 0x65b0
00006537  7374              jnc 0x65ad
00006539  656D              gs insd
0000653B  0000              add [eax],al
0000653D  0000              add [eax],al
0000653F  004552            add [ebp+0x52],al
00006542  52                push edx
00006543  4F                dec edi
00006544  52                push edx
00006545  004573            add [ebp+0x73],al
00006548  6300              arpl [eax],ax
0000654A  3100              xor [eax],eax
0000654C  3200              xor al,[eax]
0000654E  3300              xor eax,[eax]
00006550  3400              xor al,0x0
00006552  3500360037        xor eax,0x37003600
00006557  0038              add [eax],bh
00006559  0039              add [ecx],bh
0000655B  0030              add [eax],dh
0000655D  002D003D0042      add [dword 0x42003d00],ch
00006563  61                popa
00006564  636B73            arpl [ebx+0x73],bp
00006567  7061              jo 0x65ca
00006569  636500            arpl [ebp+0x0],sp
0000656C  54                push esp
0000656D  61                popa
0000656E  6200              bound eax,[eax]
00006570  51                push ecx
00006571  005700            add [edi+0x0],dl
00006574  45                inc ebp
00006575  005200            add [edx+0x0],dl
00006578  54                push esp
00006579  005A00            add [edx+0x0],bl
0000657C  55                push ebp
0000657D  004900            add [ecx+0x0],cl
00006580  4F                dec edi
00006581  005000            add [eax+0x0],dl
00006584  5B                pop ebx
00006585  005D00            add [ebp+0x0],bl
00006588  45                inc ebp
00006589  6E                outsb
0000658A  7465              jz 0x65f1
0000658C  7200              jc 0x658e
0000658E  4C                dec esp
0000658F  6374726C          arpl [edx+esi*2+0x6c],si
00006593  004100            add [ecx+0x0],al
00006596  53                push ebx
00006597  00440046          add [eax+eax+0x46],al
0000659B  004700            add [edi+0x0],al
0000659E  48                dec eax
0000659F  004A00            add [edx+0x0],cl
000065A2  4B                dec ebx
000065A3  004C003B          add [eax+eax+0x3b],cl
000065A7  0027              add [edi],ah
000065A9  006000            add [eax+0x0],ah
000065AC  4C                dec esp
000065AD  53                push ebx
000065AE  6869667400        push dword 0x746669
000065B3  5C                pop esp
000065B4  005900            add [ecx+0x0],bl
000065B7  58                pop eax
000065B8  004300            add [ebx+0x0],al
000065BB  56                push esi
000065BC  004200            add [edx+0x0],al
000065BF  4E                dec esi
000065C0  004D00            add [ebp+0x0],cl
000065C3  2C00              sub al,0x0
000065C5  2E002F            add [cs:edi],ch
000065C8  005253            add [edx+0x53],dl
000065CB  6869667400        push dword 0x746669
000065D0  4B                dec ebx
000065D1  657970            gs jns 0x6644
000065D4  61                popa
000065D5  64202A            and [fs:edx],ch
000065D8  004C416C          add [ecx+eax*2+0x6c],cl
000065DC  7400              jz 0x65de
000065DE  53                push ebx
000065DF  7061              jo 0x6642
000065E1  636562            arpl [ebp+0x62],sp
000065E4  61                popa
000065E5  7200              jc 0x65e7
000065E7  43                inc ebx
000065E8  61                popa
000065E9  7073              jo 0x665e
000065EB  4C                dec esp
000065EC  6F                outsd
000065ED  636B00            arpl [ebx+0x0],bp
000065F0  46                inc esi
000065F1  3100              xor [eax],eax
000065F3  46                inc esi
000065F4  3200              xor al,[eax]
000065F6  46                inc esi
000065F7  3300              xor eax,[eax]
000065F9  46                inc esi
000065FA  3400              xor al,0x0
000065FC  46                inc esi
000065FD  3500463600        xor eax,0x364600
00006602  46                inc esi
00006603  37                aaa
00006604  004638            add [esi+0x38],al
00006607  004639            add [esi+0x39],al
0000660A  004631            add [esi+0x31],al
0000660D  3000              xor [eax],al
0000660F  4E                dec esi
00006610  756D              jnz 0x667f
00006612  4C                dec esp
00006613  6F                outsd
00006614  636B00            arpl [ebx+0x0],bp
00006617  53                push ebx
00006618  63726F            arpl [edx+0x6f],si
0000661B  6C                insb
0000661C  6C                insb
0000661D  4C                dec esp
0000661E  6F                outsd
0000661F  636B00            arpl [ebx+0x0],bp
00006622  4B                dec ebx
00006623  657970            gs jns 0x6696
00006626  61                popa
00006627  642037            and [fs:edi],dh
0000662A  004B65            add [ebx+0x65],cl
0000662D  7970              jns 0x669f
0000662F  61                popa
00006630  642038            and [fs:eax],bh
00006633  004B65            add [ebx+0x65],cl
00006636  7970              jns 0x66a8
00006638  61                popa
00006639  642039            and [fs:ecx],bh
0000663C  004B65            add [ebx+0x65],cl
0000663F  7970              jns 0x66b1
00006641  61                popa
00006642  64202D004B6579    and [dword fs:0x79654b00],ch
00006649  7061              jo 0x66ac
0000664B  64203400          and [fs:eax+eax],dh
0000664F  4B                dec ebx
00006650  657970            gs jns 0x66c3
00006653  61                popa
00006654  642035004B6579    and [dword fs:0x79654b00],dh
0000665B  7061              jo 0x66be
0000665D  642036            and [fs:esi],dh
00006660  004B65            add [ebx+0x65],cl
00006663  7970              jns 0x66d5
00006665  61                popa
00006666  64202B            and [fs:ebx],ch
00006669  004B65            add [ebx+0x65],cl
0000666C  7970              jns 0x66de
0000666E  61                popa
0000666F  642031            and [fs:ecx],dh
00006672  004B65            add [ebx+0x65],cl
00006675  7970              jns 0x66e7
00006677  61                popa
00006678  642032            and [fs:edx],dh
0000667B  004B65            add [ebx+0x65],cl
0000667E  7970              jns 0x66f0
00006680  61                popa
00006681  642033            and [fs:ebx],dh
00006684  004B65            add [ebx+0x65],cl
00006687  7970              jns 0x66f9
00006689  61                popa
0000668A  642030            and [fs:eax],dh
0000668D  004B65            add [ebx+0x65],cl
00006690  7970              jns 0x6702
00006692  61                popa
00006693  64202E            and [fs:esi],ch
00006696  00416C            add [ecx+0x6c],al
00006699  7453              jz 0x66ee
0000669B  7973              jns 0x6710
0000669D  52                push edx
0000669E  657100            gs jno 0x66a1
000066A1  3F                aas
000066A2  3F                aas
000066A3  3F                aas
000066A4  004631            add [esi+0x31],al
000066A7  3100              xor [eax],eax
000066A9  46                inc esi
000066AA  3132              xor [edx],esi
000066AC  005550            add [ebp+0x50],dl
000066AF  5F                pop edi
000066B0  41                inc ecx
000066B1  52                push edx
000066B2  52                push edx
000066B3  4F                dec edi
000066B4  57                push edi
000066B5  00444F57          add [edi+ecx*2+0x57],al
000066B9  4E                dec esi
000066BA  5F                pop edi
000066BB  41                inc ecx
000066BC  52                push edx
000066BD  52                push edx
000066BE  4F                dec edi
000066BF  57                push edi
000066C0  004C4546          add [ebp+eax*2+0x46],cl
000066C4  54                push esp
000066C5  5F                pop edi
000066C6  41                inc ecx
000066C7  52                push edx
000066C8  52                push edx
000066C9  4F                dec edi
000066CA  57                push edi
000066CB  005249            add [edx+0x49],dl
000066CE  47                inc edi
000066CF  48                dec eax
000066D0  54                push esp
000066D1  5F                pop edi
000066D2  41                inc ecx
000066D3  52                push edx
000066D4  52                push edx
000066D5  4F                dec edi
000066D6  57                push edi
000066D7  0000              add [eax],al
000066D9  0000              add [eax],al
000066DB  0000              add [eax],al
000066DD  0000              add [eax],al
000066DF  003F              add [edi],bh
000066E1  3F                aas
000066E2  3132              xor [edx],esi
000066E4  33343536373839    xor esi,[esi+0x39383736]
000066EB  302D3D3F3F71      xor [dword 0x713f3f3d],ch
000066F1  7765              ja 0x6758
000066F3  7274              jc 0x6769
000066F5  7A75              jpe 0x676c
000066F7  696F705B5D3F3F    imul ebp,[edi+0x70],dword 0x3f3f5d5b
000066FE  61                popa
000066FF  7364              jnc 0x6765
00006701  6667686A6B        push word 0x6b6a
00006706  6C                insb
00006707  3B27              cmp esp,[edi]
00006709  60                pusha
0000670A  3F                aas
0000670B  5C                pop esp
0000670C  7978              jns 0x6786
0000670E  637662            arpl [esi+0x62],si
00006711  6E                outsb
00006712  6D                insd
00006713  2C2E              sub al,0x2e
00006715  2F                das
00006716  3F                aas
00006717  3F                aas
00006718  3F                aas
00006719  203F              and [edi],bh
0000671B  3F                aas
0000671C  3F                aas
0000671D  3F                aas
0000671E  3F                aas
0000671F  3F                aas
00006720  3F                aas
00006721  3F                aas
00006722  3F                aas
00006723  3F                aas
00006724  3F                aas
00006725  3F                aas
00006726  3F                aas
00006727  3F                aas
00006728  3F                aas
00006729  3F                aas
0000672A  3F                aas
0000672B  3F                aas
0000672C  3F                aas
0000672D  3F                aas
0000672E  3F                aas
0000672F  3F                aas
00006730  3F                aas
00006731  3F                aas
00006732  3F                aas
00006733  3F                aas
00006734  5E                pop esi
00006735  763C              jna 0x6773
00006737  3E0000            add [ds:eax],al
0000673A  0000              add [eax],al
0000673C  0000              add [eax],al
0000673E  0000              add [eax],al
00006740  3F                aas
00006741  3F                aas
00006742  2122              and [edx],esp
00006744  A7                cmpsd
00006745  2425              and al,0x25
00006747  262F              es das
00006749  2829              sub [ecx],ch
0000674B  3D5F2A3F3F        cmp eax,0x3f3f2a5f
00006750  51                push ecx
00006751  57                push edi
00006752  45                inc ebp
00006753  52                push edx
00006754  54                push esp
00006755  5A                pop edx
00006756  55                push ebp
00006757  49                dec ecx
00006758  4F                dec edi
00006759  50                push eax
0000675A  5B                pop ebx
0000675B  5D                pop ebp
0000675C  3F                aas
0000675D  3F                aas
0000675E  41                inc ecx
0000675F  53                push ebx
00006760  44                inc esp
00006761  46                inc esi
00006762  47                inc edi
00006763  48                dec eax
00006764  4A                dec edx
00006765  4B                dec ebx
00006766  4C                dec esp
00006767  3B27              cmp esp,[edi]
00006769  60                pusha
0000676A  3F                aas
0000676B  5C                pop esp
0000676C  59                pop ecx
0000676D  58                pop eax
0000676E  43                inc ebx
0000676F  56                push esi
00006770  42                inc edx
00006771  4E                dec esi
00006772  4D                dec ebp
00006773  2C2E              sub al,0x2e
00006775  2F                das
00006776  3F                aas
00006777  3F                aas
00006778  3F                aas
00006779  203F              and [edi],bh
0000677B  3F                aas
0000677C  3F                aas
0000677D  3F                aas
0000677E  3F                aas
0000677F  3F                aas
00006780  3F                aas
00006781  3F                aas
00006782  3F                aas
00006783  3F                aas
00006784  3F                aas
00006785  3F                aas
00006786  3F                aas
00006787  3F                aas
00006788  3F                aas
00006789  3F                aas
0000678A  3F                aas
0000678B  3F                aas
0000678C  3F                aas
0000678D  3F                aas
0000678E  3F                aas
0000678F  3F                aas
00006790  3F                aas
00006791  3F                aas
00006792  3F                aas
00006793  3F                aas
00006794  5E                pop esi
00006795  763C              jna 0x67d3
00006797  3E56              ds push esi
00006799  6964656F20496E74  imul esp,[ebp+0x6f],dword 0x746e4920
000067A1  657272            gs jc 0x6816
000067A4  7570              jnz 0x6816
000067A6  743A              jz 0x67e2
000067A8  2000              and [eax],al
000067AA  54                push esp
000067AB  657374            gs jnc 0x6822
000067AE  706F              jo 0x681f
000067B0  696E7465722025    imul ebp,[esi+0x74],dword 0x25207265
000067B7  700A              jo 0x67c3
000067B9  00426C            add [edx+0x6c],al
000067BC  6F                outsd
000067BD  636B20            arpl [ebx+0x20],bp
000067C0  61                popa
000067C1  7420              jz 0x67e3
000067C3  25702C2000        and eax,0x202c70
000067C8  53                push ebx
000067C9  697A653A202564    imul edi,[edx+0x65],dword 0x6425203a
000067D0  0A00              or al,[eax]
000067D2  0000              add [eax],al
000067D4  0000              add [eax],al
000067D6  0000              add [eax],al
000067D8  0000              add [eax],al
000067DA  0000              add [eax],al
000067DC  0000              add [eax],al
000067DE  0000              add [eax],al
000067E0  56                push esi
000067E1  52                push edx
000067E2  4F                dec edi
000067E3  4F                dec edi
000067E4  4D                dec ebp
000067E5  004573            add [ebp+0x73],al
000067E8  6300              arpl [eax],ax
000067EA  3100              xor [eax],eax
000067EC  3200              xor al,[eax]
000067EE  3300              xor eax,[eax]
000067F0  3400              xor al,0x0
000067F2  3500360037        xor eax,0x37003600
000067F7  0038              add [eax],bh
000067F9  0039              add [ecx],bh
000067FB  0030              add [eax],dh
000067FD  002D003D0042      add [dword 0x42003d00],ch
00006803  61                popa
00006804  636B73            arpl [ebx+0x73],bp
00006807  7061              jo 0x686a
00006809  636500            arpl [ebp+0x0],sp
0000680C  54                push esp
0000680D  61                popa
0000680E  6200              bound eax,[eax]
00006810  51                push ecx
00006811  005700            add [edi+0x0],dl
00006814  45                inc ebp
00006815  005200            add [edx+0x0],dl
00006818  54                push esp
00006819  005A00            add [edx+0x0],bl
0000681C  55                push ebp
0000681D  004900            add [ecx+0x0],cl
00006820  4F                dec edi
00006821  005000            add [eax+0x0],dl
00006824  5B                pop ebx
00006825  005D00            add [ebp+0x0],bl
00006828  45                inc ebp
00006829  6E                outsb
0000682A  7465              jz 0x6891
0000682C  7200              jc 0x682e
0000682E  4C                dec esp
0000682F  6374726C          arpl [edx+esi*2+0x6c],si
00006833  004100            add [ecx+0x0],al
00006836  53                push ebx
00006837  00440046          add [eax+eax+0x46],al
0000683B  004700            add [edi+0x0],al
0000683E  48                dec eax
0000683F  004A00            add [edx+0x0],cl
00006842  4B                dec ebx
00006843  004C003B          add [eax+eax+0x3b],cl
00006847  0027              add [edi],ah
00006849  006000            add [eax+0x0],ah
0000684C  4C                dec esp
0000684D  53                push ebx
0000684E  6869667400        push dword 0x746669
00006853  5C                pop esp
00006854  005900            add [ecx+0x0],bl
00006857  58                pop eax
00006858  004300            add [ebx+0x0],al
0000685B  56                push esi
0000685C  004200            add [edx+0x0],al
0000685F  4E                dec esi
00006860  004D00            add [ebp+0x0],cl
00006863  2C00              sub al,0x0
00006865  2E002F            add [cs:edi],ch
00006868  005253            add [edx+0x53],dl
0000686B  6869667400        push dword 0x746669
00006870  4B                dec ebx
00006871  657970            gs jns 0x68e4
00006874  61                popa
00006875  64202A            and [fs:edx],ch
00006878  004C416C          add [ecx+eax*2+0x6c],cl
0000687C  7400              jz 0x687e
0000687E  53                push ebx
0000687F  7061              jo 0x68e2
00006881  636562            arpl [ebp+0x62],sp
00006884  61                popa
00006885  7200              jc 0x6887
00006887  43                inc ebx
00006888  61                popa
00006889  7073              jo 0x68fe
0000688B  4C                dec esp
0000688C  6F                outsd
0000688D  636B00            arpl [ebx+0x0],bp
00006890  46                inc esi
00006891  3100              xor [eax],eax
00006893  46                inc esi
00006894  3200              xor al,[eax]
00006896  46                inc esi
00006897  3300              xor eax,[eax]
00006899  46                inc esi
0000689A  3400              xor al,0x0
0000689C  46                inc esi
0000689D  3500463600        xor eax,0x364600
000068A2  46                inc esi
000068A3  37                aaa
000068A4  004638            add [esi+0x38],al
000068A7  004639            add [esi+0x39],al
000068AA  004631            add [esi+0x31],al
000068AD  3000              xor [eax],al
000068AF  4E                dec esi
000068B0  756D              jnz 0x691f
000068B2  4C                dec esp
000068B3  6F                outsd
000068B4  636B00            arpl [ebx+0x0],bp
000068B7  53                push ebx
000068B8  63726F            arpl [edx+0x6f],si
000068BB  6C                insb
000068BC  6C                insb
000068BD  4C                dec esp
000068BE  6F                outsd
000068BF  636B00            arpl [ebx+0x0],bp
000068C2  4B                dec ebx
000068C3  657970            gs jns 0x6936
000068C6  61                popa
000068C7  642037            and [fs:edi],dh
000068CA  004B65            add [ebx+0x65],cl
000068CD  7970              jns 0x693f
000068CF  61                popa
000068D0  642038            and [fs:eax],bh
000068D3  004B65            add [ebx+0x65],cl
000068D6  7970              jns 0x6948
000068D8  61                popa
000068D9  642039            and [fs:ecx],bh
000068DC  004B65            add [ebx+0x65],cl
000068DF  7970              jns 0x6951
000068E1  61                popa
000068E2  64202D004B6579    and [dword fs:0x79654b00],ch
000068E9  7061              jo 0x694c
000068EB  64203400          and [fs:eax+eax],dh
000068EF  4B                dec ebx
000068F0  657970            gs jns 0x6963
000068F3  61                popa
000068F4  642035004B6579    and [dword fs:0x79654b00],dh
000068FB  7061              jo 0x695e
000068FD  642036            and [fs:esi],dh
00006900  004B65            add [ebx+0x65],cl
00006903  7970              jns 0x6975
00006905  61                popa
00006906  64202B            and [fs:ebx],ch
00006909  004B65            add [ebx+0x65],cl
0000690C  7970              jns 0x697e
0000690E  61                popa
0000690F  642031            and [fs:ecx],dh
00006912  004B65            add [ebx+0x65],cl
00006915  7970              jns 0x6987
00006917  61                popa
00006918  642032            and [fs:edx],dh
0000691B  004B65            add [ebx+0x65],cl
0000691E  7970              jns 0x6990
00006920  61                popa
00006921  642033            and [fs:ebx],dh
00006924  004B65            add [ebx+0x65],cl
00006927  7970              jns 0x6999
00006929  61                popa
0000692A  642030            and [fs:eax],dh
0000692D  004B65            add [ebx+0x65],cl
00006930  7970              jns 0x69a2
00006932  61                popa
00006933  64202E            and [fs:esi],ch
00006936  00416C            add [ecx+0x6c],al
00006939  7453              jz 0x698e
0000693B  7973              jns 0x69b0
0000693D  52                push edx
0000693E  657100            gs jno 0x6941
00006941  3F                aas
00006942  3F                aas
00006943  3F                aas
00006944  004631            add [esi+0x31],al
00006947  3100              xor [eax],eax
00006949  46                inc esi
0000694A  3132              xor [edx],esi
0000694C  005550            add [ebp+0x50],dl
0000694F  5F                pop edi
00006950  41                inc ecx
00006951  52                push edx
00006952  52                push edx
00006953  4F                dec edi
00006954  57                push edi
00006955  00444F57          add [edi+ecx*2+0x57],al
00006959  4E                dec esi
0000695A  5F                pop edi
0000695B  41                inc ecx
0000695C  52                push edx
0000695D  52                push edx
0000695E  4F                dec edi
0000695F  57                push edi
00006960  004C4546          add [ebp+eax*2+0x46],cl
00006964  54                push esp
00006965  5F                pop edi
00006966  41                inc ecx
00006967  52                push edx
00006968  52                push edx
00006969  4F                dec edi
0000696A  57                push edi
0000696B  005249            add [edx+0x49],dl
0000696E  47                inc edi
0000696F  48                dec eax
00006970  54                push esp
00006971  5F                pop edi
00006972  41                inc ecx
00006973  52                push edx
00006974  52                push edx
00006975  4F                dec edi
00006976  57                push edi
00006977  0000              add [eax],al
00006979  0000              add [eax],al
0000697B  0000              add [eax],al
0000697D  0000              add [eax],al
0000697F  005652            add [esi+0x52],dl
00006982  4F                dec edi
00006983  4F                dec edi
00006984  4F                dec edi
00006985  4D                dec ebp
00006986  0000              add [eax],al
00006988  0000              add [eax],al
0000698A  0000              add [eax],al
0000698C  45                inc ebp
0000698D  7363              jnc 0x69f2
0000698F  0000              add [eax],al
00006991  0000              add [eax],al
00006993  0000              add [eax],al
00006995  0000              add [eax],al
00006997  0031              add [ecx],dh
00006999  0000              add [eax],al
0000699B  0000              add [eax],al
0000699D  0000              add [eax],al
0000699F  0000              add [eax],al
000069A1  0000              add [eax],al
000069A3  0032              add [edx],dh
000069A5  0000              add [eax],al
000069A7  0000              add [eax],al
000069A9  0000              add [eax],al
000069AB  0000              add [eax],al
000069AD  0000              add [eax],al
000069AF  0033              add [ebx],dh
000069B1  0000              add [eax],al
000069B3  0000              add [eax],al
000069B5  0000              add [eax],al
000069B7  0000              add [eax],al
000069B9  0000              add [eax],al
000069BB  003400            add [eax+eax],dh
000069BE  0000              add [eax],al
000069C0  0000              add [eax],al
000069C2  0000              add [eax],al
000069C4  0000              add [eax],al
000069C6  0000              add [eax],al
000069C8  3500000000        xor eax,0x0
000069CD  0000              add [eax],al
000069CF  0000              add [eax],al
000069D1  0000              add [eax],al
000069D3  0036              add [esi],dh
000069D5  0000              add [eax],al
000069D7  0000              add [eax],al
000069D9  0000              add [eax],al
000069DB  0000              add [eax],al
000069DD  0000              add [eax],al
000069DF  0037              add [edi],dh
000069E1  0000              add [eax],al
000069E3  0000              add [eax],al
000069E5  0000              add [eax],al
000069E7  0000              add [eax],al
000069E9  0000              add [eax],al
000069EB  0038              add [eax],bh
000069ED  0000              add [eax],al
000069EF  0000              add [eax],al
000069F1  0000              add [eax],al
000069F3  0000              add [eax],al
000069F5  0000              add [eax],al
000069F7  0039              add [ecx],bh
000069F9  0000              add [eax],al
000069FB  0000              add [eax],al
000069FD  0000              add [eax],al
000069FF  0000              add [eax],al
00006A01  0000              add [eax],al
00006A03  0030              add [eax],dh
00006A05  0000              add [eax],al
00006A07  0000              add [eax],al
00006A09  0000              add [eax],al
00006A0B  0000              add [eax],al
00006A0D  0000              add [eax],al
00006A0F  002D00000000      add [dword 0x0],ch
00006A15  0000              add [eax],al
00006A17  0000              add [eax],al
00006A19  0000              add [eax],al
00006A1B  003D00000000      add [dword 0x0],bh
00006A21  0000              add [eax],al
00006A23  0000              add [eax],al
00006A25  0000              add [eax],al
00006A27  004261            add [edx+0x61],al
00006A2A  636B73            arpl [ebx+0x73],bp
00006A2D  7061              jo 0x6a90
00006A2F  636500            arpl [ebp+0x0],sp
00006A32  0000              add [eax],al
00006A34  54                push esp
00006A35  61                popa
00006A36  6200              bound eax,[eax]
00006A38  0000              add [eax],al
00006A3A  0000              add [eax],al
00006A3C  0000              add [eax],al
00006A3E  0000              add [eax],al
00006A40  51                push ecx
00006A41  0000              add [eax],al
00006A43  0000              add [eax],al
00006A45  0000              add [eax],al
00006A47  0000              add [eax],al
00006A49  0000              add [eax],al
00006A4B  005700            add [edi+0x0],dl
00006A4E  0000              add [eax],al
00006A50  0000              add [eax],al
00006A52  0000              add [eax],al
00006A54  0000              add [eax],al
00006A56  0000              add [eax],al
00006A58  45                inc ebp
00006A59  0000              add [eax],al
00006A5B  0000              add [eax],al
00006A5D  0000              add [eax],al
00006A5F  0000              add [eax],al
00006A61  0000              add [eax],al
00006A63  005200            add [edx+0x0],dl
00006A66  0000              add [eax],al
00006A68  0000              add [eax],al
00006A6A  0000              add [eax],al
00006A6C  0000              add [eax],al
00006A6E  0000              add [eax],al
00006A70  54                push esp
00006A71  0000              add [eax],al
00006A73  0000              add [eax],al
00006A75  0000              add [eax],al
00006A77  0000              add [eax],al
00006A79  0000              add [eax],al
00006A7B  005A00            add [edx+0x0],bl
00006A7E  0000              add [eax],al
00006A80  0000              add [eax],al
00006A82  0000              add [eax],al
00006A84  0000              add [eax],al
00006A86  0000              add [eax],al
00006A88  55                push ebp
00006A89  0000              add [eax],al
00006A8B  0000              add [eax],al
00006A8D  0000              add [eax],al
00006A8F  0000              add [eax],al
00006A91  0000              add [eax],al
00006A93  004900            add [ecx+0x0],cl
00006A96  0000              add [eax],al
00006A98  0000              add [eax],al
00006A9A  0000              add [eax],al
00006A9C  0000              add [eax],al
00006A9E  0000              add [eax],al
00006AA0  4F                dec edi
00006AA1  0000              add [eax],al
00006AA3  0000              add [eax],al
00006AA5  0000              add [eax],al
00006AA7  0000              add [eax],al
00006AA9  0000              add [eax],al
00006AAB  005000            add [eax+0x0],dl
00006AAE  0000              add [eax],al
00006AB0  0000              add [eax],al
00006AB2  0000              add [eax],al
00006AB4  0000              add [eax],al
00006AB6  0000              add [eax],al
00006AB8  5B                pop ebx
00006AB9  0000              add [eax],al
00006ABB  0000              add [eax],al
00006ABD  0000              add [eax],al
00006ABF  0000              add [eax],al
00006AC1  0000              add [eax],al
00006AC3  005D00            add [ebp+0x0],bl
00006AC6  0000              add [eax],al
00006AC8  0000              add [eax],al
00006ACA  0000              add [eax],al
00006ACC  0000              add [eax],al
00006ACE  0000              add [eax],al
00006AD0  45                inc ebp
00006AD1  6E                outsb
00006AD2  7465              jz 0x6b39
00006AD4  7200              jc 0x6ad6
00006AD6  0000              add [eax],al
00006AD8  0000              add [eax],al
00006ADA  0000              add [eax],al
00006ADC  4C                dec esp
00006ADD  6374726C          arpl [edx+esi*2+0x6c],si
00006AE1  0000              add [eax],al
00006AE3  0000              add [eax],al
00006AE5  0000              add [eax],al
00006AE7  004100            add [ecx+0x0],al
00006AEA  0000              add [eax],al
00006AEC  0000              add [eax],al
00006AEE  0000              add [eax],al
00006AF0  0000              add [eax],al
00006AF2  0000              add [eax],al
00006AF4  53                push ebx
00006AF5  0000              add [eax],al
00006AF7  0000              add [eax],al
00006AF9  0000              add [eax],al
00006AFB  0000              add [eax],al
00006AFD  0000              add [eax],al
00006AFF  00440000          add [eax+eax+0x0],al
00006B03  0000              add [eax],al
00006B05  0000              add [eax],al
00006B07  0000              add [eax],al
00006B09  0000              add [eax],al
00006B0B  004600            add [esi+0x0],al
00006B0E  0000              add [eax],al
00006B10  0000              add [eax],al
00006B12  0000              add [eax],al
00006B14  0000              add [eax],al
00006B16  0000              add [eax],al
00006B18  47                inc edi
00006B19  0000              add [eax],al
00006B1B  0000              add [eax],al
00006B1D  0000              add [eax],al
00006B1F  0000              add [eax],al
00006B21  0000              add [eax],al
00006B23  004800            add [eax+0x0],cl
00006B26  0000              add [eax],al
00006B28  0000              add [eax],al
00006B2A  0000              add [eax],al
00006B2C  0000              add [eax],al
00006B2E  0000              add [eax],al
00006B30  4A                dec edx
00006B31  0000              add [eax],al
00006B33  0000              add [eax],al
00006B35  0000              add [eax],al
00006B37  0000              add [eax],al
00006B39  0000              add [eax],al
00006B3B  004B00            add [ebx+0x0],cl
00006B3E  0000              add [eax],al
00006B40  0000              add [eax],al
00006B42  0000              add [eax],al
00006B44  0000              add [eax],al
00006B46  0000              add [eax],al
00006B48  4C                dec esp
00006B49  0000              add [eax],al
00006B4B  0000              add [eax],al
00006B4D  0000              add [eax],al
00006B4F  0000              add [eax],al
00006B51  0000              add [eax],al
00006B53  003B              add [ebx],bh
00006B55  0000              add [eax],al
00006B57  0000              add [eax],al
00006B59  0000              add [eax],al
00006B5B  0000              add [eax],al
00006B5D  0000              add [eax],al
00006B5F  0027              add [edi],ah
00006B61  0000              add [eax],al
00006B63  0000              add [eax],al
00006B65  0000              add [eax],al
00006B67  0000              add [eax],al
00006B69  0000              add [eax],al
00006B6B  006000            add [eax+0x0],ah
00006B6E  0000              add [eax],al
00006B70  0000              add [eax],al
00006B72  0000              add [eax],al
00006B74  0000              add [eax],al
00006B76  0000              add [eax],al
00006B78  4C                dec esp
00006B79  53                push ebx
00006B7A  6869667400        push dword 0x746669
00006B7F  0000              add [eax],al
00006B81  0000              add [eax],al
00006B83  005C0000          add [eax+eax+0x0],bl
00006B87  0000              add [eax],al
00006B89  0000              add [eax],al
00006B8B  0000              add [eax],al
00006B8D  0000              add [eax],al
00006B8F  005900            add [ecx+0x0],bl
00006B92  0000              add [eax],al
00006B94  0000              add [eax],al
00006B96  0000              add [eax],al
00006B98  0000              add [eax],al
00006B9A  0000              add [eax],al
00006B9C  58                pop eax
00006B9D  0000              add [eax],al
00006B9F  0000              add [eax],al
00006BA1  0000              add [eax],al
00006BA3  0000              add [eax],al
00006BA5  0000              add [eax],al
00006BA7  004300            add [ebx+0x0],al
00006BAA  0000              add [eax],al
00006BAC  0000              add [eax],al
00006BAE  0000              add [eax],al
00006BB0  0000              add [eax],al
00006BB2  0000              add [eax],al
00006BB4  56                push esi
00006BB5  0000              add [eax],al
00006BB7  0000              add [eax],al
00006BB9  0000              add [eax],al
00006BBB  0000              add [eax],al
00006BBD  0000              add [eax],al
00006BBF  004200            add [edx+0x0],al
00006BC2  0000              add [eax],al
00006BC4  0000              add [eax],al
00006BC6  0000              add [eax],al
00006BC8  0000              add [eax],al
00006BCA  0000              add [eax],al
00006BCC  4E                dec esi
00006BCD  0000              add [eax],al
00006BCF  0000              add [eax],al
00006BD1  0000              add [eax],al
00006BD3  0000              add [eax],al
00006BD5  0000              add [eax],al
00006BD7  004D00            add [ebp+0x0],cl
00006BDA  0000              add [eax],al
00006BDC  0000              add [eax],al
00006BDE  0000              add [eax],al
00006BE0  0000              add [eax],al
00006BE2  0000              add [eax],al
00006BE4  2C00              sub al,0x0
00006BE6  0000              add [eax],al
00006BE8  0000              add [eax],al
00006BEA  0000              add [eax],al
00006BEC  0000              add [eax],al
00006BEE  0000              add [eax],al
00006BF0  2E0000            add [cs:eax],al
00006BF3  0000              add [eax],al
00006BF5  0000              add [eax],al
00006BF7  0000              add [eax],al
00006BF9  0000              add [eax],al
00006BFB  002F              add [edi],ch
00006BFD  0000              add [eax],al
00006BFF  0000              add [eax],al
00006C01  0000              add [eax],al
00006C03  0000              add [eax],al
00006C05  0000              add [eax],al
00006C07  005253            add [edx+0x53],dl
00006C0A  6869667400        push dword 0x746669
00006C0F  0000              add [eax],al
00006C11  0000              add [eax],al
00006C13  004B65            add [ebx+0x65],cl
00006C16  7970              jns 0x6c88
00006C18  61                popa
00006C19  64202A            and [fs:edx],ch
00006C1C  0000              add [eax],al
00006C1E  0000              add [eax],al
00006C20  4C                dec esp
00006C21  41                inc ecx
00006C22  6C                insb
00006C23  7400              jz 0x6c25
00006C25  0000              add [eax],al
00006C27  0000              add [eax],al
00006C29  0000              add [eax],al
00006C2B  005370            add [ebx+0x70],dl
00006C2E  61                popa
00006C2F  636562            arpl [ebp+0x62],sp
00006C32  61                popa
00006C33  7200              jc 0x6c35
00006C35  0000              add [eax],al
00006C37  004361            add [ebx+0x61],al
00006C3A  7073              jo 0x6caf
00006C3C  4C                dec esp
00006C3D  6F                outsd
00006C3E  636B00            arpl [ebx+0x0],bp
00006C41  0000              add [eax],al
00006C43  004631            add [esi+0x31],al
00006C46  0000              add [eax],al
00006C48  0000              add [eax],al
00006C4A  0000              add [eax],al
00006C4C  0000              add [eax],al
00006C4E  0000              add [eax],al
00006C50  46                inc esi
00006C51  3200              xor al,[eax]
00006C53  0000              add [eax],al
00006C55  0000              add [eax],al
00006C57  0000              add [eax],al
00006C59  0000              add [eax],al
00006C5B  004633            add [esi+0x33],al
00006C5E  0000              add [eax],al
00006C60  0000              add [eax],al
00006C62  0000              add [eax],al
00006C64  0000              add [eax],al
00006C66  0000              add [eax],al
00006C68  46                inc esi
00006C69  3400              xor al,0x0
00006C6B  0000              add [eax],al
00006C6D  0000              add [eax],al
00006C6F  0000              add [eax],al
00006C71  0000              add [eax],al
00006C73  004635            add [esi+0x35],al
00006C76  0000              add [eax],al
00006C78  0000              add [eax],al
00006C7A  0000              add [eax],al
00006C7C  0000              add [eax],al
00006C7E  0000              add [eax],al
00006C80  46                inc esi
00006C81  360000            add [ss:eax],al
00006C84  0000              add [eax],al
00006C86  0000              add [eax],al
00006C88  0000              add [eax],al
00006C8A  0000              add [eax],al
00006C8C  46                inc esi
00006C8D  37                aaa
00006C8E  0000              add [eax],al
00006C90  0000              add [eax],al
00006C92  0000              add [eax],al
00006C94  0000              add [eax],al
00006C96  0000              add [eax],al
00006C98  46                inc esi
00006C99  3800              cmp [eax],al
00006C9B  0000              add [eax],al
00006C9D  0000              add [eax],al
00006C9F  0000              add [eax],al
00006CA1  0000              add [eax],al
00006CA3  004639            add [esi+0x39],al
00006CA6  0000              add [eax],al
00006CA8  0000              add [eax],al
00006CAA  0000              add [eax],al
00006CAC  0000              add [eax],al
00006CAE  0000              add [eax],al
00006CB0  46                inc esi
00006CB1  3130              xor [eax],esi
00006CB3  0000              add [eax],al
00006CB5  0000              add [eax],al
00006CB7  0000              add [eax],al
00006CB9  0000              add [eax],al
00006CBB  004E75            add [esi+0x75],cl
00006CBE  6D                insd
00006CBF  4C                dec esp
00006CC0  6F                outsd
00006CC1  636B00            arpl [ebx+0x0],bp
00006CC4  0000              add [eax],al
00006CC6  0000              add [eax],al
00006CC8  53                push ebx
00006CC9  63726F            arpl [edx+0x6f],si
00006CCC  6C                insb
00006CCD  6C                insb
00006CCE  4C                dec esp
00006CCF  6F                outsd
00006CD0  636B00            arpl [ebx+0x0],bp
00006CD3  004B65            add [ebx+0x65],cl
00006CD6  7970              jns 0x6d48
00006CD8  61                popa
00006CD9  642037            and [fs:edi],dh
00006CDC  0000              add [eax],al
00006CDE  0000              add [eax],al
00006CE0  4B                dec ebx
00006CE1  657970            gs jns 0x6d54
00006CE4  61                popa
00006CE5  642038            and [fs:eax],bh
00006CE8  0000              add [eax],al
00006CEA  0000              add [eax],al
00006CEC  4B                dec ebx
00006CED  657970            gs jns 0x6d60
00006CF0  61                popa
00006CF1  642039            and [fs:ecx],bh
00006CF4  0000              add [eax],al
00006CF6  0000              add [eax],al
00006CF8  4B                dec ebx
00006CF9  657970            gs jns 0x6d6c
00006CFC  61                popa
00006CFD  64202D00000000    and [dword fs:0x0],ch
00006D04  4B                dec ebx
00006D05  657970            gs jns 0x6d78
00006D08  61                popa
00006D09  64203400          and [fs:eax+eax],dh
00006D0D  0000              add [eax],al
00006D0F  004B65            add [ebx+0x65],cl
00006D12  7970              jns 0x6d84
00006D14  61                popa
00006D15  64203500000000    and [dword fs:0x0],dh
00006D1C  4B                dec ebx
00006D1D  657970            gs jns 0x6d90
00006D20  61                popa
00006D21  642036            and [fs:esi],dh
00006D24  0000              add [eax],al
00006D26  0000              add [eax],al
00006D28  4B                dec ebx
00006D29  657970            gs jns 0x6d9c
00006D2C  61                popa
00006D2D  64202B            and [fs:ebx],ch
00006D30  0000              add [eax],al
00006D32  0000              add [eax],al
00006D34  4B                dec ebx
00006D35  657970            gs jns 0x6da8
00006D38  61                popa
00006D39  642031            and [fs:ecx],dh
00006D3C  0000              add [eax],al
00006D3E  0000              add [eax],al
00006D40  4B                dec ebx
00006D41  657970            gs jns 0x6db4
00006D44  61                popa
00006D45  642032            and [fs:edx],dh
00006D48  0000              add [eax],al
00006D4A  0000              add [eax],al
00006D4C  4B                dec ebx
00006D4D  657970            gs jns 0x6dc0
00006D50  61                popa
00006D51  642033            and [fs:ebx],dh
00006D54  0000              add [eax],al
00006D56  0000              add [eax],al
00006D58  4B                dec ebx
00006D59  657970            gs jns 0x6dcc
00006D5C  61                popa
00006D5D  642030            and [fs:eax],dh
00006D60  0000              add [eax],al
00006D62  0000              add [eax],al
00006D64  4B                dec ebx
00006D65  657970            gs jns 0x6dd8
00006D68  61                popa
00006D69  64202E            and [fs:esi],ch
00006D6C  0000              add [eax],al
00006D6E  0000              add [eax],al
00006D70  41                inc ecx
00006D71  6C                insb
00006D72  7453              jz 0x6dc7
00006D74  7973              jns 0x6de9
00006D76  52                push edx
00006D77  657100            gs jno 0x6d7a
00006D7A  0000              add [eax],al
00006D7C  3F                aas
00006D7D  3F                aas
00006D7E  3F                aas
00006D7F  0000              add [eax],al
00006D81  0000              add [eax],al
00006D83  0000              add [eax],al
00006D85  0000              add [eax],al
00006D87  003F              add [edi],bh
00006D89  3F                aas
00006D8A  3F                aas
00006D8B  0000              add [eax],al
00006D8D  0000              add [eax],al
00006D8F  0000              add [eax],al
00006D91  0000              add [eax],al
00006D93  004631            add [esi+0x31],al
00006D96  3100              xor [eax],eax
00006D98  0000              add [eax],al
00006D9A  0000              add [eax],al
00006D9C  0000              add [eax],al
00006D9E  0000              add [eax],al
00006DA0  46                inc esi
00006DA1  3132              xor [edx],esi
00006DA3  0000              add [eax],al
00006DA5  0000              add [eax],al
00006DA7  0000              add [eax],al
00006DA9  0000              add [eax],al
00006DAB  005550            add [ebp+0x50],dl
00006DAE  5F                pop edi
00006DAF  41                inc ecx
00006DB0  52                push edx
00006DB1  52                push edx
00006DB2  4F                dec edi
00006DB3  57                push edi
00006DB4  0000              add [eax],al
00006DB6  0000              add [eax],al
00006DB8  44                inc esp
00006DB9  4F                dec edi
00006DBA  57                push edi
00006DBB  4E                dec esi
00006DBC  5F                pop edi
00006DBD  41                inc ecx
00006DBE  52                push edx
00006DBF  52                push edx
00006DC0  4F                dec edi
00006DC1  57                push edi
00006DC2  0000              add [eax],al
00006DC4  4C                dec esp
00006DC5  45                inc ebp
00006DC6  46                inc esi
00006DC7  54                push esp
00006DC8  5F                pop edi
00006DC9  41                inc ecx
00006DCA  52                push edx
00006DCB  52                push edx
00006DCC  4F                dec edi
00006DCD  57                push edi
00006DCE  0000              add [eax],al
00006DD0  52                push edx
00006DD1  49                dec ecx
00006DD2  47                inc edi
00006DD3  48                dec eax
00006DD4  54                push esp
00006DD5  5F                pop edi
00006DD6  41                inc ecx
00006DD7  52                push edx
00006DD8  52                push edx
00006DD9  4F                dec edi
00006DDA  57                push edi
00006DDB  0000              add [eax],al
00006DDD  0000              add [eax],al
00006DDF  003F              add [edi],bh
00006DE1  0031              add [ecx],dh
00006DE3  3233              xor dh,[ebx]
00006DE5  3435              xor al,0x35
00006DE7  3637              ss aaa
00006DE9  3839              cmp [ecx],bh
00006DEB  302D3D9F3F71      xor [dword 0x713f9f3d],ch
00006DF1  7765              ja 0x6e58
00006DF3  7274              jc 0x6e69
00006DF5  7A75              jpe 0x6e6c
00006DF7  696F705B5D3F3F    imul ebp,[edi+0x70],dword 0x3f3f5d5b
00006DFE  61                popa
00006DFF  7364              jnc 0x6e65
00006E01  6667686A6B        push word 0x6b6a
00006E06  6C                insb
00006E07  3B27              cmp esp,[edi]
00006E09  60                pusha
00006E0A  005C7978          add [ecx+edi*2+0x78],bl
00006E0E  637662            arpl [esi+0x62],si
00006E11  6E                outsb
00006E12  6D                insd
00006E13  2C2E              sub al,0x2e
00006E15  2F                das
00006E16  3F                aas
00006E17  3F                aas
00006E18  3F                aas
00006E19  203F              and [edi],bh
00006E1B  3F                aas
00006E1C  3F                aas
00006E1D  3F                aas
00006E1E  3F                aas
00006E1F  3F                aas
00006E20  3F                aas
00006E21  3F                aas
00006E22  3F                aas
00006E23  3F                aas
00006E24  3F                aas
00006E25  3F                aas
00006E26  3F                aas
00006E27  3F                aas
00006E28  3F                aas
00006E29  3F                aas
00006E2A  3F                aas
00006E2B  3F                aas
00006E2C  3F                aas
00006E2D  3F                aas
00006E2E  3F                aas
00006E2F  3F                aas
00006E30  3F                aas
00006E31  3F                aas
00006E32  3F                aas
00006E33  3F                aas
00006E34  5E                pop esi
00006E35  763C              jna 0x6e73
00006E37  3E0000            add [ds:eax],al
00006E3A  0000              add [eax],al
00006E3C  0000              add [eax],al
00006E3E  0000              add [eax],al
00006E40  3F                aas
00006E41  0021              add [ecx],ah
00006E43  22A72425262F      and ah,[edi+0x2f262524]
00006E49  2829              sub [ecx],ch
00006E4B  3D5F2A3F3F        cmp eax,0x3f3f2a5f
00006E50  51                push ecx
00006E51  57                push edi
00006E52  45                inc ebp
00006E53  52                push edx
00006E54  54                push esp
00006E55  5A                pop edx
00006E56  55                push ebp
00006E57  49                dec ecx
00006E58  4F                dec edi
00006E59  50                push eax
00006E5A  5B                pop ebx
00006E5B  5D                pop ebp
00006E5C  3F                aas
00006E5D  3F                aas
00006E5E  41                inc ecx
00006E5F  53                push ebx
00006E60  44                inc esp
00006E61  46                inc esi
00006E62  47                inc edi
00006E63  48                dec eax
00006E64  4A                dec edx
00006E65  4B                dec ebx
00006E66  4C                dec esp
00006E67  3B27              cmp esp,[edi]
00006E69  60                pusha
00006E6A  005C5958          add [ecx+ebx*2+0x58],bl
00006E6E  43                inc ebx
00006E6F  56                push esi
00006E70  42                inc edx
00006E71  4E                dec esi
00006E72  4D                dec ebp
00006E73  2C2E              sub al,0x2e
00006E75  2F                das
00006E76  3F                aas
00006E77  3F                aas
00006E78  3F                aas
00006E79  203F              and [edi],bh
00006E7B  3F                aas
00006E7C  3F                aas
00006E7D  3F                aas
00006E7E  3F                aas
00006E7F  3F                aas
00006E80  3F                aas
00006E81  3F                aas
00006E82  3F                aas
00006E83  3F                aas
00006E84  3F                aas
00006E85  3F                aas
00006E86  3F                aas
00006E87  3F                aas
00006E88  3F                aas
00006E89  3F                aas
00006E8A  3F                aas
00006E8B  3F                aas
00006E8C  3F                aas
00006E8D  3F                aas
00006E8E  3F                aas
00006E8F  3F                aas
00006E90  3F                aas
00006E91  3F                aas
00006E92  3F                aas
00006E93  3F                aas
00006E94  5E                pop esi
00006E95  763C              jna 0x6ed3
00006E97  3E2000            and [ds:eax],al
00006E9A  2573002573        and eax,0x73250073
00006E9F  0A00              or al,[eax]
00006EA1  7465              jz 0x6f08
00006EA3  7374              jnc 0x6f19
00006EA5  0A00              or al,[eax]
00006EA7  2563007465        and eax,0x65740063
00006EAC  7374              jnc 0x6f22
00006EAE  0000              add [eax],al
00006EB0  0900              or [eax],eax
00006EB2  307825            xor [eax+0x25],bh
00006EB5  3032              xor [edx],dh
00006EB7  58                pop eax
00006EB8  2C00              sub al,0x0
00006EBA  0A09              or cl,[ecx]
00006EBC  0020              add [eax],ah
00006EBE  000A              add [edx],cl
00006EC0  00756E            add [ebp+0x6e],dh
00006EC3  7369              jnc 0x6f2e
00006EC5  676E              a16 outsb
00006EC7  6564206368        and [fs:ebx+0x68],ah
00006ECC  61                popa
00006ECD  7220              jc 0x6eef
00006ECF  675F              pop edi
00006ED1  6D                insd
00006ED2  6F                outsd
00006ED3  64655B            gs pop ebx
00006ED6  5D                pop ebp
00006ED7  203D0A007B0A      and [dword 0xa7b000a],bh
00006EDD  002F              add [edi],ch
00006EDF  2A20              sub ah,[eax]
00006EE1  4D                dec ebp
00006EE2  49                dec ecx
00006EE3  53                push ebx
00006EE4  43                inc ebx
00006EE5  202A              and [edx],ch
00006EE7  2F                das
00006EE8  0A00              or al,[eax]
00006EEA  0930              or [eax],esi
00006EEC  7825              js 0x6f13
00006EEE  3032              xor [edx],dh
00006EF0  58                pop eax
00006EF1  2C0A              sub al,0xa
00006EF3  002F              add [edi],ch
00006EF5  2A20              sub ah,[eax]
00006EF7  53                push ebx
00006EF8  45                inc ebp
00006EF9  51                push ecx
00006EFA  202A              and [edx],ch
00006EFC  2F                das
00006EFD  0A00              or al,[eax]
00006EFF  2F                das
00006F00  2A20              sub ah,[eax]
00006F02  43                inc ebx
00006F03  52                push edx
00006F04  54                push esp
00006F05  43                inc ebx
00006F06  202A              and [edx],ch
00006F08  2F                das
00006F09  0A00              or al,[eax]
00006F0B  2F                das
00006F0C  2A20              sub ah,[eax]
00006F0E  47                inc edi
00006F0F  43                inc ebx
00006F10  202A              and [edx],ch
00006F12  2F                das
00006F13  0A00              or al,[eax]
00006F15  2F                das
00006F16  2A20              sub ah,[eax]
00006F18  41                inc ecx
00006F19  43                inc ebx
00006F1A  202A              and [edx],ch
00006F1C  2F                das
00006F1D  0A00              or al,[eax]
00006F1F  7D3B              jnl 0x6f5c
00006F21  0A00              or al,[eax]
00006F23  005363            add [ebx+0x63],dl
00006F26  7265              jc 0x6f8d
00006F28  656E              gs outsb
00006F2A  2D636C6561        sub eax,0x61656c63
00006F2F  7220              jc 0x6f51
00006F31  696E2031362D63    imul ebp,[esi+0x20],dword 0x632d3631
00006F38  6F                outsd
00006F39  6C                insb
00006F3A  6F                outsd
00006F3B  7220              jc 0x6f5d
00006F3D  6D                insd
00006F3E  6F                outsd
00006F3F  6465207769        and [gs:edi+0x69],dh
00006F44  6C                insb
00006F45  6C                insb
00006F46  206265            and [edx+0x65],ah
00006F49  205645            and [esi+0x45],dl
00006F4C  52                push edx
00006F4D  59                pop ecx
00006F4E  20534C            and [ebx+0x4c],dl
00006F51  4F                dec edi
00006F52  57                push edi
00006F53  0A5072            or dl,[eax+0x72]
00006F56  657373            gs jnc 0x6fcc
00006F59  206120            and [ecx+0x20],ah
00006F5C  6B657920          imul esp,[ebp+0x79],byte +0x20
00006F60  746F              jz 0x6fd1
00006F62  20636F            and [ebx+0x6f],ah
00006F65  6E                outsb
00006F66  7469              jz 0x6fd1
00006F68  6E                outsb
00006F69  7565              jnz 0x6fd0
00006F6B  0A00              or al,[eax]
00006F6D  7065              jo 0x6fd4
00006F6F  7374              jnc 0x6fe5
00006F71  0000              add [eax],al
00006F73  001400            add [eax+eax],dl
00006F76  0000              add [eax],al
00006F78  0000              add [eax],al
00006F7A  0000              add [eax],al
00006F7C  017A52            add [edx+0x52],edi
00006F7F  0001              add [ecx],al
00006F81  7C08              jl 0x6f8b
00006F83  011B              add [ebx],ebx
00006F85  0C04              or al,0x4
00006F87  0488              add al,0x88
00006F89  0100              add [eax],eax
00006F8B  001C00            add [eax+eax],bl
00006F8E  0000              add [eax],al
00006F90  1C00              sbb al,0x0
00006F92  0000              add [eax],al
00006F94  6C                insb
00006F95  90                nop
00006F96  FF                db 0xff
00006F97  FF1500000000      call [dword 0x0]
00006F9D  41                inc ecx
00006F9E  0E                push cs
00006F9F  088502420D05      or [ebp+0x50d4202],al
00006FA5  51                push ecx
00006FA6  C50C04            lds ecx,[esp+eax]
00006FA9  0400              add al,0x0
00006FAB  001C00            add [eax+eax],bl
00006FAE  0000              add [eax],al
00006FB0  3C00              cmp al,0x0
00006FB2  0000              add [eax],al
00006FB4  61                popa
00006FB5  90                nop
00006FB6  FF                db 0xff
00006FB7  FF1500000000      call [dword 0x0]
00006FBD  41                inc ecx
00006FBE  0E                push cs
00006FBF  088502420D05      or [ebp+0x50d4202],al
00006FC5  51                push ecx
00006FC6  C50C04            lds ecx,[esp+eax]
00006FC9  0400              add al,0x0
00006FCB  001C00            add [eax+eax],bl
00006FCE  0000              add [eax],al
00006FD0  5C                pop esp
00006FD1  0000              add [eax],al
00006FD3  005690            add [esi-0x70],dl
00006FD6  FF                db 0xff
00006FD7  FF                db 0xff
00006FD8  7E01              jng 0x6fdb
00006FDA  0000              add [eax],al
00006FDC  00410E            add [ecx+0xe],al
00006FDF  088502420D05      or [ebp+0x50d4202],al
00006FE5  037A01            add edi,[edx+0x1]
00006FE8  C50C04            lds ecx,[esp+eax]
00006FEB  041C              add al,0x1c
00006FED  0000              add [eax],al
00006FEF  007C0000          add [eax+eax+0x0],bh
00006FF3  00B491FFFF4900    add [ecx+edx*4+0x49ffff],dh
00006FFA  0000              add [eax],al
00006FFC  00410E            add [ecx+0xe],al
00006FFF  088502420D05      or [ebp+0x50d4202],al
00007005  0245C5            add al,[ebp-0x3b]
00007008  0C04              or al,0x4
0000700A  0400              add al,0x0
0000700C  1C00              sbb al,0x0
0000700E  0000              add [eax],al
00007010  9C                pushf
00007011  0000              add [eax],al
00007013  00DD              add ch,bl
00007015  91                xchg eax,ecx
00007016  FF                db 0xff
00007017  FF32              push dword [edx]
00007019  0100              add [eax],eax
0000701B  0000              add [eax],al
0000701D  41                inc ecx
0000701E  0E                push cs
0000701F  088502420D05      or [ebp+0x50d4202],al
00007025  032E              add ebp,[esi]
00007027  01C5              add ebp,eax
00007029  0C04              or al,0x4
0000702B  041C              add al,0x1c
0000702D  0000              add [eax],al
0000702F  00BC000000EF92    add [eax+eax-0x6d110000],bh
00007036  FF                db 0xff
00007037  FF640100          jmp [ecx+eax+0x0]
0000703B  0000              add [eax],al
0000703D  41                inc ecx
0000703E  0E                push cs
0000703F  088502420D05      or [ebp+0x50d4202],al
00007045  036001            add esp,[eax+0x1]
00007048  C50C04            lds ecx,[esp+eax]
0000704B  041C              add al,0x1c
0000704D  0000              add [eax],al
0000704F  00DC              add ah,bl
00007051  0000              add [eax],al
00007053  0033              add [ebx],dh
00007055  94                xchg eax,esp
00007056  FF                db 0xff
00007057  FFAC0300000041    jmp far [ebx+eax+0x41000000]
0000705E  0E                push cs
0000705F  088502420D05      or [ebp+0x50d4202],al
00007065  03A803C50C04      add ebp,[eax+0x40cc503]
0000706B  041C              add al,0x1c
0000706D  0000              add [eax],al
0000706F  00FC              add ah,bh
00007071  0000              add [eax],al
00007073  00BF97FFFFF4      add [edi-0xb000069],bh
00007079  0000              add [eax],al
0000707B  0000              add [eax],al
0000707D  41                inc ecx
0000707E  0E                push cs
0000707F  088502420D05      or [ebp+0x50d4202],al
00007085  02F0              add dh,al
00007087  C50C04            lds ecx,[esp+eax]
0000708A  0400              add al,0x0
0000708C  1C00              sbb al,0x0
0000708E  0000              add [eax],al
00007090  1C01              sbb al,0x1
00007092  0000              add [eax],al
00007094  93                xchg eax,ebx
00007095  98                cwde
00007096  FF                db 0xff
00007097  FFD3              call ebx
00007099  0000              add [eax],al
0000709B  0000              add [eax],al
0000709D  41                inc ecx
0000709E  0E                push cs
0000709F  088502420D05      or [ebp+0x50d4202],al
000070A5  02CF              add cl,bh
000070A7  C50C04            lds ecx,[esp+eax]
000070AA  0400              add al,0x0
000070AC  1C00              sbb al,0x0
000070AE  0000              add [eax],al
000070B0  3C01              cmp al,0x1
000070B2  0000              add [eax],al
000070B4  46                inc esi
000070B5  99                cdq
000070B6  FF                db 0xff
000070B7  FF4700            inc dword [edi+0x0]
000070BA  0000              add [eax],al
000070BC  00410E            add [ecx+0xe],al
000070BF  088502420D05      or [ebp+0x50d4202],al
000070C5  0243C5            add al,[ebx-0x3b]
000070C8  0C04              or al,0x4
000070CA  0400              add al,0x0
000070CC  1C00              sbb al,0x0
000070CE  0000              add [eax],al
000070D0  5C                pop esp
000070D1  0100              add [eax],eax
000070D3  006D99            add [ebp-0x67],ch
000070D6  FF                db 0xff
000070D7  FF4700            inc dword [edi+0x0]
000070DA  0000              add [eax],al
000070DC  00410E            add [ecx+0xe],al
000070DF  088502420D05      or [ebp+0x50d4202],al
000070E5  0243C5            add al,[ebx-0x3b]
000070E8  0C04              or al,0x4
000070EA  0400              add al,0x0
000070EC  1C00              sbb al,0x0
000070EE  0000              add [eax],al
000070F0  7C01              jl 0x70f3
000070F2  0000              add [eax],al
000070F4  94                xchg eax,esp
000070F5  99                cdq
000070F6  FF                db 0xff
000070F7  FFA100000000      jmp [ecx+0x0]
000070FD  41                inc ecx
000070FE  0E                push cs
000070FF  088502420D05      or [ebp+0x50d4202],al
00007105  029DC50C0404      add bl,[ebp+0x4040cc5]
0000710B  001C00            add [eax+eax],bl
0000710E  0000              add [eax],al
00007110  9C                pushf
00007111  0100              add [eax],eax
00007113  00159AFFFF5D      add [dword 0x5dffff9a],dl
00007119  0000              add [eax],al
0000711B  0000              add [eax],al
0000711D  41                inc ecx
0000711E  0E                push cs
0000711F  088502420D05      or [ebp+0x50d4202],al
00007125  0259C5            add bl,[ecx-0x3b]
00007128  0C04              or al,0x4
0000712A  0400              add al,0x0
0000712C  1C00              sbb al,0x0
0000712E  0000              add [eax],al
00007130  BC01000052        mov esp,0x52000001
00007135  9AFFFF60000000    call 0x0:0x60ffff
0000713C  00410E            add [ecx+0xe],al
0000713F  088502420D05      or [ebp+0x50d4202],al
00007145  025CC50C          add bl,[ebp+eax*8+0xc]
00007149  0404              add al,0x4
0000714B  001C00            add [eax+eax],bl
0000714E  0000              add [eax],al
00007150  DC01              fadd qword [ecx]
00007152  0000              add [eax],al
00007154  92                xchg eax,edx
00007155  9AFFFF64000000    call 0x0:0x64ffff
0000715C  00410E            add [ecx+0xe],al
0000715F  088502420D05      or [ebp+0x50d4202],al
00007165  0260C5            add ah,[eax-0x3b]
00007168  0C04              or al,0x4
0000716A  0400              add al,0x0
0000716C  1C00              sbb al,0x0
0000716E  0000              add [eax],al
00007170  FC                cld
00007171  0100              add [eax],eax
00007173  00D6              add dh,dl
00007175  9AFFFF4E000000    call 0x0:0x4effff
0000717C  00410E            add [ecx+0xe],al
0000717F  088502420D05      or [ebp+0x50d4202],al
00007185  024AC5            add cl,[edx-0x3b]
00007188  0C04              or al,0x4
0000718A  0400              add al,0x0
0000718C  1C00              sbb al,0x0
0000718E  0000              add [eax],al
00007190  1C02              sbb al,0x2
00007192  0000              add [eax],al
00007194  049B              add al,0x9b
00007196  FF                db 0xff
00007197  FF37              push dword [edi]
00007199  0000              add [eax],al
0000719B  0000              add [eax],al
0000719D  41                inc ecx
0000719E  0E                push cs
0000719F  088502420D05      or [ebp+0x50d4202],al
000071A5  73C5              jnc 0x716c
000071A7  0C04              or al,0x4
000071A9  0400              add al,0x0
000071AB  001C00            add [eax+eax],bl
000071AE  0000              add [eax],al
000071B0  3C02              cmp al,0x2
000071B2  0000              add [eax],al
000071B4  1B9BFFFFD100      sbb ebx,[ebx+0xd1ffff]
000071BA  0000              add [eax],al
000071BC  00410E            add [ecx+0xe],al
000071BF  088502420D05      or [ebp+0x50d4202],al
000071C5  02CD              add cl,ch
000071C7  C50C04            lds ecx,[esp+eax]
000071CA  0400              add al,0x0
000071CC  1C00              sbb al,0x0
000071CE  0000              add [eax],al
000071D0  5C                pop esp
000071D1  0200              add al,[eax]
000071D3  00CC              add ah,cl
000071D5  9B                wait
000071D6  FF                db 0xff
000071D7  FFC8              dec eax
000071D9  0500000041        add eax,0x41000000
000071DE  0E                push cs
000071DF  088502420D05      or [ebp+0x50d4202],al
000071E5  03C4              add eax,esp
000071E7  05C50C0404        add eax,0x4040cc5
000071EC  1C00              sbb al,0x0
000071EE  0000              add [eax],al
000071F0  7C02              jl 0x71f4
000071F2  0000              add [eax],al
000071F4  74A1              jz 0x7197
000071F6  FF                db 0xff
000071F7  FFF4              push esp
000071F9  0000              add [eax],al
000071FB  0000              add [eax],al
000071FD  41                inc ecx
000071FE  0E                push cs
000071FF  088502420D05      or [ebp+0x50d4202],al
00007205  02F0              add dh,al
00007207  C50C04            lds ecx,[esp+eax]
0000720A  0400              add al,0x0
0000720C  1400              adc al,0x0
0000720E  0000              add [eax],al
00007210  0000              add [eax],al
00007212  0000              add [eax],al
00007214  017A52            add [edx+0x52],edi
00007217  0001              add [ecx],al
00007219  7C08              jl 0x7223
0000721B  011B              add [ebx],ebx
0000721D  0C04              or al,0x4
0000721F  0488              add al,0x88
00007221  0100              add [eax],eax
00007223  001C00            add [eax+eax],bl
00007226  0000              add [eax],al
00007228  1C00              sbb al,0x0
0000722A  0000              add [eax],al
0000722C  09A4FFFF430400    or [edi+edi*8+0x443ff],esp
00007233  0000              add [eax],al
00007235  41                inc ecx
00007236  0E                push cs
00007237  088502420D05      or [ebp+0x50d4202],al
0000723D  033F              add edi,[edi]
0000723F  04C5              add al,0xc5
00007241  0C04              or al,0x4
00007243  041C              add al,0x1c
00007245  0000              add [eax],al
00007247  003C00            add [eax+eax],bh
0000724A  0000              add [eax],al
0000724C  2CA8              sub al,0xa8
0000724E  FF                db 0xff
0000724F  FF7700            push dword [edi+0x0]
00007252  0000              add [eax],al
00007254  00410E            add [ecx+0xe],al
00007257  088502420D05      or [ebp+0x50d4202],al
0000725D  0273C5            add dh,[ebx-0x3b]
00007260  0C04              or al,0x4
00007262  0400              add al,0x0
00007264  1C00              sbb al,0x0
00007266  0000              add [eax],al
00007268  5C                pop esp
00007269  0000              add [eax],al
0000726B  0083A8FFFF1D      add [ebx+0x1dffffa8],al
00007271  0000              add [eax],al
00007273  0000              add [eax],al
00007275  41                inc ecx
00007276  0E                push cs
00007277  088502420D05      or [ebp+0x50d4202],al
0000727D  59                pop ecx
0000727E  C50C04            lds ecx,[esp+eax]
00007281  0400              add al,0x0
00007283  001C00            add [eax+eax],bl
00007286  0000              add [eax],al
00007288  7C00              jl 0x728a
0000728A  0000              add [eax],al
0000728C  80A8FFFF640000    sub byte [eax+0x64ffff],0x0
00007293  0000              add [eax],al
00007295  41                inc ecx
00007296  0E                push cs
00007297  088502420D05      or [ebp+0x50d4202],al
0000729D  0260C5            add ah,[eax-0x3b]
000072A0  0C04              or al,0x4
000072A2  0400              add al,0x0
000072A4  1400              adc al,0x0
000072A6  0000              add [eax],al
000072A8  0000              add [eax],al
000072AA  0000              add [eax],al
000072AC  017A52            add [edx+0x52],edi
000072AF  0001              add [ecx],al
000072B1  7C08              jl 0x72bb
000072B3  011B              add [ebx],ebx
000072B5  0C04              or al,0x4
000072B7  0488              add al,0x88
000072B9  0100              add [eax],eax
000072BB  001C00            add [eax+eax],bl
000072BE  0000              add [eax],al
000072C0  1C00              sbb al,0x0
000072C2  0000              add [eax],al
000072C4  AC                lodsb
000072C5  A8FF              test al,0xff
000072C7  FF3400            push dword [eax+eax]
000072CA  0000              add [eax],al
000072CC  00410E            add [ecx+0xe],al
000072CF  088502420D05      or [ebp+0x50d4202],al
000072D5  70C5              jo 0x729c
000072D7  0C04              or al,0x4
000072D9  0400              add al,0x0
000072DB  001C00            add [eax+eax],bl
000072DE  0000              add [eax],al
000072E0  3C00              cmp al,0x0
000072E2  0000              add [eax],al
000072E4  C0A8FFFF330000    shr byte [eax+0x33ffff],byte 0x0
000072EB  0000              add [eax],al
000072ED  41                inc ecx
000072EE  0E                push cs
000072EF  088502420D05      or [ebp+0x50d4202],al
000072F5  6F                outsd
000072F6  C50C04            lds ecx,[esp+eax]
000072F9  0400              add al,0x0
000072FB  001C00            add [eax+eax],bl
000072FE  0000              add [eax],al
00007300  5C                pop esp
00007301  0000              add [eax],al
00007303  00D3              add bl,dl
00007305  A8FF              test al,0xff
00007307  FF4700            inc dword [edi+0x0]
0000730A  0000              add [eax],al
0000730C  00410E            add [ecx+0xe],al
0000730F  088502420D05      or [ebp+0x50d4202],al
00007315  0243C5            add al,[ebx-0x3b]
00007318  0C04              or al,0x4
0000731A  0400              add al,0x0
0000731C  1C00              sbb al,0x0
0000731E  0000              add [eax],al
00007320  7C00              jl 0x7322
00007322  0000              add [eax],al
00007324  FA                cli
00007325  A8FF              test al,0xff
00007327  FF9500000000      call [ebp+0x0]
0000732D  41                inc ecx
0000732E  0E                push cs
0000732F  088502420D05      or [ebp+0x50d4202],al
00007335  0291C50C0404      add dl,[ecx+0x4040cc5]
0000733B  001C00            add [eax+eax],bl
0000733E  0000              add [eax],al
00007340  9C                pushf
00007341  0000              add [eax],al
00007343  006FA9            add [edi-0x57],ch
00007346  FF                db 0xff
00007347  FF5000            call [eax+0x0]
0000734A  0000              add [eax],al
0000734C  00410E            add [ecx+0xe],al
0000734F  088502420D05      or [ebp+0x50d4202],al
00007355  024CC50C          add cl,[ebp+eax*8+0xc]
00007359  0404              add al,0x4
0000735B  001C00            add [eax+eax],bl
0000735E  0000              add [eax],al
00007360  BC0000009F        mov esp,0x9f000000
00007365  A9FFFF6500        test eax,0x65ffff
0000736A  0000              add [eax],al
0000736C  00410E            add [ecx+0xe],al
0000736F  088502420D05      or [ebp+0x50d4202],al
00007375  0261C5            add ah,[ecx-0x3b]
00007378  0C04              or al,0x4
0000737A  0400              add al,0x0
0000737C  1C00              sbb al,0x0
0000737E  0000              add [eax],al
00007380  DC00              fadd qword [eax]
00007382  0000              add [eax],al
00007384  E4A9              in al,0xa9
00007386  FF                db 0xff
00007387  FF9200000000      call [edx+0x0]
0000738D  41                inc ecx
0000738E  0E                push cs
0000738F  088502420D05      or [ebp+0x50d4202],al
00007395  028EC50C0404      add cl,[esi+0x4040cc5]
0000739B  001C00            add [eax+eax],bl
0000739E  0000              add [eax],al
000073A0  FC                cld
000073A1  0000              add [eax],al
000073A3  0056AA            add [esi-0x56],dl
000073A6  FF                db 0xff
000073A7  FF6E00            jmp far [esi+0x0]
000073AA  0000              add [eax],al
000073AC  00410E            add [ecx+0xe],al
000073AF  088502420D05      or [ebp+0x50d4202],al
000073B5  026AC5            add ch,[edx-0x3b]
000073B8  0C04              or al,0x4
000073BA  0400              add al,0x0
000073BC  1C00              sbb al,0x0
000073BE  0000              add [eax],al
000073C0  1C01              sbb al,0x1
000073C2  0000              add [eax],al
000073C4  A4                movsb
000073C5  AA                stosb
000073C6  FF                db 0xff
000073C7  FF6600            jmp [esi+0x0]
000073CA  0000              add [eax],al
000073CC  00410E            add [ecx+0xe],al
000073CF  088502420D05      or [ebp+0x50d4202],al
000073D5  0262C5            add ah,[edx-0x3b]
000073D8  0C04              or al,0x4
000073DA  0400              add al,0x0
000073DC  1C00              sbb al,0x0
000073DE  0000              add [eax],al
000073E0  3C01              cmp al,0x1
000073E2  0000              add [eax],al
000073E4  EAAAFFFF430000    jmp 0x0:0x43ffffaa
000073EB  0000              add [eax],al
000073ED  41                inc ecx
000073EE  0E                push cs
000073EF  088502420D05      or [ebp+0x50d4202],al
000073F5  7FC5              jg 0x73bc
000073F7  0C04              or al,0x4
000073F9  0400              add al,0x0
000073FB  001400            add [eax+eax],dl
000073FE  0000              add [eax],al
00007400  0000              add [eax],al
00007402  0000              add [eax],al
00007404  017A52            add [edx+0x52],edi
00007407  0001              add [ecx],al
00007409  7C08              jl 0x7413
0000740B  011B              add [ebx],ebx
0000740D  0C04              or al,0x4
0000740F  0488              add al,0x88
00007411  0100              add [eax],eax
00007413  001C00            add [eax+eax],bl
00007416  0000              add [eax],al
00007418  1C00              sbb al,0x0
0000741A  0000              add [eax],al
0000741C  F5                cmc
0000741D  AA                stosb
0000741E  FF                db 0xff
0000741F  FF6A00            jmp far [edx+0x0]
00007422  0000              add [eax],al
00007424  00410E            add [ecx+0xe],al
00007427  088502420D05      or [ebp+0x50d4202],al
0000742D  0266C5            add ah,[esi-0x3b]
00007430  0C04              or al,0x4
00007432  0400              add al,0x0
00007434  2000              and [eax],al
00007436  0000              add [eax],al
00007438  3C00              cmp al,0x0
0000743A  0000              add [eax],al
0000743C  3F                aas
0000743D  AB                stosd
0000743E  FF                db 0xff
0000743F  FFB600000000      push dword [esi+0x0]
00007445  41                inc ecx
00007446  0E                push cs
00007447  088502420D05      or [ebp+0x50d4202],al
0000744D  44                inc esp
0000744E  830302            add dword [ebx],byte +0x2
00007451  AE                scasb
00007452  C5                db 0xc5
00007453  C3                ret
00007454  0C04              or al,0x4
00007456  0400              add al,0x0
00007458  1C00              sbb al,0x0
0000745A  0000              add [eax],al
0000745C  60                pusha
0000745D  0000              add [eax],al
0000745F  00D1              add cl,dl
00007461  AB                stosd
00007462  FF                db 0xff
00007463  FF                db 0xff
00007464  3C00              cmp al,0x0
00007466  0000              add [eax],al
00007468  00410E            add [ecx+0xe],al
0000746B  088502420D05      or [ebp+0x50d4202],al
00007471  78C5              js 0x7438
00007473  0C04              or al,0x4
00007475  0400              add al,0x0
00007477  001C00            add [eax+eax],bl
0000747A  0000              add [eax],al
0000747C  800000            add byte [eax],0x0
0000747F  00ED              add ch,ch
00007481  AB                stosd
00007482  FF                db 0xff
00007483  FF                db 0xff
00007484  3900              cmp [eax],eax
00007486  0000              add [eax],al
00007488  00410E            add [ecx+0xe],al
0000748B  088502420D05      or [ebp+0x50d4202],al
00007491  75C5              jnz 0x7458
00007493  0C04              or al,0x4
00007495  0400              add al,0x0
00007497  002C00            add [eax+eax],ch
0000749A  0000              add [eax],al
0000749C  A000000006        mov al,[0x6000000]
000074A1  AC                lodsb
000074A2  FF                db 0xff
000074A3  FF                db 0xff
000074A4  BF01000000        mov edi,0x1
000074A9  41                inc ecx
000074AA  0E                push cs
000074AB  088502420D05      or [ebp+0x50d4202],al
000074B1  46                inc esi
000074B2  8703              xchg eax,[ebx]
000074B4  860483            xchg al,[ebx+eax*4]
000074B7  0503B201C3        add eax,0xc301b203
000074BC  41                inc ecx
000074BD  C641C741          mov byte [ecx-0x39],0x41
000074C1  C50C04            lds ecx,[esp+eax]
000074C4  0400              add al,0x0
000074C6  0000              add [eax],al
000074C8  1400              adc al,0x0
000074CA  0000              add [eax],al
000074CC  0000              add [eax],al
000074CE  0000              add [eax],al
000074D0  017A52            add [edx+0x52],edi
000074D3  0001              add [ecx],al
000074D5  7C08              jl 0x74df
000074D7  011B              add [ebx],ebx
000074D9  0C04              or al,0x4
000074DB  0488              add al,0x88
000074DD  0100              add [eax],eax
000074DF  001C00            add [eax+eax],bl
000074E2  0000              add [eax],al
000074E4  1C00              sbb al,0x0
000074E6  0000              add [eax],al
000074E8  7DAD              jnl 0x7497
000074EA  FF                db 0xff
000074EB  FF18              call far [eax]
000074ED  0000              add [eax],al
000074EF  0000              add [eax],al
000074F1  41                inc ecx
000074F2  0E                push cs
000074F3  088502420D05      or [ebp+0x50d4202],al
000074F9  54                push esp
000074FA  C50C04            lds ecx,[esp+eax]
000074FD  0400              add al,0x0
000074FF  001C00            add [eax+eax],bl
00007502  0000              add [eax],al
00007504  3C00              cmp al,0x0
00007506  0000              add [eax],al
00007508  75AD              jnz 0x74b7
0000750A  FF                db 0xff
0000750B  FF6D00            jmp far [ebp+0x0]
0000750E  0000              add [eax],al
00007510  00410E            add [ecx+0xe],al
00007513  088502420D05      or [ebp+0x50d4202],al
00007519  0269C5            add ch,[ecx-0x3b]
0000751C  0C04              or al,0x4
0000751E  0400              add al,0x0
00007520  1C00              sbb al,0x0
00007522  0000              add [eax],al
00007524  5C                pop esp
00007525  0000              add [eax],al
00007527  00C2              add dl,al
00007529  AD                lodsd
0000752A  FF                db 0xff
0000752B  FF6000            jmp [eax+0x0]
0000752E  0000              add [eax],al
00007530  00410E            add [ecx+0xe],al
00007533  088502420D05      or [ebp+0x50d4202],al
00007539  025CC50C          add bl,[ebp+eax*8+0xc]
0000753D  0404              add al,0x4
0000753F  001C00            add [eax+eax],bl
00007542  0000              add [eax],al
00007544  7C00              jl 0x7546
00007546  0000              add [eax],al
00007548  02AEFFFF1B00      add ch,[esi+0x1bffff]
0000754E  0000              add [eax],al
00007550  00410E            add [ecx+0xe],al
00007553  088502420D05      or [ebp+0x50d4202],al
00007559  57                push edi
0000755A  C50C04            lds ecx,[esp+eax]
0000755D  0400              add al,0x0
0000755F  001C00            add [eax+eax],bl
00007562  0000              add [eax],al
00007564  9C                pushf
00007565  0000              add [eax],al
00007567  00FD              add ch,bh
00007569  AD                lodsd
0000756A  FF                db 0xff
0000756B  FF1D00000000      call far [dword 0x0]
00007571  41                inc ecx
00007572  0E                push cs
00007573  088502420D05      or [ebp+0x50d4202],al
00007579  59                pop ecx
0000757A  C50C04            lds ecx,[esp+eax]
0000757D  0400              add al,0x0
0000757F  001C00            add [eax+eax],bl
00007582  0000              add [eax],al
00007584  BC000000FA        mov esp,0xfa000000
00007589  AD                lodsd
0000758A  FF                db 0xff
0000758B  FF1E              call far [esi]
0000758D  0000              add [eax],al
0000758F  0000              add [eax],al
00007591  41                inc ecx
00007592  0E                push cs
00007593  088502420D05      or [ebp+0x50d4202],al
00007599  5A                pop edx
0000759A  C50C04            lds ecx,[esp+eax]
0000759D  0400              add al,0x0
0000759F  001C00            add [eax+eax],bl
000075A2  0000              add [eax],al
000075A4  DC00              fadd qword [eax]
000075A6  0000              add [eax],al
000075A8  F8                clc
000075A9  AD                lodsd
000075AA  FF                db 0xff
000075AB  FF                db 0xff
000075AC  3800              cmp [eax],al
000075AE  0000              add [eax],al
000075B0  00410E            add [ecx+0xe],al
000075B3  088502420D05      or [ebp+0x50d4202],al
000075B9  74C5              jz 0x7580
000075BB  0C04              or al,0x4
000075BD  0400              add al,0x0
000075BF  0020              add [eax],ah
000075C1  0000              add [eax],al
000075C3  00FC              add ah,bh
000075C5  0000              add [eax],al
000075C7  0010              add [eax],dl
000075C9  AE                scasb
000075CA  FF                db 0xff
000075CB  FF                db 0xff
000075CC  7B00              jpo 0x75ce
000075CE  0000              add [eax],al
000075D0  00410E            add [ecx+0xe],al
000075D3  088502420D05      or [ebp+0x50d4202],al
000075D9  44                inc esp
000075DA  830302            add dword [ebx],byte +0x2
000075DD  73C5              jnc 0x75a4
000075DF  C3                ret
000075E0  0C04              or al,0x4
000075E2  0400              add al,0x0
000075E4  1C00              sbb al,0x0
000075E6  0000              add [eax],al
000075E8  2001              and [ecx],al
000075EA  0000              add [eax],al
000075EC  67AE              a16 scasb
000075EE  FF                db 0xff
000075EF  FF9800000000      call far [eax+0x0]
000075F5  41                inc ecx
000075F6  0E                push cs
000075F7  088502420D05      or [ebp+0x50d4202],al
000075FD  0294C50C040400    add dl,[ebp+eax*8+0x4040c]
00007604  1C00              sbb al,0x0
00007606  0000              add [eax],al
00007608  40                inc eax
00007609  0100              add [eax],eax
0000760B  00DF              add bh,bl
0000760D  AE                scasb
0000760E  FF                db 0xff
0000760F  FF4500            inc dword [ebp+0x0]
00007612  0000              add [eax],al
00007614  00410E            add [ecx+0xe],al
00007617  088502420D05      or [ebp+0x50d4202],al
0000761D  0241C5            add al,[ecx-0x3b]
00007620  0C04              or al,0x4
00007622  0400              add al,0x0
00007624  1C00              sbb al,0x0
00007626  0000              add [eax],al
00007628  60                pusha
00007629  0100              add [eax],eax
0000762B  0004AF            add [edi+ebp*4],al
0000762E  FF                db 0xff
0000762F  FF4D00            dec dword [ebp+0x0]
00007632  0000              add [eax],al
00007634  00410E            add [ecx+0xe],al
00007637  088502420D05      or [ebp+0x50d4202],al
0000763D  0249C5            add cl,[ecx-0x3b]
00007640  0C04              or al,0x4
00007642  0400              add al,0x0
00007644  1C00              sbb al,0x0
00007646  0000              add [eax],al
00007648  800100            add byte [ecx],0x0
0000764B  0031              add [ecx],dh
0000764D  AF                scasd
0000764E  FF                db 0xff
0000764F  FF32              push dword [edx]
00007651  0000              add [eax],al
00007653  0000              add [eax],al
00007655  41                inc ecx
00007656  0E                push cs
00007657  088502420D05      or [ebp+0x50d4202],al
0000765D  6E                outsb
0000765E  C50C04            lds ecx,[esp+eax]
00007661  0400              add al,0x0
00007663  0020              add [eax],ah
00007665  0000              add [eax],al
00007667  00A001000043      add [eax+0x43000001],ah
0000766D  AF                scasd
0000766E  FF                db 0xff
0000766F  FF6100            jmp [ecx+0x0]
00007672  0000              add [eax],al
00007674  00410E            add [ecx+0xe],al
00007677  088502420D05      or [ebp+0x50d4202],al
0000767D  44                inc esp
0000767E  830302            add dword [ebx],byte +0x2
00007681  59                pop ecx
00007682  C5                db 0xc5
00007683  C3                ret
00007684  0C04              or al,0x4
00007686  0400              add al,0x0
00007688  1C00              sbb al,0x0
0000768A  0000              add [eax],al
0000768C  C401              les eax,[ecx]
0000768E  0000              add [eax],al
00007690  80AFFFFF7D0000    sub byte [edi+0x7dffff],0x0
00007697  0000              add [eax],al
00007699  41                inc ecx
0000769A  0E                push cs
0000769B  088502420D05      or [ebp+0x50d4202],al
000076A1  0279C5            add bh,[ecx-0x3b]
000076A4  0C04              or al,0x4
000076A6  0400              add al,0x0
000076A8  2000              and [eax],al
000076AA  0000              add [eax],al
000076AC  E401              in al,0x1
000076AE  0000              add [eax],al
000076B0  DD                db 0xdd
000076B1  AF                scasd
000076B2  FF                db 0xff
000076B3  FFCD              dec ebp
000076B5  0000              add [eax],al
000076B7  0000              add [eax],al
000076B9  41                inc ecx
000076BA  0E                push cs
000076BB  088502420D05      or [ebp+0x50d4202],al
000076C1  44                inc esp
000076C2  830302            add dword [ebx],byte +0x2
000076C5  C5                db 0xc5
000076C6  C5                db 0xc5
000076C7  C3                ret
000076C8  0C04              or al,0x4
000076CA  0400              add al,0x0
000076CC  1C00              sbb al,0x0
000076CE  0000              add [eax],al
000076D0  0802              or [edx],al
000076D2  0000              add [eax],al
000076D4  86B0FFFF5C00      xchg dh,[eax+0x5cffff]
000076DA  0000              add [eax],al
000076DC  00410E            add [ecx+0xe],al
000076DF  088502420D05      or [ebp+0x50d4202],al
000076E5  0258C5            add bl,[eax-0x3b]
000076E8  0C04              or al,0x4
000076EA  0400              add al,0x0
000076EC  1C00              sbb al,0x0
000076EE  0000              add [eax],al
000076F0  2802              sub [edx],al
000076F2  0000              add [eax],al
000076F4  C2B0FF            ret 0xffb0
000076F7  FF6C0000          jmp far [eax+eax+0x0]
000076FB  0000              add [eax],al
000076FD  41                inc ecx
000076FE  0E                push cs
000076FF  088502420D05      or [ebp+0x50d4202],al
00007705  0268C5            add ch,[eax-0x3b]
00007708  0C04              or al,0x4
0000770A  0400              add al,0x0
0000770C  1C00              sbb al,0x0
0000770E  0000              add [eax],al
00007710  48                dec eax
00007711  0200              add al,[eax]
00007713  000E              add [esi],cl
00007715  B1FF              mov cl,0xff
00007717  FF                db 0xff
00007718  7B00              jpo 0x771a
0000771A  0000              add [eax],al
0000771C  00410E            add [ecx+0xe],al
0000771F  088502420D05      or [ebp+0x50d4202],al
00007725  0277C5            add dh,[edi-0x3b]
00007728  0C04              or al,0x4
0000772A  0400              add al,0x0
0000772C  1C00              sbb al,0x0
0000772E  0000              add [eax],al
00007730  6802000069        push dword 0x69000002
00007735  B1FF              mov cl,0xff
00007737  FF22              jmp [edx]
00007739  0000              add [eax],al
0000773B  0000              add [eax],al
0000773D  41                inc ecx
0000773E  0E                push cs
0000773F  088502420D05      or [ebp+0x50d4202],al
00007745  5E                pop esi
00007746  C50C04            lds ecx,[esp+eax]
00007749  0400              add al,0x0
0000774B  001C00            add [eax+eax],bl
0000774E  0000              add [eax],al
00007750  8802              mov [edx],al
00007752  0000              add [eax],al
00007754  6BB1FFFF580000    imul esi,[ecx+0x58ffff],byte +0x0
0000775B  0000              add [eax],al
0000775D  41                inc ecx
0000775E  0E                push cs
0000775F  088502420D05      or [ebp+0x50d4202],al
00007765  0254C50C          add dl,[ebp+eax*8+0xc]
00007769  0404              add al,0x4
0000776B  001C00            add [eax+eax],bl
0000776E  0000              add [eax],al
00007770  A802              test al,0x2
00007772  0000              add [eax],al
00007774  A3B1FFFF83        mov [0x83ffffb1],eax
00007779  0000              add [eax],al
0000777B  0000              add [eax],al
0000777D  41                inc ecx
0000777E  0E                push cs
0000777F  088502420D05      or [ebp+0x50d4202],al
00007785  027FC5            add bh,[edi-0x3b]
00007788  0C04              or al,0x4
0000778A  0400              add al,0x0
0000778C  1C00              sbb al,0x0
0000778E  0000              add [eax],al
00007790  C8020000          enter 0x2,0x0
00007794  06                push es
00007795  B2FF              mov dl,0xff
00007797  FF3400            push dword [eax+eax]
0000779A  0000              add [eax],al
0000779C  00410E            add [ecx+0xe],al
0000779F  088502420D05      or [ebp+0x50d4202],al
000077A5  70C5              jo 0x776c
000077A7  0C04              or al,0x4
000077A9  0400              add al,0x0
000077AB  001C00            add [eax+eax],bl
000077AE  0000              add [eax],al
000077B0  E80200001A        call 0x1a0077b7
000077B5  B2FF              mov dl,0xff
000077B7  FF9C0200000041    call far [edx+eax+0x41000000]
000077BE  0E                push cs
000077BF  088502420D05      or [ebp+0x50d4202],al
000077C5  039802C50C04      add ebx,[eax+0x40cc502]
000077CB  041C              add al,0x1c
000077CD  0000              add [eax],al
000077CF  0008              add [eax],cl
000077D1  0300              add eax,[eax]
000077D3  0096B4FFFF31      add [esi+0x31ffffb4],dl
000077D9  0000              add [eax],al
000077DB  0000              add [eax],al
000077DD  41                inc ecx
000077DE  0E                push cs
000077DF  088502420D05      or [ebp+0x50d4202],al
000077E5  6D                insd
000077E6  C50C04            lds ecx,[esp+eax]
000077E9  0400              add al,0x0
000077EB  001C00            add [eax+eax],bl
000077EE  0000              add [eax],al
000077F0  2803              sub [ebx],al
000077F2  0000              add [eax],al
000077F4  A7                cmpsd
000077F5  B4FF              mov ah,0xff
000077F7  FF                db 0xff
000077F8  3F                aas
000077F9  0000              add [eax],al
000077FB  0000              add [eax],al
000077FD  41                inc ecx
000077FE  0E                push cs
000077FF  088502420D05      or [ebp+0x50d4202],al
00007805  7BC5              jpo 0x77cc
00007807  0C04              or al,0x4
00007809  0400              add al,0x0
0000780B  001C00            add [eax+eax],bl
0000780E  0000              add [eax],al
00007810  48                dec eax
00007811  0300              add eax,[eax]
00007813  00C6              add dh,al
00007815  B4FF              mov ah,0xff
00007817  FF27              jmp [edi]
00007819  0000              add [eax],al
0000781B  0000              add [eax],al
0000781D  41                inc ecx
0000781E  0E                push cs
0000781F  088502420D05      or [ebp+0x50d4202],al
00007825  63C5              arpl bp,ax
00007827  0C04              or al,0x4
00007829  0400              add al,0x0
0000782B  001C00            add [eax+eax],bl
0000782E  0000              add [eax],al
00007830  68030000CD        push dword 0xcd000003
00007835  B4FF              mov ah,0xff
00007837  FF                db 0xff
00007838  3B01              cmp eax,[ecx]
0000783A  0000              add [eax],al
0000783C  00410E            add [ecx+0xe],al
0000783F  088502420D05      or [ebp+0x50d4202],al
00007845  0337              add esi,[edi]
00007847  01C5              add ebp,eax
00007849  0C04              or al,0x4
0000784B  0414              add al,0x14
0000784D  0000              add [eax],al
0000784F  0000              add [eax],al
00007851  0000              add [eax],al
00007853  0001              add [ecx],al
00007855  7A52              jpe 0x78a9
00007857  0001              add [ecx],al
00007859  7C08              jl 0x7863
0000785B  011B              add [ebx],ebx
0000785D  0C04              or al,0x4
0000785F  0488              add al,0x88
00007861  0100              add [eax],eax
00007863  001C00            add [eax+eax],bl
00007866  0000              add [eax],al
00007868  1C00              sbb al,0x0
0000786A  0000              add [eax],al
0000786C  D0                db 0xd0
0000786D  B5FF              mov ch,0xff
0000786F  FF5000            call [eax+0x0]
00007872  0000              add [eax],al
00007874  00410E            add [ecx+0xe],al
00007877  088502420D05      or [ebp+0x50d4202],al
0000787D  024CC50C          add cl,[ebp+eax*8+0xc]
00007881  0404              add al,0x4
00007883  001C00            add [eax+eax],bl
00007886  0000              add [eax],al
00007888  3C00              cmp al,0x0
0000788A  0000              add [eax],al
0000788C  00B6FFFF3100      add [esi+0x31ffff],dh
00007892  0000              add [eax],al
00007894  00410E            add [ecx+0xe],al
00007897  088502420D05      or [ebp+0x50d4202],al
0000789D  6D                insd
0000789E  C50C04            lds ecx,[esp+eax]
000078A1  0400              add al,0x0
000078A3  001400            add [eax+eax],dl
000078A6  0000              add [eax],al
000078A8  0000              add [eax],al
000078AA  0000              add [eax],al
000078AC  017A52            add [edx+0x52],edi
000078AF  0001              add [ecx],al
000078B1  7C08              jl 0x78bb
000078B3  011B              add [ebx],ebx
000078B5  0C04              or al,0x4
000078B7  0488              add al,0x88
000078B9  0100              add [eax],eax
000078BB  001C00            add [eax+eax],bl
000078BE  0000              add [eax],al
000078C0  1C00              sbb al,0x0
000078C2  0000              add [eax],al
000078C4  F9                stc
000078C5  B5FF              mov ch,0xff
000078C7  FF2400            jmp [eax+eax]
000078CA  0000              add [eax],al
000078CC  00410E            add [ecx+0xe],al
000078CF  088502420D05      or [ebp+0x50d4202],al
000078D5  60                pusha
000078D6  C50C04            lds ecx,[esp+eax]
000078D9  0400              add al,0x0
000078DB  001C00            add [eax+eax],bl
000078DE  0000              add [eax],al
000078E0  3C00              cmp al,0x0
000078E2  0000              add [eax],al
000078E4  FD                std
000078E5  B5FF              mov ch,0xff
000078E7  FF4C0000          dec dword [eax+eax+0x0]
000078EB  0000              add [eax],al
000078ED  41                inc ecx
000078EE  0E                push cs
000078EF  088502420D05      or [ebp+0x50d4202],al
000078F5  0248C5            add cl,[eax-0x3b]
000078F8  0C04              or al,0x4
000078FA  0400              add al,0x0
000078FC  1C00              sbb al,0x0
000078FE  0000              add [eax],al
00007900  5C                pop esp
00007901  0000              add [eax],al
00007903  0029              add [ecx],ch
00007905  B6FF              mov dh,0xff
00007907  FF4E00            dec dword [esi+0x0]
0000790A  0000              add [eax],al
0000790C  00410E            add [ecx+0xe],al
0000790F  088502420D05      or [ebp+0x50d4202],al
00007915  024AC5            add cl,[edx-0x3b]
00007918  0C04              or al,0x4
0000791A  0400              add al,0x0
0000791C  1C00              sbb al,0x0
0000791E  0000              add [eax],al
00007920  7C00              jl 0x7922
00007922  0000              add [eax],al
00007924  57                push edi
00007925  B6FF              mov dh,0xff
00007927  FFA900000000      jmp far [ecx+0x0]
0000792D  41                inc ecx
0000792E  0E                push cs
0000792F  088502420D05      or [ebp+0x50d4202],al
00007935  02A5C50C0404      add ah,[ebp+0x4040cc5]
0000793B  001C00            add [eax+eax],bl
0000793E  0000              add [eax],al
00007940  9C                pushf
00007941  0000              add [eax],al
00007943  00E0              add al,ah
00007945  B6FF              mov dh,0xff
00007947  FF4B00            dec dword [ebx+0x0]
0000794A  0000              add [eax],al
0000794C  00410E            add [ecx+0xe],al
0000794F  088502420D05      or [ebp+0x50d4202],al
00007955  0247C5            add al,[edi-0x3b]
00007958  0C04              or al,0x4
0000795A  0400              add al,0x0
0000795C  1C00              sbb al,0x0
0000795E  0000              add [eax],al
00007960  BC0000000B        mov esp,0xb000000
00007965  B7FF              mov bh,0xff
00007967  FFA200000000      jmp [edx+0x0]
0000796D  41                inc ecx
0000796E  0E                push cs
0000796F  088502420D05      or [ebp+0x50d4202],al
00007975  029EC50C0404      add bl,[esi+0x4040cc5]
0000797B  001400            add [eax+eax],dl
0000797E  0000              add [eax],al
00007980  0000              add [eax],al
00007982  0000              add [eax],al
00007984  017A52            add [edx+0x52],edi
00007987  0001              add [ecx],al
00007989  7C08              jl 0x7993
0000798B  011B              add [ebx],ebx
0000798D  0C04              or al,0x4
0000798F  0488              add al,0x88
00007991  0100              add [eax],eax
00007993  001C00            add [eax+eax],bl
00007996  0000              add [eax],al
00007998  1C00              sbb al,0x0
0000799A  0000              add [eax],al
0000799C  75B7              jnz 0x7955
0000799E  FF                db 0xff
0000799F  FF                db 0xff
000079A0  FC                cld
000079A1  0000              add [eax],al
000079A3  0000              add [eax],al
000079A5  41                inc ecx
000079A6  0E                push cs
000079A7  088502420D05      or [ebp+0x50d4202],al
000079AD  02F8              add bh,al
000079AF  C50C04            lds ecx,[esp+eax]
000079B2  0400              add al,0x0
000079B4  1C00              sbb al,0x0
000079B6  0000              add [eax],al
000079B8  3C00              cmp al,0x0
000079BA  0000              add [eax],al
000079BC  51                push ecx
000079BD  B8FFFF3D00        mov eax,0x3dffff
000079C2  0000              add [eax],al
000079C4  00410E            add [ecx+0xe],al
000079C7  088502420D05      or [ebp+0x50d4202],al
000079CD  79C5              jns 0x7994
000079CF  0C04              or al,0x4
000079D1  0400              add al,0x0
000079D3  001C00            add [eax+eax],bl
000079D6  0000              add [eax],al
000079D8  5C                pop esp
000079D9  0000              add [eax],al
000079DB  006EB8            add [esi-0x48],ch
000079DE  FF                db 0xff
000079DF  FF19              call far [ecx]
000079E1  0000              add [eax],al
000079E3  0000              add [eax],al
000079E5  41                inc ecx
000079E6  0E                push cs
000079E7  088502420D05      or [ebp+0x50d4202],al
000079ED  55                push ebp
000079EE  C50C04            lds ecx,[esp+eax]
000079F1  0400              add al,0x0
000079F3  001C00            add [eax+eax],bl
000079F6  0000              add [eax],al
000079F8  7C00              jl 0x79fa
000079FA  0000              add [eax],al
000079FC  67B8FFFFFC00      mov eax,0xfcffff
00007A02  0000              add [eax],al
00007A04  00410E            add [ecx+0xe],al
00007A07  088502420D05      or [ebp+0x50d4202],al
00007A0D  02F8              add bh,al
00007A0F  C50C04            lds ecx,[esp+eax]
00007A12  0400              add al,0x0
00007A14  1400              adc al,0x0
00007A16  0000              add [eax],al
00007A18  0000              add [eax],al
00007A1A  0000              add [eax],al
00007A1C  017A52            add [edx+0x52],edi
00007A1F  0001              add [ecx],al
00007A21  7C08              jl 0x7a2b
00007A23  011B              add [ebx],ebx
00007A25  0C04              or al,0x4
00007A27  0488              add al,0x88
00007A29  0100              add [eax],eax
00007A2B  001C00            add [eax+eax],bl
00007A2E  0000              add [eax],al
00007A30  1C00              sbb al,0x0
00007A32  0000              add [eax],al
00007A34  2BB9FFFF6500      sub edi,[ecx+0x65ffff]
00007A3A  0000              add [eax],al
00007A3C  00410E            add [ecx+0xe],al
00007A3F  088502420D05      or [ebp+0x50d4202],al
00007A45  0261C5            add ah,[ecx-0x3b]
00007A48  0C04              or al,0x4
00007A4A  0400              add al,0x0
00007A4C  1C00              sbb al,0x0
00007A4E  0000              add [eax],al
00007A50  3C00              cmp al,0x0
00007A52  0000              add [eax],al
00007A54  70B9              jo 0x7a0f
00007A56  FF                db 0xff
00007A57  FF1B              call far [ebx]
00007A59  0000              add [eax],al
00007A5B  0000              add [eax],al
00007A5D  41                inc ecx
00007A5E  0E                push cs
00007A5F  088502420D05      or [ebp+0x50d4202],al
00007A65  57                push edi
00007A66  C50C04            lds ecx,[esp+eax]
00007A69  0400              add al,0x0
00007A6B  001C00            add [eax+eax],bl
00007A6E  0000              add [eax],al
00007A70  5C                pop esp
00007A71  0000              add [eax],al
00007A73  006BB9            add [ebx-0x47],ch
00007A76  FF                db 0xff
00007A77  FF28              jmp far [eax]
00007A79  0000              add [eax],al
00007A7B  0000              add [eax],al
00007A7D  41                inc ecx
00007A7E  0E                push cs
00007A7F  088502420D05      or [ebp+0x50d4202],al
00007A85  64C50C04          lds ecx,[fs:esp+eax]
00007A89  0400              add al,0x0
00007A8B  001C00            add [eax+eax],bl
00007A8E  0000              add [eax],al
00007A90  7C00              jl 0x7a92
00007A92  0000              add [eax],al
00007A94  73B9              jnc 0x7a4f
00007A96  FF                db 0xff
00007A97  FF2E              jmp far [esi]
00007A99  0000              add [eax],al
00007A9B  0000              add [eax],al
00007A9D  41                inc ecx
00007A9E  0E                push cs
00007A9F  088502420D05      or [ebp+0x50d4202],al
00007AA5  6AC5              push byte -0x3b
00007AA7  0C04              or al,0x4
00007AA9  0400              add al,0x0
00007AAB  001400            add [eax+eax],dl
00007AAE  0000              add [eax],al
00007AB0  0000              add [eax],al
00007AB2  0000              add [eax],al
00007AB4  017A52            add [edx+0x52],edi
00007AB7  0001              add [ecx],al
00007AB9  7C08              jl 0x7ac3
00007ABB  011B              add [ebx],ebx
00007ABD  0C04              or al,0x4
00007ABF  0488              add al,0x88
00007AC1  0100              add [eax],eax
00007AC3  001C00            add [eax+eax],bl
00007AC6  0000              add [eax],al
00007AC8  1C00              sbb al,0x0
00007ACA  0000              add [eax],al
00007ACC  69B9FFFF1D000000  imul edi,[ecx+0x1dffff],dword 0x41000000
         -0041
00007AD6  0E                push cs
00007AD7  088502420D05      or [ebp+0x50d4202],al
00007ADD  59                pop ecx
00007ADE  C50C04            lds ecx,[esp+eax]
00007AE1  0400              add al,0x0
00007AE3  001C00            add [eax+eax],bl
00007AE6  0000              add [eax],al
00007AE8  3C00              cmp al,0x0
00007AEA  0000              add [eax],al
00007AEC  66B9FFFF          mov cx,0xffff
00007AF0  2100              and [eax],eax
00007AF2  0000              add [eax],al
00007AF4  00410E            add [ecx+0xe],al
00007AF7  088502420D05      or [ebp+0x50d4202],al
00007AFD  5D                pop ebp
00007AFE  C50C04            lds ecx,[esp+eax]
00007B01  0400              add al,0x0
00007B03  001C00            add [eax+eax],bl
00007B06  0000              add [eax],al
00007B08  5C                pop esp
00007B09  0000              add [eax],al
00007B0B  0067B9            add [edi-0x47],ah
00007B0E  FF                db 0xff
00007B0F  FF1F              call far [edi]
00007B11  0000              add [eax],al
00007B13  0000              add [eax],al
00007B15  41                inc ecx
00007B16  0E                push cs
00007B17  088502420D05      or [ebp+0x50d4202],al
00007B1D  5B                pop ebx
00007B1E  C50C04            lds ecx,[esp+eax]
00007B21  0400              add al,0x0
00007B23  001C00            add [eax+eax],bl
00007B26  0000              add [eax],al
00007B28  7C00              jl 0x7b2a
00007B2A  0000              add [eax],al
00007B2C  66B9FFFF          mov cx,0xffff
00007B30  2100              and [eax],eax
00007B32  0000              add [eax],al
00007B34  00410E            add [ecx+0xe],al
00007B37  088502420D05      or [ebp+0x50d4202],al
00007B3D  5D                pop ebp
00007B3E  C50C04            lds ecx,[esp+eax]
00007B41  0400              add al,0x0
00007B43  001400            add [eax+eax],dl
00007B46  0000              add [eax],al
00007B48  0000              add [eax],al
00007B4A  0000              add [eax],al
00007B4C  017A52            add [edx+0x52],edi
00007B4F  0001              add [ecx],al
00007B51  7C08              jl 0x7b5b
00007B53  011B              add [ebx],ebx
00007B55  0C04              or al,0x4
00007B57  0488              add al,0x88
00007B59  0100              add [eax],eax
00007B5B  001C00            add [eax+eax],bl
00007B5E  0000              add [eax],al
00007B60  1C00              sbb al,0x0
00007B62  0000              add [eax],al
00007B64  4F                dec edi
00007B65  B9FFFF1900        mov ecx,0x19ffff
00007B6A  0000              add [eax],al
00007B6C  00410E            add [ecx+0xe],al
00007B6F  088502420D05      or [ebp+0x50d4202],al
00007B75  55                push ebp
00007B76  C50C04            lds ecx,[esp+eax]
00007B79  0400              add al,0x0
00007B7B  001C00            add [eax+eax],bl
00007B7E  0000              add [eax],al
00007B80  3C00              cmp al,0x0
00007B82  0000              add [eax],al
00007B84  48                dec eax
00007B85  B9FFFF1B00        mov ecx,0x1bffff
00007B8A  0000              add [eax],al
00007B8C  00410E            add [ecx+0xe],al
00007B8F  088502420D05      or [ebp+0x50d4202],al
00007B95  57                push edi
00007B96  C50C04            lds ecx,[esp+eax]
00007B99  0400              add al,0x0
00007B9B  001400            add [eax+eax],dl
00007B9E  0000              add [eax],al
00007BA0  0000              add [eax],al
00007BA2  0000              add [eax],al
00007BA4  017A52            add [edx+0x52],edi
00007BA7  0001              add [ecx],al
00007BA9  7C08              jl 0x7bb3
00007BAB  011B              add [ebx],ebx
00007BAD  0C04              or al,0x4
00007BAF  0488              add al,0x88
00007BB1  0100              add [eax],eax
00007BB3  001C00            add [eax+eax],bl
00007BB6  0000              add [eax],al
00007BB8  1C00              sbb al,0x0
00007BBA  0000              add [eax],al
00007BBC  2BB9FFFF4C00      sub edi,[ecx+0x4cffff]
00007BC2  0000              add [eax],al
00007BC4  00410E            add [ecx+0xe],al
00007BC7  088502420D05      or [ebp+0x50d4202],al
00007BCD  0248C5            add cl,[eax-0x3b]
00007BD0  0C04              or al,0x4
00007BD2  0400              add al,0x0
00007BD4  1C00              sbb al,0x0
00007BD6  0000              add [eax],al
00007BD8  3C00              cmp al,0x0
00007BDA  0000              add [eax],al
00007BDC  57                push edi
00007BDD  B9FFFF2100        mov ecx,0x21ffff
00007BE2  0000              add [eax],al
00007BE4  00410E            add [ecx+0xe],al
00007BE7  088502420D05      or [ebp+0x50d4202],al
00007BED  5D                pop ebp
00007BEE  C50C04            lds ecx,[esp+eax]
00007BF1  0400              add al,0x0
00007BF3  001400            add [eax+eax],dl
00007BF6  0000              add [eax],al
00007BF8  0000              add [eax],al
00007BFA  0000              add [eax],al
00007BFC  017A52            add [edx+0x52],edi
00007BFF  0001              add [ecx],al
00007C01  7C08              jl 0x7c0b
00007C03  011B              add [ebx],ebx
00007C05  0C04              or al,0x4
00007C07  0488              add al,0x88
00007C09  0100              add [eax],eax
00007C0B  001C00            add [eax+eax],bl
00007C0E  0000              add [eax],al
00007C10  1C00              sbb al,0x0
00007C12  0000              add [eax],al
00007C14  40                inc eax
00007C15  B9FFFF2300        mov ecx,0x23ffff
00007C1A  0000              add [eax],al
00007C1C  00410E            add [ecx+0xe],al
00007C1F  088502420D05      or [ebp+0x50d4202],al
00007C25  5F                pop edi
00007C26  C50C04            lds ecx,[esp+eax]
00007C29  0400              add al,0x0
00007C2B  001C00            add [eax+eax],bl
00007C2E  0000              add [eax],al
00007C30  3C00              cmp al,0x0
00007C32  0000              add [eax],al
00007C34  43                inc ebx
00007C35  B9FFFF2400        mov ecx,0x24ffff
00007C3A  0000              add [eax],al
00007C3C  00410E            add [ecx+0xe],al
00007C3F  088502420D05      or [ebp+0x50d4202],al
00007C45  60                pusha
00007C46  C50C04            lds ecx,[esp+eax]
00007C49  0400              add al,0x0
00007C4B  001C00            add [eax+eax],bl
00007C4E  0000              add [eax],al
00007C50  5C                pop esp
00007C51  0000              add [eax],al
00007C53  0047B9            add [edi-0x47],al
00007C56  FF                db 0xff
00007C57  FF0A              dec dword [edx]
00007C59  0000              add [eax],al
00007C5B  0000              add [eax],al
00007C5D  41                inc ecx
00007C5E  0E                push cs
00007C5F  088502420D05      or [ebp+0x50d4202],al
00007C65  46                inc esi
00007C66  C50C04            lds ecx,[esp+eax]
00007C69  0400              add al,0x0
00007C6B  001C00            add [eax+eax],bl
00007C6E  0000              add [eax],al
00007C70  7C00              jl 0x7c72
00007C72  0000              add [eax],al
00007C74  31B9FFFF4100      xor [ecx+0x41ffff],edi
00007C7A  0000              add [eax],al
00007C7C  00410E            add [ecx+0xe],al
00007C7F  088502420D05      or [ebp+0x50d4202],al
00007C85  7DC5              jnl 0x7c4c
00007C87  0C04              or al,0x4
00007C89  0400              add al,0x0
00007C8B  001C00            add [eax+eax],bl
00007C8E  0000              add [eax],al
00007C90  9C                pushf
00007C91  0000              add [eax],al
00007C93  0052B9            add [edx-0x47],dl
00007C96  FF                db 0xff
00007C97  FF                db 0xff
00007C98  7F00              jg 0x7c9a
00007C9A  0000              add [eax],al
00007C9C  00410E            add [ecx+0xe],al
00007C9F  088502420D05      or [ebp+0x50d4202],al
00007CA5  027BC5            add bh,[ebx-0x3b]
00007CA8  0C04              or al,0x4
00007CAA  0400              add al,0x0
00007CAC  1C00              sbb al,0x0
00007CAE  0000              add [eax],al
00007CB0  BC000000B1        mov esp,0xb1000000
00007CB5  B9FFFF7C00        mov ecx,0x7cffff
00007CBA  0000              add [eax],al
00007CBC  00410E            add [ecx+0xe],al
00007CBF  088502420D05      or [ebp+0x50d4202],al
00007CC5  0278C5            add bh,[eax-0x3b]
00007CC8  0C04              or al,0x4
00007CCA  0400              add al,0x0
00007CCC  1C00              sbb al,0x0
00007CCE  0000              add [eax],al
00007CD0  DC00              fadd qword [eax]
00007CD2  0000              add [eax],al
00007CD4  0DBAFFFFCB        or eax,0xcbffffba
00007CD9  0000              add [eax],al
00007CDB  0000              add [eax],al
00007CDD  41                inc ecx
00007CDE  0E                push cs
00007CDF  088502420D05      or [ebp+0x50d4202],al
00007CE5  02C7              add al,bh
00007CE7  C50C04            lds ecx,[esp+eax]
00007CEA  0400              add al,0x0
00007CEC  1400              adc al,0x0
00007CEE  0000              add [eax],al
00007CF0  0000              add [eax],al
00007CF2  0000              add [eax],al
00007CF4  017A52            add [edx+0x52],edi
00007CF7  0001              add [ecx],al
00007CF9  7C08              jl 0x7d03
00007CFB  011B              add [ebx],ebx
00007CFD  0C04              or al,0x4
00007CFF  0488              add al,0x88
00007D01  0100              add [eax],eax
00007D03  001C00            add [eax+eax],bl
00007D06  0000              add [eax],al
00007D08  1C00              sbb al,0x0
00007D0A  0000              add [eax],al
00007D0C  A0BAFFFF73        mov al,[0x73ffffba]
00007D11  0000              add [eax],al
00007D13  0000              add [eax],al
00007D15  41                inc ecx
00007D16  0E                push cs
00007D17  088502420D05      or [ebp+0x50d4202],al
00007D1D  026FC5            add ch,[edi-0x3b]
00007D20  0C04              or al,0x4
00007D22  0400              add al,0x0
00007D24  1C00              sbb al,0x0
00007D26  0000              add [eax],al
00007D28  3C00              cmp al,0x0
00007D2A  0000              add [eax],al
00007D2C  F3BAFFFF3400      rep mov edx,0x34ffff
00007D32  0000              add [eax],al
00007D34  00410E            add [ecx+0xe],al
00007D37  088502420D05      or [ebp+0x50d4202],al
00007D3D  70C5              jo 0x7d04
00007D3F  0C04              or al,0x4
00007D41  0400              add al,0x0
00007D43  001C00            add [eax+eax],bl
00007D46  0000              add [eax],al
00007D48  5C                pop esp
00007D49  0000              add [eax],al
00007D4B  0007              add [edi],al
00007D4D  BBFFFF6800        mov ebx,0x68ffff
00007D52  0000              add [eax],al
00007D54  00410E            add [ecx+0xe],al
00007D57  088502420D05      or [ebp+0x50d4202],al
00007D5D  0264C50C          add ah,[ebp+eax*8+0xc]
00007D61  0404              add al,0x4
00007D63  001C00            add [eax+eax],bl
00007D66  0000              add [eax],al
00007D68  7C00              jl 0x7d6a
00007D6A  0000              add [eax],al
00007D6C  4F                dec edi
00007D6D  BBFFFF2700        mov ebx,0x27ffff
00007D72  0000              add [eax],al
00007D74  00410E            add [ecx+0xe],al
00007D77  088502420D05      or [ebp+0x50d4202],al
00007D7D  63C5              arpl bp,ax
00007D7F  0C04              or al,0x4
00007D81  0400              add al,0x0
00007D83  001C00            add [eax+eax],bl
00007D86  0000              add [eax],al
00007D88  9C                pushf
00007D89  0000              add [eax],al
00007D8B  0056BB            add [esi-0x45],dl
00007D8E  FF                db 0xff
00007D8F  FFC1              inc ecx
00007D91  0000              add [eax],al
00007D93  0000              add [eax],al
00007D95  41                inc ecx
00007D96  0E                push cs
00007D97  088502420D05      or [ebp+0x50d4202],al
00007D9D  02BDC50C0404      add bh,[ebp+0x4040cc5]
00007DA3  001C00            add [eax+eax],bl
00007DA6  0000              add [eax],al
00007DA8  BC000000F7        mov esp,0xf7000000
00007DAD  BBFFFF2E00        mov ebx,0x2effff
00007DB2  0000              add [eax],al
00007DB4  00410E            add [ecx+0xe],al
00007DB7  088502420D05      or [ebp+0x50d4202],al
00007DBD  6AC5              push byte -0x3b
00007DBF  0C04              or al,0x4
00007DC1  0400              add al,0x0
00007DC3  001C00            add [eax+eax],bl
00007DC6  0000              add [eax],al
00007DC8  DC00              fadd qword [eax]
00007DCA  0000              add [eax],al
00007DCC  05BCFFFFD1        add eax,0xd1ffffbc
00007DD1  0000              add [eax],al
00007DD3  0000              add [eax],al
00007DD5  41                inc ecx
00007DD6  0E                push cs
00007DD7  088502420D05      or [ebp+0x50d4202],al
00007DDD  02CD              add cl,ch
00007DDF  C50C04            lds ecx,[esp+eax]
00007DE2  0400              add al,0x0
00007DE4  1C00              sbb al,0x0
00007DE6  0000              add [eax],al
00007DE8  FC                cld
00007DE9  0000              add [eax],al
00007DEB  00B6BCFFFF87      add [esi-0x78000044],dh
00007DF1  0000              add [eax],al
00007DF3  0000              add [eax],al
00007DF5  41                inc ecx
00007DF6  0E                push cs
00007DF7  088502420D05      or [ebp+0x50d4202],al
00007DFD  0283C50C0404      add al,[ebx+0x4040cc5]
00007E03  001400            add [eax+eax],dl
00007E06  0000              add [eax],al
00007E08  0000              add [eax],al
00007E0A  0000              add [eax],al
00007E0C  017A52            add [edx+0x52],edi
00007E0F  0001              add [ecx],al
00007E11  7C08              jl 0x7e1b
00007E13  011B              add [ebx],ebx
00007E15  0C04              or al,0x4
00007E17  0488              add al,0x88
00007E19  0100              add [eax],eax
00007E1B  001C00            add [eax+eax],bl
00007E1E  0000              add [eax],al
00007E20  1C00              sbb al,0x0
00007E22  0000              add [eax],al
00007E24  05BDFFFF27        add eax,0x27ffffbd
00007E29  0000              add [eax],al
00007E2B  0000              add [eax],al
00007E2D  41                inc ecx
00007E2E  0E                push cs
00007E2F  088502420D05      or [ebp+0x50d4202],al
00007E35  63C5              arpl bp,ax
00007E37  0C04              or al,0x4
00007E39  0400              add al,0x0
00007E3B  001C00            add [eax+eax],bl
00007E3E  0000              add [eax],al
00007E40  3C00              cmp al,0x0
00007E42  0000              add [eax],al
00007E44  0CBD              or al,0xbd
00007E46  FF                db 0xff
00007E47  FF4100            inc dword [ecx+0x0]
00007E4A  0000              add [eax],al
00007E4C  00410E            add [ecx+0xe],al
00007E4F  088502420D05      or [ebp+0x50d4202],al
00007E55  7DC5              jnl 0x7e1c
00007E57  0C04              or al,0x4
00007E59  0400              add al,0x0
00007E5B  001C00            add [eax+eax],bl
00007E5E  0000              add [eax],al
00007E60  5C                pop esp
00007E61  0000              add [eax],al
00007E63  002DBDFFFF29      add [dword 0x29ffffbd],ch
00007E69  0000              add [eax],al
00007E6B  0000              add [eax],al
00007E6D  41                inc ecx
00007E6E  0E                push cs
00007E6F  088502420D05      or [ebp+0x50d4202],al
00007E75  65C50C04          lds ecx,[gs:esp+eax]
00007E79  0400              add al,0x0
00007E7B  001C00            add [eax+eax],bl
00007E7E  0000              add [eax],al
00007E80  7C00              jl 0x7e82
00007E82  0000              add [eax],al
00007E84  36BDFFFF2400      ss mov ebp,0x24ffff
00007E8A  0000              add [eax],al
00007E8C  00410E            add [ecx+0xe],al
00007E8F  088502420D05      or [ebp+0x50d4202],al
00007E95  60                pusha
00007E96  C50C04            lds ecx,[esp+eax]
00007E99  0400              add al,0x0
00007E9B  001C00            add [eax+eax],bl
00007E9E  0000              add [eax],al
00007EA0  9C                pushf
00007EA1  0000              add [eax],al
00007EA3  003A              add [edx],bh
00007EA5  BDFFFF3F00        mov ebp,0x3fffff
00007EAA  0000              add [eax],al
00007EAC  00410E            add [ecx+0xe],al
00007EAF  088502420D05      or [ebp+0x50d4202],al
00007EB5  7BC5              jpo 0x7e7c
00007EB7  0C04              or al,0x4
00007EB9  0400              add al,0x0
00007EBB  001C00            add [eax+eax],bl
00007EBE  0000              add [eax],al
00007EC0  BC00000059        mov esp,0x59000000
00007EC5  BDFFFFC500        mov ebp,0xc5ffff
00007ECA  0000              add [eax],al
00007ECC  00410E            add [ecx+0xe],al
00007ECF  088502420D05      or [ebp+0x50d4202],al
00007ED5  02C1              add al,cl
00007ED7  C50C04            lds ecx,[esp+eax]
00007EDA  0400              add al,0x0
00007EDC  1C00              sbb al,0x0
00007EDE  0000              add [eax],al
00007EE0  DC00              fadd qword [eax]
00007EE2  0000              add [eax],al
00007EE4  FE                db 0xfe
00007EE5  BDFFFF6701        mov ebp,0x167ffff
00007EEA  0000              add [eax],al
00007EEC  00410E            add [ecx+0xe],al
00007EEF  088502420D05      or [ebp+0x50d4202],al
00007EF5  036301            add esp,[ebx+0x1]
00007EF8  C50C04            lds ecx,[esp+eax]
00007EFB  041C              add al,0x1c
00007EFD  0000              add [eax],al
00007EFF  00FC              add ah,bh
00007F01  0000              add [eax],al
00007F03  0045BF            add [ebp-0x41],al
00007F06  FF                db 0xff
00007F07  FF6900            jmp far [ecx+0x0]
00007F0A  0000              add [eax],al
00007F0C  00410E            add [ecx+0xe],al
00007F0F  088502420D05      or [ebp+0x50d4202],al
00007F15  0265C5            add ah,[ebp-0x3b]
00007F18  0C04              or al,0x4
00007F1A  0400              add al,0x0
00007F1C  1C00              sbb al,0x0
00007F1E  0000              add [eax],al
00007F20  1C01              sbb al,0x1
00007F22  0000              add [eax],al
00007F24  8EBFFFFF2D00      mov segr7,[edi+0x2dffff]
00007F2A  0000              add [eax],al
00007F2C  00410E            add [ecx+0xe],al
00007F2F  088502420D05      or [ebp+0x50d4202],al
00007F35  69C50C040400      imul eax,ebp,dword 0x4040c
00007F3B  001C00            add [eax+eax],bl
00007F3E  0000              add [eax],al
00007F40  3C01              cmp al,0x1
00007F42  0000              add [eax],al
00007F44  9BBFFFFF8D00      wait mov edi,0x8dffff
00007F4A  0000              add [eax],al
00007F4C  00410E            add [ecx+0xe],al
00007F4F  088502420D05      or [ebp+0x50d4202],al
00007F55  0289C50C0404      add cl,[ecx+0x4040cc5]
00007F5B  001C00            add [eax+eax],bl
00007F5E  0000              add [eax],al
00007F60  5C                pop esp
00007F61  0100              add [eax],eax
00007F63  0008              add [eax],cl
00007F65  C0FFFF            sar bh,byte 0xff
00007F68  5E                pop esi
00007F69  0000              add [eax],al
00007F6B  0000              add [eax],al
00007F6D  41                inc ecx
00007F6E  0E                push cs
00007F6F  088502420D05      or [ebp+0x50d4202],al
00007F75  025AC5            add bl,[edx-0x3b]
00007F78  0C04              or al,0x4
00007F7A  0400              add al,0x0
00007F7C  1C00              sbb al,0x0
00007F7E  0000              add [eax],al
00007F80  7C01              jl 0x7f83
00007F82  0000              add [eax],al
00007F84  46                inc esi
00007F85  C0FFFF            sar bh,byte 0xff
00007F88  44                inc esp
00007F89  0000              add [eax],al
00007F8B  0000              add [eax],al
00007F8D  41                inc ecx
00007F8E  0E                push cs
00007F8F  088502420D05      or [ebp+0x50d4202],al
00007F95  0240C5            add al,[eax-0x3b]
00007F98  0C04              or al,0x4
00007F9A  0400              add al,0x0
00007F9C  1C00              sbb al,0x0
00007F9E  0000              add [eax],al
00007FA0  9C                pushf
00007FA1  0100              add [eax],eax
00007FA3  006AC0            add [edx-0x40],ch
00007FA6  FF                db 0xff
00007FA7  FF36              push dword [esi]
00007FA9  0000              add [eax],al
00007FAB  0000              add [eax],al
00007FAD  41                inc ecx
00007FAE  0E                push cs
00007FAF  088502420D05      or [ebp+0x50d4202],al
00007FB5  72C5              jc 0x7f7c
00007FB7  0C04              or al,0x4
00007FB9  0400              add al,0x0
00007FBB  001C00            add [eax+eax],bl
00007FBE  0000              add [eax],al
00007FC0  BC01000080        mov esp,0x80000001
00007FC5  C0FFFF            sar bh,byte 0xff
00007FC8  5D                pop ebp
00007FC9  0000              add [eax],al
00007FCB  0000              add [eax],al
00007FCD  41                inc ecx
00007FCE  0E                push cs
00007FCF  088502420D05      or [ebp+0x50d4202],al
00007FD5  0259C5            add bl,[ecx-0x3b]
00007FD8  0C04              or al,0x4
00007FDA  0400              add al,0x0
00007FDC  1C00              sbb al,0x0
00007FDE  0000              add [eax],al
00007FE0  DC01              fadd qword [ecx]
00007FE2  0000              add [eax],al
00007FE4  BDC0FFFF46        mov ebp,0x46ffffc0
00007FE9  0000              add [eax],al
00007FEB  0000              add [eax],al
00007FED  41                inc ecx
00007FEE  0E                push cs
00007FEF  088502420D05      or [ebp+0x50d4202],al
00007FF5  0242C5            add al,[edx-0x3b]
00007FF8  0C04              or al,0x4
00007FFA  0400              add al,0x0
00007FFC  1C00              sbb al,0x0
00007FFE  0000              add [eax],al
00008000  FC                cld
00008001  0100              add [eax],eax
00008003  00E3              add bl,ah
00008005  C0FFFF            sar bh,byte 0xff
00008008  7200              jc 0x800a
0000800A  0000              add [eax],al
0000800C  00410E            add [ecx+0xe],al
0000800F  088502420D05      or [ebp+0x50d4202],al
00008015  026EC5            add ch,[esi-0x3b]
00008018  0C04              or al,0x4
0000801A  0400              add al,0x0
0000801C  1400              adc al,0x0
0000801E  0000              add [eax],al
00008020  0000              add [eax],al
00008022  0000              add [eax],al
00008024  017A52            add [edx+0x52],edi
00008027  0001              add [ecx],al
00008029  7C08              jl 0x8033
0000802B  011B              add [ebx],ebx
0000802D  0C04              or al,0x4
0000802F  0488              add al,0x88
00008031  0100              add [eax],eax
00008033  001C00            add [eax+eax],bl
00008036  0000              add [eax],al
00008038  1C00              sbb al,0x0
0000803A  0000              add [eax],al
0000803C  1DC1FFFF3D        sbb eax,0x3dffffc1
00008041  0000              add [eax],al
00008043  0000              add [eax],al
00008045  41                inc ecx
00008046  0E                push cs
00008047  088502420D05      or [ebp+0x50d4202],al
0000804D  79C5              jns 0x8014
0000804F  0C04              or al,0x4
00008051  0400              add al,0x0
00008053  001C00            add [eax+eax],bl
00008056  0000              add [eax],al
00008058  3C00              cmp al,0x0
0000805A  0000              add [eax],al
0000805C  3AC1              cmp al,cl
0000805E  FF                db 0xff
0000805F  FF1B              call far [ebx]
00008061  0000              add [eax],al
00008063  0000              add [eax],al
00008065  41                inc ecx
00008066  0E                push cs
00008067  088502420D05      or [ebp+0x50d4202],al
0000806D  57                push edi
0000806E  C50C04            lds ecx,[esp+eax]
00008071  0400              add al,0x0
00008073  001C00            add [eax+eax],bl
00008076  0000              add [eax],al
00008078  5C                pop esp
00008079  0000              add [eax],al
0000807B  0035C1FFFF48      add [dword 0x48ffffc1],dh
00008081  0000              add [eax],al
00008083  0000              add [eax],al
00008085  41                inc ecx
00008086  0E                push cs
00008087  088502420D05      or [ebp+0x50d4202],al
0000808D  0244C50C          add al,[ebp+eax*8+0xc]
00008091  0404              add al,0x4
00008093  001C00            add [eax+eax],bl
00008096  0000              add [eax],al
00008098  7C00              jl 0x809a
0000809A  0000              add [eax],al
0000809C  5D                pop ebp
0000809D  C1FFFF            sar edi,byte 0xff
000080A0  3000              xor [eax],al
000080A2  0000              add [eax],al
000080A4  00410E            add [ecx+0xe],al
000080A7  088502420D05      or [ebp+0x50d4202],al
000080AD  6C                insb
000080AE  C50C04            lds ecx,[esp+eax]
000080B1  0400              add al,0x0
000080B3  001C00            add [eax+eax],bl
000080B6  0000              add [eax],al
000080B8  9C                pushf
000080B9  0000              add [eax],al
000080BB  006DC1            add [ebp-0x3f],ch
000080BE  FF                db 0xff
000080BF  FF17              call [edi]
000080C1  0000              add [eax],al
000080C3  0000              add [eax],al
000080C5  41                inc ecx
000080C6  0E                push cs
000080C7  088502420D05      or [ebp+0x50d4202],al
000080CD  53                push ebx
000080CE  C50C04            lds ecx,[esp+eax]
000080D1  0400              add al,0x0
000080D3  001C00            add [eax+eax],bl
000080D6  0000              add [eax],al
000080D8  BC00000064        mov esp,0x64000000
000080DD  C1FFFF            sar edi,byte 0xff
000080E0  2E0000            add [cs:eax],al
000080E3  0000              add [eax],al
000080E5  41                inc ecx
000080E6  0E                push cs
000080E7  088502420D05      or [ebp+0x50d4202],al
000080ED  6AC5              push byte -0x3b
000080EF  0C04              or al,0x4
000080F1  0400              add al,0x0
000080F3  001C00            add [eax+eax],bl
000080F6  0000              add [eax],al
000080F8  DC00              fadd qword [eax]
000080FA  0000              add [eax],al
000080FC  72C1              jc 0x80bf
000080FE  FF                db 0xff
000080FF  FF5C0000          call far [eax+eax+0x0]
00008103  0000              add [eax],al
00008105  41                inc ecx
00008106  0E                push cs
00008107  088502420D05      or [ebp+0x50d4202],al
0000810D  0258C5            add bl,[eax-0x3b]
00008110  0C04              or al,0x4
00008112  0400              add al,0x0
00008114  1C00              sbb al,0x0
00008116  0000              add [eax],al
00008118  FC                cld
00008119  0000              add [eax],al
0000811B  00AEC1FFFFDB      add [esi-0x2400003f],ch
00008121  0000              add [eax],al
00008123  0000              add [eax],al
00008125  41                inc ecx
00008126  0E                push cs
00008127  088502420D05      or [ebp+0x50d4202],al
0000812D  02D7              add dl,bh
0000812F  C50C04            lds ecx,[esp+eax]
00008132  0400              add al,0x0
00008134  1C00              sbb al,0x0
00008136  0000              add [eax],al
00008138  1C01              sbb al,0x1
0000813A  0000              add [eax],al
0000813C  69C2FFFFC701      imul eax,edx,dword 0x1c7ffff
00008142  0000              add [eax],al
00008144  00410E            add [ecx+0xe],al
00008147  088502420D05      or [ebp+0x50d4202],al
0000814D  03C3              add eax,ebx
0000814F  01C5              add ebp,eax
00008151  0C04              or al,0x4
00008153  0414              add al,0x14
00008155  0000              add [eax],al
00008157  0000              add [eax],al
00008159  0000              add [eax],al
0000815B  0001              add [ecx],al
0000815D  7A52              jpe 0x81b1
0000815F  0001              add [ecx],al
00008161  7C08              jl 0x816b
00008163  011B              add [ebx],ebx
00008165  0C04              or al,0x4
00008167  0488              add al,0x88
00008169  0100              add [eax],eax
0000816B  001C00            add [eax+eax],bl
0000816E  0000              add [eax],al
00008170  1C00              sbb al,0x0
00008172  0000              add [eax],al
00008174  F8                clc
00008175  C3                ret
00008176  FF                db 0xff
00008177  FF13              call [ebx]
00008179  0000              add [eax],al
0000817B  0000              add [eax],al
0000817D  41                inc ecx
0000817E  0E                push cs
0000817F  088502420D05      or [ebp+0x50d4202],al
00008185  4F                dec edi
00008186  C50C04            lds ecx,[esp+eax]
00008189  0400              add al,0x0
0000818B  001C00            add [eax+eax],bl
0000818E  0000              add [eax],al
00008190  3C00              cmp al,0x0
00008192  0000              add [eax],al
00008194  EBC3              jmp short 0x8159
00008196  FF                db 0xff
00008197  FF2C00            jmp far [eax+eax]
0000819A  0000              add [eax],al
0000819C  00410E            add [ecx+0xe],al
0000819F  088502420D05      or [ebp+0x50d4202],al
000081A5  68C50C0404        push dword 0x4040cc5
000081AA  0000              add [eax],al
000081AC  1C00              sbb al,0x0
000081AE  0000              add [eax],al
000081B0  5C                pop esp
000081B1  0000              add [eax],al
000081B3  00F7              add bh,dh
000081B5  C3                ret
000081B6  FF                db 0xff
000081B7  FF2400            jmp [eax+eax]
000081BA  0000              add [eax],al
000081BC  00410E            add [ecx+0xe],al
000081BF  088502420D05      or [ebp+0x50d4202],al
000081C5  60                pusha
000081C6  C50C04            lds ecx,[esp+eax]
000081C9  0400              add al,0x0
000081CB  001C00            add [eax+eax],bl
000081CE  0000              add [eax],al
000081D0  7C00              jl 0x81d2
000081D2  0000              add [eax],al
000081D4  FB                sti
000081D5  C3                ret
000081D6  FF                db 0xff
000081D7  FF                db 0xff
000081D8  7E00              jng 0x81da
000081DA  0000              add [eax],al
000081DC  00410E            add [ecx+0xe],al
000081DF  088502420D05      or [ebp+0x50d4202],al
000081E5  027AC5            add bh,[edx-0x3b]
000081E8  0C04              or al,0x4
000081EA  0400              add al,0x0
000081EC  1C00              sbb al,0x0
000081EE  0000              add [eax],al
000081F0  9C                pushf
000081F1  0000              add [eax],al
000081F3  0059C4            add [ecx-0x3c],bl
000081F6  FF                db 0xff
000081F7  FF1B              call far [ebx]
000081F9  0000              add [eax],al
000081FB  0000              add [eax],al
000081FD  41                inc ecx
000081FE  0E                push cs
000081FF  088502420D05      or [ebp+0x50d4202],al
00008205  57                push edi
00008206  C50C04            lds ecx,[esp+eax]
00008209  0400              add al,0x0
0000820B  001C00            add [eax+eax],bl
0000820E  0000              add [eax],al
00008210  BC00000054        mov esp,0x54000000
00008215  C4                db 0xc4
00008216  FF                db 0xff
00008217  FF20              jmp [eax]
00008219  0000              add [eax],al
0000821B  0000              add [eax],al
0000821D  41                inc ecx
0000821E  0E                push cs
0000821F  088502420D05      or [ebp+0x50d4202],al
00008225  5C                pop esp
00008226  C50C04            lds ecx,[esp+eax]
00008229  0400              add al,0x0
0000822B  001C00            add [eax+eax],bl
0000822E  0000              add [eax],al
00008230  DC00              fadd qword [eax]
00008232  0000              add [eax],al
00008234  54                push esp
00008235  C4                db 0xc4
00008236  FF                db 0xff
00008237  FF26              jmp [esi]
00008239  0000              add [eax],al
0000823B  0000              add [eax],al
0000823D  41                inc ecx
0000823E  0E                push cs
0000823F  088502420D05      or [ebp+0x50d4202],al
00008245  62                db 0x62
00008246  C50C04            lds ecx,[esp+eax]
00008249  0400              add al,0x0
0000824B  0020              add [eax],ah
0000824D  0000              add [eax],al
0000824F  00FC              add ah,bh
00008251  0000              add [eax],al
00008253  005AC4            add [edx-0x3c],bl
00008256  FF                db 0xff
00008257  FF5F00            call far [edi+0x0]
0000825A  0000              add [eax],al
0000825C  00410E            add [ecx+0xe],al
0000825F  088502420D05      or [ebp+0x50d4202],al
00008265  44                inc esp
00008266  830302            add dword [ebx],byte +0x2
00008269  57                push edi
0000826A  C5                db 0xc5
0000826B  C3                ret
0000826C  0C04              or al,0x4
0000826E  0400              add al,0x0
00008270  2C00              sub al,0x0
00008272  0000              add [eax],al
00008274  2001              and [ecx],al
00008276  0000              add [eax],al
00008278  95                xchg eax,ebp
00008279  C4                db 0xc4
0000827A  FF                db 0xff
0000827B  FF16              call [esi]
0000827D  0200              add al,[eax]
0000827F  0000              add [eax],al
00008281  41                inc ecx
00008282  0E                push cs
00008283  088502420D05      or [ebp+0x50d4202],al
00008289  46                inc esi
0000828A  8703              xchg eax,[ebx]
0000828C  860483            xchg al,[ebx+eax*4]
0000828F  05030902C3        add eax,0xc3020903
00008294  41                inc ecx
00008295  C641C741          mov byte [ecx-0x39],0x41
00008299  C50C04            lds ecx,[esp+eax]
0000829C  0400              add al,0x0
0000829E  0000              add [eax],al
000082A0  1400              adc al,0x0
000082A2  0000              add [eax],al
000082A4  0000              add [eax],al
000082A6  0000              add [eax],al
000082A8  017A52            add [edx+0x52],edi
000082AB  0001              add [ecx],al
000082AD  7C08              jl 0x82b7
000082AF  011B              add [ebx],ebx
000082B1  0C04              or al,0x4
000082B3  0488              add al,0x88
000082B5  0100              add [eax],eax
000082B7  001C00            add [eax+eax],bl
000082BA  0000              add [eax],al
000082BC  1C00              sbb al,0x0
000082BE  0000              add [eax],al
000082C0  63C6              arpl si,ax
000082C2  FF                db 0xff
000082C3  FF8D00000000      dec dword [ebp+0x0]
000082C9  41                inc ecx
000082CA  0E                push cs
000082CB  088502420D05      or [ebp+0x50d4202],al
000082D1  0289C50C0404      add cl,[ecx+0x4040cc5]
000082D7  001C00            add [eax+eax],bl
000082DA  0000              add [eax],al
000082DC  3C00              cmp al,0x0
000082DE  0000              add [eax],al
000082E0  D0C6              rol dh,1
000082E2  FF                db 0xff
000082E3  FFF7              push edi
000082E5  0000              add [eax],al
000082E7  0000              add [eax],al
000082E9  41                inc ecx
000082EA  0E                push cs
000082EB  088502420D05      or [ebp+0x50d4202],al
000082F1  02F3              add dh,bl
000082F3  C50C04            lds ecx,[esp+eax]
000082F6  0400              add al,0x0
000082F8  1C00              sbb al,0x0
000082FA  0000              add [eax],al
000082FC  5C                pop esp
000082FD  0000              add [eax],al
000082FF  00A7C7FFFF60      add [edi+0x60ffffc7],ah
00008305  0100              add [eax],eax
00008307  0000              add [eax],al
00008309  41                inc ecx
0000830A  0E                push cs
0000830B  088502420D05      or [ebp+0x50d4202],al
00008311  035C01C5          add ebx,[ecx+eax-0x3b]
00008315  0C04              or al,0x4
00008317  041C              add al,0x1c
00008319  0000              add [eax],al
0000831B  007C0000          add [eax+eax+0x0],bh
0000831F  00E7              add bh,ah
00008321  C8FFFF13          enter 0xffff,0x13
00008325  0200              add al,[eax]
00008327  0000              add [eax],al
00008329  41                inc ecx
0000832A  0E                push cs
0000832B  088502420D05      or [ebp+0x50d4202],al
00008331  030F              add ecx,[edi]
00008333  02C5              add al,ch
00008335  0C04              or al,0x4
00008337  041C              add al,0x1c
00008339  0000              add [eax],al
0000833B  009C000000DACA    add [eax+eax-0x35260000],bl
00008342  FF                db 0xff
00008343  FF6E00            jmp far [esi+0x0]
00008346  0000              add [eax],al
00008348  00410E            add [ecx+0xe],al
0000834B  088502420D05      or [ebp+0x50d4202],al
00008351  026AC5            add ch,[edx-0x3b]
00008354  0C04              or al,0x4
00008356  0400              add al,0x0
00008358  1C00              sbb al,0x0
0000835A  0000              add [eax],al
0000835C  BC00000028        mov esp,0x28000000
00008361  CB                retf
00008362  FF                db 0xff
00008363  FF6F00            jmp far [edi+0x0]
00008366  0000              add [eax],al
00008368  00410E            add [ecx+0xe],al
0000836B  088502420D05      or [ebp+0x50d4202],al
00008371  026BC5            add ch,[ebx-0x3b]
00008374  0C04              or al,0x4
00008376  0400              add al,0x0
00008378  1C00              sbb al,0x0
0000837A  0000              add [eax],al
0000837C  DC00              fadd qword [eax]
0000837E  0000              add [eax],al
00008380  77CB              ja 0x834d
00008382  FF                db 0xff
00008383  FF2500000000      jmp [dword 0x0]
00008389  41                inc ecx
0000838A  0E                push cs
0000838B  088502420D05      or [ebp+0x50d4202],al
00008391  61                popa
00008392  C50C04            lds ecx,[esp+eax]
00008395  0400              add al,0x0
00008397  001C00            add [eax+eax],bl
0000839A  0000              add [eax],al
0000839C  FC                cld
0000839D  0000              add [eax],al
0000839F  007CCBFF          add [ebx+ecx*8-0x1],bh
000083A3  FF18              call far [eax]
000083A5  0000              add [eax],al
000083A7  0000              add [eax],al
000083A9  41                inc ecx
000083AA  0E                push cs
000083AB  088502420D05      or [ebp+0x50d4202],al
000083B1  54                push esp
000083B2  C50C04            lds ecx,[esp+eax]
000083B5  0400              add al,0x0
000083B7  001C00            add [eax+eax],bl
000083BA  0000              add [eax],al
000083BC  1C01              sbb al,0x1
000083BE  0000              add [eax],al
000083C0  74CB              jz 0x838d
000083C2  FF                db 0xff
000083C3  FF18              call far [eax]
000083C5  0000              add [eax],al
000083C7  0000              add [eax],al
000083C9  41                inc ecx
000083CA  0E                push cs
000083CB  088502420D05      or [ebp+0x50d4202],al
000083D1  54                push esp
000083D2  C50C04            lds ecx,[esp+eax]
000083D5  0400              add al,0x0
000083D7  001C00            add [eax+eax],bl
000083DA  0000              add [eax],al
000083DC  3C01              cmp al,0x1
000083DE  0000              add [eax],al
000083E0  6C                insb
000083E1  CB                retf
000083E2  FF                db 0xff
000083E3  FF1502000000      call [dword 0x2]
000083E9  41                inc ecx
000083EA  0E                push cs
000083EB  088502420D05      or [ebp+0x50d4202],al
000083F1  0311              add edx,[ecx]
000083F3  02C5              add al,ch
000083F5  0C04              or al,0x4
000083F7  041C              add al,0x1c
000083F9  0000              add [eax],al
000083FB  005C0100          add [ecx+eax+0x0],bl
000083FF  0061CD            add [ecx-0x33],ah
00008402  FF                db 0xff
00008403  FF                db 0xff
00008404  7D00              jnl 0x8406
00008406  0000              add [eax],al
00008408  00410E            add [ecx+0xe],al
0000840B  088502420D05      or [ebp+0x50d4202],al
00008411  0279C5            add bh,[ecx-0x3b]
00008414  0C04              or al,0x4
00008416  0400              add al,0x0
00008418  1C00              sbb al,0x0
0000841A  0000              add [eax],al
0000841C  7C01              jl 0x841f
0000841E  0000              add [eax],al
00008420  BECDFFFF7E        mov esi,0x7effffcd
00008425  0000              add [eax],al
00008427  0000              add [eax],al
00008429  41                inc ecx
0000842A  0E                push cs
0000842B  088502420D05      or [ebp+0x50d4202],al
00008431  027AC5            add bh,[edx-0x3b]
00008434  0C04              or al,0x4
00008436  0400              add al,0x0
00008438  1C00              sbb al,0x0
0000843A  0000              add [eax],al
0000843C  9C                pushf
0000843D  0100              add [eax],eax
0000843F  001CCE            add [esi+ecx*8],bl
00008442  FF                db 0xff
00008443  FF                db 0xff
00008444  BB00000000        mov ebx,0x0
00008449  41                inc ecx
0000844A  0E                push cs
0000844B  088502420D05      or [ebp+0x50d4202],al
00008451  02B7C50C0404      add dh,[edi+0x4040cc5]
00008457  001C00            add [eax+eax],bl
0000845A  0000              add [eax],al
0000845C  BC010000B7        mov esp,0xb7000001
00008461  CE                into
00008462  FF                db 0xff
00008463  FF33              push dword [ebx]
00008465  0000              add [eax],al
00008467  0000              add [eax],al
00008469  41                inc ecx
0000846A  0E                push cs
0000846B  088502420D05      or [ebp+0x50d4202],al
00008471  6F                outsd
00008472  C50C04            lds ecx,[esp+eax]
00008475  0400              add al,0x0
00008477  001C00            add [eax+eax],bl
0000847A  0000              add [eax],al
0000847C  DC01              fadd qword [ecx]
0000847E  0000              add [eax],al
00008480  CACEFF            retf 0xffce
00008483  FF4B00            dec dword [ebx+0x0]
00008486  0000              add [eax],al
00008488  00410E            add [ecx+0xe],al
0000848B  088502420D05      or [ebp+0x50d4202],al
00008491  0247C5            add al,[edi-0x3b]
00008494  0C04              or al,0x4
00008496  0400              add al,0x0
00008498  1C00              sbb al,0x0
0000849A  0000              add [eax],al
0000849C  FC                cld
0000849D  0100              add [eax],eax
0000849F  00F5              add ch,dh
000084A1  CE                into
000084A2  FF                db 0xff
000084A3  FF                db 0xff
000084A4  B800000000        mov eax,0x0
000084A9  41                inc ecx
000084AA  0E                push cs
000084AB  088502420D05      or [ebp+0x50d4202],al
000084B1  02B4C50C040400    add dh,[ebp+eax*8+0x4040c]
000084B8  1C00              sbb al,0x0
000084BA  0000              add [eax],al
000084BC  1C02              sbb al,0x2
000084BE  0000              add [eax],al
000084C0  8D                db 0x8d
000084C1  CF                iret
000084C2  FF                db 0xff
000084C3  FF27              jmp [edi]
000084C5  0000              add [eax],al
000084C7  0000              add [eax],al
000084C9  41                inc ecx
000084CA  0E                push cs
000084CB  088502420D05      or [ebp+0x50d4202],al
000084D1  63C5              arpl bp,ax
000084D3  0C04              or al,0x4
000084D5  0400              add al,0x0
000084D7  001C00            add [eax+eax],bl
000084DA  0000              add [eax],al
000084DC  3C02              cmp al,0x2
000084DE  0000              add [eax],al
000084E0  94                xchg eax,esp
000084E1  CF                iret
000084E2  FF                db 0xff
000084E3  FF09              dec dword [ecx]
000084E5  0100              add [eax],eax
000084E7  0000              add [eax],al
000084E9  41                inc ecx
000084EA  0E                push cs
000084EB  088502420D05      or [ebp+0x50d4202],al
000084F1  030501C50C04      add eax,[dword 0x40cc501]
000084F7  041C              add al,0x1c
000084F9  0000              add [eax],al
000084FB  005C0200          add [edx+eax+0x0],bl
000084FF  007DD0            add [ebp-0x30],bh
00008502  FF                db 0xff
00008503  FFF7              push edi
00008505  0000              add [eax],al
00008507  0000              add [eax],al
00008509  41                inc ecx
0000850A  0E                push cs
0000850B  088502420D05      or [ebp+0x50d4202],al
00008511  02F3              add dh,bl
00008513  C50C04            lds ecx,[esp+eax]
00008516  0400              add al,0x0
00008518  1C00              sbb al,0x0
0000851A  0000              add [eax],al
0000851C  7C02              jl 0x8520
0000851E  0000              add [eax],al
00008520  54                push esp
00008521  D1FF              sar edi,1
00008523  FF8B00000000      dec dword [ebx+0x0]
00008529  41                inc ecx
0000852A  0E                push cs
0000852B  088502420D05      or [ebp+0x50d4202],al
00008531  0287C50C0404      add al,[edi+0x4040cc5]
00008537  001C00            add [eax+eax],bl
0000853A  0000              add [eax],al
0000853C  9C                pushf
0000853D  0200              add al,[eax]
0000853F  00BFD1FFFF6B      add [edi+0x6bffffd1],bh
00008545  0300              add eax,[eax]
00008547  0000              add [eax],al
00008549  41                inc ecx
0000854A  0E                push cs
0000854B  088502420D05      or [ebp+0x50d4202],al
00008551  036703            add esp,[edi+0x3]
00008554  C50C04            lds ecx,[esp+eax]
00008557  041C              add al,0x1c
00008559  0000              add [eax],al
0000855B  00BC0200000AD5    add [edx+eax-0x2af60000],bh
00008562  FF                db 0xff
00008563  FF22              jmp [edx]
00008565  0000              add [eax],al
00008567  0000              add [eax],al
00008569  41                inc ecx
0000856A  0E                push cs
0000856B  088502420D05      or [ebp+0x50d4202],al
00008571  5E                pop esi
00008572  C50C04            lds ecx,[esp+eax]
00008575  0400              add al,0x0
00008577  0000              add [eax],al
00008579  0000              add [eax],al
0000857B  0000              add [eax],al
0000857D  0000              add [eax],al
0000857F  00A05A1000A6      add [eax-0x59ffefa6],ah
00008585  5A                pop edx
00008586  1000              adc [eax],al
00008588  AA                stosb
00008589  5A                pop edx
0000858A  1000              adc [eax],al
0000858C  AC                lodsb
0000858D  5A                pop edx
0000858E  1000              adc [eax],al
00008590  AE                scasb
00008591  5A                pop edx
00008592  1000              adc [eax],al
00008594  B05A              mov al,0x5a
00008596  1000              adc [eax],al
00008598  B25A              mov dl,0x5a
0000859A  1000              adc [eax],al
0000859C  B45A              mov ah,0x5a
0000859E  1000              adc [eax],al
000085A0  B65A              mov dh,0x5a
000085A2  1000              adc [eax],al
000085A4  B85A1000BA        mov eax,0xba00105a
000085A9  5A                pop edx
000085AA  1000              adc [eax],al
000085AC  BC5A1000BE        mov esp,0xbe00105a
000085B1  5A                pop edx
000085B2  1000              adc [eax],al
000085B4  C05A1000          rcr byte [edx+0x10],byte 0x0
000085B8  C25A10            ret 0x105a
000085BB  00CC              add ah,cl
000085BD  5A                pop edx
000085BE  1000              adc [eax],al
000085C0  D05A10            rcr byte [edx+0x10],1
000085C3  00D2              add dl,dl
000085C5  5A                pop edx
000085C6  1000              adc [eax],al
000085C8  D45A              aam 0x5a
000085CA  1000              adc [eax],al
000085CC  D6                salc
000085CD  5A                pop edx
000085CE  1000              adc [eax],al
000085D0  D85A10            fcomp dword [edx+0x10]
000085D3  00DA              add dl,bl
000085D5  5A                pop edx
000085D6  1000              adc [eax],al
000085D8  DC5A10            fcomp qword [edx+0x10]
000085DB  00DE              add dh,bl
000085DD  5A                pop edx
000085DE  1000              adc [eax],al
000085E0  E05A              loopne 0x863c
000085E2  1000              adc [eax],al
000085E4  E25A              loop 0x8640
000085E6  1000              adc [eax],al
000085E8  E45A              in al,0x5a
000085EA  1000              adc [eax],al
000085EC  E65A              out 0x5a,al
000085EE  1000              adc [eax],al
000085F0  E85A1000EE        call 0xee00964f
000085F5  5A                pop edx
000085F6  1000              adc [eax],al
000085F8  F4                hlt
000085F9  5A                pop edx
000085FA  1000              adc [eax],al
000085FC  F65A10            neg byte [edx+0x10]
000085FF  00F8              add al,bh
00008601  5A                pop edx
00008602  1000              adc [eax],al
00008604  FA                cli
00008605  5A                pop edx
00008606  1000              adc [eax],al
00008608  FC                cld
00008609  5A                pop edx
0000860A  1000              adc [eax],al
0000860C  FE                db 0xfe
0000860D  5A                pop edx
0000860E  1000              adc [eax],al
00008610  005B10            add [ebx+0x10],bl
00008613  0002              add [edx],al
00008615  5B                pop ebx
00008616  1000              adc [eax],al
00008618  045B              add al,0x5b
0000861A  1000              adc [eax],al
0000861C  06                push es
0000861D  5B                pop ebx
0000861E  1000              adc [eax],al
00008620  085B10            or [ebx+0x10],bl
00008623  000A              add [edx],cl
00008625  5B                pop ebx
00008626  1000              adc [eax],al
00008628  0C5B              or al,0x5b
0000862A  1000              adc [eax],al
0000862C  135B10            adc ebx,[ebx+0x10]
0000862F  00155B100017      add [dword 0x1700105b],dl
00008635  5B                pop ebx
00008636  1000              adc [eax],al
00008638  195B10            sbb [ebx+0x10],ebx
0000863B  001B              add [ebx],bl
0000863D  5B                pop ebx
0000863E  1000              adc [eax],al
00008640  1D5B10001F        sbb eax,0x1f00105b
00008645  5B                pop ebx
00008646  1000              adc [eax],al
00008648  215B10            and [ebx+0x10],ebx
0000864B  0023              add [ebx],ah
0000864D  5B                pop ebx
0000864E  1000              adc [eax],al
00008650  255B100027        and eax,0x2700105b
00008655  5B                pop ebx
00008656  1000              adc [eax],al
00008658  295B10            sub [ebx+0x10],ebx
0000865B  0030              add [eax],dh
0000865D  5B                pop ebx
0000865E  1000              adc [eax],al
00008660  395B10            cmp [ebx+0x10],ebx
00008663  003E              add [esi],bh
00008665  5B                pop ebx
00008666  1000              adc [eax],al
00008668  47                inc edi
00008669  5B                pop ebx
0000866A  1000              adc [eax],al
0000866C  50                push eax
0000866D  5B                pop ebx
0000866E  1000              adc [eax],al
00008670  53                push ebx
00008671  5B                pop ebx
00008672  1000              adc [eax],al
00008674  56                push esi
00008675  5B                pop ebx
00008676  1000              adc [eax],al
00008678  59                pop ecx
00008679  5B                pop ebx
0000867A  1000              adc [eax],al
0000867C  5C                pop esp
0000867D  5B                pop ebx
0000867E  1000              adc [eax],al
00008680  5F                pop edi
00008681  5B                pop ebx
00008682  1000              adc [eax],al
00008684  625B10            bound ebx,[ebx+0x10]
00008687  00655B            add [ebp+0x5b],ah
0000868A  1000              adc [eax],al
0000868C  685B10006B        push dword 0x6b00105b
00008691  5B                pop ebx
00008692  1000              adc [eax],al
00008694  6F                outsd
00008695  5B                pop ebx
00008696  1000              adc [eax],al
00008698  775B              ja 0x86f5
0000869A  1000              adc [eax],al
0000869C  82                db 0x82
0000869D  5B                pop ebx
0000869E  1000              adc [eax],al
000086A0  8B5B10            mov ebx,[ebx+0x10]
000086A3  00945B10009D5B    add [ebx+ebx*2+0x5b9d0010],dl
000086AA  1000              adc [eax],al
000086AC  A6                cmpsb
000086AD  5B                pop ebx
000086AE  1000              adc [eax],al
000086B0  AF                scasd
000086B1  5B                pop ebx
000086B2  1000              adc [eax],al
000086B4  B85B1000C1        mov eax,0xc100105b
000086B9  5B                pop ebx
000086BA  1000              adc [eax],al
000086BC  CA5B10            retf 0x105b
000086BF  00D3              add bl,dl
000086C1  5B                pop ebx
000086C2  1000              adc [eax],al
000086C4  DC5B10            fcomp qword [ebx+0x10]
000086C7  00E5              add ch,ah
000086C9  5B                pop ebx
000086CA  1000              adc [eax],al
000086CC  EE                out dx,al
000086CD  5B                pop ebx
000086CE  1000              adc [eax],al
000086D0  F75B10            neg dword [ebx+0x10]
000086D3  0001              add [ecx],al
000086D5  5C                pop esp
000086D6  1000              adc [eax],al
000086D8  015C1000          add [eax+edx+0x0],ebx
000086DC  055C100009        add eax,0x900105c
000086E1  5C                pop esp
000086E2  1000              adc [eax],al
000086E4  0D5C100016        or eax,0x1600105c
000086E9  5C                pop esp
000086EA  1000              adc [eax],al
000086EC  215C1000          and [eax+edx+0x0],ebx
000086F0  2C5C              sub al,0x5c
000086F2  1000              adc [eax],al
000086F4  0000              add [eax],al
000086F6  0000              add [eax],al
000086F8  0000              add [eax],al
000086FA  0000              add [eax],al
000086FC  0000              add [eax],al
000086FE  0000              add [eax],al
00008700  52                push edx
00008701  6210              bound edx,[eax]
00008703  006362            add [ebx+0x62],ah
00008706  1000              adc [eax],al
00008708  69621000806210    imul esp,[edx+0x10],dword 0x10628000
0000870F  008B621000A2      add [ebx-0x5dffef9e],cl
00008715  6210              bound edx,[eax]
00008717  00B0621000BF      add [eax-0x40ffef9e],dh
0000871D  6210              bound edx,[eax]
0000871F  00CE              add dh,cl
00008721  6210              bound edx,[eax]
00008723  00DB              add bl,bl
00008725  6210              bound edx,[eax]
00008727  00F7              add bh,dh
00008729  6210              bound edx,[eax]
0000872B  00FF              add bh,bh
0000872D  6210              bound edx,[eax]
0000872F  0013              add [ebx],dl
00008731  6310              arpl [eax],dx
00008733  001F              add [edi],bl
00008735  6310              arpl [eax],dx
00008737  0038              add [eax],bh
00008739  6310              arpl [eax],dx
0000873B  004363            add [ebx+0x63],al
0000873E  1000              adc [eax],al
00008740  55                push ebp
00008741  6310              arpl [eax],dx
00008743  006763            add [edi+0x63],ah
00008746  1000              adc [eax],al
00008748  7763              ja 0x87ad
0000874A  1000              adc [eax],al
0000874C  856310            test [ebx+0x10],esp
0000874F  008563100085      add [ebp-0x7affef9d],al
00008755  6310              arpl [eax],dx
00008757  008563100085      add [ebp-0x7affef9d],al
0000875D  6310              arpl [eax],dx
0000875F  008563100085      add [ebp-0x7affef9d],al
00008765  6310              arpl [eax],dx
00008767  008563100085      add [ebp-0x7affef9d],al
0000876D  6310              arpl [eax],dx
0000876F  008563100085      add [ebp-0x7affef9d],al
00008775  6310              arpl [eax],dx
00008777  008563100085      add [ebp-0x7affef9d],al
0000877D  6310              arpl [eax],dx
0000877F  000F              add [edi],cl
00008781  0000              add [eax],al
00008783  0000              add [eax],al
00008785  0000              add [eax],al
00008787  0000              add [eax],al
00008789  0000              add [eax],al
0000878B  0000              add [eax],al
0000878D  0000              add [eax],al
0000878F  0000              add [eax],al
00008791  0000              add [eax],al
00008793  0000              add [eax],al
00008795  0000              add [eax],al
00008797  0000              add [eax],al
00008799  0000              add [eax],al
0000879B  0000              add [eax],al
0000879D  0000              add [eax],al
0000879F  004065            add [eax+0x65],al
000087A2  1000              adc [eax],al
000087A4  46                inc esi
000087A5  651000            adc [gs:eax],al
000087A8  4A                dec edx
000087A9  651000            adc [gs:eax],al
000087AC  4C                dec esp
000087AD  651000            adc [gs:eax],al
000087B0  4E                dec esi
000087B1  651000            adc [gs:eax],al
000087B4  50                push eax
000087B5  651000            adc [gs:eax],al
000087B8  52                push edx
000087B9  651000            adc [gs:eax],al
000087BC  54                push esp
000087BD  651000            adc [gs:eax],al
000087C0  56                push esi
000087C1  651000            adc [gs:eax],al
000087C4  58                pop eax
000087C5  651000            adc [gs:eax],al
000087C8  5A                pop edx
000087C9  651000            adc [gs:eax],al
000087CC  5C                pop esp
000087CD  651000            adc [gs:eax],al
000087D0  5E                pop esi
000087D1  651000            adc [gs:eax],al
000087D4  60                pusha
000087D5  651000            adc [gs:eax],al
000087D8  626510            bound esp,[ebp+0x10]
000087DB  006C6510          add [ebp+0x10],ch
000087DF  007065            add [eax+0x65],dh
000087E2  1000              adc [eax],al
000087E4  7265              jc 0x884b
000087E6  1000              adc [eax],al
000087E8  7465              jz 0x884f
000087EA  1000              adc [eax],al
000087EC  7665              jna 0x8853
000087EE  1000              adc [eax],al
000087F0  7865              js 0x8857
000087F2  1000              adc [eax],al
000087F4  7A65              jpe 0x885b
000087F6  1000              adc [eax],al
000087F8  7C65              jl 0x885f
000087FA  1000              adc [eax],al
000087FC  7E65              jng 0x8863
000087FE  1000              adc [eax],al
00008800  80651000          and byte [ebp+0x10],0x0
00008804  82                db 0x82
00008805  651000            adc [gs:eax],al
00008808  846510            test [ebp+0x10],ah
0000880B  008665100088      add [esi-0x77ffef9b],al
00008811  651000            adc [gs:eax],al
00008814  8E6510            mov fs,[ebp+0x10]
00008817  00946510009665    add [ebp+0x65960010],dl
0000881E  1000              adc [eax],al
00008820  98                cwde
00008821  651000            adc [gs:eax],al
00008824  9A6510009C6510    call 0x1065:0x9c001065
0000882B  009E651000A0      add [esi-0x5fffef9b],bl
00008831  651000            adc [gs:eax],al
00008834  A2651000A4        mov [0xa4001065],al
00008839  651000            adc [gs:eax],al
0000883C  A6                cmpsb
0000883D  651000            adc [gs:eax],al
00008840  A865              test al,0x65
00008842  1000              adc [eax],al
00008844  AA                stosb
00008845  651000            adc [gs:eax],al
00008848  AC                lodsb
00008849  651000            adc [gs:eax],al
0000884C  B365              mov bl,0x65
0000884E  1000              adc [eax],al
00008850  B565              mov ch,0x65
00008852  1000              adc [eax],al
00008854  B765              mov bh,0x65
00008856  1000              adc [eax],al
00008858  B9651000BB        mov ecx,0xbb001065
0000885D  651000            adc [gs:eax],al
00008860  BD651000BF        mov ebp,0xbf001065
00008865  651000            adc [gs:eax],al
00008868  C1651000          shl dword [ebp+0x10],byte 0x0
0000886C  C3                ret
0000886D  651000            adc [gs:eax],al
00008870  C56510            lds esp,[ebp+0x10]
00008873  00C7              add bh,al
00008875  651000            adc [gs:eax],al
00008878  C9                leave
00008879  651000            adc [gs:eax],al
0000887C  D06510            shl byte [ebp+0x10],1
0000887F  00D9              add cl,bl
00008881  651000            adc [gs:eax],al
00008884  DE6510            fisub word [ebp+0x10]
00008887  00E7              add bh,ah
00008889  651000            adc [gs:eax],al
0000888C  F0651000          lock adc [gs:eax],al
00008890  F3651000          rep adc [gs:eax],al
00008894  F66510            mul byte [ebp+0x10]
00008897  00F9              add cl,bh
00008899  651000            adc [gs:eax],al
0000889C  FC                cld
0000889D  651000            adc [gs:eax],al
000088A0  FF6510            jmp [ebp+0x10]
000088A3  0002              add [edx],al
000088A5  661000            o16 adc [eax],al
000088A8  0566100008        add eax,0x8001066
000088AD  661000            o16 adc [eax],al
000088B0  0B6610            or esp,[esi+0x10]
000088B3  000F              add [edi],cl
000088B5  661000            o16 adc [eax],al
000088B8  17                pop ss
000088B9  661000            o16 adc [eax],al
000088BC  226610            and ah,[esi+0x10]
000088BF  002B              add [ebx],ch
000088C1  661000            o16 adc [eax],al
000088C4  3466              xor al,0x66
000088C6  1000              adc [eax],al
000088C8  3D66100046        cmp eax,0x46001066
000088CD  661000            o16 adc [eax],al
000088D0  4F                dec edi
000088D1  661000            o16 adc [eax],al
000088D4  58                pop eax
000088D5  661000            o16 adc [eax],al
000088D8  61                popa
000088D9  661000            o16 adc [eax],al
000088DC  6A66              push byte +0x66
000088DE  1000              adc [eax],al
000088E0  7366              jnc 0x8948
000088E2  1000              adc [eax],al
000088E4  7C66              jl 0x894c
000088E6  1000              adc [eax],al
000088E8  856610            test [esi+0x10],esp
000088EB  008E66100097      add [esi-0x68ffef9a],cl
000088F1  661000            o16 adc [eax],al
000088F4  A1661000A1        mov eax,[0xa1001066]
000088F9  661000            o16 adc [eax],al
000088FC  A5                movsd
000088FD  661000            o16 adc [eax],al
00008900  A9661000AD        test eax,0xad001066
00008905  661000            o16 adc [eax],al
00008908  B666              mov dh,0x66
0000890A  1000              adc [eax],al
0000890C  C1661000          shl dword [esi+0x10],byte 0x0
00008910  CC                int3
00008911  661000            o16 adc [eax],al
00008914  0000              add [eax],al
00008916  0000              add [eax],al
00008918  0000              add [eax],al
0000891A  0000              add [eax],al
0000891C  0000              add [eax],al
0000891E  0000              add [eax],al
00008920  E067              loopne 0x8989
00008922  1000              adc [eax],al
00008924  E667              out 0x67,al
00008926  1000              adc [eax],al
00008928  EA671000EC6710    jmp 0x1067:0xec001067
0000892F  00EE              add dh,ch
00008931  671000            adc [bx+si],al
00008934  F0671000          lock adc [bx+si],al
00008938  F2671000          repne adc [bx+si],al
0000893C  F4                hlt
0000893D  671000            adc [bx+si],al
00008940  F66710            mul byte [edi+0x10]
00008943  00F8              add al,bh
00008945  671000            adc [bx+si],al
00008948  FA                cli
00008949  671000            adc [bx+si],al
0000894C  FC                cld
0000894D  671000            adc [bx+si],al
00008950  FE                db 0xfe
00008951  671000            adc [bx+si],al
00008954  006810            add [eax+0x10],ch
00008957  0002              add [edx],al
00008959  6810000C68        push dword 0x680c0010
0000895E  1000              adc [eax],al
00008960  106810            adc [eax+0x10],ch
00008963  0012              add [edx],dl
00008965  6810001468        push dword 0x68140010
0000896A  1000              adc [eax],al
0000896C  16                push ss
0000896D  6810001868        push dword 0x68180010
00008972  1000              adc [eax],al
00008974  1A6810            sbb ch,[eax+0x10]
00008977  001C68            add [eax+ebp*2],bl
0000897A  1000              adc [eax],al
0000897C  1E                push ds
0000897D  6810002068        push dword 0x68200010
00008982  1000              adc [eax],al
00008984  226810            and ch,[eax+0x10]
00008987  002468            add [eax+ebp*2],ah
0000898A  1000              adc [eax],al
0000898C  266810002868      es push dword 0x68280010
00008992  1000              adc [eax],al
00008994  2E6810003468      cs push dword 0x68340010
0000899A  1000              adc [eax],al
0000899C  366810003868      ss push dword 0x68380010
000089A2  1000              adc [eax],al
000089A4  3A6810            cmp ch,[eax+0x10]
000089A7  003C68            add [eax+ebp*2],bh
000089AA  1000              adc [eax],al
000089AC  3E6810004068      ds push dword 0x68400010
000089B2  1000              adc [eax],al
000089B4  42                inc edx
000089B5  6810004468        push dword 0x68440010
000089BA  1000              adc [eax],al
000089BC  46                inc esi
000089BD  6810004868        push dword 0x68480010
000089C2  1000              adc [eax],al
000089C4  4A                dec edx
000089C5  6810004C68        push dword 0x684c0010
000089CA  1000              adc [eax],al
000089CC  53                push ebx
000089CD  6810005568        push dword 0x68550010
000089D2  1000              adc [eax],al
000089D4  57                push edi
000089D5  6810005968        push dword 0x68590010
000089DA  1000              adc [eax],al
000089DC  5B                pop ebx
000089DD  6810005D68        push dword 0x685d0010
000089E2  1000              adc [eax],al
000089E4  5F                pop edi
000089E5  6810006168        push dword 0x68610010
000089EA  1000              adc [eax],al
000089EC  636810            arpl [eax+0x10],bp
000089EF  006568            add [ebp+0x68],ah
000089F2  1000              adc [eax],al
000089F4  676810006968      push dword 0x68690010
000089FA  1000              adc [eax],al
000089FC  7068              jo 0x8a66
000089FE  1000              adc [eax],al
00008A00  7968              jns 0x8a6a
00008A02  1000              adc [eax],al
00008A04  7E68              jng 0x8a6e
00008A06  1000              adc [eax],al
00008A08  876810            xchg ebp,[eax+0x10]
00008A0B  009068100093      add [eax-0x6cffef98],dl
00008A11  6810009668        push dword 0x68960010
00008A16  1000              adc [eax],al
00008A18  99                cdq
00008A19  6810009C68        push dword 0x689c0010
00008A1E  1000              adc [eax],al
00008A20  9F                lahf
00008A21  681000A268        push dword 0x68a20010
00008A26  1000              adc [eax],al
00008A28  A5                movsd
00008A29  681000A868        push dword 0x68a80010
00008A2E  1000              adc [eax],al
00008A30  AB                stosd
00008A31  681000AF68        push dword 0x68af0010
00008A36  1000              adc [eax],al
00008A38  B768              mov bh,0x68
00008A3A  1000              adc [eax],al
00008A3C  C26810            ret 0x1068
00008A3F  00CB              add bl,cl
00008A41  681000D468        push dword 0x68d40010
00008A46  1000              adc [eax],al
00008A48  DD                db 0xdd
00008A49  681000E668        push dword 0x68e60010
00008A4E  1000              adc [eax],al
00008A50  EF                out dx,eax
00008A51  681000F868        push dword 0x68f80010
00008A56  1000              adc [eax],al
00008A58  016910            add [ecx+0x10],ebp
00008A5B  000A              add [edx],cl
00008A5D  691000136910      imul edx,[eax],dword 0x10691300
00008A63  001C69            add [ecx+ebp*2],bl
00008A66  1000              adc [eax],al
00008A68  256910002E        and eax,0x2e001069
00008A6D  691000376910      imul edx,[eax],dword 0x10693700
00008A73  004169            add [ecx+0x69],al
00008A76  1000              adc [eax],al
00008A78  41                inc ecx
00008A79  691000456910      imul edx,[eax],dword 0x10694500
00008A7F  004969            add [ecx+0x69],cl
00008A82  1000              adc [eax],al
00008A84  4D                dec ebp
00008A85  691000566910      imul edx,[eax],dword 0x10695600
00008A8B  006169            add [ecx+0x69],ah
00008A8E  1000              adc [eax],al
00008A90  6C                insb
00008A91  691000B168DE      imul edx,[eax],dword 0xde68b100
00008A97  3A9A02000028      cmp bl,[edx+0x28000002]
00008A9D  0C00              or al,0x0
00008A9F  006703            add [edi+0x3],ah
00008AA2  0803              or [ebx],al
00008AA4  0002              add [edx],al
00008AA6  2D2728902B        sub eax,0x2b902827
00008AAB  A0BF1F004F        mov al,[0x4f001fbf]
00008AB0  0D0E000000        or eax,0xe
00008AB5  A09C8E8F14        mov al,[0x148f8e9c]
00008ABA  1F                pop ds
00008ABB  96                xchg eax,esi
00008ABC  B9A3FF0000        mov ecx,0xffa3
00008AC1  0000              add [eax],al
00008AC3  0010              add [eax],dl
00008AC5  0E                push cs
00008AC6  00FF              add bh,bh
00008AC8  0001              add [ecx],al
00008ACA  0203              add al,[ebx]
00008ACC  0405              add al,0x5
00008ACE  1407              adc al,0x7
00008AD0  3839              cmp [ecx],bh
00008AD2  3A3B              cmp bh,[ebx]
00008AD4  3C3D              cmp al,0x3d
00008AD6  3E3F              ds aas
00008AD8  0C00              or al,0x0
00008ADA  0F08              invd
00008ADC  0000              add [eax],al
00008ADE  0000              add [eax],al
00008AE0  670308            add ecx,[bx+si]
00008AE3  0300              add eax,[eax]
00008AE5  022D2728902B      add ch,[dword 0x2b902827]
00008AEB  A0BF1F0047        mov al,[0x47001fbf]
00008AF0  06                push es
00008AF1  07                pop es
00008AF2  0000              add [eax],al
00008AF4  0460              add al,0x60
00008AF6  9C                pushf
00008AF7  8E8F141F96B9      mov cs,[edi-0x4669e0ec]
00008AFD  A3FF000000        mov [0xff],eax
00008B02  0000              add [eax],al
00008B04  100E              adc [esi],cl
00008B06  00FF              add bh,bh
00008B08  0001              add [ecx],al
00008B0A  0203              add al,[ebx]
00008B0C  0405              add al,0x5
00008B0E  1407              adc al,0x7
00008B10  3839              cmp [ecx],bh
00008B12  3A3B              cmp bh,[ebx]
00008B14  3C3D              cmp al,0x3d
00008B16  3E3F              ds aas
00008B18  0C00              or al,0x0
00008B1A  0F08              invd
00008B1C  0000              add [eax],al
00008B1E  0000              add [eax],al
00008B20  670300            add eax,[bx+si]
00008B23  0300              add eax,[eax]
00008B25  025F4F            add bl,[edi+0x4f]
00008B28  50                push eax
00008B29  82                db 0x82
00008B2A  55                push ebp
00008B2B  81BF1F004F0D0E00  cmp dword [edi+0xd4f001f],0xe
         -0000
00008B35  50                push eax
00008B36  9C                pushf
00008B37  0E                push cs
00008B38  8F                db 0x8f
00008B39  281F              sub [edi],bl
00008B3B  96                xchg eax,esi
00008B3C  B9A3FF0000        mov ecx,0xffa3
00008B41  0000              add [eax],al
00008B43  0010              add [eax],dl
00008B45  0E                push cs
00008B46  00FF              add bh,bh
00008B48  0001              add [ecx],al
00008B4A  0203              add al,[ebx]
00008B4C  0405              add al,0x5
00008B4E  1407              adc al,0x7
00008B50  3839              cmp [ecx],bh
00008B52  3A3B              cmp bh,[ebx]
00008B54  3C3D              cmp al,0x3d
00008B56  3E3F              ds aas
00008B58  0C00              or al,0x0
00008B5A  0F08              invd
00008B5C  0000              add [eax],al
00008B5E  0000              add [eax],al
00008B60  670300            add eax,[bx+si]
00008B63  0300              add eax,[eax]
00008B65  025F4F            add bl,[edi+0x4f]
00008B68  50                push eax
00008B69  82                db 0x82
00008B6A  55                push ebp
00008B6B  81BF1F0047060700  cmp dword [edi+0x647001f],0x1000007
         -0001
00008B75  40                inc eax
00008B76  9C                pushf
00008B77  8E8F281F96B9      mov cs,[edi-0x4669e0d8]
00008B7D  A3FF000000        mov [0xff],eax
00008B82  0000              add [eax],al
00008B84  100E              adc [esi],cl
00008B86  00FF              add bh,bh
00008B88  0001              add [ecx],al
00008B8A  0203              add al,[ebx]
00008B8C  0405              add al,0x5
00008B8E  1407              adc al,0x7
00008B90  3839              cmp [ecx],bh
00008B92  3A3B              cmp bh,[ebx]
00008B94  3C3D              cmp al,0x3d
00008B96  3E3F              ds aas
00008B98  0C00              or al,0x0
00008B9A  0F08              invd
00008B9C  0000              add [eax],al
00008B9E  0000              add [eax],al
00008BA0  E703              out 0x3,eax
00008BA2  0103              add [ebx],eax
00008BA4  0002              add [edx],al
00008BA6  6B595A82          imul ebx,[ecx+0x5a],byte -0x7e
00008BAA  60                pusha
00008BAB  8D0B              lea ecx,[ebx]
00008BAD  3E004F0D          add [ds:edi+0xd],cl
00008BB1  0E                push cs
00008BB2  0000              add [eax],al
00008BB4  0000              add [eax],al
00008BB6  EA0CDF2D10E805    jmp 0x5e8:0x102ddf0c
00008BBD  A3FF000000        mov [0xff],eax
00008BC2  0000              add [eax],al
00008BC4  100E              adc [esi],cl
00008BC6  00FF              add bh,bh
00008BC8  0001              add [ecx],al
00008BCA  0203              add al,[ebx]
00008BCC  0405              add al,0x5
00008BCE  1407              adc al,0x7
00008BD0  3839              cmp [ecx],bh
00008BD2  3A3B              cmp bh,[ebx]
00008BD4  3C3D              cmp al,0x3d
00008BD6  3E3F              ds aas
00008BD8  0C00              or al,0x0
00008BDA  0F08              invd
00008BDC  0000              add [eax],al
00008BDE  0000              add [eax],al
00008BE0  E703              out 0x3,eax
00008BE2  0103              add [ebx],eax
00008BE4  0002              add [edx],al
00008BE6  6B595A82          imul ebx,[ecx+0x5a],byte -0x7e
00008BEA  60                pusha
00008BEB  8D0B              lea ecx,[ebx]
00008BED  3E004706          add [ds:edi+0x6],al
00008BF1  07                pop es
00008BF2  0000              add [eax],al
00008BF4  0000              add [eax],al
00008BF6  EA0CDF2D08E805    jmp 0x5e8:0x82ddf0c
00008BFD  A3FF000000        mov [0xff],eax
00008C02  0000              add [eax],al
00008C04  100E              adc [esi],cl
00008C06  00FF              add bh,bh
00008C08  0001              add [ecx],al
00008C0A  0203              add al,[ebx]
00008C0C  0405              add al,0x5
00008C0E  1407              adc al,0x7
00008C10  3839              cmp [ecx],bh
00008C12  3A3B              cmp bh,[ebx]
00008C14  3C3D              cmp al,0x3d
00008C16  3E3F              ds aas
00008C18  0C00              or al,0x0
00008C1A  0F08              invd
00008C1C  0000              add [eax],al
00008C1E  0000              add [eax],al
00008C20  E303              jecxz 0x8c25
00008C22  010F              add [edi],ecx
00008C24  0006              add [esi],al
00008C26  5F                pop edi
00008C27  4F                dec edi
00008C28  50                push eax
00008C29  82                db 0x82
00008C2A  54                push esp
00008C2B  800B3E            or byte [ebx],0x3e
00008C2E  004000            add [eax+0x0],al
00008C31  0000              add [eax],al
00008C33  0000              add [eax],al
00008C35  00EA              add dl,ch
00008C37  0CDF              or al,0xdf
00008C39  2800              sub [eax],al
00008C3B  E704              out 0x4,eax
00008C3D  E3FF              jecxz 0x8c3e
00008C3F  0000              add [eax],al
00008C41  0000              add [eax],al
00008C43  0000              add [eax],al
00008C45  050FFF0001        add eax,0x100ff0f
00008C4A  0203              add al,[ebx]
00008C4C  0405              add al,0x5
00008C4E  1407              adc al,0x7
00008C50  3839              cmp [ecx],bh
00008C52  3A3B              cmp bh,[ebx]
00008C54  3C3D              cmp al,0x3d
00008C56  3E3F              ds aas
00008C58  0100              add [eax],eax
00008C5A  0F0000            sldt [eax]
00008C5D  0000              add [eax],al
00008C5F  006303            add [ebx+0x3],ah
00008C62  0903              or [ebx],eax
00008C64  0002              add [edx],al
00008C66  2D2728902B        sub eax,0x2b902827
00008C6B  80BF1F00410000    cmp byte [edi+0x41001f],0x0
00008C72  0000              add [eax],al
00008C74  0000              add [eax],al
00008C76  9C                pushf
00008C77  0E                push cs
00008C78  8F                db 0x8f
00008C79  1400              adc al,0x0
00008C7B  96                xchg eax,esi
00008C7C  B9A3FF0000        mov ecx,0xffa3
00008C81  0000              add [eax],al
00008C83  0030              add [eax],dh
00008C85  0200              add al,[eax]
00008C87  FF00              inc dword [eax]
00008C89  131517020406      adc edx,[dword 0x6040217]
00008C8F  07                pop es
00008C90  1011              adc [ecx],dl
00008C92  1213              adc dl,[ebx]
00008C94  1415              adc al,0x15
00008C96  16                push ss
00008C97  17                pop ss
00008C98  0100              add [eax],eax
00008C9A  0300              add eax,[eax]
00008C9C  0000              add [eax],al
00008C9E  0000              add [eax],al
00008CA0  E303              jecxz 0x8ca5
00008CA2  0108              add [eax],ecx
00008CA4  0006              add [esi],al
00008CA6  5F                pop edi
00008CA7  4F                dec edi
00008CA8  50                push eax
00008CA9  82                db 0x82
00008CAA  54                push esp
00008CAB  800B3E            or byte [ebx],0x3e
00008CAE  004000            add [eax+0x0],al
00008CB1  0000              add [eax],al
00008CB3  0000              add [eax],al
00008CB5  00EA              add dl,ch
00008CB7  0CDF              or al,0xdf
00008CB9  2800              sub [eax],al
00008CBB  E704              out 0x4,eax
00008CBD  E3FF              jecxz 0x8cbe
00008CBF  0000              add [eax],al
00008CC1  0000              add [eax],al
00008CC3  0300              add eax,[eax]
00008CC5  050FFF0001        add eax,0x100ff0f
00008CCA  0203              add al,[ebx]
00008CCC  0405              add al,0x5
00008CCE  1407              adc al,0x7
00008CD0  3839              cmp [ecx],bh
00008CD2  3A3B              cmp bh,[ebx]
00008CD4  3C3D              cmp al,0x3d
00008CD6  3E3F              ds aas
00008CD8  0100              add [eax],eax
00008CDA  0F0000            sldt [eax]
00008CDD  0000              add [eax],al
00008CDF  00E7              add bh,ah
00008CE1  0301              add eax,[ecx]
00008CE3  0800              or [eax],al
00008CE5  06                push es
00008CE6  6B595A82          imul ebx,[ecx+0x5a],byte -0x7e
00008CEA  60                pusha
00008CEB  8D0B              lea ecx,[ebx]
00008CED  3E004006          add [ds:eax+0x6],al
00008CF1  07                pop es
00008CF2  0000              add [eax],al
00008CF4  0000              add [eax],al
00008CF6  EA0CDF2D08E805    jmp 0x5e8:0x82ddf0c
00008CFD  E3FF              jecxz 0x8cfe
00008CFF  0000              add [eax],al
00008D01  0000              add [eax],al
00008D03  0300              add eax,[eax]
00008D05  050FFF0001        add eax,0x100ff0f
00008D0A  0203              add al,[ebx]
00008D0C  0405              add al,0x5
00008D0E  06                push es
00008D0F  07                pop es
00008D10  0809              or [ecx],cl
00008D12  0A0B              or cl,[ebx]
00008D14  0C0D              or al,0xd
00008D16  0E                push cs
00008D17  0F0100            sgdt [eax]
00008D1A  0F0000            sldt [eax]
00008D1D  0000              add [eax],al
00008D1F  006303            add [ebx+0x3],ah
00008D22  010F              add [edi],ecx
00008D24  000E              add [esi],cl
00008D26  5F                pop edi
00008D27  4F                dec edi
00008D28  50                push eax
00008D29  82                db 0x82
00008D2A  54                push esp
00008D2B  80BF1F00410000    cmp byte [edi+0x41001f],0x0
00008D32  0000              add [eax],al
00008D34  0000              add [eax],al
00008D36  9C                pushf
00008D37  0E                push cs
00008D38  8F                db 0x8f
00008D39  284096            sub [eax-0x6a],al
00008D3C  B9A3FF0000        mov ecx,0xffa3
00008D41  0000              add [eax],al
00008D43  004005            add [eax+0x5],al
00008D46  0FFF              ud0
00008D48  0001              add [ecx],al
00008D4A  0203              add al,[ebx]
00008D4C  0405              add al,0x5
00008D4E  06                push es
00008D4F  07                pop es
00008D50  0809              or [ecx],cl
00008D52  0A0B              or cl,[ebx]
00008D54  0C0D              or al,0xd
00008D56  0E                push cs
00008D57  0F4100            cmovno eax,[eax]
00008D5A  0F0000            sldt [eax]
00008D5D  0000              add [eax],al
00008D5F  006303            add [ebx+0x3],ah
00008D62  010F              add [edi],ecx
00008D64  0006              add [esi],al
00008D66  5F                pop edi
00008D67  4F                dec edi
00008D68  50                push eax
00008D69  82                db 0x82
00008D6A  54                push esp
00008D6B  80BF1F00410000    cmp byte [edi+0x41001f],0x0
00008D72  0000              add [eax],al
00008D74  0000              add [eax],al
00008D76  9C                pushf
00008D77  0E                push cs
00008D78  8F                db 0x8f
00008D79  2800              sub [eax],al
00008D7B  96                xchg eax,esi
00008D7C  B9E3FF0000        mov ecx,0xffe3
00008D81  0000              add [eax],al
00008D83  004005            add [eax+0x5],al
00008D86  0FFF              ud0
00008D88  0001              add [ecx],al
00008D8A  0203              add al,[ebx]
00008D8C  0405              add al,0x5
00008D8E  06                push es
00008D8F  07                pop es
00008D90  0809              or [ecx],cl
00008D92  0A0B              or cl,[ebx]
00008D94  0C0D              or al,0xd
00008D96  0E                push cs
00008D97  0F4100            cmovno eax,[eax]
00008D9A  0F0000            sldt [eax]
00008D9D  0000              add [eax],al
00008D9F  0000              add [eax],al
00008DA1  0000              add [eax],al
00008DA3  0000              add [eax],al
00008DA5  0000              add [eax],al
00008DA7  007E81            add [esi-0x7f],bh
00008DAA  A5                movsd
00008DAB  81BD99817E7EFFDB  cmp dword [ebp+0x7e7e8199],0xc3ffdbff
         -FFC3
00008DB5  E7FF              out 0xff,eax
00008DB7  7E6C              jng 0x8e25
00008DB9  FE                db 0xfe
00008DBA  FE                db 0xfe
00008DBB  FE                db 0xfe
00008DBC  7C38              jl 0x8df6
00008DBE  1000              adc [eax],al
00008DC0  1038              adc [eax],bh
00008DC2  7CFE              jl 0x8dc2
00008DC4  7C38              jl 0x8dfe
00008DC6  1000              adc [eax],al
00008DC8  387C38FE          cmp [eax+edi-0x2],bh
00008DCC  FE                db 0xfe
00008DCD  92                xchg eax,edx
00008DCE  107C0010          adc [eax+eax+0x10],bh
00008DD2  387CFE7C          cmp [esi+edi*8+0x7c],bh
00008DD6  387C0000          cmp [eax+eax+0x0],bh
00008DDA  183C3C            sbb [esp+edi],bh
00008DDD  1800              sbb [eax],al
00008DDF  00FF              add bh,bh
00008DE1  FFE7              jmp edi
00008DE3  C3                ret
00008DE4  C3                ret
00008DE5  E7FF              out 0xff,eax
00008DE7  FF00              inc dword [eax]
00008DE9  3C66              cmp al,0x66
00008DEB  42                inc edx
00008DEC  42                inc edx
00008DED  663C00            o16 cmp al,0x0
00008DF0  FFC3              inc ebx
00008DF2  99                cdq
00008DF3  BDBD99C3FF        mov ebp,0xffc399bd
00008DF8  0F07              sysret
00008DFA  0F                db 0x0f
00008DFB  7DCC              jnl 0x8dc9
00008DFD  CC                int3
00008DFE  CC                int3
00008DFF  783C              js 0x8e3d
00008E01  6666663C18        o16 cmp al,0x18
00008E06  7E18              jng 0x8e20
00008E08  3F                aas
00008E09  333F              xor edi,[edi]
00008E0B  3030              xor [eax],dh
00008E0D  70F0              jo 0x8dff
00008E0F  E07F              loopne 0x8e90
00008E11  637F63            arpl [edi+0x63],di
00008E14  6367E6            arpl [edi-0x1a],sp
00008E17  C0995A3CE7E73C    rcr byte [ecx-0x1818c3a6],byte 0x3c
00008E1E  5A                pop edx
00008E1F  99                cdq
00008E20  80E0F8            and al,0xf8
00008E23  FE                db 0xfe
00008E24  F8                clc
00008E25  E080              loopne 0x8da7
00008E27  0002              add [edx],al
00008E29  0E                push cs
00008E2A  3E                ds
00008E2B  FE                db 0xfe
00008E2C  3E0E              ds push cs
00008E2E  0200              add al,[eax]
00008E30  183C7E            sbb [esi+edi*2],bh
00008E33  1818              sbb [eax],bl
00008E35  7E3C              jng 0x8e73
00008E37  186666            sbb [esi+0x66],ah
00008E3A  666666006600      o16 add [esi+0x0],ah
00008E40  7FDB              jg 0x8e1d
00008E42  DB7B1B            fstp tword [ebx+0x1b]
00008E45  1B1B              sbb ebx,[ebx]
00008E47  003E              add [esi],bh
00008E49  6338              arpl [eax],di
00008E4B  6C                insb
00008E4C  6C                insb
00008E4D  3886FC000000      cmp [esi+0xfc],al
00008E53  007E7E            add [esi+0x7e],bh
00008E56  7E00              jng 0x8e58
00008E58  183C7E            sbb [esi+edi*2],bh
00008E5B  187E3C            sbb [esi+0x3c],bh
00008E5E  18FF              sbb bh,bh
00008E60  183C7E            sbb [esi+edi*2],bh
00008E63  1818              sbb [eax],bl
00008E65  1818              sbb [eax],bl
00008E67  0018              add [eax],bl
00008E69  1818              sbb [eax],bl
00008E6B  187E3C            sbb [esi+0x3c],bh
00008E6E  1800              sbb [eax],al
00008E70  0018              add [eax],bl
00008E72  0CFE              or al,0xfe
00008E74  0C18              or al,0x18
00008E76  0000              add [eax],al
00008E78  0030              add [eax],dh
00008E7A  60                pusha
00008E7B  FE                db 0xfe
00008E7C  60                pusha
00008E7D  3000              xor [eax],al
00008E7F  0000              add [eax],al
00008E81  00C0              add al,al
00008E83  C0C0FE            rol al,byte 0xfe
00008E86  0000              add [eax],al
00008E88  002466            add [esi],ah
00008E8B  FF6624            jmp [esi+0x24]
00008E8E  0000              add [eax],al
00008E90  0018              add [eax],bl
00008E92  3C7E              cmp al,0x7e
00008E94  FF                db 0xff
00008E95  FF00              inc dword [eax]
00008E97  0000              add [eax],al
00008E99  FF                db 0xff
00008E9A  FF                db 0xff
00008E9B  7E3C              jng 0x8ed9
00008E9D  1800              sbb [eax],al
00008E9F  0000              add [eax],al
00008EA1  0000              add [eax],al
00008EA3  0000              add [eax],al
00008EA5  0000              add [eax],al
00008EA7  0018              add [eax],bl
00008EA9  3C3C              cmp al,0x3c
00008EAB  1818              sbb [eax],bl
00008EAD  0018              add [eax],bl
00008EAF  006C6C6C          add [esp+ebp*2+0x6c],ch
00008EB3  0000              add [eax],al
00008EB5  0000              add [eax],al
00008EB7  006C6CFE          add [esp+ebp*2-0x2],ch
00008EBB  6C                insb
00008EBC  FE                db 0xfe
00008EBD  6C                insb
00008EBE  6C                insb
00008EBF  0018              add [eax],bl
00008EC1  7EC0              jng 0x8e83
00008EC3  7C06              jl 0x8ecb
00008EC5  FC                cld
00008EC6  1800              sbb [eax],al
00008EC8  00C6              add dh,al
00008ECA  CC                int3
00008ECB  1830              sbb [eax],dh
00008ECD  66C60038          o16 mov byte [eax],0x38
00008ED1  6C                insb
00008ED2  3876DC            cmp [esi-0x24],dh
00008ED5  CC                int3
00008ED6  7600              jna 0x8ed8
00008ED8  3030              xor [eax],dh
00008EDA  60                pusha
00008EDB  0000              add [eax],al
00008EDD  0000              add [eax],al
00008EDF  0018              add [eax],bl
00008EE1  306060            xor [eax+0x60],ah
00008EE4  60                pusha
00008EE5  3018              xor [eax],bl
00008EE7  006030            add [eax+0x30],ah
00008EEA  1818              sbb [eax],bl
00008EEC  1830              sbb [eax],dh
00008EEE  60                pusha
00008EEF  0000              add [eax],al
00008EF1  663CFF            o16 cmp al,0xff
00008EF4  3C66              cmp al,0x66
00008EF6  0000              add [eax],al
00008EF8  0018              add [eax],bl
00008EFA  187E18            sbb [esi+0x18],bh
00008EFD  1800              sbb [eax],al
00008EFF  0000              add [eax],al
00008F01  0000              add [eax],al
00008F03  0000              add [eax],al
00008F05  1818              sbb [eax],bl
00008F07  3000              xor [eax],al
00008F09  0000              add [eax],al
00008F0B  7E00              jng 0x8f0d
00008F0D  0000              add [eax],al
00008F0F  0000              add [eax],al
00008F11  0000              add [eax],al
00008F13  0000              add [eax],al
00008F15  1818              sbb [eax],bl
00008F17  0006              add [esi],al
00008F19  0C18              or al,0x18
00008F1B  3060C0            xor [eax-0x40],ah
00008F1E  80007C            add byte [eax],0x7c
00008F21  CE                into
00008F22  DEF6              fdivrp st6
00008F24  E6C6              out 0xc6,al
00008F26  7C00              jl 0x8f28
00008F28  307030            xor [eax+0x30],dh
00008F2B  3030              xor [eax],dh
00008F2D  30FC              xor ah,bh
00008F2F  0078CC            add [eax-0x34],bh
00008F32  0C38              or al,0x38
00008F34  60                pusha
00008F35  CC                int3
00008F36  FC                cld
00008F37  0078CC            add [eax-0x34],bh
00008F3A  0C38              or al,0x38
00008F3C  0CCC              or al,0xcc
00008F3E  7800              js 0x8f40
00008F40  1C3C              sbb al,0x3c
00008F42  6C                insb
00008F43  CC                int3
00008F44  FE0C1E            dec byte [esi+ebx]
00008F47  00FC              add ah,bh
00008F49  C0F80C            sar al,byte 0xc
00008F4C  0CCC              or al,0xcc
00008F4E  7800              js 0x8f50
00008F50  3860C0            cmp [eax-0x40],ah
00008F53  F8                clc
00008F54  CC                int3
00008F55  CC                int3
00008F56  7800              js 0x8f58
00008F58  FC                cld
00008F59  CC                int3
00008F5A  0C18              or al,0x18
00008F5C  3030              xor [eax],dh
00008F5E  3000              xor [eax],al
00008F60  78CC              js 0x8f2e
00008F62  CC                int3
00008F63  78CC              js 0x8f31
00008F65  CC                int3
00008F66  7800              js 0x8f68
00008F68  78CC              js 0x8f36
00008F6A  CC                int3
00008F6B  7C0C              jl 0x8f79
00008F6D  187000            sbb [eax+0x0],dh
00008F70  0018              add [eax],bl
00008F72  1800              sbb [eax],al
00008F74  0018              add [eax],bl
00008F76  1800              sbb [eax],al
00008F78  0018              add [eax],bl
00008F7A  1800              sbb [eax],al
00008F7C  0018              add [eax],bl
00008F7E  1830              sbb [eax],dh
00008F80  1830              sbb [eax],dh
00008F82  60                pusha
00008F83  C0603018          shl byte [eax+0x30],byte 0x18
00008F87  0000              add [eax],al
00008F89  007E00            add [esi+0x0],bh
00008F8C  7E00              jng 0x8f8e
00008F8E  0000              add [eax],al
00008F90  60                pusha
00008F91  3018              xor [eax],bl
00008F93  0C18              or al,0x18
00008F95  306000            xor [eax+0x0],ah
00008F98  3C66              cmp al,0x66
00008F9A  0C18              or al,0x18
00008F9C  1800              sbb [eax],al
00008F9E  1800              sbb [eax],al
00008FA0  7CC6              jl 0x8f68
00008FA2  DE                db 0xde
00008FA3  DE                db 0xde
00008FA4  DCC0              fadd to st0
00008FA6  7C00              jl 0x8fa8
00008FA8  3078CC            xor [eax-0x34],bh
00008FAB  CC                int3
00008FAC  FC                cld
00008FAD  CC                int3
00008FAE  CC                int3
00008FAF  00FC              add ah,bh
00008FB1  66667C66          o16 jl 0x901b
00008FB5  66FC              o16 cld
00008FB7  003C66            add [esi],bh
00008FBA  C0C0C0            rol al,byte 0xc0
00008FBD  663C00            o16 cmp al,0x0
00008FC0  F8                clc
00008FC1  6C                insb
00008FC2  6666666C          o16 insb
00008FC6  F8                clc
00008FC7  00FE              add dh,bh
00008FC9  626878            bound ebp,[eax+0x78]
00008FCC  6862FE00FE        push dword 0xfe00fe62
00008FD1  626878            bound ebp,[eax+0x78]
00008FD4  6860F0003C        push dword 0x3c00f060
00008FD9  66C0C0CE          o16 rol al,byte 0xce
00008FDD  663A00            o16 cmp al,[eax]
00008FE0  CC                int3
00008FE1  CC                int3
00008FE2  CC                int3
00008FE3  FC                cld
00008FE4  CC                int3
00008FE5  CC                int3
00008FE6  CC                int3
00008FE7  007830            add [eax+0x30],bh
00008FEA  3030              xor [eax],dh
00008FEC  3030              xor [eax],dh
00008FEE  7800              js 0x8ff0
00008FF0  1E                push ds
00008FF1  0C0C              or al,0xc
00008FF3  0CCC              or al,0xcc
00008FF5  CC                int3
00008FF6  7800              js 0x8ff8
00008FF8  E666              out 0x66,al
00008FFA  6C                insb
00008FFB  786C              js 0x9069
00008FFD  66E600            o16 out 0x0,al
00009000  F060              lock pusha
00009002  60                pusha
00009003  60                pusha
00009004  6266FE            bound esp,[esi-0x2]
00009007  00C6              add dh,al
00009009  EE                out dx,al
0000900A  FE                db 0xfe
0000900B  FE                db 0xfe
0000900C  D6                salc
0000900D  C6C600            mov dh,0x0
00009010  C6                db 0xc6
00009011  E6F6              out 0xf6,al
00009013  DECE              fmulp st6
00009015  C6C600            mov dh,0x0
00009018  386CC6C6          cmp [esi+eax*8-0x3a],ch
0000901C  C6                db 0xc6
0000901D  6C                insb
0000901E  3800              cmp [eax],al
00009020  FC                cld
00009021  66667C60          o16 jl 0x9085
00009025  60                pusha
00009026  F0007CC6C6        lock add [esi+eax*8-0x3a],bh
0000902B  C6                db 0xc6
0000902C  D6                salc
0000902D  7C0E              jl 0x903d
0000902F  00FC              add ah,bh
00009031  66667C6C          o16 jl 0x90a1
00009035  66E600            o16 out 0x0,al
00009038  7CC6              jl 0x9000
0000903A  E078              loopne 0x90b4
0000903C  0E                push cs
0000903D  C6                db 0xc6
0000903E  7C00              jl 0x9040
00009040  FC                cld
00009041  B430              mov ah,0x30
00009043  3030              xor [eax],dh
00009045  307800            xor [eax+0x0],bh
00009048  CC                int3
00009049  CC                int3
0000904A  CC                int3
0000904B  CC                int3
0000904C  CC                int3
0000904D  CC                int3
0000904E  FC                cld
0000904F  00CC              add ah,cl
00009051  CC                int3
00009052  CC                int3
00009053  CC                int3
00009054  CC                int3
00009055  7830              js 0x9087
00009057  00C6              add dh,al
00009059  C6C6C6            mov dh,0xc6
0000905C  D6                salc
0000905D  FE                db 0xfe
0000905E  6C                insb
0000905F  00C6              add dh,al
00009061  C6                db 0xc6
00009062  6C                insb
00009063  386CC6C6          cmp [esi+eax*8-0x3a],ch
00009067  00CC              add ah,cl
00009069  CC                int3
0000906A  CC                int3
0000906B  7830              js 0x909d
0000906D  307800            xor [eax+0x0],bh
00009070  FEC6              inc dh
00009072  8C18              mov [eax],ds
00009074  3266FE            xor ah,[esi-0x2]
00009077  007860            add [eax+0x60],bh
0000907A  60                pusha
0000907B  60                pusha
0000907C  60                pusha
0000907D  60                pusha
0000907E  7800              js 0x9080
00009080  C0603018          shl byte [eax+0x30],byte 0x18
00009084  0C06              or al,0x6
00009086  0200              add al,[eax]
00009088  7818              js 0x90a2
0000908A  1818              sbb [eax],bl
0000908C  1818              sbb [eax],bl
0000908E  7800              js 0x9090
00009090  1038              adc [eax],bh
00009092  6C                insb
00009093  C60000            mov byte [eax],0x0
00009096  0000              add [eax],al
00009098  0000              add [eax],al
0000909A  0000              add [eax],al
0000909C  0000              add [eax],al
0000909E  00FF              add bh,bh
000090A0  3030              xor [eax],dh
000090A2  1800              sbb [eax],al
000090A4  0000              add [eax],al
000090A6  0000              add [eax],al
000090A8  0000              add [eax],al
000090AA  780C              js 0x90b8
000090AC  7CCC              jl 0x907a
000090AE  7600              jna 0x90b0
000090B0  E060              loopne 0x9112
000090B2  60                pusha
000090B3  7C66              jl 0x911b
000090B5  66DC00            o16 fadd qword [eax]
000090B8  0000              add [eax],al
000090BA  78CC              js 0x9088
000090BC  C0CC78            ror ah,byte 0x78
000090BF  001C0C            add [esp+ecx],bl
000090C2  0C7C              or al,0x7c
000090C4  CC                int3
000090C5  CC                int3
000090C6  7600              jna 0x90c8
000090C8  0000              add [eax],al
000090CA  78CC              js 0x9098
000090CC  FC                cld
000090CD  C0780038          sar byte [eax+0x0],byte 0x38
000090D1  6C                insb
000090D2  64F060            fs lock pusha
000090D5  60                pusha
000090D6  F00000            lock add [eax],al
000090D9  0076CC            add [esi-0x34],dh
000090DC  CC                int3
000090DD  7C0C              jl 0x90eb
000090DF  F8                clc
000090E0  E060              loopne 0x9142
000090E2  6C                insb
000090E3  7666              jna 0x914b
000090E5  66E600            o16 out 0x0,al
000090E8  3000              xor [eax],al
000090EA  7030              jo 0x911c
000090EC  3030              xor [eax],dh
000090EE  7800              js 0x90f0
000090F0  0C00              or al,0x0
000090F2  1C0C              sbb al,0xc
000090F4  0CCC              or al,0xcc
000090F6  CC                int3
000090F7  78E0              js 0x90d9
000090F9  60                pusha
000090FA  666C              o16 insb
000090FC  786C              js 0x916a
000090FE  E600              out 0x0,al
00009100  7030              jo 0x9132
00009102  3030              xor [eax],dh
00009104  3030              xor [eax],dh
00009106  7800              js 0x9108
00009108  0000              add [eax],al
0000910A  CC                int3
0000910B  FE                db 0xfe
0000910C  FE                db 0xfe
0000910D  D6                salc
0000910E  D6                salc
0000910F  0000              add [eax],al
00009111  00B8CCCCCCCC      add [eax-0x33333334],bh
00009117  0000              add [eax],al
00009119  0078CC            add [eax-0x34],bh
0000911C  CC                int3
0000911D  CC                int3
0000911E  7800              js 0x9120
00009120  0000              add [eax],al
00009122  DC6666            fsub qword [esi+0x66]
00009125  7C60              jl 0x9187
00009127  F00000            lock add [eax],al
0000912A  76CC              jna 0x90f8
0000912C  CC                int3
0000912D  7C0C              jl 0x913b
0000912F  1E                push ds
00009130  0000              add [eax],al
00009132  DC7662            fdiv qword [esi+0x62]
00009135  60                pusha
00009136  F00000            lock add [eax],al
00009139  007CC070          add [eax+eax*8+0x70],bh
0000913D  1CF8              sbb al,0xf8
0000913F  0010              add [eax],dl
00009141  30FC              xor ah,bh
00009143  3030              xor [eax],dh
00009145  3418              xor al,0x18
00009147  0000              add [eax],al
00009149  00CC              add ah,cl
0000914B  CC                int3
0000914C  CC                int3
0000914D  CC                int3
0000914E  7600              jna 0x9150
00009150  0000              add [eax],al
00009152  CC                int3
00009153  CC                int3
00009154  CC                int3
00009155  7830              js 0x9187
00009157  0000              add [eax],al
00009159  00C6              add dh,al
0000915B  C6                db 0xc6
0000915C  D6                salc
0000915D  FE                db 0xfe
0000915E  6C                insb
0000915F  0000              add [eax],al
00009161  00C6              add dh,al
00009163  6C                insb
00009164  386CC600          cmp [esi+eax*8+0x0],ch
00009168  0000              add [eax],al
0000916A  CC                int3
0000916B  CC                int3
0000916C  CC                int3
0000916D  7C0C              jl 0x917b
0000916F  F8                clc
00009170  0000              add [eax],al
00009172  FC                cld
00009173  98                cwde
00009174  3064FC00          xor [esp+edi*8+0x0],ah
00009178  1C30              sbb al,0x30
0000917A  30E0              xor al,ah
0000917C  3030              xor [eax],dh
0000917E  1C00              sbb al,0x0
00009180  1818              sbb [eax],bl
00009182  1800              sbb [eax],al
00009184  1818              sbb [eax],bl
00009186  1800              sbb [eax],al
00009188  E030              loopne 0x91ba
0000918A  301C30            xor [eax+esi],bl
0000918D  30E0              xor al,ah
0000918F  0076DC            add [esi-0x24],dh
00009192  0000              add [eax],al
00009194  0000              add [eax],al
00009196  0000              add [eax],al
00009198  0010              add [eax],dl
0000919A  386CC6C6          cmp [esi+eax*8-0x3a],ch
0000919E  FE00              inc byte [eax]
000091A0  7CC6              jl 0x9168
000091A2  C0C67C            rol dh,byte 0x7c
000091A5  0C06              or al,0x6
000091A7  7C00              jl 0x91a9
000091A9  CC                int3
000091AA  00CC              add ah,cl
000091AC  CC                int3
000091AD  CC                int3
000091AE  7600              jna 0x91b0
000091B0  1C00              sbb al,0x0
000091B2  78CC              js 0x9180
000091B4  FC                cld
000091B5  C078007E          sar byte [eax+0x0],byte 0x7e
000091B9  813C063E663B00    cmp dword [esi+eax],0x3b663e
000091C0  CC                int3
000091C1  00780C            add [eax+0xc],bh
000091C4  7CCC              jl 0x9192
000091C6  7600              jna 0x91c8
000091C8  E000              loopne 0x91ca
000091CA  780C              js 0x91d8
000091CC  7CCC              jl 0x919a
000091CE  7600              jna 0x91d0
000091D0  3030              xor [eax],dh
000091D2  780C              js 0x91e0
000091D4  7CCC              jl 0x91a2
000091D6  7600              jna 0x91d8
000091D8  0000              add [eax],al
000091DA  7CC6              jl 0x91a2
000091DC  C0780C38          sar byte [eax+0xc],byte 0x38
000091E0  7E81              jng 0x9163
000091E2  3C66              cmp al,0x66
000091E4  7E60              jng 0x9246
000091E6  3C00              cmp al,0x0
000091E8  CC                int3
000091E9  0078CC            add [eax-0x34],bh
000091EC  FC                cld
000091ED  C07800E0          sar byte [eax+0x0],byte 0xe0
000091F1  0078CC            add [eax-0x34],bh
000091F4  FC                cld
000091F5  C07800CC          sar byte [eax+0x0],byte 0xcc
000091F9  007030            add [eax+0x30],dh
000091FC  3030              xor [eax],dh
000091FE  7800              js 0x9200
00009200  7C82              jl 0x9184
00009202  3818              cmp [eax],bl
00009204  1818              sbb [eax],bl
00009206  3C00              cmp al,0x0
00009208  E000              loopne 0x920a
0000920A  7030              jo 0x923c
0000920C  3030              xor [eax],dh
0000920E  7800              js 0x9210
00009210  C6                db 0xc6
00009211  107CC6FE          adc [esi+eax*8-0x2],bh
00009215  C6C600            mov dh,0x0
00009218  3030              xor [eax],dh
0000921A  0078CC            add [eax-0x34],bh
0000921D  FC                cld
0000921E  CC                int3
0000921F  001C00            add [eax+eax],bl
00009222  FC                cld
00009223  60                pusha
00009224  7860              js 0x9286
00009226  FC                cld
00009227  0000              add [eax],al
00009229  007F0C            add [edi+0xc],bh
0000922C  7FCC              jg 0x91fa
0000922E  7F00              jg 0x9230
00009230  3E6C              ds insb
00009232  CC                int3
00009233  FECC              dec ah
00009235  CC                int3
00009236  CE                into
00009237  007884            add [eax-0x7c],bh
0000923A  0078CC            add [eax-0x34],bh
0000923D  CC                int3
0000923E  7800              js 0x9240
00009240  00CC              add ah,cl
00009242  0078CC            add [eax-0x34],bh
00009245  CC                int3
00009246  7800              js 0x9248
00009248  00E0              add al,ah
0000924A  0078CC            add [eax-0x34],bh
0000924D  CC                int3
0000924E  7800              js 0x9250
00009250  7884              js 0x91d6
00009252  00CC              add ah,cl
00009254  CC                int3
00009255  CC                int3
00009256  7600              jna 0x9258
00009258  00E0              add al,ah
0000925A  00CC              add ah,cl
0000925C  CC                int3
0000925D  CC                int3
0000925E  7600              jna 0x9260
00009260  00CC              add ah,cl
00009262  00CC              add ah,cl
00009264  CC                int3
00009265  7C0C              jl 0x9273
00009267  F8                clc
00009268  C3                ret
00009269  183C66            sbb [esi],bh
0000926C  663C18            o16 cmp al,0x18
0000926F  00CC              add ah,cl
00009271  00CC              add ah,cl
00009273  CC                int3
00009274  CC                int3
00009275  CC                int3
00009276  7800              js 0x9278
00009278  1818              sbb [eax],bl
0000927A  7EC0              jng 0x923c
0000927C  C07E1818          sar byte [esi+0x18],byte 0x18
00009280  386C64F0          cmp [esp-0x10],ch
00009284  60                pusha
00009285  E6FC              out 0xfc,al
00009287  00CC              add ah,cl
00009289  CC                int3
0000928A  7830              js 0x92bc
0000928C  FC                cld
0000928D  30FC              xor ah,bh
0000928F  30F8              xor al,bh
00009291  CC                int3
00009292  CC                int3
00009293  FA                cli
00009294  C6                db 0xc6
00009295  CF                iret
00009296  C6C30E            mov bl,0xe
00009299  1B18              sbb ebx,[eax]
0000929B  3C18              cmp al,0x18
0000929D  18D8              sbb al,bl
0000929F  701C              jo 0x92bd
000092A1  00780C            add [eax+0xc],bh
000092A4  7CCC              jl 0x9272
000092A6  7600              jna 0x92a8
000092A8  3800              cmp [eax],al
000092AA  7030              jo 0x92dc
000092AC  3030              xor [eax],dh
000092AE  7800              js 0x92b0
000092B0  001C00            add [eax+eax],bl
000092B3  78CC              js 0x9281
000092B5  CC                int3
000092B6  7800              js 0x92b8
000092B8  001C00            add [eax+eax],bl
000092BB  CC                int3
000092BC  CC                int3
000092BD  CC                int3
000092BE  7600              jna 0x92c0
000092C0  00F8              add al,bh
000092C2  00B8CCCCCC00      add [eax+0xcccccc],bh
000092C8  FC                cld
000092C9  00CC              add ah,cl
000092CB  EC                in al,dx
000092CC  FC                cld
000092CD  DCCC              fmul to st4
000092CF  003C6C            add [esp+ebp*2],bh
000092D2  6C                insb
000092D3  3E007E00          add [ds:esi+0x0],bh
000092D7  0038              add [eax],bh
000092D9  6C                insb
000092DA  6C                insb
000092DB  3800              cmp [eax],al
000092DD  7C00              jl 0x92df
000092DF  0018              add [eax],bl
000092E1  0018              add [eax],bl
000092E3  1830              sbb [eax],dh
000092E5  663C00            o16 cmp al,0x0
000092E8  0000              add [eax],al
000092EA  00FC              add ah,bh
000092EC  C0C000            rol al,byte 0x0
000092EF  0000              add [eax],al
000092F1  0000              add [eax],al
000092F3  FC                cld
000092F4  0C0C              or al,0xc
000092F6  0000              add [eax],al
000092F8  C6                db 0xc6
000092F9  CC                int3
000092FA  D836              fdiv dword [esi]
000092FC  6BC284            imul eax,edx,byte -0x7c
000092FF  0F                db 0x0f
00009300  C3                ret
00009301  C6                db 0xc6
00009302  CC                int3
00009303  DB                db 0xdb
00009304  37                aaa
00009305  6D                insd
00009306  CF                iret
00009307  0318              add ebx,[eax]
00009309  0018              add [eax],bl
0000930B  183C3C            sbb [esp+edi],bh
0000930E  1800              sbb [eax],al
00009310  0033              add [ebx],dh
00009312  66CC              o16 int3
00009314  663300            xor ax,[eax]
00009317  0000              add [eax],al
00009319  CC                int3
0000931A  663366CC          xor sp,[esi-0x34]
0000931E  0000              add [eax],al
00009320  228822882288      and cl,[eax-0x77dd77de]
00009326  228855AA55AA      and cl,[eax-0x55aa55ab]
0000932C  55                push ebp
0000932D  AA                stosb
0000932E  55                push ebp
0000932F  AA                stosb
00009330  DBF6              fcomi st6
00009332  DB6FDB            fld tword [edi-0x25]
00009335  7ED7              jng 0x930e
00009337  ED                in eax,dx
00009338  1818              sbb [eax],bl
0000933A  1818              sbb [eax],bl
0000933C  1818              sbb [eax],bl
0000933E  1818              sbb [eax],bl
00009340  1818              sbb [eax],bl
00009342  1818              sbb [eax],bl
00009344  F8                clc
00009345  1818              sbb [eax],bl
00009347  1818              sbb [eax],bl
00009349  18F8              sbb al,bh
0000934B  18F8              sbb al,bh
0000934D  1818              sbb [eax],bl
0000934F  1836              sbb [esi],dh
00009351  363636F636        div byte [ss:esi]
00009356  36360000          add [ss:eax],al
0000935A  0000              add [eax],al
0000935C  FE                db 0xfe
0000935D  3636360000        add [ss:eax],al
00009362  F8                clc
00009363  18F8              sbb al,bh
00009365  1818              sbb [eax],bl
00009367  1836              sbb [esi],dh
00009369  36F606F6          test byte [ss:esi],0xf6
0000936D  3636363636363636  add [ss:eax],al
         -3636360000
0000937A  FE06              inc byte [esi]
0000937C  F636              div byte [esi]
0000937E  36363636F606FE    test byte [ss:esi],0xfe
00009385  0000              add [eax],al
00009387  0036              add [esi],dh
00009389  363636FE00        inc byte [ss:eax]
0000938E  0000              add [eax],al
00009390  1818              sbb [eax],bl
00009392  F8                clc
00009393  18F8              sbb al,bh
00009395  0000              add [eax],al
00009397  0000              add [eax],al
00009399  0000              add [eax],al
0000939B  00F8              add al,bh
0000939D  1818              sbb [eax],bl
0000939F  1818              sbb [eax],bl
000093A1  1818              sbb [eax],bl
000093A3  181F              sbb [edi],bl
000093A5  0000              add [eax],al
000093A7  0018              add [eax],bl
000093A9  1818              sbb [eax],bl
000093AB  18FF              sbb bh,bh
000093AD  0000              add [eax],al
000093AF  0000              add [eax],al
000093B1  0000              add [eax],al
000093B3  00FF              add bh,bh
000093B5  1818              sbb [eax],bl
000093B7  1818              sbb [eax],bl
000093B9  1818              sbb [eax],bl
000093BB  181F              sbb [edi],bl
000093BD  1818              sbb [eax],bl
000093BF  1800              sbb [eax],al
000093C1  0000              add [eax],al
000093C3  00FF              add bh,bh
000093C5  0000              add [eax],al
000093C7  0018              add [eax],bl
000093C9  1818              sbb [eax],bl
000093CB  18FF              sbb bh,bh
000093CD  1818              sbb [eax],bl
000093CF  1818              sbb [eax],bl
000093D1  181F              sbb [edi],bl
000093D3  181F              sbb [edi],bl
000093D5  1818              sbb [eax],bl
000093D7  1836              sbb [esi],dh
000093D9  36363637          ss aaa
000093DD  363636363637      ss aaa
000093E3  303F              xor [edi],bh
000093E5  0000              add [eax],al
000093E7  0000              add [eax],al
000093E9  003F              add [edi],bh
000093EB  3037              xor [edi],dh
000093ED  3636363636F700FF  test dword [ss:eax],0xff
         -000000
000093F8  0000              add [eax],al
000093FA  FF00              inc dword [eax]
000093FC  F736              div dword [esi]
000093FE  3636363637        ss aaa
00009403  3037              xor [edi],dh
00009405  3636360000        add [ss:eax],al
0000940A  FF00              inc dword [eax]
0000940C  FF00              inc dword [eax]
0000940E  0000              add [eax],al
00009410  3636F700F7363636  test dword [ss:eax],0x363636f7
00009418  1818              sbb [eax],bl
0000941A  FF00              inc dword [eax]
0000941C  FF00              inc dword [eax]
0000941E  0000              add [eax],al
00009420  36363636FF00      inc dword [ss:eax]
00009426  0000              add [eax],al
00009428  0000              add [eax],al
0000942A  FF00              inc dword [eax]
0000942C  FF18              call far [eax]
0000942E  1818              sbb [eax],bl
00009430  0000              add [eax],al
00009432  0000              add [eax],al
00009434  FF36              push dword [esi]
00009436  3636363636363F    ss aas
0000943D  0000              add [eax],al
0000943F  0018              add [eax],bl
00009441  181F              sbb [edi],bl
00009443  181F              sbb [edi],bl
00009445  0000              add [eax],al
00009447  0000              add [eax],al
00009449  001F              add [edi],bl
0000944B  181F              sbb [edi],bl
0000944D  1818              sbb [eax],bl
0000944F  1800              sbb [eax],al
00009451  0000              add [eax],al
00009453  003F              add [edi],bh
00009455  36363636363636FF  push dword [ss:esi]
         -36
0000945E  36361818          sbb [ss:eax],bl
00009462  FF18              call far [eax]
00009464  FF18              call far [eax]
00009466  1818              sbb [eax],bl
00009468  1818              sbb [eax],bl
0000946A  1818              sbb [eax],bl
0000946C  F8                clc
0000946D  0000              add [eax],al
0000946F  0000              add [eax],al
00009471  0000              add [eax],al
00009473  001F              add [edi],bl
00009475  1818              sbb [eax],bl
00009477  18FF              sbb bh,bh
00009479  FF                db 0xff
0000947A  FF                db 0xff
0000947B  FF                db 0xff
0000947C  FF                db 0xff
0000947D  FF                db 0xff
0000947E  FF                db 0xff
0000947F  FF00              inc dword [eax]
00009481  0000              add [eax],al
00009483  00FF              add bh,bh
00009485  FF                db 0xff
00009486  FF                db 0xff
00009487  FFF0              push eax
00009489  F0                lock
0000948A  F0                lock
0000948B  F0                lock
0000948C  F0                lock
0000948D  F0                lock
0000948E  F0                lock
0000948F  F0                lock
00009490  0F                db 0x0f
00009491  0F                db 0x0f
00009492  0F                db 0x0f
00009493  0F                db 0x0f
00009494  0F                db 0x0f
00009495  0F                db 0x0f
00009496  0F                db 0x0f
00009497  0FFF              ud0
00009499  FF                db 0xff
0000949A  FF                db 0xff
0000949B  FF00              inc dword [eax]
0000949D  0000              add [eax],al
0000949F  0000              add [eax],al
000094A1  0076DC            add [esi-0x24],dh
000094A4  C8DC7600          enter 0x76dc,0x0
000094A8  0078CC            add [eax-0x34],bh
000094AB  F8                clc
000094AC  CC                int3
000094AD  F8                clc
000094AE  C0C000            rol al,byte 0x0
000094B1  FC                cld
000094B2  CC                int3
000094B3  C0C0C0            rol al,byte 0xc0
000094B6  C00000            rol byte [eax],byte 0x0
000094B9  00FE              add dh,bh
000094BB  6C                insb
000094BC  6C                insb
000094BD  6C                insb
000094BE  6C                insb
000094BF  00FC              add ah,bh
000094C1  CC                int3
000094C2  60                pusha
000094C3  3060CC            xor [eax-0x34],ah
000094C6  FC                cld
000094C7  0000              add [eax],al
000094C9  007ED8            add [esi-0x28],bh
000094CC  D8D8              fcomp st0
000094CE  7000              jo 0x94d0
000094D0  006666            add [esi+0x66],ah
000094D3  66667C60          o16 jl 0x9537
000094D7  C00076            rol byte [eax],byte 0x76
000094DA  DC18              fcomp qword [eax]
000094DC  1818              sbb [eax],bl
000094DE  1800              sbb [eax],al
000094E0  FC                cld
000094E1  3078CC            xor [eax-0x34],bh
000094E4  CC                int3
000094E5  7830              js 0x9517
000094E7  FC                cld
000094E8  386CC6FE          cmp [esi+eax*8-0x2],ch
000094EC  C6                db 0xc6
000094ED  6C                insb
000094EE  3800              cmp [eax],al
000094F0  386CC6C6          cmp [esi+eax*8-0x3a],ch
000094F4  6C                insb
000094F5  6C                insb
000094F6  EE                out dx,al
000094F7  001C30            add [eax+esi],bl
000094FA  187CCCCC          sbb [esp+ecx*8-0x34],bh
000094FE  7800              js 0x9500
00009500  0000              add [eax],al
00009502  7EDB              jng 0x94df
00009504  DB7E00            fstp tword [esi+0x0]
00009507  0006              add [esi],al
00009509  0C7E              or al,0x7e
0000950B  DBDB              fcmovnu st3
0000950D  7E60              jng 0x956f
0000950F  C03860            sar byte [eax],byte 0x60
00009512  C0F8C0            sar al,byte 0xc0
00009515  60                pusha
00009516  3800              cmp [eax],al
00009518  78CC              js 0x94e6
0000951A  CC                int3
0000951B  CC                int3
0000951C  CC                int3
0000951D  CC                int3
0000951E  CC                int3
0000951F  0000              add [eax],al
00009521  7E00              jng 0x9523
00009523  7E00              jng 0x9525
00009525  7E00              jng 0x9527
00009527  0018              add [eax],bl
00009529  187E18            sbb [esi+0x18],bh
0000952C  1800              sbb [eax],al
0000952E  7E00              jng 0x9530
00009530  60                pusha
00009531  3018              xor [eax],bl
00009533  306000            xor [eax+0x0],ah
00009536  FC                cld
00009537  0018              add [eax],bl
00009539  306030            xor [eax+0x30],ah
0000953C  1800              sbb [eax],al
0000953E  FC                cld
0000953F  000E              add [esi],cl
00009541  1B1B              sbb ebx,[ebx]
00009543  1818              sbb [eax],bl
00009545  1818              sbb [eax],bl
00009547  1818              sbb [eax],bl
00009549  1818              sbb [eax],bl
0000954B  1818              sbb [eax],bl
0000954D  D8D8              fcomp st0
0000954F  7018              jo 0x9569
00009551  1800              sbb [eax],al
00009553  7E00              jng 0x9555
00009555  1818              sbb [eax],bl
00009557  0000              add [eax],al
00009559  76DC              jna 0x9537
0000955B  0076DC            add [esi-0x24],dh
0000955E  0000              add [eax],al
00009560  386C6C38          cmp [esp+ebp*2+0x38],ch
00009564  0000              add [eax],al
00009566  0000              add [eax],al
00009568  0000              add [eax],al
0000956A  0018              add [eax],bl
0000956C  1800              sbb [eax],al
0000956E  0000              add [eax],al
00009570  0000              add [eax],al
00009572  0000              add [eax],al
00009574  1800              sbb [eax],al
00009576  0000              add [eax],al
00009578  0F                db 0x0f
00009579  0C0C              or al,0xc
0000957B  0CEC              or al,0xec
0000957D  6C                insb
0000957E  3C1C              cmp al,0x1c
00009580  58                pop eax
00009581  6C                insb
00009582  6C                insb
00009583  6C                insb
00009584  6C                insb
00009585  0000              add [eax],al
00009587  007098            add [eax-0x68],dh
0000958A  3060F8            xor [eax-0x8],ah
0000958D  0000              add [eax],al
0000958F  0000              add [eax],al
00009591  003C3C            add [esp+edi],bh
00009594  3C3C              cmp al,0x3c
00009596  0000              add [eax],al
00009598  0000              add [eax],al
0000959A  0000              add [eax],al
0000959C  0000              add [eax],al
0000959E  0000              add [eax],al
000095A0  0000              add [eax],al
000095A2  0000              add [eax],al
000095A4  0000              add [eax],al
000095A6  0000              add [eax],al
000095A8  0000              add [eax],al
000095AA  0000              add [eax],al
000095AC  0000              add [eax],al
000095AE  0000              add [eax],al
000095B0  0000              add [eax],al
000095B2  7E81              jng 0x9535
000095B4  A5                movsd
000095B5  8181BD9981817E00  add dword [ecx-0x7e7e6643],0x7e
         -0000
000095BF  0000              add [eax],al
000095C1  007EFF            add [esi-0x1],bh
000095C4  DB                db 0xdb
000095C5  FF                db 0xff
000095C6  FFC3              inc ebx
000095C8  E7FF              out 0xff,eax
000095CA  FF                db 0xff
000095CB  7E00              jng 0x95cd
000095CD  0000              add [eax],al
000095CF  0000              add [eax],al
000095D1  0000              add [eax],al
000095D3  006CFEFE          add [esi+edi*8-0x2],ch
000095D7  FE                db 0xfe
000095D8  FE                db 0xfe
000095D9  7C38              jl 0x9613
000095DB  1000              adc [eax],al
000095DD  0000              add [eax],al
000095DF  0000              add [eax],al
000095E1  0000              add [eax],al
000095E3  0010              add [eax],dl
000095E5  387CFE7C          cmp [esi+edi*8+0x7c],bh
000095E9  3810              cmp [eax],dl
000095EB  0000              add [eax],al
000095ED  0000              add [eax],al
000095EF  0000              add [eax],al
000095F1  0000              add [eax],al
000095F3  183C3C            sbb [esp+edi],bh
000095F6  E7E7              out 0xe7,eax
000095F8  E799              out 0x99,eax
000095FA  183C00            sbb [eax+eax],bh
000095FD  0000              add [eax],al
000095FF  0000              add [eax],al
00009601  0000              add [eax],al
00009603  183C7E            sbb [esi+edi*2],bh
00009606  FF                db 0xff
00009607  FF                db 0xff
00009608  7E18              jng 0x9622
0000960A  183C00            sbb [eax+eax],bh
0000960D  0000              add [eax],al
0000960F  0000              add [eax],al
00009611  0000              add [eax],al
00009613  0000              add [eax],al
00009615  0018              add [eax],bl
00009617  3C3C              cmp al,0x3c
00009619  1800              sbb [eax],al
0000961B  0000              add [eax],al
0000961D  0000              add [eax],al
0000961F  00FF              add bh,bh
00009621  FF                db 0xff
00009622  FF                db 0xff
00009623  FF                db 0xff
00009624  FF                db 0xff
00009625  FFE7              jmp edi
00009627  C3                ret
00009628  C3                ret
00009629  E7FF              out 0xff,eax
0000962B  FF                db 0xff
0000962C  FF                db 0xff
0000962D  FF                db 0xff
0000962E  FF                db 0xff
0000962F  FF00              inc dword [eax]
00009631  0000              add [eax],al
00009633  0000              add [eax],al
00009635  3C66              cmp al,0x66
00009637  42                inc edx
00009638  42                inc edx
00009639  663C00            o16 cmp al,0x0
0000963C  0000              add [eax],al
0000963E  0000              add [eax],al
00009640  FF                db 0xff
00009641  FF                db 0xff
00009642  FF                db 0xff
00009643  FF                db 0xff
00009644  FFC3              inc ebx
00009646  99                cdq
00009647  BDBD99C3FF        mov ebp,0xffc399bd
0000964C  FF                db 0xff
0000964D  FF                db 0xff
0000964E  FF                db 0xff
0000964F  FF00              inc dword [eax]
00009651  001E              add [esi],bl
00009653  0E                push cs
00009654  1A32              sbb dh,[edx]
00009656  78CC              js 0x9624
00009658  CC                int3
00009659  CC                int3
0000965A  CC                int3
0000965B  7800              js 0x965d
0000965D  0000              add [eax],al
0000965F  0000              add [eax],al
00009661  003C66            add [esi],bh
00009664  6666663C18        o16 cmp al,0x18
00009669  7E18              jng 0x9683
0000966B  1800              sbb [eax],al
0000966D  0000              add [eax],al
0000966F  0000              add [eax],al
00009671  003F              add [edi],bh
00009673  333F              xor edi,[edi]
00009675  3030              xor [eax],dh
00009677  3030              xor [eax],dh
00009679  70F0              jo 0x966b
0000967B  E000              loopne 0x967d
0000967D  0000              add [eax],al
0000967F  0000              add [eax],al
00009681  007F63            add [edi+0x63],bh
00009684  7F63              jg 0x96e9
00009686  636363            arpl [ebx+0x63],sp
00009689  67E7E6            out 0xe6,eax
0000968C  C00000            rol byte [eax],byte 0x0
0000968F  0000              add [eax],al
00009691  0000              add [eax],al
00009693  1818              sbb [eax],bl
00009695  DB3CE7            fstp tword [edi]
00009698  3CDB              cmp al,0xdb
0000969A  1818              sbb [eax],bl
0000969C  0000              add [eax],al
0000969E  0000              add [eax],al
000096A0  0080C0E0F0F8      add [eax-0x70f1f40],al
000096A6  FE                db 0xfe
000096A7  F8                clc
000096A8  F0E0C0            lock loopne 0x966b
000096AB  800000            add byte [eax],0x0
000096AE  0000              add [eax],al
000096B0  0002              add [edx],al
000096B2  06                push es
000096B3  0E                push cs
000096B4  1E                push ds
000096B5  3E                ds
000096B6  FE                db 0xfe
000096B7  3E1E              ds push ds
000096B9  0E                push cs
000096BA  06                push es
000096BB  0200              add al,[eax]
000096BD  0000              add [eax],al
000096BF  0000              add [eax],al
000096C1  0018              add [eax],bl
000096C3  3C7E              cmp al,0x7e
000096C5  1818              sbb [eax],bl
000096C7  1818              sbb [eax],bl
000096C9  7E3C              jng 0x9707
000096CB  1800              sbb [eax],al
000096CD  0000              add [eax],al
000096CF  0000              add [eax],al
000096D1  006666            add [esi+0x66],ah
000096D4  6666666666006666  o16 add [esi+0x66],ah
000096DC  0000              add [eax],al
000096DE  0000              add [eax],al
000096E0  0000              add [eax],al
000096E2  7FDB              jg 0x96bf
000096E4  DBDB              fcmovnu st3
000096E6  7B1B              jpo 0x9703
000096E8  1B1B              sbb ebx,[ebx]
000096EA  1B1B              sbb ebx,[ebx]
000096EC  0000              add [eax],al
000096EE  0000              add [eax],al
000096F0  007CC660          add [esi+eax*8+0x60],bh
000096F4  386CC6C6          cmp [esi+eax*8-0x3a],ch
000096F8  6C                insb
000096F9  380CC6            cmp [esi+eax*8],cl
000096FC  7C00              jl 0x96fe
000096FE  0000              add [eax],al
00009700  0000              add [eax],al
00009702  0000              add [eax],al
00009704  0000              add [eax],al
00009706  0000              add [eax],al
00009708  FE                db 0xfe
00009709  FE                db 0xfe
0000970A  FE                db 0xfe
0000970B  FE00              inc byte [eax]
0000970D  0000              add [eax],al
0000970F  0000              add [eax],al
00009711  0018              add [eax],bl
00009713  3C7E              cmp al,0x7e
00009715  1818              sbb [eax],bl
00009717  1818              sbb [eax],bl
00009719  7E3C              jng 0x9757
0000971B  187E00            sbb [esi+0x0],bh
0000971E  0000              add [eax],al
00009720  0000              add [eax],al
00009722  183C7E            sbb [esi+edi*2],bh
00009725  1818              sbb [eax],bl
00009727  1818              sbb [eax],bl
00009729  1818              sbb [eax],bl
0000972B  1800              sbb [eax],al
0000972D  0000              add [eax],al
0000972F  0000              add [eax],al
00009731  0018              add [eax],bl
00009733  1818              sbb [eax],bl
00009735  1818              sbb [eax],bl
00009737  1818              sbb [eax],bl
00009739  7E3C              jng 0x9777
0000973B  1800              sbb [eax],al
0000973D  0000              add [eax],al
0000973F  0000              add [eax],al
00009741  0000              add [eax],al
00009743  0000              add [eax],al
00009745  180CFE            sbb [esi+edi*8],cl
00009748  0C18              or al,0x18
0000974A  0000              add [eax],al
0000974C  0000              add [eax],al
0000974E  0000              add [eax],al
00009750  0000              add [eax],al
00009752  0000              add [eax],al
00009754  0030              add [eax],dh
00009756  60                pusha
00009757  FE                db 0xfe
00009758  60                pusha
00009759  3000              xor [eax],al
0000975B  0000              add [eax],al
0000975D  0000              add [eax],al
0000975F  0000              add [eax],al
00009761  0000              add [eax],al
00009763  0000              add [eax],al
00009765  C0C0C0            rol al,byte 0xc0
00009768  C0FE00            sar dh,byte 0x0
0000976B  0000              add [eax],al
0000976D  0000              add [eax],al
0000976F  0000              add [eax],al
00009771  0000              add [eax],al
00009773  0000              add [eax],al
00009775  286CFE6C          sub [esi+edi*8+0x6c],ch
00009779  2800              sub [eax],al
0000977B  0000              add [eax],al
0000977D  0000              add [eax],al
0000977F  0000              add [eax],al
00009781  0000              add [eax],al
00009783  0010              add [eax],dl
00009785  3838              cmp [eax],bh
00009787  7C7C              jl 0x9805
00009789  FE                db 0xfe
0000978A  FE00              inc byte [eax]
0000978C  0000              add [eax],al
0000978E  0000              add [eax],al
00009790  0000              add [eax],al
00009792  0000              add [eax],al
00009794  FE                db 0xfe
00009795  FE                db 0xfe
00009796  7C7C              jl 0x9814
00009798  3838              cmp [eax],bh
0000979A  1000              adc [eax],al
0000979C  0000              add [eax],al
0000979E  0000              add [eax],al
000097A0  0000              add [eax],al
000097A2  0000              add [eax],al
000097A4  0000              add [eax],al
000097A6  0000              add [eax],al
000097A8  0000              add [eax],al
000097AA  0000              add [eax],al
000097AC  0000              add [eax],al
000097AE  0000              add [eax],al
000097B0  0000              add [eax],al
000097B2  183C3C            sbb [esp+edi],bh
000097B5  3C18              cmp al,0x18
000097B7  1818              sbb [eax],bl
000097B9  0018              add [eax],bl
000097BB  1800              sbb [eax],al
000097BD  0000              add [eax],al
000097BF  0000              add [eax],al
000097C1  6666662400        o16 and al,0x0
000097C6  0000              add [eax],al
000097C8  0000              add [eax],al
000097CA  0000              add [eax],al
000097CC  0000              add [eax],al
000097CE  0000              add [eax],al
000097D0  0000              add [eax],al
000097D2  006C6CFE          add [esp+ebp*2-0x2],ch
000097D6  6C                insb
000097D7  6C                insb
000097D8  6C                insb
000097D9  FE                db 0xfe
000097DA  6C                insb
000097DB  6C                insb
000097DC  0000              add [eax],al
000097DE  0000              add [eax],al
000097E0  1818              sbb [eax],bl
000097E2  7CC6              jl 0x97aa
000097E4  C2C07C            ret 0x7cc0
000097E7  06                push es
000097E8  86C6              xchg al,dh
000097EA  7C18              jl 0x9804
000097EC  1800              sbb [eax],al
000097EE  0000              add [eax],al
000097F0  0000              add [eax],al
000097F2  0000              add [eax],al
000097F4  C2C60C            ret 0xcc6
000097F7  1830              sbb [eax],dh
000097F9  60                pusha
000097FA  C6860000000000    mov byte [esi+0x0],0x0
00009801  0038              add [eax],bh
00009803  6C                insb
00009804  6C                insb
00009805  3876DC            cmp [esi-0x24],dh
00009808  CC                int3
00009809  CC                int3
0000980A  CC                int3
0000980B  7600              jna 0x980d
0000980D  0000              add [eax],al
0000980F  0000              add [eax],al
00009811  3030              xor [eax],dh
00009813  306000            xor [eax+0x0],ah
00009816  0000              add [eax],al
00009818  0000              add [eax],al
0000981A  0000              add [eax],al
0000981C  0000              add [eax],al
0000981E  0000              add [eax],al
00009820  0000              add [eax],al
00009822  0C18              or al,0x18
00009824  3030              xor [eax],dh
00009826  3030              xor [eax],dh
00009828  3030              xor [eax],dh
0000982A  180C00            sbb [eax+eax],cl
0000982D  0000              add [eax],al
0000982F  0000              add [eax],al
00009831  0030              add [eax],dh
00009833  180C0C            sbb [esp+ecx],cl
00009836  0C0C              or al,0xc
00009838  0C0C              or al,0xc
0000983A  1830              sbb [eax],dh
0000983C  0000              add [eax],al
0000983E  0000              add [eax],al
00009840  0000              add [eax],al
00009842  0000              add [eax],al
00009844  00663C            add [esi+0x3c],ah
00009847  FF                db 0xff
00009848  3C66              cmp al,0x66
0000984A  0000              add [eax],al
0000984C  0000              add [eax],al
0000984E  0000              add [eax],al
00009850  0000              add [eax],al
00009852  0000              add [eax],al
00009854  0018              add [eax],bl
00009856  187E18            sbb [esi+0x18],bh
00009859  1800              sbb [eax],al
0000985B  0000              add [eax],al
0000985D  0000              add [eax],al
0000985F  0000              add [eax],al
00009861  0000              add [eax],al
00009863  0000              add [eax],al
00009865  0000              add [eax],al
00009867  0000              add [eax],al
00009869  1818              sbb [eax],bl
0000986B  1830              sbb [eax],dh
0000986D  0000              add [eax],al
0000986F  0000              add [eax],al
00009871  0000              add [eax],al
00009873  0000              add [eax],al
00009875  0000              add [eax],al
00009877  FE00              inc byte [eax]
00009879  0000              add [eax],al
0000987B  0000              add [eax],al
0000987D  0000              add [eax],al
0000987F  0000              add [eax],al
00009881  0000              add [eax],al
00009883  0000              add [eax],al
00009885  0000              add [eax],al
00009887  0000              add [eax],al
00009889  0018              add [eax],bl
0000988B  1800              sbb [eax],al
0000988D  0000              add [eax],al
0000988F  0000              add [eax],al
00009891  0000              add [eax],al
00009893  0002              add [edx],al
00009895  06                push es
00009896  0C18              or al,0x18
00009898  3060C0            xor [eax-0x40],ah
0000989B  800000            add byte [eax],0x0
0000989E  0000              add [eax],al
000098A0  0000              add [eax],al
000098A2  7CC6              jl 0x986a
000098A4  C6                db 0xc6
000098A5  CE                into
000098A6  D6                salc
000098A7  D6                salc
000098A8  E6C6              out 0xc6,al
000098AA  C6                db 0xc6
000098AB  7C00              jl 0x98ad
000098AD  0000              add [eax],al
000098AF  0000              add [eax],al
000098B1  0018              add [eax],bl
000098B3  387818            cmp [eax+0x18],bh
000098B6  1818              sbb [eax],bl
000098B8  1818              sbb [eax],bl
000098BA  187E00            sbb [esi+0x0],bh
000098BD  0000              add [eax],al
000098BF  0000              add [eax],al
000098C1  007CC606          add [esi+eax*8+0x6],bh
000098C5  0C18              or al,0x18
000098C7  3060C0            xor [eax-0x40],ah
000098CA  C6                db 0xc6
000098CB  FE00              inc byte [eax]
000098CD  0000              add [eax],al
000098CF  0000              add [eax],al
000098D1  007CC606          add [esi+eax*8+0x6],bh
000098D5  06                push es
000098D6  3C06              cmp al,0x6
000098D8  06                push es
000098D9  06                push es
000098DA  C6                db 0xc6
000098DB  7C00              jl 0x98dd
000098DD  0000              add [eax],al
000098DF  0000              add [eax],al
000098E1  000C1C            add [esp+ebx],cl
000098E4  3C6C              cmp al,0x6c
000098E6  CC                int3
000098E7  FE0C0C            dec byte [esp+ecx]
000098EA  0C1E              or al,0x1e
000098EC  0000              add [eax],al
000098EE  0000              add [eax],al
000098F0  0000              add [eax],al
000098F2  FEC0              inc al
000098F4  C0C0FC            rol al,byte 0xfc
000098F7  0E                push cs
000098F8  06                push es
000098F9  06                push es
000098FA  C6                db 0xc6
000098FB  7C00              jl 0x98fd
000098FD  0000              add [eax],al
000098FF  0000              add [eax],al
00009901  0038              add [eax],bh
00009903  60                pusha
00009904  C0C0FC            rol al,byte 0xfc
00009907  C6C6C6            mov dh,0xc6
0000990A  C6                db 0xc6
0000990B  7C00              jl 0x990d
0000990D  0000              add [eax],al
0000990F  0000              add [eax],al
00009911  00FE              add dh,bh
00009913  C60606            mov byte [esi],0x6
00009916  0C18              or al,0x18
00009918  3030              xor [eax],dh
0000991A  3030              xor [eax],dh
0000991C  0000              add [eax],al
0000991E  0000              add [eax],al
00009920  0000              add [eax],al
00009922  7CC6              jl 0x98ea
00009924  C6C67C            mov dh,0x7c
00009927  C6C6C6            mov dh,0xc6
0000992A  C6                db 0xc6
0000992B  7C00              jl 0x992d
0000992D  0000              add [eax],al
0000992F  0000              add [eax],al
00009931  007CC6C6          add [esi+eax*8-0x3a],bh
00009935  C6                db 0xc6
00009936  7E06              jng 0x993e
00009938  06                push es
00009939  06                push es
0000993A  0C78              or al,0x78
0000993C  0000              add [eax],al
0000993E  0000              add [eax],al
00009940  0000              add [eax],al
00009942  0000              add [eax],al
00009944  1818              sbb [eax],bl
00009946  0000              add [eax],al
00009948  0018              add [eax],bl
0000994A  1800              sbb [eax],al
0000994C  0000              add [eax],al
0000994E  0000              add [eax],al
00009950  0000              add [eax],al
00009952  0000              add [eax],al
00009954  1818              sbb [eax],bl
00009956  0000              add [eax],al
00009958  0018              add [eax],bl
0000995A  1830              sbb [eax],dh
0000995C  0000              add [eax],al
0000995E  0000              add [eax],al
00009960  0000              add [eax],al
00009962  0006              add [esi],al
00009964  0C18              or al,0x18
00009966  306030            xor [eax+0x30],ah
00009969  180C06            sbb [esi+eax],cl
0000996C  0000              add [eax],al
0000996E  0000              add [eax],al
00009970  0000              add [eax],al
00009972  0000              add [eax],al
00009974  0000              add [eax],al
00009976  FE00              inc byte [eax]
00009978  00FE              add dh,bh
0000997A  0000              add [eax],al
0000997C  0000              add [eax],al
0000997E  0000              add [eax],al
00009980  0000              add [eax],al
00009982  006030            add [eax+0x30],ah
00009985  180C06            sbb [esi+eax],cl
00009988  0C18              or al,0x18
0000998A  306000            xor [eax+0x0],ah
0000998D  0000              add [eax],al
0000998F  0000              add [eax],al
00009991  007CC6C6          add [esi+eax*8-0x3a],bh
00009995  0C18              or al,0x18
00009997  1818              sbb [eax],bl
00009999  0018              add [eax],bl
0000999B  1800              sbb [eax],al
0000999D  0000              add [eax],al
0000999F  0000              add [eax],al
000099A1  0000              add [eax],al
000099A3  7CC6              jl 0x996b
000099A5  C6                db 0xc6
000099A6  DE                db 0xde
000099A7  DE                db 0xde
000099A8  DE                db 0xde
000099A9  DCC0              fadd to st0
000099AB  7C00              jl 0x99ad
000099AD  0000              add [eax],al
000099AF  0000              add [eax],al
000099B1  0010              add [eax],dl
000099B3  386CC6C6          cmp [esi+eax*8-0x3a],ch
000099B7  FEC6              inc dh
000099B9  C6C6C6            mov dh,0xc6
000099BC  0000              add [eax],al
000099BE  0000              add [eax],al
000099C0  0000              add [eax],al
000099C2  FC                cld
000099C3  6666667C66        o16 jl 0x9a2e
000099C8  666666FC          o16 cld
000099CC  0000              add [eax],al
000099CE  0000              add [eax],al
000099D0  0000              add [eax],al
000099D2  3C66              cmp al,0x66
000099D4  C2C0C0            ret 0xc0c0
000099D7  C0C0C2            rol al,byte 0xc2
000099DA  663C00            o16 cmp al,0x0
000099DD  0000              add [eax],al
000099DF  0000              add [eax],al
000099E1  00F8              add al,bh
000099E3  6C                insb
000099E4  6666666666666C    o16 insb
000099EB  F8                clc
000099EC  0000              add [eax],al
000099EE  0000              add [eax],al
000099F0  0000              add [eax],al
000099F2  FE                db 0xfe
000099F3  66626878          bound bp,[eax+0x78]
000099F7  68606266FE        push dword 0xfe666260
000099FC  0000              add [eax],al
000099FE  0000              add [eax],al
00009A00  0000              add [eax],al
00009A02  FE                db 0xfe
00009A03  66626878          bound bp,[eax+0x78]
00009A07  68606060F0        push dword 0xf0606060
00009A0C  0000              add [eax],al
00009A0E  0000              add [eax],al
00009A10  0000              add [eax],al
00009A12  3C66              cmp al,0x66
00009A14  C2C0C0            ret 0xc0c0
00009A17  DEC6              faddp st6
00009A19  C6                db 0xc6
00009A1A  663A00            o16 cmp al,[eax]
00009A1D  0000              add [eax],al
00009A1F  0000              add [eax],al
00009A21  00C6              add dh,al
00009A23  C6C6C6            mov dh,0xc6
00009A26  FEC6              inc dh
00009A28  C6C6C6            mov dh,0xc6
00009A2B  C60000            mov byte [eax],0x0
00009A2E  0000              add [eax],al
00009A30  0000              add [eax],al
00009A32  3C18              cmp al,0x18
00009A34  1818              sbb [eax],bl
00009A36  1818              sbb [eax],bl
00009A38  1818              sbb [eax],bl
00009A3A  183C00            sbb [eax+eax],bh
00009A3D  0000              add [eax],al
00009A3F  0000              add [eax],al
00009A41  001E              add [esi],bl
00009A43  0C0C              or al,0xc
00009A45  0C0C              or al,0xc
00009A47  0CCC              or al,0xcc
00009A49  CC                int3
00009A4A  CC                int3
00009A4B  7800              js 0x9a4d
00009A4D  0000              add [eax],al
00009A4F  0000              add [eax],al
00009A51  00E6              add dh,ah
00009A53  666C              o16 insb
00009A55  6C                insb
00009A56  7878              js 0x9ad0
00009A58  6C                insb
00009A59  6666E600          o16 out 0x0,al
00009A5D  0000              add [eax],al
00009A5F  0000              add [eax],al
00009A61  00F0              add al,dh
00009A63  60                pusha
00009A64  60                pusha
00009A65  60                pusha
00009A66  60                pusha
00009A67  60                pusha
00009A68  60                pusha
00009A69  6266FE            bound esp,[esi-0x2]
00009A6C  0000              add [eax],al
00009A6E  0000              add [eax],al
00009A70  0000              add [eax],al
00009A72  C6                db 0xc6
00009A73  EE                out dx,al
00009A74  FE                db 0xfe
00009A75  FE                db 0xfe
00009A76  D6                salc
00009A77  C6C6C6            mov dh,0xc6
00009A7A  C6C600            mov dh,0x0
00009A7D  0000              add [eax],al
00009A7F  0000              add [eax],al
00009A81  00C6              add dh,al
00009A83  E6F6              out 0xf6,al
00009A85  FE                db 0xfe
00009A86  DECE              fmulp st6
00009A88  C6C6C6            mov dh,0xc6
00009A8B  C60000            mov byte [eax],0x0
00009A8E  0000              add [eax],al
00009A90  0000              add [eax],al
00009A92  386CC6C6          cmp [esi+eax*8-0x3a],ch
00009A96  C6C6C6            mov dh,0xc6
00009A99  C6                db 0xc6
00009A9A  6C                insb
00009A9B  3800              cmp [eax],al
00009A9D  0000              add [eax],al
00009A9F  0000              add [eax],al
00009AA1  00FC              add ah,bh
00009AA3  6666667C60        o16 jl 0x9b08
00009AA8  60                pusha
00009AA9  60                pusha
00009AAA  60                pusha
00009AAB  F00000            lock add [eax],al
00009AAE  0000              add [eax],al
00009AB0  0000              add [eax],al
00009AB2  7CC6              jl 0x9a7a
00009AB4  C6C6C6            mov dh,0xc6
00009AB7  C6C6D6            mov dh,0xd6
00009ABA  DE7C0C0E          fidivr word [esp+ecx+0xe]
00009ABE  0000              add [eax],al
00009AC0  0000              add [eax],al
00009AC2  FC                cld
00009AC3  6666667C6C        o16 jl 0x9b34
00009AC8  666666E600        o16 out 0x0,al
00009ACD  0000              add [eax],al
00009ACF  0000              add [eax],al
00009AD1  007CC6C6          add [esi+eax*8-0x3a],bh
00009AD5  60                pusha
00009AD6  380C06            cmp [esi+eax],cl
00009AD9  C6C67C            mov dh,0x7c
00009ADC  0000              add [eax],al
00009ADE  0000              add [eax],al
00009AE0  0000              add [eax],al
00009AE2  7E7E              jng 0x9b62
00009AE4  5A                pop edx
00009AE5  1818              sbb [eax],bl
00009AE7  1818              sbb [eax],bl
00009AE9  1818              sbb [eax],bl
00009AEB  3C00              cmp al,0x0
00009AED  0000              add [eax],al
00009AEF  0000              add [eax],al
00009AF1  00C6              add dh,al
00009AF3  C6C6C6            mov dh,0xc6
00009AF6  C6C6C6            mov dh,0xc6
00009AF9  C6C67C            mov dh,0x7c
00009AFC  0000              add [eax],al
00009AFE  0000              add [eax],al
00009B00  0000              add [eax],al
00009B02  C6C6C6            mov dh,0xc6
00009B05  C6C6C6            mov dh,0xc6
00009B08  C6                db 0xc6
00009B09  6C                insb
00009B0A  3810              cmp [eax],dl
00009B0C  0000              add [eax],al
00009B0E  0000              add [eax],al
00009B10  0000              add [eax],al
00009B12  C6C6C6            mov dh,0xc6
00009B15  C6C6D6            mov dh,0xd6
00009B18  D6                salc
00009B19  FE                db 0xfe
00009B1A  6C                insb
00009B1B  6C                insb
00009B1C  0000              add [eax],al
00009B1E  0000              add [eax],al
00009B20  0000              add [eax],al
00009B22  C6C66C            mov dh,0x6c
00009B25  6C                insb
00009B26  3838              cmp [eax],bh
00009B28  6C                insb
00009B29  6C                insb
00009B2A  C6C600            mov dh,0x0
00009B2D  0000              add [eax],al
00009B2F  0000              add [eax],al
00009B31  006666            add [esi+0x66],ah
00009B34  66663C18          o16 cmp al,0x18
00009B38  1818              sbb [eax],bl
00009B3A  183C00            sbb [eax+eax],bh
00009B3D  0000              add [eax],al
00009B3F  0000              add [eax],al
00009B41  00FE              add dh,bh
00009B43  C6860C183060C2    mov byte [esi+0x6030180c],0xc2
00009B4A  C6                db 0xc6
00009B4B  FE00              inc byte [eax]
00009B4D  0000              add [eax],al
00009B4F  0000              add [eax],al
00009B51  003C30            add [eax+esi],bh
00009B54  3030              xor [eax],dh
00009B56  3030              xor [eax],dh
00009B58  3030              xor [eax],dh
00009B5A  303C00            xor [eax+eax],bh
00009B5D  0000              add [eax],al
00009B5F  0000              add [eax],al
00009B61  0000              add [eax],al
00009B63  80C0E0            add al,0xe0
00009B66  7038              jo 0x9ba0
00009B68  1C0E              sbb al,0xe
00009B6A  06                push es
00009B6B  0200              add al,[eax]
00009B6D  0000              add [eax],al
00009B6F  0000              add [eax],al
00009B71  003C0C            add [esp+ecx],bh
00009B74  0C0C              or al,0xc
00009B76  0C0C              or al,0xc
00009B78  0C0C              or al,0xc
00009B7A  0C3C              or al,0x3c
00009B7C  0000              add [eax],al
00009B7E  0000              add [eax],al
00009B80  1038              adc [eax],bh
00009B82  6C                insb
00009B83  C60000            mov byte [eax],0x0
00009B86  0000              add [eax],al
00009B88  0000              add [eax],al
00009B8A  0000              add [eax],al
00009B8C  0000              add [eax],al
00009B8E  0000              add [eax],al
00009B90  0000              add [eax],al
00009B92  0000              add [eax],al
00009B94  0000              add [eax],al
00009B96  0000              add [eax],al
00009B98  0000              add [eax],al
00009B9A  0000              add [eax],al
00009B9C  00FF              add bh,bh
00009B9E  0000              add [eax],al
00009BA0  3030              xor [eax],dh
00009BA2  1800              sbb [eax],al
00009BA4  0000              add [eax],al
00009BA6  0000              add [eax],al
00009BA8  0000              add [eax],al
00009BAA  0000              add [eax],al
00009BAC  0000              add [eax],al
00009BAE  0000              add [eax],al
00009BB0  0000              add [eax],al
00009BB2  0000              add [eax],al
00009BB4  00780C            add [eax+0xc],bh
00009BB7  7CCC              jl 0x9b85
00009BB9  CC                int3
00009BBA  CC                int3
00009BBB  7600              jna 0x9bbd
00009BBD  0000              add [eax],al
00009BBF  0000              add [eax],al
00009BC1  00E0              add al,ah
00009BC3  60                pusha
00009BC4  60                pusha
00009BC5  786C              js 0x9c33
00009BC7  66666666DC00      o16 fadd qword [eax]
00009BCD  0000              add [eax],al
00009BCF  0000              add [eax],al
00009BD1  0000              add [eax],al
00009BD3  0000              add [eax],al
00009BD5  7CC6              jl 0x9b9d
00009BD7  C0C0C0            rol al,byte 0xc0
00009BDA  C6                db 0xc6
00009BDB  7C00              jl 0x9bdd
00009BDD  0000              add [eax],al
00009BDF  0000              add [eax],al
00009BE1  001C0C            add [esp+ecx],bl
00009BE4  0C3C              or al,0x3c
00009BE6  6C                insb
00009BE7  CC                int3
00009BE8  CC                int3
00009BE9  CC                int3
00009BEA  CC                int3
00009BEB  7600              jna 0x9bed
00009BED  0000              add [eax],al
00009BEF  0000              add [eax],al
00009BF1  0000              add [eax],al
00009BF3  0000              add [eax],al
00009BF5  7CC6              jl 0x9bbd
00009BF7  FEC0              inc al
00009BF9  C0C67C            rol dh,byte 0x7c
00009BFC  0000              add [eax],al
00009BFE  0000              add [eax],al
00009C00  0000              add [eax],al
00009C02  386C6460          cmp [esp+0x60],ch
00009C06  F060              lock pusha
00009C08  60                pusha
00009C09  60                pusha
00009C0A  60                pusha
00009C0B  F00000            lock add [eax],al
00009C0E  0000              add [eax],al
00009C10  0000              add [eax],al
00009C12  0000              add [eax],al
00009C14  0076CC            add [esi-0x34],dh
00009C17  CC                int3
00009C18  CC                int3
00009C19  CC                int3
00009C1A  CC                int3
00009C1B  7C0C              jl 0x9c29
00009C1D  CC                int3
00009C1E  7800              js 0x9c20
00009C20  0000              add [eax],al
00009C22  E060              loopne 0x9c84
00009C24  60                pusha
00009C25  6C                insb
00009C26  7666              jna 0x9c8e
00009C28  666666E600        o16 out 0x0,al
00009C2D  0000              add [eax],al
00009C2F  0000              add [eax],al
00009C31  0018              add [eax],bl
00009C33  1800              sbb [eax],al
00009C35  3818              cmp [eax],bl
00009C37  1818              sbb [eax],bl
00009C39  1818              sbb [eax],bl
00009C3B  3C00              cmp al,0x0
00009C3D  0000              add [eax],al
00009C3F  0000              add [eax],al
00009C41  0006              add [esi],al
00009C43  06                push es
00009C44  000E              add [esi],cl
00009C46  06                push es
00009C47  06                push es
00009C48  06                push es
00009C49  06                push es
00009C4A  06                push es
00009C4B  06                push es
00009C4C  66663C00          o16 cmp al,0x0
00009C50  0000              add [eax],al
00009C52  E060              loopne 0x9cb4
00009C54  60                pusha
00009C55  666C              o16 insb
00009C57  7878              js 0x9cd1
00009C59  6C                insb
00009C5A  66E600            o16 out 0x0,al
00009C5D  0000              add [eax],al
00009C5F  0000              add [eax],al
00009C61  0038              add [eax],bh
00009C63  1818              sbb [eax],bl
00009C65  1818              sbb [eax],bl
00009C67  1818              sbb [eax],bl
00009C69  1818              sbb [eax],bl
00009C6B  3C00              cmp al,0x0
00009C6D  0000              add [eax],al
00009C6F  0000              add [eax],al
00009C71  0000              add [eax],al
00009C73  0000              add [eax],al
00009C75  EC                in al,dx
00009C76  FE                db 0xfe
00009C77  D6                salc
00009C78  D6                salc
00009C79  D6                salc
00009C7A  D6                salc
00009C7B  D6                salc
00009C7C  0000              add [eax],al
00009C7E  0000              add [eax],al
00009C80  0000              add [eax],al
00009C82  0000              add [eax],al
00009C84  00DC              add ah,bl
00009C86  6666666666660000  o16 add [eax],al
00009C8E  0000              add [eax],al
00009C90  0000              add [eax],al
00009C92  0000              add [eax],al
00009C94  007CC6C6          add [esi+eax*8-0x3a],bh
00009C98  C6C6C6            mov dh,0xc6
00009C9B  7C00              jl 0x9c9d
00009C9D  0000              add [eax],al
00009C9F  0000              add [eax],al
00009CA1  0000              add [eax],al
00009CA3  0000              add [eax],al
00009CA5  DC6666            fsub qword [esi+0x66]
00009CA8  6666667C60        o16 jl 0x9d0d
00009CAD  60                pusha
00009CAE  F00000            lock add [eax],al
00009CB1  0000              add [eax],al
00009CB3  0000              add [eax],al
00009CB5  76CC              jna 0x9c83
00009CB7  CC                int3
00009CB8  CC                int3
00009CB9  CC                int3
00009CBA  CC                int3
00009CBB  7C0C              jl 0x9cc9
00009CBD  0C1E              or al,0x1e
00009CBF  0000              add [eax],al
00009CC1  0000              add [eax],al
00009CC3  0000              add [eax],al
00009CC5  DC7662            fdiv qword [esi+0x62]
00009CC8  60                pusha
00009CC9  60                pusha
00009CCA  60                pusha
00009CCB  F00000            lock add [eax],al
00009CCE  0000              add [eax],al
00009CD0  0000              add [eax],al
00009CD2  0000              add [eax],al
00009CD4  007CC660          add [esi+eax*8+0x60],bh
00009CD8  380CC6            cmp [esi+eax*8],cl
00009CDB  7C00              jl 0x9cdd
00009CDD  0000              add [eax],al
00009CDF  0000              add [eax],al
00009CE1  0010              add [eax],dl
00009CE3  3030              xor [eax],dh
00009CE5  FC                cld
00009CE6  3030              xor [eax],dh
00009CE8  3030              xor [eax],dh
00009CEA  361C00            ss sbb al,0x0
00009CED  0000              add [eax],al
00009CEF  0000              add [eax],al
00009CF1  0000              add [eax],al
00009CF3  0000              add [eax],al
00009CF5  CC                int3
00009CF6  CC                int3
00009CF7  CC                int3
00009CF8  CC                int3
00009CF9  CC                int3
00009CFA  CC                int3
00009CFB  7600              jna 0x9cfd
00009CFD  0000              add [eax],al
00009CFF  0000              add [eax],al
00009D01  0000              add [eax],al
00009D03  0000              add [eax],al
00009D05  66666666663C18    o16 cmp al,0x18
00009D0C  0000              add [eax],al
00009D0E  0000              add [eax],al
00009D10  0000              add [eax],al
00009D12  0000              add [eax],al
00009D14  00C6              add dh,al
00009D16  C6C6D6            mov dh,0xd6
00009D19  D6                salc
00009D1A  FE                db 0xfe
00009D1B  6C                insb
00009D1C  0000              add [eax],al
00009D1E  0000              add [eax],al
00009D20  0000              add [eax],al
00009D22  0000              add [eax],al
00009D24  00C6              add dh,al
00009D26  6C                insb
00009D27  3838              cmp [eax],bh
00009D29  386CC600          cmp [esi+eax*8+0x0],ch
00009D2D  0000              add [eax],al
00009D2F  0000              add [eax],al
00009D31  0000              add [eax],al
00009D33  0000              add [eax],al
00009D35  C6C6C6            mov dh,0xc6
00009D38  C6C6C6            mov dh,0xc6
00009D3B  7E06              jng 0x9d43
00009D3D  0CF8              or al,0xf8
00009D3F  0000              add [eax],al
00009D41  0000              add [eax],al
00009D43  0000              add [eax],al
00009D45  FECC              dec ah
00009D47  1830              sbb [eax],dh
00009D49  60                pusha
00009D4A  C6                db 0xc6
00009D4B  FE00              inc byte [eax]
00009D4D  0000              add [eax],al
00009D4F  0000              add [eax],al
00009D51  000E              add [esi],cl
00009D53  1818              sbb [eax],bl
00009D55  187018            sbb [eax+0x18],dh
00009D58  1818              sbb [eax],bl
00009D5A  180E              sbb [esi],cl
00009D5C  0000              add [eax],al
00009D5E  0000              add [eax],al
00009D60  0000              add [eax],al
00009D62  1818              sbb [eax],bl
00009D64  1818              sbb [eax],bl
00009D66  0018              add [eax],bl
00009D68  1818              sbb [eax],bl
00009D6A  1818              sbb [eax],bl
00009D6C  0000              add [eax],al
00009D6E  0000              add [eax],al
00009D70  0000              add [eax],al
00009D72  7018              jo 0x9d8c
00009D74  1818              sbb [eax],bl
00009D76  0E                push cs
00009D77  1818              sbb [eax],bl
00009D79  1818              sbb [eax],bl
00009D7B  7000              jo 0x9d7d
00009D7D  0000              add [eax],al
00009D7F  0000              add [eax],al
00009D81  0076DC            add [esi-0x24],dh
00009D84  0000              add [eax],al
00009D86  0000              add [eax],al
00009D88  0000              add [eax],al
00009D8A  0000              add [eax],al
00009D8C  0000              add [eax],al
00009D8E  0000              add [eax],al
00009D90  0000              add [eax],al
00009D92  0000              add [eax],al
00009D94  1038              adc [eax],bh
00009D96  6C                insb
00009D97  C6C6C6            mov dh,0xc6
00009D9A  FE00              inc byte [eax]
00009D9C  0000              add [eax],al
00009D9E  0000              add [eax],al
00009DA0  0000              add [eax],al
00009DA2  3C66              cmp al,0x66
00009DA4  C2C0C0            ret 0xc0c0
00009DA7  C0C266            rol dl,byte 0x66
00009DAA  3C0C              cmp al,0xc
00009DAC  06                push es
00009DAD  7C00              jl 0x9daf
00009DAF  0000              add [eax],al
00009DB1  00CC              add ah,cl
00009DB3  CC                int3
00009DB4  00CC              add ah,cl
00009DB6  CC                int3
00009DB7  CC                int3
00009DB8  CC                int3
00009DB9  CC                int3
00009DBA  CC                int3
00009DBB  7600              jna 0x9dbd
00009DBD  0000              add [eax],al
00009DBF  0000              add [eax],al
00009DC1  0C18              or al,0x18
00009DC3  3000              xor [eax],al
00009DC5  7CC6              jl 0x9d8d
00009DC7  FEC0              inc al
00009DC9  C0C67C            rol dh,byte 0x7c
00009DCC  0000              add [eax],al
00009DCE  0000              add [eax],al
00009DD0  0010              add [eax],dl
00009DD2  386C0078          cmp [eax+eax+0x78],ch
00009DD6  0C7C              or al,0x7c
00009DD8  CC                int3
00009DD9  CC                int3
00009DDA  CC                int3
00009DDB  7600              jna 0x9ddd
00009DDD  0000              add [eax],al
00009DDF  0000              add [eax],al
00009DE1  00CC              add ah,cl
00009DE3  CC                int3
00009DE4  00780C            add [eax+0xc],bh
00009DE7  7CCC              jl 0x9db5
00009DE9  CC                int3
00009DEA  CC                int3
00009DEB  7600              jna 0x9ded
00009DED  0000              add [eax],al
00009DEF  0000              add [eax],al
00009DF1  60                pusha
00009DF2  3018              xor [eax],bl
00009DF4  00780C            add [eax+0xc],bh
00009DF7  7CCC              jl 0x9dc5
00009DF9  CC                int3
00009DFA  CC                int3
00009DFB  7600              jna 0x9dfd
00009DFD  0000              add [eax],al
00009DFF  0000              add [eax],al
00009E01  386C3800          cmp [eax+edi+0x0],ch
00009E05  780C              js 0x9e13
00009E07  7CCC              jl 0x9dd5
00009E09  CC                int3
00009E0A  CC                int3
00009E0B  7600              jna 0x9e0d
00009E0D  0000              add [eax],al
00009E0F  0000              add [eax],al
00009E11  0000              add [eax],al
00009E13  003C66            add [esi],bh
00009E16  60                pusha
00009E17  60                pusha
00009E18  663C0C            o16 cmp al,0xc
00009E1B  06                push es
00009E1C  3C00              cmp al,0x0
00009E1E  0000              add [eax],al
00009E20  0010              add [eax],dl
00009E22  386C007C          cmp [eax+eax+0x7c],ch
00009E26  C6                db 0xc6
00009E27  FEC0              inc al
00009E29  C0C67C            rol dh,byte 0x7c
00009E2C  0000              add [eax],al
00009E2E  0000              add [eax],al
00009E30  0000              add [eax],al
00009E32  C6C600            mov dh,0x0
00009E35  7CC6              jl 0x9dfd
00009E37  FEC0              inc al
00009E39  C0C67C            rol dh,byte 0x7c
00009E3C  0000              add [eax],al
00009E3E  0000              add [eax],al
00009E40  006030            add [eax+0x30],ah
00009E43  1800              sbb [eax],al
00009E45  7CC6              jl 0x9e0d
00009E47  FEC0              inc al
00009E49  C0C67C            rol dh,byte 0x7c
00009E4C  0000              add [eax],al
00009E4E  0000              add [eax],al
00009E50  0000              add [eax],al
00009E52  66660038          o16 add [eax],bh
00009E56  1818              sbb [eax],bl
00009E58  1818              sbb [eax],bl
00009E5A  183C00            sbb [eax+eax],bh
00009E5D  0000              add [eax],al
00009E5F  0000              add [eax],al
00009E61  183C66            sbb [esi],bh
00009E64  0038              add [eax],bh
00009E66  1818              sbb [eax],bl
00009E68  1818              sbb [eax],bl
00009E6A  183C00            sbb [eax+eax],bh
00009E6D  0000              add [eax],al
00009E6F  0000              add [eax],al
00009E71  60                pusha
00009E72  3018              xor [eax],bl
00009E74  0038              add [eax],bh
00009E76  1818              sbb [eax],bl
00009E78  1818              sbb [eax],bl
00009E7A  183C00            sbb [eax+eax],bh
00009E7D  0000              add [eax],al
00009E7F  0000              add [eax],al
00009E81  C6C610            mov dh,0x10
00009E84  386CC6C6          cmp [esi+eax*8-0x3a],ch
00009E88  FEC6              inc dh
00009E8A  C6C600            mov dh,0x0
00009E8D  0000              add [eax],al
00009E8F  0038              add [eax],bh
00009E91  6C                insb
00009E92  3800              cmp [eax],al
00009E94  386CC6C6          cmp [esi+eax*8-0x3a],ch
00009E98  FEC6              inc dh
00009E9A  C6C600            mov dh,0x0
00009E9D  0000              add [eax],al
00009E9F  0018              add [eax],bl
00009EA1  306000            xor [eax+0x0],ah
00009EA4  FE                db 0xfe
00009EA5  6660              pushaw
00009EA7  7C60              jl 0x9f09
00009EA9  60                pusha
00009EAA  66FE00            o16 inc byte [eax]
00009EAD  0000              add [eax],al
00009EAF  0000              add [eax],al
00009EB1  0000              add [eax],al
00009EB3  0000              add [eax],al
00009EB5  CC                int3
00009EB6  7636              jna 0x9eee
00009EB8  7ED8              jng 0x9e92
00009EBA  D86E00            fsubr dword [esi+0x0]
00009EBD  0000              add [eax],al
00009EBF  0000              add [eax],al
00009EC1  003E              add [esi],bh
00009EC3  6C                insb
00009EC4  CC                int3
00009EC5  CC                int3
00009EC6  FECC              dec ah
00009EC8  CC                int3
00009EC9  CC                int3
00009ECA  CC                int3
00009ECB  CE                into
00009ECC  0000              add [eax],al
00009ECE  0000              add [eax],al
00009ED0  0010              add [eax],dl
00009ED2  386C007C          cmp [eax+eax+0x7c],ch
00009ED6  C6C6C6            mov dh,0xc6
00009ED9  C6C67C            mov dh,0x7c
00009EDC  0000              add [eax],al
00009EDE  0000              add [eax],al
00009EE0  0000              add [eax],al
00009EE2  C6C600            mov dh,0x0
00009EE5  7CC6              jl 0x9ead
00009EE7  C6C6C6            mov dh,0xc6
00009EEA  C6                db 0xc6
00009EEB  7C00              jl 0x9eed
00009EED  0000              add [eax],al
00009EEF  0000              add [eax],al
00009EF1  60                pusha
00009EF2  3018              xor [eax],bl
00009EF4  007CC6C6          add [esi+eax*8-0x3a],bh
00009EF8  C6C6C6            mov dh,0xc6
00009EFB  7C00              jl 0x9efd
00009EFD  0000              add [eax],al
00009EFF  0000              add [eax],al
00009F01  3078CC            xor [eax-0x34],bh
00009F04  00CC              add ah,cl
00009F06  CC                int3
00009F07  CC                int3
00009F08  CC                int3
00009F09  CC                int3
00009F0A  CC                int3
00009F0B  7600              jna 0x9f0d
00009F0D  0000              add [eax],al
00009F0F  0000              add [eax],al
00009F11  60                pusha
00009F12  3018              xor [eax],bl
00009F14  00CC              add ah,cl
00009F16  CC                int3
00009F17  CC                int3
00009F18  CC                int3
00009F19  CC                int3
00009F1A  CC                int3
00009F1B  7600              jna 0x9f1d
00009F1D  0000              add [eax],al
00009F1F  0000              add [eax],al
00009F21  00C6              add dh,al
00009F23  C600C6            mov byte [eax],0xc6
00009F26  C6C6C6            mov dh,0xc6
00009F29  C6C67E            mov dh,0x7e
00009F2C  06                push es
00009F2D  0C78              or al,0x78
00009F2F  0000              add [eax],al
00009F31  C6C600            mov dh,0x0
00009F34  386CC6C6          cmp [esi+eax*8-0x3a],ch
00009F38  C6C66C            mov dh,0x6c
00009F3B  3800              cmp [eax],al
00009F3D  0000              add [eax],al
00009F3F  0000              add [eax],al
00009F41  C6C600            mov dh,0x0
00009F44  C6C6C6            mov dh,0xc6
00009F47  C6C6C6            mov dh,0xc6
00009F4A  C6                db 0xc6
00009F4B  7C00              jl 0x9f4d
00009F4D  0000              add [eax],al
00009F4F  0000              add [eax],al
00009F51  1818              sbb [eax],bl
00009F53  3C66              cmp al,0x66
00009F55  60                pusha
00009F56  60                pusha
00009F57  60                pusha
00009F58  663C18            o16 cmp al,0x18
00009F5B  1800              sbb [eax],al
00009F5D  0000              add [eax],al
00009F5F  0000              add [eax],al
00009F61  386C6460          cmp [esp+0x60],ch
00009F65  F060              lock pusha
00009F67  60                pusha
00009F68  60                pusha
00009F69  60                pusha
00009F6A  E6FC              out 0xfc,al
00009F6C  0000              add [eax],al
00009F6E  0000              add [eax],al
00009F70  0000              add [eax],al
00009F72  66663C18          o16 cmp al,0x18
00009F76  7E18              jng 0x9f90
00009F78  7E18              jng 0x9f92
00009F7A  1818              sbb [eax],bl
00009F7C  0000              add [eax],al
00009F7E  0000              add [eax],al
00009F80  00F8              add al,bh
00009F82  CC                int3
00009F83  CC                int3
00009F84  F8                clc
00009F85  C4                db 0xc4
00009F86  CC                int3
00009F87  DECC              fmulp st4
00009F89  CC                int3
00009F8A  CC                int3
00009F8B  C60000            mov byte [eax],0x0
00009F8E  0000              add [eax],al
00009F90  000E              add [esi],cl
00009F92  1B18              sbb ebx,[eax]
00009F94  1818              sbb [eax],bl
00009F96  7E18              jng 0x9fb0
00009F98  1818              sbb [eax],bl
00009F9A  1818              sbb [eax],bl
00009F9C  D87000            fdiv dword [eax+0x0]
00009F9F  0000              add [eax],al
00009FA1  1830              sbb [eax],dh
00009FA3  60                pusha
00009FA4  00780C            add [eax+0xc],bh
00009FA7  7CCC              jl 0x9f75
00009FA9  CC                int3
00009FAA  CC                int3
00009FAB  7600              jna 0x9fad
00009FAD  0000              add [eax],al
00009FAF  0000              add [eax],al
00009FB1  0C18              or al,0x18
00009FB3  3000              xor [eax],al
00009FB5  3818              cmp [eax],bl
00009FB7  1818              sbb [eax],bl
00009FB9  1818              sbb [eax],bl
00009FBB  3C00              cmp al,0x0
00009FBD  0000              add [eax],al
00009FBF  0000              add [eax],al
00009FC1  1830              sbb [eax],dh
00009FC3  60                pusha
00009FC4  007CC6C6          add [esi+eax*8-0x3a],bh
00009FC8  C6C6C6            mov dh,0xc6
00009FCB  7C00              jl 0x9fcd
00009FCD  0000              add [eax],al
00009FCF  0000              add [eax],al
00009FD1  1830              sbb [eax],dh
00009FD3  60                pusha
00009FD4  00CC              add ah,cl
00009FD6  CC                int3
00009FD7  CC                int3
00009FD8  CC                int3
00009FD9  CC                int3
00009FDA  CC                int3
00009FDB  7600              jna 0x9fdd
00009FDD  0000              add [eax],al
00009FDF  0000              add [eax],al
00009FE1  0076DC            add [esi-0x24],dh
00009FE4  00DC              add ah,bl
00009FE6  6666666666660000  o16 add [eax],al
00009FEE  0000              add [eax],al
00009FF0  76DC              jna 0x9fce
00009FF2  00C6              add dh,al
00009FF4  E6F6              out 0xf6,al
00009FF6  FE                db 0xfe
00009FF7  DECE              fmulp st6
00009FF9  C6C6C6            mov dh,0xc6
00009FFC  0000              add [eax],al
00009FFE  0000              add [eax],al
0000A000  003C6C            add [esp+ebp*2],bh
0000A003  6C                insb
0000A004  3E007E00          add [ds:esi+0x0],bh
0000A008  0000              add [eax],al
0000A00A  0000              add [eax],al
0000A00C  0000              add [eax],al
0000A00E  0000              add [eax],al
0000A010  0038              add [eax],bh
0000A012  6C                insb
0000A013  6C                insb
0000A014  3800              cmp [eax],al
0000A016  7C00              jl 0xa018
0000A018  0000              add [eax],al
0000A01A  0000              add [eax],al
0000A01C  0000              add [eax],al
0000A01E  0000              add [eax],al
0000A020  0000              add [eax],al
0000A022  3030              xor [eax],dh
0000A024  0030              add [eax],dh
0000A026  3060C0            xor [eax-0x40],ah
0000A029  C6C67C            mov dh,0x7c
0000A02C  0000              add [eax],al
0000A02E  0000              add [eax],al
0000A030  0000              add [eax],al
0000A032  0000              add [eax],al
0000A034  0000              add [eax],al
0000A036  FEC0              inc al
0000A038  C0C0C0            rol al,byte 0xc0
0000A03B  0000              add [eax],al
0000A03D  0000              add [eax],al
0000A03F  0000              add [eax],al
0000A041  0000              add [eax],al
0000A043  0000              add [eax],al
0000A045  00FE              add dh,bh
0000A047  06                push es
0000A048  06                push es
0000A049  06                push es
0000A04A  06                push es
0000A04B  0000              add [eax],al
0000A04D  0000              add [eax],al
0000A04F  0000              add [eax],al
0000A051  C0C0C2            rol al,byte 0xc2
0000A054  C6                db 0xc6
0000A055  CC                int3
0000A056  1830              sbb [eax],dh
0000A058  60                pusha
0000A059  CE                into
0000A05A  93                xchg eax,ebx
0000A05B  06                push es
0000A05C  0C1F              or al,0x1f
0000A05E  0000              add [eax],al
0000A060  00C0              add al,al
0000A062  C0C2C6            rol dl,byte 0xc6
0000A065  CC                int3
0000A066  1830              sbb [eax],dh
0000A068  66CE              o16 into
0000A06A  9A3F060F000000    call 0x0:0xf063f
0000A071  0018              add [eax],bl
0000A073  1800              sbb [eax],al
0000A075  1818              sbb [eax],bl
0000A077  183C3C            sbb [esp+edi],bh
0000A07A  3C18              cmp al,0x18
0000A07C  0000              add [eax],al
0000A07E  0000              add [eax],al
0000A080  0000              add [eax],al
0000A082  0000              add [eax],al
0000A084  0033              add [ebx],dh
0000A086  66CC              o16 int3
0000A088  663300            xor ax,[eax]
0000A08B  0000              add [eax],al
0000A08D  0000              add [eax],al
0000A08F  0000              add [eax],al
0000A091  0000              add [eax],al
0000A093  0000              add [eax],al
0000A095  CC                int3
0000A096  663366CC          xor sp,[esi-0x34]
0000A09A  0000              add [eax],al
0000A09C  0000              add [eax],al
0000A09E  0000              add [eax],al
0000A0A0  11441144          adc [ecx+edx+0x44],eax
0000A0A4  11441144          adc [ecx+edx+0x44],eax
0000A0A8  11441144          adc [ecx+edx+0x44],eax
0000A0AC  11441144          adc [ecx+edx+0x44],eax
0000A0B0  55                push ebp
0000A0B1  AA                stosb
0000A0B2  55                push ebp
0000A0B3  AA                stosb
0000A0B4  55                push ebp
0000A0B5  AA                stosb
0000A0B6  55                push ebp
0000A0B7  AA                stosb
0000A0B8  55                push ebp
0000A0B9  AA                stosb
0000A0BA  55                push ebp
0000A0BB  AA                stosb
0000A0BC  55                push ebp
0000A0BD  AA                stosb
0000A0BE  55                push ebp
0000A0BF  AA                stosb
0000A0C0  DD77DD            fnsave [edi-0x23]
0000A0C3  77DD              ja 0xa0a2
0000A0C5  77DD              ja 0xa0a4
0000A0C7  77DD              ja 0xa0a6
0000A0C9  77DD              ja 0xa0a8
0000A0CB  77DD              ja 0xa0aa
0000A0CD  77DD              ja 0xa0ac
0000A0CF  7718              ja 0xa0e9
0000A0D1  1818              sbb [eax],bl
0000A0D3  1818              sbb [eax],bl
0000A0D5  1818              sbb [eax],bl
0000A0D7  1818              sbb [eax],bl
0000A0D9  1818              sbb [eax],bl
0000A0DB  1818              sbb [eax],bl
0000A0DD  1818              sbb [eax],bl
0000A0DF  1818              sbb [eax],bl
0000A0E1  1818              sbb [eax],bl
0000A0E3  1818              sbb [eax],bl
0000A0E5  1818              sbb [eax],bl
0000A0E7  F8                clc
0000A0E8  1818              sbb [eax],bl
0000A0EA  1818              sbb [eax],bl
0000A0EC  1818              sbb [eax],bl
0000A0EE  1818              sbb [eax],bl
0000A0F0  1818              sbb [eax],bl
0000A0F2  1818              sbb [eax],bl
0000A0F4  18F8              sbb al,bh
0000A0F6  18F8              sbb al,bh
0000A0F8  1818              sbb [eax],bl
0000A0FA  1818              sbb [eax],bl
0000A0FC  1818              sbb [eax],bl
0000A0FE  1818              sbb [eax],bl
0000A100  36363636363636F6  div byte [ss:esi]
         -36
0000A109  3636363636363600  add [ss:eax],al
         -00
0000A112  0000              add [eax],al
0000A114  0000              add [eax],al
0000A116  00FE              add dh,bh
0000A118  3636363636363636  add [ss:eax],al
         -0000
0000A122  0000              add [eax],al
0000A124  00F8              add al,bh
0000A126  18F8              sbb al,bh
0000A128  1818              sbb [eax],bl
0000A12A  1818              sbb [eax],bl
0000A12C  1818              sbb [eax],bl
0000A12E  1818              sbb [eax],bl
0000A130  3636363636F606F6  test byte [ss:esi],0xf6
0000A138  3636363636363636  add [ss:eax],al
         -3636363636363636
         -3636363636363636
         -0000
0000A152  0000              add [eax],al
0000A154  00FE              add dh,bh
0000A156  06                push es
0000A157  F636              div byte [esi]
0000A159  3636363636363636  test byte [ss:esi],0xfe
         -36363636F606FE
0000A168  0000              add [eax],al
0000A16A  0000              add [eax],al
0000A16C  0000              add [eax],al
0000A16E  0000              add [eax],al
0000A170  36363636363636FE  inc byte [ss:eax]
         -00
0000A179  0000              add [eax],al
0000A17B  0000              add [eax],al
0000A17D  0000              add [eax],al
0000A17F  0018              add [eax],bl
0000A181  1818              sbb [eax],bl
0000A183  1818              sbb [eax],bl
0000A185  F8                clc
0000A186  18F8              sbb al,bh
0000A188  0000              add [eax],al
0000A18A  0000              add [eax],al
0000A18C  0000              add [eax],al
0000A18E  0000              add [eax],al
0000A190  0000              add [eax],al
0000A192  0000              add [eax],al
0000A194  0000              add [eax],al
0000A196  00F8              add al,bh
0000A198  1818              sbb [eax],bl
0000A19A  1818              sbb [eax],bl
0000A19C  1818              sbb [eax],bl
0000A19E  1818              sbb [eax],bl
0000A1A0  1818              sbb [eax],bl
0000A1A2  1818              sbb [eax],bl
0000A1A4  1818              sbb [eax],bl
0000A1A6  181F              sbb [edi],bl
0000A1A8  0000              add [eax],al
0000A1AA  0000              add [eax],al
0000A1AC  0000              add [eax],al
0000A1AE  0000              add [eax],al
0000A1B0  1818              sbb [eax],bl
0000A1B2  1818              sbb [eax],bl
0000A1B4  1818              sbb [eax],bl
0000A1B6  18FF              sbb bh,bh
0000A1B8  0000              add [eax],al
0000A1BA  0000              add [eax],al
0000A1BC  0000              add [eax],al
0000A1BE  0000              add [eax],al
0000A1C0  0000              add [eax],al
0000A1C2  0000              add [eax],al
0000A1C4  0000              add [eax],al
0000A1C6  00FF              add bh,bh
0000A1C8  1818              sbb [eax],bl
0000A1CA  1818              sbb [eax],bl
0000A1CC  1818              sbb [eax],bl
0000A1CE  1818              sbb [eax],bl
0000A1D0  1818              sbb [eax],bl
0000A1D2  1818              sbb [eax],bl
0000A1D4  1818              sbb [eax],bl
0000A1D6  181F              sbb [edi],bl
0000A1D8  1818              sbb [eax],bl
0000A1DA  1818              sbb [eax],bl
0000A1DC  1818              sbb [eax],bl
0000A1DE  1818              sbb [eax],bl
0000A1E0  0000              add [eax],al
0000A1E2  0000              add [eax],al
0000A1E4  0000              add [eax],al
0000A1E6  00FF              add bh,bh
0000A1E8  0000              add [eax],al
0000A1EA  0000              add [eax],al
0000A1EC  0000              add [eax],al
0000A1EE  0000              add [eax],al
0000A1F0  1818              sbb [eax],bl
0000A1F2  1818              sbb [eax],bl
0000A1F4  1818              sbb [eax],bl
0000A1F6  18FF              sbb bh,bh
0000A1F8  1818              sbb [eax],bl
0000A1FA  1818              sbb [eax],bl
0000A1FC  1818              sbb [eax],bl
0000A1FE  1818              sbb [eax],bl
0000A200  1818              sbb [eax],bl
0000A202  1818              sbb [eax],bl
0000A204  181F              sbb [edi],bl
0000A206  181F              sbb [edi],bl
0000A208  1818              sbb [eax],bl
0000A20A  1818              sbb [eax],bl
0000A20C  1818              sbb [eax],bl
0000A20E  1818              sbb [eax],bl
0000A210  3636363636363637  ss aaa
0000A218  3636363636363636  ss aaa
         -363636363637
0000A226  303F              xor [edi],bh
0000A228  0000              add [eax],al
0000A22A  0000              add [eax],al
0000A22C  0000              add [eax],al
0000A22E  0000              add [eax],al
0000A230  0000              add [eax],al
0000A232  0000              add [eax],al
0000A234  003F              add [edi],bh
0000A236  3037              xor [edi],dh
0000A238  3636363636363636  test dword [ss:eax],0xff
         -3636363636F700FF
         -000000
0000A24B  0000              add [eax],al
0000A24D  0000              add [eax],al
0000A24F  0000              add [eax],al
0000A251  0000              add [eax],al
0000A253  0000              add [eax],al
0000A255  FF00              inc dword [eax]
0000A257  F736              div dword [esi]
0000A259  3636363636363636  ss aaa
         -3636363637
0000A266  3037              xor [edi],dh
0000A268  3636363636363636  add [ss:eax],al
         -0000
0000A272  0000              add [eax],al
0000A274  00FF              add bh,bh
0000A276  00FF              add bh,bh
0000A278  0000              add [eax],al
0000A27A  0000              add [eax],al
0000A27C  0000              add [eax],al
0000A27E  0000              add [eax],al
0000A280  3636363636F700F7  test dword [ss:eax],0x363636f7
         -363636
0000A28B  36363636361818    sbb [ss:eax],bl
0000A292  1818              sbb [eax],bl
0000A294  18FF              sbb bh,bh
0000A296  00FF              add bh,bh
0000A298  0000              add [eax],al
0000A29A  0000              add [eax],al
0000A29C  0000              add [eax],al
0000A29E  0000              add [eax],al
0000A2A0  36363636363636FF  inc dword [ss:eax]
         -00
0000A2A9  0000              add [eax],al
0000A2AB  0000              add [eax],al
0000A2AD  0000              add [eax],al
0000A2AF  0000              add [eax],al
0000A2B1  0000              add [eax],al
0000A2B3  0000              add [eax],al
0000A2B5  FF00              inc dword [eax]
0000A2B7  FF18              call far [eax]
0000A2B9  1818              sbb [eax],bl
0000A2BB  1818              sbb [eax],bl
0000A2BD  1818              sbb [eax],bl
0000A2BF  1800              sbb [eax],al
0000A2C1  0000              add [eax],al
0000A2C3  0000              add [eax],al
0000A2C5  0000              add [eax],al
0000A2C7  FF36              push dword [esi]
0000A2C9  3636363636363636  ss aas
         -3636363636363F
0000A2D8  0000              add [eax],al
0000A2DA  0000              add [eax],al
0000A2DC  0000              add [eax],al
0000A2DE  0000              add [eax],al
0000A2E0  1818              sbb [eax],bl
0000A2E2  1818              sbb [eax],bl
0000A2E4  181F              sbb [edi],bl
0000A2E6  181F              sbb [edi],bl
0000A2E8  0000              add [eax],al
0000A2EA  0000              add [eax],al
0000A2EC  0000              add [eax],al
0000A2EE  0000              add [eax],al
0000A2F0  0000              add [eax],al
0000A2F2  0000              add [eax],al
0000A2F4  001F              add [edi],bl
0000A2F6  181F              sbb [edi],bl
0000A2F8  1818              sbb [eax],bl
0000A2FA  1818              sbb [eax],bl
0000A2FC  1818              sbb [eax],bl
0000A2FE  1818              sbb [eax],bl
0000A300  0000              add [eax],al
0000A302  0000              add [eax],al
0000A304  0000              add [eax],al
0000A306  003F              add [edi],bh
0000A308  3636363636363636  push dword [ss:esi]
         -36363636363636FF
         -36
0000A319  3636363636363618  sbb [ss:eax],bl
         -18
0000A322  1818              sbb [eax],bl
0000A324  18FF              sbb bh,bh
0000A326  18FF              sbb bh,bh
0000A328  1818              sbb [eax],bl
0000A32A  1818              sbb [eax],bl
0000A32C  1818              sbb [eax],bl
0000A32E  1818              sbb [eax],bl
0000A330  1818              sbb [eax],bl
0000A332  1818              sbb [eax],bl
0000A334  1818              sbb [eax],bl
0000A336  18F8              sbb al,bh
0000A338  0000              add [eax],al
0000A33A  0000              add [eax],al
0000A33C  0000              add [eax],al
0000A33E  0000              add [eax],al
0000A340  0000              add [eax],al
0000A342  0000              add [eax],al
0000A344  0000              add [eax],al
0000A346  001F              add [edi],bl
0000A348  1818              sbb [eax],bl
0000A34A  1818              sbb [eax],bl
0000A34C  1818              sbb [eax],bl
0000A34E  1818              sbb [eax],bl
0000A350  FF                db 0xff
0000A351  FF                db 0xff
0000A352  FF                db 0xff
0000A353  FF                db 0xff
0000A354  FF                db 0xff
0000A355  FF                db 0xff
0000A356  FF                db 0xff
0000A357  FF                db 0xff
0000A358  FF                db 0xff
0000A359  FF                db 0xff
0000A35A  FF                db 0xff
0000A35B  FF                db 0xff
0000A35C  FF                db 0xff
0000A35D  FF                db 0xff
0000A35E  FF                db 0xff
0000A35F  FF00              inc dword [eax]
0000A361  0000              add [eax],al
0000A363  0000              add [eax],al
0000A365  0000              add [eax],al
0000A367  FF                db 0xff
0000A368  FF                db 0xff
0000A369  FF                db 0xff
0000A36A  FF                db 0xff
0000A36B  FF                db 0xff
0000A36C  FF                db 0xff
0000A36D  FF                db 0xff
0000A36E  FF                db 0xff
0000A36F  FFF0              push eax
0000A371  F0                lock
0000A372  F0                lock
0000A373  F0                lock
0000A374  F0                lock
0000A375  F0                lock
0000A376  F0                lock
0000A377  F0                lock
0000A378  F0                lock
0000A379  F0                lock
0000A37A  F0                lock
0000A37B  F0                lock
0000A37C  F0                lock
0000A37D  F0                lock
0000A37E  F0                lock
0000A37F  F0                lock
0000A380  0F                db 0x0f
0000A381  0F                db 0x0f
0000A382  0F                db 0x0f
0000A383  0F                db 0x0f
0000A384  0F                db 0x0f
0000A385  0F                db 0x0f
0000A386  0F                db 0x0f
0000A387  0F                db 0x0f
0000A388  0F                db 0x0f
0000A389  0F                db 0x0f
0000A38A  0F                db 0x0f
0000A38B  0F                db 0x0f
0000A38C  0F                db 0x0f
0000A38D  0F                db 0x0f
0000A38E  0F                db 0x0f
0000A38F  0FFF              ud0
0000A391  FF                db 0xff
0000A392  FF                db 0xff
0000A393  FF                db 0xff
0000A394  FF                db 0xff
0000A395  FF                db 0xff
0000A396  FF00              inc dword [eax]
0000A398  0000              add [eax],al
0000A39A  0000              add [eax],al
0000A39C  0000              add [eax],al
0000A39E  0000              add [eax],al
0000A3A0  0000              add [eax],al
0000A3A2  0000              add [eax],al
0000A3A4  0076DC            add [esi-0x24],dh
0000A3A7  D8D8              fcomp st0
0000A3A9  D8DC              fcomp st4
0000A3AB  7600              jna 0xa3ad
0000A3AD  0000              add [eax],al
0000A3AF  0000              add [eax],al
0000A3B1  0000              add [eax],al
0000A3B3  0000              add [eax],al
0000A3B5  FC                cld
0000A3B6  C6                db 0xc6
0000A3B7  FC                cld
0000A3B8  C6C6FC            mov dh,0xfc
0000A3BB  C0C0C0            rol al,byte 0xc0
0000A3BE  0000              add [eax],al
0000A3C0  0000              add [eax],al
0000A3C2  FEC6              inc dh
0000A3C4  C6C0C0            mov al,0xc0
0000A3C7  C0C0C0            rol al,byte 0xc0
0000A3CA  C0C000            rol al,byte 0x0
0000A3CD  0000              add [eax],al
0000A3CF  0000              add [eax],al
0000A3D1  0000              add [eax],al
0000A3D3  0080FE6C6C6C      add [eax+0x6c6c6cfe],al
0000A3D9  6C                insb
0000A3DA  6C                insb
0000A3DB  6C                insb
0000A3DC  0000              add [eax],al
0000A3DE  0000              add [eax],al
0000A3E0  0000              add [eax],al
0000A3E2  00FE              add dh,bh
0000A3E4  C6                db 0xc6
0000A3E5  60                pusha
0000A3E6  3018              xor [eax],bl
0000A3E8  3060C6            xor [eax-0x3a],ah
0000A3EB  FE00              inc byte [eax]
0000A3ED  0000              add [eax],al
0000A3EF  0000              add [eax],al
0000A3F1  0000              add [eax],al
0000A3F3  0000              add [eax],al
0000A3F5  7ED8              jng 0xa3cf
0000A3F7  D8D8              fcomp st0
0000A3F9  D8D8              fcomp st0
0000A3FB  7000              jo 0xa3fd
0000A3FD  0000              add [eax],al
0000A3FF  0000              add [eax],al
0000A401  0000              add [eax],al
0000A403  006666            add [esi+0x66],ah
0000A406  6666667C60        o16 jl 0xa46b
0000A40B  60                pusha
0000A40C  C00000            rol byte [eax],byte 0x0
0000A40F  0000              add [eax],al
0000A411  0000              add [eax],al
0000A413  0076DC            add [esi-0x24],dh
0000A416  1818              sbb [eax],bl
0000A418  1818              sbb [eax],bl
0000A41A  1818              sbb [eax],bl
0000A41C  0000              add [eax],al
0000A41E  0000              add [eax],al
0000A420  0000              add [eax],al
0000A422  007E18            add [esi+0x18],bh
0000A425  3C66              cmp al,0x66
0000A427  66663C18          o16 cmp al,0x18
0000A42B  7E00              jng 0xa42d
0000A42D  0000              add [eax],al
0000A42F  0000              add [eax],al
0000A431  0000              add [eax],al
0000A433  386CC6C6          cmp [esi+eax*8-0x3a],ch
0000A437  FEC6              inc dh
0000A439  C6                db 0xc6
0000A43A  6C                insb
0000A43B  3800              cmp [eax],al
0000A43D  0000              add [eax],al
0000A43F  0000              add [eax],al
0000A441  0038              add [eax],bh
0000A443  6C                insb
0000A444  C6C6C6            mov dh,0xc6
0000A447  6C                insb
0000A448  6C                insb
0000A449  6C                insb
0000A44A  6C                insb
0000A44B  EE                out dx,al
0000A44C  0000              add [eax],al
0000A44E  0000              add [eax],al
0000A450  0000              add [eax],al
0000A452  1E                push ds
0000A453  3018              xor [eax],bl
0000A455  0C3E              or al,0x3e
0000A457  666666663C00      o16 cmp al,0x0
0000A45D  0000              add [eax],al
0000A45F  0000              add [eax],al
0000A461  0000              add [eax],al
0000A463  0000              add [eax],al
0000A465  7EDB              jng 0xa442
0000A467  DBDB              fcmovnu st3
0000A469  7E00              jng 0xa46b
0000A46B  0000              add [eax],al
0000A46D  0000              add [eax],al
0000A46F  0000              add [eax],al
0000A471  0000              add [eax],al
0000A473  0306              add eax,[esi]
0000A475  7ECF              jng 0xa446
0000A477  DBF3              fcomi st3
0000A479  7E60              jng 0xa4db
0000A47B  C00000            rol byte [eax],byte 0x0
0000A47E  0000              add [eax],al
0000A480  0000              add [eax],al
0000A482  1C30              sbb al,0x30
0000A484  60                pusha
0000A485  60                pusha
0000A486  7C60              jl 0xa4e8
0000A488  60                pusha
0000A489  60                pusha
0000A48A  301C00            xor [eax+eax],bl
0000A48D  0000              add [eax],al
0000A48F  0000              add [eax],al
0000A491  0000              add [eax],al
0000A493  7CC6              jl 0xa45b
0000A495  C6C6C6            mov dh,0xc6
0000A498  C6C6C6            mov dh,0xc6
0000A49B  C60000            mov byte [eax],0x0
0000A49E  0000              add [eax],al
0000A4A0  0000              add [eax],al
0000A4A2  0000              add [eax],al
0000A4A4  FE00              inc byte [eax]
0000A4A6  00FE              add dh,bh
0000A4A8  0000              add [eax],al
0000A4AA  FE00              inc byte [eax]
0000A4AC  0000              add [eax],al
0000A4AE  0000              add [eax],al
0000A4B0  0000              add [eax],al
0000A4B2  0000              add [eax],al
0000A4B4  1818              sbb [eax],bl
0000A4B6  7E18              jng 0xa4d0
0000A4B8  1800              sbb [eax],al
0000A4BA  00FF              add bh,bh
0000A4BC  0000              add [eax],al
0000A4BE  0000              add [eax],al
0000A4C0  0000              add [eax],al
0000A4C2  0030              add [eax],dh
0000A4C4  180C06            sbb [esi+eax],cl
0000A4C7  0C18              or al,0x18
0000A4C9  3000              xor [eax],al
0000A4CB  7E00              jng 0xa4cd
0000A4CD  0000              add [eax],al
0000A4CF  0000              add [eax],al
0000A4D1  0000              add [eax],al
0000A4D3  0C18              or al,0x18
0000A4D5  306030            xor [eax+0x30],ah
0000A4D8  180C00            sbb [eax+eax],cl
0000A4DB  7E00              jng 0xa4dd
0000A4DD  0000              add [eax],al
0000A4DF  0000              add [eax],al
0000A4E1  000E              add [esi],cl
0000A4E3  1B1B              sbb ebx,[ebx]
0000A4E5  1818              sbb [eax],bl
0000A4E7  1818              sbb [eax],bl
0000A4E9  1818              sbb [eax],bl
0000A4EB  1818              sbb [eax],bl
0000A4ED  1818              sbb [eax],bl
0000A4EF  1818              sbb [eax],bl
0000A4F1  1818              sbb [eax],bl
0000A4F3  1818              sbb [eax],bl
0000A4F5  1818              sbb [eax],bl
0000A4F7  18D8              sbb al,bl
0000A4F9  D8D8              fcomp st0
0000A4FB  7000              jo 0xa4fd
0000A4FD  0000              add [eax],al
0000A4FF  0000              add [eax],al
0000A501  0000              add [eax],al
0000A503  0018              add [eax],bl
0000A505  1800              sbb [eax],al
0000A507  7E00              jng 0xa509
0000A509  1818              sbb [eax],bl
0000A50B  0000              add [eax],al
0000A50D  0000              add [eax],al
0000A50F  0000              add [eax],al
0000A511  0000              add [eax],al
0000A513  0000              add [eax],al
0000A515  76DC              jna 0xa4f3
0000A517  0076DC            add [esi-0x24],dh
0000A51A  0000              add [eax],al
0000A51C  0000              add [eax],al
0000A51E  0000              add [eax],al
0000A520  0038              add [eax],bh
0000A522  6C                insb
0000A523  6C                insb
0000A524  3800              cmp [eax],al
0000A526  0000              add [eax],al
0000A528  0000              add [eax],al
0000A52A  0000              add [eax],al
0000A52C  0000              add [eax],al
0000A52E  0000              add [eax],al
0000A530  0000              add [eax],al
0000A532  0000              add [eax],al
0000A534  0000              add [eax],al
0000A536  0018              add [eax],bl
0000A538  1800              sbb [eax],al
0000A53A  0000              add [eax],al
0000A53C  0000              add [eax],al
0000A53E  0000              add [eax],al
0000A540  0000              add [eax],al
0000A542  0000              add [eax],al
0000A544  0000              add [eax],al
0000A546  0000              add [eax],al
0000A548  1800              sbb [eax],al
0000A54A  0000              add [eax],al
0000A54C  0000              add [eax],al
0000A54E  0000              add [eax],al
0000A550  000F              add [edi],cl
0000A552  0C0C              or al,0xc
0000A554  0C0C              or al,0xc
0000A556  0CEC              or al,0xec
0000A558  6C                insb
0000A559  6C                insb
0000A55A  3C1C              cmp al,0x1c
0000A55C  0000              add [eax],al
0000A55E  0000              add [eax],al
0000A560  00D8              add al,bl
0000A562  6C                insb
0000A563  6C                insb
0000A564  6C                insb
0000A565  6C                insb
0000A566  6C                insb
0000A567  0000              add [eax],al
0000A569  0000              add [eax],al
0000A56B  0000              add [eax],al
0000A56D  0000              add [eax],al
0000A56F  0000              add [eax],al
0000A571  7098              jo 0xa50b
0000A573  3060C8            xor [eax-0x38],ah
0000A576  F8                clc
0000A577  0000              add [eax],al
0000A579  0000              add [eax],al
0000A57B  0000              add [eax],al
0000A57D  0000              add [eax],al
0000A57F  0000              add [eax],al
0000A581  0000              add [eax],al
0000A583  007C7C7C          add [esp+edi*2+0x7c],bh
0000A587  7C7C              jl 0xa605
0000A589  7C7C              jl 0xa607
0000A58B  0000              add [eax],al
0000A58D  0000              add [eax],al
0000A58F  0000              add [eax],al
0000A591  0000              add [eax],al
0000A593  0000              add [eax],al
0000A595  0000              add [eax],al
0000A597  0000              add [eax],al
0000A599  0000              add [eax],al
0000A59B  0000              add [eax],al
0000A59D  0000              add [eax],al
0000A59F  00                db 0x00
