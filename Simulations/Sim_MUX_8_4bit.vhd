----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:53:14 PM
-- Design Name: 
-- Module Name: Sim_MUX_8_4bit - Behavioral
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

entity Sim_MUX_8_4bit is
--  Port ( );
end Sim_MUX_8_4bit;

architecture Behavioral of Sim_MUX_8_4bit is
  -- Component declaration for the DUT (Design Under Test)
component MUX_8_4bit is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

  -- Signal declarations
  signal S_tb : STD_LOGIC_VECTOR (2 downto 0);
  signal D0_tb, D1_tb, D2_tb, D3_tb, D4_tb, D5_tb, D6_tb, D7_tb, Y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
  -- Instantiate the DUT
  uut: MUX_8_4bit
    port map (
      S => S_tb,
      D0 => D0_tb,
      D1 => D1_tb,
      D2 => D2_tb,
      D3 => D3_tb,
      D4 => D4_tb,
      D5 => D5_tb,
      D6 => D6_tb,
      D7 => D7_tb,
      Y => Y_tb
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Initialize inputs
    S_tb <= "000";
    D0_tb <= "0000";
    D1_tb <= "1111";
    D2_tb <= "0101";
    D3_tb <= "1010";
    D4_tb <= "0011";
    D5_tb <= "1100";
    D6_tb <= "0110";
    D7_tb <= "1001";
    wait for 200 ns;

    -- Test case 1
    S_tb <= "001";
    D0_tb <= "1010";
    D1_tb <= "0101";
    D2_tb <= "1111";
    D3_tb <= "0000";
    wait for 200 ns;

    -- Test case 2
    S_tb <= "010";
    D0_tb <= "0011";
    D1_tb <= "1100";
    D2_tb <= "0110";
    D3_tb <= "1001";
    wait for 200 ns;

    -- Test case 3
    S_tb <= "110";
    D0_tb <= "0011";
    D1_tb <= "0000";
    D2_tb <= "0101";
    D3_tb <= "1010";
    wait for 200 ns;


    -- End the simulation
    wait;
  end process;

end Behavioral;

