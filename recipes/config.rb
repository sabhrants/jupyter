
directory "/home/ssl" do
   mode 0755
  owner 'root'
  group 'root'
  action :create
end

bash 'extract_key' do
  cwd '/home/ssl'
  code <<-EOH
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout "cert.key" -out "cert.pem" -batch
    EOH
end

execute 'Config' do
command '/usr/local/bin/jupyter notebook --generate-config'
not_if { ::File.exist?("root/.jupyter/jupyter_notebook_config.py") }
end

ruby_block 'delete_line' do
 block do
d1 = "c.NotebookApp.ip = '*'"
file = Chef::Util::FileEdit.new('/root/.jupyter/jupyter_notebook_config.py')
file.search_file_delete_line(/#{d1}/)
file.write_file
end
action :run
end

ruby_block 'Write_config' do
 block do
f1 = "c = get_config()"
f2 = "c.NotebookApp.certfile = u'/home/ssl/cert.pem'"
f3 = "c.NotebookApp.keyfile = u'/home/ssl/cert.key'"
f4 = "c.IPKernelApp.pylab = 'inline'"
f5 = "c.NotebookApp.ip = '*'"
f6 = "c.NotebookApp.open_browser = False "
f7 = "c.NotebookApp.port = 8888 "
file = Chef::Util::FileEdit.new('/root/.jupyter/jupyter_notebook_config.py')
file.insert_line_if_no_match(/#{f1}/, f1)
file.insert_line_if_no_match(/#{f2}/, f2)
file.insert_line_if_no_match(/#{f3}/, f3)
file.insert_line_if_no_match(/#{f4}/, f4)
file.insert_line_if_no_match(/#{f5}/, f5)
file.insert_line_if_no_match(/#{f6}/, f6)
file.insert_line_if_no_match(/#{f7}/, f7)
file.write_file
end
action :run
end

execute 'Change_permission' do
command 'sudo chmod 755 /root/.jupyter'
end

execute 'Copy' do
command 'cp -r root/.jupyter  home/ec2-user/.jupyter'
end

