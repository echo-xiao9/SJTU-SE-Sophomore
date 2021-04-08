
bomb:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x8bb>
  400248:	78 38                	js     400282 <_init-0x8ae>
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
  400283:	00 17                	add    %dl,(%rdi)
  400285:	2f                   	(bad)  
  400286:	cc                   	int3   
  400287:	61                   	(bad)  
  400288:	bd 3f b9 2f 0e       	mov    $0xe2fb93f,%ebp
  40028d:	48 bc d6 47 e5 78 09 	movabs $0xa671550978e547d6,%rsp
  400294:	55 71 a6 
  400297:	e4                   	.byte 0xe4

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	02 00                	add    (%rax),%al
  40029a:	00 00                	add    %al,(%rax)
  40029c:	22 00                	and    (%rax),%al
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
  4002a2:	00 00                	add    %al,(%rax)
  4002a4:	06                   	(bad)  
  4002a5:	00 00                	add    %al,(%rax)
  4002a7:	00 00                	add    %al,(%rax)
  4002a9:	00 20                	add    %ah,(%rax)
  4002ab:	00 80 01 10 00 22    	add    %al,0x22001001(%rax)
  4002b1:	00 00                	add    %al,(%rax)
  4002b3:	00 23                	add    %ah,(%rbx)
  4002b5:	00 00                	add    %al,(%rax)
  4002b7:	00 29                	add    %ch,(%rcx)
  4002b9:	1d 8c 1c 67 55       	sbb    $0x55671c8c,%eax
  4002be:	61                   	(bad)  
  4002bf:	10                   	.byte 0x10

Disassembly of section .dynsym:

00000000004002c0 <.dynsym>:
	...
  4002d8:	be 00 00 00 12       	mov    $0x12000000,%esi
	...
  4002ed:	00 00                	add    %al,(%rax)
  4002ef:	00 84 00 00 00 12 00 	add    %al,0x120000(%rax,%rax,1)
	...
  400306:	00 00                	add    %al,(%rax)
  400308:	21 00                	and    %eax,(%rax)
  40030a:	00 00                	add    %al,(%rax)
  40030c:	12 00                	adc    (%rax),%al
	...
  40031e:	00 00                	add    %al,(%rax)
  400320:	5a                   	pop    %rdx
  400321:	00 00                	add    %al,(%rax)
  400323:	00 12                	add    %dl,(%rdx)
	...
  400335:	00 00                	add    %al,(%rax)
  400337:	00 df                	add    %bl,%bh
  400339:	00 00                	add    %al,(%rax)
  40033b:	00 12                	add    %dl,(%rdx)
	...
  40034d:	00 00                	add    %al,(%rax)
  40034f:	00 a2 00 00 00 12    	add    %ah,0x12000000(%rdx)
	...
  400365:	00 00                	add    %al,(%rax)
  400367:	00 c5                	add    %al,%ch
  400369:	00 00                	add    %al,(%rax)
  40036b:	00 12                	add    %dl,(%rdx)
	...
  40037d:	00 00                	add    %al,(%rax)
  40037f:	00 ec                	add    %ch,%ah
  400381:	00 00                	add    %al,(%rax)
  400383:	00 12                	add    %dl,(%rdx)
	...
  400395:	00 00                	add    %al,(%rax)
  400397:	00 6f 00             	add    %ch,0x0(%rdi)
  40039a:	00 00                	add    %al,(%rax)
  40039c:	12 00                	adc    (%rax),%al
	...
  4003ae:	00 00                	add    %al,(%rax)
  4003b0:	da 00                	fiaddl (%rax)
  4003b2:	00 00                	add    %al,(%rax)
  4003b4:	12 00                	adc    (%rax),%al
	...
  4003c6:	00 00                	add    %al,(%rax)
  4003c8:	a3 00 00 00 12 00 00 	movabs %eax,0x12000000
  4003cf:	00 00 
	...
  4003dd:	00 00                	add    %al,(%rax)
  4003df:	00 9c 00 00 00 12 00 	add    %bl,0x120000(%rax,%rax,1)
	...
  4003f6:	00 00                	add    %al,(%rax)
  4003f8:	f9                   	stc    
  4003f9:	00 00                	add    %al,(%rax)
  4003fb:	00 12                	add    %dl,(%rdx)
	...
  40040d:	00 00                	add    %al,(%rax)
  40040f:	00 76 00             	add    %dh,0x0(%rsi)
  400412:	00 00                	add    %al,(%rax)
  400414:	12 00                	adc    (%rax),%al
	...
  400426:	00 00                	add    %al,(%rax)
  400428:	7c 00                	jl     40042a <_init-0x706>
  40042a:	00 00                	add    %al,(%rax)
  40042c:	12 00                	adc    (%rax),%al
	...
  40043e:	00 00                	add    %al,(%rax)
  400440:	53                   	push   %rbx
  400441:	00 00                	add    %al,(%rax)
  400443:	00 12                	add    %dl,(%rdx)
	...
  400455:	00 00                	add    %al,(%rax)
  400457:	00 cc                	add    %cl,%ah
  400459:	00 00                	add    %al,(%rax)
  40045b:	00 12                	add    %dl,(%rdx)
	...
  40046d:	00 00                	add    %al,(%rax)
  40046f:	00 eb                	add    %ch,%bl
  400471:	00 00                	add    %al,(%rax)
  400473:	00 12                	add    %dl,(%rdx)
	...
  400485:	00 00                	add    %al,(%rax)
  400487:	00 0b                	add    %cl,(%rbx)
  400489:	01 00                	add    %eax,(%rax)
  40048b:	00 20                	add    %ah,(%rax)
	...
  40049d:	00 00                	add    %al,(%rax)
  40049f:	00 65 00             	add    %ah,0x0(%rbp)
  4004a2:	00 00                	add    %al,(%rax)
  4004a4:	12 00                	adc    (%rax),%al
	...
  4004b6:	00 00                	add    %al,(%rax)
  4004b8:	1a 00                	sbb    (%rax),%al
  4004ba:	00 00                	add    %al,(%rax)
  4004bc:	12 00                	adc    (%rax),%al
	...
  4004ce:	00 00                	add    %al,(%rax)
  4004d0:	3b 00                	cmp    (%rax),%eax
  4004d2:	00 00                	add    %al,(%rax)
  4004d4:	12 00                	adc    (%rax),%al
	...
  4004e6:	00 00                	add    %al,(%rax)
  4004e8:	e5 00                	in     $0x0,%eax
  4004ea:	00 00                	add    %al,(%rax)
  4004ec:	12 00                	adc    (%rax),%al
	...
  4004fe:	00 00                	add    %al,(%rax)
  400500:	12 00                	adc    (%rax),%al
  400502:	00 00                	add    %al,(%rax)
  400504:	12 00                	adc    (%rax),%al
	...
  400516:	00 00                	add    %al,(%rax)
  400518:	35 00 00 00 12       	xor    $0x12000000,%eax
	...
  40052d:	00 00                	add    %al,(%rax)
  40052f:	00 a9 00 00 00 12    	add    %ch,0x12000000(%rcx)
	...
  400545:	00 00                	add    %al,(%rax)
  400547:	00 2d 00 00 00 12    	add    %ch,0x12000000(%rip)        # 1240054d <_end+0x11dfc91d>
	...
  40055d:	00 00                	add    %al,(%rax)
  40055f:	00 28                	add    %ch,(%rax)
  400561:	00 00                	add    %al,(%rax)
  400563:	00 12                	add    %dl,(%rdx)
	...
  400575:	00 00                	add    %al,(%rax)
  400577:	00 4b 00             	add    %cl,0x0(%rbx)
  40057a:	00 00                	add    %al,(%rax)
  40057c:	12 00                	adc    (%rax),%al
	...
  40058e:	00 00                	add    %al,(%rax)
  400590:	de 00                	fiadd  (%rax)
  400592:	00 00                	add    %al,(%rax)
  400594:	12 00                	adc    (%rax),%al
	...
  4005a6:	00 00                	add    %al,(%rax)
  4005a8:	f3 00 00             	repz add %al,(%rax)
  4005ab:	00 12                	add    %dl,(%rdx)
	...
  4005bd:	00 00                	add    %al,(%rax)
  4005bf:	00 b0 00 00 00 12    	add    %dh,0x12000000(%rax)
	...
  4005d5:	00 00                	add    %al,(%rax)
  4005d7:	00 0b                	add    %cl,(%rbx)
  4005d9:	00 00                	add    %al,(%rax)
  4005db:	00 12                	add    %dl,(%rdx)
	...
  4005ed:	00 00                	add    %al,(%rax)
  4005ef:	00 95 00 00 00 11    	add    %dl,0x11000000(%rbp)
  4005f5:	00 19                	add    %bl,(%rcx)
  4005f7:	00 60 35             	add    %ah,0x35(%rax)
  4005fa:	60                   	(bad)  
  4005fb:	00 00                	add    %al,(%rax)
  4005fd:	00 00                	add    %al,(%rax)
  4005ff:	00 08                	add    %cl,(%rax)
  400601:	00 00                	add    %al,(%rax)
  400603:	00 00                	add    %al,(%rax)
  400605:	00 00                	add    %al,(%rax)
  400607:	00 5f 00             	add    %bl,0x0(%rdi)
  40060a:	00 00                	add    %al,(%rax)
  40060c:	11 00                	adc    %eax,(%rax)
  40060e:	19 00                	sbb    %eax,(%rax)
  400610:	70 35                	jo     400647 <_init-0x4e9>
  400612:	60                   	(bad)  
  400613:	00 00                	add    %al,(%rax)
  400615:	00 00                	add    %al,(%rax)
  400617:	00 08                	add    %cl,(%rax)
  400619:	00 00                	add    %al,(%rax)
  40061b:	00 00                	add    %al,(%rax)
  40061d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000400620 <.dynstr>:
  400620:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  400624:	63 2e                	movslq (%rsi),%ebp
  400626:	73 6f                	jae    400697 <_init-0x499>
  400628:	2e 36 00 73 6f       	cs add %dh,%ss:0x6f(%rbx)
  40062d:	63 6b 65             	movslq 0x65(%rbx),%ebp
  400630:	74 00                	je     400632 <_init-0x4fe>
  400632:	63 75 73             	movslq 0x73(%rbp),%esi
  400635:	65 72 69             	gs jb  4006a1 <_init-0x48f>
  400638:	64 00 66 66          	add    %ah,%fs:0x66(%rsi)
  40063c:	6c                   	insb   (%dx),%es:(%rdi)
  40063d:	75 73                	jne    4006b2 <_init-0x47e>
  40063f:	68 00 73 74 72       	pushq  $0x72747300
  400644:	63 70 79             	movslq 0x79(%rax),%esi
  400647:	00 65 78             	add    %ah,0x78(%rbp)
  40064a:	69 74 00 73 70 72 69 	imul   $0x6e697270,0x73(%rax,%rax,1),%esi
  400651:	6e 
  400652:	74 66                	je     4006ba <_init-0x476>
  400654:	00 66 6f             	add    %ah,0x6f(%rsi)
  400657:	70 65                	jo     4006be <_init-0x472>
  400659:	6e                   	outsb  %ds:(%rsi),(%dx)
  40065a:	00 5f 5f             	add    %bl,0x5f(%rdi)
  40065d:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
  400664:	73 73                	jae    4006d9 <_init-0x457>
  400666:	63 61 6e             	movslq 0x6e(%rcx),%esp
  400669:	66 00 63 6f          	data16 add %ah,0x6f(%rbx)
  40066d:	6e                   	outsb  %ds:(%rsi),(%dx)
  40066e:	6e                   	outsb  %ds:(%rsi),(%dx)
  40066f:	65 63 74 00 73       	movslq %gs:0x73(%rax,%rax,1),%esi
  400674:	69 67 6e 61 6c 00 70 	imul   $0x70006c61,0x6e(%rdi),%esp
  40067b:	75 74                	jne    4006f1 <_init-0x43f>
  40067d:	73 00                	jae    40067f <_init-0x4b1>
  40067f:	73 74                	jae    4006f5 <_init-0x43b>
  400681:	64 69 6e 00 69 6e 65 	imul   $0x74656e69,%fs:0x0(%rsi),%ebp
  400688:	74 
  400689:	5f                   	pop    %rdi
  40068a:	70 74                	jo     400700 <_init-0x430>
  40068c:	6f                   	outsl  %ds:(%rsi),(%dx)
  40068d:	6e                   	outsb  %ds:(%rsi),(%dx)
  40068e:	00 72 65             	add    %dh,0x65(%rdx)
  400691:	77 69                	ja     4006fc <_init-0x434>
  400693:	6e                   	outsb  %ds:(%rsi),(%dx)
  400694:	64 00 66 67          	add    %ah,%fs:0x67(%rsi)
  400698:	65 74 73             	gs je  40070e <_init-0x422>
  40069b:	00 74 6d 70          	add    %dh,0x70(%rbp,%rbp,2)
  40069f:	66 69 6c 65 00 5f 5f 	imul   $0x5f5f,0x0(%rbp,%riz,2),%bp
  4006a6:	65 72 72             	gs jb  40071b <_init-0x415>
  4006a9:	6e                   	outsb  %ds:(%rsi),(%dx)
  4006aa:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006ab:	5f                   	pop    %rdi
  4006ac:	6c                   	insb   (%dx),%es:(%rdi)
  4006ad:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006ae:	63 61 74             	movslq 0x74(%rcx),%esp
  4006b1:	69 6f 6e 00 73 74 64 	imul   $0x64747300,0x6e(%rdi),%ebp
  4006b8:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006b9:	75 74                	jne    40072f <_init-0x401>
  4006bb:	00 66 70             	add    %ah,0x70(%rsi)
  4006be:	75 74                	jne    400734 <_init-0x3fc>
  4006c0:	63 00                	movslq (%rax),%eax
  4006c2:	66 63 6c 6f 73       	movslq 0x73(%rdi,%rbp,2),%bp
  4006c7:	65 00 73 74          	add    %dh,%gs:0x74(%rbx)
  4006cb:	72 63                	jb     400730 <_init-0x400>
  4006cd:	61                   	(bad)  
  4006ce:	74 00                	je     4006d0 <_init-0x460>
  4006d0:	5f                   	pop    %rdi
  4006d1:	5f                   	pop    %rdi
  4006d2:	63 74 79 70          	movslq 0x70(%rcx,%rdi,2),%esi
  4006d6:	65 5f                	gs pop %rdi
  4006d8:	62                   	(bad)  
  4006d9:	5f                   	pop    %rdi
  4006da:	6c                   	insb   (%dx),%es:(%rdi)
  4006db:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006dc:	63 00                	movslq (%rax),%eax
  4006de:	67 65 74 65          	addr32 gs je 400747 <_init-0x3e9>
  4006e2:	6e                   	outsb  %ds:(%rsi),(%dx)
  4006e3:	76 00                	jbe    4006e5 <_init-0x44b>
  4006e5:	73 79                	jae    400760 <_init-0x3d0>
  4006e7:	73 74                	jae    40075d <_init-0x3d3>
  4006e9:	65 6d                	gs insl (%dx),%es:(%rdi)
  4006eb:	00 67 65             	add    %ah,0x65(%rdi)
  4006ee:	74 68                	je     400758 <_init-0x3d8>
  4006f0:	6f                   	outsl  %ds:(%rsi),(%dx)
  4006f1:	73 74                	jae    400767 <_init-0x3c9>
  4006f3:	62                   	(bad)  
  4006f4:	79 6e                	jns    400764 <_init-0x3cc>
  4006f6:	61                   	(bad)  
  4006f7:	6d                   	insl   (%dx),%es:(%rdi)
  4006f8:	65 00 64 75 70       	add    %ah,%gs:0x70(%rbp,%rsi,2)
  4006fd:	00 66 77             	add    %ah,0x77(%rsi)
  400700:	72 69                	jb     40076b <_init-0x3c5>
  400702:	74 65                	je     400769 <_init-0x3c7>
  400704:	00 62 63             	add    %ah,0x63(%rdx)
  400707:	6f                   	outsl  %ds:(%rsi),(%dx)
  400708:	70 79                	jo     400783 <_init-0x3ad>
  40070a:	00 66 70             	add    %ah,0x70(%rsi)
  40070d:	72 69                	jb     400778 <_init-0x3b8>
  40070f:	6e                   	outsb  %ds:(%rsi),(%dx)
  400710:	74 66                	je     400778 <_init-0x3b8>
  400712:	00 73 6c             	add    %dh,0x6c(%rbx)
  400715:	65 65 70 00          	gs gs jo 400719 <_init-0x417>
  400719:	5f                   	pop    %rdi
  40071a:	5f                   	pop    %rdi
  40071b:	6c                   	insb   (%dx),%es:(%rdi)
  40071c:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  400723:	72 74                	jb     400799 <_init-0x397>
  400725:	5f                   	pop    %rdi
  400726:	6d                   	insl   (%dx),%es:(%rdi)
  400727:	61                   	(bad)  
  400728:	69 6e 00 5f 5f 67 6d 	imul   $0x6d675f5f,0x0(%rsi),%ebp
  40072f:	6f                   	outsl  %ds:(%rsi),(%dx)
  400730:	6e                   	outsb  %ds:(%rsi),(%dx)
  400731:	5f                   	pop    %rdi
  400732:	73 74                	jae    4007a8 <_init-0x388>
  400734:	61                   	(bad)  
  400735:	72 74                	jb     4007ab <_init-0x385>
  400737:	5f                   	pop    %rdi
  400738:	5f                   	pop    %rdi
  400739:	00 47 4c             	add    %al,0x4c(%rdi)
  40073c:	49                   	rex.WB
  40073d:	42                   	rex.X
  40073e:	43 5f                	rex.XB pop %r15
  400740:	32 2e                	xor    (%rsi),%ch
  400742:	33 00                	xor    (%rax),%eax
  400744:	47                   	rex.RXB
  400745:	4c                   	rex.WR
  400746:	49                   	rex.WB
  400747:	42                   	rex.X
  400748:	43 5f                	rex.XB pop %r15
  40074a:	32 2e                	xor    (%rsi),%ch
  40074c:	37                   	(bad)  
  40074d:	00 47 4c             	add    %al,0x4c(%rdi)
  400750:	49                   	rex.WB
  400751:	42                   	rex.X
  400752:	43 5f                	rex.XB pop %r15
  400754:	32 2e                	xor    (%rsi),%ch
  400756:	32 2e                	xor    (%rsi),%ch
  400758:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

000000000040075a <.gnu.version>:
  40075a:	00 00                	add    %al,(%rax)
  40075c:	02 00                	add    (%rax),%al
  40075e:	02 00                	add    (%rax),%al
  400760:	02 00                	add    (%rax),%al
  400762:	02 00                	add    (%rax),%al
  400764:	02 00                	add    (%rax),%al
  400766:	02 00                	add    (%rax),%al
  400768:	02 00                	add    (%rax),%al
  40076a:	02 00                	add    (%rax),%al
  40076c:	02 00                	add    (%rax),%al
  40076e:	02 00                	add    (%rax),%al
  400770:	02 00                	add    (%rax),%al
  400772:	02 00                	add    (%rax),%al
  400774:	02 00                	add    (%rax),%al
  400776:	02 00                	add    (%rax),%al
  400778:	02 00                	add    (%rax),%al
  40077a:	02 00                	add    (%rax),%al
  40077c:	02 00                	add    (%rax),%al
  40077e:	02 00                	add    (%rax),%al
  400780:	00 00                	add    %al,(%rax)
  400782:	02 00                	add    (%rax),%al
  400784:	02 00                	add    (%rax),%al
  400786:	03 00                	add    (%rax),%eax
  400788:	02 00                	add    (%rax),%al
  40078a:	02 00                	add    (%rax),%al
  40078c:	02 00                	add    (%rax),%al
  40078e:	02 00                	add    (%rax),%al
  400790:	02 00                	add    (%rax),%al
  400792:	02 00                	add    (%rax),%al
  400794:	02 00                	add    (%rax),%al
  400796:	02 00                	add    (%rax),%al
  400798:	02 00                	add    (%rax),%al
  40079a:	04 00                	add    $0x0,%al
  40079c:	02 00                	add    (%rax),%al
  40079e:	02 00                	add    (%rax),%al
  4007a0:	02 00                	add    (%rax),%al

Disassembly of section .gnu.version_r:

00000000004007a8 <.gnu.version_r>:
  4007a8:	01 00                	add    %eax,(%rax)
  4007aa:	03 00                	add    (%rax),%eax
  4007ac:	01 00                	add    %eax,(%rax)
  4007ae:	00 00                	add    %al,(%rax)
  4007b0:	10 00                	adc    %al,(%rax)
  4007b2:	00 00                	add    %al,(%rax)
  4007b4:	00 00                	add    %al,(%rax)
  4007b6:	00 00                	add    %al,(%rax)
  4007b8:	13 69 69             	adc    0x69(%rcx),%ebp
  4007bb:	0d 00 00 04 00       	or     $0x40000,%eax
  4007c0:	1a 01                	sbb    (%rcx),%al
  4007c2:	00 00                	add    %al,(%rax)
  4007c4:	10 00                	adc    %al,(%rax)
  4007c6:	00 00                	add    %al,(%rax)
  4007c8:	17                   	(bad)  
  4007c9:	69 69 0d 00 00 03 00 	imul   $0x30000,0xd(%rcx),%ebp
  4007d0:	24 01                	and    $0x1,%al
  4007d2:	00 00                	add    %al,(%rax)
  4007d4:	10 00                	adc    %al,(%rax)
  4007d6:	00 00                	add    %al,(%rax)
  4007d8:	75 1a                	jne    4007f4 <_init-0x33c>
  4007da:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  4007e0:	2e 01 00             	add    %eax,%cs:(%rax)
  4007e3:	00 00                	add    %al,(%rax)
  4007e5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

00000000004007e8 <.rela.dyn>:
  4007e8:	f0 2f                	lock (bad) 
  4007ea:	60                   	(bad)  
  4007eb:	00 00                	add    %al,(%rax)
  4007ed:	00 00                	add    %al,(%rax)
  4007ef:	00 06                	add    %al,(%rsi)
  4007f1:	00 00                	add    %al,(%rax)
  4007f3:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 4007f9 <_init-0x337>
  4007f9:	00 00                	add    %al,(%rax)
  4007fb:	00 00                	add    %al,(%rax)
  4007fd:	00 00                	add    %al,(%rax)
  4007ff:	00 f8                	add    %bh,%al
  400801:	2f                   	(bad)  
  400802:	60                   	(bad)  
  400803:	00 00                	add    %al,(%rax)
  400805:	00 00                	add    %al,(%rax)
  400807:	00 06                	add    %al,(%rsi)
  400809:	00 00                	add    %al,(%rax)
  40080b:	00 13                	add    %dl,(%rbx)
	...
  400815:	00 00                	add    %al,(%rax)
  400817:	00 60 35             	add    %ah,0x35(%rax)
  40081a:	60                   	(bad)  
  40081b:	00 00                	add    %al,(%rax)
  40081d:	00 00                	add    %al,(%rax)
  40081f:	00 05 00 00 00 22    	add    %al,0x22000000(%rip)        # 22400825 <_end+0x21dfcbf5>
	...
  40082d:	00 00                	add    %al,(%rax)
  40082f:	00 70 35             	add    %dh,0x35(%rax)
  400832:	60                   	(bad)  
  400833:	00 00                	add    %al,(%rax)
  400835:	00 00                	add    %al,(%rax)
  400837:	00 05 00 00 00 23    	add    %al,0x23000000(%rip)        # 2340083d <_end+0x22dfcc0d>
	...

Disassembly of section .rela.plt:

0000000000400848 <.rela.plt>:
  400848:	18 30                	sbb    %dh,(%rax)
  40084a:	60                   	(bad)  
  40084b:	00 00                	add    %al,(%rax)
  40084d:	00 00                	add    %al,(%rax)
  40084f:	00 07                	add    %al,(%rdi)
  400851:	00 00                	add    %al,(%rax)
  400853:	00 01                	add    %al,(%rcx)
	...
  40085d:	00 00                	add    %al,(%rax)
  40085f:	00 20                	add    %ah,(%rax)
  400861:	30 60 00             	xor    %ah,0x0(%rax)
  400864:	00 00                	add    %al,(%rax)
  400866:	00 00                	add    %al,(%rax)
  400868:	07                   	(bad)  
  400869:	00 00                	add    %al,(%rax)
  40086b:	00 02                	add    %al,(%rdx)
	...
  400875:	00 00                	add    %al,(%rax)
  400877:	00 28                	add    %ch,(%rax)
  400879:	30 60 00             	xor    %ah,0x0(%rax)
  40087c:	00 00                	add    %al,(%rax)
  40087e:	00 00                	add    %al,(%rax)
  400880:	07                   	(bad)  
  400881:	00 00                	add    %al,(%rax)
  400883:	00 03                	add    %al,(%rbx)
	...
  40088d:	00 00                	add    %al,(%rax)
  40088f:	00 30                	add    %dh,(%rax)
  400891:	30 60 00             	xor    %ah,0x0(%rax)
  400894:	00 00                	add    %al,(%rax)
  400896:	00 00                	add    %al,(%rax)
  400898:	07                   	(bad)  
  400899:	00 00                	add    %al,(%rax)
  40089b:	00 04 00             	add    %al,(%rax,%rax,1)
	...
  4008a6:	00 00                	add    %al,(%rax)
  4008a8:	38 30                	cmp    %dh,(%rax)
  4008aa:	60                   	(bad)  
  4008ab:	00 00                	add    %al,(%rax)
  4008ad:	00 00                	add    %al,(%rax)
  4008af:	00 07                	add    %al,(%rdi)
  4008b1:	00 00                	add    %al,(%rax)
  4008b3:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 4008b9 <_init-0x277>
  4008b9:	00 00                	add    %al,(%rax)
  4008bb:	00 00                	add    %al,(%rax)
  4008bd:	00 00                	add    %al,(%rax)
  4008bf:	00 40 30             	add    %al,0x30(%rax)
  4008c2:	60                   	(bad)  
  4008c3:	00 00                	add    %al,(%rax)
  4008c5:	00 00                	add    %al,(%rax)
  4008c7:	00 07                	add    %al,(%rdi)
  4008c9:	00 00                	add    %al,(%rax)
  4008cb:	00 06                	add    %al,(%rsi)
	...
  4008d5:	00 00                	add    %al,(%rax)
  4008d7:	00 48 30             	add    %cl,0x30(%rax)
  4008da:	60                   	(bad)  
  4008db:	00 00                	add    %al,(%rax)
  4008dd:	00 00                	add    %al,(%rax)
  4008df:	00 07                	add    %al,(%rdi)
  4008e1:	00 00                	add    %al,(%rax)
  4008e3:	00 07                	add    %al,(%rdi)
	...
  4008ed:	00 00                	add    %al,(%rax)
  4008ef:	00 50 30             	add    %dl,0x30(%rax)
  4008f2:	60                   	(bad)  
  4008f3:	00 00                	add    %al,(%rax)
  4008f5:	00 00                	add    %al,(%rax)
  4008f7:	00 07                	add    %al,(%rdi)
  4008f9:	00 00                	add    %al,(%rax)
  4008fb:	00 08                	add    %cl,(%rax)
	...
  400905:	00 00                	add    %al,(%rax)
  400907:	00 58 30             	add    %bl,0x30(%rax)
  40090a:	60                   	(bad)  
  40090b:	00 00                	add    %al,(%rax)
  40090d:	00 00                	add    %al,(%rax)
  40090f:	00 07                	add    %al,(%rdi)
  400911:	00 00                	add    %al,(%rax)
  400913:	00 09                	add    %cl,(%rcx)
	...
  40091d:	00 00                	add    %al,(%rax)
  40091f:	00 60 30             	add    %ah,0x30(%rax)
  400922:	60                   	(bad)  
  400923:	00 00                	add    %al,(%rax)
  400925:	00 00                	add    %al,(%rax)
  400927:	00 07                	add    %al,(%rdi)
  400929:	00 00                	add    %al,(%rax)
  40092b:	00 0a                	add    %cl,(%rdx)
	...
  400935:	00 00                	add    %al,(%rax)
  400937:	00 68 30             	add    %ch,0x30(%rax)
  40093a:	60                   	(bad)  
  40093b:	00 00                	add    %al,(%rax)
  40093d:	00 00                	add    %al,(%rax)
  40093f:	00 07                	add    %al,(%rdi)
  400941:	00 00                	add    %al,(%rax)
  400943:	00 0b                	add    %cl,(%rbx)
	...
  40094d:	00 00                	add    %al,(%rax)
  40094f:	00 70 30             	add    %dh,0x30(%rax)
  400952:	60                   	(bad)  
  400953:	00 00                	add    %al,(%rax)
  400955:	00 00                	add    %al,(%rax)
  400957:	00 07                	add    %al,(%rdi)
  400959:	00 00                	add    %al,(%rax)
  40095b:	00 0c 00             	add    %cl,(%rax,%rax,1)
	...
  400966:	00 00                	add    %al,(%rax)
  400968:	78 30                	js     40099a <_init-0x196>
  40096a:	60                   	(bad)  
  40096b:	00 00                	add    %al,(%rax)
  40096d:	00 00                	add    %al,(%rax)
  40096f:	00 07                	add    %al,(%rdi)
  400971:	00 00                	add    %al,(%rax)
  400973:	00 0e                	add    %cl,(%rsi)
	...
  40097d:	00 00                	add    %al,(%rax)
  40097f:	00 80 30 60 00 00    	add    %al,0x6030(%rax)
  400985:	00 00                	add    %al,(%rax)
  400987:	00 07                	add    %al,(%rdi)
  400989:	00 00                	add    %al,(%rax)
  40098b:	00 0f                	add    %cl,(%rdi)
	...
  400995:	00 00                	add    %al,(%rax)
  400997:	00 88 30 60 00 00    	add    %cl,0x6030(%rax)
  40099d:	00 00                	add    %al,(%rax)
  40099f:	00 07                	add    %al,(%rdi)
  4009a1:	00 00                	add    %al,(%rax)
  4009a3:	00 10                	add    %dl,(%rax)
	...
  4009ad:	00 00                	add    %al,(%rax)
  4009af:	00 90 30 60 00 00    	add    %dl,0x6030(%rax)
  4009b5:	00 00                	add    %al,(%rax)
  4009b7:	00 07                	add    %al,(%rdi)
  4009b9:	00 00                	add    %al,(%rax)
  4009bb:	00 11                	add    %dl,(%rcx)
	...
  4009c5:	00 00                	add    %al,(%rax)
  4009c7:	00 98 30 60 00 00    	add    %bl,0x6030(%rax)
  4009cd:	00 00                	add    %al,(%rax)
  4009cf:	00 07                	add    %al,(%rdi)
  4009d1:	00 00                	add    %al,(%rax)
  4009d3:	00 12                	add    %dl,(%rdx)
	...
  4009dd:	00 00                	add    %al,(%rax)
  4009df:	00 a0 30 60 00 00    	add    %ah,0x6030(%rax)
  4009e5:	00 00                	add    %al,(%rax)
  4009e7:	00 07                	add    %al,(%rdi)
  4009e9:	00 00                	add    %al,(%rax)
  4009eb:	00 14 00             	add    %dl,(%rax,%rax,1)
	...
  4009f6:	00 00                	add    %al,(%rax)
  4009f8:	a8 30                	test   $0x30,%al
  4009fa:	60                   	(bad)  
  4009fb:	00 00                	add    %al,(%rax)
  4009fd:	00 00                	add    %al,(%rax)
  4009ff:	00 07                	add    %al,(%rdi)
  400a01:	00 00                	add    %al,(%rax)
  400a03:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 400a09 <_init-0x127>
  400a09:	00 00                	add    %al,(%rax)
  400a0b:	00 00                	add    %al,(%rax)
  400a0d:	00 00                	add    %al,(%rax)
  400a0f:	00 b0 30 60 00 00    	add    %dh,0x6030(%rax)
  400a15:	00 00                	add    %al,(%rax)
  400a17:	00 07                	add    %al,(%rdi)
  400a19:	00 00                	add    %al,(%rax)
  400a1b:	00 16                	add    %dl,(%rsi)
	...
  400a25:	00 00                	add    %al,(%rax)
  400a27:	00 b8 30 60 00 00    	add    %bh,0x6030(%rax)
  400a2d:	00 00                	add    %al,(%rax)
  400a2f:	00 07                	add    %al,(%rdi)
  400a31:	00 00                	add    %al,(%rax)
  400a33:	00 17                	add    %dl,(%rdi)
	...
  400a3d:	00 00                	add    %al,(%rax)
  400a3f:	00 c0                	add    %al,%al
  400a41:	30 60 00             	xor    %ah,0x0(%rax)
  400a44:	00 00                	add    %al,(%rax)
  400a46:	00 00                	add    %al,(%rax)
  400a48:	07                   	(bad)  
  400a49:	00 00                	add    %al,(%rax)
  400a4b:	00 18                	add    %bl,(%rax)
	...
  400a55:	00 00                	add    %al,(%rax)
  400a57:	00 c8                	add    %cl,%al
  400a59:	30 60 00             	xor    %ah,0x0(%rax)
  400a5c:	00 00                	add    %al,(%rax)
  400a5e:	00 00                	add    %al,(%rax)
  400a60:	07                   	(bad)  
  400a61:	00 00                	add    %al,(%rax)
  400a63:	00 19                	add    %bl,(%rcx)
	...
  400a6d:	00 00                	add    %al,(%rax)
  400a6f:	00 d0                	add    %dl,%al
  400a71:	30 60 00             	xor    %ah,0x0(%rax)
  400a74:	00 00                	add    %al,(%rax)
  400a76:	00 00                	add    %al,(%rax)
  400a78:	07                   	(bad)  
  400a79:	00 00                	add    %al,(%rax)
  400a7b:	00 1a                	add    %bl,(%rdx)
	...
  400a85:	00 00                	add    %al,(%rax)
  400a87:	00 d8                	add    %bl,%al
  400a89:	30 60 00             	xor    %ah,0x0(%rax)
  400a8c:	00 00                	add    %al,(%rax)
  400a8e:	00 00                	add    %al,(%rax)
  400a90:	07                   	(bad)  
  400a91:	00 00                	add    %al,(%rax)
  400a93:	00 1b                	add    %bl,(%rbx)
	...
  400a9d:	00 00                	add    %al,(%rax)
  400a9f:	00 e0                	add    %ah,%al
  400aa1:	30 60 00             	xor    %ah,0x0(%rax)
  400aa4:	00 00                	add    %al,(%rax)
  400aa6:	00 00                	add    %al,(%rax)
  400aa8:	07                   	(bad)  
  400aa9:	00 00                	add    %al,(%rax)
  400aab:	00 1c 00             	add    %bl,(%rax,%rax,1)
	...
  400ab6:	00 00                	add    %al,(%rax)
  400ab8:	e8 30 60 00 00       	callq  406aed <__FRAME_END__+0x4465>
  400abd:	00 00                	add    %al,(%rax)
  400abf:	00 07                	add    %al,(%rdi)
  400ac1:	00 00                	add    %al,(%rax)
  400ac3:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # 400ac9 <_init-0x67>
  400ac9:	00 00                	add    %al,(%rax)
  400acb:	00 00                	add    %al,(%rax)
  400acd:	00 00                	add    %al,(%rax)
  400acf:	00 f0                	add    %dh,%al
  400ad1:	30 60 00             	xor    %ah,0x0(%rax)
  400ad4:	00 00                	add    %al,(%rax)
  400ad6:	00 00                	add    %al,(%rax)
  400ad8:	07                   	(bad)  
  400ad9:	00 00                	add    %al,(%rax)
  400adb:	00 1e                	add    %bl,(%rsi)
	...
  400ae5:	00 00                	add    %al,(%rax)
  400ae7:	00 f8                	add    %bh,%al
  400ae9:	30 60 00             	xor    %ah,0x0(%rax)
  400aec:	00 00                	add    %al,(%rax)
  400aee:	00 00                	add    %al,(%rax)
  400af0:	07                   	(bad)  
  400af1:	00 00                	add    %al,(%rax)
  400af3:	00 1f                	add    %bl,(%rdi)
	...
  400b01:	31 60 00             	xor    %esp,0x0(%rax)
  400b04:	00 00                	add    %al,(%rax)
  400b06:	00 00                	add    %al,(%rax)
  400b08:	07                   	(bad)  
  400b09:	00 00                	add    %al,(%rax)
  400b0b:	00 20                	add    %ah,(%rax)
	...
  400b15:	00 00                	add    %al,(%rax)
  400b17:	00 08                	add    %cl,(%rax)
  400b19:	31 60 00             	xor    %esp,0x0(%rax)
  400b1c:	00 00                	add    %al,(%rax)
  400b1e:	00 00                	add    %al,(%rax)
  400b20:	07                   	(bad)  
  400b21:	00 00                	add    %al,(%rax)
  400b23:	00 21                	add    %ah,(%rcx)
	...

