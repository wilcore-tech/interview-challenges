package io.wilcore.addressbook.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public class VerificationRequest {

    @NotBlank
    @Pattern(regexp = "\\d{4}", message = "lastFourSsn must be exactly 4 digits")
    private String lastFourSsn;

    @NotBlank
    private String dateOfBirth;

    public VerificationRequest() {
    }

    public String getLastFourSsn() {
        return lastFourSsn;
    }

    public void setLastFourSsn(String lastFourSsn) {
        this.lastFourSsn = lastFourSsn;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
