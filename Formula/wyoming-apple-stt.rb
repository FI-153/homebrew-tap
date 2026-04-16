class WyomingAppleStt < Formula
  include Language::Python::Virtualenv

  desc "Wyoming protocol STT server backed by Apple's Speech framework"
  homepage "https://github.com/FI-153/wyoming-apple-stt"
  url "https://github.com/FI-153/wyoming-apple-stt/releases/download/v1.0.1/wyoming-apple-stt-1.0.1.tar.gz"
  version "1.0.1"
  sha256 "a12547ac577a44fa479d00767141cb698df112cadcf834ffe691b2b9095bd266"
  license "MIT"

  depends_on "python@3.13"
  depends_on macos: :sequoia

  resource "wyoming" do
    url "https://files.pythonhosted.org/packages/c5/ab/8984e755731fac96405b3ecc2236887855120afb9760f829291bd618c26d/wyoming-1.8.0.tar.gz"
    sha256 "90c16c9fb7e90cbce277032806b7816e6c631812393206a73298f4ad4ffcdb76"
  end

  def install
    bin.install "apple-stt"
    virtualenv_install_with_resources

    (etc/"wyoming-apple-stt.conf").write <<~EOS
      # Wyoming Apple STT configuration
      # Restart after editing: brew services restart wyoming-apple-stt
      PORT=10300
    EOS

    (libexec/"wyoming-apple-stt-run").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      PORT=10300
      CONF="#{etc}/wyoming-apple-stt.conf"
      if [[ -f "${CONF}" ]]; then
        source "${CONF}"
      fi
      exec "#{libexec}/bin/python" -m wyoming_apple_stt \\
        --uri "tcp://0.0.0.0:${PORT}" \\
        --apple-stt-bin "#{bin}/apple-stt"
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
    system libexec/"bin/python", "-c", "import wyoming_apple_stt"
  end
end
