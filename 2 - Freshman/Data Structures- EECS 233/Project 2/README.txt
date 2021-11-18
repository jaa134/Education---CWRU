HuffmanCompressor v1.0
Jacob Alspaw
jaa134@case.edu
3/24/15

Description
===========

HuffmanCompressor is a utility that will compress "plain-text" text
files into an arbitrary binary encoding, whose values are more
space-efficient than ASCII.The purpose of the utility is to save space
on ones computer by completing the following process. The program will
reads ASCII characters of a "plain-text" text file into a String. The 
frequencies of each character is counted and transferred into node objects. 
These objects are arranged into a binary tree in such a way that characters
with the largest frequency will have the shortest encoded value. The utility
will compute how much space is saved, along with a visual representation
of each ASCII characters encoding, to a seperate file named "SpaceSavingsAndCodes.txt".


Start Using HuffmanCompressor
===============================

HuffmanCompressor doesn't require any installation process or
additional dll files. In order to start using it, one must first
download and extract the contents of the ".zip" file into
any folder. From here, using the command line and the latest
version of the Java Development Kit, set a path to the folder of
the contents using the command line. Compile the HuffmanCompressor
.java file. Run the same file with two arguments. 

The encoded file is the second argument while the first argument 
is the file to be encoded.

Command-Line Options
====================

/setPath <Path to the contents folder>
/javac HuffmanCompressor.java
/java HuffmanCompressor <inputFileName> <outputFileName>
