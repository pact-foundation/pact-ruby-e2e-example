load 'consumer/Rakefile'
load 'provider/Rakefile'

task 'pact:e2e' => ['spec', 'pact:verify:foobar']
task 'pact:e2e:local' => ['spec', 'pact:verify:foobar_using_local_broker']
task 'pact:e2e:remote' => ['spec', 'pact:verify:foobar_using_remote_broker']

task :default => 'pact:e2e'
