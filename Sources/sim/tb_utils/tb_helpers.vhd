----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2026 04:13:16 PM
-- Design Name: 
-- Module Name: tb_helpers_pkg - arch_tb_helpers_pkg
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

package tb_helpers is
    
    -- Test Related
    constant END_TEST : time := 50ns;
    
    -- Time related
    constant CLK_PERIOD : time := 10ns;
    procedure tick(signal clk : inout std_logic);

end package tb_helpers;

package body tb_helpers is

    procedure tick(signal clk : inout std_logic) is
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end procedure tick;

end package body;
