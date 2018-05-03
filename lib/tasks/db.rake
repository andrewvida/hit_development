namespace :db do
  desc "Nukes all data."
  task nuke_and_pave: [:drop, :create, :migrate, :seed]
end