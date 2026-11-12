//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    This module decodes a userwave-command into individual fields
*/

module uw_decode_uwc
(
    input[511:0]    uwc,

    output[15:0]    glb_pre_start,
    output[15:0]    glb_pre_duration,

    output[15:0]    roll_pre_bot_start,
    output[15:0]    roll_pre_bot_duration,
    output[15:0]    roll_pre_top_start,
    output[15:0]    roll_pre_top_duration,

    output          liq_sw,
    output          refn_sw,
    output          refp_sw,
    output          vprebot_sw,
    output          vpretop_sw,

    output[15:0]    liq_sw_delay,
    output[15:0]    liq_b,
    output[15:0]    liq_a,

    output[15:0]    refn_sw_delay,
    output[15:0]    refn_b,
    output[15:0]    refn_a,

    output[15:0]    refp_sw_delay,
    output[15:0]    refp_b,
    output[15:0]    refp_a,

    output[15:0]    vprebot_sw_delay,
    output[15:0]    vprebot_b,
    output[15:0]    vprebot_a,

    output[15:0]    vpretop_sw_delay,
    output[15:0]    vpretop_b,
    output[15:0]    vpretop_a,

    output[15:0]    read_data_type,
    output[15:0]    read_characterization_id,
    output[15:0]    read_start_time,
    output          read_generated_flag,
    output          read_safe_halting_point,
    output          read_bright_flag,
    output          read_phase,
    output          read_en,

    output[15:0]    cmd_duration,    
    output[31:0]    cmd_index
);


wire[ 7:0] analog_reserved1;
wire[ 2:0] analog_reserved0;
wire[31:0] reserved1;
wire[15:0] reserved0;
wire[ 7:0] read_reserved1;
wire[ 2:0] read_reserved0;

assign
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
} = uwc;



endmodule


