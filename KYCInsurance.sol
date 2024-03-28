// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventInfoRegistry {
    struct EventInfo {
        string province;
        string city;
        string plate;
        string eventDate;
        string insuranceBranch;
        string comment;
    }

    mapping(uint256 => EventInfo[]) private eventInfoRegistry;

    function register(
        uint256 taxNumber,
        string memory province,
        string memory city,
        string memory plate,
        string memory eventDate,
        string memory insuranceBranch,
        string memory comment
    ) public {
        eventInfoRegistry[taxNumber].push(EventInfo(
            province,
            city,
            plate,
            eventDate,
            insuranceBranch,
            comment
        ));
    }

   function getEventInfoByTaxNumber(uint256 taxNumber) public view returns (
    string[] memory,
    string[] memory,
    string[] memory,
    string[] memory,
    string[] memory,
    string[] memory
) {
    require(eventInfoRegistry[taxNumber].length > 0, "No data found with the given tax number");

    //  tüm bilgileri topla
    string[] memory provinces = new string[](eventInfoRegistry[taxNumber].length);
    string[] memory citys = new string[](eventInfoRegistry[taxNumber].length);
    string[] memory plates = new string[](eventInfoRegistry[taxNumber].length);
    string[] memory eventDates = new string[](eventInfoRegistry[taxNumber].length);
    string[] memory insuranceBranchs = new string[](eventInfoRegistry[taxNumber].length);
    string[] memory comments = new string[](eventInfoRegistry[taxNumber].length);

    for (uint256 i = 0; i < eventInfoRegistry[taxNumber].length; i++) {
        provinces[i] = eventInfoRegistry[taxNumber][i].province;
        citys[i] = eventInfoRegistry[taxNumber][i].city;
        plates[i] = eventInfoRegistry[taxNumber][i].plate;
        eventDates[i] = eventInfoRegistry[taxNumber][i].eventDate;
        insuranceBranchs[i] = eventInfoRegistry[taxNumber][i].insuranceBranch;
        comments[i] = eventInfoRegistry[taxNumber][i].comment;
    }

    return (provinces, citys, plates, eventDates, insuranceBranchs, comments);
}

}
