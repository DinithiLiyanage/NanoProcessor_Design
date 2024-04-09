----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 12:07:26 PM
-- Design Name: 
-- Module Name: Prog_ROM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Prog_ROM is
    Port ( Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Prog_ROM;

architecture Behavioral of Prog_ROM is
type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);
    signal Prog_ROM : rom_type := (
        --"100010000001",  -- MOVI R1, 1     --ROM0
        --"100100000010",  -- MOVI R2, 2     --ROM1
        --"100110000011",  -- MOVI R3, 3     --ROM2
        --"101110000000",  -- MOVI R7, 0     --ROM3
        --"001110010000",  -- ADD R7, R1     --ROM4
        --"001110100000",  -- ADD R7, R2     --ROM5
        --"001110110000",  -- ADD R7, R3     --ROM6
        --"000000000000" --ROM7
        "100100000011",  -- MOV R2, 3      --ROM0
        "100010000001",  -- MOV R1, 1      --ROM1
        "001110100000",  -- ADD R7, R2     --ROM2
        "010010000000",  -- NEG R1== ADD R0, R1     --ROM3
        "000100010000",  -- ADD R2, R1     --ROM4
        "110100000111",   --JZR R2, 7      --ROM5 
        "110000000001",   --JZR R0, 1      --ROM6
        "101110000000"  -- MOVI R7, 0      --ROM7
    );
begin
    Instruction <= Prog_ROM(to_integer(unsigned(Mem_Select)));

end Behavioral;
