CREATE TABLE IF NOT EXISTS liquidity_pools (pool_address String,slot UInt64,block_time DateTime64(3),amm_id String,token_a_mint String,token_b_mint String,token_a_amount UInt64,token_b_amount UInt64,token_a_price_usd Float64,token_b_price_usd Float64,tvl_usd Float64,fee_rate Float64,volume_24h_usd Float64,apy_24h Float64) ENGINE = ReplacingMergeTree PRIMARY KEY (pool_address,slot);

CREATE TABLE IF NOT EXISTS pool_swaps (signature String,slot UInt64,block_time DateTime64(3),pool_address String,user_account String,token_in_mint String,token_out_mint String,token_in_amount UInt64,token_out_amount UInt64,token_in_price_usd Float64,token_out_price_usd Float64,fee_amount UInt64,program_id String) ENGINE = ReplacingMergeTree PRIMARY KEY (signature,pool_address);

CREATE TABLE IF NOT EXISTS lending_markets (market_address String,slot UInt64,block_time DateTime64(3),protocol_id String,asset_mint String,c_token_mint String,total_deposits UInt64,total_borrows UInt64,deposit_rate Float64,borrow_rate Float64,utilization_rate Float64,liquidation_threshold Float64,ltv_ratio Float64,asset_price_usd Float64,tvl_usd Float64) ENGINE = ReplacingMergeTree PRIMARY KEY (market_address,slot);

CREATE TABLE IF NOT EXISTS lending_positions (position_address String,slot UInt64,block_time DateTime64(3),market_address String,owner String,deposit_amount UInt64,borrow_amount UInt64,collateral_amount UInt64,liquidation_threshold Float64,health_factor Float64) ENGINE = ReplacingMergeTree PRIMARY KEY (position_address,slot);

CREATE TABLE IF NOT EXISTS perpetual_markets (market_address String,slot UInt64,block_time DateTime64(3),protocol_id String,base_token_mint String,quote_token_mint String,base_price_usd Float64,mark_price_usd Float64,index_price_usd Float64,funding_rate Float64,open_interest UInt64,volume_24h_usd Float64,base_deposit_total UInt64,quote_deposit_total UInt64) ENGINE = ReplacingMergeTree PRIMARY KEY (market_address,slot);

CREATE TABLE IF NOT EXISTS perpetual_positions (position_address String,slot UInt64,block_time DateTime64(3),market_address String,owner String,position_size Int64,entry_price Float64,liquidation_price Float64,unrealized_pnl Float64,realized_pnl Float64,collateral_amount UInt64,leverage Float64) ENGINE = ReplacingMergeTree PRIMARY KEY (position_address,slot);

CREATE TABLE IF NOT EXISTS defi_events (signature String,slot UInt64,block_time DateTime64(3),protocol_id String,event_type String,user_account String,market_address String,token_a_mint String,token_b_mint String,token_a_amount UInt64,token_b_amount UInt64,token_a_price_usd Float64,token_b_price_usd Float64,fee_amount UInt64) ENGINE = ReplacingMergeTree PRIMARY KEY (signature,protocol_id,event_type);

CREATE TABLE IF NOT EXISTS defi_analytics (protocol_id String,slot UInt64,block_time DateTime64(3),tvl_usd Float64,volume_24h_usd Float64,fee_24h_usd Float64,unique_users_24h UInt32,transaction_count_24h UInt32,revenue_24h_usd Float64) ENGINE = SummingMergeTree PRIMARY KEY (protocol_id,slot);
