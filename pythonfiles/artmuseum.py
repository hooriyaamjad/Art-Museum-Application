from email.headerregistry import Address
import mysql.connector
from tabulate import tabulate

def admin_consol():
    pass
def data_entry():
    print("""What would you like to do?
1 - Add information tuples to database
2 - Modify existing information in the database """) 
    data_input = input("Please select 1 or 2: ")

    if data_input == '1':
        print("""Available databases:
    1 - Artist
    2 - Collections """) 
        data_subinput = input("Please choose a database to add an information tuple")

        if data_subinput == '1':
            artist = input("Please enter the artist name: ")
            Date_Born = input("Please enter the date the artist was born: ")
            Date_Died = input("Please enter the date the artist died: ")
            Country_Origin = input("Please enter the country of origin: ")
            Epoch = input("Please enter the time period: ")
            Main_style = input("Please enter the main style of the artist")
            Art_description = input("Please enter the art description")

            cur.execute("INSERT INTO ARTIST (Artist_Name, Date_Born, Date_Died, Country_of_Origin, Epoch, Main_style, Artist_Description) VALUES (%s, %s, %s, %s, %s, %s, %s)", (artist, Date_Born, Date_Died, Country_Origin, Epoch, Main_style, Art_description))
        
        if data_subinput == '2':
            collection_name = input("Please enter the collection name: ")
            Collection_type = input("Please enter the collection type: ")
            Collection_description = input("Please enter the collection description: ")
            C_Address = input("Please enter the address: ")
            Phone = input("Please enter the phone number: ")
            Contact_Person = input("Please enter the contact person: ")

            cur.execute("INSERT INTO ARTIST (Collection_name, Collection_Type, Collection_Description, Address, Phone, Contact_person) VALUES (%s, %s, %s, %s, %s, %s)", (collection_name, Collection_type, Collection_description, C_Address, Phone, Contact_Person))


    if data_input == '2':
        print()

    pass

