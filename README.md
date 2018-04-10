	 	 	
# JUPYTER NOTEBOOK COOKBOOK

 Jupyter Cookbook installs the Jupyter Notebook on your machine and configures it to access remotely.

## REQUIREMENTS	

The following cookbooks are direct dependencies because they're used for common "default" functionality.

### Platforms
        Debian / Ubuntu derivatives
        Fedora
        Red Hat Enterprise Linux 	

### Cookbooks
	*poise* 	is a set of libraries for writing reusable cookbooks
        *poise-archive*  A Chef cookbook to unpack file archives.
        *poise-languages* support code for Poise's language cookbooks like poise-ruby and poise-python.    
        *poise-python*  A Chef cookbook to provide a unified interface for installing Python, managing 	Python packages, and           creating virtualenvs.

###   Chef
        Chef 12.7+
	 	 	
## USAGE	
   Add depends jupyter' to your cookbook's metadata.rb to use Jupyter Notebook in your cookbooks.
   Use the cookbook to install jupyter notebook on your EC2 instance.

