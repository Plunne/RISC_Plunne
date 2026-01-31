----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2025 10:16:59 PM
-- Design Name: 
-- Module Name: inst_defs
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

library libriscp;
use libriscp.inst_types.all;

package inst_defs is

---------------------------
-- REGISTER INSTRUCTIONS --
---------------------------

-- ADD
constant ADD_FUNCT3     : t_Funct3      := FUNCT3_X0;
constant ADD_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant ADD_FUNCTION   : t_Function    := ADD_FUNCT7 & ADD_FUNCT3;
-- SUB
constant SUB_FUNCT3     : t_Funct3      := FUNCT3_X0;
constant SUB_FUNCT7     : t_Funct7      := FUNCT7_X20;
constant SUB_FUNCTION   : t_Function    := SUB_FUNCT7 & SUB_FUNCT3;
-- XOR
constant XOR_FUNCT3     : t_Funct3      := FUNCT3_X4;
constant XOR_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant XOR_FUNCTION   : t_Function    := XOR_FUNCT7 & XOR_FUNCT3;
-- OR
constant OR_FUNCT3      : t_Funct3      := FUNCT3_X6;
constant OR_FUNCT7      : t_Funct7      := FUNCT7_X00;
constant OR_FUNCTION    : t_Function    := OR_FUNCT7 & OR_FUNCT3;
-- AND
constant AND_FUNCT3     : t_Funct3      := FUNCT3_X7;
constant AND_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant AND_FUNCTION   : t_Function    := AND_FUNCT7 & AND_FUNCT3;
-- SLL
constant SLL_FUNCT3     : t_Funct3      := FUNCT3_X1;
constant SLL_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant SLL_FUNCTION   : t_Function    := SLL_FUNCT7 & SLL_FUNCT3;
-- SRL
constant SRL_FUNCT3     : t_Funct3      := FUNCT3_X5;
constant SRL_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant SRL_FUNCTION   : t_Function    := SRL_FUNCT7 & SRL_FUNCT3;
-- SRA
constant SRA_FUNCT3     : t_Funct3      := FUNCT3_X5;
constant SRA_FUNCT7     : t_Funct7      := FUNCT7_X20;
constant SRA_FUNCTION   : t_Function    := SRA_FUNCT7 & SRA_FUNCT3;
-- SLT
constant SLT_FUNCT3     : t_Funct3      := FUNCT3_X2;
constant SLT_FUNCT7     : t_Funct7      := FUNCT7_X00;
constant SLT_FUNCTION   : t_Function    := SLT_FUNCT7 & SLT_FUNCT3;
-- SLTU
constant SLTU_FUNCT3    : t_Funct3      := FUNCT3_X3;
constant SLTU_FUNCT7    : t_Funct7      := FUNCT7_X00;
constant SLTU_FUNCTION  : t_Function    := SLTU_FUNCT7 & SLTU_FUNCT3;

----------------------------
-- IMMEDIATE INSTRUCTIONS --
----------------------------

-- ADDI
constant ADDI_FUNCT3    : t_Funct3      := FUNCT3_X0;
constant ADDI_FUNCTION  : t_Funct3      := ADDI_FUNCT3;
-- XORI
constant XORI_FUNCT3    : t_Funct3      := FUNCT3_X4;
constant XORI_FUNCTION  : t_Funct3      := XORI_FUNCT3;
-- ORI
constant ORI_FUNCT3     : t_Funct3      := FUNCT3_X6;
constant ORI_FUNCTION   : t_Funct3      := ORI_FUNCT3;
-- ANDI
constant ANDI_FUNCT3    : t_Funct3      := FUNCT3_X7;
constant ANDI_FUNCTION  : t_Funct3      := ANDI_FUNCT3;
-- SLLI
constant SLLI_FUNCT3    : t_Funct3      := FUNCT3_X1;
constant SLLI_FUNCT7    : t_Funct7      := FUNCT7_X00;
constant SLLI_FUNCTION  : t_Function    := SLLI_FUNCT7 & SLLI_FUNCT3;
-- SRLI
constant SRLI_FUNCT3    : t_Funct3      := FUNCT3_X5;
constant SRLI_FUNCT7    : t_Funct7      := FUNCT7_X00;
constant SRLI_FUNCTION  : t_Function    := SRLI_FUNCT7 & SRLI_FUNCT3;
-- SRAI
constant SRAI_FUNCT3    : t_Funct3      := FUNCT3_X5;
constant SRAI_FUNCT7    : t_Funct7      := FUNCT7_X20;
constant SRAI_FUNCTION  : t_Function    := SRAI_FUNCT7 & SRAI_FUNCT3;
-- SLTI
constant SLTI_FUNCT3    : t_Funct3      := FUNCT3_X2;
constant SLTI_FUNCTION  : t_Funct3      := SLTI_FUNCT3;
-- SLTI
constant SLTUI_FUNCT3   : t_Funct3      := FUNCT3_X3;
constant SLTUI_FUNCTION : t_Funct3      := SLTUI_FUNCT3;

