----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2026 11:55:58 AM
-- Design Name: 
-- Module Name: tb_mux_pcsel - arch_tb_mux_pcsel
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

library tb_utils;
use tb_utils.tb_common.all;
use tb_utils.tb_helpers.all;

library mux;
use mux.mux_pcsel.all;

entity tb_mux_pcsel is
end tb_mux_pcsel;

architecture arch_tb_mux_pcsel of tb_mux_pcsel is

    -- Test Step
    signal s_TestStep : integer := 0;
    
    -- Unit Signals
    signal s_RST    : tbt_Bit := '0';
    signal s_INCR   : tbt_Bit := '0';
    signal s_SP_EN  : tbt_Bit := '0';
    signal s_PCSel  : tbt_PCSel := B"000";

begin

    --------------------------------------------------------------------
    -- Unit Under Test
    --------------------------------------------------------------------
    
    uut: entity mux.mux_pcsel port map (
        RST     => s_RST,
        INCR    => s_INCR,
        SP_EN   => s_SP_EN,
        PCSel   => s_PCSel
    );
    
    --------------------------------------------------------------------
    -- STIMULUS START
    --------------------------------------------------------------------
    
    stimulus : process

    begin

        report "==== MUX_PCSEL TESTBENCH ====" severity note;
    
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU001 - PCSEL HOLD MODE
        --------------------------------------------------------------------
        
        report "MUX_PCSEL_TU001 - PCSEL HOLD MODE"; -- MUX_PCSEL_R001
        
        -- Steps 1 & 2 : Init RST, INCR, SP_EN and assert output
        s_TestStep <= 1;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU001 STEP 1 FAIL : HOLD MODE not asserted"
            severity error;
        
        -- End of Test
        report "MUX_PCSEL_TU001 PASSED" severity note;
        wait for END_TEST;
            
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU002 - PCSEL RESET MODE
        --------------------------------------------------------------------
        
        report "MUX_PCSEL_TU002 - PCSEL RESET MODE"; -- MUX_PCSEL_R002
        
        -- Steps 1 : Init RST, INCR, SP_EN
        s_TestStep <= 1;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU002 STEP 1 FAIL : HOLD MODE not asserted"
            severity error;
            
        -- Steps 2 : Set RST, SP_EN and INCR
        s_TestStep <= 2;
        s_RST   <= '1';
        s_INCR  <= '1';
        s_SP_EN <= '1';
        wait for STEP_TIME;
        
        assert s_PCSel = B"100" 
            report "MUX_PCSEL_TU002 STEP 2 FAIL : RESET MODE not asserted"
            severity error;
        
        -- Steps 3 : Unset RST
        s_TestStep <= 3;
        s_RST   <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU002 STEP 3 FAIL : RESET MODE asserted"
            severity error;
        
        -- End of Test
        report "MUX_PCSEL_TU002 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU003 - PCSEL SET MODE
        --------------------------------------------------------------------
        
        report "MUX_PCSEL_TU003 - PCSEL SET MODE"; -- MUX_PCSEL_R003
        
        -- Steps 1 : Init RST, INCR, SP_EN
        s_TestStep <= 1;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU003 STEP 1 FAIL : HOLD MODE not asserted"
            severity error;
            
        -- Steps 2 : Set INCR and SP_EN
        s_TestStep <= 2;
        s_INCR  <= '1';
        s_SP_EN <= '1';
        wait for STEP_TIME;
        
        assert s_PCSel = B"010" 
            report "MUX_PCSEL_TU003 STEP 2 FAIL : SET MODE not asserted"
            severity error;
        
        -- Steps 3 : Unset INCR and SP_EN
        s_TestStep <= 3;
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU003 STEP 3 FAIL : SET MODE asserted"
            severity error;
        
        -- End of Test
        report "MUX_PCSEL_TU003 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU004 - PCSEL INCREMENT MODE
        --------------------------------------------------------------------
        
        report "MUX_PCSEL_TU004 - PCSEL INCREMENT MODE"; -- MUX_PCSEL_R004
        
        -- Steps 1 : Init RST, INCR, SP_EN
        s_TestStep <= 1;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU004 STEP 1 FAIL : HOLD MODE not asserted"
            severity error;
            
        -- Steps 2 : Set INCR
        s_TestStep <= 2;
        s_INCR  <= '1';
        wait for STEP_TIME;
        
        assert s_PCSel = B"001" 
            report "MUX_PCSEL_TU004 STEP 2 FAIL : INCREMENT MODE not asserted"
            severity error;
        
        -- Steps 3 : Unset INCR
        s_TestStep <= 3;
        s_INCR  <= '0';
        wait for STEP_TIME;
        
        assert s_PCSel = B"000" 
            report "MUX_PCSEL_TU004 STEP 3 FAIL : INCREMENT MODE asserted"
            severity error;
        
        -- End of Test
        report "MUX_PCSEL_TU004 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- STIMULUS END
        --------------------------------------------------------------------
        
        report "==== MUX_PCSEL : ALL TESTS PASSED ====" severity note;
        wait;

    end process;

end arch_tb_mux_pcsel;
