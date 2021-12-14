unit Validate_u;

interface

uses Math,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, Buttons;
  //EXTERNAL FUNCTIONS MUST BE PUT HERE
function IsValidNum(S:String):Boolean;
function IsRealNum(s:String):Boolean;
function LettersOnly(s:String):Boolean;
type
Tvalidate = class(TObject)

private
fEmail,fPassword,fverifyPassword:String;
fVerified:Boolean;


public
Constructor Create(Email,password,verifypassword:String;Verified:Boolean);
function RealEmail(Email:String):Boolean;
procedure Validate;
function GetVerified:Boolean;

end;


 implementation

 function LettersOnly(S:String):Boolean;
 var
 n:Integer;
 begin
 Result:=True;   {if true theres only letters, if false there is a non-letter}
 for n := 1 to Length(s) do
   begin
    if NOT (s[n] IN ['A'..'Z']) OR (s[n] IN ['a'..'z']) then
         Result:= False;
   end;//for
 end;

function RealEmail(Email:String):Boolean;
var
x:Integer;
finalcheck:String;
begin
//Checks if an email contains an '@' since that is usually what other websites
//use to determine if the email is possibly real and not completely fake
Result:= False;
finalcheck:='';
        for x := 1 to Length(Email) do
          begin
          if Email[x] = '@' then
            begin
            Result:= True;
            end;//if
          end;//for
   if Email[Length(Email)] = '@' then
   begin
    Result:= FALSE; //last character cannot be @
   end;

   for x := Length(Email)-3 to Length(Email) do
     begin
     finalcheck:= finalcheck + Email[x];
     end;//for

     if Uppercase(finalcheck) <> Uppercase('.com') then
     begin
      Result:= FALSE; //ensures .com is at the end
     end;

end;

{ Tvalidate }
constructor Tvalidate.Create(Email, password, verifypassword: String; Verified: Boolean);
begin
fEmail:= Email;
fPassword:= password;
fverifyPassword:= verifypassword;
fVerified:= Verified;
end;

function Tvalidate.GetVerified: Boolean;
begin
Result:= fVerified;
end;

function IsValidNum(S: String): Boolean;
Var
n,Count:Integer;
begin
Count:=0;
  Result:=False;
  // Unique way to verify all the characters
  //in the format XX11xx  (2 caps locked, 2 numbers and 2 lowercase)
  {The program first checks if the first and second digit is an uppercase number by
  using the ASCII Values for them. If they are then the counter increases by 2.

  The 3rd and 4th positions are checked by ASCII Values that have numbers, if they
  both are correct then the counter increases to 4

  The 5th and 6th position is checked to have the lowercase values using ASCII numbers.
  If the 5th and 6th positions are lowercase then the counter increases to 6

  finally, the IF statement checks if the counter is 6, meaning that everything is verified,
  then assigns the result to true. else it will stay false since it was assigned false in the
  beginning of the function}
  for n := 1 to 6 do
    begin

          if (n = 1) or (n=2) then
          begin
              if (Ord(s[n]) > 64) AND (Ord(s[n]) < 91) then
               Count:= Count+1;
          end; //if

          if (n=3) or (n=4) then
          begin
            if (Ord(s[n]) > 47) and (Ord(s[n]) < 58) then
               Count:= Count+1;
          end;  //if

          if (n=5) or (n=6) then
          begin
            if (Ord(s[n]) >96 ) AND (Ord(s[n]) < 123) then
            Count:= Count+1;
          end;   //if

    end;   //while
     if Count = 6  then
          Result:= TRUE;
end;

function IsRealNum(s: String): Boolean;
var
n:Integer;
begin
 Result:= True;

 for n := 1 to Length(s) do
   begin
 if NOT (s[n] IN ['0'..'9']) then
       begin
     Result:=False;
          if s[n] = '.' then
              begin
                Result:=True;
              end;

       end;//if not

   end;//for
end;

function Tvalidate.RealEmail(Email: String): Boolean;
var
x:Integer;
finalcheck:String;
begin
//Checks if an email contains an '@' since that is usually what other websites
//use to determine if the email is possibly real and not completely fake
Result:= False;
finalcheck:='';
        for x := 1 to Length(Email) do
          begin
          if Email[x] = '@' then
            begin
            Result:= True;
            end;//if
          end;//for
   if Email[Length(Email)] = '@' then
   begin
    Result:= FALSE; //last character cannot be @
   end;

   for x := Length(Email)-3 to Length(Email) do
     begin
     finalcheck:= finalcheck + Email[x];
     end;//for

     if Uppercase(finalcheck) <> Uppercase('.com') then
     begin
      Result:= FALSE; //ensures .com is at the end
     end;


end;

procedure Tvalidate.Validate;
begin

if RealEmail(fEmail) = False then
begin
ShowMessage('Your email is incorrect. Please re-enter');
Exit;
end;

//Checks if the password entered is less than 3 characters, then tells the user that it should be longer.
if (Length(fPassword) < 4) AND (Length(fVerifyPassword) < 4) then
      begin
        ShowMessage('Password too short. please re-enter');
        Exit;
      end;

if fPassword = fVerifyPassword then   //checks if the passwords match
begin
fVerified:= True;   //changes boolean to true if they match
end
else
begin
//If the passwords do not match then a message shows and ends the program
ShowMessage('Passwords do not match, please re-enter');
Exit;
end;


end;

end.
