// Define a Logger mixin
mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

// Define a base Character class
class Character with Logger {
  String name;
  int health;

  Character(this.name, this.health);

  void attack(Character target) {
    logDebug('$name is attacking ${target.name}');
    // Logic for attacking
  }

  void takeDamage(int damage) {
    health -= damage;
    logInfo('$name took $damage damage. Remaining health: $health');
    if (health <= 0) {
      logWarning('$name has been defeated!');
    }
  }
}

// Define subclasses for different character classes
class Warrior extends Character {
  int strength;

  Warrior(String name, int health, this.strength) : super(name, health);

  void charge() {
    logDebug('$name is charging towards the enemy!');
    // Warrior specific action
  }
}

class Mage extends Character {
  int mana;

  Mage(String name, int health, this.mana) : super(name, health);

  void castSpell() {
    logDebug('$name is casting a spell!');
    // Mage specific action
  }
}

class Rogue extends Character {
  int agility;

  Rogue(String name, int health, this.agility) : super(name, health);

  void sneakAttack() {
    logDebug('$name is performing a sneak attack!');
    // Rogue specific action
  }
}

void main() {
  // Example usage
  var warrior = Warrior('Conan', 100, 20);
  var mage = Mage('Merlin', 80, 50);
  var rogue = Rogue('Thief', 70, 30);

  warrior.attack(mage);
  mage.takeDamage(15);

  mage.castSpell();
  rogue.sneakAttack();

  warrior.charge();
}
