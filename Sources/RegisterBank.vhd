----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:36:22 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( RegBank_D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           RegBank_reset : in STD_LOGIC;
           RegBank_Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           RegBank_Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end RegisterBank;

architecture Behavioral of RegisterBank is
component Reg_reset
   Port (  D : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
Port (     I : in STD_LOGIC_VECTOR (2 downto 0);
           EN: in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component; 
SIGNAL Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : STD_LOGIC;
SIGNAL EN_temp : STD_LOGIC := '1';

begin
R0 : Reg_reset
PORT MAP (
    EN =>  Y0,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q0
);
R1 : Reg_reset
PORT MAP (
    EN =>  Y1,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q1
);
R2 : Reg_reset
PORT MAP (
    EN =>  Y2,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q2
);
R3 : Reg_reset
PORT MAP (
    EN =>  Y3,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q3
);
R4 : Reg_reset
PORT MAP (
    EN =>  Y4,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q4
);
R5 : Reg_reset
PORT MAP (
    EN =>  Y5,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q5
);
R6 : Reg_reset
PORT MAP (
    EN =>  Y6,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q6
);
R7 : Reg_reset
PORT MAP (
    EN =>  Y7,
    D => RegBank_D,
    Reset => RegBank_reset,
    Clk => Clk,
    Q => RegBank_Q7
);
Decoder_3_to_8_0 :Decoder_3_to_8
PORT MAP (
    I => Reg_EN,
    Y(0) => Y0,
    Y(1) => Y1,
    Y(2) => Y2,
    Y(3) => Y3,
    Y(4) => Y4,
    Y(5) => Y5,
    Y(6) => Y6,
    Y(7) => Y7,
    EN => EN_temp
);

end Behavioral;
