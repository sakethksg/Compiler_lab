
# How to Run the Code (Linux)

This guide explains how to run each question's code in this project on a Linux system.

## Prerequisites
- Ensure you have `flex` (or `lex`) and `gcc` installed:
  ```sh
  sudo apt update
  sudo apt install flex gcc
  ```

---

## Question 1

### Lex File: `q1.l`
1. Generate C code from the Lex file:
   ```sh
   flex q1.l
   ```
2. Compile the generated C code:
   ```sh
   gcc lex.yy.c -o q1_lex -lfl
   ```
3. Run the executable:
   ```sh
   ./q1_lex
   ```

### C File: `q1.c`
1. Compile the C file:
   ```sh
   gcc q1.c -o q1_c
   ```
2. Run the executable:
   ```sh
   ./q1_c
   ```

---

## Question 2

### Lex File: `q2.l`
1. Generate C code from the Lex file:
   ```sh
   flex q2.l
   ```
2. Compile the generated C code:
   ```sh
   gcc lex.yy.c -o q2_lex -lfl
   ```
3. Run the executable:
   ```sh
   ./q2_lex
   ```

### C File: `q2.c`
1. Compile the C file:
   ```sh
   gcc q2.c -o q2_c
   ```
2. Run the executable:
   ```sh
   ./q2_c
   ```

---

## Question 3

### Lex File: `q3.l`
1. Generate C code from the Lex file:
   ```sh
   flex q3.l
   ```
2. Compile the generated C code:
   ```sh
   gcc lex.yy.c -o q3_lex -lfl
   ```
3. Run the executable:
   ```sh
   ./q3_lex
   ```

### C File: `q3.c`
1. Compile the C file:
   ```sh
   gcc q3.c -o q3_c
   ```
2. Run the executable:
   ```sh
   ./q3_c
   ```

---

## Additional Lex Files

For the following files, repeat the steps below for each file (`l1.l`, `l2.l`, `l3.l`, `l4.l`):

1. Generate C code from the Lex file:
   ```sh
   flex filename.l
   ```
2. Compile the generated C code:
   ```sh
   gcc lex.yy.c -o filename_lex -lfl
   ```
3. Run the executable:
   ```sh
   ./filename_lex
   ```

---

## Notes
- If your code requires input files, provide them as needed (e.g., `./q1_lex < input.txt`).
- The `-lfl` flag links the Flex library required for Lex programs.
- Make sure to run commands in the directory containing the files.

---

For any issues, ensure you have the necessary permissions and that the files are present in your working directory.
