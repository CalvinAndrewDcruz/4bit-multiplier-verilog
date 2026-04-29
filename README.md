# 🚀 4-bit Multiplier Design in Verilog HDL

## 📌 Overview

This project implements a **4-bit binary multiplier** using multiple RTL design approaches in Verilog HDL. It demonstrates how the same functionality can be realized using different hardware architectures, ranging from simple behavioral modeling to optimized high-speed designs.

---

## 🧠 Architectures Implemented

### 1️⃣ Behavioral Multiplier

* Uses high-level `+` operator
* Simple and easy to implement
* Not hardware-optimized

### 2️⃣ Structural Multiplier

* Built using **Half Adders and Full Adders**
* Models actual hardware datapath
* Demonstrates hierarchical and structural design

### 3️⃣ Carry Save Multiplier (CSA) ⚡

* High-speed architecture
* Reduces carry propagation delay
* Uses parallel compression (carry-save technique)

---

## ⚙️ Features

* ✅ Multiple design architectures in a single project
* ✅ Modular RTL design (reusable components)
* ✅ Clean and readable Verilog code
* ✅ Self-checking testbenches
* ✅ Verified for multiple test cases
* ✅ Synthesizable design

---

## 🧩 Design Explanation

### 🔹 Partial Product Generation

Each bit of the multiplier is ANDed with the multiplicand to generate partial products.

### 🔹 Shifting Mechanism

Partial products are shifted based on bit position to align them correctly.

### 🔹 Addition Stage

* Behavioral: Direct addition using `+`
* Structural: Uses Half Adders and Full Adders
* CSA: Uses carry-save technique to minimize delay

---

## 🧪 Verification

* Functional verification done using **testbenches**
* Multiple test cases used:

  * Normal cases (e.g., 3×2, 7×3)
  * Edge cases (e.g., 15×15, 0×9)
* Self-checking logic compares:

  Expected Output = `A * B`

---

## 📊 Sample Results

| A  | B  | Output |
| -- | -- | ------ |
| 3  | 2  | 6      |
| 7  | 3  | 21     |
| 15 | 15 | 225    |
| 0  | 9  | 0      |

---

## 📁 Project Structure

```
4bit-multiplier-verilog/
│
├── rtl/
│   ├── multiplier_4bit_behavioral.v
│   ├── multiplier_4bit_structural.v
│   ├── multiplier_4bit_csa.v
│   ├── full_adder.v
│   └── half_adder.v
│
├── tb/
│   ├── tb_behavioral.v
│   ├── tb_structural.v
│   └── tb_csa.v
│
├── sim/
│   ├── waveforms.png
│   └── output_log.txt
│
└── README.md
```

---

## 🔧 Tools Used

* Verilog HDL
* ModelSim / QuestaSim
* Icarus Verilog (for simulation)
* GTKWave (for waveform viewing)

---

## 🧠 Key Learning Outcomes

* Understanding of binary multiplication at hardware level
* Difference between behavioral and structural modeling
* Carry propagation vs carry-save optimization
* Designing modular and hierarchical RTL systems
* Writing self-checking testbenches

---

## 🚀 Future Improvements

* Implement **Wallace Tree Multiplier**
* Add **pipelining for higher performance**
* Perform **timing analysis and synthesis**
* Extend design to **8-bit / 16-bit multipliers**

---

## 👨‍💻 Author

**Calvin Dcruz**
BSc Electronics | Aspiring VLSI Engineer

---

## ⭐ If you found this useful

Feel free to star ⭐ the repository and connect with me!
