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
    
    -- IMPORTANT!
    -- To use this bench library properly,
    -- copy the following lines into your tb architecture
    -- 
    -- shared variable T : t_Test;
    -- signal Dbg : t_Dbg;
    
    -------------------
    -- DEBUG RELATED --
    -------------------
    
    -- Dbg Type
    type t_Dbg is record
        testcase        : natural;
        step            : natural;
        steps_failed    : natural;
        tests_failed    : natural;
    end record;
    
    ------------------
    -- TIME RELATED --
    ------------------
    
    constant CLK_PERIOD : time := 10ns; 
    constant STEP_TIME  : time := CLK_PERIOD;
    
    procedure tick (
        signal clk : inout std_logic
    );
    
    ------------------
    -- TEST RELATED --
    ------------------
    
    constant TEST_PASSED : boolean := false;
    constant TEST_FAILED : boolean := true;
    
    constant TEST_ID_SIZE_MAX       : natural := 20;
    constant TEST_TITLE_SIZE_MAX    : natural := 100;
    
    type t_Test is record
        id          : string(1 to TEST_ID_SIZE_MAX);
        id_len      : natural range 0 to TEST_ID_SIZE_MAX;
        title       : string(1 to TEST_TITLE_SIZE_MAX);
        title_len   : natural range 0 to TEST_TITLE_SIZE_MAX;
        step        : natural;
        status      : boolean;
    end record;
    
    -------------------
    -- BENCH HELPERS --
    -------------------
    
    procedure bench_init (
        constant TB_NAME    : in string;
        signal dbg          : out t_Dbg
    );
    
    procedure bench_result (
        constant TB_NAME    : in string;
        signal dbg          : inout t_Dbg
    );
    
    ------------------
    -- TEST HELPERS --
    ------------------
    
    procedure test_init (
        Test                : inout t_Test;
        constant TC_ID      : in string;
        constant TC_TITLE   : in string;
        signal dbg          : inout t_Dbg
    );
    
    procedure test_step (
        Test                : inout t_Test;
        constant TC_STEP    : in natural;
        signal dbg          : out t_Dbg
    );
    
    procedure test_assert (
        Test                : inout t_Test;
        test_condition      : in boolean;
        constant MSG_FAILED : in string;
        signal dbg          : inout t_Dbg
    );
    
    procedure test_result (
        Test        : inout t_Test;
        signal dbg  : inout t_Dbg
    );

end package tb_helpers;

package body tb_helpers is
    
    --------------------------------------------------------------------
    -- TIME RELATED
    --------------------------------------------------------------------
 
    procedure tick (
        signal clk : inout std_logic ) is
    begin
    
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
        
    end procedure tick;
    
    --------------------------------------------------------------------
    -- BENCH RELATED
    --------------------------------------------------------------------
    
    ----------------
    -- BENCH INIT --
    ----------------
    
    procedure bench_init (
        constant TB_NAME    : in string;
        signal dbg          : out t_Dbg ) is
    begin
        
        -- Init Debugger
        dbg.testcase        <= 0;
        dbg.step            <= 0;
        dbg.steps_failed    <= 0;
        dbg.tests_failed    <= 0;
        
        -- Init Bench
        report "==== " & TB_NAME & " TESTBENCH ====" severity note;
    
    end procedure bench_init;
    
    ------------------
    -- BENCH RESULT --
    ------------------
    
    procedure bench_result (
        constant TB_NAME    : in string;
        signal dbg          : inout t_Dbg ) is
    begin
        
        if dbg.steps_failed = 0 then
            report "==== " & TB_NAME & " : ALL TESTS PASSED ====" severity note;
        else
            report "==== " & TB_NAME & " : "
            & natural'image(dbg.tests_failed) & " TESTS FAILED ("
            & natural'image(dbg.steps_failed) & " STEPS) ===="
            severity error;
        end if;
        
        wait;  
        
    end procedure bench_result;
    
    --------------------------------------------------------------------
    -- TESTS RELATED
    --------------------------------------------------------------------
    
    ---------------
    -- TEST INIT --
    ---------------
    
    procedure test_init (
        Test                : inout t_Test;
        constant TC_ID      : in string;
        constant TC_TITLE   : in string;
        signal dbg          : inout t_Dbg ) is
    begin
    
        -- Init ID
        Test.id := (others => ' ');
        Test.id_len := TC_ID'length;
        Test.id(1 to Test.id_len) := TC_ID;
        
        -- Init Title
        Test.title := (others => ' ');
        Test.title_len := TC_TITLE'length;
        Test.title(1 to Test.title_len) := TC_TITLE;
        
        -- Init Step and Status (New test : reset current step and test case status)
        Test.step := 0;
        Test.status := TEST_PASSED; -- Ensure the test begin not failed
        
        -- Debug Update
        dbg.testcase <= dbg.testcase + 1;
        dbg.step <= Test.step;
        wait for STEP_TIME; -- Mark break before first step (helps waves readability)
        
        report "[" & Test.id(1 to Test.id_len) & "] " & Test.title(1 to Test.title_len) severity note;
        
    end procedure test_init;
    
    ---------------
    -- TEST STEP --
    ---------------
    
    procedure test_step (
        Test                : inout t_Test;
        constant TC_STEP    : in natural;
        signal dbg          : out t_Dbg ) is
    begin
    
        Test.step := TC_STEP;
        dbg.step <= Test.step;
            
    end procedure test_step;
    
    -----------------
    -- TEST ASSERT --
    -----------------
    
    procedure test_assert (
        Test                : inout t_Test;
        test_condition      : in boolean;
        constant MSG_FAILED : in string;
        signal dbg          : inout t_Dbg ) is
    begin
    
        if test_condition then
            report "=> STEP " & natural'image(Test.step) & " PASSED" severity note;
        else
            report "=> STEP " & natural'image(Test.step) & " FAILED : " & MSG_FAILED severity error;
            Test.status := TEST_FAILED;
            dbg.steps_failed <= dbg.steps_failed + 1; -- If failed, increment fails counter
        end if;
        
    end procedure test_assert;
    
    -----------------
    -- TEST RESULT --
    -----------------
    
    procedure test_result (
        Test        : inout t_Test;
        signal dbg  : inout t_Dbg ) is
    begin
        
        if Test.status = TEST_PASSED then
            report "[" & Test.id(1 to Test.id_len) & "] PASSED" severity note;
        else
            report "[" & Test.id(1 to Test.id_len) & "] FAILED"  severity error;
            dbg.tests_failed <= dbg.tests_failed + 1;
        end if;
        
        wait for STEP_TIME;
        
    end procedure test_result;

end package body tb_helpers;
