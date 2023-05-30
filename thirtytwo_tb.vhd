library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity thirtytwo_tb is
end thirtytwo_tb;

architecture tb of thirtytwo_tb is
signal clock : std_logic := '0';
signal sev : std_logic := '0';
begin
	clock <= not clock after 10 ns;
	DUT : entity work.thirtytwo
		port map (
		clock => clock,
		done => sev
		);
		
	tb : process
	begin
		wait for 10000 ns;
	end process;

end tb;