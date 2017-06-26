Pod::Spec.new do |s|
s.name         = "XSTransitionManager"
s.version      = "0.0.1"
s.summary      = '模块间的解耦合跳转'
s.homepage     = "https://github.com/xingshuaiEducation/XSTransitionManager"
s.license      = 'MIT'
s.author       = {'suxx' => '13751882497.com'}
s.source       = { :git => 'https://github.com/xingshuaiEducation/XSTransitionManager.git'}
s.platform     = :ios, '8.0'
s.requires_arc = true                   #是否使用ARC，如果指定具体文件，则具体的问题使用ARC
s.source_files = 'XSTransitionManager/**/*.{h,m}'
#s.resources    = 'XSBreakthroughtModule/Resource/*.{png}'
#s.frameworks = 'AFNetworking'
#s.dependency = 'AFNetworking'
end
