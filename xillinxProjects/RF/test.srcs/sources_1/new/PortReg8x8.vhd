library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PortReg8x8 is
    Port (  clk, reset, MW : in STD_LOGIC;
            Data_In, Address_in, SW : STD_LOGIC_VECTOR ( 7 downto 0);
            BTNC, BTNU, BTNL, BTNR, BTND : in STD_LOGIC;
            MMR : out STD_LOGIC;
            D_word, Data_outR : out STD_LOGIC_VECTOR ( 15 downto 0);
            LED : out STD_LOGIC_VECTOR ( 7 downto 0));
end PortReg8x8;

architecture IDC_Behavorial of PortReg8x8 is

component RegisterCell is
    Port (Enable : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(7 downto 0);
          DataOut : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal MR0, MR1, MR2, MR3, MR4, MR5, MR6, MR7 : std_logic_vector (7 downto 0);

begin

    P1 : process(CLK, RESET, BTNC, BTNU, BTNL, BTNR, BTND)
    begin
        if RESET = '1' then
            MMR <= '0';
            MR0 <= x"00";
            MR1 <= x"00";
            MR2 <= x"00";
            MR3 <= x"00";
            MR4 <= x"00";
            MR5 <= x"00";
            MR6 <= x"00";
            MR7 <= x"00";
        elsif BTNC = '1' then
            MR3 <= SW;
        elsif BTNU = '1' then
            MR4 <= SW;
        elsif BTNL = '1' then
            MR5 <= SW;
        elsif BTNR = '1' then
            MR6 <= SW;
        elsif BTND = '1' then
            MR7 <= SW;
        elsif rising_edge( CLK ) then
            if MW = '1' then
                if Address_in(1 downto 0) = "00" then
                    MR0 <= Data_In;
                elsif Address_in(1 downto 0) = "01" then
                    MR1 <= Data_In;
                elsif Address_in(1 downto 0) = "10" then
                    MR2 <= Data_In;
                end if;
            else
                if Address_in = "11111000" then
                    Data_outR <= x"00" & MR0;
                    MMR <= '1';
                elsif Address_in = "11111001" then
                    Data_outR <= x"00" & MR1;
                    MMR <= '1';
                elsif Address_in = "11111010" then
                    Data_outR <= x"00" & MR2;
                    MMR <= '1';
                elsif Address_in = "11111011" then
                    Data_outR <= x"00" & MR3;
                    MMR <= '1';
                elsif Address_in = "11111100" then
                    Data_outR <= x"00" & MR4;
                    MMR <= '1';
                elsif Address_in = "11111101" then
                    Data_outR <= x"00" & MR5;
                    MMR <= '1';
                elsif Address_in = "11111110" then
                    Data_outR <= x"00" & MR6;
                    MMR <= '1';
                elsif Address_in = "11111111" then
                    Data_outR <= x"00" & MR7;
                    MMR <= '1';
                else
                    MMR <= '0';
                end if;
            end if;
        end if;
    end process P1;
    
    P2 : process(MR0, MR1, MR2)
    begin
        D_word <= MR0 & MR1;
        LED <= MR2; 
    end process P2;
    
    
end;