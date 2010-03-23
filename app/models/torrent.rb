class Torrent
  require 'uri'
  require 'httpclient'

  def initialize 
    username = 'mattis'
    password = 'matt1s'
    
    @transmission_host = "http://localhost:56700"; 

    url = URI.parse(@transmission_host);

    @client = HTTPClient.new
    @client.set_auth(url, username, password)
  end

  def self.all 
    Torrent.new.get_active_torrents
  end

  def post_to_rpc(data)
    rpc_url = @transmission_host + '/transmission/rpc'
    session_id_header_key = 'X-Transmission-Session-Id'
 
    if @sessionId.nil? then
      @sessionId = @client.post(rpc_url).header[session_id_header_key]
      post_to_rpc(data)
    else
      JSON::parse(@client.post(rpc_url, data.to_json, session_id_header_key => @sessionId).content)
    end
  end

  def get_active_torrents
    result = post_to_rpc({
      'method'    => 'torrent-get', 
      'arguments' => {
        'fields'  => [
          'name', 
          'torrentFile', 
          'id', 
          'rateDownload',
          'status'
        ]
      }
    })

    return {
      'metaData' => {
        'idProperty' => 'id',
        'totalProperty' => 'results',
        'root' => 'rows',
        'fields' => [
          {'name' => 'name'},
          {'name' => 'torrentFile'},
          {'name' => 'id'},
          {'name' => 'rateDownload'},
          {'name' => 'status'}
        ]
      },

      'success' => result['result'] === 'success',
      'results' => result['arguments']['torrents'].size,
      'rows'    => result['arguments']['torrents']
    }
  end
end