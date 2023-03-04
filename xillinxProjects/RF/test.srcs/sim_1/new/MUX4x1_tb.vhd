library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX4x1_tb is
end;

architecture bench of MUX4x1_tb is

  component MUX4x1
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             C : in STD_LOGIC;
             D : in STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             Y : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal C: STD_LOGIC;
  signal D: STD_LOGIC;
  signal S0: STD_LOGIC;
  signal S1: STD_LOGIC;
  signal Y: STD_LOGIC;

begin

  uut: MUX4x1 port map ( A  => A,
                         B  => B,
                         C  => C,
                         D  => D,
                         S0 => S0,
                         S1 => S1,
                         Y  => Y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '0';
    
    -- Put test bench stimulus code here
    S0 <= '0';
    S1 <= '0';
    wait for 10 ns;
    
    A <= '1';
    wait for 10 ns;
   
    A <= '0';
    S0 <= '1';
    S1 <= '0';
    wait for 10 ns;
    
    B <= '1';
    wait for 10 ns;
    
    B <= '0';
    S0 <= '0';
    S1 <= '1';
    wait for 10 ns;
    
    C <= '1';
    wait for 10 ns;
    
    C <= '0';
    S0 <= '1';
    S1 <= '1';
    wait for 10 ns;
    
    D <= '1';
    wait for 10 ns;

  end process;


end;