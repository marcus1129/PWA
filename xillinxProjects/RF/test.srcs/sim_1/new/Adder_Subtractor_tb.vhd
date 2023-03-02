library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Adder_Subtractor_tb is
end;

architecture bench of Adder_Subtractor_tb is

  component Adder_Subtractor
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             C_in : in STD_LOGIC;
             S_in : in STD_LOGIC;
             C_out : out STD_LOGIC;
             S_out : out STD_LOGIC);
  end component;

  signal A, B, C_in, S_in, C_out, S_out: STD_LOGIC;
  
  signal S_out_exp, S_out_test, C_out_exp, C_out_test: std_logic;

begin

  uut: Adder_Subtractor port map (A, B, C_in, S_in, C_out, S_out);
                    
  stimulus: process
  begin
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
            for C_in_cnt in std_logic range '0' to '1' loop
                for S_in_cnt in std_logic range '0' to '1' loop
                    
                    -- Input sættes
                    A <= A_cnt;
                    B <= B_cnt;
                    C_in <= C_in_cnt;
                    S_in <= S_in_cnt;
                    
                    -- Forventet output beregnes
                    if S_in_cnt = '0' then
                        S_out_exp <= (A_cnt xor B_cnt) xor C_in_cnt;
                        C_out_exp <= (A_cnt and B_cnt) or (C_in_cnt and (A_cnt xor B_cnt));
                    else
                        S_out_exp <= (A_cnt xor (not B_cnt)) xor C_in_cnt;
                        C_out_exp <= (A_cnt and (not B_cnt)) or (C_in_cnt and (A_cnt xor (not B_cnt)));
                    end if;
                        
                    -- Komponentens output sammenlignes med det forventede output
                    S_out_test <= S_out xor S_out_exp;
                    C_out_test <= C_out xor C_out_exp;
                    
                    -- Der ventes på steady state
                    wait for 10 ns;
                    
                    
                end loop;
            end loop;
        end loop;
    end loop;
 end process;
  
  


end;