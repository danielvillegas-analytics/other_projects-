books = []

def add_book(title, author, genre):
    book = {
        'title': title,
        'author': author,
        'genre': genre
    }
    books.append(book)
    print("Book added successfully.")

def display_books():
    if not books:
        print("No books found.")
        return

    for book in books:
        print("Title:", book['title'])
        print("Author:", book['author'])
        print("Genre:", book['genre'])
        print("-----------------------")

def search_books(search_term):
    found_books = []
    
    for book in books:
        if search_term.lower() in book['title'].lower() or search_term.lower() in book['author'].lower():
            found_books.append(book)
    
    if not found_books:
        print("No matching books found.")
    else:
        print("Matching books:")
        for book in found_books:
            print("Title:", book['title'])
            print("Author:", book['author'])
            print("Genre:", book['genre'])
            print("-----------------------")

def remove_book(search_term):
    found_book = None
    
    for book in books:
        if search_term.lower() in book['title'].lower() or search_term.lower() in book['author'].lower():
            found_book = book
            break
    
    if found_book:
        books.remove(found_book)
        print("Book removed successfully.")
    else:
        print("Book not found.")

def menu():
    print("Welcome to the ville's Library!")
    print("1. Add Book")
    print("2. Display Books")
    print("3. Search Books")
    print("4. Remove Book")
    print("5. Quit")

while True:
    menu()
    choice = input("Enter your choice (1-5): ")
    
    if choice == '1':
        title = input("Enter the book's title: ")
        author = input("Enter the book's author: ")
        genre = input("Enter the book's genre: ")
        add_book(title, author, genre)
    elif choice == '2':
        display_books()
    elif choice == '3':
        search_term = input("Enter the title or author to search: ")
        search_books(search_term)
    elif choice == '4':
        search_term = input("Enter the title or author of the book to remove: ")
        remove_book(search_term)
    elif choice == '5':
        print("Thank you for using the Library Management System. Goodbye!")
        break
    else:
        print("Invalid choice. Please try again.")