When /^(?:|I )upload a torrent file$/ do
  locator = 'upload_torrent-file'
  file_path = Rails.root.join('spec', 'support','example.torrent')
  
  attach_file(locator, file_path)
  
  When %[I press "Ok"]
end
