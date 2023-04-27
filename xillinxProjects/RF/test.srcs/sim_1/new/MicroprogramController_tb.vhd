-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MicroprogramController_tb is
end;

architecture bench of MicroprogramController_tb is

  component MicroprogramController 
      port (  RESET, CLK: in std_logic;
              Address_In: in std_logic_vector (7 downto 0);
              Address_Out: out std_logic_vector (7 downto 0);
              Instruction_In: in std_logic_vector (15 downto 0);
              Constant_Out: out std_logic_vector (7 downto 0);
              V,C,N,Z: in std_logic;
              DX,AX,BX,FS: out std_logic_vector (3 downto 0);
              MB,MD,RW,MM,MW: out std_logic
              );
  end component;

  signal RESET, CLK: std_logic;
  signal Address_In: std_logic_vector (7 downto 0);
  signal Address_Out: std_logic_vector (7 downto 0);
  signal Instruction_In: std_logic_vector (15 downto 0);
  signal Constant_Out: std_logic_vector (7 downto 0);
  signal V,C,N,Z: std_logic;
  signal DX,AX,BX,FS: std_logic_vector (3 downto 0);
  signal MB,MD,RW,MM,MW: std_logic ;
  constant clk_period: time:= 10ns;
  signal end_test: std_logic:= '1';

begin

  uut: MicroprogramController port map ( RESET          => RESET,
                                         CLK            => CLK,
                                         Address_In     => Address_In,
                                         Address_Out    => Address_Out,
                                         Instruction_In => Instruction_In,
                                         Constant_Out   => Constant_Out,
                                         V              => V,
                                         C              => C,
                                         N              => N,
                                         Z              => Z,
                                         DX             => DX,
                                         AX             => AX,
                                         BX             => BX,
                                         FS             => FS,
                                         MB             => MB,
                                         MD             => MD,
                                         RW             => RW,
                                         MM             => MM,
                                         MW             => MW );


  clock: process
    begin
    while end_test='1' loop
    CLK <='0';
    wait for clk_period*0.5;
    CLK <= '1';
    wait for clk_period*0.5;
    end loop;
    wait;
  end process;
  
  stimulus: process
  begin
  wait for clk_period;
  RESET <= '1';
  wait for clk_period;
  RESET <= '0';
  wait for clk_period;
  Instruction_In <= x"0000";
  wait for clk_period;
  Instruction_In <= "0000001000000000";
  wait for clk_period;
  Instruction_In <= x"0401";
  wait for 2*clk_period;
  Instruction_In <= x"0702";
  wait for 2*clk_period;
  Instruction_In <= x"0803";
  wait for 2*clk_period;
  Instruction_In <= x"0B04";
  wait for 2*clk_period;
  Instruction_In <= x"0C05";
  wait for 3*clk_period;
  Instruction_In <= x"0E06";
  wait for 3*clk_period;
  Z <= '1';
  Instruction_In <= x"C034";
  wait for 4*clk_period;
  Instruction_In <= x"C2F1";
  wait for 2*clk_period;
  Z <= '0';
  N <= '1';
  Instruction_In <= x"C3F1";
  wait for 2*clk_period;
  N <= '0';
  wait for 2*clk_period;
  Instruction_In <= x"2207";
  wait for 4*clk_period;
  Z <= '0';
  Instruction_In <= x"1A00";
  wait for 6*clk_period;
  Z <= '1';
  wait for 6*clk_period;
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;