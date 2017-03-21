class CreateUnitTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_translations do |t|
      t.string :locale
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
