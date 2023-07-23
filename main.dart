import 'dart:io';

List<Map> userIds = [
  {'email': 'user1@gmail.com', 'password': 'user1'},
  {'email': 'user2@gmail.com', 'password': 'user2'},
  {'email': 'user3@gmail.com', 'password': 'user3'},
  {'email': 'user4@gmail.com', 'password': 'user4'}
];
List<String> areas = [
  'saddar',
  'nazimabad',
  'surjani',
  'orangi',
  'hussainabad'
];
List<Map<String, dynamic>> foods = [
  {'dish': 'Biryani', 'price': 250},
  {'dish': 'Burger', 'price': 450},
  {'dish': 'Pizza', 'price': 850},
  {'dish': 'ice cream', 'price': 150},
];
List<String> dishes = ["Biryani", "Burger", "Pizza", "ice cream"];
List<String> orders = [];
List billing = [];
void main() {
  print("=====foods inn=====");
  print("for login to admin id Press: 1");
  print("If you're a user then Press: 2");
  String user = stdin.readLineSync()!;
  if (user == "1") {
    admin();
  } else if (user == "2") {
    users();
  }
}

admin() {
  var isContinue = true;
  while (isContinue) {
    var email = "admin@gmail.com";
    var password = "12345";
    for (var i = 3; i > 0; i--) {
      stdout.write("enter email : ");
      var adminEmail = stdin.readLineSync();
      stdout.write("enter password : ");
      var adminPass = stdin.readLineSync();
      if (adminEmail == email && password == adminPass) {
        print("Login successfull");
        print("===WELCOME TO ADMIN DASHBOARD===");
        break;
      } else {
        print(
            "Invalid email or password. Please try again. Remember you have remaining ${i - 1} attempts");
      }
      if (i == 1) {
        print("You have exceeded the maximum attempt. Good bye!");
      }
    }
    isContinue = false;
  }
}

users() {
  print("Continue with facebook press : 1");
  print("Continue with Gmail    press : 2");
  print("Continue with Apple    press : 3");
  print("Log in                 press : 4");
  print("Sign up                press : 5");
  String press = stdin.readLineSync()!;
  if (press == "1") {
    print("===WELCOME TO DASHBOARD===");
    Location();
  } else if (press == 2) {
    print("===WELCOME TO DASHBOARD===");
    Location();
  } else if (press == "3") {
    print("===WELCOME TO DASHBOARD===");
    Location();
  } else if (press == "4") {
    userLogin();
  } else if (press == "5") {
    userSignup();
  }
}

userLogin() {
  bool isContinue = false;
  while (!isContinue) {
    stdout.write("Please enter username");
    String emailId = stdin.readLineSync()!;
    stdout.write("Please enter password");
    String pasword = stdin.readLineSync()!;
    isContinue = check(emailId, pasword, userIds);
    if (isContinue) {
      print("===WELCOME TO DASHBOARD");
      Location();
    } else {
      print("Invalid email or password");
    }
  }
}

check(String emailId, String pasword, List userIds) {
  for (var user in userIds) {
    if (user['email'] == emailId && user['password'] == pasword) {
      return true;
    }
  }
  return false;
}

userSignup() {
  stdout.write("Enter user name : ");
  String userName = stdin.readLineSync()!;
  stdout.write("Enter password : ");
  String password = stdin.readLineSync()!;
  stdout.write("Enter password again ");
  var confirmPassword = stdin.readLineSync();
  if (password == confirmPassword) {
    print("Congratulations! You are registered now");
    Map newItem = {'email': '$userName', 'password': '$password'};

    userIds.add(newItem);
    userLogin();
  } else {
    print("Incorrect password");
  }
}

Location() {
  print('Enter your location:');
  String userArea = stdin.readLineSync()!;

  if (areas.contains(userArea)) {
    print('congratulation! we are operating in this area');
    displayInfo();
  } else {
    print('Invalid Location. We are not available in this area');
  }
}

displayInfo() {
  print("Press : 1 to view menu card");
  print("Press : 2 to place order");
  print("Press : 3 to view your order");
  print("Press : 4 to view your bill");
  print("Press : 5 to confirm your order");
  String infoKeys = stdin.readLineSync()!;
  if (infoKeys == "1") {
    menuCard();
  } else if (infoKeys == "2") {
    placeOrder();
  } else if (infoKeys == "3") {
    print(orders);
  } else if (infoKeys == "4") {
    billingAmount();
  } else if (infoKeys == "5") {
    confirmOrder();
  }
}

menuCard() {
  print("====MENU CARD====");
  for (var i = 0; i <= foods.length - 1; i++) {
    print("${foods[i]['dish']} , ${foods[i]['price']}");
  }
  displayInfo();
}

placeOrder() {
  print("enter your meal");
  String meals = stdin.readLineSync()!;
  if (dishes.contains(meals)) {
    print(" $meals succesfully added to cart");
    orders.add(meals);
    bill();
  } else {
    print("We do not have this meal");
  }
  displayInfo();
}

bill() {
  stdout.write("Enter your food price");
  var amount = stdin.readLineSync()!;
  billing.add(amount);
  displayInfo();
}

billingAmount() {
  print(billing);
  displayInfo();
}

confirmOrder() {
  if (orders.length == 0) {
    print("you have not order anything yet");
    displayInfo();
  }
  last();
  exit(0);
}

delieverytask() {
  print("Your Order has been confirmed");
}

cardPay() {
  print("Select your card type");
  print("1 : Master Card");
  print("2 : Visa Card");
  var cardtype = stdin.readLineSync();

  print("Enter your Card No");
  var cardNo = stdin.readLineSync();
  print("Your Order has been confirmed");
}

last() {
  print("Select any one of the following Payment Method");
  print("Enter 1 to pay by your card");

  print("Enter 2 for cash on delievery");
  var usersInput = stdin.readLineSync();
  if (usersInput == "2") {
    delieverytask();
  } else if (usersInput == "1") {
    cardPay();
  } else {
    last();
  }
}
