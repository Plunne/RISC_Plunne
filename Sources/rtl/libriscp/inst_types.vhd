----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 05:27:10 PM
-- Design Name: 
-- Module Name: inst_types
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package inst_types is

-------------
-- OPCODES --
-------------

-- OpCode Range
constant OPCODE_MIN         : integer := 0;
constant OPCODE_MAX         : integer := 6;

-- OpCode Size
constant OPCODE_SIZE    : integer := 7;
constant OPCODE_SIZEM1  : integer := OPCODE_SIZE -1;

-- OpCode Type
subtype t_OpCode is std_logic_vector(OPCODE_SIZEM1 downto 0);

-- Register
constant OPCODE_R_OPE       : t_OpCode  := "0110011";
-- Immediate
constant OPCODE_I_OPE       : t_OpCode  := "0010011";
-- Load
constant OPCODE_I_LOAD      : t_OpCode  := "0000011";
-- Store
constant OPCODE_S_STORE     : t_OpCode  := "0100011";
-- Branch
constant OPCODE_B_BRANCH    : t_OpCode  := "1100011";
-- Jump
constant OPCODE_J_JAL       : t_OpCode  := "1101111";
constant OPCODE_I_JALR      : t_OpCode  := "1100111";
-- Upper
constant OPCODE_U_LUI       : t_OpCode  := "0110111";
constant OPCODE_U_AUIPC     : t_OpCode  := "0010111";
-- Environment
constant OPCODE_I_ENV       : t_OpCode  := "1110011";

--------
-- RD --
--------

-- Rd Range
constant RD_MIN         : integer := 7;
constant RD_MAX         : integer := 11;

-- Rd Size
constant RD_SIZE        : integer := 5;
constant RD_SIZEM1      : integer := RD_SIZE -1;

-- Rd Type
subtype t_Rd is std_logic_vector(RD_SIZEM1 downto 0);

---------
-- RS1 --
---------

-- Rs1 Range
constant RS1_MIN        : integer := 15;
constant RS1_MAX        : integer := 19;

-- Rs1 Size
constant RS1_SIZE       : integer := 5;
constant RS1_SIZEM1     : integer := RD_SIZE -1;

-- Rs1 Type
subtype t_Rs1 is std_logic_vector(RS1_SIZEM1 downto 0);

---------
-- RS2 --
---------

-- Rs2 Range
constant RS2_MIN        : integer := 20;
constant RS2_MAX        : integer := 24;

-- Rs2 Size
constant RS2_SIZE       : integer := 5;
constant RS2_SIZEM1     : integer := RD_SIZE -1;

-- Rs2 Type
subtype t_Rs2 is std_logic_vector(RS2_SIZEM1 downto 0);

------------
-- FUNCT3 --
------------

-- Funct3 Range
constant FUNCT3_MIN     : integer := 12;
constant FUNCT3_MAX     : integer := 14;

-- Funct3 Size
constant FUNCT3_SIZE    : integer := 3;
constant FUNCT3_SIZEM1  : integer := FUNCT3_SIZE -1;

-- Funct3 Type
subtype t_Funct3 is std_logic_vector(FUNCT3_SIZEM1 downto 0);

-- Funct3 Values
constant FUNCT3_X0      : t_Funct3  := B"000";
constant FUNCT3_X1      : t_Funct3  := B"001";
constant FUNCT3_X2      : t_Funct3  := B"010";
constant FUNCT3_X3      : t_Funct3  := B"011";
constant FUNCT3_X4      : t_Funct3  := B"100";
constant FUNCT3_X5      : t_Funct3  := B"101";
constant FUNCT3_X6      : t_Funct3  := B"110";
constant FUNCT3_X7      : t_Funct3  := B"111";

------------
-- FUNCT7 --
------------

-- Funct7 Range
constant FUNCT7_MIN     : integer := 25;
constant FUNCT7_MAX     : integer := 31;

-- Funct7 Size
constant FUNCT7_SIZE    : integer := 7;
constant FUNCT7_SIZEM1  : integer := FUNCT7_SIZE -1;

-- Funct7 Type
subtype t_Funct7 is std_logic_vector(FUNCT7_SIZEM1 downto 0);

-- Funct7 Values
constant FUNCT7_X00     : t_Funct7  := B"0000000";
constant FUNCT7_X01     : t_Funct7  := B"0000001";
constant FUNCT7_X20     : t_Funct7  := B"0100000";

