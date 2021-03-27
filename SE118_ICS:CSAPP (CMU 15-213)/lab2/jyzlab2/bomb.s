
bomb:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x8f3>
  400248:	78 38                	js     400282 <_init-0x8e6>
  40024a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
  400250:	6f                   	outsl  %ds:(%rsi),(%dx)
  400251:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.ABI-tag:

0000000000400254 <.note.ABI-tag>:
  400254:	04 00                	add    $0x0,%al
  400256:	00 00                	add    %al,(%rax)
  400258:	10 00                	adc    %al,(%rax)
  40025a:	00 00                	add    %al,(%rax)
  40025c:	01 00                	add    %eax,(%rax)
  40025e:	00 00                	add    %al,(%rax)
  400260:	47                   	rex.RXB
  400261:	4e 55                	rex.WRX push %rbp
  400263:	00 00                	add    %al,(%rax)
  400265:	00 00                	add    %al,(%rax)
  400267:	00 02                	add    %al,(%rdx)
  400269:	00 00                	add    %al,(%rax)
  40026b:	00 06                	add    %al,(%rsi)
  40026d:	00 00                	add    %al,(%rax)
  40026f:	00 20                	add    %ah,(%rax)
  400271:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000400274 <.note.gnu.build-id>:
  400274:	04 00                	add    $0x0,%al
  400276:	00 00                	add    %al,(%rax)
  400278:	14 00                	adc    $0x0,%al
  40027a:	00 00                	add    %al,(%rax)
  40027c:	03 00                	add    (%rax),%eax
  40027e:	00 00                	add    %al,(%rax)
  400280:	47                   	rex.RXB
  400281:	4e 55                	rex.WRX push %rbp
  400283:	00 b4 31 6f ec a6 be 	add    %dh,-0x41591391(%rcx,%rsi,1)
  40028a:	71 2b                	jno    4002b7 <_init-0x8b1>
  40028c:	ae                   	scas   %es:(%rdi),%al
  40028d:	09 e5                	or     %esp,%ebp
  40028f:	0b bc f7 4f d2 74 17 	or     0x1774d24f(%rdi,%rsi,8),%edi
  400296:	06                   	(bad)  
  400297:	f7                   	.byte 0xf7

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	02 00                	add    (%rax),%al
  40029a:	00 00                	add    %al,(%rax)
  40029c:	23 00                	and    (%rax),%eax
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
  4002a2:	00 00                	add    %al,(%rax)
  4002a4:	06                   	(bad)  
  4002a5:	00 00                	add    %al,(%rax)
  4002a7:	00 00                	add    %al,(%rax)
  4002a9:	00 20                	add    %ah,(%rax)
  4002ab:	00 80 01 10 00 23    	add    %al,0x23001001(%rax)
  4002b1:	00 00                	add    %al,(%rax)
  4002b3:	00 24 00             	add    %ah,(%rax,%rax,1)
  4002b6:	00 00                	add    %al,(%rax)
  4002b8:	29 1d 8c 1c 67 55    	sub    %ebx,0x55671c8c(%rip)        # 55a71f4a <_end+0x5546e0da>
  4002be:	61                   	(bad)  
  4002bf:	10                   	.byte 0x10

Disassembly of section .dynsym:

00000000004002c0 <.dynsym>:
	...
  4002d8:	c5 00 00             	(bad)  
  4002db:	00 12                	add    %dl,(%rdx)
	...
  4002ed:	00 00                	add    %al,(%rax)
  4002ef:	00 8b 00 00 00 12    	add    %cl,0x12000000(%rbx)
	...
  400305:	00 00                	add    %al,(%rax)
  400307:	00 21                	add    %ah,(%rcx)
  400309:	00 00                	add    %al,(%rax)
  40030b:	00 12                	add    %dl,(%rdx)
	...
  40031d:	00 00                	add    %al,(%rax)
  40031f:	00 5a 00             	add    %bl,0x0(%rdx)
  400322:	00 00                	add    %al,(%rax)
  400324:	12 00                	adc    (%rax),%al
	...
  400336:	00 00                	add    %al,(%rax)
  400338:	e6 00                	out    %al,$0x0
  40033a:	00 00                	add    %al,(%rax)
  40033c:	12 00                	adc    (%rax),%al
	...
  40034e:	00 00                	add    %al,(%rax)
  400350:	a9 00 00 00 12       	test   $0x12000000,%eax
	...
  400365:	00 00                	add    %al,(%rax)
  400367:	00 cc                	add    %cl,%ah
  400369:	00 00                	add    %al,(%rax)
  40036b:	00 12                	add    %dl,(%rdx)
	...
  40037d:	00 00                	add    %al,(%rax)
  40037f:	00 f3                	add    %dh,%bl
  400381:	00 00                	add    %al,(%rax)
  400383:	00 12                	add    %dl,(%rdx)
	...
  400395:	00 00                	add    %al,(%rax)
  400397:	00 6f 00             	add    %ch,0x0(%rdi)
  40039a:	00 00                	add    %al,(%rax)
  40039c:	12 00                	adc    (%rax),%al
	...
  4003ae:	00 00                	add    %al,(%rax)
  4003b0:	e1 00                	loope  4003b2 <_init-0x7b6>
  4003b2:	00 00                	add    %al,(%rax)
  4003b4:	12 00                	adc    (%rax),%al
	...
  4003c6:	00 00                	add    %al,(%rax)
  4003c8:	aa                   	stos   %al,%es:(%rdi)
  4003c9:	00 00                	add    %al,(%rax)
  4003cb:	00 12                	add    %dl,(%rdx)
	...
  4003dd:	00 00                	add    %al,(%rax)
  4003df:	00 a3 00 00 00 12    	add    %ah,0x12000000(%rbx)
	...
  4003f9:	01 00                	add    %eax,(%rax)
  4003fb:	00 12                	add    %dl,(%rdx)
	...
  40040d:	00 00                	add    %al,(%rax)
  40040f:	00 7d 00             	add    %bh,0x0(%rbp)
  400412:	00 00                	add    %al,(%rax)
  400414:	12 00                	adc    (%rax),%al
	...
  400426:	00 00                	add    %al,(%rax)
  400428:	83 00 00             	addl   $0x0,(%rax)
  40042b:	00 12                	add    %dl,(%rdx)
	...
  40043d:	00 00                	add    %al,(%rax)
  40043f:	00 53 00             	add    %dl,0x0(%rbx)
  400442:	00 00                	add    %al,(%rax)
  400444:	12 00                	adc    (%rax),%al
	...
  400456:	00 00                	add    %al,(%rax)
  400458:	d3 00                	roll   %cl,(%rax)
  40045a:	00 00                	add    %al,(%rax)
  40045c:	12 00                	adc    (%rax),%al
	...
  40046e:	00 00                	add    %al,(%rax)
  400470:	f2 00 00             	repnz add %al,(%rax)
  400473:	00 12                	add    %dl,(%rdx)
	...
  400485:	00 00                	add    %al,(%rax)
  400487:	00 12                	add    %dl,(%rdx)
  400489:	01 00                	add    %eax,(%rax)
  40048b:	00 20                	add    %ah,(%rax)
	...
  40049d:	00 00                	add    %al,(%rax)
  40049f:	00 76 00             	add    %dh,0x0(%rsi)
  4004a2:	00 00                	add    %al,(%rax)
  4004a4:	12 00                	adc    (%rax),%al
	...
  4004b6:	00 00                	add    %al,(%rax)
  4004b8:	65 00 00             	add    %al,%gs:(%rax)
  4004bb:	00 12                	add    %dl,(%rdx)
	...
  4004cd:	00 00                	add    %al,(%rax)
  4004cf:	00 1a                	add    %bl,(%rdx)
  4004d1:	00 00                	add    %al,(%rax)
  4004d3:	00 12                	add    %dl,(%rdx)
	...
  4004e5:	00 00                	add    %al,(%rax)
  4004e7:	00 3b                	add    %bh,(%rbx)
  4004e9:	00 00                	add    %al,(%rax)
  4004eb:	00 12                	add    %dl,(%rdx)
	...
  4004fd:	00 00                	add    %al,(%rax)
  4004ff:	00 ec                	add    %ch,%ah
  400501:	00 00                	add    %al,(%rax)
  400503:	00 12                	add    %dl,(%rdx)
	...
  400515:	00 00                	add    %al,(%rax)
  400517:	00 12                	add    %dl,(%rdx)
  400519:	00 00                	add    %al,(%rax)
  40051b:	00 12                	add    %dl,(%rdx)
	...
  40052d:	00 00                	add    %al,(%rax)
  40052f:	00 35 00 00 00 12    	add    %dh,0x12000000(%rip)        # 12400535 <_end+0x11dfc6c5>
	...
  400545:	00 00                	add    %al,(%rax)
  400547:	00 b0 00 00 00 12    	add    %dh,0x12000000(%rax)
	...
  40055d:	00 00                	add    %al,(%rax)
  40055f:	00 2d 00 00 00 12    	add    %ch,0x12000000(%rip)        # 12400565 <_end+0x11dfc6f5>
	...
  400575:	00 00                	add    %al,(%rax)
  400577:	00 28                	add    %ch,(%rax)
  400579:	00 00                	add    %al,(%rax)
  40057b:	00 12                	add    %dl,(%rdx)
	...
  40058d:	00 00                	add    %al,(%rax)
  40058f:	00 4b 00             	add    %cl,0x0(%rbx)
  400592:	00 00                	add    %al,(%rax)
  400594:	12 00                	adc    (%rax),%al
	...
  4005a6:	00 00                	add    %al,(%rax)
  4005a8:	e5 00                	in     $0x0,%eax
  4005aa:	00 00                	add    %al,(%rax)
  4005ac:	12 00                	adc    (%rax),%al
	...
  4005be:	00 00                	add    %al,(%rax)
  4005c0:	fa                   	cli    
  4005c1:	00 00                	add    %al,(%rax)
  4005c3:	00 12                	add    %dl,(%rdx)
	...
  4005d5:	00 00                	add    %al,(%rax)
  4005d7:	00 b7 00 00 00 12    	add    %dh,0x12000000(%rdi)
	...
  4005ed:	00 00                	add    %al,(%rax)
  4005ef:	00 0b                	add    %cl,(%rbx)
  4005f1:	00 00                	add    %al,(%rax)
  4005f3:	00 12                	add    %dl,(%rdx)
	...
  400605:	00 00                	add    %al,(%rax)
  400607:	00 9c 00 00 00 11 00 	add    %bl,0x110000(%rax,%rax,1)
  40060e:	19 00                	sbb    %eax,(%rax)
  400610:	a0 37 60 00 00 00 00 	movabs 0x800000000006037,%al
  400617:	00 08 
  400619:	00 00                	add    %al,(%rax)
  40061b:	00 00                	add    %al,(%rax)
  40061d:	00 00                	add    %al,(%rax)
  40061f:	00 5f 00             	add    %bl,0x0(%rdi)
  400622:	00 00                	add    %al,(%rax)
  400624:	11 00                	adc    %eax,(%rax)
  400626:	19 00                	sbb    %eax,(%rax)
  400628:	b0 37                	mov    $0x37,%al
  40062a:	60                   	(bad)  
  40062b:	00 00                	add    %al,(%rax)
  40062d:	00 00                	add    %al,(%rax)
  40062f:	00 08                	add    %cl,(%rax)
  400631:	00 00                	add    %al,(%rax)
  400633:	00 00                	add    %al,(%rax)
  400635:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000400638 <.dynstr>:
  400638:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  40063c:	63 2e                	movslq (%rsi),%ebp
  40063e:	73 6f                	jae    4006af <_init-0x4b9>
  400640:	2e 36 00 73 6f       	cs add %dh,%ss:0x6f(%rbx)
  400645:	63 6b 65             	movslq 0x65(%rbx),%ebp
  400648:	74 00                	je     40064a <_init-0x51e>
  40064a:	63 75 73             	movslq 0x73(%rbp),%esi
  40064d:	65 72 69             	gs jb  4006b9 <_init-0x4af>
  400650:	64 00 66 66          	add    %ah,%fs:0x66(%rsi)
  400654:	6c                   	insb   (%dx),%es:(%rdi)
  400655:	75 73                	jne    4006ca <_init-0x49e>
  400657:	68 00 73 74 72       	pushq  $0x72747300
  40065c:	63 70 79             	movslq 0x79(%rax),%esi
  40065f:	00 65 78             	add    %ah,0x78(%rbp)
  400662:	69 74 00 73 70 72 69 	imul   $0x6e697270,0x73(%rax,%rax,1),%esi
  400669:	6e 
  40066a:	74 66                	je     4006d2 <_init-0x496>
  40066c:	00 66 6f             	add    %ah,0x6f(%rsi)
  40066f:	70 65                	jo     4006d6 <_init-0x492>
  400671:	6e                   	outsb  %ds:(%rsi),(%dx)
  400672:	00 5f 5f             	add    %bl,0x5f(%rdi)
  400675:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
  40067c:	73 73                	jae    4006f1 <_init-0x477>
  40067e:	63 61 6e             	movslq 0x6e(%rcx),%esp
  400681:	66 00 63 6f          	data16 add %ah,0x6f(%rbx)
  400685:	6e                   	outsb  %ds:(%rsi),(%dx)
  400686:	6e                   	outsb  %ds:(%rsi),(%dx)
  400687:	65 63 74 00 73       	movslq %gs:0x73(%rax,%rax,1),%esi
  40068c:	69 67 6e 61 6c 00 70 	imul   $0x70006c61,0x6e(%rdi),%esp
  400693:	75 74                	jne    400709 <_init-0x45f>
  400695:	73 00                	jae    400697 <_init-0x4d1>
  400697:	73 74                	jae    40070d <_init-0x45b>
  400699:	64 69 6e 00 69 6e 65 	imul   $0x74656e69,%fs:0x0(%rsi),%ebp
  4006a0:	74 
  4006a1:	5f                   	pop    %rdi
  4006a2:	70 74                	jo     400718 <_init-0x450>
  4006a4:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006a5:	6e                   	outsb  %ds:(%rsi),(%dx)
  4006a6:	00 72 65             	add    %dh,0x65(%rdx)
  4006a9:	77 69                	ja     400714 <_init-0x454>
  4006ab:	6e                   	outsb  %ds:(%rsi),(%dx)
  4006ac:	64 00 73 74          	add    %dh,%fs:0x74(%rbx)
  4006b0:	72 74                	jb     400726 <_init-0x442>
  4006b2:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006b3:	6c                   	insb   (%dx),%es:(%rdi)
  4006b4:	00 66 67             	add    %ah,0x67(%rsi)
  4006b7:	65 74 73             	gs je  40072d <_init-0x43b>
  4006ba:	00 74 6d 70          	add    %dh,0x70(%rbp,%rbp,2)
  4006be:	66 69 6c 65 00 5f 5f 	imul   $0x5f5f,0x0(%rbp,%riz,2),%bp
  4006c5:	65 72 72             	gs jb  40073a <_init-0x42e>
  4006c8:	6e                   	outsb  %ds:(%rsi),(%dx)
  4006c9:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006ca:	5f                   	pop    %rdi
  4006cb:	6c                   	insb   (%dx),%es:(%rdi)
  4006cc:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006cd:	63 61 74             	movslq 0x74(%rcx),%esp
  4006d0:	69 6f 6e 00 73 74 64 	imul   $0x64747300,0x6e(%rdi),%ebp
  4006d7:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006d8:	75 74                	jne    40074e <_init-0x41a>
  4006da:	00 66 70             	add    %ah,0x70(%rsi)
  4006dd:	75 74                	jne    400753 <_init-0x415>
  4006df:	63 00                	movslq (%rax),%eax
  4006e1:	66 63 6c 6f 73       	movslq 0x73(%rdi,%rbp,2),%bp
  4006e6:	65 00 73 74          	add    %dh,%gs:0x74(%rbx)
  4006ea:	72 63                	jb     40074f <_init-0x419>
  4006ec:	61                   	(bad)  
  4006ed:	74 00                	je     4006ef <_init-0x479>
  4006ef:	5f                   	pop    %rdi
  4006f0:	5f                   	pop    %rdi
  4006f1:	63 74 79 70          	movslq 0x70(%rcx,%rdi,2),%esi
  4006f5:	65 5f                	gs pop %rdi
  4006f7:	62                   	(bad)  
  4006f8:	5f                   	pop    %rdi
  4006f9:	6c                   	insb   (%dx),%es:(%rdi)
  4006fa:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006fb:	63 00                	movslq (%rax),%eax
  4006fd:	67 65 74 65          	addr32 gs je 400766 <_init-0x402>
  400701:	6e                   	outsb  %ds:(%rsi),(%dx)
  400702:	76 00                	jbe    400704 <_init-0x464>
  400704:	73 79                	jae    40077f <_init-0x3e9>
  400706:	73 74                	jae    40077c <_init-0x3ec>
  400708:	65 6d                	gs insl (%dx),%es:(%rdi)
  40070a:	00 67 65             	add    %ah,0x65(%rdi)
  40070d:	74 68                	je     400777 <_init-0x3f1>
  40070f:	6f                   	outsl  %ds:(%rsi),(%dx)
  400710:	73 74                	jae    400786 <_init-0x3e2>
  400712:	62                   	(bad)  
  400713:	79 6e                	jns    400783 <_init-0x3e5>
  400715:	61                   	(bad)  
  400716:	6d                   	insl   (%dx),%es:(%rdi)
  400717:	65 00 64 75 70       	add    %ah,%gs:0x70(%rbp,%rsi,2)
  40071c:	00 66 77             	add    %ah,0x77(%rsi)
  40071f:	72 69                	jb     40078a <_init-0x3de>
  400721:	74 65                	je     400788 <_init-0x3e0>
  400723:	00 62 63             	add    %ah,0x63(%rdx)
  400726:	6f                   	outsl  %ds:(%rsi),(%dx)
  400727:	70 79                	jo     4007a2 <_init-0x3c6>
  400729:	00 66 70             	add    %ah,0x70(%rsi)
  40072c:	72 69                	jb     400797 <_init-0x3d1>
  40072e:	6e                   	outsb  %ds:(%rsi),(%dx)
  40072f:	74 66                	je     400797 <_init-0x3d1>
  400731:	00 73 6c             	add    %dh,0x6c(%rbx)
  400734:	65 65 70 00          	gs gs jo 400738 <_init-0x430>
  400738:	5f                   	pop    %rdi
  400739:	5f                   	pop    %rdi
  40073a:	6c                   	insb   (%dx),%es:(%rdi)
  40073b:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  400742:	72 74                	jb     4007b8 <_init-0x3b0>
  400744:	5f                   	pop    %rdi
  400745:	6d                   	insl   (%dx),%es:(%rdi)
  400746:	61                   	(bad)  
  400747:	69 6e 00 5f 5f 67 6d 	imul   $0x6d675f5f,0x0(%rsi),%ebp
  40074e:	6f                   	outsl  %ds:(%rsi),(%dx)
  40074f:	6e                   	outsb  %ds:(%rsi),(%dx)
  400750:	5f                   	pop    %rdi
  400751:	73 74                	jae    4007c7 <_init-0x3a1>
  400753:	61                   	(bad)  
  400754:	72 74                	jb     4007ca <_init-0x39e>
  400756:	5f                   	pop    %rdi
  400757:	5f                   	pop    %rdi
  400758:	00 47 4c             	add    %al,0x4c(%rdi)
  40075b:	49                   	rex.WB
  40075c:	42                   	rex.X
  40075d:	43 5f                	rex.XB pop %r15
  40075f:	32 2e                	xor    (%rsi),%ch
  400761:	33 00                	xor    (%rax),%eax
  400763:	47                   	rex.RXB
  400764:	4c                   	rex.WR
  400765:	49                   	rex.WB
  400766:	42                   	rex.X
  400767:	43 5f                	rex.XB pop %r15
  400769:	32 2e                	xor    (%rsi),%ch
  40076b:	37                   	(bad)  
  40076c:	00 47 4c             	add    %al,0x4c(%rdi)
  40076f:	49                   	rex.WB
  400770:	42                   	rex.X
  400771:	43 5f                	rex.XB pop %r15
  400773:	32 2e                	xor    (%rsi),%ch
  400775:	32 2e                	xor    (%rsi),%ch
  400777:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

000000000040077a <.gnu.version>:
  40077a:	00 00                	add    %al,(%rax)
  40077c:	02 00                	add    (%rax),%al
  40077e:	02 00                	add    (%rax),%al
  400780:	02 00                	add    (%rax),%al
  400782:	02 00                	add    (%rax),%al
  400784:	02 00                	add    (%rax),%al
  400786:	02 00                	add    (%rax),%al
  400788:	02 00                	add    (%rax),%al
  40078a:	02 00                	add    (%rax),%al
  40078c:	02 00                	add    (%rax),%al
  40078e:	02 00                	add    (%rax),%al
  400790:	02 00                	add    (%rax),%al
  400792:	02 00                	add    (%rax),%al
  400794:	02 00                	add    (%rax),%al
  400796:	02 00                	add    (%rax),%al
  400798:	02 00                	add    (%rax),%al
  40079a:	02 00                	add    (%rax),%al
  40079c:	02 00                	add    (%rax),%al
  40079e:	02 00                	add    (%rax),%al
  4007a0:	00 00                	add    %al,(%rax)
  4007a2:	02 00                	add    (%rax),%al
  4007a4:	02 00                	add    (%rax),%al
  4007a6:	02 00                	add    (%rax),%al
  4007a8:	03 00                	add    (%rax),%eax
  4007aa:	02 00                	add    (%rax),%al
  4007ac:	02 00                	add    (%rax),%al
  4007ae:	02 00                	add    (%rax),%al
  4007b0:	02 00                	add    (%rax),%al
  4007b2:	02 00                	add    (%rax),%al
  4007b4:	02 00                	add    (%rax),%al
  4007b6:	02 00                	add    (%rax),%al
  4007b8:	02 00                	add    (%rax),%al
  4007ba:	02 00                	add    (%rax),%al
  4007bc:	04 00                	add    $0x0,%al
  4007be:	02 00                	add    (%rax),%al
  4007c0:	02 00                	add    (%rax),%al
  4007c2:	02 00                	add    (%rax),%al

Disassembly of section .gnu.version_r:

00000000004007c8 <.gnu.version_r>:
  4007c8:	01 00                	add    %eax,(%rax)
  4007ca:	03 00                	add    (%rax),%eax
  4007cc:	01 00                	add    %eax,(%rax)
  4007ce:	00 00                	add    %al,(%rax)
  4007d0:	10 00                	adc    %al,(%rax)
  4007d2:	00 00                	add    %al,(%rax)
  4007d4:	00 00                	add    %al,(%rax)
  4007d6:	00 00                	add    %al,(%rax)
  4007d8:	13 69 69             	adc    0x69(%rcx),%ebp
  4007db:	0d 00 00 04 00       	or     $0x40000,%eax
  4007e0:	21 01                	and    %eax,(%rcx)
  4007e2:	00 00                	add    %al,(%rax)
  4007e4:	10 00                	adc    %al,(%rax)
  4007e6:	00 00                	add    %al,(%rax)
  4007e8:	17                   	(bad)  
  4007e9:	69 69 0d 00 00 03 00 	imul   $0x30000,0xd(%rcx),%ebp
  4007f0:	2b 01                	sub    (%rcx),%eax
  4007f2:	00 00                	add    %al,(%rax)
  4007f4:	10 00                	adc    %al,(%rax)
  4007f6:	00 00                	add    %al,(%rax)
  4007f8:	75 1a                	jne    400814 <_init-0x354>
  4007fa:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  400800:	35 01 00 00 00       	xor    $0x1,%eax
  400805:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000400808 <.rela.dyn>:
  400808:	f0 2f                	lock (bad) 
  40080a:	60                   	(bad)  
  40080b:	00 00                	add    %al,(%rax)
  40080d:	00 00                	add    %al,(%rax)
  40080f:	00 06                	add    %al,(%rsi)
  400811:	00 00                	add    %al,(%rax)
  400813:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 400819 <_init-0x34f>
  400819:	00 00                	add    %al,(%rax)
  40081b:	00 00                	add    %al,(%rax)
  40081d:	00 00                	add    %al,(%rax)
  40081f:	00 f8                	add    %bh,%al
  400821:	2f                   	(bad)  
  400822:	60                   	(bad)  
  400823:	00 00                	add    %al,(%rax)
  400825:	00 00                	add    %al,(%rax)
  400827:	00 06                	add    %al,(%rsi)
  400829:	00 00                	add    %al,(%rax)
  40082b:	00 13                	add    %dl,(%rbx)
	...
  400835:	00 00                	add    %al,(%rax)
  400837:	00 a0 37 60 00 00    	add    %ah,0x6037(%rax)
  40083d:	00 00                	add    %al,(%rax)
  40083f:	00 05 00 00 00 23    	add    %al,0x23000000(%rip)        # 23400845 <_end+0x22dfc9d5>
	...
  40084d:	00 00                	add    %al,(%rax)
  40084f:	00 b0 37 60 00 00    	add    %dh,0x6037(%rax)
  400855:	00 00                	add    %al,(%rax)
  400857:	00 05 00 00 00 24    	add    %al,0x24000000(%rip)        # 2440085d <_end+0x23dfc9ed>
	...

Disassembly of section .rela.plt:

0000000000400868 <.rela.plt>:
  400868:	18 30                	sbb    %dh,(%rax)
  40086a:	60                   	(bad)  
  40086b:	00 00                	add    %al,(%rax)
  40086d:	00 00                	add    %al,(%rax)
  40086f:	00 07                	add    %al,(%rdi)
  400871:	00 00                	add    %al,(%rax)
  400873:	00 01                	add    %al,(%rcx)
	...
  40087d:	00 00                	add    %al,(%rax)
  40087f:	00 20                	add    %ah,(%rax)
  400881:	30 60 00             	xor    %ah,0x0(%rax)
  400884:	00 00                	add    %al,(%rax)
  400886:	00 00                	add    %al,(%rax)
  400888:	07                   	(bad)  
  400889:	00 00                	add    %al,(%rax)
  40088b:	00 02                	add    %al,(%rdx)
	...
  400895:	00 00                	add    %al,(%rax)
  400897:	00 28                	add    %ch,(%rax)
  400899:	30 60 00             	xor    %ah,0x0(%rax)
  40089c:	00 00                	add    %al,(%rax)
  40089e:	00 00                	add    %al,(%rax)
  4008a0:	07                   	(bad)  
  4008a1:	00 00                	add    %al,(%rax)
  4008a3:	00 03                	add    %al,(%rbx)
	...
  4008ad:	00 00                	add    %al,(%rax)
  4008af:	00 30                	add    %dh,(%rax)
  4008b1:	30 60 00             	xor    %ah,0x0(%rax)
  4008b4:	00 00                	add    %al,(%rax)
  4008b6:	00 00                	add    %al,(%rax)
  4008b8:	07                   	(bad)  
  4008b9:	00 00                	add    %al,(%rax)
  4008bb:	00 04 00             	add    %al,(%rax,%rax,1)
	...
  4008c6:	00 00                	add    %al,(%rax)
  4008c8:	38 30                	cmp    %dh,(%rax)
  4008ca:	60                   	(bad)  
  4008cb:	00 00                	add    %al,(%rax)
  4008cd:	00 00                	add    %al,(%rax)
  4008cf:	00 07                	add    %al,(%rdi)
  4008d1:	00 00                	add    %al,(%rax)
  4008d3:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 4008d9 <_init-0x28f>
  4008d9:	00 00                	add    %al,(%rax)
  4008db:	00 00                	add    %al,(%rax)
  4008dd:	00 00                	add    %al,(%rax)
  4008df:	00 40 30             	add    %al,0x30(%rax)
  4008e2:	60                   	(bad)  
  4008e3:	00 00                	add    %al,(%rax)
  4008e5:	00 00                	add    %al,(%rax)
  4008e7:	00 07                	add    %al,(%rdi)
  4008e9:	00 00                	add    %al,(%rax)
  4008eb:	00 06                	add    %al,(%rsi)
	...
  4008f5:	00 00                	add    %al,(%rax)
  4008f7:	00 48 30             	add    %cl,0x30(%rax)
  4008fa:	60                   	(bad)  
  4008fb:	00 00                	add    %al,(%rax)
  4008fd:	00 00                	add    %al,(%rax)
  4008ff:	00 07                	add    %al,(%rdi)
  400901:	00 00                	add    %al,(%rax)
  400903:	00 07                	add    %al,(%rdi)
	...
  40090d:	00 00                	add    %al,(%rax)
  40090f:	00 50 30             	add    %dl,0x30(%rax)
  400912:	60                   	(bad)  
  400913:	00 00                	add    %al,(%rax)
  400915:	00 00                	add    %al,(%rax)
  400917:	00 07                	add    %al,(%rdi)
  400919:	00 00                	add    %al,(%rax)
  40091b:	00 08                	add    %cl,(%rax)
	...
  400925:	00 00                	add    %al,(%rax)
  400927:	00 58 30             	add    %bl,0x30(%rax)
  40092a:	60                   	(bad)  
  40092b:	00 00                	add    %al,(%rax)
  40092d:	00 00                	add    %al,(%rax)
  40092f:	00 07                	add    %al,(%rdi)
  400931:	00 00                	add    %al,(%rax)
  400933:	00 09                	add    %cl,(%rcx)
	...
  40093d:	00 00                	add    %al,(%rax)
  40093f:	00 60 30             	add    %ah,0x30(%rax)
  400942:	60                   	(bad)  
  400943:	00 00                	add    %al,(%rax)
  400945:	00 00                	add    %al,(%rax)
  400947:	00 07                	add    %al,(%rdi)
  400949:	00 00                	add    %al,(%rax)
  40094b:	00 0a                	add    %cl,(%rdx)
	...
  400955:	00 00                	add    %al,(%rax)
  400957:	00 68 30             	add    %ch,0x30(%rax)
  40095a:	60                   	(bad)  
  40095b:	00 00                	add    %al,(%rax)
  40095d:	00 00                	add    %al,(%rax)
  40095f:	00 07                	add    %al,(%rdi)
  400961:	00 00                	add    %al,(%rax)
  400963:	00 0b                	add    %cl,(%rbx)
	...
  40096d:	00 00                	add    %al,(%rax)
  40096f:	00 70 30             	add    %dh,0x30(%rax)
  400972:	60                   	(bad)  
  400973:	00 00                	add    %al,(%rax)
  400975:	00 00                	add    %al,(%rax)
  400977:	00 07                	add    %al,(%rdi)
  400979:	00 00                	add    %al,(%rax)
  40097b:	00 0c 00             	add    %cl,(%rax,%rax,1)
	...
  400986:	00 00                	add    %al,(%rax)
  400988:	78 30                	js     4009ba <_init-0x1ae>
  40098a:	60                   	(bad)  
  40098b:	00 00                	add    %al,(%rax)
  40098d:	00 00                	add    %al,(%rax)
  40098f:	00 07                	add    %al,(%rdi)
  400991:	00 00                	add    %al,(%rax)
  400993:	00 0e                	add    %cl,(%rsi)
	...
  40099d:	00 00                	add    %al,(%rax)
  40099f:	00 80 30 60 00 00    	add    %al,0x6030(%rax)
  4009a5:	00 00                	add    %al,(%rax)
  4009a7:	00 07                	add    %al,(%rdi)
  4009a9:	00 00                	add    %al,(%rax)
  4009ab:	00 0f                	add    %cl,(%rdi)
	...
  4009b5:	00 00                	add    %al,(%rax)
  4009b7:	00 88 30 60 00 00    	add    %cl,0x6030(%rax)
  4009bd:	00 00                	add    %al,(%rax)
  4009bf:	00 07                	add    %al,(%rdi)
  4009c1:	00 00                	add    %al,(%rax)
  4009c3:	00 10                	add    %dl,(%rax)
	...
  4009cd:	00 00                	add    %al,(%rax)
  4009cf:	00 90 30 60 00 00    	add    %dl,0x6030(%rax)
  4009d5:	00 00                	add    %al,(%rax)
  4009d7:	00 07                	add    %al,(%rdi)
  4009d9:	00 00                	add    %al,(%rax)
  4009db:	00 11                	add    %dl,(%rcx)
	...
  4009e5:	00 00                	add    %al,(%rax)
  4009e7:	00 98 30 60 00 00    	add    %bl,0x6030(%rax)
  4009ed:	00 00                	add    %al,(%rax)
  4009ef:	00 07                	add    %al,(%rdi)
  4009f1:	00 00                	add    %al,(%rax)
  4009f3:	00 12                	add    %dl,(%rdx)
	...
  4009fd:	00 00                	add    %al,(%rax)
  4009ff:	00 a0 30 60 00 00    	add    %ah,0x6030(%rax)
  400a05:	00 00                	add    %al,(%rax)
  400a07:	00 07                	add    %al,(%rdi)
  400a09:	00 00                	add    %al,(%rax)
  400a0b:	00 14 00             	add    %dl,(%rax,%rax,1)
	...
  400a16:	00 00                	add    %al,(%rax)
  400a18:	a8 30                	test   $0x30,%al
  400a1a:	60                   	(bad)  
  400a1b:	00 00                	add    %al,(%rax)
  400a1d:	00 00                	add    %al,(%rax)
  400a1f:	00 07                	add    %al,(%rdi)
  400a21:	00 00                	add    %al,(%rax)
  400a23:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 400a29 <_init-0x13f>
  400a29:	00 00                	add    %al,(%rax)
  400a2b:	00 00                	add    %al,(%rax)
  400a2d:	00 00                	add    %al,(%rax)
  400a2f:	00 b0 30 60 00 00    	add    %dh,0x6030(%rax)
  400a35:	00 00                	add    %al,(%rax)
  400a37:	00 07                	add    %al,(%rdi)
  400a39:	00 00                	add    %al,(%rax)
  400a3b:	00 16                	add    %dl,(%rsi)
	...
  400a45:	00 00                	add    %al,(%rax)
  400a47:	00 b8 30 60 00 00    	add    %bh,0x6030(%rax)
  400a4d:	00 00                	add    %al,(%rax)
  400a4f:	00 07                	add    %al,(%rdi)
  400a51:	00 00                	add    %al,(%rax)
  400a53:	00 17                	add    %dl,(%rdi)
	...
  400a5d:	00 00                	add    %al,(%rax)
  400a5f:	00 c0                	add    %al,%al
  400a61:	30 60 00             	xor    %ah,0x0(%rax)
  400a64:	00 00                	add    %al,(%rax)
  400a66:	00 00                	add    %al,(%rax)
  400a68:	07                   	(bad)  
  400a69:	00 00                	add    %al,(%rax)
  400a6b:	00 18                	add    %bl,(%rax)
	...
  400a75:	00 00                	add    %al,(%rax)
  400a77:	00 c8                	add    %cl,%al
  400a79:	30 60 00             	xor    %ah,0x0(%rax)
  400a7c:	00 00                	add    %al,(%rax)
  400a7e:	00 00                	add    %al,(%rax)
  400a80:	07                   	(bad)  
  400a81:	00 00                	add    %al,(%rax)
  400a83:	00 19                	add    %bl,(%rcx)
	...
  400a8d:	00 00                	add    %al,(%rax)
  400a8f:	00 d0                	add    %dl,%al
  400a91:	30 60 00             	xor    %ah,0x0(%rax)
  400a94:	00 00                	add    %al,(%rax)
  400a96:	00 00                	add    %al,(%rax)
  400a98:	07                   	(bad)  
  400a99:	00 00                	add    %al,(%rax)
  400a9b:	00 1a                	add    %bl,(%rdx)
	...
  400aa5:	00 00                	add    %al,(%rax)
  400aa7:	00 d8                	add    %bl,%al
  400aa9:	30 60 00             	xor    %ah,0x0(%rax)
  400aac:	00 00                	add    %al,(%rax)
  400aae:	00 00                	add    %al,(%rax)
  400ab0:	07                   	(bad)  
  400ab1:	00 00                	add    %al,(%rax)
  400ab3:	00 1b                	add    %bl,(%rbx)
	...
  400abd:	00 00                	add    %al,(%rax)
  400abf:	00 e0                	add    %ah,%al
  400ac1:	30 60 00             	xor    %ah,0x0(%rax)
  400ac4:	00 00                	add    %al,(%rax)
  400ac6:	00 00                	add    %al,(%rax)
  400ac8:	07                   	(bad)  
  400ac9:	00 00                	add    %al,(%rax)
  400acb:	00 1c 00             	add    %bl,(%rax,%rax,1)
	...
  400ad6:	00 00                	add    %al,(%rax)
  400ad8:	e8 30 60 00 00       	callq  406b0d <__FRAME_END__+0x4105>
  400add:	00 00                	add    %al,(%rax)
  400adf:	00 07                	add    %al,(%rdi)
  400ae1:	00 00                	add    %al,(%rax)
  400ae3:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # 400ae9 <_init-0x7f>
  400ae9:	00 00                	add    %al,(%rax)
  400aeb:	00 00                	add    %al,(%rax)
  400aed:	00 00                	add    %al,(%rax)
  400aef:	00 f0                	add    %dh,%al
  400af1:	30 60 00             	xor    %ah,0x0(%rax)
  400af4:	00 00                	add    %al,(%rax)
  400af6:	00 00                	add    %al,(%rax)
  400af8:	07                   	(bad)  
  400af9:	00 00                	add    %al,(%rax)
  400afb:	00 1e                	add    %bl,(%rsi)
	...
  400b05:	00 00                	add    %al,(%rax)
  400b07:	00 f8                	add    %bh,%al
  400b09:	30 60 00             	xor    %ah,0x0(%rax)
  400b0c:	00 00                	add    %al,(%rax)
  400b0e:	00 00                	add    %al,(%rax)
  400b10:	07                   	(bad)  
  400b11:	00 00                	add    %al,(%rax)
  400b13:	00 1f                	add    %bl,(%rdi)
	...
  400b21:	31 60 00             	xor    %esp,0x0(%rax)
  400b24:	00 00                	add    %al,(%rax)
  400b26:	00 00                	add    %al,(%rax)
  400b28:	07                   	(bad)  
  400b29:	00 00                	add    %al,(%rax)
  400b2b:	00 20                	add    %ah,(%rax)
	...
  400b35:	00 00                	add    %al,(%rax)
  400b37:	00 08                	add    %cl,(%rax)
  400b39:	31 60 00             	xor    %esp,0x0(%rax)
  400b3c:	00 00                	add    %al,(%rax)
  400b3e:	00 00                	add    %al,(%rax)
  400b40:	07                   	(bad)  
  400b41:	00 00                	add    %al,(%rax)
  400b43:	00 21                	add    %ah,(%rcx)
	...
  400b4d:	00 00                	add    %al,(%rax)
  400b4f:	00 10                	add    %dl,(%rax)
  400b51:	31 60 00             	xor    %esp,0x0(%rax)
  400b54:	00 00                	add    %al,(%rax)
  400b56:	00 00                	add    %al,(%rax)
  400b58:	07                   	(bad)  
  400b59:	00 00                	add    %al,(%rax)
  400b5b:	00 22                	add    %ah,(%rdx)
	...

Disassembly of section .init:

