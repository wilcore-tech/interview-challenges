package io.wilcore.addressbook.model;

/**
 * Represents the verification level of a contact's account.
 * Used for Path B (Identity & Access Control) requirements.
 */
public enum AccountLevel {
    BASIC,      // Account created, identity not yet verified
    VERIFIED,   // Identity verified via SSN + DOB match
    PREMIUM     // Enhanced verification completed
}
