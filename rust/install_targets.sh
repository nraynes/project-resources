# Installs linkers and targets for Rust for all the major operating systems.

# Install linker for linux.
brew install x86_64-unknown-linux-gnu-gcc

# Install linker for windows.
brew install mingw-w64

# Add targets for major OSs.
rustup target add x86_64-unknown-linux-gnu
rustup target add aarch64-apple-darwin
rustup target add x86_64-apple-darwin
rustup target add x86_64-pc-windows-gnu
