unit _Edit_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, ExtDlgs, Menus;

type
  Teditor = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    esc1: TMenuItem;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Deschide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editor: Teditor;

implementation

uses _Chestionar_,_Main_, _About_, _Image_;

{$R *.DFM}

//const
//  mouse_miscat:boolean=false;
//  xpos:integer=0;
//  ypos:integer=0;

procedure Teditor.BitBtn1Click(Sender: TObject);
  begin
    if opendialog1.execute
      then
        begin
          edit1.text:=opendialog1.filename;
          bitbtn2.Enabled:=true;
          deschide(sender);
          bitbtn1.visible:=false;
          bitbtn7.visible:=true;
          //edit2.text:=d_director;
        end;
  end;

procedure Teditor.Deschide(Sender: TObject);
var f:textfile;
    ok:boolean;
    i,j,n:integer;
    intr,imag:string;
    ras:array [1..3] of string;
    k,kk:char;
begin
//ok:=true;
  //chdir (direct);
  if ioresult<>0
    then
      MessageDlg ('Eroare!',mtWarning,[mbOk],0);
  assignfile (f,edit1.text);
  reset (f);
  i:=0;
  stringgrid1.rowcount:=2;
  while not eof (f) do
    begin
      inc (i);
      stringgrid1.rowcount:=succ(i);
      stringgrid1.Cells [0,i]:=inttostr (i);
      readln (f,n,intr);
      stringgrid1.cells [1,i]:=inttostr (n);
      stringgrid1.cells [2,i]:=intr;
      readln (f,k,kk,imag);
      if trim(imag)=''
        then
          stringgrid1.cells [3,i]:=''
        else stringgrid1.cells [3,i]:=imag;
          for j:=1 to 3 do
            begin
              readln (f,k,kk,ras [j]);
//if k='\' then
              if kk='*'
                then
                  stringgrid1.Cells [7,i]:=inttostr (j);
              stringgrid1.cells [3+j,i]:=ras [j];
            end;
    end;
  closefile (f);
//showmessage (inttostr(i));
  panel3.caption:=' Baza de date este deschisa - Intrebari: '+inttostr (i);
//if ok then showmessage ('ok');
end;