#--------------- Guest View Functions Start
def arttypes():
    print("""What art type are you looking for?
1 - Paintings
2 - Sculptures
3 - Other Art Types """)
    subselection = input('Please select 1, 2, or 3: ')
    print("\n")
    if subselection == '1':
        cur.execute("SELECT * FROM PAINTING")
        paintings = cur.fetchall()
        print(tabulate(paintings, headers=['Art ID#', 'Paint Type', 'Drawn on', 'Style'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    elif subselection == '2':
        cur.execute("SELECT * FROM SCULPTURE")
        sculptures = cur.fetchall()
        print(tabulate(sculptures, headers=['Art ID#', 'Material', 'Height (cm)', 'Weight (kg)', 'Style'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    elif subselection == '3':
        cur.execute("SELECT * FROM OTHER")
        other = cur.fetchall()
        print(tabulate(other, headers=['Art ID#', 'Art Type', 'Style'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to go back to art types menu
2 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        arttypes()
    if option == '2':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            arttypes()
        if option == '2':
            guest_view()

#--------------- 

def artist():
    print("List of artists in the art museum")
    cur.execute(" SELECT Artist_Name FROM ARTIST")
    artists = cur.fetchall()
    print(tabulate(artists, headers=['Artists in Art Museum'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input artist name as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM ARTIST WHERE Artist_Name =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Artist Name', 'Birth', 'Death', 'Country of Origin', 'Epoch', 'Main style', 'Artist Description'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to go back to artists
2 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        artist()
    if option == '2':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            artist()
        if option == '2':
            guest_view()

#--------------- 

def artobject():
    print("List of art objects in the art museum")
    cur.execute(" SELECT Title FROM ART_OBJECT")
    art_objects = cur.fetchall()
    print(tabulate(art_objects, headers=['Art Objects in Art Museum'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input art object name as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM ART_OBJECT WHERE Title =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Title', 'Artist', 'Art Description', 'Year Made', 'Country of Origin', 'Epoch'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to go back to art objects
2 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        artobject()
    if option == '2':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            artobject()
        if option == '2':
            guest_view()

#--------------- 

def borrow():
    print("List of borrowed art objects in the art museum")
    cur.execute(" SELECT Title, Id_no FROM ART_Object WHERE Id_no IN (SELECT Id_no FROM BORROWED) ")
    borrowed = cur.fetchall()
    print(tabulate(borrowed, headers=['Borrowed Art Objects in Art Museum', 'Art ID#'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input art object ID# as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM BORROWED WHERE Id_no =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Collection Borrowed', 'Date Borrowed', 'Date Returned'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to go back to borrowed art objects
2 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        borrow()
    if option == '2':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            borrow()
        if option == '2':
            guest_view()

#--------------- 

def pcollection():
    print("List of art object ID# from permanenet collections in the art museum")
    cur.execute(" SELECT Id_no FROM PERMANENT_COLLECTION")
    b_collect = cur.fetchall()
    print(tabulate(b_collect, headers=['Permanenet art objects in Art Museum', 'Art ID#'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input art object ID# as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM ART_OBJECT WHERE Id_no =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Title', 'Artist', 'Art Description', 'Year Made', 'Country of Origin', 'Epoch'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to go back to permanent collections
2 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        pcollection()
    if option == '2':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            pcollection()
        if option == '2':
            guest_view()

#--------------- 

def bcol_idartobject():
    subselection = input("Please input art object ID# as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM ART_OBJECT WHERE Id_no =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Title', 'Artist', 'Art Description', 'Year Made', 'Country of Origin', 'Epoch'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to select different art object ID#
2 to select differemt borrowed collection
3 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        bcol_idartobject()
    if option == '2':
        print("\n")
        bcollection()
    if option == '3':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            bcol_idartobject()
        if option == '2':
            print("\n")
            bcollection()
        if option == '3':
            guest_view()

def bcollection():
    print("List of borrowed collections in the art museum")
    cur.execute(" SELECT Collection_Name FROM COLLECTIONS")
    b_collect = cur.fetchall()
    print(tabulate(b_collect, headers=['Borrowed Collections in Art Museum', 'ID#'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input collection name as shown in list to view borrowed art objects: ")
    print("\n")
    cur.execute(" SELECT * FROM BORROWED WHERE Collection_Borrowed =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Collection Borrowed', 'Date Borrowed', 'Date Returned'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    bcol_idartobject()

#--------------- 

def ex_idartobject():
    subselection = input("Please input art object ID# as shown in list: ")
    print("\n")
    cur.execute(" SELECT * FROM ART_OBJECT WHERE Id_no =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Art ID#', 'Title', 'Artist', 'Art Description', 'Year Made', 'Country of Origin', 'Epoch'], tablefmt='rounded_outline', missingval="N/A", numalign="left"))
    print("\n")

    option = input("""Please select:
0 to quit
1 to select different art object ID#
2 to select differemt exhibiton
3 to go back to main menu

Select: """)
    if option == '0':
        exit(); 
    if option == '1':
        ex_idartobject()
    if option == '2':
        print("\n")
        exhibition()
    if option == '3':
        guest_view()
    else:
        option = input("Please input valid option: ")
        if option == '0':
            exit(); 
        if option == '1':
            ex_idartobject()
        if option == '2':
            print("\n")
            exhibition()
        if option == '3':
            guest_view()

def exhibition():
    print("List of exhibitions in the art museum")
    cur.execute(" SELECT DISTINCT Exhibitions_name FROM EXHIBITIONS")
    b_collect = cur.fetchall()
    print(tabulate(b_collect, headers=['Exhibitions in Art Museum', 'ID#'], tablefmt='rounded_outline', numalign="left"))

    subselection = input("Please input exhibition name as shown in list to view art objects: ")
    print("\n")
    cur.execute(" SELECT Id_no FROM EXHIBITIONS WHERE Exhibitions_name =%s", (subselection,))
    result = cur.fetchall()
    print(tabulate(result, headers=['Exhibitions art object ID#'], tablefmt='rounded_outline', numalign="left"))

    ex_idartobject()

#--------------- Guest View Functions End 
   
def guest_view():

    print("""What are you looking for?
1 - Search paintings, sculptures or other art types
2 - Search artist information
3 - Search art objects
4 - Search borrowed art objects
5 - Search borrowed collections
6 - Search permanent collections
7 - Search exhibitions """) 
    selection = input("Please select 1, 2, 3, 4, 5, 6, or 7: ")

    if selection == '1':
        arttypes()
    if selection == '2':
        artist()
    if selection == '3':
        artobject()
    if selection == '4':
        borrow()
    if selection == '5':
        bcollection()
    if selection == '6':
        pcollection()
    if selection == '7':
        exhibition()
    else: 
        selection = input("Please select valid option: ")
        if selection == '1':
            arttypes()
        if selection == '2':
            artist()
        if selection == '3':
            artobject()
        if selection == '4':
            borrow()
        if selection == '5':
            bcollection()
        if selection == '6':
            pcollection()
        if selection == '7':
            exhibition()

   
if __name__ == "__main__":
    
    # Connect to server
    print("""\nWelcome to the Art Museum Database
In order to proceed, please select your role from the list below: 
1 - DB Admin
2 - Data Entry
3 - Browse as guest """)
    selection = input("Please type 1, 2, or 3 to select your role: ")
    print("\n")

    if selection in ['1','2']:
        username = input("Username:")
        passcode = input("Password:")
    else:
        username = "Guest"
        passcode = None
        
    cnx = mysql.connector.connect(
        host = "127.0.0.1",
        port = 3306,
        user = username,
        password = passcode)   

    # Get a cursor
    cur = cnx.cursor()

    # Execute a query
    cur.execute("use artmuseum")

    if selection == '1':
        admin_consol()
    elif selection == '2':
        data_entry()
    else:
        guest_view()