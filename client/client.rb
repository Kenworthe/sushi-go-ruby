require 'websocket-eventmachine-client'
require 'tty-prompt'

class Client
  def initalize(server)
    @ws = WebSocket::EventMachine::Client.connect(:uri => 'ws://0.0.0.0:8080')
    @server = server
    @request = nil
    @response = nil
    listen
    send
  end

  def connect
    EM.run do
      @ws = WebSocket::EventMachine::Client.connect(:uri => 'ws://0.0.0.0:8080')
    end
  end
end

@prompt = TTY::Prompt.new
@ws = nil

def input
  message = @prompt.ask('What do you want to send?')
  @ws.send message
end

EM.run do

  @ws = WebSocket::EventMachine::Client.connect(:uri => 'ws://0.0.0.0:8080')

  @ws.onopen do
    puts "Connected"
  end

  @ws.onmessage do |msg, type|
    puts "Received message: #{msg}"
  end

  @ws.onclose do |code, reason|
    puts "Disconnected with status code: #{code}"
  end

  EventMachine.next_tick do
    @ws.send "Hello Server!"
  end

end