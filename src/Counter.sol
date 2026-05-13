// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {BaseHook} from "https://raw.githubusercontent.com/Uniswap/v4-periphery/main/src/base/hooks/BaseHook.sol";
import {IPoolManager} from "https://raw.githubusercontent.com/Uniswap/v4-core/main/src/interfaces/IPoolManager.sol";
import {Hooks} from "https://raw.githubusercontent.com/Uniswap/v4-core/main/src/libraries/Hooks.sol";
import {PoolKey} from "https://raw.githubusercontent.com/Uniswap/v4-core/main/src/types/PoolKey.sol";
import {BalanceDelta} from "https://raw.githubusercontent.com/Uniswap/v4-core/main/src/types/BalanceDelta.sol";
import {BeforeSwapDelta, BeforeSwapDeltaLibrary} from "https://raw.githubusercontent.com/Uniswap/v4-core/main/src/types/BeforeSwapDelta.sol";

contract AlduleaSmartHook is BaseHook {
    uint256 public constant COMMISSION_BPS = 1000; // 10%

    constructor(IPoolManager _poolManager) BaseHook(_poolManager) {}

    function getHookPermissions()
        public
        pure
        override
        returns (Hooks.Permissions memory)
    {
        return
            Hooks.Permissions({
                beforeInitialize: false,
                afterInitialize: true,
                beforeAddLiquidity: false,
                afterAddLiquidity: false,
                beforeRemoveLiquidity: false,
                afterRemoveLiquidity: false,
                beforeSwap: true,
                afterSwap: true,
                beforeDonate: false,
                afterDonate: false,
                beforeSwapReturnDelta: false,
                afterSwapReturnDelta: false,
                afterAddLiquidityReturnDelta: false,
                afterRemoveLiquidityReturnDelta: false
            });
    }

    function beforeSwap(
        address sender,
        PoolKey calldata key,
        IPoolManager.SwapParams calldata params,
        bytes calldata hookData
    )
        external
        override
        returns (bytes4, BeforeSwapDelta, uint24)
    {
        return (BaseHook.beforeSwap.selector, BeforeSwapDeltaLibrary.ZERO_DELTA, 0);
    }

    function afterSwap(
        address sender,
        PoolKey calldata key,
        IPoolManager.SwapParams calldata params,
        BalanceDelta delta,
        bytes calldata hookData
    )
        external
        override
        returns (bytes4, int128)
    {
        return (BaseHook.afterSwap.selector, 0);
    }
}
