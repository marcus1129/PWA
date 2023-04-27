library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Ram256X16_tb is
end;

architecture bench of Ram256X16_tb is

  component Ram256X16
          Port (  clk, Reset : in STD_LOGIC;
                  Data_in : in STD_LOGIC_VECTOR (15 downto 0); 
                  Address_in : in STD_LOGIC_VECTOR (9 downto 0); 
                  MW : in STD_LOGIC_vector(1 downto 0);
                  Data_out : out STD_LOGIC_VECTOR (15 downto 0)); 
  end component;

  signal clk, Reset: STD_LOGIC;
  signal Data_in: STD_LOGIC_VECTOR (15 downto 0);
  signal Address_in: STD_LOGIC_VECTOR (9 downto 0);
  signal MW: STD_LOGIC_vector(1 downto 0);
  signal Data_out: STD_LOGIC_VECTOR (15 downto 0);
  
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean := false;

begin

    clocking: process
    begin
        while not stop_the_clock loop
            clk <= '0', '1' after clock_period / 2;
            wait for clock_period;
        end loop;
        wait;
    end process;  

  uut: Ram256X16 port map ( clk        => clk,
                            Reset      => Reset,
                            Data_in    => Data_in,
                            Address_in => Address_in,
                            MW         => MW,
                            Data_out   => Data_out );

  stimulus: process
  begin
    Reset <= '0';
    Data_in <= x"00ff";
    Address_in <= "00" & x"00";
    MW <= "11";
    wait for clock_period;
    
    MW <= "00";
    wait for clock_period;
    Data_in <= x"5555";
    Address_in <= "00" & x"08";
    
    wait for clock_period;
    MW <= "11";
    
    wait for clock_period;
    
    

  

  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;
  