0000000000400b68 <_init>:
  400b68:	48 83 ec 08          	sub    $0x8,%rsp
  400b6c:	48 8b 05 85 24 20 00 	mov    0x202485(%rip),%rax        # 602ff8 <_DYNAMIC+0x1d8>
  400b73:	48 85 c0             	test   %rax,%rax
  400b76:	74 02                	je     400b7a <_init+0x12>
  400b78:	ff d0                	callq  *%rax
  400b7a:	48 83 c4 08          	add    $0x8,%rsp
  400b7e:	c3                   	retq   

Disassembly of section .plt:

0000000000400b80 <getenv@plt-0x10>:
  400b80:	ff 35 82 24 20 00    	pushq  0x202482(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b86:	ff 25 84 24 20 00    	jmpq   *0x202484(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b90 <getenv@plt>:
  400b90:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 603018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400b96:	68 00 00 00 00       	pushq  $0x0
  400b9b:	e9 e0 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400ba0 <__errno_location@plt>:
  400ba0:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 603020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400ba6:	68 01 00 00 00       	pushq  $0x1
  400bab:	e9 d0 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400bb0 <strcpy@plt>:
  400bb0:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 603028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400bb6:	68 02 00 00 00       	pushq  $0x2
  400bbb:	e9 c0 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400bc0 <puts@plt>:
  400bc0:	ff 25 6a 24 20 00    	jmpq   *0x20246a(%rip)        # 603030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400bc6:	68 03 00 00 00       	pushq  $0x3
  400bcb:	e9 b0 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400bd0 <write@plt>:
  400bd0:	ff 25 62 24 20 00    	jmpq   *0x202462(%rip)        # 603038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400bd6:	68 04 00 00 00       	pushq  $0x4
  400bdb:	e9 a0 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400be0 <fclose@plt>:
  400be0:	ff 25 5a 24 20 00    	jmpq   *0x20245a(%rip)        # 603040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400be6:	68 05 00 00 00       	pushq  $0x5
  400beb:	e9 90 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400bf0 <system@plt>:
  400bf0:	ff 25 52 24 20 00    	jmpq   *0x202452(%rip)        # 603048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400bf6:	68 06 00 00 00       	pushq  $0x6
  400bfb:	e9 80 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c00 <printf@plt>:
  400c00:	ff 25 4a 24 20 00    	jmpq   *0x20244a(%rip)        # 603050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400c06:	68 07 00 00 00       	pushq  $0x7
  400c0b:	e9 70 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c10 <rewind@plt>:
  400c10:	ff 25 42 24 20 00    	jmpq   *0x202442(%rip)        # 603058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400c16:	68 08 00 00 00       	pushq  $0x8
  400c1b:	e9 60 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c20 <dup@plt>:
  400c20:	ff 25 3a 24 20 00    	jmpq   *0x20243a(%rip)        # 603060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400c26:	68 09 00 00 00       	pushq  $0x9
  400c2b:	e9 50 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c30 <close@plt>:
  400c30:	ff 25 32 24 20 00    	jmpq   *0x202432(%rip)        # 603068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400c36:	68 0a 00 00 00       	pushq  $0xa
  400c3b:	e9 40 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c40 <fputc@plt>:
  400c40:	ff 25 2a 24 20 00    	jmpq   *0x20242a(%rip)        # 603070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400c46:	68 0b 00 00 00       	pushq  $0xb
  400c4b:	e9 30 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c50 <fgets@plt>:
  400c50:	ff 25 22 24 20 00    	jmpq   *0x202422(%rip)        # 603078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400c56:	68 0c 00 00 00       	pushq  $0xc
  400c5b:	e9 20 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c60 <tmpfile@plt>:
  400c60:	ff 25 1a 24 20 00    	jmpq   *0x20241a(%rip)        # 603080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400c66:	68 0d 00 00 00       	pushq  $0xd
  400c6b:	e9 10 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c70 <signal@plt>:
  400c70:	ff 25 12 24 20 00    	jmpq   *0x202412(%rip)        # 603088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400c76:	68 0e 00 00 00       	pushq  $0xe
  400c7b:	e9 00 ff ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c80 <gethostbyname@plt>:
  400c80:	ff 25 0a 24 20 00    	jmpq   *0x20240a(%rip)        # 603090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400c86:	68 0f 00 00 00       	pushq  $0xf
  400c8b:	e9 f0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400c90 <fprintf@plt>:
  400c90:	ff 25 02 24 20 00    	jmpq   *0x202402(%rip)        # 603098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400c96:	68 10 00 00 00       	pushq  $0x10
  400c9b:	e9 e0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400ca0 <strtol@plt>:
  400ca0:	ff 25 fa 23 20 00    	jmpq   *0x2023fa(%rip)        # 6030a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400ca6:	68 11 00 00 00       	pushq  $0x11
  400cab:	e9 d0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400cb0 <inet_pton@plt>:
  400cb0:	ff 25 f2 23 20 00    	jmpq   *0x2023f2(%rip)        # 6030a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400cb6:	68 12 00 00 00       	pushq  $0x12
  400cbb:	e9 c0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400cc0 <fflush@plt>:
  400cc0:	ff 25 ea 23 20 00    	jmpq   *0x2023ea(%rip)        # 6030b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400cc6:	68 13 00 00 00       	pushq  $0x13
  400ccb:	e9 b0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400cd0 <__isoc99_sscanf@plt>:
  400cd0:	ff 25 e2 23 20 00    	jmpq   *0x2023e2(%rip)        # 6030b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400cd6:	68 14 00 00 00       	pushq  $0x14
  400cdb:	e9 a0 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400ce0 <bcopy@plt>:
  400ce0:	ff 25 da 23 20 00    	jmpq   *0x2023da(%rip)        # 6030c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ce6:	68 15 00 00 00       	pushq  $0x15
  400ceb:	e9 90 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400cf0 <cuserid@plt>:
  400cf0:	ff 25 d2 23 20 00    	jmpq   *0x2023d2(%rip)        # 6030c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400cf6:	68 16 00 00 00       	pushq  $0x16
  400cfb:	e9 80 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d00 <fopen@plt>:
  400d00:	ff 25 ca 23 20 00    	jmpq   *0x2023ca(%rip)        # 6030d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400d06:	68 17 00 00 00       	pushq  $0x17
  400d0b:	e9 70 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d10 <strcat@plt>:
  400d10:	ff 25 c2 23 20 00    	jmpq   *0x2023c2(%rip)        # 6030d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400d16:	68 18 00 00 00       	pushq  $0x18
  400d1b:	e9 60 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d20 <sprintf@plt>:
  400d20:	ff 25 ba 23 20 00    	jmpq   *0x2023ba(%rip)        # 6030e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400d26:	68 19 00 00 00       	pushq  $0x19
  400d2b:	e9 50 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d30 <exit@plt>:
  400d30:	ff 25 b2 23 20 00    	jmpq   *0x2023b2(%rip)        # 6030e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400d36:	68 1a 00 00 00       	pushq  $0x1a
  400d3b:	e9 40 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d40 <connect@plt>:
  400d40:	ff 25 aa 23 20 00    	jmpq   *0x2023aa(%rip)        # 6030f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400d46:	68 1b 00 00 00       	pushq  $0x1b
  400d4b:	e9 30 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d50 <fwrite@plt>:
  400d50:	ff 25 a2 23 20 00    	jmpq   *0x2023a2(%rip)        # 6030f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400d56:	68 1c 00 00 00       	pushq  $0x1c
  400d5b:	e9 20 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d60 <sleep@plt>:
  400d60:	ff 25 9a 23 20 00    	jmpq   *0x20239a(%rip)        # 603100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400d66:	68 1d 00 00 00       	pushq  $0x1d
  400d6b:	e9 10 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d70 <__ctype_b_loc@plt>:
  400d70:	ff 25 92 23 20 00    	jmpq   *0x202392(%rip)        # 603108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400d76:	68 1e 00 00 00       	pushq  $0x1e
  400d7b:	e9 00 fe ff ff       	jmpq   400b80 <_init+0x18>

0000000000400d80 <socket@plt>:
  400d80:	ff 25 8a 23 20 00    	jmpq   *0x20238a(%rip)        # 603110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400d86:	68 1f 00 00 00       	pushq  $0x1f
  400d8b:	e9 f0 fd ff ff       	jmpq   400b80 <_init+0x18>

Disassembly of section .text:

0000000000400d90 <_start>:
  400d90:	31 ed                	xor    %ebp,%ebp
  400d92:	49 89 d1             	mov    %rdx,%r9
  400d95:	5e                   	pop    %rsi
  400d96:	48 89 e2             	mov    %rsp,%rdx
  400d99:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d9d:	50                   	push   %rax
  400d9e:	54                   	push   %rsp
  400d9f:	49 c7 c0 70 1e 40 00 	mov    $0x401e70,%r8
  400da6:	48 c7 c1 00 1e 40 00 	mov    $0x401e00,%rcx
  400dad:	48 c7 c7 86 0e 40 00 	mov    $0x400e86,%rdi
  400db4:	ff 15 36 22 20 00    	callq  *0x202236(%rip)        # 602ff0 <_DYNAMIC+0x1d0>
  400dba:	f4                   	hlt    
  400dbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400dc0 <deregister_tm_clones>:
  400dc0:	b8 a7 37 60 00       	mov    $0x6037a7,%eax
  400dc5:	55                   	push   %rbp
  400dc6:	48 2d a0 37 60 00    	sub    $0x6037a0,%rax
  400dcc:	48 83 f8 0e          	cmp    $0xe,%rax
  400dd0:	48 89 e5             	mov    %rsp,%rbp
  400dd3:	76 1b                	jbe    400df0 <deregister_tm_clones+0x30>
  400dd5:	b8 00 00 00 00       	mov    $0x0,%eax
  400dda:	48 85 c0             	test   %rax,%rax
  400ddd:	74 11                	je     400df0 <deregister_tm_clones+0x30>
  400ddf:	5d                   	pop    %rbp
  400de0:	bf a0 37 60 00       	mov    $0x6037a0,%edi
  400de5:	ff e0                	jmpq   *%rax
  400de7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400dee:	00 00 
  400df0:	5d                   	pop    %rbp
  400df1:	c3                   	retq   
  400df2:	0f 1f 40 00          	nopl   0x0(%rax)
  400df6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400dfd:	00 00 00 

0000000000400e00 <register_tm_clones>:
  400e00:	be a0 37 60 00       	mov    $0x6037a0,%esi
  400e05:	55                   	push   %rbp
  400e06:	48 81 ee a0 37 60 00 	sub    $0x6037a0,%rsi
  400e0d:	48 c1 fe 03          	sar    $0x3,%rsi
  400e11:	48 89 e5             	mov    %rsp,%rbp
  400e14:	48 89 f0             	mov    %rsi,%rax
  400e17:	48 c1 e8 3f          	shr    $0x3f,%rax
  400e1b:	48 01 c6             	add    %rax,%rsi
  400e1e:	48 d1 fe             	sar    %rsi
  400e21:	74 15                	je     400e38 <register_tm_clones+0x38>
  400e23:	b8 00 00 00 00       	mov    $0x0,%eax
  400e28:	48 85 c0             	test   %rax,%rax
  400e2b:	74 0b                	je     400e38 <register_tm_clones+0x38>
  400e2d:	5d                   	pop    %rbp
  400e2e:	bf a0 37 60 00       	mov    $0x6037a0,%edi
  400e33:	ff e0                	jmpq   *%rax
  400e35:	0f 1f 00             	nopl   (%rax)
  400e38:	5d                   	pop    %rbp
  400e39:	c3                   	retq   
  400e3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e40 <__do_global_dtors_aux>:
  400e40:	80 3d 71 29 20 00 00 	cmpb   $0x0,0x202971(%rip)        # 6037b8 <completed.6972>
  400e47:	75 11                	jne    400e5a <__do_global_dtors_aux+0x1a>
  400e49:	55                   	push   %rbp
  400e4a:	48 89 e5             	mov    %rsp,%rbp
  400e4d:	e8 6e ff ff ff       	callq  400dc0 <deregister_tm_clones>
  400e52:	5d                   	pop    %rbp
  400e53:	c6 05 5e 29 20 00 01 	movb   $0x1,0x20295e(%rip)        # 6037b8 <completed.6972>
  400e5a:	f3 c3                	repz retq 
  400e5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e60 <frame_dummy>:
  400e60:	bf 18 2e 60 00       	mov    $0x602e18,%edi
  400e65:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400e69:	75 05                	jne    400e70 <frame_dummy+0x10>
  400e6b:	eb 93                	jmp    400e00 <register_tm_clones>
  400e6d:	0f 1f 00             	nopl   (%rax)
  400e70:	b8 00 00 00 00       	mov    $0x0,%eax
  400e75:	48 85 c0             	test   %rax,%rax
  400e78:	74 f1                	je     400e6b <frame_dummy+0xb>
  400e7a:	55                   	push   %rbp
  400e7b:	48 89 e5             	mov    %rsp,%rbp
  400e7e:	ff d0                	callq  *%rax
  400e80:	5d                   	pop    %rbp
  400e81:	e9 7a ff ff ff       	jmpq   400e00 <register_tm_clones>

0000000000400e86 <main>:
  400e86:	53                   	push   %rbx
  400e87:	83 ff 01             	cmp    $0x1,%edi
  400e8a:	0f 84 f8 00 00 00    	je     400f88 <main+0x102>
  400e90:	48 89 f3             	mov    %rsi,%rbx
  400e93:	83 ff 02             	cmp    $0x2,%edi
  400e96:	0f 85 1c 01 00 00    	jne    400fb8 <main+0x132>
  400e9c:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400ea0:	48 8d 35 13 14 00 00 	lea    0x1413(%rip),%rsi        # 4022ba <array.3089+0x25a>
  400ea7:	e8 54 fe ff ff       	callq  400d00 <fopen@plt>
  400eac:	48 89 05 0d 29 20 00 	mov    %rax,0x20290d(%rip)        # 6037c0 <infile>
  400eb3:	48 85 c0             	test   %rax,%rax
  400eb6:	0f 84 df 00 00 00    	je     400f9b <main+0x115>
  400ebc:	e8 47 06 00 00       	callq  401508 <initialize_bomb>
  400ec1:	48 8d 3d 40 10 00 00 	lea    0x1040(%rip),%rdi        # 401f08 <_IO_stdin_used+0x88>
  400ec8:	e8 f3 fc ff ff       	callq  400bc0 <puts@plt>
  400ecd:	48 8d 3d 74 10 00 00 	lea    0x1074(%rip),%rdi        # 401f48 <_IO_stdin_used+0xc8>
  400ed4:	e8 e7 fc ff ff       	callq  400bc0 <puts@plt>
  400ed9:	e8 85 0d 00 00       	callq  401c63 <read_line>
  400ede:	48 89 c7             	mov    %rax,%rdi
  400ee1:	e8 f0 00 00 00       	callq  400fd6 <phase_1>
  400ee6:	e8 79 0e 00 00       	callq  401d64 <phase_defused>
  400eeb:	48 8d 3d 86 10 00 00 	lea    0x1086(%rip),%rdi        # 401f78 <_IO_stdin_used+0xf8>
  400ef2:	e8 c9 fc ff ff       	callq  400bc0 <puts@plt>
  400ef7:	e8 67 0d 00 00       	callq  401c63 <read_line>
  400efc:	48 89 c7             	mov    %rax,%rdi
  400eff:	e8 f2 00 00 00       	callq  400ff6 <phase_2>
  400f04:	e8 5b 0e 00 00       	callq  401d64 <phase_defused>
  400f09:	48 8d 3d ab 0f 00 00 	lea    0xfab(%rip),%rdi        # 401ebb <_IO_stdin_used+0x3b>
  400f10:	e8 ab fc ff ff       	callq  400bc0 <puts@plt>
  400f15:	e8 49 0d 00 00       	callq  401c63 <read_line>
  400f1a:	48 89 c7             	mov    %rax,%rdi
  400f1d:	e8 2b 01 00 00       	callq  40104d <phase_3>
  400f22:	e8 3d 0e 00 00       	callq  401d64 <phase_defused>
  400f27:	48 8d 3d ab 0f 00 00 	lea    0xfab(%rip),%rdi        # 401ed9 <_IO_stdin_used+0x59>
  400f2e:	e8 8d fc ff ff       	callq  400bc0 <puts@plt>
  400f33:	e8 2b 0d 00 00       	callq  401c63 <read_line>
  400f38:	48 89 c7             	mov    %rax,%rdi
  400f3b:	e8 f5 01 00 00       	callq  401135 <phase_4>
  400f40:	e8 1f 0e 00 00       	callq  401d64 <phase_defused>
  400f45:	48 8d 3d 5c 10 00 00 	lea    0x105c(%rip),%rdi        # 401fa8 <_IO_stdin_used+0x128>
  400f4c:	e8 6f fc ff ff       	callq  400bc0 <puts@plt>
  400f51:	e8 0d 0d 00 00       	callq  401c63 <read_line>
  400f56:	48 89 c7             	mov    %rax,%rdi
  400f59:	e8 1e 02 00 00       	callq  40117c <phase_5>
  400f5e:	e8 01 0e 00 00       	callq  401d64 <phase_defused>
  400f63:	48 8d 3d 7e 0f 00 00 	lea    0xf7e(%rip),%rdi        # 401ee8 <_IO_stdin_used+0x68>
  400f6a:	e8 51 fc ff ff       	callq  400bc0 <puts@plt>
  400f6f:	e8 ef 0c 00 00       	callq  401c63 <read_line>
  400f74:	48 89 c7             	mov    %rax,%rdi
  400f77:	e8 44 02 00 00       	callq  4011c0 <phase_6>
  400f7c:	e8 e3 0d 00 00       	callq  401d64 <phase_defused>
  400f81:	b8 00 00 00 00       	mov    $0x0,%eax
  400f86:	5b                   	pop    %rbx
  400f87:	c3                   	retq   
  400f88:	48 8b 05 21 28 20 00 	mov    0x202821(%rip),%rax        # 6037b0 <stdin@@GLIBC_2.2.5>
  400f8f:	48 89 05 2a 28 20 00 	mov    %rax,0x20282a(%rip)        # 6037c0 <infile>
  400f96:	e9 21 ff ff ff       	jmpq   400ebc <main+0x36>
  400f9b:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400f9f:	48 8b 33             	mov    (%rbx),%rsi
  400fa2:	48 8d 3d db 0e 00 00 	lea    0xedb(%rip),%rdi        # 401e84 <_IO_stdin_used+0x4>
  400fa9:	e8 52 fc ff ff       	callq  400c00 <printf@plt>
  400fae:	bf 08 00 00 00       	mov    $0x8,%edi
  400fb3:	e8 78 fd ff ff       	callq  400d30 <exit@plt>
  400fb8:	48 8b 36             	mov    (%rsi),%rsi
  400fbb:	48 8d 3d df 0e 00 00 	lea    0xedf(%rip),%rdi        # 401ea1 <_IO_stdin_used+0x21>
  400fc2:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc7:	e8 34 fc ff ff       	callq  400c00 <printf@plt>
  400fcc:	bf 08 00 00 00       	mov    $0x8,%edi
  400fd1:	e8 5a fd ff ff       	callq  400d30 <exit@plt>

0000000000400fd6 <phase_1>:
  400fd6:	48 83 ec 08          	sub    $0x8,%rsp
  400fda:	48 8d 35 ef 0f 00 00 	lea    0xfef(%rip),%rsi        # 401fd0 <_IO_stdin_used+0x150>
  400fe1:	e8 f0 03 00 00       	callq  4013d6 <strings_not_equal>
  400fe6:	85 c0                	test   %eax,%eax
  400fe8:	75 05                	jne    400fef <phase_1+0x19>
  400fea:	48 83 c4 08          	add    $0x8,%rsp
  400fee:	c3                   	retq   
  400fef:	e8 f2 0b 00 00       	callq  401be6 <explode_bomb>
  400ff4:	eb f4                	jmp    400fea <phase_1+0x14>

0000000000400ff6 <phase_2>:
  400ff6:	41 55                	push   %r13
  400ff8:	41 54                	push   %r12
  400ffa:	55                   	push   %rbp
  400ffb:	53                   	push   %rbx
  400ffc:	48 83 ec 28          	sub    $0x28,%rsp
  401000:	49 89 e4             	mov    %rsp,%r12
  401003:	48 89 e6             	mov    %rsp,%rsi
  401006:	e8 17 0c 00 00       	callq  401c22 <read_six_numbers>
  40100b:	48 89 e3             	mov    %rsp,%rbx
  40100e:	49 83 c4 0c          	add    $0xc,%r12
  401012:	bd 00 00 00 00       	mov    $0x0,%ebp
  401017:	eb 0d                	jmp    401026 <phase_2+0x30>

  401019:	41 03 6d 00          	add    0x0(%r13),%ebp
  40101d:	48 83 c3 04          	add    $0x4,%rbx
  401021:	4c 39 e3             	cmp    %r12,%rbx
  401024:	74 11                	je     401037 <phase_2+0x41>

  401026:	49 89 dd             	mov    %rbx,%r13
  401029:	8b 43 0c             	mov    0xc(%rbx),%eax
  40102c:	39 03                	cmp    %eax,(%rbx)
  40102e:	74 e9                	je     401019 <phase_2+0x23>
  401030:	e8 b1 0b 00 00       	callq  401be6 <explode_bomb>
  401035:	eb e2                	jmp    401019 <phase_2+0x23>
  
  401037:	85 ed                	test   %ebp,%ebp
  401039:	74 0b                	je     401046 <phase_2+0x50>
  40103b:	48 83 c4 28          	add    $0x28,%rsp
  40103f:	5b                   	pop    %rbx
  401040:	5d                   	pop    %rbp
  401041:	41 5c                	pop    %r12
  401043:	41 5d                	pop    %r13
  401045:	c3                   	retq   
  401046:	e8 9b 0b 00 00       	callq  401be6 <explode_bomb>
  40104b:	eb ee                	jmp    40103b <phase_2+0x45>

000000000040104d <phase_3>:
  40104d:	48 83 ec 18          	sub    $0x18,%rsp
  401051:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401056:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40105b:	48 8d 35 61 13 00 00 	lea    0x1361(%rip),%rsi        # 4023c3 <array.3089+0x363>
  401062:	b8 00 00 00 00       	mov    $0x0,%eax
  401067:	e8 64 fc ff ff       	callq  400cd0 <__isoc99_sscanf@plt>
  40106c:	83 f8 01             	cmp    $0x1,%eax
  40106f:	7e 1f                	jle    401090 <phase_3+0x43>
  401071:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  401076:	0f 87 87 00 00 00    	ja     401103 <phase_3+0xb6>
  40107c:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401080:	48 8d 15 b9 0f 00 00 	lea    0xfb9(%rip),%rdx        # 402040 <_IO_stdin_used+0x1c0>
  401087:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  40108b:	48 01 d0             	add    %rdx,%rax
  40108e:	ff e0                	jmpq   *%rax
  401090:	e8 51 0b 00 00       	callq  401be6 <explode_bomb>
  401095:	eb da                	jmp    401071 <phase_3+0x24>
  401097:	b8 e0 01 00 00       	mov    $0x1e0,%eax
  40109c:	eb 05                	jmp    4010a3 <phase_3+0x56>
  40109e:	b8 00 00 00 00       	mov    $0x0,%eax
  4010a3:	2d 0d 01 00 00       	sub    $0x10d,%eax
  4010a8:	05 3e 03 00 00       	add    $0x33e,%eax
  4010ad:	2d 23 01 00 00       	sub    $0x123,%eax
  4010b2:	83 c0 67             	add    $0x67,%eax
  4010b5:	2d 14 01 00 00       	sub    $0x114,%eax
  4010ba:	05 14 01 00 00       	add    $0x114,%eax
  4010bf:	83 e8 5b             	sub    $0x5b,%eax
  4010c2:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
  4010c7:	7f 06                	jg     4010cf <phase_3+0x82>
  4010c9:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  4010cd:	74 05                	je     4010d4 <phase_3+0x87>
  4010cf:	e8 12 0b 00 00       	callq  401be6 <explode_bomb>
  4010d4:	48 83 c4 18          	add    $0x18,%rsp
  4010d8:	c3                   	retq   
  4010d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4010de:	eb c8                	jmp    4010a8 <phase_3+0x5b>
  4010e0:	b8 00 00 00 00       	mov    $0x0,%eax
  4010e5:	eb c6                	jmp    4010ad <phase_3+0x60>
  4010e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ec:	eb c4                	jmp    4010b2 <phase_3+0x65>
  4010ee:	b8 00 00 00 00       	mov    $0x0,%eax
  4010f3:	eb c0                	jmp    4010b5 <phase_3+0x68>
  4010f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4010fa:	eb be                	jmp    4010ba <phase_3+0x6d>
  4010fc:	b8 00 00 00 00       	mov    $0x0,%eax
  401101:	eb bc                	jmp    4010bf <phase_3+0x72>
  401103:	e8 de 0a 00 00       	callq  401be6 <explode_bomb>
  401108:	b8 00 00 00 00       	mov    $0x0,%eax
  40110d:	eb b3                	jmp    4010c2 <phase_3+0x75>

000000000040110f <func4>:
  40110f:	b8 01 00 00 00       	mov    $0x1,%eax
  401114:	85 ff                	test   %edi,%edi
  401116:	7e 1b                	jle    401133 <func4+0x24>
  401118:	48 83 ec 08          	sub    $0x8,%rsp
  40111c:	83 ef 01             	sub    $0x1,%edi
  40111f:	e8 eb ff ff ff       	callq  40110f <func4>
  401124:	8d 14 c5 00 00 00 00 	lea    0x0(,%rax,8),%edx
  40112b:	29 c2                	sub    %eax,%edx
  40112d:	89 d0                	mov    %edx,%eax
  40112f:	48 83 c4 08          	add    $0x8,%rsp
  401133:	f3 c3                	repz retq 

0000000000401135 <phase_4>:
  401135:	48 83 ec 18          	sub    $0x18,%rsp
  401139:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40113e:	48 8d 35 81 12 00 00 	lea    0x1281(%rip),%rsi        # 4023c6 <array.3089+0x366>
  401145:	b8 00 00 00 00       	mov    $0x0,%eax
  40114a:	e8 81 fb ff ff       	callq  400cd0 <__isoc99_sscanf@plt>
  40114f:	83 f8 01             	cmp    $0x1,%eax
  401152:	74 1f                	je     401173 <phase_4+0x3e>
  401154:	e8 8d 0a 00 00       	callq  401be6 <explode_bomb>
  401159:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  40115d:	e8 ad ff ff ff       	callq  40110f <func4>
  401162:	3d 91 cb 01 00       	cmp    $0x1cb91,%eax
  401167:	74 05                	je     40116e <phase_4+0x39>
  401169:	e8 78 0a 00 00       	callq  401be6 <explode_bomb>
  40116e:	48 83 c4 18          	add    $0x18,%rsp
  401172:	c3                   	retq   
  401173:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401178:	7f df                	jg     401159 <phase_4+0x24>
  40117a:	eb d8                	jmp    401154 <phase_4+0x1f>

000000000040117c <phase_5>:
  40117c:	53                   	push   %rbx
  40117d:	48 89 fb             	mov    %rdi,%rbx
  401180:	e8 33 02 00 00       	callq  4013b8 <string_length>
  401185:	83 f8 06             	cmp    $0x6,%eax
  401188:	74 05                	je     40118f <phase_5+0x13>
  40118a:	e8 57 0a 00 00       	callq  401be6 <explode_bomb>
  40118f:	48 89 d8             	mov    %rbx,%rax
  401192:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
  401196:	b9 00 00 00 00       	mov    $0x0,%ecx
  40119b:	48 8d 35 be 0e 00 00 	lea    0xebe(%rip),%rsi        # 402060 <array.3089>
  4011a2:	0f b6 10             	movzbl (%rax),%edx
  4011a5:	83 e2 0f             	and    $0xf,%edx
  4011a8:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
  4011ab:	48 83 c0 01          	add    $0x1,%rax
  4011af:	48 39 f8             	cmp    %rdi,%rax
  4011b2:	75 ee                	jne    4011a2 <phase_5+0x26>
  4011b4:	83 f9 2f             	cmp    $0x2f,%ecx
  4011b7:	74 05                	je     4011be <phase_5+0x42>
  4011b9:	e8 28 0a 00 00       	callq  401be6 <explode_bomb>
  4011be:	5b                   	pop    %rbx
  4011bf:	c3                   	retq   

00000000004011c0 <phase_6>:
  4011c0:	41 55                	push   %r13
  4011c2:	41 54                	push   %r12
  4011c4:	55                   	push   %rbp
  4011c5:	53                   	push   %rbx
  4011c6:	48 83 ec 58          	sub    $0x58,%rsp
  4011ca:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  4011cf:	4c 89 e6             	mov    %r12,%rsi
  4011d2:	e8 4b 0a 00 00       	callq  401c22 <read_six_numbers>
  4011d7:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  4011dd:	eb 25                	jmp    401204 <phase_6+0x44>
  4011df:	41 83 c5 01          	add    $0x1,%r13d
  4011e3:	41 83 fd 06          	cmp    $0x6,%r13d
  4011e7:	74 38                	je     401221 <phase_6+0x61>
  4011e9:	44 89 eb             	mov    %r13d,%ebx
  4011ec:	48 63 c3             	movslq %ebx,%rax
  4011ef:	8b 44 84 30          	mov    0x30(%rsp,%rax,4),%eax
  4011f3:	39 45 00             	cmp    %eax,0x0(%rbp)
  4011f6:	74 22                	je     40121a <phase_6+0x5a>
  4011f8:	83 c3 01             	add    $0x1,%ebx
  4011fb:	83 fb 05             	cmp    $0x5,%ebx
  4011fe:	7e ec                	jle    4011ec <phase_6+0x2c>
  401200:	49 83 c4 04          	add    $0x4,%r12
  401204:	4c 89 e5             	mov    %r12,%rbp
  401207:	41 8b 04 24          	mov    (%r12),%eax
  40120b:	83 e8 01             	sub    $0x1,%eax
  40120e:	83 f8 05             	cmp    $0x5,%eax
  401211:	76 cc                	jbe    4011df <phase_6+0x1f>
  401213:	e8 ce 09 00 00       	callq  401be6 <explode_bomb>
  401218:	eb c5                	jmp    4011df <phase_6+0x1f>
  40121a:	e8 c7 09 00 00       	callq  401be6 <explode_bomb>
  40121f:	eb d7                	jmp    4011f8 <phase_6+0x38>
  401221:	be 00 00 00 00       	mov    $0x0,%esi
  401226:	8b 4c 34 30          	mov    0x30(%rsp,%rsi,1),%ecx
  40122a:	b8 01 00 00 00       	mov    $0x1,%eax
  40122f:	48 8d 15 1a 25 20 00 	lea    0x20251a(%rip),%rdx        # 603750 <node1>
  401236:	83 f9 01             	cmp    $0x1,%ecx
  401239:	7e 0b                	jle    401246 <phase_6+0x86>
  40123b:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  40123f:	83 c0 01             	add    $0x1,%eax
  401242:	39 c8                	cmp    %ecx,%eax
  401244:	75 f5                	jne    40123b <phase_6+0x7b>
  401246:	48 89 14 74          	mov    %rdx,(%rsp,%rsi,2)
  40124a:	48 83 c6 04          	add    $0x4,%rsi
  40124e:	48 83 fe 18          	cmp    $0x18,%rsi
  401252:	75 d2                	jne    401226 <phase_6+0x66>
  401254:	48 8b 1c 24          	mov    (%rsp),%rbx
  401258:	48 89 e0             	mov    %rsp,%rax
  40125b:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
  401260:	48 89 d9             	mov    %rbx,%rcx
  401263:	48 8b 50 08          	mov    0x8(%rax),%rdx
  401267:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  40126b:	48 83 c0 08          	add    $0x8,%rax
  40126f:	48 89 d1             	mov    %rdx,%rcx
  401272:	48 39 c6             	cmp    %rax,%rsi
  401275:	75 ec                	jne    401263 <phase_6+0xa3>
  401277:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  40127e:	00 
  40127f:	bd 05 00 00 00       	mov    $0x5,%ebp
  401284:	eb 09                	jmp    40128f <phase_6+0xcf>
  401286:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  40128a:	83 ed 01             	sub    $0x1,%ebp
  40128d:	74 11                	je     4012a0 <phase_6+0xe0>
  40128f:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401293:	8b 00                	mov    (%rax),%eax
  401295:	39 03                	cmp    %eax,(%rbx)
  401297:	7d ed                	jge    401286 <phase_6+0xc6>
  401299:	e8 48 09 00 00       	callq  401be6 <explode_bomb>
  40129e:	eb e6                	jmp    401286 <phase_6+0xc6>
  4012a0:	48 83 c4 58          	add    $0x58,%rsp
  4012a4:	5b                   	pop    %rbx
  4012a5:	5d                   	pop    %rbp
  4012a6:	41 5c                	pop    %r12
  4012a8:	41 5d                	pop    %r13
  4012aa:	c3                   	retq   

00000000004012ab <fun7>:
  4012ab:	48 85 ff             	test   %rdi,%rdi
  4012ae:	74 32                	je     4012e2 <fun7+0x37>
  4012b0:	48 83 ec 08          	sub    $0x8,%rsp
  4012b4:	8b 17                	mov    (%rdi),%edx
  4012b6:	39 f2                	cmp    %esi,%edx
  4012b8:	7f 1b                	jg     4012d5 <fun7+0x2a>
  4012ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4012bf:	39 f2                	cmp    %esi,%edx
  4012c1:	74 0d                	je     4012d0 <fun7+0x25>
  4012c3:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  4012c7:	e8 df ff ff ff       	callq  4012ab <fun7>
  4012cc:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  4012d0:	48 83 c4 08          	add    $0x8,%rsp
  4012d4:	c3                   	retq   
  4012d5:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  4012d9:	e8 cd ff ff ff       	callq  4012ab <fun7>
  4012de:	01 c0                	add    %eax,%eax
  4012e0:	eb ee                	jmp    4012d0 <fun7+0x25>
  4012e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4012e7:	c3                   	retq   

00000000004012e8 <secret_phase>:
  4012e8:	53                   	push   %rbx
  4012e9:	e8 75 09 00 00       	callq  401c63 <read_line>
  4012ee:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012f3:	be 00 00 00 00       	mov    $0x0,%esi
  4012f8:	48 89 c7             	mov    %rax,%rdi
  4012fb:	e8 a0 f9 ff ff       	callq  400ca0 <strtol@plt>
  401300:	48 89 c3             	mov    %rax,%rbx
  401303:	8d 40 ff             	lea    -0x1(%rax),%eax
  401306:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  40130b:	77 2b                	ja     401338 <secret_phase+0x50>
  40130d:	89 de                	mov    %ebx,%esi
  40130f:	48 8d 3d 5a 23 20 00 	lea    0x20235a(%rip),%rdi        # 603670 <n1>
  401316:	e8 90 ff ff ff       	callq  4012ab <fun7>
  40131b:	83 f8 01             	cmp    $0x1,%eax
  40131e:	74 05                	je     401325 <secret_phase+0x3d>
  401320:	e8 c1 08 00 00       	callq  401be6 <explode_bomb>
  401325:	48 8d 3d dc 0c 00 00 	lea    0xcdc(%rip),%rdi        # 402008 <_IO_stdin_used+0x188>
  40132c:	e8 8f f8 ff ff       	callq  400bc0 <puts@plt>
  401331:	e8 2e 0a 00 00       	callq  401d64 <phase_defused>
  401336:	5b                   	pop    %rbx
  401337:	c3                   	retq   
  401338:	e8 a9 08 00 00       	callq  401be6 <explode_bomb>
  40133d:	eb ce                	jmp    40130d <secret_phase+0x25>

000000000040133f <sig_handler>:
  40133f:	48 83 ec 08          	sub    $0x8,%rsp
  401343:	48 8d 3d 56 0d 00 00 	lea    0xd56(%rip),%rdi        # 4020a0 <array.3089+0x40>
  40134a:	e8 71 f8 ff ff       	callq  400bc0 <puts@plt>
  40134f:	bf 03 00 00 00       	mov    $0x3,%edi
  401354:	e8 07 fa ff ff       	callq  400d60 <sleep@plt>
  401359:	48 8d 3d 78 0e 00 00 	lea    0xe78(%rip),%rdi        # 4021d8 <array.3089+0x178>
  401360:	b8 00 00 00 00       	mov    $0x0,%eax
  401365:	e8 96 f8 ff ff       	callq  400c00 <printf@plt>
  40136a:	48 8b 3d 2f 24 20 00 	mov    0x20242f(%rip),%rdi        # 6037a0 <__TMC_END__>
  401371:	e8 4a f9 ff ff       	callq  400cc0 <fflush@plt>
  401376:	bf 01 00 00 00       	mov    $0x1,%edi
  40137b:	e8 e0 f9 ff ff       	callq  400d60 <sleep@plt>
  401380:	48 8d 3d 59 0e 00 00 	lea    0xe59(%rip),%rdi        # 4021e0 <array.3089+0x180>
  401387:	e8 34 f8 ff ff       	callq  400bc0 <puts@plt>
  40138c:	bf 10 00 00 00       	mov    $0x10,%edi
  401391:	e8 9a f9 ff ff       	callq  400d30 <exit@plt>

0000000000401396 <invalid_phase>:
  401396:	48 83 ec 08          	sub    $0x8,%rsp
  40139a:	48 89 fe             	mov    %rdi,%rsi
  40139d:	48 8d 3d 44 0e 00 00 	lea    0xe44(%rip),%rdi        # 4021e8 <array.3089+0x188>
  4013a4:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a9:	e8 52 f8 ff ff       	callq  400c00 <printf@plt>
  4013ae:	bf 08 00 00 00       	mov    $0x8,%edi
  4013b3:	e8 78 f9 ff ff       	callq  400d30 <exit@plt>

00000000004013b8 <string_length>:
  4013b8:	80 3f 00             	cmpb   $0x0,(%rdi)
  4013bb:	74 13                	je     4013d0 <string_length+0x18>
  4013bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4013c2:	48 83 c7 01          	add    $0x1,%rdi
  4013c6:	83 c0 01             	add    $0x1,%eax
  4013c9:	80 3f 00             	cmpb   $0x0,(%rdi)
  4013cc:	75 f4                	jne    4013c2 <string_length+0xa>
  4013ce:	f3 c3                	repz retq 
  4013d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4013d5:	c3                   	retq   

00000000004013d6 <strings_not_equal>:
  4013d6:	41 54                	push   %r12
  4013d8:	55                   	push   %rbp
  4013d9:	53                   	push   %rbx
  4013da:	48 89 fb             	mov    %rdi,%rbx
  4013dd:	48 89 f5             	mov    %rsi,%rbp
  4013e0:	e8 d3 ff ff ff       	callq  4013b8 <string_length>
  4013e5:	41 89 c4             	mov    %eax,%r12d
  4013e8:	48 89 ef             	mov    %rbp,%rdi
  4013eb:	e8 c8 ff ff ff       	callq  4013b8 <string_length>
  4013f0:	ba 01 00 00 00       	mov    $0x1,%edx
  4013f5:	41 39 c4             	cmp    %eax,%r12d
  4013f8:	74 07                	je     401401 <strings_not_equal+0x2b>

  4013fa:	89 d0                	mov    %edx,%eax
  4013fc:	5b                   	pop    %rbx
  4013fd:	5d                   	pop    %rbp
  4013fe:	41 5c                	pop    %r12
  401400:	c3                   	retq   

  401401:	0f b6 03             	movzbl (%rbx),%eax  
  401404:	84 c0                	test   %al,%al
  401406:	74 27                	je     40142f <strings_not_equal+0x59>
  401408:	3a 45 00             	cmp    0x0(%rbp),%al
  40140b:	75 29                	jne    401436 <strings_not_equal+0x60>
  40140d:	48 83 c3 01          	add    $0x1,%rbx
  401411:	48 83 c5 01          	add    $0x1,%rbp
  401415:	0f b6 03             	movzbl (%rbx),%eax
  401418:	84 c0                	test   %al,%al
  40141a:	74 0c                	je     401428 <strings_not_equal+0x52>
  40141c:	3a 45 00             	cmp    0x0(%rbp),%al
  40141f:	74 ec                	je     40140d <strings_not_equal+0x37>
  401421:	ba 01 00 00 00       	mov    $0x1,%edx
  401426:	eb d2                	jmp    4013fa <strings_not_equal+0x24>
  401428:	ba 00 00 00 00       	mov    $0x0,%edx
  40142d:	eb cb                	jmp    4013fa <strings_not_equal+0x24>
  
  40142f:	ba 00 00 00 00       	mov    $0x0,%edx
  401434:	eb c4                	jmp    4013fa <strings_not_equal+0x24>
  401436:	ba 01 00 00 00       	mov    $0x1,%edx
  40143b:	eb bd                	jmp    4013fa <strings_not_equal+0x24>

000000000040143d <open_clientfd>:
  40143d:	41 54                	push   %r12
  40143f:	55                   	push   %rbp
  401440:	53                   	push   %rbx
  401441:	48 83 ec 10          	sub    $0x10,%rsp
  401445:	49 89 fc             	mov    %rdi,%r12
  401448:	89 f3                	mov    %esi,%ebx
  40144a:	ba 00 00 00 00       	mov    $0x0,%edx
  40144f:	be 01 00 00 00       	mov    $0x1,%esi
  401454:	bf 02 00 00 00       	mov    $0x2,%edi
  401459:	e8 22 f9 ff ff       	callq  400d80 <socket@plt>
  40145e:	85 c0                	test   %eax,%eax
  401460:	78 64                	js     4014c6 <open_clientfd+0x89>
  401462:	89 c5                	mov    %eax,%ebp
  401464:	4c 89 e7             	mov    %r12,%rdi
  401467:	e8 14 f8 ff ff       	callq  400c80 <gethostbyname@plt>
  40146c:	48 85 c0             	test   %rax,%rax
  40146f:	74 6b                	je     4014dc <open_clientfd+0x9f>
  401471:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  401478:	00 
  401479:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401480:	00 00 
  401482:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  401488:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40148c:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  401491:	48 8b 40 18          	mov    0x18(%rax),%rax
  401495:	48 8b 38             	mov    (%rax),%rdi
  401498:	e8 43 f8 ff ff       	callq  400ce0 <bcopy@plt>
  40149d:	89 de                	mov    %ebx,%esi
  40149f:	66 c1 ce 08          	ror    $0x8,%si
  4014a3:	66 89 74 24 02       	mov    %si,0x2(%rsp)
  4014a8:	ba 10 00 00 00       	mov    $0x10,%edx
  4014ad:	48 89 e6             	mov    %rsp,%rsi
  4014b0:	89 ef                	mov    %ebp,%edi
  4014b2:	e8 89 f8 ff ff       	callq  400d40 <connect@plt>
  4014b7:	85 c0                	test   %eax,%eax
  4014b9:	78 37                	js     4014f2 <open_clientfd+0xb5>
  4014bb:	89 e8                	mov    %ebp,%eax
  4014bd:	48 83 c4 10          	add    $0x10,%rsp
  4014c1:	5b                   	pop    %rbx
  4014c2:	5d                   	pop    %rbp
  4014c3:	41 5c                	pop    %r12
  4014c5:	c3                   	retq   
  4014c6:	48 8d 3d 2c 0d 00 00 	lea    0xd2c(%rip),%rdi        # 4021f9 <array.3089+0x199>
  4014cd:	e8 ee f6 ff ff       	callq  400bc0 <puts@plt>
  4014d2:	bf 08 00 00 00       	mov    $0x8,%edi
  4014d7:	e8 54 f8 ff ff       	callq  400d30 <exit@plt>
  4014dc:	48 8d 3d 24 0d 00 00 	lea    0xd24(%rip),%rdi        # 402207 <array.3089+0x1a7>
  4014e3:	e8 d8 f6 ff ff       	callq  400bc0 <puts@plt>
  4014e8:	bf 08 00 00 00       	mov    $0x8,%edi
  4014ed:	e8 3e f8 ff ff       	callq  400d30 <exit@plt>
  4014f2:	48 8d 3d 1c 0d 00 00 	lea    0xd1c(%rip),%rdi        # 402215 <array.3089+0x1b5>
  4014f9:	e8 c2 f6 ff ff       	callq  400bc0 <puts@plt>
  4014fe:	bf 08 00 00 00       	mov    $0x8,%edi
  401503:	e8 28 f8 ff ff       	callq  400d30 <exit@plt>

0000000000401508 <initialize_bomb>:
  401508:	48 83 ec 08          	sub    $0x8,%rsp
  40150c:	48 8d 35 2c fe ff ff 	lea    -0x1d4(%rip),%rsi        # 40133f <sig_handler>
  401513:	bf 02 00 00 00       	mov    $0x2,%edi
  401518:	e8 53 f7 ff ff       	callq  400c70 <signal@plt>
  40151d:	be 50 00 00 00       	mov    $0x50,%esi
  401522:	48 8d 3d fa 0c 00 00 	lea    0xcfa(%rip),%rdi        # 402223 <array.3089+0x1c3>
  401529:	e8 0f ff ff ff       	callq  40143d <open_clientfd>
  40152e:	89 c7                	mov    %eax,%edi
  401530:	e8 fb f6 ff ff       	callq  400c30 <close@plt>
  401535:	48 83 c4 08          	add    $0x8,%rsp
  401539:	c3                   	retq   

000000000040153a <blank_line>:
  40153a:	55                   	push   %rbp
  40153b:	53                   	push   %rbx
  40153c:	48 83 ec 08          	sub    $0x8,%rsp
  401540:	48 89 fd             	mov    %rdi,%rbp
  401543:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401547:	84 db                	test   %bl,%bl
  401549:	74 1e                	je     401569 <blank_line+0x2f>
  40154b:	e8 20 f8 ff ff       	callq  400d70 <__ctype_b_loc@plt>
  401550:	48 83 c5 01          	add    $0x1,%rbp
  401554:	48 0f be db          	movsbq %bl,%rbx
  401558:	48 8b 00             	mov    (%rax),%rax
  40155b:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  401560:	75 e1                	jne    401543 <blank_line+0x9>
  401562:	b8 00 00 00 00       	mov    $0x0,%eax
  401567:	eb 05                	jmp    40156e <blank_line+0x34>
  401569:	b8 01 00 00 00       	mov    $0x1,%eax
  40156e:	48 83 c4 08          	add    $0x8,%rsp
  401572:	5b                   	pop    %rbx
  401573:	5d                   	pop    %rbp
  401574:	c3                   	retq   

0000000000401575 <skip>:
  401575:	55                   	push   %rbp
  401576:	53                   	push   %rbx
  401577:	48 83 ec 08          	sub    $0x8,%rsp
  40157b:	48 8d 2d 5e 22 20 00 	lea    0x20225e(%rip),%rbp        # 6037e0 <input_strings>
  401582:	48 63 05 33 22 20 00 	movslq 0x202233(%rip),%rax        # 6037bc <num_input_strings>
  401589:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  40158d:	48 c1 e7 04          	shl    $0x4,%rdi
  401591:	48 01 ef             	add    %rbp,%rdi
  401594:	48 8b 15 25 22 20 00 	mov    0x202225(%rip),%rdx        # 6037c0 <infile>
  40159b:	be 50 00 00 00       	mov    $0x50,%esi
  4015a0:	e8 ab f6 ff ff       	callq  400c50 <fgets@plt>
  4015a5:	48 89 c3             	mov    %rax,%rbx
  4015a8:	48 85 c0             	test   %rax,%rax
  4015ab:	74 0c                	je     4015b9 <skip+0x44>
  4015ad:	48 89 c7             	mov    %rax,%rdi
  4015b0:	e8 85 ff ff ff       	callq  40153a <blank_line>
  4015b5:	85 c0                	test   %eax,%eax
  4015b7:	75 c9                	jne    401582 <skip+0xd>
  4015b9:	48 89 d8             	mov    %rbx,%rax
  4015bc:	48 83 c4 08          	add    $0x8,%rsp
  4015c0:	5b                   	pop    %rbx
  4015c1:	5d                   	pop    %rbp
  4015c2:	c3                   	retq   

00000000004015c3 <writen>:
  4015c3:	41 56                	push   %r14
  4015c5:	41 55                	push   %r13
  4015c7:	41 54                	push   %r12
  4015c9:	55                   	push   %rbp
  4015ca:	53                   	push   %rbx
  4015cb:	49 89 d5             	mov    %rdx,%r13
  4015ce:	48 85 d2             	test   %rdx,%rdx
  4015d1:	74 3b                	je     40160e <writen+0x4b>
  4015d3:	41 89 fc             	mov    %edi,%r12d
  4015d6:	48 89 f5             	mov    %rsi,%rbp
  4015d9:	48 89 d3             	mov    %rdx,%rbx
  4015dc:	41 be 00 00 00 00    	mov    $0x0,%r14d
  4015e2:	eb 08                	jmp    4015ec <writen+0x29>
  4015e4:	48 01 c5             	add    %rax,%rbp
  4015e7:	48 29 c3             	sub    %rax,%rbx
  4015ea:	74 22                	je     40160e <writen+0x4b>
  4015ec:	48 89 da             	mov    %rbx,%rdx
  4015ef:	48 89 ee             	mov    %rbp,%rsi
  4015f2:	44 89 e7             	mov    %r12d,%edi
  4015f5:	e8 d6 f5 ff ff       	callq  400bd0 <write@plt>
  4015fa:	48 85 c0             	test   %rax,%rax
  4015fd:	7f e5                	jg     4015e4 <writen+0x21>
  4015ff:	e8 9c f5 ff ff       	callq  400ba0 <__errno_location@plt>
  401604:	83 38 04             	cmpl   $0x4,(%rax)
  401607:	75 11                	jne    40161a <writen+0x57>
  401609:	4c 89 f0             	mov    %r14,%rax
  40160c:	eb d6                	jmp    4015e4 <writen+0x21>
  40160e:	4c 89 e8             	mov    %r13,%rax
  401611:	5b                   	pop    %rbx
  401612:	5d                   	pop    %rbp
  401613:	41 5c                	pop    %r12
  401615:	41 5d                	pop    %r13
  401617:	41 5e                	pop    %r14
  401619:	c3                   	retq   
  40161a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401621:	eb ee                	jmp    401611 <writen+0x4e>

0000000000401623 <send_msg>:
  401623:	41 57                	push   %r15
  401625:	41 56                	push   %r14
  401627:	41 55                	push   %r13
  401629:	41 54                	push   %r12
  40162b:	55                   	push   %rbp
  40162c:	53                   	push   %rbx
  40162d:	48 81 ec 68 24 00 00 	sub    $0x2468,%rsp
  401634:	41 89 fc             	mov    %edi,%r12d
  401637:	ba 00 00 00 00       	mov    $0x0,%edx
  40163c:	be 01 00 00 00       	mov    $0x1,%esi
  401641:	bf 02 00 00 00       	mov    $0x2,%edi
  401646:	e8 35 f7 ff ff       	callq  400d80 <socket@plt>
  40164b:	41 89 c7             	mov    %eax,%r15d
  40164e:	85 c0                	test   %eax,%eax
  401650:	0f 88 2a 02 00 00    	js     401880 <send_msg+0x25d>
  401656:	48 c7 84 24 50 24 00 	movq   $0x0,0x2450(%rsp)
  40165d:	00 00 00 00 00 
  401662:	48 c7 84 24 58 24 00 	movq   $0x0,0x2458(%rsp)
  401669:	00 00 00 00 00 
  40166e:	66 c7 84 24 50 24 00 	movw   $0x2,0x2450(%rsp)
  401675:	00 02 00 
  401678:	66 c7 84 24 52 24 00 	movw   $0x7ac8,0x2452(%rsp)
  40167f:	00 c8 7a 
  401682:	48 8d 94 24 54 24 00 	lea    0x2454(%rsp),%rdx
  401689:	00 
  40168a:	48 8d 35 92 0b 00 00 	lea    0xb92(%rip),%rsi        # 402223 <array.3089+0x1c3>
  401691:	bf 02 00 00 00       	mov    $0x2,%edi
  401696:	b8 00 00 00 00       	mov    $0x0,%eax
  40169b:	e8 10 f6 ff ff       	callq  400cb0 <inet_pton@plt>
  4016a0:	85 c0                	test   %eax,%eax
  4016a2:	0f 88 09 02 00 00    	js     4018b1 <send_msg+0x28e>
  4016a8:	48 8d b4 24 50 24 00 	lea    0x2450(%rsp),%rsi
  4016af:	00 
  4016b0:	ba 10 00 00 00       	mov    $0x10,%edx
  4016b5:	44 89 ff             	mov    %r15d,%edi
  4016b8:	e8 83 f6 ff ff       	callq  400d40 <connect@plt>
  4016bd:	85 c0                	test   %eax,%eax
  4016bf:	0f 88 22 02 00 00    	js     4018e7 <send_msg+0x2c4>
  4016c5:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  4016ca:	48 b8 53 75 62 6a 65 	movabs $0x3a7463656a627553,%rax
  4016d1:	63 74 3a 
  4016d4:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
  4016d9:	48 b8 20 42 6f 6d 62 	movabs $0x6f6e20626d6f4220,%rax
  4016e0:	20 6e 6f 
  4016e3:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  4016e8:	48 b8 74 69 66 69 63 	movabs $0x6974616369666974,%rax
  4016ef:	61 74 69 
  4016f2:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  4016f7:	c7 44 24 68 6f 6e 0a 	movl   $0xa6e6f,0x68(%rsp)
  4016fe:	00 
  4016ff:	48 8d 9c 24 50 04 00 	lea    0x450(%rsp),%rbx
  401706:	00 
  401707:	48 89 ee             	mov    %rbp,%rsi
  40170a:	48 89 df             	mov    %rbx,%rdi
  40170d:	e8 fe f5 ff ff       	callq  400d10 <strcat@plt>
  401712:	66 c7 44 24 50 0a 00 	movw   $0xa,0x50(%rsp)
  401719:	48 89 ee             	mov    %rbp,%rsi
  40171c:	48 89 df             	mov    %rbx,%rdi
  40171f:	e8 ec f5 ff ff       	callq  400d10 <strcat@plt>
  401724:	bf 00 00 00 00       	mov    $0x0,%edi
  401729:	e8 c2 f5 ff ff       	callq  400cf0 <cuserid@plt>
  40172e:	48 85 c0             	test   %rax,%rax
  401731:	0f 84 e6 01 00 00    	je     40191d <send_msg+0x2fa>
  401737:	48 89 e7             	mov    %rsp,%rdi
  40173a:	48 89 c6             	mov    %rax,%rsi
  40173d:	e8 6e f4 ff ff       	callq  400bb0 <strcpy@plt>
  401742:	45 85 e4             	test   %r12d,%r12d
  401745:	48 8d 05 ed 0a 00 00 	lea    0xaed(%rip),%rax        # 402239 <array.3089+0x1d9>
  40174c:	4c 8d 0d de 0a 00 00 	lea    0xade(%rip),%r9        # 402231 <array.3089+0x1d1>
  401753:	4c 0f 44 c8          	cmove  %rax,%r9
  401757:	48 8d 5c 24 50       	lea    0x50(%rsp),%rbx
  40175c:	48 83 ec 08          	sub    $0x8,%rsp
  401760:	8b 05 56 20 20 00    	mov    0x202056(%rip),%eax        # 6037bc <num_input_strings>
  401766:	50                   	push   %rax
  401767:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40176c:	8b 0d ee 1e 20 00    	mov    0x201eee(%rip),%ecx        # 603660 <bomb_id>
  401772:	48 8d 15 e7 1a 20 00 	lea    0x201ae7(%rip),%rdx        # 603260 <lab_id>
  401779:	48 8d 35 dd 0a 00 00 	lea    0xadd(%rip),%rsi        # 40225d <array.3089+0x1fd>
  401780:	48 89 df             	mov    %rbx,%rdi
  401783:	b8 00 00 00 00       	mov    $0x0,%eax
  401788:	e8 93 f5 ff ff       	callq  400d20 <sprintf@plt>
  40178d:	48 8d bc 24 60 04 00 	lea    0x460(%rsp),%rdi
  401794:	00 
  401795:	48 89 de             	mov    %rbx,%rsi
  401798:	e8 73 f5 ff ff       	callq  400d10 <strcat@plt>
  40179d:	48 83 c4 10          	add    $0x10,%rsp
  4017a1:	83 3d 14 20 20 00 00 	cmpl   $0x0,0x202014(%rip)        # 6037bc <num_input_strings>
  4017a8:	7e 70                	jle    40181a <send_msg+0x1f7>
  4017aa:	bb 00 00 00 00       	mov    $0x0,%ebx
  4017af:	4c 8d 35 2a 20 20 00 	lea    0x20202a(%rip),%r14        # 6037e0 <input_strings>
  4017b6:	49 89 e5             	mov    %rsp,%r13
  4017b9:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  4017be:	4c 8d a4 24 50 04 00 	lea    0x450(%rsp),%r12
  4017c5:	00 
  4017c6:	48 63 c3             	movslq %ebx,%rax
  4017c9:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4017cd:	48 c1 e0 04          	shl    $0x4,%rax
  4017d1:	4c 01 f0             	add    %r14,%rax
  4017d4:	83 c3 01             	add    $0x1,%ebx
  4017d7:	48 83 ec 08          	sub    $0x8,%rsp
  4017db:	50                   	push   %rax
  4017dc:	41 89 d9             	mov    %ebx,%r9d
  4017df:	4d 89 e8             	mov    %r13,%r8
  4017e2:	8b 0d 78 1e 20 00    	mov    0x201e78(%rip),%ecx        # 603660 <bomb_id>
  4017e8:	48 8d 15 71 1a 20 00 	lea    0x201a71(%rip),%rdx        # 603260 <lab_id>
  4017ef:	48 8d 35 83 0a 00 00 	lea    0xa83(%rip),%rsi        # 402279 <array.3089+0x219>
  4017f6:	48 89 ef             	mov    %rbp,%rdi
  4017f9:	b8 00 00 00 00       	mov    $0x0,%eax
  4017fe:	e8 1d f5 ff ff       	callq  400d20 <sprintf@plt>
  401803:	48 89 ee             	mov    %rbp,%rsi
  401806:	4c 89 e7             	mov    %r12,%rdi
  401809:	e8 02 f5 ff ff       	callq  400d10 <strcat@plt>
  40180e:	48 83 c4 10          	add    $0x10,%rsp
  401812:	39 1d a4 1f 20 00    	cmp    %ebx,0x201fa4(%rip)        # 6037bc <num_input_strings>
  401818:	7f ac                	jg     4017c6 <send_msg+0x1a3>
  40181a:	48 8d ac 24 50 04 00 	lea    0x450(%rsp),%rbp
  401821:	00 
  401822:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
  401829:	bb 00 00 00 00       	mov    $0x0,%ebx
  40182e:	4c 89 e1             	mov    %r12,%rcx
  401831:	48 89 ef             	mov    %rbp,%rdi
  401834:	89 d8                	mov    %ebx,%eax
  401836:	f2 ae                	repnz scas %es:(%rdi),%al
  401838:	48 f7 d1             	not    %rcx
  40183b:	4a 8d 14 21          	lea    (%rcx,%r12,1),%rdx
  40183f:	48 89 ee             	mov    %rbp,%rsi
  401842:	44 89 ff             	mov    %r15d,%edi
  401845:	e8 79 fd ff ff       	callq  4015c3 <writen>
  40184a:	48 89 c2             	mov    %rax,%rdx
  40184d:	4c 89 e1             	mov    %r12,%rcx
  401850:	48 89 ef             	mov    %rbp,%rdi
  401853:	89 d8                	mov    %ebx,%eax
  401855:	f2 ae                	repnz scas %es:(%rdi),%al
  401857:	48 f7 d1             	not    %rcx
  40185a:	4c 01 e1             	add    %r12,%rcx
  40185d:	48 39 ca             	cmp    %rcx,%rdx
  401860:	0f 82 cf 00 00 00    	jb     401935 <send_msg+0x312>
  401866:	44 89 ff             	mov    %r15d,%edi
  401869:	e8 c2 f3 ff ff       	callq  400c30 <close@plt>
  40186e:	48 81 c4 68 24 00 00 	add    $0x2468,%rsp
  401875:	5b                   	pop    %rbx
  401876:	5d                   	pop    %rbp
  401877:	41 5c                	pop    %r12
  401879:	41 5d                	pop    %r13
  40187b:	41 5e                	pop    %r14
  40187d:	41 5f                	pop    %r15
  40187f:	c3                   	retq   
  401880:	48 8d 15 bb 09 00 00 	lea    0x9bb(%rip),%rdx        # 402242 <array.3089+0x1e2>
  401887:	48 8d 35 0f 06 00 00 	lea    0x60f(%rip),%rsi        # 401e9d <_IO_stdin_used+0x1d>
  40188e:	48 8b 3d 0b 1f 20 00 	mov    0x201f0b(%rip),%rdi        # 6037a0 <__TMC_END__>
  401895:	b8 00 00 00 00       	mov    $0x0,%eax
  40189a:	e8 f1 f3 ff ff       	callq  400c90 <fprintf@plt>
  40189f:	44 89 ff             	mov    %r15d,%edi
  4018a2:	e8 89 f3 ff ff       	callq  400c30 <close@plt>
  4018a7:	bf 01 00 00 00       	mov    $0x1,%edi
  4018ac:	e8 7f f4 ff ff       	callq  400d30 <exit@plt>
  4018b1:	48 8d 15 fe 09 00 00 	lea    0x9fe(%rip),%rdx        # 4022b6 <array.3089+0x256>
  4018b8:	48 8d 35 de 05 00 00 	lea    0x5de(%rip),%rsi        # 401e9d <_IO_stdin_used+0x1d>
  4018bf:	48 8b 3d da 1e 20 00 	mov    0x201eda(%rip),%rdi        # 6037a0 <__TMC_END__>
  4018c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4018cb:	e8 c0 f3 ff ff       	callq  400c90 <fprintf@plt>
  4018d0:	45 85 ff             	test   %r15d,%r15d
  4018d3:	74 08                	je     4018dd <send_msg+0x2ba>
  4018d5:	44 89 ff             	mov    %r15d,%edi
  4018d8:	e8 53 f3 ff ff       	callq  400c30 <close@plt>
  4018dd:	bf 01 00 00 00       	mov    $0x1,%edi
  4018e2:	e8 49 f4 ff ff       	callq  400d30 <exit@plt>
  4018e7:	48 8d 15 61 09 00 00 	lea    0x961(%rip),%rdx        # 40224f <array.3089+0x1ef>
  4018ee:	48 8d 35 a8 05 00 00 	lea    0x5a8(%rip),%rsi        # 401e9d <_IO_stdin_used+0x1d>
  4018f5:	48 8b 3d a4 1e 20 00 	mov    0x201ea4(%rip),%rdi        # 6037a0 <__TMC_END__>
  4018fc:	b8 00 00 00 00       	mov    $0x0,%eax
  401901:	e8 8a f3 ff ff       	callq  400c90 <fprintf@plt>
  401906:	45 85 ff             	test   %r15d,%r15d
  401909:	74 08                	je     401913 <send_msg+0x2f0>
  40190b:	44 89 ff             	mov    %r15d,%edi
  40190e:	e8 1d f3 ff ff       	callq  400c30 <close@plt>
  401913:	bf 01 00 00 00       	mov    $0x1,%edi
  401918:	e8 13 f4 ff ff       	callq  400d30 <exit@plt>
  40191d:	c7 04 24 6e 6f 62 6f 	movl   $0x6f626f6e,(%rsp)
  401924:	66 c7 44 24 04 64 79 	movw   $0x7964,0x4(%rsp)
  40192b:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  401930:	e9 0d fe ff ff       	jmpq   401742 <send_msg+0x11f>
  401935:	48 8d 15 59 09 00 00 	lea    0x959(%rip),%rdx        # 402295 <array.3089+0x235>
  40193c:	48 8d 35 5a 05 00 00 	lea    0x55a(%rip),%rsi        # 401e9d <_IO_stdin_used+0x1d>
  401943:	48 8b 3d 56 1e 20 00 	mov    0x201e56(%rip),%rdi        # 6037a0 <__TMC_END__>
  40194a:	e8 41 f3 ff ff       	callq  400c90 <fprintf@plt>
  40194f:	45 85 ff             	test   %r15d,%r15d
  401952:	74 08                	je     40195c <send_msg+0x339>
  401954:	44 89 ff             	mov    %r15d,%edi
  401957:	e8 d4 f2 ff ff       	callq  400c30 <close@plt>
  40195c:	bf 01 00 00 00       	mov    $0x1,%edi
  401961:	e8 ca f3 ff ff       	callq  400d30 <exit@plt>

0000000000401966 <send_msg_2>:
  401966:	41 57                	push   %r15
  401968:	41 56                	push   %r14
  40196a:	41 55                	push   %r13
  40196c:	41 54                	push   %r12
  40196e:	55                   	push   %rbp
  40196f:	53                   	push   %rbx
  401970:	48 83 ec 68          	sub    $0x68,%rsp
  401974:	89 fb                	mov    %edi,%ebx
  401976:	bf 00 00 00 00       	mov    $0x0,%edi
  40197b:	e8 a0 f2 ff ff       	callq  400c20 <dup@plt>
  401980:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401984:	83 f8 ff             	cmp    $0xffffffff,%eax
  401987:	0f 84 a6 01 00 00    	je     401b33 <send_msg_2+0x1cd>
  40198d:	bf 00 00 00 00       	mov    $0x0,%edi
  401992:	e8 99 f2 ff ff       	callq  400c30 <close@plt>
  401997:	83 f8 ff             	cmp    $0xffffffff,%eax
  40199a:	0f 84 a9 01 00 00    	je     401b49 <send_msg_2+0x1e3>
  4019a0:	e8 bb f2 ff ff       	callq  400c60 <tmpfile@plt>
  4019a5:	48 89 c5             	mov    %rax,%rbp
  4019a8:	48 85 c0             	test   %rax,%rax
  4019ab:	0f 84 ae 01 00 00    	je     401b5f <send_msg_2+0x1f9>
  4019b1:	48 89 c1             	mov    %rax,%rcx
  4019b4:	ba 1b 00 00 00       	mov    $0x1b,%edx
  4019b9:	be 01 00 00 00       	mov    $0x1,%esi
  4019be:	48 8d 3d 1f 09 00 00 	lea    0x91f(%rip),%rdi        # 4022e4 <array.3089+0x284>
  4019c5:	e8 86 f3 ff ff       	callq  400d50 <fwrite@plt>
  4019ca:	48 89 ee             	mov    %rbp,%rsi
  4019cd:	bf 0a 00 00 00       	mov    $0xa,%edi
  4019d2:	e8 69 f2 ff ff       	callq  400c40 <fputc@plt>
  4019d7:	bf 00 00 00 00       	mov    $0x0,%edi
  4019dc:	e8 0f f3 ff ff       	callq  400cf0 <cuserid@plt>
  4019e1:	48 85 c0             	test   %rax,%rax
  4019e4:	0f 84 8b 01 00 00    	je     401b75 <send_msg_2+0x20f>
  4019ea:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4019ef:	48 89 c6             	mov    %rax,%rsi
  4019f2:	e8 b9 f1 ff ff       	callq  400bb0 <strcpy@plt>
  4019f7:	85 db                	test   %ebx,%ebx
  4019f9:	48 8d 05 39 08 00 00 	lea    0x839(%rip),%rax        # 402239 <array.3089+0x1d9>
  401a00:	4c 8d 0d 2a 08 00 00 	lea    0x82a(%rip),%r9        # 402231 <array.3089+0x1d1>
  401a07:	4c 0f 44 c8          	cmove  %rax,%r9
  401a0b:	48 83 ec 08          	sub    $0x8,%rsp
  401a0f:	8b 05 a7 1d 20 00    	mov    0x201da7(%rip),%eax        # 6037bc <num_input_strings>
  401a15:	50                   	push   %rax
  401a16:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  401a1b:	8b 0d 3f 1c 20 00    	mov    0x201c3f(%rip),%ecx        # 603660 <bomb_id>
  401a21:	48 8d 15 38 18 20 00 	lea    0x201838(%rip),%rdx        # 603260 <lab_id>
  401a28:	48 8d 35 2e 08 00 00 	lea    0x82e(%rip),%rsi        # 40225d <array.3089+0x1fd>
  401a2f:	48 89 ef             	mov    %rbp,%rdi
  401a32:	b8 00 00 00 00       	mov    $0x0,%eax
  401a37:	e8 54 f2 ff ff       	callq  400c90 <fprintf@plt>
  401a3c:	48 83 c4 10          	add    $0x10,%rsp
  401a40:	83 3d 75 1d 20 00 00 	cmpl   $0x0,0x201d75(%rip)        # 6037bc <num_input_strings>
  401a47:	7e 60                	jle    401aa9 <send_msg_2+0x143>
  401a49:	bb 00 00 00 00       	mov    $0x0,%ebx
  401a4e:	4c 8d 3d 8b 1d 20 00 	lea    0x201d8b(%rip),%r15        # 6037e0 <input_strings>
  401a55:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
  401a5a:	4c 8d 2d ff 17 20 00 	lea    0x2017ff(%rip),%r13        # 603260 <lab_id>
  401a61:	4c 8d 25 11 08 00 00 	lea    0x811(%rip),%r12        # 402279 <array.3089+0x219>
  401a68:	48 63 c3             	movslq %ebx,%rax
  401a6b:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401a6f:	48 c1 e0 04          	shl    $0x4,%rax
  401a73:	4c 01 f8             	add    %r15,%rax
  401a76:	83 c3 01             	add    $0x1,%ebx
  401a79:	48 83 ec 08          	sub    $0x8,%rsp
  401a7d:	50                   	push   %rax
  401a7e:	41 89 d9             	mov    %ebx,%r9d
  401a81:	4d 89 f0             	mov    %r14,%r8
  401a84:	8b 0d d6 1b 20 00    	mov    0x201bd6(%rip),%ecx        # 603660 <bomb_id>
  401a8a:	4c 89 ea             	mov    %r13,%rdx
  401a8d:	4c 89 e6             	mov    %r12,%rsi
  401a90:	48 89 ef             	mov    %rbp,%rdi
  401a93:	b8 00 00 00 00       	mov    $0x0,%eax
  401a98:	e8 f3 f1 ff ff       	callq  400c90 <fprintf@plt>
  401a9d:	48 83 c4 10          	add    $0x10,%rsp
  401aa1:	39 1d 15 1d 20 00    	cmp    %ebx,0x201d15(%rip)        # 6037bc <num_input_strings>
  401aa7:	7f bf                	jg     401a68 <send_msg_2+0x102>
  401aa9:	48 89 ef             	mov    %rbp,%rdi
  401aac:	e8 5f f1 ff ff       	callq  400c10 <rewind@plt>
  401ab1:	4c 8d 05 48 08 00 00 	lea    0x848(%rip),%r8        # 402300 <array.3089+0x2a0>
  401ab8:	48 8d 0d 4b 08 00 00 	lea    0x84b(%rip),%rcx        # 40230a <array.3089+0x2aa>
  401abf:	48 8d 15 4c 08 00 00 	lea    0x84c(%rip),%rdx        # 402312 <array.3089+0x2b2>
  401ac6:	48 8d 35 5c 08 00 00 	lea    0x85c(%rip),%rsi        # 402329 <array.3089+0x2c9>
  401acd:	48 8d 3d 4c 23 20 00 	lea    0x20234c(%rip),%rdi        # 603e20 <scratch>
  401ad4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ad9:	e8 42 f2 ff ff       	callq  400d20 <sprintf@plt>
  401ade:	48 8d 3d 3b 23 20 00 	lea    0x20233b(%rip),%rdi        # 603e20 <scratch>
  401ae5:	e8 06 f1 ff ff       	callq  400bf0 <system@plt>
  401aea:	85 c0                	test   %eax,%eax
  401aec:	0f 85 9c 00 00 00    	jne    401b8e <send_msg_2+0x228>
  401af2:	48 89 ef             	mov    %rbp,%rdi
  401af5:	e8 e6 f0 ff ff       	callq  400be0 <fclose@plt>
  401afa:	85 c0                	test   %eax,%eax
  401afc:	0f 85 a2 00 00 00    	jne    401ba4 <send_msg_2+0x23e>
  401b02:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  401b06:	e8 15 f1 ff ff       	callq  400c20 <dup@plt>
  401b0b:	85 c0                	test   %eax,%eax
  401b0d:	0f 85 a7 00 00 00    	jne    401bba <send_msg_2+0x254>
  401b13:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  401b17:	e8 14 f1 ff ff       	callq  400c30 <close@plt>
  401b1c:	85 c0                	test   %eax,%eax
  401b1e:	0f 85 ac 00 00 00    	jne    401bd0 <send_msg_2+0x26a>
  401b24:	48 83 c4 68          	add    $0x68,%rsp
  401b28:	5b                   	pop    %rbx
  401b29:	5d                   	pop    %rbp
  401b2a:	41 5c                	pop    %r12
  401b2c:	41 5d                	pop    %r13
  401b2e:	41 5e                	pop    %r14
  401b30:	41 5f                	pop    %r15
  401b32:	c3                   	retq   
  401b33:	48 8d 3d 6e 07 00 00 	lea    0x76e(%rip),%rdi        # 4022a8 <array.3089+0x248>
  401b3a:	e8 81 f0 ff ff       	callq  400bc0 <puts@plt>
  401b3f:	bf 08 00 00 00       	mov    $0x8,%edi
  401b44:	e8 e7 f1 ff ff       	callq  400d30 <exit@plt>
  401b49:	48 8d 3d 6c 07 00 00 	lea    0x76c(%rip),%rdi        # 4022bc <array.3089+0x25c>
  401b50:	e8 6b f0 ff ff       	callq  400bc0 <puts@plt>
  401b55:	bf 08 00 00 00       	mov    $0x8,%edi
  401b5a:	e8 d1 f1 ff ff       	callq  400d30 <exit@plt>
  401b5f:	48 8d 3d 69 07 00 00 	lea    0x769(%rip),%rdi        # 4022cf <array.3089+0x26f>
  401b66:	e8 55 f0 ff ff       	callq  400bc0 <puts@plt>
  401b6b:	bf 08 00 00 00       	mov    $0x8,%edi
  401b70:	e8 bb f1 ff ff       	callq  400d30 <exit@plt>
  401b75:	c7 44 24 10 6e 6f 62 	movl   $0x6f626f6e,0x10(%rsp)
  401b7c:	6f 
  401b7d:	66 c7 44 24 14 64 79 	movw   $0x7964,0x14(%rsp)
  401b84:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
  401b89:	e9 69 fe ff ff       	jmpq   4019f7 <send_msg_2+0x91>
  401b8e:	48 8d 3d 9d 07 00 00 	lea    0x79d(%rip),%rdi        # 402332 <array.3089+0x2d2>
  401b95:	e8 26 f0 ff ff       	callq  400bc0 <puts@plt>
  401b9a:	bf 08 00 00 00       	mov    $0x8,%edi
  401b9f:	e8 8c f1 ff ff       	callq  400d30 <exit@plt>
  401ba4:	48 8d 3d a1 07 00 00 	lea    0x7a1(%rip),%rdi        # 40234c <array.3089+0x2ec>
  401bab:	e8 10 f0 ff ff       	callq  400bc0 <puts@plt>
  401bb0:	bf 08 00 00 00       	mov    $0x8,%edi
  401bb5:	e8 76 f1 ff ff       	callq  400d30 <exit@plt>
  401bba:	48 8d 3d a4 07 00 00 	lea    0x7a4(%rip),%rdi        # 402365 <array.3089+0x305>
  401bc1:	e8 fa ef ff ff       	callq  400bc0 <puts@plt>
  401bc6:	bf 08 00 00 00       	mov    $0x8,%edi
  401bcb:	e8 60 f1 ff ff       	callq  400d30 <exit@plt>
  401bd0:	48 8d 3d a9 07 00 00 	lea    0x7a9(%rip),%rdi        # 402380 <array.3089+0x320>
  401bd7:	e8 e4 ef ff ff       	callq  400bc0 <puts@plt>
  401bdc:	bf 08 00 00 00       	mov    $0x8,%edi
  401be1:	e8 4a f1 ff ff       	callq  400d30 <exit@plt>

0000000000401be6 <explode_bomb>:
  401be6:	48 83 ec 08          	sub    $0x8,%rsp
  401bea:	48 8d 3d a6 07 00 00 	lea    0x7a6(%rip),%rdi        # 402397 <array.3089+0x337>
  401bf1:	e8 ca ef ff ff       	callq  400bc0 <puts@plt>
  401bf6:	48 8d 3d a3 07 00 00 	lea    0x7a3(%rip),%rdi        # 4023a0 <array.3089+0x340>
  401bfd:	e8 be ef ff ff       	callq  400bc0 <puts@plt>
  401c02:	bf 00 00 00 00       	mov    $0x0,%edi
  401c07:	e8 17 fa ff ff       	callq  401623 <send_msg>
  401c0c:	48 8d 3d c5 04 00 00 	lea    0x4c5(%rip),%rdi        # 4020d8 <array.3089+0x78>
  401c13:	e8 a8 ef ff ff       	callq  400bc0 <puts@plt>
  401c18:	bf 08 00 00 00       	mov    $0x8,%edi
  401c1d:	e8 0e f1 ff ff       	callq  400d30 <exit@plt>

0000000000401c22 <read_six_numbers>:
  401c22:	48 83 ec 08          	sub    $0x8,%rsp
  401c26:	48 89 f2             	mov    %rsi,%rdx
  401c29:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401c2d:	48 8d 46 14          	lea    0x14(%rsi),%rax
  401c31:	50                   	push   %rax
  401c32:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401c36:	50                   	push   %rax
  401c37:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401c3b:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401c3f:	48 8d 35 71 07 00 00 	lea    0x771(%rip),%rsi        # 4023b7 <array.3089+0x357>
  401c46:	b8 00 00 00 00       	mov    $0x0,%eax
  401c4b:	e8 80 f0 ff ff       	callq  400cd0 <__isoc99_sscanf@plt>
  401c50:	48 83 c4 10          	add    $0x10,%rsp
  401c54:	83 f8 05             	cmp    $0x5,%eax
  401c57:	7e 05                	jle    401c5e <read_six_numbers+0x3c>
  401c59:	48 83 c4 08          	add    $0x8,%rsp
  401c5d:	c3                   	retq   
  401c5e:	e8 83 ff ff ff       	callq  401be6 <explode_bomb>

0000000000401c63 <read_line>:
  401c63:	48 83 ec 08          	sub    $0x8,%rsp
  401c67:	b8 00 00 00 00       	mov    $0x0,%eax
  401c6c:	e8 04 f9 ff ff       	callq  401575 <skip>
  401c71:	48 85 c0             	test   %rax,%rax
  401c74:	74 6f                	je     401ce5 <read_line+0x82>
  401c76:	8b 35 40 1b 20 00    	mov    0x201b40(%rip),%esi        # 6037bc <num_input_strings>
  401c7c:	48 63 c6             	movslq %esi,%rax
  401c7f:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401c83:	48 c1 e2 04          	shl    $0x4,%rdx
  401c87:	48 8d 05 52 1b 20 00 	lea    0x201b52(%rip),%rax        # 6037e0 <input_strings>
  401c8e:	48 01 c2             	add    %rax,%rdx
  401c91:	b8 00 00 00 00       	mov    $0x0,%eax
  401c96:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401c9d:	48 89 d7             	mov    %rdx,%rdi
  401ca0:	f2 ae                	repnz scas %es:(%rdi),%al
  401ca2:	48 f7 d1             	not    %rcx
  401ca5:	48 83 e9 01          	sub    $0x1,%rcx
  401ca9:	83 f9 4f             	cmp    $0x4f,%ecx
  401cac:	0f 84 a1 00 00 00    	je     401d53 <read_line+0xf0>
  401cb2:	83 e9 01             	sub    $0x1,%ecx
  401cb5:	48 63 c9             	movslq %ecx,%rcx
  401cb8:	48 63 c6             	movslq %esi,%rax
  401cbb:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401cbf:	48 c1 e0 04          	shl    $0x4,%rax
  401cc3:	48 89 c7             	mov    %rax,%rdi
  401cc6:	48 8d 05 13 1b 20 00 	lea    0x201b13(%rip),%rax        # 6037e0 <input_strings>
  401ccd:	48 01 f8             	add    %rdi,%rax
  401cd0:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  401cd4:	83 c6 01             	add    $0x1,%esi
  401cd7:	89 35 df 1a 20 00    	mov    %esi,0x201adf(%rip)        # 6037bc <num_input_strings>
  401cdd:	48 89 d0             	mov    %rdx,%rax
  401ce0:	48 83 c4 08          	add    $0x8,%rsp
  401ce4:	c3                   	retq   
  401ce5:	48 8b 05 c4 1a 20 00 	mov    0x201ac4(%rip),%rax        # 6037b0 <stdin@@GLIBC_2.2.5>
  401cec:	48 39 05 cd 1a 20 00 	cmp    %rax,0x201acd(%rip)        # 6037c0 <infile>
  401cf3:	74 43                	je     401d38 <read_line+0xd5>
  401cf5:	48 8d 3d eb 06 00 00 	lea    0x6eb(%rip),%rdi        # 4023e7 <array.3089+0x387>
  401cfc:	e8 8f ee ff ff       	callq  400b90 <getenv@plt>
  401d01:	48 85 c0             	test   %rax,%rax
  401d04:	75 43                	jne    401d49 <read_line+0xe6>
  401d06:	48 8b 05 a3 1a 20 00 	mov    0x201aa3(%rip),%rax        # 6037b0 <stdin@@GLIBC_2.2.5>
  401d0d:	48 89 05 ac 1a 20 00 	mov    %rax,0x201aac(%rip)        # 6037c0 <infile>
  401d14:	b8 00 00 00 00       	mov    $0x0,%eax
  401d19:	e8 57 f8 ff ff       	callq  401575 <skip>
  401d1e:	48 85 c0             	test   %rax,%rax
  401d21:	0f 85 4f ff ff ff    	jne    401c76 <read_line+0x13>
  401d27:	48 8d 3d 9b 06 00 00 	lea    0x69b(%rip),%rdi        # 4023c9 <array.3089+0x369>
  401d2e:	e8 8d ee ff ff       	callq  400bc0 <puts@plt>
  401d33:	e8 ae fe ff ff       	callq  401be6 <explode_bomb>
  401d38:	48 8d 3d 8a 06 00 00 	lea    0x68a(%rip),%rdi        # 4023c9 <array.3089+0x369>
  401d3f:	e8 7c ee ff ff       	callq  400bc0 <puts@plt>
  401d44:	e8 9d fe ff ff       	callq  401be6 <explode_bomb>
  401d49:	bf 00 00 00 00       	mov    $0x0,%edi
  401d4e:	e8 dd ef ff ff       	callq  400d30 <exit@plt>
  401d53:	48 8d 3d 98 06 00 00 	lea    0x698(%rip),%rdi        # 4023f2 <array.3089+0x392>
  401d5a:	e8 61 ee ff ff       	callq  400bc0 <puts@plt>
  401d5f:	e8 82 fe ff ff       	callq  401be6 <explode_bomb>

0000000000401d64 <phase_defused>:
  401d64:	48 83 ec 68          	sub    $0x68,%rsp
  401d68:	bf 01 00 00 00       	mov    $0x1,%edi
  401d6d:	e8 b1 f8 ff ff       	callq  401623 <send_msg>
  401d72:	83 3d 43 1a 20 00 06 	cmpl   $0x6,0x201a43(%rip)        # 6037bc <num_input_strings>
  401d79:	74 05                	je     401d80 <phase_defused+0x1c>
  401d7b:	48 83 c4 68          	add    $0x68,%rsp
  401d7f:	c3                   	retq   
  401d80:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  401d85:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401d8a:	48 8d 35 7c 06 00 00 	lea    0x67c(%rip),%rsi        # 40240d <array.3089+0x3ad>
  401d91:	48 8d 3d 38 1b 20 00 	lea    0x201b38(%rip),%rdi        # 6038d0 <input_strings+0xf0>
  401d98:	b8 00 00 00 00       	mov    $0x0,%eax
  401d9d:	e8 2e ef ff ff       	callq  400cd0 <__isoc99_sscanf@plt>
  401da2:	83 f8 02             	cmp    $0x2,%eax
  401da5:	74 1a                	je     401dc1 <phase_defused+0x5d>
  401da7:	48 8d 3d b2 03 00 00 	lea    0x3b2(%rip),%rdi        # 402160 <array.3089+0x100>
  401dae:	e8 0d ee ff ff       	callq  400bc0 <puts@plt>
  401db3:	48 8d 3d d6 03 00 00 	lea    0x3d6(%rip),%rdi        # 402190 <array.3089+0x130>
  401dba:	e8 01 ee ff ff       	callq  400bc0 <puts@plt>
  401dbf:	eb ba                	jmp    401d7b <phase_defused+0x17>
  401dc1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401dc6:	48 8d 35 46 06 00 00 	lea    0x646(%rip),%rsi        # 402413 <array.3089+0x3b3>
  401dcd:	e8 04 f6 ff ff       	callq  4013d6 <strings_not_equal>
  401dd2:	85 c0                	test   %eax,%eax
  401dd4:	75 d1                	jne    401da7 <phase_defused+0x43>
  401dd6:	48 8d 3d 23 03 00 00 	lea    0x323(%rip),%rdi        # 402100 <array.3089+0xa0>
  401ddd:	e8 de ed ff ff       	callq  400bc0 <puts@plt>
  401de2:	48 8d 3d 3f 03 00 00 	lea    0x33f(%rip),%rdi        # 402128 <array.3089+0xc8>
  401de9:	e8 d2 ed ff ff       	callq  400bc0 <puts@plt>
  401dee:	b8 00 00 00 00       	mov    $0x0,%eax
  401df3:	e8 f0 f4 ff ff       	callq  4012e8 <secret_phase>
  401df8:	eb ad                	jmp    401da7 <phase_defused+0x43>
  401dfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401e00 <__libc_csu_init>:
  401e00:	41 57                	push   %r15
  401e02:	41 56                	push   %r14
  401e04:	41 89 ff             	mov    %edi,%r15d
  401e07:	41 55                	push   %r13
  401e09:	41 54                	push   %r12
  401e0b:	4c 8d 25 f6 0f 20 00 	lea    0x200ff6(%rip),%r12        # 602e08 <__frame_dummy_init_array_entry>
  401e12:	55                   	push   %rbp
  401e13:	48 8d 2d f6 0f 20 00 	lea    0x200ff6(%rip),%rbp        # 602e10 <__init_array_end>
  401e1a:	53                   	push   %rbx
  401e1b:	49 89 f6             	mov    %rsi,%r14
  401e1e:	49 89 d5             	mov    %rdx,%r13
  401e21:	4c 29 e5             	sub    %r12,%rbp
  401e24:	48 83 ec 08          	sub    $0x8,%rsp
  401e28:	48 c1 fd 03          	sar    $0x3,%rbp
  401e2c:	e8 37 ed ff ff       	callq  400b68 <_init>
  401e31:	48 85 ed             	test   %rbp,%rbp
  401e34:	74 20                	je     401e56 <__libc_csu_init+0x56>
  401e36:	31 db                	xor    %ebx,%ebx
  401e38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401e3f:	00 
  401e40:	4c 89 ea             	mov    %r13,%rdx
  401e43:	4c 89 f6             	mov    %r14,%rsi
  401e46:	44 89 ff             	mov    %r15d,%edi
  401e49:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  401e4d:	48 83 c3 01          	add    $0x1,%rbx
  401e51:	48 39 dd             	cmp    %rbx,%rbp
  401e54:	75 ea                	jne    401e40 <__libc_csu_init+0x40>
  401e56:	48 83 c4 08          	add    $0x8,%rsp
  401e5a:	5b                   	pop    %rbx
  401e5b:	5d                   	pop    %rbp
  401e5c:	41 5c                	pop    %r12
  401e5e:	41 5d                	pop    %r13
  401e60:	41 5e                	pop    %r14
  401e62:	41 5f                	pop    %r15
  401e64:	c3                   	retq   
  401e65:	90                   	nop
  401e66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401e6d:	00 00 00 

0000000000401e70 <__libc_csu_fini>:
  401e70:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401e74 <_fini>:
  401e74:	48 83 ec 08          	sub    $0x8,%rsp
  401e78:	48 83 c4 08          	add    $0x8,%rsp
  401e7c:	c3                   	retq   

Disassembly of section .rodata:

0000000000401e80 <_IO_stdin_used>:
  401e80:	01 00                	add    %eax,(%rax)
  401e82:	02 00                	add    (%rax),%al
  401e84:	25 73 3a 20 45       	and    $0x45203a73,%eax
  401e89:	72 72                	jb     401efd <_IO_stdin_used+0x7d>
  401e8b:	6f                   	outsl  %ds:(%rsi),(%dx)
  401e8c:	72 3a                	jb     401ec8 <_IO_stdin_used+0x48>
  401e8e:	20 43 6f             	and    %al,0x6f(%rbx)
  401e91:	75 6c                	jne    401eff <_IO_stdin_used+0x7f>
  401e93:	64 6e                	outsb  %fs:(%rsi),(%dx)
  401e95:	27                   	(bad)  
  401e96:	74 20                	je     401eb8 <_IO_stdin_used+0x38>
  401e98:	6f                   	outsl  %ds:(%rsi),(%dx)
  401e99:	70 65                	jo     401f00 <_IO_stdin_used+0x80>
  401e9b:	6e                   	outsb  %ds:(%rsi),(%dx)
  401e9c:	20 25 73 0a 00 55    	and    %ah,0x55000a73(%rip)        # 55402915 <_end+0x54dfeaa5>
  401ea2:	73 61                	jae    401f05 <_IO_stdin_used+0x85>
  401ea4:	67 65 3a 20          	cmp    %gs:(%eax),%ah
  401ea8:	25 73 20 5b 3c       	and    $0x3c5b2073,%eax
  401ead:	69 6e 70 75 74 5f 66 	imul   $0x665f7475,0x70(%rsi),%ebp
  401eb4:	69 6c 65 3e 5d 0a 00 	imul   $0x54000a5d,0x3e(%rbp,%riz,2),%ebp
  401ebb:	54 
  401ebc:	68 61 74 27 73       	pushq  $0x73277461
  401ec1:	20 6e 75             	and    %ch,0x75(%rsi)
  401ec4:	6d                   	insl   (%dx),%es:(%rdi)
  401ec5:	62                   	(bad)  
  401ec6:	65 72 20             	gs jb  401ee9 <_IO_stdin_used+0x69>
  401ec9:	32 2e                	xor    (%rsi),%ch
  401ecb:	20 20                	and    %ah,(%rax)
  401ecd:	4b                   	rex.WXB
  401ece:	65 65 70 20          	gs gs jo 401ef2 <_IO_stdin_used+0x72>
  401ed2:	67 6f                	outsl  %ds:(%esi),(%dx)
  401ed4:	69 6e 67 21 00 48 61 	imul   $0x61480021,0x67(%rsi),%ebp
  401edb:	6c                   	insb   (%dx),%es:(%rdi)
  401edc:	66 77 61             	data16 ja 401f40 <_IO_stdin_used+0xc0>
  401edf:	79 20                	jns    401f01 <_IO_stdin_used+0x81>
  401ee1:	74 68                	je     401f4b <_IO_stdin_used+0xcb>
  401ee3:	65 72 65             	gs jb  401f4b <_IO_stdin_used+0xcb>
  401ee6:	21 00                	and    %eax,(%rax)
  401ee8:	47 6f                	rex.RXB outsl %ds:(%rsi),(%dx)
  401eea:	6f                   	outsl  %ds:(%rsi),(%dx)
  401eeb:	64 20 77 6f          	and    %dh,%fs:0x6f(%rdi)
  401eef:	72 6b                	jb     401f5c <_IO_stdin_used+0xdc>
  401ef1:	21 20                	and    %esp,(%rax)
  401ef3:	20 4f 6e             	and    %cl,0x6e(%rdi)
  401ef6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
  401efa:	74 68                	je     401f64 <_IO_stdin_used+0xe4>
  401efc:	65 20 6e 65          	and    %ch,%gs:0x65(%rsi)
  401f00:	78 74                	js     401f76 <_IO_stdin_used+0xf6>
  401f02:	2e 2e 2e 00 00       	cs cs add %al,%cs:(%rax)
  401f07:	00 57 65             	add    %dl,0x65(%rdi)
  401f0a:	6c                   	insb   (%dx),%es:(%rdi)
  401f0b:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
  401f0e:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
  401f13:	6d                   	insl   (%dx),%es:(%rdi)
  401f14:	79 20                	jns    401f36 <_IO_stdin_used+0xb6>
  401f16:	66 69 65 6e 64 69    	imul   $0x6964,0x6e(%rbp),%sp
  401f1c:	73 68                	jae    401f86 <_IO_stdin_used+0x106>
  401f1e:	20 6c 69 74          	and    %ch,0x74(%rcx,%rbp,2)
  401f22:	74 6c                	je     401f90 <_IO_stdin_used+0x110>
  401f24:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
  401f28:	6d                   	insl   (%dx),%es:(%rdi)
  401f29:	62                   	(bad)  
  401f2a:	2e 20 59 6f          	and    %bl,%cs:0x6f(%rcx)
  401f2e:	75 20                	jne    401f50 <_IO_stdin_used+0xd0>
  401f30:	68 61 76 65 20       	pushq  $0x20657661
  401f35:	36 20 70 68          	and    %dh,%ss:0x68(%rax)
  401f39:	61                   	(bad)  
  401f3a:	73 65                	jae    401fa1 <_IO_stdin_used+0x121>
  401f3c:	73 20                	jae    401f5e <_IO_stdin_used+0xde>
  401f3e:	77 69                	ja     401fa9 <_IO_stdin_used+0x129>
  401f40:	74 68                	je     401faa <_IO_stdin_used+0x12a>
  401f42:	00 00                	add    %al,(%rax)
  401f44:	00 00                	add    %al,(%rax)
  401f46:	00 00                	add    %al,(%rax)
  401f48:	77 68                	ja     401fb2 <_IO_stdin_used+0x132>
  401f4a:	69 63 68 20 74 6f 20 	imul   $0x206f7420,0x68(%rbx),%esp
  401f51:	62                   	(bad)  
  401f52:	6c                   	insb   (%dx),%es:(%rdi)
  401f53:	6f                   	outsl  %ds:(%rsi),(%dx)
  401f54:	77 20                	ja     401f76 <_IO_stdin_used+0xf6>
  401f56:	79 6f                	jns    401fc7 <_IO_stdin_used+0x147>
  401f58:	75 72                	jne    401fcc <_IO_stdin_used+0x14c>
  401f5a:	73 65                	jae    401fc1 <_IO_stdin_used+0x141>
  401f5c:	6c                   	insb   (%dx),%es:(%rdi)
  401f5d:	66 20 75 70          	data16 and %dh,0x70(%rbp)
  401f61:	2e 20 48 61          	and    %cl,%cs:0x61(%rax)
  401f65:	76 65                	jbe    401fcc <_IO_stdin_used+0x14c>
  401f67:	20 61 20             	and    %ah,0x20(%rcx)
  401f6a:	6e                   	outsb  %ds:(%rsi),(%dx)
  401f6b:	69 63 65 20 64 61 79 	imul   $0x79616420,0x65(%rbx),%esp
  401f72:	21 00                	and    %eax,(%rax)
  401f74:	00 00                	add    %al,(%rax)
  401f76:	00 00                	add    %al,(%rax)
  401f78:	50                   	push   %rax
  401f79:	68 61 73 65 20       	pushq  $0x20657361
  401f7e:	31 20                	xor    %esp,(%rax)
  401f80:	64 65 66 75 73       	fs gs data16 jne 401ff8 <_IO_stdin_used+0x178>
  401f85:	65 64 2e 20 48 6f    	gs fs and %cl,%cs:0x6f(%rax)
  401f8b:	77 20                	ja     401fad <_IO_stdin_used+0x12d>
  401f8d:	61                   	(bad)  
  401f8e:	62                   	(bad)  
  401f8f:	6f                   	outsl  %ds:(%rsi),(%dx)
  401f90:	75 74                	jne    402006 <_IO_stdin_used+0x186>
  401f92:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
  401f96:	20 6e 65             	and    %ch,0x65(%rsi)
  401f99:	78 74                	js     40200f <_IO_stdin_used+0x18f>
  401f9b:	20 6f 6e             	and    %ch,0x6e(%rdi)
  401f9e:	65 3f                	gs (bad) 
	...
  401fa8:	53                   	push   %rbx
  401fa9:	6f                   	outsl  %ds:(%rsi),(%dx)
  401faa:	20 79 6f             	and    %bh,0x6f(%rcx)
  401fad:	75 20                	jne    401fcf <_IO_stdin_used+0x14f>
  401faf:	67 6f                	outsl  %ds:(%esi),(%dx)
  401fb1:	74 20                	je     401fd3 <_IO_stdin_used+0x153>
  401fb3:	74 68                	je     40201d <_IO_stdin_used+0x19d>
  401fb5:	61                   	(bad)  
  401fb6:	74 20                	je     401fd8 <_IO_stdin_used+0x158>
  401fb8:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fb9:	6e                   	outsb  %ds:(%rsi),(%dx)
  401fba:	65 2e 20 20          	gs and %ah,%cs:(%rax)
  401fbe:	54                   	push   %rsp
  401fbf:	72 79                	jb     40203a <_IO_stdin_used+0x1ba>
  401fc1:	20 74 68 69          	and    %dh,0x69(%rax,%rbp,2)
  401fc5:	73 20                	jae    401fe7 <_IO_stdin_used+0x167>
  401fc7:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fc8:	6e                   	outsb  %ds:(%rsi),(%dx)
  401fc9:	65 2e 00 00          	gs add %al,%cs:(%rax)
  401fcd:	00 00                	add    %al,(%rax)
  401fcf:	00 57 68             	add    %dl,0x68(%rdi)
  401fd2:	79 20                	jns    401ff4 <_IO_stdin_used+0x174>
  401fd4:	6d                   	insl   (%dx),%es:(%rdi)
  401fd5:	61                   	(bad)  
  401fd6:	6b 65 20 74          	imul   $0x74,0x20(%rbp),%esp
  401fda:	72 69                	jb     402045 <_IO_stdin_used+0x1c5>
  401fdc:	6c                   	insb   (%dx),%es:(%rdi)
  401fdd:	6c                   	insb   (%dx),%es:(%rdi)
  401fde:	69 6f 6e 73 20 77 68 	imul   $0x68772073,0x6e(%rdi),%ebp
  401fe5:	65 6e                	outsb  %gs:(%rsi),(%dx)
  401fe7:	20 77 65             	and    %dh,0x65(%rdi)
  401fea:	20 63 6f             	and    %ah,0x6f(%rbx)
  401fed:	75 6c                	jne    40205b <_IO_stdin_used+0x1db>
  401fef:	64 20 6d 61          	and    %ch,%fs:0x61(%rbp)
  401ff3:	6b 65 2e 2e          	imul   $0x2e,0x2e(%rbp),%esp
  401ff7:	2e 20 62 69          	and    %ah,%cs:0x69(%rdx)
  401ffb:	6c                   	insb   (%dx),%es:(%rdi)
  401ffc:	6c                   	insb   (%dx),%es:(%rdi)
  401ffd:	69 6f 6e 73 3f 00 00 	imul   $0x3f73,0x6e(%rdi),%ebp
  402004:	00 00                	add    %al,(%rax)
  402006:	00 00                	add    %al,(%rax)
  402008:	57                   	push   %rdi
  402009:	6f                   	outsl  %ds:(%rsi),(%dx)
  40200a:	77 21                	ja     40202d <_IO_stdin_used+0x1ad>
  40200c:	20 59 6f             	and    %bl,0x6f(%rcx)
  40200f:	75 27                	jne    402038 <_IO_stdin_used+0x1b8>
  402011:	76 65                	jbe    402078 <array.3089+0x18>
  402013:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
  402017:	75 73                	jne    40208c <array.3089+0x2c>
  402019:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
  40201f:	20 73 65             	and    %dh,0x65(%rbx)
  402022:	63 72 65             	movslq 0x65(%rdx),%esi
  402025:	74 20                	je     402047 <_IO_stdin_used+0x1c7>
  402027:	73 74                	jae    40209d <array.3089+0x3d>
  402029:	61                   	(bad)  
  40202a:	67 65 21 00          	and    %eax,%gs:(%eax)
	...
  40203e:	00 00                	add    %al,(%rax)
  402040:	57                   	push   %rdi
  402041:	f0 ff                	lock (bad) 
  402043:	ff 5e f0             	lcall  *-0x10(%rsi)
  402046:	ff                   	(bad)  
  402047:	ff 99 f0 ff ff a0    	lcall  *-0x5f000010(%rcx)
  40204d:	f0 ff                	lock (bad) 
  40204f:	ff a7 f0 ff ff ae    	jmpq   *-0x51000010(%rdi)
  402055:	f0 ff                	lock (bad) 
  402057:	ff b5 f0 ff ff bc    	pushq  -0x43000010(%rbp)
  40205d:	f0 ff                	lock (bad) 
  40205f:	ff 02                	incl   (%rdx)

0000000000402060 <array.3089>:
  402060:	02 00                	add    (%rax),%al
  402062:	00 00                	add    %al,(%rax)
  402064:	0a 00                	or     (%rax),%al
  402066:	00 00                	add    %al,(%rax)
  402068:	06                   	(bad)  
  402069:	00 00                	add    %al,(%rax)
  40206b:	00 01                	add    %al,(%rcx)
  40206d:	00 00                	add    %al,(%rax)
  40206f:	00 0c 00             	add    %cl,(%rax,%rax,1)
  402072:	00 00                	add    %al,(%rax)
  402074:	10 00                	adc    %al,(%rax)
  402076:	00 00                	add    %al,(%rax)
  402078:	09 00                	or     %eax,(%rax)
  40207a:	00 00                	add    %al,(%rax)
  40207c:	03 00                	add    (%rax),%eax
  40207e:	00 00                	add    %al,(%rax)
  402080:	04 00                	add    $0x0,%al
  402082:	00 00                	add    %al,(%rax)
  402084:	07                   	(bad)  
  402085:	00 00                	add    %al,(%rax)
  402087:	00 0e                	add    %cl,(%rsi)
  402089:	00 00                	add    %al,(%rax)
  40208b:	00 05 00 00 00 0b    	add    %al,0xb000000(%rip)        # b402091 <_end+0xadfe221>
  402091:	00 00                	add    %al,(%rax)
  402093:	00 08                	add    %cl,(%rax)
  402095:	00 00                	add    %al,(%rax)
  402097:	00 0f                	add    %cl,(%rdi)
  402099:	00 00                	add    %al,(%rax)
  40209b:	00 0d 00 00 00 53    	add    %cl,0x53000000(%rip)        # 534020a1 <_end+0x52dfe231>
  4020a1:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020a2:	20 79 6f             	and    %bh,0x6f(%rcx)
  4020a5:	75 20                	jne    4020c7 <array.3089+0x67>
  4020a7:	74 68                	je     402111 <array.3089+0xb1>
  4020a9:	69 6e 6b 20 79 6f 75 	imul   $0x756f7920,0x6b(%rsi),%ebp
  4020b0:	20 63 61             	and    %ah,0x61(%rbx)
  4020b3:	6e                   	outsb  %ds:(%rsi),(%dx)
  4020b4:	20 73 74             	and    %dh,0x74(%rbx)
  4020b7:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020b8:	70 20                	jo     4020da <array.3089+0x7a>
  4020ba:	74 68                	je     402124 <array.3089+0xc4>
  4020bc:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
  4020c0:	6d                   	insl   (%dx),%es:(%rdi)
  4020c1:	62                   	(bad)  
  4020c2:	20 77 69             	and    %dh,0x69(%rdi)
  4020c5:	74 68                	je     40212f <array.3089+0xcf>
  4020c7:	20 63 74             	and    %ah,0x74(%rbx)
  4020ca:	72 6c                	jb     402138 <array.3089+0xd8>
  4020cc:	2d 63 2c 20 64       	sub    $0x64202c63,%eax
  4020d1:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020d2:	20 79 6f             	and    %bh,0x6f(%rcx)
  4020d5:	75 3f                	jne    402116 <array.3089+0xb6>
  4020d7:	00 59 6f             	add    %bl,0x6f(%rcx)
  4020da:	75 72                	jne    40214e <array.3089+0xee>
  4020dc:	20 69 6e             	and    %ch,0x6e(%rcx)
  4020df:	73 74                	jae    402155 <array.3089+0xf5>
  4020e1:	72 75                	jb     402158 <array.3089+0xf8>
  4020e3:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
  4020e7:	20 68 61             	and    %ch,0x61(%rax)
  4020ea:	73 20                	jae    40210c <array.3089+0xac>
  4020ec:	62                   	(bad)  
  4020ed:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
  4020f0:	20 6e 6f             	and    %ch,0x6f(%rsi)
  4020f3:	74 69                	je     40215e <array.3089+0xfe>
  4020f5:	66 69 65 64 2e 00    	imul   $0x2e,0x64(%rbp),%sp
  4020fb:	00 00                	add    %al,(%rax)
  4020fd:	00 00                	add    %al,(%rax)
  4020ff:	00 43 75             	add    %al,0x75(%rbx)
  402102:	72 73                	jb     402177 <array.3089+0x117>
  402104:	65 73 2c             	gs jae 402133 <array.3089+0xd3>
  402107:	20 79 6f             	and    %bh,0x6f(%rcx)
  40210a:	75 27                	jne    402133 <array.3089+0xd3>
  40210c:	76 65                	jbe    402173 <array.3089+0x113>
  40210e:	20 66 6f             	and    %ah,0x6f(%rsi)
  402111:	75 6e                	jne    402181 <array.3089+0x121>
  402113:	64 20 74 68 65       	and    %dh,%fs:0x65(%rax,%rbp,2)
  402118:	20 73 65             	and    %dh,0x65(%rbx)
  40211b:	63 72 65             	movslq 0x65(%rdx),%esi
  40211e:	74 20                	je     402140 <array.3089+0xe0>
  402120:	70 68                	jo     40218a <array.3089+0x12a>
  402122:	61                   	(bad)  
  402123:	73 65                	jae    40218a <array.3089+0x12a>
  402125:	21 00                	and    %eax,(%rax)
  402127:	00 42 75             	add    %al,0x75(%rdx)
  40212a:	74 20                	je     40214c <array.3089+0xec>
  40212c:	66 69 6e 64 69 6e    	imul   $0x6e69,0x64(%rsi),%bp
  402132:	67 20 69 74          	and    %ch,0x74(%ecx)
  402136:	20 61 6e             	and    %ah,0x6e(%rcx)
  402139:	64 20 73 6f          	and    %dh,%fs:0x6f(%rbx)
  40213d:	6c                   	insb   (%dx),%es:(%rdi)
  40213e:	76 69                	jbe    4021a9 <array.3089+0x149>
  402140:	6e                   	outsb  %ds:(%rsi),(%dx)
  402141:	67 20 69 74          	and    %ch,0x74(%ecx)
  402145:	20 61 72             	and    %ah,0x72(%rcx)
  402148:	65 20 71 75          	and    %dh,%gs:0x75(%rcx)
  40214c:	69 74 65 20 64 69 66 	imul   $0x66666964,0x20(%rbp,%riz,2),%esi
  402153:	66 
  402154:	65 72 65             	gs jb  4021bc <array.3089+0x15c>
  402157:	6e                   	outsb  %ds:(%rsi),(%dx)
  402158:	74 2e                	je     402188 <array.3089+0x128>
  40215a:	2e 2e 00 00          	cs add %al,%cs:(%rax)
  40215e:	00 00                	add    %al,(%rax)
  402160:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
  402162:	6e                   	outsb  %ds:(%rsi),(%dx)
  402163:	67 72 61             	addr32 jb 4021c7 <array.3089+0x167>
  402166:	74 75                	je     4021dd <array.3089+0x17d>
  402168:	6c                   	insb   (%dx),%es:(%rdi)
  402169:	61                   	(bad)  
  40216a:	74 69                	je     4021d5 <array.3089+0x175>
  40216c:	6f                   	outsl  %ds:(%rsi),(%dx)
  40216d:	6e                   	outsb  %ds:(%rsi),(%dx)
  40216e:	73 21                	jae    402191 <array.3089+0x131>
  402170:	20 59 6f             	and    %bl,0x6f(%rcx)
  402173:	75 27                	jne    40219c <array.3089+0x13c>
  402175:	76 65                	jbe    4021dc <array.3089+0x17c>
  402177:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
  40217b:	75 73                	jne    4021f0 <array.3089+0x190>
  40217d:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
  402183:	20 62 6f             	and    %ah,0x6f(%rdx)
  402186:	6d                   	insl   (%dx),%es:(%rdi)
  402187:	62 21                	(bad)  
  402189:	00 00                	add    %al,(%rax)
  40218b:	00 00                	add    %al,(%rax)
  40218d:	00 00                	add    %al,(%rax)
  40218f:	00 59 6f             	add    %bl,0x6f(%rcx)
  402192:	75 72                	jne    402206 <array.3089+0x1a6>
  402194:	20 69 6e             	and    %ch,0x6e(%rcx)
  402197:	73 74                	jae    40220d <array.3089+0x1ad>
  402199:	72 75                	jb     402210 <array.3089+0x1b0>
  40219b:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
  40219f:	20 68 61             	and    %ch,0x61(%rax)
  4021a2:	73 20                	jae    4021c4 <array.3089+0x164>
  4021a4:	62                   	(bad)  
  4021a5:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
  4021a8:	20 6e 6f             	and    %ch,0x6f(%rsi)
  4021ab:	74 69                	je     402216 <array.3089+0x1b6>
  4021ad:	66 69 65 64 20 61    	imul   $0x6120,0x64(%rbp),%sp
  4021b3:	6e                   	outsb  %ds:(%rsi),(%dx)
  4021b4:	64 20 77 69          	and    %dh,%fs:0x69(%rdi)
  4021b8:	6c                   	insb   (%dx),%es:(%rdi)
  4021b9:	6c                   	insb   (%dx),%es:(%rdi)
  4021ba:	20 76 65             	and    %dh,0x65(%rsi)
  4021bd:	72 69                	jb     402228 <array.3089+0x1c8>
  4021bf:	66 79 20             	data16 jns 4021e2 <array.3089+0x182>
  4021c2:	79 6f                	jns    402233 <array.3089+0x1d3>
  4021c4:	75 72                	jne    402238 <array.3089+0x1d8>
  4021c6:	20 73 6f             	and    %dh,0x6f(%rbx)
  4021c9:	6c                   	insb   (%dx),%es:(%rdi)
  4021ca:	75 74                	jne    402240 <array.3089+0x1e0>
  4021cc:	69 6f 6e 2e 00 00 00 	imul   $0x2e,0x6e(%rdi),%ebp
  4021d3:	00 00                	add    %al,(%rax)
  4021d5:	00 00                	add    %al,(%rax)
  4021d7:	00 57 65             	add    %dl,0x65(%rdi)
  4021da:	6c                   	insb   (%dx),%es:(%rdi)
  4021db:	6c                   	insb   (%dx),%es:(%rdi)
  4021dc:	2e 2e 2e 00 4f 4b    	cs cs add %cl,%cs:0x4b(%rdi)
  4021e2:	2e 20 3a             	and    %bh,%cs:(%rdx)
  4021e5:	2d 29 00 49 6e       	sub    $0x6e490029,%eax
  4021ea:	76 61                	jbe    40224d <array.3089+0x1ed>
  4021ec:	6c                   	insb   (%dx),%es:(%rdi)
  4021ed:	69 64 20 70 68 61 73 	imul   $0x65736168,0x70(%rax,%riz,1),%esp
  4021f4:	65 
  4021f5:	25 73 0a 00 42       	and    $0x42000a73,%eax
  4021fa:	61                   	(bad)  
  4021fb:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  4021ff:	73 74                	jae    402275 <array.3089+0x215>
  402201:	20 28                	and    %ch,(%rax)
  402203:	31 29                	xor    %ebp,(%rcx)
  402205:	2e 00 42 61          	add    %al,%cs:0x61(%rdx)
  402209:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  40220d:	73 74                	jae    402283 <array.3089+0x223>
  40220f:	20 28                	and    %ch,(%rax)
  402211:	32 29                	xor    (%rcx),%ch
  402213:	2e 00 42 61          	add    %al,%cs:0x61(%rdx)
  402217:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  40221b:	73 74                	jae    402291 <array.3089+0x231>
  40221d:	20 28                	and    %ch,(%rax)
  40221f:	33 29                	xor    (%rcx),%ebp
  402221:	2e 00 32             	add    %dh,%cs:(%rdx)
  402224:	30 32                	xor    %dh,(%rdx)
  402226:	2e 31 32             	xor    %esi,%cs:(%rdx)
  402229:	30 2e                	xor    %ch,(%rsi)
  40222b:	34 30                	xor    $0x30,%al
  40222d:	2e 38 35 00 64 65 66 	cmp    %dh,%cs:0x66656400(%rip)        # 66a58634 <_end+0x664547c4>
  402234:	75 73                	jne    4022a9 <array.3089+0x249>
  402236:	65 64 00 65 78       	gs add %ah,%fs:0x78(%rbp)
  40223b:	70 6c                	jo     4022a9 <array.3089+0x249>
  40223d:	6f                   	outsl  %ds:(%rsi),(%dx)
  40223e:	64 65 64 00 73 6f    	fs gs add %dh,%fs:0x6f(%rbx)
  402244:	63 6b 65             	movslq 0x65(%rbx),%ebp
  402247:	74 20                	je     402269 <array.3089+0x209>
  402249:	65 72 72             	gs jb  4022be <array.3089+0x25e>
  40224c:	6f                   	outsl  %ds:(%rsi),(%dx)
  40224d:	72 00                	jb     40224f <array.3089+0x1ef>
  40224f:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
  402252:	6e                   	outsb  %ds:(%rsi),(%dx)
  402253:	65 63 74 20 65       	movslq %gs:0x65(%rax,%riz,1),%esi
  402258:	72 72                	jb     4022cc <array.3089+0x26c>
  40225a:	6f                   	outsl  %ds:(%rsi),(%dx)
  40225b:	72 00                	jb     40225d <array.3089+0x1fd>
  40225d:	62                   	(bad)  
  40225e:	6f                   	outsl  %ds:(%rsi),(%dx)
  40225f:	6d                   	insl   (%dx),%es:(%rdi)
  402260:	62                   	(bad)  
  402261:	2d 68 65 61 64       	sub    $0x64616568,%eax
  402266:	65 72 3a             	gs jb  4022a3 <array.3089+0x243>
  402269:	25 73 3a 25 64       	and    $0x64253a73,%eax
  40226e:	3a 25 73 3a 25 73    	cmp    0x73253a73(%rip),%ah        # 73655ce7 <_end+0x73051e77>
  402274:	3a 25 64 0a 00 62    	cmp    0x62000a64(%rip),%ah        # 62402cde <_end+0x61dfee6e>
  40227a:	6f                   	outsl  %ds:(%rsi),(%dx)
  40227b:	6d                   	insl   (%dx),%es:(%rdi)
  40227c:	62                   	(bad)  
  40227d:	2d 73 74 72 69       	sub    $0x69727473,%eax
  402282:	6e                   	outsb  %ds:(%rsi),(%dx)
  402283:	67 3a 25 73 3a 25 64 	cmp    0x64253a73(%eip),%ah        # 64655cfd <_end+0x64051e8d>
  40228a:	3a 25 73 3a 25 64    	cmp    0x64253a73(%rip),%ah        # 64655d03 <_end+0x64051e93>
  402290:	3a 25 73 0a 00 73    	cmp    0x73000a73(%rip),%ah        # 73402d09 <_end+0x72dfee99>
  402296:	6f                   	outsl  %ds:(%rsi),(%dx)
  402297:	63 6b 65             	movslq 0x65(%rbx),%ebp
  40229a:	74 20                	je     4022bc <array.3089+0x25c>
  40229c:	77 72                	ja     402310 <array.3089+0x2b0>
  40229e:	69 74 65 20 65 72 72 	imul   $0x6f727265,0x20(%rbp,%riz,2),%esi
  4022a5:	6f 
  4022a6:	72 00                	jb     4022a8 <array.3089+0x248>
  4022a8:	45 52                	rex.RB push %r10
  4022aa:	52                   	push   %rdx
  4022ab:	4f 52                	rex.WRXB push %r10
  4022ad:	3a 20                	cmp    (%rax),%ah
  4022af:	64 75 70             	fs jne 402322 <array.3089+0x2c2>
  4022b2:	28 30                	sub    %dh,(%rax)
  4022b4:	29 20                	sub    %esp,(%rax)
  4022b6:	65 72 72             	gs jb  40232b <array.3089+0x2cb>
  4022b9:	6f                   	outsl  %ds:(%rsi),(%dx)
  4022ba:	72 00                	jb     4022bc <array.3089+0x25c>
  4022bc:	45 52                	rex.RB push %r10
  4022be:	52                   	push   %rdx
  4022bf:	4f 52                	rex.WRXB push %r10
  4022c1:	3a 20                	cmp    (%rax),%ah
  4022c3:	63 6c 6f 73          	movslq 0x73(%rdi,%rbp,2),%ebp
  4022c7:	65 20 65 72          	and    %ah,%gs:0x72(%rbp)
  4022cb:	72 6f                	jb     40233c <array.3089+0x2dc>
  4022cd:	72 00                	jb     4022cf <array.3089+0x26f>
  4022cf:	45 52                	rex.RB push %r10
  4022d1:	52                   	push   %rdx
  4022d2:	4f 52                	rex.WRXB push %r10
  4022d4:	3a 20                	cmp    (%rax),%ah
  4022d6:	74 6d                	je     402345 <array.3089+0x2e5>
  4022d8:	70 66                	jo     402340 <array.3089+0x2e0>
  4022da:	69 6c 65 20 65 72 72 	imul   $0x6f727265,0x20(%rbp,%riz,2),%ebp
  4022e1:	6f 
  4022e2:	72 00                	jb     4022e4 <array.3089+0x284>
  4022e4:	53                   	push   %rbx
  4022e5:	75 62                	jne    402349 <array.3089+0x2e9>
  4022e7:	6a 65                	pushq  $0x65
  4022e9:	63 74 3a 20          	movslq 0x20(%rdx,%rdi,1),%esi
  4022ed:	42 6f                	rex.X outsl %ds:(%rsi),(%dx)
  4022ef:	6d                   	insl   (%dx),%es:(%rdi)
  4022f0:	62                   	(bad)  
  4022f1:	20 6e 6f             	and    %ch,0x6f(%rsi)
  4022f4:	74 69                	je     40235f <array.3089+0x2ff>
  4022f6:	66 69 63 61 74 69    	imul   $0x6974,0x61(%rbx),%sp
  4022fc:	6f                   	outsl  %ds:(%rsi),(%dx)
  4022fd:	6e                   	outsb  %ds:(%rsi),(%dx)
  4022fe:	0a 00                	or     (%rax),%al
  402300:	6c                   	insb   (%dx),%es:(%rdi)
  402301:	6f                   	outsl  %ds:(%rsi),(%dx)
  402302:	63 61 6c             	movslq 0x6c(%rcx),%esp
  402305:	68 6f 73 74 00       	pushq  $0x74736f
  40230a:	69 63 73 62 6f 6d 62 	imul   $0x626d6f62,0x73(%rbx),%esp
  402311:	00 2f                	add    %ch,(%rdi)
  402313:	75 73                	jne    402388 <array.3089+0x328>
  402315:	72 2f                	jb     402346 <array.3089+0x2e6>
  402317:	73 62                	jae    40237b <array.3089+0x31b>
  402319:	69 6e 2f 73 65 6e 64 	imul   $0x646e6573,0x2f(%rsi),%ebp
  402320:	6d                   	insl   (%dx),%es:(%rdi)
  402321:	61                   	(bad)  
  402322:	69 6c 20 2d 62 6d 00 	imul   $0x25006d62,0x2d(%rax,%riz,1),%ebp
  402329:	25 
  40232a:	73 20                	jae    40234c <array.3089+0x2ec>
  40232c:	25 73 40 25 73       	and    $0x73254073,%eax
  402331:	00 45 52             	add    %al,0x52(%rbp)
  402334:	52                   	push   %rdx
  402335:	4f 52                	rex.WRXB push %r10
  402337:	3a 20                	cmp    (%rax),%ah
  402339:	6e                   	outsb  %ds:(%rsi),(%dx)
  40233a:	6f                   	outsl  %ds:(%rsi),(%dx)
  40233b:	74 69                	je     4023a6 <array.3089+0x346>
  40233d:	66 69 63 61 74 69    	imul   $0x6974,0x61(%rbx),%sp
  402343:	6f                   	outsl  %ds:(%rsi),(%dx)
  402344:	6e                   	outsb  %ds:(%rsi),(%dx)
  402345:	20 65 72             	and    %ah,0x72(%rbp)
  402348:	72 6f                	jb     4023b9 <array.3089+0x359>
  40234a:	72 00                	jb     40234c <array.3089+0x2ec>
  40234c:	45 52                	rex.RB push %r10
  40234e:	52                   	push   %rdx
  40234f:	4f 52                	rex.WRXB push %r10
  402351:	3a 20                	cmp    (%rax),%ah
  402353:	66 63 6c 6f 73       	movslq 0x73(%rdi,%rbp,2),%bp
  402358:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%rbp,%rbp,2)
  40235d:	29 20                	sub    %esp,(%rax)
  40235f:	65 72 72             	gs jb  4023d4 <array.3089+0x374>
  402362:	6f                   	outsl  %ds:(%rsi),(%dx)
  402363:	72 00                	jb     402365 <array.3089+0x305>
  402365:	45 52                	rex.RB push %r10
  402367:	52                   	push   %rdx
  402368:	4f 52                	rex.WRXB push %r10
  40236a:	3a 20                	cmp    (%rax),%ah
  40236c:	64 75 70             	fs jne 4023df <array.3089+0x37f>
  40236f:	28 74 6d 70          	sub    %dh,0x70(%rbp,%rbp,2)
  402373:	73 74                	jae    4023e9 <array.3089+0x389>
  402375:	64 69 6e 29 20 65 72 	imul   $0x72726520,%fs:0x29(%rsi),%ebp
  40237c:	72 
  40237d:	6f                   	outsl  %ds:(%rsi),(%dx)
  40237e:	72 00                	jb     402380 <array.3089+0x320>
  402380:	45 52                	rex.RB push %r10
  402382:	52                   	push   %rdx
  402383:	4f 52                	rex.WRXB push %r10
  402385:	3a 20                	cmp    (%rax),%ah
  402387:	63 6c 6f 73          	movslq 0x73(%rdi,%rbp,2),%ebp
  40238b:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%rbp,%rbp,2)
  402390:	73 74                	jae    402406 <array.3089+0x3a6>
  402392:	64 69 6e 29 00 0a 42 	imul   $0x4f420a00,%fs:0x29(%rsi),%ebp
  402399:	4f 
  40239a:	4f                   	rex.WRXB
  40239b:	4d 21 21             	and    %r12,(%r9)
  40239e:	21 00                	and    %eax,(%rax)
  4023a0:	54                   	push   %rsp
  4023a1:	68 65 20 62 6f       	pushq  $0x6f622065
  4023a6:	6d                   	insl   (%dx),%es:(%rdi)
  4023a7:	62                   	(bad)  
  4023a8:	20 68 61             	and    %ch,0x61(%rax)
  4023ab:	73 20                	jae    4023cd <array.3089+0x36d>
  4023ad:	62                   	(bad)  
  4023ae:	6c                   	insb   (%dx),%es:(%rdi)
  4023af:	6f                   	outsl  %ds:(%rsi),(%dx)
  4023b0:	77 6e                	ja     402420 <__GNU_EH_FRAME_HDR>
  4023b2:	20 75 70             	and    %dh,0x70(%rbp)
  4023b5:	2e 00 25 64 20 25 64 	add    %ah,%cs:0x64252064(%rip)        # 64654420 <_end+0x640505b0>
  4023bc:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 64654426 <_end+0x640505b6>
  4023c2:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 6465442c <_end+0x640505bc>
  4023c8:	00 45 72             	add    %al,0x72(%rbp)
  4023cb:	72 6f                	jb     40243c <__GNU_EH_FRAME_HDR+0x1c>
  4023cd:	72 3a                	jb     402409 <array.3089+0x3a9>
  4023cf:	20 50 72             	and    %dl,0x72(%rax)
  4023d2:	65 6d                	gs insl (%dx),%es:(%rdi)
  4023d4:	61                   	(bad)  
  4023d5:	74 75                	je     40244c <__GNU_EH_FRAME_HDR+0x2c>
  4023d7:	72 65                	jb     40243e <__GNU_EH_FRAME_HDR+0x1e>
  4023d9:	20 45 4f             	and    %al,0x4f(%rbp)
  4023dc:	46 20 6f 6e          	rex.RX and %r13b,0x6e(%rdi)
  4023e0:	20 73 74             	and    %dh,0x74(%rbx)
  4023e3:	64 69 6e 00 47 52 41 	imul   $0x44415247,%fs:0x0(%rsi),%ebp
  4023ea:	44 
  4023eb:	45 5f                	rex.RB pop %r15
  4023ed:	42                   	rex.X
  4023ee:	4f                   	rex.WRXB
  4023ef:	4d                   	rex.WRB
  4023f0:	42 00 45 72          	rex.X add %al,0x72(%rbp)
  4023f4:	72 6f                	jb     402465 <__GNU_EH_FRAME_HDR+0x45>
  4023f6:	72 3a                	jb     402432 <__GNU_EH_FRAME_HDR+0x12>
  4023f8:	20 49 6e             	and    %cl,0x6e(%rcx)
  4023fb:	70 75                	jo     402472 <__GNU_EH_FRAME_HDR+0x52>
  4023fd:	74 20                	je     40241f <array.3089+0x3bf>
  4023ff:	6c                   	insb   (%dx),%es:(%rdi)
  402400:	69 6e 65 20 74 6f 6f 	imul   $0x6f6f7420,0x65(%rsi),%ebp
  402407:	20 6c 6f 6e          	and    %ch,0x6e(%rdi,%rbp,2)
  40240b:	67 00 25 64 20 25 73 	add    %ah,0x73252064(%eip)        # 73654476 <_end+0x73050606>
  402412:	00 61 75             	add    %ah,0x75(%rcx)
  402415:	73 74                	jae    40248b <__GNU_EH_FRAME_HDR+0x6b>
  402417:	69 6e 70 6f 77 65 72 	imul   $0x7265776f,0x70(%rsi),%ebp
  40241e:	73 00                	jae    402420 <__GNU_EH_FRAME_HDR>

