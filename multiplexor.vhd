library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
    port (
        d : in std_logic_vector(31 downto 0);
        s : in std_logic_vector(2 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
end multiplexor;

 architecture Behavioral of multiplexor is

begin

    process(d,s)
    begin
        if s = "000" then
            q <= d(3 downto 0);
        elsif s = "001" then
            q <= d(7 downto 4);
        elsif s = "010" then
            q <= d(11 downto 8);
        elsif s = "011" then
            q <= d(15 downto 12);
        elsif s = "100" then
            q <= d(19 downto 16);
        elsif s = "101" then
            q <= d(23 downto 20);
		elsif s = "110" then
            q <= d(27 downto 24);
        else
            q <= d(31 downto 28);
        end if;
        
    end process;

end Behavioral;