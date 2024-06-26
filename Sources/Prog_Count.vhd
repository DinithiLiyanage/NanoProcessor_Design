----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:38:57 AM
-- Design Name: 
-- Module Name: Prog_Count - Behavioral
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

entity Prog_Count is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           MUX_Data : in STD_LOGIC_VECTOR (2 downto 0);
           Mem_Select : out STD_LOGIC_VECTOR (2 downto 0));
end Prog_Count;

architecture Behavioral of Prog_Count is


begin
process (Clk) begin
    if (rising_edge(Clk)) then
        if Reset = '1' then
            Mem_Select <= "000";
        else
            Mem_Select <= MUX_Data;
        end if;
    end if;
end process;

end Behavioral;
