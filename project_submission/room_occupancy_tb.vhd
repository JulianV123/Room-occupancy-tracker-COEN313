library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity room_occupancy_tb is
end room_occupancy_tb;

architecture testbench_architecture of room_occupancy_tb is

	component room_occupancy 
		port ( X 	 : in std_logic;
			   Y 	 : in std_logic;
				clk   : in std_logic;
			   reset : in std_logic;
			   m 	 : out std_logic_vector(7 downto 0));
		end component;
	
	signal X,Y,clk,reset : std_logic := '0';
	signal m : std_logic_vector(7 downto 0);
	
begin

	UUT: room_occupancy
	port map (
		X => X,
		Y => Y,
		clk => clk,
		reset => reset,
		m => m
	);
	
	STIMULI:
	process
	
	begin
						--test 1
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 10 ns;
		
		X <= '1';
		
		for i in 0 to 30 loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		end loop;

		X <= '0';
			
		Y <= '1';
		for i in 0 to 5 loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		end loop;

		Y <= '0';
						--test 2
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 10 ns;

		X <= '1';
		
		for i in 0 to 300 loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		end loop;

		X <= '0';
			
		Y <= '1';
		for i in 0 to 5 loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		end loop;

		Y <= '0';

						--test 3
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 10 ns;
			
		Y <= '1';
		for i in 0 to 5 loop
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		end loop;

		Y <= '0';
		
		wait;
	end process;

end testbench_architecture;
	