Disassembly of section .eh_frame_hdr:

0000000000402420 <__GNU_EH_FRAME_HDR>:
  402420:	01 1b                	add    %ebx,(%rbx)
  402422:	03 3b                	add    (%rbx),%edi
  402424:	f4                   	hlt    
  402425:	00 00                	add    %al,(%rax)
  402427:	00 1d 00 00 00 60    	add    %bl,0x60000000(%rip)        # 6040242d <_end+0x5fdfe5bd>
  40242d:	e7 ff                	out    %eax,$0xff
  40242f:	ff 40 01             	incl   0x1(%rax)
  402432:	00 00                	add    %al,(%rax)
  402434:	70 e9                	jo     40241f <array.3089+0x3bf>
  402436:	ff                   	(bad)  
  402437:	ff 10                	callq  *(%rax)
  402439:	01 00                	add    %eax,(%rax)
  40243b:	00 66 ea             	add    %ah,-0x16(%rsi)
  40243e:	ff                   	(bad)  
  40243f:	ff 68 01             	ljmp   *0x1(%rax)
  402442:	00 00                	add    %al,(%rax)
  402444:	b6 eb                	mov    $0xeb,%dh
  402446:	ff                   	(bad)  
  402447:	ff 88 01 00 00 d6    	decl   -0x29ffffff(%rax)
  40244d:	eb ff                	jmp    40244e <__GNU_EH_FRAME_HDR+0x2e>
  40244f:	ff a8 01 00 00 2d    	ljmp   *0x2d000001(%rax)
  402455:	ec                   	in     (%dx),%al
  402456:	ff                   	(bad)  
  402457:	ff                   	(bad)  
  402458:	e8 01 00 00 ef       	callq  ffffffffef40245e <_end+0xffffffffeedfe5ee>
  40245d:	ec                   	in     (%dx),%al
  40245e:	ff                   	(bad)  
  40245f:	ff 08                	decl   (%rax)
  402461:	02 00                	add    (%rax),%al
  402463:	00 15 ed ff ff 20    	add    %dl,0x20ffffed(%rip)        # 21402456 <_end+0x20dfe5e6>
  402469:	02 00                	add    (%rax),%al
  40246b:	00 5c ed ff          	add    %bl,-0x1(%rbp,%rbp,8)
  40246f:	ff 40 02             	incl   0x2(%rax)
  402472:	00 00                	add    %al,(%rax)
  402474:	a0 ed ff ff 60 02 00 	movabs 0x8b00000260ffffed,%al
  40247b:	00 8b 
  40247d:	ee                   	out    %al,(%dx)
  40247e:	ff                   	(bad)  
  40247f:	ff a0 02 00 00 c8    	jmpq   *-0x37fffffe(%rax)
  402485:	ee                   	out    %al,(%dx)
  402486:	ff                   	(bad)  
  402487:	ff c0                	inc    %eax
  402489:	02 00                	add    (%rax),%al
  40248b:	00 1f                	add    %bl,(%rdi)
  40248d:	ef                   	out    %eax,(%dx)
  40248e:	ff                   	(bad)  
  40248f:	ff e0                	jmpq   *%rax
  402491:	02 00                	add    (%rax),%al
  402493:	00 76 ef             	add    %dh,-0x11(%rsi)
  402496:	ff                   	(bad)  
  402497:	ff                   	(bad)  
  402498:	f8                   	clc    
  402499:	02 00                	add    (%rax),%al
  40249b:	00 98 ef ff ff 10    	add    %bl,0x10ffffef(%rax)
  4024a1:	03 00                	add    (%rax),%eax
  4024a3:	00 b6 ef ff ff 28    	add    %dh,0x28ffffef(%rsi)
  4024a9:	03 00                	add    (%rax),%eax
  4024ab:	00 1d f0 ff ff 58    	add    %bl,0x58fffff0(%rip)        # 594024a1 <_end+0x58dfe631>
  4024b1:	03 00                	add    (%rax),%eax
  4024b3:	00 e8                	add    %ch,%al
  4024b5:	f0 ff                	lock (bad) 
  4024b7:	ff 90 03 00 00 1a    	callq  *0x1a000003(%rax)
  4024bd:	f1                   	icebp  
  4024be:	ff                   	(bad)  
  4024bf:	ff a8 03 00 00 55    	ljmp   *0x55000003(%rax)
  4024c5:	f1                   	icebp  
  4024c6:	ff                   	(bad)  
  4024c7:	ff d0                	callq  *%rax
  4024c9:	03 00                	add    (%rax),%eax
  4024cb:	00 a3 f1 ff ff f8    	add    %ah,-0x700000f(%rbx)
  4024d1:	03 00                	add    (%rax),%eax
  4024d3:	00 03                	add    %al,(%rbx)
  4024d5:	f2 ff                	repnz (bad) 
  4024d7:	ff                   	(bad)  
  4024d8:	38 04 00             	cmp    %al,(%rax,%rax,1)
  4024db:	00 46 f5             	add    %al,-0xb(%rsi)
  4024de:	ff                   	(bad)  
  4024df:	ff a0 04 00 00 c6    	jmpq   *-0x39fffffc(%rax)
  4024e5:	f7 ff                	idiv   %edi
  4024e7:	ff 08                	decl   (%rax)
  4024e9:	05 00 00 02 f8       	add    $0xf8020000,%eax
  4024ee:	ff                   	(bad)  
  4024ef:	ff 20                	jmpq   *(%rax)
  4024f1:	05 00 00 43 f8       	add    $0xf8430000,%eax
  4024f6:	ff                   	(bad)  
  4024f7:	ff 48 05             	decl   0x5(%rax)
  4024fa:	00 00                	add    %al,(%rax)
  4024fc:	44 f9                	rex.R stc 
  4024fe:	ff                   	(bad)  
  4024ff:	ff 68 05             	ljmp   *0x5(%rax)
  402502:	00 00                	add    %al,(%rax)
  402504:	e0 f9                	loopne 4024ff <__GNU_EH_FRAME_HDR+0xdf>
  402506:	ff                   	(bad)  
  402507:	ff 88 05 00 00 50    	decl   0x50000005(%rax)
  40250d:	fa                   	cli    
  40250e:	ff                   	(bad)  
  40250f:	ff d0                	callq  *%rax
  402511:	05                   	.byte 0x5
	...

