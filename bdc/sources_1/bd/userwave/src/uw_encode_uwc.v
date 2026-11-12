//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    This module encodes a userwave-command from individual fields
*/

module uw_encode_uwc
(
    output[511:0]  uwc,

    input[15:0]    glb_pre_start,
    input[15:0]    glb_pre_duration,

    input[15:0]    roll_pre_bot_start,
    input[15:0]    roll_pre_bot_duration,
    input[15:0]    roll_pre_top_start,
    input[15:0]    roll_pre_top_duration,

    input          liq_sw,
    input          refn_sw,
    input          refp_sw,
    input          vprebot_sw,
    input          vpretop_sw,

    input[15:0]    liq_sw_delay,
    input[15:0]    liq_b,
    input[15:0]    liq_a,

    input[15:0]    refn_sw_delay,
    input[15:0]    refn_b,
    input[15:0]    refn_a,

    input[15:0]    refp_sw_delay,
    input[15:0]    refp_b,
    input[15:0]    refp_a,

    input[15:0]    vprebot_sw_delay,
    input[15:0]    vprebot_b,
    input[15:0]    vprebot_a,

    input[15:0]    vpretop_sw_delay,
    input[15:0]    vpretop_b,
    input[15:0]    vpretop_a,

    input[15:0]    read_data_type,
    input[15:0]    read_characterization_id,
    input[15:0]    read_start_time,
    input          read_generated_flag,
    input          read_safe_halting_point,
    input          read_bright_flag,
    input          read_phase,
    input          read_en,

    input[15:0]    cmd_duration,    
    input[31:0]    cmd_index
);


wire[ 7:0] analog_reserved1 = 0;
wire[ 2:0] analog_reserved0 = 0;
wire[31:0] reserved1        = 0;
wire[15:0] reserved0        = 0;
wire[ 7:0] read_reserved1   = 0;
wire[ 2:0] read_reserved0   = 0;

assign uwc = 
{
    glb_pre_start,
    glb_pre_duration,
    roll_pre_bot_start,
    roll_pre_bot_duration,
    roll_pre_top_start,
    roll_pre_top_duration,
    analog_reserved1,
    analog_reserved0,
    liq_sw,
    refn_sw,
    refp_sw,
    vprebot_sw,
    vpretop_sw,
    liq_sw_delay,
    liq_b,
    liq_a,
    refn_sw_delay,
    refn_b,
    refn_a,
    refp_sw_delay,
    refp_b,
    refp_a,
    vprebot_sw_delay,
    vprebot_b,
    vprebot_a,
    vpretop_sw_delay,
    vpretop_b,
    vpretop_a,
    reserved1,
    reserved0,
    read_data_type,
    read_characterization_id,
    read_start_time,
    read_reserved1,
    read_reserved0,
    read_generated_flag,
    read_safe_halting_point,
    read_bright_flag,
    read_phase,
    read_en,
    cmd_duration,    
    cmd_index
};

endmodule


