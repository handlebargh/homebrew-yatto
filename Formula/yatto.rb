class Yatto < Formula
  desc "Terminal-based to-do application built with Bubble Tea"
  homepage "https://github.com/handlebargh/yatto"
  license "MIT"
  url "https://github.com/handlebargh/yatto.git",
      tag:      "v0.15.0",
      revision: "5d8147d94bce2f2f594d07ccb199be852894ae78"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"yatto"
  end
end
