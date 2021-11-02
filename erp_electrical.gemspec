$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/electrical/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_electrical"
  s.version     = Erp::Electrical::VERSION
  s.authors     = ["Trần Thiện Chí"]
  s.email       = ["diennuoctranchi@gmail.com"]
  s.homepage    = "https://diennuoctranchi.com/"
  s.summary     = "Điện Nước Trần Chí"
  s.description = "Điện Nước Trần Chí - Thợ Sửa Chữa Điện Nước Tại Biên Hòa"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1.7"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end