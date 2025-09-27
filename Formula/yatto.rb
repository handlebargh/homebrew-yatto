class Yatto < Formula
  desc "Interactive VCS-based todo-list for the command-line"
  homepage "https://github.com/handlebargh/yatto"
  url "https://github.com/handlebargh/yatto.git",
      tag:      "v0.16.0",
      revision: "566b2755ae64ed988b06659ca4891a11d850b092"
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
