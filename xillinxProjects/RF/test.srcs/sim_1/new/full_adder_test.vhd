library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Full_adder_tb is
end;

architecture bench of Full_adder_tb is

  component Full_adder
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             C_in : in STD_LOGIC;
             C_out : out STD_LOGIC;
             S : out STD_LOGIC);
  end component;

  signal A,B,C_in,C_out,S: STD_LOGIC;
  
  signal C_out_exp, C_out_test, S_exp, S_test: STD_LOGIC;

begin

  uut: Full_adder port map (A,B,C_in,C_out,S);

  stimulus: process
  begin
    -- De nestede for løkker genererer samtlige input kombinationer
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
            for C_in_cnt in std_logic range '0' to '1' loop
                
                -- Input sættes
                A <= A_cnt;
                B <= B_cnt;
                C_in <= C_in_cnt;
                
                -- Forventet output beregnes
                S_exp <= A_cnt xor B_cnt xor C_in_cnt;
                C_out_exp <= (A_cnt and B_cnt) or (C_in_cnt and (A_cnt xor B_cnt));
                
                -- Komponentens output sammenlignes med det forventede output
                S_test <= S_exp xor S;
                C_out_test <= C_out_exp xor C_out;
                
                -- Der ventes på steady state
                wait for 10 ns;
                

            end loop;
        end loop;
    end loop;
 end process;


end;