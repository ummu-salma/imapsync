# imapsync
BASH script to automate varoius tasks in mail migration using imapsync tool.

Migration from source mail server to destination mail server can be done using the following command:

imapsync --host1 SourceServer --user1 support@example.com --password1 ######### --host2 DestinationServer --user2 support@example.com --password2 ######### --errorsmax=1000
