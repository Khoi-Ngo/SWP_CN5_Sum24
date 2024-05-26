package org.swp.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class BaseEntity {
    private LocalDateTime createdTime = LocalDateTime.now();
    private LocalDateTime modifiedTime;
    private String createdBy;
    private String modifiedBy;
    private boolean isDeleted = false;
}
