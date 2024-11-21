# @version ^0.4.0

# One thing to note is that the variables in vyper once assigned to another variable, and the value of another variable is changed lateron, 
#this doesn't affect the value of the initial variable. There are 3 reference types in vyper: lists, hashmaps, and structs.

struct Person:
    name: String[100]
    age: int128

nums: public(int128[10])
myMap: public(HashMap[address,int128])
person: public(Person)

@deploy
def __init__():
    self.nums = [1,2,3,4,5,6,7,8,9,10]
    self.myMap[msg.sender]= 354 # msg.sender has the address stored in it.
    # self.person = Person("John Doe", 20)
    self.person.name = "John Doe"
    self.person.age = 20

    # Does not modify the value of nums
    nums2: int128[10] = self.nums
    nums2[0] = 2

    # Modifies the value of nums
    self.nums[0] = 100 

    # Mappings can not be local variables
    my_struct2: Person= self.person
    my_struct2.name = "Rushikesh Chopade"




    



