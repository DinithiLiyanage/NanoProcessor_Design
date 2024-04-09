----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 06:13:28 PM
-- Design Name: 
-- Module Name: Sim_ADD_SUB - Behavioral
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

entity Sim_ADD_SUB is
--  Port ( );
end Sim_ADD_SUB;

architecture Behavioral of Sim_ADD_SUB is
component ADD_SUB is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           M  : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
          -- C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           --C_out : out STD_LOGIC;
           V : out STD_LOGIC;
           Zero : out STD_LOGIC );
  end component;
  
  signal A0_TB, A1_TB, A2_TB, A3_TB, M_TB, B0_TB, B1_TB, B2_TB, B3_TB : std_logic;
  signal S0_TB, S1_TB, S2_TB, S3_TB, V_TB, Zero_TB : std_logic;

begin

  UUT: ADD_SUB
    port map (
      A0 => A0_TB,
      A1 => A1_TB,
      A2 => A2_TB,
      A3 => A3_TB,
      M => M_TB,
      B0 => B0_TB,
      B1 => B1_TB,
      B2 => B2_TB,
      B3 => B3_TB,
      --C_in => C_in_TB,
      S0 => S0_TB,
      S1 => S1_TB,
      S2 => S2_TB,
      S3 => S3_TB,
      --C_out => C_out_TB,
      V => V_TB,
      Zero => Zero_TB
    );
  
  stimulus: process
  begin
    -- Test Case 1
    A0_TB <= '1';
    A1_TB <= '0';
    A2_TB <= '1';
    A3_TB <= '0';
    M_TB <= '0';
    B0_TB <= '0';
    B1_TB <= '1';
    B2_TB <= '1';
    B3_TB <= '0';
    --C_in_TB <= '0';
    wait for 200 ns;
    
    -- Test Case 2
    A0_TB <= '1';
    A1_TB <= '0';
    A2_TB <= '1';
    A3_TB <= '0';
    M_TB <= '1';
    B0_TB <= '0';
    B1_TB <= '1';
    B2_TB <= '1';
    B3_TB <= '0';
   -- C_in_TB <= '1';
    wait for 200 ns;
    
    -- Add more test cases here if needed
    
    wait;
  end process;

end Behavioral;
