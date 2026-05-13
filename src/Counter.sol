import {IPoolManager} from "https://github.com/Uniswap/v4-core/blob/main/src/interfaces/IPoolManager.sol";
import {Hooks} from "https://github.com/Uniswap/v4-core/blob/main/src/libraries/Hooks.sol";
    function getHookPermissions() public pure override returns (Hooks.Permissions memory) {
        return Hooks.Permissions({
            beforeInitialize: false,
            afterInitialize: true,
            beforeAddLiquidity: false,
            afterAddLiquidity: false,
            beforeRemoveLiquidity: false,
            afterRemoveLiquidity: false,
            beforeSwap: false,
            afterSwap: true, // تفعيل الرصد لإعادة التمركز
            beforeDonate: false,
            afterDonate: false,
            beforeNoOp: false,
            afterNoOp: false
        });
    }

    function afterSwap(address, PoolKey calldata key, IPoolManager.SwapParams calldata, BeforeSwapDelta, bytes calldata)
        external override returns (bytes4, int128) 
    {
        // منطق التحقق من السعر وإعادة التمركز يوضع هنا
        return (this.afterSwap.selector, 0);
    }
}
