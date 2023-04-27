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
  signal PC,PC_exp: std_logic_vector (7 downto 0);
  
  signal Action: std_logic_vector (71 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: ProgramCounter port map ( RESET      => RESET,
                                 CLK        => CLK,
                                 Address_In => Address_In,
                                 PS         => PS,
                                 Offset     => Offset,
                                 PC         => PC );

  stimulus: process
  begin
  
    -- Put initialisation code here
    -- Hold
    Action <= x"2020202020486F6C64";
    PS <= "00";
    Address_In <= x"32";
    Offset <= x"64";
    PC_exp <= x"00"; 

    RESET <= '1';
    wait for 5 ns;
    RESET <= '0';
    wait for 5 ns;
    
    -- Increment
    Action <= x"696E6372656D656E74";
    PS <= "01";
    wait for 5 ns;
    PC_exp <= x"01";
    wait for 5 ns;
    
    -- Jump
    PS <= "11";
    Action <= x"20202020206A756D70";
    wait for 5 ns;
    PC_exp <= x"32";
    wait for 5 ns;
    
    -- Hold
    Action <= x"2020202020486F6C64";
    PS <= "00";
    wait for 10 ns;
    
    -- Increment
    Action <= x"696E6372656D656E74";
    PS <= "01";
    wait for 5 ns;
    PC_exp <= x"33";
    wait for 5 ns;
    
    -- Branch
    Action <= x"2020206272616E6368";
    PS <= "10";
    wait for 5 ns;
    PC_exp <= x"97";
    wait for 5 ns;
    
    -- Idle
    Action <= x"202020202069646C65";
    PS <= "--";
    wait for 10 ns;
    
    -- Branch
    Action <= x"2020206272616E6368";
    Offset <= "11101100";
    PS <= "10";
    wait for 5 ns;
    PC_exp <= x"83";
    wait for 5 ns;
    
    RESET <= '1';
    PC_exp <= x"00";

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