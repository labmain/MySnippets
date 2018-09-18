function sumAll(arr) {

    arr.sort(function(a,b) {
        return a - b;
    });
  
    var min = arr[0];
    var max = arr[1];
    console.log(arr);
    
    var array = [];
    for(var i = min + 1; i < max; i++) {
      array.push(i);
    }
    
    var total = array.reduce(function(a,b) {
      return a + b;
    });
    
    console.log(total);
  }
  
  sumAll([5, 10]);
  