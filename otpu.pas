unit otpu;

{$mode objfpc}{$H+}

interface

uses
  actions,Classes, about, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, PairSplitter, ComCtrls, ActnList;

type

  { Totp_form }

  Totp_form = class(TForm)
    Action1: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    file_menu: TMenuItem;
    edit_menu: TMenuItem;
    input_key: TMemo;
    LWarning: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    menu_about: TMenuItem;
    menu_open: TMenuItem;
    menu_quit: TMenuItem;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    tab_key: TTabSheet;
    tab_encrypt: TTabSheet;
    procedure Action1Execute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure file_menuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure input_cipherChange(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure menu_aboutClick(Sender: TObject);
    procedure menu_openClick(Sender: TObject);
    procedure OpenCiphertext(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);

    procedure tab_encryptShow(Sender: TObject);
    procedure tab_keyEnter(Sender: TObject);
    procedure tab_keyShow(Sender: TObject);
    procedure text_sourceChange(Sender: TObject);
    procedure menu_quitClick(Sender: TObject);
    //procedure WriteToStatusBar(s:string);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  otp_form: Totp_form;
  text_input_hint_seen:boolean=False;

implementation

{$R *.lfm}

//procedure WriteToStatusBar(s:string);
//begin
//    StatusBar1.SimpleText:=s;
//end;

{ Totp_form }

procedure Totp_form.file_menuClick(Sender: TObject);
begin

end;

procedure Totp_form.Action1Execute(Sender: TObject);
begin

end;

procedure Totp_form.Button1Click(Sender: TObject);
begin
  Memo2.Text:=actions.Decipher(Memo1.Text,input_key.Text, false)
end;

procedure Totp_form.Button2Click(Sender: TObject);
begin
  Memo2.Text:=actions.Decipher(Memo1.Text,input_key.Text, true)
end;


procedure Totp_form.FormCreate(Sender: TObject);
begin

end;

procedure Totp_form.input_cipherChange(Sender: TObject);
begin

end;

procedure Totp_form.Memo1Change(Sender: TObject);
begin

end;

procedure Totp_form.Memo1Enter(Sender: TObject);
begin
     if not text_input_hint_seen then
     begin
     text_input_hint_seen:=True;
     Memo1.Text:='';
     end;
end;

procedure Totp_form.menu_aboutClick(Sender: TObject);
begin
  about.About_form.ShowModal;
end;

procedure Totp_form.menu_openClick(Sender: TObject);
var
  fn:string;
  tf: TextFile;
  fc:ansistring='';
  fct:ansistring;
begin
  if OpenDialog1.Execute then
     begin
     text_input_hint_seen:=True;
     fn := OpenDialog1.Filename;
     try
       AssignFile(tf, fn);
       reset(tf);
       while not eof(tf) do
         begin
           Readln(tf,fct);  //WHATTHEFUCK? Read doesn't work here
           fc:= fc  + fct + sLineBreak ;
         end;
       Memo1.Text:=fc;
     finally
       CloseFile(tf)
     end;

     end;
end;

procedure Totp_form.OpenCiphertext(Sender: TObject);
begin

end;

procedure Totp_form.PageControl1Enter(Sender: TObject);
begin

end;



procedure Totp_form.tab_encryptShow(Sender: TObject);
begin
  StatusBar1.SimpleText:='Enter encoded text to encrypt or decrypt';
end;

procedure Totp_form.tab_keyEnter(Sender: TObject);
begin

end;

procedure Totp_form.tab_keyShow(Sender: TObject);
begin
  StatusBar1.SimpleText:='Enter your one time key here';
end;

procedure Totp_form.text_sourceChange(Sender: TObject);
begin

end;

procedure Totp_form.menu_quitClick(Sender: TObject);
begin
     Halt(0)
end;

end.

