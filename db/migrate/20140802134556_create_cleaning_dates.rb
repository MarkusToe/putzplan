class CreateCleaningDates < ActiveRecord::Migration
  def change
    create_table :cleaning_dates do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.date :date

      t.timestamps
    end
  end
end
