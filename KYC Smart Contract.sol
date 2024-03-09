// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorporationRegistry {
    struct Corporation {
        string corporationName;
        string productName;
        uint256 productLimit;
        string collateralName;
        uint256 collateralLimit;
        uint256 risk;
    }

    mapping(uint256 => Corporation[]) private corporationRegistry;

    function register(
        uint256 taxNumber,
        string memory corporationName,
        string memory productName,
        uint256 productLimit,
        string memory collateralName,
        uint256 collateralLimit,
        uint256 risk
    ) public {
        corporationRegistry[taxNumber].push(Corporation(
            corporationName,
            productName,
            productLimit,
            collateralName,
            collateralLimit,
            risk
        ));
    }

   function getCorporationInfoByTaxNumber(uint256 taxNumber) public view returns (
    string[] memory,
    string[] memory,
    uint256[] memory,
    string[] memory,
    uint256[] memory,
    uint256[] memory
) {
    require(corporationRegistry[taxNumber].length > 0, "No corporation found with the given tax number");

    // Kişinin tüm kurum bilgilerini topla
    string[] memory corporationNames = new string[](corporationRegistry[taxNumber].length);
    string[] memory productNames = new string[](corporationRegistry[taxNumber].length);
    uint256[] memory productLimits = new uint256[](corporationRegistry[taxNumber].length);
    string[] memory collateralNames = new string[](corporationRegistry[taxNumber].length);
    uint256[] memory collateralLimits = new uint256[](corporationRegistry[taxNumber].length);
    uint256[] memory risks = new uint256[](corporationRegistry[taxNumber].length);

    for (uint256 i = 0; i < corporationRegistry[taxNumber].length; i++) {
        corporationNames[i] = corporationRegistry[taxNumber][i].corporationName;
        productNames[i] = corporationRegistry[taxNumber][i].productName;
        productLimits[i] = corporationRegistry[taxNumber][i].productLimit;
        collateralNames[i] = corporationRegistry[taxNumber][i].collateralName;
        collateralLimits[i] = corporationRegistry[taxNumber][i].collateralLimit;
        risks[i] = corporationRegistry[taxNumber][i].risk;
    }

    return (corporationNames, productNames, productLimits, collateralNames, collateralLimits, risks);
}

}
