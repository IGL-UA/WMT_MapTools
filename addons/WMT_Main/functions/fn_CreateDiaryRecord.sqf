/*
    Name: WMT_fnc_CreateDiaryRecord

    Author(s):
        Ezhuk

    Description:
        Create record in diary of player

    Parameters:
        0 - diary
        1 - head
        2 - text

    Returns:
        Nothing
*/
#define PR(x) private ['x']; x

PR(_d)      = _this select 0;
PR(_head)   = _this select 1;
PR(_text)   = _this select 2;

if(_text != "")then{
    if(_text != "_")then{
        player createDiarySubject [_d, _head];
        player createDiaryRecord [_d, [_head, _text]];
    };
};
