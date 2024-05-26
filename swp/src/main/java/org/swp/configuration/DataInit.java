package org.swp.configuration;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.*;
import org.swp.entity.other.Feedback;
import org.swp.entity.other.FeedbackReply;
import org.swp.enums.TypePet;
import org.swp.enums.UserRole;
import org.swp.repository.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Supplier;


@Configuration
public class DataInit {

    @Bean
    public CommandLineRunner initData(
            IUserRepository iUserRepository,
            IShopRepository iShopRepository,
            IServiceRepository iServiceRepository,
            IServiceCategoryRepository iServiceCategoryRepository,
            IPetRepository iPetRepository,
            IBookingRepository iBookingRepository,
            IFeedbackRepository iFeedbackRepository,
            IFeedbackReplyRepository iFeedbackReplyRepository,
            INominationRepository iNominationRepository,
            ITimeSlotRepository iTimeSlotRepository,
            IShopTimeSlotRepository iShopTimeSlotRepository,
            ICacheShopTimeSlotRepository iCacheShopTimeSlotRepository
    ) {


        return args -> {
            initializeData(iUserRepository, iUserRepository::count, this::initializeUsers);
            initializeData(iShopRepository, iShopRepository::count, this::initializeShops);
            initializeData(iServiceCategoryRepository, iServiceCategoryRepository::count, this::initializeServiceCate);
            initializeData(iServiceRepository, iServiceRepository::count, () -> initializeServices(iServiceCategoryRepository, iShopRepository));
            initializeData(iPetRepository, iPetRepository::count, this::initializePets);
            initializeData(iBookingRepository, iBookingRepository::count, this::initializeBookings);
            initializeData(iFeedbackRepository, iFeedbackRepository::count, this::initializeFeedBacks);
            initializeData(iFeedbackReplyRepository, iFeedbackReplyRepository::count, this::initializeFeedbackReplies);
           // initializeData(iNominationRepository, iNominationRepository::count, this::initializeNomi);
            initializeData(iTimeSlotRepository, iTimeSlotRepository::count, this::initializeTimeSlots);
            initializeData(iShopTimeSlotRepository, iShopTimeSlotRepository::count, this::initializeShopTimeSlot);
            initializeData(iCacheShopTimeSlotRepository, iCacheShopTimeSlotRepository::count, this::initializeCacheShopTimeSlot);
        };
    }

    // Check if there's any existing data in the database
    private <T> void initializeData(JpaRepository<T, Long> repository, Supplier<Long> countSupplier, Supplier<List<T>> dataSupplier) {
        if (countSupplier.get() == 0) {
            repository.saveAll(dataSupplier.get());
        }
    }

    //initializeData
    private List<User> initializeUsers() {
        return Arrays.asList(
                createUser("admin", "admin", UserRole.ADMIN, "Admin", "User", "admin@example.com", LocalDate.of(2003,2,5), "012333333"),
                createUser("customer", "customer", UserRole.CUSTOMER, "Customer", "User", "customer@example.com", LocalDate.of(2003,2,5), "012333333"),
                createUser("shop_owner", "shop_owner", UserRole.SHOP_OWNER, "Shop", "Owner", "owner@example.com", LocalDate.of(2023,2,3), "012333333"),
                createUser("thoai", "1233", UserRole.CUSTOMER, "T", "D", "1233@example.com", LocalDate.of(2003,2,5), "012312333333")
        );
    }

    private List<Shop> initializeShops() {
        return Arrays.asList(
                createShop("Shop 1", "123 Main St", "1234567890", "shop1@example.com", "Thu Duc City", "Description for Shop 1", LocalDateTime.of(2024, 1, 1, 9, 0), LocalDateTime.of(2024, 1, 1, 18, 0), true, "Shop 1 Title", "profileImageUrl1", "coverImageUrl1", 5, 1L),
                createShop("Shop 2", "456 Elm St", "0987654321", "shop2@example.com", "Sai Gon2", "Description for Shop 2", LocalDateTime.of(2024, 1, 1, 10, 0), LocalDateTime.of(2024, 1, 1, 19, 0), false, "Shop 5 Title", "profileImageUrl2", "coverImageUrl2", 8, 2L),
                createShop("Shop 3", "456 Elm St", "0987654321", "shop2@example.com", "Sai Gon3", "Description for Shop 3", LocalDateTime.of(2024, 1, 1, 10, 0), LocalDateTime.of(2024, 1, 1, 19, 0), true, "Shop 3 Title", "profileImageUrl2", "123123", 8, 2L),
                createShop("Shop 4", "456 Elm St", "0987654321", "shop2@example.com", "Sai Gon5", "Description for Shop 4", LocalDateTime.of(2024, 1, 1, 10, 0), LocalDateTime.of(2024, 1, 1, 19, 0), false, "Shop 2 Title", "123123zxc", "123", 8, 2L),
                createShop("Shop 5", "456 Elm St", "0987654321", "shop2@example.com", "Sai Gon5", "Description for Shop 4", LocalDateTime.of(2024, 1, 1, 10, 0), LocalDateTime.of(2024, 1, 1, 19, 0), false, "Shop 2 Title", "123123zxc", "123", 8, 2L)
        );
    }

