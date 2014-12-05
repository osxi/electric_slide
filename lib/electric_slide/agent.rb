# encoding: utf-8
class Agent
  attr_accessor :id, :address, :presence, :connect_callback, :disconnect_callback

  # @param [Hash] opts Agent parameters
  # @option opts [String] :id The Agent's ID
  # @option opts [String] :address The Agent's contact address
  # @option opts [Symbol] :presence The Agent's current presence. Must be one of :available, :on_call, :away, :offline
  def initialize(opts = {})
    @id = opts[:id]
    @address = opts[:address]
    @presence = opts[:presence]
  end

  # Provide a block to be called when this agent is connected to a caller
  # The block will be passed the queue, the agent call and the client call
  def on_connect(&block)
    @connect_callback = block
  end

  # Provide a block to be called when this agent is disconnected to a caller
  # The block will be passed the queue, the agent call and the client call
  def on_disconnect(&block)
    @disconnect_callback = block
  end

end
