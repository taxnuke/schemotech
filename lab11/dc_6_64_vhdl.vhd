library ieee;
use ieee.std_logic_1164.all;

entity dc_6_64_vhdl is
port(
        inputs  : in  std_logic_vector (5 downto 0);
        enable  : in  std_logic;
        outputs : out std_logic_vector (63 downto 0)
    );
end dc_6_64_vhdl;

architecture behavioral of dc_6_64_vhdl is

    signal qs:std_logic_vector (7 downto 0);
    signal q:std_logic_vector (7 downto 0);

    component dc_3_8_vhdl
        port(
                 a : in  std_logic_vector (2 downto 0);
                en : in  std_logic;
                 q : out std_logic_vector (7 downto 0)
            );
    end component;

begin
    unit1: dc_3_8_vhdl
        port map (inputs(5 downto 3), enable, qs);
    unit2: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (0), outputs (7 downto 0));
    unit3: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (1), outputs (15 downto 8));
    unit4: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (2), outputs (23 downto 16));
    unit5: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (3), outputs (31 downto 24));
    unit6: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (4), outputs (39 downto 32));
    unit7: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (5), outputs (47 downto 40));
    unit8: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (6), outputs (55 downto 48));
    unit9: dc_3_8_vhdl
        port map (inputs(2 downto 0), qs (7), outputs (63 downto 56));
end behavioral;

configuration config of dc_6_64_vhdl is
    for behavioral
        for unit1, unit2, unit3, unit4, unit5, unit6, unit7, unit8, unit9: dc_3_8_vhdl
            use entity work.dc_3_8_vhdl (behav);
        end for;
    end for;
end config;







