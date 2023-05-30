----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 08:27:15
-- Design Name: 
-- Module Name: pwm - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity pwm is
    generic(
        C_PWM_WIDTH : integer := 8
    );
    port(
        clk   : in  std_logic;
        value : in  std_logic_vector(C_PWM_WIDTH - 1 downto 0);
        pwm   : out std_logic
    );
end pwm;

architecture Behavioral of pwm is
    signal cnt : std_logic_vector(C_PWM_WIDTH - 1 downto 0);
begin
    count : entity work.counter
    generic map(
    COUNTER_WIDTH => C_PWM_WIDTH
    )
    port map(
    clock_enable => '1',
    repeat => '1',
    limit => (others => '1'),
    done => open,
    clock => clk,
    reset => '0',
    unsigned(cnt) => cnt    
    );
    -- implement PWM
    process(clk)
    begin
        if unsigned(value) = 0 then
            pwm <= '0';
        elsif cnt <= value then
            pwm <= '1';
        else
            pwm <= '0';
        end if;
    end process;  
     

end Behavioral;
