workspace {

    model {
        user = person "Customer" "Customers with website accounts"
        admin = person "Admin" "Sales site management"
        
        softwareSystem = softwareSystem "Online sales system" "Customers visit the website to view products or make purchases Admin will manage and update the website."  {

            webapp = container "Web Application" "Delivers the static content of shoes website" "JS and VueJs"{
                user -> this "Register or Login"
                admin -> this "Login"
               }
                
            
            api = container "API Application" "Use it for the back-end" "ASP.NET core and C#"{
                register = component "Register Controller" "Allows users to register to use all functions of the web." {
                    webapp -> this "Make API calls to"
                }
                signIn = component "Sign In Controller" "Allows users to login to the website." {
                    webapp -> this "Make API calls to"
                }
                cart = component "Cart Controller" "Allows users to view products added to the cart, manage it." {
                    webapp -> this "Make API calls to"
                }
                view = component "View Controller" "Allows users to view list of products and interact with product." {
                    webapp -> this "Make API calls to"
                }
                bill = component "Bill Controller" "Allows users to view the latest paid bill and old bills." {
                    webapp -> this "Make API calls to"
                }
                category = component "Category Controller" "Categorizes the products in the website." {
                    webapp -> this "Make API calls to"
                }

                info = component "Information Component" "Provides functions such as sending necessary information to the Transportation system and sending information of bills to users." {
                    bill -> this "Uses"
                }
                security = component "Security Component" "Provides functionality related to register, signing in etc." {
                    register -> this "Uses"
                    signIn -> this "Uses"
                }
                manage = component "Manager Component" "Provides functions such as filtering products following categories, adding to favorite lists, viewing product details, and adding to cart." {
                    view -> this "Uses"
                    category -> this "Uses"
                }
                order = component "Order Component" "Provides functions such as editing, deleting products in the cart, making payments." {
                    cart -> this "Uses"
                }
                bills = component "Bill Component" "Provides functions such as viewing, deleting, editing all bills." {
                    bill -> this "Uses"
                }

            
           
            }

            data = container "Database" "Store products, customers, bills" "SQL server 2019" "Cylinder" {
                // info -> this "Reads from and writes to"
                security -> this "Reads from and writes to"
                manage -> this "Reads from and writes to"
                order -> this "Reads from and writes to"
                bills -> this "Reads from and writes to"
            }         
        }

        manager = softwareSystem "Transportation system" "Deliver shoes to customers" {
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
        component Api {
            include *
            autolayout lr
        }
        
    }                
}