Disassembly of section .eh_frame:

0000000000402518 <__FRAME_END__-0x4f0>:
  402518:	14 00                	adc    $0x0,%al
  40251a:	00 00                	add    %al,(%rax)
  40251c:	00 00                	add    %al,(%rax)
  40251e:	00 00                	add    %al,(%rax)
  402520:	01 7a 52             	add    %edi,0x52(%rdx)
  402523:	00 01                	add    %al,(%rcx)
  402525:	78 10                	js     402537 <__GNU_EH_FRAME_HDR+0x117>
  402527:	01 1b                	add    %ebx,(%rbx)
  402529:	0c 07                	or     $0x7,%al
  40252b:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  402531:	00 00                	add    %al,(%rax)
  402533:	00 1c 00             	add    %bl,(%rax,%rax,1)
  402536:	00 00                	add    %al,(%rax)
  402538:	58                   	pop    %rax
  402539:	e8 ff ff 2b 00       	callq  6c253d <_end+0xbe6cd>
	...
  402546:	00 00                	add    %al,(%rax)
  402548:	14 00                	adc    $0x0,%al
  40254a:	00 00                	add    %al,(%rax)
  40254c:	00 00                	add    %al,(%rax)
  40254e:	00 00                	add    %al,(%rax)
  402550:	01 7a 52             	add    %edi,0x52(%rdx)
  402553:	00 01                	add    %al,(%rcx)
  402555:	78 10                	js     402567 <__GNU_EH_FRAME_HDR+0x147>
  402557:	01 1b                	add    %ebx,(%rbx)
  402559:	0c 07                	or     $0x7,%al
  40255b:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  402561:	00 00                	add    %al,(%rax)
  402563:	00 1c 00             	add    %bl,(%rax,%rax,1)
  402566:	00 00                	add    %al,(%rax)
  402568:	18 e6                	sbb    %ah,%dh
  40256a:	ff                   	(bad)  
  40256b:	ff 10                	callq  *(%rax)
  40256d:	02 00                	add    (%rax),%al
  40256f:	00 00                	add    %al,(%rax)
  402571:	0e                   	(bad)  
  402572:	10 46 0e             	adc    %al,0xe(%rsi)
  402575:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  402578:	0b 77 08             	or     0x8(%rdi),%esi
  40257b:	80 00 3f             	addb   $0x3f,(%rax)
  40257e:	1a 3b                	sbb    (%rbx),%bh
  402580:	2a 33                	sub    (%rbx),%dh
  402582:	24 22                	and    $0x22,%al
  402584:	00 00                	add    %al,(%rax)
  402586:	00 00                	add    %al,(%rax)
  402588:	1c 00                	sbb    $0x0,%al
  40258a:	00 00                	add    %al,(%rax)
  40258c:	44 00 00             	add    %r8b,(%rax)
  40258f:	00 f6                	add    %dh,%dh
  402591:	e8 ff ff 50 01       	callq  1912595 <_end+0x130e725>
  402596:	00 00                	add    %al,(%rax)
  402598:	00 41 0e             	add    %al,0xe(%rcx)
  40259b:	10 83 02 03 00 01    	adc    %al,0x1000302(%rbx)
  4025a1:	0a 0e                	or     (%rsi),%cl
  4025a3:	08 41 0b             	or     %al,0xb(%rcx)
  4025a6:	00 00                	add    %al,(%rax)
  4025a8:	1c 00                	sbb    $0x0,%al
  4025aa:	00 00                	add    %al,(%rax)
  4025ac:	64 00 00             	add    %al,%fs:(%rax)
  4025af:	00 26                	add    %ah,(%rsi)
  4025b1:	ea                   	(bad)  
  4025b2:	ff                   	(bad)  
  4025b3:	ff 20                	jmpq   *(%rax)
  4025b5:	00 00                	add    %al,(%rax)
  4025b7:	00 00                	add    %al,(%rax)
  4025b9:	44 0e                	rex.R (bad) 
  4025bb:	10 54 0a 0e          	adc    %dl,0xe(%rdx,%rcx,1)
  4025bf:	08 41 0b             	or     %al,0xb(%rcx)
  4025c2:	00 00                	add    %al,(%rax)
  4025c4:	00 00                	add    %al,(%rax)
  4025c6:	00 00                	add    %al,(%rax)
  4025c8:	3c 00                	cmp    $0x0,%al
  4025ca:	00 00                	add    %al,(%rax)
  4025cc:	84 00                	test   %al,(%rax)
  4025ce:	00 00                	add    %al,(%rax)
  4025d0:	26 ea                	es (bad) 
  4025d2:	ff                   	(bad)  
  4025d3:	ff 57 00             	callq  *0x0(%rdi)
  4025d6:	00 00                	add    %al,(%rax)
  4025d8:	00 42 0e             	add    %al,0xe(%rdx)
  4025db:	10 8d 02 42 0e 18    	adc    %cl,0x180e4202(%rbp)
  4025e1:	8c 03                	mov    %es,(%rbx)
  4025e3:	41 0e                	rex.B (bad) 
  4025e5:	20 86 04 41 0e 28    	and    %al,0x280e4104(%rsi)
  4025eb:	83 05 44 0e 50 7f 0a 	addl   $0xa,0x7f500e44(%rip)        # 7f903436 <_end+0x7f2ff5c6>
  4025f2:	0e                   	(bad)  
  4025f3:	28 41 0e             	sub    %al,0xe(%rcx)
  4025f6:	20 41 0e             	and    %al,0xe(%rcx)
  4025f9:	18 42 0e             	sbb    %al,0xe(%rdx)
  4025fc:	10 42 0e             	adc    %al,0xe(%rdx)
  4025ff:	08 41 0b             	or     %al,0xb(%rcx)
  402602:	00 00                	add    %al,(%rax)
  402604:	00 00                	add    %al,(%rax)
  402606:	00 00                	add    %al,(%rax)
  402608:	1c 00                	sbb    $0x0,%al
  40260a:	00 00                	add    %al,(%rax)
  40260c:	c4                   	(bad)  
  40260d:	00 00                	add    %al,(%rax)
  40260f:	00 3d ea ff ff c2    	add    %bh,-0x3d000016(%rip)        # ffffffffc34025ff <_end+0xffffffffc2dfe78f>
  402615:	00 00                	add    %al,(%rax)
  402617:	00 00                	add    %al,(%rax)
  402619:	44 0e                	rex.R (bad) 
  40261b:	20 02                	and    %al,(%rdx)
  40261d:	87 0a                	xchg   %ecx,(%rdx)
  40261f:	0e                   	(bad)  
  402620:	08 41 0b             	or     %al,0xb(%rcx)
  402623:	00 00                	add    %al,(%rax)
  402625:	00 00                	add    %al,(%rax)
  402627:	00 14 00             	add    %dl,(%rax,%rax,1)
  40262a:	00 00                	add    %al,(%rax)
  40262c:	e4 00                	in     $0x0,%al
  40262e:	00 00                	add    %al,(%rax)
  402630:	df ea                	fucomip %st(2),%st
  402632:	ff                   	(bad)  
  402633:	ff 26                	jmpq   *(%rsi)
  402635:	00 00                	add    %al,(%rax)
  402637:	00 00                	add    %al,(%rax)
  402639:	4d 0e                	rex.WRB (bad) 
  40263b:	10 57 0e             	adc    %dl,0xe(%rdi)
  40263e:	08 00                	or     %al,(%rax)
  402640:	1c 00                	sbb    $0x0,%al
  402642:	00 00                	add    %al,(%rax)
  402644:	fc                   	cld    
  402645:	00 00                	add    %al,(%rax)
  402647:	00 ed                	add    %ch,%ch
  402649:	ea                   	(bad)  
  40264a:	ff                   	(bad)  
  40264b:	ff 47 00             	incl   0x0(%rdi)
  40264e:	00 00                	add    %al,(%rax)
  402650:	00 44 0e 20          	add    %al,0x20(%rsi,%rcx,1)
  402654:	79 0a                	jns    402660 <__GNU_EH_FRAME_HDR+0x240>
  402656:	0e                   	(bad)  
  402657:	08 41 0b             	or     %al,0xb(%rcx)
  40265a:	00 00                	add    %al,(%rax)
  40265c:	00 00                	add    %al,(%rax)
  40265e:	00 00                	add    %al,(%rax)
  402660:	1c 00                	sbb    $0x0,%al
  402662:	00 00                	add    %al,(%rax)
  402664:	1c 01                	sbb    $0x1,%al
  402666:	00 00                	add    %al,(%rax)
  402668:	14 eb                	adc    $0xeb,%al
  40266a:	ff                   	(bad)  
  40266b:	ff 44 00 00          	incl   0x0(%rax,%rax,1)
  40266f:	00 00                	add    %al,(%rax)
  402671:	41 0e                	rex.B (bad) 
  402673:	10 83 02 02 42 0e    	adc    %al,0xe420202(%rbx)
  402679:	08 00                	or     %al,(%rax)
  40267b:	00 00                	add    %al,(%rax)
  40267d:	00 00                	add    %al,(%rax)
  40267f:	00 3c 00             	add    %bh,(%rax,%rax,1)
  402682:	00 00                	add    %al,(%rax)
  402684:	3c 01                	cmp    $0x1,%al
  402686:	00 00                	add    %al,(%rax)
  402688:	38 eb                	cmp    %ch,%bl
  40268a:	ff                   	(bad)  
  40268b:	ff                   	(bad)  
  40268c:	eb 00                	jmp    40268e <__GNU_EH_FRAME_HDR+0x26e>
  40268e:	00 00                	add    %al,(%rax)
  402690:	00 42 0e             	add    %al,0xe(%rdx)
  402693:	10 8d 02 42 0e 18    	adc    %cl,0x180e4202(%rbp)
  402699:	8c 03                	mov    %es,(%rbx)
  40269b:	41 0e                	rex.B (bad) 
  40269d:	20 86 04 41 0e 28    	and    %al,0x280e4104(%rsi)
  4026a3:	83 05 44 0e 80 01 02 	addl   $0x2,0x1800e44(%rip)        # 1c034ee <_end+0x15ff67e>
  4026aa:	da 0e                	fimull (%rsi)
  4026ac:	28 41 0e             	sub    %al,0xe(%rcx)
  4026af:	20 41 0e             	and    %al,0xe(%rcx)
  4026b2:	18 42 0e             	sbb    %al,0xe(%rdx)
  4026b5:	10 42 0e             	adc    %al,0xe(%rdx)
  4026b8:	08 00                	or     %al,(%rax)
  4026ba:	00 00                	add    %al,(%rax)
  4026bc:	00 00                	add    %al,(%rax)
  4026be:	00 00                	add    %al,(%rax)
  4026c0:	1c 00                	sbb    $0x0,%al
  4026c2:	00 00                	add    %al,(%rax)
  4026c4:	7c 01                	jl     4026c7 <__GNU_EH_FRAME_HDR+0x2a7>
  4026c6:	00 00                	add    %al,(%rax)
  4026c8:	e3 eb                	jrcxz  4026b5 <__GNU_EH_FRAME_HDR+0x295>
  4026ca:	ff                   	(bad)  
  4026cb:	ff                   	(bad)  
  4026cc:	3d 00 00 00 00       	cmp    $0x0,%eax
  4026d1:	49 0e                	rex.WB (bad) 
  4026d3:	10 60 0a             	adc    %ah,0xa(%rax)
  4026d6:	0e                   	(bad)  
  4026d7:	08 41 0b             	or     %al,0xb(%rcx)
  4026da:	4d 0e                	rex.WRB (bad) 
  4026dc:	08 00                	or     %al,(%rax)
  4026de:	00 00                	add    %al,(%rax)
  4026e0:	1c 00                	sbb    $0x0,%al
  4026e2:	00 00                	add    %al,(%rax)
  4026e4:	9c                   	pushfq 
  4026e5:	01 00                	add    %eax,(%rax)
  4026e7:	00 00                	add    %al,(%rax)
  4026e9:	ec                   	in     (%dx),%al
  4026ea:	ff                   	(bad)  
  4026eb:	ff 57 00             	callq  *0x0(%rdi)
  4026ee:	00 00                	add    %al,(%rax)
  4026f0:	00 41 0e             	add    %al,0xe(%rcx)
  4026f3:	10 83 02 02 4e 0a    	adc    %al,0xa4e0202(%rbx)
  4026f9:	0e                   	(bad)  
  4026fa:	08 41 0b             	or     %al,0xb(%rcx)
  4026fd:	00 00                	add    %al,(%rax)
  4026ff:	00 14 00             	add    %dl,(%rax,%rax,1)
  402702:	00 00                	add    %al,(%rax)
  402704:	bc 01 00 00 37       	mov    $0x37000001,%esp
  402709:	ec                   	in     (%dx),%al
  40270a:	ff                   	(bad)  
  40270b:	ff 57 00             	callq  *0x0(%rdi)
  40270e:	00 00                	add    %al,(%rax)
  402710:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  402714:	00 00                	add    %al,(%rax)
  402716:	00 00                	add    %al,(%rax)
  402718:	14 00                	adc    $0x0,%al
  40271a:	00 00                	add    %al,(%rax)
  40271c:	d4                   	(bad)  
  40271d:	01 00                	add    %eax,(%rax)
  40271f:	00 76 ec             	add    %dh,-0x14(%rsi)
  402722:	ff                   	(bad)  
  402723:	ff 22                	jmpq   *(%rdx)
  402725:	00 00                	add    %al,(%rax)
  402727:	00 00                	add    %al,(%rax)
  402729:	44 0e                	rex.R (bad) 
  40272b:	10 00                	adc    %al,(%rax)
  40272d:	00 00                	add    %al,(%rax)
  40272f:	00 14 00             	add    %dl,(%rax,%rax,1)
  402732:	00 00                	add    %al,(%rax)
  402734:	ec                   	in     (%dx),%al
  402735:	01 00                	add    %eax,(%rax)
  402737:	00 80 ec ff ff 1e    	add    %al,0x1effffec(%rax)
	...
  402745:	00 00                	add    %al,(%rax)
  402747:	00 2c 00             	add    %ch,(%rax,%rax,1)
  40274a:	00 00                	add    %al,(%rax)
  40274c:	04 02                	add    $0x2,%al
  40274e:	00 00                	add    %al,(%rax)
  402750:	86 ec                	xchg   %ch,%ah
  402752:	ff                   	(bad)  
  402753:	ff 67 00             	jmpq   *0x0(%rdi)
  402756:	00 00                	add    %al,(%rax)
  402758:	00 42 0e             	add    %al,0xe(%rdx)
  40275b:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
  402762:	03 41 0e             	add    0xe(%rcx),%eax
  402765:	20 83 04 63 0a 0e    	and    %al,0xe0a6304(%rbx)
  40276b:	18 41 0e             	sbb    %al,0xe(%rcx)
  40276e:	10 42 0e             	adc    %al,0xe(%rdx)
  402771:	08 41 0b             	or     %al,0xb(%rcx)
  402774:	00 00                	add    %al,(%rax)
  402776:	00 00                	add    %al,(%rax)
  402778:	34 00                	xor    $0x0,%al
  40277a:	00 00                	add    %al,(%rax)
  40277c:	34 02                	xor    $0x2,%al
  40277e:	00 00                	add    %al,(%rax)
  402780:	bd ec ff ff cb       	mov    $0xcbffffec,%ebp
  402785:	00 00                	add    %al,(%rax)
  402787:	00 00                	add    %al,(%rax)
  402789:	42 0e                	rex.X (bad) 
  40278b:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
  402792:	03 41 0e             	add    0xe(%rcx),%eax
  402795:	20 83 04 44 0e 30    	and    %al,0x300e4404(%rbx)
  40279b:	02 7c 0a 0e          	add    0xe(%rdx,%rcx,1),%bh
  40279f:	20 41 0e             	and    %al,0xe(%rcx)
  4027a2:	18 41 0e             	sbb    %al,0xe(%rcx)
  4027a5:	10 42 0e             	adc    %al,0xe(%rdx)
  4027a8:	08 41 0b             	or     %al,0xb(%rcx)
  4027ab:	00 00                	add    %al,(%rax)
  4027ad:	00 00                	add    %al,(%rax)
  4027af:	00 14 00             	add    %dl,(%rax,%rax,1)
  4027b2:	00 00                	add    %al,(%rax)
  4027b4:	6c                   	insb   (%dx),%es:(%rdi)
  4027b5:	02 00                	add    (%rax),%al
  4027b7:	00 50 ed             	add    %dl,-0x13(%rax)
  4027ba:	ff                   	(bad)  
  4027bb:	ff 32                	pushq  (%rdx)
  4027bd:	00 00                	add    %al,(%rax)
  4027bf:	00 00                	add    %al,(%rax)
  4027c1:	44 0e                	rex.R (bad) 
  4027c3:	10 6d 0e             	adc    %ch,0xe(%rbp)
  4027c6:	08 00                	or     %al,(%rax)
  4027c8:	24 00                	and    $0x0,%al
  4027ca:	00 00                	add    %al,(%rax)
  4027cc:	84 02                	test   %al,(%rdx)
  4027ce:	00 00                	add    %al,(%rax)
  4027d0:	6a ed                	pushq  $0xffffffffffffffed
  4027d2:	ff                   	(bad)  
  4027d3:	ff                   	(bad)  
  4027d4:	3b 00                	cmp    (%rax),%eax
  4027d6:	00 00                	add    %al,(%rax)
  4027d8:	00 41 0e             	add    %al,0xe(%rcx)
  4027db:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
  4027e1:	83 03 44             	addl   $0x44,(%rbx)
  4027e4:	0e                   	(bad)  
  4027e5:	20 72 0e             	and    %dh,0xe(%rdx)
  4027e8:	18 41 0e             	sbb    %al,0xe(%rcx)
  4027eb:	10 41 0e             	adc    %al,0xe(%rcx)
  4027ee:	08 00                	or     %al,(%rax)
  4027f0:	24 00                	and    $0x0,%al
  4027f2:	00 00                	add    %al,(%rax)
  4027f4:	ac                   	lods   %ds:(%rsi),%al
  4027f5:	02 00                	add    (%rax),%al
  4027f7:	00 7d ed             	add    %bh,-0x13(%rbp)
  4027fa:	ff                   	(bad)  
  4027fb:	ff 4e 00             	decl   0x0(%rsi)
  4027fe:	00 00                	add    %al,(%rax)
  402800:	00 41 0e             	add    %al,0xe(%rcx)
  402803:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
  402809:	83 03 44             	addl   $0x44,(%rbx)
  40280c:	0e                   	(bad)  
  40280d:	20 02                	and    %al,(%rdx)
  40280f:	45 0e                	rex.RB (bad) 
  402811:	18 41 0e             	sbb    %al,0xe(%rcx)
  402814:	10 41 0e             	adc    %al,0xe(%rcx)
  402817:	08 3c 00             	or     %bh,(%rax,%rax,1)
  40281a:	00 00                	add    %al,(%rax)
  40281c:	d4                   	(bad)  
  40281d:	02 00                	add    (%rax),%al
  40281f:	00 a3 ed ff ff 60    	add    %ah,0x60ffffed(%rbx)
  402825:	00 00                	add    %al,(%rax)
  402827:	00 00                	add    %al,(%rax)
  402829:	42 0e                	rex.X (bad) 
  40282b:	10 8e 02 42 0e 18    	adc    %cl,0x180e4202(%rsi)
  402831:	8d 03                	lea    (%rbx),%eax
  402833:	42 0e                	rex.X (bad) 
  402835:	20 8c 04 41 0e 28 86 	and    %cl,-0x79d7f1bf(%rsp,%rax,1)
  40283c:	05 41 0e 30 83       	add    $0x83300e41,%eax
  402841:	06                   	(bad)  
  402842:	02 47 0a             	add    0xa(%rdi),%al
  402845:	0e                   	(bad)  
  402846:	28 41 0e             	sub    %al,0xe(%rcx)
  402849:	20 42 0e             	and    %al,0xe(%rdx)
  40284c:	18 42 0e             	sbb    %al,0xe(%rdx)
  40284f:	10 42 0e             	adc    %al,0xe(%rdx)
  402852:	08 41 0b             	or     %al,0xb(%rcx)
  402855:	00 00                	add    %al,(%rax)
  402857:	00 64 00 00          	add    %ah,0x0(%rax,%rax,1)
  40285b:	00 14 03             	add    %dl,(%rbx,%rax,1)
  40285e:	00 00                	add    %al,(%rax)
  402860:	c3                   	retq   
  402861:	ed                   	in     (%dx),%eax
  402862:	ff                   	(bad)  
  402863:	ff 43 03             	incl   0x3(%rbx)
  402866:	00 00                	add    %al,(%rax)
  402868:	00 42 0e             	add    %al,0xe(%rdx)
  40286b:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  402871:	8e 03                	mov    (%rbx),%es
  402873:	42 0e                	rex.X (bad) 
  402875:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  40287b:	8c 05 41 0e 30 86    	mov    %es,-0x79cff1bf(%rip)        # ffffffff867036c2 <_end+0xffffffff860ff852>
  402881:	06                   	(bad)  
  402882:	41 0e                	rex.B (bad) 
  402884:	38 83 07 47 0e a0    	cmp    %al,-0x5ff1b8f9(%rbx)
  40288a:	49 03 2c 01          	add    (%r9,%rax,1),%rbp
  40288e:	0e                   	(bad)  
  40288f:	a8 49                	test   $0x49,%al
  402891:	47 0e                	rex.RXB (bad) 
  402893:	b0 49                	mov    $0x49,%al
  402895:	7a 0e                	jp     4028a5 <__GNU_EH_FRAME_HDR+0x485>
  402897:	a0 49 7a 0e a8 49 41 	movabs 0xb00e4149a80e7a49,%al
  40289e:	0e b0 
  4028a0:	49 76 0e             	rex.WB jbe 4028b1 <__GNU_EH_FRAME_HDR+0x491>
  4028a3:	a0 49 02 63 0a 0e 38 	movabs 0xe41380e0a630249,%al
  4028aa:	41 0e 
  4028ac:	30 41 0e             	xor    %al,0xe(%rcx)
  4028af:	28 42 0e             	sub    %al,0xe(%rdx)
  4028b2:	20 42 0e             	and    %al,0xe(%rdx)
  4028b5:	18 42 0e             	sbb    %al,0xe(%rdx)
  4028b8:	10 42 0e             	adc    %al,0xe(%rdx)
  4028bb:	08 41 0b             	or     %al,0xb(%rcx)
  4028be:	00 00                	add    %al,(%rax)
  4028c0:	64 00 00             	add    %al,%fs:(%rax)
  4028c3:	00 7c 03 00          	add    %bh,0x0(%rbx,%rax,1)
  4028c7:	00 9e f0 ff ff 80    	add    %bl,-0x7f000010(%rsi)
  4028cd:	02 00                	add    (%rax),%al
  4028cf:	00 00                	add    %al,(%rax)
  4028d1:	42 0e                	rex.X (bad) 
  4028d3:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  4028d9:	8e 03                	mov    (%rbx),%es
  4028db:	42 0e                	rex.X (bad) 
  4028dd:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  4028e3:	8c 05 41 0e 30 86    	mov    %es,-0x79cff1bf(%rip)        # ffffffff8670372a <_end+0xffffffff860ff8ba>
  4028e9:	06                   	(bad)  
  4028ea:	41 0e                	rex.B (bad) 
  4028ec:	38 83 07 44 0e a0    	cmp    %al,-0x5ff1bbf9(%rbx)
  4028f2:	01 02                	add    %eax,(%rdx)
  4028f4:	9b                   	fwait
  4028f5:	0e                   	(bad)  
  4028f6:	a8 01                	test   $0x1,%al
  4028f8:	47 0e                	rex.RXB (bad) 
  4028fa:	b0 01                	mov    $0x1,%al
  4028fc:	6a 0e                	pushq  $0xe
  4028fe:	a0 01 7d 0e a8 01 41 	movabs 0xb00e4101a80e7d01,%al
  402905:	0e b0 
  402907:	01 63 0e             	add    %esp,0xe(%rbx)
  40290a:	a0 01 02 87 0a 0e 38 	movabs 0xe41380e0a870201,%al
  402911:	41 0e 
  402913:	30 41 0e             	xor    %al,0xe(%rcx)
  402916:	28 42 0e             	sub    %al,0xe(%rdx)
  402919:	20 42 0e             	and    %al,0xe(%rdx)
  40291c:	18 42 0e             	sbb    %al,0xe(%rdx)
  40291f:	10 42 0e             	adc    %al,0xe(%rdx)
  402922:	08 41 0b             	or     %al,0xb(%rcx)
  402925:	00 00                	add    %al,(%rax)
  402927:	00 14 00             	add    %dl,(%rax,%rax,1)
  40292a:	00 00                	add    %al,(%rax)
  40292c:	e4 03                	in     $0x3,%al
  40292e:	00 00                	add    %al,(%rax)
  402930:	b6 f2                	mov    $0xf2,%dh
  402932:	ff                   	(bad)  
  402933:	ff                   	(bad)  
  402934:	3c 00                	cmp    $0x0,%al
  402936:	00 00                	add    %al,(%rax)
  402938:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  40293c:	00 00                	add    %al,(%rax)
  40293e:	00 00                	add    %al,(%rax)
  402940:	24 00                	and    $0x0,%al
  402942:	00 00                	add    %al,(%rax)
  402944:	fc                   	cld    
  402945:	03 00                	add    (%rax),%eax
  402947:	00 da                	add    %bl,%dl
  402949:	f2 ff                	repnz (bad) 
  40294b:	ff 41 00             	incl   0x0(%rcx)
  40294e:	00 00                	add    %al,(%rax)
  402950:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  402954:	4c 0e                	rex.WR (bad) 
  402956:	18 45 0e             	sbb    %al,0xe(%rbp)
  402959:	20 5d 0e             	and    %bl,0xe(%rbp)
  40295c:	10 49 0a             	adc    %cl,0xa(%rcx)
  40295f:	0e                   	(bad)  
  402960:	08 41 0b             	or     %al,0xb(%rcx)
  402963:	00 00                	add    %al,(%rax)
  402965:	00 00                	add    %al,(%rax)
  402967:	00 1c 00             	add    %bl,(%rax,%rax,1)
  40296a:	00 00                	add    %al,(%rax)
  40296c:	24 04                	and    $0x4,%al
  40296e:	00 00                	add    %al,(%rax)
  402970:	f3 f2 ff             	repz repnz (bad) 
  402973:	ff 01                	incl   (%rcx)
  402975:	01 00                	add    %eax,(%rax)
  402977:	00 00                	add    %al,(%rax)
  402979:	44 0e                	rex.R (bad) 
  40297b:	10 02                	adc    %al,(%rdx)
  40297d:	7d 0a                	jge    402989 <__GNU_EH_FRAME_HDR+0x569>
  40297f:	0e                   	(bad)  
  402980:	08 41 0b             	or     %al,0xb(%rcx)
  402983:	00 00                	add    %al,(%rax)
  402985:	00 00                	add    %al,(%rax)
  402987:	00 1c 00             	add    %bl,(%rax,%rax,1)
  40298a:	00 00                	add    %al,(%rax)
  40298c:	44 04 00             	rex.R add $0x0,%al
  40298f:	00 d4                	add    %dl,%ah
  402991:	f3 ff                	repz (bad) 
  402993:	ff 96 00 00 00 00    	callq  *0x0(%rsi)
  402999:	44 0e                	rex.R (bad) 
  40299b:	70 57                	jo     4029f4 <__GNU_EH_FRAME_HDR+0x5d4>
  40299d:	0a 0e                	or     (%rsi),%cl
  40299f:	08 41 0b             	or     %al,0xb(%rcx)
  4029a2:	00 00                	add    %al,(%rax)
  4029a4:	00 00                	add    %al,(%rax)
  4029a6:	00 00                	add    %al,(%rax)
  4029a8:	44 00 00             	add    %r8b,(%rax)
  4029ab:	00 64 04 00          	add    %ah,0x0(%rsp,%rax,1)
  4029af:	00 50 f4             	add    %dl,-0xc(%rax)
  4029b2:	ff                   	(bad)  
  4029b3:	ff 65 00             	jmpq   *0x0(%rbp)
  4029b6:	00 00                	add    %al,(%rax)
  4029b8:	00 42 0e             	add    %al,0xe(%rdx)
  4029bb:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  4029c1:	8e 03                	mov    (%rbx),%es
  4029c3:	45 0e                	rex.RB (bad) 
  4029c5:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  4029cb:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86703819 <_end+0xffffffff860ff9a9>
  4029d1:	06                   	(bad)  
  4029d2:	48 0e                	rex.W (bad) 
  4029d4:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  4029da:	72 0e                	jb     4029ea <__GNU_EH_FRAME_HDR+0x5ca>
  4029dc:	38 41 0e             	cmp    %al,0xe(%rcx)
  4029df:	30 41 0e             	xor    %al,0xe(%rcx)
  4029e2:	28 42 0e             	sub    %al,0xe(%rdx)
  4029e5:	20 42 0e             	and    %al,0xe(%rdx)
  4029e8:	18 42 0e             	sbb    %al,0xe(%rdx)
  4029eb:	10 42 0e             	adc    %al,0xe(%rdx)
  4029ee:	08 00                	or     %al,(%rax)
  4029f0:	14 00                	adc    $0x0,%al
  4029f2:	00 00                	add    %al,(%rax)
  4029f4:	ac                   	lods   %ds:(%rsi),%al
  4029f5:	04 00                	add    $0x0,%al
  4029f7:	00 78 f4             	add    %bh,-0xc(%rax)
  4029fa:	ff                   	(bad)  
  4029fb:	ff 02                	incl   (%rdx)
	...

