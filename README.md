# Enigma
### Functionality
- All iterations are complete.
  - Crack method and CLI completed and tested.
  - Encrypt/Decrypt and CLI completed and tested.

### Object Oriented Programming
- One Module used(Createable)
  - Used to create A, B, C, D hashes dynamically for offsets/keys
    - Hashes are merged later to create shifts
- Keys and Dates are created in their own classes
  - To keep things within my vision of single responsibility
- Enigma handles anything related to the actual enrypt/decrypt of messages
- Nothing can directly access anything else without first going through the class that it belongs in

### Ruby Conventions
- With the exception of 2 methods, nothing is over 10 lines.
  - These methods are 11 lines each, but cannot conveniently be any smaller.
- Used many ruby methods that were the only real answers to the problems I had.
- Varaible names are descriptive and make sense in their context.

### Test Driven Development
- One stub is used to fix dates on a specific date and ensure I don't have to rewrite a test every day.
- SimpleCov is at 100% coverage
- Class functionality is tested separate from each other class.
- Module methods are tested at the classes that use them (DateGen and KeyGen)

### Version Control
- 62 commits across 7 branches
  - Most commits dictate what they did directly and cover, at most, a test and the method that goes with it.

Overall I feel pretty confident, barring some very specific things, that I have mostly 4s and possibly a 3 sprinkled in for testing.
