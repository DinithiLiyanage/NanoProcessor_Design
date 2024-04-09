----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 04:17:54 PM
-- Design Name: 
-- Module Name: Sim_Inst_Decoder - Behavioral
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

entity Sim_Inst_Decoder is
--  Port ( );
end Sim_Inst_Decoder;

architecture Behavioral of Sim_Inst_Decoder is

    -- Component declaration for the DUT (Design Under Test)
    component Inst_Decoder is
        Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
               Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
               Add_Sub_Select : out STD_LOGIC;
               Reg_Select_0 : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_Select_1 : out STD_LOGIC_VECTOR (2 downto 0);
               Imm_Value : out STD_LOGIC_VECTOR (3 downto 0);
               Load_Select : out STD_LOGIC;
               Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
               Jump_Flag : out STD_LOGIC;
               Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    -- Signal declarations
    signal clk : STD_LOGIC := '0';
    signal Instruction_tb : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal Reg_Jump_Check_tb : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Add_Sub_Select_tb : STD_LOGIC;
    signal Reg_Select_0_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Select_1_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Imm_Value_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Load_Select_tb : STD_LOGIC;
    signal Reg_EN_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Jump_Flag_tb : STD_LOGIC;
    signal Jump_Address_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the DUT
    uut: Inst_Decoder
        port map (Instruction => Instruction_tb,
                  Reg_Jump_Check => Reg_Jump_Check_tb,
                  Add_Sub_Select => Add_Sub_Select_tb,
                  Reg_Select_0 => Reg_Select_0_tb,
                  Reg_Select_1 => Reg_Select_1_tb,
                  Imm_Value => Imm_Value_tb,
                  Load_Select => Load_Select_tb,
                  Reg_EN => Reg_EN_tb,
                  Jump_Flag => Jump_Flag_tb,
                  Jump_Address => Jump_Address_tb);

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1
        Instruction_tb <= "010000001100";
        Reg_Jump_Check_tb <= "0001";
        wait for 10 ns;
        -- Check the outputs here

        -- Test case 2
        Instruction_tb <= "001100110000";
        Reg_Jump_Check_tb <= "0000";
        wait for 10 ns;
        -- Check the outputs here
        Instruction_tb <= "001110010000";
        Reg_Jump_Check_tb <= "0000";
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process;

end Behavioral;








