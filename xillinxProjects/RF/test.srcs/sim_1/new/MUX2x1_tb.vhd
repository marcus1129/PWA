library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX2x1_tb is
end;

architecture bench of MUX2x1_tb is

  component MUX2x1
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Sel : in STD_LOGIC;
             Output : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal Sel: STD_LOGIC;
  signal Output: STD_LOGIC;
  
  signal Output_exp: std_logic;

begin

  uut: MUX2x1 port map ( A      => A,
                         B      => B,
                         Sel    => Sel,
                         Output => Output );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= '0';
    B <= '0';
    Sel <= '0';
    Output_exp <= '0';
    wait for 10 ns;

    -- Put test bench stimulus code here
    A <= '0';
    B <= '1';
    Sel <= '0';
    Output_exp <= '0';
    wait for 10 ns;
    
    Sel <= '1';
    Output_exp <= '1';
    wait for 10 ns;
    
    A <= '1';
    B <= '0';
    Sel <= '0';
    Output_exp <= '1';
    wait for 10 ns;
    
    Sel <= '1';
    Output_exp <= '0';
    wait for 10 ns;

  end process;


end;