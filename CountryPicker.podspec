Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "CountryPicker"
s.summary = "CountryPicker lets a user select the country name, code and flag in all languages."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Esraa Ali" => "esraaaali.93@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/esraaaali/CountryPicker"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/esraaaali/CountryPicker.git",
             :tag => "0.1.0" }

# 7
s.framework = "UIKit"

# 8
s.source_files = "CountryPicker/**/*.{swift}"

# 9
s.resources = "CountryPicker/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,json}"

# 10
s.swift_version = "4.2"

end
