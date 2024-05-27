package org.swp.enums;

public enum BookingStatus {
    WAIT_FOR_SHOP_OWNER_ACCEPT_CANCEL("Waiting for shop owner to accept cancellation"),
    WAIT_FOR_SHOP_OWNER_ACCEPT_BOOKING("Waiting for shop owner to accept booking"),
    ACCEPTED("Booking accepted"),
    CANCELLED("Booking cancelled"),
    DONE("Booking done"),
    REJECTED("Booking rejected by shop owner");

    private final String description;

    BookingStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}

