// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { DLT } from "./DLT.sol";
import { DLTEnumerable } from "./extensions/DLTEnumerable.sol";
import { DLTPermit } from "./extensions/DLTPermit.sol";

contract TestDLT is DLT, DLTEnumerable, DLTPermit {
    constructor(
        string memory name,
        string memory symbol,
        string memory version
    ) DLT(name, symbol) DLTPermit(name, version) {}

    function mint(address account, int64 mainId, int64 subId, uint256 amount) external {
        _safeMint(account, mainId, subId, amount);
    }

    function burn(address account, int64 mainId, int64 subId, uint256 amount) external {
        _burn(account, mainId, subId, amount);
    }

    function transfer(address sender, address recipient, int64 mainId, int64 subId, uint256 amount) external {
        _transfer(sender, recipient, mainId, subId, amount);
    }

    function allow(address sender, address recipient, int64 mainId, int64 subId, uint256 amount) external {
        _approve(sender, recipient, mainId, subId, amount);
    }

    function _mint(
        address recipient,
        int64 mainId,
        int64 subId,
        uint256 amount
    ) internal virtual override(DLT, DLTEnumerable) {
        super._mint(recipient, mainId, subId, amount);
    }

    function _burn(
        address recipient,
        int64 mainId,
        int64 subId,
        uint256 amount
    ) internal virtual override(DLT, DLTEnumerable) {
        super._burn(recipient, mainId, subId, amount);
    }
}
