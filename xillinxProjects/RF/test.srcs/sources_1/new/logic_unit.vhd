----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2023 01:30:24 PM
-- Design Name: 
-- Module Name: logic_unit - Behavioral
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

entity logic_unit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Res : out STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC);
end logic_unit;

architecture Behavioral of logic_unit is

component MUX4x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

signal op_or, op_and, op_xor, op_not: std_logic;

begin

op_or <= A or B;
op_and <= A and B;
op_xor <= A xor B;
op_not <= not A;

MUX: MUX4x1 port map (op_or, op_and, op_xor, op_not, S0, S1, Res);

end Behavioral;
