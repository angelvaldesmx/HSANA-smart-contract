// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HSANA is ERC20, Ownable {
    uint256 private immutable _maxSupply = 1000000 * 10 ** decimals();

    constructor() ERC20("HSANA", "HSN") Ownable(msg.sender) {
        _mint(msg.sender, 50000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(
            totalSupply() + (amount * 10 ** decimals()) <= _maxSupply,
            "Exceeds max supply"
        );
        _mint(to, amount * 10 ** decimals());
    }

    function maxSupply() public view returns (uint256) {
        return _maxSupply;
    }
}