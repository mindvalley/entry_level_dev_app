class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.integer :mobile
      t.integer :web_client
      t.integer :foundations
      t.integer :servers
      t.integer :project_management
      t.integer :communication
      t.integer :craft
      t.integer :initiative
      t.integer :career_development
      t.integer :org_design
      t.integer :wellbeing
      t.integer :accomplishment
      t.integer :mentorship
      t.integer :evangelism
      t.integer :recruiting
      t.integer :community
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
