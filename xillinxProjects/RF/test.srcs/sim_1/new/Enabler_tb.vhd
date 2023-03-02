library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Enabler_tb is
end;

architecture bench of Enabler_tb is

  component Enabler
      Port ( input : in STD_LOGIC;
             enable : in STD_LOGIC;
             output : out STD_LOGIC);
  end component;

  signal input: STD_LOGIC;
  signal enable: STD_LOGIC;
  signal output, output_exp: STD_LOGIC;

begin

  uut: Enabler port map ( input  => input,
                          enable => enable,
                          output => output );

  stimulus: process
  begin
  
    -- Put initialisation code here
    input <= '0';
    enable <= '0';
    output_exp <= '0';
    wait for 10 ns;


    -- Put test bench stimulus code here
    input <= '0';
    enable <= '1';
    output_exp <= '0';
    wait for 10 ns;
    
    input <= '1';
    enable <= '1';
    output_exp <= '1';
    wait for 10 ns;
    
    input <= '1';
    enable <= '0';
    output_exp <= '0';
    wait for 10 ns;

    wait;
  end process;


end;