const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question('Would you like some tea?', (answer1) => {
  console.log(answer1);
  reader.question('Would you like some biscuits?', (answer2) => {
    console.log(`So you answered: ${answer1} and ${answer2}`);
    reader.close();
  });
});
