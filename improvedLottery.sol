pragma solidity ^0.5.0;

contract Lottery {
    address public owner;
    uint public ticketValue;
    uint public ticketPool;
    uint public endTime;
    address public winner;

    event NewTicket(address player, uint amount);

    event LotteryComplete(address winner);

    constructor(uint _ticketValue, uint _endTime) public {
        owner = msg.sender;

        ticketValue = _ticketValue;
        endTime = _endTime;
    }

    function enter() public payable {
        require(msg.value >= ticketValue, "Ticket Value required for entry");

        ticketPool += msg.value;

        emit NewTicket(msg.sender, msg.value);
    }

    function closeLottery() public {
        // Random value based on entries
        uint random = uint(keccak256(abi.encodePacked(block.difficulty, now, ticketPool))) % ticketPool;

        // Pick winner
        for (uint i = 0; i < ticketPool; i++) {
            if (random < ticketValue) {
                winner = msg.sender;
                break;
            }
            random -= ticketValue;
        }

        winner.transfer(ticketPool);

    }
}
