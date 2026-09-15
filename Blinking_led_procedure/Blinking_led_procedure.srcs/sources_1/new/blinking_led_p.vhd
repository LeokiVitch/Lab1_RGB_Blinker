library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blinking_led_p is
    generic (
        CLK_CYCLES_PER_TOGGLE : positive := 62500000
    );
    port (
        sys_clk : in  std_logic;
        rst     : in  std_logic;
        led_en  : in  std_logic;
        led_out : out std_logic
    );
end blinking_led_p;

architecture Behavioral of blinking_led_p is

    signal counter     : integer range 0 to CLK_CYCLES_PER_TOGGLE - 1 := 0;
    signal led_out_reg : std_logic := '0';

begin

    process(sys_clk)
    begin
        if rising_edge(sys_clk) then

            -- Active-high synchronous reset
            if rst = '1' then
                counter     <= 0;
                led_out_reg <= '0';

            -- LED disabled
            elsif led_en = '0' then
                counter     <= 0;
                led_out_reg <= '0';

            -- LED enabled
            else
                if counter = CLK_CYCLES_PER_TOGGLE - 1 then
                    counter     <= 0;
                    led_out_reg <= not led_out_reg;
                else
                    counter <= counter + 1;
                end if;
            end if;

        end if;
    end process;

    led_out <= led_out_reg;

end Behavioral;