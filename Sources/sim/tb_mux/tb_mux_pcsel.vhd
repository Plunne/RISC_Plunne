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
use mux.all;

entity tb_mux_pcsel is
end tb_mux_pcsel;

architecture arch_tb_mux_pcsel of tb_mux_pcsel is

    -- Debug Signals
    shared variable T : t_Test;
    signal Dbg : t_Dbg;
    
    -- Unit Signals
    signal s_RST    : tbt_Bit := '0';
    signal s_INCR   : tbt_Bit := '0';
    signal s_SP_EN  : tbt_Bit := '0';
    signal s_PCSel  : tbt_PCSel := B"000";

begin

    --------------------------------------------------------------------
    -- Unit Under Test
    --------------------------------------------------------------------
    
    uut: entity mux.MUX_PCSel port map (
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
        
        bench_init("MUX_PCSEL", Dbg);
    
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU001 - PCSEL HOLD MODE
        --------------------------------------------------------------------
        
        test_init(T, "MUX_PCSEL_TU001", "PCSEL HOLD MODE", Dbg); -- MUX_PCSEL_R001
        
        -- Steps 1 & 2 : Init RST, INCR, SP_EN and assert output
        test_step(T, 1, Dbg);
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;

        test_assert(T, s_PCSel = B"000", "HOLD MODE not asserted", Dbg);
        
        -- End of Test
        test_result(T, Dbg);
            
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU002 - PCSEL RESET MODE
        --------------------------------------------------------------------
        
        test_init(T, "MUX_PCSEL_TU002", "PCSEL RESET MODE", Dbg); -- MUX_PCSEL_R002
        
        -- Steps 1 : Init RST, INCR, SP_EN
        test_step(T, 1, Dbg);
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"000", "HOLD MODE not asserted", Dbg);
            
        -- Steps 2 : Set RST, SP_EN and INCR
       test_step(T, 2, Dbg);
        s_RST   <= '1';
        s_INCR  <= '1';
        s_SP_EN <= '1';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"100", "RESET MODE not asserted", Dbg);
        
        -- Steps 3 : Unset RST
        test_step(T, 3, Dbg);
        s_RST   <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel(TB_PCSEL_RST_Bit) = not '1', "RESET MODE asserted", Dbg);
        
        -- End of Test
        test_result(T, Dbg);
        
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU003 - PCSEL SET MODE
        --------------------------------------------------------------------
        
        test_init(T, "MUX_PCSEL_TU003", "PCSEL SET MODE", Dbg); -- MUX_PCSEL_R003
        
        -- Steps 1 : Init RST, INCR, SP_EN
        test_step(T, 1, Dbg);
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"000", "HOLD MODE not asserted", Dbg);
            
        -- Steps 2 : Set INCR and SP_EN
        test_step(T, 2, Dbg);
        s_INCR  <= '1';
        s_SP_EN <= '1';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"010", "SET MODE not asserted", Dbg);
        
        -- Steps 3 : Unset INCR and SP_EN
        test_step(T, 3, Dbg);
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel(TB_PCSEL_SP_Bit) = not '1', "SET MODE asserted", Dbg);
        
        -- End of Test
        test_result(T, Dbg);
        
        --------------------------------------------------------------------
        -- MUX_PCSEL_TU004 - PCSEL INCREMENT MODE
        --------------------------------------------------------------------
        
        test_init(T, "MUX_PCSEL_TU004", "PCSEL INCREMENT MODE", Dbg); -- MUX_PCSEL_R004
        
        -- Steps 1 : Init RST, INCR, SP_EN
        test_step(T, 1, Dbg);
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"000", "HOLD MODE not asserted", Dbg);
            
        -- Steps 2 : Set INCR
        test_step(T, 2, Dbg);
        s_INCR  <= '1';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel = B"001", "INCREMENT MODE not asserted", Dbg);
        
        -- Steps 3 : Unset INCR
        test_step(T, 3, Dbg);
        s_INCR  <= '0';
        wait for STEP_TIME;
        
        test_assert(T, s_PCSel(TB_PCSEL_INCR_Bit) = not '1', "INCREMENT MODE asserted", Dbg);
        
        -- End of Test
        test_result(T, Dbg);
        
        --------------------------------------------------------------------
        -- STIMULUS END
        --------------------------------------------------------------------
        
        bench_result("MUX_PCSEL", Dbg);

    end process;

end arch_tb_mux_pcsel;
