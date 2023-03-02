library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_tb is
end;

architecture bench of ALU_tb is

  component ALU
      Port(   A,B: in std_logic_vector (7 downto 0); 
              J_Select: in std_logic_vector (3 downto 0); 
              V,C: out std_logic;
              J: out std_logic_vector (7 downto 0));
  end component;

  signal A,B: std_logic_vector (7 downto 0);
  signal J_Select: std_logic_vector (3 downto 0);
  signal V,C,V_exp,C_exp: std_logic;
  signal J,J_exp: std_logic_vector (7 downto 0);

begin

  uut: ALU port map ( A        => A,
                      B        => B,
                      J_Select => J_Select,
                      V        => V,
                      C        => C,
                      J        => J );

  stimulus: process
  begin

    A <= x"00";
    B <= x"00";
    J_Select <= x"0";
    V_exp <= '0';
    C_exp <= '0';
    J_exp <= x"00";
    wait for 10 ns;
    
        A <= x"55";
        B <= x"AA";
        J_Select <= x"0";
        V_exp <= '0';
        C_exp <= '0';
        J_exp <= x"55";
        wait for 10 ns;
        
 -- A + 1 
           A <= x"00";
           B <= x"AA";
           J_Select <= x"1";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"01";
           wait for 10 ns;
           
           -- A + B
           A <= "10010001";
           B <= "01100100";
           J_Select <= x"2";
           V_exp <= '1';
           C_exp <= '0';
           J_exp <= "11110101";
           wait for 10 ns;
           
           -- A + B + 1
           A <= "10010001";
           B <= "01100100";
           J_Select <= x"3";
           V_exp <= '1';
           C_exp <= '0';
           J_exp <= "11110110";
           wait for 10 ns;
           
           -- A + not B
           A <= "10010001";
           B <= "01100100";
           J_Select <= x"4";
           V_exp <= '1';
           C_exp <= '1';
           J_exp <= "00101100";
           wait for 10 ns;
           
           -- A + not B + 1
           A <= "10010001";
           B <= "01100100";
           J_Select <= x"5";
           V_exp <= '1';
           C_exp <= '1';
           J_exp <= "00101101";
           wait for 10 ns;
           
           -- A - 1
           A <= "00001000";
           B <= x"00";
           J_Select <= x"6";
           V_exp <= '1';
           C_exp <= '1';
           J_exp <= "00000111";
           wait for 10 ns;
           
           -- A
           A <= x"55";
           B <= x"00";
           J_Select <= x"7";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"55";
           wait for 10 ns;
           
           -- A or B
           A <= x"55";
           B <= x"AA";
           J_Select <= x"8";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"FF";
           wait for 10 ns;
           
           -- A and B
           A <= x"55";
           B <= x"AA";
           J_Select <= x"9";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"00";
           wait for 10 ns;
           
           -- A xor B
           A <= x"55";
           B <= x"AA";
           J_Select <= x"A";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"FF";
           wait for 10 ns;
           
           -- not A
           A <= x"55";
           B <= x"AA";
           J_Select <= x"B";
           V_exp <= '0';
           C_exp <= '0';
           J_exp <= x"AA";
           wait for 10 ns;


  end process;


end;