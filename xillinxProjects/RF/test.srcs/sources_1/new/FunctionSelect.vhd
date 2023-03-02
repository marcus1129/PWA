library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity FunctionSelect is 
    port (  FS3,FS2: in std_logic;
            MF: out std_logic );
End FunctionSelect;

architecture FD_Behavorial of FunctionSelect is

begin

MF <= FS2 and FS3;

end FD_Behavorial;
