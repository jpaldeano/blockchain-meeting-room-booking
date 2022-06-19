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
        Booking[10] bookings; // bookings slots , where index 0 represents 9AM-10AM and index 9 represents 4PM-5PM                            
    }

    struct Booking {
        address booker;  // address of who booked the meeting room
        bytes32 name;   // short name for booking (up to 32 bytes)
    }

    Room[] public availableRooms;


    /** 
     * @dev Create a new meeting rooms system.
     * @param roomNames names of the rooms
     */
    constructor(string[] memory roomNames) {
        for (uint i = 0; i < roomNames.length; i++) {
            Booking b = new Booking[](10);
            Room memory room = Room(i, roomNames[i], b);
        }
    }

    function book(uint roomID, uint slot) public {
        bool found = false;
        for (uint i = 0; i < availableRooms.length; i++) {
            if (availableRooms[i].id == roomID) {
                found == true;
                 require(slot >= 0 && slot < 10, "slot should be [0:10[");
                 require(availableRooms[i].bookings[slot].booker == address(0), "room not available");

                 availableRooms[i].bookings[slot].booker = msg.sender;
                return;
            }
        } 
    }
}