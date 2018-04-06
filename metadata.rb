name 'jupyter'
maintainer 'ReanCloud'
maintainer_email 'sabhrant.sonakiya@reancloud.com'
license 'MIT'
description 'Installs/Configures Jupyter and runs notebook as a service'
long_description 'Installs/Configures Jupyter and starts a service to run a Jupyter notebook server'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

supports 'ubuntu', '= 16.04'

issues_url 'https://github.com/reancloud/Jupyter_Notebook/issues'
source_url 'https://github.com/reancloud/Jupyter_Notebook'

depends 'poise-python', '~> 1.6'


