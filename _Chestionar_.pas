unit _Chestionar_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Tabnotbk, StdCtrls, Buttons, ExtCtrls, Menus, ExtDlgs;

type
  Tchest = class(TForm)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Timer1: TTimer;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    BitBtn3: TBitBtn;
    Panel9: TPanel;
    MainMenu1: TMainMenu;
    a: TMenuItem;
    b1: TMenuItem;
    c1: TMenuItem;
    esc1: TMenuItem;
    time1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel10: TPanel;
    Label5: TLabel;
    Timer2: TTimer;
    Label6: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure aClick(Sender: TObject);
    function citeste (poz:integer):boolean;
    procedure bClick(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clickait (sender:tobject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure time1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    numar_intrebari:integer;
    { Public declarations }
  end;

var
  chest: Tchest;

implementation

uses _Main_, _About_, _Edit_, _Director_;

{$R *.DFM}

const i:integer=1;
      timp:longint=0;
      index:integer=1;
      totalcorecte:integer=0;
      maxintrebari:integer=1;
      afisare_timp:boolean=true;
      efect:integer=0;
      selectate:array [1..300] of boolean=(false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false
                                          ,false,false,false,false,false,false,false,false,false,false);

var raspunscorect:integer;
    t_ora,t_min,t_sec:string;
    
procedure Tchest.BitBtn2Click(Sender: TObject);
  begin
    numar_intrebari:=1;
    totalcorecte:=0;
    index:=1;
    i:=1;
    chest.enabled:=false;
    main.enabled:=true;
    close;
    main.Show;
  end;

procedure Tchest.BitBtn1Click(Sender: TObject);
  begin
    chest.enabled:=false;
    about.tag:=1;
    about.show;
  end;

function verifica:integer;
var f:textfile;
    i:integer;
    t:string;
begin
  //chdir (direct);
  if ioresult<>0 then MessageDlg ('Eroare!',mtWarning,[mbOk],0);
  assignfile (f,direct+'\'+f_intrebari);
  reset (f);
  i:=0;
  while not eof (f) do
    begin
      readln (f,t);
      inc (i);
    end;
  closefile (f);
  verifica:=i div 5;
end;

function Tchest.citeste (poz:integer):boolean;
  var
    f:textfile;
    i,nr:integer;
    k,k0,k11,k12,k21,k22,k31,k32:char;
    enunt,imagine,raspuns1,raspuns2,raspuns3:string;
  begin
    //chdir (direct);
    if ioresult<>0
      then
        MessageDlg ('Eroare!',mtWarning,[mbOk],0);
    assignfile (f,direct+'\'+f_intrebari);
    reset (f);
    citeste:=false;
    for i:=0 to pred (poz) do
      if not eof (f)
        then
          begin
             readln (f,nr,enunt);
             if afisare='da'
               then
                 chest.label1.Caption:='Intrebarea nr. '+inttostr (nr)
               else
                 chest.label1.caption:='Intrebarea nr. '+inttostr (numar_intrebari);
             {chest.Memo1.lines.Clear;
             chest.Memo1.lines.Append (enunt);}
             label5.Caption:=enunt;
             readln (f,k0,k,imagine);
             if (k0='\') and (k=' ')
               then
                 if imagine<>''
                   then
                     begin
                       if not fileexists (direct+'\'+d_director+'\'+imagine)
                         then
                           begin
                             imagine:=f_lipsa;
                             chest.image1.picture.LoadFromFile (direct+'\'+f_lipsa);
                           end
                         else
                           begin
                             chest.image1.picture.LoadFromFile (direct+'\'+d_director+'\'+imagine);
                             //chest.image1.picture.LoadFromFile (direct+'\'+imagine);
                           end;
                     end
                   else
                     begin
                       if not fileexists (direct+'\'+d_director+'\'+imagine)
                         then
                           imagine:=f_lipsa;
                       chest.image1.Picture.loadfromfile (direct+'\'+f_gri);
                     end;
             readln (f,k11,k12,raspuns1);
             if k11='/'
               then
                 begin
                   {memo2.visible:=true;
                   Memo2.lines.Clear;
                   Memo2.lines.Append (raspuns1);}
                   label2.visible:=true;
                   label2.caption:=raspuns1;
                   image2.visible:=false;
                   {bitbtn4.visible:=true;}
                 end
               else  //k11='\'
                 begin
                   {memo2.visible:=false;}
                   label2.visible:=false;
                   image2.visible:=true;
                   {bitbtn4.visible:=false;}
                   if not fileexists (direct+'\'+d_director+'\'+raspuns1)
                     then
                       raspuns1:=f_lipsa;
                   image2.Picture.LoadFromFile (direct+'\'+d_director+'\'+raspuns1);
                 end;
             if k12='*'
               then
                 raspunscorect:=1;
             readln (f,k21,k22,raspuns2);
             if k21='/'
               then
                 begin
                   {memo3.visible:=true;
                   Memo3.lines.Clear;
                   Memo3.lines.Append (raspuns2);}
                   label3.visible:=true;
                   label3.caption:=raspuns2;
                   image3.visible:=false;
                   {bitbtn5.visible:=true;}
                 end
               else  //k21='\'
                 begin
                   {memo3.visible:=false;}
                   label3.visible:=false;
                   image3.visible:=true;
                   {bitbtn5.visible:=false;}
                   if not fileexists (direct+'\'+d_director+'\'+raspuns2)
                     then
                       raspuns2:=f_lipsa;
                   image3.Picture.LoadFromFile (direct+'\'+d_director+'\'+raspuns2);
                 end;
             if k22='*'
               then
                 raspunscorect:=2;
             readln (f,k31,k32,raspuns3);
             if k31='/'
               then
                 begin
                   {memo4.visible:=true;
                   Memo4.lines.Clear;
                   Memo4.lines.Append (raspuns3);}
                   label4.visible:=true;
                   label4.caption:=raspuns3;
                   image4.visible:=false;
                   {bitbtn6.visible:=true;}
                 end
               else  //k31='\'
                 begin
                   {memo4.visible:=false;}
                   label4.visible:=false;
                   image4.visible:=true;
                   {bitbtn6.visible:=false;}
                   if not fileexists (direct+'\'+d_director+'\'+raspuns3)
                     then
                       raspuns3:=f_lipsa;
                   image4.Picture.LoadFromFile (direct+'\'+d_director+'\'+raspuns3);
                 end;
             if k32='*'
               then
                 raspunscorect:=3;
             citeste:=true;
        end
      else
        citeste:=false;
    closefile (f);
end;

procedure tchest.clickait (sender:tobject);
  begin
    randomize;
    repeat
      index:=succ (random (pred (maxintrebari)));
      //showmessage (inttostr (index));
    until selectate [index]=false;
    selectate [index]:=true;
    inc (i);
    inc (numar_intrebari);
    citeste (index);
    {if afisare='da'
      then
        chest.label1.Caption:='Intrebarea nr. '+inttostr (nr)
      else
        chest.label2.caption:='Intrebarea nr. '+inttostr (numar_intrebari);}
    panel2.caption:=' Intrebari corecte: '+inttostr (totalcorecte)+' din '+inttostr (pred (i))+' ('+inttostr (nr)+')';
    panel9.caption:=' Pana acum ai obtinut nota: '+floattostr (totalcorecte*9/pred (i)+1);
    if i>nr     //90
      then
        begin
          timer1.enabled:=false;
          showmessage (main.combobox1.items.Strings [main.ComboBox1.Itemindex]+' ai raspuns corect la '+inttostr (totalcorecte)+' intrebari din '+inttostr (pred (i))+'.'+#13#13+'Ai obtinut nota: '+floattostr (totalcorecte*9/pred (i)+1)+#13#13+'Timpul necesar rezolvarii chestionarului: '+t_ora+':'+t_min+':'+t_sec);
          BitBtn2Click (sender);
        end;
  end;

procedure Tchest.aClick(Sender: TObject);
  begin
    if raspunscorect=1 then inc (totalcorecte);
    clickait (sender);
  end;

procedure Tchest.bClick(Sender: TObject);
  begin
    if raspunscorect=2 then inc (totalcorecte);
    clickait (sender);
  end;

procedure Tchest.cClick(Sender: TObject);
  begin
    if raspunscorect=3 then inc (totalcorecte);
    clickait (sender);
  end;

procedure Tchest.FormShow(Sender: TObject);
  var
    i:integer;
  begin
    if not fileexists (direct+'\'+f_gri)
      then
        image1.picture.savetofile (direct+'\'+f_gri);
    numar_intrebari:=1;
    timp:=0;
    timer1.enabled:=true;
    maxintrebari:=verifica;
    for i:=1 to 90 do
      selectate [i]:=false;
    randomize;
    index:=succ (random (maxintrebari));
    citeste (index);
    bitbtn1.Glyph.LoadFromFile (direct+'\'+f_info);
    bitbtn2.Glyph.LoadFromFile (direct+'\'+f_renunt);
    bitbtn3.Glyph.LoadFromFile (direct+'\'+f_nou);
    panel2.caption:=' Intrebari corecte: 0 din 0 ('+inttostr (nr)+')'
  end;

procedure Tchest.Timer1Timer(Sender: TObject);
  begin
    inc (timp);
    t_ora:=inttostr (timp div 3600);
    t_min:=inttostr ((timp mod 3600) div 60);
    t_sec:=inttostr ((timp mod 3600) mod 60);
    if length (t_ora)<2 then t_ora:='0'+t_ora;
    if length (t_min)<2 then t_min:='0'+t_min;
    if length (t_sec)<2 then t_sec:='0'+t_sec;
    if afisare_timp
      then
        panel3.caption:=' Timp trecut: '+t_ora+':'+t_min+':'+t_sec
      else
        panel3.caption:=' Timp trecut: '+inttostr (timp)+' secunde';
end;

procedure Tchest.BitBtn3Click(Sender: TObject);
  begin
    if InputBox ('Parola','Parola pentru activarea modului editare:','')=parola
      then
        begin
          chest.hide;
          chest.enabled:=false;
          editor.enabled:=true;
          editor.show;
        end;
  end;

procedure Tchest.FormResize(Sender: TObject);
  begin
    if height<480
      then
        height:=480;
    if width<640
      then
        width:=640;
    if (width/height<0.7) or (width/height>0.8)
      then
        width:=round(height*640/480);
    groupbox2.width:=width-24;
    groupbox2.height:=height-64;
    panel6.height:=(groupbox2.height-48) div 2;
    panel6.width:=(groupbox2.width-64) div 3;
    panel6.left:=groupbox2.width-panel6.width-16;
    panel4.height:=panel6.height;
    panel4.width:=panel6.width;
    panel4.left:=groupbox2.width-panel4.width-16;
    panel4.top:=groupbox2.height-panel4.height-15;
    panel5.top:=panel4.top;
    panel5.height:=panel6.height;
    panel5.width:=panel6.width;
    panel7.top:=panel4.top;
    panel7.height:=panel6.height;
    panel7.width:=panel6.width;
    panel7.left:=(groupbox2.width-panel7.width) div 2;
    image1.width:=panel5.width-4;
    image1.height:=panel5.height-4;
    image2.width:=panel5.width-4;
    image2.height:=panel5.height-4;
    image3.width:=panel5.width-4;
    image3.height:=panel5.height-4;
    image4.width:=panel5.width-4;
    image4.height:=panel5.height-4;
    {bitbtn4.width:=panel5.width-4;
    bitbtn5.width:=panel5.width-4;
    bitbtn6.width:=panel5.width-4;}
    {memo1.width:=groupbox2.width-panel6.width-48;
    memo1.height:=groupbox2.height-panel5.height-102;}
    panel10.width:=groupbox2.width-panel6.width-48;
    panel10.height:=groupbox2.height-panel5.height-102-10;
    {panel8.width:=memo1.width;}
    bitbtn1.width:=(panel8.width) div 3-2;
    bitbtn2.width:=bitbtn1.width;
    bitbtn3.width:=bitbtn1.width;
    bitbtn2.left:=panel8.width-bitbtn1.width-2;
    bitbtn3.left:=(panel8.width-bitbtn3.width) div 2;
    {memo2.width:=panel5.width-4;
    memo2.height:=panel5.height-4-bitbtn4.height;
    memo2.top:=2+bitbtn4.height;}
    {memo3.width:=panel5.width-4;
    memo3.height:=panel5.height-4-bitbtn4.height;
    memo3.top:=2+bitbtn4.height;}
    {memo4.width:=panel5.width-4;
    memo4.height:=panel5.height-4-bitbtn4.height;
    memo4.top:=2+bitbtn4.height;}
    panel9.width:=panel1.width-panel2.width-panel3.width-4;
    label5.width:=panel10.width-14;
    label5.height:=panel10.height-14-16;
    label2.width:=panel5.width-14;
    label2.height:=panel5.height-14;
    label3.width:=panel7.width-14;
    label3.height:=panel7.height-14;
    label4.width:=panel4.width-14;
    label4.height:=panel4.height-14;
    label6.top:=panel5.top-14;
  end;

procedure Tchest.time1Click(Sender: TObject);
  begin
    afisare_timp:=not afisare_timp;
  end;

procedure Tchest.Timer2Timer(Sender: TObject);
  begin
    efect:=(efect+1) mod 3;//efect=0..2
    if efect=0
      then
        begin
          panel5.bevelouter:=bvLowered;
          panel7.bevelouter:=bvraised;
          panel4.bevelouter:=bvraised;
        end;
    if efect=1
      then
        begin
          panel5.bevelouter:=bvraised;
          panel7.bevelouter:=bvLowered;
          panel4.bevelouter:=bvraised;
        end;
    if efect=2
      then
        begin
          panel5.bevelouter:=bvraised;
          panel7.bevelouter:=bvraised;
          panel4.bevelouter:=bvLowered;
        end;
  end;

end.
