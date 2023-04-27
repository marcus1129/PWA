library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SignExtender_tb is
end;

architecture bench of SignExtender_tb is

  component SignExtender 
      port (  IR: in std_logic_vector (15 downto 0); 
              Extended_8: out std_logic_vector ( 7 downto 0));
  end component;

  signal IR: std_logic_vector (15 downto 0);
  signal Extended_8: std_logic_vector ( 7 downto 0);
  signal Svar: std_logic_vector ( 7 downto 0);

begin

  uut: SignExtender port map ( IR         => IR,
                               Extended_8 => Extended_8 );

  stimulus: process
  begin

      IR <= "1011001010100000";
          Svar <= "00010000";
              wait for 10 ns;
          IR <= "1100101000010101";
          Svar <= "00000101";
              wait for 10 ns;
          IR <= "1011100100110001";
          Svar <= "11100001";
              wait for 10 ns;
          IR <= "1010000000000001";
          Svar <= "00000001";
              wait for 10 ns;
          IR <= "1001000101110101";
          Svar <= "11101101";
              wait for 10 ns;
          IR <= "0110000100000011";
          Svar <= "11100011";
              wait for 10 ns;

    wait;
  end process;


end;
