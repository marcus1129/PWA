library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity logic_unit8bit_tb is
end;

architecture bench of logic_unit8bit_tb is

  component logic_unit8bit
      Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
             B : in STD_LOGIC_VECTOR (7 downto 0);
             Y : out STD_LOGIC_VECTOR (7 downto 0);
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC);
  end component;

  signal A: STD_LOGIC_VECTOR (7 downto 0);
  signal B: STD_LOGIC_VECTOR (7 downto 0);
  signal Y, Y_exp: STD_LOGIC_VECTOR (7 downto 0);
  signal S0: STD_LOGIC;
  signal S1: STD_LOGIC;

begin

  uut: logic_unit8bit port map ( A  => A,
                                 B  => B,
                                 Y  => Y,
                                 S0 => S0,
                                 S1 => S1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= x"00";
    B <= x"00";
    S0 <= '0';
    S1 <= '0';
    Y_exp <= x"00";
    wait for 10 ns;


    -- Put test bench stimulus code here
    -- OR test
    A <= x"AA";
    B <= x"00";
    S0 <= '0';
    S1 <= '0';
    Y_exp <= x"AA";
    wait for 10 ns;
    
    A <= x"00";
    B <= x"AA";
    S0 <= '0';
    S1 <= '0';
    Y_exp <= x"AA";
    wait for 10 ns;
    
    A <= x"AA";
    B <= x"55";
    S0 <= '0';
    S1 <= '0';
    Y_exp <= x"FF";
    wait for 10 ns;
    
    -- AND test
    A <= x"AA";
    B <= x"AA";
    S0 <= '1';
    S1 <= '0';
    Y_exp <= x"AA";
    wait for 10 ns;
    
    A <= x"55";
    B <= x"55";
    S0 <= '1';
    S1 <= '0';
    Y_exp <= x"55";
    wait for 10 ns;
    
    A <= x"AA";
    B <= x"55";
    S0 <= '1';
    S1 <= '0';
    Y_exp <= x"00";
    wait for 10 ns;
    
    -- XOR test
    A <= x"AA";
    B <= x"AA";
    S0 <= '0';
    S1 <= '1';
    Y_exp <= x"00";
    wait for 10 ns;
    
    A <= x"55";
    B <= x"55";
    S0 <= '0';
    S1 <= '1';
    Y_exp <= x"00";
    wait for 10 ns;
    
    A <= x"AA";
    B <= x"55";
    S0 <= '0';
    S1 <= '1';
    Y_exp <= x"FF";
    wait for 10 ns;
    
    -- NOT test
    A <= x"AA";
    B <= x"AA";
    S0 <= '1';
    S1 <= '1';
    Y_exp <= x"55";
    wait for 10 ns;
    
    A <= x"55";
    B <= x"55";
    S0 <= '1';
    S1 <= '1';
    Y_exp <= x"AA";
    wait for 10 ns;
    
    A <= x"AA";
    B <= x"55";
    S0 <= '1';
    S1 <= '1';
    Y_exp <= x"55";
    wait for 10 ns;
    
    A <= x"00";
    B <= x"FF";
    S0 <= '1';
    S1 <= '1';
    Y_exp <= x"FF";
    wait for 10 ns;
    

    wait;
  end process;


end;