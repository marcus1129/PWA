----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 08:32:53 PM
-- Design Name: 
-- Module Name: Adder_Subtractor - Behavioral
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

entity Adder_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is

component Full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal X: std_logic;

begin

X <= S_in xor B;

ADD_SUB: Full_adder port map(A,X,C_in,C_out,S_out);

end Behavioral;
