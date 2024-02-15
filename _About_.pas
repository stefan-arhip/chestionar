unit _About_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tabout = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    procedure FormClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about: Tabout;

implementation

uses _chestionar_, _Edit_, _Image_;

{$R *.DFM}

procedure Tabout.FormClick(Sender: TObject);
  begin
    about.close;
    case tag of
      1:
        chest.enabled:=true;
      2:
        editor.enabled:=true;
        //Figura.FormStyle:=FsStayOnTop;
    end;
  end;

procedure Tabout.Timer1Timer(Sender: TObject);
  const
    px:integer=3;
    py:integer=1;
  begin
    image1.left:=image1.left+px;
    if (image1.left+image1.width+px>panel1.width-2) or (image1.left+px<2)
      then
        px:=-px;
    image1.top:=image1.top+py;
    if (image1.top+image1.height+py>panel1.height-2) or (image1.top+py<2)
      then
        py:=-py;
end;

procedure Tabout.Timer2Timer(Sender: TObject);
  const
    px:integer=1;
    py:integer=3;
  begin
    label1.left:=label1.left+px;
    if (label1.left+label1.width+px>panel1.width-2) or (label1.left+px<2)
      then
        px:=-px;
    label1.top:=label1.top+py;
    if (label1.top+label1.height+py>panel1.height-2) or (label1.top+py<2)
      then
        py:=-py;
  end;

end.
