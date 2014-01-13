require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'rspec-system/rake_task'

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send('disable_only_variable_string')
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

task :default => [:test]

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec,
]

