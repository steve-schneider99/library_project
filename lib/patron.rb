class Patron
attr_reader(:name, :id)


  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  define_singleton_method(:all_patrons) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id")
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons
  end



end
