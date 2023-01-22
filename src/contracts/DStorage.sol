pragma solidity ^0.5.0;

contract dstorage {
  string public name= "DStorage";
  uint public fileCount=0;
    // Number of files
  // Mapping fileId=>Struct 
  mapping(uint => File) public files;

  struct File {
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime; //now
    address payable uploader; //msg.sender
  }



  // Struct


  // Event - stores arguments passed in log. inform about current state of contract
  event FileUploaded (
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
    );

  constructor() public {
  }

  function uploadFile (string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public {
    require (bytes(_fileHash).length>0);// Make sure the file hash exists

    require (bytes(_fileType).length>0);// Make sure file type exists

    require (bytes(_fileDescription).length>0);// Make sure file description exists

    require (bytes(_fileName).length>0);// Make sure file fileName exists

    require (msg.sender!=address(0));// Make sure uploader address exists

    require (_fileSize>0);// Make sure file size is more than 0
      
    fileCount++;

    files[fileCount]= File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender); //"now" = timetamp


    // Increment file id

    // Add File to the contract

    
    emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);// Trigger an event
}



}


//truffle migrate --reset - puts new copy of smart contract on blockchain instead of changing existing (--reset)
//npm run start -web dev environment

//meta mask connects browser to blockchain
//web3js library connects web application to blockchain