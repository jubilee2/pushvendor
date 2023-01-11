desc 'Load Pushvendor default configuration data.'

namespace :pushvendor do
  task load_default_data: :environment do
    Rake::Task['db:migrate'].invoke
    StoreConfiguration.create(id: 1, currency: '$')
  end
end
