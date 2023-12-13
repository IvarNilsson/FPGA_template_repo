library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_vhdl is
	generic (
		counter_width : unsigned(3 downto 0) := "1000"
	);
	port (
		sys_clk      : in std_logic;
		rst          : in std_logic;
		a_in         : in std_logic;
		b_in         : in std_logic;
		c_out        : out std_logic;
		counter_done : out std_logic
	);
end simple_vhdl;

architecture structural of simple_vhdl is
	signal current_counter : unsigned(3 downto 0) := (others => '0');
	signal next_counter    : unsigned(3 downto 0) := (others => '0');

begin

	c_out <= a_in and b_in;

	sync : process (sys_clk)
	begin
		if rising_edge(sys_clk) then
			if rst = '1' then
				current_counter <= (others => '0');
			else
				current_counter <= next_counter;
			end if;
		end if;
	end process;

	comb : process (current_counter)
	begin
		if (current_counter = counter_width) then
			next_counter <= (others => '0');
			counter_done <= '1';
		else
			next_counter <= current_counter + 1;
			counter_done <= '0';
		end if;

	end process;

end architecture;