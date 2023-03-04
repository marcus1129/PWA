library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MUX2x1x8_tb is
end;

architecture bench of MUX2x1x8_tb is

  component MUX2x1x8
      port (  A,B: in std_logic_vector (7 downto 0); 
              Sel: in std_logic;
              Output: out std_logic_vector (7 downto 0));
  end component;

  signal A,B: std_logic_vector (7 downto 0);
  signal Sel: std_logic;
  signal Output: std_logic_vector (7 downto 0);
  signal Output_exp: std_logic_vector (7 downto 0);

begin

  uut: MUX2x1x8 port map ( A      => A,
                           B      => B,
                           Sel    => Sel,
                           Output => Output );

  stimulus: process
  begin
    
    -- Put initialisation code here
    A <= x"00";
    B <= x"00";
    Sel <= '0';
    Output_exp <= x"00";
    wait for 10 ns;

    -- Put test bench stimulus code here
    A <= x"FF";
    B <= x"00";
    Sel <= '0';
    Output_exp <= x"FF";
    wait for 10 ns;
    
    A <= x"FF";
    B <= x"00";
    Sel <= '1';
    Output_exp <= x"00";
    wait for 10 ns;
    
    A <= x"00";
    B <= x"FF";
    Sel <= '0';
    Output_exp <= x"00";
    wait for 10 ns;
    
    A <= x"00";
    B <= x"FF";
    Sel <= '1';
    Output_exp <= x"FF";
    wait for 10 ns;

  end process;


end;