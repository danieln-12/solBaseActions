pragma solidity ^0.5.0;

//Declare var
contract itemAuction {
    address public owner;
    uint public highestBid;
    address public highestBidder;
    uint public bidIncrement;
    uint public auctionEnd;
    event NewHighestBid(address bidder, uint bid);
    event AuctionEnded(address winner);

    constructorSet(uint _bidIncrement, uint _auctionEnd) public {
        owner = msg.sender;
        highestBid = 0;
        highestBidder = address(0);
        bidIncrement = _bidIncrement;
        auctionEnd = _auctionEnd;
    }

    function submitBid() public payable {
        require(msg.value > highestBid, "Bid must be greater than current highest bid");
        require(msg.value % bidIncrement == 0, "Bid must be a multiple of the bid increment");
        highestBid = msg.value;
        highestBidder = msg.sender;
        emit NewHighestBid(highestBidder, highestBid);
    }

    function disolveAuction() public {
        require(msg.sender == owner, "Auctioneer functionality permission.");
        require(now >= auctionEnd, "Auction still in pending state");
        owner.transfer(highestBid.address);
        emit AuctionResult(highestBidder);
    }
}
