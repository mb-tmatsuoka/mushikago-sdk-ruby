# -*- coding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'rubygems'
require 'bundler'
Bundler.setup :default, :test, :development

ENV['SPEC_OPTS'] = '--colour'
Autotest.add_discovery { "rspec2" }
