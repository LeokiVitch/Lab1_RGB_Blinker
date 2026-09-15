library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rgb_led_top is
end tb_rgb_led_top;

architecture Behavioral of tb_rgb_led_top is

    constant CLK_PERIOD : time := 8 ns;

    signal sys_clk : std_logic := '0';
    signal rst     : std_logic := '1';
    signal sw      : std_logic_vector(2 downto 0) := "000";
    signal rgb_out : std_logic_vector(2 downto 0);

begin

    --------------------------------------------------
    -- Device Under Test
    --------------------------------------------------
    uut : entity work.rgb_led_top
        generic map (
            CLK_CYCLES_PER_TOGGLE => 10
        )
        port map (
            sys_clk => sys_clk,
            rst     => rst,
            sw      => sw,
            rgb_out => rgb_out
        );


    --------------------------------------------------
    -- 125 MHz Clock
    --------------------------------------------------
    clock_process : process
    begin
        while true loop
            sys_clk <= '0';
            wait for CLK_PERIOD / 2;

            sys_clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;


    --------------------------------------------------
    -- Test Cases
    --------------------------------------------------
    stimulus_process : process
    begin

        --------------------------------------------------
        -- TEST 1: RESET
        -- Expected rgb_out = 000
        --------------------------------------------------
        rst <= '1';
        sw  <= "000";

        wait for 5 * CLK_PERIOD;

        rst <= '0';

        wait for 5 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST 2: SW0
        -- RED 
        --------------------------------------------------
        sw <= "001";

        wait for 25 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST 3: SW1
        -- GREEN 
        --------------------------------------------------
        sw <= "010";

        wait for 25 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST 4: SW2
        -- BLUE 
        --------------------------------------------------
        sw <= "100";

        wait for 25 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST 5: Multiple switches active
        -- RGB LED should be OFF
        --------------------------------------------------
        sw <= "011";

        wait for 10 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST 6: All switches active
        -- RGB LED should be OFF
        --------------------------------------------------
        sw <= "111";

        wait for 10 * CLK_PERIOD;


        --------------------------------------------------
        -- Return to no switches
        --------------------------------------------------
        sw <= "000";

        wait for 10 * CLK_PERIOD;


        --------------------------------------------------
        -- End Simulation
        --------------------------------------------------
        wait;

    end process;

end Behavioral;
