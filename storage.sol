pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {

    // Bilangan Bulat Positif
    uint storageData;

    //Set : Untuk memasukan nilai kedalam variabel storage Data
    //Public : Fungsi dapat digunakan diluar kontrak
    function set(uint x) public{
        storageData = x * 5;
    }

    //Get : Untuk menampilkan nilai variabel storage Data
    //View : Utilitas agar variabel nilainya tidak dapat diubah
    function get() public view returns(uint){
        return storageData;
    }


}