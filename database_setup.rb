unless ActiveRecord::Base.connection.table_exists?(:owners)
  ActiveRecord::Base.connection.create_table :owners do |t|
    t.string :name
    t.string :email
    t.string :password
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:stories)
  ActiveRecord::Base.connection.create_table :stories do |t|
    t.string :name
    t.text :content
  end  
end