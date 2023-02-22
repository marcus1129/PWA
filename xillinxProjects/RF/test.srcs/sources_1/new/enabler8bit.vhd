----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2023 12:48:32 PM
-- Design Name: 
-- Module Name: enabler8bit - Behavioral
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

entity enabler8bit is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           E : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end enabler8bit;

architecture Behavioral of enabler8bit is

component Enabler is
    Port ( input : in STD_LOGIC;
           enable : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

begin

GEN_Enabler: for i in 0 to 7 generate
    ENABLE: Enabler port map(X(i),E,Y(i));     
end generate GEN_Enabler;

end Behavioral;
