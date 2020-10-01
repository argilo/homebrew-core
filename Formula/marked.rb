require "language/node"

class Marked < Formula
  desc "Markdown parser and compiler built for speed"
  homepage "https://marked.js.org/"
  url "https://registry.npmjs.org/marked/-/marked-1.2.0.tgz"
  sha256 "829b625b352e4e6624135be69873be0e198108b6f75693b8c70de44fe5a5a848"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "bf65fab860c4e5ed677c937bc737562ae91a43e52c0a1483d96e96125ddb8428" => :catalina
    sha256 "8e86377c5fecd3b7f4880593294348c600c0455803bd3c9463586bdb84d44f3c" => :mojave
    sha256 "68d30422af48fb5b64e85f83ac20bda17a44f0a5f016d79acfa2256ef69e0f7e" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "<p>hello <em>world</em></p>", pipe_output("#{bin}/marked", "hello *world*").strip
  end
end