--------------
-- FUNCTION --
--------------

-- Function Size
constant FUNCTION_SIZE    : integer := 10;
constant FUNCTION_SIZEM1  : integer := FUNCTION_SIZE -1;

-- Function Type
subtype t_Function is std_logic_vector(FUNCTION_SIZEM1 downto 0);

---------------
-- IMMEDIATE --
---------------

-- Immediate Type Size
constant IMM_TYPE_SIZE      : integer := 3;
constant IMM_TYPE_SIZEM1    : integer := IMM_TYPE_SIZE -1;

-- Immediate Type Size
subtype t_ImmType is std_logic_vector(IMM_TYPE_SIZEM1 downto 0);

-- Immediate Type Values
constant IMM_TYPE_NONE  : t_ImmType := B"000";
constant IMM_TYPE_I     : t_ImmType := B"001";
constant IMM_TYPE_S     : t_ImmType := B"010";
constant IMM_TYPE_B     : t_ImmType := B"011";
constant IMM_TYPE_U     : t_ImmType := B"100";
constant IMM_TYPE_J     : t_ImmType := B"101";

----------------
-- IMM I-TYPE --
----------------

-- Imm I-Type Range
constant IMM_I_MIN      : integer := 20;
constant IMM_I_MAX      : integer := 31;

-- Imm I-Type Size
constant IMM_I_SIZE     : integer := 12;
constant IMM_I_SIZEM1   : integer := IMM_I_SIZE -1;

-- Imm I-Type Position
constant IMM_I_0_POS    : integer := 0;
constant IMM_I_11_POS   : integer := 11;

-- Imm I-Type Type
subtype t_Imm_I is std_logic_vector(IMM_I_SIZEM1 downto 0);

----------------
-- IMM S-TYPE --
----------------

-- Imm S-Type Range
constant IMM_S_4_0_MIN      : integer := 7;
constant IMM_S_4_0_MAX      : integer := 11;
constant IMM_S_11_5_MIN     : integer := 25;
constant IMM_S_11_5_MAX     : integer := 31;

-- Imm S-Type Size
constant IMM_S_SIZE         : integer := 12;
constant IMM_S_SIZEM1       : integer := IMM_S_SIZE -1;
constant IMM_S_4_0_SIZE     : integer := 5;
constant IMM_S_4_0_SIZEM1   : integer := IMM_S_4_0_SIZE -1;
constant IMM_S_11_5_SIZE    : integer := 7;
constant IMM_S_11_5_SIZEM1  : integer := IMM_S_11_5_SIZE -1;

-- Imm S-Type Position
constant IMM_S_0_POS        : integer := 0;
constant IMM_S_4_POS        : integer := 4;
constant IMM_S_5_POS        : integer := 5;
constant IMM_S_11_POS       : integer := 11;

-- Imm S-Type Type
subtype t_Imm_S_4_0 is std_logic_vector(IMM_S_4_0_SIZEM1 downto 0);
subtype t_Imm_S_11_5 is std_logic_vector(IMM_S_11_5_SIZEM1 downto 0);

----------------
-- IMM B-TYPE --
----------------

-- Imm B-Type Range
constant IMM_B_11_BIT       : integer := 7;
constant IMM_B_4_1_MIN      : integer := 8;
constant IMM_B_4_1_MAX      : integer := 11;
constant IMM_B_10_5_MIN     : integer := 25;
constant IMM_B_10_5_MAX     : integer := 30;
constant IMM_B_12_BIT       : integer := 31;

-- Imm B-Type Size
constant IMM_B_SIZE         : integer := 12;
constant IMM_B_SIZEM1       : integer := IMM_B_SIZE -1;
constant IMM_B_4_1_SIZE     : integer := 4;
constant IMM_B_4_1_SIZEM1   : integer := IMM_B_4_1_SIZE -1;
constant IMM_B_10_5_SIZE    : integer := 6;
constant IMM_B_10_5_SIZEM1  : integer := IMM_B_10_5_SIZE -1;

-- Imm B-Type Position
constant IMM_B_11_POS       : integer := 0;
constant IMM_B_1_POS        : integer := 1;
constant IMM_B_4_POS        : integer := 4;
constant IMM_B_5_POS        : integer := 5;
constant IMM_B_10_POS       : integer := 10;
constant IMM_B_12_POS       : integer := 11;