Disassembly of section .init:

0000000000400b30 <_init>:
  400b30:	48 83 ec 08          	sub    $0x8,%rsp
  400b34:	48 8b 05 bd 24 20 00 	mov    0x2024bd(%rip),%rax        # 602ff8 <_DYNAMIC+0x1d8>
  400b3b:	48 85 c0             	test   %rax,%rax
  400b3e:	74 02                	je     400b42 <_init+0x12>
  400b40:	ff d0                	callq  *%rax
  400b42:	48 83 c4 08          	add    $0x8,%rsp
  400b46:	c3                   	retq   

Disassembly of section .plt:

0000000000400b50 <getenv@plt-0x10>:
  400b50:	ff 35 b2 24 20 00    	pushq  0x2024b2(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b56:	ff 25 b4 24 20 00    	jmpq   *0x2024b4(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b60 <getenv@plt>:
  400b60:	ff 25 b2 24 20 00    	jmpq   *0x2024b2(%rip)        # 603018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400b66:	68 00 00 00 00       	pushq  $0x0
  400b6b:	e9 e0 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400b70 <__errno_location@plt>:
  400b70:	ff 25 aa 24 20 00    	jmpq   *0x2024aa(%rip)        # 603020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400b76:	68 01 00 00 00       	pushq  $0x1
  400b7b:	e9 d0 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400b80 <strcpy@plt>:
  400b80:	ff 25 a2 24 20 00    	jmpq   *0x2024a2(%rip)        # 603028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400b86:	68 02 00 00 00       	pushq  $0x2
  400b8b:	e9 c0 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400b90 <puts@plt>:
  400b90:	ff 25 9a 24 20 00    	jmpq   *0x20249a(%rip)        # 603030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400b96:	68 03 00 00 00       	pushq  $0x3
  400b9b:	e9 b0 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400ba0 <write@plt>:
  400ba0:	ff 25 92 24 20 00    	jmpq   *0x202492(%rip)        # 603038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400ba6:	68 04 00 00 00       	pushq  $0x4
  400bab:	e9 a0 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400bb0 <fclose@plt>:
  400bb0:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 603040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400bb6:	68 05 00 00 00       	pushq  $0x5
  400bbb:	e9 90 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400bc0 <system@plt>:
  400bc0:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 603048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400bc6:	68 06 00 00 00       	pushq  $0x6
  400bcb:	e9 80 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400bd0 <printf@plt>:
  400bd0:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 603050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400bd6:	68 07 00 00 00       	pushq  $0x7
  400bdb:	e9 70 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400be0 <rewind@plt>:
  400be0:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 603058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400be6:	68 08 00 00 00       	pushq  $0x8
  400beb:	e9 60 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400bf0 <dup@plt>:
  400bf0:	ff 25 6a 24 20 00    	jmpq   *0x20246a(%rip)        # 603060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400bf6:	68 09 00 00 00       	pushq  $0x9
  400bfb:	e9 50 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c00 <close@plt>:
  400c00:	ff 25 62 24 20 00    	jmpq   *0x202462(%rip)        # 603068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400c06:	68 0a 00 00 00       	pushq  $0xa
  400c0b:	e9 40 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c10 <fputc@plt>:
  400c10:	ff 25 5a 24 20 00    	jmpq   *0x20245a(%rip)        # 603070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400c16:	68 0b 00 00 00       	pushq  $0xb
  400c1b:	e9 30 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c20 <fgets@plt>:
  400c20:	ff 25 52 24 20 00    	jmpq   *0x202452(%rip)        # 603078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400c26:	68 0c 00 00 00       	pushq  $0xc
  400c2b:	e9 20 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c30 <tmpfile@plt>:
  400c30:	ff 25 4a 24 20 00    	jmpq   *0x20244a(%rip)        # 603080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400c36:	68 0d 00 00 00       	pushq  $0xd
  400c3b:	e9 10 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c40 <signal@plt>:
  400c40:	ff 25 42 24 20 00    	jmpq   *0x202442(%rip)        # 603088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400c46:	68 0e 00 00 00       	pushq  $0xe
  400c4b:	e9 00 ff ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c50 <gethostbyname@plt>:
  400c50:	ff 25 3a 24 20 00    	jmpq   *0x20243a(%rip)        # 603090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400c56:	68 0f 00 00 00       	pushq  $0xf
  400c5b:	e9 f0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c60 <fprintf@plt>:
  400c60:	ff 25 32 24 20 00    	jmpq   *0x202432(%rip)        # 603098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400c66:	68 10 00 00 00       	pushq  $0x10
  400c6b:	e9 e0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c70 <inet_pton@plt>:
  400c70:	ff 25 2a 24 20 00    	jmpq   *0x20242a(%rip)        # 6030a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400c76:	68 11 00 00 00       	pushq  $0x11
  400c7b:	e9 d0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c80 <fflush@plt>:
  400c80:	ff 25 22 24 20 00    	jmpq   *0x202422(%rip)        # 6030a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400c86:	68 12 00 00 00       	pushq  $0x12
  400c8b:	e9 c0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400c90 <__isoc99_sscanf@plt>:
  400c90:	ff 25 1a 24 20 00    	jmpq   *0x20241a(%rip)        # 6030b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400c96:	68 13 00 00 00       	pushq  $0x13
  400c9b:	e9 b0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400ca0 <bcopy@plt>:
  400ca0:	ff 25 12 24 20 00    	jmpq   *0x202412(%rip)        # 6030b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400ca6:	68 14 00 00 00       	pushq  $0x14
  400cab:	e9 a0 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400cb0 <cuserid@plt>:
  400cb0:	ff 25 0a 24 20 00    	jmpq   *0x20240a(%rip)        # 6030c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400cb6:	68 15 00 00 00       	pushq  $0x15
  400cbb:	e9 90 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400cc0 <fopen@plt>:
  400cc0:	ff 25 02 24 20 00    	jmpq   *0x202402(%rip)        # 6030c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400cc6:	68 16 00 00 00       	pushq  $0x16
  400ccb:	e9 80 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400cd0 <strcat@plt>:
  400cd0:	ff 25 fa 23 20 00    	jmpq   *0x2023fa(%rip)        # 6030d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400cd6:	68 17 00 00 00       	pushq  $0x17
  400cdb:	e9 70 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400ce0 <sprintf@plt>:
  400ce0:	ff 25 f2 23 20 00    	jmpq   *0x2023f2(%rip)        # 6030d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400ce6:	68 18 00 00 00       	pushq  $0x18
  400ceb:	e9 60 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400cf0 <exit@plt>:
  400cf0:	ff 25 ea 23 20 00    	jmpq   *0x2023ea(%rip)        # 6030e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400cf6:	68 19 00 00 00       	pushq  $0x19
  400cfb:	e9 50 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400d00 <connect@plt>:
  400d00:	ff 25 e2 23 20 00    	jmpq   *0x2023e2(%rip)        # 6030e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400d06:	68 1a 00 00 00       	pushq  $0x1a
  400d0b:	e9 40 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400d10 <fwrite@plt>:
  400d10:	ff 25 da 23 20 00    	jmpq   *0x2023da(%rip)        # 6030f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400d16:	68 1b 00 00 00       	pushq  $0x1b
  400d1b:	e9 30 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400d20 <sleep@plt>:
  400d20:	ff 25 d2 23 20 00    	jmpq   *0x2023d2(%rip)        # 6030f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400d26:	68 1c 00 00 00       	pushq  $0x1c
  400d2b:	e9 20 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400d30 <__ctype_b_loc@plt>:
  400d30:	ff 25 ca 23 20 00    	jmpq   *0x2023ca(%rip)        # 603100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400d36:	68 1d 00 00 00       	pushq  $0x1d
  400d3b:	e9 10 fe ff ff       	jmpq   400b50 <_init+0x20>

0000000000400d40 <socket@plt>:
  400d40:	ff 25 c2 23 20 00    	jmpq   *0x2023c2(%rip)        # 603108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400d46:	68 1e 00 00 00       	pushq  $0x1e
  400d4b:	e9 00 fe ff ff       	jmpq   400b50 <_init+0x20>

Disassembly of section .text:

0000000000400d50 <_start>:
  400d50:	31 ed                	xor    %ebp,%ebp
  400d52:	49 89 d1             	mov    %rdx,%r9
  400d55:	5e                   	pop    %rsi
  400d56:	48 89 e2             	mov    %rsp,%rdx
  400d59:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d5d:	50                   	push   %rax
  400d5e:	54                   	push   %rsp
  400d5f:	49 c7 c0 40 1c 40 00 	mov    $0x401c40,%r8
  400d66:	48 c7 c1 d0 1b 40 00 	mov    $0x401bd0,%rcx
  400d6d:	48 c7 c7 46 0e 40 00 	mov    $0x400e46,%rdi
  400d74:	ff 15 76 22 20 00    	callq  *0x202276(%rip)        # 602ff0 <_DYNAMIC+0x1d0>
  400d7a:	f4                   	hlt    
  400d7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400d80 <deregister_tm_clones>:
  400d80:	b8 4f 35 60 00       	mov    $0x60354f,%eax
  400d85:	55                   	push   %rbp
  400d86:	48 2d 48 35 60 00    	sub    $0x603548,%rax
  400d8c:	48 83 f8 0e          	cmp    $0xe,%rax
  400d90:	48 89 e5             	mov    %rsp,%rbp
  400d93:	76 1b                	jbe    400db0 <deregister_tm_clones+0x30>
  400d95:	b8 00 00 00 00       	mov    $0x0,%eax
  400d9a:	48 85 c0             	test   %rax,%rax
  400d9d:	74 11                	je     400db0 <deregister_tm_clones+0x30>
  400d9f:	5d                   	pop    %rbp
  400da0:	bf 48 35 60 00       	mov    $0x603548,%edi
  400da5:	ff e0                	jmpq   *%rax
  400da7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400dae:	00 00 
  400db0:	5d                   	pop    %rbp
  400db1:	c3                   	retq   
  400db2:	0f 1f 40 00          	nopl   0x0(%rax)
  400db6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400dbd:	00 00 00 

0000000000400dc0 <register_tm_clones>:
  400dc0:	be 48 35 60 00       	mov    $0x603548,%esi
  400dc5:	55                   	push   %rbp
  400dc6:	48 81 ee 48 35 60 00 	sub    $0x603548,%rsi
  400dcd:	48 c1 fe 03          	sar    $0x3,%rsi
  400dd1:	48 89 e5             	mov    %rsp,%rbp
  400dd4:	48 89 f0             	mov    %rsi,%rax
  400dd7:	48 c1 e8 3f          	shr    $0x3f,%rax
  400ddb:	48 01 c6             	add    %rax,%rsi
  400dde:	48 d1 fe             	sar    %rsi
  400de1:	74 15                	je     400df8 <register_tm_clones+0x38>
  400de3:	b8 00 00 00 00       	mov    $0x0,%eax
  400de8:	48 85 c0             	test   %rax,%rax
  400deb:	74 0b                	je     400df8 <register_tm_clones+0x38>
  400ded:	5d                   	pop    %rbp
  400dee:	bf 48 35 60 00       	mov    $0x603548,%edi
  400df3:	ff e0                	jmpq   *%rax
  400df5:	0f 1f 00             	nopl   (%rax)
  400df8:	5d                   	pop    %rbp
  400df9:	c3                   	retq   
  400dfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e00 <__do_global_dtors_aux>:
  400e00:	80 3d 71 27 20 00 00 	cmpb   $0x0,0x202771(%rip)        # 603578 <completed.6972>
  400e07:	75 11                	jne    400e1a <__do_global_dtors_aux+0x1a>
  400e09:	55                   	push   %rbp
  400e0a:	48 89 e5             	mov    %rsp,%rbp
  400e0d:	e8 6e ff ff ff       	callq  400d80 <deregister_tm_clones>
  400e12:	5d                   	pop    %rbp
  400e13:	c6 05 5e 27 20 00 01 	movb   $0x1,0x20275e(%rip)        # 603578 <completed.6972>
  400e1a:	f3 c3                	repz retq 
  400e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e20 <frame_dummy>:
  400e20:	bf 18 2e 60 00       	mov    $0x602e18,%edi
  400e25:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400e29:	75 05                	jne    400e30 <frame_dummy+0x10>
  400e2b:	eb 93                	jmp    400dc0 <register_tm_clones>
  400e2d:	0f 1f 00             	nopl   (%rax)
  400e30:	b8 00 00 00 00       	mov    $0x0,%eax
  400e35:	48 85 c0             	test   %rax,%rax
  400e38:	74 f1                	je     400e2b <frame_dummy+0xb>
  400e3a:	55                   	push   %rbp
  400e3b:	48 89 e5             	mov    %rsp,%rbp
  400e3e:	ff d0                	callq  *%rax
  400e40:	5d                   	pop    %rbp
  400e41:	e9 7a ff ff ff       	jmpq   400dc0 <register_tm_clones>

0000000000400e46 <main>:
  400e46:	53                   	push   %rbx
  400e47:	83 ff 01             	cmp    $0x1,%edi
  400e4a:	0f 84 9e 00 00 00    	je     400eee <main+0xa8>
  400e50:	48 89 f3             	mov    %rsi,%rbx
  400e53:	83 ff 02             	cmp    $0x2,%edi
  400e56:	0f 85 c2 00 00 00    	jne    400f1e <main+0xd8>
  400e5c:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400e60:	48 8d 35 b3 11 00 00 	lea    0x11b3(%rip),%rsi        # 40201a <array.3073+0x25a>
  400e67:	e8 54 fe ff ff       	callq  400cc0 <fopen@plt>
  400e6c:	48 89 05 0d 27 20 00 	mov    %rax,0x20270d(%rip)        # 603580 <infile>
  400e73:	48 85 c0             	test   %rax,%rax
  400e76:	0f 84 85 00 00 00    	je     400f01 <main+0xbb>
  400e7c:	e8 2d 04 00 00       	callq  4012ae <initialize_bomb>
  400e81:	48 8d 3d 38 0e 00 00 	lea    0xe38(%rip),%rdi        # 401cc0 <_IO_stdin_used+0x60>
  400e88:	e8 03 fd ff ff       	callq  400b90 <puts@plt>
  400e8d:	48 8d 3d 6c 0e 00 00 	lea    0xe6c(%rip),%rdi        # 401d00 <_IO_stdin_used+0xa0>
  400e94:	e8 f7 fc ff ff       	callq  400b90 <puts@plt>
  400e99:	e8 6b 0b 00 00       	callq  401a09 <read_line>
  400e9e:	48 89 c7             	mov    %rax,%rdi
  400ea1:	e8 96 00 00 00       	callq  400f3c <phase_1>
  400ea6:	e8 5f 0c 00 00       	callq  401b0a <phase_defused>
  400eab:	48 8d 3d 7e 0e 00 00 	lea    0xe7e(%rip),%rdi        # 401d30 <_IO_stdin_used+0xd0>
  400eb2:	e8 d9 fc ff ff       	callq  400b90 <puts@plt>
  400eb7:	e8 4d 0b 00 00       	callq  401a09 <read_line>
  400ebc:	48 89 c7             	mov    %rax,%rdi
  400ebf:	e8 98 00 00 00       	callq  400f5c <phase_2>
  400ec4:	e8 41 0c 00 00       	callq  401b0a <phase_defused>
  400ec9:	48 8d 3d cb 0d 00 00 	lea    0xdcb(%rip),%rdi        # 401c9b <_IO_stdin_used+0x3b>
  400ed0:	e8 bb fc ff ff       	callq  400b90 <puts@plt>
  400ed5:	e8 2f 0b 00 00       	callq  401a09 <read_line>
  400eda:	48 89 c7             	mov    %rax,%rdi
  400edd:	e8 b8 00 00 00       	callq  400f9a <phase_3>
  400ee2:	e8 23 0c 00 00       	callq  401b0a <phase_defused>
  400ee7:	b8 00 00 00 00       	mov    $0x0,%eax
  400eec:	5b                   	pop    %rbx
  400eed:	c3                   	retq   
  400eee:	48 8b 05 7b 26 20 00 	mov    0x20267b(%rip),%rax        # 603570 <stdin@@GLIBC_2.2.5>
  400ef5:	48 89 05 84 26 20 00 	mov    %rax,0x202684(%rip)        # 603580 <infile>
  400efc:	e9 7b ff ff ff       	jmpq   400e7c <main+0x36>
  400f01:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400f05:	48 8b 33             	mov    (%rbx),%rsi
  400f08:	48 8d 3d 55 0d 00 00 	lea    0xd55(%rip),%rdi        # 401c64 <_IO_stdin_used+0x4>
  400f0f:	e8 bc fc ff ff       	callq  400bd0 <printf@plt>
  400f14:	bf 08 00 00 00       	mov    $0x8,%edi
  400f19:	e8 d2 fd ff ff       	callq  400cf0 <exit@plt>
  400f1e:	48 8b 36             	mov    (%rsi),%rsi
  400f21:	48 8d 3d 59 0d 00 00 	lea    0xd59(%rip),%rdi        # 401c81 <_IO_stdin_used+0x21>
  400f28:	b8 00 00 00 00       	mov    $0x0,%eax
  400f2d:	e8 9e fc ff ff       	callq  400bd0 <printf@plt>
  400f32:	bf 08 00 00 00       	mov    $0x8,%edi
  400f37:	e8 b4 fd ff ff       	callq  400cf0 <exit@plt>

0000000000400f3c <phase_1>:
  400f3c:	48 83 ec 08          	sub    $0x8,%rsp
  400f40:	48 8d 35 19 0e 00 00 	lea    0xe19(%rip),%rsi        # 401d60 <_IO_stdin_used+0x100>
  400f47:	e8 30 02 00 00       	callq  40117c <strings_not_equal>
  400f4c:	85 c0                	test   %eax,%eax
  400f4e:	75 05                	jne    400f55 <phase_1+0x19>
  400f50:	48 83 c4 08          	add    $0x8,%rsp
  400f54:	c3                   	retq   
  400f55:	e8 32 0a 00 00       	callq  40198c <explode_bomb>
  400f5a:	eb f4                	jmp    400f50 <phase_1+0x14>

0000000000400f5c <phase_2>:
  400f5c:	55                   	push   %rbp
  400f5d:	53                   	push   %rbx
  400f5e:	48 83 ec 28          	sub    $0x28,%rsp
  400f62:	48 89 e3             	mov    %rsp,%rbx
  400f65:	48 89 e6             	mov    %rsp,%rsi
  400f68:	e8 5b 0a 00 00       	callq  4019c8 <read_six_numbers>
  400f6d:	bd 01 00 00 00       	mov    $0x1,%ebp
  400f72:	eb 0c                	jmp    ~400f80 <phase_2+0x24>

  *400f74:	83 c5 01            add    $0x1,%ebp
  400f77:	48 83 c3 04          	add    $0x4,%rbx
  400f7b:	83 fd 06             	cmp    $0x6,%ebp
  400f7e:	74 13                	je     400f93 <phase_2+0x37>
  ~400f80:	8b 03               mov    (%rbx),%eax
  400f82:	83 c0 04             	add    $0x4,%eax
  400f85:	29 e8                	sub    %ebp,%eax
  400f87:	39 43 04             	cmp    %eax,0x4(%rbx)
  400f8a:	74 e8                	je     *400f74 <phase_2+0x18>
  400f8c:	e8 fb 09 00 00       	callq  40198c <explode_bomb>
  400f91:	eb e1                	jmp    400f74 <phase_2+0x18>
  400f93:	48 83 c4 28          	add    $0x28,%rsp
  400f97:	5b                   	pop    %rbx
  400f98:	5d                   	pop    %rbp
  400f99:	c3                   	retq   

0000000000400f9a <phase_3>:
  400f9a:	48 83 ec 18          	sub    $0x18,%rsp
  400f9e:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  400fa3:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  400fa8:	48 8d 35 77 11 00 00 	lea    0x1177(%rip),%rsi        # 402126 <array.3073+0x366>
  400faf:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb4:	e8 d7 fc ff ff       	callq  400c90 <__isoc99_sscanf@plt>
  400fb9:	83 f8 01             	cmp    $0x1,%eax
  400fbc:	7e 1f                	jle    400fdd <phase_3+0x43>
  400fbe:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  400fc3:	0f 87 8b 00 00 00    	ja     401054 <phase_3+0xba>
  400fc9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  400fcd:	48 8d 15 cc 0d 00 00 	lea    0xdcc(%rip),%rdx        # 401da0 <_IO_stdin_used+0x140>
  400fd4:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  400fd8:	48 01 d0             	add    %rdx,%rax
  400fdb:	ff e0                	jmpq   *%rax
  400fdd:	e8 aa 09 00 00       	callq  40198c <explode_bomb>
  400fe2:	eb da                	jmp    400fbe <phase_3+0x24>
  400fe4:	b8 4e 03 00 00       	mov    $0x34e,%eax
  400fe9:	eb 05                	jmp    400ff0 <phase_3+0x56>
  400feb:	b8 00 00 00 00       	mov    $0x0,%eax
  400ff0:	2d d6 01 00 00       	sub    $0x1d6,%eax
  400ff5:	05 f9 02 00 00       	add    $0x2f9,%eax
  400ffa:	2d ff 01 00 00       	sub    $0x1ff,%eax
  400fff:	05 70 02 00 00       	add    $0x270,%eax
  401004:	2d 3b 03 00 00       	sub    $0x33b,%eax
  401009:	05 3b 03 00 00       	add    $0x33b,%eax
  40100e:	2d d4 03 00 00       	sub    $0x3d4,%eax
  401013:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
  401018:	7f 06                	jg     401020 <phase_3+0x86>
  40101a:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  40101e:	74 05                	je     401025 <phase_3+0x8b>
  401020:	e8 67 09 00 00       	callq  40198c <explode_bomb>
  401025:	48 83 c4 18          	add    $0x18,%rsp
  401029:	c3                   	retq   
  40102a:	b8 00 00 00 00       	mov    $0x0,%eax
  40102f:	eb c4                	jmp    400ff5 <phase_3+0x5b>
  401031:	b8 00 00 00 00       	mov    $0x0,%eax
  401036:	eb c2                	jmp    400ffa <phase_3+0x60>
  401038:	b8 00 00 00 00       	mov    $0x0,%eax
  40103d:	eb c0                	jmp    400fff <phase_3+0x65>
  40103f:	b8 00 00 00 00       	mov    $0x0,%eax
  401044:	eb be                	jmp    401004 <phase_3+0x6a>
  401046:	b8 00 00 00 00       	mov    $0x0,%eax
  40104b:	eb bc                	jmp    401009 <phase_3+0x6f>
  40104d:	b8 00 00 00 00       	mov    $0x0,%eax
  401052:	eb ba                	jmp    40100e <phase_3+0x74>
  401054:	e8 33 09 00 00       	callq  40198c <explode_bomb>
  401059:	b8 00 00 00 00       	mov    $0x0,%eax
  40105e:	eb b3                	jmp    401013 <phase_3+0x79>

0000000000401060 <secret_phase>:
  401060:	48 83 ec 18          	sub    $0x18,%rsp
  401064:	e8 a0 09 00 00       	callq  401a09 <read_line>
  401069:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40106e:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401073:	48 8d 35 ac 10 00 00 	lea    0x10ac(%rip),%rsi        # 402126 <array.3073+0x366>
  40107a:	48 89 c7             	mov    %rax,%rdi
  40107d:	b8 00 00 00 00       	mov    $0x0,%eax
  401082:	e8 09 fc ff ff       	callq  400c90 <__isoc99_sscanf@plt>
  401087:	83 f8 01             	cmp    $0x1,%eax
  40108a:	7e 52                	jle    4010de <secret_phase+0x7e>
  40108c:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401090:	83 e0 0f             	and    $0xf,%eax
  401093:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401097:	83 f8 0f             	cmp    $0xf,%eax
  40109a:	74 33                	je     4010cf <secret_phase+0x6f>
  40109c:	b9 00 00 00 00       	mov    $0x0,%ecx
  4010a1:	ba 00 00 00 00       	mov    $0x0,%edx
  4010a6:	48 8d 35 13 0d 00 00 	lea    0xd13(%rip),%rsi        # 401dc0 <array.3073>
  4010ad:	83 c2 01             	add    $0x1,%edx
  4010b0:	48 98                	cltq   
  4010b2:	8b 04 86             	mov    (%rsi,%rax,4),%eax
  4010b5:	01 c1                	add    %eax,%ecx
  4010b7:	83 f8 0f             	cmp    $0xf,%eax
  4010ba:	75 f1                	jne    4010ad <secret_phase+0x4d>
  4010bc:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%rsp)
  4010c3:	00 
  4010c4:	83 fa 09             	cmp    $0x9,%edx
  4010c7:	75 06                	jne    4010cf <secret_phase+0x6f>
  4010c9:	3b 4c 24 08          	cmp    0x8(%rsp),%ecx
  4010cd:	74 05                	je     4010d4 <secret_phase+0x74>
  4010cf:	e8 b8 08 00 00       	callq  40198c <explode_bomb>
  4010d4:	e8 31 0a 00 00       	callq  401b0a <phase_defused>
  4010d9:	48 83 c4 18          	add    $0x18,%rsp
  4010dd:	c3                   	retq   
  4010de:	e8 a9 08 00 00       	callq  40198c <explode_bomb>
  4010e3:	eb a7                	jmp    40108c <secret_phase+0x2c>

00000000004010e5 <sig_handler>:
  4010e5:	48 83 ec 08          	sub    $0x8,%rsp
  4010e9:	48 8d 3d 10 0d 00 00 	lea    0xd10(%rip),%rdi        # 401e00 <array.3073+0x40>
  4010f0:	e8 9b fa ff ff       	callq  400b90 <puts@plt>
  4010f5:	bf 03 00 00 00       	mov    $0x3,%edi
  4010fa:	e8 21 fc ff ff       	callq  400d20 <sleep@plt>
  4010ff:	48 8d 3d 32 0e 00 00 	lea    0xe32(%rip),%rdi        # 401f38 <array.3073+0x178>
  401106:	b8 00 00 00 00       	mov    $0x0,%eax
  40110b:	e8 c0 fa ff ff       	callq  400bd0 <printf@plt>
  401110:	48 8b 3d 49 24 20 00 	mov    0x202449(%rip),%rdi        # 603560 <stdout@@GLIBC_2.2.5>
  401117:	e8 64 fb ff ff       	callq  400c80 <fflush@plt>
  40111c:	bf 01 00 00 00       	mov    $0x1,%edi
  401121:	e8 fa fb ff ff       	callq  400d20 <sleep@plt>
  401126:	48 8d 3d 13 0e 00 00 	lea    0xe13(%rip),%rdi        # 401f40 <array.3073+0x180>
  40112d:	e8 5e fa ff ff       	callq  400b90 <puts@plt>
  401132:	bf 10 00 00 00       	mov    $0x10,%edi
  401137:	e8 b4 fb ff ff       	callq  400cf0 <exit@plt>

000000000040113c <invalid_phase>:
  40113c:	48 83 ec 08          	sub    $0x8,%rsp
  401140:	48 89 fe             	mov    %rdi,%rsi
  401143:	48 8d 3d fe 0d 00 00 	lea    0xdfe(%rip),%rdi        # 401f48 <array.3073+0x188>
  40114a:	b8 00 00 00 00       	mov    $0x0,%eax
  40114f:	e8 7c fa ff ff       	callq  400bd0 <printf@plt>
  401154:	bf 08 00 00 00       	mov    $0x8,%edi
  401159:	e8 92 fb ff ff       	callq  400cf0 <exit@plt>

000000000040115e <string_length>:
  40115e:	80 3f 00             	cmpb   $0x0,(%rdi)
  401161:	74 13                	je     401176 <string_length+0x18>
  401163:	b8 00 00 00 00       	mov    $0x0,%eax
  401168:	48 83 c7 01          	add    $0x1,%rdi
  40116c:	83 c0 01             	add    $0x1,%eax
  40116f:	80 3f 00             	cmpb   $0x0,(%rdi)
  401172:	75 f4                	jne    401168 <string_length+0xa>
  401174:	f3 c3                	repz retq 
  401176:	b8 00 00 00 00       	mov    $0x0,%eax
  40117b:	c3                   	retq   

000000000040117c <strings_not_equal>:
  40117c:	41 54                	push   %r12
  40117e:	55                   	push   %rbp
  40117f:	53                   	push   %rbx
  401180:	48 89 fb             	mov    %rdi,%rbx
  401183:	48 89 f5             	mov    %rsi,%rbp
  401186:	e8 d3 ff ff ff       	callq  40115e <string_length>
  40118b:	41 89 c4             	mov    %eax,%r12d
  40118e:	48 89 ef             	mov    %rbp,%rdi
  401191:	e8 c8 ff ff ff       	callq  40115e <string_length>
  401196:	ba 01 00 00 00       	mov    $0x1,%edx
  40119b:	41 39 c4             	cmp    %eax,%r12d
  40119e:	74 07                	je     4011a7 <strings_not_equal+0x2b>
  4011a0:	89 d0                	mov    %edx,%eax
  4011a2:	5b                   	pop    %rbx
  4011a3:	5d                   	pop    %rbp
  4011a4:	41 5c                	pop    %r12
  4011a6:	c3                   	retq   
  4011a7:	0f b6 03             	movzbl (%rbx),%eax
  4011aa:	84 c0                	test   %al,%al
  4011ac:	74 27                	je     4011d5 <strings_not_equal+0x59>
  4011ae:	3a 45 00             	cmp    0x0(%rbp),%al
  4011b1:	75 29                	jne    4011dc <strings_not_equal+0x60>
  4011b3:	48 83 c3 01          	add    $0x1,%rbx
  4011b7:	48 83 c5 01          	add    $0x1,%rbp
  4011bb:	0f b6 03             	movzbl (%rbx),%eax
  4011be:	84 c0                	test   %al,%al
  4011c0:	74 0c                	je     4011ce <strings_not_equal+0x52>
  4011c2:	3a 45 00             	cmp    0x0(%rbp),%al
  4011c5:	74 ec                	je     4011b3 <strings_not_equal+0x37>
  4011c7:	ba 01 00 00 00       	mov    $0x1,%edx
  4011cc:	eb d2                	jmp    4011a0 <strings_not_equal+0x24>
  4011ce:	ba 00 00 00 00       	mov    $0x0,%edx
  4011d3:	eb cb                	jmp    4011a0 <strings_not_equal+0x24>
  4011d5:	ba 00 00 00 00       	mov    $0x0,%edx
  4011da:	eb c4                	jmp    4011a0 <strings_not_equal+0x24>
  4011dc:	ba 01 00 00 00       	mov    $0x1,%edx
  4011e1:	eb bd                	jmp    4011a0 <strings_not_equal+0x24>

00000000004011e3 <open_clientfd>:
  4011e3:	41 54                	push   %r12
  4011e5:	55                   	push   %rbp
  4011e6:	53                   	push   %rbx
  4011e7:	48 83 ec 10          	sub    $0x10,%rsp
  4011eb:	49 89 fc             	mov    %rdi,%r12
  4011ee:	89 f3                	mov    %esi,%ebx
  4011f0:	ba 00 00 00 00       	mov    $0x0,%edx
  4011f5:	be 01 00 00 00       	mov    $0x1,%esi
  4011fa:	bf 02 00 00 00       	mov    $0x2,%edi
  4011ff:	e8 3c fb ff ff       	callq  400d40 <socket@plt>
  401204:	85 c0                	test   %eax,%eax
  401206:	78 64                	js     40126c <open_clientfd+0x89>
  401208:	89 c5                	mov    %eax,%ebp
  40120a:	4c 89 e7             	mov    %r12,%rdi
  40120d:	e8 3e fa ff ff       	callq  400c50 <gethostbyname@plt>
  401212:	48 85 c0             	test   %rax,%rax
  401215:	74 6b                	je     401282 <open_clientfd+0x9f>
  401217:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  40121e:	00 
  40121f:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401226:	00 00 
  401228:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  40122e:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401232:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  401237:	48 8b 40 18          	mov    0x18(%rax),%rax
  40123b:	48 8b 38             	mov    (%rax),%rdi
  40123e:	e8 5d fa ff ff       	callq  400ca0 <bcopy@plt>
  401243:	89 de                	mov    %ebx,%esi
  401245:	66 c1 ce 08          	ror    $0x8,%si
  401249:	66 89 74 24 02       	mov    %si,0x2(%rsp)
  40124e:	ba 10 00 00 00       	mov    $0x10,%edx
  401253:	48 89 e6             	mov    %rsp,%rsi
  401256:	89 ef                	mov    %ebp,%edi
  401258:	e8 a3 fa ff ff       	callq  400d00 <connect@plt>
  40125d:	85 c0                	test   %eax,%eax
  40125f:	78 37                	js     401298 <open_clientfd+0xb5>
  401261:	89 e8                	mov    %ebp,%eax
  401263:	48 83 c4 10          	add    $0x10,%rsp
  401267:	5b                   	pop    %rbx
  401268:	5d                   	pop    %rbp
  401269:	41 5c                	pop    %r12
  40126b:	c3                   	retq   
  40126c:	48 8d 3d e6 0c 00 00 	lea    0xce6(%rip),%rdi        # 401f59 <array.3073+0x199>
  401273:	e8 18 f9 ff ff       	callq  400b90 <puts@plt>
  401278:	bf 08 00 00 00       	mov    $0x8,%edi
  40127d:	e8 6e fa ff ff       	callq  400cf0 <exit@plt>
  401282:	48 8d 3d de 0c 00 00 	lea    0xcde(%rip),%rdi        # 401f67 <array.3073+0x1a7>
  401289:	e8 02 f9 ff ff       	callq  400b90 <puts@plt>
  40128e:	bf 08 00 00 00       	mov    $0x8,%edi
  401293:	e8 58 fa ff ff       	callq  400cf0 <exit@plt>
  401298:	48 8d 3d d6 0c 00 00 	lea    0xcd6(%rip),%rdi        # 401f75 <array.3073+0x1b5>
  40129f:	e8 ec f8 ff ff       	callq  400b90 <puts@plt>
  4012a4:	bf 08 00 00 00       	mov    $0x8,%edi
  4012a9:	e8 42 fa ff ff       	callq  400cf0 <exit@plt>

00000000004012ae <initialize_bomb>:
  4012ae:	48 83 ec 08          	sub    $0x8,%rsp
  4012b2:	48 8d 35 2c fe ff ff 	lea    -0x1d4(%rip),%rsi        # 4010e5 <sig_handler>
  4012b9:	bf 02 00 00 00       	mov    $0x2,%edi
  4012be:	e8 7d f9 ff ff       	callq  400c40 <signal@plt>
  4012c3:	be 50 00 00 00       	mov    $0x50,%esi
  4012c8:	48 8d 3d b4 0c 00 00 	lea    0xcb4(%rip),%rdi        # 401f83 <array.3073+0x1c3>
  4012cf:	e8 0f ff ff ff       	callq  4011e3 <open_clientfd>
  4012d4:	89 c7                	mov    %eax,%edi
  4012d6:	e8 25 f9 ff ff       	callq  400c00 <close@plt>
  4012db:	48 83 c4 08          	add    $0x8,%rsp
  4012df:	c3                   	retq   

00000000004012e0 <blank_line>:
  4012e0:	55                   	push   %rbp
  4012e1:	53                   	push   %rbx
  4012e2:	48 83 ec 08          	sub    $0x8,%rsp
  4012e6:	48 89 fd             	mov    %rdi,%rbp
  4012e9:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  4012ed:	84 db                	test   %bl,%bl
  4012ef:	74 1e                	je     40130f <blank_line+0x2f>
  4012f1:	e8 3a fa ff ff       	callq  400d30 <__ctype_b_loc@plt>
  4012f6:	48 83 c5 01          	add    $0x1,%rbp
  4012fa:	48 0f be db          	movsbq %bl,%rbx
  4012fe:	48 8b 00             	mov    (%rax),%rax
  401301:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  401306:	75 e1                	jne    4012e9 <blank_line+0x9>
  401308:	b8 00 00 00 00       	mov    $0x0,%eax
  40130d:	eb 05                	jmp    401314 <blank_line+0x34>
  40130f:	b8 01 00 00 00       	mov    $0x1,%eax
  401314:	48 83 c4 08          	add    $0x8,%rsp
  401318:	5b                   	pop    %rbx
  401319:	5d                   	pop    %rbp
  40131a:	c3                   	retq   

000000000040131b <skip>:
  40131b:	55                   	push   %rbp
  40131c:	53                   	push   %rbx
  40131d:	48 83 ec 08          	sub    $0x8,%rsp
  401321:	48 8d 2d 78 22 20 00 	lea    0x202278(%rip),%rbp        # 6035a0 <input_strings>
  401328:	48 63 05 4d 22 20 00 	movslq 0x20224d(%rip),%rax        # 60357c <num_input_strings>
  40132f:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  401333:	48 c1 e7 04          	shl    $0x4,%rdi
  401337:	48 01 ef             	add    %rbp,%rdi
  40133a:	48 8b 15 3f 22 20 00 	mov    0x20223f(%rip),%rdx        # 603580 <infile>
  401341:	be 50 00 00 00       	mov    $0x50,%esi
  401346:	e8 d5 f8 ff ff       	callq  400c20 <fgets@plt>
  40134b:	48 89 c3             	mov    %rax,%rbx
  40134e:	48 85 c0             	test   %rax,%rax
  401351:	74 0c                	je     40135f <skip+0x44>
  401353:	48 89 c7             	mov    %rax,%rdi
  401356:	e8 85 ff ff ff       	callq  4012e0 <blank_line>
  40135b:	85 c0                	test   %eax,%eax
  40135d:	75 c9                	jne    401328 <skip+0xd>
  40135f:	48 89 d8             	mov    %rbx,%rax
  401362:	48 83 c4 08          	add    $0x8,%rsp
  401366:	5b                   	pop    %rbx
  401367:	5d                   	pop    %rbp
  401368:	c3                   	retq   

0000000000401369 <writen>:
  401369:	41 56                	push   %r14
  40136b:	41 55                	push   %r13
  40136d:	41 54                	push   %r12
  40136f:	55                   	push   %rbp
  401370:	53                   	push   %rbx
  401371:	49 89 d5             	mov    %rdx,%r13
  401374:	48 85 d2             	test   %rdx,%rdx
  401377:	74 3b                	je     4013b4 <writen+0x4b>
  401379:	41 89 fc             	mov    %edi,%r12d
  40137c:	48 89 f5             	mov    %rsi,%rbp
  40137f:	48 89 d3             	mov    %rdx,%rbx
  401382:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401388:	eb 08                	jmp    401392 <writen+0x29>
  40138a:	48 01 c5             	add    %rax,%rbp
  40138d:	48 29 c3             	sub    %rax,%rbx
  401390:	74 22                	je     4013b4 <writen+0x4b>
  401392:	48 89 da             	mov    %rbx,%rdx
  401395:	48 89 ee             	mov    %rbp,%rsi
  401398:	44 89 e7             	mov    %r12d,%edi
  40139b:	e8 00 f8 ff ff       	callq  400ba0 <write@plt>
  4013a0:	48 85 c0             	test   %rax,%rax
  4013a3:	7f e5                	jg     40138a <writen+0x21>
  4013a5:	e8 c6 f7 ff ff       	callq  400b70 <__errno_location@plt>
  4013aa:	83 38 04             	cmpl   $0x4,(%rax)
  4013ad:	75 11                	jne    4013c0 <writen+0x57>
  4013af:	4c 89 f0             	mov    %r14,%rax
  4013b2:	eb d6                	jmp    40138a <writen+0x21>
  4013b4:	4c 89 e8             	mov    %r13,%rax
  4013b7:	5b                   	pop    %rbx
  4013b8:	5d                   	pop    %rbp
  4013b9:	41 5c                	pop    %r12
  4013bb:	41 5d                	pop    %r13
  4013bd:	41 5e                	pop    %r14
  4013bf:	c3                   	retq   
  4013c0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4013c7:	eb ee                	jmp    4013b7 <writen+0x4e>

00000000004013c9 <send_msg>:
  4013c9:	41 57                	push   %r15
  4013cb:	41 56                	push   %r14
  4013cd:	41 55                	push   %r13
  4013cf:	41 54                	push   %r12
  4013d1:	55                   	push   %rbp
  4013d2:	53                   	push   %rbx
  4013d3:	48 81 ec 68 24 00 00 	sub    $0x2468,%rsp
  4013da:	41 89 fc             	mov    %edi,%r12d
  4013dd:	ba 00 00 00 00       	mov    $0x0,%edx
  4013e2:	be 01 00 00 00       	mov    $0x1,%esi
  4013e7:	bf 02 00 00 00       	mov    $0x2,%edi
  4013ec:	e8 4f f9 ff ff       	callq  400d40 <socket@plt>
  4013f1:	41 89 c7             	mov    %eax,%r15d
  4013f4:	85 c0                	test   %eax,%eax
  4013f6:	0f 88 2a 02 00 00    	js     401626 <send_msg+0x25d>
  4013fc:	48 c7 84 24 50 24 00 	movq   $0x0,0x2450(%rsp)
  401403:	00 00 00 00 00 
  401408:	48 c7 84 24 58 24 00 	movq   $0x0,0x2458(%rsp)
  40140f:	00 00 00 00 00 
  401414:	66 c7 84 24 50 24 00 	movw   $0x2,0x2450(%rsp)
  40141b:	00 02 00 
  40141e:	66 c7 84 24 52 24 00 	movw   $0x62cc,0x2452(%rsp)
  401425:	00 cc 62 
  401428:	48 8d 94 24 54 24 00 	lea    0x2454(%rsp),%rdx
  40142f:	00 
  401430:	48 8d 35 4c 0b 00 00 	lea    0xb4c(%rip),%rsi        # 401f83 <array.3073+0x1c3>
  401437:	bf 02 00 00 00       	mov    $0x2,%edi
  40143c:	b8 00 00 00 00       	mov    $0x0,%eax
  401441:	e8 2a f8 ff ff       	callq  400c70 <inet_pton@plt>
  401446:	85 c0                	test   %eax,%eax
  401448:	0f 88 09 02 00 00    	js     401657 <send_msg+0x28e>
  40144e:	48 8d b4 24 50 24 00 	lea    0x2450(%rsp),%rsi
  401455:	00 
  401456:	ba 10 00 00 00       	mov    $0x10,%edx
  40145b:	44 89 ff             	mov    %r15d,%edi
  40145e:	e8 9d f8 ff ff       	callq  400d00 <connect@plt>
  401463:	85 c0                	test   %eax,%eax
  401465:	0f 88 22 02 00 00    	js     40168d <send_msg+0x2c4>
  40146b:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  401470:	48 b8 53 75 62 6a 65 	movabs $0x3a7463656a627553,%rax
  401477:	63 74 3a 
  40147a:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
  40147f:	48 b8 20 42 6f 6d 62 	movabs $0x6f6e20626d6f4220,%rax
  401486:	20 6e 6f 
  401489:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  40148e:	48 b8 74 69 66 69 63 	movabs $0x6974616369666974,%rax
  401495:	61 74 69 
  401498:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  40149d:	c7 44 24 68 6f 6e 0a 	movl   $0xa6e6f,0x68(%rsp)
  4014a4:	00 
  4014a5:	48 8d 9c 24 50 04 00 	lea    0x450(%rsp),%rbx
  4014ac:	00 
  4014ad:	48 89 ee             	mov    %rbp,%rsi
  4014b0:	48 89 df             	mov    %rbx,%rdi
  4014b3:	e8 18 f8 ff ff       	callq  400cd0 <strcat@plt>
  4014b8:	66 c7 44 24 50 0a 00 	movw   $0xa,0x50(%rsp)
  4014bf:	48 89 ee             	mov    %rbp,%rsi
  4014c2:	48 89 df             	mov    %rbx,%rdi
  4014c5:	e8 06 f8 ff ff       	callq  400cd0 <strcat@plt>
  4014ca:	bf 00 00 00 00       	mov    $0x0,%edi
  4014cf:	e8 dc f7 ff ff       	callq  400cb0 <cuserid@plt>
  4014d4:	48 85 c0             	test   %rax,%rax
  4014d7:	0f 84 e6 01 00 00    	je     4016c3 <send_msg+0x2fa>
  4014dd:	48 89 e7             	mov    %rsp,%rdi
  4014e0:	48 89 c6             	mov    %rax,%rsi
  4014e3:	e8 98 f6 ff ff       	callq  400b80 <strcpy@plt>
  4014e8:	45 85 e4             	test   %r12d,%r12d
  4014eb:	48 8d 05 a7 0a 00 00 	lea    0xaa7(%rip),%rax        # 401f99 <array.3073+0x1d9>
  4014f2:	4c 8d 0d 98 0a 00 00 	lea    0xa98(%rip),%r9        # 401f91 <array.3073+0x1d1>
  4014f9:	4c 0f 44 c8          	cmove  %rax,%r9
  4014fd:	48 8d 5c 24 50       	lea    0x50(%rsp),%rbx
  401502:	48 83 ec 08          	sub    $0x8,%rsp
  401506:	8b 05 70 20 20 00    	mov    0x202070(%rip),%eax        # 60357c <num_input_strings>
  40150c:	50                   	push   %rax
  40150d:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  401512:	8b 0d 28 20 20 00    	mov    0x202028(%rip),%ecx        # 603540 <bomb_id>
  401518:	48 8d 15 21 1c 20 00 	lea    0x201c21(%rip),%rdx        # 603140 <lab_id>
  40151f:	48 8d 35 97 0a 00 00 	lea    0xa97(%rip),%rsi        # 401fbd <array.3073+0x1fd>
  401526:	48 89 df             	mov    %rbx,%rdi
  401529:	b8 00 00 00 00       	mov    $0x0,%eax
  40152e:	e8 ad f7 ff ff       	callq  400ce0 <sprintf@plt>
  401533:	48 8d bc 24 60 04 00 	lea    0x460(%rsp),%rdi
  40153a:	00 
  40153b:	48 89 de             	mov    %rbx,%rsi
  40153e:	e8 8d f7 ff ff       	callq  400cd0 <strcat@plt>
  401543:	48 83 c4 10          	add    $0x10,%rsp
  401547:	83 3d 2e 20 20 00 00 	cmpl   $0x0,0x20202e(%rip)        # 60357c <num_input_strings>
  40154e:	7e 70                	jle    4015c0 <send_msg+0x1f7>
  401550:	bb 00 00 00 00       	mov    $0x0,%ebx
  401555:	4c 8d 35 44 20 20 00 	lea    0x202044(%rip),%r14        # 6035a0 <input_strings>
  40155c:	49 89 e5             	mov    %rsp,%r13
  40155f:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  401564:	4c 8d a4 24 50 04 00 	lea    0x450(%rsp),%r12
  40156b:	00 
  40156c:	48 63 c3             	movslq %ebx,%rax
  40156f:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401573:	48 c1 e0 04          	shl    $0x4,%rax
  401577:	4c 01 f0             	add    %r14,%rax
  40157a:	83 c3 01             	add    $0x1,%ebx
  40157d:	48 83 ec 08          	sub    $0x8,%rsp
  401581:	50                   	push   %rax
  401582:	41 89 d9             	mov    %ebx,%r9d
  401585:	4d 89 e8             	mov    %r13,%r8
  401588:	8b 0d b2 1f 20 00    	mov    0x201fb2(%rip),%ecx        # 603540 <bomb_id>
  40158e:	48 8d 15 ab 1b 20 00 	lea    0x201bab(%rip),%rdx        # 603140 <lab_id>
  401595:	48 8d 35 3d 0a 00 00 	lea    0xa3d(%rip),%rsi        # 401fd9 <array.3073+0x219>
  40159c:	48 89 ef             	mov    %rbp,%rdi
  40159f:	b8 00 00 00 00       	mov    $0x0,%eax
  4015a4:	e8 37 f7 ff ff       	callq  400ce0 <sprintf@plt>
  4015a9:	48 89 ee             	mov    %rbp,%rsi
  4015ac:	4c 89 e7             	mov    %r12,%rdi
  4015af:	e8 1c f7 ff ff       	callq  400cd0 <strcat@plt>
  4015b4:	48 83 c4 10          	add    $0x10,%rsp
  4015b8:	39 1d be 1f 20 00    	cmp    %ebx,0x201fbe(%rip)        # 60357c <num_input_strings>
  4015be:	7f ac                	jg     40156c <send_msg+0x1a3>
  4015c0:	48 8d ac 24 50 04 00 	lea    0x450(%rsp),%rbp
  4015c7:	00 
  4015c8:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
  4015cf:	bb 00 00 00 00       	mov    $0x0,%ebx
  4015d4:	4c 89 e1             	mov    %r12,%rcx
  4015d7:	48 89 ef             	mov    %rbp,%rdi
  4015da:	89 d8                	mov    %ebx,%eax
  4015dc:	f2 ae                	repnz scas %es:(%rdi),%al
  4015de:	48 f7 d1             	not    %rcx
  4015e1:	4a 8d 14 21          	lea    (%rcx,%r12,1),%rdx
  4015e5:	48 89 ee             	mov    %rbp,%rsi
  4015e8:	44 89 ff             	mov    %r15d,%edi
  4015eb:	e8 79 fd ff ff       	callq  401369 <writen>
  4015f0:	48 89 c2             	mov    %rax,%rdx
  4015f3:	4c 89 e1             	mov    %r12,%rcx
  4015f6:	48 89 ef             	mov    %rbp,%rdi
  4015f9:	89 d8                	mov    %ebx,%eax
  4015fb:	f2 ae                	repnz scas %es:(%rdi),%al
  4015fd:	48 f7 d1             	not    %rcx
  401600:	4c 01 e1             	add    %r12,%rcx
  401603:	48 39 ca             	cmp    %rcx,%rdx
  401606:	0f 82 cf 00 00 00    	jb     4016db <send_msg+0x312>
  40160c:	44 89 ff             	mov    %r15d,%edi
  40160f:	e8 ec f5 ff ff       	callq  400c00 <close@plt>
  401614:	48 81 c4 68 24 00 00 	add    $0x2468,%rsp
  40161b:	5b                   	pop    %rbx
  40161c:	5d                   	pop    %rbp
  40161d:	41 5c                	pop    %r12
  40161f:	41 5d                	pop    %r13
  401621:	41 5e                	pop    %r14
  401623:	41 5f                	pop    %r15
  401625:	c3                   	retq   
  401626:	48 8d 15 75 09 00 00 	lea    0x975(%rip),%rdx        # 401fa2 <array.3073+0x1e2>
  40162d:	48 8d 35 49 06 00 00 	lea    0x649(%rip),%rsi        # 401c7d <_IO_stdin_used+0x1d>
  401634:	48 8b 3d 25 1f 20 00 	mov    0x201f25(%rip),%rdi        # 603560 <stdout@@GLIBC_2.2.5>
  40163b:	b8 00 00 00 00       	mov    $0x0,%eax
  401640:	e8 1b f6 ff ff       	callq  400c60 <fprintf@plt>
  401645:	44 89 ff             	mov    %r15d,%edi
  401648:	e8 b3 f5 ff ff       	callq  400c00 <close@plt>
  40164d:	bf 01 00 00 00       	mov    $0x1,%edi
  401652:	e8 99 f6 ff ff       	callq  400cf0 <exit@plt>
  401657:	48 8d 15 b8 09 00 00 	lea    0x9b8(%rip),%rdx        # 402016 <array.3073+0x256>
  40165e:	48 8d 35 18 06 00 00 	lea    0x618(%rip),%rsi        # 401c7d <_IO_stdin_used+0x1d>
  401665:	48 8b 3d f4 1e 20 00 	mov    0x201ef4(%rip),%rdi        # 603560 <stdout@@GLIBC_2.2.5>
  40166c:	b8 00 00 00 00       	mov    $0x0,%eax
  401671:	e8 ea f5 ff ff       	callq  400c60 <fprintf@plt>
  401676:	45 85 ff             	test   %r15d,%r15d
  401679:	74 08                	je     401683 <send_msg+0x2ba>
  40167b:	44 89 ff             	mov    %r15d,%edi
  40167e:	e8 7d f5 ff ff       	callq  400c00 <close@plt>
  401683:	bf 01 00 00 00       	mov    $0x1,%edi
  401688:	e8 63 f6 ff ff       	callq  400cf0 <exit@plt>
  40168d:	48 8d 15 1b 09 00 00 	lea    0x91b(%rip),%rdx        # 401faf <array.3073+0x1ef>
  401694:	48 8d 35 e2 05 00 00 	lea    0x5e2(%rip),%rsi        # 401c7d <_IO_stdin_used+0x1d>
  40169b:	48 8b 3d be 1e 20 00 	mov    0x201ebe(%rip),%rdi        # 603560 <stdout@@GLIBC_2.2.5>
  4016a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4016a7:	e8 b4 f5 ff ff       	callq  400c60 <fprintf@plt>
  4016ac:	45 85 ff             	test   %r15d,%r15d
  4016af:	74 08                	je     4016b9 <send_msg+0x2f0>
  4016b1:	44 89 ff             	mov    %r15d,%edi
  4016b4:	e8 47 f5 ff ff       	callq  400c00 <close@plt>
  4016b9:	bf 01 00 00 00       	mov    $0x1,%edi
  4016be:	e8 2d f6 ff ff       	callq  400cf0 <exit@plt>
  4016c3:	c7 04 24 6e 6f 62 6f 	movl   $0x6f626f6e,(%rsp)
  4016ca:	66 c7 44 24 04 64 79 	movw   $0x7964,0x4(%rsp)
  4016d1:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  4016d6:	e9 0d fe ff ff       	jmpq   4014e8 <send_msg+0x11f>
  4016db:	48 8d 15 13 09 00 00 	lea    0x913(%rip),%rdx        # 401ff5 <array.3073+0x235>
  4016e2:	48 8d 35 94 05 00 00 	lea    0x594(%rip),%rsi        # 401c7d <_IO_stdin_used+0x1d>
  4016e9:	48 8b 3d 70 1e 20 00 	mov    0x201e70(%rip),%rdi        # 603560 <stdout@@GLIBC_2.2.5>
  4016f0:	e8 6b f5 ff ff       	callq  400c60 <fprintf@plt>
  4016f5:	45 85 ff             	test   %r15d,%r15d
  4016f8:	74 08                	je     401702 <send_msg+0x339>
  4016fa:	44 89 ff             	mov    %r15d,%edi
  4016fd:	e8 fe f4 ff ff       	callq  400c00 <close@plt>
  401702:	bf 01 00 00 00       	mov    $0x1,%edi
  401707:	e8 e4 f5 ff ff       	callq  400cf0 <exit@plt>

000000000040170c <send_msg_2>:
  40170c:	41 57                	push   %r15
  40170e:	41 56                	push   %r14
  401710:	41 55                	push   %r13
  401712:	41 54                	push   %r12
  401714:	55                   	push   %rbp
  401715:	53                   	push   %rbx
  401716:	48 83 ec 68          	sub    $0x68,%rsp
  40171a:	89 fb                	mov    %edi,%ebx
  40171c:	bf 00 00 00 00       	mov    $0x0,%edi
  401721:	e8 ca f4 ff ff       	callq  400bf0 <dup@plt>
  401726:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40172a:	83 f8 ff             	cmp    $0xffffffff,%eax
  40172d:	0f 84 a6 01 00 00    	je     4018d9 <send_msg_2+0x1cd>
  401733:	bf 00 00 00 00       	mov    $0x0,%edi
  401738:	e8 c3 f4 ff ff       	callq  400c00 <close@plt>
  40173d:	83 f8 ff             	cmp    $0xffffffff,%eax
  401740:	0f 84 a9 01 00 00    	je     4018ef <send_msg_2+0x1e3>
  401746:	e8 e5 f4 ff ff       	callq  400c30 <tmpfile@plt>
  40174b:	48 89 c5             	mov    %rax,%rbp
  40174e:	48 85 c0             	test   %rax,%rax
  401751:	0f 84 ae 01 00 00    	je     401905 <send_msg_2+0x1f9>
  401757:	48 89 c1             	mov    %rax,%rcx
  40175a:	ba 1b 00 00 00       	mov    $0x1b,%edx
  40175f:	be 01 00 00 00       	mov    $0x1,%esi
  401764:	48 8d 3d d9 08 00 00 	lea    0x8d9(%rip),%rdi        # 402044 <array.3073+0x284>
  40176b:	e8 a0 f5 ff ff       	callq  400d10 <fwrite@plt>
  401770:	48 89 ee             	mov    %rbp,%rsi
  401773:	bf 0a 00 00 00       	mov    $0xa,%edi
  401778:	e8 93 f4 ff ff       	callq  400c10 <fputc@plt>
  40177d:	bf 00 00 00 00       	mov    $0x0,%edi
  401782:	e8 29 f5 ff ff       	callq  400cb0 <cuserid@plt>
  401787:	48 85 c0             	test   %rax,%rax
  40178a:	0f 84 8b 01 00 00    	je     40191b <send_msg_2+0x20f>
  401790:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401795:	48 89 c6             	mov    %rax,%rsi
  401798:	e8 e3 f3 ff ff       	callq  400b80 <strcpy@plt>
  40179d:	85 db                	test   %ebx,%ebx
  40179f:	48 8d 05 f3 07 00 00 	lea    0x7f3(%rip),%rax        # 401f99 <array.3073+0x1d9>
  4017a6:	4c 8d 0d e4 07 00 00 	lea    0x7e4(%rip),%r9        # 401f91 <array.3073+0x1d1>
  4017ad:	4c 0f 44 c8          	cmove  %rax,%r9
  4017b1:	48 83 ec 08          	sub    $0x8,%rsp
  4017b5:	8b 05 c1 1d 20 00    	mov    0x201dc1(%rip),%eax        # 60357c <num_input_strings>
  4017bb:	50                   	push   %rax
  4017bc:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  4017c1:	8b 0d 79 1d 20 00    	mov    0x201d79(%rip),%ecx        # 603540 <bomb_id>
  4017c7:	48 8d 15 72 19 20 00 	lea    0x201972(%rip),%rdx        # 603140 <lab_id>
  4017ce:	48 8d 35 e8 07 00 00 	lea    0x7e8(%rip),%rsi        # 401fbd <array.3073+0x1fd>
  4017d5:	48 89 ef             	mov    %rbp,%rdi
  4017d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4017dd:	e8 7e f4 ff ff       	callq  400c60 <fprintf@plt>
  4017e2:	48 83 c4 10          	add    $0x10,%rsp
  4017e6:	83 3d 8f 1d 20 00 00 	cmpl   $0x0,0x201d8f(%rip)        # 60357c <num_input_strings>
  4017ed:	7e 60                	jle    40184f <send_msg_2+0x143>
  4017ef:	bb 00 00 00 00       	mov    $0x0,%ebx
  4017f4:	4c 8d 3d a5 1d 20 00 	lea    0x201da5(%rip),%r15        # 6035a0 <input_strings>
  4017fb:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
  401800:	4c 8d 2d 39 19 20 00 	lea    0x201939(%rip),%r13        # 603140 <lab_id>
  401807:	4c 8d 25 cb 07 00 00 	lea    0x7cb(%rip),%r12        # 401fd9 <array.3073+0x219>
  40180e:	48 63 c3             	movslq %ebx,%rax
  401811:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401815:	48 c1 e0 04          	shl    $0x4,%rax
  401819:	4c 01 f8             	add    %r15,%rax
  40181c:	83 c3 01             	add    $0x1,%ebx
  40181f:	48 83 ec 08          	sub    $0x8,%rsp
  401823:	50                   	push   %rax
  401824:	41 89 d9             	mov    %ebx,%r9d
  401827:	4d 89 f0             	mov    %r14,%r8
  40182a:	8b 0d 10 1d 20 00    	mov    0x201d10(%rip),%ecx        # 603540 <bomb_id>
  401830:	4c 89 ea             	mov    %r13,%rdx
  401833:	4c 89 e6             	mov    %r12,%rsi
  401836:	48 89 ef             	mov    %rbp,%rdi
  401839:	b8 00 00 00 00       	mov    $0x0,%eax
  40183e:	e8 1d f4 ff ff       	callq  400c60 <fprintf@plt>
  401843:	48 83 c4 10          	add    $0x10,%rsp
  401847:	39 1d 2f 1d 20 00    	cmp    %ebx,0x201d2f(%rip)        # 60357c <num_input_strings>
  40184d:	7f bf                	jg     40180e <send_msg_2+0x102>
  40184f:	48 89 ef             	mov    %rbp,%rdi
  401852:	e8 89 f3 ff ff       	callq  400be0 <rewind@plt>
  401857:	4c 8d 05 02 08 00 00 	lea    0x802(%rip),%r8        # 402060 <array.3073+0x2a0>
  40185e:	48 8d 0d 05 08 00 00 	lea    0x805(%rip),%rcx        # 40206a <array.3073+0x2aa>
  401865:	48 8d 15 09 08 00 00 	lea    0x809(%rip),%rdx        # 402075 <array.3073+0x2b5>
  40186c:	48 8d 35 19 08 00 00 	lea    0x819(%rip),%rsi        # 40208c <array.3073+0x2cc>
  401873:	48 8d 3d 66 23 20 00 	lea    0x202366(%rip),%rdi        # 603be0 <scratch>
  40187a:	b8 00 00 00 00       	mov    $0x0,%eax
  40187f:	e8 5c f4 ff ff       	callq  400ce0 <sprintf@plt>
  401884:	48 8d 3d 55 23 20 00 	lea    0x202355(%rip),%rdi        # 603be0 <scratch>
  40188b:	e8 30 f3 ff ff       	callq  400bc0 <system@plt>
  401890:	85 c0                	test   %eax,%eax
  401892:	0f 85 9c 00 00 00    	jne    401934 <send_msg_2+0x228>
  401898:	48 89 ef             	mov    %rbp,%rdi
  40189b:	e8 10 f3 ff ff       	callq  400bb0 <fclose@plt>
  4018a0:	85 c0                	test   %eax,%eax
  4018a2:	0f 85 a2 00 00 00    	jne    40194a <send_msg_2+0x23e>
  4018a8:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  4018ac:	e8 3f f3 ff ff       	callq  400bf0 <dup@plt>
  4018b1:	85 c0                	test   %eax,%eax
  4018b3:	0f 85 a7 00 00 00    	jne    401960 <send_msg_2+0x254>
  4018b9:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  4018bd:	e8 3e f3 ff ff       	callq  400c00 <close@plt>
  4018c2:	85 c0                	test   %eax,%eax
  4018c4:	0f 85 ac 00 00 00    	jne    401976 <send_msg_2+0x26a>
  4018ca:	48 83 c4 68          	add    $0x68,%rsp
  4018ce:	5b                   	pop    %rbx
  4018cf:	5d                   	pop    %rbp
  4018d0:	41 5c                	pop    %r12
  4018d2:	41 5d                	pop    %r13
  4018d4:	41 5e                	pop    %r14
  4018d6:	41 5f                	pop    %r15
  4018d8:	c3                   	retq   
  4018d9:	48 8d 3d 28 07 00 00 	lea    0x728(%rip),%rdi        # 402008 <array.3073+0x248>
  4018e0:	e8 ab f2 ff ff       	callq  400b90 <puts@plt>
  4018e5:	bf 08 00 00 00       	mov    $0x8,%edi
  4018ea:	e8 01 f4 ff ff       	callq  400cf0 <exit@plt>
  4018ef:	48 8d 3d 26 07 00 00 	lea    0x726(%rip),%rdi        # 40201c <array.3073+0x25c>
  4018f6:	e8 95 f2 ff ff       	callq  400b90 <puts@plt>
  4018fb:	bf 08 00 00 00       	mov    $0x8,%edi
  401900:	e8 eb f3 ff ff       	callq  400cf0 <exit@plt>
  401905:	48 8d 3d 23 07 00 00 	lea    0x723(%rip),%rdi        # 40202f <array.3073+0x26f>
  40190c:	e8 7f f2 ff ff       	callq  400b90 <puts@plt>
  401911:	bf 08 00 00 00       	mov    $0x8,%edi
  401916:	e8 d5 f3 ff ff       	callq  400cf0 <exit@plt>
  40191b:	c7 44 24 10 6e 6f 62 	movl   $0x6f626f6e,0x10(%rsp)
  401922:	6f 
  401923:	66 c7 44 24 14 64 79 	movw   $0x7964,0x14(%rsp)
  40192a:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
  40192f:	e9 69 fe ff ff       	jmpq   40179d <send_msg_2+0x91>
  401934:	48 8d 3d 5a 07 00 00 	lea    0x75a(%rip),%rdi        # 402095 <array.3073+0x2d5>
  40193b:	e8 50 f2 ff ff       	callq  400b90 <puts@plt>
  401940:	bf 08 00 00 00       	mov    $0x8,%edi
  401945:	e8 a6 f3 ff ff       	callq  400cf0 <exit@plt>
  40194a:	48 8d 3d 5e 07 00 00 	lea    0x75e(%rip),%rdi        # 4020af <array.3073+0x2ef>
  401951:	e8 3a f2 ff ff       	callq  400b90 <puts@plt>
  401956:	bf 08 00 00 00       	mov    $0x8,%edi
  40195b:	e8 90 f3 ff ff       	callq  400cf0 <exit@plt>
  401960:	48 8d 3d 61 07 00 00 	lea    0x761(%rip),%rdi        # 4020c8 <array.3073+0x308>
  401967:	e8 24 f2 ff ff       	callq  400b90 <puts@plt>
  40196c:	bf 08 00 00 00       	mov    $0x8,%edi
  401971:	e8 7a f3 ff ff       	callq  400cf0 <exit@plt>
  401976:	48 8d 3d 66 07 00 00 	lea    0x766(%rip),%rdi        # 4020e3 <array.3073+0x323>
  40197d:	e8 0e f2 ff ff       	callq  400b90 <puts@plt>
  401982:	bf 08 00 00 00       	mov    $0x8,%edi
  401987:	e8 64 f3 ff ff       	callq  400cf0 <exit@plt>

000000000040198c <explode_bomb>:
  40198c:	48 83 ec 08          	sub    $0x8,%rsp
  401990:	48 8d 3d 63 07 00 00 	lea    0x763(%rip),%rdi        # 4020fa <array.3073+0x33a>
  401997:	e8 f4 f1 ff ff       	callq  400b90 <puts@plt>
  40199c:	48 8d 3d 60 07 00 00 	lea    0x760(%rip),%rdi        # 402103 <array.3073+0x343>
  4019a3:	e8 e8 f1 ff ff       	callq  400b90 <puts@plt>
  4019a8:	bf 00 00 00 00       	mov    $0x0,%edi
  4019ad:	e8 17 fa ff ff       	callq  4013c9 <send_msg>
  4019b2:	48 8d 3d 7f 04 00 00 	lea    0x47f(%rip),%rdi        # 401e38 <array.3073+0x78>
  4019b9:	e8 d2 f1 ff ff       	callq  400b90 <puts@plt>
  4019be:	bf 08 00 00 00       	mov    $0x8,%edi
  4019c3:	e8 28 f3 ff ff       	callq  400cf0 <exit@plt>

00000000004019c8 <read_six_numbers>:
  4019c8:	48 83 ec 08          	sub    $0x8,%rsp
  4019cc:	48 89 f2             	mov    %rsi,%rdx
  4019cf:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  4019d3:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4019d7:	50                   	push   %rax
  4019d8:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4019dc:	50                   	push   %rax
  4019dd:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  4019e1:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  4019e5:	48 8d 35 2e 07 00 00 	lea    0x72e(%rip),%rsi        # 40211a <array.3073+0x35a>
  4019ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4019f1:	e8 9a f2 ff ff       	callq  400c90 <__isoc99_sscanf@plt>
  4019f6:	48 83 c4 10          	add    $0x10,%rsp
  4019fa:	83 f8 05             	cmp    $0x5,%eax
  4019fd:	7e 05                	jle    401a04 <read_six_numbers+0x3c>
  4019ff:	48 83 c4 08          	add    $0x8,%rsp
  401a03:	c3                   	retq   
  401a04:	e8 83 ff ff ff       	callq  40198c <explode_bomb>

0000000000401a09 <read_line>:
  401a09:	48 83 ec 08          	sub    $0x8,%rsp
  401a0d:	b8 00 00 00 00       	mov    $0x0,%eax
  401a12:	e8 04 f9 ff ff       	callq  40131b <skip>
  401a17:	48 85 c0             	test   %rax,%rax
  401a1a:	74 6f                	je     401a8b <read_line+0x82>
  401a1c:	8b 35 5a 1b 20 00    	mov    0x201b5a(%rip),%esi        # 60357c <num_input_strings>
  401a22:	48 63 c6             	movslq %esi,%rax
  401a25:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401a29:	48 c1 e2 04          	shl    $0x4,%rdx
  401a2d:	48 8d 05 6c 1b 20 00 	lea    0x201b6c(%rip),%rax        # 6035a0 <input_strings>
  401a34:	48 01 c2             	add    %rax,%rdx
  401a37:	b8 00 00 00 00       	mov    $0x0,%eax
  401a3c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401a43:	48 89 d7             	mov    %rdx,%rdi
  401a46:	f2 ae                	repnz scas %es:(%rdi),%al
  401a48:	48 f7 d1             	not    %rcx
  401a4b:	48 83 e9 01          	sub    $0x1,%rcx
  401a4f:	83 f9 4f             	cmp    $0x4f,%ecx
  401a52:	0f 84 a1 00 00 00    	je     401af9 <read_line+0xf0>
  401a58:	83 e9 01             	sub    $0x1,%ecx
  401a5b:	48 63 c9             	movslq %ecx,%rcx
  401a5e:	48 63 c6             	movslq %esi,%rax
  401a61:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401a65:	48 c1 e0 04          	shl    $0x4,%rax
  401a69:	48 89 c7             	mov    %rax,%rdi
  401a6c:	48 8d 05 2d 1b 20 00 	lea    0x201b2d(%rip),%rax        # 6035a0 <input_strings>
  401a73:	48 01 f8             	add    %rdi,%rax
  401a76:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
  401a7a:	83 c6 01             	add    $0x1,%esi
  401a7d:	89 35 f9 1a 20 00    	mov    %esi,0x201af9(%rip)        # 60357c <num_input_strings>
  401a83:	48 89 d0             	mov    %rdx,%rax
  401a86:	48 83 c4 08          	add    $0x8,%rsp
  401a8a:	c3                   	retq   
  401a8b:	48 8b 05 de 1a 20 00 	mov    0x201ade(%rip),%rax        # 603570 <stdin@@GLIBC_2.2.5>
  401a92:	48 39 05 e7 1a 20 00 	cmp    %rax,0x201ae7(%rip)        # 603580 <infile>
  401a99:	74 43                	je     401ade <read_line+0xd5>
  401a9b:	48 8d 3d a8 06 00 00 	lea    0x6a8(%rip),%rdi        # 40214a <array.3073+0x38a>
  401aa2:	e8 b9 f0 ff ff       	callq  400b60 <getenv@plt>
  401aa7:	48 85 c0             	test   %rax,%rax
  401aaa:	75 43                	jne    401aef <read_line+0xe6>
  401aac:	48 8b 05 bd 1a 20 00 	mov    0x201abd(%rip),%rax        # 603570 <stdin@@GLIBC_2.2.5>
  401ab3:	48 89 05 c6 1a 20 00 	mov    %rax,0x201ac6(%rip)        # 603580 <infile>
  401aba:	b8 00 00 00 00       	mov    $0x0,%eax
  401abf:	e8 57 f8 ff ff       	callq  40131b <skip>
  401ac4:	48 85 c0             	test   %rax,%rax
  401ac7:	0f 85 4f ff ff ff    	jne    401a1c <read_line+0x13>
  401acd:	48 8d 3d 58 06 00 00 	lea    0x658(%rip),%rdi        # 40212c <array.3073+0x36c>
  401ad4:	e8 b7 f0 ff ff       	callq  400b90 <puts@plt>
  401ad9:	e8 ae fe ff ff       	callq  40198c <explode_bomb>
  401ade:	48 8d 3d 47 06 00 00 	lea    0x647(%rip),%rdi        # 40212c <array.3073+0x36c>
  401ae5:	e8 a6 f0 ff ff       	callq  400b90 <puts@plt>
  401aea:	e8 9d fe ff ff       	callq  40198c <explode_bomb>
  401aef:	bf 00 00 00 00       	mov    $0x0,%edi
  401af4:	e8 f7 f1 ff ff       	callq  400cf0 <exit@plt>
  401af9:	48 8d 3d 55 06 00 00 	lea    0x655(%rip),%rdi        # 402155 <array.3073+0x395>
  401b00:	e8 8b f0 ff ff       	callq  400b90 <puts@plt>
  401b05:	e8 82 fe ff ff       	callq  40198c <explode_bomb>

0000000000401b0a <phase_defused>:
  401b0a:	48 83 ec 78          	sub    $0x78,%rsp
  401b0e:	bf 01 00 00 00       	mov    $0x1,%edi
  401b13:	e8 b1 f8 ff ff       	callq  4013c9 <send_msg>
  401b18:	83 3d 5d 1a 20 00 03 	cmpl   $0x3,0x201a5d(%rip)        # 60357c <num_input_strings>
  401b1f:	74 05                	je     401b26 <phase_defused+0x1c>
  401b21:	48 83 c4 78          	add    $0x78,%rsp
  401b25:	c3                   	retq   
  401b26:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
  401b2b:	48 8d 54 24 1c       	lea    0x1c(%rsp),%rdx
  401b30:	48 83 ec 08          	sub    $0x8,%rsp
  401b34:	48 8d 44 24 28       	lea    0x28(%rsp),%rax
  401b39:	50                   	push   %rax
  401b3a:	48 8d 44 24 18       	lea    0x18(%rsp),%rax
  401b3f:	50                   	push   %rax
  401b40:	48 8d 44 24 24       	lea    0x24(%rsp),%rax
  401b45:	50                   	push   %rax
  401b46:	4c 8d 4c 24 30       	lea    0x30(%rsp),%r9
  401b4b:	4c 8d 44 24 34       	lea    0x34(%rsp),%r8
  401b50:	48 8d 35 19 06 00 00 	lea    0x619(%rip),%rsi        # 402170 <array.3073+0x3b0>
  401b57:	48 8d 3d 92 1a 20 00 	lea    0x201a92(%rip),%rdi        # 6035f0 <input_strings+0x50>
  401b5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401b63:	e8 28 f1 ff ff       	callq  400c90 <__isoc99_sscanf@plt>
  401b68:	48 83 c4 20          	add    $0x20,%rsp
  401b6c:	83 f8 07             	cmp    $0x7,%eax
  401b6f:	74 1a                	je     401b8b <phase_defused+0x81>
  401b71:	48 8d 3d 48 03 00 00 	lea    0x348(%rip),%rdi        # 401ec0 <array.3073+0x100>
  401b78:	e8 13 f0 ff ff       	callq  400b90 <puts@plt>
  401b7d:	48 8d 3d 6c 03 00 00 	lea    0x36c(%rip),%rdi        # 401ef0 <array.3073+0x130>
  401b84:	e8 07 f0 ff ff       	callq  400b90 <puts@plt>
  401b89:	eb 96                	jmp    401b21 <phase_defused+0x17>
  401b8b:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401b90:	48 8d 35 ee 05 00 00 	lea    0x5ee(%rip),%rsi        # 402185 <array.3073+0x3c5>
  401b97:	e8 e0 f5 ff ff       	callq  40117c <strings_not_equal>
  401b9c:	85 c0                	test   %eax,%eax
  401b9e:	75 d1                	jne    401b71 <phase_defused+0x67>
  401ba0:	48 8d 3d b9 02 00 00 	lea    0x2b9(%rip),%rdi        # 401e60 <array.3073+0xa0>
  401ba7:	e8 e4 ef ff ff       	callq  400b90 <puts@plt>
  401bac:	48 8d 3d d5 02 00 00 	lea    0x2d5(%rip),%rdi        # 401e88 <array.3073+0xc8>
  401bb3:	e8 d8 ef ff ff       	callq  400b90 <puts@plt>
  401bb8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbd:	e8 9e f4 ff ff       	callq  401060 <secret_phase>
  401bc2:	eb ad                	jmp    401b71 <phase_defused+0x67>
  401bc4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401bcb:	00 00 00 
  401bce:	66 90                	xchg   %ax,%ax

0000000000401bd0 <__libc_csu_init>:
  401bd0:	41 57                	push   %r15
  401bd2:	41 56                	push   %r14
  401bd4:	41 89 ff             	mov    %edi,%r15d
  401bd7:	41 55                	push   %r13
  401bd9:	41 54                	push   %r12
  401bdb:	4c 8d 25 26 12 20 00 	lea    0x201226(%rip),%r12        # 602e08 <__frame_dummy_init_array_entry>
  401be2:	55                   	push   %rbp
  401be3:	48 8d 2d 26 12 20 00 	lea    0x201226(%rip),%rbp        # 602e10 <__init_array_end>
  401bea:	53                   	push   %rbx
  401beb:	49 89 f6             	mov    %rsi,%r14
  401bee:	49 89 d5             	mov    %rdx,%r13
  401bf1:	4c 29 e5             	sub    %r12,%rbp
  401bf4:	48 83 ec 08          	sub    $0x8,%rsp
  401bf8:	48 c1 fd 03          	sar    $0x3,%rbp
  401bfc:	e8 2f ef ff ff       	callq  400b30 <_init>
  401c01:	48 85 ed             	test   %rbp,%rbp
  401c04:	74 20                	je     401c26 <__libc_csu_init+0x56>
  401c06:	31 db                	xor    %ebx,%ebx
  401c08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401c0f:	00 
  401c10:	4c 89 ea             	mov    %r13,%rdx
  401c13:	4c 89 f6             	mov    %r14,%rsi
  401c16:	44 89 ff             	mov    %r15d,%edi
  401c19:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  401c1d:	48 83 c3 01          	add    $0x1,%rbx
  401c21:	48 39 dd             	cmp    %rbx,%rbp
  401c24:	75 ea                	jne    401c10 <__libc_csu_init+0x40>
  401c26:	48 83 c4 08          	add    $0x8,%rsp
  401c2a:	5b                   	pop    %rbx
  401c2b:	5d                   	pop    %rbp
  401c2c:	41 5c                	pop    %r12
  401c2e:	41 5d                	pop    %r13
  401c30:	41 5e                	pop    %r14
  401c32:	41 5f                	pop    %r15
  401c34:	c3                   	retq   
  401c35:	90                   	nop
  401c36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401c3d:	00 00 00 

0000000000401c40 <__libc_csu_fini>:
  401c40:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401c44 <_fini>:
  401c44:	48 83 ec 08          	sub    $0x8,%rsp
  401c48:	48 83 c4 08          	add    $0x8,%rsp
  401c4c:	c3                   	retq   

Disassembly of section .rodata:

0000000000401c60 <_IO_stdin_used>:
  401c60:	01 00                	add    %eax,(%rax)
  401c62:	02 00                	add    (%rax),%al
  401c64:	25 73 3a 20 45       	and    $0x45203a73,%eax
  401c69:	72 72                	jb     401cdd <_IO_stdin_used+0x7d>
  401c6b:	6f                   	outsl  %ds:(%rsi),(%dx)
  401c6c:	72 3a                	jb     401ca8 <_IO_stdin_used+0x48>
  401c6e:	20 43 6f             	and    %al,0x6f(%rbx)
  401c71:	75 6c                	jne    401cdf <_IO_stdin_used+0x7f>
  401c73:	64 6e                	outsb  %fs:(%rsi),(%dx)
  401c75:	27                   	(bad)  
  401c76:	74 20                	je     401c98 <_IO_stdin_used+0x38>
  401c78:	6f                   	outsl  %ds:(%rsi),(%dx)
  401c79:	70 65                	jo     401ce0 <_IO_stdin_used+0x80>
  401c7b:	6e                   	outsb  %ds:(%rsi),(%dx)
  401c7c:	20 25 73 0a 00 55    	and    %ah,0x55000a73(%rip)        # 554026f5 <_end+0x54dfeac5>
  401c82:	73 61                	jae    401ce5 <_IO_stdin_used+0x85>
  401c84:	67 65 3a 20          	cmp    %gs:(%eax),%ah
  401c88:	25 73 20 5b 3c       	and    $0x3c5b2073,%eax
  401c8d:	69 6e 70 75 74 5f 66 	imul   $0x665f7475,0x70(%rsi),%ebp
  401c94:	69 6c 65 3e 5d 0a 00 	imul   $0x54000a5d,0x3e(%rbp,%riz,2),%ebp
  401c9b:	54 
  401c9c:	68 61 74 27 73       	pushq  $0x73277461
  401ca1:	20 6e 75             	and    %ch,0x75(%rsi)
  401ca4:	6d                   	insl   (%dx),%es:(%rdi)
  401ca5:	62                   	(bad)  
  401ca6:	65 72 20             	gs jb  401cc9 <_IO_stdin_used+0x69>
  401ca9:	32 2e                	xor    (%rsi),%ch
  401cab:	20 20                	and    %ah,(%rax)
  401cad:	4b                   	rex.WXB
  401cae:	65 65 70 20          	gs gs jo 401cd2 <_IO_stdin_used+0x72>
  401cb2:	67 6f                	outsl  %ds:(%esi),(%dx)
  401cb4:	69 6e 67 21 00 00 00 	imul   $0x21,0x67(%rsi),%ebp
  401cbb:	00 00                	add    %al,(%rax)
  401cbd:	00 00                	add    %al,(%rax)
  401cbf:	00 57 65             	add    %dl,0x65(%rdi)
  401cc2:	6c                   	insb   (%dx),%es:(%rdi)
  401cc3:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
  401cc6:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
  401ccb:	6d                   	insl   (%dx),%es:(%rdi)
  401ccc:	79 20                	jns    401cee <_IO_stdin_used+0x8e>
  401cce:	66 69 65 6e 64 69    	imul   $0x6964,0x6e(%rbp),%sp
  401cd4:	73 68                	jae    401d3e <_IO_stdin_used+0xde>
  401cd6:	20 6c 69 74          	and    %ch,0x74(%rcx,%rbp,2)
  401cda:	74 6c                	je     401d48 <_IO_stdin_used+0xe8>
  401cdc:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
  401ce0:	6d                   	insl   (%dx),%es:(%rdi)
  401ce1:	62                   	(bad)  
  401ce2:	2e 20 59 6f          	and    %bl,%cs:0x6f(%rcx)
  401ce6:	75 20                	jne    401d08 <_IO_stdin_used+0xa8>
  401ce8:	68 61 76 65 20       	pushq  $0x20657661
  401ced:	33 20                	xor    (%rax),%esp
  401cef:	70 68                	jo     401d59 <_IO_stdin_used+0xf9>
  401cf1:	61                   	(bad)  
  401cf2:	73 65                	jae    401d59 <_IO_stdin_used+0xf9>
  401cf4:	73 20                	jae    401d16 <_IO_stdin_used+0xb6>
  401cf6:	77 69                	ja     401d61 <_IO_stdin_used+0x101>
  401cf8:	74 68                	je     401d62 <_IO_stdin_used+0x102>
  401cfa:	00 00                	add    %al,(%rax)
  401cfc:	00 00                	add    %al,(%rax)
  401cfe:	00 00                	add    %al,(%rax)
  401d00:	77 68                	ja     401d6a <_IO_stdin_used+0x10a>
  401d02:	69 63 68 20 74 6f 20 	imul   $0x206f7420,0x68(%rbx),%esp
  401d09:	62                   	(bad)  
  401d0a:	6c                   	insb   (%dx),%es:(%rdi)
  401d0b:	6f                   	outsl  %ds:(%rsi),(%dx)
  401d0c:	77 20                	ja     401d2e <_IO_stdin_used+0xce>
  401d0e:	79 6f                	jns    401d7f <_IO_stdin_used+0x11f>
  401d10:	75 72                	jne    401d84 <_IO_stdin_used+0x124>
  401d12:	73 65                	jae    401d79 <_IO_stdin_used+0x119>
  401d14:	6c                   	insb   (%dx),%es:(%rdi)
  401d15:	66 20 75 70          	data16 and %dh,0x70(%rbp)
  401d19:	2e 20 48 61          	and    %cl,%cs:0x61(%rax)
  401d1d:	76 65                	jbe    401d84 <_IO_stdin_used+0x124>
  401d1f:	20 61 20             	and    %ah,0x20(%rcx)
  401d22:	6e                   	outsb  %ds:(%rsi),(%dx)
  401d23:	69 63 65 20 64 61 79 	imul   $0x79616420,0x65(%rbx),%esp
  401d2a:	21 00                	and    %eax,(%rax)
  401d2c:	00 00                	add    %al,(%rax)
  401d2e:	00 00                	add    %al,(%rax)
  401d30:	50                   	push   %rax
  401d31:	68 61 73 65 20       	pushq  $0x20657361
  401d36:	31 20                	xor    %esp,(%rax)
  401d38:	64 65 66 75 73       	fs gs data16 jne 401db0 <_IO_stdin_used+0x150>
  401d3d:	65 64 2e 20 48 6f    	gs fs and %cl,%cs:0x6f(%rax)
  401d43:	77 20                	ja     401d65 <_IO_stdin_used+0x105>
  401d45:	61                   	(bad)  
  401d46:	62                   	(bad)  
  401d47:	6f                   	outsl  %ds:(%rsi),(%dx)
  401d48:	75 74                	jne    401dbe <_IO_stdin_used+0x15e>
  401d4a:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
  401d4e:	20 6e 65             	and    %ch,0x65(%rsi)
  401d51:	78 74                	js     401dc7 <array.3073+0x7>
  401d53:	20 6f 6e             	and    %ch,0x6e(%rdi)
  401d56:	65 3f                	gs (bad) 
	...
  401d60:	49 20 74 75 72       	rex.WB and %sil,0x72(%r13,%rsi,2)
  401d65:	6e                   	outsb  %ds:(%rsi),(%dx)
  401d66:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
  401d6c:	20 6d 6f             	and    %ch,0x6f(%rbp)
  401d6f:	6f                   	outsl  %ds:(%rsi),(%dx)
  401d70:	6e                   	outsb  %ds:(%rsi),(%dx)
  401d71:	20 69 6e             	and    %ch,0x6e(%rcx)
  401d74:	74 6f                	je     401de5 <array.3073+0x25>
  401d76:	20 73 6f             	and    %dh,0x6f(%rbx)
  401d79:	6d                   	insl   (%dx),%es:(%rdi)
  401d7a:	65 74 68             	gs je  401de5 <array.3073+0x25>
  401d7d:	69 6e 67 20 49 20 6c 	imul   $0x6c204920,0x67(%rsi),%ebp
  401d84:	69 6b 65 20 74 6f 20 	imul   $0x206f7420,0x65(%rbx),%ebp
  401d8b:	63 61 6c             	movslq 0x6c(%rcx),%esp
  401d8e:	6c                   	insb   (%dx),%es:(%rdi)
  401d8f:	20 61 20             	and    %ah,0x20(%rcx)
  401d92:	44                   	rex.R
  401d93:	65 61                	gs (bad) 
  401d95:	74 68                	je     401dff <array.3073+0x3f>
  401d97:	20 53 74             	and    %dl,0x74(%rbx)
  401d9a:	61                   	(bad)  
  401d9b:	72 2e                	jb     401dcb <array.3073+0xb>
  401d9d:	00 00                	add    %al,(%rax)
  401d9f:	00 44 f2 ff          	add    %al,-0x1(%rdx,%rsi,8)
  401da3:	ff 4b f2             	decl   -0xe(%rbx)
  401da6:	ff                   	(bad)  
  401da7:	ff 8a f2 ff ff 91    	decl   -0x6e00000e(%rdx)
  401dad:	f2 ff                	repnz (bad) 
  401daf:	ff 98 f2 ff ff 9f    	lcall  *-0x6000000e(%rax)
  401db5:	f2 ff                	repnz (bad) 
  401db7:	ff a6 f2 ff ff ad    	jmpq   *-0x5200000e(%rsi)
  401dbd:	f2 ff                	repnz (bad) 
  401dbf:	ff 0a                	decl   (%rdx)

0000000000401dc0 <array.3073>:
  401dc0:	0a 00                	or     (%rax),%al
  401dc2:	00 00                	add    %al,(%rax)
  401dc4:	02 00                	add    (%rax),%al
  401dc6:	00 00                	add    %al,(%rax)
  401dc8:	0e                   	(bad)  
  401dc9:	00 00                	add    %al,(%rax)
  401dcb:	00 07                	add    %al,(%rdi)
  401dcd:	00 00                	add    %al,(%rax)
  401dcf:	00 08                	add    %cl,(%rax)
  401dd1:	00 00                	add    %al,(%rax)
  401dd3:	00 0c 00             	add    %cl,(%rax,%rax,1)
  401dd6:	00 00                	add    %al,(%rax)
  401dd8:	0f 00 00             	sldt   (%rax)
  401ddb:	00 0b                	add    %cl,(%rbx)
  401ddd:	00 00                	add    %al,(%rax)
  401ddf:	00 00                	add    %al,(%rax)
  401de1:	00 00                	add    %al,(%rax)
  401de3:	00 04 00             	add    %al,(%rax,%rax,1)
  401de6:	00 00                	add    %al,(%rax)
  401de8:	01 00                	add    %eax,(%rax)
  401dea:	00 00                	add    %al,(%rax)
  401dec:	0d 00 00 00 03       	or     $0x3000000,%eax
  401df1:	00 00                	add    %al,(%rax)
  401df3:	00 09                	add    %cl,(%rcx)
  401df5:	00 00                	add    %al,(%rax)
  401df7:	00 06                	add    %al,(%rsi)
  401df9:	00 00                	add    %al,(%rax)
  401dfb:	00 05 00 00 00 53    	add    %al,0x53000000(%rip)        # 53401e01 <_end+0x52dfe1d1>
  401e01:	6f                   	outsl  %ds:(%rsi),(%dx)
  401e02:	20 79 6f             	and    %bh,0x6f(%rcx)
  401e05:	75 20                	jne    401e27 <array.3073+0x67>
  401e07:	74 68                	je     401e71 <array.3073+0xb1>
  401e09:	69 6e 6b 20 79 6f 75 	imul   $0x756f7920,0x6b(%rsi),%ebp
  401e10:	20 63 61             	and    %ah,0x61(%rbx)
  401e13:	6e                   	outsb  %ds:(%rsi),(%dx)
  401e14:	20 73 74             	and    %dh,0x74(%rbx)
  401e17:	6f                   	outsl  %ds:(%rsi),(%dx)
  401e18:	70 20                	jo     401e3a <array.3073+0x7a>
  401e1a:	74 68                	je     401e84 <array.3073+0xc4>
  401e1c:	65 20 62 6f          	and    %ah,%gs:0x6f(%rdx)
  401e20:	6d                   	insl   (%dx),%es:(%rdi)
  401e21:	62                   	(bad)  
  401e22:	20 77 69             	and    %dh,0x69(%rdi)
  401e25:	74 68                	je     401e8f <array.3073+0xcf>
  401e27:	20 63 74             	and    %ah,0x74(%rbx)
  401e2a:	72 6c                	jb     401e98 <array.3073+0xd8>
  401e2c:	2d 63 2c 20 64       	sub    $0x64202c63,%eax
  401e31:	6f                   	outsl  %ds:(%rsi),(%dx)
  401e32:	20 79 6f             	and    %bh,0x6f(%rcx)
  401e35:	75 3f                	jne    401e76 <array.3073+0xb6>
  401e37:	00 59 6f             	add    %bl,0x6f(%rcx)
  401e3a:	75 72                	jne    401eae <array.3073+0xee>
  401e3c:	20 69 6e             	and    %ch,0x6e(%rcx)
  401e3f:	73 74                	jae    401eb5 <array.3073+0xf5>
  401e41:	72 75                	jb     401eb8 <array.3073+0xf8>
  401e43:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
  401e47:	20 68 61             	and    %ch,0x61(%rax)
  401e4a:	73 20                	jae    401e6c <array.3073+0xac>
  401e4c:	62                   	(bad)  
  401e4d:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
  401e50:	20 6e 6f             	and    %ch,0x6f(%rsi)
  401e53:	74 69                	je     401ebe <array.3073+0xfe>
  401e55:	66 69 65 64 2e 00    	imul   $0x2e,0x64(%rbp),%sp
  401e5b:	00 00                	add    %al,(%rax)
  401e5d:	00 00                	add    %al,(%rax)
  401e5f:	00 43 75             	add    %al,0x75(%rbx)
  401e62:	72 73                	jb     401ed7 <array.3073+0x117>
  401e64:	65 73 2c             	gs jae 401e93 <array.3073+0xd3>
  401e67:	20 79 6f             	and    %bh,0x6f(%rcx)
  401e6a:	75 27                	jne    401e93 <array.3073+0xd3>
  401e6c:	76 65                	jbe    401ed3 <array.3073+0x113>
  401e6e:	20 66 6f             	and    %ah,0x6f(%rsi)
  401e71:	75 6e                	jne    401ee1 <array.3073+0x121>
  401e73:	64 20 74 68 65       	and    %dh,%fs:0x65(%rax,%rbp,2)
  401e78:	20 73 65             	and    %dh,0x65(%rbx)
  401e7b:	63 72 65             	movslq 0x65(%rdx),%esi
  401e7e:	74 20                	je     401ea0 <array.3073+0xe0>
  401e80:	70 68                	jo     401eea <array.3073+0x12a>
  401e82:	61                   	(bad)  
  401e83:	73 65                	jae    401eea <array.3073+0x12a>
  401e85:	21 00                	and    %eax,(%rax)
  401e87:	00 42 75             	add    %al,0x75(%rdx)
  401e8a:	74 20                	je     401eac <array.3073+0xec>
  401e8c:	66 69 6e 64 69 6e    	imul   $0x6e69,0x64(%rsi),%bp
  401e92:	67 20 69 74          	and    %ch,0x74(%ecx)
  401e96:	20 61 6e             	and    %ah,0x6e(%rcx)
  401e99:	64 20 73 6f          	and    %dh,%fs:0x6f(%rbx)
  401e9d:	6c                   	insb   (%dx),%es:(%rdi)
  401e9e:	76 69                	jbe    401f09 <array.3073+0x149>
  401ea0:	6e                   	outsb  %ds:(%rsi),(%dx)
  401ea1:	67 20 69 74          	and    %ch,0x74(%ecx)
  401ea5:	20 61 72             	and    %ah,0x72(%rcx)
  401ea8:	65 20 71 75          	and    %dh,%gs:0x75(%rcx)
  401eac:	69 74 65 20 64 69 66 	imul   $0x66666964,0x20(%rbp,%riz,2),%esi
  401eb3:	66 
  401eb4:	65 72 65             	gs jb  401f1c <array.3073+0x15c>
  401eb7:	6e                   	outsb  %ds:(%rsi),(%dx)
  401eb8:	74 2e                	je     401ee8 <array.3073+0x128>
  401eba:	2e 2e 00 00          	cs add %al,%cs:(%rax)
  401ebe:	00 00                	add    %al,(%rax)
  401ec0:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
  401ec2:	6e                   	outsb  %ds:(%rsi),(%dx)
  401ec3:	67 72 61             	addr32 jb 401f27 <array.3073+0x167>
  401ec6:	74 75                	je     401f3d <array.3073+0x17d>
  401ec8:	6c                   	insb   (%dx),%es:(%rdi)
  401ec9:	61                   	(bad)  
  401eca:	74 69                	je     401f35 <array.3073+0x175>
  401ecc:	6f                   	outsl  %ds:(%rsi),(%dx)
  401ecd:	6e                   	outsb  %ds:(%rsi),(%dx)
  401ece:	73 21                	jae    401ef1 <array.3073+0x131>
  401ed0:	20 59 6f             	and    %bl,0x6f(%rcx)
  401ed3:	75 27                	jne    401efc <array.3073+0x13c>
  401ed5:	76 65                	jbe    401f3c <array.3073+0x17c>
  401ed7:	20 64 65 66          	and    %ah,0x66(%rbp,%riz,2)
  401edb:	75 73                	jne    401f50 <array.3073+0x190>
  401edd:	65 64 20 74 68 65    	gs and %dh,%fs:0x65(%rax,%rbp,2)
  401ee3:	20 62 6f             	and    %ah,0x6f(%rdx)
  401ee6:	6d                   	insl   (%dx),%es:(%rdi)
  401ee7:	62 21                	(bad)  
  401ee9:	00 00                	add    %al,(%rax)
  401eeb:	00 00                	add    %al,(%rax)
  401eed:	00 00                	add    %al,(%rax)
  401eef:	00 59 6f             	add    %bl,0x6f(%rcx)
  401ef2:	75 72                	jne    401f66 <array.3073+0x1a6>
  401ef4:	20 69 6e             	and    %ch,0x6e(%rcx)
  401ef7:	73 74                	jae    401f6d <array.3073+0x1ad>
  401ef9:	72 75                	jb     401f70 <array.3073+0x1b0>
  401efb:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
  401eff:	20 68 61             	and    %ch,0x61(%rax)
  401f02:	73 20                	jae    401f24 <array.3073+0x164>
  401f04:	62                   	(bad)  
  401f05:	65 65 6e             	gs outsb %gs:(%rsi),(%dx)
  401f08:	20 6e 6f             	and    %ch,0x6f(%rsi)
  401f0b:	74 69                	je     401f76 <array.3073+0x1b6>
  401f0d:	66 69 65 64 20 61    	imul   $0x6120,0x64(%rbp),%sp
  401f13:	6e                   	outsb  %ds:(%rsi),(%dx)
  401f14:	64 20 77 69          	and    %dh,%fs:0x69(%rdi)
  401f18:	6c                   	insb   (%dx),%es:(%rdi)
  401f19:	6c                   	insb   (%dx),%es:(%rdi)
  401f1a:	20 76 65             	and    %dh,0x65(%rsi)
  401f1d:	72 69                	jb     401f88 <array.3073+0x1c8>
  401f1f:	66 79 20             	data16 jns 401f42 <array.3073+0x182>
  401f22:	79 6f                	jns    401f93 <array.3073+0x1d3>
  401f24:	75 72                	jne    401f98 <array.3073+0x1d8>
  401f26:	20 73 6f             	and    %dh,0x6f(%rbx)
  401f29:	6c                   	insb   (%dx),%es:(%rdi)
  401f2a:	75 74                	jne    401fa0 <array.3073+0x1e0>
  401f2c:	69 6f 6e 2e 00 00 00 	imul   $0x2e,0x6e(%rdi),%ebp
  401f33:	00 00                	add    %al,(%rax)
  401f35:	00 00                	add    %al,(%rax)
  401f37:	00 57 65             	add    %dl,0x65(%rdi)
  401f3a:	6c                   	insb   (%dx),%es:(%rdi)
  401f3b:	6c                   	insb   (%dx),%es:(%rdi)
  401f3c:	2e 2e 2e 00 4f 4b    	cs cs add %cl,%cs:0x4b(%rdi)
  401f42:	2e 20 3a             	and    %bh,%cs:(%rdx)
  401f45:	2d 29 00 49 6e       	sub    $0x6e490029,%eax
  401f4a:	76 61                	jbe    401fad <array.3073+0x1ed>
  401f4c:	6c                   	insb   (%dx),%es:(%rdi)
  401f4d:	69 64 20 70 68 61 73 	imul   $0x65736168,0x70(%rax,%riz,1),%esp
  401f54:	65 
  401f55:	25 73 0a 00 42       	and    $0x42000a73,%eax
  401f5a:	61                   	(bad)  
  401f5b:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  401f5f:	73 74                	jae    401fd5 <array.3073+0x215>
  401f61:	20 28                	and    %ch,(%rax)
  401f63:	31 29                	xor    %ebp,(%rcx)
  401f65:	2e 00 42 61          	add    %al,%cs:0x61(%rdx)
  401f69:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  401f6d:	73 74                	jae    401fe3 <array.3073+0x223>
  401f6f:	20 28                	and    %ch,(%rax)
  401f71:	32 29                	xor    (%rcx),%ch
  401f73:	2e 00 42 61          	add    %al,%cs:0x61(%rdx)
  401f77:	64 20 68 6f          	and    %ch,%fs:0x6f(%rax)
  401f7b:	73 74                	jae    401ff1 <array.3073+0x231>
  401f7d:	20 28                	and    %ch,(%rax)
  401f7f:	33 29                	xor    (%rcx),%ebp
  401f81:	2e 00 32             	add    %dh,%cs:(%rdx)
  401f84:	30 32                	xor    %dh,(%rdx)
  401f86:	2e 31 32             	xor    %esi,%cs:(%rdx)
  401f89:	30 2e                	xor    %ch,(%rsi)
  401f8b:	34 30                	xor    $0x30,%al
  401f8d:	2e 38 35 00 64 65 66 	cmp    %dh,%cs:0x66656400(%rip)        # 66a58394 <_end+0x66454764>
  401f94:	75 73                	jne    402009 <array.3073+0x249>
  401f96:	65 64 00 65 78       	gs add %ah,%fs:0x78(%rbp)
  401f9b:	70 6c                	jo     402009 <array.3073+0x249>
  401f9d:	6f                   	outsl  %ds:(%rsi),(%dx)
  401f9e:	64 65 64 00 73 6f    	fs gs add %dh,%fs:0x6f(%rbx)
  401fa4:	63 6b 65             	movslq 0x65(%rbx),%ebp
  401fa7:	74 20                	je     401fc9 <array.3073+0x209>
  401fa9:	65 72 72             	gs jb  40201e <array.3073+0x25e>
  401fac:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fad:	72 00                	jb     401faf <array.3073+0x1ef>
  401faf:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
  401fb2:	6e                   	outsb  %ds:(%rsi),(%dx)
  401fb3:	65 63 74 20 65       	movslq %gs:0x65(%rax,%riz,1),%esi
  401fb8:	72 72                	jb     40202c <array.3073+0x26c>
  401fba:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fbb:	72 00                	jb     401fbd <array.3073+0x1fd>
  401fbd:	62                   	(bad)  
  401fbe:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fbf:	6d                   	insl   (%dx),%es:(%rdi)
  401fc0:	62                   	(bad)  
  401fc1:	2d 68 65 61 64       	sub    $0x64616568,%eax
  401fc6:	65 72 3a             	gs jb  402003 <array.3073+0x243>
  401fc9:	25 73 3a 25 64       	and    $0x64253a73,%eax
  401fce:	3a 25 73 3a 25 73    	cmp    0x73253a73(%rip),%ah        # 73655a47 <_end+0x73051e17>
  401fd4:	3a 25 64 0a 00 62    	cmp    0x62000a64(%rip),%ah        # 62402a3e <_end+0x61dfee0e>
  401fda:	6f                   	outsl  %ds:(%rsi),(%dx)
  401fdb:	6d                   	insl   (%dx),%es:(%rdi)
  401fdc:	62                   	(bad)  
  401fdd:	2d 73 74 72 69       	sub    $0x69727473,%eax
  401fe2:	6e                   	outsb  %ds:(%rsi),(%dx)
  401fe3:	67 3a 25 73 3a 25 64 	cmp    0x64253a73(%eip),%ah        # 64655a5d <_end+0x64051e2d>
  401fea:	3a 25 73 3a 25 64    	cmp    0x64253a73(%rip),%ah        # 64655a63 <_end+0x64051e33>
  401ff0:	3a 25 73 0a 00 73    	cmp    0x73000a73(%rip),%ah        # 73402a69 <_end+0x72dfee39>
  401ff6:	6f                   	outsl  %ds:(%rsi),(%dx)
  401ff7:	63 6b 65             	movslq 0x65(%rbx),%ebp
  401ffa:	74 20                	je     40201c <array.3073+0x25c>
  401ffc:	77 72                	ja     402070 <array.3073+0x2b0>
  401ffe:	69 74 65 20 65 72 72 	imul   $0x6f727265,0x20(%rbp,%riz,2),%esi
  402005:	6f 
  402006:	72 00                	jb     402008 <array.3073+0x248>
  402008:	45 52                	rex.RB push %r10
  40200a:	52                   	push   %rdx
  40200b:	4f 52                	rex.WRXB push %r10
  40200d:	3a 20                	cmp    (%rax),%ah
  40200f:	64 75 70             	fs jne 402082 <array.3073+0x2c2>
  402012:	28 30                	sub    %dh,(%rax)
  402014:	29 20                	sub    %esp,(%rax)
  402016:	65 72 72             	gs jb  40208b <array.3073+0x2cb>
  402019:	6f                   	outsl  %ds:(%rsi),(%dx)
  40201a:	72 00                	jb     40201c <array.3073+0x25c>
  40201c:	45 52                	rex.RB push %r10
  40201e:	52                   	push   %rdx
  40201f:	4f 52                	rex.WRXB push %r10
  402021:	3a 20                	cmp    (%rax),%ah
  402023:	63 6c 6f 73          	movslq 0x73(%rdi,%rbp,2),%ebp
  402027:	65 20 65 72          	and    %ah,%gs:0x72(%rbp)
  40202b:	72 6f                	jb     40209c <array.3073+0x2dc>
  40202d:	72 00                	jb     40202f <array.3073+0x26f>
  40202f:	45 52                	rex.RB push %r10
  402031:	52                   	push   %rdx
  402032:	4f 52                	rex.WRXB push %r10
  402034:	3a 20                	cmp    (%rax),%ah
  402036:	74 6d                	je     4020a5 <array.3073+0x2e5>
  402038:	70 66                	jo     4020a0 <array.3073+0x2e0>
  40203a:	69 6c 65 20 65 72 72 	imul   $0x6f727265,0x20(%rbp,%riz,2),%ebp
  402041:	6f 
  402042:	72 00                	jb     402044 <array.3073+0x284>
  402044:	53                   	push   %rbx
  402045:	75 62                	jne    4020a9 <array.3073+0x2e9>
  402047:	6a 65                	pushq  $0x65
  402049:	63 74 3a 20          	movslq 0x20(%rdx,%rdi,1),%esi
  40204d:	42 6f                	rex.X outsl %ds:(%rsi),(%dx)
  40204f:	6d                   	insl   (%dx),%es:(%rdi)
  402050:	62                   	(bad)  
  402051:	20 6e 6f             	and    %ch,0x6f(%rsi)
  402054:	74 69                	je     4020bf <array.3073+0x2ff>
  402056:	66 69 63 61 74 69    	imul   $0x6974,0x61(%rbx),%sp
  40205c:	6f                   	outsl  %ds:(%rsi),(%dx)
  40205d:	6e                   	outsb  %ds:(%rsi),(%dx)
  40205e:	0a 00                	or     (%rax),%al
  402060:	6c                   	insb   (%dx),%es:(%rdi)
  402061:	6f                   	outsl  %ds:(%rsi),(%dx)
  402062:	63 61 6c             	movslq 0x6c(%rcx),%esp
  402065:	68 6f 73 74 00       	pushq  $0x74736f
  40206a:	6f                   	outsl  %ds:(%rsi),(%dx)
  40206b:	6e                   	outsb  %ds:(%rsi),(%dx)
  40206c:	6c                   	insb   (%dx),%es:(%rdi)
  40206d:	69 6e 65 62 6f 6d 62 	imul   $0x626d6f62,0x65(%rsi),%ebp
  402074:	00 2f                	add    %ch,(%rdi)
  402076:	75 73                	jne    4020eb <array.3073+0x32b>
  402078:	72 2f                	jb     4020a9 <array.3073+0x2e9>
  40207a:	73 62                	jae    4020de <array.3073+0x31e>
  40207c:	69 6e 2f 73 65 6e 64 	imul   $0x646e6573,0x2f(%rsi),%ebp
  402083:	6d                   	insl   (%dx),%es:(%rdi)
  402084:	61                   	(bad)  
  402085:	69 6c 20 2d 62 6d 00 	imul   $0x25006d62,0x2d(%rax,%riz,1),%ebp
  40208c:	25 
  40208d:	73 20                	jae    4020af <array.3073+0x2ef>
  40208f:	25 73 40 25 73       	and    $0x73254073,%eax
  402094:	00 45 52             	add    %al,0x52(%rbp)
  402097:	52                   	push   %rdx
  402098:	4f 52                	rex.WRXB push %r10
  40209a:	3a 20                	cmp    (%rax),%ah
  40209c:	6e                   	outsb  %ds:(%rsi),(%dx)
  40209d:	6f                   	outsl  %ds:(%rsi),(%dx)
  40209e:	74 69                	je     402109 <array.3073+0x349>
  4020a0:	66 69 63 61 74 69    	imul   $0x6974,0x61(%rbx),%sp
  4020a6:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020a7:	6e                   	outsb  %ds:(%rsi),(%dx)
  4020a8:	20 65 72             	and    %ah,0x72(%rbp)
  4020ab:	72 6f                	jb     40211c <array.3073+0x35c>
  4020ad:	72 00                	jb     4020af <array.3073+0x2ef>
  4020af:	45 52                	rex.RB push %r10
  4020b1:	52                   	push   %rdx
  4020b2:	4f 52                	rex.WRXB push %r10
  4020b4:	3a 20                	cmp    (%rax),%ah
  4020b6:	66 63 6c 6f 73       	movslq 0x73(%rdi,%rbp,2),%bp
  4020bb:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%rbp,%rbp,2)
  4020c0:	29 20                	sub    %esp,(%rax)
  4020c2:	65 72 72             	gs jb  402137 <array.3073+0x377>
  4020c5:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020c6:	72 00                	jb     4020c8 <array.3073+0x308>
  4020c8:	45 52                	rex.RB push %r10
  4020ca:	52                   	push   %rdx
  4020cb:	4f 52                	rex.WRXB push %r10
  4020cd:	3a 20                	cmp    (%rax),%ah
  4020cf:	64 75 70             	fs jne 402142 <array.3073+0x382>
  4020d2:	28 74 6d 70          	sub    %dh,0x70(%rbp,%rbp,2)
  4020d6:	73 74                	jae    40214c <array.3073+0x38c>
  4020d8:	64 69 6e 29 20 65 72 	imul   $0x72726520,%fs:0x29(%rsi),%ebp
  4020df:	72 
  4020e0:	6f                   	outsl  %ds:(%rsi),(%dx)
  4020e1:	72 00                	jb     4020e3 <array.3073+0x323>
  4020e3:	45 52                	rex.RB push %r10
  4020e5:	52                   	push   %rdx
  4020e6:	4f 52                	rex.WRXB push %r10
  4020e8:	3a 20                	cmp    (%rax),%ah
  4020ea:	63 6c 6f 73          	movslq 0x73(%rdi,%rbp,2),%ebp
  4020ee:	65 28 74 6d 70       	sub    %dh,%gs:0x70(%rbp,%rbp,2)
  4020f3:	73 74                	jae    402169 <array.3073+0x3a9>
  4020f5:	64 69 6e 29 00 0a 42 	imul   $0x4f420a00,%fs:0x29(%rsi),%ebp
  4020fc:	4f 
  4020fd:	4f                   	rex.WRXB
  4020fe:	4d 21 21             	and    %r12,(%r9)
  402101:	21 00                	and    %eax,(%rax)
  402103:	54                   	push   %rsp
  402104:	68 65 20 62 6f       	pushq  $0x6f622065
  402109:	6d                   	insl   (%dx),%es:(%rdi)
  40210a:	62                   	(bad)  
  40210b:	20 68 61             	and    %ch,0x61(%rax)
  40210e:	73 20                	jae    402130 <array.3073+0x370>
  402110:	62                   	(bad)  
  402111:	6c                   	insb   (%dx),%es:(%rdi)
  402112:	6f                   	outsl  %ds:(%rsi),(%dx)
  402113:	77 6e                	ja     402183 <array.3073+0x3c3>
  402115:	20 75 70             	and    %dh,0x70(%rbp)
  402118:	2e 00 25 64 20 25 64 	add    %ah,%cs:0x64252064(%rip)        # 64654183 <_end+0x64050553>
  40211f:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 64654189 <_end+0x64050559>
  402125:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 6465418f <_end+0x6405055f>
  40212b:	00 45 72             	add    %al,0x72(%rbp)
  40212e:	72 6f                	jb     40219f <__GNU_EH_FRAME_HDR+0x17>
  402130:	72 3a                	jb     40216c <array.3073+0x3ac>
  402132:	20 50 72             	and    %dl,0x72(%rax)
  402135:	65 6d                	gs insl (%dx),%es:(%rdi)
  402137:	61                   	(bad)  
  402138:	74 75                	je     4021af <__GNU_EH_FRAME_HDR+0x27>
  40213a:	72 65                	jb     4021a1 <__GNU_EH_FRAME_HDR+0x19>
  40213c:	20 45 4f             	and    %al,0x4f(%rbp)
  40213f:	46 20 6f 6e          	rex.RX and %r13b,0x6e(%rdi)
  402143:	20 73 74             	and    %dh,0x74(%rbx)
  402146:	64 69 6e 00 47 52 41 	imul   $0x44415247,%fs:0x0(%rsi),%ebp
  40214d:	44 
  40214e:	45 5f                	rex.RB pop %r15
  402150:	42                   	rex.X
  402151:	4f                   	rex.WRXB
  402152:	4d                   	rex.WRB
  402153:	42 00 45 72          	rex.X add %al,0x72(%rbp)
  402157:	72 6f                	jb     4021c8 <__GNU_EH_FRAME_HDR+0x40>
  402159:	72 3a                	jb     402195 <__GNU_EH_FRAME_HDR+0xd>
  40215b:	20 49 6e             	and    %cl,0x6e(%rcx)
  40215e:	70 75                	jo     4021d5 <__GNU_EH_FRAME_HDR+0x4d>
  402160:	74 20                	je     402182 <array.3073+0x3c2>
  402162:	6c                   	insb   (%dx),%es:(%rdi)
  402163:	69 6e 65 20 74 6f 6f 	imul   $0x6f6f7420,0x65(%rsi),%ebp
  40216a:	20 6c 6f 6e          	and    %ch,0x6e(%rdi,%rbp,2)
  40216e:	67 00 25 64 20 25 64 	add    %ah,0x64252064(%eip)        # 646541d9 <_end+0x640505a9>
  402175:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 646541df <_end+0x640505af>
  40217b:	20 25 64 20 25 64    	and    %ah,0x64252064(%rip)        # 646541e5 <_end+0x640505b5>
  402181:	20 25 73 00 66 70    	and    %ah,0x70660073(%rip)        # 70a621fa <_end+0x7045e5ca>
	...

