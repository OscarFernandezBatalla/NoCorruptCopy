# NoCorruptCopy
This repository contains a PowerShell script that ensures all files are correctly copied from a source directory to a destination directory, while verifying file integrity by comparing checksums after copying. Prevents file corruption when copying large amounts of data.

## Prerequisites

This script requires PowerShell to be installed on the system.

## How to Use

1. Download the script to your computer.

2. Open a PowerShell console and navigate to the directory where the script is located.

3. Run the script by typing the following command and pressing Enter:
    
    ```
    .\copy_files.ps1 -SourcePath "C:\path\to\source\directory" -DestPath "D:\path\to\destination\directory"
    ```

    Replace `"C:\path\to\source\directory"` with the path to the directory you want to copy from, and `"D:\path\to\destination\directory"` with the path to the directory you want to copy to.

4. The script will copy all files from the source directory to the destination directory. If a file already exists in the destination directory, the script will compare the checksums of the original and copied files to ensure that they match. If the checksums do not match, the file will be copied again until the checksums match.

5. A progress bar will display the total number of files copied.

## License

This script is licensed under the [MIT License](LICENSE). 

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.