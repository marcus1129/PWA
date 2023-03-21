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

  signal A_tb: STD_LOGIC;
  signal B_tb: STD_LOGIC;
  signal C_in_tb: STD_LOGIC;
  signal C_out_tb: STD_LOGIC;
  signal S_tb: STD_LOGIC;
  
  signal C_out_exp: STD_LOGIC;
  signal S_exp: STD_LOGIC;
  
  signal C_out_test, S_test: std_logic;

begin

  uut: Full_adder port map (A_tb,B_tb,C_in_tb,C_out_tb,S_tb);

  stimulus: process
  begin
    for A in std_logic range '0' to '1' loop
        for B in std_logic range '0' to '1' loop
            for C_in in std_logic range '0' to '1' loop
                -- Assign the current input combination to the test inputs
                A_tb <= A;
                B_tb <= B;
                C_in_tb <= C_in;
                
                -- Calculate the expected output for the current input combination
                S_exp <= (A xor B) xor C_in;
                C_out_exp <= (A and B) or (C_in and (A xor B));
                
                -- Make test line in simulation window
                S_test <= S_exp xor S_tb;
                C_out_test <= C_out_exp xor C_out_tb;
                
                -- Wait for a small amount of time to allow the Full_Adder to calculate the output
                wait for 10 ns;
                
                -- Check if the actual output matches the expected output for the current input combination
                assert ((S_exp = S_tb) and (C_out_exp = C_out_tb))
                    report "Error: Full Adder output mismatch for inputs: A=" & std_ulogic'image(A_tb) & ", B=" & std_ulogic'image(B_tb) & ", C_in=" & std_ulogic'image(C_in_tb)
                   severity error;
            end loop;
        end loop;
    end loop;
    --wait;
 end process;


end;