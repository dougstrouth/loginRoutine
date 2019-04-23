# loginRoutine
Powershell script to automate my morning work setup. Opens all websites, my IM client, and creates a notes word file for me.

Edit file paths as needed in the script and websites in the config file to customize this for your own needs. I prefer to keep all mine in a dedicated scripts folder in root for ease.

Websites in the config file need only be separated by a space


To add this to windows scheduler open up windows scheduler

Step 1 - create basic task 

Step 2 - trigger, set this to login

Step 3 - action, set to open application. powershell in the application field and -File *filepath of the ps1 file*

Step 4 - save the task

Step 5 - test it by hitting the play button
