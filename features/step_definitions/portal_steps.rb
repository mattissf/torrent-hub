When /^(?:|I )upload a torrent file$/ do
  When %[I attach the file "features/support/example.torrent" to "torrent_file"]
  When %[I press "Ok"]
end
