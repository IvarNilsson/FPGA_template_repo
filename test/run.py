from vunit import VUnit
from pathlib import Path
import sys
sys.path.append("/home/$USER/Utilities/vunit") # add your vunit path


# NOTE: Path to directory containing this file
ROOT = Path(__file__).parent

# Stop using the builtins ahead of time.vu.add_vhdl_builtins() #new for version 5 VUnit
vu = VUnit.from_argv(compile_builtins=False)
# vu = VUnit.from_argv()  # Stop using the builtins ahead of time.vu.add_vhdl_builtins() #new for version 5 VUnit
# vu.set_sim_option('ghdl.gtkwave_script.gui', 'gtkWave.tcl')

vu.add_vhdl_builtins()  # new for version 5 VUnit
# vu.add_verilog_builtins()

lib = vu.add_library("lib")
lib.add_source_files(ROOT.glob("test/*.vhd"))  # VHDL
lib.add_source_files(ROOT.glob("src/*.vhd"))
# lib.add_source_files(ROOT.glob("test/*.sv"))
# lib.add_source_files(ROOT.glob("src/*.sv"))

for l in lib.get_test_benches():
    wave = ROOT.joinpath("test", "wave", f"{l.name}.tcl")
    l.set_sim_option("ghdl.gtkwave_script.gui", str(
        wave) if wave.is_file() else str(ROOT / "gtkwave.tcl"))
vu.main()
