Pod::Spec.new do |s|
  s.name             = 'CollapsedTableView'
  s.version          = '1.0.0'
  s.summary          = 'Multilevel TableView that is ready to collapse and expand with childern cells.'

  s.description      = <<-DESC
  Enable building your TableView with Multilevel, in addition the user will be able to expand and collapse the higher level cells.
                       DESC

  s.homepage         = 'https://github.com/amr-abdelfattah/CollapsedTableView'
   s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amr-abdelfattah' => 'amrelsayed.mohamed@gmail.com' }
  s.source           = { :git => 'https://github.com/amr-abdelfattah/CollapsedTableView.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/AmrElSa78211011'

  s.ios.deployment_target = '10.0'

  s.swift_version = '4.2'

  s.source_files = 'CollapsedTableView/Classes/**/*'
end
