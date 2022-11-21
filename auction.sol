pragma solodity >= 0.6.0 < 0.9.0;

contract mainAuction {
    map Bids[0,1000] = 0;
    numeric HighestBid [0,1000] = 0;
    id Winner = null;
    numeric bid[0,1000] = 0;

function bid[1 ,10]

(payable bid : caller) {
    if(bid<Bids[ caller ])
    return ;

payout (caller, Bids[ caller ]);
Bids [caller]= bid ;

if(bid > HighestBid )
{
    HighestBid = bid ;
    Winner = caller ;
    }
}

function withdrawBalance [11 ,20]()
{
    if( caller != Winner )
    {
    payout ( caller , Bids [ caller ]);
    Bids [ caller ]=0;
    (bool success, ) = recipient.call.value(amount)("");
    }
}}
