----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2023 03:11:04 PM
-- Design Name: 
-- Module Name: LFSR - Behavioral
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

entity LFSR is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Random : out STD_LOGIC_VECTOR (31 downto 0));
end LFSR;

architecture Behavioral of LFSR is
    constant seed : std_logic_vector(31 downto 0) := "10110001101111011011010010110101";
    signal lfsr_reg : std_logic_vector(31 downto 0) := (others => '0');
begin
    process (clk,rst)
    begin
        if (rst='0') then
            lfsr_reg <= seed;
        elsif (clk'event and clk='1') then
            lfsr_reg(31) <= (lfsr_reg(30) xor lfsr_reg(23)) xor lfsr_reg(19);
            lfsr_reg(30 downto 0) <= lfsr_reg(31 downto 1);
        end if;
    end process;

    Random <= lfsr_reg;

end Behavioral;
