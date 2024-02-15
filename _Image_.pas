unit _Image_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ExtDlgs;

type
  Tfigura = class(TForm)
    Imagine: TPanel;
    Image1: TImage;
    BitBtn5: TBitBtn;
    MainMenu1: TMainMenu;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenPictureDialog2: TOpenPictureDialog;
    OpenPictureDialog3: TOpenPictureDialog;
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  figura: Tfigura;

implementation

uses _Edit_, _Main_;

{$R *.DFM}

procedure Tfigura.BitBtn5Click(Sender: TObject);
  function get_short_name (s:string):string;
    var s1:string;
        i:integer;
    begin
      s1:='';
      i:=length (s);
      for i:=length (s) downto 1 do
        begin
          if s [i]='\' then
            break;
          s1:=s [i]+s1;
        end;
        get_short_name:=s1;
    end;
  begin
    if openpicturedialog1.execute
      then
        begin
          //scrie in stringgrid1 openpicturedialog1.execute-director!!!!
          //imagine.visible:=false;
          image1.Picture.LoadFromFile(openpicturedialog1.filename);
          image1.picture.SaveToFile(direct+'\'+d_director+'\'+get_short_name (openpicturedialog1.filename));
          editor.StringGrid1.Cells [editor.stringgrid1.col,editor.stringgrid1.row]:=get_short_name (openpicturedialog1.filename);
          image1.Picture.LoadFromFile(editor.StringGrid1.Cells [editor.stringgrid1.col,editor.stringgrid1.row]);
        end;
  end;

end.
