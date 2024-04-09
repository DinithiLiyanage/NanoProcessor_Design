----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:19:01 PM
-- Design Name: 
-- Module Name: Sim_MUX_2_3bit - Behavioral
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

entity Sim_MUX_2_3bit is
--  Port ( );
end Sim_MUX_2_3bit;

architecture Behavioral of Sim_MUX_2_3bit is
component MUX_2_3bit
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y  : out STD_LOGIC_VECTOR (2 downto 0));
end component;


  -- Signal declarations
  signal S_tb : STD_LOGIC;
  signal D0_tb, D1_tb, Y_tb : STD_LOGIC_VECTOR (2 downto 0);

begin
  -- Instantiate the DUT
  uut: MUX_2_3bit
    port map (
      S => S_tb,
      D0 => D0_tb,
      D1 => D1_tb,
      Y => Y_tb
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Initialize inputs
    S_tb <= '0';
    D0_tb <= "000";
    D1_tb <= "111";
    wait for 200 ns;

    -- Test case 1
    S_tb <= '0';
    D0_tb <= "101";
    D1_tb <= "010";
    wait for 200 ns;

    -- Test case 2
    S_tb <= '1';
    D0_tb <= "110";
    D1_tb <= "001";
    wait for 200 ns;

    -- Test case 3
    S_tb <= '1';
    D0_tb <= "000";
    D1_tb <= "000";
    wait for 200 ns;

    -- End the simulation
    wait;
  end process;

end Behavioral;

