library ieee;
use ieee.std_logic_1164.all;

entity dc38_vhdl is
port(
    a0, a1, a2 : in std_logic;
    q0,q1,q2,q3,q4,q5,q6,q7 : out std_logic);
end dc38_vhdl;

architecture behaviour of dc_3_8_vhdl is
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

