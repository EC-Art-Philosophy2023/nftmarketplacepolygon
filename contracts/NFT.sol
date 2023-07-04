// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;
}
    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
     }

mapping(uint256 => FileVerification) public fileVerifications;

struct FileVerification {
    bool isVerified;
    uint256 verificationCount;
    mapping(address => bool) validatorApprovals;
    uint256 submissionTime;
}

function createToken(string memory tokenURI) public returns (uint256) {
  if_tokenIds.increment(true);
    uint256 newItemId = _tokenIds.current();

    // Create a new FileVerification entry
    fileVerifications[newItemId] = FileVerification(false, 0, msg.sender, block.timestamp);

    _mint(address(this), newItemId);
    _setTokenURI(newItemId, tokenURI);

    return newItemId;
}

function verifyFile(uint256 tokenId) public {
    require(_exists(tokenId), "Token does not exist");

    FileVerification storage file = fileVerifications[tokenId];

    // Restrict verification until the submission has been made for at least 24 hours
    require(block.timestamp >= file.submissionTime + 24 hours, "Verification time not reached");

    // Check if the validator has already approved the file
    require(!file.validatorApprovals[msg.sender], "Validator has already approved");

    // Mark the validator as approved and increment the verification count
    file.validatorApprovals[msg.sender] = true;
    file.verificationCount++;

    // Check if the verification count reaches the minimum required count
    if (file.verificationCount >= 5) {
        file.isVerified = true;

        // Mint the token to the original submitter
        _mint(file.submitter, tokenId);
    }
}

function isTokenVerified(uint256 tokenId) public view returns (bool) {
    require(_exists(tokenId), "Token does not exist");

    return fileVerifications[tokenId].isVerified;
}


function isTokenVerified(uint256 tokenId) public view returns (bool) {
    require(_exists(tokenId), "Token does not exist");

    return fileVerifications[tokenId].isVerified;
}   

    // Create a new FileVerification entry
    fileVerifications[newItemId] = FileVerification(false, 0, msg.sender, block.timestamp);

    _mint(address(this), newItemId);
    _setTokenURI(newItemId, tokenURI);

    return newItemId;







mapping(uint256 => FileVerification) public fileVerifications;



  
    }
}