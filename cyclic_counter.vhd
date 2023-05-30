library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cyclic_counter is
    port (
        clock        : in  std_logic;
        clock_enable : in  std_logic;
        cnt          : out std_logic_vector(2 downto 0)
    );
end entity cyclic_counter;

architecture Behavioral of cyclic_counter is
    signal counter_reg : unsigned(2 downto 0) := (others => '0');
begin
    process (clock)
    begin
        if rising_edge(clock) then
            if clock_enable = '1' then 
				if counter_reg = "111" then
					counter_reg <= (others => '0');	   
				else
                	counter_reg <= counter_reg + 1;
				end if;
            end if;
        end if;
    end process;
    
    cnt <= std_logic_vector(counter_reg); 
	
end Behavioral;