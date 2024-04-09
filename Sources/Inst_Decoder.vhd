----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 02:49:27 PM
-- Design Name: 
-- Module Name: Inst_Decoder - Behavioral
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

entity Inst_Decoder is
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
end Inst_Decoder;

architecture Behavioral of Inst_Decoder is
    
begin

Add_Sub_Select <= '1' when (Instruction(11 downto 10) = "01") else '0' when (Instruction(11 downto 10) = "00");
Reg_Select_0 <= Instruction (9 downto 7) when (Instruction (11 downto 10) = "00") else 
                Instruction (6 downto 4) when (Instruction (11 downto 10) = "01") else
                Instruction (9 downto 7) when (Instruction (11 downto 10) = "11");
Reg_Select_1 <= Instruction (6 downto 4) when (Instruction (11 downto 10) = "00") else 
                Instruction (9 downto 7) when (Instruction (11 downto 10) = "01") else
                Instruction (6 downto 4) when (Instruction (11 downto 10) = "11");
Imm_Value <= Instruction (3 downto 0);
Load_Select <= '1' when (Instruction(11 downto 10) = "10") else '0';
Reg_EN <= Instruction(9 downto 7) ;
Jump_Flag <= '1' when (Reg_Jump_Check = "0000" and Instruction(11 downto 10) = "11") else '0';
Jump_Address <= Instruction(2 downto 0) when (Reg_Jump_Check = "0000" and Instruction(11 downto 10) = "11") else "000";
    
end Behavioral;
