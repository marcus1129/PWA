library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ZeroFiller_tb is
end;

architecture bench of ZeroFiller_tb is

  component ZeroFiller 
      port (  IR: in std_logic_vector (15 downto 0); 
              ZeroFilled_8: out std_logic_vector ( 7 downto 0) );
  end component;

  signal IR: std_logic_vector (15 downto 0);
  signal ZeroFilled_8: std_logic_vector ( 7 downto 0) ;

begin

  uut: ZeroFiller port map ( IR           => IR,
                             ZeroFilled_8 => ZeroFilled_8 );

  stimulus: process
  begin
  
    IR <= "1011001010100000";
        wait for 10 ns;
    IR <= "1100101000010101";
        wait for 10 ns;
    IR <= "1011100100110001";
        wait for 10 ns;
    IR <= "1010000000000001";
        wait for 10 ns;
    IR <= "1001000101110101";
        wait for 10 ns;
    IR <= "0110000100000011";
        wait for 10 ns; 

    wait;
  end process;


end;
  