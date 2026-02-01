----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2026 06:17:38 PM
-- Design Name: 
-- Module Name: tb_common_pkg - arch_tb_common_pkg
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

package tb_common is
    
    -- Libriscp_Common
    constant TB_XLEN : integer := 32;
    constant TB_XLENM1 : integer := TB_XLEN -1;
    constant TB_X32_NULL : std_logic_vector(TB_XLENM1 downto 0) := X"00000000";
    constant TB_BIT_TRUE   : std_logic := '1';
    constant TB_BIT_FALSE  : std_logic := '0';
    constant TB_X32_TRUE   : std_logic_vector(TB_XLENM1 downto 0) := X"00000001";
    constant TB_X32_FALSE  : std_logic_vector(TB_XLENM1 downto 0) := X"00000000";
    
    -- Common types
    subtype tbt_Bit is std_logic;
    subtype tbt_Word is std_logic_vector(TB_XLENM1 downto 0);
    
    -- PC
    constant TB_PC_INCR : tbt_Word := X"00000004";
    constant TB_PCSEL_SIZE     : integer := 3;
    constant TB_PCSEL_SIZEM1   : integer := TB_PCSEL_SIZE -1;
    subtype tbt_PCSel is std_logic_vector(TB_PCSEL_SIZEM1 downto 0);
    constant TB_PCSEL_INCR_Bit : integer := 0;
    constant TB_PCSEL_SP_Bit   : integer := 1;
    constant TB_PCSEL_RST_Bit  : integer := 2;
    constant TB_PCSEL_HOLD : tbt_PCSel := B"000";
    constant TB_PCSEL_INCR : tbt_PCSel := B"001";
    constant TB_PCSEL_SP   : tbt_PCSel := B"010";
    constant TB_PCSEL_RST  : tbt_PCSel := B"100";

    
end package tb_common;

package body tb_common is
end package body;

