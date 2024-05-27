package org.swp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.swp.dto.request.RequestAcceptBooking;
import org.swp.dto.request.RequestBookingRequest;
import org.swp.dto.request.RequestCancelBookingRequest;
import org.swp.enums.UserRole;
import org.swp.repository.IBookingRepository;
import org.swp.repository.IUserRepository;

@Service
public class BookingService {
    //TODO: Complete all logic for this service class
    @Autowired
    private IBookingRepository bookingRepository;
    @Autowired
    private IUserRepository userRepository;

    public Object getAllBookings(String userName) {
        return isCustomer(userName) ?
                bookingRepository.findALlByCustomerUserName(userName)
                : bookingRepository.findAllByShopOwnerUserName(userName);
    }

    private boolean isCustomer(String userName) {
        return userRepository.findByUsername(userName).get().getRole().equals(UserRole.CUSTOMER);
    }

    public Object getBookingById(int id) {
        return bookingRepository.findById(id).orElse(null);
    }

    public Object createBookingRequest(RequestBookingRequest request) {
        return null;
    }

    public Object cancelBookingRequest(RequestCancelBookingRequest request) {
        return null;

    }

    public Object acceptBooking(RequestAcceptBooking request) {
        return null;

    }
}
