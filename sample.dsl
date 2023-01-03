workspace {

    model {
        user = person "Customer" "Customers with website accounts"
        admin = person "Admin" "Sales site management"
        manager = softwareSystem "Transportion system" "Deliver shoes to customers"
        WebUser = softwareSystem "Message system" "Information of bills" {
            WebUser -> user "Sends messages"
        } 
        
        softwareSystem = softwareSystem "Online sales system" "Customers visit the website to view products or make purchases Admin will manage and update the website."  {

            webapp = container "Web Application" "Delivers the static content of shoes website" "JS and VueJs"{
           
                
               
                user -> this "Register or Login"
                admin -> this "Login"
                
               }
                
            Data = container "Database" "Store products, customers, bills" "SQL server 2019" {
                
            }
            Api = container "API Application" "Use it for the back-end" "ASP.NET core and C#"{
                Api -> Data "Reads from and writes to"
              
                 acc = component "Account Controller" "Allows users to register,login in the website selling shoes" "ASP.net core"{
                 
                 
                 
                }
                
               
                Category = component "Categories Controller" "Categorize the products in the website" "ASP.net core"{
                 
                }
               
                Order = component "Order Controller" "Allows users to buy product and add to cart" "ASP.net core"{
                 
                }
                Product = component "Product Controller" "Allows admin manage products in the site" "ASP.net core"{
                
                }
                
                info = component "Information component" {

                }
                manaC = component "Manager component" {

                }
                security = component "Security Component" {

                }
                OrderC = component "Order component" {

                }
              
               Product -> manaC "uses"
               Category -> manaC "uses"
               Order -> OrderC "uses"
               acc -> security "uses"
               Order -> Info "uses"
               security -> Data "Sends"
               info -> WebUser "Sends"
               info -> manager "Sends"
               OrderC -> Data "Sends"
               manaC -> Data "Sends"
            }
            
            
            
        }
        
      
       // - connected to the container
        webapp -> Api "Makes API call to"
        Api -> manager "Process Orders"
        manager -> user "Sends shoes"
        Api -> WebUser "Sends Email/Message using"
        webapp -> Order "Make API calls to"
        webapp -> Category "Make API calls to"
        webapp -> Product "Make API calls to"
         webapp -> acc "Make API calls to"
       // connected to the component
       
        
       
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

