class InvalidAPIResponse < Exception; end
class InvalidCommandLine < Exception
  def initialize(message)
    @message = message
  end

  def to_s
    $stderr.puts @message
    exit 1
  end
end