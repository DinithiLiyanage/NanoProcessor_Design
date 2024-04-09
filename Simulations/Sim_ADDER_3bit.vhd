----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 03:35:56 PM
-- Design Name: 
-- Module Name: Sim_ADDER_3bit - Behavioral
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

entity Sim_ADDER_3bit is
--  Port ( );
end Sim_ADDER_3bit;

architecture Behavioral of Sim_ADDER_3bit is
-- Component declaration
  component Adder_3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           --C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0)
           --C_out : out STD_LOGIC
           );
  end component;

  -- Test signals
  signal A_TB : STD_LOGIC_VECTOR (2 downto 0);
  signal B_TB : STD_LOGIC_VECTOR (2 downto 0);
  --signal C_in_TB : STD_LOGIC;
  signal S_TB : STD_LOGIC_VECTOR (2 downto 0);
  --signal C_out_TB : STD_LOGIC;

begin

  -- Instantiate the Adder_3bit module
  uut: Adder_3bit
    port map (
      A => A_TB,
      B => B_TB,
      --C_in => C_in_TB,
      S => S_TB
      --C_out => C_out_TB
    );

  -- Stimulus process
  stimulus: process
  begin
    -- Initialize inputs
    A_TB <= "000";
    --B_TB <= "001";
    --C_in_TB <= '0';

    -- Wait for 10 ns
    wait for 100 ns;

    -- Change inputs
    A_TB <= "001";
    --B_TB <= "011";
    --C_in_TB <= '1';

    -- Wait for 10 ns
    wait for 100 ns;

    A_TB <= "010";
    --B_TB <= "001";
    --C_in_TB <= '0';

    -- Wait for 10 ns
    wait for 100 ns;
    
    A_TB <= "011";
    --B_TB <= "001";
    --C_in_TB <= '0';
    -- Wait for 10 ns
    wait for 100 ns;

    -- End the simulation
    wait;
  end process;

end Behavioral;