0000000000402a08 <__FRAME_END__>:
  402a08:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000602e08 <__frame_dummy_init_array_entry>:
  602e08:	60                   	(bad)  
  602e09:	0e                   	(bad)  
  602e0a:	40 00 00             	add    %al,(%rax)
  602e0d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000602e10 <__do_global_dtors_aux_fini_array_entry>:
  602e10:	40 0e                	rex (bad) 
  602e12:	40 00 00             	add    %al,(%rax)
  602e15:	00 00                	add    %al,(%rax)
	...

Disassembly of section .jcr:

0000000000602e18 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000602e20 <_DYNAMIC>:
  602e20:	01 00                	add    %eax,(%rax)
  602e22:	00 00                	add    %al,(%rax)
  602e24:	00 00                	add    %al,(%rax)
  602e26:	00 00                	add    %al,(%rax)
  602e28:	01 00                	add    %eax,(%rax)
  602e2a:	00 00                	add    %al,(%rax)
  602e2c:	00 00                	add    %al,(%rax)
  602e2e:	00 00                	add    %al,(%rax)
  602e30:	0c 00                	or     $0x0,%al
  602e32:	00 00                	add    %al,(%rax)
  602e34:	00 00                	add    %al,(%rax)
  602e36:	00 00                	add    %al,(%rax)
  602e38:	68 0b 40 00 00       	pushq  $0x400b
  602e3d:	00 00                	add    %al,(%rax)
  602e3f:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 602e45 <_DYNAMIC+0x25>
  602e45:	00 00                	add    %al,(%rax)
  602e47:	00 74 1e 40          	add    %dh,0x40(%rsi,%rbx,1)
  602e4b:	00 00                	add    %al,(%rax)
  602e4d:	00 00                	add    %al,(%rax)
  602e4f:	00 19                	add    %bl,(%rcx)
  602e51:	00 00                	add    %al,(%rax)
  602e53:	00 00                	add    %al,(%rax)
  602e55:	00 00                	add    %al,(%rax)
  602e57:	00 08                	add    %cl,(%rax)
  602e59:	2e 60                	cs (bad) 
  602e5b:	00 00                	add    %al,(%rax)
  602e5d:	00 00                	add    %al,(%rax)
  602e5f:	00 1b                	add    %bl,(%rbx)
  602e61:	00 00                	add    %al,(%rax)
  602e63:	00 00                	add    %al,(%rax)
  602e65:	00 00                	add    %al,(%rax)
  602e67:	00 08                	add    %cl,(%rax)
  602e69:	00 00                	add    %al,(%rax)
  602e6b:	00 00                	add    %al,(%rax)
  602e6d:	00 00                	add    %al,(%rax)
  602e6f:	00 1a                	add    %bl,(%rdx)
  602e71:	00 00                	add    %al,(%rax)
  602e73:	00 00                	add    %al,(%rax)
  602e75:	00 00                	add    %al,(%rax)
  602e77:	00 10                	add    %dl,(%rax)
  602e79:	2e 60                	cs (bad) 
  602e7b:	00 00                	add    %al,(%rax)
  602e7d:	00 00                	add    %al,(%rax)
  602e7f:	00 1c 00             	add    %bl,(%rax,%rax,1)
  602e82:	00 00                	add    %al,(%rax)
  602e84:	00 00                	add    %al,(%rax)
  602e86:	00 00                	add    %al,(%rax)
  602e88:	08 00                	or     %al,(%rax)
  602e8a:	00 00                	add    %al,(%rax)
  602e8c:	00 00                	add    %al,(%rax)
  602e8e:	00 00                	add    %al,(%rax)
  602e90:	f5                   	cmc    
  602e91:	fe                   	(bad)  
  602e92:	ff 6f 00             	ljmp   *0x0(%rdi)
  602e95:	00 00                	add    %al,(%rax)
  602e97:	00 98 02 40 00 00    	add    %bl,0x4002(%rax)
  602e9d:	00 00                	add    %al,(%rax)
  602e9f:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 602ea5 <_DYNAMIC+0x85>
  602ea5:	00 00                	add    %al,(%rax)
  602ea7:	00 38                	add    %bh,(%rax)
  602ea9:	06                   	(bad)  
  602eaa:	40 00 00             	add    %al,(%rax)
  602ead:	00 00                	add    %al,(%rax)
  602eaf:	00 06                	add    %al,(%rsi)
  602eb1:	00 00                	add    %al,(%rax)
  602eb3:	00 00                	add    %al,(%rax)
  602eb5:	00 00                	add    %al,(%rax)
  602eb7:	00 c0                	add    %al,%al
  602eb9:	02 40 00             	add    0x0(%rax),%al
  602ebc:	00 00                	add    %al,(%rax)
  602ebe:	00 00                	add    %al,(%rax)
  602ec0:	0a 00                	or     (%rax),%al
  602ec2:	00 00                	add    %al,(%rax)
  602ec4:	00 00                	add    %al,(%rax)
  602ec6:	00 00                	add    %al,(%rax)
  602ec8:	41 01 00             	add    %eax,(%r8)
  602ecb:	00 00                	add    %al,(%rax)
  602ecd:	00 00                	add    %al,(%rax)
  602ecf:	00 0b                	add    %cl,(%rbx)
  602ed1:	00 00                	add    %al,(%rax)
  602ed3:	00 00                	add    %al,(%rax)
  602ed5:	00 00                	add    %al,(%rax)
  602ed7:	00 18                	add    %bl,(%rax)
  602ed9:	00 00                	add    %al,(%rax)
  602edb:	00 00                	add    %al,(%rax)
  602edd:	00 00                	add    %al,(%rax)
  602edf:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 602ee5 <_DYNAMIC+0xc5>
	...
  602eed:	00 00                	add    %al,(%rax)
  602eef:	00 03                	add    %al,(%rbx)
	...
  602ef9:	30 60 00             	xor    %ah,0x0(%rax)
  602efc:	00 00                	add    %al,(%rax)
  602efe:	00 00                	add    %al,(%rax)
  602f00:	02 00                	add    (%rax),%al
  602f02:	00 00                	add    %al,(%rax)
  602f04:	00 00                	add    %al,(%rax)
  602f06:	00 00                	add    %al,(%rax)
  602f08:	00 03                	add    %al,(%rbx)
  602f0a:	00 00                	add    %al,(%rax)
  602f0c:	00 00                	add    %al,(%rax)
  602f0e:	00 00                	add    %al,(%rax)
  602f10:	14 00                	adc    $0x0,%al
  602f12:	00 00                	add    %al,(%rax)
  602f14:	00 00                	add    %al,(%rax)
  602f16:	00 00                	add    %al,(%rax)
  602f18:	07                   	(bad)  
  602f19:	00 00                	add    %al,(%rax)
  602f1b:	00 00                	add    %al,(%rax)
  602f1d:	00 00                	add    %al,(%rax)
  602f1f:	00 17                	add    %dl,(%rdi)
  602f21:	00 00                	add    %al,(%rax)
  602f23:	00 00                	add    %al,(%rax)
  602f25:	00 00                	add    %al,(%rax)
  602f27:	00 68 08             	add    %ch,0x8(%rax)
  602f2a:	40 00 00             	add    %al,(%rax)
  602f2d:	00 00                	add    %al,(%rax)
  602f2f:	00 07                	add    %al,(%rdi)
  602f31:	00 00                	add    %al,(%rax)
  602f33:	00 00                	add    %al,(%rax)
  602f35:	00 00                	add    %al,(%rax)
  602f37:	00 08                	add    %cl,(%rax)
  602f39:	08 40 00             	or     %al,0x0(%rax)
  602f3c:	00 00                	add    %al,(%rax)
  602f3e:	00 00                	add    %al,(%rax)
  602f40:	08 00                	or     %al,(%rax)
  602f42:	00 00                	add    %al,(%rax)
  602f44:	00 00                	add    %al,(%rax)
  602f46:	00 00                	add    %al,(%rax)
  602f48:	60                   	(bad)  
  602f49:	00 00                	add    %al,(%rax)
  602f4b:	00 00                	add    %al,(%rax)
  602f4d:	00 00                	add    %al,(%rax)
  602f4f:	00 09                	add    %cl,(%rcx)
  602f51:	00 00                	add    %al,(%rax)
  602f53:	00 00                	add    %al,(%rax)
  602f55:	00 00                	add    %al,(%rax)
  602f57:	00 18                	add    %bl,(%rax)
  602f59:	00 00                	add    %al,(%rax)
  602f5b:	00 00                	add    %al,(%rax)
  602f5d:	00 00                	add    %al,(%rax)
  602f5f:	00 fe                	add    %bh,%dh
  602f61:	ff                   	(bad)  
  602f62:	ff 6f 00             	ljmp   *0x0(%rdi)
  602f65:	00 00                	add    %al,(%rax)
  602f67:	00 c8                	add    %cl,%al
  602f69:	07                   	(bad)  
  602f6a:	40 00 00             	add    %al,(%rax)
  602f6d:	00 00                	add    %al,(%rax)
  602f6f:	00 ff                	add    %bh,%bh
  602f71:	ff                   	(bad)  
  602f72:	ff 6f 00             	ljmp   *0x0(%rdi)
  602f75:	00 00                	add    %al,(%rax)
  602f77:	00 01                	add    %al,(%rcx)
  602f79:	00 00                	add    %al,(%rax)
  602f7b:	00 00                	add    %al,(%rax)
  602f7d:	00 00                	add    %al,(%rax)
  602f7f:	00 f0                	add    %dh,%al
  602f81:	ff                   	(bad)  
  602f82:	ff 6f 00             	ljmp   *0x0(%rdi)
  602f85:	00 00                	add    %al,(%rax)
  602f87:	00 7a 07             	add    %bh,0x7(%rdx)
  602f8a:	40 00 00             	add    %al,(%rax)
	...

