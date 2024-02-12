#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo
   echo "Syntax: scriptTemplate [-h|p|k|s]"
   echo "options:"
   echo "h     Print this Help."
   echo "p     Enter the Project Id."
   echo "k     Enter the Client Key."
   echo "s     Enter the Client Secret."
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


echo "hello $ClientKey, $ClientSecret, $ProjectId"
