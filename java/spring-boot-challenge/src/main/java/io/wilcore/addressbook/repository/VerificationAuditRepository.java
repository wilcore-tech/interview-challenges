package io.wilcore.addressbook.repository;

import io.wilcore.addressbook.model.VerificationAudit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VerificationAuditRepository extends JpaRepository<VerificationAudit, Long> {
}
