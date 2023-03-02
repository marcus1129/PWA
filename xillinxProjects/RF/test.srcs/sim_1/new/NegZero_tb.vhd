library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity NegZero_tb is
end;

architecture bench of NegZero_tb is

  component NegZero
      Port(   MUXF: in std_logic_vector (7 downto 0);
              N,Z: out std_logic);
  end component;

  signal MUXF: std_logic_vector (7 downto 0);
  signal N,Z,N_exp,Z_exp: std_logic;

begin

  uut: NegZero port map ( MUXF => MUXF,
                          N    => N,
                          Z    => Z );

  stimulus: process
  begin
    -- Put initialisation code here
    MUXF <= x"00";
    N_exp <= '0';
    Z_exp <= '1';
    wait for 10 ns;

    -- Put test bench stimulus code here
    MUXF <= x"80";
    N_exp <= '1';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"40";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"20";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"10";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"08";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"04";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"02";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"01";
    N_exp <= '0';
    Z_exp <= '0';
    wait for 10 ns;
    
    MUXF <= x"00";
    N_exp <= '0';
    Z_exp <= '1';
    wait for 10 ns;

  end process;


end;