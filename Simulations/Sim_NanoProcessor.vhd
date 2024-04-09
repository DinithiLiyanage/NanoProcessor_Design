----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 03:30:19 PM
-- Design Name: 
-- Module Name: Sim_NanoProcessor - Behavioral
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

entity Sim_NanoProcessor is
--  Port ( );
end Sim_NanoProcessor;

architecture Behavioral of Sim_NanoProcessor is
-- Component declaration for the NanoProcessor
  component NanoProcessor is
    Port (
      Clk : in STD_LOGIC;
      Reset : in STD_LOGIC;
      S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
      Anode : out STD_LOGIC_VECTOR (3 downto 0);
      Reg_07 : out STD_LOGIC_VECTOR (3 downto 0);
      Overflow : out STD_LOGIC;
      Zero : out STD_LOGIC
    );
  end component;
  
  constant Clk_period : time := 5ns;

  -- Signal declarations
  signal Clk : STD_LOGIC := '0';
  signal Reset : STD_LOGIC := '0';
  signal S_7seg : STD_LOGIC_VECTOR (6 downto 0);
  signal Overflow : STD_LOGIC;
  signal Zero : STD_LOGIC;
  signal Anode, Reg_07 : STD_LOGIC_VECTOR (3 downto 0);

begin

  -- Instantiate the NanoProcessor
  UUT: NanoProcessor
    port map (
      Clk => Clk,
      Reset => Reset,
      S_7seg => S_7seg,
      Anode => Anode,
      Reg_07 => Reg_07,
      Overflow => Overflow,
      Zero => Zero
    );

  -- Clock process
  Clock: process
  begin
    Clk <= '0';
    wait for Clk_period/2;
    Clk <= '1';
    wait for Clk_period/2;
  end process;

  -- Stimulus process
  process
  begin
    Reset <= '1';
    wait for 10 ns;
    Reset <= '0';
    wait;
  end process;

end Behavioral;