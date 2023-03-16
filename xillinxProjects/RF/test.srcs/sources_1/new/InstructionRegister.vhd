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

signal IR_reg: std_logic_vector (15 downto 0);

Begin

process is
begin
   if RESET = '1' then 
    IR_reg <= "0";
   elsif (CLK'event and CLK ='1') then
     if IL = '1' then                
       IR_reg <= Instruction_In;
       else
       IR_reg <= IR_reg;
	End if;
	else IR_reg <= IR_reg;
   End if;
   
   IR <= IR_reg;
End process;



End;


