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

  signal A,B: STD_LOGIC_VECTOR (7 downto 0);
  signal C_in, S_in: STD_LOGIC;
  signal Sum: STD_LOGIC_VECTOR (7 downto 0);
  signal C_out: STD_LOGIC;
  
  signal Sum_exp: std_logic_vector (7 downto 0);
  signal C_out_exp: std_logic;


begin

  uut: ADD_SUBB_8bit port map ( A,B,C_in,S_in,Sum,C_out );                                
  
  stimulus: process
  begin

    -- Række 1
    A <= "10010001";
    B <= "01100100";
    C_in <= '0';
    S_in <= '0';
    
    Sum_exp <= "11110101";
    C_out_exp <= '0';
    wait for 10 ns;
    
    A <= "10010001";
    B <= "01100100";
    C_in <= '1';
    S_in <= '1';
    
    Sum_exp <= "00101101";
    C_out_exp <= '1';
    wait for 10 ns;
    
    -- Række 2
    A <= "10010001";
    B <= "10100011";
    C_in <= '0';
    S_in <= '0';
    
    Sum_exp <= "00110100";
    C_out_exp <= '1';
    wait for 10 ns;
    
    A <= "10010001";
    B <= "10100011";
    C_in <= '1';
    S_in <= '1';
    
    Sum_exp <= "11101110";
    C_out_exp <= '0';
    wait for 10 ns;
    
    -- Række 3
    A <= "00001000";
    B <= "11111000";
    C_in <= '0';
    S_in <= '0';
    
    Sum_exp <= "00000000";
    C_out_exp <= '1';
    wait for 10 ns;
    
    A <= "00001000";
    B <= "11111000";
    C_in <= '1';
    S_in <= '1';
    
    Sum_exp <= "00010000";
    C_out_exp <= '0';
    wait for 10 ns;
    
end process;

end;