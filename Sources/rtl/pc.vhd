----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2025 12:56:02 PM
-- Design Name: 
-- Module Name: PC - arch_PC
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

library work;
use libriscp.common.all;

entity PC is
    Port (
        CLK     : in t_Bit;
        RST     : in t_Bit;
        INCR    : in t_Bit;
        SP_EN   : in t_Bit;
        SP_ADDR : in t_Word;
        PC      : out t_Word;
    );
end PC;

architecture arch_PC of PC is

    ---------------
    -- CONSTANTS --
    ---------------
    
    constant PC_INCR : t_Word := X"00000004";

begin


end arch_PC;
