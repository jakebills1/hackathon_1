class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
