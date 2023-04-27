
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity ZeroFiller is 
    port (  IR: in std_logic_vector (15 downto 0); 
            ZeroFilled_8: out std_logic_vector ( 7 downto 0) );
End ZeroFiller;

Architecture ZF_Behavorial of ZeroFiller is 

Begin

    ZeroFilled_8 <= "00000" & IR(2 downto 0);

End ZF_Behavorial;