Disassembly of section .got:

0000000000602ff0 <.got>:
	...

Disassembly of section .got.plt:

0000000000603000 <_GLOBAL_OFFSET_TABLE_>:
  603000:	20 2e                	and    %ch,(%rsi)
  603002:	60                   	(bad)  
	...
  603017:	00 96 0b 40 00 00    	add    %dl,0x400b(%rsi)
  60301d:	00 00                	add    %al,(%rax)
  60301f:	00 a6 0b 40 00 00    	add    %ah,0x400b(%rsi)
  603025:	00 00                	add    %al,(%rax)
  603027:	00 b6 0b 40 00 00    	add    %dh,0x400b(%rsi)
  60302d:	00 00                	add    %al,(%rax)
  60302f:	00 c6                	add    %al,%dh
  603031:	0b 40 00             	or     0x0(%rax),%eax
  603034:	00 00                	add    %al,(%rax)
  603036:	00 00                	add    %al,(%rax)
  603038:	d6                   	(bad)  
  603039:	0b 40 00             	or     0x0(%rax),%eax
  60303c:	00 00                	add    %al,(%rax)
  60303e:	00 00                	add    %al,(%rax)
  603040:	e6 0b                	out    %al,$0xb
  603042:	40 00 00             	add    %al,(%rax)
  603045:	00 00                	add    %al,(%rax)
  603047:	00 f6                	add    %dh,%dh
  603049:	0b 40 00             	or     0x0(%rax),%eax
  60304c:	00 00                	add    %al,(%rax)
  60304e:	00 00                	add    %al,(%rax)
  603050:	06                   	(bad)  
  603051:	0c 40                	or     $0x40,%al
  603053:	00 00                	add    %al,(%rax)
  603055:	00 00                	add    %al,(%rax)
  603057:	00 16                	add    %dl,(%rsi)
  603059:	0c 40                	or     $0x40,%al
  60305b:	00 00                	add    %al,(%rax)
  60305d:	00 00                	add    %al,(%rax)
  60305f:	00 26                	add    %ah,(%rsi)
  603061:	0c 40                	or     $0x40,%al
  603063:	00 00                	add    %al,(%rax)
  603065:	00 00                	add    %al,(%rax)
  603067:	00 36                	add    %dh,(%rsi)
  603069:	0c 40                	or     $0x40,%al
  60306b:	00 00                	add    %al,(%rax)
  60306d:	00 00                	add    %al,(%rax)
  60306f:	00 46 0c             	add    %al,0xc(%rsi)
  603072:	40 00 00             	add    %al,(%rax)
  603075:	00 00                	add    %al,(%rax)
  603077:	00 56 0c             	add    %dl,0xc(%rsi)
  60307a:	40 00 00             	add    %al,(%rax)
  60307d:	00 00                	add    %al,(%rax)
  60307f:	00 66 0c             	add    %ah,0xc(%rsi)
  603082:	40 00 00             	add    %al,(%rax)
  603085:	00 00                	add    %al,(%rax)
  603087:	00 76 0c             	add    %dh,0xc(%rsi)
  60308a:	40 00 00             	add    %al,(%rax)
  60308d:	00 00                	add    %al,(%rax)
  60308f:	00 86 0c 40 00 00    	add    %al,0x400c(%rsi)
  603095:	00 00                	add    %al,(%rax)
  603097:	00 96 0c 40 00 00    	add    %dl,0x400c(%rsi)
  60309d:	00 00                	add    %al,(%rax)
  60309f:	00 a6 0c 40 00 00    	add    %ah,0x400c(%rsi)
  6030a5:	00 00                	add    %al,(%rax)
  6030a7:	00 b6 0c 40 00 00    	add    %dh,0x400c(%rsi)
  6030ad:	00 00                	add    %al,(%rax)
  6030af:	00 c6                	add    %al,%dh
  6030b1:	0c 40                	or     $0x40,%al
  6030b3:	00 00                	add    %al,(%rax)
  6030b5:	00 00                	add    %al,(%rax)
  6030b7:	00 d6                	add    %dl,%dh
  6030b9:	0c 40                	or     $0x40,%al
  6030bb:	00 00                	add    %al,(%rax)
  6030bd:	00 00                	add    %al,(%rax)
  6030bf:	00 e6                	add    %ah,%dh
  6030c1:	0c 40                	or     $0x40,%al
  6030c3:	00 00                	add    %al,(%rax)
  6030c5:	00 00                	add    %al,(%rax)
  6030c7:	00 f6                	add    %dh,%dh
  6030c9:	0c 40                	or     $0x40,%al
  6030cb:	00 00                	add    %al,(%rax)
  6030cd:	00 00                	add    %al,(%rax)
  6030cf:	00 06                	add    %al,(%rsi)
  6030d1:	0d 40 00 00 00       	or     $0x40,%eax
  6030d6:	00 00                	add    %al,(%rax)
  6030d8:	16                   	(bad)  
  6030d9:	0d 40 00 00 00       	or     $0x40,%eax
  6030de:	00 00                	add    %al,(%rax)
  6030e0:	26 0d 40 00 00 00    	es or  $0x40,%eax
  6030e6:	00 00                	add    %al,(%rax)
  6030e8:	36 0d 40 00 00 00    	ss or  $0x40,%eax
  6030ee:	00 00                	add    %al,(%rax)
  6030f0:	46 0d 40 00 00 00    	rex.RX or $0x40,%eax
  6030f6:	00 00                	add    %al,(%rax)
  6030f8:	56                   	push   %rsi
  6030f9:	0d 40 00 00 00       	or     $0x40,%eax
  6030fe:	00 00                	add    %al,(%rax)
  603100:	66 0d 40 00          	or     $0x40,%ax
  603104:	00 00                	add    %al,(%rax)
  603106:	00 00                	add    %al,(%rax)
  603108:	76 0d                	jbe    603117 <_GLOBAL_OFFSET_TABLE_+0x117>
  60310a:	40 00 00             	add    %al,(%rax)
  60310d:	00 00                	add    %al,(%rax)
  60310f:	00 86 0d 40 00 00    	add    %al,0x400d(%rsi)
  603115:	00 00                	add    %al,(%rax)
	...

Disassembly of section .data:

0000000000603120 <__data_start>:
	...

0000000000603128 <__dso_handle>:
	...

0000000000603140 <n45>:
  603140:	28 00                	sub    %al,(%rax)
	...

0000000000603160 <n41>:
  603160:	01 00                	add    %eax,(%rax)
	...

0000000000603180 <n47>:
  603180:	63 00                	movslq (%rax),%eax
	...

00000000006031a0 <n44>:
  6031a0:	23 00                	and    (%rax),%eax
	...

00000000006031c0 <n42>:
  6031c0:	07                   	(bad)  
	...

00000000006031e0 <n43>:
  6031e0:	14 00                	adc    $0x0,%al
	...

0000000000603200 <n46>:
  603200:	2f                   	(bad)  
	...

0000000000603220 <n48>:
  603220:	e9 03 00 00 00       	jmpq   603228 <n48+0x8>
	...

0000000000603240 <node6>:
  603240:	b0 02                	mov    $0x2,%al
  603242:	00 00                	add    %al,(%rax)
  603244:	06                   	(bad)  
	...

0000000000603260 <lab_id>:
  603260:	53                   	push   %rbx
  603261:	45 31 39             	xor    %r15d,(%r9)
  603264:	32 30                	xor    (%rax),%dh
  603266:	32 30                	xor    (%rax),%dh
  603268:	4c 61                	rex.WR (bad) 
  60326a:	62 32                	(bad)  
	...

0000000000603660 <bomb_id>:
  603660:	91                   	xchg   %eax,%ecx
  603661:	3a 34 01             	cmp    (%rcx,%rax,1),%dh
	...

0000000000603670 <n1>:
  603670:	24 00                	and    $0x0,%al
  603672:	00 00                	add    %al,(%rax)
  603674:	00 00                	add    %al,(%rax)
  603676:	00 00                	add    %al,(%rax)
  603678:	90                   	nop
  603679:	36 60                	ss (bad) 
  60367b:	00 00                	add    %al,(%rax)
  60367d:	00 00                	add    %al,(%rax)
  60367f:	00 b0 36 60 00 00    	add    %dh,0x6036(%rax)
	...

0000000000603690 <n21>:
  603690:	08 00                	or     %al,(%rax)
  603692:	00 00                	add    %al,(%rax)
  603694:	00 00                	add    %al,(%rax)
  603696:	00 00                	add    %al,(%rax)
  603698:	10 37                	adc    %dh,(%rdi)
  60369a:	60                   	(bad)  
  60369b:	00 00                	add    %al,(%rax)
  60369d:	00 00                	add    %al,(%rax)
  60369f:	00 d0                	add    %dl,%al
  6036a1:	36 60                	ss (bad) 
	...

00000000006036b0 <n22>:
  6036b0:	32 00                	xor    (%rax),%al
  6036b2:	00 00                	add    %al,(%rax)
  6036b4:	00 00                	add    %al,(%rax)
  6036b6:	00 00                	add    %al,(%rax)
  6036b8:	f0 36 60             	lock ss (bad) 
  6036bb:	00 00                	add    %al,(%rax)
  6036bd:	00 00                	add    %al,(%rax)
  6036bf:	00 30                	add    %dh,(%rax)
  6036c1:	37                   	(bad)  
  6036c2:	60                   	(bad)  
	...

00000000006036d0 <n32>:
  6036d0:	16                   	(bad)  
  6036d1:	00 00                	add    %al,(%rax)
  6036d3:	00 00                	add    %al,(%rax)
  6036d5:	00 00                	add    %al,(%rax)
  6036d7:	00 e0                	add    %ah,%al
  6036d9:	31 60 00             	xor    %esp,0x0(%rax)
  6036dc:	00 00                	add    %al,(%rax)
  6036de:	00 00                	add    %al,(%rax)
  6036e0:	a0 31 60 00 00 00 00 	movabs 0x6031,%al
  6036e7:	00 00 
  6036e9:	00 00                	add    %al,(%rax)
  6036eb:	00 00                	add    %al,(%rax)
  6036ed:	00 00                	add    %al,(%rax)
	...

00000000006036f0 <n33>:
  6036f0:	2d 00 00 00 00       	sub    $0x0,%eax
  6036f5:	00 00                	add    %al,(%rax)
  6036f7:	00 40 31             	add    %al,0x31(%rax)
  6036fa:	60                   	(bad)  
  6036fb:	00 00                	add    %al,(%rax)
  6036fd:	00 00                	add    %al,(%rax)
  6036ff:	00 00                	add    %al,(%rax)
  603701:	32 60 00             	xor    0x0(%rax),%ah
	...

0000000000603710 <n31>:
  603710:	06                   	(bad)  
  603711:	00 00                	add    %al,(%rax)
  603713:	00 00                	add    %al,(%rax)
  603715:	00 00                	add    %al,(%rax)
  603717:	00 60 31             	add    %ah,0x31(%rax)
  60371a:	60                   	(bad)  
  60371b:	00 00                	add    %al,(%rax)
  60371d:	00 00                	add    %al,(%rax)
  60371f:	00 c0                	add    %al,%al
  603721:	31 60 00             	xor    %esp,0x0(%rax)
	...

0000000000603730 <n34>:
  603730:	6b 00 00             	imul   $0x0,(%rax),%eax
  603733:	00 00                	add    %al,(%rax)
  603735:	00 00                	add    %al,(%rax)
  603737:	00 80 31 60 00 00    	add    %al,0x6031(%rax)
  60373d:	00 00                	add    %al,(%rax)
  60373f:	00 20                	add    %ah,(%rax)
  603741:	32 60 00             	xor    0x0(%rax),%ah
	...

0000000000603750 <node1>:
  603750:	75 00                	jne    603752 <node1+0x2>
  603752:	00 00                	add    %al,(%rax)
  603754:	01 00                	add    %eax,(%rax)
  603756:	00 00                	add    %al,(%rax)
  603758:	60                   	(bad)  
  603759:	37                   	(bad)  
  60375a:	60                   	(bad)  
  60375b:	00 00                	add    %al,(%rax)
  60375d:	00 00                	add    %al,(%rax)
	...

0000000000603760 <node2>:
  603760:	b0 01                	mov    $0x1,%al
  603762:	00 00                	add    %al,(%rax)
  603764:	02 00                	add    (%rax),%al
  603766:	00 00                	add    %al,(%rax)
  603768:	70 37                	jo     6037a1 <__TMC_END__+0x1>
  60376a:	60                   	(bad)  
  60376b:	00 00                	add    %al,(%rax)
  60376d:	00 00                	add    %al,(%rax)
	...

0000000000603770 <node3>:
  603770:	6a 01                	pushq  $0x1
  603772:	00 00                	add    %al,(%rax)
  603774:	03 00                	add    (%rax),%eax
  603776:	00 00                	add    %al,(%rax)
  603778:	80 37 60             	xorb   $0x60,(%rdi)
  60377b:	00 00                	add    %al,(%rax)
  60377d:	00 00                	add    %al,(%rax)
	...

0000000000603780 <node4>:
  603780:	d6                   	(bad)  
  603781:	01 00                	add    %eax,(%rax)
  603783:	00 04 00             	add    %al,(%rax,%rax,1)
  603786:	00 00                	add    %al,(%rax)
  603788:	90                   	nop
  603789:	37                   	(bad)  
  60378a:	60                   	(bad)  
  60378b:	00 00                	add    %al,(%rax)
  60378d:	00 00                	add    %al,(%rax)
	...

0000000000603790 <node5>:
  603790:	8e 00                	mov    (%rax),%es
  603792:	00 00                	add    %al,(%rax)
  603794:	05 00 00 00 40       	add    $0x40000000,%eax
  603799:	32 60 00             	xor    0x0(%rax),%ah
  60379c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

00000000006037a0 <__bss_start>:
	...

00000000006037b0 <stdin@@GLIBC_2.2.5>:
	...

00000000006037b8 <completed.6972>:
  6037b8:	00 00                	add    %al,(%rax)
	...

00000000006037bc <num_input_strings>:
  6037bc:	00 00                	add    %al,(%rax)
	...

00000000006037c0 <infile>:
	...

00000000006037e0 <input_strings>:
	...

