// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyERC721 is ERC721 {
    event NewFace(address indexed owner, uint256 indexed tokenId, string tokenURI);
    uint256 private tokenId;
    string[] private tokenUris = [
        "https://nft.service.cometh.io/3000013",
        "https://nft.service.cometh.io/3000015",
        "https://nft.service.cometh.io/6000327",
        "https://nft.service.cometh.io/6000328",
        "https://nft.service.cometh.io/6000329",
        "https://rope.lol/api/RMU/51",
        "https://rope.lol/api/RMU/52",
        "https://api.bccg.digital/api/bccg/9",
        "https://api.bccg.digital/api/bccg/11",
        "https://api.bccg.digital/api/bccg/1"
    ];

    constructor() ERC721("GANFACE", "GF") {
        this;
    }

    function award() public returns (uint256) {
        tokenId++;
        _mint(msg.sender, tokenId);
        return tokenId;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory uri = tokenUris[tokenId];
        return uri;
    }
}
