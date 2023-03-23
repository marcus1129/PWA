library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity ProgramCounter is 
    Port (  RESET: in std_logic;
            CLK: in std_logic;
            Address_In: in std_logic_vector(7 downto 0); 
            PS: in std_logic_vector(1 downto 0); 
            Offset: in std_logic_vector(7 downto 0); 
            PC: out std_logic_vector (7 downto 0));
end ProgramCounter;

architecture PC_Behavioral of ProgramCounter is

begin
    
    Process_CLK : process( CLK, RESET )
    variable PC_reg: std_logic_vector(7 downto 0);
    begin
        if RESET = '1' then
            PC_reg := x"00";
        elsif rising_edge( CLK ) then
            if PS = "00" then
                PC_reg := PC_reg;
            elsif PS = "01" then
                PC_reg := PC_reg + 1;
            elsif PS = "10" then
                PC_reg := PC_reg + Offset;
            elsif PS = "11" then
                PC_reg := Address_In;
            end if;
        end if;
        PC <= PC_reg;
    end process Process_CLK;

    
end PC_Behavioral;