Disassembly of section .eh_frame_hdr:

0000000000402188 <__GNU_EH_FRAME_HDR>:
  402188:	01 1b                	add    %ebx,(%rbx)
  40218a:	03 3b                	add    (%rbx),%edi
  40218c:	cc                   	int3   
  40218d:	00 00                	add    %al,(%rax)
  40218f:	00 18                	add    %bl,(%rax)
  402191:	00 00                	add    %al,(%rax)
  402193:	00 c8                	add    %cl,%al
  402195:	e9 ff ff 18 01       	jmpq   1592199 <_end+0xf8e569>
  40219a:	00 00                	add    %al,(%rax)
  40219c:	c8 eb ff ff          	enterq $0xffeb,$0xff
  4021a0:	e8 00 00 00 be       	callq  ffffffffbe4021a5 <_end+0xffffffffbddfe575>
  4021a5:	ec                   	in     (%dx),%al
  4021a6:	ff                   	(bad)  
  4021a7:	ff 40 01             	incl   0x1(%rax)
  4021aa:	00 00                	add    %al,(%rax)
  4021ac:	b4 ed                	mov    $0xed,%ah
  4021ae:	ff                   	(bad)  
  4021af:	ff 60 01             	jmpq   *0x1(%rax)
  4021b2:	00 00                	add    %al,(%rax)
  4021b4:	d4                   	(bad)  
  4021b5:	ed                   	in     (%dx),%eax
  4021b6:	ff                   	(bad)  
  4021b7:	ff 80 01 00 00 12    	incl   0x12000001(%rax)
  4021bd:	ee                   	out    %al,(%dx)
  4021be:	ff                   	(bad)  
  4021bf:	ff a8 01 00 00 d8    	ljmp   *-0x27ffffff(%rax)
  4021c5:	ee                   	out    %al,(%dx)
  4021c6:	ff                   	(bad)  
  4021c7:	ff c8                	dec    %eax
  4021c9:	01 00                	add    %eax,(%rax)
  4021cb:	00 5d ef             	add    %bl,-0x11(%rbp)
  4021ce:	ff                   	(bad)  
  4021cf:	ff                   	(bad)  
  4021d0:	e8 01 00 00 b4       	callq  ffffffffb44021d6 <_end+0xffffffffb3dfe5a6>
  4021d5:	ef                   	out    %eax,(%dx)
  4021d6:	ff                   	(bad)  
  4021d7:	ff 00                	incl   (%rax)
  4021d9:	02 00                	add    (%rax),%al
  4021db:	00 d6                	add    %dl,%dh
  4021dd:	ef                   	out    %eax,(%dx)
  4021de:	ff                   	(bad)  
  4021df:	ff 18                	lcall  *(%rax)
  4021e1:	02 00                	add    (%rax),%al
  4021e3:	00 f4                	add    %dh,%ah
  4021e5:	ef                   	out    %eax,(%dx)
  4021e6:	ff                   	(bad)  
  4021e7:	ff 30                	pushq  (%rax)
  4021e9:	02 00                	add    (%rax),%al
  4021eb:	00 5b f0             	add    %bl,-0x10(%rbx)
  4021ee:	ff                   	(bad)  
  4021ef:	ff 60 02             	jmpq   *0x2(%rax)
  4021f2:	00 00                	add    %al,(%rax)
  4021f4:	26 f1                	es icebp 
  4021f6:	ff                   	(bad)  
  4021f7:	ff 98 02 00 00 58    	lcall  *0x58000002(%rax)
  4021fd:	f1                   	icebp  
  4021fe:	ff                   	(bad)  
  4021ff:	ff b0 02 00 00 93    	pushq  -0x6cfffffe(%rax)
  402205:	f1                   	icebp  
  402206:	ff                   	(bad)  
  402207:	ff                   	(bad)  
  402208:	d8 02                	fadds  (%rdx)
  40220a:	00 00                	add    %al,(%rax)
  40220c:	e1 f1                	loope  4021ff <__GNU_EH_FRAME_HDR+0x77>
  40220e:	ff                   	(bad)  
  40220f:	ff 00                	incl   (%rax)
  402211:	03 00                	add    (%rax),%eax
  402213:	00 41 f2             	add    %al,-0xe(%rcx)
  402216:	ff                   	(bad)  
  402217:	ff 40 03             	incl   0x3(%rax)
  40221a:	00 00                	add    %al,(%rax)
  40221c:	84 f5                	test   %dh,%ch
  40221e:	ff                   	(bad)  
  40221f:	ff a8 03 00 00 04    	ljmp   *0x4000003(%rax)
  402225:	f8                   	clc    
  402226:	ff                   	(bad)  
  402227:	ff 10                	callq  *(%rax)
  402229:	04 00                	add    $0x0,%al
  40222b:	00 40 f8             	add    %al,-0x8(%rax)
  40222e:	ff                   	(bad)  
  40222f:	ff 28                	ljmp   *(%rax)
  402231:	04 00                	add    $0x0,%al
  402233:	00 81 f8 ff ff 50    	add    %al,0x50fffff8(%rcx)
  402239:	04 00                	add    $0x0,%al
  40223b:	00 82 f9 ff ff 70    	add    %al,0x70fffff9(%rdx)
  402241:	04 00                	add    $0x0,%al
  402243:	00 48 fa             	add    %cl,-0x6(%rax)
  402246:	ff                   	(bad)  
  402247:	ff a0 04 00 00 b8    	jmpq   *-0x47fffffc(%rax)
  40224d:	fa                   	cli    
  40224e:	ff                   	(bad)  
  40224f:	ff                   	(bad)  
  402250:	e8                   	.byte 0xe8
  402251:	04 00                	add    $0x0,%al
	...

