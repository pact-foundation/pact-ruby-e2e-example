load 'consumer/Rakefile'
load 'provider/Rakefile'

task 'pact:e2e' => ['spec', 'pact:verify:foobar']
task 'pact:e2e:local' => ['spec', 'pact:verify:foobar_using_local_broker']
task 'pact:e2e:remote' => ['spec', 'pact:verify:foobar_using_remote_broker']

task :default => 'pact:e2e'

task :print_pacts do
  puts "\n" + "*" * 40 + "\n"

  puts "The contents of consumer/spec/pacts is #{Dir.glob('consumer/spec/pacts/*.json')}"
  Dir.glob('consumer/spec/pacts/*.json').each do | file |
    puts File.read(file)
  end

  puts "\n" + "*" * 40 + "\n"
end
