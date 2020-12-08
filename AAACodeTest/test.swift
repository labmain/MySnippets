import Foundation

let date = Date() 
let format = "EEEE-dd-MMM-yyyy" 
let dateFormatter = DateFormatter() 
dateFormatter.dateFormat = format 

dateFormatter.string(from: date) 
print(dateFormat.string)
