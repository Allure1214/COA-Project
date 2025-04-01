# Assembly Language Average Calculation Program

This is an Assembly Language program that calculates the average of three user-input numbers. The program handles input validation, rejects invalid characters, and performs basic arithmetic operations. The user can continue calculating averages or exit the program by pressing 'q'.

## Features
- User can input three numbers (integers).
- The program calculates the average of the three numbers.
- Handles invalid input (non-numeric values) and prompts the user to re-enter valid data.
- The average result is rounded to the nearest integer.
- Allows the user to continue calculating averages or exit the program.

## Requirements
- **MASM (Microsoft Macro Assembler)** version 6.0 or later.
- **Irvine32 Library** (used for I/O operations and more).
- A Windows machine with MASM and Irvine32 installed.

## Installation
### Step 1: Install MASM
- Download and install MASM if you haven't already. You can find the MASM tools at Microsoft's website or other trusted sources.

### Step 2: Download the Irvine32 Library
- You can find the Irvine32 library and the necessary files in [this repository](https://github.com/DrPaulBrewer/Irvine-32).
- Download and place the `Irvine32.inc` file into the same directory as your `.asm` files.

### Step 3: Setup the Project
1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/your-username/average-calculation-assembly.git
    ```
2. Place the `Irvine32.inc` file in the same directory as your source code.

## Usage
### Running the Program
1. Open a command prompt in the project folder.
2. Assemble and link the program using MASM:
    ```bash
    ml /c /nologo /Zi /Fo "Debug\main.obj" /I "C:\Irvine" /W3 /errorReport:prompt main.asm
    link /subsystem:console main.obj
    ```
3. Run the program:
    ```bash
    Debug\main.exe
    ```

### Program Behavior:
- The program will prompt you to enter three numbers (integers).
- If any input is invalid (non-numeric characters or incorrect format), you will be prompted again until valid input is entered.
- The average of the three numbers will be calculated and displayed.
- The result is rounded to the nearest integer.
- After displaying the result, you can either continue with new inputs or press 'q' to quit the program.
