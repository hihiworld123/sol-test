// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721Enumerable, ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory name,string memory symbol) ERC721(name, symbol) {
       
    }

    function mint(address artist,string memory tokenUri) public  returns(uint256){
      uint256 newItemId = _tokenIds.current();
      _mint(artist, newItemId);
      _setTokenURI(newItemId,tokenUri);

      _tokenIds.increment();
      return newItemId;
    }

    function _increaseBalance(address account, uint128 amount) internal virtual override(ERC721,ERC721Enumerable) {
        if (amount > 0) {
            revert ERC721EnumerableForbiddenBatchMint();
        }
        super._increaseBalance(account, amount);
    }

    function _update(address to, uint256 tokenId, address auth) internal virtual override(ERC721,ERC721Enumerable) returns (address) {
        address previousOwner = super._update(to, tokenId, auth);       

        return previousOwner;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721URIStorage, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    
    function tokenURI(uint256 tokenId) public view virtual override(ERC721,ERC721URIStorage) returns (string memory) {
        _requireOwned(tokenId);
        return ERC721URIStorage.tokenURI(tokenId);
    }
}
