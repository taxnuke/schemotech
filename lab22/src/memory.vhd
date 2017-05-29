USE work.dp32_types.all,work.alu_32_types.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity memory is
	generic (Tpd	:Time:= unit_delay);
	port (	d_bus	:inout bus_bit_32 bus;
			a_bus	:in  bit_32;
			read	:in  std_logic;
			write	:in  std_logic;
			ready	:out std_logic);
end  memory;
ARCHITECTURE behaviour OF memory IS
begin
	process
		constant  low_address :integer :=0;
		constant high_address :integer :=65535;
		type memory_array is 
			array(integer range low_address to high_address)of bit_32;
		variable address : integer:=0;
		variable mem :memory_array:=
			(
X"1002_0216",
X"1003_0300",
X"1004_0404",
X"1001_0807",
X"3101_0201",
X"1001_0804",
X"3101_0202",
X"1001_0805",
X"3101_0203",
X"1001_0806",
X"3101_0204",
X"1001_0808",
X"3101_0205",
X"1002_0201",
X"3005_0200",
X"1003_0301",
X"1002_0201",
X"3006_0200",
X"0101_0506",
X"500A_0001",
X"1005_0600",
X"0101_0403",
X"5001_00F8",
			 others =>X"0000_0000");
	begin
		--
 		-- put d_bus and reply into initial state
		--
		d_bus <=null after Tpd;
		ready <='0' after Tpd;
		--
		-- wait for a command
		--
		wait until (read='1')or(write='1');
		--
		-- dispatch read or write cycle
		--
		address := bits_to_int(a_bus);
		if address >=low_address and address <=high_address then
			-- address match for this memory
			if write ='1' then
				ready<='1' after Tpd;
				wait until write='0'; -- wait until end of write cycle
				mem(address):=d_bus'delayed(Tpd); -- sample data from Tpd ago
			else  -- read='1'
				d_bus <= mem(address) after Tpd;	-- fetch data
				ready <='1' after Tpd;
				wait until read='0'; -- hold for read cycle
			end if;
		end if;
	end process;		
end behaviour;						

