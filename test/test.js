const { expect } = require("chai");

describe("NFTMarket", function () {
    it ("Should create abd excute market salkes", async function () {
        const Market = await ethers.getContractFactory("NFTMarket")
        const market = await Market.deploy()
        await market.deployed()
        const market.address = market.address

        const NFT = await ethers.getContractFactory("NFT")
        const nft = await NFT.deploy(market.Address)
        await nft.deployed()
        const nftContractAddress = nft.address

        let listingPrice = await market.getListingPrice()
        listingPrice = listingPrice.toString()

        const auctionPrice = ethers.utils.parseUnits('100', 'ether')

        await nft.createToken("https://www.mytokenlocation.com")
        await nft.createToken("https://www.mytokenlocation2.com")

        await market.createMarketItem(nftContractAddress, 1, auctionPrice, { value: listingPrice })
        await market.createMarketItem(nftContractAddress, 2, auctionPrice, { value: listingPrice })
        
        const [_, buyerAddress, thirdAddress, fourthAddress] = await ethers.getSigners()

        await market.connect(buyerAddress).createMarketSale(nftContractAddress, 1, { value: auctionPrice})

        const item = await market.fetchMarketItems()

            console.log(' items: ', items);
}

   

            