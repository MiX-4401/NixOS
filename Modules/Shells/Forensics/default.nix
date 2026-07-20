{ pkgs, ... }:

pkgs.mkShell {
    packages = with pkgs; [
        libewf      # Forensics tool suite
        sleuthkit   # Forensics tool suite
        testdisk    # Data recovery tool suite
        unzip       # Extract compressed files in format .zip 
        gnutar      # Extract compressed files in format .tar 
        gzip        # Extract compressed files in format .gz 
        zstd        # Extract compressed files in format .zstd 
        _7zz        # Extract compressed files in format .7z 
	    yazi	    # TUI file manager
        xxd         # Hex dump viewer
        file        # Print file metadata
        bc          # TUI calculator
    ];
}
