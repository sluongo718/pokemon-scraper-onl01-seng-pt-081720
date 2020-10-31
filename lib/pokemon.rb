class Pokemon

    attr_accessor :id, :name, :type, :db
    
    

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db

    end

    def self.save(name, type, db)
        sql =<<-SQL
            INSERT INTO pokemon (name, type) 
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL

       poke_db = db.execute(sql, id)[0]
       
       poke_obj = Pokemon.new(id: id, name: poke_db[1], type: poke_db[2], db: db)
       poke_obj
        
    end

end
