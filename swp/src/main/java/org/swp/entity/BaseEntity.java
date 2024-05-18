package org.swp.entity;

import java.time.LocalDateTime;

public class BaseEntity {
    private LocalDateTime createdTime;
    private LocalDateTime modifiedTime;
    private String createdBy;
    private String modifiedBy;
    private boolean isDeleted = false;
}
