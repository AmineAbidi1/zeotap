class CreateMappers < ActiveRecord::Migration
  def change
    create_table :mappers do |t|
      t.string :string1
      t.string :string2
      t.string :result

      t.timestamps
    end
  end
end
