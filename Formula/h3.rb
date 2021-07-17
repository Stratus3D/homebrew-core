class H3 < Formula
  desc "Hexagonal hierarchical geospatial indexing system"
  homepage "https://uber.github.io/h3/"
  url "https://github.com/uber/h3/archive/v3.7.2.tar.gz"
  sha256 "803a7fbbeb01f1f65cae9398bda9579a0529e7bafffc6e0e0a6d81a71b305629"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any,                 big_sur:      "65c2cd49b30043d5927f3cb1d83250e1cae623056faf823d596ed6e84186c145"
    sha256 cellar: :any,                 catalina:     "6fcd1a31fac3329f1f3d8e84e5d46cc601eb348956bca155e5aa614a18146101"
    sha256 cellar: :any,                 mojave:       "2bb08dbd4274ba9f9195aefe3bd90d2afc3751b89ab11e3d2eb6e4ee67d418b5"
    sha256 cellar: :any,                 high_sierra:  "bb8bd6d67bfc428e38c637ec755fe32e52093dc94be4e787a7e37f8c6da6d980"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a44041bfc9cb66a869cc5fd23b8a09e6be4d3dfb0a6bba6655024970da530a5a"
  end

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DBUILD_SHARED_LIBS=YES", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    result = pipe_output("#{bin}/geoToH3 -r 10 --lat 40.689167 --lon -74.044444")
    assert_equal "8a2a1072b59ffff", result.chomp
  end
end
