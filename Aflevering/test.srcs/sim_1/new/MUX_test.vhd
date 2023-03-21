-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX2x1x8_tb is
end;

architecture bench of MUX2x1x8_tb is

  component MUX2x1x8
      port (  R,S: in std_logic_vector (7 downto 0); 
              MUX_Select: in std_logic;
              Y: out std_logic_vector (7 downto 0));
  end component;

  signal R,S: std_logic_vector (7 downto 0);
  signal MUX_Select: std_logic;
  signal Y: std_logic_vector (7 downto 0);

begin

  uut: MUX2x1x8 port map ( R          => R,
                           S          => S,
                           MUX_Select => MUX_Select,
                           Y          => Y );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;