----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 12:56:42 PM
-- Design Name: 
-- Module Name: Sim_Prog_ROM - Behavioral
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

entity Sim_Prog_ROM is
--  Port ( );
end Sim_Prog_ROM;

architecture Behavioral of Sim_Prog_ROM is

    -- Component declaration for the Prog_ROM module
    component Prog_ROM is
        Port (
            Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
            Instruction : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;

    -- Test bench signals
    signal Mem_Select  : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Instruction : STD_LOGIC_VECTOR (11 downto 0);

begin

    -- Instantiate the Prog_ROM module
    uut: Prog_ROM
        port map (
            Mem_Select  => Mem_Select,
            Instruction => Instruction
        );

    -- Stimulus process
    process
    begin
        Mem_Select <= "000";
        wait for 10 ns;
        Mem_Select <= "001";
        wait for 10 ns;
        Mem_Select <= "010";
        wait for 10 ns;
        Mem_Select <= "011";
        wait for 10 ns;
        Mem_Select <= "100";
        wait for 10 ns;
        Mem_Select <= "101";
        wait for 10 ns;
        Mem_Select <= "110";
        wait for 10 ns;
        Mem_Select <= "111";
        wait;
    end process;

    -- Output checking process
    

end Behavioral;





