----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 10:54:55 PM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           --C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0)
           --C_out : out STD_LOGIC
           );
end Adder_3bit;

architecture Behavioral of Adder_3bit is
component FA
     port (
     A: in std_logic;
     B: in std_logic;
     C_in: in std_logic;
     S: out std_logic;
     C_out: out std_logic);
 end component;

 SIGNAL FA0_C, FA1_C, FA2_C  : std_logic;
 SIGNAL B1, B2 : std_logic :='0';
 SIGNAL B0 : std_logic := '1'; 
begin
 FA_0 : FA
    port map (
    A => A(0),
    B => B0,
    C_in => '0', -- Set to ground
    S => S(0),
    C_Out => FA0_C);   
 FA_1 : FA
    port map (
    A => A(1),
    B => B1,
    C_in => FA0_C,
    S => S(1),
    C_Out => FA1_C);
 FA_2 : FA
    port map (
    A => A(2),
    B => B2,
    C_in => FA1_C,
    S => S(2),
    C_Out => FA2_C);
end Behavioral;
