package io.wilcore.addressbook.controller;

import io.wilcore.addressbook.service.ContactService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Starter controller for the contact API.
 *
 * Candidates should implement the REST endpoints here using the provided
 * service, DTO, and repository packages.
 */
@RestController
@RequestMapping("/api/contacts")
public class ContactController {

    private final ContactService contactService;

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    // TODO: Add controller methods for the contact API.
}
