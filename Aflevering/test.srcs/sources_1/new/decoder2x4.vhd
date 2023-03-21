----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2023 07:16:40 AM
-- Design Name: 
-- Module Name: decoder2x4 - Behavioral
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

entity decoder2x4 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           E : in STD_LOGIC;
           out0 : out STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC;
           out3 : out STD_LOGIC);
end decoder2x4;

architecture Behavioral of decoder2x4 is

signal A_not, B_not: std_logic;

begin

A_not <= not A;
B_not <= not B;

out0 <= (A_not or B_not) and E;
out1 <= (A_not or  B) and E;
out2 <= (A or B_not) and E;
out3 <= (A and B) and E;

end Behavioral;
