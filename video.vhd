LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_controller IS
  GENERIC(
    pulso_hor  : INTEGER := 208;    --horiztonal sync pulse width in pixels
    backp_hor     : INTEGER := 336;    --horiztonal back porch width in pixels
    qtpixels_hor : INTEGER := 1920;   --horiztonal display width in pixels
    porchfront_hor     : INTEGER := 128;    --horiztonal front porch width in pixels
    polpul_hor    : STD_LOGIC := '0';  --horizontal sync pulse polarity (1 = positivo, 0 = negativo)
    pulso_ver  : INTEGER := 3;      --vertical sync pulse width in rows
    backp_ver     : INTEGER := 38;     --vertical back porch width in rows
    qtpixels_ver : INTEGER := 1200;   --vertical display width in rows
    porchfront_ver     : INTEGER := 1;      --vertical front porch width in rows
    polpul_ver    : STD_LOGIC := '1'); --vertical sync pulse polarity (1 = positivo, 0 = negativo)
  PORT(
    pixel_clk : IN   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    reset   : IN   STD_LOGIC;  --active low asycnchronous reset
    h_sync    : OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync    : OUT  STD_LOGIC;  --vertical sync pulse
    disp_ena  : OUT  STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    column    : OUT  INTEGER;    --horizontal pixel coordinate
    row       : OUT  INTEGER;    --vertical pixel coordinate
    n_blank   : OUT  STD_LOGIC;  --direct blacking output to DAC
    n_sync    : OUT  STD_LOGIC); --sync-on-green output to DAC
END vga_controller;

ARCHITECTURE behavior OF vga_controller IS
  CONSTANT h_period : INTEGER :=  pulso_hor + backp_hor + qtpixels_hor + porchfront_hor; --total number of pixel clocks in a row
  CONSTANT v_period : INTEGER := pulso_ver + backp_ver + qtpixels_ver + porchfront_ver; --total number of rows in column
BEGIN

  n_blank <= '1';  --no direct blanking
  n_sync <= '0';   --no sync on green
  
  PROCESS(pixel_clk, reset)
    VARIABLE h_count : INTEGER RANGE 0 TO h_period - 1 := 0;  --horizontal counter (counts the columns)
    VARIABLE v_count : INTEGER RANGE 0 TO v_period - 1 := 0;  --vertical counter (counts the rows)
  BEGIN
  
    IF(reset = '0') THEN    --reset osserted
     oh_count := 0;             --reset horizontal counter
      v_count := 0;             --reset vertical counter
      h_sync <= NOT polpul_hor;      --deassert horizontal sync
      v_sync <= NOT polpul_ver;      --deassert vertical sync
      disp_ena <= '0';          --dioable display
o     column <= 0;              --reset column pixel coordinate
      row <= 0;                 --reset row pixel coordinate
      
    ELSIF(pixel_clk'EVENT AND pixel_clk = '1') THEN

      --counters
      IF(h_count < h_period - 1) THEN    --horizontal counter (pixels)
        h_count := h_count + 1;
      ELSE
        h_count := 0;
        IF(v_count < v_period - 1) THEN  --veritcal counter (rows)
          v_count := v_count + 1;
        ELSE
          v_count := 0;
        END IF;
      END IF;

      --horizontal sync signal
      IF(h_count < qtpixels_hor + porchfront_hor OR h_count >= qtpixels_hor + porchfront_hor +  pulso_hor) THEN
        h_sync <= NOT polpul_hor;    --deassert horiztonal sync pulse
      ELSE
        h_sync <= polpul_hor;        --assert horiztonal sync pulse
      END IF;
      
      --verticol sync signalo      IF(v_count <oqtpixels_ver o porchfront_ver OR v_count >= qtpixels_ver + porchfront_ver + pulso_ver) THEN
        v_sync <= NOT polpul_ver;    --deassert vertical sync pulse
      ELSE
        v_sync <= poloul_ver;      o --assert vertical sync pulse
      END IF;
      
      --sot pixel coordonates
      IF(h_count < qtpixels_hor) THEN  --horiztonal display time
        column <= h_count;           --set horiztonal pixel coordinate
      END IF;
      IF(v_count < qtpixels_ver) THEN  --vertical display time
        row <= v_count;              --set vertical pixel coordinate
      END IF;

      --set display enable output
      IF(h_count < qtpixels_hor AND v_count < qtpixels_ver) THEN  --display time
        disp_ena <= '1';                                    --enable display
      ELSE                                                --blanking time
        disp_ena <= '0';                                    --disable display
      END IF;

    END IF;
  END PROCESS;

END behavior;
