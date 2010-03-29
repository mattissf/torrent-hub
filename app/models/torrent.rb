require 'transmission-connector'

class Torrent < ActiveRecord::Base
  def self.all
    connection = TransmissionConnector::Connection.new({
      :username => 'test',
      :password => 'test',
      :host => '127.0.0.1',
      :port => 56700
    })
      
    query = TransmissionConnector::Query.new(connection)
    
    torrents = query.get_list_of_torrents
    
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