# FPGA_template_repo

This is a template repository that works well for my current workflow.

## VHDL

VHDL is compiled using GHDL and TBs are writen for VUnit. Waveforms are ploted in GTK-Wave.

## Verilog/SystemVerilog

SystemVerilog and Verilog is compiled using verilator and testbenches are writen in C++. Waveforms are also ploted in GTK-Wave.
ToDo: Make TBs in SystemVerilog
ToDo: Make Dut and scoreboard setup

## Building bitsterams

TCL scripts and Vivado are used to build bitstreams and program devices.
ToDo: Make script to intigrate wiht <https://github.com/acoustic-warfare/zybo-rt-sampler>

# Install

Versions:
**OS: Ubuntu 22.04**
**GHDL 4.1.0**
**VUnit 5.0.0.dev2**

### zsh and general

```Shell
sudo apt install curl wget git htop zsh
cat /etc/shells
echo $SHELL
command -v zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
```

```Shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo apt install fonts-powerline
```

### aactivator

```Shell
install .deb file from github releases
sudo apt install /home/$USER/Downloads/aactivator_2.0.0_all.deb
sudo apt install pip
sudo apt install mlocate
sudo apt autoremove
pip install --upgrade virtualenv
Go to the project directory and run the last command:
virtualenv -p python3 venv
chmod -R og-w $HOME
```

### General RTL

```Shell
sudo apt install gtkwave
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
```

### Icarcus Verilog

```Shell
sudo apt install verilog
```

### GHDL

```Shell
sudo apt install gnat
mv /home/$USER/Downloads/ghdl-gha-ubuntu-22.04-mcode/ /home/$USER/Downloads/ghdl/
sudo mv /home/$USER/Downloads/ghdl /usr/lib
mkdir /usr/lib/ghdl/mcode
cp /usr/lib/ghdl/lib/ghdl /usr/lib/ghdl/mcode -r
mv /usr/lib/ghdl/mcode/ghdl /usr/lib/ghdl/mcode
mv /usr/lib/ghdl/mcode/ghdl /usr/lib/ghdl/mcode/vhdl
```

### VUnit

```Shell
git clone --recurse-submodules https://github.com/VUnit/vunit.git
cd vunit
sudo python3 setup.py install
```