Disassembly of section .eh_frame:

0000000000402258 <__FRAME_END__-0x430>:
  402258:	14 00                	adc    $0x0,%al
  40225a:	00 00                	add    %al,(%rax)
  40225c:	00 00                	add    %al,(%rax)
  40225e:	00 00                	add    %al,(%rax)
  402260:	01 7a 52             	add    %edi,0x52(%rdx)
  402263:	00 01                	add    %al,(%rcx)
  402265:	78 10                	js     402277 <__GNU_EH_FRAME_HDR+0xef>
  402267:	01 1b                	add    %ebx,(%rbx)
  402269:	0c 07                	or     $0x7,%al
  40226b:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  402271:	00 00                	add    %al,(%rax)
  402273:	00 1c 00             	add    %bl,(%rax,%rax,1)
  402276:	00 00                	add    %al,(%rax)
  402278:	d8 ea                	fsubr  %st(2),%st
  40227a:	ff                   	(bad)  
  40227b:	ff 2b                	ljmp   *(%rbx)
	...
  402285:	00 00                	add    %al,(%rax)
  402287:	00 14 00             	add    %dl,(%rax,%rax,1)
  40228a:	00 00                	add    %al,(%rax)
  40228c:	00 00                	add    %al,(%rax)
  40228e:	00 00                	add    %al,(%rax)
  402290:	01 7a 52             	add    %edi,0x52(%rdx)
  402293:	00 01                	add    %al,(%rcx)
  402295:	78 10                	js     4022a7 <__GNU_EH_FRAME_HDR+0x11f>
  402297:	01 1b                	add    %ebx,(%rbx)
  402299:	0c 07                	or     $0x7,%al
  40229b:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  4022a1:	00 00                	add    %al,(%rax)
  4022a3:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4022a6:	00 00                	add    %al,(%rax)
  4022a8:	a8 e8                	test   $0xe8,%al
  4022aa:	ff                   	(bad)  
  4022ab:	ff 00                	incl   (%rax)
  4022ad:	02 00                	add    (%rax),%al
  4022af:	00 00                	add    %al,(%rax)
  4022b1:	0e                   	(bad)  
  4022b2:	10 46 0e             	adc    %al,0xe(%rsi)
  4022b5:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  4022b8:	0b 77 08             	or     0x8(%rdi),%esi
  4022bb:	80 00 3f             	addb   $0x3f,(%rax)
  4022be:	1a 3b                	sbb    (%rbx),%bh
  4022c0:	2a 33                	sub    (%rbx),%dh
  4022c2:	24 22                	and    $0x22,%al
  4022c4:	00 00                	add    %al,(%rax)
  4022c6:	00 00                	add    %al,(%rax)
  4022c8:	1c 00                	sbb    $0x0,%al
  4022ca:	00 00                	add    %al,(%rax)
  4022cc:	44 00 00             	add    %r8b,(%rax)
  4022cf:	00 76 eb             	add    %dh,-0x15(%rsi)
  4022d2:	ff                   	(bad)  
  4022d3:	ff f6                	push   %rsi
  4022d5:	00 00                	add    %al,(%rax)
  4022d7:	00 00                	add    %al,(%rax)
  4022d9:	41 0e                	rex.B (bad) 
  4022db:	10 83 02 02 a6 0a    	adc    %al,0xaa60202(%rbx)
  4022e1:	0e                   	(bad)  
  4022e2:	08 41 0b             	or     %al,0xb(%rcx)
  4022e5:	00 00                	add    %al,(%rax)
  4022e7:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4022ea:	00 00                	add    %al,(%rax)
  4022ec:	64 00 00             	add    %al,%fs:(%rax)
  4022ef:	00 4c ec ff          	add    %cl,-0x1(%rsp,%rbp,8)
  4022f3:	ff 20                	jmpq   *(%rax)
  4022f5:	00 00                	add    %al,(%rax)
  4022f7:	00 00                	add    %al,(%rax)
  4022f9:	44 0e                	rex.R (bad) 
  4022fb:	10 54 0a 0e          	adc    %dl,0xe(%rdx,%rcx,1)
  4022ff:	08 41 0b             	or     %al,0xb(%rcx)
  402302:	00 00                	add    %al,(%rax)
  402304:	00 00                	add    %al,(%rax)
  402306:	00 00                	add    %al,(%rax)
  402308:	24 00                	and    $0x0,%al
  40230a:	00 00                	add    %al,(%rax)
  40230c:	84 00                	test   %al,(%rax)
  40230e:	00 00                	add    %al,(%rax)
  402310:	4c ec                	rex.WR in (%dx),%al
  402312:	ff                   	(bad)  
  402313:	ff                   	(bad)  
  402314:	3e 00 00             	add    %al,%ds:(%rax)
  402317:	00 00                	add    %al,(%rax)
  402319:	41 0e                	rex.B (bad) 
  40231b:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
  402321:	83 03 44             	addl   $0x44,(%rbx)
  402324:	0e                   	(bad)  
  402325:	40 75 0e             	rex jne 402336 <__GNU_EH_FRAME_HDR+0x1ae>
  402328:	18 41 0e             	sbb    %al,0xe(%rcx)
  40232b:	10 41 0e             	adc    %al,0xe(%rcx)
  40232e:	08 00                	or     %al,(%rax)
  402330:	1c 00                	sbb    $0x0,%al
  402332:	00 00                	add    %al,(%rax)
  402334:	ac                   	lods   %ds:(%rsi),%al
  402335:	00 00                	add    %al,(%rax)
  402337:	00 62 ec             	add    %ah,-0x14(%rdx)
  40233a:	ff                   	(bad)  
  40233b:	ff c6                	inc    %esi
  40233d:	00 00                	add    %al,(%rax)
  40233f:	00 00                	add    %al,(%rax)
  402341:	44 0e                	rex.R (bad) 
  402343:	20 02                	and    %al,(%rdx)
  402345:	8b 0a                	mov    (%rdx),%ecx
  402347:	0e                   	(bad)  
  402348:	08 41 0b             	or     %al,0xb(%rcx)
  40234b:	00 00                	add    %al,(%rax)
  40234d:	00 00                	add    %al,(%rax)
  40234f:	00 1c 00             	add    %bl,(%rax,%rax,1)
  402352:	00 00                	add    %al,(%rax)
  402354:	cc                   	int3   
  402355:	00 00                	add    %al,(%rax)
  402357:	00 08                	add    %cl,(%rax)
  402359:	ed                   	in     (%dx),%eax
  40235a:	ff                   	(bad)  
  40235b:	ff 85 00 00 00 00    	incl   0x0(%rbp)
  402361:	44 0e                	rex.R (bad) 
  402363:	20 02                	and    %al,(%rdx)
  402365:	79 0a                	jns    402371 <__GNU_EH_FRAME_HDR+0x1e9>
  402367:	0e                   	(bad)  
  402368:	08 41 0b             	or     %al,0xb(%rcx)
  40236b:	00 00                	add    %al,(%rax)
  40236d:	00 00                	add    %al,(%rax)
  40236f:	00 14 00             	add    %dl,(%rax,%rax,1)
  402372:	00 00                	add    %al,(%rax)
  402374:	ec                   	in     (%dx),%al
  402375:	00 00                	add    %al,(%rax)
  402377:	00 6d ed             	add    %ch,-0x13(%rbp)
  40237a:	ff                   	(bad)  
  40237b:	ff 57 00             	callq  *0x0(%rdi)
  40237e:	00 00                	add    %al,(%rax)
  402380:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  402384:	00 00                	add    %al,(%rax)
  402386:	00 00                	add    %al,(%rax)
  402388:	14 00                	adc    $0x0,%al
  40238a:	00 00                	add    %al,(%rax)
  40238c:	04 01                	add    $0x1,%al
  40238e:	00 00                	add    %al,(%rax)
  402390:	ac                   	lods   %ds:(%rsi),%al
  402391:	ed                   	in     (%dx),%eax
  402392:	ff                   	(bad)  
  402393:	ff 22                	jmpq   *(%rdx)
  402395:	00 00                	add    %al,(%rax)
  402397:	00 00                	add    %al,(%rax)
  402399:	44 0e                	rex.R (bad) 
  40239b:	10 00                	adc    %al,(%rax)
  40239d:	00 00                	add    %al,(%rax)
  40239f:	00 14 00             	add    %dl,(%rax,%rax,1)
  4023a2:	00 00                	add    %al,(%rax)
  4023a4:	1c 01                	sbb    $0x1,%al
  4023a6:	00 00                	add    %al,(%rax)
  4023a8:	b6 ed                	mov    $0xed,%dh
  4023aa:	ff                   	(bad)  
  4023ab:	ff 1e                	lcall  *(%rsi)
	...
  4023b5:	00 00                	add    %al,(%rax)
  4023b7:	00 2c 00             	add    %ch,(%rax,%rax,1)
  4023ba:	00 00                	add    %al,(%rax)
  4023bc:	34 01                	xor    $0x1,%al
  4023be:	00 00                	add    %al,(%rax)
  4023c0:	bc ed ff ff 67       	mov    $0x67ffffed,%esp
  4023c5:	00 00                	add    %al,(%rax)
  4023c7:	00 00                	add    %al,(%rax)
  4023c9:	42 0e                	rex.X (bad) 
  4023cb:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
  4023d2:	03 41 0e             	add    0xe(%rcx),%eax
  4023d5:	20 83 04 63 0a 0e    	and    %al,0xe0a6304(%rbx)
  4023db:	18 41 0e             	sbb    %al,0xe(%rcx)
  4023de:	10 42 0e             	adc    %al,0xe(%rdx)
  4023e1:	08 41 0b             	or     %al,0xb(%rcx)
  4023e4:	00 00                	add    %al,(%rax)
  4023e6:	00 00                	add    %al,(%rax)
  4023e8:	34 00                	xor    $0x0,%al
  4023ea:	00 00                	add    %al,(%rax)
  4023ec:	64 01 00             	add    %eax,%fs:(%rax)
  4023ef:	00 f3                	add    %dh,%bl
  4023f1:	ed                   	in     (%dx),%eax
  4023f2:	ff                   	(bad)  
  4023f3:	ff cb                	dec    %ebx
  4023f5:	00 00                	add    %al,(%rax)
  4023f7:	00 00                	add    %al,(%rax)
  4023f9:	42 0e                	rex.X (bad) 
  4023fb:	10 8c 02 41 0e 18 86 	adc    %cl,-0x79e7f1bf(%rdx,%rax,1)
  402402:	03 41 0e             	add    0xe(%rcx),%eax
  402405:	20 83 04 44 0e 30    	and    %al,0x300e4404(%rbx)
  40240b:	02 7c 0a 0e          	add    0xe(%rdx,%rcx,1),%bh
  40240f:	20 41 0e             	and    %al,0xe(%rcx)
  402412:	18 41 0e             	sbb    %al,0xe(%rcx)
  402415:	10 42 0e             	adc    %al,0xe(%rdx)
  402418:	08 41 0b             	or     %al,0xb(%rcx)
  40241b:	00 00                	add    %al,(%rax)
  40241d:	00 00                	add    %al,(%rax)
  40241f:	00 14 00             	add    %dl,(%rax,%rax,1)
  402422:	00 00                	add    %al,(%rax)
  402424:	9c                   	pushfq 
  402425:	01 00                	add    %eax,(%rax)
  402427:	00 86 ee ff ff 32    	add    %al,0x32ffffee(%rsi)
  40242d:	00 00                	add    %al,(%rax)
  40242f:	00 00                	add    %al,(%rax)
  402431:	44 0e                	rex.R (bad) 
  402433:	10 6d 0e             	adc    %ch,0xe(%rbp)
  402436:	08 00                	or     %al,(%rax)
  402438:	24 00                	and    $0x0,%al
  40243a:	00 00                	add    %al,(%rax)
  40243c:	b4 01                	mov    $0x1,%ah
  40243e:	00 00                	add    %al,(%rax)
  402440:	a0 ee ff ff 3b 00 00 	movabs 0x3bffffee,%al
  402447:	00 00 
  402449:	41 0e                	rex.B (bad) 
  40244b:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
  402451:	83 03 44             	addl   $0x44,(%rbx)
  402454:	0e                   	(bad)  
  402455:	20 72 0e             	and    %dh,0xe(%rdx)
  402458:	18 41 0e             	sbb    %al,0xe(%rcx)
  40245b:	10 41 0e             	adc    %al,0xe(%rcx)
  40245e:	08 00                	or     %al,(%rax)
  402460:	24 00                	and    $0x0,%al
  402462:	00 00                	add    %al,(%rax)
  402464:	dc 01                	faddl  (%rcx)
  402466:	00 00                	add    %al,(%rax)
  402468:	b3 ee                	mov    $0xee,%bl
  40246a:	ff                   	(bad)  
  40246b:	ff 4e 00             	decl   0x0(%rsi)
  40246e:	00 00                	add    %al,(%rax)
  402470:	00 41 0e             	add    %al,0xe(%rcx)
  402473:	10 86 02 41 0e 18    	adc    %al,0x180e4102(%rsi)
  402479:	83 03 44             	addl   $0x44,(%rbx)
  40247c:	0e                   	(bad)  
  40247d:	20 02                	and    %al,(%rdx)
  40247f:	45 0e                	rex.RB (bad) 
  402481:	18 41 0e             	sbb    %al,0xe(%rcx)
  402484:	10 41 0e             	adc    %al,0xe(%rcx)
  402487:	08 3c 00             	or     %bh,(%rax,%rax,1)
  40248a:	00 00                	add    %al,(%rax)
  40248c:	04 02                	add    $0x2,%al
  40248e:	00 00                	add    %al,(%rax)
  402490:	d9 ee                	fldz   
  402492:	ff                   	(bad)  
  402493:	ff 60 00             	jmpq   *0x0(%rax)
  402496:	00 00                	add    %al,(%rax)
  402498:	00 42 0e             	add    %al,0xe(%rdx)
  40249b:	10 8e 02 42 0e 18    	adc    %cl,0x180e4202(%rsi)
  4024a1:	8d 03                	lea    (%rbx),%eax
  4024a3:	42 0e                	rex.X (bad) 
  4024a5:	20 8c 04 41 0e 28 86 	and    %cl,-0x79d7f1bf(%rsp,%rax,1)
  4024ac:	05 41 0e 30 83       	add    $0x83300e41,%eax
  4024b1:	06                   	(bad)  
  4024b2:	02 47 0a             	add    0xa(%rdi),%al
  4024b5:	0e                   	(bad)  
  4024b6:	28 41 0e             	sub    %al,0xe(%rcx)
  4024b9:	20 42 0e             	and    %al,0xe(%rdx)
  4024bc:	18 42 0e             	sbb    %al,0xe(%rdx)
  4024bf:	10 42 0e             	adc    %al,0xe(%rdx)
  4024c2:	08 41 0b             	or     %al,0xb(%rcx)
  4024c5:	00 00                	add    %al,(%rax)
  4024c7:	00 64 00 00          	add    %ah,0x0(%rax,%rax,1)
  4024cb:	00 44 02 00          	add    %al,0x0(%rdx,%rax,1)
  4024cf:	00 f9                	add    %bh,%cl
  4024d1:	ee                   	out    %al,(%dx)
  4024d2:	ff                   	(bad)  
  4024d3:	ff 43 03             	incl   0x3(%rbx)
  4024d6:	00 00                	add    %al,(%rax)
  4024d8:	00 42 0e             	add    %al,0xe(%rdx)
  4024db:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  4024e1:	8e 03                	mov    (%rbx),%es
  4024e3:	42 0e                	rex.X (bad) 
  4024e5:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  4024eb:	8c 05 41 0e 30 86    	mov    %es,-0x79cff1bf(%rip)        # ffffffff86703332 <_end+0xffffffff860ff702>
  4024f1:	06                   	(bad)  
  4024f2:	41 0e                	rex.B (bad) 
  4024f4:	38 83 07 47 0e a0    	cmp    %al,-0x5ff1b8f9(%rbx)
  4024fa:	49 03 2c 01          	add    (%r9,%rax,1),%rbp
  4024fe:	0e                   	(bad)  
  4024ff:	a8 49                	test   $0x49,%al
  402501:	47 0e                	rex.RXB (bad) 
  402503:	b0 49                	mov    $0x49,%al
  402505:	7a 0e                	jp     402515 <__GNU_EH_FRAME_HDR+0x38d>
  402507:	a0 49 7a 0e a8 49 41 	movabs 0xb00e4149a80e7a49,%al
  40250e:	0e b0 
  402510:	49 76 0e             	rex.WB jbe 402521 <__GNU_EH_FRAME_HDR+0x399>
  402513:	a0 49 02 63 0a 0e 38 	movabs 0xe41380e0a630249,%al
  40251a:	41 0e 
  40251c:	30 41 0e             	xor    %al,0xe(%rcx)
  40251f:	28 42 0e             	sub    %al,0xe(%rdx)
  402522:	20 42 0e             	and    %al,0xe(%rdx)
  402525:	18 42 0e             	sbb    %al,0xe(%rdx)
  402528:	10 42 0e             	adc    %al,0xe(%rdx)
  40252b:	08 41 0b             	or     %al,0xb(%rcx)
  40252e:	00 00                	add    %al,(%rax)
  402530:	64 00 00             	add    %al,%fs:(%rax)
  402533:	00 ac 02 00 00 d4 f1 	add    %ch,-0xe2c0000(%rdx,%rax,1)
  40253a:	ff                   	(bad)  
  40253b:	ff 80 02 00 00 00    	incl   0x2(%rax)
  402541:	42 0e                	rex.X (bad) 
  402543:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  402549:	8e 03                	mov    (%rbx),%es
  40254b:	42 0e                	rex.X (bad) 
  40254d:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  402553:	8c 05 41 0e 30 86    	mov    %es,-0x79cff1bf(%rip)        # ffffffff8670339a <_end+0xffffffff860ff76a>
  402559:	06                   	(bad)  
  40255a:	41 0e                	rex.B (bad) 
  40255c:	38 83 07 44 0e a0    	cmp    %al,-0x5ff1bbf9(%rbx)
  402562:	01 02                	add    %eax,(%rdx)
  402564:	9b                   	fwait
  402565:	0e                   	(bad)  
  402566:	a8 01                	test   $0x1,%al
  402568:	47 0e                	rex.RXB (bad) 
  40256a:	b0 01                	mov    $0x1,%al
  40256c:	6a 0e                	pushq  $0xe
  40256e:	a0 01 7d 0e a8 01 41 	movabs 0xb00e4101a80e7d01,%al
  402575:	0e b0 
  402577:	01 63 0e             	add    %esp,0xe(%rbx)
  40257a:	a0 01 02 87 0a 0e 38 	movabs 0xe41380e0a870201,%al
  402581:	41 0e 
  402583:	30 41 0e             	xor    %al,0xe(%rcx)
  402586:	28 42 0e             	sub    %al,0xe(%rdx)
  402589:	20 42 0e             	and    %al,0xe(%rdx)
  40258c:	18 42 0e             	sbb    %al,0xe(%rdx)
  40258f:	10 42 0e             	adc    %al,0xe(%rdx)
  402592:	08 41 0b             	or     %al,0xb(%rcx)
  402595:	00 00                	add    %al,(%rax)
  402597:	00 14 00             	add    %dl,(%rax,%rax,1)
  40259a:	00 00                	add    %al,(%rax)
  40259c:	14 03                	adc    $0x3,%al
  40259e:	00 00                	add    %al,(%rax)
  4025a0:	ec                   	in     (%dx),%al
  4025a1:	f3 ff                	repz (bad) 
  4025a3:	ff                   	(bad)  
  4025a4:	3c 00                	cmp    $0x0,%al
  4025a6:	00 00                	add    %al,(%rax)
  4025a8:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  4025ac:	00 00                	add    %al,(%rax)
  4025ae:	00 00                	add    %al,(%rax)
  4025b0:	24 00                	and    $0x0,%al
  4025b2:	00 00                	add    %al,(%rax)
  4025b4:	2c 03                	sub    $0x3,%al
  4025b6:	00 00                	add    %al,(%rax)
  4025b8:	10 f4                	adc    %dh,%ah
  4025ba:	ff                   	(bad)  
  4025bb:	ff 41 00             	incl   0x0(%rcx)
  4025be:	00 00                	add    %al,(%rax)
  4025c0:	00 44 0e 10          	add    %al,0x10(%rsi,%rcx,1)
  4025c4:	4c 0e                	rex.WR (bad) 
  4025c6:	18 45 0e             	sbb    %al,0xe(%rbp)
  4025c9:	20 5d 0e             	and    %bl,0xe(%rbp)
  4025cc:	10 49 0a             	adc    %cl,0xa(%rcx)
  4025cf:	0e                   	(bad)  
  4025d0:	08 41 0b             	or     %al,0xb(%rcx)
  4025d3:	00 00                	add    %al,(%rax)
  4025d5:	00 00                	add    %al,(%rax)
  4025d7:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4025da:	00 00                	add    %al,(%rax)
  4025dc:	54                   	push   %rsp
  4025dd:	03 00                	add    (%rax),%eax
  4025df:	00 29                	add    %ch,(%rcx)
  4025e1:	f4                   	hlt    
  4025e2:	ff                   	(bad)  
  4025e3:	ff 01                	incl   (%rcx)
  4025e5:	01 00                	add    %eax,(%rax)
  4025e7:	00 00                	add    %al,(%rax)
  4025e9:	44 0e                	rex.R (bad) 
  4025eb:	10 02                	adc    %al,(%rdx)
  4025ed:	7d 0a                	jge    4025f9 <__GNU_EH_FRAME_HDR+0x471>
  4025ef:	0e                   	(bad)  
  4025f0:	08 41 0b             	or     %al,0xb(%rcx)
  4025f3:	00 00                	add    %al,(%rax)
  4025f5:	00 00                	add    %al,(%rax)
  4025f7:	00 2c 00             	add    %ch,(%rax,%rax,1)
  4025fa:	00 00                	add    %al,(%rax)
  4025fc:	74 03                	je     402601 <__GNU_EH_FRAME_HDR+0x479>
  4025fe:	00 00                	add    %al,(%rax)
  402600:	0a f5                	or     %ch,%dh
  402602:	ff                   	(bad)  
  402603:	ff                   	(bad)  
  402604:	ba 00 00 00 00       	mov    $0x0,%edx
  402609:	44 0e                	rex.R (bad) 
  40260b:	80 01 57             	addb   $0x57,(%rcx)
  40260e:	0a 0e                	or     (%rsi),%cl
  402610:	08 41 0b             	or     %al,0xb(%rcx)
  402613:	4e 0e                	rex.WRX (bad) 
  402615:	88 01                	mov    %al,(%rcx)
  402617:	46 0e                	rex.RX (bad) 
  402619:	90                   	nop
  40261a:	01 46 0e             	add    %eax,0xe(%rsi)
  40261d:	98                   	cwtl   
  40261e:	01 46 0e             	add    %eax,0xe(%rsi)
  402621:	a0 01 66 0e 80 01 00 	movabs 0x440001800e6601,%al
  402628:	44 00 
  40262a:	00 00                	add    %al,(%rax)
  40262c:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  40262d:	03 00                	add    (%rax),%eax
  40262f:	00 a0 f5 ff ff 65    	add    %ah,0x65fffff5(%rax)
  402635:	00 00                	add    %al,(%rax)
  402637:	00 00                	add    %al,(%rax)
  402639:	42 0e                	rex.X (bad) 
  40263b:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  402641:	8e 03                	mov    (%rbx),%es
  402643:	45 0e                	rex.RB (bad) 
  402645:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  40264b:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86703499 <_end+0xffffffff860ff869>
  402651:	06                   	(bad)  
  402652:	48 0e                	rex.W (bad) 
  402654:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  40265a:	72 0e                	jb     40266a <__GNU_EH_FRAME_HDR+0x4e2>
  40265c:	38 41 0e             	cmp    %al,0xe(%rcx)
  40265f:	30 41 0e             	xor    %al,0xe(%rcx)
  402662:	28 42 0e             	sub    %al,0xe(%rdx)
  402665:	20 42 0e             	and    %al,0xe(%rdx)
  402668:	18 42 0e             	sbb    %al,0xe(%rdx)
  40266b:	10 42 0e             	adc    %al,0xe(%rdx)
  40266e:	08 00                	or     %al,(%rax)
  402670:	14 00                	adc    $0x0,%al
  402672:	00 00                	add    %al,(%rax)
  402674:	ec                   	in     (%dx),%al
  402675:	03 00                	add    (%rax),%eax
  402677:	00 c8                	add    %cl,%al
  402679:	f5                   	cmc    
  40267a:	ff                   	(bad)  
  40267b:	ff 02                	incl   (%rdx)
	...

