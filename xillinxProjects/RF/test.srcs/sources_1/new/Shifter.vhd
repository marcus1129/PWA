----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 06:46:30 PM
-- Design Name: 
-- Module Name: Shifter - Shifter_Behavorial
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

entity Shifter is
    port (  B: in std_logic_vector (7 downto 0); 
            H_Select: in std_logic_vector (1 downto 0); 
            H: out std_logic_vector (7 downto 0));
end Shifter;

architecture Shifter_Behavorial of Shifter is

begin


end Shifter_Behavorial;
