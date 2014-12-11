#
# Cookbook Name:: rlwrap4sqlplus
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
ohai "reload" do
  action :reload
end

if platform_family?("rhel")

# add the EPEL repo
  yum_repository 'epel' do
    description 'Extra Packages for Enterprise Linux'
    mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
    gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
    action :create
  end

  package "rlwrap" do
    action :install
  end

  ruby_block "SET_ALIAS_SQLPLUS" do
    block do
      retries 0
      retry_delay 0

      my_shell = "#{node['etc']['passwd']['oracle']['shell']}"
      my_home  = "#{node['etc']['passwd']['oracle']['dir']}"

      if my_shell == "/bin/bash"
        pfile = my_home + "/.bash_profile"
      elsif my_shell == "/bin/ksh"
        pfile = my_home + "/.profile"
      end

      _file = Chef::Util::FileEdit.new(pfile)
      _file.insert_line_if_no_match('/^alias sqlplus=/','alias sqlplus="rlwrap sqlplus"')
      _file.write_file 
    end
  end
end
