require 'transmission-connector'

Before do
  start_transmission
end

After do
  stop_transmission  
end

def start_transmission
    @config_dir = File.expand_path('../config_dir', __FILE__)
    @host       = ENV['TRANSMISSION_HOST']
    @port       = ENV['TRANSMISSION_PORT']
    
    @transmission_daemon = TransmissionConnector::DaemonController.new(
      :config_dir => @config_dir, 
      :host       => @host,
      :port       => @port
    )
    
    @transmission_daemon.start_and_wait
end

def stop_transmission
  @transmission_daemon.stop
  @transmission_daemon.cleanup
end