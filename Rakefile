#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Blog::Application.load_tasks

desc "load fake data"
task :load_fake_data=> :environment do
  Post.delete_all
  Post.create({:title => "Lorem Ipsum", :content => <<-EOF
  Download this and more Blogger Templates at . For tutorials, 
  tips and tricks about Blogger visit our Blog. A normal paragraphEa 
  eam labores imperdiet, apeirian democritum ei nam, doming neglegentur ad vis. 
  Ne malorum ceteros feugait quo, ius ea liber offendit placerat, est habemus aliquyam legendos...
  EOF
  })
end
