unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TAbout_form }

  TAbout_form = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  About_form: TAbout_form;

implementation

{$R *.lfm}

{ TAbout_form }

procedure TAbout_form.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TAbout_form.Label1Click(Sender: TObject);
begin

end;

end.

