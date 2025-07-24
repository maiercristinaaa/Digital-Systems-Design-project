LIBRARY ieee;																																				 library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity counter is
	 port(
		 up1 : in STD_LOGIC;
		 down1 : in STD_LOGIC;
		 adauga_cifru1 : in STD_LOGIC;
		 clock2 : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 Liber_ocupat : out STD_LOGIC;
		 Introdu_caractere : out STD_LOGIC;
		 pas :out std_logic_vector(3 downto 0);
		 numar1 : out STD_LOGIC_VECTOR (3 downto 0);
		 numar2 : out STD_LOGIC_VECTOR (3 downto 0);
		 numar3 : out STD_LOGIC_VECTOR (3 downto 0);
		 numar4 : out STD_LOGIC_VECTOR (3 downto 0);
		 numar5 : out STD_LOGIC_VECTOR (3 downto 0);
		 numar6 : out STD_LOGIC_VECTOR (3 downto 0)
	     );
end counter;

--}} End of automatically maintained section

architecture counter of counter is	 
signal n_cifru,n1,n2,n3,n4,n5,n6: std_logic_vector (3 downto 0) := "0000";
begin

	process(clock2,adauga_cifru1,reset)
	begin
		if(reset = '1') then
			n_cifru <= "0000";
			n1 <= "0000";
			n2 <= "0000";
			n3 <= "0000";
			n4 <= "0000";
			n5 <= "0000";
			n6 <= "0000";
		elsif (rising_edge(clock2)) then
			if(adauga_cifru1 = '1') then
				n_cifru <= n_cifru + 1;
			end if;
		end if;	 
		
		case (n_cifru) is 
			
		when "0001" => 				 --pentru primul numar	din primul cod
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n1 <= n1 + 1;
			elsif(down1 = '1') then
				n1 <= n1 - 1;
			end if;
			end if;	  
			 Liber_ocupat <= '0';
		Introdu_caractere <= '1';	
		
		when "0010" => 			   --pentru al doilea numar	din primul cod
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n2 <= n2 + 1;
			elsif(down1 = '1') then
				n2 <= n2 - 1;
			end if;
			end if;	   
			 Liber_ocupat <= '0';
		Introdu_caractere <= '1';  
		
		when "0011" => 				--pentru al treilea numar  din primul cod
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n3 <= n3 + 1;
			elsif(down1 = '1') then
				n3 <= n3 - 1;
			end if;
			end if;
			 Liber_ocupat <= '0';
		Introdu_caractere <= '1';	
		
		when "0101" => 			   --pentru primul numar din al doilea cod
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n4 <= n4 + 1;
			elsif(down1 = '1') then
				n4 <= n4 - 1;
			end if;
			end if;
			 Liber_ocupat <= '1';
		Introdu_caractere <= '1';	 
		
		when "0110" => 			  --pentru al doilea numar din al doilea cod
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n5 <= n5 + 1;
			elsif(down1 = '1') then
				n5 <= n5 - 1;
			end if;
			end if;
			 Liber_ocupat <= '1';
		Introdu_caractere <= '1';   
								 --pentru al treilea numar din al doilea cod
		when "0111" => 	
		if(rising_edge(clock2)) then
			if(up1 = '1') then
				n6 <= n6 + 1;
			elsif(down1 = '1') then
				n6 <= n6 - 1;
			end if;
			end if;
			 Liber_ocupat <= '1';
		Introdu_caractere <= '1';  
		
		when "1001" => 
		if(n1 = n4) then
			if(n2 = n5) then
				if(n3 = n6) then
					  	n_cifru <= "0000";
			            n1 <= "0000";
			            n2 <= "0000";
			            n3 <= "0000";
			            n4 <= "0000";
			            n5 <= "0000";
			            n6 <= "0000";  
				else 
					n_cifru <= "0100";
				end if;
			else
				n_cifru <= "0100";
			end if;	
		else
			n_cifru <= "0100";
		end if;	
		
		when "0100" => 
		Liber_ocupat <= '1';
		Introdu_caractere <='0';  
		
		when "1000" =>
		Liber_ocupat <= '1';
		Introdu_caractere <='0';
		
		when others =>  
		Liber_ocupat <= '0';
		Introdu_caractere <= '0';
		end case;  
		numar1 <= n1; 
		numar2 <= n2;
		numar3 <= n3;
		numar4 <= n4;
		numar5 <= n5;
		numar6 <= n6;	
		pas <= n_cifru;
	end process;	
end counter;