library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity enabler8bit_tb is
end;

architecture bench of enabler8bit_tb is

  component enabler8bit
      Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
             E : in STD_LOGIC;
             Y : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

  signal X: STD_LOGIC_VECTOR (7 downto 0);
  signal E: STD_LOGIC;
  signal Y, Y_exp: STD_LOGIC_VECTOR (7 downto 0);

begin

  uut: enabler8bit port map ( X => X,
                              E => E,
                              Y => Y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    X <= x"00";
    E <= '0';
    Y_exp <= x"00";
    wait for 10 ns;


    -- Put test bench stimulus code here
    X <= x"00";
    E <= '1';
    Y_exp <= x"00";
    wait for 10 ns;
    
    X <= x"FF";
    E <= '1';
    Y_exp <= x"FF";
    wait for 10 ns;
    
    X <= x"FF";
    E <= '0';
    Y_exp <= x"00";
    wait for 10 ns;
    
    X <= x"01";
    E <= '1';
    Y_exp <= x"01";
    wait for 10 ns;
    
    X <= x"02";
    Y_exp <= x"02";
    wait for 10 ns;
    
    X <= x"04";
    Y_exp <= x"04";
    wait for 10 ns;
    
    X <= x"08";
    Y_exp <= x"08";
    wait for 10 ns;
    
    X <= x"10";
    Y_exp <= x"10";
    wait for 10 ns;
    
    X <= x"20";
    Y_exp <= x"20";
    wait for 10 ns;
    
    X <= x"40";
    Y_exp <= x"40";
    wait for 10 ns;
    
    X <= x"80";
    Y_exp <= x"80";
    wait for 10 ns;

    wait;
  end process;


end;