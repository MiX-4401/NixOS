{ pkgs, ... }:

pkgs.mkShell {
    packages = with pkgs; [
        file        # Print file metadata
        unzip       # Extract compressed files in format .zip 
        gnutar      # Extract compressed files in format .tar 
        gzip        # Extract compressed files in format .gz 
        zstd        # Extract compressed files in format .zstd 
	    yazi	    # TUI file manager
        xxd         # Hex dump viewer
        libewf      # Forensics tool suite
        sleuthkit   # Forensics tool suite
    ];
}
