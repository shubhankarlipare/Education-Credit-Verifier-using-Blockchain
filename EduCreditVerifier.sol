pragma solidity ^0.8.0;

contract MyCredit {
    
    struct info{
        bool created;
        address senderAd;
        string Tenth;
        string Twelth;
        string Ug;
        string Pg;
        address verifier;
        bool verified;
    }
    
    mapping(uint => info) mappedData;
    
    function setData(uint UID, string memory tenth, string memory twelth, string memory ug, string memory pg, address verifier) external {
        require(mappedData[UID].created != true || msg.sender == mappedData[UID].senderAd, "Your account is already created");
        mappedData[UID] = info(true, msg.sender, tenth, twelth, ug, pg, verifier, false);
    }
    
    function getData(uint uid) public view returns(info memory){
        require(msg.sender == mappedData[uid].senderAd || msg.sender == mappedData[uid].verifier, "You are not Authorized Viewer!");
        return mappedData[uid];
    }
    
    function verifyData(uint uid, bool status) public {
        require(msg.sender == mappedData[uid].verifier);
        mappedData[uid].verified = status;
    }
    
}