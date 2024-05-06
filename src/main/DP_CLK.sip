set_global_assignment -entity "DP_CLK" -library "lib_DP_CLK" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "DP_CLK" -library "lib_DP_CLK" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "DP_CLK" -library "lib_DP_CLK" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_DP_CLK" -name SPD_FILE [file join $::quartus(sip_path) "DP_CLK.spd"]

set_global_assignment -library "lib_DP_CLK" -name MISC_FILE [file join $::quartus(sip_path) "DP_CLK_sim/DP_CLK.vho"]
