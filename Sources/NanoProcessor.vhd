----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:05:41 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0); 
           Reg_07 : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end NanoProcessor;

architecture Behavioral of NanoProcessor is
component RegisterBank is
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
end component;

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
           --C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           --C_out : out STD_LOGIC;
           V : out STD_LOGIC;   --Overflow
           Zero : out STD_LOGIC );
end component;

component Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           --C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0)
           --C_out : out STD_LOGIC
           );
end component;

component Inst_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Select : out STD_LOGIC;
           Reg_Select_0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Select_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Imm_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : out STD_LOGIC;
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_3bit is
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y  : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_4bit is
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component Prog_Count is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           MUX_Data : in STD_LOGIC_VECTOR (2 downto 0);
           Mem_Select : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Prog_ROM is
    Port ( Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

SIGNAL RegBank_D_temp, add_sub_temp, Imm_value_temp : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Reg_EN_temp, adder_3bit_sum_temp, Jump_Address_temp, MUX_3bit_data_temp : std_logic_vector (2 downto 0);
SIGNAL RegBank_Q0_temp,RegBank_Q1_temp,RegBank_Q2_temp,RegBank_Q3_temp,RegBank_Q4_temp,RegBank_Q5_temp,RegBank_Q6_temp,RegBank_Q7_temp :std_logic_vector(3 downto 0);
SIGNAL Jump_Flag_temp, Load_select_temp, Add_Sub_Select_temp : std_logic;
SIGNAL Reg_select_1_temp, Reg_select_2_temp, Mem_select_temp :std_logic_vector(2 downto 0);
SIGNAL Add_Sub_Data_1, Add_Sub_Data_2 : std_logic_vector (3 downto 0);
SIGNAL Instruction_temp : std_logic_vector (11 downto 0);
SIGNAL Slow_clk_temp : std_logic;

begin
Slow_Clk_0 : Slow_Clk
port map(
           Clk_in => Clk,
           Clk_out => Slow_clk_temp
);

RegisterBank_0 : RegisterBank
port map (
           RegBank_D => RegBank_D_temp, --Register bank data
           Clk => Slow_clk_temp, --Clock
           Reg_EN => Reg_EN_temp, --Register enable
           RegBank_reset => Reset,
           RegBank_Q0 => RegBank_Q0_temp,
           RegBank_Q1 => RegBank_Q1_temp,
           RegBank_Q2 => RegBank_Q2_temp,
           RegBank_Q3 => RegBank_Q3_temp,
           RegBank_Q4 => RegBank_Q4_temp,
           RegBank_Q5 => RegBank_Q5_temp,
           RegBank_Q6 => RegBank_Q6_temp,
           RegBank_Q7 => RegBank_Q7_temp
);

MUX_2_3bit_0 : MUX_2_3bit
port map (
           S  => Jump_Flag_temp,
           D0 => adder_3bit_sum_temp,
           D1 => Jump_Address_temp,
           Y  => MUX_3bit_data_temp
);

MUX_2_4bit_0 : MUX_2_4bit
port map (
           S  => Load_select_temp,
           D0 => add_sub_temp,
           D1 => Imm_value_temp,
           Y  => RegBank_D_temp
);

MUX_8_4bit_0 : MUX_8_4bit
Port map( 
           S => Reg_select_1_temp,
           D0 => RegBank_Q0_temp,
           D1 => RegBank_Q1_temp,
           D2 => RegBank_Q2_temp,
           D3 => RegBank_Q3_temp,
           D4 => RegBank_Q4_temp,
           D5 => RegBank_Q5_temp,
           D6 => RegBank_Q6_temp,
           D7 => RegBank_Q7_temp,
           Y => Add_Sub_Data_1
);

MUX_8_4bit_1 : MUX_8_4bit
Port map( 
           S  => Reg_select_2_temp,
           D0 => RegBank_Q0_temp,
           D1 => RegBank_Q1_temp,
           D2 => RegBank_Q2_temp,
           D3 => RegBank_Q3_temp,
           D4 => RegBank_Q4_temp,
           D5 => RegBank_Q5_temp,
           D6 => RegBank_Q6_temp,
           D7 => RegBank_Q7_temp,
           Y  => Add_Sub_Data_2
);

ADD_SUB_0 : ADD_SUB
Port map( 
           A0 => Add_Sub_Data_1(0),
           A1 => Add_Sub_Data_1(1),
           A2 => Add_Sub_Data_1(2),
           A3 => Add_Sub_Data_1(3),
           M  => Add_Sub_Select_temp,
           B0 => Add_Sub_Data_2(0),
           B1 => Add_Sub_Data_2(1),
           B2 => Add_Sub_Data_2(2),
           B3 => Add_Sub_Data_2(3),
           S0 => add_sub_temp(0),
           S1 => add_sub_temp(1),
           S2 => add_sub_temp(2),
           S3 => add_sub_temp(3),
           V => Overflow,  --Overflow
           Zero => Zero 
);

Adder_3bit_0 : Adder_3bit
Port map( 
           A => Mem_select_temp,
           B => "001",
           S=> adder_3bit_sum_temp
);

Prog_Count_0 : Prog_Count
port map (
           Clk => Slow_clk_temp,
           Reset => Reset,
           MUX_Data => MUX_3bit_data_temp,
           Mem_Select => Mem_select_temp
);

Prog_ROM_0 : Prog_ROM 
Port map ( 
           Mem_Select => Mem_select_temp,
           Instruction => Instruction_temp
 );
 
Inst_Decoder_0 : Inst_Decoder
Port map ( 
            Instruction => Instruction_temp,
            Reg_Jump_Check => Add_Sub_Data_1,
            Add_Sub_Select => Add_Sub_Select_temp,
            Reg_Select_0 => Reg_select_1_temp,
            Reg_Select_1 => Reg_select_2_temp,
            Imm_Value => Imm_value_temp,
            Load_Select => Load_select_temp,
            Reg_EN => Reg_EN_temp,
            Jump_Flag => Jump_Flag_temp,
            Jump_Address => Jump_Address_temp
);

LUT_16_7_0 : LUT_16_7
port map(
           address => RegBank_Q7_temp,
           data => S_7seg
);



Reg_07 <= RegBank_Q7_temp;

Anode <= "1110";

end Behavioral;