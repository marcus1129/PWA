library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ProgramCounter_tb is
end;

architecture bench of ProgramCounter_tb is

  component ProgramCounter 
      Port (  RESET: in std_logic;
              CLK: in std_logic;
              Address_In: in std_logic_vector(7 downto 0); 
              PS: in std_logic_vector(1 downto 0); 
              Offset: in std_logic_vector(7 downto 0); 
              PC: out std_logic_vector (7 downto 0));
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal Address_In: std_logic_vector(7 downto 0);
  signal PS: std_logic_vector(1 downto 0);
  signal Offset: std_logic_vector(7 downto 0);
  signal PC: std_logic_vector (7 downto 0);
  signal clk_period: time:= 10 ns;
  signal end_test: std_logic:= '0';
  signal PC_exp: std_logic_vector (7 downto 0);

begin
    
  uut: ProgramCounter port map ( RESET      => RESET,
                                 CLK        => CLK,
                                 Address_In => Address_In,
                                 PS         => PS,
                                 Offset     => Offset,
                                 PC         => PC );
    
    clock: process
     begin
         while end_test = '0' loop
             CLK <= '0';
             wait for clk_period * 0.5;
             CLK <= '1';
             wait for clk_period*0.5;
         end loop;
         wait;
     end process;
   
     stimulus: process
     begin
        
        -- Initial value
        Address_In <= x"00";
        PS <= "00";
        Offset <= x"00";
        RESET <= '1';
        PC_exp <= x"00";
        wait for clk_period;
        PC_exp <= x"00";
        
        RESET <= '0';
        wait for clk_period;
        PC_exp <= x"00";
        
        -- Jump
        PS <= "11";
        Address_In <= x"0f";
        wait for 0.5*clk_period;
        PC_exp <= x"0f";
        wait for 0.5*clk_period;
        
        --Branch
        PS <= "10";
        Offset <= x"05";
        wait for 0.5*clk_period;
        PC_exp <= x"14";
        wait for 0.5*clk_period;
        
        --Hold PC
        PS <= "00";
        wait for 0.5*clk_period;
        PC_exp <= x"14";
        wait for 0.5*clk_period;
        
        --Increment PC
        PS <= "01";
        wait for 0.5*clk_period;
        PC_exp <= x"15";
        wait for 0.5*clk_period;
        
        wait for 0.5*clk_period;
        PC_exp <= x"16";
        wait for 0.5*clk_period;
        
        wait for 0.5*clk_period;       
        PC_exp <= x"17";
        wait for 0.5*clk_period;
        
        -- Asynkront reset
        wait for 0.3*clk_period;
        RESET <= '1';
        PC_exp <= x"00";
        
        wait;
        
        end_test <= '1';
 
   end process;

end;











