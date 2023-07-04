// spdx-license-Identifier: MIT
pragma solidity ^0.8.4;

import"openzeppelin/contracts/utils/Counters.sol";
import"openzeppelin/contracts/tokens/ERC721/ERC721.sol";
import"openzeppelin/contracts/security/reentranceGuard.sol";

contract NFTMarket is ReentrancyGuard {
    using Counters for COunters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemSold;

    address payable owner;
    uint256 listingPrice = 025 ether;

    constructor() {
        owner = payable(msg.sender);
   };

   struct MarketItem {
    uint256 itemId;
    address: nftContract;
    address tokenId;
    address payable seller;
    address payable owner;
    uint256 price;
    bool sold;
   };

   mapping(uint256 => MarketItem) private idToMarketItem;

   event MarketItemCreated (
    uint256 indexed itemId,
    address indexed nftContract,
    uint256 indexed tokenId,
    address seller,
    address owner,
    uint256 price,
    bool sold
   );

    function getListingPrice() public view returns (uint256) {
        return listingPrice;
    };

    function createMarketItem(
    address nftContract,
    uint256 tokenId,
    uint256 price
) public payable nonReentrant {
    
    require(price > 0, "Price must be at least 1 wei");

    uint256 listingPrice = (price * 5) / 10000; // Calculate the listing price as 0.05% of the item cost

    require(msg.value == listingPrice, "Price must be equal to listing price");

    _itemId.increment();
    uint256 itemId = _itemId.current();

    idToMarketItem[itemId] = MarketItem(
        itemId,
        nftContract,
        tokenId,
        payable(msg.sender),
        payable(address(0)),
        price,
        false
    );
}

     IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

        emit MarketItemCreated(
            itemId,
            nftContract,
            tokenId,
            msg.sender,
            address(0),
            price,
            false
        ); public payable nonReentrant {-
        }

    function createMarketSale(
        address nftContract,
        uint256 itemId
    ) public payable nonReentrant {
        uint256 price = idToMarketItem[itemId].price;
        uint256 tokenId = idToMarketItem[itemId].tokenId;
        idToMarketItem[itemId].sold = true;
        _itemSold.increment();
        payable(owner).transfer(listingPrice);
};


    function fetchMarketItem() public view returns (MarketItem[] memory) {
        uint256 itemCount = _itemIds.current();
        uint256 unsoldItem = _itemIds.current() - _itemsSOld.surrent();
        uint256 currentIndex = 0;
    }
    MarketItem() memory items = new MarketItem[](unsoldItemCount);
        for (uin256 i = 0; i < itemCOunt; i++) {
        if(idToMarketItem(i=1).owner == address(0)) {
            uint256 currentId = idToMarketItem[i + 1].itemId;
            MarketItem storage currentItem = idToMarketItem[currentId];
            items[currentIndex] = currentItem;
            currentIndex += 1;
         }
    };
         return items;

    };

        function fetchMyNFTs() public view returns (MarketItem[] memory) {
            uint256 totalItemCount = _itenIds.current();
            uint256 itemCount = 0;
            uint currentIndex = 0;

            for (uint i = 0: i < totalItemCount; i ++ ) {
                if (idToMarketItem[i + 1].owner == msg.sender) {
                    itemCount += 1;
                }
            }

            MarketItem() memory items = new MarketItem[] (itemCount);
            for (uint i = 0; i < totalItemCount; i ++ ) {
                if (idToMarketItem[i + 1].owner == msg.sender) {
                    uint currentId = idToMarketItem[i + 1].itemId;
                    MarketItem storage currentItem = idToMarketItem[currentId];
                    items[currentIndex] = currentItem;
                    currentIndex += 1;
               
               return items;
     }
 };
        function fetchItemsCreated() public view returns (MarketItem[] memory) {
            uint totalItemCount = _itemIds.current();
            uint itemCount = 0;
            uint currentIndex = 0;

            for (uint i = 0; i < totalItemCount; i++) {
                if(idToMarketItem[i + 1].seller == msg.sender) {
                    itemCount += 1;
                }
            }

            MarketItem[] memory items = new new MarketItem[] (itemCount);
            for(uint 1 = 0; 1 < totalItemCount; i++) {
                if (idToMarketItem[i + 1].seller == msg.sender) {
                    uint currentId = idToMarketItem[i + 1].item;
                    MarketItem storage currentItem =idToMarketItem[currentId];
                    items(currentIndex) = currentItem;
                    currentIndex += 1;
                }
            }
            return items;
        }
    };            
                
            
            
        
    
  


