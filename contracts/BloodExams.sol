// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BloodExams {
    struct BloodTest {
        uint id;
        address payable owner;
        string ipfsHash; // hash do IPFS do exame de sangue
        address[] sharedWith; // Lista de endereços com quem o exame é compartilhado
    }

    mapping(uint => BloodTest) public bloodTests;
    uint public bloodTestCount = 0;

    event BloodTestCreated(
        uint id,
        address payable owner,
        string ipfsHash
    );

    event AccessGranted(
        uint id,
        address grantedTo
    );

    event AccessRevoked(
        uint id,
        address revokedFrom
    );

    function createBloodTest(string memory _ipfsHash) public {
        bloodTestCount ++;
        bloodTests[bloodTestCount] = BloodTest(bloodTestCount, payable(msg.sender), _ipfsHash, new address[](0));
        emit BloodTestCreated(bloodTestCount, payable(msg.sender), _ipfsHash);
    }

    function grantAccess(uint _id, address _grantedTo) public {
        BloodTest storage _bloodTest = bloodTests[_id];
        require(_bloodTest.id > 0 && _bloodTest.id <= bloodTestCount, "Blood test does not exist");
        require(_bloodTest.owner == msg.sender, "Only the owner can grant access");
        require(_grantedTo != address(0), "Invalid address");

        _bloodTest.sharedWith.push(_grantedTo);
        emit AccessGranted(_id, _grantedTo);
    }

    function revokeAccess(uint _id, address _revokedFrom) public {
        BloodTest storage _bloodTest = bloodTests[_id];
        require(_bloodTest.id > 0 && _bloodTest.id <= bloodTestCount, "Blood test does not exist");
        require(_bloodTest.owner == msg.sender, "Only the owner can revoke access");
        require(_revokedFrom != address(0), "Invalid address");

        for (uint i = 0; i < _bloodTest.sharedWith.length; i++) {
            if (_bloodTest.sharedWith[i] == _revokedFrom) {
                _bloodTest.sharedWith[i] = _bloodTest.sharedWith[_bloodTest.sharedWith.length - 1];
                _bloodTest.sharedWith.pop();
                emit AccessRevoked(_id, _revokedFrom);
                break;
            }
        }
    }

    function getSharedWith(uint _id) public view returns (address[] memory) {
        BloodTest storage _bloodTest = bloodTests[_id];
        require(_bloodTest.id > 0 && _bloodTest.id <= bloodTestCount, "Blood test does not exist");
        return _bloodTest.sharedWith;
    }
}
