Pod::Spec.new do |s|
  s.name             = 'CollapsedTableView'
  s.version          = '1.0.1'
  s.summary          = 'Multilevel TableView that is ready to collapse and expand with childern cells.'

  s.description      = <<-DESC
  Enable building your TableView with Multilevel, in addition the user will be able to expand and collapse the higher level cells.
                       DESC

  s.homepage         = 'https://github.com/amr-abdelfattah/CollapsedTableView'
   s.screenshots     = 'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/1.png', 'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/2.png',
   'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/3.png',
   'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/4.png',
   'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/5.png',
   'https://raw.githubusercontent.com/amr-abdelfattah/CollapsedTableView/master/Screenshots/demo.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amr-abdelfattah' => 'amrelsayed.mohamed@gmail.com' }
  s.source           = { :git => 'https://github.com/amr-abdelfattah/CollapsedTableView.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/AmrElSa78211011'

  s.ios.deployment_target = '10.0'

  s.swift_version = '4.2'

  s.source_files = 'CollapsedTableView/Classes/**/*'
end
