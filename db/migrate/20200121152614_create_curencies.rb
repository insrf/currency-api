class CreateCurencies < ActiveRecord::Migration[6.0]
  def change
    create_table :curencies do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
