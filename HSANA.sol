// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HSANA is ERC20, Ownable {
    uint256 private immutable _maxSupply = 1000000 * 10 ** decimals(); // Máximo: 1 millón de tokens

    constructor() ERC20("HSANA", "HSN") Ownable(msg.sender) {
        _mint(msg.sender, 50000 * 10 ** decimals()); // Emisión inicial para el creador
    }

    function mint(address to, uint256 amount) public onlyOwner {
        uint256 scaledAmount = amount * 10 ** decimals();
        require(totalSupply() + scaledAmount <= _maxSupply, "Se supera el suministro máximo");
        _mint(to, scaledAmount);
    }

    function maxSupply() public view returns (uint256) {
        return _maxSupply;
    }
}