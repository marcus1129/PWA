library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.math_real.all;

entity decoder4x16_tb is
end;

architecture bench of decoder4x16_tb is

  component decoder4x16
      Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
             Y : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal X: STD_LOGIC_VECTOR (3 downto 0);
  signal Y: STD_LOGIC_VECTOR (15 downto 0);

begin

  uut: decoder4x16 port map ( X => X,
                              Y => Y );

  stimulus: process
  begin
    -- Put initialisation code here
    X <= "0000";
    wait for 10 ns;

    -- Put test bench stimulus code here
    for i in integer range 0 to 15 loop
        X <= std_logic_vector(to_unsigned(i, 4));
        
        wait for 10 ns;
        
    end loop;

  end process;


end;