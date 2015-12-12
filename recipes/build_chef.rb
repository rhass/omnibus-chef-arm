#
# Cookbook Name:: omnibus-chef-arm
# Recipe:: build_chef
#
# Copyright 2015 Ryan Hass
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


include_recipe 'omnibus-chef-arm::swapfile'
include_recipe 'omnibus'

dir = ::File.join(build_user_home, 'omnibus-chef')

git dir do
  repository 'https://github.com/chef/omnibus-chef.git'
  user node['omnibus']['build_user']
  group node['omnibus']['build_user_group']
end

omnibus_build 'chef' do
  install_dir node['omnibus']['install_dir']
  build_user node['omnibus']['build_user']
  project_dir dir
end
