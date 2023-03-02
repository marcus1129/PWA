library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity logic_unit_tb is
end;

architecture bench of logic_unit_tb is

  component logic_unit
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Res : out STD_LOGIC;
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal Res, Res_exp: STD_LOGIC;
  signal S0: STD_LOGIC;
  signal S1: STD_LOGIC;

begin

  uut: logic_unit port map ( A   => A,
                             B   => B,
                             Res => Res,
                             S0  => S0,
                             S1  => S1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= '0';
    B <= '0';
    S0 <= '0';
    S1 <= '0';
    Res_exp <= '0';
    wait for 10 ns;

    -- Put test bench stimulus code here
    -- OR test
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
        
            A <= A_cnt;
            B <= B_cnt;
            Res_exp <= A_cnt OR B_cnt;
            wait for 10 ns;
            
        end loop;
    end loop;
    
    -- AND test
    S0 <= '1';
    S1 <= '0';
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
            A <= A_cnt;
            B <= B_cnt;
            Res_exp <= A_cnt AND B_cnt;
            wait for 10 ns;
        end loop;
    end loop;
    
    -- XOR test
    S0 <= '0';
    S1 <= '1';
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
            A <= A_cnt;
            B <= B_cnt;
            Res_exp <= A_cnt XOR B_cnt;
            wait for 10 ns;
        end loop;
    end loop;
    
    -- NOT test
    S0 <= '1';
    S1 <= '1';
    for A_cnt in std_logic range '0' to '1' loop
        for B_cnt in std_logic range '0' to '1' loop
            A <= A_cnt;
            B <= B_cnt;
            Res_exp <= NOT A_cnt;
            wait for 10 ns;
        end loop;
    end loop;

  end process;


end;
  