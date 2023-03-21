----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 09:04:45 PM
-- Design Name: 
-- Module Name: ADD_SUBB_8bit - Behavioral
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

entity ADD_SUBB_8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           C_out: out STD_LOGIC);
end ADD_SUBB_8bit;

architecture Behavioral of ADD_SUBB_8bit is

component Adder_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end component;

signal cc: std_logic_vector (7 downto 0);

begin

GEN_ADD_SUB: for i in 0 to 7 generate

    lsb: if i=0 generate
        U0: adder_Subtractor port map(A(i),B(i),C_in,S_in,cc(i),Sum(i));
    end generate lsb;
    
    bits: if (i>0 and i<7) generate
        UX: adder_Subtractor port map(A(i),B(i),cc(i-1),S_in,cc(i),Sum(i));
    end generate bits;
    
    msb: if i=7 generate
        U7: adder_Subtractor port map(A(i),B(i),cc(i-1),S_in,C_out,Sum(i));
    end generate msb;
        
end generate GEN_ADD_SUB;


end Behavioral;
