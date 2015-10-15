require_relative "../../lib/display"

describe "Display" do
  
  it "shows the result of a search as table" do
    data = [{"plugin"=>"hashlib", "author"=>"mschnitzer", "version"=>"1.0.0", \
      "smalldesc"=>"A hashing plugin which supports many hashing algorithms."}]

    expected_output = <<EOF
+---------+------------+---------+----------------------------------------------------------+
| Plugin  | Author     | Version | Description                                              |
+---------+------------+---------+----------------------------------------------------------+
| hashlib | mschnitzer | 1.0.0   | A hashing plugin which supports many hashing algorithms. |
+---------+------------+---------+----------------------------------------------------------+
EOF
    expect { Display.new.show_search_result(data) }.to output(expected_output).to_stdout
  end
  
end