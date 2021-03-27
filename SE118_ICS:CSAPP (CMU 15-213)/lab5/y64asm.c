#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "y64asm.h"

line_t *line_head = NULL;
line_t *line_tail = NULL;
int lineno = 0;
int max_byte = 0;

#define err_print(_s, _a ...) do { \
  if (lineno < 0) \
    fprintf(stderr, "[--]: "_s"\n", ## _a); \
  else \
    fprintf(stderr, "[L%d]: "_s"\n", lineno, ## _a); \
} while (0);

// void set_n_val(byte_t *dest, long val, int bytes)
// {
// 	for (int i = 0; i < bytes; i++) {
// 		dest[i] = val & 0xFF;
// 		val >>= 8;
// 	}	
// }

int64_t vmaddr = 0;    /* vm addr */

/* register table */
const reg_t reg_table[REG_NONE] = {
    {"%rax", REG_RAX, 4},
    {"%rcx", REG_RCX, 4},
    {"%rdx", REG_RDX, 4},
    {"%rbx", REG_RBX, 4},
    {"%rsp", REG_RSP, 4},
    {"%rbp", REG_RBP, 4},
    {"%rsi", REG_RSI, 4},
    {"%rdi", REG_RDI, 4},
    {"%r8",  REG_R8,  3},
    {"%r9",  REG_R9,  3},
    {"%r10", REG_R10, 4},
    {"%r11", REG_R11, 4},
    {"%r12", REG_R12, 4},
    {"%r13", REG_R13, 4},
    {"%r14", REG_R14, 4}
};
const reg_t* find_register(char *name)
{
    int i;
    for (i = 0; i < REG_NONE; i++)
        if (!strncmp(name, reg_table[i].name, reg_table[i].namelen))
            return &reg_table[i];
    return NULL;
}


/* instruction set */
instr_t instr_set[] = {
    {"nop", 3,   HPACK(I_NOP, F_NONE), 1 },
    {"halt", 4,  HPACK(I_HALT, F_NONE), 1 },
    {"rrmovq", 6,HPACK(I_RRMOVQ, F_NONE), 2 },
    {"cmovle", 6,HPACK(I_RRMOVQ, C_LE), 2 },
    {"cmovl", 5, HPACK(I_RRMOVQ, C_L), 2 },
    {"cmove", 5, HPACK(I_RRMOVQ, C_E), 2 },
    {"cmovne", 6,HPACK(I_RRMOVQ, C_NE), 2 },
    {"cmovge", 6,HPACK(I_RRMOVQ, C_GE), 2 },
    {"cmovg", 5, HPACK(I_RRMOVQ, C_G), 2 },
    {"irmovq", 6,HPACK(I_IRMOVQ, F_NONE), 10 },
    {"rmmovq", 6,HPACK(I_RMMOVQ, F_NONE), 10 },
    {"mrmovq", 6,HPACK(I_MRMOVQ, F_NONE), 10 },
    {"addq", 4,  HPACK(I_ALU, A_ADD), 2 },
    {"subq", 4,  HPACK(I_ALU, A_SUB), 2 },
    {"andq", 4,  HPACK(I_ALU, A_AND), 2 },
    {"xorq", 4,  HPACK(I_ALU, A_XOR), 2 },
    {"jmp", 3,   HPACK(I_JMP, C_YES), 9 },
    {"jle", 3,   HPACK(I_JMP, C_LE), 9 },
    {"jl", 2,    HPACK(I_JMP, C_L), 9 },
    {"je", 2,    HPACK(I_JMP, C_E), 9 },
    {"jne", 3,   HPACK(I_JMP, C_NE), 9 },
    {"jge", 3,   HPACK(I_JMP, C_GE), 9 },
    {"jg", 2,    HPACK(I_JMP, C_G), 9 },
    {"call", 4,  HPACK(I_CALL, F_NONE), 9 },
    {"ret", 3,   HPACK(I_RET, F_NONE), 1 },
    {"pushq", 5, HPACK(I_PUSHQ, F_NONE), 2 },
    {"popq", 4,  HPACK(I_POPQ, F_NONE),  2 },
    {".byte", 5, HPACK(I_DIRECTIVE, D_DATA), 1 },
    {".word", 5, HPACK(I_DIRECTIVE, D_DATA), 2 },
    {".long", 5, HPACK(I_DIRECTIVE, D_DATA), 4 },
    {".quad", 5, HPACK(I_DIRECTIVE, D_DATA), 8 },
    {".pos", 4,  HPACK(I_DIRECTIVE, D_POS), 0 },
    {".align", 6,HPACK(I_DIRECTIVE, D_ALIGN), 0 },
    {NULL, 1,    0   , 0 } //end
};

instr_t *find_instr(char *name)
{
    int i;
    for (i = 0; instr_set[i].name; i++)
	if (strncmp(instr_set[i].name, name, instr_set[i].len) == 0)
	    return &instr_set[i];
    return NULL;
}

/* symbol table (don't forget to init and finit it) */
symbol_t *symtab = NULL;

/*
 * find_symbol: scan table to find the symbol
 * args
 *     name: the name of symbol
 *
 * return
 *     symbol_t: the 'name' symbol
 *     NULL: not exist
 */
symbol_t *find_symbol(char *name)
{
	symbol_t *p = symtab->next;
	while (p) {
		int slen = strlen(p->name);
		if (strncmp(p->name, name, slen) == 0) {
			break;
		}
		p = p->next;	
	}
    return p;
}

/*
 * add_symbol: add a new symbol to the symbol table
 * args
 *     name: the name of symbol
 *
 * return
 *     0: success
 *     -1: error, the symbol has exist
 */
int add_symbol(char *name)
{
    /* check duplicate */
	if (find_symbol(name) != NULL) {
		return -1;	
	}
    /* create new symbol_t (don't forget to free it)*/
	symbol_t *new_symbol = (symbol_t *)malloc(sizeof(symbol_t));
    /* add the new symbol_t to symbol table */
	new_symbol->name = name;
	new_symbol->addr = vmaddr;
	new_symbol->next = symtab->next;
	symtab->next = new_symbol;
    return 0;
}

/* relocation table (don't forget to init and finit it) */
reloc_t *reltab = NULL;

/*
 * add_reloc: add a new relocation to the relocation table
 * args
 *     name: the name of symbol
 *
 * return
 *     0: success
 *     -1: error, the symbol has exist
 */
void add_reloc(char *name, bin_t *bin)
{
    /* create new reloc_t (don't forget to free it)*/
	reloc_t *new_reloc = (reloc_t *)malloc(sizeof(reloc_t)); 
    /* add the new reloc_t to relocation table */
	new_reloc->y64bin = bin;
	new_reloc->name = name;
	new_reloc->next = reltab->next;
	reltab->next = new_reloc;
}


/* macro for parsing y64 assembly code */
#define IS_DIGIT(s) ((*(s)>='0' && *(s)<='9') || *(s)=='-' || *(s)=='+')
#define IS_LETTER(s) ((*(s)>='a' && *(s)<='z') || (*(s)>='A' && *(s)<='Z'))
#define IS_COMMENT(s) (*(s)=='#')
#define IS_REG(s) (*(s)=='%')
#define IS_IMM(s) (*(s)=='$')

#define IS_BLANK(s) (*(s)==' ' || *(s)=='\t')
#define IS_END(s) (*(s)=='\0')

#define SKIP_BLANK(s) do {  \
  while(!IS_END(s) && IS_BLANK(s))  \
    (s)++;    \
} while(0);

