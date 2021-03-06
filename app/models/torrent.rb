require 'transmission-connector'

class Torrent < ActiveRecord::Base
  def add_torrent_from_string(torrent_file_content)
    Torrent.query.add_torrent_from_string torrent_file_content
  end
  
  def add_torrent(torrent_file)
    Torrent.query.add_torrent_from_file torrent_file
  end
  
  def self.query
    connection = TransmissionConnector::Connection.new({
      :username => ENV['TRANSMISSION_USERNAME'],
      :password => ENV['TRANSMISSION_PASSWORD'],
      :host     => ENV['TRANSMISSION_HOST'],
      :port     => ENV['TRANSMISSION_PORT']
    })
      
    TransmissionConnector::Query.new(connection)
  end
  
  def self.all    
    torrents = Torrent.query.get_list_of_torrents
    
    {
      'metaData' => {
        'idProperty'    => 'id',
        'root'          => 'torrents',
        'totalProperty' => 'total',
        'sortInfo' => {
           "field" => "name",
           "direction" => "ASC"
        },        
        'fields' => [
          'id',
          'name',
          'status',
          'rate_upload',
          'rate_download'
        ]
      },
      'torrents' => torrents,
      'total' => torrents.length
    }
  end
end