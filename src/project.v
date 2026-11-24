/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_design_project_IEEE(
	input clk,				//Señal de reloj
	input rst_n,			//SEñal de reset
    input [1:0]		ui_in,    //Señal de entradas y cambio de direcciones
	output reg [7:0]	uio_out		//salidas
);
	always @(posedge clk,negedge rst_n)
		begin
			if (!rst_n)
				uio_out <= 8'b00000000;
			else 
			begin
				if (ui_in [1])
					uio_out <= {uio_out[6:0],(uio_out[7] | ui_in[0])};
				else
					uio_out <= {(ui_in [0] | uio_out[0]),uio_out[7:1]};
			end
		end

endmodule
