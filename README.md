# Enigma

An encryption / decryption algorithm.

2205 Final Solo Project for Eli Sachs

## Self Assessment

### Functionality: 3.0-3.3

Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented.

Crack and Crack CLI incorporated but incomplete (it can translate a message ending with " end" but cannot generate a key).

### Object Oriented Programming: 3.0-3.5

I decided to use my current structure for several reasons - first and foremost, because there was a time and energy crunch for the IC. However, after speaking to several instructors I decided to keep my current structure primarily because a) it shows the evolution and thought process of how I approached this project, b) it allowed me to practice using a module and inheritance in an interesting and I believe appropriate way (with regards to SRP) without sacrificing functionality or readability, and c) because it allowed my project to simultaneously follow the patterns/prompts expected while developing its own personality.

The project started with the Enigma class and evolved from there. Each Enigma instance generates a date and key which can optionally be used to encrypt/decrypt/sort of crack. Enigma can create new instances of Encryptor, Decryptor, and Cracker classes.

These three classes all share the Codable module, which contains many overlapping pieces of the "assembly line" style process. Encryptor and Decryptor share a superclass which allows them to have messages, keys and dates attributes, while Cracker does not need a pre-fab key attribute. Before I started on the Crack component of the project, there was a very nice balance between my Encryptor and Decryptor.

While Crack/Cracker did slightly disturb the "balance" of the code (it is somewhat a mutated version of Decryptor) I still believe my code adheres to my best understanding of the Single Responsibility Principle. I will outline the purpose of each class here:

* Enigma - Required by the pattern and a way to store and run encrypt/decrypt/crack repeatedly from one source with the same keys and dates if need be. (If you want to use different generated key/date for different messages, a new Enigma instance can be created)

* Cipher - A superclass for Decryptor/Encryptor to share message / autokey / today attributes and the module

* Codable - A module for Decryptor/Encryptor/Cracker with all pieces of the "assembly line" style process of manipulating keys/dates and converting a message. Abstraction incarnate. Contains a character index method, ways to shift between letters and numbers, message parsers and joiners, and the Decrypt/Cracker version of the shifted_array method (Encryptor's equivalent "override" shifted_array method goes in the other direction), among several others. I am very proud of how many methods I was able to modulate

* Crack/Decrypt/Encrypt - Runner files for CLI according to the required CLI pattern. Kept as short as possible while attempting to resolve a potential ARGV length error that a user might encounter

* Decryptor/Encryptor/Cracker - Classes used by Enigma (and through Enigma, Writer) to facilitate SRP appropriate design. These classes all share some characteristics while being unique enough to necessitate their encapsulation. Their similarities allow them to share several methods, contained in the Codable module. The first two classes also share a superclass, while Cracker is a bit of a mutated Decryptor class

* Writer - This method was created with SRP and SimpleCov in mind. It encapsulates the ability of the three runners to read and write files, all through class methods. I am also somewhat proud of this class, as it involves a fair amount of inter-class interaction. Each class method in Writer creates an Enigma instance, which itself uses a Decryptor/Encryptor/Cracker instance to encode/decode. Additionally, because it simultaneously reads/writes and prints to the CLI, which did not require testing according to the project specs, it was a prime candidate for encapsulation

* Also: Msgs folder - I thought it would be interesting/fun to read messages in one folder and create them in another (unencrypted to encrypted, or vice versa)

### Ruby Conventions and Mechanics: 3.0-3.5

Classes are appropriately named and communicate their purpose reasonably well. Code is mostly properly formatted, though a few lines involving CLI/'puts' messages in Writer are a bit over 80 chars. Shifted_array method(s) is/are more than 10 lines, and Writer class methods are 9 lines each, and are not very DRY (however I believe DRY is well applied throughout the majority of the project). Most enumerables/methods are well chosen, and can be justified, but I was unable to successfully figure out how to condense certain methods as mentioned. Hashes are incorporated in the Enigma class's encrypt/decrypt/crack methods.

### Test Driven Development: 3.0

Every method is RSpec tested at the unit and integration level. Tests were created before all methods except those involving CLI/read/write in Writer class (which was extensively tested in Pry). Pry was used extensively to create methods in Codable module. Many RSpec tests have multiple expect statements (robust and effective testing). All Codable module methods tested over the course of their development and confirm their output for all three Decryptor/Encryptor/Cracker classes. All tests pass, and SimpleCov is at 100%. No mocks and stubs were used.

### Version Control: 3.5

75+ Commits and 10+ PRs. Almost all if not all commits focus on a single small piece of functionality, well described in the commit message, and do not change multiple files unless done for a "Hound" recommended ruby conventions refactor. All PRs are well named and several include comments to guide future development, or explaining the process. All PRs use appropriate branches and branch naming conventions that describe what larger aspects of functionality were being worked on. Hound comments were often incorporated into the project's development.
