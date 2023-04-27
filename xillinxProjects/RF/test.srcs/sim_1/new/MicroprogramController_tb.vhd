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

  signal RESET: std_logic;
  signal Address_In: std_logic_vector (7 downto 0);
  signal Address_Out,Address_Out_exp: std_logic_vector (7 downto 0);
  signal Instruction_In: std_logic_vector (15 downto 0);
  signal Constant_Out,Constant_Out_exp: std_logic_vector (7 downto 0);
  signal V,C,N,Z: std_logic;
  signal DX,AX,BX,FS: std_logic_vector (3 downto 0);
  signal MB,MD,RW,MM,MW: std_logic ;
  
  signal DX_exp,AX_exp,BX_exp,FS_exp: std_logic_vector (3 downto 0);
  signal MB_exp,MD_exp,RW_exp,MM_exp,MW_exp: std_logic ;
  
  signal clk : std_logic := '0';
  
  signal ControlWord, ControlWord_exp, ControlWord_test: std_logic_vector (20 downto 0);
  signal Mnemonic: std_logic_vector (31 downto 0);

begin

    clk_process :process
    begin
        clk <= '0';
        wait for 5 ns; 
        clk <= '1';
        wait for 5 ns;
    end process;

    wording: process ( clk'event )
    begin
        ControlWord <= DX & AX & BX & MB & FS & MD & RW & MM & MW;
        ControlWord_exp <= DX_exp & AX_exp & BX_exp & MB_exp & FS_exp & MD_exp & RW_exp & MM_exp & MW_exp;
        
        --for i in 20 downto 0 loop
         --   if (ControlWord(i) = '1' or ControlWord(i) = '0') and (ControlWord_exp(i) = '1' or ControlWord_exp(i) = '0') then
         --       ControlWord_test(i) <= ControlWord(i) xor ControlWord_exp(i);
          --  else
          --      ControlWord_test(i) <= '0';
          --  end if;
        --end loop;
        
    end process;
    


    
    
    uut: MicroprogramController port map (  RESET          => RESET,
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

    stimulus: process
    
    variable Opcode: std_logic_vector(6 downto 0) := "0000000";
    variable DR, SA, SB: std_logic_vector(2 downto 0) := "000";
    
    begin
    
        -- Initialisation code here
            -- Inputs
            Mnemonic <= x"20202020";
            RESET <= '1';
            Address_In <= x"00";
            Opcode := "0000000";
            DR := "000";
            SA := "000";
            SB := "000";
            Instruction_In <= Opcode & DR & SA & SB;
            V <= '0';
            C <= '0';
            N <= '0';
            Z <= '0';
            wait for 1 ns;
            RESET <= '0';
            wait for 4 ns;
            
            -- Outputs
            Address_Out_exp <= x"00";
            Constant_Out_exp <= x"00";
            DX_exp <= x"0";
            AX_exp <= x"0";
            BX_exp <= x"0";
            FS_exp <= x"0";
            MB_exp <= '0';
            MD_exp <= '0';
            RW_exp <= '0';
            MM_exp <= '0';
            MW_exp <= '0';
            
            wait for 5 ns;

        
        --Stimulus code here
            -- MOVA
                Mnemonic <= x"4D4F5641";
                -- Inputs
                Opcode := "0000000";
                DR := "111";
                SA := "110";
                SB := "101";
                Instruction_In <= Opcode & DR & SA & SB;
                wait for 5 ns;

                
                -- Outputs
                DX_exp <= "0111";
                AX_exp <= "0110";
                BX_exp <= "-101";
                FS_exp <= "0000";
                MD_exp <= '-';
                RW_exp <= '0';
                MM_exp <= '-';
                MW_exp <= '0';

                wait for 5 ns;
                
                wait;
               

    

    end process;


end;