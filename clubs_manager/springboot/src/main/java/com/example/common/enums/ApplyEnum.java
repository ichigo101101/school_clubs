package com.example.common.enums;

public enum ApplyEnum {
    PROCESS_HEADER_APPLYING("社长审核中"),
    PROCESS_HEADER_APPLIED("审核完成"),

    STATUS_APPLYING("待审核"),
    STATUS_APPLY_OK("审核通过"),
    STATUS_APPLY_NO("审核不通过"),
    ;

    public String status;

    ApplyEnum(String status) {
        this.status = status;
    }
}
