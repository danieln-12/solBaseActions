contract k1Lottery {
    id issuer = p;
    id user1 = null;
    id user2 = null;
    id Winner = null;
    numeric deposit[0 ,1] = 0;
    numeric user1[0 ,3] = 0;
    numeric user2[0 ,3] = 0;
    numeric IssuersChoice[0 ,3] = 0;
    numeric sum [0 ,12]=0;
function buyTicket [5 ,10]
( payable deposit : caller )
{
    if(deposit!=1) return ;
    if(user1==null) user1 = caller ;
    else if(user2==null ) user2 = caller ;
    else payout (caller , deposit );
}
function play [11 ,20]
(user1sChoice:user1 = 0 ,
user2Choice:user2 = 0,
IssuersChoice:issuer = 0,
payable deposit : issuer )
{
if( user1sChoice ==0 or user2Choice ==0)
    Winner = issuer ;
else if(IssuersOpt ==0 or deposit ==0)
    Winner = user1 ;
else
{
    sum = user1sChoice + user2Choice
    + IssuersOpt;
    if(sum/3*3==sum)
        Winner = user1 ;
    else if(sum/3*3==sum-1)
        Winner = user2 ;
    else
    Winner = issuer ;
}
}
function withdraw[19 ,30]()
{
    if(caller == Winner)
    payout ( caller , 3);
}}
