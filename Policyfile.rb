# frozen_string_literal: true

name 'webpi'

default_source :supermarket

run_list 'recipe[test::default]'

named_run_list :default, 'recipe[test::default]'

cookbook 'webpi', path: '.'
cookbook 'test', path: './test/cookbooks/test'
