library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PWF_top_tb is
end;

architecture bench of PWF_top_tb is

  component PWF_top
      Port (  Clk_fast, Reset : in std_logic;
              BTNC, BTNU, BTNL, BTNR, BTND : in std_logic;
              SW: in std_logic_vector (7 downto 0);
              LED : out std_logic_vector (7 downto 0);
              Anode : out std_logic_vector (3 downto 0);
              Catode: out std_logic_vector(6 downto 0));
  end component;

  signal Clk_fast, Reset: std_logic;
  signal BTNC, BTNU, BTNL, BTNR, BTND: std_logic;
  signal SW: std_logic_vector (7 downto 0);
  signal LED: std_logic_vector (7 downto 0);
  signal Anode: std_logic_vector (3 downto 0);
  signal Catode: std_logic_vector(6 downto 0);
  signal clk_period: time:= 10 ns;
  signal end_test: std_logic:= '1';

begin

  uut: PWF_top port map ( Clk_fast    => Clk_fast,
                          Reset  => Reset,
                          BTNC   => BTNC,
                          BTNU   => BTNU,
                          BTNL   => BTNL,
                          BTNR   => BTNR,
                          BTND   => BTND,
                          SW     => SW,
                          LED    => LED,
                          Anode  => Anode,
                          Catode => Catode );

clock: process
    begin
    while end_test='1' loop
    Clk_fast<='0';
    wait for clk_period*0.5;
    Clk_fast<='1';
    wait for clk_period*0.5;
    end loop;
    wait;
    end process;

  stimulus: process
  begin
  
  RESET<='1';
   SW<=x"55";
   BTNC <='0';
   BTNU <='0';
   BTNL <='0';
   BTNR <='0';
   BTND <='0';
  wait for clk_period;
  RESET <='0';
  wait for clk_period;
  
  SW<=x"55";
  BTNC <='1';
  BTNU <='0';
  BTNL <='0';
  BTNR <='0';
  BTND <='0';
  wait for clk_period*1;
  BTNC <='0';
  wait for clk_period;
 
  
  wait for clk_period*50;
 
  end_test <= '0';
 
    wait;
  end process;

-- test om led ud og switsch kommer de rigtige steder hen
end;
  