0000000000402688 <__FRAME_END__>:
  402688:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000602e08 <__frame_dummy_init_array_entry>:
  602e08:	20 0e                	and    %cl,(%rsi)
  602e0a:	40 00 00             	add    %al,(%rax)
  602e0d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000602e10 <__do_global_dtors_aux_fini_array_entry>:
  602e10:	00 0e                	add    %cl,(%rsi)
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
  602e38:	30 0b                	xor    %cl,(%rbx)
  602e3a:	40 00 00             	add    %al,(%rax)
  602e3d:	00 00                	add    %al,(%rax)
  602e3f:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 602e45 <_DYNAMIC+0x25>
  602e45:	00 00                	add    %al,(%rax)
  602e47:	00 44 1c 40          	add    %al,0x40(%rsp,%rbx,1)
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
  602ea7:	00 20                	add    %ah,(%rax)
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
  602ec8:	3a 01                	cmp    (%rcx),%al
  602eca:	00 00                	add    %al,(%rax)
  602ecc:	00 00                	add    %al,(%rax)
  602ece:	00 00                	add    %al,(%rax)
  602ed0:	0b 00                	or     (%rax),%eax
  602ed2:	00 00                	add    %al,(%rax)
  602ed4:	00 00                	add    %al,(%rax)
  602ed6:	00 00                	add    %al,(%rax)
  602ed8:	18 00                	sbb    %al,(%rax)
  602eda:	00 00                	add    %al,(%rax)
  602edc:	00 00                	add    %al,(%rax)
  602ede:	00 00                	add    %al,(%rax)
  602ee0:	15 00 00 00 00       	adc    $0x0,%eax
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
  602f08:	e8 02 00 00 00       	callq  602f0f <_DYNAMIC+0xef>
  602f0d:	00 00                	add    %al,(%rax)
  602f0f:	00 14 00             	add    %dl,(%rax,%rax,1)
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
  602f27:	00 48 08             	add    %cl,0x8(%rax)
  602f2a:	40 00 00             	add    %al,(%rax)
  602f2d:	00 00                	add    %al,(%rax)
  602f2f:	00 07                	add    %al,(%rdi)
  602f31:	00 00                	add    %al,(%rax)
  602f33:	00 00                	add    %al,(%rax)
  602f35:	00 00                	add    %al,(%rax)
  602f37:	00 e8                	add    %ch,%al
  602f39:	07                   	(bad)  
  602f3a:	40 00 00             	add    %al,(%rax)
  602f3d:	00 00                	add    %al,(%rax)
  602f3f:	00 08                	add    %cl,(%rax)
  602f41:	00 00                	add    %al,(%rax)
  602f43:	00 00                	add    %al,(%rax)
  602f45:	00 00                	add    %al,(%rax)
  602f47:	00 60 00             	add    %ah,0x0(%rax)
  602f4a:	00 00                	add    %al,(%rax)
  602f4c:	00 00                	add    %al,(%rax)
  602f4e:	00 00                	add    %al,(%rax)
  602f50:	09 00                	or     %eax,(%rax)
  602f52:	00 00                	add    %al,(%rax)
  602f54:	00 00                	add    %al,(%rax)
  602f56:	00 00                	add    %al,(%rax)
  602f58:	18 00                	sbb    %al,(%rax)
  602f5a:	00 00                	add    %al,(%rax)
  602f5c:	00 00                	add    %al,(%rax)
  602f5e:	00 00                	add    %al,(%rax)
  602f60:	fe                   	(bad)  
  602f61:	ff                   	(bad)  
  602f62:	ff 6f 00             	ljmp   *0x0(%rdi)
  602f65:	00 00                	add    %al,(%rax)
  602f67:	00 a8 07 40 00 00    	add    %ch,0x4007(%rax)
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
  602f87:	00 5a 07             	add    %bl,0x7(%rdx)
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
  603017:	00 66 0b             	add    %ah,0xb(%rsi)
  60301a:	40 00 00             	add    %al,(%rax)
  60301d:	00 00                	add    %al,(%rax)
  60301f:	00 76 0b             	add    %dh,0xb(%rsi)
  603022:	40 00 00             	add    %al,(%rax)
  603025:	00 00                	add    %al,(%rax)
  603027:	00 86 0b 40 00 00    	add    %al,0x400b(%rsi)
  60302d:	00 00                	add    %al,(%rax)
  60302f:	00 96 0b 40 00 00    	add    %dl,0x400b(%rsi)
  603035:	00 00                	add    %al,(%rax)
  603037:	00 a6 0b 40 00 00    	add    %ah,0x400b(%rsi)
  60303d:	00 00                	add    %al,(%rax)
  60303f:	00 b6 0b 40 00 00    	add    %dh,0x400b(%rsi)
  603045:	00 00                	add    %al,(%rax)
  603047:	00 c6                	add    %al,%dh
  603049:	0b 40 00             	or     0x0(%rax),%eax
  60304c:	00 00                	add    %al,(%rax)
  60304e:	00 00                	add    %al,(%rax)
  603050:	d6                   	(bad)  
  603051:	0b 40 00             	or     0x0(%rax),%eax
  603054:	00 00                	add    %al,(%rax)
  603056:	00 00                	add    %al,(%rax)
  603058:	e6 0b                	out    %al,$0xb
  60305a:	40 00 00             	add    %al,(%rax)
  60305d:	00 00                	add    %al,(%rax)
  60305f:	00 f6                	add    %dh,%dh
  603061:	0b 40 00             	or     0x0(%rax),%eax
  603064:	00 00                	add    %al,(%rax)
  603066:	00 00                	add    %al,(%rax)
  603068:	06                   	(bad)  
  603069:	0c 40                	or     $0x40,%al
  60306b:	00 00                	add    %al,(%rax)
  60306d:	00 00                	add    %al,(%rax)
  60306f:	00 16                	add    %dl,(%rsi)
  603071:	0c 40                	or     $0x40,%al
  603073:	00 00                	add    %al,(%rax)
  603075:	00 00                	add    %al,(%rax)
  603077:	00 26                	add    %ah,(%rsi)
  603079:	0c 40                	or     $0x40,%al
  60307b:	00 00                	add    %al,(%rax)
  60307d:	00 00                	add    %al,(%rax)
  60307f:	00 36                	add    %dh,(%rsi)
  603081:	0c 40                	or     $0x40,%al
  603083:	00 00                	add    %al,(%rax)
  603085:	00 00                	add    %al,(%rax)
  603087:	00 46 0c             	add    %al,0xc(%rsi)
  60308a:	40 00 00             	add    %al,(%rax)
  60308d:	00 00                	add    %al,(%rax)
  60308f:	00 56 0c             	add    %dl,0xc(%rsi)
  603092:	40 00 00             	add    %al,(%rax)
  603095:	00 00                	add    %al,(%rax)
  603097:	00 66 0c             	add    %ah,0xc(%rsi)
  60309a:	40 00 00             	add    %al,(%rax)
  60309d:	00 00                	add    %al,(%rax)
  60309f:	00 76 0c             	add    %dh,0xc(%rsi)
  6030a2:	40 00 00             	add    %al,(%rax)
  6030a5:	00 00                	add    %al,(%rax)
  6030a7:	00 86 0c 40 00 00    	add    %al,0x400c(%rsi)
  6030ad:	00 00                	add    %al,(%rax)
  6030af:	00 96 0c 40 00 00    	add    %dl,0x400c(%rsi)
  6030b5:	00 00                	add    %al,(%rax)
  6030b7:	00 a6 0c 40 00 00    	add    %ah,0x400c(%rsi)
  6030bd:	00 00                	add    %al,(%rax)
  6030bf:	00 b6 0c 40 00 00    	add    %dh,0x400c(%rsi)
  6030c5:	00 00                	add    %al,(%rax)
  6030c7:	00 c6                	add    %al,%dh
  6030c9:	0c 40                	or     $0x40,%al
  6030cb:	00 00                	add    %al,(%rax)
  6030cd:	00 00                	add    %al,(%rax)
  6030cf:	00 d6                	add    %dl,%dh
  6030d1:	0c 40                	or     $0x40,%al
  6030d3:	00 00                	add    %al,(%rax)
  6030d5:	00 00                	add    %al,(%rax)
  6030d7:	00 e6                	add    %ah,%dh
  6030d9:	0c 40                	or     $0x40,%al
  6030db:	00 00                	add    %al,(%rax)
  6030dd:	00 00                	add    %al,(%rax)
  6030df:	00 f6                	add    %dh,%dh
  6030e1:	0c 40                	or     $0x40,%al
  6030e3:	00 00                	add    %al,(%rax)
  6030e5:	00 00                	add    %al,(%rax)
  6030e7:	00 06                	add    %al,(%rsi)
  6030e9:	0d 40 00 00 00       	or     $0x40,%eax
  6030ee:	00 00                	add    %al,(%rax)
  6030f0:	16                   	(bad)  
  6030f1:	0d 40 00 00 00       	or     $0x40,%eax
  6030f6:	00 00                	add    %al,(%rax)
  6030f8:	26 0d 40 00 00 00    	es or  $0x40,%eax
  6030fe:	00 00                	add    %al,(%rax)
  603100:	36 0d 40 00 00 00    	ss or  $0x40,%eax
  603106:	00 00                	add    %al,(%rax)
  603108:	46 0d 40 00 00 00    	rex.RX or $0x40,%eax
	...