    private List<ServiceCategory> initializeServiceCate() {
        return Arrays.asList(
                createServiceCategory("Cate1","Description of cate 1"),
                createServiceCategory("Cate2","Description of cate 2"),
                createServiceCategory("Cate3","Description of cate 3")
                );
    }

    private List<Service> initializeServices(
            IServiceCategoryRepository categoryRepository,
            IShopRepository shopRepository
    ) {

        List<ServiceCategory> serviceCategory = initializeServiceCate();
        List<Shop> shops = initializeShops();

        ServiceCategory category = serviceCategory.get(0);
        Shop shop = shops.get(0);

        category = categoryRepository.saveAndFlush(category);
        shop = shopRepository.saveAndFlush(shop);

        return Arrays.asList(
                createService("Service 1", "Description for Service 1", 10.0, 0.0, 10.0, TypePet.DOG, "tag1 - tag2", category, shop),
                createService("Service 2", "Description for Service 2", 15.0, 0.0, 15.0, TypePet.CAT, "tag3 - tag4", category,shop),
                createService("Service 3", "Description for Service 33", 220.0, 1.0, 20.0, TypePet.RAT, "tag5 - tag6", category, shop),
                createService("Service 55", "Description for Service 33", 210.0, 0.0, 2053.0, TypePet.RAT, "tag5 - tag6", category, shop),
                createService("Service 124", "Description for Service 323", 203.0, 0.0, 2660.0, TypePet.RAT, "tag5 - tag6", category, shop)

        );
    }

    private List<Pet> initializePets() {
        return Arrays.asList(
                createPet("Bobby", "Dog", "2", "Male", "5kg", "Friendly dog", "bobby_photo.jpg", "No special notes"),
                createPet("Mittens", "Cat", "3", "Female", "4kg", "Loves to climb", "mittens_photo.jpg", "Needs special diet"),
                createPet("Nibbles", "Rabbit", "1", "Male", "1kg", "Very active", "nibbles_photo.jpg", "Loves carrots")
        );
    }

    private List<Booking> initializeBookings() {
        return Arrays.asList(
                createBooking("Booking note 1", true, false),
                createBooking("Booking note 2", false, true)
        );
    }

    private List<Feedback> initializeFeedBacks() {
        return Arrays.asList(
                createFeedback("Great service!"),
                createFeedback("Not satisfied with the service.")
        );
    }

    private List<FeedbackReply> initializeFeedbackReplies() {
        return Arrays.asList(
                createFeedbackReply("Thank you for your feedback!"),
                createFeedbackReply("We are sorry to hear that.")
        );
    }

    private List<TimeSlot> initializeTimeSlots() {
        return Arrays.asList(
                createTimeSlot(LocalDateTime.of(2024, 5, 27, 9, 0), LocalDateTime.of(2024, 5, 27, 10, 0)),
                createTimeSlot(LocalDateTime.of(2024, 5, 27, 10, 0), LocalDateTime.of(2024, 5, 27, 11, 0)),
                createTimeSlot(LocalDateTime.of(2024, 5, 27, 11, 0), LocalDateTime.of(2024, 5, 27, 12, 0))
                // Add more time slots as needed
        );
    }

    private List<ShopTimeSlot> initializeShopTimeSlot() {
        return Arrays.asList(
                createShopTimeSlot("Shop time slot 1 description"),
                createShopTimeSlot("Shop time slot 2 description")
        );
    }

    private List<CacheShopTimeSlot> initializeCacheShopTimeSlot() {
        return Arrays.asList(
                createCacheShopTimeSlot(5, 2, 3, LocalDateTime.now()),
                createCacheShopTimeSlot(3, 2, 73, LocalDateTime.now()),
                createCacheShopTimeSlot(55, 22, 13, LocalDateTime.now())

        );
    }

