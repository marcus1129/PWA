----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 06:39:50 PM
-- Design Name: 
-- Module Name: FunctionSelect - FD_Behavorial
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

Entity FunctionSelect is 
    port (  FS3,FS2: in std_logic;
            MF: out std_logic );
End FunctionSelect;

architecture FD_Behavorial of FunctionSelect is

begin

MF <= FS2 and FS3;

end FD_Behavorial;
