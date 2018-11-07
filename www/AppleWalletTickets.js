var exec = require('cordova/exec');

exports.sendTicketToWallet = function(arg0, success, error){
    exec(success, error, 'AppleWalletTickets', 'sendTicketToWallet', [arg0]);
};