Disassembly of section .data:

0000000000603120 <__data_start>:
	...

0000000000603128 <__dso_handle>:
	...

0000000000603140 <lab_id>:
  603140:	53                   	push   %rbx
  603141:	45 31 39             	xor    %r15d,(%r9)
  603144:	32 30                	xor    (%rax),%dh
  603146:	32 30                	xor    (%rax),%dh
  603148:	4f 6e                	rex.WRXB outsb %ds:(%rsi),(%dx)
  60314a:	6c                   	insb   (%dx),%es:(%rdi)
  60314b:	69 6e 65 00 00 00 00 	imul   $0x0,0x65(%rsi),%ebp
	...

0000000000603540 <bomb_id>:
  603540:	d9 4d 34             	(bad)  0x34(%rbp)
  603543:	01                   	.byte 0x1

Disassembly of section .bss:

0000000000603560 <stdout@@GLIBC_2.2.5>:
	...

0000000000603570 <stdin@@GLIBC_2.2.5>:
	...

0000000000603578 <completed.6972>:
  603578:	00 00                	add    %al,(%rax)
	...

000000000060357c <num_input_strings>:
  60357c:	00 00                	add    %al,(%rax)
	...

0000000000603580 <infile>:
	...

00000000006035a0 <input_strings>:
	...

