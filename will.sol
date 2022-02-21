pragma solidity ^0.5.7;

contract will {
    address owner;
    uint fortune;
    bool deceased;

    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    //Modifier : buat bikin conditional statetment
    //Modifier kondisi Ketika yang menelepon adalah si owner
    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }

    //Modifier kondisi ketika si kakek mati
    modifier mustBeDeceased{
        require(deceased == true);
        _;
    }

    //List addres dari semua dompet keluarga
    address payable[] FamilyWallet;

    //map inheritance
    mapping (address => uint) inheritance;

    //set inheritance untuk setiap address
    function SetInheritance (address payable wallet, uint amount) public OnlyOwner {
        // Menambahkan Wallet ke Family Wallet
        FamilyWallet.push(wallet);
        inheritance[wallet] = amount;
    }

    //Program bayar duit warisan jika si eyang mati
    function payout() private mustBeDeceased{
        for(uint i=1; i<FamilyWallet.length ; i++){
            FamilyWallet[i].transfer(inheritance[FamilyWallet[i]]);
            //transfer duit dari address contract ke pengirim kontrak
        }
    }

    function hasDeceased() public OnlyOwner{
        deceased = true;
        payout();
    }
}