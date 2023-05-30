library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_driver is
    port(
        clock    : in  std_logic;
        reset    : in  std_logic;
        din      : in  std_logic_vector(31 downto 0);
        segments : out std_logic_vector(7 downto 0);
        displays : out std_logic_vector(7 downto 0)
    );
end display_driver;

architecture Behavioral of display_driver is 
	signal num : std_logic_vector(3 downto 0);
	signal sel : std_logic_vector(2 downto 0);
	constant DIV10kHZ_WIDTH : integer := 14;
    constant DIV10kHZ_LIMIT : integer := 9999;
	signal segments_temp : std_logic_vector(7 downto 0);
	signal displays_temp : std_logic_vector(7 downto 0);
    
    signal div10kHz_done : std_logic;
begin
	mux1 : entity work.multiplexor
        port map(
            d => din,
            s => sel,
            q => num
        );
	svsg : entity work.sevseg
        port map(
            disp_sel => sel, 
        	char_sel => num,
        	displays => displays_temp,
        	segments => segments_temp
        );
	clock_div : entity work.counter
        generic map(
            COUNTER_WIDTH => DIV10kHZ_WIDTH
        )
        port map(
            clock        => clock,
            cnt          => open,
            reset        => '0',
            clock_enable => '1',
            limit        => std_logic_vector(to_unsigned(DIV10kHZ_LIMIT, DIV10kHZ_WIDTH)),
            repeat       => '1',
            done         => div10kHz_done
        );			
	counter_inst : entity work.cyclic_counter
        port map (
            clock        => clock,
            clock_enable => div10kHz_done,
            cnt          => sel
        );
		
	process(clock)
    begin
        if rising_edge(clock) then
        	displays <= displays_temp;
			segments <= segments_temp;
        end if;
    end process;
end Behavioral;