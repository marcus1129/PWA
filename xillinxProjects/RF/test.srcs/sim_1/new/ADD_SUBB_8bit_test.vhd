-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ADD_SUBB_8bit_tb is
end;

architecture bench of ADD_SUBB_8bit_tb is

  component ADD_SUBB_8bit
      Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
             B : in STD_LOGIC_VECTOR (7 downto 0);
             C_in : in STD_LOGIC;
             S_in : in STD_LOGIC;
             Sum : out STD_LOGIC_VECTOR (7 downto 0);
             C_out: out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR (7 downto 0);
  signal B: STD_LOGIC_VECTOR (7 downto 0);
  signal C_in: STD_LOGIC;
  signal S_in: STD_LOGIC;
  signal Sum: STD_LOGIC_VECTOR (7 downto 0);
  signal C_out: STD_LOGIC;
  
  signal Sum_exp, Sum_test : std_logic_vector (7 downto 0);
  signal C_out_exp, C_out_test : std_logic;

begin

  uut: ADD_SUBB_8bit port map ( A     => A,
                                B     => B,
                                C_in  => C_in,
                                S_in  => S_in,
                                Sum   => Sum,
                                C_out => C_out );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here
    for A_cnt in 0 to 255 loop
        for B_cnt in 0 to 255 loop
            for C_in_cnt in std_logic range '0' to '1' loop
                for S_in_cnt in std_logic range '0' to '1' loop
                    A <= std_logic_vector(to_unsigned(A_cnt, 8));
                    B <= std_logic_vector(to_unsigned(B_cnt, 8));
                    C_in <= C_in_cnt;
                    S_in <= S_in_cnt;
                    
                    -- Calculate the expected output for the current input combination
                    Sum_exp <= std_logic_vector(to_unsigned(A_cnt + (B_cnt * S_in) + (B_cnt * S_in) + C_in),8);
                    C_out_exp <= 
                    
                    -- Make test line in simulation window
                    S_test <= S_exp xor S_tb;
                    C_out_test <= C_out_exp xor C_out_tb;
                    
                    -- Wait for a small amount of time to allow the Full_Adder to calculate the output
                    wait for 10 ns;
                    
                    -- Check if the actual output matches the expected output for the current input combination
                    assert ((S_exp = S_tb) and (C_out_exp = C_out_tb))
                        report "Error: Full Adder output mismatch for inputs: A=" & std_ulogic'image(A_tb) & ", B=" & std_ulogic'image(B_tb) & ", C_in=" & std_ulogic'image(C_in_tb)
                       severity error;
                 end loop
              end loop
           end loop
        end loop
                    
        
        

    wait;
  end process;


end;