program Chestionar;

uses
  Forms,
  _Chestionar_ in '_Chestionar_.pas' {chest},
  _Main_ in '_Main_.pas' {main},
  _About_ in '_About_.pas' {about},
  _Edit_ in '_Edit_.pas' {editor},
  _Image_ in '_Image_.pas' {figura};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tchest, chest);
  Application.CreateForm(Tabout, about);
  Application.CreateForm(Teditor, editor);
  Application.CreateForm(Tfigura, figura);
  Application.Run;
end.
