# Cargo is optional; non-interactive shells must also work without Rust installed.
if [[ -r "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
