package org.swp.dto.response;

import lombok.Data;

import java.util.List;

@Data
public class HomepageResponse {
    private List<ShopResponse> shops;
    private List<SerivceResponse> topServices;

}
