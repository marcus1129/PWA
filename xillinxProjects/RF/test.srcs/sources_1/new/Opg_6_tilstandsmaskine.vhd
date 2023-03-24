----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2023 04:17:00 PM
-- Design Name: 
-- Module Name: Opg_6_tilstandsmaskine - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Opg_6_tilstandsmaskine is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           ID : in STD_LOGIC;
           IL : out STD_LOGIC;
           PS_0 : out STD_LOGIC);
end Opg_6_tilstandsmaskine;

architecture Behavioral of Opg_6_tilstandsmaskine is

type StateType is (INF, EX0, EX1);
signal State, NextState: StateType;

begin

process(Reset, CLK)
begin
    if Reset = '1' then State <= INF;
    elsif CLK'event and CLK = '1' then
        State <= NextState;
    end if;
end process;

process(State, ID)
begin
    case State is
        
        when INF =>
            NextState <= EX0;
            IL <= '1';
            PS_0 <= '0';
        
        when EX0 =>
            IL <= '0';
            if ID = '0' then
                NextState <= INF;
                PS_0 <= '1';
            elsif ID = '1' then
                NextState <= EX1;
                PS_0 <= '0';
            end if;
        
        when EX1 =>
            NextState <= INF;
            IL <= '0';
            PS_0 <= '1';
    end case;
end process;
            
            


end Behavioral;
