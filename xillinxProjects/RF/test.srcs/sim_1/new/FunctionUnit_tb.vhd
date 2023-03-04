library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FunctionUnit_tb is
end;

architecture bench of FunctionUnit_tb is

  component FunctionUnit 
      port (  A,B: in std_logic_vector (7 downto 0); 
              FS3,FS2,FS1,FS0: in std_logic;
              V,C,N,Z: out std_logic;
              F: out std_logic_vector (7 downto 0) );
  end component;

  signal A,B: std_logic_vector (7 downto 0);
  signal FS3,FS2,FS1,FS0: std_logic;
  signal V,C,N,Z,V_exp,C_exp,N_exp,Z_exp: std_logic;
  signal F,F_exp: std_logic_vector (7 downto 0) ;

begin

  uut: FunctionUnit port map ( A   => A,
                               B   => B,
                               FS3 => FS3,
                               FS2 => FS2,
                               FS1 => FS1,
                               FS0 => FS0,
                               V   => V,
                               C   => C,
                               N   => N,
                               Z   => Z,
                               F   => F );
                               
   V_exp <= C_exp xor F_exp(7);
   Z_exp <= not (F_exp(7) or F_exp(6) or F_exp(5) or F_exp(4) or F_exp(3) or F_exp(2) or F_exp(1) or F_exp(0));
   N_exp <= F_exp(7);

  stimulus: process
  begin
    
    
    -- Put initialisation code here
    A <= x"00";
    B <= x"00";
    FS0 <= '0';
    FS1 <= '0';
    FS2 <= '0';
    FS3 <= '0';
    C_exp <= '0';
    F_exp <= x"00";
    wait for 10 ns;
    
    A <= x"55";
    B <= x"AA";
    FS0 <= '0';
    FS1 <= '0';
    FS2 <= '0';
    FS3 <= '0';
    C_exp <= '0';
    F_exp <= x"55";
    wait for 10 ns;

    -- A + 1 
   A <= x"00";
   B <= x"AA";
   FS0 <= '1';
   FS1 <= '0';
   FS2 <= '0';
   FS3 <= '0';
   C_exp <= '0';
   F_exp <= x"01";
   wait for 10 ns;
   
   -- A + B
   A <= "10010001";
   B <= "01100100";
   FS0 <= '0';
   FS1 <= '1';
   FS2 <= '0';
   FS3 <= '0';
   C_exp <= '0';
   F_exp <= "11110101";
   wait for 10 ns;
   
   -- A + B + 1
   A <= "10010001";
   B <= "01100100";
   FS0 <= '1';
   FS1 <= '1';
   FS2 <= '0';
   FS3 <= '0';
   C_exp <= '0';
   F_exp <= "11110110";
   wait for 10 ns;
       
        -- A + not B
    A <= "10010001";
    B <= "01100100";
    FS0 <= '0';
    FS1 <= '0';
    FS2 <= '1';
    FS3 <= '0';
    C_exp <= '1';
    F_exp <= "00101100";
    wait for 10 ns;
    
    -- A + not B + 1
    A <= "10010001";
    B <= "01100100";
    FS0 <= '1';
    FS1 <= '0';
    FS2 <= '1';
    FS3 <= '0';
    C_exp <= '1';
    F_exp <= "00101101";
    wait for 10 ns;
    
    -- A - 1
    A <= "00001000";
    B <= x"00";
    FS0 <= '0';
    FS1 <= '1';
    FS2 <= '1';
    FS3 <= '0';
    C_exp <= '1';
    F_exp <= "00000111";
    wait for 10 ns;
    
    -- A
    A <= x"55";
    B <= x"00";
    FS0 <= '1';
    FS1 <= '1';
    FS2 <= '1';
    FS3 <= '0';
    C_exp <= '-';
    F_exp <= x"55";
    wait for 10 ns;
    
    -- A or B
    A <= x"55";
    B <= x"AA";
    FS0 <= '0';
    FS1 <= '0';
    FS2 <= '0';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"FF";
    wait for 10 ns;
    
    -- A and B
    A <= x"55";
    B <= x"AA";
    FS0 <= '1';
    FS1 <= '0';
    FS2 <= '0';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"00";
    wait for 10 ns;
    
    -- A xor B
    A <= x"55";
    B <= x"AA";
    FS0 <= '0';
    FS1 <= '1';
    FS2 <= '0';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"FF";
    wait for 10 ns;
    
    -- not A
    A <= x"55";
    B <= x"AA";
    FS0 <= '1';
    FS1 <= '1';
    FS2 <= '0';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"AA";
    wait for 10 ns;
    
    -- B
    A <= x"55";
    B <= x"AA";
    FS0 <= '0';
    FS1 <= '0';
    FS2 <= '1';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"AA";
    wait for 10 ns;
    
    -- SR B
    A <= x"00";
    B <= x"FF";
    FS0 <= '1';
    FS1 <= '0';
    FS2 <= '1';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"7F";
    wait for 10 ns;
          
    -- SL B
    A <= x"00";
    B <= x"FF";
    FS0 <= '0';
    FS1 <= '1';
    FS2 <= '1';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"FE";
    wait for 10 ns;
    
    -- B
    A <= x"00";
    B <= x"AA";
    FS0 <= '1';
    FS1 <= '1';
    FS2 <= '1';
    FS3 <= '1';
    C_exp <= '-';
    F_exp <= x"AA";
    wait for 10 ns;
   



    -- Put test bench stimulus code here

  end process;


end;