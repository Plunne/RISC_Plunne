----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2025 02:25:56 PM
-- Design Name: 
-- Module Name: tb_pc - arch_tb_pc
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

library work;
use work.pc;

entity tb_pc is
end tb_pc;

architecture arch_tb_pc of tb_pc is

    -- Test Step
    signal s_TestStep : integer := 0;
    
    -- Unit Signals
    signal s_CLK        : tbt_Bit := '0';
    signal s_RST        : tbt_Bit := '0';
    signal s_INCR       : tbt_Bit := '0';
    signal s_SP_EN      : tbt_Bit := '0';
    signal s_SP_ADDR    : tbt_Word := TB_X32_NULL;
    signal s_PC         : tbt_Word := TB_X32_NULL;
    
    -- Constants
    constant TB_PC_INCR : tbt_Word := X"00000004";
    constant TB_PC_TEST : tbt_Word := X"abcd5678";

begin

    --------------------------------------------------------------------
    -- Unit Under Test
    --------------------------------------------------------------------
    
    uut: entity work.pc port map (
        CLK     => s_CLK,
        RST     => s_RST,
        INCR    => s_INCR,
        SP_EN   => s_SP_EN,
        SP_ADDR => s_SP_ADDR,
        PC      => s_PC
    );

    --------------------------------------------------------------------
    -- STIMULUS START
    --------------------------------------------------------------------
    
    stimulus : process
    
        variable pc_tmp : tbt_Word := TB_X32_NULL;

    begin

        report "==== PC TESTBENCH ====" severity note;
    
        --------------------------------------------------------------------
        -- PC_TU001 - PC ADDRESS SIZE
        --------------------------------------------------------------------
        
        report "PC_TU001 - PC ADDRESS SIZE"; -- PC_R001
        
        -- Step 1 : Check PC size is equal to XLEN
        s_TestStep <= 1;
        wait for CLK_PERIOD;
        assert s_PC'length = TB_XLEN
            report "PC_TU001 STEP 1 FAIL : PC size does not match XLEN"
            severity error;
        
        report "PC_TU001 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU002 - SET POINTER UPDATE
        --------------------------------------------------------------------
        
        report "PC_TU002 - SET POINTER UPDATE"; -- PC_R004, PC_R005, PC_R006
        
        pc_tmp := TB_X32_NULL;
             
        -- Steps 1 & 2 : Init CLK
        s_TestStep <= 1;
        s_CLK   <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU002 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Steps 2 : Init RST, INCR, SP_EN
        s_TestStep <= 2;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_INCR = '0' and s_SP_EN = '0'
            report "PC_TU002 STEP 2 FAIL : Control Signals not 0"
            severity error;
               
        -- Step 3 : Set SP_ADDR to a different address than PC
        s_TestStep <= 3;
        pc_tmp := s_PC; -- Save for future steps
        s_SP_ADDR <= TB_PC_TEST;
        wait for CLK_PERIOD;
        
        assert s_SP_ADDR = TB_PC_TEST
            report "PC_TU002 STEP 3 FAIL : SP_ADDR not holding new address"
            severity error;
        
        assert not (s_PC = s_SP_ADDR)
            report "PC_TU002 STEP 3 FAIL : PC already at test address"
            severity error;
        
        -- Step 4 : Capture PC, Set SP_EN -> PC shall not change
        s_TestStep <= 4;
        s_SP_EN <= '1';
        wait for CLK_PERIOD;
        
        assert s_SP_EN = '1'
            report "PC_TU002 STEP 4 FAIL : SP_EN has not been set"
            severity error;
        
        assert s_PC = pc_tmp
            report "PC_TU002 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> PC must update
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_TEST
            report "PC_TU002 STEP 5 FAIL : PC not updated to SP_ADDR on rising edge"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        s_CLK <= '0';
        pc_tmp := s_PC;
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU002 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Unset SP_EN
        s_TestStep <= 7;
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_SP_EN = '0'
            report "PC_TU002 STEP 7 FAIL : SP_EN not 0"
            severity error;
        
        -- Step 8 : Proceed multiple clock cycles
        s_TestStep <= 8;
        for i in 1 to 3 loop
        
            tick(s_CLK);
           
            assert s_PC = pc_tmp
                report "PC_TU002 STEP 8 FAIL : PC changed during clock cycle"
                severity error;
                
        end loop;
        
        -- End of Test
        report "PC_TU002 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU003 - RESET POINTER UPDATE
        --------------------------------------------------------------------
        
        report "PC_TU003 - RESET POINTER UPDATE"; -- PC_R007, PC_R008, PC_R009
        
        pc_tmp := TB_X32_NULL;
             
        -- Steps 1 & 2 : Init CLK
        s_TestStep <= 1;
        s_CLK   <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU003 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Steps 2 : Init RST, INCR, SP_EN
        s_TestStep <= 2;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_INCR = '0' and s_SP_EN = '0'
            report "PC_TU003 STEP 2 FAIL : Control Signals not 0"
            severity error;
        
        -- Step 3 : Ensure PC not at reset address
        s_TestStep <= 3;
        pc_tmp := s_PC; -- Save for future steps
        wait for CLK_PERIOD;
        
        assert not (s_PC = TB_PC_RST)
            report "PC_TU003 STEP 3 FAIL : PC is already at reset address"
            severity error;
        
        -- Step 4 : Set RST -> PC shall not change
        s_TestStep <= 4;
        s_RST <= '1';
        wait for CLK_PERIOD;
        
        assert s_RST = '1'
            report "PC_TU003 STEP 4 FAIL : RST has not been set"
            severity error;
        
        assert s_PC = pc_tmp
            report "PC_TU003 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> PC must update
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_RST
            report "PC_TU003 STEP 5 FAIL : PC not updated to reset address on rising edge"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        s_CLK <= '0';
        pc_tmp := s_PC;
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU003 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Unset RST
        s_TestStep <= 7;
        s_RST <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0'
            report "PC_TU003 STEP 7 FAIL : RST not 0"
            severity error;
        
        -- Step 8 : Proceed multiple clock cycles
        s_TestStep <= 8;
        for i in 1 to 3 loop
        
            tick(s_CLK);
           
            assert s_PC = pc_tmp
                report "PC_TU003 STEP 8 FAIL : PC changed during clock cycle"
                severity error;
                
        end loop;
        
        -- End of Test
        report "PC_TU003 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU004 - INCREMENT POINTER UPDATE
        --------------------------------------------------------------------
        
        report "PC_TU004 - INCREMENT POINTER UPDATE"; -- PC_R010, PC_R011, PC_R012
        
        pc_tmp := TB_X32_NULL;
        
        -- Steps 1 & 2 : Init CLK
        s_TestStep <= 1;
        s_CLK   <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU004 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Steps 2 : Init RST, INCR, SP_EN
        s_TestStep <= 2;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_INCR = '0' and s_SP_EN = '0'
            report "PC_TU004 STEP 2 FAIL : Control Signals not 0"
            severity error;
        
        -- Step 3 : Capture PC output
        s_TestStep <= 3;
        pc_tmp := s_PC;
        wait for CLK_PERIOD;
        
        assert pc_tmp = s_PC
            report "PC_TU004 STEP 3 FAIL : PC has not been captured"
            severity error;
        
        -- Step 4 : Set INCR -> PC shall not change
        s_TestStep <= 4;
        s_INCR <= '1';
        wait for CLK_PERIOD;
        
        assert s_INCR = '1'
            report "PC_TU004 STEP 4 FAIL : INCR has not been set"
            severity error;
        
        assert s_PC = pc_tmp
            report "PC_TU004 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> PC must update
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = (pc_tmp + TB_PC_INCR)
            report "PC_TU004 STEP 5 FAIL : PC has not been incremented"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        pc_tmp := s_PC;
        s_CLK <= '0';
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU004 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Unset INCR
        s_TestStep <= 7;
        s_INCR <= '0';
        wait for CLK_PERIOD;
        
        assert s_INCR = '0'
            report "PC_TU004 STEP 7 FAIL : INCR not 0"
            severity error;
        
        -- Step 8 : Proceed multiple clock cycles
        s_TestStep <= 8;
        for i in 1 to 3 loop
        
            tick(s_CLK);
           
            assert s_PC = pc_tmp
                report "PC_TU004 STEP 8 FAIL : PC changed during clock cycle"
                severity error;
                
        end loop;
        
        -- End of Test
        report "PC_TU004 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU005 - POINTER HOLD CONDITION
        --------------------------------------------------------------------
        
        report "PC_TU005 - POINTER HOLD CONDITION"; -- PC_R013, PC_R002, PC_R003
        
        pc_tmp := TB_X32_NULL;
             
        -- Steps 1 & 2 : Init CLK
        s_TestStep <= 1;
        s_CLK   <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU005 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Steps 2 : Init RST, INCR, SP_EN
        s_TestStep <= 2;
        s_RST   <= '0';
        s_INCR  <= '0';
        s_SP_EN <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_INCR = '0' and s_SP_EN = '0'
            report "PC_TU005 STEP 2 FAIL : Control Signals not 0"
            severity error;
            
        -- Step 3 : Capture PC output
        s_TestStep <= 3;
        pc_tmp := s_PC;
        wait for CLK_PERIOD;
        
        assert pc_tmp = s_PC
            report "PC_TU005 STEP 3 FAIL : PC Capture failed"
            severity error;
        
        -- Step 4 : Proceed multiple clock cycles
        s_TestStep <= 4;
        for i in 1 to 3 loop
        
            tick(s_CLK);
           
            assert s_PC = pc_tmp
                report "PC_TU005 STEP 4 FAIL : PC changed during clock cycle"
                severity error;
                
        end loop;
        
        -- End of Test
        report "PC_TU005 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU006 - SET POINTER PRIORITY
        --------------------------------------------------------------------
        
        report "PC_TU006 - SET POINTER PRIORITY"; -- PC_R014
        
        pc_tmp := TB_X32_NULL;
            
        -- Step 1 : Init CLK
        s_TestStep <= 1;
        s_CLK <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU006 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Step 2 : Init RST, SP_EN, INCR
        s_TestStep <= 2;
        s_RST   <= '0';
        s_SP_EN <= '0';
        s_INCR  <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_SP_EN = '0' and s_INCR = '0'
            report "PC_TU006 STEP 2 FAIL : Control signals not 0"
            severity error;
        
        -- Step 3 : Set SP_ADDR to a different address than PC
        s_TestStep <= 3;
        pc_tmp := s_PC; -- Save reference PC
        s_SP_ADDR <= TB_PC_TEST;
        wait for CLK_PERIOD;
        
        assert s_SP_ADDR = TB_PC_TEST
            report "PC_TU006 STEP 3 FAIL : SP_ADDR not holding test address"
            severity error;
        
        assert not (s_PC = s_SP_ADDR)
            report "PC_TU006 STEP 3 FAIL : PC already at test address"
            severity error;
        
        -- Step 4 : Set SP_EN and INCR -> PC shall not change
        s_TestStep <= 4;
        s_SP_EN <= '1';
        s_INCR  <= '1';
        wait for CLK_PERIOD;
        
        assert s_SP_EN = '1' and s_INCR = '1'
            report "PC_TU006 STEP 4 FAIL : SP_EN or INCR not set"
            severity error;
        
        assert s_PC = pc_tmp
            report "PC_TU006 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> SP_ADDR has priority over INCR
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_TEST
            report "PC_TU006 STEP 5 FAIL : SP_ADDR did not take priority over INCR"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        s_CLK <= '0';
        pc_tmp := s_PC;
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU006 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Unset SP_EN and INCR
        s_TestStep <= 7;
        s_SP_EN <= '0';
        s_INCR  <= '0';
        wait for CLK_PERIOD;
        
        assert s_SP_EN = '0' and s_INCR = '0'
            report "PC_TU006 STEP 7 FAIL : SP_EN or INCR not cleared"
            severity error;
        
        -- Step 8 : Proceed multiple clock cycles
        s_TestStep <= 8;
        for i in 1 to 3 loop
        
            tick(s_CLK);
        
            assert s_PC = pc_tmp
                report "PC_TU006 STEP 8 FAIL : PC changed during clock cycle"
                severity error;
        
        end loop;
        
        -- End of Test
        report "PC_TU006 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- PC_TU007 - RESET POINTER PRIORITY
        --------------------------------------------------------------------
        
        report "PC_TU007 - RESET POINTER PRIORITY"; -- PC_R015
        
        pc_tmp := TB_X32_NULL;
        
        -- Step 1 : Ensure clock is equal to 0
        s_TestStep <= 1;
        s_CLK <= '0';
        wait for CLK_PERIOD;
        
        assert s_CLK = '0'
            report "PC_TU007 STEP 1 FAIL : CLK not 0"
            severity error;
        
        -- Step 2 : Ensure RST, SP_EN and INCR inputs are equal to 0
        s_TestStep <= 2;
        s_RST   <= '0';
        s_SP_EN <= '0';
        s_INCR  <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_SP_EN = '0' and s_INCR = '0'
            report "PC_TU007 STEP 2 FAIL : Control signals not 0"
            severity error;
        
        -- Step 3 : Set SP_ADDR to a test address different to PC and PC_RST
        s_TestStep <= 3;
        pc_tmp := s_PC;
        s_SP_ADDR <= TB_PC_TEST;
        wait for CLK_PERIOD;
        
        assert s_SP_ADDR = TB_PC_TEST
            report "PC_TU007 STEP 3 FAIL : SP_ADDR not holding test address"
            severity error;
        
        assert not (s_SP_ADDR = s_PC) and not (s_SP_ADDR = TB_PC_RST)
            report "PC_TU007 STEP 3 FAIL : SP_ADDR equal to PC or PC_RST"
            severity error;
        
        -- Step 4 : Set RST, SP_EN and INCR high -> PC shall not change
        s_TestStep <= 4;
        s_RST   <= '1';
        s_SP_EN <= '1';
        s_INCR  <= '1';
        wait for CLK_PERIOD;
        
        assert s_RST = '1' and s_SP_EN = '1' and s_INCR = '1'
            report "PC_TU006 STEP 4 FAIL : RST or SP_EN or INCR not set"
            severity error;
        
        assert s_PC = pc_tmp
            report "PC_TU007 STEP 4 FAIL : PC changed before rising edge"
            severity error;
        
        -- Step 5 : Rising edge -> PC must update to PC_RST
        s_TestStep <= 5;
        s_CLK <= '1';
        wait for CLK_PERIOD;
        
        assert s_PC = TB_PC_RST
            report "PC_TU007 STEP 5 FAIL : PC not updated to PC_RST"
            severity error;
        
        -- Step 6 : Falling edge -> PC must stay stable
        s_TestStep <= 6;
        pc_tmp := s_PC;
        s_CLK <= '0';
        wait for CLK_PERIOD;
        
        assert s_PC = pc_tmp
            report "PC_TU007 STEP 6 FAIL : PC changed after falling edge"
            severity error;
        
        -- Step 7 : Set RST, SP_EN and INCR low
        s_TestStep <= 7;
        s_RST   <= '0';
        s_SP_EN <= '0';
        s_INCR  <= '0';
        wait for CLK_PERIOD;
        
        assert s_RST = '0' and s_SP_EN = '0' and s_INCR = '0'
            report "PC_TU007 STEP 7 FAIL : Control signals not cleared"
            severity error;
        
        -- Step 8 : Proceed multiple stable clock cycles
        s_TestStep <= 8;
        for i in 1 to 3 loop
            tick(s_CLK);
        
            assert s_PC = pc_tmp
                report "PC_TU007 STEP 8 FAIL : PC changed during clock cycle"
                severity error;
        end loop;
        
        -- End of Test
        report "PC_TU007 PASSED" severity note;
        wait for END_TEST;
        
        --------------------------------------------------------------------
        -- STIMULUS END
        --------------------------------------------------------------------
        
        report "==== PC : ALL TESTS PASSED ====" severity note;
        wait;

    end process;

end arch_tb_pc;
