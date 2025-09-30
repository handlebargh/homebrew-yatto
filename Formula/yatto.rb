class Yatto < Formula
  desc "Interactive VCS-based todo-list for the command-line"
  homepage "https://github.com/handlebargh/yatto"
  url "https://github.com/handlebargh/yatto.git",
      tag:      "v0.19.0",
      revision: "e195d935e80515ac0d39b927c87baaba5960b935"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOFLAGS"] = "-mod=readonly -trimpath"
    system "go", "build", *std_go_args(ldflags: "-s -w -extldflags=-zrelro -extldflags=-znow")
  end

  test do
    output = shell_output("#{bin}/yatto -version")
    assert_match "Version:", output
    assert_match "yatto", output
  end
end
