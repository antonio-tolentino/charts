#!/bin/bash                                                                
                                                                           
echo "This script (infinite loop) keeps container running until receive SIGNAL."    
                                  
                                                                           
cleanup ()                                                                 
{                                                                          
  echo "" 
  echo "Bye, see you Later!"
  echo ""
  exit 0                                                                     
}                                                                          
                                                                           
trap cleanup SIGINT SIGTERM                                                

echo ""                                                                           
while true                                                              
do                                                                         
  sleep 60 
  echo "Still waiting..."                                                            
done 

wait $!  


