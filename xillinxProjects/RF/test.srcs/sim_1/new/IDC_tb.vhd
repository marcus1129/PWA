-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity IDC_tb is
end;

architecture bench of IDC_tb is

  component IDC
      Port ( Reset, CLK : in STD_LOGIC;
             IR : in STD_LOGIC_VECTOR (15 downto 0);
             V, C, N, Z : in STD_LOGIC;
             IL : out STD_LOGIC;
             PS : out STD_LOGIC_VECTOR (1 downto 0);
             DX, AX, BX : out STD_LOGIC_VECTOR (3 downto 0);
             MB : out STD_LOGIC;
             FS : out STD_LOGIC_VECTOR (3 downto 0);
             MD : out STD_LOGIC;
             RW : out STD_LOGIC;
             MM : out STD_LOGIC;
             MW : out STD_LOGIC);
  end component;

  signal Reset, CLK: STD_LOGIC;
  signal IR: STD_LOGIC_VECTOR (15 downto 0);
  signal V, C, N, Z: STD_LOGIC;
  signal IL: STD_LOGIC;
  signal PS: STD_LOGIC_VECTOR (1 downto 0);
  signal DX, AX, BX: STD_LOGIC_VECTOR (3 downto 0);
  signal MB: STD_LOGIC;
  signal FS: STD_LOGIC_VECTOR (3 downto 0);
  signal MD: STD_LOGIC;
  signal RW: STD_LOGIC;
  signal MM: STD_LOGIC;
  signal MW: STD_LOGIC;

  constant clk_period: time := 10 ns;
  signal end_test: std_logic:= '1';

begin

  uut: IDC port map ( Reset => Reset,
                      CLK   => CLK,
                      IR    => IR,
                      V     => V,
                      C     => C,
                      N     => N,
                      Z     => Z,
                      IL    => IL,
                      PS    => PS,
                      DX    => DX,
                      AX    => AX,
                      BX    => BX,
                      MB    => MB,
                      FS    => FS,
                      MD    => MD,
                      RW    => RW,
                      MM    => MM,
                      MW    => MW );

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
  
    -- Put initialisation code here

    Reset <= '1';
    wait for clk_period;
    Reset <= '0';
    wait for 5 ns;

    -- MOVA
    IR <= "0000000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- INC
    IR <= "0000001" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- ADD
    IR <= "0000010" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- SUB
    IR <= "0000101" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- DEC
    IR <= "0000110" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- OR
    IR <= "0001000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- AND
    IR <= "0001001" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- XOR
    IR <= "0001010" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- NOT
    IR <= "0001011" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- MOVB
    IR <= "0001100" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- LD
    IR <= "0010000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- ST
    IR <= "0100000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- LDI
    IR <= "1001100" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- ADI
    IR <= "1000010" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    -- BRZ, Z<='1'
    IR <= "1100000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '1';
    wait for 2*clk_period; 
    
    -- BRZ, Z<='0'
    IR <= "1100000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '0';
    wait for 2*clk_period; 
    
    -- BRN, N<='1'
    IR <= "1100001" & "---------";
    V <= '-'; C <= '-'; N <= '1'; Z <= '-';
    wait for 2*clk_period; 
    
    -- BRN, N<='0'
    IR <= "1100001" & "---------";
    V <= '-'; C <= '-'; N <= '0'; Z <= '-';
    wait for 2*clk_period; 
    
    -- JMP
    IR <= "1110000" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 2*clk_period; 
    
    
    ----------------Multistage cycles--------------------
    
    -- LRI
    IR <= "0010001" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '-';
    wait for 3*clk_period; 
    
    -- SRM
    IR <= "0001101" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '1';
    wait for 2*clk_period;
    Z <= '0';
    wait for clk_period;
    Z <= '1';
    wait for clk_period;
    Z <= '0';
    wait for 5*clk_period;
    Z <= '1';
    wait for 3*clk_period;
    
    -- SLM
    IR <= "0001110" & "---------";
    V <= '-'; C <= '-'; N <= '-'; Z <= '1';
    wait for 2*clk_period;
    Z <= '0';
    wait for 2*clk_period;
    Z <= '1';
    wait for clk_period;
    Z <= '0';
    wait for 5*clk_period;
    Z <= '1';
    wait for 3*clk_period;

    end_test <= '0';
    wait;
  end process;

end;