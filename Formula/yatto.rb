class Yatto < Formula
  desc "Interactive VCS-based todo-list for the command-line"
  homepage "https://github.com/handlebargh/yatto"
  version "0.21.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/handlebargh/yatto/releases/download/v0.21.3/yatto_Darwin_arm64.tar.gz"
      sha256 "5217e4417ea57a9463a8a3fd3680cd333e180e2cc1d030ddbeafdee7e5aefef4"
    else
      url "https://github.com/handlebargh/yatto/releases/download/v0.21.3/yatto_Darwin_x86_64.tar.gz"
      sha256 "530fdc2b20ce76c82a59318bfa25d1147a4115881129220a2906ff43b26a7299"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/handlebargh/yatto/releases/download/v0.21.3/yatto_Linux_arm64.tar.gz"
      sha256 "54a63048b898f7e875c7b688134706083b7da5fab90ffde4e22b787bf71da279"
    else
      url "https://github.com/handlebargh/yatto/releases/download/v0.21.3/yatto_Linux_x86_64.tar.gz"
      sha256 "b6d3b4e8a38b8337cf3c5c76fdfefd821d987aabf73b5a771a47df4a0400d217"
    end
  end

  def install
    bin.install "yatto"
  end

  test do
    output = shell_output("#{bin}/yatto version")
    assert_match "Version:", output
    assert_match "yatto", output
  end
end