/* return value from different parse_xxx function */
typedef enum { PARSE_ERR=-1, PARSE_REG, PARSE_DIGIT, PARSE_SYMBOL, 
    PARSE_MEM, PARSE_DELIM, PARSE_INSTR, PARSE_LABEL} parse_t;

/*
 * parse_instr: parse an expected data token (e.g., 'rrmovq')
 * args
 *     ptr: point to the start of string
 *     inst: point to the inst_t within instr_set
 *
 * return
 *     PARSE_INSTR: success, move 'ptr' to the first char after token,
 *                            and store the pointer of the instruction to 'inst'
 *     PARSE_ERR: error, the value of 'ptr' and 'inst' are undefined
 */
//v

parse_t parse_instr(char **ptr, instr_t **inst)
{
    /* skip the blank */

    char *str = *ptr;//指向字符串数组的第一个
    instr_t * instFound;
    SKIP_BLANK(str);
    /* find_instr and check end */
    instFound = find_instr(str);
    if(instFound){
        str += instFound->len;//不能是ptr+=len
        if(!IS_END(str) && !IS_BLANK(str))
        {
        return PARSE_ERR;
        }
    }else return PARSE_ERR;
    /* set 'ptr' and 'inst' */
    *inst = instFound;
    *ptr = str;
    return PARSE_INSTR;
}

