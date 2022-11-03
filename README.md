# Description
This project is part of [TOP](https://www.theodinproject.com/lessons/ruby-linked-lists)
curriculum.
In this project, [linked list](https://en.wikipedia.org/wiki/Linked_list)
is implemented in Ruby.

# Overall Structure
1. **LinkedList** class, which represent the full list
2. **Node** class, which represent individual node

# LinkedList methods:
**#append(value)**

     add a new node containing value to the end of the list
**#prepend(value)**

     add a new node containing value to the start of the list
**#size**

     return the size of the list
     
**#head**

     return the first node of the list
     
**#tail**

     return the last node of the list
     
**#at(index)**

     return the node at given index
     
**#pop**

     remove the last node of the list
     
**#shift**

     remove the first node of the list
     
**#contains?(value)**

     return true if given value is in the list, else return false

**#find(value)**

     return the index of node containing value, or nil if it is not found
     
**#to_s**

     represent the link as the string
     
     the format should be: ( value ) -> ( value ) -> ( value ) -> nil
     
**#insert_at**

     insert new node with value at respective index
     
**#delete_at**
     
     delete node in list at respective index
 
