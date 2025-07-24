library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Cifru_DulapD is
	 port(
		 up : in STD_LOGIC;
		 down : in STD_LOGIC;
		 clock : in STD_LOGIC;
		 Rst : in STD_LOGIC;
		 Adauga_cifru : in STD_LOGIC;
		 anod : out STD_LOGIC_VECTOR(3 downto 0);
		 catod : out STD_LOGIC_VECTOR(6 downto 0);
		 bec_liber : out STD_LOGIC;
		 bec_introdu : out std_logic
	     );
end Cifru_DulapD;

--}} End of automatically maintained section

architecture Cifru_DulapD of Cifru_DulapD is	 
--component numarator is
--	 port(
--		 up1 : in STD_LOGIC;
--		 down1 : in STD_LOGIC;
--		 adauga_cifru1 : in STD_LOGIC;
--		 clock2 : in STD_LOGIC;
--		 reset : in STD_LOGIC;
--		 cod1 : out STD_LOGIC;
--		 cod2 : out STD_LOGIC;
--		 pas :out std_logic_vector(3 downto 0);
--		 numar1 : out STD_LOGIC_VECTOR (3 downto 0);
--		 numar2 : out STD_LOGIC_VECTOR (3 downto 0);
--		 numar3 : out STD_LOGIC_VECTOR (3 downto 0);
--		 numar4 : out STD_LOGIC_VECTOR (3 downto 0);
--		 numar5 : out STD_LOGIC_VECTOR (3 downto 0);
--		 numar6 : out STD_LOGIC_VECTOR (3 downto 0)
--	     );
--end component;

--component Debouncer is
--Port(signal btn:in std_logic;
--     signal clk:in std_logic;
--     signal rez:out std_logic
-- );
--end component; 

component SSD is
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
end component; 	 

COMPONENT counter is
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
end component;



signal unu,doi,up_btn,down_btn,adauga_btn : std_logic;
signal nr1,nr2,nr3,nr4,nr5,nr6,nr_cifru: std_logic_vector(3 downto 0):="0000";
begin
	
	--U00 :  Debouncer port map (up,clock,up_btn);	
	--U01 :  Debouncer port map (down,clock,down_btn);
	--U02 :  Debouncer port map (Adauga_cifru,clock,adauga_btn);
    U1 : counter port map (up,down,Adauga_cifru,clock,Rst,bec_liber,bec_introdu,nr_cifru,nr1,nr2,nr3,nr4,nr5,nr6);
	U2 : SSD port map (clock,unu,doi,nr_cifru,nr1,nr2,nr3,nr4,nr5,nr6,anod,catod);

end Cifru_DulapD;