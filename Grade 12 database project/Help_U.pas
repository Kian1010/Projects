unit Help_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TabNotBk, StdCtrls, mainPage_U,ComObj,MMSYSTEM ;

type
  TFrmHelp = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    RedLogging: TRichEdit;
    RedBids: TRichEdit;
    RedErr: TRichEdit;
    BtnBack: TButton;
    RedWelcome: TRichEdit;
    procedure TabbedNotebook1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHelp: TFrmHelp;
  Voice: OleVariant;

implementation

{$R *.dfm}

procedure TFrmHelp.BtnBackClick(Sender: TObject);
begin
BtnBack.ModalResult:= mrClose;
end;

procedure TFrmHelp.FormActivate(Sender: TObject);
begin
{Instanciates the
object of a voice command which is integrated from windows voice recognition
by using SAPI voice-to-text }
if waveOutGetNumDevs <> 0 then
begin
Voice:= CreateOleObject('SAPI.SpVoice');
end;

end;

procedure TFrmHelp.FormCreate(Sender: TObject);
begin
                             {loads the help text into memo}
RedWelcome.Lines.LoadFromFile('HWelcome.txt');
RedLogging.Lines.LoadFromFile('HLogin.txt');
RedBids.Lines.LoadFromFile('HBids.txt');
RedErr.Lines.LoadFromFile('HError.txt');


end;

procedure TFrmHelp.TabbedNotebook1Click(Sender: TObject);
begin

if waveOutGetNumDevs <> 0 then {if there is an output sound, these will play}
    begin
    Voice.voice:= Voice.getVoices.Item(1);
if TabbedNotebook1.ActivePage = 'Welcome' then
begin
  Voice.speak(RedWelcome.Lines.Text);
end;
if TabbedNotebook1.ActivePage = 'Not loging in?' then
begin
Voice.speak(RedLogging.Lines.Text);
end;
if TabbedNotebook1.ActivePage='Bids not showing up?' then
begin
Voice.speak(RedBids.Lines.Text);
end;
if TabbedNotebook1.ActivePage='Error messages?' then
begin
Voice.speak(RedErr.Lines.Text);
end;
{Different tabs make the voice speak whats in the rich edits, to help those
who cannot see the text well among others}
    end;//VOICE CHECK
end;


end.
