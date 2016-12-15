function madLib(verb, adjective, noun) {
  console.log('We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase());
}

madLib('make', 'best', 'guac');

console.log('-----------')

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));
}

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

function fizzBuzz(array) {
  return array.filter(
    function(el) {
      return ((el % 3 === 0) && (el % 5 > 0)) ||
        ((el % 5 === 0) && (el % 3 > 0));
    }
  );
}

console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,15]));

function isPrime(number) {
  for (var i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

console.log('is Prime:');
console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));


function sumOfNPrimes(n) {
  let sum = 0;
  let i = 2;
  while (n > 0) {
    if (isPrime(i)) {
      sum = sum + i;
      n = n - 1;
      i = i + 1;
    } else {
      i = i + 1;
    }
  }

  return sum;
}


console.log('Sum of N Primes:');
console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));



function allOrNothing() {
  let mod = arguments[0];
  for (var i = 1; i < arguments.length; i++) {
    if (arguments[i] % mod > 0) {
      return false;
    }
  }
  return true;
}

console.log('All or Nothing:');
console.log(allOrNothing(3, 9, 12, 6));
console.log(allOrNothing(5, 1, 2, 10));
