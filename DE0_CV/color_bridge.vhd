LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY COLOR_BRIDGE IS
	PORT(
			CLK : IN STD_LOGIC;
			RST : IN STD_LOGIC;
			BRG_EN : IN STD_LOGIC;
			COLOR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			R : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COLOR_BRIDGE;

ARCHITECTURE main OF COLOR_BRIDGE IS
BEGIN
	PROCESS(CLK, RST)
	BEGIN
		IF(RST = '1') THEN
			R <= "0000";
		ELSIF(CLK'EVENT AND CLK = '1') THEN
			IF(BRG_EN = '1') THEN
				CASE COLOR(7 DOWNTO 5) IS
					WHEN "000" =>
						R <= "0000";
					WHEN "001" =>
						R <= "0010";
					WHEN "010" =>
						R <= "0100";
					WHEN "011" =>
						R <= "0110";
					WHEN "100" =>
						R <= "1000";
					WHEN "101" =>
						R <= "1010";
					WHEN "110" =>
						R <= "1100";
					WHEN "111" =>
						R <= "1111";
				END CASE;
			ELSE
				R <= "0000";
			END IF;
		END IF;
	END PROCESS;

	PROCESS(CLK, RST)
	BEGIN
		IF(RST = '1') THEN
			G <= "0000";
		ELSIF(CLK'EVENT AND CLK = '1') THEN
			IF(BRG_EN = '1') THEN
				CASE COLOR(4 DOWNTO 2) IS
					WHEN "000" =>
						G <= "0000";
					WHEN "001" =>
						G <= "0010";
					WHEN "010" =>
						G <= "0100";
					WHEN "011" =>
						G <= "0110";
					WHEN "100" =>
						G <= "1000";
					WHEN "101" =>
						G <= "1010";
					WHEN "110" =>
						G <= "1100";
					WHEN "111" =>
						G <= "1111";
				END CASE;
			ELSE
				G <= "0000";
			END IF;
		END IF;
	END PROCESS;

	PROCESS(CLK, RST)
	BEGIN
		IF(RST = '1') THEN
			B <= "0000";
		ELSIF(CLK'EVENT AND CLK = '1') THEN
			IF(BRG_EN = '1') THEN
				CASE COLOR(1 DOWNTO 0) IS
					WHEN "00" =>
						B <= "0000";
					WHEN "01" =>
						B <= "0101";
					WHEN "10" =>
						B <= "1010";
					WHEN "11" =>
						B <= "1111";
				END CASE;
			ELSE
				B <= "0000";
			END IF;
		END IF;
	END PROCESS;

END main;
