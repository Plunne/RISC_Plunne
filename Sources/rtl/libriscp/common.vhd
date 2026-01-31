----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2025 09:59:11 PM
-- Design Name: 
-- Module Name: common - Behavioral
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

package common is

---------------
-- ARCH SIZE --
---------------

constant XLEN   : integer := 32;
constant XLENM1 : integer := XLEN -1;

----------------
-- SIZE TYPES --
----------------

subtype t_Bit is std_logic;
subtype t_Word is std_logic_vector(XLENM1 downto 0);

----------
-- NULL --
----------

constant X32_NULL : t_Word := X"00000000";

-------------
-- BOOLEAN --
-------------

-- 1 Bit
constant BIT_TRUE   : t_Bit := '1';
constant BIT_FALSE  : t_Bit := '0';
-- 32 bits
constant X32_TRUE   : t_Word := X"00000001";
constant X32_FALSE  : t_Word := X"00000000";

end package common;

package body common is
end package body common;