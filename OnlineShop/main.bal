//import ballerina/io;
import ballerina/http;

enum Size{
xs,
sm,
md,
lg,
xl
}

type Product record {
    readonly string id;
    string name;
    float price;
    int|Size size;
    string description;
    boolean available;
};

table <Product> key (id)
productTable=table[];

service on new http:Listener(4000){ 
    // Add new products
    //Update exisiting products
    //View Availability products
    //Delete products 
    //Add to chart 
   
    


 resource function post AddNew (Product newproduct)returns string{

    productTable.add(newproduct);
    return "Product saved";
 }

 resource function get ViewProducts() returns Product[]{

    Product [] AvailableProducts =[];
    foreach Product product in productTable{
        if product.available == true{

            AvailableProducts.push(product);
        }
    }
   return AvailableProducts; 
 }


resource function get ViewProduct/[string id]()returns Product {
   Product ViewPro = productTable.get(id);
   return ViewPro;
}
Fusek

}

