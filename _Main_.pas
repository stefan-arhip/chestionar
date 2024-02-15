unit _Main_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus;

type
  Tmain = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    ListBox1: TListBox;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    esc1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  afisare:string='nu';

var
  main: Tmain;
  nr:integer;
  direct,f_ani,f_specializare,f_nume,f_main,f_intrebari,f_gri,f_lipsa,f_accept,f_renunt,f_info,f_nou,f_deschidere,f_inchidere,f_salvare,f_director,d_director,parola:string;

implementation

uses _Chestionar_, _Director_;

{$R *.DFM}

procedure Tmain.BitBtn2Click(Sender: TObject);
  begin
   close;
  end;

procedure Tmain.BitBtn1Click(Sender: TObject);
  begin
    main.hide;
    main.enabled:=false;
    chest.show;
    chest.enabled:=true;
  end;

procedure Tmain.FormShow(Sender: TObject);
  begin
    if not fileexists (direct+'\'+f_lipsa)
      then
        image1.picture.savetofile (direct+'\'+f_lipsa);
    combobox3.Items.LoadFromFile (direct+'\'+f_ani);
    combobox2.items.LoadFromFile (direct+'\'+f_specializare);
    combobox1.items.loadfromfile (direct+'\'+f_nume);
    if not fileexists (direct+'\'+f_main)
      then
        f_main:=f_lipsa;
    image1.picture.loadfromfile (direct+'\'+f_main);
    if fileexists (direct+'\'+f_accept)
      then
         bitbtn1.Glyph.LoadFromFile (direct+'\'+f_accept);
    bitbtn1.enabled:=false;
    if fileexists (direct+'\'+f_renunt)
      then
    bitbtn2.Glyph.LoadFromFile (direct+'\'+f_renunt);
  end;

procedure Tmain.FormCreate(Sender: TObject);
var f:textfile;
    t:string;
    x:integer;
begin
  getdir(0,direct);
  //showmessage (director);
  chdir (direct);
  if ioresult<>0
    then
      MessageDlg ('Eroare!',mtWarning,[mbOk],0);
  if not fileexists (direct+'\'+'chest.cfg')
    then
      //begin
      //  x:=messagedlg('Fisierul de configurare "chest.cfg" nu exista.'+chr (13)+
      //                'Selectati fisierul de configurare.'+chr (13)+chr (13)+
      //                'Daca nu selectati nimic, acesta va fi creat de program.',mterror,[mbyes,mbno,mbcancel],0);
      //  case x of
      //    mryes:
      //      begin
      //        showmessage ('cauta "chest.cfg"');
      //      end;
      //    mrno:
      //      begin
              listbox1.items.savetofile (direct+'\'+'chest.cfg');
              assignfile (f,direct+'\'+'chest.cfg');
              reset (f);
              readln (f,t);
              readln (f,nr);
              readln (f,t);
              readln (f,afisare);
              readln (f,t);
              readln (f,f_ani);
              readln (f,t);
              readln (f,f_specializare);
              readln (f,t);
              readln (f,f_nume);
              readln (f,t);
              readln (f,f_main);
              readln (f,t);
              readln (f,f_intrebari);
              readln (f,t);
              readln (f,f_gri);
              readln (f,t);
              readln (f,f_lipsa);
              readln (f,t);
              readln (f,f_accept);
              readln (f,t);
              readln (f,f_renunt);
              readln (f,t);
              readln (f,f_info);
              readln (f,t);
              readln (f,f_nou);
              readln (f,t);
              readln (f,f_deschidere);
              readln (f,t);
              readln (f,f_inchidere);
              readln (f,t);
              readln (f,f_salvare);
              readln (f,t);
              readln (f,f_director);
              readln (f,t);
              readln (f,d_director);
              readln (f,t);
              readln (f,parola);
              closefile (f);
      //      end;
      //    end;
      //end;

  end;

procedure Tmain.ComboBox1Click(Sender: TObject);
  begin
    if combobox1.ItemIndex<>-1
      then
        bitbtn1.enabled:=true;
  end;

end.
