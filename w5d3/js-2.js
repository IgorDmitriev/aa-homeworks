// Phase I: Callbacks
//
// Write a function titleize that takes an array of names and a function (callback).
// titleize should use Array.prototype.map to create a new array full of
// titleized versions of each name - titleize meaning "Roger" should be made
// to read "Mx. Roger Jingleheimer Schmidt". Then pass this new array of
// names to the callback, which should use Array.prototype.forEach to print out each titleized name.
//
// > titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined


function titleize(names, callback) {
  let titleized = names.map(function(el){
    return 'Mx. ' + el + ' Jungleheimer Schmidt';
  });
  callback(titleized);
}

function printCallback(titleized){
  titleized.forEach((el) => console.log(el));
}

titleize(["Mary", "Brian", "Leo"], printCallback);