0000000000603e20 <scratch>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 44 65 62          	sub    %al,0x62(%rbp,%riz,2)
   9:	69 61 6e 20 36 2e 33 	imul   $0x332e3620,0x6e(%rcx),%esp
  10:	2e 30 2d 31 38 2b 64 	xor    %ch,%cs:0x642b3831(%rip)        # 642b3848 <_end+0x63caf9d8>
  17:	65 62                	gs (bad) 
  19:	39 75 31             	cmp    %esi,0x31(%rbp)
  1c:	29 20                	sub    %esp,(%rax)
  1e:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
  22:	30 20                	xor    %ah,(%rax)
  24:	32 30                	xor    (%rax),%dh
  26:	31 37                	xor    %esi,(%rdi)
  28:	30                   	.byte 0x30
  29:	35                   	.byte 0x35
  2a:	31 36                	xor    %esi,(%rsi)
	...

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 00                	or     %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	86 0e                	xchg   %cl,(%rsi)
  12:	40 00 00             	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 50 01             	add    %dl,0x1(%rax)
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	b1 06                	mov    $0x6,%cl
   2:	00 00                	add    %al,(%rax)
   4:	04 00                	add    $0x0,%al
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 01                	or     %al,(%rcx)
   c:	f2 02 00             	repnz add (%rax),%al
   f:	00 0c 71             	add    %cl,(%rcx,%rsi,2)
  12:	00 00                	add    %al,(%rax)
  14:	00 85 00 00 00 86    	add    %al,-0x7a000000(%rbp)
  1a:	0e                   	(bad)  
  1b:	40 00 00             	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 50 01             	add    %dl,0x1(%rax)
	...
  2b:	00 00                	add    %al,(%rax)
  2d:	02 4d 00             	add    0x0(%rbp),%cl
  30:	00 00                	add    %al,(%rax)
  32:	02 d8                	add    %al,%bl
  34:	38 00                	cmp    %al,(%rax)
  36:	00 00                	add    %al,(%rax)
  38:	03 08                	add    (%rax),%ecx
  3a:	07                   	(bad)  
  3b:	fd                   	std    
  3c:	01 00                	add    %eax,(%rax)
  3e:	00 03                	add    %al,(%rbx)
  40:	01 08                	add    %ecx,(%rax)
  42:	59                   	pop    %rcx
  43:	01 00                	add    %eax,(%rax)
  45:	00 03                	add    %al,(%rbx)
  47:	02 07                	add    (%rdi),%al
  49:	b5 01                	mov    $0x1,%ch
  4b:	00 00                	add    %al,(%rax)
  4d:	03 04 07             	add    (%rdi,%rax,1),%eax
  50:	02 02                	add    (%rdx),%al
  52:	00 00                	add    %al,(%rax)
  54:	03 01                	add    (%rcx),%eax
  56:	06                   	(bad)  
  57:	5b                   	pop    %rbx
  58:	01 00                	add    %eax,(%rax)
  5a:	00 03                	add    %al,(%rbx)
  5c:	02 05 43 00 00 00    	add    0x43(%rip),%al        # a5 <_init-0x400ac3>
  62:	04 04                	add    $0x4,%al
  64:	05 69 6e 74 00       	add    $0x746e69,%eax
  69:	03 08                	add    (%rax),%ecx
  6b:	05 f3 00 00 00       	add    $0xf3,%eax
  70:	02 3f                	add    (%rdi),%bh
  72:	02 00                	add    (%rax),%al
  74:	00 03                	add    %al,(%rbx)
  76:	83 69 00 00          	subl   $0x0,0x0(%rcx)
  7a:	00 02                	add    %al,(%rdx)
  7c:	35 02 00 00 03       	xor    $0x3000002,%eax
  81:	84 69 00             	test   %ch,0x0(%rcx)
  84:	00 00                	add    %al,(%rax)
  86:	03 08                	add    (%rax),%ecx
  88:	07                   	(bad)  
  89:	5a                   	pop    %rdx
  8a:	00 00                	add    %al,(%rax)
  8c:	00 05 08 06 08 95    	add    %al,-0x6af7f9f8(%rip)        # ffffffff9508069a <_end+0xffffffff94a7c82a>
  92:	00 00                	add    %al,(%rax)
  94:	00 03                	add    %al,(%rbx)
  96:	01 06                	add    %eax,(%rsi)
  98:	62 01                	(bad)  
  9a:	00 00                	add    %al,(%rax)
  9c:	07                   	(bad)  
  9d:	95                   	xchg   %eax,%ebp
  9e:	00 00                	add    %al,(%rax)
  a0:	00 02                	add    %al,(%rdx)
  a2:	54                   	push   %rsp
  a3:	01 00                	add    %eax,(%rax)
  a5:	00 04 30             	add    %al,(%rax,%rsi,1)
  a8:	ac                   	lods   %ds:(%rsi),%al
  a9:	00 00                	add    %al,(%rax)
  ab:	00 08                	add    %cl,(%rax)
  ad:	50                   	push   %rax
  ae:	01 00                	add    %eax,(%rax)
  b0:	00 d8                	add    %bl,%al
  b2:	05 f1 29 02 00       	add    $0x229f1,%eax
  b7:	00 09                	add    %cl,(%rcx)
  b9:	c9                   	leaveq 
  ba:	02 00                	add    (%rax),%al
  bc:	00 05 f2 62 00 00    	add    %al,0x62f2(%rip)        # 63b4 <_init-0x3fa7b4>
  c2:	00 00                	add    %al,(%rax)
  c4:	09 a8 01 00 00 05    	or     %ebp,0x5000001(%rax)
  ca:	f7                   	(bad)  
  cb:	8f 00                	popq   (%rax)
  cd:	00 00                	add    %al,(%rax)
  cf:	08 09                	or     %cl,(%rcx)
  d1:	bf 00 00 00 05       	mov    $0x5000000,%edi
  d6:	f8                   	clc    
  d7:	8f 00                	popq   (%rax)
  d9:	00 00                	add    %al,(%rax)
  db:	10 09                	adc    %cl,(%rcx)
  dd:	82                   	(bad)  
  de:	02 00                	add    (%rax),%al
  e0:	00 05 f9 8f 00 00    	add    %al,0x8ff9(%rip)        # 90df <_init-0x3f7a89>
  e6:	00 18                	add    %bl,(%rax)
  e8:	09 90 01 00 00 05    	or     %edx,0x5000001(%rax)
  ee:	fa                   	cli    
  ef:	8f 00                	popq   (%rax)
  f1:	00 00                	add    %al,(%rax)
  f3:	20 09                	and    %cl,(%rcx)
  f5:	63 00                	movslq (%rax),%eax
  f7:	00 00                	add    %al,(%rax)
  f9:	05 fb 8f 00 00       	add    $0x8ffb,%eax
  fe:	00 28                	add    %ch,(%rax)
 100:	09 1f                	or     %ebx,(%rdi)
 102:	02 00                	add    (%rax),%al
 104:	00 05 fc 8f 00 00    	add    %al,0x8ffc(%rip)        # 9106 <_init-0x3f7a62>
 10a:	00 30                	add    %dh,(%rax)
 10c:	09 78 00             	or     %edi,0x0(%rax)
 10f:	00 00                	add    %al,(%rax)
 111:	05 fd 8f 00 00       	add    $0x8ffd,%eax
 116:	00 38                	add    %bh,(%rax)
 118:	09 00                	or     %eax,(%rax)
 11a:	00 00                	add    %al,(%rax)
 11c:	00 05 fe 8f 00 00    	add    %al,0x8ffe(%rip)        # 9120 <_init-0x3f7a48>
 122:	00 40 0a             	add    %al,0xa(%rax)
 125:	9f                   	lahf   
 126:	02 00                	add    (%rax),%al
 128:	00 05 00 01 8f 00    	add    %al,0x8f0100(%rip)        # 8f022e <_end+0x2ec3be>
 12e:	00 00                	add    %al,(%rax)
 130:	48 0a 5e 02          	rex.W or 0x2(%rsi),%bl
 134:	00 00                	add    %al,(%rax)
 136:	05 01 01 8f 00       	add    $0x8f0101,%eax
 13b:	00 00                	add    %al,(%rax)
 13d:	50                   	push   %rax
 13e:	0a 36                	or     (%rsi),%dh
 140:	00 00                	add    %al,(%rax)
 142:	00 05 02 01 8f 00    	add    %al,0x8f0102(%rip)        # 8f024a <_end+0x2ec3da>
 148:	00 00                	add    %al,(%rax)
 14a:	58                   	pop    %rax
 14b:	0a b6 00 00 00 05    	or     0x5000000(%rsi),%dh
 151:	04 01                	add    $0x1,%al
 153:	61                   	(bad)  
 154:	02 00                	add    (%rax),%al
 156:	00 60 0a             	add    %ah,0xa(%rax)
 159:	47 02 00             	rex.RXB add (%r8),%r8b
 15c:	00 05 06 01 67 02    	add    %al,0x2670106(%rip)        # 2670268 <_end+0x206c3f8>
 162:	00 00                	add    %al,(%rax)
 164:	68 0a b9 02 00       	pushq  $0x2b90a
 169:	00 05 08 01 62 00    	add    %al,0x620108(%rip)        # 620277 <_end+0x1c407>
 16f:	00 00                	add    %al,(%rax)
 171:	70 0a                	jo     17d <_init-0x4009eb>
 173:	74 02                	je     177 <_init-0x4009f1>
 175:	00 00                	add    %al,(%rax)
 177:	05 0c 01 62 00       	add    $0x62010c,%eax
 17c:	00 00                	add    %al,(%rax)
 17e:	74 0a                	je     18a <_init-0x4009de>
 180:	12 00                	adc    (%rax),%al
 182:	00 00                	add    %al,(%rax)
 184:	05 0e 01 70 00       	add    $0x70010e,%eax
 189:	00 00                	add    %al,(%rax)
 18b:	78 0a                	js     197 <_init-0x4009d1>
 18d:	11 01                	adc    %eax,(%rcx)
 18f:	00 00                	add    %al,(%rax)
 191:	05 12 01 46 00       	add    $0x460112,%eax
 196:	00 00                	add    %al,(%rax)
 198:	80 0a 90             	orb    $0x90,(%rdx)
 19b:	02 00                	add    (%rax),%al
 19d:	00 05 13 01 54 00    	add    %al,0x540113(%rip)        # 5402b6 <__FRAME_END__+0x13d8ae>
 1a3:	00 00                	add    %al,(%rax)
 1a5:	82                   	(bad)  
 1a6:	0a 86 01 00 00 05    	or     0x5000001(%rsi),%al
 1ac:	14 01                	adc    $0x1,%al
 1ae:	6d                   	insl   (%dx),%es:(%rdi)
 1af:	02 00                	add    (%rax),%al
 1b1:	00 83 0a ed 00 00    	add    %al,0xed0a(%rbx)
 1b7:	00 05 18 01 7d 02    	add    %al,0x27d0118(%rip)        # 27d02d5 <_end+0x21cc465>
 1bd:	00 00                	add    %al,(%rax)
 1bf:	88 0a                	mov    %cl,(%rdx)
 1c1:	16                   	(bad)  
 1c2:	00 00                	add    %al,(%rax)
 1c4:	00 05 21 01 7b 00    	add    %al,0x7b0121(%rip)        # 7b02eb <_end+0x1ac47b>
 1ca:	00 00                	add    %al,(%rax)
 1cc:	90                   	nop
 1cd:	0a d3                	or     %bl,%dl
 1cf:	01 00                	add    %eax,(%rax)
 1d1:	00 05 29 01 8d 00    	add    %al,0x8d0129(%rip)        # 8d0300 <_end+0x2cc490>
 1d7:	00 00                	add    %al,(%rax)
 1d9:	98                   	cwtl   
 1da:	0a da                	or     %dl,%bl
 1dc:	01 00                	add    %eax,(%rax)
 1de:	00 05 2a 01 8d 00    	add    %al,0x8d012a(%rip)        # 8d030e <_end+0x2cc49e>
 1e4:	00 00                	add    %al,(%rax)
 1e6:	a0 0a e1 01 00 00 05 	movabs 0x12b05000001e10a,%al
 1ed:	2b 01 
 1ef:	8d 00                	lea    (%rax),%eax
 1f1:	00 00                	add    %al,(%rax)
 1f3:	a8 0a                	test   $0xa,%al
 1f5:	e8 01 00 00 05       	callq  50001fb <_end+0x49fc38b>
 1fa:	2c 01                	sub    $0x1,%al
 1fc:	8d 00                	lea    (%rax),%eax
 1fe:	00 00                	add    %al,(%rax)
 200:	b0 0a                	mov    $0xa,%al
 202:	ef                   	out    %eax,(%dx)
 203:	01 00                	add    %eax,(%rax)
 205:	00 05 2e 01 2d 00    	add    %al,0x2d012e(%rip)        # 2d0339 <_init-0x13082f>
 20b:	00 00                	add    %al,(%rax)
 20d:	b8 0a 7c 02 00       	mov    $0x27c0a,%eax
 212:	00 05 2f 01 62 00    	add    %al,0x62012f(%rip)        # 620347 <_end+0x1c4d7>
 218:	00 00                	add    %al,(%rax)
 21a:	c0 0a 9f             	rorb   $0x9f,(%rdx)
 21d:	01 00                	add    %eax,(%rax)
 21f:	00 05 31 01 83 02    	add    %al,0x2830131(%rip)        # 2830356 <_end+0x222c4e6>
 225:	00 00                	add    %al,(%rax)
 227:	c4                   	(bad)  
 228:	00 0b                	add    %cl,(%rbx)
 22a:	e7 02                	out    %eax,$0x2
 22c:	00 00                	add    %al,(%rax)
 22e:	05 96 08 7b 01       	add    $0x17b0896,%eax
 233:	00 00                	add    %al,(%rax)
 235:	18 05 9c 61 02 00    	sbb    %al,0x2619c(%rip)        # 263d7 <_init-0x3da791>
 23b:	00 09                	add    %cl,(%rcx)
 23d:	cd 01                	int    $0x1
 23f:	00 00                	add    %al,(%rax)
 241:	05 9d 61 02 00       	add    $0x2619d,%eax
 246:	00 00                	add    %al,(%rax)
 248:	09 4a 01             	or     %ecx,0x1(%rdx)
 24b:	00 00                	add    %al,(%rax)
 24d:	05 9e 67 02 00       	add    $0x2679e,%eax
 252:	00 08                	add    %cl,(%rax)
 254:	09 3b                	or     %edi,(%rbx)
 256:	01 00                	add    %eax,(%rax)
 258:	00 05 a2 62 00 00    	add    %al,0x62a2(%rip)        # 6500 <_init-0x3fa668>
 25e:	00 10                	add    %dl,(%rax)
 260:	00 06                	add    %al,(%rsi)
 262:	08 30                	or     %dh,(%rax)
 264:	02 00                	add    (%rax),%al
 266:	00 06                	add    %al,(%rsi)
 268:	08 ac 00 00 00 0c 95 	or     %ch,-0x6af40000(%rax,%rax,1)
 26f:	00 00                	add    %al,(%rax)
 271:	00 7d 02             	add    %bh,0x2(%rbp)
 274:	00 00                	add    %al,(%rax)
 276:	0d 86 00 00 00       	or     $0x86,%eax
 27b:	00 00                	add    %al,(%rax)
 27d:	06                   	(bad)  
 27e:	08 29                	or     %ch,(%rcx)
 280:	02 00                	add    (%rax),%al
 282:	00 0c 95 00 00 00 93 	add    %cl,-0x6d000000(,%rdx,4)
 289:	02 00                	add    (%rax),%al
 28b:	00 0d 86 00 00 00    	add    %cl,0x86(%rip)        # 317 <_init-0x400851>
 291:	13 00                	adc    (%rax),%eax
 293:	0e                   	(bad)  
 294:	2d 01 00 00 0f       	sub    $0xf000001,%eax
 299:	6c                   	insb   (%dx),%es:(%rdi)
 29a:	01 00                	add    %eax,(%rax)
 29c:	00 05 3b 01 93 02    	add    %al,0x293013b(%rip)        # 29303dd <_end+0x232c56d>
 2a2:	00 00                	add    %al,(%rax)
 2a4:	0f d7                	(bad)  
 2a6:	02 00                	add    (%rax),%al
 2a8:	00 05 3c 01 93 02    	add    %al,0x293013c(%rip)        # 29303ea <_end+0x232c57a>
 2ae:	00 00                	add    %al,(%rax)
 2b0:	0f 1d 01             	nopl   (%rcx)
 2b3:	00 00                	add    %al,(%rax)
 2b5:	05 3d 01 93 02       	add    $0x293013d,%eax
 2ba:	00 00                	add    %al,(%rax)
 2bc:	06                   	(bad)  
 2bd:	08 9c 00 00 00 07 bc 	or     %bl,-0x43f90000(%rax,%rax,1)
 2c4:	02 00                	add    (%rax),%al
 2c6:	00 10                	add    %dl,(%rax)
 2c8:	6e                   	outsb  %ds:(%rsi),(%dx)
 2c9:	02 00                	add    (%rax),%al
 2cb:	00 04 aa             	add    %al,(%rdx,%rbp,4)
 2ce:	67 02 00             	add    (%eax),%al
 2d1:	00 10                	add    %dl,(%rax)
 2d3:	d0 02                	rolb   (%rdx)
 2d5:	00 00                	add    %al,(%rax)
 2d7:	04 ab                	add    $0xab,%al
 2d9:	67 02 00             	add    (%eax),%al
 2dc:	00 10                	add    %dl,(%rax)
 2de:	de 00                	fiadd  (%rax)
 2e0:	00 00                	add    %al,(%rax)
 2e2:	04 ac                	add    $0xac,%al
 2e4:	67 02 00             	add    (%eax),%al
 2e7:	00 10                	add    %dl,(%rax)
 2e9:	2d 00 00 00 06       	sub    $0x6000000,%eax
 2ee:	1a 62 00             	sbb    0x0(%rdx),%ah
 2f1:	00 00                	add    %al,(%rax)
 2f3:	0c c2                	or     $0xc2,%al
 2f5:	02 00                	add    (%rax),%al
 2f7:	00 fe                	add    %bh,%dh
 2f9:	02 00                	add    (%rax),%al
 2fb:	00 11                	add    %dl,(%rcx)
 2fd:	00 07                	add    %al,(%rdi)
 2ff:	f3 02 00             	repz add (%rax),%al
 302:	00 10                	add    %dl,(%rax)
 304:	ad                   	lods   %ds:(%rsi),%eax
 305:	02 00                	add    (%rax),%al
 307:	00 06                	add    %al,(%rsi)
 309:	1b fe                	sbb    %esi,%edi
 30b:	02 00                	add    (%rax),%al
 30d:	00 12                	add    %dl,(%rdx)
 30f:	f6 01 00             	testb  $0x0,(%rcx)
 312:	00 01                	add    %al,(%rcx)
 314:	21 23                	and    %esp,(%rbx)
 316:	03 00                	add    (%rax),%eax
 318:	00 09                	add    %cl,(%rcx)
 31a:	03 c0                	add    %eax,%eax
 31c:	37                   	(bad)  
 31d:	60                   	(bad)  
 31e:	00 00                	add    %al,(%rax)
 320:	00 00                	add    %al,(%rax)
 322:	00 06                	add    %al,(%rsi)
 324:	08 a1 00 00 00 13    	or     %ah,0x13000000(%rcx)
 32a:	c8 01 00 00          	enterq $0x1,$0x0
 32e:	01 23                	add    %esp,(%rbx)
 330:	62                   	(bad)  
 331:	00 00                	add    %al,(%rax)
 333:	00 86 0e 40 00 00    	add    %al,0x400e(%rsi)
 339:	00 00                	add    %al,(%rax)
 33b:	00 50 01             	add    %dl,0x1(%rax)
 33e:	00 00                	add    %al,(%rax)
 340:	00 00                	add    %al,(%rax)
 342:	00 00                	add    %al,(%rax)
 344:	01 9c 19 06 00 00 14 	add    %ebx,0x14000006(%rcx,%rbx,1)
 34b:	67 01 00             	add    %eax,(%eax)
 34e:	00 01                	add    %al,(%rcx)
 350:	23 62 00             	and    0x0(%rdx),%esp
 353:	00 00                	add    %al,(%rax)
 355:	00 00                	add    %al,(%rax)
 357:	00 00                	add    %al,(%rax)
 359:	14 40                	adc    $0x40,%al
 35b:	01 00                	add    %eax,(%rax)
 35d:	00 01                	add    %al,(%rcx)
 35f:	23 19                	and    (%rcx),%ebx
 361:	06                   	(bad)  
 362:	00 00                	add    %al,(%rax)
 364:	8b 00                	mov    (%rax),%eax
 366:	00 00                	add    %al,(%rax)
 368:	15 54 00 00 00       	adc    $0x54,%eax
 36d:	01 25 8f 00 00 00    	add    %esp,0x8f(%rip)        # 402 <_init-0x400766>
 373:	fd                   	std    
 374:	00 00                	add    %al,(%rax)
 376:	00 16                	add    %dl,(%rsi)
 378:	9b                   	fwait
 379:	0f 40 00             	cmovo  (%rax),%eax
 37c:	00 00                	add    %al,(%rax)
 37e:	00 00                	add    %al,(%rax)
 380:	1d 00 00 00 00       	sbb    $0x0,%eax
 385:	00 00                	add    %al,(%rax)
 387:	00 d0                	add    %dl,%al
 389:	03 00                	add    (%rax),%eax
 38b:	00 17                	add    %dl,(%rdi)
 38d:	45 01 00             	add    %r8d,(%r8)
 390:	00 07                	add    %al,(%rdi)
 392:	00 9d 03 00 00 18    	add    %bl,0x18000003(%rbp)
 398:	62                   	(bad)  
 399:	00 00                	add    %al,(%rax)
 39b:	00 00                	add    %al,(%rax)
 39d:	19 ae 0f 40 00 00    	sbb    %ebp,0x400f(%rsi)
 3a3:	00 00                	add    %al,(%rax)
 3a5:	00 1f                	add    %bl,(%rdi)
 3a7:	06                   	(bad)  
 3a8:	00 00                	add    %al,(%rax)
 3aa:	bc 03 00 00 1a       	mov    $0x1a000003,%esp
 3af:	01 55 09             	add    %edx,0x9(%rbp)
 3b2:	03 84 1e 40 00 00 00 	add    0x40(%rsi,%rbx,1),%eax
 3b9:	00 00                	add    %al,(%rax)
 3bb:	00 1b                	add    %bl,(%rbx)
 3bd:	b8 0f 40 00 00       	mov    $0x400f,%eax
 3c2:	00 00                	add    %al,(%rax)
 3c4:	00 2b                	add    %ch,(%rbx)
 3c6:	06                   	(bad)  
 3c7:	00 00                	add    %al,(%rax)
 3c9:	1a 01                	sbb    (%rcx),%al
 3cb:	55                   	push   %rbp
 3cc:	01 38                	add    %edi,(%rax)
 3ce:	00 00                	add    %al,(%rax)
 3d0:	16                   	(bad)  
 3d1:	b8 0f 40 00 00       	mov    $0x400f,%eax
 3d6:	00 00                	add    %al,(%rax)
 3d8:	00 1e                	add    %bl,(%rsi)
 3da:	00 00                	add    %al,(%rax)
 3dc:	00 00                	add    %al,(%rax)
 3de:	00 00                	add    %al,(%rax)
 3e0:	00 29                	add    %ch,(%rcx)
 3e2:	04 00                	add    $0x0,%al
 3e4:	00 17                	add    %dl,(%rdi)
 3e6:	45 01 00             	add    %r8d,(%r8)
 3e9:	00 07                	add    %al,(%rdi)
 3eb:	00 f6                	add    %dh,%dh
 3ed:	03 00                	add    (%rax),%eax
 3ef:	00 18                	add    %bl,(%rax)
 3f1:	62                   	(bad)  
 3f2:	00 00                	add    %al,(%rax)
 3f4:	00 00                	add    %al,(%rax)
 3f6:	19 cc                	sbb    %ecx,%esp
 3f8:	0f 40 00             	cmovo  (%rax),%eax
 3fb:	00 00                	add    %al,(%rax)
 3fd:	00 00                	add    %al,(%rax)
 3ff:	1f                   	(bad)  
 400:	06                   	(bad)  
 401:	00 00                	add    %al,(%rax)
 403:	15 04 00 00 1a       	adc    $0x1a000004,%eax
 408:	01 55 09             	add    %edx,0x9(%rbp)
 40b:	03 a1 1e 40 00 00    	add    0x401e(%rcx),%esp
 411:	00 00                	add    %al,(%rax)
 413:	00 00                	add    %al,(%rax)
 415:	1b d6                	sbb    %esi,%edx
 417:	0f 40 00             	cmovo  (%rax),%eax
 41a:	00 00                	add    %al,(%rax)
 41c:	00 00                	add    %al,(%rax)
 41e:	2b 06                	sub    (%rsi),%eax
 420:	00 00                	add    %al,(%rax)
 422:	1a 01                	sbb    (%rcx),%al
 424:	55                   	push   %rbp
 425:	01 38                	add    %edi,(%rax)
 427:	00 00                	add    %al,(%rax)
 429:	19 ac 0e 40 00 00 00 	sbb    %ebp,0x40(%rsi,%rcx,1)
 430:	00 00                	add    %al,(%rax)
 432:	36 06                	ss (bad) 
 434:	00 00                	add    %al,(%rax)
 436:	48 04 00             	rex.W add $0x0,%al
 439:	00 1a                	add    %bl,(%rdx)
 43b:	01 54 09 03          	add    %edx,0x3(%rcx,%rcx,1)
 43f:	ba 22 40 00 00       	mov    $0x4022,%edx
 444:	00 00                	add    %al,(%rax)
 446:	00 00                	add    %al,(%rax)
 448:	1c c1                	sbb    $0xc1,%al
 44a:	0e                   	(bad)  
 44b:	40 00 00             	add    %al,(%rax)
 44e:	00 00                	add    %al,(%rax)
 450:	00 42 06             	add    %al,0x6(%rdx)
 453:	00 00                	add    %al,(%rax)
 455:	19 cd                	sbb    %ecx,%ebp
 457:	0e                   	(bad)  
 458:	40 00 00             	add    %al,(%rax)
 45b:	00 00                	add    %al,(%rax)
 45d:	00 4d 06             	add    %cl,0x6(%rbp)
 460:	00 00                	add    %al,(%rax)
 462:	74 04                	je     468 <_init-0x400700>
 464:	00 00                	add    %al,(%rax)
 466:	1a 01                	sbb    (%rcx),%al
 468:	55                   	push   %rbp
 469:	09 03                	or     %eax,(%rbx)
 46b:	08 1f                	or     %bl,(%rdi)
 46d:	40 00 00             	add    %al,(%rax)
 470:	00 00                	add    %al,(%rax)
 472:	00 00                	add    %al,(%rax)
 474:	19 d9                	sbb    %ebx,%ecx
 476:	0e                   	(bad)  
 477:	40 00 00             	add    %al,(%rax)
 47a:	00 00                	add    %al,(%rax)
 47c:	00 4d 06             	add    %cl,0x6(%rbp)
 47f:	00 00                	add    %al,(%rax)
 481:	93                   	xchg   %eax,%ebx
 482:	04 00                	add    $0x0,%al
 484:	00 1a                	add    %bl,(%rdx)
 486:	01 55 09             	add    %edx,0x9(%rbp)
 489:	03 48 1f             	add    0x1f(%rax),%ecx
 48c:	40 00 00             	add    %al,(%rax)
 48f:	00 00                	add    %al,(%rax)
 491:	00 00                	add    %al,(%rax)
 493:	1c de                	sbb    $0xde,%al
 495:	0e                   	(bad)  
 496:	40 00 00             	add    %al,(%rax)
 499:	00 00                	add    %al,(%rax)
 49b:	00 5c 06 00          	add    %bl,0x0(%rsi,%rax,1)
 49f:	00 1c e6             	add    %bl,(%rsi,%riz,8)
 4a2:	0e                   	(bad)  
 4a3:	40 00 00             	add    %al,(%rax)
 4a6:	00 00                	add    %al,(%rax)
 4a8:	00 67 06             	add    %ah,0x6(%rdi)
 4ab:	00 00                	add    %al,(%rax)
 4ad:	1c eb                	sbb    $0xeb,%al
 4af:	0e                   	(bad)  
 4b0:	40 00 00             	add    %al,(%rax)
 4b3:	00 00                	add    %al,(%rax)
 4b5:	00 72 06             	add    %dh,0x6(%rdx)
 4b8:	00 00                	add    %al,(%rax)
 4ba:	19 f7                	sbb    %esi,%edi
 4bc:	0e                   	(bad)  
 4bd:	40 00 00             	add    %al,(%rax)
 4c0:	00 00                	add    %al,(%rax)
 4c2:	00 4d 06             	add    %cl,0x6(%rbp)
 4c5:	00 00                	add    %al,(%rax)
 4c7:	d9 04 00             	flds   (%rax,%rax,1)
 4ca:	00 1a                	add    %bl,(%rdx)
 4cc:	01 55 09             	add    %edx,0x9(%rbp)
 4cf:	03 78 1f             	add    0x1f(%rax),%edi
 4d2:	40 00 00             	add    %al,(%rax)
 4d5:	00 00                	add    %al,(%rax)
 4d7:	00 00                	add    %al,(%rax)
 4d9:	1c fc                	sbb    $0xfc,%al
 4db:	0e                   	(bad)  
 4dc:	40 00 00             	add    %al,(%rax)
 4df:	00 00                	add    %al,(%rax)
 4e1:	00 5c 06 00          	add    %bl,0x0(%rsi,%rax,1)
 4e5:	00 1c 04             	add    %bl,(%rsp,%rax,1)
 4e8:	0f 40 00             	cmovo  (%rax),%eax
 4eb:	00 00                	add    %al,(%rax)
 4ed:	00 00                	add    %al,(%rax)
 4ef:	7d 06                	jge    4f7 <_init-0x400671>
 4f1:	00 00                	add    %al,(%rax)
 4f3:	1c 09                	sbb    $0x9,%al
 4f5:	0f 40 00             	cmovo  (%rax),%eax
 4f8:	00 00                	add    %al,(%rax)
 4fa:	00 00                	add    %al,(%rax)
 4fc:	72 06                	jb     504 <_init-0x400664>
 4fe:	00 00                	add    %al,(%rax)
 500:	19 15 0f 40 00 00    	sbb    %edx,0x400f(%rip)        # 4515 <_init-0x3fc653>
 506:	00 00                	add    %al,(%rax)
 508:	00 4d 06             	add    %cl,0x6(%rbp)
 50b:	00 00                	add    %al,(%rax)
 50d:	1f                   	(bad)  
 50e:	05 00 00 1a 01       	add    $0x11a0000,%eax
 513:	55                   	push   %rbp
 514:	09 03                	or     %eax,(%rbx)
 516:	bb 1e 40 00 00       	mov    $0x401e,%ebx
 51b:	00 00                	add    %al,(%rax)
 51d:	00 00                	add    %al,(%rax)
 51f:	1c 1a                	sbb    $0x1a,%al
 521:	0f 40 00             	cmovo  (%rax),%eax
 524:	00 00                	add    %al,(%rax)
 526:	00 00                	add    %al,(%rax)
 528:	5c                   	pop    %rsp
 529:	06                   	(bad)  
 52a:	00 00                	add    %al,(%rax)
 52c:	1c 22                	sbb    $0x22,%al
 52e:	0f 40 00             	cmovo  (%rax),%eax
 531:	00 00                	add    %al,(%rax)
 533:	00 00                	add    %al,(%rax)
 535:	88 06                	mov    %al,(%rsi)
 537:	00 00                	add    %al,(%rax)
 539:	1c 27                	sbb    $0x27,%al
 53b:	0f 40 00             	cmovo  (%rax),%eax
 53e:	00 00                	add    %al,(%rax)
 540:	00 00                	add    %al,(%rax)
 542:	72 06                	jb     54a <_init-0x40061e>
 544:	00 00                	add    %al,(%rax)
 546:	19 33                	sbb    %esi,(%rbx)
 548:	0f 40 00             	cmovo  (%rax),%eax
 54b:	00 00                	add    %al,(%rax)
 54d:	00 00                	add    %al,(%rax)
 54f:	4d 06                	rex.WRB (bad) 
 551:	00 00                	add    %al,(%rax)
 553:	65 05 00 00 1a 01    	gs add $0x11a0000,%eax
 559:	55                   	push   %rbp
 55a:	09 03                	or     %eax,(%rbx)
 55c:	d9 1e                	fstps  (%rsi)
 55e:	40 00 00             	add    %al,(%rax)
 561:	00 00                	add    %al,(%rax)
 563:	00 00                	add    %al,(%rax)
 565:	1c 38                	sbb    $0x38,%al
 567:	0f 40 00             	cmovo  (%rax),%eax
 56a:	00 00                	add    %al,(%rax)
 56c:	00 00                	add    %al,(%rax)
 56e:	5c                   	pop    %rsp
 56f:	06                   	(bad)  
 570:	00 00                	add    %al,(%rax)
 572:	1c 40                	sbb    $0x40,%al
 574:	0f 40 00             	cmovo  (%rax),%eax
 577:	00 00                	add    %al,(%rax)
 579:	00 00                	add    %al,(%rax)
 57b:	93                   	xchg   %eax,%ebx
 57c:	06                   	(bad)  
 57d:	00 00                	add    %al,(%rax)
 57f:	1c 45                	sbb    $0x45,%al
 581:	0f 40 00             	cmovo  (%rax),%eax
 584:	00 00                	add    %al,(%rax)
 586:	00 00                	add    %al,(%rax)
 588:	72 06                	jb     590 <_init-0x4005d8>
 58a:	00 00                	add    %al,(%rax)
 58c:	19 51 0f             	sbb    %edx,0xf(%rcx)
 58f:	40 00 00             	add    %al,(%rax)
 592:	00 00                	add    %al,(%rax)
 594:	00 4d 06             	add    %cl,0x6(%rbp)
 597:	00 00                	add    %al,(%rax)
 599:	ab                   	stos   %eax,%es:(%rdi)
 59a:	05 00 00 1a 01       	add    $0x11a0000,%eax
 59f:	55                   	push   %rbp
 5a0:	09 03                	or     %eax,(%rbx)
 5a2:	a8 1f                	test   $0x1f,%al
 5a4:	40 00 00             	add    %al,(%rax)
 5a7:	00 00                	add    %al,(%rax)
 5a9:	00 00                	add    %al,(%rax)
 5ab:	1c 56                	sbb    $0x56,%al
 5ad:	0f 40 00             	cmovo  (%rax),%eax
 5b0:	00 00                	add    %al,(%rax)
 5b2:	00 00                	add    %al,(%rax)
 5b4:	5c                   	pop    %rsp
 5b5:	06                   	(bad)  
 5b6:	00 00                	add    %al,(%rax)
 5b8:	1c 5e                	sbb    $0x5e,%al
 5ba:	0f 40 00             	cmovo  (%rax),%eax
 5bd:	00 00                	add    %al,(%rax)
 5bf:	00 00                	add    %al,(%rax)
 5c1:	9e                   	sahf   
 5c2:	06                   	(bad)  
 5c3:	00 00                	add    %al,(%rax)
 5c5:	1c 63                	sbb    $0x63,%al
 5c7:	0f 40 00             	cmovo  (%rax),%eax
 5ca:	00 00                	add    %al,(%rax)
 5cc:	00 00                	add    %al,(%rax)
 5ce:	72 06                	jb     5d6 <_init-0x400592>
 5d0:	00 00                	add    %al,(%rax)
 5d2:	19 6f 0f             	sbb    %ebp,0xf(%rdi)
 5d5:	40 00 00             	add    %al,(%rax)
 5d8:	00 00                	add    %al,(%rax)
 5da:	00 4d 06             	add    %cl,0x6(%rbp)
 5dd:	00 00                	add    %al,(%rax)
 5df:	f1                   	icebp  
 5e0:	05 00 00 1a 01       	add    $0x11a0000,%eax
 5e5:	55                   	push   %rbp
 5e6:	09 03                	or     %eax,(%rbx)
 5e8:	e8 1e 40 00 00       	callq  460b <_init-0x3fc55d>
 5ed:	00 00                	add    %al,(%rax)
 5ef:	00 00                	add    %al,(%rax)
 5f1:	1c 74                	sbb    $0x74,%al
 5f3:	0f 40 00             	cmovo  (%rax),%eax
 5f6:	00 00                	add    %al,(%rax)
 5f8:	00 00                	add    %al,(%rax)
 5fa:	5c                   	pop    %rsp
 5fb:	06                   	(bad)  
 5fc:	00 00                	add    %al,(%rax)
 5fe:	1c 7c                	sbb    $0x7c,%al
 600:	0f 40 00             	cmovo  (%rax),%eax
 603:	00 00                	add    %al,(%rax)
 605:	00 00                	add    %al,(%rax)
 607:	a9 06 00 00 1c       	test   $0x1c000006,%eax
 60c:	81 0f 40 00 00 00    	orl    $0x40,(%rdi)
 612:	00 00                	add    %al,(%rax)
 614:	72 06                	jb     61c <_init-0x40054c>
 616:	00 00                	add    %al,(%rax)
 618:	00 06                	add    %al,(%rsi)
 61a:	08 8f 00 00 00 1d    	or     %cl,0x1d000000(%rdi)
 620:	0a 01                	or     (%rcx),%al
 622:	00 00                	add    %al,(%rax)
 624:	0a 01                	or     (%rcx),%al
 626:	00 00                	add    %al,(%rax)
 628:	04 6c                	add    $0x6c,%al
 62a:	01 1e                	add    %ebx,(%rsi)
 62c:	45 01 00             	add    %r8d,(%r8)
 62f:	00 45 01             	add    %al,0x1(%rbp)
 632:	00 00                	add    %al,(%rax)
 634:	07                   	(bad)  
 635:	00 1d 0c 00 00 00    	add    %bl,0xc(%rip)        # 647 <_init-0x400521>
 63b:	0c 00                	or     $0x0,%al
 63d:	00 00                	add    %al,(%rax)
 63f:	04 12                	add    $0x12,%al
 641:	01 1e                	add    %ebx,(%rsi)
 643:	4e 02 00             	rex.WRX add (%rax),%r8b
 646:	00 4e 02             	add    %cl,0x2(%rsi)
 649:	00 00                	add    %al,(%rax)
 64b:	08 09                	or     %cl,(%rcx)
 64d:	1f                   	(bad)  
 64e:	28 00                	sub    %al,(%rax)
 650:	00 00                	add    %al,(%rax)
 652:	1e                   	(bad)  
 653:	00 00                	add    %al,(%rax)
 655:	00 07                	add    %al,(%rdi)
 657:	00 28                	add    %ch,(%rax)
 659:	00 00                	add    %al,(%rax)
 65b:	00 1e                	add    %bl,(%rsi)
 65d:	cc                   	int3   
 65e:	00 00                	add    %al,(%rax)
 660:	00 cc                	add    %cl,%ah
 662:	00 00                	add    %al,(%rax)
 664:	00 08                	add    %cl,(%rax)
 666:	08 1e                	or     %bl,(%rsi)
 668:	d6                   	(bad)  
 669:	00 00                	add    %al,(%rax)
 66b:	00 d6                	add    %dl,%dh
 66d:	00 00                	add    %al,(%rax)
 66f:	00 09                	add    %cl,(%rcx)
 671:	04 1e                	add    $0x1e,%al
 673:	fc                   	cld    
 674:	00 00                	add    %al,(%rax)
 676:	00 fc                	add    %bh,%ah
 678:	00 00                	add    %al,(%rax)
 67a:	00 08                	add    %cl,(%rax)
 67c:	0b 1e                	or     (%rsi),%ebx
 67e:	0f 02 00             	lar    (%rax),%eax
 681:	00 0f                	add    %cl,(%rdi)
 683:	02 00                	add    (%rax),%al
 685:	00 09                	add    %cl,(%rcx)
 687:	05 1e 17 02 00       	add    $0x2171e,%eax
 68c:	00 17                	add    %dl,(%rdi)
 68e:	02 00                	add    (%rax),%al
 690:	00 09                	add    %cl,(%rcx)
 692:	06                   	(bad)  
 693:	1e                   	(bad)  
 694:	e5 00                	in     $0x0,%eax
 696:	00 00                	add    %al,(%rax)
 698:	e5 00                	in     $0x0,%eax
 69a:	00 00                	add    %al,(%rax)
 69c:	09 07                	or     %eax,(%rdi)
 69e:	1e                   	(bad)  
 69f:	2d 02 00 00 2d       	sub    $0x2d000002,%eax
 6a4:	02 00                	add    (%rax),%al
 6a6:	00 09                	add    %cl,(%rcx)
 6a8:	08 1e                	or     %bl,(%rsi)
 6aa:	c1 02 00             	roll   $0x0,(%rdx)
 6ad:	00 c1                	add    %al,%cl
 6af:	02 00                	add    (%rax),%al
 6b1:	00 09                	add    %cl,(%rcx)
 6b3:	09 00                	or     %eax,(%rax)

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x2aad4a6>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    (%rsi),%ecx
   b:	11 01                	adc    %eax,(%rcx)
   d:	12 07                	adc    (%rdi),%al
   f:	10 17                	adc    %dl,(%rdi)
  11:	00 00                	add    %al,(%rax)
  13:	02 16                	add    (%rsi),%dl
  15:	00 03                	add    %al,(%rbx)
  17:	0e                   	(bad)  
  18:	3a 0b                	cmp    (%rbx),%cl
  1a:	3b 0b                	cmp    (%rbx),%ecx
  1c:	49 13 00             	adc    (%r8),%rax
  1f:	00 03                	add    %al,(%rbx)
  21:	24 00                	and    $0x0,%al
  23:	0b 0b                	or     (%rbx),%ecx
  25:	3e 0b 03             	or     %ds:(%rbx),%eax
  28:	0e                   	(bad)  
  29:	00 00                	add    %al,(%rax)
  2b:	04 24                	add    $0x24,%al
  2d:	00 0b                	add    %cl,(%rbx)
  2f:	0b 3e                	or     (%rsi),%edi
  31:	0b 03                	or     (%rbx),%eax
  33:	08 00                	or     %al,(%rax)
  35:	00 05 0f 00 0b 0b    	add    %al,0xb0b000f(%rip)        # b0b004a <_end+0xaaac1da>
  3b:	00 00                	add    %al,(%rax)
  3d:	06                   	(bad)  
  3e:	0f 00 0b             	str    (%rbx)
  41:	0b 49 13             	or     0x13(%rcx),%ecx
  44:	00 00                	add    %al,(%rax)
  46:	07                   	(bad)  
  47:	26 00 49 13          	add    %cl,%es:0x13(%rcx)
  4b:	00 00                	add    %al,(%rax)
  4d:	08 13                	or     %dl,(%rbx)
  4f:	01 03                	add    %eax,(%rbx)
  51:	0e                   	(bad)  
  52:	0b 0b                	or     (%rbx),%ecx
  54:	3a 0b                	cmp    (%rbx),%cl
  56:	3b 0b                	cmp    (%rbx),%ecx
  58:	01 13                	add    %edx,(%rbx)
  5a:	00 00                	add    %al,(%rax)
  5c:	09 0d 00 03 0e 3a    	or     %ecx,0x3a0e0300(%rip)        # 3a0e0362 <_end+0x39adc4f2>
  62:	0b 3b                	or     (%rbx),%edi
  64:	0b 49 13             	or     0x13(%rcx),%ecx
  67:	38 0b                	cmp    %cl,(%rbx)
  69:	00 00                	add    %al,(%rax)
  6b:	0a 0d 00 03 0e 3a    	or     0x3a0e0300(%rip),%cl        # 3a0e0371 <_end+0x39adc501>
  71:	0b 3b                	or     (%rbx),%edi
  73:	05 49 13 38 0b       	add    $0xb381349,%eax
  78:	00 00                	add    %al,(%rax)
  7a:	0b 16                	or     (%rsi),%edx
  7c:	00 03                	add    %al,(%rbx)
  7e:	0e                   	(bad)  
  7f:	3a 0b                	cmp    (%rbx),%cl
  81:	3b 0b                	cmp    (%rbx),%ecx
  83:	00 00                	add    %al,(%rax)
  85:	0c 01                	or     $0x1,%al
  87:	01 49 13             	add    %ecx,0x13(%rcx)
  8a:	01 13                	add    %edx,(%rbx)
  8c:	00 00                	add    %al,(%rax)
  8e:	0d 21 00 49 13       	or     $0x13490021,%eax
  93:	2f                   	(bad)  
  94:	0b 00                	or     (%rax),%eax
  96:	00 0e                	add    %cl,(%rsi)
  98:	13 00                	adc    (%rax),%eax
  9a:	03 0e                	add    (%rsi),%ecx
  9c:	3c 19                	cmp    $0x19,%al
  9e:	00 00                	add    %al,(%rax)
  a0:	0f 34                	sysenter 
  a2:	00 03                	add    %al,(%rbx)
  a4:	0e                   	(bad)  
  a5:	3a 0b                	cmp    (%rbx),%cl
  a7:	3b 05 49 13 3f 19    	cmp    0x193f1349(%rip),%eax        # 193f13f6 <_end+0x18ded586>
  ad:	3c 19                	cmp    $0x19,%al
  af:	00 00                	add    %al,(%rax)
  b1:	10 34 00             	adc    %dh,(%rax,%rax,1)
  b4:	03 0e                	add    (%rsi),%ecx
  b6:	3a 0b                	cmp    (%rbx),%cl
  b8:	3b 0b                	cmp    (%rbx),%ecx
  ba:	49 13 3f             	adc    (%r15),%rdi
  bd:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
  c0:	00 00                	add    %al,(%rax)
  c2:	11 21                	adc    %esp,(%rcx)
  c4:	00 00                	add    %al,(%rax)
  c6:	00 12                	add    %dl,(%rdx)
  c8:	34 00                	xor    $0x0,%al
  ca:	03 0e                	add    (%rsi),%ecx
  cc:	3a 0b                	cmp    (%rbx),%cl
  ce:	3b 0b                	cmp    (%rbx),%ecx
  d0:	49 13 3f             	adc    (%r15),%rdi
  d3:	19 02                	sbb    %eax,(%rdx)
  d5:	18 00                	sbb    %al,(%rax)
  d7:	00 13                	add    %dl,(%rbx)
  d9:	2e 01 3f             	add    %edi,%cs:(%rdi)
  dc:	19 03                	sbb    %eax,(%rbx)
  de:	0e                   	(bad)  
  df:	3a 0b                	cmp    (%rbx),%cl
  e1:	3b 0b                	cmp    (%rbx),%ecx
  e3:	27                   	(bad)  
  e4:	19 49 13             	sbb    %ecx,0x13(%rcx)
  e7:	11 01                	adc    %eax,(%rcx)
  e9:	12 07                	adc    (%rdi),%al
  eb:	40 18 97 42 19 01 13 	sbb    %dl,0x13011942(%rdi)
  f2:	00 00                	add    %al,(%rax)
  f4:	14 05                	adc    $0x5,%al
  f6:	00 03                	add    %al,(%rbx)
  f8:	0e                   	(bad)  
  f9:	3a 0b                	cmp    (%rbx),%cl
  fb:	3b 0b                	cmp    (%rbx),%ecx
  fd:	49 13 02             	adc    (%r10),%rax
 100:	17                   	(bad)  
 101:	00 00                	add    %al,(%rax)
 103:	15 34 00 03 0e       	adc    $0xe030034,%eax
 108:	3a 0b                	cmp    (%rbx),%cl
 10a:	3b 0b                	cmp    (%rbx),%ecx
 10c:	49 13 02             	adc    (%r10),%rax
 10f:	17                   	(bad)  
 110:	00 00                	add    %al,(%rax)
 112:	16                   	(bad)  
 113:	0b 01                	or     (%rcx),%eax
 115:	11 01                	adc    %eax,(%rcx)
 117:	12 07                	adc    (%rdi),%al
 119:	01 13                	add    %edx,(%rbx)
 11b:	00 00                	add    %al,(%rax)
 11d:	17                   	(bad)  
 11e:	2e 01 3f             	add    %edi,%cs:(%rdi)
 121:	19 03                	sbb    %eax,(%rbx)
 123:	0e                   	(bad)  
 124:	3a 0b                	cmp    (%rbx),%cl
 126:	3b 0b                	cmp    (%rbx),%ecx
 128:	27                   	(bad)  
 129:	19 87 01 19 3c 19    	sbb    %eax,0x193c1901(%rdi)
 12f:	01 13                	add    %edx,(%rbx)
 131:	00 00                	add    %al,(%rax)
 133:	18 05 00 49 13 00    	sbb    %al,0x134900(%rip)        # 134a39 <_init-0x2cc12f>
 139:	00 19                	add    %bl,(%rcx)
 13b:	89 82 01 01 11 01    	mov    %eax,0x1110101(%rdx)
 141:	31 13                	xor    %edx,(%rbx)
 143:	01 13                	add    %edx,(%rbx)
 145:	00 00                	add    %al,(%rax)
 147:	1a 8a 82 01 00 02    	sbb    0x2000182(%rdx),%cl
 14d:	18 91 42 18 00 00    	sbb    %dl,0x1842(%rcx)
 153:	1b 89 82 01 01 11    	sbb    0x11010182(%rcx),%ecx
 159:	01 31                	add    %esi,(%rcx)
 15b:	13 00                	adc    (%rax),%eax
 15d:	00 1c 89             	add    %bl,(%rcx,%rcx,4)
 160:	82                   	(bad)  
 161:	01 00                	add    %eax,(%rax)
 163:	11 01                	adc    %eax,(%rcx)
 165:	31 13                	xor    %edx,(%rbx)
 167:	00 00                	add    %al,(%rax)
 169:	1d 2e 00 3f 19       	sbb    $0x193f002e,%eax
 16e:	3c 19                	cmp    $0x19,%al
 170:	6e                   	outsb  %ds:(%rsi),(%dx)
 171:	0e                   	(bad)  
 172:	03 0e                	add    (%rsi),%ecx
 174:	3a 0b                	cmp    (%rbx),%cl
 176:	3b 05 00 00 1e 2e    	cmp    0x2e1e0000(%rip),%eax        # 2e1e017c <_end+0x2dbdc30c>
 17c:	00 3f                	add    %bh,(%rdi)
 17e:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 181:	6e                   	outsb  %ds:(%rsi),(%dx)
 182:	0e                   	(bad)  
 183:	03 0e                	add    (%rsi),%ecx
 185:	3a 0b                	cmp    (%rbx),%cl
 187:	3b 0b                	cmp    (%rbx),%ecx
 189:	00 00                	add    %al,(%rax)
 18b:	1f                   	(bad)  
 18c:	2e 00 3f             	add    %bh,%cs:(%rdi)
 18f:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 192:	6e                   	outsb  %ds:(%rsi),(%dx)
 193:	0e                   	(bad)  
 194:	03 0e                	add    (%rsi),%ecx
 196:	3a 0b                	cmp    (%rbx),%cl
 198:	3b 0b                	cmp    (%rbx),%ecx
 19a:	6e                   	outsb  %ds:(%rsi),(%dx)
 19b:	0e                   	(bad)  
 19c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	21 01                	and    %eax,(%rcx)
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	da 00                	fiaddl (%rax)
   8:	00 00                	add    %al,(%rax)
   a:	01 01                	add    %eax,(%rcx)
   c:	fb                   	sti    
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	01 00                	add    %eax,(%rax)
  19:	00 01                	add    %al,(%rcx)
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <_init-0x400ad7>
  1e:	72 2f                	jb     4f <_init-0x400b19>
  20:	6c                   	insb   (%dx),%es:(%rdi)
  21:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  28:	78 38                	js     62 <_init-0x400b06>
  2a:	36 5f                	ss pop %rdi
  2c:	36 34 2d             	ss xor $0x2d,%al
  2f:	6c                   	insb   (%dx),%es:(%rdi)
  30:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  37:	75 2f                	jne    68 <_init-0x400b00>
  39:	36 2f                	ss (bad) 
  3b:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  42:	00 2f                	add    %ch,(%rdi)
  44:	75 73                	jne    b9 <_init-0x400aaf>
  46:	72 2f                	jb     77 <_init-0x400af1>
  48:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  4f:	2f                   	(bad)  
  50:	78 38                	js     8a <_init-0x400ade>
  52:	36 5f                	ss pop %rdi
  54:	36 34 2d             	ss xor $0x2d,%al
  57:	6c                   	insb   (%dx),%es:(%rdi)
  58:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  5f:	75 2f                	jne    90 <_init-0x400ad8>
  61:	62                   	(bad)  
  62:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  69:	72 
  6a:	2f                   	(bad)  
  6b:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  72:	00 00                	add    %al,(%rax)
  74:	62                   	(bad)  
  75:	6f                   	outsl  %ds:(%rsi),(%dx)
  76:	6d                   	insl   (%dx),%es:(%rdi)
  77:	62                   	(bad)  
  78:	2e 63 00             	movslq %cs:(%rax),%eax
  7b:	00 00                	add    %al,(%rax)
  7d:	00 73 74             	add    %dh,0x74(%rbx)
  80:	64 64 65 66 2e 68 00 	fs fs gs cs pushw $0x100
  87:	01 
  88:	00 00                	add    %al,(%rax)
  8a:	74 79                	je     105 <_init-0x400a63>
  8c:	70 65                	jo     f3 <_init-0x400a75>
  8e:	73 2e                	jae    be <_init-0x400aaa>
  90:	68 00 02 00 00       	pushq  $0x200
  95:	73 74                	jae    10b <_init-0x400a5d>
  97:	64 69 6f 2e 68 00 03 	imul   $0x30068,%fs:0x2e(%rdi),%ebp
  9e:	00 
  9f:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  a3:	69 6f 2e 68 00 03 00 	imul   $0x30068,0x2e(%rdi),%ebp
  aa:	00 73 79             	add    %dh,0x79(%rbx)
  ad:	73 5f                	jae    10e <_init-0x400a5a>
  af:	65 72 72             	gs jb  124 <_init-0x400a44>
  b2:	6c                   	insb   (%dx),%es:(%rdi)
  b3:	69 73 74 2e 68 00 02 	imul   $0x200682e,0x74(%rbx),%esi
  ba:	00 00                	add    %al,(%rax)
  bc:	3c 62                	cmp    $0x62,%al
  be:	75 69                	jne    129 <_init-0x400a3f>
  c0:	6c                   	insb   (%dx),%es:(%rdi)
  c1:	74 2d                	je     f0 <_init-0x400a78>
  c3:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
  ca:	73 75                	jae    141 <_init-0x400a27>
  cc:	70 70                	jo     13e <_init-0x400a2a>
  ce:	6f                   	outsl  %ds:(%rsi),(%dx)
  cf:	72 74                	jb     145 <_init-0x400a23>
  d1:	2e 68 00 00 00 00    	cs pushq $0x0
  d7:	70 68                	jo     141 <_init-0x400a27>
  d9:	61                   	(bad)  
  da:	73 65                	jae    141 <_init-0x400a27>
  dc:	73 2e                	jae    10c <_init-0x400a5c>
  de:	68 00 00 00 00       	pushq  $0x0
  e3:	00 00                	add    %al,(%rax)
  e5:	09 02                	or     %eax,(%rdx)
  e7:	86 0e                	xchg   %cl,(%rsi)
  e9:	40 00 00             	add    %al,(%rax)
  ec:	00 00                	add    %al,(%rax)
  ee:	00 03                	add    %al,(%rbx)
  f0:	23 01                	and    (%rcx),%eax
  f2:	28 c2                	sub    %al,%dl
  f4:	91                   	xchg   %eax,%ecx
  f5:	03 0d 08 e4 5a bb    	add    -0x44a51bf8(%rip),%ecx        # ffffffffbb5ae503 <_end+0xffffffffbafaa693>
  fb:	bd 59 83 5a be       	mov    $0xbe5a8359,%ebp
 100:	59                   	pop    %rcx
 101:	83 59 be 59          	sbbl   $0x59,-0x42(%rcx)
 105:	83 59 bd 59          	sbbl   $0x59,-0x43(%rcx)
 109:	83 59 bd 59          	sbbl   $0x59,-0x43(%rcx)
 10d:	83 59 be 59          	sbbl   $0x59,-0x42(%rcx)
 111:	83 5e 03 bb          	sbbl   $0xffffffbb,0x3(%rsi)
 115:	7f 74                	jg     18b <_init-0x4009dd>
 117:	03 09                	add    (%rcx),%ecx
 119:	08 2e                	or     %ch,(%rsi)
 11b:	08 2f                	or     %ch,(%rdi)
 11d:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
 11e:	08 3d 02 0a 00 01    	or     %bh,0x1000a02(%rip)        # 1000b26 <_end+0x9fccb6>
 124:	01                   	.byte 0x1

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	5f                   	pop    %rdi
   1:	49                   	rex.WB
   2:	4f 5f                	rex.WRXB pop %r15
   4:	62                   	(bad)  
   5:	75 66                	jne    6d <_init-0x400afb>
   7:	5f                   	pop    %rdi
   8:	65 6e                	outsb  %gs:(%rsi),(%dx)
   a:	64 00 66 6f          	add    %ah,%fs:0x6f(%rsi)
   e:	70 65                	jo     75 <_init-0x400af3>
  10:	6e                   	outsb  %ds:(%rsi),(%dx)
  11:	00 5f 6f             	add    %bl,0x6f(%rdi)
  14:	6c                   	insb   (%dx),%es:(%rdi)
  15:	64 5f                	fs pop %rdi
  17:	6f                   	outsl  %ds:(%rsi),(%dx)
  18:	66 66 73 65          	data16 data16 jae 81 <_init-0x400ae7>
  1c:	74 00                	je     1e <_init-0x400b4a>
  1e:	5f                   	pop    %rdi
  1f:	5f                   	pop    %rdi
  20:	62                   	(bad)  
  21:	75 69                	jne    8c <_init-0x400adc>
  23:	6c                   	insb   (%dx),%es:(%rdi)
  24:	74 69                	je     8f <_init-0x400ad9>
  26:	6e                   	outsb  %ds:(%rsi),(%dx)
  27:	5f                   	pop    %rdi
  28:	70 75                	jo     9f <_init-0x400ac9>
  2a:	74 73                	je     9f <_init-0x400ac9>
  2c:	00 73 79             	add    %dh,0x79(%rbx)
  2f:	73 5f                	jae    90 <_init-0x400ad8>
  31:	6e                   	outsb  %ds:(%rsi),(%dx)
  32:	65 72 72             	gs jb  a7 <_init-0x400ac1>
  35:	00 5f 49             	add    %bl,0x49(%rdi)
  38:	4f 5f                	rex.WRXB pop %r15
  3a:	73 61                	jae    9d <_init-0x400acb>
  3c:	76 65                	jbe    a3 <_init-0x400ac5>
  3e:	5f                   	pop    %rdi
  3f:	65 6e                	outsb  %gs:(%rsi),(%dx)
  41:	64 00 73 68          	add    %dh,%fs:0x68(%rbx)
  45:	6f                   	outsl  %ds:(%rsi),(%dx)
  46:	72 74                	jb     bc <_init-0x400aac>
  48:	20 69 6e             	and    %ch,0x6e(%rcx)
  4b:	74 00                	je     4d <_init-0x400b1b>
  4d:	73 69                	jae    b8 <_init-0x400ab0>
  4f:	7a 65                	jp     b6 <_init-0x400ab2>
  51:	5f                   	pop    %rdi
  52:	74 00                	je     54 <_init-0x400b14>
  54:	69 6e 70 75 74 00 73 	imul   $0x73007475,0x70(%rsi),%ebp
  5b:	69 7a 65 74 79 70 65 	imul   $0x65707974,0x65(%rdx),%edi
  62:	00 5f 49             	add    %bl,0x49(%rdi)
  65:	4f 5f                	rex.WRXB pop %r15
  67:	77 72                	ja     db <_init-0x400a8d>
  69:	69 74 65 5f 70 74 72 	imul   $0x727470,0x5f(%rbp,%riz,2),%esi
  70:	00 
  71:	62                   	(bad)  
  72:	6f                   	outsl  %ds:(%rsi),(%dx)
  73:	6d                   	insl   (%dx),%es:(%rdi)
  74:	62                   	(bad)  
  75:	2e 63 00             	movslq %cs:(%rax),%eax
  78:	5f                   	pop    %rdi
  79:	49                   	rex.WB
  7a:	4f 5f                	rex.WRXB pop %r15
  7c:	62                   	(bad)  
  7d:	75 66                	jne    e5 <_init-0x400a83>
  7f:	5f                   	pop    %rdi
  80:	62 61                	(bad)  
  82:	73 65                	jae    e9 <_init-0x400a7f>
  84:	00 2f                	add    %ch,(%rdi)
  86:	68 6f 6d 65 2f       	pushq  $0x2f656d6f
  8b:	73 6a                	jae    f7 <_init-0x400a71>
  8d:	74 75                	je     104 <_init-0x400a64>
  8f:	2d 69 63 73 2d       	sub    $0x2d736369,%eax
  94:	73 76                	jae    10c <_init-0x400a5c>
  96:	6e                   	outsb  %ds:(%rsi),(%dx)
  97:	2f                   	(bad)  
  98:	61                   	(bad)  
  99:	72 63                	jb     fe <_init-0x400a6a>
  9b:	68 76 69 65 2f       	pushq  $0x2f656976
  a0:	53                   	push   %rbx
  a1:	45 31 39             	xor    %r15d,(%r9)
  a4:	2d 6c 61 62 32       	sub    $0x3262616c,%eax
  a9:	2f                   	(bad)  
  aa:	62                   	(bad)  
  ab:	6f                   	outsl  %ds:(%rsi),(%dx)
  ac:	6d                   	insl   (%dx),%es:(%rdi)
  ad:	62                   	(bad)  
  ae:	6c                   	insb   (%dx),%es:(%rdi)
  af:	61                   	(bad)  
  b0:	62                   	(bad)  
  b1:	2f                   	(bad)  
  b2:	73 72                	jae    126 <_init-0x400a42>
  b4:	63 00                	movslq (%rax),%eax
  b6:	5f                   	pop    %rdi
  b7:	6d                   	insl   (%dx),%es:(%rdi)
  b8:	61                   	(bad)  
  b9:	72 6b                	jb     126 <_init-0x400a42>
  bb:	65 72 73             	gs jb  131 <_init-0x400a37>
  be:	00 5f 49             	add    %bl,0x49(%rdi)
  c1:	4f 5f                	rex.WRXB pop %r15
  c3:	72 65                	jb     12a <_init-0x400a3e>
  c5:	61                   	(bad)  
  c6:	64 5f                	fs pop %rdi
  c8:	65 6e                	outsb  %gs:(%rsi),(%dx)
  ca:	64 00 72 65          	add    %dh,%fs:0x65(%rdx)
  ce:	61                   	(bad)  
  cf:	64 5f                	fs pop %rdi
  d1:	6c                   	insb   (%dx),%es:(%rdi)
  d2:	69 6e 65 00 70 68 61 	imul   $0x61687000,0x65(%rsi),%ebp
  d9:	73 65                	jae    140 <_init-0x400a28>
  db:	5f                   	pop    %rdi
  dc:	31 00                	xor    %eax,(%rax)
  de:	73 74                	jae    154 <_init-0x400a14>
  e0:	64 65 72 72          	fs gs jb 156 <_init-0x400a12>
  e4:	00 70 68             	add    %dh,0x68(%rax)
  e7:	61                   	(bad)  
  e8:	73 65                	jae    14f <_init-0x400a19>
  ea:	5f                   	pop    %rdi
  eb:	34 00                	xor    $0x0,%al
  ed:	5f                   	pop    %rdi
  ee:	6c                   	insb   (%dx),%es:(%rdi)
  ef:	6f                   	outsl  %ds:(%rsi),(%dx)
  f0:	63 6b 00             	movslq 0x0(%rbx),%ebp
  f3:	6c                   	insb   (%dx),%es:(%rdi)
  f4:	6f                   	outsl  %ds:(%rsi),(%dx)
  f5:	6e                   	outsb  %ds:(%rsi),(%dx)
  f6:	67 20 69 6e          	and    %ch,0x6e(%ecx)
  fa:	74 00                	je     fc <_init-0x400a6c>
  fc:	70 68                	jo     166 <_init-0x400a02>
  fe:	61                   	(bad)  
  ff:	73 65                	jae    166 <_init-0x400a02>
 101:	5f                   	pop    %rdi
 102:	64 65 66 75 73       	fs gs data16 jne 17a <_init-0x4009ee>
 107:	65 64 00 70 72       	gs add %dh,%fs:0x72(%rax)
 10c:	69 6e 74 66 00 5f 63 	imul   $0x635f0066,0x74(%rsi),%ebp
 113:	75 72                	jne    187 <_init-0x4009e1>
 115:	5f                   	pop    %rdi
 116:	63 6f 6c             	movslq 0x6c(%rdi),%ebp
 119:	75 6d                	jne    188 <_init-0x4009e0>
 11b:	6e                   	outsb  %ds:(%rsi),(%dx)
 11c:	00 5f 49             	add    %bl,0x49(%rdi)
 11f:	4f 5f                	rex.WRXB pop %r15
 121:	32 5f 31             	xor    0x31(%rdi),%bl
 124:	5f                   	pop    %rdi
 125:	73 74                	jae    19b <_init-0x4009cd>
 127:	64 65 72 72          	fs gs jb 19d <_init-0x4009cb>
 12b:	5f                   	pop    %rdi
 12c:	00 5f 49             	add    %bl,0x49(%rdi)
 12f:	4f 5f                	rex.WRXB pop %r15
 131:	46                   	rex.RX
 132:	49                   	rex.WB
 133:	4c                   	rex.WR
 134:	45 5f                	rex.RB pop %r15
 136:	70 6c                	jo     1a4 <_init-0x4009c4>
 138:	75 73                	jne    1ad <_init-0x4009bb>
 13a:	00 5f 70             	add    %bl,0x70(%rdi)
 13d:	6f                   	outsl  %ds:(%rsi),(%dx)
 13e:	73 00                	jae    140 <_init-0x400a28>
 140:	61                   	(bad)  
 141:	72 67                	jb     1aa <_init-0x4009be>
 143:	76 00                	jbe    145 <_init-0x400a23>
 145:	65 78 69             	gs js  1b1 <_init-0x4009b7>
 148:	74 00                	je     14a <_init-0x400a1e>
 14a:	5f                   	pop    %rdi
 14b:	73 62                	jae    1af <_init-0x4009b9>
 14d:	75 66                	jne    1b5 <_init-0x4009b3>
 14f:	00 5f 49             	add    %bl,0x49(%rdi)
 152:	4f 5f                	rex.WRXB pop %r15
 154:	46                   	rex.RX
 155:	49                   	rex.WB
 156:	4c                   	rex.WR
 157:	45 00 75 6e          	add    %r14b,0x6e(%r13)
 15b:	73 69                	jae    1c6 <_init-0x4009a2>
 15d:	67 6e                	outsb  %ds:(%esi),(%dx)
 15f:	65 64 20 63 68       	gs and %ah,%fs:0x68(%rbx)
 164:	61                   	(bad)  
 165:	72 00                	jb     167 <_init-0x400a01>
 167:	61                   	(bad)  
 168:	72 67                	jb     1d1 <_init-0x400997>
 16a:	63 00                	movslq (%rax),%eax
 16c:	5f                   	pop    %rdi
 16d:	49                   	rex.WB
 16e:	4f 5f                	rex.WRXB pop %r15
 170:	32 5f 31             	xor    0x31(%rdi),%bl
 173:	5f                   	pop    %rdi
 174:	73 74                	jae    1ea <_init-0x40097e>
 176:	64 69 6e 5f 00 5f 49 	imul   $0x4f495f00,%fs:0x5f(%rsi),%ebp
 17d:	4f 
 17e:	5f                   	pop    %rdi
 17f:	6d                   	insl   (%dx),%es:(%rdi)
 180:	61                   	(bad)  
 181:	72 6b                	jb     1ee <_init-0x40097a>
 183:	65 72 00             	gs jb  186 <_init-0x4009e2>
 186:	5f                   	pop    %rdi
 187:	73 68                	jae    1f1 <_init-0x400977>
 189:	6f                   	outsl  %ds:(%rsi),(%dx)
 18a:	72 74                	jb     200 <_init-0x400968>
 18c:	62                   	(bad)  
 18d:	75 66                	jne    1f5 <_init-0x400973>
 18f:	00 5f 49             	add    %bl,0x49(%rdi)
 192:	4f 5f                	rex.WRXB pop %r15
 194:	77 72                	ja     208 <_init-0x400960>
 196:	69 74 65 5f 62 61 73 	imul   $0x65736162,0x5f(%rbp,%riz,2),%esi
 19d:	65 
 19e:	00 5f 75             	add    %bl,0x75(%rdi)
 1a1:	6e                   	outsb  %ds:(%rsi),(%dx)
 1a2:	75 73                	jne    217 <_init-0x400951>
 1a4:	65 64 32 00          	gs xor %fs:(%rax),%al
 1a8:	5f                   	pop    %rdi
 1a9:	49                   	rex.WB
 1aa:	4f 5f                	rex.WRXB pop %r15
 1ac:	72 65                	jb     213 <_init-0x400955>
 1ae:	61                   	(bad)  
 1af:	64 5f                	fs pop %rdi
 1b1:	70 74                	jo     227 <_init-0x400941>
 1b3:	72 00                	jb     1b5 <_init-0x4009b3>
 1b5:	73 68                	jae    21f <_init-0x400949>
 1b7:	6f                   	outsl  %ds:(%rsi),(%dx)
 1b8:	72 74                	jb     22e <_init-0x40093a>
 1ba:	20 75 6e             	and    %dh,0x6e(%rbp)
 1bd:	73 69                	jae    228 <_init-0x400940>
 1bf:	67 6e                	outsb  %ds:(%esi),(%dx)
 1c1:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
 1c6:	74 00                	je     1c8 <_init-0x4009a0>
 1c8:	6d                   	insl   (%dx),%es:(%rdi)
 1c9:	61                   	(bad)  
 1ca:	69 6e 00 5f 6e 65 78 	imul   $0x78656e5f,0x0(%rsi),%ebp
 1d1:	74 00                	je     1d3 <_init-0x400995>
 1d3:	5f                   	pop    %rdi
 1d4:	5f                   	pop    %rdi
 1d5:	70 61                	jo     238 <_init-0x400930>
 1d7:	64 31 00             	xor    %eax,%fs:(%rax)
 1da:	5f                   	pop    %rdi
 1db:	5f                   	pop    %rdi
 1dc:	70 61                	jo     23f <_init-0x400929>
 1de:	64 32 00             	xor    %fs:(%rax),%al
 1e1:	5f                   	pop    %rdi
 1e2:	5f                   	pop    %rdi
 1e3:	70 61                	jo     246 <_init-0x400922>
 1e5:	64 33 00             	xor    %fs:(%rax),%eax
 1e8:	5f                   	pop    %rdi
 1e9:	5f                   	pop    %rdi
 1ea:	70 61                	jo     24d <_init-0x40091b>
 1ec:	64 34 00             	fs xor $0x0,%al
 1ef:	5f                   	pop    %rdi
 1f0:	5f                   	pop    %rdi
 1f1:	70 61                	jo     254 <_init-0x400914>
 1f3:	64 35 00 69 6e 66    	fs xor $0x666e6900,%eax
 1f9:	69 6c 65 00 6c 6f 6e 	imul   $0x676e6f6c,0x0(%rbp,%riz,2),%ebp
 200:	67 
 201:	20 75 6e             	and    %dh,0x6e(%rbp)
 204:	73 69                	jae    26f <_init-0x4008f9>
 206:	67 6e                	outsb  %ds:(%esi),(%dx)
 208:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
 20d:	74 00                	je     20f <_init-0x400959>
 20f:	70 68                	jo     279 <_init-0x4008ef>
 211:	61                   	(bad)  
 212:	73 65                	jae    279 <_init-0x4008ef>
 214:	5f                   	pop    %rdi
 215:	32 00                	xor    (%rax),%al
 217:	70 68                	jo     281 <_init-0x4008e7>
 219:	61                   	(bad)  
 21a:	73 65                	jae    281 <_init-0x4008e7>
 21c:	5f                   	pop    %rdi
 21d:	33 00                	xor    (%rax),%eax
 21f:	5f                   	pop    %rdi
 220:	49                   	rex.WB
 221:	4f 5f                	rex.WRXB pop %r15
 223:	77 72                	ja     297 <_init-0x4008d1>
 225:	69 74 65 5f 65 6e 64 	imul   $0x646e65,0x5f(%rbp,%riz,2),%esi
 22c:	00 
 22d:	70 68                	jo     297 <_init-0x4008d1>
 22f:	61                   	(bad)  
 230:	73 65                	jae    297 <_init-0x4008d1>
 232:	5f                   	pop    %rdi
 233:	35 00 5f 5f 6f       	xor    $0x6f5f5f00,%eax
 238:	66 66 36 34 5f       	data16 data16 ss xor $0x5f,%al
 23d:	74 00                	je     23f <_init-0x400929>
 23f:	5f                   	pop    %rdi
 240:	5f                   	pop    %rdi
 241:	6f                   	outsl  %ds:(%rsi),(%dx)
 242:	66 66 5f             	data16 pop %di
 245:	74 00                	je     247 <_init-0x400921>
 247:	5f                   	pop    %rdi
 248:	63 68 61             	movslq 0x61(%rax),%ebp
 24b:	69 6e 00 69 6e 69 74 	imul   $0x74696e69,0x0(%rsi),%ebp
 252:	69 61 6c 69 7a 65 5f 	imul   $0x5f657a69,0x6c(%rcx),%esp
 259:	62                   	(bad)  
 25a:	6f                   	outsl  %ds:(%rsi),(%dx)
 25b:	6d                   	insl   (%dx),%es:(%rdi)
 25c:	62                   	(bad)  
 25d:	00 5f 49             	add    %bl,0x49(%rdi)
 260:	4f 5f                	rex.WRXB pop %r15
 262:	62 61                	(bad)  
 264:	63 6b 75             	movslq 0x75(%rbx),%ebp
 267:	70 5f                	jo     2c8 <_init-0x4008a0>
 269:	62 61                	(bad)  
 26b:	73 65                	jae    2d2 <_init-0x400896>
 26d:	00 73 74             	add    %dh,0x74(%rbx)
 270:	64 69 6e 00 5f 66 6c 	imul   $0x616c665f,%fs:0x0(%rsi),%ebp
 277:	61 
 278:	67 73 32             	addr32 jae 2ad <_init-0x4008bb>
 27b:	00 5f 6d             	add    %bl,0x6d(%rdi)
 27e:	6f                   	outsl  %ds:(%rsi),(%dx)
 27f:	64 65 00 5f 49       	fs add %bl,%gs:0x49(%rdi)
 284:	4f 5f                	rex.WRXB pop %r15
 286:	72 65                	jb     2ed <_init-0x40087b>
 288:	61                   	(bad)  
 289:	64 5f                	fs pop %rdi
 28b:	62 61                	(bad)  
 28d:	73 65                	jae    2f4 <_init-0x400874>
 28f:	00 5f 76             	add    %bl,0x76(%rdi)
 292:	74 61                	je     2f5 <_init-0x400873>
 294:	62                   	(bad)  
 295:	6c                   	insb   (%dx),%es:(%rdi)
 296:	65 5f                	gs pop %rdi
 298:	6f                   	outsl  %ds:(%rsi),(%dx)
 299:	66 66 73 65          	data16 data16 jae 302 <_init-0x400866>
 29d:	74 00                	je     29f <_init-0x4008c9>
 29f:	5f                   	pop    %rdi
 2a0:	49                   	rex.WB
 2a1:	4f 5f                	rex.WRXB pop %r15
 2a3:	73 61                	jae    306 <_init-0x400862>
 2a5:	76 65                	jbe    30c <_init-0x40085c>
 2a7:	5f                   	pop    %rdi
 2a8:	62 61                	(bad)  
 2aa:	73 65                	jae    311 <_init-0x400857>
 2ac:	00 73 79             	add    %dh,0x79(%rbx)
 2af:	73 5f                	jae    310 <_init-0x400858>
 2b1:	65 72 72             	gs jb  326 <_init-0x400842>
 2b4:	6c                   	insb   (%dx),%es:(%rdi)
 2b5:	69 73 74 00 5f 66 69 	imul   $0x69665f00,0x74(%rbx),%esi
 2bc:	6c                   	insb   (%dx),%es:(%rdi)
 2bd:	65 6e                	outsb  %gs:(%rsi),(%dx)
 2bf:	6f                   	outsl  %ds:(%rsi),(%dx)
 2c0:	00 70 68             	add    %dh,0x68(%rax)
 2c3:	61                   	(bad)  
 2c4:	73 65                	jae    32b <_init-0x40083d>
 2c6:	5f                   	pop    %rdi
 2c7:	36 00 5f 66          	add    %bl,%ss:0x66(%rdi)
 2cb:	6c                   	insb   (%dx),%es:(%rdi)
 2cc:	61                   	(bad)  
 2cd:	67 73 00             	addr32 jae 2d0 <_init-0x400898>
 2d0:	73 74                	jae    346 <_init-0x400822>
 2d2:	64 6f                	outsl  %fs:(%rsi),(%dx)
 2d4:	75 74                	jne    34a <_init-0x40081e>
 2d6:	00 5f 49             	add    %bl,0x49(%rdi)
 2d9:	4f 5f                	rex.WRXB pop %r15
 2db:	32 5f 31             	xor    0x31(%rdi),%bl
 2de:	5f                   	pop    %rdi
 2df:	73 74                	jae    355 <_init-0x400813>
 2e1:	64 6f                	outsl  %fs:(%rsi),(%dx)
 2e3:	75 74                	jne    359 <_init-0x40080f>
 2e5:	5f                   	pop    %rdi
 2e6:	00 5f 49             	add    %bl,0x49(%rdi)
 2e9:	4f 5f                	rex.WRXB pop %r15
 2eb:	6c                   	insb   (%dx),%es:(%rdi)
 2ec:	6f                   	outsl  %ds:(%rsi),(%dx)
 2ed:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 2f0:	74 00                	je     2f2 <_init-0x400876>
 2f2:	47                   	rex.RXB
 2f3:	4e 55                	rex.WRX push %rbp
 2f5:	20 43 31             	and    %al,0x31(%rbx)
 2f8:	31 20                	xor    %esp,(%rax)
 2fa:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
 2fe:	30 20                	xor    %ah,(%rax)
 300:	32 30                	xor    (%rax),%dh
 302:	31 37                	xor    %esi,(%rdi)
 304:	30 35 31 36 20 2d    	xor    %dh,0x2d203631(%rip)        # 2d20393b <_end+0x2cbffacb>
 30a:	6d                   	insl   (%dx),%es:(%rdi)
 30b:	74 75                	je     382 <_init-0x4007e6>
 30d:	6e                   	outsb  %ds:(%rsi),(%dx)
 30e:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 314:	72 69                	jb     37f <_init-0x4007e9>
 316:	63 20                	movslq (%rax),%esp
 318:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 31d:	68 3d 78 38 36       	pushq  $0x3638783d
 322:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
 327:	67 67 64 62          	addr32 addr32 fs (bad) 
 32b:	20                   	.byte 0x20
 32c:	2d                   	.byte 0x2d
 32d:	4f                   	rex.WRXB
	...