0000000000603be0 <scratch>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 44 65 62          	sub    %al,0x62(%rbp,%riz,2)
   9:	69 61 6e 20 36 2e 33 	imul   $0x332e3620,0x6e(%rcx),%esp
  10:	2e 30 2d 31 38 2b 64 	xor    %ch,%cs:0x642b3831(%rip)        # 642b3848 <_end+0x63cafc18>
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
  10:	46 0e                	rex.RX (bad) 
  12:	40 00 00             	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 f6                	add    %dh,%dh
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	be 05 00 00 04       	mov    $0x4000005,%esi
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	00 08                	add    %cl,(%rax)
   b:	01 d9                	add    %ebx,%ecx
   d:	02 00                	add    (%rax),%al
   f:	00 0c 71             	add    %cl,(%rcx,%rsi,2)
  12:	00 00                	add    %al,(%rax)
  14:	00 4f 02             	add    %cl,0x2(%rdi)
  17:	00 00                	add    %al,(%rax)
  19:	46 0e                	rex.RX (bad) 
  1b:	40 00 00             	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 f6                	add    %dh,%dh
	...
  2a:	00 00                	add    %al,(%rax)
  2c:	00 02                	add    %al,(%rdx)
  2e:	4d 00 00             	rex.WRB add %r8b,(%r8)
  31:	00 02                	add    %al,(%rdx)
  33:	d8 38                	fdivrs (%rax)
  35:	00 00                	add    %al,(%rax)
  37:	00 03                	add    %al,(%rbx)
  39:	08 07                	or     %al,(%rdi)
  3b:	c4 01 00 00          	(bad)  
  3f:	03 01                	add    (%rcx),%eax
  41:	08 27                	or     %ah,(%rdi)
  43:	01 00                	add    %eax,(%rax)
  45:	00 03                	add    %al,(%rbx)
  47:	02 07                	add    (%rdi),%al
  49:	83 01 00             	addl   $0x0,(%rcx)
  4c:	00 03                	add    %al,(%rbx)
  4e:	04 07                	add    $0x7,%al
  50:	c9                   	leaveq 
  51:	01 00                	add    %eax,(%rax)
  53:	00 03                	add    %al,(%rbx)
  55:	01 06                	add    %eax,(%rsi)
  57:	29 01                	sub    %eax,(%rcx)
  59:	00 00                	add    %al,(%rax)
  5b:	03 02                	add    (%rdx),%eax
  5d:	05 43 00 00 00       	add    $0x43,%eax
  62:	04 04                	add    $0x4,%al
  64:	05 69 6e 74 00       	add    $0x746e69,%eax
  69:	03 08                	add    (%rax),%ecx
  6b:	05 c1 00 00 00       	add    $0xc1,%eax
  70:	02 fe                	add    %dh,%bh
  72:	01 00                	add    %eax,(%rax)
  74:	00 03                	add    %al,(%rbx)
  76:	83 69 00 00          	subl   $0x0,0x0(%rcx)
  7a:	00 02                	add    %al,(%rdx)
  7c:	f4                   	hlt    
  7d:	01 00                	add    %eax,(%rax)
  7f:	00 03                	add    %al,(%rbx)
  81:	84 69 00             	test   %ch,0x0(%rcx)
  84:	00 00                	add    %al,(%rax)
  86:	03 08                	add    (%rax),%ecx
  88:	07                   	(bad)  
  89:	5a                   	pop    %rdx
  8a:	00 00                	add    %al,(%rax)
  8c:	00 05 08 06 08 95    	add    %al,-0x6af7f9f8(%rip)        # ffffffff9508069a <_end+0xffffffff94a7ca6a>
  92:	00 00                	add    %al,(%rax)
  94:	00 03                	add    %al,(%rbx)
  96:	01 06                	add    %eax,(%rsi)
  98:	30 01                	xor    %al,(%rcx)
  9a:	00 00                	add    %al,(%rax)
  9c:	07                   	(bad)  
  9d:	95                   	xchg   %eax,%ebp
  9e:	00 00                	add    %al,(%rax)
  a0:	00 02                	add    %al,(%rdx)
  a2:	22 01                	and    (%rcx),%al
  a4:	00 00                	add    %al,(%rax)
  a6:	04 30                	add    $0x30,%al
  a8:	ac                   	lods   %ds:(%rsi),%al
  a9:	00 00                	add    %al,(%rax)
  ab:	00 08                	add    %cl,(%rax)
  ad:	1e                   	(bad)  
  ae:	01 00                	add    %eax,(%rax)
  b0:	00 d8                	add    %bl,%al
  b2:	05 f1 29 02 00       	add    $0x229f1,%eax
  b7:	00 09                	add    %cl,(%rcx)
  b9:	b0 02                	mov    $0x2,%al
  bb:	00 00                	add    %al,(%rax)
  bd:	05 f2 62 00 00       	add    $0x62f2,%eax
  c2:	00 00                	add    %al,(%rax)
  c4:	09 76 01             	or     %esi,0x1(%rsi)
  c7:	00 00                	add    %al,(%rax)
  c9:	05 f7 8f 00 00       	add    $0x8ff7,%eax
  ce:	00 08                	add    %cl,(%rax)
  d0:	09 95 00 00 00 05    	or     %edx,0x5000000(%rbp)
  d6:	f8                   	clc    
  d7:	8f 00                	popq   (%rax)
  d9:	00 00                	add    %al,(%rax)
  db:	10 09                	adc    %cl,(%rcx)
  dd:	41 02 00             	add    (%r8),%al
  e0:	00 05 f9 8f 00 00    	add    %al,0x8ff9(%rip)        # 90df <_init-0x3f7a51>
  e6:	00 18                	add    %bl,(%rax)
  e8:	09 5e 01             	or     %ebx,0x1(%rsi)
  eb:	00 00                	add    %al,(%rax)
  ed:	05 fa 8f 00 00       	add    $0x8ffa,%eax
  f2:	00 20                	add    %ah,(%rax)
  f4:	09 63 00             	or     %esp,0x0(%rbx)
  f7:	00 00                	add    %al,(%rax)
  f9:	05 fb 8f 00 00       	add    $0x8ffb,%eax
  fe:	00 28                	add    %ch,(%rax)
 100:	09 e6                	or     %esp,%esi
 102:	01 00                	add    %eax,(%rax)
 104:	00 05 fc 8f 00 00    	add    %al,0x8ffc(%rip)        # 9106 <_init-0x3f7a2a>
 10a:	00 30                	add    %dh,(%rax)
 10c:	09 78 00             	or     %edi,0x0(%rax)
 10f:	00 00                	add    %al,(%rax)
 111:	05 fd 8f 00 00       	add    $0x8ffd,%eax
 116:	00 38                	add    %bh,(%rax)
 118:	09 00                	or     %eax,(%rax)
 11a:	00 00                	add    %al,(%rax)
 11c:	00 05 fe 8f 00 00    	add    %al,0x8ffe(%rip)        # 9120 <_init-0x3f7a10>
 122:	00 40 0a             	add    %al,0xa(%rax)
 125:	8e 02                	mov    (%rdx),%es
 127:	00 00                	add    %al,(%rax)
 129:	05 00 01 8f 00       	add    $0x8f0100,%eax
 12e:	00 00                	add    %al,(%rax)
 130:	48 0a 1d 02 00 00 05 	rex.W or 0x5000002(%rip),%bl        # 5000139 <_end+0x49fc509>
 137:	01 01                	add    %eax,(%rcx)
 139:	8f 00                	popq   (%rax)
 13b:	00 00                	add    %al,(%rax)
 13d:	50                   	push   %rax
 13e:	0a 36                	or     (%rsi),%dh
 140:	00 00                	add    %al,(%rax)
 142:	00 05 02 01 8f 00    	add    %al,0x8f0102(%rip)        # 8f024a <_end+0x2ec61a>
 148:	00 00                	add    %al,(%rax)
 14a:	58                   	pop    %rax
 14b:	0a 8c 00 00 00 05 04 	or     0x4050000(%rax,%rax,1),%cl
 152:	01 61 02             	add    %esp,0x2(%rcx)
 155:	00 00                	add    %al,(%rax)
 157:	60                   	(bad)  
 158:	0a 06                	or     (%rsi),%al
 15a:	02 00                	add    (%rax),%al
 15c:	00 05 06 01 67 02    	add    %al,0x2670106(%rip)        # 2670268 <_end+0x206c638>
 162:	00 00                	add    %al,(%rax)
 164:	68 0a a8 02 00       	pushq  $0x2a80a
 169:	00 05 08 01 62 00    	add    %al,0x620108(%rip)        # 620277 <_end+0x1c647>
 16f:	00 00                	add    %al,(%rax)
 171:	70 0a                	jo     17d <_init-0x4009b3>
 173:	33 02                	xor    (%rdx),%eax
 175:	00 00                	add    %al,(%rax)
 177:	05 0c 01 62 00       	add    $0x62010c,%eax
 17c:	00 00                	add    %al,(%rax)
 17e:	74 0a                	je     18a <_init-0x4009a6>
 180:	12 00                	adc    (%rax),%al
 182:	00 00                	add    %al,(%rax)
 184:	05 0e 01 70 00       	add    $0x70010e,%eax
 189:	00 00                	add    %al,(%rax)
 18b:	78 0a                	js     197 <_init-0x400999>
 18d:	df 00                	fild   (%rax)
 18f:	00 00                	add    %al,(%rax)
 191:	05 12 01 46 00       	add    $0x460112,%eax
 196:	00 00                	add    %al,(%rax)
 198:	80 0a 7f             	orb    $0x7f,(%rdx)
 19b:	02 00                	add    (%rax),%al
 19d:	00 05 13 01 54 00    	add    %al,0x540113(%rip)        # 5402b6 <__FRAME_END__+0x13dc2e>
 1a3:	00 00                	add    %al,(%rax)
 1a5:	82                   	(bad)  
 1a6:	0a 54 01 00          	or     0x0(%rcx,%rax,1),%dl
 1aa:	00 05 14 01 6d 02    	add    %al,0x26d0114(%rip)        # 26d02c4 <_end+0x20cc694>
 1b0:	00 00                	add    %al,(%rax)
 1b2:	83 0a bb             	orl    $0xffffffbb,(%rdx)
 1b5:	00 00                	add    %al,(%rax)
 1b7:	00 05 18 01 7d 02    	add    %al,0x27d0118(%rip)        # 27d02d5 <_end+0x21cc6a5>
 1bd:	00 00                	add    %al,(%rax)
 1bf:	88 0a                	mov    %cl,(%rdx)
 1c1:	16                   	(bad)  
 1c2:	00 00                	add    %al,(%rax)
 1c4:	00 05 21 01 7b 00    	add    %al,0x7b0121(%rip)        # 7b02eb <_end+0x1ac6bb>
 1ca:	00 00                	add    %al,(%rax)
 1cc:	90                   	nop
 1cd:	0a a1 01 00 00 05    	or     0x5000001(%rcx),%ah
 1d3:	29 01                	sub    %eax,(%rcx)
 1d5:	8d 00                	lea    (%rax),%eax
 1d7:	00 00                	add    %al,(%rax)
 1d9:	98                   	cwtl   
 1da:	0a a8 01 00 00 05    	or     0x5000001(%rax),%ch
 1e0:	2a 01                	sub    (%rcx),%al
 1e2:	8d 00                	lea    (%rax),%eax
 1e4:	00 00                	add    %al,(%rax)
 1e6:	a0 0a af 01 00 00 05 	movabs 0x12b05000001af0a,%al
 1ed:	2b 01 
 1ef:	8d 00                	lea    (%rax),%eax
 1f1:	00 00                	add    %al,(%rax)
 1f3:	a8 0a                	test   $0xa,%al
 1f5:	b6 01                	mov    $0x1,%dh
 1f7:	00 00                	add    %al,(%rax)
 1f9:	05 2c 01 8d 00       	add    $0x8d012c,%eax
 1fe:	00 00                	add    %al,(%rax)
 200:	b0 0a                	mov    $0xa,%al
 202:	bd 01 00 00 05       	mov    $0x5000001,%ebp
 207:	2e 01 2d 00 00 00 b8 	add    %ebp,%cs:-0x48000000(%rip)        # ffffffffb800020e <_end+0xffffffffb79fc5de>
 20e:	0a 3b                	or     (%rbx),%bh
 210:	02 00                	add    (%rax),%al
 212:	00 05 2f 01 62 00    	add    %al,0x62012f(%rip)        # 620347 <_end+0x1c717>
 218:	00 00                	add    %al,(%rax)
 21a:	c0 0a 6d             	rorb   $0x6d,(%rdx)
 21d:	01 00                	add    %eax,(%rax)
 21f:	00 05 31 01 83 02    	add    %al,0x2830131(%rip)        # 2830356 <_end+0x222c726>
 225:	00 00                	add    %al,(%rax)
 227:	c4                   	(bad)  
 228:	00 0b                	add    %cl,(%rbx)
 22a:	ce                   	(bad)  
 22b:	02 00                	add    (%rax),%al
 22d:	00 05 96 08 49 01    	add    %al,0x1490896(%rip)        # 1490ac9 <_end+0xe8ce99>
 233:	00 00                	add    %al,(%rax)
 235:	18 05 9c 61 02 00    	sbb    %al,0x2619c(%rip)        # 263d7 <_init-0x3da759>
 23b:	00 09                	add    %cl,(%rcx)
 23d:	9b                   	fwait
 23e:	01 00                	add    %eax,(%rax)
 240:	00 05 9d 61 02 00    	add    %al,0x2619d(%rip)        # 263e3 <_init-0x3da74d>
 246:	00 00                	add    %al,(%rax)
 248:	09 18                	or     %ebx,(%rax)
 24a:	01 00                	add    %eax,(%rax)
 24c:	00 05 9e 67 02 00    	add    %al,0x2679e(%rip)        # 269f0 <_init-0x3da140>
 252:	00 08                	add    %cl,(%rax)
 254:	09 09                	or     %ecx,(%rcx)
 256:	01 00                	add    %eax,(%rax)
 258:	00 05 a2 62 00 00    	add    %al,0x62a2(%rip)        # 6500 <_init-0x3fa630>
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
 28b:	00 0d 86 00 00 00    	add    %cl,0x86(%rip)        # 317 <_init-0x400819>
 291:	13 00                	adc    (%rax),%eax
 293:	0e                   	(bad)  
 294:	fb                   	sti    
 295:	00 00                	add    %al,(%rax)
 297:	00 0f                	add    %cl,(%rdi)
 299:	3a 01                	cmp    (%rcx),%al
 29b:	00 00                	add    %al,(%rax)
 29d:	05 3b 01 93 02       	add    $0x293013b,%eax
 2a2:	00 00                	add    %al,(%rax)
 2a4:	0f be 02             	movsbl (%rdx),%eax
 2a7:	00 00                	add    %al,(%rax)
 2a9:	05 3c 01 93 02       	add    $0x293013c,%eax
 2ae:	00 00                	add    %al,(%rax)
 2b0:	0f eb 00             	por    (%rax),%mm0
 2b3:	00 00                	add    %al,(%rax)
 2b5:	05 3d 01 93 02       	add    $0x293013d,%eax
 2ba:	00 00                	add    %al,(%rax)
 2bc:	06                   	(bad)  
 2bd:	08 9c 00 00 00 07 bc 	or     %bl,-0x43f90000(%rax,%rax,1)
 2c4:	02 00                	add    (%rax),%al
 2c6:	00 10                	add    %dl,(%rax)
 2c8:	2d 02 00 00 04       	sub    $0x4000002,%eax
 2cd:	aa                   	stos   %al,%es:(%rdi)
 2ce:	67 02 00             	add    (%eax),%al
 2d1:	00 10                	add    %dl,(%rax)
 2d3:	b7 02                	mov    $0x2,%bh
 2d5:	00 00                	add    %al,(%rax)
 2d7:	04 ab                	add    $0xab,%al
 2d9:	67 02 00             	add    (%eax),%al
 2dc:	00 10                	add    %dl,(%rax)
 2de:	b4 00                	mov    $0x0,%ah
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
 304:	9c                   	pushfq 
 305:	02 00                	add    (%rax),%al
 307:	00 06                	add    %al,(%rsi)
 309:	1b fe                	sbb    %esi,%edi
 30b:	02 00                	add    (%rax),%al
 30d:	00 12                	add    %dl,(%rdx)
 30f:	85 00                	test   %eax,(%rax)
 311:	00 00                	add    %al,(%rax)
 313:	01 21                	add    %esp,(%rcx)
 315:	23 03                	and    (%rbx),%eax
 317:	00 00                	add    %al,(%rax)
 319:	09 03                	or     %eax,(%rbx)
 31b:	80 35 60 00 00 00 00 	xorb   $0x0,0x60(%rip)        # 382 <_init-0x4007ae>
 322:	00 06                	add    %al,(%rsi)
 324:	08 a1 00 00 00 13    	or     %ah,0x13000000(%rcx)
 32a:	96                   	xchg   %eax,%esi
 32b:	01 00                	add    %eax,(%rax)
 32d:	00 01                	add    %al,(%rcx)
 32f:	23 62 00             	and    0x0(%rdx),%esp
 332:	00 00                	add    %al,(%rax)
 334:	46 0e                	rex.RX (bad) 
 336:	40 00 00             	add    %al,(%rax)
 339:	00 00                	add    %al,(%rax)
 33b:	00 f6                	add    %dh,%dh
 33d:	00 00                	add    %al,(%rax)
 33f:	00 00                	add    %al,(%rax)
 341:	00 00                	add    %al,(%rax)
 343:	00 01                	add    %al,(%rcx)
 345:	9c                   	pushfq 
 346:	47 05 00 00 14 35    	rex.RXB add $0x35140000,%eax
 34c:	01 00                	add    %eax,(%rax)
 34e:	00 01                	add    %al,(%rcx)
 350:	23 62 00             	and    0x0(%rdx),%esp
 353:	00 00                	add    %al,(%rax)
 355:	00 00                	add    %al,(%rax)
 357:	00 00                	add    %al,(%rax)
 359:	14 0e                	adc    $0xe,%al
 35b:	01 00                	add    %eax,(%rax)
 35d:	00 01                	add    %al,(%rcx)
 35f:	23 47 05             	and    0x5(%rdi),%eax
 362:	00 00                	add    %al,(%rax)
 364:	8b 00                	mov    (%rax),%eax
 366:	00 00                	add    %al,(%rax)
 368:	15 54 00 00 00       	adc    $0x54,%eax
 36d:	01 25 8f 00 00 00    	add    %esp,0x8f(%rip)        # 402 <_init-0x40072e>
 373:	fd                   	std    
 374:	00 00                	add    %al,(%rax)
 376:	00 16                	add    %dl,(%rsi)
 378:	01 0f                	add    %ecx,(%rdi)
 37a:	40 00 00             	add    %al,(%rax)
 37d:	00 00                	add    %al,(%rax)
 37f:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # 385 <_init-0x4007ab>
 385:	00 00                	add    %al,(%rax)
 387:	00 d0                	add    %dl,%al
 389:	03 00                	add    (%rax),%eax
 38b:	00 17                	add    %dl,(%rdi)
 38d:	13 01                	adc    (%rcx),%eax
 38f:	00 00                	add    %al,(%rax)
 391:	07                   	(bad)  
 392:	00 9d 03 00 00 18    	add    %bl,0x18000003(%rbp)
 398:	62                   	(bad)  
 399:	00 00                	add    %al,(%rax)
 39b:	00 00                	add    %al,(%rax)
 39d:	19 14 0f             	sbb    %edx,(%rdi,%rcx,1)
 3a0:	40 00 00             	add    %al,(%rax)
 3a3:	00 00                	add    %al,(%rax)
 3a5:	00 4d 05             	add    %cl,0x5(%rbp)
 3a8:	00 00                	add    %al,(%rax)
 3aa:	bc 03 00 00 1a       	mov    $0x1a000003,%esp
 3af:	01 55 09             	add    %edx,0x9(%rbp)
 3b2:	03 64 1c 40          	add    0x40(%rsp,%rbx,1),%esp
 3b6:	00 00                	add    %al,(%rax)
 3b8:	00 00                	add    %al,(%rax)
 3ba:	00 00                	add    %al,(%rax)
 3bc:	1b 1e                	sbb    (%rsi),%ebx
 3be:	0f 40 00             	cmovo  (%rax),%eax
 3c1:	00 00                	add    %al,(%rax)
 3c3:	00 00                	add    %al,(%rax)
 3c5:	59                   	pop    %rcx
 3c6:	05 00 00 1a 01       	add    $0x11a0000,%eax
 3cb:	55                   	push   %rbp
 3cc:	01 38                	add    %edi,(%rax)
 3ce:	00 00                	add    %al,(%rax)
 3d0:	16                   	(bad)  
 3d1:	1e                   	(bad)  
 3d2:	0f 40 00             	cmovo  (%rax),%eax
 3d5:	00 00                	add    %al,(%rax)
 3d7:	00 00                	add    %al,(%rax)
 3d9:	1e                   	(bad)  
 3da:	00 00                	add    %al,(%rax)
 3dc:	00 00                	add    %al,(%rax)
 3de:	00 00                	add    %al,(%rax)
 3e0:	00 29                	add    %ch,(%rcx)
 3e2:	04 00                	add    $0x0,%al
 3e4:	00 17                	add    %dl,(%rdi)
 3e6:	13 01                	adc    (%rcx),%eax
 3e8:	00 00                	add    %al,(%rax)
 3ea:	07                   	(bad)  
 3eb:	00 f6                	add    %dh,%dh
 3ed:	03 00                	add    (%rax),%eax
 3ef:	00 18                	add    %bl,(%rax)
 3f1:	62                   	(bad)  
 3f2:	00 00                	add    %al,(%rax)
 3f4:	00 00                	add    %al,(%rax)
 3f6:	19 32                	sbb    %esi,(%rdx)
 3f8:	0f 40 00             	cmovo  (%rax),%eax
 3fb:	00 00                	add    %al,(%rax)
 3fd:	00 00                	add    %al,(%rax)
 3ff:	4d 05 00 00 15 04    	rex.WRB add $0x4150000,%rax
 405:	00 00                	add    %al,(%rax)
 407:	1a 01                	sbb    (%rcx),%al
 409:	55                   	push   %rbp
 40a:	09 03                	or     %eax,(%rbx)
 40c:	81 1c 40 00 00 00 00 	sbbl   $0x0,(%rax,%rax,2)
 413:	00 00                	add    %al,(%rax)
 415:	1b 3c 0f             	sbb    (%rdi,%rcx,1),%edi
 418:	40 00 00             	add    %al,(%rax)
 41b:	00 00                	add    %al,(%rax)
 41d:	00 59 05             	add    %bl,0x5(%rcx)
 420:	00 00                	add    %al,(%rax)
 422:	1a 01                	sbb    (%rcx),%al
 424:	55                   	push   %rbp
 425:	01 38                	add    %edi,(%rax)
 427:	00 00                	add    %al,(%rax)
 429:	19 6c 0e 40          	sbb    %ebp,0x40(%rsi,%rcx,1)
 42d:	00 00                	add    %al,(%rax)
 42f:	00 00                	add    %al,(%rax)
 431:	00 64 05 00          	add    %ah,0x0(%rbp,%rax,1)
 435:	00 48 04             	add    %cl,0x4(%rax)
 438:	00 00                	add    %al,(%rax)
 43a:	1a 01                	sbb    (%rcx),%al
 43c:	54                   	push   %rsp
 43d:	09 03                	or     %eax,(%rbx)
 43f:	1a 20                	sbb    (%rax),%ah
 441:	40 00 00             	add    %al,(%rax)
 444:	00 00                	add    %al,(%rax)
 446:	00 00                	add    %al,(%rax)
 448:	1c 81                	sbb    $0x81,%al
 44a:	0e                   	(bad)  
 44b:	40 00 00             	add    %al,(%rax)
 44e:	00 00                	add    %al,(%rax)
 450:	00 70 05             	add    %dh,0x5(%rax)
 453:	00 00                	add    %al,(%rax)
 455:	19 8d 0e 40 00 00    	sbb    %ecx,0x400e(%rbp)
 45b:	00 00                	add    %al,(%rax)
 45d:	00 7b 05             	add    %bh,0x5(%rbx)
 460:	00 00                	add    %al,(%rax)
 462:	74 04                	je     468 <_init-0x4006c8>
 464:	00 00                	add    %al,(%rax)
 466:	1a 01                	sbb    (%rcx),%al
 468:	55                   	push   %rbp
 469:	09 03                	or     %eax,(%rbx)
 46b:	c0 1c 40 00          	rcrb   $0x0,(%rax,%rax,2)
 46f:	00 00                	add    %al,(%rax)
 471:	00 00                	add    %al,(%rax)
 473:	00 19                	add    %bl,(%rcx)
 475:	99                   	cltd   
 476:	0e                   	(bad)  
 477:	40 00 00             	add    %al,(%rax)
 47a:	00 00                	add    %al,(%rax)
 47c:	00 7b 05             	add    %bh,0x5(%rbx)
 47f:	00 00                	add    %al,(%rax)
 481:	93                   	xchg   %eax,%ebx
 482:	04 00                	add    $0x0,%al
 484:	00 1a                	add    %bl,(%rdx)
 486:	01 55 09             	add    %edx,0x9(%rbp)
 489:	03 00                	add    (%rax),%eax
 48b:	1d 40 00 00 00       	sbb    $0x40,%eax
 490:	00 00                	add    %al,(%rax)
 492:	00 1c 9e             	add    %bl,(%rsi,%rbx,4)
 495:	0e                   	(bad)  
 496:	40 00 00             	add    %al,(%rax)
 499:	00 00                	add    %al,(%rax)
 49b:	00 8a 05 00 00 1c    	add    %cl,0x1c000005(%rdx)
 4a1:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
 4a2:	0e                   	(bad)  
 4a3:	40 00 00             	add    %al,(%rax)
 4a6:	00 00                	add    %al,(%rax)
 4a8:	00 95 05 00 00 1c    	add    %dl,0x1c000005(%rbp)
 4ae:	ab                   	stos   %eax,%es:(%rdi)
 4af:	0e                   	(bad)  
 4b0:	40 00 00             	add    %al,(%rax)
 4b3:	00 00                	add    %al,(%rax)
 4b5:	00 a0 05 00 00 19    	add    %ah,0x19000005(%rax)
 4bb:	b7 0e                	mov    $0xe,%bh
 4bd:	40 00 00             	add    %al,(%rax)
 4c0:	00 00                	add    %al,(%rax)
 4c2:	00 7b 05             	add    %bh,0x5(%rbx)
 4c5:	00 00                	add    %al,(%rax)
 4c7:	d9 04 00             	flds   (%rax,%rax,1)
 4ca:	00 1a                	add    %bl,(%rdx)
 4cc:	01 55 09             	add    %edx,0x9(%rbp)
 4cf:	03 30                	add    (%rax),%esi
 4d1:	1d 40 00 00 00       	sbb    $0x40,%eax
 4d6:	00 00                	add    %al,(%rax)
 4d8:	00 1c bc             	add    %bl,(%rsp,%rdi,4)
 4db:	0e                   	(bad)  
 4dc:	40 00 00             	add    %al,(%rax)
 4df:	00 00                	add    %al,(%rax)
 4e1:	00 8a 05 00 00 1c    	add    %cl,0x1c000005(%rdx)
 4e7:	c4                   	(bad)  
 4e8:	0e                   	(bad)  
 4e9:	40 00 00             	add    %al,(%rax)
 4ec:	00 00                	add    %al,(%rax)
 4ee:	00 ab 05 00 00 1c    	add    %ch,0x1c000005(%rbx)
 4f4:	c9                   	leaveq 
 4f5:	0e                   	(bad)  
 4f6:	40 00 00             	add    %al,(%rax)
 4f9:	00 00                	add    %al,(%rax)
 4fb:	00 a0 05 00 00 19    	add    %ah,0x19000005(%rax)
 501:	d5                   	(bad)  
 502:	0e                   	(bad)  
 503:	40 00 00             	add    %al,(%rax)
 506:	00 00                	add    %al,(%rax)
 508:	00 7b 05             	add    %bh,0x5(%rbx)
 50b:	00 00                	add    %al,(%rax)
 50d:	1f                   	(bad)  
 50e:	05 00 00 1a 01       	add    $0x11a0000,%eax
 513:	55                   	push   %rbp
 514:	09 03                	or     %eax,(%rbx)
 516:	9b                   	fwait
 517:	1c 40                	sbb    $0x40,%al
 519:	00 00                	add    %al,(%rax)
 51b:	00 00                	add    %al,(%rax)
 51d:	00 00                	add    %al,(%rax)
 51f:	1c da                	sbb    $0xda,%al
 521:	0e                   	(bad)  
 522:	40 00 00             	add    %al,(%rax)
 525:	00 00                	add    %al,(%rax)
 527:	00 8a 05 00 00 1c    	add    %cl,0x1c000005(%rdx)
 52d:	e2 0e                	loop   53d <_init-0x4005f3>
 52f:	40 00 00             	add    %al,(%rax)
 532:	00 00                	add    %al,(%rax)
 534:	00 b6 05 00 00 1c    	add    %dh,0x1c000005(%rsi)
 53a:	e7 0e                	out    %eax,$0xe
 53c:	40 00 00             	add    %al,(%rax)
 53f:	00 00                	add    %al,(%rax)
 541:	00 a0 05 00 00 00    	add    %ah,0x5(%rax)
 547:	06                   	(bad)  
 548:	08 8f 00 00 00 1d    	or     %cl,0x1d000000(%rdi)
 54e:	d8 00                	fadds  (%rax)
 550:	00 00                	add    %al,(%rax)
 552:	d8 00                	fadds  (%rax)
 554:	00 00                	add    %al,(%rax)
 556:	04 6c                	add    $0x6c,%al
 558:	01 1e                	add    %ebx,(%rsi)
 55a:	13 01                	adc    (%rcx),%eax
 55c:	00 00                	add    %al,(%rax)
 55e:	13 01                	adc    (%rcx),%eax
 560:	00 00                	add    %al,(%rax)
 562:	07                   	(bad)  
 563:	00 1d 0c 00 00 00    	add    %bl,0xc(%rip)        # 575 <_init-0x4005bb>
 569:	0c 00                	or     $0x0,%al
 56b:	00 00                	add    %al,(%rax)
 56d:	04 12                	add    $0x12,%al
 56f:	01 1e                	add    %ebx,(%rsi)
 571:	0d 02 00 00 0d       	or     $0xd000002,%eax
 576:	02 00                	add    (%rax),%al
 578:	00 08                	add    %cl,(%rax)
 57a:	09 1f                	or     %ebx,(%rdi)
 57c:	28 00                	sub    %al,(%rax)
 57e:	00 00                	add    %al,(%rax)
 580:	1e                   	(bad)  
 581:	00 00                	add    %al,(%rax)
 583:	00 07                	add    %al,(%rdi)
 585:	00 28                	add    %ch,(%rax)
 587:	00 00                	add    %al,(%rax)
 589:	00 1e                	add    %bl,(%rsi)
 58b:	a2 00 00 00 a2 00 00 	movabs %al,0x8000000a2000000
 592:	00 08 
 594:	08 1e                	or     %bl,(%rsi)
 596:	ac                   	lods   %ds:(%rsi),%al
 597:	00 00                	add    %al,(%rax)
 599:	00 ac 00 00 00 09 04 	add    %ch,0x4090000(%rax,%rax,1)
 5a0:	1e                   	(bad)  
 5a1:	ca 00 00             	lret   $0x0
 5a4:	00 ca                	add    %cl,%dl
 5a6:	00 00                	add    %al,(%rax)
 5a8:	00 08                	add    %cl,(%rax)
 5aa:	0b 1e                	or     (%rsi),%ebx
 5ac:	d6                   	(bad)  
 5ad:	01 00                	add    %eax,(%rax)
 5af:	00 d6                	add    %dl,%dh
 5b1:	01 00                	add    %eax,(%rax)
 5b3:	00 09                	add    %cl,(%rcx)
 5b5:	05 1e de 01 00       	add    $0x1de1e,%eax
 5ba:	00 de                	add    %bl,%dh
 5bc:	01 00                	add    %eax,(%rax)
 5be:	00 09                	add    %cl,(%rcx)
 5c0:	06                   	(bad)  
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x2aad6e6>
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
  35:	00 05 0f 00 0b 0b    	add    %al,0xb0b000f(%rip)        # b0b004a <_end+0xaaac41a>
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
  5c:	09 0d 00 03 0e 3a    	or     %ecx,0x3a0e0300(%rip)        # 3a0e0362 <_end+0x39adc732>
  62:	0b 3b                	or     (%rbx),%edi
  64:	0b 49 13             	or     0x13(%rcx),%ecx
  67:	38 0b                	cmp    %cl,(%rbx)
  69:	00 00                	add    %al,(%rax)
  6b:	0a 0d 00 03 0e 3a    	or     0x3a0e0300(%rip),%cl        # 3a0e0371 <_end+0x39adc741>
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
  a7:	3b 05 49 13 3f 19    	cmp    0x193f1349(%rip),%eax        # 193f13f6 <_end+0x18ded7c6>
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
 133:	18 05 00 49 13 00    	sbb    %al,0x134900(%rip)        # 134a39 <_init-0x2cc0f7>
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
 176:	3b 05 00 00 1e 2e    	cmp    0x2e1e0000(%rip),%eax        # 2e1e017c <_end+0x2dbdc54c>
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
   0:	14 01                	adc    $0x1,%al
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
  1c:	75 73                	jne    91 <_init-0x400a9f>
  1e:	72 2f                	jb     4f <_init-0x400ae1>
  20:	6c                   	insb   (%dx),%es:(%rdi)
  21:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  28:	78 38                	js     62 <_init-0x400ace>
  2a:	36 5f                	ss pop %rdi
  2c:	36 34 2d             	ss xor $0x2d,%al
  2f:	6c                   	insb   (%dx),%es:(%rdi)
  30:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  37:	75 2f                	jne    68 <_init-0x400ac8>
  39:	36 2f                	ss (bad) 
  3b:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  42:	00 2f                	add    %ch,(%rdi)
  44:	75 73                	jne    b9 <_init-0x400a77>
  46:	72 2f                	jb     77 <_init-0x400ab9>
  48:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  4f:	2f                   	(bad)  
  50:	78 38                	js     8a <_init-0x400aa6>
  52:	36 5f                	ss pop %rdi
  54:	36 34 2d             	ss xor $0x2d,%al
  57:	6c                   	insb   (%dx),%es:(%rdi)
  58:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  5f:	75 2f                	jne    90 <_init-0x400aa0>
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
  8a:	74 79                	je     105 <_init-0x400a2b>
  8c:	70 65                	jo     f3 <_init-0x400a3d>
  8e:	73 2e                	jae    be <_init-0x400a72>
  90:	68 00 02 00 00       	pushq  $0x200
  95:	73 74                	jae    10b <_init-0x400a25>
  97:	64 69 6f 2e 68 00 03 	imul   $0x30068,%fs:0x2e(%rdi),%ebp
  9e:	00 
  9f:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  a3:	69 6f 2e 68 00 03 00 	imul   $0x30068,0x2e(%rdi),%ebp
  aa:	00 73 79             	add    %dh,0x79(%rbx)
  ad:	73 5f                	jae    10e <_init-0x400a22>
  af:	65 72 72             	gs jb  124 <_init-0x400a0c>
  b2:	6c                   	insb   (%dx),%es:(%rdi)
  b3:	69 73 74 2e 68 00 02 	imul   $0x200682e,0x74(%rbx),%esi
  ba:	00 00                	add    %al,(%rax)
  bc:	3c 62                	cmp    $0x62,%al
  be:	75 69                	jne    129 <_init-0x400a07>
  c0:	6c                   	insb   (%dx),%es:(%rdi)
  c1:	74 2d                	je     f0 <_init-0x400a40>
  c3:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
  ca:	73 75                	jae    141 <_init-0x4009ef>
  cc:	70 70                	jo     13e <_init-0x4009f2>
  ce:	6f                   	outsl  %ds:(%rsi),(%dx)
  cf:	72 74                	jb     145 <_init-0x4009eb>
  d1:	2e 68 00 00 00 00    	cs pushq $0x0
  d7:	70 68                	jo     141 <_init-0x4009ef>
  d9:	61                   	(bad)  
  da:	73 65                	jae    141 <_init-0x4009ef>
  dc:	73 2e                	jae    10c <_init-0x400a24>
  de:	68 00 00 00 00       	pushq  $0x0
  e3:	00 00                	add    %al,(%rax)
  e5:	09 02                	or     %eax,(%rdx)
  e7:	46 0e                	rex.RX (bad) 
  e9:	40 00 00             	add    %al,(%rax)
  ec:	00 00                	add    %al,(%rax)
  ee:	00 03                	add    %al,(%rbx)
  f0:	23 01                	and    (%rcx),%eax
  f2:	28 c2                	sub    %al,%dl
  f4:	91                   	xchg   %eax,%ecx
  f5:	03 0d 08 e4 5a bb    	add    -0x44a51bf8(%rip),%ecx        # ffffffffbb5ae503 <_end+0xffffffffbafaa8d3>
  fb:	bd 59 83 5a be       	mov    $0xbe5a8359,%ebp
 100:	59                   	pop    %rcx
 101:	83 59 be 59          	sbbl   $0x59,-0x42(%rcx)
 105:	83 5b 03 51          	sbbl   $0x51,0x3(%rbx)
 109:	74 03                	je     10e <_init-0x400a22>
 10b:	09 08                	or     %ecx,(%rax)
 10d:	2e 08 2f             	or     %ch,%cs:(%rdi)
 110:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
 111:	08 3d 02 0a 00 01    	or     %bh,0x1000a02(%rip)        # 1000b19 <_end+0x9fcee9>
 117:	01                   	.byte 0x1

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	5f                   	pop    %rdi
   1:	49                   	rex.WB
   2:	4f 5f                	rex.WRXB pop %r15
   4:	62                   	(bad)  
   5:	75 66                	jne    6d <_init-0x400ac3>
   7:	5f                   	pop    %rdi
   8:	65 6e                	outsb  %gs:(%rsi),(%dx)
   a:	64 00 66 6f          	add    %ah,%fs:0x6f(%rsi)
   e:	70 65                	jo     75 <_init-0x400abb>
  10:	6e                   	outsb  %ds:(%rsi),(%dx)
  11:	00 5f 6f             	add    %bl,0x6f(%rdi)
  14:	6c                   	insb   (%dx),%es:(%rdi)
  15:	64 5f                	fs pop %rdi
  17:	6f                   	outsl  %ds:(%rsi),(%dx)
  18:	66 66 73 65          	data16 data16 jae 81 <_init-0x400aaf>
  1c:	74 00                	je     1e <_init-0x400b12>
  1e:	5f                   	pop    %rdi
  1f:	5f                   	pop    %rdi
  20:	62                   	(bad)  
  21:	75 69                	jne    8c <_init-0x400aa4>
  23:	6c                   	insb   (%dx),%es:(%rdi)
  24:	74 69                	je     8f <_init-0x400aa1>
  26:	6e                   	outsb  %ds:(%rsi),(%dx)
  27:	5f                   	pop    %rdi
  28:	70 75                	jo     9f <_init-0x400a91>
  2a:	74 73                	je     9f <_init-0x400a91>
  2c:	00 73 79             	add    %dh,0x79(%rbx)
  2f:	73 5f                	jae    90 <_init-0x400aa0>
  31:	6e                   	outsb  %ds:(%rsi),(%dx)
  32:	65 72 72             	gs jb  a7 <_init-0x400a89>
  35:	00 5f 49             	add    %bl,0x49(%rdi)
  38:	4f 5f                	rex.WRXB pop %r15
  3a:	73 61                	jae    9d <_init-0x400a93>
  3c:	76 65                	jbe    a3 <_init-0x400a8d>
  3e:	5f                   	pop    %rdi
  3f:	65 6e                	outsb  %gs:(%rsi),(%dx)
  41:	64 00 73 68          	add    %dh,%fs:0x68(%rbx)
  45:	6f                   	outsl  %ds:(%rsi),(%dx)
  46:	72 74                	jb     bc <_init-0x400a74>
  48:	20 69 6e             	and    %ch,0x6e(%rcx)
  4b:	74 00                	je     4d <_init-0x400ae3>
  4d:	73 69                	jae    b8 <_init-0x400a78>
  4f:	7a 65                	jp     b6 <_init-0x400a7a>
  51:	5f                   	pop    %rdi
  52:	74 00                	je     54 <_init-0x400adc>
  54:	69 6e 70 75 74 00 73 	imul   $0x73007475,0x70(%rsi),%ebp
  5b:	69 7a 65 74 79 70 65 	imul   $0x65707974,0x65(%rdx),%edi
  62:	00 5f 49             	add    %bl,0x49(%rdi)
  65:	4f 5f                	rex.WRXB pop %r15
  67:	77 72                	ja     db <_init-0x400a55>
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
  7d:	75 66                	jne    e5 <_init-0x400a4b>
  7f:	5f                   	pop    %rdi
  80:	62 61                	(bad)  
  82:	73 65                	jae    e9 <_init-0x400a47>
  84:	00 69 6e             	add    %ch,0x6e(%rcx)
  87:	66 69 6c 65 00 5f 6d 	imul   $0x6d5f,0x0(%rbp,%riz,2),%bp
  8e:	61                   	(bad)  
  8f:	72 6b                	jb     fc <_init-0x400a34>
  91:	65 72 73             	gs jb  107 <_init-0x400a29>
  94:	00 5f 49             	add    %bl,0x49(%rdi)
  97:	4f 5f                	rex.WRXB pop %r15
  99:	72 65                	jb     100 <_init-0x400a30>
  9b:	61                   	(bad)  
  9c:	64 5f                	fs pop %rdi
  9e:	65 6e                	outsb  %gs:(%rsi),(%dx)
  a0:	64 00 72 65          	add    %dh,%fs:0x65(%rdx)
  a4:	61                   	(bad)  
  a5:	64 5f                	fs pop %rdi
  a7:	6c                   	insb   (%dx),%es:(%rdi)
  a8:	69 6e 65 00 70 68 61 	imul   $0x61687000,0x65(%rsi),%ebp
  af:	73 65                	jae    116 <_init-0x400a1a>
  b1:	5f                   	pop    %rdi
  b2:	31 00                	xor    %eax,(%rax)
  b4:	73 74                	jae    12a <_init-0x400a06>
  b6:	64 65 72 72          	fs gs jb 12c <_init-0x400a04>
  ba:	00 5f 6c             	add    %bl,0x6c(%rdi)
  bd:	6f                   	outsl  %ds:(%rsi),(%dx)
  be:	63 6b 00             	movslq 0x0(%rbx),%ebp
  c1:	6c                   	insb   (%dx),%es:(%rdi)
  c2:	6f                   	outsl  %ds:(%rsi),(%dx)
  c3:	6e                   	outsb  %ds:(%rsi),(%dx)
  c4:	67 20 69 6e          	and    %ch,0x6e(%ecx)
  c8:	74 00                	je     ca <_init-0x400a66>
  ca:	70 68                	jo     134 <_init-0x4009fc>
  cc:	61                   	(bad)  
  cd:	73 65                	jae    134 <_init-0x4009fc>
  cf:	5f                   	pop    %rdi
  d0:	64 65 66 75 73       	fs gs data16 jne 148 <_init-0x4009e8>
  d5:	65 64 00 70 72       	gs add %dh,%fs:0x72(%rax)
  da:	69 6e 74 66 00 5f 63 	imul   $0x635f0066,0x74(%rsi),%ebp
  e1:	75 72                	jne    155 <_init-0x4009db>
  e3:	5f                   	pop    %rdi
  e4:	63 6f 6c             	movslq 0x6c(%rdi),%ebp
  e7:	75 6d                	jne    156 <_init-0x4009da>
  e9:	6e                   	outsb  %ds:(%rsi),(%dx)
  ea:	00 5f 49             	add    %bl,0x49(%rdi)
  ed:	4f 5f                	rex.WRXB pop %r15
  ef:	32 5f 31             	xor    0x31(%rdi),%bl
  f2:	5f                   	pop    %rdi
  f3:	73 74                	jae    169 <_init-0x4009c7>
  f5:	64 65 72 72          	fs gs jb 16b <_init-0x4009c5>
  f9:	5f                   	pop    %rdi
  fa:	00 5f 49             	add    %bl,0x49(%rdi)
  fd:	4f 5f                	rex.WRXB pop %r15
  ff:	46                   	rex.RX
 100:	49                   	rex.WB
 101:	4c                   	rex.WR
 102:	45 5f                	rex.RB pop %r15
 104:	70 6c                	jo     172 <_init-0x4009be>
 106:	75 73                	jne    17b <_init-0x4009b5>
 108:	00 5f 70             	add    %bl,0x70(%rdi)
 10b:	6f                   	outsl  %ds:(%rsi),(%dx)
 10c:	73 00                	jae    10e <_init-0x400a22>
 10e:	61                   	(bad)  
 10f:	72 67                	jb     178 <_init-0x4009b8>
 111:	76 00                	jbe    113 <_init-0x400a1d>
 113:	65 78 69             	gs js  17f <_init-0x4009b1>
 116:	74 00                	je     118 <_init-0x400a18>
 118:	5f                   	pop    %rdi
 119:	73 62                	jae    17d <_init-0x4009b3>
 11b:	75 66                	jne    183 <_init-0x4009ad>
 11d:	00 5f 49             	add    %bl,0x49(%rdi)
 120:	4f 5f                	rex.WRXB pop %r15
 122:	46                   	rex.RX
 123:	49                   	rex.WB
 124:	4c                   	rex.WR
 125:	45 00 75 6e          	add    %r14b,0x6e(%r13)
 129:	73 69                	jae    194 <_init-0x40099c>
 12b:	67 6e                	outsb  %ds:(%esi),(%dx)
 12d:	65 64 20 63 68       	gs and %ah,%fs:0x68(%rbx)
 132:	61                   	(bad)  
 133:	72 00                	jb     135 <_init-0x4009fb>
 135:	61                   	(bad)  
 136:	72 67                	jb     19f <_init-0x400991>
 138:	63 00                	movslq (%rax),%eax
 13a:	5f                   	pop    %rdi
 13b:	49                   	rex.WB
 13c:	4f 5f                	rex.WRXB pop %r15
 13e:	32 5f 31             	xor    0x31(%rdi),%bl
 141:	5f                   	pop    %rdi
 142:	73 74                	jae    1b8 <_init-0x400978>
 144:	64 69 6e 5f 00 5f 49 	imul   $0x4f495f00,%fs:0x5f(%rsi),%ebp
 14b:	4f 
 14c:	5f                   	pop    %rdi
 14d:	6d                   	insl   (%dx),%es:(%rdi)
 14e:	61                   	(bad)  
 14f:	72 6b                	jb     1bc <_init-0x400974>
 151:	65 72 00             	gs jb  154 <_init-0x4009dc>
 154:	5f                   	pop    %rdi
 155:	73 68                	jae    1bf <_init-0x400971>
 157:	6f                   	outsl  %ds:(%rsi),(%dx)
 158:	72 74                	jb     1ce <_init-0x400962>
 15a:	62                   	(bad)  
 15b:	75 66                	jne    1c3 <_init-0x40096d>
 15d:	00 5f 49             	add    %bl,0x49(%rdi)
 160:	4f 5f                	rex.WRXB pop %r15
 162:	77 72                	ja     1d6 <_init-0x40095a>
 164:	69 74 65 5f 62 61 73 	imul   $0x65736162,0x5f(%rbp,%riz,2),%esi
 16b:	65 
 16c:	00 5f 75             	add    %bl,0x75(%rdi)
 16f:	6e                   	outsb  %ds:(%rsi),(%dx)
 170:	75 73                	jne    1e5 <_init-0x40094b>
 172:	65 64 32 00          	gs xor %fs:(%rax),%al
 176:	5f                   	pop    %rdi
 177:	49                   	rex.WB
 178:	4f 5f                	rex.WRXB pop %r15
 17a:	72 65                	jb     1e1 <_init-0x40094f>
 17c:	61                   	(bad)  
 17d:	64 5f                	fs pop %rdi
 17f:	70 74                	jo     1f5 <_init-0x40093b>
 181:	72 00                	jb     183 <_init-0x4009ad>
 183:	73 68                	jae    1ed <_init-0x400943>
 185:	6f                   	outsl  %ds:(%rsi),(%dx)
 186:	72 74                	jb     1fc <_init-0x400934>
 188:	20 75 6e             	and    %dh,0x6e(%rbp)
 18b:	73 69                	jae    1f6 <_init-0x40093a>
 18d:	67 6e                	outsb  %ds:(%esi),(%dx)
 18f:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
 194:	74 00                	je     196 <_init-0x40099a>
 196:	6d                   	insl   (%dx),%es:(%rdi)
 197:	61                   	(bad)  
 198:	69 6e 00 5f 6e 65 78 	imul   $0x78656e5f,0x0(%rsi),%ebp
 19f:	74 00                	je     1a1 <_init-0x40098f>
 1a1:	5f                   	pop    %rdi
 1a2:	5f                   	pop    %rdi
 1a3:	70 61                	jo     206 <_init-0x40092a>
 1a5:	64 31 00             	xor    %eax,%fs:(%rax)
 1a8:	5f                   	pop    %rdi
 1a9:	5f                   	pop    %rdi
 1aa:	70 61                	jo     20d <_init-0x400923>
 1ac:	64 32 00             	xor    %fs:(%rax),%al
 1af:	5f                   	pop    %rdi
 1b0:	5f                   	pop    %rdi
 1b1:	70 61                	jo     214 <_init-0x40091c>
 1b3:	64 33 00             	xor    %fs:(%rax),%eax
 1b6:	5f                   	pop    %rdi
 1b7:	5f                   	pop    %rdi
 1b8:	70 61                	jo     21b <_init-0x400915>
 1ba:	64 34 00             	fs xor $0x0,%al
 1bd:	5f                   	pop    %rdi
 1be:	5f                   	pop    %rdi
 1bf:	70 61                	jo     222 <_init-0x40090e>
 1c1:	64 35 00 6c 6f 6e    	fs xor $0x6e6f6c00,%eax
 1c7:	67 20 75 6e          	and    %dh,0x6e(%ebp)
 1cb:	73 69                	jae    236 <_init-0x4008fa>
 1cd:	67 6e                	outsb  %ds:(%esi),(%dx)
 1cf:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
 1d4:	74 00                	je     1d6 <_init-0x40095a>
 1d6:	70 68                	jo     240 <_init-0x4008f0>
 1d8:	61                   	(bad)  
 1d9:	73 65                	jae    240 <_init-0x4008f0>
 1db:	5f                   	pop    %rdi
 1dc:	32 00                	xor    (%rax),%al
 1de:	70 68                	jo     248 <_init-0x4008e8>
 1e0:	61                   	(bad)  
 1e1:	73 65                	jae    248 <_init-0x4008e8>
 1e3:	5f                   	pop    %rdi
 1e4:	33 00                	xor    (%rax),%eax
 1e6:	5f                   	pop    %rdi
 1e7:	49                   	rex.WB
 1e8:	4f 5f                	rex.WRXB pop %r15
 1ea:	77 72                	ja     25e <_init-0x4008d2>
 1ec:	69 74 65 5f 65 6e 64 	imul   $0x646e65,0x5f(%rbp,%riz,2),%esi
 1f3:	00 
 1f4:	5f                   	pop    %rdi
 1f5:	5f                   	pop    %rdi
 1f6:	6f                   	outsl  %ds:(%rsi),(%dx)
 1f7:	66 66 36 34 5f       	data16 data16 ss xor $0x5f,%al
 1fc:	74 00                	je     1fe <_init-0x400932>
 1fe:	5f                   	pop    %rdi
 1ff:	5f                   	pop    %rdi
 200:	6f                   	outsl  %ds:(%rsi),(%dx)
 201:	66 66 5f             	data16 pop %di
 204:	74 00                	je     206 <_init-0x40092a>
 206:	5f                   	pop    %rdi
 207:	63 68 61             	movslq 0x61(%rax),%ebp
 20a:	69 6e 00 69 6e 69 74 	imul   $0x74696e69,0x0(%rsi),%ebp
 211:	69 61 6c 69 7a 65 5f 	imul   $0x5f657a69,0x6c(%rcx),%esp
 218:	62                   	(bad)  
 219:	6f                   	outsl  %ds:(%rsi),(%dx)
 21a:	6d                   	insl   (%dx),%es:(%rdi)
 21b:	62                   	(bad)  
 21c:	00 5f 49             	add    %bl,0x49(%rdi)
 21f:	4f 5f                	rex.WRXB pop %r15
 221:	62 61                	(bad)  
 223:	63 6b 75             	movslq 0x75(%rbx),%ebp
 226:	70 5f                	jo     287 <_init-0x4008a9>
 228:	62 61                	(bad)  
 22a:	73 65                	jae    291 <_init-0x40089f>
 22c:	00 73 74             	add    %dh,0x74(%rbx)
 22f:	64 69 6e 00 5f 66 6c 	imul   $0x616c665f,%fs:0x0(%rsi),%ebp
 236:	61 
 237:	67 73 32             	addr32 jae 26c <_init-0x4008c4>
 23a:	00 5f 6d             	add    %bl,0x6d(%rdi)
 23d:	6f                   	outsl  %ds:(%rsi),(%dx)
 23e:	64 65 00 5f 49       	fs add %bl,%gs:0x49(%rdi)
 243:	4f 5f                	rex.WRXB pop %r15
 245:	72 65                	jb     2ac <_init-0x400884>
 247:	61                   	(bad)  
 248:	64 5f                	fs pop %rdi
 24a:	62 61                	(bad)  
 24c:	73 65                	jae    2b3 <_init-0x40087d>
 24e:	00 2f                	add    %ch,(%rdi)
 250:	68 6f 6d 65 2f       	pushq  $0x2f656d6f
 255:	73 6a                	jae    2c1 <_init-0x40086f>
 257:	74 75                	je     2ce <_init-0x400862>
 259:	2d 69 63 73 2d       	sub    $0x2d736369,%eax
 25e:	73 76                	jae    2d6 <_init-0x40085a>
 260:	6e                   	outsb  %ds:(%rsi),(%dx)
 261:	2f                   	(bad)  
 262:	61                   	(bad)  
 263:	72 63                	jb     2c8 <_init-0x400868>
 265:	68 76 69 65 2f       	pushq  $0x2f656976
 26a:	53                   	push   %rbx
 26b:	45 31 39             	xor    %r15d,(%r9)
 26e:	2d 6c 61 62 32       	sub    $0x3262616c,%eax
 273:	2f                   	(bad)  
 274:	6f                   	outsl  %ds:(%rsi),(%dx)
 275:	6e                   	outsb  %ds:(%rsi),(%dx)
 276:	6c                   	insb   (%dx),%es:(%rdi)
 277:	69 6e 65 2f 73 72 63 	imul   $0x6372732f,0x65(%rsi),%ebp
 27e:	00 5f 76             	add    %bl,0x76(%rdi)
 281:	74 61                	je     2e4 <_init-0x40084c>
 283:	62                   	(bad)  
 284:	6c                   	insb   (%dx),%es:(%rdi)
 285:	65 5f                	gs pop %rdi
 287:	6f                   	outsl  %ds:(%rsi),(%dx)
 288:	66 66 73 65          	data16 data16 jae 2f1 <_init-0x40083f>
 28c:	74 00                	je     28e <_init-0x4008a2>
 28e:	5f                   	pop    %rdi
 28f:	49                   	rex.WB
 290:	4f 5f                	rex.WRXB pop %r15
 292:	73 61                	jae    2f5 <_init-0x40083b>
 294:	76 65                	jbe    2fb <_init-0x400835>
 296:	5f                   	pop    %rdi
 297:	62 61                	(bad)  
 299:	73 65                	jae    300 <_init-0x400830>
 29b:	00 73 79             	add    %dh,0x79(%rbx)
 29e:	73 5f                	jae    2ff <_init-0x400831>
 2a0:	65 72 72             	gs jb  315 <_init-0x40081b>
 2a3:	6c                   	insb   (%dx),%es:(%rdi)
 2a4:	69 73 74 00 5f 66 69 	imul   $0x69665f00,0x74(%rbx),%esi
 2ab:	6c                   	insb   (%dx),%es:(%rdi)
 2ac:	65 6e                	outsb  %gs:(%rsi),(%dx)
 2ae:	6f                   	outsl  %ds:(%rsi),(%dx)
 2af:	00 5f 66             	add    %bl,0x66(%rdi)
 2b2:	6c                   	insb   (%dx),%es:(%rdi)
 2b3:	61                   	(bad)  
 2b4:	67 73 00             	addr32 jae 2b7 <_init-0x400879>
 2b7:	73 74                	jae    32d <_init-0x400803>
 2b9:	64 6f                	outsl  %fs:(%rsi),(%dx)
 2bb:	75 74                	jne    331 <_init-0x4007ff>
 2bd:	00 5f 49             	add    %bl,0x49(%rdi)
 2c0:	4f 5f                	rex.WRXB pop %r15
 2c2:	32 5f 31             	xor    0x31(%rdi),%bl
 2c5:	5f                   	pop    %rdi
 2c6:	73 74                	jae    33c <_init-0x4007f4>
 2c8:	64 6f                	outsl  %fs:(%rsi),(%dx)
 2ca:	75 74                	jne    340 <_init-0x4007f0>
 2cc:	5f                   	pop    %rdi
 2cd:	00 5f 49             	add    %bl,0x49(%rdi)
 2d0:	4f 5f                	rex.WRXB pop %r15
 2d2:	6c                   	insb   (%dx),%es:(%rdi)
 2d3:	6f                   	outsl  %ds:(%rsi),(%dx)
 2d4:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 2d7:	74 00                	je     2d9 <_init-0x400857>
 2d9:	47                   	rex.RXB
 2da:	4e 55                	rex.WRX push %rbp
 2dc:	20 43 31             	and    %al,0x31(%rbx)
 2df:	31 20                	xor    %esp,(%rax)
 2e1:	36 2e 33 2e          	ss xor %cs:(%rsi),%ebp
 2e5:	30 20                	xor    %ah,(%rax)
 2e7:	32 30                	xor    (%rax),%dh
 2e9:	31 37                	xor    %esi,(%rdi)
 2eb:	30 35 31 36 20 2d    	xor    %dh,0x2d203631(%rip)        # 2d203922 <_end+0x2cbffcf2>
 2f1:	6d                   	insl   (%dx),%es:(%rdi)
 2f2:	74 75                	je     369 <_init-0x4007c7>
 2f4:	6e                   	outsb  %ds:(%rsi),(%dx)
 2f5:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 2fb:	72 69                	jb     366 <_init-0x4007ca>
 2fd:	63 20                	movslq (%rax),%esp
 2ff:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 304:	68 3d 78 38 36       	pushq  $0x3638783d
 309:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
 30e:	67 67 64 62          	addr32 addr32 fs (bad) 
 312:	20                   	.byte 0x20
 313:	2d                   	.byte 0x2d
 314:	4f                   	rex.WRXB
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
  1b:	a8 00                	test   $0x0,%al
  1d:	00 00                	add    %al,(%rax)
  1f:	00 00                	add    %al,(%rax)
  21:	00 00                	add    %al,(%rax)
  23:	04 00                	add    $0x0,%al
  25:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  29:	a8 00                	test   $0x0,%al
  2b:	00 00                	add    %al,(%rax)
  2d:	00 00                	add    %al,(%rax)
  2f:	00 00                	add    %al,(%rax)
  31:	bb 00 00 00 00       	mov    $0x0,%ebx
  36:	00 00                	add    %al,(%rax)
  38:	00 01                	add    %al,(%rcx)
  3a:	00 55 bb             	add    %dl,-0x45(%rbp)
  3d:	00 00                	add    %al,(%rax)
  3f:	00 00                	add    %al,(%rax)
  41:	00 00                	add    %al,(%rax)
  43:	00 d8                	add    %bl,%al
  45:	00 00                	add    %al,(%rax)
  47:	00 00                	add    %al,(%rax)
  49:	00 00                	add    %al,(%rax)
  4b:	00 04 00             	add    %al,(%rax,%rax,1)
  4e:	f3 01 55 9f          	repz add %edx,-0x61(%rbp)
  52:	d8 00                	fadds  (%rax)
  54:	00 00                	add    %al,(%rax)
  56:	00 00                	add    %al,(%rax)
  58:	00 00                	add    %al,(%rax)
  5a:	e2 00                	loop   5c <_init-0x400ad4>
  5c:	00 00                	add    %al,(%rax)
  5e:	00 00                	add    %al,(%rax)
  60:	00 00                	add    %al,(%rax)
  62:	01 00                	add    %eax,(%rax)
  64:	55                   	push   %rbp
  65:	e2 00                	loop   67 <_init-0x400ac9>
  67:	00 00                	add    %al,(%rax)
  69:	00 00                	add    %al,(%rax)
  6b:	00 00                	add    %al,(%rax)
  6d:	f6 00 00             	testb  $0x0,(%rax)
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
  b8:	00 a8 00 00 00 00    	add    %ch,0x0(%rax)
  be:	00 00                	add    %al,(%rax)
  c0:	00 04 00             	add    %al,(%rax,%rax,1)
  c3:	f3 01 54 9f a8       	repz add %edx,-0x58(%rdi,%rbx,4)
  c8:	00 00                	add    %al,(%rax)
  ca:	00 00                	add    %al,(%rax)
  cc:	00 00                	add    %al,(%rax)
  ce:	00 bb 00 00 00 00    	add    %bh,0x0(%rbx)
  d4:	00 00                	add    %al,(%rax)
  d6:	00 01                	add    %al,(%rcx)
  d8:	00 54 bb 00          	add    %dl,0x0(%rbx,%rdi,4)
  dc:	00 00                	add    %al,(%rax)
  de:	00 00                	add    %al,(%rax)
  e0:	00 00                	add    %al,(%rax)
  e2:	f6 00 00             	testb  $0x0,(%rax)
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
 134:	00 50 00             	add    %dl,0x0(%rax)
	...
