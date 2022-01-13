// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "OpenZeppelin/openzeppelin-contracts@4.0.0/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155IPFS is ERC1155 {
    uint256 public constant TEST1 = 1;
    uint256 public constant TEST2 = 2;
    uint256 public constant TEST3 = 3;

    
mapping (uint => string) metadataRegistry;

constructor() public ERC1155("https://ipfs.moralis.io:2053/ipfs/{id}") {

    //here we map the the id's to the IPFS CIDs

    metadataRegistry[TEST1] = "QmVoc4E39gRT81zmHNgtmXziMeeUGkwBf5W6ur667DrUEy";
    metadataRegistry[TEST2] = "QmTmK2HKD3z54ugvrAMn18JvrTdg1iBHaxu9EkNHTnUKii";
    metadataRegistry[TEST3] = "QmQu6FgxYwhF9ugQHFNVSuFT462hmkXNfFp7XJUzx2L7Ju";
    _mint(msg.sender, TEST1, 1, "");
    _mint(msg.sender, TEST2, 1, "");
    _mint(msg.sender, TEST3, 1, "");
}
  
  function mint(
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
        
    )   public virtual  {

        _mint(msg.sender, id, amount, data);
    }
    
    function uri(uint256 _tokenID) override public view returns (string memory) {
    return string(abi.encodePacked("https://ipfs.moralis.io:2053/ipfs/",metadataRegistry[_tokenID]));
    }
    
}