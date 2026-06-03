package io.wilcore.addressbook.dto;

import io.wilcore.addressbook.model.AccountLevel;
import io.wilcore.addressbook.model.Contact;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class ContactResponse {

    private Long id;
    private String firstName;
    private String lastName;
    private String street;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String email;
    private AccountLevel accountLevel;
    private LocalDate dateOfBirth;
    private LocalDateTime verificationDate;

    public ContactResponse() {
    }

    public static ContactResponse fromEntity(Contact contact) {
        ContactResponse response = new ContactResponse();
        response.setId(contact.getId());
        response.setFirstName(contact.getFirstName());
        response.setLastName(contact.getLastName());
        response.setStreet(contact.getStreet());
        response.setCity(contact.getCity());
        response.setState(contact.getState());
        response.setZip(contact.getZip());
        response.setPhone(contact.getPhone());
        response.setEmail(contact.getEmail());
        response.setAccountLevel(contact.getAccountLevel());
        response.setDateOfBirth(contact.getDateOfBirth());
        response.setVerificationDate(contact.getVerificationDate());
        return response;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public AccountLevel getAccountLevel() {
        return accountLevel;
    }

    public void setAccountLevel(AccountLevel accountLevel) {
        this.accountLevel = accountLevel;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public LocalDateTime getVerificationDate() {
        return verificationDate;
    }

    public void setVerificationDate(LocalDateTime verificationDate) {
        this.verificationDate = verificationDate;
    }
}
