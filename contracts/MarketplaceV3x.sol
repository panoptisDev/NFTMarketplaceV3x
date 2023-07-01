// SPDX-License-Identifier: Apache-2.0

//https://github.com/panoptisDev
pragma solidity ^0.8.0;

import "./dependencies/IERC1155Receiver.sol";
import "./dependencies/IERC721Receiver.sol";

import "./dependencies/InitStorage.sol";
import { RouterImmutable, Router } from "./dependencies/RouterImmutable.sol";
import "./dependencies/ContractMetadataLogic.sol";
import "./dependencies/PlatformFeeLogic.sol";
import "./dependencies/PermissionsEnumerableLogic.sol";
import "./dependencies/ReentrancyGuardLogic.sol";
import "./dependencies/ERC2771ContextUpgradeableLogic.sol";

contract MarketplaceV3x is
    ContractMetadataLogic,
    PlatformFeeLogic,
    PermissionsEnumerableLogic,
    ReentrancyGuardLogic,
    ERC2771ContextUpgradeableLogic,
    RouterImmutable,
    IERC721Receiver,
    IERC1155Receiver
{
    bytes32 private constant MODULE_TYPE = bytes32("MarketplaceV3x");
    uint256 private constant VERSION = 1;

    // State variables to store the addresses of the NFT collections
    address public nftCollection1;
    address public nftCollection2;
    address public nftCollection3;
    address public nftCollection4;
    address public nftCollection5;

    constructor(address _pluginMap) RouterImmutable(_pluginMap) {}

    function initialize(
        address _defaultAdmin,
        string memory _contractURI,
        address[] memory _trustedForwarders,
        address _platformFeeRecipient,
        uint16 _platformFeeBps,
        address _nftCollection1,
        address _nftCollection2,
        address _nftCollection3,
        address _nftCollection4,
        address _nftCollection5
    ) external {
        InitStorage.Data storage data = InitStorage.initStorage();
        require(!data.initialized, "Already initialized.");
        data.initialized = true;

        __ReentrancyGuard_init();
        __ERC2771Context_init(_trustedForwarders);

        _setupContractURI(_contractURI);
        _setupPlatformFeeInfo(_platformFeeRecipient, _platformFeeBps);

        _setupRole(DEFAULT_ADMIN_ROLE, _defaultAdmin);
        _setupRole(keccak256("LISTER_ROLE"), address(0));
        _setupRole(keccak256("ASSET_ROLE"), address(0));

        // Set the addresses of the NFT collections
        nftCollection1 = _nftCollection1;
        nftCollection2 = _nftCollection2;
        nftCollection3 = _nftCollection3;
        nftCollection4 = _nftCollection4;
        nftCollection5 = _nftCollection5;
    }

    function contractType() external pure returns (bytes32) {
        return MODULE_TYPE;
    }

    function contractVersion() external pure returns (uint8) {
        return uint8(VERSION);
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(Router, IERC165) returns (bool) {
        return
            interfaceId == type(IERC1155Receiver).interfaceId ||
            interfaceId == type(IERC721Receiver).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function _canSetPlatformFeeInfo() internal view override returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function _canSetContractURI() internal view override returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function _msgSender() internal view override(ERC2771ContextUpgradeableLogic, PermissionsLogic) returns (address sender) {
        if (isTrustedForwarder(msg.sender)) {
            assembly {
                sender := shr(96, calldataload(sub(calldatasize(), 20)))
            }
        } else {
            return msg.sender;
        }
    }

    function _msgData() internal view override(ERC2771ContextUpgradeableLogic, PermissionsLogic) returns (bytes calldata) {
        if (isTrustedForwarder(msg.sender)) {
            return msg.data[:msg.data.length - 20];
        } else {
            return msg.data;
        }
    }
}