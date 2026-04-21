class ApfelHomeAssistant < Formula
  desc "Run apfel pre-configured as a Home Assistant conversation backend"
  homepage "https://github.com/FI-153/apfel-home-assistant"
  url "https://github.com/FI-153/apfel-home-assistant/releases/download/v0.1.0/apfel-home-assistant-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "af52cc8a51c08624dee83d89e5dcda4228d75fe09a04a26a9871f5aeb46d5820"
  license "MIT"

  depends_on "arthur-ficial/tap/apfel"
  depends_on macos: :tahoe

  def install
    bin.install "bin/apfel-home-assistant"
    libexec.install "libexec/apfel-home-assistant-run"

    conf = etc/"apfel-home-assistant.conf"
    unless conf.exist?
      conf.write <<~EOS
        # apfel-home-assistant configuration
        # Edit manually only if you know what you're doing.
        # Normal workflow: `apfel-home-assistant setup` / `rotate-token`.
        # Restart after editing: `brew services restart apfel-home-assistant`.

        HOST=0.0.0.0
        PORT=11434
        TOKEN=
      EOS
      chmod 0600, conf
    end
  end

  def caveats
    <<~EOS
      Finish setup before starting the service:
        apfel-home-assistant setup

      Then:
        brew services start apfel-home-assistant

      `setup` prints the Base URL, API Key, and Model to paste into Home Assistant's
      "OpenAI Extended Conversation" integration.
    EOS
  end

  service do
    run [opt_libexec/"apfel-home-assistant-run"]
    keep_alive true
    log_path var/"log/apfel-home-assistant.log"
    error_log_path var/"log/apfel-home-assistant.log"
  end

  test do
    assert_match "Usage: apfel-home-assistant",
                 shell_output("#{bin}/apfel-home-assistant --help")
    assert_predicate libexec/"apfel-home-assistant-run", :executable?
  end
end
