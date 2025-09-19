class Yatto < Formula
  desc "Terminal-based to-do application built with Bubble Tea"
  homepage "https://github.com/handlebargh/yatto"
  url "https://github.com/handlebargh/yatto.git",
      tag:      "v0.15.0",
      revision: "5d8147d94bce2f2f594d07ccb199be852894ae78"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"yatto"
  end

  test do
    output = shell_output("#{bin}/yatto -version")
    assert_match "Version:", output
    assert_match "yatto", output
  end
end