/*
 * parse_delim: parse an expected delimiter token (e.g., ',')
 * args
 *     ptr: point to the start of string
 *
 * return
 *     PARSE_DELIM: success, move 'ptr' to the first char after token
 *     PARSE_ERR: error, the value of 'ptr' and 'delim' are undefined
 */


parse_t parse_delim(char **ptr, char delim)
{
    /* skip the blank and check */
    char *str = *ptr;
    SKIP_BLANK(str);
    //如果后面跟着的不是要的delim,或者已经到结束了
    if((*str!= delim)||IS_END(str)) {
        err_print("Invalid \'%c\'", delim);
        return PARSE_ERR; 
    }
    /* set 'ptr' */
    str++;
    *ptr =str;
    return PARSE_DELIM;
}



/*
 * parse_reg: parse an expected register token (e.g., '%rax')
 * args
 *     ptr: point to the start of string
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_REG: success, move 'ptr' to the first char after token, 
 *                         and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr' and 'regid' are undefined
 */
//
//含义：给一个指令，找到后面的regid，并把这个regid赋值给regid_t *regid
parse_t parse_reg(char **ptr, regid_t *regid)
{
    /* skip the blank and check */
    char *str = *ptr;
    SKIP_BLANK(str);
    /* find register */
    //如果后面跟着的不是rigid,或者已经到结束了
const reg_t*  regFound = find_register(str);  //
    if(!regFound||IS_END(str) ) {
        err_print("Invalid REG")
        return PARSE_ERR; 
    }
    /* set 'ptr' and 'regid' */
    str += regFound->namelen;
    *ptr = str;
    *regid = regFound->id;
    return PARSE_REG;
}



/*
 * parse_symbol: parse an expected symbol token (e.g., 'Main')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_SYMBOL: success, move 'ptr' to the first char after token,
 *                               and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' and 'name' are undefined
 */


parse_t parse_symbol(char **ptr, char **name)
{
    /* skip the blank and check */
    char *str = *ptr;
    SKIP_BLANK(str);
    //if arrived at the end 
    if(IS_END(str)){ 
        // err_print("Invalid SYMBOL")
        return PARSE_ERR; 
    }
    /* allocate name and copy to it */
    char* symbolName = (char*)malloc( 40 * sizeof(char));
    //we must save the start position of the symbolName for strcmp,
    // so we need to create another symbol.
    char* cur = symbolName;
    //notion: symbol shouldn't start with a digit
    while (IS_LETTER(str) ||(cur != symbolName && IS_DIGIT(str))){ 
        *cur = *str;
        cur++;
        str++;
    }
    *cur ='\0';
    /* set 'ptr' and 'name' */
    *name =  symbolName;
    *ptr = str;
    //if the str doesn't correspond to the regulation listed above,there
    // could be no symbolName eg. start with digit. So we need to check it.
    if (strlen(symbolName) == 0) {
		return PARSE_ERR;
	}
    return PARSE_SYMBOL;
}



/*
 * parse_digit: parse an expected digit token (e.g., '0x100')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, move 'ptr' to the first char after token
 *                            and store the value of digit to 'value'
 *     PARSE_ERR: error, the value of 'ptr' and 'value' are undefined
 */

//V 
/* 
    long strtol( const char *str, char **str_end, int base );
    The function sets the pointer pointed to by str_end to point to 
    the character past the last character interpreted. If str_end is 
    a null pointer, it is ignored.
    当 base= 0 时，默认采用 10 进制转换，但如果遇到 '0x' / '0X' 前置字符则会
    使用 16 进制转换，遇到 '0' 前置字符则会使用 8 进制转换。
    The strtoul subroutine provides the same functions but returns an unsigned long integer.
    The strtoll and strtoull subroutines provide the same functions but return long long integers.
*/

parse_t parse_digit(char **ptr, long *value)
{
    /* skip the blank and check */
    char *str = *ptr;
    SKIP_BLANK(str);
    if(IS_END(str)|| !IS_DIGIT(str)){ 
        return PARSE_ERR; 
    }
    
    char *str_end = str;
    long val=0;
    /* calculate the digit, (NOTE: see strtoll()) */
    val = strtoul(str, &str_end, 0);
    /* set 'ptr' and 'value' */
    *value = val;
    *ptr = str_end;
    return PARSE_DIGIT;
}



/*
 * parse_imm: parse an expected immediate token (e.g., '$0x100' or 'STACK')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, the immediate token is a digit,
 *                            move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, the immediate token is a symbol,
 *                            move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name' 
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */
//V

