library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rgb_led_top is
    generic (
        CLK_CYCLES_PER_TOGGLE : positive := 62500000
    );
    port (
        sys_clk : in  std_logic;
        rst     : in  std_logic;
        sw      : in  std_logic_vector(2 downto 0);
        rgb_out : out std_logic_vector(2 downto 0)
    );
end rgb_led_top;

architecture Behavioral of rgb_led_top is

    signal blink_signal : std_logic;
    signal blink_enable : std_logic;

begin

    --------------------------------------------------
    -- Enable blinker only when exactly one valid
    -- RGB switch is selected.
    --------------------------------------------------
    blink_enable <= '1' when
                    (sw = "001") or
                    (sw = "010") or
                    (sw = "100")
                    else '0';


    --------------------------------------------------
    -- Instantiate blinking_led module
    --------------------------------------------------
    blinker_inst : entity work.blinking_led
        generic map (
            CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
        )
        port map (
            sys_clk => sys_clk,
            rst     => rst,
            led_en  => blink_enable,
            led_out => blink_signal
        );


    --------------------------------------------------
    -- RGB Color Selection
    --
    -- sw(0) = SW0 = Red
    -- sw(1) = SW1 = Green
    -- sw(2) = SW2 = Blue
    --------------------------------------------------
    process(sw, blink_signal)
    begin

        -- Default: RGB LED OFF
        rgb_out <= "000";

        case sw is

            -- SW0 = Red
            when "001" =>
                rgb_out(0) <= blink_signal;

            -- SW1 = Green
            when "010" =>
                rgb_out(1) <= blink_signal;

            -- SW2 = Blue
            when "100" =>
                rgb_out(2) <= blink_signal;

            -- Zero or multiple switches ON
            when others =>
                rgb_out <= "000";

        end case;

    end process;

end Behavioral;