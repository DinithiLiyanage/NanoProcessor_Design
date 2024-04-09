----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:49:43 AM
-- Design Name: 
-- Module Name: Sim_Prog_Count - Behavioral
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

entity Sim_Prog_Count is
--  Port ( );
end Sim_Prog_Count;

architecture Behavioral of Sim_Prog_Count is

    -- Component declaration for the Prog_Count module
    component Prog_Count is
        Port (
            Clk        : in STD_LOGIC;
            Reset      : in STD_LOGIC;
            MUX_Data   : in STD_LOGIC_VECTOR (2 downto 0);
            Mem_Select : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Test bench signals
    signal Clk        : STD_LOGIC := '0';
    signal Reset      : STD_LOGIC := '0';
    signal MUX_Data   : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Mem_Select : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the Prog_Count module
    uut: Prog_Count
        port map (
            Clk        => Clk,
            Reset      => Reset,
            MUX_Data   => MUX_Data,
            Mem_Select => Mem_Select
        );

    -- Clock process
    process
    begin
        while now < 100 ns loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        Reset <= '1';
        wait for 10 ns;
        Reset <= '0';
        wait for 20 ns;
        MUX_Data <= "001";
        wait for 10 ns;
        MUX_Data <= "010";
        wait for 10 ns;
        MUX_Data <= "100";
        wait for 20 ns;
        MUX_Data <= "000";
        wait;
    end process;

end Behavioral;

