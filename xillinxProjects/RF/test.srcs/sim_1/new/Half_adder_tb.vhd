library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Half_adder_tb is
end;

architecture bench of Half_adder_tb is

  component Half_adder
      Port ( X : in STD_LOGIC;
             Y : in STD_LOGIC;
             S : out STD_LOGIC;
             C : out STD_LOGIC);
  end component;

  signal X: STD_LOGIC;
  signal Y: STD_LOGIC;
  signal S, S_exp, S_test: STD_LOGIC;
  signal C, C_exp, C_test: STD_LOGIC;

begin

  uut: Half_adder port map ( X => X,
                             Y => Y,
                             S => S,
                             C => C );

  stimulus: process
  begin
    -- De nestede for løkker genererer samtlige input kombinationer
    for A in std_logic range '0' to '1' loop
        for B in std_logic range '0' to '1' loop
            
            -- Inputs sættes
            X <= A;
            Y <= B;
            
            -- Forventet output beregnes
            S_exp <= A xor B;
            C_exp <= A and B;           
            
            -- Komponentens output sammenlignes med det forventede output
            S_test <= S xor S_exp;
            C_test <= C xor C_exp;
            
            -- Der ventes på steady state
            wait for 10 ns;
            
        end loop;
    end loop;

  end process;


end;