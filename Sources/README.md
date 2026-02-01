# ARCHITECTURE
```
RISC_Plunne/
└─ Sources/
   │
   ├─ rtl/                 # All CPU VHDL modules
   │   │
   │   ├─ libarith/        # Arithmetic Library
   │   ├─ libriscp/        # Main Library
   │   │
   │   ├─ mux/             # Multiplexers
   │   │
   │   ├─ core.vhd         # Core (top-level integration)
   │   ├─ alu.vhd          # Arithmetic Logical Unit
   │   ├─ bcu.vhd          # Branch Control Unit
   │   ├─ dmem.vhd         # Data Memory
   │   ├─ idcd.vhd         # Instruction Decode
   │   ├─ imem.vhd         # Instruction Memory
   │   ├─ immu.vhd         # Immediate Unit
   │   ├─ pc.vhd           # Program Counter
   │   └─ regf.vhd         # Register File
   │
   ├─ sim/                 # All Testbenches files
   │   │
   │   ├─ tb_utils/        # Testbenches utilities
   │   ├─ tb_mux/          # Multiplexers testbenches
   │   │
   │   ├─ tb_core.vhd
   │   ├─ tb_alu.vhd
   │   ├─ tb_bcu.vhd
   │   ├─ tb_dmem.vhd
   │   ├─ tb_idcd.vhd
   │   ├─ tb_imem.vhd
   │   ├─ tb_immu.vhd
   │   ├─ tb_pc.vhd
   │   └─ tb_regf.vhd
   │
   └─ RISC_Plunne.xpr      # Vivado project file
```