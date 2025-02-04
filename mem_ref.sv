class mem_ref;
mem_tx tx;
bit[31:0] dataAA[int];

task run();
forever begin
	mem_common::mon2ref.get(tx);
	if(tx.wr_rd) begin
		dataAA[tx.addr] = tx.data;
	end
	else begin
		if(tx.data == dataAA[tx.addr])begin
			mem_common::match_count++;
		end
		else begin
			mem_common::mismatch_count++;
			$error("############## Mismatch #############");
		end

	end
end
endtask
endclass
