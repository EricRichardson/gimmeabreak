class CreateStepsLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :steps_logs do |t|
      t.string :device_id
      t.integer :steps
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