Disassembly of section .debug_loc:

0000000000000000 <.debug_loc>:
	...
   8:	1a 00                	sbb    (%rax),%al
   a:	00 00                	add    %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	01 00                	add    %eax,(%rax)
  12:	55                   	push   %rbp
  13:	1a 00                	sbb    (%rax),%al
  15:	00 00                	add    %al,(%rax)
  17:	00 00                	add    %al,(%rax)
  19:	00 00                	add    %al,(%rax)
  1b:	02 01                	add    (%rcx),%al
  1d:	00 00                	add    %al,(%rax)
  1f:	00 00                	add    %al,(%rax)
  21:	00 00                	add    %al,(%rax)
  23:	04 00                	add    $0x0,%al
  25:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  29:	02 01                	add    (%rcx),%al
  2b:	00 00                	add    %al,(%rax)
  2d:	00 00                	add    %al,(%rax)
  2f:	00 00                	add    %al,(%rax)
  31:	15 01 00 00 00       	adc    $0x1,%eax
  36:	00 00                	add    %al,(%rax)
  38:	00 01                	add    %al,(%rcx)
  3a:	00 55 15             	add    %dl,0x15(%rbp)
  3d:	01 00                	add    %eax,(%rax)
  3f:	00 00                	add    %al,(%rax)
  41:	00 00                	add    %al,(%rax)
  43:	00 32                	add    %dh,(%rdx)
  45:	01 00                	add    %eax,(%rax)
  47:	00 00                	add    %al,(%rax)
  49:	00 00                	add    %al,(%rax)
  4b:	00 04 00             	add    %al,(%rax,%rax,1)
  4e:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  52:	32 01                	xor    (%rcx),%al
  54:	00 00                	add    %al,(%rax)
  56:	00 00                	add    %al,(%rax)
  58:	00 00                	add    %al,(%rax)
  5a:	3c 01                	cmp    $0x1,%al
  5c:	00 00                	add    %al,(%rax)
  5e:	00 00                	add    %al,(%rax)
  60:	00 00                	add    %al,(%rax)
  62:	01 00                	add    %eax,(%rax)
  64:	55                   	push   %rbp
  65:	3c 01                	cmp    $0x1,%al
  67:	00 00                	add    %al,(%rax)
  69:	00 00                	add    %al,(%rax)
  6b:	00 00                	add    %al,(%rax)
  6d:	50                   	push   %rax
  6e:	01 00                	add    %eax,(%rax)
  70:	00 00                	add    %al,(%rax)
  72:	00 00                	add    %al,(%rax)
  74:	00 04 00             	add    %al,(%rax,%rax,1)
  77:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
	...
  93:	21 00                	and    %eax,(%rax)
  95:	00 00                	add    %al,(%rax)
  97:	00 00                	add    %al,(%rax)
  99:	00 00                	add    %al,(%rax)
  9b:	01 00                	add    %eax,(%rax)
  9d:	54                   	push   %rsp
  9e:	21 00                	and    %eax,(%rax)
  a0:	00 00                	add    %al,(%rax)
  a2:	00 00                	add    %al,(%rax)
  a4:	00 00                	add    %al,(%rax)
  a6:	36 00 00             	add    %al,%ss:(%rax)
  a9:	00 00                	add    %al,(%rax)
  ab:	00 00                	add    %al,(%rax)
  ad:	00 01                	add    %al,(%rcx)
  af:	00 53 36             	add    %dl,0x36(%rbx)
  b2:	00 00                	add    %al,(%rax)
  b4:	00 00                	add    %al,(%rax)
  b6:	00 00                	add    %al,(%rax)
  b8:	00 02                	add    %al,(%rdx)
  ba:	01 00                	add    %eax,(%rax)
  bc:	00 00                	add    %al,(%rax)
  be:	00 00                	add    %al,(%rax)
  c0:	00 04 00             	add    %al,(%rax,%rax,1)
  c3:	f3 01 54 9f 02       	repz add %edx,0x2(%rdi,%rbx,4)
  c8:	01 00                	add    %eax,(%rax)
  ca:	00 00                	add    %al,(%rax)
  cc:	00 00                	add    %al,(%rax)
  ce:	00 15 01 00 00 00    	add    %dl,0x1(%rip)        # d5 <_init-0x400a93>
  d4:	00 00                	add    %al,(%rax)
  d6:	00 01                	add    %al,(%rcx)
  d8:	00 54 15 01          	add    %dl,0x1(%rbp,%rdx,1)
  dc:	00 00                	add    %al,(%rax)
  de:	00 00                	add    %al,(%rax)
  e0:	00 00                	add    %al,(%rax)
  e2:	50                   	push   %rax
  e3:	01 00                	add    %eax,(%rax)
  e5:	00 00                	add    %al,(%rax)
  e7:	00 00                	add    %al,(%rax)
  e9:	00 01                	add    %al,(%rcx)
  eb:	00 53 00             	add    %dl,0x0(%rbx)
	...
  fa:	00 00                	add    %al,(%rax)
  fc:	00 58 00             	add    %bl,0x0(%rax)
  ff:	00 00                	add    %al,(%rax)
 101:	00 00                	add    %al,(%rax)
 103:	00 00                	add    %al,(%rax)
 105:	5f                   	pop    %rdi
 106:	00 00                	add    %al,(%rax)
 108:	00 00                	add    %al,(%rax)
 10a:	00 00                	add    %al,(%rax)
 10c:	00 01                	add    %al,(%rcx)
 10e:	00 50 76             	add    %dl,0x76(%rax)
 111:	00 00                	add    %al,(%rax)
 113:	00 00                	add    %al,(%rax)
 115:	00 00                	add    %al,(%rax)
 117:	00 7d 00             	add    %bh,0x0(%rbp)
 11a:	00 00                	add    %al,(%rax)
 11c:	00 00                	add    %al,(%rax)
 11e:	00 00                	add    %al,(%rax)
 120:	01 00                	add    %eax,(%rax)
 122:	50                   	push   %rax
 123:	94                   	xchg   %eax,%esp
 124:	00 00                	add    %al,(%rax)
 126:	00 00                	add    %al,(%rax)
 128:	00 00                	add    %al,(%rax)
 12a:	00 9b 00 00 00 00    	add    %bl,0x0(%rbx)
 130:	00 00                	add    %al,(%rax)
 132:	00 01                	add    %al,(%rcx)
 134:	00 50 b2             	add    %dl,-0x4e(%rax)
 137:	00 00                	add    %al,(%rax)
 139:	00 00                	add    %al,(%rax)
 13b:	00 00                	add    %al,(%rax)
 13d:	00 b9 00 00 00 00    	add    %bh,0x0(%rcx)
 143:	00 00                	add    %al,(%rax)
 145:	00 01                	add    %al,(%rcx)
 147:	00 50 d0             	add    %dl,-0x30(%rax)
 14a:	00 00                	add    %al,(%rax)
 14c:	00 00                	add    %al,(%rax)
 14e:	00 00                	add    %al,(%rax)
 150:	00 d7                	add    %dl,%bh
 152:	00 00                	add    %al,(%rax)
 154:	00 00                	add    %al,(%rax)
 156:	00 00                	add    %al,(%rax)
 158:	00 01                	add    %al,(%rcx)
 15a:	00 50 ee             	add    %dl,-0x12(%rax)
 15d:	00 00                	add    %al,(%rax)
 15f:	00 00                	add    %al,(%rax)
 161:	00 00                	add    %al,(%rax)
 163:	00 f5                	add    %dh,%ch
 165:	00 00                	add    %al,(%rax)
 167:	00 00                	add    %al,(%rax)
 169:	00 00                	add    %al,(%rax)
 16b:	00 01                	add    %al,(%rcx)
 16d:	00 50 00             	add    %dl,0x0(%rax)
	...