procedure Teditor.FormShow(Sender: TObject);
  var
    i:integer;
  begin
    if fileexists (direct+'\'+f_deschidere)
      then
         bitbtn1.Glyph.LoadFromFile (direct+'\'+f_deschidere);
    if fileexists (direct+'\'+f_inchidere)
      then
         bitbtn7.Glyph.LoadFromFile (direct+'\'+f_inchidere);
    if fileexists (direct+'\'+f_salvare)
      then
         bitbtn2.Glyph.LoadFromFile (direct+'\'+f_salvare);
    if fileexists (direct+'\'+f_info)
      then
         bitbtn3.Glyph.LoadFromFile (direct+'\'+f_info);
    if fileexists (direct+'\'+f_director)
      then
         bitbtn5.Glyph.LoadFromFile (direct+'\'+f_director);
    if fileexists (direct+'\'+f_renunt)
      then
         bitbtn4.Glyph.LoadFromFile (direct+'\'+f_renunt);
    edit2.text:=d_director;
    stringgrid1.ColWidths [0]:=25;
    for i:=1 to 500 do
      stringgrid1.Cells [0,i]:=inttostr (i);
    stringgrid1.ColWidths [1]:=25;
    stringgrid1.Cells [1,0]:='Nr.';
    stringgrid1.ColWidths [2]:=200;
    stringgrid1.Cells [2,0]:='Intrebare';
    stringgrid1.ColWidths [3]:=80;
    stringgrid1.Cells [3,0]:='Imagine';
    for i:=4 to 6 do
      stringgrid1.ColWidths [i]:=65;
    stringgrid1.Cells [4,0]:='Raspuns 1';
    stringgrid1.Cells [5,0]:='Raspuns 2';
    stringgrid1.Cells [6,0]:='Raspuns 3';
    stringgrid1.ColWidths [7]:=40;
    stringgrid1.Cells [7,0]:='Corect';
    edit1.text:=direct+'\'+f_intrebari;
    bitbtn2.Enabled:=true;
    deschide(sender);
    bitbtn1.visible:=false;
    bitbtn7.visible:=true;
    if stringgrid1.row in [3..6]
      then
        figura.show
      else
        figura.hide;
  end;

procedure Teditor.FormResize(Sender: TObject);
  begin
    if width<640
      then
        width:=640;
    if height<480
      then
        height:=480;
    stringgrid1.width:=width-40;
    stringgrid1.height:=height-183;
    panel1.width:=width-40;
    bitbtn2.left:=width-160;
    edit1.width:=width-282;
    panel4.top:=height-88;
    panel4.width:=panel1.width;
    bitbtn4.left:=bitbtn2.left;
    edit2.width:=width-400;
  end;

procedure Teditor.BitBtn4Click(Sender: TObject);
  begin
    figura.hide;
    editor.enabled:=false;
    editor.Close;
    //chest.enabled:=true;
    //chest.show;
    main.enabled:=true;
    main.show;
  end;

procedure Teditor.BitBtn2Click(Sender: TObject);
  var
    i:integer;
    c1,c2:char;
  function add4space(s:string):string;
    begin
      while length (s)<4 do
        s:=' '+s;
      add4space:=s;
    end;
  begin
   if savedialog1.Execute
     then
       begin
         listbox1.Clear;
         for i:=1 to pred (stringgrid1.RowCount) do
           begin
             listbox1.items.Add(add4space(stringgrid1.Cells[1,i])+stringgrid1.Cells[2,i]);
             listbox1.items.Add('\ '+stringgrid1.Cells[3,i]);
             c1:='/';
             if fileexists(direct+'\'+d_director+'\'+stringgrid1.Cells [4,i])
               then
                 c1:='\';
             c2:=' ';
             if stringgrid1.Cells [7,i]='1'
               then
                 c2:='*';
             listbox1.items.Add(c1+c2+stringgrid1.Cells[4,i]);
             c1:='/';
             if fileexists(direct+'\'+d_director+'\'+stringgrid1.Cells [5,i])
               then
                 c1:='\';
             c2:=' ';
             if stringgrid1.Cells [7,i]='2'
               then
                 c2:='*';
             listbox1.items.Add(c1+c2+stringgrid1.Cells[5,i]);
             c1:='/';
             if fileexists(direct+'\'+d_director+'\'+stringgrid1.Cells [6,i])
               then
                 c1:='\';
             c2:=' ';
             if stringgrid1.Cells [7,i]='3'
               then
                 c2:='*';
             listbox1.items.Add(c1+c2+stringgrid1.Cells[6,i]);
           end;
         listbox1.items.savetofile (savedialog1.FileName);
       end;
  end;

procedure Teditor.BitBtn7Click(Sender: TObject);
  var
    i,j:integer;
  begin
    bitbtn1.visible:=true;
    bitbtn7.visible:=false;
    bitbtn2.enabled:=false;
    for j:=1 to stringgrid1.rowcount do
      for i:=1 to 7 do
        stringgrid1.cells[i,j]:='';
    stringgrid1.rowcount:=2;
    edit1.text:='';
    panel3.Caption :=' Baza de date este inchisa - Intrebari: 0';
    //edit2.text:='';
  end;

procedure Teditor.BitBtn3Click(Sender: TObject);
  begin
    figura.formstyle:=fsnormal;
    editor.enabled:=false;
    about.tag:=2;
    about.show;
  end;

procedure Teditor.StringGrid1Click(Sender: TObject);
  begin
    if (stringgrid1.col in [3..6])
      then
        figura.Show
      else
        figura.hide;
    if fileexists (direct+'\'+d_director+'\'+stringgrid1.Cells [stringgrid1.col,stringgrid1.row])
      then
        figura.image1.Picture.LoadFromFile (direct+'\'+d_director+'\'+stringgrid1.Cells [stringgrid1.col,stringgrid1.row])
      else
        figura.image1.picture.loadfromfile (direct+'\'+f_gri);
  end;

procedure Teditor.BitBtn5Click(Sender: TObject);
  var
    s1,s2:string;
  begin
    s1:=d_director;
    s2:=inputbox ('Director imagini','Introdu numele directorului care contine imaginile',d_director);
    if (s2<>'') and (s2<>d_director)
      then
        begin
          edit2.text:=s2;
          d_director:=s2;
          (*     -----------
          //copie folderul s1 in s2
          if messagedlg ('S-a realizat  copierea imaginilor.'+chr(13)+
                         'Procedez la stergerea directorului initial?',mtconfirmation,mbyesno,0)=mbyes
            then
              begin
                //sterge folderul s1
              end;
               -----------     *)
        end;
  end;

procedure Teditor.StringGrid1SelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
  var
    i:integer;
    vid:boolean;
  begin
    if stringgrid1.row=stringgrid1.rowcount-1 then
      begin
        vid:=true;
        for i:=1 to stringgrid1.ColCount-1 do
          begin
            //showmessage (inttostr (i)+'...'+inttostr (stringgrid1.row));
            if stringgrid1.cells [i,stringgrid1.row]<>''
              then
                vid:=false;
          end;
        if not vid
          then
            begin
              stringgrid1.rowcount:=stringgrid1.rowcount+1;
              bitbtn2.enabled:=true;
              bitbtn1.visible:=true;
              bitbtn7.Visible:=true;
              vid:=true;
            end;
      end;
  end;


end.
