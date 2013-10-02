class CreateFakeProcesses < ActiveRecord::Migration
  def change
    create_table :fake_processes do |t|
      t.string :name
      t.boolean :done

      t.timestamps
    end
  end
end
