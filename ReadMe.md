# Codebase Overview

This project contains a collection of Metta-based operations and exercises. The code is divided into three main folders:

1. **Binary Tree Data Structure**
2. **List Operations**
3. **Exercise 1**

Each folder contains specific functionality and operations written in the MeTTa language.

## Folder Structure

### 1. **Binary Tree Data Structure**

This folder contains files that implement various binary tree operations, including creating nodes, traversing the tree, searching for values, and accessing specific parts of the tree.

#### Files:

- **`binary_all_in_one.metta`**: A single file that combines all the binary tree operations including node creation, traversal, search, and access.
- **`traversal.metta`**: Contains functions to perform tree traversal (inorder, postorder, etc.).
- **`search.metta`**: Implements functions for searching values within a binary tree.
- **`access.metta`**: Provides functions to access the value, left child, and right child of a tree node.

#### Operations:

- **Node creation**: Defines how to create a node with a value and children.
- **Tree traversal**: Implements traversal methods such as inorder, postorder, etc.
- **Tree search**: Allows searching for a value in the binary tree.
- **Tree access**: Retrieves the value, left, and right children of a node.

---

### 2. **List Operations**

This folder contains 15 key list operations. Each operation performs a specific task related to list manipulation.

#### Functions:

1. **`length`**: Returns the length of the list.
2. **`is-member`**: Checks whether an element is present in the list.
3. **`append`**: Appends an element to the end of the list.
4. **`max-value`**: Finds the maximum value in the list.
5. **`min-value`**: Finds the minimum value in the list.
6. **`push`**: Adds an element to the beginning of the list.
7. **`pop`**: Removes the last element from the list and returns the remaining list.
8. **`remove-element`**: Removes a specified element from the list.
9. **`remove-duplicate`**: Removes duplicate elements from the list.
10. **`map`**: Applies a given function to each element of the list.
11. **`filter`**: Filters the list based on a given condition.
12. **`foldl`**: Folds the list from the left, combining its elements using a specified function.
13. **`foldr`**: Folds the list from the right, combining its elements using a specified function.
14. **`reverse`**: Reverses the elements of the list.
15. **`sort`**: Sorts the elements of the list.

Each of these functions can be used independently for common list operations such as adding, removing, or modifying elements.

---

### 3. **Exercise 1**

This folder contains knowledge representation and query functions for a family tree Atomspace. These functions implement basic family relationships such as retrieving parents, siblings, uncles, nephews, and predecessors. Below are the details of each query:

#### Functions:

1. **`parent_of $child`**: Retrieves the parents of a given child.

   - Example: `!(parent_of John)` returns the parents of John.

2. **`mother_of $child`**: Retrieves the mother of a given child.

   - Example: `!(mother_of Pam)` returns the mother of Pam.

3. **`sibling_of $child`**: Retrieves the siblings of a given child.

   - Example: `!(sibling_of Pam)` returns the siblings of Pam.

4. **`uncle_of $child`**: Retrieves the uncles of a given child.

   - Example: `!(uncle_of Tim)` returns the uncles of Tim.

5. **`nephews_of $man`**: Retrieves the nephews of a given person.

   - Example: `!(nephews_of John)` returns the nephews of John.

6. **`Predecessors $child`**: Retrieves all predecessors (ancestors) of a given person.
   - Example: `!(Predecessors Bob)` returns all the predecessors of Bob.

#### Knowledge Representation:

- The family tree is represented in the Atomspace using simple facts such as:
  - `Male` or `Female` to denote gender.
  - `Parent` relationships to define family connections.

For example:

````metta
(Male Chandler)
(Female Monica)
(Parent Chandler John)

## How to Clone and Use the Repository

To clone this repository and use the code, follow the steps below:

### 1. Clone the Repository
First, open a terminal or command prompt and run the following command to clone the repository:

```bash
git clone https://github.com/eyobderese/OpenCog-Hyperon-Task.git
````

### 2. Navigate to the Project Directory

Once the repository is cloned, navigate to the project directory:

```bash
cd OpenCog-Hyperon-Task
```

### 3. Copy the code to the OpenCog Hyperon Environment

Copy the code from the repository to the OpenCog Hyperon environment. and run it using the MeTTa interpreter. on [playGround](https://metta-lang.dev/docs/playground/playground.html)
