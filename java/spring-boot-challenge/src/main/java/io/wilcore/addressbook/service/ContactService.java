package io.wilcore.addressbook.service;

import io.wilcore.addressbook.dto.ContactRequest;
import io.wilcore.addressbook.dto.ContactResponse;
import io.wilcore.addressbook.dto.VerificationRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ContactService {

    Page<ContactResponse> list(Pageable pageable);

    ContactResponse findById(Long id);

    ContactResponse create(ContactRequest request);

    ContactResponse update(Long id, ContactRequest request);

    void delete(Long id);

    Page<ContactResponse> search(String q, String email, String city, String state, Pageable pageable);

    ContactResponse verify(Long id, VerificationRequest request);

    ContactResponse secureDetails(Long id);
}
