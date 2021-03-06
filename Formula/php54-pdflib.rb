require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Pdflib < AbstractPhp54Extension
  init
  homepage 'http://www.pdflib.com'
  url 'http://pecl.php.net/get/pdflib-3.0.2.tgz'
  sha1 '162c60e89bd6105379ebe2bc3bdd1b4d8bb31cd3'

  depends_on "pdflib-lite"

  def install
    Dir.chdir "pdflib-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/pdf.so"
    write_config_file unless build.include? "without-config-file"
  end
end
