library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NegZero is
    Port(   MUXF: in std_logic_vector (7 downto 0);
            N,Z: out std_logic);
end NegZero;

architecture NegZero_Behavorial of NegZero is

begin

N <= MUXF(7);
Z <= not ( MUXF(7) or MUXF(6) or MUXF(5) or MUXF(4) or MUXF(3) or MUXF(2) or MUXF(1) or MUXF(0) );

end NegZero_Behavorial;
