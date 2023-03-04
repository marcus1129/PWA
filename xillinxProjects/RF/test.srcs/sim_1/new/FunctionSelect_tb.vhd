library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FunctionSelect_tb is
end;

architecture bench of FunctionSelect_tb is

component FunctionSelect is 
    port (  FS3,FS2: in std_logic;
            MF: out std_logic );
End component;

  signal FS3: STD_LOGIC;
  signal FS2: STD_LOGIC;
  signal MF: STD_LOGIC;

begin

  uut: FunctionSelect port map ( FS3  => FS3,
                                  FS2 => FS2,
                                  MF => MF );

  stimulus: process
  begin
  
    -- Put initialisation code here
    FS3 <= '0';
    FS2 <= '0';
    MF <= '0';
    wait for 10 ns;


    -- Put test bench stimulus code here
    FS3 <= '0';
    FS2 <= '1';
    MF <= '0';
    wait for 10 ns;
    
    FS3 <= '1';
    FS2 <= '1';
    MF <= '1';
    wait for 10 ns;
    
    FS3 <= '1';
    FS2 <= '0';
    MF <= '0';
    wait for 10 ns;

    wait;
  end process;


end;