parse_t parse_imm(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    char *str = *ptr;
    parse_t parseT;
    SKIP_BLANK(str);
    if(IS_END(str)){ 
        return PARSE_ERR; 
    }
    /* if IS_IMM, then parse the digit */
    if(*str == '$'){
        str++;
        //notion: It may not be a number after the $
        if(!IS_DIGIT(str)){
            err_print("Invalid Immediate");
            return PARSE_ERR;
        }
        parseT = parse_digit(&str, value);
    }
    /* if IS_LETTER, then parse the symbol */
    else{
        parseT = parse_symbol(&str, name);
    }
    /* set 'ptr' and 'name' or 'value' */
    *ptr = str;
    return parseT;
}

/*
 * parse_mem: parse an expected memory token (e.g., '8(%rbp)')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_MEM: success, move 'ptr' to the first char after token,
 *                          and store the value of digit to 'value',
 *                          and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr', 'value' and 'regid' are undefined
 */
//V 
parse_t parse_mem(char **ptr, long *value, regid_t *regid)
{
    /* skip the blank and check */
    char *str = *ptr;
    long valTmp=0;
    parse_t parseT;
    SKIP_BLANK(str);
    if(IS_END(str)){ 
        err_print("Invalid MEM");
        return PARSE_ERR; 
    }
    /* calculate the digit and register, (ex: (%rbp) or 8(%rbp)) */
    if(IS_DIGIT(str) || *str =='-'){
        parseT = parse_digit(&str, &valTmp);
        if(parseT == PARSE_ERR){
            err_print("Invalid MEM");
            return PARSE_ERR;
        }
    }
    else valTmp = 0;
    if(*str!= '(') {
        err_print("Invalid MEM");
        return PARSE_ERR; 
    }
    str++;
    parseT = parse_reg(&str, regid);
    if(parseT == PARSE_ERR ||*str!= ')'){
        err_print("Invalid MEM");
        return PARSE_ERR;
    }
    str++;
    /* set 'ptr', 'value' and 'regid' */
    *ptr = str;
    *value = valTmp;
    return parseT;
}








/*
 * parse_data: parse an expected data token (e.g., '0x100' or 'array')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, data token is a digit,
 *                            and move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, data token is a symbol,
 *                            and move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name' 
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */
//v
parse_t parse_data(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    char *str = *ptr;
    parse_t parseT=PARSE_ERR;
    SKIP_BLANK(str);
    if(IS_END(str)){ 
        err_print("Invalid DATA");
        return PARSE_ERR; 
    }
    /* if IS_DIGIT, then parse the digit */
    if(IS_DIGIT(str)){
        parseT = parse_digit(&str,value);
        if(parseT ==PARSE_ERR) {
            err_print("Invalid DATA");
            return PARSE_ERR; 
        }
    }
    /* if IS_LETTER, then parse the symbol */
    if(IS_LETTER(str)){
        parseT = parse_symbol(&str, name);
        if(parseT ==PARSE_ERR) {
            err_print("Invalid DATA");
            return PARSE_ERR; 
        }
    }
    /* set 'ptr', 'name' and 'value' */
    if(str == *ptr){
        err_print("Invalid DATA");
        return PARSE_ERR; 
    }
    *ptr = str;
    return parseT;
}


/*
 * parse_label: parse an expected label token (e.g., 'Loop:')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_LABEL: success, move 'ptr' to the first char after token
 *                            and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' is undefined
 */

//V
//We can just use parse_symbol, the malloc has completed there.
parse_t parse_label(char **ptr, char **name)
{
    /* skip the blank and check */
    char *str = *ptr;
    SKIP_BLANK(str);
    if(IS_END(str)){ 
        err_print("Invalid LABEL");
        return PARSE_ERR; 
    }
    /* allocate name and copy to it */
    if(parse_symbol(&str, name) == PARSE_ERR && *(str)!= ':'){
        err_print("Invalid LABEL");
        return PARSE_ERR; 
    }
    str++;
    /* set 'ptr' and 'name' */
    *ptr = str;
    return PARSE_LABEL;
}


/*
 * parse_line: parse a line of y64 code (e.g., 'Loop: mrmovq (%rcx), %rsi')
 * (you could combine above parse_xxx functions to do it)
 * args
 *     line: point to a line_t data with a line of y64 assembly code
 *
 * return
 *     PARSE_XXX: success, fill line_t with assembled y64 code
 *     PARSE_ERR: error, try to print err information (e.g., instr type and line number)
 */




