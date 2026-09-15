library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_blinking_led is
end tb_blinking_led;

architecture Behavioral of tb_blinking_led is

    constant CLK_PERIOD : time := 8 ns;

    signal sys_clk : std_logic := '0';
    signal rst     : std_logic := '1';
    signal led_en  : std_logic := '0';
    signal led_out : std_logic;

begin

    --------------------------------------------------
    -- Device Under Test
    --------------------------------------------------
    uut : entity work.blinking_led
        generic map (
            CLK_CYCLES_PER_TOGGLE => 10
        )
        port map (
            sys_clk => sys_clk,
            rst     => rst,
            led_en  => led_en,
            led_out => led_out
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
    -- Test Process
    --------------------------------------------------
    stimulus_process : process
    begin

        --------------------------------------------------
        -- TEST CASE 1: Reset Behavior
        --------------------------------------------------
        rst    <= '1';
        led_en <= '0';

        -- Hold reset for 5 clock cycles
        wait for 5 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST CASE 2: Disabled Output
        --------------------------------------------------
        rst    <= '0';
        led_en <= '0';

        wait for 5 * CLK_PERIOD;


        --------------------------------------------------
        -- TEST CASE 3: LED Toggling
        --------------------------------------------------
        led_en <= '1';

        -- Allow several toggle periods
        wait for 25 * CLK_PERIOD;


        --------------------------------------------------
        -- Disable LED while running
        -- led_out should return to 0
        --------------------------------------------------
        led_en <= '0';

        wait for 5 * CLK_PERIOD;


        --------------------------------------------------
        -- End Simulation
        --------------------------------------------------
        wait;

    end process;

end Behavioral;