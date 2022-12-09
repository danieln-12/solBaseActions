contract testTransfer {
map balance[0 ,2000] = 0;
numeric residual[0 ,2000] = 1000;
numeric payment[0 ,2000] = 0;
numeric amount[0 ,2000] = 0;
numeric senderBalance[0 ,2000] = 0;
numeric recipientBalance[0 ,2000] = 0;
id recipient = null; //Allow state as none

function buy [1 ,10]; //Mock Call

function transfer [1 ,10](
    recipient : caller
    amount : caller ) {
        senderBalance = balance[caller];
        recipientBalance = balance[recipient];
        if(senderBalance<amount)
            return;
            senderBalance -= amount;
            recipientBalance += amount;
            balance[caller] = senderBalance;
            balance[recipient] = recipientBalance;
}}



contract improvedTransfer {
map balance [0 ,2000] = 0;
numeric residual [0 ,2000] = 1000;
numeric payment [0 ,2000] = 0;
numeric amount [0 ,2000] = 0;

id recipient = null ;

function buy [1 ,10]; //Mock Call
function transfer [1 ,10](
    recipient : caller
    amount : caller ) {
if(balance[caller]<amount) //Index Caller Wallet Balance
    return ;
balance[caller] -= amount ;
balance [recipient] += amount ;
}}
