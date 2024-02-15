unit _Director_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, ExtCtrls;

type
  Tdirector = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  director: Tdirector;

implementation

uses _Edit_;

{$R *.DFM}

procedure Tdirector.BitBtn2Click(Sender: TObject);
  begin
    director.Hide;
    //editor.enabled:=true;
  end;

procedure Tdirector.BitBtn1Click(Sender: TObject);
  begin
    editor.edit2.text:=directorylistbox1.Directory;
    BitBtn2Click(sender);
  end;

procedure Tdirector.DriveComboBox1Change(Sender: TObject);
  begin
    showmessage (directorylistbox1.Directory);
  end;

end.
