library ieee;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
  
ENTITY FSM IS  
port   
	(  
		clk : in std_logic;  
		reset : in std_logic;  
		w : in std_logic;  
		vetor_dados : out std_logic_vector (8 downto 0);
		z : out std_logic
		
	);  
end FSM;
 
architecture behavior of FSM is  
 
signal dados : std_logic_vector (8 downto 0) := "000000000";
signal dado : std_logic;
TYPE estados IS (a, b, c, d, e, f, g, h, i);
SIGNAL estado : estados;
begin
	vetor_dados <= dados; 
	
	process(clk)  
	begin  
		if (reset = '1' AND Clk = '0') then 
			z <= '0';
			dados <= "000000001";
			--dados <= "000000000";
			estado <= a;
			
		elsif rising_edge(clk) then  
			dado <= w;  
		
			case estado is
				WHEN a =>
					dados <= "000000001";
					--dados <= "000000000";
					z <= '0';
					if (w = '0') then
						estado <= b;
					else 
						estado <= f;
					end if;
					
				WHEN b =>
					dados <= "000000010";
					--dados <= "000000011";
					z <= '0';
					if (w = '0') then
						estado <= c;
					else 
						estado <= f;
					end if;
					
				WHEN c =>
					dados <= "000000100";
					--dados <= "000000101";
					z <= '0';
					if (w = '0') then
						estado <= d;
					else 
						estado <= f;
					end if;
					
				WHEN d =>
					dados <= "000001000";
					--dados <= "000001001";
					z <= '0';
					if (w = '0') then
						estado <= e;
					else 
						estado <= f;
					end if;
					
				WHEN e =>
					dados <= "000010000";
					--dados <= "000010001";
					z <= '1';
					if (w = '0') then
						estado <= e;
					else 
						estado <= f;
					end if;
					
				WHEN f =>
					dados <= "000100000";
					--dados <= "000100001";
					z <= '0';
					if (w = '0') then
						estado <= b;
					else 
						estado <= g;
					end if;
					
				WHEN g =>
					dados <= "001000000";
					--dados <= "001000001";
					z <= '0';
					if (w = '0') then
						estado <= b;
					else 
						estado <= h;
					end if;
					
				WHEN h =>
					dados <= "010000000";
					--dados <= "010000001";
					z <= '0';
					if (w = '0') then
						estado <= b;
					else 
						estado <= i;
					end if;
					
				WHEN i =>
					dados <= "100000000";
					--dados <= "100000001";
					z <= '1';
					if (w = '0') then
						estado <= b;
					else 
						estado <= i;
					end if;
					
			end case;
			
		end if;  
	end process; 
end architecture;

library ieee;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity aula8 is
	port(
		w : in std_logic;
		led : out std_logic_vector(8 downto 0);
		z: out std_logic;
		Clk : in std_logic;
		Rst : in std_logic
	);
end aula8;

architecture FSM of aula8 is
-- signal letra : std_logic_vector(11 downto 0);

begin
	-- Clk <= NOT Clk
	circuito : entity work.FSM(behavior) 
		port map(vetor_dados(0) => led(0), vetor_dados(1) => led(1), vetor_dados(2) => led(2), vetor_dados(3) => led(3), vetor_dados(4) => led(4), 
		vetor_dados(5) => led(5), vetor_dados(6) => led(6), vetor_dados(7) => led(7), vetor_dados(8) => led(8), clk => Clk, w => w, z => z, reset => Rst);

end architecture;