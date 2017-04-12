library ieee;
use ieee.std_logic_1164.all;

entity trstr_vhdl is
port(t,s,r :in std_logic;
	 q,qi  :out std_logic);
end trstr_vhdl;

architecture behaviour of trstr_vhdl is
	signal Qtemp:std_logic := 'X';
begin
q<=Qtemp;
qi<=not Qtemp;
process(t, r, s)
begin
	--wait until r = '0';
	if r='0' then
		Qtemp<='0';
	elsif (t'event and t='1') then
		Qtemp<=not(Qtemp);
	end if;

end process;
end behaviour;