-----------------------
-- LOAD INSTRUCTIONS --
-----------------------

-- LB
constant LB_FUNCT3      : t_Funct3  := FUNCT3_X0;
constant LB_FUNCTION    : t_Funct3  := LB_FUNCT3;
-- LH
constant LH_FUNCT3      : t_Funct3  := FUNCT3_X1;
constant LH_FUNCTION    : t_Funct3  := LH_FUNCT3;
-- LW
constant LW_FUNCT3      : t_Funct3  := FUNCT3_X2;
constant LW_FUNCTION    : t_Funct3  := LW_FUNCT3;
-- LBU
constant LBU_FUNCT3     : t_Funct3  := FUNCT3_X4;
constant LBU_FUNCTION   : t_Funct3  := LBU_FUNCT3;
-- LHU
constant LHU_FUNCT3     : t_Funct3  := FUNCT3_X5;
constant LHU_FUNCTION   : t_Funct3  := LHU_FUNCT3;

------------------------
-- STORE INSTRUCTIONS --
------------------------

-- SB
constant SB_FUNCT3      : t_Funct3  := FUNCT3_X0;
constant SB_FUNCTION    : t_Funct3  := SB_FUNCT3;
-- SH
constant SH_FUNCT3      : t_Funct3  := FUNCT3_X1;
constant SH_FUNCTION    : t_Funct3  := SH_FUNCT3;
-- SW
constant SW_FUNCT3      : t_Funct3  := FUNCT3_X2;
constant SW_FUNCTION    : t_Funct3  := SW_FUNCT3;

-------------------------
-- BRANCH INSTRUCTIONS --
-------------------------

-- BEQ
constant BEQ_FUNCT3     : t_Funct3  := FUNCT3_X0;
constant BEQ_FUNCTION   : t_Funct3  := BEQ_FUNCT3;
-- BNE
constant BNE_FUNCT3     : t_Funct3  := FUNCT3_X1;
constant BNE_FUNCTION   : t_Funct3  := BNE_FUNCT3;
-- BLT
constant BLT_FUNCT3     : t_Funct3  := FUNCT3_X4;
constant BLT_FUNCTION   : t_Funct3  := BLT_FUNCT3;
-- BGE
constant BGE_FUNCT3     : t_Funct3  := FUNCT3_X5;
constant BGE_FUNCTION   : t_Funct3  := BGE_FUNCT3;
-- BLTU
constant BLTU_FUNCT3    : t_Funct3  := FUNCT3_X6;
constant BLTU_FUNCTION  : t_Funct3  := BLTU_FUNCT3;
-- BGEU
constant BGEU_FUNCT3    : t_Funct3  := FUNCT3_X7;
constant BGEU_FUNCTION  : t_Funct3  := BGEU_FUNCT3;

-----------------------
-- JUMP INSTRUCTIONS --
-----------------------

-- JALR
constant JALR_FUNCT3    : t_Funct3  := FUNCT3_X0;
constant JALR_FUNCTION  : t_Funct3  := JALR_FUNCT3;

-------------------------------
-- ENVIRONEMENT INSTRUCTIONS --
-------------------------------

-- ECALL
constant ECALL_FUNCT3       : t_Funct3      := FUNCT3_X0;
constant ECALL_FUNCT7       : t_Funct7      := FUNCT7_X00;
constant ECALL_FUNCTION     : t_Function    := ECALL_FUNCT7 & ECALL_FUNCT3;
-- EBREAK
constant EBREAK_FUNCT3      : t_Funct3      := FUNCT3_X0;
constant EBREAK_FUNCT7      : t_Funct7      := FUNCT7_X01;
constant EBREAK_FUNCTION    : t_Function    := EBREAK_FUNCT7 & EBREAK_FUNCT3;

end package inst_defs;

package body inst_defs is
end package body inst_defs;