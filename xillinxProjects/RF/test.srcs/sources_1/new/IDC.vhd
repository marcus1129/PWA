----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 11:51:06 AM
-- Design Name: 
-- Module Name: IDC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IDC is
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
end IDC;

architecture Behavioral of IDC is

type StateType is (INF, EX0, EX1, EX2, EX3, EX4);
type MnemonicsType is (NA, MOVA, INC, ADD, SUB, DEC, M_OR, M_AND, M_XOR, M_NOT, MOVB, LD, ST, LDI, ADI, BRZ, BRN, JMP, LRI, SRM, SLM); 
signal Mnemonic : MnemonicsType;
signal State, NextState: StateType;
signal Opcode: STD_LOGIC_VECTOR(6 downto 0);





begin
Opcode <= IR(15 downto 9);

ControlState : process(Reset, CLK)
begin
    if Reset = '1' then State <= INF;
    elsif CLK'event and CLK = '1' then
        State <= NextState;
    end if;
end process;

ControlLogic : process(State, Opcode, IR, N, Z)
begin
    
    NextState <= INF;
    IL <= '0';
    PS <= "00";
    DX <= "0000";
    AX <= "0000";
    BX <= "0000";
    MB <= '0';
    FS <= "0000";
    MD <= '0';
    RW <= '0';
    MM <= '0';
    MW <= '0';
    Mnemonic <= NA;
            
    case State is
        
        when INF =>
            NextState <= EX0;
            IL <= '1';
            PS <= "00";
            DX <= '-' & IR(8 downto 6);
            AX <= '-' & IR(5 downto 3);
            BX <= '-' & IR(2 downto 0);
            MB <= '-';
            FS <= "----";
            MD <= '-';
            RW <= '0';
            MM <= '1';
            MW <= '0';
            Mnemonic <= NA;

        
        
        when EX0 =>
            --Første kasse i tabellen
            if Opcode = "0000000" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= MOVA;
            
            elsif Opcode = "0000001" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0001";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= INC;
            
            elsif Opcode = "0000010" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "0010";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= ADD;
                
            elsif Opcode = "0000101" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "0101";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SUB;
                
            elsif Opcode = "0000110" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= DEC;
                
            elsif Opcode = "0001000" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "1000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= M_OR;
                
            elsif Opcode = "0001001" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "1001";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= M_AND;
                
            elsif Opcode = "0001010" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "1010";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= M_XOR;
                
            elsif Opcode = "0001011" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "1011";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= M_NOT;
            
            elsif Opcode = "0001100" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '-' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= MOVB;
                
            elsif Opcode = "0010000" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "----";
                MD <= '1';
                RW <= '1';
                MM <= '0';
                MW <= '0';
                Mnemonic <= LD;
                
            elsif Opcode = "0100000" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '0' & IR(2 downto 0);
                MB <= '0';
                FS <= "----";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '1';
                Mnemonic <= ST;
                
            elsif Opcode = "1001100" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '-' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '0';
                MW <= '0';
                Mnemonic <= LDI;
                
            elsif Opcode = "1000010" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "0010";
                MD <= '0';
                RW <= '1';
                MM <= '0';
                MW <= '0';
                Mnemonic <= ADI;
                
            elsif Opcode = "1100000" and Z = '1' then
                NextState <= INF;
                IL <= '0';
                PS <= "10";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                Mnemonic <= BRZ;
                
            elsif Opcode = "1100000" and Z = '0' then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                Mnemonic <= BRZ;
                
            elsif Opcode = "1100001" and N = '1' then
                NextState <= INF;
                IL <= '0';
                PS <= "10";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                Mnemonic <= BRN;
                
            elsif Opcode = "1100001" and N = '0' then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                Mnemonic <= BRN;
                
            elsif Opcode = "1110000" then
                NextState <= INF;
                IL <= '0';
                PS <= "11";
                DX <= '-' & IR(8 downto 6);
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '-';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                Mnemonic <= JMP;
                
            --Anden kasse
            elsif Opcode = "0010001" then
                NextState <= EX1;
                IL <= '0';
                PS <= "00";
                DX <= "1000";
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '1';
                RW <= '1';
                MM <= '0';
                MW <= '0';
                Mnemonic <= LRI;
                
            --Tredje kasse
            elsif Opcode = "0001101" and Z = '0' then
                NextState <= EX1;
                IL <= '0';
                PS <= "00";
                DX <= "1000";
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';   
                Mnemonic <= SRM;
                
             elsif Opcode = "0001101" and Z = '1' then
                NextState <= INF;
                 IL <= '0';
                 PS <= "01";
                 DX <= "1000";
                 AX <= '0' & IR(5 downto 3);
                 BX <= '-' & IR(2 downto 0);
                 MB <= '-';
                 FS <= "0000";
                 MD <= '0';
                 RW <= '1';
                 MM <= '-';
                 MW <= '0';
                 Mnemonic <= SRM;
                 
             --Fjerde kasse
            elsif Opcode = "0001110" and Z = '0' then
                NextState <= EX1;
                IL <= '0';
                PS <= "00";
                DX <= "1000";
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            elsif Opcode = "0001110" and Z = '1' then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= "1000";
                AX <= '0' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
            
            end if;
        
        
        when EX1 =>
            --Anden kasse
            if Opcode = "0010001" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= "1000";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '1';
                RW <= '1';
                MM <= '0';
                MW <= '0';
                Mnemonic <= LRI;
            
            --Tredje kasse
            elsif Opcode = "0001101" and Z = '0' then
                NextState <= EX2;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= '-' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
                
            elsif Opcode = "0001101" and Z = '1' then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= "1001";
                AX <= '-' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
                
            --Fjerde kasse
            elsif Opcode = "0001110" and Z = '0' then
                NextState <= EX2;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= '-' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
            
            elsif Opcode = "0001110" and Z = '1' then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= "1001";
                AX <= '-' & IR(5 downto 3);
                BX <= '-' & IR(2 downto 0);
                MB <= '1';
                FS <= "1100";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            end if;
            
            
        when EX2 =>
            --Tredje kasse
            if Opcode = "0001101" then
                NextState <= EX3;
                IL <= '0';
                PS <= "00";
                DX <= "1000";
                AX <= '-' & IR(5 downto 3);
                BX <= "1000";
                MB <= '0';
                FS <= "1101";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
                
            --Fjerde kasse
            elsif Opcode = "0001110" then
                NextState <= EX3;
                IL <= '0';
                PS <= "00";
                DX <= "1000";
                AX <= '-' & IR(5 downto 3);
                BX <= "1000";
                MB <= '0';
                FS <= "1110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            end if;
        
        
        when EX3 =>
            --Tredje kasse
            if Opcode = "0001101" and Z = '0' then
                NextState <= EX2;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= "1001";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
                
            elsif Opcode = "0001101" and Z = '1' then
                NextState <= EX4;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= "1001";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
                
            --Fjerde kasse    
            elsif Opcode = "0001110" and Z = '0' then
                NextState <= EX2;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= "1001";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            elsif Opcode = "0001110" and Z = '1' then
                NextState <= EX4;
                IL <= '0';
                PS <= "00";
                DX <= "1001";
                AX <= "1001";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0110";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            end if;
        
        when EX4 => 
            --Tredje kasse
            if Opcode = "0001101" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= "1000";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SRM;
            
            --Fjerde kasse
            elsif Opcode = "0001110" then
                NextState <= INF;
                IL <= '0';
                PS <= "01";
                DX <= '0' & IR(8 downto 6);
                AX <= "1000";
                BX <= '-' & IR(2 downto 0);
                MB <= '-';
                FS <= "0000";
                MD <= '0';
                RW <= '1';
                MM <= '-';
                MW <= '0';
                Mnemonic <= SLM;
                
            end if;

    end case;
end process;

end Behavioral;        