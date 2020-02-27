unit gearfinder_gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Spin, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    FloatSpinEdit1: TFloatSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    LowestGear: TSpinEdit;
    HighestGear: TSpinEdit;
    Memo1: TMemo;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

