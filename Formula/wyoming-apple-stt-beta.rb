class WyomingAppleSttBeta < Formula
  include Language::Python::Virtualenv

  desc "Wyoming protocol STT server backed by Apple's Speech framework"
  homepage "https://github.com/FI-153/wyoming-apple-stt"
  url "https://github.com/FI-153/wyoming-apple-stt/releases/download/v2.0.0-beta1/wyoming-apple-stt-2.0.0-beta1.tar.gz"
  version "2.0.0-beta1"
  sha256 "432063849fdb05f4d57c0dfbc88e9997f08b8368abc6a8a0f91073c43aec35dd"
  license "MIT"

  depends_on macos: :sequoia
  depends_on "python@3.13"

  conflicts_with "wyoming-apple-stt", because: "both install the same binaries and launchd service"

  resource "wyoming" do
    url "https://files.pythonhosted.org/packages/c5/ab/8984e755731fac96405b3ecc2236887855120afb9760f829291bd618c26d/wyoming-1.8.0.tar.gz"
    sha256 "90c16c9fb7e90cbce277032806b7816e6c631812393206a73298f4ad4ffcdb76"
  end

  def install
    bin.install "apple-stt"
    bin.install "apple-tts"
    virtualenv_install_with_resources

    conf = etc/"wyoming-apple-stt.conf"
    unless conf.exist?
      conf.write <<~EOS
        # Wyoming Apple STT configuration
        # Restart after editing: brew services restart wyoming-apple-stt
        PORT=10300
        LANGUAGE=en
        # Extra flags passed to the server, e.g. "--debug" or "--timeout 60"
        EXTRA_ARGS=""
      EOS
    end

    (libexec/"wyoming-apple-stt-run").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      PORT=10300
      LANGUAGE=en
      EXTRA_ARGS=""
      CONF="#{etc}/wyoming-apple-stt.conf"
      if [[ -f "${CONF}" ]]; then
        source "${CONF}"
      fi
      exec "#{libexec}/bin/python" -m wyoming_apple_stt \\
        --uri "tcp://0.0.0.0:${PORT}" \\
        --language "${LANGUAGE}" \\
        --apple-stt-bin "#{bin}/apple-stt" \\
        --apple-tts-bin "#{bin}/apple-tts" \\
        ${EXTRA_ARGS}
    EOS
    chmod 0755, libexec/"wyoming-apple-stt-run"
  end

  service do
    run [opt_libexec/"wyoming-apple-stt-run"]
    keep_alive true
    log_path var/"log/wyoming-apple-stt.log"
    error_log_path var/"log/wyoming-apple-stt.log"
  end

  test do
    output = shell_output("#{bin}/apple-stt --list-languages")
    assert_match(/"en"/, output)
    tts_output = shell_output("#{bin}/apple-tts --list-voices")
    assert_match(/\A\[/, tts_output)
    system libexec/"bin/python", "-c", "import wyoming_apple_stt"
  end
end
