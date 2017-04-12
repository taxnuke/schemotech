library ieee;
use ieee.std_logic_1164.all;

entity jkcounter_vhdl is
port(c, r, jk   : in std_logic;
	q0,q1,q2,q3 : out std_logic);
end jkcounter_vhdl;

architecture behaviour of jkcounter_vhdl is
	signal temp0, temp1, temp2, temp3:std_logic;
begin
q0<=temp0;
q1<=temp1;
q2<=temp2;
q3<=temp3;
process(c, r, jk)
begin
	if (c'event and c='1') then
		if (r='1' and jk='1') then
			if (temp0='0') then
				temp0<='1';
			elsif (temp1='0') then
				temp1<='1';
				temp0<='0';
			elsif (temp2='0') then
				temp2<='1';
				temp1<='0';
				temp0<='0';
			elsif (temp3='0') then
				temp3<='1';
				temp2<='0';
				temp1<='0';
				temp0<='0';
			end if;
		end if;
	end if;
end process;
end behaviour;
