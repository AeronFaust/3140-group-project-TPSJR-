#! /usr/bin/awk -f
#AWK Program 1: Getting the number of commit per email suffix and counts their occurrence

BEGIN { 
#print to the user
    print "Counting emails...\n"
#seperator
    FS =","
} 
{ 
#using match function and regex to match an email from the second column res being the matched result in an array
    match($2, /@\w+.\w+/, res) 
#if statement to check if an email was found
    if(res[0] != "") 
#using a hashtable to keep track of occureneces 
        ht[res[0]]+=1
}
END {
#for loop to print out the hashtable containing the emails and the amount of times they have appeared in the file
    for ( i in ht )
#using sort function to sort emails in alphabetical order
         print i " : ", ht[i]  | "sort"
}