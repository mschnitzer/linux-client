require "terminal-table"

class Display
  
  def show_search_result(result)
    rows = []

    result.each do |r|
      rows.push([ r["plugin"], r["author"], r["version"], r["smalldesc"] ])
    end

    table = Terminal::Table.new :headings => ["Plugin", "Author", "Version", "Description"], :rows => rows
    puts table
  end

end