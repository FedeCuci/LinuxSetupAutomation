Introduction

This is a repo created to automate the installation of my personal favorite applications for my new Desktop PC which will be
running Ubuntu 20.04. To do this, this repo will make use of a very simple bash script which will simply download all the preferred applications and remove the unwanted ones.

Testing the script

The script should be tested on a virtual machine, just before the actual install. This is because in the time difference from when this script is created and when it will be installed, package names, versions and other variables might change, thus breaking certain parts of the install. For example, Authy is currently in the beta, but in the upcoming months, it might not be anymore. In turn, the command to install it might be different. Currently to install Authy via the snap package manager, you must execute the following command:

sudo snap install authy --beta

However, if a stable channel will be released, the '--beta' will not be the right command to execute.

How to run the script

After having tested the script, it is time to run it on the real machine. The script should be located on a USB, ready to be executed on the machine. all of the files in the USB should be first moved to the actual machine. Before the script can be executed, it must be made executable using the chmod command. When running the command, it is preferable to run it with the time command so that it will be possible to see how long the entire installation took. Also, the stderr should be sent to a file called 'errors.txt' so that it will be possible to see everything that went wrong during the installation. This is very important.

Things to look out for

Not only does the script install applications and dependencies using the apt and snap package managers, but it also scrapes websites of applications taht can only be downloaded from the internet. In this case, the script scrapes and downloades, mullvad and MEGA. Even though it is great to install these applications using the script, it comes with its own limitations. This is because if the websites are changed, then the output of the command which scrapes it will not yield the same results anymore, thus creating errors. Because of that, for the real install, it might be wise to just download the latest version of the application directly from the websites themselves. This is also not going to make the whole process much longer because this can be down while the script is still running. In fact, it may even be faster. 

Things to add to the script

As mentioned above, the script currently only installs apt and snap packages. However, there are several applications, plugins etc. that can only be downloaded directly from Github. All of those still need to be added at the end of the script. 

Applications to download from the Internet:
* Ulancher
* MEGA
* Mullvad

Adding config files

To add config files, there needs to be a git repo containing all the preferences. 

Other things to do after running the script

Change the file system theme to dark.
Configure all the SSH keys with Gitlab, Github etc.
Configure THunderbird with mailbox.org
Install the rest of the applications (Mullvad, MEGA, Ulauncher)
Login in all of the accounts.
Uninstall the Videos applications from Ubuntu
