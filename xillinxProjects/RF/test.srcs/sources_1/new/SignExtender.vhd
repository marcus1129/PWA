

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity SignExtender is 
    port (  IR: in std_logic_vector (15 downto 0); 
            Extended_8: out std_logic_vector ( 7 downto 0));
End SignExtender;

Architecture SE_Behavorial of SignExtender is 
Begin

process is
begin

 if IR(8) = '1' then
    Extended_8 <= "111" & IR(7) & IR(6) & IR(2) & IR(1) & IR(0);
 else
    Extended_8 <= "000" & IR(7) & IR(6) & IR(2) & IR(1) & IR(0);

end if;
End process;

End;

