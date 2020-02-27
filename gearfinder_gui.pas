unit gearfinder_gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Spin, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DesiredRatio: TFloatSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    LowestGear: TSpinEdit;
    HighestGear: TSpinEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  goal,delta,ratio, best_delta,error : double;
  best_a,best_b,best_c,best_d : integer;
  a,b,c,d : integer;
  description : string;
begin
  goal := DesiredRatio.Value;
  best_delta := 1000.0;
  best_a := 20;
  best_b := 21;
  best_c := 99;
  best_d := 100;
  for a := lowestgear.Value to highestgear.value do
    for b := lowestgear.Value to highestgear.value do
      for c := lowestgear.value to highestgear.value do
        for d := lowestgear.value to highestgear.value do
          if ((a <> b) AND (a <> c) AND (a <> d) AND (b <> c) AND (b <> d) AND (c <> d)) then
      begin
        ratio :=  (double(a) / double(b)) * (double(c) / double(d));
        delta := ratio-goal;
        if abs(delta) < abs(best_delta) then
        begin
          best_delta := delta;
          best_a := a;
          best_b := b;
          best_c := c;
          best_d := d;

          description := 'Better ratio found, delta = ' + delta.ToString(ffFixed,1,8)+ ' ---  '+a.ToString + '/' + b.ToString + ' ' + c.ToString + '/' + d.ToString;
          memo1.Append(description);
        end;

      end;
  memo1.Append('Done!');
  ratio := (double(best_a)/double(best_b)) * (double(best_c)/double(best_d));
  delta := (ratio-goal);
  error := delta/goal;
  description := 'Summary: The lead is ' + error.ToString(ffFixed,1,10) + ' inches/inch';
  memo1.Append(description);
  error := error * 1000000.0;
  description := '  or  ' +  error.ToString(ffFixed,1,5) + ' parts per Million';
  memo1.Append(description);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DesiredRatio.Value:= Random;
end;

end.

