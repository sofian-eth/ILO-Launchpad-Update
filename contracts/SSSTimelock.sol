// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SafeERC20.sol";
import "./SafeMath.sol";

contract SSSTimelock {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    // ERC20 basic token contract being held
    IERC20 private _token;

    // beneficiary of tokens after they are released
    address private _beneficiary;

    // timestamp when token release is enabled
    uint256 private _releaseTime;

    bool public unlocked = false;

    constructor (IERC20 token, address beneficiary, uint256 releaseTime) public {
        // solhint-disable-next-line not-rely-on-time
        require(releaseTime > block.timestamp, "TokenTimelock: release time is before current time");
        _token = token;
        _beneficiary = beneficiary;
        _releaseTime = releaseTime;
    }

    modifier OnlyBeneficiary() {
        require(msg.sender == _beneficiary, "Not Beneficiary");
        _;
    }

    /**
     * @return the token being held.
     */
    function token() public view returns (IERC20) {
        return _token;
    }

    /**
     * @return the beneficiary of the tokens.
     */
    function beneficiary() public view returns (address) {
        return _beneficiary;
    }

    /**
     * @return the time when the tokens are released.
     */
    function releaseTime() public view returns (uint256) {
        return _releaseTime;
    }

    /**
     * @notice Transfers tokens held by timelock to beneficiary.
     */
    function release() public virtual OnlyBeneficiary {
        // solhint-disable-next-line not-rely-on-time 
        require(block.timestamp >= _releaseTime, "TokenTimelock: current time is before release time");

        uint256 amount = _token.balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");

        unlocked = true;

        _token.safeTransfer(_beneficiary, amount);
    }
    
    function updateReleaseTime(uint _days) public OnlyBeneficiary {
        // require(msg.sender == _beneficiary, "Only the beneficiary can update the release time");
        require(_days > 0, "Number of days need to be greater than 0");
        _releaseTime = _releaseTime + (_days * 1 days);
    }

    function checkStatus() public view returns (bool) {
        if(block.timestamp > _releaseTime) {
            return true;
        }
        else {
            return false;
        }
    }

    function tokenBalance() public view returns (uint256) {
        return _token.balanceOf(address(this));
    }
}
