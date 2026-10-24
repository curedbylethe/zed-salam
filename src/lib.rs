use zed_extension_api::{self as zed, LanguageServerId, Result, Worktree};

/// `salam lsp` is built into the compiler, so there is nothing to download:
/// the extension only has to find the user's `salam` binary and pass `lsp`.
struct SalamExtension;

impl zed::Extension for SalamExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<zed::Command> {
        let command = worktree.which("salam").ok_or_else(|| {
            "`salam` was not found on your PATH. Install the Salam compiler (0.5.9 or newer) \
             and make sure `salam --version` works in a terminal, then restart Zed."
                .to_string()
        })?;

        Ok(zed::Command {
            command,
            args: vec!["lsp".to_string()],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(SalamExtension);
