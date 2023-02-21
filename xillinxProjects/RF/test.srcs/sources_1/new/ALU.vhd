----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 06:42:51 PM
-- Design Name: 
-- Module Name: ALU - ALU_Behavorial
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

entity ALU is
    Port(   A,B: in std_logic_vector (7 downto 0); 
            J_Select: in std_logic_vector (3 downto 0); 
            V,C: out std_logic;
            J: out std_logic_vector (7 downto 0));
end ALU;

architecture ALU_Behavorial of ALU is

component ADD_SUBB_8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           C_out: out STD_LOGIC);
end component;

signal plus_one, invert : std_logic;

signal C_out: std_logic;
signal Res: std_logic_vector (7 downto 0);

begin

plus_one <= A(0); -- dette skal ændres ofc
invert <= A(0); -- dette skal ændres ofc
J <= Res;

V <= C_out xor Res(7);
C <= C_out;

ADD_SUB: ADD_SUBB_8bit port map(A,B,plus_one,invert, Res, C_out);



end ALU_Behavorial;
