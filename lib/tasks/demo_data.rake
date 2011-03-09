namespace :db do
  namespace :demo_data do
    desc "Loads demo data."
    task :load => :environment do
      Dir[File.join(RAILS_ROOT, 'db', 'demo_data', '*.rb')].sort.each do |fixture|
        load fixture
        puts "Loaded #{fixture}"
      end
    end
  end
end