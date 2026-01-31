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
    
end package tb_common;

package body tb_common is
end package body;

