----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:39:27 AM
-- Design Name: 
-- Module Name: Sim_RegBank - Behavioral
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

entity Sim_RegBank is
--  Port ( );
end Sim_RegBank;

architecture Behavioral of Sim_RegBank is
    -- Component declaration
    component RegisterBank is
        Port (
            RegBank_D       : in  STD_LOGIC_VECTOR(3 downto 0);
            Clk             : in  STD_LOGIC;
            Reg_EN          : in  STD_LOGIC_VECTOR(2 downto 0);
            RegBank_reset   : in  STD_LOGIC;
            RegBank_Q0      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q1      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q2      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q3      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q4      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q5      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q6      : out STD_LOGIC_VECTOR(3 downto 0);
            RegBank_Q7      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signal declarations
    signal RegBank_D         : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk               : STD_LOGIC;
    signal Reg_EN            : STD_LOGIC_VECTOR(2 downto 0);
    signal RegBank_reset     : STD_LOGIC;
    signal RegBank_Q0        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q1        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q2        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q3        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q4        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q5        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q6        : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Q7        : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Component instantiation
    UUT: RegisterBank
    port map (
        RegBank_D       => RegBank_D,
        Clk             => Clk,
        Reg_EN          => Reg_EN,
        RegBank_reset   => RegBank_reset,
        RegBank_Q0      => RegBank_Q0,
        RegBank_Q1      => RegBank_Q1,
        RegBank_Q2      => RegBank_Q2,
        RegBank_Q3      => RegBank_Q3,
        RegBank_Q4      => RegBank_Q4,
        RegBank_Q5      => RegBank_Q5,
        RegBank_Q6      => RegBank_Q6,
        RegBank_Q7      => RegBank_Q7
    );

    -- Clock process
    process
    begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Initialize inputs
        RegBank_D       <= (others => '0');
        Reg_EN          <= (others => '0');
        RegBank_reset   <= '0';

        -- Apply input values and observe outputs
        -- Example test case 1
        RegBank_D       <= "1101";
        Reg_EN          <= "001";
        RegBank_reset   <= '1';  -- Reset the registers
        wait for 20 ns;
        RegBank_reset   <= '0';  -- Release the reset
        wait for 20 ns;
        RegBank_D       <= "1111";
        Reg_EN          <= "011";
        wait for 20 ns;
        RegBank_D       <= "1100";
        Reg_EN          <= "001";
        wait for 20 ns;
        RegBank_D       <= "0011";
        Reg_EN          <= "101";
        wait;
    end process;

end Behavioral;








