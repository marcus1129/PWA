library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity InstructionRegister_tb is
end;

architecture bench of InstructionRegister_tb is

  component InstructionRegister 
      port (  RESET: in std_logic;
              CLK: in std_logic;
              Instruction_In: in std_logic_vector (15 downto 0); 
              IL: in std_logic;
              IR: out std_logic_vector (15 downto 0) );
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal Instruction_In: std_logic_vector (15 downto 0);
  signal IL: std_logic;
  signal IR: std_logic_vector (15 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: InstructionRegister port map ( RESET          => RESET,
                                      CLK            => CLK,
                                      Instruction_In => Instruction_In,
                                      IL             => IL,
                                      IR             => IR );

  stimulus: process
  begin
  
    -- Put initialisation code here

    RESET <= '1';
    wait for 5 ns;
    RESET <= '0';
    wait for 5 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  