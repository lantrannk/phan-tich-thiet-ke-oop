workspace {
 
    model {
        user = person "Customer" "Customers with website accounts" "customer"
        admin = person "Admin" "Sales site management"
       
        softwareSystem = softwareSystem "Online sales system" "Customers visit the website to view products or make purchases Admin will manage and update the website."  {
 
            webapp = container "Web Application" "Delivers the static content of shoes website" "JS and VueJs"{
                user -> this "Register or Login"
               
               }
            pageapp = container "Single Page Application Admin" "Server static website assets to customer" "Apache"{
                admin -> this "Login"
               
               }
               
           
            api = container "API Application" "Use it for the back-end" "ASP.NET core and C#"{
                register = component "Register Controller" "Allows users to register to use all functions of the web." "ASP.NET core" {
                    webapp -> this "Make API calls to"
                }
                signIn = component "Sign In Controller" "Allows users to login to the website.""ASP.NET core" {
                    webapp -> this "Make API calls to"
                }
                cart = component "Cart Controller" "Allows users to view products added to the cart, manage it.""ASP.NET core" {
                    webapp -> this "Make API calls to"
                }
                view = component "View Controller" "Allows users to view list of products and interact with product." "ASP.NET core"{
                    webapp -> this "Make API calls to"
                }
                bill = component "Bill Controller" "Allows users to view the latest paid bill and old bills." "ASP.NET core"{
                    webapp -> this "Make API calls to"
                }
                category = component "Category Controller" "Categorizes the products in the website.""ASP.NET core" {
                    webapp -> this "Make API calls to"
                }
 
                info = component "Information Component" "Provides functions such as sending necessary information to the Transportation system and sending information of bills to users." "ASP.NET core"{
                    bill -> this "Uses"
                }
                security = component "Security Component" "Provides functionality related to register, signing in etc." "ASP.NET core"{
                    register -> this "Uses"
                    signIn -> this "Uses"
                }
                manage = component "Manager Component" "Provides functions such as filtering products following categories, adding to favorite lists, viewing product details, and adding to cart.""ASP.NET core" {
                    view -> this "Uses"
                    category -> this "Uses"
                }
                order = component "Order Component" "Provides functions such as editing, deleting products in the cart, making payments.""ASP.NET core" {
                    cart -> this "Uses"
                }
                bills = component "Bill Component" "Provides functions such as viewing, deleting, editing all bills.""ASP.NET core" {
                    bill -> this "Uses"
                }
 
           
           
            }
            pageapi = container "API Administration" "Use it for the back-end" "ASP.NET core and C#" "ASP.NET core"{
             pageapp -> this "Make API calls to"
                product = component "Product Controller" "Allows administrators to manage all products in the website." "ASP.NET core"{
                    pageapp -> this "Make API calls to"
                }
                account = component "Account Controller" "Allows administrators to manage all accounts in the website.""ASP.NET core" {
                    pageapp -> this "Make API calls to"
                }
                customer = component "Customer Controller" "Allows administrators to manage all customer in the website." "ASP.NET core"{
                    pageapp -> this "Make API calls to"
                }
                categories = component "Categories Controller" "Allows administrators to manage all category in the website." "ASP.NET core"{
                    pageapp -> this "Make API calls to"
                }
              
 
                productmanage = component "Product Component" "Provide functions such as adding, editing, deleting products." "ASP.NET core"{
                    product -> this "Uses"
                }
                 accountmanage = component "Account Component" "Provide functions such as editing, deleting accounts." "ASP.NET core"{
                    account -> this "Uses"
                    
                }
                 customermanage = component "Customer Component" "Provide functions such as adding, editing, deleting customers." "ASP.NET core"{
                   customer -> this "Uses"
                    
                }
                 categorymanage = component "Category Component" "Provide functions such as adding, editing, deleting category." "ASP.NET core"{
                    categories -> this "Uses"
                }
                
 
           
           
             
            }
 
            data = container "Database" "Store products, category, customers, bills, accounts, etc" "SQL server 2019" "Cylinder" {
                // info -> this "Reads from and writes to"
                security -> this "Reads from and writes to"
                manage -> this "Reads from and writes to"
                order -> this "Reads from and writes to"
                bills -> this "Reads from and writes to"
                productmanage -> this "Reads from and writes to"
                accountmanage -> this "Reads from and writes to"
                customermanage -> this "Reads from and writes to"
                categorymanage -> this "Reads from and writes to"
            }    
        pageapi -> data "Sends"
 
        }
 
        manager = softwareSystem "Transportation System" "Deliver shoes to customers" {
            info -> this "Sends"
        }
        message = softwareSystem "Message system" "Information of bills" {
            info -> this "Sends"
        }
       
       
    }
 
    views {
        systemContext softwareSystem "Customer" {
            include *
            autolayout lr
           
        }
     
       
        styles {
            element "Person" {
                shape person
                background #08427b
                color #ffffff
 
            }
            element "Software System" {
                background  #1168bd
                color #ffffff
            }
            element "container" {
                background  #1168bd
                color #ffffff
            }
            element Cylinder {
                shape "Cylinder"
                background #1168bd
                color #ffffff
            }
 
        }
   
       
 
        container softwareSystem  {
            include *
            autolayout lr
        }
        component api {
            include *
            autolayout lr
        }
        component pageapi {
            include *
            autoLayout
    }                
}