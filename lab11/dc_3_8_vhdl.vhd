library ieee;
use ieee.std_logic_1164.all;
entity dc_3_8_vhdl is
port (
        a: in std_logic_vector (2 downto 0);
       en: in std_logic;
        q: out std_logic_vector (7 downto 0)
    );
end dc_3_8_vhdl;

architecture behavioral of dc_3_8_vhdl is
begin
    process (a)
    begin
        if en = '1' then
            case a is
                when "000" => q <= "00000001";
                when "001" => q <= "00000010";
                when "010" => q <= "00000100";
                when "011" => q <= "00001000";
                when "100" => q <= "00010000";
                when "101" => q <= "00100000";
                when "110" => q <= "01000000";
                when "111" => q <= "10000000";
                when others => q <= "00000000";
            end case;
        else q <= "00000000";
        end if;
    end process;
end behavioral;
