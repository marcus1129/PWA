----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 06:49:16 PM
-- Design Name: 
-- Module Name: NegZero - NegZero_Behavorial
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

entity NegZero is
    Port(   MUXF: in std_logic_vector (7 downto 0);
            N,Z: out std_logic);
end NegZero;

architecture NegZero_Behavorial of NegZero is

begin

N <= MUXF(7);
Z <= not ( MUXF(7) or MUXF(6) or MUXF(5) or MUXF(4) or MUXF(3) or MUXF(2) or MUXF(1) or MUXF(0) );

end NegZero_Behavorial;
