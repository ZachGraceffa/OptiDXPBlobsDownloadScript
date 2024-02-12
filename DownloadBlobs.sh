#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Set variables
ClientKey="Enter Key"
ClientSecret="Enter Secret"
ProjectId="Enter Id"

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":h:p:k:s:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      p) # Enter a Project Id
         ProjectId=$OPTARG;;
      k) # Enter a Client Key
         ClientKey=$OPTARG;;
      s) # Enter a Client Secret
         ClientSecret=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


echo "hello $ClientKey, $ClientSecret, $ProjectId!"
