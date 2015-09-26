namespace :projects do
  desc "Import projects list from excel file"
  task import: :environment do
    HEADER_ROW_INDEX = 2
    file = File.open('projects_list.xls')
    book = Roo::Excel.new(file)
    sheet = book.sheet(book.sheets.first)
    projects = {}
    (HEADER_ROW_INDEX + 1).upto(sheet.last_row) do |row_idx|
      count = row_idx - HEADER_ROW_INDEX - 1

      # Grab the current row as an array
      row = sheet.row(row_idx)

      code = row[1].to_i.to_s.to_i
      name = row[2]
      projects[code.to_s] = name
      puts "name:#{name} code:#{code}"

      # unless code.nil? || code == 0
      #   Project.create(code:code, name:name)
      # end
    end
    puts projects
    puts projects.length
    projects.each_pair do |k,v|
      Project.create(name:v, code:k)
    end

  end

  task transform: :environment do
    projects = Project.all

    projects.each do |p|
      p.name = "Kod: #{p.code} - #{p.name}"
      p.save
    end
  end
end