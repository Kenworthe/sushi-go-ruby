# require 'websocket-eventmachine-server'

# class Server
#   def initialize
#     @event_machine = EM
#     @connections = Hash.new
#     @rooms = Hash.new
#     @clients = Hash.new
#     # @connections[:server] = @server
#     # @connections[:rooms] = @rooms
#     # @connections[:clients] = @clients
#     run
#   end

#   def run
#     loop{
#       Thread.start do |client|
#         @event_machine.run do
#           puts "Starting websocket server..."
#           WebSocket::EventMachine::Server.start(:host => "0.0.0.0", :port => 8080) do |ws|

#             ws.onopen do |handshake|
#               puts "Client connected"
#             end

#             ws.onmessage do |msg, type|
#               puts "Received message: #{msg}"
#               ws.send msg, :type => type
#             end

#             ws.onclose do
#               puts "Client disconnected"
#             end
#           end
#         end
#       end
#       puts thread
#       puts Thread.main
#     end
#   }.join
# end

# Server.new

require 'websocket-eventmachine-server'

class Server
  def initialize
    @event_machine = EM.start(@server)
    @server = WebSocket::EventMachine::Server.start(:host => "0.0.0.0", :port => 8080)
    @connections = Hash.new
    @rooms = Hash.new
    @clients = Hash.new
    # @connections[:server] = @server
    # @connections[:rooms] = @rooms
    # @connections[:clients] = @clients
    run
  end

  def run
    loop {
      puts 'starting server...'
      Thread.start(@server) do |ws|

        ws.onopen do |handshake|
          puts "Client connected"
        end

        ws.onmessage do |msg, type|
          puts "Received message: #{msg}"
          ws.send msg, :type => type
        end

        ws.onclose do
          puts "Client disconnected"
        end
      end
    }.join
  end
end

Server.new