// parse_line 思路
// 三种返回值：
// TYPE_COMM, TYPE_INS, TYPE_ERR
// 目标：将字符串的指令编码为二进制的代码，即设置line的y64bin（code）,vmaddr(虚拟内存地址)，type  返回line->type
// 传入参数

// typedef struct line {
//     type_t type;  /* TYPE_COMM: no y64bin, TYPE_INS: both y64bin and y64asm */
//     bin_t y64bin;
//     char *y64asm;
//     struct line *next;
// } line_t;

// 其中y64asm 为对应的指令字符串 ，bin 为应该对应的二进制code

// typedef struct bin {
//     int64_t addr;
//     byte_t codes[10];
//     int bytes;  /* the size of line */
// } bin_t;

// line的分类：
// 1. instruction
// 	typedef enum { I_HALT, I_NOP, I_RRMOVQ, I_IRMOVQ, I_RMMOVQ, I_MRMOVQ,
//     	I_ALU, I_JMP, I_CALL, I_RET, I_PUSHQ, I_POPQ, I_DIRECTIVE } itype_t;
//  	所有的把icode ,ifunc作为bin.code[0], 除了前面两个，每条指令各自设置自己的	
// 	bin.code[i]并判定是否是符合规范的parse_line。 其中push pop可以合并，rrmov和		alu	都是使用两个寄存器，合并；I_HALT, I_NOP , I_RET不设置其他合并。
//  	 I_DIRECTIVE根据ifunc 设置各个参数。
// 2. comment
// 3. label

// add_reloc : 向重定位表中增加元素，是不是只有加进去了，才能实现跳转。
// I_IRMOVQ
// I_JMP
// D_DATA




