library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_simple_vhdl is
	generic (
		runner_cfg : string
	);
end tb_simple_vhdl;

architecture tb of tb_simple_vhdl is

	constant period : time := 10 ns;

	signal clk_100 : std_logic := '0';
	signal rst     : std_logic := '1';

	constant counter_width : unsigned(3 downto 0) := "1100"; -- =12

	signal a_in         : std_logic := '0';
	signal b_in         : std_logic := '0';
	signal c_out        : std_logic;
	signal counter_done : std_logic;

begin

	clk_100 <= not clk_100 after period / 2;
	rst     <= '0' after period * 5;

	a_in <= not a_in after period / 2 * 10;
	b_in <= not b_in after period / 2 * 20;

	simple_vhdl : entity work.simple_vhdl
		generic map(
			counter_width => counter_width
		)
		port map(
			sys_clk      => clk_100,
			rst          => rst,
			a_in         => a_in,
			b_in         => b_in,
			c_out        => c_out,
			counter_done => counter_done
		);

	main_p : process
	begin
		test_runner_setup(runner, runner_cfg);
		while test_suite loop
			if run("wave") then

				wait for 3500 ns;

			elsif run("long") then

				wait for 3500 ns;

			elsif run("auto") then

				wait for 3500 ns;

				--check(counter_mealy = expected_res, "mealy wrong expected: " & to_string(expected_res) & "   got: " & to_string(counter_mealy), warning);
				--check(counter_moore = expected_res, "moore wrong expected: " & to_string(expected_res) & "   got: " & to_string(counter_moore), warning);
				info("test done");
			end if;
		end loop;

		test_runner_cleanup(runner);
	end process;

	test_runner_watchdog(runner, 100 ms);

end architecture;