    // Helper methods to create entities
    private User createUser(String username, String password, UserRole role, String firstName, String lastName, String email, LocalDate birthday, String phone) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setBirthday(birthday);
        user.setPhone(phone);
        return user;
    }

    private Shop createShop(String name, String address, String phone, String email, String area, String description, LocalDateTime openTime, LocalDateTime closeTime, boolean isAvailable, String title, String profileImageUrl, String coverImageUrl, int totalServices, Long userId) {
        Shop shop = new Shop();
        shop.setShopName(name);
        shop.setShopAddress(address);
        shop.setShopPhone(phone);
        shop.setShopEmail(email);
        shop.setArea(area);
        shop.setShopDescription(description);
        shop.setOpenTime(openTime);
        shop.setCloseTime(closeTime);
        shop.setAvailable(isAvailable);
        shop.setShopTitle(title);
        shop.setShopProfileImangeUrl(profileImageUrl);
        shop.setShopCoverImageUrl(coverImageUrl);
        shop.setTotalServices(totalServices);
//
//        // Retrieve the user and set it
//        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
//        shop.setUser(user);
        return shop;
    }

    private ServiceCategory createServiceCategory(String name, String description) {
        ServiceCategory category = new ServiceCategory();
        category.setCategoryName(name);
        category.setDescription(description);
        return category;
    }

    private Service createService(String serviceName, String serviceDescription, double price, double minWeight, double maxWeight, TypePet typePet, String tags, ServiceCategory category, Shop shop) {
        Service service = new Service();
        service.setServiceName(serviceName);
        service.setServiceDescription(serviceDescription);
        service.setPrice(price);
        service.setMinWeight(minWeight);
        service.setMaxWeight(maxWeight);
        service.setTypePet(typePet);
        service.setTags(tags);

        service.setCategory(category);
        service.setShop(shop);
        return service;
    }

    private Pet createPet(String petName, String petType, String petAge, String petGender, String petWeight, String petDescription, String petPhoto, String petNote) {
        Pet pet = new Pet();
        pet.setPetName(petName);
        pet.setPetType(petType);
        pet.setPetAge(petAge);
        pet.setPetGender(petGender);
        pet.setPetWeight(petWeight);
        pet.setPetDescription(petDescription);
        pet.setPetPhoto(petPhoto);
        pet.setPetNote(petNote);

        return pet;
    }

    private Booking createBooking(String bookingNote, boolean isDone, boolean isCanceled) {
        Booking booking = new Booking();
        booking.setBookingNote(bookingNote);
        booking.setDone(isDone);
        booking.setCanceled(isCanceled);

        return booking;
    }

    private Feedback createFeedback(String content) {
        Feedback feedback = new Feedback();
        feedback.setContent(content);
//        feedback.setUser(user);
//        feedback.setShop(shop);
//        feedback.setService(service);
        return feedback;
    }

    private FeedbackReply createFeedbackReply(String content) {
        FeedbackReply feedbackReply = new FeedbackReply();
        feedbackReply.setContent(content);
//        feedbackReply.setUser(user);
//        feedbackReply.setFeedback(feedback);
        return feedbackReply;
    }

    private TimeSlot createTimeSlot(LocalDateTime startLocalDateTime, LocalDateTime endLocalDateTime) {
        TimeSlot timeSlot = new TimeSlot();
        timeSlot.setStartLocalDateTime(startLocalDateTime);
        timeSlot.setEndLocalDateTime(endLocalDateTime);
        return timeSlot;
    }

    private ShopTimeSlot createShopTimeSlot(String description) {
        ShopTimeSlot shopTimeSlot = new ShopTimeSlot();
        shopTimeSlot.setDescription(description);
//        shopTimeSlot.setShop(shop);
//        shopTimeSlot.setTimeSlot(timeSlot);
        return shopTimeSlot;
    }

    private CacheShopTimeSlot createCacheShopTimeSlot(int totalSlots, int usedSlots, int availableSlots, LocalDateTime localDateTime)   {
        CacheShopTimeSlot cacheShopTimeSlot = new CacheShopTimeSlot();
        cacheShopTimeSlot.setTotalSlots(totalSlots);
        cacheShopTimeSlot.setUsedSlots(usedSlots);
        cacheShopTimeSlot.setAvailableSlots(availableSlots);
        cacheShopTimeSlot.setLocalDateTime(localDateTime);
//        cacheShopTimeSlot.setShopTimeSlot(shopTimeSlot);
//        cacheShopTimeSlot.setShop(shop);
//        cacheShopTimeSlot.setBookings(bookings);
        return cacheShopTimeSlot;
    }
}


