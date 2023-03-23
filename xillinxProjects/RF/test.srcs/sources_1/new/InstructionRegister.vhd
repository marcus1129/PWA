library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity InstructionRegister is 
    port (  RESET: in std_logic;
            CLK: in std_logic;
            Instruction_In: in std_logic_vector (15 downto 0); 
            IL: in std_logic;
            IR: out std_logic_vector (15 downto 0) );
End InstructionRegister;

Architecture IR_Behavorial of InstructionRegister is 


Begin

Process_CLK: process(CLK, RESET)
begin
   if RESET = '1' then 
    IR <= "0000000000000000";
   elsif (rising_edge(clk) and IL = '1')  then              
    IR <= Instruction_In;
   end if;

End process;



End IR_Behavorial;


