package io.wilcore.addressbook.service;

import io.wilcore.addressbook.dto.ContactRequest;
import io.wilcore.addressbook.dto.ContactResponse;
import io.wilcore.addressbook.dto.VerificationRequest;
import io.wilcore.addressbook.repository.ContactRepository;
import io.wilcore.addressbook.repository.VerificationAuditRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {

    private final ContactRepository contactRepository;
    private final VerificationAuditRepository verificationAuditRepository;

    public ContactServiceImpl(ContactRepository contactRepository, VerificationAuditRepository verificationAuditRepository) {
        this.contactRepository = contactRepository;
        this.verificationAuditRepository = verificationAuditRepository;
    }

    @Override
    public Page<ContactResponse> list(Pageable pageable) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public ContactResponse findById(Long id) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public ContactResponse create(ContactRequest request) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public ContactResponse update(Long id, ContactRequest request) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public void delete(Long id) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Page<ContactResponse> search(String q, String email, String city, String state, Pageable pageable) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public ContactResponse verify(Long id, VerificationRequest request) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public ContactResponse secureDetails(Long id) {
        throw new UnsupportedOperationException("Not implemented yet.");
    }
}
