###############################################################################
#                                                                             #
# Copyright 2016 myStorm Copyright and related                                #
# rights are licensed under the Solderpad Hardware License, Version 0.51      #
# (the “License”); you may not use this file except in compliance with        #
# the License. You may obtain a copy of the License at                        #
# http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       #
# law or agreed to in writing, software, hardware and materials               #
# distributed under this License is distributed on an “AS IS” BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             #
# implied. See the License for the specific language governing                #
# permissions and limitations under the License.                              #
#                                                                             #
###############################################################################

.PHONY: upload
upload: rtl/top.v  rtl/VgaSyncGen.v fpga/blackice-mx.pcf
	yosys -q -p "synth_ice40 -json top.json" rtl/top.v rtl/VgaSyncGen.v 
	nextpnr-ice40 --hx8k --package tq144:4k --pcf fpga/blackice-mx.pcf  --json top.json --asc top.txt --freq 25
	icepack top.txt top.bin
	#stty -F /dev/ttyACM0 raw
	cat top.bin >/dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f top.json top.txt top.ex top.bin
