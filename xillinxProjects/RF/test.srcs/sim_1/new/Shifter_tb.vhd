library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Shifter_tb is
end;

architecture bench of Shifter_tb is

  component Shifter
      port (  B: in std_logic_vector (7 downto 0); 
              H_Select: in std_logic_vector (1 downto 0); 
              H: out std_logic_vector (7 downto 0));
  end component;

  signal B: std_logic_vector (7 downto 0);
  signal H_Select: std_logic_vector (1 downto 0);
  signal H, H_exp: std_logic_vector (7 downto 0);

begin

  uut: Shifter port map ( B        => B,
                          H_Select => H_Select,
                          H        => H );

  stimulus: process
  begin
  
    -- Put initialisation code here
    B <= x"00";
    H_Select <= "00";
    H_exp <= x"00";
    wait for 10 ns;


    -- Put test bench stimulus code here
    B <= x"ff";
    H_Select <= "00";
    H_exp <= x"ff";
    wait for 10 ns;
    
    B <= x"ff";
    H_Select <= "01";
    H_exp <= x"7f";
    wait for 10 ns;
    
    B <= x"ff";
    H_Select <= "10";
    H_exp <= x"fe";
    wait for 10 ns;
    
    B <= x"ff";
    H_Select <= "11";
    H_exp <= x"ff";
    wait for 10 ns;

    wait;
  end process;


end;