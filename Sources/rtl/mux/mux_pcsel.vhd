----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2026 10:36:04 AM
-- Design Name: 
-- Module Name: MUX_PCSel - arch_MUX_PCSel
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
use libriscp.common.all;

entity MUX_PCSel is
    Port (
        RST     : in t_Bit;
        INCR    : in t_Bit;
        SP_EN   : in t_Bit;
        PCSel   : out t_PCSel
    );
end MUX_PCSel;

architecture arch_MUX_PCSel of MUX_PCSel is
    
begin

    PCSel(PCSEL_RST_Bit)    <= RST;                             -- Prio 1 : RST over all
    PCSel(PCSEL_SP_Bit)     <= SP_EN and not RST;               -- Prio 2 : SET over INCR
    PCSel(PCSEL_INCR_Bit)   <= INCR and not (RST or SP_EN);     -- Prio 3 : INCR lowest

end arch_MUX_PCSel;
