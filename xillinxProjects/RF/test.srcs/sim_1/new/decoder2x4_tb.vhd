library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder2x4_tb is
end;

architecture bench of decoder2x4_tb is

  component decoder2x4
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             E : in STD_LOGIC;
             out0 : out STD_LOGIC;
             out1 : out STD_LOGIC;
             out2 : out STD_LOGIC;
             out3 : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal E: STD_LOGIC;
  signal out0: STD_LOGIC;
  signal out1: STD_LOGIC;
  signal out2: STD_LOGIC;
  signal out3: STD_LOGIC;
  
  signal out0_exp: STD_LOGIC;
  signal out1_exp: STD_LOGIC;
  signal out2_exp: STD_LOGIC;
  signal out3_exp: STD_LOGIC;

begin

  uut: decoder2x4 port map ( A    => A,
                             B    => B,
                             E    => E,
                             out0 => out0,
                             out1 => out1,
                             out2 => out2,
                             out3 => out3 );

  stimulus: process
  begin
    
            
    -- Put initialisation code here
    A <= '0';
    B <= '0';
    E <= '0';    
    wait for 10 ns;

    -- De nestede løkker gennemløber samtlige inputkombinationer.
        for E_cnt in std_logic range '0' to '1' loop
            for A_cnt in std_logic range '0' to '1' loop
                for B_cnt in std_logic range '0' to '1' loop
                    
                    -- Input sættes
                    A <= A_cnt;
                    B <= B_cnt;
                    E <= E_cnt;
                    
                    -- Forventet output beregnes.
                    if E_cnt = '1' then
                        if A_cnt = '0' and B_cnt = '0' then
                            out0_exp <= '1';
                            out1_exp <= '0';
                            out2_exp <= '0';
                            out3_exp <= '0';
                        elsif A_cnt = '0' and B_cnt = '1' then
                            out0_exp <= '0';
                            out1_exp <= '1';
                            out2_exp <= '0';
                            out3_exp <= '0';
                        elsif A_cnt = '1' and B_cnt = '0' then
                            out0_exp <= '0';
                            out1_exp <= '0';
                            out2_exp <= '1';
                            out3_exp <= '0';
                        elsif A_cnt = '1' and B_cnt = '1' then
                            out0_exp <= '0';
                            out1_exp <= '0';
                            out2_exp <= '0';
                            out3_exp <= '1';
                        end if;
                    end if;
                    
                    wait for 10 ns;
                end loop;
            end loop;
        end loop;
  end process;


end;