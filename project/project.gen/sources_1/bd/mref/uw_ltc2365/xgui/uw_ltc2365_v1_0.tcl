# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "FREQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HALF_SCK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INIT_DELAY" -parent ${Page_0}


}

proc update_PARAM_VALUE.FREQ { PARAM_VALUE.FREQ } {
	# Procedure called to update FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FREQ { PARAM_VALUE.FREQ } {
	# Procedure called to validate FREQ
	return true
}

proc update_PARAM_VALUE.HALF_SCK { PARAM_VALUE.HALF_SCK } {
	# Procedure called to update HALF_SCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HALF_SCK { PARAM_VALUE.HALF_SCK } {
	# Procedure called to validate HALF_SCK
	return true
}

proc update_PARAM_VALUE.INIT_DELAY { PARAM_VALUE.INIT_DELAY } {
	# Procedure called to update INIT_DELAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT_DELAY { PARAM_VALUE.INIT_DELAY } {
	# Procedure called to validate INIT_DELAY
	return true
}


proc update_MODELPARAM_VALUE.HALF_SCK { MODELPARAM_VALUE.HALF_SCK PARAM_VALUE.HALF_SCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HALF_SCK}] ${MODELPARAM_VALUE.HALF_SCK}
}

proc update_MODELPARAM_VALUE.FREQ { MODELPARAM_VALUE.FREQ PARAM_VALUE.FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FREQ}] ${MODELPARAM_VALUE.FREQ}
}

proc update_MODELPARAM_VALUE.INIT_DELAY { MODELPARAM_VALUE.INIT_DELAY PARAM_VALUE.INIT_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT_DELAY}] ${MODELPARAM_VALUE.INIT_DELAY}
}

