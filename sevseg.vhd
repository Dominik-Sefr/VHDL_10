library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg is
    Port(
        disp_sel : in  std_logic_vector(2 downto 0);
        char_sel : in  std_logic_vector(3 downto 0);
        displays : out std_logic_vector(7 downto 0);
        segments : out std_logic_vector(7 downto 0)
    );
end sevseg;

architecture Behavioral of sevseg is

begin
    with disp_sel select displays <=
        "11111110" when "000",
        "11111101" when "001",
        "11111011" when "010",
        "11110111" when "011",
        "11101111" when "100",
        "11011111" when "101",
        "10111111" when "110",
        "01111111" when others;
    with char_sel select segments <=
        "11000000" when "0000",
        "11111001" when "0001",
        "10100100" when "0010",
        "10110000" when "0011",
        "10011001" when "0100",
        "10010010" when "0101",
        "10000010" when "0110",
        "11111000" when "0111",
        "10000000" when "1000",
        "10010000" when "1001",
        "10001000" when "1010",
        "10000011" when "1011",
        "11000110" when "1100",
        "10100001" when "1101",
        "10000110" when "1110",
        "10001110" when others;
end Behavioral;