library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity room_occupancy is 
port ( X 	 : in std_logic;
	   Y 	 : in std_logic;
	   clk   : in std_logic;
	   reset : in std_logic;
	   m 	 : out std_logic_vector(7 downto 0));
end room_occupancy;

architecture track_occupancy of room_occupancy is 

signal max_occupancy : std_logic_vector(7 downto 0);
signal current_occupancy: std_logic_vector(7 downto 0);

begin 

	process(X,Y,clk,reset)
	
	begin

		max_occupancy <= (others => '1');
	
		if (reset = '1') then
			current_occupancy <= "00000000";						--Reset room occupancy
		end if;
		
		if (rising_edge(clk)) then
		
			if (current_occupancy < max_occupancy) then				--Allows a person to enter only if the room isn't full
		
				if(X = '1') then
					current_occupancy <= current_occupancy + 1;		--A person enters the room 
				end if;
		
			elsif (current_occupancy >= max_occupancy) then
	
				current_occupancy <= (others => '1');

			end if;
		
			if (current_occupancy > "00000000") then				--Allows a person to leave only if the room has someone
				if(Y = '1') then
					current_occupancy <= current_occupancy - 1;		--A person leaves the room
				end if;
			end if;
			
		end if;

		m <= current_occupancy;
			
	end process;
	
end track_occupancy;