type_t parse_line(line_t *getLine)
{
/* when finish parse an instruction or lable, we still need to continue check 
* e.g., 
*  Loop: mrmovl (%rbp), %rcx
*           call SUM  #invoke SUM function */

    //分類：ret, nop, halt 无需操作
    //I_RRMOVQ, I_ALU 需要两个寄存器
    //I_MRMOVQ
    //I_IRMOVQ
    //I_RMMOVQ
    //I_CALL
    //I_JMP
    //I_POPQ I_PUSHQ
	char *str = getLine->y64asm;
	char *name;
	long value;
	instr_t *instrGet;
    regid_t rigA;
	regid_t rigB;
	bin_t bin;

    /* skip blank and check IS_END */
	SKIP_BLANK(str);
	if (IS_END(str) || IS_COMMENT(str)) {
		return getLine->type;
	}
    /* is a comment ? */
    /* is a label ? */
    /* is an instruction ? */
	if (IS_LETTER(str) || *str == '.') {
		char *save_str = str;
		if (parse_instr(&str, &instrGet) == PARSE_ERR) {
			str = save_str;
			if (parse_label(&str, &name) == PARSE_ERR) {
				getLine->type = TYPE_ERR;
				return getLine->type; 
                //the default type is comment. So if it is a label, it returns TYPE_COM
			}
			if (add_symbol(name) < 0) { //the symbol exist
				 err_print("Dup symbol:%s", name); 
				getLine->type = TYPE_ERR;
				return getLine->type;
			}
			SKIP_BLANK(str);
			if (IS_END(str) || IS_COMMENT(str)) {
				getLine->y64bin.bytes = 0;
				getLine->y64bin.addr = vmaddr;
				getLine->type = TYPE_INS;
				return getLine->type;
			}
			if (parse_instr(&str, &instrGet) == PARSE_ERR) {
				getLine ->type = TYPE_ERR;
				return getLine->type;
			}
		}	
		switch (HIGH(instrGet -> code)) {
            case I_NOP:
			case I_RET:
			case I_HALT:
            case I_DIRECTIVE:
				break;
			case I_RRMOVQ: /* 2:x regA,regB - e.g., rrmovl %esp, %ebp */
			case I_ALU: /* 6:x regA,regB - e.g., xorl %eax, %eax */
            //eg. ADD rA, rB 识别三种对象，如果不行的话返回error
				if (parse_reg(&str, &rigA) == PARSE_ERR ||
						parse_delim(&str, ',') == PARSE_ERR ||
						parse_reg(&str, &rigB) == PARSE_ERR) {
                            
					getLine->type = TYPE_ERR;
					return getLine->type;
				}
				bin.codes[1] = HPACK(rigA, rigB);
				break;

            case I_MRMOVQ: /* 5:0 D(regB), regA - e.g., mrmovl 8(%ebp), %ecx */
            //mrmov D(rA),rB 顺序识别三种对象，如果不行的话返回error
				if (parse_mem(&str, &value, &rigB) == PARSE_ERR ||
						parse_delim(&str, ',') == PARSE_ERR ||
						parse_reg(&str, &rigA)) {
					getLine->type = TYPE_ERR;
					return getLine -> type;//思路同上
				}
                for (int i = 0; i < 8; i++) {
		            bin.codes[i+2] = value & 0xFF;
		            value >>= 8;
	            }
                bin.codes[1] = HPACK(rigA, rigB);
				break;

			case I_IRMOVQ: /* 3:0 Imm, regB - e.g., irmovl $-1, %ebx */
				{ 
					parse_t pt = parse_imm(&str, &name, &value);
					if (pt == PARSE_ERR ||
							parse_delim(&str, ',') == PARSE_ERR ||
							parse_reg(&str, &rigB) == PARSE_ERR) {
						getLine->type = TYPE_ERR;
						return getLine->type;
					}
					bin.codes[1] = HPACK(REG_NONE, rigB);//FB;
                    if (pt == PARSE_SYMBOL) {
						add_reloc(name, &getLine->y64bin);
                        //add a new relocation to the relocation table
                        //? don't need to be written ?
					}else if(pt == PARSE_DIGIT){
                        for (int i = 0; i < 8; i++) {
		                    bin.codes[i+2] = value & 0xFF;
		                    value >>= 8;
	                    }
                    }
                    break;
				}
                	
			
            case I_RMMOVQ:/* 4:0 regA, D(regB) - e.g., rmmovl %eax, 8(%esp)  */
				if (parse_reg(&str, &rigA) == PARSE_ERR ||
						parse_delim(&str, ',') == PARSE_ERR ||
						parse_mem(&str, &value, &rigB) == PARSE_ERR) {
					getLine->type = TYPE_ERR;
					return getLine->type;
				}
				for (int i = 0; i < 8; i++) {
		            bin.codes[i+2] = value & 0xFF;
		            value >>= 8;
	            }
                bin.codes[1] = HPACK(rigA, rigB);
				break;
			
			case I_CALL:/* 8:x dest - e.g., call Main */
            case I_JMP: /* 7:x dest - e.g., je End */
				if (parse_symbol(&str, &name) == PARSE_ERR) {
					err_print("Invalid DEST");
					getLine->type = TYPE_ERR;
					return getLine->type;
				}
				add_reloc(name, &(getLine->y64bin));
				break;/*no codes just symbol.so neednt change y64bin.codes*/
            case I_POPQ: /* B:0 regA:F - e.g., popl %ebp */
			case I_PUSHQ: /* A:0 regA:F - e.g., pushl %esp */
				if (parse_reg(&str, &rigA) == PARSE_ERR) {
					getLine->type = TYPE_ERR;
					return getLine->type;
				}
				bin.codes[1] = HPACK(rigA, REG_NONE);
				break;
			default:
				break;
		}
		if (HIGH(instrGet->code) != I_DIRECTIVE) {
			bin.addr = vmaddr;
			bin.bytes = instrGet->bytes;   //the length of the instruction
			bin.codes[0] = instrGet->code; // icode and ifun
			getLine->y64bin = bin;         
			getLine->type = TYPE_INS;      
			vmaddr += instrGet->bytes;     
		} else {/* further partition directive according to dtv_t */
			switch (LOW(instrGet->code)) {
                case D_ALIGN: /* .align D - e.g., .align 4 */
					if (parse_digit(&str, &value) == PARSE_ERR) {
						getLine->type = TYPE_ERR;
						return getLine->type;
					}
					vmaddr = (vmaddr + value - 1) / value * value; //向上和value对齐
					getLine->y64bin.bytes = 0;
					getLine->y64bin.addr = vmaddr;
					getLine->type = TYPE_INS;
					break;
				case D_POS:
					if (parse_digit(&str, &value) == PARSE_ERR) {
						getLine->type = TYPE_ERR;
						return getLine->type;
					}
					vmaddr = value;
                    getLine->y64bin.addr = vmaddr;
					getLine->type = TYPE_INS;
					getLine->y64bin.bytes = 0;
					break;
                
				case D_DATA: 
					{
						int bytes = instrGet->bytes;
						parse_t pt = parse_data(&str, &name, &value);
						if (pt == PARSE_DIGIT) {
                        for (int i = 0; i < bytes; i++) {
                        getLine->y64bin.codes[i] = value & 0xFF;
                        value >>= 8;
                        }
						} else if (pt == PARSE_SYMBOL) {
							add_reloc(name, &(getLine->y64bin));
						} else if (pt == PARSE_ERR) {
							getLine->type = TYPE_ERR;
							return getLine->type;
						}
						getLine->y64bin.bytes = bytes;
						getLine->y64bin.addr = vmaddr;
						getLine->type = TYPE_INS;
						vmaddr += bytes;
						break;
					}
				default:
					break;
			}		
		}
	}
    return getLine->type;
}


