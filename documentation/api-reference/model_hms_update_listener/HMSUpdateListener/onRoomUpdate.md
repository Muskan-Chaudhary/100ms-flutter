


# onRoomUpdate method




    *[<Null safety>](https://dart.dev/null-safety)*




void onRoomUpdate
({required [HMSRoom](../../model_hms_room/HMSRoom-class.md) room, required [HMSRoomUpdate](../../enum_hms_room_update/HMSRoomUpdate-class.md) update})





<p>This is called when there is a change in any property of the Room</p>
<ul>
<li>Parameters:
<ul>
<li>room: the room which was joined</li>
<li>update: the triggered update type. Should be used to perform different UI Actions</li>
</ul>
</li>
</ul>



## Implementation

```dart
void onRoomUpdate({required HMSRoom room, required HMSRoomUpdate update});
```






