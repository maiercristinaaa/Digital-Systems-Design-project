library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD is
Port 
( 
signal clock1:in std_logic;	 
signal cifru1:in std_logic;
signal cifru2:in std_logic;	
signal nr_pas: in std_logic_vector(3 downto 0);
signal number1 :in std_logic_vector(3 downto 0); 
signal number2 :in std_logic_vector(3 downto 0);
signal number3 :in std_logic_vector(3 downto 0);
signal number4 :in std_logic_vector(3 downto 0);
signal number5 :in std_logic_vector(3 downto 0);
signal number6 :in std_logic_vector(3 downto 0);
signal anod1:out std_logic_vector(3 downto 0);
signal catod1:out std_logic_vector(6 downto 0)
);
end SSD;

architecture Behavioral of SSD is

signal counter:std_logic_vector(16 downto 0):=(others=>'0');
signal numar_afisat: std_logic_vector(3 downto 0);

begin

process(clock1)
begin
if (rising_edge(clock1)) then
    counter<=counter+1;
end if;
end process;

process(counter,number1,number2,number3,number4,number5,number6)
begin

case counter(16 downto 15) is
when "00"=> anod1 <= "1110";	   
      if(cifru1 = '1') then
          numar_afisat <= number1;
	  elsif(cifru2 = '1') then
		  numar_afisat <= number4;
		end if;  
when "01"=> anod1 <= "1101";
 if(cifru1 = '1') then
          numar_afisat <= number2;
	  elsif(cifru2 = '1') then
		  numar_afisat <= number5;
		end if; 
when "10"=> anod1 <="1011";
 if(cifru1 = '1') then
          numar_afisat <= number3;
	  elsif(cifru2 = '1') then
		  numar_afisat <= number6;
		end if; 
when others=>anod1 <= "0111";numar_afisat <= nr_pas;
end case;
end process;

process(numar_afisat)
begin

case (numar_afisat) is 
when "0000"=>catod1<=not("0111111");
when "0001"=>catod1<=not("0000110");
when "0010"=>catod1<=not("1011011");
when "0011"=>catod1<=not("1001111");
when "0100"=>catod1<=not("0111111");
when "0101"=>catod1<=not("0111111");
when "0110"=>catod1<=not("0111111");
when "0111"=>catod1<=not("0111111");
when "1000"=>catod1<=not("0111111");
when "1001"=>catod1<=not("0111111");
when "1010"=>catod1<=not("0111111");
when "1011"=>catod1<=not("0111111");
when "1100"=>catod1<=not("0111111");
when "1101"=>catod1<=not("0111111");
when "1110"=>catod1<=not("0111111");
when others=>catod1<=not("0111111");
end case;
end process;
end Behavioral;