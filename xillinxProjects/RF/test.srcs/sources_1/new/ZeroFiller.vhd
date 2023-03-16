-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

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
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;
  