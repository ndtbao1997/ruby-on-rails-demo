class CreateShopEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :shop_events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
