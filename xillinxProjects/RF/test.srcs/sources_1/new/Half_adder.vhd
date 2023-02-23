----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 08:35:08 PM
-- Design Name: 
-- Module Name: Half_adder - Behavioral
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

entity Half_adder is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end Half_adder;

architecture Behavioral of Half_adder is

begin

S <= X xor Y;
C <= X and Y;

end Behavioral;