/*
 * assemble: assemble an y64 file (e.g., 'asum.ys')
 * args
 *     in: point to input file (an y64 assembly file)
 *
 * return
 *     0: success, assmble the y64 file to a list of line_t
 *     -1: error, try to print err information (e.g., instr type and line number)
 */
int assemble(FILE *in)
{
    static char asm_buf[MAX_INSLEN]; /* the current line of asm code */
    line_t *line;
    int slen;
    char *y64asm;

    /* read y64 code line-by-line, and parse them to generate raw y64 binary code list */
    while (fgets(asm_buf, MAX_INSLEN, in) != NULL) {
        slen  = strlen(asm_buf);
        while ((asm_buf[slen-1] == '\n') || (asm_buf[slen-1] == '\r')) { 
            asm_buf[--slen] = '\0'; /* replace terminator */
        }

        /* store y64 assembly code */
        y64asm = (char *)malloc(sizeof(char) * (slen + 1)); // free in finit
        strcpy(y64asm, asm_buf);

        line = (line_t *)malloc(sizeof(line_t)); // free in finit
        memset(line, '\0', sizeof(line_t));

        line->type = TYPE_COMM; //默认值是comment
        line->y64asm = y64asm;
        line->next = NULL;

        line_tail->next = line; //在尾部插入新line
        line_tail = line;
        lineno ++;

        if (parse_line(line) == TYPE_ERR) {
            return -1;
        }
		if (line->type == TYPE_INS) {
			bin_t bin = line->y64bin;
			if (bin.bytes > 0) {
				int byte = bin.addr + bin.bytes;
				if (byte > max_byte) {
					max_byte = byte;
				}
			}
		}
    }
	lineno = -1;
    return 0;
}

/*
 * relocate: relocate the raw y64 binary code with symbol address
 *
 * return
 *     0: success
 *     -1: error, try to print err information (e.g., addr and symbol)
 */

void saveVal(byte_t *ptr, long value, int bytes)
{
    for(int i = 0; i < bytes; ++i)
    {
        ptr[i] = ((value >> (i * 8)) & 0xff);
    }
}

int relocate(void)
{
    reloc_t *tempVal = NULL;
    
    tempVal = reltab->next;
    while (tempVal) {
        /* find symbol */
        char *tempname = (char*)malloc(strlen(tempVal->name)+1);
        memcpy(tempname, tempVal->name, strlen(tempVal->name)+1);
        symbol_t *tempsymbol = find_symbol(tempname);
        if(NULL == tempsymbol)
        {
            err_print("Unknown symbol:'%s'", tempname);
            return -1;
        }
        /* relocate y64bin according itype */
        byte_t *value;
        switch(HIGH(tempVal->y64bin->codes[0]))
        {
            case I_IRMOVQ:
            value = &tempVal->y64bin->codes[2];
            break;
            case I_JMP:
            case I_CALL:
            value = &tempVal->y64bin->codes[1];
            break;
            default:
            value = &tempVal->y64bin->codes[0];
            break;
        }
        saveVal(value, tempsymbol->addr, 8);
        /* next */
        tempVal = tempVal->next;
    }
    return 0;
}


/*
 * binfile: generate the y64 binary file
 * args
 *     out: point to output file (an y64 binary file)
 *
 * return
 *     0: success
 *     -1: error
 */
int binfile(FILE *out)
{
    /* prepare image with y64 binary code */
	line_t *tmp = line_head->next;
	byte_t *buf = (byte_t *)calloc(max_byte, sizeof(byte_t));
	while (tmp) {
		bin_t bin = tmp->y64bin;
		if (tmp->type == TYPE_INS) {
			memcpy(buf+bin.addr, bin.codes, bin.bytes);
		}
		tmp = tmp->next;
	} 

    /* binary write y64 code to output file (NOTE: see fwrite()) */
	fwrite(buf, sizeof(byte_t), max_byte, out);
	free(buf); 
    return 0;
}


/* whether print the readable output to screen or not ? */
bool_t screen = FALSE; 

