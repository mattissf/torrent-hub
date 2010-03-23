require 'spec_helper'
require 'daemons'

class TransmissionBridge
  
end

describe TransmissionBridge do
  it "should be able to upload file" do
    start_transmission
    sleep 10
    stop_transmission
  end
  
  def start_transmission
    @transmission = Daemons.call do
      system "transmission-daemon --config-dir /home/mattis/Ruby/workspace-radrails/TorrentHub/spec/transmission/config_dir/ --foreground"      
    end    
    
    
    # wait for "Transmission 1.75 (9117) started"
  end
  
  def stop_transmission
    @transmission.stop
  end
end
