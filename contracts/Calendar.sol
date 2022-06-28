// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title MeetingRoomBooking
 * @dev Add some description
 */
contract MeetingRoomBooking {

    struct Room {
        uint id;
        string name; 
    }

    struct Booking {
        address booker;   // address of who booked the meeting room
        bytes32 name;     // short name for booking (up to 32 bytes)
    }

    mapping(uint => Booking[10]) public bookings;
    Room[] public rooms;
    uint numRooms;
    address admin;
    constructor () {
        admin = msg.sender; // contract creator will be set to admin
    }

    function createRoom(string memory _name) public {
         require(
            msg.sender == admin,
            "Only contract admin can create rooms."
        );
        rooms.push(Room(numRooms, _name));
    }

    function book(uint _roomID, uint _slot, bytes32 _description) public {
        Booking memory b1 = Booking(msg.sender, _description);
        bookings[_roomID][_slot] = b1;
    }
}