static void hexstuff(char *dest, int value, int len)
{
    int i;
    for (i = 0; i < len; i++) {
        char c;
        int h = (value >> 4*i) & 0xF;
        c = h < 10 ? h + '0' : h - 10 + 'a';
        dest[len-i-1] = c;
    }
}

void print_line(line_t *line)
{
    char buf[64];

    /* line format: 0xHHH: cccccccccccc | <line> */
    if (line->type == TYPE_INS) {
        bin_t *y64bin = &line->y64bin;
        int i;
        
        strcpy(buf, "  0x000:                      | ");
        
        hexstuff(buf+4, y64bin->addr, 3);
        if (y64bin->bytes > 0)
            for (i = 0; i < y64bin->bytes; i++)
                hexstuff(buf+9+2*i, y64bin->codes[i]&0xFF, 2);
    } else {
        strcpy(buf, "                              | ");
    }

    printf("%s%s\n", buf, line->y64asm);
}

/* 
 * print_screen: dump readable binary and assembly code to screen
 * (e.g., Figure 4.8 in ICS book)
 */
void print_screen(void)
{
    line_t *tmp = line_head->next;
    while (tmp != NULL) {
        print_line(tmp);
        tmp = tmp->next;
    }
}

/* init and finit */
void init(void)
{
    reltab = (reloc_t *)malloc(sizeof(reloc_t)); // free in finit
    memset(reltab, 0, sizeof(reloc_t));

    symtab = (symbol_t *)malloc(sizeof(symbol_t)); // free in finit
    memset(symtab, 0, sizeof(symbol_t));

    line_head = (line_t *)malloc(sizeof(line_t)); // free in finit
    memset(line_head, 0, sizeof(line_t));
    line_tail = line_head;
    lineno = 0;
}

void finit(void)
{
    reloc_t *tempVal = NULL;
    do {
        tempVal = reltab->next;
        if (reltab->name) 
            free(reltab->name);
        free(reltab);
        reltab = tempVal;
    } while (reltab);
    
    symbol_t *stmp = NULL;
    do {
        stmp = symtab->next;
        if (symtab->name) 
            free(symtab->name);
        free(symtab);
        symtab = stmp;
    } while (symtab);

    line_t *ltmp = NULL;
    do {
        ltmp = line_head->next;
        if (line_head->y64asm) 
            free(line_head->y64asm);
        free(line_head);
        line_head = ltmp;
    } while (line_head);
}

static void usage(char *pname)
{
    printf("Usage: %s [-v] file.ys\n", pname);
    printf("   -v print the readable output to screen\n");
    exit(0);
}

int main(int argc, char *argv[])
{
    int rootlen;
    char infname[512];
    char outfname[512];
    int nextarg = 1;
    FILE *in = NULL, *out = NULL;
    
    if (argc < 2)
        usage(argv[0]);
    
    if (argv[nextarg][0] == '-') {
        char flag = argv[nextarg][1];
        switch (flag) {
          case 'v':
            screen = TRUE;
            nextarg++;
            break;
          default:
            usage(argv[0]);
        }
    }

    /* parse input file name */
    rootlen = strlen(argv[nextarg])-3;
    /* only support the .ys file */
    if (strcmp(argv[nextarg]+rootlen, ".ys"))
        usage(argv[0]);
    
    if (rootlen > 500) {
        err_print("File name too long");
        exit(1);
    }
 

    /* init */
    init();

    
    /* assemble .ys file */
    strncpy(infname, argv[nextarg], rootlen);
    strcpy(infname+rootlen, ".ys");
    in = fopen(infname, "r");
    if (!in) {
        err_print("Can't open input file '%s'", infname);
        exit(1);
    }
    
    if (assemble(in) < 0) {
        err_print("Assemble y64 code error");
        fclose(in);
        exit(1);
    }
    fclose(in);


    /* relocate binary code */
    if (relocate() < 0) {
        err_print("Relocate binary code error");
        exit(1);
    }


    /* generate .bin file */
    strncpy(outfname, argv[nextarg], rootlen);
    strcpy(outfname+rootlen, ".bin");
    out = fopen(outfname, "wb");
    if (!out) {
        err_print("Can't open output file '%s'", outfname);
        exit(1);
    }

    if (binfile(out) < 0) {
        err_print("Generate binary file error");
        fclose(out);
        exit(1);
    }
    fclose(out);
    
    /* print to screen (.yo file) */
    if (screen)
       print_screen(); 

    /* finit */
    finit();
    return 0;
}

