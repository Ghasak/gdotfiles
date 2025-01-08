# Update Utilities

## HomeBrew Update

To clean up and free space on your disk when using Homebrew, you can follow
these steps and run the commands provided:

---

### 1. **Remove Unused Packages**

Remove outdated or unused formulae and their dependencies:

```bash
brew autoremove
```

This will clean up dependencies that are no longer required by any installed formula.

---

### 2. **Cleanup Unused Files**

Remove old versions of installed formulae and clear caches:

```bash
brew cleanup
```

You can see how much space this will free up by running:

```bash
brew cleanup -n
```

---

### 3. **Purge Download Cache**

Homebrew stores cached files for installations. You can delete them to free up space:

```bash
rm -rf $(brew --cache)
```

---

### 4. **Uninstall Unused Formulae**

List installed formulae and uninstall ones you no longer need:

```bash
brew list
brew uninstall <formula>
```

For example, uninstall Ruby if you’re not using it:

```bash
brew uninstall ruby
```

---

### 5. **Uninstall Unused Casks**

List and uninstall unused applications installed via Homebrew Cask:

```bash
brew list --cask
brew uninstall --cask <cask-name>
```

---

### 6. **Remove Unused Taps**

If you’ve added extra taps (repositories) that you’re not using, remove them:

```bash
brew tap
brew untap <tap-name>
```

---

### 7. **Check Disk Usage**

See the disk space used by Homebrew’s installations:

```bash
brew --cellar
du -sh $(brew --cellar)/*
```

---

### 8. **Remove Logs**

Clear Homebrew logs to free up additional space:

```bash
rm -rf $(brew --prefix)/var/log
```

---

### 9. **Delete Temporary Build Files**

Clear temporary files used during builds:

```bash
rm -rf /private/tmp/*
```

---

### 10. **Audit Homebrew Installation**

Check for issues or unnecessary files in your Homebrew setup:

```bash
brew doctor
brew missing
```

Resolve issues and remove unnecessary files based on the output.

---

### Bonus: **Automate Cleanup**

Create a script to run these commands periodically:

```bash
echo 'brew autoremove && brew cleanup && rm -rf $(brew --cache)' > ~/brew-cleanup.sh
chmod +x ~/brew-cleanup.sh
```

Run it when needed:

```bash
./brew-cleanup.sh
```

---

These commands should help you regain significant disk space while ensuring your Homebrew environment remains clean and functional.

## Rust Upgrade

To update and upgrade all necessary components of Rust, including `rustc`,
`rustup`, `cargo`, toolchains, and other utilities, you can use the following
sequence of commands. This ensures everything related to Rust is updated and
optimized.

```bash
# Update rustup itself (Rust installer and version manager)
rustup self update

# Update Rust compiler (rustc), Cargo, and all installed components
rustup update

# Update all installed toolchains (e.g., stable, beta, nightly) and their components
rustup update stable
rustup update beta
rustup update nightly

# Update Cargo-installed binaries and tools globally
cargo install-update -a  # Requires the 'cargo-update' tool

# Clean up old versions and unnecessary files
rustup component add rust-analyzer-preview --toolchain nightly
rustup component clean
cargo clean
```

---

### Breakdown:

1. **`rustup self update`**
   Ensures the `rustup` tool itself is up to date.

2. **`rustup update`**
   Updates the default Rust installation and all toolchains to their latest versions.

3. **`cargo install-update -a`**
   Updates all binaries installed through `cargo install`. You need to have the `cargo-update` tool installed for this:

   ```bash
   cargo install cargo-update
   ```

4. **`rustup component clean`**
   Removes unused or orphaned components for cleaner disk space.

5. **`cargo clean`**
   Cleans up build artifacts from Cargo projects to free space.

---

### Combined Command

You can combine all the commands in a one-liner:

````bash
rustup self update && rustup update && rustup update stable && rustup update
beta && rustup update nightly && cargo install-update -a && rustup component
clean && cargo clean ```

---

### Optional: Install Missing Components
If you use tools like `rust-analyzer`, make sure to install or update them:

```bash
rustup component add rust-analyzer --toolchain nightly
````

This command ensures you’re also ready for development with nightly builds of `rust-analyzer`.

## Go Language

To update and upgrade all necessary components of Go (Golang) on your system,
including the Go compiler, `go` command, and any global tools or dependencies
you’ve installed, follow these steps:

---

### Command Sequence for Updating Go and Global Tools

```bash
# 1. Update Go itself using Homebrew
brew upgrade go

# 2. Verify the Go version is updated
go version

# 3. Update all globally installed Go tools and dependencies
go install golang.org/dl/go1.21.3@latest  # Example for a specific Go version if needed
go get -u ./...  # Update dependencies for the current module
go install -u ./...  # Update installed binaries in $GOPATH/bin or $GOBIN

# 4. Clean up old or unused Go modules from your cache
go clean -modcache

# 5. (Optional) Remove unused dependencies from your current module
go mod tidy
```

---

### Breakdown of Commands:

1. **`brew upgrade go`** Updates Go to the latest version via Homebrew. Since
   you’re on macOS with an ARM-based M1, this ensures you’re using the
   optimized version for your architecture.

2. **`go version`** Verifies that the Go version was updated successfully.

3. **`go install golang.org/dl/goX.Y.Z@latest`** Allows you to install or
   switch to a specific Go version if required. Replace `go1.21.3` with your
   target version.

4. **`go get -u ./...`** Updates all dependencies in the current project to
   their latest versions. This is useful for keeping your projects up-to-date.

5. **`go install -u ./...`** Updates all globally installed tools in
   `$GOPATH/bin` or `$GOBIN`.

6. **`go clean -modcache`** Clears the module cache, which can free up disk
   space.

7. **`go mod tidy`** Removes unused or redundant dependencies from your
   `go.mod` file in the current project.

---

### Combined Command in One Line

```bash
brew upgrade go && go version && go install golang.org/dl/go1.21.3@latest && go get -u ./... && go install -u ./... && go clean -modcache && go mod tidy
```

---

### Optional: Verify Installed Tools and Dependencies

You can list and verify installed tools and dependencies to ensure everything is updated:

```bash
go list -m all  # Lists all modules
go env          # Displays your Go environment variables
```

This will give you a clear picture of your Go environment and confirm everything is set up correctly.