-- Imm B-Type Type
subtype t_Imm_B_11 is std_logic;
subtype t_Imm_B_4_1 is std_logic_vector(IMM_B_4_1_SIZEM1 downto 0);
subtype t_Imm_B_10_5 is std_logic_vector(IMM_B_10_5_SIZEM1 downto 0);
subtype t_Imm_B_12 is std_logic;

----------------
-- IMM U-TYPE --
----------------

-- Imm U-Type Range
constant IMM_U_MIN      : integer := 12;
constant IMM_U_MAX      : integer := 31;

-- Imm U-Type Size
constant IMM_U_SIZE     : integer := 20;
constant IMM_U_SIZEM1   : integer := IMM_U_SIZE -1;

-- Imm U-Type Position
constant IMM_U_12_POS   : integer := 0;
constant IMM_U_31_POS   : integer := 19;

-- Imm U-Type Type
subtype t_Imm_U is std_logic_vector(IMM_U_SIZEM1 downto 0);

----------------
-- IMM J-TYPE --
----------------

-- Imm J-Type Range
constant IMM_J_19_12_MIN    : integer := 12;
constant IMM_J_19_12_MAX    : integer := 19;
constant IMM_J_11_BIT       : integer := 20;
constant IMM_J_10_1_MIN     : integer := 21;
constant IMM_J_10_1_MAX     : integer := 30;
constant IMM_J_20_BIT       : integer := 31;

-- Imm J-Type Size
constant IMM_J_19_12_SIZE   : integer := 8;
constant IMM_J_19_12_SIZEM1 : integer := IMM_J_19_12_SIZE -1;
constant IMM_J_10_1_SIZE    : integer := 10;
constant IMM_J_10_1_SIZEM1  : integer := IMM_J_10_1_SIZE -1;

-- Imm B-Type Position
constant IMM_J_12_POS       : integer := 0;
constant IMM_J_19_POS       : integer := 7;
constant IMM_J_11_POS       : integer := 8;
constant IMM_J_1_POS        : integer := 9;
constant IMM_J_10_POS       : integer := 18;
constant IMM_J_20_POS       : integer := 19;

-- Imm J-Type Type
subtype t_Imm_J_19_12 is std_logic_vector(IMM_J_19_12_SIZEM1 downto 0);
subtype t_Imm_J_11 is std_logic;
subtype t_Imm_J_10_1 is std_logic_vector(IMM_J_10_1_SIZEM1 downto 0);
subtype t_Imm_J_20 is std_logic;

------------------------
-- INSTRUCTIONS TYPES --
------------------------

-- R-Type
type t_R_Inst is record
    opcode  : t_OpCode;
    rd      : t_Rd;
    funct3  : t_Funct3;
    rs1     : t_Rs1;
    rs2     : t_Rs2;
    funct7  : t_Funct7;
end record t_R_Inst;

-- I-Type
type t_I_Inst is record
    opcode  : t_OpCode;
    rd      : t_Rd;
    funct3  : t_Funct3;
    rs1     : t_Rs1;
    immI    : t_Imm_I;
end record t_I_Inst;

-- S-Type
type t_S_Inst is record
    opcode      : t_OpCode;
    immS_4_0    : t_Imm_S_4_0;
    funct3      : t_Funct3;
    rs1         : t_Rs1;
    rs2         : t_Rs2;
    immS_11_5   : t_Imm_S_11_5;
end record t_S_Inst;

-- B-Type
type t_B_Inst is record
    opcode      : t_OpCode;
    immB_11     : t_Imm_B_11;
    immB_4_1    : t_Imm_B_4_1;
    funct3      : t_Funct3;
    rs1         : t_Rs1;
    rs2         : t_Rs2;
    immB_10_5   : t_Imm_B_10_5;
    immB_12     : t_Imm_B_12;
end record t_B_Inst;

-- U-Type
type t_U_Inst is record
    opcode  : t_OpCode;
    rd      : t_Rd;
    immU    : t_Imm_U;
end record t_U_Inst;

-- J-Type
type t_J_Inst is record
    opcode      : t_OpCode;
    rd          : t_Rd;
    immJ_19_12  : t_Imm_J_19_12;
    immJ_11     : t_Imm_J_11;
    immJ_10_1   : t_Imm_J_10_1;
    immJ_20     : t_Imm_J_20;
end record t_J_Inst;

end package inst_types;

package body inst_types is
end package body inst_types;