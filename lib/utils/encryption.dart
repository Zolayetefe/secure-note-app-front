import 'dart:convert';
import 'package:blowfish/blowfish.dart';

class EncryptionUtil {
  // Key and IV (Initialization Vector) for Blowfish encryption
  static final List<int> _key = utf8.encode("mysecretpassword"); // Replace with your secure key
  static final List<int> _iv = utf8.encode("12345678"); // Blowfish uses an 8-byte IV

  /// Encrypts the given plaintext using Blowfish in ECB mode
  static String encryptECB(String plaintext) {
    final blowfish = newBlowfish(_key);
    final plaintextBytes = utf8.encode(plaintext);
    final encryptedBytes = blowfish.encryptECB(plaintextBytes);
    return base64.encode(encryptedBytes);
  }

  /// Decrypts the given ciphertext using Blowfish in ECB mode
  static String decryptECB(String ciphertext) {
    final blowfish = newBlowfish(_key);
    final encryptedBytes = base64.decode(ciphertext);
    final decryptedBytes = blowfish.decryptECB(encryptedBytes);
    return utf8.decode(decryptedBytes);
  }

  /// Encrypts the given plaintext using Blowfish in CBC mode
  static String encryptCBC(String plaintext) {
    final blowfish = newBlowfish(_key);
    final plaintextBytes = utf8.encode(plaintext);
    final encryptedBytes = blowfish.encryptCBC(plaintextBytes, _iv);
    return base64.encode(encryptedBytes);
  }

  /// Decrypts the given ciphertext using Blowfish in CBC mode
  static String decryptCBC(String ciphertext) {
    final blowfish = newBlowfish(_key);
    final encryptedBytes = base64.decode(ciphertext);
    final decryptedBytes = blowfish.decryptCBC(encryptedBytes, _iv);
    return utf8.decode(decryptedBytes);
  }

  /// Encrypts using a Salted Blowfish instance in ECB mode
  static String encryptSaltedECB(String plaintext) {
    final blowfish = newSaltedBlowfish(_key, _iv);
    final plaintextBytes = utf8.encode(plaintext);
    final encryptedBytes = blowfish.encryptECB(plaintextBytes);
    return base64.encode(encryptedBytes);
  }

  /// Decrypts using a Salted Blowfish instance in ECB mode
  static String decryptSaltedECB(String ciphertext) {
    final blowfish = newSaltedBlowfish(_key, _iv);
    final encryptedBytes = base64.decode(ciphertext);
    final decryptedBytes = blowfish.decryptECB(encryptedBytes);
    return utf8.decode(decryptedBytes);
  }
}
