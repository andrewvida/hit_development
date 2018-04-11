namespace :db do
  desc "Clears all data."
  task nuke_and_pave: [:drop, :create, :migrate, :seed]
  task clear_all: :environment do
    User.delete_all
    Department.delete_all
    Post.delete_all
  end
end