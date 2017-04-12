library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jkrstr_vhdl is
port ( j, k, s,r : in std_logic;
       q         : out std_logic;
       qi        : out std_logic
   );
end jkrstr_vhdl;

architecture behav of jkrstr_vhdl is
signal jk    : std_logic_vector(1 downto 0) := "00";
signal qsig  : std_logic                    := 'X';

begin
    jk  <= j & k;
    process(r,s)
    begin
        wait until s='0';
        if (r = '0')then
            qsig <='0';
        elsif (s = '0') then
            qsig <='1';
        else
            case (jk) is
                when "11"   => qsig <= not qsig;
                when "01"   => qsig <= '0';
                when "10"   => qsig <= '1';
                when others => qsig <= qsig;
            end case;
        end if;
    end process;

    q <= qsig;
    qi <= not qsig;
end behav;
