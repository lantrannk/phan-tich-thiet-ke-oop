workspace {

    model {
        user = person "Customer" "Customers with website accounts"
        admin = person "Admin" "Sales site management"
        manager = softwareSystem "Transportion system" "Deliver shoes to customers"
        WebUser = softwareSystem "Email system" "The Google email service about promotions, bills, advertisements" {
            WebUser -> user "Sends email to"
        } 
        
        softwareSystem = softwareSystem "Online sales system" "\n-Customers visit the website to view products or make purchases.\n-Admin will manage and update the website."  {
            webapp = container "Web-Application" "Delivers the static content of shoes website" "JS and VueJs"{
                user -> this "Register or Login"
                admin -> this "Login"
                
            }
          
            Data = container "Database" "Store products, customers, bills" "SQL server 2019" {
                
            }
            Api = container "API Application" "Use it for the back-end" "ASP.NET core and C#"{
                Api -> Data "Reads from and writes [JDBC]"
            }
            
            
            
        }
        
       
        webapp -> Api "Makes API call to"
        Api -> manager "Process Orders"
        manager -> user "Sends shoes"
        Api -> WebUser "Sends Email using"
     
        
        
       
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

         
       

        container softwareSystem {
            include *
            autolayout lr
        }

        
    }

}