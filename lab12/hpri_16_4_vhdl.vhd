library ieee;
use ieee.std_logic_1164.all;

entity hpri_16_4_vhdl is
port(
         r : in std_logic_vector(0 to 15);
        ei : in std_logic;
         a : out std_logic_vector(0 to 3);
         g : out std_logic
     );
end hpri_16_4_vhdl;

architecture behavior of hpri_16_4_vhdl is
component hpri_8_3_vhdl
port(
        r  : in std_logic_vector(0 to 7);
        ei : in std_logic;
         g : inout std_logic;
        eo : inout std_logic;
         a : inout std_logic_vector(0 to 2)
     );
end component;

component my_or2
port(
        a : in std_logic;
        b : in std_logic;
        c : inout std_logic
     );
end component;

component my_not
port(
        d  : in std_logic;
        nd : inout std_logic
    );
end component;

signal sig1, sig2, sig3, sig4, sig5 : std_logic;
signal sig6, sig7                  : std_logic_vector(0 to 2);
signal sig8                        : std_logic_vector(0 to 3);

begin
hpri_1:hpri_8_3_vhdl
    port map(r(0 to 7), sig4,  sig1, sig2, sig6);
hpri_2:hpri_8_3_vhdl
    port map(r(8 to 15), ei, sig3, sig4, sig7);
or2_1:my_or2
    port map(sig6(0), sig7(0), sig8(0));
or2_2:my_or2
    port map(sig6(1), sig7(1), sig8(1));
or2_3:my_or2
    port map(sig6(2), sig7(2), sig8(2));
not_1:my_not
    port map(sig4, sig8(3));
or2_4:my_or2
    port map(sig1, sig3, sig5);

a(0)<=sig8(0);
a(1)<=sig8(1);
a(2)<=sig8(2);
a(3)<=sig8(3);
g<=sig5;

end behavior;

configuration con of hpri_16_4_vhdl is
    for behavior
        for hpri_1, hpri_2:hpri_8_3_vhdl
            use entity work.hpri_8_3_vhdl(behavior);
        end for;

        for or2_1, or2_2, or2_3, or2_4:my_or2
            use entity work.my_or2(behavior);
        end for;

        for not_1:my_not
            use entity work.my_not(behavior);
        end for;
    end for;
end con;
