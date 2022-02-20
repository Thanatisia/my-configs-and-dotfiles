#include <iostream>
#include <string>
#include <stdlib.h>
#include <stdio.h>
using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::to_string;
using std::getline;

/* Prototype Functions */
void print_msg(string);

int main(int argc, const char *argv[])
{
    print_msg("Hello World");
}

/* Function Definitions */
void print_msg(string msg)
{
    cout << msg << endl;
}
