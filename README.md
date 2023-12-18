# climit
# PowerShell CPU Monitor

This PowerShell script monitors CPU usage and takes action if it exceeds a specified threshold. If the CPU usage remains at or above the threshold for 2 minutes, it executes another PowerShell script (`cpu.ps1`).

## Usage

1. Ensure PowerShell is installed on your system.
2. Clone this repository:

    ```bash
    git clone https://github.com/marz-hunter/climit.git
    ```

3. Navigate to the cloned directory:

    ```bash
    cd climit
    ```

4. Run the `cpumonitor.ps1` script:

    ```powershell
    .\cpumonitor.ps1
    ```

## Configuration

Customize the following parameters in the script:

- `$threshold`: CPU usage threshold that triggers the action.
- `$waitTime`: Time to wait (in seconds) before executing `chromelimit.ps1` if CPU usage remains high.

## Important Note

Adjust file paths and script names according to your project structure and requirements.

## License

This project is licensed under the [MIT License](LICENSE).
